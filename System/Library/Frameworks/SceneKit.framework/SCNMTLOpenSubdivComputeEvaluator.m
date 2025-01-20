@interface SCNMTLOpenSubdivComputeEvaluator
- (uint64_t)computeEvaluator;
- (void)dealloc;
@end

@implementation SCNMTLOpenSubdivComputeEvaluator

- (uint64_t)computeEvaluator
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (void)dealloc
{
  computeEvaluator = self->_computeEvaluator;
  if (computeEvaluator)
  {
    OpenSubdiv::v3_1_1::Osd::MTLLegacyGregoryPatchTable::~MTLLegacyGregoryPatchTable((OpenSubdiv::v3_1_1::Osd::MTLLegacyGregoryPatchTable *)computeEvaluator);
    MEMORY[0x210534FE0]();
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNMTLOpenSubdivComputeEvaluator;
  [(SCNMTLOpenSubdivComputeEvaluator *)&v4 dealloc];
}

@end