@interface MPRecentsTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityTableView:(id)a3 endRowActionHandlingForIndexPath:(id)a4;
- (void)_accessibilityTableView:(id)a3 prepareForRowActionHandlingForIndexPath:(id)a4;
@end

@implementation MPRecentsTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPRecentsTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CHRecentCall"];
  [v3 validateClass:@"MPLegacyRecentsTableViewCell" isKindOfClass:@"PHTableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHTableViewCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHTableViewCell", @"subtitleLabel", "@", 0);
  [v3 validateClass:@"MPRecentsTableViewController" conformsToProtocol:@"UITableViewDataSource"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPRecentsTableViewController", @"tableView:cellForRowAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPRecentsTableViewController", @"recentCallAtTableViewIndex:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPRecentsTableViewController", @"setEditing:animated:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPRecentsTableViewController", @"reloadDataSource", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHRecentCall", @"ph_supportsLocalParticipantBadge", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPRecentsTableViewController", @"showRecentCallDetailsViewControllerForRecentCall:animated:", "v", "@", "B", 0);
}

- (void)_accessibilityTableView:(id)a3 prepareForRowActionHandlingForIndexPath:(id)a4
{
}

uint64_t __109__MPRecentsTableViewControllerAccessibility__accessibilityTableView_prepareForRowActionHandlingForIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEditing:1 animated:0];
}

- (void)_accessibilityTableView:(id)a3 endRowActionHandlingForIndexPath:(id)a4
{
}

uint64_t __102__MPRecentsTableViewControllerAccessibility__accessibilityTableView_endRowActionHandlingForIndexPath___block_invoke()
{
  return AXPerformSafeBlock();
}

uint64_t __102__MPRecentsTableViewControllerAccessibility__accessibilityTableView_endRowActionHandlingForIndexPath___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 _accessibilityBoolValueForKey:@"wasEditing"];

  return [v1 setEditing:v2 animated:0];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v71.receiver = self;
  v71.super_class = (Class)MPRecentsTableViewControllerAccessibility;
  v8 = [(MPRecentsTableViewControllerAccessibility *)&v71 tableView:v6 cellForRowAtIndexPath:v7];
  char v70 = 0;
  objc_opt_class();
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__0;
  v68 = __Block_byref_object_dispose__0;
  id v69 = 0;
  id v9 = v7;
  AXPerformSafeBlock();
  id v10 = (id)v65[5];

  _Block_object_dispose(&v64, 8);
  v11 = __UIAccessibilityCastAsClass();

  if (v70) {
    goto LABEL_43;
  }
  LOBYTE(v64) = 0;
  objc_opt_class();
  v12 = [v8 safeValueForKey:@"titleLabel"];
  v13 = __UIAccessibilityCastAsClass();

  if ((_BYTE)v64) {
    goto LABEL_43;
  }
  v14 = [v13 accessibilityLabel];

  LOBYTE(v64) = 0;
  objc_opt_class();
  v15 = [v8 safeValueForKey:@"subtitleLabel"];
  v16 = __UIAccessibilityCastAsClass();

  if ((_BYTE)v64) {
LABEL_43:
  }
    abort();
  v17 = [v16 accessibilityLabel];

  v62 = v6;
  if (v14)
  {
    v18 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    uint64_t v19 = [v14 rangeOfCharacterFromSet:v18];

    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = [MEMORY[0x263F21660] axAttributedStringWithString:v14];
      [v20 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21818]];

      v14 = v20;
    }
  }
  v61 = v9;
  int v21 = [v11 callStatus];
  int v22 = v21;
  v23 = (_DWORD *)MEMORY[0x263F305D8];
  v60 = v14;
  if ((*MEMORY[0x263F305C0] & v21) != 0 || (*MEMORY[0x263F305D8] & v21) != 0)
  {
    v53 = accessibilityLocalizedString(@"call.incoming");
    v54 = @"__AXStringForVariablesSentinel";
    v24 = __UIAXStringForVariables();
  }
  else
  {
    v24 = 0;
  }
  v25 = (_DWORD *)MEMORY[0x263F305B8];
  if ((*MEMORY[0x263F305C8] & v22) != 0 || (*MEMORY[0x263F305B8] & v22) != 0)
  {
    v53 = accessibilityLocalizedString(@"call.outgoing");
    v54 = @"__AXStringForVariablesSentinel";
    uint64_t v26 = __UIAXStringForVariables();

    v24 = (void *)v26;
  }
  if ((*v23 & v22) != 0)
  {
    v53 = accessibilityLocalizedString(@"call.missed");
    v54 = @"__AXStringForVariablesSentinel";
    uint64_t v27 = __UIAXStringForVariables();

    v24 = (void *)v27;
  }
  if ((*v25 & v22) != 0)
  {
    v53 = accessibilityLocalizedString(@"call.canceled");
    v54 = @"__AXStringForVariablesSentinel";
    uint64_t v28 = __UIAXStringForVariables();

    v24 = (void *)v28;
  }
  uint64_t v29 = objc_msgSend(v11, "mediaType", v53, v54);
  v30 = [v11 serviceProvider];
  if (![v30 isEqualToString:*MEMORY[0x263F30620]])
  {
    v32 = 0;
    goto LABEL_27;
  }
  if (v29 == 2)
  {
    v31 = @"application.name.facetime";
    goto LABEL_23;
  }
  if (v29 == 1)
  {
    v31 = @"facetime.audio";
LABEL_23:
    v32 = accessibilityLocalizedString(v31);
    goto LABEL_25;
  }
  v32 = 0;
LABEL_25:
  if ([v17 containsString:v32])
  {

    v32 = v17;
    v17 = 0;
  }
LABEL_27:
  uint64_t v33 = [v11 ttyType];
  if (v33 == 1)
  {
    v34 = @"call.type.tty";
    goto LABEL_31;
  }
  if (v33 == 2)
  {
    v34 = @"call.type.tty.relay";
LABEL_31:
    uint64_t v35 = accessibilityLocalizedString(v34);
    goto LABEL_33;
  }
  uint64_t v35 = 0;
LABEL_33:
  v36 = [v11 callOccurrences];
  uint64_t v37 = [v36 count];

  v57 = v30;
  v58 = v8;
  v55 = (void *)v35;
  v56 = v32;
  v38 = v17;
  if (v37)
  {
    v39 = NSString;
    v40 = accessibilityLocalizedString(@"num.calls");
    v41 = objc_msgSend(v39, "localizedStringWithFormat:", v40, v37);
  }
  else
  {
    v41 = 0;
  }
  v42 = [v11 date];
  v43 = [MEMORY[0x263F08790] localizedStringFromDate:v42 dateStyle:3 timeStyle:1];
  v44 = [MEMORY[0x263F7E1A0] sharedInstance];
  v45 = [v44 providerManager];
  v46 = [v45 telephonyProvider];

  v47 = [v46 prioritizedSenderIdentities];
  uint64_t v48 = [v47 count];

  v49 = [v11 localParticipantUUID];
  v63 = [v46 senderIdentityForAccountUUID:v49];

  v59 = v11;
  v50 = 0;
  if ([v11 safeBoolForKey:@"ph_supportsLocalParticipantBadge"] && v48 >= 2)
  {
    v50 = [v63 localizedName];
  }
  v51 = __UIAXStringForVariables();
  objc_msgSend(v58, "setAccessibilityLabel:", v51, v24, v50, v55, v56, v41, v38, v43, @"__AXStringForVariablesSentinel");
  [v58 setIsAccessibilityElement:1];

  return v58;
}

uint64_t __77__MPRecentsTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "recentCallAtTableViewIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));

  return MEMORY[0x270F9A758]();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)MPRecentsTableViewControllerAccessibility;
  [(MPRecentsTableViewControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  AXPerformSafeBlock();
}

uint64_t __87__MPRecentsTableViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadDataSource];
}

@end