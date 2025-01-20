@interface CMContinuityCaptureDeviceCapabilities
+ (BOOL)avcaptureDeviceSupportsBackgroundReplacement:(id)a3;
+ (BOOL)avcaptureDeviceSupportsCenterStage:(id)a3;
+ (BOOL)avcaptureDeviceSupportsFlash:(id)a3;
+ (BOOL)avcaptureDeviceSupportsPortraitEffect:(id)a3;
+ (BOOL)avcaptureDeviceSupportsReactionEffects:(id)a3;
+ (BOOL)avcaptureDeviceSupportsStudioLighting:(id)a3;
+ (id)_resolvedControlsForEntityType:(int64_t)a3;
+ (id)_resolvedStreamFormatsForEntityType:(int64_t)a3 requireManualFramingSupport:(BOOL)a4;
+ (id)capabilitiesForEntityType:(int64_t)a3;
- (BOOL)supportsControlWithName:(id)a3;
- (CMContinuityCaptureDeviceCapabilities)initWithDictionaryRepresentation:(id)a3;
- (CMContinuityCaptureDeviceCapabilities)initWithEntityType:(int64_t)a3 streamFormats:(id)a4 manualFramingSupportedStreamFormats:(id)a5 controls:(id)a6;
- (NSArray)controls;
- (NSArray)manualFramingSupportedStreamFormats;
- (NSArray)streamFormats;
- (NSString)debugDescription;
- (NSString)description;
- (id)dictionaryRepresentation;
- (int64_t)entityType;
@end

@implementation CMContinuityCaptureDeviceCapabilities

- (CMContinuityCaptureDeviceCapabilities)initWithEntityType:(int64_t)a3 streamFormats:(id)a4 manualFramingSupportedStreamFormats:(id)a5 controls:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CMContinuityCaptureDeviceCapabilities;
  v14 = [(CMContinuityCaptureDeviceCapabilities *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_entityType = a3;
    objc_storeStrong((id *)&v14->_streamFormats, a4);
    objc_storeStrong((id *)&v15->_manualFramingSupportedStreamFormats, a5);
    objc_storeStrong((id *)&v15->_controls, a6);
  }

  return v15;
}

- (CMContinuityCaptureDeviceCapabilities)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  v6 = [MEMORY[0x263EFF980] array];
  uint64_t v43 = [MEMORY[0x263EFF980] array];
  v7 = [v4 objectForKeyedSubscript:@"EntityType"];

  if (!v7)
  {
    obj = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureDeviceCapabilities initWithDictionaryRepresentation:]();
    }
    goto LABEL_46;
  }
  v8 = [v4 objectForKeyedSubscript:@"EntityType"];
  uint64_t v9 = [v8 integerValue];

  v10 = [v4 objectForKeyedSubscript:@"StreamFormats"];

  if (!v10)
  {
    obj = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureDeviceCapabilities initWithDictionaryRepresentation:]();
    }
LABEL_46:
    v37 = 0;
LABEL_50:
    v36 = (void *)v43;
    goto LABEL_41;
  }
  uint64_t v41 = v9;
  v42 = self;
  v45 = v6;
  [v4 objectForKeyedSubscript:@"StreamFormats"];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obj = long long v57 = 0u;
  uint64_t v11 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v55;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v55 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v54 + 1) + 8 * v14);
        v16 = [[CMContinuityCaptureStreamFormat alloc] initWithDictionaryRepresentation:v15];
        if (v16)
        {
          [v5 addObject:v16];
        }
        else
        {
          objc_super v17 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v61 = v15;
            _os_log_error_impl(&dword_235FC2000, v17, OS_LOG_TYPE_ERROR, "Could not create stream format: %@", buf, 0xCu);
          }
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v12);
  }
  v18 = [v4 objectForKeyedSubscript:@"ManualFramingSupportedStreamFormats"];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v51;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v51 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v50 + 1) + 8 * v22);
        v24 = [[CMContinuityCaptureStreamFormat alloc] initWithDictionaryRepresentation:v23];
        if (v24)
        {
          [v45 addObject:v24];
        }
        else
        {
          v25 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v61 = v23;
            _os_log_error_impl(&dword_235FC2000, v25, OS_LOG_TYPE_ERROR, "Could not create manual framing supported stream format: %@", buf, 0xCu);
          }
        }
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v20);
  }
  v26 = [v4 objectForKeyedSubscript:@"Controls"];

  if (!v26)
  {
    v39 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureDeviceCapabilities initWithDictionaryRepresentation:]();
    }

    v37 = 0;
    self = v42;
    v6 = v45;
    goto LABEL_50;
  }
  id v40 = v4;
  v27 = [v4 objectForKeyedSubscript:@"Controls"];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v58 count:16];
  v29 = (void *)v43;
  if (v28)
  {
    uint64_t v30 = v28;
    uint64_t v31 = *(void *)v47;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v47 != v31) {
          objc_enumerationMutation(v27);
        }
        uint64_t v33 = *(void *)(*((void *)&v46 + 1) + 8 * v32);
        v34 = [[CMContinuityCaptureControl alloc] initWithDictionaryRepresentation:v33];
        if (v34)
        {
          [v29 addObject:v34];
        }
        else
        {
          v35 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v61 = v33;
            _os_log_error_impl(&dword_235FC2000, v35, OS_LOG_TYPE_ERROR, "Could not create control: %@", buf, 0xCu);
          }

          v29 = (void *)v43;
        }

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = [v27 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v30);
  }
  v6 = v45;
  v36 = v29;
  self = [(CMContinuityCaptureDeviceCapabilities *)v42 initWithEntityType:v41 streamFormats:v5 manualFramingSupportedStreamFormats:v45 controls:v29];

  v37 = self;
  id v4 = v40;
LABEL_41:

  return v37;
}

- (id)dictionaryRepresentation
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [MEMORY[0x263EFF980] array];
  v5 = [MEMORY[0x263EFF980] array];
  v6 = [MEMORY[0x263EFF980] array];
  v7 = [NSNumber numberWithInteger:self->_entityType];
  [v3 setObject:v7 forKeyedSubscript:@"EntityType"];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v8 = self->_streamFormats;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v35 + 1) + 8 * i) dictionaryRepresentation];
        [v4 addObject:v13];
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v10);
  }

  [v3 setObject:v4 forKeyedSubscript:@"StreamFormats"];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v14 = self->_manualFramingSupportedStreamFormats;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = [*(id *)(*((void *)&v31 + 1) + 8 * j) dictionaryRepresentation];
        [v5 addObject:v19];
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v16);
  }

  if ([v5 count]) {
    [v3 setObject:v5 forKeyedSubscript:@"ManualFramingSupportedStreamFormats"];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v20 = self->_controls;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * k), "dictionaryRepresentation", (void)v27);
        [v6 addObject:v25];
      }
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v22);
  }

  [v3 setObject:v6 forKeyedSubscript:@"Controls"];
  return v3;
}

+ (id)capabilitiesForEntityType:(int64_t)a3
{
  if (AVGestaltGetBoolAnswer()
    && (a3 != 2
     || ([MEMORY[0x263EFA598] defaultDeviceWithDeviceType:*MEMORY[0x263EF9680] mediaType:*MEMORY[0x263EF9D48] position:1], v5 = objc_claimAutoreleasedReturnValue(), v5, v5)))
  {
    v6 = [a1 _resolvedStreamFormatsForEntityType:a3 requireManualFramingSupport:0];
    v7 = [a1 _resolvedStreamFormatsForEntityType:a3 requireManualFramingSupport:1];
    v8 = [a1 _resolvedControlsForEntityType:a3];
    uint64_t v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEntityType:a3 streamFormats:v6 manualFramingSupportedStreamFormats:v7 controls:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

+ (id)_resolvedStreamFormatsForEntityType:(int64_t)a3 requireManualFramingSupport:(BOOL)a4
{
  BOOL v4 = a4;
  v101[2] = *MEMORY[0x263EF8340];
  id v68 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v79 = v4;
  id v69 = objc_alloc_init(MEMORY[0x263EFF980]);
  int64_t v75 = a3;
  if (a3 == 3)
  {
    uint64_t v10 = 0;
LABEL_17:
    long long v95 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v92 = 0u;
    obuint64_t j = v68;
    uint64_t v73 = [obj countByEnumeratingWithState:&v92 objects:v97 count:16];
    if (!v73) {
      goto LABEL_63;
    }
    uint64_t v72 = *(void *)v93;
    v71 = v10;
    while (1)
    {
      for (uint64_t i = 0; i != v73; uint64_t i = v56 + 1)
      {
        if (*(void *)v93 != v72) {
          objc_enumerationMutation(obj);
        }
        uint64_t v74 = i;
        long long v32 = *(void **)(*((void *)&v92 + 1) + 8 * i);
        unsigned int v86 = [v32 pixelFormat];
        uint64_t v85 = [v32 width];
        uint64_t v83 = [v32 height];
        v76 = v32;
        uint64_t v33 = [v32 maxFrameRate];
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v34 = [(CMContinuityCaptureStreamFormat *)v10 formats];
        uint64_t v35 = [v34 countByEnumeratingWithState:&v88 objects:v96 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          id v78 = v34;
          long long v37 = 0;
          uint64_t v81 = *(void *)v89;
          do
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              if (*(void *)v89 != v81) {
                objc_enumerationMutation(v78);
              }
              v39 = *(void **)(*((void *)&v88 + 1) + 8 * j);
              if (!v4
                || ([*(id *)(*((void *)&v88 + 1) + 8 * j) isCenterStageSupported] & 1) != 0
                || [v39 isCenterStageSupportedForContinuityCamera])
              {
                FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)[v39 formatDescription]);
                uint64_t Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v39 formatDescription]);
                if (v4)
                {
                  uint64_t v42 = [v39 videoFrameRateRangeForCenterStageForContinuityCamera];
                }
                else
                {
                  uint64_t v43 = [v39 videoSupportedFrameRateRanges];
                  uint64_t v42 = [v43 firstObject];
                }
                uint64_t v44 = (int)Dimensions;
                uint64_t v45 = Dimensions >> 32;
                [v42 minFrameRate];
                double v47 = v46;
                [v42 maxFrameRate];
                unsigned int v49 = v48;
                BOOL v52 = v86 != MediaSubType || v44 != v85 || v45 != v83 || v33 > v49;
                if (v52
                  || v37
                  && ([v37 maxFrameRate] != v49
                   || ([v39 isVideoHDRSupported] & 1) == 0)
                  && [v37 maxFrameRate] <= v49)
                {
                  BOOL v4 = v79;
                }
                else
                {
                  long long v53 = [CMContinuityCaptureStreamFormat alloc];
                  long long v54 = [v76 name];
                  if (v76) {
                    [v76 minimumSupportedVersion];
                  }
                  else {
                    memset(v87, 0, sizeof(v87));
                  }
                  BOOL v4 = v79;
                  uint64_t v55 = [(CMContinuityCaptureStreamFormat *)v53 initWithName:v54 width:v85 height:v83 pixelFormat:v86 minFrameRate:v47 maxFrameRate:v33 entity:v75 minimumSupportedVersion:v87];

                  long long v37 = v55;
                }
              }
            }
            uint64_t v36 = [v78 countByEnumeratingWithState:&v88 objects:v96 count:16];
          }
          while (v36);

          uint64_t v10 = v71;
          if (v37)
          {
            [v69 addObject:v37];
            uint64_t v56 = v74;
            goto LABEL_61;
          }
        }
        else
        {
        }
        long long v37 = CMContinuityCaptureLog(2);
        uint64_t v56 = v74;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v76;
          _os_log_error_impl(&dword_235FC2000, v37, OS_LOG_TYPE_ERROR, "Could not resolved stream format: %@", (uint8_t *)&buf, 0xCu);
        }
LABEL_61:
      }
      uint64_t v73 = [obj countByEnumeratingWithState:&v92 objects:v97 count:16];
      if (!v73)
      {
LABEL_63:

        long long v57 = v69;
        [v69 sortUsingComparator:&__block_literal_global_14];
        goto LABEL_64;
      }
    }
  }
  if (a3 == 2)
  {
    uint64_t v11 = [MEMORY[0x263EFA598] defaultDeviceWithDeviceType:*MEMORY[0x263EF9680] mediaType:*MEMORY[0x263EF9D48] position:1];
    long long buf = xmmword_236059598;
    uint64_t v99 = 0;
    uint64_t v12 = [[CMContinuityCaptureStreamFormat alloc] initWithName:@"1920x1440" width:1920 height:1440 pixelFormat:875704438 minFrameRate:1 maxFrameRate:30 entity:2 minimumSupportedVersion:&buf];
    [v68 addObject:v12];
LABEL_16:

    uint64_t v10 = (CMContinuityCaptureStreamFormat *)v11;
    goto LABEL_17;
  }
  if (a3 != 1)
  {
    CMContinuityCaptureLog(2);
    uint64_t v12 = (CMContinuityCaptureStreamFormat *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR)) {
      +[CMContinuityCaptureDeviceCapabilities _resolvedStreamFormatsForEntityType:requireManualFramingSupport:](a3, &v12->super);
    }
    uint64_t v11 = 0;
    goto LABEL_16;
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v6 = *MEMORY[0x263EF9670];
    v101[0] = *MEMORY[0x263EF9628];
    v101[1] = v6;
    v7 = (void *)MEMORY[0x263EFF8C0];
    v8 = v101;
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v100 = *MEMORY[0x263EF9670];
    v7 = (void *)MEMORY[0x263EFF8C0];
    v8 = &v100;
    uint64_t v9 = 1;
  }
  uint64_t v10 = [v7 arrayWithObjects:v8 count:v9];
  uint64_t v13 = [MEMORY[0x263EFA5A8] discoverySessionWithDeviceTypes:v10 mediaType:*MEMORY[0x263EF9D48] position:CMContinuityCaptureDevicePosition()];
  uint64_t v14 = v13;
  if (v13)
  {
    uint64_t v15 = [v13 devices];
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      uint64_t v17 = [v14 devices];
      uint64_t v18 = [v17 count];

      if (v18)
      {
        uint64_t v19 = [v14 devices];
        uint64_t v11 = [v19 objectAtIndexedSubscript:0];

        long long buf = xmmword_236059598;
        uint64_t v99 = 0;
        v84 = [[CMContinuityCaptureStreamFormat alloc] initWithName:@"1920x1440" width:1920 height:1440 pixelFormat:875704438 minFrameRate:1 maxFrameRate:30 entity:1 minimumSupportedVersion:&buf];
        [v68 addObject:v84];
        uint64_t v20 = [CMContinuityCaptureStreamFormat alloc];
        long long buf = xmmword_236059598;
        uint64_t v99 = 0;
        v82 = [(CMContinuityCaptureStreamFormat *)v20 initWithName:@"1920x1440p60" width:1920 height:1440 pixelFormat:875704438 minFrameRate:1 maxFrameRate:60 entity:1 minimumSupportedVersion:&buf];
        [v68 addObject:v82];
        uint64_t v21 = [CMContinuityCaptureStreamFormat alloc];
        long long buf = xmmword_236059598;
        uint64_t v99 = 0;
        v80 = [(CMContinuityCaptureStreamFormat *)v21 initWithName:@"1920x1080" width:1920 height:1080 pixelFormat:875704438 minFrameRate:1 maxFrameRate:30 entity:1 minimumSupportedVersion:&buf];
        [v68 addObject:v80];
        uint64_t v22 = [CMContinuityCaptureStreamFormat alloc];
        long long buf = xmmword_236059598;
        uint64_t v99 = 0;
        v77 = [(CMContinuityCaptureStreamFormat *)v22 initWithName:@"1920x1080p60" width:1920 height:1080 pixelFormat:875704438 minFrameRate:1 maxFrameRate:60 entity:1 minimumSupportedVersion:&buf];
        [v68 addObject:v77];
        uint64_t v23 = [CMContinuityCaptureStreamFormat alloc];
        long long buf = xmmword_236059598;
        uint64_t v99 = 0;
        v24 = [(CMContinuityCaptureStreamFormat *)v23 initWithName:@"1280x720" width:1280 height:720 pixelFormat:875704438 minFrameRate:1 maxFrameRate:30 entity:1 minimumSupportedVersion:&buf];
        [v68 addObject:v24];
        v25 = [CMContinuityCaptureStreamFormat alloc];
        long long buf = xmmword_236059598;
        uint64_t v99 = 0;
        v26 = [(CMContinuityCaptureStreamFormat *)v25 initWithName:@"1280x720p60" width:1280 height:720 pixelFormat:875704438 minFrameRate:1 maxFrameRate:60 entity:1 minimumSupportedVersion:&buf];
        [v68 addObject:v26];
        long long v27 = [CMContinuityCaptureStreamFormat alloc];
        long long buf = xmmword_236059598;
        uint64_t v99 = 0;
        uint64_t v12 = v10;
        long long v28 = [(CMContinuityCaptureStreamFormat *)v27 initWithName:@"640x480" width:640 height:480 pixelFormat:875704438 minFrameRate:1 maxFrameRate:30 entity:1 minimumSupportedVersion:&buf];
        [v68 addObject:v28];
        long long v29 = [CMContinuityCaptureStreamFormat alloc];
        long long buf = xmmword_236059598;
        uint64_t v99 = 0;
        long long v30 = [(CMContinuityCaptureStreamFormat *)v29 initWithName:@"640x480p60" width:640 height:480 pixelFormat:875704438 minFrameRate:1 maxFrameRate:60 entity:1 minimumSupportedVersion:&buf];
        BOOL v4 = v79;
        [v68 addObject:v30];

        goto LABEL_16;
      }
    }
  }
  v60 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
    +[CMContinuityCaptureDeviceCapabilities _resolvedStreamFormatsForEntityType:requireManualFramingSupport:](v60, v61, v62, v63, v64, v65, v66, v67);
  }

  long long v57 = v69;
LABEL_64:

  v58 = (void *)[v57 copy];
  return v58;
}

uint64_t __105__CMContinuityCaptureDeviceCapabilities__resolvedStreamFormatsForEntityType_requireManualFramingSupport___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 width];
  if (v6 < [v5 width]) {
    goto LABEL_9;
  }
  unint64_t v7 = [v4 width];
  if (v7 <= [v5 width])
  {
    unint64_t v8 = [v4 height];
    if (v8 < [v5 height]) {
      goto LABEL_9;
    }
    unint64_t v9 = [v4 height];
    if (v9 <= [v5 height])
    {
      unsigned int v10 = [v4 minFrameRate];
      if (v10 >= [v5 minFrameRate])
      {
        unsigned int v11 = [v4 minFrameRate];
        if (v11 > [v5 minFrameRate]) {
          goto LABEL_7;
        }
        unsigned int v13 = [v4 maxFrameRate];
        if (v13 >= [v5 maxFrameRate])
        {
          unsigned int v15 = [v4 maxFrameRate];
          uint64_t v12 = v15 > [v5 maxFrameRate];
          goto LABEL_10;
        }
      }
LABEL_9:
      uint64_t v12 = -1;
      goto LABEL_10;
    }
  }
LABEL_7:
  uint64_t v12 = 1;
LABEL_10:

  return v12;
}

+ (id)_resolvedControlsForEntityType:(int64_t)a3
{
  v145[2] = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263EFF980] array];
  if (a3 != 2)
  {
    if (a3 != 1) {
      goto LABEL_47;
    }
    char v6 = _os_feature_enabled_impl();
    uint64_t v7 = *MEMORY[0x263EF9670];
    if (v6)
    {
      v145[0] = *MEMORY[0x263EF9628];
      v145[1] = v7;
      unint64_t v8 = (void *)MEMORY[0x263EFF8C0];
      unint64_t v9 = v145;
      uint64_t v10 = 2;
    }
    else
    {
      uint64_t v144 = *MEMORY[0x263EF9670];
      unint64_t v8 = (void *)MEMORY[0x263EFF8C0];
      unint64_t v9 = &v144;
      uint64_t v10 = 1;
    }
    unsigned int v11 = [v8 arrayWithObjects:v9 count:v10];
    uint64_t v12 = CMContinuityCaptureDevicePosition();
    uint64_t v13 = *MEMORY[0x263EF9D48];
    uint64_t v14 = [MEMORY[0x263EFA5A8] discoverySessionWithDeviceTypes:v11 mediaType:*MEMORY[0x263EF9D48] position:v12];
    unsigned int v15 = v14;
    if (!v14) {
      goto LABEL_17;
    }
    uint64_t v16 = [v14 devices];
    if (!v16
      || (uint64_t v17 = (void *)v16,
          [v15 devices],
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          uint64_t v19 = [v18 count],
          v18,
          v17,
          !v19))
    {
LABEL_17:
      double v48 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        +[CMContinuityCaptureDeviceCapabilities _resolvedControlsForEntityType:](v48, v49, v50, v51, v52, v53, v54, v55);
      }
      goto LABEL_45;
    }
    v134 = v11;
    uint64_t v20 = [v15 devices];
    uint64_t v136 = [v20 firstObject];

    uint64_t v21 = [MEMORY[0x263EFA598] defaultDeviceWithDeviceType:*MEMORY[0x263EF9660] mediaType:v13 position:v12];
    uint64_t v22 = [MEMORY[0x263EFA598] defaultDeviceWithDeviceType:v7 mediaType:v13 position:v12];
    char v23 = [a1 avcaptureDeviceSupportsCenterStage:v21];
    int v24 = [a1 avcaptureDeviceSupportsCenterStage:v22];
    v141 = v21;
    v135 = v22;
    if ((v23 & 1) != 0 || v24)
    {
      v25 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      uint64_t v26 = MEMORY[0x263EFFA80];
      v139 = [(CMContinuityCaptureControl *)v25 initWithName:@"4cc_cfen_glob_0000" attributes:0 entity:1 minimumSupportedVersion:&v142 value:MEMORY[0x263EFFA80]];
      [v5 addObject:v139];
      long long v27 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      v137 = [(CMContinuityCaptureControl *)v27 initWithName:@"4cc_cfac_glob_0000" attributes:0 entity:1 minimumSupportedVersion:&v142 value:v26];
      [v5 addObject:v137];
      long long v28 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      v132 = [(CMContinuityCaptureControl *)v28 initWithName:@"4cc_cfri_glob_0000" attributes:0 entity:1 minimumSupportedVersion:&v142 value:0x26E96A868];
      [v5 addObject:v132];
      long long v29 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_2360595B0;
      uint64_t v143 = 1;
      v130 = [(CMContinuityCaptureControl *)v29 initWithName:@"4cc_cffm_glob_0000" attributes:0 entity:1 minimumSupportedVersion:&v142 value:&unk_26E96A498];
      [v5 addObject:v130];
      long long v30 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_2360595B0;
      uint64_t v143 = 1;
      long long v31 = [(CMContinuityCaptureControl *)v30 initWithName:@"StartPanningAtPoint" attributes:0 entity:1 minimumSupportedVersion:&v142 value:0];
      [v5 addObject:v31];
      long long v32 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_2360595B0;
      uint64_t v143 = 1;
      uint64_t v33 = [(CMContinuityCaptureControl *)v32 initWithName:@"PanWithTranslation" attributes:0 entity:1 minimumSupportedVersion:&v142 value:0];
      [v5 addObject:v33];
      long long v34 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_2360595B0;
      uint64_t v143 = 1;
      uint64_t v35 = [(CMContinuityCaptureControl *)v34 initWithName:@"PerformOneShotFraming" attributes:0 entity:1 minimumSupportedVersion:&v142 value:0];
      [v5 addObject:v35];
      uint64_t v36 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_2360595B0;
      uint64_t v143 = 1;
      long long v37 = [(CMContinuityCaptureControl *)v36 initWithName:@"ResetFraming" attributes:0 entity:1 minimumSupportedVersion:&v142 value:0];
      [v5 addObject:v37];
      long long v38 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_2360595B0;
      uint64_t v143 = 1;
      v39 = [(CMContinuityCaptureControl *)v38 initWithName:@"CenterStageFieldOfViewRestrictedToWide" attributes:0 entity:1 minimumSupportedVersion:&v142 value:0];
      [v5 addObject:v39];
      id v40 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_2360595B0;
      uint64_t v143 = 1;
      uint64_t v41 = [(CMContinuityCaptureControl *)v40 initWithName:@"ManualFramingDeviceType" attributes:0 entity:1 minimumSupportedVersion:&v142 value:0];
      [v5 addObject:v41];
      uint64_t v42 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_2360595B0;
      uint64_t v143 = 1;
      uint64_t v43 = [(CMContinuityCaptureControl *)v42 initWithName:@"ManualFramingSupported" attributes:0 entity:1 minimumSupportedVersion:&v142 value:0];
      [v5 addObject:v43];

      uint64_t v21 = v141;
      uint64_t v22 = v135;
    }
    int DeviceClass = GestaltGetDeviceClass();
    uint64_t v45 = [CMContinuityCaptureControl alloc];
    long long v142 = xmmword_2360595B0;
    uint64_t v143 = 1;
    uint64_t v46 = [(CMContinuityCaptureControl *)v45 initWithName:@"DeviceHasWideCamera" attributes:0 entity:1 minimumSupportedVersion:&v142 value:MEMORY[0x263EFFA88]];
    id v47 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v138 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v140 = v47;
    v133 = (void *)v46;
    if (DeviceClass == 3)
    {
      double v48 = v136;
      if (v22 && !v21)
      {
        [v5 addObject:v46];
        goto LABEL_23;
      }
    }
    else
    {
      double v48 = v136;
      if (v22)
      {
        [v5 addObject:v46];
        uint64_t v56 = NSNumber;
        [v22 manualFramingMinZoomFactor];
        long long v57 = objc_msgSend(v56, "numberWithDouble:");
        [v138 setObject:v57 forKeyedSubscript:*MEMORY[0x263F2C008]];

        v58 = NSNumber;
        [v22 manualFramingMaxZoomFactor];
        v59 = objc_msgSend(v58, "numberWithDouble:");
        [v138 setObject:v59 forKeyedSubscript:*MEMORY[0x263F2C000]];

        v60 = NSNumber;
        [v22 manualFramingDefaultZoomFactor];
        uint64_t v61 = objc_msgSend(v60, "numberWithDouble:");
        [v138 setObject:v61 forKeyedSubscript:*MEMORY[0x263F2BFF8]];

        uint64_t v62 = [NSDictionary dictionaryWithDictionary:v138];
        uint64_t v63 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
        [v47 setObject:v62 forKeyedSubscript:v63];
      }
    }
    if (v21)
    {
      uint64_t v64 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_2360595B0;
      uint64_t v143 = 1;
      uint64_t v65 = [(CMContinuityCaptureControl *)v64 initWithName:@"DeviceHasUltraWideCamera" attributes:0 entity:1 minimumSupportedVersion:&v142 value:MEMORY[0x263EFFA88]];
      [v5 addObject:v65];
      uint64_t v66 = NSNumber;
      [v21 manualFramingMinZoomFactor];
      uint64_t v67 = objc_msgSend(v66, "numberWithDouble:");
      [v138 setObject:v67 forKeyedSubscript:*MEMORY[0x263F2C008]];

      id v68 = NSNumber;
      [v21 manualFramingMaxZoomFactor];
      id v69 = objc_msgSend(v68, "numberWithDouble:");
      [v138 setObject:v69 forKeyedSubscript:*MEMORY[0x263F2C000]];

      v70 = NSNumber;
      [v21 manualFramingDefaultZoomFactor];
      v71 = objc_msgSend(v70, "numberWithDouble:");
      [v138 setObject:v71 forKeyedSubscript:*MEMORY[0x263F2BFF8]];

      uint64_t v72 = [NSDictionary dictionaryWithDictionary:v138];
      uint64_t v73 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 2);
      [v140 setObject:v72 forKeyedSubscript:v73];

      id v47 = v140;
    }
LABEL_23:
    if ([v47 count])
    {
      uint64_t v74 = [CMContinuityCaptureControl alloc];
      int64_t v75 = [NSDictionary dictionaryWithDictionary:v47];
      long long v142 = xmmword_2360595B0;
      uint64_t v143 = 1;
      v76 = [(CMContinuityCaptureControl *)v74 initWithName:@"ZoomFactorConstantsByManualFramingDeviceType" attributes:0 entity:1 minimumSupportedVersion:&v142 value:v75];

      [v5 addObject:v76];
    }
    v77 = [CMContinuityCaptureControl alloc];
    long long v142 = xmmword_236059598;
    uint64_t v143 = 0;
    v131 = [(CMContinuityCaptureControl *)v77 initWithName:@"FaceDetectionEnabled" attributes:0 entity:1 minimumSupportedVersion:&v142 value:MEMORY[0x263EFFA80]];
    objc_msgSend(v5, "addObject:");
    if (([a1 avcaptureDeviceSupportsFlash:v48] & 1) != 0
      || [a1 avcaptureDeviceSupportsFlash:v21])
    {
      id v78 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      BOOL v79 = [(CMContinuityCaptureControl *)v78 initWithName:@"Flash" attributes:0 entity:1 minimumSupportedVersion:&v142 value:MEMORY[0x263EFFA88]];
      [v5 addObject:v79];
    }
    v80 = [CMContinuityCaptureControl alloc];
    long long v142 = xmmword_236059598;
    uint64_t v143 = 0;
    uint64_t v81 = MEMORY[0x263EFFA80];
    v129 = [(CMContinuityCaptureControl *)v80 initWithName:@"AsyncStillCaptureEnabled" attributes:0 entity:1 minimumSupportedVersion:&v142 value:MEMORY[0x263EFFA80]];
    objc_msgSend(v5, "addObject:");
    v82 = [CMContinuityCaptureControl alloc];
    long long v142 = xmmword_236059598;
    uint64_t v143 = 0;
    v128 = [(CMContinuityCaptureControl *)v82 initWithName:@"AsyncStillCaptureConfigurations" attributes:0 entity:1 minimumSupportedVersion:&v142 value:0];
    objc_msgSend(v5, "addObject:");
    uint64_t v83 = [CMContinuityCaptureControl alloc];
    long long v142 = xmmword_236059598;
    uint64_t v143 = 0;
    v84 = [(CMContinuityCaptureControl *)v83 initWithName:@"HumanBodyDetectionEnabled" attributes:0 entity:1 minimumSupportedVersion:&v142 value:v81];
    [v5 addObject:v84];
    uint64_t v85 = [v22 supportedMetadataObjectIdentifiers];
    if ([v85 containsObject:@"mdta/com.apple.quicktime.detected-human-full-body"])
    {
    }
    else
    {
      unsigned int v86 = [v21 supportedMetadataObjectIdentifiers];
      int v87 = [v86 containsObject:@"mdta/com.apple.quicktime.detected-human-full-body"];

      if (!v87) {
        goto LABEL_32;
      }
    }
    long long v88 = [CMContinuityCaptureControl alloc];
    long long v142 = xmmword_236059598;
    uint64_t v143 = 0;
    long long v89 = [(CMContinuityCaptureControl *)v88 initWithName:@"HumanFullBodyDetectionEnabled" attributes:0 entity:1 minimumSupportedVersion:&v142 value:MEMORY[0x263EFFA80]];
    [v5 addObject:v89];

LABEL_32:
    long long v90 = [CMContinuityCaptureControl alloc];
    long long v142 = xmmword_236059598;
    uint64_t v143 = 0;
    long long v91 = [(CMContinuityCaptureControl *)v90 initWithName:@"SuppressVideoEffects" attributes:0 entity:1 minimumSupportedVersion:&v142 value:MEMORY[0x263EFFA80]];
    [v5 addObject:v91];
    if (([a1 avcaptureDeviceSupportsPortraitEffect:v48] & 1) != 0
      || [a1 avcaptureDeviceSupportsPortraitEffect:v21])
    {
      long long v92 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      uint64_t v93 = MEMORY[0x263EFFA80];
      long long v94 = [(CMContinuityCaptureControl *)v92 initWithName:@"PortraitEffectEnabled" attributes:0 entity:1 minimumSupportedVersion:&v142 value:MEMORY[0x263EFFA80]];
      [v5 addObject:v94];
      long long v95 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      v96 = [(CMContinuityCaptureControl *)v95 initWithName:@"PortraitEffectActive" attributes:0 entity:1 minimumSupportedVersion:&v142 value:v93];
      [v5 addObject:v96];
      v97 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      v98 = [(CMContinuityCaptureControl *)v97 initWithName:@"PortraitEffectAperture" attributes:0 entity:1 minimumSupportedVersion:&v142 value:&unk_26E96A7E8];
      [v5 addObject:v98];
    }
    uint64_t v99 = [CMContinuityCaptureControl alloc];
    long long v142 = xmmword_236059598;
    uint64_t v143 = 0;
    uint64_t v100 = [(CMContinuityCaptureControl *)v99 initWithName:@"PerFrameExifDataEnabled" attributes:0 entity:1 minimumSupportedVersion:&v142 value:MEMORY[0x263EFFA80]];
    [v5 addObject:v100];
    if (([a1 avcaptureDeviceSupportsStudioLighting:v48] & 1) != 0
      || [a1 avcaptureDeviceSupportsStudioLighting:v141])
    {
      v101 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      uint64_t v102 = MEMORY[0x263EFFA80];
      v103 = [(CMContinuityCaptureControl *)v101 initWithName:@"StudioLightingEnabled" attributes:0 entity:1 minimumSupportedVersion:&v142 value:MEMORY[0x263EFFA80]];
      [v5 addObject:v103];
      v104 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      v105 = [(CMContinuityCaptureControl *)v104 initWithName:@"StudioLightingActive" attributes:0 entity:1 minimumSupportedVersion:&v142 value:v102];
      [v5 addObject:v105];
      v106 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      v107 = [(CMContinuityCaptureControl *)v106 initWithName:@"StudioLightingIntensity" attributes:0 entity:1 minimumSupportedVersion:&v142 value:&unk_26E96A7F8];
      [v5 addObject:v107];
    }
    if (([a1 avcaptureDeviceSupportsReactionEffects:v48] & 1) != 0
      || [a1 avcaptureDeviceSupportsReactionEffects:v141])
    {
      v108 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      uint64_t v109 = MEMORY[0x263EFFA80];
      v110 = [(CMContinuityCaptureControl *)v108 initWithName:@"ReactionEffectsEnabled" attributes:0 entity:1 minimumSupportedVersion:&v142 value:MEMORY[0x263EFFA80]];
      [v5 addObject:v110];
      v111 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      v112 = [(CMContinuityCaptureControl *)v111 initWithName:@"ReactionEffectsActive" attributes:0 entity:1 minimumSupportedVersion:&v142 value:v109];
      [v5 addObject:v112];
      v113 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      v114 = [(CMContinuityCaptureControl *)v113 initWithName:@"GesturesEnabled" attributes:0 entity:1 minimumSupportedVersion:&v142 value:v109];
      [v5 addObject:v114];
      v115 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      v116 = [(CMContinuityCaptureControl *)v115 initWithName:@"ReactionsInProgress" attributes:0 entity:1 minimumSupportedVersion:&v142 value:MEMORY[0x263EFFA68]];
      [v5 addObject:v116];

      double v48 = v136;
    }
    if (([a1 avcaptureDeviceSupportsBackgroundReplacement:v48] & 1) != 0
      || [a1 avcaptureDeviceSupportsBackgroundReplacement:v141])
    {
      v117 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      uint64_t v118 = MEMORY[0x263EFFA80];
      v119 = [(CMContinuityCaptureControl *)v117 initWithName:@"BackgroundReplacementEnabled" attributes:0 entity:1 minimumSupportedVersion:&v142 value:MEMORY[0x263EFFA80]];
      [v5 addObject:v119];
      v120 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      v121 = [(CMContinuityCaptureControl *)v120 initWithName:@"BackgroundReplacementActive" attributes:0 entity:1 minimumSupportedVersion:&v142 value:v118];
      [v5 addObject:v121];
      v122 = [CMContinuityCaptureControl alloc];
      long long v142 = xmmword_236059598;
      uint64_t v143 = 0;
      v123 = [(CMContinuityCaptureControl *)v122 initWithName:@"BackgroundReplacementPixelBuffer" attributes:0 entity:1 minimumSupportedVersion:&v142 value:0];
      [v5 addObject:v123];
    }
    v124 = [CMContinuityCaptureControl alloc];
    long long v142 = xmmword_236059598;
    uint64_t v143 = 0;
    v125 = [(CMContinuityCaptureControl *)v124 initWithName:@"VideoZoomFactor" attributes:0 entity:1 minimumSupportedVersion:&v142 value:&unk_26E96A4B0];
    [v5 addObject:v125];

    unsigned int v11 = v134;
LABEL_45:

    goto LABEL_46;
  }
  long long v142 = xmmword_236059598;
  uint64_t v143 = 0;
  unsigned int v11 = [[CMContinuityCaptureControl alloc] initWithName:@"OverheadCameraMode" attributes:0 entity:2 minimumSupportedVersion:&v142 value:&unk_26E96A4C8];
  [v5 addObject:v11];
LABEL_46:

LABEL_47:
  v126 = (void *)[v5 copy];

  return v126;
}

+ (BOOL)avcaptureDeviceSupportsStudioLighting:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a3, "formats", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v8 isStudioLightSupported] & 1) != 0
          || ([v8 isStudioLightingSupportedForContinuityCamera] & 1) != 0)
        {
          BOOL v9 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_13:

  return v9;
}

+ (BOOL)avcaptureDeviceSupportsReactionEffects:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a3, "formats", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v8 reactionEffectsSupported] & 1) != 0
          || ([v8 reactionEffectsSupportedForContinuityCamera] & 1) != 0)
        {
          BOOL v9 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_13:

  return v9;
}

+ (BOOL)avcaptureDeviceSupportsBackgroundReplacement:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a3, "formats", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v8 isBackgroundReplacementSupported] & 1) != 0
          || ([v8 isBackgroundReplacementSupportedForContinuityCamera] & 1) != 0)
        {
          BOOL v9 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_13:

  return v9;
}

+ (BOOL)avcaptureDeviceSupportsCenterStage:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a3, "formats", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v8 isCenterStageSupported] & 1) != 0
          || ([v8 isCenterStageSupportedForContinuityCamera] & 1) != 0)
        {
          BOOL v9 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_13:

  return v9;
}

+ (BOOL)avcaptureDeviceSupportsFlash:(id)a3
{
  return [a3 hasFlash];
}

+ (BOOL)avcaptureDeviceSupportsPortraitEffect:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a3, "formats", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v8 isBackgroundBlurSupported] & 1) != 0
          || ([v8 isBackgroundBlurSupportedForContinuityCamera] & 1) != 0)
        {
          BOOL v9 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_13:

  return v9;
}

- (BOOL)supportsControlWithName:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(CMContinuityCaptureDeviceCapabilities *)self controls];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        BOOL v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) name];
        char v10 = [v9 isEqualToString:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)debugDescription
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v6 = self->_streamFormats;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v39 + 1) + 8 * i) name];
        [v3 addObject:v11];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v8);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v12 = self->_manualFramingSupportedStreamFormats;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [*(id *)(*((void *)&v35 + 1) + 8 * j) name];
        [v4 addObject:v17];
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v14);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v18 = self->_controls;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        char v23 = [*(id *)(*((void *)&v31 + 1) + 8 * k) name];
        [v5 addObject:v23];
      }
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v20);
  }

  int v24 = NSString;
  int64_t entityType = self->_entityType;
  uint64_t v26 = [v3 componentsJoinedByString:@", "];
  long long v27 = [v4 componentsJoinedByString:@", "];
  long long v28 = [v5 componentsJoinedByString:@", "];
  long long v29 = [v24 stringWithFormat:@"entity: %d, formats: [%@], ManualFraming formats: [%@], controls: [%@]", entityType, v26, v27, v28, (void)v31];

  return (NSString *)v29;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(CMContinuityCaptureDeviceCapabilities *)self debugDescription];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p %@>", v5, self, v6];

  return (NSString *)v7;
}

- (int64_t)entityType
{
  return self->_entityType;
}

- (NSArray)streamFormats
{
  return self->_streamFormats;
}

- (NSArray)manualFramingSupportedStreamFormats
{
  return self->_manualFramingSupportedStreamFormats;
}

- (NSArray)controls
{
  return self->_controls;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manualFramingSupportedStreamFormats, 0);
  objc_storeStrong((id *)&self->_controls, 0);
  objc_storeStrong((id *)&self->_streamFormats, 0);
}

- (void)initWithDictionaryRepresentation:.cold.1()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "Missing CMContinuityCaptureDeviceCapabilitiesKey_EntityType", v2, v3, v4, v5, v6);
}

- (void)initWithDictionaryRepresentation:.cold.2()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "Missing CMContinuityCaptureDeviceCapabilitiesKey_StreamFormats", v2, v3, v4, v5, v6);
}

- (void)initWithDictionaryRepresentation:.cold.3()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "Missing CMContinuityCaptureDeviceCapabilitiesKey_Controls", v2, v3, v4, v5, v6);
}

+ (void)_resolvedStreamFormatsForEntityType:(int)a1 requireManualFramingSupport:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_235FC2000, a2, OS_LOG_TYPE_ERROR, "Unexpected entity type: %d", (uint8_t *)v2, 8u);
}

+ (void)_resolvedStreamFormatsForEntityType:(uint64_t)a3 requireManualFramingSupport:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_resolvedControlsForEntityType:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end