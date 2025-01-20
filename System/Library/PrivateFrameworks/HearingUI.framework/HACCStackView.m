@interface HACCStackView
+ (double)separatorHeight;
- (void)addArrangedSubview:(id)a3 andSeparator:(BOOL)a4 withIndent:(double)a5 withDarkBackground:(BOOL)a6;
- (void)addArrangedSubview:(id)a3 withPartialSeparator:(BOOL)a4;
- (void)addArrangedSubview:(id)a3 withPartialSeparator:(BOOL)a4 withDarkBackground:(BOOL)a5;
- (void)addArrangedSubview:(id)a3 withSeparator:(BOOL)a4;
- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4 andSeparator:(BOOL)a5 withIndent:(double)a6 withDarkBackground:(BOOL)a7;
- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4 withPartialSeparator:(BOOL)a5;
- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4 withPartialSeparator:(BOOL)a5 withDarkBackground:(BOOL)a6;
- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4 withSeparator:(BOOL)a5;
- (void)removeArrangedSubview:(id)a3;
@end

@implementation HACCStackView

+ (double)separatorHeight
{
  return 0.5;
}

- (void)addArrangedSubview:(id)a3 withSeparator:(BOOL)a4
{
}

- (void)addArrangedSubview:(id)a3 withPartialSeparator:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CCUILayoutGutter();
  -[HACCStackView addArrangedSubview:andSeparator:withIndent:withDarkBackground:](self, "addArrangedSubview:andSeparator:withIndent:withDarkBackground:", v6, v4, 0);
}

- (void)addArrangedSubview:(id)a3 withPartialSeparator:(BOOL)a4 withDarkBackground:(BOOL)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  CCUILayoutGutter();
  -[HACCStackView addArrangedSubview:andSeparator:withIndent:withDarkBackground:](self, "addArrangedSubview:andSeparator:withIndent:withDarkBackground:", v7, v5, 1);
}

- (void)addArrangedSubview:(id)a3 andSeparator:(BOOL)a4 withIndent:(double)a5 withDarkBackground:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = [(HACCStackView *)self arrangedSubviews];
  -[HACCStackView insertArrangedSubview:atIndex:andSeparator:withIndent:withDarkBackground:](self, "insertArrangedSubview:atIndex:andSeparator:withIndent:withDarkBackground:", v10, [v11 count], v8, v6, a5);
}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4 withSeparator:(BOOL)a5
{
}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4 withPartialSeparator:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  CCUILayoutGutter();
  -[HACCStackView insertArrangedSubview:atIndex:andSeparator:withIndent:withDarkBackground:](self, "insertArrangedSubview:atIndex:andSeparator:withIndent:withDarkBackground:", v8, a4, v5, 0);
}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4 withPartialSeparator:(BOOL)a5 withDarkBackground:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  CCUILayoutGutter();
  -[HACCStackView insertArrangedSubview:atIndex:andSeparator:withIndent:withDarkBackground:](self, "insertArrangedSubview:atIndex:andSeparator:withIndent:withDarkBackground:", v10, a4, v7, v6);
}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4 andSeparator:(BOOL)a5 withIndent:(double)a6 withDarkBackground:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  v46[5] = *MEMORY[0x263EF8340];
  id v12 = a3;
  v45.receiver = self;
  v45.super_class = (Class)HACCStackView;
  [(HACCStackView *)&v45 insertArrangedSubview:v12 atIndex:a4];
  if (v9)
  {
    v42 = v12;
    v13 = objc_getAssociatedObject(v12, &HearingUISeparatorViewKey);
    v14 = v13;
    if (v13)
    {
      [v13 removeFromSuperview];
      v44.receiver = self;
      v44.super_class = (Class)HACCStackView;
      [(HACCStackView *)&v44 removeArrangedSubview:v14];
    }
    v40 = self;
    unint64_t v41 = a4;
    id v15 = objc_alloc_init(MEMORY[0x263F82E00]);

    [v15 setAutoresizingMask:18];
    if (v7)
    {
      v16 = objc_alloc_init(HACCCapsuleDarkBackground);
      [(HACCCapsuleDarkBackground *)v16 setAutoresizingMask:18];
      [v15 addSubview:v16];
      [(HACCCapsuleDarkBackground *)v16 setupBackgroundVisualStyle];
    }
    id v17 = objc_alloc(MEMORY[0x263F82E50]);
    v18 = [MEMORY[0x263F82DF0] controlCenterKeyLineOnDarkVibrancyEffect];
    v19 = (void *)[v17 initWithEffect:v18];

    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v15 addSubview:v19];
    id v20 = objc_alloc_init(MEMORY[0x263F82E00]);
    v21 = [MEMORY[0x263F825C8] whiteColor];
    v39 = v20;
    [v20 setBackgroundColor:v21];

    v22 = [v19 contentView];
    [v22 addSubview:v20];

    [v20 setAutoresizingMask:18];
    v32 = (void *)MEMORY[0x263F08938];
    v38 = [v19 leadingAnchor];
    v37 = [v15 leadingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37 constant:a6];
    v46[0] = v36;
    v35 = [v19 trailingAnchor];
    v34 = [v15 trailingAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v46[1] = v33;
    v31 = [v19 topAnchor];
    v23 = [v15 topAnchor];
    v24 = [v31 constraintEqualToAnchor:v23];
    v46[2] = v24;
    v25 = [v19 bottomAnchor];
    v26 = [v15 bottomAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v46[3] = v27;
    v28 = [v15 heightAnchor];
    +[HACCStackView separatorHeight];
    v29 = objc_msgSend(v28, "constraintEqualToConstant:");
    v46[4] = v29;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:5];
    [v32 activateConstraints:v30];

    id v12 = v42;
    objc_msgSend(v15, "setTag:", objc_msgSend(v42, "tag") - 1);
    v43.receiver = v40;
    v43.super_class = (Class)HACCStackView;
    [(HACCStackView *)&v43 insertArrangedSubview:v15 atIndex:v41];
    objc_setAssociatedObject(v42, &HearingUISeparatorViewKey, v15, (void *)1);
  }
}

- (void)removeArrangedSubview:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_getAssociatedObject(v4, &HearingUISeparatorViewKey);
  BOOL v6 = v5;
  if (v5)
  {
    [v5 removeFromSuperview];
    v8.receiver = self;
    v8.super_class = (Class)HACCStackView;
    [(HACCStackView *)&v8 removeArrangedSubview:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)HACCStackView;
  [(HACCStackView *)&v7 removeArrangedSubview:v4];
}

@end