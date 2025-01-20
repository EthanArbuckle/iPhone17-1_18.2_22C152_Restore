@interface SPUITableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation SPUITableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SPUITableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SPUITableViewController" isKindOfClass:@"UITableViewController"];
  [v3 validateClass:@"SPUITableViewController" conformsToProtocol:@"UITableViewDataSource"];
  [v3 validateClass:@"SPUISearchModel"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SPUISearchModel", @"sharedGeneralInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPUISearchModel", @"sections", "@", 0);
  [v3 validateClass:@"SPSearchResultSection"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPSearchResultSection", @"domain", "I", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPSearchResultSection", @"hasDisplayIdentifier", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPSearchResultSection", @"displayIdentifier", "@", 0);
  [v3 validateClass:@"FBApplicationInfo"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FBApplicationInfo", @"displayName", "@", 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SPUITableViewControllerAccessibility;
  v8 = [(SPUITableViewControllerAccessibility *)&v23 tableView:v6 cellForRowAtIndexPath:v7];
  [v7 section];
  v9 = [(id)MEMORY[0x2456626E0](@"SPUISearchModel") safeValueForKey:@"sharedGeneralInstance"];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  id v10 = v9;
  AXPerformSafeBlock();
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  int v12 = [v11 safeIntForKey:@"domain"];
  if ([v11 safeBoolForKey:@"hasDisplayIdentifier"])
  {
    v13 = [v11 safeValueForKey:@"displayIdentifier"];
  }
  else
  {
    v13 = 0;
  }
  v14 = 0;
  switch(v12)
  {
    case 2:

      v14 = 0;
      v13 = @"com.apple.MobileAddressBook";
      break;
    case 4:

      v13 = 0;
      v14 = 0;
      goto LABEL_18;
    case 6:
      v15 = @"search.result.music";
      goto LABEL_14;
    case 7:
      v15 = @"search.result.podcast";
      goto LABEL_14;
    case 8:
      v15 = @"search.result.video";
      goto LABEL_14;
    case 9:
      v15 = @"search.result.audiobook";
      goto LABEL_14;
    case 11:

      v14 = 0;
      v13 = @"com.apple.MobileSafari";
      break;
    case 13:

      v14 = 0;
      v13 = @"com.apple.reminders";
      break;
    case 14:
      v15 = @"search.result.documents";
LABEL_14:
      v14 = accessibilityLocalizedString(v15);
      break;
    default:
      break;
  }
  if (!v14 && v13)
  {
    v14 = AXApplicationNameLabelForBundleIdentifier();
  }
LABEL_18:
  if ([v14 length]) {
    [v8 accessibilitySetIdentification:v14];
  }

  return v8;
}

void __72__SPUITableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) safeArrayForKey:@"sections"];
  uint64_t v2 = [v5 objectAtIndex:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end