@interface AXGestureRecorderGradientView
+ (Class)layerClass;
- (id)_copyColorsArrayWithTopColor:(id)a3 bottomColor:(id)a4;
- (id)_copyLocationsArrayWithTopColorLocation:(float)a3 bottomColorLocation:(float)a4;
- (void)_configureGradientWithTopColor:(id)a3 bottomColor:(id)a4 locations:(id)a5 animated:(BOOL)a6 duration:(double)a7 completion:(id)a8;
- (void)configureGradientAnimatedWithTopColor:(id)a3 bottomColor:(id)a4 duration:(double)a5 completion:(id)a6;
- (void)configureGradientAnimatedWithTopColor:(id)a3 bottomColor:(id)a4 topColorLocation:(float)a5 bottomColorLocation:(float)a6 duration:(double)a7 completion:(id)a8;
- (void)configureGradientWithTopColor:(id)a3 bottomColor:(id)a4;
- (void)configureGradientWithTopColor:(id)a3 bottomColor:(id)a4 topColorLocation:(float)a5 bottomColorLocation:(float)a6;
@end

@implementation AXGestureRecorderGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_configureGradientWithTopColor:(id)a3 bottomColor:(id)a4 locations:(id)a5 animated:(BOOL)a6 duration:(double)a7 completion:(id)a8
{
  BOOL v10 = a6;
  id v14 = a5;
  id v15 = a8;
  id v16 = a4;
  id v17 = a3;
  v18 = [(AXGestureRecorderGradientView *)self gradientLayer];
  id v19 = [(AXGestureRecorderGradientView *)self _copyColorsArrayWithTopColor:v17 bottomColor:v16];

  if (a7 > 0.0 && v10)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __115__AXGestureRecorderGradientView__configureGradientWithTopColor_bottomColor_locations_animated_duration_completion___block_invoke;
    aBlock[3] = &unk_1E649BF58;
    id v20 = v18;
    id v32 = v20;
    v21 = (void (**)(void *, id, char *))_Block_copy(aBlock);
    uint64_t v22 = v21[2](v21, v19, sel_colors);
    uint64_t v23 = v21[2](v21, v14, sel_locations);
    v24 = (void *)v23;
    if (v22 && v23)
    {
      id v25 = (id)objc_opt_new();
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v22, v24, 0);
      [v25 setAnimations:v26];

      if (!v25) {
        goto LABEL_20;
      }
    }
    else
    {
      if (!(v22 | v23))
      {
        id v25 = 0;
LABEL_20:

        goto LABEL_21;
      }
      if (v22) {
        v27 = (void *)v22;
      }
      else {
        v27 = (void *)v23;
      }
      id v25 = v27;
    }
    [v25 setDuration:a7];
    if (v15)
    {
      v28 = objc_opt_new();
      [v28 setCompletionBlock:v15];
      [v25 setDelegate:v28];
    }
    v29 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v29);
    [v20 addAnimation:v25 forKey:v30];

    if (v22) {
      [v20 setColors:v19];
    }
    if (v24) {
      [v20 setLocations:v14];
    }
    goto LABEL_20;
  }
  [v18 setColors:v19];
  [v18 setLocations:v14];
LABEL_21:
}

id __115__AXGestureRecorderGradientView__configureGradientWithTopColor_bottomColor_locations_animated_duration_completion___block_invoke(uint64_t a1, void *a2, const char *a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) performSelector:a3];
  v7 = (void *)v6;
  if (id)v6 == v5 || v5 && v6 && ([v5 isEqual:v6])
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_opt_new();
    v9 = NSStringFromSelector(a3);
    [v8 setKeyPath:v9];

    [v8 setFromValue:v7];
    [v8 setToValue:v5];
  }

  return v8;
}

- (void)configureGradientWithTopColor:(id)a3 bottomColor:(id)a4
{
}

- (void)configureGradientWithTopColor:(id)a3 bottomColor:(id)a4 topColorLocation:(float)a5 bottomColorLocation:(float)a6
{
  id v10 = a4;
  id v11 = a3;
  *(float *)&double v12 = a5;
  *(float *)&double v13 = a6;
  id v14 = [(AXGestureRecorderGradientView *)self _copyLocationsArrayWithTopColorLocation:v12 bottomColorLocation:v13];
  [(AXGestureRecorderGradientView *)self _configureGradientWithTopColor:v11 bottomColor:v10 locations:v14 animated:0 duration:0 completion:0.0];
}

- (void)configureGradientAnimatedWithTopColor:(id)a3 bottomColor:(id)a4 duration:(double)a5 completion:(id)a6
{
}

- (void)configureGradientAnimatedWithTopColor:(id)a3 bottomColor:(id)a4 topColorLocation:(float)a5 bottomColorLocation:(float)a6 duration:(double)a7 completion:(id)a8
{
  id v14 = a8;
  id v15 = a4;
  id v16 = a3;
  *(float *)&double v17 = a5;
  *(float *)&double v18 = a6;
  id v19 = [(AXGestureRecorderGradientView *)self _copyLocationsArrayWithTopColorLocation:v17 bottomColorLocation:v18];
  [(AXGestureRecorderGradientView *)self _configureGradientWithTopColor:v16 bottomColor:v15 locations:v19 animated:1 duration:v14 completion:a7];
}

- (id)_copyColorsArrayWithTopColor:(id)a3 bottomColor:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  id v9 = v7;
  uint64_t v10 = [v9 CGColor];

  id v11 = v6;
  uint64_t v12 = [v11 CGColor];

  return (id)objc_msgSend(v8, "initWithObjects:", v10, v12, 0);
}

- (id)_copyLocationsArrayWithTopColorLocation:(float)a3 bottomColorLocation:(float)a4
{
  id v6 = objc_alloc(NSNumber);
  *(float *)&double v7 = a3;
  id v8 = (void *)[v6 initWithFloat:v7];
  id v9 = objc_alloc(NSNumber);
  *(float *)&double v10 = a4;
  id v11 = (void *)[v9 initWithFloat:v10];
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v8, v11, 0);

  return v12;
}

@end