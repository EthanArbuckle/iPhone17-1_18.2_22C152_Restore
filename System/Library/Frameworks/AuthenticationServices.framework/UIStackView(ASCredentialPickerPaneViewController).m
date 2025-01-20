@interface UIStackView(ASCredentialPickerPaneViewController)
- (void)_addSpacerView;
@end

@implementation UIStackView(ASCredentialPickerPaneViewController)

- (void)_addSpacerView
{
  v9[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F82BF8]);
  v3 = (void *)MEMORY[0x263F08938];
  v4 = [v2 heightAnchor];
  v5 = [v4 constraintEqualToConstant:0.0];
  v9[0] = v5;
  v6 = [v2 widthAnchor];
  v7 = [v6 constraintEqualToConstant:0.0];
  v9[1] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  [v3 activateConstraints:v8];

  [a1 addArrangedSubview:v2];
}

@end