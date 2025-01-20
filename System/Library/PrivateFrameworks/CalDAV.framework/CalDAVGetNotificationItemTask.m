@interface CalDAVGetNotificationItemTask
- (void)finishCoreDAVTaskWithError:(id)a3;
@end

@implementation CalDAVGetNotificationItemTask

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4 = a3;
  v5 = [(CalDAVGetNotificationItemTask *)self responseHeaders];
  v6 = [v5 CDVObjectForKeyCaseInsensitive:*MEMORY[0x263F34A60]];

  v7 = [(CalDAVGetNotificationItemTask *)self responseBodyParser];
  v8 = [v7 octetStreamData];

  v9 = [CalDAVNotificationItemData alloc];
  v10 = [(CalDAVGetNotificationItemTask *)self url];
  v11 = [(CoreDAVLeafDataPayload *)v9 initWithURL:v10 eTag:v6 dataPayload:v8 inContainerWithURL:0 withAccountInfoProvider:0];

  v12 = [(CalDAVGetNotificationItemTask *)self url];
  [(CoreDAVLeafDataPayload *)v11 setServerID:v12];

  [(CoreDAVGetTask *)self setAppSpecificDataItemResult:v11];
  v13.receiver = self;
  v13.super_class = (Class)CalDAVGetNotificationItemTask;
  [(CoreDAVGetTask *)&v13 finishCoreDAVTaskWithError:v4];
}

@end