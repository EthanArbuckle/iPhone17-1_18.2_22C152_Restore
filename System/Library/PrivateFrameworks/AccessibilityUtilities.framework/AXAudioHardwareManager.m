@interface AXAudioHardwareManager
+ (BOOL)channelsAreAirplay:(id)a3 route:(id)a4;
+ (BOOL)channelsAreWiredHeadphones:(id)a3;
+ (id)channelsForPort:(id)a3;
+ (id)defaultPort;
+ (id)defaultPortChannels;
+ (id)defaultRouteDescription;
+ (id)sharedManager;
+ (void)disableMultiroute;
+ (void)enableMultiroute;
+ (void)setDefaultPort:(id)a3;
+ (void)setDefaultPortChannels:(id)a3;
+ (void)setDefaultRouteDescription:(id)a3;
+ (void)updateTestingChannels;
- (AXAudioHardwareManager)init;
- (BOOL)isDolbyAtmosConfigured;
- (id)_savedIdForRouteDescription:(id)a3;
- (id)savedChannelsForOutput:(id)a3 forSource:(int64_t)a4;
- (void)_handleSurroundSoundDefaults:(id)a3 returnedChannels:(id)a4 port:(id)a5 source:(int64_t)a6;
- (void)setSavedChannels:(id)a3 forOutput:(id)a4 forSource:(int64_t)a5;
@end

@implementation AXAudioHardwareManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_25);
  }
  v2 = (void *)sharedManager_Manager;

  return v2;
}

uint64_t __39__AXAudioHardwareManager_sharedManager__block_invoke()
{
  sharedManager_Manager = objc_alloc_init(AXAudioHardwareManager);

  return MEMORY[0x1F41817F8]();
}

- (AXAudioHardwareManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXAudioHardwareManager;
  v2 = [(AXAudioHardwareManager *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

+ (BOOL)channelsAreAirplay:(id)a3 route:(id)a4
{
  id v5 = a4;
  if ([a3 count] == 2)
  {
    objc_super v6 = [v5 outputs];
    if ([v6 count] == 1)
    {
      v7 = [v6 firstObject];
      v8 = [v7 portType];
      char v9 = [v8 isEqualToString:*MEMORY[0x1E4F150B8]];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)channelsAreWiredHeadphones:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count] == 2)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          char v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "owningPortUID", (void)v13);
          int v10 = [v9 isEqualToString:@"Wired Headphones"];

          if (!v10)
          {
            BOOL v11 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 1;
LABEL_13:
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (void)enableMultiroute
{
  v2 = [MEMORY[0x1E4F153E0] sharedInstance];
  uint64_t v3 = [v2 category];
  id v4 = (void *)ExistingCategory;
  ExistingCategory = v3;

  uint64_t v5 = [MEMORY[0x1E4F153E0] sharedInstance];
  uint64_t v6 = *MEMORY[0x1E4F14F88];
  id v9 = 0;
  char v7 = [v5 setCategory:v6 withOptions:0 error:&v9];
  id v8 = v9;

  if ((v7 & 1) == 0)
  {
    NSLog(&cfstr_Error_0.isa, v8);
    NSLog(&cfstr_Error_0.isa, v8);
  }
}

+ (void)disableMultiroute
{
  v2 = (void *)ExistingCategory;
  if (ExistingCategory)
  {
    uint64_t v3 = [MEMORY[0x1E4F153E0] sharedInstance];
    id v6 = 0;
    char v4 = [v3 setCategory:ExistingCategory withOptions:0 error:&v6];
    id v5 = v6;

    if ((v4 & 1) == 0)
    {
      NSLog(&cfstr_Error_0.isa, v5);
      NSLog(&cfstr_Error_0.isa, v5);
    }

    v2 = (void *)ExistingCategory;
  }
  ExistingCategory = 0;
}

+ (void)setDefaultPortChannels:(id)a3
{
}

+ (void)setDefaultRouteDescription:(id)a3
{
}

+ (id)defaultRouteDescription
{
  if (DefaultRouteDescription)
  {
    id v2 = (id)DefaultRouteDescription;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F153E0] sharedInstance];
    id v2 = [v3 currentRoute];
  }

  return v2;
}

- (BOOL)isDolbyAtmosConfigured
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = objc_msgSend(MEMORY[0x1E4F153E0], "sharedInstance", 0);
  uint64_t v3 = [v2 audioFormats];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = [*(id *)(*((void *)&v16 + 1) + 8 * i) intValue];
        if (v8 > 1836344106)
        {
          if (v8 > 1902324530)
          {
            if (v8 == 1902324531 || v8 == 2053319475)
            {
LABEL_30:
              BOOL v14 = 1;
              goto LABEL_32;
            }
          }
          else if (v8 == 1836344107 || v8 == 1885547315)
          {
            goto LABEL_30;
          }
        }
        else
        {
          if (v8 > 1835103274)
          {
            BOOL v9 = v8 == 1835103275;
            int v10 = 1836343851;
          }
          else
          {
            BOOL v9 = v8 == 1667443507;
            int v10 = 1700997939;
          }
          if (v9 || v8 == v10) {
            goto LABEL_30;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      BOOL v14 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_32:

  return v14;
}

+ (void)updateTestingChannels
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)TestingChannels;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        BOOL v9 = objc_msgSend(v8, "channel", (void)v11);

        if (v9) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  if ([v2 count]) {
    int v10 = v2;
  }
  else {
    int v10 = 0;
  }
  objc_storeStrong((id *)&TestingChannels, v10);
}

+ (id)channelsForPort:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [a1 updateTestingChannels];
  if (TestingChannels)
  {
    id v5 = (id)TestingChannels;
  }
  else
  {
    if (AXProcessIsPreferences()) {
      [a1 enableMultiroute];
    }
    if (AXProcessIsPreferences()) {
      [a1 disableMultiroute];
    }
    id v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = [v4 channels];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = [MEMORY[0x1E4FAF290] channelWithChannel:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }

  return v5;
}

+ (id)defaultPortChannels
{
  id v3 = +[AXAudioHardwareManager defaultPort];
  id v4 = [a1 channelsForPort:v3];

  return v4;
}

+ (void)setDefaultPort:(id)a3
{
}

+ (id)defaultPort
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (TestingPort)
  {
    id v2 = (id)TestingPort;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F153E0] sharedInstance];
    id v4 = [v3 currentRoute];
    id v5 = [v4 outputs];
    id v2 = [v5 firstObject];

    uint64_t v6 = [MEMORY[0x1E4F48348] sharedInstance];
    char v7 = [v6 ignoreLogging];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = [MEMORY[0x1E4F48348] identifier];
      uint64_t v9 = AXLoggerForFacility();

      os_log_type_t v10 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v9, v10))
      {
        long long v11 = AXColorizeFormatLog();
        long long v14 = [v4 outputs];
        long long v12 = _AXStringForArgs();

        if (os_log_type_enabled(v9, v10))
        {
          *(_DWORD *)buf = 138543362;
          long long v16 = v12;
          _os_log_impl(&dword_18D308000, v9, v10, "%{public}@", buf, 0xCu);
        }
      }
    }
  }

  return v2;
}

- (id)_savedIdForRouteDescription:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(v3, "outputs", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        os_log_type_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) UID];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [v4 sortUsingComparator:&__block_literal_global_14];
  long long v11 = [v4 componentsJoinedByString:@"_"];

  return v11;
}

uint64_t __54__AXAudioHardwareManager__savedIdForRouteDescription___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)savedChannelsForOutput:(id)a3 forSource:(int64_t)a4
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[AXSettings sharedInstance];
  uint64_t v8 = [v7 _audioHardwareChannelLayout];

  int64_t v62 = a4;
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a4);
  os_log_type_t v10 = [v8 objectForKey:v9];

  long long v11 = [MEMORY[0x1E4F1CA48] array];
  v61 = self;
  long long v12 = [(AXAudioHardwareManager *)self _savedIdForRouteDescription:v6];
  v66 = [v10 objectForKey:v12];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = [v6 outputs];
  unint64_t v13 = 0x1E4F48000uLL;
  v70 = v11;
  uint64_t v63 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
  if (v63)
  {
    v54 = v12;
    v55 = v10;
    v56 = v8;
    id v57 = v6;
    uint64_t v59 = *(void *)v82;
    while (1)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v82 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v64 = v14;
        long long v15 = *(void **)(*((void *)&v81 + 1) + 8 * v14);
        long long v16 = [v15 UID];
        int v60 = [v16 isEqualToString:@"Wired Headphones"];

        v71 = v15;
        uint64_t v17 = [v15 channels];
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v65 = v17;
        uint64_t v68 = [v17 countByEnumeratingWithState:&v77 objects:v88 count:16];
        if (v68)
        {
          uint64_t v67 = *(void *)v78;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v78 != v67) {
                objc_enumerationMutation(v65);
              }
              uint64_t v69 = v18;
              v72 = *(void **)(*((void *)&v77 + 1) + 8 * v18);
              long long v73 = 0u;
              long long v74 = 0u;
              long long v75 = 0u;
              long long v76 = 0u;
              id v19 = v66;
              uint64_t v20 = [v19 countByEnumeratingWithState:&v73 objects:v87 count:16];
              if (v20)
              {
                uint64_t v21 = v20;
                uint64_t v22 = *(void *)v74;
                do
                {
                  for (uint64_t i = 0; i != v21; ++i)
                  {
                    if (*(void *)v74 != v22) {
                      objc_enumerationMutation(v19);
                    }
                    v24 = *(void **)(*((void *)&v73 + 1) + 8 * i);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v25 = [v24 objectForKey:@"portUID"];
                      v26 = [v71 UID];
                      if ([v25 isEqualToString:v26])
                      {
                        v27 = [v24 objectForKeyedSubscript:@"channelNumber"];
                        int v28 = [v27 intValue];
                        uint64_t v29 = [v72 channelNumber];

                        unint64_t v13 = 0x1E4F48000;
                        BOOL v30 = v29 == v28;
                        long long v11 = v70;
                        if (!v30)
                        {
LABEL_23:
                          v31 = objc_msgSend(*(id *)(v13 + 840), "sharedInstance", v51, v52, v53);
                          char v32 = [v31 ignoreLogging];

                          if ((v32 & 1) == 0)
                          {
                            v33 = [*(id *)(v13 + 840) identifier];
                            v34 = AXLoggerForFacility();

                            os_log_type_t v35 = AXOSLogLevelFromAXLogLevel();
                            if (os_log_type_enabled(v34, v35))
                            {
                              v36 = AXColorizeFormatLog();
                              v52 = v72;
                              v53 = v11;
                              v51 = v24;
                              v37 = _AXStringForArgs();
                              if (os_log_type_enabled(v34, v35))
                              {
                                *(_DWORD *)buf = 138543362;
                                v86 = v37;
                                _os_log_impl(&dword_18D308000, v34, v35, "%{public}@", buf, 0xCu);
                              }
                            }
                            unint64_t v13 = 0x1E4F48000;
                          }
                          continue;
                        }
                        v25 = [MEMORY[0x1E4FAF290] channelWithChannel:v72];
                        [v70 addObject:v25];
                      }
                      else
                      {
                      }
                      goto LABEL_23;
                    }
                  }
                  uint64_t v21 = [v19 countByEnumeratingWithState:&v73 objects:v87 count:16];
                }
                while (v21);
              }

              uint64_t v18 = v69 + 1;
            }
            while (v69 + 1 != v68);
            uint64_t v68 = [v65 countByEnumeratingWithState:&v77 objects:v88 count:16];
          }
          while (v68);
        }
        -[AXAudioHardwareManager _handleSurroundSoundDefaults:returnedChannels:port:source:](v61, "_handleSurroundSoundDefaults:returnedChannels:port:source:", v65, v11, v71, v62, v51);

        uint64_t v14 = v64 + 1;
      }
      while (v64 + 1 != v63);
      uint64_t v63 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
      if (!v63)
      {
        uint64_t v8 = v56;
        id v6 = v57;
        long long v12 = v54;
        os_log_type_t v10 = v55;
        int v38 = v60;
        goto LABEL_37;
      }
    }
  }
  int v38 = 0;
LABEL_37:

  v39 = [*(id *)(v13 + 840) sharedInstance];
  char v40 = [v39 ignoreLogging];

  if ((v40 & 1) == 0)
  {
    v41 = [*(id *)(v13 + 840) identifier];
    v42 = AXLoggerForFacility();

    os_log_type_t v43 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = AXColorizeFormatLog();
      v51 = v66;
      v52 = v11;
      v45 = _AXStringForArgs();
      if (os_log_type_enabled(v42, v43))
      {
        *(_DWORD *)buf = 138543362;
        v86 = v45;
        _os_log_impl(&dword_18D308000, v42, v43, "%{public}@", buf, 0xCu);
      }

      long long v11 = v70;
    }
  }
  if (!v38) {
    goto LABEL_48;
  }
  v46 = [v6 outputs];
  if ([v46 count] != 1)
  {

    goto LABEL_48;
  }
  uint64_t v47 = [v11 count];

  if (v47 != 2)
  {
LABEL_48:
    if (objc_msgSend(v11, "count", v51, v52)) {
      v49 = v11;
    }
    else {
      v49 = 0;
    }
    id v48 = v49;
    goto LABEL_52;
  }
  id v48 = 0;
LABEL_52:

  return v48;
}

- (void)_handleSurroundSoundDefaults:(id)a3 returnedChannels:(id)a4 port:(id)a5 source:(int64_t)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 count] == 5 && !objc_msgSend(v10, "count"))
  {
    long long v12 = [v11 portType];
    int v13 = [v12 isEqualToString:*MEMORY[0x1E4F15130]];

    if (v13)
    {
      if (a6 == 2)
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v21 = v9;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v29 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              if (objc_msgSend(v26, "channelLabel", (void)v28) == 1
                || [v26 channelLabel] == 2
                || [v26 channelLabel] == 5
                || [v26 channelLabel] == 6)
              {
                v27 = [MEMORY[0x1E4FAF290] channelWithChannel:v26];
                [v10 addObject:v27];
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v23);
        }
        goto LABEL_29;
      }
      if (a6 == 1)
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v14 = v9;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v33;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v33 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = *(void **)(*((void *)&v32 + 1) + 8 * j);
              if ([v19 channelLabel] == 3
                || [v19 channelLabel] == 9)
              {
                uint64_t v20 = [MEMORY[0x1E4FAF290] channelWithChannel:v19];
                [v10 addObject:v20];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
          }
          while (v16);
        }
LABEL_29:
      }
    }
  }
}

- (void)setSavedChannels:(id)a3 forOutput:(id)a4 forSource:(int64_t)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v31 = a4;
  uint64_t v8 = +[AXSettings sharedInstance];
  id v9 = [v8 _audioHardwareChannelLayout];
  id v10 = (id)[v9 mutableCopy];

  if (!v10) {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a5);
  long long v12 = [v10 objectForKey:v11];
  id v13 = (id)[v12 mutableCopy];

  if (!v13) {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a5);
  long long v30 = v10;
  long long v28 = v13;
  [v10 setObject:v13 forKey:v14];

  uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v16 = v7;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v36[0] = @"portUID";
        uint64_t v22 = [v21 owningPortUID];
        v36[1] = @"channelNumber";
        v37[0] = v22;
        uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "channelNumber"));
        v37[1] = v23;
        uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
        [v15 addObject:v24];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v18);
  }

  v25 = [(AXAudioHardwareManager *)self _savedIdForRouteDescription:v31];
  v26 = AXLogSpeechAssetDownload();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[AXAudioHardwareManager setSavedChannels:forOutput:forSource:]((uint64_t)v25, (uint64_t)v15, v26);
  }

  [v28 setObject:v15 forKey:v25];
  v27 = +[AXSettings sharedInstance];
  [v27 _setAudioHardwareChannelLayout:v30];
}

- (void)setSavedChannels:(uint64_t)a1 forOutput:(uint64_t)a2 forSource:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_18D308000, log, OS_LOG_TYPE_DEBUG, "saving channels: %{public}@ %{public}@", (uint8_t *)&v3, 0x16u);
}

@end