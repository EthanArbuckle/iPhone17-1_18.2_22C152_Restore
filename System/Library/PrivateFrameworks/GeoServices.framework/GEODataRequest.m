@interface GEODataRequest
- ($C4D369C9F02205611300857CFD58F739)kind;
- (BOOL)allowTLSSessionTicketUse;
- (BOOL)disallowCellularNetwork;
- (BOOL)needsProxy;
- (BOOL)prefersDirectNetworking;
- (BOOL)requireInexpensiveNetwork;
- (BOOL)requirePluggedIn;
- (BOOL)requireUnconstrainedNetwork;
- (BOOL)useHTTPPost;
- (GEOApplicationAuditToken)auditToken;
- (GEODataRequest)init;
- (GEODataRequest)initWithKind:(id)a3 URL:(id)a4 auditToken:(id)a5 timeoutInterval:(double)a6 additionalHTTPHeaders:(id)a7 bodyData:(id)a8 userAgent:(id)a9 entityTag:(id)a10 cachedData:(id)a11 requestCounterTicket:(id)a12 multipathServiceType:(unint64_t)a13 multipathAlternatePort:(unint64_t)a14 backgroundSessionIdentifier:(id)a15 throttleToken:(id)a16 options:(unint64_t)a17;
- (GEODataRequest)initWithKind:(id)a3 URL:(id)a4 auditToken:(id)a5 timeoutInterval:(double)a6 additionalHTTPHeaders:(id)a7 bodyData:(id)a8 userAgent:(id)a9 entityTag:(id)a10 cachedData:(id)a11 requestCounterTicket:(id)a12 multipathServiceType:(unint64_t)a13 multipathAlternatePort:(unint64_t)a14 throttleToken:(id)a15 options:(unint64_t)a16;
- (GEODataRequest)initWithKind:(id)a3 protobufRequest:(id)a4 URL:(id)a5 additionalHTTPHeaders:(id)a6 auditToken:(id)a7 timeoutInterval:(double)Double traits:(id)a9 requestCounterTicket:(id)a10 multipathServiceType:(unint64_t)a11 multipathAlternatePort:(unint64_t)a12 throttleToken:(id)a13 options:(unint64_t)a14;
- (GEODataRequestThrottlerToken)throttleToken;
- (GEORequestCounterTicket)requestCounterTicket;
- (NSData)bodyData;
- (NSData)cachedData;
- (NSDictionary)additionalHTTPHeaders;
- (NSString)backgroundSessionIdentifier;
- (NSURL)URL;
- (double)timeoutInterval;
- (id)description;
- (id)initForAnalyticsUploadRequest:(id)a3 toURL:(id)a4 requiresProxy:(BOOL)a5 backgroundIdentifier:(id)a6 compressRequest:(BOOL)a7 allowCellular:(BOOL)a8 allowBattery:(BOOL)a9 timeToLive:(double)a10 requestCounterTicket:(id)a11 throttleToken:(id)a12;
- (id)newURLRequest;
- (id)publicLogDescription;
- (id)updatedRequestWithNewBodyData:(id)a3;
- (id)updatedRequestWithNewProtobufRequest:(id)a3;
- (unint64_t)multipathAlternatePort;
- (unint64_t)multipathServiceType;
- (void)setCachedData:(id)a3;
@end

@implementation GEODataRequest

uint64_t __37__GEODataRequest_Task__newURLRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (id)newURLRequest
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E88]);
  v4 = [(GEODataRequest *)self URL];
  v5 = (void *)[v3 initWithURL:v4];

  [v5 setCachePolicy:1];
  [v5 setHTTPShouldHandleCookies:0];
  objc_msgSend(v5, "setAllowsExpensiveNetworkAccess:", -[GEODataRequest requireInexpensiveNetwork](self, "requireInexpensiveNetwork") ^ 1);
  objc_msgSend(v5, "setAllowsConstrainedNetworkAccess:", -[GEODataRequest requireUnconstrainedNetwork](self, "requireUnconstrainedNetwork") ^ 1);
  if ([(GEODataRequest *)self useHTTPPost]) {
    [v5 setHTTPMethod:@"POST"];
  }
  v6 = [(GEODataRequest *)self backgroundSessionIdentifier];
  if (v6)
  {
  }
  else
  {
    [(GEODataRequest *)self timeoutInterval];
    if (v7 > 0.0)
    {
      [(GEODataRequest *)self timeoutInterval];
      objc_msgSend(v5, "setTimeoutInterval:");
    }
  }
  v8 = [(GEODataRequest *)self bodyData];
  [v5 setHTTPBody:v8];

  additionalHTTPHeaders = self->_additionalHTTPHeaders;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__GEODataRequest_Task__newURLRequest__block_invoke;
  v12[3] = &unk_1E53DFD80;
  id v10 = v5;
  id v13 = v10;
  [(NSDictionary *)additionalHTTPHeaders enumerateKeysAndObjectsUsingBlock:v12];

  return v10;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (BOOL)requireInexpensiveNetwork
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

- (NSString)backgroundSessionIdentifier
{
  return self->_backgroundSessionIdentifier;
}

- (BOOL)useHTTPPost
{
  return self->_options & 1;
}

- (BOOL)requireUnconstrainedNetwork
{
  return (LOBYTE(self->_options) >> 6) & 1;
}

- (BOOL)requirePluggedIn
{
  return (LOBYTE(self->_options) >> 5) & 1;
}

- (BOOL)needsProxy
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)disallowCellularNetwork
{
  return LOBYTE(self->_options) >> 7;
}

- (BOOL)allowTLSSessionTicketUse
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- ($C4D369C9F02205611300857CFD58F739)kind
{
  return ($C4D369C9F02205611300857CFD58F739)self->_kind;
}

- (NSData)cachedData
{
  return self->_cachedData;
}

- (unint64_t)multipathServiceType
{
  return self->_multipathServiceType;
}

- (GEORequestCounterTicket)requestCounterTicket
{
  return self->_requestCounterTicket;
}

- (NSDictionary)additionalHTTPHeaders
{
  return self->_additionalHTTPHeaders;
}

- (GEODataRequest)initWithKind:(id)a3 protobufRequest:(id)a4 URL:(id)a5 additionalHTTPHeaders:(id)a6 auditToken:(id)a7 timeoutInterval:(double)Double traits:(id)a9 requestCounterTicket:(id)a10 multipathServiceType:(unint64_t)a11 multipathAlternatePort:(unint64_t)a12 throttleToken:(id)a13 options:(unint64_t)a14
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v47 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a9;
  id v24 = a10;
  id v25 = a13;
  id v48 = 0;
  BOOL v26 = GEOCreateBodyDataForProtocolBufferRequest(a4, a3.var0, 0, &v48);
  id v27 = v48;
  if (!v26)
  {
    v32 = 0;
    v33 = v21;
    v34 = v47;
    goto LABEL_16;
  }
  id v45 = v25;
  id v46 = v24;
  id v44 = v27;
  if (Double <= 0.000001
    && [v23 requestMode] == 1
    && +[GEOPlatform isRunningInGeod])
  {
    v28 = +[GEOOfflineStateManager shared];
    v29 = [v22 offlineCohortId];
    unsigned int v30 = [v28 activeStateForCohortId:v29];
    if (v30 < 2)
    {
LABEL_19:
      v31 = v21;

      goto LABEL_11;
    }
    if (v30 != 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v50 = v30;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
      }
      goto LABEL_19;
    }
    v31 = v21;

    Double = GEOConfigGetDouble(GeoOfflineConfig_FailoverRequestOnlineTimeout, (uint64_t)off_1E9115888);
  }
  else
  {
    v31 = v21;
  }
LABEL_11:
  id v35 = v22;
  if (Double <= 0.000001) {
    Double = GEODataRequestTimeout(*(void *)&a3);
  }
  int BOOL = GEOConfigGetBOOL(GeoServicesConfig_TLSSessionTicketsEnabled, (uint64_t)off_1E9113C58);
  uint64_t v37 = 3;
  if (!BOOL) {
    uint64_t v37 = 1;
  }
  unint64_t v38 = v37 | a14;
  v33 = v31;
  v39 = _protobufHTTPHeaders(v31, *(void *)&a3, v23);
  id v25 = v45;
  unint64_t v43 = v38;
  v34 = v47;
  id v22 = v35;
  id v24 = v46;
  v40 = [(GEODataRequest *)self initWithKind:a3 URL:v47 auditToken:v22 timeoutInterval:v39 additionalHTTPHeaders:v44 bodyData:0 userAgent:Double entityTag:0 cachedData:0 requestCounterTicket:v46 multipathServiceType:a11 multipathAlternatePort:a12 throttleToken:v45 options:v43];

  self = v40;
  id v27 = v44;
  v32 = self;
LABEL_16:

  return v32;
}

- (GEODataRequest)initWithKind:(id)a3 URL:(id)a4 auditToken:(id)a5 timeoutInterval:(double)a6 additionalHTTPHeaders:(id)a7 bodyData:(id)a8 userAgent:(id)a9 entityTag:(id)a10 cachedData:(id)a11 requestCounterTicket:(id)a12 multipathServiceType:(unint64_t)a13 multipathAlternatePort:(unint64_t)a14 throttleToken:(id)a15 options:(unint64_t)a16
{
  return [(GEODataRequest *)self initWithKind:a3 URL:a4 auditToken:a5 timeoutInterval:a7 additionalHTTPHeaders:a8 bodyData:a9 userAgent:a6 entityTag:a10 cachedData:a11 requestCounterTicket:a12 multipathServiceType:a13 multipathAlternatePort:a14 backgroundSessionIdentifier:0 throttleToken:a15 options:a16];
}

- (GEODataRequest)initWithKind:(id)a3 URL:(id)a4 auditToken:(id)a5 timeoutInterval:(double)a6 additionalHTTPHeaders:(id)a7 bodyData:(id)a8 userAgent:(id)a9 entityTag:(id)a10 cachedData:(id)a11 requestCounterTicket:(id)a12 multipathServiceType:(unint64_t)a13 multipathAlternatePort:(unint64_t)a14 backgroundSessionIdentifier:(id)a15 throttleToken:(id)a16 options:(unint64_t)a17
{
  id v54 = a4;
  id obj = a5;
  id v53 = a5;
  id v23 = a7;
  id v56 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  id v28 = a15;
  id v52 = a16;
  v57.receiver = self;
  v57.super_class = (Class)GEODataRequest;
  v29 = [(GEODataRequest *)&v57 init];
  unsigned int v30 = v29;
  if (v29)
  {
    id v51 = v26;
    objc_storeStrong((id *)&v29->_URL, a4);
    objc_storeStrong((id *)&v30->_auditToken, obj);
    uint64_t v31 = [v56 copy];
    bodyData = v30->_bodyData;
    v30->_bodyData = (NSData *)v31;

    if (a6 <= 0.0) {
      a6 = GEODataRequestTimeout(*(void *)&a3);
    }
    v30->_timeoutInterval = a6;
    v30->_kind = ($7466BF22B2A7275A1F5DB80FF4552E0B)a3;
    -[GEODataRequest setCachedData:](v30, "setCachedData:", v26, v24, v27);
    objc_storeStrong((id *)&v30->_requestCounterTicket, a12);
    v30->_multipathServiceType = a13;
    v30->_multipathAlternatePort = a14;
    id v33 = v28;
    uint64_t v34 = [v28 copy];
    backgroundSessionIdentifier = v30->_backgroundSessionIdentifier;
    v30->_backgroundSessionIdentifier = (NSString *)v34;

    objc_storeStrong((id *)&v30->_throttleToken, a16);
    v30->_options = a17;
    uint64_t v36 = [v25 length];
    uint64_t v37 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v23];
    unint64_t v38 = v37;
    id v24 = v47;
    id v27 = v48;
    if (v47 || v36)
    {
      if (v36) {
        [(NSDictionary *)v37 setObject:v25 forKeyedSubscript:@"If-None-Match"];
      }
      if (a3.var0 == 256)
      {
        v39 = +[GEOPlatform sharedPlatform];
        uint64_t v40 = [v39 buildVersion];
        v41 = (void *)v40;
        v42 = @"unknownBuildVer";
        if (v40) {
          v42 = (__CFString *)v40;
        }
        unint64_t v43 = v42;

        [(NSDictionary *)v38 setObject:v43 forKeyedSubscript:@"User-Agent"];
      }
      else
      {
        [(NSDictionary *)v38 setObject:v47 forKeyedSubscript:@"User-Agent"];
      }
    }
    if ((a17 & 8) != 0)
    {
      id v44 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
      [v44 addProxyAuthHeaderOrReAuth:v38 authProxyURL:0];
    }
    additionalHTTPHeaders = v30->_additionalHTTPHeaders;
    v30->_additionalHTTPHeaders = v38;

    id v26 = v51;
    id v28 = v33;
  }

  return v30;
}

- (void)setCachedData:(id)a3
{
}

- (GEODataRequestThrottlerToken)throttleToken
{
  return self->_throttleToken;
}

- (id)publicLogDescription
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithString:&stru_1ED51F370];
  v4 = [(GEODataRequest *)self URL];

  if (v4)
  {
    v5 = [(GEODataRequest *)self URL];
    [v3 appendFormat:@" URL: %@", v5];

    if (self->_options) {
      [v3 appendString:@" POST"];
    }
    v6 = [(GEODataRequest *)self bodyData];

    if (v6)
    {
      double v7 = [(GEODataRequest *)self bodyData];
      objc_msgSend(v3, "appendFormat:", @" body (%zu bytes)", objc_msgSend(v7, "length"));
    }
  }
  v8 = [(GEODataRequest *)self auditToken];

  if (v8)
  {
    v9 = [(GEODataRequest *)self auditToken];
    id v10 = [v9 publicLogDescription];
    [v3 appendFormat:@" audit token: %@", v10];
  }

  return v3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttleToken, 0);
  objc_storeStrong((id *)&self->_backgroundSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_requestCounterTicket, 0);
  objc_storeStrong((id *)&self->_cachedData, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_additionalHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

- (GEODataRequest)init
{
  result = (GEODataRequest *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  v4 = [(GEODataRequest *)self URL];

  if (v4)
  {
    v5 = [(GEODataRequest *)self URL];
    [v3 appendFormat:@" URL: %@", v5];

    if (self->_options) {
      [v3 appendString:@" POST"];
    }
    v6 = [(GEODataRequest *)self bodyData];

    if (v6)
    {
      double v7 = [(GEODataRequest *)self bodyData];
      objc_msgSend(v3, "appendFormat:", @" body (%zu bytes)", objc_msgSend(v7, "length"));
    }
  }
  v8 = [(GEODataRequest *)self auditToken];

  if (v8)
  {
    v9 = [(GEODataRequest *)self auditToken];
    objc_msgSend(v3, "appendFormat:", @" audit token: %p", v9);
  }
  if ([(GEODataRequest *)self multipathServiceType])
  {
    objc_msgSend(v3, "appendFormat:", @" multipath: %llu", -[GEODataRequest multipathServiceType](self, "multipathServiceType"));
    if ([(GEODataRequest *)self multipathAlternatePort]) {
      objc_msgSend(v3, "appendFormat:", @" alt_port: %llu", -[GEODataRequest multipathAlternatePort](self, "multipathAlternatePort"));
    }
  }
  id v10 = [(GEODataRequest *)self backgroundSessionIdentifier];

  if (v10)
  {
    v11 = [(GEODataRequest *)self backgroundSessionIdentifier];
    [v3 appendFormat:@" background session: %@", v11];
  }

  return v3;
}

- (unint64_t)multipathAlternatePort
{
  return self->_multipathAlternatePort;
}

- (BOOL)prefersDirectNetworking
{
  return self->_prefersDirectNetworking;
}

- (id)initForAnalyticsUploadRequest:(id)a3 toURL:(id)a4 requiresProxy:(BOOL)a5 backgroundIdentifier:(id)a6 compressRequest:(BOOL)a7 allowCellular:(BOOL)a8 allowBattery:(BOOL)a9 timeToLive:(double)a10 requestCounterTicket:(id)a11 throttleToken:(id)a12
{
  BOOL v13 = a8;
  BOOL v14 = a7;
  BOOL v15 = a5;
  id v18 = a4;
  id v19 = a11;
  id v20 = a12;
  id v32 = 0;
  BOOL v21 = GEOCreateBodyDataForProtocolBufferRequest(a3, 0xA00u, v14, &v32);
  id v22 = v32;
  if (v21)
  {
    uint64_t v23 = 17;
    if (v13) {
      uint64_t v23 = 1;
    }
    if (a9) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = v23 | 0x20;
    }
    int BOOL = GEOConfigGetBOOL(GeoServicesConfig_TLSSessionTicketsEnabled, (uint64_t)off_1E9113C58);
    uint64_t v26 = v24 | 2;
    if (!BOOL) {
      uint64_t v26 = v24;
    }
    if (v15) {
      uint64_t v27 = v26 | 8;
    }
    else {
      uint64_t v27 = v26;
    }
    id v28 = _protobufHTTPHeaders(0, 0xA00uLL, 0);
    v29 = [(GEODataRequest *)self initWithKind:2560 URL:v18 auditToken:0 timeoutInterval:v28 additionalHTTPHeaders:v22 bodyData:0 userAgent:a10 entityTag:0 cachedData:0 requestCounterTicket:v19 multipathServiceType:0 multipathAlternatePort:0 throttleToken:v20 options:v27];

    self = v29;
    unsigned int v30 = self;
  }
  else
  {
    unsigned int v30 = 0;
  }

  return v30;
}

- (id)updatedRequestWithNewBodyData:(id)a3
{
  id v4 = a3;
  v17 = [GEODataRequest alloc];
  $C4D369C9F02205611300857CFD58F739 v5 = [(GEODataRequest *)self kind];
  v6 = [(GEODataRequest *)self URL];
  double v7 = [(GEODataRequest *)self auditToken];
  [(GEODataRequest *)self timeoutInterval];
  double v9 = v8;
  id v10 = [(GEODataRequest *)self additionalHTTPHeaders];
  v11 = [(GEODataRequest *)self requestCounterTicket];
  unint64_t v12 = [(GEODataRequest *)self multipathServiceType];
  unint64_t v13 = [(GEODataRequest *)self multipathAlternatePort];
  BOOL v14 = [(GEODataRequest *)self throttleToken];
  BOOL v15 = [(GEODataRequest *)v17 initWithKind:v5 URL:v6 auditToken:v7 timeoutInterval:v10 additionalHTTPHeaders:v4 bodyData:0 userAgent:v9 entityTag:0 cachedData:0 requestCounterTicket:v11 multipathServiceType:v12 multipathAlternatePort:v13 throttleToken:v14 options:self->_options];

  return v15;
}

- (id)updatedRequestWithNewProtobufRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = 0;
    BOOL v5 = GEOCreateBodyDataForProtocolBufferRequest(v4, [(GEODataRequest *)self kind], 0, &v10);
    id v6 = v10;
    if (!v5)
    {
      double v7 = self;
      goto LABEL_6;
    }
  }
  else
  {
    id v6 = 0;
  }
  double v7 = [(GEODataRequest *)self updatedRequestWithNewBodyData:v6];
LABEL_6:
  double v8 = v7;

  return v8;
}

@end