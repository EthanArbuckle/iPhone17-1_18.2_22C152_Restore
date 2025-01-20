@interface MFMessageContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (MFMessageContentViewAccessibility)initWithFrame:(CGRect)a3;
- (int64_t)accessibilityNavigationStyle;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)generateSnapshotImageWithCompletion:(id)a3;
@end

@implementation MFMessageContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFMessageContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMessageContentView", @"webView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMessageContentView", @"generateSnapshotImageWithCompletion:", "v", "@?", 0);
  [v3 validateClass:@"MFMessageContentView" isKindOfClass:@"UIView"];
}

- (MFMessageContentViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFMessageContentViewAccessibility;
  id v3 = -[MFMessageContentViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MFMessageContentViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)generateSnapshotImageWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__MFMessageContentViewAccessibility_generateSnapshotImageWithCompletion___block_invoke;
  v8[3] = &unk_2651334E0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  v6 = (void *)MEMORY[0x245655380](v8);
  v7.receiver = self;
  v7.super_class = (Class)MFMessageContentViewAccessibility;
  [(MFMessageContentViewAccessibility *)&v7 generateSnapshotImageWithCompletion:v6];
}

void __73__MFMessageContentViewAccessibility_generateSnapshotImageWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F81198] defaultVoiceOverOptions];
  [v4 setIncludeWindowlessViews:1];
  [v4 setSorted:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x263F811A8]) initWithRootElement:*(void *)(a1 + 32) traversalOptions:v4];
  [v5 setShouldResolveRemoteElements:1];
  id v10 = 0;
  v6 = [v5 encodeWithError:&v10];
  id v7 = v10;
  if (v7)
  {
    v8 = AXLogAppAccessibility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __73__MFMessageContentViewAccessibility_generateSnapshotImageWithCompletion___block_invoke_cold_1((uint64_t)v7, v8);
    }
  }
  [v3 _setAccessibilityEncodedHierarchyData:v6];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)MFMessageContentViewAccessibility;
  [(MFMessageContentViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(MFMessageContentViewAccessibility *)self safeValueForKey:@"webView"];
  id v4 = __UIAccessibilityCastAsClass();

  id v5 = [v4 scrollView];
  [v5 accessibilitySetIdentification:@"kAXMailContentViewWebViewIdentifier"];
}

- (int64_t)accessibilityNavigationStyle
{
  return 1;
}

void __73__MFMessageContentViewAccessibility_generateSnapshotImageWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2422B1000, a2, OS_LOG_TYPE_ERROR, "Could not encode ax hierarchy for mail snapshot. %@", (uint8_t *)&v2, 0xCu);
}

@end