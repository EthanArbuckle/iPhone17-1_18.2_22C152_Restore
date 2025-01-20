@interface NSURLSessionConfiguration
+ (BOOL)supportsSecureCoding;
+ (NSURLSessionConfiguration)backgroundSessionConfiguration:(NSString *)identifier;
+ (NSURLSessionConfiguration)backgroundSessionConfigurationWithIdentifier:(NSString *)identifier;
+ (NSURLSessionConfiguration)defaultSessionConfiguration;
+ (NSURLSessionConfiguration)ephemeralSessionConfiguration;
+ (id)_AVBackgroundSessionConfigurationWithIdentifier:(id)a3;
+ (id)_defaultProtocolClasses;
+ (id)immutableEffectiveConfigurationFromConfig:(id)a3;
+ (id)sessionConfigurationForSharedSession;
+ (void)initialize;
- (BOOL)HTTPShouldSetCookies;
- (BOOL)HTTPShouldUsePipelining;
- (BOOL)_allowTCPIOConnectionStreamTask;
- (BOOL)_allowsConstrainedNetworkAccess;
- (BOOL)_allowsExpensiveAccess;
- (BOOL)_allowsHSTSWithUntrustedRootCertificate;
- (BOOL)_allowsHTTP3;
- (BOOL)_allowsIndefiniteConnections;
- (BOOL)_allowsMultipathTCP;
- (BOOL)_allowsPowerNapScheduling;
- (BOOL)_allowsReachabilityCheck;
- (BOOL)_allowsResponseMonitoringDuringBodyTranmission;
- (BOOL)_allowsRetryForBackgroundDataTasks;
- (BOOL)_allowsSensitiveLogging;
- (BOOL)_allowsTCPFastOpen;
- (BOOL)_allowsTLSECH;
- (BOOL)_allowsTLSFallback;
- (BOOL)_allowsTLSFalseStart;
- (BOOL)_allowsTLSSessionResumption;
- (BOOL)_allowsTLSSessionTickets;
- (BOOL)_allowsUCA;
- (BOOL)_allowsVirtualInterfaces;
- (BOOL)_allowsWCA;
- (BOOL)_alwaysPerformDefaultTrustEvaluation;
- (BOOL)_clientIsNotExplicitlyDiscretionary;
- (BOOL)_disableAPWakeOnIdleConnections;
- (BOOL)_disablesNWLoader;
- (BOOL)_disablesOutOfProcessDirectWiFiUsage;
- (BOOL)_disablesUseOfProxySession;
- (BOOL)_duetPreauthorized;
- (BOOL)_enableOAuthBearerTokenChallenges;
- (BOOL)_enablesL4S;
- (BOOL)_forcesNewConnections;
- (BOOL)_ignoreDidReceiveResponseDisposition;
- (BOOL)_inPrivateBrowsing;
- (BOOL)_infersDiscretionaryFromOriginatingClient;
- (BOOL)_isProxySession;
- (BOOL)_onBehalfOfPairedDevice;
- (BOOL)_overridesBackgroundSessionAutoRedirect;
- (BOOL)_performsEVCertCheck;
- (BOOL)_phskip_alternativeServicesStorageSet;
- (BOOL)_phskip_cookieStorageSet;
- (BOOL)_phskip_credStorageSet;
- (BOOL)_phskip_hstsStorageSet;
- (BOOL)_phskip_urlCacheSet;
- (BOOL)_prefersInfraWiFi;
- (BOOL)_preventsAppSSO;
- (BOOL)_preventsDirectWiFiAccess;
- (BOOL)_preventsIdleSleep;
- (BOOL)_preventsIdleSleepOnceConnected;
- (BOOL)_preventsSystemHTTPProxyAuthentication;
- (BOOL)_prohibitEncryptedDNS;
- (BOOL)_reportsDataStalls;
- (BOOL)_requiresClientToOpenFiles;
- (BOOL)_requiresPowerPluggedIn;
- (BOOL)_requiresSecureHTTPSProxyConnection;
- (BOOL)_requiresSustainedDataDelivery;
- (BOOL)_respectsAllowsCellularAccessForDiscretionaryTasks;
- (BOOL)_sessionSendsLaunchOnDemandEvents;
- (BOOL)_shouldPreserveBackgroundSessionDisposition;
- (BOOL)_shouldSkipPreferredClientCertificateLookup;
- (BOOL)_skipsStackTraceCapture;
- (BOOL)_supportsAVAssetDownloads;
- (BOOL)_usePipeliningHeuristics;
- (BOOL)_usesNWLoader;
- (BOOL)allowsCellularAccess;
- (BOOL)allowsConstrainedNetworkAccess;
- (BOOL)allowsExpensiveNetworkAccess;
- (BOOL)isBackgroundSession;
- (BOOL)isDiscretionary;
- (BOOL)isEqual:(id)a3;
- (BOOL)proxiesRequireNWLoader;
- (BOOL)requiresDNSSECValidation;
- (BOOL)sessionSendsLaunchEvents;
- (BOOL)shouldUseExtendedBackgroundIdleMode;
- (BOOL)skip_download_unlink;
- (BOOL)waitsForConnectivity;
- (HTTPConnectionCacheLimits)getConnectionCacheLimits;
- (NSArray)_proxyConfigurations;
- (NSArray)protocolClasses;
- (NSData)_atsContext;
- (NSData)_sourceApplicationAuditTokenData;
- (NSDictionary)HTTPAdditionalHeaders;
- (NSDictionary)_overriddenDelegateOptions;
- (NSDictionary)_socketStreamProperties;
- (NSDictionary)connectionProxyDictionary;
- (NSHTTPCookieAcceptPolicy)HTTPCookieAcceptPolicy;
- (NSHTTPCookieStorage)HTTPCookieStorage;
- (NSHTTPCookieStorage)_phskip_cookieStorage;
- (NSInteger)HTTPMaximumConnectionsPerHost;
- (NSNumber)_maximumWatchCellularTransferSize;
- (NSSet)_authenticatorStatusCodes;
- (NSSet)_suppressedAutoAddedHTTPHeaders;
- (NSString)_CTDataConnectionServiceType;
- (NSString)_attributedBundleIdentifier;
- (NSString)_companionAppBundleIdentifier;
- (NSString)_connectionPoolName;
- (NSString)_downloadFileProtectionType;
- (NSString)_sourceApplicationBundleIdentifier;
- (NSString)_sourceApplicationSecondaryIdentifier;
- (NSString)_tcpConnectionPoolName;
- (NSString)_tlsTrustPinningPolicyName;
- (NSString)_watchAppBundleIdentifier;
- (NSString)_watchExtensionBundleIdentifier;
- (NSString)disposition;
- (NSString)identifier;
- (NSString)sharedContainerIdentifier;
- (NSTimeInterval)timeoutIntervalForRequest;
- (NSTimeInterval)timeoutIntervalForResource;
- (NSURL)_directoryForDownloadedFiles;
- (NSURLCache)URLCache;
- (NSURLCache)_phskip_urlCache;
- (NSURLCredentialStorage)URLCredentialStorage;
- (NSURLCredentialStorage)_phskip_credStorage;
- (NSURLRequestCachePolicy)requestCachePolicy;
- (NSURLRequestNetworkServiceType)networkServiceType;
- (NSURLSessionAppleIDContext)_appleIDContext;
- (NSURLSessionConfiguration)init;
- (NSURLSessionConfiguration)initWithCoder:(id)a3;
- (NSURLSessionMultipathServiceType)multipathServiceType;
- (OS_xpc_object)_xpcActivity;
- (SSLProtocol)TLSMaximumSupportedProtocol;
- (SSLProtocol)TLSMinimumSupportedProtocol;
- (_CFHSTSPolicy)copyHSTSPolicy;
- (_NSHSTSStorage)_hstsStorage;
- (_NSHSTSStorage)_phskip_hstsStorage;
- (_NSHTTPAlternativeServicesStorage)_alternativeServicesStorage;
- (_NSHTTPAlternativeServicesStorage)_phskip_alternativeServicesStorage;
- (char)initWithDisposition:(void *)a1;
- (double)_connectionCacheCellPurgeTimeout;
- (double)_connectionCachePurgeTimeout;
- (double)_customReadBufferTimeout;
- (double)_longLivedConnectionCacheCellPurgeTimeout;
- (double)_longLivedConnectionCachePurgeTimeout;
- (id).cxx_construct;
- (id)_initWithConfiguration:(id)a3;
- (id)copyImmutableVariant:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)_allowsHTTP3Internal;
- (int)_enablesL4SInternal;
- (int)_loggingPrivacyLevel;
- (int)_neTrackerTCCResult;
- (int)_pidForHAR;
- (int)_xpcActivityBudgeted;
- (int64_t)_IDSMessageTimeout;
- (int64_t)_companionProxyPreference;
- (int64_t)_connectionCacheMinimumFastLanePriority;
- (int64_t)_connectionCacheNumFastLanes;
- (int64_t)_connectionCacheNumPriorityLevels;
- (int64_t)_duetPreClearedMode;
- (int64_t)_expiredDNSBehavior;
- (int64_t)_timingDataOptions;
- (tls_protocol_version_t)TLSMaximumSupportedProtocolVersion;
- (tls_protocol_version_t)TLSMinimumSupportedProtocolVersion;
- (unint64_t)_TCPAdaptiveReadTimeout;
- (unint64_t)_TCPAdaptiveWriteTimeout;
- (unint64_t)_customReadBufferSize;
- (unint64_t)_forcedNetworkServiceType;
- (unint64_t)_multipathAlternatePort;
- (unint64_t)hash;
- (void)_copyAttribute:(__CFString *)a3;
- (void)_setAllowsUCA:(BOOL)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsCellularAccess:(BOOL)allowsCellularAccess;
- (void)setAllowsConstrainedNetworkAccess:(BOOL)allowsConstrainedNetworkAccess;
- (void)setAllowsExpensiveNetworkAccess:(BOOL)allowsExpensiveNetworkAccess;
- (void)setBackgroundSession:(BOOL)a3;
- (void)setConnectionProxyDictionary:(NSDictionary *)connectionProxyDictionary;
- (void)setDiscretionary:(BOOL)discretionary;
- (void)setDisposition:(id)a3;
- (void)setHTTPAdditionalHeaders:(NSDictionary *)HTTPAdditionalHeaders;
- (void)setHTTPCookieAcceptPolicy:(NSHTTPCookieAcceptPolicy)HTTPCookieAcceptPolicy;
- (void)setHTTPCookieStorage:(NSHTTPCookieStorage *)HTTPCookieStorage;
- (void)setHTTPMaximumConnectionsPerHost:(NSInteger)HTTPMaximumConnectionsPerHost;
- (void)setHTTPShouldSetCookies:(BOOL)HTTPShouldSetCookies;
- (void)setHTTPShouldUsePipelining:(BOOL)HTTPShouldUsePipelining;
- (void)setIdentifier:(id)a3;
- (void)setMultipathServiceType:(NSURLSessionMultipathServiceType)multipathServiceType;
- (void)setNetworkServiceType:(NSURLRequestNetworkServiceType)networkServiceType;
- (void)setProtocolClasses:(NSArray *)protocolClasses;
- (void)setRequestCachePolicy:(NSURLRequestCachePolicy)requestCachePolicy;
- (void)setRequiresDNSSECValidation:(BOOL)requiresDNSSECValidation;
- (void)setSessionSendsLaunchEvents:(BOOL)sessionSendsLaunchEvents;
- (void)setSharedContainerIdentifier:(NSString *)sharedContainerIdentifier;
- (void)setShouldUseExtendedBackgroundIdleMode:(BOOL)shouldUseExtendedBackgroundIdleMode;
- (void)setSkip_download_unlink:(BOOL)a3;
- (void)setTLSMaximumSupportedProtocol:(SSLProtocol)TLSMaximumSupportedProtocol;
- (void)setTLSMaximumSupportedProtocolVersion:(tls_protocol_version_t)TLSMaximumSupportedProtocolVersion;
- (void)setTLSMinimumSupportedProtocol:(SSLProtocol)TLSMinimumSupportedProtocol;
- (void)setTLSMinimumSupportedProtocolVersion:(tls_protocol_version_t)TLSMinimumSupportedProtocolVersion;
- (void)setTimeoutIntervalForRequest:(NSTimeInterval)timeoutIntervalForRequest;
- (void)setTimeoutIntervalForResource:(NSTimeInterval)timeoutIntervalForResource;
- (void)setURLCache:(NSURLCache *)URLCache;
- (void)setURLCredentialStorage:(NSURLCredentialStorage *)URLCredentialStorage;
- (void)setWaitsForConnectivity:(BOOL)waitsForConnectivity;
- (void)set_CTDataConnectionServiceType:(id)a3;
- (void)set_IDSMessageTimeout:(int64_t)a3;
- (void)set_TCPAdaptiveReadTimeout:(unint64_t)a3;
- (void)set_TCPAdaptiveWriteTimeout:(unint64_t)a3;
- (void)set_allowTCPIOConnectionStreamTask:(BOOL)a3;
- (void)set_allowsConstrainedNetworkAccess:(BOOL)a3;
- (void)set_allowsExpensiveAccess:(BOOL)a3;
- (void)set_allowsHSTSWithUntrustedRootCertificate:(BOOL)a3;
- (void)set_allowsHTTP3:(BOOL)a3;
- (void)set_allowsHTTP3Internal:(int)a3;
- (void)set_allowsIndefiniteConnections:(BOOL)a3;
- (void)set_allowsMultipathTCP:(BOOL)a3;
- (void)set_allowsPowerNapScheduling:(BOOL)a3;
- (void)set_allowsResponseMonitoringDuringBodyTranmission:(BOOL)a3;
- (void)set_allowsRetryForBackgroundDataTasks:(BOOL)a3;
- (void)set_allowsSensitiveLogging:(BOOL)a3;
- (void)set_allowsTCPFastOpen:(BOOL)a3;
- (void)set_allowsTLSECH:(BOOL)a3;
- (void)set_allowsTLSFallback:(BOOL)a3;
- (void)set_allowsTLSFalseStart:(BOOL)a3;
- (void)set_allowsTLSSessionResumption:(BOOL)a3;
- (void)set_allowsTLSSessionTickets:(BOOL)a3;
- (void)set_allowsVirtualInterfaces:(BOOL)a3;
- (void)set_allowsWCA:(BOOL)a3;
- (void)set_alternativeServicesStorage:(id)a3;
- (void)set_alwaysPerformDefaultTrustEvaluation:(BOOL)a3;
- (void)set_appleIDContext:(id)a3;
- (void)set_atsContext:(id)a3;
- (void)set_attributedBundleIdentifier:(id)a3;
- (void)set_authenticatorStatusCodes:(id)a3;
- (void)set_clientIsNotExplicitlyDiscretionary:(BOOL)a3;
- (void)set_companionAppBundleIdentifier:(id)a3;
- (void)set_companionProxyPreference:(int64_t)a3;
- (void)set_connectionCacheCellPurgeTimeout:(double)a3;
- (void)set_connectionCacheMinimumFastLanePriority:(int64_t)a3;
- (void)set_connectionCacheNumFastLanes:(int64_t)a3;
- (void)set_connectionCacheNumPriorityLevels:(int64_t)a3;
- (void)set_connectionCachePurgeTimeout:(double)a3;
- (void)set_connectionPoolName:(id)a3;
- (void)set_customReadBufferSize:(unint64_t)a3;
- (void)set_customReadBufferTimeout:(double)a3;
- (void)set_directoryForDownloadedFiles:(id)a3;
- (void)set_disableAPWakeOnIdleConnections:(BOOL)a3;
- (void)set_disablesNWLoader:(BOOL)a3;
- (void)set_disablesOutOfProcessDirectWiFiUsage:(BOOL)a3;
- (void)set_disablesUseOfProxySession:(BOOL)a3;
- (void)set_downloadFileProtectionType:(id)a3;
- (void)set_duetPreClearedMode:(int64_t)a3;
- (void)set_duetPreauthorized:(BOOL)a3;
- (void)set_enableOAuthBearerTokenChallenges:(BOOL)a3;
- (void)set_enablesL4S:(BOOL)a3;
- (void)set_enablesL4SInternal:(int)a3;
- (void)set_expiredDNSBehavior:(int64_t)a3;
- (void)set_forcedNetworkServiceType:(unint64_t)a3;
- (void)set_forcesNewConnections:(BOOL)a3;
- (void)set_hstsStorage:(id)a3;
- (void)set_ignoreDidReceiveResponseDisposition:(BOOL)a3;
- (void)set_infersDiscretionaryFromOriginatingClient:(BOOL)a3;
- (void)set_loggingPrivacyLevel:(int)a3;
- (void)set_longLivedConnectionCacheCellPurgeTimeout:(double)a3;
- (void)set_longLivedConnectionCachePurgeTimeout:(double)a3;
- (void)set_maximumWatchCellularTransferSize:(id)a3;
- (void)set_multipathAlternatePort:(unint64_t)a3;
- (void)set_neTrackerTCCResult:(int)a3;
- (void)set_onBehalfOfPairedDevice:(BOOL)a3;
- (void)set_overriddenDelegateOptions:(id)a3;
- (void)set_overridesBackgroundSessionAutoRedirect:(BOOL)a3;
- (void)set_performsEVCertCheck:(BOOL)a3;
- (void)set_phskip_alternativeServicesStorage:(id)a3;
- (void)set_phskip_alternativeServicesStorageSet:(BOOL)a3;
- (void)set_phskip_cookieStorage:(id)a3;
- (void)set_phskip_cookieStorageSet:(BOOL)a3;
- (void)set_phskip_credStorage:(id)a3;
- (void)set_phskip_credStorageSet:(BOOL)a3;
- (void)set_phskip_hstsStorage:(id)a3;
- (void)set_phskip_hstsStorageSet:(BOOL)a3;
- (void)set_phskip_urlCache:(id)a3;
- (void)set_phskip_urlCacheSet:(BOOL)a3;
- (void)set_pidForHAR:(int)a3;
- (void)set_prefersInfraWiFi:(BOOL)a3;
- (void)set_preventsAppSSO:(BOOL)a3;
- (void)set_preventsDirectWiFiAccess:(BOOL)a3;
- (void)set_preventsIdleSleep:(BOOL)a3;
- (void)set_preventsIdleSleepOnceConnected:(BOOL)a3;
- (void)set_preventsSystemHTTPProxyAuthentication:(BOOL)a3;
- (void)set_prohibitEncryptedDNS:(BOOL)a3;
- (void)set_proxyConfigurations:(id)a3;
- (void)set_proxySession:(BOOL)a3;
- (void)set_reportsDataStalls:(BOOL)a3;
- (void)set_requiresClientToOpenFiles:(BOOL)a3;
- (void)set_requiresPowerPluggedIn:(BOOL)a3;
- (void)set_requiresSecureHTTPSProxyConnection:(BOOL)a3;
- (void)set_requiresSustainedDataDelivery:(BOOL)a3;
- (void)set_respectsAllowsCellularAccessForDiscretionaryTasks:(BOOL)a3;
- (void)set_sessionSendsLaunchOnDemandEvents:(BOOL)a3;
- (void)set_shouldPreserveBackgroundSessionDisposition:(BOOL)a3;
- (void)set_shouldSkipPreferredClientCertificateLookup:(BOOL)a3;
- (void)set_skipsStackTraceCapture:(BOOL)a3;
- (void)set_socketStreamProperties:(id)a3;
- (void)set_sourceApplicationAuditTokenData:(id)a3;
- (void)set_sourceApplicationBundleIdentifier:(id)a3;
- (void)set_sourceApplicationSecondaryIdentifier:(id)a3;
- (void)set_supportsAVAssetDownloads:(BOOL)a3;
- (void)set_suppressedAutoAddedHTTPHeaders:(id)a3;
- (void)set_tcpConnectionPoolName:(id)a3;
- (void)set_timingDataOptions:(int64_t)a3;
- (void)set_tlsTrustPinningPolicyName:(id)a3;
- (void)set_usePipeliningHeuristics:(BOOL)a3;
- (void)set_usesNWLoader:(BOOL)a3;
- (void)set_watchAppBundleIdentifier:(id)a3;
- (void)set_watchExtensionBundleIdentifier:(id)a3;
- (void)set_xpcActivity:(id)a3;
- (void)set_xpcActivityBudgeted:(int)a3;
@end

@implementation NSURLSessionConfiguration

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = -[NSURLSessionConfiguration initWithDisposition:]([NSURLSessionConfiguration alloc], [(NSURLSessionConfiguration *)self disposition]);
  objc_msgSend(v4, "setAllowsCellularAccess:", -[NSURLSessionConfiguration allowsCellularAccess](self, "allowsCellularAccess"));
  objc_msgSend(v4, "setAllowsExpensiveNetworkAccess:", -[NSURLSessionConfiguration allowsExpensiveNetworkAccess](self, "allowsExpensiveNetworkAccess"));
  objc_msgSend(v4, "setAllowsConstrainedNetworkAccess:", -[NSURLSessionConfiguration allowsConstrainedNetworkAccess](self, "allowsConstrainedNetworkAccess"));
  objc_msgSend(v4, "_setAllowsUCA:", -[NSURLSessionConfiguration _allowsUCA](self, "_allowsUCA"));
  objc_msgSend(v4, "set_allowsVirtualInterfaces:", -[NSURLSessionConfiguration _allowsVirtualInterfaces](self, "_allowsVirtualInterfaces"));
  objc_msgSend(v4, "setWaitsForConnectivity:", -[NSURLSessionConfiguration waitsForConnectivity](self, "waitsForConnectivity"));
  objc_msgSend(v4, "setDiscretionary:", -[NSURLSessionConfiguration isDiscretionary](self, "isDiscretionary"));
  objc_msgSend(v4, "setSharedContainerIdentifier:", -[NSURLSessionConfiguration sharedContainerIdentifier](self, "sharedContainerIdentifier"));
  objc_msgSend(v4, "setSessionSendsLaunchEvents:", -[NSURLSessionConfiguration sessionSendsLaunchEvents](self, "sessionSendsLaunchEvents"));
  objc_msgSend(v4, "setHTTPShouldUsePipelining:", -[NSURLSessionConfiguration HTTPShouldUsePipelining](self, "HTTPShouldUsePipelining"));
  objc_msgSend(v4, "setHTTPShouldSetCookies:", -[NSURLSessionConfiguration HTTPShouldSetCookies](self, "HTTPShouldSetCookies"));
  objc_msgSend(v4, "set_requiresPowerPluggedIn:", -[NSURLSessionConfiguration _requiresPowerPluggedIn](self, "_requiresPowerPluggedIn"));
  objc_msgSend(v4, "set_allowsPowerNapScheduling:", -[NSURLSessionConfiguration _allowsPowerNapScheduling](self, "_allowsPowerNapScheduling"));
  objc_msgSend(v4, "set_allowsHSTSWithUntrustedRootCertificate:", -[NSURLSessionConfiguration _allowsHSTSWithUntrustedRootCertificate](self, "_allowsHSTSWithUntrustedRootCertificate"));
  objc_msgSend(v4, "set_sessionSendsLaunchOnDemandEvents:", -[NSURLSessionConfiguration _sessionSendsLaunchOnDemandEvents](self, "_sessionSendsLaunchOnDemandEvents"));
  objc_msgSend(v4, "set_timingDataOptions:", -[NSURLSessionConfiguration _timingDataOptions](self, "_timingDataOptions"));
  objc_msgSend(v4, "set_shouldSkipPreferredClientCertificateLookup:", -[NSURLSessionConfiguration _shouldSkipPreferredClientCertificateLookup](self, "_shouldSkipPreferredClientCertificateLookup"));
  objc_msgSend(v4, "set_allowsRetryForBackgroundDataTasks:", -[NSURLSessionConfiguration _allowsRetryForBackgroundDataTasks](self, "_allowsRetryForBackgroundDataTasks"));
  objc_msgSend(v4, "set_onBehalfOfPairedDevice:", -[NSURLSessionConfiguration _onBehalfOfPairedDevice](self, "_onBehalfOfPairedDevice"));
  objc_msgSend(v4, "set_clientIsNotExplicitlyDiscretionary:", -[NSURLSessionConfiguration _clientIsNotExplicitlyDiscretionary](self, "_clientIsNotExplicitlyDiscretionary"));
  objc_msgSend(v4, "set_respectsAllowsCellularAccessForDiscretionaryTasks:", -[NSURLSessionConfiguration _respectsAllowsCellularAccessForDiscretionaryTasks](self, "_respectsAllowsCellularAccessForDiscretionaryTasks"));
  objc_msgSend(v4, "set_infersDiscretionaryFromOriginatingClient:", -[NSURLSessionConfiguration _infersDiscretionaryFromOriginatingClient](self, "_infersDiscretionaryFromOriginatingClient"));
  objc_msgSend(v4, "setBackgroundSession:", -[NSURLSessionConfiguration isBackgroundSession](self, "isBackgroundSession"));
  objc_msgSend(v4, "setSkip_download_unlink:", -[NSURLSessionConfiguration skip_download_unlink](self, "skip_download_unlink"));
  objc_msgSend(v4, "set_requiresClientToOpenFiles:", -[NSURLSessionConfiguration _requiresClientToOpenFiles](self, "_requiresClientToOpenFiles"));
  objc_msgSend(v4, "set_forcesNewConnections:", -[NSURLSessionConfiguration _forcesNewConnections](self, "_forcesNewConnections"));
  objc_msgSend(v4, "set_supportsAVAssetDownloads:", -[NSURLSessionConfiguration _supportsAVAssetDownloads](self, "_supportsAVAssetDownloads"));
  objc_msgSend(v4, "set_proxySession:", -[NSURLSessionConfiguration _isProxySession](self, "_isProxySession"));
  objc_msgSend(v4, "set_preventsIdleSleep:", -[NSURLSessionConfiguration _preventsIdleSleep](self, "_preventsIdleSleep"));
  objc_msgSend(v4, "set_usePipeliningHeuristics:", -[NSURLSessionConfiguration _usePipeliningHeuristics](self, "_usePipeliningHeuristics"));
  objc_msgSend(v4, "setTLSMinimumSupportedProtocol:", -[NSURLSessionConfiguration TLSMinimumSupportedProtocol](self, "TLSMinimumSupportedProtocol"));
  objc_msgSend(v4, "setTLSMaximumSupportedProtocol:", -[NSURLSessionConfiguration TLSMaximumSupportedProtocol](self, "TLSMaximumSupportedProtocol"));
  objc_msgSend(v4, "setIdentifier:", -[NSURLSessionConfiguration identifier](self, "identifier"));
  objc_msgSend(v4, "setRequestCachePolicy:", -[NSURLSessionConfiguration requestCachePolicy](self, "requestCachePolicy"));
  [(NSURLSessionConfiguration *)self timeoutIntervalForRequest];
  objc_msgSend(v4, "setTimeoutIntervalForRequest:");
  [(NSURLSessionConfiguration *)self timeoutIntervalForResource];
  objc_msgSend(v4, "setTimeoutIntervalForResource:");
  objc_msgSend(v4, "setNetworkServiceType:", -[NSURLSessionConfiguration networkServiceType](self, "networkServiceType"));
  objc_msgSend(v4, "setConnectionProxyDictionary:", -[NSURLSessionConfiguration connectionProxyDictionary](self, "connectionProxyDictionary"));
  objc_msgSend(v4, "setHTTPCookieAcceptPolicy:", -[NSURLSessionConfiguration HTTPCookieAcceptPolicy](self, "HTTPCookieAcceptPolicy"));
  objc_msgSend(v4, "setHTTPAdditionalHeaders:", -[NSURLSessionConfiguration HTTPAdditionalHeaders](self, "HTTPAdditionalHeaders"));
  objc_msgSend(v4, "setHTTPMaximumConnectionsPerHost:", -[NSURLSessionConfiguration HTTPMaximumConnectionsPerHost](self, "HTTPMaximumConnectionsPerHost"));
  objc_msgSend(v4, "setShouldUseExtendedBackgroundIdleMode:", -[NSURLSessionConfiguration shouldUseExtendedBackgroundIdleMode](self, "shouldUseExtendedBackgroundIdleMode"));
  objc_msgSend(v4, "setProtocolClasses:", -[NSURLSessionConfiguration protocolClasses](self, "protocolClasses"));
  objc_msgSend(v4, "setMultipathServiceType:", -[NSURLSessionConfiguration multipathServiceType](self, "multipathServiceType"));
  objc_msgSend(v4, "set_directoryForDownloadedFiles:", -[NSURLSessionConfiguration _directoryForDownloadedFiles](self, "_directoryForDownloadedFiles"));
  objc_msgSend(v4, "set_sourceApplicationBundleIdentifier:", -[NSURLSessionConfiguration _sourceApplicationBundleIdentifier](self, "_sourceApplicationBundleIdentifier"));
  objc_msgSend(v4, "set_sourceApplicationSecondaryIdentifier:", -[NSURLSessionConfiguration _sourceApplicationSecondaryIdentifier](self, "_sourceApplicationSecondaryIdentifier"));
  objc_msgSend(v4, "set_sourceApplicationAuditTokenData:", -[NSURLSessionConfiguration _sourceApplicationAuditTokenData](self, "_sourceApplicationAuditTokenData"));
  objc_msgSend(v4, "set_attributedBundleIdentifier:", -[NSURLSessionConfiguration _attributedBundleIdentifier](self, "_attributedBundleIdentifier"));
  objc_msgSend(v4, "set_TCPAdaptiveReadTimeout:", -[NSURLSessionConfiguration _TCPAdaptiveReadTimeout](self, "_TCPAdaptiveReadTimeout"));
  objc_msgSend(v4, "set_TCPAdaptiveWriteTimeout:", -[NSURLSessionConfiguration _TCPAdaptiveWriteTimeout](self, "_TCPAdaptiveWriteTimeout"));
  objc_msgSend(v4, "set_reportsDataStalls:", -[NSURLSessionConfiguration _reportsDataStalls](self, "_reportsDataStalls"));
  [(NSURLSessionConfiguration *)self _connectionCachePurgeTimeout];
  objc_msgSend(v4, "set_connectionCachePurgeTimeout:");
  [(NSURLSessionConfiguration *)self _connectionCacheCellPurgeTimeout];
  objc_msgSend(v4, "set_connectionCacheCellPurgeTimeout:");
  [(NSURLSessionConfiguration *)self _longLivedConnectionCachePurgeTimeout];
  objc_msgSend(v4, "set_longLivedConnectionCachePurgeTimeout:");
  [(NSURLSessionConfiguration *)self _longLivedConnectionCacheCellPurgeTimeout];
  objc_msgSend(v4, "set_longLivedConnectionCacheCellPurgeTimeout:");
  objc_msgSend(v4, "set_connectionPoolName:", -[NSURLSessionConfiguration _connectionPoolName](self, "_connectionPoolName"));
  objc_msgSend(v4, "set_connectionCacheNumPriorityLevels:", -[NSURLSessionConfiguration _connectionCacheNumPriorityLevels](self, "_connectionCacheNumPriorityLevels"));
  objc_msgSend(v4, "set_connectionCacheNumFastLanes:", -[NSURLSessionConfiguration _connectionCacheNumFastLanes](self, "_connectionCacheNumFastLanes"));
  objc_msgSend(v4, "set_connectionCacheMinimumFastLanePriority:", -[NSURLSessionConfiguration _connectionCacheMinimumFastLanePriority](self, "_connectionCacheMinimumFastLanePriority"));
  objc_msgSend(v4, "set_tcpConnectionPoolName:", -[NSURLSessionConfiguration _tcpConnectionPoolName](self, "_tcpConnectionPoolName"));
  objc_msgSend(v4, "set_socketStreamProperties:", -[NSURLSessionConfiguration _socketStreamProperties](self, "_socketStreamProperties"));
  objc_msgSend(v4, "set_preventsIdleSleepOnceConnected:", -[NSURLSessionConfiguration _preventsIdleSleepOnceConnected](self, "_preventsIdleSleepOnceConnected"));
  objc_msgSend(v4, "set_overridesBackgroundSessionAutoRedirect:", -[NSURLSessionConfiguration _overridesBackgroundSessionAutoRedirect](self, "_overridesBackgroundSessionAutoRedirect"));
  objc_msgSend(v4, "set_performsEVCertCheck:", -[NSURLSessionConfiguration _performsEVCertCheck](self, "_performsEVCertCheck"));
  objc_msgSend(v4, "set_appleIDContext:", -[NSURLSessionConfiguration _appleIDContext](self, "_appleIDContext"));
  objc_msgSend(v4, "set_authenticatorStatusCodes:", -[NSURLSessionConfiguration _authenticatorStatusCodes](self, "_authenticatorStatusCodes"));
  objc_msgSend(v4, "set_atsContext:", -[NSURLSessionConfiguration _atsContext](self, "_atsContext"));
  objc_msgSend(v4, "set_prefersInfraWiFi:", -[NSURLSessionConfiguration _prefersInfraWiFi](self, "_prefersInfraWiFi"));
  objc_msgSend(v4, "set_shouldPreserveBackgroundSessionDisposition:", -[NSURLSessionConfiguration _shouldPreserveBackgroundSessionDisposition](self, "_shouldPreserveBackgroundSessionDisposition"));
  objc_msgSend(v4, "set_disablesOutOfProcessDirectWiFiUsage:", -[NSURLSessionConfiguration _disablesOutOfProcessDirectWiFiUsage](self, "_disablesOutOfProcessDirectWiFiUsage"));
  objc_msgSend(v4, "set_disablesUseOfProxySession:", -[NSURLSessionConfiguration _disablesUseOfProxySession](self, "_disablesUseOfProxySession"));
  objc_msgSend(v4, "set_CTDataConnectionServiceType:", -[NSURLSessionConfiguration _CTDataConnectionServiceType](self, "_CTDataConnectionServiceType"));
  objc_msgSend(v4, "set_preventsDirectWiFiAccess:", -[NSURLSessionConfiguration _preventsDirectWiFiAccess](self, "_preventsDirectWiFiAccess"));
  objc_msgSend(v4, "set_allowTCPIOConnectionStreamTask:", -[NSURLSessionConfiguration _allowTCPIOConnectionStreamTask](self, "_allowTCPIOConnectionStreamTask"));
  objc_msgSend(v4, "set_customReadBufferSize:", -[NSURLSessionConfiguration _customReadBufferSize](self, "_customReadBufferSize"));
  [(NSURLSessionConfiguration *)self _customReadBufferTimeout];
  objc_msgSend(v4, "set_customReadBufferTimeout:");
  objc_msgSend(v4, "set_preventsSystemHTTPProxyAuthentication:", -[NSURLSessionConfiguration _preventsSystemHTTPProxyAuthentication](self, "_preventsSystemHTTPProxyAuthentication"));
  objc_msgSend(v4, "set_requiresSecureHTTPSProxyConnection:", -[NSURLSessionConfiguration _requiresSecureHTTPSProxyConnection](self, "_requiresSecureHTTPSProxyConnection"));
  objc_msgSend(v4, "set_proxyConfigurations:", -[NSURLSessionConfiguration _proxyConfigurations](self, "_proxyConfigurations"));
  objc_msgSend(v4, "set_preventsAppSSO:", -[NSURLSessionConfiguration _preventsAppSSO](self, "_preventsAppSSO"));
  objc_msgSend(v4, "set_loggingPrivacyLevel:", -[NSURLSessionConfiguration _loggingPrivacyLevel](self, "_loggingPrivacyLevel"));
  objc_msgSend(v4, "set_duetPreauthorized:", -[NSURLSessionConfiguration _duetPreauthorized](self, "_duetPreauthorized"));
  objc_msgSend(v4, "set_duetPreClearedMode:", -[NSURLSessionConfiguration _duetPreClearedMode](self, "_duetPreClearedMode"));
  objc_msgSend(v4, "set_xpcActivityBudgeted:", -[NSURLSessionConfiguration _xpcActivityBudgeted](self, "_xpcActivityBudgeted"));
  objc_msgSend(v4, "set_requiresSustainedDataDelivery:", -[NSURLSessionConfiguration _requiresSustainedDataDelivery](self, "_requiresSustainedDataDelivery"));
  objc_msgSend(v4, "set_IDSMessageTimeout:", -[NSURLSessionConfiguration _IDSMessageTimeout](self, "_IDSMessageTimeout"));
  objc_msgSend(v4, "set_ignoreDidReceiveResponseDisposition:", -[NSURLSessionConfiguration _ignoreDidReceiveResponseDisposition](self, "_ignoreDidReceiveResponseDisposition"));
  objc_msgSend(v4, "set_alwaysPerformDefaultTrustEvaluation:", -[NSURLSessionConfiguration _alwaysPerformDefaultTrustEvaluation](self, "_alwaysPerformDefaultTrustEvaluation"));
  objc_msgSend(v4, "set_allowsMultipathTCP:", -[NSURLSessionConfiguration _allowsMultipathTCP](self, "_allowsMultipathTCP"));
  objc_msgSend(v4, "set_allowsResponseMonitoringDuringBodyTranmission:", -[NSURLSessionConfiguration _allowsResponseMonitoringDuringBodyTranmission](self, "_allowsResponseMonitoringDuringBodyTranmission"));
  objc_msgSend(v4, "set_allowsIndefiniteConnections:", -[NSURLSessionConfiguration _allowsIndefiniteConnections](self, "_allowsIndefiniteConnections"));
  objc_msgSend(v4, "set_allowsTCPFastOpen:", -[NSURLSessionConfiguration _allowsTCPFastOpen](self, "_allowsTCPFastOpen"));
  objc_msgSend(v4, "set_allowsTLSSessionTickets:", -[NSURLSessionConfiguration _allowsTLSSessionTickets](self, "_allowsTLSSessionTickets"));
  objc_msgSend(v4, "set_allowsTLSSessionResumption:", -[NSURLSessionConfiguration _allowsTLSSessionResumption](self, "_allowsTLSSessionResumption"));
  objc_msgSend(v4, "set_allowsTLSFalseStart:", -[NSURLSessionConfiguration _allowsTLSFalseStart](self, "_allowsTLSFalseStart"));
  objc_msgSend(v4, "set_tlsTrustPinningPolicyName:", -[NSURLSessionConfiguration _tlsTrustPinningPolicyName](self, "_tlsTrustPinningPolicyName"));
  objc_msgSend(v4, "set_allowsTLSFallback:", -[NSURLSessionConfiguration _allowsTLSFallback](self, "_allowsTLSFallback"));
  objc_msgSend(v4, "set_allowsTLSECH:", -[NSURLSessionConfiguration _allowsTLSECH](self, "_allowsTLSECH"));
  objc_msgSend(v4, "set_companionAppBundleIdentifier:", -[NSURLSessionConfiguration _companionAppBundleIdentifier](self, "_companionAppBundleIdentifier"));
  objc_msgSend(v4, "set_watchAppBundleIdentifier:", -[NSURLSessionConfiguration _watchAppBundleIdentifier](self, "_watchAppBundleIdentifier"));
  objc_msgSend(v4, "set_watchExtensionBundleIdentifier:", -[NSURLSessionConfiguration _watchExtensionBundleIdentifier](self, "_watchExtensionBundleIdentifier"));
  objc_msgSend(v4, "set_forcedNetworkServiceType:", -[NSURLSessionConfiguration _forcedNetworkServiceType](self, "_forcedNetworkServiceType"));
  objc_msgSend(v4, "set_overriddenDelegateOptions:", -[NSURLSessionConfiguration _overriddenDelegateOptions](self, "_overriddenDelegateOptions"));
  objc_msgSend(v4, "set_suppressedAutoAddedHTTPHeaders:", -[NSURLSessionConfiguration _suppressedAutoAddedHTTPHeaders](self, "_suppressedAutoAddedHTTPHeaders"));
  objc_msgSend(v4, "set_expiredDNSBehavior:", -[NSURLSessionConfiguration _expiredDNSBehavior](self, "_expiredDNSBehavior"));
  objc_msgSend(v4, "setRequiresDNSSECValidation:", -[NSURLSessionConfiguration requiresDNSSECValidation](self, "requiresDNSSECValidation"));
  objc_msgSend(v4, "set_maximumWatchCellularTransferSize:", -[NSURLSessionConfiguration _maximumWatchCellularTransferSize](self, "_maximumWatchCellularTransferSize"));
  objc_msgSend(v4, "set_multipathAlternatePort:", -[NSURLSessionConfiguration _multipathAlternatePort](self, "_multipathAlternatePort"));
  if (self->_phskip_credStorageSet) {
    objc_msgSend(v4, "setURLCredentialStorage:", -[NSURLSessionConfiguration _phskip_credStorage](self, "_phskip_credStorage"));
  }
  if (self->_phskip_urlCacheSet) {
    objc_msgSend(v4, "setURLCache:", -[NSURLSessionConfiguration _phskip_urlCache](self, "_phskip_urlCache"));
  }
  if (self->_phskip_cookieStorageSet) {
    objc_msgSend(v4, "setHTTPCookieStorage:", -[NSURLSessionConfiguration _phskip_cookieStorage](self, "_phskip_cookieStorage"));
  }
  if (self->_phskip_hstsStorageSet) {
    objc_msgSend(v4, "set_hstsStorage:", -[NSURLSessionConfiguration _hstsStorage](self, "_hstsStorage"));
  }
  objc_msgSend(v4, "set_allowsHTTP3Internal:", -[NSURLSessionConfiguration _allowsHTTP3Internal](self, "_allowsHTTP3Internal"));
  if (self->_phskip_alternativeServicesStorageSet) {
    objc_msgSend(v4, "set_alternativeServicesStorage:", -[NSURLSessionConfiguration _phskip_alternativeServicesStorage](self, "_phskip_alternativeServicesStorage"));
  }
  objc_msgSend(v4, "set_usesNWLoader:", -[NSURLSessionConfiguration _usesNWLoader](self, "_usesNWLoader"));
  objc_msgSend(v4, "set_disablesNWLoader:", -[NSURLSessionConfiguration _disablesNWLoader](self, "_disablesNWLoader"));
  objc_msgSend(v4, "set_downloadFileProtectionType:", -[NSURLSessionConfiguration _downloadFileProtectionType](self, "_downloadFileProtectionType"));
  objc_msgSend(v4, "set_pidForHAR:", -[NSURLSessionConfiguration _pidForHAR](self, "_pidForHAR"));
  objc_msgSend(v4, "set_enablesL4SInternal:", -[NSURLSessionConfiguration _enablesL4SInternal](self, "_enablesL4SInternal"));
  objc_msgSend(v4, "set_prohibitEncryptedDNS:", -[NSURLSessionConfiguration _prohibitEncryptedDNS](self, "_prohibitEncryptedDNS"));
  objc_msgSend(v4, "set_enableOAuthBearerTokenChallenges:", -[NSURLSessionConfiguration _enableOAuthBearerTokenChallenges](self, "_enableOAuthBearerTokenChallenges"));
  objc_msgSend(v4, "set_neTrackerTCCResult:", -[NSURLSessionConfiguration _neTrackerTCCResult](self, "_neTrackerTCCResult"));
  objc_msgSend(v4, "set_disableAPWakeOnIdleConnections:", -[NSURLSessionConfiguration _disableAPWakeOnIdleConnections](self, "_disableAPWakeOnIdleConnections"));
  return v4;
}

- (NSData)_sourceApplicationAuditTokenData
{
  return self->_sourceApplicationAuditTokenData;
}

- (NSString)_sourceApplicationBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (int)_loggingPrivacyLevel
{
  return self->_loggingPrivacyLevel;
}

- (BOOL)_disableAPWakeOnIdleConnections
{
  return self->_disableAPWakeOnIdleConnections;
}

- (NSString)_tlsTrustPinningPolicyName
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (BOOL)_requiresSustainedDataDelivery
{
  return self->_requiresSustainedDataDelivery;
}

- (int)_pidForHAR
{
  return self->_pidForHAR;
}

- (NSArray)_proxyConfigurations
{
  return (NSArray *)objc_getProperty(self, a2, 360, 1);
}

- (NSTimeInterval)timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource;
}

- (NSURLSessionAppleIDContext)_appleIDContext
{
  return (NSURLSessionAppleIDContext *)objc_getProperty(self, a2, 304, 1);
}

- (int64_t)_timingDataOptions
{
  return self->_timingDataOptions;
}

- (BOOL)_shouldSkipPreferredClientCertificateLookup
{
  return self->_shouldSkipPreferredClientCertificateLookup;
}

- (NSSet)_authenticatorStatusCodes
{
  return (NSSet *)objc_getProperty(self, a2, 464, 1);
}

- (BOOL)_requiresSecureHTTPSProxyConnection
{
  return self->_requiresSecureHTTPSProxyConnection;
}

- (BOOL)_preventsSystemHTTPProxyAuthentication
{
  return self->_preventsSystemHTTPProxyAuthentication;
}

- (BOOL)_preventsAppSSO
{
  return self->_preventsAppSSO;
}

- (BOOL)_preventsIdleSleepOnceConnected
{
  return self->_preventsIdleSleepOnceConnected;
}

- (NSArray)protocolClasses
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (BOOL)waitsForConnectivity
{
  return self->_waitsForConnectivity;
}

- (BOOL)_allowsTLSFallback
{
  return self->_allowsTLSFallback;
}

- (BOOL)_allowsPowerNapScheduling
{
  return self->_allowsPowerNapScheduling;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  return self->_allowsExpensiveNetworkAccess;
}

- (BOOL)_allowsUCA
{
  return self->_allowsUCA;
}

- (NSString)_sourceApplicationSecondaryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (BOOL)_requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (BOOL)allowsConstrainedNetworkAccess
{
  return self->_allowsConstrainedNetworkAccess;
}

- (BOOL)_allowsVirtualInterfaces
{
  return self->_allowsVirtualInterfaces;
}

- (NSSet)_suppressedAutoAddedHTTPHeaders
{
  return (NSSet *)objc_getProperty(self, a2, 512, 1);
}

- (unint64_t)_multipathAlternatePort
{
  return self->_multipathAlternatePort;
}

- (unint64_t)_TCPAdaptiveWriteTimeout
{
  return self->_TCPAdaptiveWriteTimeout;
}

- (unint64_t)_TCPAdaptiveReadTimeout
{
  return self->_TCPAdaptiveReadTimeout;
}

- (BOOL)_allowsTLSFalseStart
{
  return self->_allowsTLSFalseStart;
}

- (BOOL)_allowsTLSECH
{
  return self->_allowsTLSECH;
}

- (BOOL)_allowsTLSSessionTickets
{
  return self->_allowsTLSSessionTickets;
}

- (BOOL)_allowsTCPFastOpen
{
  return self->_allowsTCPFastOpen;
}

- (NSData)_atsContext
{
  return (NSData *)objc_getProperty(self, a2, 312, 1);
}

- (NSURLSessionMultipathServiceType)multipathServiceType
{
  return self->_multipathServiceType;
}

- (double)_customReadBufferTimeout
{
  return self->_customReadBufferTimeout;
}

- (unint64_t)_customReadBufferSize
{
  return self->_customReadBufferSize;
}

- (BOOL)shouldUseExtendedBackgroundIdleMode
{
  return self->_shouldUseExtendedBackgroundIdleMode;
}

- (NSString)_attributedBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (unint64_t)_forcedNetworkServiceType
{
  return self->_forcedNetworkServiceType;
}

- (int)_enablesL4SInternal
{
  return self->_enablesL4SInternal;
}

- (NSString)_companionAppBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 472, 1);
}

- (BOOL)_allowsTLSSessionResumption
{
  return self->_allowsTLSSessionResumption;
}

- (BOOL)_allowsResponseMonitoringDuringBodyTranmission
{
  return self->_allowsResponseMonitoringDuringBodyTranmission;
}

- (BOOL)_allowsMultipathTCP
{
  return self->_allowsMultipathTCP;
}

- (BOOL)_allowsIndefiniteConnections
{
  return self->_allowsIndefiniteConnections;
}

- (NSString)_CTDataConnectionServiceType
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (int64_t)_expiredDNSBehavior
{
  return self->_expiredDNSBehavior;
}

- (BOOL)requiresDNSSECValidation
{
  return self->_requiresDNSSECValidation;
}

- (BOOL)_prohibitEncryptedDNS
{
  return self->_prohibitEncryptedDNS;
}

- (int)_allowsHTTP3Internal
{
  return self->_allowsHTTP3Internal;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)_copyAttribute:(__CFString *)a3
{
  v5 = (void *)MEMORY[0x18531D6D0](self, a2);
  int ExactString = _findExactString(a3, 0xEu);
  if (ExactString > 576945453)
  {
    if (ExactString > 580181338)
    {
      if (ExactString <= 583310728)
      {
        if (ExactString != 580181339)
        {
          if (ExactString == 582237560)
          {
            [(NSURLSessionConfiguration *)self timeoutIntervalForRequest];
            unint64_t valuePtr = v7;
            CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            CFNumberType v9 = kCFNumberDoubleType;
LABEL_41:
            v15 = CFNumberCreate(v8, v9, &valuePtr);
            goto LABEL_42;
          }
          goto LABEL_43;
        }
        BOOL v11 = [(NSURLSessionConfiguration *)self _usePipeliningHeuristics];
        goto LABEL_33;
      }
      if (ExactString == 583310729)
      {
        if ([(NSURLSessionConfiguration *)self TLSMaximumSupportedProtocol] == kSSLProtocolUnknown)
        {
LABEL_44:
          v16 = 0;
          goto LABEL_45;
        }
        SSLProtocol v12 = [(NSURLSessionConfiguration *)self TLSMaximumSupportedProtocol];
        goto LABEL_39;
      }
      if (ExactString == 584359324)
      {
        SSLProtocol v12 = [(NSURLSessionConfiguration *)self TLSMinimumSupportedProtocol];
LABEL_39:
        unint64_t valuePtr = v12;
        goto LABEL_40;
      }
LABEL_43:
      CFLog();
      goto LABEL_44;
    }
    switch(ExactString)
    {
      case 576945454:
        NSURLRequestNetworkServiceType v13 = [(NSURLSessionConfiguration *)self networkServiceType];
        break;
      case 577994044:
        NSURLRequestNetworkServiceType v13 = [(NSURLSessionConfiguration *)self requestCachePolicy];
        break;
      case 579091786:
        BOOL v11 = [(NSURLSessionConfiguration *)self _preventsIdleSleep];
LABEL_33:
        v14 = (NSDictionary **)MEMORY[0x1E4F1CFD0];
        if (!v11) {
          v14 = (NSDictionary **)MEMORY[0x1E4F1CFC8];
        }
        v10 = *v14;
        if (!*v14) {
          goto LABEL_44;
        }
        goto LABEL_36;
      default:
        goto LABEL_43;
    }
    goto LABEL_31;
  }
  if (ExactString > 573832445)
  {
    if (ExactString != 573832446)
    {
      if (ExactString == 574864654)
      {
        BOOL v11 = [(NSURLSessionConfiguration *)self HTTPShouldSetCookies];
      }
      else
      {
        if (ExactString != 575937821) {
          goto LABEL_43;
        }
        BOOL v11 = [(NSURLSessionConfiguration *)self HTTPShouldUsePipelining];
      }
      goto LABEL_33;
    }
    NSURLRequestNetworkServiceType v13 = [(NSURLSessionConfiguration *)self HTTPCookieAcceptPolicy];
LABEL_31:
    unint64_t valuePtr = v13;
LABEL_40:
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberType v9 = kCFNumberCFIndexType;
    goto LABEL_41;
  }
  switch(ExactString)
  {
    case 567524525:
      BOOL v11 = [(NSURLSessionConfiguration *)self allowsCellularAccess];
      goto LABEL_33;
    case 569662663:
      v10 = [(NSURLSessionConfiguration *)self connectionProxyDictionary];
      if (!v10) {
        goto LABEL_44;
      }
      break;
    case 572775662:
      v10 = [(NSURLSessionConfiguration *)self HTTPAdditionalHeaders];
      if (!v10) {
        goto LABEL_44;
      }
      break;
    default:
      goto LABEL_43;
  }
LABEL_36:
  v15 = (void *)CFRetain(v10);
LABEL_42:
  v16 = v15;
LABEL_45:
  return v16;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (NSDictionary)HTTPAdditionalHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (NSDictionary)connectionProxyDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (SSLProtocol)TLSMaximumSupportedProtocol
{
  return self->_TLSMaximumSupportedProtocol;
}

- (SSLProtocol)TLSMinimumSupportedProtocol
{
  return self->_TLSMinimumSupportedProtocol;
}

- (NSURLRequestNetworkServiceType)networkServiceType
{
  return self->_networkServiceType;
}

- (BOOL)_preventsIdleSleep
{
  return self->_preventsIdleSleep;
}

- (BOOL)HTTPShouldUsePipelining
{
  return self->_HTTPShouldUsePipelining;
}

- (BOOL)_usePipeliningHeuristics
{
  return self->_usePipeliningHeuristics;
}

- (NSHTTPCookieAcceptPolicy)HTTPCookieAcceptPolicy
{
  return self->_HTTPCookieAcceptPolicy;
}

- (NSTimeInterval)timeoutIntervalForRequest
{
  return self->_timeoutIntervalForRequest;
}

- (NSURLRequestCachePolicy)requestCachePolicy
{
  return self->_requestCachePolicy;
}

- (BOOL)HTTPShouldSetCookies
{
  return self->_HTTPShouldSetCookies;
}

- (BOOL)_disablesNWLoader
{
  return self->_disablesNWLoader;
}

- (BOOL)_usesNWLoader
{
  return self->_usesNWLoader;
}

- (NSString)_tcpConnectionPoolName
{
  return (NSString *)objc_getProperty(self, a2, 448, 1);
}

- (NSDictionary)_socketStreamProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 456, 1);
}

- (BOOL)_forcesNewConnections
{
  return self->_forcesNewConnections;
}

- (BOOL)_reportsDataStalls
{
  return self->_reportsDataStalls;
}

- (NSURL)_directoryForDownloadedFiles
{
  return (NSURL *)objc_getProperty(self, a2, 240, 1);
}

- (BOOL)_allowsHSTSWithUntrustedRootCertificate
{
  return self->_allowsHSTSWithUntrustedRootCertificate;
}

- (BOOL)_duetPreauthorized
{
  return self->_duetPreauthorized;
}

- (BOOL)_allowsRetryForBackgroundDataTasks
{
  return self->_allowsRetryForBackgroundDataTasks;
}

- (BOOL)_alwaysPerformDefaultTrustEvaluation
{
  return self->_alwaysPerformDefaultTrustEvaluation;
}

- (BOOL)isDiscretionary
{
  return self->_discretionary;
}

- (int64_t)_duetPreClearedMode
{
  return self->_duetPreClearedMode;
}

- (NSString)sharedContainerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (NSString)_connectionPoolName
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (NSNumber)_maximumWatchCellularTransferSize
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (BOOL)_onBehalfOfPairedDevice
{
  return self->_onBehalfOfPairedDevice;
}

- (BOOL)_supportsAVAssetDownloads
{
  return self->_supportsAVAssetDownloads;
}

- (int)_xpcActivityBudgeted
{
  return self->_xpcActivityBudgeted;
}

- (NSInteger)HTTPMaximumConnectionsPerHost
{
  return self->_limits.fHTTPLoadWidth;
}

- (BOOL)sessionSendsLaunchEvents
{
  return self->_sessionSendsLaunchEvents;
}

- (BOOL)_prefersInfraWiFi
{
  return self->_prefersInfraWiFi;
}

- (int64_t)_IDSMessageTimeout
{
  return self->_IDSMessageTimeout;
}

- (NSString)_downloadFileProtectionType
{
  return (NSString *)objc_getProperty(self, a2, 536, 1);
}

- (BOOL)_respectsAllowsCellularAccessForDiscretionaryTasks
{
  return self->_respectsAllowsCellularAccessForDiscretionaryTasks;
}

- (BOOL)_infersDiscretionaryFromOriginatingClient
{
  return self->_infersDiscretionaryFromOriginatingClient;
}

- (BOOL)_sessionSendsLaunchOnDemandEvents
{
  return self->_sessionSendsLaunchOnDemandEvents;
}

- (BOOL)_performsEVCertCheck
{
  return self->_performsEVCertCheck;
}

- (BOOL)_clientIsNotExplicitlyDiscretionary
{
  return self->_clientIsNotExplicitlyDiscretionary;
}

- (int)_neTrackerTCCResult
{
  return self->_neTrackerTCCResult;
}

- (BOOL)_ignoreDidReceiveResponseDisposition
{
  return self->_ignoreDidReceiveResponseDisposition;
}

- (NSString)_watchExtensionBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 488, 1);
}

- (NSString)_watchAppBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 480, 1);
}

- (BOOL)_shouldPreserveBackgroundSessionDisposition
{
  return self->_shouldPreserveBackgroundSessionDisposition;
}

- (BOOL)_preventsDirectWiFiAccess
{
  return self->_preventsDirectWiFiAccess;
}

- (BOOL)_enableOAuthBearerTokenChallenges
{
  return self->_enableOAuthBearerTokenChallenges;
}

- (BOOL)_disablesUseOfProxySession
{
  return self->_disablesUseOfProxySession;
}

- (BOOL)_disablesOutOfProcessDirectWiFiUsage
{
  return self->_disablesOutOfProcessDirectWiFiUsage;
}

- (BOOL)_allowTCPIOConnectionStreamTask
{
  return self->_allowTCPIOConnectionStreamTask;
}

- (void)set_timingDataOptions:(int64_t)a3
{
  self->_timingDataOptions = a3;
}

- (void)set_tlsTrustPinningPolicyName:(id)a3
{
}

- (void)set_alwaysPerformDefaultTrustEvaluation:(BOOL)a3
{
  self->_alwaysPerformDefaultTrustEvaluation = a3;
}

- (void)setNetworkServiceType:(NSURLRequestNetworkServiceType)networkServiceType
{
  self->_networkServiceType = networkServiceType;
}

- (void)setHTTPAdditionalHeaders:(NSDictionary *)HTTPAdditionalHeaders
{
}

- (void)set_pidForHAR:(int)a3
{
  self->_pidForHAR = a3;
}

- (char)initWithDisposition:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v14.receiver = a1;
  v14.super_class = (Class)NSURLSessionConfiguration;
  v3 = (char *)objc_msgSendSuper2(&v14, sel_init);
  if (v3)
  {
    v4 = (void *)MEMORY[0x18531D6D0]();
    if ([a2 isEqualToString:0x1EC0A5B48])
    {
      if (mutableGlobalLimits(void)::sOnce != -1) {
        dispatch_once(&mutableGlobalLimits(void)::sOnce, &__block_literal_global_11_12382);
      }
      v5 = &mutableGlobalLimits(void)::gLimits;
    }
    else
    {
      if (defaultConnectionCacheLimits(void)::sOnce != -1) {
        dispatch_once(&defaultConnectionCacheLimits(void)::sOnce, &__block_literal_global_12384);
      }
      v5 = &defaultConnectionCacheLimits(void)::sImmutableLimits;
    }
    uint64_t v6 = *v5;
    uint64_t v7 = *(void *)(v6 + 32);
    long long v8 = *(_OWORD *)(v6 + 16);
    *(_OWORD *)(v3 + 8) = *(_OWORD *)v6;
    *(_OWORD *)(v3 + 24) = v8;
    *((void *)v3 + 5) = v7;
    [v3 setDisposition:a2];
    v3[94] = 0;
    *((void *)v3 + 19) = 0;
    *((void *)v3 + 20) = 0;
    *(_OWORD *)(v3 + 168) = xmmword_1843D1860;
    *((void *)v3 + 23) = 0;
    v3[48] = 1;
    *((void *)v3 + 49) = 0;
    v3[52] = 0;
    *(void *)(v3 + 116) = 4;
    *((void *)v3 + 25) = 0;
    *((void *)v3 + 26) = 2;
    *((void *)v3 + 27) = 0;
    *(_DWORD *)(v3 + 54) = 0x10000;
    *(_DWORD *)(v3 + 95) = 0;
    *((_OWORD *)v3 + 26) = 0u;
    *((_OWORD *)v3 + 27) = 0u;
    *((void *)v3 + 28) = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_defaultProtocolClasses"), "copy");
    *((void *)v3 + 29) = 0;
    *(_WORD *)(v3 + 49) = 257;
    v3[93] = 0;
    v3[51] = 1;
    *((void *)v3 + 42) = 0;
    *(_DWORD *)(v3 + 79) = 65537;
    if (*((void *)v3 + 51) == 0x1EC0A5950)
    {
      *((_DWORD *)v3 + 31) = 3;
    }
    else
    {
      CFNumberType v9 = (void *)nw_context_copy_implicit_context();
      *((_DWORD *)v3 + 31) = nw_context_get_privacy_level();
      if (v9) {
        nw_release(v9);
      }
    }
    v3[60] = 1;
    if (__CFNGetHTTP3Override::onceToken != -1) {
      dispatch_once(&__CFNGetHTTP3Override::onceToken, &__block_literal_global_64_5584);
    }
    if (__CFNGetHTTP3Override::value) {
      int v10 = 1;
    }
    else {
      int v10 = 2;
    }
    if (__CFNGetHTTP3Override::value == 255) {
      int v11 = 0;
    }
    else {
      int v11 = v10;
    }
    *((_DWORD *)v3 + 33) = v11;
    v3[110] = 0;
    SSLProtocol v12 = (StrictSecurityPolicy *)[(id)*MEMORY[0x1E4F28358] copy];
    *((void *)v3 + 67) = v12;
    *((_DWORD *)v3 + 35) = 0;
    *((_WORD *)v3 + 56) = 0;
    v3[99] = 0;
    *((void *)v3 + 39) = StrictSecurityPolicy::CopyATSState(v12);
    *((void *)v3 + 48) = 50;
    *((_DWORD *)v3 + 34) = getpid();
  }
  return v3;
}

+ (id)_defaultProtocolClasses
{
  v3 = (void *)MEMORY[0x1E4F1C978];
  gotLoadHelper_x8__SOErrorDomain(v2);
  uint64_t v5 = *(void *)(v4 + 2112);
  BOOL v6 = v6 || v5 == 0;
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    return (id)objc_msgSend(v3, "arrayWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0, v17);
  }
  else
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    return (id)objc_msgSend(v3, "arrayWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
  }
}

- (void)setDisposition:(id)a3
{
  self->_disposition = (NSString *)a3;
}

- (void)set_allowsTLSSessionTickets:(BOOL)a3
{
  self->_allowsTLSSessionTickets = a3;
}

- (void)set_infersDiscretionaryFromOriginatingClient:(BOOL)a3
{
  self->_infersDiscretionaryFromOriginatingClient = a3;
}

- (void)setTimeoutIntervalForResource:(NSTimeInterval)timeoutIntervalForResource
{
  self->_timeoutIntervalForResource = timeoutIntervalForResource;
}

- (void)set_allowsTCPFastOpen:(BOOL)a3
{
  self->_allowsTCPFastOpen = a3;
}

- (void)setHTTPMaximumConnectionsPerHost:(NSInteger)HTTPMaximumConnectionsPerHost
{
  self->_limits.fHTTPLoadWidth = HTTPMaximumConnectionsPerHost;
}

- (void)set_sourceApplicationBundleIdentifier:(id)a3
{
}

- (void)set_sourceApplicationAuditTokenData:(id)a3
{
  if ([a3 length] == 32)
  {
    self->_sourceApplicationAuditTokenData = (NSData *)[a3 copy];
    [a3 bytes];
    if (!self->_sourceApplicationBundleIdentifier)
    {
      gotLoadHelper_x8__CPCopyBundleIdentifierAndTeamFromAuditToken(v5);
      if (*(void *)(v7 + 3416)) {
        CPCopyBundleIdentifierAndTeamFromAuditToken_delayInitStub(*v6);
      }
    }
  }
  else
  {

    self->_sourceApplicationAuditTokenData = 0;
  }
}

- (void)setAllowsCellularAccess:(BOOL)allowsCellularAccess
{
  self->_allowsCellularAccess = allowsCellularAccess;
}

- (BOOL)_requiresClientToOpenFiles
{
  return self->_requiresClientToOpenFiles;
}

- (void)set_requiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
}

- (void)setTimeoutIntervalForRequest:(NSTimeInterval)timeoutIntervalForRequest
{
  self->_timeoutIntervalForRequest = timeoutIntervalForRequest;
}

- (void)setWaitsForConnectivity:(BOOL)waitsForConnectivity
{
  self->_waitsForConnectivity = waitsForConnectivity;
}

- (void)setTLSMinimumSupportedProtocol:(SSLProtocol)TLSMinimumSupportedProtocol
{
  self->_TLSMinimumSupportedProtocol = TLSMinimumSupportedProtocol;
}

- (void)set_sourceApplicationSecondaryIdentifier:(id)a3
{
}

- (void)set_shouldSkipPreferredClientCertificateLookup:(BOOL)a3
{
  self->_shouldSkipPreferredClientCertificateLookup = a3;
}

- (void)set_preventsIdleSleepOnceConnected:(BOOL)a3
{
  self->_preventsIdleSleepOnceConnected = a3;
}

- (void)set_authenticatorStatusCodes:(id)a3
{
}

- (void)set_allowsPowerNapScheduling:(BOOL)a3
{
  self->_allowsPowerNapScheduling = a3;
}

- (void)setConnectionProxyDictionary:(NSDictionary *)connectionProxyDictionary
{
}

- (void)setAllowsExpensiveNetworkAccess:(BOOL)allowsExpensiveNetworkAccess
{
  self->_allowsExpensiveNetworkAccess = allowsExpensiveNetworkAccess;
}

- (void)set_watchExtensionBundleIdentifier:(id)a3
{
}

- (void)set_reportsDataStalls:(BOOL)a3
{
  self->_reportsDataStalls = a3;
}

- (void)set_onBehalfOfPairedDevice:(BOOL)a3
{
  self->_onBehalfOfPairedDevice = a3;
}

- (void)set_maximumWatchCellularTransferSize:(id)a3
{
}

- (void)set_directoryForDownloadedFiles:(id)a3
{
}

- (void)set_atsContext:(id)a3
{
}

- (void)set_allowsVirtualInterfaces:(BOOL)a3
{
  self->_allowsVirtualInterfaces = a3;
}

- (void)set_TCPAdaptiveWriteTimeout:(unint64_t)a3
{
  self->_TCPAdaptiveWriteTimeout = a3;
}

- (void)set_TCPAdaptiveReadTimeout:(unint64_t)a3
{
  self->_TCPAdaptiveReadTimeout = a3;
}

- (void)setTLSMaximumSupportedProtocol:(SSLProtocol)TLSMaximumSupportedProtocol
{
  self->_TLSMaximumSupportedProtocol = TLSMaximumSupportedProtocol;
}

- (void)setShouldUseExtendedBackgroundIdleMode:(BOOL)shouldUseExtendedBackgroundIdleMode
{
  self->_shouldUseExtendedBackgroundIdleMode = shouldUseExtendedBackgroundIdleMode;
}

- (void)setAllowsConstrainedNetworkAccess:(BOOL)allowsConstrainedNetworkAccess
{
  self->_allowsConstrainedNetworkAccess = allowsConstrainedNetworkAccess;
}

- (void)_setAllowsUCA:(BOOL)a3
{
  self->_allowsUCA = a3;
}

- (void)set_multipathAlternatePort:(unint64_t)a3
{
  self->_multipathAlternatePort = a3;
}

- (void)set_loggingPrivacyLevel:(int)a3
{
  self->_loggingPrivacyLevel = a3;
}

- (void)set_requiresSustainedDataDelivery:(BOOL)a3
{
  self->_requiresSustainedDataDelivery = a3;
}

- (void)set_prefersInfraWiFi:(BOOL)a3
{
  self->_prefersInfraWiFi = a3;
}

- (void)set_duetPreauthorized:(BOOL)a3
{
  self->_duetPreauthorized = a3;
}

- (void)set_duetPreClearedMode:(int64_t)a3
{
  self->_duetPreClearedMode = a3;
}

- (void)set_allowsTLSFalseStart:(BOOL)a3
{
  self->_allowsTLSFalseStart = a3;
}

- (void)set_allowsTLSFallback:(BOOL)a3
{
  self->_allowsTLSFallback = a3;
}

- (void)set_allowsTLSECH:(BOOL)a3
{
  self->_allowsTLSECH = a3;
}

- (void)set_IDSMessageTimeout:(int64_t)a3
{
  self->_IDSMessageTimeout = a3;
}

- (void)setHTTPShouldUsePipelining:(BOOL)HTTPShouldUsePipelining
{
  self->_HTTPShouldUsePipelining = HTTPShouldUsePipelining;
}

- (void)setDiscretionary:(BOOL)discretionary
{
  self->_discretionary = discretionary;
}

- (void)setSessionSendsLaunchEvents:(BOOL)sessionSendsLaunchEvents
{
  self->_sessionSendsLaunchEvents = sessionSendsLaunchEvents;
}

- (void)set_attributedBundleIdentifier:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)set_neTrackerTCCResult:(int)a3
{
  self->_neTrackerTCCResult = a3;
}

- (void)set_forcedNetworkServiceType:(unint64_t)a3
{
  self->_forcedNetworkServiceType = a3;
}

- (void)set_clientIsNotExplicitlyDiscretionary:(BOOL)a3
{
  self->_clientIsNotExplicitlyDiscretionary = a3;
}

- (BOOL)skip_download_unlink
{
  return self->_skip_download_unlink;
}

- (void)set_socketStreamProperties:(id)a3
{
}

- (void)set_disableAPWakeOnIdleConnections:(BOOL)a3
{
  self->_disableAPWakeOnIdleConnections = a3;
}

- (void)setMultipathServiceType:(NSURLSessionMultipathServiceType)multipathServiceType
{
  self->_multipathServiceType = multipathServiceType;
}

- (void)set_supportsAVAssetDownloads:(BOOL)a3
{
  self->_supportsAVAssetDownloads = a3;
}

- (void)setSharedContainerIdentifier:(NSString *)sharedContainerIdentifier
{
}

- (void)set_tcpConnectionPoolName:(id)a3
{
}

- (void)set_longLivedConnectionCachePurgeTimeout:(double)a3
{
  self->_limits.fLongLivedConnectionCachePurgeTimeout = (int)a3;
  if ((int)a3 != 120) {
    self->_limits.fLongLivedConnectionCacheCellPurgeTimeout = (int)a3;
  }
}

- (void)set_connectionCachePurgeTimeout:(double)a3
{
  self->_limits.fHTTPConnectionCachePurgeTimeout = (int)a3;
  if ((int)a3 != 30) {
    self->_limits.fHTTPConnectionCacheCellPurgeTimeout = (int)a3;
  }
}

- (void)set_allowsHSTSWithUntrustedRootCertificate:(BOOL)a3
{
  self->_allowsHSTSWithUntrustedRootCertificate = a3;
}

- (void)setSkip_download_unlink:(BOOL)a3
{
  self->_skip_download_unlink = a3;
}

- (void)set_usesNWLoader:(BOOL)a3
{
  self->_usesNWLoader = a3;
}

- (void)set_sessionSendsLaunchOnDemandEvents:(BOOL)a3
{
  self->_sessionSendsLaunchOnDemandEvents = a3;
}

- (void)set_respectsAllowsCellularAccessForDiscretionaryTasks:(BOOL)a3
{
  self->_respectsAllowsCellularAccessForDiscretionaryTasks = a3;
}

- (void)set_performsEVCertCheck:(BOOL)a3
{
  self->_performsEVCertCheck = a3;
}

- (void)set_connectionPoolName:(id)a3
{
}

- (void)set_allowsRetryForBackgroundDataTasks:(BOOL)a3
{
  self->_allowsRetryForBackgroundDataTasks = a3;
}

- (void)set_expiredDNSBehavior:(int64_t)a3
{
  self->_expiredDNSBehavior = a3;
}

- (void)set_watchAppBundleIdentifier:(id)a3
{
}

- (void)set_prohibitEncryptedDNS:(BOOL)a3
{
  self->_prohibitEncryptedDNS = a3;
}

- (void)set_enablesL4SInternal:(int)a3
{
  self->_enablesL4SInternal = a3;
}

- (void)set_downloadFileProtectionType:(id)a3
{
}

- (void)set_disablesNWLoader:(BOOL)a3
{
  self->_disablesNWLoader = a3;
}

- (void)set_allowsHTTP3Internal:(int)a3
{
  self->_allowsHTTP3Internal = a3;
}

- (void)set_requiresSecureHTTPSProxyConnection:(BOOL)a3
{
  self->_requiresSecureHTTPSProxyConnection = a3;
}

- (void)set_preventsSystemHTTPProxyAuthentication:(BOOL)a3
{
  self->_preventsSystemHTTPProxyAuthentication = a3;
}

- (void)set_preventsAppSSO:(BOOL)a3
{
  self->_preventsAppSSO = a3;
}

- (void)set_xpcActivityBudgeted:(int)a3
{
  self->_xpcActivityBudgeted = a3;
}

- (void)set_shouldPreserveBackgroundSessionDisposition:(BOOL)a3
{
  self->_shouldPreserveBackgroundSessionDisposition = a3;
}

- (void)set_preventsDirectWiFiAccess:(BOOL)a3
{
  self->_preventsDirectWiFiAccess = a3;
}

- (void)set_ignoreDidReceiveResponseDisposition:(BOOL)a3
{
  self->_ignoreDidReceiveResponseDisposition = a3;
}

- (void)set_enableOAuthBearerTokenChallenges:(BOOL)a3
{
  self->_enableOAuthBearerTokenChallenges = a3;
}

- (void)set_disablesUseOfProxySession:(BOOL)a3
{
  self->_disablesUseOfProxySession = a3;
}

- (void)set_disablesOutOfProcessDirectWiFiUsage:(BOOL)a3
{
  self->_disablesOutOfProcessDirectWiFiUsage = a3;
}

- (void)set_customReadBufferTimeout:(double)a3
{
  self->_customReadBufferTimeout = a3;
}

- (void)set_customReadBufferSize:(unint64_t)a3
{
  self->_customReadBufferSize = a3;
}

- (void)set_companionAppBundleIdentifier:(id)a3
{
}

- (void)set_allowsTLSSessionResumption:(BOOL)a3
{
  self->_allowsTLSSessionResumption = a3;
}

- (void)set_allowsResponseMonitoringDuringBodyTranmission:(BOOL)a3
{
  self->_allowsResponseMonitoringDuringBodyTranmission = a3;
}

- (void)set_allowsMultipathTCP:(BOOL)a3
{
  self->_allowsMultipathTCP = a3;
}

- (void)set_allowsIndefiniteConnections:(BOOL)a3
{
  self->_allowsIndefiniteConnections = a3;
}

- (void)set_allowTCPIOConnectionStreamTask:(BOOL)a3
{
  self->_allowTCPIOConnectionStreamTask = a3;
}

- (void)set_CTDataConnectionServiceType:(id)a3
{
}

- (void)setRequiresDNSSECValidation:(BOOL)requiresDNSSECValidation
{
  self->_requiresDNSSECValidation = requiresDNSSECValidation;
}

- (NSDictionary)_overriddenDelegateOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 504, 1);
}

- (void)setBackgroundSession:(BOOL)a3
{
  self->_backgroundSession = a3;
}

- (BOOL)isBackgroundSession
{
  return self->_backgroundSession;
}

- (void)setRequestCachePolicy:(NSURLRequestCachePolicy)requestCachePolicy
{
  self->_requestCachePolicy = requestCachePolicy;
}

- (void)setHTTPShouldSetCookies:(BOOL)HTTPShouldSetCookies
{
  self->_HTTPShouldSetCookies = HTTPShouldSetCookies;
}

- (void)setHTTPCookieAcceptPolicy:(NSHTTPCookieAcceptPolicy)HTTPCookieAcceptPolicy
{
  self->_HTTPCookieAcceptPolicy = HTTPCookieAcceptPolicy;
}

- (BOOL)_overridesBackgroundSessionAutoRedirect
{
  return self->_overridesBackgroundSessionAutoRedirect;
}

- (double)_longLivedConnectionCachePurgeTimeout
{
  return (double)self->_limits.fLongLivedConnectionCachePurgeTimeout;
}

- (double)_longLivedConnectionCacheCellPurgeTimeout
{
  return (double)self->_limits.fLongLivedConnectionCacheCellPurgeTimeout;
}

- (double)_connectionCachePurgeTimeout
{
  return (double)self->_limits.fHTTPConnectionCachePurgeTimeout;
}

- (int64_t)_connectionCacheNumPriorityLevels
{
  return self->_limits.fHTTPPriorityNumLevels;
}

- (int64_t)_connectionCacheNumFastLanes
{
  return self->_limits.fHTTPNumFastLanes;
}

- (int64_t)_connectionCacheMinimumFastLanePriority
{
  return self->_limits.fHTTPMinimumFastLanePriority;
}

- (double)_connectionCacheCellPurgeTimeout
{
  return (double)self->_limits.fHTTPConnectionCacheCellPurgeTimeout;
}

- (void)setProtocolClasses:(NSArray *)protocolClasses
{
}

- (void)set_connectionCacheNumPriorityLevels:(int64_t)a3
{
  if ((int)a3 >= 1) {
    self->_limits.fHTTPPriorityNumLevels = a3;
  }
}

- (void)set_connectionCacheNumFastLanes:(int64_t)a3
{
  if ((a3 & 0x80000000) == 0 && self->_limits.fHTTPLoadWidth > (int)a3) {
    self->_limits.fHTTPNumFastLanes = a3;
  }
}

- (void)set_connectionCacheMinimumFastLanePriority:(int64_t)a3
{
  self->_limits.fHTTPMinimumFastLanePriority = a3;
}

- (void)set_appleIDContext:(id)a3
{
}

- (void)set_usePipeliningHeuristics:(BOOL)a3
{
  self->_usePipeliningHeuristics = a3;
}

- (void)set_requiresClientToOpenFiles:(BOOL)a3
{
  self->_requiresClientToOpenFiles = a3;
}

- (void)set_proxySession:(BOOL)a3
{
  self->_proxySession = a3;
}

- (void)set_preventsIdleSleep:(BOOL)a3
{
  self->_preventsIdleSleep = a3;
}

- (void)set_overridesBackgroundSessionAutoRedirect:(BOOL)a3
{
  self->_overridesBackgroundSessionAutoRedirect = a3;
}

- (void)set_longLivedConnectionCacheCellPurgeTimeout:(double)a3
{
  self->_limits.fLongLivedConnectionCacheCellPurgeTimeout = (int)a3;
}

- (void)set_forcesNewConnections:(BOOL)a3
{
  self->_forcesNewConnections = a3;
}

- (void)set_connectionCacheCellPurgeTimeout:(double)a3
{
  self->_limits.fHTTPConnectionCacheCellPurgeTimeout = (int)a3;
}

- (void)set_suppressedAutoAddedHTTPHeaders:(id)a3
{
}

- (void)set_proxyConfigurations:(id)a3
{
}

- (void)set_overriddenDelegateOptions:(id)a3
{
}

- (NSURLCache)_phskip_urlCache
{
  return (NSURLCache *)objc_getProperty(self, a2, 424, 1);
}

- (_CFHSTSPolicy)copyHSTSPolicy
{
  result = [(_NSHSTSStorage *)[(NSURLSessionConfiguration *)self _hstsStorage] _policyRef];
  if (result)
  {
    return (_CFHSTSPolicy *)CFRetain(result);
  }
  return result;
}

- (_NSHSTSStorage)_phskip_hstsStorage
{
  return (_NSHSTSStorage *)objc_getProperty(self, a2, 440, 1);
}

- (_NSHSTSStorage)_hstsStorage
{
  if (!self->_phskip_hstsStorageSet)
  {
    if (self->_disposition == qword_1EC0A5950) {
      id v3 = [[_NSHSTSStorage alloc] initInMemoryStore];
    }
    else {
      id v3 = +[_NSHSTSStorage sharedPersistentStore];
    }
    [(NSURLSessionConfiguration *)self set_hstsStorage:v3];
  }

  return [(NSURLSessionConfiguration *)self _phskip_hstsStorage];
}

- (void)setURLCache:(NSURLCache *)URLCache
{
  self->_phskip_urlCacheSet = 1;
}

- (void)set_phskip_urlCache:(id)a3
{
}

- (NSURLCredentialStorage)_phskip_credStorage
{
  return (NSURLCredentialStorage *)objc_getProperty(self, a2, 416, 1);
}

- (void)setHTTPCookieStorage:(NSHTTPCookieStorage *)HTTPCookieStorage
{
  self->_phskip_cookieStorageSet = 1;
}

- (void)set_phskip_cookieStorage:(id)a3
{
}

- (void)setURLCredentialStorage:(NSURLCredentialStorage *)URLCredentialStorage
{
  self->_phskip_credStorageSet = 1;
}

- (void)set_phskip_credStorage:(id)a3
{
}

- (NSHTTPCookieStorage)_phskip_cookieStorage
{
  return (NSHTTPCookieStorage *)objc_getProperty(self, a2, 432, 1);
}

- (void)set_hstsStorage:(id)a3
{
  if (self->_disposition == qword_1EC0A5950)
  {
    uint64_t v5 = [a3 _policyRef];
    if (HSTSPolicy::Class(void)::sOnce_HSTSPolicy != -1) {
      dispatch_once(&HSTSPolicy::Class(void)::sOnce_HSTSPolicy, &__block_literal_global_332);
    }
    uint64_t v6 = v5 + 16;
    if (!v5) {
      uint64_t v6 = 0;
    }
    if (*(unsigned char *)(*(void *)(v6 + 16) + 73)) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Ephemeral sessions must use ephemeral HSTS storage." userInfo:0]);
    }
  }
  [(NSURLSessionConfiguration *)self set_phskip_hstsStorage:a3];
  self->_phskip_hstsStorageSet = 1;
}

- (void)set_phskip_hstsStorage:(id)a3
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = xmmword_1843D16C0;
  *(_OWORD *)((char *)self + 24) = xmmword_1843D16D0;
  *((void *)self + 5) = 0x7800000078;
  return self;
}

+ (NSURLSessionConfiguration)defaultSessionConfiguration
{
  if (+[NSURLSessionConfiguration defaultSessionConfiguration]::sOnce != -1) {
    dispatch_once(&+[NSURLSessionConfiguration defaultSessionConfiguration]::sOnce, &__block_literal_global_23396);
  }
  double v2 = (void *)[(id)+[NSURLSessionConfiguration defaultSessionConfiguration]::sDefaultConfiguration copy];

  return (NSURLSessionConfiguration *)v2;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration identifier](self, "identifier"), @"identifier");
  [(NSURLSessionConfiguration *)self timeoutIntervalForRequest];
  objc_msgSend(a3, "encodeDouble:forKey:", @"timeoutIntervalForRequest");
  [(NSURLSessionConfiguration *)self timeoutIntervalForResource];
  objc_msgSend(a3, "encodeDouble:forKey:", @"timeoutIntervalForResource");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration allowsCellularAccess](self, "allowsCellularAccess"), @"allowsCellularAccess");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration allowsExpensiveNetworkAccess](self, "allowsExpensiveNetworkAccess"), @"allowsExpensiveNetworkAccessKey");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration allowsConstrainedNetworkAccess](self, "allowsConstrainedNetworkAccess"), @"allowsConstrainedNetworkAccess");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsUCA](self, "_allowsUCA"), @"_allowsUCA");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsVirtualInterfaces](self, "_allowsVirtualInterfaces"), @"_allowsVirtualInterfaces");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration waitsForConnectivity](self, "waitsForConnectivity"), @"waitsForConnectivity");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration sharedContainerIdentifier](self, "sharedContainerIdentifier"), @"sharedContainerIdentifier");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration isDiscretionary](self, "isDiscretionary"), @"discretionary");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration shouldUseExtendedBackgroundIdleMode](self, "shouldUseExtendedBackgroundIdleMode"), @"shouldUseExtendedBackgroundIdleMode");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration sessionSendsLaunchEvents](self, "sessionSendsLaunchEvents"), @"sessionSendsLaunchEvents");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _sessionSendsLaunchOnDemandEvents](self, "_sessionSendsLaunchOnDemandEvents"), @"_sessionSendsLaunchOnDemandEvents");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration connectionProxyDictionary](self, "connectionProxyDictionary"), @"connectionProxyDictionary");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration TLSMinimumSupportedProtocol](self, "TLSMinimumSupportedProtocol"), @"TLSMinimumSupportedProtocol");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration TLSMaximumSupportedProtocol](self, "TLSMaximumSupportedProtocol"), @"TLSMaximumSupportedProtocol");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration HTTPAdditionalHeaders](self, "HTTPAdditionalHeaders"), @"HTTPAdditionalHeaders");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration HTTPMaximumConnectionsPerHost](self, "HTTPMaximumConnectionsPerHost"), @"HTTPMaximumConnectionsPerHost");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration networkServiceType](self, "networkServiceType"), @"NetworkServiceType");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration multipathServiceType](self, "multipathServiceType"), @"multipathServiceType");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _requiresPowerPluggedIn](self, "_requiresPowerPluggedIn"), @"_requiresPowerPluggedIn");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _directoryForDownloadedFiles](self, "_directoryForDownloadedFiles"), @"_directoryForDownloadedFiles");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _sourceApplicationBundleIdentifier](self, "_sourceApplicationBundleIdentifier"), @"_sourceApplicationBundleIdentifier");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _sourceApplicationSecondaryIdentifier](self, "_sourceApplicationSecondaryIdentifier"), @"_sourceApplicationSecondaryIdentifier");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _sourceApplicationAuditTokenData](self, "_sourceApplicationAuditTokenData"), @"_sourceApplicationAuditTokenData");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _attributedBundleIdentifier](self, "_attributedBundleIdentifier"), @"_attributedBundleIdentifier");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsPowerNapScheduling](self, "_allowsPowerNapScheduling"), @"_allowsPowerNapScheduling");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsHSTSWithUntrustedRootCertificate](self, "_allowsHSTSWithUntrustedRootCertificate"), @"_allowsHSTSWithUntrustedRootCertificate");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsRetryForBackgroundDataTasks](self, "_allowsRetryForBackgroundDataTasks"), @"_allowsRetryForBackgroundDataTasks");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _onBehalfOfPairedDevice](self, "_onBehalfOfPairedDevice"), @"_onBehalfOfPairedDevice");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _clientIsNotExplicitlyDiscretionary](self, "_clientIsNotExplicitlyDiscretionary"), @"_clientIsNotExplicitlyDiscretionary");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _respectsAllowsCellularAccessForDiscretionaryTasks](self, "_respectsAllowsCellularAccessForDiscretionaryTasks"), @"_respectsAllowsCellularAccessForDiscretionaryTasks");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _infersDiscretionaryFromOriginatingClient](self, "_infersDiscretionaryFromOriginatingClient"), @"_infersDiscretionaryFromOriginatingClient");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _connectionPoolName](self, "_connectionPoolName"), @"_connectionPoolName");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsMultipathTCP](self, "_allowsMultipathTCP"), @"_allowsMultipathTCP");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsResponseMonitoringDuringBodyTranmission](self, "_allowsResponseMonitoringDuringBodyTranmission"), @"_allowsResponseMonitoringDuringBodyTranmission");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsIndefiniteConnections](self, "_allowsIndefiniteConnections"), @"_allowsIndefiniteConnections");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _tlsTrustPinningPolicyName](self, "_tlsTrustPinningPolicyName"), @"_tlsTrustPinningPolicyName");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsTLSFallback](self, "_allowsTLSFallback"), @"_allowsTLSFallback");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsTLSECH](self, "_allowsTLSECH"), @"_allowsTLSECH");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _CTDataConnectionServiceType](self, "_CTDataConnectionServiceType"), @"_CTDataConnectionServiceType");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsTCPFastOpen](self, "_allowsTCPFastOpen"), @"_allowsTCPFastOpen");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsTLSSessionTickets](self, "_allowsTLSSessionTickets"), @"_allowsTLSSessionTickets");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsTLSSessionResumption](self, "_allowsTLSSessionResumption"), @"_allowsTLSSessionResumption");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowsTLSFalseStart](self, "_allowsTLSFalseStart"), @"_allowsTLSFalseStart");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration _TCPAdaptiveReadTimeout](self, "_TCPAdaptiveReadTimeout"), @"_TCPAdaptiveReadTimeout");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration _TCPAdaptiveWriteTimeout](self, "_TCPAdaptiveWriteTimeout"), @"_TCPAdaptiveWriteTimeout");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _reportsDataStalls](self, "_reportsDataStalls"), @"_reportsDataStalls");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration _customReadBufferSize](self, "_customReadBufferSize"), @"_customReadBufferSize");
  [(NSURLSessionConfiguration *)self _customReadBufferTimeout];
  objc_msgSend(a3, "encodeDouble:forKey:", @"_customReadBufferTimeout");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _preventsSystemHTTPProxyAuthentication](self, "_preventsSystemHTTPProxyAuthentication"), @"_preventsSystemHTTPProxyAuthentication");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _requiresSecureHTTPSProxyConnection](self, "_requiresSecureHTTPSProxyConnection"), @"_requiresSecureHTTPSProxyConnection");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _preventsAppSSO](self, "_preventsAppSSO"), @"_preventsAppSSO");
  objc_msgSend(a3, "encodeInt:forKey:", -[NSURLSessionConfiguration _loggingPrivacyLevel](self, "_loggingPrivacyLevel"), @"_loggingPrivacyLevel");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _duetPreauthorized](self, "_duetPreauthorized"), @"_duetPreauthorized");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration _duetPreClearedMode](self, "_duetPreClearedMode"), @"_duetPreClearedMode");
  objc_msgSend(a3, "encodeInt:forKey:", -[NSURLSessionConfiguration _xpcActivityBudgeted](self, "_xpcActivityBudgeted"), @"_xpcActivityBudgeted");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _requiresSustainedDataDelivery](self, "_requiresSustainedDataDelivery"), @"_requiresSustainedDataDelivery");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration _IDSMessageTimeout](self, "_IDSMessageTimeout"), @"_IDSMessageTimeout");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _ignoreDidReceiveResponseDisposition](self, "_ignoreDidReceiveResponseDisposition"), @"_ignoreDidReceiveResponseDisposition");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _alwaysPerformDefaultTrustEvaluation](self, "_alwaysPerformDefaultTrustEvaluation"), @"_alwaysPerformDefaultTrustEvaluation");
  objc_msgSend(a3, "encodeInt64:forKey:", -[NSURLSessionConfiguration _expiredDNSBehavior](self, "_expiredDNSBehavior"), @"_expiredDNSBehavior");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration requiresDNSSECValidation](self, "requiresDNSSECValidation"), @"requiresDNSSECValidation");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _enableOAuthBearerTokenChallenges](self, "_enableOAuthBearerTokenChallenges"), @"_enableOAuthBearerTokenChallenges");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _supportsAVAssetDownloads](self, "_supportsAVAssetDownloads"), @"_supportsAVAssetDownloads");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _prefersInfraWiFi](self, "_prefersInfraWiFi"), @"_prefersInfraWiFi");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _shouldPreserveBackgroundSessionDisposition](self, "_shouldPreserveBackgroundSessionDisposition"), @"_shouldPreserveBackgroundSessionDisposition");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _disablesOutOfProcessDirectWiFiUsage](self, "_disablesOutOfProcessDirectWiFiUsage"), @"_disablesOutOfProcessDirectWiFiUsage");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _disablesUseOfProxySession](self, "_disablesUseOfProxySession"), @"_disablesUseOfProxySession");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _preventsDirectWiFiAccess](self, "_preventsDirectWiFiAccess"), @"_preventsDirectWiFiAccess");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _allowTCPIOConnectionStreamTask](self, "_allowTCPIOConnectionStreamTask"), @"_allowTCPIOConnectionStreamTask");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _preventsIdleSleepOnceConnected](self, "_preventsIdleSleepOnceConnected"), @"_preventsIdleSleepOnceConnected");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _shouldSkipPreferredClientCertificateLookup](self, "_shouldSkipPreferredClientCertificateLookup"), @"_shouldSkipPreferredClientCertificateLookup");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _performsEVCertCheck](self, "_performsEVCertCheck"), @"_performsEVCertCheck");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _authenticatorStatusCodes](self, "_authenticatorStatusCodes"), @"_authenticatorStatusCodes");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _atsContext](self, "_atsContext"), @"_atsContext");
  objc_msgSend(a3, "encodeInt64:forKey:", -[NSURLSessionConfiguration _timingDataOptions](self, "_timingDataOptions"), @"_timingDataOptions");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _companionAppBundleIdentifier](self, "_companionAppBundleIdentifier"), @"_companionAppBundleIdentifier");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _watchAppBundleIdentifier](self, "_watchAppBundleIdentifier"), @"_watchAppBundleIdentifier");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _watchExtensionBundleIdentifier](self, "_watchExtensionBundleIdentifier"), @"_watchExtensionBundleIdentifier");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration _forcedNetworkServiceType](self, "_forcedNetworkServiceType"), @"_forcedNetworkServiceType");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _maximumWatchCellularTransferSize](self, "_maximumWatchCellularTransferSize"), @"_maximumWatchCellularTransferSize");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSURLSessionConfiguration _multipathAlternatePort](self, "_multipathAlternatePort"), @"_multipathAlternatePort");
  objc_msgSend(a3, "encodeInt:forKey:", -[NSURLSessionConfiguration _allowsHTTP3Internal](self, "_allowsHTTP3Internal"), @"_allowsHTTP3Internal");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _usesNWLoader](self, "_usesNWLoader"), @"_usesNWLoader");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _disablesNWLoader](self, "_disablesNWLoader"), @"_disablesNWLoader");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLSessionConfiguration _downloadFileProtectionType](self, "_downloadFileProtectionType"), @"_downloadFileProtectionType");
  objc_msgSend(a3, "encodeInt:forKey:", -[NSURLSessionConfiguration _enablesL4SInternal](self, "_enablesL4SInternal"), @"_enablesL4SInternal");
  objc_msgSend(a3, "encodeBool:forKey:", -[NSURLSessionConfiguration _prohibitEncryptedDNS](self, "_prohibitEncryptedDNS"), @"_prohibitEncryptedDNS");
  objc_msgSend(a3, "encodeInt:forKey:", -[NSURLSessionConfiguration _neTrackerTCCResult](self, "_neTrackerTCCResult"), @"_neTrackerTCCResult");
  BOOL v5 = [(NSURLSessionConfiguration *)self _disableAPWakeOnIdleConnections];

  [a3 encodeBool:v5 forKey:@"_disableAPWakeOnIdleConnections"];
}

- (NSURLSessionConfiguration)initWithCoder:(id)a3
{
  uint64_t v4 = (NSURLSessionConfiguration *)-[NSURLSessionConfiguration initWithDisposition:](self, &unk_1EC0A5918);
  if (v4)
  {
    -[NSURLSessionConfiguration setIdentifier:](v4, "setIdentifier:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"]);
    [a3 decodeDoubleForKey:@"timeoutIntervalForRequest"];
    [(NSURLSessionConfiguration *)v4 setTimeoutIntervalForRequest:"setTimeoutIntervalForRequest:"];
    [a3 decodeDoubleForKey:@"timeoutIntervalForResource"];
    [(NSURLSessionConfiguration *)v4 setTimeoutIntervalForResource:"setTimeoutIntervalForResource:"];
    -[NSURLSessionConfiguration setAllowsCellularAccess:](v4, "setAllowsCellularAccess:", [a3 decodeBoolForKey:@"allowsCellularAccess"]);
    if ([a3 containsValueForKey:@"allowsExpensiveNetworkAccessKey"]) {
      -[NSURLSessionConfiguration setAllowsExpensiveNetworkAccess:](v4, "setAllowsExpensiveNetworkAccess:", [a3 decodeBoolForKey:@"allowsExpensiveNetworkAccessKey"]);
    }
    -[NSURLSessionConfiguration setWaitsForConnectivity:](v4, "setWaitsForConnectivity:", [a3 decodeBoolForKey:@"waitsForConnectivity"]);
    -[NSURLSessionConfiguration setDiscretionary:](v4, "setDiscretionary:", [a3 decodeBoolForKey:@"discretionary"]);
    -[NSURLSessionConfiguration setShouldUseExtendedBackgroundIdleMode:](v4, "setShouldUseExtendedBackgroundIdleMode:", [a3 decodeBoolForKey:@"shouldUseExtendedBackgroundIdleMode"]);
    -[NSURLSessionConfiguration setSharedContainerIdentifier:](v4, "setSharedContainerIdentifier:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"sharedContainerIdentifier"]);
    -[NSURLSessionConfiguration setSessionSendsLaunchEvents:](v4, "setSessionSendsLaunchEvents:", [a3 decodeBoolForKey:@"sessionSendsLaunchEvents"]);
    -[NSURLSessionConfiguration set_sessionSendsLaunchOnDemandEvents:](v4, "set_sessionSendsLaunchOnDemandEvents:", [a3 decodeBoolForKey:@"_sessionSendsLaunchOnDemandEvents"]);
    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    -[NSURLSessionConfiguration setConnectionProxyDictionary:](v4, "setConnectionProxyDictionary:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v20, "setWithObjects:", v19, v18, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0), @"connectionProxyDictionary"));
    -[NSURLSessionConfiguration setTLSMinimumSupportedProtocol:](v4, "setTLSMinimumSupportedProtocol:", [a3 decodeIntegerForKey:@"TLSMinimumSupportedProtocol"]);
    -[NSURLSessionConfiguration setTLSMaximumSupportedProtocol:](v4, "setTLSMaximumSupportedProtocol:", [a3 decodeIntegerForKey:@"TLSMaximumSupportedProtocol"]);
    -[NSURLSessionConfiguration setHTTPAdditionalHeaders:](v4, "setHTTPAdditionalHeaders:", [a3 decodePropertyListForKey:@"HTTPAdditionalHeaders"]);
    -[NSURLSessionConfiguration setHTTPMaximumConnectionsPerHost:](v4, "setHTTPMaximumConnectionsPerHost:", [a3 decodeIntegerForKey:@"HTTPMaximumConnectionsPerHost"]);
    -[NSURLSessionConfiguration setNetworkServiceType:](v4, "setNetworkServiceType:", [a3 decodeIntegerForKey:@"NetworkServiceType"]);
    -[NSURLSessionConfiguration setMultipathServiceType:](v4, "setMultipathServiceType:", [a3 decodeIntegerForKey:@"multipathServiceType"]);
    -[NSURLSessionConfiguration set_requiresPowerPluggedIn:](v4, "set_requiresPowerPluggedIn:", [a3 decodeBoolForKey:@"_requiresPowerPluggedIn"]);
    -[NSURLSessionConfiguration set_directoryForDownloadedFiles:](v4, "set_directoryForDownloadedFiles:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"_directoryForDownloadedFiles"]);
    -[NSURLSessionConfiguration set_sourceApplicationBundleIdentifier:](v4, "set_sourceApplicationBundleIdentifier:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceApplicationBundleIdentifier"]);
    -[NSURLSessionConfiguration set_sourceApplicationSecondaryIdentifier:](v4, "set_sourceApplicationSecondaryIdentifier:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceApplicationSecondaryIdentifier"]);
    -[NSURLSessionConfiguration set_sourceApplicationAuditTokenData:](v4, "set_sourceApplicationAuditTokenData:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceApplicationAuditTokenData"]);
    -[NSURLSessionConfiguration set_attributedBundleIdentifier:](v4, "set_attributedBundleIdentifier:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"_attributedBundleIdentifier"]);
    -[NSURLSessionConfiguration set_allowsRetryForBackgroundDataTasks:](v4, "set_allowsRetryForBackgroundDataTasks:", [a3 decodeBoolForKey:@"_allowsRetryForBackgroundDataTasks"]);
    -[NSURLSessionConfiguration set_onBehalfOfPairedDevice:](v4, "set_onBehalfOfPairedDevice:", [a3 decodeBoolForKey:@"_onBehalfOfPairedDevice"]);
    -[NSURLSessionConfiguration set_clientIsNotExplicitlyDiscretionary:](v4, "set_clientIsNotExplicitlyDiscretionary:", [a3 decodeBoolForKey:@"_clientIsNotExplicitlyDiscretionary"]);
    -[NSURLSessionConfiguration set_respectsAllowsCellularAccessForDiscretionaryTasks:](v4, "set_respectsAllowsCellularAccessForDiscretionaryTasks:", [a3 decodeBoolForKey:@"_respectsAllowsCellularAccessForDiscretionaryTasks"]);
    -[NSURLSessionConfiguration set_infersDiscretionaryFromOriginatingClient:](v4, "set_infersDiscretionaryFromOriginatingClient:", [a3 decodeBoolForKey:@"_infersDiscretionaryFromOriginatingClient"]);
    -[NSURLSessionConfiguration set_connectionPoolName:](v4, "set_connectionPoolName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"_connectionPoolName"]);
    -[NSURLSessionConfiguration set_allowsPowerNapScheduling:](v4, "set_allowsPowerNapScheduling:", [a3 decodeBoolForKey:@"_allowsPowerNapScheduling"]);
    if ([a3 containsValueForKey:@"allowsConstrainedNetworkAccess"]) {
      -[NSURLSessionConfiguration setAllowsConstrainedNetworkAccess:](v4, "setAllowsConstrainedNetworkAccess:", [a3 decodeBoolForKey:@"allowsConstrainedNetworkAccess"]);
    }
    if ([a3 containsValueForKey:@"_allowsUCA"]) {
      -[NSURLSessionConfiguration _setAllowsUCA:](v4, "_setAllowsUCA:", [a3 decodeBoolForKey:@"_allowsUCA"]);
    }
    if ([a3 containsValueForKey:@"_allowsVirtualInterfaces"]) {
      -[NSURLSessionConfiguration set_allowsVirtualInterfaces:](v4, "set_allowsVirtualInterfaces:", [a3 decodeBoolForKey:@"_allowsVirtualInterfaces"]);
    }
    -[NSURLSessionConfiguration set_allowsMultipathTCP:](v4, "set_allowsMultipathTCP:", [a3 decodeBoolForKey:@"_allowsMultipathTCP"]);
    -[NSURLSessionConfiguration set_allowsResponseMonitoringDuringBodyTranmission:](v4, "set_allowsResponseMonitoringDuringBodyTranmission:", [a3 decodeBoolForKey:@"_allowsResponseMonitoringDuringBodyTranmission"]);
    -[NSURLSessionConfiguration set_allowsIndefiniteConnections:](v4, "set_allowsIndefiniteConnections:", [a3 decodeBoolForKey:@"_allowsIndefiniteConnections"]);
    -[NSURLSessionConfiguration set_allowsTCPFastOpen:](v4, "set_allowsTCPFastOpen:", [a3 decodeBoolForKey:@"_allowsTCPFastOpen"]);
    -[NSURLSessionConfiguration set_allowsTLSSessionTickets:](v4, "set_allowsTLSSessionTickets:", [a3 decodeBoolForKey:@"_allowsTLSSessionTickets"]);
    -[NSURLSessionConfiguration set_allowsTLSSessionResumption:](v4, "set_allowsTLSSessionResumption:", [a3 decodeBoolForKey:@"_allowsTLSSessionResumption"]);
    if ([a3 containsValueForKey:@"_allowsTLSFalseStart"]) {
      -[NSURLSessionConfiguration set_allowsTLSFalseStart:](v4, "set_allowsTLSFalseStart:", [a3 decodeBoolForKey:@"_allowsTLSFalseStart"]);
    }
    -[NSURLSessionConfiguration set_tlsTrustPinningPolicyName:](v4, "set_tlsTrustPinningPolicyName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"_tlsTrustPinningPolicyName"]);
    if ([a3 containsValueForKey:@"_allowsTLSFallback"]) {
      -[NSURLSessionConfiguration set_allowsTLSFallback:](v4, "set_allowsTLSFallback:", [a3 decodeBoolForKey:@"_allowsTLSFallback"]);
    }
    if ([a3 containsValueForKey:@"_allowsTLSECH"]) {
      -[NSURLSessionConfiguration set_allowsTLSECH:](v4, "set_allowsTLSECH:", [a3 decodeBoolForKey:@"_allowsTLSECH"]);
    }
    if ([a3 containsValueForKey:@"_reportsDataStalls"]) {
      -[NSURLSessionConfiguration set_reportsDataStalls:](v4, "set_reportsDataStalls:", [a3 decodeBoolForKey:@"_reportsDataStalls"]);
    }
    -[NSURLSessionConfiguration set_TCPAdaptiveReadTimeout:](v4, "set_TCPAdaptiveReadTimeout:", [a3 decodeIntegerForKey:@"_TCPAdaptiveReadTimeout"]);
    -[NSURLSessionConfiguration set_TCPAdaptiveWriteTimeout:](v4, "set_TCPAdaptiveWriteTimeout:", [a3 decodeIntegerForKey:@"_TCPAdaptiveWriteTimeout"]);
    -[NSURLSessionConfiguration set_customReadBufferSize:](v4, "set_customReadBufferSize:", [a3 decodeIntegerForKey:@"_customReadBufferSize"]);
    [a3 decodeDoubleForKey:@"_customReadBufferTimeout"];
    [(NSURLSessionConfiguration *)v4 set_customReadBufferTimeout:"set_customReadBufferTimeout:"];
    -[NSURLSessionConfiguration set_preventsSystemHTTPProxyAuthentication:](v4, "set_preventsSystemHTTPProxyAuthentication:", [a3 decodeBoolForKey:@"_preventsSystemHTTPProxyAuthentication"]);
    -[NSURLSessionConfiguration set_requiresSecureHTTPSProxyConnection:](v4, "set_requiresSecureHTTPSProxyConnection:", [a3 decodeBoolForKey:@"_requiresSecureHTTPSProxyConnection"]);
    -[NSURLSessionConfiguration set_preventsAppSSO:](v4, "set_preventsAppSSO:", [a3 decodeBoolForKey:@"_preventsAppSSO"]);
    if ([a3 containsValueForKey:@"_loggingPrivacyLevel"]) {
      -[NSURLSessionConfiguration set_loggingPrivacyLevel:](v4, "set_loggingPrivacyLevel:", [a3 decodeIntForKey:@"_loggingPrivacyLevel"]);
    }
    -[NSURLSessionConfiguration set_duetPreauthorized:](v4, "set_duetPreauthorized:", [a3 decodeBoolForKey:@"_duetPreauthorized"]);
    -[NSURLSessionConfiguration set_duetPreClearedMode:](v4, "set_duetPreClearedMode:", [a3 decodeIntegerForKey:@"_duetPreClearedMode"]);
    -[NSURLSessionConfiguration set_xpcActivityBudgeted:](v4, "set_xpcActivityBudgeted:", [a3 decodeIntForKey:@"_xpcActivityBudgeted"]);
    -[NSURLSessionConfiguration set_requiresSustainedDataDelivery:](v4, "set_requiresSustainedDataDelivery:", [a3 decodeBoolForKey:@"_requiresSustainedDataDelivery"]);
    uint64_t v12 = [a3 decodeIntegerForKey:@"_IDSMessageTimeout"];
    if (v12 >= 1) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 50;
    }
    [(NSURLSessionConfiguration *)v4 set_IDSMessageTimeout:v13];
    -[NSURLSessionConfiguration set_ignoreDidReceiveResponseDisposition:](v4, "set_ignoreDidReceiveResponseDisposition:", [a3 decodeBoolForKey:@"_ignoreDidReceiveResponseDisposition"]);
    -[NSURLSessionConfiguration set_alwaysPerformDefaultTrustEvaluation:](v4, "set_alwaysPerformDefaultTrustEvaluation:", [a3 decodeBoolForKey:@"_alwaysPerformDefaultTrustEvaluation"]);
    -[NSURLSessionConfiguration set_expiredDNSBehavior:](v4, "set_expiredDNSBehavior:", [a3 decodeInt64ForKey:@"_expiredDNSBehavior"]);
    -[NSURLSessionConfiguration setRequiresDNSSECValidation:](v4, "setRequiresDNSSECValidation:", [a3 decodeBoolForKey:@"requiresDNSSECValidation"]);
    -[NSURLSessionConfiguration set_enableOAuthBearerTokenChallenges:](v4, "set_enableOAuthBearerTokenChallenges:", [a3 decodeBoolForKey:@"_enableOAuthBearerTokenChallenges"]);
    -[NSURLSessionConfiguration set_supportsAVAssetDownloads:](v4, "set_supportsAVAssetDownloads:", [a3 decodeBoolForKey:@"_supportsAVAssetDownloads"]);
    -[NSURLSessionConfiguration set_CTDataConnectionServiceType:](v4, "set_CTDataConnectionServiceType:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"_CTDataConnectionServiceType"]);
    -[NSURLSessionConfiguration set_prefersInfraWiFi:](v4, "set_prefersInfraWiFi:", [a3 decodeBoolForKey:@"_prefersInfraWiFi"]);
    -[NSURLSessionConfiguration set_shouldPreserveBackgroundSessionDisposition:](v4, "set_shouldPreserveBackgroundSessionDisposition:", [a3 decodeBoolForKey:@"_shouldPreserveBackgroundSessionDisposition"]);
    -[NSURLSessionConfiguration set_disablesOutOfProcessDirectWiFiUsage:](v4, "set_disablesOutOfProcessDirectWiFiUsage:", [a3 decodeBoolForKey:@"_disablesOutOfProcessDirectWiFiUsage"]);
    -[NSURLSessionConfiguration set_disablesUseOfProxySession:](v4, "set_disablesUseOfProxySession:", [a3 decodeBoolForKey:@"_disablesUseOfProxySession"]);
    -[NSURLSessionConfiguration set_preventsDirectWiFiAccess:](v4, "set_preventsDirectWiFiAccess:", [a3 decodeBoolForKey:@"_preventsDirectWiFiAccess"]);
    -[NSURLSessionConfiguration set_allowTCPIOConnectionStreamTask:](v4, "set_allowTCPIOConnectionStreamTask:", [a3 decodeBoolForKey:@"_allowTCPIOConnectionStreamTask"]);
    -[NSURLSessionConfiguration set_preventsIdleSleepOnceConnected:](v4, "set_preventsIdleSleepOnceConnected:", [a3 decodeBoolForKey:@"_preventsIdleSleepOnceConnected"]);
    -[NSURLSessionConfiguration set_shouldSkipPreferredClientCertificateLookup:](v4, "set_shouldSkipPreferredClientCertificateLookup:", [a3 decodeBoolForKey:@"_shouldSkipPreferredClientCertificateLookup"]);
    -[NSURLSessionConfiguration set_performsEVCertCheck:](v4, "set_performsEVCertCheck:", [a3 decodeBoolForKey:@"_performsEVCertCheck"]);
    uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    -[NSURLSessionConfiguration set_authenticatorStatusCodes:](v4, "set_authenticatorStatusCodes:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0), @"_authenticatorStatusCodes"));
    uint64_t v16 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"_atsContext"];
    if (v16) {
      [(NSURLSessionConfiguration *)v4 set_atsContext:v16];
    }
    if (![(NSURLSessionConfiguration *)v4 _atsContext]
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Must have an ATS Context now", buf, 2u);
    }
    -[NSURLSessionConfiguration set_timingDataOptions:](v4, "set_timingDataOptions:", [a3 decodeInt64ForKey:@"_timingDataOptions"]);
    -[NSURLSessionConfiguration set_companionAppBundleIdentifier:](v4, "set_companionAppBundleIdentifier:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"_companionAppBundleIdentifier"]);
    -[NSURLSessionConfiguration set_watchAppBundleIdentifier:](v4, "set_watchAppBundleIdentifier:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"_watchAppBundleIdentifier"]);
    -[NSURLSessionConfiguration set_watchExtensionBundleIdentifier:](v4, "set_watchExtensionBundleIdentifier:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"_watchExtensionBundleIdentifier"]);
    -[NSURLSessionConfiguration set_forcedNetworkServiceType:](v4, "set_forcedNetworkServiceType:", [a3 decodeIntegerForKey:@"_forcedNetworkServiceType"]);
    -[NSURLSessionConfiguration set_maximumWatchCellularTransferSize:](v4, "set_maximumWatchCellularTransferSize:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"_maximumWatchCellularTransferSize"]);
    -[NSURLSessionConfiguration set_multipathAlternatePort:](v4, "set_multipathAlternatePort:", [a3 decodeIntegerForKey:@"_multipathAlternatePort"]);
    -[NSURLSessionConfiguration set_allowsHTTP3Internal:](v4, "set_allowsHTTP3Internal:", [a3 decodeIntForKey:@"_allowsHTTP3Internal"]);
    -[NSURLSessionConfiguration set_usesNWLoader:](v4, "set_usesNWLoader:", [a3 decodeBoolForKey:@"_usesNWLoader"]);
    -[NSURLSessionConfiguration set_disablesNWLoader:](v4, "set_disablesNWLoader:", [a3 decodeBoolForKey:@"_disablesNWLoader"]);
    -[NSURLSessionConfiguration set_downloadFileProtectionType:](v4, "set_downloadFileProtectionType:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"_downloadFileProtectionType"]);
    [(NSURLSessionConfiguration *)v4 set_pidForHAR:0];
    -[NSURLSessionConfiguration set_enablesL4SInternal:](v4, "set_enablesL4SInternal:", [a3 decodeIntForKey:@"_enablesL4SInternal"]);
    -[NSURLSessionConfiguration set_prohibitEncryptedDNS:](v4, "set_prohibitEncryptedDNS:", [a3 decodeBoolForKey:@"_prohibitEncryptedDNS"]);
    -[NSURLSessionConfiguration set_neTrackerTCCResult:](v4, "set_neTrackerTCCResult:", [a3 decodeIntForKey:@"_neTrackerTCCResult"]);
    -[NSURLSessionConfiguration set_disableAPWakeOnIdleConnections:](v4, "set_disableAPWakeOnIdleConnections:", [a3 decodeBoolForKey:@"_disableAPWakeOnIdleConnections"]);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)set_alternativeServicesStorage:(id)a3
{
  self->_phskip_alternativeServicesStorageSet = 1;
}

- (void)set_phskip_alternativeServicesStorage:(id)a3
{
}

- (NSString)disposition
{
  return self->_disposition;
}

- (BOOL)_isProxySession
{
  return self->_proxySession;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionConfiguration;
  [(NSURLSessionConfiguration *)&v3 dealloc];
}

- (_NSHTTPAlternativeServicesStorage)_phskip_alternativeServicesStorage
{
  return (_NSHTTPAlternativeServicesStorage *)objc_getProperty(self, a2, 528, 1);
}

- (_NSHTTPAlternativeServicesStorage)_alternativeServicesStorage
{
  if (self->_phskip_alternativeServicesStorageSet)
  {
    return [(NSURLSessionConfiguration *)self _phskip_alternativeServicesStorage];
  }
  else
  {
    if (self->_disposition == qword_1EC0A5950) {
      result = [[_NSHTTPAlternativeServicesStorage alloc] initInMemoryStore];
    }
    else {
      result = (_NSHTTPAlternativeServicesStorage *)+[_NSHTTPAlternativeServicesStorage sharedPersistentStore];
    }
    self->_phskip_alternativeServicesStorage = result;
    self->_phskip_alternativeServicesStorageSet = 1;
  }
  return result;
}

+ (id)immutableEffectiveConfigurationFromConfig:(id)a3
{
  objc_super v3 = (void *)[a3 copy];

  return v3;
}

- (NSURLCredentialStorage)URLCredentialStorage
{
  if (self->_phskip_credStorageSet) {
    return [(NSURLSessionConfiguration *)self _phskip_credStorage];
  }
  else {
    return +[NSURLCredentialStorage sharedCredentialStorage];
  }
}

- (id)copyImmutableVariant:(id)a3
{
  uint64_t v4 = (void *)[(NSURLSessionConfiguration *)self copy];
  if (a3) {
    (*((void (**)(id, void *))a3 + 2))(a3, v4);
  }
  return v4;
}

- (NSURLCache)URLCache
{
  if (self->_phskip_urlCacheSet) {
    return [(NSURLSessionConfiguration *)self _phskip_urlCache];
  }
  else {
    return +[NSURLCache sharedURLCache];
  }
}

- (BOOL)_allowsExpensiveAccess
{
  return self->_allowsExpensiveNetworkAccess;
}

- (NSHTTPCookieStorage)HTTPCookieStorage
{
  if (self->_phskip_cookieStorageSet) {
    return [(NSURLSessionConfiguration *)self _phskip_cookieStorage];
  }
  else {
    return +[NSHTTPCookieStorage sharedHTTPCookieStorage];
  }
}

+ (void)initialize
{
  if (self == a1)
  {
    [MEMORY[0x1E4F28DC0] setClass:objc_opt_class() forClassName:@"__NSCFURLSessionConfiguration"];
    [MEMORY[0x1E4F28DC0] setClass:objc_opt_class() forClassName:@"__NSCFURLSessionConfiguration_Mutable"];
    double v2 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v3 = objc_opt_class();
    [v2 setClass:v3 forClassName:@"__NSCFURLSessionConfiguration_Immutable"];
  }
}

- (void)set_allowsExpensiveAccess:(BOOL)a3
{
  self->_allowsExpensiveNetworkAccess = a3;
}

- (void)set_allowsConstrainedNetworkAccess:(BOOL)a3
{
  self->_allowsConstrainedNetworkAccess = a3;
}

+ (id)sessionConfigurationForSharedSession
{
  if (+[NSURLSessionConfiguration sessionConfigurationForSharedSession]::sOnce != -1) {
    dispatch_once(&+[NSURLSessionConfiguration sessionConfigurationForSharedSession]::sOnce, &__block_literal_global_34_23394);
  }
  double v2 = (void *)[(id)+[NSURLSessionConfiguration sessionConfigurationForSharedSession]::sSharedConfiguration copy];

  return v2;
}

- (HTTPConnectionCacheLimits)getConnectionCacheLimits
{
  long long v3 = *(_OWORD *)&self->fHTTPConnectionCachePurgeTimeout;
  *(_OWORD *)&retstr->fHTTPLoadWidth = *(_OWORD *)&self->fHTTPPipeliningLowWatermark;
  *(_OWORD *)&retstr->fHTTPNumFastLanes = v3;
  *(void *)&retstr->fLongLivedConnectionCachePurgeTimeout = *(void *)&self[1].fHTTPLoadWidth;
  return self;
}

- (BOOL)proxiesRequireNWLoader
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  proxyConfigurations = self->_proxyConfigurations;
  uint64_t v3 = [(NSArray *)proxyConfigurations countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(proxyConfigurations);
        }
        if (nw_proxy_config_stack_requires_http_protocols())
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [(NSArray *)proxyConfigurations countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

char *__56__NSURLSessionConfiguration_defaultSessionConfiguration__block_invoke()
{
  result = -[NSURLSessionConfiguration initWithDisposition:]([NSURLSessionConfiguration alloc], &unk_1EC0A5918);
  +[NSURLSessionConfiguration defaultSessionConfiguration]::sDefaultConfiguration = (uint64_t)result;
  return result;
}

- (void)set_allowsHTTP3:(BOOL)a3
{
  if (a3) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  self->_allowsHTTP3Internal = v3;
}

- (id)_initWithConfiguration:(id)a3
{
  return a3;
}

+ (NSURLSessionConfiguration)ephemeralSessionConfiguration
{
  double v2 = -[NSURLSessionConfiguration initWithDisposition:]([NSURLSessionConfiguration alloc], qword_1EC0A5950);
  if (newCookieStorageEnabled(void)::onceToken != -1) {
    dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1187);
  }
  if (newCookieStorageEnabled(void)::enabled) {
    int v3 = -[NSHTTPCookieStorageToCookie2Storage initMemoryCookieStore]([NSHTTPCookieStorageToCookie2Storage alloc]);
  }
  else {
    int v3 = objc_opt_new();
  }
  [v2 setHTTPCookieStorage:v3];
  if (dyld_program_sdk_at_least()) {
    uint64_t v4 = 512000;
  }
  else {
    uint64_t v4 = 0;
  }
  objc_msgSend(v2, "setURLCache:", -[NSURLCache initWithMemoryCapacity:diskCapacity:diskPath:]([NSURLCache alloc], "initWithMemoryCapacity:diskCapacity:diskPath:", v4, 0, 0));
  [v2 setURLCredentialStorage:(id)objc_opt_new()];

  return (NSURLSessionConfiguration *)v2;
}

char *__65__NSURLSessionConfiguration_sessionConfigurationForSharedSession__block_invoke()
{
  result = -[NSURLSessionConfiguration initWithDisposition:]([NSURLSessionConfiguration alloc], &unk_1EC0A5B48);
  +[NSURLSessionConfiguration sessionConfigurationForSharedSession]::sSharedConfiguration = (uint64_t)result;
  return result;
}

+ (NSURLSessionConfiguration)backgroundSessionConfigurationWithIdentifier:(NSString *)identifier
{
  if (!identifier) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Background session configuration must have a non-nil identifier" userInfo:0]);
  }
  uint64_t v4 = -[NSURLSessionConfiguration initWithDisposition:]([NSURLSessionConfiguration alloc], &unk_1EC0A58A8);
  [v4 setURLCache:0];
  [v4 setIdentifier:identifier];
  [v4 setBackgroundSession:1];
  [v4 setSessionSendsLaunchEvents:1];

  return (NSURLSessionConfiguration *)v4;
}

- (void)set_skipsStackTraceCapture:(BOOL)a3
{
  self->__skipsStackTraceCapture = a3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (!self) {
    return 0;
  }
  uint64_t v5 = [(NSURLSessionConfiguration *)self disposition];
  uint64_t v6 = [a3 disposition];
  if (v5 != (NSString *)v6 && ([(NSString *)v5 isEqual:v6] & 1) == 0) {
    return 0;
  }
  int v7 = [(NSURLSessionConfiguration *)self allowsCellularAccess];
  if (v7 != [a3 allowsCellularAccess]) {
    return 0;
  }
  int v8 = [(NSURLSessionConfiguration *)self allowsExpensiveNetworkAccess];
  if (v8 != [a3 allowsExpensiveNetworkAccess]) {
    return 0;
  }
  int v9 = [(NSURLSessionConfiguration *)self allowsConstrainedNetworkAccess];
  if (v9 != [a3 allowsConstrainedNetworkAccess]) {
    return 0;
  }
  int v10 = [(NSURLSessionConfiguration *)self _allowsUCA];
  if (v10 != [a3 _allowsUCA]) {
    return 0;
  }
  int v11 = [(NSURLSessionConfiguration *)self _allowsVirtualInterfaces];
  if (v11 != [a3 _allowsVirtualInterfaces]) {
    return 0;
  }
  int v12 = [(NSURLSessionConfiguration *)self waitsForConnectivity];
  if (v12 != [a3 waitsForConnectivity]) {
    return 0;
  }
  int v13 = [(NSURLSessionConfiguration *)self isDiscretionary];
  if (v13 != [a3 isDiscretionary]) {
    return 0;
  }
  uint64_t v14 = [(NSURLSessionConfiguration *)self sharedContainerIdentifier];
  uint64_t v15 = [a3 sharedContainerIdentifier];
  if (v14 != (NSString *)v15 && ([(NSString *)v14 isEqual:v15] & 1) == 0) {
    return 0;
  }
  int v16 = [(NSURLSessionConfiguration *)self sessionSendsLaunchEvents];
  if (v16 != [a3 sessionSendsLaunchEvents]) {
    return 0;
  }
  int v17 = [(NSURLSessionConfiguration *)self HTTPShouldUsePipelining];
  if (v17 != [a3 HTTPShouldUsePipelining]) {
    return 0;
  }
  int v18 = [(NSURLSessionConfiguration *)self HTTPShouldSetCookies];
  if (v18 != [a3 HTTPShouldSetCookies]) {
    return 0;
  }
  int v19 = [(NSURLSessionConfiguration *)self _requiresPowerPluggedIn];
  if (v19 != [a3 _requiresPowerPluggedIn]) {
    return 0;
  }
  int v20 = [(NSURLSessionConfiguration *)self _allowsPowerNapScheduling];
  if (v20 != [a3 _allowsPowerNapScheduling]) {
    return 0;
  }
  int v21 = [(NSURLSessionConfiguration *)self _allowsHSTSWithUntrustedRootCertificate];
  if (v21 != [a3 _allowsHSTSWithUntrustedRootCertificate]) {
    return 0;
  }
  int v22 = [(NSURLSessionConfiguration *)self _sessionSendsLaunchOnDemandEvents];
  if (v22 != [a3 _sessionSendsLaunchOnDemandEvents]) {
    return 0;
  }
  int64_t v23 = [(NSURLSessionConfiguration *)self _timingDataOptions];
  if (v23 != [a3 _timingDataOptions]) {
    return 0;
  }
  int v24 = [(NSURLSessionConfiguration *)self _shouldSkipPreferredClientCertificateLookup];
  if (v24 != [a3 _shouldSkipPreferredClientCertificateLookup]) {
    return 0;
  }
  int v25 = [(NSURLSessionConfiguration *)self _allowsRetryForBackgroundDataTasks];
  if (v25 != [a3 _allowsRetryForBackgroundDataTasks]) {
    return 0;
  }
  int v26 = [(NSURLSessionConfiguration *)self _onBehalfOfPairedDevice];
  if (v26 != [a3 _onBehalfOfPairedDevice]) {
    return 0;
  }
  int v27 = [(NSURLSessionConfiguration *)self _clientIsNotExplicitlyDiscretionary];
  if (v27 != [a3 _clientIsNotExplicitlyDiscretionary]) {
    return 0;
  }
  int v28 = [(NSURLSessionConfiguration *)self _respectsAllowsCellularAccessForDiscretionaryTasks];
  if (v28 != [a3 _respectsAllowsCellularAccessForDiscretionaryTasks]) {
    return 0;
  }
  int v29 = [(NSURLSessionConfiguration *)self _infersDiscretionaryFromOriginatingClient];
  if (v29 != [a3 _infersDiscretionaryFromOriginatingClient]) {
    return 0;
  }
  int v30 = [(NSURLSessionConfiguration *)self isBackgroundSession];
  if (v30 != [a3 isBackgroundSession]) {
    return 0;
  }
  int v31 = [(NSURLSessionConfiguration *)self skip_download_unlink];
  if (v31 != objc_msgSend(a3, "skip_download_unlink")) {
    return 0;
  }
  int v32 = [(NSURLSessionConfiguration *)self _requiresClientToOpenFiles];
  if (v32 != [a3 _requiresClientToOpenFiles]) {
    return 0;
  }
  int v33 = [(NSURLSessionConfiguration *)self _forcesNewConnections];
  if (v33 != [a3 _forcesNewConnections]) {
    return 0;
  }
  int v34 = [(NSURLSessionConfiguration *)self _supportsAVAssetDownloads];
  if (v34 != [a3 _supportsAVAssetDownloads]) {
    return 0;
  }
  int v35 = [(NSURLSessionConfiguration *)self _isProxySession];
  if (v35 != [a3 _isProxySession]) {
    return 0;
  }
  int v36 = [(NSURLSessionConfiguration *)self _preventsIdleSleep];
  if (v36 != [a3 _preventsIdleSleep]) {
    return 0;
  }
  int v37 = [(NSURLSessionConfiguration *)self _usePipeliningHeuristics];
  if (v37 != [a3 _usePipeliningHeuristics]) {
    return 0;
  }
  SSLProtocol v38 = [(NSURLSessionConfiguration *)self TLSMinimumSupportedProtocol];
  if (v38 != [a3 TLSMinimumSupportedProtocol]) {
    return 0;
  }
  SSLProtocol v39 = [(NSURLSessionConfiguration *)self TLSMaximumSupportedProtocol];
  if (v39 != [a3 TLSMaximumSupportedProtocol]) {
    return 0;
  }
  v40 = [(NSURLSessionConfiguration *)self identifier];
  uint64_t v41 = [a3 identifier];
  if (v40 != (NSString *)v41 && ([(NSString *)v40 isEqual:v41] & 1) == 0) {
    return 0;
  }
  NSURLRequestCachePolicy v42 = [(NSURLSessionConfiguration *)self requestCachePolicy];
  if (v42 != [a3 requestCachePolicy]) {
    return 0;
  }
  [(NSURLSessionConfiguration *)self timeoutIntervalForRequest];
  double v44 = v43;
  [a3 timeoutIntervalForRequest];
  if (v44 != v45) {
    return 0;
  }
  [(NSURLSessionConfiguration *)self timeoutIntervalForResource];
  double v47 = v46;
  [a3 timeoutIntervalForResource];
  if (v47 != v48) {
    return 0;
  }
  NSURLRequestNetworkServiceType v49 = [(NSURLSessionConfiguration *)self networkServiceType];
  if (v49 != [a3 networkServiceType]) {
    return 0;
  }
  v50 = [(NSURLSessionConfiguration *)self connectionProxyDictionary];
  uint64_t v51 = [a3 connectionProxyDictionary];
  if (v50 != (NSDictionary *)v51 && ([(NSDictionary *)v50 isEqual:v51] & 1) == 0) {
    return 0;
  }
  NSHTTPCookieAcceptPolicy v52 = [(NSURLSessionConfiguration *)self HTTPCookieAcceptPolicy];
  if (v52 != [a3 HTTPCookieAcceptPolicy]) {
    return 0;
  }
  v53 = [(NSURLSessionConfiguration *)self HTTPAdditionalHeaders];
  uint64_t v54 = [a3 HTTPAdditionalHeaders];
  if (v53 != (NSDictionary *)v54 && ([(NSDictionary *)v53 isEqual:v54] & 1) == 0) {
    return 0;
  }
  NSInteger v55 = [(NSURLSessionConfiguration *)self HTTPMaximumConnectionsPerHost];
  if (v55 != [a3 HTTPMaximumConnectionsPerHost]) {
    return 0;
  }
  int v56 = [(NSURLSessionConfiguration *)self shouldUseExtendedBackgroundIdleMode];
  if (v56 != [a3 shouldUseExtendedBackgroundIdleMode]) {
    return 0;
  }
  v57 = [(NSURLSessionConfiguration *)self protocolClasses];
  uint64_t v58 = [a3 protocolClasses];
  if (v57 != (NSArray *)v58 && ([(NSArray *)v57 isEqual:v58] & 1) == 0) {
    return 0;
  }
  NSURLSessionMultipathServiceType v59 = [(NSURLSessionConfiguration *)self multipathServiceType];
  if (v59 != [a3 multipathServiceType]) {
    return 0;
  }
  v60 = [(NSURLSessionConfiguration *)self _directoryForDownloadedFiles];
  uint64_t v61 = [a3 _directoryForDownloadedFiles];
  if (v60 != (NSURL *)v61 && ([(NSURL *)v60 isEqual:v61] & 1) == 0) {
    return 0;
  }
  v62 = [(NSURLSessionConfiguration *)self _sourceApplicationBundleIdentifier];
  uint64_t v63 = [a3 _sourceApplicationBundleIdentifier];
  if (v62 != (NSString *)v63 && ([(NSString *)v62 isEqual:v63] & 1) == 0) {
    return 0;
  }
  v64 = [(NSURLSessionConfiguration *)self _sourceApplicationSecondaryIdentifier];
  uint64_t v65 = [a3 _sourceApplicationSecondaryIdentifier];
  if (v64 != (NSString *)v65 && ([(NSString *)v64 isEqual:v65] & 1) == 0) {
    return 0;
  }
  v66 = [(NSURLSessionConfiguration *)self _sourceApplicationAuditTokenData];
  uint64_t v67 = [a3 _sourceApplicationAuditTokenData];
  if (v66 != (NSData *)v67 && ([(NSData *)v66 isEqual:v67] & 1) == 0) {
    return 0;
  }
  v68 = [(NSURLSessionConfiguration *)self _attributedBundleIdentifier];
  uint64_t v69 = [a3 _attributedBundleIdentifier];
  if (v68 != (NSString *)v69 && ([(NSString *)v68 isEqual:v69] & 1) == 0) {
    return 0;
  }
  unint64_t v70 = [(NSURLSessionConfiguration *)self _TCPAdaptiveReadTimeout];
  if (v70 != [a3 _TCPAdaptiveReadTimeout]) {
    return 0;
  }
  unint64_t v71 = [(NSURLSessionConfiguration *)self _TCPAdaptiveWriteTimeout];
  if (v71 != [a3 _TCPAdaptiveWriteTimeout]) {
    return 0;
  }
  int v72 = [(NSURLSessionConfiguration *)self _reportsDataStalls];
  if (v72 != [a3 _reportsDataStalls]) {
    return 0;
  }
  [(NSURLSessionConfiguration *)self _connectionCachePurgeTimeout];
  double v74 = v73;
  [a3 _connectionCachePurgeTimeout];
  if (v74 != v75) {
    return 0;
  }
  [(NSURLSessionConfiguration *)self _connectionCacheCellPurgeTimeout];
  double v77 = v76;
  [a3 _connectionCacheCellPurgeTimeout];
  if (v77 != v78) {
    return 0;
  }
  [(NSURLSessionConfiguration *)self _longLivedConnectionCachePurgeTimeout];
  double v80 = v79;
  [a3 _longLivedConnectionCachePurgeTimeout];
  if (v80 != v81) {
    return 0;
  }
  [(NSURLSessionConfiguration *)self _longLivedConnectionCacheCellPurgeTimeout];
  double v83 = v82;
  [a3 _longLivedConnectionCacheCellPurgeTimeout];
  if (v83 != v84) {
    return 0;
  }
  v85 = [(NSURLSessionConfiguration *)self _connectionPoolName];
  uint64_t v86 = [a3 _connectionPoolName];
  if (v85 != (NSString *)v86 && ([(NSString *)v85 isEqual:v86] & 1) == 0) {
    return 0;
  }
  int64_t v87 = [(NSURLSessionConfiguration *)self _connectionCacheNumPriorityLevels];
  if (v87 != [a3 _connectionCacheNumPriorityLevels]) {
    return 0;
  }
  int64_t v88 = [(NSURLSessionConfiguration *)self _connectionCacheNumFastLanes];
  if (v88 != [a3 _connectionCacheNumFastLanes]) {
    return 0;
  }
  int64_t v89 = [(NSURLSessionConfiguration *)self _connectionCacheMinimumFastLanePriority];
  if (v89 != [a3 _connectionCacheMinimumFastLanePriority]) {
    return 0;
  }
  v90 = [(NSURLSessionConfiguration *)self _tcpConnectionPoolName];
  uint64_t v91 = [a3 _tcpConnectionPoolName];
  if (v90 != (NSString *)v91 && ([(NSString *)v90 isEqual:v91] & 1) == 0) {
    return 0;
  }
  v92 = [(NSURLSessionConfiguration *)self _socketStreamProperties];
  uint64_t v93 = [a3 _socketStreamProperties];
  if (v92 != (NSDictionary *)v93 && ([(NSDictionary *)v92 isEqual:v93] & 1) == 0) {
    return 0;
  }
  int v94 = [(NSURLSessionConfiguration *)self _preventsIdleSleepOnceConnected];
  if (v94 != [a3 _preventsIdleSleepOnceConnected]) {
    return 0;
  }
  int v95 = [(NSURLSessionConfiguration *)self _overridesBackgroundSessionAutoRedirect];
  if (v95 != [a3 _overridesBackgroundSessionAutoRedirect]) {
    return 0;
  }
  int v96 = [(NSURLSessionConfiguration *)self _performsEVCertCheck];
  if (v96 != [a3 _performsEVCertCheck]) {
    return 0;
  }
  v97 = [(NSURLSessionConfiguration *)self _appleIDContext];
  uint64_t v98 = [a3 _appleIDContext];
  if (v97 != (NSURLSessionAppleIDContext *)v98
    && ([(NSURLSessionAppleIDContext *)v97 isEqual:v98] & 1) == 0)
  {
    return 0;
  }
  v99 = [(NSURLSessionConfiguration *)self _authenticatorStatusCodes];
  uint64_t v100 = [a3 _authenticatorStatusCodes];
  if (v99 != (NSSet *)v100 && ([(NSSet *)v99 isEqual:v100] & 1) == 0) {
    return 0;
  }
  v101 = [(NSURLSessionConfiguration *)self _atsContext];
  uint64_t v102 = [a3 _atsContext];
  if (v101 != (NSData *)v102 && ([(NSData *)v101 isEqual:v102] & 1) == 0) {
    return 0;
  }
  int v103 = [(NSURLSessionConfiguration *)self _prefersInfraWiFi];
  if (v103 != [a3 _prefersInfraWiFi]) {
    return 0;
  }
  int v104 = [(NSURLSessionConfiguration *)self _shouldPreserveBackgroundSessionDisposition];
  if (v104 != [a3 _shouldPreserveBackgroundSessionDisposition]) {
    return 0;
  }
  int v105 = [(NSURLSessionConfiguration *)self _disablesOutOfProcessDirectWiFiUsage];
  if (v105 != [a3 _disablesOutOfProcessDirectWiFiUsage]) {
    return 0;
  }
  int v106 = [(NSURLSessionConfiguration *)self _disablesUseOfProxySession];
  if (v106 != [a3 _disablesUseOfProxySession]) {
    return 0;
  }
  v107 = [(NSURLSessionConfiguration *)self _CTDataConnectionServiceType];
  uint64_t v108 = [a3 _CTDataConnectionServiceType];
  if (v107 != (NSString *)v108 && ([(NSString *)v107 isEqual:v108] & 1) == 0) {
    return 0;
  }
  int v109 = [(NSURLSessionConfiguration *)self _preventsDirectWiFiAccess];
  if (v109 != [a3 _preventsDirectWiFiAccess]) {
    return 0;
  }
  int v110 = [(NSURLSessionConfiguration *)self _allowTCPIOConnectionStreamTask];
  if (v110 != [a3 _allowTCPIOConnectionStreamTask]) {
    return 0;
  }
  unint64_t v111 = [(NSURLSessionConfiguration *)self _customReadBufferSize];
  if (v111 != [a3 _customReadBufferSize]) {
    return 0;
  }
  [(NSURLSessionConfiguration *)self _customReadBufferTimeout];
  double v113 = v112;
  [a3 _customReadBufferTimeout];
  if (v113 != v114) {
    return 0;
  }
  int v115 = [(NSURLSessionConfiguration *)self _preventsSystemHTTPProxyAuthentication];
  if (v115 != [a3 _preventsSystemHTTPProxyAuthentication]) {
    return 0;
  }
  int v116 = [(NSURLSessionConfiguration *)self _requiresSecureHTTPSProxyConnection];
  if (v116 != [a3 _requiresSecureHTTPSProxyConnection]) {
    return 0;
  }
  v117 = [(NSURLSessionConfiguration *)self _proxyConfigurations];
  uint64_t v118 = [a3 _proxyConfigurations];
  if (v117 != (NSArray *)v118 && ([(NSArray *)v117 isEqual:v118] & 1) == 0) {
    return 0;
  }
  int v119 = [(NSURLSessionConfiguration *)self _preventsAppSSO];
  if (v119 != [a3 _preventsAppSSO]) {
    return 0;
  }
  int v120 = [(NSURLSessionConfiguration *)self _loggingPrivacyLevel];
  if (v120 != [a3 _loggingPrivacyLevel]) {
    return 0;
  }
  int v121 = [(NSURLSessionConfiguration *)self _duetPreauthorized];
  if (v121 != [a3 _duetPreauthorized]) {
    return 0;
  }
  int64_t v122 = [(NSURLSessionConfiguration *)self _duetPreClearedMode];
  if (v122 != [a3 _duetPreClearedMode]) {
    return 0;
  }
  int v123 = [(NSURLSessionConfiguration *)self _xpcActivityBudgeted];
  if (v123 != [a3 _xpcActivityBudgeted]) {
    return 0;
  }
  int v124 = [(NSURLSessionConfiguration *)self _requiresSustainedDataDelivery];
  if (v124 != [a3 _requiresSustainedDataDelivery]) {
    return 0;
  }
  int64_t v125 = [(NSURLSessionConfiguration *)self _IDSMessageTimeout];
  if (v125 != [a3 _IDSMessageTimeout]) {
    return 0;
  }
  int v126 = [(NSURLSessionConfiguration *)self _ignoreDidReceiveResponseDisposition];
  if (v126 != [a3 _ignoreDidReceiveResponseDisposition]) {
    return 0;
  }
  int v127 = [(NSURLSessionConfiguration *)self _alwaysPerformDefaultTrustEvaluation];
  if (v127 != [a3 _alwaysPerformDefaultTrustEvaluation]) {
    return 0;
  }
  int v128 = [(NSURLSessionConfiguration *)self _allowsMultipathTCP];
  if (v128 != [a3 _allowsMultipathTCP]) {
    return 0;
  }
  int v129 = [(NSURLSessionConfiguration *)self _allowsResponseMonitoringDuringBodyTranmission];
  if (v129 != [a3 _allowsResponseMonitoringDuringBodyTranmission]) {
    return 0;
  }
  int v130 = [(NSURLSessionConfiguration *)self _allowsIndefiniteConnections];
  if (v130 != [a3 _allowsIndefiniteConnections]) {
    return 0;
  }
  int v131 = [(NSURLSessionConfiguration *)self _allowsTCPFastOpen];
  if (v131 != [a3 _allowsTCPFastOpen]) {
    return 0;
  }
  int v132 = [(NSURLSessionConfiguration *)self _allowsTLSSessionTickets];
  if (v132 != [a3 _allowsTLSSessionTickets]) {
    return 0;
  }
  int v133 = [(NSURLSessionConfiguration *)self _allowsTLSSessionResumption];
  if (v133 != [a3 _allowsTLSSessionResumption]) {
    return 0;
  }
  int v134 = [(NSURLSessionConfiguration *)self _allowsTLSFalseStart];
  if (v134 != [a3 _allowsTLSFalseStart]) {
    return 0;
  }
  v135 = [(NSURLSessionConfiguration *)self _tlsTrustPinningPolicyName];
  uint64_t v136 = [a3 _tlsTrustPinningPolicyName];
  if (v135 != (NSString *)v136 && ([(NSString *)v135 isEqual:v136] & 1) == 0) {
    return 0;
  }
  int v137 = [(NSURLSessionConfiguration *)self _allowsTLSFallback];
  if (v137 != [a3 _allowsTLSFallback]) {
    return 0;
  }
  int v138 = [(NSURLSessionConfiguration *)self _allowsTLSECH];
  if (v138 != [a3 _allowsTLSECH]) {
    return 0;
  }
  v139 = [(NSURLSessionConfiguration *)self _companionAppBundleIdentifier];
  uint64_t v140 = [a3 _companionAppBundleIdentifier];
  if (v139 != (NSString *)v140 && ([(NSString *)v139 isEqual:v140] & 1) == 0) {
    return 0;
  }
  v141 = [(NSURLSessionConfiguration *)self _watchAppBundleIdentifier];
  uint64_t v142 = [a3 _watchAppBundleIdentifier];
  if (v141 != (NSString *)v142 && ([(NSString *)v141 isEqual:v142] & 1) == 0) {
    return 0;
  }
  v143 = [(NSURLSessionConfiguration *)self _watchExtensionBundleIdentifier];
  uint64_t v144 = [a3 _watchExtensionBundleIdentifier];
  if (v143 != (NSString *)v144 && ([(NSString *)v143 isEqual:v144] & 1) == 0) {
    return 0;
  }
  unint64_t v145 = [(NSURLSessionConfiguration *)self _forcedNetworkServiceType];
  if (v145 != [a3 _forcedNetworkServiceType]) {
    return 0;
  }
  v146 = [(NSURLSessionConfiguration *)self _overriddenDelegateOptions];
  uint64_t v147 = [a3 _overriddenDelegateOptions];
  if (v146 != (NSDictionary *)v147 && ([(NSDictionary *)v146 isEqual:v147] & 1) == 0) {
    return 0;
  }
  v148 = [(NSURLSessionConfiguration *)self _suppressedAutoAddedHTTPHeaders];
  uint64_t v149 = [a3 _suppressedAutoAddedHTTPHeaders];
  if (v148 != (NSSet *)v149 && ([(NSSet *)v148 isEqual:v149] & 1) == 0) {
    return 0;
  }
  v150 = [(NSURLSessionConfiguration *)self _maximumWatchCellularTransferSize];
  uint64_t v151 = [a3 _maximumWatchCellularTransferSize];
  if (v150 != (NSNumber *)v151 && ([(NSNumber *)v150 isEqual:v151] & 1) == 0) {
    return 0;
  }
  unint64_t v152 = [(NSURLSessionConfiguration *)self _multipathAlternatePort];
  if (v152 != [a3 _multipathAlternatePort]) {
    return 0;
  }
  v153 = [(NSURLSessionConfiguration *)self _downloadFileProtectionType];
  uint64_t v154 = [a3 _downloadFileProtectionType];
  if (v153 != (NSString *)v154 && ([(NSString *)v153 isEqual:v154] & 1) == 0) {
    return 0;
  }
  int v155 = [(NSURLSessionConfiguration *)self _enableOAuthBearerTokenChallenges];
  if (v155 != [a3 _enableOAuthBearerTokenChallenges]) {
    return 0;
  }
  int v156 = [(NSURLSessionConfiguration *)self _disablesNWLoader];
  if (v156 != [a3 _disablesNWLoader]) {
    return 0;
  }
  int v157 = [(NSURLSessionConfiguration *)self _enablesL4SInternal];
  if (v157 != [a3 _enablesL4SInternal]) {
    return 0;
  }
  int v158 = [(NSURLSessionConfiguration *)self _phskip_credStorageSet];
  if (v158 != objc_msgSend(a3, "_phskip_credStorageSet")) {
    return 0;
  }
  if ([(NSURLSessionConfiguration *)self _phskip_credStorageSet])
  {
    v159 = [(NSURLSessionConfiguration *)self _phskip_credStorage];
    if (v159 != (NSURLCredentialStorage *)objc_msgSend(a3, "_phskip_credStorage")) {
      return 0;
    }
  }
  int v160 = [(NSURLSessionConfiguration *)self _phskip_urlCacheSet];
  if (v160 != objc_msgSend(a3, "_phskip_urlCacheSet")) {
    return 0;
  }
  if ([(NSURLSessionConfiguration *)self _phskip_urlCacheSet])
  {
    v161 = [(NSURLSessionConfiguration *)self _phskip_urlCache];
    if (v161 != (NSURLCache *)objc_msgSend(a3, "_phskip_urlCache")) {
      return 0;
    }
  }
  int v162 = [(NSURLSessionConfiguration *)self _phskip_cookieStorageSet];
  if (v162 != objc_msgSend(a3, "_phskip_cookieStorageSet")) {
    return 0;
  }
  if ([(NSURLSessionConfiguration *)self _phskip_cookieStorageSet])
  {
    v163 = [(NSURLSessionConfiguration *)self _phskip_cookieStorage];
    if (v163 != (NSHTTPCookieStorage *)objc_msgSend(a3, "_phskip_cookieStorage")) {
      return 0;
    }
  }
  int v164 = [(NSURLSessionConfiguration *)self _phskip_hstsStorageSet];
  if (v164 != objc_msgSend(a3, "_phskip_hstsStorageSet")) {
    return 0;
  }
  if ([(NSURLSessionConfiguration *)self _phskip_hstsStorageSet])
  {
    v165 = [(NSURLSessionConfiguration *)self _phskip_hstsStorage];
    if (v165 != (_NSHSTSStorage *)objc_msgSend(a3, "_phskip_hstsStorage")) {
      return 0;
    }
  }
  int64_t v166 = [(NSURLSessionConfiguration *)self _expiredDNSBehavior];
  if (v166 != [a3 _expiredDNSBehavior]) {
    return 0;
  }
  int v167 = [(NSURLSessionConfiguration *)self requiresDNSSECValidation];
  if (v167 != [a3 requiresDNSSECValidation]) {
    return 0;
  }
  int v168 = [(NSURLSessionConfiguration *)self _allowsHTTP3Internal];
  if (v168 != [a3 _allowsHTTP3Internal]) {
    return 0;
  }
  int v169 = [(NSURLSessionConfiguration *)self _phskip_alternativeServicesStorageSet];
  if (v169 != objc_msgSend(a3, "_phskip_alternativeServicesStorageSet")) {
    return 0;
  }
  if ([(NSURLSessionConfiguration *)self _phskip_alternativeServicesStorageSet])
  {
    v170 = [(NSURLSessionConfiguration *)self _phskip_alternativeServicesStorage];
    if (v170 != (_NSHTTPAlternativeServicesStorage *)objc_msgSend(a3, "_phskip_alternativeServicesStorage")) {
      return 0;
    }
  }
  int v171 = [(NSURLSessionConfiguration *)self _usesNWLoader];
  if (v171 == [a3 _usesNWLoader]
    && (int v172 = [(NSURLSessionConfiguration *)self _prohibitEncryptedDNS],
        v172 == [a3 _prohibitEncryptedDNS])
    && (int v173 = [(NSURLSessionConfiguration *)self _neTrackerTCCResult],
        v173 == [a3 _neTrackerTCCResult])
    && (int v174 = [(NSURLSessionConfiguration *)self _disableAPWakeOnIdleConnections],
        v174 == [a3 _disableAPWakeOnIdleConnections]))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}

- (BOOL)_phskip_urlCacheSet
{
  return self->_phskip_urlCacheSet;
}

- (BOOL)_phskip_credStorageSet
{
  return self->_phskip_credStorageSet;
}

- (BOOL)_phskip_cookieStorageSet
{
  return self->_phskip_cookieStorageSet;
}

- (BOOL)_phskip_hstsStorageSet
{
  return self->_phskip_hstsStorageSet;
}

- (BOOL)_phskip_alternativeServicesStorageSet
{
  return self->_phskip_alternativeServicesStorageSet;
}

- (BOOL)_skipsStackTraceCapture
{
  return self->__skipsStackTraceCapture;
}

- (void)set_companionProxyPreference:(int64_t)a3
{
  self->__companionProxyPreference = a3;
}

- (int64_t)_companionProxyPreference
{
  return self->__companionProxyPreference;
}

- (void)set_allowsWCA:(BOOL)a3
{
  self->__allowsWCA = a3;
}

- (BOOL)_allowsWCA
{
  return self->__allowsWCA;
}

- (void)set_phskip_alternativeServicesStorageSet:(BOOL)a3
{
  self->_phskip_alternativeServicesStorageSet = a3;
}

- (void)set_phskip_hstsStorageSet:(BOOL)a3
{
  self->_phskip_hstsStorageSet = a3;
}

- (void)set_phskip_cookieStorageSet:(BOOL)a3
{
  self->_phskip_cookieStorageSet = a3;
}

- (void)set_phskip_urlCacheSet:(BOOL)a3
{
  self->_phskip_urlCacheSet = a3;
}

- (void)set_phskip_credStorageSet:(BOOL)a3
{
  self->_phskip_credStorageSet = a3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)[(NSURLSessionConfiguration *)self disposition] hash];
  NSUInteger v4 = v3 + [(NSURLSessionConfiguration *)self allowsCellularAccess];
  NSUInteger v5 = v4 + [(NSURLSessionConfiguration *)self allowsExpensiveNetworkAccess];
  NSUInteger v6 = v5 + [(NSURLSessionConfiguration *)self allowsConstrainedNetworkAccess];
  NSUInteger v7 = v6 + [(NSURLSessionConfiguration *)self _allowsUCA];
  NSUInteger v8 = v7 + [(NSURLSessionConfiguration *)self _allowsVirtualInterfaces];
  NSUInteger v9 = v8 + [(NSURLSessionConfiguration *)self waitsForConnectivity];
  NSUInteger v10 = v9 + [(NSURLSessionConfiguration *)self isDiscretionary];
  NSUInteger v11 = v10
      + [(NSString *)[(NSURLSessionConfiguration *)self sharedContainerIdentifier] hash];
  NSUInteger v12 = v11 + [(NSURLSessionConfiguration *)self sessionSendsLaunchEvents];
  NSUInteger v13 = v12 + [(NSURLSessionConfiguration *)self HTTPShouldUsePipelining];
  uint64_t v14 = v13 + [(NSURLSessionConfiguration *)self HTTPShouldSetCookies];
  uint64_t v15 = v14 + [(NSURLSessionConfiguration *)self _requiresPowerPluggedIn];
  uint64_t v16 = v15 + [(NSURLSessionConfiguration *)self _allowsPowerNapScheduling];
  uint64_t v17 = v16
      + [(NSURLSessionConfiguration *)self _allowsHSTSWithUntrustedRootCertificate];
  uint64_t v18 = v17 + [(NSURLSessionConfiguration *)self _sessionSendsLaunchOnDemandEvents];
  uint64_t v19 = v18 + [(NSURLSessionConfiguration *)self _timingDataOptions];
  uint64_t v20 = v19
      + [(NSURLSessionConfiguration *)self _shouldSkipPreferredClientCertificateLookup];
  uint64_t v21 = v20
      + [(NSURLSessionConfiguration *)self _allowsRetryForBackgroundDataTasks];
  uint64_t v22 = v21 + [(NSURLSessionConfiguration *)self _onBehalfOfPairedDevice];
  uint64_t v23 = v22
      + [(NSURLSessionConfiguration *)self _clientIsNotExplicitlyDiscretionary];
  uint64_t v24 = v23
      + [(NSURLSessionConfiguration *)self _respectsAllowsCellularAccessForDiscretionaryTasks];
  uint64_t v25 = v24
      + [(NSURLSessionConfiguration *)self _infersDiscretionaryFromOriginatingClient];
  uint64_t v26 = v25 + [(NSURLSessionConfiguration *)self isBackgroundSession];
  uint64_t v27 = v26 + [(NSURLSessionConfiguration *)self skip_download_unlink];
  uint64_t v28 = v27 + [(NSURLSessionConfiguration *)self _requiresClientToOpenFiles];
  uint64_t v29 = v28 + [(NSURLSessionConfiguration *)self _forcesNewConnections];
  uint64_t v30 = v29 + [(NSURLSessionConfiguration *)self _supportsAVAssetDownloads];
  uint64_t v31 = v30 + [(NSURLSessionConfiguration *)self _isProxySession];
  uint64_t v32 = v31 + [(NSURLSessionConfiguration *)self _preventsIdleSleep];
  uint64_t v33 = v32 + [(NSURLSessionConfiguration *)self _usePipeliningHeuristics];
  uint64_t v34 = v33 + (int)[(NSURLSessionConfiguration *)self TLSMinimumSupportedProtocol];
  uint64_t v35 = v34 + (int)[(NSURLSessionConfiguration *)self TLSMaximumSupportedProtocol];
  NSUInteger v36 = [(NSString *)[(NSURLSessionConfiguration *)self identifier] hash];
  NSUInteger v37 = v36 + [(NSURLSessionConfiguration *)self requestCachePolicy];
  [(NSURLSessionConfiguration *)self timeoutIntervalForRequest];
  NSUInteger v39 = v37 + (uint64_t)v38;
  [(NSURLSessionConfiguration *)self timeoutIntervalForResource];
  unint64_t v41 = v39 + (uint64_t)v40 + [(NSURLSessionConfiguration *)self networkServiceType];
  unint64_t v42 = v41
      + [(NSDictionary *)[(NSURLSessionConfiguration *)self connectionProxyDictionary] hash];
  unint64_t v43 = v42 + [(NSURLSessionConfiguration *)self HTTPCookieAcceptPolicy];
  unint64_t v44 = v43
      + [(NSDictionary *)[(NSURLSessionConfiguration *)self HTTPAdditionalHeaders] hash];
  NSInteger v45 = v35 + v44 + [(NSURLSessionConfiguration *)self HTTPMaximumConnectionsPerHost];
  NSInteger v46 = v45
      + [(NSURLSessionConfiguration *)self shouldUseExtendedBackgroundIdleMode];
  uint64_t v47 = [(NSArray *)[(NSURLSessionConfiguration *)self protocolClasses] hash];
  uint64_t v48 = v47 + [(NSURLSessionConfiguration *)self multipathServiceType];
  uint64_t v49 = v48
      + [[(NSURLSessionConfiguration *)self _directoryForDownloadedFiles] hash];
  NSUInteger v50 = v49
      + [(NSString *)[(NSURLSessionConfiguration *)self _sourceApplicationBundleIdentifier] hash];
  NSUInteger v51 = v50
      + [(NSString *)[(NSURLSessionConfiguration *)self _sourceApplicationSecondaryIdentifier] hash];
  NSUInteger v52 = v51
      + [(NSData *)[(NSURLSessionConfiguration *)self _sourceApplicationAuditTokenData] hash];
  NSUInteger v53 = v52
      + [(NSString *)[(NSURLSessionConfiguration *)self _attributedBundleIdentifier] hash];
  NSUInteger v54 = v53 + [(NSURLSessionConfiguration *)self _TCPAdaptiveReadTimeout];
  NSUInteger v55 = v46 + v54 + [(NSURLSessionConfiguration *)self _TCPAdaptiveWriteTimeout];
  uint64_t v56 = v55 + [(NSURLSessionConfiguration *)self _reportsDataStalls];
  [(NSURLSessionConfiguration *)self _connectionCachePurgeTimeout];
  uint64_t v58 = (uint64_t)v57;
  [(NSURLSessionConfiguration *)self _connectionCacheCellPurgeTimeout];
  uint64_t v60 = v58 + (uint64_t)v59;
  [(NSURLSessionConfiguration *)self _longLivedConnectionCachePurgeTimeout];
  uint64_t v62 = v60 + (uint64_t)v61;
  [(NSURLSessionConfiguration *)self _longLivedConnectionCacheCellPurgeTimeout];
  NSUInteger v64 = v62
      + (uint64_t)v63
      + [(NSString *)[(NSURLSessionConfiguration *)self _connectionPoolName] hash];
  NSUInteger v65 = v64 + [(NSURLSessionConfiguration *)self _connectionCacheNumPriorityLevels];
  NSUInteger v66 = v65 + [(NSURLSessionConfiguration *)self _connectionCacheNumFastLanes];
  NSUInteger v67 = v66
      + [(NSURLSessionConfiguration *)self _connectionCacheMinimumFastLanePriority];
  NSUInteger v68 = v67
      + [(NSString *)[(NSURLSessionConfiguration *)self _tcpConnectionPoolName] hash];
  NSUInteger v69 = v56
      + v68
      + [(NSDictionary *)[(NSURLSessionConfiguration *)self _socketStreamProperties] hash];
  NSUInteger v70 = v69 + [(NSURLSessionConfiguration *)self _preventsIdleSleepOnceConnected];
  uint64_t v71 = v70
      + [(NSURLSessionConfiguration *)self _overridesBackgroundSessionAutoRedirect];
  uint64_t v72 = v71 + [(NSURLSessionConfiguration *)self _performsEVCertCheck];
  uint64_t v73 = [(NSURLSessionAppleIDContext *)[(NSURLSessionConfiguration *)self _appleIDContext] hash];
  uint64_t v74 = v73
      + [(NSSet *)[(NSURLSessionConfiguration *)self _authenticatorStatusCodes] hash];
  uint64_t v75 = v72 + v74 + [(NSData *)[(NSURLSessionConfiguration *)self _atsContext] hash];
  uint64_t v76 = v75 + [(NSURLSessionConfiguration *)self _prefersInfraWiFi];
  uint64_t v77 = v76
      + [(NSURLSessionConfiguration *)self _shouldPreserveBackgroundSessionDisposition];
  uint64_t v78 = v77
      + [(NSURLSessionConfiguration *)self _disablesOutOfProcessDirectWiFiUsage];
  uint64_t v79 = v78 + [(NSURLSessionConfiguration *)self _disablesUseOfProxySession];
  NSUInteger v80 = v79
      + [(NSString *)[(NSURLSessionConfiguration *)self _CTDataConnectionServiceType] hash];
  NSUInteger v81 = v80 + [(NSURLSessionConfiguration *)self _preventsDirectWiFiAccess];
  NSUInteger v82 = v81 + [(NSURLSessionConfiguration *)self _allowTCPIOConnectionStreamTask];
  unint64_t v83 = [(NSURLSessionConfiguration *)self _customReadBufferSize];
  [(NSURLSessionConfiguration *)self _customReadBufferTimeout];
  uint64_t v85 = v82
      + v83
      + (uint64_t)v84
      + [(NSURLSessionConfiguration *)self _preventsSystemHTTPProxyAuthentication];
  uint64_t v86 = v85
      + [(NSURLSessionConfiguration *)self _requiresSecureHTTPSProxyConnection];
  uint64_t v87 = v86 + [(NSArray *)[(NSURLSessionConfiguration *)self _proxyConfigurations] hash];
  uint64_t v88 = v87 + [(NSURLSessionConfiguration *)self _preventsAppSSO];
  uint64_t v89 = v88 + [(NSURLSessionConfiguration *)self _loggingPrivacyLevel];
  uint64_t v90 = v89 + [(NSURLSessionConfiguration *)self _duetPreauthorized];
  uint64_t v91 = v90 + [(NSURLSessionConfiguration *)self _duetPreClearedMode];
  uint64_t v92 = v91 + [(NSURLSessionConfiguration *)self _xpcActivityBudgeted];
  uint64_t v93 = v92 + [(NSURLSessionConfiguration *)self _requiresSustainedDataDelivery];
  uint64_t v94 = v93 + [(NSURLSessionConfiguration *)self _IDSMessageTimeout];
  uint64_t v95 = v94
      + [(NSURLSessionConfiguration *)self _ignoreDidReceiveResponseDisposition];
  uint64_t v96 = v95
      + [(NSURLSessionConfiguration *)self _alwaysPerformDefaultTrustEvaluation];
  uint64_t v97 = v96 + [(NSURLSessionConfiguration *)self _allowsMultipathTCP];
  uint64_t v98 = v97
      + [(NSURLSessionConfiguration *)self _allowsResponseMonitoringDuringBodyTranmission];
  uint64_t v99 = v98 + [(NSURLSessionConfiguration *)self _allowsIndefiniteConnections];
  uint64_t v100 = v99 + [(NSURLSessionConfiguration *)self _allowsTCPFastOpen];
  uint64_t v101 = v100 + [(NSURLSessionConfiguration *)self _allowsTLSSessionTickets];
  uint64_t v102 = v101 + [(NSURLSessionConfiguration *)self _allowsTLSSessionResumption];
  uint64_t v103 = v102 + [(NSURLSessionConfiguration *)self _allowsTLSFalseStart];
  NSUInteger v104 = v103
       + [(NSString *)[(NSURLSessionConfiguration *)self _tlsTrustPinningPolicyName] hash];
  NSUInteger v105 = v104 + [(NSURLSessionConfiguration *)self _allowsTLSFallback];
  NSUInteger v106 = v105 + [(NSURLSessionConfiguration *)self _allowsTLSECH];
  NSUInteger v107 = [(NSString *)[(NSURLSessionConfiguration *)self _companionAppBundleIdentifier] hash];
  NSUInteger v108 = v107
       + [(NSString *)[(NSURLSessionConfiguration *)self _watchAppBundleIdentifier] hash];
  NSUInteger v109 = v108
       + [(NSString *)[(NSURLSessionConfiguration *)self _watchExtensionBundleIdentifier] hash];
  NSUInteger v110 = v109 + [(NSURLSessionConfiguration *)self _forcedNetworkServiceType];
  NSUInteger v111 = v110
       + [(NSDictionary *)[(NSURLSessionConfiguration *)self _overriddenDelegateOptions] hash];
  uint64_t v112 = v111
       + [(NSSet *)[(NSURLSessionConfiguration *)self _suppressedAutoAddedHTTPHeaders] hash];
  uint64_t v113 = v112
       + [(NSNumber *)[(NSURLSessionConfiguration *)self _maximumWatchCellularTransferSize] hash];
  uint64_t v114 = v113 + [(NSURLSessionConfiguration *)self _multipathAlternatePort];
  NSUInteger v115 = v106
       + v114
       + [(NSString *)[(NSURLSessionConfiguration *)self _downloadFileProtectionType] hash];
  NSUInteger v116 = v115
       + [(NSURLSessionConfiguration *)self _enableOAuthBearerTokenChallenges];
  NSUInteger v117 = v116 + [(NSURLSessionConfiguration *)self _disablesNWLoader];
  uint64_t v118 = v117 + [(NSURLSessionConfiguration *)self _enablesL4SInternal] + 1;
  if ([(NSURLSessionConfiguration *)self _phskip_credStorageSet]) {
    v118 += [(NSURLCredentialStorage *)[(NSURLSessionConfiguration *)self _phskip_credStorage] hash];
  }
  if ([(NSURLSessionConfiguration *)self _phskip_urlCacheSet]) {
    v118 += [(NSURLCache *)[(NSURLSessionConfiguration *)self _phskip_urlCache] hash];
  }
  if ([(NSURLSessionConfiguration *)self _phskip_cookieStorageSet]) {
    v118 += [(NSHTTPCookieStorage *)[(NSURLSessionConfiguration *)self _phskip_cookieStorage] hash];
  }
  if ([(NSURLSessionConfiguration *)self _phskip_hstsStorageSet]) {
    v118 += (uint64_t)[(NSURLSessionConfiguration *)self _phskip_hstsStorage];
  }
  if ([(NSURLSessionConfiguration *)self _allowsHTTP3Internal]) {
    v118 += [(NSURLSessionConfiguration *)self _allowsHTTP3Internal];
  }
  unint64_t v119 = [(NSURLSessionConfiguration *)self _expiredDNSBehavior] + v118;
  if ([(NSURLSessionConfiguration *)self requiresDNSSECValidation]) {
    v119 += [(NSURLSessionConfiguration *)self requiresDNSSECValidation];
  }
  if ([(NSURLSessionConfiguration *)self _phskip_alternativeServicesStorageSet]) {
    v119 += [(_NSHTTPAlternativeServicesStorage *)[(NSURLSessionConfiguration *)self _phskip_alternativeServicesStorage] hash];
  }
  if ([(NSURLSessionConfiguration *)self _usesNWLoader]) {
    v119 += [(NSURLSessionConfiguration *)self _usesNWLoader];
  }
  if ([(NSURLSessionConfiguration *)self _prohibitEncryptedDNS]) {
    v119 += [(NSURLSessionConfiguration *)self _prohibitEncryptedDNS];
  }
  if ([(NSURLSessionConfiguration *)self _neTrackerTCCResult]) {
    v119 += [(NSURLSessionConfiguration *)self _neTrackerTCCResult];
  }
  if ([(NSURLSessionConfiguration *)self _disableAPWakeOnIdleConnections]) {
    v119 += [(NSURLSessionConfiguration *)self _disableAPWakeOnIdleConnections];
  }
  return v119;
}

- (BOOL)_inPrivateBrowsing
{
  double v2 = [(NSURLSessionConfiguration *)self disposition];

  return [(NSString *)v2 isEqualToString:0x1EC0A5950];
}

- (BOOL)_allowsReachabilityCheck
{
  return 0;
}

- (BOOL)_allowsConstrainedNetworkAccess
{
  return self->_allowsConstrainedNetworkAccess;
}

- (void)set_xpcActivity:(id)a3
{
  self->_xpcActivity = (OS_xpc_object *)a3;
  if (a3)
  {
    if (xpc_activity_should_be_data_budgeted()) {
      int v5 = 1;
    }
    else {
      int v5 = 2;
    }
  }
  else
  {
    int v5 = 0;
  }
  self->_xpcActivityBudgeted = v5;
}

- (OS_xpc_object)_xpcActivity
{
  return self->_xpcActivity;
}

- (void)set_enablesL4S:(BOOL)a3
{
  if (a3) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  self->_enablesL4SInternal = v3;
}

- (BOOL)_enablesL4S
{
  return self->_enablesL4SInternal == 1;
}

- (BOOL)_allowsHTTP3
{
  return self->_allowsHTTP3Internal != 2;
}

- (void)set_allowsSensitiveLogging:(BOOL)a3
{
  if (a3) {
    int v3 = 0;
  }
  else {
    int v3 = 4;
  }
  self->_loggingPrivacyLevel = v3;
}

- (BOOL)_allowsSensitiveLogging
{
  return self->_loggingPrivacyLevel < 3;
}

- (void)setTLSMaximumSupportedProtocolVersion:(tls_protocol_version_t)TLSMaximumSupportedProtocolVersion
{
  self->_TLSMaximumSupportedProtocol = SSLProtocolFromVersionCodepoint();
}

- (tls_protocol_version_t)TLSMaximumSupportedProtocolVersion
{
  return (unsigned __int16)tlsProtocolVersionForSSLProtocol((SSLProtocol)self->_TLSMaximumSupportedProtocol, 0);
}

- (void)setTLSMinimumSupportedProtocolVersion:(tls_protocol_version_t)TLSMinimumSupportedProtocolVersion
{
  self->_TLSMinimumSupportedProtocol = SSLProtocolFromVersionCodepoint();
}

- (tls_protocol_version_t)TLSMinimumSupportedProtocolVersion
{
  return (unsigned __int16)tlsProtocolVersionForSSLProtocol((SSLProtocol)self->_TLSMinimumSupportedProtocol, 1);
}

- (NSURLSessionConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionConfiguration;
  return [(NSURLSessionConfiguration *)&v3 init];
}

+ (NSURLSessionConfiguration)backgroundSessionConfiguration:(NSString *)identifier
{
  if (+[NSURLSessionConfiguration backgroundSessionConfiguration:]::onceToken != -1) {
    dispatch_once(&+[NSURLSessionConfiguration backgroundSessionConfiguration:]::onceToken, &__block_literal_global_44_23383);
  }
  NSUInteger v4 = objc_opt_class();

  return (NSURLSessionConfiguration *)[v4 backgroundSessionConfigurationWithIdentifier:identifier];
}

uint64_t __60__NSURLSessionConfiguration_backgroundSessionConfiguration___block_invoke()
{
  return CFLog();
}

+ (id)_AVBackgroundSessionConfigurationWithIdentifier:(id)a3
{
  objc_super v3 = (void *)[a1 backgroundSessionConfigurationWithIdentifier:a3];
  objc_msgSend(v3, "set_supportsAVAssetDownloads:", 1);
  return v3;
}

@end