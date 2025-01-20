@interface AXElementNamesItemView
- (AXElementNamesItemView)initWithName:(id)a3 elementFrame:(CGRect)a4 availableBounds:(CGRect)a5 styleProvider:(id)a6 isSpacer:(BOOL)a7;
- (BOOL)_arrowPointsDown;
- (BOOL)_shouldAllowLongArrows;
- (BOOL)_usesArrow;
- (BOOL)_usesExtendedArrow;
- (BOOL)collidesWithView:(id)a3;
- (BOOL)isSpacer;
- (CGPoint)arrowTipLocation;
- (CGRect)_collisionFrameForArrow;
- (CGRect)_elementFrameAdjustedForBounds;
- (CGRect)_validateLabelContainerFrame:(CGRect)a3;
- (CGRect)availableBounds;
- (CGRect)elementFrame;
- (CGRect)labelContainerFrame;
- (CGSize)forcedLabelContainerSize;
- (CGSize)labelContainerSize;
- (NSString)name;
- (double)_arrowHeight;
- (double)_cornerRadius;
- (double)_outlineWidth;
- (id)_newBackgroundImage;
- (int64_t)labelPosition;
- (void)_updateFromLabelContainerFrame;
- (void)_updateFromMainProperties;
- (void)_updateLabelContainerSize;
- (void)layoutSubviews;
- (void)setArrowTipLocation:(CGPoint)a3;
- (void)setForcedLabelContainerSize:(CGSize)a3;
- (void)setIsSpacer:(BOOL)a3;
- (void)setLabelContainerFrame:(CGRect)a3;
- (void)setLabelContainerSize:(CGSize)a3;
- (void)setLabelPosition:(int64_t)a3;
@end

@implementation AXElementNamesItemView

- (AXElementNamesItemView)initWithName:(id)a3 elementFrame:(CGRect)a4 availableBounds:(CGRect)a5 styleProvider:(id)a6 isSpacer:(BOOL)a7
{
  BOOL v7 = a7;
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v13 = a4.size.height;
  CGFloat v14 = a4.size.width;
  CGFloat v15 = a4.origin.y;
  CGFloat v16 = a4.origin.x;
  id v18 = a3;
  id v19 = a6;
  v34.receiver = self;
  v34.super_class = (Class)AXElementNamesItemView;
  v20 = -[AXElementNamesItemView initWithFrame:](&v34, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v20)
  {
    v21 = [v19 itemBackgroundViewCreationHandler];

    if (v21)
    {
      v22 = [v19 itemBackgroundViewCreationHandler];
      uint64_t v23 = v22[2]();
    }
    else
    {
      id v24 = objc_alloc(MEMORY[0x1E4FB1F00]);
      v22 = [MEMORY[0x1E4FB14C8] effectWithStyle:2];
      uint64_t v23 = [v24 initWithEffect:v22];
    }
    backgroundView = v20->_backgroundView;
    v20->_backgroundView = (UIView *)v23;

    [(AXElementNamesItemView *)v20 addSubview:v20->_backgroundView];
    uint64_t v26 = objc_opt_new();
    backgroundMaskView = v20->_backgroundMaskView;
    v20->_backgroundMaskView = (UIImageView *)v26;

    v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v20->_label;
    v20->_label = v28;

    v30 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [(UILabel *)v20->_label setFont:v30];

    [(UILabel *)v20->_label setAdjustsFontForContentSizeCategory:1];
    v31 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v20->_label setTextColor:v31];

    [(UILabel *)v20->_label setTextAlignment:1];
    [(AXElementNamesItemView *)v20 addSubview:v20->_label];
    uint64_t v32 = 4;
    if (!v7) {
      uint64_t v32 = 0;
    }
    v20->_labelPosition = v32;
    [(UILabel *)v20->_label setText:v18];
    v20->_elementFrame.origin.CGFloat x = v16;
    v20->_elementFrame.origin.CGFloat y = v15;
    v20->_elementFrame.size.CGFloat width = v14;
    v20->_elementFrame.size.CGFloat height = v13;
    v20->_availableBounds.origin.CGFloat x = x;
    v20->_availableBounds.origin.CGFloat y = y;
    v20->_availableBounds.size.CGFloat width = width;
    v20->_availableBounds.size.CGFloat height = height;
    v20->_isSpacer = v7;
    [(AXElementNamesItemView *)v20 _updateLabelContainerSize];
    [(AXElementNamesItemView *)v20 _updateFromMainProperties];
  }

  return v20;
}

- (NSString)name
{
  return [(UILabel *)self->_label text];
}

- (void)setLabelPosition:(int64_t)a3
{
  if (self->_labelPosition != a3)
  {
    self->_labelPosition = a3;
    [(AXElementNamesItemView *)self _updateFromMainProperties];
  }
}

- (void)setForcedLabelContainerSize:(CGSize)a3
{
  if (self->_forcedLabelContainerSize.width != a3.width || self->_forcedLabelContainerSize.height != a3.height)
  {
    self->_forcedLabelContainerSize = a3;
    [(AXElementNamesItemView *)self _updateLabelContainerSize];
    [(AXElementNamesItemView *)self _updateFromMainProperties];
  }
}

- (void)setLabelContainerFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_labelContainerFrame = &self->_labelContainerFrame;
  if (!CGRectEqualToRect(self->_labelContainerFrame, a3))
  {
    p_labelContainerFrame->origin.CGFloat x = x;
    p_labelContainerFrame->origin.CGFloat y = y;
    p_labelContainerFrame->size.CGFloat width = width;
    p_labelContainerFrame->size.CGFloat height = height;
    [(AXElementNamesItemView *)self _updateFromLabelContainerFrame];
  }
}

- (BOOL)collidesWithView:(id)a3
{
  id v4 = a3;
  [(AXElementNamesItemView *)self labelContainerFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 labelContainerFrame];
  v51.origin.CGFloat x = v13;
  v51.origin.CGFloat y = v14;
  v51.size.CGFloat width = v15;
  v51.size.CGFloat height = v16;
  v43.origin.CGFloat x = v6;
  v43.origin.CGFloat y = v8;
  v43.size.CGFloat width = v10;
  v43.size.CGFloat height = v12;
  if (CGRectIntersectsRect(v43, v51)) {
    goto LABEL_2;
  }
  [(AXElementNamesItemView *)self _collisionFrameForArrow];
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  [v4 _collisionFrameForArrow];
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  v44.origin.CGFloat x = v20;
  v44.origin.CGFloat y = v22;
  v44.size.CGFloat width = v24;
  v44.size.CGFloat height = v26;
  if (!CGRectIsNull(v44))
  {
    v45.origin.CGFloat x = v28;
    v45.origin.CGFloat y = v30;
    v45.size.CGFloat width = v32;
    v45.size.CGFloat height = v34;
    if (!CGRectIsNull(v45))
    {
      v46.origin.CGFloat x = v20;
      v46.origin.CGFloat y = v22;
      v46.size.CGFloat width = v24;
      v46.size.CGFloat height = v26;
      v52.origin.CGFloat x = v28;
      v52.origin.CGFloat y = v30;
      v52.size.CGFloat width = v32;
      v52.size.CGFloat height = v34;
      if (CGRectIntersectsRect(v46, v52)) {
        goto LABEL_2;
      }
    }
  }
  v47.origin.CGFloat x = v20;
  v47.origin.CGFloat y = v22;
  v47.size.CGFloat width = v24;
  v47.size.CGFloat height = v26;
  if (CGRectIsNull(v47)) {
    goto LABEL_9;
  }
  [v4 labelContainerFrame];
  v53.origin.CGFloat x = v35;
  v53.origin.CGFloat y = v36;
  v53.size.CGFloat width = v37;
  v53.size.CGFloat height = v38;
  v48.origin.CGFloat x = v20;
  v48.origin.CGFloat y = v22;
  v48.size.CGFloat width = v24;
  v48.size.CGFloat height = v26;
  if (CGRectIntersectsRect(v48, v53))
  {
LABEL_2:
    BOOL v17 = 1;
  }
  else
  {
LABEL_9:
    v49.origin.CGFloat x = v28;
    v49.origin.CGFloat y = v30;
    v49.size.CGFloat width = v32;
    v49.size.CGFloat height = v34;
    if (CGRectIsNull(v49))
    {
      BOOL v17 = 0;
    }
    else
    {
      [(AXElementNamesItemView *)self labelContainerFrame];
      v54.origin.CGFloat x = v39;
      v54.origin.CGFloat y = v40;
      v54.size.CGFloat width = v41;
      v54.size.CGFloat height = v42;
      v50.origin.CGFloat x = v28;
      v50.origin.CGFloat y = v30;
      v50.size.CGFloat width = v32;
      v50.size.CGFloat height = v34;
      BOOL v17 = CGRectIntersectsRect(v50, v54);
    }
  }

  return v17;
}

- (CGRect)_collisionFrameForArrow
{
  if ([(AXElementNamesItemView *)self _usesArrow])
  {
    [(AXElementNamesItemView *)self arrowTipLocation];
    double v4 = v3;
    double v6 = v5 + -15.0;
    if ([(AXElementNamesItemView *)self _arrowPointsDown]) {
      double v7 = v4 + -9.0;
    }
    else {
      double v7 = v4;
    }
    double v8 = 15.0;
    double v9 = 9.0;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB20];
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v10 = v6;
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v10;
  return result;
}

- (CGRect)_elementFrameAdjustedForBounds
{
  if ([(AXElementNamesItemView *)self isSpacer])
  {
    [(AXElementNamesItemView *)self elementFrame];
  }
  else
  {
    [(AXElementNamesItemView *)self availableBounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [(AXElementNamesItemView *)self elementFrame];
    v21.origin.CGFloat x = v15;
    v21.origin.CGFloat y = v16;
    v21.size.CGFloat width = v17;
    v21.size.CGFloat height = v18;
    v19.origin.CGFloat x = v8;
    v19.origin.CGFloat y = v10;
    v19.size.CGFloat width = v12;
    v19.size.CGFloat height = v14;
    *(CGRect *)&CGFloat v3 = CGRectIntersection(v19, v21);
  }
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (void)_updateLabelContainerSize
{
  [(AXElementNamesItemView *)self forcedLabelContainerSize];
  label = self->_label;
  if (v5 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [(UILabel *)label sizeToFit];
    [(UILabel *)self->_label frame];
    double v16 = CGRectGetWidth(v18) + 10.0;
    [(UILabel *)self->_label frame];
    double v14 = CGRectGetHeight(v19) + 6.0;
  }
  else
  {
    [(UILabel *)label frame];
    double v8 = v7;
    double v10 = v9;
    [(AXElementNamesItemView *)self forcedLabelContainerSize];
    double v12 = v11 + -10.0;
    [(AXElementNamesItemView *)self forcedLabelContainerSize];
    -[UILabel setFrame:](self->_label, "setFrame:", v8, v10, v12, v13 + -6.0);
    [(AXElementNamesItemView *)self forcedLabelContainerSize];
    double v16 = v15;
  }
  -[AXElementNamesItemView setLabelContainerSize:](self, "setLabelContainerSize:", v16, v14);
}

- (BOOL)_shouldAllowLongArrows
{
  return 1;
}

- (CGRect)_validateLabelContainerFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(AXElementNamesItemView *)self isSpacer]) {
    goto LABEL_28;
  }
  if (![(AXElementNamesItemView *)self _shouldAllowLongArrows]
    && [(AXElementNamesItemView *)self _usesExtendedArrow])
  {
    double x = *MEMORY[0x1E4F1DB28];
    double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    goto LABEL_28;
  }
  [(AXElementNamesItemView *)self availableBounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v12 = width;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  v42.origin.double x = x;
  v42.origin.double y = y;
  CGFloat v38 = v12;
  v42.size.double width = v12;
  v42.size.double height = height;
  double MinY = CGRectGetMinY(v42);
  CGFloat v40 = v9;
  CGFloat rect = v14;
  v43.origin.double x = v9;
  v43.origin.double y = v11;
  v43.size.double width = v14;
  v43.size.double height = v16;
  if (MinY >= CGRectGetMinY(v43)) {
    goto LABEL_8;
  }
  if ([(AXElementNamesItemView *)self labelPosition] == 4)
  {
    v44.origin.double x = v9;
    v44.size.double width = v14;
    v44.origin.double y = v11;
    v44.size.double height = v16;
    double y = CGRectGetMinY(v44);
LABEL_8:
    double width = v38;
    goto LABEL_10;
  }
  double x = *MEMORY[0x1E4F1DB28];
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_10:
  v45.origin.double x = x;
  v45.origin.double y = y;
  v45.size.double width = width;
  v45.size.double height = height;
  double MaxY = CGRectGetMaxY(v45);
  v46.origin.double x = v9;
  v46.size.double width = rect;
  v46.origin.double y = v11;
  v46.size.double height = v16;
  CGFloat v36 = v11;
  CGFloat v37 = v16;
  if (MaxY <= CGRectGetMaxY(v46))
  {
LABEL_13:
    CGFloat v19 = height;
    goto LABEL_15;
  }
  if ([(AXElementNamesItemView *)self labelPosition] == 4)
  {
    v47.origin.double x = v9;
    v47.size.double width = rect;
    v47.origin.double y = v11;
    v47.size.double height = v16;
    double y = CGRectGetMaxY(v47) - height;
    goto LABEL_13;
  }
  double x = *MEMORY[0x1E4F1DB28];
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_15:
  uint64_t v20 = *MEMORY[0x1E4F1DB28];
  CGFloat v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v23 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v48.origin.double x = x;
  v48.origin.double y = y;
  v48.size.double width = width;
  v48.size.double height = v19;
  v63.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v63.origin.double y = v21;
  v63.size.double width = v23;
  v63.size.double height = v22;
  if (CGRectEqualToRect(v48, v63))
  {
    double height = v19;
  }
  else
  {
    CGFloat v33 = v22;
    CGFloat v39 = v23;
    v49.origin.double x = x;
    v49.origin.double y = y;
    v49.size.double width = width;
    v49.size.double height = v19;
    CGFloat v24 = CGRectGetHeight(v49);
    v50.size.double width = rect;
    double v25 = v24;
    v50.origin.double x = v40;
    v50.origin.double y = v36;
    v50.size.double height = v37;
    if (v25 > CGRectGetHeight(v50))
    {
      v51.origin.double x = v40;
      v51.origin.double y = v36;
      v51.size.double width = rect;
      v51.size.double height = v37;
      CGFloat v19 = CGRectGetHeight(v51);
    }
    v52.origin.double x = x;
    v52.origin.double y = y;
    v52.size.double width = width;
    v52.size.double height = v19;
    double v26 = CGRectGetWidth(v52);
    v53.origin.double x = v40;
    v53.origin.double y = v36;
    v53.size.double width = rect;
    v53.size.double height = v37;
    if (v26 > CGRectGetWidth(v53))
    {
      v54.origin.double x = v40;
      v54.origin.double y = v36;
      v54.size.double width = rect;
      v54.size.double height = v37;
      double width = CGRectGetWidth(v54);
    }
    v55.origin.double x = x;
    v55.origin.double y = y;
    v55.size.double width = width;
    v55.size.double height = v19;
    double MinX = CGRectGetMinX(v55);
    v56.origin.double x = v40;
    v56.origin.double y = v36;
    v56.size.double width = rect;
    v56.size.double height = v37;
    if (MinX < CGRectGetMinX(v56))
    {
      v57.origin.double x = v40;
      v57.origin.double y = v36;
      v57.size.double width = rect;
      v57.size.double height = v37;
      double x = CGRectGetMinX(v57);
    }
    v58.origin.double x = x;
    v58.origin.double y = y;
    v58.size.double width = width;
    double height = v19;
    v58.size.double height = v19;
    double MaxX = CGRectGetMaxX(v58);
    v59.size.double height = v37;
    v59.origin.double x = v40;
    v59.origin.double y = v36;
    v59.size.double width = rect;
    if (MaxX > CGRectGetMaxX(v59))
    {
      v60.origin.double x = v40;
      v60.origin.double y = v36;
      v60.size.double width = rect;
      v60.size.double height = v37;
      double x = CGRectGetMaxX(v60) - width;
    }
    if ([(AXElementNamesItemView *)self labelPosition] == 5)
    {
      [(AXElementNamesItemView *)self elementFrame];
      v64.origin.double x = x;
      v64.origin.double y = y;
      v64.size.double width = width;
      v64.size.double height = v19;
      if (!CGRectContainsRect(v61, v64))
      {
        double height = v34;
        double x = v35;
        double width = v39;
        double y = v21;
      }
    }
  }
LABEL_28:
  double v29 = x;
  double v30 = y;
  double v31 = width;
  double v32 = height;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (void)_updateFromMainProperties
{
  [(AXElementNamesItemView *)self _elementFrameAdjustedForBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  unint64_t v11 = [(AXElementNamesItemView *)self labelPosition];
  if (v11 <= 5)
  {
    if (((1 << v11) & 3) != 0)
    {
      v41.origin.double x = v4;
      v41.origin.double y = v6;
      v41.size.double width = v8;
      v41.size.double height = v10;
      double v16 = CGRectGetMinY(v41) + 15.0;
      v42.origin.double x = v4;
      v42.origin.double y = v6;
      v42.size.double width = v8;
      v42.size.double height = v10;
      double MidX = CGRectGetMidX(v42);
      [(AXElementNamesItemView *)self labelContainerSize];
      double v38 = MidX + v22 * -0.5;
      [(AXElementNamesItemView *)self _arrowHeight];
      double v24 = v16 - v23;
      [(AXElementNamesItemView *)self labelContainerSize];
      double v20 = v24 - v25;
    }
    else
    {
      CGFloat v12 = v4;
      CGFloat v13 = v6;
      CGFloat v14 = v8;
      CGFloat v15 = v10;
      if (((1 << v11) & 0xC) == 0)
      {
        double v31 = CGRectGetMidX(*(CGRect *)&v12);
        [(AXElementNamesItemView *)self labelContainerSize];
        double v38 = v31 - v32 * 0.5;
        v44.origin.double x = v4;
        v44.origin.double y = v6;
        v44.size.double width = v8;
        v44.size.double height = v10;
        double MidY = CGRectGetMidY(v44);
        [(AXElementNamesItemView *)self labelContainerSize];
        double v20 = MidY - v34 * 0.5;
        [(AXElementNamesItemView *)self labelContainerSize];
        double v27 = v35;
        [(AXElementNamesItemView *)self labelContainerSize];
        double v29 = v36;
        double v30 = *MEMORY[0x1E4F1DAD8];
        double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        goto LABEL_8;
      }
      double v16 = CGRectGetMaxY(*(CGRect *)&v12) + -15.0;
      v40.origin.double x = v4;
      v40.origin.double y = v6;
      v40.size.double width = v8;
      v40.size.double height = v10;
      double v17 = CGRectGetMidX(v40);
      [(AXElementNamesItemView *)self labelContainerSize];
      double v38 = v17 + v18 * -0.5;
      [(AXElementNamesItemView *)self _arrowHeight];
      double v20 = v16 + v19;
    }
    [(AXElementNamesItemView *)self labelContainerSize];
    double v27 = v26;
    [(AXElementNamesItemView *)self labelContainerSize];
    double v29 = v28;
    v43.origin.double x = v4;
    v43.origin.double y = v6;
    v43.size.double width = v8;
    v43.size.double height = v10;
    double v30 = CGRectGetMidX(v43);
LABEL_8:
    -[AXElementNamesItemView setArrowTipLocation:](self, "setArrowTipLocation:", v30, v16);
    double v37 = v38;
    goto LABEL_9;
  }
  double v29 = 0.0;
  double v27 = 0.0;
  double v20 = 0.0;
  double v37 = 0.0;
LABEL_9:
  -[AXElementNamesItemView _validateLabelContainerFrame:](self, "_validateLabelContainerFrame:", v37, v20, v27, v29);
  -[AXElementNamesItemView setLabelContainerFrame:](self, "setLabelContainerFrame:");
  [(AXElementNamesItemView *)self labelContainerFrame];
  if (!CGRectEqualToRect(v45, *MEMORY[0x1E4F1DB28]))
  {
    [(AXElementNamesItemView *)self _updateFromLabelContainerFrame];
  }
}

- (void)_updateFromLabelContainerFrame
{
  [(AXElementNamesItemView *)self labelContainerFrame];
  double x = v3;
  double y = v5;
  double width = v7;
  double height = v9;
  if ([(AXElementNamesItemView *)self _usesArrow])
  {
    [(AXElementNamesItemView *)self _outlineWidth];
    double v12 = v11 + v11;
    BOOL v13 = [(AXElementNamesItemView *)self _arrowPointsDown];
    [(AXElementNamesItemView *)self arrowTipLocation];
    double v15 = v14;
    if (v13)
    {
      [(AXElementNamesItemView *)self arrowTipLocation];
      double v17 = v16;
    }
    else
    {
      double v15 = v14 - v12;
      [(AXElementNamesItemView *)self arrowTipLocation];
      double v17 = v18 - v12;
    }
    [(AXElementNamesItemView *)self labelContainerFrame];
    v22.origin.double x = v15;
    v22.origin.double y = v17;
    v22.size.double width = v12;
    v22.size.double height = v12;
    CGRect v21 = CGRectUnion(v20, v22);
    double x = v21.origin.x;
    double y = v21.origin.y;
    double width = v21.size.width;
    double height = v21.size.height;
  }
  -[AXElementNamesItemView setFrame:](self, "setFrame:", x, y, width, height);
  [(AXElementNamesItemView *)self setNeedsLayout];
}

- (BOOL)_arrowPointsDown
{
  return ![(AXElementNamesItemView *)self labelPosition]
      || [(AXElementNamesItemView *)self labelPosition] == 1;
}

- (BOOL)_usesArrow
{
  return [(AXElementNamesItemView *)self labelPosition] != 5
      && [(AXElementNamesItemView *)self labelPosition] != 4;
}

- (BOOL)_usesExtendedArrow
{
  int64_t v3 = [(AXElementNamesItemView *)self labelPosition];
  if (v3 != 1) {
    LOBYTE(v3) = [(AXElementNamesItemView *)self labelPosition] == 3;
  }
  return v3;
}

- (double)_arrowHeight
{
  BOOL v3 = [(AXElementNamesItemView *)self _usesExtendedArrow];
  double result = 9.0;
  if (v3)
  {
    [(AXElementNamesItemView *)self labelContainerSize];
    return v5 + 5.0 + 9.0;
  }
  return result;
}

- (double)_cornerRadius
{
  v2 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB2950]];
  [v2 scaledValueForValue:5.0];
  double v4 = v3;

  return v4;
}

- (double)_outlineWidth
{
  return 0.0;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)AXElementNamesItemView;
  [(AXElementNamesItemView *)&v11 layoutSubviews];
  [(AXElementNamesItemView *)self labelContainerFrame];
  CGRect v13 = CGRectInset(v12, 5.0, 3.0);
  double x = v13.origin.x;
  double y = v13.origin.y;
  double width = v13.size.width;
  double height = v13.size.height;
  [(AXElementNamesItemView *)self frame];
  double v8 = x - v7;
  [(AXElementNamesItemView *)self frame];
  -[UILabel setFrame:](self->_label, "setFrame:", v8, y - v9, width, height);
  [(AXElementNamesItemView *)self bounds];
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  id v10 = [(AXElementNamesItemView *)self _newBackgroundImage];
  [(UIImageView *)self->_backgroundMaskView setImage:v10];

  [(AXElementNamesItemView *)self bounds];
  -[UIImageView setFrame:](self->_backgroundMaskView, "setFrame:");
  [(UIView *)self->_backgroundView setMaskView:self->_backgroundMaskView];
}

- (id)_newBackgroundImage
{
  [(AXElementNamesItemView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 scale];
  CGFloat v9 = v8;
  v73.double width = v4;
  v73.double height = v6;
  UIGraphicsBeginImageContextWithOptions(v73, 0, v9);

  [(AXElementNamesItemView *)self labelContainerFrame];
  double v11 = v10;
  double v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [(AXElementNamesItemView *)self frame];
  CGFloat v19 = v11 - v18;
  [(AXElementNamesItemView *)self frame];
  CGFloat v21 = v13 - v20;
  [(AXElementNamesItemView *)self arrowTipLocation];
  double v67 = v22;
  double v69 = v23;
  [(AXElementNamesItemView *)self frame];
  double v66 = v24;
  [(AXElementNamesItemView *)self frame];
  double v26 = v25;
  [(AXElementNamesItemView *)self _cornerRadius];
  double v28 = v27;
  [(AXElementNamesItemView *)self _outlineWidth];
  CGFloat v30 = v29;
  double v31 = v29 + v29;
  double v32 = (void *)MEMORY[0x1E4FB14C0];
  CGFloat v71 = v19;
  CGFloat v72 = v15;
  v74.origin.double x = v19;
  CGFloat v33 = v21;
  v74.origin.double y = v21;
  v74.size.double width = v15;
  CGFloat v34 = v17;
  v74.size.double height = v17;
  CGRect v75 = CGRectInset(v74, v30, v30);
  double v35 = objc_msgSend(v32, "bezierPathWithRoundedRect:cornerRadius:", v75.origin.x, v75.origin.y, v75.size.width, v75.size.height, v28);
  [v35 setLineWidth:v31];
  if ([(AXElementNamesItemView *)self _usesArrow])
  {
    double v65 = v28;
    double v36 = v67 - v66;
    double v37 = v69 - v26;
    BOOL v38 = [(AXElementNamesItemView *)self _usesExtendedArrow];
    if (v38) {
      double v39 = 6.0;
    }
    else {
      double v39 = 15.0;
    }
    CGRect v40 = [MEMORY[0x1E4FB14C0] bezierPath];
    [v40 setLineWidth:v31];
    BOOL v41 = [(AXElementNamesItemView *)self _arrowPointsDown];
    BOOL v42 = v41;
    double v43 = 9.0;
    if (v41) {
      double v43 = -9.0;
    }
    double v70 = v37 + v43;
    double v44 = 4.0 / fabs((v37 + v43 - v37) / (v36 + 7.5 - v36));
    double v45 = -4.0;
    if (!v41) {
      double v45 = 4.0;
    }
    double v46 = v37 + v45;
    double v47 = v36 - v44;
    objc_msgSend(v40, "moveToPoint:", v36 + v44, v37 + v45);
    objc_msgSend(v40, "addQuadCurveToPoint:controlPoint:", v47, v46, v36, v37);
    CGFloat v48 = v71;
    CGFloat v49 = v33;
    CGFloat v50 = v72;
    CGFloat v51 = v34;
    if (v42) {
      double v52 = CGRectGetMaxY(*(CGRect *)&v48) - v30;
    }
    else {
      double v52 = v30 + CGRectGetMinY(*(CGRect *)&v48);
    }
    double v68 = v52;
    v76.origin.double x = v71;
    v76.origin.double y = v33;
    v76.size.double width = v72;
    v76.size.double height = v34;
    double v53 = v30 + v65 + CGRectGetMinX(v76);
    CGFloat v54 = v34;
    if (v36 + v39 * -0.5 >= v53) {
      double v55 = v36 + v39 * -0.5;
    }
    else {
      double v55 = v53;
    }
    double v56 = v39 + v55;
    CGFloat v57 = v71;
    CGFloat v58 = v33;
    CGFloat v59 = v72;
    double v60 = CGRectGetMaxX(*(CGRect *)(&v54 - 3)) - v65 - v30;
    if (v39 + v55 >= v60) {
      double v56 = v60;
    }
    if (v38)
    {
      objc_msgSend(v40, "addLineToPoint:", v36 + -7.5, v70);
      objc_msgSend(v40, "addLineToPoint:", v55, v70);
    }
    objc_msgSend(v40, "addLineToPoint:", v55, v68);
    objc_msgSend(v40, "addLineToPoint:", v56, v68);
    if (v38)
    {
      objc_msgSend(v40, "addLineToPoint:", v56, v70);
      objc_msgSend(v40, "addLineToPoint:", v36 + 7.5, v70);
    }
    [v40 closePath];
  }
  else
  {
    CGRect v40 = 0;
  }
  CGRect v61 = [MEMORY[0x1E4FB1618] whiteColor];
  [v61 set];

  [v35 stroke];
  [v40 stroke];
  v62 = [MEMORY[0x1E4FB1618] blackColor];
  [v62 set];

  [v35 fill];
  [v40 fill];
  CGRect v63 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v63;
}

- (CGRect)elementFrame
{
  double x = self->_elementFrame.origin.x;
  double y = self->_elementFrame.origin.y;
  double width = self->_elementFrame.size.width;
  double height = self->_elementFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)availableBounds
{
  double x = self->_availableBounds.origin.x;
  double y = self->_availableBounds.origin.y;
  double width = self->_availableBounds.size.width;
  double height = self->_availableBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)labelPosition
{
  return self->_labelPosition;
}

- (BOOL)isSpacer
{
  return self->_isSpacer;
}

- (void)setIsSpacer:(BOOL)a3
{
  self->_isSpacer = a3;
}

- (CGRect)labelContainerFrame
{
  double x = self->_labelContainerFrame.origin.x;
  double y = self->_labelContainerFrame.origin.y;
  double width = self->_labelContainerFrame.size.width;
  double height = self->_labelContainerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)forcedLabelContainerSize
{
  double width = self->_forcedLabelContainerSize.width;
  double height = self->_forcedLabelContainerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)labelContainerSize
{
  double width = self->_labelContainerSize.width;
  double height = self->_labelContainerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLabelContainerSize:(CGSize)a3
{
  self->_labelContainerSize = a3;
}

- (CGPoint)arrowTipLocation
{
  double x = self->_arrowTipLocation.x;
  double y = self->_arrowTipLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setArrowTipLocation:(CGPoint)a3
{
  self->_arrowTipLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundMaskView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end