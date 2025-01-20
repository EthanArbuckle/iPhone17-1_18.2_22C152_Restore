@interface CSPostBuildInstallService
+ (id)sharedService;
- (void)_performPostBuildInstallWithCompletion:(id)a3;
- (void)registerPostBuildInstallService;
@end

@implementation CSPostBuildInstallService

- (void)_performPostBuildInstallWithCompletion:(id)a3
{
  id v3 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_1000324D0;
  v9[4] = sub_1000324E0;
  id v10 = 0;
  v4 = +[SSRVoiceProfileManager sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000324E8;
  v6[3] = &unk_10024EBC0;
  v8 = v9;
  id v5 = v3;
  id v7 = v5;
  [v4 triggerVoiceProfileCleanupWithCompletion:v6];

  _Block_object_dispose(v9, 8);
}

- (void)registerPostBuildInstallService
{
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[CSPostBuildInstallService registerPostBuildInstallService]";
    __int16 v8 = 2080;
    v9 = "com.apple.cs.postinstall";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Registering for post build install/first unlock activity - %s", buf, 0x16u);
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100032748;
  handler[3] = &unk_1002528C0;
  handler[4] = self;
  xpc_activity_register("com.apple.cs.postinstall", v4, handler);
}

+ (id)sharedService
{
  if (+[CSUtils isDarwinOS])
  {
    id v2 = 0;
  }
  else
  {
    if (qword_1002A3678 != -1) {
      dispatch_once(&qword_1002A3678, &stru_10024EB98);
    }
    id v2 = (id)qword_1002A3670;
  }
  return v2;
}

@end