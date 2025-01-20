@interface GEOPDAnalyticMetadata
+ (BOOL)isValid:(id)a3;
+ (Class)serviceTagType;
- (BOOL)hasAbAssignInfo;
- (BOOL)hasAppIdentifier;
- (BOOL)hasAppMajorVersion;
- (BOOL)hasAppMinorVersion;
- (BOOL)hasHardwareClass;
- (BOOL)hasHardwareModel;
- (BOOL)hasIsFromApi;
- (BOOL)hasIsInternalInstall;
- (BOOL)hasIsInternalTool;
- (BOOL)hasIsSiriOriginalRequest;
- (BOOL)hasLoggedAbExperiment;
- (BOOL)hasOsVersion;
- (BOOL)hasProductName;
- (BOOL)hasRelativeTimestamp;
- (BOOL)hasRequestSource;
- (BOOL)hasRequestTime;
- (BOOL)hasRouteStopCount;
- (BOOL)hasSequenceNumber;
- (BOOL)hasSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromApi;
- (BOOL)isInternalInstall;
- (BOOL)isInternalTool;
- (BOOL)isSiriOriginalRequest;
- (BOOL)readFrom:(id)a3;
- (GEOAbAssignInfo)abAssignInfo;
- (GEOLocalTime)requestTime;
- (GEOPDAnalyticMetadata)init;
- (GEOPDAnalyticMetadata)initWithData:(id)a3;
- (GEOPDAnalyticMetadata)initWithDictionary:(id)a3;
- (GEOPDAnalyticMetadata)initWithJSON:(id)a3;
- (GEOPDAnalyticMetadata)initWithTraits:(id)a3;
- (GEOSessionID)sessionId;
- (NSMutableArray)serviceTags;
- (NSString)appIdentifier;
- (NSString)appMajorVersion;
- (NSString)appMinorVersion;
- (NSString)hardwareClass;
- (NSString)hardwareModel;
- (NSString)loggedAbExperiment;
- (NSString)osVersion;
- (NSString)productName;
- (PBUnknownFields)unknownFields;
- (double)relativeTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)requestSourceAsString:(int)a3;
- (id)serviceTagAtIndex:(unint64_t)a3;
- (int)StringAsRequestSource:(id)a3;
- (int)requestSource;
- (unint64_t)hash;
- (unint64_t)serviceTagsCount;
- (unsigned)routeStopCount;
- (unsigned)sequenceNumber;
- (void)_addNoFlagsServiceTag:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAbAssignInfo;
- (void)_readAppIdentifier;
- (void)_readAppMajorVersion;
- (void)_readAppMinorVersion;
- (void)_readHardwareClass;
- (void)_readHardwareModel;
- (void)_readLoggedAbExperiment;
- (void)_readOsVersion;
- (void)_readProductName;
- (void)_readRequestTime;
- (void)_readServiceTags;
- (void)addServiceTag:(id)a3;
- (void)clearServiceTags;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbAssignInfo:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setAppMajorVersion:(id)a3;
- (void)setAppMinorVersion:(id)a3;
- (void)setHardwareClass:(id)a3;
- (void)setHardwareModel:(id)a3;
- (void)setHasIsFromApi:(BOOL)a3;
- (void)setHasIsInternalInstall:(BOOL)a3;
- (void)setHasIsInternalTool:(BOOL)a3;
- (void)setHasIsSiriOriginalRequest:(BOOL)a3;
- (void)setHasRelativeTimestamp:(BOOL)a3;
- (void)setHasRequestSource:(BOOL)a3;
- (void)setHasRouteStopCount:(BOOL)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setHasSessionId:(BOOL)a3;
- (void)setIsFromApi:(BOOL)a3;
- (void)setIsInternalInstall:(BOOL)a3;
- (void)setIsInternalTool:(BOOL)a3;
- (void)setIsSiriOriginalRequest:(BOOL)a3;
- (void)setLoggedAbExperiment:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setProductName:(id)a3;
- (void)setRelativeTimestamp:(double)a3;
- (void)setRequestSource:(int)a3;
- (void)setRequestTime:(id)a3;
- (void)setRouteStopCount:(unsigned int)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setServiceTags:(id)a3;
- (void)setSessionId:(GEOSessionID)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAnalyticMetadata

- (void)setRequestTime:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x280000u;
  objc_storeStrong((id *)&self->_requestTime, a3);
}

- (GEOPDAnalyticMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAnalyticMetadata;
  v2 = [(GEOPDAnalyticMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAnalyticMetadata)initWithTraits:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GEOPDAnalyticMetadata;
  v5 = [(GEOPDAnalyticMetadata *)&v23 init];
  if (!v5) {
    goto LABEL_22;
  }
  if (([v4 analyticsOptOut] & 1) == 0)
  {
    objc_super v6 = +[GEOUserSession sharedInstance];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57__GEOPDAnalyticMetadata_PlaceDataExtras__initWithTraits___block_invoke;
    v21[3] = &unk_1E53DC588;
    v22 = v5;
    [v6 shortSessionValues:v21];
  }
  if ([v4 hasAppIdentifier])
  {
    v7 = [v4 appIdentifier];
    [(GEOPDAnalyticMetadata *)v5 setAppIdentifier:v7];
  }
  if ([v4 hasAppMajorVersion])
  {
    v8 = [v4 appMajorVersion];
    [(GEOPDAnalyticMetadata *)v5 setAppMajorVersion:v8];
  }
  if ([v4 hasAppMinorVersion])
  {
    v9 = [v4 appMinorVersion];
    [(GEOPDAnalyticMetadata *)v5 setAppMinorVersion:v9];
  }
  v10 = +[GEOPlatform sharedPlatform];
  v11 = [v10 hardwareClass];

  if (!v11)
  {
    if (([v4 hasHardwareIdentifier] & 1) == 0) {
      goto LABEL_17;
    }
LABEL_15:
    uint64_t v12 = [v4 hardwareIdentifier];
    goto LABEL_16;
  }
  [(GEOPDAnalyticMetadata *)v5 setHardwareClass:v11];
  if ([v4 hasHardwareIdentifier]) {
    goto LABEL_15;
  }
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldPopulateFakeHardwareIdentifier, (uint64_t)off_1E9115068))
  {
    uint64_t v12 = [v11 stringByAppendingString:@"0,0"];
LABEL_16:
    v13 = (void *)v12;
    [(GEOPDAnalyticMetadata *)v5 setHardwareModel:v12];
  }
LABEL_17:
  v14 = +[GEOPlatform sharedPlatform];
  v15 = [v14 osAndBuildVersion];
  [(GEOPDAnalyticMetadata *)v5 setOsVersion:v15];

  v16 = +[GEOPlatform sharedPlatform];
  v17 = [v16 productName];
  [(GEOPDAnalyticMetadata *)v5 setProductName:v17];

  if ([v4 hasSource]) {
    -[GEOPDAnalyticMetadata setRequestSource:](v5, "setRequestSource:", _PDRSourceForGEOMapServiceTraits_Source([v4 source]));
  }
  if ([v4 hasRouteStopCount]) {
    -[GEOPDAnalyticMetadata setRouteStopCount:](v5, "setRouteStopCount:", [v4 routeStopCount]);
  }
  v18 = +[GEOPlatform sharedPlatform];
  -[GEOPDAnalyticMetadata setIsInternalInstall:](v5, "setIsInternalInstall:", [v18 isInternalInstall]);

  -[GEOPDAnalyticMetadata setIsFromApi:](v5, "setIsFromApi:", [v4 isAPICall]);
  v19 = +[GEOGeoServiceTag defaultTag];
  [(GEOPDAnalyticMetadata *)v5 addServiceTag:v19];

LABEL_22:
  return v5;
}

- (void)setProductName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x240000u;
  objc_storeStrong((id *)&self->_productName, a3);
}

- (void)setOsVersion:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x220000u;
  objc_storeStrong((id *)&self->_osVersion, a3);
}

- (void)setIsInternalInstall:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200040u;
  self->_isInternalInstall = a3;
}

- (void)setIsFromApi:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200020u;
  self->_isFromApi = a3;
}

- (void)setHardwareModel:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x208000u;
  objc_storeStrong((id *)&self->_hardwareModel, a3);
}

- (void)setHardwareClass:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x204000u;
  objc_storeStrong((id *)&self->_hardwareClass, a3);
}

- (void)addServiceTag:(id)a3
{
  id v4 = a3;
  -[GEOPDAnalyticMetadata _readServiceTags]((uint64_t)self);
  -[GEOPDAnalyticMetadata _addNoFlagsServiceTag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
}

- (void)_addNoFlagsServiceTag:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 128);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v5;

      id v4 = *(void **)(a1 + 128);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readServiceTags
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 166) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServiceTags_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (void)setAppMinorVersion:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x202000u;
  objc_storeStrong((id *)&self->_appMinorVersion, a3);
}

- (void)setAppMajorVersion:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x201000u;
  objc_storeStrong((id *)&self->_appMajorVersion, a3);
}

- (void)setAppIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200800u;
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (void)setSessionId:(GEOSessionID)a3
{
  *(_DWORD *)&self->_flags |= 0x200001u;
  self->_sessionId = a3;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x200010u;
  self->_sequenceNumber = a3;
}

- (void)setRelativeTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x200002u;
  self->_relativeTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceTags, 0);
  objc_storeStrong((id *)&self->_requestTime, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_loggedAbExperiment, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_hardwareClass, 0);
  objc_storeStrong((id *)&self->_appMinorVersion, 0);
  objc_storeStrong((id *)&self->_appMajorVersion, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_abAssignInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0x3FFC00) == 0)
    {
      uint64_t v12 = self->_reader;
      objc_sync_enter(v12);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v13];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v12);
      goto LABEL_51;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDAnalyticMetadata *)self readAll:0];
  if (self->_appIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_appMajorVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_appMinorVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_hardwareModel) {
    PBDataWriterWriteStringField();
  }
  if (self->_hardwareClass) {
    PBDataWriterWriteStringField();
  }
  if (self->_osVersion) {
    PBDataWriterWriteStringField();
  }
  $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x40) == 0)
    {
LABEL_17:
      if ((*(unsigned char *)&flags & 1) == 0) {
        goto LABEL_18;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&flags & 0x40) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
  if ((*(unsigned char *)&flags & 1) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v18 = 0;
  PBDataWriterPlaceMark();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterRecallMark();
  $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_flags & 0x20) != 0) {
LABEL_27:
  }
    PBDataWriterWriteBOOLField();
LABEL_28:
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_serviceTags;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }

  if (self->_productName) {
    PBDataWriterWriteStringField();
  }
  if (self->_loggedAbExperiment) {
    PBDataWriterWriteStringField();
  }
  if (self->_abAssignInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_requestTime) {
    PBDataWriterWriteSubmessage();
  }
  $925BF102989D38BAF07877F8029BF610 v11 = self->_flags;
  if ((*(unsigned char *)&v11 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    $925BF102989D38BAF07877F8029BF610 v11 = self->_flags;
  }
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    $925BF102989D38BAF07877F8029BF610 v11 = self->_flags;
  }
  if ((*(unsigned char *)&v11 & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
LABEL_51:
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
      uint64_t v8 = (int *)&readAll__recursiveTag_49;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_49;
    }
    GEOPDAnalyticMetadataReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDAnalyticMetadataCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOPDAnalyticMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAnalyticMetadata;
  BOOL v3 = [(GEOPDAnalyticMetadata *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readAppIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 165) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppIdentifier_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (NSString)appIdentifier
{
  -[GEOPDAnalyticMetadata _readAppIdentifier]((uint64_t)self);
  appIdentifier = self->_appIdentifier;

  return appIdentifier;
}

- (void)_readAppMajorVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 165) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppMajorVersion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasAppMajorVersion
{
  return self->_appMajorVersion != 0;
}

- (NSString)appMajorVersion
{
  -[GEOPDAnalyticMetadata _readAppMajorVersion]((uint64_t)self);
  appMajorVersion = self->_appMajorVersion;

  return appMajorVersion;
}

- (void)_readAppMinorVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 165) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppMinorVersion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasAppMinorVersion
{
  return self->_appMinorVersion != 0;
}

- (NSString)appMinorVersion
{
  -[GEOPDAnalyticMetadata _readAppMinorVersion]((uint64_t)self);
  appMinorVersion = self->_appMinorVersion;

  return appMinorVersion;
}

- (void)_readHardwareModel
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 165) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHardwareModel_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasHardwareModel
{
  return self->_hardwareModel != 0;
}

- (NSString)hardwareModel
{
  -[GEOPDAnalyticMetadata _readHardwareModel]((uint64_t)self);
  hardwareModel = self->_hardwareModel;

  return hardwareModel;
}

- (void)_readHardwareClass
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 165) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHardwareClass_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasHardwareClass
{
  return self->_hardwareClass != 0;
}

- (NSString)hardwareClass
{
  -[GEOPDAnalyticMetadata _readHardwareClass]((uint64_t)self);
  hardwareClass = self->_hardwareClass;

  return hardwareClass;
}

- (void)_readOsVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 166) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOsVersion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasOsVersion
{
  return self->_osVersion != 0;
}

- (NSString)osVersion
{
  -[GEOPDAnalyticMetadata _readOsVersion]((uint64_t)self);
  osVersion = self->_osVersion;

  return osVersion;
}

- (BOOL)isInternalTool
{
  return self->_isInternalTool;
}

- (void)setIsInternalTool:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200080u;
  self->_isInternalTool = a3;
}

- (void)setHasIsInternalTool:(BOOL)a3
{
  if (a3) {
    int v3 = 2097280;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$925BF102989D38BAF07877F8029BF610 flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasIsInternalTool
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)setHasIsInternalInstall:(BOOL)a3
{
  if (a3) {
    int v3 = 2097216;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$925BF102989D38BAF07877F8029BF610 flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasIsInternalInstall
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (GEOSessionID)sessionId
{
  p_sessionId = &self->_sessionId;
  unint64_t high = self->_sessionId._high;
  unint64_t low = p_sessionId->_low;
  result._unint64_t low = low;
  result._unint64_t high = high;
  return result;
}

- (void)setHasSessionId:(BOOL)a3
{
  self->_$925BF102989D38BAF07877F8029BF610 flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x200000);
}

- (BOOL)hasSessionId
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  if (a3) {
    int v3 = 2097168;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$925BF102989D38BAF07877F8029BF610 flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasSequenceNumber
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (int)requestSource
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 4) != 0) {
    return self->_requestSource;
  }
  else {
    return 0;
  }
}

- (void)setRequestSource:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x200004u;
  self->_requestSource = a3;
}

- (void)setHasRequestSource:(BOOL)a3
{
  if (a3) {
    int v3 = 2097156;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$925BF102989D38BAF07877F8029BF610 flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasRequestSource
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)requestSourceAsString:(int)a3
{
  if (a3 >= 0x18)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E6668[a3];
  }

  return v3;
}

- (int)StringAsRequestSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SOURCE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"URL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"USER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REFINEMENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SPELLING"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HINT_CONTACTS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"STARK_USER"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"HINT_COMPLETION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"STARK_HINT_COMPLETION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HINT_HISTORY"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"STARK_HINT_HISTORY"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_SEARCH"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"STARK_AUTOCOMPLETE_SEARCH"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_NAV_FROM"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_NAV_TO"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"NAV_FROM"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"NAV_TO"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"BOOKMARK_REFRESH"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"ROUTING"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"PRELOADER"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"USER_NO_TYPING"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"ADD_TO_FAVORITES"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"ADD_TO_COLLECTION"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"RAP_HINT_COMPLETION"])
  {
    int v4 = 23;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isFromApi
{
  return self->_isFromApi;
}

- (void)setHasIsFromApi:(BOOL)a3
{
  if (a3) {
    int v3 = 2097184;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$925BF102989D38BAF07877F8029BF610 flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFDFFFDF | v3);
}

- (BOOL)hasIsFromApi
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (NSMutableArray)serviceTags
{
  -[GEOPDAnalyticMetadata _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return serviceTags;
}

- (void)setServiceTags:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
  serviceTags = self->_serviceTags;
  self->_serviceTags = v4;
}

- (void)clearServiceTags
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
  serviceTags = self->_serviceTags;

  [(NSMutableArray *)serviceTags removeAllObjects];
}

- (unint64_t)serviceTagsCount
{
  -[GEOPDAnalyticMetadata _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return [(NSMutableArray *)serviceTags count];
}

- (id)serviceTagAtIndex:(unint64_t)a3
{
  -[GEOPDAnalyticMetadata _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return (id)[(NSMutableArray *)serviceTags objectAtIndex:a3];
}

+ (Class)serviceTagType
{
  return (Class)objc_opt_class();
}

- (void)_readProductName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 166) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProductName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasProductName
{
  return self->_productName != 0;
}

- (NSString)productName
{
  -[GEOPDAnalyticMetadata _readProductName]((uint64_t)self);
  productName = self->_productName;

  return productName;
}

- (void)_readLoggedAbExperiment
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 166) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLoggedAbExperiment_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasLoggedAbExperiment
{
  return self->_loggedAbExperiment != 0;
}

- (NSString)loggedAbExperiment
{
  -[GEOPDAnalyticMetadata _readLoggedAbExperiment]((uint64_t)self);
  loggedAbExperiment = self->_loggedAbExperiment;

  return loggedAbExperiment;
}

- (void)setLoggedAbExperiment:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x210000u;
  objc_storeStrong((id *)&self->_loggedAbExperiment, a3);
}

- (void)_readAbAssignInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 165) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbAssignInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasAbAssignInfo
{
  return self->_abAssignInfo != 0;
}

- (GEOAbAssignInfo)abAssignInfo
{
  -[GEOPDAnalyticMetadata _readAbAssignInfo]((uint64_t)self);
  abAssignInfo = self->_abAssignInfo;

  return abAssignInfo;
}

- (void)setAbAssignInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200400u;
  objc_storeStrong((id *)&self->_abAssignInfo, a3);
}

- (void)_readRequestTime
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 166) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnalyticMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestTime_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasRequestTime
{
  return self->_requestTime != 0;
}

- (GEOLocalTime)requestTime
{
  -[GEOPDAnalyticMetadata _readRequestTime]((uint64_t)self);
  requestTime = self->_requestTime;

  return requestTime;
}

- (double)relativeTimestamp
{
  return self->_relativeTimestamp;
}

- (void)setHasRelativeTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 2097154;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$925BF102989D38BAF07877F8029BF610 flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasRelativeTimestamp
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)isSiriOriginalRequest
{
  return self->_isSiriOriginalRequest;
}

- (void)setIsSiriOriginalRequest:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200100u;
  self->_isSiriOriginalRequest = a3;
}

- (void)setHasIsSiriOriginalRequest:(BOOL)a3
{
  if (a3) {
    int v3 = 2097408;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$925BF102989D38BAF07877F8029BF610 flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasIsSiriOriginalRequest
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (unsigned)routeStopCount
{
  return self->_routeStopCount;
}

- (void)setRouteStopCount:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x200008u;
  self->_routeStopCount = a3;
}

- (void)setHasRouteStopCount:(BOOL)a3
{
  if (a3) {
    int v3 = 2097160;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$925BF102989D38BAF07877F8029BF610 flags = ($925BF102989D38BAF07877F8029BF610)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasRouteStopCount
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAnalyticMetadata;
  int v4 = [(GEOPDAnalyticMetadata *)&v8 description];
  id v5 = [(GEOPDAnalyticMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAnalyticMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_106;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 appIdentifier];
  if (v5)
  {
    if (a2) {
      objc_super v6 = @"appIdentifier";
    }
    else {
      objc_super v6 = @"app_identifier";
    }
    [v4 setObject:v5 forKey:v6];
  }

  objc_super v7 = [(id)a1 appMajorVersion];
  if (v7)
  {
    if (a2) {
      objc_super v8 = @"appMajorVersion";
    }
    else {
      objc_super v8 = @"app_major_version";
    }
    [v4 setObject:v7 forKey:v8];
  }

  uint64_t v9 = [(id)a1 appMinorVersion];
  if (v9)
  {
    if (a2) {
      v10 = @"appMinorVersion";
    }
    else {
      v10 = @"app_minor_version";
    }
    [v4 setObject:v9 forKey:v10];
  }

  $925BF102989D38BAF07877F8029BF610 v11 = [(id)a1 hardwareModel];
  if (v11)
  {
    if (a2) {
      uint64_t v12 = @"hardwareModel";
    }
    else {
      uint64_t v12 = @"hardware_model";
    }
    [v4 setObject:v11 forKey:v12];
  }

  v13 = [(id)a1 hardwareClass];
  if (v13)
  {
    if (a2) {
      long long v14 = @"hardwareClass";
    }
    else {
      long long v14 = @"hardware_class";
    }
    [v4 setObject:v13 forKey:v14];
  }

  long long v15 = [(id)a1 osVersion];
  if (v15)
  {
    if (a2) {
      long long v16 = @"osVersion";
    }
    else {
      long long v16 = @"os_version";
    }
    [v4 setObject:v15 forKey:v16];
  }

  int v17 = *(_DWORD *)(a1 + 164);
  if ((v17 & 0x80) != 0)
  {
    v37 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 162)];
    if (a2) {
      v38 = @"isInternalTool";
    }
    else {
      v38 = @"is_internal_tool";
    }
    [v4 setObject:v37 forKey:v38];

    int v17 = *(_DWORD *)(a1 + 164);
    if ((v17 & 0x40) == 0)
    {
LABEL_34:
      if ((v17 & 1) == 0) {
        goto LABEL_35;
      }
      goto LABEL_78;
    }
  }
  else if ((v17 & 0x40) == 0)
  {
    goto LABEL_34;
  }
  v39 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 161)];
  if (a2) {
    v40 = @"isInternalInstall";
  }
  else {
    v40 = @"is_internal_install";
  }
  [v4 setObject:v39 forKey:v40];

  int v17 = *(_DWORD *)(a1 + 164);
  if ((v17 & 1) == 0)
  {
LABEL_35:
    if ((v17 & 0x10) == 0) {
      goto LABEL_36;
    }
    goto LABEL_82;
  }
LABEL_78:
  v41 = _GEOSessionIDDictionaryRepresentation((void *)(a1 + 24));
  if (a2) {
    v42 = @"sessionId";
  }
  else {
    v42 = @"session_id";
  }
  [v4 setObject:v41 forKey:v42];

  int v17 = *(_DWORD *)(a1 + 164);
  if ((v17 & 0x10) == 0)
  {
LABEL_36:
    if ((v17 & 4) == 0) {
      goto LABEL_37;
    }
    goto LABEL_86;
  }
LABEL_82:
  v43 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 156)];
  if (a2) {
    v44 = @"sequenceNumber";
  }
  else {
    v44 = @"sequence_number";
  }
  [v4 setObject:v43 forKey:v44];

  int v17 = *(_DWORD *)(a1 + 164);
  if ((v17 & 4) == 0)
  {
LABEL_37:
    if ((v17 & 0x20) == 0) {
      goto LABEL_42;
    }
    goto LABEL_38;
  }
LABEL_86:
  uint64_t v45 = *(int *)(a1 + 148);
  if (v45 >= 0x18)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 148));
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = off_1E53E6668[v45];
  }
  if (a2) {
    v65 = @"requestSource";
  }
  else {
    v65 = @"request_source";
  }
  [v4 setObject:v46 forKey:v65];

  if ((*(_DWORD *)(a1 + 164) & 0x20) != 0)
  {
LABEL_38:
    uint64_t v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 160)];
    if (a2) {
      v19 = @"isFromApi";
    }
    else {
      v19 = @"is_from_api";
    }
    [v4 setObject:v18 forKey:v19];
  }
LABEL_42:
  if ([*(id *)(a1 + 128) count])
  {
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v21 = *(id *)(a1 + 128);
    uint64_t v22 = [v21 countByEnumeratingWithState:&v68 objects:v72 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v69 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          if (a2) {
            [v26 jsonRepresentation];
          }
          else {
          v27 = [v26 dictionaryRepresentation];
          }
          [v20 addObject:v27];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v68 objects:v72 count:16];
      }
      while (v23);
    }

    if (a2) {
      v28 = @"serviceTag";
    }
    else {
      v28 = @"service_tag";
    }
    [v4 setObject:v20 forKey:v28];
  }
  v29 = [(id)a1 productName];
  if (v29)
  {
    if (a2) {
      v30 = @"productName";
    }
    else {
      v30 = @"product_name";
    }
    [v4 setObject:v29 forKey:v30];
  }

  v31 = [(id)a1 loggedAbExperiment];
  if (v31)
  {
    if (a2) {
      v32 = @"loggedAbExperiment";
    }
    else {
      v32 = @"logged_ab_experiment";
    }
    [v4 setObject:v31 forKey:v32];
  }

  v33 = [(id)a1 abAssignInfo];
  v34 = v33;
  if (v33)
  {
    if (a2)
    {
      v35 = [v33 jsonRepresentation];
      v36 = @"abAssignInfo";
    }
    else
    {
      v35 = [v33 dictionaryRepresentation];
      v36 = @"ab_assign_info";
    }
    [v4 setObject:v35 forKey:v36];
  }
  v47 = [(id)a1 requestTime];
  v48 = v47;
  if (v47)
  {
    if (a2)
    {
      v49 = [v47 jsonRepresentation];
      v50 = @"requestTime";
    }
    else
    {
      v49 = [v47 dictionaryRepresentation];
      v50 = @"request_time";
    }
    [v4 setObject:v49 forKey:v50];
  }
  int v51 = *(_DWORD *)(a1 + 164);
  if ((v51 & 2) != 0)
  {
    v61 = [NSNumber numberWithDouble:*(double *)(a1 + 112)];
    if (a2) {
      v62 = @"relativeTimestamp";
    }
    else {
      v62 = @"relative_timestamp";
    }
    [v4 setObject:v61 forKey:v62];

    int v51 = *(_DWORD *)(a1 + 164);
    if ((v51 & 0x100) == 0)
    {
LABEL_97:
      if ((v51 & 8) == 0) {
        goto LABEL_102;
      }
      goto LABEL_98;
    }
  }
  else if ((v51 & 0x100) == 0)
  {
    goto LABEL_97;
  }
  v63 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 163)];
  if (a2) {
    v64 = @"isSiriOriginalRequest";
  }
  else {
    v64 = @"is_siri_original_request";
  }
  [v4 setObject:v63 forKey:v64];

  if ((*(_DWORD *)(a1 + 164) & 8) != 0)
  {
LABEL_98:
    v52 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 152)];
    if (a2) {
      v53 = @"routeStopCount";
    }
    else {
      v53 = @"route_stop_count";
    }
    [v4 setObject:v52 forKey:v53];
  }
LABEL_102:
  v54 = *(void **)(a1 + 16);
  if (v54)
  {
    v55 = [v54 dictionaryRepresentation];
    v56 = v55;
    if (a2)
    {
      v57 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v55, "count"));
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __51__GEOPDAnalyticMetadata__dictionaryRepresentation___block_invoke;
      v66[3] = &unk_1E53D8860;
      id v58 = v57;
      id v67 = v58;
      [v56 enumerateKeysAndObjectsUsingBlock:v66];
      id v59 = v58;

      v56 = v59;
    }
    [v4 setObject:v56 forKey:@"Unknown Fields"];
  }
LABEL_106:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAnalyticMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOPDAnalyticMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDAnalyticMetadata)initWithDictionary:(id)a3
{
  return (GEOPDAnalyticMetadata *)-[GEOPDAnalyticMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_174;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_174;
  }
  if (a3) {
    objc_super v6 = @"appIdentifier";
  }
  else {
    objc_super v6 = @"app_identifier";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setAppIdentifier:v8];
  }
  if (a3) {
    uint64_t v9 = @"appMajorVersion";
  }
  else {
    uint64_t v9 = @"app_major_version";
  }
  id v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    $925BF102989D38BAF07877F8029BF610 v11 = (void *)[v10 copy];
    [a1 setAppMajorVersion:v11];
  }
  if (a3) {
    uint64_t v12 = @"appMinorVersion";
  }
  else {
    uint64_t v12 = @"app_minor_version";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v14 = (void *)[v13 copy];
    [a1 setAppMinorVersion:v14];
  }
  if (a3) {
    long long v15 = @"hardwareModel";
  }
  else {
    long long v15 = @"hardware_model";
  }
  long long v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v17 = (void *)[v16 copy];
    [a1 setHardwareModel:v17];
  }
  if (a3) {
    uint64_t v18 = @"hardwareClass";
  }
  else {
    uint64_t v18 = @"hardware_class";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = (void *)[v19 copy];
    [a1 setHardwareClass:v20];
  }
  if (a3) {
    id v21 = @"osVersion";
  }
  else {
    id v21 = @"os_version";
  }
  uint64_t v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v23 = (void *)[v22 copy];
    [a1 setOsVersion:v23];
  }
  if (a3) {
    uint64_t v24 = @"isInternalTool";
  }
  else {
    uint64_t v24 = @"is_internal_tool";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsInternalTool:", objc_msgSend(v25, "BOOLValue"));
  }

  if (a3) {
    v26 = @"isInternalInstall";
  }
  else {
    v26 = @"is_internal_install";
  }
  v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsInternalInstall:", objc_msgSend(v27, "BOOLValue"));
  }

  if (a3) {
    v28 = @"sessionId";
  }
  else {
    v28 = @"session_id";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v77 = 0;
    uint64_t v78 = 0;
    _GEOSessionIDFromDictionaryRepresentation(v29, &v77);
    objc_msgSend(a1, "setSessionId:", v77, v78);
  }

  if (a3) {
    v30 = @"sequenceNumber";
  }
  else {
    v30 = @"sequence_number";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSequenceNumber:", objc_msgSend(v31, "unsignedIntValue"));
  }

  if (a3) {
    v32 = @"requestSource";
  }
  else {
    v32 = @"request_source";
  }
  v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v34 = v33;
    if ([v34 isEqualToString:@"UNKNOWN_SOURCE"])
    {
      uint64_t v35 = 0;
    }
    else if ([v34 isEqualToString:@"URL"])
    {
      uint64_t v35 = 1;
    }
    else if ([v34 isEqualToString:@"USER"])
    {
      uint64_t v35 = 2;
    }
    else if ([v34 isEqualToString:@"REFINEMENT"])
    {
      uint64_t v35 = 3;
    }
    else if ([v34 isEqualToString:@"SPELLING"])
    {
      uint64_t v35 = 4;
    }
    else if ([v34 isEqualToString:@"HINT_CONTACTS"])
    {
      uint64_t v35 = 5;
    }
    else if ([v34 isEqualToString:@"STARK_USER"])
    {
      uint64_t v35 = 6;
    }
    else if ([v34 isEqualToString:@"HINT_COMPLETION"])
    {
      uint64_t v35 = 7;
    }
    else if ([v34 isEqualToString:@"STARK_HINT_COMPLETION"])
    {
      uint64_t v35 = 8;
    }
    else if ([v34 isEqualToString:@"HINT_HISTORY"])
    {
      uint64_t v35 = 9;
    }
    else if ([v34 isEqualToString:@"STARK_HINT_HISTORY"])
    {
      uint64_t v35 = 10;
    }
    else if ([v34 isEqualToString:@"AUTOCOMPLETE_SEARCH"])
    {
      uint64_t v35 = 11;
    }
    else if ([v34 isEqualToString:@"STARK_AUTOCOMPLETE_SEARCH"])
    {
      uint64_t v35 = 12;
    }
    else if ([v34 isEqualToString:@"AUTOCOMPLETE_NAV_FROM"])
    {
      uint64_t v35 = 13;
    }
    else if ([v34 isEqualToString:@"AUTOCOMPLETE_NAV_TO"])
    {
      uint64_t v35 = 14;
    }
    else if ([v34 isEqualToString:@"NAV_FROM"])
    {
      uint64_t v35 = 15;
    }
    else if ([v34 isEqualToString:@"NAV_TO"])
    {
      uint64_t v35 = 16;
    }
    else if ([v34 isEqualToString:@"BOOKMARK_REFRESH"])
    {
      uint64_t v35 = 17;
    }
    else if ([v34 isEqualToString:@"ROUTING"])
    {
      uint64_t v35 = 18;
    }
    else if ([v34 isEqualToString:@"PRELOADER"])
    {
      uint64_t v35 = 19;
    }
    else if ([v34 isEqualToString:@"USER_NO_TYPING"])
    {
      uint64_t v35 = 20;
    }
    else if ([v34 isEqualToString:@"ADD_TO_FAVORITES"])
    {
      uint64_t v35 = 21;
    }
    else if ([v34 isEqualToString:@"ADD_TO_COLLECTION"])
    {
      uint64_t v35 = 22;
    }
    else if ([v34 isEqualToString:@"RAP_HINT_COMPLETION"])
    {
      uint64_t v35 = 23;
    }
    else
    {
      uint64_t v35 = 0;
    }

    goto LABEL_109;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v35 = [v33 intValue];
LABEL_109:
    [a1 setRequestSource:v35];
  }

  if (a3) {
    v36 = @"isFromApi";
  }
  else {
    v36 = @"is_from_api";
  }
  v37 = [v5 objectForKeyedSubscript:v36];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsFromApi:", objc_msgSend(v37, "BOOLValue"));
  }

  if (a3) {
    v38 = @"serviceTag";
  }
  else {
    v38 = @"service_tag";
  }
  v39 = [v5 objectForKeyedSubscript:v38];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v72 = v5;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v40 = v39;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v73 objects:v79 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v74 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = *(void *)(*((void *)&v73 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v46 = [GEOGeoServiceTag alloc];
            if (a3) {
              uint64_t v47 = [(GEOGeoServiceTag *)v46 initWithJSON:v45];
            }
            else {
              uint64_t v47 = [(GEOGeoServiceTag *)v46 initWithDictionary:v45];
            }
            v48 = (void *)v47;
            [a1 addServiceTag:v47];
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v73 objects:v79 count:16];
      }
      while (v42);
    }

    id v5 = v72;
  }

  if (a3) {
    v49 = @"productName";
  }
  else {
    v49 = @"product_name";
  }
  v50 = [v5 objectForKeyedSubscript:v49];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v51 = (void *)[v50 copy];
    [a1 setProductName:v51];
  }
  if (a3) {
    v52 = @"loggedAbExperiment";
  }
  else {
    v52 = @"logged_ab_experiment";
  }
  v53 = [v5 objectForKeyedSubscript:v52];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v54 = (void *)[v53 copy];
    [a1 setLoggedAbExperiment:v54];
  }
  if (a3) {
    v55 = @"abAssignInfo";
  }
  else {
    v55 = @"ab_assign_info";
  }
  v56 = [v5 objectForKeyedSubscript:v55];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v57 = [GEOAbAssignInfo alloc];
    if (a3) {
      uint64_t v58 = [(GEOAbAssignInfo *)v57 initWithJSON:v56];
    }
    else {
      uint64_t v58 = [(GEOAbAssignInfo *)v57 initWithDictionary:v56];
    }
    id v59 = (void *)v58;
    [a1 setAbAssignInfo:v58];
  }
  if (a3) {
    v60 = @"requestTime";
  }
  else {
    v60 = @"request_time";
  }
  v61 = [v5 objectForKeyedSubscript:v60];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v62 = [GEOLocalTime alloc];
    if (a3) {
      uint64_t v63 = [(GEOLocalTime *)v62 initWithJSON:v61];
    }
    else {
      uint64_t v63 = [(GEOLocalTime *)v62 initWithDictionary:v61];
    }
    v64 = (void *)v63;
    [a1 setRequestTime:v63];
  }
  if (a3) {
    v65 = @"relativeTimestamp";
  }
  else {
    v65 = @"relative_timestamp";
  }
  v66 = [v5 objectForKeyedSubscript:v65];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v66 doubleValue];
    objc_msgSend(a1, "setRelativeTimestamp:");
  }

  if (a3) {
    id v67 = @"isSiriOriginalRequest";
  }
  else {
    id v67 = @"is_siri_original_request";
  }
  long long v68 = [v5 objectForKeyedSubscript:v67];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsSiriOriginalRequest:", objc_msgSend(v68, "BOOLValue"));
  }

  if (a3) {
    long long v69 = @"routeStopCount";
  }
  else {
    long long v69 = @"route_stop_count";
  }
  long long v70 = [v5 objectForKeyedSubscript:v69];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRouteStopCount:", objc_msgSend(v70, "unsignedIntValue"));
  }

LABEL_174:
  return a1;
}

- (GEOPDAnalyticMetadata)initWithJSON:(id)a3
{
  return (GEOPDAnalyticMetadata *)-[GEOPDAnalyticMetadata _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAnalyticMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAnalyticMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOPDAnalyticMetadata *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 34) = self->_readerMarkPos;
  *((_DWORD *)v12 + 35) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_appIdentifier) {
    objc_msgSend(v12, "setAppIdentifier:");
  }
  if (self->_appMajorVersion) {
    objc_msgSend(v12, "setAppMajorVersion:");
  }
  int v4 = v12;
  if (self->_appMinorVersion)
  {
    objc_msgSend(v12, "setAppMinorVersion:");
    int v4 = v12;
  }
  if (self->_hardwareModel)
  {
    objc_msgSend(v12, "setHardwareModel:");
    int v4 = v12;
  }
  if (self->_hardwareClass)
  {
    objc_msgSend(v12, "setHardwareClass:");
    int v4 = v12;
  }
  if (self->_osVersion)
  {
    objc_msgSend(v12, "setOsVersion:");
    int v4 = v12;
  }
  $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    *((unsigned char *)v4 + 162) = self->_isInternalTool;
    *((_DWORD *)v4 + 41) |= 0x80u;
    $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x40) == 0)
    {
LABEL_15:
      if ((*(unsigned char *)&flags & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&flags & 0x40) == 0)
  {
    goto LABEL_15;
  }
  *((unsigned char *)v4 + 161) = self->_isInternalInstall;
  *((_DWORD *)v4 + 41) |= 0x40u;
  $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
  if ((*(unsigned char *)&flags & 1) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(GEOSessionID *)(v4 + 3) = self->_sessionId;
  *((_DWORD *)v4 + 41) |= 1u;
  $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_18;
    }
LABEL_43:
    *((_DWORD *)v4 + 37) = self->_requestSource;
    *((_DWORD *)v4 + 41) |= 4u;
    if ((*(_DWORD *)&self->_flags & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_42:
  *((_DWORD *)v4 + 39) = self->_sequenceNumber;
  *((_DWORD *)v4 + 41) |= 0x10u;
  $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0) {
    goto LABEL_43;
  }
LABEL_18:
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
LABEL_19:
    *((unsigned char *)v4 + 160) = self->_isFromApi;
    *((_DWORD *)v4 + 41) |= 0x20u;
  }
LABEL_20:
  if ([(GEOPDAnalyticMetadata *)self serviceTagsCount])
  {
    [v12 clearServiceTags];
    unint64_t v6 = [(GEOPDAnalyticMetadata *)self serviceTagsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(GEOPDAnalyticMetadata *)self serviceTagAtIndex:i];
        [v12 addServiceTag:v9];
      }
    }
  }
  if (self->_productName) {
    objc_msgSend(v12, "setProductName:");
  }
  id v10 = v12;
  if (self->_loggedAbExperiment)
  {
    objc_msgSend(v12, "setLoggedAbExperiment:");
    id v10 = v12;
  }
  if (self->_abAssignInfo)
  {
    objc_msgSend(v12, "setAbAssignInfo:");
    id v10 = v12;
  }
  if (self->_requestTime)
  {
    objc_msgSend(v12, "setRequestTime:");
    id v10 = v12;
  }
  $925BF102989D38BAF07877F8029BF610 v11 = self->_flags;
  if ((*(unsigned char *)&v11 & 2) != 0)
  {
    v10[14] = *(id *)&self->_relativeTimestamp;
    *((_DWORD *)v10 + 41) |= 2u;
    $925BF102989D38BAF07877F8029BF610 v11 = self->_flags;
    if ((*(_WORD *)&v11 & 0x100) == 0)
    {
LABEL_34:
      if ((*(unsigned char *)&v11 & 8) == 0) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&v11 & 0x100) == 0)
  {
    goto LABEL_34;
  }
  *((unsigned char *)v10 + 163) = self->_isSiriOriginalRequest;
  *((_DWORD *)v10 + 41) |= 0x100u;
  if ((*(_DWORD *)&self->_flags & 8) != 0)
  {
LABEL_35:
    *((_DWORD *)v10 + 38) = self->_routeStopCount;
    *((_DWORD *)v10 + 41) |= 8u;
  }
LABEL_36:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDAnalyticMetadata *)self readAll:0];
    uint64_t v9 = [(NSString *)self->_appIdentifier copyWithZone:a3];
    id v10 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v9;

    uint64_t v11 = [(NSString *)self->_appMajorVersion copyWithZone:a3];
    uint64_t v12 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v11;

    uint64_t v13 = [(NSString *)self->_appMinorVersion copyWithZone:a3];
    long long v14 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v13;

    uint64_t v15 = [(NSString *)self->_hardwareModel copyWithZone:a3];
    long long v16 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v15;

    uint64_t v17 = [(NSString *)self->_hardwareClass copyWithZone:a3];
    uint64_t v18 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v17;

    uint64_t v19 = [(NSString *)self->_osVersion copyWithZone:a3];
    uint64_t v20 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v19;

    $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x80) != 0)
    {
      *(unsigned char *)(v5 + 162) = self->_isInternalTool;
      *(_DWORD *)(v5 + 164) |= 0x80u;
      $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
      if ((*(unsigned char *)&flags & 0x40) == 0)
      {
LABEL_7:
        if ((*(unsigned char *)&flags & 1) == 0) {
          goto LABEL_8;
        }
        goto LABEL_27;
      }
    }
    else if ((*(unsigned char *)&flags & 0x40) == 0)
    {
      goto LABEL_7;
    }
    *(unsigned char *)(v5 + 161) = self->_isInternalInstall;
    *(_DWORD *)(v5 + 164) |= 0x40u;
    $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_8:
      if ((*(unsigned char *)&flags & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_28;
    }
LABEL_27:
    *(GEOSessionID *)(v5 + 24) = self->_sessionId;
    *(_DWORD *)(v5 + 164) |= 1u;
    $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x10) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_29;
    }
LABEL_28:
    *(_DWORD *)(v5 + 156) = self->_sequenceNumber;
    *(_DWORD *)(v5 + 164) |= 0x10u;
    $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) == 0)
    {
LABEL_10:
      if ((*(unsigned char *)&flags & 0x20) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
LABEL_29:
    *(_DWORD *)(v5 + 148) = self->_requestSource;
    *(_DWORD *)(v5 + 164) |= 4u;
    if ((*(_DWORD *)&self->_flags & 0x20) == 0)
    {
LABEL_12:
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v22 = self->_serviceTags;
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v39 != v24) {
              objc_enumerationMutation(v22);
            }
            v26 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "copyWithZone:", a3, (void)v38);
            [(id)v5 addServiceTag:v26];
          }
          uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v23);
      }

      uint64_t v27 = [(NSString *)self->_productName copyWithZone:a3];
      v28 = *(void **)(v5 + 104);
      *(void *)(v5 + 104) = v27;

      uint64_t v29 = [(NSString *)self->_loggedAbExperiment copyWithZone:a3];
      v30 = *(void **)(v5 + 88);
      *(void *)(v5 + 88) = v29;

      id v31 = [(GEOAbAssignInfo *)self->_abAssignInfo copyWithZone:a3];
      v32 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v31;

      id v33 = [(GEOLocalTime *)self->_requestTime copyWithZone:a3];
      id v34 = *(void **)(v5 + 120);
      *(void *)(v5 + 120) = v33;

      $925BF102989D38BAF07877F8029BF610 v35 = self->_flags;
      if ((*(unsigned char *)&v35 & 2) != 0)
      {
        *(double *)(v5 + 112) = self->_relativeTimestamp;
        *(_DWORD *)(v5 + 164) |= 2u;
        $925BF102989D38BAF07877F8029BF610 v35 = self->_flags;
        if ((*(_WORD *)&v35 & 0x100) == 0)
        {
LABEL_21:
          if ((*(unsigned char *)&v35 & 8) == 0)
          {
LABEL_23:
            v36 = self->_unknownFields;
            id v8 = *(id *)(v5 + 16);
            *(void *)(v5 + 16) = v36;
            goto LABEL_24;
          }
LABEL_22:
          *(_DWORD *)(v5 + 152) = self->_routeStopCount;
          *(_DWORD *)(v5 + 164) |= 8u;
          goto LABEL_23;
        }
      }
      else if ((*(_WORD *)&v35 & 0x100) == 0)
      {
        goto LABEL_21;
      }
      *(unsigned char *)(v5 + 163) = self->_isSiriOriginalRequest;
      *(_DWORD *)(v5 + 164) |= 0x100u;
      if ((*(_DWORD *)&self->_flags & 8) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
LABEL_11:
    *(unsigned char *)(v5 + 160) = self->_isFromApi;
    *(_DWORD *)(v5 + 164) |= 0x20u;
    goto LABEL_12;
  }
  unint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*((unsigned char *)&self->_flags + 2) & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDAnalyticMetadataReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_24:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_85;
  }
  [(GEOPDAnalyticMetadata *)self readAll:1];
  [v4 readAll:1];
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](appIdentifier, "isEqual:")) {
      goto LABEL_85;
    }
  }
  appMajorVersion = self->_appMajorVersion;
  if ((unint64_t)appMajorVersion | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](appMajorVersion, "isEqual:")) {
      goto LABEL_85;
    }
  }
  appMinorVersion = self->_appMinorVersion;
  if ((unint64_t)appMinorVersion | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](appMinorVersion, "isEqual:")) {
      goto LABEL_85;
    }
  }
  hardwareModel = self->_hardwareModel;
  if ((unint64_t)hardwareModel | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](hardwareModel, "isEqual:")) {
      goto LABEL_85;
    }
  }
  hardwareClass = self->_hardwareClass;
  if ((unint64_t)hardwareClass | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](hardwareClass, "isEqual:")) {
      goto LABEL_85;
    }
  }
  osVersion = self->_osVersion;
  if ((unint64_t)osVersion | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](osVersion, "isEqual:")) {
      goto LABEL_85;
    }
  }
  $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
  int v12 = *((_DWORD *)v4 + 41);
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0) {
      goto LABEL_85;
    }
    if (self->_isInternalTool)
    {
      if (!*((unsigned char *)v4 + 162)) {
        goto LABEL_85;
      }
    }
    else if (*((unsigned char *)v4 + 162))
    {
      goto LABEL_85;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_85;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0) {
      goto LABEL_85;
    }
    if (self->_isInternalInstall)
    {
      if (!*((unsigned char *)v4 + 161)) {
        goto LABEL_85;
      }
    }
    else if (*((unsigned char *)v4 + 161))
    {
      goto LABEL_85;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_85;
  }
  if (*(unsigned char *)&flags & 1) != 0 && (v12)
  {
    if (self->_sessionId._high != *((void *)v4 + 3) || self->_sessionId._low != *((void *)v4 + 4)) {
      goto LABEL_85;
    }
  }
  else if ((*(_DWORD *)&flags | v12))
  {
    goto LABEL_85;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 39)) {
      goto LABEL_85;
    }
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_85;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_requestSource != *((_DWORD *)v4 + 37)) {
      goto LABEL_85;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_85;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0) {
      goto LABEL_85;
    }
    if (self->_isFromApi)
    {
      if (!*((unsigned char *)v4 + 160)) {
        goto LABEL_85;
      }
    }
    else if (*((unsigned char *)v4 + 160))
    {
      goto LABEL_85;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_85;
  }
  serviceTags = self->_serviceTags;
  if ((unint64_t)serviceTags | *((void *)v4 + 16)
    && !-[NSMutableArray isEqual:](serviceTags, "isEqual:"))
  {
    goto LABEL_85;
  }
  productName = self->_productName;
  if ((unint64_t)productName | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](productName, "isEqual:")) {
      goto LABEL_85;
    }
  }
  loggedAbExperiment = self->_loggedAbExperiment;
  if ((unint64_t)loggedAbExperiment | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](loggedAbExperiment, "isEqual:")) {
      goto LABEL_85;
    }
  }
  abAssignInfo = self->_abAssignInfo;
  if ((unint64_t)abAssignInfo | *((void *)v4 + 5))
  {
    if (!-[GEOAbAssignInfo isEqual:](abAssignInfo, "isEqual:")) {
      goto LABEL_85;
    }
  }
  requestTime = self->_requestTime;
  if ((unint64_t)requestTime | *((void *)v4 + 15))
  {
    if (!-[GEOLocalTime isEqual:](requestTime, "isEqual:")) {
      goto LABEL_85;
    }
  }
  $925BF102989D38BAF07877F8029BF610 v19 = self->_flags;
  int v20 = *((_DWORD *)v4 + 41);
  if ((*(unsigned char *)&v19 & 2) != 0)
  {
    if ((v20 & 2) == 0 || self->_relativeTimestamp != *((double *)v4 + 14)) {
      goto LABEL_85;
    }
  }
  else if ((v20 & 2) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_WORD *)&v19 & 0x100) != 0)
  {
    if ((v20 & 0x100) != 0)
    {
      if (self->_isSiriOriginalRequest)
      {
        if (!*((unsigned char *)v4 + 163)) {
          goto LABEL_85;
        }
        goto LABEL_80;
      }
      if (!*((unsigned char *)v4 + 163)) {
        goto LABEL_80;
      }
    }
LABEL_85:
    BOOL v21 = 0;
    goto LABEL_86;
  }
  if ((v20 & 0x100) != 0) {
    goto LABEL_85;
  }
LABEL_80:
  if ((*(unsigned char *)&v19 & 8) != 0)
  {
    if ((v20 & 8) == 0 || self->_routeStopCount != *((_DWORD *)v4 + 38)) {
      goto LABEL_85;
    }
    BOOL v21 = 1;
  }
  else
  {
    BOOL v21 = (*((_DWORD *)v4 + 41) & 8) == 0;
  }
LABEL_86:

  return v21;
}

- (unint64_t)hash
{
  [(GEOPDAnalyticMetadata *)self readAll:1];
  NSUInteger v30 = [(NSString *)self->_appIdentifier hash];
  NSUInteger v29 = [(NSString *)self->_appMajorVersion hash];
  NSUInteger v28 = [(NSString *)self->_appMinorVersion hash];
  NSUInteger v27 = [(NSString *)self->_hardwareModel hash];
  NSUInteger v26 = [(NSString *)self->_hardwareClass hash];
  NSUInteger v25 = [(NSString *)self->_osVersion hash];
  $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    uint64_t v24 = 2654435761 * self->_isInternalTool;
    if ((*(unsigned char *)&flags & 0x40) != 0)
    {
LABEL_3:
      uint64_t v23 = 2654435761 * self->_isInternalInstall;
      if (*(unsigned char *)&flags) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v24 = 0;
    if ((*(unsigned char *)&flags & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v23 = 0;
  if (*(unsigned char *)&flags)
  {
LABEL_4:
    uint64_t v22 = PBHashBytes();
    $925BF102989D38BAF07877F8029BF610 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v22 = 0;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
LABEL_5:
    uint64_t v20 = 2654435761 * self->_sequenceNumber;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&flags & 4) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v4 = 2654435761 * self->_requestSource;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
LABEL_7:
    uint64_t v5 = 2654435761 * self->_isFromApi;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
LABEL_14:
  uint64_t v6 = [(NSMutableArray *)self->_serviceTags hash];
  NSUInteger v7 = [(NSString *)self->_productName hash];
  NSUInteger v8 = [(NSString *)self->_loggedAbExperiment hash];
  unint64_t v9 = [(GEOAbAssignInfo *)self->_abAssignInfo hash];
  unint64_t v10 = [(GEOLocalTime *)self->_requestTime hash];
  $925BF102989D38BAF07877F8029BF610 v11 = self->_flags;
  if ((*(unsigned char *)&v11 & 2) != 0)
  {
    double relativeTimestamp = self->_relativeTimestamp;
    double v14 = -relativeTimestamp;
    if (relativeTimestamp >= 0.0) {
      double v14 = self->_relativeTimestamp;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    uint64_t v17 = 2654435761 * self->_isSiriOriginalRequest;
    if ((*(unsigned char *)&v11 & 8) != 0) {
      goto LABEL_24;
    }
LABEL_26:
    uint64_t v18 = 0;
    return v29 ^ v30 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v17 ^ v18;
  }
  uint64_t v17 = 0;
  if ((*(unsigned char *)&v11 & 8) == 0) {
    goto LABEL_26;
  }
LABEL_24:
  uint64_t v18 = 2654435761 * self->_routeStopCount;
  return v29 ^ v30 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (char *)a3;
  [v4 readAll:0];
  if (*((void *)v4 + 6)) {
    -[GEOPDAnalyticMetadata setAppIdentifier:](self, "setAppIdentifier:");
  }
  if (*((void *)v4 + 7)) {
    -[GEOPDAnalyticMetadata setAppMajorVersion:](self, "setAppMajorVersion:");
  }
  if (*((void *)v4 + 8)) {
    -[GEOPDAnalyticMetadata setAppMinorVersion:](self, "setAppMinorVersion:");
  }
  if (*((void *)v4 + 10)) {
    -[GEOPDAnalyticMetadata setHardwareModel:](self, "setHardwareModel:");
  }
  if (*((void *)v4 + 9)) {
    -[GEOPDAnalyticMetadata setHardwareClass:](self, "setHardwareClass:");
  }
  if (*((void *)v4 + 12)) {
    -[GEOPDAnalyticMetadata setOsVersion:](self, "setOsVersion:");
  }
  int v5 = *((_DWORD *)v4 + 41);
  if ((v5 & 0x80) != 0)
  {
    self->_isInternalTool = v4[162];
    *(_DWORD *)&self->_flags |= 0x80u;
    int v5 = *((_DWORD *)v4 + 41);
    if ((v5 & 0x40) == 0)
    {
LABEL_15:
      if ((v5 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_36;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_15;
  }
  self->_isInternalInstall = v4[161];
  *(_DWORD *)&self->_flags |= 0x40u;
  int v5 = *((_DWORD *)v4 + 41);
  if ((v5 & 1) == 0)
  {
LABEL_16:
    if ((v5 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_sessionId = *(GEOSessionID *)(v4 + 24);
  *(_DWORD *)&self->_flags |= 1u;
  int v5 = *((_DWORD *)v4 + 41);
  if ((v5 & 0x10) == 0)
  {
LABEL_17:
    if ((v5 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_sequenceNumber = *((_DWORD *)v4 + 39);
  *(_DWORD *)&self->_flags |= 0x10u;
  int v5 = *((_DWORD *)v4 + 41);
  if ((v5 & 4) == 0)
  {
LABEL_18:
    if ((v5 & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_38:
  self->_requestSource = *((_DWORD *)v4 + 37);
  *(_DWORD *)&self->_flags |= 4u;
  if ((*((_DWORD *)v4 + 41) & 0x20) != 0)
  {
LABEL_19:
    self->_isFromApuint64_t i = v4[160];
    *(_DWORD *)&self->_flags |= 0x20u;
  }
LABEL_20:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = *((id *)v4 + 16);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOPDAnalyticMetadata addServiceTag:](self, "addServiceTag:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if (*((void *)v4 + 13)) {
    -[GEOPDAnalyticMetadata setProductName:](self, "setProductName:");
  }
  if (*((void *)v4 + 11)) {
    -[GEOPDAnalyticMetadata setLoggedAbExperiment:](self, "setLoggedAbExperiment:");
  }
  abAssignInfo = self->_abAssignInfo;
  uint64_t v12 = *((void *)v4 + 5);
  if (abAssignInfo)
  {
    if (v12) {
      -[GEOAbAssignInfo mergeFrom:](abAssignInfo, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[GEOPDAnalyticMetadata setAbAssignInfo:](self, "setAbAssignInfo:");
  }
  requestTime = self->_requestTime;
  uint64_t v14 = *((void *)v4 + 15);
  if (requestTime)
  {
    if (v14) {
      -[GEOLocalTime mergeFrom:](requestTime, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[GEOPDAnalyticMetadata setRequestTime:](self, "setRequestTime:");
  }
  int v15 = *((_DWORD *)v4 + 41);
  if ((v15 & 2) == 0)
  {
    if ((v15 & 0x100) == 0) {
      goto LABEL_49;
    }
LABEL_53:
    self->_isSiriOriginalRequest = v4[163];
    *(_DWORD *)&self->_flags |= 0x100u;
    if ((*((_DWORD *)v4 + 41) & 8) == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  self->_double relativeTimestamp = *((double *)v4 + 14);
  *(_DWORD *)&self->_flags |= 2u;
  int v15 = *((_DWORD *)v4 + 41);
  if ((v15 & 0x100) != 0) {
    goto LABEL_53;
  }
LABEL_49:
  if ((v15 & 8) != 0)
  {
LABEL_50:
    self->_routeStopCount = *((_DWORD *)v4 + 38);
    *(_DWORD *)&self->_flags |= 8u;
  }
LABEL_51:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 1) & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      int v5 = reader;
      objc_sync_enter(v5);
      GEOPDAnalyticMetadataReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_9);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200200u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDAnalyticMetadata *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_serviceTags;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(GEOAbAssignInfo *)self->_abAssignInfo clearUnknownFields:1];
    [(GEOLocalTime *)self->_requestTime clearUnknownFields:1];
  }
}

uint64_t __57__GEOPDAnalyticMetadata_PlaceDataExtras__initWithTraits___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  objc_msgSend(*(id *)(a1 + 32), "setSessionId:", a2, a3);
  [*(id *)(a1 + 32) setRelativeTimestamp:a7];
  uint64_t v10 = *(void **)(a1 + 32);

  return [v10 setSequenceNumber:a4];
}

@end