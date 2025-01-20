@interface CNSharingProfileAvatarItemProviderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)animojiItemWithRecord:(id)a3 stickerConfiguration:(id)a4 backgroundColor:(id)a5;
+ (id)contactImageItemWithContact:(id)a3 renderer:(id)a4 logger:(id)a5 type:(int64_t)a6;
+ (id)monogramImageItemWithContact:(id)a3 monogramColor:(id)a4 renderer:(id)a5 RTL:(BOOL)a6;
+ (id)safeCategoryTargetClassName;
+ (id)silhouetteImageItemWithRenderer:(id)a3;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation CNSharingProfileAvatarItemProviderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNSharingProfileAvatarItemProvider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CNSharingProfileAvatarItemProvider", @"silhouetteImageItemWithRenderer:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CNSharingProfileAvatarItemProvider", @"contactImageItemWithContact:renderer:logger:type:", "@", "@", "@", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CNSharingProfileAvatarItemProvider", @"monogramImageItemWithContact:monogramColor:renderer:RTL:", "@", "@", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CNSharingProfileAvatarItemProvider", @"animojiItemWithRecord:stickerConfiguration:backgroundColor:", "@", "@", "@", "@", 0);
}

+ (id)silhouetteImageItemWithRenderer:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CNSharingProfileAvatarItemProviderAccessibility;
  id v3 = objc_msgSendSuper2(&v6, sel_silhouetteImageItemWithRenderer_, a3);
  v4 = accessibilityLocalizedString(@"contact.image.type.silhouette");
  [v3 setAccessibilityValue:v4];

  return v3;
}

+ (id)contactImageItemWithContact:(id)a3 renderer:(id)a4 logger:(id)a5 type:(int64_t)a6
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CNSharingProfileAvatarItemProviderAccessibility;
  objc_super v6 = objc_msgSendSuper2(&v9, sel_contactImageItemWithContact_renderer_logger_type_, a3, a4, a5, a6);
  v7 = accessibilityLocalizedString(@"contact.image.type.photo");
  [v6 setAccessibilityValue:v7];

  return v6;
}

+ (id)monogramImageItemWithContact:(id)a3 monogramColor:(id)a4 renderer:(id)a5 RTL:(BOOL)a6
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CNSharingProfileAvatarItemProviderAccessibility;
  objc_super v6 = objc_msgSendSuper2(&v9, sel_monogramImageItemWithContact_monogramColor_renderer_RTL_, a3, a4, a5, a6);
  v7 = accessibilityLocalizedString(@"contact.image.type.monogram");
  [v6 setAccessibilityValue:v7];

  return v6;
}

+ (id)animojiItemWithRecord:(id)a3 stickerConfiguration:(id)a4 backgroundColor:(id)a5
{
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___CNSharingProfileAvatarItemProviderAccessibility;
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = objc_msgSendSuper2(&v14, sel_animojiItemWithRecord_stickerConfiguration_backgroundColor_, v8, v7, a5);
  v10 = [v7 safeStringForKey:@"localizedName"];

  v11 = [MEMORY[0x263F22288] descriptionForAvatarWithRecord:v8 includeVideoPrefix:0];

  v12 = __UIAXStringForVariables();
  objc_msgSend(v9, "setAccessibilityValue:", v12, v11, @"__AXStringForVariablesSentinel", v14.receiver, v14.super_class);

  return v9;
}

@end