@interface ETHorizontalColorPicker
- (BOOL)shouldCompressSpacingBetweenColumns;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFitsColumns:(unint64_t)a3;
- (ETHorizontalColorPicker)initWithFrame:(CGRect)a3;
- (ETHorizontalColorPickerDelegate)presentationDelegate;
- (id)colorWheel;
- (void)_getNumCirclesPerColumn:(unint64_t *)a3 numExtraCircles:(unint64_t *)a4 horizontalSpacing:(double *)a5 verticalSpacing:(double *)a6 forNumRows:(unint64_t)a7 andNumColumns:(unint64_t)a8;
- (void)_getNumRows:(unint64_t *)a3 numColumns:(unint64_t *)a4 numCirclesPerColumn:(unint64_t *)a5 numExtraCircles:(unint64_t *)a6 horizontalSpacing:(double *)a7 verticalSpacing:(double *)a8 forSize:(CGSize)a9;
- (void)_getWidthNeeded:(double *)a3 heightNeeded:(double *)a4 numColumns:(unint64_t)a5 numCirclesPerColumn:(unint64_t)a6 numExtraCircles:(unint64_t)a7 horizontalSpacing:(unint64_t)a8 verticalSpacing:(unint64_t)a9;
- (void)colorWheel:(id)a3 didPickColor:(id)a4;
- (void)colorWheel:(id)a3 pickerColorChanged:(id)a4;
- (void)layoutSubviews;
- (void)setDimmed:(BOOL)a3;
- (void)setDimmed:(BOOL)a3 excludeSelectedColor:(BOOL)a4 animated:(BOOL)a5;
- (void)setPresentationDelegate:(id)a3;
- (void)setShouldCompressSpacingBetweenColumns:(BOOL)a3;
- (void)setTransform:(CGAffineTransform *)a3 excludeSelectedColor:(BOOL)a4;
- (void)showColorWheel;
@end

@implementation ETHorizontalColorPicker

- (ETHorizontalColorPicker)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)ETHorizontalColorPicker;
  v3 = -[ETHorizontalColorPicker initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(ETHorizontalColorPicker *)v3 createPaletteCirclesWithParentView:v3];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = [(ETHorizontalColorPicker *)v4 paletteCircles];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = *(void *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v5);
          }
          LODWORD(v7) = -1093874483;
          [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) setCharge:v7];
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }

    v11 = -[ETTranscriptColorWheel initWithFrame:]([ETTranscriptColorWheel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    colorWheel = v4->_colorWheel;
    v4->_colorWheel = v11;

    [(ETTranscriptColorWheel *)v4->_colorWheel setDelegate:v4];
  }
  return v4;
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)ETHorizontalColorPicker;
  [(ETHorizontalColorPicker *)&v30 layoutSubviews];
  [(ETHorizontalColorPicker *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(ETHorizontalColorPicker *)self paletteCircles];
  unint64_t v8 = (unint64_t)[v7 count];
  [(ETHorizontalColorPicker *)self colorCircleDiameter];
  double v10 = v9;
  unint64_t v28 = 0;
  unint64_t v29 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  double v24 = 0.0;
  double v25 = 0.0;
  -[ETHorizontalColorPicker _getNumRows:numColumns:numCirclesPerColumn:numExtraCircles:horizontalSpacing:verticalSpacing:forSize:](self, "_getNumRows:numColumns:numCirclesPerColumn:numExtraCircles:horizontalSpacing:verticalSpacing:forSize:", &v29, &v28, &v27, &v26, &v25, &v24, v4, v6);
  unint64_t v11 = v28;
  if (v28 && v8)
  {
    unint64_t v12 = 0;
    v13 = 0;
    int v14 = 0;
    double v15 = v10 * 0.5;
    do
    {
      uint64_t v16 = v27;
      if (v26 != 1 || (v8 & 1) == 0)
      {
        if (v26)
        {
          uint64_t v16 = v27 + 1;
          --v26;
        }
      }
      else if (v12 == v11 >> 1)
      {
        uint64_t v16 = v27 + 1;
        uint64_t v26 = 0;
      }
      if (v16)
      {
        for (unint64_t i = 0; i != v16; ++i)
        {
          v19 = v13;
          v13 = [v7 objectAtIndexedSubscript:v14 + i];

          double v20 = v25;
          double v21 = v15 + (double)i * (v10 + v24);
          if ((v12 & 1) == 0 && v28 >= 2 && v29 >= 2)
          {
            [(ETHorizontalColorPicker *)self colorCircleDiameter];
            double v21 = v21 + v23;
          }
          objc_msgSend(v13, "setCenter:", v15 + (double)v12 * (v10 + v20), v21);
        }
        v14 += i;
        unint64_t v11 = v28;
      }
      ++v12;
    }
    while (v12 < v11 && v8 > v14);
  }
}

- (CGSize)sizeThatFitsColumns:(unint64_t)a3
{
  double v5 = [(ETHorizontalColorPicker *)self paletteCircles];
  id v6 = [v5 count];

  uint64_t v14 = 0;
  double v12 = 0.0;
  uint64_t v13 = 0;
  double v11 = 0.0;
  [(ETHorizontalColorPicker *)self _getNumCirclesPerColumn:&v14 numExtraCircles:&v13 horizontalSpacing:&v12 verticalSpacing:&v11 forNumRows:vcvtps_u32_f32((float)(unint64_t)v6 / (float)a3) andNumColumns:a3];
  double v9 = 0.0;
  double v10 = 0.0;
  [(ETHorizontalColorPicker *)self _getWidthNeeded:&v10 heightNeeded:&v9 numColumns:a3 numCirclesPerColumn:v14 numExtraCircles:v13 horizontalSpacing:(unint64_t)v12 verticalSpacing:(unint64_t)v11];
  double v8 = v9;
  double v7 = v10;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v11 = 0;
  double v9 = 0.0;
  uint64_t v10 = 0;
  double v8 = 0.0;
  -[ETHorizontalColorPicker _getNumRows:numColumns:numCirclesPerColumn:numExtraCircles:horizontalSpacing:verticalSpacing:forSize:](self, "_getNumRows:numColumns:numCirclesPerColumn:numExtraCircles:horizontalSpacing:verticalSpacing:forSize:", &v13, &v12, &v11, &v10, &v9, &v8, a3.width, a3.height);
  double v6 = 0.0;
  double v7 = 0.0;
  [(ETHorizontalColorPicker *)self _getWidthNeeded:&v7 heightNeeded:&v6 numColumns:v12 numCirclesPerColumn:v11 numExtraCircles:v10 horizontalSpacing:(unint64_t)v9 verticalSpacing:(unint64_t)v8];
  double v5 = v6;
  double v4 = v7;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_getWidthNeeded:(double *)a3 heightNeeded:(double *)a4 numColumns:(unint64_t)a5 numCirclesPerColumn:(unint64_t)a6 numExtraCircles:(unint64_t)a7 horizontalSpacing:(unint64_t)a8 verticalSpacing:(unint64_t)a9
{
  [(ETHorizontalColorPicker *)self colorCircleDiameter];
  *a3 = (double)((a5 - 1) * a8) + (double)a5 * v15;
  double v16 = (double)((a6 - 1) * a9) + (double)a6 * v15;
  *a4 = v16;
  if (a7)
  {
    double v17 = (double)a9 + v15 * 2.0;
    double v18 = v15 + (double)a9;
    if (a7 != 1) {
      double v18 = v17;
    }
    *a4 = v16 + v18;
  }
}

- (void)_getNumRows:(unint64_t *)a3 numColumns:(unint64_t *)a4 numCirclesPerColumn:(unint64_t *)a5 numExtraCircles:(unint64_t *)a6 horizontalSpacing:(double *)a7 verticalSpacing:(double *)a8 forSize:(CGSize)a9
{
  double height = a9.height;
  double width = a9.width;
  id v24 = [(ETHorizontalColorPicker *)self paletteCircles];
  id v18 = [v24 count];
  [(ETHorizontalColorPicker *)self colorCircleDiameter];
  double v20 = v19;
  double v21 = floor((height + v19) / (v20 + v20));
  if (v21 < 1.0) {
    double v21 = 1.0;
  }
  *a3 = (unint64_t)v21;
  *a4 = vcvtps_u32_f32((float)(unint64_t)v18 / (float)(unint64_t)v21);
  -[ETHorizontalColorPicker _getNumCirclesPerColumn:numExtraCircles:horizontalSpacing:verticalSpacing:forNumRows:andNumColumns:](self, "_getNumCirclesPerColumn:numExtraCircles:horizontalSpacing:verticalSpacing:forNumRows:andNumColumns:", a5, a6, a7, a8, *a3);
  v22 = (char *)[(ETHorizontalColorPicker *)self colorCircleSize];
  if (v22 != (unsigned char *)&dword_0 + 3 && v22)
  {
    [(ETHorizontalColorPicker *)self colorCircleHorizontalSpacing];
  }
  else
  {
    if (*a3 != 1) {
      goto LABEL_11;
    }
    double v23 = (width - (double)(unint64_t)v18 * v20) / (double)((unint64_t)v18 - 1);
    if (v20 < v23) {
      double v23 = v20;
    }
  }
  *a7 = v23;
LABEL_11:
}

- (void)_getNumCirclesPerColumn:(unint64_t *)a3 numExtraCircles:(unint64_t *)a4 horizontalSpacing:(double *)a5 verticalSpacing:(double *)a6 forNumRows:(unint64_t)a7 andNumColumns:(unint64_t)a8
{
  double v15 = [(ETHorizontalColorPicker *)self paletteCircles];
  unint64_t v16 = (unint64_t)[v15 count];

  [(ETHorizontalColorPicker *)self colorCircleDiameter];
  double v18 = v17;
  *a3 = v16 / a8;
  *a4 = v16 % a8;
  double v19 = (char *)[(ETHorizontalColorPicker *)self colorCircleSize];
  if ([(ETHorizontalColorPicker *)self shouldCompressSpacingBetweenColumns]
    || v19 != (unsigned char *)&dword_0 + 3 && v19)
  {
    [(ETHorizontalColorPicker *)self colorCircleHorizontalSpacing];
  }
  else
  {
    double v20 = v18 * 0.5;
    if (a7 == 1) {
      double v20 = v18;
    }
  }
  *a5 = v20;
  *a6 = v18;
}

- (void)setDimmed:(BOOL)a3
{
}

- (void)setDimmed:(BOOL)a3 excludeSelectedColor:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  if ([(ETHorizontalColorPicker *)self isDimmed] != a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)ETHorizontalColorPicker;
    [(ETHorizontalColorPicker *)&v13 setDimmed:v7];
    double v9 = 1.0;
    if (v7) {
      double v9 = 0.1;
    }
    double v10 = 0.0;
    v11[1] = 3221225472;
    v11[0] = _NSConcreteStackBlock;
    v11[2] = sub_B3C8;
    v11[3] = &unk_24A00;
    v11[4] = self;
    if (v5) {
      double v10 = 0.25;
    }
    BOOL v12 = a4;
    *(double *)&v11[5] = v9;
    +[UIView animateWithDuration:v11 animations:0 completion:v10];
    [(ETHorizontalColorPicker *)self setUserInteractionEnabled:v7 ^ 1];
  }
}

- (void)setTransform:(CGAffineTransform *)a3 excludeSelectedColor:(BOOL)a4
{
  BOOL v4 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v7 = [(ETHorizontalColorPicker *)self paletteCircles];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v11);
        if (!v4
          || ([(ETHorizontalColorPicker *)self selectedCircle],
              objc_super v13 = objc_claimAutoreleasedReturnValue(),
              v13,
              v12 != v13))
        {
          long long v14 = *(_OWORD *)&a3->c;
          v15[0] = *(_OWORD *)&a3->a;
          v15[1] = v14;
          v15[2] = *(_OWORD *)&a3->tx;
          [v12 setTransform:v15];
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (id)colorWheel
{
  return self->_colorWheel;
}

- (void)showColorWheel
{
  double v3 = [(ETHorizontalColorPicker *)self longPressRecognizer];
  [v3 setEnabled:0];

  colorWheel = self->_colorWheel;
  BOOL v5 = [(ETHorizontalColorPicker *)self selectedCircle];
  [(ETTranscriptColorWheel *)colorWheel setHueForPaletteCircle:v5];

  id v6 = [(ETHorizontalColorPicker *)self presentationDelegate];
  [v6 colorPicker:self requestsPresentColorWheel:self->_colorWheel];
}

- (void)colorWheel:(id)a3 didPickColor:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = +[ETColorStore defaultStore];
    BOOL v7 = [(ETHorizontalColorPicker *)self paletteCircles];
    id v8 = [(ETHorizontalColorPicker *)self selectedCircle];
    objc_msgSend(v6, "saveColor:forIndex:", v5, objc_msgSend(v7, "indexOfObject:", v8));
  }
  id v9 = [(ETHorizontalColorPicker *)self delegate];
  [v9 colorPickerSelectedColorDidChange:self];

  uint64_t v10 = [(ETHorizontalColorPicker *)self longPressRecognizer];
  [v10 setEnabled:1];

  id v11 = [(ETHorizontalColorPicker *)self presentationDelegate];
  [v11 colorPicker:self requestsDismissColorWheel:self->_colorWheel];
}

- (void)colorWheel:(id)a3 pickerColorChanged:(id)a4
{
  id v5 = a4;
  id v6 = [(ETHorizontalColorPicker *)self selectedCircle];
  [v6 setBackgroundColor:v5];
}

- (ETHorizontalColorPickerDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (ETHorizontalColorPickerDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (BOOL)shouldCompressSpacingBetweenColumns
{
  return self->_shouldCompressSpacingBetweenColumns;
}

- (void)setShouldCompressSpacingBetweenColumns:(BOOL)a3
{
  self->_shouldCompressSpacingBetweenColumns = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationDelegate);

  objc_storeStrong((id *)&self->_colorWheel, 0);
}

@end