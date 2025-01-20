@interface UIButton(AuthKitUI)
+ (id)ak_passwordRecoveryButton;
- (void)_ak_passwordRecoveryButtonTapped:()AuthKitUI;
@end

@implementation UIButton(AuthKitUI)

+ (id)ak_passwordRecoveryButton
{
  v21[4] = *MEMORY[0x1E4F143B8];
  v20 = [MEMORY[0x1E4F427D8] effectWithStyle:0];
  v19 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v20];
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v19];
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 setUserInteractionEnabled:0];
  v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  v17 = [MEMORY[0x1E4F42A80] imageNamed:@"iforgot" inBundle:v18 compatibleWithTraitCollection:0];
  v1 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  [v1 addSubview:v0];
  [v1 setContentMode:4];
  objc_msgSend(v1, "setFrame:", 0.0, 0.0, 18.0, 18.0);
  [v1 setImage:v17 forState:0];
  [v1 addTarget:v1 action:sel__ak_passwordRecoveryButtonTapped_ forControlEvents:64];
  v11 = (void *)MEMORY[0x1E4F28DC8];
  v16 = [v0 topAnchor];
  v15 = [v1 topAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v21[0] = v14;
  v13 = [v0 bottomAnchor];
  v12 = [v1 bottomAnchor];
  v2 = [v13 constraintEqualToAnchor:v12];
  v21[1] = v2;
  v3 = [v0 leadingAnchor];
  v4 = [v1 leadingAnchor];
  v5 = [v3 constraintEqualToAnchor:v4];
  v21[2] = v5;
  v6 = [v0 trailingAnchor];
  v7 = [v1 trailingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v21[3] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  [v11 activateConstraints:v9];

  return v1;
}

- (void)_ak_passwordRecoveryButtonTapped:()AuthKitUI
{
  v0 = dispatch_get_global_queue(9, 0);
  dispatch_async(v0, &__block_literal_global_0);
}

@end