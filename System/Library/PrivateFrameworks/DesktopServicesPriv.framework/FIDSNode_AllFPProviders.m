@interface FIDSNode_AllFPProviders
- (BOOL)markAsUsed:(id *)a3;
@end

@implementation FIDSNode_AllFPProviders

- (BOOL)markAsUsed:(id *)a3
{
  if (a3)
  {
    ErrorWithOSStatus(0, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 1;
}

@end