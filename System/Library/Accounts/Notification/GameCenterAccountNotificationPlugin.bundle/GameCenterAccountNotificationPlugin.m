uint64_t GKOSLoggers()
{
  return MEMORY[0x270F2E4D0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject **v40;
  NSObject *v41;
  id v42;
  const char *v43;
  NSObject **v44;
  id v45;
  NSObject **v46;
  id v47;
  void *v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v8 = *(void *)&a4;
  v57 = *MEMORY[0x263EF8340];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (v8 == 3) {
    v13 = v11;
  }
  else {
    v13 = v9;
  }
  v14 = v13;
  v15 = [v14 accountType];
  v16 = [v15 identifier];

  v17 = (NSObject **)MEMORY[0x263F40328];
  v18 = *MEMORY[0x263F40328];
  if (!*MEMORY[0x263F40328])
  {
    v19 = (id)GKOSLoggers();
    v18 = *v17;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v20 = NSNumber;
    v21 = v18;
    v22 = [v20 numberWithUnsignedInt:v8];
    *(_DWORD *)buf = 138413058;
    v50 = v9;
    v51 = 2112;
    v52 = v22;
    v53 = 2112;
    v54 = v12;
    v55 = 2112;
    v56 = v10;
    _os_log_impl(&dword_2405A7000, v21, OS_LOG_TYPE_INFO, "Plugin account: %@ - changeType: %@ - oldAccount: %@ - store: %@", buf, 0x2Au);
  }
  v23 = *v17;
  if (!*v17)
  {
    v24 = (id)GKOSLoggers();
    v23 = *v17;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v25 = v23;
    v26 = [v9 accountType];
    [v26 identifier];
    v48 = v16;
    v27 = v9;
    v28 = v14;
    v30 = v29 = v10;
    [v12 accountType];
    v31 = v8;
    v33 = v32 = v12;
    v34 = [v33 identifier];
    *(_DWORD *)buf = 138412546;
    v50 = v30;
    v51 = 2112;
    v52 = v34;
    _os_log_impl(&dword_2405A7000, v25, OS_LOG_TYPE_INFO, "Plugin account identifier: %@ - oldAccount identifier: %@", buf, 0x16u);

    v12 = v32;
    v8 = v31;
    v17 = (NSObject **)MEMORY[0x263F40328];

    v10 = v29;
    v14 = v28;
    v9 = v27;
    v16 = v48;
  }
  v35 = *v17;
  if (!*v17)
  {
    v36 = (id)GKOSLoggers();
    v35 = *v17;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v37 = NSNumber;
    v38 = v35;
    v39 = [v37 numberWithUnsignedInt:v8];
    *(_DWORD *)buf = 138412802;
    v50 = v39;
    v51 = 2112;
    v52 = v14;
    v53 = 2112;
    v54 = v10;
    _os_log_impl(&dword_2405A7000, v38, OS_LOG_TYPE_INFO, "Plugin (didChangeWithType: %@) - %@ - %@", buf, 0x20u);
  }
  if ([v16 isEqualToString:*MEMORY[0x263EFAEE0]])
  {
    switch(v8)
    {
      case 2:
        v44 = v17;
        v41 = *v17;
        if (!v41)
        {
          v45 = (id)GKOSLoggers();
          v41 = *v44;
        }
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v14;
          v43 = "Plugin (didChangeWithType): Game Center account was modified: %@";
          goto LABEL_32;
        }
        break;
      case 1:
        v40 = v17;
        v41 = *v17;
        if (!v41)
        {
          v42 = (id)GKOSLoggers();
          v41 = *v40;
        }
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v14;
          v43 = "Plugin (didChangeWithType): New Game Center account was added: %@";
LABEL_32:
          _os_log_impl(&dword_2405A7000, v41, OS_LOG_TYPE_INFO, v43, buf, 0xCu);
        }
        break;
      case 3:
        v46 = v17;
        v41 = *v17;
        if (!v41)
        {
          v47 = (id)GKOSLoggers();
          v41 = *v46;
        }
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v12;
          v43 = "Plugin (didChangeWithType): Game Center account was deleted: %@";
          goto LABEL_32;
        }
        break;
    }
  }
}

@end