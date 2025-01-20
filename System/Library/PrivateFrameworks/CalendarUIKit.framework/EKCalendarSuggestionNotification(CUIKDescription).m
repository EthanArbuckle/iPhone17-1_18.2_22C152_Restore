@interface EKCalendarSuggestionNotification(CUIKDescription)
- (id)allDescriptionStringsWithOptions:()CUIKDescription;
- (id)descriptionStrings:()CUIKDescription;
- (uint64_t)supportsDisplay;
- (void)supportsDisplay;
@end

@implementation EKCalendarSuggestionNotification(CUIKDescription)

- (uint64_t)supportsDisplay
{
  v2 = [a1 event];

  if (!v2)
  {
    v4 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[EKCalendarSuggestionNotification(CUIKDescription) supportsDisplay](v4);
    }
    goto LABEL_12;
  }
  v3 = [a1 event];
  v4 = [v3 localCustomObjectForKey:*MEMORY[0x1E4F578F8]];

  if (!v4)
  {
    v6 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[EKCalendarSuggestionNotification(CUIKDescription) supportsDisplay](a1);
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(EKCalendarSuggestionNotification(CUIKDescription) *)(uint64_t)v4 supportsDisplay];
    }
LABEL_11:

LABEL_12:
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = [v4 BOOLValue];
LABEL_13:

  return v5;
}

- (id)descriptionStrings:()CUIKDescription
{
  uint64_t v5 = objc_opt_new();
  v6 = [a1 startDateForNextOccurrence];
  if ([a1 type] == 13)
  {
    v7 = CUIKBundle();
    v8 = [v7 localizedStringForKey:@"Canceled" value:&stru_1F187C430 table:0];

    [v5 setObject:v8 forKeyedSubscript:@"Action"];
    v9 = (void *)MEMORY[0x1E4F1CC38];
    v10 = @"Cancelled";
    v11 = v5;
LABEL_17:
    [v11 setObject:v9 forKeyedSubscript:v10];
LABEL_18:

    goto LABEL_19;
  }
  if ([a1 type] == 12)
  {
    v12 = [a1 originAppName];
    v8 = +[CUIKSuggestionDescriptionGenerator brandedOriginDescriptionStringWithAppName:v12];

    if (v6)
    {
      v13 = [v6 localizedYearMonthAndDayStringShortened:0];
      if ([a1 allDay])
      {
        [v5 setObject:v13 forKeyedSubscript:@"Date"];
      }
      else
      {
        v15 = [v6 timeStringAlwaysIncludeMinutes:0];
        v16 = NSString;
        v17 = CUIKBundle();
        v18 = [v17 localizedStringForKey:@"%@ at %@" value:&stru_1F187C430 table:0];
        v19 = objc_msgSend(v16, "localizedStringWithFormat:", v18, v13, v15);

        [v5 setObject:v19 forKeyedSubscript:@"Date"];
      }
    }
    v10 = @"Action";
    goto LABEL_16;
  }
  id v14 = (id)[a1 _resourceChangeStringWithOptions:a3 dict:v5];
  if ([a1 type] != 14) {
    goto LABEL_19;
  }
  v8 = [v5 objectForKeyedSubscript:@"Date"];
  if (v8 || !v6) {
    goto LABEL_18;
  }
  if (([a1 timeChanged] & 1) != 0 || objc_msgSend(a1, "dateChanged"))
  {
    v8 = [v6 localizedYearMonthAndDayStringShortened:0];
    v10 = @"Date";
LABEL_16:
    v11 = v5;
    v9 = v8;
    goto LABEL_17;
  }
LABEL_19:

  return v5;
}

- (id)allDescriptionStringsWithOptions:()CUIKDescription
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend(a1, "descriptionStrings:");
  v2 = [v1 objectForKeyedSubscript:@"Date"];
  uint64_t v3 = [v1 objectForKeyedSubscript:@"Action"];
  v4 = (void *)v3;
  if (v2)
  {
    v11 = v2;
    uint64_t v12 = v3;
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = (uint64_t *)&v11;
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v10 = v3;
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = &v10;
    uint64_t v7 = 1;
  }
  v8 = objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v10, v11, v12);

  return v8;
}

- (void)supportsDisplay
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  uint64_t v7 = [a2 event];
  v8 = [v7 uniqueId];
  int v9 = 138543618;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = v8;
  _os_log_error_impl(&dword_1BDF08000, a3, OS_LOG_TYPE_ERROR, "Event has unexpected type ('%{public}@') for key used to determine if suggested event is eligible for notification, event unique identifier = %{public}@", (uint8_t *)&v9, 0x16u);
}

@end