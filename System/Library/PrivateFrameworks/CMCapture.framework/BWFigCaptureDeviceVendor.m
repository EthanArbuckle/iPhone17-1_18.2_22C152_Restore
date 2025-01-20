@interface BWFigCaptureDeviceVendor
+ (BOOL)videoCaptureDeviceFirmwareIsLoaded;
+ (id)sharedCaptureDeviceVendor;
+ (id)sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction:(void *)Function;
+ (void)initialize;
- (BOOL)_isRearCameraCalibrationValid;
- (BOOL)activeDefaultDeviceEquals:(id)a3;
- (BOOL)hasActiveForClientAssertion;
- (BOOL)rearCameraCalibrationValid;
- (BOOL)streamsInUseForDevice:(id)a3;
- (BWFigCaptureDeviceVendor)initWithDefaultDeviceCreateFunction:(void *)a3;
- (BWFigCaptureDeviceVendor)initWithDefaultDeviceCreateFunction:(void *)a3 cmioExtensionDeviceCreateFunction:(void *)a4 cmioDiscoverySession:(id)a5;
- (NSArray)deviceIDs;
- (float)structuredLightProjectorStandbyTemperatureWithError:(int *)a3;
- (id)_copyStreamsFromDevice:(id)a3 positions:(id)a4 deviceTypes:(id)a5 requestControl:(BOOL)a6 deviceClientPriority:(int)a7 allowsStreamControlLoss:(BOOL)a8 error:(int *)a9;
- (id)_deviceWithID:(id)a3;
- (id)_popLatestVictimizedDeviceClient;
- (id)activeDeviceClient;
- (id)cameraPoseMatrixForStreamWithPosition:(int)a3 deviceType:(int)a4 deviceID:(id)a5;
- (id)cmioDeviceCreationHistory;
- (id)copyDefaultDeviceForVibeMitigation:(int *)a3;
- (id)copyDeviceForClient:(int)a3 informClientWhenDeviceAvailableAgain:(BOOL)a4 error:(int *)a5;
- (id)copyDeviceForPublishingWithID:(id)a3 error:(int *)a4;
- (id)copyDeviceWithID:(id)a3 forClient:(int)a4 informClientWhenDeviceAvailableAgain:(BOOL)a5 error:(int *)a6;
- (id)copyStreamFromDevice:(id)a3 position:(int)a4 deviceType:(int)a5 deviceClientPriority:(int)a6 allowsStreamControlLoss:(BOOL)a7 error:(int *)a8;
- (id)copyStreamWithoutControlFromDevice:(id)a3 position:(int)a4 deviceType:(int)a5 error:(int *)a6;
- (id)copyStreamsFromDevice:(id)a3 positions:(id)a4 deviceTypes:(id)a5 deviceClientPriority:(int)a6 allowsStreamControlLoss:(BOOL)a7 error:(int *)a8;
- (id)copyStreamsWithUniqueIDs:(id)a3 forDevice:(id)a4 deviceClientPriority:(int)a5 error:(int *)a6;
- (id)copyStreamsWithoutControlFromDevice:(id)a3 positions:(id)a4 deviceTypes:(id)a5 error:(int *)a6;
- (id)defaultDeviceCreationHistory;
- (id)deviceWithID:(id)a3;
- (id)osStatePropertyList;
- (id)registeredDeviceClientWithID:(int)a3;
- (id)registeredDeviceClients;
- (id)victimizedDeviceClients;
- (int)activeClientPriority;
- (int)createDeviceTime;
- (int)keepControlOfStreamsWithPositions:(id)a3 deviceTypes:(id)a4 forDevice:(id)a5;
- (int)registerClientWithPID:(int)a3 clientApplicationID:(id)a4 clientDescription:(id)a5 clientPriority:(int)a6 canStealFromClientsWithSamePriority:(BOOL)a7 deviceSharingWithOtherClientsAllowed:(BOOL)a8 deviceSharingWithAVFlashlightAllowed:(BOOL)a9 clientIsAVFlashlight:(BOOL)a10 deviceAvailabilityChangedHandler:(id)a11;
- (int)registerClientWithPID:(int)a3 clientDescription:(id)a4 clientPriority:(int)a5 canStealFromClientsWithSamePriority:(BOOL)a6 deviceSharingWithOtherClientsAllowed:(BOOL)a7 deviceSharingWithAVFlashlightAllowed:(BOOL)a8 clientIsAVFlashlight:(BOOL)a9 deviceAvailabilityChangedHandler:(id)a10;
- (int)requestControlOfStreams:(id)a3 device:(id)a4 deviceClientPriority:(int)a5;
- (int)unregisterClient:(int)a3;
- (int)usageCountForDevice:(id)a3;
- (uint64_t)_createDevice:(uint64_t)a3 reason:(int)a4 clientPID:;
- (uint64_t)_deviceCanBeSharedWithClient:(uint64_t)result;
- (uint64_t)_dumpInventory;
- (uint64_t)_getGameModeEnabledOnDevice:(uint64_t)a1;
- (uint64_t)_handleErrorForDevice:(uint64_t)result;
- (uint64_t)_logAFDriverShortStatisticsToCoreAnalyticsForDevice:(uint64_t)result;
- (uint64_t)_logActiveDefaultDeviceClientAndDevice;
- (uint64_t)_logISPStartupTimeToCoreAnalytics;
- (uint64_t)_logToFAFEstimatorResultsToCoreAnalyticsForDevice:(uint64_t)result;
- (uint64_t)_registerForStreamNotifications:(uint64_t)result;
- (uint64_t)_relinquishControlOfStreamsForDevice:(uint64_t)result;
- (uint64_t)_removeActiveDeviceClient:(int)a3 moveToVictimizedList:;
- (uint64_t)_removeDeviceClient:(int)a3 moveToVictimizedList:;
- (uint64_t)_removeRegisteredDeviceClientWithClientID:(uint64_t)result;
- (uint64_t)_removeVictimizedDeviceClientWithClientID:(uint64_t)result;
- (uint64_t)_requestControlOfStreams:(void *)a3 device:(uint64_t)a4 deviceClientPriority:;
- (uint64_t)_setLowMemoryModeEnabledOnDevice:(uint64_t)a1;
- (uint64_t)_unregisterFromStreamNotifications:(uint64_t)result;
- (uint64_t)_updateAFDriverShortStatisticsForStream:(uint64_t)result;
- (uint64_t)_updateTofAFEstimatorResultsForStream:(uint64_t)a3 totalStreamingDuration:;
- (void)_activeDeviceClientWithClientID:(uint64_t)a1;
- (void)_deviceAvailabilityChangedForClient:(char)a3 available:(char)a4 postNotification:(int)a5 reason:(char)a6 canShareWithAVFlashlight:;
- (void)_deviceStateForDeviceWithStream:(uint64_t)a1;
- (void)_handleCMIOExtensionDevicesChangedNotification:(id)a3;
- (void)_handleDeviceNoLongerAvailable:(uint64_t)a1;
- (void)_handleDeviceUnrecoverableError:(uint64_t)a3 fromDevice:;
- (void)_handleStreamControlTakenByAnotherClientNotification:(uint64_t)a1;
- (void)_handleStreamFrameReceiveTimeoutNotification:(uint64_t)a1;
- (void)_handleStreamRelinquishedByAnotherClientNotification:(uint64_t)a1;
- (void)_invalidateAndReleaseDevice:(uint64_t)a1;
- (void)_performBlockOnDeviceQueue:(uint64_t)a1;
- (void)_performBlockOnDeviceQueueSynchronously:(uint64_t)a1;
- (void)_registeredDeviceClientWithID:(void *)result;
- (void)_resetDeviceCloseTimerForDevice:(uint64_t)a1;
- (void)_setupDeviceCloseTimerForDevice:(uint64_t)a1;
- (void)_showISPLeftOnTapToRadarPromptIfNecessary:(uint64_t)a3 radarTitle:(uint64_t)a4 radarDescription:(uint64_t)a5 radarClassification:(uint64_t)a6 radarReproducibility:;
- (void)_updateCMIOExtensionDevices;
- (void)_updateDefaultDevicePriorStreamPortTypes:(uint64_t)a1;
- (void)dealloc;
- (void)invalidateVideoDevice:(id)a3 forPID:(int)a4;
- (void)prewarmDefaultVideoDeviceForPID:(int)a3 completionHandler:(id)a4;
- (void)resumeSystemPressuredDevice;
- (void)shutDownSystemPressuredDevice:(id)a3;
- (void)takeBackDevice:(id)a3 forClient:(int)a4 informClientWhenDeviceAvailableAgain:(BOOL)a5 prefersDeviceInvalidatedImmediately:(BOOL)a6;
- (void)takeBackStreams:(id)a3 device:(id)a4 totalStreamingDuration:(unsigned int)a5;
@end

@implementation BWFigCaptureDeviceVendor

- (uint64_t)_createDevice:(uint64_t)a3 reason:(int)a4 clientPID:
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v7 = a1;
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v95 = v4;
    LODWORD(v92) = 0;
    FigDebugAssert3();
  }
  if (-[__CFString isEqualToString:](a2, "isEqualToString:", 0x1EFA45440, v92, v95))
  {
    if (*(void *)(v7 + 88))
    {
      -[BWFigCaptureDeviceVendor _showISPLeftOnTapToRadarPromptIfNecessary:radarTitle:radarDescription:radarClassification:radarReproducibility:](v7, @"ISP left powered on. Please file a radar.", @"Stale BWFigCaptureDevice activity assertion found!", [NSString stringWithFormat:@"%@: Found stale assertion: %@", objc_msgSend(*(id *)(v7 + 152), "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date")), *(void *)(v7 + 88)], 3, 6);
      LODWORD(v123) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      *(void *)(v7 + 88) = 0;
    }
    if (a4 <= 0) {
      getpid();
    }
    *(void *)(v7 + 88) = FigOSTransactionCreate();
  }
  if (-[__CFString isEqualToString:](a2, "isEqualToString:", 0x1EFA45440, v93, v96))
  {
    v9 = *(uint64_t (**)(void, __CFString *, CFTypeRef *))(v7 + 8);
    if (*(void *)(v7 + 64))
    {
      LODWORD(v123) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      dispatch_source_cancel(*(dispatch_source_t *)(v7 + 64));
      dispatch_release(*(dispatch_object_t *)(v7 + 64));
      *(void *)(v7 + 64) = 0;
    }
    v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v7 + 56));
    dispatch_time_t v13 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v12, v13, 0x6FC23AC00uLL, 0x29A2241AF62C0000uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __59__BWFigCaptureDeviceVendor__createDevice_reason_clientPID___block_invoke;
    handler[3] = &unk_1E5C24430;
    handler[4] = v7;
    dispatch_source_set_event_handler(v12, handler);
    *(void *)(v7 + 64) = v12;
    dispatch_activate(v12);
    v11 = @"com.apple.CMCapture";
  }
  else
  {
    v9 = *(uint64_t (**)(void, __CFString *, CFTypeRef *))(v7 + 16);
    v11 = a2;
  }
  v100 = a2;
  if (!v9)
  {
    LODWORD(v123) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v83 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v84 = v123;
    if (os_log_type_enabled(v83, type[0])) {
      unsigned int v85 = v84;
    }
    else {
      unsigned int v85 = v84 & 0xFFFFFFFE;
    }
    if (!v85) {
      goto LABEL_143;
    }
    int v129 = 136315138;
    v130 = "-[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:]";
    LODWORD(v97) = 12;
    v94 = &v129;
    goto LABEL_142;
  }
  if ([(__CFString *)a2 isEqualToString:0x1EFA45440])
  {
    mach_absolute_time();
    if (*MEMORY[0x1E4F1EBA8])
    {
      v14 = fig_log_handle();
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A5887000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ISPCreateDuration", (const char *)&unk_1A5F8B35A, buf, 2u);
      }
    }
  }
  if (dword_1EB4C5450)
  {
    LODWORD(v123) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v16 = v123;
    if (os_log_type_enabled(v15, type[0])) {
      unsigned int v17 = v16;
    }
    else {
      unsigned int v17 = v16 & 0xFFFFFFFE;
    }
    if (v17)
    {
      int v129 = 136315138;
      v130 = "-[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:]";
      LODWORD(v97) = 12;
      v94 = &v129;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CFTypeRef cf = 0;
  uint64_t v18 = v9(*MEMORY[0x1E4F1CF80], v11, &cf);
  if (dword_1EB4C5450)
  {
    LODWORD(v123) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v20 = v123;
    if (os_log_type_enabled(v19, type[0])) {
      unsigned int v21 = v20;
    }
    else {
      unsigned int v21 = v20 & 0xFFFFFFFE;
    }
    if (v21)
    {
      int v129 = 136315394;
      v130 = "-[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:]";
      __int16 v131 = 2048;
      CFTypeRef v132 = cf;
      LODWORD(v97) = 22;
      v94 = &v129;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v18)
  {
    LODWORD(v123) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v86 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v87 = v123;
    if (os_log_type_enabled(v86, type[0])) {
      unsigned int v88 = v87;
    }
    else {
      unsigned int v88 = v87 & 0xFFFFFFFE;
    }
    if (v88)
    {
      int v129 = 136315394;
      v130 = "-[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:]";
      __int16 v131 = 1024;
      LODWORD(v132) = v18;
      LODWORD(v97) = 18;
      v94 = &v129;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_145;
  }
  v22 = [BWFigCaptureDevice alloc];
  v23 = [(BWFigCaptureDevice *)v22 initWithFigCaptureDevice:cf deviceID:a2];
  if (cf) {
    CFRelease(cf);
  }
  if (v23)
  {
    v24 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v24, "setObject:forKeyedSubscript:", -[BWFigCaptureDevice description](v23, "description"), @"Description");
    objc_msgSend(v24, "setObject:forKeyedSubscript:", -[BWFigCaptureDevice deviceID](v23, "deviceID"), @"DeviceID");
    objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v7 + 152), "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date")), @"CreationDate");
    int v25 = [(__CFString *)a2 isEqualToString:0x1EFA45440];
    uint64_t v26 = 144;
    if (v25) {
      uint64_t v26 = 136;
    }
    v27 = *(void **)(v7 + v26);
    v105 = v23;
    if ((unint64_t)objc_msgSend(v27, "count", v94, v97) >= 0xA)
    {
      v106 = v24;
      if (v25)
      {
        v28 = (void *)[v27 firstObject];
        if (![v28 objectForKeyedSubscript:@"ReleaseDate"]) {
          -[BWFigCaptureDeviceVendor _showISPLeftOnTapToRadarPromptIfNecessary:radarTitle:radarDescription:radarClassification:radarReproducibility:](v7, @"ISP left powered on. Please file a radar.", @"BWFigCaptureDevice was never released!", [NSString stringWithFormat:@"%@: Found stale BWFigCaptureDevice: %@", objc_msgSend(*(id *)(v7 + 152), "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date")), v28], 3, 6);
        }
        [v27 removeObjectAtIndex:0];
        [v27 addObject:v24];
        goto LABEL_59;
      }
      uint64_t v98 = v7;
      uint64_t v29 = [v27 count];
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v113 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      uint64_t v31 = [v27 countByEnumeratingWithState:&v113 objects:v128 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = 0;
        uint64_t v34 = *(void *)v114;
        uint64_t v35 = v29 - 10;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v114 != v34) {
              objc_enumerationMutation(v27);
            }
            v37 = *(void **)(*((void *)&v113 + 1) + 8 * i);
            if ([v37 objectForKeyedSubscript:@"ReleaseDate"])
            {
              [v30 addObject:v37];
              if (v33 == v35) {
                goto LABEL_55;
              }
              ++v33;
            }
          }
          uint64_t v32 = [v27 countByEnumeratingWithState:&v113 objects:v128 count:16];
        }
        while (v32);
      }
LABEL_55:
      if ([v30 count]) {
        [v27 removeObjectsInArray:v30];
      }

      uint64_t v7 = v98;
      v23 = v105;
      v24 = v106;
    }
    [v27 addObject:v24];
    if (!v25)
    {
      [(BWFigCaptureDevice *)v23 registerForNotification:@"UnrecoverableError" listener:v7 callback:fcdv_handleDeviceUnrecoverableError];
      [(BWFigCaptureDevice *)v23 registerForNotification:@"DeviceNoLongerAvailable" listener:v7 callback:fcdv_handleDeviceNoLongerAvailable];
      goto LABEL_106;
    }
LABEL_59:
    mach_absolute_time();
    *(_DWORD *)(v7 + 112) = ((int)FigHostTimeToNanoseconds() / 1000 + 999) / 1000;
    if (*MEMORY[0x1E4F1EBA8])
    {
      v38 = fig_log_handle();
      if (os_signpost_enabled(v38))
      {
        int v39 = *(_DWORD *)(v7 + 112);
        *(_DWORD *)buf = 67240192;
        int v134 = v39;
        _os_signpost_emit_with_name_impl(&dword_1A5887000, v38, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ISPCreateDuration", " enableTelemetry=YES N1=%{public,signpost.telemetry:number1}d", buf, 8u);
      }
    }
    [+[BWAggdDataReporter sharedInstance] reportISPCreateDuration:*(unsigned int *)(v7 + 112)];
    -[BWFigCaptureDeviceVendor _logISPStartupTimeToCoreAnalytics](v7);
    [(BWFigCaptureDevice *)v23 registerForNotification:@"UnrecoverableError" listener:v7 callback:fcdv_handleDeviceUnrecoverableError];
    uint64_t v99 = v7;
    [(BWFigCaptureDevice *)v23 registerForNotification:@"DeviceNoLongerAvailable" listener:v7 callback:fcdv_handleDeviceNoLongerAvailable];
    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    memset(v137, 0, sizeof(v137));
    long long v136 = 0u;
    int v135 = 1065353216;
    v137[0] = 1065353216;
    v137[5] = 1065353216;
    uint64_t v41 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v135 length:48];
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    obuint64_t j = [(BWFigCaptureDevice *)v23 streams];
    uint64_t v42 = [(NSArray *)obj countByEnumeratingWithState:&v123 objects:buf count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v124;
      uint64_t v45 = *MEMORY[0x1E4F54820];
      uint64_t v103 = *MEMORY[0x1E4F52DD8];
      uint64_t v102 = *MEMORY[0x1E4F52DF8];
      uint64_t v101 = *MEMORY[0x1E4F52E10];
      uint64_t v104 = *(void *)v124;
      do
      {
        uint64_t v46 = 0;
        uint64_t v107 = v43;
        do
        {
          if (*(void *)v124 != v44) {
            objc_enumerationMutation(obj);
          }
          v47 = *(void **)(*((void *)&v123 + 1) + 8 * v46);
          if (!objc_msgSend((id)objc_msgSend(v47, "supportedProperties"), "objectForKeyedSubscript:", v45))
          {
            uint64_t v50 = v41;
            id v51 = v40;
            long long v121 = 0u;
            long long v122 = 0u;
            *(_OWORD *)type = 0u;
            long long v120 = 0u;
            v52 = [(BWFigCaptureDevice *)v23 synchronizedStreamsGroups];
            uint64_t v53 = [(NSArray *)v52 countByEnumeratingWithState:type objects:&v129 count:16];
            if (v53)
            {
              uint64_t v54 = v53;
              uint64_t v55 = *(void *)v120;
LABEL_73:
              uint64_t v56 = 0;
              while (1)
              {
                if (*(void *)v120 != v55) {
                  objc_enumerationMutation(v52);
                }
                v57 = *(void **)(*(void *)&type[8] + 8 * v56);
                if (objc_msgSend((id)objc_msgSend(v57, "streams"), "containsObject:", v47)) {
                  break;
                }
                if (v54 == ++v56)
                {
                  uint64_t v54 = [(NSArray *)v52 countByEnumeratingWithState:type objects:&v129 count:16];
                  if (v54) {
                    goto LABEL_73;
                  }
                  goto LABEL_82;
                }
              }
              v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v47, 0);
              v59 = [[BWFigVideoCaptureSynchronizedStreamsGroup alloc] initWithSynchronizedStreamsGroup:v57 activeStreams:v58 readOnly:1 baseZoomFactorOverrides:0 clientBaseZoomFactorsByPortType:0 error:0];

              if (!v59) {
                goto LABEL_82;
              }
              uint64_t v60 = -[BWFigVideoCaptureSynchronizedStreamsGroup cameraPoseMatrixForPortType:](v59, "cameraPoseMatrixForPortType:", [v47 portType]);
              v23 = v105;
              id v40 = v51;
              uint64_t v41 = v50;
LABEL_86:
              uint64_t v44 = v104;
              uint64_t v43 = v107;
              goto LABEL_87;
            }
LABEL_82:
            if (objc_msgSend((id)objc_msgSend(v47, "portType"), "isEqualToString:", v103))
            {
              v59 = 0;
              uint64_t v41 = v50;
              uint64_t v60 = v50;
              v23 = v105;
              id v40 = v51;
              goto LABEL_86;
            }
            v23 = v105;
            id v40 = v51;
            uint64_t v41 = v50;
            if (objc_msgSend((id)objc_msgSend(v47, "portType"), "isEqualToString:", v102))
            {
              v59 = 0;
              uint64_t v60 = v50;
              goto LABEL_86;
            }
            v59 = 0;
            uint64_t v60 = v50;
            uint64_t v44 = v104;
            uint64_t v43 = v107;
            if (objc_msgSend((id)objc_msgSend(v47, "portType"), "isEqualToString:", v101)) {
LABEL_87:
            }
              objc_msgSend(v40, "setObject:forKeyedSubscript:", v60, objc_msgSend(v47, "portType"));

            goto LABEL_89;
          }
          v48 = (void *)[v47 getProperty:v45 error:0];
          v49 = (void *)v41;
          if (v48) {
            v49 = BWInvertRowMajorViewMatrixData(v48);
          }
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v49, objc_msgSend(v47, "portType"));
LABEL_89:
          ++v46;
        }
        while (v46 != v43);
        uint64_t v61 = [(NSArray *)obj countByEnumeratingWithState:&v123 objects:buf count:16];
        uint64_t v43 = v61;
      }
      while (v61);
    }
    v62 = (void *)[v40 copy];

    uint64_t v7 = v99;
    a2 = v100;
    [*(id *)(v99 + 96) setObject:v62 forKeyedSubscript:v100];

    -[BWFigCaptureDeviceVendor _updateDefaultDevicePriorStreamPortTypes:](v99, v23);
    if (FigCaptureCurrentProcessIsCameracaptured())
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v99 + 104));
      int v63 = *(unsigned __int8 *)(v99 + 108);
      int v64 = *(unsigned __int8 *)(v99 + 109);
      os_unfair_lock_unlock((os_unfair_lock_t)(v99 + 104));
      if (v63)
      {
        if (v64) {
          goto LABEL_106;
        }
      }
      else
      {
        BOOL isRearCameraCalibration = -[BWFigCaptureDeviceVendor _isRearCameraCalibrationValid](v99);
        os_unfair_lock_lock((os_unfair_lock_t)(v99 + 104));
        *(unsigned char *)(v99 + 109) = isRearCameraCalibration;
        *(unsigned char *)(v99 + 108) = 1;
        os_unfair_lock_unlock((os_unfair_lock_t)(v99 + 104));
        global_queue = dispatch_get_global_queue(21, 0);
        dispatch_async(global_queue, &__block_literal_global_285);
        if (isRearCameraCalibration) {
          goto LABEL_106;
        }
      }
      LODWORD(v123) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v67 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v68 = v123;
      if (os_log_type_enabled(v67, type[0])) {
        unsigned int v69 = v68;
      }
      else {
        unsigned int v69 = v68 & 0xFFFFFFFE;
      }
      if (v69)
      {
        int v129 = 136315138;
        v130 = "-[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:]";
        LODWORD(v97) = 12;
        v94 = &v129;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
LABEL_106:
    v70 = [[BWFigCaptureDeviceVendorDeviceState alloc] initWithDevice:v23];
    [*(id *)(v7 + 24) setObject:v70 forKeyedSubscript:a2];
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    v71 = [(BWFigCaptureDevice *)v23 streams];
    uint64_t v72 = [(NSArray *)v71 countByEnumeratingWithState:&v109 objects:v127 count:16];
    if (v72)
    {
      uint64_t v73 = v72;
      uint64_t v74 = *(void *)v110;
      uint64_t v75 = *MEMORY[0x1E4F54C58];
      uint64_t v76 = *MEMORY[0x1E4F547C0];
      do
      {
        for (uint64_t j = 0; j != v73; ++j)
        {
          if (*(void *)v110 != v74) {
            objc_enumerationMutation(v71);
          }
          v78 = *(void **)(*((void *)&v109 + 1) + 8 * j);
          if (objc_msgSend((id)objc_msgSend(v78, "supportedProperties", v94, v97), "objectForKeyedSubscript:", v75)) {
            -[NSMutableSet addObject:](-[BWFigCaptureDeviceVendorDeviceState portTypesToCheckForToFAFEstimator](v70, "portTypesToCheckForToFAFEstimator"), "addObject:", [v78 portType]);
          }
          if (objc_msgSend((id)objc_msgSend(v78, "supportedProperties"), "objectForKeyedSubscript:", v76)) {
            -[NSMutableSet addObject:](-[BWFigCaptureDeviceVendorDeviceState portTypesToCheckForAFDriverShortStatistics](v70, "portTypesToCheckForAFDriverShortStatistics"), "addObject:", [v78 portType]);
          }
        }
        uint64_t v73 = [(NSArray *)v71 countByEnumeratingWithState:&v109 objects:v127 count:16];
      }
      while (v73);
    }
    uint64_t v18 = 0;
    v79 = v105;
    if (v70) {
      goto LABEL_125;
    }
    goto LABEL_118;
  }
  LODWORD(v123) = 0;
  type[0] = OS_LOG_TYPE_DEFAULT;
  v89 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  unsigned int v90 = v123;
  if (os_log_type_enabled(v89, type[0])) {
    unsigned int v91 = v90;
  }
  else {
    unsigned int v91 = v90 & 0xFFFFFFFE;
  }
  if (v91)
  {
    int v129 = 136315138;
    v130 = "-[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:]";
    LODWORD(v97) = 12;
    v94 = &v129;
LABEL_142:
    _os_log_send_and_compose_impl();
  }
LABEL_143:
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  uint64_t v18 = 0;
LABEL_145:
  v79 = 0;
  if (!-[__CFString isEqualToString:](v100, "isEqualToString:", 0x1EFA45440, v94, v97)) {
    goto LABEL_124;
  }
LABEL_118:
  if (*MEMORY[0x1E4F1EBA8])
  {
    v80 = fig_log_handle();
    if (os_signpost_enabled(v80))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A5887000, v80, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ISPCreateDuration", (const char *)&unk_1A5F8B35A, buf, 2u);
    }
  }

  *(void *)(v7 + 88) = 0;
  v81 = *(NSObject **)(v7 + 64);
  if (v81)
  {
    dispatch_source_cancel(v81);
    dispatch_release(*(dispatch_object_t *)(v7 + 64));
    v70 = 0;
    *(void *)(v7 + 64) = 0;
  }
  else
  {
LABEL_124:
    v70 = 0;
  }
LABEL_125:

  return v18;
}

+ (id)sharedCaptureDeviceVendor
{
  return (id)[a1 sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction:0];
}

+ (id)sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction:(void *)Function
{
  if (sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction__sharedDeviceVendorLockOnce != -1) {
    dispatch_once(&sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction__sharedDeviceVendorLockOnce, &__block_literal_global_69);
  }
  pthread_mutex_lock((pthread_mutex_t *)sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction__sharedDeviceVendorLock);
  if (!sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction__sharedDeviceVendor)
  {
    if (objc_opt_class())
    {
      uint64_t v4 = [MEMORY[0x1E4F22120] sharedInstance];
      v5 = CMIOExtensionFigCaptureDeviceCreate;
    }
    else
    {
      uint64_t v4 = 0;
      v5 = 0;
    }
    v6 = [BWFigCaptureDeviceVendor alloc];
    if (!Function) {
      Function = FigCaptureGetCaptureDeviceCreateFunction();
    }
    sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction__sharedDeviceVendor = [(BWFigCaptureDeviceVendor *)v6 initWithDefaultDeviceCreateFunction:Function cmioExtensionDeviceCreateFunction:v5 cmioDiscoverySession:v4];
  }
  pthread_mutex_unlock((pthread_mutex_t *)sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction__sharedDeviceVendorLock);
  return (id)sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction__sharedDeviceVendor;
}

- (BOOL)rearCameraCalibrationValid
{
  p_calibrationStatusLock = &self->_calibrationStatusLock;
  os_unfair_lock_lock(&self->_calibrationStatusLock);
  BOOL calibrationStatusQueried = self->_calibrationStatusQueried;
  BOOL rearCameraCalibrationValid = self->_rearCameraCalibrationValid;
  os_unfair_lock_unlock(p_calibrationStatusLock);
  if (!calibrationStatusQueried)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return rearCameraCalibrationValid;
}

- (BOOL)activeDefaultDeviceEquals:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__BWFigCaptureDeviceVendor_activeDefaultDeviceEquals___block_invoke;
  v5[3] = &unk_1E5C25120;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = &v6;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)activeClientPriority
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__BWFigCaptureDeviceVendor_activeClientPriority__block_invoke;
  v4[3] = &unk_1E5C24F58;
  v4[4] = self;
  v4[5] = &v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v4);
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_updateDefaultDevicePriorStreamPortTypes:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (objc_msgSend((id)objc_msgSend(a2, "deviceID"), "isEqualToString:", 0x1EFA45440))
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v5 = (void *)[a2 streams];
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
            objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "portType"));
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }
      v10 = *(void **)(a1 + 160);
      if (v10)
      {
        if (([v10 isEqualToSet:v4] & 1) == 0)
        {
          [*(id *)(a1 + 160) setSet:v4];
          v11 = *(NSObject **)(a1 + 80);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __69__BWFigCaptureDeviceVendor__updateDefaultDevicePriorStreamPortTypes___block_invoke;
          block[3] = &unk_1E5C24430;
          block[4] = a1;
          dispatch_async(v11, block);
        }
      }
      else
      {
        *(void *)(a1 + 160) = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v4];
      }
    }
    else
    {
      FigDebugAssert3();
    }
  }
}

void __68__BWFigCaptureDeviceVendor__performBlockOnDeviceQueueSynchronously___block_invoke(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1A6272C70]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __123__BWFigCaptureDeviceVendor_copyStreamsFromDevice_positions_deviceTypes_deviceClientPriority_allowsStreamControlLoss_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _copyStreamsFromDevice:*(void *)(a1 + 40) positions:*(void *)(a1 + 48) deviceTypes:*(void *)(a1 + 56) requestControl:1 deviceClientPriority:*(unsigned int *)(a1 + 80) allowsStreamControlLoss:*(unsigned __int8 *)(a1 + 84) error:*(void *)(a1 + 72)];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
  return result;
}

uint64_t __54__BWFigCaptureDeviceVendor_activeDefaultDeviceEquals___block_invoke(void *a1)
{
  int v2 = (void *)[*(id *)(a1[4] + 24) objectForKeyedSubscript:0x1EFA45440];
  uint64_t v3 = a1[5];
  if (v3)
  {
    uint64_t result = [v2 device];
    BOOL v5 = v3 == result;
  }
  else
  {
    uint64_t result = [v2 deviceUsageCount];
    if (result)
    {
      char v6 = 0;
      goto LABEL_8;
    }
    uint64_t result = [*(id *)(a1[4] + 40) count];
    BOOL v5 = result == 0;
  }
  char v6 = v5;
LABEL_8:
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v6;
  return result;
}

uint64_t __48__BWFigCaptureDeviceVendor_activeClientPriority__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v2 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t result = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        if (v8 <= (int)[v7 clientPriority])
        {
          int v10 = [v7 clientPriority];
          uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        }
        else
        {
          uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
          int v10 = *(_DWORD *)(v9 + 24);
        }
        *(_DWORD *)(v9 + 24) = v10;
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)_setupDeviceCloseTimerForDevice:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1 && (FigCaptureIsDebuggerOrSlowAllocationPathEnabled() & 1) == 0)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v10 = v2;
      LODWORD(v9) = 0;
      FigDebugAssert3();
    }
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", a2, v9, v10);
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "device"), "deviceID"), "isEqualToString:", 0x1EFA45440))
    {
      if ([v5 deviceCloseTimer]
        && !dispatch_source_testcancel((dispatch_source_t)[v5 deviceCloseTimer]))
      {
        if (dword_1EB4C5450)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      else
      {
        if (dword_1EB4C5450)
        {
          int v14 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        int v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 56));
        [v5 setDeviceCloseTimer:v8];
        -[BWFigCaptureDeviceVendor _resetDeviceCloseTimerForDevice:](a1, a2);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __60__BWFigCaptureDeviceVendor__setupDeviceCloseTimerForDevice___block_invoke;
        handler[3] = &unk_1E5C249C8;
        handler[4] = v5;
        void handler[5] = a1;
        handler[6] = a2;
        handler[7] = v8;
        dispatch_source_set_event_handler(v8, handler);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __60__BWFigCaptureDeviceVendor__setupDeviceCloseTimerForDevice___block_invoke_254;
        v11[3] = &unk_1E5C24458;
        v11[4] = v5;
        v11[5] = v8;
        dispatch_source_set_cancel_handler(v8, v11);
        dispatch_resume(v8);
        dispatch_release(v8);
      }
    }
  }
}

- (void)_resetDeviceCloseTimerForDevice:(uint64_t)a1
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v11 = v2;
      LODWORD(v10) = 0;
      FigDebugAssert3();
    }
    if ((FigCaptureIsDebuggerOrSlowAllocationPathEnabled() & 1) == 0)
    {
      uint64_t v5 = (void *)[*(id *)(a1 + 24) objectForKeyedSubscript:a2];
      if ([v5 deviceCloseTimer])
      {
        int64_t v6 = (unint64_t)(*(double *)(a1 + 72) * 1000000000.0);
        if (dword_1EB4C5450)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        int v8 = objc_msgSend(v5, "deviceCloseTimer", v10, v11);
        dispatch_time_t v9 = dispatch_time(0, v6);
        dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
    }
  }
}

- (id)_copyStreamsFromDevice:(id)a3 positions:(id)a4 deviceTypes:(id)a5 requestControl:(BOOL)a6 deviceClientPriority:(int)a7 allowsStreamControlLoss:(BOOL)a8 error:(int *)a9
{
  BOOL v10 = a8;
  BOOL v11 = a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v29 = 0;
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v26 = v27;
    LODWORD(v25) = 0;
    FigDebugAssert3();
  }
  if (dword_1EB4C5450)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a3)
  {
    uint64_t v16 = [a4 count];
    if (v16 == [a5 count])
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = -[NSMutableDictionary objectForKeyedSubscript:](self->_devicesStatesByDeviceID, "objectForKeyedSubscript:", [a3 deviceID]);
      if ([a4 count] != 1
        || objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", 0), "intValue")
        || objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", 0), "intValue"))
      {
        unsigned int v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a4, "count", v25, v26));
        if ([a4 count])
        {
          uint64_t v18 = 0;
          while (1)
          {
            uint64_t v19 = BWCaptureDevicePositionAndDeviceTypeToPortType(objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v18), "intValue"), objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v18), "intValue"));
            if (!v19) {
              break;
            }
            [v17 addObject:v19];
            if ([a4 count] <= (unint64_t)++v18) {
              goto LABEL_14;
            }
          }
          unsigned int v20 = 0;
          unsigned int v21 = 0;
          int v29 = -12780;
          goto LABEL_25;
        }
LABEL_14:
        unsigned int v20 = (void *)[a3 copyStreamsWithPortTypes:v17 error:&v29];
        if (v29)
        {
          uint64_t v26 = v27;
          LODWORD(v25) = v29;
          FigDebugAssert3();
          unsigned int v21 = 0;
          goto LABEL_29;
        }
        if (v10)
        {
          unsigned int v21 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:v17];
          goto LABEL_19;
        }
      }
      else
      {
        unsigned int v20 = objc_msgSend((id)objc_msgSend(a3, "streams"), "copy");
      }
      unsigned int v21 = 0;
LABEL_19:
      if (objc_msgSend(v21, "count", v25)) {
        objc_msgSend((id)-[NSObject portTypesAllowingStreamControlLoss](os_log_and_send_and_compose_flags_and_os_log_type, "portTypesAllowingStreamControlLoss"), "addObjectsFromArray:", v21);
      }
      if (v11)
      {
        int v22 = -[BWFigCaptureDeviceVendor _requestControlOfStreams:device:deviceClientPriority:]((uint64_t)self, v20, a3, a7);
        int v29 = v22;
        if (!v22)
        {
          v23 = a9;
          goto LABEL_34;
        }
        uint64_t v26 = v27;
        LODWORD(v25) = v22;
        FigDebugAssert3();
      }
LABEL_29:
      v23 = a9;
      if (!v29) {
        goto LABEL_34;
      }
      goto LABEL_30;
    }
  }
  unsigned int v20 = 0;
  unsigned int v21 = 0;
  int v29 = -12780;
LABEL_25:
  v23 = a9;
LABEL_30:
  if (objc_msgSend(v21, "count", v25, v26) && v29 != -12681) {
    objc_msgSend((id)-[NSObject portTypesAllowingStreamControlLoss](os_log_and_send_and_compose_flags_and_os_log_type, "portTypesAllowingStreamControlLoss"), "removeObjectsInArray:", v21);
  }

  unsigned int v20 = 0;
LABEL_34:
  if (v23) {
    int *v23 = v29;
  }
  return v20;
}

- (id)copyStreamsFromDevice:(id)a3 positions:(id)a4 deviceTypes:(id)a5 deviceClientPriority:(int)a6 allowsStreamControlLoss:(BOOL)a7 error:(int *)a8
{
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__26;
  unsigned int v17 = __Block_byref_object_dispose__26;
  uint64_t v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __123__BWFigCaptureDeviceVendor_copyStreamsFromDevice_positions_deviceTypes_deviceClientPriority_allowsStreamControlLoss_error___block_invoke;
  v10[3] = &unk_1E5C29068;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  v10[7] = a5;
  int v11 = a6;
  BOOL v12 = a7;
  v10[8] = &v13;
  v10[9] = a8;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v10);
  int v8 = (void *)v14[5];
  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)_performBlockOnDeviceQueueSynchronously:(uint64_t)a1
{
  if (a1)
  {
    if (a2)
    {
      uint64_t v2 = *(NSObject **)(a1 + 56);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__BWFigCaptureDeviceVendor__performBlockOnDeviceQueueSynchronously___block_invoke;
      block[3] = &unk_1E5C249F0;
      block[4] = a2;
      dispatch_sync(v2, block);
    }
  }
}

- (uint64_t)_requestControlOfStreams:(void *)a3 device:(uint64_t)a4 deviceClientPriority:
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v8 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v45 = v4;
      LODWORD(v42) = 0;
      FigDebugAssert3();
    }
    if (objc_msgSend(a3, "invalidated", v42, v45))
    {
      return 4294954511;
    }
    else
    {
      if (dword_1EB4C5450)
      {
        unsigned int v69 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      BOOL v10 = objc_msgSend(*(id *)(v8 + 24), "objectForKeyedSubscript:", objc_msgSend(a3, "deviceID", v43, v46));
      if ([v10 device] && objc_msgSend(v10, "device") != a3)
      {
        return 4294954516;
      }
      else
      {
        int v11 = (void *)[MEMORY[0x1E4F1CA48] array];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        uint64_t v12 = [a2 countByEnumeratingWithState:&v64 objects:v74 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v65 != v14) {
                objc_enumerationMutation(a2);
              }
              uint64_t v16 = *(void *)(*((void *)&v64 + 1) + 8 * i);
              int v17 = objc_msgSend((id)objc_msgSend(v10, "controlledStreams"), "containsObject:", v16);
              uint64_t v18 = v11;
              if (v17)
              {
                objc_msgSend((id)objc_msgSend(v10, "streamsToKeepControlled"), "removeObject:", v16);
                uint64_t v18 = (void *)[v10 streamsInUse];
              }
              [v18 addObject:v16];
            }
            uint64_t v13 = [a2 countByEnumeratingWithState:&v64 objects:v74 count:16];
          }
          while (v13);
        }
        uint64_t result = [v11 count];
        if (result)
        {
          uint64_t result = [a3 requestControlOfStreams:v11 clientPriority:a4];
          if (result == -12681)
          {
            unsigned int v69 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v24 = v69;
            if (os_log_type_enabled(v23, type)) {
              unsigned int v25 = v24;
            }
            else {
              unsigned int v25 = v24 & 0xFFFFFFFE;
            }
            if (v25)
            {
              int v75 = 136315394;
              uint64_t v76 = "-[BWFigCaptureDeviceVendor _requestControlOfStreams:device:deviceClientPriority:]";
              __int16 v77 = 2112;
              v78 = v11;
              LODWORD(v47) = 22;
              uint64_t v44 = &v75;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            uint64_t v26 = [v11 countByEnumeratingWithState:&v56 objects:v72 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v57;
              do
              {
                for (uint64_t j = 0; j != v27; ++j)
                {
                  if (*(void *)v57 != v28) {
                    objc_enumerationMutation(v11);
                  }
                  uint64_t v30 = *(void *)(*((void *)&v56 + 1) + 8 * j);
                  if ((objc_msgSend((id)objc_msgSend(v10, "streamsControlledByOtherClients", v44, v47), "containsObject:", v30) & 1) == 0)
                  {
                    objc_msgSend((id)objc_msgSend(v10, "streamsControlledByOtherClients"), "addObject:", v30);
                    -[BWFigCaptureDeviceVendor _registerForStreamNotifications:](v8);
                  }
                }
                uint64_t v27 = [v11 countByEnumeratingWithState:&v56 objects:v72 count:16];
              }
              while (v27);
            }
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            uint64_t v31 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v71, 16, v44);
            if (v31)
            {
              uint64_t v32 = v31;
              uint64_t v33 = *(void *)v53;
              while (2)
              {
                for (uint64_t k = 0; k != v32; ++k)
                {
                  if (*(void *)v53 != v33) {
                    objc_enumerationMutation(v11);
                  }
                  if (!objc_msgSend((id)objc_msgSend(v10, "portTypesAllowingStreamControlLoss"), "containsObject:", objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * k), "portType")))
                  {
                    id v35 = (id)[*(id *)(v8 + 40) copy];
                    long long v48 = 0u;
                    long long v49 = 0u;
                    long long v50 = 0u;
                    long long v51 = 0u;
                    uint64_t v36 = [v35 countByEnumeratingWithState:&v48 objects:v70 count:16];
                    if (v36)
                    {
                      uint64_t v37 = v36;
                      uint64_t v38 = *(void *)v49;
                      do
                      {
                        for (uint64_t m = 0; m != v37; ++m)
                        {
                          if (*(void *)v49 != v38) {
                            objc_enumerationMutation(v35);
                          }
                          id v40 = *(void **)(*((void *)&v48 + 1) + 8 * m);
                          -[BWFigCaptureDeviceVendor _removeActiveDeviceClient:moveToVictimizedList:](v8, v40, 1);
                          uint64_t v41 = *(NSObject **)(v8 + 80);
                          block[0] = MEMORY[0x1E4F143A8];
                          block[1] = 3221225472;
                          block[2] = __123__BWFigCaptureDeviceVendor__deviceAvailabilityChangedForClient_available_postNotification_reason_canShareWithAVFlashlight___block_invoke;
                          block[3] = &unk_1E5C29150;
                          __int16 v81 = 1;
                          int v80 = 0;
                          char v82 = 0;
                          block[4] = v40;
                          dispatch_async(v41, block);
                        }
                        uint64_t v37 = [v35 countByEnumeratingWithState:&v48 objects:v70 count:16];
                      }
                      while (v37);
                    }
                    return 4294954615;
                  }
                }
                uint64_t v32 = [v11 countByEnumeratingWithState:&v52 objects:v71 count:16];
                uint64_t result = 4294954615;
                if (v32) {
                  continue;
                }
                break;
              }
            }
            else
            {
              return 4294954615;
            }
          }
          else if (!result)
          {
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            uint64_t result = [v11 countByEnumeratingWithState:&v60 objects:v73 count:16];
            if (result)
            {
              uint64_t v19 = result;
              uint64_t v20 = *(void *)v61;
              do
              {
                uint64_t v21 = 0;
                do
                {
                  if (*(void *)v61 != v20) {
                    objc_enumerationMutation(v11);
                  }
                  int v22 = *(void **)(*((void *)&v60 + 1) + 8 * v21);
                  [v22 flushPropertyCache];
                  objc_msgSend((id)objc_msgSend(v10, "streamsInUse"), "addObject:", v22);
                  if ((objc_msgSend((id)objc_msgSend(v10, "controlledStreams"), "containsObject:", v22) & 1) == 0)
                  {
                    objc_msgSend((id)objc_msgSend(v10, "controlledStreams"), "addObject:", v22);
                    -[BWFigCaptureDeviceVendor _registerForStreamNotifications:](v8);
                  }
                  ++v21;
                }
                while (v19 != v21);
                uint64_t result = [v11 countByEnumeratingWithState:&v60 objects:v73 count:16];
                uint64_t v19 = result;
              }
              while (result);
            }
          }
        }
      }
    }
  }
  return result;
}

- (uint64_t)_registerForStreamNotifications:(uint64_t)result
{
  if (result)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    return CMNotificationCenterAddListener();
  }
  return result;
}

uint64_t __98__BWFigCaptureDeviceVendor_copyDeviceWithID_forClient_informClientWhenDeviceAvailableAgain_error___block_invoke(uint64_t a1)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 device];
  int v5 = [v3 deviceUsageCount];
  uint64_t v6 = [v3 deviceCloseTimer];
  uint64_t v7 = -[BWFigCaptureDeviceVendor _registeredDeviceClientWithID:](*(void **)(a1 + 32), *(_DWORD *)(a1 + 88));
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v61 = (uint64_t)v3;
    long long v57 = v6;
    int v59 = v5;
    uint64_t v58 = v4;
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 40) count];
    int v10 = -[BWFigCaptureDeviceVendor _deviceCanBeSharedWithClient:](*(void *)(a1 + 32), v8);
    long long v60 = v8;
    int v11 = [*(id *)(*(void *)(a1 + 32) + 40) containsObject:v8];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v76 objects:v83 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      int v15 = 0;
      uint64_t v16 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v77 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          if (v15 <= (int)[v18 clientPriority]) {
            int v15 = [v18 clientPriority];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v76 objects:v83 count:16];
      }
      while (v14);
    }
    else
    {
      int v15 = 0;
    }
    int v19 = [v60 canStealFromClientsWithSamePriority];
    int v20 = [v60 clientPriority];
    if (v19) {
      BOOL v21 = v20 >= v15;
    }
    else {
      BOOL v21 = v20 > v15;
    }
    if (v9) {
      int v22 = v11;
    }
    else {
      int v22 = 1;
    }
    if ((v22 | v10 | v21) == 1)
    {
      int v5 = v59;
      if (v61
        || (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:](*(void *)(a1 + 32), *(__CFString **)(a1 + 40), 0, [v60 pid]), (uint64_t v61 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(void *)(a1 + 40))) != 0))
      {
        if (!v9)
        {
          uint64_t v4 = v58;
          uint64_t v3 = (void *)v61;
          if (!dword_1EB4C5450) {
            goto LABEL_38;
          }
          goto LABEL_27;
        }
        if (v10)
        {
          uint64_t v4 = v58;
          uint64_t v3 = (void *)v61;
          if (!dword_1EB4C5450)
          {
LABEL_38:
            objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "addObject:", v60, v55, v56);
            goto LABEL_39;
          }
LABEL_27:
          int v75 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          goto LABEL_38;
        }
        if ([*(id *)(*(void *)(a1 + 32) + 40) containsObject:v60])
        {
          uint64_t v4 = v58;
          uint64_t v3 = (void *)v61;
          if (dword_1EB4C5450)
          {
            int v75 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            uint64_t v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
            uint64_t v41 = v57;
            fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_40:
            -[BWFigCaptureDeviceVendor _relinquishControlOfStreamsForDevice:](*(void *)(a1 + 32), *(void *)(a1 + 40));
            *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = (id)[v3 device];
            objc_msgSend(v3, "setDeviceUsageCount:", objc_msgSend(v3, "deviceUsageCount") + 1);
            uint64_t v27 = objc_msgSend((id)objc_msgSend(v3, "device"), "supportedProperties");
            uint64_t v28 = *MEMORY[0x1E4F52D78];
            if ([v27 objectForKeyedSubscript:*MEMORY[0x1E4F52D78]])
            {
              int v29 = (void *)[v3 device];
              [v29 setProperty:v28 value:MEMORY[0x1E4F1CC38]];
            }
            if (v41) {
              dispatch_source_cancel(v41);
            }
            goto LABEL_49;
          }
LABEL_39:
          uint64_t v41 = v57;
          goto LABEL_40;
        }
        uint64_t v3 = (void *)v61;
        if (!v21)
        {
          uint64_t v4 = v58;
          goto LABEL_39;
        }
        if (dword_1EB4C5450)
        {
          int v75 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        uint64_t v42 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v55, v56);
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        uint64_t v43 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) allKeys];
        uint64_t v44 = [v43 countByEnumeratingWithState:&v70 objects:v82 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v71;
          do
          {
            for (uint64_t j = 0; j != v45; ++j)
            {
              if (*(void *)v71 != v46) {
                objc_enumerationMutation(v43);
              }
              long long v48 = *(void **)(*((void *)&v70 + 1) + 8 * j);
              long long v49 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v48];
              if ((int)[v49 deviceUsageCount] >= 1
                && ([v49 inUseForPublishing] & 1) == 0
                && ([v49 deviceUsageCount] != 1
                 || ([v49 inUseForVibeMitigation] & 1) == 0))
              {
                -[BWFigCaptureDeviceVendor _invalidateAndReleaseDevice:](*(void *)(a1 + 32), v48);
                [v42 addObject:v48];
              }
            }
            uint64_t v45 = [v43 countByEnumeratingWithState:&v70 objects:v82 count:16];
          }
          while (v45);
        }
        if ([v42 containsObject:*(void *)(a1 + 40)]) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:](*(void *)(a1 + 32), *(__CFString **)(a1 + 40), 0, [v60 pid]);
        }
        uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:*(void *)(*(void *)(a1 + 32) + 40)];
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v50 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        uint64_t v51 = [v50 countByEnumeratingWithState:&v66 objects:v81 count:16];
        uint64_t v41 = v57;
        if (v51)
        {
          uint64_t v52 = v51;
          uint64_t v53 = *(void *)v67;
          do
          {
            for (uint64_t k = 0; k != v52; ++k)
            {
              if (*(void *)v67 != v53) {
                objc_enumerationMutation(v50);
              }
              -[BWFigCaptureDeviceVendor _removeActiveDeviceClient:moveToVictimizedList:](*(void *)(a1 + 32), *(void **)(*((void *)&v66 + 1) + 8 * k), 1);
            }
            uint64_t v52 = [v50 countByEnumeratingWithState:&v66 objects:v81 count:16];
          }
          while (v52);
        }
        if (v3)
        {
          [*(id *)(*(void *)(a1 + 32) + 40) addObject:v60];
          uint64_t v4 = v58;
          goto LABEL_40;
        }
        uint64_t v56 = v1;
        LODWORD(v55) = 0;
        FigDebugAssert3();
      }
      else
      {
        uint64_t v3 = 0;
      }
      uint64_t v4 = v58;
      goto LABEL_49;
    }
    int v5 = v59;
    if (*(unsigned char *)(a1 + 92))
    {
      uint64_t v4 = v58;
      uint64_t v3 = (void *)v61;
      if (dword_1EB4C5450)
      {
        int v75 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        unsigned int v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -12681;
      -[BWFigCaptureDeviceVendor _removeDeviceClient:moveToVictimizedList:](*(void *)(a1 + 32), v60, 1);
    }
    else
    {
      uint64_t v4 = v58;
      uint64_t v3 = (void *)v61;
      if (dword_1EB4C5450)
      {
        int v75 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        unsigned int v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "removeObject:", v60, v55, v56);
    }
  }
  else if (*(_DWORD *)(a1 + 88) < sNextClientID)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -12785;
  }
LABEL_49:
  -[BWFigCaptureDeviceVendor _dumpInventory](*(void *)(a1 + 32));
  uint64_t v31 = [v3 device];
  if (v5 != [v3 deviceUsageCount] || v4 != v31) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "count", v55, v56) != 0;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v33 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t result = [v33 countByEnumeratingWithState:&v62 objects:v80 count:16];
  if (result)
  {
    uint64_t v35 = result;
    uint64_t v36 = *(void *)v63;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v63 != v36) {
          objc_enumerationMutation(v33);
        }
        char v38 = [*(id *)(*((void *)&v62 + 1) + 8 * v37) deviceSharingWithAVFlashlightAllowed];
        uint64_t v39 = *(void *)(*(void *)(a1 + 80) + 8);
        if (*(unsigned char *)(v39 + 24)) {
          char v40 = v38;
        }
        else {
          char v40 = 0;
        }
        *(unsigned char *)(v39 + 24) = v40;
        ++v37;
      }
      while (v35 != v37);
      uint64_t result = [v33 countByEnumeratingWithState:&v62 objects:v80 count:16];
      uint64_t v35 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)_dumpInventory
{
  if (result)
  {
    uint64_t result = _FigIsCurrentDispatchQueue();
    if (!result) {
      return FigDebugAssert3();
    }
  }
  return result;
}

uint64_t __85__BWFigCaptureDeviceVendor_sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction___block_invoke()
{
  uint64_t result = FigSimpleMutexCreate();
  sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction__sharedDeviceVendorLocuint64_t k = result;
  return result;
}

- (BWFigCaptureDeviceVendor)initWithDefaultDeviceCreateFunction:(void *)a3 cmioExtensionDeviceCreateFunction:(void *)a4 cmioDiscoverySession:(id)a5
{
  int v5 = self;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!((unint64_t)a3 | (unint64_t)a4))
  {
    unsigned int v23 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
LABEL_17:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_18:

    return 0;
  }
  v21.receiver = self;
  v21.super_class = (Class)BWFigCaptureDeviceVendor;
  int v5 = [(BWFigCaptureDeviceVendor *)&v21 init];
  if (!v5) {
    return v5;
  }
  v5->_devicesStatesByDeviceID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v5->_deviceCloseTimeoutSeconds = 5.0;
  v5->_registeredDeviceClients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5->_activeDeviceClients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5->_victimizedDeviceClients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v5->_deviceQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.devicevendor", v9);
  v5->_notificationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.devicevendor.notification", 0);
  v5->_cameraPoseMatricesByPortTypeByDeviceID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ((FigCaptureIsRunningInVirtualization() & 1) == 0 && !a3)
  {
    FigDebugAssert3();
    goto LABEL_18;
  }
  v5->_defaultDeviceCreateFunction = a3;
  if (!a4) {
    goto LABEL_8;
  }
  if (!a5)
  {
    unsigned int v23 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v17 = v23;
    if (os_log_type_enabled(v16, type)) {
      unsigned int v18 = v17;
    }
    else {
      unsigned int v18 = v17 & 0xFFFFFFFE;
    }
    if (v18)
    {
      int v24 = 136315138;
      unsigned int v25 = "-[BWFigCaptureDeviceVendor initWithDefaultDeviceCreateFunction:cmioExtensionDeviceCreateFunction:cmioDiscoverySession:]";
      _os_log_send_and_compose_impl();
    }
    goto LABEL_17;
  }
  v5->_cmioDiscoverySession = (CMIOExtensionDiscoverySession *)a5;
  v5->_cmioExtensionDeviceCreateFunction = a4;
  int v10 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:v5 selector:sel__handleCMIOExtensionDevicesChangedNotification_ name:*MEMORY[0x1E4F220D0] object:0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __119__BWFigCaptureDeviceVendor_initWithDefaultDeviceCreateFunction_cmioExtensionDeviceCreateFunction_cmioDiscoverySession___block_invoke;
  v20[3] = &unk_1E5C24430;
  v20[4] = v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)v5, (uint64_t)v20);
LABEL_8:
  v5->_osStateHandle = [[FigCaptureOSStateHandle alloc] initWithTitle:@"BWFigCaptureDeviceVendor" queue:v5->_deviceQueue dataProvider:v5];
  v5->_defaultDeviceCreationHistory = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
  v5->_cmioDeviceCreationHistory = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
  int v11 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
  v5->_deviceDateFormatter = v11;
  [(NSDateFormatter *)v11 setDateFormat:@"yyyy-MM-dd HH:mm:ssZ"];
  v5->_defaultDevicePriorStreamPortTypes = 0;
  uint64_t v12 = [FigCaptureGameModeMonitor alloc];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __119__BWFigCaptureDeviceVendor_initWithDefaultDeviceCreateFunction_cmioExtensionDeviceCreateFunction_cmioDiscoverySession___block_invoke_2;
  v19[3] = &unk_1E5C24430;
  v19[4] = v5;
  v5->_gameModeMonitor = [(FigCaptureGameModeMonitor *)v12 initWithStateChangeHandler:v19];
  v5->_calibrationStatusLock._os_unfair_lock_opaque = 0;
  v5->_BOOL calibrationStatusQueried = FigCaptureCurrentProcessIsCameracaptured() == 0;
  v5->_BOOL rearCameraCalibrationValid = 1;
  if (FigCaptureCurrentProcessIsCameracaptured())
  {
    global_queue = dispatch_get_global_queue(21, 0);
    dispatch_async(global_queue, &__block_literal_global_236_0);
  }
  return v5;
}

- (void)prewarmDefaultVideoDeviceForPID:(int)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__BWFigCaptureDeviceVendor_prewarmDefaultVideoDeviceForPID_completionHandler___block_invoke;
  v4[3] = &unk_1E5C28FC8;
  int v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueue:]((uint64_t)self, (uint64_t)v4);
}

- (void)_performBlockOnDeviceQueue:(uint64_t)a1
{
  if (a1)
  {
    if (a2)
    {
      uint64_t v2 = *(NSObject **)(a1 + 56);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__BWFigCaptureDeviceVendor__performBlockOnDeviceQueue___block_invoke;
      block[3] = &unk_1E5C249F0;
      block[4] = a2;
      dispatch_async(v2, block);
    }
  }
}

void __55__BWFigCaptureDeviceVendor__performBlockOnDeviceQueue___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1A6272C70]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__BWFigCaptureDeviceVendor_prewarmDefaultVideoDeviceForPID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5450)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKeyedSubscript:", 0x1EFA45440, v8, v9);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    [*(id *)(v4 + 24) objectForKeyedSubscript:0x1EFA45440];
    if (dword_1EB4C5450)
    {
      int v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[BWFigCaptureDeviceVendor _resetDeviceCloseTimerForDevice:](*(void *)(a1 + 32), 0x1EFA45440);
  }
  else
  {
    -[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:](v4, @"Default", (uint64_t)"Pre-warm power on", *(_DWORD *)(a1 + 48));
    if ([*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:0x1EFA45440])
    {
      -[BWFigCaptureDeviceVendor _setupDeviceCloseTimerForDevice:](*(void *)(a1 + 32), 0x1EFA45440);
    }
    else
    {
      uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned int *)(a1 + 48));
  }
  return result;
}

- (uint64_t)_logISPStartupTimeToCoreAnalytics
{
  if (result)
  {
    uint64_t v1 = result;
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    uint64_t v2 = objc_alloc_init(BWISPStartupAnalyticsPayload);
    [(BWISPStartupAnalyticsPayload *)v2 setIspStartupTime:*(unsigned int *)(v1 + 112)];
    uint64_t v3 = +[BWCoreAnalyticsReporter sharedInstance];
    return [(BWCoreAnalyticsReporter *)v3 sendEvent:v2];
  }
  return result;
}

- (int)createDeviceTime
{
  return self->_createDeviceTime;
}

- (id)copyDeviceWithID:(id)a3 forClient:(int)a4 informClientWhenDeviceAvailableAgain:(BOOL)a5 error:(int *)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x2020000000;
  int v48 = 0;
  uint64_t v39 = 0;
  char v40 = &v39;
  uint64_t v41 = 0x3052000000;
  uint64_t v42 = __Block_byref_object_copy__26;
  uint64_t v43 = __Block_byref_object_dispose__26;
  uint64_t v44 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3052000000;
  uint64_t v32 = __Block_byref_object_copy__26;
  uint64_t v33 = __Block_byref_object_dispose__26;
  uint64_t v34 = 0;
  uint64_t v34 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __98__BWFigCaptureDeviceVendor_copyDeviceWithID_forClient_informClientWhenDeviceAvailableAgain_error___block_invoke;
  v22[3] = &unk_1E5C29040;
  v22[4] = self;
  v22[5] = a3;
  int v23 = a4;
  BOOL v24 = a5;
  v22[6] = &v45;
  v22[7] = &v29;
  v22[8] = &v39;
  v22[9] = &v35;
  v22[10] = &v25;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v22);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v11 = (void *)v30[5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v49 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:canShareWithAVFlashlight:]((uint64_t)self, *(void *)(*((void *)&v18 + 1) + 8 * i), 0, 0, 0, *((unsigned char *)v26 + 24));
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v49 count:16];
    }
    while (v12);
  }
  [(id)v30[5] removeAllObjects];
  -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:canShareWithAVFlashlight:]((uint64_t)self, 0, 0, *((unsigned char *)v36 + 24), 0, *((unsigned char *)v26 + 24));
  if (!v40[5] && !*((_DWORD *)v46 + 6))
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    *((_DWORD *)v46 + 6) = -12786;
  }
  if (a6) {
    *a6 = *((_DWORD *)v46 + 6);
  }
  uint64_t v16 = (void *)v40[5];
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
  return v16;
}

- (void)_registeredDeviceClientWithID:(void *)result
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v11 = v2;
      LODWORD(v10) = 0;
      FigDebugAssert3();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    int v5 = (void *)v4[4];
    uint64_t result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16, v10, v11);
    if (result)
    {
      id v6 = result;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v8);
          if ([v9 clientID] == a2) {
            return v9;
          }
          uint64_t v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        uint64_t result = (void *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        id v6 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (uint64_t)_relinquishControlOfStreamsForDevice:(uint64_t)result
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v17 = v2;
      LODWORD(v16) = 0;
      FigDebugAssert3();
    }
    int v5 = objc_msgSend(*(id *)(v4 + 24), "objectForKeyedSubscript:", a2, v16, v17);
    if (objc_msgSend((id)objc_msgSend(v5, "controlledStreams"), "count")
      || (uint64_t result = objc_msgSend((id)objc_msgSend(v5, "streamsControlledByOtherClients"), "count")) != 0)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v6 = (void *)[v5 controlledStreams];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v23;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v23 != v9) {
              objc_enumerationMutation(v6);
            }
            -[BWFigCaptureDeviceVendor _unregisterFromStreamNotifications:](v4);
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v8);
      }
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v11 = (void *)[v5 streamsControlledByOtherClients];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            -[BWFigCaptureDeviceVendor _unregisterFromStreamNotifications:](v4);
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v13);
      }
      objc_msgSend((id)objc_msgSend(v5, "device"), "relinquishControlOfStreams:", objc_msgSend(v5, "controlledStreams"));
      objc_msgSend((id)objc_msgSend(v5, "controlledStreams"), "removeAllObjects");
      objc_msgSend((id)objc_msgSend(v5, "streamsControlledByOtherClients"), "removeAllObjects");
      objc_msgSend((id)objc_msgSend(v5, "streamsToKeepControlled"), "removeAllObjects");
      return objc_msgSend((id)objc_msgSend(v5, "streamsInUse"), "removeAllObjects");
    }
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

id __37__BWFigCaptureDeviceVendor_deviceIDs__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "allKeys"));
  uint64_t v3 = v2;
  if (*(void *)(*(void *)(a1 + 32) + 8) && ([v2 containsObject:0x1EFA45440] & 1) == 0) {
    [v3 insertObject:0x1EFA45440 atIndex:0];
  }
  id result = (id)[MEMORY[0x1E4F1C978] arrayWithArray:v3];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __119__BWFigCaptureDeviceVendor_initWithDefaultDeviceCreateFunction_cmioExtensionDeviceCreateFunction_cmioDiscoverySession___block_invoke(uint64_t a1)
{
}

- (NSArray)deviceIDs
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__26;
  uint64_t v9 = __Block_byref_object_dispose__26;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__BWFigCaptureDeviceVendor_deviceIDs__block_invoke;
  v4[3] = &unk_1E5C24F58;
  v4[4] = self;
  v4[5] = &v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v4);
  uint64_t v2 = (NSArray *)(id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_updateCMIOExtensionDevices
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v63 = v1;
      LODWORD(v60) = 0;
      FigDebugAssert3();
    }
    obuint64_t j = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "array", v60, v63);
    long long v72 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v65 = (void *)[MEMORY[0x1E4F1CA48] array];
    id v69 = (id)[MEMORY[0x1E4F1CA48] array];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    uint64_t v74 = a1;
    uint64_t v3 = *(void **)(a1 + 24);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v98 objects:v117 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v99;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v99 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = (void *)[*(id *)(v74 + 24) objectForKeyedSubscript:*(void *)(*((void *)&v98 + 1) + 8 * i)];
          if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "device"), "deviceID"), "isEqualToString:", 0x1EFA45440) & 1) == 0)objc_msgSend(obj, "addObject:", objc_msgSend((id)objc_msgSend(v8, "device"), "deviceID")); {
        }
          }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v98 objects:v117 count:16];
      }
      while (v5);
    }
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    uint64_t v9 = v74;
    uint64_t v10 = (void *)[*(id *)(v74 + 120) devices];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v94 objects:v116 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      char v66 = 0;
      uint64_t v73 = *(void *)v95;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v95 != v73) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v94 + 1) + 8 * j);
          uint64_t v15 = (__CFString *)objc_msgSend((id)objc_msgSend(v14, "deviceID", v61, v64), "UUIDString");
          long long v90 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          uint64_t v16 = (void *)[v14 streams];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v90 objects:v115 count:16];
          if (!v17) {
            goto LABEL_26;
          }
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v91;
LABEL_20:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v91 != v19) {
              objc_enumerationMutation(v16);
            }
            if (![*(id *)(*((void *)&v90 + 1) + 8 * v20) direction]) {
              break;
            }
            if (v18 == ++v20)
            {
              uint64_t v18 = [v16 countByEnumeratingWithState:&v90 objects:v115 count:16];
              if (v18) {
                goto LABEL_20;
              }
LABEL_26:
              if (dword_1EB4C5450)
              {
                unsigned int v89 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                uint64_t v9 = v74;
                goto LABEL_33;
              }
              goto LABEL_34;
            }
          }
          if ([*(id *)(v9 + 24) objectForKeyedSubscript:v15]) {
            goto LABEL_29;
          }
          pid_t v22 = getpid();
          if (!-[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:](v9, v15, 0, v22))
          {
            [v65 addObject:v15];
            char v66 = 1;
LABEL_29:
            [v72 addObject:v15];
            continue;
          }
          unsigned int v89 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          long long v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
LABEL_33:
          fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_34:
          ;
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v94 objects:v116 count:16];
      }
      while (v12);
    }
    else
    {
      char v66 = 0;
    }
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    uint64_t v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v110, 16, v61);
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v85;
      char v27 = v66;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v85 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void *)(*((void *)&v84 + 1) + 8 * k);
          if (([v72 containsObject:v29] & 1) == 0)
          {
            [v69 addObject:v29];
            char v27 = 1;
          }
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v84 objects:v110 count:16];
      }
      while (v25);
    }
    else
    {
      char v27 = v66;
    }
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    uint64_t v30 = v74;
    uint64_t v68 = [v69 countByEnumeratingWithState:&v80 objects:v109 count:16];
    if (v68)
    {
      uint64_t v67 = *(void *)v81;
      do
      {
        for (uint64_t m = 0; m != v68; ++m)
        {
          if (*(void *)v81 != v67) {
            objc_enumerationMutation(v69);
          }
          uint64_t v32 = *(void **)(*((void *)&v80 + 1) + 8 * m);
          int v33 = objc_msgSend((id)objc_msgSend(*(id *)(v30 + 24), "objectForKeyedSubscript:", v32), "deviceUsageCount");
          -[BWFigCaptureDeviceVendor _invalidateAndReleaseDevice:](v30, v32);
          if (v33 >= 1)
          {
            uint64_t v71 = m;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            uint64_t v34 = *(void **)(v30 + 40);
            uint64_t v35 = [v34 countByEnumeratingWithState:&v76 objects:v108 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v77;
              do
              {
                for (uint64_t n = 0; n != v36; ++n)
                {
                  if (*(void *)v77 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  uint64_t v39 = *(void *)(*((void *)&v76 + 1) + 8 * n);
                  if (dword_1EB4C5450)
                  {
                    unsigned int v89 = 0;
                    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                    char v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    unsigned int v41 = v89;
                    if (os_log_type_enabled(v40, type)) {
                      unsigned int v42 = v41;
                    }
                    else {
                      unsigned int v42 = v41 & 0xFFFFFFFE;
                    }
                    if (v42)
                    {
                      int v102 = 136315650;
                      uint64_t v103 = "-[BWFigCaptureDeviceVendor _updateCMIOExtensionDevices]";
                      __int16 v104 = 2112;
                      id v105 = v32;
                      __int16 v106 = 2112;
                      uint64_t v107 = v39;
                      LODWORD(v64) = 32;
                      long long v62 = &v102;
                      _os_log_send_and_compose_impl();
                    }
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                    uint64_t v30 = v74;
                  }
                  uint64_t v43 = *(NSObject **)(v30 + 80);
                  block[0] = MEMORY[0x1E4F143A8];
                  block[1] = 3221225472;
                  block[2] = __123__BWFigCaptureDeviceVendor__deviceAvailabilityChangedForClient_available_postNotification_reason_canShareWithAVFlashlight___block_invoke;
                  block[3] = &unk_1E5C29150;
                  __int16 v113 = 1;
                  int v112 = 3;
                  char v114 = 0;
                  block[4] = v39;
                  dispatch_async(v43, block);
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v76 objects:v108 count:16];
              }
              while (v36);
            }
            objc_msgSend(*(id *)(v30 + 40), "removeAllObjects", v62, v64);
            uint64_t m = v71;
          }
        }
        uint64_t v68 = [v69 countByEnumeratingWithState:&v80 objects:v109 count:16];
      }
      while (v68);
    }
    if (dword_1EB4C5450)
    {
      unsigned int v89 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v45 = v89;
      if (os_log_type_enabled(v44, type)) {
        unsigned int v46 = v45;
      }
      else {
        unsigned int v46 = v45 & 0xFFFFFFFE;
      }
      if (v46)
      {
        int v102 = 136315394;
        uint64_t v103 = "-[BWFigCaptureDeviceVendor _updateCMIOExtensionDevices]";
        __int16 v104 = 2112;
        id v105 = obj;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (dword_1EB4C5450)
      {
        unsigned int v89 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        uint64_t v47 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v48 = v89;
        if (os_log_type_enabled(v47, type)) {
          unsigned int v49 = v48;
        }
        else {
          unsigned int v49 = v48 & 0xFFFFFFFE;
        }
        if (v49)
        {
          int v102 = 136315394;
          uint64_t v103 = "-[BWFigCaptureDeviceVendor _updateCMIOExtensionDevices]";
          __int16 v104 = 2112;
          id v105 = v72;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        if (dword_1EB4C5450)
        {
          unsigned int v89 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v51 = v89;
          if (os_log_type_enabled(v50, type)) {
            unsigned int v52 = v51;
          }
          else {
            unsigned int v52 = v51 & 0xFFFFFFFE;
          }
          if (v52)
          {
            int v102 = 136315394;
            uint64_t v103 = "-[BWFigCaptureDeviceVendor _updateCMIOExtensionDevices]";
            __int16 v104 = 2112;
            id v105 = v65;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          uint64_t v30 = v74;
          if (dword_1EB4C5450)
          {
            unsigned int v89 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            uint64_t v53 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v54 = v89;
            if (os_log_type_enabled(v53, type)) {
              unsigned int v55 = v54;
            }
            else {
              unsigned int v55 = v54 & 0xFFFFFFFE;
            }
            if (v55)
            {
              int v102 = 136315394;
              uint64_t v103 = "-[BWFigCaptureDeviceVendor _updateCMIOExtensionDevices]";
              __int16 v104 = 2112;
              id v105 = v69;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            uint64_t v30 = v74;
          }
        }
      }
    }
    if (v27)
    {
      if (dword_1EB4C5450)
      {
        unsigned int v89 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        uint64_t v56 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v57 = v89;
        if (os_log_type_enabled(v56, type)) {
          unsigned int v58 = v57;
        }
        else {
          unsigned int v58 = v57 & 0xFFFFFFFE;
        }
        if (v58)
        {
          int v102 = 136315138;
          uint64_t v103 = "-[BWFigCaptureDeviceVendor _updateCMIOExtensionDevices]";
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        uint64_t v30 = v74;
      }
      int v59 = *(NSObject **)(v30 + 80);
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __55__BWFigCaptureDeviceVendor__updateCMIOExtensionDevices__block_invoke;
      v75[3] = &unk_1E5C24430;
      v75[4] = v30;
      dispatch_async(v59, v75);
    }
  }
}

+ (BOOL)videoCaptureDeviceFirmwareIsLoaded
{
  uint64_t CameraDriverService = FigCaptureGetCameraDriverService();
  if (!CameraDriverService) {
    return 0;
  }
  uint64_t v3 = CameraDriverService;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(CameraDriverService, @"FirmwareLoaded", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (CFProperty)
  {
    uint64_t v5 = CFProperty;
    BOOL v6 = CFEqual(CFProperty, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0;
    CFRelease(v5);
  }
  else
  {
    BOOL v6 = 0;
  }
  FigCaptureReleaseCameraDriverService(v3);
  return v6;
}

- (BWFigCaptureDeviceVendor)initWithDefaultDeviceCreateFunction:(void *)a3
{
  if (objc_opt_class())
  {
    uint64_t v5 = [MEMORY[0x1E4F22120] sharedInstance];
    BOOL v6 = CMIOExtensionFigCaptureDeviceCreate;
  }
  else
  {
    uint64_t v5 = 0;
    BOOL v6 = 0;
  }
  return [(BWFigCaptureDeviceVendor *)self initWithDefaultDeviceCreateFunction:a3 cmioExtensionDeviceCreateFunction:v6 cmioDiscoverySession:v5];
}

void __119__BWFigCaptureDeviceVendor_initWithDefaultDeviceCreateFunction_cmioExtensionDeviceCreateFunction_cmioDiscoverySession___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __119__BWFigCaptureDeviceVendor_initWithDefaultDeviceCreateFunction_cmioExtensionDeviceCreateFunction_cmioDiscoverySession___block_invoke_3;
  v2[3] = &unk_1E5C24430;
  v2[4] = v1;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:](v1, (uint64_t)v2);
}

void __119__BWFigCaptureDeviceVendor_initWithDefaultDeviceCreateFunction_cmioExtensionDeviceCreateFunction_cmioDiscoverySession___block_invoke_3(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:0x1EFA45440])
  {
    if (-[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:](*(void *)(a1 + 32), @"Default", (uint64_t)"game mode update", 0))
    {
      FigDebugAssert3();
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      uint64_t v2 = *(void *)(a1 + 32);
      -[BWFigCaptureDeviceVendor _invalidateAndReleaseDevice:](v2, @"Default");
    }
  }
}

- (void)_invalidateAndReleaseDevice:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v21 = v2;
      LODWORD(v19) = 0;
      FigDebugAssert3();
    }
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", a2, v19, v21);
    if (v5)
    {
      BOOL v6 = (void *)v5;
      if (dword_1EB4C5450)
      {
        int v29 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      long long v23 = a2;
      int v8 = objc_msgSend(a2, "isEqualToString:", v20, v22);
      uint64_t v9 = 144;
      if (v8) {
        uint64_t v9 = 136;
      }
      uint64_t v10 = a1;
      uint64_t v11 = *(void **)(a1 + v9);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", @"Description"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v6, "device"), "description")))objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v10 + 152), "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date")), @"ReleaseDate"); {
          }
            }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
        }
        while (v13);
      }
      uint64_t v17 = (void *)[v6 device];
      [v17 unregisterForNotification:@"UnrecoverableError" listener:v10];
      [v17 unregisterForNotification:@"DeviceNoLongerAvailable" listener:v10];
      -[BWFigCaptureDeviceVendor _relinquishControlOfStreamsForDevice:](v10, objc_msgSend((id)objc_msgSend(v6, "device"), "deviceID"));
      -[BWFigCaptureDeviceVendor _setLowMemoryModeEnabledOnDevice:](v10, (void *)[v6 device]);
      objc_msgSend((id)objc_msgSend(v6, "device"), "invalidate");
      if ([v6 deviceCloseTimer]) {
        dispatch_source_cancel((dispatch_source_t)[v6 deviceCloseTimer]);
      }
      [*(id *)(v10 + 24) setObject:0 forKeyedSubscript:v23];
      if ([v23 isEqualToString:0x1EFA45440])
      {

        *(void *)(v10 + 88) = 0;
      }
      if ([v23 isEqualToString:0x1EFA45440])
      {
        uint64_t v18 = *(NSObject **)(v10 + 64);
        if (v18)
        {
          dispatch_source_cancel(v18);
          dispatch_release(*(dispatch_object_t *)(v10 + 64));
          *(void *)(v10 + 64) = 0;
        }
      }
    }
    else
    {
      FigDebugAssert3();
    }
  }
}

uint64_t __119__BWFigCaptureDeviceVendor_initWithDefaultDeviceCreateFunction_cmioExtensionDeviceCreateFunction_cmioDiscoverySession___block_invoke_234()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v0 = (void *)FigCaptureDeviceCoreRepairStatusesByKeys();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [v0 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)v10;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(v0);
        }
        int v5 = objc_msgSend((id)objc_msgSend(v0, "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * v4), v7, v8), "intValue");
        if (v5 == 3 || v5 == 2)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t result = [v0 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v2 = result;
    }
    while (result);
  }
  return result;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_devicesStatesByDeviceID allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[BWFigCaptureDeviceVendor invalidateVideoDevice:forPID:](self, "invalidateVideoDevice:forPID:", [*(id *)(*((void *)&v9 + 1) + 8 * v7++) device], 0xFFFFFFFFLL);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)BWFigCaptureDeviceVendor;
  [(BWFigCaptureDeviceVendor *)&v8 dealloc];
}

- (int)registerClientWithPID:(int)a3 clientDescription:(id)a4 clientPriority:(int)a5 canStealFromClientsWithSamePriority:(BOOL)a6 deviceSharingWithOtherClientsAllowed:(BOOL)a7 deviceSharingWithAVFlashlightAllowed:(BOOL)a8 clientIsAVFlashlight:(BOOL)a9 deviceAvailabilityChangedHandler:(id)a10
{
  return -[BWFigCaptureDeviceVendor registerClientWithPID:clientApplicationID:clientDescription:clientPriority:canStealFromClientsWithSamePriority:deviceSharingWithOtherClientsAllowed:deviceSharingWithAVFlashlightAllowed:clientIsAVFlashlight:deviceAvailabilityChangedHandler:](self, "registerClientWithPID:clientApplicationID:clientDescription:clientPriority:canStealFromClientsWithSamePriority:deviceSharingWithOtherClientsAllowed:deviceSharingWithAVFlashlightAllowed:clientIsAVFlashlight:deviceAvailabilityChangedHandler:", *(void *)&a3, @"internal", a4, *(void *)&a5, a6, a7);
}

- (int)registerClientWithPID:(int)a3 clientApplicationID:(id)a4 clientDescription:(id)a5 clientPriority:(int)a6 canStealFromClientsWithSamePriority:(BOOL)a7 deviceSharingWithOtherClientsAllowed:(BOOL)a8 deviceSharingWithAVFlashlightAllowed:(BOOL)a9 clientIsAVFlashlight:(BOOL)a10 deviceAvailabilityChangedHandler:(id)a11
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __267__BWFigCaptureDeviceVendor_registerClientWithPID_clientApplicationID_clientDescription_clientPriority_canStealFromClientsWithSamePriority_deviceSharingWithOtherClientsAllowed_deviceSharingWithAVFlashlightAllowed_clientIsAVFlashlight_deviceAvailabilityChangedHandler___block_invoke;
  v13[3] = &unk_1E5C28FF0;
  BOOL v16 = a8;
  v13[7] = a11;
  v13[8] = &v20;
  v13[4] = self;
  v13[5] = a4;
  v13[6] = a5;
  int v14 = a3;
  int v15 = a6;
  BOOL v17 = a7;
  BOOL v18 = a9;
  BOOL v19 = a10;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v13);
  int v11 = *((_DWORD *)v21 + 6);
  _Block_object_dispose(&v20, 8);
  return v11;
}

void __267__BWFigCaptureDeviceVendor_registerClientWithPID_clientApplicationID_clientDescription_clientPriority_canStealFromClientsWithSamePriority_deviceSharingWithOtherClientsAllowed_deviceSharingWithAVFlashlightAllowed_clientIsAVFlashlight_deviceAvailabilityChangedHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 80))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([*(id *)(*(void *)(a1 + 32) + 40) count]) {
      [v2 addObjectsFromArray:*(void *)(*(void *)(a1 + 32) + 40)];
    }
    if ([*(id *)(*(void *)(a1 + 32) + 32) count]) {
      objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "lastObject"));
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v15 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v7 canShareRegistrationWithClientPID:*(unsigned int *)(a1 + 72) deviceAvailabilityChangedHandler:*(void *)(a1 + 56)])
          {
            *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v7 clientID];
            if (![v7 deviceAvailabilityChangedHandler]) {
              [v7 setDeviceAvailabilityChangedHandler:*(void *)(a1 + 56)];
            }
            goto LABEL_17;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    objc_super v8 = [BWFigCaptureDeviceClient alloc];
    LOWORD(v11) = *(_WORD *)(a1 + 82);
    long long v9 = -[BWFigCaptureDeviceClient initWithPID:clientApplicationID:clientDescription:clientPriority:canStealFromClientsWithSamePriority:deviceSharingWithOtherClientsAllowed:deviceSharingWithAVFlashlightAllowed:clientIsAVFlashlight:deviceAvailabilityChangedHandler:](v8, "initWithPID:clientApplicationID:clientDescription:clientPriority:canStealFromClientsWithSamePriority:deviceSharingWithOtherClientsAllowed:deviceSharingWithAVFlashlightAllowed:clientIsAVFlashlight:deviceAvailabilityChangedHandler:", *(unsigned int *)(a1 + 72), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned int *)(a1 + 76), *(unsigned __int8 *)(a1 + 81), *(unsigned __int8 *)(a1 + 80), v11, *(void *)(a1 + 56));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [(BWFigCaptureDeviceClient *)v9 clientID];
    if (dword_1EB4C5450)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "addObject:", v9, v12, v13);
  }
}

- (int)unregisterClient:(int)a3
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__BWFigCaptureDeviceVendor_unregisterClient___block_invoke;
  v5[3] = &unk_1E5C29018;
  int v6 = a3;
  v5[4] = self;
  v5[5] = &v7;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v5);
  int v3 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __45__BWFigCaptureDeviceVendor_unregisterClient___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5450)
  {
    unsigned int v21 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (*(int *)(a1 + 48) <= 0)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -12780;
    unsigned int v21 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v3 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v26 count:16];
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
          if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "clientID", v14, v15) == *(_DWORD *)(a1 + 48))
          {
            *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -12780;
            unsigned int v21 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v10 = v21;
            if (os_log_type_enabled(v9, type)) {
              unsigned int v11 = v10;
            }
            else {
              unsigned int v11 = v10 & 0xFFFFFFFE;
            }
            if (v11)
            {
              uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 40);
              int v22 = 136315394;
              int v23 = "-[BWFigCaptureDeviceVendor unregisterClient:]_block_invoke";
              __int16 v24 = 2112;
              uint64_t v25 = v12;
              _os_log_send_and_compose_impl();
            }
            return fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v26 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    -[BWFigCaptureDeviceVendor _removeRegisteredDeviceClientWithClientID:](*(void *)(a1 + 32), *(_DWORD *)(a1 + 48));
    return -[BWFigCaptureDeviceVendor _removeVictimizedDeviceClientWithClientID:](*(void *)(a1 + 32), *(_DWORD *)(a1 + 48));
  }
}

- (uint64_t)_removeRegisteredDeviceClientWithClientID:(uint64_t)result
{
  if (result)
  {
    uint64_t v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v7 = v2;
      LODWORD(v6) = 0;
      FigDebugAssert3();
    }
    uint64_t v5 = *(void **)(v4 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__BWFigCaptureDeviceVendor__removeRegisteredDeviceClientWithClientID___block_invoke;
    v8[3] = &__block_descriptor_36_e41_B32__0__BWFigCaptureDeviceClient_8Q16_B24l;
    int v9 = a2;
    uint64_t result = objc_msgSend(v5, "indexOfObjectPassingTest:", v8, v6, v7);
    if (result != 0x7FFFFFFFFFFFFFFFLL) {
      return [*(id *)(v4 + 32) removeObjectAtIndex:result];
    }
  }
  return result;
}

- (uint64_t)_removeVictimizedDeviceClientWithClientID:(uint64_t)result
{
  if (result)
  {
    uint64_t v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v7 = v2;
      LODWORD(v6) = 0;
      FigDebugAssert3();
    }
    uint64_t v5 = *(void **)(v4 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__BWFigCaptureDeviceVendor__removeVictimizedDeviceClientWithClientID___block_invoke;
    v8[3] = &__block_descriptor_36_e41_B32__0__BWFigCaptureDeviceClient_8Q16_B24l;
    int v9 = a2;
    uint64_t result = objc_msgSend(v5, "indexOfObjectPassingTest:", v8, v6, v7);
    if (result != 0x7FFFFFFFFFFFFFFFLL) {
      return [*(id *)(v4 + 48) removeObjectAtIndex:result];
    }
  }
  return result;
}

- (id)copyDeviceForClient:(int)a3 informClientWhenDeviceAvailableAgain:(BOOL)a4 error:(int *)a5
{
  return [(BWFigCaptureDeviceVendor *)self copyDeviceWithID:0x1EFA45440 forClient:*(void *)&a3 informClientWhenDeviceAvailableAgain:a4 error:a5];
}

- (uint64_t)_deviceCanBeSharedWithClient:(uint64_t)result
{
  if (result)
  {
    uint64_t v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v9 = v2;
      LODWORD(v8) = 0;
      FigDebugAssert3();
    }
    if (objc_msgSend(*(id *)(v4 + 40), "count", v8, v9) != 1) {
      return 0;
    }
    uint64_t v5 = (void *)[*(id *)(v4 + 40) firstObject];
    int v6 = [v5 clientIsAVFlashlight];
    if (v6 == [a2 clientIsAVFlashlight])
    {
      return 0;
    }
    else
    {
      int v7 = [v5 deviceSharingWithAVFlashlightAllowed];
      return v7 ^ [a2 deviceSharingWithAVFlashlightAllowed];
    }
  }
  return result;
}

- (uint64_t)_removeDeviceClient:(int)a3 moveToVictimizedList:
{
  if (result)
  {
    uint64_t v6 = result;
    uint64_t result = _FigIsCurrentDispatchQueue();
    if (result)
    {
      if (!a2) {
        return result;
      }
    }
    else
    {
      uint64_t v9 = v3;
      LODWORD(v8) = 0;
      uint64_t result = FigDebugAssert3();
      if (!a2) {
        return result;
      }
    }
    uint64_t result = objc_msgSend(*(id *)(v6 + 32), "removeObject:", a2, v8, v9);
    if (a3)
    {
      uint64_t result = [a2 deviceAvailabilityChangedHandler];
      if (result)
      {
        int v7 = *(void **)(v6 + 48);
        return [v7 addObject:a2];
      }
    }
  }
  return result;
}

- (uint64_t)_removeActiveDeviceClient:(int)a3 moveToVictimizedList:
{
  if (result)
  {
    uint64_t v5 = result;
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    [*(id *)(v5 + 40) removeObject:a2];
    if (dword_1EB4C5450)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (a3)
      {
        if (dword_1EB4C5450)
        {
          int v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
    }
    return -[BWFigCaptureDeviceVendor _removeDeviceClient:moveToVictimizedList:](v5, a2, a3);
  }
  return result;
}

- (void)_deviceAvailabilityChangedForClient:(char)a3 available:(char)a4 postNotification:(int)a5 reason:(char)a6 canShareWithAVFlashlight:
{
  if (a1)
  {
    uint64_t v6 = *(NSObject **)(a1 + 80);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __123__BWFigCaptureDeviceVendor__deviceAvailabilityChangedForClient_available_postNotification_reason_canShareWithAVFlashlight___block_invoke;
    v7[3] = &unk_1E5C29150;
    char v9 = a4;
    char v10 = a3;
    int v8 = a5;
    char v11 = a6;
    v7[4] = a2;
    dispatch_async(v6, v7);
  }
}

- (id)copyDeviceForPublishingWithID:(id)a3 error:(int *)a4
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3052000000;
  char v11 = __Block_byref_object_copy__26;
  uint64_t v12 = __Block_byref_object_dispose__26;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__BWFigCaptureDeviceVendor_copyDeviceForPublishingWithID_error___block_invoke;
  v7[3] = &unk_1E5C27330;
  v7[4] = a3;
  void v7[5] = self;
  v7[6] = &v14;
  v7[7] = &v8;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v7);
  if (a4) {
    *a4 = *((_DWORD *)v15 + 6);
  }
  uint64_t v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
  return v5;
}

uint64_t __64__BWFigCaptureDeviceVendor_copyDeviceForPublishingWithID_error___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5450)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v3 = objc_msgSend(*(id *)(a1[5] + 24), "objectForKeyedSubscript:", a1[4], v12, v14);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    if (!dword_1EB4C5450) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = (__CFString *)a1[4];
    uint64_t v5 = a1[5];
    pid_t v7 = getpid();
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = -[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:](v5, v6, 0, v7);
    uint64_t v4 = (void *)[*(id *)(a1[5] + 24) objectForKeyedSubscript:a1[4]];
    if (!dword_1EB4C5450) {
      goto LABEL_8;
    }
  }
  uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_8:
  *(void *)(*(void *)(a1[7] + 8) + 40) = (id)objc_msgSend(v4, "device", v13, v15);
  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    objc_msgSend(v4, "setDeviceUsageCount:", objc_msgSend(v4, "deviceUsageCount") + 1);
    uint64_t result = [v4 setInUseForPublishing:1];
  }
  else
  {
    char v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    uint64_t result = fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v10 = *(void *)(a1[6] + 8);
    if (!*(_DWORD *)(v10 + 24)) {
      *(_DWORD *)(v10 + 24) = -12786;
    }
  }
  return result;
}

- (id)copyDefaultDeviceForVibeMitigation:(int *)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__26;
  char v11 = __Block_byref_object_dispose__26;
  uint64_t v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__BWFigCaptureDeviceVendor_copyDefaultDeviceForVibeMitigation___block_invoke;
  v6[3] = &unk_1E5C25668;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v6);
  if (a3) {
    *a3 = *((_DWORD *)v14 + 6);
  }
  uint64_t v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v13, 8);
  return v4;
}

uint64_t __63__BWFigCaptureDeviceVendor_copyDefaultDeviceForVibeMitigation___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:0x1EFA45440];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    if (!dword_1EB4C5450) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v4 = a1[4];
    pid_t v5 = getpid();
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = -[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:](v4, @"Default", 0, v5);
    uint64_t v3 = (void *)[*(id *)(a1[4] + 24) objectForKeyedSubscript:0x1EFA45440];
    if (!dword_1EB4C5450) {
      goto LABEL_6;
    }
  }
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_6:
  uint64_t v7 = a1[4];
  objc_msgSend(v3, "device", v12, v13);
  uint64_t result = -[BWFigCaptureDeviceVendor _getGameModeEnabledOnDevice:](v7);
  if (result)
  {
    if (dword_1EB4C5450)
    {
      uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      uint64_t result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = -12782;
  }
  else
  {
    *(void *)(*(void *)(a1[6] + 8) + 40) = (id)[v3 device];
    if (*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      objc_msgSend(v3, "setDeviceUsageCount:", objc_msgSend(v3, "deviceUsageCount") + 1);
      uint64_t result = [v3 setInUseForVibeMitigation:1];
    }
    else
    {
      char v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      uint64_t result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v9 = *(void *)(a1[5] + 8);
    if (!*(_DWORD *)(v9 + 24)) {
      *(_DWORD *)(v9 + 24) = -12786;
    }
  }
  return result;
}

- (uint64_t)_getGameModeEnabledOnDevice:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  uint64_t v2 = *(void **)(a1 + 168);
  if (!v2) {
    return 0;
  }
  return [v2 isGameModeEnabled];
}

- (id)copyStreamFromDevice:(id)a3 position:(int)a4 deviceType:(int)a5 deviceClientPriority:(int)a6 allowsStreamControlLoss:(BOOL)a7 error:(int *)a8
{
  BOOL v9 = a7;
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  v19[1] = *MEMORY[0x1E4F143B8];
  v19[0] = [NSNumber numberWithInt:*(void *)&a4];
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  uint64_t v18 = [NSNumber numberWithInt:v11];
  id v15 = -[BWFigCaptureDeviceVendor copyStreamsFromDevice:positions:deviceTypes:deviceClientPriority:allowsStreamControlLoss:error:](self, "copyStreamsFromDevice:positions:deviceTypes:deviceClientPriority:allowsStreamControlLoss:error:", a3, v14, [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1], v10, v9, a8);
  id v16 = (id)[v15 firstObject];

  return v16;
}

- (id)copyStreamWithoutControlFromDevice:(id)a3 position:(int)a4 deviceType:(int)a5 error:(int *)a6
{
  uint64_t v7 = *(void *)&a5;
  v15[1] = *MEMORY[0x1E4F143B8];
  v15[0] = [NSNumber numberWithInt:*(void *)&a4];
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  uint64_t v14 = [NSNumber numberWithInt:v7];
  id v11 = -[BWFigCaptureDeviceVendor copyStreamsWithoutControlFromDevice:positions:deviceTypes:error:](self, "copyStreamsWithoutControlFromDevice:positions:deviceTypes:error:", a3, v10, [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1], a6);
  id v12 = (id)[v11 firstObject];

  return v12;
}

- (id)copyStreamsWithoutControlFromDevice:(id)a3 positions:(id)a4 deviceTypes:(id)a5 error:(int *)a6
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  id v12 = __Block_byref_object_copy__26;
  uint64_t v13 = __Block_byref_object_dispose__26;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__BWFigCaptureDeviceVendor_copyStreamsWithoutControlFromDevice_positions_deviceTypes_error___block_invoke;
  v8[3] = &unk_1E5C29090;
  void v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  v8[7] = a5;
  v8[8] = &v9;
  v8[9] = a6;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v8);
  uint64_t v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __92__BWFigCaptureDeviceVendor_copyStreamsWithoutControlFromDevice_positions_deviceTypes_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _copyStreamsFromDevice:*(void *)(a1 + 40) positions:*(void *)(a1 + 48) deviceTypes:*(void *)(a1 + 56) requestControl:0 deviceClientPriority:1 allowsStreamControlLoss:0 error:*(void *)(a1 + 72)];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
  return result;
}

- (id)copyStreamsWithUniqueIDs:(id)a3 forDevice:(id)a4 deviceClientPriority:(int)a5 error:(int *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  if (!a4)
  {
    int v22 = -12780;
    goto LABEL_25;
  }
  __int16 v24 = self;
  unsigned int v25 = a5;
  long long v26 = a6;
  obuint64_t j = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v11 = [a3 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v16 = (void *)[a4 streams];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v30;
          while (2)
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v30 != v19) {
                objc_enumerationMutation(v16);
              }
              unsigned int v21 = *(void **)(*((void *)&v29 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v21, "uniqueID"), "isEqualToString:", v15))
              {
                [v28 addObject:v21];
                goto LABEL_17;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }
LABEL_17:
        ;
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v12);
  }
  int v22 = [(BWFigCaptureDeviceVendor *)v24 requestControlOfStreams:v28 device:a4 deviceClientPriority:v25];
  if (v22)
  {
    FigDebugAssert3();
    a6 = v26;
LABEL_25:

    uint64_t v28 = 0;
    if (!a6) {
      return v28;
    }
    goto LABEL_21;
  }
  a6 = v26;
  if (v26) {
LABEL_21:
  }
    *a6 = v22;
  return v28;
}

- (void)takeBackDevice:(id)a3 forClient:(int)a4 informClientWhenDeviceAvailableAgain:(BOOL)a5 prefersDeviceInvalidatedImmediately:(BOOL)a6
{
  if (a3)
  {
    uint64_t v24 = 0;
    unsigned int v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3052000000;
    unsigned int v21 = __Block_byref_object_copy__26;
    int v22 = __Block_byref_object_dispose__26;
    uint64_t v23 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __126__BWFigCaptureDeviceVendor_takeBackDevice_forClient_informClientWhenDeviceAvailableAgain_prefersDeviceInvalidatedImmediately___block_invoke;
    v10[3] = &unk_1E5C290B8;
    int v11 = a4;
    v10[4] = a3;
    v10[5] = self;
    BOOL v12 = a6;
    v10[6] = &v14;
    v10[7] = &v18;
    BOOL v13 = a5;
    v10[8] = &v24;
    -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v10);
    uint64_t v7 = v19;
    if (!v15[3])
    {
      uint64_t v8 = v19[5];
      int v9 = *((unsigned __int8 *)v25 + 24);
      if (v8)
      {
LABEL_6:
        -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:canShareWithAVFlashlight:]((uint64_t)self, v8, 1, v9 != 0, 0, 0);
        uint64_t v7 = v19;
        goto LABEL_7;
      }
      if (*((unsigned char *)v25 + 24))
      {
        int v9 = 1;
        goto LABEL_6;
      }
    }
LABEL_7:

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
}

void __126__BWFigCaptureDeviceVendor_takeBackDevice_forClient_informClientWhenDeviceAvailableAgain_prefersDeviceInvalidatedImmediately___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5450)
  {
    unsigned int v42 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 32), "deviceID", v31, v34));
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 != [v3 device])
  {
    [*(id *)(a1 + 32) invalidate];
    return;
  }
  BOOL v5 = (-[BWFigCaptureDeviceVendor _setLowMemoryModeEnabledOnDevice:](*(void *)(a1 + 40), *(void **)(a1 + 32)) & 1) != 0
    || *(unsigned char *)(a1 + 76) != 0;
  objc_msgSend(v3, "setDeviceUsageCount:", objc_msgSend(v3, "deviceUsageCount") - 1);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (int)[v3 deviceUsageCount];
  if (dword_1EB4C5450)
  {
    unsigned int v42 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v7 == 1)
  {
    if ([*(id *)(*(void *)(a1 + 40) + 40) count] == 2)
    {
      uint64_t v10 = -[BWFigCaptureDeviceVendor _activeDeviceClientWithClientID:](*(void *)(a1 + 40), *(_DWORD *)(a1 + 72));
      -[BWFigCaptureDeviceVendor _removeActiveDeviceClient:moveToVictimizedList:](*(void *)(a1 + 40), v10, *(unsigned __int8 *)(a1 + 77));
      return;
    }
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  else if (!v7)
  {
    int v8 = [v3 inUseForPublishing];
    if (v8 && dword_1EB4C5450)
    {
      unsigned int v42 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      int v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    int v13 = objc_msgSend(v3, "inUseForVibeMitigation", v32, v35);
    if (v13 && dword_1EB4C5450)
    {
      unsigned int v42 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v3, "setInUseForPublishing:", 0, v33, v36);
    [v3 setInUseForVibeMitigation:0];
    if ([*(id *)(*(void *)(a1 + 40) + 40) count] == 1) {
      int v15 = v13;
    }
    else {
      int v15 = 1;
    }
    if ((v8 | v15))
    {
      if (v5 && ![*(id *)(*(void *)(a1 + 40) + 48) count]) {
        -[BWFigCaptureDeviceVendor _invalidateAndReleaseDevice:](*(void *)(a1 + 40), (void *)[*(id *)(a1 + 32) deviceID]);
      }
      else {
        -[BWFigCaptureDeviceVendor _setupDeviceCloseTimerForDevice:](*(void *)(a1 + 40), [*(id *)(a1 + 32) deviceID]);
      }
      return;
    }
    uint64_t v16 = objc_msgSend((id)objc_msgSend(v3, "device"), "supportedProperties");
    uint64_t v17 = *MEMORY[0x1E4F52D78];
    if ([v16 objectForKeyedSubscript:*MEMORY[0x1E4F52D78]])
    {
      uint64_t v18 = (void *)[v3 device];
      [v18 setProperty:v17 value:MEMORY[0x1E4F1CC28]];
    }
    if (objc_msgSend((id)objc_msgSend(v3, "streamsRequiringControlControlledByOtherClients"), "count"))
    {
      if (!dword_1EB4C5450) {
        return;
      }
      unsigned int v42 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      goto LABEL_58;
    }
    -[BWFigCaptureDeviceVendor _relinquishControlOfStreamsForDevice:](*(void *)(a1 + 40), [*(id *)(a1 + 32) deviceID]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v20 = *(void **)(*(void *)(a1 + 40) + 24);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      char v23 = 0;
      uint64_t v24 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v38 != v24) {
            objc_enumerationMutation(v20);
          }
          v23 |= (int)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "objectForKeyedSubscript:", *(void *)(*((void *)&v37 + 1) + 8 * i)), "deviceUsageCount") > 0;
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v22);
    }
    else
    {
      char v23 = 0;
    }
    if (v5 && ![*(id *)(*(void *)(a1 + 40) + 48) count])
    {
      -[BWFigCaptureDeviceVendor _invalidateAndReleaseDevice:](*(void *)(a1 + 40), (void *)[*(id *)(a1 + 32) deviceID]);
      if (v23) {
        goto LABEL_52;
      }
    }
    else
    {
      -[BWFigCaptureDeviceVendor _setupDeviceCloseTimerForDevice:](*(void *)(a1 + 40), [*(id *)(a1 + 32) deviceID]);
      if (v23)
      {
LABEL_52:
        if (!dword_1EB4C5450) {
          return;
        }
        unsigned int v42 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        uint64_t v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v27 = v42;
        if (os_log_type_enabled(v26, type)) {
          unsigned int v28 = v27;
        }
        else {
          unsigned int v28 = v27 & 0xFFFFFFFE;
        }
        if (v28)
        {
          int v29 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "firstObject"), "clientID");
          int v44 = 136315394;
          unsigned int v45 = "-[BWFigCaptureDeviceVendor takeBackDevice:forClient:informClientWhenDeviceAvailableAgain:prefersDeviceIn"
                "validatedImmediately:]_block_invoke";
          __int16 v46 = 1024;
          int v47 = v29;
          _os_log_send_and_compose_impl();
        }
LABEL_58:
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        return;
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = -[BWFigCaptureDeviceVendor _popLatestVictimizedDeviceClient](*(void *)(a1 + 40));
    long long v30 = -[BWFigCaptureDeviceVendor _activeDeviceClientWithClientID:](*(void *)(a1 + 40), *(_DWORD *)(a1 + 72));
    -[BWFigCaptureDeviceVendor _removeActiveDeviceClient:moveToVictimizedList:](*(void *)(a1 + 40), v30, *(unsigned __int8 *)(a1 + 77));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    return;
  }
  if (v7 >= 1 && dword_1EB4C5450 != 0)
  {
    unsigned int v42 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    BOOL v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    goto LABEL_58;
  }
}

- (uint64_t)_setLowMemoryModeEnabledOnDevice:(uint64_t)a1
{
  uint64_t v3 = a1;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v9 = v2;
      LODWORD(v8) = 0;
      FigDebugAssert3();
    }
    BOOL v5 = *(void **)(v3 + 168);
    if (v5)
    {
      uint64_t v3 = [v5 isGameModeEnabled];
      if (dword_1EB4C5450)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(a2, "setPropertyIfSupported:value:", *MEMORY[0x1E4F52D80], objc_msgSend(NSNumber, "numberWithBool:", v3, v8, v9));
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (id)_popLatestVictimizedDeviceClient
{
  if (!a1) {
    return 0;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v6 = v1;
    LODWORD(v5) = 0;
    FigDebugAssert3();
  }
  if (!objc_msgSend(*(id *)(a1 + 48), "count", v5, v6)) {
    return 0;
  }
  id v3 = (id)[*(id *)(a1 + 48) lastObject];
  [*(id *)(a1 + 48) removeLastObject];
  return v3;
}

- (void)_activeDeviceClientWithClientID:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v13 = v2;
    LODWORD(v12) = 0;
    FigDebugAssert3();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16, v12, v13);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v15;
LABEL_6:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v15 != v8) {
      objc_enumerationMutation(v5);
    }
    uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
    if ([v10 clientID] == a2) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        goto LABEL_6;
      }
      return 0;
    }
  }
}

- (BOOL)streamsInUseForDevice:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if (a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__BWFigCaptureDeviceVendor_streamsInUseForDevice___block_invoke;
    v5[3] = &unk_1E5C25120;
    v5[4] = self;
    v5[5] = a3;
    void v5[6] = &v6;
    -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v5);
    BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__50__BWFigCaptureDeviceVendor_streamsInUseForDevice___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "deviceID"));
  if (result)
  {
    BOOL v3 = result;
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t result = (void *)[result device];
    if (v4 == result)
    {
      uint64_t result = objc_msgSend((id)objc_msgSend(v3, "streamsInUse"), "count");
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result != 0;
    }
  }
  return result;
}

- (void)invalidateVideoDevice:(id)a3 forPID:(int)a4
{
  if (a3)
  {
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3052000000;
    uint64_t v10 = __Block_byref_object_copy__26;
    int v11 = __Block_byref_object_dispose__26;
    uint64_t v12 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__BWFigCaptureDeviceVendor_invalidateVideoDevice_forPID___block_invoke;
    v5[3] = &unk_1E5C290E0;
    int v6 = a4;
    v5[4] = a3;
    v5[5] = self;
    void v5[6] = &v7;
    void v5[7] = &v13;
    -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v5);
    -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:canShareWithAVFlashlight:]((uint64_t)self, v8[5], 1, *((unsigned char *)v14 + 24), 0, 0);

    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __57__BWFigCaptureDeviceVendor_invalidateVideoDevice_forPID___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5450)
  {
    int v19 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  BOOL v3 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 32), "deviceID", v12, v13));
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 == [v3 device])
  {
    objc_msgSend(v3, "setDeviceUsageCount:", objc_msgSend(v3, "deviceUsageCount") - 1);
    [v3 deviceUsageCount];
    -[BWFigCaptureDeviceVendor _invalidateAndReleaseDevice:](*(void *)(a1 + 40), (void *)[*(id *)(a1 + 32) deviceID]);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = -[BWFigCaptureDeviceVendor _popLatestVictimizedDeviceClient](*(void *)(a1 + 40));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 40);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
LABEL_6:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        if ([v10 pid] == *(_DWORD *)(a1 + 64)) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
          if (v7) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      uint64_t v10 = 0;
    }
    -[BWFigCaptureDeviceVendor _removeActiveDeviceClient:moveToVictimizedList:](*(void *)(a1 + 40), v10, 0);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  return -[BWFigCaptureDeviceVendor _dumpInventory](*(void *)(a1 + 40));
}

- (int)keepControlOfStreamsWithPositions:(id)a3 deviceTypes:(id)a4 forDevice:(id)a5
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__BWFigCaptureDeviceVendor_keepControlOfStreamsWithPositions_deviceTypes_forDevice___block_invoke;
  v7[3] = &unk_1E5C262C8;
  v7[4] = self;
  void v7[5] = a5;
  v7[6] = a3;
  v7[7] = a4;
  void v7[8] = &v8;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v7);
  int v5 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __84__BWFigCaptureDeviceVendor_keepControlOfStreamsWithPositions_deviceTypes_forDevice___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "deviceID"));
  if (dword_1EB4C5450)
  {
    int v18 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (*(void *)(a1 + 40)
    && (uint64_t v4 = [*(id *)(a1 + 48) count], v4 == objc_msgSend(*(id *)(a1 + 56), "count")))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5 == [v2 device])
    {
      uint64_t v6 = (void *)[*(id *)(a1 + 32) _copyStreamsFromDevice:*(void *)(a1 + 40) positions:*(void *)(a1 + 48) deviceTypes:*(void *)(a1 + 56) requestControl:0 deviceClientPriority:1 allowsStreamControlLoss:0 error:*(void *)(*(void *)(a1 + 64) + 8) + 24];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        FigDebugAssert3();
      }
      else
      {
        long long v15 = 0u;
        long long v16 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        uint64_t v7 = (void *)[v2 controlledStreams];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v14;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v14 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
              if ([v6 containsObject:v12]
                && (objc_msgSend((id)objc_msgSend(v2, "streamsToKeepControlled"), "containsObject:", v12) & 1) == 0)
              {
                objc_msgSend((id)objc_msgSend(v2, "streamsToKeepControlled"), "addObject:", v12);
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
          }
          while (v9);
        }
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = -12780;
  }
}

- (void)takeBackStreams:(id)a3 device:(id)a4 totalStreamingDuration:(unsigned int)a5
{
  if (a4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __74__BWFigCaptureDeviceVendor_takeBackStreams_device_totalStreamingDuration___block_invoke;
    v5[3] = &unk_1E5C29108;
    v5[4] = a3;
    v5[5] = a4;
    void v5[6] = self;
    unsigned int v6 = a5;
    -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v5);
  }
}

uint64_t __74__BWFigCaptureDeviceVendor_takeBackStreams_device_totalStreamingDuration___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5450)
  {
    int v19 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  BOOL v3 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 24), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "deviceID", v12, v13));
  uint64_t result = [v3 device];
  if (result == *(void *)(a1 + 40))
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    unsigned int v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_msgSend((id)objc_msgSend(v3, "streamsInUse"), "removeObject:", v11);
          if (objc_msgSend((id)objc_msgSend(v3, "portTypesToCheckForToFAFEstimator"), "containsObject:", objc_msgSend(v11, "portType")))-[BWFigCaptureDeviceVendor _updateTofAFEstimatorResultsForStream:totalStreamingDuration:](*(void *)(a1 + 48), v11, *(unsigned int *)(a1 + 56)); {
          if (objc_msgSend((id)objc_msgSend(v3, "portTypesToCheckForAFDriverShortStatistics"), "containsObject:", objc_msgSend(v11, "portType")))-[BWFigCaptureDeviceVendor _updateAFDriverShortStatisticsForStream:](*(void *)(a1 + 48), v11);
          }
          if (objc_msgSend((id)objc_msgSend(v3, "portTypesAllowingStreamControlLoss"), "containsObject:", objc_msgSend(v11, "portType")))
          {
            -[BWFigCaptureDeviceVendor _unregisterFromStreamNotifications:](*(void *)(a1 + 48));
            objc_msgSend((id)objc_msgSend(v3, "portTypesAllowingStreamControlLoss"), "removeObject:", objc_msgSend(v11, "portType"));
            if (objc_msgSend((id)objc_msgSend(v3, "streamsControlledByOtherClients"), "containsObject:", v11))objc_msgSend((id)objc_msgSend(v3, "streamsControlledByOtherClients"), "removeObject:", v11); {
          }
            }
          if (objc_msgSend((id)objc_msgSend(v3, "controlledStreams"), "containsObject:", v11)
            && (objc_msgSend((id)objc_msgSend(v3, "streamsToKeepControlled"), "containsObject:", v11) & 1) == 0)
          {
            -[BWFigCaptureDeviceVendor _unregisterFromStreamNotifications:](*(void *)(a1 + 48));
            objc_msgSend((id)objc_msgSend(v3, "controlledStreams"), "removeObject:", v11);
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v8);
    }
    uint64_t result = [v5 count];
    if (result) {
      return [*(id *)(a1 + 40) relinquishControlOfStreams:v5];
    }
  }
  return result;
}

- (uint64_t)_updateTofAFEstimatorResultsForStream:(uint64_t)a3 totalStreamingDuration:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v6 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v16 = v3;
      LODWORD(v15) = 0;
      FigDebugAssert3();
    }
    uint64_t v7 = -[BWFigCaptureDeviceVendor _deviceStateForDeviceWithStream:](v6, (uint64_t)a2);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t result = [a2 getProperty:*MEMORY[0x1E4F54C58] error:0];
      if (result)
      {
        objc_msgSend((id)objc_msgSend(v8, "tofAFEstimatorResultsByPortType"), "setObject:forKeyedSubscript:", result, objc_msgSend(a2, "portType"));
        objc_msgSend((id)objc_msgSend(v8, "tofAFEstimatorResultsStreamingTimeByPortType"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", a3), objc_msgSend(a2, "portType"));
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v9 = *(void **)(v6 + 40);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v18;
LABEL_8:
          uint64_t v13 = 0;
          while (1)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
            if (!objc_msgSend(v14, "clientIsAVFlashlight", v15, v16)) {
              break;
            }
            if (v11 == ++v13)
            {
              uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
              if (v11) {
                goto LABEL_8;
              }
              return objc_msgSend((id)objc_msgSend(v8, "tofAFEstimatorClientApplicationIDByPortType"), "setObject:forKeyedSubscript:", objc_msgSend(v14, "applicationID", v15), objc_msgSend(a2, "portType"));
            }
          }
        }
        else
        {
          long long v14 = 0;
        }
        return objc_msgSend((id)objc_msgSend(v8, "tofAFEstimatorClientApplicationIDByPortType"), "setObject:forKeyedSubscript:", objc_msgSend(v14, "applicationID", v15), objc_msgSend(a2, "portType"));
      }
    }
    else
    {
      return FigDebugAssert3();
    }
  }
  return result;
}

- (uint64_t)_updateAFDriverShortStatisticsForStream:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    uint64_t v4 = -[BWFigCaptureDeviceVendor _deviceStateForDeviceWithStream:](v3, (uint64_t)a2);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t result = [a2 getProperty:*MEMORY[0x1E4F547C0] error:0];
      if (result)
      {
        uint64_t v6 = result;
        uint64_t v7 = (void *)[v5 afDriverShortStatisticsByPortType];
        uint64_t v8 = [a2 portType];
        return [v7 setObject:v6 forKeyedSubscript:v8];
      }
    }
    else
    {
      return FigDebugAssert3();
    }
  }
  return result;
}

- (uint64_t)_unregisterFromStreamNotifications:(uint64_t)result
{
  if (result)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    return CMNotificationCenterRemoveListener();
  }
  return result;
}

- (void)shutDownSystemPressuredDevice:(id)a3
{
  if (a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __58__BWFigCaptureDeviceVendor_shutDownSystemPressuredDevice___block_invoke;
    v3[3] = &unk_1E5C24458;
    v3[4] = self;
    v3[5] = a3;
    -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v3);
  }
}

uint64_t __58__BWFigCaptureDeviceVendor_shutDownSystemPressuredDevice___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "deviceID"));
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 == [v2 device])
  {
    [v2 setShutDownDueToSystemPressure:1];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:canShareWithAVFlashlight:](*(void *)(a1 + 32), *(void *)(*((void *)&v10 + 1) + 8 * i), 0, 1, 1, 0);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  return -[BWFigCaptureDeviceVendor _dumpInventory](*(void *)(a1 + 32));
}

- (void)resumeSystemPressuredDevice
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__BWFigCaptureDeviceVendor_resumeSystemPressuredDevice__block_invoke;
  v2[3] = &unk_1E5C24430;
  v2[4] = self;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v2);
}

uint64_t __55__BWFigCaptureDeviceVendor_resumeSystemPressuredDevice__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 shutDownDueToSystemPressure])
        {
          [v7 setShutDownDueToSystemPressure:0];
          if (![*(id *)(*(void *)(a1 + 32) + 40) count])
          {
            id v8 = -[BWFigCaptureDeviceVendor _popLatestVictimizedDeviceClient](*(void *)(a1 + 32));
            -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:canShareWithAVFlashlight:](*(void *)(a1 + 32), (uint64_t)v8, 1, 1, 1, 0);
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  return -[BWFigCaptureDeviceVendor _dumpInventory](*(void *)(a1 + 32));
}

- (float)structuredLightProjectorStandbyTemperatureWithError:(int *)a3
{
  uint64_t v11 = 0;
  long long v12 = (float *)&v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__BWFigCaptureDeviceVendor_structuredLightProjectorStandbyTemperatureWithError___block_invoke;
  v6[3] = &unk_1E5C25668;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = &v11;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v6);
  if (a3) {
    *a3 = *((_DWORD *)v8 + 6);
  }
  float v4 = v12[6];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

void __80__BWFigCaptureDeviceVendor_structuredLightProjectorStandbyTemperatureWithError___block_invoke(uint64_t *a1)
{
  uint64_t v2 = (void *)[*(id *)(a1[4] + 24) objectForKeyedSubscript:0x1EFA45440];
  if (!v2)
  {
    -[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:](a1[4], @"Default", 0, 0);
    uint64_t v2 = (void *)[*(id *)(a1[4] + 24) objectForKeyedSubscript:0x1EFA45440];
  }
  uint64_t v3 = (void *)[v2 device];
  float v4 = (void *)[v3 copyStreamWithPortType:*MEMORY[0x1E4F52E00] error:*(void *)(a1[5] + 8) + 24];
  id v7 = v4;
  if (v4)
  {
    uint64_t v5 = (void *)[v4 getProperty:*MEMORY[0x1E4F54BE8] error:*(void *)(a1[5] + 8) + 24];
    if (!*(_DWORD *)(*(void *)(a1[5] + 8) + 24))
    {
      [v5 floatValue];
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = v6;
    }
    -[BWFigCaptureDeviceVendor _resetDeviceCloseTimerForDevice:](a1[4], 0x1EFA45440);
  }
  else
  {
    FigDebugAssert3();
  }
}

- (id)cameraPoseMatrixForStreamWithPosition:(int)a3 deviceType:(int)a4 deviceID:(id)a5
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3052000000;
  int v14 = __Block_byref_object_copy__26;
  uint64_t v15 = __Block_byref_object_dispose__26;
  uint64_t v16 = 0;
  uint64_t v7 = BWCaptureDevicePositionAndDeviceTypeToPortType(a3, a4);
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86__BWFigCaptureDeviceVendor_cameraPoseMatrixForStreamWithPosition_deviceType_deviceID___block_invoke;
    v10[3] = &unk_1E5C28DA8;
    v10[4] = self;
    v10[5] = a5;
    v10[6] = v7;
    v10[7] = &v11;
    -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v10);
  }
  id v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __86__BWFigCaptureDeviceVendor_cameraPoseMatrixForStreamWithPosition_deviceType_deviceID___block_invoke(void *a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 96), "objectForKeyedSubscript:", a1[5]), "objectForKeyedSubscript:", a1[6]);
  *(void *)(*(void *)(a1[7] + 8) + 40) = result;
  return result;
}

void __60__BWFigCaptureDeviceVendor__setupDeviceCloseTimerForDevice___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5450)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "tofAFEstimatorResultsByPortType", v4, v5), "count")) {
    -[BWFigCaptureDeviceVendor _logToFAFEstimatorResultsToCoreAnalyticsForDevice:](*(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "afDriverShortStatisticsByPortType"), "count")) {
    -[BWFigCaptureDeviceVendor _logAFDriverShortStatisticsToCoreAnalyticsForDevice:](*(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  -[BWFigCaptureDeviceVendor _invalidateAndReleaseDevice:](*(void *)(a1 + 40), *(void **)(a1 + 48));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 56));
  if (![*(id *)(*(void *)(a1 + 40) + 40) count])
  {
    id v3 = -[BWFigCaptureDeviceVendor _popLatestVictimizedDeviceClient](*(void *)(a1 + 40));
    -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:canShareWithAVFlashlight:](*(void *)(a1 + 40), (uint64_t)v3, 1, 0, 0, 0);
  }
}

- (uint64_t)_logToFAFEstimatorResultsToCoreAnalyticsForDevice:(uint64_t)result
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v15 = v2;
      LODWORD(v14) = 0;
      FigDebugAssert3();
    }
    uint64_t v5 = objc_msgSend(*(id *)(v4 + 24), "objectForKeyedSubscript:", a2, v14, v15);
    if (v5)
    {
      uint64_t v6 = v5;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v7 = (void *)[v5 tofAFEstimatorResultsByPortType];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            uint64_t v13 = objc_alloc_init(BWTOFAssistedAutoFocusEstimatorAnalyticsPayload);
            [(BWTOFAssistedAutoFocusEstimatorAnalyticsPayload *)v13 setPortType:v12];
            -[BWTOFAssistedAutoFocusEstimatorAnalyticsPayload setClientApplicationID:](v13, "setClientApplicationID:", objc_msgSend((id)objc_msgSend(v6, "tofAFEstimatorClientApplicationIDByPortType"), "objectForKeyedSubscript:", v12));
            -[BWTOFAssistedAutoFocusEstimatorAnalyticsPayload setEstimatorResults:](v13, "setEstimatorResults:", objc_msgSend((id)objc_msgSend(v6, "tofAFEstimatorResultsByPortType"), "objectForKeyedSubscript:", v12));
            -[BWTOFAssistedAutoFocusEstimatorAnalyticsPayload setStreamingTime:](v13, "setStreamingTime:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "tofAFEstimatorResultsStreamingTimeByPortType"), "objectForKeyedSubscript:", v12), "intValue"));
            [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:v13];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v9);
      }
      objc_msgSend((id)objc_msgSend(v6, "tofAFEstimatorResultsByPortType"), "removeAllObjects");
      objc_msgSend((id)objc_msgSend(v6, "tofAFEstimatorResultsStreamingTimeByPortType"), "removeAllObjects");
      return objc_msgSend((id)objc_msgSend(v6, "tofAFEstimatorClientApplicationIDByPortType"), "removeAllObjects");
    }
    else
    {
      return FigDebugAssert3();
    }
  }
  return result;
}

- (uint64_t)_logAFDriverShortStatisticsToCoreAnalyticsForDevice:(uint64_t)result
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v15 = v2;
      LODWORD(v14) = 0;
      FigDebugAssert3();
    }
    uint64_t v5 = objc_msgSend(*(id *)(v4 + 24), "objectForKeyedSubscript:", a2, v14, v15);
    if (v5)
    {
      uint64_t v6 = v5;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v7 = (void *)[v5 afDriverShortStatisticsByPortType];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            uint64_t v13 = objc_alloc_init(BWAutoFocusDriverShortStatisticsAnalyticsPayload);
            [(BWAutoFocusDriverShortStatisticsAnalyticsPayload *)v13 setPortType:v12];
            -[BWAutoFocusDriverShortStatisticsAnalyticsPayload setAfDriverShortStatistics:](v13, "setAfDriverShortStatistics:", objc_msgSend((id)objc_msgSend(v6, "afDriverShortStatisticsByPortType"), "objectForKeyedSubscript:", v12));
            [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:v13];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v9);
      }
      return objc_msgSend((id)objc_msgSend(v6, "afDriverShortStatisticsByPortType"), "removeAllObjects");
    }
    else
    {
      return FigDebugAssert3();
    }
  }
  return result;
}

uint64_t __60__BWFigCaptureDeviceVendor__setupDeviceCloseTimerForDevice___block_invoke_254(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5450)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "deviceCloseTimer", v6, v7);
  if (v3 == result)
  {
    uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return [*(id *)(a1 + 32) setDeviceCloseTimer:0];
  }
  return result;
}

- (void)_deviceStateForDeviceWithStream:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v13 = v2;
    LODWORD(v12) = 0;
    FigDebugAssert3();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 24), "allValues", v12, v13, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v15;
LABEL_6:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v15 != v8) {
      objc_enumerationMutation(v5);
    }
    uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "device"), "streams"), "containsObject:", a2)) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        goto LABEL_6;
      }
      return 0;
    }
  }
}

BOOL __70__BWFigCaptureDeviceVendor__removeRegisteredDeviceClientWithClientID___block_invoke(uint64_t a1, void *a2)
{
  int v2 = *(_DWORD *)(a1 + 32);
  return v2 == [a2 clientID];
}

BOOL __70__BWFigCaptureDeviceVendor__removeVictimizedDeviceClientWithClientID___block_invoke(uint64_t a1, void *a2)
{
  int v2 = *(_DWORD *)(a1 + 32);
  return v2 == [a2 clientID];
}

void __123__BWFigCaptureDeviceVendor__deviceAvailabilityChangedForClient_available_postNotification_reason_canShareWithAVFlashlight___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x1A6272C70]();
  if (*(unsigned char *)(a1 + 44))
  {
    v7[0] = @"DeviceAvailable";
    v8[0] = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 45)];
    v7[1] = @"DeviceAvailabilityChangedReason";
    v8[1] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
    v7[2] = @"DeviceSharingWithAVFlashlightAllowed";
    v8[2] = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 46)];
    CFDictionaryRef v3 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
    if (*(unsigned char *)(a1 + 44) && !*(unsigned char *)(a1 + 45))
    {
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(LocalCenter, @"DeviceAvailabilityChanged", 0, v3, 1u);
    }
  }
  else
  {
    CFDictionaryRef v3 = 0;
  }
  if ([*(id *)(a1 + 32) deviceAvailabilityChangedHandler])
  {
    uint64_t v5 = [*(id *)(a1 + 32) deviceAvailabilityChangedHandler];
    (*(void (**)(uint64_t, uint64_t, void, void))(v5 + 16))(v5, [*(id *)(a1 + 32) clientID], *(unsigned __int8 *)(a1 + 45), *(unsigned int *)(a1 + 40));
  }
  if (*(unsigned char *)(a1 + 44) && *(unsigned char *)(a1 + 45))
  {
    uint64_t v6 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v6, @"DeviceAvailabilityChanged", 0, v3, 1u);
  }
}

- (void)_handleStreamControlTakenByAnotherClientNotification:(uint64_t)a1
{
  if (a1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __81__BWFigCaptureDeviceVendor__handleStreamControlTakenByAnotherClientNotification___block_invoke;
    v3[3] = &unk_1E5C24458;
    v3[4] = a1;
    v3[5] = a2;
    int v2 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__BWFigCaptureDeviceVendor__performBlockOnDeviceQueue___block_invoke;
    block[3] = &unk_1E5C249F0;
    block[4] = v3;
    dispatch_async(v2, block);
  }
}

uint64_t __81__BWFigCaptureDeviceVendor__handleStreamControlTakenByAnotherClientNotification___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v2 = -[BWFigCaptureDeviceVendor _deviceStateForDeviceWithStream:](*(void *)(a1 + 32), *(void *)(a1 + 40));
  uint64_t result = objc_msgSend((id)objc_msgSend(v2, "controlledStreams"), "containsObject:", *(void *)(a1 + 40));
  if (result)
  {
    if (dword_1EB4C5450)
    {
      int v20 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if ((objc_msgSend((id)objc_msgSend(v2, "streamsControlledByOtherClients", v12, v13), "containsObject:", *(void *)(a1 + 40)) & 1) == 0)objc_msgSend((id)objc_msgSend(v2, "streamsControlledByOtherClients"), "addObject:", *(void *)(a1 + 40)); {
    objc_msgSend((id)objc_msgSend(v2, "controlledStreams"), "removeObject:", *(void *)(a1 + 40));
    }
    objc_msgSend((id)objc_msgSend(v2, "streamsToKeepControlled"), "removeObject:", *(void *)(a1 + 40));
    uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__BWFigCaptureDeviceVendor__handleStreamControlTakenByAnotherClientNotification___block_invoke_258;
    block[3] = &unk_1E5C24430;
    block[4] = *(void *)(a1 + 40);
    dispatch_async(v6, block);
    uint64_t result = objc_msgSend((id)objc_msgSend(v2, "streamsRequiringControlControlledByOtherClients"), "count");
    if (result == 1)
    {
      uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
      [v7 addObjectsFromArray:*(void *)(*(void *)(a1 + 32) + 40)];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t result = [v7 countByEnumeratingWithState:&v14 objects:v21 count:16];
      if (result)
      {
        uint64_t v8 = result;
        uint64_t v9 = *(void *)v15;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
            -[BWFigCaptureDeviceVendor _removeActiveDeviceClient:moveToVictimizedList:](*(void *)(a1 + 32), v11, 1);
            -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:canShareWithAVFlashlight:](*(void *)(a1 + 32), (uint64_t)v11, 0, 1, 0, 0);
            ++v10;
          }
          while (v8 != v10);
          uint64_t result = [v7 countByEnumeratingWithState:&v14 objects:v21 count:16];
          uint64_t v8 = result;
        }
        while (result);
      }
    }
  }
  else if (dword_1EB4C5450)
  {
    int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __81__BWFigCaptureDeviceVendor__handleStreamControlTakenByAnotherClientNotification___block_invoke_258()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

- (void)_handleStreamRelinquishedByAnotherClientNotification:(uint64_t)a1
{
  if (a1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __81__BWFigCaptureDeviceVendor__handleStreamRelinquishedByAnotherClientNotification___block_invoke;
    v3[3] = &unk_1E5C24458;
    v3[4] = a2;
    v3[5] = a1;
    int v2 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__BWFigCaptureDeviceVendor__performBlockOnDeviceQueue___block_invoke;
    block[3] = &unk_1E5C249F0;
    block[4] = v3;
    dispatch_async(v2, block);
  }
}

void __81__BWFigCaptureDeviceVendor__handleStreamRelinquishedByAnotherClientNotification___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5450)
  {
    int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CFDictionaryRef v3 = -[BWFigCaptureDeviceVendor _deviceStateForDeviceWithStream:](*(void *)(a1 + 40), *(void *)(a1 + 32));
  int v4 = objc_msgSend((id)objc_msgSend(v3, "streamsControlledByOtherClients"), "containsObject:", *(void *)(a1 + 32));
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 40) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__BWFigCaptureDeviceVendor__handleStreamRelinquishedByAnotherClientNotification___block_invoke_260;
  block[3] = &unk_1E5C24430;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v5, block);
  if (objc_msgSend((id)objc_msgSend(v3, "portTypesAllowingStreamControlLoss"), "containsObject:", objc_msgSend(*(id *)(a1 + 32), "portType")))
  {
    -[BWFigCaptureDeviceVendor _unregisterFromStreamNotifications:](*(void *)(a1 + 40));
    objc_msgSend((id)objc_msgSend(v3, "streamsControlledByOtherClients"), "removeObject:", *(void *)(a1 + 32));
  }
  else if (v4 {
         && !objc_msgSend((id)objc_msgSend(v3, "device"), "requestControlOfStreams:clientPriority:", objc_msgSend(v3, "streamsControlledByOtherClients"), 1))
  }
  {
    id v6 = -[BWFigCaptureDeviceVendor _popLatestVictimizedDeviceClient](*(void *)(a1 + 40));
    objc_msgSend((id)objc_msgSend(v3, "device"), "relinquishControlOfStreams:", objc_msgSend(v3, "streamsControlledByOtherClients"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = (void *)[v3 streamsControlledByOtherClients];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          -[BWFigCaptureDeviceVendor _unregisterFromStreamNotifications:](*(void *)(a1 + 40));
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v21 count:16];
      }
      while (v9);
    }
    objc_msgSend((id)objc_msgSend(v3, "streamsControlledByOtherClients", v12, v13), "removeAllObjects");
    -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:canShareWithAVFlashlight:](*(void *)(a1 + 40), (uint64_t)v6, 1, 1, 0, 0);
    -[BWFigCaptureDeviceVendor _setupDeviceCloseTimerForDevice:](*(void *)(a1 + 40), objc_msgSend((id)objc_msgSend(v3, "device"), "deviceID"));
  }
}

uint64_t __81__BWFigCaptureDeviceVendor__handleStreamRelinquishedByAnotherClientNotification___block_invoke_260()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

- (void)_handleStreamFrameReceiveTimeoutNotification:(uint64_t)a1
{
  if (a1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __73__BWFigCaptureDeviceVendor__handleStreamFrameReceiveTimeoutNotification___block_invoke;
    v3[3] = &unk_1E5C24458;
    v3[4] = a1;
    v3[5] = a2;
    int v2 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__BWFigCaptureDeviceVendor__performBlockOnDeviceQueue___block_invoke;
    block[3] = &unk_1E5C249F0;
    block[4] = v3;
    dispatch_async(v2, block);
  }
}

void __73__BWFigCaptureDeviceVendor__handleStreamFrameReceiveTimeoutNotification___block_invoke(uint64_t a1)
{
  int v2 = -[BWFigCaptureDeviceVendor _deviceStateForDeviceWithStream:](*(void *)(a1 + 32), *(void *)(a1 + 40));
  if ([v2 device]) {
    CFDictionaryRef v3 = objc_msgSend((id)objc_msgSend(v2, "device"), "copyProperty:error:", @"StreamArray", 0);
  }
  else {
    CFDictionaryRef v3 = 0;
  }
  if (objc_msgSend(v3, "containsObject:", objc_msgSend(*(id *)(a1 + 40), "figCaptureStream")))
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    -[BWFigCaptureDeviceVendor _handleErrorForDevice:](*(void *)(a1 + 32), objc_msgSend((id)objc_msgSend(v2, "device"), "deviceID"));
  }
}

- (uint64_t)_handleErrorForDevice:(uint64_t)result
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v18 = v2;
      LODWORD(v17) = 0;
      FigDebugAssert3();
    }
    uint64_t result = objc_msgSend(*(id *)(v4 + 24), "objectForKeyedSubscript:", a2, v17, v18);
    if (result)
    {
      uint64_t v5 = (void *)result;
      id v6 = (void *)[MEMORY[0x1E4F1CA48] array];
      [v6 addObjectsFromArray:*(void *)(v4 + 40)];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v36 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v6);
            }
            -[BWFigCaptureDeviceVendor _removeActiveDeviceClient:moveToVictimizedList:](v4, *(void **)(*((void *)&v23 + 1) + 8 * i), 0);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v36 count:16];
        }
        while (v8);
      }
      -[BWFigCaptureDeviceVendor _invalidateAndReleaseDevice:](v4, objc_msgSend((id)objc_msgSend(v5, "device"), "deviceID"));
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t result = [v6 countByEnumeratingWithState:&v19 objects:v35 count:16];
      if (result)
      {
        uint64_t v11 = result;
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v6);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
            long long v15 = *(NSObject **)(v4 + 80);
            blocuint64_t k = MEMORY[0x1E4F143A8];
            uint64_t v28 = 3221225472;
            int v29 = __123__BWFigCaptureDeviceVendor__deviceAvailabilityChangedForClient_available_postNotification_reason_canShareWithAVFlashlight___block_invoke;
            long long v30 = &unk_1E5C29150;
            __int16 v33 = 1;
            int v32 = 2;
            char v34 = 0;
            uint64_t v31 = v14;
            dispatch_async(v15, &block);
            long long v16 = *(NSObject **)(v4 + 80);
            blocuint64_t k = MEMORY[0x1E4F143A8];
            uint64_t v28 = 3221225472;
            int v29 = __123__BWFigCaptureDeviceVendor__deviceAvailabilityChangedForClient_available_postNotification_reason_canShareWithAVFlashlight___block_invoke;
            long long v30 = &unk_1E5C29150;
            __int16 v33 = 257;
            int v32 = 2;
            char v34 = 0;
            uint64_t v31 = v14;
            dispatch_async(v16, &block);
            ++v13;
          }
          while (v11 != v13);
          uint64_t result = [v6 countByEnumeratingWithState:&v19 objects:v35 count:16];
          uint64_t v11 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (void)_handleDeviceUnrecoverableError:(uint64_t)a3 fromDevice:
{
  if (a1)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __71__BWFigCaptureDeviceVendor__handleDeviceUnrecoverableError_fromDevice___block_invoke;
    v4[3] = &unk_1E5C29178;
    v4[4] = a1;
    v4[5] = a3;
    int v5 = a2;
    CFDictionaryRef v3 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__BWFigCaptureDeviceVendor__performBlockOnDeviceQueue___block_invoke;
    block[3] = &unk_1E5C249F0;
    block[4] = v4;
    dispatch_async(v3, block);
  }
}

uint64_t __71__BWFigCaptureDeviceVendor__handleDeviceUnrecoverableError_fromDevice___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) allValues];
  uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        uint64_t result = objc_msgSend((id)objc_msgSend(v7, "device"), "figCaptureDevice");
        if (result == *(void *)(a1 + 40))
        {
          if (v7)
          {
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            return -[BWFigCaptureDeviceVendor _handleErrorForDevice:](*(void *)(a1 + 32), objc_msgSend((id)objc_msgSend(v7, "device"), "deviceID"));
          }
          return result;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (void)_handleDeviceNoLongerAvailable:(uint64_t)a1
{
  if (a1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __59__BWFigCaptureDeviceVendor__handleDeviceNoLongerAvailable___block_invoke;
    v3[3] = &unk_1E5C24F10;
    v3[4] = a1;
    v3[5] = a2;
    uint64_t v2 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__BWFigCaptureDeviceVendor__performBlockOnDeviceQueue___block_invoke;
    block[3] = &unk_1E5C249F0;
    block[4] = v3;
    dispatch_async(v2, block);
  }
}

uint64_t __59__BWFigCaptureDeviceVendor__handleDeviceNoLongerAvailable___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
      if (objc_msgSend((id)objc_msgSend(v7, "device"), "figCaptureDevice") == *(void *)(a1 + 40)) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v7 = 0;
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(v7, "device"), "figCaptureDevice");
  if (result == *(void *)(a1 + 40))
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return -[BWFigCaptureDeviceVendor _handleErrorForDevice:](*(void *)(a1 + 32), objc_msgSend((id)objc_msgSend(v7, "device"), "deviceID"));
  }
  return result;
}

- (int)requestControlOfStreams:(id)a3 device:(id)a4 deviceClientPriority:(int)a5
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__BWFigCaptureDeviceVendor_requestControlOfStreams_device_deviceClientPriority___block_invoke;
  void v7[3] = &unk_1E5C291A0;
  v7[4] = self;
  void v7[5] = a3;
  v7[6] = a4;
  v7[7] = &v9;
  int v8 = a5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v7);
  int v5 = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __80__BWFigCaptureDeviceVendor_requestControlOfStreams_device_deviceClientPriority___block_invoke(uint64_t a1)
{
  uint64_t result = -[BWFigCaptureDeviceVendor _requestControlOfStreams:device:deviceClientPriority:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(unsigned int *)(a1 + 64));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (id)deviceWithID:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__26;
  long long v10 = __Block_byref_object_dispose__26;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__BWFigCaptureDeviceVendor_deviceWithID___block_invoke;
  v5[3] = &unk_1E5C27038;
  v5[5] = a3;
  void v5[6] = &v6;
  v5[4] = self;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __41__BWFigCaptureDeviceVendor_deviceWithID___block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) _deviceWithID:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (id)_deviceWithID:(id)a3
{
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v9 = v3;
    LODWORD(v8) = 0;
    FigDebugAssert3();
  }
  uint64_t v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_devicesStatesByDeviceID, "objectForKeyedSubscript:", a3, v8, v9);
  return (id)[v6 device];
}

- (int)usageCountForDevice:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__BWFigCaptureDeviceVendor_usageCountForDevice___block_invoke;
  v5[3] = &unk_1E5C27038;
  v5[5] = a3;
  void v5[6] = &v6;
  v5[4] = self;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__BWFigCaptureDeviceVendor_usageCountForDevice___block_invoke(void *a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]), "deviceUsageCount");
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)registeredDeviceClients
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__26;
  int v9 = __Block_byref_object_dispose__26;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__BWFigCaptureDeviceVendor_registeredDeviceClients__block_invoke;
  v4[3] = &unk_1E5C246B8;
  v4[4] = self;
  v4[5] = &v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __51__BWFigCaptureDeviceVendor_registeredDeviceClients__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)registeredDeviceClientWithID:(int)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__26;
  uint64_t v11 = __Block_byref_object_dispose__26;
  uint64_t v12 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__BWFigCaptureDeviceVendor_registeredDeviceClientWithID___block_invoke;
  v5[3] = &unk_1E5C29018;
  v5[4] = self;
  v5[5] = &v7;
  int v6 = a3;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v5);
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

void *__57__BWFigCaptureDeviceVendor_registeredDeviceClientWithID___block_invoke(uint64_t a1)
{
  uint64_t result = -[BWFigCaptureDeviceVendor _registeredDeviceClientWithID:](*(void **)(a1 + 32), *(_DWORD *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)activeDeviceClient
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__26;
  uint64_t v9 = __Block_byref_object_dispose__26;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__BWFigCaptureDeviceVendor_activeDeviceClient__block_invoke;
  v4[3] = &unk_1E5C24F58;
  v4[4] = self;
  v4[5] = &v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

id __46__BWFigCaptureDeviceVendor_activeDeviceClient__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
      int v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) clientIsAVFlashlight];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v7;
      if (!v8) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_3;
        }
        return *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
    }
  }
  return *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
}

- (id)victimizedDeviceClients
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  int v8 = __Block_byref_object_copy__26;
  uint64_t v9 = __Block_byref_object_dispose__26;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__BWFigCaptureDeviceVendor_victimizedDeviceClients__block_invoke;
  v4[3] = &unk_1E5C246B8;
  v4[4] = self;
  v4[5] = &v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __51__BWFigCaptureDeviceVendor_victimizedDeviceClients__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)hasActiveForClientAssertion
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__BWFigCaptureDeviceVendor_hasActiveForClientAssertion__block_invoke;
  v4[3] = &unk_1E5C246B8;
  v4[4] = self;
  v4[5] = &v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __55__BWFigCaptureDeviceVendor_hasActiveForClientAssertion__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 88) != 0;
  return result;
}

- (id)defaultDeviceCreationHistory
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  char v8 = __Block_byref_object_copy__26;
  uint64_t v9 = __Block_byref_object_dispose__26;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__BWFigCaptureDeviceVendor_defaultDeviceCreationHistory__block_invoke;
  v4[3] = &unk_1E5C246B8;
  v4[4] = self;
  v4[5] = &v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __56__BWFigCaptureDeviceVendor_defaultDeviceCreationHistory__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 136) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)cmioDeviceCreationHistory
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  char v8 = __Block_byref_object_copy__26;
  uint64_t v9 = __Block_byref_object_dispose__26;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__BWFigCaptureDeviceVendor_cmioDeviceCreationHistory__block_invoke;
  v4[3] = &unk_1E5C246B8;
  v4[4] = self;
  v4[5] = &v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __53__BWFigCaptureDeviceVendor_cmioDeviceCreationHistory__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 144) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_showISPLeftOnTapToRadarPromptIfNecessary:(uint64_t)a3 radarTitle:(uint64_t)a4 radarDescription:(uint64_t)a5 radarClassification:(uint64_t)a6 radarReproducibility:
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    FigCapturePromptOpenTapToRadarIfNecessary(a2, a3, a4, a5, a6, @"LastShownISPLeftOnTTRPromptDate", @"com.apple.cameracapture.volatile");
  }
}

uint64_t __59__BWFigCaptureDeviceVendor__createDevice_reason_clientPID___block_invoke(uint64_t a1)
{
  return -[BWFigCaptureDeviceVendor _logActiveDefaultDeviceClientAndDevice](*(void *)(a1 + 32));
}

- (uint64_t)_logActiveDefaultDeviceClientAndDevice
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v13 = v1;
      LODWORD(v11) = 0;
      FigDebugAssert3();
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v15 = v2;
    obuint64_t j = *(id *)(v2 + 40);
    uint64_t v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16, v11, v13);
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v18 != v5) {
            objc_enumerationMutation(obj);
          }
          if (dword_1EB4C5450)
          {
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v4);
    }
    uint64_t result = objc_msgSend(*(id *)(v15 + 40), "count", v12, v14);
    int v8 = dword_1EB4C5450;
    if (!result && dword_1EB4C5450)
    {
      uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      uint64_t result = fig_log_call_emit_and_clean_up_after_send_and_compose();
      int v8 = dword_1EB4C5450;
    }
    if (v8)
    {
      uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

- (BOOL)_isRearCameraCalibrationValid
{
  if (result) {
    return (int)FigCapturePlatformIdentifier() < 7
  }
        || !BWDeviceIsiPhone()
        || (MGGetBoolAnswer() & 1) != 0
        || (objc_msgSend((id)objc_msgSend((id)FigCaptureDeviceIORegValuesByKeys(), "objectForKeyedSubscript:", 0x1EFA76E20), "intValue") & 0xFFFFFFFE) != 2;
  return result;
}

uint64_t __59__BWFigCaptureDeviceVendor__createDevice_reason_clientPID___block_invoke_283()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v0 = (void *)FigCaptureDeviceIORegValuesByKeys();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [v0 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)v10;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(v0);
        }
        switch(objc_msgSend((id)objc_msgSend(v0, "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * v4), v7, v8), "intValue"))
        {
          case 2u:
          case 3u:
          case 5u:
          case 6u:
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            goto LABEL_10;
          case 4u:
            if (dword_1EB4C5450)
            {
              uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
LABEL_10:
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            break;
          default:
            break;
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t result = [v0 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v2 = result;
    }
    while (result);
  }
  return result;
}

void __69__BWFigCaptureDeviceVendor__updateDefaultDevicePriorStreamPortTypes___block_invoke(uint64_t a1)
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  uint64_t v3 = *(const void **)(a1 + 32);
  CFNotificationCenterPostNotification(LocalCenter, @"DefaultDeviceStreamsChanged", v3, 0, 0);
}

- (id)osStatePropertyList
{
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v11 = v2;
    LODWORD(v10) = 0;
    FigDebugAssert3();
  }
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v10, v11);
  [v4 setObject:self->_defaultDeviceCreationHistory forKeyedSubscript:@"Default Device Creation History"];
  [v4 setObject:self->_cmioDeviceCreationHistory forKeyedSubscript:@"CMIO Device Creation History"];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPropertyListRef v7 = (id)CFPreferencesCopyValue(@"LastShownISPLeftOnTTRPromptDate", @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFPropertyListRef v8 = (id)CFPreferencesCopyValue(@"LastShownISPLeftOnTTRPromptBuildVersion", @"com.apple.cameracapture.volatile", v5, v6);
  if (v7) {
    [v4 setObject:v7 forKeyedSubscript:@"LastShownISPLeftOnTTRPromptDate"];
  }
  if (v8) {
    [v4 setObject:v8 forKeyedSubscript:@"LastShownISPLeftOnTTRPromptBuildVersion"];
  }
  return v4;
}

void __55__BWFigCaptureDeviceVendor__updateCMIOExtensionDevices__block_invoke(uint64_t a1)
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  uint64_t v3 = *(const void **)(a1 + 32);
  CFNotificationCenterPostNotification(LocalCenter, @"DevicesChanged", v3, 0, 1u);
}

- (void)_handleCMIOExtensionDevicesChangedNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a3 name];
  if ([v4 isEqualToString:*MEMORY[0x1E4F220D0]])
  {
    if (dword_1EB4C5450)
    {
      int v8 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__BWFigCaptureDeviceVendor__handleCMIOExtensionDevicesChangedNotification___block_invoke;
    v6[3] = &unk_1E5C24430;
    v6[4] = self;
    -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueue:]((uint64_t)self, (uint64_t)v6);
  }
  else
  {
    FigDebugAssert3();
  }
}

void __75__BWFigCaptureDeviceVendor__handleCMIOExtensionDevicesChangedNotification___block_invoke(uint64_t a1)
{
}

@end