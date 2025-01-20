@interface DDUPIAction
+ (BOOL)actionAvailableForResult:(__DDResult *)a3 url:(id)a4 context:(id)a5;
+ (id)actionsWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
+ (id)matchingSchemes;
- (BOOL)canBePerformedByOpeningURL;
- (DDUPIAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5 appRecord:(id)a6 upiIdentifier:(id)a7;
- (id)icon;
- (id)iconName;
- (id)localizedName;
- (id)notificationIconBundleIdentifier;
- (id)notificationURL;
- (id)subtitle;
- (id)viewController;
- (int)interactionType;
- (void)performFromView:(id)a3;
@end

@implementation DDUPIAction

+ (BOOL)actionAvailableForResult:(__DDResult *)a3 url:(id)a4 context:(id)a5
{
  v5 = +[DDUPIAction actionsWithURL:a4 result:a3 context:a5];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

+ (id)actionsWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v9 = [MEMORY[0x1E4F28B50] mainBundle];
  v10 = [v9 bundleIdentifier];
  int v11 = [v10 isEqualToString:@"com.apple.MobileSMS"];

  if (v11)
  {
    v12 = +[DDAction actionWithURL:v7 result:a4 context:v8];
    v60[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
  }
  else
  {
    v13 = 0;
  }
  if ((dd_isLSTrusted() & 1) == 0)
  {
    id v17 = v13;
    goto LABEL_46;
  }
  v14 = 0;
  if (!v7 && a4)
  {
    if (DDResultHasType())
    {
      v14 = (void *)DDResultCopyUPIIdentifierValue();
      if (v14)
      {
        v15 = (void *)MEMORY[0x1E4F1CB10];
        v16 = [NSString stringWithFormat:@"upi://pay?pa=%@", v14];
        id v7 = [v15 URLWithString:v16];

        goto LABEL_13;
      }
    }
    else
    {
      v14 = 0;
    }
    id v7 = 0;
  }
LABEL_13:
  v18 = [v7 scheme];
  v19 = [v18 lowercaseString];
  int v20 = [v19 isEqualToString:@"upi"];

  if (v20)
  {
    if (actionsWithURL_result_context__onceToken != -1) {
      dispatch_once(&actionsWithURL_result_context__onceToken, &__block_literal_global_11);
    }
    if (actionsWithURL_result_context___isUPIEnabled)
    {
      v48 = v14;
      id v21 = v8;
      v22 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      id v23 = v7;
      v24 = [v22 applicationsAvailableForOpeningURL:v7];

      id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v25 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v45 = [v25 stringForKey:@"DDUIUPILastUsed"];

      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      obuint64_t j = v24;
      uint64_t v26 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v55 != v28) {
              objc_enumerationMutation(obj);
            }
            v30 = [*(id *)(*((void *)&v54 + 1) + 8 * i) bundleIdentifier];
            id v31 = objc_alloc(MEMORY[0x1E4F223C8]);
            uint64_t v53 = 0;
            uint64_t v32 = [v31 initWithBundleIdentifier:v30 allowPlaceholder:1 error:&v53];
            v33 = (void *)v32;
            if (!v53 && v32 && v30 != 0)
            {
              if ([v45 isEqualToString:v30]) {
                [v46 insertObject:v33 atIndex:0];
              }
              else {
                [v46 addObject:v33];
              }
            }
          }
          uint64_t v27 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
        }
        while (v27);
      }

      v35 = v46;
      if ([v46 count])
      {
        v44 = v13;
        id v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v46, "count"));
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v36 = v46;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v49 objects:v58 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v50;
          do
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v50 != v39) {
                objc_enumerationMutation(v36);
              }
              v41 = [[DDUPIAction alloc] initWithURL:v23 result:a4 context:v21 appRecord:*(void *)(*((void *)&v49 + 1) + 8 * j) upiIdentifier:v48];
              [v17 addObject:v41];
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v49 objects:v58 count:16];
          }
          while (v38);
        }

        id v7 = v23;
        id v8 = v21;
        v42 = +[DDAction actionWithURL:v23 result:a4 context:v21];
        [v17 addObject:v42];

        v13 = v44;
        v35 = v46;
      }
      else
      {
        id v17 = v13;
        id v8 = v21;
      }

      v14 = v48;
    }
    else
    {
      id v17 = v13;
    }
  }
  else
  {
    id v17 = 0;
  }

LABEL_46:
  return v17;
}

uint64_t __45__DDUPIAction_actionsWithURL_result_context___block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  actionsWithURL_result_context___isUPIEnabled = result;
  return result;
}

+ (id)matchingSchemes
{
  return &unk_1EF510CE0;
}

- (DDUPIAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5 appRecord:(id)a6 upiIdentifier:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)DDUPIAction;
  v15 = [(DDAction *)&v20 initWithURL:a3 result:a4 context:a5];
  v16 = v15;
  if (v13 && v15)
  {
    objc_storeStrong((id *)&v15->_appRecord, a6);
    uint64_t v17 = [v13 localizedName];
    appName = v16->_appName;
    v16->_appName = (NSString *)v17;

    objc_storeStrong((id *)&v16->_upiIdentifier, a7);
  }

  return v16;
}

- (id)localizedName
{
  if (self->_appName)
  {
    v3 = NSString;
    v4 = DDLocalizedString(@"Pay with %@");
    v5 = objc_msgSend(v3, "localizedStringWithFormat:", v4, self->_appName);
  }
  else
  {
    v5 = DDLocalizedString(@"Pay");
  }
  return v5;
}

- (id)subtitle
{
  return 0;
}

- (id)iconName
{
  return @"applepaycash.circle";
}

- (id)icon
{
  appRecord = self->_appRecord;
  if (!appRecord
    || (v4 = (void *)MEMORY[0x1E4F42A80],
        [(LSApplicationRecord *)appRecord bundleIdentifier],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v4 _applicationIconImageForBundleIdentifier:v5 format:0],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)DDUPIAction;
    BOOL v6 = [(DDAction *)&v8 icon];
  }
  return v6;
}

- (int)interactionType
{
  return 0;
}

- (id)notificationIconBundleIdentifier
{
  return (id)[(LSApplicationRecord *)self->_appRecord bundleIdentifier];
}

- (id)notificationURL
{
  return self->super._url;
}

- (void)performFromView:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  url = self->super._url;
  BOOL v6 = [(LSApplicationRecord *)self->_appRecord bundleIdentifier];
  id v9 = [v4 operationToOpenResource:url usingApplication:v6 uniqueDocumentIdentifier:0 isContentManaged:0 sourceAuditToken:0 userInfo:0 options:0 delegate:0];

  id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_super v8 = [(LSApplicationRecord *)self->_appRecord bundleIdentifier];
  [v7 setObject:v8 forKey:@"DDUIUPILastUsed"];

  [v9 start];
}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

- (id)viewController
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_upiIdentifier, 0);
  objc_storeStrong((id *)&self->_appRecord, 0);
}

@end