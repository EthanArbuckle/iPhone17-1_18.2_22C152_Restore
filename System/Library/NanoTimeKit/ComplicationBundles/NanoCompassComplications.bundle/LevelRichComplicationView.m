@interface LevelRichComplicationView
- (UIView)fixedBubbleView;
- (UIView)fixedOverlayView;
- (UIView)floatingBubbleView;
- (double)_magnitudeLevelThreshold;
- (double)_maxBubbleDeflection;
- (id)_newFixedBubbleView;
- (id)_newFixedOverlayView;
- (id)_newFloatingBubbleView;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
@end

@implementation LevelRichComplicationView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)LevelRichComplicationView;
  v3 = [(LevelRichComplicationView *)&v24 init];
  v7 = v3;
  if (v3)
  {
    v8 = objc_msgSend_floatingBubbleView(v3, v4, v5, v6);
    objc_msgSend_addSubview_(v7, v9, (uint64_t)v8, v10);

    v14 = objc_msgSend_fixedBubbleView(v7, v11, v12, v13);
    objc_msgSend_addSubview_(v7, v15, (uint64_t)v14, v16);

    v20 = objc_msgSend_fixedOverlayView(v7, v17, v18, v19);
    objc_msgSend_addSubview_(v7, v21, (uint64_t)v20, v22);
  }
  return v7;
}

- (UIView)fixedOverlayView
{
  fixedOverlayView = self->_fixedOverlayView;
  if (!fixedOverlayView)
  {
    uint64_t v6 = (UIView *)objc_msgSend__newFixedOverlayView(self, a2, v2, v3);
    v7 = self->_fixedOverlayView;
    self->_fixedOverlayView = v6;

    fixedOverlayView = self->_fixedOverlayView;
  }

  return fixedOverlayView;
}

- (UIView)fixedBubbleView
{
  fixedBubbleView = self->_fixedBubbleView;
  if (!fixedBubbleView)
  {
    uint64_t v6 = (UIView *)objc_msgSend__newFixedBubbleView(self, a2, v2, v3);
    v7 = self->_fixedBubbleView;
    self->_fixedBubbleView = v6;

    fixedBubbleView = self->_fixedBubbleView;
  }

  return fixedBubbleView;
}

- (UIView)floatingBubbleView
{
  floatingBubbleView = self->_floatingBubbleView;
  if (!floatingBubbleView)
  {
    uint64_t v6 = (UIView *)objc_msgSend__newFloatingBubbleView(self, a2, v2, v3);
    v7 = self->_floatingBubbleView;
    self->_floatingBubbleView = v6;

    floatingBubbleView = self->_floatingBubbleView;
  }

  return floatingBubbleView;
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v54 = a3;
  v8 = objc_msgSend_metadata(v54, v5, v6, v7);
  v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, @"incline", v10);

  v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v13, v14);
  int isEqual = objc_msgSend_isEqual_(v11, v16, (uint64_t)v15, v17);

  if (isEqual)
  {

    v11 = 0;
  }
  uint64_t v22 = objc_msgSend_metadata(v54, v19, v20, v21);
  v25 = objc_msgSend_objectForKeyedSubscript_(v22, v23, @"nodata", v24);
  int v29 = objc_msgSend_BOOLValue(v25, v26, v27, v28);

  if (!v11 || (objc_msgSend_hasReading(v11, v30, v31, v32) ^ 1 | v29) == 1)
  {
    objc_msgSend_setHidden_(self->_fixedBubbleView, v30, 1, v32);
    objc_msgSend_setHidden_(self->_floatingBubbleView, v34, 1, v35);
    goto LABEL_12;
  }
  if (objc_msgSend_orientation(v11, v30, v33, v32) != 1)
  {
    BOOL v48 = 1;
    goto LABEL_10;
  }
  objc_msgSend_horizontalOffset(v11, v36, v37, v38);
  double v40 = v39;
  double v42 = v41;
  double v43 = sqrt(v41 * v41 + v40 * v40);
  objc_msgSend__maxBubbleDeflection(self, v44, v45, v46);
  self->_floatingBubbleDeflection.dx = v40 * v47;
  self->_floatingBubbleDeflection.dy = v42 * v47;
  BOOL v48 = v43 < 0.100000001;
  if (v43 >= 0.100000001)
  {
LABEL_10:
    objc_msgSend_setHidden_(self->_fixedBubbleView, v36, 1, v38);
    goto LABEL_11;
  }
  objc_msgSend_setHidden_(self->_fixedBubbleView, v36, 0, v38);
LABEL_11:
  objc_msgSend_setHidden_(self->_floatingBubbleView, v49, v48, v50);
  objc_msgSend_setNeedsLayout(self, v51, v52, v53);
LABEL_12:
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)LevelRichComplicationView;
  [(LevelRichComplicationView *)&v19 layoutSubviews];
  objc_msgSend_bounds(self, v3, v4, v5);
  UIRectGetCenter();
  double v7 = v6;
  double v9 = v8;
  objc_msgSend_setCenter_(self->_fixedOverlayView, v10, v11, v12);
  objc_msgSend_setCenter_(self->_fixedBubbleView, v13, v14, v15, v7, v9);
  objc_msgSend_setCenter_(self->_floatingBubbleView, v16, v17, v18, v7 + self->_floatingBubbleDeflection.dx, v9 + self->_floatingBubbleDeflection.dy);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingBubbleView, 0);
  objc_storeStrong((id *)&self->_fixedBubbleView, 0);

  objc_storeStrong((id *)&self->_fixedOverlayView, 0);
}

- (id)_newFixedOverlayView
{
  return 0;
}

- (id)_newFixedBubbleView
{
  return 0;
}

- (id)_newFloatingBubbleView
{
  return 0;
}

- (double)_maxBubbleDeflection
{
  return 0.0;
}

- (double)_magnitudeLevelThreshold
{
  return 0.0;
}

@end