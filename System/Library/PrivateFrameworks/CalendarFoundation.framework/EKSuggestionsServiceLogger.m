@interface EKSuggestionsServiceLogger
+ (Class)_SGSuggestionsServiceClass;
+ (void)logEventConfirmedDetailsWithUniqueKey:(id)a3;
+ (void)logEventConfirmedInboxWithUniqueKey:(id)a3;
+ (void)logEventConfirmedNotificationWithUniqueKey:(id)a3;
+ (void)logEventDismissedNotificationWithUniqueKey:(id)a3;
+ (void)logEventEngagedNotificationWithUniqueKey:(id)a3;
+ (void)logEventRejectedDetailsWithUniqueKey:(id)a3;
+ (void)logEventRejectedInboxWithUniqueKey:(id)a3;
+ (void)logEventRejectedNotificationWithUniqueKey:(id)a3;
+ (void)logEventShowedDetailsWithUniqueKey:(id)a3;
+ (void)logEventShowedNotificationWithUniqueKey:(id)a3;
+ (void)logEventShowedTimeToLeaveNotificationWithUniqueKey:(id)a3;
@end

@implementation EKSuggestionsServiceLogger

+ (void)logEventShowedNotificationWithUniqueKey:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 logEventInteractionForEventWithUniqueKey:v3 interface:8 actionType:4];
  }
}

+ (void)logEventEngagedNotificationWithUniqueKey:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 logEventInteractionForEventWithUniqueKey:v3 interface:8 actionType:5];
  }
}

+ (void)logEventDismissedNotificationWithUniqueKey:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 logEventInteractionForEventWithUniqueKey:v3 interface:8 actionType:8];
  }
}

+ (void)logEventRejectedNotificationWithUniqueKey:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 logEventInteractionForEventWithUniqueKey:v3 interface:8 actionType:7];
  }
}

+ (void)logEventConfirmedNotificationWithUniqueKey:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 logEventInteractionForEventWithUniqueKey:v3 interface:8 actionType:6];
  }
}

+ (void)logEventConfirmedInboxWithUniqueKey:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 logEventInteractionForEventWithUniqueKey:v3 interface:9 actionType:6];
  }
}

+ (void)logEventRejectedInboxWithUniqueKey:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 logEventInteractionForEventWithUniqueKey:v3 interface:9 actionType:7];
  }
}

+ (void)logEventShowedDetailsWithUniqueKey:(id)a3
{
  id v5 = a3;
  BOOL v3 = +[CalEntitlementsVerifier currentProcessIsFirstPartyCalendarApp];
  if (v5 && v3)
  {
    id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    [v4 logEventInteractionForEventWithUniqueKey:v5 interface:10 actionType:4];
  }
}

+ (void)logEventConfirmedDetailsWithUniqueKey:(id)a3
{
  id v5 = a3;
  BOOL v3 = +[CalEntitlementsVerifier currentProcessIsFirstPartyCalendarApp];
  if (v5 && v3)
  {
    id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    [v4 logEventInteractionForEventWithUniqueKey:v5 interface:10 actionType:6];
  }
}

+ (void)logEventRejectedDetailsWithUniqueKey:(id)a3
{
  id v5 = a3;
  BOOL v3 = +[CalEntitlementsVerifier currentProcessIsFirstPartyCalendarApp];
  if (v5 && v3)
  {
    id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    [v4 logEventInteractionForEventWithUniqueKey:v5 interface:10 actionType:7];
  }
}

+ (void)logEventShowedTimeToLeaveNotificationWithUniqueKey:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 logEventInteractionForEventWithUniqueKey:v3 interface:18 actionType:4];
  }
}

+ (Class)_SGSuggestionsServiceClass
{
  return (Class)EKWeakLinkClass(@"SGSuggestionsService", 0x11uLL);
}

@end