@interface DRRequestResetHysteresisDict
@end

@implementation DRRequestResetHysteresisDict

void ___DRRequestResetHysteresisDict_block_invoke()
{
  _hysteresisDict();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 removeAllObjects];
}

@end