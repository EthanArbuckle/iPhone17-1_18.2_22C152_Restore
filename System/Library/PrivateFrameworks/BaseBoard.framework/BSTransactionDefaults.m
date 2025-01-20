@interface BSTransactionDefaults
@end

@implementation BSTransactionDefaults

void __40___BSTransactionDefaults_sharedInstance__block_invoke()
{
  id v0 = [(BSAbstractDefaultDomain *)[_BSTransactionDefaults alloc] _initWithDomain:@"com.apple.BaseBoard.transactions"];
  v1 = (void *)_MergedGlobals_8;
  _MergedGlobals_8 = (uint64_t)v0;
}

@end