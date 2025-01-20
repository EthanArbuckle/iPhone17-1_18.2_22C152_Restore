@interface PKSelectionModificationKnob
- (BOOL)isAccessibilityElement;
- (double)_knobTailWidth;
- (double)_rectForKnob;
- (double)distanceFromKnobCenterToPoint:(double)a3;
- (id)_updateKnobAppearance;
- (id)accessibilityIdentifier;
- (id)didBeginBrushSelection;
- (id)didEndBrushSelection;
- (id)setKnobColor:(id *)result;
- (void)dealloc;
- (void)layoutSublayers;
@end

@implementation PKSelectionModificationKnob

- (id)_updateKnobAppearance
{
  if (!result) {
    return result;
  }
  v1 = result;
  if (!*((unsigned char *)result + 48))
  {
    double v15 = -[PKSelectionModificationKnob _rectForKnob]((uint64_t)result);
    double v16 = v17;
    double v12 = v18;
    double v14 = v19;
    double v20 = -[PKSelectionModificationKnob _knobTailWidth]();
    [v1 bounds];
    double v22 = v21 + -1.0;
    double v23 = v20 * 0.5;
    id v24 = v1[7];
    double v25 = v20 * 0.5;
    if (*((unsigned char *)v1 + 49))
    {
      if (v24 == (id)1)
      {
LABEL_7:
        objc_msgSend(v1, "bounds", *(void *)&v20);
        double v27 = v26;
        [v1 bounds];
        double v3 = v28 * 0.5 - v25;
        double v29 = v23 + v22;
        double v4 = v27 * 0.5 - v23;
        double v33 = v29;
        double v2 = v32;
        goto LABEL_8;
      }
    }
    else if (!v24)
    {
      goto LABEL_7;
    }
    double v25 = v21 + -1.0;
    goto LABEL_7;
  }
  double v2 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  [result bounds];
  CGFloat x = v35.origin.x;
  CGFloat y = v35.origin.y;
  CGFloat width = v35.size.width;
  CGFloat height = v35.size.height;
  double MidX = CGRectGetMidX(v35);
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v36);
  [v1 bounds];
  double v12 = v11;
  [v1 bounds];
  double v14 = v13;
  double v15 = MidX - v12 * 0.5;
  double v16 = MidY - v13 * 0.5;
LABEL_8:
  [v1[4] setBackgroundColor:v1[8]];
  [v1[4] setCornerRadius:v12 * 0.5];
  objc_msgSend(v1[4], "setFrame:", v15, v16, v12, v14);
  [v1[5] setBackgroundColor:v1[8]];
  objc_msgSend(v1[5], "setFrame:", v4, v3, v2, v33);
  id v30 = v1[5];
  double v31 = -[PKSelectionModificationKnob _knobTailWidth]() * 0.5;

  return (id *)[v30 setCornerRadius:v31];
}

- (double)_knobTailWidth
{
  v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  double result = 3.5;
  if (v1 == 1) {
    return 4.0;
  }
  return result;
}

- (double)_rectForKnob
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 56);
    if (*(unsigned char *)(a1 + 49))
    {
      if (v2 == 1)
      {
LABEL_4:
        [(id)a1 bounds];
        [(id)a1 bounds];
        return 0.0;
      }
    }
    else if (!v2)
    {
      goto LABEL_4;
    }
    [(id)a1 bounds];
    [(id)a1 bounds];
    [(id)a1 bounds];
  }
  return 0.0;
}

- (id)setKnobColor:(id *)result
{
  if (result)
  {
    double v3 = result;
    double result = (id *)CGColorEqualToColor((CGColorRef)result[8], a2);
    if ((result & 1) == 0)
    {
      CGColorRelease((CGColorRef)v3[8]);
      v3[8] = CGColorRetain(a2);
      return -[PKSelectionModificationKnob _updateKnobAppearance](v3);
    }
  }
  return result;
}

- (void)layoutSublayers
{
  v3.receiver = self;
  v3.super_class = (Class)PKSelectionModificationKnob;
  [(PKSelectionModificationKnob *)&v3 layoutSublayers];
  -[PKSelectionModificationKnob _updateKnobAppearance]((id *)&self->super.super.isa);
}

- (void)dealloc
{
  CGColorRelease(self->_knobColor);
  v3.receiver = self;
  v3.super_class = (Class)PKSelectionModificationKnob;
  [(PKSelectionModificationKnob *)&v3 dealloc];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityIdentifier
{
  if (self->_knobLocation) {
    return @"com.apple.pencilkit.rightHalfPop";
  }
  else {
    return @"com.apple.pencilkit.leftHalfPop";
  }
}

- (double)distanceFromKnobCenterToPoint:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  v15.origin.CGFloat x = -[PKSelectionModificationKnob _rectForKnob]((uint64_t)a1);
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  double MidX = CGRectGetMidX(v15);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v16);
  [a1 frame];
  return sqrt((a3 - (MidY + v13)) * (a3 - (MidY + v13)) + (a2 - (MidX + v12)) * (a2 - (MidX + v12)));
}

- (id)didBeginBrushSelection
{
  if (result)
  {
    uint64_t v2 = result;
    LODWORD(a2) = 0.5;
    [result setOpacity:a2];
    [v2[5] setHidden:1];
    *((unsigned char *)v2 + 48) = 1;
    return -[PKSelectionModificationKnob _updateKnobAppearance](v2);
  }
  return result;
}

- (id)didEndBrushSelection
{
  if (result)
  {
    uint64_t v2 = result;
    LODWORD(a2) = 1.0;
    [result setOpacity:a2];
    [v2[5] setHidden:0];
    *((unsigned char *)v2 + 48) = 0;
    return -[PKSelectionModificationKnob _updateKnobAppearance](v2);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knobTailLayer, 0);

  objc_storeStrong((id *)&self->_knobLayer, 0);
}

@end