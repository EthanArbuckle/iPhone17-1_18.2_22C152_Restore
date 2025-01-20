@interface ANProcessAudio
+ (AudioComponentDescription)_lookupComponent:(SEL)a3;
+ (BOOL)_configureEngine:(id)a3 player:(id)a4 effect:(id)a5 sourceFile:(id)a6 error:(id *)a7;
+ (BOOL)_renderAudioTo:(id)a3 length:(int64_t)a4 engine:(id)a5 error:(id *)a6;
+ (BOOL)process:(id)a3 to:(id)a4 withOptions:(unint64_t)a5 error:(id *)a6;
+ (id)_ANAudioEffectToName:(unint64_t)a3;
+ (id)_lookupTunings:(unint64_t)a3;
@end

@implementation ANProcessAudio

+ (BOOL)process:(id)a3 to:(id)a4 withOptions:(unint64_t)a5 error:(id *)a6
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (a5)
  {
    v11 = [MEMORY[0x263EFF910] now];
    uint64_t v12 = [objc_alloc(MEMORY[0x263EF9380]) initForReading:v9 error:a6];
    if (!v12)
    {
      v35 = ANLogHandleAudioProcessor();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        id v36 = *a6;
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = &stru_26D2D46B0;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        __int16 v44 = 2112;
        id v45 = v36;
        _os_log_impl(&dword_220FAA000, v35, OS_LOG_TYPE_ERROR, "%@Failed to open file %@, %@", buf, 0x20u);
      }

      BOOL v34 = 0;
      goto LABEL_33;
    }
    v13 = (void *)v12;
    +[ANProcessAudio _lookupComponent:1];
    id v14 = objc_alloc(MEMORY[0x263EF9468]);
    memset(buf, 0, 20);
    uint64_t v15 = [v14 initWithAudioComponentDescription:buf];
    if (v15)
    {
      v16 = v15;
      v17 = objc_opt_new();
      v18 = objc_opt_new();
      if (+[ANProcessAudio _configureEngine:v18 player:v17 effect:v16 sourceFile:v13 error:a6])
      {
        v41 = v17;
        v42 = v11;
        id v19 = objc_alloc(MEMORY[0x263EF9380]);
        v20 = [v13 fileFormat];
        v21 = [v20 settings];
        v22 = (void *)[v19 initForWriting:v10 settings:v21 error:a6];

        v23 = ANLogHandleAudioProcessor();
        v24 = v23;
        if (v22)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v25 = [v22 length];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = &stru_26D2D46B0;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v25;
            _os_log_impl(&dword_220FAA000, v24, OS_LOG_TYPE_DEFAULT, "%@Ouput File Frames Before: %lld", buf, 0x16u);
          }

          +[ANProcessAudio _renderAudioTo:length:engine:error:](ANProcessAudio, "_renderAudioTo:length:engine:error:", v22, [v13 length], v18, a6);
          v26 = ANLogHandleAudioProcessor();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138413058;
            *(void *)&buf[4] = &stru_26D2D46B0;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v9;
            __int16 v44 = 2112;
            id v45 = v10;
            __int16 v46 = 2112;
            v47 = v18;
            _os_log_impl(&dword_220FAA000, v26, OS_LOG_TYPE_DEBUG, "%@Process file: %@ to %@ with engine %@", buf, 0x2Au);
          }

          v27 = ANLogHandleAudioProcessor();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = [MEMORY[0x263EFF910] date];
            [v28 timeIntervalSinceDate:v42];
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = &stru_26D2D46B0;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "+[ANProcessAudio process:to:withOptions:error:]";
            __int16 v44 = 2048;
            id v45 = v29;
            _os_log_impl(&dword_220FAA000, v27, OS_LOG_TYPE_INFO, "%@%s: took %f", buf, 0x20u);
          }
          [v41 stop];
          [v18 stop];
          [v18 detachNode:v41];
          [v18 detachNode:v16];

          v30 = (void *)[objc_alloc(MEMORY[0x263EF9380]) initForReading:v10 error:a6];
          v31 = ANLogHandleAudioProcessor();
          v32 = v31;
          if (v30)
          {
            v11 = v42;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v33 = [v30 length];
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = &stru_26D2D46B0;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v33;
              _os_log_impl(&dword_220FAA000, v32, OS_LOG_TYPE_DEFAULT, "%@Ouput File Frames After: %lld", buf, 0x16u);
            }

            v16 = 0;
            BOOL v34 = 1;
            goto LABEL_32;
          }
          v11 = v42;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = &stru_26D2D46B0;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = 0;
            _os_log_impl(&dword_220FAA000, v32, OS_LOG_TYPE_ERROR, "%@Failed to open output file for reading (post-processing) %@", buf, 0x16u);
          }

          v16 = 0;
        }
        else
        {
          v11 = v42;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = &stru_26D2D46B0;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = 0;
            _os_log_impl(&dword_220FAA000, v24, OS_LOG_TYPE_ERROR, "%@Failed to open output file %@", buf, 0x16u);
          }
        }
      }
      else
      {
        v38 = ANLogHandleAudioProcessor();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          id v39 = *a6;
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = &stru_26D2D46B0;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v39;
          _os_log_impl(&dword_220FAA000, v38, OS_LOG_TYPE_ERROR, "%@Could not configure the engine %@", buf, 0x16u);
        }
      }
    }
    else
    {

      v16 = ANLogHandleAudioProcessor();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v37 = +[ANProcessAudio _ANAudioEffectToName:1];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = &stru_26D2D46B0;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v37;
        _os_log_impl(&dword_220FAA000, v16, OS_LOG_TYPE_ERROR, "%@Could not find AudioUnit for %@", buf, 0x16u);
      }
    }
    BOOL v34 = 0;
LABEL_32:

LABEL_33:
    goto LABEL_34;
  }
  BOOL v34 = 0;
LABEL_34:

  return v34;
}

+ (BOOL)_configureEngine:(id)a3 player:(id)a4 effect:(id)a5 sourceFile:(id)a6 error:(id *)a7
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [v14 processingFormat];
  char v16 = [v11 enableManualRenderingMode:0 format:v15 maximumFrameCount:4096 error:a7];

  if (v16)
  {
    v40 = a7;
    v41 = v14;
    [v11 attachNode:v12];
    id v42 = v12;
    id v39 = v12;
    v17 = +[ANProcessAudio _lookupTunings:1];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v44 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v23 = [v17 objectForKeyedSubscript:v22];
          [v23 floatValue];
          int v25 = v24;
          v26 = [v13 AUAudioUnit];
          v27 = [v26 parameterTree];
          v28 = objc_msgSend(v27, "parameterWithAddress:", objc_msgSend(v22, "unsignedIntegerValue"));
          LODWORD(v29) = v25;
          [v28 setValue:v29];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v19);
    }
    [v11 attachNode:v13];
    id v14 = v41;
    v30 = [v41 processingFormat];
    [v11 connect:v39 to:v13 format:v30];

    v31 = v13;
    v32 = [v11 mainMixerNode];
    uint64_t v33 = [v41 processingFormat];
    [v11 connect:v31 to:v32 format:v33];

    [v39 scheduleFile:v41 atTime:0 completionHandler:0];
    char v34 = [v11 startAndReturnError:v40];
    if (v34)
    {
      [v39 play];
    }
    else
    {
      id v36 = ANLogHandleAudioProcessor();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v37 = *v40;
        *(_DWORD *)buf = 138412546;
        v49 = &stru_26D2D46B0;
        __int16 v50 = 2112;
        id v51 = v37;
        _os_log_impl(&dword_220FAA000, v36, OS_LOG_TYPE_ERROR, "%@Could not start the engine %@", buf, 0x16u);
      }
    }
    id v12 = v42;
  }
  else
  {
    v31 = ANLogHandleAudioProcessor();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v35 = *a7;
      *(_DWORD *)buf = 138412546;
      v49 = &stru_26D2D46B0;
      __int16 v50 = 2112;
      id v51 = v35;
      _os_log_impl(&dword_220FAA000, v31, OS_LOG_TYPE_ERROR, "%@Failed to configure for offline render mode %@", buf, 0x16u);
    }
    char v34 = 0;
  }

  return v34;
}

+ (AudioComponentDescription)_lookupComponent:(SEL)a3
{
  *(void *)&retstr->componentType = 0;
  *(void *)&retstr->componentManufacturer = 0;
  retstr->componentFlagsMask = 0;
  if (a4 == 1) {
    qmemcpy(retstr, "xfuamndllppa", 12);
  }
  return result;
}

+ (id)_lookupTunings:(unint64_t)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  if (a3 == 1)
  {
    v5 = &unk_26D2DBBE8;
    v6[0] = &unk_26D2DBD10;
    v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)_ANAudioEffectToName:(unint64_t)a3
{
  v3 = @"N/A";
  if (a3 == 1) {
    v3 = @"AppleAUNormalizer";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"None";
  }
}

+ (BOOL)_renderAudioTo:(id)a3 length:(int64_t)a4 engine:(id)a5 error:(id *)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = ANLogHandleAudioProcessor();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = &stru_26D2D46B0;
    __int16 v29 = 2048;
    int64_t v30 = a4;
    _os_log_impl(&dword_220FAA000, v11, OS_LOG_TYPE_DEFAULT, "%@Rendering Audio with length: %lld", buf, 0x16u);
  }

  id v12 = objc_alloc(MEMORY[0x263EF93B0]);
  id v13 = [v10 manualRenderingFormat];
  id v14 = objc_msgSend(v12, "initWithPCMFormat:frameCapacity:", v13, objc_msgSend(v10, "manualRenderingMaximumFrameCount"));

  id v15 = 0;
  while (1)
  {
    if ([v10 manualRenderingSampleTime] >= a4)
    {
      BOOL v21 = 1;
      goto LABEL_17;
    }
    unsigned int v16 = a4 - [v10 manualRenderingSampleTime];
    unsigned int v17 = [v14 frameCapacity];
    uint64_t v18 = v17 >= v16 ? v16 : v17;
    id v26 = v15;
    uint64_t v19 = [v10 renderOffline:v18 toBuffer:v14 error:&v26];
    id v20 = v26;

    BOOL v21 = v19 != 0;
    if (v19) {
      break;
    }
    id v25 = v20;
    uint64_t v22 = [v9 writeFromBuffer:v14 error:&v25];
    id v15 = v25;

    if ((v22 & 1) == 0)
    {
      v23 = ANLogHandleAudioProcessor();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v28 = &stru_26D2D46B0;
        __int16 v29 = 2112;
        int64_t v30 = (int64_t)v15;
        _os_log_impl(&dword_220FAA000, v23, OS_LOG_TYPE_ERROR, "%@error when writing out audio to file: %@", buf, 0x16u);
      }
      id v20 = v15;
      goto LABEL_16;
    }
  }
  v23 = ANLogHandleAudioProcessor();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v28 = &stru_26D2D46B0;
    __int16 v29 = 2112;
    int64_t v30 = (int64_t)v20;
    _os_log_impl(&dword_220FAA000, v23, OS_LOG_TYPE_ERROR, "%@error when rendering status: %@", buf, 0x16u);
  }
LABEL_16:

  id v15 = v20;
LABEL_17:

  if (a6) {
    *a6 = v15;
  }

  return v21;
}

@end