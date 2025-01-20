@interface ADAnalyticsFBFDeliveryInfrastructure
- (void)_deliverSerializedWrapper:(id)a3;
- (void)deliverLogViewerIdentifier:(id)a3;
- (void)deliverWrappedEvent:(id)a3;
- (void)deliverWrappedEvents:(id)a3;
@end

@implementation ADAnalyticsFBFDeliveryInfrastructure

- (void)_deliverSerializedWrapper:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v5 = +[FLLogger sharedLogger];
    v4 = +[SiriAnalyticsOffDeviceTopics unordered];
    [v5 report:v3 application:v4];
  }
}

- (void)deliverWrappedEvents:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(ADAnalyticsFBFDeliveryInfrastructure *)self deliverWrappedEvent:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)deliverWrappedEvent:(id)a3
{
  id v4 = [a3 data];
  [(ADAnalyticsFBFDeliveryInfrastructure *)self _deliverSerializedWrapper:v4];
}

- (void)deliverLogViewerIdentifier:(id)a3
{
  id v7 = a3;
  id v3 = +[AFPreferences sharedPreferences];
  unsigned int v4 = [v3 longLivedIdentifierUploadingEnabled];

  id v5 = +[FLLogger sharedLogger];
  if (v4) {
    id v6 = v7;
  }
  else {
    id v6 = 0;
  }
  [v5 setValue:v6 forUploadHeaderNamed:@"userId"];
}

@end