@interface SBHProxiedApplicationPlaceholderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation SBHProxiedApplicationPlaceholderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHProxiedApplicationPlaceholder";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHProxiedApplicationPlaceholder", @"icon:statusDescriptionForLocation:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FBSApplicationPlaceholder", @"progress", "@", 0);
  [v3 validateProtocol:@"FBSApplicationPlaceholderProgress" hasRequiredInstanceMethod:@"percentComplete"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHProxiedApplicationPlaceholder", @"placeholderProxy", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHProxiedApplicationPlaceholder", @"isFailed", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHProxiedApplicationPlaceholder", @"isPausable", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHProxiedApplicationPlaceholder", @"isPaused", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHProxiedApplicationPlaceholder", @"isDownloading", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHProxiedApplicationPlaceholder", @"applicationDisplayName", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(SBHProxiedApplicationPlaceholderAccessibility *)self safeValueForKey:@"applicationDisplayName"];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  AXPerformSafeBlock();
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  v4 = __UIAXStringForVariables();

  return v4;
}

void __67__SBHProxiedApplicationPlaceholderAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  id v3 = (id *)getSBIconLocationNoneSymbolLoc_ptr;
  uint64_t v12 = getSBIconLocationNoneSymbolLoc_ptr;
  if (!getSBIconLocationNoneSymbolLoc_ptr)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getSBIconLocationNoneSymbolLoc_block_invoke;
    v8[3] = &unk_265157D98;
    v8[4] = &v9;
    __getSBIconLocationNoneSymbolLoc_block_invoke((uint64_t)v8);
    id v3 = (id *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v3) {
    __67__SBHProxiedApplicationPlaceholderAccessibility_accessibilityLabel__block_invoke_cold_1();
  }
  id v4 = *v3;
  uint64_t v5 = [v2 icon:0 statusDescriptionForLocation:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)accessibilityValue
{
  id v3 = [(SBHProxiedApplicationPlaceholderAccessibility *)self safeValueForKey:@"placeholderProxy"];
  id v4 = [v3 safeValueForKey:@"progress"];
  [v4 safeDoubleForKey:@"percentComplete"];
  double v6 = v5;

  int v7 = [(SBHProxiedApplicationPlaceholderAccessibility *)self safeBoolForKey:@"isDownloading"];
  uint64_t v8 = 0;
  if (v7 && v6 > 0.0)
  {
    float v9 = v6;
    uint64_t v8 = MEMORY[0x245663CE0](0, v9);
  }

  return v8;
}

- (id)accessibilityHint
{
  id v3 = AXSBHIconManagerFromSharedIconController();
  char v4 = [v3 safeBoolForKey:@"isEditing"];

  if (v4) {
    goto LABEL_2;
  }
  if (([(SBHProxiedApplicationPlaceholderAccessibility *)self safeBoolForKey:@"isFailed"] & 1) != 0
    || ([(SBHProxiedApplicationPlaceholderAccessibility *)self safeBoolForKey:@"isPaused"] & 1) != 0)
  {
    double v6 = @"app.icon.resume.download.hint";
  }
  else
  {
    if (![(SBHProxiedApplicationPlaceholderAccessibility *)self safeBoolForKey:@"isPausable"])
    {
LABEL_2:
      double v5 = 0;
      goto LABEL_7;
    }
    double v6 = @"app.icon.pause.download.hint";
  }
  double v5 = accessibilityLocalizedString(v6);
LABEL_7:

  return v5;
}

void __67__SBHProxiedApplicationPlaceholderAccessibility_accessibilityLabel__block_invoke_cold_1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getSBIconLocationNone(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBHProxiedApplicationPlaceholderAccessibility.m", 17, @"%s", dlerror());

  __break(1u);
}

@end