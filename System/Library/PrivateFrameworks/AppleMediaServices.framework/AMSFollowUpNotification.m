@interface AMSFollowUpNotification
+ (id)defaultOptions;
+ (id)optionForString:(id)a3;
- (AMSFollowUpAction)activateAction;
- (AMSFollowUpNotification)init;
- (AMSFollowUpNotification)initWithJSONDictionary:(id)a3 parentIdentifier:(id)a4 logKey:(id)a5;
- (NSSet)options;
- (NSString)informativeText;
- (NSString)title;
- (id)generateNotification;
- (void)setActivateAction:(id)a3;
- (void)setInformativeText:(id)a3;
- (void)setOptions:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AMSFollowUpNotification

- (AMSFollowUpNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSFollowUpNotification;
  v2 = [(AMSFollowUpNotification *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[AMSFollowUpNotification defaultOptions];
    options = v2->_options;
    v2->_options = (NSSet *)v3;
  }
  return v2;
}

- (AMSFollowUpNotification)initWithJSONDictionary:(id)a3 parentIdentifier:(id)a4 logKey:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(AMSFollowUpNotification *)self init];
  if (v11)
  {
    v12 = [v8 objectForKeyedSubscript:@"options"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    v14 = [v8 objectForKeyedSubscript:@"activateAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    v16 = [[AMSFollowUpAction alloc] initWithJSONDictionary:v15 parentIdentifier:v9];
    [(AMSFollowUpAction *)v16 setLogKey:v10];
    v17 = [MEMORY[0x1E4F1CA80] set];
    if (v13)
    {
      id v28 = v15;
      id v29 = v13;
      id v30 = v10;
      id v31 = v9;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v18 = v13;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v33;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = +[AMSFollowUpNotification optionForString:](AMSFollowUpNotification, "optionForString:", *(void *)(*((void *)&v32 + 1) + 8 * v22), v28, v29, v30, v31, (void)v32);
            if (v23) {
              [v17 addObject:v23];
            }

            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v20);
      }

      id v10 = v30;
      id v9 = v31;
      id v15 = v28;
      id v13 = v29;
      if ([v17 count])
      {
        uint64_t v24 = [MEMORY[0x1E4F1CAD0] setWithSet:v17];
        options = v11->_options;
        v11->_options = (NSSet *)v24;
      }
    }
    activateAction = v11->_activateAction;
    v11->_activateAction = v16;
  }
  return v11;
}

- (id)generateNotification
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2050000000;
  uint64_t v3 = (void *)getFLFollowUpNotificationClass_softClass;
  uint64_t v17 = getFLFollowUpNotificationClass_softClass;
  if (!getFLFollowUpNotificationClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getFLFollowUpNotificationClass_block_invoke;
    v13[3] = &unk_1E559EC70;
    v13[4] = &v14;
    __getFLFollowUpNotificationClass_block_invoke((uint64_t)v13);
    uint64_t v3 = (void *)v15[3];
  }
  v4 = v3;
  _Block_object_dispose(&v14, 8);
  id v5 = objc_alloc_init(v4);
  objc_super v6 = [(AMSFollowUpNotification *)self title];
  [v5 setTitle:v6];

  v7 = [(AMSFollowUpNotification *)self informativeText];
  [v5 setInformativeText:v7];

  id v8 = [(AMSFollowUpNotification *)self options];
  [v5 setOptions:v8];

  [v5 setFirstNotificationDelay:0.0];
  id v9 = [(AMSFollowUpNotification *)self activateAction];

  if (v9)
  {
    id v10 = [(AMSFollowUpNotification *)self activateAction];
    v11 = [v10 generateAction];

    [v5 setActivateAction:v11];
  }
  return v5;
}

+ (id)defaultOptions
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = getFLNotificationOptionLockscreen();
  v4 = getFLNotificationOptionNotificationCenter();
  id v5 = getFLNotificationOptionBannerAlert();
  objc_super v6 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, 0);

  return v6;
}

+ (id)optionForString:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v17[0] = @"bannerAlert";
  v4 = getFLNotificationOptionBannerAlert();
  v18[0] = v4;
  v17[1] = @"lockScreen";
  id v5 = getFLNotificationOptionLockscreen();
  v18[1] = v5;
  v17[2] = @"keepOnLockscreen";
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  objc_super v6 = (id *)getFLNotificationOptionKeepOnLockscreenSymbolLoc_ptr;
  uint64_t v16 = getFLNotificationOptionKeepOnLockscreenSymbolLoc_ptr;
  if (!getFLNotificationOptionKeepOnLockscreenSymbolLoc_ptr)
  {
    v7 = (void *)CoreFollowUpLibrary_0();
    v14[3] = (uint64_t)dlsym(v7, "FLNotificationOptionKeepOnLockscreen");
    getFLNotificationOptionKeepOnLockscreenSymbolLoc_ptr = v14[3];
    objc_super v6 = (id *)v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v6)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  id v19 = *v6;
  v17[3] = @"notificationCenter";
  id v8 = v19;
  id v9 = getFLNotificationOptionNotificationCenter();
  uint64_t v20 = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  v11 = [v10 objectForKeyedSubscript:v3];

  return v11;
}

- (NSString)informativeText
{
  return self->_informativeText;
}

- (void)setInformativeText:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (AMSFollowUpAction)activateAction
{
  return self->_activateAction;
}

- (void)setActivateAction:(id)a3
{
}

- (NSSet)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_activateAction, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);
}

@end