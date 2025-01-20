@interface NTKGalleonRadialLabelView
- ($F24F406B2B787EFB06265DBA3D28CBD5)paddingRange;
- (BOOL)rightSideUp;
- (NSArray)labels;
- (NTKGalleonRadialLabelView)initWithDialDiameter:(double)a3 rightSideUp:(BOOL)a4 labels:(id)a5 paddingRange:(id)a6;
- (double)diameter;
- (void)_positionLabels;
- (void)_setupImageLabels;
- (void)galleon_setProgress:(double)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation NTKGalleonRadialLabelView

- (NTKGalleonRadialLabelView)initWithDialDiameter:(double)a3 rightSideUp:(BOOL)a4 labels:(id)a5 paddingRange:(id)a6
{
  double var1 = a6.var1;
  double var0 = a6.var0;
  id v11 = a5;
  v37.receiver = self;
  v37.super_class = (Class)NTKGalleonRadialLabelView;
  v12 = -[NTKGalleonRadialLabelView initWithFrame:](&v37, sel_initWithFrame_, 0.0, 0.0, a3, a3);
  v16 = v12;
  if (v12)
  {
    v17 = objc_msgSend_layer(v12, v13, v14, v15);
    objc_msgSend_setContentsFormat_(v17, v18, *MEMORY[0x263F159C0], v19);
    uint64_t v23 = objc_msgSend_galleon_degreeFont(MEMORY[0x263EFD198], v20, v21, v22);
    labelFont = v16->_labelFont;
    v16->_labelFont = (CLKFont *)v23;

    v16->_diameter = a3;
    v16->_rightSideUp = a4;
    uint64_t v28 = objc_msgSend_copy(v11, v25, v26, v27);
    labels = v16->_labels;
    v16->_labels = (NSArray *)v28;

    v16->_paddingRange.minimum = var0;
    v16->_paddingRange.maximum = var1;
    objc_msgSend_tintColorDidChange(v16, v30, v31, v32);
    objc_msgSend__setupImageLabels(v16, v33, v34, v35);
  }
  return v16;
}

- (void)tintColorDidChange
{
  v5 = objc_msgSend_tintColor(self, a2, v2, v3);
  v9 = objc_msgSend_layer(self, v6, v7, v8);
  id v16 = v5;
  uint64_t v13 = objc_msgSend_CGColor(v16, v10, v11, v12);
  objc_msgSend_setContentsMultiplyColor_(v9, v14, v13, v15);
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)NTKGalleonRadialLabelView;
  [(NTKGalleonRadialLabelView *)&v20 layoutSubviews];
  objc_msgSend_bounds(self, v3, v4, v5);
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v14 = NTKGalleonFloatRangePercentageValue(self->_paddingRange.minimum, self->_paddingRange.maximum, self->_progress);
  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  BOOL v15 = CGRectEqualToRect(v21, self->_layoutFrame);
  char v16 = CLKFloatEqualsFloat();
  if (!v15 || (v16 & 1) == 0)
  {
    self->_layoutFrame.origin.x = v7;
    self->_layoutFrame.origin.y = v9;
    self->_layoutFrame.size.width = v11;
    self->_layoutFrame.size.height = v13;
    self->_layoutPadding = v14;
    objc_msgSend__positionLabels(self, v17, v18, v19);
  }
}

- (void)galleon_setProgress:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_progress = a3;
    objc_msgSend_setNeedsLayout(self, v5, v6, v7);
  }
}

- (void)_setupImageLabels
{
  uint64_t v3 = self->_labelFont;
  labels = self->_labels;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_246B41248;
  v9[3] = &unk_2651F8ED8;
  v9[4] = self;
  double v10 = v3;
  uint64_t v5 = v3;
  uint64_t v6 = labels;
  objc_msgSend_enumerateObjectsUsingBlock_(v6, v7, (uint64_t)v9, v8);
}

- (void)_positionLabels
{
  objc_msgSend_capHeight(self->_labelFont, a2, v2, v3);
  uint64_t v6 = v5;
  double diameter = self->_diameter;
  double v8 = NTKGalleonFloatRangePercentageValue(self->_paddingRange.minimum, self->_paddingRange.maximum, self->_progress);
  BOOL rightSideUp = self->_rightSideUp;
  CGFloat v13 = objc_msgSend_subviews(self, v10, v11, v12);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_246B41400;
  v16[3] = &unk_2651F8EF8;
  *(double *)&v16[4] = diameter;
  *(double *)&v16[5] = diameter * 0.5;
  *(double *)&v16[6] = diameter * 0.5;
  v16[7] = v6;
  *(double *)&v16[8] = v8;
  BOOL v17 = rightSideUp;
  objc_msgSend_enumerateObjectsUsingBlock_(v13, v14, (uint64_t)v16, v15);
}

- (double)diameter
{
  return self->_diameter;
}

- (BOOL)rightSideUp
{
  return self->_rightSideUp;
}

- (NSArray)labels
{
  return self->_labels;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)paddingRange
{
  double minimum = self->_paddingRange.minimum;
  double maximum = self->_paddingRange.maximum;
  result.double var1 = maximum;
  result.double var0 = minimum;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);

  objc_storeStrong((id *)&self->_labelFont, 0);
}

@end