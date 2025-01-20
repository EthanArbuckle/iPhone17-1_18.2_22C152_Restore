@interface RBSAssertion(FBWorkspace)
- (uint64_t)fb_workspaceAssertionState;
- (void)fb_setWorkspaceAssertionState:()FBWorkspace;
@end

@implementation RBSAssertion(FBWorkspace)

- (uint64_t)fb_workspaceAssertionState
{
  v1 = objc_getAssociatedObject(a1, &__FBWorkspaceAssertionState);
  unsigned __int8 v2 = [v1 unsignedIntValue];

  return v2;
}

- (void)fb_setWorkspaceAssertionState:()FBWorkspace
{
  if (a3)
  {
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedChar:");
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;
  objc_setAssociatedObject(a1, &__FBWorkspaceAssertionState, v4, (void *)1);
}

@end