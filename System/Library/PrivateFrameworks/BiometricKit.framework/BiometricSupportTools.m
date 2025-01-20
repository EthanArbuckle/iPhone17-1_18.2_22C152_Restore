@interface BiometricSupportTools
+ (id)dateFromNanoTime:(unint64_t)a3 nanoseconds:(unsigned int *)a4;
+ (void)analyticsOSLogNSDictionary:(id)a3 forEvent:(id)a4;
+ (void)analyticsOSLogNSDictionary:(id)a3 forEvent:(id)a4 toLogPath:(id)a5 withPrefix:(id)a6;
@end

@implementation BiometricSupportTools

+ (id)dateFromNanoTime:(unint64_t)a3 nanoseconds:(unsigned int *)a4
{
  id result = (id)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)a3 / 1000000000.0];
  if (a4) {
    *a4 = a3 % 0x3B9ACA00;
  }
  return result;
}

+ (void)analyticsOSLogNSDictionary:(id)a3 forEvent:(id)a4
{
}

+ (void)analyticsOSLogNSDictionary:(id)a3 forEvent:(id)a4 toLogPath:(id)a5 withPrefix:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v33 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [v9 description];
  unint64_t v13 = [v12 length];
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  unint64_t v41 = 0;
  v14 = [MEMORY[0x1E4F1CA48] array];
  queue = dispatch_queue_create("com.apple.biometrickit.analyticsFileLog", 0);
  if (!queue)
  {
    v27 = (__osLog ? __osLog : MEMORY[0x1E4F14500]);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "analyticsDispatchQueue";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v44 = (uint64_t (*)(uint64_t, uint64_t))&unk_1B3B370EE;
      *(_WORD *)v45 = 2080;
      *(void *)&v45[2] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
      *(_WORD *)&v45[10] = 1024;
      *(_DWORD *)&v45[12] = 936;
      _os_log_impl(&dword_1B3AF1000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (!v11)
  {
    v28 = (__osLog ? __osLog : MEMORY[0x1E4F14500]);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "prefix";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v44 = (uint64_t (*)(uint64_t, uint64_t))&unk_1B3B370EE;
      *(_WORD *)v45 = 2080;
      *(void *)&v45[2] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
      *(_WORD *)&v45[10] = 1024;
      *(_DWORD *)&v45[12] = 937;
      _os_log_impl(&dword_1B3AF1000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (analyticsOSLogNSDictionary_forEvent_toLogPath_withPrefix__onceToken != -1) {
    dispatch_once(&analyticsOSLogNSDictionary_forEvent_toLogPath_withPrefix__onceToken, &__block_literal_global_77);
  }
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_60);
  }
  if (isInternalBuild_isInternal && v10 && analyticsOSLogNSDictionary_forEvent_toLogPath_withPrefix__saveToFile)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v44 = __Block_byref_object_copy__1;
    *(void *)v45 = __Block_byref_object_dispose__1;
    v15 = NSString;
    v16 = [MEMORY[0x1E4F1C9C8] date];
    [v16 timeIntervalSince1970];
    *(void *)&v45[8] = [v15 stringWithFormat:@"%@/%d_%@.plist", v10, (int)v17, v33];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__BiometricSupportTools_analyticsOSLogNSDictionary_forEvent_toLogPath_withPrefix___block_invoke_85;
    block[3] = &unk_1E60681B8;
    v39 = buf;
    id v35 = v10;
    id v36 = v33;
    id v37 = v11;
    id v38 = v9;
    dispatch_async(queue, block);

    _Block_object_dispose(buf, 8);
  }
  if (v13)
  {
    unint64_t v18 = 0;
    do
    {
      objc_msgSend(v12, "getParagraphStart:end:contentsEnd:forRange:", &v42, &v41, &v40, v18, 0);
      v19 = objc_msgSend(v12, "substringWithRange:", v42, v40 - v42);
      [v14 addObject:v19];

      unint64_t v18 = v41;
    }
    while (v41 < v13);
  }
  v29 = v10;
  v30 = v9;
  unint64_t v32 = [v14 count] / 0x19uLL + 1;
  v20 = [MEMORY[0x1E4F28E78] string];
  if ([v14 count])
  {
    unint64_t v21 = 0;
    uint64_t v22 = 1;
    do
    {
      v23 = [v14 objectAtIndexedSubscript:v21];
      [v20 appendString:v23];

      [v20 appendString:@"\n"];
      if (v22 - 1 < v21 / 0x19)
      {
        if (__osLog) {
          v24 = __osLog;
        }
        else {
          v24 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413314;
          *(void *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v33;
          *(_WORD *)&buf[22] = 2048;
          v44 = (uint64_t (*)(uint64_t, uint64_t))v22;
          *(_WORD *)v45 = 2048;
          *(void *)&v45[2] = v32;
          *(_WORD *)&v45[10] = 2112;
          *(void *)&v45[12] = v20;
          _os_log_impl(&dword_1B3AF1000, v24, OS_LOG_TYPE_DEBUG, "%@: sendEvent: %@ (print %ld of %ld): \n%@\n", buf, 0x34u);
        }
        uint64_t v25 = [MEMORY[0x1E4F28E78] string];

        ++v22;
        v20 = (void *)v25;
      }
      ++v21;
    }
    while (v21 < [v14 count]);
  }
  else
  {
    uint64_t v22 = 1;
  }
  if (__osLog) {
    v26 = __osLog;
  }
  else {
    v26 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v33;
    *(_WORD *)&buf[22] = 2048;
    v44 = (uint64_t (*)(uint64_t, uint64_t))v22;
    *(_WORD *)v45 = 2048;
    *(void *)&v45[2] = v32;
    *(_WORD *)&v45[10] = 2112;
    *(void *)&v45[12] = v20;
    _os_log_impl(&dword_1B3AF1000, v26, OS_LOG_TYPE_DEBUG, "%@: sendEvent: %@ (print %ld of %ld): \n%@\n", buf, 0x34u);
  }
}

void __82__BiometricSupportTools_analyticsOSLogNSDictionary_forEvent_toLogPath_withPrefix___block_invoke()
{
  id v0 = +[BioUserDefaults sharedInstance];
  analyticsOSLogNSDictionary_forEvent_toLogPath_withPrefix__saveToFile = [v0 BOOLForKey:@"analyticsSaveToFile"];
}

void __82__BiometricSupportTools_analyticsOSLogNSDictionary_forEvent_toLogPath_withPrefix___block_invoke_85(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v3 = [v2 fileExistsAtPath:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  if (v3)
  {
    v4 = NSString;
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSince1970];
    uint64_t v8 = [v4 stringWithFormat:@"%@/%d_%@.plist", v5, ((int)v7 + 1), *(void *)(a1 + 40)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  id v11 = MEMORY[0x1E4F14500];
  if (__osLog) {
    v12 = __osLog;
  }
  else {
    v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    unint64_t v13 = *(const char **)(a1 + 48);
    v15 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    *(_DWORD *)buf = 138412802;
    unint64_t v18 = v13;
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    __int16 v21 = 2112;
    uint64_t v22 = v15;
    _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEBUG, "%@: write event: %@ to file: %@\n", buf, 0x20u);
  }
  if (([*(id *)(a1 + 56) writeToFile:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) atomically:1] & 1) == 0)
  {
    if (__osLog) {
      v16 = __osLog;
    }
    else {
      v16 = v11;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      unint64_t v18 = "[dict writeToFile:filePath atomically:__objc_yes]";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      uint64_t v22 = &unk_1B3B370EE;
      __int16 v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricSupportTools.m";
      __int16 v25 = 1024;
      int v26 = 958;
      _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
}

@end