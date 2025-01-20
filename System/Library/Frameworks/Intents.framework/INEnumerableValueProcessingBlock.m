@interface INEnumerableValueProcessingBlock
@end

@implementation INEnumerableValueProcessingBlock

uint64_t ___INEnumerableValueProcessingBlock_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3 && [v3 conformsToProtocol:&unk_1EDBB19A8]) {
    uint64_t v5 = objc_msgSend(v4, "_intents_enumerateObjectsOfClass:withBlock:", *(void *)(a1 + 40), *(void *)(a1 + 32));
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

@end