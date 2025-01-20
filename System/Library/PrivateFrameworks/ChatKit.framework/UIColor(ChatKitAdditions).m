@interface UIColor(ChatKitAdditions)
+ (id)_ckColor:()ChatKitAdditions forUserInterfaceStyle:;
+ (id)_ckSecondarySystemBackgroundColor;
+ (id)_ckSecondarySystemGroupedBackgroundColor;
+ (id)_ckSystemBackgroundColor;
+ (id)_ckSystemGroupedBackgroundColor;
+ (id)_ckTertiarySystemBackgroundColor;
+ (id)ckColorNamed:()ChatKitAdditions;
+ (id)dynamicColorWithLightColor:()ChatKitAdditions darkColor:;
- (id)resolvedColorForTraitCollection:()ChatKitAdditions;
@end

@implementation UIColor(ChatKitAdditions)

+ (id)ckColorNamed:()ChatKitAdditions
{
  v3 = (void *)MEMORY[0x1E4F428B8];
  id v4 = a3;
  v5 = CKFrameworkBundle();
  v6 = [v3 colorNamed:v4 inBundle:v5 compatibleWithTraitCollection:0];

  return v6;
}

+ (id)_ckSystemBackgroundColor
{
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [(id)objc_opt_class() performSelector:sel_systemBackgroundColor];
  }
  else {
  v0 = [MEMORY[0x1E4F428B8] systemBlackColor];
  }

  return v0;
}

+ (id)dynamicColorWithLightColor:()ChatKitAdditions darkColor:
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F428B8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__UIColor_ChatKitAdditions__dynamicColorWithLightColor_darkColor___block_invoke;
  v12[3] = &unk_1E5623FA0;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  v10 = [v7 colorWithDynamicProvider:v12];

  return v10;
}

- (id)resolvedColorForTraitCollection:()ChatKitAdditions
{
  id v4 = (void *)MEMORY[0x1E4F42F80];
  id v5 = a3;
  id v6 = [v4 _currentTraitCollection];
  [MEMORY[0x1E4F42F80] _setCurrentTraitCollection:v5];

  v7 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithCGColor:", objc_msgSend(a1, "CGColor"));
  [MEMORY[0x1E4F42F80] _setCurrentTraitCollection:v6];

  return v7;
}

+ (id)_ckSecondarySystemBackgroundColor
{
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [(id)objc_opt_class() performSelector:sel_secondarySystemBackgroundColor];
  }
  else {
  v0 = [MEMORY[0x1E4F428B8] systemDarkGrayColor];
  }

  return v0;
}

+ (id)_ckTertiarySystemBackgroundColor
{
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [(id)objc_opt_class() performSelector:sel_tertiarySystemBackgroundColor];
  }
  else {
  v0 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }

  return v0;
}

+ (id)_ckSystemGroupedBackgroundColor
{
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [(id)objc_opt_class() performSelector:sel_systemGroupedBackgroundColor];
  }
  else {
  v0 = [MEMORY[0x1E4F428B8] systemBlackColor];
  }

  return v0;
}

+ (id)_ckSecondarySystemGroupedBackgroundColor
{
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [(id)objc_opt_class() performSelector:sel_secondarySystemGroupedBackgroundColor];
  }
  else {
  v0 = [MEMORY[0x1E4F428B8] systemBlackColor];
  }

  return v0;
}

+ (id)_ckColor:()ChatKitAdditions forUserInterfaceStyle:
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F42F80];
  id v6 = a3;
  v7 = [v5 _currentTraitCollection];
  id v8 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:a4];
  id v9 = (void *)MEMORY[0x1E4F42F80];
  v14[0] = v7;
  v14[1] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v11 = [v9 traitCollectionWithTraitsFromCollections:v10];

  v12 = [v6 resolvedColorWithTraitCollection:v11];

  return v12;
}

@end