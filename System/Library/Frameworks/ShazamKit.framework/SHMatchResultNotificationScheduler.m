@interface SHMatchResultNotificationScheduler
+ (UNUserNotificationCenter)userNotificationCenter;
+ (void)setUserNotificationCenter:(id)a3;
- (BOOL)canSendNotificationForMatch:(id)a3;
- (BOOL)canSendNotificationForNoMatchSignatureID:(id)a3;
- (NSUUID)currentSignatureID;
- (SHAttribution)attribution;
- (SHMatchResultNotificationContentDeliverer)contentDeliverer;
- (SHMatchResultNotificationScheduler)initWithAttribution:(id)a3;
- (SHMatchedMediaItem)currentMediaItem;
- (void)sendAnalyticsEventForMatch:(id)a3;
- (void)sendMatchNotification:(id)a3 completionHandler:(id)a4;
- (void)sendNotificationForMatch:(id)a3 completionHandler:(id)a4;
- (void)sendNotificationForNoMatchWithCompletionHandler:(id)a3;
- (void)sendNotificationForResponse:(id)a3 completionHandler:(id)a4;
- (void)setCurrentMediaItem:(id)a3;
- (void)setCurrentSignatureID:(id)a3;
@end

@implementation SHMatchResultNotificationScheduler

+ (void)setUserNotificationCenter:(id)a3
{
}

+ (UNUserNotificationCenter)userNotificationCenter
{
  return (UNUserNotificationCenter *)(id)qword_100090A50;
}

- (SHMatchResultNotificationScheduler)initWithAttribution:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SHMatchResultNotificationScheduler;
  v6 = [(SHMatchResultNotificationScheduler *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attribution, a3);
    v8 = [[SHMatchResultUserNotificationContentProvider alloc] initWithAttribution:v5];
    v9 = [[SHMatchResultUserNotificationContentDeliverer alloc] initWithContentProvider:v8];
    contentDeliverer = v7->_contentDeliverer;
    v7->_contentDeliverer = (SHMatchResultNotificationContentDeliverer *)v9;
  }
  return v7;
}

- (BOOL)canSendNotificationForMatch:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SHMatchResultNotificationScheduler *)self currentMediaItem];
    if ([v4 containsMediaItemWithFuzzyTolerance:v5])
    {
      v6 = [(SHMatchResultNotificationScheduler *)self currentSignatureID];
      v7 = [v4 querySignature];
      v8 = [v7 _ID];
      unsigned int v9 = [v6 isEqual:v8] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)sendNotificationForMatch:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 mediaItems];
  unsigned int v9 = [v8 firstObject];
  [(SHMatchResultNotificationScheduler *)self setCurrentMediaItem:v9];

  v10 = [v7 querySignature];
  v11 = [v10 _ID];
  [(SHMatchResultNotificationScheduler *)self setCurrentSignatureID:v11];

  [(SHMatchResultNotificationScheduler *)self sendAnalyticsEventForMatch:v7];
  id v12 = [(SHMatchResultNotificationScheduler *)self currentMediaItem];
  [(SHMatchResultNotificationScheduler *)self sendMatchNotification:v12 completionHandler:v6];
}

- (BOOL)canSendNotificationForNoMatchSignatureID:(id)a3
{
  id v4 = a3;
  id v5 = [(SHMatchResultNotificationScheduler *)self currentSignatureID];
  unsigned __int8 v6 = [v5 isEqual:v4];

  return v6 ^ 1;
}

- (void)sendNotificationForNoMatchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = sh_log_object();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Sending no match notification", v7, 2u);
  }

  [(SHMatchResultNotificationScheduler *)self sendAnalyticsEventForMatch:0];
  unsigned __int8 v6 = [(SHMatchResultNotificationScheduler *)self contentDeliverer];
  [v6 deliverContentForNoMatchWithCompletion:v4];
}

- (void)sendAnalyticsEventForMatch:(id)a3
{
  id v10 = +[NSMutableDictionary dictionary];
  id v5 = [(SHMatchResultNotificationScheduler *)self attribution];
  unsigned __int8 v6 = [v5 bundleIdentifier];
  [v10 setValue:v6 forKey:SHAnalyticsPayloadSourceKey];

  id v7 = +[NSNumber numberWithBool:a3 != 0];
  [v10 setObject:v7 forKey:SHAnalyticsPayloadMatchKey];

  uint64_t v8 = SHAnalyticsEventMusicRecognitionResult;
  id v9 = [v10 copy];
  +[SHAnalytics sendEvent:v8 withPayload:v9];
}

- (void)sendNotificationForResponse:(id)a3 completionHandler:(id)a4
{
  id v14 = a3;
  unsigned __int8 v6 = (void (**)(void))a4;
  id v7 = [v14 result];
  if (v7 == (id)1)
  {
    v11 = [v14 match];
    unsigned int v12 = [(SHMatchResultNotificationScheduler *)self canSendNotificationForMatch:v11];

    if (v12)
    {
      v13 = [v14 match];
      [(SHMatchResultNotificationScheduler *)self sendNotificationForMatch:v13 completionHandler:v6];

      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v7 == (id)2 || v7 == (id)3)
  {
    uint64_t v8 = [v14 signature];
    id v9 = [v8 _ID];
    unsigned int v10 = [(SHMatchResultNotificationScheduler *)self canSendNotificationForNoMatchSignatureID:v9];

    if (v10)
    {
      [(SHMatchResultNotificationScheduler *)self sendNotificationForNoMatchWithCompletionHandler:v6];
      goto LABEL_9;
    }
LABEL_8:
    v6[2](v6);
  }
LABEL_9:
}

- (void)sendMatchNotification:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = sh_log_object();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)unsigned int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Sending match notification", v10, 2u);
  }

  id v9 = [(SHMatchResultNotificationScheduler *)self contentDeliverer];
  [v9 deliverContentForMatchedMediaItem:v7 completion:v6];
}

- (SHMatchedMediaItem)currentMediaItem
{
  return self->_currentMediaItem;
}

- (void)setCurrentMediaItem:(id)a3
{
}

- (NSUUID)currentSignatureID
{
  return self->_currentSignatureID;
}

- (void)setCurrentSignatureID:(id)a3
{
}

- (SHAttribution)attribution
{
  return self->_attribution;
}

- (SHMatchResultNotificationContentDeliverer)contentDeliverer
{
  return self->_contentDeliverer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDeliverer, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_currentSignatureID, 0);

  objc_storeStrong((id *)&self->_currentMediaItem, 0);
}

@end