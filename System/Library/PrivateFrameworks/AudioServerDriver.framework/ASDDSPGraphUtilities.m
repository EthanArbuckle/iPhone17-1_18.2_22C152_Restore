@interface ASDDSPGraphUtilities
+ (BOOL)startInjectingBoxes:(id)a3 inGraph:(id)a4 error:(id *)a5;
+ (BOOL)startRecordingAllBoxesInGraph:(id)a3 fromStream:(id)a4 toDirectory:(id)a5 withType:(int64_t)a6 error:(id *)a7;
+ (BOOL)startRecordingBoxes:(id)a3 inGraph:(id)a4 fromStream:(id)a5 toDirectory:(id)a6 withType:(int64_t)a7 andMode:(int64_t)a8 error:(id *)a9;
+ (BOOL)startRecordingBoxes:(id)a3 inGraph:(id)a4 fromStream:(id)a5 toDirectory:(id)a6 withType:(int64_t)a7 error:(id *)a8;
+ (BOOL)startRecordingBoxes:(id)a3 inGraph:(id)a4 toDirectory:(id)a5 error:(id *)a6;
+ (BOOL)startRecordingBoxes:(id)a3 inGraph:(id)a4 toDirectory:(id)a5 withMode:(int64_t)a6 error:(id *)a7;
+ (BOOL)stopInjectingBoxesInGraph:(id)a3;
+ (BOOL)stopRecordingBoxesInGraph:(id)a3;
+ (optional<AudioCapturerOptions>)getCapturerOptions:(int64_t)a3;
@end

@implementation ASDDSPGraphUtilities

+ (BOOL)startRecordingBoxes:(id)a3 inGraph:(id)a4 toDirectory:(id)a5 error:(id *)a6
{
  return [a1 startRecordingBoxes:a3 inGraph:a4 toDirectory:a5 withMode:0 error:a6];
}

+ (BOOL)startRecordingBoxes:(id)a3 inGraph:(id)a4 toDirectory:(id)a5 withMode:(int64_t)a6 error:(id *)a7
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v46 = a3;
  id v11 = a4;
  id v48 = a5;
  v49 = v11;
  +[ASDDSPGraphUtilities stopRecordingBoxesInGraph:v11];
  v12 = [MEMORY[0x263F08850] defaultManager];
  int v13 = [v12 createDirectoryAtPath:v48 withIntermediateDirectories:1 attributes:0 error:a7];

  if (v13)
  {
    id v42 = objc_alloc_init(MEMORY[0x263F08790]);
    [v42 setDateFormat:@"yyyy-MM-dd-HHmmss"];
    v14 = [MEMORY[0x263EFF910] date];
    v47 = [v42 stringFromDate:v14];

    uint64_t v15 = +[ASDDSPGraphUtilities getCapturerOptions:a6];
    unsigned __int8 v17 = v16;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v46;
    uint64_t v18 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (!v18)
    {
      char v35 = 1;
      char v20 = 1;
      goto LABEL_28;
    }
    uint64_t v45 = *(void *)v51;
    uint64_t v19 = v17;
    char v20 = 1;
    while (1)
    {
      uint64_t v43 = v18;
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v51 != v45) {
          objc_enumerationMutation(obj);
        }
        v22 = [v49 boxWithName:*(void *)(*((void *)&v50 + 1) + 8 * i)];
        v23 = v22;
        if (v22)
        {
          uint64_t v24 = [v22 numOutputs] ? objc_msgSend(v23, "numOutputs") : objc_msgSend(v23, "numInputs");
          uint64_t v25 = v24;
          if (v24 >= 1)
          {
            uint64_t v26 = 0;
            while (v19)
            {
              if ((v15 & 4) != 0)
              {
                v27 = NSString;
                v28 = [v49 name];
                v29 = [v23 name];
                v30 = [v27 stringWithFormat:@"%@/%@_%@_bus%d.caf", v48, v28, v29, v26];

                char v31 = [v23 startRecordingPort:v26 toFile:v30 withAudioCapturerOptions:v15];
LABEL_17:
                char v20 = v31;
              }
              if (a7 && (v20 & 1) == 0)
              {
                uint64_t v56 = *MEMORY[0x263F08320];
                v37 = NSString;
                v38 = [v23 name];
                v39 = [v37 stringWithFormat:@"%@ startRecordingPort was unsuccessful", v38];
                v57 = v39;
                v40 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];

                *a7 = [MEMORY[0x263F087E8] errorWithDomain:@"ASDDSPGraphUtilities" code:-1 userInfo:v40];

                char v35 = 0;
                goto LABEL_28;
              }
              if (v25 == ++v26) {
                goto LABEL_21;
              }
            }
            v32 = NSString;
            v33 = [v49 name];
            v34 = [v23 name];
            v30 = [v32 stringWithFormat:@"%@/%@_%@_bus%d_%@.caf", v48, v33, v34, v26, v47];

            char v31 = [v23 startRecordingPort:v26 toFile:v30];
            goto LABEL_17;
          }
        }
LABEL_21:
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
      char v35 = 1;
      if (!v18)
      {
LABEL_28:

        if (v35)
        {
          BOOL v36 = v20 & 1;
          goto LABEL_31;
        }
LABEL_30:
        BOOL v36 = 0;
        goto LABEL_31;
      }
    }
  }
  BOOL v36 = 0;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v55 = v48;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed to create path at: %@ for audio DSP captures.", buf, 0xCu);
    goto LABEL_30;
  }
LABEL_31:

  return v36;
}

+ (BOOL)startRecordingAllBoxesInGraph:(id)a3 fromStream:(id)a4 toDirectory:(id)a5 withType:(int64_t)a6 error:(id *)a7
{
  int64_t v21 = a6;
  v22 = a7;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v14 = [v10 boxes];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v17), "name", v21, v22);
        [v13 addObject:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  char v19 = [a1 startRecordingBoxes:v13 inGraph:v10 fromStream:v11 toDirectory:v12 withType:v21 error:v22];
  return v19;
}

+ (BOOL)startRecordingBoxes:(id)a3 inGraph:(id)a4 fromStream:(id)a5 toDirectory:(id)a6 withType:(int64_t)a7 error:(id *)a8
{
  return [a1 startRecordingBoxes:a3 inGraph:a4 fromStream:a5 toDirectory:a6 withType:a7 andMode:0 error:a8];
}

+ (BOOL)startRecordingBoxes:(id)a3 inGraph:(id)a4 fromStream:(id)a5 toDirectory:(id)a6 withType:(int64_t)a7 andMode:(int64_t)a8 error:(id *)a9
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  if (a7 == 1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Start Recording Boxes with AudioDebugTypeReinitializeGraph...", (uint8_t *)&v23, 2u);
    }
    int v20 = [v17 isRunning];
    if (v20)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DSP stream was running, suspend processing to reinitialize graph...", (uint8_t *)&v23, 2u);
      }
      [v17 suspendProcessing];
    }
    int v21 = [v16 initialized];
    if (v21)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Uninitializing graph", (uint8_t *)&v23, 2u);
      }
      [v16 uninitialize];
    }
    char v19 = [a1 startRecordingBoxes:v15 inGraph:v16 toDirectory:v18 withMode:a8 error:a9];
    if (v21)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Reinitializing graph", (uint8_t *)&v23, 2u);
      }
      if ([v16 initialize])
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 138412290;
          id v24 = v15;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Started recording %@", (uint8_t *)&v23, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          +[ASDDSPGraphUtilities startRecordingBoxes:inGraph:fromStream:toDirectory:withType:andMode:error:]();
        }
        +[ASDDSPGraphUtilities stopRecordingBoxesInGraph:v16];
        if (([v16 initialize] & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          +[ASDDSPGraphUtilities startRecordingBoxes:inGraph:fromStream:toDirectory:withType:andMode:error:]();
        }
      }
    }
    if (v20)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DSP stream was running, resume processing after reinitialized graph...", (uint8_t *)&v23, 2u);
      }
      [v17 resumeProcessing];
    }
  }
  else if (a7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[ASDDSPGraphUtilities startRecordingBoxes:inGraph:fromStream:toDirectory:withType:andMode:error:](a7);
    }
    char v19 = 0;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Start Recording Boxes with AudioDebugTypeKeepGraphInitialized...", (uint8_t *)&v23, 2u);
    }
    char v19 = [a1 startRecordingBoxes:v15 inGraph:v16 toDirectory:v18 error:a9];
  }

  return v19;
}

+ (BOOL)stopRecordingBoxesInGraph:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = objc_msgSend(a3, "boxes", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v7 numOutputs]) {
          uint64_t v8 = [v7 numOutputs];
        }
        else {
          uint64_t v8 = [v7 numInputs];
        }
        uint64_t v9 = v8;
        if (v8 >= 1)
        {
          uint64_t v10 = 0;
          do
            [v7 stopRecordingPort:v10++];
          while (v9 != v10);
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  return 1;
}

+ (BOOL)startInjectingBoxes:(id)a3 inGraph:(id)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v27 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v42 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v29;
    uint64_t v10 = &_os_log_internal;
    *(void *)&long long v8 = 136315138;
    long long v25 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "componentsSeparatedByString:", @":", v25);
        if ((unint64_t)[v12 count] >= 3)
        {
          long long v13 = [v12 objectAtIndexedSubscript:0];
          long long v14 = [v12 objectAtIndexedSubscript:1];
          int v15 = [v14 intValue];

          id v16 = [v12 objectAtIndexedSubscript:2];
          if ([v12 count] == 4)
          {
            uint64_t v17 = [v12 objectAtIndexedSubscript:3];
            uint64_t v18 = [v17 BOOLValue];
          }
          else
          {
            uint64_t v18 = 0;
          }
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            char v19 = [v27 name];
            *(_DWORD *)buf = 138413314;
            uint64_t v33 = (uint64_t)v19;
            __int16 v34 = 2112;
            char v35 = v13;
            __int16 v36 = 1024;
            int v37 = v15;
            __int16 v38 = 2112;
            v39 = v16;
            __int16 v40 = 1024;
            int v41 = v18;
            _os_log_impl(&dword_225CD5000, v10, OS_LOG_TYPE_DEFAULT, "Injecting file to DSP graph: %@, box: %@, bus: %d, filePath: %@, shouldLoop: %d", buf, 0x2Cu);
          }
          int v20 = [v27 boxWithName:v13];
          int v21 = v20;
          if (v20)
          {
            if (([v20 startInjectingPort:v15 toFile:v16 shouldLoop:v18] & 1) == 0)
            {

              BOOL v23 = 0;
              goto LABEL_21;
            }
          }
          else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v22 = [v13 UTF8String];
            *(_DWORD *)buf = v25;
            uint64_t v33 = v22;
            _os_log_impl(&dword_225CD5000, v10, OS_LOG_TYPE_DEFAULT, "Box %s doesn't exist in graph", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v42 count:16];
    }
    while (v7);
  }
  BOOL v23 = 1;
LABEL_21:

  return v23;
}

+ (BOOL)stopInjectingBoxesInGraph:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = objc_msgSend(a3, "boxes", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v7 numOutputs]) {
          uint64_t v8 = [v7 numOutputs];
        }
        else {
          uint64_t v8 = [v7 numInputs];
        }
        uint64_t v9 = v8;
        if (v8 >= 1)
        {
          uint64_t v10 = 0;
          do
            [v7 stopInjectingPort:v10++];
          while (v9 != v10);
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  return 1;
}

+ (optional<AudioCapturerOptions>)getCapturerOptions:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    BOOL v4 = 0;
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = qword_225D3B270[a3 - 1] | 4;
    BOOL v4 = 1;
  }
  result.var1 = v4;
  result.var0 = ($9006752AC5E43A2541EABBA7F54003FC)v3;
  return result;
}

+ (void)startRecordingBoxes:(uint64_t)a1 inGraph:fromStream:toDirectory:withType:andMode:error:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "The ASDDSPGraphAudioDebugType provided: %ld was invalid!", (uint8_t *)&v1, 0xCu);
}

+ (void)startRecordingBoxes:inGraph:fromStream:toDirectory:withType:andMode:error:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed reinitialization again after disabling recording of boxes", v0, 2u);
}

+ (void)startRecordingBoxes:inGraph:fromStream:toDirectory:withType:andMode:error:.cold.3()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed reinitialization with recording of boxes enabled", v0, 2u);
}

@end