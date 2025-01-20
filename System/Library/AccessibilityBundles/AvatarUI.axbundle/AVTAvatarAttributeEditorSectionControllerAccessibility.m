@interface AVTAvatarAttributeEditorSectionControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)viewForIndex:(int64_t)a3;
@end

@implementation AVTAvatarAttributeEditorSectionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTAvatarAttributeEditorSectionController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVTAvatarAttributeEditorSection"];
  [v3 validateClass:@"AVTAvatarAttributeEditorSectionItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSectionController", @"section", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSection", @"sectionItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSectionItem", @"localizedName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSection", @"localizedName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSectionController", @"viewForIndex:", "@", "q", 0);
  [v3 validateClass:@"AVTAvatarAttributeEditorSectionCoordinator"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSectionCoordinator", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorViewController", @"dataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorDataSource", @"categories", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorDataSource", @"currentCategoryIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorCategory", @"localizedName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorCategory", @"sections", "@", 0);
  [v3 validateProtocol:@"AVTAvatarAttributeEditorSection" hasRequiredInstanceMethod:@"localizedName"];
}

- (id)viewForIndex:(int64_t)a3
{
  v30.receiver = self;
  v30.super_class = (Class)AVTAvatarAttributeEditorSectionControllerAccessibility;
  v5 = -[AVTAvatarAttributeEditorSectionControllerAccessibility viewForIndex:](&v30, sel_viewForIndex_);
  objc_opt_class();
  v6 = [(AVTAvatarAttributeEditorSectionControllerAccessibility *)self safeValueForKeyPath:@"section.sectionItems"];
  v7 = __UIAccessibilityCastAsClass();

  v8 = [v7 objectAtIndex:a3];
  MEMORY[0x245642ED0](@"AVTAvatarAttributeEditorSectionItem");
  if (objc_opt_isKindOfClass())
  {
    v9 = [v8 safeStringForKey:@"localizedName"];
    [v5 setAccessibilityLabel:v9];
    v10 = [(AVTAvatarAttributeEditorSectionControllerAccessibility *)self safeValueForKey:@"section"];
    v11 = [v10 safeStringForKey:@"localizedName"];
    if (!v11)
    {
      v12 = [(AVTAvatarAttributeEditorSectionControllerAccessibility *)self safeValueForKey:@"delegate"];
      MEMORY[0x245642ED0](@"AVTAvatarAttributeEditorSectionCoordinator");
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v12 safeValueForKey:@"delegate"];

        v12 = (void *)v13;
      }
      v14 = [v12 safeValueForKey:@"dataSource"];
      v15 = [v14 safeArrayForKey:@"categories"];
      v28 = v14;
      v16 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v14, "safeUnsignedIntegerForKey:", @"currentCategoryIndex"));

      v17 = [v16 safeArrayForKey:@"sections"];
      v29 = v10;
      unint64_t v18 = [v17 indexOfObject:v10];
      if (v18 >= [v17 count]) {
        goto LABEL_10;
      }
      v27 = v9;
      do
      {
        v19 = [v17 objectAtIndexedSubscript:v18];
        v11 = [v19 safeValueForKey:@"localizedName"];

        --v18;
      }
      while (v18 < [v17 count] && !v11);
      v9 = v27;
      if (!v11)
      {
LABEL_10:
        v11 = [v16 safeValueForKey:@"localizedName"];
      }

      v10 = v29;
    }
    uint64_t v20 = [v11 length];
    v21 = NSString;
    int64_t v22 = a3 + 1;
    if (v20)
    {
      v23 = accessibilityLocalizedString(@"starfish.number.of.in");
      objc_msgSend(v21, "stringWithFormat:", v23, v22, objc_msgSend(v7, "count"), v11);
    }
    else
    {
      v23 = accessibilityLocalizedString(@"starfish.number.of");
      objc_msgSend(v21, "stringWithFormat:", v23, v22, objc_msgSend(v7, "count"), v26);
    v24 = };
    [v5 setAccessibilityValue:v24];
  }

  return v5;
}

@end