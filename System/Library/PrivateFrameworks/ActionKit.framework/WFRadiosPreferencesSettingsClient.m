@interface WFRadiosPreferencesSettingsClient
+ (void)createClientWithCompletionHandler:(id)a3;
- (RadiosPreferences)radiosPreferences;
- (WFRadiosPreferencesSettingsClient)initWithRadiosPreferences:(id)a3;
@end

@implementation WFRadiosPreferencesSettingsClient

- (void).cxx_destruct
{
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (WFRadiosPreferencesSettingsClient)initWithRadiosPreferences:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFRadiosPreferencesSettingsClient.m", 39, @"Invalid parameter not satisfying: %@", @"radiosPreferences" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFRadiosPreferencesSettingsClient;
  v7 = [(WFRadiosPreferencesSettingsClient *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_radiosPreferences, a3);
    v9 = v8;
  }

  return v8;
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *, void))a3;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v5 = (void *)getRadiosPreferencesClass_softClass;
  uint64_t v14 = getRadiosPreferencesClass_softClass;
  if (!getRadiosPreferencesClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getRadiosPreferencesClass_block_invoke;
    v16 = &unk_264E5EC88;
    v17 = &v11;
    __getRadiosPreferencesClass_block_invoke((uint64_t)buf);
    v5 = (void *)v12[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v11, 8);
  id v7 = objc_alloc_init(v6);
  v8 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "+[WFRadiosPreferencesSettingsClient createClientWithCompletionHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_DEBUG, "%s Got RadiosPreferences: %@", buf, 0x16u);
  }

  if (v7)
  {
    id v9 = objc_alloc((Class)a1);
    v10 = objc_msgSend(v9, "initWithRadiosPreferences:", v7, v11);
    v4[2](v4, v10, 0);
  }
  else
  {
    v10 = WFSettingsClientError();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v10);
  }
}

@end