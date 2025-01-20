@interface CNMemojiBackgroundParameters
+ (id)defaultBackgroundColorDescription;
- (CGPoint)endPointForLayerAtIndex:(int64_t)a3;
- (CGPoint)startPointForLayerAtIndex:(int64_t)a3;
- (CNMemojiBackgroundColor)contentColor;
- (CNMemojiBackgroundParameters)initWithColorDescription:(id)a3;
- (double)locationForColorAtIndex:(int64_t)a3 forLayer:(int64_t)a4;
- (id)backgroundLayerColorForIndex:(int64_t)a3;
- (id)colorAtIndex:(int64_t)a3 forLayer:(int64_t)a4;
- (id)colorLayerColorForIndex:(int64_t)a3;
- (id)description;
- (id)topGradientLayerColorForIndex:(int64_t)a3;
- (int64_t)numberOfColorsForLayer:(int64_t)a3;
- (int64_t)numberOfLayers;
- (void)setContentColor:(id)a3;
@end

@implementation CNMemojiBackgroundParameters

+ (id)defaultBackgroundColorDescription
{
  v2 = [[CNMemojiBackgroundColor alloc] initWithDefaultColorWithAlpha:0.0];
  id v3 = [NSString alloc];
  [(CNMemojiBackgroundColor *)v2 red];
  uint64_t v5 = v4;
  [(CNMemojiBackgroundColor *)v2 green];
  uint64_t v7 = v6;
  [(CNMemojiBackgroundColor *)v2 blue];
  v9 = objc_msgSend(v3, "initWithFormat:", @"%f:%f:%f", v5, v7, v8);

  return v9;
}

- (CNMemojiBackgroundParameters)initWithColorDescription:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNMemojiBackgroundParameters;
  uint64_t v5 = [(CNMemojiBackgroundParameters *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [[CNMemojiBackgroundColor alloc] initWithColorDescription:v4 alpha:0.4];
    contentColor = v5->_contentColor;
    v5->_contentColor = v6;

    uint64_t v8 = v5;
  }

  return v5;
}

- (int64_t)numberOfLayers
{
  return 3;
}

- (int64_t)numberOfColorsForLayer:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return qword_190B90480[a3];
  }
}

- (id)colorAtIndex:(int64_t)a3 forLayer:(int64_t)a4
{
  if (a4 == 2)
  {
    id v4 = [(CNMemojiBackgroundParameters *)self topGradientLayerColorForIndex:a3];
  }
  else if (a4 == 1)
  {
    id v4 = [(CNMemojiBackgroundParameters *)self colorLayerColorForIndex:a3];
  }
  else if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(CNMemojiBackgroundParameters *)self backgroundLayerColorForIndex:a3];
  }

  return v4;
}

- (id)backgroundLayerColorForIndex:(int64_t)a3
{
  if (a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = -[CNMemojiBackgroundColor initWithRed:green:blue:alpha:]([CNMemojiBackgroundColor alloc], "initWithRed:green:blue:alpha:", 255.0, 255.0, 255.0, 0.9, v3);
  }
  return v5;
}

- (id)colorLayerColorForIndex:(int64_t)a3
{
  if (a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(CNMemojiBackgroundParameters *)self contentColor];
  }
  return v5;
}

- (id)topGradientLayerColorForIndex:(int64_t)a3
{
  if (!a3)
  {
    double v3 = 0.3;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    double v3 = 0.0;
LABEL_5:
    uint64_t v4 = [[CNMemojiBackgroundColor alloc] initWithRed:255.0 green:255.0 blue:255.0 alpha:v3];
    goto LABEL_7;
  }
  uint64_t v4 = 0;
LABEL_7:

  return v4;
}

- (double)locationForColorAtIndex:(int64_t)a3 forLayer:(int64_t)a4
{
  BOOL v4 = a4 == 2 && a3 == 1;
  double result = 0.0;
  if (v4) {
    return 1.0;
  }
  return result;
}

- (CGPoint)startPointForLayerAtIndex:(int64_t)a3
{
  double v3 = 0.5;
  double v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)endPointForLayerAtIndex:(int64_t)a3
{
  double v3 = 0.5;
  double v4 = 1.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)description
{
  double v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  if ([(CNMemojiBackgroundParameters *)self numberOfLayers] >= 1)
  {
    int64_t v4 = 0;
    do
    {
      if ([(CNMemojiBackgroundParameters *)self numberOfColorsForLayer:v4] >= 1)
      {
        int64_t v5 = 0;
        do
        {
          uint64_t v6 = [(CNMemojiBackgroundParameters *)self colorAtIndex:v5 forLayer:v4];
          uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Layer %ld Color %ld", v4, v5);
          uint64_t v8 = NSString;
          [v6 red];
          uint64_t v10 = v9;
          [v6 green];
          uint64_t v12 = v11;
          [v6 blue];
          uint64_t v14 = v13;
          [v6 alpha];
          v16 = [v8 stringWithFormat:@"%f, %f, %f, %f", v10, v12, v14, v15];
          id v17 = (id)[v3 appendObject:v16 withName:v7];

          ++v5;
        }
        while (v5 < [(CNMemojiBackgroundParameters *)self numberOfColorsForLayer:v4]);
      }
      ++v4;
    }
    while (v4 < [(CNMemojiBackgroundParameters *)self numberOfLayers]);
  }
  v18 = [v3 build];

  return v18;
}

- (CNMemojiBackgroundColor)contentColor
{
  return self->_contentColor;
}

- (void)setContentColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end