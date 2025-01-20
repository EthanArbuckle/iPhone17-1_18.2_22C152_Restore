@interface VTUIVoiceSelectionOptionsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_tableCellForVoiceViewModel:(id)a3 indexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation VTUIVoiceSelectionOptionsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VTUIVoiceSelectionOptionsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIVoiceSelectionOptionsView", @"_tableCellForVoiceViewModel:indexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIVoiceSelectionOptionsView", @"tableView:didSelectRowAtIndexPath:", "v", "@", "@", 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  UIAccessibilitySpeak();
  v8.receiver = self;
  v8.super_class = (Class)VTUIVoiceSelectionOptionsViewAccessibility;
  [(VTUIVoiceSelectionOptionsViewAccessibility *)&v8 tableView:v7 didSelectRowAtIndexPath:v6];
}

- (id)_tableCellForVoiceViewModel:(id)a3 indexPath:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)VTUIVoiceSelectionOptionsViewAccessibility;
  v4 = [(VTUIVoiceSelectionOptionsViewAccessibility *)&v6 _tableCellForVoiceViewModel:a3 indexPath:a4];
  [v4 _setAccessibilityAdditionalTraitsBlock:&__block_literal_global_0];

  return v4;
}

uint64_t __84__VTUIVoiceSelectionOptionsViewAccessibility__tableCellForVoiceViewModel_indexPath___block_invoke()
{
  return *MEMORY[0x263F1CF28] | *MEMORY[0x263F1CF40];
}

@end