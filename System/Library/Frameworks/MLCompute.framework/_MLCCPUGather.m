@interface _MLCCPUGather
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4;
- (_MLCCPUGather)initWithDevice:(id)a3 dimension:(unint64_t)a4;
@end

@implementation _MLCCPUGather

+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithDevice:v6 dimension:a4];

  return v7;
}

- (_MLCCPUGather)initWithDevice:(id)a3 dimension:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v8 = +[MLCCPUDeviceOps deviceOpsWithType:50 params:0 inDeltaData:0 outDeltaData:0];
  v9 = v8;
  if (v8)
  {
    [v8 setScatterGatherDimension:a4];
    [v9 setScatterReduceType:1];
    [v7 addObject:v9];
  }
  v10 = (void *)[v7 copy];
  v13.receiver = self;
  v13.super_class = (Class)_MLCCPUGather;
  v11 = [(_MLCCPULayer *)&v13 initWithDevice:v6 deviceOps:v10];

  return v11;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v6 = [a4 objectAtIndexedSubscript:0];
  objc_opt_class();
  v7 = objc_opt_new();
  [v6 setLayer:v7];

  return 1;
}

@end