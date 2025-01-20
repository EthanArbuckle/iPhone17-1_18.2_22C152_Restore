@interface MLCTransposeLayer(CoreMLModelSpecification)
+ (id)transposeLayer:()CoreMLModelSpecification error:;
@end

@implementation MLCTransposeLayer(CoreMLModelSpecification)

+ (id)transposeLayer:()CoreMLModelSpecification error:
{
  uint64_t v4 = *(unsigned int *)(a3 + 16);
  v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  if ((int)v4 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 8 * v4;
    do
    {
      v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a3 + 24) + v6 + 8)];
      [v5 addObject:v8];

      v6 += 8;
    }
    while (v7 != v6);
  }
  v9 = +[MLNeuralNetworkMLComputeLayer transposeLayerWithAxes:v5];

  return v9;
}

@end