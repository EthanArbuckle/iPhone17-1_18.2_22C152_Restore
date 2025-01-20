@interface FigCaptureSessionParsedConfiguration
+ (void)initialize;
- (BOOL)clientIsVOIP;
- (BOOL)continuityCameraIsWired;
- (BOOL)empty;
- (BOOL)isMultiCamSession;
- (BOOL)smartStyleRenderingEnabled;
- (BOOL)suppressVideoEffects;
- (BOOL)useOfflineVISPipeline;
- (FigCaptureSessionParsedConfiguration)initWithSessionConfiguration:(id)a3 clientSetsUserInitiatedCaptureRequestTime:(BOOL)a4 restrictions:(id)a5;
- (FigCaptureSessionParsedMicSourceConfiguration)parsedMicSourceConfiguration;
- (FigCaptureSmartStyle)smartStyle;
- (NSArray)audioDataSinkConnectionConfigurations;
- (NSArray)audioFileSinkConnectionConfigurations;
- (NSArray)cameraCalibrationDataSinkConnectionConfigurations;
- (NSArray)metadataSourceConfigurations;
- (NSArray)parsedCameraSourceConfigurations;
- (NSArray)parsedCinematographyConfigurations;
- (NSArray)parsedDepthDataSinkConfigurations;
- (NSArray)parsedLiDARDepthPipelineConfigurations;
- (NSArray)parsedMetadataSinkConfigurations;
- (NSArray)parsedMovieFileSinkConfigurations;
- (NSArray)parsedPreviewSinkConfigurations;
- (NSArray)parsedStillImageSinkConfigurations;
- (NSArray)parsedVideoDataSinkConfigurations;
- (NSArray)parsedVisionDataSinkConfigurations;
- (NSArray)pointCloudDataSinkConnectionConfigurations;
- (NSArray)videoThumbnailSinkConfigurations;
- (int)continuityCameraClientDeviceClass;
- (int64_t)smartStyleControlMode;
- (uint64_t)_computeVideoStabilizationTypes;
- (uint64_t)_parseConfiguration:(char)a3 clientSetsUserInitiatedCaptureRequestTime:(void *)a4 restrictions:;
- (void)dealloc;
@end

@implementation FigCaptureSessionParsedConfiguration

- (uint64_t)_parseConfiguration:(char)a3 clientSetsUserInitiatedCaptureRequestTime:(void *)a4 restrictions:
{
  uint64_t v374 = *MEMORY[0x1E4F143B8];
  uint64_t v237 = result;
  if (!result) {
    return result;
  }
  unsigned int v349 = 0;
  v257 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v258 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v259 = v5;
  if (([a4 allowAllConfigurations] & 1) == 0)
  {
    long long v348 = 0u;
    long long v347 = 0u;
    long long v346 = 0u;
    long long v345 = 0u;
    v6 = (void *)[a2 connectionConfigurations];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v345 objects:v372 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v346;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v346 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v345 + 1) + 8 * i);
          uint64_t v12 = [v11 mediaType];
          v13 = (void *)[a4 allowedConnectionMediaTypes];
          if ((objc_msgSend(v13, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12)) & 1) == 0) {
            return -12780;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v344 = 0u;
            long long v343 = 0u;
            long long v342 = 0u;
            long long v341 = 0u;
            v14 = (void *)[v11 metadataIdentifiers];
            uint64_t v15 = [v14 countByEnumeratingWithState:&v341 objects:v371 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v342;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v342 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  if (!objc_msgSend((id)objc_msgSend(a4, "allowedConnectionMetadataIdentifiers"), "containsObject:", *(void *)(*((void *)&v341 + 1) + 8 * j)))return -12780; {
                }
                  }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v341 objects:v371 count:16];
              }
              while (v16);
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v345 objects:v372 count:16];
        v5 = v259;
      }
      while (v8);
    }
  }
  v19 = (void *)[a2 connectionConfigurations];
  v20 = (void *)[v19 indexesOfObjectsPassingTest:&__block_literal_global_518];
  if ([v20 count]) {
    v21 = (void *)[v19 objectsAtIndexes:v20];
  }
  else {
    v21 = 0;
  }
  if (![v21 count])
  {
    v62 = 0;
    v63 = 0;
    v260 = 0;
    obuint64_t j = 0;
    v253 = 0;
    v255 = 0;
    v264 = 0;
    v265 = 0;
    v64 = 0;
    v248 = 0;
    v65 = 0;
    v267 = 0;
    v251 = 0;
    v276 = 0;
    v270 = 0;
    v66 = 0;
    v67 = 0;
    *(unsigned char *)(v237 + 8) = 1;
    goto LABEL_457;
  }
  v22 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v21];
  long long v337 = 0u;
  long long v338 = 0u;
  long long v339 = 0u;
  long long v340 = 0u;
  uint64_t v23 = [v21 countByEnumeratingWithState:&v337 objects:v370 count:16];
  if (!v23) {
    goto LABEL_91;
  }
  uint64_t v24 = v23;
  uint64_t v25 = *(void *)v338;
LABEL_27:
  uint64_t v26 = 0;
  while (1)
  {
    if (*(void *)v338 != v25) {
      objc_enumerationMutation(v21);
    }
    v27 = *(void **)(*((void *)&v337 + 1) + 8 * v26);
    if (objc_msgSend((id)objc_msgSend(v27, "sourceConfiguration"), "sourceDeviceType") == 13) {
      break;
    }
    if (v24 == ++v26)
    {
      uint64_t v24 = [v21 countByEnumeratingWithState:&v337 objects:v370 count:16];
      if (v24) {
        goto LABEL_27;
      }
      goto LABEL_91;
    }
  }
  v28 = (void *)[v27 sourceConfiguration];
  int v354 = 0;
  if ([v28 sourceDeviceType] != 13)
  {
    fig_log_get_emitter();
    uint64_t v235 = v241;
    LODWORD(v233) = 0;
    FigDebugAssert3();
    goto LABEL_91;
  }
  uint64_t v29 = [v28 source];
  v30 = (const void *)FigVideoCaptureSourceCopyUnderlyingCaptureSourceForPortType(v29, *MEMORY[0x1E4F52DE0], &v354);
  int v31 = v354;
  if (v354) {
    goto LABEL_44;
  }
  v373.receiver = 0;
  uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v32) {
    uint64_t v33 = v32;
  }
  else {
    uint64_t v33 = 0;
  }
  v34 = *(uint64_t (**)(const void *, __CFString *, void, objc_super *))(v33 + 48);
  if (!v34)
  {
    int v31 = -12782;
    int v354 = -12782;
LABEL_44:
    fig_log_get_emitter();
    uint64_t v235 = v241;
    LODWORD(v233) = v31;
    FigDebugAssert3();
    v38 = 0;
    goto LABEL_54;
  }
  uint64_t v35 = *MEMORY[0x1E4F1CF80];
  int v36 = v34(v30, @"Formats", *MEMORY[0x1E4F1CF80], &v373);
  int v354 = v36;
  if (v36)
  {
    int v31 = v36;
    goto LABEL_44;
  }
  v37 = cspc_timeOfFlightFormatWithMaximumPoints(v373.receiver);
  v38 = [[FigCaptureSourceConfiguration alloc] initWithSource:v30];
  v39 = NSString;
  v40 = (objc_class *)objc_opt_class();
  -[FigCaptureSourceConfiguration setSourceID:](v38, "setSourceID:", [v39 stringWithFormat:@"<%@: %p>", NSStringFromClass(v40), v38]);
  [(FigCaptureSourceConfiguration *)v38 setRequiredFormat:v37];

  *(void *)&long long v350 = 0;
  uint64_t v41 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v41) {
    uint64_t v42 = v41;
  }
  else {
    uint64_t v42 = 0;
  }
  v43 = *(uint64_t (**)(const void *, __CFString *, uint64_t, long long *))(v42 + 48);
  if (!v43)
  {
    int v48 = -12782;
    int v354 = -12782;
LABEL_53:
    fig_log_get_emitter();
    uint64_t v235 = v241;
    LODWORD(v233) = v48;
    FigDebugAssert3();
    goto LABEL_54;
  }
  int v44 = v43(v30, @"AttributesDictionary", v35, &v350);
  int v354 = v44;
  if (v44)
  {
    int v48 = v44;
    goto LABEL_53;
  }
  if (objc_msgSend((id)objc_msgSend((id)v350, "objectForKeyedSubscript:", @"TimeOfFlightCameraType"), "intValue") == 2)float v46 = 60.0; {
  else
  }
    float v46 = 30.0;
  *(float *)&double v45 = v46;
  [(FigCaptureSourceConfiguration *)v38 setRequiredMinFrameRate:v45];
  *(float *)&double v47 = v46;
  [(FigCaptureSourceConfiguration *)v38 setRequiredMaxFrameRate:v47];
  [v37 maxSupportedFrameRate];
  -[FigCaptureSourceConfiguration setMaxFrameRateClientOverride:](v38, "setMaxFrameRateClientOverride:");

LABEL_54:
  if (v30) {
    CFRelease(v30);
  }
  if (v38)
  {
    long long v350 = 0u;
    long long v351 = 0u;
    long long v352 = 0u;
    long long v353 = 0u;
    uint64_t v49 = [v21 countByEnumeratingWithState:&v350 objects:&v373 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v351;
LABEL_59:
      uint64_t v52 = 0;
      while (1)
      {
        if (*(void *)v351 != v51) {
          objc_enumerationMutation(v21);
        }
        v53 = *(void **)(*((void *)&v350 + 1) + 8 * v52);
        if (objc_msgSend((id)objc_msgSend(v53, "sourceConfiguration", v233, v235), "sourceDeviceType") == 13
          && objc_msgSend((id)objc_msgSend(v53, "sinkConfiguration"), "sinkType") == 11)
        {
          break;
        }
        if (v50 == ++v52)
        {
          uint64_t v50 = [v21 countByEnumeratingWithState:&v350 objects:&v373 count:16];
          if (v50) {
            goto LABEL_59;
          }
          goto LABEL_66;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        PointCloudConnectionConfigurationForLiDARDepth = cspc_getPointCloudConnectionConfigurationForLiDARDepth(v53, v38);
        goto LABEL_69;
      }
      fig_log_get_emitter();
      uint64_t v235 = v241;
      LODWORD(v233) = 0;
      FigDebugAssert3();
    }
LABEL_66:
    PointCloudConnectionConfigurationForLiDARDepth = 0;
LABEL_69:
    long long v350 = 0u;
    long long v351 = 0u;
    long long v352 = 0u;
    long long v353 = 0u;
    uint64_t v55 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v350, &v373, 16, v233, v235);
    if (v55)
    {
      uint64_t v56 = v55;
      v57 = PointCloudConnectionConfigurationForLiDARDepth;
      uint64_t v58 = *(void *)v351;
LABEL_71:
      uint64_t v59 = 0;
      while (1)
      {
        if (*(void *)v351 != v58) {
          objc_enumerationMutation(v21);
        }
        v60 = *(void **)(*((void *)&v350 + 1) + 8 * v59);
        if (objc_msgSend((id)objc_msgSend(v60, "sourceConfiguration"), "sourceDeviceType") == 13
          && objc_msgSend((id)objc_msgSend(v60, "sinkConfiguration"), "sinkType") == 10
          && objc_msgSend((id)objc_msgSend(v60, "sinkConfiguration"), "depthDataDeliveryEnabled"))
        {
          break;
        }
        if (v56 == ++v59)
        {
          uint64_t v56 = [v21 countByEnumeratingWithState:&v350 objects:&v373 count:16];
          if (v56) {
            goto LABEL_71;
          }
          goto LABEL_79;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        fig_log_get_emitter();
        uint64_t v235 = v241;
        LODWORD(v233) = 0;
        FigDebugAssert3();
LABEL_79:
        v61 = 0;
        goto LABEL_82;
      }
      v61 = cspc_getPointCloudConnectionConfigurationForLiDARDepth(v60, v38);
LABEL_82:
      PointCloudConnectionConfigurationForLiDARDepth = v57;
      if (!v57) {
        goto LABEL_84;
      }
    }
    else
    {
      v61 = 0;
      if (!PointCloudConnectionConfigurationForLiDARDepth)
      {
LABEL_84:
        if (v61)
        {
          v273 = v61;
          [v22 addObject:v61];
        }
        else
        {
          v273 = 0;
        }
        goto LABEL_92;
      }
    }
    objc_msgSend(v22, "addObject:", PointCloudConnectionConfigurationForLiDARDepth, v233, v235);
    goto LABEL_84;
  }
LABEL_91:
  v273 = 0;
  PointCloudConnectionConfigurationForLiDARDepth = 0;
LABEL_92:
  v68 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v22, v233, v235);
  int v354 = 0;
  int v69 = 1;
  v70 = FigCaptureConnectionConfigurationWithSinkTypeAndMediaType(v68, 1, 1986618469);
  v71 = FigCaptureConnectionConfigurationWithSinkTypeAndMediaType(v68, 10, 1986618469);
  v72 = (void *)[v71 sourceConfiguration];
  v73 = (void *)[v71 sinkConfiguration];
  if (([v73 digitalFlashCaptureEnabled] & 1) == 0) {
    int v69 = objc_msgSend((id)objc_msgSend(v72, "requiredFormat"), "configureForDigitalFlashSupport");
  }
  if ([v73 depthDataDeliveryEnabled]) {
    int v74 = 1;
  }
  else {
    int v74 = objc_msgSend((id)objc_msgSend(v72, "requiredFormat"), "configureForDepthDataDelivery");
  }
  if (objc_msgSend((id)objc_msgSend(v72, "requiredFormat"), "isSupplementalTimeOfFlightCameraSupported")) {
    int v75 = 1;
  }
  else {
    int v75 = objc_msgSend((id)objc_msgSend(v72, "requiredFormat"), "configureForSupplementalTimeOfFlightCameraSupport");
  }
  if ([v70 portraitAutoSuggestEnabled]) {
    int v76 = 1;
  }
  else {
    int v76 = objc_msgSend((id)objc_msgSend(v72, "requiredFormat"), "isPortraitAutoSuggestSupported");
  }
  v239 = PointCloudConnectionConfigurationForLiDARDepth;
  if ((v69 & v74 & v75) == 1 && ([v73 irisMovieCaptureEnabled] ^ 1 | v76) == 1)
  {
    uint64_t v77 = FigVideoCaptureSourceCopySupplementalTimeOfFlightCaptureSource([v72 source], &v354);
    int v78 = v354;
    if (!v354)
    {
      v79 = (const void *)v77;
      if (!v77)
      {
        unsigned int v349 = 0;
        goto LABEL_137;
      }
      *(void *)&long long v350 = 0;
      uint64_t v80 = *MEMORY[0x1E4F1CF80];
      uint64_t v81 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v81) {
        uint64_t v82 = v81;
      }
      else {
        uint64_t v82 = 0;
      }
      v83 = *(void (**)(const void *, __CFString *, uint64_t, long long *))(v82 + 48);
      if (v83)
      {
        v83(v79, @"AttributesDictionary", v80, &v350);
        v84 = (void *)v350;
      }
      else
      {
        v84 = 0;
      }
      v85 = (void *)[v84 objectForKeyedSubscript:@"SupportedTimeOfFlightProjectorModes"];
      if ([v85 containsObject:&unk_1EFAFEBB0])
      {
        uint64_t v86 = 3;
      }
      else if ([v85 containsObject:&unk_1EFAFEBC8])
      {
        uint64_t v86 = 5;
      }
      else
      {
        if (![v85 containsObject:&unk_1EFAFEB98]) {
          goto LABEL_129;
        }
        uint64_t v86 = 1;
      }

      v373.receiver = 0;
      uint64_t v87 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v87) {
        uint64_t v88 = v87;
      }
      else {
        uint64_t v88 = 0;
      }
      v89 = *(unsigned int (**)(const void *, __CFString *, uint64_t, objc_super *))(v88 + 48);
      if (!v89
        || v89(v79, @"Formats", v80, &v373)
        || (v90 = cspc_timeOfFlightFormatWithMaximumPoints(v373.receiver),
            [v90 minSupportedFrameRate],
            v91 > 0.0))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      else
      {
        v92 = [[FigCaptureSourceConfiguration alloc] initWithSource:v79];
        v93 = NSString;
        v94 = (objc_class *)objc_opt_class();
        -[FigCaptureSourceConfiguration setSourceID:](v92, "setSourceID:", [v93 stringWithFormat:@"<%@: %p>", NSStringFromClass(v94), v79]);
        [(FigCaptureSourceConfiguration *)v92 setRequiredFormat:v90];
        [(FigCaptureSourceConfiguration *)v92 setRequiredMinFrameRate:0.0];
        [v90 maxSupportedFrameRate];
        -[FigCaptureSourceConfiguration setRequiredMaxFrameRate:](v92, "setRequiredMaxFrameRate:");
        [v90 maxSupportedFrameRate];
        -[FigCaptureSourceConfiguration setMaxFrameRateClientOverride:](v92, "setMaxFrameRateClientOverride:");

        v95 = objc_alloc_init(FigPointCloudDataCaptureConnectionConfiguration);
        [(FigCaptureConnectionConfiguration *)v95 setMediaType:1885564004];
        [(FigPointCloudDataCaptureConnectionConfiguration *)v95 setProjectorMode:v86];
        v96 = NSString;
        v97 = (objc_class *)objc_opt_class();
        -[FigCaptureConnectionConfiguration setConnectionID:](v95, "setConnectionID:", [v96 stringWithFormat:@"<%@: %p>", NSStringFromClass(v97), v95]);
        [(FigCaptureConnectionConfiguration *)v95 setSourceConfiguration:v92];
        [(FigCaptureConnectionConfiguration *)v95 setUnderlyingDeviceType:10];
        PointCloudConnectionConfigurationForLiDARDepth = v239;
        if (v95)
        {
          [(FigPointCloudDataCaptureConnectionConfiguration *)v95 setSupplementalPointCloudData:1];
          [(FigCaptureConnectionConfiguration *)v95 setSinkConfiguration:v73];
          objc_msgSend((id)objc_msgSend(v72, "requiredFormat"), "isSupplementalTimeOfFlightCameraSupported");
          [(FigPointCloudDataCaptureConnectionConfiguration *)v95 setPointCloudOutputDisabled:0];
          CFRelease(v79);
          goto LABEL_134;
        }
      }
LABEL_129:
      unsigned int v349 = -12780;
LABEL_130:
      fig_log_get_emitter();
LABEL_435:
      FigDebugAssert3();
      return v349;
    }
    fig_log_get_emitter();
    uint64_t v236 = v241;
    LODWORD(v234) = v78;
    FigDebugAssert3();
  }
  v95 = 0;
LABEL_134:
  unsigned int v349 = v354;
  if (v354) {
    goto LABEL_130;
  }
  if (v95)
  {
    v68 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v68];
    [v68 addObject:v95];
  }
LABEL_137:
  long long v336 = 0u;
  long long v335 = 0u;
  long long v334 = 0u;
  long long v333 = 0u;
  uint64_t v98 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v333, v369, 16, v234, v236);
  if (!v98) {
    goto LABEL_172;
  }
  uint64_t v99 = v98;
  id v100 = 0;
  char v101 = 0;
  char v102 = 0;
  uint64_t v103 = 0;
  uint64_t v104 = *(void *)v334;
  while (2)
  {
    for (uint64_t k = 0; k != v99; ++k)
    {
      if (*(void *)v334 != v104) {
        objc_enumerationMutation(v68);
      }
      v106 = *(void **)(*((void *)&v333 + 1) + 8 * k);
      if ((objc_msgSend((id)objc_msgSend(v106, "sourceConfiguration"), "sourceDeviceType") == 7
         || objc_msgSend((id)objc_msgSend(v106, "sourceConfiguration"), "sourceDeviceType") == 8)
        && (objc_msgSend((id)objc_msgSend(v106, "sourceConfiguration"), "sourcePosition") == 1
          ? (BOOL v107 = v100 == 0)
          : (BOOL v107 = 0),
            v107))
      {
        id v100 = (id)objc_msgSend((id)objc_msgSend(v106, "sourceConfiguration"), "copy");
        char v101 = 1;
      }
      else
      {
        if (objc_msgSend((id)objc_msgSend(v106, "sourceConfiguration"), "sourceDeviceType") == 14)
        {
          uint64_t v103 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v106, "sourceConfiguration"), "requiredFormat"), "cinematicFramingOutputDimensions");
          objc_msgSend((id)objc_msgSend(v106, "sourceConfiguration"), "setDeskCamOutputDimensions:", v103);
          char v102 = 1;
        }
        if ((v101 & 1) == 0) {
          continue;
        }
      }
      if (v102)
      {
        char v101 = 1;
        char v102 = 1;
        goto LABEL_158;
      }
    }
    uint64_t v99 = [v68 countByEnumeratingWithState:&v333 objects:v369 count:16];
    if (v99) {
      continue;
    }
    break;
  }
LABEL_158:
  PointCloudConnectionConfigurationForLiDARDepth = v239;
  if (v101 & 1) != 0 && (v102)
  {
    long long v332 = 0u;
    long long v331 = 0u;
    long long v330 = 0u;
    long long v329 = 0u;
    uint64_t v108 = [v68 countByEnumeratingWithState:&v329 objects:v368 count:16];
    if (v108)
    {
      uint64_t v109 = v108;
      uint64_t v110 = *(void *)v330;
      do
      {
        for (uint64_t m = 0; m != v109; ++m)
        {
          if (*(void *)v330 != v110) {
            objc_enumerationMutation(v68);
          }
          v112 = *(void **)(*((void *)&v329 + 1) + 8 * m);
          if (objc_msgSend((id)objc_msgSend(v112, "sourceConfiguration"), "sourceDeviceType") == 14)
          {
            [v112 setSourceConfiguration:v100];
LABEL_169:
            objc_msgSend((id)objc_msgSend(v112, "sourceConfiguration"), "setDeskCamEnabled:", 1);
            objc_msgSend((id)objc_msgSend(v112, "sourceConfiguration"), "setDeskCamOutputDimensions:", v103);
            continue;
          }
          if (objc_msgSend((id)objc_msgSend(v112, "sourceConfiguration"), "sourceDeviceType") == 7
            || objc_msgSend((id)objc_msgSend(v112, "sourceConfiguration"), "sourceDeviceType") == 8)
          {
            goto LABEL_169;
          }
        }
        uint64_t v109 = [v68 countByEnumeratingWithState:&v329 objects:v368 count:16];
      }
      while (v109);
    }
  }
LABEL_172:
  long long v328 = 0u;
  long long v327 = 0u;
  long long v326 = 0u;
  long long v325 = 0u;
  uint64_t v113 = [v68 countByEnumeratingWithState:&v325 objects:v367 count:16];
  if (v113)
  {
    uint64_t v114 = v113;
    v271 = 0;
    uint64_t v115 = *(void *)v326;
    v116 = v257;
    do
    {
      for (uint64_t n = 0; n != v114; ++n)
      {
        if (*(void *)v326 != v115) {
          objc_enumerationMutation(v68);
        }
        v118 = *(FigPointCloudDataCaptureConnectionConfiguration **)(*((void *)&v325 + 1) + 8 * n);
        if (![(FigCaptureConnectionConfiguration *)v118 connectionID]
          || (v119 = [(FigCaptureConnectionConfiguration *)v118 sourceConfiguration],
              (uint64_t v120 = [(FigCaptureSourceConfiguration *)v119 sourceID]) == 0))
        {
LABEL_436:
          fig_log_get_emitter();
          goto LABEL_449;
        }
        uint64_t v121 = v120;
        if (![v257 objectForKeyedSubscript:v120]) {
          objc_msgSend(v257, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"), v121);
        }
        objc_msgSend((id)objc_msgSend(v257, "objectForKeyedSubscript:", v121), "addObject:", v118);
        if (v118 != PointCloudConnectionConfigurationForLiDARDepth && v118 != v273)
        {
          if ([(FigCaptureConnectionConfiguration *)v118 smartCameraRequired]) {
            [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)v118 sourceConfiguration] setSmartCameraEnabled:1];
          }
          if ([a2 smartStyleRenderingEnabled]
            && ([(FigCaptureConnectionConfiguration *)v118 videoPreviewSinkConfiguration]|| [(FigCaptureConnectionConfiguration *)v118 videoDataSinkConfiguration]|| [(FigCaptureConnectionConfiguration *)v118 movieFileSinkConfiguration]|| [(FigCaptureConnectionConfiguration *)v118 stillImageSinkConfiguration]))
          {
            [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)v118 sourceConfiguration] setSmartCameraEnabled:1];
          }
          uint64_t v123 = [(FigCaptureSinkConfiguration *)[(FigCaptureConnectionConfiguration *)v118 sinkConfiguration] sinkID];
          if (!v123) {
            goto LABEL_436;
          }
          uint64_t v124 = v123;
          if (![v5 objectForKeyedSubscript:v123]) {
            objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"), v124);
          }
          objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", v124), "addObject:", v118);
          if (!v271)
          {
            if ([(FigCaptureSourceConfiguration *)v119 sourceType] == 1) {
              v125 = v119;
            }
            else {
              v125 = 0;
            }
            v271 = v125;
          }
        }
      }
      uint64_t v114 = [v68 countByEnumeratingWithState:&v325 objects:v367 count:16];
    }
    while (v114);
  }
  else
  {
    v271 = 0;
    v116 = v257;
  }
  long long v323 = 0u;
  long long v324 = 0u;
  long long v321 = 0u;
  long long v322 = 0u;
  v269 = v68;
  uint64_t v252 = [v116 countByEnumeratingWithState:&v321 objects:v366 count:16];
  v65 = 0;
  if (v252)
  {
    v276 = 0;
    v270 = 0;
    v238 = 0;
    v240 = 0;
    uint64_t v254 = *(void *)v322;
    do
    {
      uint64_t v126 = 0;
      do
      {
        if (*(void *)v322 != v254)
        {
          uint64_t v127 = v126;
          objc_enumerationMutation(v116);
          uint64_t v126 = v127;
        }
        uint64_t v256 = v126;
        uint64_t v128 = *(void *)(*((void *)&v321 + 1) + 8 * v126);
        v129 = (void *)[v116 objectForKeyedSubscript:v128];
        v130 = objc_msgSend((id)objc_msgSend(v129, "firstObject"), "sourceConfiguration");
        int v131 = [v130 sourceType];
        if (v131 == 4)
        {
          if (!v270) {
            v270 = (void *)[MEMORY[0x1E4F1CA48] array];
          }
          long long v299 = 0u;
          long long v300 = 0u;
          long long v297 = 0u;
          long long v298 = 0u;
          uint64_t v167 = [v129 countByEnumeratingWithState:&v297 objects:v360 count:16];
          v5 = v259;
          if (v167)
          {
            uint64_t v168 = v167;
            uint64_t v169 = *(void *)v298;
            do
            {
              for (iuint64_t i = 0; ii != v168; ++ii)
              {
                if (*(void *)v298 != v169) {
                  objc_enumerationMutation(v129);
                }
                v171 = *(void **)(*((void *)&v297 + 1) + 8 * ii);
                if (![v171 formatDescription]
                  || !-[__CFArray count](CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)[v171 formatDescription]), "count"))
                {
                  fig_log_get_emitter();
                  goto LABEL_449;
                }
                [v270 addObject:v171];
              }
              uint64_t v168 = [v129 countByEnumeratingWithState:&v297 objects:v360 count:16];
            }
            while (v168);
          }
        }
        else if (v131 == 2)
        {
          if (v238) {
            return FigSignalErrorAt();
          }
          if (v271)
          {
            v161 = objc_msgSend(v116, "objectForKeyedSubscript:", -[FigCaptureSourceConfiguration sourceID](v271, "sourceID"));
            long long v301 = 0u;
            long long v302 = 0u;
            long long v303 = 0u;
            long long v304 = 0u;
            uint64_t v162 = [v161 countByEnumeratingWithState:&v301 objects:v361 count:16];
            v5 = v259;
            if (v162)
            {
              uint64_t v163 = v162;
              uint64_t v164 = *(void *)v302;
LABEL_282:
              uint64_t v165 = 0;
              while (1)
              {
                if (*(void *)v302 != v164) {
                  objc_enumerationMutation(v161);
                }
                v166 = *(void **)(*((void *)&v301 + 1) + 8 * v165);
                if (objc_msgSend((id)objc_msgSend(v166, "sinkConfiguration"), "sinkType") == 4
                  && [v166 mediaType] == 1986618469)
                {
                  break;
                }
                if (v163 == ++v165)
                {
                  uint64_t v163 = [v161 countByEnumeratingWithState:&v301 objects:v361 count:16];
                  if (v163) {
                    goto LABEL_282;
                  }
                  goto LABEL_289;
                }
              }
            }
            else
            {
LABEL_289:
              v166 = 0;
            }
          }
          else
          {
            v166 = 0;
            v5 = v259;
          }
          v238 = -[FigCaptureSessionParsedMicSourceConfiguration initWithMicConnectionConfigurations:cameraConfigurationForStereoAudioCapture:movieFileVideoConnectionConfigurationForStereoAudioCapture:]([FigCaptureSessionParsedMicSourceConfiguration alloc], v129, v271, v166);
          v116 = v257;
        }
        else
        {
          if (v131 == 1)
          {
            if (!v240) {
              v240 = (void *)[MEMORY[0x1E4F1CA48] array];
            }
            *(void *)&long long v350 = 0;
            id v132 = -[FigCaptureSessionParsedCameraSourceConfiguration initWithConnectionConfigurations:clientSetsUserInitiatedCaptureRequestTime:smartStyleEnabled:sceneClassifierConnectionConfigurationOut:]([FigCaptureSessionParsedCameraSourceConfiguration alloc], v129, a3, [a2 smartStyleRenderingEnabled], (FigVideoCaptureConnectionConfiguration **)&v350);
            if (!v132) {
              return FigSignalErrorAt();
            }
            v133 = v132;
            [v240 addObject:v132];
            if ((void)v350) {
              objc_msgSend(v258, "setObject:forKeyedSubscript:", (void)v350, objc_msgSend(v130, "sourceID"));
            }
            v134 = FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations((void *)[v133 previewDerivedConnectionConfigurations]);
            long long v317 = 0u;
            long long v318 = 0u;
            long long v319 = 0u;
            long long v320 = 0u;
            uint64_t v135 = [v134 countByEnumeratingWithState:&v317 objects:v365 count:16];
            if (v135)
            {
              uint64_t v136 = v135;
              uint64_t v137 = *(void *)v318;
              do
              {
                for (juint64_t j = 0; jj != v136; ++jj)
                {
                  if (*(void *)v318 != v137) {
                    objc_enumerationMutation(v134);
                  }
                  v139 = -[FigCaptureSessionParsedPreviewSinkConfiguration initWithParsedCameraSourceConfiguration:sourceDeviceType:]([FigCaptureSessionParsedPreviewSinkConfiguration alloc], v133, [*(id *)(*((void *)&v317 + 1) + 8 * jj) intValue]);
                  if (v139)
                  {
                    v140 = v139;
                    v141 = v276;
                    if (!v276) {
                      v141 = (void *)[MEMORY[0x1E4F1CA48] array];
                    }
                    v276 = v141;
                    [v141 addObject:v140];
                  }
                }
                uint64_t v136 = [v134 countByEnumeratingWithState:&v317 objects:v365 count:16];
              }
              while (v136);
            }
            long long v315 = 0u;
            long long v316 = 0u;
            long long v313 = 0u;
            long long v314 = 0u;
            v142 = (void *)[v133 videoDataConnectionConfigurations];
            uint64_t v143 = [v142 countByEnumeratingWithState:&v313 objects:v364 count:16];
            if (v143)
            {
              uint64_t v144 = v143;
              uint64_t v145 = *(void *)v314;
              do
              {
                for (kuint64_t k = 0; kk != v144; ++kk)
                {
                  if (*(void *)v314 != v145) {
                    objc_enumerationMutation(v142);
                  }
                  v147 = *(void **)(*((void *)&v313 + 1) + 8 * kk);
                  if ((int)[v147 outputWidth] < 1 || (int)objc_msgSend(v147, "outputHeight") < 1) {
                    return v349;
                  }
                  id v148 = -[FigCaptureSessionParsedVideoDataSinkConfiguration initWithVideoDataConnectionConfiguration:]([FigCaptureSessionParsedVideoDataSinkConfiguration alloc], v147);
                  if (!v65) {
                    v65 = (void *)[MEMORY[0x1E4F1CA48] array];
                  }
                  [v65 addObject:v148];
                }
                uint64_t v144 = [v142 countByEnumeratingWithState:&v313 objects:v364 count:16];
              }
              while (v144);
            }
            long long v311 = 0u;
            long long v312 = 0u;
            long long v309 = 0u;
            long long v310 = 0u;
            id obja = (id)[v133 metadataObjectConnectionConfigurations];
            uint64_t v268 = [obja countByEnumeratingWithState:&v309 objects:v363 count:16];
            if (v268)
            {
              uint64_t v266 = *(void *)v310;
              do
              {
                for (muint64_t m = 0; mm != v268; ++mm)
                {
                  if (*(void *)v310 != v266) {
                    objc_enumerationMutation(obja);
                  }
                  v274 = *(void **)(*((void *)&v309 + 1) + 8 * mm);
                  int v150 = [v274 underlyingDeviceType];
                  long long v305 = 0u;
                  long long v306 = 0u;
                  long long v307 = 0u;
                  long long v308 = 0u;
                  uint64_t v151 = [v65 countByEnumeratingWithState:&v305 objects:v362 count:16];
                  if (v151)
                  {
                    uint64_t v152 = v151;
                    v153 = 0;
                    uint64_t v154 = *(void *)v306;
                    do
                    {
                      for (nuint64_t n = 0; nn != v152; ++nn)
                      {
                        if (*(void *)v306 != v154) {
                          objc_enumerationMutation(v65);
                        }
                        v156 = *(FigCaptureSessionParsedVideoDataSinkConfiguration **)(*((void *)&v305 + 1) + 8 * nn);
                        if ([(NSString *)[(FigCaptureSourceConfiguration *)[(FigCaptureSessionParsedVideoDataSinkConfiguration *)v156 cameraConfiguration] sourceID] isEqualToString:v128]&& [(FigCaptureSessionParsedVideoDataSinkConfiguration *)v156 sourceDeviceType] == v150)
                        {
                          if (v153)
                          {
                            int v157 = [(FigVideoCaptureConnectionConfiguration *)[(FigCaptureSessionParsedVideoDataSinkConfiguration *)v156 videoDataConnectionConfiguration] videoStabilizationMethod];
                            if (v157 < [(FigVideoCaptureConnectionConfiguration *)[(FigCaptureSessionParsedVideoDataSinkConfiguration *)v153 videoDataConnectionConfiguration] videoStabilizationMethod])v153 = v156; {
                          }
                            }
                          else
                          {
                            v153 = v156;
                          }
                        }
                      }
                      uint64_t v152 = [v65 countByEnumeratingWithState:&v305 objects:v362 count:16];
                    }
                    while (v152);
                  }
                  else
                  {
                    v153 = 0;
                  }
                  if (FigCaptureMetadataObjectConfigurationRequiresFaceTracking(v274)) {
                    char IsSecureMetadataSource = FigCaptureSourceIsSecureMetadataSource(objc_msgSend((id)objc_msgSend(v274, "sourceConfiguration"), "source"), &v349);
                  }
                  else {
                    char IsSecureMetadataSource = 1;
                  }
                  if (v349)
                  {
                    fig_log_get_emitter();
                    goto LABEL_435;
                  }
                  if (v153) {
                    char v159 = 1;
                  }
                  else {
                    char v159 = IsSecureMetadataSource;
                  }
                  if ((v159 & 1) == 0)
                  {
                    v160 = [FigCaptureSessionParsedVideoDataSinkConfiguration alloc];
                    if (v160)
                    {
                      v373.receiver = v160;
                      v373.super_class = (Class)FigCaptureSessionParsedVideoDataSinkConfiguration;
                      v160 = (FigCaptureSessionParsedVideoDataSinkConfiguration *)objc_msgSendSuper2(&v373, sel_init);
                    }
                    v153 = v160;
                    if (!v65) {
                      v65 = (void *)[MEMORY[0x1E4F1CA48] array];
                    }
                    [v65 addObject:v153];
                  }
                  -[FigCaptureSessionParsedVideoDataSinkConfiguration _setMetadataObjectConnectionConfiguration:]((id *)&v153->super.isa, v274);
                  v68 = v269;
                }
                uint64_t v268 = [obja countByEnumeratingWithState:&v309 objects:v363 count:16];
              }
              while (v268);
            }
            v116 = v257;
          }
          v5 = v259;
        }
        uint64_t v126 = v256 + 1;
      }
      while (v256 + 1 != v252);
      uint64_t v252 = [v116 countByEnumeratingWithState:&v321 objects:v366 count:16];
    }
    while (v252);
  }
  else
  {
    v276 = 0;
    v270 = 0;
    v238 = 0;
    v240 = 0;
  }
  long long v295 = 0u;
  long long v296 = 0u;
  long long v293 = 0u;
  long long v294 = 0u;
  uint64_t v172 = [v5 countByEnumeratingWithState:&v293 objects:v359 count:16];
  if (!v172)
  {
    v260 = 0;
    obuint64_t j = 0;
    v253 = 0;
    v255 = 0;
    v264 = 0;
    v265 = 0;
    v248 = 0;
    v250 = 0;
    v267 = 0;
    v251 = 0;
    goto LABEL_417;
  }
  uint64_t v173 = v172;
  v260 = 0;
  obuint64_t j = 0;
  v253 = 0;
  v255 = 0;
  v264 = 0;
  v265 = 0;
  v248 = 0;
  v250 = 0;
  v267 = 0;
  v251 = 0;
  uint64_t v174 = *(void *)v294;
  uint64_t v247 = *(void *)v294;
LABEL_310:
  uint64_t v175 = 0;
  uint64_t v272 = v173;
  while (2)
  {
    if (*(void *)v294 != v174) {
      objc_enumerationMutation(v5);
    }
    uint64_t v275 = v175;
    v176 = (void *)[v5 objectForKeyedSubscript:*(void *)(*((void *)&v293 + 1) + 8 * v175)];
    v177 = (void *)[v176 firstObject];
    v178 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(objc_msgSend(v116, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v177, "sourceConfiguration"), "sourceID")), objc_msgSend(v177, "underlyingDeviceType"));
    switch(objc_msgSend((id)objc_msgSend(v177, "sinkConfiguration"), "sinkType"))
    {
      case 3u:
        if ([v176 count] != 1) {
          return FigSignalErrorAt();
        }
        v179 = FigCaptureConnectionConfigurationWithSinkType(v178, 4);
        v180 = -[FigCaptureSessionParsedStillImageSinkConfiguration initWithStillImageConnectionConfiguration:movieFileVideoConnectionConfiguration:pointCloudDataConnectionConfiguration:]([FigCaptureSessionParsedStillImageSinkConfiguration alloc], v177, v179, 0);
        v181 = v267;
        if (!v267) {
          v181 = (void *)[MEMORY[0x1E4F1CA48] array];
        }
        v267 = v181;
        goto LABEL_407;
      case 4u:
        v209 = FigCaptureConnectionConfigurationWithSourceType(v176, 1);
        v210 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(objc_msgSend(v116, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v209, "sourceConfiguration"), "sourceID")), objc_msgSend(v209, "underlyingDeviceType"));
        v211 = FigCaptureConnectionConfigurationWithSinkType(v210, 3);
        if (!v211) {
          v211 = FigCaptureConnectionConfigurationWithSinkType(v210, 10);
        }
        v212 = -[FigCaptureSessionParsedMovieFileSinkConfiguration initWithCaptureConnectionConfigurations:stillImageConnectionConfiguration:sceneClassifierConnectionConfigurationsBySourceID:]([FigCaptureSessionParsedMovieFileSinkConfiguration alloc], v176, v211, v258);
        if (!v212) {
          return FigSignalErrorAt();
        }
        v208 = v212;
        v213 = v265;
        if (!v265) {
          goto LABEL_380;
        }
        goto LABEL_381;
      case 5u:
        if ([v176 count] != 1) {
          return FigSignalErrorAt();
        }
        v181 = v253;
        if (!v253) {
          v181 = (void *)[MEMORY[0x1E4F1CA48] array];
        }
        v253 = v181;
        goto LABEL_396;
      case 7u:
        if ([v176 count] != 1) {
          return FigSignalErrorAt();
        }
        v181 = v255;
        if (!v255) {
          v181 = (void *)[MEMORY[0x1E4F1CA48] array];
        }
        v255 = v181;
        goto LABEL_396;
      case 8u:
        if ([v176 count] != 1) {
          return FigSignalErrorAt();
        }
        v246 = FigCaptureConnectionConfigurationWithSinkType(v178, 6);
        v245 = FigCaptureConnectionConfigurationWithSinkType(v178, 1);
        v242 = FigCaptureConnectionConfigurationWithSinkType(v178, 11);
        v244 = FigCaptureConnectionConfigurationWithSinkType(v178, 4);
        v182 = objc_msgSend(v258, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v177, "sourceConfiguration"), "sourceID"));
        int v183 = [v182 underlyingDeviceType];
        if (v183 == [v177 underlyingDeviceType]) {
          v184 = v182;
        }
        else {
          v184 = 0;
        }
        v243 = v184;
        v185 = (void *)[MEMORY[0x1E4F1CA48] array];
        long long v289 = 0u;
        long long v290 = 0u;
        long long v291 = 0u;
        long long v292 = 0u;
        uint64_t v186 = [v178 countByEnumeratingWithState:&v289 objects:v358 count:16];
        if (v186)
        {
          uint64_t v187 = v186;
          uint64_t v188 = *(void *)v290;
          do
          {
            for (uint64_t i1 = 0; i1 != v187; ++i1)
            {
              if (*(void *)v290 != v188) {
                objc_enumerationMutation(v178);
              }
              v190 = *(void **)(*((void *)&v289 + 1) + 8 * i1);
              if ((objc_msgSend((id)objc_msgSend(v190, "sinkConfiguration"), "sinkType") == 4
                 || objc_msgSend((id)objc_msgSend(v190, "sinkConfiguration"), "sinkType") == 10)
                && [v190 mediaType] == 1835365473
                && FigMetadataItemConnectionConfigurationRequiresObjectDetection(v190))
              {
                [v185 addObject:v190];
              }
            }
            uint64_t v187 = [v178 countByEnumeratingWithState:&v289 objects:v358 count:16];
          }
          while (v187);
        }
        v191 = -[FigCaptureSessionParsedMetadataSinkConfiguration initWithMetadataObjectConnectionConfiguration:sceneClassifierConnectionConfiguration:videoDataConnectionConfiguration:videoPreviewSinkConnectionConfiguration:movieFileVideoConnectionConfiguration:movieFileDetectedObjectMetadataConnectionConfigurations:]([FigCaptureSessionParsedMetadataSinkConfiguration alloc], v177, v243, v246, v245, v244, v185);
        v192 = v250;
        if (!v250) {
          v192 = (void *)[MEMORY[0x1E4F1CA48] array];
        }
        v250 = v192;
        [v192 addObject:v191];
        v116 = v257;
        v68 = v269;
        uint64_t v174 = v247;
        uint64_t v173 = v272;
        if (!FigCaptureMetadataObjectConfigurationRequiresFaceTracking(v177)
          || !objc_msgSend((id)objc_msgSend(v177, "sourceConfiguration"), "depthDataDeliveryEnabled")
          || v242)
        {
          goto LABEL_409;
        }
        uint64_t v193 = (uint64_t)v264;
        if (!v264) {
          uint64_t v193 = [MEMORY[0x1E4F1CA48] array];
        }
        v194 = -[FigCaptureSessionParsedDepthDataSinkConfiguration initWithDepthDataConnectionConfiguration:videoDataConnectionConfiguration:metadataObjectConnectionConfiguration:]([FigCaptureSessionParsedDepthDataSinkConfiguration alloc], 0, v246, v177);
        v264 = (void *)v193;
        v181 = (void *)v193;
        goto LABEL_408;
      case 0xAu:
        long long v287 = 0u;
        long long v288 = 0u;
        long long v285 = 0u;
        long long v286 = 0u;
        uint64_t v195 = [v176 countByEnumeratingWithState:&v285 objects:v357 count:16];
        if (!v195) {
          return FigSignalErrorAt();
        }
        uint64_t v196 = v195;
        v197 = 0;
        v198 = 0;
        uint64_t v199 = *(void *)v286;
        do
        {
          for (uint64_t i2 = 0; i2 != v196; ++i2)
          {
            if (*(void *)v286 != v199) {
              objc_enumerationMutation(v176);
            }
            v201 = *(FigPointCloudDataCaptureConnectionConfiguration **)(*((void *)&v285 + 1) + 8 * i2);
            if ([(FigCaptureConnectionConfiguration *)v201 mediaType] == 1986618469)
            {
              v197 = v201;
            }
            else if ([(FigCaptureConnectionConfiguration *)v201 mediaType] == 1885564004)
            {
              v198 = v201;
            }
          }
          uint64_t v196 = [v176 countByEnumeratingWithState:&v285 objects:v357 count:16];
        }
        while (v196);
        v202 = v273 ? v273 : v198;
        v116 = v257;
        v68 = v269;
        if (!v197) {
          return FigSignalErrorAt();
        }
        BOOL v203 = [(FigCaptureIrisSinkConfiguration *)[(FigCaptureConnectionConfiguration *)v197 irisSinkConfiguration] irisMovieCaptureEnabled];
        v204 = v197;
        if (!v203)
        {
          v205 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(objc_msgSend(v257, "objectForKeyedSubscript:", -[FigCaptureSourceConfiguration sourceID](-[FigCaptureConnectionConfiguration sourceConfiguration](v197, "sourceConfiguration"), "sourceID")), -[FigCaptureConnectionConfiguration underlyingDeviceType](v197, "underlyingDeviceType"));
          v204 = FigCaptureConnectionConfigurationWithSinkType(v205, 4);
        }
        v206 = -[FigCaptureSessionParsedStillImageSinkConfiguration initWithStillImageConnectionConfiguration:movieFileVideoConnectionConfiguration:pointCloudDataConnectionConfiguration:]([FigCaptureSessionParsedStillImageSinkConfiguration alloc], v197, v204, v202);
        v207 = v267;
        if (!v267) {
          v207 = (void *)[MEMORY[0x1E4F1CA48] array];
        }
        [v207 addObject:v206];
        v267 = v207;
        if (v203)
        {
          uint64_t v174 = v247;
          if (v265) {
            return FigSignalErrorAt();
          }
          v208 = -[FigCaptureSessionParsedMovieFileSinkConfiguration initWithCaptureConnectionConfigurations:stillImageConnectionConfiguration:sceneClassifierConnectionConfigurationsBySourceID:]([FigCaptureSessionParsedMovieFileSinkConfiguration alloc], v176, v197, v258);
LABEL_380:
          v213 = (void *)[MEMORY[0x1E4F1CA48] array];
LABEL_381:
          v265 = v213;
LABEL_386:
          [v213 addObject:v208];
        }
        else
        {
          uint64_t v174 = v247;
        }
        uint64_t v173 = v272;
        goto LABEL_409;
      case 0xBu:
        if ([v176 count] != 1) {
          return FigSignalErrorAt();
        }
        v214 = FigCaptureConnectionConfigurationWithSinkType(v178, 6);
        v215 = FigCaptureConnectionConfigurationWithSinkType(v178, 8);
        v208 = -[FigCaptureSessionParsedDepthDataSinkConfiguration initWithDepthDataConnectionConfiguration:videoDataConnectionConfiguration:metadataObjectConnectionConfiguration:]([FigCaptureSessionParsedDepthDataSinkConfiguration alloc], v177, v214, v215);
        v213 = v264;
        if (!v264) {
          v213 = (void *)[MEMORY[0x1E4F1CA48] array];
        }
        v264 = v213;
        goto LABEL_386;
      case 0xCu:
        if ([v176 count] != 1) {
          return FigSignalErrorAt();
        }
        v181 = v251;
        if (!v251) {
          v181 = (void *)[MEMORY[0x1E4F1CA48] array];
        }
        v251 = v181;
        goto LABEL_396;
      case 0xDu:
        if ([v176 count] != 1) {
          return FigSignalErrorAt();
        }
        unsigned int v216 = objc_msgSend((id)objc_msgSend(v177, "sourceConfiguration"), "sourceDeviceType");
        v217 = FigCaptureConnectionConfigurationWithSinkType(v178, 6);
        if (v216 <= 9 && ((1 << v216) & 0x310) != 0)
        {
          v219 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(objc_msgSend(v116, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v177, "sourceConfiguration"), "sourceID")), v216);
          v217 = FigCaptureConnectionConfigurationWithSinkType(v219, 6);
        }
        uint64_t v173 = v272;
        if (!v217)
        {
          fig_log_get_emitter();
LABEL_449:
          FigDebugAssert3();
          return FigSignalErrorAt();
        }
        v180 = -[FigCaptureSessionParsedVisionDataSinkConfiguration initWithVisionDataConnectionConfiguration:videoDataConnectionConfiguration:]([FigCaptureSessionParsedVisionDataSinkConfiguration alloc], v177, v217);
        v181 = v248;
        if (!v248) {
          v181 = (void *)[MEMORY[0x1E4F1CA48] array];
        }
        v248 = v181;
LABEL_407:
        v194 = v180;
LABEL_408:
        [v181 addObject:v194];
LABEL_409:
        uint64_t v175 = v275 + 1;
        v5 = v259;
        if (v275 + 1 != v173) {
          continue;
        }
        uint64_t v220 = [v259 countByEnumeratingWithState:&v293 objects:v359 count:16];
        uint64_t v173 = v220;
        if (v220) {
          goto LABEL_310;
        }
LABEL_417:
        long long v283 = 0u;
        long long v284 = 0u;
        long long v281 = 0u;
        long long v282 = 0u;
        v67 = v240;
        uint64_t v221 = [v240 countByEnumeratingWithState:&v281 objects:v356 count:16];
        if (v221)
        {
          uint64_t v222 = v221;
          v63 = 0;
          uint64_t v223 = *(void *)v282;
          do
          {
            for (uint64_t i3 = 0; i3 != v222; ++i3)
            {
              if (*(void *)v282 != v223) {
                objc_enumerationMutation(v240);
              }
              v225 = *(void **)(*((void *)&v281 + 1) + 8 * i3);
              v226 = (void *)[v225 videoPreviewSinkConnectionConfiguration];
              if ([v226 previewDepthDataDeliveryEnabled]
                && [v226 previewFilterRenderingEnabled]
                && FigCaptureConnectionConfigurationWithSinkType((void *)[v225 videoCaptureConnectionConfigurations], 4))
              {
                if (!v63) {
                  v63 = (void *)[MEMORY[0x1E4F1CA48] array];
                }
                v227 = -[FigCaptureSessionParsedCinematographyConfiguration initWithVideoPreviewSinkConnectionConfiguration:]([FigCaptureSessionParsedCinematographyConfiguration alloc], (void *)[v225 videoPreviewSinkConnectionConfiguration]);
                if (!v227) {
                  return FigSignalErrorAt();
                }
                [v63 addObject:v227];
              }
            }
            uint64_t v222 = [v240 countByEnumeratingWithState:&v281 objects:v356 count:16];
          }
          while (v222);
        }
        else
        {
          v63 = 0;
        }
        if (!v239)
        {
          v62 = 0;
          goto LABEL_456;
        }
        v62 = (void *)[MEMORY[0x1E4F1CA48] array];
        long long v277 = 0u;
        long long v278 = 0u;
        long long v279 = 0u;
        long long v280 = 0u;
        uint64_t v228 = [v68 countByEnumeratingWithState:&v277 objects:v355 count:16];
        if (!v228)
        {
LABEL_448:
          fig_log_get_emitter();
          goto LABEL_449;
        }
        uint64_t v229 = v228;
        uint64_t v230 = *(void *)v278;
LABEL_441:
        uint64_t v231 = 0;
        while (1)
        {
          if (*(void *)v278 != v230) {
            objc_enumerationMutation(v68);
          }
          v232 = *(void **)(*((void *)&v277 + 1) + 8 * v231);
          if (objc_msgSend((id)objc_msgSend(v232, "sourceConfiguration"), "sourceDeviceType") == 13
            && objc_msgSend((id)objc_msgSend(v232, "sinkConfiguration"), "sinkType") == 11)
          {
            break;
          }
          if (v229 == ++v231)
          {
            uint64_t v229 = [v68 countByEnumeratingWithState:&v277 objects:v355 count:16];
            if (v229) {
              goto LABEL_441;
            }
            goto LABEL_448;
          }
        }
        if (!v232) {
          goto LABEL_448;
        }
        objc_msgSend(v62, "addObject:", -[FigCaptureSessionParsedLiDARDepthPipelineConfiguration initWithTimeOfFlightCameraConfiguration:depthDataConnectionConfiguration:]([FigCaptureSessionParsedLiDARDepthPipelineConfiguration alloc], "initWithTimeOfFlightCameraConfiguration:depthDataConnectionConfiguration:", -[FigCaptureConnectionConfiguration sourceConfiguration](v239, "sourceConfiguration"), v232));
LABEL_456:
        v66 = v238;
        v64 = v250;
LABEL_457:
        *(void *)(v237 + 40) = [v67 copy];
        *(void *)(v237 + 48) = v66;
        *(void *)(v237 + 56) = [v270 copy];
        *(void *)(v237 + 64) = [v276 copy];
        *(void *)(v237 + 72) = [v251 copy];
        *(void *)(v237 + 80) = [v267 copy];
        *(void *)(v237 + 88) = [v65 copy];
        *(void *)(v237 + 96) = [v248 copy];
        *(void *)(v237 + 104) = [v264 copy];
        *(void *)(v237 + 112) = [v64 copy];
        *(void *)(v237 + 120) = [v265 copy];
        *(void *)(v237 + 128) = [v253 copy];
        *(void *)(v237 + 136) = [v255 copy];
        *(void *)(v237 + 144) = [v260 copy];
        *(void *)(v237 + 152) = [obj copy];
        *(void *)(v237 + 168) = [v63 copy];
        *(void *)(v237 + 160) = [v62 copy];
        -[FigCaptureSessionParsedConfiguration _computeVideoStabilizationTypes](v237);
        return v349;
      case 0xFu:
        if ([v176 count] != 1) {
          return FigSignalErrorAt();
        }
        v181 = v260;
        if (!v260) {
          v181 = (void *)[MEMORY[0x1E4F1CA48] array];
        }
        v260 = (char *)v181;
        goto LABEL_396;
      case 0x10u:
        if ([v176 count] != 1) {
          return FigSignalErrorAt();
        }
        v181 = obj;
        if (!obj) {
          v181 = (void *)[MEMORY[0x1E4F1CA48] array];
        }
        obuint64_t j = v181;
LABEL_396:
        v194 = v177;
        goto LABEL_408;
      default:
        goto LABEL_409;
    }
  }
}

- (FigCaptureSessionParsedConfiguration)initWithSessionConfiguration:(id)a3 clientSetsUserInitiatedCaptureRequestTime:(BOOL)a4 restrictions:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)FigCaptureSessionParsedConfiguration;
  uint64_t v8 = [(FigCaptureSessionParsedConfiguration *)&v12 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_useOfflineVISPipeline = 0;
    int v10 = -[FigCaptureSessionParsedConfiguration _parseConfiguration:clientSetsUserInitiatedCaptureRequestTime:restrictions:]((uint64_t)v8, a3, a4, a5);
    v9->_isMultiCamSessiouint64_t n = [a3 isMultiCamSession];
    v9->_continuityCameraIsWired = [a3 continuityCameraIsWired];
    v9->_continuityCameraClientDeviceClass = [a3 continuityCameraClientDeviceClass];
    v9->_clientIsVOIP = [a3 clientIsVOIP];
    v9->_suppressVideoEffects = [a3 suppressVideoEffects];
    v9->_smartStyleRenderingEnabled = [a3 smartStyleRenderingEnabled];
    v9->_smartStyleControlMode = [a3 smartStyleControlMode];
    v9->_smartStyle = (FigCaptureSmartStyle *)(id)[a3 smartStyle];
    if (v10)
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v9;
}

- (uint64_t)_computeVideoStabilizationTypes
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v44 = result;
  if (result)
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    obuint64_t j = *(id *)(result + 40);
    result = [obj countByEnumeratingWithState:&v57 objects:v68 count:16];
    uint64_t v40 = result;
    if (result)
    {
      uint64_t v39 = *(void *)v58;
      do
      {
        uint64_t v1 = 0;
        do
        {
          if (*(void *)v58 != v39) {
            objc_enumerationMutation(obj);
          }
          v2 = *(void **)(*((void *)&v57 + 1) + 8 * v1);
          if (objc_msgSend((id)objc_msgSend(v2, "stillImageConnectionConfiguration"), "irisVISEnabled")) {
            objc_msgSend((id)objc_msgSend(v2, "stillImageConnectionConfiguration"), "setVideoStabilizationType:", cspc_getVideoStabilizationType(objc_msgSend(v2, "stillImageConnectionConfiguration"), *(unsigned char *)(v44 + 18), 0, 0));
          }
          uint64_t v41 = v1;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          v3 = *(void **)(v44 + 120);
          uint64_t v4 = [v3 countByEnumeratingWithState:&v53 objects:v67 count:16];
          if (v4)
          {
            uint64_t v5 = v4;
            uint64_t v6 = *(void *)v54;
            while (2)
            {
              for (uint64_t i = 0; i != v5; ++i)
              {
                if (*(void *)v54 != v6) {
                  objc_enumerationMutation(v3);
                }
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * i), "videoConnectionConfiguration"), "movieFileSinkConfiguration"), "trueVideoCaptureEnabled"))
                {
                  char v8 = 1;
                  goto LABEL_19;
                }
              }
              uint64_t v5 = [v3 countByEnumeratingWithState:&v53 objects:v67 count:16];
              if (v5) {
                continue;
              }
              break;
            }
          }
          char v8 = 0;
LABEL_19:
          if (objc_msgSend((id)objc_msgSend(v2, "cameraConfiguration"), "sourcePosition") == 2) {
            char v9 = v8;
          }
          else {
            char v9 = 0;
          }
          unsigned __int8 v43 = v9;
          if ((unint64_t)[*(id *)(v44 + 40) count] > 1
            || (int)objc_msgSend((id)objc_msgSend(v2, "cameraConfiguration"), "videoStabilizationStrength") > 2)
          {
            goto LABEL_28;
          }
          unsigned int v10 = objc_msgSend((id)objc_msgSend(v2, "cameraConfiguration"), "sourceDeviceType");
          if (v10 <= 9 && ((1 << v10) & 0x310) != 0)
          {
            if ((objc_msgSend((id)objc_msgSend(v2, "cameraConfiguration"), "spatialOverCaptureEnabled") & 1) != 0
              || (objc_msgSend((id)objc_msgSend(v2, "cameraConfiguration"), "depthDataDeliveryEnabled") & 1) != 0)
            {
              goto LABEL_28;
            }
            uint64_t v32 = (void *)[MEMORY[0x1E4F1CA80] set];
            id v33 = (id)objc_msgSend((id)objc_msgSend(v2, "previewDerivedConnectionConfigurations"), "mutableCopy");
            objc_msgSend(v33, "addObjectsFromArray:", objc_msgSend(v2, "videoCaptureConnectionConfigurations"));
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            uint64_t v34 = [v33 countByEnumeratingWithState:&v61 objects:v69 count:16];
            if (v34)
            {
              uint64_t v35 = v34;
              uint64_t v36 = *(void *)v62;
LABEL_80:
              uint64_t v37 = 0;
              while (1)
              {
                if (*(void *)v62 != v36) {
                  objc_enumerationMutation(v33);
                }
                objc_msgSend(v32, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * v37), "underlyingDeviceType")));
                if ((unint64_t)[v32 count] > 1) {
                  break;
                }
                if (v35 == ++v37)
                {
                  uint64_t v35 = [v33 countByEnumeratingWithState:&v61 objects:v69 count:16];
                  if (v35) {
                    goto LABEL_80;
                  }
                  goto LABEL_29;
                }
              }
LABEL_28:
              unsigned __int8 v43 = 1;
            }
          }
LABEL_29:
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          uint64_t v42 = v2;
          v11 = (void *)[v2 videoCaptureConnectionConfigurations];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v49 objects:v66 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            int v14 = 0;
            int v15 = 0;
            int v16 = 0;
            uint64_t v17 = *(void *)v50;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v50 != v17) {
                  objc_enumerationMutation(v11);
                }
                v19 = *(void **)(*((void *)&v49 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v20 = objc_msgSend((id)objc_msgSend(v19, "sinkConfiguration"), "sinkType");
                  if ((v20 | 2) == 6)
                  {
                    int v21 = v20;
                    if ([v19 videoStabilizationMethod])
                    {
                      BOOL v22 = v21 != 4 || v19 == 0;
                      if (v22
                        || !objc_msgSend((id)objc_msgSend(v42, "videoPreviewSinkConnectionConfiguration"), "previewDepthDataDeliveryEnabled"))
                      {
                        unsigned __int8 v23 = 0;
                      }
                      else
                      {
                        unsigned __int8 v23 = objc_msgSend((id)objc_msgSend(v42, "videoPreviewSinkConnectionConfiguration"), "previewDepthFilterRenderingEnabled");
                      }
                      objc_msgSend(v19, "setVideoStabilizationType:", cspc_getVideoStabilizationType(v19, *(unsigned char *)(v44 + 18), v43, v23));
                    }
                    if ([v19 videoStabilizationType] == 1)
                    {
                      ++v14;
                    }
                    else
                    {
                      if ([v19 videoStabilizationType] - 3 < 2) {
                        ++v15;
                      }
                      ++v16;
                    }
                  }
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v49 objects:v66 count:16];
            }
            while (v13);
          }
          else
          {
            int v14 = 0;
            int v15 = 0;
            int v16 = 0;
          }
          if (v14) {
            BOOL v24 = v16 == 0;
          }
          else {
            BOOL v24 = 1;
          }
          int v25 = !v24;
          if (!v24 || v15 >= 2)
          {
            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            uint64_t v26 = (void *)[v42 videoCaptureConnectionConfigurations];
            uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v65 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v46;
              do
              {
                for (uint64_t k = 0; k != v28; ++k)
                {
                  if (*(void *)v46 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  int v31 = *(void **)(*((void *)&v45 + 1) + 8 * k);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    && (v25 && [v31 videoStabilizationType] == 1
                     || v15 >= 2 && [v31 videoStabilizationType] - 3 <= 1))
                  {
                    [v31 setVideoStabilizationType:2];
                  }
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v45 objects:v65 count:16];
              }
              while (v28);
            }
          }
          uint64_t v1 = v41 + 1;
        }
        while (v41 + 1 != v40);
        result = [obj countByEnumeratingWithState:&v57 objects:v68 count:16];
        uint64_t v40 = result;
      }
      while (result);
    }
  }
  return result;
}

- (NSArray)parsedCameraSourceConfigurations
{
  return self->_parsedCameraSourceConfigurations;
}

- (NSArray)parsedMovieFileSinkConfigurations
{
  return self->_parsedMovieFileSinkConfigurations;
}

- (NSArray)parsedStillImageSinkConfigurations
{
  return self->_parsedStillImageSinkConfigurations;
}

- (NSArray)parsedPreviewSinkConfigurations
{
  return self->_parsedPreviewSinkConfigurations;
}

- (NSArray)parsedVideoDataSinkConfigurations
{
  return self->_parsedVideoDataSinkConfigurations;
}

- (NSArray)parsedMetadataSinkConfigurations
{
  return self->_parsedMetadataSinkConfigurations;
}

- (BOOL)isMultiCamSession
{
  return self->_isMultiCamSession;
}

- (NSArray)videoThumbnailSinkConfigurations
{
  return self->_videoThumbnailSinkConfigurations;
}

- (NSArray)pointCloudDataSinkConnectionConfigurations
{
  return self->_pointCloudDataSinkConnectionConfigurations;
}

- (NSArray)parsedVisionDataSinkConfigurations
{
  return self->_parsedVisionDataSinkConfigurations;
}

- (NSArray)parsedDepthDataSinkConfigurations
{
  return self->_parsedDepthDataSinkConfigurations;
}

- (NSArray)cameraCalibrationDataSinkConnectionConfigurations
{
  return self->_cameraCalibrationDataSinkConnectionConfigurations;
}

- (NSArray)audioDataSinkConnectionConfigurations
{
  return self->_audioDataSinkConnectionConfigurations;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedConfiguration;
  [(FigCaptureSessionParsedConfiguration *)&v3 dealloc];
}

- (FigCaptureSmartStyle)smartStyle
{
  return self->_smartStyle;
}

- (BOOL)smartStyleRenderingEnabled
{
  return self->_smartStyleRenderingEnabled;
}

- (FigCaptureSessionParsedMicSourceConfiguration)parsedMicSourceConfiguration
{
  return self->_parsedMicSourceConfiguration;
}

- (BOOL)suppressVideoEffects
{
  return self->_suppressVideoEffects;
}

- (BOOL)continuityCameraIsWired
{
  return self->_continuityCameraIsWired;
}

- (int)continuityCameraClientDeviceClass
{
  return self->_continuityCameraClientDeviceClass;
}

- (BOOL)clientIsVOIP
{
  return self->_clientIsVOIP;
}

- (BOOL)useOfflineVISPipeline
{
  return self->_useOfflineVISPipeline;
}

- (NSArray)parsedLiDARDepthPipelineConfigurations
{
  return self->_parsedLiDARDepthPipelineConfigurations;
}

- (NSArray)parsedCinematographyConfigurations
{
  return self->_parsedCinematographyConfigurations;
}

- (NSArray)metadataSourceConfigurations
{
  return self->_metadataSourceConfigurations;
}

- (BOOL)empty
{
  return self->_empty;
}

- (NSArray)audioFileSinkConnectionConfigurations
{
  return self->_audioFileSinkConnectionConfigurations;
}

+ (void)initialize
{
}

- (int64_t)smartStyleControlMode
{
  return self->_smartStyleControlMode;
}

@end