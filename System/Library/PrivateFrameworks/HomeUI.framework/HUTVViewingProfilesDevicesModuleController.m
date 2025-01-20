@interface HUTVViewingProfilesDevicesModuleController
- (Class)cellClassForItem:(id)a3;
- (HUTVViewingProfilesDevicesModuleController)initWithModule:(id)a3;
- (HUTVViewingProfilesDevicesModuleController)initWithModule:(id)a3 host:(id)a4;
- (void)_toggleShowTVViewingProfileForItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
@end

@implementation HUTVViewingProfilesDevicesModuleController

- (HUTVViewingProfilesDevicesModuleController)initWithModule:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithModule_host_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUTVViewingProfilesDevicesModuleController.m", 25, @"%s is unavailable; use %@ instead",
    "-[HUTVViewingProfilesDevicesModuleController initWithModule:]",
    v6);

  return 0;
}

- (HUTVViewingProfilesDevicesModuleController)initWithModule:(id)a3 host:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    v11 = v9;
    if (v10) {
      goto LABEL_8;
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
  }
  v11 = 0;
LABEL_8:

  v17.receiver = self;
  v17.super_class = (Class)HUTVViewingProfilesDevicesModuleController;
  v14 = [(HUItemModuleController *)&v17 initWithModule:v9];
  v15 = v14;
  if (v14) {
    [(HUItemModuleController *)v14 setHost:v7];
  }

  return v15;
}

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(HUItemModuleController *)self module];
  int v8 = [v7 isTVViewingProfileDevice:v6];

  if (v8)
  {
    objc_opt_class();
    id v9 = v12;
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    [v11 setDelegate:self];
  }
}

- (void)_toggleShowTVViewingProfileForItem:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  int v8 = [v7 sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = [v10 accessories];
  if (v11)
  {
    id v12 = [(HUItemModuleController *)self module];
    v13 = [v12 viewingProfilesDevices];
    v14 = (void *)[v13 mutableCopy];
    v15 = v14;
    if (v14) {
      id v16 = v14;
    }
    else {
      id v16 = (id)objc_opt_new();
    }
    objc_super v17 = v16;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = v11;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          int v23 = objc_msgSend(v17, "containsObject:", *(void *)(*((void *)&v27 + 1) + 8 * i), (void)v27);
        }
        int v24 = v23;
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v20);

      if (v24)
      {
        v25 = [v18 allObjects];
        [v17 removeObjectsInArray:v25];
LABEL_22:

        v26 = [(HUItemModuleController *)self module];
        [v26 setViewingProfilesDevices:v17];

        goto LABEL_23;
      }
    }
    else
    {
    }
    v25 = objc_msgSend(v18, "allObjects", (void)v27);
    [v17 addObjectsFromArray:v25];
    goto LABEL_22;
  }
LABEL_23:
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = [a3 item];
  id v7 = [(HUItemModuleController *)self module];
  int v8 = [v7 isTVViewingProfileDevice:v6];

  if (v8)
  {
    id v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        id v10 = @"On";
      }
      else {
        id v10 = @"Off";
      }
      id v11 = [v6 latestResults];
      int v12 = 138412546;
      v13 = v10;
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Turning \"Use My TV Viewing Profile\" %@ for %@", (uint8_t *)&v12, 0x16u);
    }
    [(HUTVViewingProfilesDevicesModuleController *)self _toggleShowTVViewingProfileForItem:v6];
  }
}

@end