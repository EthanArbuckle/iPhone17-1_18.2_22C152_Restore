@interface HapticDictionaryReader
- (BOOL)parseEventsAndParameters:(id)a3 withBaseURL:(id)a4 reply:(id)a5;
- (id)parseConfiguration:(id)a3 error:(id *)a4;
- (id)parseEvent:(id)a3 withBaseURL:(id)a4;
- (id)parseEventParams:(id)a3;
- (id)parseParam:(id)a3;
- (id)parseParamCurve:(id)a3;
- (id)parseParamCurveControlPoints:(id)a3;
- (id)readAndVerifyVersion:(id)a3 error:(id *)a4;
- (id)scanForEmbeddedResources:(id)a3;
@end

@implementation HapticDictionaryReader

- (id)readAndVerifyVersion:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKey:CHHapticPatternKeyVersion];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (kHAPIScope)
    {
      v11 = *(id *)kHAPIScope;
      if (!v11)
      {
LABEL_18:
        LODWORD(v12) = 1.0;
        id v14 = [NSNumber numberWithFloat:v12];
LABEL_19:
        v15 = v14;
        goto LABEL_20;
      }
    }
    else
    {
      v11 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315650;
      v21 = "HapticDictionaryReader.mm";
      __int16 v22 = 1024;
      int v23 = 38;
      __int16 v24 = 2080;
      v25 = "-[HapticDictionaryReader readAndVerifyVersion:error:]";
      _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: WARNING: Missing or malformed version key - assuming v1.0", (uint8_t *)&v20, 0x1Cu);
    }

    goto LABEL_18;
  }
  [v6 floatValue];
  float v8 = v7;
  if (v7 <= 1.1 && v7 >= 1.0)
  {
    if (kHAPIScope)
    {
      if (*(unsigned char *)(kHAPIScope + 8))
      {
        v17 = *(id *)kHAPIScope;
        if (v17)
        {
          v18 = v17;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            int v20 = 136315906;
            v21 = "HapticDictionaryReader.mm";
            __int16 v22 = 1024;
            int v23 = 48;
            __int16 v24 = 2080;
            v25 = "-[HapticDictionaryReader readAndVerifyVersion:error:]";
            __int16 v26 = 2048;
            double v27 = v8;
            _os_log_impl(&dword_1BA902000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Pattern version %.1f", (uint8_t *)&v20, 0x26u);
          }
        }
      }
    }
    id v14 = v6;
    goto LABEL_19;
  }
  if (!kHAPIScope)
  {
    v10 = MEMORY[0x1E4F14500];
    id v19 = MEMORY[0x1E4F14500];
    goto LABEL_31;
  }
  v10 = *(id *)kHAPIScope;
  if (v10)
  {
LABEL_31:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315906;
      v21 = "HapticDictionaryReader.mm";
      __int16 v22 = 1024;
      int v23 = 44;
      __int16 v24 = 2080;
      v25 = "-[HapticDictionaryReader readAndVerifyVersion:error:]";
      __int16 v26 = 2048;
      double v27 = v8;
      _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unsupported version number: %.1f", (uint8_t *)&v20, 0x26u);
    }
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4809 userInfo:0];
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_20:

  return v15;
}

- (id)parseConfiguration:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = [v4 objectForKey:CHHapticPatternKeyConfiguration];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__HapticDictionaryReader_parseConfiguration_error___block_invoke;
  v10[3] = &unk_1E622DEB0;
  id v7 = v5;
  id v11 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];

  id v8 = v7;

  return v8;
}

void __51__HapticDictionaryReader_parseConfiguration_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:CHHapticPatternKeyLocality])
  {
    id v7 = v6;
    if ([v7 length])
    {
      if (kHAPIScope)
      {
        if (*(unsigned char *)(kHAPIScope + 8))
        {
          id v8 = *(id *)kHAPIScope;
          if (v8)
          {
            v9 = v8;
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            {
              int v23 = 136315906;
              __int16 v24 = "HapticDictionaryReader.mm";
              __int16 v25 = 1024;
              int v26 = 64;
              __int16 v27 = 2080;
              uint64_t v28 = "-[HapticDictionaryReader parseConfiguration:error:]_block_invoke";
              __int16 v29 = 2112;
              id v30 = v7;
              _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Pattern Locality: '%@'", (uint8_t *)&v23, 0x26u);
            }
          }
        }
      }
      [*(id *)(a1 + 32) setObject:v7 forKey:@"Locality"];
    }
LABEL_43:

    goto LABEL_44;
  }
  if ([v5 isEqualToString:CHHapticPatternKeyPriority])
  {
    id v10 = v6;
    if ([v10 length])
    {
      if (kHAPIScope)
      {
        if (*(unsigned char *)(kHAPIScope + 8))
        {
          id v11 = *(id *)kHAPIScope;
          if (v11)
          {
            double v12 = v11;
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              int v23 = 136315906;
              __int16 v24 = "HapticDictionaryReader.mm";
              __int16 v25 = 1024;
              int v26 = 71;
              __int16 v27 = 2080;
              uint64_t v28 = "-[HapticDictionaryReader parseConfiguration:error:]_block_invoke";
              __int16 v29 = 2112;
              id v30 = v10;
              _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Pattern Priority: '%@'", (uint8_t *)&v23, 0x26u);
            }
          }
        }
      }
      [*(id *)(a1 + 32) setObject:v10 forKey:@"Priority"];
    }
    goto LABEL_43;
  }
  if ([v5 isEqualToString:CHHapticPatternKeyHapticPowerUsage])
  {
    id v13 = v6;
    if ([v13 length])
    {
      if (kHAPIScope)
      {
        if (*(unsigned char *)(kHAPIScope + 8))
        {
          id v14 = *(id *)kHAPIScope;
          if (v14)
          {
            v15 = v14;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              int v23 = 136315906;
              __int16 v24 = "HapticDictionaryReader.mm";
              __int16 v25 = 1024;
              int v26 = 78;
              __int16 v27 = 2080;
              uint64_t v28 = "-[HapticDictionaryReader parseConfiguration:error:]_block_invoke";
              __int16 v29 = 2112;
              id v30 = v13;
              _os_log_impl(&dword_1BA902000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Pattern HapticPowerUsage: '%@'", (uint8_t *)&v23, 0x26u);
            }
          }
        }
      }
      [*(id *)(a1 + 32) setObject:v13 forKey:@"HapticPowerUsage"];
    }
    goto LABEL_43;
  }
  if ([v5 isEqualToString:CHHapticPatternKeyAudioPowerUsage])
  {
    id v16 = v6;
    if ([v16 length])
    {
      if (kHAPIScope)
      {
        if (*(unsigned char *)(kHAPIScope + 8))
        {
          v17 = *(id *)kHAPIScope;
          if (v17)
          {
            v18 = v17;
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              int v23 = 136315906;
              __int16 v24 = "HapticDictionaryReader.mm";
              __int16 v25 = 1024;
              int v26 = 85;
              __int16 v27 = 2080;
              uint64_t v28 = "-[HapticDictionaryReader parseConfiguration:error:]_block_invoke";
              __int16 v29 = 2112;
              id v30 = v16;
              _os_log_impl(&dword_1BA902000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Pattern AudioPowerUsage: '%@'", (uint8_t *)&v23, 0x26u);
            }
          }
        }
      }
      [*(id *)(a1 + 32) setObject:v16 forKey:@"AudioPowerUsage"];
    }
    goto LABEL_43;
  }
  if ([v5 isEqualToString:CHHapticPatternKeyUsageCategory])
  {
    id v19 = v6;
    if ([v19 length])
    {
      v21 = CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, v20);
      __int16 v22 = v21;
      if (v21 && os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 136315906;
        __int16 v24 = "HapticDictionaryReader.mm";
        __int16 v25 = 1024;
        int v26 = 92;
        __int16 v27 = 2080;
        uint64_t v28 = "-[HapticDictionaryReader parseConfiguration:error:]_block_invoke";
        __int16 v29 = 2112;
        id v30 = v19;
        _os_log_impl(&dword_1BA902000, v22, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Pattern UsageCategory: '%@'", (uint8_t *)&v23, 0x26u);
      }

      [*(id *)(a1 + 32) setObject:v19 forKey:@"UsageCategory"];
    }
    goto LABEL_43;
  }
LABEL_44:
}

- (id)scanForEmbeddedResources:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [a3 objectForKey:CHHapticPatternKeyPattern];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  id v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __51__HapticDictionaryReader_scanForEmbeddedResources___block_invoke;
        v10[3] = &unk_1E622DFF0;
        void v10[4] = &v15;
        [v7 enumerateKeysAndObjectsUsingBlock:v10];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v21 count:16];
    }
    while (v4);
  }

  id v8 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v8;
}

void __51__HapticDictionaryReader_scanForEmbeddedResources___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([a2 isEqualToString:CHHapticPatternKeyEvent])
  {
    id v6 = v5;
    id v7 = [v6 objectForKey:CHHapticPatternKeyEventWaveformPath];
    if (!v7)
    {
LABEL_20:

      goto LABEL_21;
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    long long v11 = [v6 objectForKey:CHHapticPatternKeyEventWaveformUseVolumeEnvelope];
    if (v11)
    {
      long long v12 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v11 forKey:CHHapticAudioResourceKeyUseVolumeEnvelope];
    }
    else
    {
      long long v12 = 0;
    }
    long long v13 = [v6 objectForKey:CHHapticPatternKeyEventWaveformLoopEnabled];
    if (v13)
    {
      if (v12)
      {
        [v12 setObject:v13 forKeyedSubscript:CHHapticAudioResourceKeyLoopEnabled];
      }
      else
      {
        long long v12 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v13 forKey:CHHapticAudioResourceKeyLoopEnabled];
      }
    }
    if (kHAPIScope)
    {
      long long v14 = *(id *)kHAPIScope;
      if (!v14)
      {
LABEL_19:
        id v16 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        uint64_t v17 = [CHEmbeddedAudioResourceInfo alloc];
        v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:0];
        id v19 = [(CHEmbeddedAudioResourceInfo *)v17 initWithURL:v18 options:v12];
        [v16 addObject:v19];

        goto LABEL_20;
      }
    }
    else
    {
      long long v14 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v20 = 136316162;
      v21 = "HapticDictionaryReader.mm";
      __int16 v22 = 1024;
      int v23 = 136;
      __int16 v24 = 2080;
      __int16 v25 = "-[HapticDictionaryReader scanForEmbeddedResources:]_block_invoke";
      __int16 v26 = 2112;
      __int16 v27 = v7;
      __int16 v28 = 2112;
      __int16 v29 = v12;
      _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Adding embedded audio resource path '%@', options '%@'", (uint8_t *)&v20, 0x30u);
    }

    goto LABEL_19;
  }
LABEL_21:
}

- (BOOL)parseEventsAndParameters:(id)a3 withBaseURL:(id)a4 reply:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v26 = a4;
  id v24 = a5;
  int v23 = v8;
  uint64_t v9 = [v8 objectForKey:CHHapticPatternKeyPattern];
  __int16 v22 = v9;
  if (v9)
  {
    id v10 = 0;
    goto LABEL_11;
  }
  if (!kHAPIScope)
  {
    long long v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
    goto LABEL_7;
  }
  long long v11 = *(id *)kHAPIScope;
  if (v11)
  {
LABEL_7:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "HapticDictionaryReader.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 156;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[HapticDictionaryReader parseEventsAndParameters:withBaseURL:reply:]";
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = CHHapticPatternKeyPattern;
      _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Pattern dictionary is missing '%@' key", buf, 0x26u);
    }
  }
  id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.CoreHaptics", -4814, 0, 0);
  (*((void (**)(id, void, void, void, void *))v24 + 2))(v24, 0, 0, 0, v10);
LABEL_11:
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__0;
  *(void *)&buf[32] = __Block_byref_object_dispose__0;
  id v51 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__0;
  v41 = __Block_byref_object_dispose__0;
  id v42 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v9;
  uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __69__HapticDictionaryReader_parseEventsAndParameters_withBaseURL_reply___block_invoke;
        v28[3] = &unk_1E622E018;
        v28[4] = self;
        id v29 = v26;
        id v30 = v27;
        uint64_t v31 = buf;
        v32 = &v37;
        [v16 enumerateKeysAndObjectsUsingBlock:v28];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v13);
  }

  if (![v27 count]
    && ![*(id *)(*(void *)&buf[8] + 40) count]
    && ![(id)v38[5] count])
  {
    if (kHAPIScope)
    {
      int v20 = *(id *)kHAPIScope;
      if (!v20)
      {
LABEL_30:
        v18 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.CoreHaptics", -4814, 0, v22);

        (*((void (**)(id, void, void, void, void *))v24 + 2))(v24, 0, 0, 0, v18);
        BOOL v17 = 0;
        goto LABEL_22;
      }
    }
    else
    {
      int v20 = MEMORY[0x1E4F14500];
      id v21 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v43 = 136315650;
      v44 = "HapticDictionaryReader.mm";
      __int16 v45 = 1024;
      int v46 = 196;
      __int16 v47 = 2080;
      v48 = "-[HapticDictionaryReader parseEventsAndParameters:withBaseURL:reply:]";
      _os_log_impl(&dword_1BA902000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Empty pattern", v43, 0x1Cu);
    }

    goto LABEL_30;
  }
  (*((void (**)(id, id, void, uint64_t, void))v24 + 2))(v24, v27, *(void *)(*(void *)&buf[8] + 40), v38[5], 0);
  BOOL v17 = 1;
  v18 = v10;
LABEL_22:
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(buf, 8);
  return v17;
}

void __69__HapticDictionaryReader_parseEventsAndParameters_withBaseURL_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if ([v13 isEqualToString:CHHapticPatternKeyEvent])
  {
    id v6 = [*(id *)(a1 + 32) parseEvent:v5 withBaseURL:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) addObject:v6];
  }
  else if ([v13 isEqualToString:CHHapticPatternKeyParameter])
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    id v6 = [*(id *)(a1 + 32) parseParam:v5];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v6];
  }
  else
  {
    if (![v13 isEqualToString:CHHapticPatternKeyParameterCurve]) {
      goto LABEL_12;
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    id v6 = [*(id *)(a1 + 32) parseParamCurve:v5];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v6];
  }

LABEL_12:
}

- (id)parseEvent:(id)a3 withBaseURL:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = (NSURL *)a4;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = __Block_byref_object_copy__0;
  v53 = __Block_byref_object_dispose__0;
  id v54 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  int v46 = __Block_byref_object_copy__0;
  __int16 v47 = __Block_byref_object_dispose__0;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__0;
  v41 = __Block_byref_object_dispose__0;
  id v42 = 0;
  uint64_t v33 = 0;
  long long v34 = (double *)&v33;
  uint64_t v35 = 0x2020000000;
  unint64_t v36 = 0xBFF0000000000000;
  uint64_t v29 = 0;
  id v30 = (double *)&v29;
  uint64_t v31 = 0x2020000000;
  unint64_t v32 = 0xBFF0000000000000;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __49__HapticDictionaryReader_parseEvent_withBaseURL___block_invoke;
  v28[3] = &unk_1E622E040;
  v28[6] = &v33;
  v28[7] = &v29;
  v28[4] = self;
  void v28[5] = &v49;
  v28[8] = &v37;
  v28[9] = &v43;
  [a3 enumerateKeysAndObjectsUsingBlock:v28];
  id v7 = (void *)v50[5];
  if (!v7)
  {
    if (kHAPIScope)
    {
      uint64_t v8 = *(id *)kHAPIScope;
      if (!v8)
      {
        int v9 = -4830;
        id v10 = @"Missing event type";
        uint64_t v11 = @"CoreHapticsMissingEventTypeException";
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v8 = MEMORY[0x1E4F14500];
      id v19 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v56 = "HapticDictionaryReader.mm";
      __int16 v57 = 1024;
      *(_DWORD *)v58 = 239;
      *(_WORD *)&v58[4] = 2080;
      *(void *)&v58[6] = "-[HapticDictionaryReader parseEvent:withBaseURL:]";
      _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Missing event type", buf, 0x1Cu);
    }
    int v9 = -4830;
    id v10 = @"Missing event type";
    uint64_t v11 = @"CoreHapticsMissingEventTypeException";
    goto LABEL_35;
  }
  if (v34[3] < 0.0)
  {
    if (kHAPIScope)
    {
      uint64_t v8 = *(id *)kHAPIScope;
      if (!v8)
      {
        int v9 = -4822;
        id v10 = @"Illegal or missing event time";
        uint64_t v11 = @"CoreHapticsInvalidEventTimeException";
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v8 = MEMORY[0x1E4F14500];
      id v20 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v56 = "HapticDictionaryReader.mm";
      __int16 v57 = 1024;
      *(_DWORD *)v58 = 243;
      *(_WORD *)&v58[4] = 2080;
      *(void *)&v58[6] = "-[HapticDictionaryReader parseEvent:withBaseURL:]";
      _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Illegal or missing event time", buf, 0x1Cu);
    }
    int v9 = -4822;
    id v10 = @"Illegal or missing event time";
    uint64_t v11 = @"CoreHapticsInvalidEventTimeException";
    goto LABEL_35;
  }
  double v12 = v30[3];
  if (v12 != -1.0 && v12 < 0.0)
  {
    if (kHAPIScope)
    {
      uint64_t v8 = *(id *)kHAPIScope;
      if (!v8)
      {
        int v9 = -4823;
        id v10 = @"Illegal event duration";
        uint64_t v11 = @"CoreHapticsInvalidEventDurationException";
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v8 = MEMORY[0x1E4F14500];
      id v21 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v56 = "HapticDictionaryReader.mm";
      __int16 v57 = 1024;
      *(_DWORD *)v58 = 247;
      *(_WORD *)&v58[4] = 2080;
      *(void *)&v58[6] = "-[HapticDictionaryReader parseEvent:withBaseURL:]";
      _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Illegal event duration", buf, 0x1Cu);
    }
    int v9 = -4823;
    id v10 = @"Illegal event duration";
    uint64_t v11 = @"CoreHapticsInvalidEventDurationException";
    goto LABEL_35;
  }
  if ([v7 isEqualToString:CHHapticEventTypeAudioCustom])
  {
    id v13 = (NSURL *)v44[5];
    if (!v13)
    {
      if (kHAPIScope)
      {
        uint64_t v8 = *(id *)kHAPIScope;
        if (!v8)
        {
          int v9 = -4830;
          id v10 = @"Missing or invalid audio resource path";
          uint64_t v11 = @"CoreHapticsBadEventEntryException";
LABEL_36:
          Haptic_RaiseException(&v11->isa, &v10->isa, v9);
        }
      }
      else
      {
        uint64_t v8 = MEMORY[0x1E4F14500];
        id v27 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v56 = "HapticDictionaryReader.mm";
        __int16 v57 = 1024;
        *(_DWORD *)v58 = 252;
        *(_WORD *)&v58[4] = 2080;
        *(void *)&v58[6] = "-[HapticDictionaryReader parseEvent:withBaseURL:]";
        _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Custom event is missing its audio resource path", buf, 0x1Cu);
      }
      int v9 = -4830;
      id v10 = @"Missing or invalid audio resource path";
      uint64_t v11 = @"CoreHapticsBadEventEntryException";
LABEL_35:

      goto LABEL_36;
    }
    FullURLPathFromURL(v13, v6);
    id v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      id v16 = CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v14);
      BOOL v17 = v16;
      if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v56 = "HapticDictionaryReader.mm";
        __int16 v57 = 1024;
        *(_DWORD *)v58 = 261;
        *(_WORD *)&v58[4] = 2080;
        *(void *)&v58[6] = "-[HapticDictionaryReader parseEvent:withBaseURL:]";
        _os_log_impl(&dword_1BA902000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Custom event's audio resource path cannot be resolved", buf, 0x1Cu);
      }

      Haptic_RaiseException(&cfstr_Corehapticsbad.isa, &cfstr_InvalidAudioRe.isa, -4830);
    }
    AudioResource::AudioResource((AudioResource *)buf, v15);
    if (AudioResource::verifyAudioFile(v18, 1)) {
      Haptic_RaiseException(&cfstr_Corehapticsinv_1.isa, &cfstr_InvalidAudioRe_0.isa, -4824);
    }
    id v26 = [CHHapticEvent alloc];
    ++self->_urlIndex;
    id v24 = -[CHHapticEvent initWithAudioResourceIndex:parameters:time:duration:](v26, "initWithAudioResourceIndex:parameters:time:duration:", v34[3], (double)*(unint64_t *)&v58[2] / *(double *)&v58[10]);
    AudioResource::~AudioResource((AudioResource *)buf);
  }
  else
  {
    __int16 v22 = [CHHapticEvent alloc];
    double v23 = v30[3];
    if (v23 == -1.0) {
      double v23 = 0.0;
    }
    id v24 = [(CHHapticEvent *)v22 initWithEventType:v50[5] parameters:v38[5] relativeTime:v34[3] duration:v23];
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v24;
}

void __49__HapticDictionaryReader_parseEvent_withBaseURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v17 = v5;
  if ([v17 isEqualToString:CHHapticPatternKeyEventType])
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = v6;
    id v9 = *(id *)(v7 + 40);
    *(void *)(v7 + 40) = v8;
LABEL_7:

    goto LABEL_8;
  }
  if (([v17 isEqualToString:CHHapticPatternKeyTime] & 1) != 0
    || [v17 isEqualToString:@"EventTime"])
  {
    id v9 = v6;
    [v9 floatValue];
    double v11 = v10;
    uint64_t v12 = *(void *)(a1 + 48);
LABEL_6:
    *(double *)(*(void *)(v12 + 8) + 24) = v11;
    goto LABEL_7;
  }
  if ([v17 isEqualToString:CHHapticPatternKeyEventDuration])
  {
    id v9 = v6;
    [v9 floatValue];
    double v11 = v13;
    uint64_t v12 = *(void *)(a1 + 56);
    goto LABEL_6;
  }
  if ([v17 isEqualToString:CHHapticPatternKeyEventParameters])
  {
    uint64_t v14 = [*(id *)(a1 + 32) parseEventParams:v6];
    uint64_t v15 = *(void *)(a1 + 64);
LABEL_17:
    uint64_t v16 = *(void *)(v15 + 8);
    id v9 = *(id *)(v16 + 40);
    *(void *)(v16 + 40) = v14;
    goto LABEL_7;
  }
  if ([v17 isEqualToString:CHHapticPatternKeyEventWaveformPath])
  {
    uint64_t v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:0];
    uint64_t v15 = *(void *)(a1 + 72);
    goto LABEL_17;
  }
LABEL_8:
}

- (id)parseEventParams:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v17;
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v8 = [v7 objectForKey:CHHapticPatternKeyParameterID];
        if (!v8)
        {
          if (kHAPIScope)
          {
            id v9 = *(id *)kHAPIScope;
            if (!v9) {
              goto LABEL_14;
            }
          }
          else
          {
            id v9 = MEMORY[0x1E4F14500];
            id v10 = MEMORY[0x1E4F14500];
          }
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            id v24 = "HapticDictionaryReader.mm";
            __int16 v25 = 1024;
            int v26 = 288;
            __int16 v27 = 2080;
            __int16 v28 = "-[HapticDictionaryReader parseEventParams:]";
            _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Event parameter has invalid or missing parameter ID", buf, 0x1Cu);
          }

LABEL_14:
          Haptic_RaiseException(&cfstr_Corehapticsbad_0.isa, &cfstr_EventParameter.isa, -4831);
        }
        double v11 = [v7 objectForKey:CHHapticPatternKeyParameterValue];
        if (!v11)
        {
          if (kHAPIScope)
          {
            uint64_t v12 = *(id *)kHAPIScope;
            if (!v12) {
              goto LABEL_23;
            }
          }
          else
          {
            uint64_t v12 = MEMORY[0x1E4F14500];
            id v13 = MEMORY[0x1E4F14500];
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            id v24 = "HapticDictionaryReader.mm";
            __int16 v25 = 1024;
            int v26 = 295;
            __int16 v27 = 2080;
            __int16 v28 = "-[HapticDictionaryReader parseEventParams:]";
            _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Event parameter has invalid or missing parameter value", buf, 0x1Cu);
          }

LABEL_23:
          Haptic_RaiseException(&cfstr_Corehapticsbad_0.isa, &cfstr_EventParameter_0.isa, -4831);
        }
        uint64_t v14 = [CHHapticEventParameter alloc];
        [v11 floatValue];
        uint64_t v15 = -[CHHapticEventParameter initWithParameterID:value:](v14, "initWithParameterID:value:", v8);
        [v3 addObject:v15];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v4);
  }

  return v3;
}

- (id)parseParam:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__0;
  __int16 v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  uint64_t v17 = 0;
  v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  unint64_t v20 = 0xBFF0000000000000;
  uint64_t v13 = 0;
  uint64_t v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__HapticDictionaryReader_parseParam___block_invoke;
  v12[3] = &unk_1E622E068;
  v12[4] = &v21;
  v12[5] = &v17;
  v12[6] = &v13;
  [v3 enumerateKeysAndObjectsUsingBlock:v12];
  if (!v22[5] || v18[3] == -1.0)
  {
    if (kHAPIScope)
    {
      uint64_t v7 = *(id *)kHAPIScope;
      if (!v7) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v9 = v22[5] == 0;
      *(_DWORD *)buf = 136315906;
      __int16 v28 = "HapticDictionaryReader.mm";
      if (v9) {
        id v10 = "type";
      }
      else {
        id v10 = "time";
      }
      __int16 v29 = 1024;
      int v30 = 330;
      __int16 v31 = 2080;
      unint64_t v32 = "-[HapticDictionaryReader parseParam:]";
      __int16 v33 = 2080;
      long long v34 = v10;
      _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Param is missing a %s", buf, 0x26u);
    }

LABEL_14:
    Haptic_RaiseException(&cfstr_Corehapticsbad_0.isa, &cfstr_ParameterHasIn.isa, -4831);
  }
  uint64_t v4 = [CHHapticDynamicParameter alloc];
  double v5 = v14[3];
  *(float *)&double v5 = v5;
  id v6 = [(CHHapticDynamicParameter *)v4 initWithParameterID:v22[5] value:v5 relativeTime:v18[3]];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v6;
}

void __37__HapticDictionaryReader_parseParam___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v14 = v5;
  if ([v14 isEqualToString:CHHapticPatternKeyParameterID])
  {
    uint64_t v7 = *(void *)(a1[4] + 8);
    id v8 = v6;
    id v9 = *(id *)(v7 + 40);
    *(void *)(v7 + 40) = v8;
LABEL_7:

    goto LABEL_8;
  }
  if (([v14 isEqualToString:CHHapticPatternKeyTime] & 1) != 0
    || [v14 isEqualToString:@"ParameterTime"])
  {
    id v9 = v6;
    [v9 floatValue];
    double v11 = v10;
    uint64_t v12 = a1[5];
LABEL_6:
    *(double *)(*(void *)(v12 + 8) + 24) = v11;
    goto LABEL_7;
  }
  if ([v14 isEqualToString:CHHapticPatternKeyParameterValue])
  {
    id v9 = v6;
    [v9 floatValue];
    double v11 = v13;
    uint64_t v12 = a1[6];
    goto LABEL_6;
  }
LABEL_8:
}

- (id)parseParamCurve:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__0;
  __int16 v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  uint64_t v17 = 0;
  v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  unint64_t v20 = 0xBFF0000000000000;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__HapticDictionaryReader_parseParamCurve___block_invoke;
  v10[3] = &unk_1E622E090;
  v10[6] = &v17;
  v10[7] = &v11;
  void v10[4] = self;
  void v10[5] = &v21;
  [a3 enumerateKeysAndObjectsUsingBlock:v10];
  if (!v22[5] || v18[3] == -1.0)
  {
    if (kHAPIScope)
    {
      id v5 = *(id *)kHAPIScope;
      if (!v5) {
        goto LABEL_14;
      }
    }
    else
    {
      id v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = v22[5] == 0;
      *(_DWORD *)buf = 136315906;
      __int16 v28 = "HapticDictionaryReader.mm";
      if (v7) {
        id v8 = "type";
      }
      else {
        id v8 = "time";
      }
      __int16 v29 = 1024;
      int v30 = 359;
      __int16 v31 = 2080;
      unint64_t v32 = "-[HapticDictionaryReader parseParamCurve:]";
      __int16 v33 = 2080;
      long long v34 = v8;
      _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Param is missing a %s", buf, 0x26u);
    }

LABEL_14:
    Haptic_RaiseException(&cfstr_Corehapticsbad_0.isa, &cfstr_Parametercurve.isa, -4831);
  }
  id v3 = [CHHapticParameterCurve alloc];
  uint64_t v4 = [(CHHapticParameterCurve *)v3 initWithParameterID:v22[5] controlPoints:v12[5] relativeTime:v18[3]];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v4;
}

void __42__HapticDictionaryReader_parseParamCurve___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  if ([v13 isEqualToString:CHHapticPatternKeyParameterID])
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = v6;
    id v9 = *(id *)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else if ([v13 isEqualToString:CHHapticPatternKeyTime])
  {
    id v9 = v6;
    [v9 floatValue];
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
  }
  else
  {
    if (![v13 isEqualToString:CHHapticPatternKeyParameterCurveControlPoints]) {
      goto LABEL_8;
    }
    uint64_t v11 = [*(id *)(a1 + 32) parseParamCurveControlPoints:v6];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(id *)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }

LABEL_8:
}

- (id)parseParamCurveControlPoints:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v21;
  uint64_t v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16, v21);
  if (v4)
  {
    uint64_t v5 = *(void *)v24;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v24 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v23 + 1) + 8 * v6);
      id v8 = [v7 objectForKey:CHHapticPatternKeyTime];
      if (!v8) {
        break;
      }
      id v9 = [v7 objectForKey:CHHapticPatternKeyParameterValue];
      if (!v9)
      {
        if (kHAPIScope)
        {
          uint64_t v17 = *(id *)kHAPIScope;
          if (!v17) {
            goto LABEL_24;
          }
        }
        else
        {
          uint64_t v17 = MEMORY[0x1E4F14500];
          id v19 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v28 = "HapticDictionaryReader.mm";
          __int16 v29 = 1024;
          int v30 = 378;
          __int16 v31 = 2080;
          unint64_t v32 = "-[HapticDictionaryReader parseParamCurveControlPoints:]";
          _os_log_impl(&dword_1BA902000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Parameter curve control point has invalid or missing value", buf, 0x1Cu);
        }

LABEL_24:
LABEL_25:

        id v16 = 0;
        goto LABEL_26;
      }
      float v10 = [CHHapticParameterCurveControlPoint alloc];
      [v8 doubleValue];
      double v12 = v11;
      [v9 floatValue];
      LODWORD(v14) = v13;
      uint64_t v15 = [(CHHapticParameterCurveControlPoint *)v10 initWithRelativeTime:v12 value:v14];
      [v3 addObject:v15];

      if (v4 == ++v6)
      {
        uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    if (kHAPIScope)
    {
      id v8 = *(id *)kHAPIScope;
      if (!v8) {
        goto LABEL_25;
      }
    }
    else
    {
      id v8 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v28 = "HapticDictionaryReader.mm";
      __int16 v29 = 1024;
      int v30 = 372;
      __int16 v31 = 2080;
      unint64_t v32 = "-[HapticDictionaryReader parseParamCurveControlPoints:]";
      _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Parameter curve control point has invalid or missing time", buf, 0x1Cu);
    }
    goto LABEL_24;
  }
LABEL_10:

  id v16 = v3;
LABEL_26:

  return v16;
}

@end