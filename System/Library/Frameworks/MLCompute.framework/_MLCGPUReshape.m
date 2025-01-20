@interface _MLCGPUReshape
+ (id)layerWithDevice:(id)a3;
- (_MLCGPUReshape)initWithDevice:(id)a3;
@end

@implementation _MLCGPUReshape

- (_MLCGPUReshape)initWithDevice:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MLCGPUReshape;
  v5 = [(_MLCGPUReshape *)&v14 init];
  if (v5)
  {
    v6 = [v4 deviceList];
    uint64_t v7 = [v6 count];

    for (i = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy]; v7; --v7)
    {
      v9 = +[MLCGPUDeviceOps deviceOps];
      v10 = v9;
      if (v9)
      {
        [v9 setSourceOfForwardNeededForGradient:0];
        [v10 setResultOfForwardNeededForGradient:0];
        [i addObject:v10];
      }
    }
    v11 = (void *)[i copy];
    v13.receiver = v5;
    v13.super_class = (Class)_MLCGPUReshape;
    [(_MLCGPULayer *)&v13 setDeviceOps:v11];
  }
  return v5;
}

+ (id)layerWithDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDevice:v4];

  return v5;
}

@end