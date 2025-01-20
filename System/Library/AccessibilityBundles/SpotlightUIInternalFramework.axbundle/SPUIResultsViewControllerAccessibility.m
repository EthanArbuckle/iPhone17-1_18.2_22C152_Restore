@interface SPUIResultsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axResultsFirstAppeared;
- (id)_axFirstResultInModel:(id)a3;
- (id)_axPreviousAnnouncement;
- (id)_axPreviousGoResult;
- (id)_axResultsInSection:(id)a3;
- (id)_axSectionsInModel:(id)a3;
- (id)_axStringForType:(int)a3;
- (int64_t)_axNumberOfResultsInModel:(id)a3;
- (void)_axSetPreviousAnnouncement:(id)a3;
- (void)_axSetPreviousGoResult:(id)a3;
- (void)_axSetResultsFirstAppeared:(BOOL)a3;
- (void)searchAgentUpdatedResults:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SPUIResultsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SPUIResultsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axResultsFirstAppeared
{
  return MEMORY[0x270F0A438](self, &__SPUIResultsViewControllerAccessibility___axResultsFirstAppeared);
}

- (void)_axSetResultsFirstAppeared:(BOOL)a3
{
}

- (id)_axPreviousGoResult
{
}

- (void)_axSetPreviousGoResult:(id)a3
{
}

- (id)_axPreviousAnnouncement
{
}

- (void)_axSetPreviousAnnouncement:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPUIResultsViewController", @"searchAgentUpdatedResults:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPUIResultsViewController", @"goTakeoverResult", "@", 0);
  [v3 validateClass:@"SPUISearchModel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPUISearchModel", @"queryComplete", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPUISearchModel", @"queryPartiallyComplete", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPUISearchModel", @"sections", "@", 0);
  [v3 validateClass:@"SFResultSection"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFResultSection", @"results", "@", 0);
}

- (void)searchAgentUpdatedResults:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SPUIResultsViewControllerAccessibility;
  [(SPUIResultsViewControllerAccessibility *)&v41 searchAgentUpdatedResults:v4];
  MEMORY[0x2456626E0](@"SPUIProactiveResultsViewController");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ([(id)*MEMORY[0x263F1D020] applicationState])
    {
      v5 = AXLogAppAccessibility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24255C000, v5, OS_LOG_TYPE_INFO, "Not posting search agent results because we're not active", buf, 2u);
      }
      goto LABEL_30;
    }
    v5 = [(SPUIResultsViewControllerAccessibility *)self safeValueForKey:@"goTakeoverResult"];
    objc_opt_class();
    __UIAccessibilityCastAsSafeCategory();
    *(void *)buf = 0;
    v36 = buf;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy_;
    v39 = __Block_byref_object_dispose_;
    id v40 = 0;
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = v4;
    AXPerformSafeBlock();
    id v7 = *((id *)v36 + 5);

    _Block_object_dispose(buf, 8);
    if (v7)
    {
      v8 = [v7 accessibilityLabel];
      uint64_t v9 = [v8 length];

      if (v9)
      {
        v10 = NSString;
        v11 = accessibilityLocalizedString(@"search.top.hit.format");
        v12 = [v7 accessibilityLabel];
        uint64_t v9 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v12);

        uint64_t v31 = [v7 safeStringForKey:@"secondaryTitle"];
        uint64_t v13 = -[SPUIResultsViewControllerAccessibility _axStringForType:](self, "_axStringForType:", [v7 safeIntForKey:@"type"]);
        v14 = NSString;
        v15 = accessibilityLocalizedString(@"search.go.format");
        v32 = (void *)v13;
        v33 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v13);

        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    uint64_t v31 = 0;
    v32 = 0;
    v33 = 0;
LABEL_10:
    int64_t v16 = [(SPUIResultsViewControllerAccessibility *)self _axNumberOfResultsInModel:v6];
    v17 = NSString;
    v18 = accessibilityLocalizedString(@"search.items.found.format");
    objc_msgSend(v17, "localizedStringWithFormat:", v18, v16);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if ([v6 safeBoolForKey:@"queryComplete"])
    {
      v29 = v19;
      v30 = @"__AXStringForVariablesSentinel";
      v20 = (void *)v9;
    }
    else
    {
      v20 = (void *)v9;
      if (![v6 safeBoolForKey:@"queryPartiallyComplete"])
      {
        v21 = 0;
        if (!v7) {
          goto LABEL_21;
        }
LABEL_17:
        if (v5)
        {
          v22 = [v5 safeValueForKey:@"resultBundleId"];
          v23 = [(SPUIResultsViewControllerAccessibility *)self _axPreviousGoResult];
          v24 = [v23 safeValueForKey:@"resultBundleId"];

          if (v22 != v24)
          {
            v25 = (void *)v31;
            uint64_t v26 = __AXStringForVariables();

            [(SPUIResultsViewControllerAccessibility *)self _axSetPreviousGoResult:v5, v31, v19, v33, @"__AXStringForVariablesSentinel"];
            v21 = (void *)v26;
            if (v26) {
              goto LABEL_24;
            }
            goto LABEL_29;
          }
LABEL_23:
          v25 = (void *)v31;
          if (v21)
          {
LABEL_24:
            v27 = [(SPUIResultsViewControllerAccessibility *)self _axPreviousAnnouncement];
            char v28 = [v27 isEqualToString:v21];

            if ((v28 & 1) == 0)
            {
              if ([(SPUIResultsViewControllerAccessibility *)self _axResultsFirstAppeared])
              {
                UIAccessibilitySpeakOrQueueIfNeeded();
                [(SPUIResultsViewControllerAccessibility *)self _axSetResultsFirstAppeared:0];
              }
              else
              {
                UIAccessibilitySpeak();
              }
              [(SPUIResultsViewControllerAccessibility *)self _axSetPreviousAnnouncement:v21];
            }
          }
LABEL_29:

LABEL_30:
          goto LABEL_31;
        }
LABEL_21:
        if (!v5) {
          [(SPUIResultsViewControllerAccessibility *)self _axSetPreviousGoResult:0];
        }
        goto LABEL_23;
      }
      v29 = @"__AXStringForVariablesSentinel";
    }
    v21 = __AXStringForVariables();
    if (!v7) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
LABEL_31:
}

uint64_t __68__SPUIResultsViewControllerAccessibility_searchAgentUpdatedResults___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _axFirstResultInModel:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_axStringForType:(int)a3
{
  if ((a3 - 1) > 0x18)
  {
    id v4 = &stru_26F7CDC38;
  }
  else
  {
    accessibilityLocalizedString(off_2651532C0[a3 - 1]);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_axSectionsInModel:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 safeValueForKey:@"sections"];
  v5 = __UIAccessibilityCastAsClass();

  if (!v5)
  {
    objc_opt_class();
    id v6 = [v3 safeValueForKey:@"sections"];
    id v7 = __UIAccessibilityCastAsClass();

    v5 = [v7 array];
  }

  return v5;
}

- (id)_axResultsInSection:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 safeValueForKey:@"results"];
  v5 = __UIAccessibilityCastAsClass();

  return v5;
}

- (int64_t)_axNumberOfResultsInModel:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = -[SPUIResultsViewControllerAccessibility _axSectionsInModel:](self, "_axSectionsInModel:", a3, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = [(SPUIResultsViewControllerAccessibility *)self _axResultsInSection:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        v7 += [v10 count];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)_axFirstResultInModel:(id)a3
{
  id v4 = [(SPUIResultsViewControllerAccessibility *)self _axSectionsInModel:a3];
  uint64_t v5 = [v4 firstObject];
  uint64_t v6 = [(SPUIResultsViewControllerAccessibility *)self _axResultsInSection:v5];
  int64_t v7 = [v6 firstObject];

  return v7;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SPUIResultsViewControllerAccessibility;
  [(SPUIResultsViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(SPUIResultsViewControllerAccessibility *)self _axSetResultsFirstAppeared:1];
}

@end