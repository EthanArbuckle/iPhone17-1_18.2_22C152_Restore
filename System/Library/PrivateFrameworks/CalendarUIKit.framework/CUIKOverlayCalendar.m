@interface CUIKOverlayCalendar
+ (id)overlayCalendar;
+ (id)overlayCalendarForCalendarIdentifier:(id)a3 timezone:(id)a4;
+ (id)overlayCalendarID;
+ (void)overlayCalendarPrefChanged;
@end

@implementation CUIKOverlayCalendar

+ (id)overlayCalendarForCalendarIdentifier:(id)a3 timezone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 length])
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:v5];
    if (v7)
    {
      v8 = [MEMORY[0x1E4F70FE8] localeForCalendarID:v5];
      [v7 setLocale:v8];

      [v7 setTimeZone:v6];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)overlayCalendarPrefChanged
{
}

+ (id)overlayCalendarID
{
  v2 = [MEMORY[0x1E4F576E0] shared];
  v3 = [v2 stringForKey:*MEMORY[0x1E4F57578]];

  if (!v3)
  {
    if (![MEMORY[0x1E4F70FE8] isLunarCalendarDefaultOn]) {
      goto LABEL_4;
    }
    v4 = (void *)MEMORY[0x1E4F70FE8];
    id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v6 = [v5 localeIdentifier];
    v3 = [v4 preferredLunarCalendarForLocaleID:v6];

    if (!v3) {
LABEL_4:
    }
      v3 = &stru_1F187C430;
  }

  return v3;
}

+ (id)overlayCalendar
{
  if (overlayCalendar_onceToken != -1) {
    dispatch_once(&overlayCalendar_onceToken, &__block_literal_global_28);
  }
  v2 = [MEMORY[0x1E4F29060] currentThread];
  v3 = [v2 threadDictionary];

  v4 = [v3 objectForKeyedSubscript:@"com.apple.mobilecal.overlayCalendarGeneration"];
  id v5 = v4;
  if (!v4)
  {
    uint64_t v7 = s_overlayCalendarGeneration;
    goto LABEL_7;
  }
  unint64_t v6 = [v4 unsignedIntegerValue];
  uint64_t v7 = s_overlayCalendarGeneration;
  if (v6 < s_overlayCalendarGeneration)
  {
LABEL_7:
    v8 = [NSNumber numberWithUnsignedInteger:v7];
    [v3 setObject:v8 forKeyedSubscript:@"com.apple.mobilecal.overlayCalendarGeneration"];

    v9 = [(id)objc_opt_class() overlayCalendarID];
    v10 = [MEMORY[0x1E4F57688] activeTimeZone];
    v11 = +[CUIKOverlayCalendar overlayCalendarForCalendarIdentifier:v9 timezone:v10];
    if (v11) {
      [v3 setObject:v11 forKeyedSubscript:@"com.apple.mobilecal.overlayCalendar"];
    }
    else {
      [v3 removeObjectForKey:@"com.apple.mobilecal.overlayCalendar"];
    }
  }
  v12 = [v3 objectForKeyedSubscript:@"com.apple.mobilecal.overlayCalendar"];

  return v12;
}

void __38__CUIKOverlayCalendar_overlayCalendar__block_invoke()
{
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4F1C370];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v8 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_14_0];

  v3 = [MEMORY[0x1E4F28F08] mainQueue];
  id v4 = (id)[v8 addObserverForName:@"com.apple.calendar.TimeZoneChanged" object:0 queue:v3 usingBlock:&__block_literal_global_14_0];

  uint64_t v5 = *MEMORY[0x1E4F57580];
  unint64_t v6 = [MEMORY[0x1E4F28F08] mainQueue];
  id v7 = (id)[v8 addObserverForName:v5 object:0 queue:v6 usingBlock:&__block_literal_global_14_0];
}

void __38__CUIKOverlayCalendar_overlayCalendar__block_invoke_2()
{
}

@end