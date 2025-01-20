@interface BEBurnableBlock
@end

@implementation BEBurnableBlock

void __63___BEBurnableBlock_initWithTimeout_block_defaultInputProvider___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = (*(void (**)(void))(v2 + 16))();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  [*(id *)(a1 + 32) performWithInput:v3];
}

@end