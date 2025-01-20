@interface NSUndoManagerProxy
- (BOOL)_tryRetain;
- (BOOL)isKindOfClass:(Class)a3;
- (NSUndoManagerProxy)initWithManager:(id)a3;
- (NSUndoManagerProxy)retain;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)release;
- (void)setTargetClass:(Class)a3;
- (void)superRelease;
@end

@implementation NSUndoManagerProxy

- (NSUndoManagerProxy)initWithManager:(id)a3
{
  self->_manager = (NSUndoManager *)a3;
  return self;
}

- (void)setTargetClass:(Class)a3
{
  self->_targetClass = a3;
}

- (NSUndoManagerProxy)retain
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = self->_manager;
  v5.receiver = self;
  v5.super_class = (Class)NSUndoManagerProxy;
  return [(NSProxy *)&v5 retain];
}

- (BOOL)_tryRetain
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSUndoManagerProxy;
  BOOL v3 = [(NSProxy *)&v6 _tryRetain];
  if (v3) {
    v4 = self->_manager;
  }
  return v3;
}

- (void)release
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSUndoManagerProxy;
  [(NSProxy *)&v3 release];
}

- (void)superRelease
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)NSUndoManagerProxy;
  [(NSProxy *)&v2 release];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return [(NSUndoManager *)self->_manager _methodSignatureForTargetSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
}

- (BOOL)isKindOfClass:(Class)a3
{
  targetClass = self->_targetClass;
  BOOL v4 = targetClass != 0;
  if (targetClass != a3 && targetClass != 0)
  {
    do
    {
      targetClass = class_getSuperclass(targetClass);
      BOOL v4 = targetClass != 0;
    }
    while (targetClass != a3 && targetClass);
  }
  return v4;
}

@end