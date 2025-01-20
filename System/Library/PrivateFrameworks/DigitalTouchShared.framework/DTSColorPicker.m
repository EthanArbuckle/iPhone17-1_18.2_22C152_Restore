@interface DTSColorPicker
- (BOOL)isDimmed;
- (DTSColorPicker)initWithFrame:(CGRect)a3;
- (DTSColorPickerDelegate)delegate;
- (ETPaletteCircleView)selectedCircle;
- (NSArray)paletteCircles;
- (UIColor)selectedColor;
- (UILongPressGestureRecognizer)longPressRecognizer;
- (double)colorCircleDiameter;
- (double)colorCircleHorizontalSpacing;
- (unint64_t)colorCircleSize;
- (void)createPaletteCirclesWithParentView:(id)a3;
- (void)didReceiveLongPress:(id)a3;
- (void)paletteCircleTapped:(id)a3;
- (void)selectCircle:(id)a3 completion:(id)a4;
- (void)setColorCircleSize:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setLongPressRecognizer:(id)a3;
- (void)setPaletteCircles:(id)a3;
- (void)setSelectedCircle:(id)a3;
@end

@implementation DTSColorPicker

- (DTSColorPicker)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DTSColorPicker;
  v3 = -[DTSColorPicker initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:v3 action:sel_didReceiveLongPress_];
    longPressRecognizer = v3->_longPressRecognizer;
    v3->_longPressRecognizer = (UILongPressGestureRecognizer *)v4;

    [(DTSColorPicker *)v3 addGestureRecognizer:v3->_longPressRecognizer];
  }
  return v3;
}

- (UIColor)selectedColor
{
  return (UIColor *)[(ETPaletteCircleView *)self->_selectedCircle backgroundColor];
}

- (double)colorCircleHorizontalSpacing
{
  unint64_t colorCircleSize = self->_colorCircleSize;
  double result = 6.0;
  if (colorCircleSize == 1) {
    double result = 24.0;
  }
  if (colorCircleSize == 2) {
    return 36.0;
  }
  return result;
}

- (double)colorCircleDiameter
{
  unint64_t colorCircleSize = self->_colorCircleSize;
  if (colorCircleSize == 2) {
    return 36.0;
  }
  if (colorCircleSize == 1) {
    return 30.0;
  }
  double result = 20.0;
  if (!colorCircleSize) {
    +[ETPaletteCircleView paletteCircleDiameter];
  }
  return result;
}

- (void)setColorCircleSize:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (self->_colorCircleSize != a3)
  {
    self->_unint64_t colorCircleSize = a3;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v4 = self->_paletteCircles;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_msgSend(v9, "frame", (void)v20);
          double v11 = v10;
          double v13 = v12;
          [(DTSColorPicker *)self colorCircleDiameter];
          double v15 = v14;
          [v9 center];
          double v17 = v16;
          double v19 = v18;
          objc_msgSend(v9, "setFrame:", v11, v13, v15, v15);
          objc_msgSend(v9, "setCenter:", v17, v19);
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }

    [(ETPaletteCircleView *)self->_selectedCircle setNeedsLayout];
    [(DTSColorPicker *)self setNeedsLayout];
  }
}

- (void)createPaletteCirclesWithParentView:(id)a3
{
  id v20 = a3;
  +[ETPaletteCircleView paletteCircleDiameter];
  double v5 = v4;
  uint64_t v6 = +[ETColorStore defaultStore];
  uint64_t v7 = [v6 colors];

  uint64_t v8 = [v7 count];
  v9 = (NSArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v8];
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      double v11 = -[ETPaletteCircleView initWithFrame:]([ETPaletteCircleView alloc], "initWithFrame:", 0.0, 0.0, v5, v5);
      double v12 = [v7 objectAtIndexedSubscript:i];
      [(ETPaletteCircleView *)v11 setBackgroundColor:v12];

      double v13 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_paletteCircleTapped_];
      [v13 requireGestureRecognizerToFail:self->_longPressRecognizer];
      [(ETPaletteCircleView *)v11 addGestureRecognizer:v13];
      [(NSArray *)v9 addObject:v11];
      [v20 addSubview:v11];
    }
  }
  paletteCircles = self->_paletteCircles;
  self->_paletteCircles = v9;
  double v15 = v9;

  double v16 = self->_paletteCircles;
  double v17 = +[ETColorStore defaultStore];
  -[NSArray objectAtIndex:](v16, "objectAtIndex:", [v17 selectedColorIndex]);
  double v18 = (ETPaletteCircleView *)objc_claimAutoreleasedReturnValue();
  selectedCircle = self->_selectedCircle;
  self->_selectedCircle = v18;

  [(ETPaletteCircleView *)self->_selectedCircle setSelected:1];
}

- (void)selectCircle:(id)a3 completion:(id)a4
{
  uint64_t v6 = (ETPaletteCircleView *)a3;
  id v7 = a4;
  [(ETPaletteCircleView *)self->_selectedCircle setSelected:0 animated:1 completion:0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__DTSColorPicker_selectCircle_completion___block_invoke;
  v12[3] = &unk_264DEC6A8;
  id v13 = v7;
  id v8 = v7;
  [(ETPaletteCircleView *)v6 setSelected:1 animated:1 completion:v12];
  selectedCircle = self->_selectedCircle;
  self->_selectedCircle = v6;
  double v10 = v6;

  double v11 = +[ETColorStore defaultStore];
  objc_msgSend(v11, "setSelectedColorIndex:", -[NSArray indexOfObject:](self->_paletteCircles, "indexOfObject:", self->_selectedCircle));
}

uint64_t __42__DTSColorPicker_selectCircle_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)paletteCircleTapped:(id)a3
{
  id v7 = [a3 view];
  id v4 = [(DTSColorPicker *)self selectedCircle];

  if (v4 != v7)
  {
    [(DTSColorPicker *)self selectCircle:v7 completion:0];
    double v5 = [(DTSColorPicker *)self delegate];
    [v5 colorPickerSelectedColorDidChange:self];
  }
  uint64_t v6 = [(DTSColorPicker *)self delegate];
  [v6 colorPickerTapped:self];
}

- (void)didReceiveLongPress:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 state] == 1)
  {
    [v4 locationInView:self];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    [(DTSColorPicker *)self paletteCircles];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          [v14 frame];
          v25.x = v6;
          v25.y = v8;
          if (CGRectContainsPoint(v26, v25))
          {
            id v15 = v14;

            if (v15)
            {
              id v16 = [v9 lastObject];

              if (v15 != v16)
              {
                id v17 = [(DTSColorPicker *)self selectedCircle];

                if (v15 == v17)
                {
                  [(DTSColorPicker *)self showColorWheel];
                }
                else
                {
                  v18[0] = MEMORY[0x263EF8330];
                  v18[1] = 3221225472;
                  v18[2] = __38__DTSColorPicker_didReceiveLongPress___block_invoke;
                  v18[3] = &unk_264DEC6D0;
                  v18[4] = self;
                  [(DTSColorPicker *)self selectCircle:v15 completion:v18];
                }
              }
            }
            goto LABEL_16;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v15 = 0;
LABEL_16:
  }
}

uint64_t __38__DTSColorPicker_didReceiveLongPress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showColorWheel];
}

- (DTSColorPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DTSColorPickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (void)setDimmed:(BOOL)a3
{
  self->_dimmed = a3;
}

- (unint64_t)colorCircleSize
{
  return self->_colorCircleSize;
}

- (NSArray)paletteCircles
{
  return self->_paletteCircles;
}

- (void)setPaletteCircles:(id)a3
{
}

- (ETPaletteCircleView)selectedCircle
{
  return self->_selectedCircle;
}

- (void)setSelectedCircle:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_selectedCircle, 0);

  objc_storeStrong((id *)&self->_paletteCircles, 0);
}

@end