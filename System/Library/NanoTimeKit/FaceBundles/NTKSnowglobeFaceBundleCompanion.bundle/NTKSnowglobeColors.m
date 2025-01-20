@interface NTKSnowglobeColors
- (NSArray)backgroundObjectColorFrom;
- (NSArray)backgroundObjectColorTo;
- (NTKSnowglobeColors)initWithPalette:(id)a3;
- (UIColor)backgroundColor;
- (UIColor)backlightColor;
- (double)backgroundObjectColorTransitionFraction;
- (id)_backgroundObjectColorsFromColors:(id)a3 randoms:(id)a4;
- (id)backgroundColorsForRandoms:(id)a3;
@end

@implementation NTKSnowglobeColors

- (NTKSnowglobeColors)initWithPalette:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NTKSnowglobeColors;
  v5 = [(NTKSnowglobeColors *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 backlightColor];
    backlightColor = v5->_backlightColor;
    v5->_backlightColor = (UIColor *)v6;

    uint64_t v8 = [v4 background];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v8;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v4;
      v11 = [v10 fromPalette];
      v12 = [v10 toPalette];
      uint64_t v13 = [v11 backgroundObjectColors];
      backgroundObjectColorFrom = v5->_backgroundObjectColorFrom;
      v5->_backgroundObjectColorFrom = (NSArray *)v13;

      uint64_t v15 = [v12 backgroundObjectColors];
      backgroundObjectColorTo = v5->_backgroundObjectColorTo;
      v5->_backgroundObjectColorTo = (NSArray *)v15;

      [v10 transitionFraction];
      double v18 = v17;

      v5->_backgroundObjectColorTransitionFraction = v18;
    }
    else
    {
      v19 = [v4 backgroundObjectColors];
      objc_storeStrong((id *)&v5->_backgroundObjectColorFrom, v19);
      v20 = v5->_backgroundObjectColorTo;
      v5->_backgroundObjectColorTo = v19;

      v5->_backgroundObjectColorTransitionFraction = 0.0;
    }
  }

  return v5;
}

- (id)backgroundColorsForRandoms:(id)a3
{
  id v4 = a3;
  [(NTKSnowglobeColors *)self backgroundObjectColorTransitionFraction];
  uint64_t v6 = v5;
  v7 = [(NTKSnowglobeColors *)self backgroundObjectColorFrom];
  uint64_t v8 = [(NTKSnowglobeColors *)self backgroundObjectColorTo];
  [(NTKSnowglobeColors *)self backgroundObjectColorTransitionFraction];
  double v10 = v9;
  v11 = [(NTKSnowglobeColors *)self _backgroundObjectColorsFromColors:v7 randoms:v4];
  if (v10 != 0.0)
  {
    v12 = [(NTKSnowglobeColors *)self _backgroundObjectColorsFromColors:v8 randoms:v4];
    uint64_t v13 = objc_opt_new();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1DAFE31F8;
    v19[3] = &unk_1E6BE4D70;
    id v20 = v12;
    id v14 = v13;
    id v21 = v14;
    uint64_t v22 = v6;
    id v15 = v12;
    [v11 enumerateObjectsUsingBlock:v19];
    v16 = v21;
    id v17 = v14;

    v11 = v17;
  }

  return v11;
}

- (id)_backgroundObjectColorsFromColors:(id)a3 randoms:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  if ([v6 count])
  {
    unint64_t v8 = 0;
    do
    {
      double v9 = [v6 objectAtIndexedSubscript:v8];
      unint64_t v10 = [v9 unsignedIntegerValue];
      unint64_t v11 = v10 % [v5 count];

      v12 = [v5 objectAtIndexedSubscript:v11];
      [v7 addObject:v12];

      ++v8;
    }
    while (v8 < [v6 count]);
  }

  return v7;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)backlightColor
{
  return self->_backlightColor;
}

- (NSArray)backgroundObjectColorFrom
{
  return self->_backgroundObjectColorFrom;
}

- (NSArray)backgroundObjectColorTo
{
  return self->_backgroundObjectColorTo;
}

- (double)backgroundObjectColorTransitionFraction
{
  return self->_backgroundObjectColorTransitionFraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundObjectColorTo, 0);
  objc_storeStrong((id *)&self->_backgroundObjectColorFrom, 0);
  objc_storeStrong((id *)&self->_backlightColor, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end