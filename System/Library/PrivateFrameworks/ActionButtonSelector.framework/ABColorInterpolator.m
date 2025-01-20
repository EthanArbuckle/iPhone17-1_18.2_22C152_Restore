@interface ABColorInterpolator
- (ABColorInterpolator)init;
- (void)color;
- (void)setColor:(int)a3 animated:;
@end

@implementation ABColorInterpolator

- (ABColorInterpolator)init
{
  v12.receiver = self;
  v12.super_class = (Class)ABColorInterpolator;
  v2 = [(ABColorInterpolator *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    red = v2->_red;
    v2->_red = (ABFloatSpringProperty *)v3;

    [(ABFloatSpringProperty *)v2->_red setBounce:0.0 duration:0.25];
    uint64_t v5 = objc_opt_new();
    green = v2->_green;
    v2->_green = (ABFloatSpringProperty *)v5;

    [(ABFloatSpringProperty *)v2->_green setBounce:0.0 duration:0.25];
    uint64_t v7 = objc_opt_new();
    blue = v2->_blue;
    v2->_blue = (ABFloatSpringProperty *)v7;

    [(ABFloatSpringProperty *)v2->_blue setBounce:0.0 duration:0.25];
    uint64_t v9 = objc_opt_new();
    alpha = v2->_alpha;
    v2->_alpha = (ABFloatSpringProperty *)v9;

    [(ABFloatSpringProperty *)v2->_alpha setBounce:0.0 duration:0.25];
    v2->_isEmpty = 1;
  }
  return v2;
}

- (void)setColor:(int)a3 animated:
{
  id v5 = a2;
  v6 = v5;
  if (a1)
  {
    int v7 = *(unsigned __int8 *)(a1 + 40);
    *(unsigned char *)(a1 + 40) = v5 == 0;
    v8 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    if (!*(unsigned char *)(a1 + 40))
    {
      double v14 = 0.0;
      double v15 = 0.0;
      double v12 = 0.0;
      double v13 = 0.0;
      [v6 getRed:&v15 green:&v14 blue:&v13 alpha:&v12];
      if (v7) {
        BOOL v9 = v6 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      v10 = *(void **)(a1 + 8);
      if (!v9 || a3 == 0)
      {
        [v10 setOutput:v15];
        [*(id *)(a1 + 16) setOutput:v14];
        [*(id *)(a1 + 24) setOutput:v13];
        [*(id *)(a1 + 32) setOutput:v12];
      }
      else
      {
        [v10 setInput:v15];
        [*(id *)(a1 + 16) setInput:v14];
        [*(id *)(a1 + 24) setInput:v13];
        [*(id *)(a1 + 32) setInput:v12];
      }
    }
  }
}

- (void)color
{
  if (a1)
  {
    v2 = a1;
    if (*((unsigned char *)a1 + 40))
    {
      a1 = 0;
    }
    else
    {
      uint64_t v3 = (void *)a1[6];
      if (v3)
      {
        double v26 = 0.0;
        var38[0] = 0;
        double v24 = 0.0;
        double v25 = 0.0;
        [v3 getRed:var38 green:&v26 blue:&v25 alpha:&v24];
        double v4 = *(double *)var38;
        [(id)v2[1] output];
        if (v4 == v5)
        {
          double v6 = v26;
          [(id)v2[2] output];
          if (v6 == v7)
          {
            double v8 = v25;
            [(id)v2[3] output];
            if (v8 == v9)
            {
              double v10 = v24;
              [(id)v2[4] output];
              if (v10 == v11) {
                goto LABEL_11;
              }
            }
          }
        }
      }
      double v12 = (void *)MEMORY[0x263F1C550];
      [(id)v2[1] output];
      double v14 = v13;
      [(id)v2[2] output];
      double v16 = v15;
      [(id)v2[3] output];
      double v18 = v17;
      [(id)v2[4] output];
      uint64_t v20 = [v12 colorWithRed:v14 green:v16 blue:v18 alpha:v19];
      v21 = (void *)v2[6];
      v2[6] = v20;

      if (!*((unsigned char *)v2 + 40)) {
LABEL_11:
      }
        v22 = (void *)v2[6];
      else {
        v22 = 0;
      }
      a1 = v22;
    }
    uint64_t v1 = var38[8];
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedOutputColor, 0);
  objc_storeStrong((id *)&self->_alpha, 0);
  objc_storeStrong((id *)&self->_blue, 0);
  objc_storeStrong((id *)&self->_green, 0);

  objc_storeStrong((id *)&self->_red, 0);
}

@end