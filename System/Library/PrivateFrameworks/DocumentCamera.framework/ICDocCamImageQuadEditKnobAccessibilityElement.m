@interface ICDocCamImageQuadEditKnobAccessibilityElement
- (BOOL)accessibilityViewIsModal;
- (BOOL)isAccessibilityElement;
- (CALayer)knobLayer;
- (CGRect)accessibilityFrame;
- (ICDocCamImageQuadEditKnobAccessibilityElement)initWithKnobLayer:(id)a3 overlayView:(id)a4;
- (ICDocCamImageQuadEditOverlay)overlayView;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (void)setKnobLayer:(id)a3;
- (void)setOverlayView:(id)a3;
@end

@implementation ICDocCamImageQuadEditKnobAccessibilityElement

- (ICDocCamImageQuadEditKnobAccessibilityElement)initWithKnobLayer:(id)a3 overlayView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICDocCamImageQuadEditKnobAccessibilityElement;
  v8 = [(ICDocCamImageQuadEditKnobAccessibilityElement *)&v11 initWithAccessibilityContainer:v7];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_knobLayer, v6);
    objc_storeWeak((id *)&v9->_overlayView, v7);
  }

  return v9;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(ICDocCamImageQuadEditKnobAccessibilityElement *)self overlayView];
  v4 = [v3 accessibilityElements];

  if (![v4 count]) {
    goto LABEL_11;
  }
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  unint64_t v7 = 0;
  do
  {
    v8 = [v4 objectAtIndexedSubscript:v7];

    if (v8 != self)
    {
      [(ICDocCamImageQuadEditKnobAccessibilityElement *)self accessibilityFrame];
      double v10 = v9;
      objc_super v11 = [v4 objectAtIndexedSubscript:v7];
      [v11 accessibilityFrame];
      double v13 = v12;

      if (v10 > v13) {
        ++v5;
      }
      [(ICDocCamImageQuadEditKnobAccessibilityElement *)self accessibilityFrame];
      double v15 = v14;
      v16 = [v4 objectAtIndexedSubscript:v7];
      [v16 accessibilityFrame];
      double v18 = v17;

      if (v15 > v18) {
        ++v6;
      }
    }
    ++v7;
  }
  while (v7 < [v4 count]);
  if (v5 >= 2)
  {
    if (v6 > 1) {
      v19 = @"bottom-right crop handle";
    }
    else {
      v19 = @"top-right crop handle";
    }
  }
  else
  {
    if (v6 <= 1)
    {
LABEL_11:
      v19 = @"top-left crop handle";
      goto LABEL_16;
    }
    v19 = @"bottom-left crop handle";
  }
LABEL_16:
  v20 = +[DCLocalization localizedStringForKey:v19 value:v19 table:@"Localizable"];

  return v20;
}

- (id)accessibilityHint
{
  return +[DCLocalization localizedStringForKey:@"Double-tap and drag to adjust crop bounds." value:@"Double-tap and drag to adjust crop bounds." table:@"Localizable"];
}

- (CGRect)accessibilityFrame
{
  v2 = [(ICDocCamImageQuadEditKnobAccessibilityElement *)self knobLayer];
  [v2 accessibilityFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  double v11 = -CGRectGetWidth(v18);
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  double v12 = -CGRectGetHeight(v19);
  CGFloat v13 = v4;
  CGFloat v14 = v6;
  CGFloat v15 = v8;
  CGFloat v16 = v10;

  return CGRectInset(*(CGRect *)&v13, v11, v12);
}

- (CALayer)knobLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_knobLayer);

  return (CALayer *)WeakRetained;
}

- (void)setKnobLayer:(id)a3
{
}

- (ICDocCamImageQuadEditOverlay)overlayView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayView);

  return (ICDocCamImageQuadEditOverlay *)WeakRetained;
}

- (void)setOverlayView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overlayView);

  objc_destroyWeak((id *)&self->_knobLayer);
}

@end