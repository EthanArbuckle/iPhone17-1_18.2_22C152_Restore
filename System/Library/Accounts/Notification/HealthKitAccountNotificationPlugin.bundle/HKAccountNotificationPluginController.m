@interface HKAccountNotificationPluginController
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation HKAccountNotificationPluginController

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  v11 = v10;
  if (a4 != 4)
  {
    if (v9) {
      v12 = v9;
    }
    else {
      v12 = v10;
    }
    id v13 = v12;
    v14 = [v13 accountType];
    v15 = [v14 identifier];

    if (![v15 isEqualToString:*MEMORY[0x263EFAE58]]) {
      goto LABEL_36;
    }
    uint64_t v16 = *MEMORY[0x263F25618];
    int v17 = objc_msgSend(v13, "aa_isAccountClass:", *MEMORY[0x263F25618]);
    int v18 = objc_msgSend(v11, "aa_isAccountClass:", v16);
    if (!v17) {
      goto LABEL_36;
    }
    int v19 = v18;
    _HKInitializeLogging();
    v20 = (os_log_t *)MEMORY[0x263F09960];
    v21 = *MEMORY[0x263F09960];
    v22 = *MEMORY[0x263F09960];
    if (v19)
    {
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138543362;
      v62 = self;
      v23 = "%{public}@: Standard primary account save.";
      v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_INFO;
    }
    else
    {
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138543362;
      v62 = self;
      v23 = "%{public}@: Primary account added or promoted.";
      v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl(&dword_2405A9000, v24, v25, v23, buf, 0xCu);
LABEL_13:
    uint64_t v26 = *MEMORY[0x263EFAC90];
    int v27 = [v13 isEnabledForDataclass:*MEMORY[0x263EFAC90]];
    int v28 = [v11 isEnabledForDataclass:v26];
    _HKInitializeLogging();
    v29 = *v20;
    if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
    {
      v30 = @"NO";
      if (v27) {
        v31 = @"YES";
      }
      else {
        v31 = @"NO";
      }
      *(_DWORD *)buf = 138543874;
      v62 = self;
      v64 = v31;
      __int16 v63 = 2112;
      if (v28) {
        v30 = @"YES";
      }
      __int16 v65 = 2112;
      v66 = v30;
      _os_log_impl(&dword_2405A9000, v29, OS_LOG_TYPE_INFO, "%{public}@: IS Health enabled: %@. WAS health enabled: %@.", buf, 0x20u);
    }
    if (!v27 || (v28 & v19 & 1) != 0) {
      goto LABEL_36;
    }
    _HKInitializeLogging();
    v32 = *v20;
    if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v62 = self;
      _os_log_impl(&dword_2405A9000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Handle account changes after dataclass enabled", buf, 0xCu);
    }
    id v33 = objc_alloc_init(MEMORY[0x263F0A410]);
    v34 = (void *)[objc_alloc(MEMORY[0x263F0A1B0]) initWithHealthStore:v33];
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = sub_2405AAFC0;
    v60[3] = &unk_2650C4140;
    v60[4] = self;
    [v34 accountConfigurationDidChangeWithCompletion:v60];
    v35 = [MEMORY[0x263F0A980] sharedBehavior];
    if (![v35 isiPad]) {
      goto LABEL_34;
    }
    [MEMORY[0x263F0A980] sharedBehavior];
    v36 = v54 = v34;
    v37 = [v36 features];
    int v38 = [v37 stanley];

    v34 = v54;
    if (!v38)
    {
LABEL_35:

LABEL_36:
      goto LABEL_37;
    }
    id v39 = objc_alloc(MEMORY[0x263F0A470]);
    v35 = (void *)[v39 initWithCategory:3 domainName:*MEMORY[0x263F0AD28] healthStore:v33];
    v40 = (__CFString *)(id)*MEMORY[0x263F0AD20];
    v41 = [MEMORY[0x263EFF910] date];
    id v59 = 0;
    char v42 = [v35 setDate:v41 forKey:v40 error:&v59];
    v53 = (__CFString *)v59;

    if ((v42 & 1) == 0)
    {
      _HKInitializeLogging();
      v43 = *MEMORY[0x263F09960];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09960], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v62 = self;
        __int16 v63 = 2114;
        v64 = v40;
        __int16 v65 = 2114;
        v66 = v53;
        _os_log_error_impl(&dword_2405A9000, v43, OS_LOG_TYPE_ERROR, "%{public}@: Unable to persist %{public}@: %{public}@", buf, 0x20u);
      }
    }
    v52 = v40;
    id v44 = (id)*MEMORY[0x263F0AD38];
    id v58 = 0;
    v45 = [v35 dateForKey:v44 error:&v58];
    id v46 = v58;
    v51 = v44;
    if (v46)
    {
      _HKInitializeLogging();
      v47 = *MEMORY[0x263F098E0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E0], OS_LOG_TYPE_ERROR)) {
        sub_2405AB220((uint64_t)self, (uint64_t)v46, v47);
      }
    }
    else
    {
      if (!v45)
      {
        v49 = (void *)[objc_alloc(MEMORY[0x263F0A580]) initWithClientIdentifier:@"NewDeviceSetup" healthStore:v33];
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = sub_2405AB0B0;
        v55[3] = &unk_2650C4168;
        v55[4] = self;
        id v56 = v35;
        id v57 = v51;
        v48 = v35;
        [v49 sendNewDeviceNotificationWithMessageKind:0 completion:v55];

        v35 = v52;
        goto LABEL_33;
      }
      _HKInitializeLogging();
      v50 = *MEMORY[0x263F098E0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098E0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = self;
        _os_log_impl(&dword_2405A9000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: User previously notified of this device. Not doing anything", buf, 0xCu);
      }
    }

    v49 = v51;
    v48 = v52;
LABEL_33:

    v34 = v54;
LABEL_34:

    goto LABEL_35;
  }
LABEL_37:
}

@end