@interface ARDaemonStatusLogger
- (id)generateStringFromStatusDictionary:(id)a3 forServerObject:(id)a4 andProcessName:(id)a5;
- (void)_logOrGenerateString:(id)a3 fromDictionary:(id)a4 forServerObject:(id)a5 andProcessName:(id)a6;
- (void)_logProcessInformationFromDictionary:(id)a3 forServerObject:(id)a4 andProcessName:(id)a5 generatedTestString:(id)a6;
- (void)_logSystemInformationFromDictionary:(id)a3 forServerObject:(id)a4 generatedTestString:(id)a5;
- (void)logStatusUpdateWithDictionary:(id)a3 forServerObject:(id)a4 andProcessName:(id)a5;
@end

@implementation ARDaemonStatusLogger

- (void)logStatusUpdateWithDictionary:(id)a3 forServerObject:(id)a4 andProcessName:(id)a5
{
}

- (id)generateStringFromStatusDictionary:(id)a3 forServerObject:(id)a4 andProcessName:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F28E78];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v8);
  [(ARDaemonStatusLogger *)self _logOrGenerateString:v12 fromDictionary:v11 forServerObject:v10 andProcessName:v9];

  return v12;
}

- (void)_logOrGenerateString:(id)a3 fromDictionary:(id)a4 forServerObject:(id)a5 andProcessName:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = _ARLogGeneral_41();
  v15 = v14;
  if (!v10)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      id v42 = v12;
      _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] START", buf, 0xCu);
    }

    v16 = _ARLogGeneral_41();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      id v42 = v12;
      _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] {", buf, 0xCu);
    }
    goto LABEL_6;
  }
  *(_DWORD *)buf = 134349056;
  id v42 = v12;
  LODWORD(v39) = 12;
  v20 = (void *)_os_log_send_and_compose_impl();

  unint64_t v21 = 0x1E4F29000uLL;
  if (v20)
  {
    v22 = objc_msgSend(NSString, "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] START", buf, v39);
    v23 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"%[^\\{]" options:1 error:0];
    if (objc_msgSend(v23, "numberOfMatchesInString:options:range:", v22, 0, 0, objc_msgSend(v22, "length")))
    {
      v24 = [@"Privacy annotation missing:\n\t" stringByAppendingString:v22];

      unint64_t v21 = 0x1E4F29000;
    }
    else
    {

      unint64_t v21 = 0x1E4F29000uLL;
      v24 = [NSString stringWithCString:v20 encoding:4];
    }
    [v10 appendString:v24];
    [v10 appendString:@"\n"];
    free(v20);
  }
  v29 = _ARLogGeneral_41();
  *(_DWORD *)buf = 134349056;
  id v42 = v12;
  LODWORD(v39) = 12;
  v38 = buf;
  v30 = (void *)_os_log_send_and_compose_impl();

  if (v30)
  {
    v31 = objc_msgSend(*(id *)(v21 + 24), "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] {", buf, v39);
    v32 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"%[^\\{]" options:1 error:0];
    if (objc_msgSend(v32, "numberOfMatchesInString:options:range:", v31, 0, 0, objc_msgSend(v31, "length")))
    {
      [@"Privacy annotation missing:\n\t" stringByAppendingString:v31];
      v16 = v33 = v31;
    }
    else
    {

      v16 = [*(id *)(v21 + 24) stringWithCString:v30 encoding:4];
    }
    [v10 appendString:v16];
    [v10 appendString:@"\n"];
    free(v30);
LABEL_6:
  }
  -[ARDaemonStatusLogger _logProcessInformationFromDictionary:forServerObject:andProcessName:generatedTestString:](self, "_logProcessInformationFromDictionary:forServerObject:andProcessName:generatedTestString:", v11, v12, v13, v10, v38, v39);
  [(ARDaemonStatusLogger *)self _logSystemInformationFromDictionary:v11 forServerObject:v12 generatedTestString:v10];
  v17 = _ARLogGeneral_41();
  v18 = v17;
  if (!v10)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      id v42 = v12;
      _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] }", buf, 0xCu);
    }

    v19 = _ARLogGeneral_41();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      id v42 = v12;
      _os_log_impl(&dword_1B88A2000, v19, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] END", buf, 0xCu);
    }
    goto LABEL_12;
  }
  *(_DWORD *)buf = 134349056;
  id v42 = v12;
  LODWORD(v40) = 12;
  v25 = (void *)_os_log_send_and_compose_impl();

  if (v25)
  {
    v26 = objc_msgSend(NSString, "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] }", buf, v40);
    v27 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"%[^\\{]" options:1 error:0];
    if (objc_msgSend(v27, "numberOfMatchesInString:options:range:", v26, 0, 0, objc_msgSend(v26, "length")))
    {
      v28 = [@"Privacy annotation missing:\n\t" stringByAppendingString:v26];
    }
    else
    {

      v28 = [NSString stringWithCString:v25 encoding:4];
    }
    [v10 appendString:v28];
    [v10 appendString:@"\n"];
    free(v25);
  }
  v34 = _ARLogGeneral_41();
  *(_DWORD *)buf = 134349056;
  id v42 = v12;
  LODWORD(v40) = 12;
  v35 = (void *)_os_log_send_and_compose_impl();

  if (v35)
  {
    v36 = objc_msgSend(NSString, "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] END", buf, v40);
    v37 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"%[^\\{]" options:1 error:0];
    if (objc_msgSend(v37, "numberOfMatchesInString:options:range:", v36, 0, 0, objc_msgSend(v36, "length")))
    {
      v19 = [@"Privacy annotation missing:\n\t" stringByAppendingString:v36];
    }
    else
    {

      v19 = [NSString stringWithCString:v35 encoding:4];
    }
    [v10 appendString:v19];
    [v10 appendString:@"\n"];
    free(v35);
LABEL_12:
  }
}

- (void)_logProcessInformationFromDictionary:(id)a3 forServerObject:(id)a4 andProcessName:(id)a5 generatedTestString:(id)a6
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v9 objectForKey:v11];
  v14 = _ARLogGeneral_41();
  v15 = v14;
  if (!v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = [v13 objectForKey:@"pid"];
      *(_DWORD *)buf = 134349570;
      id v63 = v10;
      __int16 v64 = 2114;
      id v65 = v11;
      __int16 v66 = 2114;
      id v67 = v16;
      _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@\": {\"pid\": %{public}@},", buf, 0x20u);
    }
    v17 = _ARLogGeneral_41();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = [NSString stringWithFormat:@"%@_spawn_time", v11];
      v19 = [v9 objectForKey:v18];
      *(_DWORD *)buf = 134349570;
      id v63 = v10;
      __int16 v64 = 2114;
      id v65 = v11;
      __int16 v66 = 2114;
      id v67 = v19;
      _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@_spawn_time\": \"%{public}@\",", buf, 0x20u);
    }
    v20 = _ARLogGeneral_41();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      unint64_t v21 = [NSString stringWithFormat:@"%@_up_time", v11];
      v22 = [v9 objectForKey:v21];
      *(_DWORD *)buf = 134349570;
      id v63 = v10;
      __int16 v64 = 2114;
      id v65 = v11;
      __int16 v66 = 2114;
      id v67 = v22;
      _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@_up_time\": \"%{public}@\",", buf, 0x20u);
    }
    v23 = _ARLogGeneral_41();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = [NSString stringWithFormat:@"%@_up_time_including_sleep", v11];
      v25 = [v9 objectForKey:v24];
      *(_DWORD *)buf = 134349570;
      id v63 = v10;
      __int16 v64 = 2114;
      id v65 = v11;
      __int16 v66 = 2114;
      id v67 = v25;
      _os_log_impl(&dword_1B88A2000, v23, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@_up_time_including_sleep\": \"%{public}@\",", buf, 0x20u);
    }
    v26 = _ARLogGeneral_41();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = [NSString stringWithFormat:@"%@_up_time_including_sleep_and_drift_correction", v11];
      v28 = [v9 objectForKey:v27];
      *(_DWORD *)buf = 134349570;
      id v63 = v10;
      __int16 v64 = 2114;
      id v65 = v11;
      __int16 v66 = 2114;
      id v67 = v28;
      _os_log_impl(&dword_1B88A2000, v26, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@_up_time_including_sleep_and_drift_correction\": \"%{public}@\",", buf, 0x20u);
    }
    goto LABEL_12;
  }
  [v13 objectForKey:@"pid"];
  *(_DWORD *)buf = 134349570;
  id v63 = v10;
  __int16 v64 = 2114;
  id v65 = v11;
  __int16 v66 = 2114;
  id v67 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v61) = 32;
  v29 = (void *)_os_log_send_and_compose_impl();

  if (v29)
  {
    v30 = objc_msgSend(NSString, "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@\": {\"pid\": %{public}@},", buf, v61);
    v31 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"%[^\\{]" options:1 error:0];
    if (objc_msgSend(v31, "numberOfMatchesInString:options:range:", v30, 0, 0, objc_msgSend(v30, "length")))
    {
      v32 = [@"Privacy annotation missing:\n\t" stringByAppendingString:v30];
    }
    else
    {

      v32 = [NSString stringWithCString:v29 encoding:4];
    }
    [v12 appendString:v32];
    [v12 appendString:@"\n"];
    free(v29);
  }
  v33 = _ARLogGeneral_41();
  v34 = [NSString stringWithFormat:@"%@_spawn_time", v11];
  v35 = [v9 objectForKey:v34];
  *(_DWORD *)buf = 134349570;
  id v63 = v10;
  __int16 v64 = 2114;
  id v65 = v11;
  __int16 v66 = 2114;
  id v67 = v35;
  LODWORD(v61) = 32;
  v36 = (void *)_os_log_send_and_compose_impl();

  if (v36)
  {
    v37 = objc_msgSend(NSString, "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@_spawn_time\": \"%{public}@\",", buf, v61);
    v38 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"%[^\\{]" options:1 error:0];
    if (objc_msgSend(v38, "numberOfMatchesInString:options:range:", v37, 0, 0, objc_msgSend(v37, "length")))
    {
      uint64_t v39 = [@"Privacy annotation missing:\n\t" stringByAppendingString:v37];
    }
    else
    {

      uint64_t v39 = [NSString stringWithCString:v36 encoding:4];
    }
    [v12 appendString:v39];
    [v12 appendString:@"\n"];
    free(v36);
  }
  uint64_t v40 = _ARLogGeneral_41();
  v41 = [NSString stringWithFormat:@"%@_up_time", v11];
  id v42 = [v9 objectForKey:v41];
  *(_DWORD *)buf = 134349570;
  id v63 = v10;
  __int16 v64 = 2114;
  id v65 = v11;
  __int16 v66 = 2114;
  id v67 = v42;
  LODWORD(v61) = 32;
  uint64_t v43 = (void *)_os_log_send_and_compose_impl();

  if (v43)
  {
    v44 = objc_msgSend(NSString, "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@_up_time\": \"%{public}@\",", buf, v61);
    v45 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"%[^\\{]" options:1 error:0];
    if (objc_msgSend(v45, "numberOfMatchesInString:options:range:", v44, 0, 0, objc_msgSend(v44, "length")))
    {
      v46 = [@"Privacy annotation missing:\n\t" stringByAppendingString:v44];
    }
    else
    {

      v46 = [NSString stringWithCString:v43 encoding:4];
    }
    [v12 appendString:v46];
    [v12 appendString:@"\n"];
    free(v43);
  }
  v47 = _ARLogGeneral_41();
  v48 = [NSString stringWithFormat:@"%@_up_time_including_sleep", v11];
  v49 = [v9 objectForKey:v48];
  *(_DWORD *)buf = 134349570;
  id v63 = v10;
  __int16 v64 = 2114;
  id v65 = v11;
  __int16 v66 = 2114;
  id v67 = v49;
  LODWORD(v61) = 32;
  v50 = (void *)_os_log_send_and_compose_impl();

  if (v50)
  {
    v51 = objc_msgSend(NSString, "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@_up_time_including_sleep\": \"%{public}@\",", buf, v61);
    v52 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"%[^\\{]" options:1 error:0];
    if (objc_msgSend(v52, "numberOfMatchesInString:options:range:", v51, 0, 0, objc_msgSend(v51, "length")))
    {
      v53 = [@"Privacy annotation missing:\n\t" stringByAppendingString:v51];
    }
    else
    {

      v53 = [NSString stringWithCString:v50 encoding:4];
    }
    [v12 appendString:v53];
    [v12 appendString:@"\n"];
    free(v50);
  }
  v54 = _ARLogGeneral_41();
  v55 = [NSString stringWithFormat:@"%@_up_time_including_sleep_and_drift_correction", v11];
  v56 = [v9 objectForKey:v55];
  *(_DWORD *)buf = 134349570;
  id v63 = v10;
  __int16 v64 = 2114;
  id v65 = v11;
  __int16 v66 = 2114;
  id v67 = v56;
  LODWORD(v61) = 32;
  v57 = (void *)_os_log_send_and_compose_impl();

  if (v57)
  {
    v58 = objc_msgSend(NSString, "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@_up_time_including_sleep_and_drift_correction\": \"%{public}@\",", buf, v61);
    v59 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"%[^\\{]" options:1 error:0];
    if (objc_msgSend(v59, "numberOfMatchesInString:options:range:", v58, 0, 0, objc_msgSend(v58, "length")))
    {
      [@"Privacy annotation missing:\n\t" stringByAppendingString:v58];
      v26 = v60 = v58;
    }
    else
    {

      v26 = [NSString stringWithCString:v57 encoding:4];
    }
    [v12 appendString:v26];
    [v12 appendString:@"\n"];
    free(v57);
LABEL_12:
  }
}

- (void)_logSystemInformationFromDictionary:(id)a3 forServerObject:(id)a4 generatedTestString:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = _ARLogGeneral_41();
  id v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = [v7 objectForKey:@"system_boot_time"];
      *(_DWORD *)buf = 134349314;
      id v44 = v8;
      __int16 v45 = 2114;
      id v46 = v12;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"system_boot_time\": \"%{public}@\",", buf, 0x16u);
    }
    id v13 = _ARLogGeneral_41();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = [v7 objectForKey:@"system_up_time"];
      *(_DWORD *)buf = 134349314;
      id v44 = v8;
      __int16 v45 = 2114;
      id v46 = v14;
      _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"system_up_time\": \"%{public}@\",", buf, 0x16u);
    }
    v15 = _ARLogGeneral_41();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = [v7 objectForKey:@"system_up_time_including_sleep"];
      *(_DWORD *)buf = 134349314;
      id v44 = v8;
      __int16 v45 = 2114;
      id v46 = v16;
      _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"system_up_time_including_sleep\": \"%{public}@\",", buf, 0x16u);
    }
    v17 = _ARLogGeneral_41();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = [v7 objectForKey:@"system_up_time_including_sleep_and_drift_correction"];
      *(_DWORD *)buf = 134349314;
      id v44 = v8;
      __int16 v45 = 2114;
      id v46 = v18;
      _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"system_up_time_including_sleep_and_drift_correction\": \"%{public}@\",", buf, 0x16u);
    }
    goto LABEL_10;
  }
  [v7 objectForKey:@"system_boot_time"];
  *(_DWORD *)buf = 134349314;
  id v44 = v8;
  __int16 v45 = 2114;
  id v46 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v42) = 22;
  v19 = (void *)_os_log_send_and_compose_impl();

  unint64_t v20 = 0x1E4F29000uLL;
  if (v19)
  {
    unint64_t v21 = objc_msgSend(NSString, "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"system_boot_time\": \"%{public}@\",", buf, v42);
    v22 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"%[^\\{]" options:1 error:0];
    if (objc_msgSend(v22, "numberOfMatchesInString:options:range:", v21, 0, 0, objc_msgSend(v21, "length")))
    {
      v23 = [@"Privacy annotation missing:\n\t" stringByAppendingString:v21];

      unint64_t v20 = 0x1E4F29000;
    }
    else
    {

      unint64_t v20 = 0x1E4F29000uLL;
      v23 = [NSString stringWithCString:v19 encoding:4];
    }
    [v9 appendString:v23];
    [v9 appendString:@"\n"];
    free(v19);
  }
  v24 = _ARLogGeneral_41();
  v25 = [v7 objectForKey:@"system_up_time"];
  *(_DWORD *)buf = 134349314;
  id v44 = v8;
  __int16 v45 = 2114;
  id v46 = v25;
  LODWORD(v42) = 22;
  v26 = (void *)_os_log_send_and_compose_impl();

  if (v26)
  {
    v27 = objc_msgSend(*(id *)(v20 + 24), "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"system_up_time\": \"%{public}@\",", buf, v42);
    v28 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"%[^\\{]" options:1 error:0];
    if (objc_msgSend(v28, "numberOfMatchesInString:options:range:", v27, 0, 0, objc_msgSend(v27, "length")))
    {
      v29 = [@"Privacy annotation missing:\n\t" stringByAppendingString:v27];

      unint64_t v20 = 0x1E4F29000;
    }
    else
    {

      unint64_t v20 = 0x1E4F29000uLL;
      v29 = [NSString stringWithCString:v26 encoding:4];
    }
    [v9 appendString:v29];
    [v9 appendString:@"\n"];
    free(v26);
  }
  v30 = _ARLogGeneral_41();
  v31 = [v7 objectForKey:@"system_up_time_including_sleep"];
  *(_DWORD *)buf = 134349314;
  id v44 = v8;
  __int16 v45 = 2114;
  id v46 = v31;
  LODWORD(v42) = 22;
  v32 = (void *)_os_log_send_and_compose_impl();

  if (v32)
  {
    v33 = objc_msgSend(*(id *)(v20 + 24), "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"system_up_time_including_sleep\": \"%{public}@\",", buf, v42);
    v34 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"%[^\\{]" options:1 error:0];
    if (objc_msgSend(v34, "numberOfMatchesInString:options:range:", v33, 0, 0, objc_msgSend(v33, "length")))
    {
      v35 = [@"Privacy annotation missing:\n\t" stringByAppendingString:v33];

      unint64_t v20 = 0x1E4F29000;
    }
    else
    {

      unint64_t v20 = 0x1E4F29000uLL;
      v35 = [NSString stringWithCString:v32 encoding:4];
    }
    [v9 appendString:v35];
    [v9 appendString:@"\n"];
    free(v32);
  }
  v36 = _ARLogGeneral_41();
  v37 = [v7 objectForKey:@"system_up_time_including_sleep_and_drift_correction"];
  *(_DWORD *)buf = 134349314;
  id v44 = v8;
  __int16 v45 = 2114;
  id v46 = v37;
  LODWORD(v42) = 22;
  v38 = (void *)_os_log_send_and_compose_impl();

  if (v38)
  {
    uint64_t v39 = objc_msgSend(*(id *)(v20 + 24), "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"system_up_time_including_sleep_and_drift_correction\": \"%{public}@\",", buf, v42);
    uint64_t v40 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"%[^\\{]" options:1 error:0];
    if (objc_msgSend(v40, "numberOfMatchesInString:options:range:", v39, 0, 0, objc_msgSend(v39, "length")))
    {
      [@"Privacy annotation missing:\n\t" stringByAppendingString:v39];
      v17 = v41 = v39;
    }
    else
    {

      v17 = [*(id *)(v20 + 24) stringWithCString:v38 encoding:4];
    }
    [v9 appendString:v17];
    [v9 appendString:@"\n"];
    free(v38);
LABEL_10:
  }
}

@end