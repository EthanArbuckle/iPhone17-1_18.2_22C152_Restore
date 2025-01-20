@interface _PKInkThicknessPicker
+ (CGSize)sizeWithButtonCount:(unint64_t)a3 buttonSize:(CGSize)result;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)thicknessButtons;
- (id)_sortedWeights;
- (void)buttonTapped:(id)a3;
- (void)initWithToolConfiguration:(void *)a1;
- (void)layoutSubviews;
- (void)setThicknessButtons:(id)a3;
- (void)setToolConfiguration:(uint64_t)a1;
@end

@implementation _PKInkThicknessPicker

- (void)initWithToolConfiguration:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)_PKInkThicknessPicker;
    id v4 = objc_msgSendSuper2(&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    a1 = v4;
    if (v4) {
      -[_PKInkThicknessPicker setToolConfiguration:]((uint64_t)v4, v3);
    }
  }

  return a1;
}

- (void)setToolConfiguration:(uint64_t)a1
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1 && ([*(id *)(a1 + 472) isEqual:v4] & 1) == 0)
  {
    id v34 = v4;
    objc_storeStrong((id *)(a1 + 472), a2);
    v5 = *(void **)(a1 + 456);
    *(void *)(a1 + 456) = 0;

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    objc_super v6 = [(id)a1 thicknessButtons];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v42 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * i), "removeFromSuperview", v34);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v8);
    }

    v11 = [MEMORY[0x1E4F1CA48] array];
    v12 = [*(id *)(a1 + 472) strokeWeightsToButtonImages];
    v13 = -[_PKInkThicknessPicker _sortedWeights](a1);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obuint64_t j = v13;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v46 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          v19 = objc_msgSend(v12, "objectForKeyedSubscript:", v18, v34);
          v20 = [v19 imageWithRenderingMode:2];

          v21 = [_PKInkThicknessButton alloc];
          [v18 floatValue];
          double v23 = v22;
          [*(id *)(a1 + 472) strokeWeightButtonSize];
          v26 = [(_PKInkThicknessButton *)(id *)&v21->super.super.super.super.super.isa initWithAssetImage:v23 weight:v24 buttonSize:v25];
          v27 = [*(id *)(a1 + 472) weightButtonTintColorOverride];
          -[_PKInkThicknessButton setImageTintColorOverride:]((uint64_t)v26, v27);

          [v11 addObject:v26];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v15);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v28 = [v11 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v38;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(v11);
          }
          v32 = *(void **)(*((void *)&v37 + 1) + 8 * k);
          objc_msgSend(v32, "addTarget:action:forControlEvents:", a1, sel_buttonTapped_, 64, v34);
          [(id)a1 addSubview:v32];
        }
        uint64_t v29 = [v11 countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v29);
    }
    v33 = objc_msgSend(v11, "copy", v34);
    [(id)a1 setThicknessButtons:v33];

    [(id)a1 setNeedsLayout];
    id v4 = v35;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v4 = [(_PKInkThicknessPicker *)self thicknessButtons];
  uint64_t v5 = [v4 count];

  objc_super v6 = objc_opt_class();
  if (self) {
    toolConfiguration = self->_toolConfiguration;
  }
  else {
    toolConfiguration = 0;
  }
  [(PKToolConfiguration *)toolConfiguration strokeWeightButtonSize];

  objc_msgSend(v6, "sizeWithButtonCount:buttonSize:", v5);
  result.height = v9;
  result.width = v8;
  return result;
}

+ (CGSize)sizeWithButtonCount:(unint64_t)a3 buttonSize:(CGSize)result
{
  double v4 = result.width * (double)a3;
  double v5 = (double)(12 * a3 - 12);
  if (a3 <= 1) {
    double v5 = -0.0;
  }
  double v6 = v4 + v5;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)_PKInkThicknessPicker;
  [(_PKInkThicknessPicker *)&v28 layoutSubviews];
  if (self)
  {
    double weight = self->_weight;
    double v4 = -[_PKInkThicknessPicker _sortedWeights]((uint64_t)self);
    if ([v4 count])
    {
      unint64_t v5 = 0;
      uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
      double v7 = INFINITY;
      do
      {
        double v8 = [v4 objectAtIndexedSubscript:v5];
        [v8 doubleValue];
        double v10 = vabdd_f64(v9, weight);
        if (v10 < v7)
        {
          double v7 = v10;
          uint64_t v6 = v5;
        }

        ++v5;
      }
      while (v5 < [v4 count]);
    }
    else
    {
      uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  v11 = [(_PKInkThicknessPicker *)self thicknessButtons];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = [(_PKInkThicknessPicker *)self thicknessButtons];
      uint64_t v15 = [v14 objectAtIndexedSubscript:v13];

      double v16 = 0.0;
      double v17 = 0.0;
      double v18 = 0.0;
      double v19 = 0.0;
      if (self)
      {
        [(PKToolConfiguration *)self->_toolConfiguration strokeWeightButtonSize];
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        [(PKToolConfiguration *)self->_toolConfiguration strokeWeightButtonSize];
        if (v24 <= 40.0) {
          double v25 = 12.0;
        }
        else {
          double v25 = 15.0;
        }
        double v19 = DKDCenterRectOverRect(0.0, 0.0, v21, v23, (v21 + v25) * (double)v13, 0.0, v21, v23);
      }
      objc_msgSend(v15, "setFrame:", v19, v18, v17, v16);
      [v15 setSelected:v6 == v13];

      ++v13;
      v26 = [(_PKInkThicknessPicker *)self thicknessButtons];
      unint64_t v27 = [v26 count];
    }
    while (v13 < v27);
  }
}

- (void)buttonTapped:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_PKInkThicknessPicker *)self thicknessButtons];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (self)
  {
    double v7 = -[_PKInkThicknessPicker _sortedWeights]((uint64_t)self);
    double v8 = [v7 objectAtIndexedSubscript:v6];
    [v8 floatValue];
    double v10 = v9;

    self->_double weight = v10;
    [(_PKInkThicknessPicker *)self setNeedsLayout];
  }

  [(_PKInkThicknessPicker *)self sendActionsForControlEvents:4096];

  [(_PKInkThicknessPicker *)self setNeedsLayout];
}

- (id)_sortedWeights
{
  v2 = *(void **)(a1 + 456);
  if (!v2)
  {
    id v3 = [*(id *)(a1 + 472) strokeWeightsToButtonImages];
    id v4 = [v3 allKeys];

    uint64_t v5 = [v4 sortedArrayUsingSelector:sel_compare_];
    uint64_t v6 = *(void **)(a1 + 456);
    *(void *)(a1 + 456) = v5;

    v2 = *(void **)(a1 + 456);
  }

  return v2;
}

- (NSArray)thicknessButtons
{
  return self->_thicknessButtons;
}

- (void)setThicknessButtons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thicknessButtons, 0);
  objc_storeStrong((id *)&self->_toolConfiguration, 0);

  objc_storeStrong((id *)&self->_cachedSortedWeights, 0);
}

@end