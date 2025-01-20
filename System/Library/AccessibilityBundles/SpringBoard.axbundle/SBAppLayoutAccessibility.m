@interface SBAppLayoutAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SBAppLayoutAccessibility)initWithItems:(id)a3 centerItem:(id)a4 floatingItem:(id)a5 configuration:(int64_t)a6 itemsToLayoutAttributes:(id)a7 centerConfiguration:(int64_t)a8 environment:(int64_t)a9 hidden:(BOOL)a10 preferredDisplayOrdinal:(int64_t)a11;
- (id)_axAllHandlesInCall:(id)a3;
- (id)_axBundleIdentifier;
- (id)_axContactForHandle:(id)a3;
- (id)_axDisplayItems;
- (id)_axDisplayName;
- (id)_axGetFirstCall;
- (id)_axGetFirstDestination;
- (id)_axGetFirstDestinationHandleValue;
- (id)_axGetHandlesAndLoadFirstDestinationInCall:(id)a3;
- (id)_axLabelForInCallService;
- (id)_axLabelWithFirstIconTitle:(id)a3 secondIconTitle:(id)a4;
- (id)_axPredicateForHandle:(id)a3;
- (int64_t)_axAppLayoutType;
- (int64_t)_axDisplaySizingPolicy;
- (void)_axLoadFirstDestinationIfNecessary;
- (void)_axSetFirstDestination:(id)a3;
- (void)_axSetFirstDestinationHandleValue:(id)a3;
@end

@implementation SBAppLayoutAccessibility

- (SBAppLayoutAccessibility)initWithItems:(id)a3 centerItem:(id)a4 floatingItem:(id)a5 configuration:(int64_t)a6 itemsToLayoutAttributes:(id)a7 centerConfiguration:(int64_t)a8 environment:(int64_t)a9 hidden:(BOOL)a10 preferredDisplayOrdinal:(int64_t)a11
{
  v16.receiver = self;
  v16.super_class = (Class)SBAppLayoutAccessibility;
  v11 = [(SBAppLayoutAccessibility *)&v16 initWithItems:a3 centerItem:a4 floatingItem:a5 configuration:a6 itemsToLayoutAttributes:a7 centerConfiguration:a8 environment:a9 hidden:a10 preferredDisplayOrdinal:a11];
  v12 = v11;
  if (v11)
  {
    v13 = [(SBAppLayoutAccessibility *)v11 _axBundleIdentifier];
    if ([v13 isEqualToString:*MEMORY[0x263F21248]]) {
      [(SBAppLayoutAccessibility *)v12 _axLoadFirstDestinationIfNecessary];
    }
  }
  return v12;
}

- (id)_axBundleIdentifier
{
  v2 = [(SBAppLayoutAccessibility *)self _axDisplayItems];
  v3 = [v2 firstObject];

  v4 = [v3 safeValueForKey:@"bundleIdentifier"];

  return v4;
}

- (id)_axDisplayItems
{
  return (id)[(SBAppLayoutAccessibility *)self safeArrayForKey:@"allItems"];
}

+ (id)safeCategoryTargetClassName
{
  return @"SBAppLayout";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"allItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"type", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", "@", "@", "@", "@", "q", "@", "q", "q", "B", "q", 0);
  [v3 validateClass:@"SBDisplayItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDisplayItem", @"bundleIdentifier", "@", 0);
  [v3 validateClass:@"SBContinuityDisplayItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBContinuityDisplayItem", @"appSuggestion", "@", 0);
  [v3 validateClass:@"SBBestAppSuggestion"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBestAppSuggestion", @"originatingDeviceType", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBestAppSuggestion", @"isLocallyGeneratedSuggestion", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationController", @"applicationWithBundleIdentifier:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CNPhoneNumber", @"phoneNumberWithDigits:countryCode:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"layoutAttributesForItem:", "@", "@", 0);
  [v3 validateClass:@"SBDisplayItemLayoutAttributes" hasProperty:@"sizingPolicy" withType:"q"];
}

- (id)_axLabelWithFirstIconTitle:(id)a3 secondIconTitle:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v34 = a3;
  id v6 = a4;
  int64_t v7 = [(SBAppLayoutAccessibility *)self _axAppLayoutType];
  if (v7 == 2)
  {
    v10 = [(SBAppLayoutAccessibility *)self _axBundleIdentifier];
    if ([v10 isEqualToString:*MEMORY[0x263F21248]])
    {
      v9 = [(SBAppLayoutAccessibility *)self _axLabelForInCallService];
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_54;
  }
  int64_t v8 = v7;
  if (v7 == 1)
  {
    v9 = accessibilityLocalizedString(@"home");
    goto LABEL_54;
  }
  id v33 = v6;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v11 = [(SBAppLayoutAccessibility *)self _axDisplayItems];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v12)
  {
    v9 = 0;
    goto LABEL_25;
  }
  uint64_t v13 = v12;
  uint64_t v14 = 0;
  v9 = 0;
  uint64_t v15 = *(void *)v36;
  while (2)
  {
    uint64_t v16 = 0;
    uint64_t v32 = v14 + v13;
    do
    {
      v17 = v9;
      if (*(void *)v36 != v15) {
        objc_enumerationMutation(v11);
      }
      v18 = *(void **)(*((void *)&v35 + 1) + 8 * v16);
      if (v8 == 4)
      {
        v22 = [v18 safeValueForKey:@"appSuggestion"];
        v23 = [v22 safeValueForKey:@"originatingDeviceType"];
        id v24 = v22;
        char v25 = [v24 safeBoolForKey:@"isLocallyGeneratedSuggestion"];
        v26 = [v24 safeValueForKey:@"originatingDeviceType"];

        if (v25)
        {
          v27 = 0;
          id v6 = v33;
LABEL_47:

          if (v23) {
            BOOL v29 = v27 == 0;
          }
          else {
            BOOL v29 = 1;
          }
          if (v29)
          {
            v30 = 0;
          }
          else
          {
            v30 = __UIAXStringForVariables();
          }
          v9 = __AXStringForVariables();

          goto LABEL_54;
        }
        id v6 = v33;
        if ([v26 length])
        {
          if ([v26 isEqualToString:@"com.apple.macbookair"])
          {
            v28 = @"continuity.device.macbook-air";
LABEL_45:
            v27 = accessibilityLocalizedString(v28);
            goto LABEL_47;
          }
          if ([v26 isEqualToString:@"com.apple.mac.laptop"])
          {
            v28 = @"continuity.device.macbook-pro";
            goto LABEL_45;
          }
          if ([v26 isEqualToString:@"com.apple.macmini"])
          {
            v28 = @"continuity.device.mac-mini";
            goto LABEL_45;
          }
          if ([v26 isEqualToString:@"com.apple.mac"])
          {
            v28 = @"continuity.device.mac";
            goto LABEL_45;
          }
          if ([v26 isEqualToString:@"com.apple.watch"])
          {
            v28 = @"continuity.device.watch";
            goto LABEL_45;
          }
          if ([v26 isEqualToString:@"com.apple.iphone"])
          {
            v28 = @"continuity.device.iphone";
            goto LABEL_45;
          }
          if ([v26 isEqualToString:@"com.apple.ipad"])
          {
            v28 = @"continuity.device.ipad";
            goto LABEL_45;
          }
          if ([v26 isEqualToString:@"com.apple.ipod"])
          {
            v28 = @"continuity.device.ipod";
            goto LABEL_45;
          }
          if ([v26 isEqualToString:@"com.apple.apple-tv"])
          {
            v28 = @"continuity.device.tv";
            goto LABEL_45;
          }
        }
        v27 = 0;
        goto LABEL_47;
      }
      v19 = [v18 accessibilityLabel];
      if ([v19 length]) {
        goto LABEL_17;
      }
      v20 = v34;
      if (v14 + v16)
      {
        if (v14 + v16 != 1) {
          goto LABEL_17;
        }
        v20 = v33;
      }
      id v21 = v20;

      v19 = v21;
LABEL_17:
      v9 = __UIAXStringForVariables();

      ++v16;
    }
    while (v13 != v16);
    uint64_t v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16, v19, @"__AXStringForVariablesSentinel");
    uint64_t v14 = v32;
    if (v13) {
      continue;
    }
    break;
  }
LABEL_25:

  id v6 = v33;
LABEL_54:

  return v9;
}

- (id)_axDisplayName
{
  id v3 = [(SBAppLayoutAccessibility *)self _axDisplayItems];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(SBAppLayoutAccessibility *)self _axDisplayItems];
    id v6 = [v5 firstObject];

    int64_t v7 = AXSBApplicationControllerSharedInstance();
    int64_t v8 = [v6 safeStringForKey:@"bundleIdentifier"];
    v9 = [v7 applicationWithBundleIdentifier:v8];

    v10 = [v9 safeStringForKey:@"displayName"];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)_axDisplaySizingPolicy
{
  id v3 = [(SBAppLayoutAccessibility *)self _axDisplayItems];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  v5 = [(SBAppLayoutAccessibility *)self _axDisplayItems];
  id v6 = [v5 firstObject];

  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__1;
  uint64_t v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  id v10 = v6;
  AXPerformSafeBlock();
  id v7 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  int64_t v8 = [v7 safeIntegerForKey:@"sizingPolicy"];

  return v8;
}

uint64_t __50__SBAppLayoutAccessibility__axDisplaySizingPolicy__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) layoutAttributesForItem:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (int64_t)_axAppLayoutType
{
  return [(SBAppLayoutAccessibility *)self safeIntegerForKey:@"type"];
}

- (id)_axGetFirstDestinationHandleValue
{
}

- (void)_axSetFirstDestinationHandleValue:(id)a3
{
}

- (id)_axGetFirstDestination
{
}

- (void)_axSetFirstDestination:(id)a3
{
}

- (id)_axLabelForInCallService
{
  uint64_t v4 = [(SBAppLayoutAccessibility *)self _axGetFirstCall];
  v5 = [(SBAppLayoutAccessibility *)self _axGetHandlesAndLoadFirstDestinationInCall:v4];
  uint64_t v6 = [v5 count];
  unsigned int v7 = [v4 service];
  if (v7 <= 3)
  {
    v2 = accessibilityLocalizedString(off_265153F40[v7]);
  }
  int64_t v8 = [(SBAppLayoutAccessibility *)self _axGetFirstDestination];
  if (!v8)
  {
    id v11 = v2;
    goto LABEL_11;
  }
  if (v6 == 2)
  {
    uint64_t v12 = NSString;
    id v10 = accessibilityLocalizedString(@"in.call.service.title.format.multiple.single");
    uint64_t v13 = AXFormatInteger();
    objc_msgSend(v12, "stringWithFormat:", v10, v2, v8, v13);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (v6 == 1)
  {
    v9 = NSString;
    id v10 = accessibilityLocalizedString(@"in.call.service.title.format.single");
    objc_msgSend(v9, "stringWithFormat:", v10, v2, v8);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_11;
  }
  uint64_t v14 = NSString;
  uint64_t v15 = accessibilityLocalizedString(@"in.call.service.title.format.multiple.plural");
  id v16 = AXFormatInteger();
  objc_msgSend(v14, "stringWithFormat:", v15, v2, v8, v16);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:

  return v11;
}

- (void)_axLoadFirstDestinationIfNecessary
{
  id v4 = [(SBAppLayoutAccessibility *)self _axGetFirstCall];
  id v3 = [(SBAppLayoutAccessibility *)self _axGetHandlesAndLoadFirstDestinationInCall:v4];
}

- (id)_axGetHandlesAndLoadFirstDestinationInCall:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = [(SBAppLayoutAccessibility *)self _axAllHandlesInCall:a3];
  v5 = [(SBAppLayoutAccessibility *)self _axGetFirstDestinationHandleValue];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v7)
  {

LABEL_11:
    if ([v6 count])
    {
      uint64_t v14 = [v6 anyObject];
      uint64_t v15 = [v14 value];
      [(SBAppLayoutAccessibility *)self _axSetFirstDestinationHandleValue:v15];

      objc_initWeak(&location, self);
      id v16 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __71__SBAppLayoutAccessibility__axGetHandlesAndLoadFirstDestinationInCall___block_invoke;
      block[3] = &unk_265153EF8;
      objc_copyWeak(&v21, &location);
      id v20 = v14;
      id v17 = v14;
      dispatch_async(v16, block);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    goto LABEL_13;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v24;
  char v10 = 1;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = [*(id *)(*((void *)&v23 + 1) + 8 * i) value];
      char v13 = [v12 isEqualToString:v5];

      v10 &= v13 ^ 1;
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v8);

  if (v10) {
    goto LABEL_11;
  }
LABEL_13:

  return v6;
}

void __71__SBAppLayoutAccessibility__axGetHandlesAndLoadFirstDestinationInCall___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained _axContactForHandle:*(void *)(a1 + 32)];

  objc_copyWeak(&v7, v2);
  id v5 = v4;
  id v6 = *(id *)(a1 + 32);
  AXPerformBlockOnMainThread();

  objc_destroyWeak(&v7);
}

void __71__SBAppLayoutAccessibility__axGetHandlesAndLoadFirstDestinationInCall___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 givenName];
  }
  else {
  id v3 = [*(id *)(a1 + 40) value];
  }
  [WeakRetained _axSetFirstDestination:v3];
}

- (id)_axGetFirstCall
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__1;
  uint64_t v8 = __Block_byref_object_dispose__1;
  id v9 = 0;
  AXPerformBlockSynchronouslyOnMainThread();
  v2 = [(id)v5[5] firstObject];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __43__SBAppLayoutAccessibility__axGetFirstCall__block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x263F7E1A0] sharedInstance];
  uint64_t v2 = [v5 currentAudioAndVideoCalls];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_axAllHandlesInCall:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 handle];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v6 = v5;
  if (v4) {
    [v5 addObject:v4];
  }
  objc_opt_class();
  id v7 = [v3 safeValueForKey:@"remoteParticipantHandles"];
  uint64_t v8 = __UIAccessibilityCastAsClass();

  if (v8) {
    [v6 unionSet:v8];
  }

  return v6;
}

- (id)_axContactForHandle:(id)a3
{
  v22[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  id v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  id v5 = [(SBAppLayoutAccessibility *)self _axPredicateForHandle:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263EFEA18]);
    id v7 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
    uint64_t v8 = *MEMORY[0x263EFDF80];
    v22[0] = v7;
    v22[1] = v8;
    v22[2] = *MEMORY[0x263EFE070];
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
    char v10 = (void *)[v6 initWithKeysToFetch:v9];

    [v10 setPredicate:v5];
    id v11 = objc_alloc_init(MEMORY[0x263EFEA58]);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __48__SBAppLayoutAccessibility__axContactForHandle___block_invoke;
    v14[3] = &unk_265153F20;
    v14[4] = &v16;
    uint64_t v15 = 0;
    [v11 enumerateContactsWithFetchRequest:v10 error:&v15 usingBlock:v14];
  }
  id v12 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v12;
}

void __48__SBAppLayoutAccessibility__axContactForHandle___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)_axPredicateForHandle:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  if ([v3 type] == 3)
  {
    id v5 = (void *)MEMORY[0x263EFE9F8];
    id v6 = [v4 value];
    uint64_t v7 = [v5 predicateForContactsMatchingEmailAddress:v6];
  }
  else
  {
    id v9 = (void *)MEMORY[0x263EFEB28];
    char v10 = [v4 value];
    id v6 = [v9 phoneNumberWithDigits:v10 countryCode:0];

    if (!v6)
    {
      uint64_t v8 = 0;
      goto LABEL_9;
    }
    uint64_t v7 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingPhoneNumber:v6];
  }
  uint64_t v8 = (void *)v7;
LABEL_9:

LABEL_10:

  return v8;
}

@end