@interface _WKWebPushAction
+ (id)_webPushActionWithNotificationResponse:(id)a3;
+ (id)webPushActionWithDictionary:(id)a3;
- (NSNumber)version;
- (NSString)pushPartition;
- (NSString)type;
- (id).cxx_construct;
- (id)_nameForBackgroundTaskAndLogging;
- (optional<WebCore::NotificationData>)coreNotificationData;
- (unint64_t)beginBackgroundTaskForHandling;
- (void)setCoreNotificationData:(optional<WebCore::NotificationData> *)a3;
- (void)setPushPartition:(id)a3;
- (void)setType:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation _WKWebPushAction

+ (id)webPushActionWithDictionary:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"WebPushActionVersion"];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = [a3 objectForKeyedSubscript:@"WebPushActionPartition"];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v8 = [a3 objectForKeyedSubscript:@"WebPushActionType"];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v10 = objc_alloc_init(_WKWebPushAction);
  [(_WKWebPushAction *)v10 setVersion:v5];
  [(_WKWebPushAction *)v10 setPushPartition:v7];
  [(_WKWebPushAction *)v10 setType:v9];

  return v10;
}

+ (id)_webPushActionWithNotificationResponse:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "notification"), "sourceIdentifier"), "hasPrefix:", @"com.apple.WebKit.PushBundle."))return 0; {
  uint64_t v4 = (WebCore::NotificationData *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "notification"), "request"), "content"), "userInfo");
  }
  WebCore::NotificationData::fromDictionary(v17, v4, v5);
  if (!v18) {
    return 0;
  }
  uint64_t v6 = objc_alloc_init(_WKWebPushAction);
  uint64_t v7 = (void *)[a3 actionIdentifier];
  if ([v7 isEqualToString:*MEMORY[0x1E4F446D0]])
  {
    uint64_t v8 = @"_WKWebPushActionTypeNotificationClick";
  }
  else
  {
    uint64_t v9 = (void *)[a3 actionIdentifier];
    if (![v9 isEqualToString:*MEMORY[0x1E4F446E0]])
    {
      v11 = qword_1EB3583C0;
      if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = [a3 actionIdentifier];
        _os_log_error_impl(&dword_1985F2000, v11, OS_LOG_TYPE_ERROR, "Unknown notification response action identifier encountered: %@", buf, 0xCu);
      }
      uint64_t v6 = 0;
      goto LABEL_15;
    }
    uint64_t v8 = @"_WKWebPushActionTypeNotificationClose";
  }
  [(_WKWebPushAction *)v6 setType:v8];
  v13[0] = 0;
  char v14 = 0;
  if (v18)
  {
    WebCore::NotificationData::NotificationData((uint64_t)v13, (uint64_t)v17);
    char v14 = 1;
  }
  [(_WKWebPushAction *)v6 setCoreNotificationData:v13];
  if (v14) {
    WebCore::NotificationData::~NotificationData((WebCore::NotificationData *)v13, v10);
  }
LABEL_15:
  if (v18) {
    WebCore::NotificationData::~NotificationData((WebCore::NotificationData *)v17, v10);
  }
  return v6;
}

- (id)_nameForBackgroundTaskAndLogging
{
  if ([(NSString *)self->_type isEqualToString:@"_WKWebPushActionTypePushEvent"]) {
    return @"Web Push Event";
  }
  if ([(NSString *)self->_type isEqualToString:@"_WKWebPushActionTypeNotificationClick"]) {
    return @"Web Notification Click";
  }
  if ([(NSString *)self->_type isEqualToString:@"_WKWebPushActionTypeNotificationClose"]) {
    return @"Web Notification Close";
  }
  return @"Unknown Web Push event";
}

- (unint64_t)beginBackgroundTaskForHandling
{
  pushPartition = self->_pushPartition;
  uint64_t v4 = NSString;
  id v5 = [(_WKWebPushAction *)self _nameForBackgroundTaskAndLogging];
  if (pushPartition) {
    uint64_t v6 = [v4 stringWithFormat:@"%@ for %@", v5, self->_pushPartition];
  }
  else {
    uint64_t v6 = [v4 stringWithFormat:@"%@", v5, v10];
  }
  uint64_t v7 = v6;
  uint64_t v8 = (void *)[MEMORY[0x1E4F42738] sharedApplication];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50___WKWebPushAction_beginBackgroundTaskForHandling__block_invoke;
  v11[3] = &unk_1E5812158;
  v11[4] = v7;
  return [v8 beginBackgroundTaskWithName:v7 expirationHandler:v11];
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

- (NSString)pushPartition
{
  return self->_pushPartition;
}

- (void)setPushPartition:(id)a3
{
  self->_pushPartition = (NSString *)a3;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  self->_type = (NSString *)a3;
}

- (optional<WebCore::NotificationData>)coreNotificationData
{
  retstr->var0.__null_state_ = 0;
  *(&retstr[1].var0.__engaged_ + 64) = 0;
  if (*(&result[1].var0.__engaged_ + 96))
  {
    result = (optional<WebCore::NotificationData> *)WebCore::NotificationData::NotificationData((WebCore::NotificationData *)retstr, (const WebCore::NotificationData *)(&result->var0.__engaged_ + 32));
    *(&retstr[1].var0.__engaged_ + 64) = 1;
  }
  return result;
}

- (void)setCoreNotificationData:(optional<WebCore::NotificationData> *)a3
{
  p_coreNotificationData = &self->_coreNotificationData;
  if (*((unsigned __int8 *)&self[1]._coreNotificationData.var0.__engaged_ + 32) == *((unsigned __int8 *)&a3[1].var0.__engaged_
                                                                                    + 64))
  {
    if (*(&self[1]._coreNotificationData.var0.__engaged_ + 32))
    {
      WTF::String::operator=((uint64_t *)&p_coreNotificationData->var0.__val_, (WTF::StringImpl **)a3);
      long long v6 = *(_OWORD *)(&a3->var0.__engaged_ + 24);
      *(_OWORD *)(&self->_coreNotificationData.var0.__engaged_ + 8) = *(_OWORD *)(&a3->var0.__engaged_ + 8);
      *(_OWORD *)(&self->_coreNotificationData.var0.__engaged_ + 24) = v6;
      WTF::String::operator=((uint64_t *)&self->_coreNotificationData.var0.__val_.title, (WTF::StringImpl **)&a3->var0.__val_.title);
      WTF::String::operator=((uint64_t *)&self->_coreNotificationData.var0.__val_.body, (WTF::StringImpl **)&a3->var0.__val_.body);
      WTF::String::operator=((uint64_t *)&self->_coreNotificationData.var0.__val_.iconURL, (WTF::StringImpl **)&a3->var0.__val_.iconURL);
      WTF::String::operator=((uint64_t *)&self->_coreNotificationData.var0.__val_.tag, (WTF::StringImpl **)&a3->var0.__val_.tag);
      WTF::String::operator=((uint64_t *)&self->_coreNotificationData.var0.__val_.language, (WTF::StringImpl **)&a3->var0.__val_.language);
      self->_coreNotificationData.var0.__val_.direction = a3->var0.__val_.direction;
      WTF::String::operator=((uint64_t *)&self->_coreNotificationData.var0.__val_.originString, (WTF::StringImpl **)&a3->var0.__val_.originString);
      WTF::String::operator=((uint64_t *)&self->_coreNotificationData.var0.__val_.serviceWorkerRegistrationURL, (WTF::StringImpl **)&a3->var0.__val_.serviceWorkerRegistrationURL);
      long long v7 = *(_OWORD *)(&a3->var0.__engaged_ + 104);
      *(_OWORD *)(&self->_coreNotificationData.var0.__engaged_ + 120) = *(_OWORD *)(&a3->var0.__engaged_ + 120);
      *(_OWORD *)(&self->_coreNotificationData.var0.__engaged_ + 104) = v7;
      *((_OWORD *)&self->_coreNotificationData.var0.__engaged_ + 9) = *((_OWORD *)&a3->var0.__engaged_ + 9);
      long long v8 = *((_OWORD *)&a3[1].var0.__engaged_ + 1);
      long long v10 = *(_OWORD *)&a3->creationTime.m_value;
      long long v9 = *(_OWORD *)&a3->data.m_capacity;
      *(_OWORD *)&self[1].super.isa = *(_OWORD *)&a3[1].var0.__null_state_;
      *(_OWORD *)&self[1]._pushPartition = v8;
      *(_OWORD *)&self->_coreNotificationData.creationTime.m_value = v10;
      *(_OWORD *)&self->_coreNotificationData.data.m_capacity = v9;
      WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((unsigned int *)&self[1]._coreNotificationData, (uint64_t)(&a3[1].var0.__engaged_ + 32));
      *((_WORD *)&self[1]._coreNotificationData.var0.__engaged_ + 8) = *((_WORD *)&a3[1].var0.__engaged_ + 24);
    }
  }
  else if (*(&self[1]._coreNotificationData.var0.__engaged_ + 32))
  {
    WebCore::NotificationData::~NotificationData((WebCore::NotificationData *)p_coreNotificationData, (void *)a2);
    *(&self[1]._coreNotificationData.var0.__engaged_ + 32) = 0;
  }
  else
  {
    WebCore::NotificationData::NotificationData((WebCore::NotificationData *)p_coreNotificationData, (const WebCore::NotificationData *)a3);
    *(&self[1]._coreNotificationData.var0.__engaged_ + 32) = 1;
  }
}

- (void).cxx_destruct
{
  if (*(&self[1]._coreNotificationData.var0.__engaged_ + 32)) {
    WebCore::NotificationData::~NotificationData((WebCore::NotificationData *)&self->_coreNotificationData, (void *)a2);
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 32) = 0;
  *((unsigned char *)self + 288) = 0;
  return self;
}

@end