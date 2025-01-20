@interface CONNECTION_SessionTask
- (BOOL)_allowsQUIC;
- (BOOL)_appSSOFallback;
- (BOOL)_appleIDContextRedirect;
- (BOOL)_cacheOnly;
- (BOOL)_connectionIsCompanionLink;
- (BOOL)_isAVAssetTask;
- (BOOL)_isTopLevelNavigation;
- (BOOL)_preconnect;
- (BOOL)_preventsAppSSO;
- (BOOL)_preventsSystemHTTPProxyAuthentication;
- (BOOL)_requiresSecureHTTPSProxyConnection;
- (BOOL)_shouldSkipPreferredClientCertificateLookup;
- (BOOL)hasExtractor;
- (BOOL)prefersIncrementalDelivery;
- (BOOL)shouldHandleCookiesAndSchemeIsAppropriate;
- (CONNECTION_SessionTask)initWithRequest:(_CFURLRequest *)a3 mutableCurrent:(_CFURLRequest *)a4 connProps:(__CFDictionary *)a5 sockProps:(__CFDictionary *)a6 session:(id)a7;
- (_CFHSTSPolicy)_copyHSTSPolicy;
- (__CFDictionary)_copyATSState;
- (__CFDictionary)_copySocketStreamProperties;
- (__CFDictionary)_dependencyInfo;
- (__CFDictionary)_proxySettings;
- (__CFDictionary)_sslSettings;
- (__CFN_TaskMetrics)_metrics;
- (__CFSet)_getAuthenticatorStatusCodes;
- (__CFURL)currentRequest_URL;
- (__CFURL)currentRequest_mainDocumentURL;
- (const)_DuetActivityProperties;
- (const)_TCPConnectionMetadata;
- (const)_createXCookieStorage;
- (const)_createXCredentialStorage;
- (double)_timeoutInterval;
- (double)startTime;
- (float)priority;
- (id)_APSRelayTopic;
- (id)_allowsCellular;
- (id)_allowsCellularOverride;
- (id)_allowsConstrainedOverride;
- (id)_allowsExpensiveOverride;
- (id)_allowsPersistentDNS;
- (id)_allowsUCAOverride;
- (id)_assumesHTTP3Capable;
- (id)_attribution;
- (id)_backgroundTransactionMetrics;
- (id)_backtrace;
- (id)_blockTrackers;
- (id)_boundInterfaceIdentifier;
- (id)_cfCache;
- (id)_cfCookies;
- (id)_cfCreds;
- (id)_cfHSTS;
- (id)_connectionPropertyDuet;
- (id)_cookieTransformCallback;
- (id)_countOfBytesReceivedEncoded;
- (id)_countOfPendingBytesReceivedEncoded;
- (id)_disallowCellular;
- (id)_effectiveConfiguration;
- (id)_failInsecureLoadWithHTTPSDNSRecord;
- (id)_hostOverride;
- (id)_httpConnectionInfoCompletionBlock;
- (id)_incompleteCurrentTaskTransactionMetrics;
- (id)_incompleteTaskMetrics;
- (id)_isKnownTracker;
- (id)_isWebSearchContent;
- (id)_loggableDescription;
- (id)_networkServiceType;
- (id)_priorityValue;
- (id)_privacyProxyFailClosed;
- (id)_privacyProxyFailClosedForUnreachableHosts;
- (id)_privacyProxyFailClosedForUnreachableNonMainHosts;
- (id)_private_nw_activity;
- (id)_prohibitAuthUI;
- (id)_prohibitPrivacyProxy;
- (id)_protocolForTask;
- (id)_resolvedCNAMEChain;
- (id)_shouldHandleCookies;
- (id)_siteForCookies;
- (id)_storagePartitionIdentifier;
- (id)_timeWindowDelay;
- (id)_timeWindowDuration;
- (id)_trackerContext;
- (id)_trailers;
- (id)_uniqueIdentifier;
- (id)_useEnhancedPrivacyMode;
- (id)countOfBytesExpectedToReceive;
- (id)countOfBytesExpectedToSend;
- (id)countOfBytesReceived;
- (id)countOfBytesSent;
- (id)currentRequest;
- (id)error;
- (id)originalRequest;
- (id)resumableUploadState;
- (id)session;
- (id)state;
- (id)taskIdentifier;
- (id)workQueue;
- (int)_cookieAcceptPolicy;
- (int)_requiresDNSSECValidation;
- (int64_t)_bytesPerSecondLimit;
- (int64_t)_discretionaryOverrride;
- (int64_t)_requestPriority;
- (int64_t)_suspensionThreshhold;
- (unint64_t)_allowedProtocolTypes;
- (unint64_t)_cachePolicy;
- (unint64_t)_expectedProgressTarget;
- (unsigned)_TLSMaximumSupportedProtocolVersion;
- (unsigned)_TLSMinimumSupportedProtocolVersion;
- (unsigned)_TLSNegotiatedCipherSuite;
- (unsigned)_preventsIdleSystemSleep;
- (unsigned)_proxyHandshakePending;
- (unsigned)_shouldPipelineHTTP;
- (unsigned)_shouldSkipPipelineProbe;
- (unsigned)_shouldUsePipelineHeuristics;
- (unsigned)_strictContentLength;
- (void)_adoptEffectiveConfiguration:(id)a3;
- (void)_getAuthenticationHeadersForResponse:(_CFURLResponse *)a3 completionHandler:(id)a4;
- (void)_processConnectionProperties;
- (void)_setConnectionIsCellular:(BOOL)a3;
- (void)_withXURLCache:(id)a3;
- (void)dealloc;
- (void)set_appSSOFallback:(BOOL)a3;
- (void)set_metrics:(id)a3;
- (void)set_preventsAppSSO:(BOOL)a3;
- (void)set_protocolForTask:(id)a3;
- (void)updateCurrentRequest:(id)a3;
@end

@implementation CONNECTION_SessionTask

- (void)set_metrics:(id)a3
{
}

- (__CFN_TaskMetrics)_metrics
{
  return self->_metrics;
}

- (id)resumableUploadState
{
  return 0;
}

- (int)_requiresDNSSECValidation
{
  return 0;
}

- (id)_cookieTransformCallback
{
  return 0;
}

- (id)_resolvedCNAMEChain
{
  return 0;
}

- (BOOL)_connectionIsCompanionLink
{
  return 0;
}

- (id)_httpConnectionInfoCompletionBlock
{
  return 0;
}

- (unint64_t)_expectedProgressTarget
{
  return 0;
}

- (id)_uniqueIdentifier
{
  v2 = (void *)[(NSUUID *)self->_uniqueIdentifier copy];

  return v2;
}

- (BOOL)_isTopLevelNavigation
{
  CFURLRef v2 = _CFURLRequestCopyProtocolPropertyForKey(self->_originalRequest, @"_kCFHTTPCookiePolicyPropertyIsTopLevelNavigation");

  return [(__CFURL *)v2 BOOLValue];
}

- (id)_siteForCookies
{
  CFURLRef v2 = _CFURLRequestCopyProtocolPropertyForKey(self->_currentRequest, @"_kCFHTTPCookiePolicyPropertySiteForCookies");

  return v2;
}

- (id)_hostOverride
{
  return 0;
}

- (id)_APSRelayTopic
{
  return 0;
}

- (id)_incompleteCurrentTaskTransactionMetrics
{
  return 0;
}

- (id)_incompleteTaskMetrics
{
  return 0;
}

- (BOOL)_preconnect
{
  return 0;
}

- (int64_t)_discretionaryOverrride
{
  return 0;
}

- (BOOL)_allowsQUIC
{
  return 0;
}

- (unsigned)_TLSMaximumSupportedProtocolVersion
{
  return 0;
}

- (unsigned)_TLSMinimumSupportedProtocolVersion
{
  return 0;
}

- (id)_storagePartitionIdentifier
{
  v3 = objc_msgSend((id)-[objc_class propertyForKey:inRequest:](self->_my_protocolForTask, "propertyForKey:inRequest:", @"__STORAGE_PARTITION_IDENTIFIER", -[CONNECTION_SessionTask originalRequest](self, "originalRequest")), "copy");
  if (!v3)
  {
    v3 = _CFURLRequestCopyProtocolPropertyForKey(self->_originalRequest, @"__STORAGE_PARTITION_IDENTIFIER");
    if (v3) {
      v3 = (void *)CFMakeCollectable(v3);
    }
  }

  return v3;
}

- (id)_trailers
{
  return 0;
}

- (unsigned)_TLSNegotiatedCipherSuite
{
  return 0;
}

- (const)_TCPConnectionMetadata
{
  return 0;
}

- (const)_DuetActivityProperties
{
  return 0;
}

- (__CFDictionary)_dependencyInfo
{
  return 0;
}

- (__CFDictionary)_copyATSState
{
  result = self->_atsStateCache;
  if (result) {
    return (__CFDictionary *)CFRetain(result);
  }
  return result;
}

- (__CFSet)_getAuthenticatorStatusCodes
{
  return 0;
}

- (void)_getAuthenticationHeadersForResponse:(_CFURLResponse *)a3 completionHandler:(id)a4
{
}

- (BOOL)_appleIDContextRedirect
{
  return 0;
}

- (void)set_appSSOFallback:(BOOL)a3
{
  self->_appSSOFallback = a3;
}

- (BOOL)_appSSOFallback
{
  return self->_appSSOFallback;
}

- (void)set_preventsAppSSO:(BOOL)a3
{
  self->_preventsAppSSO = a3;
}

- (BOOL)_preventsAppSSO
{
  return self->_preventsAppSSO;
}

- (BOOL)_requiresSecureHTTPSProxyConnection
{
  return 0;
}

- (BOOL)_preventsSystemHTTPProxyAuthentication
{
  return 0;
}

- (BOOL)_cacheOnly
{
  return 0;
}

- (BOOL)_shouldSkipPreferredClientCertificateLookup
{
  return self->__shouldSkipPreferredClientCertificateLookup;
}

- (id)_protocolForTask
{
  return self->_my_protocolForTask;
}

- (void)set_protocolForTask:(id)a3
{
  self->_my_protocolForTask = (Class)a3;
}

- (void)_setConnectionIsCellular:(BOOL)a3
{
  self->_is_cellular = a3;
}

- (BOOL)prefersIncrementalDelivery
{
  return 1;
}

- (float)priority
{
  return 0.5;
}

- (double)_timeoutInterval
{
  return *(double *)([(_CFURLRequest *)self->_currentRequest _inner] + 24);
}

- (int64_t)_bytesPerSecondLimit
{
  return 0;
}

- (int64_t)_suspensionThreshhold
{
  connectionProperties = self->_connectionProperties;
  if (!connectionProperties) {
    return 0x200000;
  }
  Value = (void *)CFDictionaryGetValue(connectionProperties, @"kCFURLConnectionSuspensionThreshold");
  if (!Value) {
    return 0x200000;
  }

  return [Value longLongValue];
}

- (unsigned)_strictContentLength
{
  CFDictionaryRef connectionProperties = self->_connectionProperties;
  if (connectionProperties) {
    CFDictionaryRef connectionProperties = (const __CFDictionary *)CFDictionaryGetValue(connectionProperties, &unk_1EC0A3FF0);
  }
  return !connectionProperties || connectionProperties == (const __CFDictionary *)*MEMORY[0x1E4F1CFD0];
}

- (__CFDictionary)_sslSettings
{
  return *(__CFDictionary **)([(_CFURLRequest *)self->_currentRequest _inner] + 72);
}

- (unsigned)_shouldUsePipelineHeuristics
{
  uint64_t v2 = *(void *)([(_CFURLRequest *)self->_currentRequest _inner] + 56);
  return v2 && *(unsigned char *)(v2 + 217) != 0;
}

- (unsigned)_shouldSkipPipelineProbe
{
  uint64_t v2 = *(void *)([(_CFURLRequest *)self->_currentRequest _inner] + 56);
  return v2 && *(unsigned char *)(v2 + 219) != 0;
}

- (unsigned)_shouldPipelineHTTP
{
  uint64_t v2 = *(void *)([(_CFURLRequest *)self->_currentRequest _inner] + 56);
  if (!v2 || !*(unsigned char *)(v2 + 216)) {
    return 0;
  }
  CFStringRef v3 = *(const __CFString **)(v2 + 152);
  unsigned __int8 result = v3
        && (CFEqual(v3, (CFStringRef)&gConstantCFStringValueTable[2604])
         || ((CFStringRef v4 = *(const __CFString **)(v2 + 152)) != 0
          || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)
          && (*(_WORD *)v6 = 0,
              _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "these should always be initialized now", v6, 2u), (CFStringRef v4 = *(const __CFString **)(v2 + 152)) != 0))&& CFEqual(v4, (CFStringRef)&gConstantCFStringValueTable[2611]))|| *(unsigned char *)(v2 + 218) != 0;
  return result;
}

- (int64_t)_requestPriority
{
  return *(void *)([(_CFURLRequest *)self->_currentRequest _inner] + 88);
}

- (unsigned)_proxyHandshakePending
{
  return 0;
}

- (__CFDictionary)_proxySettings
{
  return *(__CFDictionary **)([(_CFURLRequest *)self->_currentRequest _inner] + 48);
}

- (unsigned)_preventsIdleSystemSleep
{
  return (*(unsigned __int8 *)([(_CFURLRequest *)self->_currentRequest _inner] + 64) >> 4) & 1;
}

- (unint64_t)_cachePolicy
{
  return *(void *)([(_CFURLRequest *)self->_currentRequest _inner] + 16);
}

- (unint64_t)_allowedProtocolTypes
{
  return *(void *)([(_CFURLRequest *)self->_currentRequest _inner] + 96);
}

- (id)_isWebSearchContent
{
  return 0;
}

- (id)_failInsecureLoadWithHTTPSDNSRecord
{
  return 0;
}

- (id)_blockTrackers
{
  return 0;
}

- (id)_useEnhancedPrivacyMode
{
  return 0;
}

- (id)_prohibitPrivacyProxy
{
  return 0;
}

- (id)_privacyProxyFailClosedForUnreachableHosts
{
  return 0;
}

- (id)_privacyProxyFailClosedForUnreachableNonMainHosts
{
  return 0;
}

- (id)_privacyProxyFailClosed
{
  return 0;
}

- (id)_trackerContext
{
  return 0;
}

- (id)_isKnownTracker
{
  return 0;
}

- (id)_attribution
{
  return 0;
}

- (id)_timeWindowDuration
{
  return 0;
}

- (id)_timeWindowDelay
{
  return 0;
}

- (id)_allowsPersistentDNS
{
  return 0;
}

- (id)_assumesHTTP3Capable
{
  return 0;
}

- (id)_allowsCellularOverride
{
  return 0;
}

- (id)_allowsUCAOverride
{
  return 0;
}

- (id)_allowsConstrainedOverride
{
  return 0;
}

- (id)_allowsExpensiveOverride
{
  return 0;
}

- (id)_disallowCellular
{
  return 0;
}

- (id)_boundInterfaceIdentifier
{
  return 0;
}

- (id)_prohibitAuthUI
{
  return 0;
}

- (id)_networkServiceType
{
  return 0;
}

- (id)_allowsCellular
{
  return 0;
}

- (id)_shouldHandleCookies
{
  return 0;
}

- (id)_cfCookies
{
  return 0;
}

- (id)_cfCreds
{
  return 0;
}

- (id)_cfCache
{
  return 0;
}

- (id)_cfHSTS
{
  return 0;
}

- (id)_backgroundTransactionMetrics
{
  return 0;
}

- (int)_cookieAcceptPolicy
{
  uint64_t v2 = [(CONNECTION_SessionTask *)self _createXCookieStorage];
  if (!v2) {
    return 3;
  }
  CFStringRef v3 = v2;
  int v4 = (*((uint64_t (**)(const XCookieStorage *))v2->var0 + 12))(v2);
  (*((void (**)(const XCookieStorage *))v3->var0 + 6))(v3);
  return v4;
}

- (BOOL)hasExtractor
{
  return 0;
}

- (id)_connectionPropertyDuet
{
  return 0;
}

- (double)startTime
{
  return self->_startTime;
}

- (id)_priorityValue
{
  return 0;
}

- (id)error
{
  return 0;
}

- (id)state
{
  return 0;
}

- (id)countOfBytesExpectedToReceive
{
  return 0;
}

- (id)countOfBytesExpectedToSend
{
  return 0;
}

- (id)countOfBytesSent
{
  return 0;
}

- (id)_countOfBytesReceivedEncoded
{
  return 0;
}

- (id)_countOfPendingBytesReceivedEncoded
{
  return 0;
}

- (id)countOfBytesReceived
{
  return 0;
}

- (id)taskIdentifier
{
  return 0;
}

- (__CFURL)currentRequest_mainDocumentURL
{
  return *(__CFURL **)([(_CFURLRequest *)self->_currentRequest _inner] + 32);
}

- (__CFURL)currentRequest_URL
{
  return *(__CFURL **)([(_CFURLRequest *)self->_currentRequest _inner] + 8);
}

- (id)originalRequest
{
  id result = self->_nsOriginalRequest;
  if (!result)
  {
    id result = [[NSURLRequest alloc] _initWithCFURLRequest:self->_originalRequest];
    self->_nsOriginalRequest = (NSURLRequest *)result;
  }
  return result;
}

- (id)currentRequest
{
  id result = self->_nsCurrentRequest;
  if (!result)
  {
    id result = [(NSURLRequest *)[NSMutableURLRequest alloc] _initWithCFURLRequest:self->_currentRequest];
    self->_nsCurrentRequest = (NSMutableURLRequest *)result;
  }
  return result;
}

- (id)workQueue
{
  session_ivar = self->_session_ivar;
  if (session_ivar) {
    return session_ivar->_workQueue;
  }
  else {
    return 0;
  }
}

- (id)session
{
  return self->_session_ivar;
}

- (BOOL)shouldHandleCookiesAndSchemeIsAppropriate
{
  return (*(_WORD *)([(_CFURLRequest *)self->_currentRequest _inner] + 64) & 1) != 0
      && URLCanUseCookies(*(const __CFURL **)([(_CFURLRequest *)self->_currentRequest _inner] + 8));
}

- (const)_createXCredentialStorage
{
  CFStringRef v3 = *(const void **)([(_CFURLRequest *)self->_currentRequest _inner] + 232);
  if (!v3) {
    goto LABEL_7;
  }
  int v4 = (char *)CFRetain(v3);
  if (!v4) {
    goto LABEL_7;
  }
  v5 = v4;
  if (StorageSession::Class(void)::sOnce_StorageSession != -1) {
    dispatch_once(&StorageSession::Class(void)::sOnce_StorageSession, &__block_literal_global_19595);
  }
  v6 = (XCredentialStorage *)StorageSession::copyCredStorage((StorageSession *)(v5 + 16));
  CFRelease(v5);
  if (v6)
  {
    CFXCredentialStorage = XCredentialStorage::createCFXCredentialStorage(v6, v7);
    CFRelease(v6);
    return (const XCredentialStorage *)CFXCredentialStorage;
  }
  else
  {
LABEL_7:
    session_ivar = self->_session_ivar;
    return (const XCredentialStorage *)-[__NSURLSessionLocal _createXCredentialStorage]((uint64_t)session_ivar);
  }
}

- (const)_createXCookieStorage
{
  uint64_t v3 = *(void *)([(_CFURLRequest *)self->_currentRequest _inner] + 56);
  if (v3)
  {
    int v4 = *(OpaqueCFHTTPCookieStorage **)(v3 + 192);
    if (v4)
    {
      CFRetain(*(CFTypeRef *)(v3 + 192));
LABEL_9:
      v8 = (XCookieStorage *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 40, 0);
      *(_OWORD *)&v8->var0 = 0u;
      *(_OWORD *)&v8->var2 = 0u;
      v8[1].var1 = 0;
      CFXCookieStorage::CFXCookieStorage((CFXCookieStorage *)v8, v4);
      CFRelease(v4);
      return v8;
    }
  }
  v5 = *(const void **)([(_CFURLRequest *)self->_currentRequest _inner] + 232);
  if (v5)
  {
    v6 = (os_unfair_lock_s *)CFRetain(v5);
    if (v6)
    {
      v7 = v6;
      if (StorageSession::Class(void)::sOnce_StorageSession != -1) {
        dispatch_once(&StorageSession::Class(void)::sOnce_StorageSession, &__block_literal_global_19595);
      }
      int v4 = (OpaqueCFHTTPCookieStorage *)StorageSession::copyCookieStorage(v7 + 4);
      CFRelease(v7);
      if (v4) {
        goto LABEL_9;
      }
    }
  }
  session_ivar = self->_session_ivar;

  return (const XCookieStorage *)-[__NSURLSessionLocal _createXCookieStorage]((uint64_t)session_ivar);
}

- (void)_withXURLCache:(id)a3
{
  int v4 = *(const void **)([(_CFURLRequest *)self->_currentRequest _inner] + 232);
  if (v4)
  {
    v5 = (os_unfair_lock_s *)CFRetain(v4);
    if (v5)
    {
      v6 = v5;
      if (StorageSession::Class(void)::sOnce_StorageSession != -1) {
        dispatch_once(&StorageSession::Class(void)::sOnce_StorageSession, &__block_literal_global_19595);
      }
      v7 = (XURLCache *)StorageSession::copyCacheStorage(v6 + 4);
      CFRelease(v6);
      if (v7) {
        XURLCache::createCFXURLCache(v7, (const _CFURLCache *)self->_session_ivar, v8);
      }
    }
  }
  session_ivar = self->_session_ivar;

  -[__NSURLSessionLocal _withXURLCache:]((id *)&session_ivar->super.isa);
}

- (_CFHSTSPolicy)_copyHSTSPolicy
{
  uint64_t v3 = *(const void **)([(_CFURLRequest *)self->_currentRequest _inner] + 232);
  if (v3)
  {
    int v4 = (os_unfair_lock_s *)CFRetain(v3);
    if (v4)
    {
      v5 = v4;
      if (StorageSession::Class(void)::sOnce_StorageSession != -1) {
        dispatch_once(&StorageSession::Class(void)::sOnce_StorageSession, &__block_literal_global_19595);
      }
      v6 = (_CFHSTSPolicy *)StorageSession::copyHSTSStorage(v5 + 4);
      CFRelease(v5);
      if (v6) {
        return v6;
      }
    }
  }
  session_ivar = self->_session_ivar;
  if (!session_ivar) {
    return 0;
  }
  local_immutable_configuration_ivar = session_ivar->_local_immutable_configuration_ivar;

  return [(NSURLSessionConfiguration *)local_immutable_configuration_ivar copyHSTSPolicy];
}

- (void)_processConnectionProperties
{
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(self->_connectionProperties, &unk_1EC0A3928);
  if (Value && CFBooleanGetValue(Value)) {
    self->__shouldSkipPreferredClientCertificateLookup = 1;
  }
  CFNumberRef v4 = (const __CFNumber *)CFDictionaryGetValue(self->_connectionProperties, &unk_1EC0A3998);
  if (v4)
  {
    uint64_t valuePtr = 0;
    CFNumberGetValue(v4, kCFNumberSInt64Type, &valuePtr);
    metrics = self->_metrics;
    if (metrics) {
      metrics->_options |= valuePtr;
    }
  }
  atsStateCache = self->_atsStateCache;
  self->_atsStateCache = 0;
  if (atsStateCache) {
    CFRelease(atsStateCache);
  }
  CFDataRef v7 = (const __CFData *)CFDictionaryGetValue(self->_connectionProperties, &unk_1EC0A3848);
  self->_atsStateCache = createDictionaryFromData(v7);
}

- (id)_backtrace
{
  return 0;
}

- (id)_loggableDescription
{
  return (id)[NSString stringWithFormat:@"Task <%@>.<0>", self->_uniqueIdentifier];
}

- (__CFDictionary)_copySocketStreamProperties
{
  id result = self->_socketProperties;
  if (result) {
    return (__CFDictionary *)CFRetain(result);
  }
  return result;
}

- (void)updateCurrentRequest:(id)a3
{
  currentRequest = self->_currentRequest;
  if (currentRequest) {
    CFRelease(currentRequest);
  }
  if (a3) {
    v6 = (_CFURLRequest *)CFRetain(a3);
  }
  else {
    v6 = 0;
  }
  self->_currentRequest = v6;

  self->_nsCurrentRequest = 0;
}

- (void)_adoptEffectiveConfiguration:(id)a3
{
  effectiveConfiguration = self->_effectiveConfiguration;
  if (effectiveConfiguration != a3)
  {
    v6 = effectiveConfiguration;
    self->_effectiveConfiguration = (NSURLSessionConfiguration *)[a3 copy];
  }
}

- (id)_effectiveConfiguration
{
  return self->_effectiveConfiguration;
}

- (id)_private_nw_activity
{
  return 0;
}

- (void)dealloc
{
  atsStateCache = self->_atsStateCache;
  self->_atsStateCache = 0;
  if (atsStateCache) {
    CFRelease(atsStateCache);
  }
  originalRequest = self->_originalRequest;
  if (originalRequest) {
    CFRelease(originalRequest);
  }
  currentRequest = self->_currentRequest;
  if (currentRequest) {
    CFRelease(currentRequest);
  }
  socketProperties = self->_socketProperties;
  if (socketProperties) {
    CFRelease(socketProperties);
  }
  CFDictionaryRef connectionProperties = self->_connectionProperties;
  if (connectionProperties) {
    CFRelease(connectionProperties);
  }
  nsCurrentRequest = self->_nsCurrentRequest;
  if (nsCurrentRequest)
  {

    self->_nsCurrentRequest = 0;
  }
  nsOriginalRequest = self->_nsOriginalRequest;
  if (nsOriginalRequest)
  {

    self->_nsOriginalRequest = 0;
  }
  session_ivar = self->_session_ivar;
  if (session_ivar)
  {

    self->_session_ivar = 0;
  }
  effectiveConfiguration = self->_effectiveConfiguration;
  if (effectiveConfiguration)
  {

    self->_effectiveConfiguration = 0;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {

    self->_uniqueIdentifier = 0;
  }
  [(CONNECTION_SessionTask *)self set_metrics:0];
  v13.receiver = self;
  v13.super_class = (Class)CONNECTION_SessionTask;
  [(CONNECTION_SessionTask *)&v13 dealloc];
}

- (CONNECTION_SessionTask)initWithRequest:(_CFURLRequest *)a3 mutableCurrent:(_CFURLRequest *)a4 connProps:(__CFDictionary *)a5 sockProps:(__CFDictionary *)a6 session:(id)a7
{
  v26.receiver = self;
  v26.super_class = (Class)CONNECTION_SessionTask;
  v12 = [(CONNECTION_SessionTask *)&v26 init];
  if (v12)
  {
    if (a3) {
      objc_super v13 = (_CFURLRequest *)CFRetain(a3);
    }
    else {
      objc_super v13 = 0;
    }
    v12->_originalRequest = v13;
    if (a4) {
      v14 = (_CFURLRequest *)CFRetain(a4);
    }
    else {
      v14 = 0;
    }
    v12->_currentRequest = v14;
    if (a6)
    {
      CFDictionaryRef v15 = (const __CFDictionary *)CFRetain(a6);
      v12->_socketProperties = v15;
      if (v15)
      {
        CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v15, &unk_1EC09F980);
        if (Value)
        {
          CFBooleanRef v17 = Value;
          CFTypeID v18 = CFGetTypeID(Value);
          if (v18 == CFBooleanGetTypeID())
          {
            if (CFBooleanGetValue(v17)) {
              v12->_preventsAppSSO = 1;
            }
          }
        }
      }
    }
    else
    {
      v12->_socketProperties = 0;
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v12->_startTime = v19;
    if (a5)
    {
      v20 = (__CFDictionary *)CFRetain(a5);
      v12->_CFDictionaryRef connectionProperties = v20;
      if (v20) {
        [(CONNECTION_SessionTask *)v12 _processConnectionProperties];
      }
    }
    else
    {
      v12->_CFDictionaryRef connectionProperties = 0;
    }
    v21 = (NSURLSession *)a7;
    v12->_session_ivar = v21;
    if (v21) {
      local_immutable_configuration_ivar = v21->_local_immutable_configuration_ivar;
    }
    else {
      local_immutable_configuration_ivar = 0;
    }
    v12->_effectiveConfiguration = local_immutable_configuration_ivar;
    v12->_uniqueIdentifier = (NSUUID *)(id)[MEMORY[0x1E4F29128] UUID];
    if (!v12->_atsStateCache)
    {
      session_ivar = v12->_session_ivar;
      if (session_ivar) {
        v24 = session_ivar->_local_immutable_configuration_ivar;
      }
      else {
        v24 = 0;
      }
      v12->_atsStateCache = createDictionaryFromData((const __CFData *)[(NSURLSessionConfiguration *)v24 _atsContext]);
    }
    v12->_metrics = (__CFN_TaskMetrics *)-[__CFN_TaskMetrics initWithTask:]((char *)[__CFN_TaskMetrics alloc], v12);
  }
  return v12;
}

- (BOOL)_isAVAssetTask
{
  return 0;
}

@end