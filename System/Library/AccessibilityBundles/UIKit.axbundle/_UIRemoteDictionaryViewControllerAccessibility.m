@interface _UIRemoteDictionaryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_handleDownloadButton:(id)a3;
@end

@implementation _UIRemoteDictionaryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIRemoteDictionaryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = "@";
  v3 = @"_UIRemoteDictionaryViewController";
  [location[0] validateClass:"@" hasInstanceMethod:"@" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_handleDownloadButton:", "v", v4, 0);
  [location[0] validateClass:v3 hasInstanceVariable:@"_availableDictionaries" withType:"NSArray"];
  [location[0] validateClass:@"_UIDefinitionDictionary" hasInstanceVariable:@"_rawAsset" withType:"MAAsset"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"ASAsset", @"attributes", v4, 0);
  objc_storeStrong(v6, v5);
}

- (void)_handleDownloadButton:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIRemoteDictionaryViewControllerAccessibility;
  [(_UIRemoteDictionaryViewControllerAccessibility *)&v3 _handleDownloadButton:location[0]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v47 = 0;
  objc_storeStrong(&v47, a4);
  v45.receiver = v49;
  v45.super_class = (Class)_UIRemoteDictionaryViewControllerAccessibility;
  id v46 = [(_UIRemoteDictionaryViewControllerAccessibility *)&v45 tableView:location[0] cellForRowAtIndexPath:v47];
  v39[1] = (id)MEMORY[0x263EF8330];
  int v40 = -1073741824;
  int v41 = 0;
  v42 = __82___UIRemoteDictionaryViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke;
  v43 = &unk_2650ADF18;
  id v44 = v46;
  AXPerformSafeBlock();
  char v38 = 0;
  objc_opt_class();
  id v10 = (id)[(_UIRemoteDictionaryViewControllerAccessibility *)v49 safeValueForKey:@"_availableDictionaries"];
  id v37 = (id)__UIAccessibilityCastAsClass();

  id v36 = v37;
  objc_storeStrong(&v37, 0);
  v39[0] = v36;
  char v34 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  int v28 = 838860800;
  int v29 = 48;
  v30 = __Block_byref_object_copy__29;
  v31 = __Block_byref_object_dispose__29;
  id v32 = 0;
  uint64_t v19 = MEMORY[0x263EF8330];
  int v20 = -1073741824;
  int v21 = 0;
  v22 = __82___UIRemoteDictionaryViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_345;
  v23 = &unk_2650ADF88;
  v25[1] = &v26;
  id v24 = v36;
  v25[0] = v47;
  AXPerformSafeBlock();
  id v18 = (id)v27[5];
  objc_storeStrong(v25, 0);
  objc_storeStrong(&v24, 0);
  _Block_object_dispose(&v26, 8);
  objc_storeStrong(&v32, 0);
  id v33 = (id)__UIAccessibilitySafeClass();

  if (v34) {
    abort();
  }
  id v17 = v33;
  objc_storeStrong(&v33, 0);
  id v35 = v17;
  char v15 = 0;
  id v8 = (id)[v17 safeValueForKey:@"_rawAsset"];
  id v14 = (id)__UIAccessibilitySafeClass();

  id v13 = v14;
  objc_storeStrong(&v14, 0);
  id v16 = v13;
  id v5 = (id)[v13 attributes];
  id v12 = (id)[v5 objectForKey:@"IndexLanguages"];

  id v11 = (id)[v12 firstObject];
  id v6 = (id)[v46 detailTextLabel];
  [v6 setAccessibilityLanguage:v11];

  id v7 = v46;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(v39, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(location, 0);

  return v7;
}

@end