@interface ANSTVideoMaskRefineAlgorithm
+ (Class)_concreteClassOfVersion:(unint64_t)a3;
+ (id)new;
+ (id)supportedSemanticCategories;
+ (id)supportedSemanticCategoriesOfVersion:(unint64_t)a3;
- (ANSTVideoMaskRefineAlgorithm)init;
- (ANSTVideoMaskRefineAlgorithm)initWithConfiguration:(id)a3;
- (id)resultForPixelBuffer:(__CVBuffer *)a3 coarseSegementationMasks:(id)a4 error:(id *)a5;
@end

@implementation ANSTVideoMaskRefineAlgorithm

+ (id)supportedSemanticCategories
{
  return (id)MEMORY[0x270F9A6D0](a1, sel_supportedSemanticCategoriesOfVersion_, 0x10000);
}

+ (id)supportedSemanticCategoriesOfVersion:(unint64_t)a3
{
  v5[3] = *MEMORY[0x263EF8340];
  if (a3 == 0x10000)
  {
    v5[0] = @"Person";
    v5[1] = @"Skin";
    v5[2] = @"Hair";
    v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v5, 3);
  }
  else
  {
    v3 = (void *)MEMORY[0x263EFFA68];
  }
  return v3;
}

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTVideoMaskRefineAlgorithm)init
{
  id result = (ANSTVideoMaskRefineAlgorithm *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (Class)_concreteClassOfVersion:(unint64_t)a3
{
  if (a3 == 0x10000)
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

- (ANSTVideoMaskRefineAlgorithm)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ANSTVideoMaskRefineAlgorithm;
  return [(ANSTAlgorithm *)&v4 initWithConfiguration:a3];
}

- (id)resultForPixelBuffer:(__CVBuffer *)a3 coarseSegementationMasks:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(self, v8, (uint64_t)a2);
  __break(1u);
  return result;
}

@end