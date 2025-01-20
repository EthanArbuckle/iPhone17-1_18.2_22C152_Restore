@interface HUGridHeadlineCellLayoutOptions
+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3;
+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3 viewSizeSubclass:(int64_t)a4 viewWidth:(double)a5 containerLeadingMargin:(double)a6 containerTrailingMargin:(double)a7;
- (BOOL)isEditing;
- (double)cellInnerMargin;
- (double)containerLeadingMargin;
- (double)containerTrailingMargin;
- (double)editingBackgroundHeight;
- (double)editingBackgroundMinimumWidth;
- (double)headlineBaselineOffset;
- (double)minimumFontSize;
- (double)viewWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)viewSizeSubclass;
- (void)setEditing:(BOOL)a3;
- (void)setEditingBackgroundHeight:(double)a3;
- (void)setHeadlineBaselineOffset:(double)a3;
- (void)setMinimumFontSize:(double)a3;
@end

@implementation HUGridHeadlineCellLayoutOptions

- (double)cellInnerMargin
{
  BOOL v2 = [(HUGridHeadlineCellLayoutOptions *)self isEditing];
  double result = 0.0;
  if (v2) {
    return 14.0;
  }
  return result;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUGridHeadlineCellLayoutOptions;
  v4 = [(HUGridCellLayoutOptions *)&v9 copyWithZone:a3];
  v4[20] = [(HUGridHeadlineCellLayoutOptions *)self viewSizeSubclass];
  [(HUGridHeadlineCellLayoutOptions *)self viewWidth];
  v4[21] = v5;
  [(HUGridHeadlineCellLayoutOptions *)self containerLeadingMargin];
  v4[22] = v6;
  [(HUGridHeadlineCellLayoutOptions *)self containerTrailingMargin];
  v4[23] = v7;
  [(HUGridHeadlineCellLayoutOptions *)self minimumFontSize];
  objc_msgSend(v4, "setMinimumFontSize:");
  [(HUGridHeadlineCellLayoutOptions *)self headlineBaselineOffset];
  objc_msgSend(v4, "setHeadlineBaselineOffset:");
  [(HUGridHeadlineCellLayoutOptions *)self editingBackgroundHeight];
  objc_msgSend(v4, "setEditingBackgroundHeight:");
  return v4;
}

- (double)viewWidth
{
  return self->_viewWidth;
}

- (int64_t)viewSizeSubclass
{
  return self->_viewSizeSubclass;
}

- (double)minimumFontSize
{
  return self->_minimumFontSize;
}

- (double)headlineBaselineOffset
{
  v8[4] = *MEMORY[0x1E4F143B8];
  double headlineBaselineOffset = self->_headlineBaselineOffset;
  if ([(HUGridHeadlineCellLayoutOptions *)self isEditing])
  {
    uint64_t v4 = [(HUGridHeadlineCellLayoutOptions *)self viewSizeSubclass];
    v7[0] = &unk_1F19B5030;
    v7[1] = &unk_1F19B5060;
    v8[0] = &unk_1F19B6490;
    v8[1] = &unk_1F19B64A0;
    v7[2] = &unk_1F19B50C0;
    v7[3] = &unk_1F19B5078;
    v8[2] = &unk_1F19B63E0;
    v8[3] = &unk_1F19B6410;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
    double headlineBaselineOffset = headlineBaselineOffset + HUConstantFloatForViewSizeSubclass(v4, v5);
  }
  return headlineBaselineOffset;
}

- (double)editingBackgroundHeight
{
  return self->_editingBackgroundHeight;
}

- (double)containerTrailingMargin
{
  return self->_containerTrailingMargin;
}

- (double)containerLeadingMargin
{
  return self->_containerLeadingMargin;
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3 viewSizeSubclass:(int64_t)a4 viewWidth:(double)a5 containerLeadingMargin:(double)a6 containerTrailingMargin:(double)a7
{
  v21[4] = *MEMORY[0x1E4F143B8];
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___HUGridHeadlineCellLayoutOptions;
  uint64_t v12 = objc_msgSendSuper2(&v17, sel_defaultOptionsForCellSizeSubclass_);
  *(void *)(v12 + 160) = a4;
  *(double *)(v12 + 168) = a5;
  *(double *)(v12 + 176) = a6;
  *(double *)(v12 + 184) = a7;
  v13 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F438B8] traits:32770];
  [(id)v12 setFont:v13];

  [(id)v12 setHeadlineBaselineOffset:15.0];
  v20[0] = &unk_1F19B5030;
  v20[1] = &unk_1F19B5018;
  v21[0] = &unk_1F19B6410;
  v21[1] = &unk_1F19B6420;
  v20[2] = &unk_1F19B50A8;
  v20[3] = &unk_1F19B5060;
  v21[2] = &unk_1F19B6430;
  v21[3] = &unk_1F19B6420;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  objc_msgSend((id)v12, "setMinimumFontSize:", HUConstantForCellSizeSubclass(a3, v14));

  v18[0] = &unk_1F19B5030;
  v18[1] = &unk_1F19B5018;
  v19[0] = &unk_1F19B6440;
  v19[1] = &unk_1F19B6450;
  v18[2] = &unk_1F19B5060;
  v18[3] = &unk_1F19B50C0;
  v19[2] = &unk_1F19B6460;
  v19[3] = &unk_1F19B6450;
  v18[4] = &unk_1F19B5078;
  v18[5] = &unk_1F19B50D8;
  v19[4] = &unk_1F19B6470;
  v19[5] = &unk_1F19B6480;
  v18[6] = &unk_1F19B5090;
  v19[6] = &unk_1F19B6450;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:7];
  objc_msgSend((id)v12, "setEditingBackgroundHeight:", HUConstantFloatForViewSizeSubclass(a4, v15));

  return (id)v12;
}

- (void)setMinimumFontSize:(double)a3
{
  self->_minimumFontSize = a3;
}

- (void)setHeadlineBaselineOffset:(double)a3
{
  self->_double headlineBaselineOffset = a3;
}

- (void)setEditingBackgroundHeight:(double)a3
{
  self->_editingBackgroundHeight = a3;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  uint64_t v6 = NSStringFromSelector(sel_defaultOptionsForCellSizeSubclass_viewSizeSubclass_viewWidth_containerLeadingMargin_containerTrailingMargin_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HUGridLayoutOptions.m", 778, @"%s is unavailable; use %@ instead",
    "+[HUGridHeadlineCellLayoutOptions defaultOptionsForCellSizeSubclass:]",
    v6);

  return 0;
}

- (double)editingBackgroundMinimumWidth
{
  uint64_t v3 = [(HUGridHeadlineCellLayoutOptions *)self viewSizeSubclass];
  [(HUGridHeadlineCellLayoutOptions *)self viewWidth];
  double v5 = v4;
  if (v3 < 4)
  {
    [(HUGridHeadlineCellLayoutOptions *)self containerLeadingMargin];
    double v6 = v5 - v8;
    [(HUGridHeadlineCellLayoutOptions *)self containerTrailingMargin];
  }
  else
  {
    double v6 = v4 * 0.5;
    [(HUGridHeadlineCellLayoutOptions *)self containerLeadingMargin];
  }
  return v6 - v7;
}

@end