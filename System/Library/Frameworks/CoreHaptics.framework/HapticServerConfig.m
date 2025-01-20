@interface HapticServerConfig
- (BOOL)supportsAdvancedPatternPlayers;
- (BOOL)supportsAudioPlayback;
- (BOOL)supportsHapticPlayback;
- (BOOL)usingInternalHaptics;
- (HapticServerConfig)initWithHapticPlayer:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (NSDictionary)builtInAudioEventIDs;
- (NSString)currentLocality;
- (float)defaultHapticContinuousEventIntensity;
- (float)defaultHapticContinuousEventSharpness;
- (float)defaultHapticTransientEventIntensity;
- (float)defaultHapticTransientEventSharpness;
- (float)hapticContinuousTimeLimit;
- (id).cxx_construct;
- (vector<unsigned)hapticContinuousNonsustainedIDs;
- (vector<unsigned)hapticContinuousSustainedIDs;
- (vector<unsigned)hapticTransientIDs;
@end

@implementation HapticServerConfig

- (HapticServerConfig)initWithHapticPlayer:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v61 = a4;
  v66.receiver = self;
  v66.super_class = (Class)HapticServerConfig;
  v52 = [(HapticServerConfig *)&v66 init];
  if (!v52)
  {
    v10 = 0;
LABEL_74:
    v10 = v10;
    v46 = v10;
    goto LABEL_75;
  }
  uint64_t v7 = [v61 objectForKey:@"Locality"];
  uint64_t v8 = v7;
  if (!v7)
  {
    if (kHAPIScope)
    {
      v9 = *(id *)kHAPIScope;
      if (!v9)
      {
        v59 = @"Default";
        goto LABEL_18;
      }
    }
    else
    {
      v9 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    v59 = @"Default";
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "HapticServerConfig.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 37;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]";
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = @"Default";
    v12 = "%25s:%-5d %s: Engine not configured with a Locality - querying using '%@'";
    goto LABEL_16;
  }
  v59 = (__CFString *)v7;
  if (!kHAPIScope)
  {
    v9 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
    goto LABEL_11;
  }
  v9 = *(id *)kHAPIScope;
  if (v9)
  {
LABEL_11:
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:

      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "HapticServerConfig.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 40;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]";
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v8;
    v12 = "%25s:%-5d %s: Querying server for capabilities with '%@' Locality";
LABEL_16:
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, v12, buf, 0x26u);
    goto LABEL_17;
  }
LABEL_18:
  v14 = NSNumber;
  v15 = SecTaskCreateFromSelf(0);
  v16 = v15;
  if (v15)
  {
    CFBooleanRef v17 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v15, @"com.apple.private.allow-background-haptics", 0);
    CFBooleanRef v18 = v17;
    if (v17)
    {
      CFTypeID v19 = CFGetTypeID(v17);
      BOOL v20 = v19 == CFBooleanGetTypeID() && CFBooleanGetValue(v18) != 0;
      CFRelease(v18);
    }
    else
    {
      BOOL v20 = 0;
    }
    CFRelease(v16);
  }
  else
  {
    BOOL v20 = 0;
  }
  v53 = [v14 numberWithBool:v20];
  v21 = (void *)MEMORY[0x1E4F1CA60];
  v56 = [NSNumber numberWithBool:0];
  v55 = [NSNumber numberWithBool:0];
  v57 = [NSNumber numberWithBool:0];
  v54 = [NSNumber numberWithBool:0];
  v22 = [NSNumber numberWithUnsignedInt:0];
  v23 = [NSNumber numberWithFloat:0.0];
  v24 = [NSNumber numberWithFloat:0.0];
  v25 = [NSNumber numberWithFloat:0.0];
  v26 = [NSNumber numberWithFloat:0.0];
  v27 = [MEMORY[0x1E4F1C978] array];
  v28 = [MEMORY[0x1E4F1C978] array];
  v29 = [MEMORY[0x1E4F1C978] array];
  v30 = [MEMORY[0x1E4F1C9E8] dictionary];
  objc_msgSend(v21, "dictionaryWithObjectsAndKeys:", v59, @"RequestedLocality", v53, @"AllowBackgroundHaptics", v56, @"SupportsAudioPlayback", v55, @"SupportsHapticPlayback", v57, @"SupportsAdvancedPatternPlayers", v54, @"UsingInternalHaptics", v22, @"HapticContinuousTimeLimit", v23, @"HapticTransientDefaultIntensity", v24,
    @"HapticTransientDefaultSharpness",
    v25,
    @"HapticContinuousDefaultIntensity",
    v26,
    @"HapticContinuousDefaultSharpness",
    v27,
    @"HapticTransientEventIDs",
    v28,
    @"HapticContinuousSustainedEventIDs",
    v29,
    @"HapticContinuousNonsustainedEventIDs",
    v30,
    @"BuiltInAudioEventIDs",
  v31 = 0);

  v32 = [v61 objectForKey:@"Priority"];
  if (!v32)
  {
LABEL_44:
    v37 = [v61 objectForKey:@"HapticPowerUsage"];
    if (!v37) {
      goto LABEL_57;
    }
    if (kHAPIScope)
    {
      v38 = *(id *)kHAPIScope;
      if (!v38) {
        goto LABEL_52;
      }
    }
    else
    {
      v38 = MEMORY[0x1E4F14500];
      id v39 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "HapticServerConfig.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 88;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]";
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v37;
      _os_log_impl(&dword_1BA902000, v38, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Querying server for capabilities with HapticPowerUsage '%@'", buf, 0x26u);
    }

LABEL_52:
    if ([v37 containsString:@"LowPower"])
    {
      uint64_t v40 = 10;
LABEL_56:
      v41 = [NSNumber numberWithUnsignedInteger:v40];
      [v31 setObject:v41 forKey:@"RequestedPowerUsage"];

LABEL_57:
      v42 = [v61 objectForKey:@"UsageCategory"];
      if (!v42)
      {
LABEL_66:
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        *(void *)&buf[24] = __Block_byref_object_copy_;
        *(void *)&buf[32] = __Block_byref_object_dispose_;
        id v68 = 0;
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __61__HapticServerConfig_initWithHapticPlayer_withOptions_error___block_invoke;
        v62[3] = &unk_1E622DED8;
        v65 = buf;
        v10 = v52;
        v63 = v10;
        v64 = v59;
        [v60 queryServerCapabilities:v31 reply:v62];
        if (a5) {
          *a5 = *(id *)(*(void *)&buf[8] + 40);
        }
        if (*(void *)(*(void *)&buf[8] + 40))
        {

          v10 = 0;
        }

        _Block_object_dispose(buf, 8);
        int v45 = 0;
        goto LABEL_71;
      }
      if (kHAPIScope)
      {
        v43 = *(id *)kHAPIScope;
        if (!v43)
        {
LABEL_65:
          [v31 setObject:v42 forKey:@"RequestedUsageCategory"];
          goto LABEL_66;
        }
      }
      else
      {
        v43 = MEMORY[0x1E4F14500];
        id v44 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "HapticServerConfig.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 106;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]";
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v42;
        _os_log_impl(&dword_1BA902000, v43, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Querying server for UsageCategory of '%@'", buf, 0x26u);
      }

      goto LABEL_65;
    }
    if ([v37 containsString:@"HighPower"])
    {
      uint64_t v40 = 11;
      goto LABEL_56;
    }
    if (kHAPIScope)
    {
      v48 = *(id *)kHAPIScope;
      if (!v48)
      {
LABEL_83:
        if (a5)
        {
          [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4816 userInfo:0];
          v10 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }
        int v45 = 1;
        v42 = v52;
LABEL_71:

        goto LABEL_72;
      }
    }
    else
    {
      v48 = MEMORY[0x1E4F14500];
      id v49 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "HapticServerConfig.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 97;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]";
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v37;
      _os_log_impl(&dword_1BA902000, v48, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Illegal power usage: %@", buf, 0x26u);
    }

    goto LABEL_83;
  }
  if (kHAPIScope)
  {
    v33 = *(id *)kHAPIScope;
    if (!v33) {
      goto LABEL_35;
    }
  }
  else
  {
    v33 = MEMORY[0x1E4F14500];
    id v34 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "HapticServerConfig.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 64;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]";
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v32;
    _os_log_impl(&dword_1BA902000, v33, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Querying server for capabilities with Priority '%@'", buf, 0x26u);
  }

LABEL_35:
  if ([v32 containsString:@"LowPriority"])
  {
    uint64_t v35 = 1;
LABEL_43:
    v36 = [NSNumber numberWithUnsignedInteger:v35];
    [v31 setObject:v36 forKey:@"RequestedPriority"];

    goto LABEL_44;
  }
  if ([v32 containsString:@"HighPriority"])
  {
    uint64_t v35 = 2;
    goto LABEL_43;
  }
  if ([v32 containsString:@"ExclusivePriority"])
  {
    uint64_t v35 = 4;
    goto LABEL_43;
  }
  if ([v32 containsString:@"HighestPriority"])
  {
    uint64_t v35 = 3;
    goto LABEL_43;
  }
  if (!kHAPIScope)
  {
    v50 = MEMORY[0x1E4F14500];
    id v51 = MEMORY[0x1E4F14500];
    goto LABEL_91;
  }
  v50 = *(id *)kHAPIScope;
  if (v50)
  {
LABEL_91:
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "HapticServerConfig.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 79;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]";
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v32;
      _os_log_impl(&dword_1BA902000, v50, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Illegal priority: %@", buf, 0x26u);
    }
  }
  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4816 userInfo:0];
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  int v45 = 1;
  v37 = v52;
LABEL_72:

  if (!v45) {
    goto LABEL_74;
  }
  v46 = 0;
LABEL_75:

  return v46;
}

void __61__HapticServerConfig_initWithHapticPlayer_withOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v105 = a2;
  id v104 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v99 = [v105 objectForKey:@"SupportsHapticPlayback"];
    *(unsigned char *)(*(void *)(a1 + 32) + 18) = [v99 BOOLValue];
    v98 = [v105 objectForKey:@"SupportsAudioPlayback"];
    *(unsigned char *)(*(void *)(a1 + 32) + 17) = [v98 BOOLValue];
    v97 = [v105 objectForKey:@"SupportsAdvancedPatternPlayers"];
    *(unsigned char *)(*(void *)(a1 + 32) + 19) = [v97 BOOLValue];
    v96 = [v105 objectForKey:@"UsingInternalHaptics"];
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = [v96 BOOLValue];
    v95 = [v105 objectForKey:@"HapticContinuousTimeLimit"];
    *(float *)(*(void *)(a1 + 32) + 20) = (float)[v95 unsignedIntValue];
    if (kHAPIScope)
    {
      v6 = *(id *)kHAPIScope;
      if (!v6) {
        goto LABEL_16;
      }
    }
    else
    {
      v6 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = *(unsigned __int8 *)(v10 + 17);
      int v12 = *(unsigned __int8 *)(v10 + 19);
      int v13 = *(unsigned __int8 *)(v10 + 16);
      LODWORD(v10) = *(float *)(v10 + 20);
      *(_DWORD *)buf = 136316674;
      v122 = "HapticServerConfig.mm";
      __int16 v123 = 1024;
      int v124 = 128;
      __int16 v125 = 2080;
      v126 = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]_block_invoke";
      __int16 v127 = 1024;
      *(_DWORD *)v128 = v11;
      *(_WORD *)&v128[4] = 1024;
      *(_DWORD *)&v128[6] = v12;
      __int16 v129 = 1024;
      int v130 = v13;
      __int16 v131 = 1024;
      int v132 = v10;
      _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Server returned: supports audio: %d adv players: %d internal: %d cont time limit: %us", buf, 0x34u);
    }

LABEL_16:
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
    v14 = [v105 objectForKey:@"HapticTransientDefaultIntensity"];
    [v14 floatValue];
    *(_DWORD *)(*(void *)(a1 + 32) + 32) = v15;
    v16 = [v105 objectForKey:@"HapticTransientDefaultSharpness"];

    [v16 floatValue];
    *(_DWORD *)(*(void *)(a1 + 32) + 24) = v17;
    CFBooleanRef v18 = [v105 objectForKey:@"HapticContinuousDefaultIntensity"];

    [v18 floatValue];
    *(_DWORD *)(*(void *)(a1 + 32) + 36) = v19;
    v100 = [v105 objectForKey:@"HapticContinuousDefaultSharpness"];

    [v100 floatValue];
    *(_DWORD *)(*(void *)(a1 + 32) + 28) = v20;
    v103 = [v105 objectForKey:@"HapticTransientEventIDs"];
    if (kHAPIScope)
    {
      id v21 = *(id *)kHAPIScope;
      if (!v21) {
        goto LABEL_23;
      }
    }
    else
    {
      id v21 = (id)MEMORY[0x1E4F14500];
      id v22 = MEMORY[0x1E4F14500];
    }
    v23 = v21;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v24 = [v103 count];
      *(_DWORD *)buf = 136315906;
      v122 = "HapticServerConfig.mm";
      __int16 v123 = 1024;
      int v124 = 141;
      __int16 v125 = 2080;
      v126 = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]_block_invoke";
      __int16 v127 = 1024;
      *(_DWORD *)v128 = v24;
      _os_log_impl(&dword_1BA902000, v23, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Received %u haptic transient IDs", buf, 0x22u);
    }

LABEL_23:
    if ([v103 count])
    {
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      id v25 = v103;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v114 objects:v120 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v115;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v115 != v27) {
              objc_enumerationMutation(v25);
            }
            uint64_t v29 = [*(id *)(*((void *)&v114 + 1) + 8 * i) unsignedIntegerValue];
            uint64_t v30 = v29;
            v31 = *(void **)(a1 + 32);
            v32 = (uint64_t *)v31[7];
            unint64_t v33 = v31[8];
            if ((unint64_t)v32 >= v33)
            {
              uint64_t v35 = (uint64_t *)v31[6];
              uint64_t v36 = v32 - v35;
              if ((unint64_t)(v36 + 1) >> 61) {
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v37 = v33 - (void)v35;
              unint64_t v38 = (uint64_t)(v33 - (void)v35) >> 2;
              if (v38 <= v36 + 1) {
                unint64_t v38 = v36 + 1;
              }
              if (v37 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v39 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v39 = v38;
              }
              if (v39)
              {
                uint64_t v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v31 + 8), v39);
                uint64_t v35 = (uint64_t *)v31[6];
                v32 = (uint64_t *)v31[7];
              }
              else
              {
                uint64_t v40 = 0;
              }
              v41 = (uint64_t *)&v40[8 * v36];
              uint64_t *v41 = v30;
              id v34 = v41 + 1;
              while (v32 != v35)
              {
                uint64_t v42 = *--v32;
                *--v41 = v42;
              }
              v31[6] = v41;
              v31[7] = v34;
              v31[8] = &v40[8 * v39];
              if (v35) {
                operator delete(v35);
              }
            }
            else
            {
              uint64_t *v32 = v29;
              id v34 = v32 + 1;
            }
            v31[7] = v34;
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v114 objects:v120 count:16];
        }
        while (v26);
      }
    }
    v102 = [v105 objectForKey:@"HapticContinuousSustainedEventIDs"];
    if (kHAPIScope)
    {
      id v43 = *(id *)kHAPIScope;
      if (!v43) {
        goto LABEL_55;
      }
    }
    else
    {
      id v43 = (id)MEMORY[0x1E4F14500];
      id v44 = MEMORY[0x1E4F14500];
    }
    int v45 = v43;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      int v46 = [v102 count];
      *(_DWORD *)buf = 136315906;
      v122 = "HapticServerConfig.mm";
      __int16 v123 = 1024;
      int v124 = 150;
      __int16 v125 = 2080;
      v126 = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]_block_invoke";
      __int16 v127 = 1024;
      *(_DWORD *)v128 = v46;
      _os_log_impl(&dword_1BA902000, v45, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Received %u haptic continuous sustained IDs", buf, 0x22u);
    }

LABEL_55:
    if ([v102 count])
    {
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v47 = v102;
      uint64_t v48 = [v47 countByEnumeratingWithState:&v110 objects:v119 count:16];
      if (v48)
      {
        uint64_t v49 = *(void *)v111;
        do
        {
          for (uint64_t j = 0; j != v48; ++j)
          {
            if (*(void *)v111 != v49) {
              objc_enumerationMutation(v47);
            }
            uint64_t v51 = [*(id *)(*((void *)&v110 + 1) + 8 * j) unsignedIntegerValue];
            uint64_t v52 = v51;
            v53 = *(void **)(a1 + 32);
            v54 = (uint64_t *)v53[10];
            unint64_t v55 = v53[11];
            if ((unint64_t)v54 >= v55)
            {
              v57 = (uint64_t *)v53[9];
              uint64_t v58 = v54 - v57;
              if ((unint64_t)(v58 + 1) >> 61) {
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v59 = v55 - (void)v57;
              unint64_t v60 = (uint64_t)(v55 - (void)v57) >> 2;
              if (v60 <= v58 + 1) {
                unint64_t v60 = v58 + 1;
              }
              if (v59 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v61 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v61 = v60;
              }
              if (v61)
              {
                v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v53 + 11), v61);
                v57 = (uint64_t *)v53[9];
                v54 = (uint64_t *)v53[10];
              }
              else
              {
                v62 = 0;
              }
              v63 = (uint64_t *)&v62[8 * v58];
              uint64_t *v63 = v52;
              v56 = v63 + 1;
              while (v54 != v57)
              {
                uint64_t v64 = *--v54;
                *--v63 = v64;
              }
              v53[9] = v63;
              v53[10] = v56;
              v53[11] = &v62[8 * v61];
              if (v57) {
                operator delete(v57);
              }
            }
            else
            {
              uint64_t *v54 = v51;
              v56 = v54 + 1;
            }
            v53[10] = v56;
          }
          uint64_t v48 = [v47 countByEnumeratingWithState:&v110 objects:v119 count:16];
        }
        while (v48);
      }
    }
    v101 = [v105 objectForKey:@"HapticContinuousNonsustainedEventIDs"];
    if (kHAPIScope)
    {
      id v65 = *(id *)kHAPIScope;
      if (!v65) {
        goto LABEL_87;
      }
    }
    else
    {
      id v65 = (id)MEMORY[0x1E4F14500];
      id v66 = MEMORY[0x1E4F14500];
    }
    v67 = v65;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      int v68 = [v101 count];
      *(_DWORD *)buf = 136315906;
      v122 = "HapticServerConfig.mm";
      __int16 v123 = 1024;
      int v124 = 159;
      __int16 v125 = 2080;
      v126 = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]_block_invoke";
      __int16 v127 = 1024;
      *(_DWORD *)v128 = v68;
      _os_log_impl(&dword_1BA902000, v67, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Received %u haptic continuous nonsustained IDs", buf, 0x22u);
    }

LABEL_87:
    if ([v101 count])
    {
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      id v69 = v101;
      uint64_t v70 = [v69 countByEnumeratingWithState:&v106 objects:v118 count:16];
      if (v70)
      {
        uint64_t v71 = *(void *)v107;
        do
        {
          for (uint64_t k = 0; k != v70; ++k)
          {
            if (*(void *)v107 != v71) {
              objc_enumerationMutation(v69);
            }
            uint64_t v73 = [*(id *)(*((void *)&v106 + 1) + 8 * k) unsignedIntegerValue];
            uint64_t v74 = v73;
            v75 = *(void **)(a1 + 32);
            v76 = (uint64_t *)v75[13];
            unint64_t v77 = v75[14];
            if ((unint64_t)v76 >= v77)
            {
              v79 = (uint64_t *)v75[12];
              uint64_t v80 = v76 - v79;
              if ((unint64_t)(v80 + 1) >> 61) {
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v81 = v77 - (void)v79;
              unint64_t v82 = (uint64_t)(v77 - (void)v79) >> 2;
              if (v82 <= v80 + 1) {
                unint64_t v82 = v80 + 1;
              }
              if (v81 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v83 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v83 = v82;
              }
              if (v83)
              {
                v84 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v75 + 14), v83);
                v79 = (uint64_t *)v75[12];
                v76 = (uint64_t *)v75[13];
              }
              else
              {
                v84 = 0;
              }
              v85 = (uint64_t *)&v84[8 * v80];
              uint64_t *v85 = v74;
              v78 = v85 + 1;
              while (v76 != v79)
              {
                uint64_t v86 = *--v76;
                *--v85 = v86;
              }
              v75[12] = v85;
              v75[13] = v78;
              v75[14] = &v84[8 * v83];
              if (v79) {
                operator delete(v79);
              }
            }
            else
            {
              uint64_t *v76 = v73;
              v78 = v76 + 1;
            }
            v75[13] = v78;
          }
          uint64_t v70 = [v69 countByEnumeratingWithState:&v106 objects:v118 count:16];
        }
        while (v70);
      }
    }
    v87 = [v105 objectForKey:@"BuiltInAudioEventIDs"];
    if (![v87 count]) {
      goto LABEL_120;
    }
    uint64_t v88 = [v87 copy];
    uint64_t v89 = *(void *)(a1 + 32);
    v90 = *(void **)(v89 + 40);
    *(void *)(v89 + 40) = v88;

    if (kHAPIScope)
    {
      id v91 = *(id *)kHAPIScope;
      if (!v91)
      {
LABEL_120:

        goto LABEL_121;
      }
    }
    else
    {
      id v91 = (id)MEMORY[0x1E4F14500];
      id v92 = MEMORY[0x1E4F14500];
    }
    v93 = v91;
    if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
    {
      int v94 = [v87 count];
      *(_DWORD *)buf = 136315906;
      v122 = "HapticServerConfig.mm";
      __int16 v123 = 1024;
      int v124 = 170;
      __int16 v125 = 2080;
      v126 = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]_block_invoke";
      __int16 v127 = 1024;
      *(_DWORD *)v128 = v94;
      _os_log_impl(&dword_1BA902000, v93, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Received %u built-in audio event IDs", buf, 0x22u);
    }

    goto LABEL_120;
  }
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5) {
      goto LABEL_121;
    }
  }
  else
  {
    v5 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 136315906;
    v122 = "HapticServerConfig.mm";
    __int16 v123 = 1024;
    int v124 = 179;
    __int16 v125 = 2080;
    v126 = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]_block_invoke";
    __int16 v127 = 2112;
    *(void *)v128 = v8;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Server query returned error '%@'", buf, 0x26u);
  }

LABEL_121:
}

- (id).cxx_construct
{
  *((void *)self + 14) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  return self;
}

- (BOOL)supportsHapticPlayback
{
  return self->_supportsHapticPlayback;
}

- (BOOL)supportsAudioPlayback
{
  return self->_supportsAudioPlayback;
}

- (vector<unsigned)hapticTransientIDs
{
  objc_copyCppObjectAtomic(retstr, &self->_hapticTransientIDs, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return result;
}

- (vector<unsigned)hapticContinuousSustainedIDs
{
  objc_copyCppObjectAtomic(retstr, &self->_hapticContinuousSustainedIDs, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__66);
  return result;
}

- (vector<unsigned)hapticContinuousNonsustainedIDs
{
  objc_copyCppObjectAtomic(retstr, &self->_hapticContinuousNonsustainedIDs, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__67);
  return result;
}

- (float)hapticContinuousTimeLimit
{
  return self->_hapticContinuousTimeLimit;
}

- (float)defaultHapticTransientEventIntensity
{
  return self->_defaultHapticTransientEventIntensity;
}

- (BOOL)usingInternalHaptics
{
  return self->_usingInternalHaptics;
}

- (BOOL)supportsAdvancedPatternPlayers
{
  return self->_supportsAdvancedPatternPlayers;
}

- (NSString)currentLocality
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (float)defaultHapticTransientEventSharpness
{
  return self->_defaultHapticTransientEventSharpness;
}

- (float)defaultHapticContinuousEventSharpness
{
  return self->_defaultHapticContinuousEventSharpness;
}

- (float)defaultHapticContinuousEventIntensity
{
  return self->_defaultHapticContinuousEventIntensity;
}

- (NSDictionary)builtInAudioEventIDs
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  begin = self->_hapticContinuousNonsustainedIDs.__begin_;
  if (begin)
  {
    self->_hapticContinuousNonsustainedIDs.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_hapticContinuousSustainedIDs.__begin_;
  if (v4)
  {
    self->_hapticContinuousSustainedIDs.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_hapticTransientIDs.__begin_;
  if (v5)
  {
    self->_hapticTransientIDs.__end_ = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_builtInAudioEventIDs, 0);

  objc_storeStrong((id *)&self->_currentLocality, 0);
}

@end