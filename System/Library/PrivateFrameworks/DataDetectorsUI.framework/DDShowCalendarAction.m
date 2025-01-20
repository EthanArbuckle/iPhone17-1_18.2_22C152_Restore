@interface DDShowCalendarAction
- (BOOL)canBePerformedByOpeningURL;
- (id)iconName;
- (id)localizedName;
- (void)performFromView:(id)a3;
@end

@implementation DDShowCalendarAction

- (id)localizedName
{
  return DDLocalizedString(@"Show in Calendar");
}

- (id)iconName
{
  return @"calendar";
}

- (void)performFromView:(id)a3
{
  context = self->super._context;
  id v5 = a3;
  v6 = [(NSDictionary *)context objectForKeyedSubscript:0x1EF5023F8];
  _eventStartDateFromCache(v6);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v14;
  if (!v14)
  {
    if (self->super._ics)
    {
      v7 = 0;
    }
    else
    {
      v8 = [(DDAction *)self associatedResults];
      v9 = [(DDAction *)self context];
      beginDateOfEventResults(v8, v9, 0, 0, 0);
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      v7 = v15;
    }
  }
  v10 = NSString;
  id v16 = v7;
  [v7 timeIntervalSinceReferenceDate];
  v12 = objc_msgSend(v10, "stringWithFormat:", @"calshow:%f", v11);
  v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
  DDUIRecordOtherActionInSheetForResultIfNeeded((uint64_t)self->super._result);
  [(DDAction *)self _performFromView:v5 byOpeningURL:v13];
}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

@end