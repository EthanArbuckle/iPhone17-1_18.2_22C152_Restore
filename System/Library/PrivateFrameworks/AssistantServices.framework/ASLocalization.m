@interface ASLocalization
+ (id)sharedLocalization;
- (ASLocalization)init;
- (id)_languageCode;
- (id)localizedStringForKey:(id)a3 table:(id)a4 bundle:(id)a5;
- (void)_clearTableCache;
- (void)_languageCodeChanged;
- (void)dealloc;
@end

@implementation ASLocalization

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringTables, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)localizedStringForKey:(id)a3 table:(id)a4 bundle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = sub_1000050B4;
    v24 = sub_1000050C4;
    id v25 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000050CC;
    block[3] = &unk_100014448;
    id v15 = v9;
    v16 = self;
    id v17 = v10;
    v19 = &v20;
    id v18 = v8;
    dispatch_sync(queue, block);
    id v12 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)_clearTableCache
{
  languageCode = self->_languageCode;
  self->_languageCode = 0;

  stringTables = self->_stringTables;
  self->_stringTables = 0;
}

- (void)_languageCodeChanged
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000053DC;
  block[3] = &unk_1000146E8;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (id)_languageCode
{
  languageCode = self->_languageCode;
  if (!languageCode)
  {
    v4 = +[AFPreferences sharedPreferences];
    v5 = [v4 languageCode];
    v6 = (NSString *)[v5 copy];
    v7 = self->_languageCode;
    self->_languageCode = v6;

    id v8 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
    {
      id v9 = self->_languageCode;
      int v11 = 136315394;
      id v12 = "-[ASLocalization _languageCode]";
      __int16 v13 = 2112;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Using new language code %@", (uint8_t *)&v11, 0x16u);
    }
    languageCode = self->_languageCode;
  }
  return languageCode;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)ASLocalization;
  [(ASLocalization *)&v4 dealloc];
}

- (ASLocalization)init
{
  v7.receiver = self;
  v7.super_class = (Class)ASLocalization;
  v2 = [(ASLocalization *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create(0, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000055E0, AFLanguageCodeDidChangeDarwinNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

+ (id)sharedLocalization
{
  if (qword_10001AA50 != -1) {
    dispatch_once(&qword_10001AA50, &stru_100014420);
  }
  v2 = (void *)qword_10001AA48;
  return v2;
}

@end