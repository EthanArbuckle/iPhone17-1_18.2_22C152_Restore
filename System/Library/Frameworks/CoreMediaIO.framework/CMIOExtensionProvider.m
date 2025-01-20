@interface CMIOExtensionProvider
+ (CMIOExtensionProvider)providerWithSource:(id)source clientQueue:(dispatch_queue_t)clientQueue;
+ (id)internalProperties;
+ (id)internalWritableProperties;
+ (id)newActivityAttributionWithToken:(id *)a3;
+ (id)proprietaryDefaultsDomainForAuditToken:(id *)a3;
+ (id)sharedProvider;
+ (void)ignoreSIGTERM;
+ (void)startServiceWithProvider:(CMIOExtensionProvider *)provider;
+ (void)stopServiceWithProvider:(id)a3;
- (BOOL)addDevice:(CMIOExtensionDevice *)device error:(NSError *)outError;
- (BOOL)registerDevice:(id)a3 error:(id *)a4;
- (BOOL)registerStream:(id)a3 withDeviceID:(id)a4 error:(id *)a5;
- (BOOL)removeDevice:(CMIOExtensionDevice *)device error:(NSError *)outError;
- (BOOL)unregisterDevice:(id)a3 error:(id *)a4;
- (BOOL)unregisterStream:(id)a3 withDeviceID:(id)a4 notify:(BOOL)a5 error:(id *)a6;
- (CMIOExtensionProvider)initWithSource:(id)source clientQueue:(dispatch_queue_t)clientQueue;
- (NSArray)connectedClients;
- (NSArray)devices;
- (dispatch_queue_t)clientQueue;
- (id)_clientQueue_internalPropertyStatesForProperties:(id)a3;
- (id)description;
- (id)source;
- (int)_clientQueue_pendingStartStreamCountForClient:(id)a3 streamID:(id)a4;
- (int64_t)authorizationStatusForClient:(id)a3 mediaType:(unsigned int)a4;
- (void)_addAvailablePropertyStatesForDevice:(id)a3 toDictionary:(id)a4;
- (void)_clientQueue_decrementPendingStreamStartCountForClientID:(id)a3 streamID:(id)a4;
- (void)_clientQueue_incrementPendingStartStreamCountForClientID:(id)a3 streamID:(id)a4;
- (void)_clientQueue_notifyDevicePropertiesChangedWithDeviceID:(id)a3 propertyStates:(id)a4;
- (void)_clientQueue_notifyIsRunningSomewhereForStream:(id)a3;
- (void)_clientQueue_notifyStreamPropertiesChangedWithStreamID:(id)a3 propertyStates:(id)a4;
- (void)_clientQueue_removePendingStartStreamCountForClient:(id)a3 streamID:(id)a4;
- (void)_clientQueue_sendSampleForStream:(id)a3 sample:(id)a4;
- (void)_clientQueue_startStreamForClientID:(id)a3 streamID:(id)a4 requestAudio:(BOOL)a5 requestVideo:(BOOL)a6 reply:(id)a7;
- (void)_performDeferredStreamStartsForClient:(id)a3 streamID:(id)a4 requestVideo:(BOOL)a5 requestAudio:(BOOL)a6;
- (void)availableDevicePropertiesForClientID:(id)a3 deviceID:(id)a4 reply:(id)a5;
- (void)availablePluginPropertiesForClientID:(id)a3 reply:(id)a4;
- (void)availableStreamPropertiesForClientID:(id)a3 streamID:(id)a4 reply:(id)a5;
- (void)beginProviderContextRegistration:(id)a3;
- (void)captureAsyncStillImageForClientID:(id)a3 streamID:(id)a4 uniqueID:(int64_t)a5 options:(id)a6 reply:(id)a7;
- (void)consumeSampleBufferForStream:(id)a3 client:(id)a4 reply:(id)a5;
- (void)dealloc;
- (void)devicePropertyStatesForClientID:(id)a3 deviceID:(id)a4 properties:(id)a5 reply:(id)a6;
- (void)deviceStatesForClientID:(id)a3 deviceID:(id)a4 reply:(id)a5;
- (void)enqueueReactionEffectForClientID:(id)a3 streamID:(id)a4 reactionType:(id)a5 reply:(id)a6;
- (void)finishProviderContextRegistration:(id)a3;
- (void)notifyAvailableDevicesChanged:(id)a3;
- (void)notifyAvailableStreamsChangedWithDeviceID:(id)a3 streamIDs:(id)a4;
- (void)notifyPropertiesChanged:(NSDictionary *)propertyStates;
- (void)notifyScheduledOutputChangedForStream:(id)a3 scheduledOutput:(id)a4;
- (void)pluginPropertyStatesForClientID:(id)a3 properties:(id)a4 reply:(id)a5;
- (void)pluginStatesForClientID:(id)a3 reply:(id)a4;
- (void)removeAllProviderContexts;
- (void)removeProviderContext:(id)a3;
- (void)removeSystemStatusAttributionsForClient:(id)a3 stream:(id)a4;
- (void)requestAccessForClient:(id)a3 mediaType:(unsigned int)a4 completionHandler:(id)a5;
- (void)setConnectedClients:(id)a3;
- (void)setDevicePropertyValuesForClientID:(id)a3 deviceID:(id)a4 propertyValues:(id)a5 reply:(id)a6;
- (void)setPluginPropertyValuesForClientID:(id)a3 propertyValues:(id)a4 reply:(id)a5;
- (void)setStreamPropertyValuesForClientID:(id)a3 streamID:(id)a4 propertyValues:(id)a5 reply:(id)a6;
- (void)startStreamForClientID:(id)a3 streamID:(id)a4 reply:(id)a5;
- (void)stopStreamForClientID:(id)a3 streamID:(id)a4 reply:(id)a5;
- (void)streamPropertyStatesForClientID:(id)a3 streamID:(id)a4 properties:(id)a5 reply:(id)a6;
- (void)updateNonStreamingProxyFrontedExtensionPIDs:(id)a3;
@end

@implementation CMIOExtensionProvider

+ (id)proprietaryDefaultsDomainForAuditToken:(id *)a3
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  uint64_t v76 = 0;
  if (!SystemStatusLibraryCore()) {
    return @"unknown";
  }
  if (proprietaryDefaultsDomainForAuditToken__onceToken != -1) {
    dispatch_once(&proprietaryDefaultsDomainForAuditToken__onceToken, &__block_literal_global_358);
  }
  long long v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)atoken = *(_OWORD *)a3->var0;
  *(_OWORD *)&atoken[16] = v4;
  unsigned int v71 = audit_token_to_pid((audit_token_t *)atoken);
  uint64_t v72 = [NSNumber numberWithInt:v71];
  v5 = (void *)[(id)sProprietaryDefaultsDomainsByPID objectForKeyedSubscript:v72];
  if (!v5)
  {
    v10 = objc_msgSend(MEMORY[0x263F64570], "handleForIdentifier:error:", objc_msgSend(NSNumber, "numberWithInt:", v71), &v76);
    if (v10)
    {
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "bundle"), "extensionPointIdentifier"), "isEqualToString:", @"com.apple.securecapture"))
      {
        v11 = CMIOLog();
        v12 = v11;
        if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          *(_DWORD *)atoken = 136315907;
          *(void *)&atoken[4] = v13;
          *(_WORD *)&atoken[12] = 1024;
          *(_DWORD *)&atoken[14] = 2173;
          *(_WORD *)&atoken[18] = 2080;
          *(void *)&atoken[20] = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
          *(_WORD *)&atoken[28] = 1025;
          *(_DWORD *)&atoken[30] = v71;
          _os_log_impl(&dword_2432B6000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] client is a secure capture extension, looking up containing app", atoken, 0x22u);
        }
        long long v14 = *(_OWORD *)&a3->var0[4];
        *(_OWORD *)atoken = *(_OWORD *)a3->var0;
        *(_OWORD *)&atoken[16] = v14;
        v15 = (void *)[MEMORY[0x263F01890] bundleRecordForAuditToken:atoken error:&v76];
        if (v15)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v16 = objc_msgSend((id)objc_msgSend(v15, "containingBundleRecord"), "bundleIdentifier");
            *(void *)atoken = 0;
            *(void *)&atoken[8] = atoken;
            *(void *)&atoken[16] = 0x3052000000;
            *(void *)&atoken[24] = __Block_byref_object_copy_;
            *(void *)&atoken[32] = __Block_byref_object_dispose_;
            v17 = (objc_class *)getSTExecutableIdentityClass_softClass;
            *(void *)&atoken[40] = getSTExecutableIdentityClass_softClass;
            if (!getSTExecutableIdentityClass_softClass)
            {
              *(void *)&long long v77 = MEMORY[0x263EF8330];
              *((void *)&v77 + 1) = 3221225472;
              *(void *)&long long v78 = __getSTExecutableIdentityClass_block_invoke;
              *((void *)&v78 + 1) = &unk_26517C258;
              *(void *)&long long v79 = atoken;
              __getSTExecutableIdentityClass_block_invoke((uint64_t)&v77);
              v17 = *(objc_class **)(*(void *)&atoken[8] + 40);
            }
            _Block_object_dispose(atoken, 8);
            v18 = (id)[[v17 alloc] initWithApplicationBundleIdentifier:v16];
            goto LABEL_25;
          }
          v27 = CMIOLog();
          v22 = v27;
          if (!v27) {
            goto LABEL_36;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            +[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:].cold.4();
          }
        }
        else
        {
          v26 = CMIOLog();
          if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            +[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]();
          }
        }
        goto LABEL_35;
      }
    }
    else
    {
      v19 = CMIOLog();
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        +[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]();
      }
    }
    if (sResponsibleIdentityForAuditTokenIsSupported)
    {
      STExecutableIdentityResolverClass = (void *)getSTExecutableIdentityResolverClass();
      long long v21 = *(_OWORD *)&a3->var0[4];
      *(_OWORD *)atoken = *(_OWORD *)a3->var0;
      *(_OWORD *)&atoken[16] = v21;
      v18 = [STExecutableIdentityResolverClass responsibleIdentityForAuditToken:atoken];
LABEL_25:
      v22 = v18;
LABEL_36:
      v28 = CMIOLog();
      v29 = v28;
      if (v28 && os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v30 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        *(_DWORD *)atoken = 136316163;
        *(void *)&atoken[4] = v30;
        *(_WORD *)&atoken[12] = 1024;
        *(_DWORD *)&atoken[14] = 2206;
        *(_WORD *)&atoken[18] = 2080;
        *(void *)&atoken[20] = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
        *(_WORD *)&atoken[28] = 1025;
        *(_DWORD *)&atoken[30] = v71;
        *(_WORD *)&atoken[34] = 2113;
        *(void *)&atoken[36] = v22;
        _os_log_impl(&dword_2432B6000, v29, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] resolvedIdentity: %{private}@", atoken, 0x2Cu);
      }
      v31 = (__CFString *)[v22 bundleIdentifier];
      if (!v31)
      {
        v32 = (void *)[v22 executablePath];
        if (!v32) {
          goto LABEL_45;
        }
        v33 = CMIOLog();
        v34 = v33;
        if (v33 && os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v35 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          *(_DWORD *)atoken = 136316163;
          *(void *)&atoken[4] = v35;
          *(_WORD *)&atoken[12] = 1024;
          *(_DWORD *)&atoken[14] = 2211;
          *(_WORD *)&atoken[18] = 2080;
          *(void *)&atoken[20] = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
          *(_WORD *)&atoken[28] = 1025;
          *(_DWORD *)&atoken[30] = v71;
          *(_WORD *)&atoken[34] = 2113;
          *(void *)&atoken[36] = v32;
          _os_log_impl(&dword_2432B6000, v34, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] falling back to using last part of the executable's path %{private}@", atoken, 0x2Cu);
        }
        v31 = (__CFString *)(id)objc_msgSend((id)objc_msgSend(v32, "componentsSeparatedByString:", @"/"), "lastObject");
        if (!v31)
        {
LABEL_45:
          v36 = CMIOLog();
          v37 = v36;
          if (v36 && os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            +[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:](v71, v37);
          }
          v31 = @"unknown";
        }
      }
      if (([(__CFString *)v31 isEqualToString:@"avconferenced"] & 1) != 0
        || ([(__CFString *)v31 isEqualToString:@"com.apple.avconferenced"] & 1) != 0
        || ([(__CFString *)v31 isEqualToString:@"com.apple.InCallService"] & 1) != 0
        || ([(__CFString *)v31 isEqualToString:@"com.apple.FaceTime.FaceTimeNotificationCenterService"] & 1) != 0|| [(__CFString *)v31 isEqualToString:@"com.apple.TelephonyUtilities"])
      {
        v38 = CMIOLog();
        v39 = v38;
        if (v38)
        {
          v70 = @"com.apple.FaceTime";
          if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_60;
          }
          v40 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          *(_DWORD *)atoken = 136316419;
          *(void *)&atoken[4] = v40;
          *(_WORD *)&atoken[12] = 1024;
          *(_DWORD *)&atoken[14] = 2228;
          *(_WORD *)&atoken[18] = 2080;
          *(void *)&atoken[20] = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
          *(_WORD *)&atoken[28] = 1025;
          *(_DWORD *)&atoken[30] = v71;
          *(_WORD *)&atoken[34] = 2113;
          *(void *)&atoken[36] = v31;
          *(_WORD *)&atoken[44] = 2113;
          *(void *)&atoken[46] = @"com.apple.FaceTime";
          goto LABEL_57;
        }
        v41 = @"com.apple.FaceTime";
        goto LABEL_59;
      }
      if (([(__CFString *)v31 isEqualToString:@"com.cisco.webexmeetingsapp"] & 1) != 0
        || ([(__CFString *)v31 isEqualToString:@"Cisco-Systems-Spark"] & 1) != 0
        || [(__CFString *)v31 isEqualToString:@"Cisco-Systems.Spark"])
      {
        v68 = CMIOLog();
        v39 = v68;
        if (!v68)
        {
          v41 = @"com.webex.meetingmanager";
LABEL_59:
          v70 = v41;
          goto LABEL_60;
        }
        v70 = @"com.webex.meetingmanager";
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          v69 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          *(_DWORD *)atoken = 136316419;
          *(void *)&atoken[4] = v69;
          *(_WORD *)&atoken[12] = 1024;
          *(_DWORD *)&atoken[14] = 2240;
          *(_WORD *)&atoken[18] = 2080;
          *(void *)&atoken[20] = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
          *(_WORD *)&atoken[28] = 1025;
          *(_DWORD *)&atoken[30] = v71;
          *(_WORD *)&atoken[34] = 2113;
          *(void *)&atoken[36] = v31;
          *(_WORD *)&atoken[44] = 2113;
          *(void *)&atoken[46] = @"com.webex.meetingmanager";
LABEL_57:
          _os_log_impl(&dword_2432B6000, v39, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] remapping preference domain %{private}@ to %{private}@", atoken, 0x36u);
        }
      }
      else
      {
        v70 = v31;
      }
LABEL_60:
      v42 = (void *)sMostRecentProprietaryDefaultDomainLookupTimeByPID;
      int v75 = sPostTerminationTimoutForClearingEntryFromProprietaryDefaultsDomainsByPID;
      v73 = (void *)sProprietaryDefaultsDomainsByPID;
      id obj = (id)[(id)sProprietaryDefaultsDomainsByPID allKeys];
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      uint64_t v43 = [obj countByEnumeratingWithState:&v77 objects:atoken count:16];
      if (!v43)
      {
LABEL_89:
        [(id)sProprietaryDefaultsDomainsByPID setObject:v70 forKeyedSubscript:v72];
        objc_msgSend((id)sMostRecentProprietaryDefaultDomainLookupTimeByPID, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", FigGetUpTimeNanoseconds()), v72);
        v64 = CMIOLog();
        v65 = v64;
        if (!v64 || !os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT)) {
          return v70;
        }
        v66 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        *(_DWORD *)atoken = 136316163;
        *(void *)&atoken[4] = v66;
        *(_WORD *)&atoken[12] = 1024;
        *(_DWORD *)&atoken[14] = 2249;
        *(_WORD *)&atoken[18] = 2080;
        *(void *)&atoken[20] = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
        *(_WORD *)&atoken[28] = 1025;
        *(_DWORD *)&atoken[30] = v71;
        *(_WORD *)&atoken[34] = 2113;
        v9 = v70;
        *(void *)&atoken[36] = v70;
        _os_log_impl(&dword_2432B6000, v65, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] preference domain %{private}@", atoken, 0x2Cu);
        return v9;
      }
      uint64_t UpTimeNanoseconds = 0;
      uint64_t v45 = *(void *)v78;
LABEL_62:
      uint64_t v46 = 0;
      while (1)
      {
        if (*(void *)v78 != v45) {
          objc_enumerationMutation(obj);
        }
        v47 = *(void **)(*((void *)&v77 + 1) + 8 * v46);
        uint64_t v48 = [v47 intValue];
        if (v48 < 2)
        {
LABEL_68:
          if (!UpTimeNanoseconds) {
            uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
          }
          unint64_t v50 = (UpTimeNanoseconds
               - objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", v47), "longLongValue"))
              / 0x3B9ACA00uLL;
          v51 = CMIOLog();
          v52 = v51;
          if (v75 >= (int)v50)
          {
            if (v51 && os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              v54 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
              *(_DWORD *)buf = 136316163;
              v84 = v54;
              __int16 v85 = 1024;
              int v86 = 2272;
              __int16 v87 = 2080;
              v88 = "cmioep_pruneStalePIDsFromDictionary";
              __int16 v89 = 1025;
              int v90 = v48;
              __int16 v91 = 2048;
              unint64_t v92 = v50;
              _os_log_impl(&dword_2432B6000, v52, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] keeping stale pid because it was accessed %lld seconds ago", buf, 0x2Cu);
            }
          }
          else
          {
            if (v51 && os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              v53 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
              *(_DWORD *)buf = 136316163;
              v84 = v53;
              __int16 v85 = 1024;
              int v86 = 2267;
              __int16 v87 = 2080;
              v88 = "cmioep_pruneStalePIDsFromDictionary";
              __int16 v89 = 1025;
              int v90 = v48;
              __int16 v91 = 2048;
              unint64_t v92 = v50;
              _os_log_impl(&dword_2432B6000, v52, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] dropping stale pid; last accessed %lld seconds ago",
                buf,
                0x2Cu);
            }
            [v73 setObject:0 forKeyedSubscript:v47];
            [v42 setObject:0 forKeyedSubscript:v47];
          }
          goto LABEL_84;
        }
        id v81 = 0;
        uint64_t v49 = objc_msgSend(MEMORY[0x263F64570], "handleForIdentifier:error:", objc_msgSend(MEMORY[0x263F64580], "identifierWithPid:", v48), &v81);
        if (!v81) {
          break;
        }
        if ([v81 code] == 3) {
          goto LABEL_68;
        }
        v60 = CMIOLog();
        v61 = v60;
        if (v60 && os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          v62 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          *(_DWORD *)buf = 136316162;
          v84 = v62;
          __int16 v85 = 1024;
          int v86 = 2293;
          __int16 v87 = 2080;
          v88 = "cmioep_pidIsValid";
          __int16 v89 = 1024;
          int v90 = v48;
          __int16 v91 = 2112;
          unint64_t v92 = (unint64_t)v81;
          v58 = v61;
          v59 = "%s:%d:%s [%d] creating process handle returned error: %@";
LABEL_87:
          _os_log_error_impl(&dword_2432B6000, v58, OS_LOG_TYPE_ERROR, v59, buf, 0x2Cu);
        }
LABEL_84:
        if (v43 == ++v46)
        {
          uint64_t v63 = [obj countByEnumeratingWithState:&v77 objects:atoken count:16];
          uint64_t v43 = v63;
          if (!v63) {
            goto LABEL_89;
          }
          goto LABEL_62;
        }
      }
      if (v49) {
        goto LABEL_84;
      }
      v55 = CMIOLog();
      v56 = v55;
      if (!v55 || !os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        goto LABEL_84;
      }
      v57 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      *(_DWORD *)buf = 136316162;
      v84 = v57;
      __int16 v85 = 1024;
      int v86 = 2297;
      __int16 v87 = 2080;
      v88 = "cmioep_pidIsValid";
      __int16 v89 = 1024;
      int v90 = v48;
      __int16 v91 = 2112;
      unint64_t v92 = (unint64_t)v81;
      v58 = v56;
      v59 = "%s:%d:%s [%d] could not create process handle: %@";
      goto LABEL_87;
    }
    v23 = CMIOLog();
    v24 = v23;
    if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      *(_DWORD *)atoken = 136315650;
      *(void *)&atoken[4] = v25;
      *(_WORD *)&atoken[12] = 1024;
      *(_DWORD *)&atoken[14] = 2203;
      *(_WORD *)&atoken[18] = 2080;
      *(void *)&atoken[20] = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
      _os_log_impl(&dword_2432B6000, v24, OS_LOG_TYPE_DEFAULT, "%s:%d:%s proper version of System Status not present to support this call.", atoken, 0x1Cu);
    }
LABEL_35:
    v22 = 0;
    goto LABEL_36;
  }
  v6 = CMIOLog();
  v7 = v6;
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
    *(_DWORD *)atoken = 136316163;
    *(void *)&atoken[4] = v8;
    *(_WORD *)&atoken[12] = 1024;
    *(_DWORD *)&atoken[14] = 2144;
    *(_WORD *)&atoken[18] = 2080;
    *(void *)&atoken[20] = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
    *(_WORD *)&atoken[28] = 1025;
    *(_DWORD *)&atoken[30] = v71;
    *(_WORD *)&atoken[34] = 2113;
    *(void *)&atoken[36] = v5;
    _os_log_impl(&dword_2432B6000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] returning cached preference domain %{private}@", atoken, 0x2Cu);
  }
  objc_msgSend((id)sMostRecentProprietaryDefaultDomainLookupTimeByPID, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", FigGetUpTimeNanoseconds()), v72);
  return v5;
}

+ (CMIOExtensionProvider)providerWithSource:(id)source clientQueue:(dispatch_queue_t)clientQueue
{
  long long v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSource:source clientQueue:clientQueue];

  return (CMIOExtensionProvider *)v4;
}

- (CMIOExtensionProvider)initWithSource:(id)source clientQueue:(dispatch_queue_t)clientQueue
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)CMIOExtensionProvider;
  v6 = [(CMIOExtensionProvider *)&v18 init];
  if (v6)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        *(_DWORD *)buf = 136316418;
        v20 = v9;
        __int16 v21 = 1024;
        int v22 = 1679;
        __int16 v23 = 2080;
        v24 = "-[CMIOExtensionProvider initWithSource:clientQueue:]";
        __int16 v25 = 2048;
        uint64_t v26 = (uint64_t)v6;
        __int16 v27 = 2048;
        id v28 = source;
        __int16 v29 = 2048;
        dispatch_queue_t v30 = clientQueue;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s initializing provider %p with source %p : queue %p", buf, 0x3Au);
      }
    }
    objc_storeWeak((id *)&v6->_source, source);
    if (clientQueue)
    {
      TargetingWorkloopWithPriority = clientQueue;
    }
    else
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      TargetingWorkloopWithPriority = FigDispatchQueueCreateTargetingWorkloopWithPriority();
    }
    v6->_clientQueue = (OS_dispatch_queue *)TargetingWorkloopWithPriority;
    v6->_contextsMapLock._os_unfair_lock_opaque = 0;
    v6->_contextsRegistration = (NSMutableArray *)objc_opt_new();
    v6->_contextsMap = (NSMutableDictionary *)objc_opt_new();
    v6->_pendingCountMap = (NSMutableDictionary *)objc_opt_new();
    v6->_connectedClientsLock._os_unfair_lock_opaque = 0;
    v6->_connectedClients = (NSArray *)objc_opt_new();
    v6->_devicesMapLock._os_unfair_lock_opaque = 0;
    v6->_devicesMap = (NSMutableDictionary *)objc_opt_new();
    v6->_streamsMapLock._os_unfair_lock_opaque = 0;
    v6->_streamsMap = (NSMutableDictionary *)objc_opt_new();
    v6->_devicesLock._os_unfair_lock_opaque = 0;
    v6->_devices = (NSMutableArray *)objc_opt_new();
    v6->_changedDeviceIDsLock._os_unfair_lock_opaque = 0;
    v6->_changedDeviceIDs = 0;
    v6->_changedStreamIDsLock._os_unfair_lock_opaque = 0;
    v6->_changedStreamIDs = 0;
    v6->_changedPropertiesLock._os_unfair_lock_opaque = 0;
    v6->_changedProperties = (NSMutableDictionary *)objc_opt_new();
    if ([+[CMIOExtensionProviderServer sharedServer] internalDaemon])
    {
      v11 = CMIOLog();
      if (v11)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProvider initWithSource:clientQueue:]();
        }
      }
    }
    v6->_nonStreamingProxyFrontedExtensionPIDs = (NSArray *)objc_opt_new();
    v6->_nonStreamingProxyFrontedExtensionPIDsHasChanged = 0;
    v6->_description = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionProvider>"];
    if (gProvider)
    {

      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"There should be only one CMIOProvider per extension."];
      return 0;
    }
    else
    {
      gProvider = v6;
      v13 = CMIOLog();
      if (v13)
      {
        long long v14 = v13;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          uint64_t v16 = gProvider;
          int v17 = [(id)gProvider retainCount];
          *(_DWORD *)buf = 136316162;
          v20 = v15;
          __int16 v21 = 1024;
          int v22 = 1739;
          __int16 v23 = 2080;
          v24 = "-[CMIOExtensionProvider initWithSource:clientQueue:]";
          __int16 v25 = 2048;
          uint64_t v26 = v16;
          __int16 v27 = 1024;
          LODWORD(v28) = v17;
          _os_log_impl(&dword_2432B6000, v14, OS_LOG_TYPE_DEFAULT, "%s:%d:%s Retained and set gProvider to %p (retain count %d)", buf, 0x2Cu);
        }
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = CMIOLog();
  if (v3)
  {
    long long v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v14 = 1024;
      int v15 = 1752;
      __int16 v16 = 2080;
      int v17 = "-[CMIOExtensionProvider dealloc]";
      __int16 v18 = 2048;
      uint64_t v19 = gProvider;
      _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s dealloc starting, shared provider reference %p", buf, 0x26u);
    }
  }
  gProvider = 0;

  v5 = CMIOLog();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      *(_DWORD *)buf = 136315650;
      v13 = v7;
      __int16 v14 = 1024;
      int v15 = 1773;
      __int16 v16 = 2080;
      int v17 = "-[CMIOExtensionProvider dealloc]";
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s calling [super dealloc]", buf, 0x1Cu);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CMIOExtensionProvider;
  [(CMIOExtensionProvider *)&v11 dealloc];
  v8 = CMIOLog();
  if (v8)
  {
    v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      *(_DWORD *)buf = 136315650;
      v13 = v10;
      __int16 v14 = 1024;
      int v15 = 1776;
      __int16 v16 = 2080;
      int v17 = "-[CMIOExtensionProvider dealloc]";
      _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s dealloc done", buf, 0x1Cu);
    }
  }
}

- (id)description
{
  v2 = self->_description;

  return v2;
}

+ (id)sharedProvider
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)&gProviderLock);
  id v2 = (id)gProvider;
  os_unfair_lock_unlock((os_unfair_lock_t)&gProviderLock);
  v3 = CMIOLogLevel(1);
  if (v3)
  {
    long long v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136316162;
      v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v8 = 1024;
      int v9 = 1794;
      __int16 v10 = 2080;
      objc_super v11 = "+[CMIOExtensionProvider sharedProvider]";
      __int16 v12 = 2048;
      id v13 = v2;
      __int16 v14 = 1024;
      int v15 = [v2 retainCount];
      _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s returning autoreleased global provider %p (its retain count is %d)", (uint8_t *)&v6, 0x2Cu);
    }
  }
  return v2;
}

+ (id)internalProperties
{
  if (internalProperties_onceToken_330 != -1) {
    dispatch_once(&internalProperties_onceToken_330, &__block_literal_global_332);
  }
  return (id)internalProperties_gInternalProviderProperties;
}

uint64_t __43__CMIOExtensionProvider_internalProperties__block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", 0x26F89C430, 0);
  internalProperties_gInternalProviderProperties = result;
  return result;
}

+ (id)internalWritableProperties
{
  return 0;
}

+ (void)startServiceWithProvider:(CMIOExtensionProvider *)provider
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v4 = (void *)MEMORY[0x245679360](a1, a2);
  v5 = +[CMIOExtensionProvider sharedProvider];
  int v6 = (void *)[MEMORY[0x263F086E0] mainBundle];
  v7 = CMIOLog();
  if (v7)
  {
    __int16 v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136316674;
      uint64_t v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v17 = 1024;
      int v18 = 1821;
      __int16 v19 = 2080;
      uint64_t v20 = "+[CMIOExtensionProvider startServiceWithProvider:]";
      __int16 v21 = 2048;
      int v22 = provider;
      __int16 v23 = 2112;
      uint64_t v24 = [v6 bundleIdentifier];
      __int16 v25 = 2048;
      uint64_t v26 = v5;
      __int16 v27 = 1024;
      int v28 = [(CMIOExtensionProvider *)v5 retainCount];
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %p (%@), autoreleased global provider %p (its retain count is %d)", (uint8_t *)&v15, 0x40u);
    }
  }
  int v9 = (void *)MEMORY[0x263EFF4A0];
  if (v5 != provider) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Invalid provider."];
  }
  uint64_t v10 = [v6 objectForInfoDictionaryKey:@"CMIOExtension"];
  if (!v10 || (objc_super v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || ![v11 count]) {
    [MEMORY[0x263EFF940] raise:*v9 format:@"CMIOExtension information dictionary missing from the Info.plist."];
  }
  if (startServiceWithProvider__onceToken != -1) {
    dispatch_once(&startServiceWithProvider__onceToken, &__block_literal_global_341);
  }
  __int16 v12 = CMIOLog();
  if (v12)
  {
    id v13 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      int v15 = 136315650;
      uint64_t v16 = v14;
      __int16 v17 = 1024;
      int v18 = 1851;
      __int16 v19 = 2080;
      uint64_t v20 = "+[CMIOExtensionProvider startServiceWithProvider:]";
      _os_log_impl(&dword_2432B6000, v13, OS_LOG_TYPE_DEFAULT, "%s:%d:%s leaving", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

uint64_t __50__CMIOExtensionProvider_startServiceWithProvider___block_invoke()
{
  CMIOPreferences();
  global_queue = dispatch_get_global_queue(21, 0);
  gSignalHandlerSource = (uint64_t)dispatch_source_create(MEMORY[0x263EF83F0], 0xFuLL, 0, global_queue);
  dispatch_source_set_event_handler((dispatch_source_t)gSignalHandlerSource, &__block_literal_global_343);
  dispatch_activate((dispatch_object_t)gSignalHandlerSource);
  v1 = +[CMIOExtensionProviderServer sharedServer];

  return [(CMIOExtensionProviderServer *)v1 start];
}

void __50__CMIOExtensionProvider_startServiceWithProvider___block_invoke_2()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v0 = gIgnoreSIGTERM;
  v1 = CMIOLog();
  id v2 = v1;
  if (v0 != 1)
  {
    if (v1 && os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315650;
      long long v4 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v5 = 1024;
      int v6 = 1842;
      __int16 v7 = 2080;
      __int16 v8 = "+[CMIOExtensionProvider startServiceWithProvider:]_block_invoke";
      _os_log_impl(&dword_2432B6000, v2, OS_LOG_TYPE_DEFAULT, "%s:%d:%s SIGTERM signal received, exiting", (uint8_t *)&v3, 0x1Cu);
    }
    exit(0);
  }
  if (v1)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315650;
      long long v4 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v5 = 1024;
      int v6 = 1839;
      __int16 v7 = 2080;
      __int16 v8 = "+[CMIOExtensionProvider startServiceWithProvider:]_block_invoke_2";
      _os_log_impl(&dword_2432B6000, v2, OS_LOG_TYPE_DEFAULT, "%s:%d:%s SIGTERM signal received, but told to ignore", (uint8_t *)&v3, 0x1Cu);
    }
  }
}

+ (void)stopServiceWithProvider:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  long long v4 = (void *)MEMORY[0x245679360](a1, a2);
  id v5 = +[CMIOExtensionProvider sharedProvider];
  int v6 = CMIOLog();
  if (v6)
  {
    __int16 v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136316418;
      dispatch_queue_t v30 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v31 = 1024;
      int v32 = 1858;
      __int16 v33 = 2080;
      v34 = "+[CMIOExtensionProvider stopServiceWithProvider:]";
      __int16 v35 = 2048;
      id v36 = a3;
      __int16 v37 = 2048;
      id v38 = v5;
      __int16 v39 = 1024;
      int v40 = [v5 retainCount];
      _os_log_impl(&dword_2432B6000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %p, autoreleased global provider %p (its retain count is %d)", (uint8_t *)&v29, 0x36u);
    }
  }
  if (v5 != a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Invalid provider."];
  }
  __int16 v8 = CMIOLog();
  if (v8)
  {
    uint64_t v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      int v29 = 136315906;
      dispatch_queue_t v30 = v10;
      __int16 v31 = 1024;
      int v32 = 1863;
      __int16 v33 = 2080;
      v34 = "+[CMIOExtensionProvider stopServiceWithProvider:]";
      __int16 v35 = 2112;
      id v36 = a3;
      _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s removing all contexts from %@", (uint8_t *)&v29, 0x26u);
    }
  }
  [a3 removeAllProviderContexts];
  objc_super v11 = CMIOLog();
  if (v11)
  {
    __int16 v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v14 = +[CMIOExtensionProviderServer sharedServer];
      int v29 = 136315906;
      dispatch_queue_t v30 = v13;
      __int16 v31 = 1024;
      int v32 = 1865;
      __int16 v33 = 2080;
      v34 = "+[CMIOExtensionProvider stopServiceWithProvider:]";
      __int16 v35 = 2112;
      id v36 = v14;
      _os_log_impl(&dword_2432B6000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s stopping shared server %@", (uint8_t *)&v29, 0x26u);
    }
  }
  [+[CMIOExtensionProviderServer sharedServer] stop];
  int v15 = CMIOLog();
  if (v15)
  {
    uint64_t v16 = v15;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      int v18 = +[CMIOExtensionProviderServer sharedServer];
      int v29 = 136315906;
      dispatch_queue_t v30 = v17;
      __int16 v31 = 1024;
      int v32 = 1867;
      __int16 v33 = 2080;
      v34 = "+[CMIOExtensionProvider stopServiceWithProvider:]";
      __int16 v35 = 2112;
      id v36 = v18;
      _os_log_impl(&dword_2432B6000, v16, OS_LOG_TYPE_DEFAULT, "%s:%d:%s shared server %@ has been stopped", (uint8_t *)&v29, 0x26u);
    }
  }
  __int16 v19 = CMIOLog();
  if (v19)
  {
    uint64_t v20 = v19;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      int v22 = [v5 retainCount];
      int v29 = 136316162;
      dispatch_queue_t v30 = v21;
      __int16 v31 = 1024;
      int v32 = 1868;
      __int16 v33 = 2080;
      v34 = "+[CMIOExtensionProvider stopServiceWithProvider:]";
      __int16 v35 = 2048;
      id v36 = v5;
      __int16 v37 = 1024;
      LODWORD(v38) = v22;
      _os_log_impl(&dword_2432B6000, v20, OS_LOG_TYPE_DEFAULT, "%s:%d:%s releasing shared provider reference %p (its retain count is %d)", (uint8_t *)&v29, 0x2Cu);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)&gProviderLock);

  gProvider = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&gProviderLock);
  __int16 v23 = CMIOLog();
  if (v23)
  {
    uint64_t v24 = v23;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v25 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      int v29 = 136315650;
      dispatch_queue_t v30 = v25;
      __int16 v31 = 1024;
      int v32 = 1876;
      __int16 v33 = 2080;
      v34 = "+[CMIOExtensionProvider stopServiceWithProvider:]";
      _os_log_impl(&dword_2432B6000, v24, OS_LOG_TYPE_DEFAULT, "%s:%d:%s released and set shared provider reference to nil", (uint8_t *)&v29, 0x1Cu);
    }
  }
  uint64_t v26 = CMIOLog();
  if (v26)
  {
    __int16 v27 = v26;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      int v29 = 136315650;
      dispatch_queue_t v30 = v28;
      __int16 v31 = 1024;
      int v32 = 1878;
      __int16 v33 = 2080;
      v34 = "+[CMIOExtensionProvider stopServiceWithProvider:]";
      _os_log_impl(&dword_2432B6000, v27, OS_LOG_TYPE_DEFAULT, "%s:%d:%s leaving", (uint8_t *)&v29, 0x1Cu);
    }
  }
}

+ (void)ignoreSIGTERM
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = CMIOLog();
  if (v2)
  {
    int v3 = v2;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315650;
      id v5 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v6 = 1024;
      int v7 = 1883;
      __int16 v8 = 2080;
      uint64_t v9 = "+[CMIOExtensionProvider ignoreSIGTERM]";
      _os_log_impl(&dword_2432B6000, v3, OS_LOG_TYPE_DEFAULT, "%s:%d:%s will be ignoring the SIGTERM signal", (uint8_t *)&v4, 0x1Cu);
    }
  }
  gIgnoreSIGTERM = 1;
}

- (dispatch_queue_t)clientQueue
{
  return (dispatch_queue_t)self->_clientQueue;
}

- (NSArray)connectedClients
{
  p_connectedClientsLock = &self->_connectedClientsLock;
  os_unfair_lock_lock(&self->_connectedClientsLock);
  int v4 = self->_connectedClients;
  os_unfair_lock_unlock(p_connectedClientsLock);

  return v4;
}

- (void)setConnectedClients:(id)a3
{
  p_connectedClientsLock = &self->_connectedClientsLock;
  os_unfair_lock_lock(&self->_connectedClientsLock);
  connectedClients = self->_connectedClients;
  self->_connectedClients = (NSArray *)a3;
  os_unfair_lock_unlock(p_connectedClientsLock);
}

- (NSArray)devices
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v3 = CMIOLogLevel(1);
  if (v3)
  {
    int v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315906;
      uint64_t v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v10 = 1024;
      int v11 = 1917;
      __int16 v12 = 2080;
      id v13 = "-[CMIOExtensionProvider devices]";
      __int16 v14 = 2112;
      int v15 = self;
      _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v8, 0x26u);
    }
  }
  p_devicesLock = &self->_devicesLock;
  os_unfair_lock_lock(&self->_devicesLock);
  __int16 v6 = (void *)[(NSMutableArray *)self->_devices copy];
  os_unfair_lock_unlock(p_devicesLock);
  return (NSArray *)v6;
}

- (BOOL)addDevice:(CMIOExtensionDevice *)device error:(NSError *)outError
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  int v7 = CMIOLogLevel(1);
  if (v7)
  {
    int v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v26 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v27 = 1024;
      int v28 = 1931;
      __int16 v29 = 2080;
      dispatch_queue_t v30 = "-[CMIOExtensionProvider addDevice:error:]";
      __int16 v31 = 2112;
      int v32 = self;
      __int16 v33 = 2112;
      v34 = device;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  if (!device || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    int v15 = CMIOLog();
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionProvider addDevice:error:]();
      if (!outError) {
        return 0;
      }
    }
    else if (!outError)
    {
      return 0;
    }
    __int16 v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08410];
    uint64_t v23 = *MEMORY[0x263F08320];
    uint64_t v24 = @"Invalid device";
    __int16 v12 = NSDictionary;
    id v13 = &v24;
    __int16 v14 = &v23;
    goto LABEL_15;
  }
  os_unfair_lock_lock(&self->_devicesLock);
  if ([(NSMutableArray *)self->_devices containsObject:device])
  {
    os_unfair_lock_unlock(&self->_devicesLock);
    uint64_t v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionProvider addDevice:error:]();
      if (outError) {
        goto LABEL_10;
      }
    }
    else if (outError)
    {
LABEL_10:
      __int16 v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = *MEMORY[0x263F08410];
      uint64_t v21 = *MEMORY[0x263F08320];
      int v22 = @"Device already included";
      __int16 v12 = NSDictionary;
      id v13 = &v22;
      __int16 v14 = &v21;
LABEL_15:
      uint64_t v16 = (NSError *)objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, -50, objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1, v21, v22, v23, v24));
      BOOL result = 0;
      *outError = v16;
      return result;
    }
  }
  else
  {
    [(NSMutableArray *)self->_devices addObject:device];
    os_unfair_lock_unlock(&self->_devicesLock);
    int v18 = CMIOLog();
    if (v18)
    {
      __int16 v19 = v18;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        *(_DWORD *)buf = 136316162;
        uint64_t v26 = v20;
        __int16 v27 = 1024;
        int v28 = 1952;
        __int16 v29 = 2080;
        dispatch_queue_t v30 = "-[CMIOExtensionProvider addDevice:error:]";
        __int16 v31 = 2114;
        int v32 = self;
        __int16 v33 = 2114;
        v34 = device;
        _os_log_impl(&dword_2432B6000, v19, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, %{public}@", buf, 0x30u);
      }
    }
    if ([(CMIOExtensionProvider *)self registerDevice:device error:outError])
    {
      [(CMIOExtensionDevice *)device setParent:self];
      return 1;
    }
    os_unfair_lock_lock(&self->_devicesLock);
    [(NSMutableArray *)self->_devices removeObject:device];
    os_unfair_lock_unlock(&self->_devicesLock);
  }
  return 0;
}

- (BOOL)removeDevice:(CMIOExtensionDevice *)device error:(NSError *)outError
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  int v7 = CMIOLogLevel(1);
  if (v7)
  {
    int v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v26 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v27 = 1024;
      int v28 = 1976;
      __int16 v29 = 2080;
      dispatch_queue_t v30 = "-[CMIOExtensionProvider removeDevice:error:]";
      __int16 v31 = 2112;
      int v32 = self;
      __int16 v33 = 2112;
      v34 = device;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  if (!device || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionProvider removeDevice:error:]();
      if (!outError) {
        return 0;
      }
    }
    else if (!outError)
    {
      return 0;
    }
    __int16 v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v23 = *MEMORY[0x263F08320];
    uint64_t v24 = @"Invalid device";
    uint64_t v16 = NSDictionary;
    __int16 v17 = &v24;
    int v18 = &v23;
LABEL_15:
    __int16 v19 = (NSError *)objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, -50, objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1, v21, v22, v23, v24));
    BOOL result = 0;
    *outError = v19;
    return result;
  }
  os_unfair_lock_lock(&self->_devicesLock);
  if (![(NSMutableArray *)self->_devices containsObject:device])
  {
    os_unfair_lock_unlock(&self->_devicesLock);
    uint64_t v20 = CMIOLog();
    if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionProvider removeDevice:error:]();
      if (outError) {
        goto LABEL_19;
      }
    }
    else if (outError)
    {
LABEL_19:
      __int16 v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F08410];
      uint64_t v21 = *MEMORY[0x263F08320];
      int v22 = @"Device not included";
      uint64_t v16 = NSDictionary;
      __int16 v17 = &v22;
      int v18 = &v21;
      goto LABEL_15;
    }
    return 0;
  }
  [(NSMutableArray *)self->_devices removeObject:device];
  os_unfair_lock_unlock(&self->_devicesLock);
  uint64_t v9 = CMIOLog();
  if (v9)
  {
    __int16 v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      *(_DWORD *)buf = 136316162;
      uint64_t v26 = v11;
      __int16 v27 = 1024;
      int v28 = 2004;
      __int16 v29 = 2080;
      dispatch_queue_t v30 = "-[CMIOExtensionProvider removeDevice:error:]";
      __int16 v31 = 2114;
      int v32 = self;
      __int16 v33 = 2114;
      v34 = device;
      _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, %{public}@", buf, 0x30u);
    }
  }
  [(CMIOExtensionProvider *)self unregisterDevice:device error:outError];
  return 1;
}

- (void)notifyPropertiesChanged:(NSDictionary *)propertyStates
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = CMIOLogLevel(1);
  if (v5)
  {
    __int16 v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v11 = 1024;
      int v12 = 2012;
      __int16 v13 = 2080;
      __int16 v14 = "-[CMIOExtensionProvider notifyPropertiesChanged:]";
      __int16 v15 = 2112;
      uint64_t v16 = self;
      __int16 v17 = 2112;
      int v18 = propertyStates;
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, propertyStates %@", buf, 0x30u);
    }
  }
  os_unfair_lock_lock(&self->_changedPropertiesLock);
  [(NSMutableDictionary *)self->_changedProperties addEntriesFromDictionary:propertyStates];
  os_unfair_lock_unlock(&self->_changedPropertiesLock);
  clientQueue = self->_clientQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__CMIOExtensionProvider_notifyPropertiesChanged___block_invoke;
  v8[3] = &unk_26517BF78;
  v8[4] = self;
  v8[5] = propertyStates;
  dispatch_async(clientQueue, v8);
}

void __49__CMIOExtensionProvider_notifyPropertiesChanged___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 144));
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 152) copy];
  [*(id *)(*(void *)(a1 + 32) + 152) removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 144));
  if ([v2 count])
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    int v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) allValues];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) pluginPropertiesChanged:*(void *)(a1 + 40)];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (int64_t)authorizationStatusForClient:(id)a3 mediaType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  p_contextsMapLock = &self->_contextsMapLock;
  os_unfair_lock_lock(&self->_contextsMapLock);
  id v8 = (id)-[NSMutableDictionary objectForKey:](self->_contextsMap, "objectForKey:", [a3 clientID]);
  os_unfair_lock_unlock(p_contextsMapLock);
  if (!v8) {
    return 0;
  }
  long long v9 = (void *)[v8 clientInfo];

  return [v9 authorizationStatusForMediaType:v4];
}

- (void)requestAccessForClient:(id)a3 mediaType:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  p_contextsMapLock = &self->_contextsMapLock;
  os_unfair_lock_lock(&self->_contextsMapLock);
  id v10 = (id)-[NSMutableDictionary objectForKey:](self->_contextsMap, "objectForKey:", [a3 clientID]);
  os_unfair_lock_unlock(p_contextsMapLock);
  if (v10)
  {
    long long v11 = (void *)[v10 clientInfo];
    [v11 requestAccessForMediaType:v6 reply:a5];
  }
  else
  {
    int v12 = (void (*)(id, void))*((void *)a5 + 2);
    v12(a5, 0);
  }
}

- (void)removeAllProviderContexts
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v3 = CMIOLogLevel(1);
  if (v3)
  {
    uint64_t v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v18 = 1024;
      int v19 = 2083;
      __int16 v20 = 2080;
      uint64_t v21 = "-[CMIOExtensionProvider removeAllProviderContexts]";
      __int16 v22 = 2112;
      uint64_t v23 = self;
      _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
    }
  }
  os_unfair_lock_lock(&self->_contextsMapLock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_contextsMap allValues];
  if ([v5 count]) {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v5];
  }
  else {
    uint64_t v6 = 0;
  }
  os_unfair_lock_unlock(&self->_contextsMapLock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(CMIOExtensionProvider *)self removeProviderContext:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

uint64_t __64__CMIOExtensionProvider_proprietaryDefaultsDomainForAuditToken___block_invoke()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  sProprietaryDefaultsDomainsByPID = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  sMostRecentProprietaryDefaultDomainLookupTimeByPID = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  char v6 = 0;
  int IntegerValue = CMIOPreferencesGetIntegerValue(@"proprietary_default_domain_most_recent_pid_lookup_time_limit", &v6);
  if (v6) {
    int v1 = IntegerValue;
  }
  else {
    int v1 = 15;
  }
  sPostTerminationTimoutForClearingEntryFromProprietaryDefaultsDomainsByPID = v1;
  id v2 = CMIOLog();
  if (v2)
  {
    int v3 = v2;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      *(_DWORD *)buf = 136315906;
      uint64_t v8 = v4;
      __int16 v9 = 1024;
      int v10 = 2128;
      __int16 v11 = 2080;
      long long v12 = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = sPostTerminationTimoutForClearingEntryFromProprietaryDefaultsDomainsByPID;
      _os_log_impl(&dword_2432B6000, v3, OS_LOG_TYPE_DEFAULT, "%s:%d:%s stale pid timeout: %d seconds", buf, 0x22u);
    }
  }
  getSTExecutableIdentityResolverClass();
  uint64_t result = objc_opt_respondsToSelector();
  sResponsibleIdentityForAuditTokenIsSupported = result & 1;
  return result;
}

+ (id)newActivityAttributionWithToken:(id *)a3
{
  return 0;
}

- (id)_clientQueue_internalPropertyStatesForProperties:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = CMIOLogLevel(1);
  if (v5)
  {
    char v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v22 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v23 = 1024;
      int v24 = 2320;
      __int16 v25 = 2080;
      uint64_t v26 = "-[CMIOExtensionProvider _clientQueue_internalPropertyStatesForProperties:]";
      __int16 v27 = 2112;
      int v28 = self;
      __int16 v29 = 2112;
      id v30 = a3;
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, properties %@", buf, 0x30u);
    }
  }
  if (a3 && ![a3 containsObject:0x26F89C430]) {
    return 0;
  }
  uint64_t v7 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [(CMIOExtensionProvider *)self devices];
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12++), "deviceID"), "UUIDString"));
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  __int16 v13 = [[CMIOExtensionPropertyState alloc] initWithValue:v7 attributes:+[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute]];

  int v14 = (void *)[NSDictionary dictionaryWithObject:v13 forKey:0x26F89C430];
  return v14;
}

- (void)beginProviderContextRegistration:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = CMIOLogLevel(1);
  if (v5)
  {
    char v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v11 = 1024;
      int v12 = 2339;
      __int16 v13 = 2080;
      int v14 = "-[CMIOExtensionProvider beginProviderContextRegistration:]";
      __int16 v15 = 2112;
      long long v16 = self;
      __int16 v17 = 2112;
      id v18 = a3;
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__CMIOExtensionProvider_beginProviderContextRegistration___block_invoke;
  v8[3] = &unk_26517BF78;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(clientQueue, v8);
}

uint64_t __58__CMIOExtensionProvider_beginProviderContextRegistration___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

- (void)finishProviderContextRegistration:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = CMIOLogLevel(1);
  if (v5)
  {
    char v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v11 = 1024;
      int v12 = 2348;
      __int16 v13 = 2080;
      int v14 = "-[CMIOExtensionProvider finishProviderContextRegistration:]";
      __int16 v15 = 2112;
      long long v16 = self;
      __int16 v17 = 2112;
      id v18 = a3;
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__CMIOExtensionProvider_finishProviderContextRegistration___block_invoke;
  v8[3] = &unk_26517BF78;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(clientQueue, v8);
}

uint64_t __59__CMIOExtensionProvider_finishProviderContextRegistration___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 40);
  if (([*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    int v3 = CMIOLog();
    if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59__CMIOExtensionProvider_finishProviderContextRegistration___block_invoke_cold_3();
    }
    uint64_t v4 = CMIOLog();
    uint64_t v5 = v4;
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      char v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      id v7 = *v2;
      *(_DWORD *)buf = 136315906;
      id v38 = v6;
      __int16 v39 = 1024;
      int v40 = 2353;
      __int16 v41 = 2080;
      v42 = "-[CMIOExtensionProvider finishProviderContextRegistration:]_block_invoke";
      __int16 v43 = 2112;
      id v44 = v7;
      _os_log_impl(&dword_2432B6000, v5, OS_LOG_TYPE_INFO, "%s:%d:%s Unregistered provider context %@, don't be surprised if things go badly", buf, 0x26u);
    }
  }
  uint64_t v27 = 0;
  if (objc_msgSend(objc_loadWeak((id *)(*(void *)(a1 + 32) + 176)), "connectClient:error:", objc_msgSend(*(id *)(a1 + 40), "clientInfo"), &v27))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setObject:forKey:", *(void *)(a1 + 40), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "clientInfo"), "clientID"));
    uint64_t v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) allValues];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    uint64_t v9 = (void *)[MEMORY[0x263EFF980] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v24;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v12++), "clientInfo"));
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v10);
    }
    [*(id *)(a1 + 32) setConnectedClients:v9];
  }
  else
  {
    __int16 v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __59__CMIOExtensionProvider_finishProviderContextRegistration___block_invoke_cold_1();
    }
    int v14 = CMIOLog();
    __int16 v15 = v14;
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      long long v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      uint64_t v17 = [*v2 clientInfo];
      *(_DWORD *)__int16 v29 = 136315906;
      id v30 = v16;
      __int16 v31 = 1024;
      int v32 = 2368;
      __int16 v33 = 2080;
      v34 = "-[CMIOExtensionProvider finishProviderContextRegistration:]_block_invoke";
      __int16 v35 = 2112;
      uint64_t v36 = v17;
      _os_log_impl(&dword_2432B6000, v15, OS_LOG_TYPE_INFO, "%s:%d:%s Refusing connection(%@)", v29, 0x26u);
    }
  }
  id v18 = CMIOLog();
  uint64_t v19 = v18;
  if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    __int16 v20 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
    uint64_t v21 = [*v2 clientInfo];
    *(_DWORD *)__int16 v29 = 136315906;
    id v30 = v20;
    __int16 v31 = 1024;
    int v32 = 2386;
    __int16 v33 = 2080;
    v34 = "-[CMIOExtensionProvider finishProviderContextRegistration:]_block_invoke";
    __int16 v35 = 2112;
    uint64_t v36 = v21;
    _os_log_impl(&dword_2432B6000, v19, OS_LOG_TYPE_INFO, "%s:%d:%s New connection(%@)", v29, 0x26u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (void)removeProviderContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = CMIOLogLevel(1);
  if (v5)
  {
    char v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v11 = 1024;
      int v12 = 2393;
      __int16 v13 = 2080;
      int v14 = "-[CMIOExtensionProvider removeProviderContext:]";
      __int16 v15 = 2112;
      long long v16 = self;
      __int16 v17 = 2112;
      id v18 = a3;
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__CMIOExtensionProvider_removeProviderContext___block_invoke;
  v8[3] = &unk_26517BF78;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async_and_wait(clientQueue, v8);
}

uint64_t __47__CMIOExtensionProvider_removeProviderContext___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 40);
  if (([*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    int v3 = CMIOLog();
    if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __47__CMIOExtensionProvider_removeProviderContext___block_invoke_cold_2();
    }
    uint64_t v4 = CMIOLog();
    uint64_t v5 = v4;
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      char v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      id v7 = *v2;
      *(_DWORD *)buf = 136315906;
      v52 = v6;
      __int16 v53 = 1024;
      int v54 = 2399;
      __int16 v55 = 2080;
      v56 = "-[CMIOExtensionProvider removeProviderContext:]_block_invoke";
      __int16 v57 = 2112;
      id v58 = v7;
      _os_log_impl(&dword_2432B6000, v5, OS_LOG_TYPE_INFO, "%s:%d:%s Unregistered provider context %@, don't be surprised if things go badly", buf, 0x26u);
    }
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = (id)[*(id *)(a1 + 32) devices];
  uint64_t v31 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v45;
    uint64_t v27 = *MEMORY[0x263F08320];
    uint64_t v28 = *MEMORY[0x263F08410];
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v45 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        __int16 v33 = v8;
        id v34 = (id)objc_msgSend(v8, "streams", v27, v28);
        uint64_t v9 = [v34 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v41 != v10) {
                objc_enumerationMutation(v34);
              }
              int v12 = *(void **)(*((void *)&v40 + 1) + 8 * j);
              __int16 v13 = objc_msgSend(v12, "_clientQueue_streamingClientsMap");
              if (objc_msgSend(v13, "objectForKey:", objc_msgSend((id)objc_msgSend(*v2, "clientInfo"), "clientID"))
                && [v13 count] == 1)
              {
                __int16 v39 = 0;
                if ((objc_msgSend((id)objc_msgSend(v12, "source"), "stopStreamAndReturnError:", &v39) & 1) == 0)
                {
                  int v14 = CMIOLog();
                  __int16 v15 = v14;
                  if (v14)
                  {
                    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                    {
                      long long v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                      *(_DWORD *)buf = 136315906;
                      v52 = v16;
                      __int16 v53 = 1024;
                      int v54 = 2417;
                      __int16 v55 = 2080;
                      v56 = "-[CMIOExtensionProvider removeProviderContext:]_block_invoke";
                      __int16 v57 = 2112;
                      id v58 = v39;
                      _os_log_error_impl(&dword_2432B6000, v15, OS_LOG_TYPE_ERROR, "%s:%d:%s Could not stop streaming %@", buf, 0x26u);
                    }
                  }
                }
                objc_msgSend(v12, "_clientQueue_removeStreamingClient:", objc_msgSend(*(id *)(a1 + 40), "clientInfo"));
                objc_msgSend(*(id *)(a1 + 32), "_clientQueue_notifyIsRunningSomewhereForStream:", v12);
              }
              else
              {
                objc_msgSend(v12, "_clientQueue_removeStreamingClient:", objc_msgSend(*v2, "clientInfo"));
              }
              objc_msgSend(*(id *)(a1 + 32), "_clientQueue_removePendingStartStreamCountForClient:streamID:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "clientInfo"), "clientID"), objc_msgSend(v12, "streamID"));
              objc_msgSend(*(id *)(a1 + 32), "removeSystemStatusAttributionsForClient:stream:", objc_msgSend(*(id *)(a1 + 40), "clientInfo"), v12);
            }
            uint64_t v9 = [v34 countByEnumeratingWithState:&v40 objects:v49 count:16];
          }
          while (v9);
        }
        int v17 = [v33 deviceControlPID];
        if (v17 == objc_msgSend((id)objc_msgSend(*v2, "clientInfo"), "pid"))
        {
          [v33 setDeviceControlPID:0xFFFFFFFFLL];
          id v18 = objc_opt_new();
          uint64_t v19 = [CMIOExtensionPropertyState alloc];
          __int16 v20 = -[CMIOExtensionPropertyState initWithValue:](v19, "initWithValue:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v33, "deviceControlPID")));
          [v18 setObject:v20 forKey:0x26F89C510];

          [v33 notifyPropertiesChanged:v18];
        }
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v31);
  }
  objc_msgSend(objc_loadWeak((id *)(*(void *)(a1 + 32) + 176)), "disconnectClient:", objc_msgSend(*(id *)(a1 + 40), "clientInfo"));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "removeObjectForKey:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "clientInfo"), "clientID"));
  uint64_t v21 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) allValues];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  __int16 v22 = (void *)[MEMORY[0x263EFF980] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        objc_msgSend(v22, "addObject:", objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * k), "clientInfo"));
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v48 count:16];
    }
    while (v23);
  }
  [*(id *)(a1 + 32) setConnectedClients:v22];
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (BOOL)registerDevice:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = CMIOLogLevel(1);
  if (v7)
  {
    uint64_t v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      int v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v18 = 1024;
      int v19 = 2468;
      __int16 v20 = 2080;
      uint64_t v21 = "-[CMIOExtensionProvider registerDevice:error:]";
      __int16 v22 = 2112;
      uint64_t v23 = self;
      __int16 v24 = 2112;
      id v25 = a3;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  os_unfair_lock_lock(&self->_devicesMapLock);
  if (-[NSMutableDictionary objectForKey:](self->_devicesMap, "objectForKey:", [a3 deviceID]))
  {
    os_unfair_lock_unlock(&self->_devicesMapLock);
    uint64_t v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionProvider registerDevice:error:]();
      if (a4) {
        goto LABEL_8;
      }
    }
    else if (a4)
    {
LABEL_8:
      uint64_t v10 = *MEMORY[0x263F08410];
      uint64_t v14 = *MEMORY[0x263F08320];
      __int16 v15 = @"deviceID already included";
      __int16 v11 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v10, -50, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      BOOL result = 0;
      *a4 = v11;
      return result;
    }
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_devicesMap, "setObject:forKey:", a3, [a3 deviceID]);
    uint64_t v13 = [(NSMutableDictionary *)self->_devicesMap allKeys];
    os_unfair_lock_unlock(&self->_devicesMapLock);
    if ([a3 didRegister:a4])
    {
      [(CMIOExtensionProvider *)self notifyAvailableDevicesChanged:v13];
      return 1;
    }
    os_unfair_lock_lock(&self->_devicesMapLock);
    -[NSMutableDictionary removeObjectForKey:](self->_devicesMap, "removeObjectForKey:", [a3 deviceID]);
    os_unfair_lock_unlock(&self->_devicesMapLock);
  }
  return 0;
}

- (BOOL)unregisterDevice:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = CMIOLogLevel(1);
  if (v7)
  {
    uint64_t v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      int v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v18 = 1024;
      int v19 = 2505;
      __int16 v20 = 2080;
      uint64_t v21 = "-[CMIOExtensionProvider unregisterDevice:error:]";
      __int16 v22 = 2112;
      uint64_t v23 = self;
      __int16 v24 = 2112;
      id v25 = a3;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  os_unfair_lock_lock(&self->_devicesMapLock);
  uint64_t v9 = -[NSMutableDictionary objectForKey:](self->_devicesMap, "objectForKey:", [a3 deviceID]);
  if (!v9)
  {
    os_unfair_lock_unlock(&self->_devicesMapLock);
    __int16 v11 = CMIOLog();
    if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionProvider unregisterDevice:error:]();
      if (!a4) {
        return v9 != 0;
      }
    }
    else if (!a4)
    {
      return v9 != 0;
    }
    uint64_t v12 = *MEMORY[0x263F08410];
    uint64_t v14 = *MEMORY[0x263F08320];
    __int16 v15 = @"deviceID not registered";
    *a4 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v12, -50, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    return v9 != 0;
  }
  -[NSMutableDictionary removeObjectForKey:](self->_devicesMap, "removeObjectForKey:", [a3 deviceID]);
  uint64_t v10 = [(NSMutableDictionary *)self->_devicesMap allKeys];
  os_unfair_lock_unlock(&self->_devicesMapLock);
  [a3 didUnregister];
  [(CMIOExtensionProvider *)self notifyAvailableDevicesChanged:v10];
  return v9 != 0;
}

- (BOOL)registerStream:(id)a3 withDeviceID:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v9 = CMIOLogLevel(1);
  if (v9)
  {
    uint64_t v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      int v19 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v20 = 1024;
      int v21 = 2535;
      __int16 v22 = 2080;
      uint64_t v23 = "-[CMIOExtensionProvider registerStream:withDeviceID:error:]";
      __int16 v24 = 2112;
      id v25 = self;
      __int16 v26 = 2112;
      id v27 = a3;
      _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  os_unfair_lock_lock(&self->_streamsMapLock);
  uint64_t v11 = -[NSMutableDictionary objectForKey:](self->_streamsMap, "objectForKey:", [a3 streamID]);
  if (!v11)
  {
    -[NSMutableDictionary setObject:forKey:](self->_streamsMap, "setObject:forKey:", a3, [a3 streamID]);
    uint64_t v14 = [(NSMutableDictionary *)self->_streamsMap allKeys];
    os_unfair_lock_unlock(&self->_streamsMapLock);
    [(CMIOExtensionProvider *)self notifyAvailableStreamsChangedWithDeviceID:a4 streamIDs:v14];
    return v11 == 0;
  }
  os_unfair_lock_unlock(&self->_streamsMapLock);
  uint64_t v12 = CMIOLog();
  if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[CMIOExtensionProvider registerStream:withDeviceID:error:]();
    if (!a5) {
      return v11 == 0;
    }
    goto LABEL_8;
  }
  if (a5)
  {
LABEL_8:
    uint64_t v13 = *MEMORY[0x263F08410];
    uint64_t v16 = *MEMORY[0x263F08320];
    int v17 = @"streamID already included";
    *a5 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v13, -50, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  }
  return v11 == 0;
}

- (BOOL)unregisterStream:(id)a3 withDeviceID:(id)a4 notify:(BOOL)a5 error:(id *)a6
{
  BOOL v37 = a5;
  uint64_t v64 = *MEMORY[0x263EF8340];
  uint64_t v8 = CMIOLogLevel(1);
  if (v8)
  {
    uint64_t v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v52 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v53 = 1024;
      int v54 = 2564;
      __int16 v55 = 2080;
      v56 = "-[CMIOExtensionProvider unregisterStream:withDeviceID:notify:error:]";
      __int16 v57 = 2112;
      id v58 = self;
      __int16 v59 = 2112;
      uint64_t v60 = (uint64_t)a3;
      _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  uint64_t v45 = 0;
  long long v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  os_unfair_lock_lock(&self->_streamsMapLock);
  if ([(NSMutableDictionary *)self->_streamsMap count]) {
    id v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithArray:", -[NSMutableDictionary allKeys](self->_streamsMap, "allKeys"));
  }
  else {
    id v38 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  uint64_t v39 = -[NSMutableDictionary objectForKey:](self->_streamsMap, "objectForKey:", objc_msgSend(a3, "streamID", a4));
  if (v39)
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "streamingClients"), "count");
    v46[3] = v10;
    if (v10)
    {
      uint64_t v11 = CMIOLog();
      uint64_t v12 = v11;
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        *(_DWORD *)buf = 136316162;
        v52 = v13;
        __int16 v53 = 1024;
        int v54 = 2577;
        __int16 v55 = 2080;
        v56 = "-[CMIOExtensionProvider unregisterStream:withDeviceID:notify:error:]";
        __int16 v57 = 2114;
        id v58 = self;
        __int16 v59 = 2114;
        uint64_t v60 = (uint64_t)a3;
        _os_log_impl(&dword_2432B6000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@ pending stream clients for %{public}@, wait for stream stop before removing it", buf, 0x30u);
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v14 = (void *)[a3 streamingClients];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v63 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v42 != v16) {
              objc_enumerationMutation(v14);
            }
            __int16 v18 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            int v19 = CMIOLog();
            __int16 v20 = v19;
            if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              int v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
              uint64_t v22 = objc_msgSend((id)objc_msgSend(a3, "streamID"), "UUIDString");
              *(_DWORD *)buf = 136316419;
              v52 = v21;
              __int16 v53 = 1024;
              int v54 = 2579;
              __int16 v55 = 2080;
              v56 = "-[CMIOExtensionProvider unregisterStream:withDeviceID:notify:error:]";
              __int16 v57 = 2114;
              id v58 = self;
              __int16 v59 = 2114;
              uint64_t v60 = v22;
              __int16 v61 = 2113;
              v62 = v18;
              _os_log_impl(&dword_2432B6000, v20, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, %{public}@, %{private}@", buf, 0x3Au);
            }
            id v23 = +[CMIOExtensionProvider sharedProvider];
            uint64_t v24 = [v18 clientID];
            uint64_t v25 = [a3 streamID];
            v40[0] = MEMORY[0x263EF8330];
            v40[1] = 3221225472;
            v40[2] = __68__CMIOExtensionProvider_unregisterStream_withDeviceID_notify_error___block_invoke;
            v40[3] = &unk_26517BFA0;
            v40[5] = a3;
            v40[6] = &v45;
            v40[4] = self;
            [v23 stopStreamForClientID:v24 streamID:v25 reply:v40];
            [(CMIOExtensionProvider *)self removeSystemStatusAttributionsForClient:v18 stream:a3];
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v63 count:16];
        }
        while (v15);
      }
    }
    else
    {
      id v27 = CMIOLog();
      uint64_t v28 = v27;
      if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        *(_DWORD *)buf = 136316162;
        v52 = v29;
        __int16 v53 = 1024;
        int v54 = 2592;
        __int16 v55 = 2080;
        v56 = "-[CMIOExtensionProvider unregisterStream:withDeviceID:notify:error:]";
        __int16 v57 = 2114;
        id v58 = self;
        __int16 v59 = 2114;
        uint64_t v60 = (uint64_t)a3;
        _os_log_impl(&dword_2432B6000, v28, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@ no active clients for %{public}@ removing it", buf, 0x30u);
      }
      -[NSMutableDictionary removeObjectForKey:](self->_streamsMap, "removeObjectForKey:", [a3 streamID]);
    }
    objc_msgSend(v38, "removeObject:", objc_msgSend(a3, "streamID"));
    uint64_t v26 = [v38 allObjects];
  }
  else
  {
    uint64_t v26 = 0;
  }
  os_unfair_lock_unlock(&self->_streamsMapLock);

  if (v39)
  {
    if (v37) {
      [(CMIOExtensionProvider *)self notifyAvailableStreamsChangedWithDeviceID:v35 streamIDs:v26];
    }
  }
  else
  {
    uint64_t v30 = CMIOLog();
    if (v30 && os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      [a3 streamID];
      -[CMIOExtensionProvider unregisterStream:withDeviceID:notify:error:]();
    }
    if (a6)
    {
      uint64_t v31 = (void *)MEMORY[0x263F087E8];
      uint64_t v49 = *MEMORY[0x263F08320];
      unint64_t v50 = @"streamID not register";
      uint64_t v32 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      *a6 = (id)[v31 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v32];
    }
  }
  _Block_object_dispose(&v45, 8);
  return v39 != 0;
}

uint64_t __68__CMIOExtensionProvider_unregisterStream_withDeviceID_notify_error___block_invoke(uint64_t result)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!--*(void *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    id v2 = CMIOLog();
    if (v2)
    {
      int v3 = v2;
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        uint64_t v5 = *(void *)(v1 + 32);
        uint64_t v6 = [*(id *)(v1 + 40) streamID];
        int v7 = 136316162;
        uint64_t v8 = v4;
        __int16 v9 = 1024;
        int v10 = 2584;
        __int16 v11 = 2080;
        uint64_t v12 = "-[CMIOExtensionProvider unregisterStream:withDeviceID:notify:error:]_block_invoke";
        __int16 v13 = 2114;
        uint64_t v14 = v5;
        __int16 v15 = 2114;
        uint64_t v16 = v6;
        _os_log_impl(&dword_2432B6000, v3, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@ stop stream complete, remove %{public}@", (uint8_t *)&v7, 0x30u);
      }
    }
    return objc_msgSend(*(id *)(*(void *)(v1 + 32) + 88), "removeObjectForKey:", objc_msgSend(*(id *)(v1 + 40), "streamID"));
  }
  return result;
}

- (void)availablePluginPropertiesForClientID:(id)a3 reply:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v7 = CMIOLogLevel(1);
  if (v7)
  {
    uint64_t v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v13 = 1024;
      int v14 = 2623;
      __int16 v15 = 2080;
      uint64_t v16 = "-[CMIOExtensionProvider availablePluginPropertiesForClientID:reply:]";
      __int16 v17 = 2112;
      __int16 v18 = self;
      __int16 v19 = 2112;
      id v20 = a3;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__CMIOExtensionProvider_availablePluginPropertiesForClientID_reply___block_invoke;
  v10[3] = &unk_26517BFC8;
  v10[4] = self;
  v10[5] = a4;
  dispatch_async(clientQueue, v10);
}

uint64_t __68__CMIOExtensionProvider_availablePluginPropertiesForClientID_reply___block_invoke(uint64_t a1)
{
  [objc_loadWeak((id *)(*(void *)(a1 + 32) + 176)) availableProperties];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)pluginStatesForClientID:(id)a3 reply:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v7 = CMIOLogLevel(1);
  if (v7)
  {
    uint64_t v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v13 = 1024;
      int v14 = 2634;
      __int16 v15 = 2080;
      uint64_t v16 = "-[CMIOExtensionProvider pluginStatesForClientID:reply:]";
      __int16 v17 = 2112;
      __int16 v18 = self;
      __int16 v19 = 2112;
      id v20 = a3;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__CMIOExtensionProvider_pluginStatesForClientID_reply___block_invoke;
  v10[3] = &unk_26517BFC8;
  v10[4] = self;
  v10[5] = a4;
  dispatch_async(clientQueue, v10);
}

uint64_t __55__CMIOExtensionProvider_pluginStatesForClientID_reply___block_invoke(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v61 = 0;
  id v2 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  uint64_t v44 = a1;
  uint64_t v49 = (id *)(a1 + 32);
  int v3 = objc_msgSend(*(id *)(a1 + 32), "_clientQueue_internalPropertyStatesForProperties:", 0);
  if ([v3 count]) {
    [v2 addEntriesFromDictionary:v3];
  }
  uint64_t v45 = v2;
  uint64_t v4 = (void *)[objc_loadWeak((id *)*v49 + 22) availableProperties];
  uint64_t v5 = CMIOLog();
  if (v5)
  {
    uint64_t v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      id v8 = *v49;
      *(_DWORD *)buf = 136316162;
      v65 = v7;
      __int16 v66 = 1024;
      int v67 = 2644;
      __int16 v68 = 2080;
      v69 = "-[CMIOExtensionProvider pluginStatesForClientID:reply:]_block_invoke";
      __int16 v70 = 2114;
      id v71 = v8;
      __int16 v72 = 2114;
      uint64_t v73 = (uint64_t)v4;
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, availableProperties %{public}@", buf, 0x30u);
    }
  }
  if ([v4 count])
  {
    __int16 v9 = objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)*v49 + 22), "providerPropertiesForProperties:error:", v4, &v61), "propertiesDictionary");
    if (v61)
    {
      int v10 = CMIOLog();
      __int16 v11 = v10;
      if (v10)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          long long v40 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          id v41 = v61;
          uint64_t v42 = [v61 localizedDescription];
          *(_DWORD *)buf = 136316162;
          v65 = v40;
          __int16 v66 = 1024;
          int v67 = 2651;
          __int16 v68 = 2080;
          v69 = "-[CMIOExtensionProvider pluginStatesForClientID:reply:]_block_invoke";
          __int16 v70 = 2112;
          id v71 = v41;
          __int16 v72 = 2112;
          uint64_t v73 = v42;
          _os_log_error_impl(&dword_2432B6000, v11, OS_LOG_TYPE_ERROR, "%s:%d:%s providerPropertiesForProperties error %@ localizedDescription: %@", buf, 0x30u);
        }
      }
    }
    if ([v9 count])
    {
      [v45 addEntriesFromDictionary:v9];
    }
    else
    {
      uint64_t v39 = CMIOLog();
      if (v39 && os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        __55__CMIOExtensionProvider_pluginStatesForClientID_reply___block_invoke_cold_1();
      }
    }
  }
  uint64_t v48 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v12 = (void *)[MEMORY[0x263EFF980] array];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = (id)[*v49 devices];
  uint64_t v50 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v50)
  {
    uint64_t v47 = *(void *)v58;
    *(void *)&long long v13 = 136315906;
    long long v43 = v13;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v58 != v47)
        {
          uint64_t v15 = v14;
          objc_enumerationMutation(obj);
          uint64_t v14 = v15;
        }
        uint64_t v51 = v14;
        uint64_t v16 = *(void **)(*((void *)&v57 + 1) + 8 * v14);
        __int16 v17 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v43);
        __int16 v18 = objc_msgSend(v16, "_clientQueue_internalPropertyStatesForProperties:", 0);
        if ([v18 count]) {
          [v17 addEntriesFromDictionary:v18];
        }
        [*v49 _addAvailablePropertyStatesForDevice:v16 toDictionary:v17];
        [v48 addObject:v17];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        __int16 v19 = (void *)[v16 streams];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v53 objects:v62 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v54;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v54 != v21) {
                objc_enumerationMutation(v19);
              }
              id v23 = *(void **)(*((void *)&v53 + 1) + 8 * v22);
              uint64_t v24 = (void *)[MEMORY[0x263EFF9A0] dictionary];
              uint64_t v25 = objc_msgSend(v23, "_clientQueue_internalPropertyStatesForProperties:", 0);
              if ([v25 count]) {
                [v24 addEntriesFromDictionary:v25];
              }
              uint64_t v26 = objc_msgSend((id)objc_msgSend(v23, "source"), "availableProperties");
              id v27 = CMIOLog();
              uint64_t v28 = v27;
              if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                __int16 v29 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                *(_DWORD *)buf = 136316162;
                v65 = v29;
                __int16 v66 = 1024;
                int v67 = 2689;
                __int16 v68 = 2080;
                v69 = "-[CMIOExtensionProvider pluginStatesForClientID:reply:]_block_invoke";
                __int16 v70 = 2114;
                id v71 = v23;
                __int16 v72 = 2114;
                uint64_t v73 = (uint64_t)v26;
                _os_log_impl(&dword_2432B6000, v28, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, stream availableProperties %{public}@", buf, 0x30u);
              }
              if ([v26 count])
              {
                uint64_t v30 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "source"), "streamPropertiesForProperties:error:", v26, &v61), "propertiesDictionary");
                if (v61)
                {
                  uint64_t v31 = CMIOLog();
                  uint64_t v32 = v31;
                  if (v31)
                  {
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                    {
                      v52 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                      id v35 = v61;
                      uint64_t v36 = [v61 localizedDescription];
                      *(_DWORD *)buf = 136316162;
                      v65 = v52;
                      __int16 v66 = 1024;
                      int v67 = 2696;
                      __int16 v68 = 2080;
                      v69 = "-[CMIOExtensionProvider pluginStatesForClientID:reply:]_block_invoke";
                      __int16 v70 = 2114;
                      id v71 = v35;
                      __int16 v72 = 2114;
                      uint64_t v73 = v36;
                      _os_log_error_impl(&dword_2432B6000, v32, OS_LOG_TYPE_ERROR, "%s:%d:%s streamPropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
                    }
                  }
                }
                if ([v30 count])
                {
                  [v24 addEntriesFromDictionary:v30];
                }
                else
                {
                  __int16 v33 = CMIOLog();
                  id v34 = v33;
                  if (v33 && os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    BOOL v37 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                    *(_DWORD *)buf = 136316162;
                    v65 = v37;
                    __int16 v66 = 1024;
                    int v67 = 2707;
                    __int16 v68 = 2080;
                    v69 = "-[CMIOExtensionProvider pluginStatesForClientID:reply:]_block_invoke";
                    __int16 v70 = 2114;
                    id v71 = v61;
                    __int16 v72 = 2114;
                    uint64_t v73 = (uint64_t)v23;
                    _os_log_error_impl(&dword_2432B6000, v34, OS_LOG_TYPE_ERROR, "%s:%d:%s streamPropertiesForProperties error %{public}@ for stream %{public}@", buf, 0x30u);
                  }
                }
              }
              [v12 addObject:v24];
              ++v22;
            }
            while (v20 != v22);
            uint64_t v20 = [v19 countByEnumeratingWithState:&v53 objects:v62 count:16];
          }
          while (v20);
        }
        uint64_t v14 = v51 + 1;
      }
      while (v51 + 1 != v50);
      uint64_t v50 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v50);
  }
  return (*(uint64_t (**)(void))(*(void *)(v44 + 40) + 16))();
}

- (void)_addAvailablePropertyStatesForDevice:(id)a3 toDictionary:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v16[0] = 0;
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "source"), "availableProperties");
  int v7 = CMIOLog();
  if (v7)
  {
    id v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v19 = 1024;
      int v20 = 2722;
      __int16 v21 = 2080;
      uint64_t v22 = "-[CMIOExtensionProvider _addAvailablePropertyStatesForDevice:toDictionary:]";
      __int16 v23 = 2114;
      id v24 = a3;
      __int16 v25 = 2114;
      uint64_t v26 = (uint64_t)v6;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, device availableProperties %{public}@", buf, 0x30u);
    }
  }
  if ([v6 count])
  {
    __int16 v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "source"), "devicePropertiesForProperties:error:", v6, v16), "propertiesDictionary");
    if (v16[0])
    {
      int v10 = CMIOLog();
      __int16 v11 = v10;
      if (v10)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          long long v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          id v14 = v16[0];
          uint64_t v15 = [v16[0] localizedDescription];
          *(_DWORD *)buf = 136316162;
          __int16 v18 = v13;
          __int16 v19 = 1024;
          int v20 = 2729;
          __int16 v21 = 2080;
          uint64_t v22 = "-[CMIOExtensionProvider _addAvailablePropertyStatesForDevice:toDictionary:]";
          __int16 v23 = 2114;
          id v24 = v14;
          __int16 v25 = 2114;
          uint64_t v26 = v15;
          _os_log_error_impl(&dword_2432B6000, v11, OS_LOG_TYPE_ERROR, "%s:%d:%s devicePropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
        }
      }
    }
    if ([v9 count])
    {
      [a4 addEntriesFromDictionary:v9];
    }
    else
    {
      uint64_t v12 = CMIOLog();
      if (v12)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionProvider _addAvailablePropertyStatesForDevice:toDictionary:]();
        }
      }
    }
  }
}

- (void)pluginPropertyStatesForClientID:(id)a3 properties:(id)a4 reply:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  __int16 v9 = CMIOLogLevel(1);
  if (v9)
  {
    int v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      id v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v15 = 1024;
      int v16 = 2748;
      __int16 v17 = 2080;
      __int16 v18 = "-[CMIOExtensionProvider pluginPropertyStatesForClientID:properties:reply:]";
      __int16 v19 = 2112;
      int v20 = self;
      __int16 v21 = 2112;
      id v22 = a3;
      _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__CMIOExtensionProvider_pluginPropertyStatesForClientID_properties_reply___block_invoke;
  block[3] = &unk_26517BFF0;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(clientQueue, block);
}

uint64_t __74__CMIOExtensionProvider_pluginPropertyStatesForClientID_properties_reply___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v18[0] = 0;
  id v2 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = a1 + 32;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_clientQueue_internalPropertyStatesForProperties:", *(void *)(a1 + 40));
  if ([v4 count]) {
    [v2 addEntriesFromDictionary:v4];
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithSet:");
    if (+[CMIOExtensionProvider internalProperties]) {
      objc_msgSend(v5, "minusSet:", +[CMIOExtensionProvider internalProperties](CMIOExtensionProvider, "internalProperties"));
    }
  }
  else
  {
    uint64_t v5 = (void *)[objc_loadWeak((id *)(*(void *)v3 + 176)) availableProperties];
    uint64_t v6 = CMIOLog();
    if (v6)
    {
      int v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        __int16 v9 = *(void **)v3;
        *(_DWORD *)buf = 136316162;
        int v20 = v8;
        __int16 v21 = 1024;
        int v22 = 2760;
        __int16 v23 = 2080;
        id v24 = "-[CMIOExtensionProvider pluginPropertyStatesForClientID:properties:reply:]_block_invoke";
        __int16 v25 = 2114;
        id v26 = v9;
        __int16 v27 = 2114;
        uint64_t v28 = (uint64_t)v5;
        _os_log_impl(&dword_2432B6000, v7, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, availableProperties %{public}@", buf, 0x30u);
      }
    }
  }
  if ([v5 count])
  {
    int v10 = objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)(*(void *)v3 + 176)), "providerPropertiesForProperties:error:", v5, v18), "propertiesDictionary");
    if (v18[0])
    {
      __int16 v11 = CMIOLog();
      uint64_t v12 = v11;
      if (v11)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          __int16 v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          id v16 = v18[0];
          uint64_t v17 = [v18[0] localizedDescription];
          *(_DWORD *)buf = 136316162;
          int v20 = v15;
          __int16 v21 = 1024;
          int v22 = 2774;
          __int16 v23 = 2080;
          id v24 = "-[CMIOExtensionProvider pluginPropertyStatesForClientID:properties:reply:]_block_invoke";
          __int16 v25 = 2114;
          id v26 = v16;
          __int16 v27 = 2114;
          uint64_t v28 = v17;
          _os_log_error_impl(&dword_2432B6000, v12, OS_LOG_TYPE_ERROR, "%s:%d:%s providerPropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
        }
      }
    }
    if ([v10 count])
    {
      [v2 addEntriesFromDictionary:v10];
    }
    else
    {
      id v14 = CMIOLog();
      if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __74__CMIOExtensionProvider_pluginPropertyStatesForClientID_properties_reply___block_invoke_cold_1();
      }
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)setPluginPropertyValuesForClientID:(id)a3 propertyValues:(id)a4 reply:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  __int16 v9 = CMIOLogLevel(1);
  if (v9)
  {
    int v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      id v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v15 = 1024;
      int v16 = 2800;
      __int16 v17 = 2080;
      __int16 v18 = "-[CMIOExtensionProvider setPluginPropertyValuesForClientID:propertyValues:reply:]";
      __int16 v19 = 2112;
      int v20 = self;
      __int16 v21 = 2112;
      id v22 = a3;
      __int16 v23 = 2112;
      id v24 = a4;
      _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@, propertyValues %@", buf, 0x3Au);
    }
  }
  clientQueue = self->_clientQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke;
  v12[3] = &unk_26517C040;
  v12[4] = a4;
  v12[5] = self;
  v12[6] = a3;
  v12[7] = a5;
  dispatch_async(clientQueue, v12);
}

void __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke(uint64_t a1)
{
  v36[1] = *MEMORY[0x263EF8340];
  v24[0] = 0;
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", objc_msgSend(*(id *)(a1 + 32), "allKeys"));
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
    id v3 = (id)[*(id *)(*(void *)(a1 + 40) + 32) objectForKey:*(void *)(a1 + 48)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
    uint64_t v4 = -[CMIOExtensionProviderProperties initWithPropertyValues:client:]([CMIOExtensionProviderProperties alloc], "initWithPropertyValues:client:", *(void *)(a1 + 32), [v3 clientInfo]);
    [objc_loadWeak((id *)(*(void *)(a1 + 40) + 176)) setProviderProperties:v4 error:v24];

    if (v24[0])
    {
      uint64_t v5 = CMIOLog();
      uint64_t v6 = v5;
      if (v5)
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          __int16 v19 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          id v20 = v24[0];
          uint64_t v21 = [v24[0] localizedDescription];
          *(_DWORD *)buf = 136316162;
          id v26 = v19;
          __int16 v27 = 1024;
          int v28 = 2826;
          __int16 v29 = 2080;
          uint64_t v30 = "-[CMIOExtensionProvider setPluginPropertyValuesForClientID:propertyValues:reply:]_block_invoke";
          __int16 v31 = 2112;
          id v32 = v20;
          __int16 v33 = 2112;
          uint64_t v34 = v21;
          _os_log_error_impl(&dword_2432B6000, v6, OS_LOG_TYPE_ERROR, "%s:%d:%s setProviderProperties error %@ localizedDescription: %@", buf, 0x30u);
        }
      }
    }
    id v23 = 0;
    uint64_t v7 = objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)(*(void *)(a1 + 40) + 176)), "providerPropertiesForProperties:error:", v2, &v23), "propertiesDictionary");
    if (v23)
    {
      id v8 = CMIOLog();
      __int16 v9 = v8;
      if (v8)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          id v17 = v23;
          uint64_t v18 = [v23 localizedDescription];
          *(_DWORD *)buf = 136316162;
          id v26 = v16;
          __int16 v27 = 1024;
          int v28 = 2841;
          __int16 v29 = 2080;
          uint64_t v30 = "-[CMIOExtensionProvider setPluginPropertyValuesForClientID:propertyValues:reply:]_block_invoke";
          __int16 v31 = 2114;
          id v32 = v17;
          __int16 v33 = 2114;
          uint64_t v34 = v18;
          _os_log_error_impl(&dword_2432B6000, v9, OS_LOG_TYPE_ERROR, "%s:%d:%s providerPropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
        }
      }
    }
    [*(id *)(a1 + 40) notifyPropertiesChanged:v7];
    int v10 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke_421;
    v22[3] = &unk_26517C018;
    uint64_t v11 = *(void *)(a1 + 56);
    v22[4] = v24[0];
    v22[5] = v11;
    dispatch_async(v10, v22);
  }
  else
  {
    uint64_t v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke_cold_1();
    }
    uint64_t v13 = *(void *)(a1 + 56);
    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = *MEMORY[0x263F08320];
    v36[0] = @"Invalid property value";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
    (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, [v14 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v15]);
  }
}

uint64_t __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke_421(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)availableDevicePropertiesForClientID:(id)a3 deviceID:(id)a4 reply:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  __int16 v9 = CMIOLogLevel(1);
  if (v9)
  {
    int v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      id v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v15 = 1024;
      int v16 = 2858;
      __int16 v17 = 2080;
      uint64_t v18 = "-[CMIOExtensionProvider availableDevicePropertiesForClientID:deviceID:reply:]";
      __int16 v19 = 2112;
      id v20 = self;
      __int16 v21 = 2112;
      id v22 = a3;
      _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__CMIOExtensionProvider_availableDevicePropertiesForClientID_deviceID_reply___block_invoke;
  block[3] = &unk_26517BFF0;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(clientQueue, block);
}

uint64_t __77__CMIOExtensionProvider_availableDevicePropertiesForClientID_deviceID_reply___block_invoke(void *a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 64));
  id v2 = (id)[*(id *)(a1[4] + 72) objectForKey:a1[5]];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 64));
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(v2, "source"), "availableProperties");
    id v3 = *(uint64_t (**)(void))(a1[6] + 16);
    return v3();
  }
  else
  {
    uint64_t v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __77__CMIOExtensionProvider_availableDevicePropertiesForClientID_deviceID_reply___block_invoke_cold_1();
    }
    uint64_t v6 = a1[6];
    uint64_t v7 = *MEMORY[0x263F08410];
    uint64_t v8 = *MEMORY[0x263F08320];
    v9[0] = @"Invalid deviceID";
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, 0, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v7, -50, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1)));
  }
}

- (void)deviceStatesForClientID:(id)a3 deviceID:(id)a4 reply:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  __int16 v9 = CMIOLogLevel(1);
  if (v9)
  {
    int v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      id v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v15 = 1024;
      int v16 = 2881;
      __int16 v17 = 2080;
      uint64_t v18 = "-[CMIOExtensionProvider deviceStatesForClientID:deviceID:reply:]";
      __int16 v19 = 2112;
      id v20 = self;
      __int16 v21 = 2112;
      id v22 = a3;
      _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__CMIOExtensionProvider_deviceStatesForClientID_deviceID_reply___block_invoke;
  block[3] = &unk_26517BFF0;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(clientQueue, block);
}

uint64_t __64__CMIOExtensionProvider_deviceStatesForClientID_deviceID_reply___block_invoke(void *a1)
{
  v62[1] = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 64));
  id v2 = (id)[*(id *)(a1[4] + 72) objectForKey:a1[5]];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 64));
  if (v2)
  {
    id v49 = 0;
    id v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    uint64_t v4 = objc_msgSend(v2, "_clientQueue_internalPropertyStatesForProperties:", 0);
    if ([v4 count]) {
      [v3 addEntriesFromDictionary:v4];
    }
    uint64_t v42 = a1;
    long long v43 = v3;
    uint64_t v5 = objc_msgSend((id)objc_msgSend(v2, "source"), "availableProperties");
    uint64_t v6 = CMIOLog();
    if (v6)
    {
      uint64_t v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136316162;
        v52 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        __int16 v53 = 1024;
        int v54 = 2904;
        __int16 v55 = 2080;
        long long v56 = "-[CMIOExtensionProvider deviceStatesForClientID:deviceID:reply:]_block_invoke";
        __int16 v57 = 2114;
        id v58 = v2;
        __int16 v59 = 2114;
        uint64_t v60 = (uint64_t)v5;
        _os_log_impl(&dword_2432B6000, v7, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, device availableProperties %{public}@", buf, 0x30u);
      }
    }
    if ([v5 count])
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "source"), "devicePropertiesForProperties:error:", v5, &v49), "propertiesDictionary");
      if (v49)
      {
        __int16 v9 = CMIOLog();
        int v10 = v9;
        if (v9)
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            id v38 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
            id v39 = v49;
            uint64_t v40 = [v49 localizedDescription];
            *(_DWORD *)buf = 136316162;
            v52 = v38;
            __int16 v53 = 1024;
            int v54 = 2911;
            __int16 v55 = 2080;
            long long v56 = "-[CMIOExtensionProvider deviceStatesForClientID:deviceID:reply:]_block_invoke";
            __int16 v57 = 2114;
            id v58 = v39;
            __int16 v59 = 2114;
            uint64_t v60 = v40;
            _os_log_error_impl(&dword_2432B6000, v10, OS_LOG_TYPE_ERROR, "%s:%d:%s devicePropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
          }
        }
      }
      if ([v8 count])
      {
        [v43 addEntriesFromDictionary:v8];
      }
      else
      {
        BOOL v37 = CMIOLog();
        if (v37 && os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          __64__CMIOExtensionProvider_deviceStatesForClientID_deviceID_reply___block_invoke_cold_2();
        }
      }
    }
    uint64_t v11 = (void *)[MEMORY[0x263EFF980] array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v12 = (void *)[v2 streams];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v13)
    {
      uint64_t v15 = *(void *)v46;
      *(void *)&long long v14 = 136315906;
      long long v41 = v14;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(v12);
          }
          __int16 v17 = *(void **)(*((void *)&v45 + 1) + 8 * v16);
          uint64_t v18 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v41);
          __int16 v19 = objc_msgSend(v17, "_clientQueue_internalPropertyStatesForProperties:", 0);
          if ([v19 count]) {
            [v18 addEntriesFromDictionary:v19];
          }
          id v20 = objc_msgSend((id)objc_msgSend(v17, "source"), "availableProperties");
          __int16 v21 = CMIOLog();
          id v22 = v21;
          if (v21 && os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            uint64_t v23 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
            *(_DWORD *)buf = 136316162;
            v52 = v23;
            __int16 v53 = 1024;
            int v54 = 2935;
            __int16 v55 = 2080;
            long long v56 = "-[CMIOExtensionProvider deviceStatesForClientID:deviceID:reply:]_block_invoke";
            __int16 v57 = 2114;
            id v58 = v17;
            __int16 v59 = 2114;
            uint64_t v60 = (uint64_t)v20;
            _os_log_impl(&dword_2432B6000, v22, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, stream availableProperties %{public}@", buf, 0x30u);
          }
          if ([v20 count])
          {
            id v24 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "source"), "streamPropertiesForProperties:error:", v20, &v49), "propertiesDictionary");
            if (v49)
            {
              uint64_t v25 = CMIOLog();
              id v26 = v25;
              if (v25)
              {
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v44 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                  id v29 = v49;
                  uint64_t v30 = [v49 localizedDescription];
                  *(_DWORD *)buf = 136316162;
                  v52 = v44;
                  __int16 v53 = 1024;
                  int v54 = 2942;
                  __int16 v55 = 2080;
                  long long v56 = "-[CMIOExtensionProvider deviceStatesForClientID:deviceID:reply:]_block_invoke";
                  __int16 v57 = 2114;
                  id v58 = v29;
                  __int16 v59 = 2114;
                  uint64_t v60 = v30;
                  _os_log_error_impl(&dword_2432B6000, v26, OS_LOG_TYPE_ERROR, "%s:%d:%s streamPropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
                }
              }
            }
            if ([v24 count])
            {
              [v18 addEntriesFromDictionary:v24];
            }
            else
            {
              __int16 v27 = CMIOLog();
              int v28 = v27;
              if (v27)
              {
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  __int16 v31 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                  *(_DWORD *)buf = 136316162;
                  v52 = v31;
                  __int16 v53 = 1024;
                  int v54 = 2953;
                  __int16 v55 = 2080;
                  long long v56 = "-[CMIOExtensionProvider deviceStatesForClientID:deviceID:reply:]_block_invoke";
                  __int16 v57 = 2114;
                  id v58 = v49;
                  __int16 v59 = 2114;
                  uint64_t v60 = (uint64_t)v17;
                  _os_log_error_impl(&dword_2432B6000, v28, OS_LOG_TYPE_ERROR, "%s:%d:%s streamPropertiesForProperties error %{public}@ for stream %{public}@", buf, 0x30u);
                }
              }
            }
          }
          [v11 addObject:v18];
          ++v16;
        }
        while (v13 != v16);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v13);
    }
    return (*(uint64_t (**)(void))(v42[6] + 16))();
  }
  else
  {
    __int16 v33 = CMIOLog();
    if (v33 && os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      __64__CMIOExtensionProvider_deviceStatesForClientID_deviceID_reply___block_invoke_cold_1();
    }
    uint64_t v34 = a1[6];
    uint64_t v35 = (void *)MEMORY[0x263F087E8];
    uint64_t v61 = *MEMORY[0x263F08320];
    v62[0] = @"Invalid deviceID";
    uint64_t v36 = [NSDictionary dictionaryWithObjects:v62 forKeys:&v61 count:1];
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(v34 + 16))(v34, 0, 0, [v35 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v36]);
  }
}

- (void)devicePropertyStatesForClientID:(id)a3 deviceID:(id)a4 properties:(id)a5 reply:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v11 = CMIOLogLevel(1);
  if (v11)
  {
    uint64_t v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v17 = 1024;
      int v18 = 2964;
      __int16 v19 = 2080;
      id v20 = "-[CMIOExtensionProvider devicePropertyStatesForClientID:deviceID:properties:reply:]";
      __int16 v21 = 2112;
      id v22 = self;
      __int16 v23 = 2112;
      id v24 = a3;
      _os_log_impl(&dword_2432B6000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__CMIOExtensionProvider_devicePropertyStatesForClientID_deviceID_properties_reply___block_invoke;
  v14[3] = &unk_26517C068;
  v14[4] = self;
  v14[5] = a4;
  v14[6] = a5;
  v14[7] = a6;
  dispatch_async(clientQueue, v14);
}

uint64_t __83__CMIOExtensionProvider_devicePropertyStatesForClientID_deviceID_properties_reply___block_invoke(void *a1)
{
  v32[1] = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 64));
  id v2 = (id)[*(id *)(a1[4] + 72) objectForKey:a1[5]];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 64));
  if (v2)
  {
    v20[0] = 0;
    id v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    uint64_t v4 = objc_msgSend(v2, "_clientQueue_internalPropertyStatesForProperties:", a1[6]);
    if ([v4 count]) {
      [v3 addEntriesFromDictionary:v4];
    }
    if (a1[6])
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithSet:");
      if (+[CMIOExtensionDevice internalProperties]) {
        objc_msgSend(v5, "minusSet:", +[CMIOExtensionDevice internalProperties](CMIOExtensionDevice, "internalProperties"));
      }
    }
    else
    {
      uint64_t v5 = objc_msgSend((id)objc_msgSend(v2, "source"), "availableProperties");
      uint64_t v11 = CMIOLog();
      if (v11)
      {
        uint64_t v12 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316162;
          id v22 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          __int16 v23 = 1024;
          int v24 = 2989;
          __int16 v25 = 2080;
          id v26 = "-[CMIOExtensionProvider devicePropertyStatesForClientID:deviceID:properties:reply:]_block_invoke";
          __int16 v27 = 2114;
          id v28 = v2;
          __int16 v29 = 2114;
          uint64_t v30 = (uint64_t)v5;
          _os_log_impl(&dword_2432B6000, v12, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, device availableProperties %{public}@", buf, 0x30u);
        }
      }
    }
    if ([v5 count])
    {
      uint64_t v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "source"), "devicePropertiesForProperties:error:", v5, v20), "propertiesDictionary");
      if (v20[0])
      {
        long long v14 = CMIOLog();
        uint64_t v15 = v14;
        if (v14)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            __int16 v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
            id v18 = v20[0];
            uint64_t v19 = [v20[0] localizedDescription];
            *(_DWORD *)buf = 136316162;
            id v22 = v17;
            __int16 v23 = 1024;
            int v24 = 3003;
            __int16 v25 = 2080;
            id v26 = "-[CMIOExtensionProvider devicePropertyStatesForClientID:deviceID:properties:reply:]_block_invoke";
            __int16 v27 = 2114;
            id v28 = v18;
            __int16 v29 = 2114;
            uint64_t v30 = v19;
            _os_log_error_impl(&dword_2432B6000, v15, OS_LOG_TYPE_ERROR, "%s:%d:%s devicePropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
          }
        }
      }
      if ([v13 count])
      {
        [v3 addEntriesFromDictionary:v13];
      }
      else
      {
        uint64_t v16 = CMIOLog();
        if (v16)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            __83__CMIOExtensionProvider_devicePropertyStatesForClientID_deviceID_properties_reply___block_invoke_cold_2();
          }
        }
      }
    }
    return (*(uint64_t (**)(void))(a1[7] + 16))();
  }
  else
  {
    uint64_t v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __83__CMIOExtensionProvider_devicePropertyStatesForClientID_deviceID_properties_reply___block_invoke_cold_1();
    }
    uint64_t v7 = a1[7];
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F08320];
    v32[0] = @"Invalid deviceID";
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v7 + 16))(v7, 0, [v8 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v9]);
  }
}

- (void)setDevicePropertyValuesForClientID:(id)a3 deviceID:(id)a4 propertyValues:(id)a5 reply:(id)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v9 = CMIOLog();
  if (v9)
  {
    int v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316163;
      id v38 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v39 = 1024;
      int v40 = 3029;
      __int16 v41 = 2080;
      uint64_t v42 = "-[CMIOExtensionProvider setDevicePropertyValuesForClientID:deviceID:propertyValues:reply:]";
      __int16 v43 = 2114;
      uint64_t v44 = self;
      __int16 v45 = 2113;
      uint64_t v46 = (uint64_t)a3;
      _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, %{private}@", buf, 0x30u);
    }
  }
  id v30 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v11 = objc_msgSend(a5, "allKeys", self);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(CMIOExtensionProvider **)(*((void *)&v32 + 1) + 8 * i);
        int v17 = [(CMIOExtensionProvider *)v16 isEqualToString:0x26F89C510];
        id v18 = CMIOLog();
        uint64_t v19 = v18;
        if (v17)
        {
          if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            id v20 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
            uint64_t v21 = [a5 objectForKeyedSubscript:v16];
            *(_DWORD *)buf = 136316163;
            id v38 = v20;
            __int16 v39 = 1024;
            int v40 = 3032;
            __int16 v41 = 2080;
            uint64_t v42 = "-[CMIOExtensionProvider setDevicePropertyValuesForClientID:deviceID:propertyValues:reply:]";
            __int16 v43 = 2113;
            uint64_t v44 = v16;
            __int16 v45 = 2113;
            uint64_t v46 = v21;
            id v22 = v19;
            __int16 v23 = "%s:%d:%s %{private}@ : %{private}@";
LABEL_16:
            _os_log_impl(&dword_2432B6000, v22, OS_LOG_TYPE_INFO, v23, buf, 0x30u);
            continue;
          }
        }
        else if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v24 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          uint64_t v25 = [a5 objectForKeyedSubscript:v16];
          *(_DWORD *)buf = 136316162;
          id v38 = v24;
          __int16 v39 = 1024;
          int v40 = 3035;
          __int16 v41 = 2080;
          uint64_t v42 = "-[CMIOExtensionProvider setDevicePropertyValuesForClientID:deviceID:propertyValues:reply:]";
          __int16 v43 = 2114;
          uint64_t v44 = v16;
          __int16 v45 = 2114;
          uint64_t v46 = v25;
          id v22 = v19;
          __int16 v23 = "%s:%d:%s %{public}@ : %{public}@";
          goto LABEL_16;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v13);
  }
  id v26 = *(NSObject **)(v27 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke;
  block[3] = &unk_26517C090;
  block[4] = v27;
  block[5] = a4;
  block[6] = a5;
  void block[7] = v30;
  block[8] = a6;
  dispatch_async(v26, block);
}

void __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke(uint64_t a1)
{
  v57[1] = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 72) objectForKey:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
  if (v2)
  {
    if ([*(id *)(a1 + 48) count])
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
      id v3 = (id)[*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 56)];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
      if (v3)
      {
        if ((int)[v2 deviceControlPID] < 1
          || (int v4 = [v2 deviceControlPID],
              v4 == objc_msgSend((id)objc_msgSend(v3, "clientInfo"), "pid")))
        {
          v39[0] = 0;
          uint64_t v5 = objc_msgSend(v2, "_clientQueue_setAndRemoveInternalPropertyValuesForClient:propertyValues:error:", objc_msgSend(v3, "clientInfo"), *(void *)(a1 + 48), v39);
          if (!v39[0])
          {
            uint64_t v6 = v5;
            if ([v5 count])
            {
              uint64_t v7 = [[CMIOExtensionDeviceProperties alloc] initWithPropertyValues:v6];
              objc_msgSend((id)objc_msgSend(v2, "source"), "setDeviceProperties:error:", v7, v39);

              if (v39[0])
              {
                uint64_t v8 = CMIOLog();
                uint64_t v9 = v8;
                if (v8)
                {
                  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v31 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                    id v32 = v39[0];
                    uint64_t v33 = [v39[0] localizedDescription];
                    *(_DWORD *)buf = 136316162;
                    __int16 v41 = v31;
                    __int16 v42 = 1024;
                    int v43 = 3087;
                    __int16 v44 = 2080;
                    __int16 v45 = "-[CMIOExtensionProvider setDevicePropertyValuesForClientID:deviceID:propertyValues:reply:]_block_invoke";
                    __int16 v46 = 2114;
                    id v47 = v32;
                    __int16 v48 = 2114;
                    uint64_t v49 = v33;
                    _os_log_error_impl(&dword_2432B6000, v9, OS_LOG_TYPE_ERROR, "%s:%d:%s setDeviceProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
                  }
                }
              }
              id v38 = 0;
              uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "source"), "devicePropertiesForProperties:error:", objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", objc_msgSend(v6, "allKeys")), &v38), "propertiesDictionary");
              if (v38)
              {
                uint64_t v11 = CMIOLog();
                uint64_t v12 = v11;
                if (v11)
                {
                  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                  {
                    long long v34 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                    id v35 = v38;
                    uint64_t v36 = [v38 localizedDescription];
                    *(_DWORD *)buf = 136316162;
                    __int16 v41 = v34;
                    __int16 v42 = 1024;
                    int v43 = 3103;
                    __int16 v44 = 2080;
                    __int16 v45 = "-[CMIOExtensionProvider setDevicePropertyValuesForClientID:deviceID:propertyValues:reply:]_block_invoke";
                    __int16 v46 = 2114;
                    id v47 = v35;
                    __int16 v48 = 2114;
                    uint64_t v49 = v36;
                    _os_log_error_impl(&dword_2432B6000, v12, OS_LOG_TYPE_ERROR, "%s:%d:%s devicePropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
                  }
                }
              }
              [v2 notifyPropertiesChanged:v10];
            }
          }
          uint64_t v13 = *(NSObject **)(*(void *)(a1 + 32) + 8);
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_432;
          v37[3] = &unk_26517C018;
          uint64_t v14 = *(void *)(a1 + 64);
          v37[4] = v39[0];
          v37[5] = v14;
          dispatch_async(v13, v37);
        }
        else
        {
          uint64_t v27 = CMIOLog();
          if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_6();
          }
          uint64_t v28 = *(void *)(a1 + 64);
          __int16 v29 = (void *)MEMORY[0x263F087E8];
          uint64_t v50 = *MEMORY[0x263F08320];
          uint64_t v51 = @"Invalid deviceControlPID";
          uint64_t v30 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
          (*(void (**)(uint64_t, uint64_t))(v28 + 16))(v28, [v29 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v30]);
        }
      }
      else
      {
        __int16 v23 = CMIOLog();
        if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_3();
        }
        uint64_t v24 = *(void *)(a1 + 64);
        uint64_t v25 = (void *)MEMORY[0x263F087E8];
        uint64_t v52 = *MEMORY[0x263F08320];
        __int16 v53 = @"Invalid clientID";
        uint64_t v26 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        (*(void (**)(uint64_t, uint64_t))(v24 + 16))(v24, [v25 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v26]);
      }
    }
    else
    {
      uint64_t v19 = CMIOLog();
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_2();
      }
      uint64_t v20 = *(void *)(a1 + 64);
      uint64_t v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v54 = *MEMORY[0x263F08320];
      __int16 v55 = @"Invalid property value";
      uint64_t v22 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, [v21 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v22]);
    }
  }
  else
  {
    uint64_t v15 = CMIOLog();
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_1();
    }
    uint64_t v16 = *(void *)(a1 + 64);
    int v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v56 = *MEMORY[0x263F08320];
    v57[0] = @"Invalid deviceID";
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v57 forKeys:&v56 count:1];
    (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, [v17 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v18]);
  }
}

uint64_t __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_432(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)availableStreamPropertiesForClientID:(id)a3 streamID:(id)a4 reply:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v9 = CMIOLogLevel(1);
  if (v9)
  {
    uint64_t v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v15 = 1024;
      int v16 = 3121;
      __int16 v17 = 2080;
      uint64_t v18 = "-[CMIOExtensionProvider availableStreamPropertiesForClientID:streamID:reply:]";
      __int16 v19 = 2112;
      uint64_t v20 = self;
      __int16 v21 = 2112;
      id v22 = a3;
      _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__CMIOExtensionProvider_availableStreamPropertiesForClientID_streamID_reply___block_invoke;
  block[3] = &unk_26517BFF0;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(clientQueue, block);
}

uint64_t __77__CMIOExtensionProvider_availableStreamPropertiesForClientID_streamID_reply___block_invoke(void *a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 80));
  id v2 = (id)[*(id *)(a1[4] + 88) objectForKey:a1[5]];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 80));
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(v2, "source"), "availableProperties");
    id v3 = *(uint64_t (**)(void))(a1[6] + 16);
    return v3();
  }
  else
  {
    uint64_t v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __77__CMIOExtensionProvider_availableStreamPropertiesForClientID_streamID_reply___block_invoke_cold_1();
    }
    uint64_t v6 = a1[6];
    uint64_t v7 = *MEMORY[0x263F08410];
    uint64_t v8 = *MEMORY[0x263F08320];
    v9[0] = @"Invalid streamID";
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, 0, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v7, -50, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1)));
  }
}

- (void)streamPropertyStatesForClientID:(id)a3 streamID:(id)a4 properties:(id)a5 reply:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v11 = CMIOLogLevel(1);
  if (v11)
  {
    uint64_t v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      int v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v17 = 1024;
      int v18 = 3144;
      __int16 v19 = 2080;
      uint64_t v20 = "-[CMIOExtensionProvider streamPropertyStatesForClientID:streamID:properties:reply:]";
      __int16 v21 = 2112;
      id v22 = self;
      __int16 v23 = 2112;
      id v24 = a3;
      _os_log_impl(&dword_2432B6000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__CMIOExtensionProvider_streamPropertyStatesForClientID_streamID_properties_reply___block_invoke;
  v14[3] = &unk_26517C068;
  v14[4] = self;
  v14[5] = a4;
  v14[6] = a5;
  v14[7] = a6;
  dispatch_async(clientQueue, v14);
}

uint64_t __83__CMIOExtensionProvider_streamPropertyStatesForClientID_streamID_properties_reply___block_invoke(void *a1)
{
  v32[1] = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 80));
  id v2 = (id)[*(id *)(a1[4] + 88) objectForKey:a1[5]];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 80));
  if (v2)
  {
    v20[0] = 0;
    id v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    int v4 = objc_msgSend(v2, "_clientQueue_internalPropertyStatesForProperties:", a1[6]);
    if ([v4 count]) {
      [v3 addEntriesFromDictionary:v4];
    }
    if (a1[6])
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithSet:");
      if (+[CMIOExtensionStream internalProperties]) {
        objc_msgSend(v5, "minusSet:", +[CMIOExtensionStream internalProperties](CMIOExtensionStream, "internalProperties"));
      }
    }
    else
    {
      uint64_t v5 = objc_msgSend((id)objc_msgSend(v2, "source"), "availableProperties");
      uint64_t v11 = CMIOLog();
      if (v11)
      {
        uint64_t v12 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316162;
          id v22 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          __int16 v23 = 1024;
          int v24 = 3169;
          __int16 v25 = 2080;
          uint64_t v26 = "-[CMIOExtensionProvider streamPropertyStatesForClientID:streamID:properties:reply:]_block_invoke";
          __int16 v27 = 2114;
          id v28 = v2;
          __int16 v29 = 2114;
          uint64_t v30 = (uint64_t)v5;
          _os_log_impl(&dword_2432B6000, v12, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, stream availableProperties %{public}@", buf, 0x30u);
        }
      }
    }
    if ([v5 count])
    {
      uint64_t v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "source"), "streamPropertiesForProperties:error:", v5, v20), "propertiesDictionary");
      if (v20[0])
      {
        uint64_t v14 = CMIOLog();
        __int16 v15 = v14;
        if (v14)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            __int16 v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
            id v18 = v20[0];
            uint64_t v19 = [v20[0] localizedDescription];
            *(_DWORD *)buf = 136316162;
            id v22 = v17;
            __int16 v23 = 1024;
            int v24 = 3183;
            __int16 v25 = 2080;
            uint64_t v26 = "-[CMIOExtensionProvider streamPropertyStatesForClientID:streamID:properties:reply:]_block_invoke";
            __int16 v27 = 2114;
            id v28 = v18;
            __int16 v29 = 2114;
            uint64_t v30 = v19;
            _os_log_error_impl(&dword_2432B6000, v15, OS_LOG_TYPE_ERROR, "%s:%d:%s streamPropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
          }
        }
      }
      if ([v13 count])
      {
        [v3 addEntriesFromDictionary:v13];
      }
      else
      {
        int v16 = CMIOLog();
        if (v16)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            __83__CMIOExtensionProvider_streamPropertyStatesForClientID_streamID_properties_reply___block_invoke_cold_2();
          }
        }
      }
    }
    return (*(uint64_t (**)(void))(a1[7] + 16))();
  }
  else
  {
    uint64_t v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __83__CMIOExtensionProvider_streamPropertyStatesForClientID_streamID_properties_reply___block_invoke_cold_1();
    }
    uint64_t v7 = a1[7];
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F08320];
    v32[0] = @"Invalid streamID";
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v7 + 16))(v7, 0, [v8 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v9]);
  }
}

- (void)setStreamPropertyValuesForClientID:(id)a3 streamID:(id)a4 propertyValues:(id)a5 reply:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v11 = CMIOLog();
  if (v11)
  {
    uint64_t v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316419;
      int v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v17 = 1024;
      int v18 = 3209;
      __int16 v19 = 2080;
      uint64_t v20 = "-[CMIOExtensionProvider setStreamPropertyValuesForClientID:streamID:propertyValues:reply:]";
      __int16 v21 = 2114;
      id v22 = self;
      __int16 v23 = 2113;
      id v24 = a3;
      __int16 v25 = 2114;
      id v26 = a5;
      _os_log_impl(&dword_2432B6000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@, %{private}@, propertyValues %{public}@", buf, 0x3Au);
    }
  }
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke;
  block[3] = &unk_26517C090;
  block[4] = self;
  block[5] = a4;
  void block[7] = a3;
  block[8] = a6;
  block[6] = a5;
  dispatch_async(clientQueue, block);
}

void __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke(uint64_t a1)
{
  v57[1] = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 88) objectForKey:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  if (v2)
  {
    if ([*(id *)(a1 + 48) count])
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
      id v3 = (id)[*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 56)];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
      if (v3)
      {
        if ((int)objc_msgSend((id)objc_msgSend(v2, "parent"), "deviceControlPID") < 1
          || (int v4 = objc_msgSend((id)objc_msgSend(v2, "parent"), "deviceControlPID"),
              v4 == objc_msgSend((id)objc_msgSend(v3, "clientInfo"), "pid")))
        {
          v39[0] = 0;
          uint64_t v5 = objc_msgSend(v2, "_clientQueue_setAndRemoveInternalPropertyValuesForClient:propertyValues:error:", objc_msgSend(v3, "clientInfo"), *(void *)(a1 + 48), v39);
          if (!v39[0])
          {
            uint64_t v6 = v5;
            if ([v5 count])
            {
              uint64_t v7 = -[CMIOExtensionStreamProperties initWithPropertyValues:client:]([CMIOExtensionStreamProperties alloc], "initWithPropertyValues:client:", v6, [v3 clientInfo]);
              objc_msgSend((id)objc_msgSend(v2, "source"), "setStreamProperties:error:", v7, v39);

              if (v39[0])
              {
                uint64_t v8 = CMIOLog();
                uint64_t v9 = v8;
                if (v8)
                {
                  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                  {
                    long long v34 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                    id v35 = v39[0];
                    uint64_t v36 = [v39[0] localizedDescription];
                    *(_DWORD *)buf = 136316162;
                    __int16 v41 = v34;
                    __int16 v42 = 1024;
                    int v43 = 3259;
                    __int16 v44 = 2080;
                    __int16 v45 = "-[CMIOExtensionProvider setStreamPropertyValuesForClientID:streamID:propertyValues:reply:]_block_invoke";
                    __int16 v46 = 2114;
                    id v47 = v35;
                    __int16 v48 = 2114;
                    uint64_t v49 = v36;
                    _os_log_error_impl(&dword_2432B6000, v9, OS_LOG_TYPE_ERROR, "%s:%d:%s setStreamProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
                  }
                }
              }
              id v38 = 0;
              uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "source"), "streamPropertiesForProperties:error:", objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", objc_msgSend(v6, "allKeys")), &v38), "propertiesDictionary");
              if (v38)
              {
                uint64_t v11 = CMIOLog();
                uint64_t v12 = v11;
                if (v11)
                {
                  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v31 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                    id v32 = v38;
                    uint64_t v33 = [v38 localizedDescription];
                    *(_DWORD *)buf = 136316162;
                    __int16 v41 = v31;
                    __int16 v42 = 1024;
                    int v43 = 3275;
                    __int16 v44 = 2080;
                    __int16 v45 = "-[CMIOExtensionProvider setStreamPropertyValuesForClientID:streamID:propertyValues:reply:]_block_invoke";
                    __int16 v46 = 2114;
                    id v47 = v32;
                    __int16 v48 = 2114;
                    uint64_t v49 = v33;
                    _os_log_error_impl(&dword_2432B6000, v12, OS_LOG_TYPE_ERROR, "%s:%d:%s streamPropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
                  }
                }
              }
              [v2 notifyPropertiesChanged:v10];
            }
          }
          uint64_t v13 = *(NSObject **)(*(void *)(a1 + 32) + 8);
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_436;
          v37[3] = &unk_26517C018;
          uint64_t v14 = *(void *)(a1 + 64);
          v37[4] = v39[0];
          v37[5] = v14;
          dispatch_async(v13, v37);
        }
        else
        {
          uint64_t v27 = CMIOLog();
          if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_6();
          }
          uint64_t v28 = *(void *)(a1 + 64);
          __int16 v29 = (void *)MEMORY[0x263F087E8];
          uint64_t v50 = *MEMORY[0x263F08320];
          uint64_t v51 = @"Invalid deviceControlPID";
          uint64_t v30 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
          (*(void (**)(uint64_t, uint64_t))(v28 + 16))(v28, [v29 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v30]);
        }
      }
      else
      {
        __int16 v23 = CMIOLog();
        if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_3();
        }
        uint64_t v24 = *(void *)(a1 + 64);
        __int16 v25 = (void *)MEMORY[0x263F087E8];
        uint64_t v52 = *MEMORY[0x263F08320];
        __int16 v53 = @"Invalid clientID";
        uint64_t v26 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        (*(void (**)(uint64_t, uint64_t))(v24 + 16))(v24, [v25 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v26]);
      }
    }
    else
    {
      __int16 v19 = CMIOLog();
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_2();
      }
      uint64_t v20 = *(void *)(a1 + 64);
      __int16 v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v54 = *MEMORY[0x263F08320];
      __int16 v55 = @"Invalid property value";
      uint64_t v22 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, [v21 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v22]);
    }
  }
  else
  {
    __int16 v15 = CMIOLog();
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_1();
    }
    uint64_t v16 = *(void *)(a1 + 64);
    __int16 v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v56 = *MEMORY[0x263F08320];
    v57[0] = @"Invalid streamID";
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v57 forKeys:&v56 count:1];
    (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, [v17 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v18]);
  }
}

uint64_t __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_436(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_clientQueue_incrementPendingStartStreamCountForClientID:(id)a3 streamID:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = [NSString stringWithFormat:@"%@:%@:start-stream", objc_msgSend(a3, "UUIDString"), objc_msgSend(a4, "UUIDString")];
  int v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingCountMap, "objectForKeyedSubscript:", v5), "intValue");
  uint64_t v7 = CMIOLog();
  if (v7)
  {
    uint64_t v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316675;
      uint64_t v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v11 = 1024;
      int v12 = 3302;
      __int16 v13 = 2080;
      uint64_t v14 = "-[CMIOExtensionProvider _clientQueue_incrementPendingStartStreamCountForClientID:streamID:]";
      __int16 v15 = 2114;
      uint64_t v16 = self;
      __int16 v17 = 2113;
      uint64_t v18 = v5;
      __int16 v19 = 1025;
      int v20 = v6;
      __int16 v21 = 1025;
      int v22 = v6 + 1;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@, %{private}@ : %{private}d => %{private}d", buf, 0x3Cu);
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingCountMap, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:(v6 + 1)], v5);
}

- (void)_clientQueue_decrementPendingStreamStartCountForClientID:(id)a3 streamID:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v5 = [NSString stringWithFormat:@"%@:%@:start-stream", objc_msgSend(a3, "UUIDString"), objc_msgSend(a4, "UUIDString")];
  int v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingCountMap, "objectForKeyedSubscript:", v5), "intValue");
  uint64_t v7 = CMIOLog();
  if (v7)
  {
    uint64_t v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316675;
      __int16 v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v14 = 1024;
      int v15 = 3311;
      __int16 v16 = 2080;
      __int16 v17 = "-[CMIOExtensionProvider _clientQueue_decrementPendingStreamStartCountForClientID:streamID:]";
      __int16 v18 = 2114;
      __int16 v19 = self;
      __int16 v20 = 2113;
      uint64_t v21 = v5;
      __int16 v22 = 1025;
      int v23 = v6;
      __int16 v24 = 1025;
      int v25 = v6 - 1;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@, %{private}@ : %{private}d => %{private}d", buf, 0x3Cu);
    }
  }
  if (v6 >= 2)
  {
    uint64_t v9 = [NSNumber numberWithInt:(v6 - 1)];
    pendingCountMap = self->_pendingCountMap;
LABEL_11:
    [(NSMutableDictionary *)pendingCountMap setObject:v9 forKeyedSubscript:v5];
    return;
  }
  if (v6 == 1)
  {
    pendingCountMap = self->_pendingCountMap;
    uint64_t v9 = 0;
    goto LABEL_11;
  }
  __int16 v11 = CMIOLog();
  if (v11)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProvider _clientQueue_decrementPendingStreamStartCountForClientID:streamID:]();
    }
  }
}

- (int)_clientQueue_pendingStartStreamCountForClient:(id)a3 streamID:(id)a4
{
  int v4 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingCountMap, "objectForKeyedSubscript:", [NSString stringWithFormat:@"%@:%@:start-stream", objc_msgSend(a3, "UUIDString"), objc_msgSend(a4, "UUIDString")]);

  return [v4 intValue];
}

- (void)_clientQueue_removePendingStartStreamCountForClient:(id)a3 streamID:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = [NSString stringWithFormat:@"%@:%@:start-stream", objc_msgSend(a3, "UUIDString"), objc_msgSend(a4, "UUIDString")];
  uint64_t v6 = [(NSMutableDictionary *)self->_pendingCountMap objectForKeyedSubscript:v5];
  uint64_t v7 = CMIOLog();
  uint64_t v8 = v7;
  if (v6)
  {
    if (v7)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        int v10 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingCountMap, "objectForKeyedSubscript:", v5), "intValue");
        *(_DWORD *)buf = 136316419;
        int v12 = v9;
        __int16 v13 = 1024;
        int v14 = 3333;
        __int16 v15 = 2080;
        __int16 v16 = "-[CMIOExtensionProvider _clientQueue_removePendingStartStreamCountForClient:streamID:]";
        __int16 v17 = 2112;
        __int16 v18 = self;
        __int16 v19 = 2113;
        uint64_t v20 = v5;
        __int16 v21 = 1024;
        int v22 = v10;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@{public}, %{private}@: forcing pending stream start count %d => 0", buf, 0x36u);
      }
    }
    [(NSMutableDictionary *)self->_pendingCountMap setObject:0 forKeyedSubscript:v5];
  }
  else if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316163;
    int v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
    __int16 v13 = 1024;
    int v14 = 3337;
    __int16 v15 = 2080;
    __int16 v16 = "-[CMIOExtensionProvider _clientQueue_removePendingStartStreamCountForClient:streamID:]";
    __int16 v17 = 2112;
    __int16 v18 = self;
    __int16 v19 = 2113;
    uint64_t v20 = v5;
    _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@{public}, %{private}@: no pending stream starts", buf, 0x30u);
  }
}

- (void)startStreamForClientID:(id)a3 streamID:(id)a4 reply:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v9 = CMIOLog();
  if (v9)
  {
    int v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316163;
      int v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v15 = 1024;
      int v16 = 3343;
      __int16 v17 = 2080;
      __int16 v18 = "-[CMIOExtensionProvider startStreamForClientID:streamID:reply:]";
      __int16 v19 = 2114;
      uint64_t v20 = self;
      __int16 v21 = 2113;
      id v22 = a3;
      _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@, %{private}@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke;
  v12[3] = &unk_26517C068;
  v12[4] = self;
  v12[5] = a4;
  v12[6] = a3;
  v12[7] = a5;
  dispatch_async(clientQueue, v12);
}

uint64_t __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke(uint64_t a1)
{
  v75[1] = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 88) objectForKey:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  if (!v2)
  {
    int v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_cold_1();
    }
    uint64_t v11 = *(void *)(a1 + 56);
    int v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v74 = *MEMORY[0x263F08320];
    v75[0] = @"Invalid streamID";
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v75 forKeys:&v74 count:1];
    return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 16))(v11, [v12 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v13]);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  id v3 = (id)[*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 48)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  if (!v3)
  {
    int v14 = CMIOLog();
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_cold_2();
    }
    uint64_t v15 = *(void *)(a1 + 56);
    int v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v72 = *MEMORY[0x263F08320];
    uint64_t v73 = @"Invalid clientID";
    uint64_t v17 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    return (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 16))(v15, [v16 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v17]);
  }
  uint64_t v4 = [v3 clientInfo];
  if ((objc_msgSend((id)objc_msgSend(v2, "source"), "authorizedToStartStreamForClient:", v4) & 1) == 0)
  {
    long long v34 = CMIOLog();
    id v35 = v34;
    if (v34 && os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      uint64_t v37 = *(void *)(a1 + 32);
      uint64_t v38 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136316163;
      uint64_t v56 = v36;
      __int16 v57 = 1024;
      int v58 = 3380;
      __int16 v59 = 2080;
      uint64_t v60 = "-[CMIOExtensionProvider startStreamForClientID:streamID:reply:]_block_invoke";
      __int16 v61 = 2114;
      uint64_t v62 = v37;
      __int16 v63 = 2113;
      *(void *)uint64_t v64 = v38;
      _os_log_impl(&dword_2432B6000, v35, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: refusing streaming for clientID %{private}@", buf, 0x30u);
    }
    uint64_t v39 = *(void *)(a1 + 56);
    int v40 = (void *)MEMORY[0x263F087E8];
    uint64_t v70 = *MEMORY[0x263F08320];
    id v71 = @"Refusing streaming request";
    uint64_t v41 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    return (*(uint64_t (**)(uint64_t, uint64_t))(v39 + 16))(v39, [v40 errorWithDomain:*MEMORY[0x263F08410] code:-4 userInfo:v41]);
  }
  if ([v2 direction])
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
LABEL_6:
    BOOL v7 = 0;
    int v8 = 0;
    goto LABEL_7;
  }
  __int16 v42 = (void *)v4;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v26 = objc_msgSend((id)objc_msgSend(v2, "source"), "formats");
  uint64_t v6 = [v26 countByEnumeratingWithState:&v51 objects:v69 count:16];
  if (!v6)
  {
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  char v27 = 0;
  char v28 = 0;
  uint64_t v29 = *(void *)v52;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v52 != v29) {
        objc_enumerationMutation(v26);
      }
      CMMediaType MediaType = CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)[*(id *)(*((void *)&v51 + 1) + 8 * i) formatDescription]);
      if (MediaType == 1836415096)
      {
        char v27 = 1;
LABEL_43:
        char v28 = 1;
        goto LABEL_44;
      }
      if (MediaType != 1936684398) {
        goto LABEL_43;
      }
      char v27 = 1;
LABEL_44:
      int v8 = v28 & 1;
      if (v27 & 1) != 0 && (v28) {
        goto LABEL_50;
      }
    }
    uint64_t v6 = [v26 countByEnumeratingWithState:&v51 objects:v69 count:16];
    if (v6) {
      continue;
    }
    break;
  }
  if ((v27 & 1) == 0)
  {
    uint64_t v5 = 0;
    BOOL v7 = 0;
    goto LABEL_57;
  }
LABEL_50:
  if (![v42 microphoneAuthorizationStatus]) {
    [v42 authorizationStatusForMediaType:1936684398];
  }
  BOOL v7 = [v42 microphoneAuthorizationStatus] != 3;
  if ([v42 microphoneAuthorizationStatus])
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 1;
    if (([v42 hasPendingMicrophoneAuthorizationRequest] & 1) == 0)
    {
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_440;
      v47[3] = &unk_26517C0B8;
      uint64_t v32 = *(void *)(a1 + 32);
      char v49 = v28 & 1;
      v47[4] = v32;
      v47[5] = v42;
      int8x16_t v48 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
      char v50 = 1;
      [v42 requestAccessForMediaType:1936684398 performPreFlightTest:0 reply:v47];
    }
  }
LABEL_57:
  uint64_t v6 = v8 != 0;
  if (v28)
  {
    if (![v42 cameraAuthorizationStatus]) {
      [v42 authorizationStatusForMediaType:1986618469];
    }
    int v8 = [v42 cameraAuthorizationStatus] != 3;
    if ([v42 cameraAuthorizationStatus])
    {
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v6 = 1;
      if (([v42 hasPendingCameraAuthorizationRequest] & 1) == 0)
      {
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_442;
        v43[3] = &unk_26517C0B8;
        uint64_t v33 = *(void *)(a1 + 32);
        char v45 = v5;
        v43[4] = v33;
        v43[5] = v42;
        int8x16_t v44 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
        char v46 = 1;
        [v42 requestAccessForMediaType:1986618469 performPreFlightTest:0 reply:v43];
      }
    }
  }
LABEL_7:
  if (!v7 && !v8) {
    return objc_msgSend(*(id *)(a1 + 32), "_clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:", *(void *)(a1 + 48), *(void *)(a1 + 40), v5, v6, *(void *)(a1 + 56));
  }
  __int16 v18 = CMIOLog();
  __int16 v19 = v18;
  if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
    uint64_t v21 = *(void *)(a1 + 32);
    if (v7) {
      int v22 = 84;
    }
    else {
      int v22 = 70;
    }
    *(_DWORD *)buf = 136316930;
    if (v8) {
      int v23 = 84;
    }
    else {
      int v23 = 70;
    }
    uint64_t v56 = v20;
    int v58 = 3455;
    if (v5) {
      int v24 = 84;
    }
    else {
      int v24 = 70;
    }
    __int16 v57 = 1024;
    __int16 v59 = 2080;
    uint64_t v60 = "-[CMIOExtensionProvider startStreamForClientID:streamID:reply:]_block_invoke";
    if (v6) {
      int v25 = 84;
    }
    else {
      int v25 = 70;
    }
    __int16 v61 = 2114;
    uint64_t v62 = v21;
    __int16 v63 = 1024;
    *(_DWORD *)uint64_t v64 = v22;
    *(_WORD *)&v64[4] = 1024;
    *(_DWORD *)&v64[6] = v23;
    __int16 v65 = 1024;
    int v66 = v24;
    __int16 v67 = 1024;
    int v68 = v25;
    _os_log_impl(&dword_2432B6000, v19, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: waiting for authorization (audio %c, video %c), requesting audio %c, video %c... returning no error so we don't jam up the caller", buf, 0x3Eu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_clientQueue_incrementPendingStartStreamCountForClientID:streamID:", *(void *)(a1 + 48), *(void *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_440(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = CMIOLog();
  if (v4)
  {
    uint64_t v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)int v10 = 136316162;
      if (a2 == 3) {
        int v8 = 89;
      }
      else {
        int v8 = 78;
      }
      *(void *)&v10[4] = v6;
      __int16 v11 = 1024;
      int v12 = 3419;
      __int16 v13 = 2080;
      int v14 = "-[CMIOExtensionProvider startStreamForClientID:streamID:reply:]_block_invoke";
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      __int16 v17 = 1024;
      int v18 = v8;
      _os_log_impl(&dword_2432B6000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: authorized for microphone %c", v10, 0x2Cu);
    }
  }
  if (a2 == 3)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      if ([*(id *)(a1 + 40) cameraAuthorizationStatus] != 3) {
        return;
      }
      BOOL v9 = *(unsigned char *)(a1 + 64) != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_performDeferredStreamStartsForClient:streamID:requestVideo:requestAudio:", *(void *)(a1 + 48), *(void *)(a1 + 56), v9, *(unsigned __int8 *)(a1 + 65), *(void *)v10);
  }
}

void __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_442(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = CMIOLog();
  if (v4)
  {
    uint64_t v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)int v10 = 136316162;
      if (a2 == 3) {
        int v8 = 89;
      }
      else {
        int v8 = 78;
      }
      *(void *)&v10[4] = v6;
      __int16 v11 = 1024;
      int v12 = 3442;
      __int16 v13 = 2080;
      int v14 = "-[CMIOExtensionProvider startStreamForClientID:streamID:reply:]_block_invoke";
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      __int16 v17 = 1024;
      int v18 = v8;
      _os_log_impl(&dword_2432B6000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: authorized for camera %c", v10, 0x2Cu);
    }
  }
  if (a2 == 3)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      if ([*(id *)(a1 + 40) microphoneAuthorizationStatus] != 3) {
        return;
      }
      BOOL v9 = *(unsigned char *)(a1 + 64) != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_performDeferredStreamStartsForClient:streamID:requestVideo:requestAudio:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 65), v9, *(void *)v10);
  }
}

- (void)_clientQueue_startStreamForClientID:(id)a3 streamID:(id)a4 requestAudio:(BOOL)a5 requestVideo:(BOOL)a6 reply:(id)a7
{
  v47[1] = *MEMORY[0x263EF8340];
  __int16 v11 = CMIOLog();
  if (v11)
  {
    int v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316163;
      uint64_t v36 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v37 = 1024;
      int v38 = 3467;
      __int16 v39 = 2080;
      int v40 = "-[CMIOExtensionProvider _clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:]";
      __int16 v41 = 2114;
      *(void *)__int16 v42 = self;
      *(_WORD *)&v42[8] = 2113;
      v43[0] = a3;
      _os_log_impl(&dword_2432B6000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@, %{private}@", buf, 0x30u);
    }
  }
  os_unfair_lock_lock(&self->_streamsMapLock);
  id v13 = (id)[(NSMutableDictionary *)self->_streamsMap objectForKey:a4];
  os_unfair_lock_unlock(&self->_streamsMapLock);
  if (v13)
  {
    os_unfair_lock_lock(&self->_contextsMapLock);
    id v14 = (id)[(NSMutableDictionary *)self->_contextsMap objectForKey:a3];
    os_unfair_lock_unlock(&self->_contextsMapLock);
    if (v14)
    {
      __int16 v15 = (void *)[v14 clientInfo];
      v34[0] = 0;
      if (objc_msgSend((id)objc_msgSend(v13, "_clientQueue_streamingClientsMap"), "count"))
      {
        uint64_t v16 = CMIOLog();
        __int16 v17 = v16;
        if (v16)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
            *(_DWORD *)buf = 136316163;
            uint64_t v36 = v18;
            __int16 v37 = 1024;
            int v38 = 3518;
            __int16 v39 = 2080;
            int v40 = "-[CMIOExtensionProvider _clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:]";
            __int16 v41 = 2114;
            *(void *)__int16 v42 = self;
            *(_WORD *)&v42[8] = 2113;
            v43[0] = v15;
            _os_log_impl(&dword_2432B6000, v17, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: add streaming client %{private}@", buf, 0x30u);
          }
        }
        objc_msgSend(v13, "_clientQueue_addStreamingClient:", v15);
      }
      else
      {
        objc_msgSend(v14, "setClientSourcedByNonStreamingProxyFrontedExtension:", -[NSArray containsObject:](self->_nonStreamingProxyFrontedExtensionPIDs, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "pid"))));
        int v25 = CMIOLog();
        uint64_t v26 = v25;
        if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          char v27 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          int v28 = [v15 pid];
          int v29 = [v14 isClientSourcedByNonStreamingProxyFrontedExtension];
          *(_DWORD *)buf = 136316419;
          if (v29) {
            int v30 = 84;
          }
          else {
            int v30 = 70;
          }
          uint64_t v36 = v27;
          __int16 v37 = 1024;
          int v38 = 3501;
          __int16 v39 = 2080;
          int v40 = "-[CMIOExtensionProvider _clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:]";
          __int16 v41 = 1025;
          *(_DWORD *)__int16 v42 = v28;
          *(_WORD *)&v42[4] = 1024;
          *(_DWORD *)&v42[6] = v30;
          LOWORD(v43[0]) = 2112;
          *(void *)((char *)v43 + 2) = v14;
          _os_log_impl(&dword_2432B6000, v26, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] set proxy streaming status to %c for %@", buf, 0x32u);
        }
        if (objc_msgSend((id)objc_msgSend(v13, "source"), "startStreamAndReturnError:", v34))
        {
          uint64_t v31 = CMIOLog();
          uint64_t v32 = v31;
          if (v31 && os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
            *(_DWORD *)buf = 136316163;
            uint64_t v36 = v33;
            __int16 v37 = 1024;
            int v38 = 3511;
            __int16 v39 = 2080;
            int v40 = "-[CMIOExtensionProvider _clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:]";
            __int16 v41 = 2114;
            *(void *)__int16 v42 = self;
            *(_WORD *)&v42[8] = 2113;
            v43[0] = v15;
            _os_log_impl(&dword_2432B6000, v32, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: start streaming for client %{private}@", buf, 0x30u);
          }
          objc_msgSend(v13, "_clientQueue_addStreamingClient:", v15);
          [(CMIOExtensionProvider *)self _clientQueue_notifyIsRunningSomewhereForStream:v13];
        }
      }
      (*((void (**)(id, void))a7 + 2))(a7, v34[0]);
    }
    else
    {
      int v22 = CMIOLog();
      if (v22 && os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionProvider _clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:]();
      }
      int v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v44 = *MEMORY[0x263F08320];
      char v45 = @"Invalid clientID";
      uint64_t v24 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      (*((void (**)(id, uint64_t))a7 + 2))(a7, [v23 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v24]);
    }
  }
  else
  {
    uint64_t v19 = CMIOLog();
    if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProvider _clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:]();
    }
    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v46 = *MEMORY[0x263F08320];
    v47[0] = @"Invalid streamID";
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
    (*((void (**)(id, uint64_t))a7 + 2))(a7, [v20 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v21]);
  }
}

- (void)_performDeferredStreamStartsForClient:(id)a3 streamID:(id)a4 requestVideo:(BOOL)a5 requestAudio:(BOOL)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  __int16 v11 = CMIOLog();
  if (v11)
  {
    int v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      int v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v19 = 1024;
      int v20 = 3568;
      __int16 v21 = 2080;
      int v22 = "-[CMIOExtensionProvider _performDeferredStreamStartsForClient:streamID:requestVideo:requestAudio:]";
      __int16 v23 = 2114;
      uint64_t v24 = self;
      _os_log_impl(&dword_2432B6000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: dispatching pending stream starting to client queue", buf, 0x26u);
    }
  }
  clientQueue = self->_clientQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __98__CMIOExtensionProvider__performDeferredStreamStartsForClient_streamID_requestVideo_requestAudio___block_invoke;
  v14[3] = &unk_26517C108;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  BOOL v15 = a6;
  BOOL v16 = a5;
  dispatch_async(clientQueue, v14);
}

void __98__CMIOExtensionProvider__performDeferredStreamStartsForClient_streamID_requestVideo_requestAudio___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v2 = objc_msgSend(*(id *)(a1 + 32), "_clientQueue_pendingStartStreamCountForClient:streamID:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_clientQueue_removePendingStartStreamCountForClient:streamID:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  id v3 = CMIOLog();
  if (v3)
  {
    uint64_t v5 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136316162;
      __int16 v23 = v6;
      __int16 v24 = 1024;
      int v25 = 3572;
      __int16 v26 = 2080;
      char v27 = "-[CMIOExtensionProvider _performDeferredStreamStartsForClient:streamID:requestVideo:requestAudio:]_block_invoke";
      __int16 v28 = 2114;
      uint64_t v29 = v7;
      __int16 v30 = 1024;
      int v31 = v2;
      _os_log_impl(&dword_2432B6000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: %d stream starts are pending", buf, 0x2Cu);
    }
  }
  if (v2 >= 1)
  {
    int v8 = 0;
    *(void *)&long long v4 = 136316162;
    long long v18 = v4;
    do
    {
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x2020000000;
      int v21 = v8 + 1;
      BOOL v9 = CMIOLog();
      int v10 = v9;
      if (v9)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          uint64_t v12 = *(void *)(a1 + 32);
          *(_DWORD *)buf = v18;
          __int16 v23 = v11;
          __int16 v24 = 1024;
          int v25 = 3576;
          __int16 v26 = 2080;
          char v27 = "-[CMIOExtensionProvider _performDeferredStreamStartsForClient:streamID:requestVideo:requestAudio:]_block_invoke";
          __int16 v28 = 2114;
          uint64_t v29 = v12;
          __int16 v30 = 1024;
          int v31 = v8 + 1;
          _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: attempting deferred stream start %d", buf, 0x2Cu);
        }
      }
      id v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v16 = *(unsigned __int8 *)(a1 + 56);
      uint64_t v17 = *(unsigned __int8 *)(a1 + 57);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __98__CMIOExtensionProvider__performDeferredStreamStartsForClient_streamID_requestVideo_requestAudio___block_invoke_443;
      v19[3] = &unk_26517C0E0;
      v19[4] = v13;
      v19[5] = v20;
      objc_msgSend(v13, "_clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:", v14, v15, v16, v17, v19, v18);
      _Block_object_dispose(v20, 8);
      ++v8;
    }
    while (v2 != v8);
  }
}

void __98__CMIOExtensionProvider__performDeferredStreamStartsForClient_streamID_requestVideo_requestAudio___block_invoke_443(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v4 = CMIOLog();
  uint64_t v5 = v4;
  if (a2)
  {
    if (v4)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __98__CMIOExtensionProvider__performDeferredStreamStartsForClient_streamID_requestVideo_requestAudio___block_invoke_443_cold_1();
      }
    }
  }
  else if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    int v9 = 136316162;
    int v10 = v6;
    __int16 v11 = 1024;
    int v12 = 3582;
    __int16 v13 = 2080;
    uint64_t v14 = "-[CMIOExtensionProvider _performDeferredStreamStartsForClient:streamID:requestVideo:requestAudio:]_block_invoke";
    __int16 v15 = 2114;
    uint64_t v16 = v7;
    __int16 v17 = 1026;
    int v18 = v8;
    _os_log_impl(&dword_2432B6000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: startStream %{public}d succeeded", (uint8_t *)&v9, 0x2Cu);
  }
}

- (void)stopStreamForClientID:(id)a3 streamID:(id)a4 reply:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v9 = CMIOLog();
  if (v9)
  {
    int v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316163;
      uint64_t v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v15 = 1024;
      int v16 = 3592;
      __int16 v17 = 2080;
      int v18 = "-[CMIOExtensionProvider stopStreamForClientID:streamID:reply:]";
      __int16 v19 = 2114;
      int v20 = self;
      __int16 v21 = 2113;
      id v22 = a3;
      _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@, %{private}@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke;
  v12[3] = &unk_26517C130;
  v12[4] = self;
  v12[5] = a3;
  v12[6] = a4;
  v12[7] = a5;
  dispatch_async(clientQueue, v12);
}

uint64_t __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke(uint64_t a1)
{
  v45[1] = *MEMORY[0x263EF8340];
  int v2 = (void *)(a1 + 40);
  int v3 = objc_msgSend(*(id *)(a1 + 32), "_clientQueue_pendingStartStreamCountForClient:streamID:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  if (v3 < 1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
    id v10 = (id)[*(id *)(*(void *)(a1 + 32) + 88) objectForKey:*(void *)(a1 + 48)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
    if (v10)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
      id v11 = (id)[*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
      if (v11)
      {
        uint64_t v12 = [v11 clientInfo];
        uint64_t v31 = 0;
        __int16 v13 = objc_msgSend(v10, "_clientQueue_streamingClientsMap");
        if ([v13 objectForKey:*v2] && objc_msgSend(v13, "count") == 1)
        {
          if ((objc_msgSend((id)objc_msgSend(v10, "source"), "stopStreamAndReturnError:", &v31) & 1) == 0)
          {
            uint64_t v14 = CMIOLog();
            if (v14)
            {
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
                __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke_cold_3();
              }
            }
          }
          objc_msgSend(v10, "_clientQueue_removeStreamingClient:", v12);
          __int16 v15 = CMIOLog();
          int v16 = v15;
          if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
            uint64_t v18 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 136316163;
            uint64_t v33 = v17;
            __int16 v34 = 1024;
            int v35 = 3646;
            __int16 v36 = 2080;
            __int16 v37 = "-[CMIOExtensionProvider stopStreamForClientID:streamID:reply:]_block_invoke";
            __int16 v38 = 2114;
            uint64_t v39 = v18;
            __int16 v40 = 2113;
            uint64_t v41 = v12;
            _os_log_impl(&dword_2432B6000, v16, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@, stop streaming for client %{private}@", buf, 0x30u);
          }
          objc_msgSend(*(id *)(a1 + 32), "_clientQueue_notifyIsRunningSomewhereForStream:", v10);
        }
        else
        {
          objc_msgSend(v10, "_clientQueue_removeStreamingClient:", v12);
          uint64_t v23 = CMIOLog();
          if (v23)
          {
            __int16 v24 = v23;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              int v25 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
              uint64_t v26 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 136316163;
              uint64_t v33 = v25;
              __int16 v34 = 1024;
              int v35 = 3653;
              __int16 v36 = 2080;
              __int16 v37 = "-[CMIOExtensionProvider stopStreamForClientID:streamID:reply:]_block_invoke";
              __int16 v38 = 2114;
              uint64_t v39 = v26;
              __int16 v40 = 2113;
              uint64_t v41 = v12;
              _os_log_impl(&dword_2432B6000, v24, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@, removed streaming client %{private}@", buf, 0x30u);
            }
          }
        }
        if (![v10 direction]) {
          [*(id *)(a1 + 32) removeSystemStatusAttributionsForClient:v12 stream:v10];
        }
        return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      else
      {
        char v27 = CMIOLog();
        if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke_cold_2();
        }
        uint64_t v28 = *(void *)(a1 + 56);
        uint64_t v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v42 = *MEMORY[0x263F08320];
        int v43 = @"Invalid clientID";
        uint64_t v30 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        return (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 16))(v28, [v29 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v30]);
      }
    }
    else
    {
      __int16 v19 = CMIOLog();
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke_cold_1();
      }
      uint64_t v20 = *(void *)(a1 + 56);
      __int16 v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v44 = *MEMORY[0x263F08320];
      v45[0] = @"Invalid streamID";
      uint64_t v22 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
      return (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 16))(v20, [v21 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v22]);
    }
  }
  else
  {
    int v4 = v3;
    uint64_t v5 = CMIOLog();
    if (v5)
    {
      uint64_t v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136316162;
        uint64_t v33 = v7;
        __int16 v34 = 1024;
        int v35 = 3598;
        __int16 v36 = 2080;
        __int16 v37 = "-[CMIOExtensionProvider stopStreamForClientID:streamID:reply:]_block_invoke";
        __int16 v38 = 2114;
        uint64_t v39 = v8;
        __int16 v40 = 1024;
        LODWORD(v41) = v4;
        _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: stop called for pending deferred start %d... just returning", buf, 0x2Cu);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_clientQueue_decrementPendingStreamStartCountForClientID:streamID:", *(void *)(a1 + 40), *(void *)(a1 + 48));
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)notifyAvailableDevicesChanged:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = CMIOLogLevel(1);
  if (v5)
  {
    uint64_t v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v22 = 1024;
      int v23 = 3666;
      __int16 v24 = 2080;
      int v25 = "-[CMIOExtensionProvider notifyAvailableDevicesChanged:]";
      __int16 v26 = 2112;
      char v27 = self;
      __int16 v28 = 2112;
      id v29 = a3;
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  uint64_t v7 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(a3);
        }
        -[NSArray addObject:](v7, "addObject:", [*(id *)(*((void *)&v15 + 1) + 8 * v11++) UUIDString]);
      }
      while (v9 != v11);
      uint64_t v9 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  os_unfair_lock_lock(&self->_changedDeviceIDsLock);
  changedDeviceIDs = self->_changedDeviceIDs;
  self->_changedDeviceIDs = v7;
  os_unfair_lock_unlock(&self->_changedDeviceIDsLock);

  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CMIOExtensionProvider_notifyAvailableDevicesChanged___block_invoke;
  block[3] = &unk_26517BF28;
  block[4] = self;
  dispatch_async(clientQueue, block);
}

void __55__CMIOExtensionProvider_notifyAvailableDevicesChanged___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 120);
  *(void *)(v2 + 120) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    int v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) allValues];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) availableDevicesChanged:v3];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)notifyAvailableStreamsChangedWithDeviceID:(id)a3 streamIDs:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v7 = CMIOLogLevel(1);
  if (v7)
  {
    uint64_t v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      int v23 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v24 = 1024;
      int v25 = 3709;
      __int16 v26 = 2080;
      char v27 = "-[CMIOExtensionProvider notifyAvailableStreamsChangedWithDeviceID:streamIDs:]";
      __int16 v28 = 2112;
      id v29 = self;
      __int16 v30 = 2112;
      id v31 = a3;
      __int16 v32 = 2112;
      id v33 = a4;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@, %@", buf, 0x3Au);
    }
  }
  long long v9 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [a4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(a4);
        }
        -[NSArray addObject:](v9, "addObject:", [*(id *)(*((void *)&v17 + 1) + 8 * v13++) UUIDString]);
      }
      while (v11 != v13);
      uint64_t v11 = [a4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
  os_unfair_lock_lock(&self->_changedStreamIDsLock);
  changedStreamIDs = self->_changedStreamIDs;
  self->_changedStreamIDs = v9;
  os_unfair_lock_unlock(&self->_changedStreamIDsLock);

  clientQueue = self->_clientQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__CMIOExtensionProvider_notifyAvailableStreamsChangedWithDeviceID_streamIDs___block_invoke;
  id v16[3] = &unk_26517BF78;
  v16[4] = self;
  v16[5] = a3;
  dispatch_async(clientQueue, v16);
}

void __77__CMIOExtensionProvider_notifyAvailableStreamsChangedWithDeviceID_streamIDs___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 128));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 136);
  *(void *)(v2 + 136) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 128));
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    int v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) allValues];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "availableStreamsChangedWithDeviceID:streamIDs:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"), v3);
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)captureAsyncStillImageForClientID:(id)a3 streamID:(id)a4 uniqueID:(int64_t)a5 options:(id)a6 reply:(id)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v13 = CMIOLogLevel(1);
  if (v13)
  {
    uint64_t v14 = v13;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      long long v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v19 = 1024;
      int v20 = 3752;
      __int16 v21 = 2080;
      __int16 v22 = "-[CMIOExtensionProvider captureAsyncStillImageForClientID:streamID:uniqueID:options:reply:]";
      __int16 v23 = 2112;
      __int16 v24 = self;
      __int16 v25 = 2112;
      id v26 = a3;
      __int16 v27 = 2112;
      id v28 = a4;
      _os_log_impl(&dword_2432B6000, v14, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@, %@", buf, 0x3Au);
    }
  }
  clientQueue = self->_clientQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke;
  id v16[3] = &unk_26517C180;
  v16[4] = self;
  v16[5] = a4;
  v16[8] = a7;
  v16[9] = a5;
  void v16[6] = a3;
  v16[7] = a6;
  dispatch_async(clientQueue, v16);
}

uint64_t __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke(void *a1)
{
  v25[1] = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 80));
  id v2 = (id)[*(id *)(a1[4] + 88) objectForKey:a1[5]];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 80));
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 16));
    id v3 = (id)[*(id *)(a1[4] + 32) objectForKey:a1[6]];
    objc_msgSend(v3, "setClientSourcedByNonStreamingProxyFrontedExtension:", objc_msgSend(*(id *)(a1[4] + 160), "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v3, "clientInfo"), "pid"))));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
    if (v3)
    {
      if ([v3 isClientSourcedByNonStreamingProxyFrontedExtension])
      {
        int v4 = CMIOLog();
        if (v4)
        {
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
            __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_cold_3();
          }
        }
        uint64_t v5 = a1[8];
        uint64_t v6 = (void *)MEMORY[0x263F087E8];
        uint64_t v20 = *MEMORY[0x263F08320];
        __int16 v21 = @"Client is fronted by proxy that is not streaming";
        uint64_t v7 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        return (*(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 16))(v5, 0, [v6 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v7]);
      }
      else
      {
        uint64_t v17 = a1[7];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_447;
        v19[3] = &unk_26517C158;
        uint64_t v18 = a1[9];
        v19[4] = a1[8];
        return [v2 captureAsyncStillImage:v18 options:v17 completionHandler:v19];
      }
    }
    else
    {
      uint64_t v13 = CMIOLog();
      if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_cold_2();
      }
      uint64_t v14 = a1[8];
      long long v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = *MEMORY[0x263F08320];
      __int16 v23 = @"Invalid clientID";
      uint64_t v16 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      return (*(uint64_t (**)(uint64_t, void, uint64_t))(v14 + 16))(v14, 0, [v15 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v16]);
    }
  }
  else
  {
    long long v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_cold_1();
    }
    uint64_t v10 = a1[8];
    long long v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08320];
    v25[0] = @"Invalid streamID";
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v10 + 16))(v10, 0, [v11 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v12]);
  }
}

uint64_t __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_447(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:a3 userInfo:0];
  }
  int v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

- (void)enqueueReactionEffectForClientID:(id)a3 streamID:(id)a4 reactionType:(id)a5 reply:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v11 = CMIOLogLevel(1);
  if (v11)
  {
    uint64_t v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v17 = 1024;
      int v18 = 3804;
      __int16 v19 = 2080;
      uint64_t v20 = "-[CMIOExtensionProvider enqueueReactionEffectForClientID:streamID:reactionType:reply:]";
      __int16 v21 = 2112;
      uint64_t v22 = self;
      __int16 v23 = 2112;
      id v24 = a3;
      __int16 v25 = 2112;
      id v26 = a4;
      _os_log_impl(&dword_2432B6000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@, %@", buf, 0x3Au);
    }
  }
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke;
  block[3] = &unk_26517C090;
  block[4] = self;
  void block[5] = a4;
  void block[7] = a5;
  block[8] = a6;
  block[6] = a3;
  dispatch_async(clientQueue, block);
}

uint64_t __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke(void *a1)
{
  v18[1] = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 80));
  id v2 = (id)[*(id *)(a1[4] + 88) objectForKey:a1[5]];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 80));
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 16));
    id v3 = (id)[*(id *)(a1[4] + 32) objectForKey:a1[6]];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
    if (v3)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke_450;
      v14[3] = &unk_26517C1A8;
      uint64_t v4 = a1[7];
      v14[4] = a1[8];
      return [v2 enqueueReactionEffect:v4 completionHandler:v14];
    }
    else
    {
      uint64_t v10 = CMIOLog();
      if (v10)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke_cold_2();
        }
      }
      uint64_t v11 = a1[8];
      uint64_t v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F08320];
      uint64_t v16 = @"Invalid clientID";
      uint64_t v13 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 16))(v11, [v12 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v13]);
    }
  }
  else
  {
    uint64_t v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke_cold_1();
    }
    uint64_t v7 = a1[8];
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08320];
    v18[0] = @"Invalid streamID";
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, [v8 errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:v9]);
  }
}

uint64_t __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke_450(uint64_t a1, int a2)
{
  if (a2) {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:a2 userInfo:0];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (void)_clientQueue_notifyDevicePropertiesChangedWithDeviceID:(id)a3 propertyStates:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v7 = CMIOLogLevel(1);
  if (v7)
  {
    uint64_t v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v22 = 1024;
      int v23 = 3850;
      __int16 v24 = 2080;
      __int16 v25 = "-[CMIOExtensionProvider _clientQueue_notifyDevicePropertiesChangedWithDeviceID:propertyStates:]";
      __int16 v26 = 2112;
      uint64_t v27 = self;
      __int16 v28 = 2112;
      id v29 = a3;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  p_contextsMapLocuint64_t k = &self->_contextsMapLock;
  os_unfair_lock_lock(&self->_contextsMapLock);
  uint64_t v10 = (void *)[(NSMutableDictionary *)self->_contextsMap allValues];
  os_unfair_lock_unlock(p_contextsMapLock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "devicePropertiesChangedWithDeviceID:propertyStates:", objc_msgSend(a3, "UUIDString"), a4);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)_clientQueue_notifyStreamPropertiesChangedWithStreamID:(id)a3 propertyStates:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v7 = CMIOLogLevel(1);
  if (v7)
  {
    uint64_t v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v22 = 1024;
      int v23 = 3866;
      __int16 v24 = 2080;
      __int16 v25 = "-[CMIOExtensionProvider _clientQueue_notifyStreamPropertiesChangedWithStreamID:propertyStates:]";
      __int16 v26 = 2112;
      uint64_t v27 = self;
      __int16 v28 = 2112;
      id v29 = a3;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  p_contextsMapLocuint64_t k = &self->_contextsMapLock;
  os_unfair_lock_lock(&self->_contextsMapLock);
  uint64_t v10 = (void *)[(NSMutableDictionary *)self->_contextsMap allValues];
  os_unfair_lock_unlock(p_contextsMapLock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "streamPropertiesChangedWithStreamID:propertyStates:", objc_msgSend(a3, "UUIDString"), a4);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)_clientQueue_notifyIsRunningSomewhereForStream:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v5 = CMIOLogLevel(1);
  if (v5)
  {
    uint64_t v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      id v29 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v30 = 1024;
      int v31 = 3882;
      __int16 v32 = 2080;
      id v33 = "-[CMIOExtensionProvider _clientQueue_notifyIsRunningSomewhereForStream:]";
      __int16 v34 = 2112;
      int v35 = self;
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
    }
  }
  uint64_t v7 = (void *)[a3 parent];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = objc_msgSend(v7, "streams", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (!v9)
  {
    if (([v7 isRunningSomewhere] & 1) == 0) {
      return;
    }
    char v11 = 0;
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  char v11 = 0;
  uint64_t v12 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(v8);
      }
      v11 |= objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "_clientQueue_streamingClientsMap"), "count") != 0;
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
  }
  while (v10);
  if ((v11 & 1) != [v7 isRunningSomewhere])
  {
LABEL_15:
    [v7 setRunningSomewhere:v11 & 1];
    uint64_t v14 = [CMIOExtensionPropertyState alloc];
    long long v15 = -[CMIOExtensionPropertyState initWithValue:attributes:](v14, "initWithValue:attributes:", [NSNumber numberWithBool:v11 & 1], +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
    long long v16 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", objc_msgSend((id)objc_msgSend(a3, "streamID"), "UUIDString"), +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
    long long v17 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", objc_msgSend((id)objc_msgSend(v7, "deviceID"), "UUIDString"), +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
    if ([v7 legacyDeviceID]
      && (objc_msgSend((id)objc_msgSend(v7, "legacyDeviceID"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v7, "deviceID"), "UUIDString")) & 1) == 0)
    {
      long long v18 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", [v7 legacyDeviceID], +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
    }
    else
    {
      long long v18 = 0;
    }
    v25[0] = 0x26F89C4D0;
    v25[1] = 0x26F89C4F0;
    v26[0] = v15;
    v26[1] = v16;
    void v25[2] = 0x26F89C470;
    v26[2] = v17;
    __int16 v19 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3));
    uint64_t v20 = v19;
    if (v18) {
      [v19 setObject:v18 forKeyedSubscript:0x26F89C490];
    }

    [v7 notifyPropertiesChanged:v20];
  }
}

- (void)_clientQueue_sendSampleForStream:(id)a3 sample:(id)a4
{
  id v4 = a4;
  uint64_t v60 = *MEMORY[0x263EF8340];
  FormatDescription = CMSampleBufferGetFormatDescription((CMSampleBufferRef)[a4 sampleBuffer]);
  CMMediaType MediaType = CMFormatDescriptionGetMediaType(FormatDescription);
  uint64_t v8 = CMIOLogLevel(3);
  if (v8)
  {
    uint64_t v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136317186;
      int v43 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v44 = 1024;
      int v45 = 3922;
      __int16 v46 = 2080;
      id v47 = "-[CMIOExtensionProvider _clientQueue_sendSampleForStream:sample:]";
      __int16 v48 = 2112;
      char v49 = self;
      __int16 v50 = 2112;
      id v51 = a3;
      __int16 v52 = 1024;
      CMMediaType v53 = HIBYTE(MediaType);
      __int16 v54 = 1024;
      int v55 = BYTE2(MediaType);
      __int16 v56 = 1024;
      int v57 = BYTE1(MediaType);
      __int16 v58 = 1024;
      int v59 = MediaType;
      _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@ %c%c%c%c", buf, 0x48u);
    }
  }
  p_contextsMapLocuint64_t k = &self->_contextsMapLock;
  os_unfair_lock_lock(&self->_contextsMapLock);
  char v11 = (void *)[(NSMutableDictionary *)self->_contextsMap allValues];
  uint64_t v12 = v11;
  if (self->_nonStreamingProxyFrontedExtensionPIDsHasChanged)
  {
    id v30 = v4;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "setClientSourcedByNonStreamingProxyFrontedExtension:", -[NSArray containsObject:](self->_nonStreamingProxyFrontedExtensionPIDs, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "clientInfo"), "pid"))));
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v14);
    }
    self->_nonStreamingProxyFrontedExtensionPIDsHasChanged = 0;
    p_contextsMapLocuint64_t k = &self->_contextsMapLock;
    id v4 = v30;
  }
  os_unfair_lock_unlock(p_contextsMapLock);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v17 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v33;
    HIDWORD(v29) = BYTE1(MediaType);
    LODWORD(v29) = MediaType;
    *(void *)&long long v18 = 136317186;
    long long v28 = v18;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v12);
        }
        long long v22 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        if (objc_msgSend((id)objc_msgSend(a3, "_clientQueue_streamingClientsMap", v28, v29), "objectForKey:", objc_msgSend((id)objc_msgSend(v22, "clientInfo"), "clientID")))
        {
          long long v23 = (void *)[v22 clientInfo];
          if (MediaType == 1936684398) {
            uint64_t v24 = [v23 microphoneAuthorizationStatus];
          }
          else {
            uint64_t v24 = [v23 cameraAuthorizationStatus];
          }
          if (v24 == 3)
          {
            if (([v22 isClientSourcedByNonStreamingProxyFrontedExtension] & 1) == 0) {
              objc_msgSend(v22, "receivedSampleWithStreamID:sample:", objc_msgSend((id)objc_msgSend(a3, "streamID"), "UUIDString"), v4);
            }
          }
          else
          {
            __int16 v25 = CMIOLogLevel(3);
            if (v25)
            {
              __int16 v26 = v25;
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v27 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                *(_DWORD *)buf = v28;
                int v43 = v27;
                __int16 v44 = 1024;
                int v45 = 3953;
                __int16 v46 = 2080;
                id v47 = "-[CMIOExtensionProvider _clientQueue_sendSampleForStream:sample:]";
                __int16 v48 = 2112;
                char v49 = self;
                __int16 v50 = 2112;
                id v51 = a3;
                __int16 v52 = 1024;
                CMMediaType v53 = HIBYTE(MediaType);
                __int16 v54 = 1024;
                int v55 = BYTE2(MediaType);
                __int16 v56 = 1024;
                int v57 = HIDWORD(v29);
                __int16 v58 = 1024;
                int v59 = v29;
                _os_log_impl(&dword_2432B6000, v26, OS_LOG_TYPE_DEFAULT, "%s:%d:%s not authorized %@, %@ %c%c%c%c", buf, 0x48u);
              }
            }
          }
        }
      }
      uint64_t v19 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v19);
  }
}

- (void)consumeSampleBufferForStream:(id)a3 client:(id)a4 reply:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v9 = CMIOLogLevel(3);
  if (v9)
  {
    uint64_t v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v15 = 1024;
      int v16 = 3961;
      __int16 v17 = 2080;
      long long v18 = "-[CMIOExtensionProvider consumeSampleBufferForStream:client:reply:]";
      __int16 v19 = 2112;
      uint64_t v20 = self;
      __int16 v21 = 2112;
      id v22 = a3;
      _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__CMIOExtensionProvider_consumeSampleBufferForStream_client_reply___block_invoke;
  v12[3] = &unk_26517C068;
  v12[4] = a3;
  v12[5] = a4;
  v12[6] = self;
  v12[7] = a5;
  dispatch_async(clientQueue, v12);
}

uint64_t __67__CMIOExtensionProvider_consumeSampleBufferForStream_client_reply___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x263EF8340];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_clientQueue_streamingClientsMap"), "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "clientID")))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 80));
    id v2 = (id)objc_msgSend(*(id *)(*(void *)(a1 + 48) + 32), "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "clientID"));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 80));
    if (v2)
    {
      uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "streamID"), "UUIDString");
      uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __67__CMIOExtensionProvider_consumeSampleBufferForStream_client_reply___block_invoke_456;
      v14[3] = &unk_26517C1D0;
      v14[4] = *(void *)(a1 + 56);
      return [v2 pullSampleBufferForStreamID:v3 replyq:v4 reply:v14];
    }
    uint64_t v13 = CMIOLog();
    if (v13)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __67__CMIOExtensionProvider_consumeSampleBufferForStream_client_reply___block_invoke_cold_2();
      }
    }
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F08410];
    uint64_t v15 = *MEMORY[0x263F08320];
    int v16 = @"Invalid clientID";
    uint64_t v10 = NSDictionary;
    char v11 = &v16;
    uint64_t v12 = &v15;
  }
  else
  {
    uint64_t v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __67__CMIOExtensionProvider_consumeSampleBufferForStream_client_reply___block_invoke_cold_1();
    }
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F08410];
    uint64_t v17 = *MEMORY[0x263F08320];
    v18[0] = @"Invalid not streaming";
    uint64_t v10 = NSDictionary;
    char v11 = (__CFString **)v18;
    uint64_t v12 = &v17;
  }
  return (*(uint64_t (**)(uint64_t, void, void, void, void, uint64_t))(v7 + 16))(v7, 0, 0, 0, 0, objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, -50, objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1)));
}

uint64_t __67__CMIOExtensionProvider_consumeSampleBufferForStream_client_reply___block_invoke_456(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    unsigned int valuePtr = 0;
    uint64_t v20 = 0;
    uint64_t v8 = (const void *)[a2 sampleBuffer];
    CFTypeRef v9 = CMGetAttachment(v8, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags, 0);
    if (v9)
    {
      uint64_t v10 = v9;
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(v10) && !CFNumberGetValue((CFNumberRef)v10, kCFNumberSInt32Type, &valuePtr)) {
        unsigned int valuePtr = 0;
      }
    }
    uint64_t v12 = (const void *)[a2 sampleBuffer];
    CFTypeRef v13 = CMGetAttachment(v12, kCMIOSampleBufferAttachmentKey_SequenceNumber, 0);
    if (v13)
    {
      uint64_t v14 = v13;
      CFTypeID v15 = CFNumberGetTypeID();
      if (v15 == CFGetTypeID(v14) && !CFNumberGetValue((CFNumberRef)v14, kCFNumberSInt64Type, &v20)) {
        uint64_t v20 = 0;
      }
    }
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = objc_msgSend(a2, "sampleBuffer", v20);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))(v16 + 16))(v16, v17, v20, valuePtr, a3, a4);
  }
  else
  {
    __int16 v19 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v19();
  }
}

- (void)notifyScheduledOutputChangedForStream:(id)a3 scheduledOutput:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v7 = CMIOLogLevel(2);
  if (v7)
  {
    uint64_t v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v13 = 1024;
      int v14 = 4014;
      __int16 v15 = 2080;
      uint64_t v16 = "-[CMIOExtensionProvider notifyScheduledOutputChangedForStream:scheduledOutput:]";
      __int16 v17 = 2112;
      long long v18 = self;
      __int16 v19 = 2112;
      id v20 = a3;
      _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__CMIOExtensionProvider_notifyScheduledOutputChangedForStream_scheduledOutput___block_invoke;
  block[3] = &unk_26517C1F8;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(clientQueue, block);
}

uint64_t __79__CMIOExtensionProvider_notifyScheduledOutputChangedForStream_scheduledOutput___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) allValues];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "_clientQueue_streamingClientsMap"), "objectForKey:", objc_msgSend((id)objc_msgSend(v7, "clientInfo"), "clientID")))
        {
          objc_msgSend(v7, "streamScheduledOutputChangedWithStreamID:scheduledOutput:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "streamID"), "UUIDString"), *(void *)(a1 + 48));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)removeSystemStatusAttributionsForClient:(id)a3 stream:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v6 = CMIOLog();
  if (v6)
  {
    uint64_t v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315907;
      id v22 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __int16 v23 = 1024;
      int v24 = 4035;
      __int16 v25 = 2080;
      __int16 v26 = "-[CMIOExtensionProvider removeSystemStatusAttributionsForClient:stream:]";
      __int16 v27 = 1025;
      int v28 = [a3 pid];
      _os_log_impl(&dword_2432B6000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s removeSystemStatusAttributionsForClient for client %{private}d", buf, 0x22u);
    }
  }
  if (a4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v8 = objc_msgSend((id)objc_msgSend(a4, "source", 0), "formats");
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = 0;
      char v12 = 0;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v8);
          }
          CMMediaType MediaType = CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)[*(id *)(*((void *)&v16 + 1) + 8 * v14) formatDescription]);
          if (MediaType == 1836415096)
          {
            char v11 = 1;
          }
          else if (MediaType != 1936684398)
          {
            char v11 = 1;
            if ((v12 & 1) == 0) {
              goto LABEL_17;
            }
            goto LABEL_16;
          }
          char v12 = 1;
LABEL_16:
          if (v11) {
            return;
          }
LABEL_17:
          ++v14;
        }
        while (v10 != v14);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

- (void)updateNonStreamingProxyFrontedExtensionPIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = CMIOLog();
  if (v5)
  {
    uint64_t v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      nonStreamingProxyFrontedExtensionPIDs = self->_nonStreamingProxyFrontedExtensionPIDs;
      int v10 = 136316163;
      char v11 = v7;
      __int16 v12 = 1024;
      int v13 = 4113;
      __int16 v14 = 2080;
      __int16 v15 = "-[CMIOExtensionProvider updateNonStreamingProxyFrontedExtensionPIDs:]";
      __int16 v16 = 2113;
      long long v17 = nonStreamingProxyFrontedExtensionPIDs;
      __int16 v18 = 2113;
      id v19 = a3;
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s updating %{private}@ to %{private}@", (uint8_t *)&v10, 0x30u);
    }
  }
  os_unfair_lock_lock(&self->_contextsMapLock);
  uint64_t v9 = self->_nonStreamingProxyFrontedExtensionPIDs;
  self->_nonStreamingProxyFrontedExtensionPIDs = (NSArray *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:a3];

  self->_nonStreamingProxyFrontedExtensionPIDsHasChanged = 1;
  os_unfair_lock_unlock(&self->_contextsMapLock);
}

- (id)source
{
  return objc_loadWeak((id *)&self->_source);
}

- (void).cxx_destruct
{
}

- (void)initWithSource:clientQueue:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s SystemStatus unavailable", v2, v3, v4, v5, v6);
}

- (void)addDevice:error:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid device", v2, v3, v4, v5, v6);
}

- (void)addDevice:error:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Device already included", v2, v3, v4, v5, v6);
}

- (void)removeDevice:error:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid device", v2, v3, v4, v5, v6);
}

- (void)removeDevice:error:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Device not included", v2, v3, v4, v5, v6);
}

+ (void)proprietaryDefaultsDomainForAuditToken:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  uint8_t v6 = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
  __int16 v7 = v4;
  int v8 = a1;
  _os_log_error_impl(&dword_2432B6000, a2, OS_LOG_TYPE_ERROR, "%s:%d:%s [%d] could not get preference domain, returning \"unknown\"", v5, 0x22u);
}

+ (void)proprietaryDefaultsDomainForAuditToken:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d:%s Error getting process handle for %{private}d: %{private}@", v2, v3, v4, v5, v6);
}

+ (void)proprietaryDefaultsDomainForAuditToken:.cold.3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d:%s Error getting bundle record for %{private}d: %{private}@", v2, v3, v4, v5, v6);
}

+ (void)proprietaryDefaultsDomainForAuditToken:.cold.4()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Bundle record is not an extension record: %{private}@", v2, v3, v4, v5, v6);
}

void __59__CMIOExtensionProvider_finishProviderContextRegistration___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s failed %@", v2, v3, v4, v5, v6);
}

void __59__CMIOExtensionProvider_finishProviderContextRegistration___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __59__CMIOExtensionProvider_finishProviderContextRegistration___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Unregistered provider context %@, don't be surprised if things go badly", v2, v3, v4, v5, v6);
}

void __47__CMIOExtensionProvider_removeProviderContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __47__CMIOExtensionProvider_removeProviderContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Unregistered provider context %@, don't be surprised if things go badly", v2, v3, v4, v5, v6);
}

- (void)registerDevice:error:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  [v0 deviceID];
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v1, v2, "%s:%d:%s deviceID already included %{public}@", v3, v4, v5, v6, v7);
}

- (void)unregisterDevice:error:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  [v0 deviceID];
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v1, v2, "%s:%d:%s deviceID %{public}@ not registered", v3, v4, v5, v6, v7);
}

- (void)registerStream:withDeviceID:error:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  [v0 streamID];
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v1, v2, "%s:%d:%s streamID already included %{public}@", v3, v4, v5, v6, v7);
}

- (void)unregisterStream:withDeviceID:notify:error:.cold.1()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(void *)(v6 + 20) = "-[CMIOExtensionProvider unregisterStream:withDeviceID:notify:error:]";
  *(_WORD *)(v6 + 28) = 2114;
  *(void *)(v6 + 30) = v7;
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s streamID not register %{public}@", v8, v9);
}

void __55__CMIOExtensionProvider_pluginStatesForClientID_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_13();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_11(&dword_2432B6000, v0, v1, "%s:%d:%s providerPropertiesForProperties error %@ for plugin %{public}@", v2, v3, v4, v5, v6);
}

void __55__CMIOExtensionProvider_pluginStatesForClientID_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

- (void)_addAvailablePropertyStatesForDevice:toDictionary:.cold.1()
{
  OUTLINED_FUNCTION_13();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_2432B6000, v0, v1, "%s:%d:%s devicePropertiesForProperties error %{public}@ for device %{public}@", v2, v3, v4, v5, v6);
}

- (void)_addAvailablePropertyStatesForDevice:toDictionary:.cold.2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __74__CMIOExtensionProvider_pluginPropertyStatesForClientID_properties_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_13();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_11(&dword_2432B6000, v0, v1, "%s:%d:%s providerPropertiesForProperties error %{public}@ for plugin %{public}@", v2, v3, v4, v5, v6);
}

void __74__CMIOExtensionProvider_pluginPropertyStatesForClientID_properties_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid property", v2, v3, v4, v5, v6);
}

void __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __77__CMIOExtensionProvider_availableDevicePropertiesForClientID_deviceID_reply___block_invoke_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid deviceID", v2, v3, v4, v5, v6);
}

void __64__CMIOExtensionProvider_deviceStatesForClientID_deviceID_reply___block_invoke_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid deviceID", v2, v3, v4, v5, v6);
}

void __64__CMIOExtensionProvider_deviceStatesForClientID_deviceID_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_13();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_2432B6000, v0, v1, "%s:%d:%s devicePropertiesForProperties error %{public}@ for device %{public}@", v2, v3, v4, v5, v6);
}

void __64__CMIOExtensionProvider_deviceStatesForClientID_deviceID_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __83__CMIOExtensionProvider_devicePropertyStatesForClientID_deviceID_properties_reply___block_invoke_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid deviceID", v2, v3, v4, v5, v6);
}

void __83__CMIOExtensionProvider_devicePropertyStatesForClientID_deviceID_properties_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_13();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_2432B6000, v0, v1, "%s:%d:%s devicePropertiesForProperties error %{public}@ for device %{public}@", v2, v3, v4, v5, v6);
}

void __83__CMIOExtensionProvider_devicePropertyStatesForClientID_deviceID_properties_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid deviceID", v2, v3, v4, v5, v6);
}

void __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid property", v2, v3, v4, v5, v6);
}

void __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid clientID %{public}@", v2, v3, v4, v5, v6);
}

void __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_13();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  [v1 deviceControlPID];
  objc_msgSend((id)objc_msgSend(v0, "clientInfo"), "pid");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_22(&dword_2432B6000, v2, v3, "%s:%d:%s Invalid deviceControlPID %d vs %d", v4, v5, v6, v7, 2u);
}

void __77__CMIOExtensionProvider_availableStreamPropertiesForClientID_streamID_reply___block_invoke_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid streamID", v2, v3, v4, v5, v6);
}

void __83__CMIOExtensionProvider_streamPropertyStatesForClientID_streamID_properties_reply___block_invoke_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid streamID", v2, v3, v4, v5, v6);
}

void __83__CMIOExtensionProvider_streamPropertyStatesForClientID_streamID_properties_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_13();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_2432B6000, v0, v1, "%s:%d:%s streamPropertiesForProperties error %{public}@ for stream %{public}@", v2, v3, v4, v5, v6);
}

void __83__CMIOExtensionProvider_streamPropertyStatesForClientID_streamID_properties_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid streamID", v2, v3, v4, v5, v6);
}

void __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid property", v2, v3, v4, v5, v6);
}

void __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid clientID %{public}@", v2, v3, v4, v5, v6);
}

void __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_13();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  objc_msgSend((id)objc_msgSend(v1, "parent"), "deviceControlPID");
  objc_msgSend((id)objc_msgSend(v0, "clientInfo"), "pid");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_22(&dword_2432B6000, v2, v3, "%s:%d:%s Invalid deviceControlPID %d vs %d", v4, v5, v6, v7, 2u);
}

- (void)_clientQueue_decrementPendingStreamStartCountForClientID:streamID:.cold.1()
{
  OUTLINED_FUNCTION_13();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11(&dword_2432B6000, v0, v1, "%s:%d:%s %{public}@, %{private}@ : UNDERFLOW", v2, v3, v4, v5, v6);
}

void __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid streamID", v2, v3, v4, v5, v6);
}

void __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid clientID %{public}@", v2, v3, v4, v5, v6);
}

void __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

- (void)_clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid streamID", v2, v3, v4, v5, v6);
}

- (void)_clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid clientID %{public}@", v2, v3, v4, v5, v6);
}

- (void)_clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:.cold.3()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __98__CMIOExtensionProvider__performDeferredStreamStartsForClient_streamID_requestVideo_requestAudio___block_invoke_443_cold_1()
{
  OUTLINED_FUNCTION_13();
  uint64_t v15 = *MEMORY[0x263EF8340];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_19();
  int v6 = 3579;
  __int16 v7 = 2080;
  uint64_t v8 = "-[CMIOExtensionProvider _performDeferredStreamStartsForClient:streamID:requestVideo:requestAudio:]_block_invoke";
  __int16 v9 = 2114;
  uint64_t v10 = v2;
  __int16 v11 = v3;
  int v12 = v4;
  __int16 v13 = 2114;
  uint64_t v14 = v1;
  _os_log_error_impl(&dword_2432B6000, v0, OS_LOG_TYPE_ERROR, "%s:%d:%s %{public}@: startStream %d failed %{public}@", v5, 0x36u);
}

void __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid streamID", v2, v3, v4, v5, v6);
}

void __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid clientID %{public}@", v2, v3, v4, v5, v6);
}

void __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Could not stop streaming %{public}@", v2, v3, v4, v5, v6);
}

void __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid streamID", v2, v3, v4, v5, v6);
}

void __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid clientID %{public}@", v2, v3, v4, v5, v6);
}

void __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Client %{public}@ is fronted by proxy that is not streaming", v2, v3, v4, v5, v6);
}

void __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid streamID", v2, v3, v4, v5, v6);
}

void __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid clientID %{public}@", v2, v3, v4, v5, v6);
}

void __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_3(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_4(v6, v7, v8);
  OUTLINED_FUNCTION_8(&dword_2432B6000, "%s:%d:%s exception %@", v9, v10);
}

void __67__CMIOExtensionProvider_consumeSampleBufferForStream_client_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid stream %{public}@ is not streaming", v2, v3, v4, v5, v6);
}

void __67__CMIOExtensionProvider_consumeSampleBufferForStream_client_reply___block_invoke_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid clientID", v2, v3, v4, v5, v6);
}

@end