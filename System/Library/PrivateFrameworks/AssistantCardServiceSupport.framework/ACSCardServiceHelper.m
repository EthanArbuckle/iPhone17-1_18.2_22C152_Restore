@interface ACSCardServiceHelper
+ (id)formattedDateTimeStringFromDate:(id)a3;
+ (id)formattedDateTimeStringFromDateComponents:(id)a3;
+ (id)rowCardSectionFromLeadingText:(id)a3 trailingText:(id)a4;
+ (void)addParameterToSection:(id)a3 selectorStrings:(id)a4 class:(Class)a5;
@end

@implementation ACSCardServiceHelper

+ (id)rowCardSectionFromLeadingText:(id)a3 trailingText:(id)a4
{
  v5 = (void *)MEMORY[0x263F67A00];
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(v5, "acs_uniquelyIdentifiedCardSection");
  v9 = [MEMORY[0x263F679F0] textWithString:v7];

  [v8 setLeadingText:v9];
  v10 = [MEMORY[0x263F679F0] textWithString:v6];

  [v8 setTrailingText:v10];
  return v8;
}

+ (id)formattedDateTimeStringFromDateComponents:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  v5 = [v3 currentCalendar];
  id v6 = [v5 dateFromComponents:v4];

  id v7 = [(id)objc_opt_class() formattedDateTimeStringFromDate:v6];

  return v7;
}

+ (id)formattedDateTimeStringFromDate:(id)a3
{
  uint64_t v3 = formattedDateTimeStringFromDate__once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&formattedDateTimeStringFromDate__once, &__block_literal_global_1);
  }
  v5 = [(id)formattedDateTimeStringFromDate__acsDateFormatter stringFromDate:v4];

  return v5;
}

uint64_t __56__ACSCardServiceHelper_formattedDateTimeStringFromDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)formattedDateTimeStringFromDate__acsDateFormatter;
  formattedDateTimeStringFromDate__acsDateFormatter = (uint64_t)v0;

  [(id)formattedDateTimeStringFromDate__acsDateFormatter setDateStyle:1];
  v2 = (void *)formattedDateTimeStringFromDate__acsDateFormatter;
  return [v2 setTimeStyle:1];
}

+ (void)addParameterToSection:(id)a3 selectorStrings:(id)a4 class:(Class)a5
{
  id v7 = a3;
  id v11 = [a4 componentsJoinedByString:@"."];
  v8 = (void *)MEMORY[0x263F0FCE0];
  v9 = [NSString stringWithString:v11];
  v10 = [v8 parameterForClass:a5 keyPath:v9];

  objc_msgSend(v7, "acs_addParameter:", v10);
}

@end