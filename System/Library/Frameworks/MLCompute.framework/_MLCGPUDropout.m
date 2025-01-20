@interface _MLCGPUDropout
+ (id)layerWithDevice:(id)a3 rate:(float)a4 seed:(unint64_t)a5;
- (_MLCGPUDropout)initWithDevice:(id)a3 rate:(float)a4 seed:(unint64_t)a5;
@end

@implementation _MLCGPUDropout

- (_MLCGPUDropout)initWithDevice:(id)a3 rate:(float)a4 seed:(unint64_t)a5
{
  id v8 = a3;
  v39.receiver = self;
  v39.super_class = (Class)_MLCGPUDropout;
  v9 = [(_MLCGPUDropout *)&v39 init];
  v10 = v9;
  if (v9)
  {
    v33 = v9;
    v11 = [v8 deviceList];
    uint64_t v12 = [v11 count];

    v34 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    if (v12)
    {
      uint64_t v13 = 0;
      float v14 = 1.0 - a4;
      unint64_t v15 = 0x1E4F35000uLL;
      int64x2_t v35 = vdupq_n_s64(1uLL);
      unint64_t v16 = 0x1E4F35000uLL;
      do
      {
        v17 = [v8 deviceList];
        v18 = [v17 objectAtIndexedSubscript:v13];

        id v19 = objc_alloc(*(Class *)(v15 + 1072));
        int64x2_t v37 = v35;
        uint64_t v38 = 1;
        v20 = objc_msgSend(v19, "initWithDevice:keepProbability:seed:maskStrideInPixels:", v18, a5, &v37, COERCE_DOUBLE(__PAIR64__(v35.u32[1], LODWORD(v14))));
        id v21 = objc_alloc(*(Class *)(v16 + 1080));
        int64x2_t v37 = v35;
        uint64_t v38 = 1;
        uint64_t v22 = objc_msgSend(v21, "initWithDevice:keepProbability:seed:maskStrideInPixels:", v18, a5, &v37, COERCE_DOUBLE(__PAIR64__(v35.u32[1], LODWORD(v14))));
        v23 = (void *)v22;
        if (v20) {
          BOOL v24 = v22 == 0;
        }
        else {
          BOOL v24 = 1;
        }
        if (!v24)
        {
          uint64_t v25 = v12;
          id v26 = v8;
          unint64_t v27 = v16;
          unint64_t v28 = v15;
          v29 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v20 gradientKernel:v22];
          v30 = v29;
          if (v29)
          {
            [v29 setSourceOfForwardNeededForGradient:1];
            [v30 setResultOfForwardNeededForGradient:0];
            [v34 addObject:v30];
          }

          unint64_t v15 = v28;
          unint64_t v16 = v27;
          id v8 = v26;
          uint64_t v12 = v25;
        }

        ++v13;
      }
      while (v12 != v13);
    }
    v31 = (void *)[v34 copy];
    v10 = v33;
    v36.receiver = v33;
    v36.super_class = (Class)_MLCGPUDropout;
    [(_MLCGPULayer *)&v36 setDeviceOps:v31];
  }
  return v10;
}

+ (id)layerWithDevice:(id)a3 rate:(float)a4 seed:(unint64_t)a5
{
  id v8 = a3;
  id v9 = objc_alloc((Class)a1);
  *(float *)&double v10 = a4;
  v11 = (void *)[v9 initWithDevice:v8 rate:a5 seed:v10];

  return v11;
}

@end