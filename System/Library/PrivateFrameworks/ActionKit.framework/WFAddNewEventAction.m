@interface WFAddNewEventAction
+ (double)relativeOffsetFromTimeString:(id)a3;
+ (id)calendarFromDescriptor:(id)a3;
+ (id)endDateByCorrectingDate:(id)a3 withStartDate:(id)a4;
+ (id)eventFromParameters:(id)a3 requiringFullySpecifiedEvent:(BOOL)a4 error:(id *)a5;
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (BOOL)requiresUnlock;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (id)contentDestinationWithError:(id *)a3;
- (id)currentSelectedCalendar;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runWithoutUI;
- (void)updateCalendars;
- (void)updateForcesAllDayFlags;
- (void)wasAddedToWorkflow:(id)a3;
- (void)wasRemovedFromWorkflow:(id)a3;
@end

@implementation WFAddNewEventAction

- (BOOL)requiresUnlock
{
  v2 = [(WFAddNewEventAction *)self parameterValueForKey:@"ShowWhenRun" ofClass:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFAddNewEventAction;
  BOOL v7 = [(WFAddNewEventAction *)&v9 setParameterState:a3 forKey:v6];
  if (v7 && [v6 isEqualToString:@"WFCalendarItemAllDay"]) {
    [(WFAddNewEventAction *)self updateForcesAllDayFlags];
  }

  return v7;
}

- (void)initializeParameters
{
  v3.receiver = self;
  v3.super_class = (Class)WFAddNewEventAction;
  [(WFAddNewEventAction *)&v3 initializeParameters];
  [(WFAddNewEventAction *)self updateForcesAllDayFlags];
}

- (void)updateForcesAllDayFlags
{
  objc_super v3 = [(WFAddNewEventAction *)self parameterStateForKey:@"WFCalendarItemAllDay"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 number];

  uint64_t v7 = [v6 BOOLValue];
  id v9 = [(WFAddNewEventAction *)self parameterForKey:@"WFCalendarItemStartDate"];
  v8 = [(WFAddNewEventAction *)self parameterForKey:@"WFCalendarItemEndDate"];
  [v9 setForcesAllDayDates:v7];
  [v8 setForcesAllDayDates:v7];
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = NSString;
  id v7 = a5;
  id v8 = a3;
  id v9 = WFLocalizedString(@"Allow “%1$@” to use %2$@ in a new calendar event?");
  v10 = objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  v4 = [(WFAddNewEventAction *)self currentSelectedCalendar];
  if (v4)
  {
    id v5 = [(WFAddNewEventAction *)self appDefinition];
    if (v5)
    {
      id v6 = (void *)MEMORY[0x263F337E8];
      id v7 = [v4 source];
      id v8 = [v6 locationWithCalendarSource:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)currentSelectedCalendar
{
  v2 = [(WFAddNewEventAction *)self parameterValueForKey:@"WFCalendarDescriptor" ofClass:objc_opt_class()];
  objc_super v3 = [(id)objc_opt_class() calendarFromDescriptor:v2];

  return v3;
}

- (void)runWithoutUI
{
  objc_super v3 = objc_opt_class();
  v4 = [(WFAddNewEventAction *)self processedParameters];
  id v21 = 0;
  id v5 = [v3 eventFromParameters:v4 requiringFullySpecifiedEvent:1 error:&v21];
  id v6 = v21;

  if (v5)
  {
    id v7 = WFGetWorkflowEventStore();
    id v20 = v6;
    int v8 = [v7 saveEvent:v5 span:0 commit:1 error:&v20];
    id v9 = v20;

    if (v8)
    {
      v10 = [(WFAddNewEventAction *)self processedParameters];
      v11 = [v10 objectForKey:@"WFAlertTime"];

      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v12 = v11;
        }
        else {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
      }
      id v13 = v12;

      int v14 = [v13 isEqualToString:@"None"];
      if (!v14
        || ([v5 setAlarms:0],
            id v19 = v9,
            int v15 = [v7 saveEvent:v5 span:0 commit:1 error:&v19],
            id v16 = v19,
            v9,
            id v9 = v16,
            v15))
      {
        v17 = [(WFAddNewEventAction *)self output];
        v18 = [MEMORY[0x263F33758] itemWithEKEvent:v5 fromEventStore:v7];
        [v17 addItem:v18];
      }
    }
    [(WFAddNewEventAction *)self finishRunningWithError:v9];

    id v6 = v9;
  }
  else
  {
    [(WFAddNewEventAction *)self finishRunningWithError:v6];
  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4 = [(WFAddNewEventAction *)self resourceManager];
  id v5 = [v4 resourceObjectsOfClass:objc_opt_class()];
  id v6 = [v5 anyObject];

  if ([v6 status] != 4)
  {
    uint64_t v11 = [v6 availabilityError];
    goto LABEL_6;
  }
  id v7 = [(WFAddNewEventAction *)self parameterValueForKey:@"ShowWhenRun" ofClass:objc_opt_class()];
  int v8 = [v7 BOOLValue];

  id v9 = [(WFAddNewEventAction *)self userInterface];
  int v10 = [v9 isRunningWithSiriUI];

  if (v10 && v8)
  {
    uint64_t v11 = [MEMORY[0x263F087E8] wfUnsupportedUserInterfaceError];
LABEL_6:
    v12 = (void *)v11;
    [(WFAddNewEventAction *)self finishRunningWithError:v11];

    goto LABEL_7;
  }
  if (v8)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __50__WFAddNewEventAction_runAsynchronouslyWithInput___block_invoke;
    v13[3] = &unk_264E59E10;
    v13[4] = self;
    [(WFAddNewEventAction *)self requestInterfacePresentationWithCompletionHandler:v13];
  }
  else
  {
    [(WFAddNewEventAction *)self runWithoutUI];
  }
LABEL_7:
}

void __50__WFAddNewEventAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  if (a3)
  {
    [v6 finishRunningWithError:a3];
  }
  else
  {
    id v7 = [v6 processedParameters];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__WFAddNewEventAction_runAsynchronouslyWithInput___block_invoke_2;
    v8[3] = &unk_264E5EF80;
    v8[4] = *(void *)(a1 + 32);
    [v5 showWithEventParameters:v7 completionHandler:v8];
  }
}

void __50__WFAddNewEventAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = a2;
  id v6 = WFGetWorkflowEventStore();
  id v7 = [v6 eventWithIdentifier:v5];

  if (v7)
  {
    int v8 = [*(id *)(a1 + 32) output];
    id v9 = [MEMORY[0x263F33758] itemWithEKEvent:v7 fromEventStore:v6];
    [v8 addItem:v9];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v10];
}

- (void)updateCalendars
{
  id v2 = [(WFAddNewEventAction *)self parameterForKey:@"WFCalendarDescriptor"];
  if ([v2 possibleStatesLoadingState] == 2) {
    [v2 loadPossibleStatesWithCompletionHandler:&__block_literal_global_29521];
  }
}

- (void)wasRemovedFromWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFAddNewEventAction;
  [(WFAddNewEventAction *)&v5 wasRemovedFromWorkflow:a3];
  v4 = [(WFAddNewEventAction *)self resourceManager];
  [v4 removeTarget:self selector:sel_updateCalendars];
}

- (void)wasAddedToWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFAddNewEventAction;
  [(WFAddNewEventAction *)&v5 wasAddedToWorkflow:a3];
  v4 = [(WFAddNewEventAction *)self resourceManager];
  [v4 addTarget:self selector:sel_updateCalendars];
}

+ (id)userInterfaceXPCInterface
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___WFAddNewEventAction;
  id v2 = objc_msgSendSuper2(&v10, sel_userInterfaceXPCInterface);
  objc_super v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  int v8 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_showWithEventParameters_completionHandler_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1F20;
}

+ (id)calendarFromDescriptor:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WFGetWorkflowEventStore();
  uint64_t v5 = [v4 calendarsForEntityType:0];
  uint64_t v6 = [v3 matchingCalendarsFromArray:v5];

  uint64_t v7 = [v6 firstObject];
  int v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v4 defaultCalendarForNewEvents];
  }
  objc_super v10 = v9;

  return v10;
}

+ (id)endDateByCorrectingDate:(id)a3 withStartDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 compare:v5] == 1)
  {
    uint64_t v7 = [MEMORY[0x263EFF8F0] currentCalendar];
    int v8 = [v7 components:32992 fromDate:v5];
    id v9 = [v7 components:30 fromDate:v6];
    objc_super v10 = [v7 dateFromComponents:v9];
    uint64_t v11 = [v7 dateByAddingComponents:v8 toDate:v10 options:0];

    id v5 = (id)v11;
  }

  return v5;
}

+ (id)eventFromParameters:(id)a3 requiringFullySpecifiedEvent:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [v8 objectForKey:@"WFCalendarItemTitle"];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v10 = v9;
    }
    else {
      objc_super v10 = 0;
    }
  }
  else
  {
    objc_super v10 = 0;
  }
  id v11 = v10;

  v12 = [v8 objectForKey:@"WFCalendarItemLocation"];
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }
  id v14 = v13;

  int v15 = [v8 objectForKey:@"WFCalendarItemAllDay"];
  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }
  id v17 = v16;

  int v18 = [v17 BOOLValue];
  id v19 = [v8 objectForKey:@"WFCalendarItemNotes"];
  if (v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
  }
  id v21 = v20;

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__WFAddNewEventAction_eventFromParameters_requiringFullySpecifiedEvent_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  aBlock[4] = a5;
  v22 = (void (**)(void *, id))_Block_copy(aBlock);
  if (![v11 length] && v6)
  {
    WFLocalizedString(@"No title was provided. Please provide a title for this event.");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v22[2](v22, v23);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_80;
  }
  v25 = [v8 objectForKey:@"WFCalendarItemStartDate"];
  v61 = a5;
  id v66 = a1;
  if (v25)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v26 = v25;
    }
    else {
      v26 = 0;
    }
  }
  else
  {
    v26 = 0;
  }
  id v23 = v26;

  v27 = [v23 date];
  if (v27 || !v6)
  {
    v29 = [v8 objectForKey:@"WFCalendarItemEndDate"];
    v59 = v21;
    if (v29)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v30 = v29;
      }
      else {
        v30 = 0;
      }
    }
    else
    {
      v30 = 0;
    }
    id v31 = v30;

    v32 = [v31 date];
    v64 = v27;
    v33 = [v66 endDateByCorrectingDate:v32 withStartDate:v27];

    v65 = v14;
    id v60 = v31;
    if (v18)
    {
      BOOL v58 = v33 != 0;
      uint64_t v34 = 1;
    }
    else
    {
      int v35 = [v23 timeIsSignificant];
      uint64_t v34 = (v35 | [v31 timeIsSignificant]) ^ 1;
      if (v33) {
        int v36 = 1;
      }
      else {
        int v36 = v34;
      }
      if (((v36 | !v6) & 1) == 0)
      {
        v63 = WFLocalizedString(@"An invalid end date was provided. Please provide an end date for this event.");
        ((void (*)(void (**)(void *, id)))v22[2])(v22);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        id v21 = v59;
        v28 = v60;
        goto LABEL_78;
      }
      BOOL v58 = v33 != 0;
    }
    id v21 = v59;
    v63 = WFGetWorkflowEventStore();
    v37 = [v8 objectForKey:@"WFCalendarDescriptor"];
    v62 = v33;
    if (v37)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v38 = v37;
      }
      else {
        v38 = 0;
      }
    }
    else
    {
      v38 = 0;
    }
    id v39 = v38;

    uint64_t v40 = [v66 calendarFromDescriptor:v39];

    v41 = [MEMORY[0x263F04B90] eventWithEventStore:v63];
    [v41 setTitle:v11];
    if ([v65 length]) {
      v42 = v65;
    }
    else {
      v42 = 0;
    }
    [v41 setLocation:v42];
    v57 = (void *)v40;
    [v41 setCalendar:v40];
    [v41 setStartDate:v64];
    [v41 setAllDay:v34];
    if (v58) {
      v43 = v33;
    }
    else {
      v43 = v64;
    }
    [v41 setEndDate:v43];
    if ([v59 length]) {
      v44 = v59;
    }
    else {
      v44 = 0;
    }
    [v41 setNotes:v44];
    v45 = [v8 objectForKey:@"WFAlertTime"];
    if (v45)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v46 = v45;
      }
      else {
        v46 = 0;
      }
    }
    else
    {
      v46 = 0;
    }
    id v14 = v65;
    id v47 = v46;

    v48 = [v8 objectForKey:@"WFAlertCustomTime"];
    if (v48)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v49 = v48;
      }
      else {
        v49 = 0;
      }
    }
    else
    {
      v49 = 0;
    }
    id v50 = v49;

    if ([v47 isEqualToString:@"Custom"])
    {
      if ([v50 length])
      {
        v51 = [MEMORY[0x263F33840] datesInString:v50 error:v61];
        v52 = [v51 firstObject];

        if (!v52)
        {
          v56 = WFLocalizedString(@"The alert time provided was invalid. Please check for spelling errors and ensure you provide a time of day.");
          v22[2](v22, v56);
          id v24 = (id)objc_claimAutoreleasedReturnValue();

          id v14 = v65;
          goto LABEL_76;
        }
        v53 = [MEMORY[0x263F04B18] alarmWithAbsoluteDate:v52];
        [v41 addAlarm:v53];

        id v14 = v65;
        goto LABEL_74;
      }
    }
    else if ([v47 length])
    {
      v54 = (void *)MEMORY[0x263F04B18];
      [v66 relativeOffsetFromTimeString:v47];
      v52 = objc_msgSend(v54, "alarmWithRelativeOffset:");
      [v41 addAlarm:v52];
LABEL_74:
    }
    id v24 = v41;
LABEL_76:

    v28 = v60;
    v33 = v62;
LABEL_78:

    v27 = v64;
    goto LABEL_79;
  }
  v28 = WFLocalizedString(@"An invalid start date was provided. Please provide a start date for this event.");
  v22[2](v22, v28);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_79:

LABEL_80:
  return v24;
}

uint64_t __78__WFAddNewEventAction_eventFromParameters_requiringFullySpecifiedEvent_error___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F870B8];
  uint64_t v9 = *MEMORY[0x263F08320];
  v10[0] = a2;
  id v5 = NSDictionary;
  id v6 = a2;
  uint64_t v7 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  **(void **)(a1 + 32) = [v3 errorWithDomain:v4 code:5 userInfo:v7];

  return 0;
}

+ (double)relativeOffsetFromTimeString:(id)a3
{
  id v3 = a3;
  double v4 = 0.0;
  if (([v3 isEqualToString:@"At time of event"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"5 minutes before"])
    {
      double v4 = -300.0;
    }
    else if ([v3 isEqualToString:@"15 minutes before"])
    {
      double v4 = -900.0;
    }
    else if ([v3 isEqualToString:@"30 minutes before"])
    {
      double v4 = -1800.0;
    }
    else if ([v3 isEqualToString:@"1 hour before"])
    {
      double v4 = -3600.0;
    }
    else if ([v3 isEqualToString:@"2 hours before"])
    {
      double v4 = -7200.0;
    }
    else if ([v3 isEqualToString:@"1 day before"])
    {
      double v4 = -86400.0;
    }
    else if ([v3 isEqualToString:@"2 days before"])
    {
      double v4 = -172800.0;
    }
    else if ([v3 isEqualToString:@"1 week before"])
    {
      double v4 = -604800.0;
    }
    else
    {
      double v4 = 0.0;
    }
  }

  return v4;
}

@end