@interface _MLCGPUSplit
+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4;
- (_MLCGPUSplit)initWithDevice:(id)a3 dimension:(unint64_t)a4;
@end

@implementation _MLCGPUSplit

- (_MLCGPUSplit)initWithDevice:(id)a3 dimension:(unint64_t)a4
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_MLCGPUSplit;
  v6 = [(_MLCGPUSplit *)&v19 init];
  if (v6)
  {
    v7 = [v5 deviceList];
    uint64_t v8 = [v7 count];

    v9 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    if (v8)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        v11 = [v5 deviceList];
        v12 = [v11 objectAtIndexedSubscript:i];

        v13 = (void *)[objc_alloc(MEMORY[0x1E4F35960]) initWithDevice:v12];
        if (v13)
        {
          v14 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v13];
          v15 = v14;
          if (v14)
          {
            [v14 setLayer:v6];
            [v15 setSourceOfForwardNeededForGradient:0];
            [v15 setResultOfForwardNeededForGradient:0];
            [v9 addObject:v15];
          }
        }
      }
    }
    v16 = (void *)[v9 copy];
    v18.receiver = v6;
    v18.super_class = (Class)_MLCGPUSplit;
    [(_MLCGPULayer *)&v18 setDeviceOps:v16];
  }
  return v6;
}

+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithDevice:v6 dimension:a4];

  return v7;
}

@end