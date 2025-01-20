@interface _MLCCPUReshape
+ (id)layerWithDevice:(id)a3;
- (_MLCCPUReshape)initWithDevice:(id)a3;
@end

@implementation _MLCCPUReshape

- (_MLCCPUReshape)initWithDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v6 = +[MLCCPUDeviceOps deviceOpsWithType:27 params:0 inDeltaData:0 outDeltaData:0];
  if (v6) {
    [v5 addObject:v6];
  }
  v7 = (void *)[v5 copy];
  v10.receiver = self;
  v10.super_class = (Class)_MLCCPUReshape;
  v8 = [(_MLCCPULayer *)&v10 initWithDevice:v4 deviceOps:v7];

  return v8;
}

+ (id)layerWithDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDevice:v4];

  return v5;
}

@end