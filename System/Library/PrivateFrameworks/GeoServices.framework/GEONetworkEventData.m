@interface GEONetworkEventData
+ (BOOL)isValid:(id)a3;
+ (Class)additionalStatesType;
- (BOOL)hasAppIdentifier;
- (BOOL)hasClientMetrics;
- (BOOL)hasCountryCode;
- (BOOL)hasDataRequestKindSubtype;
- (BOOL)hasDataRequestKindType;
- (BOOL)hasDatasetId;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasEventTimestamp;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocale;
- (BOOL)hasManifestEnvironment;
- (BOOL)hasNetworkService;
- (BOOL)hasRequestingAppIdentifier;
- (BOOL)hasRequestingAppMajorVer;
- (BOOL)hasRequestingAppMinorVer;
- (BOOL)hasTilesetId;
- (BOOL)hasUsedBackgroundUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)usedBackgroundUrl;
- (GEOClientMetrics)clientMetrics;
- (GEONetworkEventData)init;
- (GEONetworkEventData)initWithData:(id)a3;
- (GEONetworkEventData)initWithDictionary:(id)a3;
- (GEONetworkEventData)initWithJSON:(id)a3;
- (NSMutableArray)additionalStates;
- (NSString)appIdentifier;
- (NSString)countryCode;
- (NSString)errorDomain;
- (NSString)locale;
- (NSString)manifestEnvironment;
- (NSString)requestingAppIdentifier;
- (NSString)requestingAppMajorVer;
- (NSString)requestingAppMinorVer;
- (PBUnknownFields)unknownFields;
- (double)eventTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)additionalStatesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)networkServiceAsString:(int)a3;
- (int)StringAsNetworkService:(id)a3;
- (int)dataRequestKindSubtype;
- (int)dataRequestKindType;
- (int)networkService;
- (int64_t)errorCode;
- (unint64_t)additionalStatesCount;
- (unint64_t)hash;
- (unsigned)datasetId;
- (unsigned)tilesetId;
- (void)_addNoFlagsAdditionalStates:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAdditionalStates;
- (void)_readAppIdentifier;
- (void)_readClientMetrics;
- (void)_readCountryCode;
- (void)_readErrorDomain;
- (void)_readLocale;
- (void)_readManifestEnvironment;
- (void)_readRequestingAppIdentifier;
- (void)_readRequestingAppMajorVer;
- (void)_readRequestingAppMinorVer;
- (void)addAdditionalStates:(id)a3;
- (void)clearAdditionalStates;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAdditionalStates:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setClientMetrics:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDataRequestKindSubtype:(int)a3;
- (void)setDataRequestKindType:(int)a3;
- (void)setDatasetId:(unsigned int)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDomain:(id)a3;
- (void)setEventTimestamp:(double)a3;
- (void)setHasDataRequestKindSubtype:(BOOL)a3;
- (void)setHasDataRequestKindType:(BOOL)a3;
- (void)setHasDatasetId:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasEventTimestamp:(BOOL)a3;
- (void)setHasNetworkService:(BOOL)a3;
- (void)setHasTilesetId:(BOOL)a3;
- (void)setHasUsedBackgroundUrl:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setManifestEnvironment:(id)a3;
- (void)setNetworkService:(int)a3;
- (void)setRequestingAppIdentifier:(id)a3;
- (void)setRequestingAppMajorVer:(id)a3;
- (void)setRequestingAppMinorVer:(id)a3;
- (void)setTilesetId:(unsigned int)a3;
- (void)setUsedBackgroundUrl:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONetworkEventData

- (void)setTilesetId:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x80040u;
  self->_tilesetId = a3;
}

- (void)setRequestingAppMinorVer:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xC0000u;
  objc_storeStrong((id *)&self->_requestingAppMinorVer, a3);
}

- (void)setRequestingAppMajorVer:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xA0000u;
  objc_storeStrong((id *)&self->_requestingAppMajorVer, a3);
}

- (void)setRequestingAppIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x90000u;
  objc_storeStrong((id *)&self->_requestingAppIdentifier, a3);
}

- (void)setNetworkService:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80020u;
  self->_networkService = a3;
}

- (void)setManifestEnvironment:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x88000u;
  objc_storeStrong((id *)&self->_manifestEnvironment, a3);
}

- (void)setLocale:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x84000u;
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void)setEventTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x80002u;
  self->_eventTimestamp = a3;
}

- (void)setDatasetId:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x80010u;
  self->_datasetId = a3;
}

- (void)setDataRequestKindType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80008u;
  self->_dataRequestKindType = a3;
}

- (void)setDataRequestKindSubtype:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80004u;
  self->_dataRequestKindSubtype = a3;
}

- (void)setCountryCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x81000u;
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (void)setClientMetrics:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80800u;
  objc_storeStrong((id *)&self->_clientMetrics, a3);
}

- (void)setAppIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80400u;
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (GEONetworkEventData)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEONetworkEventData;
  v2 = [(GEONetworkEventData *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)addAdditionalStates:(id)a3
{
  id v4 = a3;
  -[GEONetworkEventData _readAdditionalStates]((uint64_t)self);
  -[GEONetworkEventData _addNoFlagsAdditionalStates:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_readAdditionalStates
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdditionalStates_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)_addNoFlagsAdditionalStates:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingAppMinorVer, 0);
  objc_storeStrong((id *)&self->_requestingAppMajorVer, 0);
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
  objc_storeStrong((id *)&self->_manifestEnvironment, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_clientMetrics, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalStates, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0xFFE00) == 0)
    {
      v11 = self->_reader;
      objc_sync_enter(v11);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v12];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v11);
      goto LABEL_47;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEONetworkEventData *)self readAll:0];
  if (self->_clientMetrics) {
    PBDataWriterWriteSubmessage();
  }
  $3296299F16D566F38FA83A9082AA5EFC flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    $3296299F16D566F38FA83A9082AA5EFC flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&flags & 0x20) == 0) {
        goto LABEL_8;
      }
LABEL_44:
      PBDataWriterWriteInt32Field();
      if ((*(_DWORD *)&self->_flags & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&flags & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  $3296299F16D566F38FA83A9082AA5EFC flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    goto LABEL_44;
  }
LABEL_8:
  if ((*(unsigned char *)&flags & 0x80) != 0) {
LABEL_9:
  }
    PBDataWriterWriteBOOLField();
LABEL_10:
  if (self->_requestingAppIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_requestingAppMajorVer) {
    PBDataWriterWriteStringField();
  }
  if (self->_requestingAppMinorVer) {
    PBDataWriterWriteStringField();
  }
  if (self->_errorDomain) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt64Field();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_additionalStates;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_locale) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_manifestEnvironment) {
    PBDataWriterWriteStringField();
  }
  if (self->_appIdentifier) {
    PBDataWriterWriteStringField();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_47:
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_2904;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_2905;
    }
    GEONetworkEventDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEONetworkEventDataCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEONetworkEventData)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEONetworkEventData;
  BOOL v3 = [(GEONetworkEventData *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readClientMetrics
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientMetrics_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasClientMetrics
{
  return self->_clientMetrics != 0;
}

- (GEOClientMetrics)clientMetrics
{
  -[GEONetworkEventData _readClientMetrics]((uint64_t)self);
  clientMetrics = self->_clientMetrics;

  return clientMetrics;
}

- (int)dataRequestKindType
{
  return self->_dataRequestKindType;
}

- (void)setHasDataRequestKindType:(BOOL)a3
{
  if (a3) {
    int v3 = 524296;
  }
  else {
    int v3 = 0x80000;
  }
  self->_$3296299F16D566F38FA83A9082AA5EFC flags = ($3296299F16D566F38FA83A9082AA5EFC)(*(_DWORD *)&self->_flags & 0xFFF7FFF7 | v3);
}

- (BOOL)hasDataRequestKindType
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (int)dataRequestKindSubtype
{
  return self->_dataRequestKindSubtype;
}

- (void)setHasDataRequestKindSubtype:(BOOL)a3
{
  if (a3) {
    int v3 = 524292;
  }
  else {
    int v3 = 0x80000;
  }
  self->_$3296299F16D566F38FA83A9082AA5EFC flags = ($3296299F16D566F38FA83A9082AA5EFC)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDataRequestKindSubtype
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)networkService
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $3296299F16D566F38FA83A9082AA5EFC flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    return self->_networkService;
  }
  else {
    return 0;
  }
}

- (void)setHasNetworkService:(BOOL)a3
{
  if (a3) {
    int v3 = 524320;
  }
  else {
    int v3 = 0x80000;
  }
  self->_$3296299F16D566F38FA83A9082AA5EFC flags = ($3296299F16D566F38FA83A9082AA5EFC)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasNetworkService
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)networkServiceAsString:(int)a3
{
  if a3 < 0x1D && ((0x1FFF7FFFu >> a3))
  {
    int v3 = off_1E53E7D18[a3];
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

- (BOOL)usedBackgroundUrl
{
  return self->_usedBackgroundUrl;
}

- (void)setUsedBackgroundUrl:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80080u;
  self->_usedBackgroundUrl = a3;
}

- (void)setHasUsedBackgroundUrl:(BOOL)a3
{
  if (a3) {
    int v3 = 524416;
  }
  else {
    int v3 = 0x80000;
  }
  self->_$3296299F16D566F38FA83A9082AA5EFC flags = ($3296299F16D566F38FA83A9082AA5EFC)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasUsedBackgroundUrl
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (void)_readRequestingAppIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 158) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestingAppIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasRequestingAppIdentifier
{
  return self->_requestingAppIdentifier != 0;
}

- (NSString)requestingAppIdentifier
{
  -[GEONetworkEventData _readRequestingAppIdentifier]((uint64_t)self);
  requestingAppIdentifier = self->_requestingAppIdentifier;

  return requestingAppIdentifier;
}

- (void)_readRequestingAppMajorVer
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 158) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestingAppMajorVer_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasRequestingAppMajorVer
{
  return self->_requestingAppMajorVer != 0;
}

- (NSString)requestingAppMajorVer
{
  -[GEONetworkEventData _readRequestingAppMajorVer]((uint64_t)self);
  requestingAppMajorVer = self->_requestingAppMajorVer;

  return requestingAppMajorVer;
}

- (void)_readRequestingAppMinorVer
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 158) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestingAppMinorVer_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasRequestingAppMinorVer
{
  return self->_requestingAppMinorVer != 0;
}

- (NSString)requestingAppMinorVer
{
  -[GEONetworkEventData _readRequestingAppMinorVer]((uint64_t)self);
  requestingAppMinorVer = self->_requestingAppMinorVer;

  return requestingAppMinorVer;
}

- (void)_readErrorDomain
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readErrorDomain_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (NSString)errorDomain
{
  -[GEONetworkEventData _readErrorDomain]((uint64_t)self);
  errorDomain = self->_errorDomain;

  return errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x82000u;
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x80001u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  self->_$3296299F16D566F38FA83A9082AA5EFC flags = ($3296299F16D566F38FA83A9082AA5EFC)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x80000);
}

- (BOOL)hasErrorCode
{
  return *(_DWORD *)&self->_flags & 1;
}

- (NSMutableArray)additionalStates
{
  -[GEONetworkEventData _readAdditionalStates]((uint64_t)self);
  additionalStates = self->_additionalStates;

  return additionalStates;
}

- (void)setAdditionalStates:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  additionalStates = self->_additionalStates;
  self->_additionalStates = v4;
}

- (void)clearAdditionalStates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  additionalStates = self->_additionalStates;

  [(NSMutableArray *)additionalStates removeAllObjects];
}

- (unint64_t)additionalStatesCount
{
  -[GEONetworkEventData _readAdditionalStates]((uint64_t)self);
  additionalStates = self->_additionalStates;

  return [(NSMutableArray *)additionalStates count];
}

- (id)additionalStatesAtIndex:(unint64_t)a3
{
  -[GEONetworkEventData _readAdditionalStates]((uint64_t)self);
  additionalStates = self->_additionalStates;

  return (id)[(NSMutableArray *)additionalStates objectAtIndex:a3];
}

+ (Class)additionalStatesType
{
  return (Class)objc_opt_class();
}

- (double)eventTimestamp
{
  return self->_eventTimestamp;
}

- (void)setHasEventTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 524290;
  }
  else {
    int v3 = 0x80000;
  }
  self->_$3296299F16D566F38FA83A9082AA5EFC flags = ($3296299F16D566F38FA83A9082AA5EFC)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasEventTimestamp
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryCode_tags_2805);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (NSString)countryCode
{
  -[GEONetworkEventData _readCountryCode]((uint64_t)self);
  countryCode = self->_countryCode;

  return countryCode;
}

- (unsigned)tilesetId
{
  return self->_tilesetId;
}

- (void)setHasTilesetId:(BOOL)a3
{
  if (a3) {
    int v3 = 524352;
  }
  else {
    int v3 = 0x80000;
  }
  self->_$3296299F16D566F38FA83A9082AA5EFC flags = ($3296299F16D566F38FA83A9082AA5EFC)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasTilesetId
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (void)_readLocale
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocale_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (NSString)locale
{
  -[GEONetworkEventData _readLocale]((uint64_t)self);
  locale = self->_locale;

  return locale;
}

- (unsigned)datasetId
{
  return self->_datasetId;
}

- (void)setHasDatasetId:(BOOL)a3
{
  if (a3) {
    int v3 = 524304;
  }
  else {
    int v3 = 0x80000;
  }
  self->_$3296299F16D566F38FA83A9082AA5EFC flags = ($3296299F16D566F38FA83A9082AA5EFC)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasDatasetId
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (void)_readManifestEnvironment
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readManifestEnvironment_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasManifestEnvironment
{
  return self->_manifestEnvironment != 0;
}

- (NSString)manifestEnvironment
{
  -[GEONetworkEventData _readManifestEnvironment]((uint64_t)self);
  manifestEnvironment = self->_manifestEnvironment;

  return manifestEnvironment;
}

- (void)_readAppIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppIdentifier_tags_2806);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (NSString)appIdentifier
{
  -[GEONetworkEventData _readAppIdentifier]((uint64_t)self);
  appIdentifier = self->_appIdentifier;

  return appIdentifier;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONetworkEventData;
  int v4 = [(GEONetworkEventData *)&v8 description];
  id v5 = [(GEONetworkEventData *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONetworkEventData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_91;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 clientMetrics];
  objc_super v6 = v5;
  if (v5)
  {
    if (a2)
    {
      objc_super v7 = [v5 jsonRepresentation];
      objc_super v8 = @"clientMetrics";
    }
    else
    {
      objc_super v7 = [v5 dictionaryRepresentation];
      objc_super v8 = @"client_metrics";
    }
    [v4 setObject:v7 forKey:v8];
  }
  int v9 = *(_DWORD *)(a1 + 156);
  if ((v9 & 8) != 0)
  {
    v51 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 136)];
    if (a2) {
      v52 = @"dataRequestKindType";
    }
    else {
      v52 = @"data_request_kind_type";
    }
    [v4 setObject:v51 forKey:v52];

    int v9 = *(_DWORD *)(a1 + 156);
    if ((v9 & 4) == 0)
    {
LABEL_9:
      if ((v9 & 0x20) == 0) {
        goto LABEL_10;
      }
LABEL_102:
      uint64_t v55 = *(int *)(a1 + 144);
      if v55 < 0x1D && ((0x1FFF7FFFu >> v55))
      {
        v56 = off_1E53E7D18[v55];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 144));
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (a2) {
        v57 = @"networkService";
      }
      else {
        v57 = @"network_service";
      }
      [v4 setObject:v56 forKey:v57];

      if ((*(_DWORD *)(a1 + 156) & 0x80) == 0) {
        goto LABEL_15;
      }
      goto LABEL_11;
    }
  }
  else if ((v9 & 4) == 0)
  {
    goto LABEL_9;
  }
  v53 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 132)];
  if (a2) {
    v54 = @"dataRequestKindSubtype";
  }
  else {
    v54 = @"data_request_kind_subtype";
  }
  [v4 setObject:v53 forKey:v54];

  int v9 = *(_DWORD *)(a1 + 156);
  if ((v9 & 0x20) != 0) {
    goto LABEL_102;
  }
LABEL_10:
  if ((v9 & 0x80) != 0)
  {
LABEL_11:
    v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 152)];
    if (a2) {
      v11 = @"usedBackgroundUrl";
    }
    else {
      v11 = @"used_background_url";
    }
    [v4 setObject:v10 forKey:v11];
  }
LABEL_15:
  v12 = [(id)a1 requestingAppIdentifier];
  if (v12)
  {
    if (a2) {
      long long v13 = @"requestingAppIdentifier";
    }
    else {
      long long v13 = @"requesting_app_identifier";
    }
    [v4 setObject:v12 forKey:v13];
  }

  long long v14 = [(id)a1 requestingAppMajorVer];
  if (v14)
  {
    if (a2) {
      long long v15 = @"requestingAppMajorVer";
    }
    else {
      long long v15 = @"requesting_app_major_ver";
    }
    [v4 setObject:v14 forKey:v15];
  }

  long long v16 = [(id)a1 requestingAppMinorVer];
  if (v16)
  {
    if (a2) {
      v17 = @"requestingAppMinorVer";
    }
    else {
      v17 = @"requesting_app_minor_ver";
    }
    [v4 setObject:v16 forKey:v17];
  }

  uint64_t v18 = [(id)a1 errorDomain];
  if (v18)
  {
    if (a2) {
      v19 = @"errorDomain";
    }
    else {
      v19 = @"error_domain";
    }
    [v4 setObject:v18 forKey:v19];
  }

  if (*(unsigned char *)(a1 + 156))
  {
    v20 = [NSNumber numberWithLongLong:*(void *)(a1 + 56)];
    if (a2) {
      v21 = @"errorCode";
    }
    else {
      v21 = @"error_code";
    }
    [v4 setObject:v20 forKey:v21];
  }
  if ([*(id *)(a1 + 24) count])
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v23 = *(id *)(a1 + 24);
    uint64_t v24 = [v23 countByEnumeratingWithState:&v60 objects:v64 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v61 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          if (a2) {
            [v28 jsonRepresentation];
          }
          else {
          v29 = [v28 dictionaryRepresentation];
          }
          [v22 addObject:v29];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v60 objects:v64 count:16];
      }
      while (v25);
    }

    if (a2) {
      v30 = @"additionalStates";
    }
    else {
      v30 = @"additional_states";
    }
    [v4 setObject:v22 forKey:v30];
  }
  if ((*(unsigned char *)(a1 + 156) & 2) != 0)
  {
    v31 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
    if (a2) {
      v32 = @"eventTimestamp";
    }
    else {
      v32 = @"event_timestamp";
    }
    [v4 setObject:v31 forKey:v32];
  }
  v33 = [(id)a1 countryCode];
  if (v33)
  {
    if (a2) {
      v34 = @"countryCode";
    }
    else {
      v34 = @"country_code";
    }
    [v4 setObject:v33 forKey:v34];
  }

  if ((*(unsigned char *)(a1 + 156) & 0x40) != 0)
  {
    v35 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 148)];
    if (a2) {
      v36 = @"tilesetId";
    }
    else {
      v36 = @"tileset_id";
    }
    [v4 setObject:v35 forKey:v36];
  }
  v37 = [(id)a1 locale];
  if (v37) {
    [v4 setObject:v37 forKey:@"locale"];
  }

  if ((*(unsigned char *)(a1 + 156) & 0x10) != 0)
  {
    v38 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 140)];
    if (a2) {
      v39 = @"datasetId";
    }
    else {
      v39 = @"dataset_id";
    }
    [v4 setObject:v38 forKey:v39];
  }
  v40 = [(id)a1 manifestEnvironment];
  if (v40)
  {
    if (a2) {
      v41 = @"manifestEnvironment";
    }
    else {
      v41 = @"manifest_environment";
    }
    [v4 setObject:v40 forKey:v41];
  }

  v42 = [(id)a1 appIdentifier];
  if (v42)
  {
    if (a2) {
      v43 = @"appIdentifier";
    }
    else {
      v43 = @"app_identifier";
    }
    [v4 setObject:v42 forKey:v43];
  }

  v44 = *(void **)(a1 + 16);
  if (v44)
  {
    v45 = [v44 dictionaryRepresentation];
    v46 = v45;
    if (a2)
    {
      v47 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v45, "count"));
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __49__GEONetworkEventData__dictionaryRepresentation___block_invoke;
      v58[3] = &unk_1E53D8860;
      id v48 = v47;
      id v59 = v48;
      [v46 enumerateKeysAndObjectsUsingBlock:v58];
      id v49 = v48;

      v46 = v49;
    }
    [v4 setObject:v46 forKey:@"Unknown Fields"];
  }
LABEL_91:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONetworkEventData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEONetworkEventData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    int v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEONetworkEventData)initWithDictionary:(id)a3
{
  return (GEONetworkEventData *)-[GEONetworkEventData _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_166;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_166;
  }
  if (a3) {
    objc_super v6 = @"clientMetrics";
  }
  else {
    objc_super v6 = @"client_metrics";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [GEOClientMetrics alloc];
    if (a3) {
      uint64_t v9 = [(GEOClientMetrics *)v8 initWithJSON:v7];
    }
    else {
      uint64_t v9 = [(GEOClientMetrics *)v8 initWithDictionary:v7];
    }
    id v10 = (void *)v9;
    [a1 setClientMetrics:v9];
  }
  if (a3) {
    v11 = @"dataRequestKindType";
  }
  else {
    v11 = @"data_request_kind_type";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDataRequestKindType:", objc_msgSend(v12, "intValue"));
  }

  if (a3) {
    long long v13 = @"dataRequestKindSubtype";
  }
  else {
    long long v13 = @"data_request_kind_subtype";
  }
  long long v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDataRequestKindSubtype:", objc_msgSend(v14, "intValue"));
  }

  if (a3) {
    long long v15 = @"networkService";
  }
  else {
    long long v15 = @"network_service";
  }
  long long v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v16;
    if ([v17 isEqualToString:@"NETWORK_SERVICE_UNKNOWN"])
    {
      uint64_t v18 = 0;
    }
    else if ([v17 isEqualToString:@"REVERSE_GEOCODER"])
    {
      uint64_t v18 = 1;
    }
    else if ([v17 isEqualToString:@"FORWARD_GEOCODER"])
    {
      uint64_t v18 = 2;
    }
    else if ([v17 isEqualToString:@"SEARCH"])
    {
      uint64_t v18 = 3;
    }
    else if ([v17 isEqualToString:@"DIRECTIONS"])
    {
      uint64_t v18 = 4;
    }
    else if ([v17 isEqualToString:@"TILE"])
    {
      uint64_t v18 = 5;
    }
    else if ([v17 isEqualToString:@"TRAFFIC_ETA"])
    {
      uint64_t v18 = 6;
    }
    else if ([v17 isEqualToString:@"SIMPLE_ETA"])
    {
      uint64_t v18 = 7;
    }
    else if ([v17 isEqualToString:@"SUGGESTIONS"])
    {
      uint64_t v18 = 8;
    }
    else if ([v17 isEqualToString:@"BATCH_REVGEO"])
    {
      uint64_t v18 = 9;
    }
    else if ([v17 isEqualToString:@"MAP_MATCH"])
    {
      uint64_t v18 = 10;
    }
    else if ([v17 isEqualToString:@"ADDRESS_CORRECTION_INIT"])
    {
      uint64_t v18 = 11;
    }
    else if ([v17 isEqualToString:@"ADDRESS_CORRECTION_UPDATE"])
    {
      uint64_t v18 = 12;
    }
    else if ([v17 isEqualToString:@"PLACE_DATA"])
    {
      uint64_t v18 = 13;
    }
    else if ([v17 isEqualToString:@"RESOURCE_LOADER"])
    {
      uint64_t v18 = 14;
    }
    else if ([v17 isEqualToString:@"LOG_MESSAGE_USAGE"])
    {
      uint64_t v18 = 16;
    }
    else if ([v17 isEqualToString:@"LOCATION_SHIFT"])
    {
      uint64_t v18 = 17;
    }
    else if ([v17 isEqualToString:@"AB_ASSIGN"])
    {
      uint64_t v18 = 18;
    }
    else if ([v17 isEqualToString:@"MANIFEST"])
    {
      uint64_t v18 = 19;
    }
    else if ([v17 isEqualToString:@"REALTIME_TRAFFIC_PROBE"])
    {
      uint64_t v18 = 20;
    }
    else if ([v17 isEqualToString:@"BATCH_TRAFFIC_PROBE"])
    {
      uint64_t v18 = 21;
    }
    else if ([v17 isEqualToString:@"SYNC"])
    {
      uint64_t v18 = 22;
    }
    else if ([v17 isEqualToString:@"WIFI_QUALITY"])
    {
      uint64_t v18 = 23;
    }
    else if ([v17 isEqualToString:@"NETWORK_DEFAULTS"])
    {
      uint64_t v18 = 24;
    }
    else if ([v17 isEqualToString:@"MUNIN_RESOURCE"])
    {
      uint64_t v18 = 25;
    }
    else if ([v17 isEqualToString:@"JUNCTION_VIEW"])
    {
      uint64_t v18 = 26;
    }
    else if ([v17 isEqualToString:@"WIFI_TILE"])
    {
      uint64_t v18 = 27;
    }
    else if ([v17 isEqualToString:@"INCIDENT"])
    {
      uint64_t v18 = 28;
    }
    else
    {
      uint64_t v18 = 0;
    }

    goto LABEL_85;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [v16 intValue];
LABEL_85:
    [a1 setNetworkService:v18];
  }

  if (a3) {
    v19 = @"usedBackgroundUrl";
  }
  else {
    v19 = @"used_background_url";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setUsedBackgroundUrl:", objc_msgSend(v20, "BOOLValue"));
  }

  if (a3) {
    v21 = @"requestingAppIdentifier";
  }
  else {
    v21 = @"requesting_app_identifier";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = (void *)[v22 copy];
    [a1 setRequestingAppIdentifier:v23];
  }
  if (a3) {
    uint64_t v24 = @"requestingAppMajorVer";
  }
  else {
    uint64_t v24 = @"requesting_app_major_ver";
  }
  uint64_t v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v26 = (void *)[v25 copy];
    [a1 setRequestingAppMajorVer:v26];
  }
  if (a3) {
    v27 = @"requestingAppMinorVer";
  }
  else {
    v27 = @"requesting_app_minor_ver";
  }
  v28 = [v5 objectForKeyedSubscript:v27];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29 = (void *)[v28 copy];
    [a1 setRequestingAppMinorVer:v29];
  }
  if (a3) {
    v30 = @"errorDomain";
  }
  else {
    v30 = @"error_domain";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32 = (void *)[v31 copy];
    [a1 setErrorDomain:v32];
  }
  if (a3) {
    v33 = @"errorCode";
  }
  else {
    v33 = @"error_code";
  }
  v34 = [v5 objectForKeyedSubscript:v33];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setErrorCode:", objc_msgSend(v34, "longLongValue"));
  }

  if (a3) {
    v35 = @"additionalStates";
  }
  else {
    v35 = @"additional_states";
  }
  v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v64 = v5;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v37 = v36;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v65 objects:v69 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v66 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void *)(*((void *)&v65 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v43 = [GEOLogMsgState alloc];
            if (a3) {
              uint64_t v44 = [(GEOLogMsgState *)v43 initWithJSON:v42];
            }
            else {
              uint64_t v44 = [(GEOLogMsgState *)v43 initWithDictionary:v42];
            }
            v45 = (void *)v44;
            [a1 addAdditionalStates:v44];
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v65 objects:v69 count:16];
      }
      while (v39);
    }

    id v5 = v64;
  }

  if (a3) {
    v46 = @"eventTimestamp";
  }
  else {
    v46 = @"event_timestamp";
  }
  v47 = [v5 objectForKeyedSubscript:v46];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v47 doubleValue];
    objc_msgSend(a1, "setEventTimestamp:");
  }

  if (a3) {
    id v48 = @"countryCode";
  }
  else {
    id v48 = @"country_code";
  }
  id v49 = [v5 objectForKeyedSubscript:v48];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v50 = (void *)[v49 copy];
    [a1 setCountryCode:v50];
  }
  if (a3) {
    v51 = @"tilesetId";
  }
  else {
    v51 = @"tileset_id";
  }
  v52 = [v5 objectForKeyedSubscript:v51];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTilesetId:", objc_msgSend(v52, "unsignedIntValue"));
  }

  v53 = [v5 objectForKeyedSubscript:@"locale"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v54 = (void *)[v53 copy];
    [a1 setLocale:v54];
  }
  if (a3) {
    uint64_t v55 = @"datasetId";
  }
  else {
    uint64_t v55 = @"dataset_id";
  }
  v56 = [v5 objectForKeyedSubscript:v55];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDatasetId:", objc_msgSend(v56, "unsignedIntValue"));
  }

  if (a3) {
    v57 = @"manifestEnvironment";
  }
  else {
    v57 = @"manifest_environment";
  }
  v58 = [v5 objectForKeyedSubscript:v57];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v59 = (void *)[v58 copy];
    [a1 setManifestEnvironment:v59];
  }
  if (a3) {
    long long v60 = @"appIdentifier";
  }
  else {
    long long v60 = @"app_identifier";
  }
  long long v61 = [v5 objectForKeyedSubscript:v60];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v62 = (void *)[v61 copy];
    [a1 setAppIdentifier:v62];
  }
LABEL_166:

  return a1;
}

- (GEONetworkEventData)initWithJSON:(id)a3
{
  return (GEONetworkEventData *)-[GEONetworkEventData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONetworkEventDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONetworkEventDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEONetworkEventData _readAdditionalStates]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_additionalStates;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  v11 = (id *)a3;
  [(GEONetworkEventData *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 30) = self->_readerMarkPos;
  *((_DWORD *)v11 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_clientMetrics) {
    objc_msgSend(v11, "setClientMetrics:");
  }
  $3296299F16D566F38FA83A9082AA5EFC flags = self->_flags;
  id v5 = v11;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    *((_DWORD *)v11 + 34) = self->_dataRequestKindType;
    *((_DWORD *)v11 + 39) |= 8u;
    $3296299F16D566F38FA83A9082AA5EFC flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)&flags & 0x20) == 0) {
        goto LABEL_6;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&flags & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v11 + 33) = self->_dataRequestKindSubtype;
  *((_DWORD *)v11 + 39) |= 4u;
  $3296299F16D566F38FA83A9082AA5EFC flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&flags & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_41:
  *((_DWORD *)v11 + 36) = self->_networkService;
  *((_DWORD *)v11 + 39) |= 0x20u;
  if ((*(_DWORD *)&self->_flags & 0x80) != 0)
  {
LABEL_7:
    *((unsigned char *)v11 + 152) = self->_usedBackgroundUrl;
    *((_DWORD *)v11 + 39) |= 0x80u;
  }
LABEL_8:
  if (self->_requestingAppIdentifier)
  {
    objc_msgSend(v11, "setRequestingAppIdentifier:");
    id v5 = v11;
  }
  if (self->_requestingAppMajorVer)
  {
    objc_msgSend(v11, "setRequestingAppMajorVer:");
    id v5 = v11;
  }
  if (self->_requestingAppMinorVer)
  {
    objc_msgSend(v11, "setRequestingAppMinorVer:");
    id v5 = v11;
  }
  if (self->_errorDomain)
  {
    objc_msgSend(v11, "setErrorDomain:");
    id v5 = v11;
  }
  if (*(unsigned char *)&self->_flags)
  {
    v5[7] = self->_errorCode;
    *((_DWORD *)v5 + 39) |= 1u;
  }
  if ([(GEONetworkEventData *)self additionalStatesCount])
  {
    [v11 clearAdditionalStates];
    unint64_t v6 = [(GEONetworkEventData *)self additionalStatesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(GEONetworkEventData *)self additionalStatesAtIndex:i];
        [v11 addAdditionalStates:v9];
      }
    }
  }
  BOOL v10 = v11;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v11[9] = *(id *)&self->_eventTimestamp;
    *((_DWORD *)v11 + 39) |= 2u;
  }
  if (self->_countryCode)
  {
    objc_msgSend(v11, "setCountryCode:");
    BOOL v10 = v11;
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    *((_DWORD *)v10 + 37) = self->_tilesetId;
    *((_DWORD *)v10 + 39) |= 0x40u;
  }
  if (self->_locale)
  {
    objc_msgSend(v11, "setLocale:");
    BOOL v10 = v11;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v10 + 35) = self->_datasetId;
    *((_DWORD *)v10 + 39) |= 0x10u;
  }
  if (self->_manifestEnvironment)
  {
    objc_msgSend(v11, "setManifestEnvironment:");
    BOOL v10 = v11;
  }
  if (self->_appIdentifier)
  {
    objc_msgSend(v11, "setAppIdentifier:");
    BOOL v10 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEONetworkEventDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_26;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEONetworkEventData *)self readAll:0];
  id v9 = [(GEOClientMetrics *)self->_clientMetrics copyWithZone:a3];
  BOOL v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  $3296299F16D566F38FA83A9082AA5EFC flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_dataRequestKindType;
    *(_DWORD *)(v5 + 156) |= 8u;
    $3296299F16D566F38FA83A9082AA5EFC flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&flags & 0x20) == 0) {
        goto LABEL_8;
      }
LABEL_29:
      *(_DWORD *)(v5 + 144) = self->_networkService;
      *(_DWORD *)(v5 + 156) |= 0x20u;
      if ((*(_DWORD *)&self->_flags & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&flags & 4) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 132) = self->_dataRequestKindSubtype;
  *(_DWORD *)(v5 + 156) |= 4u;
  $3296299F16D566F38FA83A9082AA5EFC flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    goto LABEL_29;
  }
LABEL_8:
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
LABEL_9:
    *(unsigned char *)(v5 + 152) = self->_usedBackgroundUrl;
    *(_DWORD *)(v5 + 156) |= 0x80u;
  }
LABEL_10:
  uint64_t v12 = [(NSString *)self->_requestingAppIdentifier copyWithZone:a3];
  long long v13 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v12;

  uint64_t v14 = [(NSString *)self->_requestingAppMajorVer copyWithZone:a3];
  long long v15 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v14;

  uint64_t v16 = [(NSString *)self->_requestingAppMinorVer copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v16;

  uint64_t v18 = [(NSString *)self->_errorDomain copyWithZone:a3];
  v19 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v18;

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 56) = self->_errorCode;
    *(_DWORD *)(v5 + 156) |= 1u;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v20 = self->_additionalStates;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(v20);
        }
        uint64_t v24 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "copyWithZone:", a3, (void)v35);
        [(id)v5 addAdditionalStates:v24];
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v21);
  }

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(double *)(v5 + 72) = self->_eventTimestamp;
    *(_DWORD *)(v5 + 156) |= 2u;
  }
  uint64_t v25 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3, (void)v35);
  uint64_t v26 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v25;

  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_tilesetId;
    *(_DWORD *)(v5 + 156) |= 0x40u;
  }
  uint64_t v27 = [(NSString *)self->_locale copyWithZone:a3];
  v28 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v27;

  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_datasetId;
    *(_DWORD *)(v5 + 156) |= 0x10u;
  }
  uint64_t v29 = [(NSString *)self->_manifestEnvironment copyWithZone:a3];
  v30 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v29;

  uint64_t v31 = [(NSString *)self->_appIdentifier copyWithZone:a3];
  v32 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v31;

  v33 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v33;
LABEL_26:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_68;
  }
  [(GEONetworkEventData *)self readAll:1];
  [v4 readAll:1];
  clientMetrics = self->_clientMetrics;
  if ((unint64_t)clientMetrics | *((void *)v4 + 5))
  {
    if (!-[GEOClientMetrics isEqual:](clientMetrics, "isEqual:")) {
      goto LABEL_68;
    }
  }
  $3296299F16D566F38FA83A9082AA5EFC flags = self->_flags;
  int v7 = *((_DWORD *)v4 + 39);
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_dataRequestKindType != *((_DWORD *)v4 + 34)) {
      goto LABEL_68;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_68;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_dataRequestKindSubtype != *((_DWORD *)v4 + 33)) {
      goto LABEL_68;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_68;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_networkService != *((_DWORD *)v4 + 36)) {
      goto LABEL_68;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_68;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_68;
    }
    if (self->_usedBackgroundUrl)
    {
      if (!*((unsigned char *)v4 + 152)) {
        goto LABEL_68;
      }
    }
    else if (*((unsigned char *)v4 + 152))
    {
      goto LABEL_68;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_68;
  }
  requestingAppIdentifier = self->_requestingAppIdentifier;
  if ((unint64_t)requestingAppIdentifier | *((void *)v4 + 12)
    && !-[NSString isEqual:](requestingAppIdentifier, "isEqual:"))
  {
    goto LABEL_68;
  }
  requestingAppMajorVer = self->_requestingAppMajorVer;
  if ((unint64_t)requestingAppMajorVer | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](requestingAppMajorVer, "isEqual:")) {
      goto LABEL_68;
    }
  }
  requestingAppMinorVer = self->_requestingAppMinorVer;
  if ((unint64_t)requestingAppMinorVer | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](requestingAppMinorVer, "isEqual:")) {
      goto LABEL_68;
    }
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](errorDomain, "isEqual:")) {
      goto LABEL_68;
    }
  }
  $3296299F16D566F38FA83A9082AA5EFC v12 = self->_flags;
  int v13 = *((_DWORD *)v4 + 39);
  if (*(unsigned char *)&v12)
  {
    if ((v13 & 1) == 0 || self->_errorCode != *((void *)v4 + 7)) {
      goto LABEL_68;
    }
  }
  else if (v13)
  {
    goto LABEL_68;
  }
  additionalStates = self->_additionalStates;
  if ((unint64_t)additionalStates | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](additionalStates, "isEqual:")) {
      goto LABEL_68;
    }
    $3296299F16D566F38FA83A9082AA5EFC v12 = self->_flags;
    int v13 = *((_DWORD *)v4 + 39);
  }
  if ((*(unsigned char *)&v12 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_eventTimestamp != *((double *)v4 + 9)) {
      goto LABEL_68;
    }
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_68;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:")) {
      goto LABEL_68;
    }
    $3296299F16D566F38FA83A9082AA5EFC v12 = self->_flags;
    int v13 = *((_DWORD *)v4 + 39);
  }
  if ((*(unsigned char *)&v12 & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0 || self->_tilesetId != *((_DWORD *)v4 + 37)) {
      goto LABEL_68;
    }
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_68;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((void *)v4 + 10))
  {
    if (-[NSString isEqual:](locale, "isEqual:"))
    {
      $3296299F16D566F38FA83A9082AA5EFC v12 = self->_flags;
      int v13 = *((_DWORD *)v4 + 39);
      goto LABEL_59;
    }
LABEL_68:
    char v19 = 0;
    goto LABEL_69;
  }
LABEL_59:
  if ((*(unsigned char *)&v12 & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_datasetId != *((_DWORD *)v4 + 35)) {
      goto LABEL_68;
    }
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_68;
  }
  manifestEnvironment = self->_manifestEnvironment;
  if ((unint64_t)manifestEnvironment | *((void *)v4 + 11)
    && !-[NSString isEqual:](manifestEnvironment, "isEqual:"))
  {
    goto LABEL_68;
  }
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((void *)v4 + 4)) {
    char v19 = -[NSString isEqual:](appIdentifier, "isEqual:");
  }
  else {
    char v19 = 1;
  }
LABEL_69:

  return v19;
}

- (unint64_t)hash
{
  [(GEONetworkEventData *)self readAll:1];
  unint64_t v26 = [(GEOClientMetrics *)self->_clientMetrics hash];
  $3296299F16D566F38FA83A9082AA5EFC flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    uint64_t v25 = 2654435761 * self->_dataRequestKindType;
    if ((*(unsigned char *)&flags & 4) != 0)
    {
LABEL_3:
      uint64_t v24 = 2654435761 * self->_dataRequestKindSubtype;
      if ((*(unsigned char *)&flags & 0x20) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v23 = 0;
      if ((*(unsigned char *)&flags & 0x80) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v24 = 0;
  if ((*(unsigned char *)&flags & 0x20) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v23 = 2654435761 * self->_networkService;
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
LABEL_5:
    uint64_t v22 = 2654435761 * self->_usedBackgroundUrl;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v22 = 0;
LABEL_10:
  NSUInteger v21 = [(NSString *)self->_requestingAppIdentifier hash];
  NSUInteger v20 = [(NSString *)self->_requestingAppMajorVer hash];
  NSUInteger v4 = [(NSString *)self->_requestingAppMinorVer hash];
  NSUInteger v5 = [(NSString *)self->_errorDomain hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSMutableArray *)self->_additionalStates hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    double eventTimestamp = self->_eventTimestamp;
    double v10 = -eventTimestamp;
    if (eventTimestamp >= 0.0) {
      double v10 = self->_eventTimestamp;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  NSUInteger v13 = [(NSString *)self->_countryCode hash];
  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
    uint64_t v14 = 2654435761 * self->_tilesetId;
  }
  else {
    uint64_t v14 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_locale hash];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    uint64_t v16 = 2654435761 * self->_datasetId;
  }
  else {
    uint64_t v16 = 0;
  }
  unint64_t v17 = v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14;
  NSUInteger v18 = v15 ^ v16 ^ [(NSString *)self->_manifestEnvironment hash];
  return v17 ^ v18 ^ [(NSString *)self->_appIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  clientMetrics = self->_clientMetrics;
  uint64_t v6 = *((void *)v4 + 5);
  if (clientMetrics)
  {
    if (v6) {
      -[GEOClientMetrics mergeFrom:](clientMetrics, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEONetworkEventData setClientMetrics:](self, "setClientMetrics:");
  }
  int v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 8) != 0)
  {
    self->_dataRequestKindType = *((_DWORD *)v4 + 34);
    *(_DWORD *)&self->_flags |= 8u;
    int v7 = *((_DWORD *)v4 + 39);
    if ((v7 & 4) == 0)
    {
LABEL_8:
      if ((v7 & 0x20) == 0) {
        goto LABEL_9;
      }
      goto LABEL_45;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_8;
  }
  self->_dataRequestKindSubtype = *((_DWORD *)v4 + 33);
  *(_DWORD *)&self->_flags |= 4u;
  int v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x20) == 0)
  {
LABEL_9:
    if ((v7 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_45:
  self->_networkService = *((_DWORD *)v4 + 36);
  *(_DWORD *)&self->_flags |= 0x20u;
  if ((*((_DWORD *)v4 + 39) & 0x80) != 0)
  {
LABEL_10:
    self->_usedBackgroundUrl = *((unsigned char *)v4 + 152);
    *(_DWORD *)&self->_flags |= 0x80u;
  }
LABEL_11:
  if (*((void *)v4 + 12)) {
    -[GEONetworkEventData setRequestingAppIdentifier:](self, "setRequestingAppIdentifier:");
  }
  if (*((void *)v4 + 13)) {
    -[GEONetworkEventData setRequestingAppMajorVer:](self, "setRequestingAppMajorVer:");
  }
  if (*((void *)v4 + 14)) {
    -[GEONetworkEventData setRequestingAppMinorVer:](self, "setRequestingAppMinorVer:");
  }
  if (*((void *)v4 + 8)) {
    -[GEONetworkEventData setErrorDomain:](self, "setErrorDomain:");
  }
  if (*((unsigned char *)v4 + 156))
  {
    self->_errorCode = *((void *)v4 + 7);
    *(_DWORD *)&self->_flags |= 1u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v4 + 3);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEONetworkEventData addAdditionalStates:](self, "addAdditionalStates:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  if ((*((unsigned char *)v4 + 156) & 2) != 0)
  {
    self->_double eventTimestamp = *((double *)v4 + 9);
    *(_DWORD *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 6)) {
    -[GEONetworkEventData setCountryCode:](self, "setCountryCode:");
  }
  if ((*((unsigned char *)v4 + 156) & 0x40) != 0)
  {
    self->_tilesetId = *((_DWORD *)v4 + 37);
    *(_DWORD *)&self->_flags |= 0x40u;
  }
  if (*((void *)v4 + 10)) {
    -[GEONetworkEventData setLocale:](self, "setLocale:");
  }
  if ((*((unsigned char *)v4 + 156) & 0x10) != 0)
  {
    self->_datasetId = *((_DWORD *)v4 + 35);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  if (*((void *)v4 + 11)) {
    -[GEONetworkEventData setManifestEnvironment:](self, "setManifestEnvironment:");
  }
  if (*((void *)v4 + 4)) {
    -[GEONetworkEventData setAppIdentifier:](self, "setAppIdentifier:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 1) & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEONetworkEventDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2909);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80100u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEONetworkEventData *)self readAll:0];
    clientMetrics = self->_clientMetrics;
    [(GEOClientMetrics *)clientMetrics clearUnknownFields:1];
  }
}

@end