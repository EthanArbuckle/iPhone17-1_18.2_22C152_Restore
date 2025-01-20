@interface MFRecursiveLock
+ (void)initialize;
- (BOOL)lockBeforeDate:(id)a3;
- (BOOL)tryLock;
- (MFRecursiveLock)init;
- (MFRecursiveLock)initWithName:(id)a3 andDelegate:(id)a4;
- (id)description;
- (void)dealloc;
- (void)lock;
- (void)unlock;
@end

@implementation MFRecursiveLock

- (void)unlock
{
  _mfUnregisterLockOnThisThread(self);
  v3.receiver = self;
  v3.super_class = (Class)MFRecursiveLock;
  [(MFRecursiveLock *)&v3 unlock];
}

- (void)lock
{
  id delegate = self->_delegate;
  if (delegate) {
    objc_msgSend(delegate, "_mf_checkToAllowLock:", self);
  }
  v4.receiver = self;
  v4.super_class = (Class)MFRecursiveLock;
  [(MFRecursiveLock *)&v4 lock];
  _mfRegisterLockOnThisThread(self);
}

+ (void)initialize
{
}

- (MFRecursiveLock)initWithName:(id)a3 andDelegate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MFRecursiveLock;
  v6 = [(MFRecursiveLock *)&v8 init];
  if (v6)
  {
    v6->_name = (NSString *)[a3 copy];
    v6->_id delegate = a4;
  }
  return v6;
}

- (MFRecursiveLock)init
{
}

- (BOOL)tryLock
{
  id delegate = self->_delegate;
  if (delegate) {
    objc_msgSend(delegate, "_mf_checkToAllowLock:", self);
  }
  v6.receiver = self;
  v6.super_class = (Class)MFRecursiveLock;
  BOOL v4 = [(MFRecursiveLock *)&v6 tryLock];
  if (v4) {
    _mfRegisterLockOnThisThread(self);
  }
  return v4;
}

- (BOOL)lockBeforeDate:(id)a3
{
  id delegate = self->_delegate;
  if (delegate) {
    objc_msgSend(delegate, "_mf_checkToAllowLock:", self);
  }
  v8.receiver = self;
  v8.super_class = (Class)MFRecursiveLock;
  BOOL v6 = [(MFRecursiveLock *)&v8 lockBeforeDate:a3];
  if (v6) {
    _mfRegisterLockOnThisThread(self);
  }
  return v6;
}

- (id)description
{
  objc_super v3 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)MFRecursiveLock;
  id v4 = [(MFRecursiveLock *)&v6 description];
  return (id)[v3 stringWithFormat:@"%@ %@ Delegate: <%@: %p>", v4, self->_name, objc_opt_class(), self->_delegate];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFRecursiveLock;
  [(MFRecursiveLock *)&v3 dealloc];
}

@end