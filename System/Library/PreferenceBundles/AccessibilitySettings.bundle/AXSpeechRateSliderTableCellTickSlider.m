@interface AXSpeechRateSliderTableCellTickSlider
- (AXSpeechRateSliderTableCellTickSlider)initWithFrame:(CGRect)a3;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (void)drawRect:(CGRect)a3;
@end

@implementation AXSpeechRateSliderTableCellTickSlider

- (AXSpeechRateSliderTableCellTickSlider)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXSpeechRateSliderTableCellTickSlider;
  v3 = -[AXSpeechRateSliderTableCellTickSlider initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AXSpeechRateSliderTableCellTickSlider *)v3 setContentMode:3];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  [(AXSpeechRateSliderTableCellTickSlider *)self bounds];
  -[AXSpeechRateSliderTableCellTickSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = +[UIColor colorWithWhite:0.596078431 alpha:1.0];
  [v12 set];

  id v17 = objc_alloc_init((Class)UIBezierPath);
  [v17 setLineWidth:v11];
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  double v13 = v5 + CGRectGetWidth(v19) * 0.5;
  PSRoundToPixel();
  objc_msgSend(v17, "moveToPoint:", v13, v14);
  PSRoundToPixel();
  objc_msgSend(v17, "addLineToPoint:", v13, v15);
  [v17 stroke];
  v16 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v5, v7, v9, v11, 3.0);
  [v16 fill];
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  v16.receiver = self;
  v16.super_class = (Class)AXSpeechRateSliderTableCellTickSlider;
  -[AXSpeechRateSliderTableCellTickSlider thumbRectForBounds:trackRect:value:](&v16, "thumbRectForBounds:trackRect:value:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, LODWORD(a5));
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(AXSpeechRateSliderTableCellTickSlider *)self minimumValue];
  [(AXSpeechRateSliderTableCellTickSlider *)self maximumValue];
  [(AXSpeechRateSliderTableCellTickSlider *)self minimumValue];
  [(AXSpeechRateSliderTableCellTickSlider *)self _shouldReverseLayoutDirection];
  PSRoundToPixel();
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

@end