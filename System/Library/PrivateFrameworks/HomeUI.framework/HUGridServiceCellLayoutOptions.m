@interface HUGridServiceCellLayoutOptions
+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3;
- (BOOL)shouldShowAccessoryView;
- (BOOL)shouldShowDescription;
- (BOOL)shouldShowIconOnly;
- (double)iconToTitleSpacing;
- (double)lineSpacing;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIconToTitleSpacing:(double)a3;
- (void)setLineSpacing:(double)a3;
- (void)setShowAccessoryView:(BOOL)a3;
- (void)setShowDescription:(BOOL)a3;
- (void)setShowIconOnly:(BOOL)a3;
@end

@implementation HUGridServiceCellLayoutOptions

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUGridServiceCellLayoutOptions;
  id v4 = [(HUGridCellLayoutOptions *)&v6 copyWithZone:a3];
  [(HUGridServiceCellLayoutOptions *)self lineSpacing];
  objc_msgSend(v4, "setLineSpacing:");
  [(HUGridServiceCellLayoutOptions *)self iconToTitleSpacing];
  objc_msgSend(v4, "setIconToTitleSpacing:");
  objc_msgSend(v4, "setShowIconOnly:", -[HUGridServiceCellLayoutOptions shouldShowIconOnly](self, "shouldShowIconOnly"));
  objc_msgSend(v4, "setShowDescription:", -[HUGridServiceCellLayoutOptions shouldShowDescription](self, "shouldShowDescription"));
  objc_msgSend(v4, "setShowAccessoryView:", -[HUGridServiceCellLayoutOptions shouldShowAccessoryView](self, "shouldShowAccessoryView"));
  return v4;
}

- (BOOL)shouldShowIconOnly
{
  return self->_showIconOnly;
}

- (BOOL)shouldShowDescription
{
  return self->_showDescription;
}

- (BOOL)shouldShowAccessoryView
{
  return self->_showAccessoryView;
}

- (void)setShowIconOnly:(BOOL)a3
{
  self->_showIconOnly = a3;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (double)iconToTitleSpacing
{
  return self->_iconToTitleSpacing;
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___HUGridServiceCellLayoutOptions;
  id v4 = objc_msgSendSuper2(&v14, sel_defaultOptionsForCellSizeSubclass_);
  v21[0] = &unk_1F19B5030;
  v21[1] = &unk_1F19B5018;
  v22[0] = &unk_1F19B63E0;
  v22[1] = &unk_1F19B6400;
  v21[2] = &unk_1F19B5048;
  v21[3] = &unk_1F19B50A8;
  v22[2] = &unk_1F19B6500;
  v22[3] = &unk_1F19B63F0;
  v21[4] = &unk_1F19B5060;
  v22[4] = &unk_1F19B63E0;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
  double v6 = HUConstantForCellSizeSubclass(a3, v5);

  v7 = [MEMORY[0x1E4F42A30] systemFontOfSize:v6 weight:*MEMORY[0x1E4F43908]];
  [v4 setFont:v7];

  v19[0] = &unk_1F19B5030;
  v19[1] = &unk_1F19B5018;
  v20[0] = &unk_1F19B6500;
  v20[1] = &unk_1F19B64C0;
  v19[2] = &unk_1F19B5048;
  v19[3] = &unk_1F19B50A8;
  v20[2] = &unk_1F19B6510;
  v20[3] = &unk_1F19B6520;
  v19[4] = &unk_1F19B5060;
  v20[4] = &unk_1F19B64C0;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:5];
  objc_msgSend(v4, "setLineSpacing:", HUConstantForCellSizeSubclass(a3, v8));

  [v4 setIconToTitleSpacing:6.0];
  [v4 setShowDescription:1];
  [v4 setShowAccessoryView:1];
  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
  {
    v9 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43880]];
    v10 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v9 size:v6];
    [v4 setFont:v10];

    v17[0] = &unk_1F19B5030;
    v17[1] = &unk_1F19B5018;
    v18[0] = &unk_1F19B6500;
    v18[1] = &unk_1F19B63F0;
    v17[2] = &unk_1F19B5048;
    v17[3] = &unk_1F19B50A8;
    v18[2] = &unk_1F19B64C0;
    v18[3] = &unk_1F19B64D0;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
    objc_msgSend(v4, "setLineSpacing:", HUConstantForCellSizeSubclass(a3, v11));

    v15[0] = &unk_1F19B5030;
    v15[1] = &unk_1F19B5018;
    v16[0] = &unk_1F19B63D0;
    v16[1] = &unk_1F19B63E0;
    v15[2] = &unk_1F19B5048;
    v15[3] = &unk_1F19B50A8;
    v16[2] = &unk_1F19B6400;
    v16[3] = &unk_1F19B63D0;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    objc_msgSend(v4, "setCellInnerMargin:", HUConstantForCellSizeSubclass(a3, v12));
  }

  return v4;
}

- (void)setShowDescription:(BOOL)a3
{
  self->_showDescription = a3;
}

- (void)setShowAccessoryView:(BOOL)a3
{
  self->_showAccessoryView = a3;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (void)setIconToTitleSpacing:(double)a3
{
  self->_iconToTitleSpacing = a3;
}

@end