@interface EvaluatorHandleNetworkChange
@end

@implementation EvaluatorHandleNetworkChange

uint64_t __fnpe_EvaluatorHandleNetworkChange_block_invoke(void *a1)
{
  uint64_t result = FigCFWeakReferenceHolderCopyReferencedObject();
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[6] + 24);
  return result;
}

@end