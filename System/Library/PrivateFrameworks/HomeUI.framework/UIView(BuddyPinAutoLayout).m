@interface UIView(BuddyPinAutoLayout)
- (id)pinToEdgesConstraints:()BuddyPinAutoLayout;
- (void)pinToEdges:()BuddyPinAutoLayout;
@end

@implementation UIView(BuddyPinAutoLayout)

- (void)pinToEdges:()BuddyPinAutoLayout
{
  v1 = (void *)MEMORY[0x1E4F28DC8];
  objc_msgSend(a1, "pinToEdgesConstraints:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 activateConstraints:v2];
}

- (id)pinToEdgesConstraints:()BuddyPinAutoLayout
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18 = [a1 leadingAnchor];
  v17 = [v4 leadingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v19[0] = v16;
  v5 = [a1 trailingAnchor];
  v6 = [v4 trailingAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  v19[1] = v7;
  v8 = [a1 topAnchor];
  v9 = [v4 topAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v19[2] = v10;
  v11 = [a1 bottomAnchor];
  v12 = [v4 bottomAnchor];

  v13 = [v11 constraintEqualToAnchor:v12];
  v19[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];

  return v14;
}

@end