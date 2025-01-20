@interface BBHandleSignificantTimeChange
@end

@implementation BBHandleSignificantTimeChange

void ___BBHandleSignificantTimeChange_block_invoke()
{
  v0 = (void *)MEMORY[0x21D44A020]();
  [(id)__server _handleSignificantTimeChange];
}

@end