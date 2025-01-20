@interface FBTransaction
- (FBTransaction)init;
@end

@implementation FBTransaction

- (FBTransaction)init
{
  v5.receiver = self;
  v5.super_class = (Class)FBTransaction;
  v2 = [(FBTransaction *)&v5 init];
  if (v2)
  {
    v3 = FBWorkspaceLogTransaction();
    [(FBTransaction *)v2 _addDebugLogCategory:v3];
  }
  return v2;
}

@end