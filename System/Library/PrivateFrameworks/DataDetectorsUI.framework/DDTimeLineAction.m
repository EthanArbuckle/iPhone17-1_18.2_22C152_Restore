@interface DDTimeLineAction
+ (id)viewControllerProviderClass;
- (CGSize)suggestedContentSize;
- (id)commitURL;
- (id)menuActionClasses;
- (id)platterTitle;
- (id)previewActions;
- (id)startDate;
@end

@implementation DDTimeLineAction

- (id)startDate
{
  startDate = self->_startDate;
  if (!startDate)
  {
    beginDateOfEventResults([(DDAction *)self associatedResults], self->super.super.super._context, 0, 0, 0);
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_startDate;
    self->_startDate = v4;

    startDate = self->_startDate;
  }
  return startDate;
}

- (id)platterTitle
{
  v2 = [(DDTimeLineAction *)self startDate];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v2 dateStyle:3 timeStyle:0];
  }
  else
  {
    v3 = &stru_1EF5023D8;
  }

  return v3;
}

+ (id)viewControllerProviderClass
{
  return @"DDRemoteTimeLineViewControllerProvider";
}

- (id)previewActions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->super.super.super._ics)
  {
    [v3 addObject:objc_opt_class()];
    v4 = [(NSDictionary *)self->super.super.super._context objectForKeyedSubscript:@"CachedEvent"];
    BOOL v5 = +[DDOpenMapsAction actionAvailableForCachedEvent:v4];

    if (v5) {
      [v3 addObject:objc_opt_class()];
    }
    v6 = [(NSDictionary *)self->super.super.super._context objectForKeyedSubscript:@"CachedEvent"];
    BOOL v7 = +[DDOpenMapsAction actionAvailableForCachedEvent:v6];

    if (v7) {
LABEL_5:
    }
      [v3 addObject:objc_opt_class()];
  }
  else
  {
    if (self->super.super.super._result
      && +[DDTimeZoneConversionAction actionAvailableForResult:](DDTimeZoneConversionAction, "actionAvailableForResult:"))
    {
      [v3 addObject:objc_opt_class()];
    }
    if (+[DDAddEventAction isAvailable]) {
      [v3 addObject:objc_opt_class()];
    }
    if (+[DDCreateReminderAction isAvailable]) {
      [v3 addObject:objc_opt_class()];
    }
    if (+[DDEventsAction isAvailable]) {
      goto LABEL_5;
    }
  }
  [v3 addObject:objc_opt_class()];
  [v3 addObject:objc_opt_class()];
  [v3 addObject:objc_opt_class()];
  return v3;
}

- (id)menuActionClasses
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(DDTimeLineAction *)self previewActions];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v15 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)commitURL
{
  v2 = [(DDTimeLineAction *)self startDate];
  id v3 = NSString;
  [v2 timeIntervalSinceReferenceDate];
  uint64_t v5 = objc_msgSend(v3, "stringWithFormat:", @"calshow:%f", v4);
  uint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];

  return v6;
}

- (CGSize)suggestedContentSize
{
  double v2 = 375.0;
  double v3 = 375.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
}

@end