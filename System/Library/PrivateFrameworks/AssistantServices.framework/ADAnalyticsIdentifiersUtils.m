@interface ADAnalyticsIdentifiersUtils
+ (BOOL)isPartOfHome:(id)a3;
+ (id)idWhenNotPartOfHome;
+ (id)logger;
@end

@implementation ADAnalyticsIdentifiersUtils

+ (BOOL)isPartOfHome:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  v4 = +[ADAnalyticsIdentifiersUtils idWhenNotPartOfHome];
  unsigned __int8 v5 = [v3 isEqual:v4];

  char v6 = v5 ^ 1;
  return v6;
}

+ (id)idWhenNotPartOfHome
{
  if (qword_100585D58 != -1) {
    dispatch_once(&qword_100585D58, &stru_1005046E0);
  }
  v2 = (void *)qword_100585D50;
  return v2;
}

+ (id)logger
{
  if (qword_100585D48 != -1) {
    dispatch_once(&qword_100585D48, &stru_1005046C0);
  }
  v2 = (void *)qword_100585D40;
  return v2;
}

@end