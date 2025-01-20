@interface _MLCCPUSplit
+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4;
- (_MLCCPUSplit)initWithDevice:(id)a3 dimension:(unint64_t)a4;
@end

@implementation _MLCCPUSplit

- (_MLCCPUSplit)initWithDevice:(id)a3 dimension:(unint64_t)a4
{
  id v5 = a3;
  v6 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v7 = +[MLCCPUDeviceOps deviceOpsWithType:46 params:0 inDeltaData:0 outDeltaData:0];
  if (v7) {
    [v6 addObject:v7];
  }
  v8 = (void *)[v6 copy];
  v11.receiver = self;
  v11.super_class = (Class)_MLCCPUSplit;
  v9 = [(_MLCCPULayer *)&v11 initWithDevice:v5 deviceOps:v8];

  return v9;
}

+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithDevice:v6 dimension:a4];

  return v7;
}

@end