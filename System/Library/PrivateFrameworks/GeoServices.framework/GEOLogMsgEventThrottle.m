@interface GEOLogMsgEventThrottle
+ (BOOL)isValid:(id)a3;
- (BOOL)hasManifestEnv;
- (BOOL)hasNetworkService;
- (BOOL)hasRequestAppIdentifier;
- (BOOL)hasThrottleCount;
- (BOOL)hasThrottleDuration;
- (BOOL)hasThrottleMode;
- (BOOL)hasThrottleReqType;
- (BOOL)hasThrottleTriggerCount;
- (BOOL)hasThrottleTriggerDuration;
- (BOOL)hasThrottleType;
- (BOOL)hasTilesetId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventThrottle)init;
- (GEOLogMsgEventThrottle)initWithData:(id)a3;
- (GEOLogMsgEventThrottle)initWithDictionary:(id)a3;
- (GEOLogMsgEventThrottle)initWithJSON:(id)a3;
- (NSString)manifestEnv;
- (NSString)requestAppIdentifier;
- (NSString)throttleReqType;
- (double)throttleDuration;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)networkServiceAsString:(int)a3;
- (id)throttleModeAsString:(int)a3;
- (id)throttleTypeAsString:(int)a3;
- (int)StringAsNetworkService:(id)a3;
- (int)StringAsThrottleMode:(id)a3;
- (int)StringAsThrottleType:(id)a3;
- (int)networkService;
- (int)throttleMode;
- (int)throttleType;
- (unint64_t)hash;
- (unsigned)throttleCount;
- (unsigned)throttleTriggerCount;
- (unsigned)throttleTriggerDuration;
- (unsigned)tilesetId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readManifestEnv;
- (void)_readRequestAppIdentifier;
- (void)_readThrottleReqType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasNetworkService:(BOOL)a3;
- (void)setHasThrottleCount:(BOOL)a3;
- (void)setHasThrottleDuration:(BOOL)a3;
- (void)setHasThrottleMode:(BOOL)a3;
- (void)setHasThrottleTriggerCount:(BOOL)a3;
- (void)setHasThrottleTriggerDuration:(BOOL)a3;
- (void)setHasThrottleType:(BOOL)a3;
- (void)setHasTilesetId:(BOOL)a3;
- (void)setManifestEnv:(id)a3;
- (void)setNetworkService:(int)a3;
- (void)setRequestAppIdentifier:(id)a3;
- (void)setThrottleCount:(unsigned int)a3;
- (void)setThrottleDuration:(double)a3;
- (void)setThrottleMode:(int)a3;
- (void)setThrottleReqType:(id)a3;
- (void)setThrottleTriggerCount:(unsigned int)a3;
- (void)setThrottleTriggerDuration:(unsigned int)a3;
- (void)setThrottleType:(int)a3;
- (void)setTilesetId:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventThrottle

- (GEOLogMsgEventThrottle)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventThrottle;
  v2 = [(GEOLogMsgEventThrottle *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventThrottle)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventThrottle;
  v3 = [(GEOLogMsgEventThrottle *)&v7 initWithData:a3];
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
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_networkService;
  }
  else {
    return 0;
  }
}

- (void)setNetworkService:(int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_networkService = a3;
}

- (void)setHasNetworkService:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2050;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasNetworkService
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)networkServiceAsString:(int)a3
{
  if a3 < 0x1D && ((0x1FFF7FFFu >> a3))
  {
    __int16 v3 = off_1E53F8628[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
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

- (void)_readRequestAppIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventThrottleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestAppIdentifier_tags_4961);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRequestAppIdentifier
{
  return self->_requestAppIdentifier != 0;
}

- (NSString)requestAppIdentifier
{
  -[GEOLogMsgEventThrottle _readRequestAppIdentifier]((uint64_t)self);
  requestAppIdentifier = self->_requestAppIdentifier;

  return requestAppIdentifier;
}

- (void)setRequestAppIdentifier:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_requestAppIdentifier, a3);
}

- (void)_readManifestEnv
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventThrottleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readManifestEnv_tags_4962);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasManifestEnv
{
  return self->_manifestEnv != 0;
}

- (NSString)manifestEnv
{
  -[GEOLogMsgEventThrottle _readManifestEnv]((uint64_t)self);
  manifestEnv = self->_manifestEnv;

  return manifestEnv;
}

- (void)setManifestEnv:(id)a3
{
  *(_WORD *)&self->_flags |= 0x900u;
  objc_storeStrong((id *)&self->_manifestEnv, a3);
}

- (unsigned)tilesetId
{
  return self->_tilesetId;
}

- (void)setTilesetId:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  self->_tilesetId = a3;
}

- (void)setHasTilesetId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2176;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasTilesetId
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (int)throttleType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0) {
    return self->_throttleType;
  }
  else {
    return 0;
  }
}

- (void)setThrottleType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  self->_throttleType = a3;
}

- (void)setHasThrottleType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2112;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasThrottleType
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (id)throttleTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53F7CC0[a3];
  }

  return v3;
}

- (int)StringAsThrottleType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNDEFINED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ALL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SPECIFIC"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)throttleMode
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0) {
    return self->_throttleMode;
  }
  else {
    return 0;
  }
}

- (void)setThrottleMode:(int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_throttleMode = a3;
}

- (void)setHasThrottleMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2056;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasThrottleMode
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)throttleModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53F7CD8[a3];
  }

  return v3;
}

- (int)StringAsThrottleMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNDEFINED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SHORT_INTERVAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LONG_INTERVAL"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readThrottleReqType
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventThrottleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readThrottleReqType_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasThrottleReqType
{
  return self->_throttleReqType != 0;
}

- (NSString)throttleReqType
{
  -[GEOLogMsgEventThrottle _readThrottleReqType]((uint64_t)self);
  throttleReqType = self->_throttleReqType;

  return throttleReqType;
}

- (void)setThrottleReqType:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_throttleReqType, a3);
}

- (unsigned)throttleTriggerCount
{
  return self->_throttleTriggerCount;
}

- (void)setThrottleTriggerCount:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  self->_throttleTriggerCount = a3;
}

- (void)setHasThrottleTriggerCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2064;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasThrottleTriggerCount
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unsigned)throttleTriggerDuration
{
  return self->_throttleTriggerDuration;
}

- (void)setThrottleTriggerDuration:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x820u;
  self->_throttleTriggerDuration = a3;
}

- (void)setHasThrottleTriggerDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2080;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasThrottleTriggerDuration
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (unsigned)throttleCount
{
  return self->_throttleCount;
}

- (void)setThrottleCount:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_throttleCount = a3;
}

- (void)setHasThrottleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2052;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasThrottleCount
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (double)throttleDuration
{
  return self->_throttleDuration;
}

- (void)setThrottleDuration:(double)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_throttleDuration = a3;
}

- (void)setHasThrottleDuration:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasThrottleDuration
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventThrottle;
  int v4 = [(GEOLogMsgEventThrottle *)&v8 description];
  v5 = [(GEOLogMsgEventThrottle *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventThrottle _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_69;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(_WORD *)(a1 + 88) & 2) != 0)
  {
    uint64_t v5 = *(int *)(a1 + 60);
    if v5 < 0x1D && ((0x1FFF7FFFu >> v5))
    {
      objc_super v6 = off_1E53F8628[v5];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
      objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (a2) {
      objc_super v7 = @"networkService";
    }
    else {
      objc_super v7 = @"network_service";
    }
    [v4 setObject:v6 forKey:v7];
  }
  objc_super v8 = [(id)a1 requestAppIdentifier];
  if (v8)
  {
    if (a2) {
      v9 = @"requestAppIdentifier";
    }
    else {
      v9 = @"request_app_identifier";
    }
    [v4 setObject:v8 forKey:v9];
  }

  v10 = [(id)a1 manifestEnv];
  if (v10)
  {
    if (a2) {
      v11 = @"manifestEnv";
    }
    else {
      v11 = @"manifest_env";
    }
    [v4 setObject:v10 forKey:v11];
  }

  __int16 v12 = *(_WORD *)(a1 + 88);
  if ((v12 & 0x80) != 0)
  {
    v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
    if (a2) {
      v14 = @"tilesetId";
    }
    else {
      v14 = @"tileset_id";
    }
    [v4 setObject:v13 forKey:v14];

    __int16 v12 = *(_WORD *)(a1 + 88);
    if ((v12 & 0x40) == 0)
    {
LABEL_23:
      if ((v12 & 8) == 0) {
        goto LABEL_43;
      }
      goto LABEL_36;
    }
  }
  else if ((v12 & 0x40) == 0)
  {
    goto LABEL_23;
  }
  uint64_t v15 = *(int *)(a1 + 80);
  if (v15 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 80));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E53F7CC0[v15];
  }
  if (a2) {
    v17 = @"throttleType";
  }
  else {
    v17 = @"throttle_type";
  }
  [v4 setObject:v16 forKey:v17];

  if ((*(_WORD *)(a1 + 88) & 8) != 0)
  {
LABEL_36:
    uint64_t v18 = *(int *)(a1 + 68);
    if (v18 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E53F7CD8[v18];
    }
    if (a2) {
      v20 = @"throttleMode";
    }
    else {
      v20 = @"throttle_mode";
    }
    [v4 setObject:v19 forKey:v20];
  }
LABEL_43:
  v21 = [(id)a1 throttleReqType];
  if (v21)
  {
    if (a2) {
      v22 = @"throttleReqType";
    }
    else {
      v22 = @"throttle_req_type";
    }
    [v4 setObject:v21 forKey:v22];
  }

  __int16 v23 = *(_WORD *)(a1 + 88);
  if ((v23 & 0x10) != 0)
  {
    v24 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
    if (a2) {
      v25 = @"throttleTriggerCount";
    }
    else {
      v25 = @"throttle_trigger_count";
    }
    [v4 setObject:v24 forKey:v25];

    __int16 v23 = *(_WORD *)(a1 + 88);
    if ((v23 & 0x20) == 0)
    {
LABEL_50:
      if ((v23 & 4) == 0) {
        goto LABEL_51;
      }
LABEL_61:
      v28 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
      if (a2) {
        v29 = @"throttleCount";
      }
      else {
        v29 = @"throttle_count";
      }
      [v4 setObject:v28 forKey:v29];

      if ((*(_WORD *)(a1 + 88) & 1) == 0) {
        goto LABEL_69;
      }
      goto LABEL_65;
    }
  }
  else if ((v23 & 0x20) == 0)
  {
    goto LABEL_50;
  }
  v26 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
  if (a2) {
    v27 = @"throttleTriggerDuration";
  }
  else {
    v27 = @"throttle_trigger_duration";
  }
  [v4 setObject:v26 forKey:v27];

  __int16 v23 = *(_WORD *)(a1 + 88);
  if ((v23 & 4) != 0) {
    goto LABEL_61;
  }
LABEL_51:
  if (v23)
  {
LABEL_65:
    v30 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    if (a2) {
      v31 = @"throttleDuration";
    }
    else {
      v31 = @"throttle_duration";
    }
    [v4 setObject:v30 forKey:v31];
  }
LABEL_69:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventThrottle _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventThrottle)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventThrottle *)-[GEOLogMsgEventThrottle _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_139;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_139;
  }
  if (a3) {
    objc_super v6 = @"networkService";
  }
  else {
    objc_super v6 = @"network_service";
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
    v10 = @"requestAppIdentifier";
  }
  else {
    v10 = @"request_app_identifier";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v12 = (void *)[v11 copy];
    [a1 setRequestAppIdentifier:v12];
  }
  if (a3) {
    v13 = @"manifestEnv";
  }
  else {
    v13 = @"manifest_env";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = (void *)[v14 copy];
    [a1 setManifestEnv:v15];
  }
  if (a3) {
    v16 = @"tilesetId";
  }
  else {
    v16 = @"tileset_id";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTilesetId:", objc_msgSend(v17, "unsignedIntValue"));
  }

  if (a3) {
    uint64_t v18 = @"throttleType";
  }
  else {
    uint64_t v18 = @"throttle_type";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v19;
    if ([v20 isEqualToString:@"UNDEFINED"])
    {
      uint64_t v21 = 0;
    }
    else if ([v20 isEqualToString:@"ALL"])
    {
      uint64_t v21 = 1;
    }
    else if ([v20 isEqualToString:@"SPECIFIC"])
    {
      uint64_t v21 = 2;
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_98;
    }
    uint64_t v21 = [v19 intValue];
  }
  [a1 setThrottleType:v21];
LABEL_98:

  if (a3) {
    v22 = @"throttleMode";
  }
  else {
    v22 = @"throttle_mode";
  }
  __int16 v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = v23;
    if ([v24 isEqualToString:@"UNDEFINED"])
    {
      uint64_t v25 = 0;
    }
    else if ([v24 isEqualToString:@"SHORT_INTERVAL"])
    {
      uint64_t v25 = 1;
    }
    else if ([v24 isEqualToString:@"LONG_INTERVAL"])
    {
      uint64_t v25 = 2;
    }
    else
    {
      uint64_t v25 = 0;
    }

    goto LABEL_112;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v25 = [v23 intValue];
LABEL_112:
    [a1 setThrottleMode:v25];
  }

  if (a3) {
    v26 = @"throttleReqType";
  }
  else {
    v26 = @"throttle_req_type";
  }
  v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v28 = (void *)[v27 copy];
    [a1 setThrottleReqType:v28];
  }
  if (a3) {
    v29 = @"throttleTriggerCount";
  }
  else {
    v29 = @"throttle_trigger_count";
  }
  v30 = [v5 objectForKeyedSubscript:v29];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setThrottleTriggerCount:", objc_msgSend(v30, "unsignedIntValue"));
  }

  if (a3) {
    v31 = @"throttleTriggerDuration";
  }
  else {
    v31 = @"throttle_trigger_duration";
  }
  v32 = [v5 objectForKeyedSubscript:v31];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setThrottleTriggerDuration:", objc_msgSend(v32, "unsignedIntValue"));
  }

  if (a3) {
    v33 = @"throttleCount";
  }
  else {
    v33 = @"throttle_count";
  }
  v34 = [v5 objectForKeyedSubscript:v33];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setThrottleCount:", objc_msgSend(v34, "unsignedIntValue"));
  }

  if (a3) {
    v35 = @"throttleDuration";
  }
  else {
    v35 = @"throttle_duration";
  }
  v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v36 doubleValue];
    objc_msgSend(a1, "setThrottleDuration:");
  }

LABEL_139:
  return a1;
}

- (GEOLogMsgEventThrottle)initWithJSON:(id)a3
{
  return (GEOLogMsgEventThrottle *)-[GEOLogMsgEventThrottle _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_5005;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_5006;
    }
    GEOLogMsgEventThrottleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventThrottleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventThrottleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0xF00) == 0)
    {
      objc_super v7 = self->_reader;
      objc_sync_enter(v7);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      id v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v9 writeData:v8];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v7);
      goto LABEL_28;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventThrottle *)self readAll:0];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_requestAppIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_manifestEnv) {
    PBDataWriterWriteStringField();
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_11:
      if ((flags & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((flags & 0x40) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_flags & 8) != 0) {
LABEL_12:
  }
    PBDataWriterWriteInt32Field();
LABEL_13:
  if (self->_throttleReqType) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v6 = (__int16)self->_flags;
    if ((v6 & 0x20) == 0)
    {
LABEL_17:
      if ((v6 & 4) == 0) {
        goto LABEL_18;
      }
LABEL_25:
      PBDataWriterWriteUint32Field();
      if ((*(_WORD *)&self->_flags & 1) == 0) {
        goto LABEL_28;
      }
      goto LABEL_26;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteUint32Field();
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 4) != 0) {
    goto LABEL_25;
  }
LABEL_18:
  if (v6) {
LABEL_26:
  }
    PBDataWriterWriteDoubleField();
LABEL_28:
}

- (void)copyTo:(id)a3
{
  objc_super v7 = (id *)a3;
  [(GEOLogMsgEventThrottle *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 12) = self->_readerMarkPos;
  *((_DWORD *)v7 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v7;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v7 + 15) = self->_networkService;
    *((_WORD *)v7 + 44) |= 2u;
  }
  if (self->_requestAppIdentifier)
  {
    objc_msgSend(v7, "setRequestAppIdentifier:");
    int v4 = v7;
  }
  if (self->_manifestEnv)
  {
    objc_msgSend(v7, "setManifestEnv:");
    int v4 = v7;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_tilesetId;
    *((_WORD *)v4 + 44) |= 0x80u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_9:
      if ((flags & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((flags & 0x40) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 20) = self->_throttleType;
  *((_WORD *)v4 + 44) |= 0x40u;
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 17) = self->_throttleMode;
    *((_WORD *)v4 + 44) |= 8u;
  }
LABEL_11:
  if (self->_throttleReqType)
  {
    objc_msgSend(v7, "setThrottleReqType:");
    int v4 = v7;
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_throttleTriggerCount;
    *((_WORD *)v4 + 44) |= 0x10u;
    __int16 v6 = (__int16)self->_flags;
    if ((v6 & 0x20) == 0)
    {
LABEL_15:
      if ((v6 & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_26;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v4 + 19) = self->_throttleTriggerDuration;
  *((_WORD *)v4 + 44) |= 0x20u;
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 4) == 0)
  {
LABEL_16:
    if ((v6 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_26:
  *((_DWORD *)v4 + 16) = self->_throttleCount;
  *((_WORD *)v4 + 44) |= 4u;
  if (*(_WORD *)&self->_flags)
  {
LABEL_17:
    v4[4] = *(id *)&self->_throttleDuration;
    *((_WORD *)v4 + 44) |= 1u;
  }
LABEL_18:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventThrottle *)self readAll:0];
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 60) = self->_networkService;
      *(_WORD *)(v5 + 88) |= 2u;
    }
    uint64_t v9 = [(NSString *)self->_requestAppIdentifier copyWithZone:a3];
    v10 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v9;

    uint64_t v11 = [(NSString *)self->_manifestEnv copyWithZone:a3];
    __int16 v12 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v11;

    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x80) != 0)
    {
      *(_DWORD *)(v5 + 84) = self->_tilesetId;
      *(_WORD *)(v5 + 88) |= 0x80u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 0x40) == 0)
      {
LABEL_9:
        if ((flags & 8) == 0) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
    }
    else if ((flags & 0x40) == 0)
    {
      goto LABEL_9;
    }
    *(_DWORD *)(v5 + 80) = self->_throttleType;
    *(_WORD *)(v5 + 88) |= 0x40u;
    if ((*(_WORD *)&self->_flags & 8) == 0)
    {
LABEL_11:
      uint64_t v14 = [(NSString *)self->_throttleReqType copyWithZone:a3];
      uint64_t v15 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v14;

      __int16 v16 = (__int16)self->_flags;
      if ((v16 & 0x10) != 0)
      {
        *(_DWORD *)(v5 + 72) = self->_throttleTriggerCount;
        *(_WORD *)(v5 + 88) |= 0x10u;
        __int16 v16 = (__int16)self->_flags;
        if ((v16 & 0x20) == 0)
        {
LABEL_13:
          if ((v16 & 4) == 0) {
            goto LABEL_14;
          }
          goto LABEL_22;
        }
      }
      else if ((v16 & 0x20) == 0)
      {
        goto LABEL_13;
      }
      *(_DWORD *)(v5 + 76) = self->_throttleTriggerDuration;
      *(_WORD *)(v5 + 88) |= 0x20u;
      __int16 v16 = (__int16)self->_flags;
      if ((v16 & 4) == 0)
      {
LABEL_14:
        if ((v16 & 1) == 0) {
          return (id)v5;
        }
LABEL_15:
        *(double *)(v5 + 32) = self->_throttleDuration;
        *(_WORD *)(v5 + 88) |= 1u;
        return (id)v5;
      }
LABEL_22:
      *(_DWORD *)(v5 + 64) = self->_throttleCount;
      *(_WORD *)(v5 + 88) |= 4u;
      if ((*(_WORD *)&self->_flags & 1) == 0) {
        return (id)v5;
      }
      goto LABEL_15;
    }
LABEL_10:
    *(_DWORD *)(v5 + 68) = self->_throttleMode;
    *(_WORD *)(v5 + 88) |= 8u;
    goto LABEL_11;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgEventThrottleReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  [(GEOLogMsgEventThrottle *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v5 & 2) == 0 || self->_networkService != *((_DWORD *)v4 + 15)) {
      goto LABEL_48;
    }
  }
  else if ((v5 & 2) != 0)
  {
    goto LABEL_48;
  }
  requestAppIdentifier = self->_requestAppIdentifier;
  if ((unint64_t)requestAppIdentifier | *((void *)v4 + 3)
    && !-[NSString isEqual:](requestAppIdentifier, "isEqual:"))
  {
    goto LABEL_48;
  }
  manifestEnv = self->_manifestEnv;
  if ((unint64_t)manifestEnv | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](manifestEnv, "isEqual:")) {
      goto LABEL_48;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 44);
  if ((flags & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_tilesetId != *((_DWORD *)v4 + 21)) {
      goto LABEL_48;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_48;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_throttleType != *((_DWORD *)v4 + 20)) {
      goto LABEL_48;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_48;
  }
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_throttleMode != *((_DWORD *)v4 + 17)) {
      goto LABEL_48;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_48;
  }
  throttleReqType = self->_throttleReqType;
  if ((unint64_t)throttleReqType | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](throttleReqType, "isEqual:"))
    {
LABEL_48:
      BOOL v11 = 0;
      goto LABEL_49;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v9 = *((_WORD *)v4 + 44);
  }
  if ((flags & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_throttleTriggerCount != *((_DWORD *)v4 + 18)) {
      goto LABEL_48;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_48;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_throttleTriggerDuration != *((_DWORD *)v4 + 19)) {
      goto LABEL_48;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_48;
  }
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_throttleCount != *((_DWORD *)v4 + 16)) {
      goto LABEL_48;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_48;
  }
  BOOL v11 = (v9 & 1) == 0;
  if (flags)
  {
    if ((v9 & 1) == 0 || self->_throttleDuration != *((double *)v4 + 4)) {
      goto LABEL_48;
    }
    BOOL v11 = 1;
  }
LABEL_49:

  return v11;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventThrottle *)self readAll:1];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v20 = 2654435761 * self->_networkService;
  }
  else {
    uint64_t v20 = 0;
  }
  NSUInteger v19 = [(NSString *)self->_requestAppIdentifier hash];
  NSUInteger v3 = [(NSString *)self->_manifestEnv hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
    uint64_t v5 = 0;
    if ((flags & 0x40) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if ((flags & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v5 = 2654435761 * self->_tilesetId;
  if ((flags & 0x40) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_throttleType;
  if ((flags & 8) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_throttleMode;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v7 = 0;
LABEL_11:
  NSUInteger v8 = [(NSString *)self->_throttleReqType hash];
  __int16 v9 = (__int16)self->_flags;
  if ((v9 & 0x10) != 0)
  {
    uint64_t v10 = 2654435761 * self->_throttleTriggerCount;
    if ((v9 & 0x20) != 0)
    {
LABEL_13:
      uint64_t v11 = 2654435761 * self->_throttleTriggerDuration;
      if ((v9 & 4) != 0) {
        goto LABEL_14;
      }
LABEL_21:
      uint64_t v12 = 0;
      if (v9) {
        goto LABEL_15;
      }
LABEL_22:
      unint64_t v17 = 0;
      return v19 ^ v20 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v17;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((v9 & 0x20) != 0) {
      goto LABEL_13;
    }
  }
  uint64_t v11 = 0;
  if ((v9 & 4) == 0) {
    goto LABEL_21;
  }
LABEL_14:
  uint64_t v12 = 2654435761 * self->_throttleCount;
  if ((v9 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_15:
  double throttleDuration = self->_throttleDuration;
  double v14 = -throttleDuration;
  if (throttleDuration >= 0.0) {
    double v14 = self->_throttleDuration;
  }
  long double v15 = floor(v14 + 0.5);
  double v16 = (v14 - v15) * 1.84467441e19;
  unint64_t v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0) {
      v17 += (unint64_t)v16;
    }
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
  return v19 ^ v20 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v7 = (int *)a3;
  [v7 readAll:0];
  id v4 = v7;
  if ((v7[22] & 2) != 0)
  {
    self->_networkService = v7[15];
    *(_WORD *)&self->_flags |= 2u;
  }
  if (*((void *)v7 + 3))
  {
    -[GEOLogMsgEventThrottle setRequestAppIdentifier:](self, "setRequestAppIdentifier:");
    id v4 = v7;
  }
  if (*((void *)v4 + 2))
  {
    -[GEOLogMsgEventThrottle setManifestEnv:](self, "setManifestEnv:");
    id v4 = v7;
  }
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x80) != 0)
  {
    self->_tilesetId = v4[21];
    *(_WORD *)&self->_flags |= 0x80u;
    __int16 v5 = *((_WORD *)v4 + 44);
    if ((v5 & 0x40) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_9;
  }
  self->_throttleType = v4[20];
  *(_WORD *)&self->_flags |= 0x40u;
  if ((v4[22] & 8) != 0)
  {
LABEL_10:
    self->_throttleMode = v4[17];
    *(_WORD *)&self->_flags |= 8u;
  }
LABEL_11:
  if (*((void *)v4 + 5))
  {
    -[GEOLogMsgEventThrottle setThrottleReqType:](self, "setThrottleReqType:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x10) != 0)
  {
    self->_throttleTriggerCount = v4[18];
    *(_WORD *)&self->_flags |= 0x10u;
    __int16 v6 = *((_WORD *)v4 + 44);
    if ((v6 & 0x20) == 0)
    {
LABEL_15:
      if ((v6 & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_26;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_15;
  }
  self->_throttleTriggerDuration = v4[19];
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 4) == 0)
  {
LABEL_16:
    if ((v6 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_26:
  self->_throttleCount = v4[16];
  *(_WORD *)&self->_flags |= 4u;
  if (v4[22])
  {
LABEL_17:
    self->_double throttleDuration = *((double *)v4 + 4);
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_18:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttleReqType, 0);
  objc_storeStrong((id *)&self->_requestAppIdentifier, 0);
  objc_storeStrong((id *)&self->_manifestEnv, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end