@interface WFAskForInputAction
- (BOOL)immediatelyActivateWatchDictation;
- (NSString)defaultAnswer;
- (NSString)inputType;
- (NSString)promptText;
- (id)appResource;
- (id)datePickerModeFromInputType:(id)a3;
- (id)outputContentClasses;
- (void)finishRunningWithDate:(id)a3;
- (void)finishRunningWithResultText:(id)a3;
- (void)getOutputFromIntentResponse:(id)a3 completionHandler:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFAskForInputAction

- (id)outputContentClasses
{
  v14[1] = *MEMORY[0x263EF8340];
  v3 = [(WFAskForInputAction *)self parameterStateForKey:@"WFInputType"];
  v4 = [v3 value];
  if ([v4 isEqualToString:@"Text"])
  {
    v14[0] = objc_opt_class();
    v5 = (void *)MEMORY[0x263EFF8C0];
    v6 = v14;
LABEL_11:
    uint64_t v7 = [v5 arrayWithObjects:v6 count:1];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"Number"])
  {
    uint64_t v13 = objc_opt_class();
    v5 = (void *)MEMORY[0x263EFF8C0];
    v6 = &v13;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"URL"])
  {
    uint64_t v12 = objc_opt_class();
    v5 = (void *)MEMORY[0x263EFF8C0];
    v6 = &v12;
    goto LABEL_11;
  }
  if (([v4 isEqualToString:@"Date"] & 1) != 0
    || ([v4 isEqualToString:@"Time"] & 1) != 0
    || [v4 isEqualToString:@"Date and Time"])
  {
    uint64_t v11 = objc_opt_class();
    v5 = (void *)MEMORY[0x263EFF8C0];
    v6 = &v11;
    goto LABEL_11;
  }
  v10.receiver = self;
  v10.super_class = (Class)WFAskForInputAction;
  uint64_t v7 = [(WFAskForInputAction *)&v10 outputContentClasses];
LABEL_12:
  v8 = (void *)v7;

  return v8;
}

- (void)finishRunningWithDate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(WFAskForInputAction *)self output];
    [v5 addObject:v4];
  }
  [(WFHandleIntentAction *)self finishRunningWithError:0];
}

- (void)finishRunningWithResultText:(id)a3
{
  id v4 = a3;
  v5 = [(WFAskForInputAction *)self inputType];
  if (![v4 length]) {
    goto LABEL_28;
  }
  if ([v5 isEqualToString:@"URL"])
  {
    v6 = [NSURL URLWithString:v4];
    if ([MEMORY[0x263F339D8] stringMatchesExactly:v4])
    {
      uint64_t v7 = [v6 scheme];

      if (!v7)
      {
        v8 = NSURL;
        v9 = [@"http://" stringByAppendingString:v4];
        uint64_t v10 = [v8 URLWithString:v9];

        v6 = (void *)v10;
      }
    }
    if (v6) {
      uint64_t v11 = v6;
    }
    else {
      uint64_t v11 = v4;
    }
    id v12 = v11;

    if (!v12) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (![v5 isEqualToString:@"Number"])
  {
    id v12 = v4;
    if (!v12) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  id v13 = objc_alloc_init(MEMORY[0x263F08A30]);
  v14 = [MEMORY[0x263F089C0] decimalDigitCharacterSet];
  v15 = [v13 minusSign];
  [v14 addCharactersInString:v15];

  v16 = [MEMORY[0x263EFF960] currentLocale];
  v17 = [v16 objectForKey:*MEMORY[0x263EFF4E8]];
  [v14 addCharactersInString:v17];

  v18 = [v14 invertedSet];
  v19 = [MEMORY[0x263F33830] resultsForString:v4 ofTypes:0x200000000 error:0];
  v20 = [v19 number];
  if (v20)
  {
    if (objc_msgSend(v4, "wf_stringContainsCharacterInSet:", v18)) {
      v21 = v20;
    }
    else {
      v21 = v4;
    }
    id v12 = v21;
  }
  else
  {
    id v32 = v13;
    v22 = [v4 componentsSeparatedByCharactersInSet:v18];
    uint64_t v23 = [v22 componentsJoinedByString:&stru_26F008428];

    v31 = (void *)v23;
    v24 = [MEMORY[0x263F08B08] scannerWithString:v23];
    v25 = [MEMORY[0x263EFF960] currentLocale];
    [v24 setLocale:v25];

    double v35 = 0.0;
    int v26 = [v24 scanDouble:&v35];
    v27 = (void *)MEMORY[0x263F087B0];
    if (v26)
    {
      v28 = [NSNumber numberWithDouble:v35];
      v29 = v28;
      if (v28)
      {
        [v28 decimalValue];
      }
      else
      {
        v33[0] = 0;
        v33[1] = 0;
        int v34 = 0;
      }
      id v12 = [v27 decimalNumberWithDecimal:v33];
    }
    else
    {
      id v12 = [MEMORY[0x263F087B0] notANumber];
    }

    id v13 = v32;
  }

  if (v12)
  {
LABEL_27:
    v30 = [(WFAskForInputAction *)self output];
    [v30 addObject:v12];
  }
LABEL_28:
  [(WFHandleIntentAction *)self finishRunningWithError:0];
}

- (void)getOutputFromIntentResponse:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (!v8)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFAskForInputAction.m", 198, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  uint64_t v9 = objc_opt_class();
  id v10 = v7;
  if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = getWFGeneralLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v23 = "WFEnforceClass";
      __int16 v24 = 2114;
      id v25 = v10;
      __int16 v26 = 2114;
      id v27 = (id)objc_opt_class();
      __int16 v28 = 2114;
      uint64_t v29 = v9;
      id v13 = v27;
      _os_log_impl(&dword_23C364000, v12, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
    }
    id v11 = 0;
  }
  else
  {
    id v11 = v10;
  }

  v14 = [v11 result];
  v15 = v14;
  if (!v14) {
    goto LABEL_21;
  }
  switch([v14 type])
  {
    case 1:
      uint64_t v16 = [v15 stringValue];
      break;
    case 2:
      uint64_t v16 = [v15 numberValue];
      break;
    case 3:
      uint64_t v16 = [v15 urlValue];
      break;
    case 4:
      uint64_t v16 = [v15 dateValue];
      break;
    case 5:
      uint64_t v16 = [v15 timeValue];
      break;
    case 6:
      uint64_t v16 = [v15 dateAndTimeValue];
      break;
    default:
      goto LABEL_21;
  }
  v17 = (void *)v16;
  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v19 = [v18 dateFromComponents:v17];

      v17 = (void *)v19;
    }
    v20 = objc_opt_new();
    [v20 addObject:v17];
    v8[2](v8, v20);
  }
  else
  {
LABEL_21:
    v8[2](v8, 0);
  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v55[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFAskForInputAction *)self userInterface];
  v6 = [v5 userInterfaceType];
  int v7 = [v6 isEqualToString:*MEMORY[0x263F33B38]];

  if (v7)
  {
    v54.receiver = self;
    v54.super_class = (Class)WFAskForInputAction;
    [(WFHandleIntentAction *)&v54 runAsynchronouslyWithInput:v4];
  }
  else
  {
    v55[0] = @"Date";
    v55[1] = @"Time";
    v55[2] = @"Date and Time";
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:3];
    uint64_t v9 = [(WFAskForInputAction *)self inputType];
    int v10 = [v8 containsObject:v9];

    id v11 = [MEMORY[0x263F336E8] alertWithPreferredStyle:0];
    id v12 = [(WFAskForInputAction *)self promptText];
    [v11 setTitle:v12];

    id v13 = dispatch_group_create();
    if (v10)
    {
      id v14 = objc_alloc_init(MEMORY[0x263F85248]);
      v15 = [(WFAskForInputAction *)self inputType];
      uint64_t v16 = [(WFAskForInputAction *)self datePickerModeFromInputType:v15];
      [v14 setDatePickerMode:v16];

      v17 = [(WFAskForInputAction *)self defaultAnswer];

      if (v17)
      {
        dispatch_group_enter(v13);
        v18 = (void *)MEMORY[0x263F337C8];
        uint64_t v19 = [(WFAskForInputAction *)self defaultAnswer];
        v20 = [v18 itemWithObject:v19];
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke;
        v51[3] = &unk_264E581B8;
        id v52 = v14;
        v53 = v13;
        [v20 getObjectRepresentation:v51 forClass:objc_opt_class()];
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke_2;
      block[3] = &unk_264E5DED8;
      id v49 = v11;
      id v50 = v14;
      id v21 = v14;
      dispatch_group_notify(v13, MEMORY[0x263EF83A0], block);
    }
    else
    {
      v22 = [(WFAskForInputAction *)self inputType];
      int v23 = [v22 isEqualToString:@"Number"];

      if (v23)
      {
        __int16 v24 = [(WFAskForInputAction *)self parameterValueForKey:@"WFAskActionAllowsDecimalNumbers" ofClass:objc_opt_class()];
        int v41 = [v24 BOOLValue];

        id v25 = [(WFAskForInputAction *)self parameterValueForKey:@"WFAskActionAllowsNegativeNumbers" ofClass:objc_opt_class()];
        uint64_t v26 = [v25 BOOLValue];

        id v21 = objc_alloc_init(MEMORY[0x263F85458]);
        id v27 = [(WFAskForInputAction *)self defaultAnswer];
        [v21 setText:v27];

        __int16 v28 = (void *)MEMORY[0x263F85888];
        if (!v41) {
          __int16 v28 = (void *)MEMORY[0x263F858A8];
        }
        [v21 setKeyboardType:*v28];
        [v21 setAllowsNegativeNumbers:v26];
        [v21 setPlaceholder:@"0"];
      }
      else
      {
        id v21 = objc_alloc_init(MEMORY[0x263F85458]);
        uint64_t v29 = [(WFAskForInputAction *)self defaultAnswer];
        [v21 setText:v29];

        uint64_t v30 = [(WFAskForInputAction *)self inputType];
        int v31 = [v30 isEqualToString:@"URL"];

        if (v31)
        {
          [v21 setKeyboardType:*MEMORY[0x263F858C8]];
          [v21 setAutocapitalizationType:*MEMORY[0x263F85828]];
          [v21 setAutocorrectionType:*MEMORY[0x263F85848]];
          [v21 setTextContentType:*MEMORY[0x263F85A20]];
          [v21 setReturnKeyType:*MEMORY[0x263F858E8]];
          id v32 = WFLocalizedString(@"URL");
          [v21 setPlaceholder:v32];
        }
        else
        {
          v33 = [(WFAskForInputAction *)self parameterValueForKey:@"WFAllowsMultilineText" ofClass:objc_opt_class()];
          uint64_t v34 = [v33 BOOLValue];

          [v21 setMultiline:v34];
          double v35 = (void *)MEMORY[0x263F858E0];
          if (!v34) {
            double v35 = (void *)MEMORY[0x263F858E8];
          }
          [v21 setReturnKeyType:*v35];
        }
      }
      [v11 setTextFieldConfiguration:v21];
    }

    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke_3;
    v47[3] = &unk_264E5EE70;
    v47[4] = self;
    v36 = [MEMORY[0x263F336F0] cancelButtonWithHandler:v47];
    v37 = (void *)MEMORY[0x263F336F0];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke_4;
    v44[3] = &unk_264E581E0;
    char v46 = v10;
    v44[4] = self;
    id v38 = v11;
    id v45 = v38;
    v39 = [v37 okButtonWithHandler:v44];
    [v38 addButton:v36];
    [v38 addButton:v39];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke_5;
    v42[3] = &unk_264E5DED8;
    v42[4] = self;
    id v43 = v38;
    id v40 = v38;
    dispatch_group_notify(v13, MEMORY[0x263EF83A0], v42);
  }
}

void __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) setDefaultDate:a2];
  }
  v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

uint64_t __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDatePickerConfiguration:*(void *)(a1 + 40)];
}

void __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] userCancelledError];
  [v1 finishRunningWithError:v2];
}

void __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v1)
  {
    id v5 = [v2 datePickerResult];
    objc_msgSend(v3, "finishRunningWithDate:");
  }
  else
  {
    id v5 = [v2 textFieldResults];
    id v4 = [v5 firstObject];
    [v3 finishRunningWithResultText:v4];
  }
}

void __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInterface];
  [v2 presentAlert:*(void *)(a1 + 40)];
}

- (id)datePickerModeFromInputType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Date"])
  {
    id v4 = (id *)MEMORY[0x263F85638];
  }
  else
  {
    int v5 = [v3 isEqualToString:@"Time"];
    id v4 = (id *)MEMORY[0x263F85640];
    if (v5) {
      id v4 = (id *)MEMORY[0x263F85648];
    }
  }
  id v6 = *v4;

  return v6;
}

- (BOOL)immediatelyActivateWatchDictation
{
  id v2 = [(WFAskForInputAction *)self parameterValueForKey:@"WFAskActionImmediateDictation" ofClass:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)defaultAnswer
{
  char v3 = [(WFAskForInputAction *)self inputType];
  uint64_t v4 = objc_opt_class();
  if ([v3 isEqualToString:@"Number"])
  {
    int v5 = [(WFAskForInputAction *)self parameterValueForKey:@"WFAskActionDefaultAnswerNumber" ofClass:objc_opt_class()];
    id v6 = [MEMORY[0x263F08A30] localizedStringFromNumber:v5 numberStyle:1];

    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"URL"])
  {
    int v7 = @"WFAskActionDefaultAnswerURL";
  }
  else
  {
    if ([v3 isEqualToString:@"Date"])
    {
      int v7 = @"WFAskActionDefaultAnswerDate";
    }
    else if ([v3 isEqualToString:@"Time"])
    {
      int v7 = @"WFAskActionDefaultAnswerTime";
    }
    else
    {
      if (![v3 isEqualToString:@"Date and Time"])
      {
        int v7 = @"WFAskActionDefaultAnswer";
        goto LABEL_12;
      }
      int v7 = @"WFAskActionDefaultAnswerDateAndTime";
    }
    uint64_t v4 = objc_opt_class();
  }
LABEL_12:
  id v6 = [(WFAskForInputAction *)self parameterValueForKey:v7 ofClass:v4];
LABEL_13:

  return (NSString *)v6;
}

- (NSString)promptText
{
  char v3 = [(WFAskForInputAction *)self parameterValueForKey:@"WFAskActionPrompt" ofClass:objc_opt_class()];
  uint64_t v4 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  int v5 = [v3 stringByTrimmingCharactersInSet:v4];
  uint64_t v6 = [v5 length];

  if ([v3 length]) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v10 = v3;
    goto LABEL_22;
  }
  if ([MEMORY[0x263EFFA40] universalPreviewsEnabled]) {
    goto LABEL_7;
  }
  v8 = [(WFAskForInputAction *)self inputType];
  if ([v8 isEqualToString:@"Text"])
  {
    id v11 = @"What’s the text?";
LABEL_20:
    uint64_t v9 = WFLocalizedString(v11);
    goto LABEL_21;
  }
  if ([v8 isEqualToString:@"Number"])
  {
    id v11 = @"What number?";
    goto LABEL_20;
  }
  if ([v8 isEqualToString:@"URL"])
  {
    id v11 = @"What URL?";
    goto LABEL_20;
  }
  if ([v8 isEqualToString:@"Date"])
  {
    id v11 = @"What date?";
    goto LABEL_20;
  }
  if ([v8 isEqualToString:@"Time"])
  {
    id v11 = @"What time?";
    goto LABEL_20;
  }
  if ([v8 isEqualToString:@"Date and Time"])
  {
    id v11 = @"What date and time?";
    goto LABEL_20;
  }

LABEL_7:
  v8 = [(WFAskForInputAction *)self parameterForKey:@"WFAskActionPrompt"];
  uint64_t v9 = [v8 localizedPlaceholder];
LABEL_21:
  id v10 = (id)v9;

LABEL_22:
  return (NSString *)v10;
}

- (NSString)inputType
{
  uint64_t v3 = objc_opt_class();
  return (NSString *)[(WFAskForInputAction *)self parameterValueForKey:@"WFInputType" ofClass:v3];
}

- (id)appResource
{
  return 0;
}

@end