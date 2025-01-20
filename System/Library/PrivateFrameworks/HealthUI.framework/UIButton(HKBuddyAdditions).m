@interface UIButton(HKBuddyAdditions)
+ (_HKRoundedRectBuddyButton)hk_roundedRectBuddyButtonTintedWithColor:()HKBuddyAdditions title:target:action:;
+ (double)hk_buddyButtonHorizontalMargin;
+ (id)hk_buddyButtonTintedWithColor:()HKBuddyAdditions title:target:action:;
@end

@implementation UIButton(HKBuddyAdditions)

+ (double)hk_buddyButtonHorizontalMargin
{
  int v0 = objc_msgSend(MEMORY[0x1E4FB1BA8], "hk_currentDeviceHas4InchScreen");
  double result = 24.0;
  if (v0) {
    return 16.0;
  }
  return result;
}

+ (_HKRoundedRectBuddyButton)hk_roundedRectBuddyButtonTintedWithColor:()HKBuddyAdditions title:target:action:
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [_HKRoundedRectBuddyButton alloc];
  v13 = -[_HKRoundedRectBuddyButton initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  [(_HKRoundedRectBuddyButton *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_HKRoundedRectBuddyButton *)v13 setBackgroundColor:v11];

  [(_HKRoundedRectBuddyButton *)v13 setTitle:v10 forState:0];
  if (v9 && a6) {
    [(_HKRoundedRectBuddyButton *)v13 addTarget:v9 action:a6 forControlEvents:64];
  }

  return v13;
}

+ (id)hk_buddyButtonTintedWithColor:()HKBuddyAdditions title:target:action:
{
  id v9 = (void *)MEMORY[0x1E4FB14D0];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v9 buttonWithType:1];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [v13 titleLabel];
  [v14 setAdjustsFontForContentSizeCategory:1];
  [v14 setAllowsDefaultTighteningForTruncation:1];
  v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v14 setFont:v15];

  [v14 setTextAlignment:1];
  [v13 setTitle:v11 forState:0];

  [v13 setTitleColor:v12 forState:0];
  [v13 addTarget:v10 action:a6 forControlEvents:64];

  return v13;
}

@end