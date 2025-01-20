@interface NTKPoodleBackgroundView
- (CGRect)faceBounds;
- (NTKPoodleBackgroundView)initWithDevice:(id)a3;
- (NTKPoodleColorPalette)palette;
- (double)dialWidth;
- (void)layoutSubviews;
- (void)setPalette:(id)a3;
@end

@implementation NTKPoodleBackgroundView

- (NTKPoodleBackgroundView)initWithDevice:(id)a3
{
  id v5 = a3;
  sub_14320(v5, (uint64_t)v37);
  v36.receiver = self;
  v36.super_class = (Class)NTKPoodleBackgroundView;
  v6 = -[NTKPoodleBackgroundView initWithFrame:](&v36, "initWithFrame:", v38, v39, v40, v41);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    [(NTKPoodleBackgroundView *)v7 dialWidth];
    double v9 = v8;
    v10 = sub_14438();
    uint64_t v11 = +[CALayer layer];
    dialInnerLayer = v7->_dialInnerLayer;
    v7->_dialInnerLayer = (CALayer *)v11;

    [(CALayer *)v7->_dialInnerLayer setCornerCurve:kCACornerCurveCircular];
    [(CALayer *)v7->_dialInnerLayer setMasksToBounds:1];
    v13 = v7->_dialInnerLayer;
    id v14 = +[UIColor grayColor];
    -[CALayer setBackgroundColor:](v13, "setBackgroundColor:", [v14 CGColor]);

    [(CALayer *)v7->_dialInnerLayer setActions:v10];
    v15 = [(NTKPoodleBackgroundView *)v7 layer];
    [v15 addSublayer:v7->_dialInnerLayer];

    uint64_t v16 = +[CALayer layer];
    dialOuterLayer = v7->_dialOuterLayer;
    v7->_dialOuterLayer = (CALayer *)v16;

    [(CALayer *)v7->_dialOuterLayer setBorderWidth:v9 + 1.0];
    [(CALayer *)v7->_dialOuterLayer setCornerCurve:kCACornerCurveCircular];
    [(CALayer *)v7->_dialOuterLayer setMasksToBounds:1];
    v18 = v7->_dialOuterLayer;
    id v19 = +[UIColor darkGrayColor];
    -[CALayer setBorderColor:](v18, "setBorderColor:", [v19 CGColor]);

    [(CALayer *)v7->_dialOuterLayer setActions:v10];
    v20 = [(NTKPoodleBackgroundView *)v7 layer];
    [v20 addSublayer:v7->_dialOuterLayer];

    uint64_t v21 = +[CALayer layer];
    dialInnerBorderLayer = v7->_dialInnerBorderLayer;
    v7->_dialInnerBorderLayer = (CALayer *)v21;

    [(CALayer *)v7->_dialInnerBorderLayer setCornerCurve:kCACornerCurveCircular];
    [(CALayer *)v7->_dialInnerBorderLayer setMasksToBounds:1];
    [(CALayer *)v7->_dialInnerBorderLayer setBorderWidth:0.0];
    v23 = v7->_dialInnerBorderLayer;
    id v24 = +[UIColor orangeColor];
    -[CALayer setBorderColor:](v23, "setBorderColor:", [v24 CGColor]);

    [(CALayer *)v7->_dialInnerBorderLayer setActions:v10];
    v25 = [(NTKPoodleBackgroundView *)v7 layer];
    [v25 addSublayer:v7->_dialInnerBorderLayer];

    uint64_t v26 = +[CALayer layer];
    dialOuterBorderLayer = v7->_dialOuterBorderLayer;
    v7->_dialOuterBorderLayer = (CALayer *)v26;

    [(CALayer *)v7->_dialOuterBorderLayer setCornerCurve:kCACornerCurveCircular];
    [(CALayer *)v7->_dialOuterBorderLayer setMasksToBounds:1];
    [(CALayer *)v7->_dialOuterBorderLayer setBorderWidth:0.0];
    v28 = v7->_dialOuterBorderLayer;
    id v29 = +[UIColor orangeColor];
    -[CALayer setBorderColor:](v28, "setBorderColor:", [v29 CGColor]);

    [(CALayer *)v7->_dialOuterBorderLayer setActions:v10];
    v30 = [(NTKPoodleBackgroundView *)v7 layer];
    [v30 addSublayer:v7->_dialOuterBorderLayer];

    v31 = [(NTKPoodleBackgroundView *)v7 layer];
    [v31 setMasksToBounds:1];

    v32 = [(NTKPoodleBackgroundView *)v7 layer];
    v33 = sub_14438();
    [v32 setActions:v33];

    v34 = v7;
  }

  return v7;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)NTKPoodleBackgroundView;
  [(NTKPoodleBackgroundView *)&v17 layoutSubviews];
  [(NTKPoodleBackgroundView *)self dialWidth];
  CGFloat v4 = v3;
  [(NTKPoodleBackgroundView *)self bounds];
  double x = v18.origin.x;
  double y = v18.origin.y;
  double width = v18.size.width;
  double height = v18.size.height;
  CGRect v19 = CGRectInset(v18, v4, v4);
  double v9 = v19.origin.x;
  double v10 = v19.origin.y;
  double v11 = v19.size.width;
  double v13 = v19.size.height;
  v19.origin.double x = x;
  v19.origin.double y = y;
  v19.size.double width = width;
  v19.size.double height = height;
  CGRect v20 = CGRectInset(v19, v4, v4);
  double v15 = v20.origin.y;
  double v16 = v20.origin.x;
  double v12 = v20.size.width;
  double v14 = v20.size.height;
  -[CALayer setFrame:](self->_dialInnerLayer, "setFrame:", v9, v10, v11, v13);
  [(CALayer *)self->_dialInnerLayer setCornerRadius:v11 * 0.5];
  -[CALayer setFrame:](self->_dialOuterLayer, "setFrame:", x, y, width, height);
  [(CALayer *)self->_dialOuterLayer setCornerRadius:width * 0.5];
  -[CALayer setFrame:](self->_dialInnerBorderLayer, "setFrame:", v16, v15, v12, v14);
  [(CALayer *)self->_dialInnerBorderLayer setCornerRadius:v12 * 0.5];
  -[CALayer setFrame:](self->_dialOuterBorderLayer, "setFrame:", x, y, width, height);
  [(CALayer *)self->_dialOuterBorderLayer setCornerRadius:width * 0.5];
}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);
  id v5 = a3;
  dialInnerLayer = self->_dialInnerLayer;
  id v7 = [v5 innerDialBackground];
  -[CALayer setBackgroundColor:](dialInnerLayer, "setBackgroundColor:", [v7 CGColor]);

  dialInnerBorderLayer = self->_dialInnerBorderLayer;
  id v9 = [v5 innerDialBackgroundBorder];
  -[CALayer setBorderColor:](dialInnerBorderLayer, "setBorderColor:", [v9 CGColor]);

  double v10 = self->_dialInnerBorderLayer;
  double v11 = [v5 innerDialBorderWidth];
  [v11 floatValue];
  [(CALayer *)v10 setBorderWidth:v12];

  dialOuterLayer = self->_dialOuterLayer;
  id v14 = [v5 outerDialBackground];
  -[CALayer setBorderColor:](dialOuterLayer, "setBorderColor:", [v14 CGColor]);

  dialOuterBorderLayer = self->_dialOuterBorderLayer;
  id v16 = [v5 outerDialBackgroundBorder];
  -[CALayer setBorderColor:](dialOuterBorderLayer, "setBorderColor:", [v16 CGColor]);

  objc_super v17 = self->_dialOuterBorderLayer;
  id v19 = [v5 outerDialBorderWidth];
  [v19 floatValue];
  [(CALayer *)v17 setBorderWidth:v18];
}

- (CGRect)faceBounds
{
  sub_14320(self->_device, (uint64_t)v6);
  double v2 = v7;
  double v3 = v8;
  double v4 = v9;
  double v5 = v10;
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (double)dialWidth
{
  sub_14320(self->_device, (uint64_t)v3);
  return v3[0];
}

- (NTKPoodleColorPalette)palette
{
  return self->_palette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_dialOuterBorderLayer, 0);
  objc_storeStrong((id *)&self->_dialOuterLayer, 0);
  objc_storeStrong((id *)&self->_dialInnerBorderLayer, 0);
  objc_storeStrong((id *)&self->_dialInnerLayer, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end