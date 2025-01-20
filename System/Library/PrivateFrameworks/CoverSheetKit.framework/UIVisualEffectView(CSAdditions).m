@interface UIVisualEffectView(CSAdditions)
- (id)cs_copyVisualEffectView;
@end

@implementation UIVisualEffectView(CSAdditions)

- (id)cs_copyVisualEffectView
{
  id v2 = objc_alloc((Class)objc_opt_class());
  [a1 frame];
  v3 = objc_msgSend(v2, "initWithFrame:");
  objc_msgSend(v3, "setAutoresizingMask:", objc_msgSend(a1, "autoresizingMask"));
  objc_msgSend(v3, "setClipsToBounds:", objc_msgSend(a1, "clipsToBounds"));
  objc_msgSend(v3, "setUserInteractionEnabled:", objc_msgSend(a1, "isUserInteractionEnabled"));
  id v4 = objc_alloc(MEMORY[0x1E4F1C978]);
  v5 = [a1 backgroundEffects];
  v6 = (void *)[v4 initWithArray:v5 copyItems:1];

  [v3 setBackgroundEffects:v6];
  [a1 _continuousCornerRadius];
  objc_msgSend(v3, "_setContinuousCornerRadius:");
  v7 = [a1 _groupName];
  [v3 _setGroupName:v7];

  v8 = [v3 contentView];
  v9 = [a1 contentView];
  v10 = [v9 backgroundColor];
  [v8 setBackgroundColor:v10];

  v11 = [v3 contentView];
  v12 = [a1 contentView];
  [v12 alpha];
  objc_msgSend(v11, "setAlpha:");

  v13 = [v3 contentView];
  v14 = [a1 contentView];
  objc_msgSend(v13, "setHidden:", objc_msgSend(v14, "isHidden"));

  return v3;
}

@end