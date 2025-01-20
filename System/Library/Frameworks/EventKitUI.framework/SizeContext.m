@interface SizeContext
+ (id)sharedInstance;
- (BOOL)hasViewHierarchyForCurrentContext;
- (SizeContext)init;
- (id)viewHierarchyForCurrentContext;
- (void)popContextFromViewHierarchy:(id)a3;
- (void)pushContextWithViewHierarchy:(id)a3;
@end

@implementation SizeContext

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_55);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

- (id)viewHierarchyForCurrentContext
{
  if ([(NSMutableArray *)self->_windowContextStack count])
  {
    v4 = [(NSMutableArray *)self->_windowContextStack lastObject];
  }
  else
  {
    if (_shouldAssertOnUnknownWindow_onceToken != -1) {
      dispatch_once(&_shouldAssertOnUnknownWindow_onceToken, &__block_literal_global_49);
    }
    if (_shouldAssertOnUnknownWindow_shouldAssert)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2, self, @"EKUIDeviceCapabilities.m", 202, @"Multiple windows exist, and we do not have a view hierarchy from which to derive the current sizing context." object file lineNumber description];

      v4 = 0;
    }
    else
    {
      v4 = EKUIMainWindowForMultiwindowError();
    }
  }

  return v4;
}

- (void)pushContextWithViewHierarchy:(id)a3
{
}

- (void)popContextFromViewHierarchy:(id)a3
{
  id v7 = a3;
  if (_shouldAssertOnUnknownWindow_onceToken != -1) {
    dispatch_once(&_shouldAssertOnUnknownWindow_onceToken, &__block_literal_global_49);
  }
  if (_shouldAssertOnUnknownWindow_shouldAssert)
  {
    id v5 = [(NSMutableArray *)self->_windowContextStack lastObject];
    if (v5 != v7)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"EKUIDeviceCapabilities.m" lineNumber:187 description:@"Attempting to pop an object that's not on top of the stack."];
    }
  }
  [(NSMutableArray *)self->_windowContextStack removeLastObject];
}

- (BOOL)hasViewHierarchyForCurrentContext
{
  if (_shouldAssertOnUnknownWindow_onceToken != -1) {
    dispatch_once(&_shouldAssertOnUnknownWindow_onceToken, &__block_literal_global_49);
  }
  return !_shouldAssertOnUnknownWindow_shouldAssert || [(NSMutableArray *)self->_windowContextStack count] != 0;
}

void __29__SizeContext_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SizeContext);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;
}

- (SizeContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)SizeContext;
  v2 = [(SizeContext *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    windowContextStack = v2->_windowContextStack;
    v2->_windowContextStack = (NSMutableArray *)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end