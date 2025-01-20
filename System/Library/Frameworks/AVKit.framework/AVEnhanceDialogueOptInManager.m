@interface AVEnhanceDialogueOptInManager
+ (AVEnhanceDialogueOptInManager)sharedInstance;
- (AVEnhanceDialogueOptInManager)init;
- (BOOL)isEnhanceDialogueControllerOptedIn:(id)a3;
- (NSMutableSet)enhanceDialogueControllers;
- (int64_t)enhanceDialoguePreference;
- (void)optInEnhanceDialogueController:(id)a3;
- (void)optOutEnhanceDialogueController:(id)a3;
- (void)setEnhanceDialogueControllers:(id)a3;
- (void)setEnhanceDialoguePreference:(int64_t)a3;
@end

@implementation AVEnhanceDialogueOptInManager

- (BOOL)isEnhanceDialogueControllerOptedIn:(id)a3
{
  id v4 = a3;
  v5 = [(AVEnhanceDialogueOptInManager *)self enhanceDialogueControllers];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSMutableSet)enhanceDialogueControllers
{
  return self->_enhanceDialogueControllers;
}

+ (AVEnhanceDialogueOptInManager)sharedInstance
{
  v2 = (void *)sharedInstance_sharedInstance_14996;
  if (!sharedInstance_sharedInstance_14996)
  {
    v3 = objc_alloc_init(AVEnhanceDialogueOptInManager);
    id v4 = (void *)sharedInstance_sharedInstance_14996;
    sharedInstance_sharedInstance_14996 = (uint64_t)v3;

    v2 = (void *)sharedInstance_sharedInstance_14996;
  }

  return (AVEnhanceDialogueOptInManager *)v2;
}

- (AVEnhanceDialogueOptInManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)AVEnhanceDialogueOptInManager;
  v2 = [(AVEnhanceDialogueOptInManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_enhanceDialoguePreference = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
    enhanceDialogueControllers = v3->_enhanceDialogueControllers;
    v3->_enhanceDialogueControllers = (NSMutableSet *)v4;
  }
  return v3;
}

- (void).cxx_destruct
{
}

- (void)setEnhanceDialogueControllers:(id)a3
{
}

- (int64_t)enhanceDialoguePreference
{
  return self->_enhanceDialoguePreference;
}

- (void)setEnhanceDialoguePreference:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_enhanceDialoguePreference != a3)
  {
    id v10 = 0;
    char v5 = objc_msgSend(MEMORY[0x1E4F15340], "setEnhanceDialoguePreference:error:");
    id v6 = v10;
    if ((v5 & 1) == 0)
    {
      objc_super v7 = _AVLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = [v6 localizedDescription];
        uint64_t v9 = [v8 cStringUsingEncoding:4];
        *(_DWORD *)buf = 136315138;
        uint64_t v12 = v9;
        _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Unable to set Enhance Dialogue preference: %s", buf, 0xCu);
      }
    }
    if (!v6) {
      self->_enhanceDialoguePreference = a3;
    }
  }
}

- (void)optOutEnhanceDialogueController:(id)a3
{
  id v4 = a3;
  char v5 = [(AVEnhanceDialogueOptInManager *)self enhanceDialogueControllers];
  [v5 removeObject:v4];

  id v7 = [(AVEnhanceDialogueOptInManager *)self enhanceDialogueControllers];
  if ([v7 count])
  {
  }
  else
  {
    int64_t v6 = [(AVEnhanceDialogueOptInManager *)self enhanceDialoguePreference];

    if (v6 == 2)
    {
      [(AVEnhanceDialogueOptInManager *)self setEnhanceDialoguePreference:1];
    }
  }
}

- (void)optInEnhanceDialogueController:(id)a3
{
  id v4 = a3;
  char v5 = [(AVEnhanceDialogueOptInManager *)self enhanceDialogueControllers];
  [v5 addObject:v4];

  id v7 = [(AVEnhanceDialogueOptInManager *)self enhanceDialogueControllers];
  if ([v7 count])
  {
    int64_t v6 = [(AVEnhanceDialogueOptInManager *)self enhanceDialoguePreference];

    if (v6 != 2)
    {
      [(AVEnhanceDialogueOptInManager *)self setEnhanceDialoguePreference:2];
    }
  }
  else
  {
  }
}

@end