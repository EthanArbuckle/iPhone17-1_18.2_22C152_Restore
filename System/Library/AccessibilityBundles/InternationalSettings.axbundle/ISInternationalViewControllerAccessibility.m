@interface ISInternationalViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forPreferredLanguageAtIndex:(unint64_t)a4;
@end

@implementation ISInternationalViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ISInternationalViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ISInternationalViewController", @"updateCell: forPreferredLanguageAtIndex:", "v", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ISInternationalViewController", @"updatedAppleLanguages", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ISInternationalViewController", @"tableView: cellForRowAtIndexPath:", "@", "@", "@", 0);
}

- (void)updateCell:(id)a3 forPreferredLanguageAtIndex:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ISInternationalViewControllerAccessibility;
  [(ISInternationalViewControllerAccessibility *)&v10 updateCell:v6 forPreferredLanguageAtIndex:a4];
  v7 = [(ISInternationalViewControllerAccessibility *)self safeValueForKey:@"updatedAppleLanguages"];
  v8 = __UIAccessibilitySafeClass();

  if (!v8)
  {
    v8 = [MEMORY[0x263EFF960] preferredLanguages];
  }
  if ([v8 count] > a4)
  {
    v9 = [v8 objectAtIndexedSubscript:a4];
    [v6 accessibilitySetIdentification:@"LanguageCell"];
    [v6 _accessibilitySetRetainedValue:v9 forKey:@"axLanguage"];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ISInternationalViewControllerAccessibility;
  v8 = [(ISInternationalViewControllerAccessibility *)&v20 tableView:v6 cellForRowAtIndexPath:v7];
  if ([v7 section])
  {
    v9 = 0;
  }
  else
  {
    objc_opt_class();
    objc_super v10 = __UIAccessibilityCastAsClass();
    [v10 indexForIndexPath:v7];

    objc_opt_class();
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    id v19 = 0;
    AXPerformSafeBlock();
    id v11 = (id)v15[5];
    _Block_object_dispose(&v14, 8);

    v12 = __UIAccessibilityCastAsClass();

    v9 = [v12 name];
  }
  if ([(__CFString *)v9 isEqualToString:@"pt"])
  {

    v9 = @"pt-BR";
  }
  [v8 accessibilitySetIdentification:@"LanguageCell"];
  [v8 _accessibilitySetRetainedValue:v9 forKey:@"axLanguage"];

  return v8;
}

void __78__ISInternationalViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) safeValueForKey:@"_specifiers"];
  uint64_t v2 = [v5 objectAtIndex:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end