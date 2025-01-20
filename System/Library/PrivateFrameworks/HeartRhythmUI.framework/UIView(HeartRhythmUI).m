@interface UIView(HeartRhythmUI)
- (uint64_t)hrui_alignConstraintsWithView:()HeartRhythmUI insets:;
- (uint64_t)hrui_alignHorizontalConstraintsWithGuide:()HeartRhythmUI insets:;
- (uint64_t)hrui_alignHorizontalConstraintsWithView:()HeartRhythmUI insets:;
- (uint64_t)hrui_alignVerticalConstraintsWithGuide:()HeartRhythmUI insets:;
- (uint64_t)hrui_alignVerticalConstraintsWithView:()HeartRhythmUI insets:;
- (uint64_t)hrui_maskAllCornersWithRadius:()HeartRhythmUI;
- (void)hrui_alignConstraintsWithLeadingAnchor:()HeartRhythmUI trailingAnchor:insets:;
- (void)hrui_alignConstraintsWithTopAnchor:()HeartRhythmUI bottomAnchor:insets:;
- (void)hrui_constraintAspectRatioFromSize:()HeartRhythmUI;
- (void)hrui_maskCorners:()HeartRhythmUI radius:;
@end

@implementation UIView(HeartRhythmUI)

- (void)hrui_alignConstraintsWithLeadingAnchor:()HeartRhythmUI trailingAnchor:insets:
{
  id v12 = a8;
  id v13 = a7;
  v14 = [a1 leadingAnchor];
  v15 = [v14 constraintEqualToAnchor:v13 constant:a3];

  [v15 setActive:1];
  id v17 = [a1 trailingAnchor];
  v16 = [v17 constraintEqualToAnchor:v12 constant:-a5];

  [v16 setActive:1];
}

- (void)hrui_alignConstraintsWithTopAnchor:()HeartRhythmUI bottomAnchor:insets:
{
  id v11 = a7;
  id v12 = a6;
  id v13 = [a1 topAnchor];
  v14 = [v13 constraintEqualToAnchor:v12 constant:a2];

  [v14 setActive:1];
  id v16 = [a1 bottomAnchor];
  v15 = [v16 constraintEqualToAnchor:v11 constant:-a4];

  [v15 setActive:1];
}

- (uint64_t)hrui_alignConstraintsWithView:()HeartRhythmUI insets:
{
  id v12 = a7;
  id v13 = [v12 topAnchor];
  v14 = [v12 bottomAnchor];
  objc_msgSend(a1, "hrui_alignConstraintsWithTopAnchor:bottomAnchor:insets:", v13, v14, a2, a3, a4, a5);

  v15 = [v12 leadingAnchor];
  id v16 = [v12 trailingAnchor];

  objc_msgSend(a1, "hrui_alignConstraintsWithLeadingAnchor:trailingAnchor:insets:", v15, v16, a2, a3, a4, a5);
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (uint64_t)hrui_alignHorizontalConstraintsWithView:()HeartRhythmUI insets:
{
  id v12 = a7;
  id v13 = [v12 leadingAnchor];
  v14 = [v12 trailingAnchor];

  objc_msgSend(a1, "hrui_alignConstraintsWithLeadingAnchor:trailingAnchor:insets:", v13, v14, a2, a3, a4, a5);
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (uint64_t)hrui_alignVerticalConstraintsWithView:()HeartRhythmUI insets:
{
  id v12 = a7;
  id v13 = [v12 topAnchor];
  v14 = [v12 bottomAnchor];

  objc_msgSend(a1, "hrui_alignConstraintsWithTopAnchor:bottomAnchor:insets:", v13, v14, a2, a3, a4, a5);
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (uint64_t)hrui_alignHorizontalConstraintsWithGuide:()HeartRhythmUI insets:
{
  id v12 = a7;
  id v13 = [v12 leadingAnchor];
  v14 = [v12 trailingAnchor];

  objc_msgSend(a1, "hrui_alignConstraintsWithLeadingAnchor:trailingAnchor:insets:", v13, v14, a2, a3, a4, a5);
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (uint64_t)hrui_alignVerticalConstraintsWithGuide:()HeartRhythmUI insets:
{
  id v12 = a7;
  id v13 = [v12 topAnchor];
  v14 = [v12 bottomAnchor];

  objc_msgSend(a1, "hrui_alignConstraintsWithTopAnchor:bottomAnchor:insets:", v13, v14, a2, a3, a4, a5);
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)hrui_constraintAspectRatioFromSize:()HeartRhythmUI
{
  id v4 = [MEMORY[0x263F08938] constraintWithItem:a1 attribute:8 relatedBy:0 toItem:a1 attribute:7 multiplier:a3 / a2 constant:0.0];
  [a1 addConstraint:v4];
}

- (void)hrui_maskCorners:()HeartRhythmUI radius:
{
  uint64_t v6 = a4 & 0xF;
  v7 = [a1 layer];
  [v7 setCornerRadius:a2];

  v8 = [a1 layer];
  [v8 setMaskedCorners:v6];

  id v9 = [a1 layer];
  [v9 setMasksToBounds:1];
}

- (uint64_t)hrui_maskAllCornersWithRadius:()HeartRhythmUI
{
  return objc_msgSend(a1, "hrui_maskCorners:radius:", -1);
}

@end