@interface _MLCCPUScatter
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4 reduceType:(int)a5;
- (_MLCCPUScatter)initWithDevice:(id)a3 dimension:(unint64_t)a4 reduceType:(int)a5;
@end

@implementation _MLCCPUScatter

+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4 reduceType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithDevice:v8 dimension:a4 reduceType:v5];

  return v9;
}

- (_MLCCPUScatter)initWithDevice:(id)a3 dimension:(unint64_t)a4 reduceType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  v9 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v10 = +[MLCCPUDeviceOps deviceOpsWithType:51 params:0 inDeltaData:0 outDeltaData:0];
  v11 = v10;
  if (v10)
  {
    [v10 setScatterGatherDimension:a4];
    [v11 setScatterReduceType:v5];
    [v9 addObject:v11];
  }
  v12 = (void *)[v9 copy];
  v15.receiver = self;
  v15.super_class = (Class)_MLCCPUScatter;
  v13 = [(_MLCCPULayer *)&v15 initWithDevice:v8 deviceOps:v12];

  return v13;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  v6 = [a4 objectAtIndexedSubscript:0];
  objc_opt_class();
  v7 = objc_opt_new();
  [v6 setLayer:v7];

  return 1;
}

@end