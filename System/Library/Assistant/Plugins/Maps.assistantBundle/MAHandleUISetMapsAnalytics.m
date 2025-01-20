@interface MAHandleUISetMapsAnalytics
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation MAHandleUISetMapsAnalytics

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  v5 = (void (**)(id, void *))a3;
  id v11 = [(MAHandleUISetMapsAnalytics *)self extSessionGuid];
  v6 = [(MAHandleUISetMapsAnalytics *)self extSessionGuidCreatedTimestamp];
  if (v11 && v6)
  {
    id v7 = +[GEOUserSession sharedInstance];
    id v8 = objc_alloc_init((Class)GEOUserSessionEntity);
    [v8 updateSessionIDFromUUIDString:v11];
    [v6 timeIntervalSinceReferenceDate];
    objc_msgSend(v8, "setSessionCreationTime:");
    [v7 setSharedMapsUserSessionEntity:v8 shareSessionIDWithMaps:1];
    id v9 = objc_alloc_init((Class)SACommandSucceeded);
    v10 = [v9 dictionary];
    v5[2](v5, v10);

    v5 = (void (**)(id, void *))v9;
  }
  else
  {
    id v7 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Missing values for extSessionGuid or extSessionGuidCreatedTimestamp"];
    id v8 = [v7 dictionary];
    v5[2](v5, v8);
  }
}

@end