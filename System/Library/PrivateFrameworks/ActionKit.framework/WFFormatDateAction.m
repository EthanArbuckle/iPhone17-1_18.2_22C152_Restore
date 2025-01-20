@interface WFFormatDateAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFFormatDateAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFFormatDateAction *)self parameterValueForKey:@"WFDateFormatStyle" ofClass:objc_opt_class()];
  v6 = [(WFFormatDateAction *)self parameterValueForKey:@"WFTimeFormatStyle" ofClass:objc_opt_class()];
  v7 = [(WFFormatDateAction *)self parameterValueForKey:@"WFRelativeDateFormatStyle" ofClass:objc_opt_class()];
  v8 = [(WFFormatDateAction *)self parameterValueForKey:@"WFDateFormat" ofClass:objc_opt_class()];
  v9 = [(WFFormatDateAction *)self parameterValueForKey:@"WFISO8601IncludeTime" ofClass:objc_opt_class()];
  char v10 = [v9 BOOLValue];

  v11 = [(WFFormatDateAction *)self parameterValueForKey:@"WFLocale" ofClass:objc_opt_class()];
  if ([v11 length])
  {
    v12 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v11];
  }
  else
  {
    v12 = 0;
  }
  uint64_t v13 = objc_opt_class();
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __49__WFFormatDateAction_runAsynchronouslyWithInput___block_invoke;
  v20[3] = &unk_264E595A8;
  id v21 = v5;
  id v22 = v6;
  id v23 = v7;
  id v24 = v8;
  char v26 = v10;
  id v25 = v12;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __49__WFFormatDateAction_runAsynchronouslyWithInput___block_invoke_2;
  v19[3] = &unk_264E5E840;
  v19[4] = self;
  id v14 = v12;
  id v15 = v8;
  id v16 = v7;
  id v17 = v6;
  id v18 = v5;
  [v4 transformObjectRepresentationsForClass:v13 usingBlock:v20 completionHandler:v19];
}

void __49__WFFormatDateAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v21 = a2;
  v8 = a5;
  id v9 = a4;
  char v10 = [v21 date];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v12 = [v13 dateFromComponents:v21];
  }
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 56);
  uint64_t v18 = *(unsigned __int8 *)(a1 + 72);
  v19 = [v21 timeZone];
  v20 = objc_msgSend(v12, "wf_formattedStringWithDateStyle:timeStyle:relativeDateStyle:customDateFormat:includeTimeForISO8601:timeZone:locale:", v14, v15, v16, v17, v18, v19, *(void *)(a1 + 64));

  v8[2](v8, v20, v9);
}

void __49__WFFormatDateAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

@end