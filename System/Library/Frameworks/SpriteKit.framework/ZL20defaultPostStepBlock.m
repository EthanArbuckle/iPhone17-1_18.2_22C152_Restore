@interface ZL20defaultPostStepBlock
@end

@implementation ZL20defaultPostStepBlock

void _ZL20defaultPostStepBlock_block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v2 = [v5 representedObject];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 _backingNode];
    (*(void (**)(uint64_t))(*(void *)v4 + 208))(v4);
  }
}

@end