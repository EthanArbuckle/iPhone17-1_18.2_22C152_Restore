@interface GEOLogMsgEventNetwork
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDecodeTime;
- (BOOL)hasHttpResponseCode;
- (BOOL)hasManifestEnv;
- (BOOL)hasMptcpNegotiated;
- (BOOL)hasMptcpServiceType;
- (BOOL)hasNetworkService;
- (BOOL)hasQueuedTime;
- (BOOL)hasRedirectCount;
- (BOOL)hasRequestAppIdMajorVer;
- (BOOL)hasRequestAppIdMinorVer;
- (BOOL)hasRequestAppIdentifier;
- (BOOL)hasRequestDataSize;
- (BOOL)hasRequestEnd;
- (BOOL)hasRequestErrorCode;
- (BOOL)hasRequestErrorDescription;
- (BOOL)hasRequestErrorDomain;
- (BOOL)hasRequestStart;
- (BOOL)hasResponseDataSize;
- (BOOL)hasRnfTriggered;
- (BOOL)hasSamplingRate;
- (BOOL)hasServiceIpAddress;
- (BOOL)hasTaskMetrics;
- (BOOL)hasTilesetId;
- (BOOL)hasTotalTime;
- (BOOL)hasWasBackground;
- (BOOL)isEqual:(id)a3;
- (BOOL)mptcpNegotiated;
- (BOOL)readFrom:(id)a3;
- (BOOL)rnfTriggered;
- (BOOL)wasBackground;
- (GEOLogMsgEventNetwork)init;
- (GEOLogMsgEventNetwork)initWithData:(id)a3;
- (GEOLogMsgEventNetwork)initWithDictionary:(id)a3;
- (GEOLogMsgEventNetwork)initWithJSON:(id)a3;
- (GEONetworkSessionTaskTransactionMetrics)taskMetrics;
- (NSString)manifestEnv;
- (NSString)requestAppIdMajorVer;
- (NSString)requestAppIdMinorVer;
- (NSString)requestAppIdentifier;
- (NSString)requestErrorDescription;
- (NSString)requestErrorDomain;
- (NSString)serviceIpAddress;
- (double)requestEnd;
- (double)requestStart;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mptcpServiceTypeAsString:(int)a3;
- (id)networkServiceAsString:(int)a3;
- (int)StringAsMptcpServiceType:(id)a3;
- (int)StringAsNetworkService:(id)a3;
- (int)decodeTime;
- (int)httpResponseCode;
- (int)mptcpServiceType;
- (int)networkService;
- (int)queuedTime;
- (int)redirectCount;
- (int)requestDataSize;
- (int)responseDataSize;
- (int)totalTime;
- (int64_t)requestErrorCode;
- (unint64_t)hash;
- (unsigned)samplingRate;
- (unsigned)tilesetId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readManifestEnv;
- (void)_readRequestAppIdMajorVer;
- (void)_readRequestAppIdMinorVer;
- (void)_readRequestAppIdentifier;
- (void)_readRequestErrorDescription;
- (void)_readRequestErrorDomain;
- (void)_readServiceIpAddress;
- (void)_readTaskMetrics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDecodeTime:(int)a3;
- (void)setHasDecodeTime:(BOOL)a3;
- (void)setHasHttpResponseCode:(BOOL)a3;
- (void)setHasMptcpNegotiated:(BOOL)a3;
- (void)setHasMptcpServiceType:(BOOL)a3;
- (void)setHasNetworkService:(BOOL)a3;
- (void)setHasQueuedTime:(BOOL)a3;
- (void)setHasRedirectCount:(BOOL)a3;
- (void)setHasRequestDataSize:(BOOL)a3;
- (void)setHasRequestEnd:(BOOL)a3;
- (void)setHasRequestErrorCode:(BOOL)a3;
- (void)setHasRequestStart:(BOOL)a3;
- (void)setHasResponseDataSize:(BOOL)a3;
- (void)setHasRnfTriggered:(BOOL)a3;
- (void)setHasSamplingRate:(BOOL)a3;
- (void)setHasTilesetId:(BOOL)a3;
- (void)setHasTotalTime:(BOOL)a3;
- (void)setHasWasBackground:(BOOL)a3;
- (void)setHttpResponseCode:(int)a3;
- (void)setManifestEnv:(id)a3;
- (void)setMptcpNegotiated:(BOOL)a3;
- (void)setMptcpServiceType:(int)a3;
- (void)setNetworkService:(int)a3;
- (void)setQueuedTime:(int)a3;
- (void)setRedirectCount:(int)a3;
- (void)setRequestAppIdMajorVer:(id)a3;
- (void)setRequestAppIdMinorVer:(id)a3;
- (void)setRequestAppIdentifier:(id)a3;
- (void)setRequestDataSize:(int)a3;
- (void)setRequestEnd:(double)a3;
- (void)setRequestErrorCode:(int64_t)a3;
- (void)setRequestErrorDescription:(id)a3;
- (void)setRequestErrorDomain:(id)a3;
- (void)setRequestStart:(double)a3;
- (void)setResponseDataSize:(int)a3;
- (void)setRnfTriggered:(BOOL)a3;
- (void)setSamplingRate:(unsigned int)a3;
- (void)setServiceIpAddress:(id)a3;
- (void)setTaskMetrics:(id)a3;
- (void)setTilesetId:(unsigned int)a3;
- (void)setTotalTime:(int)a3;
- (void)setWasBackground:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventNetwork

- (GEOLogMsgEventNetwork)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventNetwork;
  v2 = [(GEOLogMsgEventNetwork *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventNetwork)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventNetwork;
  v3 = [(GEOLogMsgEventNetwork *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)networkService
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $DB617B79121746748C766C9C19229AA4 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x40) != 0) {
    return self->_networkService;
  }
  else {
    return 0;
  }
}

- (void)setNetworkService:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000040u;
  self->_networkService = a3;
}

- (void)setHasNetworkService:(BOOL)a3
{
  if (a3) {
    int v3 = 33554496;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasNetworkService
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)networkServiceAsString:(int)a3
{
  if a3 < 0x1D && ((0x1FFF7FFFu >> a3))
  {
    int v3 = off_1E53F8628[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsNetworkService:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NETWORK_SERVICE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REVERSE_GEOCODER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FORWARD_GEOCODER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SEARCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TILE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_ETA"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SIMPLE_ETA"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SUGGESTIONS"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"BATCH_REVGEO"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"MAP_MATCH"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ADDRESS_CORRECTION_INIT"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ADDRESS_CORRECTION_UPDATE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"PLACE_DATA"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"RESOURCE_LOADER"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"LOG_MESSAGE_USAGE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"LOCATION_SHIFT"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"AB_ASSIGN"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"MANIFEST"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"REALTIME_TRAFFIC_PROBE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"BATCH_TRAFFIC_PROBE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"SYNC"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"WIFI_QUALITY"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"NETWORK_DEFAULTS"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"MUNIN_RESOURCE"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"JUNCTION_VIEW"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"WIFI_TILE"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"INCIDENT"])
  {
    int v4 = 28;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)requestDataSize
{
  return self->_requestDataSize;
}

- (void)setRequestDataSize:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000200u;
  self->_requestDataSize = a3;
}

- (void)setHasRequestDataSize:(BOOL)a3
{
  if (a3) {
    int v3 = 33554944;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFDFFFDFF | v3);
}

- (BOOL)hasRequestDataSize
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (int)responseDataSize
{
  return self->_responseDataSize;
}

- (void)setResponseDataSize:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000400u;
  self->_responseDataSize = a3;
}

- (void)setHasResponseDataSize:(BOOL)a3
{
  if (a3) {
    int v3 = 33555456;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasResponseDataSize
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)_readRequestErrorDomain
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 166) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventNetworkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestErrorDomain_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRequestErrorDomain
{
  return self->_requestErrorDomain != 0;
}

- (NSString)requestErrorDomain
{
  -[GEOLogMsgEventNetwork _readRequestErrorDomain]((uint64_t)self);
  requestErrorDomain = self->_requestErrorDomain;

  return requestErrorDomain;
}

- (void)setRequestErrorDomain:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2400000u;
  objc_storeStrong((id *)&self->_requestErrorDomain, a3);
}

- (int64_t)requestErrorCode
{
  return self->_requestErrorCode;
}

- (void)setRequestErrorCode:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x2000002u;
  self->_requestErrorCode = a3;
}

- (void)setHasRequestErrorCode:(BOOL)a3
{
  if (a3) {
    int v3 = 33554434;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasRequestErrorCode
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readRequestErrorDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 166) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventNetworkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestErrorDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRequestErrorDescription
{
  return self->_requestErrorDescription != 0;
}

- (NSString)requestErrorDescription
{
  -[GEOLogMsgEventNetwork _readRequestErrorDescription]((uint64_t)self);
  requestErrorDescription = self->_requestErrorDescription;

  return requestErrorDescription;
}

- (void)setRequestErrorDescription:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2200000u;
  objc_storeStrong((id *)&self->_requestErrorDescription, a3);
}

- (void)_readRequestAppIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 166) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventNetworkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestAppIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRequestAppIdentifier
{
  return self->_requestAppIdentifier != 0;
}

- (NSString)requestAppIdentifier
{
  -[GEOLogMsgEventNetwork _readRequestAppIdentifier]((uint64_t)self);
  requestAppIdentifier = self->_requestAppIdentifier;

  return requestAppIdentifier;
}

- (void)setRequestAppIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2100000u;
  objc_storeStrong((id *)&self->_requestAppIdentifier, a3);
}

- (int)queuedTime
{
  return self->_queuedTime;
}

- (void)setQueuedTime:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000080u;
  self->_queuedTime = a3;
}

- (void)setHasQueuedTime:(BOOL)a3
{
  if (a3) {
    int v3 = 33554560;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasQueuedTime
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (int)totalTime
{
  return self->_totalTime;
}

- (void)setTotalTime:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2002000u;
  self->_totalTime = a3;
}

- (void)setHasTotalTime:(BOOL)a3
{
  if (a3) {
    int v3 = 33562624;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasTotalTime
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (int)httpResponseCode
{
  return self->_httpResponseCode;
}

- (void)setHttpResponseCode:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000010u;
  self->_httpResponseCode = a3;
}

- (void)setHasHttpResponseCode:(BOOL)a3
{
  if (a3) {
    int v3 = 33554448;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasHttpResponseCode
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (int)decodeTime
{
  return self->_decodeTime;
}

- (void)setDecodeTime:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000008u;
  self->_decodeTime = a3;
}

- (void)setHasDecodeTime:(BOOL)a3
{
  if (a3) {
    int v3 = 33554440;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDecodeTime
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)requestStart
{
  return self->_requestStart;
}

- (void)setRequestStart:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000004u;
  self->_requestStart = a3;
}

- (void)setHasRequestStart:(BOOL)a3
{
  if (a3) {
    int v3 = 33554436;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasRequestStart
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (double)requestEnd
{
  return self->_requestEnd;
}

- (void)setRequestEnd:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000001u;
  self->_requestEnd = a3;
}

- (void)setHasRequestEnd:(BOOL)a3
{
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x2000000);
}

- (BOOL)hasRequestEnd
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)redirectCount
{
  return self->_redirectCount;
}

- (void)setRedirectCount:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000100u;
  self->_redirectCount = a3;
}

- (void)setHasRedirectCount:(BOOL)a3
{
  if (a3) {
    int v3 = 33554688;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasRedirectCount
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (void)_readManifestEnv
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 166) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventNetworkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readManifestEnv_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasManifestEnv
{
  return self->_manifestEnv != 0;
}

- (NSString)manifestEnv
{
  -[GEOLogMsgEventNetwork _readManifestEnv]((uint64_t)self);
  manifestEnv = self->_manifestEnv;

  return manifestEnv;
}

- (void)setManifestEnv:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2020000u;
  objc_storeStrong((id *)&self->_manifestEnv, a3);
}

- (unsigned)tilesetId
{
  return self->_tilesetId;
}

- (void)setTilesetId:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x2001000u;
  self->_tilesetId = a3;
}

- (void)setHasTilesetId:(BOOL)a3
{
  if (a3) {
    int v3 = 33558528;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasTilesetId
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (int)mptcpServiceType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $DB617B79121746748C766C9C19229AA4 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    return self->_mptcpServiceType;
  }
  else {
    return 0;
  }
}

- (void)setMptcpServiceType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000020u;
  self->_mptcpServiceType = a3;
}

- (void)setHasMptcpServiceType:(BOOL)a3
{
  if (a3) {
    int v3 = 33554464;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasMptcpServiceType
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)mptcpServiceTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53F7970[a3];
  }

  return v3;
}

- (int)StringAsMptcpServiceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"HANDOVER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INTERACTIVE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AGGREGATE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)mptcpNegotiated
{
  return self->_mptcpNegotiated;
}

- (void)setMptcpNegotiated:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x2004000u;
  self->_mptcpNegotiated = a3;
}

- (void)setHasMptcpNegotiated:(BOOL)a3
{
  if (a3) {
    int v3 = 33570816;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v3);
}

- (BOOL)hasMptcpNegotiated
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (BOOL)wasBackground
{
  return self->_wasBackground;
}

- (void)setWasBackground:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x2010000u;
  self->_wasBackground = a3;
}

- (void)setHasWasBackground:(BOOL)a3
{
  if (a3) {
    int v3 = 33619968;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v3);
}

- (BOOL)hasWasBackground
{
  return *((unsigned char *)&self->_flags + 2) & 1;
}

- (void)_readServiceIpAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 166) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventNetworkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServiceIpAddress_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasServiceIpAddress
{
  return self->_serviceIpAddress != 0;
}

- (NSString)serviceIpAddress
{
  -[GEOLogMsgEventNetwork _readServiceIpAddress]((uint64_t)self);
  serviceIpAddress = self->_serviceIpAddress;

  return serviceIpAddress;
}

- (void)setServiceIpAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2800000u;
  objc_storeStrong((id *)&self->_serviceIpAddress, a3);
}

- (BOOL)rnfTriggered
{
  return self->_rnfTriggered;
}

- (void)setRnfTriggered:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x2008000u;
  self->_rnfTriggered = a3;
}

- (void)setHasRnfTriggered:(BOOL)a3
{
  if (a3) {
    int v3 = 33587200;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFF7FFF | v3);
}

- (BOOL)hasRnfTriggered
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (void)_readRequestAppIdMajorVer
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 166) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventNetworkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestAppIdMajorVer_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRequestAppIdMajorVer
{
  return self->_requestAppIdMajorVer != 0;
}

- (NSString)requestAppIdMajorVer
{
  -[GEOLogMsgEventNetwork _readRequestAppIdMajorVer]((uint64_t)self);
  requestAppIdMajorVer = self->_requestAppIdMajorVer;

  return requestAppIdMajorVer;
}

- (void)setRequestAppIdMajorVer:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2040000u;
  objc_storeStrong((id *)&self->_requestAppIdMajorVer, a3);
}

- (void)_readRequestAppIdMinorVer
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 166) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventNetworkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestAppIdMinorVer_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRequestAppIdMinorVer
{
  return self->_requestAppIdMinorVer != 0;
}

- (NSString)requestAppIdMinorVer
{
  -[GEOLogMsgEventNetwork _readRequestAppIdMinorVer]((uint64_t)self);
  requestAppIdMinorVer = self->_requestAppIdMinorVer;

  return requestAppIdMinorVer;
}

- (void)setRequestAppIdMinorVer:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2080000u;
  objc_storeStrong((id *)&self->_requestAppIdMinorVer, a3);
}

- (unsigned)samplingRate
{
  return self->_samplingRate;
}

- (void)setSamplingRate:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000800u;
  self->_samplingRate = a3;
}

- (void)setHasSamplingRate:(BOOL)a3
{
  if (a3) {
    int v3 = 33556480;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$DB617B79121746748C766C9C19229AA4 flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasSamplingRate
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)_readTaskMetrics
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 167) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventNetworkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTaskMetrics_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasTaskMetrics
{
  return self->_taskMetrics != 0;
}

- (GEONetworkSessionTaskTransactionMetrics)taskMetrics
{
  -[GEOLogMsgEventNetwork _readTaskMetrics]((uint64_t)self);
  taskMetrics = self->_taskMetrics;

  return taskMetrics;
}

- (void)setTaskMetrics:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x3000000u;
  objc_storeStrong((id *)&self->_taskMetrics, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventNetwork;
  int v4 = [(GEOLogMsgEventNetwork *)&v8 description];
  v5 = [(GEOLogMsgEventNetwork *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventNetwork _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_127;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int v5 = *(_DWORD *)(a1 + 164);
  if ((v5 & 0x40) != 0)
  {
    uint64_t v6 = *(int *)(a1 + 128);
    if v6 < 0x1D && ((0x1FFF7FFFu >> v6))
    {
      objc_super v7 = off_1E53F8628[v6];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 128));
      objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (a2) {
      objc_super v8 = @"networkService";
    }
    else {
      objc_super v8 = @"network_service";
    }
    [v4 setObject:v7 forKey:v8];

    int v5 = *(_DWORD *)(a1 + 164);
  }
  if ((v5 & 0x200) != 0)
  {
    v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 140)];
    if (a2) {
      v10 = @"requestDataSize";
    }
    else {
      v10 = @"request_data_size";
    }
    [v4 setObject:v9 forKey:v10];

    int v5 = *(_DWORD *)(a1 + 164);
  }
  if ((v5 & 0x400) != 0)
  {
    v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 144)];
    if (a2) {
      v12 = @"responseDataSize";
    }
    else {
      v12 = @"response_data_size";
    }
    [v4 setObject:v11 forKey:v12];
  }
  v13 = [(id)a1 requestErrorDomain];
  if (v13)
  {
    if (a2) {
      v14 = @"requestErrorDomain";
    }
    else {
      v14 = @"request_error_domain";
    }
    [v4 setObject:v13 forKey:v14];
  }

  if ((*(unsigned char *)(a1 + 164) & 2) != 0)
  {
    v15 = [NSNumber numberWithLongLong:*(void *)(a1 + 56)];
    if (a2) {
      v16 = @"requestErrorCode";
    }
    else {
      v16 = @"request_error_code";
    }
    [v4 setObject:v15 forKey:v16];
  }
  v17 = [(id)a1 requestErrorDescription];
  if (v17)
  {
    if (a2) {
      v18 = @"requestErrorDescription";
    }
    else {
      v18 = @"request_error_description";
    }
    [v4 setObject:v17 forKey:v18];
  }

  v19 = [(id)a1 requestAppIdentifier];
  if (v19)
  {
    if (a2) {
      v20 = @"requestAppIdentifier";
    }
    else {
      v20 = @"request_app_identifier";
    }
    [v4 setObject:v19 forKey:v20];
  }

  int v21 = *(_DWORD *)(a1 + 164);
  if ((v21 & 0x80) != 0)
  {
    v43 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 132)];
    if (a2) {
      v44 = @"queuedTime";
    }
    else {
      v44 = @"queued_time";
    }
    [v4 setObject:v43 forKey:v44];

    int v21 = *(_DWORD *)(a1 + 164);
    if ((v21 & 0x2000) == 0)
    {
LABEL_43:
      if ((v21 & 0x10) == 0) {
        goto LABEL_44;
      }
      goto LABEL_101;
    }
  }
  else if ((v21 & 0x2000) == 0)
  {
    goto LABEL_43;
  }
  v45 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 156)];
  if (a2) {
    v46 = @"totalTime";
  }
  else {
    v46 = @"total_time";
  }
  [v4 setObject:v45 forKey:v46];

  int v21 = *(_DWORD *)(a1 + 164);
  if ((v21 & 0x10) == 0)
  {
LABEL_44:
    if ((v21 & 8) == 0) {
      goto LABEL_45;
    }
    goto LABEL_105;
  }
LABEL_101:
  v47 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 120)];
  if (a2) {
    v48 = @"httpResponseCode";
  }
  else {
    v48 = @"http_response_code";
  }
  [v4 setObject:v47 forKey:v48];

  int v21 = *(_DWORD *)(a1 + 164);
  if ((v21 & 8) == 0)
  {
LABEL_45:
    if ((v21 & 4) == 0) {
      goto LABEL_46;
    }
    goto LABEL_109;
  }
LABEL_105:
  v49 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 116)];
  if (a2) {
    v50 = @"decodeTime";
  }
  else {
    v50 = @"decode_time";
  }
  [v4 setObject:v49 forKey:v50];

  int v21 = *(_DWORD *)(a1 + 164);
  if ((v21 & 4) == 0)
  {
LABEL_46:
    if ((v21 & 1) == 0) {
      goto LABEL_47;
    }
    goto LABEL_113;
  }
LABEL_109:
  v51 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
  if (a2) {
    v52 = @"requestStart";
  }
  else {
    v52 = @"request_start";
  }
  [v4 setObject:v51 forKey:v52];

  int v21 = *(_DWORD *)(a1 + 164);
  if ((v21 & 1) == 0)
  {
LABEL_47:
    if ((v21 & 0x100) == 0) {
      goto LABEL_52;
    }
    goto LABEL_48;
  }
LABEL_113:
  v53 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  if (a2) {
    v54 = @"requestEnd";
  }
  else {
    v54 = @"request_end";
  }
  [v4 setObject:v53 forKey:v54];

  if ((*(_DWORD *)(a1 + 164) & 0x100) != 0)
  {
LABEL_48:
    v22 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 136)];
    if (a2) {
      v23 = @"redirectCount";
    }
    else {
      v23 = @"redirect_count";
    }
    [v4 setObject:v22 forKey:v23];
  }
LABEL_52:
  v24 = [(id)a1 manifestEnv];
  if (v24)
  {
    if (a2) {
      v25 = @"manifestEnv";
    }
    else {
      v25 = @"manifest_env";
    }
    [v4 setObject:v24 forKey:v25];
  }

  int v26 = *(_DWORD *)(a1 + 164);
  if ((v26 & 0x1000) != 0)
  {
    v55 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 152)];
    if (a2) {
      v56 = @"tilesetId";
    }
    else {
      v56 = @"tileset_id";
    }
    [v4 setObject:v55 forKey:v56];

    int v26 = *(_DWORD *)(a1 + 164);
    if ((v26 & 0x20) == 0)
    {
LABEL_59:
      if ((v26 & 0x4000) == 0) {
        goto LABEL_60;
      }
LABEL_135:
      v61 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 160)];
      if (a2) {
        v62 = @"mptcpNegotiated";
      }
      else {
        v62 = @"mptcp_negotiated";
      }
      [v4 setObject:v61 forKey:v62];

      if ((*(_DWORD *)(a1 + 164) & 0x10000) == 0) {
        goto LABEL_65;
      }
      goto LABEL_61;
    }
  }
  else if ((v26 & 0x20) == 0)
  {
    goto LABEL_59;
  }
  uint64_t v57 = *(int *)(a1 + 124);
  if (v57 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 124));
    v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v58 = off_1E53F7970[v57];
  }
  if (a2) {
    v60 = @"mptcpServiceType";
  }
  else {
    v60 = @"mptcp_service_type";
  }
  [v4 setObject:v58 forKey:v60];

  int v26 = *(_DWORD *)(a1 + 164);
  if ((v26 & 0x4000) != 0) {
    goto LABEL_135;
  }
LABEL_60:
  if ((v26 & 0x10000) != 0)
  {
LABEL_61:
    v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 162)];
    if (a2) {
      v28 = @"wasBackground";
    }
    else {
      v28 = @"was_background";
    }
    [v4 setObject:v27 forKey:v28];
  }
LABEL_65:
  v29 = [(id)a1 serviceIpAddress];
  if (v29)
  {
    if (a2) {
      v30 = @"serviceIpAddress";
    }
    else {
      v30 = @"service_ip_address";
    }
    [v4 setObject:v29 forKey:v30];
  }

  if ((*(unsigned char *)(a1 + 165) & 0x80) != 0)
  {
    v31 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 161)];
    if (a2) {
      v32 = @"rnfTriggered";
    }
    else {
      v32 = @"rnf_triggered";
    }
    [v4 setObject:v31 forKey:v32];
  }
  v33 = [(id)a1 requestAppIdMajorVer];
  if (v33)
  {
    if (a2) {
      v34 = @"requestAppIdMajorVer";
    }
    else {
      v34 = @"request_app_id_major_ver";
    }
    [v4 setObject:v33 forKey:v34];
  }

  v35 = [(id)a1 requestAppIdMinorVer];
  if (v35)
  {
    if (a2) {
      v36 = @"requestAppIdMinorVer";
    }
    else {
      v36 = @"request_app_id_minor_ver";
    }
    [v4 setObject:v35 forKey:v36];
  }

  if ((*(unsigned char *)(a1 + 165) & 8) != 0)
  {
    v37 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 148)];
    if (a2) {
      v38 = @"samplingRate";
    }
    else {
      v38 = @"sampling_rate";
    }
    [v4 setObject:v37 forKey:v38];
  }
  v39 = [(id)a1 taskMetrics];
  v40 = v39;
  if (v39)
  {
    if (a2)
    {
      v41 = [v39 jsonRepresentation];
      v42 = @"taskMetrics";
    }
    else
    {
      v41 = [v39 dictionaryRepresentation];
      v42 = @"task_metrics";
    }
    [v4 setObject:v41 forKey:v42];
  }
LABEL_127:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventNetwork _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventNetwork)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventNetwork *)-[GEOLogMsgEventNetwork _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_204;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_204;
  }
  if (a3) {
    uint64_t v6 = @"networkService";
  }
  else {
    uint64_t v6 = @"network_service";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"NETWORK_SERVICE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"REVERSE_GEOCODER"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"FORWARD_GEOCODER"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"SEARCH"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"TILE"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"TRAFFIC_ETA"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"SIMPLE_ETA"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"SUGGESTIONS"])
    {
      uint64_t v9 = 8;
    }
    else if ([v8 isEqualToString:@"BATCH_REVGEO"])
    {
      uint64_t v9 = 9;
    }
    else if ([v8 isEqualToString:@"MAP_MATCH"])
    {
      uint64_t v9 = 10;
    }
    else if ([v8 isEqualToString:@"ADDRESS_CORRECTION_INIT"])
    {
      uint64_t v9 = 11;
    }
    else if ([v8 isEqualToString:@"ADDRESS_CORRECTION_UPDATE"])
    {
      uint64_t v9 = 12;
    }
    else if ([v8 isEqualToString:@"PLACE_DATA"])
    {
      uint64_t v9 = 13;
    }
    else if ([v8 isEqualToString:@"RESOURCE_LOADER"])
    {
      uint64_t v9 = 14;
    }
    else if ([v8 isEqualToString:@"LOG_MESSAGE_USAGE"])
    {
      uint64_t v9 = 16;
    }
    else if ([v8 isEqualToString:@"LOCATION_SHIFT"])
    {
      uint64_t v9 = 17;
    }
    else if ([v8 isEqualToString:@"AB_ASSIGN"])
    {
      uint64_t v9 = 18;
    }
    else if ([v8 isEqualToString:@"MANIFEST"])
    {
      uint64_t v9 = 19;
    }
    else if ([v8 isEqualToString:@"REALTIME_TRAFFIC_PROBE"])
    {
      uint64_t v9 = 20;
    }
    else if ([v8 isEqualToString:@"BATCH_TRAFFIC_PROBE"])
    {
      uint64_t v9 = 21;
    }
    else if ([v8 isEqualToString:@"SYNC"])
    {
      uint64_t v9 = 22;
    }
    else if ([v8 isEqualToString:@"WIFI_QUALITY"])
    {
      uint64_t v9 = 23;
    }
    else if ([v8 isEqualToString:@"NETWORK_DEFAULTS"])
    {
      uint64_t v9 = 24;
    }
    else if ([v8 isEqualToString:@"MUNIN_RESOURCE"])
    {
      uint64_t v9 = 25;
    }
    else if ([v8 isEqualToString:@"JUNCTION_VIEW"])
    {
      uint64_t v9 = 26;
    }
    else if ([v8 isEqualToString:@"WIFI_TILE"])
    {
      uint64_t v9 = 27;
    }
    else if ([v8 isEqualToString:@"INCIDENT"])
    {
      uint64_t v9 = 28;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_68;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setNetworkService:v9];
LABEL_68:

  if (a3) {
    v10 = @"requestDataSize";
  }
  else {
    v10 = @"request_data_size";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRequestDataSize:", objc_msgSend(v11, "intValue"));
  }

  if (a3) {
    v12 = @"responseDataSize";
  }
  else {
    v12 = @"response_data_size";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setResponseDataSize:", objc_msgSend(v13, "intValue"));
  }

  if (a3) {
    v14 = @"requestErrorDomain";
  }
  else {
    v14 = @"request_error_domain";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = (void *)[v15 copy];
    [a1 setRequestErrorDomain:v16];
  }
  if (a3) {
    v17 = @"requestErrorCode";
  }
  else {
    v17 = @"request_error_code";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRequestErrorCode:", objc_msgSend(v18, "longLongValue"));
  }

  if (a3) {
    v19 = @"requestErrorDescription";
  }
  else {
    v19 = @"request_error_description";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v21 = (void *)[v20 copy];
    [a1 setRequestErrorDescription:v21];
  }
  if (a3) {
    v22 = @"requestAppIdentifier";
  }
  else {
    v22 = @"request_app_identifier";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = (void *)[v23 copy];
    [a1 setRequestAppIdentifier:v24];
  }
  if (a3) {
    v25 = @"queuedTime";
  }
  else {
    v25 = @"queued_time";
  }
  int v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setQueuedTime:", objc_msgSend(v26, "intValue"));
  }

  if (a3) {
    v27 = @"totalTime";
  }
  else {
    v27 = @"total_time";
  }
  v28 = [v5 objectForKeyedSubscript:v27];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTotalTime:", objc_msgSend(v28, "intValue"));
  }

  if (a3) {
    v29 = @"httpResponseCode";
  }
  else {
    v29 = @"http_response_code";
  }
  v30 = [v5 objectForKeyedSubscript:v29];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setHttpResponseCode:", objc_msgSend(v30, "intValue"));
  }

  if (a3) {
    v31 = @"decodeTime";
  }
  else {
    v31 = @"decode_time";
  }
  v32 = [v5 objectForKeyedSubscript:v31];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDecodeTime:", objc_msgSend(v32, "intValue"));
  }

  if (a3) {
    v33 = @"requestStart";
  }
  else {
    v33 = @"request_start";
  }
  v34 = [v5 objectForKeyedSubscript:v33];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v34 doubleValue];
    objc_msgSend(a1, "setRequestStart:");
  }

  if (a3) {
    v35 = @"requestEnd";
  }
  else {
    v35 = @"request_end";
  }
  v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v36 doubleValue];
    objc_msgSend(a1, "setRequestEnd:");
  }

  if (a3) {
    v37 = @"redirectCount";
  }
  else {
    v37 = @"redirect_count";
  }
  v38 = [v5 objectForKeyedSubscript:v37];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRedirectCount:", objc_msgSend(v38, "intValue"));
  }

  if (a3) {
    v39 = @"manifestEnv";
  }
  else {
    v39 = @"manifest_env";
  }
  v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v41 = (void *)[v40 copy];
    [a1 setManifestEnv:v41];
  }
  if (a3) {
    v42 = @"tilesetId";
  }
  else {
    v42 = @"tileset_id";
  }
  v43 = [v5 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTilesetId:", objc_msgSend(v43, "unsignedIntValue"));
  }

  if (a3) {
    v44 = @"mptcpServiceType";
  }
  else {
    v44 = @"mptcp_service_type";
  }
  v45 = [v5 objectForKeyedSubscript:v44];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v46 = v45;
    if ([v46 isEqualToString:@"NONE"])
    {
      uint64_t v47 = 0;
    }
    else if ([v46 isEqualToString:@"HANDOVER"])
    {
      uint64_t v47 = 1;
    }
    else if ([v46 isEqualToString:@"INTERACTIVE"])
    {
      uint64_t v47 = 2;
    }
    else if ([v46 isEqualToString:@"AGGREGATE"])
    {
      uint64_t v47 = 3;
    }
    else
    {
      uint64_t v47 = 0;
    }

    goto LABEL_159;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v47 = [v45 intValue];
LABEL_159:
    [a1 setMptcpServiceType:v47];
  }

  if (a3) {
    v48 = @"mptcpNegotiated";
  }
  else {
    v48 = @"mptcp_negotiated";
  }
  v49 = [v5 objectForKeyedSubscript:v48];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMptcpNegotiated:", objc_msgSend(v49, "BOOLValue"));
  }

  if (a3) {
    v50 = @"wasBackground";
  }
  else {
    v50 = @"was_background";
  }
  v51 = [v5 objectForKeyedSubscript:v50];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWasBackground:", objc_msgSend(v51, "BOOLValue"));
  }

  if (a3) {
    v52 = @"serviceIpAddress";
  }
  else {
    v52 = @"service_ip_address";
  }
  v53 = [v5 objectForKeyedSubscript:v52];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v54 = (void *)[v53 copy];
    [a1 setServiceIpAddress:v54];
  }
  if (a3) {
    v55 = @"rnfTriggered";
  }
  else {
    v55 = @"rnf_triggered";
  }
  v56 = [v5 objectForKeyedSubscript:v55];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRnfTriggered:", objc_msgSend(v56, "BOOLValue"));
  }

  if (a3) {
    uint64_t v57 = @"requestAppIdMajorVer";
  }
  else {
    uint64_t v57 = @"request_app_id_major_ver";
  }
  v58 = [v5 objectForKeyedSubscript:v57];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v59 = (void *)[v58 copy];
    [a1 setRequestAppIdMajorVer:v59];
  }
  if (a3) {
    v60 = @"requestAppIdMinorVer";
  }
  else {
    v60 = @"request_app_id_minor_ver";
  }
  v61 = [v5 objectForKeyedSubscript:v60];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v62 = (void *)[v61 copy];
    [a1 setRequestAppIdMinorVer:v62];
  }
  if (a3) {
    v63 = @"samplingRate";
  }
  else {
    v63 = @"sampling_rate";
  }
  v64 = [v5 objectForKeyedSubscript:v63];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSamplingRate:", objc_msgSend(v64, "unsignedIntValue"));
  }

  if (a3) {
    v65 = @"taskMetrics";
  }
  else {
    v65 = @"task_metrics";
  }
  v66 = [v5 objectForKeyedSubscript:v65];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v67 = [GEONetworkSessionTaskTransactionMetrics alloc];
    if (a3) {
      uint64_t v68 = [(GEONetworkSessionTaskTransactionMetrics *)v67 initWithJSON:v66];
    }
    else {
      uint64_t v68 = [(GEONetworkSessionTaskTransactionMetrics *)v67 initWithDictionary:v66];
    }
    v69 = (void *)v68;
    [a1 setTaskMetrics:v68];
  }
LABEL_204:

  return a1;
}

- (GEOLogMsgEventNetwork)initWithJSON:(id)a3
{
  return (GEOLogMsgEventNetwork *)-[GEOLogMsgEventNetwork _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_3681;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_3682;
    }
    GEOLogMsgEventNetworkReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEONetworkSessionTaskTransactionMetrics *)self->_taskMetrics readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventNetworkIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventNetworkReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*((_WORD *)&self->_flags + 1) & 0x3FE) == 0)
    {
      id v8 = self->_reader;
      objc_sync_enter(v8);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      uint64_t v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v10 writeData:v9];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v8);
      goto LABEL_57;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventNetwork *)self readAll:0];
  $DB617B79121746748C766C9C19229AA4 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    $DB617B79121746748C766C9C19229AA4 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&flags & 0x400) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&flags & 0x200) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_flags & 0x400) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_requestErrorDomain) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_requestErrorDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_requestAppIdentifier) {
    PBDataWriterWriteStringField();
  }
  $DB617B79121746748C766C9C19229AA4 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    $DB617B79121746748C766C9C19229AA4 v6 = self->_flags;
    if ((*(_WORD *)&v6 & 0x2000) == 0)
    {
LABEL_17:
      if ((*(unsigned char *)&v6 & 0x10) == 0) {
        goto LABEL_18;
      }
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field();
  $DB617B79121746748C766C9C19229AA4 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field();
  $DB617B79121746748C766C9C19229AA4 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  $DB617B79121746748C766C9C19229AA4 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v6 & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteDoubleField();
  $DB617B79121746748C766C9C19229AA4 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 1) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_50:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_flags & 0x100) != 0) {
LABEL_22:
  }
    PBDataWriterWriteInt32Field();
LABEL_23:
  if (self->_manifestEnv) {
    PBDataWriterWriteStringField();
  }
  $DB617B79121746748C766C9C19229AA4 v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x1000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $DB617B79121746748C766C9C19229AA4 v7 = self->_flags;
    if ((*(unsigned char *)&v7 & 0x20) == 0)
    {
LABEL_27:
      if ((*(_WORD *)&v7 & 0x4000) == 0) {
        goto LABEL_28;
      }
LABEL_54:
      PBDataWriterWriteBOOLField();
      if ((*(_DWORD *)&self->_flags & 0x10000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
  }
  else if ((*(unsigned char *)&v7 & 0x20) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteInt32Field();
  $DB617B79121746748C766C9C19229AA4 v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x4000) != 0) {
    goto LABEL_54;
  }
LABEL_28:
  if ((*(_DWORD *)&v7 & 0x10000) != 0) {
LABEL_29:
  }
    PBDataWriterWriteBOOLField();
LABEL_30:
  if (self->_serviceIpAddress) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_requestAppIdMajorVer) {
    PBDataWriterWriteStringField();
  }
  if (self->_requestAppIdMinorVer) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_taskMetrics) {
    PBDataWriterWriteSubmessage();
  }
LABEL_57:
}

- (void)copyTo:(id)a3
{
  id v8 = (id *)a3;
  [(GEOLogMsgEventNetwork *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 26) = self->_readerMarkPos;
  *((_DWORD *)v8 + 27) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v8;
  $DB617B79121746748C766C9C19229AA4 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    *((_DWORD *)v8 + 32) = self->_networkService;
    *((_DWORD *)v8 + 41) |= 0x40u;
    $DB617B79121746748C766C9C19229AA4 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x400) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&flags & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v8 + 35) = self->_requestDataSize;
  *((_DWORD *)v8 + 41) |= 0x200u;
  if ((*(_DWORD *)&self->_flags & 0x400) != 0)
  {
LABEL_4:
    *((_DWORD *)v8 + 36) = self->_responseDataSize;
    *((_DWORD *)v8 + 41) |= 0x400u;
  }
LABEL_5:
  if (self->_requestErrorDomain)
  {
    objc_msgSend(v8, "setRequestErrorDomain:");
    int v4 = v8;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v4[7] = self->_requestErrorCode;
    *((_DWORD *)v4 + 41) |= 2u;
  }
  if (self->_requestErrorDescription)
  {
    objc_msgSend(v8, "setRequestErrorDescription:");
    int v4 = v8;
  }
  if (self->_requestAppIdentifier)
  {
    objc_msgSend(v8, "setRequestAppIdentifier:");
    int v4 = v8;
  }
  $DB617B79121746748C766C9C19229AA4 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x80) != 0)
  {
    *((_DWORD *)v4 + 33) = self->_queuedTime;
    *((_DWORD *)v4 + 41) |= 0x80u;
    $DB617B79121746748C766C9C19229AA4 v6 = self->_flags;
    if ((*(_WORD *)&v6 & 0x2000) == 0)
    {
LABEL_15:
      if ((*(unsigned char *)&v6 & 0x10) == 0) {
        goto LABEL_16;
      }
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v4 + 39) = self->_totalTime;
  *((_DWORD *)v4 + 41) |= 0x2000u;
  $DB617B79121746748C766C9C19229AA4 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 30) = self->_httpResponseCode;
  *((_DWORD *)v4 + 41) |= 0x10u;
  $DB617B79121746748C766C9C19229AA4 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 29) = self->_decodeTime;
  *((_DWORD *)v4 + 41) |= 8u;
  $DB617B79121746748C766C9C19229AA4 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v6 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  v4[10] = *(id *)&self->_requestStart;
  *((_DWORD *)v4 + 41) |= 4u;
  $DB617B79121746748C766C9C19229AA4 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 1) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_51:
  v4[6] = *(id *)&self->_requestEnd;
  *((_DWORD *)v4 + 41) |= 1u;
  if ((*(_DWORD *)&self->_flags & 0x100) != 0)
  {
LABEL_20:
    *((_DWORD *)v4 + 34) = self->_redirectCount;
    *((_DWORD *)v4 + 41) |= 0x100u;
  }
LABEL_21:
  if (self->_manifestEnv)
  {
    objc_msgSend(v8, "setManifestEnv:");
    int v4 = v8;
  }
  $DB617B79121746748C766C9C19229AA4 v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x1000) != 0)
  {
    *((_DWORD *)v4 + 38) = self->_tilesetId;
    *((_DWORD *)v4 + 41) |= 0x1000u;
    $DB617B79121746748C766C9C19229AA4 v7 = self->_flags;
    if ((*(unsigned char *)&v7 & 0x20) == 0)
    {
LABEL_25:
      if ((*(_WORD *)&v7 & 0x4000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_55;
    }
  }
  else if ((*(unsigned char *)&v7 & 0x20) == 0)
  {
    goto LABEL_25;
  }
  *((_DWORD *)v4 + 31) = self->_mptcpServiceType;
  *((_DWORD *)v4 + 41) |= 0x20u;
  $DB617B79121746748C766C9C19229AA4 v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v7 & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_55:
  *((unsigned char *)v4 + 160) = self->_mptcpNegotiated;
  *((_DWORD *)v4 + 41) |= 0x4000u;
  if ((*(_DWORD *)&self->_flags & 0x10000) != 0)
  {
LABEL_27:
    *((unsigned char *)v4 + 162) = self->_wasBackground;
    *((_DWORD *)v4 + 41) |= 0x10000u;
  }
LABEL_28:
  if (self->_serviceIpAddress)
  {
    objc_msgSend(v8, "setServiceIpAddress:");
    int v4 = v8;
  }
  if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0)
  {
    *((unsigned char *)v4 + 161) = self->_rnfTriggered;
    *((_DWORD *)v4 + 41) |= 0x8000u;
  }
  if (self->_requestAppIdMajorVer)
  {
    objc_msgSend(v8, "setRequestAppIdMajorVer:");
    int v4 = v8;
  }
  if (self->_requestAppIdMinorVer)
  {
    objc_msgSend(v8, "setRequestAppIdMinorVer:");
    int v4 = v8;
  }
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0)
  {
    *((_DWORD *)v4 + 37) = self->_samplingRate;
    *((_DWORD *)v4 + 41) |= 0x800u;
  }
  if (self->_taskMetrics)
  {
    objc_msgSend(v8, "setTaskMetrics:");
    int v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    $DB617B79121746748C766C9C19229AA4 v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 3) & 2) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgEventNetworkReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_29;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventNetwork *)self readAll:0];
  $DB617B79121746748C766C9C19229AA4 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_networkService;
    *(_DWORD *)(v5 + 164) |= 0x40u;
    $DB617B79121746748C766C9C19229AA4 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&flags & 0x400) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(_WORD *)&flags & 0x200) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 140) = self->_requestDataSize;
  *(_DWORD *)(v5 + 164) |= 0x200u;
  if ((*(_DWORD *)&self->_flags & 0x400) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 144) = self->_responseDataSize;
    *(_DWORD *)(v5 + 164) |= 0x400u;
  }
LABEL_9:
  uint64_t v10 = [(NSString *)self->_requestErrorDomain copyWithZone:a3];
  v11 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v10;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(void *)(v5 + 56) = self->_requestErrorCode;
    *(_DWORD *)(v5 + 164) |= 2u;
  }
  uint64_t v12 = [(NSString *)self->_requestErrorDescription copyWithZone:a3];
  v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  uint64_t v14 = [(NSString *)self->_requestAppIdentifier copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  $DB617B79121746748C766C9C19229AA4 v16 = self->_flags;
  if ((*(unsigned char *)&v16 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_queuedTime;
    *(_DWORD *)(v5 + 164) |= 0x80u;
    $DB617B79121746748C766C9C19229AA4 v16 = self->_flags;
    if ((*(_WORD *)&v16 & 0x2000) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v16 & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&v16 & 0x2000) == 0)
  {
    goto LABEL_13;
  }
  *(_DWORD *)(v5 + 156) = self->_totalTime;
  *(_DWORD *)(v5 + 164) |= 0x2000u;
  $DB617B79121746748C766C9C19229AA4 v16 = self->_flags;
  if ((*(unsigned char *)&v16 & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&v16 & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v5 + 120) = self->_httpResponseCode;
  *(_DWORD *)(v5 + 164) |= 0x10u;
  $DB617B79121746748C766C9C19229AA4 v16 = self->_flags;
  if ((*(unsigned char *)&v16 & 8) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v16 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v5 + 116) = self->_decodeTime;
  *(_DWORD *)(v5 + 164) |= 8u;
  $DB617B79121746748C766C9C19229AA4 v16 = self->_flags;
  if ((*(unsigned char *)&v16 & 4) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&v16 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(double *)(v5 + 80) = self->_requestStart;
  *(_DWORD *)(v5 + 164) |= 4u;
  $DB617B79121746748C766C9C19229AA4 v16 = self->_flags;
  if ((*(unsigned char *)&v16 & 1) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v16 & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_38:
  *(double *)(v5 + 48) = self->_requestEnd;
  *(_DWORD *)(v5 + 164) |= 1u;
  if ((*(_DWORD *)&self->_flags & 0x100) != 0)
  {
LABEL_18:
    *(_DWORD *)(v5 + 136) = self->_redirectCount;
    *(_DWORD *)(v5 + 164) |= 0x100u;
  }
LABEL_19:
  uint64_t v17 = [(NSString *)self->_manifestEnv copyWithZone:a3];
  v18 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v17;

  $DB617B79121746748C766C9C19229AA4 v19 = self->_flags;
  if ((*(_WORD *)&v19 & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 152) = self->_tilesetId;
    *(_DWORD *)(v5 + 164) |= 0x1000u;
    $DB617B79121746748C766C9C19229AA4 v19 = self->_flags;
    if ((*(unsigned char *)&v19 & 0x20) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v19 & 0x4000) == 0) {
        goto LABEL_22;
      }
LABEL_42:
      *(unsigned char *)(v5 + 160) = self->_mptcpNegotiated;
      *(_DWORD *)(v5 + 164) |= 0x4000u;
      if ((*(_DWORD *)&self->_flags & 0x10000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&v19 & 0x20) == 0)
  {
    goto LABEL_21;
  }
  *(_DWORD *)(v5 + 124) = self->_mptcpServiceType;
  *(_DWORD *)(v5 + 164) |= 0x20u;
  $DB617B79121746748C766C9C19229AA4 v19 = self->_flags;
  if ((*(_WORD *)&v19 & 0x4000) != 0) {
    goto LABEL_42;
  }
LABEL_22:
  if ((*(_DWORD *)&v19 & 0x10000) != 0)
  {
LABEL_23:
    *(unsigned char *)(v5 + 162) = self->_wasBackground;
    *(_DWORD *)(v5 + 164) |= 0x10000u;
  }
LABEL_24:
  uint64_t v20 = [(NSString *)self->_serviceIpAddress copyWithZone:a3];
  int v21 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v20;

  if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 161) = self->_rnfTriggered;
    *(_DWORD *)(v5 + 164) |= 0x8000u;
  }
  uint64_t v22 = [(NSString *)self->_requestAppIdMajorVer copyWithZone:a3];
  v23 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v22;

  uint64_t v24 = [(NSString *)self->_requestAppIdMinorVer copyWithZone:a3];
  v25 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v24;

  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_samplingRate;
    *(_DWORD *)(v5 + 164) |= 0x800u;
  }
  id v26 = [(GEONetworkSessionTaskTransactionMetrics *)self->_taskMetrics copyWithZone:a3];
  id v8 = *(id *)(v5 + 96);
  *(void *)(v5 + 96) = v26;
LABEL_29:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_115;
  }
  [(GEOLogMsgEventNetwork *)self readAll:1];
  [v4 readAll:1];
  $DB617B79121746748C766C9C19229AA4 flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 41);
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_networkService != *((_DWORD *)v4 + 32)) {
      goto LABEL_115;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_requestDataSize != *((_DWORD *)v4 + 35)) {
      goto LABEL_115;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_responseDataSize != *((_DWORD *)v4 + 36)) {
      goto LABEL_115;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_115;
  }
  requestErrorDomain = self->_requestErrorDomain;
  if ((unint64_t)requestErrorDomain | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](requestErrorDomain, "isEqual:")) {
      goto LABEL_115;
    }
    $DB617B79121746748C766C9C19229AA4 flags = self->_flags;
    int v6 = *((_DWORD *)v4 + 41);
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_requestErrorCode != *((void *)v4 + 7)) {
      goto LABEL_115;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_115;
  }
  requestErrorDescription = self->_requestErrorDescription;
  if ((unint64_t)requestErrorDescription | *((void *)v4 + 8)
    && !-[NSString isEqual:](requestErrorDescription, "isEqual:"))
  {
    goto LABEL_115;
  }
  requestAppIdentifier = self->_requestAppIdentifier;
  if ((unint64_t)requestAppIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](requestAppIdentifier, "isEqual:")) {
      goto LABEL_115;
    }
  }
  $DB617B79121746748C766C9C19229AA4 v10 = self->_flags;
  int v11 = *((_DWORD *)v4 + 41);
  if ((*(unsigned char *)&v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_queuedTime != *((_DWORD *)v4 + 33)) {
      goto LABEL_115;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    if ((v11 & 0x2000) == 0 || self->_totalTime != *((_DWORD *)v4 + 39)) {
      goto LABEL_115;
    }
  }
  else if ((v11 & 0x2000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(unsigned char *)&v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_httpResponseCode != *((_DWORD *)v4 + 30)) {
      goto LABEL_115;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_115;
  }
  if ((*(unsigned char *)&v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_decodeTime != *((_DWORD *)v4 + 29)) {
      goto LABEL_115;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_115;
  }
  if ((*(unsigned char *)&v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_requestStart != *((double *)v4 + 10)) {
      goto LABEL_115;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_115;
  }
  if (*(unsigned char *)&v10)
  {
    if ((v11 & 1) == 0 || self->_requestEnd != *((double *)v4 + 6)) {
      goto LABEL_115;
    }
  }
  else if (v11)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&v10 & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0 || self->_redirectCount != *((_DWORD *)v4 + 34)) {
      goto LABEL_115;
    }
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_115;
  }
  manifestEnv = self->_manifestEnv;
  if ((unint64_t)manifestEnv | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](manifestEnv, "isEqual:")) {
      goto LABEL_115;
    }
    $DB617B79121746748C766C9C19229AA4 v10 = self->_flags;
    int v11 = *((_DWORD *)v4 + 41);
  }
  if ((*(_WORD *)&v10 & 0x1000) != 0)
  {
    if ((v11 & 0x1000) == 0 || self->_tilesetId != *((_DWORD *)v4 + 38)) {
      goto LABEL_115;
    }
  }
  else if ((v11 & 0x1000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(unsigned char *)&v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_mptcpServiceType != *((_DWORD *)v4 + 31)) {
      goto LABEL_115;
    }
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0) {
      goto LABEL_115;
    }
    if (self->_mptcpNegotiated)
    {
      if (!*((unsigned char *)v4 + 160)) {
        goto LABEL_115;
      }
    }
    else if (*((unsigned char *)v4 + 160))
    {
      goto LABEL_115;
    }
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_DWORD *)&v10 & 0x10000) != 0)
  {
    if ((v11 & 0x10000) == 0) {
      goto LABEL_115;
    }
    if (self->_wasBackground)
    {
      if (!*((unsigned char *)v4 + 162)) {
        goto LABEL_115;
      }
    }
    else if (*((unsigned char *)v4 + 162))
    {
      goto LABEL_115;
    }
  }
  else if ((v11 & 0x10000) != 0)
  {
    goto LABEL_115;
  }
  serviceIpAddress = self->_serviceIpAddress;
  if ((unint64_t)serviceIpAddress | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](serviceIpAddress, "isEqual:")) {
      goto LABEL_115;
    }
    $DB617B79121746748C766C9C19229AA4 v10 = self->_flags;
    int v11 = *((_DWORD *)v4 + 41);
  }
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    if ((v11 & 0x8000) != 0)
    {
      if (self->_rnfTriggered)
      {
        if (!*((unsigned char *)v4 + 161)) {
          goto LABEL_115;
        }
        goto LABEL_104;
      }
      if (!*((unsigned char *)v4 + 161)) {
        goto LABEL_104;
      }
    }
LABEL_115:
    char v18 = 0;
    goto LABEL_116;
  }
  if ((v11 & 0x8000) != 0) {
    goto LABEL_115;
  }
LABEL_104:
  requestAppIdMajorVer = self->_requestAppIdMajorVer;
  if ((unint64_t)requestAppIdMajorVer | *((void *)v4 + 3)
    && !-[NSString isEqual:](requestAppIdMajorVer, "isEqual:"))
  {
    goto LABEL_115;
  }
  requestAppIdMinorVer = self->_requestAppIdMinorVer;
  if ((unint64_t)requestAppIdMinorVer | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](requestAppIdMinorVer, "isEqual:")) {
      goto LABEL_115;
    }
  }
  int v16 = *((_DWORD *)v4 + 41);
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0)
  {
    if ((v16 & 0x800) == 0 || self->_samplingRate != *((_DWORD *)v4 + 37)) {
      goto LABEL_115;
    }
  }
  else if ((v16 & 0x800) != 0)
  {
    goto LABEL_115;
  }
  taskMetrics = self->_taskMetrics;
  if ((unint64_t)taskMetrics | *((void *)v4 + 12)) {
    char v18 = -[GEONetworkSessionTaskTransactionMetrics isEqual:](taskMetrics, "isEqual:");
  }
  else {
    char v18 = 1;
  }
LABEL_116:

  return v18;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventNetwork *)self readAll:1];
  $DB617B79121746748C766C9C19229AA4 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
    uint64_t v40 = 0;
    if ((*(_WORD *)&flags & 0x200) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v39 = 0;
    if ((*(_WORD *)&flags & 0x400) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v40 = 2654435761 * self->_networkService;
  if ((*(_WORD *)&flags & 0x200) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v39 = 2654435761 * self->_requestDataSize;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
LABEL_4:
    uint64_t v38 = 2654435761 * self->_responseDataSize;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v38 = 0;
LABEL_8:
  NSUInteger v37 = [(NSString *)self->_requestErrorDomain hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v36 = 2654435761 * self->_requestErrorCode;
  }
  else {
    uint64_t v36 = 0;
  }
  NSUInteger v35 = [(NSString *)self->_requestErrorDescription hash];
  NSUInteger v34 = [(NSString *)self->_requestAppIdentifier hash];
  $DB617B79121746748C766C9C19229AA4 v4 = self->_flags;
  if ((*(unsigned char *)&v4 & 0x80) != 0)
  {
    uint64_t v33 = 2654435761 * self->_queuedTime;
    if ((*(_WORD *)&v4 & 0x2000) != 0)
    {
LABEL_13:
      uint64_t v32 = 2654435761 * self->_totalTime;
      if ((*(unsigned char *)&v4 & 0x10) != 0) {
        goto LABEL_14;
      }
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v33 = 0;
    if ((*(_WORD *)&v4 & 0x2000) != 0) {
      goto LABEL_13;
    }
  }
  uint64_t v32 = 0;
  if ((*(unsigned char *)&v4 & 0x10) != 0)
  {
LABEL_14:
    uint64_t v31 = 2654435761 * self->_httpResponseCode;
    if ((*(unsigned char *)&v4 & 8) != 0) {
      goto LABEL_15;
    }
LABEL_23:
    uint64_t v30 = 0;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_16;
    }
LABEL_24:
    unint64_t v9 = 0;
    goto LABEL_27;
  }
LABEL_22:
  uint64_t v31 = 0;
  if ((*(unsigned char *)&v4 & 8) == 0) {
    goto LABEL_23;
  }
LABEL_15:
  uint64_t v30 = 2654435761 * self->_decodeTime;
  if ((*(unsigned char *)&v4 & 4) == 0) {
    goto LABEL_24;
  }
LABEL_16:
  double requestStart = self->_requestStart;
  double v6 = -requestStart;
  if (requestStart >= 0.0) {
    double v6 = self->_requestStart;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_27:
  if (*(unsigned char *)&v4)
  {
    double requestEnd = self->_requestEnd;
    double v12 = -requestEnd;
    if (requestEnd >= 0.0) {
      double v12 = self->_requestEnd;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  unint64_t v29 = v10;
  if ((*(_WORD *)&v4 & 0x100) != 0) {
    uint64_t v28 = 2654435761 * self->_redirectCount;
  }
  else {
    uint64_t v28 = 0;
  }
  NSUInteger v27 = [(NSString *)self->_manifestEnv hash];
  $DB617B79121746748C766C9C19229AA4 v15 = self->_flags;
  if ((*(_WORD *)&v15 & 0x1000) != 0)
  {
    uint64_t v26 = 2654435761 * self->_tilesetId;
    if ((*(unsigned char *)&v15 & 0x20) != 0)
    {
LABEL_40:
      uint64_t v24 = 2654435761 * self->_mptcpServiceType;
      if ((*(_WORD *)&v15 & 0x4000) != 0) {
        goto LABEL_41;
      }
LABEL_45:
      uint64_t v16 = 0;
      if ((*(_DWORD *)&v15 & 0x10000) != 0) {
        goto LABEL_42;
      }
      goto LABEL_46;
    }
  }
  else
  {
    uint64_t v26 = 0;
    if ((*(unsigned char *)&v15 & 0x20) != 0) {
      goto LABEL_40;
    }
  }
  uint64_t v24 = 0;
  if ((*(_WORD *)&v15 & 0x4000) == 0) {
    goto LABEL_45;
  }
LABEL_41:
  uint64_t v16 = 2654435761 * self->_mptcpNegotiated;
  if ((*(_DWORD *)&v15 & 0x10000) != 0)
  {
LABEL_42:
    uint64_t v17 = 2654435761 * self->_wasBackground;
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v17 = 0;
LABEL_47:
  NSUInteger v18 = [(NSString *)self->_serviceIpAddress hash];
  if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0) {
    uint64_t v19 = 2654435761 * self->_rnfTriggered;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v20 = [(NSString *)self->_requestAppIdMajorVer hash];
  NSUInteger v21 = [(NSString *)self->_requestAppIdMinorVer hash];
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0) {
    uint64_t v22 = 2654435761 * self->_samplingRate;
  }
  else {
    uint64_t v22 = 0;
  }
  return v39 ^ v40 ^ v38 ^ v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v9 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ [(GEONetworkSessionTaskTransactionMetrics *)self->_taskMetrics hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v10 = (int *)a3;
  [v10 readAll:0];
  $DB617B79121746748C766C9C19229AA4 v4 = v10;
  int v5 = v10[41];
  if ((v5 & 0x40) != 0)
  {
    self->_networkService = v10[32];
    *(_DWORD *)&self->_flags |= 0x40u;
    int v5 = v10[41];
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 0x400) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5 & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_requestDataSize = v10[35];
  *(_DWORD *)&self->_flags |= 0x200u;
  if ((v10[41] & 0x400) != 0)
  {
LABEL_4:
    self->_responseDataSize = v10[36];
    *(_DWORD *)&self->_flags |= 0x400u;
  }
LABEL_5:
  if (*((void *)v10 + 9))
  {
    -[GEOLogMsgEventNetwork setRequestErrorDomain:](self, "setRequestErrorDomain:");
    $DB617B79121746748C766C9C19229AA4 v4 = v10;
  }
  if ((v4[41] & 2) != 0)
  {
    self->_requestErrorCode = *((void *)v4 + 7);
    *(_DWORD *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 8))
  {
    -[GEOLogMsgEventNetwork setRequestErrorDescription:](self, "setRequestErrorDescription:");
    $DB617B79121746748C766C9C19229AA4 v4 = v10;
  }
  if (*((void *)v4 + 5))
  {
    -[GEOLogMsgEventNetwork setRequestAppIdentifier:](self, "setRequestAppIdentifier:");
    $DB617B79121746748C766C9C19229AA4 v4 = v10;
  }
  int v6 = v4[41];
  if ((v6 & 0x80) != 0)
  {
    self->_queuedTime = v4[33];
    *(_DWORD *)&self->_flags |= 0x80u;
    int v6 = v4[41];
    if ((v6 & 0x2000) == 0)
    {
LABEL_15:
      if ((v6 & 0x10) == 0) {
        goto LABEL_16;
      }
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x2000) == 0)
  {
    goto LABEL_15;
  }
  self->_totalTime = v4[39];
  *(_DWORD *)&self->_flags |= 0x2000u;
  int v6 = v4[41];
  if ((v6 & 0x10) == 0)
  {
LABEL_16:
    if ((v6 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_httpResponseCode = v4[30];
  *(_DWORD *)&self->_flags |= 0x10u;
  int v6 = v4[41];
  if ((v6 & 8) == 0)
  {
LABEL_17:
    if ((v6 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_decodeTime = v4[29];
  *(_DWORD *)&self->_flags |= 8u;
  int v6 = v4[41];
  if ((v6 & 4) == 0)
  {
LABEL_18:
    if ((v6 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_double requestStart = *((double *)v4 + 10);
  *(_DWORD *)&self->_flags |= 4u;
  int v6 = v4[41];
  if ((v6 & 1) == 0)
  {
LABEL_19:
    if ((v6 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_49:
  self->_double requestEnd = *((double *)v4 + 6);
  *(_DWORD *)&self->_flags |= 1u;
  if ((v4[41] & 0x100) != 0)
  {
LABEL_20:
    self->_redirectCount = v4[34];
    *(_DWORD *)&self->_flags |= 0x100u;
  }
LABEL_21:
  if (*((void *)v4 + 2))
  {
    -[GEOLogMsgEventNetwork setManifestEnv:](self, "setManifestEnv:");
    $DB617B79121746748C766C9C19229AA4 v4 = v10;
  }
  int v7 = v4[41];
  if ((v7 & 0x1000) != 0)
  {
    self->_tilesetId = v4[38];
    *(_DWORD *)&self->_flags |= 0x1000u;
    int v7 = v4[41];
    if ((v7 & 0x20) == 0)
    {
LABEL_25:
      if ((v7 & 0x4000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_53;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_25;
  }
  self->_mptcpServiceType = v4[31];
  *(_DWORD *)&self->_flags |= 0x20u;
  int v7 = v4[41];
  if ((v7 & 0x4000) == 0)
  {
LABEL_26:
    if ((v7 & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_53:
  self->_mptcpNegotiated = *((unsigned char *)v4 + 160);
  *(_DWORD *)&self->_flags |= 0x4000u;
  if ((v4[41] & 0x10000) != 0)
  {
LABEL_27:
    self->_wasBackground = *((unsigned char *)v4 + 162);
    *(_DWORD *)&self->_flags |= 0x10000u;
  }
LABEL_28:
  if (*((void *)v4 + 11))
  {
    -[GEOLogMsgEventNetwork setServiceIpAddress:](self, "setServiceIpAddress:");
    $DB617B79121746748C766C9C19229AA4 v4 = v10;
  }
  if ((*((unsigned char *)v4 + 165) & 0x80) != 0)
  {
    self->_rnfTriggered = *((unsigned char *)v4 + 161);
    *(_DWORD *)&self->_flags |= 0x8000u;
  }
  if (*((void *)v4 + 3))
  {
    -[GEOLogMsgEventNetwork setRequestAppIdMajorVer:](self, "setRequestAppIdMajorVer:");
    $DB617B79121746748C766C9C19229AA4 v4 = v10;
  }
  if (*((void *)v4 + 4))
  {
    -[GEOLogMsgEventNetwork setRequestAppIdMinorVer:](self, "setRequestAppIdMinorVer:");
    $DB617B79121746748C766C9C19229AA4 v4 = v10;
  }
  if ((*((unsigned char *)v4 + 165) & 8) != 0)
  {
    self->_samplingRate = v4[37];
    *(_DWORD *)&self->_flags |= 0x800u;
  }
  taskMetrics = self->_taskMetrics;
  uint64_t v9 = *((void *)v4 + 12);
  if (taskMetrics)
  {
    if (!v9) {
      goto LABEL_58;
    }
    -[GEONetworkSessionTaskTransactionMetrics mergeFrom:](taskMetrics, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_58;
    }
    -[GEOLogMsgEventNetwork setTaskMetrics:](self, "setTaskMetrics:");
  }
  $DB617B79121746748C766C9C19229AA4 v4 = v10;
LABEL_58:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskMetrics, 0);
  objc_storeStrong((id *)&self->_serviceIpAddress, 0);
  objc_storeStrong((id *)&self->_requestErrorDomain, 0);
  objc_storeStrong((id *)&self->_requestErrorDescription, 0);
  objc_storeStrong((id *)&self->_requestAppIdentifier, 0);
  objc_storeStrong((id *)&self->_requestAppIdMinorVer, 0);
  objc_storeStrong((id *)&self->_requestAppIdMajorVer, 0);
  objc_storeStrong((id *)&self->_manifestEnv, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end