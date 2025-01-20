@interface CNAutocompleteCalendarServerResult
+ (id)contactResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5 identifier:(id)a6 userInfo:(id)a7;
+ (unint64_t)category;
@end

@implementation CNAutocompleteCalendarServerResult

+ (unint64_t)category
{
  return 3;
}

+ (id)contactResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5 identifier:(id)a6 userInfo:(id)a7
{
  id v12 = a7;
  v13 = [a1 contactResultWithDisplayName:a3 value:a4 nameComponents:a5 identifier:a6];
  [v13 setUserInfo:v12];

  [v13 setSourceType:64];
  return v13;
}

@end