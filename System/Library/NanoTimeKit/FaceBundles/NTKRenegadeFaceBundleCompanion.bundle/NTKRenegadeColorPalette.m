@interface NTKRenegadeColorPalette
+ (id)_blackColor;
+ (id)_darkGrayColor;
+ (id)_goldColor;
+ (id)_greenColor;
+ (id)_lightGrayColor;
+ (id)_redColor;
+ (id)_swatchBlackColor;
+ (id)paletteForColor:(unint64_t)a3 flipped:(BOOL)a4;
+ (id)swatchImageForColor:(unint64_t)a3 size:(CGSize)a4;
- (BOOL)flipped;
- (UIColor)bottomComplicationLabelColor;
- (UIColor)bottomOverlapColor;
- (UIColor)bottomPatchColor;
- (UIColor)dateComplicationLabelColor;
- (UIColor)highlightColor;
- (UIColor)hourLabelColor;
- (UIColor)minuteLabelColor;
- (UIColor)swatchColor;
- (UIColor)topOverlapColor;
- (UIColor)topPatchColor;
- (id)_initWithColor:(unint64_t)a3 flipped:(BOOL)a4 tritium:(BOOL)a5;
@end

@implementation NTKRenegadeColorPalette

- (id)_initWithColor:(unint64_t)a3 flipped:(BOOL)a4 tritium:(BOOL)a5
{
  BOOL v6 = a4;
  v37.receiver = self;
  v37.super_class = (Class)NTKRenegadeColorPalette;
  v8 = [(NTKRenegadeColorPalette *)&v37 init];
  v9 = v8;
  if (v8)
  {
    v8->_color = a3;
    v8->_flipped = v6;
    v8->_tritium = a5;
    v36 = +[UIColor colorWithWhite:0.2 alpha:1.0];
    v10 = +[UIColor colorWithWhite:0.3 alpha:1.0];
    v11 = [(id)objc_opt_class() _greenColor];
    v12 = [(id)objc_opt_class() _redColor];
    v35 = [(id)objc_opt_class() _goldColor];
    v13 = [(id)objc_opt_class() _blackColor];
    v14 = v13;
    v15 = v14;
    v16 = v14;
    if (a3 == 2)
    {
      if (!a5)
      {
        v16 = v35;
      }
    }
    else if (a3 != 1)
    {
      if (a3)
      {
        v19 = 0;
        v20 = 0;
        v16 = v14;
        goto LABEL_23;
      }
      if (v6) {
        v17 = v36;
      }
      else {
        v17 = v10;
      }
      if (v6) {
        v18 = v10;
      }
      else {
        v18 = v36;
      }
      v19 = v17;
      v20 = v18;
      objc_storeStrong((id *)&v9->_bottomComplicationLabelColor, v10);
      v21 = v10;
      dateComplicationLabelColor = v9->_dateComplicationLabelColor;
      v9->_dateComplicationLabelColor = v21;
      v16 = v15;
LABEL_21:

LABEL_23:
      objc_storeStrong((id *)&v9->_topPatchColor, v19);
      hourLabelColor = v9->_hourLabelColor;
      v9->_hourLabelColor = v19;
      v27 = v19;

      objc_storeStrong((id *)&v9->_topOverlapColor, v13);
      objc_storeStrong((id *)&v9->_bottomPatchColor, v20);
      minuteLabelColor = v9->_minuteLabelColor;
      v9->_minuteLabelColor = v20;
      v29 = v20;

      bottomOverlapColor = v9->_bottomOverlapColor;
      v9->_bottomOverlapColor = v15;
      v31 = v15;

      highlightColor = v9->_highlightColor;
      v9->_highlightColor = v16;
      v33 = v16;

      return v9;
    }
    if (v6) {
      v23 = v12;
    }
    else {
      v23 = v11;
    }
    if (v6) {
      v24 = v11;
    }
    else {
      v24 = v12;
    }
    id v25 = v23;
    v20 = v24;
    objc_storeStrong((id *)&v9->_bottomComplicationLabelColor, v24);
    v19 = (UIColor *)v25;
    dateComplicationLabelColor = v9->_dateComplicationLabelColor;
    v9->_dateComplicationLabelColor = v19;
    goto LABEL_21;
  }
  return v9;
}

+ (id)_darkGrayColor
{
  return +[UIColor colorWithWhite:0.2 alpha:1.0];
}

+ (id)_lightGrayColor
{
  return +[UIColor colorWithWhite:0.3 alpha:1.0];
}

+ (id)_greenColor
{
  return (id)_NTKColorWithRGBA(0, 147, 74, 1.0);
}

+ (id)_redColor
{
  return (id)_NTKColorWithRGBA(228, 42, 47, 1.0);
}

+ (id)_goldColor
{
  return (id)_NTKColorWithRGBA(246, 215, 84, 1.0);
}

+ (id)_blackColor
{
  return +[UIColor blackColor];
}

+ (id)_swatchBlackColor
{
  return (id)_NTKColorWithRGBA(26, 26, 26, 1.0);
}

+ (id)paletteForColor:(unint64_t)a3 flipped:(BOOL)a4
{
  id v4 = [objc_alloc((Class)a1) _initWithColor:a3 flipped:a4 tritium:0];

  return v4;
}

+ (id)swatchImageForColor:(unint64_t)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (a4.width == CGSizeZero.width && a4.height == CGSizeZero.height)
  {
    +[NTKEditOption sizeForSwatchStyle:0];
    double width = v9;
    double height = v10;
  }
  switch(a3)
  {
    case 2uLL:
      v11 = [a1 _redColor];
      v12 = +[_NTKRenegadeSwatchStripeDefinition definitionWithColor:v11 height:width / 3.7 * 0.85];
      v26[0] = v12;
      v13 = [a1 _swatchBlackColor];
      v14 = +[_NTKRenegadeSwatchStripeDefinition definitionWithColor:v13 height:width / 3.7];
      v26[1] = v14;
      v16 = [a1 _greenColor];
      v17 = +[_NTKRenegadeSwatchStripeDefinition definitionWithColor:v16 height:width / 3.7];
      v26[2] = v17;
      v18 = [a1 _goldColor];
      v19 = +[_NTKRenegadeSwatchStripeDefinition definitionWithColor:v18 height:width / 3.7 * 0.85];
      v26[3] = v19;
      v15 = +[NSArray arrayWithObjects:v26 count:4];

LABEL_13:
      goto LABEL_14;
    case 1uLL:
      v11 = [a1 _redColor];
      v12 = +[_NTKRenegadeSwatchStripeDefinition definitionWithColor:v11 height:width / 2.52 * 0.76];
      v27[0] = v12;
      v13 = [a1 _swatchBlackColor];
      v14 = +[_NTKRenegadeSwatchStripeDefinition definitionWithColor:v13 height:width / 2.52];
      v27[1] = v14;
      v16 = [a1 _greenColor];
      v17 = +[_NTKRenegadeSwatchStripeDefinition definitionWithColor:v16 height:width / 2.52 * 0.76];
      v27[2] = v17;
      v15 = +[NSArray arrayWithObjects:v27 count:3];
      goto LABEL_13;
    case 0uLL:
      v11 = [a1 _lightGrayColor];
      v12 = +[_NTKRenegadeSwatchStripeDefinition definitionWithColor:v11 height:width * 0.5];
      v28[0] = v12;
      v13 = [a1 _darkGrayColor];
      v14 = +[_NTKRenegadeSwatchStripeDefinition definitionWithColor:v13 height:width * 0.5];
      v28[1] = v14;
      v15 = +[NSArray arrayWithObjects:v28 count:2];
LABEL_14:

      goto LABEL_16;
  }
  v15 = 0;
LABEL_16:
  id v20 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", width, height);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_3198;
  v24[3] = &unk_10528;
  id v25 = v15;
  id v21 = v15;
  v22 = [v20 imageWithActions:v24];

  return v22;
}

- (UIColor)dateComplicationLabelColor
{
  return self->_dateComplicationLabelColor;
}

- (UIColor)bottomComplicationLabelColor
{
  return self->_bottomComplicationLabelColor;
}

- (UIColor)topPatchColor
{
  return self->_topPatchColor;
}

- (UIColor)topOverlapColor
{
  return self->_topOverlapColor;
}

- (UIColor)bottomPatchColor
{
  return self->_bottomPatchColor;
}

- (UIColor)bottomOverlapColor
{
  return self->_bottomOverlapColor;
}

- (UIColor)hourLabelColor
{
  return self->_hourLabelColor;
}

- (UIColor)minuteLabelColor
{
  return self->_minuteLabelColor;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (UIColor)swatchColor
{
  return self->_swatchColor;
}

- (BOOL)flipped
{
  return self->_flipped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swatchColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_minuteLabelColor, 0);
  objc_storeStrong((id *)&self->_hourLabelColor, 0);
  objc_storeStrong((id *)&self->_bottomOverlapColor, 0);
  objc_storeStrong((id *)&self->_bottomPatchColor, 0);
  objc_storeStrong((id *)&self->_topOverlapColor, 0);
  objc_storeStrong((id *)&self->_topPatchColor, 0);
  objc_storeStrong((id *)&self->_bottomComplicationLabelColor, 0);
  objc_storeStrong((id *)&self->_dateComplicationLabelColor, 0);
  objc_storeStrong((id *)&self->_flippedPalette, 0);

  objc_storeStrong((id *)&self->_tritiumPalette, 0);
}

@end