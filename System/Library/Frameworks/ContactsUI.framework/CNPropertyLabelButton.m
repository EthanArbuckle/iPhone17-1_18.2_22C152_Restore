@interface CNPropertyLabelButton
+ (id)propertyLabelButton;
- (void)tintColorDidChange;
- (void)updateConstraints;
@end

@implementation CNPropertyLabelButton

- (void)updateConstraints
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = (void *)MEMORY[0x1E4F28DC8];
  v5 = [(CNPropertyLabelButton *)self titleLabel];
  v6 = [v4 constraintWithItem:v5 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
  [v3 addObject:v6];

  v7 = (void *)MEMORY[0x1E4F28DC8];
  v8 = [(CNPropertyLabelButton *)self titleLabel];
  v9 = [v7 constraintWithItem:v8 attribute:4 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:0.0];
  [v3 addObject:v9];

  [MEMORY[0x1E4F28DC8] activateConstraints:v3];
  v10.receiver = self;
  v10.super_class = (Class)CNPropertyLabelButton;
  [(CNPropertyLabelButton *)&v10 updateConstraints];
}

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)CNPropertyLabelButton;
  [(CNPropertyLabelButton *)&v6 tintColorDidChange];
  v3 = [(CNPropertyLabelButton *)self titleColorForState:0];
  v4 = [(CNPropertyLabelButton *)self tintColor];

  if (v3 != v4)
  {
    v5 = [(CNPropertyLabelButton *)self tintColor];
    [(CNPropertyLabelButton *)self setTitleColor:v5 forState:0];
  }
}

+ (id)propertyLabelButton
{
  id v2 = objc_alloc((Class)a1);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [v3 tintColor];
  [v3 setTitleColor:v4 forState:0];

  v5 = [MEMORY[0x1E4FB1E20] _currentTraitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 != 5)
  {
    v7 = +[CNUIColorRepository contactStyleDefaultReadOnlyTextColor];
    [v3 setTitleColor:v7 forState:2];
  }
  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [v3 setContentHorizontalAlignment:v8];

  return v3;
}

@end