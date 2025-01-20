@interface MFConditionLock
+ (void)initialize;
- (BOOL)lockBeforeDate:(id)a3;
- (BOOL)lockWhenCondition:(int64_t)a3 beforeDate:(id)a4;
- (MFConditionLock)init;
- (MFConditionLock)initWithName:(id)a3 andDelegate:(id)a4;
- (MFConditionLock)initWithName:(id)a3 condition:(int64_t)a4 andDelegate:(id)a5;
- (id)description;
- (void)dealloc;
- (void)unlock;
- (void)unlockWithCondition:(int64_t)a3;
@end

@implementation MFConditionLock

- (BOOL)lockBeforeDate:(id)a3
{
  id delegate = self->_delegate;
  if (delegate) {
    objc_msgSend(delegate, "_mf_checkToAllowLock:", self);
  }
  v8.receiver = self;
  v8.super_class = (Class)MFConditionLock;
  BOOL v6 = [(NSConditionLock *)&v8 lockBeforeDate:a3];
  if (v6) {
    _mfRegisterLockOnThisThread(self);
  }
  return v6;
}

- (void)unlockWithCondition:(int64_t)a3
{
  _mfUnregisterLockOnThisThread(self);
  v5.receiver = self;
  v5.super_class = (Class)MFConditionLock;
  [(NSConditionLock *)&v5 unlockWithCondition:a3];
}

- (BOOL)lockWhenCondition:(int64_t)a3 beforeDate:(id)a4
{
  id delegate = self->_delegate;
  if (delegate) {
    objc_msgSend(delegate, "_mf_checkToAllowLock:", self);
  }
  v10.receiver = self;
  v10.super_class = (Class)MFConditionLock;
  BOOL v8 = [(NSConditionLock *)&v10 lockWhenCondition:a3 beforeDate:a4];
  if (v8) {
    _mfRegisterLockOnThisThread(self);
  }
  return v8;
}

- (MFConditionLock)initWithName:(id)a3 condition:(int64_t)a4 andDelegate:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MFConditionLock;
  v7 = [(NSConditionLock *)&v9 initWithCondition:a4];
  if (v7)
  {
    v7->_name = (NSString *)[a3 copy];
    v7->_id delegate = a5;
  }
  return v7;
}

+ (void)initialize
{
}

- (void)unlock
{
  _mfUnregisterLockOnThisThread(self);
  v3.receiver = self;
  v3.super_class = (Class)MFConditionLock;
  [(NSConditionLock *)&v3 unlock];
}

- (MFConditionLock)init
{
}

- (MFConditionLock)initWithName:(id)a3 andDelegate:(id)a4
{
  return [(MFConditionLock *)self initWithName:a3 condition:0 andDelegate:a4];
}

- (id)description
{
  objc_super v3 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)MFConditionLock;
  id v4 = [(NSConditionLock *)&v6 description];
  return (id)[v3 stringWithFormat:@"%@ %@ Delegate: <%@: %p>", v4, self->_name, objc_opt_class(), self->_delegate];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFConditionLock;
  [(NSConditionLock *)&v3 dealloc];
}

@end