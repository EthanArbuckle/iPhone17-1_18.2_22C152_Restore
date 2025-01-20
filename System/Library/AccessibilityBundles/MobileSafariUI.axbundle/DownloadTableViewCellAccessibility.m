@interface DownloadTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (DownloadTableViewCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateCellContents;
@end

@implementation DownloadTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DownloadTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"DownloadTableViewCell" hasInstanceVariable:@"_cancelButton" withType:"UIButton"];
  [v3 validateClass:@"DownloadTableViewCell" hasInstanceVariable:@"_resumeButton" withType:"UIButton"];
  [v3 validateClass:@"DownloadTableViewCell" hasInstanceVariable:@"_revealButton" withType:"UIButton"];
  [v3 validateClass:@"DownloadTableViewCell" hasInstanceVariable:@"_progressView" withType:"UIProgressView"];
  [v3 validateClass:@"DownloadTableViewCell" hasInstanceVariable:@"_nameLabel" withType:"UILabel"];
  [v3 validateClass:@"DownloadTableViewCell" hasInstanceVariable:@"_statusLabel" withType:"UILabel"];
  [v3 validateClass:@"DownloadTableViewCell" hasInstanceVariable:@"_download" withType:"_SFDownload"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DownloadTableViewCell", @"_updateCellContents", "v", 0);
}

- (DownloadTableViewCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)DownloadTableViewCellAccessibility;
  v4 = [(DownloadTableViewCellAccessibility *)&v6 initWithStyle:a3 reuseIdentifier:a4];
  [(DownloadTableViewCellAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

- (void)_updateCellContents
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadTableViewCellAccessibility;
  [(DownloadTableViewCellAccessibility *)&v3 _updateCellContents];
  [(DownloadTableViewCellAccessibility *)self _accessibilityClearChildren];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)DownloadTableViewCellAccessibility;
  [(DownloadTableViewCellAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = accessibilityLocalizedString(@"cancel.download.button");
  v4 = [(DownloadTableViewCellAccessibility *)self safeUIViewForKey:@"_cancelButton"];
  [v4 setAccessibilityLabel:v3];

  v5 = accessibilityLocalizedString(@"resume.download.button");
  objc_super v6 = [(DownloadTableViewCellAccessibility *)self safeUIViewForKey:@"_resumeButton"];
  [v6 setAccessibilityLabel:v5];

  v7 = accessibilityLocalizedString(@"reveal.download.button");
  v8 = [(DownloadTableViewCellAccessibility *)self safeUIViewForKey:@"_revealButton"];
  [v8 setAccessibilityLabel:v7];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadTableViewCellAccessibility;
  return *MEMORY[0x263F1CF68] | [(DownloadTableViewCellAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)isAccessibilityElement
{
  return AXRequestingClient() == 3 || AXRequestingClient() == 4;
}

- (id)accessibilityLabel
{
  objc_super v3 = [(DownloadTableViewCellAccessibility *)self safeUIViewForKey:@"_progressView"];
  if ([v3 _accessibilityViewIsVisible])
  {
    v4 = [(DownloadTableViewCellAccessibility *)self safeUIViewForKey:@"_progressView"];
    v5 = [v4 accessibilityLabel];
    objc_super v6 = [(DownloadTableViewCellAccessibility *)self safeUIViewForKey:@"_progressView"];
    v17 = [v6 accessibilityValue];
    v7 = __UIAXStringForVariables();
  }
  else
  {
    v7 = 0;
  }

  v8 = [(DownloadTableViewCellAccessibility *)self safeValueForKey:@"_download"];
  objc_super v9 = __UIAccessibilitySafeClass();

  v10 = [v9 uti];
  v11 = UIAXFileTypeDescriptionForUTI();

  v12 = [(DownloadTableViewCellAccessibility *)self safeUIViewForKey:@"_nameLabel"];
  v13 = [v12 accessibilityLabel];
  v14 = [(DownloadTableViewCellAccessibility *)self safeUIViewForKey:@"_statusLabel"];
  v18 = [v14 accessibilityLabel];
  v15 = __UIAXStringForVariables();

  return v15;
}

- (id)accessibilityCustomActions
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v4 = [(DownloadTableViewCellAccessibility *)self safeUIViewForKey:@"_cancelButton"];
  int v5 = [v4 _accessibilityViewIsVisible];

  if (v5)
  {
    objc_super v6 = [(DownloadTableViewCellAccessibility *)self safeUIViewForKey:@"_cancelButton"];
    uint64_t v7 = [v6 accessibilityLabel];

    v8 = [(DownloadTableViewCellAccessibility *)self _privateAccessibilityCustomActions];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __64__DownloadTableViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v30[3] = &unk_265137108;
    id v9 = (id)v7;
    id v31 = v9;
    LOBYTE(v7) = objc_msgSend(v8, "ax_containsObjectUsingBlock:", v30);

    if ((v7 & 1) == 0)
    {
      id v10 = objc_alloc(MEMORY[0x263F1C390]);
      v11 = [(DownloadTableViewCellAccessibility *)self safeUIViewForKey:@"_cancelButton"];
      v12 = [v11 accessibilityLabel];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __64__DownloadTableViewCellAccessibility_accessibilityCustomActions__block_invoke_2;
      v29[3] = &unk_265137108;
      v29[4] = self;
      v13 = (void *)[v10 initWithName:v12 actionHandler:v29];
      [v3 addObject:v13];
    }
  }
  v14 = [(DownloadTableViewCellAccessibility *)self safeUIViewForKey:@"_resumeButton"];
  int v15 = [v14 _accessibilityViewIsVisible];

  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x263F1C390]);
    v17 = [(DownloadTableViewCellAccessibility *)self safeUIViewForKey:@"_resumeButton"];
    v18 = [v17 accessibilityLabel];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __64__DownloadTableViewCellAccessibility_accessibilityCustomActions__block_invoke_3;
    v28[3] = &unk_265137108;
    v28[4] = self;
    v19 = (void *)[v16 initWithName:v18 actionHandler:v28];
    [v3 addObject:v19];
  }
  v20 = [(DownloadTableViewCellAccessibility *)self safeUIViewForKey:@"_revealButton"];
  int v21 = [v20 _accessibilityViewIsVisible];

  if (v21)
  {
    id v22 = objc_alloc(MEMORY[0x263F1C390]);
    v23 = [(DownloadTableViewCellAccessibility *)self safeUIViewForKey:@"_revealButton"];
    v24 = [v23 accessibilityLabel];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __64__DownloadTableViewCellAccessibility_accessibilityCustomActions__block_invoke_4;
    v27[3] = &unk_265137108;
    v27[4] = self;
    v25 = (void *)[v22 initWithName:v24 actionHandler:v27];
    [v3 addObject:v25];
  }

  return v3;
}

uint64_t __64__DownloadTableViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __64__DownloadTableViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = [*(id *)(a1 + 32) safeUIViewForKey:@"_cancelButton"];
  int v5 = __UIAccessibilityCastAsClass();

  [v5 sendActionsForControlEvents:64];
  return 1;
}

uint64_t __64__DownloadTableViewCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = [*(id *)(a1 + 32) safeUIViewForKey:@"_resumeButton"];
  int v5 = __UIAccessibilityCastAsClass();

  [v5 sendActionsForControlEvents:64];
  return 1;
}

uint64_t __64__DownloadTableViewCellAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = [*(id *)(a1 + 32) safeUIViewForKey:@"_revealButton"];
  int v5 = __UIAccessibilityCastAsClass();

  [v5 sendActionsForControlEvents:64];
  return 1;
}

@end