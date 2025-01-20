@interface ISStackedEffects
- (ISEffect)effects;
- (ISStackedEffects)initWithEffects:(id)a3;
- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4;
- (void)setEffects:(id)a3;
@end

@implementation ISStackedEffects

- (ISStackedEffects)initWithEffects:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISStackedEffects;
  v6 = [(ISStackedEffects *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_effects, a3);
  }

  return v7;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ISStackedEffects *)self effects];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(ISStackedEffects *)self effects];
    v11 = (void *)[v10 count];

    if (v11)
    {
      v12 = [(ISStackedEffects *)self effects];
      v13 = [v12 firstObject];
      v14 = [v13 filterWithBackgroundImage:v6 inputImage:v7];

      v15 = [(ISStackedEffects *)self effects];
      unint64_t v16 = [v15 count];

      if (v16 < 2)
      {
        v11 = v14;
      }
      else
      {
        unint64_t v17 = 1;
        do
        {
          v18 = [(ISStackedEffects *)self effects];
          v19 = [v18 objectAtIndex:v17];
          v20 = [v14 outputImage];
          v11 = [v19 filterWithBackgroundImage:0 inputImage:v20];

          ++v17;
          v21 = [(ISStackedEffects *)self effects];
          unint64_t v22 = [v21 count];

          v14 = v11;
        }
        while (v22 > v17);
      }
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (ISEffect)effects
{
  return (ISEffect *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEffects:(id)a3
{
}

- (void).cxx_destruct
{
}

@end