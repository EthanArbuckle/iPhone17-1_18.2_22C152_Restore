@interface NSURLSessionTask
- (BOOL)_allowsCellular;
- (BOOL)_allowsPersistentDNS;
- (BOOL)_allowsQUIC;
- (BOOL)_appSSOFallback;
- (BOOL)_appleIDContextRedirect;
- (BOOL)_assumesHTTP3Capable;
- (BOOL)_authenticatorConfiguredViaTaskProperty;
- (BOOL)_cacheOnly;
- (BOOL)_callCompletionHandlerInline;
- (BOOL)_connectionIsCellular;
- (BOOL)_connectionIsCompanionLink;
- (BOOL)_disallowCellular;
- (BOOL)_doesSZExtractorConsumeExtractedData;
- (BOOL)_extractorFinishedDecoding;
- (BOOL)_extractorPreparedForExtraction;
- (BOOL)_failInsecureLoadWithHTTPSDNSRecord;
- (BOOL)_hasSZExtractor;
- (BOOL)_isAVAssetTask;
- (BOOL)_isKnownTracker;
- (BOOL)_isTopLevelNavigation;
- (BOOL)_isWebSearchContent;
- (BOOL)_keepDownloadTaskFile;
- (BOOL)_needSendingMetrics;
- (BOOL)_preconnect;
- (BOOL)_preventsAppSSO;
- (BOOL)_preventsIdleSystemSleep;
- (BOOL)_preventsSystemHTTPProxyAuthentication;
- (BOOL)_privacyProxyFailClosed;
- (BOOL)_privacyProxyFailClosedForUnreachableHosts;
- (BOOL)_privacyProxyFailClosedForUnreachableNonMainHosts;
- (BOOL)_prohibitAuthUI;
- (BOOL)_prohibitPrivacyProxy;
- (BOOL)_proxyHandshakePending;
- (BOOL)_requiresSecureHTTPSProxyConnection;
- (BOOL)_seenFirstResume;
- (BOOL)_shouldHandleCookies;
- (BOOL)_shouldPipelineHTTP;
- (BOOL)_shouldSkipPipelineProbe;
- (BOOL)_shouldSkipPreferredClientCertificateLookup;
- (BOOL)_shouldUsePipelineHeuristics;
- (BOOL)_strictContentLength;
- (BOOL)_useEnhancedPrivacyMode;
- (BOOL)prefersIncrementalDelivery;
- (BOOL)shouldHandleCookiesAndSchemeIsAppropriate;
- (NSArray)_resolvedCNAMEChain;
- (NSData)_TCPConnectionMetadata;
- (NSData)_backtrace;
- (NSDate)earliestBeginDate;
- (NSDictionary)_DuetActivityProperties;
- (NSDictionary)_cachedSocketStreamProperties;
- (NSDictionary)_dependencyInfo;
- (NSDictionary)_legacySocketStreamProperties;
- (NSDictionary)_proxySettings;
- (NSDictionary)_sslSettings;
- (NSDictionary)_trailers;
- (NSError)error;
- (NSProgress)progress;
- (NSString)_APSRelayTopic;
- (NSString)_boundInterfaceIdentifier;
- (NSString)_description;
- (NSString)_loggableDescription;
- (NSString)_pathToDownloadTaskFile;
- (NSString)_sourceApplicationBundleIdentifierForMobileAsset;
- (NSString)_storagePartitionIdentifier;
- (NSString)_trackerContext;
- (NSString)taskDescription;
- (NSUInteger)taskIdentifier;
- (NSURL)_backgroundPublishingURL;
- (NSURL)_publishingURL;
- (NSURL)_siteForCookies;
- (NSURL)currentRequest_URL;
- (NSURL)currentRequest_mainDocumentURL;
- (NSURLRequest)currentRequest;
- (NSURLRequest)originalRequest;
- (NSURLResponse)response;
- (NSURLSession)session;
- (NSURLSessionAppleIDContext)_appleIDContext;
- (NSURLSessionConfiguration)_effectiveConfiguration;
- (NSURLSessionTask)init;
- (NSURLSessionTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5;
- (NSURLSessionTask)initWithTask:(id)a3;
- (NSURLSessionTask)initWithTaskGroup:(id)a3;
- (NSURLSessionTaskDelegate)_internalDelegate;
- (NSURLSessionTaskDependency)taskDependency;
- (NSURLSessionTaskDependencyTree)dependencyTree;
- (NSURLSessionTaskHTTPAuthenticator)authenticator;
- (NSURLSessionTaskState)state;
- (NSUUID)_uniqueIdentifier;
- (OS_dispatch_queue)workQueue;
- (OS_nw_activity)_nw_activity;
- (OS_nw_activity)_private_nw_activity;
- (OS_nw_endpoint)_hostOverride;
- (OS_voucher)_voucher;
- (OpaqueCFHTTPCookieStorage)_cfCookies;
- (STExtractor)_extractor;
- (_CFHSTSPolicy)_cfHSTS;
- (_CFHSTSPolicy)_copyHSTSPolicy;
- (_CFURLCache)_cfCache;
- (_CFURLCredentialStorage)_cfCreds;
- (__CFDictionary)_copyATSState;
- (__CFDictionary)_copySocketStreamProperties;
- (__CFN_TaskMetrics)_metrics;
- (__CFN_TransactionMetrics)_backgroundTransactionMetrics;
- (__CFSet)_getAuthenticatorStatusCodes;
- (__NSCFResumableUploadState)resumableUploadState;
- (__NSURLSessionTaskGroupForConfiguration)_taskGroup;
- (const)_createXCookieStorage;
- (const)_createXCredentialStorage;
- (double)_loadingPriorityValue;
- (double)_timeWindowDelay;
- (double)_timeWindowDuration;
- (double)_timeoutInterval;
- (double)_timeoutIntervalForResource;
- (double)startTime;
- (float)priority;
- (id)_cookieTransformCallback;
- (id)_httpConnectionInfoCompletionBlock;
- (id)_incompleteCurrentTaskTransactionMetrics;
- (id)_incompleteTaskMetrics;
- (id)_protocolForTask;
- (id)_timingData;
- (id)delegate;
- (int)_allowsCellularOverride;
- (int)_allowsConstrainedOverride;
- (int)_allowsExpensiveOverride;
- (int)_allowsUCAOverride;
- (int)_cookieAcceptPolicy;
- (int)_networkServiceType;
- (int)_requiresDNSSECValidation;
- (int64_t)_bytesPerSecondLimit;
- (int64_t)_countOfBytesReceivedEncoded;
- (int64_t)_countOfPendingBytesReceivedEncoded;
- (int64_t)_discretionaryOverride;
- (int64_t)_priorityValue;
- (int64_t)_requestPriority;
- (int64_t)_suspensionThreshhold;
- (int64_t)computeAdjustedPoolPriority;
- (int64_t)countOfBytesClientExpectsToReceive;
- (int64_t)countOfBytesClientExpectsToSend;
- (int64_t)countOfBytesExpectedToReceive;
- (int64_t)countOfBytesExpectedToSend;
- (int64_t)countOfBytesReceived;
- (int64_t)countOfBytesSent;
- (unint64_t)_allowedProtocolTypes;
- (unint64_t)_attribution;
- (unint64_t)_cachePolicy;
- (unint64_t)_darkWakePowerAssertionReleaseTime;
- (unint64_t)_expectedProgressTarget;
- (unint64_t)_powerAssertionReleaseTime;
- (unsigned)_TLSMaximumSupportedProtocolVersion;
- (unsigned)_TLSMinimumSupportedProtocolVersion;
- (unsigned)_TLSNegotiatedCipherSuite;
- (unsigned)_darkWakePowerAssertion;
- (unsigned)_powerAssertion;
- (unsigned)_qos;
- (void)_addAdditionalHeaders:(void *)a1 toRequest:(void *)a2;
- (void)_adoptEffectiveConfiguration:(id)a3;
- (void)_appendCountOfPendingBytesReceivedEncoded:(int64_t)a3;
- (void)_completeUploadProgress;
- (void)_consumePendingBytesReceivedEncoded;
- (void)_finishProgressReporting;
- (void)_getAuthenticationHeadersForResponse:(_CFURLResponse *)a3 completionHandler:(id)a4;
- (void)_logUnlistedTracker:(id)a3;
- (void)_onSessionQueue_cleanupAndBreakCycles;
- (void)_onqueue_adoptEffectiveConfiguration:(id)a3;
- (void)_releasePreventIdleSleepAssertionIfAppropriate;
- (void)_resetTaskDelegate;
- (void)_setAppleIDContext:(id)a3;
- (void)_setConnectionIsCellular:(BOOL)a3;
- (void)_setExplicitStorageSession:(__CFURLStorageSession *)a3;
- (void)_setSocketProperties:(__CFDictionary *)a3 connectionProperties:(__CFDictionary *)a4;
- (void)_takePreventIdleSleepAssertionIfAppropriate;
- (void)_withXURLCache:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)fillTaskDescriptionWithTaskIdentifier:(void *)a3 uniqueIdentifier:(uint64_t)a4 FixedTemplate:;
- (void)getUnderlyingHTTPConnectionInfoWithCompletionHandler:(id)a3;
- (void)initializeHTTPAuthenticatorWithAppleIDContext:(id)a3 statusCodes:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resume;
- (void)setAuthenticator:(id)a3;
- (void)setCountOfBytesClientExpectsToReceive:(int64_t)countOfBytesClientExpectsToReceive;
- (void)setCountOfBytesClientExpectsToSend:(int64_t)countOfBytesClientExpectsToSend;
- (void)setCountOfBytesExpectedToReceive:(int64_t)a3;
- (void)setCountOfBytesExpectedToSend:(int64_t)a3;
- (void)setCountOfBytesReceived:(int64_t)a3;
- (void)setCountOfBytesSent:(int64_t)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDependencyTree:(id)a3;
- (void)setEarliestBeginDate:(NSDate *)earliestBeginDate;
- (void)setError:(id)a3;
- (void)setOriginalRequest:(id)a3;
- (void)setPrefersIncrementalDelivery:(BOOL)prefersIncrementalDelivery;
- (void)setPriority:(float)priority;
- (void)setResponse:(id)a3;
- (void)setResumableUploadState:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setState:(int64_t)a3;
- (void)setTaskDependency:(id)a3;
- (void)setTaskDescription:(NSString *)taskDescription;
- (void)setTaskIdentifier:(unint64_t)a3;
- (void)set_APSRelayTopic:(id)a3;
- (void)set_DuetActivityProperties:(id)a3;
- (void)set_TCPConnectionMetadata:(id)a3;
- (void)set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)a3;
- (void)set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)a3;
- (void)set_TLSNegotiatedCipherSuite:(unsigned __int16)a3;
- (void)set_allowedProtocolTypes:(unint64_t)a3;
- (void)set_allowsCellular:(BOOL)a3;
- (void)set_allowsCellularOverride:(int)a3;
- (void)set_allowsConstrainedOverride:(int)a3;
- (void)set_allowsExpensiveOverride:(int)a3;
- (void)set_allowsPersistentDNS:(BOOL)a3;
- (void)set_allowsQUIC:(BOOL)a3;
- (void)set_allowsUCAOverride:(int)a3;
- (void)set_appSSOFallback:(BOOL)a3;
- (void)set_appleIDContextRedirect:(BOOL)a3;
- (void)set_assumesHTTP3Capable:(BOOL)a3;
- (void)set_attribution:(unint64_t)a3;
- (void)set_authenticatorConfiguredViaTaskProperty:(BOOL)a3;
- (void)set_backgroundPublishingURL:(id)a3;
- (void)set_backgroundTransactionMetrics:(id)a3;
- (void)set_backtrace:(id)a3;
- (void)set_boundInterfaceIdentifier:(id)a3;
- (void)set_bytesPerSecondLimit:(int64_t)a3;
- (void)set_cacheOnly:(BOOL)a3;
- (void)set_cachePolicy:(unint64_t)a3;
- (void)set_cachedSocketStreamProperties:(id)a3;
- (void)set_callCompletionHandlerInline:(BOOL)a3;
- (void)set_cfCache:(_CFURLCache *)a3;
- (void)set_cfCookies:(OpaqueCFHTTPCookieStorage *)a3;
- (void)set_cfCreds:(_CFURLCredentialStorage *)a3;
- (void)set_cfHSTS:(_CFHSTSPolicy *)a3;
- (void)set_connectionIsCompanionLink:(BOOL)a3;
- (void)set_cookieAcceptPolicy:(int)a3;
- (void)set_cookieTransformCallback:(id)a3;
- (void)set_countOfBytesReceivedEncoded:(int64_t)a3;
- (void)set_countOfPendingBytesReceivedEncoded:(int64_t)a3;
- (void)set_darkWakePowerAssertion:(unsigned int)a3;
- (void)set_darkWakePowerAssertionReleaseTime:(unint64_t)a3;
- (void)set_dependencyInfo:(id)a3;
- (void)set_disallowCellular:(BOOL)a3;
- (void)set_discretionaryOverride:(int64_t)a3;
- (void)set_doesSZExtractorConsumeExtractedData:(BOOL)a3;
- (void)set_effectiveConfiguration:(id)a3;
- (void)set_expectedProgressTarget:(unint64_t)a3;
- (void)set_extractor:(id)a3;
- (void)set_extractorFinishedDecoding:(BOOL)a3;
- (void)set_extractorPreparedForExtraction:(BOOL)a3;
- (void)set_failInsecureLoadWithHTTPSDNSRecord:(BOOL)a3;
- (void)set_hasSZExtractor:(BOOL)a3;
- (void)set_hostOverride:(id)a3;
- (void)set_httpConnectionInfoCompletionBlock:(id)a3;
- (void)set_internalDelegate:(id)a3;
- (void)set_isKnownTracker:(BOOL)a3;
- (void)set_isTopLevelNavigation:(BOOL)a3;
- (void)set_isWebSearchContent:(BOOL)a3;
- (void)set_legacySocketStreamProperties:(id)a3;
- (void)set_loadingPriority:(double)a3;
- (void)set_loadingPriorityValue:(double)a3;
- (void)set_metrics:(id)a3;
- (void)set_networkServiceType:(int)a3;
- (void)set_nw_activity:(id)a3;
- (void)set_pathToDownloadTaskFile:(id)a3;
- (void)set_powerAssertion:(unsigned int)a3;
- (void)set_powerAssertionReleaseTime:(unint64_t)a3;
- (void)set_preconnect:(BOOL)a3;
- (void)set_preventsAppSSO:(BOOL)a3;
- (void)set_preventsIdleSystemSleep:(BOOL)a3;
- (void)set_preventsSystemHTTPProxyAuthentication:(BOOL)a3;
- (void)set_priority:(int64_t)a3;
- (void)set_priorityValue:(int64_t)a3;
- (void)set_privacyProxyFailClosed:(BOOL)a3;
- (void)set_privacyProxyFailClosedForUnreachableHosts:(BOOL)a3;
- (void)set_privacyProxyFailClosedForUnreachableNonMainHosts:(BOOL)a3;
- (void)set_private_nw_activity:(id)a3;
- (void)set_prohibitAuthUI:(BOOL)a3;
- (void)set_prohibitPrivacyProxy:(BOOL)a3;
- (void)set_protocolForTask:(id)a3;
- (void)set_proxyHandshakePending:(BOOL)a3;
- (void)set_proxySettings:(id)a3;
- (void)set_publishingURL:(id)a3;
- (void)set_qos:(unsigned int)a3;
- (void)set_requestPriority:(int64_t)a3;
- (void)set_requiresDNSSECValidation:(int)a3;
- (void)set_requiresSecureHTTPSProxyConnection:(BOOL)a3;
- (void)set_resolvedCNAMEChain:(id)a3;
- (void)set_shouldHandleCookies:(BOOL)a3;
- (void)set_shouldPipelineHTTP:(BOOL)a3;
- (void)set_shouldSkipPipelineProbe:(BOOL)a3;
- (void)set_shouldSkipPreferredClientCertificateLookup:(BOOL)a3;
- (void)set_shouldUsePipelineHeuristics:(BOOL)a3;
- (void)set_siteForCookies:(id)a3;
- (void)set_sourceApplicationBundleIdentifierForMobileAsset:(id)a3;
- (void)set_sslSettings:(id)a3;
- (void)set_storagePartitionIdentifier:(id)a3;
- (void)set_strictContentLength:(BOOL)a3;
- (void)set_suspensionThreshhold:(int64_t)a3;
- (void)set_timeWindowDelay:(double)a3;
- (void)set_timeWindowDuration:(double)a3;
- (void)set_timeoutInterval:(double)a3;
- (void)set_timeoutIntervalForResource:(double)a3;
- (void)set_trackerContext:(id)a3;
- (void)set_trailers:(id)a3;
- (void)set_uniqueIdentifier:(id)a3;
- (void)set_useEnhancedPrivacyMode:(BOOL)a3;
- (void)set_voucher:(id)a3;
- (void)suspend;
- (void)updateCurrentRequest:(id)a3;
@end

@implementation NSURLSessionTask

- (void)updateCurrentRequest:(id)a3
{
  if (a3)
  {
    id v39 = (id)[a3 mutableCopy];
    uint64_t v4 = [v39 _inner];
    v5 = [(NSURLSessionTask *)self _effectiveConfiguration];
    [(NSURLSessionTask *)self set_cachePolicy:*(void *)(v4 + 16)];
    [(NSURLSessionTask *)self set_timeoutInterval:*(double *)(v4 + 24)];
    uint64_t v6 = *(void *)(v4 + 56);
    if (v6 && *(unsigned char *)(v6 + 216))
    {
      CFStringRef v7 = *(const __CFString **)(v6 + 152);
      BOOL v9 = v7
        && (CFEqual(v7, (CFStringRef)&gConstantCFStringValueTable[2604])
         || ((CFStringRef v8 = *(const __CFString **)(v6 + 152)) != 0
          || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)
          && (LOWORD(number[0]) = 0,
              _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "these should always be initialized now", (uint8_t *)number, 2u), (CFStringRef v8 = *(const __CFString **)(v6 + 152)) != 0))&& CFEqual(v8, (CFStringRef)&gConstantCFStringValueTable[2611]))|| *(unsigned char *)(v6 + 218) != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
    [(NSURLSessionTask *)self set_shouldPipelineHTTP:v9];
    uint64_t v10 = *(void *)(v4 + 56);
    if (v10) {
      BOOL v11 = *(unsigned __int8 *)(v10 + 217) != 0;
    }
    else {
      BOOL v11 = 0;
    }
    [(NSURLSessionTask *)self set_shouldUsePipelineHeuristics:v11];
    uint64_t v12 = *(void *)(v4 + 56);
    if (v12) {
      BOOL v13 = *(unsigned __int8 *)(v12 + 219) != 0;
    }
    else {
      BOOL v13 = 0;
    }
    [(NSURLSessionTask *)self set_shouldSkipPipelineProbe:v13];
    [(NSURLSessionTask *)self set_shouldHandleCookies:*(_WORD *)(v4 + 64) & 1];
    __int16 v14 = *(_WORD *)(v4 + 64);
    if ((v14 & 0x400) == 0)
    {
      number[0] = 0;
      if (hasConfigValue((uint64_t *)number, v5, (const __CFString *)&unk_1EC0A5AA0) && number[0]) {
        -[NSURLSessionTask set_cachePolicy:](self, "set_cachePolicy:");
      }
      __int16 v14 = *(_WORD *)(v4 + 64);
    }
    if ((v14 & 0x800) == 0)
    {
      valuePtr = 0;
      number[0] = 0;
      CFTypeID TypeID = CFNumberGetTypeID();
      if (hasConfigValue((const void **)number, TypeID, v5, (const __CFString *)&unk_1EC0A5B80))
      {
        CFNumberRef v16 = number[0];
        int Value = CFNumberGetValue(number[0], kCFNumberDoubleType, &valuePtr);
        if (v16) {
          CFRelease(v16);
        }
        if (Value) {
          [(NSURLSessionTask *)self set_timeoutInterval:*(double *)&valuePtr];
        }
      }
    }
    if ((*(void *)(v4 + 56) || _urlIsHTTPish(*(const __CFURL **)(v4 + 8))) && (*(_WORD *)(v4 + 64) & 0x200) == 0)
    {
      LOBYTE(number[0]) = 0;
      LOBYTE(valuePtr) = 0;
      if ((hasConfigValue((BOOL *)&valuePtr, v5, (const __CFString *)&unk_1EC0A5B10) & 1) == 0) {
        LOBYTE(valuePtr) = 0;
      }
      if (hasConfigValue((BOOL *)number, v5, (const __CFString *)&unk_1EC0A5A30))
      {
        [(NSURLSessionTask *)self set_shouldPipelineHTTP:LOBYTE(number[0])];
        [(NSURLSessionTask *)self set_shouldUsePipelineHeuristics:valuePtr];
        uint64_t v18 = *(void *)(v4 + 56);
        if (v18) {
          BOOL v19 = *(unsigned __int8 *)(v18 + 219) != 0;
        }
        else {
          BOOL v19 = 0;
        }
        [(NSURLSessionTask *)self set_shouldSkipPipelineProbe:v19];
      }
    }
    if ((*(void *)(v4 + 56) || _urlIsHTTPish(*(const __CFURL **)(v4 + 8))) && (*(_WORD *)(v4 + 64) & 0x20) == 0)
    {
      LOBYTE(number[0]) = 0;
      if (hasConfigValue((BOOL *)number, v5, (const __CFString *)&unk_1EC0A59F8)) {
        [(NSURLSessionTask *)self set_shouldHandleCookies:LOBYTE(number[0])];
      }
    }
    if (*(void *)(v4 + 56) || _urlIsHTTPish(*(const __CFURL **)(v4 + 8)))
    {
      number[0] = 0;
      if (hasConfigValue((uint64_t *)number, v5, (const __CFString *)&unk_1EC0A59C0)) {
        [(NSURLSessionTask *)self set_cookieAcceptPolicy:LODWORD(number[0])];
      }
    }
    __int16 v20 = *(_WORD *)(v4 + 64);
    if ((v20 & 0x100) != 0)
    {
      if ((v20 & 0x80) != 0) {
        goto LABEL_55;
      }
    }
    else
    {
      LOBYTE(number[0]) = 0;
      if (hasConfigValue((BOOL *)number, v5, (const __CFString *)&unk_1EC0A5AD8)) {
        [(NSURLSessionTask *)self set_preventsIdleSystemSleep:LOBYTE(number[0])];
      }
      __int16 v20 = *(_WORD *)(v4 + 64);
      if ((v20 & 0x80) != 0)
      {
LABEL_55:
        if ((v20 & 0x40) == 0) {
          goto LABEL_64;
        }
LABEL_61:
        if (*(_DWORD *)(v4 + 104))
        {
          if ((v20 & 0x1000) == 0) {
            goto LABEL_69;
          }
          goto LABEL_67;
        }
LABEL_64:
        number[0] = 0;
        if (hasConfigValue((uint64_t *)number, v5, (const __CFString *)&unk_1EC0A5A68)) {
          [(NSURLSessionTask *)self set_networkServiceType:LODWORD(number[0])];
        }
        if ((*(_WORD *)(v4 + 64) & 0x1000) == 0) {
          goto LABEL_69;
        }
LABEL_67:
        if (*(void *)(v4 + 48))
        {
          -[NSURLSessionTask set_proxySettings:](self, "set_proxySettings:");
LABEL_73:
          if ((*(_WORD *)(v4 + 64) & 0x2000) != 0)
          {
            [(NSURLSessionTask *)self set_sslSettings:*(void *)(v4 + 72)];
          }
          else
          {
            valuePtr = 0;
            number[0] = 0;
            CFTypeID v24 = CFNumberGetTypeID();
            if (hasConfigValue((const void **)number, v24, v5, (const __CFString *)&unk_1EC0A5BF0))
            {
              v25 = [(NSURLSessionTask *)self _sslSettings];
              CFAllocatorRef v26 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
              if (v25) {
                MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(v26, 0, (CFDictionaryRef)[(NSURLSessionTask *)self _sslSettings]);
              }
              else {
                MutableCFDictionaryRef Copy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
              }
              v28 = MutableCopy;
              CFNumberRef v29 = number[0];
              CFDictionaryAddValue(MutableCopy, &unk_1EC0A05C0, number[0]);
              CFTypeID v30 = CFNumberGetTypeID();
              if (hasConfigValue(&valuePtr, v30, v5, (const __CFString *)&unk_1EC0A5BB8))
              {
                v31 = valuePtr;
                CFDictionaryAddValue(v28, &unk_1EC0A0588, valuePtr);
                CFRelease(v31);
              }
              CFDictionaryRef Copy = CFDictionaryCreateCopy(v26, v28);
              [(NSURLSessionTask *)self set_sslSettings:Copy];
              CFRelease(v29);
              if (Copy) {
                CFRelease(Copy);
              }
              if (v28) {
                CFRelease(v28);
              }
            }
          }
          if (*(void *)(v4 + 232))
          {
            -[NSURLSessionTask _setExplicitStorageSession:](self, "_setExplicitStorageSession:");
          }
          else
          {
            uint64_t v37 = *(void *)(v4 + 56);
            if (v37)
            {
              v38 = *(const void **)(v37 + 192);
              if (v38)
              {
                CFRetain(*(CFTypeRef *)(v37 + 192));
                [(NSURLSessionTask *)self _setExplicitCookieStorage:v38];
                CFRelease(v38);
              }
            }
          }
          if (*(void *)(v4 + 112)) {
            -[NSURLSessionTask set_boundInterfaceIdentifier:](self, "set_boundInterfaceIdentifier:");
          }
          int v33 = *(unsigned __int16 *)(v4 + 64);
          int v34 = v33 << 24;
          if ((v33 & 8) != 0) {
            int v35 = 1;
          }
          else {
            int v35 = 2;
          }
          [(NSURLSessionTask *)self set_allowsCellularOverride:v35 & (v34 >> 31)];
          [(NSURLSessionTask *)self set_allowsConstrainedOverride:*(unsigned int *)(v4 + 220)];
          [(NSURLSessionTask *)self set_allowsExpensiveOverride:*(unsigned int *)(v4 + 216)];
          [(NSURLSessionTask *)self set_allowsUCAOverride:*(unsigned int *)(v4 + 224)];
          [(NSURLSessionTask *)self set_assumesHTTP3Capable:*(unsigned char *)(v4 + 164) != 0];
          [(NSURLSessionTask *)self set_requiresDNSSECValidation:*(unsigned int *)(v4 + 176)];
          [(NSURLSessionTask *)self set_allowsPersistentDNS:*(unsigned char *)(v4 + 180) != 0];
          if (*(_DWORD *)(v4 + 104)) {
            -[NSURLSessionTask set_networkServiceType:](self, "set_networkServiceType:");
          }
          [(NSURLSessionTask *)self set_allowedProtocolTypes:*(void *)(v4 + 96)];
          if (*(void *)(v4 + 88) != -1) {
            -[NSURLSessionTask set_requestPriority:](self, "set_requestPriority:");
          }
          if (*(double *)(v4 + 136) != 0.0 || *(double *)(v4 + 144) != 0.0)
          {
            -[NSURLSessionTask set_timeWindowDelay:](self, "set_timeWindowDelay:");
            [(NSURLSessionTask *)self set_timeWindowDuration:*(double *)(v4 + 144)];
          }
          [(NSURLSessionTask *)self set_attribution:*(void *)(v4 + 184)];
          [(NSURLSessionTask *)self set_isKnownTracker:*(unsigned char *)(v4 + 165) != 0];
          CFTypeRef v36 = *(CFTypeRef *)(v4 + 120);
          if (!v36) {
            CFTypeRef v36 = (id)URLRequest::copyMainDocumentRegistrableDomain((URLRequest *)v4);
          }
          [(NSURLSessionTask *)self set_trackerContext:v36];
          [(NSURLSessionTask *)self set_privacyProxyFailClosed:*(unsigned char *)(v4 + 166) != 0];
          [(NSURLSessionTask *)self set_privacyProxyFailClosedForUnreachableNonMainHosts:*(unsigned char *)(v4 + 167) != 0];
          [(NSURLSessionTask *)self set_privacyProxyFailClosedForUnreachableHosts:*(unsigned char *)(v4 + 168) != 0];
          [(NSURLSessionTask *)self set_prohibitPrivacyProxy:*(unsigned char *)(v4 + 169) != 0];
          [(NSURLSessionTask *)self set_useEnhancedPrivacyMode:*(unsigned char *)(v4 + 171) != 0];
          [(NSURLSessionTask *)self set_blockTrackers:*(unsigned char *)(v4 + 172) != 0];
          [(NSURLSessionTask *)self set_failInsecureLoadWithHTTPSDNSRecord:*(unsigned char *)(v4 + 173) != 0];
          [(NSURLSessionTask *)self set_isWebSearchContent:*(unsigned char *)(v4 + 174) != 0];
          if (self)
          {
            -[NSURLSessionTask _addAdditionalHeaders:toRequest:]([(NSURLSessionConfiguration *)self->_effectiveConfiguration HTTPAdditionalHeaders], v39);
            if (os_variant_allows_internal_security_policies())
            {
              if (-[NSURLSessionTask addAdditionalHeadersToRequest:]::onceToken != -1) {
                dispatch_once(&-[NSURLSessionTask addAdditionalHeadersToRequest:]::onceToken, &__block_literal_global_21659);
              }
              -[NSURLSessionTask _addAdditionalHeaders:toRequest:]((void *)-[NSURLSessionTask addAdditionalHeadersToRequest:]::additionalHeaders, v39);
            }
          }
          [(NSURLSessionTask *)self setCurrentRequest:v39];

          return;
        }
LABEL_69:
        number[0] = 0;
        CFTypeID v21 = CFDictionaryGetTypeID();
        int v22 = hasConfigValue((const void **)number, v21, v5, (const __CFString *)&unk_1EC0A58E0);
        CFNumberRef v23 = number[0];
        if (v22) {
          [(NSURLSessionTask *)self set_proxySettings:number[0]];
        }
        if (v23) {
          CFRelease(v23);
        }
        goto LABEL_73;
      }
    }
    LOBYTE(number[0]) = 0;
    if (hasConfigValue((BOOL *)number, v5, (const __CFString *)&unk_1EC0A5870)) {
      [(NSURLSessionTask *)self set_allowsCellular:LOBYTE(number[0])];
    }
    __int16 v20 = *(_WORD *)(v4 + 64);
    if ((v20 & 0x40) == 0) {
      goto LABEL_64;
    }
    goto LABEL_61;
  }

  -[NSURLSessionTask setCurrentRequest:](self, "setCurrentRequest:");
}

- (NSDictionary)_sslSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 376, 1);
}

- (void)_addAdditionalHeaders:(void *)a1 toRequest:(void *)a2
{
  if (a1)
  {
    v8[10] = v2;
    v8[11] = v3;
    uint64_t v6 = *(HTTPMessage **)([a2 _inner] + 56);
    if (v6) {
      CFMutableDictionaryRef v7 = HTTPMessage::copyAllHeaderFields(v6);
    }
    else {
      CFMutableDictionaryRef v7 = 0;
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__NSURLSessionTask__addAdditionalHeaders_toRequest___block_invoke;
    v8[3] = &__block_descriptor_48_e15_v32__0_8_16_B24l;
    v8[4] = v7;
    v8[5] = a2;
    [a1 enumerateKeysAndObjectsUsingBlock:v8];
    if (v7) {
      CFRelease(v7);
    }
  }
}

- (void)set_shouldUsePipelineHeuristics:(BOOL)a3
{
  self->_shouldUsePipelineHeuristics = a3;
}

- (void)set_shouldSkipPipelineProbe:(BOOL)a3
{
  self->_shouldSkipPipelineProbe = a3;
}

- (void)set_shouldPipelineHTTP:(BOOL)a3
{
  self->_shouldPipelineHTTP = a3;
}

- (void)set_timeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (void)set_shouldHandleCookies:(BOOL)a3
{
  self->_shouldHandleCookies = a3;
}

- (void)set_trackerContext:(id)a3
{
}

- (void)set_cachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (void)set_sslSettings:(id)a3
{
}

- (void)set_useEnhancedPrivacyMode:(BOOL)a3
{
  self->_useEnhancedPrivacyMode = a3;
}

- (void)set_requiresDNSSECValidation:(int)a3
{
  self->_requiresDNSSECValidation = a3;
}

- (void)set_prohibitPrivacyProxy:(BOOL)a3
{
  self->_prohibitPrivacyProxy = a3;
}

- (void)set_privacyProxyFailClosedForUnreachableNonMainHosts:(BOOL)a3
{
  self->_privacyProxyFailClosedForUnreachableNonMainHosts = a3;
}

- (void)set_privacyProxyFailClosedForUnreachableHosts:(BOOL)a3
{
  self->_privacyProxyFailClosedForUnreachableHosts = a3;
}

- (void)set_privacyProxyFailClosed:(BOOL)a3
{
  self->_privacyProxyFailClosed = a3;
}

- (void)set_isWebSearchContent:(BOOL)a3
{
  self->_isWebSearchContent = a3;
}

- (void)set_isKnownTracker:(BOOL)a3
{
  self->_isKnownTracker = a3;
}

- (void)set_failInsecureLoadWithHTTPSDNSRecord:(BOOL)a3
{
  self->_failInsecureLoadWithHTTPSDNSRecord = a3;
}

- (void)set_attribution:(unint64_t)a3
{
  self->_attribution = a3;
}

- (void)set_allowsPersistentDNS:(BOOL)a3
{
  self->_allowsPersistentDNS = a3;
}

- (void)set_networkServiceType:(int)a3
{
  self->_networkServiceType = a3;
}

- (void)set_assumesHTTP3Capable:(BOOL)a3
{
  self->_assumesHTTP3Capable = a3;
}

- (void)set_allowsUCAOverride:(int)a3
{
  self->_allowsUCAOverride = a3;
}

- (void)set_cachedSocketStreamProperties:(id)a3
{
}

- (void)set_allowsExpensiveOverride:(int)a3
{
  self->_allowsExpensiveOverride = a3;
}

- (void)set_allowsConstrainedOverride:(int)a3
{
  self->_allowsConstrainedOverride = a3;
}

- (void)set_allowsCellularOverride:(int)a3
{
  self->_allowsCellularOverride = a3;
}

- (void)set_allowedProtocolTypes:(unint64_t)a3
{
  self->_allowedProtocolTypes = a3;
}

- (void)setCurrentRequest:(id)a3
{
}

- (void)set_preventsIdleSystemSleep:(BOOL)a3
{
  self->_preventsIdleSystemSleep = a3;
}

- (void)set_allowsCellular:(BOOL)a3
{
  self->_allowsCellular = a3;
}

- (void)set_cookieAcceptPolicy:(int)a3
{
  self->_cookieAcceptPolicy = a3;
}

- (void)resume
{
  v78[2] = *MEMORY[0x1E4F143B8];
  if ([(NSURLSessionTask *)self state] > NSURLSessionTaskStateSuspended
    || ![(NSURLSessionTask *)self workQueue])
  {
    return;
  }
  [(NSURLSessionTask *)self setState:0];
  [(NSURLSessionTask *)self set_qos:qos_class_self()];
  [(NSURLSessionTask *)self set_voucher:(id)voucher_copy()];
  v76[0] = 0;
  v76[1] = 0;
  if ([(NSURLSessionTask *)self _nw_activity])
  {
    [(NSURLSessionTask *)self _nw_activity];
    nw_activity_activate();
    [(NSURLSessionTask *)self _nw_activity];
    nw_activity_get_token();
  }
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  uint64_t v3 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(NSURLSessionTask *)self _loggableDescription];
    [(NSURLSessionTask *)self _timeoutInterval];
    uint64_t v6 = v5;
    [(NSURLSessionTask *)self _timeoutIntervalForResource];
    *(_DWORD *)buf = 138544898;
    *(void *)v69 = v4;
    *(_WORD *)&v69[8] = 2048;
    *(void *)&v69[10] = v6;
    *(_WORD *)&v69[18] = 2048;
    *(void *)v70 = v7;
    *(_WORD *)&v70[8] = 1024;
    *(_DWORD *)v71 = [(NSURLSessionTask *)self _qos];
    *(_WORD *)&v71[4] = 2112;
    *(void *)v72 = [(NSURLSessionTask *)self _voucher];
    *(_WORD *)&v72[8] = 1042;
    int v73 = 16;
    __int16 v74 = 2098;
    v75 = v76;
    _os_log_impl(&dword_184085000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming, timeouts(%.1f, %.1f) qos(0x%x) voucher(%@) activity(%{public,uuid_t}.16P)", buf, 0x40u);
  }
  CFStringRef v8 = self;
  BOOL v9 = [(NSURLSessionTask *)v8 _effectiveConfiguration];
  BOOL v10 = HARLoggingEnabled([v9 _pidForHAR]);

  if (!v10 || [(NSURLSessionTask *)v8 _isAVAssetTask]) {
    goto LABEL_32;
  }
  BOOL v11 = instrumentsTaskLog();
  uint64_t v12 = [(NSURLSessionTask *)v8 _uniqueIdentifier];
  os_signpost_id_t spid = os_signpost_id_make_with_pointer(v11, v12);

  BOOL v13 = v8;
  uint64_t v14 = [(NSURLSessionTask *)v13 session];
  v15 = (unsigned char *)v14;
  if (v14) {
    CFNumberRef v16 = *(void **)(v14 + 112);
  }
  else {
    CFNumberRef v16 = 0;
  }
  id v17 = v16;
  uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](v13, "taskIdentifier"));
  [v18 setObject:v19 forKeyedSubscript:@"taskIdentifier"];

  __int16 v20 = [(NSURLSessionTask *)v13 taskDescription];
  [v18 setObject:v20 forKeyedSubscript:@"taskDescription"];

  CFTypeID v21 = [(NSURLSessionTask *)v13 originalRequest];
  int v22 = [v21 URL];
  CFNumberRef v23 = [v22 absoluteString];
  [v18 setObject:v23 forKeyedSubscript:@"url"];

  CFTypeID v24 = [(NSURLSessionTask *)v13 originalRequest];
  v25 = [v24 HTTPMethod];
  [v18 setObject:v25 forKeyedSubscript:@"method"];

  CFAllocatorRef v26 = NSNumber;
  v27 = [(NSURLSessionTask *)v13 originalRequest];
  v28 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "attribution"));
  [v18 setObject:v28 forKeyedSubscript:@"attribution"];

  if (v15) {
    uint64_t v29 = v15[68] & 1;
  }
  else {
    uint64_t v29 = 0;
  }
  CFTypeID v30 = objc_msgSend(NSNumber, "numberWithBool:", v29, spid);
  [v18 setObject:v30 forKeyedSubscript:@"isSharedSession"];

  v31 = [v15 sessionDescription];
  [v18 setObject:v31 forKeyedSubscript:@"sessionDescription"];

  v32 = NSNumber;
  int v33 = [v17 disposition];
  int v34 = objc_msgSend(v32, "numberWithBool:", objc_msgSend(v33, "isEqualToString:", 0x1EC0A5950));
  [v18 setObject:v34 forKeyedSubscript:@"isEphemeralSession"];

  int v35 = [v17 identifier];
  [v18 setObject:v35 forKeyedSubscript:@"backgroundIdentifier"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFTypeRef v36 = @"Data";
LABEL_25:
    [v18 setObject:v36 forKeyedSubscript:@"taskType"];
    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFTypeRef v36 = @"Upload";
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFTypeRef v36 = @"Download";
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFTypeRef v36 = @"Stream";
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFTypeRef v36 = @"WebSocket";
    goto LABEL_25;
  }
LABEL_26:
  uint64_t v37 = [(NSURLSessionTask *)v13 _effectiveConfiguration];
  v38 = [v37 _sourceApplicationBundleIdentifier];
  [v18 setObject:v38 forKeyedSubscript:@"sourceApplicationBundleIdentifier"];

  id v39 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v18 options:0 error:0];
  v78[0] = 0;
  v78[1] = 0;
  v40 = [(NSURLSessionTask *)v13 _uniqueIdentifier];
  [v40 getUUIDBytes:v78];

  v77[0] = 0;
  v77[1] = 0;
  uint64_t v41 = [(NSURLSessionTask *)v13 session];
  v42 = (void *)v41;
  if (v41) {
    v43 = *(void **)(v41 + 128);
  }
  else {
    v43 = 0;
  }
  id v44 = v43;
  [v44 getUUIDBytes:v77];

  v45 = instrumentsTaskLog();
  v46 = v45;
  if (spida - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    int v47 = [v39 length];
    uint64_t v48 = [v39 bytes];
    *(_DWORD *)buf = 68290050;
    *(_DWORD *)v69 = 16;
    *(_WORD *)&v69[4] = 2098;
    *(void *)&v69[6] = v78;
    *(_WORD *)&v69[14] = 1042;
    *(_DWORD *)&v69[16] = 16;
    *(_WORD *)v70 = 2098;
    *(void *)&v70[2] = v77;
    *(_WORD *)v71 = 1040;
    *(_DWORD *)&v71[2] = v47;
    *(_WORD *)v72 = 2082;
    *(void *)&v72[2] = v48;
    _os_signpost_emit_with_name_impl(&dword_184085000, v46, OS_SIGNPOST_EVENT, spida, "Task Resume", "Task UUID: %{public,uuid_t}.16P, Session UUID: %{public,uuid_t}.16P, Additional Info: %{public,xcode:data}.*s", buf, 0x32u);
  }

LABEL_32:
  objc_sync_enter(v8);
  progress = v8->_progress;
  if (progress
    && ![(NSProgress *)progress isCancelled]
    && [(NSProgress *)v8->_progress isPaused])
  {
    [(NSProgress *)v8->_progress resume];
  }
  if (v8->_seenFirstResume) {
    goto LABEL_73;
  }
  v8->_seenFirstResume = 1;
  uint64_t v50 = [(NSURLSessionTask *)v8 session];
  if (v50 && CFEqual((CFTypeRef)[*(id *)(v50 + 112) disposition], &unk_1EC0A58A8)
    || ([(NSURLSessionTask *)v8 set_private_nw_activity:[(NSURLSessionTask *)v8 _nw_activity]], ![(NSURLSessionTask *)v8 _nw_activity]))
  {
    [(NSURLSessionTask *)v8 set_private_nw_activity:(id)nw_activity_create()];
  }
  if ([(NSURLSessionTask *)v8 _nw_activity])
  {
    uint64_t v51 = [(NSURLSessionTask *)v8 session];
    if (v51)
    {
      if (CFEqual((CFTypeRef)[*(id *)(v51 + 112) disposition], &unk_1EC0A58A8))
      {
        [(NSURLSessionTask *)v8 _private_nw_activity];
        [(NSURLSessionTask *)v8 _nw_activity];
        nw_activity_set_parent_activity();
      }
    }
  }
  if ([(NSURLSessionTask *)v8 _private_nw_activity])
  {
    [(NSURLSessionTask *)v8 _private_nw_activity];
    nw_activity_activate();
    [(NSURLSessionTask *)v8 _private_nw_activity];
    int is_selected_for_reporting = nw_activity_is_selected_for_reporting();
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v53 = CFNLog::logger;
    BOOL v54 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG);
    if (!is_selected_for_reporting)
    {
      if (v54)
      {
        uint64_t v57 = [(NSURLSessionTask *)v8 _private_nw_activity];
        uint64_t v58 = [(NSURLSessionTask *)v8 _loggableDescription];
        *(_DWORD *)buf = 138543618;
        *(void *)v69 = v57;
        *(_WORD *)&v69[8] = 2114;
        *(void *)&v69[10] = v58;
        _os_log_debug_impl(&dword_184085000, v53, OS_LOG_TYPE_DEBUG, "[Telemetry]: Activity %{public}@ on %{public}@ was not selected for reporting", buf, 0x16u);
      }
      goto LABEL_67;
    }
    if (v54)
    {
      uint64_t v63 = [(NSURLSessionTask *)v8 _private_nw_activity];
      uint64_t v64 = [(NSURLSessionTask *)v8 _loggableDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)v69 = v63;
      *(_WORD *)&v69[8] = 2114;
      *(void *)&v69[10] = v64;
      _os_log_debug_impl(&dword_184085000, v53, OS_LOG_TYPE_DEBUG, "[Telemetry]: Activity %{public}@ on %{public}@ was selected for reporting", buf, 0x16u);
    }
    if ([(NSURLSessionTask *)v8 _DuetActivityProperties])
    {
      if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[NSURLSessionTask _legacySocketStreamProperties](v8, "_legacySocketStreamProperties"), "objectForKeyedSubscript:", 0x1EC0A0A58), "objectForKeyedSubscript:", @"kConditionalConnectionInTransitionalDiscretionaryPeriod"))
      {
        uint64_t v55 = [(NSURLSessionTask *)v8 _metrics];
        if (v55)
        {
          uint64_t v56 = 5;
LABEL_66:
          *(void *)(v55 + 88) = v56;
        }
      }
      else
      {
        if ([(NSURLSessionConfiguration *)v8->_effectiveConfiguration isDiscretionary])
        {
          if ([(NSURLSessionConfiguration *)v8->_effectiveConfiguration _clientIsNotExplicitlyDiscretionary])
          {
            uint64_t v59 = 3;
          }
          else
          {
            uint64_t v59 = 2;
          }
          uint64_t v60 = [(NSURLSessionTask *)v8 _metrics];
          if (v60) {
            *(void *)(v60 + 88) = v59;
          }
          goto LABEL_67;
        }
        uint64_t v55 = [(NSURLSessionTask *)v8 _metrics];
        if (v55)
        {
          uint64_t v56 = 4;
          goto LABEL_66;
        }
      }
    }
  }
LABEL_67:
  if (![(NSURLSessionTask *)v8 _isAVAssetTask]
    && ![(NSURLSessionTask *)v8 currentRequest_URL])
  {
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_10_5521);
    }
    v61 = __CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_184085000, v61, OS_LOG_TYPE_FAULT, "API MISUSE: Resuming an NSURLSessionTask with nil URL.", buf, 2u);
    }
  }
LABEL_73:
  objc_sync_exit(v8);
  if (nw_settings_get_signposts_enabled()) {
    kdebug_trace();
  }
  v62 = [(NSURLSessionTask *)v8 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__NSURLSessionTask_resume__block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = v8;
  dispatch_async(v62, block);
}

- (OS_nw_activity)_nw_activity
{
  return (OS_nw_activity *)objc_getProperty(self, a2, 624, 1);
}

- (OS_dispatch_queue)workQueue
{
  result = [(NSURLSessionTask *)self session];
  if (result) {
    return (OS_dispatch_queue *)*((void *)result + 15);
  }
  return result;
}

- (NSString)_description
{
  uint64_t v3 = [(NSURLSessionTask *)self session];
  if (v3)
  {
    uint64_t v4 = @"Local";
    if (CFEqual([(NSURLSessionConfiguration *)v3->_local_immutable_configuration_ivar disposition], &unk_1EC0A58A8))
    {
      uint64_t v5 = [(NSURLSessionTask *)self session];
      if (v5)
      {
        if (![(NSURLSessionConfiguration *)v5->_local_immutable_configuration_ivar _isProxySession]) {
          uint64_t v4 = @"Background";
        }
      }
      else
      {
        uint64_t v4 = @"Background";
      }
    }
  }
  else
  {
    uint64_t v4 = @"Local";
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = @"Upload";
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = @"WebSocket";
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = @"Data";
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v6 = @"Download";
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v6 = @"Stream";
          }
          else
          {
            uint64_t v6 = &stru_1ECFAD558;
            if (objc_opt_class())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v6 = @"AVAssetDownload";
              }
              else
              {
                gotLoadHelper_x8__OBJC_CLASS___AVAggregateAssetDownloadTask(v7);
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v6 = @"AVAggregateAssetDownload";
                }
              }
            }
          }
        }
      }
    }
  }
  return (NSString *)[NSString stringWithFormat:@"%@%@%@", v4, v6, -[NSURLSessionTask _loggableDescription](self, "_loggableDescription")];
}

- (NSURLSession)session
{
  uint64_t v2 = [(NSURLSessionTask *)self _taskGroup];

  return (NSURLSession *)[(__NSURLSessionTaskGroupForConfiguration *)v2 _groupSession];
}

- (__NSURLSessionTaskGroupForConfiguration)_taskGroup
{
  return (__NSURLSessionTaskGroupForConfiguration *)objc_getProperty(self, a2, 584, 1);
}

- (NSString)_loggableDescription
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (!self->_loggableDescription)
  {
    uint64_t v3 = [(NSURLSessionTask *)self session];
    if (v3 && [(NSURLSessionConfiguration *)v3->_local_immutable_configuration_ivar _isProxySession])
    {
      *(_WORD *)&v6[50] = unk_18430C35A;
      *(_DWORD *)&v6[52] = unk_18430C35C;
      strcpy(v6, "PDTask <00000000-0000-0000-0000-000000000000>.<0>");
      -[NSURLSessionTask fillTaskDescriptionWithTaskIdentifier:uniqueIdentifier:FixedTemplate:]((uint64_t)self, [(NSURLSessionTask *)self taskIdentifier], [(NSURLSessionTask *)self _uniqueIdentifier], (uint64_t)&v6[7]);
      uint64_t v4 = (NSString *)(id)[NSString stringWithCString:v6 encoding:1];
    }
    else
    {
      strcpy(v6, "Task <00000000-0000-0000-0000-000000000000>.<0>");
      -[NSURLSessionTask fillTaskDescriptionWithTaskIdentifier:uniqueIdentifier:FixedTemplate:]((uint64_t)self, [(NSURLSessionTask *)self taskIdentifier], [(NSURLSessionTask *)self _uniqueIdentifier], (uint64_t)&v6[5]);
      uint64_t v4 = (NSString *)(id)[NSString stringWithCString:v6 encoding:1];
    }
    self->_loggableDescription = v4;
  }
  objc_sync_exit(self);
  return self->_loggableDescription;
}

- (OS_voucher)_voucher
{
  return (OS_voucher *)objc_getProperty(self, a2, 384, 1);
}

- (unsigned)_qos
{
  return self->_qos;
}

- (double)_timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource_ivar;
}

- (NSURLSessionTaskState)state
{
  return self->_state;
}

- (int64_t)countOfBytesReceived
{
  return self->_countOfBytesReceived;
}

- (void)setCountOfBytesReceived:(int64_t)a3
{
  self->_countOfBytesReceived = a3;
}

- (void)dealloc
{
  [(NSURLSessionTask *)self _onSessionQueue_cleanupAndBreakCycles];

  cfHSTS = self->_cfHSTS;
  if (cfHSTS) {
    CFRelease(cfHSTS);
  }
  cfCache = self->_cfCache;
  if (cfCache) {
    CFRelease(cfCache);
  }
  cfCreds = self->_cfCreds;
  if (cfCreds) {
    CFRelease(cfCreds);
  }
  cfCookies = self->_cfCookies;
  if (cfCookies) {
    CFRelease(cfCookies);
  }

  uploadProgress = self->_uploadProgress;
  if (uploadProgress)
  {
    [(NSURLSessionTask *)self removeObserver:self forKeyPath:@"countOfBytesSent"];
    [(NSURLSessionTask *)self removeObserver:self forKeyPath:@"countOfBytesExpectedToSend"];
    uploadProgress = self->_uploadProgress;
  }

  downloadProgress = self->_downloadProgress;
  if (downloadProgress)
  {
    [(NSURLSessionTask *)self removeObserver:self forKeyPath:@"countOfBytesReceived"];
    [(NSURLSessionTask *)self removeObserver:self forKeyPath:@"countOfBytesExpectedToReceive"];
    downloadProgress = self->_downloadProgress;
  }

  [(NSURLSessionTask *)self set_extractor:0];
  [(NSURLSessionTask *)self set_hasSZExtractor:0];
  [(NSURLSessionTask *)self set_doesSZExtractorConsumeExtractedData:0];

  [(NSURLSessionTask *)self set_APSRelayTopic:0];
  atsStateCache = self->_atsStateCache;
  self->_atsStateCache = 0;
  if (atsStateCache) {
    CFRelease(atsStateCache);
  }
  [(NSURLSessionTask *)self set_voucher:0];
  [(NSURLSessionTask *)self set_httpConnectionInfoCompletionBlock:0];

  [(NSURLSessionTask *)self setEarliestBeginDate:0];
  [(NSURLSessionTask *)self set_nw_activity:0];
  [(NSURLSessionTask *)self set_private_nw_activity:0];

  [(NSURLSessionTask *)self set_cookieTransformCallback:0];
  [(NSURLSessionTask *)self set_trackerContext:0];

  v10.receiver = self;
  v10.super_class = (Class)NSURLSessionTask;
  [(NSURLSessionTask *)&v10 dealloc];
}

- (void)set_private_nw_activity:(id)a3
{
}

- (void)set_voucher:(id)a3
{
}

- (void)set_nw_activity:(id)a3
{
}

- (void)set_hasSZExtractor:(BOOL)a3
{
  self->_hasSZExtractor = a3;
}

- (void)set_extractor:(id)a3
{
  extractor = self->_extractor;
  if (a3)
  {
    if (extractor != a3)
    {
      id v6 = a3;

      self->_extractor = (STExtractor *)a3;
    }
    self->_hasSZExtractor = 1;
    if (objc_opt_respondsToSelector()) {
      self->_doesSZExtractorConsumeExtractedData = [a3 doesConsumeExtractedData];
    }
    else {
      self->_doesSZExtractorConsumeExtractedData = 0;
    }
  }
  else
  {
    if (extractor)
    {

      self->_extractor = 0;
    }
    *(_WORD *)&self->_hasSZExtractor = 0;
  }
}

- (void)set_doesSZExtractorConsumeExtractedData:(BOOL)a3
{
  self->_doesSZExtractorConsumeExtractedData = a3;
}

- (void)setEarliestBeginDate:(NSDate *)earliestBeginDate
{
}

- (void)set_httpConnectionInfoCompletionBlock:(id)a3
{
}

- (void)set_cookieTransformCallback:(id)a3
{
}

- (void)set_APSRelayTopic:(id)a3
{
}

- (NSUInteger)taskIdentifier
{
  return self->_taskIdentifier;
}

- (NSUUID)_uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (__CFDictionary)_copySocketStreamProperties
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  cachedSocketStreamProperties = self->_cachedSocketStreamProperties;
  if (cachedSocketStreamProperties)
  {
    return (__CFDictionary *)CFRetain(cachedSocketStreamProperties);
  }
  uint64_t v5 = [(NSURLSessionConfiguration *)self->_effectiveConfiguration _socketStreamProperties];
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (v5) {
    MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, (CFDictionaryRef)v5);
  }
  else {
    MutableCFDictionaryRef Copy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  CFStringRef v8 = MutableCopy;
  BOOL v9 = [(NSURLSessionConfiguration *)self->_effectiveConfiguration allowsExpensiveNetworkAccess];
  objc_super v10 = (const void **)MEMORY[0x1E4F1CFC8];
  if (!v9) {
    CFDictionaryAddValue(v8, &unk_1EC0A0978, (const void *)*MEMORY[0x1E4F1CFC8]);
  }
  if (![(NSURLSessionConfiguration *)self->_effectiveConfiguration allowsConstrainedNetworkAccess])CFDictionaryAddValue(v8, &unk_1EC0A0940, *v10); {
  BOOL v11 = [(NSURLSessionConfiguration *)self->_effectiveConfiguration _allowsUCA];
  }
  uint64_t v12 = (const void **)MEMORY[0x1E4F1CFD0];
  if (v11) {
    CFDictionaryAddValue(v8, &unk_1EC09F280, (const void *)*MEMORY[0x1E4F1CFD0]);
  }
  if (![(NSURLSessionConfiguration *)self->_effectiveConfiguration _allowsVirtualInterfaces]) {
    CFDictionaryAddValue(v8, &unk_1EC09F2B8, *v10);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _multipathAlternatePort]) {
    CFDictionaryAddValue(v8, &unk_1EC09EC98, (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionConfiguration _multipathAlternatePort](self->_effectiveConfiguration, "_multipathAlternatePort")));
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _TCPAdaptiveReadTimeout]) {
    CFDictionaryAddValue(v8, &unk_1EC09FEC0, (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionConfiguration _TCPAdaptiveReadTimeout](self->_effectiveConfiguration, "_TCPAdaptiveReadTimeout")));
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _TCPAdaptiveWriteTimeout]) {
    CFDictionaryAddValue(v8, &unk_1EC09FEF8, (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionConfiguration _TCPAdaptiveWriteTimeout](self->_effectiveConfiguration, "_TCPAdaptiveWriteTimeout")));
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _allowsPowerNapScheduling])
  {
    CFDictionaryAddValue(v8, &unk_1EC0A0EF0, *v12);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _tcpConnectionPoolName])
  {
    CFDictionaryAddValue(v8, &unk_1EC09F408, [(NSURLSessionConfiguration *)self->_effectiveConfiguration _tcpConnectionPoolName]);
    CFDictionaryAddValue(v8, &unk_1EC09F440, (const void *)objc_msgSend(NSNumber, "numberWithLongLong:", -[NSURLSessionTask computeAdjustedPoolPriority](self, "computeAdjustedPoolPriority")));
  }
  if ([(NSURLSessionTask *)self _sourceApplicationBundleIdentifierForMobileAsset])
  {
    BOOL v13 = [(NSURLSessionTask *)self _sourceApplicationBundleIdentifierForMobileAsset];
  }
  else
  {
    if (![(NSURLSessionConfiguration *)self->_effectiveConfiguration _sourceApplicationBundleIdentifier])goto LABEL_31; {
    BOOL v13 = [(NSURLSessionConfiguration *)self->_effectiveConfiguration _sourceApplicationBundleIdentifier];
    }
  }
  CFDictionaryAddValue(v8, &unk_1EC0A1190, v13);
LABEL_31:
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _companionAppBundleIdentifier])
  {
    CFDictionaryAddValue(v8, &unk_1EC09E608, [(NSURLSessionConfiguration *)self->_effectiveConfiguration _companionAppBundleIdentifier]);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _sourceApplicationSecondaryIdentifier])
  {
    CFDictionaryAddValue(v8, &unk_1EC0A0908, [(NSURLSessionConfiguration *)self->_effectiveConfiguration _sourceApplicationSecondaryIdentifier]);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _sourceApplicationAuditTokenData])
  {
    CFDictionaryAddValue(v8, &unk_1EC0A1158, [(NSURLSessionConfiguration *)self->_effectiveConfiguration _sourceApplicationAuditTokenData]);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _attributedBundleIdentifier])
  {
    CFDictionaryAddValue(v8, &unk_1EC0A09B0, [(NSURLSessionConfiguration *)self->_effectiveConfiguration _attributedBundleIdentifier]);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _preventsIdleSleepOnceConnected])
  {
    CFDictionaryAddValue(v8, &unk_1EC09EE20, *v12);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _forcesNewConnections]) {
    CFDictionaryAddValue(v8, @"uniqueTaskIdentifier", (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](self, "taskIdentifier")));
  }
  if (![(NSURLSessionConfiguration *)self->_effectiveConfiguration allowsCellularAccess]) {
    CFDictionarySetValue(v8, &unk_1EC0A0E48, *v12);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration shouldUseExtendedBackgroundIdleMode])
  {
    CFDictionarySetValue(v8, &unk_1EC0A0F60, *v12);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _allowsMultipathTCP]) {
    CFDictionarySetValue(v8, &unk_1EC0A0CC0, *v12);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _allowsResponseMonitoringDuringBodyTranmission])
  {
    CFDictionarySetValue(v8, &unk_1EC0A3490, *v12);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration waitsForConnectivity]
    || [(NSURLSessionConfiguration *)self->_effectiveConfiguration _allowsIndefiniteConnections])
  {
    CFDictionarySetValue(v8, &unk_1EC0A0CF8, *v12);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _CTDataConnectionServiceType])
  {
    CFDictionarySetValue(v8, &unk_1EC0A0BE0, [(NSURLSessionConfiguration *)self->_effectiveConfiguration _CTDataConnectionServiceType]);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _allowsTCPFastOpen]) {
    CFDictionarySetValue(v8, &unk_1EC09F130, *v12);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _allowsTLSSessionTickets]) {
    CFDictionarySetValue(v8, &unk_1EC09F0F8, *v12);
  }
  if (![(NSURLSessionConfiguration *)self->_effectiveConfiguration _allowsTLSSessionResumption])CFDictionarySetValue(v8, &unk_1EC09F0C0, *v10); {
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _allowsTLSFalseStart])
  }
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v8, &unk_1EC0A1270);
    v15 = Value
        ? CFDictionaryCreateMutableCopy(v6, 0, Value)
        : CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFNumberRef v16 = v15;
    if (v15)
    {
      id v17 = *v12;
      CFDictionarySetValue(v15, &unk_1EC0A0518, *v12);
      CFDictionarySetValue(v16, &unk_1EC0A0550, v17);
      CFDictionarySetValue(v8, &unk_1EC0A1270, v16);
      CFRelease(v16);
    }
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _tlsTrustPinningPolicyName])
  {
    CFDictionarySetValue(v8, &unk_1EC09FE50, [(NSURLSessionConfiguration *)self->_effectiveConfiguration _tlsTrustPinningPolicyName]);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _allowsTLSECH]) {
    CFDictionarySetValue(v8, &unk_1EC09F168, *v12);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _customReadBufferSize]) {
    CFDictionarySetValue(v8, &unk_1EC09FB08, (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionConfiguration _customReadBufferSize](self->_effectiveConfiguration, "_customReadBufferSize")));
  }
  [(NSURLSessionConfiguration *)self->_effectiveConfiguration _customReadBufferTimeout];
  if (v18 > 0.0)
  {
    BOOL v19 = NSNumber;
    [(NSURLSessionConfiguration *)self->_effectiveConfiguration _customReadBufferTimeout];
    CFDictionarySetValue(v8, &unk_1EC09FB40, (const void *)objc_msgSend(v19, "numberWithDouble:"));
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration multipathServiceType]) {
    CFDictionarySetValue(v8, &unk_1EC09ECD0, (const void *)objc_msgSend(NSNumber, "numberWithInteger:", -[NSURLSessionConfiguration multipathServiceType](self->_effectiveConfiguration, "multipathServiceType")));
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _expiredDNSBehavior]) {
    CFDictionarySetValue(v8, &unk_1EC09F6A8, (const void *)objc_msgSend(NSNumber, "numberWithLongLong:", -[NSURLSessionConfiguration _expiredDNSBehavior](self->_effectiveConfiguration, "_expiredDNSBehavior")));
  }
  if ([(NSURLSessionTask *)self _sslSettings])
  {
    CFDictionaryRef v20 = (const __CFDictionary *)CFDictionaryGetValue(v8, &unk_1EC0A1270);
    CFAllocatorRef v21 = v6;
    if (v20) {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutableCopy(v6, 0, v20);
    }
    else {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    CFNumberRef v23 = Mutable;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    CFTypeID v24 = [(NSURLSessionTask *)self _sslSettings];
    uint64_t v25 = [(NSDictionary *)v24 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v63 != v27) {
            objc_enumerationMutation(v24);
          }
          CFDictionarySetValue(v23, *(const void **)(*((void *)&v62 + 1) + 8 * i), [(NSDictionary *)[(NSURLSessionTask *)self _sslSettings] objectForKeyedSubscript:*(void *)(*((void *)&v62 + 1) + 8 * i)]);
        }
        uint64_t v26 = [(NSDictionary *)v24 countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v26);
    }
    CFDictionarySetValue(v8, &unk_1EC0A1270, v23);
    CFAllocatorRef v6 = v21;
    uint64_t v12 = (const void **)MEMORY[0x1E4F1CFD0];
    objc_super v10 = (const void **)MEMORY[0x1E4F1CFC8];
    if (v23) {
      CFRelease(v23);
    }
  }
  if ([(NSURLSessionTask *)self _boundInterfaceIdentifier]) {
    CFDictionaryAddValue(v8, &unk_1EC0A0A20, [(NSURLSessionTask *)self _boundInterfaceIdentifier]);
  }
  if ([(NSURLSessionTask *)self _allowsCellularOverride])
  {
    if ([(NSURLSessionTask *)self _allowsCellularOverride] == 2) {
      uint64_t v29 = v12;
    }
    else {
      uint64_t v29 = v10;
    }
    CFDictionarySetValue(v8, &unk_1EC0A0E48, *v29);
  }
  if ([(NSURLSessionTask *)self _disallowCellular]) {
    CFDictionarySetValue(v8, &unk_1EC0A0E48, *v12);
  }
  if ([(NSURLSessionTask *)self _allowsExpensiveOverride])
  {
    if ([(NSURLSessionTask *)self _allowsExpensiveOverride] == 1) {
      CFTypeID v30 = v12;
    }
    else {
      CFTypeID v30 = v10;
    }
    CFDictionarySetValue(v8, &unk_1EC0A0978, *v30);
  }
  if ([(NSURLSessionTask *)self _allowsConstrainedOverride])
  {
    if ([(NSURLSessionTask *)self _allowsConstrainedOverride] == 1) {
      v31 = v12;
    }
    else {
      v31 = v10;
    }
    CFDictionarySetValue(v8, &unk_1EC0A0940, *v31);
  }
  if ([(NSURLSessionTask *)self _allowsUCAOverride])
  {
    if ([(NSURLSessionTask *)self _allowsUCAOverride] == 1) {
      v32 = v12;
    }
    else {
      v32 = v10;
    }
    CFDictionarySetValue(v8, &unk_1EC09F280, *v32);
  }
  unint64_t v33 = [(NSURLSessionConfiguration *)self->_effectiveConfiguration _forcedNetworkServiceType];
  if (!v33) {
    LODWORD(v33) = [(NSURLSessionTask *)self _networkServiceType];
  }
  if (v33)
  {
    NetworkServiceTypeString = (const void *)ClassicURLConnection::getNetworkServiceTypeString(v33);
    CFDictionarySetValue(v8, &unk_1EC0A0668, NetworkServiceTypeString);
  }
  if ([(NSURLRequest *)[(NSURLSessionTask *)self currentRequest] _requiresShortConnectionTimeout])
  {
    uint64_t valuePtr = 0x4024000000000000;
    CFNumberRef v35 = CFNumberCreate(v6, kCFNumberDoubleType, &valuePtr);
    if (v35)
    {
      CFNumberRef v36 = v35;
      CFDictionarySetValue(v8, &unk_1EC09E6B0, v35);
      CFRelease(v36);
    }
  }
  if ([(NSURLSessionTask *)self _hostOverride]) {
    CFDictionarySetValue(v8, &unk_1EC09E950, [(NSURLSessionTask *)self _hostOverride]);
  }
  int v37 = [(NSURLSessionConfiguration *)[(NSURLSessionTask *)self _effectiveConfiguration] _allowsHTTP3Internal];
  if (v37 == 1
    || !v37 && (nw_settings_get_quic_enabled() & 1) != 0
    || [(NSURLSessionTask *)self _assumesHTTP3Capable])
  {
    CFDictionarySetValue(v8, &unk_1EC09EB80, *v12);
  }
  if ([(NSURLSessionTask *)self _allowsPersistentDNS]) {
    CFDictionarySetValue(v8, &unk_1EC09E448, *v12);
  }
  if ([(NSURLSessionTask *)self _isKnownTracker]) {
    CFDictionaryAddValue(v8, &unk_1EC09EC60, *v12);
  }
  if ([(NSURLSessionTask *)self _attribution]) {
    CFDictionaryAddValue(v8, &unk_1EC09E528, (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionTask _attribution](self, "_attribution")));
  }
  if ([(NSURLSessionTask *)self _trackerContext]) {
    CFDictionaryAddValue(v8, &unk_1EC09F1A0, [(NSURLSessionTask *)self _trackerContext]);
  }
  if ([(NSURLSessionTask *)self _privacyProxyFailClosed]) {
    CFDictionaryAddValue(v8, &unk_1EC09EE58, *v12);
  }
  if ([(NSURLSessionTask *)self _privacyProxyFailClosedForUnreachableNonMainHosts])
  {
    CFDictionaryAddValue(v8, &unk_1EC09EEC8, *v12);
  }
  if ([(NSURLSessionTask *)self _privacyProxyFailClosedForUnreachableHosts])
  {
    CFDictionaryAddValue(v8, &unk_1EC09EE90, *v12);
  }
  if ([(NSURLSessionConfiguration *)[(NSURLSessionTask *)self _effectiveConfiguration] _enablesL4SInternal])
  {
    if ([(NSURLSessionConfiguration *)[(NSURLSessionTask *)self _effectiveConfiguration] _enablesL4SInternal] == 1)v38 = v12; {
    else
    }
      v38 = v10;
    CFDictionaryAddValue(v8, &unk_1EC09E918, *v38);
  }
  if ([(NSURLSessionTask *)self _prohibitPrivacyProxy]) {
    CFDictionaryAddValue(v8, &unk_1EC09EF38, *v12);
  }
  if ([(NSURLSessionTask *)self _useEnhancedPrivacyMode]) {
    CFDictionaryAddValue(v8, &unk_1EC09F1D8, *v12);
  }
  if ([(NSURLSessionTask *)self _blockTrackers]) {
    CFDictionaryAddValue(v8, &unk_1EC09E560, *v12);
  }
  if ([(NSURLSessionTask *)self _failInsecureLoadWithHTTPSDNSRecord]) {
    CFDictionaryAddValue(v8, &unk_1EC09EAD8, *v12);
  }
  if ([(NSURLSessionTask *)self _isWebSearchContent]
    && [(NSURLSessionTask *)self _useEnhancedPrivacyMode])
  {
    CFDictionaryAddValue(v8, &unk_1EC09EC28, *v12);
  }
  if ([(NSURLSessionTask *)self _requiresDNSSECValidation])
  {
    if ([(NSURLSessionTask *)self _requiresDNSSECValidation] == 1) {
      id v39 = v12;
    }
    else {
      id v39 = v10;
    }
    v40 = *v39;
    uint64_t v41 = v8;
  }
  else
  {
    if (![(NSURLSessionConfiguration *)[(NSURLSessionTask *)self _effectiveConfiguration] requiresDNSSECValidation])goto LABEL_169; {
    v40 = *v12;
    }
    uint64_t v41 = v8;
  }
  CFDictionaryAddValue(v41, &unk_1EC09F018, v40);
LABEL_169:
  if ([(NSURLSessionConfiguration *)[(NSURLSessionTask *)self _effectiveConfiguration] _prohibitEncryptedDNS])
  {
    CFDictionaryAddValue(v8, &unk_1EC09EF00, *v12);
  }
  if ([(NSURLSessionConfiguration *)[(NSURLSessionTask *)self _effectiveConfiguration] _disableAPWakeOnIdleConnections])
  {
    CFDictionaryAddValue(v8, &unk_1EC09E870, *v12);
  }
  CFDictionaryRef v42 = (const __CFDictionary *)CFDictionaryGetValue(v8, &unk_1EC0A0A58);
  if (v42) {
    CFDictionaryRef v43 = CFDictionaryCreateMutableCopy(v6, 0, v42);
  }
  else {
    CFDictionaryRef v43 = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  CFDictionaryRef v44 = v43;
  if (v43
    && !CFDictionaryGetValue(v43, @"kConditionalConnectionIdentifier")
    && CFDictionaryGetValue(v44, @"kConditionalConnectionLaunchOnDemand")
    && (uint64_t v59 = [(NSURLSessionTask *)self currentRequest]) != 0
    && (CFURLRef v60 = [(NSURLRequest *)v59 URL]) != 0)
  {
    CFStringRef v45 = CFURLGetString(v60);
  }
  else
  {
    CFStringRef v45 = 0;
  }
  [(NSURLSessionTask *)self _timeWindowDelay];
  uint64_t valuePtr = v46;
  [(NSURLSessionTask *)self _timeWindowDuration];
  double v66 = v47;
  if (v47 == 0.0) {
    goto LABEL_187;
  }
  CFNumberRef v48 = CFNumberCreate(v6, kCFNumberDoubleType, &valuePtr);
  CFNumberRef v49 = CFNumberCreate(v6, kCFNumberDoubleType, &v66);
  CFNumberRef v50 = v49;
  if (v48 && v49)
  {
    CFDictionarySetValue(v44, @"kConditionalConnectionRequirementTimeWindowDelay", v48);
    CFDictionarySetValue(v44, @"kConditionalConnectionRequirementTimeWindowDuration", v50);
    uint64_t v51 = (void *)MEMORY[0x1E4F1C9C8];
    [(NSURLSessionTask *)self startTime];
    double v53 = v52;
    [(NSURLSessionTask *)self _timeWindowDelay];
    CFDictionarySetValue(v44, @"kConditionalConnectionRequirementTimeWindowStartTime", (const void *)[v51 dateWithTimeIntervalSinceReferenceDate:(double)(60 * ((unint64_t)(v53 + v54) / 0x3C))]);
  }
  else if (!v48)
  {
    goto LABEL_185;
  }
  CFRelease(v48);
LABEL_185:
  if (v50) {
    CFRelease(v50);
  }
LABEL_187:
  if (v45) {
    CFDictionarySetValue(v44, @"kConditionalConnectionIdentifier", v45);
  }
  if ([(NSURLSessionConfiguration *)self->_effectiveConfiguration _requiresPowerPluggedIn])
  {
    CFDictionarySetValue(v44, @"kConditionalConnectionRequirementPowerPluggedIn", *v12);
    legacySocketStreamProperties = self->_legacySocketStreamProperties;
    if (legacySocketStreamProperties)
    {
      if ([(NSDictionary *)legacySocketStreamProperties objectForKeyedSubscript:0x1EC0A0A58])
      {
        uint64_t v56 = (void *)[(NSDictionary *)self->_legacySocketStreamProperties mutableCopy];
        uint64_t v57 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_legacySocketStreamProperties, "objectForKeyedSubscript:", 0x1EC0A0A58), "mutableCopy");
        [v57 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kConditionalConnectionRequirementPowerPluggedIn"];
        [v56 setObject:v57 forKeyedSubscript:0x1EC0A0A58];
        [(NSURLSessionTask *)self set_legacySocketStreamProperties:v56];
      }
    }
  }
  if (v44)
  {
    if (CFDictionaryGetCount(v44)) {
      CFDictionarySetValue(v8, &unk_1EC0A0A58, v44);
    }
    CFRelease(v44);
  }
  if ([(NSURLSessionTask *)self _legacySocketStreamProperties])
  {
    uint64_t v58 = [(NSURLSessionTask *)self _legacySocketStreamProperties];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __47__NSURLSessionTask__copySocketStreamProperties__block_invoke;
    v61[3] = &__block_descriptor_40_e15_v32__0_8_16_B24l;
    v61[4] = v8;
    [(NSDictionary *)v58 enumerateKeysAndObjectsUsingBlock:v61];
  }
  [(NSURLSessionTask *)self set_cachedSocketStreamProperties:v8];
  return v8;
}

- (NSURLSessionConfiguration)_effectiveConfiguration
{
  return self->_effectiveConfiguration;
}

- (void)_releasePreventIdleSleepAssertionIfAppropriate
{
  if ([(NSURLSessionTask *)self _powerAssertion])
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if ([(NSURLSessionTask *)self _powerAssertion])
    {
      [(NSURLSessionTask *)self set_powerAssertionReleaseTime:clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + 3000000000u];
      objc_initWeak(&location, self);
      dispatch_time_t v3 = dispatch_time(0, 3000000000);
      uint64_t v4 = [(NSURLSessionTask *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__NSURLSessionTask__releasePreventIdleSleepAssertionIfAppropriate__block_invoke;
      block[3] = &unk_1E5258100;
      objc_copyWeak(&v10, &location);
      dispatch_after(v3, (dispatch_queue_t)v4, block);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
  }
  if ([(NSURLSessionTask *)self _darkWakePowerAssertion])
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if ([(NSURLSessionTask *)self _darkWakePowerAssertion])
    {
      [(NSURLSessionTask *)self set_darkWakePowerAssertionReleaseTime:clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + 3000000000u];
      objc_initWeak(&location, self);
      dispatch_time_t v5 = dispatch_time(0, 3000000000);
      CFAllocatorRef v6 = [(NSURLSessionTask *)self workQueue];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __66__NSURLSessionTask__releasePreventIdleSleepAssertionIfAppropriate__block_invoke_106;
      v7[3] = &unk_1E5258100;
      objc_copyWeak(&v8, &location);
      dispatch_after(v5, (dispatch_queue_t)v6, v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
  }
}

- (void)_onSessionQueue_cleanupAndBreakCycles
{
  if ([(NSURLSessionTask *)self _powerAssertion])
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if ([(NSURLSessionTask *)self _powerAssertion])
    {
      unsigned int v3 = [(NSURLSessionTask *)self _powerAssertion];
      [(NSURLSessionTask *)self set_powerAssertion:0];
      os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
      if (v3)
      {
        uint64_t v4 = [(NSURLSessionTask *)self _loggableDescription];
        dispatch_time_t v5 = dispatch_time(0, 3000000000);
        CFAllocatorRef v6 = [(NSURLSessionTask *)self workQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __57__NSURLSessionTask__onSessionQueue_cleanupAndBreakCycles__block_invoke;
        block[3] = &unk_1E5258058;
        void block[4] = v4;
        unsigned int v13 = v3;
        dispatch_after(v5, (dispatch_queue_t)v6, block);
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
    }
  }
  if ([(NSURLSessionTask *)self _darkWakePowerAssertion])
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if ([(NSURLSessionTask *)self _darkWakePowerAssertion])
    {
      unsigned int v7 = [(NSURLSessionTask *)self _darkWakePowerAssertion];
      [(NSURLSessionTask *)self set_darkWakePowerAssertion:0];
      os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
      if (v7)
      {
        dispatch_time_t v8 = dispatch_time(0, 3000000000);
        BOOL v9 = [(NSURLSessionTask *)self workQueue];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __57__NSURLSessionTask__onSessionQueue_cleanupAndBreakCycles__block_invoke_107;
        v10[3] = &__block_descriptor_36_e5_v8__0l;
        unsigned int v11 = v7;
        dispatch_after(v8, (dispatch_queue_t)v9, v10);
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
    }
  }
}

- (unsigned)_powerAssertion
{
  return self->_powerAssertion;
}

- (unsigned)_darkWakePowerAssertion
{
  return self->_darkWakePowerAssertion;
}

- (NSString)_sourceApplicationBundleIdentifierForMobileAsset
{
  return self->_sourceApplicationBundleIdentifierForMobileAsset;
}

- (NSURL)currentRequest_URL
{
  uint64_t v2 = [(NSURLSessionTask *)self currentRequest];

  return [(NSURLRequest *)v2 URL];
}

- (NSURLRequest)currentRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 168, 1);
}

- (BOOL)_preventsAppSSO
{
  return self->_preventsAppSSO;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int)_allowsExpensiveOverride
{
  return self->_allowsExpensiveOverride;
}

- (int)_allowsConstrainedOverride
{
  return self->_allowsConstrainedOverride;
}

- (NSDictionary)_legacySocketStreamProperties
{
  uint64_t v2 = self->_legacySocketStreamProperties;

  return v2;
}

- (unint64_t)_attribution
{
  return self->_attribution;
}

- (int)_allowsCellularOverride
{
  return self->_allowsCellularOverride;
}

- (BOOL)_useEnhancedPrivacyMode
{
  return self->_useEnhancedPrivacyMode;
}

- (NSString)_trackerContext
{
  return (NSString *)objc_getProperty(self, a2, 736, 1);
}

- (double)_timeWindowDuration
{
  return self->_timeWindowDuration;
}

- (double)_timeWindowDelay
{
  return self->_timeWindowDelay;
}

- (int)_requiresDNSSECValidation
{
  return self->_requiresDNSSECValidation;
}

- (BOOL)_prohibitPrivacyProxy
{
  return self->_prohibitPrivacyProxy;
}

- (BOOL)_privacyProxyFailClosed
{
  return self->_privacyProxyFailClosed;
}

- (BOOL)_privacyProxyFailClosedForUnreachableNonMainHosts
{
  return self->_privacyProxyFailClosedForUnreachableNonMainHosts;
}

- (BOOL)_privacyProxyFailClosedForUnreachableHosts
{
  return self->_privacyProxyFailClosedForUnreachableHosts;
}

- (BOOL)_isWebSearchContent
{
  return self->_isWebSearchContent;
}

- (BOOL)_isKnownTracker
{
  return self->_isKnownTracker;
}

- (OS_nw_endpoint)_hostOverride
{
  return self->_hostOverride;
}

- (BOOL)_failInsecureLoadWithHTTPSDNSRecord
{
  return self->_failInsecureLoadWithHTTPSDNSRecord;
}

- (BOOL)_disallowCellular
{
  return self->_disallowCellular;
}

- (NSString)_boundInterfaceIdentifier
{
  uint64_t v2 = self->_boundInterfaceIdentifier;

  return v2;
}

- (int)_allowsUCAOverride
{
  return self->_allowsUCAOverride;
}

- (BOOL)_allowsPersistentDNS
{
  return self->_allowsPersistentDNS;
}

- (int)_networkServiceType
{
  return self->_networkServiceType;
}

- (void)fillTaskDescriptionWithTaskIdentifier:(void *)a3 uniqueIdentifier:(uint64_t)a4 FixedTemplate:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    *(void *)uu = 0;
    uint64_t v13 = 0;
    [a3 getUUIDBytes:uu];
    uuid_unparse(uu, (char *)(a4 + 1));
    *(unsigned char *)(a4 + 37) = 62;
    if (a2)
    {
      uint64_t v6 = 39;
      unint64_t v7 = a2;
      do
      {
        ++v6;
        BOOL v8 = v7 >= 0xA;
        v7 /= 0xAuLL;
      }
      while (v8);
      int v9 = v6 - 40;
      do
      {
        *(unsigned char *)(a4 + v6) = (a2 % 0xA) | 0x30;
        unint64_t v10 = v6 - 39;
        --v6;
        a2 /= 0xAuLL;
      }
      while (v10 > 1);
      uint64_t v11 = (v9 + 41);
    }
    else
    {
      uint64_t v11 = 40;
    }
    *(unsigned char *)(a4 + v11) = 62;
  }
}

- (BOOL)_isAVAssetTask
{
  return 0;
}

- (void)set_qos:(unsigned int)a3
{
  self->_qos = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (BOOL)_assumesHTTP3Capable
{
  return self->_assumesHTTP3Capable;
}

- (__CFDictionary)_copyATSState
{
  result = self->_atsStateCache;
  if (!result)
  {
    result = createDictionaryFromData((const __CFData *)objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "_atsContext"));
    if (result) {
      goto LABEL_9;
    }
    uint64_t v4 = [(NSURLSessionTask *)self session];
    if (!v4) {
      goto LABEL_13;
    }
    dispatch_time_t v5 = v4;
    atsState_ivar = v4->_atsState_ivar;
    if (!atsState_ivar)
    {
      CFDataRef DictionaryFromData = createDictionaryFromData((const __CFData *)[(NSURLSessionConfiguration *)v5->_local_immutable_configuration_ivar _atsContext]);
      if (DictionaryFromData)
      {
        v5->_atsState_ivar = (NSDictionary *)DictionaryFromData;
        CFRelease(DictionaryFromData);
      }
      atsState_ivar = v5->_atsState_ivar;
      if (!atsState_ivar) {
        goto LABEL_13;
      }
    }
    result = (__CFDictionary *)CFRetain(atsState_ivar);
    if (result)
    {
LABEL_9:
      self->_atsStateCache = result;
    }
    else
    {
LABEL_13:
      result = self->_atsStateCache;
      if (!result) {
        return result;
      }
    }
  }

  return (__CFDictionary *)CFRetain(result);
}

- (NSURLSessionTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v8 = [(NSURLSessionTask *)self initWithTaskGroup:a5];
  if (v8)
  {
    v8->_effectiveConfiguration = (NSURLSessionConfiguration *)(id)[a5 _groupConfiguration];
    uint64_t v9 = [a3 copy];
    v8->_originalRequest = (NSURLRequest *)v9;
    [(NSURLSessionTask *)v8 updateCurrentRequest:v9];
    v8->_taskIdentifier = a4;
    v8->_uniqueIdentifier = (NSUUID *)(id)[MEMORY[0x1E4F29128] UUID];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v8->_startTime = v10;
    v8->_state = 1;
    [(NSURLSessionConfiguration *)v8->_effectiveConfiguration timeoutIntervalForResource];
    v8->_timeoutIntervalForResource_ivar = v11;
    if ([(NSURLSessionConfiguration *)v8->_effectiveConfiguration _appleIDContext]
      || [(NSURLSessionConfiguration *)v8->_effectiveConfiguration _authenticatorStatusCodes])
    {
      [(NSURLSessionTask *)v8 initializeHTTPAuthenticatorWithAppleIDContext:[(NSURLSessionConfiguration *)v8->_effectiveConfiguration _appleIDContext] statusCodes:[(NSURLSessionConfiguration *)v8->_effectiveConfiguration _authenticatorStatusCodes]];
    }
    v8->_countOfBytesClientExpectsToSend = -1;
    v8->_countOfBytesClientExpectsToReceive = -1;
    BOOL v12 = [(NSURLSessionConfiguration *)v8->_effectiveConfiguration _requiresSustainedDataDelivery];
    v8->_legacySocketStreamProperties = 0;
    uint64_t v13 = 0x200000;
    if (v12) {
      uint64_t v13 = 0x10000;
    }
    v8->_strictContentLength = 1;
    v8->_qos = 0;
    v8->_voucher = 0;
    v8->_suspensionThreshhold = v13;
    v8->_requestPriority = -1;
    v8->_priorityCFDictionaryRef Value = 300;
    v8->_loadingPriorityCFDictionaryRef Value = 0.5;
    v8->_networkServiceType = 0;
    v8->_priorityAPIStorage = 0.5;
    v8->_prefersIncrementalDeliveryAPIStorage = 1;
    *(_DWORD *)&v8->__TLSMinimumSupportedProtocolVersion = 0;
    v8->_shouldSkipPreferredClientCertificateLookup = [(NSURLSessionConfiguration *)v8->_effectiveConfiguration _shouldSkipPreferredClientCertificateLookup];
    v8->_preventsSystemHTTPProxyAuthentication = [(NSURLSessionConfiguration *)v8->_effectiveConfiguration _preventsSystemHTTPProxyAuthentication];
    v8->_requiresSecureHTTPSProxyConnection = [(NSURLSessionConfiguration *)v8->_effectiveConfiguration _requiresSecureHTTPSProxyConnection];
    v8->_preventsAppSSO = [(NSURLSessionConfiguration *)v8->_effectiveConfiguration _preventsAppSSO];
    v8->_discretionaryOverride = 0;
    v8->_unfair_lock._os_unfair_lock_opaque = 0;
    *(_DWORD *)&v8->_extractorFinishedDecoding = 0;
    if (__CFNIsRunningInXcode::envCheckOnce != -1) {
      dispatch_once(&__CFNIsRunningInXcode::envCheckOnce, &__block_literal_global_43);
    }
    if ((__CFNIsRunningInXcode::runningInXcode & 1) != 0 || ne_tracker_should_save_stacktrace())
    {
      *(void *)buf = 0;
      -[NSURLSessionTask set_backtrace:](v8, "set_backtrace:", [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:ne_tracker_copy_current_stacktrace() length:0]);
    }
    v8->_metrics = (__CFN_TaskMetrics *)-[__CFN_TaskMetrics initWithTask:]((char *)[__CFN_TaskMetrics alloc], v8);
    uint64_t v14 = [__NSCFResumableUploadState alloc];
    v15 = v8->_originalRequest;
    CFNumberRef v16 = v15;
    if (!v14)
    {
      BOOL v19 = 0;
      goto LABEL_31;
    }
    if (v15)
    {
      v32.receiver = v14;
      v32.super_class = (Class)__NSCFResumableUploadState;
      id v17 = [(NSURLSessionTask *)&v32 init];
      BOOL v19 = (__NSCFResumableUploadState *)v17;
      if (!v17)
      {
LABEL_31:

        v8->_resumableUploadState = v19;
        return v8;
      }
      HIDWORD(v17->_uploadProgress) = 0;
      objc_setProperty_atomic(v17, v18, @"6", 56);
      objc_setProperty_atomic_copy(v19, v20, v16, 32);
      v19->_bodyType = -1;
      v19->_offset = 0;
      v19->_streamLength = -1;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v14 = [(NSURLRequest *)v16 allHTTPHeaderFields];
      uint64_t v21 = [(__NSCFResumableUploadState *)v14 countByEnumeratingWithState:&v28 objects:buf count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v29 != v22) {
              objc_enumerationMutation(v14);
            }
            CFTypeID v24 = [*(id *)(*((void *)&v28 + 1) + 8 * i) lowercaseString];
            char v25 = [v24 hasPrefix:@"upload-"];

            if (v25)
            {
              v19->_userOverride = 1;
              goto LABEL_30;
            }
          }
          uint64_t v21 = [(__NSCFResumableUploadState *)v14 countByEnumeratingWithState:&v28 objects:buf count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      uint64_t v26 = (id)CFNLog::logger;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_184085000, v26, OS_LOG_TYPE_ERROR, "ResumableUploadState: cannot initWithOriginalRequest with nil request", buf, 2u);
      }

      BOOL v19 = 0;
    }
LABEL_30:

    goto LABEL_31;
  }
  return v8;
}

- (_CFHSTSPolicy)_copyHSTSPolicy
{
  if ([(NSURLSessionTask *)self _cfHSTS])
  {
    result = [(NSURLSessionTask *)self _cfHSTS];
    if (result)
    {
      return (_CFHSTSPolicy *)CFRetain(result);
    }
  }
  else
  {
    uint64_t v4 = (void *)[(__NSURLSessionTaskGroupForConfiguration *)[(NSURLSessionTask *)self _taskGroup] _groupConfiguration];
    return (_CFHSTSPolicy *)[v4 copyHSTSPolicy];
  }
  return result;
}

- (_CFHSTSPolicy)_cfHSTS
{
  return (_CFHSTSPolicy *)objc_getProperty(self, a2, 312, 1);
}

- (NSURLSessionTask)initWithTaskGroup:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NSURLSessionTask;
  uint64_t v4 = [(NSURLSessionTask *)&v9 init];
  if (v4)
  {
    v4->__taskGroup = (__NSURLSessionTaskGroupForConfiguration *)a3;
    dispatch_time_t v5 = (void *)[a3 _groupSession];
    uint64_t v6 = -[__NSCFURLSessionDelegateWrapper initWithSession:]((id *)[__NSCFURLSessionDelegateWrapper alloc], v5);
    v4->_publicDelegateWrapper = (__NSCFURLSessionDelegateWrapper *)v6;
    if (v5) {
      unint64_t v7 = (void *)v5[9];
    }
    else {
      unint64_t v7 = 0;
    }
    -[__NSCFURLSessionDelegateWrapper setFallbackDelegateWrapper:]((uint64_t)v6, v7);
  }
  return v4;
}

- (const)_createXCredentialStorage
{
  if ([(NSURLSessionTask *)self _cfCreds])
  {
    unsigned int v3 = [(NSURLSessionTask *)self _cfCreds];
    return (const XCredentialStorage *)XCredentialStorage::createCFXCredentialStorage((XCredentialStorage *)v3, v4);
  }
  else
  {
    uint64_t v6 = [(NSURLSessionConfiguration *)self->_effectiveConfiguration URLCredentialStorage];
    if (v6)
    {
      unint64_t v7 = v6;
      BOOL v8 = (NSXCredentialStorage *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 32, 0);
      *(_OWORD *)BOOL v8 = 0u;
      *((_OWORD *)v8 + 1) = 0u;
      NSXCredentialStorage::NSXCredentialStorage(v8, v7);
    }
    else
    {
      return (const XCredentialStorage *)XCredentialStorage::createEmptyXCredentialStorage(0);
    }
  }
  return result;
}

- (_CFURLCredentialStorage)_cfCreds
{
  return (_CFURLCredentialStorage *)objc_getProperty(self, a2, 328, 1);
}

- (NSData)_backtrace
{
  return self->_backtrace;
}

- (id)_httpConnectionInfoCompletionBlock
{
  return self->_httpConnectionInfoCompletionBlock;
}

- (__CFSet)_getAuthenticatorStatusCodes
{
  uint64_t v2 = [(NSURLSessionTask *)self authenticator];

  return (__CFSet *)[(NSURLSessionTaskHTTPAuthenticator *)v2 statusCodes];
}

- (NSURLSessionTaskHTTPAuthenticator)authenticator
{
  return (NSURLSessionTaskHTTPAuthenticator *)objc_getProperty(self, a2, 456, 1);
}

uint64_t __33__NSURLSessionTask_set_priority___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_adjustPoolPriority");
}

void __52__NSURLSessionTask__addAdditionalHeaders_toRequest___block_invoke(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 32);
      if (!v6 || !CFDictionaryContainsKey(v6, a2))
      {
        unint64_t v7 = *(void **)(a1 + 40);
        CFURLRequestSetHTTPHeaderFieldValue(v7, a2, a3);
      }
    }
  }
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 256, 1);
}

- (id)_timingData
{
  Property = [(NSURLSessionTask *)self _metrics];
  if (Property) {
    Property = (__CFN_TaskMetrics *)objc_getProperty(Property, v3, 96, 1);
  }

  return -[__CFN_TransactionMetrics legacyStaticMetrics]((uint64_t)Property);
}

- (__CFN_TaskMetrics)_metrics
{
  return (__CFN_TaskMetrics *)objc_getProperty(self, a2, 616, 1);
}

- (void)_completeUploadProgress
{
  int64_t v3 = [(NSProgress *)self->_uploadProgress totalUnitCount];
  uploadProgress = self->_uploadProgress;

  [(NSProgress *)uploadProgress setCompletedUnitCount:v3];
}

- (void)_finishProgressReporting
{
  if (!self->_progressReportingFinished)
  {
    self->_progressReportingFinished = 1;
    if (![(NSURLSessionTask *)self error])
    {
      [(NSURLSessionTask *)self _completeUploadProgress];
      [(NSProgress *)self->_downloadProgress setCompletedUnitCount:[(NSProgress *)self->_downloadProgress totalUnitCount]];
    }
    objc_sync_enter(self);
    [(NSProgress *)self->_progress setCancellationHandler:0];
    [(NSProgress *)self->_progress setPausingHandler:0];
    [(NSProgress *)self->_progress setResumingHandler:0];
    objc_sync_exit(self);
  }
}

- (void)_consumePendingBytesReceivedEncoded
{
  p_unfair_lock = &self->_unfair_lock;
  os_unfair_lock_lock(&self->_unfair_lock);
  if ([(NSURLSessionTask *)self _countOfPendingBytesReceivedEncoded])
  {
    int64_t v4 = [(NSURLSessionTask *)self _countOfPendingBytesReceivedEncoded];
    [(NSURLSessionTask *)self set_countOfPendingBytesReceivedEncoded:0];
    os_unfair_lock_unlock(p_unfair_lock);
    if (v4)
    {
      int64_t v5 = [(NSURLSessionTask *)self _countOfBytesReceivedEncoded] + v4;
      [(NSURLSessionTask *)self set_countOfBytesReceivedEncoded:v5];
    }
  }
  else
  {
    os_unfair_lock_unlock(p_unfair_lock);
  }
}

- (int64_t)_countOfPendingBytesReceivedEncoded
{
  return self->__countOfPendingBytesReceivedEncoded;
}

- (int64_t)_countOfBytesReceivedEncoded
{
  return self->__countOfBytesReceivedEncoded;
}

- (void)set_countOfBytesReceivedEncoded:(int64_t)a3
{
  self->__countOfBytesReceivedEncoded = a3;
}

- (void)setResponse:(id)a3
{
}

- (void)setCountOfBytesExpectedToReceive:(int64_t)a3
{
  self->_countOfBytesExpectedToReceive = a3;
}

- (void)set_connectionIsCompanionLink:(BOOL)a3
{
  self->_connectionIsCompanionLink = a3;
}

- (void)_setConnectionIsCellular:(BOOL)a3
{
  self->_connectionIsCellular = a3;
}

- (unint64_t)_cachePolicy
{
  return self->_cachePolicy;
}

- (BOOL)_preconnect
{
  return self->_preconnect;
}

- (BOOL)_strictContentLength
{
  return self->_strictContentLength;
}

- (void)_withXURLCache:(id)a3
{
  if ([(NSURLSessionTask *)self _cfCache])
  {
    int64_t v4 = [(NSURLSessionTask *)self _cfCache];
    int64_t v5 = [(NSURLSessionTask *)self session];
    XURLCache::createCFXURLCache((XURLCache *)v4, (const _CFURLCache *)v5, v6);
  }
  unint64_t v7 = [(NSURLSessionConfiguration *)self->_effectiveConfiguration URLCache];
  if (v7)
  {
    BOOL v8 = v7;
    objc_super v9 = [(NSURLSessionTask *)self session];
    XURLCache::createNSXURLCache(v8, v9, v10);
  }
}

- (_CFURLCache)_cfCache
{
  return (_CFURLCache *)objc_getProperty(self, a2, 320, 1);
}

- (NSDictionary)_proxySettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 368, 1);
}

- (id)_incompleteCurrentTaskTransactionMetrics
{
  int64_t v3 = [NSURLSessionTaskTransactionMetrics alloc];
  int64_t v4 = [(NSURLSessionTask *)self _metrics];
  if (v4) {
    id Property = objc_getProperty(v4, v5, 96, 1);
  }
  else {
    id Property = 0;
  }
  unint64_t v7 = -[NSURLSessionTaskTransactionMetrics initWithMetrics:forCache:](v3, Property, 0);

  return v7;
}

- (BOOL)_callCompletionHandlerInline
{
  return self->_callCompletionHandlerInline;
}

- (void)_resetTaskDelegate
{
  if (a1)
  {
    int64_t v3 = *(void **)(a1 + 696);
    if (v3) {
      objc_setProperty_atomic(v3, a2, 0, 32);
    }
    int64_t v4 = *(void **)(a1 + 704);
    if (v4)
    {
      objc_setProperty_atomic(v4, a2, 0, 32);
    }
  }
}

- (BOOL)_cacheOnly
{
  return self->_cacheOnly;
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 176, 1);
}

- (void)set_trailers:(id)a3
{
}

- (void)set_TCPConnectionMetadata:(id)a3
{
}

- (id)_protocolForTask
{
  return self->_protocolForTask;
}

- (void)set_protocolForTask:(id)a3
{
  self->_protocolForTask = a3;
}

- (NSURLRequest)originalRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 160, 1);
}

- (NSString)taskDescription
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (int64_t)computeAdjustedPoolPriority
{
  double v3 = (double)[(NSURLSessionTask *)self _priorityValue];
  [(NSURLSessionTask *)self _loadingPriorityValue];
  return (uint64_t)(v3 + (0.5 - v4) * 50.0);
}

- (int64_t)_priorityValue
{
  return self->_priorityValue;
}

- (double)_loadingPriorityValue
{
  return self->_loadingPriorityValue;
}

- (void)setCountOfBytesSent:(int64_t)a3
{
  self->_countOfBytesSent = a3;
}

- (void)setCountOfBytesExpectedToSend:(int64_t)a3
{
  self->_countOfBytesExpectedToSend = a3;
}

- (void)set_uniqueIdentifier:(id)a3
{
  loggableDescription = self->_loggableDescription;
  self->_loggableDescription = 0;

  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = (NSUUID *)[a3 copy];

  unint64_t v7 = [(NSURLSessionTask *)self _metrics];
  if (v7)
  {
    p_UUID = (id *)&v7->_UUID;
    objc_storeStrong(p_UUID, a3);
  }
}

- (void)setTaskDescription:(NSString *)taskDescription
{
}

- (void)setCountOfBytesClientExpectsToSend:(int64_t)countOfBytesClientExpectsToSend
{
  self->_countOfBytesClientExpectsToSend = countOfBytesClientExpectsToSend;
}

- (void)setCountOfBytesClientExpectsToReceive:(int64_t)countOfBytesClientExpectsToReceive
{
  self->_countOfBytesClientExpectsToReceive = countOfBytesClientExpectsToReceive;
}

- (int64_t)_discretionaryOverride
{
  return self->_discretionaryOverride;
}

- (unsigned)_TLSMinimumSupportedProtocolVersion
{
  return self->__TLSMinimumSupportedProtocolVersion;
}

- (unsigned)_TLSMaximumSupportedProtocolVersion
{
  return self->__TLSMaximumSupportedProtocolVersion;
}

- (BOOL)_requiresSecureHTTPSProxyConnection
{
  return self->_requiresSecureHTTPSProxyConnection;
}

- (OS_nw_activity)_private_nw_activity
{
  return (OS_nw_activity *)objc_getProperty(self, a2, 632, 1);
}

- (unint64_t)_expectedProgressTarget
{
  return self->_expectedProgressTargetValue;
}

- (void)_logUnlistedTracker:(id)a3
{
  if (a3)
  {
    id Property = objc_getProperty(a3, a2, 88, 1);
    if (Property)
    {
      if (Property[20]
        && [(NSURLSessionTask *)self _backtrace]
        && ![(NSURLSessionConfiguration *)[(NSURLSessionTask *)self _effectiveConfiguration] _skipsStackTraceCapture])
      {
        int64_t v5 = [(NSString *)[[(NSURLRequest *)[(NSURLSessionTask *)self originalRequest] URL] host] UTF8String];
        CFDictionaryRef v6 = [(NSData *)[(NSURLSessionTask *)self _backtrace] bytes];
        NSUInteger v7 = [(NSData *)[(NSURLSessionTask *)self _backtrace] length];
        MEMORY[0x1F40CCF90](v5, v6, v7);
      }
    }
  }
}

- (void)set_metrics:(id)a3
{
}

- (void)set_backgroundTransactionMetrics:(id)a3
{
}

- (double)_timeoutInterval
{
  return self->_timeoutInterval;
}

- (NSDictionary)_DuetActivityProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 488, 1);
}

- (NSData)_TCPConnectionMetadata
{
  return (NSData *)objc_getProperty(self, a2, 496, 1);
}

- (int64_t)_suspensionThreshhold
{
  return self->_suspensionThreshhold;
}

- (int64_t)_bytesPerSecondLimit
{
  return self->_bytesPerSecondLimitValue;
}

- (void)_takePreventIdleSleepAssertionIfAppropriate
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(NSURLSessionTask *)self state] <= NSURLSessionTaskStateSuspended
    && [(NSURLSessionConfiguration *)self->_effectiveConfiguration _preventsIdleSleepOnceConnected])
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if (![(NSURLSessionTask *)self _powerAssertion])
    {
      CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      double v4 = [(NSURLSessionTask *)self _uniqueIdentifier];
      if (!v4) {
        double v4 = (NSUUID *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](self, "taskIdentifier"));
      }
      CFStringRef v5 = CFStringCreateWithFormat(v3, 0, @"NSURLSessionTask %@", v4);
      IOPMAssertionID AssertionID = 0;
      values = @"PreventUserIdleSystemSleep";
      *(void *)&long long keys = @"AssertType";
      *((void *)&keys + 1) = @"AssertLevel";
      int valuePtr = 255;
      CFTypeRef cf = CFNumberCreate(v3, kCFNumberIntType, &valuePtr);
      CFStringRef v16 = v5;
      SEL v20 = @"AssertName";
      uint64_t v21 = @"TimeoutSeconds";
      int v12 = 10800;
      CFNumberRef v6 = CFNumberCreate(v3, kCFNumberIntType, &v12);
      uint64_t v22 = @"TimeoutAction";
      CFTypeRef v17 = v6;
      double v18 = @"TimeoutActionTurnOff";
      CFDictionaryRef v7 = CFDictionaryCreate(v3, (const void **)&keys, (const void **)&values, 5, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if (cf) {
        CFRelease(cf);
      }
      if (v17) {
        CFRelease(v17);
      }
      IOReturn v8 = IOPMAssertionCreateWithProperties(v7, &AssertionID);
      if (v7) {
        CFRelease(v7);
      }
      if (!v8)
      {
        [(NSURLSessionTask *)self set_powerAssertion:AssertionID];
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        objc_super v9 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
        {
          double v10 = [(NSURLSessionTask *)self _loggableDescription];
          LODWORD(keys) = 138543362;
          *(void *)((char *)&keys + 4) = v10;
          _os_log_impl(&dword_184085000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ TAKING power assertion.", (uint8_t *)&keys, 0xCu);
        }
      }
      if (v5) {
        CFRelease(v5);
      }
    }
    [(NSURLSessionTask *)self set_powerAssertionReleaseTime:-1];
    os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
  }
}

- (NSDictionary)_dependencyInfo
{
  v5[1] = *MEMORY[0x1E4F143B8];
  result = self->_dependencyInfo_ivar;
  if (!result)
  {
    double v4 = @"TaskIdentifier";
    v5[0] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](self, "taskIdentifier"));
    result = (NSDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1), "copy");
    self->_dependencyInfo_ivar = result;
  }
  return result;
}

void __93__NSURLSessionTask_HTTPConnectionInfo__getUnderlyingHTTPConnectionInfoWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  if (a2) {
    objc_storeWeak((id *)(a2 + 24), Weak);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__NSURLSessionTask_HTTPConnectionInfo__getUnderlyingHTTPConnectionInfoWithCompletionHandler___block_invoke_4;
  v6[3] = &unk_1E5258028;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  -[NSURLSession runDelegateBlock:]((uint64_t)Weak, v6);
}

- (void)set_DuetActivityProperties:(id)a3
{
}

void __47__NSURLSessionTask__copySocketStreamProperties__block_invoke(uint64_t a1, const void *a2, const void *a3)
{
}

- (NSString)_storagePartitionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 424, 1);
}

- (float)priority
{
  if (self) {
    return self->_priorityAPIStorage;
  }
  else {
    return 0.0;
  }
}

- (BOOL)prefersIncrementalDelivery
{
  if (self) {
    LOBYTE(self) = self->_prefersIncrementalDeliveryAPIStorage;
  }
  return (char)self;
}

- (BOOL)_shouldUsePipelineHeuristics
{
  return self->_shouldUsePipelineHeuristics;
}

- (BOOL)_shouldSkipPipelineProbe
{
  return self->_shouldSkipPipelineProbe;
}

- (BOOL)_shouldPipelineHTTP
{
  return self->_shouldPipelineHTTP;
}

- (int64_t)_requestPriority
{
  return self->_requestPriority;
}

- (unint64_t)_allowedProtocolTypes
{
  return self->_allowedProtocolTypes;
}

- (NSString)_APSRelayTopic
{
  return self->_APSRelayTopic;
}

- (const)_createXCookieStorage
{
  if ([(NSURLSessionTask *)self _cfCookies])
  {
    CFAllocatorRef v3 = [(NSURLSessionTask *)self _cfCookies];
    double v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 40, 0);
    *double v4 = 0u;
    v4[1] = 0u;
    *((void *)v4 + 4) = 0;
    CFXCookieStorage::CFXCookieStorage((CFXCookieStorage *)v4, v3);
  }
  else
  {
    CFNumberRef v6 = [(NSURLSessionConfiguration *)self->_effectiveConfiguration HTTPCookieStorage];
    if (v6)
    {
      XCookieStorage::createNSXCookieStorage((XCookieStorage *)v6, v7);
    }
    else
    {
      XCookieStorage::createEmptyXCookieStorage(0, v7);
    }
  }
  return result;
}

- (OpaqueCFHTTPCookieStorage)_cfCookies
{
  return (OpaqueCFHTTPCookieStorage *)objc_getProperty(self, a2, 336, 1);
}

- (int)_cookieAcceptPolicy
{
  return self->_cookieAcceptPolicy;
}

- (NSURL)_siteForCookies
{
  return (NSURL *)objc_getProperty(self, a2, 560, 1);
}

- (NSURL)currentRequest_mainDocumentURL
{
  uint64_t v2 = [(NSURLSessionTask *)self currentRequest];

  return [(NSURLRequest *)v2 mainDocumentURL];
}

- (void)set_powerAssertionReleaseTime:(unint64_t)a3
{
  self->_powerAssertionReleaseTime = a3;
}

void __26__NSURLSessionTask_resume__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x18531D6D0]();
  uint64_t v3 = [*(id *)(a1 + 32) _metrics];
  if (v3) {
    double v4 = *(double *)(v3 + 56);
  }
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_resume", v4);
}

- (void)setPrefersIncrementalDelivery:(BOOL)prefersIncrementalDelivery
{
  if (self)
  {
    if (self->_prefersIncrementalDeliveryAPIStorage == prefersIncrementalDelivery) {
      return;
    }
    self->_prefersIncrementalDeliveryAPIStorage = prefersIncrementalDelivery;
  }
  else if (!prefersIncrementalDelivery)
  {
    return;
  }
  if ([(NSURLSessionTask *)self session])
  {
    uint64_t v5 = [(NSURLSessionTask *)self workQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__NSURLSessionTask_setPrefersIncrementalDelivery___block_invoke;
    v6[3] = &unk_1E5258080;
    v6[4] = self;
    BOOL v7 = prefersIncrementalDelivery;
    dispatch_async((dispatch_queue_t)v5, v6);
  }
}

uint64_t __32__NSURLSessionTask_setPriority___block_invoke(uint64_t a1, double a2)
{
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (v3) {
    uint64_t v4 = v3[69] & 1;
  }
  else {
    uint64_t v4 = 0;
  }
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(v3, "_onqueue_adjustPriorityHint:incremental:", v4, a2);
}

uint64_t __74__NSURLSessionTask__EffectiveConfiguration___adoptEffectiveConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_adoptEffectiveConfiguration:", *(void *)(a1 + 40));
}

- (void)set_priority:(int64_t)a3
{
  [(NSURLSessionTask *)self set_priorityValue:a3];
  if ([(NSURLSessionTask *)self session])
  {
    uint64_t v4 = [(NSURLSessionTask *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__NSURLSessionTask_set_priority___block_invoke;
    block[3] = &unk_1E5258228;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)v4, block);
  }
}

- (void)set_priorityValue:(int64_t)a3
{
  self->_priorityCFDictionaryRef Value = a3;
}

- (NSString)_pathToDownloadTaskFile
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (STExtractor)_extractor
{
  return self->_extractor;
}

- (void)set_pathToDownloadTaskFile:(id)a3
{
}

- (void)set_proxyHandshakePending:(BOOL)a3
{
  self->_proxyHandshakePending = a3;
}

- (NSURLSessionTask)initWithTask:(id)a3
{
  uint64_t v4 = -[NSURLSessionTask initWithTaskGroup:](self, "initWithTaskGroup:", [a3 _taskGroup]);
  if (v4)
  {
    v4->_originalRequest = (NSURLRequest *)objc_msgSend((id)objc_msgSend(a3, "originalRequest"), "copy");
    v4->_currentRequest = (NSURLRequest *)objc_msgSend((id)objc_msgSend(a3, "currentRequest"), "mutableCopy");
    v4->_taskIdentifier = [a3 taskIdentifier];
    v4->_response = (NSURLResponse *)objc_msgSend((id)objc_msgSend(a3, "response"), "copy");
    -[NSURLSessionTask setEarliestBeginDate:](v4, "setEarliestBeginDate:", [a3 earliestBeginDate]);
    v4->_countOfBytesClientExpectsToSend = [a3 countOfBytesClientExpectsToSend];
    v4->_countOfBytesClientExpectsToReceive = [a3 countOfBytesClientExpectsToReceive];
    v4->_countOfBytesReceived = [a3 countOfBytesReceived];
    v4->__countOfPendingBytesReceivedEncoded = [a3 _countOfPendingBytesReceivedEncoded];
    v4->__countOfBytesReceivedEncoded = [a3 _countOfBytesReceivedEncoded];
    v4->_countOfBytesSent = [a3 countOfBytesSent];
    v4->_countOfBytesExpectedToSend = [a3 countOfBytesExpectedToSend];
    v4->_countOfBytesExpectedToReceive = [a3 countOfBytesExpectedToReceive];
    v4->_taskDescription = (NSString *)objc_msgSend((id)objc_msgSend(a3, "taskDescription"), "copy");
    [a3 startTime];
    v4->_startTime = v5;
    CFNumberRef v6 = (NSURLSessionConfiguration *)objc_msgSend((id)objc_msgSend(a3, "_effectiveConfiguration"), "copy");
    v4->_effectiveConfiguration = v6;
    [(NSURLSessionConfiguration *)v6 timeoutIntervalForResource];
    v4->_timeoutIntervalForResource_ivar = v7;
    v4->_priorityCFDictionaryRef Value = [a3 _priorityValue];
    if (a3)
    {
      objc_super v9 = (void *)*((void *)a3 + 87);
      if (v9) {
        id Property = objc_getProperty(v9, v8, 32, 1);
      }
      else {
        id Property = 0;
      }
      publicDelegateWrapper = v4->_publicDelegateWrapper;
      if (publicDelegateWrapper) {
        objc_setProperty_atomic(publicDelegateWrapper, v8, Property, 32);
      }
      -[NSURLSessionTask set_internalDelegate:](v4, "set_internalDelegate:", objc_msgSend(a3, "_internalDelegate", Property));
      v4->_priorityAPIStorage = *((float *)a3 + 31);
      BOOL v12 = *((unsigned char *)a3 + 69) & 1;
    }
    else
    {
      uint64_t v21 = v4->_publicDelegateWrapper;
      if (v21) {
        objc_setProperty_atomic(v21, v8, 0, 32);
      }
      -[NSURLSessionTask set_internalDelegate:](v4, "set_internalDelegate:", [0 _internalDelegate]);
      BOOL v12 = 0;
      v4->_priorityAPIStorage = 0.0;
    }
    v4->_prefersIncrementalDeliveryAPIStorage = v12;
    -[NSURLSessionTask set_legacySocketStreamProperties:](v4, "set_legacySocketStreamProperties:", [a3 _legacySocketStreamProperties]);
    uint64_t v13 = (_CFHSTSPolicy *)[a3 _cfHSTS];
    if (v13) {
      uint64_t v13 = (_CFHSTSPolicy *)CFRetain(v13);
    }
    v4->_cfHSTS = v13;
    uint64_t v14 = (_CFURLCache *)[a3 _cfCache];
    if (v14) {
      uint64_t v14 = (_CFURLCache *)CFRetain(v14);
    }
    v4->_cfCache = v14;
    v15 = (_CFURLCredentialStorage *)[a3 _cfCreds];
    if (v15) {
      v15 = (_CFURLCredentialStorage *)CFRetain(v15);
    }
    v4->_cfCreds = v15;
    CFStringRef v16 = (OpaqueCFHTTPCookieStorage *)[a3 _cfCookies];
    if (v16) {
      CFStringRef v16 = (OpaqueCFHTTPCookieStorage *)CFRetain(v16);
    }
    v4->_cfCookies = v16;
    v4->_cachePolicy = [a3 _cachePolicy];
    [a3 _timeoutInterval];
    v4->_timeoutInterval = v17;
    v4->_pathToDownloadTaskFile = (NSString *)objc_msgSend((id)objc_msgSend(a3, "_pathToDownloadTaskFile"), "copy");
    -[NSURLSessionTask set_proxySettings:](v4, "set_proxySettings:", [a3 _proxySettings]);
    -[NSURLSessionTask set_proxyHandshakePending:](v4, "set_proxyHandshakePending:", [a3 _proxyHandshakePending]);
    -[NSURLSessionTask set_sslSettings:](v4, "set_sslSettings:", [a3 _sslSettings]);
    v4->_shouldPipelineHTTP = [a3 _shouldPipelineHTTP];
    v4->_shouldUsePipelineHeuristics = [a3 _shouldUsePipelineHeuristics];
    v4->_shouldSkipPipelineProbe = [a3 _shouldSkipPipelineProbe];
    v4->_shouldHandleCookies = [a3 _shouldHandleCookies];
    v4->_cookieAcceptPolicy = [a3 _cookieAcceptPolicy];
    v4->_preventsIdleSystemSleep = [a3 _preventsIdleSystemSleep];
    v4->_allowsCellular = [a3 _allowsCellular];
    v4->_networkServiceType = [a3 _networkServiceType];
    v4->_qos = [a3 _qos];
    -[NSURLSessionTask set_voucher:](v4, "set_voucher:", [a3 _voucher]);
    v4->_suspensionThreshhold = [a3 _suspensionThreshhold];
    v4->_strictContentLength = [a3 _strictContentLength];
    -[NSURLSessionTask set_boundInterfaceIdentifier:](v4, "set_boundInterfaceIdentifier:", [a3 _boundInterfaceIdentifier]);
    v4->_disallowCellular = [a3 _disallowCellular];
    v4->_allowsExpensiveOverride = [a3 _allowsExpensiveOverride];
    v4->_allowsConstrainedOverride = [a3 _allowsConstrainedOverride];
    v4->_allowsUCAOverride = [a3 _allowsUCAOverride];
    v4->_allowsCellularOverride = [a3 _allowsCellularOverride];
    v4->_assumesHTTP3Capable = [a3 _assumesHTTP3Capable];
    v4->_allowedProtocolTypes = [a3 _allowedProtocolTypes];
    v4->_requestPriority = [a3 _requestPriority];
    [a3 _timeWindowDelay];
    v4->_timeWindowDelay = v18;
    [a3 _timeWindowDuration];
    v4->_timeWindowDuration = v19;
    v4->_DuetActivityProperties = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "_DuetActivityProperties"), "copy");
    v4->__TCPConnectionMetadata = (NSData *)objc_msgSend((id)objc_msgSend(a3, "_TCPConnectionMetadata"), "copy");
    -[NSURLSessionTask set_TLSMinimumSupportedProtocolVersion:](v4, "set_TLSMinimumSupportedProtocolVersion:", [a3 _TLSMinimumSupportedProtocolVersion]);
    -[NSURLSessionTask set_TLSMaximumSupportedProtocolVersion:](v4, "set_TLSMaximumSupportedProtocolVersion:", [a3 _TLSMaximumSupportedProtocolVersion]);
    v4->_TLSNegotiatedCipherSuite = [a3 _TLSNegotiatedCipherSuite];
    -[NSURLSessionTask set_uniqueIdentifier:](v4, "set_uniqueIdentifier:", [a3 _uniqueIdentifier]);
    -[NSURLSessionTask set_storagePartitionIdentifier:](v4, "set_storagePartitionIdentifier:", [a3 _storagePartitionIdentifier]);
    v4->_shouldSkipPreferredClientCertificateLookup = [a3 _shouldSkipPreferredClientCertificateLookup];
    v4->_preventsSystemHTTPProxyAuthentication = [a3 _preventsSystemHTTPProxyAuthentication];
    v4->_requiresSecureHTTPSProxyConnection = [a3 _requiresSecureHTTPSProxyConnection];
    v4->_preventsAppSSO = [a3 _preventsAppSSO];
    v4->_appSSOFallback = [a3 _appSSOFallback];
    v4->_appleIDContextRedirect = [a3 _appleIDContextRedirect];
    -[NSURLSessionTask setAuthenticator:](v4, "setAuthenticator:", [a3 authenticator]);
    -[NSURLSessionTask set_bytesPerSecondLimit:](v4, "set_bytesPerSecondLimit:", [a3 _bytesPerSecondLimit]);
    -[NSURLSessionTask set_expectedProgressTarget:](v4, "set_expectedProgressTarget:", [a3 _expectedProgressTarget]);
    -[NSURLSessionTask set_trailers:](v4, "set_trailers:", [a3 _trailers]);
    -[NSURLSessionTask set_discretionaryOverride:](v4, "set_discretionaryOverride:", [a3 _discretionaryOverride]);
    -[NSURLSessionTask set_extractor:](v4, "set_extractor:", [a3 _extractor]);
    -[NSURLSessionTask set_extractorFinishedDecoding:](v4, "set_extractorFinishedDecoding:", [a3 _extractorFinishedDecoding]);
    -[NSURLSessionTask set_extractorPreparedForExtraction:](v4, "set_extractorPreparedForExtraction:", [a3 _extractorPreparedForExtraction]);
    -[NSURLSessionTask set_hasSZExtractor:](v4, "set_hasSZExtractor:", [a3 _hasSZExtractor]);
    -[NSURLSessionTask set_doesSZExtractorConsumeExtractedData:](v4, "set_doesSZExtractorConsumeExtractedData:", [a3 _doesSZExtractorConsumeExtractedData]);
    -[NSURLSessionTask _setAppleIDContext:](v4, "_setAppleIDContext:", [a3 _appleIDContext]);
    -[NSURLSessionTask set_authenticatorConfiguredViaTaskProperty:](v4, "set_authenticatorConfiguredViaTaskProperty:", [a3 _authenticatorConfiguredViaTaskProperty]);
    -[NSURLSessionTask set_publishingURL:](v4, "set_publishingURL:", [a3 _publishingURL]);
    -[NSURLSessionTask set_preconnect:](v4, "set_preconnect:", [a3 _preconnect]);
    -[NSURLSessionTask set_backgroundPublishingURL:](v4, "set_backgroundPublishingURL:", [a3 _backgroundPublishingURL]);
    -[NSURLSessionTask set_nw_activity:](v4, "set_nw_activity:", objc_msgSend(a3, "_nw_activity"));
    -[NSURLSessionTask set_private_nw_activity:](v4, "set_private_nw_activity:", objc_msgSend(a3, "_private_nw_activity"));
    -[NSURLSessionTask set_metrics:](v4, "set_metrics:", [a3 _metrics]);
    -[NSURLSessionTask set_APSRelayTopic:](v4, "set_APSRelayTopic:", [a3 _APSRelayTopic]);
    -[NSURLSessionTask set_isTopLevelNavigation:](v4, "set_isTopLevelNavigation:", [a3 _isTopLevelNavigation]);
    -[NSURLSessionTask set_siteForCookies:](v4, "set_siteForCookies:", [a3 _siteForCookies]);
    -[NSURLSessionTask set_hostOverride:](v4, "set_hostOverride:", [a3 _hostOverride]);
    v4->_atsStateCache = (__CFDictionary *)[a3 _copyATSState];
    -[NSURLSessionTask set_resolvedCNAMEChain:](v4, "set_resolvedCNAMEChain:", [a3 _resolvedCNAMEChain]);
    -[NSURLSessionTask set_cookieTransformCallback:](v4, "set_cookieTransformCallback:", [a3 _cookieTransformCallback]);
    -[NSURLSessionTask set_attribution:](v4, "set_attribution:", [a3 _attribution]);
    -[NSURLSessionTask set_isKnownTracker:](v4, "set_isKnownTracker:", [a3 _isKnownTracker]);
    -[NSURLSessionTask set_trackerContext:](v4, "set_trackerContext:", [a3 _trackerContext]);
    -[NSURLSessionTask set_privacyProxyFailClosed:](v4, "set_privacyProxyFailClosed:", [a3 _privacyProxyFailClosed]);
    -[NSURLSessionTask set_privacyProxyFailClosedForUnreachableNonMainHosts:](v4, "set_privacyProxyFailClosedForUnreachableNonMainHosts:", [a3 _privacyProxyFailClosedForUnreachableNonMainHosts]);
    -[NSURLSessionTask set_privacyProxyFailClosedForUnreachableHosts:](v4, "set_privacyProxyFailClosedForUnreachableHosts:", [a3 _privacyProxyFailClosedForUnreachableHosts]);
    -[NSURLSessionTask set_requiresDNSSECValidation:](v4, "set_requiresDNSSECValidation:", [a3 _requiresDNSSECValidation]);
    -[NSURLSessionTask set_allowsPersistentDNS:](v4, "set_allowsPersistentDNS:", [a3 _allowsPersistentDNS]);
    -[NSURLSessionTask set_backtrace:](v4, "set_backtrace:", [a3 _backtrace]);
    -[NSURLSessionTask set_callCompletionHandlerInline:](v4, "set_callCompletionHandlerInline:", [a3 _callCompletionHandlerInline]);
    -[NSURLSessionTask set_prohibitPrivacyProxy:](v4, "set_prohibitPrivacyProxy:", [a3 _prohibitPrivacyProxy]);
    -[NSURLSessionTask set_useEnhancedPrivacyMode:](v4, "set_useEnhancedPrivacyMode:", [a3 _useEnhancedPrivacyMode]);
    -[NSURLSessionTask set_blockTrackers:](v4, "set_blockTrackers:", [a3 _blockTrackers]);
    -[NSURLSessionTask set_failInsecureLoadWithHTTPSDNSRecord:](v4, "set_failInsecureLoadWithHTTPSDNSRecord:", [a3 _failInsecureLoadWithHTTPSDNSRecord]);
    -[NSURLSessionTask set_isWebSearchContent:](v4, "set_isWebSearchContent:", [a3 _isWebSearchContent]);
    -[NSURLSessionTask setResumableUploadState:](v4, "setResumableUploadState:", [a3 resumableUploadState]);
    -[NSURLSessionTask set_sourceApplicationBundleIdentifierForMobileAsset:](v4, "set_sourceApplicationBundleIdentifierForMobileAsset:", [a3 _sourceApplicationBundleIdentifierForMobileAsset]);
  }
  return v4;
}

- (BOOL)_hasSZExtractor
{
  return self->_hasSZExtractor;
}

- (void)set_callCompletionHandlerInline:(BOOL)a3
{
  self->_callCompletionHandlerInline = a3;
}

- (NSDictionary)_trailers
{
  return self->_trailers;
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

- (int64_t)countOfBytesExpectedToSend
{
  return self->_countOfBytesExpectedToSend;
}

- (int64_t)countOfBytesExpectedToReceive
{
  return self->_countOfBytesExpectedToReceive;
}

- (BOOL)_doesSZExtractorConsumeExtractedData
{
  return self->_doesSZExtractorConsumeExtractedData;
}

- (void)set_legacySocketStreamProperties:(id)a3
{
  self->_legacySocketStreamProperties = (NSDictionary *)[a3 copy];
}

- (void)set_resolvedCNAMEChain:(id)a3
{
  self->_resolvedCNAMEChain = (NSArray *)[a3 copy];
}

- (void)set_TLSNegotiatedCipherSuite:(unsigned __int16)a3
{
  self->_TLSNegotiatedCipherSuite = a3;
}

- (BOOL)shouldHandleCookiesAndSchemeIsAppropriate
{
  BOOL v3 = [(NSURLSessionTask *)self _shouldHandleCookies];
  if (v3)
  {
    uint64_t v4 = [(NSURLSessionTask *)self currentRequest];
    if (v4) {
      LOBYTE(v3) = URLCanUseCookies((const __CFURL *)[(NSURLRequest *)v4 URL]);
    }
    else {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)_shouldHandleCookies
{
  return self->_shouldHandleCookies;
}

- (void)set_expectedProgressTarget:(unint64_t)a3
{
  if (self->_expectedProgressTargetValue != a3)
  {
    self->_expectedProgressTargetCFDictionaryRef Value = a3;
    if ([(NSURLSessionTask *)self session])
    {
      uint64_t v4 = [(NSURLSessionTask *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__NSURLSessionTask_set_expectedProgressTarget___block_invoke;
      block[3] = &unk_1E5258228;
      void block[4] = self;
      dispatch_async((dispatch_queue_t)v4, block);
    }
  }
}

- (void)set_sourceApplicationBundleIdentifierForMobileAsset:(id)a3
{
}

- (void)set_preconnect:(BOOL)a3
{
  self->_preconnect = a3;
}

- (void)set_storagePartitionIdentifier:(id)a3
{
}

- (void)set_backgroundPublishingURL:(id)a3
{
}

- (NSURL)_backgroundPublishingURL
{
  return self->_backgroundPublishingURL;
}

- (NSDate)earliestBeginDate
{
  return (NSDate *)objc_getProperty(self, a2, 600, 1);
}

- (int64_t)countOfBytesClientExpectsToSend
{
  return self->_countOfBytesClientExpectsToSend;
}

- (int64_t)countOfBytesClientExpectsToReceive
{
  return self->_countOfBytesClientExpectsToReceive;
}

- (NSURL)_publishingURL
{
  return self->_publishingURL;
}

- (BOOL)_authenticatorConfiguredViaTaskProperty
{
  return self->_authenticatorConfiguredViaTaskProperty;
}

- (void)set_siteForCookies:(id)a3
{
}

- (void)set_publishingURL:(id)a3
{
}

- (void)set_proxySettings:(id)a3
{
}

- (void)set_isTopLevelNavigation:(BOOL)a3
{
  self->_isTopLevelNavigation = a3;
}

- (void)set_internalDelegate:(id)a3
{
  if (a3)
  {
    if (self)
    {
      internalDelegateWrapper = self->_internalDelegateWrapper;
      if (internalDelegateWrapper) {
        goto LABEL_7;
      }
    }
    CFNumberRef v6 = -[__NSCFURLSessionDelegateWrapper initWithSession:]((id *)[__NSCFURLSessionDelegateWrapper alloc], [(NSURLSessionTask *)self session]);
    if (self) {
      objc_setProperty_nonatomic(self, v7, v6, 704);
    }
    -[__NSCFURLSessionDelegateWrapper setFallbackDelegateWrapper:]((uint64_t)self->_internalDelegateWrapper, self->_publicDelegateWrapper);
    internalDelegateWrapper = self->_internalDelegateWrapper;
    if (internalDelegateWrapper)
    {
LABEL_7:
      objc_setProperty_atomic(internalDelegateWrapper, a2, a3, 32);
    }
  }
  else if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 704);
  }
}

- (void)set_hostOverride:(id)a3
{
}

- (void)set_extractorPreparedForExtraction:(BOOL)a3
{
  self->_extractorPreparedForExtraction = a3;
}

- (void)set_extractorFinishedDecoding:(BOOL)a3
{
  self->_extractorFinishedDecoding = a3;
}

- (void)set_discretionaryOverride:(int64_t)a3
{
  self->_discretionaryOverride = a3;
}

- (void)set_bytesPerSecondLimit:(int64_t)a3
{
  self->_bytesPerSecondLimitCFDictionaryRef Value = a3;
  if ([(NSURLSessionTask *)self session])
  {
    double v5 = [(NSURLSessionTask *)self workQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__NSURLSessionTask_set_bytesPerSecondLimit___block_invoke;
    v6[3] = &unk_1E5258250;
    v6[4] = self;
    void v6[5] = a3;
    dispatch_async((dispatch_queue_t)v5, v6);
  }
}

- (void)set_boundInterfaceIdentifier:(id)a3
{
  self->_boundInterfaceIdentifier = (NSString *)[a3 copy];
}

- (void)set_backtrace:(id)a3
{
}

- (void)set_authenticatorConfiguredViaTaskProperty:(BOOL)a3
{
  self->_authenticatorConfiguredViaTaskid Property = a3;
}

- (void)set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)a3
{
  [(NSURLSessionTask *)self set_cachedSocketStreamProperties:0];
  self->__TLSMinimumSupportedProtocolVersion = a3;
  if ([(NSURLSessionTask *)self _sslSettings]) {
    id v5 = (id)[(NSDictionary *)[(NSURLSessionTask *)self _sslSettings] mutableCopy];
  }
  else {
    id v5 = (id)[MEMORY[0x1E4F1CA60] dictionary];
  }
  id v6 = v5;
  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInt:", SSLProtocolFromVersionCodepoint()), 0x1EC0A05C0);

  [(NSURLSessionTask *)self set_sslSettings:v6];
}

- (void)set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)a3
{
  [(NSURLSessionTask *)self set_cachedSocketStreamProperties:0];
  self->__TLSMaximumSupportedProtocolVersion = a3;
  if ([(NSURLSessionTask *)self _sslSettings]) {
    id v5 = (id)[(NSDictionary *)[(NSURLSessionTask *)self _sslSettings] mutableCopy];
  }
  else {
    id v5 = (id)[MEMORY[0x1E4F1CA60] dictionary];
  }
  id v6 = v5;
  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInt:", SSLProtocolFromVersionCodepoint()), 0x1EC0A0588);

  [(NSURLSessionTask *)self set_sslSettings:v6];
}

- (void)setResumableUploadState:(id)a3
{
}

- (void)setAuthenticator:(id)a3
{
}

- (BOOL)_shouldSkipPreferredClientCertificateLookup
{
  return self->_shouldSkipPreferredClientCertificateLookup;
}

- (void)_setAppleIDContext:(id)a3
{
  id v5 = a3;

  self->_appleIDContext = (NSURLSessionAppleIDContext *)a3;
  if (a3) {
    -[NSURLSessionTask initializeHTTPAuthenticatorWithAppleIDContext:statusCodes:](self, "initializeHTTPAuthenticatorWithAppleIDContext:statusCodes:", a3, [a3 relevantHTTPStatusCodes]);
  }
  self->_authenticatorConfiguredViaTaskid Property = 1;
}

- (NSArray)_resolvedCNAMEChain
{
  return self->_resolvedCNAMEChain;
}

- (BOOL)_proxyHandshakePending
{
  return self->_proxyHandshakePending;
}

- (BOOL)_preventsSystemHTTPProxyAuthentication
{
  return self->_preventsSystemHTTPProxyAuthentication;
}

- (BOOL)_preventsIdleSystemSleep
{
  return self->_preventsIdleSystemSleep;
}

- (BOOL)_isTopLevelNavigation
{
  return self->_isTopLevelNavigation;
}

- (NSURLSessionTaskDelegate)_internalDelegate
{
  if (self && (internalDelegateWrapper = self->_internalDelegateWrapper) != 0) {
    return (NSURLSessionTaskDelegate *)objc_getProperty(internalDelegateWrapper, a2, 32, 1);
  }
  else {
    return 0;
  }
}

- (BOOL)_extractorPreparedForExtraction
{
  return self->_extractorPreparedForExtraction;
}

- (BOOL)_extractorFinishedDecoding
{
  return self->_extractorFinishedDecoding;
}

- (id)_cookieTransformCallback
{
  return self->_cookieTransformCallback;
}

- (NSURLSessionAppleIDContext)_appleIDContext
{
  return self->_appleIDContext;
}

- (BOOL)_appleIDContextRedirect
{
  return self->_appleIDContextRedirect;
}

- (BOOL)_appSSOFallback
{
  return self->_appSSOFallback;
}

- (BOOL)_allowsCellular
{
  return self->_allowsCellular;
}

- (unsigned)_TLSNegotiatedCipherSuite
{
  return self->_TLSNegotiatedCipherSuite;
}

- (void)setPriority:(float)priority
{
  if (priority >= 0.0 && priority <= 1.0)
  {
    if (self)
    {
      if (self->_priorityAPIStorage == priority) {
        return;
      }
      self->_priorityAPIStorage = priority;
    }
    else if (priority == 0.0)
    {
      return;
    }
    if ([(NSURLSessionTask *)self session])
    {
      id v6 = [(NSURLSessionTask *)self workQueue];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __32__NSURLSessionTask_setPriority___block_invoke;
      v7[3] = &unk_1E5258058;
      void v7[4] = self;
      float v8 = priority;
      dispatch_async((dispatch_queue_t)v6, v7);
    }
  }
}

- (id)_incompleteTaskMetrics
{
  uint64_t v2 = -[NSURLSessionTaskMetrics initWithMetrics:]((id *)[NSURLSessionTaskMetrics alloc], [(NSURLSessionTask *)self _metrics]);

  return v2;
}

- (void)setOriginalRequest:(id)a3
{
}

uint64_t __93__NSURLSessionTask_HTTPConnectionInfo__getUnderlyingHTTPConnectionInfoWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setDelegate:(id)delegate
{
  objc_sync_enter(self);
  if (self->_seenFirstResume) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Cannot set task delegate after resumption" userInfo:0]);
  }
  publicDelegateWrapper = self->_publicDelegateWrapper;
  if (publicDelegateWrapper) {
    objc_setProperty_atomic(publicDelegateWrapper, v5, delegate, 32);
  }

  objc_sync_exit(self);
}

- (void)set_suspensionThreshhold:(int64_t)a3
{
  self->_suspensionThreshhold = a3;
}

- (__NSCFResumableUploadState)resumableUploadState
{
  return (__NSCFResumableUploadState *)objc_getProperty(self, a2, 264, 1);
}

CFPropertyListRef __50__NSURLSessionTask_addAdditionalHeadersToRequest___block_invoke()
{
  CFPropertyListRef result = CFPreferencesCopyValue(@"HTTPAdditionalHeaders", @"com.apple.CFNetwork", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  -[NSURLSessionTask addAdditionalHeadersToRequest:]::additionalHeaders = (uint64_t)result;
  return result;
}

- (void)cancel
{
  if ([(NSURLSessionTask *)self state] <= NSURLSessionTaskStateSuspended)
  {
    [(NSURLSessionTask *)self setState:2];
    objc_sync_enter(self);
    progress = self->_progress;
    if (progress)
    {
      if (![(NSProgress *)progress isCancelled]) {
        [(NSProgress *)self->_progress cancel];
      }
    }
    objc_sync_exit(self);
    uint64_t v4 = [(NSURLSessionTask *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__NSURLSessionTask_cancel__block_invoke;
    block[3] = &unk_1E5258228;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)v4, block);
  }
}

uint64_t __44__NSURLSessionTask_set_bytesPerSecondLimit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_adjustBytesPerSecondLimit:", *(void *)(a1 + 40));
}

- (void)set_powerAssertion:(unsigned int)a3
{
  self->_powerAssertion = a3;
}

- (void)_appendCountOfPendingBytesReceivedEncoded:(int64_t)a3
{
  p_unfair_lock = &self->_unfair_lock;
  os_unfair_lock_lock(&self->_unfair_lock);
  [(NSURLSessionTask *)self set_countOfPendingBytesReceivedEncoded:[(NSURLSessionTask *)self _countOfPendingBytesReceivedEncoded] + a3];

  os_unfair_lock_unlock(p_unfair_lock);
}

- (void)set_countOfPendingBytesReceivedEncoded:(int64_t)a3
{
  self->__countOfPendingBytesReceivedEncoded = a3;
}

uint64_t __26__NSURLSessionTask_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_cancel");
}

- (void)_adoptEffectiveConfiguration:(id)a3
{
  id v4 = +[NSURLSessionConfiguration immutableEffectiveConfigurationFromConfig:a3];
  if ([(NSURLSessionTask *)self workQueue])
  {
    id v5 = [(NSURLSessionTask *)self workQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __74__NSURLSessionTask__EffectiveConfiguration___adoptEffectiveConfiguration___block_invoke;
    v6[3] = &unk_1E5257FB0;
    v6[4] = self;
    void v6[5] = v4;
    dispatch_async((dispatch_queue_t)v5, v6);
  }
  else
  {
    [(NSURLSessionTask *)self _onqueue_adoptEffectiveConfiguration:v4];
  }
}

uint64_t __50__NSURLSessionTask_setPrefersIncrementalDelivery___block_invoke(uint64_t a1, double a2)
{
  BOOL v3 = *(_DWORD **)(a1 + 32);
  if (v3) {
    LODWORD(a2) = v3[31];
  }
  else {
    a2 = 0.0;
  }
  return objc_msgSend(v3, "_onqueue_adjustPriorityHint:incremental:", *(unsigned __int8 *)(a1 + 40), a2);
}

- (void)getUnderlyingHTTPConnectionInfoWithCompletionHandler:(id)a3
{
  id v5 = [(NSURLSessionTask *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__NSURLSessionTask_HTTPConnectionInfo__getUnderlyingHTTPConnectionInfoWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5258028;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  loggableDescription = self->_loggableDescription;
  self->_loggableDescription = 0;

  self->_taskIdentifier = a3;
  id v6 = [(NSURLSessionTask *)self _metrics];
  if (v6) {
    v6->_identifier = a3;
  }
}

void __93__NSURLSessionTask_HTTPConnectionInfo__getUnderlyingHTTPConnectionInfoWithCompletionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] < 2)
  {
    objc_initWeak(&location, (id)[*(id *)(a1 + 32) session]);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __93__NSURLSessionTask_HTTPConnectionInfo__getUnderlyingHTTPConnectionInfoWithCompletionHandler___block_invoke_3;
    v4[3] = &unk_1E5258000;
    objc_copyWeak(&v5, &location);
    BOOL v3 = *(void **)(a1 + 32);
    v4[4] = *(void *)(a1 + 40);
    objc_msgSend(v3, "set_httpConnectionInfoCompletionBlock:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v2 = [*(id *)(a1 + 32) session];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __93__NSURLSessionTask_HTTPConnectionInfo__getUnderlyingHTTPConnectionInfoWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E5257FD8;
    void v7[4] = *(void *)(a1 + 40);
    -[NSURLSession runDelegateBlock:](v2, v7);
  }
}

- (void)_onqueue_adoptEffectiveConfiguration:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    int v10 = 138412290;
    id v11 = a3;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Not an actual effective configuration: %@", (uint8_t *)&v10, 0xCu);
  }
  if (![(NSURLSessionConfiguration *)self->_effectiveConfiguration isEqual:a3])
  {
    id v6 = self->_effectiveConfiguration;
    self->_effectiveConfiguration = (NSURLSessionConfiguration *)a3;
    atsStateCache = self->_atsStateCache;
    self->_atsStateCache = 0;
    if (atsStateCache) {
      CFRelease(atsStateCache);
    }
    [(NSURLSessionTask *)self set_cachedSocketStreamProperties:0];
    id v5 = [(NSURLSessionTask *)self currentRequest];
    if (v5 || (id v5 = [(NSURLSessionTask *)self originalRequest]) != 0) {
      [(NSURLSessionTask *)self updateCurrentRequest:v5];
    }
  }
  int v8 = objc_msgSend(a3, "_pidForHAR", v5);
  objc_super v9 = [(NSURLSessionTask *)self _metrics];
  if (v9) {
    v9->_pidForHAR = v8;
  }
}

- (void)set_timeoutIntervalForResource:(double)a3
{
  self->_timeoutIntervalForResource_ivar = a3;
}

- (NSDictionary)_cachedSocketStreamProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 648, 1);
}

- (void)set_effectiveConfiguration:(id)a3
{
}

- (void)set_allowsQUIC:(BOOL)a3
{
  self->_allowsQUIC = a3;
}

- (BOOL)_allowsQUIC
{
  return self->_allowsQUIC;
}

- (NSURLSessionTaskDependency)taskDependency
{
  return self->_taskDependency;
}

- (void)setDependencyTree:(id)a3
{
}

- (NSURLSessionTaskDependencyTree)dependencyTree
{
  return self->_dependencyTree;
}

- (void)set_dependencyInfo:(id)a3
{
}

- (BOOL)_connectionIsCompanionLink
{
  return self->_connectionIsCompanionLink;
}

- (BOOL)_connectionIsCellular
{
  return self->_connectionIsCellular;
}

- (void)set_darkWakePowerAssertionReleaseTime:(unint64_t)a3
{
  self->_darkWakePowerAssertionReleaseTime = a3;
}

- (unint64_t)_darkWakePowerAssertionReleaseTime
{
  return self->_darkWakePowerAssertionReleaseTime;
}

- (unint64_t)_powerAssertionReleaseTime
{
  return self->_powerAssertionReleaseTime;
}

- (void)set_darkWakePowerAssertion:(unsigned int)a3
{
  self->_darkWakePowerAssertion = a3;
}

- (void)set_requestPriority:(int64_t)a3
{
  self->_requestPriority = a3;
}

- (void)set_strictContentLength:(BOOL)a3
{
  self->_strictContentLength = a3;
}

- (void)set_prohibitAuthUI:(BOOL)a3
{
  self->_prohibitAuthUI = a3;
}

- (BOOL)_prohibitAuthUI
{
  return self->_prohibitAuthUI;
}

- (void)set_cfCookies:(OpaqueCFHTTPCookieStorage *)a3
{
}

- (void)set_cfCreds:(_CFURLCredentialStorage *)a3
{
}

- (void)set_cfCache:(_CFURLCache *)a3
{
}

- (void)set_cfHSTS:(_CFHSTSPolicy *)a3
{
}

- (void)set_appleIDContextRedirect:(BOOL)a3
{
  self->_appleIDContextRedirect = a3;
}

- (void)set_appSSOFallback:(BOOL)a3
{
  self->_appSSOFallback = a3;
}

- (void)set_preventsAppSSO:(BOOL)a3
{
  self->_preventsAppSSO = a3;
}

- (void)set_requiresSecureHTTPSProxyConnection:(BOOL)a3
{
  self->_requiresSecureHTTPSProxyConnection = a3;
}

- (void)set_preventsSystemHTTPProxyAuthentication:(BOOL)a3
{
  self->_preventsSystemHTTPProxyAuthentication = a3;
}

- (void)set_cacheOnly:(BOOL)a3
{
  self->_cacheOnly = a3;
}

- (void)set_shouldSkipPreferredClientCertificateLookup:(BOOL)a3
{
  self->_shouldSkipPreferredClientCertificateLookup = a3;
}

- (__CFN_TransactionMetrics)_backgroundTransactionMetrics
{
  return (__CFN_TransactionMetrics *)objc_getProperty(self, a2, 296, 1);
}

- (void)set_loadingPriorityValue:(double)a3
{
  self->_loadingPriorityCFDictionaryRef Value = a3;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = (void *)[a5 objectForKeyedSubscript:@"new"];
  if (a6 == &PrivateKVOCountOfBytesReceivedProgressContext)
  {
    if (self->_progressReportingFinished) {
      return;
    }
    -[NSProgress setByteCompletedCount:](self->_progress, "setByteCompletedCount:", objc_msgSend(NSNumber, "numberWithLongLong:", -[NSURLSessionTask countOfBytesReceived](self, "countOfBytesReceived")));
    if (!self->_undeterminedDownloadProgressState)
    {
      uint64_t v16 = [v11 longLongValue];
      downloadProgress = self->_downloadProgress;
      goto LABEL_31;
    }
    int64_t v12 = [(NSProgress *)self->_downloadProgress completedUnitCount];
    if (v12 >= [(NSProgress *)self->_downloadProgress totalUnitCount] - 1) {
      return;
    }
    uint64_t v13 = self->_downloadProgress;
LABEL_18:
    uint64_t v16 = [(NSProgress *)v13 completedUnitCount] + 1;
    downloadProgress = v13;
LABEL_31:
    [(NSProgress *)downloadProgress setCompletedUnitCount:v16];
    return;
  }
  if (a6 != &PrivateKVOCountOfBytesExpectedToReceiveProgressContext)
  {
    if (a6 != &PrivateKVOCountOfBytesSentProgressContext)
    {
      if (a6 == &PrivateKVOCountOfBytesExpectedToSendProgressContext)
      {
        if (!self->_progressReportingFinished)
        {
          -[NSProgress setByteTotalCount:](self->_progress, "setByteTotalCount:", objc_msgSend(NSNumber, "numberWithLongLong:", -[NSURLSessionTask countOfBytesExpectedToSend](self, "countOfBytesExpectedToSend")));
          if (v11)
          {
            if ([v11 longLongValue] <= 0)
            {
              self->_undeterminedUploadProgressState = 1;
              uploadProgress = self->_uploadProgress;
              uint64_t v18 = 100;
            }
            else
            {
              self->_undeterminedUploadProgressState = 0;
              uint64_t v18 = [v11 longLongValue];
              uploadProgress = self->_uploadProgress;
            }
            [(NSProgress *)uploadProgress setTotalUnitCount:v18];
          }
        }
      }
      else
      {
        v22.receiver = self;
        v22.super_class = (Class)NSURLSessionTask;
        [(NSURLSessionTask *)&v22 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
      }
      return;
    }
    if (self->_progressReportingFinished) {
      return;
    }
    -[NSProgress setByteCompletedCount:](self->_progress, "setByteCompletedCount:", objc_msgSend(NSNumber, "numberWithLongLong:", -[NSURLSessionTask countOfBytesSent](self, "countOfBytesSent")));
    if (!self->_undeterminedUploadProgressState)
    {
      uint64_t v16 = [v11 longLongValue];
      downloadProgress = self->_uploadProgress;
      goto LABEL_31;
    }
    int64_t v15 = [(NSProgress *)self->_uploadProgress completedUnitCount];
    if (v15 >= [(NSProgress *)self->_uploadProgress totalUnitCount] - 1) {
      return;
    }
    uint64_t v13 = self->_uploadProgress;
    goto LABEL_18;
  }
  if (!self->_progressReportingFinished)
  {
    -[NSProgress setByteTotalCount:](self->_progress, "setByteTotalCount:", objc_msgSend(NSNumber, "numberWithLongLong:", -[NSURLSessionTask countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive")));
    if (v11)
    {
      if ([v11 longLongValue] <= 0)
      {
        self->_undeterminedDownloadProgressState = 1;
        uint64_t v14 = 100;
      }
      else
      {
        self->_undeterminedDownloadProgressState = 0;
        uint64_t v14 = [v11 longLongValue];
      }
      [(NSProgress *)self->_downloadProgress setTotalUnitCount:v14];
    }
    [(NSURLSessionTask *)self _completeUploadProgress];
    uint64_t v20 = *MEMORY[0x1E4F28858];
    progress = self->_progress;
    [(NSProgress *)progress setFileOperationKind:v20];
  }
}

- (NSProgress)progress
{
  objc_sync_enter(self);
  if (!self->_progress)
  {
    self->_progress = (NSProgress *)(id)[MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
    if ([(NSURLSessionTask *)self countOfBytesExpectedToSend] <= 0)
    {
      self->_undeterminedUploadProgressState = 1;
      uint64_t v3 = 100;
    }
    else if (self->_undeterminedUploadProgressState)
    {
      uint64_t v3 = 100;
    }
    else
    {
      uint64_t v3 = -1;
    }
    self->_uploadProgress = (NSProgress *)(id)[MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v3];
    [(NSProgress *)self->_uploadProgress setCompletedUnitCount:[(NSURLSessionTask *)self countOfBytesSent]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || [(NSURLRequest *)[(NSURLSessionTask *)self originalRequest] HTTPBody]
      || [(NSURLRequest *)[(NSURLSessionTask *)self originalRequest] HTTPBodyStream]
      || [[(NSString *)[(NSURLRequest *)[(NSURLSessionTask *)self originalRequest] HTTPMethod] uppercaseString] isEqualToString:@"POST"]|| [[(NSString *)[(NSURLRequest *)[(NSURLSessionTask *)self originalRequest] HTTPMethod] uppercaseString] isEqualToString:@"PUT"])
    {
      self->_isInUpload = 1;
      uint64_t v4 = 5;
      uint64_t v5 = 95;
    }
    else
    {
      uint64_t v4 = 95;
      uint64_t v5 = 5;
    }
    [(NSProgress *)self->_progress addChild:self->_uploadProgress withPendingUnitCount:v5];
    if ([(NSURLSessionTask *)self countOfBytesExpectedToReceive] <= 0)
    {
      self->_undeterminedDownloadProgressState = 1;
      uint64_t v6 = 100;
    }
    else if (self->_undeterminedDownloadProgressState)
    {
      uint64_t v6 = 100;
    }
    else
    {
      uint64_t v6 = -1;
    }
    self->_downloadProgress = (NSProgress *)(id)[MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v6];
    [(NSProgress *)self->_downloadProgress setCompletedUnitCount:[(NSURLSessionTask *)self countOfBytesReceived]];
    if (self->_isInUpload && [(NSProgress *)self->_downloadProgress completedUnitCount] >= 1)
    {
      self->_isInUpload = 0;
      [(NSURLSessionTask *)self _completeUploadProgress];
    }
    [(NSProgress *)self->_progress addChild:self->_downloadProgress withPendingUnitCount:v4];
    [(NSProgress *)self->_progress setKind:*MEMORY[0x1E4F28898]];
    [(NSProgress *)self->_progress setFileTotalCount:&unk_1ECFD1BA8];
    if (self->_isInUpload) {
      double v7 = (void *)MEMORY[0x1E4F28880];
    }
    else {
      double v7 = (void *)MEMORY[0x1E4F28858];
    }
    [(NSProgress *)self->_progress setFileOperationKind:*v7];
    if ([(NSURLSessionTask *)self _backgroundPublishingURL]) {
      int v8 = [(NSURLSessionTask *)self _backgroundPublishingURL];
    }
    else {
      int v8 = [(NSURLSessionTask *)self _publishingURL];
    }
    objc_super v9 = v8;
    if (!v8) {
      objc_super v9 = [(NSURLRequest *)[(NSURLSessionTask *)self originalRequest] URL];
    }
    [(NSProgress *)self->_progress setFileURL:v9];
    [(NSURLSessionTask *)self addObserver:self forKeyPath:@"countOfBytesSent" options:1 context:&PrivateKVOCountOfBytesSentProgressContext];
    [(NSURLSessionTask *)self addObserver:self forKeyPath:@"countOfBytesExpectedToSend" options:1 context:&PrivateKVOCountOfBytesExpectedToSendProgressContext];
    [(NSURLSessionTask *)self addObserver:self forKeyPath:@"countOfBytesReceived" options:1 context:&PrivateKVOCountOfBytesReceivedProgressContext];
    [(NSURLSessionTask *)self addObserver:self forKeyPath:@"countOfBytesExpectedToReceive" options:1 context:&PrivateKVOCountOfBytesExpectedToReceiveProgressContext];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __28__NSURLSessionTask_progress__block_invoke;
    v13[3] = &unk_1E5258228;
    v13[4] = self;
    [(NSProgress *)self->_progress setCancellationHandler:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __28__NSURLSessionTask_progress__block_invoke_2;
    v12[3] = &unk_1E5258228;
    v12[4] = self;
    [(NSProgress *)self->_progress setPausingHandler:v12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __28__NSURLSessionTask_progress__block_invoke_3;
    v11[3] = &unk_1E5258228;
    v11[4] = self;
    [(NSProgress *)self->_progress setResumingHandler:v11];
    if ([(NSURLSessionTask *)self _backgroundPublishingURL]) {
      [(NSProgress *)self->_progress publish];
    }
  }
  objc_sync_exit(self);
  return self->_progress;
}

uint64_t __28__NSURLSessionTask_progress__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

uint64_t __28__NSURLSessionTask_progress__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) suspend];
}

uint64_t __28__NSURLSessionTask_progress__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) resume];
}

- (void)setTaskDependency:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [(NSURLSessionTask *)self set_dependencyInfo:v5];
  id v6 = a3;

  self->_taskDependency = (NSURLSessionTaskDependency *)a3;
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](self, "taskIdentifier")), @"TaskIdentifier");
  taskDependency = self->_taskDependency;
  if (taskDependency)
  {
    if ([(NSURLSessionTaskDependency *)taskDependency parentTask]) {
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](-[NSURLSessionTaskDependency parentTask](self->_taskDependency, "parentTask"), "taskIdentifier")), @"ParentTaskIdentifier");
    }
    if ([(NSURLSessionTaskDependency *)self->_taskDependency mainDocumentTask]) {
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](-[NSURLSessionTaskDependency mainDocumentTask](self->_taskDependency, "mainDocumentTask"), "taskIdentifier")), @"MainDocumentTaskIdentifier");
    }
    if ([[(NSURLSessionTaskDependency *)self->_taskDependency mainDocumentTask] dependencyTree])
    {
      objc_msgSend(v5, "setObject:forKey:", -[NSURLSessionTask dependencyTree](-[NSURLSessionTaskDependency mainDocumentTask](self->_taskDependency, "mainDocumentTask"), "dependencyTree"), @"DependencyTree");
    }
    if ([(NSURLSessionTaskDependency *)self->_taskDependency taskDependencyDescription]) {
      objc_msgSend(v5, "setObject:forKey:", -[NSURLSessionTaskDependency taskDependencyDescription](self->_taskDependency, "taskDependencyDescription"), @"DependencyDescription");
    }
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v5];
    [(NSURLSessionTask *)self set_dependencyInfo:v8];
  }
}

- (void)_getAuthenticationHeadersForResponse:(_CFURLResponse *)a3 completionHandler:(id)a4
{
  if ([(NSURLSessionTask *)self authenticator])
  {
    if (a3) {
      a3 = +[NSURLResponse _responseWithCFURLResponse:a3];
    }
    double v7 = [(NSURLSessionTask *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__NSURLSessionTask__getAuthenticationHeadersForResponse_completionHandler___block_invoke;
    block[3] = &unk_1E52581A0;
    void block[4] = self;
    void block[5] = a3;
    block[6] = a4;
    dispatch_async((dispatch_queue_t)v7, block);
  }
  else
  {
    uint64_t v8 = (void (*)(id, uint64_t, void, void))*((void *)a4 + 2);
    v8(a4, 1, 0, 0);
  }
}

uint64_t __75__NSURLSessionTask__getAuthenticationHeadersForResponse_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) authenticator];
  uint64_t v3 = [*(id *)(a1 + 32) session];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__NSURLSessionTask__getAuthenticationHeadersForResponse_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5258178;
  void v7[4] = *(void *)(a1 + 48);
  return [v2 getAuthenticationHeadersForTask:v3 task:v4 response:v5 completionHandler:v7];
}

uint64_t __75__NSURLSessionTask__getAuthenticationHeadersForResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)initializeHTTPAuthenticatorWithAppleIDContext:(id)a3 statusCodes:(id)a4
{
  uint64_t v5 = +[NSURLSessionTaskHTTPAuthenticator sessionTaskHTTPAuthenticatorWithContext:a3 statusCodes:a4];

  [(NSURLSessionTask *)self setAuthenticator:v5];
}

uint64_t __57__NSURLSessionTask__onSessionQueue_cleanupAndBreakCycles__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  uint64_t v2 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_184085000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ RELEASING power assertion.", (uint8_t *)&v5, 0xCu);
  }
  return IOPMAssertionRelease(*(_DWORD *)(a1 + 40));
}

uint64_t __57__NSURLSessionTask__onSessionQueue_cleanupAndBreakCycles__block_invoke_107(uint64_t a1)
{
  return IOPMAssertionRelease(*(_DWORD *)(a1 + 32));
}

- (void)_setExplicitStorageSession:(__CFURLStorageSession *)a3
{
  if (a3)
  {
    if (StorageSession::Class(void)::sOnce_StorageSession != -1) {
      dispatch_once(&StorageSession::Class(void)::sOnce_StorageSession, &__block_literal_global_19595);
    }
    CFTypeRef v5 = StorageSession::copyHSTSStorage((os_unfair_lock_s *)a3 + 4);
    CFTypeRef v6 = _CFURLStorageSessionCopyCookieStorage((uint64_t)v5, (os_unfair_lock_s *)a3);
    CFTypeRef v7 = _CFURLStorageSessionCopyCache((uint64_t)v6, (os_unfair_lock_s *)a3);
    CFTypeRef v8 = _CFURLStorageSessionCopyCredentialStorage((uint64_t)v7, (uint64_t)a3);
    [(NSURLSessionTask *)self set_cfHSTS:v5];
    [(NSURLSessionTask *)self set_cfCookies:v6];
    [(NSURLSessionTask *)self set_cfCache:v7];
    [(NSURLSessionTask *)self set_cfCreds:v8];
    if (v5) {
      CFRelease(v5);
    }
    if (v6) {
      CFRelease(v6);
    }
    if (v7) {
      CFRelease(v7);
    }
    if (v8)
    {
      CFRelease(v8);
    }
  }
  else
  {
    -[NSURLSessionTask set_cfCache:](self, "set_cfCache:");
    [(NSURLSessionTask *)self set_cfCreds:0];
    [(NSURLSessionTask *)self set_cfCookies:0];
    [(NSURLSessionTask *)self set_cfHSTS:0];
  }
}

- (void)_setSocketProperties:(__CFDictionary *)a3 connectionProperties:(__CFDictionary *)a4
{
  [(NSURLSessionTask *)self set_legacySocketStreamProperties:a3];
  if (a4)
  {
    CFDictionaryRef Value = (void *)CFDictionaryGetValue(a4, @"kCFURLConnectionSuspensionThreshold");
    if (Value) {
      -[NSURLSessionTask set_suspensionThreshhold:](self, "set_suspensionThreshhold:", [Value longLongValue]);
    }
    CFTypeRef v7 = CFDictionaryGetValue(a4, @"kCFURLConnectionProhibitAuthChallengeUI");
    CFTypeRef v8 = (const void *)*MEMORY[0x1E4F1CFD0];
    if (v7) {
      BOOL v9 = v7 == v8;
    }
    else {
      BOOL v9 = 0;
    }
    uint64_t v10 = v9;
    [(NSURLSessionTask *)self set_prohibitAuthUI:v10];
    id v11 = CFDictionaryGetValue(a4, &unk_1EC0A3FF0);
    if (v11)
    {
      [(NSURLSessionTask *)self set_strictContentLength:v11 == v8];
    }
  }
}

void __66__NSURLSessionTask__releasePreventIdleSleepAssertionIfAppropriate__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id Weak = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    uint64_t v2 = Weak;
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if ([v2 _powerAssertion]
      && (__uint64_t v3 = [v2 _powerAssertionReleaseTime], v3 <= clock_gettime_nsec_np(_CLOCK_UPTIME_RAW)))
    {
      IOPMAssertionID v4 = [v2 _powerAssertion];
      objc_msgSend(v2, "set_powerAssertion:", 0);
      os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
      if (v4)
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        CFTypeRef v5 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
        {
          int v6 = 138543362;
          uint64_t v7 = [v2 _loggableDescription];
          _os_log_impl(&dword_184085000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ RELEASING power assertion.", (uint8_t *)&v6, 0xCu);
        }
        IOPMAssertionRelease(v4);
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
    }
  }
}

void __66__NSURLSessionTask__releasePreventIdleSleepAssertionIfAppropriate__block_invoke_106(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    uint64_t v2 = Weak;
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerAssertionSetLock);
    if ([v2 _darkWakePowerAssertion]
      && (__uint64_t v3 = [v2 _darkWakePowerAssertionReleaseTime], v3 <= clock_gettime_nsec_np(_CLOCK_UPTIME_RAW)))
    {
      IOPMAssertionID v4 = [v2 _darkWakePowerAssertion];
      objc_msgSend(v2, "set_darkWakePowerAssertion:", 0);
      os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
      if (v4)
      {
        IOPMAssertionRelease(v4);
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&sPowerAssertionSetLock);
    }
  }
}

- (BOOL)_keepDownloadTaskFile
{
  return 0;
}

- (void)set_disallowCellular:(BOOL)a3
{
  self->_disallowCellular = a3;
}

- (void)set_timeWindowDuration:(double)a3
{
  self->_timeWindowDuration = a3;
}

- (void)set_timeWindowDelay:(double)a3
{
  self->_timeWindowDelay = a3;
}

- (void)set_loadingPriority:(double)a3
{
  if (a3 >= 0.0 && a3 <= 1.0)
  {
    void block[7] = v3;
    block[8] = v4;
    -[NSURLSessionTask set_loadingPriorityValue:](self, "set_loadingPriorityValue:");
    if ([(NSURLSessionTask *)self session])
    {
      uint64_t v7 = [(NSURLSessionTask *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__NSURLSessionTask_set_loadingPriority___block_invoke;
      block[3] = &unk_1E5258228;
      void block[4] = self;
      dispatch_async((dispatch_queue_t)v7, block);
    }
  }
}

uint64_t __40__NSURLSessionTask_set_loadingPriority___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_adjustLoadingPoolPriority");
}

uint64_t __47__NSURLSessionTask_set_expectedProgressTarget___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_expectedProgressTargetChanged");
}

- (id)delegate
{
  objc_sync_enter(self);
  if (self)
  {
    publicDelegateWrapper = self->_publicDelegateWrapper;
    if (publicDelegateWrapper) {
      publicDelegateWrapper = objc_getProperty(publicDelegateWrapper, v3, 32, 1);
    }
  }
  else
  {
    publicDelegateWrapper = 0;
  }
  id v5 = publicDelegateWrapper;
  objc_sync_exit(self);
  return v5;
}

- (void)suspend
{
  if ([(NSURLSessionTask *)self state] <= NSURLSessionTaskStateSuspended
    && [(NSURLSessionTask *)self workQueue])
  {
    [(NSURLSessionTask *)self setState:1];
    objc_sync_enter(self);
    progress = self->_progress;
    if (progress
      && ![(NSProgress *)progress isCancelled]
      && ![(NSProgress *)self->_progress isPaused])
    {
      [(NSProgress *)self->_progress pause];
    }
    objc_sync_exit(self);
    uint64_t v4 = [(NSURLSessionTask *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__NSURLSessionTask_suspend__block_invoke;
    block[3] = &unk_1E5258228;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)v4, block);
  }
}

uint64_t __27__NSURLSessionTask_suspend__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _metrics];
  uint64_t v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_onqueue_suspend");
}

- (BOOL)_seenFirstResume
{
  return self->_seenFirstResume;
}

- (BOOL)_needSendingMetrics
{
  return 0;
}

- (NSURLSessionTask)init
{
  uint64_t v3 = [(id)+[NSURLSession _sharedSessionForConnection]() defaultTaskGroup];

  return [(NSURLSessionTask *)self initWithTaskGroup:v3];
}

uint64_t __93__NSURLSessionTask_HTTPConnectionInfo__getUnderlyingHTTPConnectionInfoWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end