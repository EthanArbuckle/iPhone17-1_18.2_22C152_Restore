@interface ADRemoteRequestHelper
+ (id)requestWithActivityInfo:(id)a3;
+ (void)getInfoForHandoffPayload:(id)a3 userInfo:(id *)a4 wepageURL:(id *)a5;
- (ADRemoteRequestHelper)initWithQueue:(id)a3;
- (AFRequestInfo)remoteRequestInfo;
- (id)completion;
- (id)userNotificationRequestForRemoteRequest;
- (void)setCompletion:(id)a3;
- (void)setRemoteRequestInfo:(id)a3;
@end

@implementation ADRemoteRequestHelper

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_remoteRequestInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_handoffNotificationID, 0);
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (AFRequestInfo)remoteRequestInfo
{
  return self->_remoteRequestInfo;
}

- (id)userNotificationRequestForRemoteRequest
{
  if (self->_remoteRequestInfo)
  {
    id v3 = objc_alloc_init((Class)UNMutableNotificationContent);
    [v3 setShouldBackgroundDefaultAction:1];
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    if ([(AFRequestInfo *)self->_remoteRequestInfo isATVHandoff]) {
      CFStringRef v5 = @"ASSISTANT_SERVICES_ATV_REQUEST_HANDOFF_NOTIFICATION_TITLE";
    }
    else {
      CFStringRef v5 = @"ASSISTANT_SERVICES_HOMEPOD_REQUEST_HANDOFF_NOTIFICATION_TITLE";
    }
    if (sub_1001FD68C())
    {
      v6 = [v4 localizations];
      v7 = +[NSUserDefaults standardUserDefaults];
      v8 = [v7 objectForKey:@"AppleLanguages"];
      v9 = +[NSBundle preferredLocalizationsFromArray:v6 forPreferences:v8];
      v10 = [v9 firstObject];

      v11 = +[NSBundle mainBundle];
      v12 = [v11 localizedStringForKey:v5 value:0 table:0 localization:v10];
    }
    else
    {
      v12 = [v4 localizedStringForKey:v5 value:0 table:0];
    }
    v14 = [(AFRequestInfo *)self->_remoteRequestInfo handoffOriginDeviceName];
    v15 = +[NSString stringWithValidatedFormat:v12, @"%@", 0, v14 validFormatSpecifiers error];

    [v3 setTitle:v15];
    v16 = [(AFRequestInfo *)self->_remoteRequestInfo handoffNotification];
    [v3 setBody:v16];

    v13 = +[UNNotificationRequest requestWithIdentifier:self->_handoffNotificationID content:v3 trigger:0];
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)setRemoteRequestInfo:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_remoteRequestInfo, a3);
  if (self->_handoffNotificationID)
  {
    CFStringRef v5 = +[ADUserNotificationServiceProvider personalDomainNotificationProvider];
    [v5 withdrawNotificationRequestWithIdentifier:self->_handoffNotificationID];
  }
  v6 = +[NSUUID UUID];
  v7 = [v6 UUIDString];
  handoffNotificationID = self->_handoffNotificationID;
  self->_handoffNotificationID = v7;
}

- (ADRemoteRequestHelper)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADRemoteRequestHelper;
  v6 = [(ADRemoteRequestHelper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

+ (void)getInfoForHandoffPayload:(id)a3 userInfo:(id *)a4 wepageURL:(id *)a5
{
  v7 = [a3 handoffPayload];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 sessionHandoffData];
    id v9 = [v8 copy];

    if (v9)
    {
      CFStringRef v13 = @"Data";
      id v14 = v9;
      v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = 0;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v11 = [v7 link];
  id v12 = [v11 copy];

  if (a4) {
LABEL_11:
  }
    *a4 = v10;
LABEL_12:
  if (a5) {
    *a5 = v12;
  }
}

+ (id)requestWithActivityInfo:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)SAStartHandoffRequest);
  id v5 = [v3 objectForKey:@"Data"];

  [v4 setHandoffData:v5];
  return v4;
}

@end