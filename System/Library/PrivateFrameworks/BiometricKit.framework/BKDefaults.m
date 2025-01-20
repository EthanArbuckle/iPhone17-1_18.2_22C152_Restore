@interface BKDefaults
+ (BOOL)setNumber:(id)a3 forKey:(id)a4 withError:(id *)a5;
+ (BOOL)setString:(id)a3 forKey:(id)a4 withError:(id *)a5;
+ (id)device;
+ (id)numberForKey:(id)a3 withError:(id *)a4;
+ (id)stringForKey:(id)a3 withError:(id *)a4;
@end

@implementation BKDefaults

+ (id)device
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = +[BKDeviceManager availableDevices];
  v3 = [v2 firstObject];
  if (v3)
  {
    id v9 = 0;
    v4 = +[BKDevice deviceWithDescriptor:v3 error:&v9];
    id v5 = v9;
    if (!v4)
    {
      v6 = (__osLog ? __osLog : MEMORY[0x1E4F14500]);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v11 = v3;
        __int16 v12 = 2112;
        id v13 = v5;
        _os_log_impl(&dword_1B3AF1000, v6, OS_LOG_TYPE_ERROR, "Cannot instantiate device with descriptor %@, error %@\n", buf, 0x16u);
      }
    }
  }
  else
  {
    if (__osLog) {
      v7 = __osLog;
    }
    else {
      v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3AF1000, v7, OS_LOG_TYPE_ERROR, "Cannot find any biometric device\n", buf, 2u);
    }
    v4 = 0;
  }

  return v4;
}

+ (id)numberForKey:(id)a3 withError:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v6 = (char *)a3;
  v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v8 = __osLogTrace;
  }
  else {
    v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::numberForKey:%@\n", buf, 0xCu);
  }
  uint64_t v9 = [a1 device];
  v10 = (void *)v9;
  if (v9)
  {
    v11 = *(void **)(v9 + 8);
    id v25 = 0;
    uint64_t v12 = [v11 getPreferencesValue:&v25 forKey:v6];
    id v13 = v25;
    uint64_t v14 = v13;
    if (!v12)
    {
      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (__osLog) {
          v24 = __osLog;
        }
        else {
          v24 = v7;
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v27 = "!result || [result isKindOfClass:[NSNumber class]]";
          __int16 v28 = 2048;
          id v29 = 0;
          __int16 v30 = 2080;
          v31 = &unk_1B3B370EE;
          __int16 v32 = 2080;
          v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
          __int16 v34 = 1024;
          int v35 = 50;
          _os_log_impl(&dword_1B3AF1000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        setErrorWithOSStatus((id)0x16, a4);
        id v15 = 0;
      }
      else
      {
        id v15 = v14;
      }
      if (__osLogTrace) {
        v16 = __osLogTrace;
      }
      else {
        v16 = v7;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        if (a4) {
          id v17 = *a4;
        }
        else {
          id v17 = 0;
        }
        *(_DWORD *)buf = 138412802;
        v27 = v6;
        __int16 v28 = 2112;
        id v29 = v15;
        __int16 v30 = 2112;
        v31 = v17;
        _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_DEFAULT, "BKDevice::numberForKey:%@ -> %@ %@\n", buf, 0x20u);
      }
      goto LABEL_19;
    }
    if (__osLog) {
      v21 = __osLog;
    }
    else {
      v21 = v7;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v27 = "err == 0 ";
      __int16 v28 = 2048;
      id v29 = (id)(int)v12;
      __int16 v30 = 2080;
      v31 = &unk_1B3B370EE;
      __int16 v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
      __int16 v34 = 1024;
      int v35 = 49;
      _os_log_impl(&dword_1B3AF1000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (__osLog) {
      v20 = __osLog;
    }
    else {
      v20 = v7;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v27 = "device";
      __int16 v28 = 2048;
      id v29 = 0;
      __int16 v30 = 2080;
      v31 = &unk_1B3B370EE;
      __int16 v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
      __int16 v34 = 1024;
      int v35 = 47;
      _os_log_impl(&dword_1B3AF1000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v14 = 0;
    uint64_t v12 = 263;
  }
  setErrorWithOSStatus((id)v12, a4);
  if (__osLogTrace) {
    v22 = __osLogTrace;
  }
  else {
    v22 = v7;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    if (a4) {
      id v23 = *a4;
    }
    else {
      id v23 = 0;
    }
    *(_DWORD *)buf = 138412802;
    v27 = v6;
    __int16 v28 = 2112;
    id v29 = 0;
    __int16 v30 = 2112;
    v31 = v23;
    _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_ERROR, "BKDevice::numberForKey:%@ -> %@ %@\n", buf, 0x20u);
  }
  id v15 = 0;
LABEL_19:
  id v18 = v15;

  return v18;
}

+ (id)stringForKey:(id)a3 withError:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v6 = (char *)a3;
  v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v8 = __osLogTrace;
  }
  else {
    v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::stringForKey:%@\n", buf, 0xCu);
  }
  uint64_t v9 = [a1 device];
  v10 = (void *)v9;
  if (v9)
  {
    v11 = *(void **)(v9 + 8);
    id v25 = 0;
    uint64_t v12 = [v11 getPreferencesValue:&v25 forKey:v6];
    id v13 = v25;
    uint64_t v14 = v13;
    if (!v12)
    {
      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (__osLog) {
          v24 = __osLog;
        }
        else {
          v24 = v7;
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v27 = "!result || [result isKindOfClass:[NSString class]]";
          __int16 v28 = 2048;
          id v29 = 0;
          __int16 v30 = 2080;
          v31 = &unk_1B3B370EE;
          __int16 v32 = 2080;
          v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
          __int16 v34 = 1024;
          int v35 = 71;
          _os_log_impl(&dword_1B3AF1000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        setErrorWithOSStatus((id)0x16, a4);
        id v15 = 0;
      }
      else
      {
        id v15 = v14;
      }
      if (__osLogTrace) {
        v16 = __osLogTrace;
      }
      else {
        v16 = v7;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        if (a4) {
          id v17 = *a4;
        }
        else {
          id v17 = 0;
        }
        *(_DWORD *)buf = 138412802;
        v27 = v6;
        __int16 v28 = 2112;
        id v29 = v15;
        __int16 v30 = 2112;
        v31 = v17;
        _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_DEFAULT, "BKDevice::stringForKey:%@ -> %@ %@\n", buf, 0x20u);
      }
      goto LABEL_19;
    }
    if (__osLog) {
      v21 = __osLog;
    }
    else {
      v21 = v7;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v27 = "err == 0 ";
      __int16 v28 = 2048;
      id v29 = (id)(int)v12;
      __int16 v30 = 2080;
      v31 = &unk_1B3B370EE;
      __int16 v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
      __int16 v34 = 1024;
      int v35 = 70;
      _os_log_impl(&dword_1B3AF1000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (__osLog) {
      v20 = __osLog;
    }
    else {
      v20 = v7;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v27 = "device";
      __int16 v28 = 2048;
      id v29 = 0;
      __int16 v30 = 2080;
      v31 = &unk_1B3B370EE;
      __int16 v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
      __int16 v34 = 1024;
      int v35 = 68;
      _os_log_impl(&dword_1B3AF1000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v14 = 0;
    uint64_t v12 = 263;
  }
  setErrorWithOSStatus((id)v12, a4);
  if (__osLogTrace) {
    v22 = __osLogTrace;
  }
  else {
    v22 = v7;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    if (a4) {
      id v23 = *a4;
    }
    else {
      id v23 = 0;
    }
    *(_DWORD *)buf = 138412802;
    v27 = v6;
    __int16 v28 = 2112;
    id v29 = 0;
    __int16 v30 = 2112;
    v31 = v23;
    _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_ERROR, "BKDevice::stringForKey:%@ -> %@ %@\n", buf, 0x20u);
  }
  id v15 = 0;
LABEL_19:
  id v18 = v15;

  return v18;
}

+ (BOOL)setNumber:(id)a3 forKey:(id)a4 withError:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v8 = (char *)a3;
  id v9 = a4;
  v10 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v11 = __osLogTrace;
  }
  else {
    v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412546;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_1B3AF1000, v11, OS_LOG_TYPE_DEFAULT, "BKDevice::setNumber:%@ forKey:%@\n", (uint8_t *)&v24, 0x16u);
  }
  uint64_t v12 = [a1 device];
  id v13 = (void *)v12;
  if (v12)
  {
    uint64_t v14 = [*(id *)(v12 + 8) setPreferencesValue:v8 forKey:v9];
    if (!v14)
    {
      if (__osLogTrace) {
        id v15 = __osLogTrace;
      }
      else {
        id v15 = v10;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        if (a5) {
          id v16 = *a5;
        }
        else {
          id v16 = 0;
        }
        int v24 = 138413058;
        id v25 = v8;
        __int16 v26 = 2112;
        id v27 = v9;
        __int16 v28 = 1024;
        BOOL v17 = 1;
        *(_DWORD *)id v29 = 1;
        *(_WORD *)&v29[4] = 2112;
        *(void *)&v29[6] = v16;
        _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_DEFAULT, "BKDevice::setNumber:%@ forKey:%@ -> %d %@\n", (uint8_t *)&v24, 0x26u);
      }
      else
      {
        BOOL v17 = 1;
      }
      goto LABEL_17;
    }
    uint64_t v20 = v14;
    if (__osLog) {
      v21 = __osLog;
    }
    else {
      v21 = v10;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136316162;
      id v25 = "err == 0 ";
      __int16 v26 = 2048;
      id v27 = (id)(int)v20;
      __int16 v28 = 2080;
      *(void *)id v29 = &unk_1B3B370EE;
      *(_WORD *)&v29[8] = 2080;
      *(void *)&v29[10] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
      __int16 v30 = 1024;
      int v31 = 90;
      _os_log_impl(&dword_1B3AF1000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
    }
  }
  else
  {
    if (__osLog) {
      v19 = __osLog;
    }
    else {
      v19 = v10;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136316162;
      id v25 = "device";
      __int16 v26 = 2048;
      id v27 = 0;
      __int16 v28 = 2080;
      *(void *)id v29 = &unk_1B3B370EE;
      *(_WORD *)&v29[8] = 2080;
      *(void *)&v29[10] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
      __int16 v30 = 1024;
      int v31 = 88;
      _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
    }
    uint64_t v20 = 263;
  }
  setErrorWithOSStatus((id)v20, a5);
  if (__osLogTrace) {
    v22 = __osLogTrace;
  }
  else {
    v22 = v10;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    if (a5) {
      id v23 = *a5;
    }
    else {
      id v23 = 0;
    }
    int v24 = 138413058;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 1024;
    *(_DWORD *)id v29 = 0;
    *(_WORD *)&v29[4] = 2112;
    *(void *)&v29[6] = v23;
    _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_ERROR, "BKDevice::setNumber:%@ forKey:%@ -> %d %@\n", (uint8_t *)&v24, 0x26u);
  }
  BOOL v17 = 0;
LABEL_17:

  return v17;
}

+ (BOOL)setString:(id)a3 forKey:(id)a4 withError:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v8 = (char *)a3;
  id v9 = a4;
  v10 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v11 = __osLogTrace;
  }
  else {
    v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412546;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_1B3AF1000, v11, OS_LOG_TYPE_DEFAULT, "BKDevice::setString:%@ forKey:%@\n", (uint8_t *)&v24, 0x16u);
  }
  uint64_t v12 = [a1 device];
  id v13 = (void *)v12;
  if (v12)
  {
    uint64_t v14 = [*(id *)(v12 + 8) setPreferencesValue:v8 forKey:v9];
    if (!v14)
    {
      if (__osLogTrace) {
        id v15 = __osLogTrace;
      }
      else {
        id v15 = v10;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        if (a5) {
          id v16 = *a5;
        }
        else {
          id v16 = 0;
        }
        int v24 = 138413058;
        id v25 = v8;
        __int16 v26 = 2112;
        id v27 = v9;
        __int16 v28 = 1024;
        BOOL v17 = 1;
        *(_DWORD *)id v29 = 1;
        *(_WORD *)&v29[4] = 2112;
        *(void *)&v29[6] = v16;
        _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_DEFAULT, "BKDevice::setString:%@ forKey:%@ -> %d %@\n", (uint8_t *)&v24, 0x26u);
      }
      else
      {
        BOOL v17 = 1;
      }
      goto LABEL_17;
    }
    uint64_t v20 = v14;
    if (__osLog) {
      v21 = __osLog;
    }
    else {
      v21 = v10;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136316162;
      id v25 = "err == 0 ";
      __int16 v26 = 2048;
      id v27 = (id)(int)v20;
      __int16 v28 = 2080;
      *(void *)id v29 = &unk_1B3B370EE;
      *(_WORD *)&v29[8] = 2080;
      *(void *)&v29[10] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
      __int16 v30 = 1024;
      int v31 = 109;
      _os_log_impl(&dword_1B3AF1000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
    }
  }
  else
  {
    if (__osLog) {
      v19 = __osLog;
    }
    else {
      v19 = v10;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136316162;
      id v25 = "device";
      __int16 v26 = 2048;
      id v27 = 0;
      __int16 v28 = 2080;
      *(void *)id v29 = &unk_1B3B370EE;
      *(_WORD *)&v29[8] = 2080;
      *(void *)&v29[10] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
      __int16 v30 = 1024;
      int v31 = 107;
      _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
    }
    uint64_t v20 = 263;
  }
  setErrorWithOSStatus((id)v20, a5);
  if (__osLogTrace) {
    v22 = __osLogTrace;
  }
  else {
    v22 = v10;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    if (a5) {
      id v23 = *a5;
    }
    else {
      id v23 = 0;
    }
    int v24 = 138413058;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 1024;
    *(_DWORD *)id v29 = 0;
    *(_WORD *)&v29[4] = 2112;
    *(void *)&v29[6] = v23;
    _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_ERROR, "BKDevice::setString:%@ forKey:%@ -> %d %@\n", (uint8_t *)&v24, 0x26u);
  }
  BOOL v17 = 0;
LABEL_17:

  return v17;
}

@end