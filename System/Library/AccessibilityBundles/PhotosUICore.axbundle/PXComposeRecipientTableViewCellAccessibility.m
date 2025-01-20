@interface PXComposeRecipientTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (unint64_t)accessibilityTraits;
- (void)selectCheckbox;
- (void)unselectCheckbox;
@end

@implementation PXComposeRecipientTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXComposeRecipientTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXComposeRecipientTableViewCell" hasInstanceVariable:@"_cellModel" withType:"PXComposeRecipientTableCellModel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXComposeRecipientTableCellModel", @"showsCheckbox", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXComposeRecipientTableCellModel", @"checked", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXComposeRecipientTableViewCell", @"_updateAccessoryImageView", "v", 0);
  [v3 validateClass:@"PXComposeRecipientTableViewCell" isKindOfClass:@"UITableViewCell"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)PXComposeRecipientTableViewCellAccessibility;
  unint64_t v3 = [(PXComposeRecipientTableViewCellAccessibility *)&v6 accessibilityTraits];
  v4 = [(PXComposeRecipientTableViewCellAccessibility *)self safeValueForKey:@"_cellModel"];
  if ([v4 safeBoolForKey:@"showsCheckbox"]
    && [v4 safeBoolForKey:@"checked"])
  {
    v3 |= *MEMORY[0x263F1CF38];
  }

  return v3;
}

- (id)accessibilityCustomActions
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  v4 = [(PXComposeRecipientTableViewCellAccessibility *)self safeValueForKey:@"_cellModel"];
  if ([v4 safeBoolForKey:@"showsCheckbox"])
  {
    int v5 = [v4 safeBoolForKey:@"checked"];
    id v6 = objc_alloc(MEMORY[0x263F1C390]);
    if (v5) {
      v7 = @"unselect";
    }
    else {
      v7 = @"select";
    }
    if (v5) {
      v8 = &selRef_unselectCheckbox;
    }
    else {
      v8 = &selRef_selectCheckbox;
    }
    v9 = accessibilityPhotosUICoreLocalizedString(v7);
    v10 = (void *)[v6 initWithName:v9 target:self selector:*v8];

    [v3 addObject:v10];
    [(PXComposeRecipientTableViewCellAccessibility *)self _updateAccessoryImageView];
  }

  return v3;
}

- (void)selectCheckbox
{
  unint64_t v3 = [(PXComposeRecipientTableViewCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  if (v3)
  {
    id v6 = v3;
    v4 = [v3 indexPathForCell:self];
    [v6 contentOffset];
    [v6 selectRowAtIndexPath:v4 animated:1 scrollPosition:(uint64_t)v5];

    unint64_t v3 = v6;
  }
}

- (void)unselectCheckbox
{
  unint64_t v3 = [(PXComposeRecipientTableViewCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  if (v3)
  {
    id v5 = v3;
    v4 = [v3 indexPathForCell:self];
    [v5 deselectRowAtIndexPath:v4 animated:1];

    unint64_t v3 = v5;
  }
}

@end