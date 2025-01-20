@interface ARReplaySensorPublic
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentCMTime;
- (ARParentImageSensorSettings)parentImageSensorSettings;
- (ARReplaySensorDelegate)replaySensorDelegate;
- (ARReplaySensorDelegate)traceReplaySensorDelegate;
- (ARReplaySensorPublic)initWithDataFromFile:(id)a3;
- (ARReplaySensorPublic)initWithSequenceURL:(id)a3 manualReplay:(BOOL)a4;
- (ARReplaySensorPublic)initWithSequenceURL:(id)a3 manualReplay:(BOOL)a4 synchronousMode:(BOOL)a5;
- (ARReplaySensorPublic)initWithSequenceURL:(id)a3 replayMode:(int64_t)a4;
- (ARSensorDelegate)delegate;
- (ARSession)session;
- (BOOL)_allStreamsAreAvailable:(id)a3;
- (BOOL)finishedReplaying;
- (BOOL)interrupted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReplayingManually;
- (BOOL)isSynchronousMode;
- (BOOL)readNextFrameFromStream:(id)a3 forWrapper:(id)a4;
- (BOOL)recordingTimeToReplayTimeOffsetReset;
- (BOOL)shouldReplayVisionData;
- (CGSize)imageResolution;
- (NSDictionary)customUserData;
- (NSMutableArray)cmDataBuffer;
- (NSMutableArray)cvaDepthTOFBuffer;
- (NSMutableArray)userEventBuffer;
- (NSSet)customDataClasses;
- (NSString)arkitVersion;
- (NSString)deviceModel;
- (NSString)mainVideoStreamIdentifier;
- (NSString)osVersion;
- (NSURL)sequenceURL;
- (double)_getMinFrameDurationForStream:(id)a3;
- (double)currentTime;
- (double)nominalFrameRate;
- (double)recordingTimeToReplayTimeOffset;
- (double)sourceTimestampForMovieTimestamp:(double)a3;
- (float)advanceFramesPerSecondMultiplier;
- (id)_cameraCalibrationDataForStream:(id)a3 timestamp:(double)a4;
- (id)_mainVideoStringID:(id)a3;
- (id)_populateCalibrationStream:(id)a3 timestamp:(double)a4;
- (id)_streamIdentifierForCaptureDeviceType:(id)a3 position:(int64_t)a4;
- (id)availableVideoFormatForDeviceType:(id)a3 position:(int64_t)a4;
- (id)customDataForTimestamp:(double)a3;
- (id)getItemsFromStream:(id)a3 upToMovieTime:(double)a4 converter:(id)a5;
- (id)getItemsFromStream:(id)a3 upToMovieTime:(double)a4 metadataClass:(Class)a5;
- (id)getNextWrappedImageDataForReplay;
- (id)getNextWrappedItemsFromStream:(id)a3 converter:(id)a4;
- (id)getWrappedItemsFromPixelBufferStream:(id)a3 upToMovieTime:(double)a4 converter:(id)a5;
- (id)getWrappedItemsFromStream:(id)a3 upToMovieTime:(double)a4 converter:(id)a5;
- (id)getWrappedItemsFromStream:(id)a3 upToMovieTime:(double)a4 withBlock:(id)a5;
- (id)imageDataToReplayForTimestamp:(double)a3;
- (id)keyedArchiveConverter:(Class)a3;
- (id)keyedArchiveConverterForClasses:(id)a3;
- (id)metadataWrapperConverter:(Class)a3;
- (id)peekNextWrappedImageDataForAllRequiredStreams;
- (id)peekNextWrappedImageDataForStreamIdentifier:(id)a3;
- (id)wrappedImageDataOrderedByTime:(id)a3;
- (int)imageIndex;
- (int64_t)nextFrameIndex;
- (int64_t)replayMode;
- (int64_t)targetFrameIndex;
- (unint64_t)recordedSensorTypes;
- (void)_appendCalibrationData:(id)a3 streamIdentifier:(id)a4;
- (void)_appendVisionDataToImageData:(id)a3 streamIdentifier:(id)a4;
- (void)_didOutputSensorData:(id)a3;
- (void)_endReplay;
- (void)_populateDepthDataForImageData:(id)a3;
- (void)_populateDeviceOrientationIfNeededOnImageData:(id)a3 fromDeviceOrientationData:(id)a4 accelerometerData:(id)a5 streamIdentifier:(id)a6;
- (void)_replaySensorFinishedReplayingData;
- (void)advance;
- (void)advanceFrame;
- (void)dealloc;
- (void)endInterruption;
- (void)failWithError:(id)a3;
- (void)interrupt;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForReplay;
- (void)readAndVendCMDatasUntil:(double)a3;
- (void)readAndVendCVADepthTOFsUntil:(double)a3;
- (void)readAndVendCVAUserEventsUntil:(double)a3;
- (void)readFileMetadata;
- (void)setAdvanceFramesPerSecondMultiplier:(float)a3;
- (void)setCustomDataClasses:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageIndex:(int)a3;
- (void)setMainVideoStreamIdentifier:(id)a3;
- (void)setNextFrameIndex:(int64_t)a3;
- (void)setParentImageSensorSettings:(id)a3;
- (void)setRecordingTimeToReplayTimeOffset:(double)a3;
- (void)setRecordingTimeToReplayTimeOffsetReset:(BOOL)a3;
- (void)setReplaySensorDelegate:(id)a3;
- (void)setSession:(id)a3;
- (void)setTargetFrameIndex:(int64_t)a3;
- (void)setTraceReplaySensorDelegate:(id)a3;
- (void)start;
- (void)startReplayIfNeeded;
- (void)stop;
- (void)tick;
- (void)waitForOutstandingCallbacks;
@end

@implementation ARReplaySensorPublic

- (ARReplaySensorPublic)initWithDataFromFile:(id)a3
{
  v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  v5 = [(ARReplaySensorPublic *)self initWithSequenceURL:v4 replayMode:0];

  return v5;
}

- (ARReplaySensorPublic)initWithSequenceURL:(id)a3 manualReplay:(BOOL)a4
{
  return [(ARReplaySensorPublic *)self initWithSequenceURL:a3 manualReplay:a4 synchronousMode:0];
}

- (ARReplaySensorPublic)initWithSequenceURL:(id)a3 manualReplay:(BOOL)a4 synchronousMode:(BOOL)a5
{
  if (a4) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = -[ARReplaySensorPublic initWithSequenceURL:replayMode:](self, "initWithSequenceURL:replayMode:", a3, v5, a5);

  return v6;
}

- (BOOL)isSynchronousMode
{
  return self->_replayMode != 0;
}

- (ARReplaySensorPublic)initWithSequenceURL:(id)a3 replayMode:(int64_t)a4
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v136 = 0;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F4D5D8]) initWithFileURL:v6 error:&v136];
  id v8 = v136;
  if (v7)
  {
    v135.receiver = self;
    v135.super_class = (Class)ARReplaySensorPublic;
    v9 = [(ARReplaySensorPublic *)&v135 init];
    if (!v9)
    {
LABEL_77:
      self = v9;
      v56 = self;
      goto LABEL_78;
    }
    id v128 = v8;
    uint64_t v10 = objc_opt_new();
    v11 = (void *)*((void *)v9 + 48);
    *((void *)v9 + 48) = v10;

    [*((id *)v9 + 48) setRecordingFormat:3];
    v12 = [v6 lastPathComponent];
    [*((id *)v9 + 48) setFileName:v12];

    *((void *)v9 + 63) = replayModeByApplyingUserDefaultOverrides(a4);
    uint64_t v13 = [v6 copy];
    v14 = (void *)*((void *)v9 + 57);
    *((void *)v9 + 57) = v13;

    v129 = v7;
    v130 = (id *)(v9 + 80);
    objc_storeStrong((id *)v9 + 10, v7);
    *((void *)v9 + 71) = 0;
    v9[427] = 1;
    v15 = [*((id *)v9 + 10) getAllStreams];
    v16 = (void *)[v15 mutableCopy];

    uint64_t v17 = *MEMORY[0x1E4F4D608];
    [v16 removeObject:*MEMORY[0x1E4F4D608]];
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    v19 = (void *)*((void *)v9 + 74);
    *((void *)v9 + 74) = v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    v21 = (void *)*((void *)v9 + 72);
    *((void *)v9 + 72) = v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    v23 = (void *)*((void *)v9 + 73);
    *((void *)v9 + 73) = v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
    v25 = (void *)*((void *)v9 + 51);
    *((void *)v9 + 51) = v24;

    uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
    v27 = (void *)*((void *)v9 + 52);
    *((void *)v9 + 52) = v26;

    int v28 = [*((id *)v9 + 10) containsMetadataStream:*MEMORY[0x1E4F4D618]];
    if (v28) {
      LOBYTE(v28) = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.replaySensor.replayVisionData"];
    }
    v9[426] = v28;
    int v29 = [*((id *)v9 + 10) containsStream:v17];
    if (v29) {
      LOBYTE(v29) = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.replaySensor.replayPearlDepthData"];
    }
    v9[424] = v29;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    id v30 = v16;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v131 objects:v137 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v132;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v132 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v131 + 1) + 8 * i);
          v36 = [MEMORY[0x1E4F1CA48] array];
          [*((id *)v9 + 51) setObject:v36 forKeyedSubscript:v35];

          v37 = [MEMORY[0x1E4F1CA48] array];
          [*((id *)v9 + 52) setObject:v37 forKeyedSubscript:v35];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v131 objects:v137 count:16];
      }
      while (v32);
    }

    v9[425] = 0;
    uint64_t v38 = [v9 _mainVideoStringID:v30];
    v39 = (void *)*((void *)v9 + 67);
    *((void *)v9 + 67) = v38;

    uint64_t v40 = [MEMORY[0x1E4F1CAD0] setWithArray:v30];
    v41 = (void *)*((void *)v9 + 17);
    *((void *)v9 + 17) = v40;

    v42 = (void *)MEMORY[0x1E4F1CAD0];
    v43 = [*((id *)v9 + 10) getAllMetadataStreams];
    uint64_t v44 = [v42 setWithArray:v43];
    v45 = (void *)*((void *)v9 + 18);
    *((void *)v9 + 18) = v44;

    [v9 readFileMetadata];
    uint64_t v46 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.arreplaysensor.timerQueue");
    v47 = (void *)*((void *)v9 + 5);
    *((void *)v9 + 5) = v46;

    v9[72] = 0;
    if (objc_opt_respondsToSelector()) {
      [v9 performSelector:sel__subscribeToBackgroundNotifications];
    }
    v7 = v129;
    if (*((void *)v9 + 63) == 3)
    {
      v48 = +[ARKitUserDefaults objectForKey:@"com.apple.arkit.session.replay.filepath"];
      v9[8] = v48 != 0;

      if (v9[8])
      {
        objc_msgSend(v9, "advanceToFrameIndex:", +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", @"com_apple_arkit_replay_filepath_advanceToFrame"));
        +[ARKitUserDefaults floatForKey:@"com_apple_arkit_replay_filepath_advanceFramesPerSecondMultiplier"];
        objc_msgSend(v9, "setAdvanceFramesPerSecondMultiplier:");
        v49 = [MEMORY[0x1E4F1CB18] appleGlobalDomain];
        [v49 addObserver:v9 forKeyPath:@"com_apple_arkit_replay_filepath_advanceToFrame" options:1 context:0];
        [v49 addObserver:v9 forKeyPath:@"com_apple_arkit_replay_filepath_advanceFramesPerSecondMultiplier" options:1 context:0];
        v50 = _ARLogSensor_11();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v51 = (objc_class *)objc_opt_class();
          v52 = NSStringFromClass(v51);
          *(_DWORD *)buf = 138543618;
          v139 = v52;
          __int16 v140 = 2048;
          v141 = (ARReplaySensorPublic *)v9;
          _os_log_impl(&dword_1B88A2000, v50, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Using manual command line mode.", buf, 0x16u);
        }
      }
    }
    else
    {
      v9[8] = 0;
    }
    v9[88] = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.replay.display.synchronization.marker"];
    *((void *)v9 + 12) = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.replay.display.synchronization.marker.frameCount"];
    if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.replaySensor.cropFrames"])
    {
      [v9 imageResolution];
      if (v58 == 1920.0 && v57 == 1440.0)
      {
        v59 = -[ARImageCroppingTechnique initWithCroppedImageSize:]([ARImageCroppingTechnique alloc], "initWithCroppedImageSize:", 1920.0, 1080.0);
        v60 = (void *)*((void *)v9 + 16);
        *((void *)v9 + 16) = v59;

        *(_OWORD *)(v9 + 600) = xmmword_1B8A2EA50;
        v61 = _ARLogSensor_11();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          v62 = (objc_class *)objc_opt_class();
          v63 = NSStringFromClass(v62);
          v64 = (void *)*((void *)v9 + 75);
          v65 = (void *)*((void *)v9 + 76);
          *(_DWORD *)buf = 138544130;
          v139 = v63;
          __int16 v140 = 2048;
          v141 = (ARReplaySensorPublic *)v9;
          __int16 v142 = 2048;
          id v143 = v64;
          __int16 v144 = 2048;
          id v145 = v65;
          _os_log_impl(&dword_1B88A2000, v61, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Frames will be cropped to %.0f x %.0f", buf, 0x2Au);
        }
      }
    }
    int64_t v66 = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.jasper.replayFramerate"];
    v67 = (id *)(v9 + 80);
    if (v66)
    {
      v68 = [NSNumber numberWithInteger:v66];
      [*v130 setDepthOutputFrameRate:v68];

      v69 = _ARLogSensor_11();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        v70 = (objc_class *)objc_opt_class();
        v71 = NSStringFromClass(v70);
        v72 = [*((id *)v9 + 10) depthOutputFrameRate];
        *(_DWORD *)buf = 138543874;
        v139 = v71;
        __int16 v140 = 2048;
        v141 = (ARReplaySensorPublic *)v9;
        __int16 v142 = 2112;
        id v143 = v72;
        _os_log_impl(&dword_1B88A2000, v69, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Setting jasper replay rate to: %@ fps", buf, 0x20u);
      }
    }
    *((void *)v9 + 30) = 0;
    v73 = @"JasperCamera";
    id v74 = (id)*MEMORY[0x1E4F51408];
    if (([*((id *)v9 + 10) containsStream:v73] & 1) != 0
      || ([*v130 containsStream:v74] & 1) != 0)
    {
      uint64_t v75 = 1;
    }
    else
    {
      if (([*v130 containsMetadataStream:*MEMORY[0x1E4F4D610]] & 1) == 0
        && ([*v130 containsMetadataStream:*MEMORY[0x1E4F4D640]] & 1) == 0
        && ![*v130 containsMetadataStream:*MEMORY[0x1E4F4D648]])
      {
LABEL_43:
        if (!ARDeviceSupportsJasper()) {
          goto LABEL_64;
        }
        id v127 = v74;
        v76 = [*v130 grabJasperExtrinsics];
        v77 = v76;
        if (v76)
        {
          v78 = [v76 objectForKeyedSubscript:*((void *)v9 + 67)];
          v79 = v78;
          if (v78)
          {
            double v80 = ARMatrix4x3FromNSData(v78);
            *((_DWORD *)v9 + 66) = v81;
            *((double *)v9 + 32) = v80;
            *((_DWORD *)v9 + 70) = v82;
            *((_DWORD *)v9 + 74) = v83;
            *((void *)v9 + 34) = v84;
            *((void *)v9 + 36) = v85;
            *((_DWORD *)v9 + 78) = v86;
            *((void *)v9 + 38) = v87;
          }
          if (ARDeviceSupportsUltraWideCamera())
          {
            v88 = [v9 _streamIdentifierForCaptureDeviceType:*MEMORY[0x1E4F15828] position:1];
            v89 = [v77 objectForKeyedSubscript:v88];

            if (v89)
            {
              double v90 = ARMatrix4x3FromNSData(v89);
              *((_DWORD *)v9 + 82) = v91;
              *((double *)v9 + 40) = v90;
              *((_DWORD *)v9 + 86) = v92;
              *((void *)v9 + 42) = v93;
              *((_DWORD *)v9 + 90) = v94;
              *((void *)v9 + 44) = v95;
              *((_DWORD *)v9 + 94) = v96;
              v79 = v89;
              *((void *)v9 + 46) = v97;
            }
            else
            {
              v79 = 0;
            }
            v67 = (id *)(v9 + 80);
          }
        }
        else
        {
          v79 = _ARLogSensor_11();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            v98 = (objc_class *)objc_opt_class();
            v99 = NSStringFromClass(v98);
            *(_DWORD *)buf = 138543618;
            v139 = v99;
            __int16 v140 = 2048;
            v141 = (ARReplaySensorPublic *)v9;
            _os_log_impl(&dword_1B88A2000, v79, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to get extrinsics to TOF sensor.", buf, 0x16u);
          }
        }

        if ([*((id *)v9 + 10) grabSWToWExtrinsics:v9 + 176])
        {
LABEL_63:

          id v74 = v127;
LABEL_64:
          v120 = _ARLogSensor_11();
          if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
          {
            v121 = (objc_class *)objc_opt_class();
            v122 = NSStringFromClass(v121);
            v123 = NSStringFromARReplayMode(*((void *)v9 + 63));
            *(_DWORD *)buf = 138544130;
            v139 = v122;
            __int16 v140 = 2048;
            v141 = (ARReplaySensorPublic *)v9;
            __int16 v142 = 2112;
            id v143 = v123;
            __int16 v144 = 2112;
            id v145 = v6;
            _os_log_impl(&dword_1B88A2000, v120, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Initialized: ReplayMode: %@, URL:%@", buf, 0x2Au);
          }
          [*((id *)v9 + 48) setRecordedSensorTypes:*((void *)v9 + 62)];
          [*((id *)v9 + 48) setArkitVersion:*((void *)v9 + 60)];
          [*((id *)v9 + 48) setOsVersion:*((void *)v9 + 59)];
          [*((id *)v9 + 48) setDeviceModel:*((void *)v9 + 58)];
          uint64_t v124 = *((void *)v9 + 30);
          if (v9[425])
          {
            id v8 = v128;
            if (v124 == 1)
            {
              uint64_t v125 = 6;
              goto LABEL_75;
            }
            if (v124 == 2)
            {
              uint64_t v125 = 7;
LABEL_75:
              [*((id *)v9 + 48) setRecordingFormat:v125];
            }
          }
          else
          {
            id v8 = v128;
            if (v124 == 1)
            {
              uint64_t v125 = 4;
              goto LABEL_75;
            }
            if (v124 == 2)
            {
              uint64_t v125 = 5;
              goto LABEL_75;
            }
          }
          +[ARSessionMetrics recordReplayMetrics:*((void *)v9 + 48)];

          goto LABEL_77;
        }
        v100 = _ARLogSensor_11();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          v101 = (objc_class *)objc_opt_class();
          v102 = NSStringFromClass(v101);
          *(_DWORD *)buf = 138543618;
          v139 = v102;
          __int16 v140 = 2048;
          v141 = (ARReplaySensorPublic *)v9;
          _os_log_impl(&dword_1B88A2000, v100, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to get extrinsics from ultrawide to wide, using default hardcoded extrinsics", buf, 0x16u);
        }
        v103 = [*v67 deviceString];
        if (v103
          && ([*v67 deviceString],
              v67 = (id *)objc_claimAutoreleasedReturnValue(),
              [v67 isEqualToString:@"ST2"]))
        {
          double v104 = ARST2UltrawideToWideExtrinsics();
          *((_DWORD *)v9 + 46) = v105;
          *((double *)v9 + 22) = v104;
          *((_DWORD *)v9 + 50) = v106;
          *((_DWORD *)v9 + 54) = v107;
          *((void *)v9 + 24) = v108;
          *((void *)v9 + 26) = v109;
          *((_DWORD *)v9 + 58) = v110;
          *((void *)v9 + 28) = v111;
        }
        else
        {
          double v112 = ARUltrawideToWideExtrinsics();
          *((_DWORD *)v9 + 46) = v113;
          *((double *)v9 + 22) = v112;
          *((_DWORD *)v9 + 50) = v114;
          *((_DWORD *)v9 + 54) = v115;
          *((void *)v9 + 24) = v116;
          *((void *)v9 + 26) = v117;
          *((_DWORD *)v9 + 58) = v118;
          *((void *)v9 + 28) = v119;
          if (!v103)
          {
LABEL_62:

            goto LABEL_63;
          }
        }

        goto LABEL_62;
      }
      uint64_t v75 = 2;
    }
    *((void *)v9 + 30) = v75;
    goto LABEL_43;
  }
  v53 = _ARLogSensor_11();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    v54 = (objc_class *)objc_opt_class();
    v55 = NSStringFromClass(v54);
    *(_DWORD *)buf = 138544130;
    v139 = v55;
    __int16 v140 = 2048;
    v141 = self;
    __int16 v142 = 2112;
    id v143 = v6;
    __int16 v144 = 2112;
    id v145 = v8;
    _os_log_impl(&dword_1B88A2000, v53, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create MOVStreamReader from URL: %@. Error: %@", buf, 0x2Au);
  }
  v56 = 0;
LABEL_78:

  return v56;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor_11();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: dealloc", buf, 0x16u);
  }
  [(ARReplaySensorPublic *)self _endReplay];
  if (self->_manualCommandLineMode)
  {
    id v6 = [MEMORY[0x1E4F1CB18] appleGlobalDomain];
    [v6 removeObserver:self forKeyPath:@"com_apple_arkit_replay_filepath_advanceToFrame"];
    [v6 removeObserver:self forKeyPath:@"com_apple_arkit_replay_filepath_advanceFramesPerSecondMultiplier"];
  }
  CVPixelBufferRelease(self->_depthFloat32PixelBuffer);
  CVPixelBufferRelease(self->_synchronizationMarker);
  CVPixelBufferPoolRelease(self->_synchronizationMarkerPool);
  synchronizationTransferSession = self->_synchronizationTransferSession;
  if (synchronizationTransferSession)
  {
    VTPixelTransferSessionInvalidate(synchronizationTransferSession);
    id v8 = self->_synchronizationTransferSession;
    if (v8) {
      CFRelease(v8);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)ARReplaySensorPublic;
  [(ARReplaySensorPublic *)&v9 dealloc];
}

- (BOOL)isReplayingManually
{
  return self->_replayMode == 3;
}

- (id)_mainVideoStringID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 firstObject];
  if ((unint64_t)[v4 count] >= 2
    && (([v5 isEqualToString:@"JasperCamera"] & 1) != 0
     || [v5 isEqualToString:*MEMORY[0x1E4F51408]]))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      uint64_t v10 = *MEMORY[0x1E4F51400];
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          __int16 v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "isEqualToString:", v10, (void)v15))
          {
            id v13 = v12;

            self->_usingST2Recording = 1;
            uint64_t v5 = v13;
            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return v5;
}

- (id)availableVideoFormatForDeviceType:(id)a3 position:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(ARReplaySensorPublic *)self _streamIdentifierForCaptureDeviceType:v6 position:a4];
  if ([(NSSet *)self->_availableVideoStreams containsObject:v7])
  {
    [(MOVReaderInterface *)self->_reader getSizeForStream:v7];
    double v9 = v8;
    double v11 = v10;
    uint64_t v12 = [(MOVReaderInterface *)self->_reader getOutputPixelFormatForStream:v7];
    if ([v6 isEqualToString:*MEMORY[0x1E4F15828]]) {
      id v13 = &unk_1F125C020;
    }
    else {
      id v13 = &unk_1F125C038;
    }
    uint64_t v14 = -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:frameRatesByPowerUsage:pixelFormat:]([ARVideoFormat alloc], "initWithImageResolution:captureDevicePosition:captureDeviceType:frameRatesByPowerUsage:pixelFormat:", a4, v6, v13, v12, v9, v11);
LABEL_11:
    long long v18 = v14;
    goto LABEL_13;
  }
  if ([(NSSet *)self->_availableVideoStreams count] == 1
    && ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(v6))
  {
    long long v15 = _ARLogSensor_11();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      long long v16 = (objc_class *)objc_opt_class();
      long long v17 = NSStringFromClass(v16);
      int v20 = 138543618;
      v21 = v17;
      __int16 v22 = 2048;
      v23 = self;
      _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_INFO, "%{public}@ <%p>: stream identifier not found in the recording, please use new recording format.", (uint8_t *)&v20, 0x16u);
    }
    uint64_t v14 = -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:]([ARVideoFormat alloc], "initWithImageResolution:captureDevicePosition:captureDeviceType:", a4, v6, self->_imageResolution.width, self->_imageResolution.height);
    goto LABEL_11;
  }
  long long v18 = 0;
LABEL_13:

  return v18;
}

- (void)start
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor_11();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    double v9 = v5;
    __int16 v10 = 2048;
    double v11 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: start", buf, 0x16u);
  }
  replayQueue = self->_replayQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__ARReplaySensorPublic_start__block_invoke;
  block[3] = &unk_1E61851B0;
  block[4] = self;
  dispatch_sync(replayQueue, block);
}

void __29__ARReplaySensorPublic_start__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareForReplay];
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 73) = 0;
  [*(id *)(a1 + 32) startReplayIfNeeded];
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 sensorDidStart:*(void *)(a1 + 32)];
  }
}

- (void)stop
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v3 = _ARLogSensor_11();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    double v9 = v5;
    __int16 v10 = 2048;
    double v11 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: stop", buf, 0x16u);
  }
  replayQueue = self->_replayQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__ARReplaySensorPublic_stop__block_invoke;
  block[3] = &unk_1E61851B0;
  block[4] = self;
  dispatch_async(replayQueue, block);
}

uint64_t __28__ARReplaySensorPublic_stop__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 72) = 0;
  *(unsigned char *)(*(void *)(result + 32) + 73) = 1;
  return result;
}

- (void)waitForOutstandingCallbacks
{
}

- (void)interrupt
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v3 = _ARLogSensor_11();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    double v9 = v5;
    __int16 v10 = 2048;
    double v11 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: interrupt", buf, 0x16u);
  }
  replayQueue = self->_replayQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__ARReplaySensorPublic_interrupt__block_invoke;
  block[3] = &unk_1E61851B0;
  block[4] = self;
  dispatch_sync(replayQueue, block);
}

void __33__ARReplaySensorPublic_interrupt__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 72))
  {
    *(unsigned char *)(v1 + 73) = 1;
    char v3 = [*(id *)(a1 + 32) delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) delegate];
      [v5 sensorDidPause:*(void *)(a1 + 32)];
    }
  }
}

- (void)endInterruption
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v3 = _ARLogSensor_11();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    double v9 = v5;
    __int16 v10 = 2048;
    double v11 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: endInterruption", buf, 0x16u);
  }
  replayQueue = self->_replayQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ARReplaySensorPublic_endInterruption__block_invoke;
  block[3] = &unk_1E61851B0;
  block[4] = self;
  dispatch_sync(replayQueue, block);
}

void __39__ARReplaySensorPublic_endInterruption__block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[72])
  {
    [v2 prepareForReplay];
    [*(id *)(a1 + 32) startReplayIfNeeded];
    *(unsigned char *)(*(void *)(a1 + 32) + 73) = 0;
    char v3 = [*(id *)(a1 + 32) delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) delegate];
      [v5 sensorDidRestart:*(void *)(a1 + 32)];
    }
  }
}

- (void)advanceFrame
{
  if (self->_running)
  {
    if (self->_replayMode)
    {
      replayQueue = self->_replayQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__ARReplaySensorPublic_advanceFrame__block_invoke;
      block[3] = &unk_1E61851B0;
      block[4] = self;
      dispatch_sync(replayQueue, block);
    }
  }
}

uint64_t __36__ARReplaySensorPublic_advanceFrame__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) advance];
}

- (id)customDataForTimestamp:(double)a3
{
  double v4 = a3 - self->_recordTimestampToMovieTimestampDifference;
  id v5 = [(ARReplaySensorPublic *)self customDataClasses];
  id v6 = [(ARReplaySensorPublic *)self keyedArchiveConverterForClasses:v5];
  uint64_t v7 = [(ARReplaySensorPublic *)self getItemsFromStream:@"mdta/com.apple.arkit.customdata" upToMovieTime:v6 converter:v4];
  double v8 = [v7 lastObject];

  return v8;
}

- (double)sourceTimestampForMovieTimestamp:(double)a3
{
  return self->_recordTimestampToMovieTimestampDifference + a3;
}

- (BOOL)finishedReplaying
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_finishedReplaying);
  return v2 & 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"com_apple_arkit_replay_filepath_advanceToFrame"])
  {
    +[ARKitUserDefaults removeCachedObjectForKey:@"com_apple_arkit_replay_filepath_advanceToFrame"];
    [(ARReplaySensorPublic *)self advanceToFrameIndex:+[ARKitUserDefaults integerForKey:@"com_apple_arkit_replay_filepath_advanceToFrame"]];
  }
  else if ([v10 isEqualToString:@"com_apple_arkit_replay_filepath_advanceFramesPerSecondMultiplier"])
  {
    +[ARKitUserDefaults removeCachedObjectForKey:@"com_apple_arkit_replay_filepath_advanceFramesPerSecondMultiplier"];
    +[ARKitUserDefaults floatForKey:@"com_apple_arkit_replay_filepath_advanceFramesPerSecondMultiplier"];
    -[ARReplaySensorPublic setAdvanceFramesPerSecondMultiplier:](self, "setAdvanceFramesPerSecondMultiplier:");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ARReplaySensorPublic;
    [(ARReplaySensorPublic *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    sequenceURL = self->_sequenceURL;
    BOOL v7 = (sequenceURL == (NSURL *)v5[57] || -[NSURL isEqual:](sequenceURL, "isEqual:"))
      && self->_replayMode == v5[63];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)prepareForReplay
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA80] set];
  if ([(NSSet *)self->_availableVideoStreams count] == 1)
  {
    [v3 addObject:self->_mainVideoStreamIdentifier];
  }
  else
  {
    v47 = v3;
    long long v57 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v54 = 0u;
    id v4 = [(ARParentImageSensorSettings *)self->_parentImageSensorSettings settings];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v55;
      uint64_t v8 = *MEMORY[0x1E4F15810];
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v55 != v7) {
            objc_enumerationMutation(v4);
          }
          id v10 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          id v11 = [v10 videoFormat];
          id v12 = v11;
          if (v11)
          {
            objc_super v13 = [v11 captureDeviceType];
            char v14 = [v13 isEqualToString:v8];

            if ((v14 & 1) == 0)
            {
              if ([v10 isEnabled])
              {
                long long v15 = [v12 captureDeviceType];
                long long v16 = -[ARReplaySensorPublic _streamIdentifierForCaptureDeviceType:position:](self, "_streamIdentifierForCaptureDeviceType:position:", v15, [v12 captureDevicePosition]);

                if (![(ARReplaySensorPublic *)self _allStreamsAreAvailable:v16])
                {
                  ARErrorWithCodeAndUserInfo(101, 0);
                  id v24 = (id)objc_claimAutoreleasedReturnValue();
                  uint64_t v44 = _ARLogSensor_11();
                  char v3 = v47;
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                  {
                    v45 = (objc_class *)objc_opt_class();
                    uint64_t v46 = NSStringFromClass(v45);
                    *(_DWORD *)buf = 138544130;
                    *(void *)&uint8_t buf[4] = v46;
                    *(_WORD *)&buf[12] = 2048;
                    *(void *)&buf[14] = self;
                    *(_WORD *)&buf[22] = 2112;
                    id v59 = v16;
                    __int16 v60 = 2112;
                    id v61 = v24;
                    _os_log_impl(&dword_1B88A2000, v44, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Recording doesn't have all the required (%@) video streams: %@", buf, 0x2Au);
                  }
                  [(ARReplaySensorPublic *)self failWithError:v24];

                  goto LABEL_34;
                }
                [v47 addObject:v16];
              }
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v54 objects:v62 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    char v3 = v47;
    if (!self->_parentImageSensorSettings)
    {
      long long v17 = _ARLogSensor_11();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        long long v18 = (objc_class *)objc_opt_class();
        v19 = NSStringFromClass(v18);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = self;
        _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: No image sensor settings defined, adding all available streams", buf, 0x16u);
      }
      int v20 = [(NSSet *)self->_availableVideoStreams allObjects];
      [v47 addObjectsFromArray:v20];
    }
  }
  objc_storeStrong((id *)&self->_videoStreamsToReplay, v3);
  double startTime = self->_startTime;
  reader = self->_reader;
  if (startTime == 0.0)
  {
    v53 = 0;
    *(_OWORD *)buf = *MEMORY[0x1E4F1FA48];
    *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    [(MOVReaderInterface *)reader resetReaderTo:buf error:&v53];
    v23 = v53;
  }
  else
  {
    [(ARReplaySensorPublic *)self currentCMTime];
    v51 = 0;
    [(MOVReaderInterface *)reader resetReaderTo:v52 error:&v51];
    v23 = v51;
  }
  id v24 = v23;
  [(MOVReaderInterface *)self->_reader duration];
  uint64_t v26 = v25;
  v27 = (NSMutableDictionary *)objc_opt_new();
  nextWrappedImageDataForStreamIdentifierMap = self->_nextWrappedImageDataForStreamIdentifierMap;
  self->_nextWrappedImageDataForStreamIdentifierMap = v27;

  int v29 = (NSMutableDictionary *)objc_opt_new();
  metadataCache = self->_metadataCache;
  self->_metadataCache = v29;

  id v4 = [(ARReplaySensorPublic *)self peekNextWrappedImageDataForAllRequiredStreams];
  id v12 = [v4 objectForKeyedSubscript:self->_mainVideoStreamIdentifier];
  uint64_t v31 = [v12 data];
  [v31 timestamp];
  double v33 = v32;
  [v12 timestamp];
  self->_recordTimestampToMovieTimestampDifference = v33 - v34;

  if (startTime == 0.0)
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __40__ARReplaySensorPublic_prepareForReplay__block_invoke;
    v48[3] = &unk_1E6187FD0;
    id v49 = v12;
    uint64_t v50 = v26;
    uint64_t v35 = (void (**)(void, void))MEMORY[0x1BA9C63E0](v48);
    v36 = [(ARReplaySensorPublic *)self replaySensorDelegate];
    ((void (**)(void, void *))v35)[2](v35, v36);

    v37 = [(ARReplaySensorPublic *)self traceReplaySensorDelegate];
    ((void (**)(void, void *))v35)[2](v35, v37);
  }
  uint64_t v38 = _ARLogSensor_11();
  v39 = v38;
  if (v24)
  {
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = (objc_class *)objc_opt_class();
      v41 = NSStringFromClass(v40);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v41;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      id v59 = v24;
      _os_log_impl(&dword_1B88A2000, v39, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error reseting reader: %@", buf, 0x20u);
    }
    [(ARReplaySensorPublic *)self failWithError:v24];
  }
  else
  {
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v43;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      _os_log_impl(&dword_1B88A2000, v39, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reset reader", buf, 0x16u);
    }
  }
LABEL_34:
}

void __40__ARReplaySensorPublic_prepareForReplay__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [*(id *)(a1 + 32) data];
    [v4 timestamp];
    double v6 = v5;

    double v7 = v6 + *(double *)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__ARReplaySensorPublic_prepareForReplay__block_invoke_2;
    block[3] = &unk_1E6186138;
    id v9 = v3;
    double v10 = v6;
    double v11 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __40__ARReplaySensorPublic_prepareForReplay__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) replaySensorDidFinishLoadingWithStartTimestamp:*(double *)(a1 + 40) endTimestamp:*(double *)(a1 + 48)];
}

- (BOOL)_allStreamsAreAvailable:(id)a3
{
  return [(NSSet *)self->_availableVideoStreams containsObject:a3];
}

- (void)startReplayIfNeeded
{
  if (!self->_replayStarted)
  {
    self->_replayStarted = 1;
    [(ARReplaySensorPublic *)self setImageIndex:0];
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSince1970];
    self->_double startTime = v4;

    self->_tick = 0;
    double v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 1uLL, (dispatch_queue_t)self->_replayQueue);
    timer = self->_timer;
    self->_timer = v5;

    dispatch_source_set_timer((dispatch_source_t)self->_timer, 0, 0x7F2815uLL, 0);
    objc_initWeak(&location, self);
    double v7 = self->_timer;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__ARReplaySensorPublic_startReplayIfNeeded__block_invoke;
    v8[3] = &unk_1E61852E8;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __43__ARReplaySensorPublic_startReplayIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained tick];
}

- (double)currentTime
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSince1970];
  double v5 = v4 - self->_startTime;

  return v5;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentCMTime
{
  [(ARReplaySensorPublic *)self currentTime];
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v4, 1000);
}

- (void)_endReplay
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = _ARLogSensor_11();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    Float64 v4 = (objc_class *)objc_opt_class();
    double v5 = NSStringFromClass(v4);
    int v10 = 138543618;
    double v11 = v5;
    __int16 v12 = 2048;
    objc_super v13 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: endReplay", (uint8_t *)&v10, 0x16u);
  }
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    double v7 = self->_timer;
    self->_timer = 0;
  }
  metadataCache = self->_metadataCache;
  self->_metadataCache = 0;

  atomic_store(1u, (unsigned __int8 *)&self->_finishedReplaying);
  depthContainer = self->_depthContainer;
  self->_depthContainer = 0;
}

- (id)wrappedImageDataOrderedByTime:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_43_0];
}

uint64_t __54__ARReplaySensorPublic_wrappedImageDataOrderedByTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 timestamp];
  double v7 = v6;
  [v5 timestamp];
  if (v7 >= v8)
  {
    [v4 timestamp];
    double v11 = v10;
    [v5 timestamp];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (void)tick
{
  if (self->_running && !self->_interrupted)
  {
    if (self->_replayMode != 3
      || [(ARReplaySensorPublic *)self targetFrameIndex] < 0
      || (int v3 = [(ARReplaySensorPublic *)self imageIndex],
          [(ARReplaySensorPublic *)self targetFrameIndex] >= v3))
    {
      ++self->_tick;
      [(ARReplaySensorPublic *)self currentTime];
      double v5 = v4;
      kdebug_trace();
      if (self->_replayMode == 1)
      {
        [(ARReplaySensorPublic *)self advance];
        kdebug_trace();
      }
      else
      {
        double v6 = [(ARReplaySensorPublic *)self peekNextWrappedImageDataForAllRequiredStreams];
        id v19 = v6;
        if (v6
          && [v6 count]
          && ([v19 objectForKeyedSubscript:self->_mainVideoStreamIdentifier],
              double v7 = objc_claimAutoreleasedReturnValue(),
              v7,
              v7))
        {
          if (self->_replayMode)
          {
            double v8 = [v19 objectForKeyedSubscript:self->_mainVideoStreamIdentifier];
            uint64_t v9 = [v8 data];
            double v10 = (double)[v9 captureFramesPerSecond];
            [(ARReplaySensorPublic *)self advanceFramesPerSecondMultiplier];
            double v12 = v11;
            BOOL v13 = v11 == 0.0;
            double v14 = 1.0;
            if (!v13) {
              double v14 = v12;
            }
            double v15 = v14 * v10;

            int v16 = (int)(120.0 / (double)(uint64_t)v15);
            if (v16 <= 1) {
              int v16 = 1;
            }
            if (!(self->_tick % v16)) {
              [(ARReplaySensorPublic *)self advance];
            }
          }
          else
          {
            while (1)
            {
              long long v17 = [(ARReplaySensorPublic *)self imageDataToReplayForTimestamp:v5];
              uint64_t v18 = [v17 count];

              if (!v18) {
                break;
              }
              [(ARReplaySensorPublic *)self advance];
            }
          }
        }
        else
        {
          [(ARReplaySensorPublic *)self _endReplay];
          [(ARReplaySensorPublic *)self _replaySensorFinishedReplayingData];
        }
        kdebug_trace();
      }
    }
  }
}

- (void)advance
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  int v3 = [(ARReplaySensorPublic *)self getNextWrappedImageDataForReplay];
  if ([v3 count])
  {
    double v4 = [v3 objectForKeyedSubscript:self->_mainVideoStreamIdentifier];
    v101 = v3;
    double v5 = [v3 allValues];
    double v6 = [(ARReplaySensorPublic *)self wrappedImageDataOrderedByTime:v5];

    v99 = v6;
    double v7 = [v6 lastObject];
    [v7 timestamp];
    double v9 = v8;

    croppingTechnique = self->_croppingTechnique;
    if (croppingTechnique && v4)
    {
      float v11 = [v4 data];
      double v12 = [(ARImageCroppingTechnique *)croppingTechnique processData:v11];
      [v4 setData:v12];
    }
    BOOL v13 = [(MOVReaderInterface *)self->_reader resolvedAccelStreamName:0];
    [(ARReplaySensorPublic *)self getItemsFromStream:v13 upToMovieTime:objc_opt_class() metadataClass:v9];
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 countByEnumeratingWithState:&v129 objects:v140 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v130;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v130 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v129 + 1) + 8 * i);
          int v20 = (void *)MEMORY[0x1BA9C6160]();
          [v19 timestamp];
          double v22 = v21;
          [(ARReplaySensorPublic *)self recordingTimeToReplayTimeOffset];
          [v19 setTimestamp:v22 + v23];
          [v19 timestamp];
          kdebug_trace();
          [(ARReplaySensorPublic *)self _didOutputSensorData:v19];
          [v19 timestamp];
          kdebug_trace();
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v129 objects:v140 count:16];
      }
      while (v16);
    }
    double v104 = v14;

    id v24 = [(MOVReaderInterface *)self->_reader resolvedGyroStreamName:0];

    [(ARReplaySensorPublic *)self getItemsFromStream:v24 upToMovieTime:objc_opt_class() metadataClass:v9];
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v25 countByEnumeratingWithState:&v125 objects:v139 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v126;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v126 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = *(void **)(*((void *)&v125 + 1) + 8 * j);
          uint64_t v31 = (void *)MEMORY[0x1BA9C6160]();
          [v30 timestamp];
          double v33 = v32;
          [(ARReplaySensorPublic *)self recordingTimeToReplayTimeOffset];
          [v30 setTimestamp:v33 + v34];
          [v30 timestamp];
          kdebug_trace();
          [(ARReplaySensorPublic *)self _didOutputSensorData:v30];
          [v30 timestamp];
          kdebug_trace();
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v125 objects:v139 count:16];
      }
      while (v27);
    }

    uint64_t v35 = [(MOVReaderInterface *)self->_reader resolvedDeviceMotionStreamName:0];

    [(ARReplaySensorPublic *)self getItemsFromStream:v35 upToMovieTime:objc_opt_class() metadataClass:v9];
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = [v36 countByEnumeratingWithState:&v121 objects:v138 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v122;
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v122 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = *(void **)(*((void *)&v121 + 1) + 8 * k);
          v42 = (void *)MEMORY[0x1BA9C6160]();
          [v41 timestamp];
          double v44 = v43;
          [(ARReplaySensorPublic *)self recordingTimeToReplayTimeOffset];
          [v41 setTimestamp:v44 + v45];
          [v41 timestamp];
          kdebug_trace();
          [(ARReplaySensorPublic *)self _didOutputSensorData:v41];
          [v41 timestamp];
          kdebug_trace();
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v121 objects:v138 count:16];
      }
      while (v38);
    }
    v98 = v25;
    v100 = v4;
    v103 = v36;

    uint64_t v46 = [(MOVReaderInterface *)self->_reader resolvedLocationStreamName:0];

    uint64_t v97 = (void *)v46;
    [(ARReplaySensorPublic *)self getItemsFromStream:v46 upToMovieTime:objc_opt_class() metadataClass:v9];
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    id v109 = (id)[obj countByEnumeratingWithState:&v117 objects:v137 count:16];
    if (v109)
    {
      uint64_t v107 = *(void *)v118;
      do
      {
        for (m = 0; m != v109; m = (char *)m + 1)
        {
          if (*(void *)v118 != v107) {
            objc_enumerationMutation(obj);
          }
          v48 = *(void **)(*((void *)&v117 + 1) + 8 * (void)m);
          id v49 = (void *)MEMORY[0x1BA9C6160]();
          [v48 timestamp];
          double v51 = v50;
          [(ARReplaySensorPublic *)self recordingTimeToReplayTimeOffset];
          [v48 setTimestamp:v51 + v52];
          kdebug_trace();
          [v48 timestamp];
          v53 = [v48 location];
          [v53 coordinate];
          long long v54 = [v48 location];
          [v54 coordinate];
          long long v55 = [v48 location];
          [v55 horizontalAccuracy];
          kdebug_trace();

          [(ARReplaySensorPublic *)self _didOutputSensorData:v48];
          kdebug_trace();
          kdebug_trace();
        }
        id v109 = (id)[obj countByEnumeratingWithState:&v117 objects:v137 count:16];
      }
      while (v109);
    }

    if (self->_displaySynchronizationMarker)
    {
      uint64_t v56 = [v100 data];
      if (v56)
      {
        long long v57 = (void *)v56;
        double v58 = [v100 data];
        uint64_t v59 = [v58 pixelBuffer];

        if (v59)
        {
          if (!self->_synchronizationMarker)
          {
            __int16 v60 = [v100 data];
            [v60 imageResolution];
            size_t v62 = (unint64_t)v61;
            uint64_t v63 = [v100 data];
            [v63 imageResolution];
            ARCreateSynchronizationMarker(v62, (unint64_t)v64, &self->_synchronizationMarker);

            v65 = [v100 data];
            [v65 imageResolution];
            LODWORD(v60) = v66;
            v67 = [v100 data];
            [v67 imageResolution];
            LODWORD(v63) = v68;
            v69 = [v100 data];
            OSType PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v69 pixelBuffer]);
            LODWORD(v60) = ar_pixelBufferPoolCreateNew(v60, v63, PixelFormatType, &self->_synchronizationMarkerPool);

            if (v60)
            {
              v71 = _ARLogGeneral_36();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
              {
                v72 = (objc_class *)objc_opt_class();
                v73 = NSStringFromClass(v72);
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v73;
                __int16 v135 = 2048;
                id v136 = self;
                _os_log_impl(&dword_1B88A2000, v71, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create pixel buffer pool", buf, 0x16u);
              }
            }
            if (VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &self->_synchronizationTransferSession))
            {
              id v74 = _ARLogGeneral_36();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              {
                uint64_t v75 = (objc_class *)objc_opt_class();
                v76 = NSStringFromClass(v75);
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v76;
                __int16 v135 = 2048;
                id v136 = self;
                _os_log_impl(&dword_1B88A2000, v74, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create transfer session", buf, 0x16u);
              }
            }
          }
          if (self->_displaySynchronizationMarkerFrames >= [(ARReplaySensorPublic *)self imageIndex])
          {
            *(void *)buf = 0;
            CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], self->_synchronizationMarkerPool, (CVPixelBufferRef *)buf);
            VTPixelTransferSessionTransferImage(self->_synchronizationTransferSession, self->_synchronizationMarker, *(CVPixelBufferRef *)buf);
            uint64_t v77 = *(void *)buf;
            v78 = [v100 data];
            [v78 setPixelBuffer:v77];

            CVPixelBufferRelease(*(CVPixelBufferRef *)buf);
          }
        }
      }
    }
    v79 = [v101 allKeys];
    v115[0] = MEMORY[0x1E4F143A8];
    v115[1] = 3221225472;
    v115[2] = __31__ARReplaySensorPublic_advance__block_invoke;
    v115[3] = &unk_1E6188018;
    id v80 = v101;
    id v116 = v80;
    int v81 = [v79 sortedArrayUsingComparator:v115];

    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id v110 = v81;
    uint64_t v82 = [v110 countByEnumeratingWithState:&v111 objects:v133 count:16];
    if (v82)
    {
      uint64_t v83 = v82;
      uint64_t v84 = *(void *)v112;
      uint64_t v106 = *MEMORY[0x1E4F15828];
      uint64_t v102 = *MEMORY[0x1E4F15830];
      do
      {
        uint64_t v85 = 0;
        uint64_t v108 = v83;
        do
        {
          if (*(void *)v112 != v84) {
            objc_enumerationMutation(v110);
          }
          uint64_t v86 = *(void *)(*((void *)&v111 + 1) + 8 * v85);
          uint64_t v87 = (void *)MEMORY[0x1BA9C6160]();
          v88 = [v80 objectForKeyedSubscript:v86];
          v89 = [v88 data];
          double v90 = v89;
          if (v89 && [v89 pixelBuffer])
          {
            uint64_t v91 = v84;
            [(ARReplaySensorPublic *)self _appendCalibrationData:v90 streamIdentifier:v86];
            [(ARReplaySensorPublic *)self _appendVisionDataToImageData:v90 streamIdentifier:v86];
            [(ARReplaySensorPublic *)self _populateDepthDataForImageData:v90];
            int v92 = [v103 lastObject];
            uint64_t v93 = [v104 lastObject];
            [(ARReplaySensorPublic *)self _populateDeviceOrientationIfNeededOnImageData:v90 fromDeviceOrientationData:v92 accelerometerData:v93 streamIdentifier:v86];

            +[ARImageSensor registerSignPostForImageData:v90];
            [v90 timestamp];
            kdebug_trace();
            int v94 = [v90 cameraType];
            LODWORD(v93) = [v94 isEqualToString:v106];

            if (v93)
            {
              if (ARMatrix4x3IsZero(*(float32x4_t *)self->_anon_b0, *(float32x4_t *)&self->_anon_b0[16], *(float32x4_t *)&self->_anon_b0[32], *(float32x4_t *)&self->_anon_b0[48]))ARWideToUltrawideExtrinsicsForOldRecordings(); {
              uint64_t v84 = v91;
              }
              objc_msgSend(v90, "addExtrinsicMatrix:toDeviceType:", v102);
            }
            else
            {
              uint64_t v84 = v91;
            }
            uint64_t v83 = v108;
            [(ARReplaySensorPublic *)self _didOutputSensorData:v90];
            [v90 timestamp];
            kdebug_trace();
          }

          ++v85;
        }
        while (v83 != v85);
        uint64_t v83 = [v110 countByEnumeratingWithState:&v111 objects:v133 count:16];
      }
      while (v83);
    }

    [(ARReplaySensorPublic *)self sourceTimestampForMovieTimestamp:v9];
    double v96 = v95;
    if (ARDeviceSupportsJasper()) {
      [(ARReplaySensorPublic *)self readAndVendCVADepthTOFsUntil:v96];
    }
    [(ARReplaySensorPublic *)self readAndVendCMDatasUntil:v96];
    [(ARReplaySensorPublic *)self readAndVendCVAUserEventsUntil:v96];
    kdebug_trace();

    int v3 = v101;
  }
  else
  {
    [(ARReplaySensorPublic *)self _endReplay];
    [(ARReplaySensorPublic *)self _replaySensorFinishedReplayingData];
    kdebug_trace();
  }
}

uint64_t __31__ARReplaySensorPublic_advance__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a3;
  double v7 = [v5 objectForKeyedSubscript:a2];
  double v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  double v9 = [v7 data];
  [v9 timestamp];
  double v11 = v10;
  double v12 = [v8 data];
  [v12 timestamp];
  double v14 = v13;

  if (v11 >= v14)
  {
    uint64_t v16 = [v7 data];
    [v16 timestamp];
    double v18 = v17;
    id v19 = [v8 data];
    [v19 timestamp];
    uint64_t v15 = v18 > v20;
  }
  else
  {
    uint64_t v15 = -1;
  }

  return v15;
}

- (void)_populateDeviceOrientationIfNeededOnImageData:(id)a3 fromDeviceOrientationData:(id)a4 accelerometerData:(id)a5 streamIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v10 deviceOrientation])
  {
    if (v11)
    {
      double v14 = [v11 deviceMotion];
      [v14 gravity];
      double v16 = v15;
      double v18 = v17;
    }
    else
    {
      if (!v12)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v25 = 0u;
        reader = self->_reader;
        if (reader) {
          [(MOVReaderInterface *)reader transformForStream:v13];
        }
        uint64_t v23 = [v10 cameraPosition];
        v24[0] = v25;
        v24[1] = v26;
        v24[2] = v27;
        uint64_t v21 = ARDeviceOrientationForCameraPositionAndVideoTransform(v23, v24);
        goto LABEL_16;
      }
      [v12 acceleration];
      double v16 = v19;
      double v18 = v20;
    }
    if (fabs(v16) <= fabs(v18))
    {
      if (v18 <= 0.0) {
        uint64_t v21 = 1;
      }
      else {
        uint64_t v21 = 2;
      }
    }
    else if (v16 <= 0.0)
    {
      uint64_t v21 = 3;
    }
    else
    {
      uint64_t v21 = 4;
    }
LABEL_16:
    [v10 setDeviceOrientation:v21];
  }
}

- (id)_populateCalibrationStream:(id)a3 timestamp:(double)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = [(NSMutableDictionary *)self->_calibrationBuffer objectForKeyedSubscript:a3];
  if ([(MOVReaderInterface *)self->_reader containsMetadataStream:*MEMORY[0x1E4F4D600]])
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    double v7 = [(NSMutableDictionary *)self->_calibrationBuffer allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v37;
      double v11 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          double v14 = [v13 lastObject];
          [v14 timestamp];
          if (v11 <= v15)
          {
            double v16 = [v13 lastObject];
            [v16 timestamp];
            double v11 = v17;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
    }

    double v18 = v11 + 0.00000011920929;
    if (v11 + 0.00000011920929 <= a4)
    {
      while (1)
      {
        objc_msgSend(v6, "removeAllObjects", v18);
        double v19 = [(MOVReaderInterface *)self->_reader grabNextCVACameraCalibrationData];
        if (![v19 count]) {
          break;
        }
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v33;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v33 != v23) {
                objc_enumerationMutation(v20);
              }
              long long v25 = *(void **)(*((void *)&v32 + 1) + 8 * j);
              calibrationBuffer = self->_calibrationBuffer;
              long long v27 = [v25 streamID];
              uint64_t v28 = [(NSMutableDictionary *)calibrationBuffer objectForKeyedSubscript:v27];
              [v28 addObject:v25];

              [v25 timestamp];
              if (v11 <= v29)
              {
                [v25 timestamp];
                double v11 = v30;
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v22);
        }

        double v18 = v11 + 0.00000011920929;
        if (v11 + 0.00000011920929 > a4) {
          goto LABEL_27;
        }
      }
    }
  }
LABEL_27:
  return v6;
}

- (id)_cameraCalibrationDataForStream:(id)a3 timestamp:(double)a4
{
  id v6 = a3;
  double v7 = (void *)MEMORY[0x1BA9C6160]();
  uint64_t v8 = [(ARReplaySensorPublic *)self _populateCalibrationStream:v6 timestamp:a4];
  if (![v8 count]) {
    goto LABEL_4;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__ARReplaySensorPublic__cameraCalibrationDataForStream_timestamp___block_invoke;
  v15[3] = &__block_descriptor_40_e41_B32__0__CVACameraCalibrationData_8Q16_B24l;
  *(double *)&v15[4] = a4;
  uint64_t v9 = [v8 indexOfObjectPassingTest:v15];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v8 removeAllObjects];
LABEL_4:
    id v10 = 0;
LABEL_5:

    double v11 = 0;
    goto LABEL_6;
  }
  uint64_t v13 = v9;
  id v10 = [v8 objectAtIndexedSubscript:v9];
  objc_msgSend(v8, "removeObjectsInRange:", 0, v13);
  [v10 timestamp];
  if (v14 + -0.00000011920929 > a4) {
    goto LABEL_5;
  }

  id v10 = v10;
  double v11 = v10;
LABEL_6:

  return v11;
}

BOOL __66__ARReplaySensorPublic__cameraCalibrationDataForStream_timestamp___block_invoke(uint64_t a1, void *a2)
{
  [a2 timestamp];
  return v3 + 0.00000011920929 > *(double *)(a1 + 32);
}

- (void)_appendVisionDataToImageData:(id)a3 streamIdentifier:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_shouldReplayVisionData)
  {
    id v46 = v7;
    uint64_t v8 = [(NSMutableDictionary *)self->_featureBuffers objectForKeyedSubscript:v7];
    if (v8)
    {
      double v45 = v6;
      [v6 timestamp];
      double v10 = v9;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      double v11 = [(NSMutableDictionary *)self->_featureBuffers allValues];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v53;
        double v15 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v53 != v14) {
              objc_enumerationMutation(v11);
            }
            double v17 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            double v18 = [v17 lastObject];
            [v18 timestamp];
            if (v15 <= v19)
            {
              id v20 = [v17 lastObject];
              [v20 timestamp];
              double v15 = v21;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v52 objects:v57 count:16];
        }
        while (v13);
      }
      else
      {
        double v15 = 0.0;
      }

      while (1)
      {
        double v26 = v15 + 0.00000011920929;
        if (v15 + 0.00000011920929 > v10) {
          break;
        }
        long long v27 = (void *)MEMORY[0x1BA9C6160](v26);
        [v8 removeAllObjects];
        uint64_t v28 = [(MOVReaderInterface *)self->_reader grabNextFeatureBuffer];
        if (![v28 count])
        {

          break;
        }
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v29 = v28;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v48 objects:v56 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v49;
          do
          {
            for (uint64_t j = 0; j != v31; ++j)
            {
              if (*(void *)v49 != v32) {
                objc_enumerationMutation(v29);
              }
              long long v34 = *(void **)(*((void *)&v48 + 1) + 8 * j);
              featureBuffers = self->_featureBuffers;
              long long v36 = [v34 sourceStreamID];
              long long v37 = [(NSMutableDictionary *)featureBuffers objectForKeyedSubscript:v36];
              [v37 addObject:v34];

              [v34 timestamp];
              if (v15 <= v38)
              {
                [v34 timestamp];
                double v15 = v39;
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v48 objects:v56 count:16];
          }
          while (v31);
        }
      }
      id v6 = v45;
      if (objc_msgSend(v8, "count", v26))
      {
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __70__ARReplaySensorPublic__appendVisionDataToImageData_streamIdentifier___block_invoke;
        v47[3] = &__block_descriptor_40_e33_B32__0__CVAFeatureBuffer_8Q16_B24l;
        *(double *)&v47[4] = v10;
        uint64_t v40 = [v8 indexOfObjectPassingTest:v47];
        if (v40 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v8 removeAllObjects];
        }
        else
        {
          uint64_t v41 = v40;
          uint64_t v42 = [v8 objectAtIndexedSubscript:v40];
          objc_msgSend(v8, "removeObjectsInRange:", 0, v41);
          [v42 timestamp];
          if (v10 >= v43 + -0.00000011920929)
          {
            double v44 = (__CVBuffer *)[v42 getPixelBuffer];
            [v45 setVisionData:v44];
            CVPixelBufferRelease(v44);
          }
        }
      }
    }
    else
    {
      uint64_t v22 = _ARLogGeneral_36();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v25 = id v24 = v6;
        *(_DWORD *)buf = 138543874;
        uint64_t v59 = v25;
        __int16 v60 = 2048;
        double v61 = self;
        __int16 v62 = 2114;
        id v63 = v46;
        _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Missing feature buffers queue for stream '%{public}@', not appending vision data", buf, 0x20u);

        id v6 = v24;
      }
    }
    id v7 = v46;
  }
}

BOOL __70__ARReplaySensorPublic__appendVisionDataToImageData_streamIdentifier___block_invoke(uint64_t a1, void *a2)
{
  [a2 timestamp];
  return v3 + 0.00000011920929 > *(double *)(a1 + 32);
}

- (void)_appendCalibrationData:(id)a3 streamIdentifier:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (ARDeviceSupportsJasper())
  {
    double v9 = [v7 cameraType];
    int v10 = [v9 isEqualToString:*MEMORY[0x1E4F15828]];

    uint64_t v11 = 256;
    if (v10) {
      uint64_t v11 = 320;
    }
    uint64_t v12 = 272;
    if (v10) {
      uint64_t v12 = 336;
    }
    uint64_t v13 = 288;
    if (v10) {
      uint64_t v13 = 352;
    }
    uint64_t v14 = 304;
    if (v10) {
      uint64_t v14 = 368;
    }
    objc_msgSend(v7, "addExtrinsicMatrix:toDeviceType:", *MEMORY[0x1E4F15810], *(double *)((char *)&self->super.isa + v11), *(double *)((char *)&self->super.isa + v12), *(double *)((char *)&self->super.isa + v13), *(double *)((char *)&self->super.isa + v14));
  }
  [v7 timestamp];
  double v15 = -[ARReplaySensorPublic _cameraCalibrationDataForStream:timestamp:](self, "_cameraCalibrationDataForStream:timestamp:", v8);

  if (v15)
  {
    double v16 = [v15 calibrationData];
    [v7 setCalibrationData:v16];

    double v17 = [v7 calibrationData];

    if (!v17)
    {
      [v7 extrinsicMatrixToDeviceType:*MEMORY[0x1E4F15810]];
      objc_msgSend(v15, "setExtrinsicMatrix:");
      double v18 = objc_msgSend(MEMORY[0x1E4F4D800], "ar_initWithCVACameraCalibrationData:", v15);
      [v7 setAdCameraCalibration:v18];

      double v19 = [v7 adCameraCalibration];

      if (!v19)
      {
        id v20 = _ARLogSensor_11();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          double v21 = (objc_class *)objc_opt_class();
          uint64_t v22 = NSStringFromClass(v21);
          int v37 = 138543618;
          double v38 = v22;
          __int16 v39 = 2048;
          uint64_t v40 = self;
          _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CVACameraCalibrationData from recording is missing some info.", (uint8_t *)&v37, 0x16u);
        }
      }
    }
  }
  uint64_t v23 = [v7 calibrationData];
  if (v23) {
    goto LABEL_18;
  }
  id v24 = [v7 adCameraCalibration];

  if (!v24)
  {
    long long v25 = _ARLogSensor_11();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      double v26 = (objc_class *)objc_opt_class();
      long long v27 = NSStringFromClass(v26);
      int v37 = 138543618;
      double v38 = v27;
      __int16 v39 = 2048;
      uint64_t v40 = self;
      _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Missing calibration from recording, attempting to use hardcoded calibrations", (uint8_t *)&v37, 0x16u);
    }
    uint64_t v28 = [v7 cameraType];
    int v29 = ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(v28);

    if (v29)
    {
      uint64_t v30 = [(MOVReaderInterface *)self->_reader deviceString];
      if (v30
        && ([(MOVReaderInterface *)self->_reader deviceString],
            double v4 = objc_claimAutoreleasedReturnValue(),
            [v4 isEqualToString:@"ST2"]))
      {
        uint64_t v23 = ARST2JasperWideCameraCalibration();
      }
      else
      {
        uint64_t v23 = ARJasperWideCameraCalibration();
        if (!v30)
        {
LABEL_29:

          [v23 cameraToPlatformTransform];
          objc_msgSend(v7, "addExtrinsicMatrix:toDeviceType:", *MEMORY[0x1E4F15810]);
          uint64_t v31 = objc_msgSend(MEMORY[0x1E4F4D800], "ar_calibrationWithImageData:adCalibrationData:", v7, v23);
          if (v31)
          {
            uint64_t v32 = v7;
            long long v33 = v31;
          }
          else
          {
            long long v34 = _ARLogGeneral_36();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              long long v35 = (objc_class *)objc_opt_class();
              long long v36 = NSStringFromClass(v35);
              int v37 = 138543618;
              double v38 = v36;
              __int16 v39 = 2048;
              uint64_t v40 = self;
              _os_log_impl(&dword_1B88A2000, v34, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: failed to create image adjusted calibration data", (uint8_t *)&v37, 0x16u);
            }
            uint64_t v32 = v7;
            long long v33 = v23;
          }
          [v32 setAdCameraCalibration:v33];

LABEL_18:
          goto LABEL_26;
        }
      }

      goto LABEL_29;
    }
  }
LABEL_26:
}

- (void)_populateDepthDataForImageData:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_shouldReplayPearlDepthData)
  {
    double v5 = self->_depthContainer;
    [v4 timestamp];
    double v7 = v6;
    uint64_t v8 = [(CVADepthIR *)v5 timestamp];
    if (v9 + 0.00000011920929 <= v7)
    {
      do
      {
        int v10 = (void *)MEMORY[0x1BA9C6160](v8);
        uint64_t v11 = [(MOVReaderInterface *)self->_reader grabNextDepthIR];
        if (![v11 count])
        {

          goto LABEL_8;
        }
        uint64_t v12 = [v11 lastObject];

        uint64_t v8 = [v12 timestamp];
        double v5 = (CVADepthIR *)v12;
      }
      while (v13 + 0.00000011920929 <= v7);
      if (v12) {
        goto LABEL_9;
      }
      goto LABEL_23;
    }
LABEL_8:
    uint64_t v12 = v5;
    if (!v5)
    {
LABEL_23:

      goto LABEL_24;
    }
LABEL_9:
    p_depthContainer = &self->_depthContainer;
    [v12 timestamp];
    if (v7 < v15 + -0.00000011920929)
    {
      objc_storeStrong((id *)&self->_depthContainer, v12);
      goto LABEL_23;
    }
    double v16 = *p_depthContainer;
    *p_depthContainer = 0;

    double v17 = (__CVBuffer *)[v12 dataBuffer];
    CVAttachmentMode attachmentMode = kCVAttachmentMode_ShouldNotPropagate;
    double v18 = (void *)CVBufferCopyAttachment(v17, (CFStringRef)*MEMORY[0x1E4F52818], &attachmentMode);
    if (v18)
    {
      p_depthFloat32PixelBuffer = &self->_depthFloat32PixelBuffer;
      depthFloat32PixelBuffer = self->_depthFloat32PixelBuffer;
      if (depthFloat32PixelBuffer)
      {
LABEL_13:
        if (!ARConvertFixedPointUnsigned13_3ToDepthFloat32Buffer(v17, depthFloat32PixelBuffer))
        {
LABEL_22:

          goto LABEL_23;
        }
        double v21 = [objc_alloc(MEMORY[0x1E4F164F8]) initWithPixelBuffer:*p_depthFloat32PixelBuffer depthMetadataDictionary:v18];
        [v4 setDepthData:v21];
LABEL_21:

        goto LABEL_22;
      }
      CFAllocatorRef v27 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      size_t Width = CVPixelBufferGetWidth(v17);
      size_t Height = CVPixelBufferGetHeight(v17);
      CVReturn v30 = CVPixelBufferCreate(v27, Width, Height, 0x66646570u, 0, &self->_depthFloat32PixelBuffer);
      if (!v30)
      {
        depthFloat32PixelBuffer = *p_depthFloat32PixelBuffer;
        goto LABEL_13;
      }
      CVReturn v31 = v30;
      double v21 = _ARLogGeneral_36();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      uint64_t v32 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v32);
      *(_DWORD *)buf = 138543874;
      long long v35 = v23;
      __int16 v36 = 2048;
      int v37 = self;
      __int16 v38 = 1024;
      CVReturn v39 = v31;
      id v24 = "%{public}@ <%p>: Failed to create float32-formatted pixel buffer for transcoding depth frames, CVReturn=%d";
      long long v25 = v21;
      uint32_t v26 = 28;
    }
    else
    {
      double v21 = _ARLogGeneral_36();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      uint64_t v22 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138543618;
      long long v35 = v23;
      __int16 v36 = 2048;
      int v37 = self;
      id v24 = "%{public}@ <%p>: Failed to retrieve depth metadata dictionary from depth pixel buffer's attachments";
      long long v25 = v21;
      uint32_t v26 = 22;
    }
    _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);

    goto LABEL_21;
  }
LABEL_24:
}

- (void)readAndVendCMDatasUntil:(double)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ([(MOVReaderInterface *)self->_reader containsMetadataStream:*MEMORY[0x1E4F4D5F8]])
  {
    id v5 = [(NSMutableArray *)self->_cmDataBuffer lastObject];
    [v5 timestamp];
    double v7 = v6;
    while (1)
    {

      if (v7 >= a3) {
        break;
      }
      uint64_t v8 = [(MOVReaderInterface *)self->_reader grabNextCMData];
      if (![v8 count])
      {

        break;
      }
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v5 = v8;
      uint64_t v9 = [v5 countByEnumeratingWithState:&v29 objects:v39 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v30 != v11) {
              objc_enumerationMutation(v5);
            }
            double v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            [v13 timestamp];
            if (v14 > v7)
            {
              [(NSMutableArray *)self->_cmDataBuffer addObject:v13];
              [v13 timestamp];
              double v7 = v15;
            }
          }
          uint64_t v10 = [v5 countByEnumeratingWithState:&v29 objects:v39 count:16];
        }
        while (v10);
      }
    }
    if ([(NSMutableArray *)self->_cmDataBuffer count])
    {
      *(void *)&long long v16 = 138543874;
      long long v27 = v16;
      while (1)
      {
        double v17 = [(NSMutableArray *)self->_cmDataBuffer firstObject];
        [v17 timestamp];
        if (v18 > a3) {
          break;
        }
        [(NSMutableArray *)self->_cmDataBuffer removeObjectAtIndex:0];
        if (([v17 isSent] & 1) == 0)
        {
          double v19 = [v17 additionalData];
          id v20 = (void *)MEMORY[0x1E4F28DC0];
          uint64_t v21 = objc_opt_class();
          id v28 = 0;
          uint64_t v22 = objc_msgSend(v20, "ar_unarchivedObjectOfClass:fromData:error:", v21, v19, &v28);
          id v23 = v28;
          if (v23)
          {
            id v24 = _ARLogSensor_11();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              long long v25 = (objc_class *)objc_opt_class();
              uint32_t v26 = NSStringFromClass(v25);
              *(_DWORD *)buf = v27;
              long long v34 = v26;
              __int16 v35 = 2048;
              __int16 v36 = self;
              __int16 v37 = 2112;
              id v38 = v23;
              _os_log_impl(&dword_1B88A2000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Replay sensor could not decode collaboration data: %@", buf, 0x20u);
            }
          }
          else
          {
            id v24 = [(ARReplaySensorPublic *)self session];
            [v24 updateWithCollaborationData:v22];
          }
        }
        if (![(NSMutableArray *)self->_cmDataBuffer count]) {
          return;
        }
      }
    }
  }
}

- (void)readAndVendCVADepthTOFsUntil:(double)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = [(NSMutableArray *)self->_cvaDepthTOFBuffer lastObject];
  [v5 timestamp];
  double v7 = v6;
  while (1)
  {

    if (v7 >= a3) {
      break;
    }
    uint64_t v8 = [(MOVReaderInterface *)self->_reader grabNextDepthTOF];
    if (![v8 count])
    {

      break;
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v5 = v8;
    uint64_t v9 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v5);
          }
          double v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          [v13 timestamp];
          if (v14 > v7)
          {
            [(NSMutableArray *)self->_cvaDepthTOFBuffer addObject:v13];
            [v13 timestamp];
            double v7 = v15;
          }
        }
        uint64_t v10 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v10);
    }
  }
  if ([(NSMutableArray *)self->_cvaDepthTOFBuffer count])
  {
    while (1)
    {
      long long v16 = (void *)MEMORY[0x1BA9C6160]();
      double v17 = [(NSMutableArray *)self->_cvaDepthTOFBuffer firstObject];
      [v17 timestamp];
      if (v18 > a3) {
        break;
      }
      [(NSMutableArray *)self->_cvaDepthTOFBuffer removeObjectAtIndex:0];
      uint64_t v19 = [v17 projectorMode];
      if ((unint64_t)(v19 - 1) >= 3) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = v19;
      }
      uint64_t v21 = [ARPointCloudSensorData alloc];
      uint64_t v22 = [v17 pointCloud];
      [v17 timestamp];
      id v23 = -[ARPointCloudSensorData initWithPointCloudData:projectorMode:timestamp:](v21, "initWithPointCloudData:projectorMode:timestamp:", v22, v20);

      if (v23)
      {
        +[ARDepthSensor registerSignPostForPointCloudData:v23];
        [(ARReplaySensorPublic *)self _didOutputSensorData:v23];
      }
      else
      {
        id v24 = _ARLogSensor_11();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          long long v25 = (objc_class *)objc_opt_class();
          uint32_t v26 = NSStringFromClass(v25);
          *(_DWORD *)buf = 138543618;
          long long v32 = v26;
          __int16 v33 = 2048;
          long long v34 = self;
          _os_log_impl(&dword_1B88A2000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Replay sensor couldn't not decode PointCloudSensor data", buf, 0x16u);
        }
      }

      if (![(NSMutableArray *)self->_cvaDepthTOFBuffer count]) {
        return;
      }
    }
  }
}

- (void)readAndVendCVAUserEventsUntil:(double)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if ([(MOVReaderInterface *)self->_reader containsMetadataStream:*MEMORY[0x1E4F4D620]])
  {
    id v5 = [(NSMutableArray *)self->_userEventBuffer lastObject];
    [v5 timestamp];
    double v7 = v6;
    while (1)
    {

      if (v7 >= a3) {
        goto LABEL_16;
      }
      uint64_t v8 = [(MOVReaderInterface *)self->_reader grabNextUserEvent];
      if (![v8 count]) {
        break;
      }
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v5 = v8;
      uint64_t v9 = [v5 countByEnumeratingWithState:&v32 objects:v42 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v33 != v11) {
              objc_enumerationMutation(v5);
            }
            double v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            [v13 timestamp];
            if (v14 > v7)
            {
              [(NSMutableArray *)self->_userEventBuffer addObject:v13];
              [v13 timestamp];
              double v7 = v15;
            }
          }
          uint64_t v10 = [v5 countByEnumeratingWithState:&v32 objects:v42 count:16];
        }
        while (v10);
      }
    }
LABEL_16:
    if (![(NSMutableArray *)self->_userEventBuffer count]) {
      return;
    }
    *(void *)&long long v16 = 138543874;
    long long v29 = v16;
    while (1)
    {
      double v17 = [(NSMutableArray *)self->_userEventBuffer firstObject];
      [v17 timestamp];
      if (v18 > a3)
      {

        return;
      }
      [(NSMutableArray *)self->_userEventBuffer removeObjectAtIndex:0];
      if ([v17 eventType] == 4) {
        break;
      }
      if ([v17 eventType] == 13)
      {
        uint64_t v19 = [v17 anchorData];
        long long v25 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v26 = objc_opt_class();
        id v30 = 0;
        uint64_t v22 = objc_msgSend(v25, "ar_unarchivedObjectOfClass:fromData:error:", v26, v19, &v30);
        id v23 = v30;
        if (v23)
        {
          id v24 = _ARLogSensor_11();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            goto LABEL_26;
          }
        }
        else
        {
          id v24 = [(ARReplaySensorPublic *)self session];
          [v24 removeAnchor:v22];
        }
LABEL_29:
      }
      if (![(NSMutableArray *)self->_userEventBuffer count]) {
        return;
      }
    }
    uint64_t v19 = [v17 anchorData];
    uint64_t v20 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v21 = objc_opt_class();
    id v31 = 0;
    uint64_t v22 = objc_msgSend(v20, "ar_unarchivedObjectOfClass:fromData:error:", v21, v19, &v31);
    id v23 = v31;
    if (v23)
    {
      id v24 = _ARLogSensor_11();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
LABEL_26:
        long long v27 = (objc_class *)objc_opt_class();
        long long v28 = NSStringFromClass(v27);
        *(_DWORD *)buf = v29;
        __int16 v37 = v28;
        __int16 v38 = 2048;
        CVReturn v39 = self;
        __int16 v40 = 2112;
        id v41 = v23;
        _os_log_impl(&dword_1B88A2000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Replay sensor could not decode anchor data: %@", buf, 0x20u);
      }
    }
    else
    {
      id v24 = [(ARReplaySensorPublic *)self session];
      [v24 addAnchor:v22];
    }
    goto LABEL_29;
  }
}

- (id)keyedArchiveConverter:(Class)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  id v5 = [(ARReplaySensorPublic *)self keyedArchiveConverterForClasses:v4];

  return v5;
}

- (id)keyedArchiveConverterForClasses:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__ARReplaySensorPublic_keyedArchiveConverterForClasses___block_invoke;
  v8[3] = &unk_1E6188080;
  id v9 = v4;
  uint64_t v10 = self;
  id v5 = v4;
  double v6 = (void *)MEMORY[0x1BA9C63E0](v8);

  return v6;
}

id __56__ARReplaySensorPublic_keyedArchiveConverterForClasses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ARApprovedDecoderClasses();
  id v5 = (void *)[v4 mutableCopy];

  [v5 unionSet:*(void *)(a1 + 32)];
  id v14 = 0;
  double v6 = objc_msgSend(MEMORY[0x1E4F28DC0], "ar_unarchivedObjectOfClasses:fromData:error:", v5, v3, &v14);

  id v7 = v14;
  if (!v6)
  {
    uint64_t v8 = _ARLogSensor_11();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      long long v16 = v10;
      __int16 v17 = 2048;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Replay sensor could not unpack %@, %@", buf, 0x2Au);
    }
  }

  return v6;
}

- (id)metadataWrapperConverter:(Class)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__ARReplaySensorPublic_metadataWrapperConverter___block_invoke;
  v5[3] = &unk_1E61880A8;
  v5[4] = self;
  v5[5] = a3;
  id v3 = (void *)MEMORY[0x1BA9C63E0](v5, a2);
  return v3;
}

id __49__ARReplaySensorPublic_metadataWrapperConverter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = *(objc_class **)(a1 + 40);
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithMetadataWrapper:v4];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v7 = _ARLogSensor_11();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      int v13 = 138543874;
      id v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Replay sensor could not unpack %@", (uint8_t *)&v13, 0x20u);
    }
  }

  return v5;
}

- (id)peekNextWrappedImageDataForAllRequiredStreams
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_videoStreamsToReplay;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = -[ARReplaySensorPublic peekNextWrappedImageDataForStreamIdentifier:](self, "peekNextWrappedImageDataForStreamIdentifier:", *(void *)(*((void *)&v11 + 1) + 8 * v7++), (void)v11);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  nextWrappedImageDataForStreamIdentifierMap = self->_nextWrappedImageDataForStreamIdentifierMap;
  return nextWrappedImageDataForStreamIdentifierMap;
}

- (id)peekNextWrappedImageDataForStreamIdentifier:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_nextWrappedImageDataForStreamIdentifierMap objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_nextWrappedImageDataForStreamIdentifierMap objectForKeyedSubscript:v4];
    goto LABEL_37;
  }
  CMTime v63 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  reader = self->_reader;
  id v62 = 0;
  id v8 = (__CVBuffer *)[(MOVReaderInterface *)reader copyNextFrameForStream:v4 timestamp:&v63 error:&v62];
  id v9 = (ARImageData *)v62;
  uint64_t v10 = v9;
  if (v8)
  {
    CMTime time = v63;
    double Seconds = CMTimeGetSeconds(&time);
    long long v12 = (__CFString *)v4;
    long long v13 = v12;
    if ([(NSSet *)self->_availableVideoStreams count] == 1)
    {
      long long v13 = v12;
      if (![(NSSet *)self->_availableMetadataStreams containsObject:v12])
      {
        long long v13 = @"mdta/com.apple.arkit.arimagedata";
      }
    }
    long long v14 = [(ARReplaySensorPublic *)self keyedArchiveConverter:objc_opt_class()];
    __int16 v15 = [(ARReplaySensorPublic *)self getWrappedItemsFromStream:v13 upToMovieTime:v14 converter:Seconds];
    uint64_t v6 = [v15 lastObject];

    if (!v6)
    {
      double v61 = v10;
      uint64_t v6 = objc_opt_new();
      CFDictionaryRef v16 = CVBufferCopyAttachments(v8, kCVAttachmentMode_ShouldPropagate);
      [v6 setTimestamp:Seconds];
      __int16 v17 = [[ARImageData alloc] initWithDictionary:v16];
      uint64_t v18 = AVCaptureDeviceTypeFromStreamIdentifier(v12);
      [(ARImageData *)v17 setCameraType:v18];

      [(ARImageData *)v17 setCameraPosition:AVCaptureDevicePositionFromStreamIdentifier(v12)];
      [(ARImageData *)v17 setCaptureFramesPerSecond:llround(self->_nominalFrameRate)];
      if (self->_usingST2Recording
        && (uint64_t v19 = *MEMORY[0x1E4F51480],
            [(__CFDictionary *)v16 objectForKey:*MEMORY[0x1E4F51480]],
            uint64_t v20 = objc_claimAutoreleasedReturnValue(),
            v20,
            v20))
      {
        __int16 v21 = [(__CFDictionary *)v16 objectForKey:v19];

        id v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F523A8]];
        uint64_t v23 = v22;
        if (v22)
        {
          [v22 doubleValue];
          -[ARImageData setExposureDuration:](v17, "setExposureDuration:");
        }
        __int16 v60 = v23;
        [(ARImageData *)v17 cameraIntrinsics];
        if (ARMatrix3x3IsZero(v24, v25, v26))
        {
          [(ARImageData *)v17 cameraType];
          long long v28 = v27 = v21;
          long long v29 = (void *)*MEMORY[0x1E4F15828];

          BOOL v30 = v28 == v29;
          __int16 v21 = v27;
          if (v30)
          {
            id v31 = [v27 objectForKey:*MEMORY[0x1E4F52440]];
            if (v31)
            {
              id v58 = v31;
              long long v32 = [v31 objectForKeyedSubscript:@"Width"];
              float v33 = (float)(int)[v32 intValue];

              double v34 = (float)(v33 / 640.0);
              *(float *)&unsigned int v35 = v34 * 245.391312;
              LODWORD(v36) = 0;
              HIDWORD(v36) = v35;
              -[ARImageData setCameraIntrinsics:](v17, "setCameraIntrinsics:", COERCE_DOUBLE((unint64_t)v35), v36, COERCE_DOUBLE(vcvt_f32_f64(vmulq_n_f64((float64x2_t)xmmword_1B8A56AD0, v34))));
              __int16 v37 = _ARLogSensor_11();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                __int16 v38 = (objc_class *)objc_opt_class();
                CVReturn v39 = NSStringFromClass(v38);
                LODWORD(time.value) = 138543874;
                *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v39;
                LOWORD(time.flags) = 2048;
                *(void *)((char *)&time.flags + 2) = self;
                HIWORD(time.epoch) = 2048;
                v65 = v17;
                _os_log_impl(&dword_1B88A2000, v37, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Falling back to hardcoded intrinsics for UW for %p.", (uint8_t *)&time, 0x20u);
              }
              __int16 v21 = v27;
              id v31 = v58;
            }
          }
        }
        __int16 v40 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F52328]];
        uint64_t v41 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F52330]];
        uint64_t v42 = (void *)v41;
        if (v40 && v41)
        {
          [v40 floatValue];
          float v44 = v43;
          [v42 floatValue];
          *(float *)&double v46 = log2f(v44 / v45);
          [(ARImageData *)v17 setExposureTargetOffset:v46];
        }
        long long v57 = v42;
        id v59 = v40;
        v47 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F523D0]];
        long long v48 = v47;
        if (v47)
        {
          [v47 floatValue];
          -[ARImageData setISO:](v17, "setISO:");
        }
        long long v49 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F52408]];
        long long v50 = v49;
        if (v49)
        {
          [v49 floatValue];
          -[ARImageData setSignalToNoiseRatio:](v17, "setSignalToNoiseRatio:");
        }
      }
      else
      {
        __int16 v21 = v16;
      }
      [v6 setData:v17];

      uint64_t v10 = v61;
    }
    long long v53 = [v6 data];
    [v53 setPixelBuffer:v8];

    double v54 = CACurrentMediaTime();
    long long v55 = [v6 data];
    [v55 setCurrentCaptureTimestamp:v54];

    CVPixelBufferRelease(v8);
    [(NSMutableDictionary *)self->_nextWrappedImageDataForStreamIdentifierMap setObject:v6 forKeyedSubscript:v12];
  }
  else
  {
    if (!v9)
    {
      uint64_t v6 = 0;
      goto LABEL_36;
    }
    _ARLogGeneral_36();
    long long v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      long long v51 = (objc_class *)objc_opt_class();
      long long v52 = NSStringFromClass(v51);
      LODWORD(time.value) = 138543874;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v52;
      LOWORD(time.flags) = 2048;
      *(void *)((char *)&time.flags + 2) = self;
      HIWORD(time.epoch) = 2112;
      v65 = v10;
      _os_log_impl(&dword_1B88A2000, (os_log_t)v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not copyNextFrameForStream: %@", (uint8_t *)&time, 0x20u);
    }
    uint64_t v6 = 0;
  }

LABEL_36:
LABEL_37:

  return v6;
}

- (id)getNextWrappedImageDataForReplay
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = [(ARReplaySensorPublic *)self peekNextWrappedImageDataForAllRequiredStreams];
  if ([(NSMutableDictionary *)self->_nextWrappedImageDataForStreamIdentifierMap count])
  {
    [(ARReplaySensorPublic *)self currentTime];
    double v5 = v4;
    uint64_t v6 = -[ARReplaySensorPublic imageDataToReplayForTimestamp:](self, "imageDataToReplayForTimestamp:");
    uint64_t v7 = (void *)[v6 mutableCopy];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = [v7 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v26;
      *(void *)&long long v10 = 138544130;
      long long v23 = v10;
      float32x4_t v24 = v8;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v8);
          }
          long long v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nextWrappedImageDataForStreamIdentifierMap, "setObject:forKeyedSubscript:", 0, v14, v23);
          if (self->_replayMode)
          {
            int v15 = 0;
          }
          else
          {
            CFDictionaryRef v16 = [(ARReplaySensorPublic *)self peekNextWrappedImageDataForStreamIdentifier:v14];
            int v15 = 0;
            if (v16)
            {
              do
              {
                [v16 timestamp];
                if (v17 > v5) {
                  break;
                }
                [v7 setObject:v16 forKeyedSubscript:v14];
                [(NSMutableDictionary *)self->_nextWrappedImageDataForStreamIdentifierMap setObject:0 forKeyedSubscript:v14];
                uint64_t v18 = [(ARReplaySensorPublic *)self peekNextWrappedImageDataForStreamIdentifier:v14];

                ++v15;
                CFDictionaryRef v16 = (void *)v18;
              }
              while (v18);
              if (v15)
              {
                uint64_t v19 = _ARLogSensor_11();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  uint64_t v20 = (objc_class *)objc_opt_class();
                  __int16 v21 = NSStringFromClass(v20);
                  *(_DWORD *)buf = v23;
                  BOOL v30 = v21;
                  __int16 v31 = 2048;
                  long long v32 = self;
                  __int16 v33 = 1024;
                  int v34 = v15;
                  __int16 v35 = 2112;
                  double v36 = v14;
                  _os_log_impl(&dword_1B88A2000, v19, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Skipped %u replay frames of type: %@", buf, 0x26u);

                  id v8 = v24;
                }
              }
            }
          }
          if ([v14 isEqualToString:self->_mainVideoStreamIdentifier]) {
            [(ARReplaySensorPublic *)self setImageIndex:v15 + [(ARReplaySensorPublic *)self imageIndex] + 1];
          }
        }
        uint64_t v11 = [v8 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v11);
    }
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

- (id)getItemsFromStream:(id)a3 upToMovieTime:(double)a4 converter:(id)a5
{
  double v5 = [(ARReplaySensorPublic *)self getWrappedItemsFromStream:a3 upToMovieTime:a5 converter:a4];
  uint64_t v6 = [v5 valueForKey:@"data"];

  return v6;
}

- (id)getItemsFromStream:(id)a3 upToMovieTime:(double)a4 metadataClass:(Class)a5
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__ARReplaySensorPublic_getItemsFromStream_upToMovieTime_metadataClass___block_invoke;
  v8[3] = &unk_1E61880D0;
  void v8[4] = self;
  v8[5] = a5;
  double v5 = [(ARReplaySensorPublic *)self getWrappedItemsFromStream:a3 upToMovieTime:v8 withBlock:a4];
  uint64_t v6 = [v5 valueForKey:@"data"];

  return v6;
}

id __71__ARReplaySensorPublic_getItemsFromStream_upToMovieTime_metadataClass___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = [MEMORY[0x1E4F1CA48] array];
  double v15 = 0.0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(*(id *)(a1 + 40), "grabNextFromReader:timestamp:", *(void *)(*(void *)(a1 + 32) + 80), &v15, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
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
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = objc_opt_new();
        [v9 setTimestamp:v15];
        [v9 setData:v8];
        [v2 addObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

- (BOOL)readNextFrameFromStream:(id)a3 forWrapper:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  CMTime v31 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  reader = self->_reader;
  id v30 = 0;
  uint64_t v9 = (__CVBuffer *)[(MOVReaderInterface *)reader copyNextFrameForStream:v6 timestamp:&v31 error:&v30];
  id v10 = v30;
  if (!v9)
  {
    int v18 = [(MOVReaderInterface *)self->_reader hasReachedEndOfStream:v6];
    uint64_t v19 = _ARLogSensor_11();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v20)
      {
        __int16 v21 = (objc_class *)objc_opt_class();
        id v22 = NSStringFromClass(v21);
        [v7 timestamp];
        LODWORD(time.value) = 138544130;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v22;
        LOWORD(time.flags) = 2048;
        *(void *)((char *)&time.flags + 2) = self;
        HIWORD(time.epoch) = 2112;
        id v33 = v6;
        __int16 v34 = 2048;
        uint64_t v35 = v23;
        float32x4_t v24 = "%{public}@ <%p>: Replay sensor reached end of stream %@ at %lf";
        long long v25 = v19;
        uint32_t v26 = 42;
LABEL_10:
        _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&time, v26);
      }
    }
    else if (v20)
    {
      long long v27 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v27);
      [v7 timestamp];
      LODWORD(time.value) = 138544386;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v22;
      LOWORD(time.flags) = 2048;
      *(void *)((char *)&time.flags + 2) = self;
      HIWORD(time.epoch) = 2112;
      id v33 = v6;
      __int16 v34 = 2048;
      uint64_t v35 = v28;
      __int16 v36 = 2112;
      id v37 = v10;
      float32x4_t v24 = "%{public}@ <%p>: Replay sensor couldn't get frame for stream %@ at %lf: %@";
      long long v25 = v19;
      uint32_t v26 = 52;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  CMTime time = v31;
  [v7 setTimestamp:CMTimeGetSeconds(&time)];
  long long v11 = [v7 data];

  if (!v11)
  {
    CFDictionaryRef v12 = CVBufferCopyAttachments(v9, kCVAttachmentMode_ShouldPropagate);
    long long v13 = [[ARImageData alloc] initWithDictionary:v12];
    long long v14 = AVCaptureDeviceTypeFromStreamIdentifier(v6);
    [(ARImageData *)v13 setCameraType:v14];

    [(ARImageData *)v13 setCameraPosition:AVCaptureDevicePositionFromStreamIdentifier(v6)];
    [(ARImageData *)v13 setCaptureFramesPerSecond:llround(self->_nominalFrameRate)];
    [v7 setData:v13];
  }
  double v15 = CACurrentMediaTime();
  CFDictionaryRef v16 = [v7 data];
  [v16 setCurrentCaptureTimestamp:v15];

  uint64_t v17 = [v7 data];
  [v17 setPixelBuffer:v9];

  CVPixelBufferRelease(v9);
LABEL_12:

  return v9 != 0;
}

- (double)_getMinFrameDurationForStream:(id)a3
{
  reader = self->_reader;
  if (reader) {
    [(MOVReaderInterface *)reader getMinFrameDurationForStream:a3];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  return CMTimeGetSeconds(&time);
}

- (id)getWrappedItemsFromPixelBufferStream:(id)a3 upToMovieTime:(double)a4 converter:(id)a5
{
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  [(ARReplaySensorPublic *)self _getMinFrameDurationForStream:v7];
  double v10 = v9;
  while (1)
  {
    long long v11 = objc_opt_new();
    if (![(ARReplaySensorPublic *)self readNextFrameFromStream:v7 forWrapper:v11])break; {
    [v11 timestamp];
    }
    double v13 = v10 + v12;
    [v8 addObject:v11];

    if (v13 > a4)
    {
      id v14 = v8;
      goto LABEL_6;
    }
  }

  id v14 = 0;
LABEL_6:

  return v14;
}

- (id)getWrappedItemsFromStream:(id)a3 upToMovieTime:(double)a4 converter:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__ARReplaySensorPublic_getWrappedItemsFromStream_upToMovieTime_converter___block_invoke;
  v14[3] = &unk_1E61880F8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  double v12 = [(ARReplaySensorPublic *)self getWrappedItemsFromStream:v11 upToMovieTime:v14 withBlock:a4];

  return v12;
}

uint64_t __74__ARReplaySensorPublic_getWrappedItemsFromStream_upToMovieTime_converter___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) getNextWrappedItemsFromStream:*(void *)(a1 + 40) converter:*(void *)(a1 + 48)];
}

- (id)getWrappedItemsFromStream:(id)a3 upToMovieTime:(double)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  id v10 = (void *)MEMORY[0x1BA9C6160]();
  id v11 = [(NSMutableDictionary *)self->_metadataCache objectForKeyedSubscript:v8];
  if (!v11)
  {
    id v11 = objc_opt_new();
    [(NSMutableDictionary *)self->_metadataCache setObject:v11 forKeyedSubscript:v8];
  }
  do
  {
    if ([v11 count])
    {
      double v12 = [v11 lastObject];
      [v12 timestamp];
      double v14 = v13;

      if (v14 > a4 + 0.00000011920929) {
        break;
      }
    }
    id v15 = v9[2](v9);
    [v11 addObjectsFromArray:v15];
    uint64_t v16 = [v15 count];
  }
  while (v16);
  [(ARReplaySensorPublic *)self _getMinFrameDurationForStream:v8];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__ARReplaySensorPublic_getWrappedItemsFromStream_upToMovieTime_withBlock___block_invoke;
  v21[3] = &__block_descriptor_56_e41_B32__0__ARReplayMovieDataWrapper_8Q16_B24l;
  *(double *)&v21[4] = v17;
  *(double *)&v21[5] = a4;
  *(double *)&v21[6] = v17 * 0.5;
  int v18 = [v11 indexesOfObjectsPassingTest:v21];
  uint64_t v19 = [v11 objectsAtIndexes:v18];
  [v11 removeObjectsAtIndexes:v18];

  return v19;
}

BOOL __74__ARReplaySensorPublic_getWrappedItemsFromStream_upToMovieTime_withBlock___block_invoke(double *a1, void *a2)
{
  double v3 = a1[5];
  objc_msgSend(a2, "timestamp", a1[4]);
  return vabdd_f64(v3, v4) <= a1[6];
}

- (id)getNextWrappedItemsFromStream:(id)a3 converter:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
  long long v29 = *MEMORY[0x1E4F1FA30];
  long long v30 = v8;
  long long v31 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
  id v9 = objc_opt_new();
  context = (void *)MEMORY[0x1BA9C6160]();
  uint64_t v23 = v6;
  if ([(MOVReaderInterface *)self->_reader containsMetadataStream:v6])
  {
    id v10 = [(MOVReaderInterface *)self->_reader grabNextMetadataOfStream:v6 timeRange:&v29];
  }
  else
  {
    id v10 = 0;
  }
  *(_OWORD *)&time.value = v29;
  time.epoch = v30;
  double Seconds = CMTimeGetSeconds(&time);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        int v18 = (void *)MEMORY[0x1BA9C6160]();
        uint64_t v19 = v7[2](v7, v17);
        if (v19)
        {
          BOOL v20 = objc_opt_new();
          [v20 setTimestamp:Seconds];
          [v20 setData:v19];
          [v9 addObject:v20];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v14);
  }

  return v9;
}

- (void)failWithError:(id)a3
{
  id v7 = a3;
  double v4 = [(ARReplaySensorPublic *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ARReplaySensorPublic *)self delegate];
    [v6 sensor:self didFailWithError:v7];
  }
}

- (void)_didOutputSensorData:(id)a3
{
  id v4 = a3;
  id v5 = [(ARReplaySensorPublic *)self delegate];
  [v5 sensor:self didOutputSensorData:v4];
}

- (void)setImageIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_imageIndex = a3;
  [(ARReplaySensorPublic *)self setNextFrameIndex:a3];
  if (self->_manualCommandLineMode)
  {
    id v5 = [NSNumber numberWithInt:v3];
    +[ARKitUserDefaults setObject:v5 forKey:@"com_apple_arkit_replay_filepath_nextFrameIndex"];
  }
}

- (id)imageDataToReplayForTimestamp:(double)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = [(ARReplaySensorPublic *)self peekNextWrappedImageDataForAllRequiredStreams];
  id v6 = objc_opt_new();
  if ([v5 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = objc_msgSend(v5, "allKeys", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v8) {
      goto LABEL_17;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = [v5 objectForKeyedSubscript:v12];
        uint64_t v14 = v13;
        if (!self->_replayMode)
        {
          [v13 timestamp];
          if (v19 > a3) {
            goto LABEL_15;
          }
LABEL_14:
          [v6 setObject:v14 forKeyedSubscript:v12];
          goto LABEL_15;
        }
        if ([v12 isEqualToString:self->_mainVideoStreamIdentifier]) {
          goto LABEL_14;
        }
        uint64_t v15 = [v5 objectForKeyedSubscript:self->_mainVideoStreamIdentifier];
        if (v15)
        {
          [v14 timestamp];
          double v17 = v16;
          [v15 timestamp];
          if (v17 <= v18) {
            [v6 setObject:v14 forKeyedSubscript:v12];
          }
        }

LABEL_15:
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v9)
      {
LABEL_17:

        break;
      }
    }
  }

  return v6;
}

- (void)readFileMetadata
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  self->_recordingFormatVersion = 0;
  uint64_t v3 = [(MOVReaderInterface *)self->_reader grabSummary];
  id v4 = [v3 objectForKey:@"mdta/com.apple.arkit.customuserdata"];
  customUserData = self->_customUserData;
  self->_customUserData = v4;

  [(MOVReaderInterface *)self->_reader metadataForMovie];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v55;
    uint64_t v10 = *MEMORY[0x1E4F4D5E8];
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v55 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = [*(id *)(*((void *)&v54 + 1) + 8 * i) identifier];
        int v13 = [v12 isEqualToString:v10];

        if (v13)
        {
          self->_recordingFormatVersion = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v54 objects:v63 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (self->_recordingFormatVersion == 1)
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = ARMetadataIdentifierForARSensorDataClass(v14, self->_recordingFormatVersion);
    double v16 = [(MOVReaderInterface *)self->_reader metadataTrackForStream:v15];
    uint64_t v17 = [v16 totalSampleDataLength];
    if (!v16 || v17 <= 0)
    {
      double v18 = _ARLogSensor_11();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        double v19 = (objc_class *)objc_opt_class();
        BOOL v20 = NSStringFromClass(v19);
        *(_DWORD *)buf = 138543618;
        __int16 v60 = v20;
        __int16 v61 = 2048;
        id v62 = self;
        _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reverting back to legacy format for metadata stream names.", buf, 0x16u);
      }
      self->_recordingFormatVersion = 0;
    }
  }
  long long v21 = [v3 objectForKeyedSubscript:@"mdta/com.apple.arkit.arsensordatatypeinformation"];
  long long v22 = v21;
  if (!v21)
  {
    id v48 = v6;
    long long v49 = v3;
    self->_recordedSensorTypes = 1;
    long long v23 = [(MOVReaderInterface *)self->_reader getAllMetadataStreams];
    uint64_t v24 = objc_opt_class();
    long long v25 = ARMetadataIdentifierForARSensorDataClass(v24, self->_recordingFormatVersion);
    uint64_t v26 = objc_opt_class();
    long long v27 = ARMetadataIdentifierForARSensorDataClass(v26, self->_recordingFormatVersion);
    uint64_t v28 = objc_opt_class();
    long long v29 = ARMetadataIdentifierForARSensorDataClass(v28, self->_recordingFormatVersion);
    uint64_t v30 = objc_opt_class();
    long long v31 = ARMetadataIdentifierForARSensorDataClass(v30, self->_recordingFormatVersion);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v32 = v23;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (!v33) {
      goto LABEL_36;
    }
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v51;
    while (1)
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v51 != v35) {
          objc_enumerationMutation(v32);
        }
        id v37 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        if ([v37 isEqualToString:v25])
        {
          uint64_t v38 = 2;
        }
        else if ([v37 isEqualToString:v27])
        {
          uint64_t v38 = 4;
        }
        else if ([v37 isEqualToString:v29])
        {
          uint64_t v38 = 8;
        }
        else
        {
          if (![v37 isEqualToString:v31]) {
            continue;
          }
          uint64_t v38 = 64;
        }
        self->_recordedSensorTypes |= v38;
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (!v34)
      {
LABEL_36:

        id v6 = v48;
        uint64_t v3 = v49;
        long long v22 = 0;
        goto LABEL_37;
      }
    }
  }
  self->_recordedSensorTypes = [v21 unsignedIntegerValue];
LABEL_37:
  CVReturn v39 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4D660]];
  deviceModel = self->_deviceModel;
  self->_deviceModel = v39;

  uint64_t v41 = [v3 objectForKeyedSubscript:@"mdta/com.apple.arkit.osversion"];
  osVersion = self->_osVersion;
  self->_osVersion = v41;

  float v43 = [v3 objectForKeyedSubscript:@"mdta/com.apple.arkit.arkitversion"];
  arkitVersion = self->_arkitVersion;
  self->_arkitVersion = v43;

  [(MOVReaderInterface *)self->_reader getSizeForStream:self->_mainVideoStreamIdentifier];
  self->_imageResolution.width = v45;
  self->_imageResolution.height = v46;
  [(MOVReaderInterface *)self->_reader getFrameRateForStream:self->_mainVideoStreamIdentifier];
  self->_nominalFrameRate = v47;
}

- (void)_replaySensorFinishedReplayingData
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__ARReplaySensorPublic__replaySensorFinishedReplayingData__block_invoke;
  v6[3] = &unk_1E6188140;
  v6[4] = self;
  uint64_t v3 = (void (**)(void, void))MEMORY[0x1BA9C63E0](v6, a2);
  id v4 = [(ARReplaySensorPublic *)self replaySensorDelegate];
  ((void (**)(void, void *))v3)[2](v3, v4);

  id v5 = [(ARReplaySensorPublic *)self traceReplaySensorDelegate];
  ((void (**)(void, void *))v3)[2](v3, v5);
}

void __58__ARReplaySensorPublic__replaySensorFinishedReplayingData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __58__ARReplaySensorPublic__replaySensorFinishedReplayingData__block_invoke_2;
    v4[3] = &unk_1E6185160;
    v4[4] = *(void *)(a1 + 32);
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

void __58__ARReplaySensorPublic__replaySensorFinishedReplayingData__block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[ARQATracer isEnabled];
  id v3 = _ARLogGeneral_36();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v6;
      __int16 v18 = 2048;
      uint64_t v19 = v7;
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Waiting 0.5 second for the QATracer to complete the last frame", buf, 0x16u);
    }
    dispatch_time_t v8 = dispatch_time(0, 500000000);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__ARReplaySensorPublic__replaySensorFinishedReplayingData__block_invoke_79;
    v14[3] = &unk_1E6185160;
    uint64_t v9 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v9;
    dispatch_after(v8, MEMORY[0x1E4F14428], v14);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = v11;
      __int16 v18 = 2048;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      uint64_t v21 = v13;
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: replaySensorDelegate replaySensorDidFinishReplayingData (2): %{public}@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) replaySensorDidFinishReplayingData];
  }
}

uint64_t __58__ARReplaySensorPublic__replaySensorFinishedReplayingData__block_invoke_79(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v2 = _ARLogGeneral_36();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543874;
    uint64_t v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1B88A2000, v2, OS_LOG_TYPE_INFO, "%{public}@ <%p>: replaySensorDelegate replaySensorDidFinishReplayingData (1): %{public}@", (uint8_t *)&v8, 0x20u);
  }
  return [*(id *)(a1 + 40) replaySensorDidFinishReplayingData];
}

- (id)_streamIdentifierForCaptureDeviceType:(id)a3 position:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (self->_usingST2Recording)
  {
    id v8 = (id)*MEMORY[0x1E4F51400];
    if (![v7 isEqualToString:*MEMORY[0x1E4F15828]]) {
      goto LABEL_11;
    }
    id v9 = (id)*MEMORY[0x1E4F51410];
    goto LABEL_10;
  }
  ARStreamIdentifierForDeviceTypeAndPosition(v6, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if ([v7 isEqualToString:*MEMORY[0x1E4F15828]]
    && ![(ARReplaySensorPublic *)self _allStreamsAreAvailable:v8])
  {
    uint64_t v10 = [NSString stringWithFormat:@"%@.%ld", @"AVCaptureDeviceTypeBuiltInSuperWideAngleCamera", a4];

    id v8 = (id)v10;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F15810]]
    && ![(ARReplaySensorPublic *)self _allStreamsAreAvailable:v8])
  {
    id v9 = [NSString stringWithFormat:@"%@.%ld", @"JasperCamera", a4];
LABEL_10:
    id v11 = v9;

    id v8 = v11;
  }
LABEL_11:

  return v8;
}

- (void)setTraceReplaySensorDelegate:(id)a3
{
}

- (ARReplaySensorDelegate)traceReplaySensorDelegate
{
  return self->_traceReplaySensorDelegate;
}

- (ARSensorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARSensorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ARReplaySensorDelegate)replaySensorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_replaySensorDelegate);
  return (ARReplaySensorDelegate *)WeakRetained;
}

- (void)setReplaySensorDelegate:(id)a3
{
}

- (NSURL)sequenceURL
{
  return self->_sequenceURL;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)arkitVersion
{
  return self->_arkitVersion;
}

- (CGSize)imageResolution
{
  double width = self->_imageResolution.width;
  double height = self->_imageResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)nominalFrameRate
{
  return self->_nominalFrameRate;
}

- (unint64_t)recordedSensorTypes
{
  return self->_recordedSensorTypes;
}

- (int64_t)replayMode
{
  return self->_replayMode;
}

- (int64_t)nextFrameIndex
{
  return self->_nextFrameIndex;
}

- (void)setNextFrameIndex:(int64_t)a3
{
  self->_nextFrameIndex = a3;
}

- (float)advanceFramesPerSecondMultiplier
{
  return self->_advanceFramesPerSecondMultiplier;
}

- (void)setAdvanceFramesPerSecondMultiplier:(float)a3
{
  self->_advanceFramesPerSecondMultiplier = a3;
}

- (NSSet)customDataClasses
{
  return self->_customDataClasses;
}

- (void)setCustomDataClasses:(id)a3
{
}

- (ARParentImageSensorSettings)parentImageSensorSettings
{
  return self->_parentImageSensorSettings;
}

- (void)setParentImageSensorSettings:(id)a3
{
}

- (NSString)mainVideoStreamIdentifier
{
  return self->_mainVideoStreamIdentifier;
}

- (void)setMainVideoStreamIdentifier:(id)a3
{
}

- (ARSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (ARSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (NSDictionary)customUserData
{
  return self->_customUserData;
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (BOOL)shouldReplayVisionData
{
  return self->_shouldReplayVisionData;
}

- (int)imageIndex
{
  return self->_imageIndex;
}

- (int64_t)targetFrameIndex
{
  return self->_targetFrameIndex;
}

- (void)setTargetFrameIndex:(int64_t)a3
{
  self->_targetFrameIndex = a3;
}

- (double)recordingTimeToReplayTimeOffset
{
  return self->_recordingTimeToReplayTimeOffset;
}

- (void)setRecordingTimeToReplayTimeOffset:(double)a3
{
  self->_recordingTimeToReplayTimeOffset = a3;
}

- (BOOL)recordingTimeToReplayTimeOffsetReset
{
  return self->_recordingTimeToReplayTimeOffsetReset;
}

- (void)setRecordingTimeToReplayTimeOffsetReset:(BOOL)a3
{
  self->_recordingTimeToReplayTimeOffsetReset = a3;
}

- (NSMutableArray)cmDataBuffer
{
  return self->_cmDataBuffer;
}

- (NSMutableArray)userEventBuffer
{
  return self->_userEventBuffer;
}

- (NSMutableArray)cvaDepthTOFBuffer
{
  return self->_cvaDepthTOFBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cvaDepthTOFBuffer, 0);
  objc_storeStrong((id *)&self->_userEventBuffer, 0);
  objc_storeStrong((id *)&self->_cmDataBuffer, 0);
  objc_storeStrong((id *)&self->_customUserData, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_mainVideoStreamIdentifier, 0);
  objc_storeStrong((id *)&self->_parentImageSensorSettings, 0);
  objc_storeStrong((id *)&self->_customDataClasses, 0);
  objc_storeStrong((id *)&self->_arkitVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_sequenceURL, 0);
  objc_destroyWeak((id *)&self->_replaySensorDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_featureBuffers, 0);
  objc_storeStrong((id *)&self->_calibrationBuffer, 0);
  objc_storeStrong((id *)&self->_depthContainer, 0);
  objc_storeStrong((id *)&self->_determinedReplayStats, 0);
  objc_storeStrong((id *)&self->_traceReplaySensorDelegate, 0);
  objc_storeStrong((id *)&self->_videoStreamsToReplay, 0);
  objc_storeStrong((id *)&self->_availableMetadataStreams, 0);
  objc_storeStrong((id *)&self->_availableVideoStreams, 0);
  objc_storeStrong((id *)&self->_croppingTechnique, 0);
  objc_storeStrong((id *)&self->_reader, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_replayQueue, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_nextWrappedImageDataForStreamIdentifierMap, 0);
}

@end