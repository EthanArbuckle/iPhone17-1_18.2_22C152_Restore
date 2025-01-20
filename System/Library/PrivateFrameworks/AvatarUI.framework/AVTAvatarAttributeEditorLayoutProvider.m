@interface AVTAvatarAttributeEditorLayoutProvider
+ (AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout)actionsToEditorTransitionStartingLayoutInContainerOfSize:(double)a3 attributesContentViewExtraHeight:(double)a4 insets:(double)a5 userInfoViewHeight:(double)a6 RTL:(double)a7 avatarViewStartFrame:(double)a8 avatarViewAlpha:(double)a9 environment:(uint64_t)a10;
+ (BOOL)shouldShowSideGroupPickerForContainerSize:(CGSize)a3 forEnvironment:(id)a4;
+ (id)defaultLayoutInContainerOfSize:(CGSize)a3 insets:(UIEdgeInsets)a4 userInfoViewHeight:(double)a5 RTL:(BOOL)a6 environment:(id)a7;
+ (id)defaultLayoutInContainerOfSize:(CGSize)a3 insets:(UIEdgeInsets)a4 userInfoViewHeight:(double)a5 RTL:(BOOL)a6 environment:(id)a7 maxGroupLabelWidth:(double)a8;
+ (id)editorToActionsTransitionStartingLayoutInContainerOfSize:(CGSize)a3 insets:(UIEdgeInsets)a4 userInfoViewHeight:(double)a5 RTL:(BOOL)a6 environment:(id)a7;
@end

@implementation AVTAvatarAttributeEditorLayoutProvider

+ (BOOL)shouldShowSideGroupPickerForContainerSize:(CGSize)a3 forEnvironment:(id)a4
{
  double width = a3.width;
  BOOL result = objc_msgSend(a4, "deviceIsMac", a3.width, a3.height);
  if (width <= 300.0) {
    return 0;
  }
  return result;
}

+ (id)defaultLayoutInContainerOfSize:(CGSize)a3 insets:(UIEdgeInsets)a4 userInfoViewHeight:(double)a5 RTL:(BOOL)a6 environment:(id)a7
{
  return (id)objc_msgSend(a1, "defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:maxGroupLabelWidth:", a6, a7, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right, a5, 0.0);
}

+ (id)defaultLayoutInContainerOfSize:(CGSize)a3 insets:(UIEdgeInsets)a4 userInfoViewHeight:(double)a5 RTL:(BOOL)a6 environment:(id)a7 maxGroupLabelWidth:(double)a8
{
  BOOL v9 = a6;
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double height = a3.height;
  double width = a3.width;
  id v18 = a7;
  uint64_t v19 = objc_msgSend(a1, "shouldShowSideGroupPickerForContainerSize:forEnvironment:", v18, width, height);
  if (([v18 deviceIsMac] & 1) == 0) {
    uint64_t v19 = [v18 deviceIsPad] & v19;
  }
  id v20 = objc_alloc((Class)objc_opt_class());
  [v18 mainScreenScale];
  v22 = objc_msgSend(v20, "initWithContainerSize:insets:userInfoViewHeight:screenScale:RTL:showSideGroupPicker:maxGroupLabelWidth:", v9, v19, width, height, top, left, bottom, right, a5, v21, *(void *)&a8);

  return v22;
}

+ (AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout)actionsToEditorTransitionStartingLayoutInContainerOfSize:(double)a3 attributesContentViewExtraHeight:(double)a4 insets:(double)a5 userInfoViewHeight:(double)a6 RTL:(double)a7 avatarViewStartFrame:(double)a8 avatarViewAlpha:(double)a9 environment:(uint64_t)a10
{
  id v26 = a12;
  uint64_t v27 = objc_msgSend(a1, "shouldShowSideGroupPickerForContainerSize:forEnvironment:", v26, a2, a3);
  v28 = [AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout alloc];
  [v26 mainScreenScale];
  double v30 = v29;

  v31 = -[AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout initWithContainerSize:insets:userInfoViewHeight:screenScale:RTL:avatarViewContainerFrame:attributesContentViewFrameExtraHeight:avatarViewAlpha:showSideGroupPicker:](v28, "initWithContainerSize:insets:userInfoViewHeight:screenScale:RTL:avatarViewContainerFrame:attributesContentViewFrameExtraHeight:avatarViewAlpha:showSideGroupPicker:", a11, v27, a2, a3, a5, a6, a7, a8, a9, v30, a17, a18, a19, *(void *)&a4, a20);
  return v31;
}

+ (id)editorToActionsTransitionStartingLayoutInContainerOfSize:(CGSize)a3 insets:(UIEdgeInsets)a4 userInfoViewHeight:(double)a5 RTL:(BOOL)a6 environment:(id)a7
{
  v7 = objc_msgSend(a1, "defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:", a6, a7, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right, a5);
  v8 = [[AVTAvatarAttributeEditorOverridingLayout alloc] initWithLayout:v7];
  [(AVTAvatarAttributeEditorOverridingLayout *)v8 setAvatarContainerAlpha:0.0];

  return v8;
}

@end