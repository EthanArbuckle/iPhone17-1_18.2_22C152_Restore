@interface ManagedNetworkSettings
+ (id)sharedMNS;
- (ManagedNetworkSettings)init;
- (OS_dispatch_queue)queue;
- (void)handleEvent:(id)a3;
- (void)reloadMNS;
- (void)reloadNetworkdSettings;
- (void)setQueue:(id)a3;
@end

@implementation ManagedNetworkSettings

- (void).cxx_destruct
{
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)reloadMNS
{
  *(void *)((char *)&v112[15] + 2) = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/Library/Preferences/com.apple.networkd.sysctl.plist"];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/Library/Managed Preferences/mobile/com.apple.networkd.sysctl.plist"];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v95 objects:&v109 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v96 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v95 + 1) + 8 * i);
        v10 = [v4 objectForKeyedSubscript:v9];
        [v2 setObject:v10 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v95 objects:&v109 count:16];
    }
    while (v6);
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v11 = v3;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v91 objects:type count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v92;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v92 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v91 + 1) + 8 * j);
        uint64_t v18 = [v2 objectForKeyedSubscript:v17];
        if (v18)
        {
          v19 = (void *)v18;
          v20 = [v4 objectForKeyedSubscript:v17];
          v21 = [v11 objectForKeyedSubscript:v17];

          if (v20 != v21)
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v22 = (id)gLogObj;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = [v4 objectForKeyedSubscript:v17];
              v24 = [v11 objectForKeyedSubscript:v17];
              int buf = 136446978;
              v101 = "copyNetworkdCombinedSysctlSettingsDict";
              __int16 v102 = 2114;
              uint64_t v103 = v17;
              __int16 v104 = 2114;
              v105 = v23;
              __int16 v106 = 2114;
              v107 = v24;
              _os_log_impl(&dword_1830D4000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s MNS sysctl %{public}@ : ignoring managed value %{public}@ since it is in settings with value %{public}@", (uint8_t *)&buf, 0x2Au);
            }
          }
        }
        v16 = [v11 objectForKeyedSubscript:v17];
        [v2 setObject:v16 forKeyedSubscript:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v91 objects:type count:16];
    }
    while (v13);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  obuint64_t j = v2;
  uint64_t v25 = [obj countByEnumeratingWithState:&v87 objects:v99 count:16];
  v26 = (id *)&unk_1EB267000;
  if (v25)
  {
    uint64_t v27 = v25;
    uint64_t v28 = *(void *)v88;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v88 != v28) {
          objc_enumerationMutation(obj);
        }
        v31 = *(void **)(*((void *)&v87 + 1) + 8 * k);
        if (!v31)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          id v36 = v26[237];
          int v109 = 136446210;
          v110 = "isSysctlAllowlisted";
          v37 = (char *)_os_log_send_and_compose_impl();

          LOBYTE(type[0]) = 16;
          LOBYTE(v95) = 0;
          if (__nwlog_fault(v37, type, &v95))
          {
            if (LOBYTE(type[0]) == 17)
            {
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v38 = v26[237];
              os_log_type_t v39 = type[0];
              if (os_log_type_enabled(v38, type[0]))
              {
                int v109 = 136446210;
                v110 = "isSysctlAllowlisted";
                v40 = v38;
                os_log_type_t v41 = v39;
                v42 = "%{public}s called with null name";
                goto LABEL_51;
              }
              goto LABEL_52;
            }
            if ((_BYTE)v95)
            {
              v47 = v26;
              backtrace_string = (char *)__nw_create_backtrace_string();
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v38 = v47[237];
              os_log_type_t v49 = type[0];
              BOOL v50 = os_log_type_enabled(v38, type[0]);
              if (!backtrace_string)
              {
                if (v50)
                {
                  int v109 = 136446210;
                  v110 = "isSysctlAllowlisted";
                  _os_log_impl(&dword_1830D4000, v38, v49, "%{public}s called with null name, no backtrace", (uint8_t *)&v109, 0xCu);
                }
                goto LABEL_52;
              }
              if (v50)
              {
                int v109 = 136446466;
                v110 = "isSysctlAllowlisted";
                __int16 v111 = 2082;
                v112[0] = backtrace_string;
                _os_log_impl(&dword_1830D4000, v38, v49, "%{public}s called with null name, dumping backtrace:%{public}s", (uint8_t *)&v109, 0x16u);
              }

              free(backtrace_string);
            }
            else
            {
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v38 = v26[237];
              os_log_type_t v51 = type[0];
              if (os_log_type_enabled(v38, type[0]))
              {
                int v109 = 136446210;
                v110 = "isSysctlAllowlisted";
                v40 = v38;
                os_log_type_t v41 = v51;
                v42 = "%{public}s called with null name, backtrace limit exceeded";
LABEL_51:
                _os_log_impl(&dword_1830D4000, v40, v41, v42, (uint8_t *)&v109, 0xCu);
              }
LABEL_52:
            }
            v26 = (id *)&unk_1EB267000;
          }
          if (v37) {
            free(v37);
          }
          goto LABEL_56;
        }
        if ([*(id *)(*((void *)&v87 + 1) + 8 * k) hasPrefix:@"net."])
        {
          v32 = [obj objectForKeyedSubscript:v31];
          LODWORD(v95) = 0;
          v33 = v32;
          if (!v33 || (objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
          {

            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v43 = v26[237];
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              int v109 = 136446722;
              v110 = "-[ManagedNetworkSettings reloadMNS]";
              __int16 v111 = 2114;
              v112[0] = v33;
              LOWORD(v112[1]) = 2114;
              *(void *)((char *)&v112[1] + 2) = v31;
              v44 = v43;
              os_log_type_t v45 = OS_LOG_TYPE_ERROR;
              v46 = "%{public}s MNS observed invalid value %{public}@ for key %{public}@";
              uint32_t v30 = 32;
LABEL_25:
              _os_log_impl(&dword_1830D4000, v44, v45, v46, (uint8_t *)&v109, v30);
            }
LABEL_26:

            goto LABEL_27;
          }
          uint64_t v34 = [v33 longLongValue];
          unsigned int v35 = 0x7FFFFFFF;
          if (v34 <= 0x7FFFFFFF)
          {
            if (v34 >= (uint64_t)0xFFFFFFFF80000000) {
              unsigned int v35 = [v33 intValue];
            }
            else {
              unsigned int v35 = 0x80000000;
            }
          }
          LODWORD(v95) = v35;

          v52 = (const char *)[v31 UTF8String];
          LODWORD(v91) = 0;
          type[0] = 4;
          if (!sysctlbyname(v52, &v91, type, 0, 0) && type[0] == 4)
          {
            if (v95 == v91) {
              goto LABEL_27;
            }
LABEL_82:
            if (!sysctlbyname(v52, 0, 0, &v95, 4uLL))
            {
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v43 = v26[237];
              if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_26;
              }
              int v109 = 136446978;
              v110 = "-[ManagedNetworkSettings reloadMNS]";
              __int16 v111 = 2114;
              v112[0] = v31;
              LOWORD(v112[1]) = 1024;
              *(_DWORD *)((char *)&v112[1] + 2) = v91;
              HIWORD(v112[1]) = 1024;
              LODWORD(v112[2]) = v95;
              v44 = v43;
              os_log_type_t v45 = OS_LOG_TYPE_DEFAULT;
              v46 = "%{public}s MNS successfully set sysctl %{public}@ from %d to %d";
              goto LABEL_24;
            }
            int v66 = **(_DWORD **)(StatusReg + 8);
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v67 = v26[237];
            v43 = v67;
            if (v66 == 45)
            {
              if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
                goto LABEL_26;
              }
              int v109 = 136446978;
              v110 = "-[ManagedNetworkSettings reloadMNS]";
              __int16 v111 = 1024;
              LODWORD(v112[0]) = v95;
              WORD2(v112[0]) = 2114;
              *(void *)((char *)v112 + 6) = v31;
              HIWORD(v112[1]) = 1024;
              LODWORD(v112[2]) = 45;
              v44 = v43;
              os_log_type_t v45 = OS_LOG_TYPE_ERROR;
              v46 = "%{public}s MNS error writing %d to sysctl %{public}@ %{darwin.errno}d";
LABEL_24:
              uint32_t v30 = 34;
              goto LABEL_25;
            }
            int v109 = 136446978;
            v110 = "-[ManagedNetworkSettings reloadMNS]";
            __int16 v111 = 1024;
            LODWORD(v112[0]) = v95;
            WORD2(v112[0]) = 2114;
            *(void *)((char *)v112 + 6) = v31;
            HIWORD(v112[1]) = 1024;
            int v84 = v66;
            LODWORD(v112[2]) = v66;
            v68 = (const char *)_os_log_send_and_compose_impl();

            LOBYTE(buf) = 16;
            char v86 = 0;
            v82 = (char *)v68;
            if (__nwlog_fault(v68, &buf, &v86))
            {
              if (buf != 17)
              {
                if (v86)
                {
                  v74 = v26;
                  v75 = (char *)__nw_create_backtrace_string();
                  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                  networkd_settings_init();
                  v69 = v74[237];
                  os_log_type_t v76 = buf;
                  BOOL v77 = os_log_type_enabled(v69, (os_log_type_t)buf);
                  if (v75)
                  {
                    if (v77)
                    {
                      int v109 = 136447234;
                      v110 = "-[ManagedNetworkSettings reloadMNS]";
                      __int16 v111 = 1024;
                      LODWORD(v112[0]) = v95;
                      WORD2(v112[0]) = 2114;
                      *(void *)((char *)v112 + 6) = v31;
                      HIWORD(v112[1]) = 1024;
                      LODWORD(v112[2]) = v84;
                      WORD2(v112[2]) = 2082;
                      *(void *)((char *)&v112[2] + 6) = v75;
                      _os_log_impl(&dword_1830D4000, v69, v76, "%{public}s MNS error writing %d to sysctl %{public}@ %{darwin.errno}d, dumping backtrace:%{public}s", (uint8_t *)&v109, 0x2Cu);
                    }

                    free(v75);
                    goto LABEL_106;
                  }
                  if (!v77) {
                    goto LABEL_105;
                  }
                  int v109 = 136446978;
                  v110 = "-[ManagedNetworkSettings reloadMNS]";
                  __int16 v111 = 1024;
                  LODWORD(v112[0]) = v95;
                  WORD2(v112[0]) = 2114;
                  *(void *)((char *)v112 + 6) = v31;
                  HIWORD(v112[1]) = 1024;
                  LODWORD(v112[2]) = v84;
                  v71 = v69;
                  os_log_type_t v72 = v76;
                  v73 = "%{public}s MNS error writing %d to sysctl %{public}@ %{darwin.errno}d, no backtrace";
                }
                else
                {
                  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                  networkd_settings_init();
                  v69 = v26[237];
                  os_log_type_t v78 = buf;
                  if (!os_log_type_enabled(v69, (os_log_type_t)buf)) {
                    goto LABEL_105;
                  }
                  int v109 = 136446978;
                  v110 = "-[ManagedNetworkSettings reloadMNS]";
                  __int16 v111 = 1024;
                  LODWORD(v112[0]) = v95;
                  WORD2(v112[0]) = 2114;
                  *(void *)((char *)v112 + 6) = v31;
                  HIWORD(v112[1]) = 1024;
                  LODWORD(v112[2]) = v84;
                  v71 = v69;
                  os_log_type_t v72 = v78;
                  v73 = "%{public}s MNS error writing %d to sysctl %{public}@ %{darwin.errno}d, backtrace limit exceeded";
                }
LABEL_104:
                _os_log_impl(&dword_1830D4000, v71, v72, v73, (uint8_t *)&v109, 0x22u);
                goto LABEL_105;
              }
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v69 = v26[237];
              os_log_type_t v70 = buf;
              if (os_log_type_enabled(v69, (os_log_type_t)buf))
              {
                int v109 = 136446978;
                v110 = "-[ManagedNetworkSettings reloadMNS]";
                __int16 v111 = 1024;
                LODWORD(v112[0]) = v95;
                WORD2(v112[0]) = 2114;
                *(void *)((char *)v112 + 6) = v31;
                HIWORD(v112[1]) = 1024;
                LODWORD(v112[2]) = v84;
                v71 = v69;
                os_log_type_t v72 = v70;
                v73 = "%{public}s MNS error writing %d to sysctl %{public}@ %{darwin.errno}d";
                goto LABEL_104;
              }
LABEL_105:

LABEL_106:
              v26 = (id *)&unk_1EB267000;
            }
            if (v82) {
              free(v82);
            }
            goto LABEL_27;
          }
          v81 = v52;
          int v53 = **(_DWORD **)(StatusReg + 8);
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          id v54 = v26[237];
          int v109 = 136446722;
          v110 = "-[ManagedNetworkSettings reloadMNS]";
          __int16 v111 = 2114;
          v112[0] = v31;
          LOWORD(v112[1]) = 1024;
          int v79 = v53;
          *(_DWORD *)((char *)&v112[1] + 2) = v53;
          v55 = (const char *)_os_log_send_and_compose_impl();

          LOBYTE(buf) = 16;
          char v86 = 0;
          v83 = (char *)v55;
          if (__nwlog_fault(v55, &buf, &v86))
          {
            if (buf == 17)
            {
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v56 = (id)gLogObj;
              os_log_type_t v57 = buf;
              if (os_log_type_enabled(v56, (os_log_type_t)buf))
              {
                int v109 = 136446722;
                v110 = "-[ManagedNetworkSettings reloadMNS]";
                __int16 v111 = 2114;
                v112[0] = v31;
                LOWORD(v112[1]) = 1024;
                *(_DWORD *)((char *)&v112[1] + 2) = v79;
                v58 = v56;
                os_log_type_t v59 = v57;
                v60 = "%{public}s MNS error reading sysctl %{public}@ %{darwin.errno}d";
                goto LABEL_77;
              }
              goto LABEL_78;
            }
            if (v86)
            {
              v61 = (char *)__nw_create_backtrace_string();
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v62 = (id)gLogObj;
              os_log_type_t v63 = buf;
              BOOL v64 = os_log_type_enabled(v62, (os_log_type_t)buf);
              if (v61)
              {
                if (v64)
                {
                  int v109 = 136446978;
                  v110 = "-[ManagedNetworkSettings reloadMNS]";
                  __int16 v111 = 2114;
                  v112[0] = v31;
                  LOWORD(v112[1]) = 1024;
                  *(_DWORD *)((char *)&v112[1] + 2) = v79;
                  HIWORD(v112[1]) = 2082;
                  v112[2] = v61;
                  _os_log_impl(&dword_1830D4000, v62, v63, "%{public}s MNS error reading sysctl %{public}@ %{darwin.errno}d, dumping backtrace:%{public}s", (uint8_t *)&v109, 0x26u);
                }

                free(v61);
              }
              else
              {
                if (v64)
                {
                  int v109 = 136446722;
                  v110 = "-[ManagedNetworkSettings reloadMNS]";
                  __int16 v111 = 2114;
                  v112[0] = v31;
                  LOWORD(v112[1]) = 1024;
                  *(_DWORD *)((char *)&v112[1] + 2) = v79;
                  _os_log_impl(&dword_1830D4000, v62, v63, "%{public}s MNS error reading sysctl %{public}@ %{darwin.errno}d, no backtrace", (uint8_t *)&v109, 0x1Cu);
                }
              }
            }
            else
            {
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v56 = (id)gLogObj;
              os_log_type_t v65 = buf;
              if (os_log_type_enabled(v56, (os_log_type_t)buf))
              {
                int v109 = 136446722;
                v110 = "-[ManagedNetworkSettings reloadMNS]";
                __int16 v111 = 2114;
                v112[0] = v31;
                LOWORD(v112[1]) = 1024;
                *(_DWORD *)((char *)&v112[1] + 2) = v79;
                v58 = v56;
                os_log_type_t v59 = v65;
                v60 = "%{public}s MNS error reading sysctl %{public}@ %{darwin.errno}d, backtrace limit exceeded";
LABEL_77:
                _os_log_impl(&dword_1830D4000, v58, v59, v60, (uint8_t *)&v109, 0x1Cu);
              }
LABEL_78:
            }
          }
          if (v83) {
            free(v83);
          }
          v26 = (id *)&unk_1EB267000;
          v52 = v81;
          goto LABEL_82;
        }
LABEL_56:
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v33 = v26[237];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          int v109 = 136446466;
          v110 = "-[ManagedNetworkSettings reloadMNS]";
          __int16 v111 = 2114;
          v112[0] = v31;
          _os_log_impl(&dword_1830D4000, v33, OS_LOG_TYPE_ERROR, "%{public}s MNS sysctl name %{public}@ is not allowlisted", (uint8_t *)&v109, 0x16u);
        }
LABEL_27:
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v87 objects:v99 count:16];
    }
    while (v27);
  }
}

- (void)reloadNetworkdSettings
{
  v2 = (const char *)nw_setting_libnetcore_debug;
  networkd_settings_init();
  if (sCachedSettings)
  {
    pthread_mutex_lock(&sSettingsMutex);
    if (sCachedSettings) {
      int64_t int64 = xpc_dictionary_get_int64((xpc_object_t)sCachedSettings, v2);
    }
    else {
      int64_t int64 = 0;
    }
    pthread_mutex_unlock(&sSettingsMutex);
  }
  else
  {
    int64_t int64 = 0;
  }
  v4 = [NSString stringWithUTF8String:nw_file_path_settings];
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v4];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v13 = (id)v5;

  uint64_t v6 = (void *)[v13 copy];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA60];
  v8 = [NSString stringWithUTF8String:nw_file_path_settings_managed];
  uint64_t v9 = [v7 dictionaryWithContentsOfFile:v8];

  if (![v9 count])
  {

    uint64_t v9 = 0;
  }
  v10 = [NSString stringWithUTF8String:nw_settings_managed_settings];
  if (v9)
  {
    id v11 = v13;
    if (!v13)
    {
      id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v13 = v11;
    [v11 setObject:v9 forKeyedSubscript:v10];
  }
  else
  {
    [v13 removeObjectForKey:v10];
  }
  if ([v13 count])
  {
    uint64_t v12 = v13;
  }
  else
  {

    uint64_t v12 = 0;
  }
  id v14 = v12;
  saveAndPostNetworkdSettings(v12, v6, int64);
}

- (void)handleEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v8 = (id)gLogObj;
    *(_DWORD *)int buf = 136446210;
    v22 = "-[ManagedNetworkSettings handleEvent:]";
    uint64_t v9 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v19 = 0;
    if (__nwlog_fault((const char *)v9, &type, &v19))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        os_log_type_t v11 = type;
        if (!os_log_type_enabled(v10, type)) {
          goto LABEL_26;
        }
        *(_DWORD *)int buf = 136446210;
        v22 = "-[ManagedNetworkSettings handleEvent:]";
        uint64_t v12 = "%{public}s called with null event";
LABEL_24:
        v16 = v10;
        os_log_type_t v17 = v11;
        goto LABEL_25;
      }
      if (!v19)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        os_log_type_t v11 = type;
        if (!os_log_type_enabled(v10, type)) {
          goto LABEL_26;
        }
        *(_DWORD *)int buf = 136446210;
        v22 = "-[ManagedNetworkSettings handleEvent:]";
        uint64_t v12 = "%{public}s called with null event, backtrace limit exceeded";
        goto LABEL_24;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      os_log_type_t v14 = type;
      BOOL v15 = os_log_type_enabled(v10, type);
      if (!backtrace_string)
      {
        if (!v15)
        {
LABEL_26:

          if (!v9) {
            goto LABEL_34;
          }
LABEL_27:
          free(v9);
          goto LABEL_34;
        }
        *(_DWORD *)int buf = 136446210;
        v22 = "-[ManagedNetworkSettings handleEvent:]";
        uint64_t v12 = "%{public}s called with null event, no backtrace";
        v16 = v10;
        os_log_type_t v17 = v14;
LABEL_25:
        _os_log_impl(&dword_1830D4000, v16, v17, v12, buf, 0xCu);
        goto LABEL_26;
      }
      if (v15)
      {
        *(_DWORD *)int buf = 136446466;
        v22 = "-[ManagedNetworkSettings handleEvent:]";
        __int16 v23 = 2082;
        v24 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v10, v14, "%{public}s called with null event, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v9) {
      goto LABEL_34;
    }
    goto LABEL_27;
  }
  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14560]);
  if (string)
  {
    uint64_t v7 = [NSString stringWithUTF8String:string];
    if (([v7 isEqualToString:@"NetworkdSettingsChanged"] & 1) != 0
      || [v7 isEqualToString:@"NetworkdManagedSettingsChanged"])
    {
      [(ManagedNetworkSettings *)self reloadNetworkdSettings];
    }
    else if (([v7 isEqualToString:@"NetworkdSysctlSettingsChanged"] & 1) != 0 {
           || [v7 isEqualToString:@"NetworkdManagedSysctlSettingsChanged"])
    }
    {
      [(ManagedNetworkSettings *)self reloadMNS];
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v18 = (id)gLogObj;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 136446466;
        v22 = "-[ManagedNetworkSettings handleEvent:]";
        __int16 v23 = 2114;
        v24 = v7;
        _os_log_impl(&dword_1830D4000, v18, OS_LOG_TYPE_DEBUG, "%{public}s MNS received an event with unknown name %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v7 = (id)gLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446210;
      v22 = "-[ManagedNetworkSettings handleEvent:]";
      _os_log_impl(&dword_1830D4000, v7, OS_LOG_TYPE_ERROR, "%{public}s MNS received an event with no name", buf, 0xCu);
    }
  }

LABEL_34:
}

- (ManagedNetworkSettings)init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)ManagedNetworkSettings;
  v2 = [(ManagedNetworkSettings *)&v18 init];
  v3 = v2;
  if (!v2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    *(_DWORD *)int buf = 136446210;
    v20 = "-[ManagedNetworkSettings init]";
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v16 = 0;
    if (__nwlog_fault(v6, &type, &v16))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v7 = (id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_19;
        }
        *(_DWORD *)int buf = 136446210;
        v20 = "-[ManagedNetworkSettings init]";
        uint64_t v9 = "%{public}s super init failed";
LABEL_17:
        os_log_type_t v14 = v7;
        os_log_type_t v15 = v8;
        goto LABEL_18;
      }
      if (!v16)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v7 = (id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_19;
        }
        *(_DWORD *)int buf = 136446210;
        v20 = "-[ManagedNetworkSettings init]";
        uint64_t v9 = "%{public}s super init failed, backtrace limit exceeded";
        goto LABEL_17;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v7 = (id)gLogObj;
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v7, type);
      if (!backtrace_string)
      {
        if (!v12)
        {
LABEL_19:

          if (!v6) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }
        *(_DWORD *)int buf = 136446210;
        v20 = "-[ManagedNetworkSettings init]";
        uint64_t v9 = "%{public}s super init failed, no backtrace";
        os_log_type_t v14 = v7;
        os_log_type_t v15 = v11;
LABEL_18:
        _os_log_impl(&dword_1830D4000, v14, v15, v9, buf, 0xCu);
        goto LABEL_19;
      }
      if (v12)
      {
        *(_DWORD *)int buf = 136446466;
        v20 = "-[ManagedNetworkSettings init]";
        __int16 v21 = 2082;
        v22 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v7, v11, "%{public}s super init failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v6) {
      goto LABEL_14;
    }
LABEL_13:
    free(v6);
    goto LABEL_14;
  }
  id v4 = v2;
LABEL_14:

  return v3;
}

+ (id)sharedMNS
{
  if (sharedMNS_onceToken != -1) {
    dispatch_once(&sharedMNS_onceToken, &__block_literal_global_23769);
  }
  v2 = (void *)sharedMNS_gManagedNetworkSettings;

  return v2;
}

void __35__ManagedNetworkSettings_sharedMNS__block_invoke()
{
  v0 = objc_alloc_init(ManagedNetworkSettings);
  v1 = (void *)sharedMNS_gManagedNetworkSettings;
  sharedMNS_gManagedNetworkSettings = (uint64_t)v0;
}

@end