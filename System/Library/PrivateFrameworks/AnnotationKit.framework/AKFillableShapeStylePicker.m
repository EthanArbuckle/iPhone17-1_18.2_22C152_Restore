@interface AKFillableShapeStylePicker
- (AKFillableShapeStylePicker)initWithFrame:(CGRect)a3 controller:(id)a4;
- (BOOL)showFill;
- (void)_styleButtonPressed:(id)a3;
- (void)_updateImagesForAnnotationType:(id)a3;
- (void)revalidateItems:(id)a3;
- (void)setShowFill:(BOOL)a3;
@end

@implementation AKFillableShapeStylePicker

- (AKFillableShapeStylePicker)initWithFrame:(CGRect)a3 controller:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)AKFillableShapeStylePicker;
  v4 = -[AKModernToolbarPicker initWithFrame:controller:](&v24, sel_initWithFrame_controller_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_showFill = 1;
    v6 = [MEMORY[0x263EFF980] array];
    if ([&unk_26EA75BA8 count])
    {
      unint64_t v7 = 0;
      double v8 = *MEMORY[0x263F001A8];
      double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
      do
      {
        v12 = [&unk_26EA75BA8 objectAtIndexedSubscript:v7];
        uint64_t v13 = [v12 integerValue];

        v14 = -[AKToggleButton initWithFrame:templateImage:autoUpdatesColor:]([AKToggleButton alloc], "initWithFrame:templateImage:autoUpdatesColor:", 0, 1, v8, v9, v10, v11);
        [(NSArray *)v6 addObject:v14];
        v15 = [(AKToggleButton *)v14 layer];
        [v15 setCornerRadius:3.0];

        v16 = [MEMORY[0x263F1C550] colorWithRed:0.784313725 green:0.780392157 blue:0.8 alpha:1.0];
        [(AKToggleButton *)v14 setTintColor:v16];

        [(AKToggleButton *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
        v17 = [(AKToggleButton *)v14 widthAnchor];
        v18 = [v17 constraintEqualToConstant:36.0];
        [v18 setActive:1];

        v19 = [(AKToggleButton *)v14 heightAnchor];
        v20 = [v19 constraintEqualToConstant:36.0];
        [v20 setActive:1];

        [(AKToggleButton *)v14 addTarget:v5 action:sel__styleButtonPressed_ forControlEvents:64];
        [(AKToggleButton *)v14 setTag:v13];
        v21 = [(AKModernToolbarPicker *)v5 stackview];
        [v21 addArrangedSubview:v14];

        ++v7;
      }
      while (v7 < [&unk_26EA75BA8 count]);
    }
    buttons = v5->_buttons;
    v5->_buttons = v6;
  }
  return v5;
}

- (void)setShowFill:(BOOL)a3
{
  self->_showFill = a3;
  id v6 = [(AKModernToolbarPicker *)self stackview];
  v4 = [v6 arrangedSubviews];
  v5 = [v4 firstObject];
  [v5 setHidden:!self->_showFill];
}

- (void)_styleButtonPressed:(id)a3
{
  [a3 tag];

  MEMORY[0x270F9A6D0](self, sel_setCurrentTag_);
}

- (void)revalidateItems:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(AKModernToolbarPicker *)self controller];
  id v6 = [v4 allObjects];
  unint64_t v7 = [v6 firstObject];
  [(AKFillableShapeStylePicker *)self _updateImagesForAnnotationType:v7];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  double v8 = [(AKModernToolbarPicker *)self stackview];
  double v9 = [v8 subviews];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v39 + 1) + 8 * i) setSelected:0];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v11);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (!v15)
  {

LABEL_23:
    v26 = [(AKModernToolbarPicker *)self stackview];
    v27 = [v26 arrangedSubviews];
    v25 = [v27 objectAtIndex:1];

    v28 = [(AKModernToolbarPicker *)self stackview];
    v29 = [v28 arrangedSubviews];
    v30 = [v29 objectAtIndex:2];

    v31 = [(AKModernToolbarPicker *)self stackview];
    v32 = [v31 arrangedSubviews];
    v33 = [v32 objectAtIndex:3];

    [v5 validateSender:v25];
    [v5 validateSender:v30];
    [v5 validateSender:v33];

    goto LABEL_24;
  }
  uint64_t v16 = v15;
  v34 = v5;
  char v17 = 0;
  uint64_t v18 = *(void *)v36;
  do
  {
    for (uint64_t j = 0; j != v16; ++j)
    {
      if (*(void *)v36 != v18) {
        objc_enumerationMutation(v14);
      }
      v20 = *(void **)(*((void *)&v35 + 1) + 8 * j);
      if (objc_opt_respondsToSelector())
      {
        v21 = [v20 fillColor];
        v22 = v21;
        if (v21 && CGColorGetAlpha((CGColorRef)[v21 CGColor]) != 0.0) {
          char v17 = 1;
        }
      }
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
  }
  while (v16);

  v5 = v34;
  if ((v17 & 1) == 0) {
    goto LABEL_23;
  }
  v23 = [(AKModernToolbarPicker *)self stackview];
  objc_super v24 = [v23 arrangedSubviews];
  v25 = [v24 objectAtIndex:0];

  [v25 setSelected:1];
LABEL_24:
}

- (void)_updateImagesForAnnotationType:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F1CB00];
  id v6 = [(AKFillableShapeStylePicker *)self traitCollection];
  unint64_t v7 = objc_msgSend(v5, "traitCollectionWithUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  objc_opt_class();
  v43 = v4;
  if (objc_opt_isKindOfClass())
  {
    double v8 = (void *)MEMORY[0x263F1C6B0];
    double v9 = +[AKController akBundle];
    uint64_t v10 = [v8 imageNamed:@"AK_Attribute_Arrow_Stroke_Thin" inBundle:v9 compatibleWithTraitCollection:v7];
    v48 = v10;
    uint64_t v11 = (void *)MEMORY[0x263F1C6B0];
    uint64_t v12 = +[AKController akBundle];
    uint64_t v49 = [v11 imageNamed:@"AK_Attribute_Arrow_Stroke_Thin" inBundle:v12 compatibleWithTraitCollection:v7];
    uint64_t v13 = (void *)MEMORY[0x263F1C6B0];
    long long v42 = +[AKController akBundle];
    id v14 = objc_msgSend(v13, "imageNamed:inBundle:compatibleWithTraitCollection:", @"AK_Attribute_Arrow_Stroke_Medium");
    v50 = v14;
    uint64_t v15 = (void *)MEMORY[0x263F1C6B0];
    uint64_t v16 = (void *)v49;
    char v17 = +[AKController akBundle];
    uint64_t v18 = [v15 imageNamed:@"AK_Attribute_Arrow_Stroke_Thick" inBundle:v17 compatibleWithTraitCollection:v7];
    v51 = v18;
    v19 = &v48;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v20 = (void *)MEMORY[0x263F1C6B0];
      uint64_t v21 = +[AKController akBundle];
      uint64_t v10 = [v20 imageNamed:@"AK_Attribute_Circle_Filled" inBundle:v21 compatibleWithTraitCollection:v7];
      v47[0] = v10;
      v22 = (void *)MEMORY[0x263F1C6B0];
      uint64_t v12 = +[AKController akBundle];
      uint64_t v16 = [v22 imageNamed:@"AK_Attribute_Circle_Stroke_Thin" inBundle:v12 compatibleWithTraitCollection:v7];
      v47[1] = v16;
      v23 = (void *)MEMORY[0x263F1C6B0];
      long long v42 = +[AKController akBundle];
      id v14 = objc_msgSend(v23, "imageNamed:inBundle:compatibleWithTraitCollection:", @"AK_Attribute_Circle_Stroke_Medium");
      v47[2] = v14;
      objc_super v24 = (void *)MEMORY[0x263F1C6B0];
      double v9 = (void *)v21;
      char v17 = +[AKController akBundle];
      uint64_t v18 = [v24 imageNamed:@"AK_Attribute_Circle_Stroke_Thick" inBundle:v17 compatibleWithTraitCollection:v7];
      v47[3] = v18;
      v19 = (void **)v47;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        v25 = (void *)MEMORY[0x263F1C6B0];
        uint64_t v26 = +[AKController akBundle];
        uint64_t v10 = [v25 imageNamed:@"AK_Attribute_Bubble_Filled" inBundle:v26 compatibleWithTraitCollection:v7];
        v46[0] = v10;
        v27 = (void *)MEMORY[0x263F1C6B0];
        uint64_t v12 = +[AKController akBundle];
        uint64_t v16 = [v27 imageNamed:@"AK_Attribute_Bubble_Stroke_Thin" inBundle:v12 compatibleWithTraitCollection:v7];
        v46[1] = v16;
        v28 = (void *)MEMORY[0x263F1C6B0];
        long long v42 = +[AKController akBundle];
        id v14 = objc_msgSend(v28, "imageNamed:inBundle:compatibleWithTraitCollection:", @"AK_Attribute_Bubble_Stroke_Medium");
        v46[2] = v14;
        v29 = (void *)MEMORY[0x263F1C6B0];
        double v9 = (void *)v26;
        char v17 = +[AKController akBundle];
        uint64_t v18 = [v29 imageNamed:@"AK_Attribute_Bubble_Stroke_Thick" inBundle:v17 compatibleWithTraitCollection:v7];
        v46[3] = v18;
        v19 = (void **)v46;
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        long long v35 = (void *)MEMORY[0x263F1C6B0];
        double v9 = +[AKController akBundle];
        if (isKindOfClass)
        {
          uint64_t v10 = [v35 imageNamed:@"AK_Attribute_Triangle_Filled" inBundle:v9 compatibleWithTraitCollection:v7];
          v45[0] = v10;
          long long v36 = (void *)MEMORY[0x263F1C6B0];
          uint64_t v12 = +[AKController akBundle];
          uint64_t v16 = [v36 imageNamed:@"AK_Attribute_Triangle_Stroke_Thin" inBundle:v12 compatibleWithTraitCollection:v7];
          v45[1] = v16;
          long long v37 = (void *)MEMORY[0x263F1C6B0];
          long long v42 = +[AKController akBundle];
          id v14 = objc_msgSend(v37, "imageNamed:inBundle:compatibleWithTraitCollection:", @"AK_Attribute_Triangle_Stroke_Medium");
          v45[2] = v14;
          long long v38 = (void *)MEMORY[0x263F1C6B0];
          char v17 = +[AKController akBundle];
          uint64_t v18 = [v38 imageNamed:@"AK_Attribute_Triangle_Stroke_Thick" inBundle:v17 compatibleWithTraitCollection:v7];
          v45[3] = v18;
          v19 = (void **)v45;
        }
        else
        {
          uint64_t v10 = [v35 imageNamed:@"AK_Attribute_Square_Filled" inBundle:v9 compatibleWithTraitCollection:v7];
          v44[0] = v10;
          long long v39 = (void *)MEMORY[0x263F1C6B0];
          uint64_t v12 = +[AKController akBundle];
          uint64_t v16 = [v39 imageNamed:@"AK_Attribute_Square_Stroke_Thin" inBundle:v12 compatibleWithTraitCollection:v7];
          v44[1] = v16;
          long long v40 = (void *)MEMORY[0x263F1C6B0];
          long long v42 = +[AKController akBundle];
          id v14 = objc_msgSend(v40, "imageNamed:inBundle:compatibleWithTraitCollection:", @"AK_Attribute_Square_Stroke_Medium");
          v44[2] = v14;
          long long v41 = (void *)MEMORY[0x263F1C6B0];
          char v17 = +[AKController akBundle];
          uint64_t v18 = [v41 imageNamed:@"AK_Attribute_Square_Stroke_Thick" inBundle:v17 compatibleWithTraitCollection:v7];
          v44[3] = v18;
          v19 = (void **)v44;
        }
      }
    }
  }
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];

  if ([(NSArray *)self->_buttons count])
  {
    unint64_t v31 = 0;
    do
    {
      v32 = [(NSArray *)self->_buttons objectAtIndexedSubscript:v31];
      v33 = [v30 objectAtIndexedSubscript:v31];
      [v32 setImage:v33 forState:0];
      [v32 setTemplateImage:v33];

      ++v31;
    }
    while (v31 < [(NSArray *)self->_buttons count]);
  }
}

- (BOOL)showFill
{
  return self->_showFill;
}

- (void).cxx_destruct
{
}

@end