@interface MRSystemHealthComponentHandler
- (MRSystemHealthComponentHandler)initWithComponentName:(id)a3;
- (OS_dispatch_queue)componentEventQueue;
- (void)postComponentStatus:(unint64_t)a3;
- (void)setComponentEventQueue:(id)a3;
@end

@implementation MRSystemHealthComponentHandler

- (MRSystemHealthComponentHandler)initWithComponentName:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)MRSystemHealthComponentHandler;
  v5 = [(MRBaseComponentHandler *)&v51 init];
  v6 = v5;
  if (v5)
  {
    [(MRBaseComponentHandler *)v5 setComponentName:v4];
    v7 = NSString;
    v8 = [(MRBaseComponentHandler *)v6 componentName];
    v9 = [v7 stringWithFormat:@"SUcaseFor%@", v8];
    [(MRBaseComponentHandler *)v6 setComponentSUCaseKey:v9];

    v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v11 = [(MRBaseComponentHandler *)v6 componentSUCaseKey];
    -[MRBaseComponentHandler setIsSUCaseForComponent:](v6, "setIsSUCaseForComponent:", [v10 BOOLForKey:v11]);

    [(MRBaseComponentHandler *)v6 setDisplayNotification:0];
    [(MRBaseComponentHandler *)v6 setDisplayModalPopup:[(MRBaseComponentHandler *)v6 isSUCaseForComponent] ^ 1];
    v12 = NSURL;
    v13 = NSString;
    v14 = [(MRBaseComponentHandler *)v6 componentName];
    v15 = [v13 stringWithFormat:@"prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE/%@", v14];
    v16 = [v12 URLWithString:v15];
    [(MRBaseComponentHandler *)v6 setLinkedSensitiveURL:v16];

    v17 = NSString;
    v18 = [(MRBaseComponentHandler *)v6 componentName];
    v19 = [v17 stringWithFormat:@"com.apple.mobilerepair.%@Repair", v18];
    [(MRBaseComponentHandler *)v6 setComponentFollowupClientID:v19];

    v20 = [(MRBaseComponentHandler *)v6 componentFollowupClientID];
    v21 = [v20 stringByAppendingString:@"FINISH_REPAIR"];
    [(MRBaseComponentHandler *)v6 setFinishRepairKey:v21];

    v22 = NSString;
    v23 = [(MRBaseComponentHandler *)v6 componentName];
    v24 = [v22 stringWithFormat:@"unlockCheckCountFor%@", v23];
    [(MRBaseComponentHandler *)v6 setComponentUnLockCheckCountKey:v24];

    v25 = NSString;
    v26 = [(MRBaseComponentHandler *)v6 componentName];
    v27 = [v25 stringWithFormat:@"retriggerCheckCountFor%@", v26];
    [(MRBaseComponentHandler *)v6 setComponentRetriggerCountKey:v27];

    v28 = NSString;
    v29 = [(MRBaseComponentHandler *)v6 componentName];
    v30 = [v28 stringWithFormat:@"lastCheckTimeFor%@", v29];
    [(MRBaseComponentHandler *)v6 setComponentLastCheckTimeKey:v30];

    v31 = NSString;
    v32 = [(MRBaseComponentHandler *)v6 componentName];
    v33 = [v31 stringWithFormat:@"hasDisplayedFollowupForSHC%@", v32];
    [(MRBaseComponentHandler *)v6 setComponentHasDisplayedFollowUpKey:v33];

    v34 = NSString;
    v35 = [(MRBaseComponentHandler *)v6 componentName];
    v36 = [v34 stringWithFormat:@"com.apple.mobilerepair.%@unlockchecker", v35];
    [(MRBaseComponentHandler *)v6 setComponentUnlockCheckerActivityName:v36];

    [(MRBaseComponentHandler *)v6 setComponentId:0];
    [(MRBaseComponentHandler *)v6 setNotifyServer:0];
    v37 = NSString;
    v38 = [(MRBaseComponentHandler *)v6 componentName];
    v39 = [v37 stringWithFormat:@"firstUIDisplayedTimeFor%@", v38];
    [(MRBaseComponentHandler *)v6 setComponentFirstUIDisplayedTimeKey:v39];

    v40 = NSString;
    v41 = [(MRBaseComponentHandler *)v6 componentName];
    v42 = [v40 stringWithFormat:@"lastKnownIDFor%@", v41];
    [(MRBaseComponentHandler *)v6 setLastKnownComponentIdentifierKey:v42];

    v43 = (void *)MEMORY[0x263F37E28];
    v44 = [(MRBaseComponentHandler *)v6 componentName];
    v45 = (void *)[v43 copySealingManifestDataInstanceForComponent:v44];
    [(MRBaseComponentHandler *)v6 setLastKnownComponentIdentifierValue:v45];

    [(MRBaseComponentHandler *)v6 setUnlockCheckActivityRequired:0];
    id v46 = [(MRBaseComponentHandler *)v6 componentName];
    dispatch_queue_t v47 = dispatch_queue_create((const char *)[v46 UTF8String], 0);
    [(MRSystemHealthComponentHandler *)v6 setComponentEventQueue:v47];

    v48 = [(MRBaseComponentHandler *)v6 componentName];
    v49 = [v48 stringByAppendingString:@"Failed"];
    [(MRBaseComponentHandler *)v6 setComponentStatusKey:v49];
  }
  return v6;
}

- (void)postComponentStatus:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v5 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
  v6 = sub_239773918(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(MRBaseComponentHandler *)self componentName];
    v8 = [MEMORY[0x263F08D68] currentConnection];
    *(_DWORD *)buf = 138412802;
    v19 = v7;
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    __int16 v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_239757000, v6, OS_LOG_TYPE_DEFAULT, "postComponentStatus name:%@ status:%llu connection:%@", buf, 0x20u);
  }
  v9 = [(MRBaseComponentHandler *)self componentAuthHandler];
  uint64_t v10 = [v9 copyComponentStatus];

  v11 = sub_239773918(0);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10 != -3)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239757000, v11, OS_LOG_TYPE_DEFAULT, "Processing componentStatus", buf, 2u);
    }

    if (a3 == 1)
    {
      v13 = [(MRBaseComponentHandler *)self componentStatusKey];
      v14 = v5;
      uint64_t v15 = 0;
    }
    else
    {
      if (a3 != 2)
      {
LABEL_14:
        [v5 synchronize];
        v16 = [(MRSystemHealthComponentHandler *)self componentEventQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = sub_239771A90;
        block[3] = &unk_264DA0348;
        block[4] = self;
        dispatch_async(v16, block);

        goto LABEL_15;
      }
      v13 = [(MRBaseComponentHandler *)self componentStatusKey];
      v14 = v5;
      uint64_t v15 = 1;
    }
    [v14 setBool:v15 forKey:v13];

    goto LABEL_14;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_239757000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring componentStatus for pending repair case", buf, 2u);
  }

LABEL_15:
}

- (OS_dispatch_queue)componentEventQueue
{
  return self->_componentEventQueue;
}

- (void)setComponentEventQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end