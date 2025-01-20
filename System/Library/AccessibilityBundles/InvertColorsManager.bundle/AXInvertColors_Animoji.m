@interface AXInvertColors_Animoji
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_Animoji

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PuppetCollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PuppetCollectionViewCell", @"pickerView:viewForRow:forComponent:reusingView:", "@", "q", "q", "@", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"PuppetCollectionViewCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PuppetPickerViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 3;
}

@end