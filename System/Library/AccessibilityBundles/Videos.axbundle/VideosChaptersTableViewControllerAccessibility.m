@interface VideosChaptersTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation VideosChaptersTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosChaptersTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosChaptersTableViewController", @"tableView: cellForRowAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosChaptersTableViewController", @"item", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"VideosFormatters", @"localizedChapterTitle:", "@", "Q", 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)VideosChaptersTableViewControllerAccessibility;
  v8 = [(VideosChaptersTableViewControllerAccessibility *)&v26 tableView:v6 cellForRowAtIndexPath:v7];
  objc_opt_class();
  v9 = [(VideosChaptersTableViewControllerAccessibility *)self safeValueForKey:@"item"];
  v10 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v11 = objc_msgSend(v10, "chapterOfType:atIndex:", 1, objc_msgSend(v7, "row"));
  v12 = __UIAccessibilityCastAsClass();

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  id v19 = v7;
  AXPerformSafeBlock();
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  v14 = [v8 textLabel];
  v15 = [v14 accessibilityLabel];
  [v12 playbackTime];
  v18 = AXDurationStringForDuration();
  v16 = __UIAXStringForVariables();

  objc_msgSend(v8, "setAccessibilityLabel:", v16, v13, v18, @"__AXStringForVariablesSentinel");

  return v8;
}

uint64_t __82__VideosChaptersTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend((id)MEMORY[0x2456693D0](@"VideosFormatters"), "localizedChapterTitle:", objc_msgSend(*(id *)(a1 + 32), "row") + 1);

  return MEMORY[0x270F9A758]();
}

@end