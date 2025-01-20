@interface ADCalendarTransformer
- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5;
- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4;
@end

@implementation ADCalendarTransformer

- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    v10 = [v8 domain];
    if ([v10 isEqualToString:@"com.apple.siri.calendar.Error"])
    {
      id v11 = [v8 code];

      if (v11 == (id)100)
      {
        id v12 = objc_alloc_init((Class)SACommandFailed);
        v13 = [v9 aceId];
        [v12 setRefId:v13];

        [v12 setErrorCode:SACalendarNoEventsFoundErrorCode];
        [v12 setReason:@"No matching event was found"];
        goto LABEL_9;
      }
    }
    else
    {
    }
    objc_msgSend(v9, "ad_aceResponseCommandGenericErrorRepresentation");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = objc_alloc_init((Class)SACommandSucceeded);
  }
  id v12 = v14;
LABEL_9:

  return v12;
}

- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4
{
  id v8 = (void (**)(id, id))a4;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    id v7 = objc_alloc_init((Class)AFShowNextEventRequest);
  }
  else {
    id v7 = 0;
  }
  v8[2](v8, v7);
}

@end