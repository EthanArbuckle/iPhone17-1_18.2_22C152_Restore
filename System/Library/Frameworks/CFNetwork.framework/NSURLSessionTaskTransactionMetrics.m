@interface NSURLSessionTaskTransactionMetrics
+ (BOOL)supportsSecureCoding;
- ($A7E85E0D0E93E2D4C438E55FFF3D0B23)_connectionTiming;
- (BOOL)_apsRelayAttempted;
- (BOOL)_apsRelaySucceeded;
- (BOOL)_connectionRace;
- (BOOL)_connectionTimingCached;
- (BOOL)_isUnlistedTracker;
- (BOOL)_localCache;
- (BOOL)_secureConnection;
- (BOOL)_serverPush;
- (BOOL)_usedTFO;
- (BOOL)_usesMultipath;
- (BOOL)isCellular;
- (BOOL)isConstrained;
- (BOOL)isExpensive;
- (BOOL)isMultipath;
- (BOOL)isProxyConnection;
- (BOOL)isReusedConnection;
- (NSDate)_firstByteReceivedDate;
- (NSDate)connectEndDate;
- (NSDate)connectStartDate;
- (NSDate)domainLookupEndDate;
- (NSDate)domainLookupStartDate;
- (NSDate)fetchStartDate;
- (NSDate)requestEndDate;
- (NSDate)requestStartDate;
- (NSDate)responseEndDate;
- (NSDate)responseStartDate;
- (NSDate)secureConnectionEndDate;
- (NSDate)secureConnectionStartDate;
- (NSNumber)_proxyPort;
- (NSNumber)localPort;
- (NSNumber)negotiatedTLSCipherSuite;
- (NSNumber)negotiatedTLSProtocolVersion;
- (NSNumber)remotePort;
- (NSString)_interfaceName;
- (NSString)_localAddressAndPort;
- (NSString)_proxyAddress;
- (NSString)_remoteAddressAndPort;
- (NSString)localAddress;
- (NSString)networkProtocolName;
- (NSString)remoteAddress;
- (NSURLRequest)request;
- (NSURLResponse)response;
- (NSURLSessionTaskMetricsDomainResolutionProtocol)domainResolutionProtocol;
- (NSURLSessionTaskMetricsResourceFetchType)resourceFetchType;
- (NSURLSessionTaskTransactionMetrics)init;
- (NSURLSessionTaskTransactionMetrics)initWithCoder:(id)a3;
- (NSUUID)_connectionIdentifier;
- (OS_nw_data_transfer_report)_dataTransferReport;
- (OS_nw_establishment_report)_establishmentReport;
- (_BYTE)initWithMetrics:(char)a3 forCache:;
- (id)description;
- (int)_negotiatedTLSProtocol;
- (int)_privacyStance;
- (int64_t)_requestHeaderBytesSent;
- (int64_t)_responseBodyBytesDecoded;
- (int64_t)_responseBodyBytesReceived;
- (int64_t)_responseHeaderBytesReceived;
- (int64_t)_totalBytesReceived;
- (int64_t)_totalBytesSent;
- (int64_t)countOfRequestBodyBytesBeforeEncoding;
- (int64_t)countOfRequestBodyBytesSent;
- (int64_t)countOfRequestHeaderBytesSent;
- (int64_t)countOfResponseBodyBytesAfterDecoding;
- (int64_t)countOfResponseBodyBytesReceived;
- (int64_t)countOfResponseHeaderBytesReceived;
- (unsigned)_negotiatedTLSCipher;
- (unsigned)_redirected;
- (void)encodeWithCoder:(id)a3;
- (void)set_connectionTiming:(id *)a3;
- (void)set_connectionTimingCached:(BOOL)a3;
- (void)translateConnectionTiming;
@end

@implementation NSURLSessionTaskTransactionMetrics

- (void).cxx_destruct
{
}

- (_BYTE)initWithMetrics:(char)a3 forCache:
{
  id v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)NSURLSessionTaskTransactionMetrics;
    id v7 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 2, a2);
      a1[9] = a3;
    }
  }

  return a1;
}

- (BOOL)_apsRelaySucceeded
{
  return !self->__forCache && (metrics = self->__metrics) != 0 && metrics->_APSRelaySucceeded;
}

- (BOOL)_apsRelayAttempted
{
  return !self->__forCache && (metrics = self->__metrics) != 0 && metrics->_APSRelayAttempted;
}

- (id)description
{
  v3 = NSString;
  v47 = [(NSURLSessionTaskTransactionMetrics *)self request];
  v46 = [(NSURLSessionTaskTransactionMetrics *)self response];
  v45 = [(NSURLSessionTaskTransactionMetrics *)self fetchStartDate];
  v44 = [(NSURLSessionTaskTransactionMetrics *)self domainLookupStartDate];
  v43 = [(NSURLSessionTaskTransactionMetrics *)self domainLookupEndDate];
  v42 = [(NSURLSessionTaskTransactionMetrics *)self connectStartDate];
  v41 = [(NSURLSessionTaskTransactionMetrics *)self secureConnectionStartDate];
  v40 = [(NSURLSessionTaskTransactionMetrics *)self secureConnectionEndDate];
  v39 = [(NSURLSessionTaskTransactionMetrics *)self connectEndDate];
  v38 = [(NSURLSessionTaskTransactionMetrics *)self requestStartDate];
  v37 = [(NSURLSessionTaskTransactionMetrics *)self requestEndDate];
  v36 = [(NSURLSessionTaskTransactionMetrics *)self responseStartDate];
  v35 = [(NSURLSessionTaskTransactionMetrics *)self responseEndDate];
  v34 = [(NSURLSessionTaskTransactionMetrics *)self networkProtocolName];
  if ([(NSURLSessionTaskTransactionMetrics *)self isProxyConnection]) {
    v4 = "YES";
  }
  else {
    v4 = "NO";
  }
  if ([(NSURLSessionTaskTransactionMetrics *)self isReusedConnection]) {
    v5 = "YES";
  }
  else {
    v5 = "NO";
  }
  if ([(NSURLSessionTaskTransactionMetrics *)self resourceFetchType] == NSURLSessionTaskMetricsResourceFetchTypeNetworkLoad)
  {
    id v6 = "Network Load";
  }
  else if ([(NSURLSessionTaskTransactionMetrics *)self resourceFetchType] == NSURLSessionTaskMetricsResourceFetchTypeLocalCache)
  {
    id v6 = "Local Cache";
  }
  else if ([(NSURLSessionTaskTransactionMetrics *)self resourceFetchType] == NSURLSessionTaskMetricsResourceFetchTypeServerPush)
  {
    id v6 = "Server Push";
  }
  else
  {
    id v6 = "Unknown";
  }
  int64_t v7 = [(NSURLSessionTaskTransactionMetrics *)self countOfRequestHeaderBytesSent];
  int64_t v8 = [(NSURLSessionTaskTransactionMetrics *)self countOfRequestBodyBytesSent];
  int64_t v9 = [(NSURLSessionTaskTransactionMetrics *)self countOfRequestBodyBytesBeforeEncoding];
  int64_t v29 = [(NSURLSessionTaskTransactionMetrics *)self countOfResponseHeaderBytesReceived];
  int64_t v28 = [(NSURLSessionTaskTransactionMetrics *)self countOfResponseBodyBytesReceived];
  int64_t v27 = [(NSURLSessionTaskTransactionMetrics *)self countOfResponseBodyBytesAfterDecoding];
  v33 = [(NSURLSessionTaskTransactionMetrics *)self localAddress];
  v32 = [(NSURLSessionTaskTransactionMetrics *)self localPort];
  v31 = [(NSURLSessionTaskTransactionMetrics *)self remoteAddress];
  v30 = [(NSURLSessionTaskTransactionMetrics *)self remotePort];
  v10 = [(NSURLSessionTaskTransactionMetrics *)self negotiatedTLSProtocolVersion];
  int64_t v22 = v7;
  v23 = v6;
  v24 = v5;
  v25 = v4;
  v26 = v3;
  uint64_t v11 = [v10 unsignedShortValue];
  v12 = [(NSURLSessionTaskTransactionMetrics *)self negotiatedTLSCipherSuite];
  uint64_t v13 = [v12 unsignedShortValue];
  if ([(NSURLSessionTaskTransactionMetrics *)self isCellular]) {
    v14 = "YES";
  }
  else {
    v14 = "NO";
  }
  if ([(NSURLSessionTaskTransactionMetrics *)self isExpensive]) {
    v15 = "YES";
  }
  else {
    v15 = "NO";
  }
  BOOL v16 = [(NSURLSessionTaskTransactionMetrics *)self isConstrained];
  BOOL v17 = [(NSURLSessionTaskTransactionMetrics *)self isMultipath];
  v18 = "NO";
  if (v16) {
    v19 = "YES";
  }
  else {
    v19 = "NO";
  }
  if (v17) {
    v18 = "YES";
  }
  objc_msgSend(v26, "stringWithFormat:", @"(Request) %@\n(Response) %@\n(Fetch Start) %@\n(Domain Lookup Start) %@\n(Domain Lookup End) %@\n(Connect Start) %@\n(Secure Connection Start) %@\n(Secure Connection End) %@\n(Connect End) %@\n(Request Start) %@\n(Request End) %@\n(Response Start) %@\n(Response End) %@\n(Protocol Name) %@\n(Proxy Connection) %s\n(Reused Connection) %s\n(Fetch Type) %s\n(Request Header Bytes) %lld\n(Request Body Transfer Bytes) %lld\n(Request Body Bytes) %lld\n(Response Header Bytes) %lld\n(Response Body Transfer Bytes) %lld\n(Response Body Bytes) %lld\n(Local Address) %@\n(Local Port) %@\n(Remote Address) %@\n(Remote Port) %@\n(TLS Protocol Version) 0x%04hX\n(TLS Cipher Suite) 0x%04hX\n(Cellular) %s\n(Expensive) %s\n(Constrained) %s\n(Multipath) %s\n", v47, v46, v45, v44, v43, v42, v41, v40, v39, v38, v37, v36, v35, v34, v25, v24,
    v23,
    v22,
    v8,
    v9,
    v29,
    v28,
    v27,
    v33,
    v32,
    v31,
    v30,
    v11,
    v13,
    v14,
    v15,
    v19,
  v20 = v18);

  return v20;
}

- (NSURLResponse)response
{
  metrics = self->__metrics;
  if (!metrics) {
    return (NSURLResponse *)0;
  }
  uint64_t v3 = 72;
  if (!self->__forCache) {
    uint64_t v3 = 80;
  }
  return (NSURLResponse *)*(id *)((char *)&metrics->super.isa + v3);
}

- (NSURLSessionTaskMetricsResourceFetchType)resourceFetchType
{
  if (self->__forCache) {
    return 3;
  }
  metrics = self->__metrics;
  if (!metrics || !metrics->_scheduledOriginLoad) {
    return 0;
  }
  if (metrics->_pushed) {
    return 2;
  }
  return 1;
}

- (NSString)remoteAddress
{
  if (self->__forCache) {
    goto LABEL_4;
  }
  metrics = self->__metrics;
  if (metrics)
  {
    if (metrics->_pushed)
    {
LABEL_4:
      uint64_t v3 = 0;
      goto LABEL_5;
    }
    id v5 = objc_getProperty(metrics, a2, 88, 1);
    id v6 = v5;
    if (v5)
    {
      int64_t v7 = (void *)*((void *)v5 + 18);
      goto LABEL_10;
    }
  }
  else
  {
    id v6 = 0;
  }
  int64_t v7 = 0;
LABEL_10:
  int64_t v8 = v7;

  if (v8 && nw_endpoint_get_type(v8) == nw_endpoint_type_address)
  {
    int64_t v9 = nw_endpoint_copy_address_string(v8);
    uint64_t v3 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v9, 0x600u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
  }
  else
  {
    uint64_t v3 = 0;
  }

LABEL_5:

  return (NSString *)v3;
}

- (NSURLRequest)request
{
  metrics = self->__metrics;
  if (self->__forCache)
  {
    if (metrics) {
      metrics = (__CFN_TransactionMetrics *)metrics->_request;
    }
    uint64_t v3 = metrics;
    if (v3)
    {
LABEL_5:
      v4 = v3;
      goto LABEL_14;
    }
  }
  else
  {
    if (metrics && (id v6 = metrics->_transferredRequest) != 0)
    {
      int64_t v7 = v6;
      uint64_t v3 = (__CFN_TransactionMetrics *)v7;
    }
    else
    {
      int64_t v8 = self->__metrics;
      if (v8) {
        int64_t v8 = (__CFN_TransactionMetrics *)v8->_request;
      }
      uint64_t v3 = v8;
      int64_t v7 = 0;
    }

    if (v3) {
      goto LABEL_5;
    }
  }
  v4 = objc_alloc_init(NSURLRequest);
LABEL_14:
  int64_t v9 = v4;

  return v9;
}

- (BOOL)isMultipath
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics)
  {
    id v5 = 0;
    goto LABEL_10;
  }
  if (!metrics->_pushed)
  {
    id v5 = objc_getProperty(metrics, a2, 88, 1);
    if (v5)
    {
      BOOL v3 = v5[18] != 0;
LABEL_8:

      return v3;
    }
LABEL_10:
    BOOL v3 = 0;
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)isProxyConnection
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics)
  {
    id v5 = 0;
    goto LABEL_12;
  }
  id v4 = objc_getProperty(metrics, a2, 88, 1);
  id v5 = v4;
  if (!v4)
  {
LABEL_12:
    id v6 = 0;
    goto LABEL_6;
  }
  id v6 = (void *)*((void *)v4 + 21);
LABEL_6:
  int64_t v7 = v6;

  if (v7) {
    BOOL used_proxy = nw_establishment_report_get_used_proxy(v7);
  }
  else {
    BOOL used_proxy = 0;
  }

  return used_proxy;
}

- (NSString)networkProtocolName
{
  if (self->__forCache) {
    goto LABEL_4;
  }
  metrics = self->__metrics;
  if (metrics)
  {
    if (metrics->_pushed)
    {
LABEL_4:
      id v3 = 0;
      goto LABEL_5;
    }
    id Property = objc_getProperty(metrics, a2, 88, 1);
    int64_t v7 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v6, 160, 1);
    }
  }
  else
  {
    int64_t v7 = 0;
    id Property = 0;
  }
  id v3 = Property;

LABEL_5:

  return (NSString *)v3;
}

- (BOOL)isCellular
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics)
  {
    id v5 = 0;
    goto LABEL_10;
  }
  if (!metrics->_pushed)
  {
    id v5 = objc_getProperty(metrics, a2, 88, 1);
    if (v5)
    {
      BOOL v3 = v5[15] != 0;
LABEL_8:

      return v3;
    }
LABEL_10:
    BOOL v3 = 0;
    goto LABEL_8;
  }
  return 0;
}

- (NSDate)domainLookupStartDate
{
  if (self->__forCache)
  {
    v2 = 0;
  }
  else
  {
    [(NSURLSessionTaskTransactionMetrics *)(uint64_t)self translateConnectionTiming];
    v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->domainLookupBeginTime];
  }

  return (NSDate *)v2;
}

- (NSDate)connectStartDate
{
  if (self->__forCache)
  {
    v2 = 0;
  }
  else
  {
    [(NSURLSessionTaskTransactionMetrics *)(uint64_t)self translateConnectionTiming];
    v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->connectBeginTime];
  }

  return (NSDate *)v2;
}

- (NSDate)domainLookupEndDate
{
  if (self->__forCache)
  {
    v2 = 0;
  }
  else
  {
    [(NSURLSessionTaskTransactionMetrics *)(uint64_t)self translateConnectionTiming];
    LODWORD(v4) = self->domainLookupDuration;
    v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->domainLookupBeginTime + (double)v4 / 1000.0];
  }

  return (NSDate *)v2;
}

- (NSDate)connectEndDate
{
  if (self->__forCache)
  {
    v2 = 0;
  }
  else
  {
    [(NSURLSessionTaskTransactionMetrics *)(uint64_t)self translateConnectionTiming];
    LODWORD(v4) = self->connectDuration;
    v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->connectBeginTime + (double)v4 / 1000.0];
  }

  return (NSDate *)v2;
}

- (void)translateConnectionTiming
{
  if (a1 && !*(unsigned char *)(a1 + 8))
  {
    BOOL v3 = *(unsigned char **)(a1 + 16);
    if (v3 && v3[9] && !v3[10])
    {
      id v4 = objc_getProperty(v3, a2, 88, 1);
      connectionTimingFromMetrics((__CFN_ConnectionMetrics *)v6, v4);
      long long v5 = v6[1];
      *(_OWORD *)(a1 + 24) = v6[0];
      *(_OWORD *)(a1 + 40) = v5;
    }
    else
    {
      *(int64x2_t *)(a1 + 24) = vdupq_n_s64(0x7FF8000000000000uLL);
      *(void *)(a1 + 40) = 0;
      *(void *)(a1 + 45) = 0;
    }
    *(unsigned char *)(a1 + 8) = 1;
  }
}

- (NSDate)responseStartDate
{
  metrics = self->__metrics;
  if (self->__forCache)
  {
    if (metrics)
    {
      double cacheLookupEndTime = metrics->_cacheLookupEndTime;
      goto LABEL_6;
    }
  }
  else if (metrics)
  {
    double cacheLookupEndTime = metrics->_responseBeginTime;
    goto LABEL_6;
  }
  double cacheLookupEndTime = 0.0;
LABEL_6:
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:cacheLookupEndTime];

  return (NSDate *)v4;
}

- (NSDate)requestStartDate
{
  metrics = self->__metrics;
  if (self->__forCache)
  {
    if (metrics)
    {
      double cacheLookupBeginTime = metrics->_cacheLookupBeginTime;
      goto LABEL_6;
    }
  }
  else if (metrics)
  {
    double cacheLookupBeginTime = metrics->_requestBeginTime;
    goto LABEL_6;
  }
  double cacheLookupBeginTime = 0.0;
LABEL_6:
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:cacheLookupBeginTime];

  return (NSDate *)v4;
}

- (NSDate)responseEndDate
{
  metrics = self->__metrics;
  if (self->__forCache)
  {
    if (metrics)
    {
      double cacheLookupEndTime = metrics->_cacheLookupEndTime;
      goto LABEL_6;
    }
  }
  else if (metrics)
  {
    double cacheLookupEndTime = metrics->_responseEndTime;
    goto LABEL_6;
  }
  double cacheLookupEndTime = 0.0;
LABEL_6:
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:cacheLookupEndTime];

  return (NSDate *)v4;
}

- (NSDate)fetchStartDate
{
  metrics = self->__metrics;
  if (metrics) {
    double beginTime = metrics->_beginTime;
  }
  else {
    double beginTime = 0.0;
  }
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:beginTime];

  return (NSDate *)v4;
}

- (NSDate)secureConnectionStartDate
{
  if (self->__forCache
    || ([(NSURLSessionTaskTransactionMetrics *)(uint64_t)self translateConnectionTiming], !self->secure))
  {
    v2 = 0;
  }
  else
  {
    v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->connectBeginTime + (double)(self->connectDuration - self->secureConnectionDuration) / 1000.0];
  }

  return (NSDate *)v2;
}

- (BOOL)isReusedConnection
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics) {
    return 1;
  }
  if (metrics->_pushed) {
    return 0;
  }
  return !metrics->_firstOnConnection;
}

- (NSDate)secureConnectionEndDate
{
  if (self->__forCache
    || ([(NSURLSessionTaskTransactionMetrics *)(uint64_t)self translateConnectionTiming], !self->secure))
  {
    v2 = 0;
  }
  else
  {
    LODWORD(v4) = self->connectDuration;
    v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->connectBeginTime + (double)v4 / 1000.0];
  }

  return (NSDate *)v2;
}

- (NSDate)requestEndDate
{
  metrics = self->__metrics;
  if (self->__forCache)
  {
    if (metrics)
    {
      double cacheLookupBeginTime = metrics->_cacheLookupBeginTime;
      goto LABEL_6;
    }
  }
  else if (metrics)
  {
    double cacheLookupBeginTime = metrics->_requestEndTime;
    goto LABEL_6;
  }
  double cacheLookupBeginTime = 0.0;
LABEL_6:
  unint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:cacheLookupBeginTime];

  return (NSDate *)v4;
}

- (int64_t)countOfResponseHeaderBytesReceived
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics || metrics->_pushed) {
    return 0;
  }
  else {
    return metrics->_responseHeaderSize;
  }
}

- (int64_t)countOfResponseBodyBytesReceived
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics || metrics->_pushed) {
    return 0;
  }
  else {
    return metrics->_responseBodyTransferSize;
  }
}

- (int64_t)countOfRequestHeaderBytesSent
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics || metrics->_pushed) {
    return 0;
  }
  else {
    return metrics->_requestHeaderSize;
  }
}

- (int64_t)countOfRequestBodyBytesSent
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics || metrics->_pushed) {
    return 0;
  }
  else {
    return metrics->_requestBodyTransferSize;
  }
}

- (BOOL)isExpensive
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics)
  {
    long long v5 = 0;
    goto LABEL_10;
  }
  if (!metrics->_pushed)
  {
    long long v5 = objc_getProperty(metrics, a2, 88, 1);
    if (v5)
    {
      BOOL v3 = v5[16] != 0;
LABEL_8:

      return v3;
    }
LABEL_10:
    BOOL v3 = 0;
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)isConstrained
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics)
  {
    long long v5 = 0;
    goto LABEL_10;
  }
  if (!metrics->_pushed)
  {
    long long v5 = objc_getProperty(metrics, a2, 88, 1);
    if (v5)
    {
      BOOL v3 = v5[17] != 0;
LABEL_8:

      return v3;
    }
LABEL_10:
    BOOL v3 = 0;
    goto LABEL_8;
  }
  return 0;
}

- (int64_t)countOfResponseBodyBytesAfterDecoding
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics || metrics->_pushed) {
    return 0;
  }
  else {
    return metrics->_responseBodySize;
  }
}

- (NSNumber)negotiatedTLSProtocolVersion
{
  if (!self->__forCache
    && (metrics = self->__metrics) != 0
    && !metrics->_pushed
    && (long long v5 = (unsigned __int16 *)objc_getProperty(metrics, a2, 88, 1)) != 0
    && (uint64_t v6 = v5[14], v5, v6))
  {
    BOOL v3 = [NSNumber numberWithUnsignedShort:v6];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSNumber)remotePort
{
  if (self->__forCache) {
    goto LABEL_4;
  }
  metrics = self->__metrics;
  if (metrics)
  {
    if (metrics->_pushed)
    {
LABEL_4:
      BOOL v3 = 0;
      goto LABEL_5;
    }
    id v5 = objc_getProperty(metrics, a2, 88, 1);
    uint64_t v6 = v5;
    if (v5)
    {
      int64_t v7 = (void *)*((void *)v5 + 18);
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  int64_t v7 = 0;
LABEL_10:
  int64_t v8 = v7;

  if (v8 && nw_endpoint_get_type(v8) == nw_endpoint_type_address)
  {
    BOOL v3 = [NSNumber numberWithUnsignedShort:nw_endpoint_get_port(v8)];
  }
  else
  {
    BOOL v3 = 0;
  }

LABEL_5:

  return (NSNumber *)v3;
}

- (NSNumber)negotiatedTLSCipherSuite
{
  if (!self->__forCache
    && (metrics = self->__metrics) != 0
    && !metrics->_pushed
    && (id v5 = (unsigned __int16 *)objc_getProperty(metrics, a2, 88, 1)) != 0
    && (uint64_t v6 = v5[15], v5, v6))
  {
    BOOL v3 = [NSNumber numberWithUnsignedShort:v6];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSNumber)localPort
{
  if (self->__forCache) {
    goto LABEL_4;
  }
  metrics = self->__metrics;
  if (metrics)
  {
    if (metrics->_pushed)
    {
LABEL_4:
      BOOL v3 = 0;
      goto LABEL_5;
    }
    id v5 = objc_getProperty(metrics, a2, 88, 1);
    uint64_t v6 = v5;
    if (v5)
    {
      int64_t v7 = (void *)*((void *)v5 + 17);
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  int64_t v7 = 0;
LABEL_10:
  int64_t v8 = v7;

  if (v8 && nw_endpoint_get_type(v8) == nw_endpoint_type_address)
  {
    BOOL v3 = [NSNumber numberWithUnsignedShort:nw_endpoint_get_port(v8)];
  }
  else
  {
    BOOL v3 = 0;
  }

LABEL_5:

  return (NSNumber *)v3;
}

- (NSString)localAddress
{
  if (self->__forCache) {
    goto LABEL_4;
  }
  metrics = self->__metrics;
  if (metrics)
  {
    if (metrics->_pushed)
    {
LABEL_4:
      BOOL v3 = 0;
      goto LABEL_5;
    }
    id v5 = objc_getProperty(metrics, a2, 88, 1);
    uint64_t v6 = v5;
    if (v5)
    {
      int64_t v7 = (void *)*((void *)v5 + 17);
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  int64_t v7 = 0;
LABEL_10:
  int64_t v8 = v7;

  if (v8 && nw_endpoint_get_type(v8) == nw_endpoint_type_address)
  {
    int64_t v9 = nw_endpoint_copy_address_string(v8);
    BOOL v3 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v9, 0x600u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
  }
  else
  {
    BOOL v3 = 0;
  }

LABEL_5:

  return (NSString *)v3;
}

- (int64_t)countOfRequestBodyBytesBeforeEncoding
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics || metrics->_pushed) {
    return 0;
  }
  else {
    return metrics->_requestBodySize;
  }
}

- (OS_nw_data_transfer_report)_dataTransferReport
{
  if (self->__forCache)
  {
    v2 = 0;
  }
  else
  {
    metrics = self->__metrics;
    if (metrics) {
      metrics = (__CFN_TransactionMetrics *)metrics->_dataTransferReport;
    }
    v2 = metrics;
  }

  return (OS_nw_data_transfer_report *)v2;
}

- (BOOL)_usesMultipath
{
  if (!self->__forCache)
  {
    metrics = self->__metrics;
    if (metrics)
    {
      unint64_t v4 = objc_getProperty(metrics, a2, 88, 1);
      if (v4)
      {
        BOOL v2 = v4[18] != 0;
LABEL_6:

        return v2;
      }
    }
    else
    {
      unint64_t v4 = 0;
    }
    BOOL v2 = 0;
    goto LABEL_6;
  }
  return 0;
}

- (int)_privacyStance
{
  if (!self->__forCache)
  {
    metrics = self->__metrics;
    if (metrics)
    {
      unint64_t v4 = objc_getProperty(metrics, a2, 88, 1);
      if (v4)
      {
        int v2 = v4[8];
LABEL_6:

        return v2;
      }
    }
    else
    {
      unint64_t v4 = 0;
    }
    int v2 = 0;
    goto LABEL_6;
  }
  return 0;
}

- (OS_nw_establishment_report)_establishmentReport
{
  if (self->__forCache)
  {
    id v2 = 0;
    goto LABEL_7;
  }
  metrics = self->__metrics;
  if (!metrics)
  {
    id v5 = 0;
    goto LABEL_11;
  }
  id v4 = objc_getProperty(metrics, a2, 88, 1);
  id v5 = v4;
  if (!v4)
  {
LABEL_11:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = (void *)*((void *)v4 + 21);
LABEL_6:
  id v2 = v6;

LABEL_7:

  return (OS_nw_establishment_report *)v2;
}

- (void)set_connectionTimingCached:(BOOL)a3
{
  self->__connectionTimingCached = a3;
}

- (BOOL)_connectionTimingCached
{
  return self->__connectionTimingCached;
}

- (void)set_connectionTiming:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->domainLookupDuration = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->domainLookupBeginTime = v3;
}

- ($A7E85E0D0E93E2D4C438E55FFF3D0B23)_connectionTiming
{
  long long v3 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var4;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (NSURLSessionTaskMetricsDomainResolutionProtocol)domainResolutionProtocol
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics)
  {
    uint64_t v6 = 0;
LABEL_13:
    int64_t v7 = 0;
    goto LABEL_8;
  }
  if (metrics->_pushed) {
    return 0;
  }
  id v5 = objc_getProperty(metrics, a2, 88, 1);
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_13;
  }
  int64_t v7 = (void *)*((void *)v5 + 21);
LABEL_8:
  int64_t v8 = v7;

  if (v8)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    int v13 = 0;
    enumerate_block[0] = MEMORY[0x1E4F143A8];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __62__NSURLSessionTaskTransactionMetrics_domainResolutionProtocol__block_invoke;
    enumerate_block[3] = &unk_1E5258368;
    enumerate_block[4] = &v10;
    nw_establishment_report_enumerate_resolution_reports(v8, enumerate_block);
    NSURLSessionTaskMetricsDomainResolutionProtocol v3 = (unint64_t)*((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    NSURLSessionTaskMetricsDomainResolutionProtocol v3 = NSURLSessionTaskMetricsDomainResolutionProtocolUnknown;
  }

  return v3;
}

uint64_t __62__NSURLSessionTaskTransactionMetrics_domainResolutionProtocol__block_invoke(uint64_t a1, void *a2)
{
  NSURLSessionTaskMetricsDomainResolutionProtocol v3 = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = nw_resolution_report_get_protocol(v3);

  return 0;
}

- (NSURLSessionTaskTransactionMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionTaskTransactionMetrics;
  return [(NSURLSessionTaskTransactionMetrics *)&v3 init];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->__metrics forKey:@"metrics"];
  [v4 encodeBool:self->__forCache forKey:@"forCache"];
}

- (NSURLSessionTaskTransactionMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSURLSessionTaskTransactionMetrics;
  id v5 = [(NSURLSessionTaskTransactionMetrics *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metrics"];
    metrics = v5->__metrics;
    v5->__metrics = (__CFN_TransactionMetrics *)v6;

    v5->__forCache = [v4 decodeBoolForKey:@"forCache"];
  }

  return v5;
}

- (BOOL)_usedTFO
{
  if (!self->__forCache)
  {
    metrics = self->__metrics;
    if (metrics)
    {
      id v4 = objc_getProperty(metrics, a2, 88, 1);
      if (v4)
      {
        BOOL v2 = v4[19] != 0;
LABEL_6:

        return v2;
      }
    }
    else
    {
      id v4 = 0;
    }
    BOOL v2 = 0;
    goto LABEL_6;
  }
  return 0;
}

- (BOOL)_isUnlistedTracker
{
  if (!self->__forCache)
  {
    metrics = self->__metrics;
    if (metrics)
    {
      id v4 = objc_getProperty(metrics, a2, 88, 1);
      if (v4)
      {
        BOOL v2 = v4[20] != 0;
LABEL_6:

        return v2;
      }
    }
    else
    {
      id v4 = 0;
    }
    BOOL v2 = 0;
    goto LABEL_6;
  }
  return 0;
}

- (NSNumber)_proxyPort
{
  if (self->__forCache)
  {
    BOOL v2 = 0;
    goto LABEL_14;
  }
  metrics = self->__metrics;
  if (!metrics)
  {
    id v5 = 0;
    goto LABEL_18;
  }
  id v4 = objc_getProperty(metrics, a2, 88, 1);
  id v5 = v4;
  if (!v4)
  {
LABEL_18:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = (void *)*((void *)v4 + 21);
LABEL_6:
  int64_t v7 = v6;

  if (v7)
  {
    int64_t v8 = nw_establishment_report_copy_proxy_endpoint(v7);
    objc_super v9 = v8;
    if (v8 && nw_endpoint_get_type(v8) == nw_endpoint_type_address)
    {
      BOOL v2 = [NSNumber numberWithUnsignedShort:nw_endpoint_get_port(v9)];
    }
    else
    {
      BOOL v2 = 0;
    }
  }
  else
  {
    BOOL v2 = 0;
  }

LABEL_14:

  return (NSNumber *)v2;
}

- (NSString)_proxyAddress
{
  if (self->__forCache)
  {
    BOOL v2 = 0;
    goto LABEL_14;
  }
  metrics = self->__metrics;
  if (!metrics)
  {
    id v5 = 0;
    goto LABEL_18;
  }
  id v4 = objc_getProperty(metrics, a2, 88, 1);
  id v5 = v4;
  if (!v4)
  {
LABEL_18:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = (void *)*((void *)v4 + 21);
LABEL_6:
  int64_t v7 = v6;

  if (v7)
  {
    int64_t v8 = nw_establishment_report_copy_proxy_endpoint(v7);
    objc_super v9 = v8;
    if (v8 && nw_endpoint_get_type(v8) == nw_endpoint_type_address)
    {
      uint64_t v10 = nw_endpoint_copy_address_string(v9);
      BOOL v2 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10, 0x600u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
    }
    else
    {
      BOOL v2 = 0;
    }
  }
  else
  {
    BOOL v2 = 0;
  }

LABEL_14:

  return (NSString *)v2;
}

- (NSString)_interfaceName
{
  if (self->__forCache)
  {
    id v2 = 0;
    goto LABEL_7;
  }
  metrics = self->__metrics;
  if (!metrics)
  {
    id v5 = 0;
    goto LABEL_11;
  }
  id v4 = objc_getProperty(metrics, a2, 88, 1);
  id v5 = v4;
  if (!v4)
  {
LABEL_11:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = (void *)*((void *)v4 + 19);
LABEL_6:
  id v2 = v6;

LABEL_7:

  return (NSString *)v2;
}

- (NSDate)_firstByteReceivedDate
{
  if (!self->__forCache && (metrics = self->__metrics) != 0 && metrics->_firstOnConnection)
  {
    id v4 = objc_getProperty(metrics, a2, 88, 1);
    id v5 = v4;
    if (v4)
    {
      id v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*((double *)v4 + 13)];
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }

  return (NSDate *)v2;
}

- (unsigned)_negotiatedTLSCipher
{
  if (!self->__forCache)
  {
    metrics = self->__metrics;
    if (metrics)
    {
      id v4 = objc_getProperty(metrics, a2, 88, 1);
      if (v4)
      {
        unsigned __int16 v2 = v4[15];
LABEL_6:

        return v2;
      }
    }
    else
    {
      id v4 = 0;
    }
    unsigned __int16 v2 = 0;
    goto LABEL_6;
  }
  return 0;
}

- (int)_negotiatedTLSProtocol
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (metrics) {
    id v4 = objc_getProperty(metrics, a2, 88, 1);
  }
  else {
    id v4 = 0;
  }
  int v2 = SSLProtocolFromVersionCodepoint();

  return v2;
}

- (int64_t)_totalBytesReceived
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics) {
    return 0;
  }
  else {
    return metrics->_responseBodyTransferSize + metrics->_responseHeaderSize;
  }
}

- (int64_t)_totalBytesSent
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics) {
    return 0;
  }
  else {
    return metrics->_requestBodyTransferSize + metrics->_requestHeaderSize;
  }
}

- (int64_t)_responseBodyBytesDecoded
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics) {
    return 0;
  }
  else {
    return metrics->_responseBodySize;
  }
}

- (int64_t)_responseBodyBytesReceived
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics) {
    return 0;
  }
  else {
    return metrics->_responseBodyTransferSize;
  }
}

- (int64_t)_responseHeaderBytesReceived
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics) {
    return 0;
  }
  else {
    return metrics->_responseHeaderSize;
  }
}

- (int64_t)_requestHeaderBytesSent
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics) {
    return 0;
  }
  else {
    return metrics->_requestHeaderSize;
  }
}

- (NSUUID)_connectionIdentifier
{
  if (self->__forCache)
  {
    id v2 = 0;
  }
  else
  {
    metrics = self->__metrics;
    if (metrics)
    {
      id Property = objc_getProperty(metrics, a2, 88, 1);
      uint64_t v6 = Property;
      if (Property) {
        id Property = objc_getProperty(Property, v5, 64, 1);
      }
    }
    else
    {
      uint64_t v6 = 0;
      id Property = 0;
    }
    id v2 = Property;
  }

  return (NSUUID *)v2;
}

- (NSString)_remoteAddressAndPort
{
  if (self->__forCache)
  {
    id v2 = 0;
    goto LABEL_11;
  }
  metrics = self->__metrics;
  if (metrics)
  {
    id v4 = objc_getProperty(metrics, a2, 88, 1);
    id v5 = v4;
    if (v4)
    {
      uint64_t v6 = (void *)*((void *)v4 + 18);
      goto LABEL_6;
    }
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = 0;
LABEL_6:
  int64_t v7 = v6;

  if (v7 && nw_endpoint_get_type(v7) == nw_endpoint_type_address)
  {
    id v2 = [v7 description];
  }
  else
  {
    id v2 = 0;
  }

LABEL_11:

  return (NSString *)v2;
}

- (NSString)_localAddressAndPort
{
  if (self->__forCache)
  {
    id v2 = 0;
    goto LABEL_11;
  }
  metrics = self->__metrics;
  if (metrics)
  {
    id v4 = objc_getProperty(metrics, a2, 88, 1);
    id v5 = v4;
    if (v4)
    {
      uint64_t v6 = (void *)*((void *)v4 + 17);
      goto LABEL_6;
    }
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = 0;
LABEL_6:
  int64_t v7 = v6;

  if (v7 && nw_endpoint_get_type(v7) == nw_endpoint_type_address)
  {
    id v2 = [v7 description];
  }
  else
  {
    id v2 = 0;
  }

LABEL_11:

  return (NSString *)v2;
}

- (unsigned)_redirected
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  return metrics && metrics->_endReason == 2;
}

- (BOOL)_connectionRace
{
  return 0;
}

- (BOOL)_serverPush
{
  return !self->__forCache && (metrics = self->__metrics) != 0 && metrics->_pushed;
}

- (BOOL)_localCache
{
  return self->__forCache;
}

- (BOOL)_secureConnection
{
  if (!self->__forCache)
  {
    metrics = self->__metrics;
    if (metrics)
    {
      id v4 = objc_getProperty(metrics, a2, 88, 1);
      if (v4)
      {
        BOOL v2 = v4[14] != 0;
LABEL_6:

        return v2;
      }
    }
    else
    {
      id v4 = 0;
    }
    BOOL v2 = 0;
    goto LABEL_6;
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end