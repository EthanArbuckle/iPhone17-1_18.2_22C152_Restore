@interface HUSceneActionEditorViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
@end

@implementation HUSceneActionEditorViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUSceneActionEditorViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUSceneActionEditorViewController", @"setupCell:forItem:indexPath:", "v", "@", "@", "@", 0);
  [v3 validateClass:@"HUSceneActionEditorViewController" isKindOfClass:@"HUItemTableViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUItemTableViewController", @"itemManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUSceneActionEditorItemManager", @"nameAndIconItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUNameAndIconEditorCell", @"iconButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUNameAndIconEditorCell", @"textField", "@", 0);
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUSceneActionEditorViewControllerAccessibility;
  id v9 = a4;
  [(HUSceneActionEditorViewControllerAccessibility *)&v15 setupCell:v8 forItem:v9 indexPath:a5];
  id v10 = [(HUSceneActionEditorViewControllerAccessibility *)self safeValueForKeyPath:@"itemManager.nameAndIconItem"];

  if (v10 == v9)
  {
    v11 = (void *)MEMORY[0x263EFF8C0];
    v12 = [v8 safeValueForKey:@"iconButton"];
    v13 = [v8 safeValueForKey:@"textField"];
    v14 = objc_msgSend(v11, "axArrayByIgnoringNilElementsWithCount:", 2, v12, v13, v15.receiver, v15.super_class);
    [v8 setAccessibilityElements:v14];
  }
  else
  {
    [v8 setAccessibilityElements:0];
  }
}

@end