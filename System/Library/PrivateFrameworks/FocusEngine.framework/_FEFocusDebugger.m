@interface _FEFocusDebugger
+ (id)_ancestryForEnvironment:(id)a3;
+ (id)_legacy_checkFocusabilityForView:(id)a3;
+ (id)_statusForFocusSystem:(id)a3 scene:(id)a4 includeSceneLog:(BOOL)a5 includeDeferralTarget:(BOOL)a6;
+ (id)_verboseStatus;
+ (id)checkFocusabilityForItem:(id)a3;
+ (id)focusGroupsForEnvironment:(id)a3;
+ (id)help;
+ (id)preferredFocusEnvironmentsForEnvironment:(id)a3;
+ (id)simulateFocusUpdateRequestFromEnvironment:(id)a3;
+ (id)status;
@end

@implementation _FEFocusDebugger

+ (id)help
{
  if ((_FEProcessIsBeingDebugged() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."];
  }
  v2 = [MEMORY[0x263F089D8] string];
  [v2 appendString:@"\nFocus Debugging Utilities:"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __24___FEFocusDebugger_help__block_invoke;
  v7[3] = &unk_265328558;
  id v8 = v2;
  id v3 = v2;
  v4 = (void (**)(void, void, void, void, void))MEMORY[0x25335DA10](v7);
  ((void (**)(void, __CFString *, __CFString *, __CFString *, __CFString *))v4)[2](v4, @"Status", @"po _FEFocusDebugger.status()", @"po [_FEFocusDebugger status]", @"Outputs information for the currently focused item.");
  ((void (**)(void, __CFString *, __CFString *, __CFString *, __CFString *))v4)[2](v4, @"Diagnosing Focusability Issues", @"po _FEFocusDebugger.checkFocusability(for: <item reference>)", @"po [_FEFocusDebugger checkFocusabilityForItem:<item reference>]", @"Outputs a diagnosis of the specified item's focusability, including any known issues that may be preventing focusability.");
  v5 = +[_FEFocusDebuggerStringOutput outputWithString:v3];

  return v5;
}

+ (id)status
{
  if ((_FEProcessIsBeingDebugged() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."];
  }
  return +[_FEDebugLogNode rootNode];
}

+ (id)_verboseStatus
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ((_FEProcessIsBeingDebugged() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."];
  }
  v2 = +[_FEDebugLogNode rootNode];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = +[_FEFocusSystem _allFocusSystems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    while (1)
    {
      if (*(void *)v9 != v6) {
        objc_enumerationMutation(v3);
      }
      if (!--v5)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }

  return v2;
}

+ (id)_statusForFocusSystem:(id)a3 scene:(id)a4 includeSceneLog:(BOOL)a5 includeDeferralTarget:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  if ((_FEProcessIsBeingDebugged() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."];
  }
  long long v11 = [v9 focusedItem];
  id v12 = v9;
  if (v12)
  {
    uint64_t v13 = NSString;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = [v13 stringWithFormat:@"<%@: %p>", v15, v12];
  }
  else
  {
    v16 = @"(nil)";
  }

  v17 = +[_FEDebugLogMessage messageWithStyle:1 string:v16];

  int v18 = [v12 _isEnabled];
  v19 = @"NO";
  if (v18) {
    v19 = @"YES";
  }
  v20 = +[_FEDebugLogMessage messageWithFormat:@"enabled: %@", v19];
  [v17 addMessage:v20];

  if (v10 && v7)
  {
    v21 = NSString;
    id v22 = v10;
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    v25 = [v21 stringWithFormat:@"<%@: %p>", v24, v22];

    v26 = +[_FEDebugLogMessage messageWithFormat:@"scene: %@", v25];
    [v17 addMessage:v26];
  }
  id v27 = v11;
  if (v27)
  {
    v28 = NSString;
    v29 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v29);
    v31 = [v28 stringWithFormat:@"<%@: %p>", v30, v27];
  }
  else
  {
    v31 = @"(nil)";
  }

  v32 = +[_FEDebugLogMessage messageWithFormat:@"focused item: %@", v31];
  [v17 addMessage:v32];

  if (v6)
  {
    v33 = [v12 valueForKeyPath:@"_deferredFocusUpdateTarget"];
    if (v33)
    {
      v34 = NSString;
      v35 = (objc_class *)objc_opt_class();
      v36 = NSStringFromClass(v35);
      v37 = [v34 stringWithFormat:@"<%@: %p>", v36, v33];
    }
    else
    {
      v37 = @"(nil)";
    }
    v38 = +[_FEDebugLogMessage messageWithFormat:@"deferral target: %@", v37];
    [v17 addMessage:v38];
  }
  return v17;
}

+ (id)_legacy_checkFocusabilityForView:(id)a3
{
  id v3 = a3;
  if ((_FEProcessIsBeingDebugged() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."];
  }
  uint64_t v4 = +[_FEFocusDebugger checkFocusabilityForItem:v3];
  uint64_t v5 = [v4 description];
  BOOL v6 = ;

  return v6;
}

+ (id)checkFocusabilityForItem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"_FEFocusDebugger.m", 210, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  BOOL v6 = +[_FEFocusSystem focusSystemForEnvironment:v5];
  BOOL v7 = v6;
  if (!v6)
  {
    v21 = @"This item is not part of any focus system, so focusability is not applicable.";
LABEL_16:
    id v22 = +[_FEFocusDebuggerStringOutput outputWithString:v21];
    goto LABEL_26;
  }
  id v8 = [v6 focusedItem];

  if (v8 == v5)
  {
    v21 = @"This item is currently focused.";
    goto LABEL_16;
  }
  id v9 = objc_alloc_init(_FEDebugIssueReport);
  int v10 = [v5 _canBecomeFocused];
  if ((v10 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_8;
    }
    long long v11 = [(_FEDebugIssueReport *)v9 issues];
    uint64_t v12 = [v11 count];

    [v5 _diagnoseFocusabilityForReport:v9];
    uint64_t v13 = [(_FEDebugIssueReport *)v9 issues];
    uint64_t v14 = [v13 count];

    if (v12 == v14)
    {
LABEL_8:
      v15 = +[_FEDebugIssue issueWithDescription:@"This item returns NO from -_canBecomeFocused."];
      [(_FEDebugIssueReport *)v9 addIssue:v15];
    }
  }
  int IsEligibleForFocusInteraction = _FEFocusEnvironmentIsEligibleForFocusInteraction(v5);
  if (!IsEligibleForFocusInteraction
    || (objc_opt_respondsToSelector() & 1) != 0
    && [v5 _shouldAlwaysDiagnoseFocusInteractionEligibility])
  {
    if (objc_opt_respondsToSelector())
    {
      v17 = [(_FEDebugIssueReport *)v9 issues];
      uint64_t v18 = [v17 count];

      [v5 _diagnoseFocusInteractionEligibilityForReport:v9];
      v19 = [(_FEDebugIssueReport *)v9 issues];
      BOOL v20 = v18 != [v19 count];
    }
    else
    {
      BOOL v20 = 0;
    }
    if (((IsEligibleForFocusInteraction | v20) & 1) == 0)
    {
      v23 = +[_FEDebugIssue issueWithDescription:@"This item is not eligible for focus, but the reason is unknown."];
      [(_FEDebugIssueReport *)v9 addIssue:v23];
LABEL_24:

      goto LABEL_25;
    }
  }
  else
  {
    BOOL v20 = 0;
  }
  if (((v20 | v10 ^ 1) & 1) == 0)
  {
    v23 = [v7 _focusMapContainer];
    if (v23)
    {
      v24 = [[_FEFocusMap alloc] initWithFocusSystem:v7 rootContainer:v23 coordinateSpace:0 searchInfo:0 ignoresRootContainerClippingRect:0];
      [(_FEFocusMap *)v24 diagnoseFocusabilityForItem:v5 report:v9];
    }
    goto LABEL_24;
  }
LABEL_25:
  v25 = objc_alloc_init(_FEDebugIssueReportFormatter);
  [(_FEDebugIssueReportFormatter *)v25 setHeader:@"The following issues were found that would prevent this item from being focusable:"];
  [(_FEDebugIssueReportFormatter *)v25 setNoIssuesDescription:@"This item should be focusable.\n\nIf you are still having trouble focusing this item, consider the following:\n – This tool will not detect if this item is denied focus as the result of returning NO from -shouldUpdateFocusInContext:.\n – This tool will not detect if another item or guide is redirecting focus movement away from this item.\n – This tool may not detect if this item has dynamic conditions that affect its focusability."];
  v26 = [(_FEDebugIssueReportFormatter *)v25 stringFromReport:v9];
  id v22 = +[_FEFocusDebuggerStringOutput outputWithString:v26];

LABEL_26:
  return v22;
}

+ (id)simulateFocusUpdateRequestFromEnvironment:(id)a3
{
  id v5 = a3;
  if ((_FEProcessIsBeingDebugged() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."];
  }
  if (!v5)
  {
    v52 = [MEMORY[0x263F08690] currentHandler];
    [v52 handleFailureInMethod:a2, a1, @"_FEFocusDebugger.m", 282, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  BOOL v6 = +[_FEFocusSystem focusSystemForEnvironment:v5];
  if (!v6)
  {
    v17 = +[_FEFocusDebuggerStringOutput outputWithString:@"This environment is not part of any focus system, and so cannot request a focus update."];
    goto LABEL_29;
  }
  v53 = [[_FEFocusUpdateRequest alloc] initWithFocusSystem:v6 environment:v5];
  id v7 = [[_FEFocusUpdateContext alloc] _initWithFocusUpdateRequest:v53];
  id v8 = objc_alloc_init(_FEDebugLogReport);
  [v7 _setPreferredFocusReport:v8];

  id v9 = objc_alloc_init(_FEDebugIssueReport);
  [v7 _setValidationReport:v9];

  int v10 = objc_alloc_init(_FEDebugLogReport);
  uint64_t v11 = [v7 previouslyFocusedItem];
  if (v11)
  {
    uint64_t v12 = NSString;
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    v15 = [v12 stringWithFormat:@"<%@: %p>", v14, v11];

    v16 = [v12 stringWithFormat:@"(%@ is currently focused)", v15];
  }
  else
  {
    v16 = @"(Nothing is currently focused)";
  }
  id v18 = v5;
  if (v5)
  {
    v19 = NSString;
    BOOL v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    id v22 = [v19 stringWithFormat:@"<%@: %p>", v21, v18];
  }
  else
  {
    id v22 = @"(nil)";
  }
  v55 = (void *)v11;

  v54 = v16;
  [(_FEDebugLogReport *)v10 addMessageWithFormat:@"Simulating a fake focus update request from %@... %@", v22, v16];

  [(_FEDebugLogReport *)v10 addLineBreak];
  v23 = objc_alloc_init(_FEDebugIssueReport);
  objc_msgSend(v6, "_debug_isEnvironmentEligibleForFocusUpdate:debugReport:", v18, v23);
  v24 = [(_FEDebugIssueReport *)v23 issues];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    v26 = objc_alloc_init(_FEDebugIssueReportFormatter);
    [(_FEDebugIssueReportFormatter *)v26 setHeader:@"The following issues were found that would normally prevent this environment's request from being accepted by the focus system (these will be ignored for the purposes of this test):"];
    id v27 = [(_FEDebugIssueReportFormatter *)v26 stringFromReport:v23];
    [(_FEDebugLogReport *)v10 addMessage:v27];

    [(_FEDebugLogReport *)v10 addLineBreak];
  }
  v28 = [v7 nextFocusedItem];
  v29 = +[_FEDebugReportFormatter defaultFormatter];
  v30 = [v7 _preferredFocusReport];
  v31 = [v29 stringFromReport:v30];
  [(_FEDebugLogReport *)v10 addMessage:v31];

  int v32 = [v7 _isValidInFocusSystem:v6];
  v33 = [v7 _validationReport];
  v34 = [v33 issues];
  uint64_t v35 = [v34 count];

  if (v35)
  {
    [(_FEDebugLogReport *)v10 addLineBreak];
    v36 = +[_FEFocusUpdateContext _defaultValidationReportFormatter];
    v37 = [v7 _validationReport];
    v38 = [v36 stringFromReport:v37];
    [(_FEDebugLogReport *)v10 addMessage:v38];
  }
  [(_FEDebugLogReport *)v10 resetIndentLevel];
  [(_FEDebugLogReport *)v10 addLineBreak];
  if (!v32)
  {
    if (v28 == v55)
    {
      if (v55)
      {
        v45 = NSString;
        id v46 = v55;
        v47 = (objc_class *)objc_opt_class();
        v48 = NSStringFromClass(v47);
        v43 = [v45 stringWithFormat:@"<%@: %p>", v48, v46];

        [(_FEDebugLogReport *)v10 addMessageWithFormat:@"Simulated Result: No change, %@ is still focused.", v43];
        goto LABEL_25;
      }
      v44 = @"Simulated Result: No change, nothing is still focused.";
    }
    else
    {
      v44 = @"Simulated Result: Failed to update focus.";
    }
LABEL_27:
    [(_FEDebugLogReport *)v10 addMessage:v44];
    goto LABEL_28;
  }
  if (!v28)
  {
    v44 = @"Simulated Result: Successfully updated focus to nil.";
    goto LABEL_27;
  }
  v39 = NSString;
  id v40 = v28;
  v41 = (objc_class *)objc_opt_class();
  v42 = NSStringFromClass(v41);
  v43 = [v39 stringWithFormat:@"<%@: %p>", v42, v40];

  [(_FEDebugLogReport *)v10 addMessageWithFormat:@"Simulated Result: Successfully updated focus to %@.", v43];
LABEL_25:

LABEL_28:
  v49 = +[_FEDebugReportFormatter defaultFormatter];
  v50 = [v49 stringFromReport:v10];

  v17 = +[_FEFocusDebuggerStringOutput outputWithString:v50];

LABEL_29:
  return v17;
}

+ (id)_ancestryForEnvironment:(id)a3
{
  id v5 = a3;
  if ((_FEProcessIsBeingDebugged() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."];
  }
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"_FEFocusDebugger.m", 371, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  BOOL v6 = objc_alloc_init(_FEDebugLogReport);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44___FEFocusDebugger__ancestryForEnvironment___block_invoke;
  v14[3] = &unk_2653280B0;
  v15 = v6;
  id v16 = v5;
  id v7 = v5;
  id v8 = v6;
  _FEFocusEnvironmentEnumerateAncestorEnvironments(v7, v14);
  id v9 = +[_FEDebugReportFormatter defaultFormatter];
  int v10 = [v9 stringFromReport:v8];

  uint64_t v11 = +[_FEFocusDebuggerStringOutput outputWithString:v10];

  return v11;
}

+ (id)focusGroupsForEnvironment:(id)a3
{
  id v3 = a3;
  if ((_FEProcessIsBeingDebugged() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."];
  }
  uint64_t v4 = +[_FEFocusSystem focusSystemForEnvironment:v3];
  id v5 = [[_FEFocusMovementRequest alloc] initWithFocusSystem:v4];
  BOOL v6 = [[_FEFocusMovementInfo alloc] initWithHeading:16 linearHeading:0 isInitial:1 shouldLoadScrollableContainer:0 looping:1 groupFilter:2 inputType:5];
  [(_FEFocusMovementRequest *)v5 setMovementInfo:v6];

  id v7 = [v4 _movementPerformer];
  id v8 = [v7 contextForFocusMovement:v5];

  id v9 = objc_opt_new();
  int v10 = +[_FEDebugLogMessage messageWithStyle:1 string:@"Focus Group Hierarchy:"];
  [v9 addMessage:v10];

  uint64_t v11 = [v8 _focusMapSearchInfo];
  uint64_t v12 = [v11 focusGroupMap];
  uint64_t v13 = [v12 focusGroups];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __46___FEFocusDebugger_focusGroupsForEnvironment___block_invoke;
  v19[3] = &unk_265328580;
  id v20 = v9;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __46___FEFocusDebugger_focusGroupsForEnvironment___block_invoke_2;
  v17[3] = &unk_2653285A8;
  id v18 = v20;
  id v14 = v20;
  __recursePreOrderDepthFirstTraversal(v13, sel_childGroups, 0, v19, v17);
  v15 = [v14 rootNode];

  return v15;
}

+ (id)preferredFocusEnvironmentsForEnvironment:(id)a3
{
  id v3 = a3;
  if ((_FEProcessIsBeingDebugged() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."];
  }
  uint64_t v4 = +[_FEDebugLogNode rootNode];
  id v5 = +[_FEFocusSystem focusSystemForEnvironment:v3];
  if (v5)
  {
    BOOL v6 = +[_FEDebugLogMessage messageWithStyle:1 string:@"Preferred focus environments:"];
    [v4 addMessage:v6];

    id v7 = objc_opt_new();
    id v8 = [MEMORY[0x263EFF980] arrayWithObject:v4];
    id v9 = [[_FEFocusEnvironmentPreferenceEnumerator alloc] initWithEnumerationMode:1];
    [(_FEFocusEnvironmentPreferenceEnumerator *)v9 setAllowsInferringPreferences:0];
    [(_FEFocusEnvironmentPreferenceEnumerator *)v9 setDebugLog:v4];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61___FEFocusDebugger_preferredFocusEnvironmentsForEnvironment___block_invoke;
    v12[3] = &unk_2653285D0;
    id v13 = v7;
    id v14 = v5;
    id v10 = v7;
    [(_FEFocusEnvironmentPreferenceEnumerator *)v9 enumeratePreferencesForEnvironment:v3 usingBlock:v12];
  }
  else
  {
    id v8 = +[_FEDebugLogMessage messageWithStyle:4 string:@"The environment is not connected to a focus system."];
    [v4 addMessage:v8];
  }

  return v4;
}

@end