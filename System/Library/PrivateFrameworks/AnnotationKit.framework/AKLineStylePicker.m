@interface AKLineStylePicker
- (AKLineStylePicker)initWithFrame:(CGRect)a3 lineType:(unint64_t)a4 controller:(id)a5;
- (id)_buttonImagesForType:(unint64_t)a3;
- (int64_t)_shapeTagForType:(unint64_t)a3;
- (int64_t)lineStyle;
- (unint64_t)lineType;
- (void)_styleButtonPressed:(id)a3;
- (void)revalidateItems:(id)a3;
@end

@implementation AKLineStylePicker

- (AKLineStylePicker)initWithFrame:(CGRect)a3 lineType:(unint64_t)a4 controller:(id)a5
{
  v26.receiver = self;
  v26.super_class = (Class)AKLineStylePicker;
  v6 = -[AKModernToolbarPicker initWithFrame:controller:](&v26, sel_initWithFrame_controller_, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  if (v6)
  {
    v6->_lineType = a4;
    v6->_lineStyle = [(AKLineStylePicker *)v6 _shapeTagForType:a4];
    v8 = [(AKLineStylePicker *)v7 _buttonImagesForType:a4];
    if ([v8 count])
    {
      unint64_t v9 = 0;
      double v10 = *MEMORY[0x263F001A8];
      double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
      do
      {
        v14 = [v8 objectAtIndexedSubscript:v9];
        v15 = [&unk_26EA75B90 objectAtIndexedSubscript:v9];
        uint64_t v16 = [v15 integerValue];

        v17 = -[AKToggleButton initWithFrame:templateImage:autoUpdatesColor:]([AKToggleButton alloc], "initWithFrame:templateImage:autoUpdatesColor:", v14, 1, v10, v11, v12, v13);
        v18 = [(AKToggleButton *)v17 layer];
        [v18 setCornerRadius:3.0];

        v19 = [MEMORY[0x263F1C550] colorWithRed:0.784313725 green:0.780392157 blue:0.8 alpha:1.0];
        [(AKToggleButton *)v17 setTintColor:v19];

        [(AKToggleButton *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
        v20 = [(AKToggleButton *)v17 widthAnchor];
        v21 = [v20 constraintEqualToConstant:36.0];
        [v21 setActive:1];

        v22 = [(AKToggleButton *)v17 heightAnchor];
        v23 = [v22 constraintEqualToConstant:36.0];
        [v23 setActive:1];

        [(AKToggleButton *)v17 addTarget:v7 action:sel__styleButtonPressed_ forControlEvents:64];
        [(AKToggleButton *)v17 setImage:v14 forState:0];
        [(AKToggleButton *)v17 setTag:v16];
        v24 = [(AKModernToolbarPicker *)v7 stackview];
        [v24 addArrangedSubview:v17];

        ++v9;
      }
      while (v9 < [v8 count]);
    }
  }
  return v7;
}

- (void)_styleButtonPressed:(id)a3
{
  [a3 tag];

  MEMORY[0x270F9A6D0](self, sel_setCurrentTag_);
}

- (int64_t)_shapeTagForType:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return qword_2376F4090[a3];
  }
}

- (id)_buttonImagesForType:(unint64_t)a3
{
  v27[3] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F1CB00];
  v5 = [(AKLineStylePicker *)self traitCollection];
  v6 = objc_msgSend(v4, "traitCollectionWithUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

  switch(a3)
  {
    case 2uLL:
      v17 = (void *)MEMORY[0x263F1C6B0];
      v8 = +[AKController akBundle];
      unint64_t v9 = [v17 imageNamed:@"AK_Attribute_ArrowDouble_Stroke_Thin" inBundle:v8 compatibleWithTraitCollection:v6];
      v18 = (void *)MEMORY[0x263F1C6B0];
      double v11 = +[AKController akBundle];
      double v12 = [v18 imageNamed:@"AK_Attribute_ArrowDouble_Stroke_Medium" inBundle:v11 compatibleWithTraitCollection:v6];
      v25[1] = v12;
      v19 = (void *)MEMORY[0x263F1C6B0];
      v14 = +[AKController akBundle];
      v15 = [v19 imageNamed:@"AK_Attribute_ArrowDouble_Stroke_Thick" inBundle:v14 compatibleWithTraitCollection:v6];
      v25[2] = v15;
      uint64_t v16 = v25;
      goto LABEL_7;
    case 1uLL:
      v20 = (void *)MEMORY[0x263F1C6B0];
      v8 = +[AKController akBundle];
      unint64_t v9 = [v20 imageNamed:@"AK_Attribute_Arrow_Stroke_Thin" inBundle:v8 compatibleWithTraitCollection:v6];
      v26[0] = v9;
      v21 = (void *)MEMORY[0x263F1C6B0];
      double v11 = +[AKController akBundle];
      double v12 = [v21 imageNamed:@"AK_Attribute_Arrow_Stroke_Medium" inBundle:v11 compatibleWithTraitCollection:v6];
      v26[1] = v12;
      v22 = (void *)MEMORY[0x263F1C6B0];
      v14 = +[AKController akBundle];
      v15 = [v22 imageNamed:@"AK_Attribute_Arrow_Stroke_Thick" inBundle:v14 compatibleWithTraitCollection:v6];
      v26[2] = v15;
      uint64_t v16 = v26;
      goto LABEL_7;
    case 0uLL:
      v7 = (void *)MEMORY[0x263F1C6B0];
      v8 = +[AKController akBundle];
      unint64_t v9 = [v7 imageNamed:@"AK_Attribute_Line_Stroke_Thin" inBundle:v8 compatibleWithTraitCollection:v6];
      v27[0] = v9;
      double v10 = (void *)MEMORY[0x263F1C6B0];
      double v11 = +[AKController akBundle];
      double v12 = [v10 imageNamed:@"AK_Attribute_Line_Stroke_Medium" inBundle:v11 compatibleWithTraitCollection:v6];
      v27[1] = v12;
      double v13 = (void *)MEMORY[0x263F1C6B0];
      v14 = +[AKController akBundle];
      v15 = [v13 imageNamed:@"AK_Attribute_Line_Stroke_Thick" inBundle:v14 compatibleWithTraitCollection:v6];
      v27[2] = v15;
      uint64_t v16 = v27;
LABEL_7:
      v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];

      goto LABEL_9;
  }
  v23 = 0;
LABEL_9:

  return v23;
}

- (void)revalidateItems:(id)a3
{
  id v16 = [(AKModernToolbarPicker *)self controller];
  v4 = [MEMORY[0x263F1C488] buttonWithType:0];
  [v4 setTag:self->_lineStyle];
  [v16 validateSender:v4];
  int v5 = [v4 isSelected];
  v6 = [(AKModernToolbarPicker *)self stackview];
  v7 = [v6 subviews];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    do
    {
      double v10 = [(AKModernToolbarPicker *)self stackview];
      double v11 = [v10 subviews];
      double v12 = [v11 objectAtIndexedSubscript:v9];

      [v12 setSelected:0];
      [v16 validateSender:v12];
      objc_msgSend(v12, "setSelected:", objc_msgSend(v12, "isSelected") & v5);

      ++v9;
      double v13 = [(AKModernToolbarPicker *)self stackview];
      v14 = [v13 subviews];
      unint64_t v15 = [v14 count];
    }
    while (v9 < v15);
  }
}

- (unint64_t)lineType
{
  return self->_lineType;
}

- (int64_t)lineStyle
{
  return self->_lineStyle;
}

@end