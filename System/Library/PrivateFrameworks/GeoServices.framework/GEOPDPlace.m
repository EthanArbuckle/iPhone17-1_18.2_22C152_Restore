@interface GEOPDPlace
+ (BOOL)isValid:(id)a3;
+ (Class)abExpBranchIdType;
+ (Class)componentType;
+ (id)attributionForPlaceData:(id)a3 type:(int)a4;
+ (id)componentTypesFromComponentInfos:(id)a3;
+ (id)failedPlaceData;
+ (id)failedPlaceDataForMuid:(unint64_t)a3;
- (BOOL)_isKey:(id)a3 subsetOf:(id)a4;
- (BOOL)hasBrandMUID;
- (BOOL)hasCreatedTime;
- (BOOL)hasExpectedComponentTypes:(id)a3;
- (BOOL)hasExpiredComponentsAsOf:(double)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsPartiallyClientizedSearchResult;
- (BOOL)hasMapDisplayType;
- (BOOL)hasMapsId;
- (BOOL)hasMuid;
- (BOOL)hasNilPlace;
- (BOOL)hasPlaceCacheKey;
- (BOOL)hasPlaceLayoutData;
- (BOOL)hasPreferredMuid;
- (BOOL)hasRapFlowType;
- (BOOL)hasReferenceFrame;
- (BOOL)hasRequestData;
- (BOOL)hasResultProviderId;
- (BOOL)hasStatus;
- (BOOL)hasUpdateVersion;
- (BOOL)isCacheable;
- (BOOL)isDisputed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPartiallyClientizedSearchResult;
- (BOOL)isStandAloneBrand;
- (BOOL)meetsManifestVersioningForServiceVersion:(id)a3;
- (BOOL)nilPlace;
- (BOOL)phoneNumberOptsOutOfAds:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldCacheByIDForRequest:(id)a3;
- (BOOL)statusCodeIsValid;
- (GEOMapItemInitialRequestData)requestData;
- (GEOPDMapsIdentifier)mapsId;
- (GEOPDPlace)init;
- (GEOPDPlace)initWithData:(id)a3;
- (GEOPDPlace)initWithDictionary:(id)a3;
- (GEOPDPlace)initWithJSON:(id)a3;
- (GEOPDPlacecardLayoutData)placeLayoutData;
- (NSMutableArray)abExpBranchIds;
- (NSMutableArray)components;
- (NSString)placeCacheKey;
- (PBUnknownFields)unknownFields;
- (double)firstSeenTimestamp;
- (id)_cleanedPhoneNumberForPhoneNumberRepresentation:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_entityName;
- (id)abExpBranchIdAtIndex:(unint64_t)a3;
- (id)bestName;
- (id)businessURL;
- (id)cacheKey;
- (id)calculateMissingComponentTypes:(id)a3;
- (id)compactDebugDescription;
- (id)componentAtIndex:(unint64_t)a3;
- (id)componentOfType:(int)a3 options:(unint64_t)a4;
- (id)copyWithStrippedOptionalData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWithoutETAComponents;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entityComponent;
- (id)geoMapItem;
- (id)geoMapItemWithDetourInfo:(id)a3;
- (id)jsonRepresentation;
- (id)mapDisplayTypeAsString:(int)a3;
- (id)pdPlaceCacheKeyForRequest:(id)a3;
- (id)phoneNumbers;
- (id)rapFlowTypeAsString:(int)a3;
- (id)referenceFrameAsString:(int)a3;
- (id)secondaryName;
- (id)secondarySpokenName;
- (id)spokenNameForLocale:(id)a3;
- (id)statusAsString:(int)a3;
- (id)successfulComponentWithValuesOfType:(int)a3;
- (int)StringAsMapDisplayType:(id)a3;
- (int)StringAsRapFlowType:(id)a3;
- (int)StringAsReferenceFrame:(id)a3;
- (int)StringAsStatus:(id)a3;
- (int)mapDisplayType;
- (int)placeDisplayType;
- (int)rapFlowType;
- (int)referenceFrame;
- (int)resultProviderId;
- (int)status;
- (unint64_t)abExpBranchIdsCount;
- (unint64_t)brandMUID;
- (unint64_t)componentsCount;
- (unint64_t)createdTime;
- (unint64_t)hash;
- (unint64_t)muid;
- (unint64_t)preferredMuid;
- (unint64_t)updateVersion;
- (unsigned)minTTL;
- (void)_addNoFlagsAbExpBranchId:(uint64_t)a1;
- (void)_addNoFlagsComponent:(uint64_t)a1;
- (void)_initWithDictionary:(id)a3 isJSON:;
- (void)_readAbExpBranchIds;
- (void)_readComponents;
- (void)_readMapsId;
- (void)_readPlaceCacheKey;
- (void)_readPlaceLayoutData;
- (void)_readRequestData;
- (void)_removeETAComponents;
- (void)addAbExpBranchId:(id)a3;
- (void)addComponent:(id)a3;
- (void)clearAbExpBranchIds;
- (void)clearComponents;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)enumerateComponentOfType:(int)a3 enumerationOptions:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateComponentValuesOfType:(int)a3 enumerationOptions:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateComponentsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateValidComponentValuesOfType:(int)a3 usingBlock:(id)a4;
- (void)enumerateValidComponentWithValuesOfType:(int)a3 usingBlock:(id)a4;
- (void)enumerateValidComponentsWithValuesUsingBlock:(id)a3;
- (void)forceUncacheable;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbExpBranchIds:(id)a3;
- (void)setComponents:(id)a3;
- (void)setCreatedTime:(unint64_t)a3;
- (void)setFirstSeenTimestamp:(double)a3;
- (void)setHasCreatedTime:(BOOL)a3;
- (void)setHasIsPartiallyClientizedSearchResult:(BOOL)a3;
- (void)setHasMapDisplayType:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasNilPlace:(BOOL)a3;
- (void)setHasPreferredMuid:(BOOL)a3;
- (void)setHasRapFlowType:(BOOL)a3;
- (void)setHasReferenceFrame:(BOOL)a3;
- (void)setHasResultProviderId:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasUpdateVersion:(BOOL)a3;
- (void)setIsPartiallyClientizedSearchResult:(BOOL)a3;
- (void)setMapDisplayType:(int)a3;
- (void)setMapsId:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setNilPlace:(BOOL)a3;
- (void)setPlaceCacheKey:(id)a3;
- (void)setPlaceLayoutData:(id)a3;
- (void)setPreferredMuid:(unint64_t)a3;
- (void)setRapFlowType:(int)a3;
- (void)setReferenceFrame:(int)a3;
- (void)setRequestData:(id)a3;
- (void)setResultProviderId:(int)a3;
- (void)setStatus:(int)a3;
- (void)setUpdateVersion:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlace

- (BOOL)hasResultProviderId
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (int)resultProviderId
{
  return self->_resultProviderId;
}

- (void)enumerateValidComponentValuesOfType:(int)a3 usingBlock:(id)a4
{
}

- (void)enumerateComponentValuesOfType:(int)a3 enumerationOptions:(unint64_t)a4 usingBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__GEOPDPlace_PlaceDataExtras__enumerateComponentValuesOfType_enumerationOptions_usingBlock___block_invoke;
  v10[3] = &unk_1E53E17B8;
  id v11 = v8;
  id v9 = v8;
  [(GEOPDPlace *)self enumerateComponentOfType:v6 enumerationOptions:a4 usingBlock:v10];
}

- (void)enumerateComponentOfType:(int)a3 enumerationOptions:(unint64_t)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__GEOPDPlace_PlaceDataExtras__enumerateComponentOfType_enumerationOptions_usingBlock___block_invoke;
  v10[3] = &unk_1E53E1790;
  int v12 = a3;
  id v11 = v8;
  id v9 = v8;
  [(GEOPDPlace *)self enumerateComponentsWithOptions:a4 usingBlock:v10];
}

- (GEOPDPlace)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlace;
  v2 = [(GEOPDPlace *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

void __47__GEOPDPlace_PlaceDataExtras__placeDisplayType__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  -[GEOPDComponentValue entity](a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v5 placeDisplayType];
  *a3 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != 0;
}

- (int)placeDisplayType
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__GEOPDPlace_PlaceDataExtras__placeDisplayType__block_invoke;
  v4[3] = &unk_1E53E16F0;
  v4[4] = &v5;
  [(GEOPDPlace *)self enumerateValidComponentValuesOfType:1 usingBlock:v4];
  if (*((_DWORD *)v6 + 6) >= 6u) {
    int v2 = 0;
  }
  else {
    int v2 = *((_DWORD *)v6 + 6);
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)enumerateComponentsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v6 = (void (**)(id, uint64_t, char *))a4;
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [(GEOPDPlace *)self components];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
      if (((v4 & 1) == 0 || [*(id *)(*((void *)&v13 + 1) + 8 * v11) statusCodeIsValid])
        && ((v4 & 2) == 0 || v12 && [*(id *)(v12 + 48) count]))
      {
        v6[2](v6, v12, &v17);
        if (v17) {
          break;
        }
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __86__GEOPDPlace_PlaceDataExtras__enumerateComponentOfType_enumerationOptions_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = v3;
  if (v3 && (*((_WORD *)v3 + 50) & 0x80) != 0) {
    int v5 = *((_DWORD *)v3 + 22);
  }
  else {
    int v5 = 0;
  }
  if (v5 == *(_DWORD *)(a1 + 40))
  {
    id v6 = v3;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    char v4 = v6;
  }
}

- (NSMutableArray)components
{
  -[GEOPDPlace _readComponents]((uint64_t)self);
  components = self->_components;

  return components;
}

- (void)_readComponents
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 141) & 0x20) == 0)
    {
      int v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readComponents_tags_6973);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

void __92__GEOPDPlace_PlaceDataExtras__enumerateComponentValuesOfType_enumerationOptions_usingBlock___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = -[GEOPDComponent values](a2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
      if (*a3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)hasMuid
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)componentOfType:(int)a3 options:(unint64_t)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__37;
  long long v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__GEOPDPlace_PlaceDataExtras__componentOfType_options___block_invoke;
  v6[3] = &unk_1E53E1740;
  v6[4] = &v7;
  [(GEOPDPlace *)self enumerateComponentOfType:*(void *)&a3 enumerationOptions:a4 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __55__GEOPDPlace_PlaceDataExtras__componentOfType_options___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (void)enumerateValidComponentWithValuesOfType:(int)a3 usingBlock:(id)a4
{
}

void __56__GEOPDPlace_PlaceDataExtras__hasExpiredComponentsAsOf___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  int v5 = [v9 hasTimestampFirstSeen];
  uint64_t v6 = v9;
  if (v9)
  {
    if (v5)
    {
      if ((*((_WORD *)v9 + 50) & 0x40) != 0)
      {
        if (*((_DWORD *)v9 + 21))
        {
          [v9 timestampFirstSeen];
          uint64_t v6 = v9;
          LODWORD(v7) = *((_DWORD *)v9 + 21);
          if (v8 + (double)v7 < *(double *)(a1 + 40))
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
            *a3 = 1;
          }
        }
      }
    }
  }
}

void __60__GEOPDPlace_PlaceDataExtras__attributionForPlaceData_type___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponent attribution](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (BOOL)hasMapsId
{
  return self->_mapsId != 0;
}

- (void)_readMapsId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 141) & 0x40) == 0)
    {
      int v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsId_tags_6974);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (GEOPDMapsIdentifier)mapsId
{
  -[GEOPDPlace _readMapsId]((uint64_t)self);
  mapsId = self->_mapsId;

  return mapsId;
}

- (BOOL)hasPreferredMuid
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPlaceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_40;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDPlace *)self readAll:0];
  $E293E9EAAB2B8016EDB279585BF8500E flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_7;
    }
LABEL_42:
    *(_DWORD *)(v5 + 132) = self->_status;
    *(_DWORD *)(v5 + 140) |= 0x100u;
    if ((*(_DWORD *)&self->_flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(void *)(v5 + 56) = self->_muid;
  *(_DWORD *)(v5 + 140) |= 2u;
  $E293E9EAAB2B8016EDB279585BF8500E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) != 0) {
    goto LABEL_42;
  }
LABEL_7:
  if ((*(unsigned char *)&flags & 4) != 0)
  {
LABEL_8:
    *(void *)(v5 + 80) = self->_preferredMuid;
    *(_DWORD *)(v5 + 140) |= 4u;
  }
LABEL_9:
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v10 = self->_components;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addComponent:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v11);
  }

  $E293E9EAAB2B8016EDB279585BF8500E v15 = self->_flags;
  if ((*(unsigned char *)&v15 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_resultProviderId;
    *(_DWORD *)(v5 + 140) |= 0x80u;
    $E293E9EAAB2B8016EDB279585BF8500E v15 = self->_flags;
  }
  if ((*(unsigned char *)&v15 & 8) != 0)
  {
    *(void *)(v5 + 96) = self->_updateVersion;
    *(_DWORD *)(v5 + 140) |= 8u;
  }
  id v16 = [(GEOPDMapsIdentifier *)self->_mapsId copyWithZone:a3];
  char v17 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v16;

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 40) = self->_createdTime;
    *(_DWORD *)(v5 + 140) |= 1u;
  }
  id v18 = [(GEOPDPlacecardLayoutData *)self->_placeLayoutData copyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v18;

  $E293E9EAAB2B8016EDB279585BF8500E v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x200) != 0)
  {
    *(unsigned char *)(v5 + 136) = self->_isPartiallyClientizedSearchResult;
    *(_DWORD *)(v5 + 140) |= 0x200u;
    $E293E9EAAB2B8016EDB279585BF8500E v20 = self->_flags;
  }
  if ((*(unsigned char *)&v20 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 116) = self->_mapDisplayType;
    *(_DWORD *)(v5 + 140) |= 0x10u;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v21 = self->_abExpBranchIds;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "copyWithZone:", a3, (void)v33);
        [(id)v5 addAbExpBranchId:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v22);
  }

  $E293E9EAAB2B8016EDB279585BF8500E v26 = self->_flags;
  if ((*(unsigned char *)&v26 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_rapFlowType;
    *(_DWORD *)(v5 + 140) |= 0x20u;
    $E293E9EAAB2B8016EDB279585BF8500E v26 = self->_flags;
  }
  if ((*(unsigned char *)&v26 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_referenceFrame;
    *(_DWORD *)(v5 + 140) |= 0x40u;
  }
  id v27 = -[GEOMapItemInitialRequestData copyWithZone:](self->_requestData, "copyWithZone:", a3, (void)v33);
  v28 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v27;

  uint64_t v29 = [(NSString *)self->_placeCacheKey copyWithZone:a3];
  v30 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v29;

  if ((*((unsigned char *)&self->_flags + 1) & 4) != 0)
  {
    *(unsigned char *)(v5 + 137) = self->_nilPlace;
    *(_DWORD *)(v5 + 140) |= 0x400u;
  }
  v31 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v31;
LABEL_40:

  return (id)v5;
}

- (void)addComponent:(id)a3
{
  id v4 = a3;
  -[GEOPDPlace _readComponents]((uint64_t)self);
  -[GEOPDPlace _addNoFlagsComponent:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
}

- (BOOL)hasExpiredComponentsAsOf:(double)a3
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__GEOPDPlace_PlaceDataExtras__hasExpiredComponentsAsOf___block_invoke;
  v5[3] = &unk_1E53E1830;
  *(double *)&v5[5] = a3;
  v5[4] = &v6;
  [(GEOPDPlace *)self enumerateComponentsWithOptions:1 usingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)meetsManifestVersioningForServiceVersion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = [(GEOPDPlace *)self components];
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * v8);
        if (!v9 || (*(_WORD *)(v9 + 100) & 0x20) == 0 || !*(_DWORD *)(v9 + 80))
        {
          long long v10 = -[GEOPDComponent versionDomains](*(id **)(*((void *)&v18 + 1) + 8 * v8));
          uint64_t v11 = -[GEOServiceVersion versionDomains](v4);
          BOOL v12 = [(GEOPDPlace *)self _isKey:v10 subsetOf:v11];

          BOOL v13 = !v9 || !v12;
          if (!v13
            && v4
            && (*(_WORD *)(v9 + 100) & 0x200) != 0
            && (*((unsigned char *)v4 + 28) & 1) != 0
            && *(_DWORD *)(v9 + 96) < *((_DWORD *)v4 + 6))
          {
            BOOL v15 = 0;
            goto LABEL_23;
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v14 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v6 = v14;
    }
    while (v14);
  }
  BOOL v15 = 1;
LABEL_23:

  return v15;
}

- (BOOL)_isKey:(id)a3 subsetOf:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    unint64_t v9 = [v6 count];
    if (v9 <= [v5 count])
    {
      if ([v7 count])
      {
        unint64_t v10 = 0;
        do
        {
          uint64_t v11 = [v7 objectAtIndexedSubscript:v10];
          BOOL v12 = [v5 objectAtIndexedSubscript:v10];
          uint64_t v13 = [v11 caseInsensitiveCompare:v12];
          BOOL v8 = v13 == 0;

          if (v13) {
            break;
          }
          ++v10;
        }
        while (v10 < [v7 count]);
      }
      else
      {
        BOOL v8 = 1;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)hasExpectedComponentTypes:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = (void *)MEMORY[0x1E4F1CA80];
    id v6 = [(GEOPDPlace *)self components];
    uint64_t v7 = objc_msgSend(v5, "setWithCapacity:", objc_msgSend(v6, "count"));

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    BOOL v8 = [(GEOPDPlace *)self components];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (v13 && (*(_WORD *)(v13 + 100) & 0x80) != 0) {
            uint64_t v14 = *(unsigned int *)(v13 + 88);
          }
          else {
            uint64_t v14 = 0;
          }
          BOOL v15 = [NSNumber numberWithInt:v14];
          [v7 addObject:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    char v16 = [v4 isSubsetOfSet:v7];
  }
  else
  {
    char v16 = 1;
  }

  return v16;
}

+ (id)componentTypesFromComponentInfos:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (v10 && (*(unsigned char *)(v10 + 44) & 4) != 0) {
          uint64_t v11 = *(unsigned int *)(v10 + 32);
        }
        else {
          uint64_t v11 = 0;
        }
        BOOL v12 = objc_msgSend(NSNumber, "numberWithInt:", v11, (void)v15);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v13 = (void *)[v4 copy];

  return v13;
}

- (void)_addNoFlagsComponent:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)enumerateValidComponentsWithValuesUsingBlock:(id)a3
{
}

void __42__GEOPDPlace_PlaceDataExtras___entityName__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  id v5 = -[GEOPDComponentValue entity](a2);
  id v9 = [v5 bestLocalizedName];

  uint64_t v6 = [v9 stringValue];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

+ (id)failedPlaceData
{
  return (id)[a1 failedPlaceDataForMuid:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_placeLayoutData, 0);
  objc_storeStrong((id *)&self->_placeCacheKey, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_abExpBranchIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)bestName
{
  id v3 = [(GEOPDPlace *)self _entityName];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    uint64_t v5 = +[GEOPDResultSnippet resultSnippetForPlaceData:self];
    uint64_t v6 = v5;
    if (v5 && (-[GEOPDResultSnippet _readName](v5), *(void *)(v6 + 56)))
    {
      -[GEOPDResultSnippet name]((id *)v6);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = +[GEOAddressObject addressObjectForPlaceData:self];
      id v4 = [v7 name];
    }
  }

  return v4;
}

- (id)_entityName
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__37;
  id v9 = __Block_byref_object_dispose__37;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__GEOPDPlace_PlaceDataExtras___entityName__block_invoke;
  v4[3] = &unk_1E53E16F0;
  v4[4] = &v5;
  [(GEOPDPlace *)self enumerateValidComponentValuesOfType:1 usingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (BOOL)statusCodeIsValid
{
  return ![(GEOPDPlace *)self status] || [(GEOPDPlace *)self status] == 2;
}

- (int)status
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $E293E9EAAB2B8016EDB279585BF8500E flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x100) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (BOOL)hasRequestData
{
  return self->_requestData != 0;
}

- (GEOMapItemInitialRequestData)requestData
{
  -[GEOPDPlace _readRequestData]((uint64_t)self);
  requestData = self->_requestData;

  return requestData;
}

- (void)_readRequestData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 142) & 2) == 0)
    {
      id v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (void)setRequestData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x60000u;
  objc_storeStrong((id *)&self->_requestData, a3);
}

- (void)setFirstSeenTimestamp:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(GEOPDPlace *)self components];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v9 hasTimestampFirstSeen] & 1) == 0) {
          [v9 setTimestampFirstSeen:a3];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setReferenceFrame:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x40040u;
  self->_referenceFrame = a3;
}

+ (id)attributionForPlaceData:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = __Block_byref_object_copy__37;
  long long v13 = __Block_byref_object_dispose__37;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__GEOPDPlace_PlaceDataExtras__attributionForPlaceData_type___block_invoke;
  v8[3] = &unk_1E53E1740;
  v8[4] = &v9;
  [v5 enumerateComponentOfType:v4 enumerationOptions:1 usingBlock:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (BOOL)hasReferenceFrame
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (int)referenceFrame
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $E293E9EAAB2B8016EDB279585BF8500E flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x40) != 0) {
    return self->_referenceFrame;
  }
  else {
    return 0;
  }
}

- (void)setNilPlace:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x40400u;
  self->_nilPlace = a3;
}

- (void)writeTo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceIsDirty((uint64_t)self) & 1) == 0)
  {
    long long v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    long long v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
    goto LABEL_50;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDPlace *)self readAll:0];
  $E293E9EAAB2B8016EDB279585BF8500E flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_5;
    }
LABEL_47:
    PBDataWriterWriteInt32Field();
    if ((*(_DWORD *)&self->_flags & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  PBDataWriterWriteUint64Field();
  $E293E9EAAB2B8016EDB279585BF8500E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) != 0) {
    goto LABEL_47;
  }
LABEL_5:
  if ((*(unsigned char *)&flags & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint64Field();
LABEL_7:
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = self->_components;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  $E293E9EAAB2B8016EDB279585BF8500E v11 = self->_flags;
  if ((*(unsigned char *)&v11 & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    $E293E9EAAB2B8016EDB279585BF8500E v11 = self->_flags;
  }
  if ((*(unsigned char *)&v11 & 8) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_mapsId) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_placeLayoutData) {
    PBDataWriterWriteSubmessage();
  }
  $E293E9EAAB2B8016EDB279585BF8500E v12 = self->_flags;
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    $E293E9EAAB2B8016EDB279585BF8500E v12 = self->_flags;
  }
  if ((*(unsigned char *)&v12 & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_abExpBranchIds;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteStringField();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v14);
  }

  $E293E9EAAB2B8016EDB279585BF8500E v17 = self->_flags;
  if ((*(unsigned char *)&v17 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    $E293E9EAAB2B8016EDB279585BF8500E v17 = self->_flags;
  }
  if ((*(unsigned char *)&v17 & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_requestData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_placeCacheKey) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_flags + 1) & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
LABEL_50:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_74;
  }
  [(GEOPDPlace *)self readAll:1];
  [v4 readAll:1];
  $E293E9EAAB2B8016EDB279585BF8500E flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 35);
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_muid != *((void *)v4 + 7)) {
      goto LABEL_74;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_status != *((_DWORD *)v4 + 33)) {
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_74;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_preferredMuid != *((void *)v4 + 10)) {
      goto LABEL_74;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_74;
  }
  components = self->_components;
  if ((unint64_t)components | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](components, "isEqual:")) {
      goto LABEL_74;
    }
    $E293E9EAAB2B8016EDB279585BF8500E flags = self->_flags;
    int v6 = *((_DWORD *)v4 + 35);
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_resultProviderId != *((_DWORD *)v4 + 32)) {
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_74;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_updateVersion != *((void *)v4 + 12)) {
      goto LABEL_74;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_74;
  }
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((void *)v4 + 6))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:")) {
      goto LABEL_74;
    }
    $E293E9EAAB2B8016EDB279585BF8500E flags = self->_flags;
    int v6 = *((_DWORD *)v4 + 35);
  }
  if (*(unsigned char *)&flags)
  {
    if ((v6 & 1) == 0 || self->_createdTime != *((void *)v4 + 5)) {
      goto LABEL_74;
    }
  }
  else if (v6)
  {
    goto LABEL_74;
  }
  placeLayoutData = self->_placeLayoutData;
  if ((unint64_t)placeLayoutData | *((void *)v4 + 9))
  {
    if (!-[GEOPDPlacecardLayoutData isEqual:](placeLayoutData, "isEqual:")) {
      goto LABEL_74;
    }
    $E293E9EAAB2B8016EDB279585BF8500E flags = self->_flags;
    int v6 = *((_DWORD *)v4 + 35);
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0) {
      goto LABEL_74;
    }
    if (self->_isPartiallyClientizedSearchResult)
    {
      if (!*((unsigned char *)v4 + 136)) {
        goto LABEL_74;
      }
    }
    else if (*((unsigned char *)v4 + 136))
    {
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_74;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_mapDisplayType != *((_DWORD *)v4 + 29)) {
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_74;
  }
  abExpBranchIds = self->_abExpBranchIds;
  if ((unint64_t)abExpBranchIds | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](abExpBranchIds, "isEqual:")) {
      goto LABEL_74;
    }
    $E293E9EAAB2B8016EDB279585BF8500E flags = self->_flags;
    int v6 = *((_DWORD *)v4 + 35);
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_rapFlowType != *((_DWORD *)v4 + 30)) {
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_74;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_referenceFrame != *((_DWORD *)v4 + 31)) {
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_74;
  }
  requestData = self->_requestData;
  if ((unint64_t)requestData | *((void *)v4 + 11)
    && !-[GEOMapItemInitialRequestData isEqual:](requestData, "isEqual:"))
  {
    goto LABEL_74;
  }
  placeCacheKey = self->_placeCacheKey;
  if ((unint64_t)placeCacheKey | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](placeCacheKey, "isEqual:")) {
      goto LABEL_74;
    }
  }
  if ((*((unsigned char *)&self->_flags + 1) & 4) != 0)
  {
    if ((*((_DWORD *)v4 + 35) & 0x400) != 0)
    {
      if (self->_nilPlace)
      {
        if (!*((unsigned char *)v4 + 137)) {
          goto LABEL_74;
        }
      }
      else if (*((unsigned char *)v4 + 137))
      {
        goto LABEL_74;
      }
      BOOL v13 = 1;
      goto LABEL_75;
    }
LABEL_74:
    BOOL v13 = 0;
    goto LABEL_75;
  }
  BOOL v13 = (*((_DWORD *)v4 + 35) & 0x400) == 0;
LABEL_75:

  return v13;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_7049;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_7050;
    }
    GEOPDPlaceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDPlaceCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (BOOL)isDisputed
{
  BOOL v3 = [(GEOPDPlace *)self componentOfType:1 options:3];
  id v4 = -[GEOPDComponent values](v3);
  id v5 = [v4 firstObject];
  int v6 = -[GEOPDComponentValue entity](v5);

  if ([v6 hasIsDisputed])
  {
    char v7 = [v6 isDisputed];
  }
  else
  {
    uint64_t v8 = [(GEOPDPlace *)self componentOfType:77 options:3];

    uint64_t v9 = -[GEOPDComponent values](v8);
    uint64_t v10 = [v9 firstObject];
    -[GEOPDComponentValue iso3166Code](v10);
    $E293E9EAAB2B8016EDB279585BF8500E v11 = (unsigned char *)objc_claimAutoreleasedReturnValue();

    char v7 = v11 && (v11[64] & 1) != 0 && v11[60] != 0;
    BOOL v3 = v8;
  }

  return v7;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceReadAllFrom((uint64_t)self, a3, 0);
}

+ (id)failedPlaceDataForMuid:(unint64_t)a3
{
  id v4 = objc_alloc_init(GEOPDPlace);
  [(GEOPDPlace *)v4 setMuid:a3];
  [(GEOPDPlace *)v4 setStatus:20];

  return v4;
}

- (void)setStatus:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x40100u;
  self->_status = a3;
}

- (void)setMuid:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x40002u;
  self->_muid = a3;
}

- (BOOL)isPartiallyClientizedSearchResult
{
  return self->_isPartiallyClientizedSearchResult;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40800u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDPlace *)self readAll:0];
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    char v7 = self->_components;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v82 objects:v94 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v83;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v83 != v10) {
            objc_enumerationMutation(v7);
          }
          -[GEOPDComponent clearUnknownFields:](*(void *)(*((void *)&v82 + 1) + 8 * v11++), 1);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v82 objects:v94 count:16];
      }
      while (v9);
    }

    [(GEOPDMapsIdentifier *)self->_mapsId clearUnknownFields:1];
    placeLayoutData = self->_placeLayoutData;
    if (placeLayoutData)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)&placeLayoutData->_flags |= 1u;
      *(unsigned char *)&placeLayoutData->_flags |= 8u;
      os_unfair_lock_unlock(&placeLayoutData->_readerLock);
      BOOL v13 = placeLayoutData->_unknownFields;
      placeLayoutData->_unknownFields = 0;

      -[GEOPDPlacecardLayoutData readAll:]((uint64_t)placeLayoutData, 0);
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      v76 = placeLayoutData;
      obuint64_t j = placeLayoutData->_moduleConfigurations;
      uint64_t v79 = [(NSMutableArray *)obj countByEnumeratingWithState:&v86 objects:v95 count:16];
      if (v79)
      {
        uint64_t v78 = *(void *)v87;
        uint64_t v14 = &OBJC_IVAR___GEOPDAddressComponent__unknownFields;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v87 != v78) {
              objc_enumerationMutation(obj);
            }
            uint64_t v80 = v15;
            uint64_t v16 = *(void *)(*((void *)&v86 + 1) + 8 * v15);
            if (v16)
            {
              $E293E9EAAB2B8016EDB279585BF8500E v17 = *(void **)(v16 + 8);
              *(void *)(v16 + 8) = 0;

              uint64_t v18 = *(void *)(v16 + 16);
              if (v18)
              {
                os_unfair_lock_lock_with_options();
                *(_WORD *)(v18 + 116) |= 1u;
                *(_WORD *)(v18 + 116) |= 0x800u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v18 + 112));
                long long v19 = *(void **)(v18 + 16);
                *(void *)(v18 + 16) = 0;

                -[GEOPDModuleConfigurationValue readAll:](v18, 0);
                uint64_t v20 = *(void *)(v18 + 72);
                uint64_t v81 = v18;
                if (v20)
                {
                  long long v21 = *(void **)(v20 + 8);
                  *(void *)(v20 + 8) = 0;

                  long long v92 = 0u;
                  long long v93 = 0u;
                  long long v90 = 0u;
                  long long v91 = 0u;
                  id v22 = *(id *)(v20 + 16);
                  uint64_t v23 = [v22 countByEnumeratingWithState:&v90 objects:v96 count:16];
                  if (v23)
                  {
                    uint64_t v24 = v23;
                    uint64_t v25 = *(void *)v91;
                    do
                    {
                      uint64_t v26 = 0;
                      do
                      {
                        if (*(void *)v91 != v25) {
                          objc_enumerationMutation(v22);
                        }
                        uint64_t v27 = *(void *)(*((void *)&v90 + 1) + 8 * v26);
                        if (v27)
                        {
                          os_unfair_lock_lock_with_options();
                          *(unsigned char *)(v27 + 56) |= 2u;
                          *(unsigned char *)(v27 + 56) |= 0x10u;
                          os_unfair_lock_unlock((os_unfair_lock_t)(v27 + 48));
                          v28 = *(void **)(v27 + 16);
                          *(void *)(v27 + 16) = 0;

                          -[GEOPDRibbonItem readAll:](v27, 0);
                          uint64_t v29 = *(void *)(v27 + 32);
                          if (v29)
                          {
                            uint64_t v30 = *(void **)(v29 + 8);
                            *(void *)(v29 + 8) = 0;
                          }
                          uint64_t v31 = *(void *)(v27 + 24);
                          if (v31)
                          {
                            v32 = *(void **)(v31 + 8);
                            *(void *)(v31 + 8) = 0;
                          }
                        }
                        ++v26;
                      }
                      while (v24 != v26);
                      uint64_t v24 = [v22 countByEnumeratingWithState:&v90 objects:v96 count:16];
                    }
                    while (v24);
                  }

                  uint64_t v14 = &OBJC_IVAR___GEOPDAddressComponent__unknownFields;
                  uint64_t v18 = v81;
                }
                uint64_t v33 = *(void *)(v18 + 32);
                if (v33)
                {
                  long long v34 = *(void **)(v33 + 8);
                  *(void *)(v33 + 8) = 0;

                  long long v92 = 0u;
                  long long v93 = 0u;
                  long long v90 = 0u;
                  long long v91 = 0u;
                  id v35 = *(id *)(v33 + 16);
                  uint64_t v36 = [v35 countByEnumeratingWithState:&v90 objects:v96 count:16];
                  if (v36)
                  {
                    uint64_t v37 = v36;
                    uint64_t v38 = *(void *)v91;
                    do
                    {
                      uint64_t v39 = 0;
                      do
                      {
                        if (*(void *)v91 != v38) {
                          objc_enumerationMutation(v35);
                        }
                        objc_msgSend(*(id *)(*((void *)&v90 + 1) + 8 * v39++), "clearUnknownFields:", 1, v76);
                      }
                      while (v37 != v39);
                      uint64_t v37 = [v35 countByEnumeratingWithState:&v90 objects:v96 count:16];
                    }
                    while (v37);
                  }

                  uint64_t v18 = v81;
                }
                uint64_t v40 = *(void *)(v18 + 64);
                if (v40)
                {
                  v41 = *(void **)(v40 + 8);
                  *(void *)(v40 + 8) = 0;

                  long long v92 = 0u;
                  long long v93 = 0u;
                  long long v90 = 0u;
                  long long v91 = 0u;
                  id v42 = *(id *)(v40 + 16);
                  uint64_t v43 = [v42 countByEnumeratingWithState:&v90 objects:v96 count:16];
                  if (v43)
                  {
                    uint64_t v44 = v43;
                    uint64_t v45 = *(void *)v91;
                    do
                    {
                      uint64_t v46 = 0;
                      do
                      {
                        if (*(void *)v91 != v45) {
                          objc_enumerationMutation(v42);
                        }
                        objc_msgSend(*(id *)(*((void *)&v90 + 1) + 8 * v46++), "clearUnknownFields:", 1, v76);
                      }
                      while (v44 != v46);
                      uint64_t v44 = [v42 countByEnumeratingWithState:&v90 objects:v96 count:16];
                    }
                    while (v44);
                  }

                  uint64_t v18 = v81;
                }
                uint64_t v47 = *(void *)(v18 + 96);
                if (v47)
                {
                  v48 = *(void **)(v47 + 8);
                  *(void *)(v47 + 8) = 0;
                }
                -[GEOPDTemplatePlaceModuleConfiguration clearUnknownFields:](*(void *)(v18 + 80));
                uint64_t v49 = *(void *)(v18 + 56);
                if (v49)
                {
                  os_unfair_lock_lock_with_options();
                  *(unsigned char *)(v49 + 56) |= 2u;
                  *(unsigned char *)(v49 + 56) |= 0x10u;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v49 + 48));
                  v50 = *(void **)(v49 + 16);
                  *(void *)(v49 + 16) = 0;

                  -[GEOPDPlaceInfosModuleConfiguration readAll:](v49, 0);
                  uint64_t v51 = *(void *)(v49 + 32);
                  if (v51)
                  {
                    v52 = *(void **)(v51 + 8);
                    *(void *)(v51 + 8) = 0;
                  }
                  uint64_t v53 = *(void *)(v49 + 24);
                  if (v53)
                  {
                    v54 = *(void **)(v53 + 8);
                    *(void *)(v53 + 8) = 0;

                    long long v92 = 0u;
                    long long v93 = 0u;
                    long long v90 = 0u;
                    long long v91 = 0u;
                    id v55 = *(id *)(v53 + 16);
                    uint64_t v56 = [v55 countByEnumeratingWithState:&v90 objects:v96 count:16];
                    if (v56)
                    {
                      uint64_t v57 = v56;
                      uint64_t v58 = *(void *)v91;
                      do
                      {
                        uint64_t v59 = 0;
                        do
                        {
                          if (*(void *)v91 != v58) {
                            objc_enumerationMutation(v55);
                          }
                          uint64_t v60 = *(void *)(*((void *)&v90 + 1) + 8 * v59);
                          if (v60)
                          {
                            uint64_t v61 = v14[450];
                            v62 = *(void **)(v60 + v61);
                            *(void *)(v60 + v61) = 0;
                          }
                          ++v59;
                        }
                        while (v57 != v59);
                        uint64_t v57 = [v55 countByEnumeratingWithState:&v90 objects:v96 count:16];
                      }
                      while (v57);
                    }

                    uint64_t v18 = v81;
                  }
                }
                uint64_t v63 = *(void *)(v18 + 24);
                if (v63)
                {
                  v64 = *(void **)(v63 + 8);
                  *(void *)(v63 + 8) = 0;
                }
                uint64_t v65 = *(void *)(v18 + 40);
                if (v65)
                {
                  v66 = *(void **)(v65 + 8);
                  *(void *)(v65 + 8) = 0;
                }
                uint64_t v67 = *(void *)(v18 + 88);
                if (v67)
                {
                  v68 = *(void **)(v67 + 8);
                  *(void *)(v67 + 8) = 0;

                  long long v92 = 0u;
                  long long v93 = 0u;
                  long long v90 = 0u;
                  long long v91 = 0u;
                  id v69 = *(id *)(v67 + 16);
                  uint64_t v70 = [v69 countByEnumeratingWithState:&v90 objects:v96 count:16];
                  if (v70)
                  {
                    uint64_t v71 = v70;
                    uint64_t v72 = *(void *)v91;
                    do
                    {
                      uint64_t v73 = 0;
                      do
                      {
                        if (*(void *)v91 != v72) {
                          objc_enumerationMutation(v69);
                        }
                        objc_msgSend(*(id *)(*((void *)&v90 + 1) + 8 * v73++), "clearUnknownFields:", 1, v76);
                      }
                      while (v71 != v73);
                      uint64_t v71 = [v69 countByEnumeratingWithState:&v90 objects:v96 count:16];
                    }
                    while (v71);
                  }

                  uint64_t v18 = v81;
                }
                uint64_t v74 = *(void *)(v18 + 48);
                if (v74)
                {
                  v75 = *(void **)(v74 + 8);
                  *(void *)(v74 + 8) = 0;

                  -[GEOPDTemplatePlaceModuleConfiguration clearUnknownFields:](*(void *)(v74 + 16));
                }
              }
            }
            uint64_t v15 = v80 + 1;
          }
          while (v80 + 1 != v79);
          uint64_t v79 = [(NSMutableArray *)obj countByEnumeratingWithState:&v86 objects:v95 count:16];
        }
        while (v79);
      }

      [(GEOPDPlacecardLayoutConfiguration *)v76->_layoutConfiguration clearUnknownFields:1];
    }
  }
}

- (GEOPDPlace)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlace;
  BOOL v3 = [(GEOPDPlace *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (id)referenceFrameAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v3 = off_1E53E3ED8[a3];
  }

  return v3;
}

- (int)StringAsReferenceFrame:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WGS84"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CHINA_SHIFTED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)minTTL
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![(GEOPDPlace *)self nilPlace])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v4 = [(GEOPDPlace *)self components];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v5)
    {
      unsigned int v3 = -1;
      goto LABEL_23;
    }
    uint64_t v6 = v5;
    unsigned int v3 = -1;
    uint64_t v7 = *(void *)v16;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (v9)
        {
          __int16 v10 = *(_WORD *)(v9 + 100);
          if ((v10 & 0x20) == 0)
          {
            if ((v10 & 2) == 0) {
              continue;
            }
LABEL_16:
            if (*(_DWORD *)(v9 + 64) == 2)
            {
              unsigned int v13 = *(_DWORD *)(v9 + 84);
              if (v3 >= v13) {
                unsigned int v3 = v13;
              }
            }
            continue;
          }
          int v11 = v10 & 2;
          if (*(_DWORD *)(v9 + 80)) {
            BOOL v12 = 1;
          }
          else {
            BOOL v12 = v11 == 0;
          }
          if (!v12) {
            goto LABEL_16;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (!v6)
      {
LABEL_23:

        return v3;
      }
    }
  }
  return GEOConfigGetUInteger(GeoServicesConfig_PDPlaceCacheNegativeResultTTL, (uint64_t)off_1E9114028);
}

- (id)entityComponent
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v2 = [(GEOPDPlace *)self components];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    uint64_t v6 = &OBJC_IVAR___GEOXPCReply__error;
    uint64_t v7 = &OBJC_IVAR___GEOXPCReply__error;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(id **)(*((void *)&v23 + 1) + 8 * i);
        if (v9 && (*(_WORD *)((unsigned char *)v9 + v6[735]) & 0x80) != 0 && *(_DWORD *)((char *)v9 + v7[736]) == 1)
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          __int16 v10 = -[GEOPDComponent values](v9);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v20;
            while (2)
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v10);
                }
                long long v15 = *(id **)(*((void *)&v19 + 1) + 8 * j);
                long long v16 = -[GEOPDComponentValue entity](v15);

                if (v16)
                {
                  long long v17 = -[GEOPDComponentValue entity](v15);

                  goto LABEL_23;
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }

          uint64_t v6 = &OBJC_IVAR___GEOXPCReply__error;
          uint64_t v7 = &OBJC_IVAR___GEOXPCReply__error;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
      long long v17 = 0;
    }
    while (v4);
  }
  else
  {
    long long v17 = 0;
  }
LABEL_23:

  return v17;
}

- (BOOL)shouldCacheByIDForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 requestType] != 2 && objc_msgSend(v5, "requestType") != 19) {
    goto LABEL_7;
  }
  if (GEOConfigGetBOOL(GeoServicesConfig_PlaceCacheFwdGeoSubpremisesCanCacheByID, (uint64_t)off_1E9113FD8)) {
    goto LABEL_7;
  }
  uint64_t v6 = (void *)MEMORY[0x18C1203C0]();
  uint64_t v7 = +[GEOAddressObject addressObjectForPlaceData:self];
  uint64_t v8 = [v7 address];
  uint64_t v9 = [v8 structuredAddress];
  uint64_t v10 = [v9 subPremisesCount];

  if (v10) {
    BOOL v11 = 0;
  }
  else {
LABEL_7:
  }
    BOOL v11 = 1;

  return v11;
}

- (id)pdPlaceCacheKeyForRequest:(id)a3
{
  if ([(GEOPDPlace *)self shouldCacheByIDForRequest:a3])
  {
    if ([(GEOPDPlace *)self hasMuid])
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"muid-%llu", -[GEOPDPlace muid](self, "muid"));
      goto LABEL_10;
    }
    uint64_t v5 = [(GEOPDPlace *)self mapsId];
    uint64_t v6 = [v5 shardedId];
    int v7 = [v6 hasMuid];

    if (v7)
    {
      uint64_t v8 = NSString;
      uint64_t v9 = [(GEOPDPlace *)self mapsId];
      uint64_t v10 = [v9 shardedId];
      objc_msgSend(v8, "stringWithFormat:", @"muid-%llu", objc_msgSend(v10, "muid"));
      id v4 = LABEL_8:;

      goto LABEL_10;
    }
    BOOL v11 = [(GEOPDPlace *)self mapsId];
    uint64_t v12 = [v11 shardedId];
    int v13 = [v12 hasBasemapId];

    if (v13)
    {
      uint64_t v14 = NSString;
      uint64_t v9 = [(GEOPDPlace *)self mapsId];
      uint64_t v10 = [v9 shardedId];
      objc_msgSend(v14, "stringWithFormat:", @"bmid-%llu", objc_msgSend(v10, "basemapId"));
      goto LABEL_8;
    }
  }
  long long v15 = [(GEOPDPlace *)self cacheKey];
  id v4 = [v15 description];

LABEL_10:

  return v4;
}

- (BOOL)isCacheable
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [(GEOPDPlace *)self components];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v14 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
      if (v7)
      {
        __int16 v8 = *(_WORD *)(v7 + 100);
        if ((v8 & 0x20) != 0)
        {
          int v9 = v8 & 2;
          if (*(_DWORD *)(v7 + 80)) {
            BOOL v10 = 1;
          }
          else {
            BOOL v10 = v9 == 0;
          }
          if (!v10)
          {
LABEL_14:
            if (*(_DWORD *)(v7 + 64) != 2)
            {
              BOOL v11 = 0;
              goto LABEL_19;
            }
          }
        }
        else if ((v8 & 2) != 0)
        {
          goto LABEL_14;
        }
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  BOOL v11 = 1;
LABEL_19:

  return v11;
}

- (id)calculateMissingComponentTypes:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = (void *)[v4 mutableCopy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [(GEOPDPlace *)self components];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if (v11 && (*(_WORD *)(v11 + 100) & 0x80) != 0) {
            uint64_t v12 = *(unsigned int *)(v11 + 88);
          }
          else {
            uint64_t v12 = 0;
          }
          long long v13 = [NSNumber numberWithInt:v12];
          [v5 removeObject:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v5;
}

- (id)successfulComponentWithValuesOfType:(int)a3
{
  return [(GEOPDPlace *)self componentOfType:*(void *)&a3 options:3];
}

- (id)phoneNumbers
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__GEOPDPlace_PlaceDataExtras__phoneNumbers__block_invoke;
  v8[3] = &unk_1E53E17E0;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(GEOPDPlace *)self enumerateValidComponentValuesOfType:1 usingBlock:v8];
  uint64_t v5 = v9;
  id v6 = v4;

  return v6;
}

void __43__GEOPDPlace_PlaceDataExtras__phoneNumbers__block_invoke(uint64_t a1, id *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = -[GEOPDComponentValue entity](a2);
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 telephone];
    id v6 = [*(id *)(a1 + 32) _cleanedPhoneNumberForPhoneNumberRepresentation:v5];
    if (v6) {
      [*(id *)(a1 + 40) addObject:v6];
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = objc_msgSend(v4, "altTelephones", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(a1 + 32) _cleanedPhoneNumberForPhoneNumberRepresentation:*(void *)(*((void *)&v13 + 1) + 8 * v11)];
          if (v12) {
            [*(id *)(a1 + 40) addObject:v12];
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)phoneNumberOptsOutOfAds:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__GEOPDPlace_PlaceDataExtras__phoneNumberOptsOutOfAds___block_invoke;
  v7[3] = &unk_1E53E1808;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  [(GEOPDPlace *)self enumerateValidComponentValuesOfType:1 usingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __55__GEOPDPlace_PlaceDataExtras__phoneNumberOptsOutOfAds___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = -[GEOPDComponentValue entity](a2);
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 telephone];
    id v8 = [*(id *)(a1 + 32) _cleanedPhoneNumberForPhoneNumberRepresentation:v7];
    uint64_t v9 = v8;
    if (v8 && [v8 isEqualToString:*(void *)(a1 + 40)])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 telephoneAdsOptOut];
      *a3 = 1;
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v10 = objc_msgSend(v6, "altTelephones", 0);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = [*(id *)(a1 + 32) _cleanedPhoneNumberForPhoneNumberRepresentation:*(void *)(*((void *)&v17 + 1) + 8 * i)];
            long long v16 = v15;
            if (v15 && [v15 isEqualToString:*(void *)(a1 + 40)])
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 telephoneAdsOptOut];
              *a3 = 1;

              goto LABEL_16;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
  }
}

- (id)_cleanedPhoneNumberForPhoneNumberRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = +[GEOPNRUtils _stringByStrippingFormattingAndNotVisiblyAllowable:](GEOPNRUtils, "_stringByStrippingFormattingAndNotVisiblyAllowable:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)spokenNameForLocale:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    long long v14 = __Block_byref_object_copy__37;
    long long v15 = __Block_byref_object_dispose__37;
    id v16 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__GEOPDPlace_PlaceDataExtras__spokenNameForLocale___block_invoke;
    v8[3] = &unk_1E53E1858;
    uint64_t v10 = &v11;
    id v9 = v4;
    [(GEOPDPlace *)self enumerateValidComponentValuesOfType:1 usingBlock:v8];
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __51__GEOPDPlace_PlaceDataExtras__spokenNameForLocale___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = -[GEOPDComponentValue entity](a2);
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 spokenNames];
    v12[0] = *(void *)(a1 + 32);
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    uint64_t v9 = +[GEOLocalizedString bestString:v7 forPreferredLanguages:v8 fallbackToFirstAvailable:0];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a3 = 1;
  }
}

- (id)secondaryName
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__37;
  uint64_t v9 = __Block_byref_object_dispose__37;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__GEOPDPlace_PlaceDataExtras__secondaryName__block_invoke;
  v4[3] = &unk_1E53E16F0;
  v4[4] = &v5;
  [(GEOPDPlace *)self enumerateValidComponentValuesOfType:1 usingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __44__GEOPDPlace_PlaceDataExtras__secondaryName__block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  uint64_t v5 = -[GEOPDComponentValue entity](a2);
  if (v5)
  {
    id v10 = v5;
    id v6 = [v5 secondaryName];
    uint64_t v7 = [v6 stringValue];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v5 = v10;
    *a3 = 1;
  }
}

- (id)secondarySpokenName
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__37;
  uint64_t v9 = __Block_byref_object_dispose__37;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__GEOPDPlace_PlaceDataExtras__secondarySpokenName__block_invoke;
  v4[3] = &unk_1E53E16F0;
  v4[4] = &v5;
  [(GEOPDPlace *)self enumerateValidComponentValuesOfType:1 usingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __50__GEOPDPlace_PlaceDataExtras__secondarySpokenName__block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  uint64_t v5 = -[GEOPDComponentValue entity](a2);
  if (v5)
  {
    id v10 = v5;
    id v6 = [v5 secondarySpokenName];
    uint64_t v7 = [v6 stringValue];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v5 = v10;
    *a3 = 1;
  }
}

- (BOOL)isStandAloneBrand
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__GEOPDPlace_PlaceDataExtras__isStandAloneBrand__block_invoke;
  v4[3] = &unk_1E53E16F0;
  v4[4] = &v5;
  [(GEOPDPlace *)self enumerateValidComponentValuesOfType:1 usingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __48__GEOPDPlace_PlaceDataExtras__isStandAloneBrand__block_invoke(uint64_t a1, id *a2)
{
  -[GEOPDComponentValue entity](a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if ([v3 hasIsStandaloneBrand]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 isStandaloneBrand];
  }
}

- (BOOL)hasBrandMUID
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__GEOPDPlace_PlaceDataExtras__hasBrandMUID__block_invoke;
  v4[3] = &unk_1E53E16F0;
  v4[4] = &v5;
  [(GEOPDPlace *)self enumerateValidComponentValuesOfType:1 usingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __43__GEOPDPlace_PlaceDataExtras__hasBrandMUID__block_invoke(uint64_t a1, id *a2)
{
  -[GEOPDComponentValue entity](a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 hasBrandMuid];
}

- (unint64_t)brandMUID
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__GEOPDPlace_PlaceDataExtras__brandMUID__block_invoke;
  v4[3] = &unk_1E53E16F0;
  v4[4] = &v5;
  [(GEOPDPlace *)self enumerateValidComponentValuesOfType:1 usingBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __40__GEOPDPlace_PlaceDataExtras__brandMUID__block_invoke(uint64_t a1, id *a2)
{
  -[GEOPDComponentValue entity](a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if ([v3 hasBrandMuid]) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 brandMuid];
  }
}

- (id)businessURL
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__37;
  uint64_t v9 = __Block_byref_object_dispose__37;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__GEOPDPlace_PlaceDataExtras__businessURL__block_invoke;
  v4[3] = &unk_1E53E16F0;
  v4[4] = &v5;
  [(GEOPDPlace *)self enumerateValidComponentValuesOfType:1 usingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__GEOPDPlace_PlaceDataExtras__businessURL__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  -[GEOPDComponentValue entity](a2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v8 url];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (id)copyWithoutETAComponents
{
  id v2 = (void *)[(GEOPDPlace *)self copy];
  [v2 _removeETAComponents];
  return v2;
}

- (void)_removeETAComponents
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__GEOPDPlace_PlaceDataExtras___removeETAComponents__block_invoke;
  v6[3] = &unk_1E53E1880;
  id v4 = v3;
  id v7 = v4;
  [(GEOPDPlace *)self enumerateComponentOfType:12 enumerationOptions:0 usingBlock:v6];
  if ([v4 count])
  {
    uint64_t v5 = [(GEOPDPlace *)self components];
    [v5 removeObjectsInArray:v4];
  }
}

uint64_t __51__GEOPDPlace_PlaceDataExtras___removeETAComponents__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)copyWithStrippedOptionalData
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[(GEOPDPlace *)self copy];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = objc_msgSend(v2, "components", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        if (v9 && (*(_WORD *)(v9 + 100) & 0x80) != 0)
        {
          unsigned int v10 = *(_DWORD *)(v9 + 88);
          BOOL v11 = v10 > 0x29;
          uint64_t v12 = (1 << v10) & 0x2008000002ELL;
          if (!v11 && v12 != 0) {
            objc_msgSend(v3, "addObject:");
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  [v2 setComponents:v3];
  return v2;
}

- (double)firstSeenTimestamp
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [(GEOPDPlace *)self components];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    double v6 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 hasTimestampFirstSeen])
        {
          [v8 timestampFirstSeen];
          if (v9 < v6)
          {
            [v8 timestampFirstSeen];
            double v6 = v10;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 1.79769313e308;
  }

  double result = 0.0;
  if (v6 != 1.79769313e308) {
    return v6;
  }
  return result;
}

- (void)forceUncacheable
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(GEOPDPlace *)self components];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * v6);
        if (v7)
        {
          *(_WORD *)(v7 + 100) |= 2u;
          *(_DWORD *)(v7 + 64) = 1;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)cacheKey
{
  uint64_t v3 = [(GEOPDPlace *)self placeCacheKey];

  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = [v4 UUIDString];
    [(GEOPDPlace *)self setPlaceCacheKey:v5];
  }

  return [(GEOPDPlace *)self placeCacheKey];
}

- (id)compactDebugDescription
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = NSString;
  uint64_t v5 = [(GEOPDPlace *)self mapsId];
  uint64_t v6 = [v4 stringWithFormat:@"identifier: %@", v5];
  [v3 appendString:v6];

  uint64_t v7 = NSString;
  long long v8 = objc_msgSend(NSNumber, "numberWithInt:", -[GEOPDPlace resultProviderId](self, "resultProviderId"));
  long long v9 = [v7 stringWithFormat:@" | provider: %@", v8];
  [v3 appendString:v9];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v10 = [(GEOPDPlace *)self components];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * v14);
        if (!v15)
        {
          uint64_t v17 = NSString;
LABEL_10:
          long long v18 = @"COMPONENT_TYPE_UNKNOWN";
LABEL_11:
          long long v19 = [v17 stringWithFormat:@" | %@", v18];
          [v3 appendString:v19];

          goto LABEL_12;
        }
        __int16 v16 = *(_WORD *)(v15 + 100);
        if ((v16 & 0x20) == 0 || !*(_DWORD *)(v15 + 80))
        {
          uint64_t v17 = NSString;
          if ((v16 & 0x80) == 0) {
            goto LABEL_10;
          }
          uint64_t v20 = *(unsigned int *)(v15 + 88);
          long long v18 = @"COMPONENT_TYPE_UNKNOWN";
          switch((int)v20)
          {
            case 0:
              goto LABEL_11;
            case 1:
              long long v18 = @"COMPONENT_TYPE_ENTITY";
              break;
            case 2:
              long long v18 = @"COMPONENT_TYPE_PLACE_INFO";
              break;
            case 3:
              long long v18 = @"COMPONENT_TYPE_ROAD_ACCESS_INFO";
              break;
            case 4:
              long long v18 = @"COMPONENT_TYPE_BOUNDS";
              break;
            case 5:
              long long v18 = @"COMPONENT_TYPE_ADDRESS";
              break;
            case 6:
              long long v18 = @"COMPONENT_TYPE_RATING";
              break;
            case 7:
              long long v18 = @"COMPONENT_TYPE_REVIEW";
              break;
            case 8:
              long long v18 = @"COMPONENT_TYPE_PHOTO";
              break;
            case 9:
              long long v18 = @"COMPONENT_TYPE_HOURS";
              break;
            case 10:
              long long v18 = @"COMPONENT_TYPE_TRANSIT_INFO";
              break;
            case 11:
              long long v18 = @"COMPONENT_TYPE_TRANSIT_SCHEDULE";
              break;
            case 12:
              long long v18 = @"COMPONENT_TYPE_ETA";
              break;
            case 13:
              long long v18 = @"COMPONENT_TYPE_FLYOVER";
              break;
            case 14:
              long long v18 = @"COMPONENT_TYPE_RAW_ATTRIBUTE";
              break;
            case 15:
              long long v18 = @"COMPONENT_TYPE_AMENITIES";
              break;
            case 16:
              long long v18 = @"COMPONENT_TYPE_STYLE_ATTRIBUTES";
              break;
            case 20:
              long long v18 = @"COMPONENT_TYPE_TRANSIT_INCIDENT";
              break;
            case 21:
              long long v18 = @"COMPONENT_TYPE_TRANSIT_ASSOCIATED_INFO";
              break;
            case 22:
              long long v18 = @"COMPONENT_TYPE_TEXT_BLOCK";
              break;
            case 23:
              long long v18 = @"COMPONENT_TYPE_FACTOID";
              break;
            case 24:
              long long v18 = @"COMPONENT_TYPE_TRANSIT_ATTRIBUTION";
              break;
            case 25:
              long long v18 = @"COMPONENT_TYPE_BUSINESS_CLAIM";
              break;
            case 26:
              long long v18 = @"COMPONENT_TYPE_CAPTIONED_PHOTO";
              break;
            case 27:
              long long v18 = @"COMPONENT_TYPE_TRANSIT_INFO_SNIPPET";
              break;
            case 29:
              long long v18 = @"COMPONENT_TYPE_EXTERNAL_ACTION";
              break;
            case 30:
              long long v18 = @"COMPONENT_TYPE_RESULT_SNIPPET";
              break;
            case 31:
              long long v18 = @"COMPONENT_TYPE_ADDRESS_OBJECT";
              break;
            case 32:
              long long v18 = @"COMPONENT_TYPE_SIMPLE_RESTAURANT_MENU_TEXT";
              break;
            case 33:
              long long v18 = @"COMPONENT_TYPE_RESTAURANT_RESERVATION_LINK";
              break;
            case 34:
              long long v18 = @"COMPONENT_TYPE_SPATIAL_LOOKUP_RESULT";
              break;
            case 36:
              long long v18 = @"COMPONENT_TYPE_TIP";
              break;
            case 37:
              long long v18 = @"COMPONENT_TYPE_PLACECARD_URL";
              break;
            case 38:
              long long v18 = @"COMPONENT_TYPE_ASSOCIATED_APP";
              break;
            case 39:
              long long v18 = @"COMPONENT_TYPE_MESSAGE_LINK";
              break;
            case 40:
              long long v18 = @"COMPONENT_TYPE_QUICK_LINK";
              break;
            case 41:
              long long v18 = @"COMPONENT_TYPE_RAP";
              break;
            case 42:
              long long v18 = @"COMPONENT_TYPE_OFFLINE_AREA";
              break;
            case 43:
              long long v18 = @"COMPONENT_TYPE_LOCATION_EVENT";
              break;
            case 44:
              long long v18 = @"COMPONENT_TYPE_SUPPORTS_OFFLINE_MAPS";
              break;
            case 45:
              long long v18 = @"COMPONENT_TYPE_OFFLINE_IDENTIFIER";
              break;
            case 46:
              long long v18 = @"COMPONENT_TYPE_OFFLINE_QUAD_NODES";
              break;
            case 47:
              long long v18 = @"COMPONENT_TYPE_OFFLINE_SIZE";
              break;
            case 48:
              long long v18 = @"COMPONENT_TYPE_VENUE_INFO";
              break;
            case 49:
              long long v18 = @"COMPONENT_TYPE_OFFLINE_UPDATE_MANIFEST";
              break;
            case 50:
              long long v18 = @"COMPONENT_TYPE_CONTAINED_PLACE";
              break;
            case 51:
              long long v18 = @"COMPONENT_TYPE_WIFI_FINGERPRINT";
              break;
            case 52:
              long long v18 = @"COMPONENT_TYPE_ICON";
              break;
            case 53:
              long long v18 = @"COMPONENT_TYPE_PRICE_DESCRIPTION";
              break;
            case 54:
              long long v18 = @"COMPONENT_TYPE_BROWSE_CATEGORIES";
              break;
            case 55:
              long long v18 = @"COMPONENT_TYPE_STOREFRONT";
              break;
            case 56:
              long long v18 = @"COMPONENT_TYPE_GROUND_VIEW_LABEL";
              break;
            case 57:
              long long v18 = @"COMPONENT_TYPE_ANNOTATED_ITEM_LIST";
              break;
            case 58:
              long long v18 = @"COMPONENT_TYPE_POI_EVENT";
              break;
            case 59:
              long long v18 = @"COMPONENT_TYPE_STOREFRONT_PRESENTATION";
              break;
            case 60:
              long long v18 = @"COMPONENT_TYPE_PLACECARD_LAYOUT";
              break;
            case 61:
              long long v18 = @"COMPONENT_TYPE_PROTOTYPE_CONTAINER";
              break;
            case 62:
              long long v18 = @"COMPONENT_TYPE_TRANSIT_VEHICLE_POSITION";
              break;
            case 63:
              long long v18 = @"COMPONENT_TYPE_LINKED_SERVICE";
              break;
            case 64:
              long long v18 = @"COMPONENT_TYPE_BUSINESS_HOURS";
              break;
            case 65:
              long long v18 = @"COMPONENT_TYPE_COLLECTION";
              break;
            case 66:
              long long v18 = @"COMPONENT_TYPE_RELATED_PLACE";
              break;
            case 67:
              long long v18 = @"COMPONENT_TYPE_TRANSIT_TRIP_STOP";
              break;
            case 68:
              long long v18 = @"COMPONENT_TYPE_TRANSIT_TRIP_STOP_TIME";
              break;
            case 69:
              long long v18 = @"COMPONENT_TYPE_TRANSIT_TRIP_GEOMETRY";
              break;
            case 70:
              long long v18 = @"COMPONENT_TYPE_PLACE_BROWSE_CATEGORIES";
              break;
            case 71:
              long long v18 = @"COMPONENT_TYPE_PUBLISHER";
              break;
            case 72:
              long long v18 = @"COMPONENT_TYPE_MINI_PLACE_BROWSE_CATEGORIES";
              break;
            case 73:
              long long v18 = @"COMPONENT_TYPE_PLACE_QUESTIONNAIRE";
              break;
            case 74:
              long long v18 = @"COMPONENT_TYPE_PLACE_COLLECTION_ITEM";
              break;
            case 76:
              long long v18 = @"COMPONENT_TYPE_COLLECTION_IDS";
              break;
            case 77:
              long long v18 = @"COMPONENT_TYPE_ISO_3166_CODE";
              break;
            case 78:
              long long v18 = @"COMPONENT_TYPE_VENDOR_AMENITIES";
              break;
            case 79:
              long long v18 = @"COMPONENT_TYPE_TRANSIT_NEARBY_SCHEDULE";
              break;
            case 81:
              long long v18 = @"COMPONENT_TYPE_STOREFRONT_FACES";
              break;
            case 82:
              long long v18 = @"COMPONENT_TYPE_GUIDE_GROUP";
              break;
            case 83:
              long long v18 = @"COMPONENT_TYPE_CONTAINMENT_PLACE";
              break;
            case 84:
              long long v18 = @"COMPONENT_TYPE_CATEGORIZED_PHOTOS";
              break;
            case 85:
              long long v18 = @"COMPONENT_TYPE_EXPLORE_GUIDES";
              break;
            case 86:
              long long v18 = @"COMPONENT_TYPE_ABOUT";
              break;
            case 87:
              long long v18 = @"COMPONENT_TYPE_LABEL_GEOMETRY";
              break;
            case 88:
              long long v18 = @"COMPONENT_TYPE_ENHANCED_PLACEMENT";
              break;
            case 89:
              long long v18 = @"COMPONENT_TYPE_TEMPLATE_PLACE";
              break;
            case 90:
              long long v18 = @"COMPONENT_TYPE_SEARCH_ENRICHMENT";
              break;
            case 91:
              long long v18 = @"COMPONENT_TYPE_TRANSIT_PAYMENT_METHOD_INFO";
              break;
            case 92:
              long long v18 = @"COMPONENT_TYPE_BUSINESS_ASSETS";
              break;
            case 93:
              long long v18 = @"COMPONENT_TYPE_ENRICHMENT_INFO";
              break;
            case 94:
              long long v18 = @"COMPONENT_TYPE_ACTION_DATA";
              break;
            case 95:
              long long v18 = @"COMPONENT_TYPE_ENRICHMENT_DATA";
              break;
            case 96:
              long long v18 = @"COMPONENT_TYPE_POI_CLAIM";
              break;
            case 97:
              long long v18 = @"COMPONENT_TYPE_EV_CHARGER";
              break;
            case 98:
              long long v18 = @"COMPONENT_TYPE_TRAIL_HEAD";
              break;
            case 99:
              long long v18 = @"COMPONENT_TYPE_TOOL_TIP";
              break;
            case 100:
              long long v18 = @"COMPONENT_TYPE_REFRESH_ID";
              break;
            case 101:
              long long v18 = @"COMPONENT_TYPE_ADDRESS_COMPONENTS";
              break;
            case 102:
              long long v18 = @"COMPONENT_TYPE_SEARCH_RESULT_PLACE_PHOTO";
              break;
            case 103:
              long long v18 = @"COMPONENT_TYPE_FORWARD_INFO";
              break;
            case 104:
              long long v18 = @"COMPONENT_TYPE_HIKE_ASSOCIATED_INFO";
              break;
            case 105:
              long long v18 = @"COMPONENT_TYPE_HIKE_SUMMARY";
              break;
            case 106:
              long long v18 = @"COMPONENT_TYPE_HIKE_GEOMETRY";
              break;
            default:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v20);
              long long v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
              break;
          }
          goto LABEL_11;
        }
LABEL_12:
        ++v14;
      }
      while (v12 != v14);
      uint64_t v21 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v12 = v21;
    }
    while (v21);
  }

  return v3;
}

- (void)setHasMuid:(BOOL)a3
{
  if (a3) {
    int v3 = 262146;
  }
  else {
    int v3 = 0x40000;
  }
  self->_$E293E9EAAB2B8016EDB279585BF8500E flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 262400;
  }
  else {
    int v3 = 0x40000;
  }
  self->_$E293E9EAAB2B8016EDB279585BF8500E flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasStatus
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 <= 29)
  {
    uint64_t v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        uint64_t v4 = @"STATUS_FAILED";
        break;
      case 2:
        uint64_t v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        uint64_t v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        uint64_t v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      uint64_t v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      uint64_t v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        uint64_t v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    uint64_t v4 = @"NEEDS_REFINEMENT";
  }
  return v4;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATUS_FAILED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATUS_INCOMPLETE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INVALID_REQUEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FAILED_NO_RESULT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"NEEDS_REFINEMENT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"STATUS_DEDUPED"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"VERSION_MISMATCH"])
  {
    int v4 = 60;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)preferredMuid
{
  return self->_preferredMuid;
}

- (void)setPreferredMuid:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x40004u;
  self->_preferredMuid = a3;
}

- (void)setHasPreferredMuid:(BOOL)a3
{
  if (a3) {
    int v3 = 262148;
  }
  else {
    int v3 = 0x40000;
  }
  self->_$E293E9EAAB2B8016EDB279585BF8500E flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFBFFFB | v3);
}

- (void)setComponents:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
  components = self->_components;
  self->_components = v4;
}

- (void)clearComponents
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
  components = self->_components;

  [(NSMutableArray *)components removeAllObjects];
}

- (unint64_t)componentsCount
{
  -[GEOPDPlace _readComponents]((uint64_t)self);
  components = self->_components;

  return [(NSMutableArray *)components count];
}

- (id)componentAtIndex:(unint64_t)a3
{
  -[GEOPDPlace _readComponents]((uint64_t)self);
  components = self->_components;

  return (id)[(NSMutableArray *)components objectAtIndex:a3];
}

+ (Class)componentType
{
  return (Class)objc_opt_class();
}

- (void)setResultProviderId:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x40080u;
  self->_resultProviderId = a3;
}

- (void)setHasResultProviderId:(BOOL)a3
{
  if (a3) {
    int v3 = 262272;
  }
  else {
    int v3 = 0x40000;
  }
  self->_$E293E9EAAB2B8016EDB279585BF8500E flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (unint64_t)updateVersion
{
  return self->_updateVersion;
}

- (void)setUpdateVersion:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x40008u;
  self->_updateVersion = a3;
}

- (void)setHasUpdateVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 262152;
  }
  else {
    int v3 = 0x40000;
  }
  self->_$E293E9EAAB2B8016EDB279585BF8500E flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasUpdateVersion
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (void)setMapsId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x44000u;
  objc_storeStrong((id *)&self->_mapsId, a3);
}

- (unint64_t)createdTime
{
  return self->_createdTime;
}

- (void)setCreatedTime:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x40001u;
  self->_createdTime = a3;
}

- (void)setHasCreatedTime:(BOOL)a3
{
  self->_$E293E9EAAB2B8016EDB279585BF8500E flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x40000);
}

- (BOOL)hasCreatedTime
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readPlaceLayoutData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 142) & 1) == 0)
    {
      id v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceLayoutData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasPlaceLayoutData
{
  return self->_placeLayoutData != 0;
}

- (GEOPDPlacecardLayoutData)placeLayoutData
{
  -[GEOPDPlace _readPlaceLayoutData]((uint64_t)self);
  placeLayoutData = self->_placeLayoutData;

  return placeLayoutData;
}

- (void)setPlaceLayoutData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x50000u;
  objc_storeStrong((id *)&self->_placeLayoutData, a3);
}

- (void)setIsPartiallyClientizedSearchResult:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x40200u;
  self->_isPartiallyClientizedSearchResult = a3;
}

- (void)setHasIsPartiallyClientizedSearchResult:(BOOL)a3
{
  if (a3) {
    int v3 = 262656;
  }
  else {
    int v3 = 0x40000;
  }
  self->_$E293E9EAAB2B8016EDB279585BF8500E flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasIsPartiallyClientizedSearchResult
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (int)mapDisplayType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $E293E9EAAB2B8016EDB279585BF8500E flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    return self->_mapDisplayType;
  }
  else {
    return 0;
  }
}

- (void)setMapDisplayType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x40010u;
  self->_mapDisplayType = a3;
}

- (void)setHasMapDisplayType:(BOOL)a3
{
  if (a3) {
    int v3 = 262160;
  }
  else {
    int v3 = 0x40000;
  }
  self->_$E293E9EAAB2B8016EDB279585BF8500E flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasMapDisplayType
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)mapDisplayTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"TOPOGRAPHIC";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"DEFAULT";
  }
  return v4;
}

- (int)StringAsMapDisplayType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEFAULT"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"TOPOGRAPHIC"];
  }

  return v4;
}

- (void)_readAbExpBranchIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 141) & 0x10) == 0)
    {
      id v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbExpBranchIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (NSMutableArray)abExpBranchIds
{
  -[GEOPDPlace _readAbExpBranchIds]((uint64_t)self);
  abExpBranchIds = self->_abExpBranchIds;

  return abExpBranchIds;
}

- (void)setAbExpBranchIds:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
  abExpBranchIds = self->_abExpBranchIds;
  self->_abExpBranchIds = v4;
}

- (void)clearAbExpBranchIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
  abExpBranchIds = self->_abExpBranchIds;

  [(NSMutableArray *)abExpBranchIds removeAllObjects];
}

- (void)addAbExpBranchId:(id)a3
{
  id v4 = a3;
  -[GEOPDPlace _readAbExpBranchIds]((uint64_t)self);
  -[GEOPDPlace _addNoFlagsAbExpBranchId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
}

- (void)_addNoFlagsAbExpBranchId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)abExpBranchIdsCount
{
  -[GEOPDPlace _readAbExpBranchIds]((uint64_t)self);
  abExpBranchIds = self->_abExpBranchIds;

  return [(NSMutableArray *)abExpBranchIds count];
}

- (id)abExpBranchIdAtIndex:(unint64_t)a3
{
  -[GEOPDPlace _readAbExpBranchIds]((uint64_t)self);
  abExpBranchIds = self->_abExpBranchIds;

  return (id)[(NSMutableArray *)abExpBranchIds objectAtIndex:a3];
}

+ (Class)abExpBranchIdType
{
  return (Class)objc_opt_class();
}

- (int)rapFlowType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $E293E9EAAB2B8016EDB279585BF8500E flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    return self->_rapFlowType;
  }
  else {
    return 0;
  }
}

- (void)setRapFlowType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x40020u;
  self->_rapFlowType = a3;
}

- (void)setHasRapFlowType:(BOOL)a3
{
  if (a3) {
    int v3 = 262176;
  }
  else {
    int v3 = 0x40000;
  }
  self->_$E293E9EAAB2B8016EDB279585BF8500E flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasRapFlowType
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)rapFlowTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E3E98[a3];
  }

  return v3;
}

- (int)StringAsRapFlowType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RAP_FLOW_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RAP_FLOW_POI"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RAP_FLOW_LOCALITY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RAP_FLOW_EV"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RAP_FLOW_HIKING_TRAIL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RAP_FLOW_HIKING_TRAILHEAD"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RAP_FLOW_ADDRESS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RAP_FLOW_TRANSIT"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlace;
  int v4 = [(GEOPDPlace *)&v8 description];
  id v5 = [(GEOPDPlace *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlace _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_100;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int v5 = *(_DWORD *)(a1 + 140);
  if ((v5 & 2) == 0)
  {
    if ((v5 & 0x100) == 0) {
      goto LABEL_4;
    }
LABEL_35:
    int v26 = *(_DWORD *)(a1 + 132);
    if (v26 <= 29)
    {
      uint64_t v27 = @"STATUS_SUCCESS";
      switch(v26)
      {
        case 0:
          break;
        case 1:
          uint64_t v27 = @"STATUS_FAILED";
          break;
        case 2:
          uint64_t v27 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_108;
        case 5:
          uint64_t v27 = @"INVALID_REQUEST";
          break;
        default:
          if (v26 != 20) {
            goto LABEL_108;
          }
          uint64_t v27 = @"FAILED_NO_RESULT";
          break;
      }
LABEL_113:
      [v4 setObject:v27 forKey:@"status"];

      if ((*(_DWORD *)(a1 + 140) & 4) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
    if (v26 > 49)
    {
      if (v26 == 50)
      {
        uint64_t v27 = @"STATUS_DEDUPED";
        goto LABEL_113;
      }
      if (v26 == 60)
      {
        uint64_t v27 = @"VERSION_MISMATCH";
        goto LABEL_113;
      }
    }
    else
    {
      if (v26 == 30)
      {
        uint64_t v27 = @"NEEDS_REFINEMENT";
        goto LABEL_113;
      }
      if (v26 == 40)
      {
        uint64_t v27 = @"FAILED_NOT_AUTHORIZED";
        goto LABEL_113;
      }
    }
LABEL_108:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 132));
    uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_113;
  }
  long long v25 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  [v4 setObject:v25 forKey:@"muid"];

  int v5 = *(_DWORD *)(a1 + 140);
  if ((v5 & 0x100) != 0) {
    goto LABEL_35;
  }
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_5:
    uint64_t v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 80)];
    if (a2) {
      id v7 = @"preferredMuid";
    }
    else {
      id v7 = @"preferred_muid";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_9:
  if ([*(id *)(a1 + 32) count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v63 objects:v67 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v64 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          if (a2) {
            [v14 jsonRepresentation];
          }
          else {
          uint64_t v15 = [v14 dictionaryRepresentation];
          }
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v63 objects:v67 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"component"];
  }
  int v16 = *(_DWORD *)(a1 + 140);
  if ((v16 & 0x80) != 0)
  {
    uint64_t v17 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 128)];
    if (a2) {
      long long v18 = @"resultProviderId";
    }
    else {
      long long v18 = @"result_provider_id";
    }
    [v4 setObject:v17 forKey:v18];

    int v16 = *(_DWORD *)(a1 + 140);
  }
  if ((v16 & 8) != 0)
  {
    long long v19 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 96)];
    if (a2) {
      uint64_t v20 = @"updateVersion";
    }
    else {
      uint64_t v20 = @"update_version";
    }
    [v4 setObject:v19 forKey:v20];
  }
  uint64_t v21 = [(id)a1 mapsId];
  uint64_t v22 = v21;
  if (v21)
  {
    if (a2)
    {
      long long v23 = [v21 jsonRepresentation];
      long long v24 = @"mapsId";
    }
    else
    {
      long long v23 = [v21 dictionaryRepresentation];
      long long v24 = @"maps_id";
    }
    [v4 setObject:v23 forKey:v24];
  }
  if (*(unsigned char *)(a1 + 140))
  {
    uint64_t v28 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
    if (a2) {
      uint64_t v29 = @"createdTime";
    }
    else {
      uint64_t v29 = @"created_time";
    }
    [v4 setObject:v28 forKey:v29];
  }
  uint64_t v30 = [(id)a1 placeLayoutData];
  uint64_t v31 = v30;
  if (v30)
  {
    if (a2)
    {
      v32 = [v30 jsonRepresentation];
      uint64_t v33 = @"placeLayoutData";
    }
    else
    {
      v32 = [v30 dictionaryRepresentation];
      uint64_t v33 = @"place_layout_data";
    }
    [v4 setObject:v32 forKey:v33];
  }
  int v34 = *(_DWORD *)(a1 + 140);
  if ((v34 & 0x200) != 0)
  {
    id v35 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 136)];
    if (a2) {
      uint64_t v36 = @"isPartiallyClientizedSearchResult";
    }
    else {
      uint64_t v36 = @"is_partially_clientized_search_result";
    }
    [v4 setObject:v35 forKey:v36];

    int v34 = *(_DWORD *)(a1 + 140);
  }
  if ((v34 & 0x10) != 0)
  {
    int v37 = *(_DWORD *)(a1 + 116);
    if (v37)
    {
      if (v37 == 1)
      {
        uint64_t v38 = @"TOPOGRAPHIC";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 116));
        uint64_t v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v38 = @"DEFAULT";
    }
    [v4 setObject:v38 forKey:@"mapDisplayType"];
  }
  if (*(void *)(a1 + 24))
  {
    uint64_t v39 = [(id)a1 abExpBranchIds];
    if (a2) {
      uint64_t v40 = @"abExpBranchId";
    }
    else {
      uint64_t v40 = @"ab_exp_branch_id";
    }
    [v4 setObject:v39 forKey:v40];
  }
  int v41 = *(_DWORD *)(a1 + 140);
  if ((v41 & 0x20) != 0)
  {
    uint64_t v42 = *(int *)(a1 + 120);
    if (v42 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 120));
      uint64_t v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v43 = off_1E53E3E98[v42];
    }
    if (a2) {
      uint64_t v44 = @"rapFlowType";
    }
    else {
      uint64_t v44 = @"rap_flow_type";
    }
    [v4 setObject:v43 forKey:v44];

    int v41 = *(_DWORD *)(a1 + 140);
  }
  if ((v41 & 0x40) != 0)
  {
    uint64_t v45 = *(int *)(a1 + 124);
    if (v45 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 124));
      uint64_t v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v46 = off_1E53E3ED8[v45];
    }
    [v4 setObject:v46 forKey:@"referenceFrame"];
  }
  uint64_t v47 = [(id)a1 requestData];
  v48 = v47;
  if (v47)
  {
    if (a2)
    {
      uint64_t v49 = [v47 jsonRepresentation];
      v50 = @"requestData";
    }
    else
    {
      uint64_t v49 = [v47 dictionaryRepresentation];
      v50 = @"request_data";
    }
    [v4 setObject:v49 forKey:v50];
  }
  uint64_t v51 = [(id)a1 placeCacheKey];
  if (v51) {
    [v4 setObject:v51 forKey:@"placeCacheKey"];
  }

  if ((*(unsigned char *)(a1 + 141) & 4) != 0)
  {
    v52 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 137)];
    if (a2) {
      uint64_t v53 = @"nilPlace";
    }
    else {
      uint64_t v53 = @"nil_place";
    }
    [v4 setObject:v52 forKey:v53];
  }
  v54 = *(void **)(a1 + 16);
  if (v54)
  {
    id v55 = [v54 dictionaryRepresentation];
    uint64_t v56 = v55;
    if (a2)
    {
      uint64_t v57 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v55, "count"));
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __40__GEOPDPlace__dictionaryRepresentation___block_invoke;
      v61[3] = &unk_1E53D8860;
      id v58 = v57;
      id v62 = v58;
      [v56 enumerateKeysAndObjectsUsingBlock:v61];
      id v59 = v58;

      uint64_t v56 = v59;
    }
    [v4 setObject:v56 forKey:@"Unknown Fields"];
  }
LABEL_100:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlace _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOPDPlace__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDPlace)initWithDictionary:(id)a3
{
  return (GEOPDPlace *)-[GEOPDPlace _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(id)a3 isJSON:
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    uint64_t v6 = 0;
    goto LABEL_226;
  }
  uint64_t v6 = (void *)[a1 init];
  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:@"muid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setMuid:", objc_msgSend(v7, "unsignedLongLongValue"));
    }

    objc_super v8 = [v5 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      if ([v9 isEqualToString:@"STATUS_SUCCESS"])
      {
        uint64_t v10 = 0;
      }
      else if ([v9 isEqualToString:@"STATUS_FAILED"])
      {
        uint64_t v10 = 1;
      }
      else if ([v9 isEqualToString:@"STATUS_INCOMPLETE"])
      {
        uint64_t v10 = 2;
      }
      else if ([v9 isEqualToString:@"INVALID_REQUEST"])
      {
        uint64_t v10 = 5;
      }
      else if ([v9 isEqualToString:@"FAILED_NO_RESULT"])
      {
        uint64_t v10 = 20;
      }
      else if ([v9 isEqualToString:@"NEEDS_REFINEMENT"])
      {
        uint64_t v10 = 30;
      }
      else if ([v9 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
      {
        uint64_t v10 = 40;
      }
      else if ([v9 isEqualToString:@"STATUS_DEDUPED"])
      {
        uint64_t v10 = 50;
      }
      else if ([v9 isEqualToString:@"VERSION_MISMATCH"])
      {
        uint64_t v10 = 60;
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_29;
      }
      uint64_t v10 = [v8 intValue];
    }
    [v6 setStatus:v10];
LABEL_29:

    if (a3) {
      uint64_t v11 = @"preferredMuid";
    }
    else {
      uint64_t v11 = @"preferred_muid";
    }
    uint64_t v12 = [v5 objectForKeyedSubscript:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setPreferredMuid:", objc_msgSend(v12, "unsignedLongLongValue"));
    }

    uint64_t v13 = [v5 objectForKeyedSubscript:@"component"];
    objc_opt_class();
    uint64_t v14 = (uint64_t)a3;
    if (objc_opt_isKindOfClass())
    {
      a3 = v5;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v105 objects:v114 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v106;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v106 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v105 + 1) + 8 * v19);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v21 = [GEOPDComponent alloc];
              if (v21) {
                uint64_t v22 = -[GEOPDComponent _initWithDictionary:isJSON:]((char *)v21, v20, v14);
              }
              else {
                uint64_t v22 = 0;
              }
              [v6 addComponent:v22];
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v23 = [v15 countByEnumeratingWithState:&v105 objects:v114 count:16];
          uint64_t v17 = v23;
        }
        while (v23);
      }

      id v5 = a3;
      LODWORD(a3) = v14;
    }

    if (a3) {
      long long v24 = @"resultProviderId";
    }
    else {
      long long v24 = @"result_provider_id";
    }
    long long v25 = [v5 objectForKeyedSubscript:v24];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setResultProviderId:", objc_msgSend(v25, "intValue"));
    }

    if (a3) {
      int v26 = @"updateVersion";
    }
    else {
      int v26 = @"update_version";
    }
    uint64_t v27 = [v5 objectForKeyedSubscript:v26];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setUpdateVersion:", objc_msgSend(v27, "unsignedLongLongValue"));
    }

    if (a3) {
      uint64_t v28 = @"mapsId";
    }
    else {
      uint64_t v28 = @"maps_id";
    }
    uint64_t v29 = [v5 objectForKeyedSubscript:v28];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v30 = [GEOPDMapsIdentifier alloc];
      if (a3) {
        uint64_t v31 = [(GEOPDMapsIdentifier *)v30 initWithJSON:v29];
      }
      else {
        uint64_t v31 = [(GEOPDMapsIdentifier *)v30 initWithDictionary:v29];
      }
      v32 = (void *)v31;
      [v6 setMapsId:v31];
    }
    if (a3) {
      uint64_t v33 = @"createdTime";
    }
    else {
      uint64_t v33 = @"created_time";
    }
    int v34 = [v5 objectForKeyedSubscript:v33];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setCreatedTime:", objc_msgSend(v34, "unsignedLongLongValue"));
    }

    if (a3) {
      id v35 = @"placeLayoutData";
    }
    else {
      id v35 = @"place_layout_data";
    }
    uint64_t v36 = [v5 objectForKeyedSubscript:v35];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v37 = [GEOPDPlacecardLayoutData alloc];
      if (v37)
      {
        uint64_t v38 = v37;
        id v39 = v36;
        v99 = [(GEOPDPlacecardLayoutData *)v38 init];
        if (v99)
        {
          if (a3) {
            uint64_t v40 = @"moduleConfiguration";
          }
          else {
            uint64_t v40 = @"module_configuration";
          }
          int v41 = [v39 objectForKeyedSubscript:v40];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v94 = v39;
            v95 = v36;
            id v96 = v5;
            long long v111 = 0u;
            long long v112 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            long long v93 = v41;
            obuint64_t j = v41;
            uint64_t v42 = [obj countByEnumeratingWithState:&v109 objects:v115 count:16];
            if (!v42) {
              goto LABEL_134;
            }
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v110;
            if (a3) {
              uint64_t v45 = @"moduleConfigurationType";
            }
            else {
              uint64_t v45 = @"module_configuration_type";
            }
            uint64_t v46 = @"module_configuration_value";
            if (a3) {
              uint64_t v46 = @"moduleConfigurationValue";
            }
            uint64_t v97 = v46;
            v98 = v45;
            while (1)
            {
              uint64_t v47 = 0;
              do
              {
                if (*(void *)v110 != v44) {
                  objc_enumerationMutation(obj);
                }
                v48 = *(void **)(*((void *)&v109 + 1) + 8 * v47);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v49 = [GEOPDModuleConfiguration alloc];
                  if (v49)
                  {
                    id v50 = v48;
                    uint64_t v49 = [(GEOPDModuleConfiguration *)v49 init];
                    if (v49)
                    {
                      uint64_t v51 = [v50 objectForKeyedSubscript:v98];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        a3 = v51;
                        if ([a3 isEqualToString:@"MODULE_CONFIGURATION_TYPE_UNKNOWN"])
                        {
                          int v52 = 0;
                        }
                        else if ([a3 isEqualToString:@"MODULE_CONFIGURATION_TYPE_PLACE_RIBBON"])
                        {
                          int v52 = 1;
                        }
                        else if ([a3 isEqualToString:@"MODULE_CONFIGURATION_TYPE_ACTIONS"])
                        {
                          int v52 = 2;
                        }
                        else if ([a3 isEqualToString:@"MODULE_CONFIGURATION_TYPE_RELATED_PLACE"])
                        {
                          int v52 = 3;
                        }
                        else if ([a3 isEqualToString:@"MODULE_CONFIGURATION_TYPE_WEB_CONTENT"])
                        {
                          int v52 = 4;
                        }
                        else if ([a3 isEqualToString:@"MODULE_CONFIGURATION_TYPE_TEMPLATE_PLACE"])
                        {
                          int v52 = 5;
                        }
                        else if ([a3 isEqualToString:@"MODULE_CONFIGURATION_TYPE_PLACE_INFOS"])
                        {
                          int v52 = 6;
                        }
                        else if ([a3 isEqualToString:@"MODULE_CONFIGURATION_TYPE_BUSINESS_INFOS"])
                        {
                          int v52 = 7;
                        }
                        else if ([a3 isEqualToString:@"MODULE_CONFIGURATION_TYPE_HEADER_BUTTONS"])
                        {
                          int v52 = 8;
                        }
                        else if ([a3 isEqualToString:@"MODULE_CONFIGURATION_TYPE_UNIFIED_ACTIONS"])
                        {
                          int v52 = 9;
                        }
                        else if ([a3 isEqualToString:@"MODULE_CONFIGURATION_TYPE_HIKING_ASSOCIATION"])
                        {
                          int v52 = 10;
                        }
                        else
                        {
                          int v52 = 0;
                        }

                        LODWORD(a3) = v14;
LABEL_122:
                        *(unsigned char *)&v49->_flags |= 1u;
                        v49->_moduleConfigurationType = v52;
                      }
                      else
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          int v52 = [v51 intValue];
                          goto LABEL_122;
                        }
                      }

                      uint64_t v53 = [v50 objectForKeyedSubscript:v97];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v54 = [GEOPDModuleConfigurationValue alloc];
                        if (v54) {
                          id v55 = -[GEOPDModuleConfigurationValue _initWithDictionary:isJSON:](v54, v53, (int)a3);
                        }
                        else {
                          id v55 = 0;
                        }
                        -[GEOPDModuleConfiguration setModuleConfigurationValue:]((uint64_t)v49, v55);
                      }
                    }
                  }
                  -[GEOPDPlacecardLayoutData addModuleConfiguration:]((uint64_t)v99, v49);
                }
                ++v47;
              }
              while (v43 != v47);
              uint64_t v56 = [obj countByEnumeratingWithState:&v109 objects:v115 count:16];
              uint64_t v43 = v56;
              if (!v56)
              {
LABEL_134:

                uint64_t v36 = v95;
                id v5 = v96;
                int v41 = v93;
                id v39 = v94;
                break;
              }
            }
          }

          if (a3) {
            uint64_t v57 = @"layoutConfiguration";
          }
          else {
            uint64_t v57 = @"layout_configuration";
          }
          id v58 = objc_msgSend(v39, "objectForKeyedSubscript:", v57, v93, v94, v95, v96);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v59 = [GEOPDPlacecardLayoutConfiguration alloc];
            if (a3) {
              uint64_t v60 = [(GEOPDPlacecardLayoutConfiguration *)v59 initWithJSON:v58];
            }
            else {
              uint64_t v60 = [(GEOPDPlacecardLayoutConfiguration *)v59 initWithDictionary:v58];
            }
            uint64_t v61 = v60;
            -[GEOPDPlacecardLayoutData setLayoutConfiguration:]((uint64_t)v99, v60);
          }
        }
      }
      else
      {
        v99 = 0;
      }
      [v6 setPlaceLayoutData:v99];
    }
    if (a3) {
      id v62 = @"isPartiallyClientizedSearchResult";
    }
    else {
      id v62 = @"is_partially_clientized_search_result";
    }
    long long v63 = [v5 objectForKeyedSubscript:v62];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setIsPartiallyClientizedSearchResult:", objc_msgSend(v63, "BOOLValue"));
    }

    long long v64 = [v5 objectForKeyedSubscript:@"mapDisplayType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v65 = v64;
      if ([v65 isEqualToString:@"DEFAULT"]) {
        uint64_t v66 = 0;
      }
      else {
        uint64_t v66 = [v65 isEqualToString:@"TOPOGRAPHIC"];
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_159;
      }
      uint64_t v66 = [v64 intValue];
    }
    [v6 setMapDisplayType:v66];
LABEL_159:

    if (a3) {
      uint64_t v67 = @"abExpBranchId";
    }
    else {
      uint64_t v67 = @"ab_exp_branch_id";
    }
    uint64_t v68 = [v5 objectForKeyedSubscript:v67];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v69 = v68;
      uint64_t v70 = [v69 countByEnumeratingWithState:&v101 objects:v113 count:16];
      if (v70)
      {
        uint64_t v71 = v70;
        uint64_t v72 = *(void *)v102;
        do
        {
          for (uint64_t i = 0; i != v71; ++i)
          {
            if (*(void *)v102 != v72) {
              objc_enumerationMutation(v69);
            }
            uint64_t v74 = *(void **)(*((void *)&v101 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v75 = (void *)[v74 copy];
              [v6 addAbExpBranchId:v75];
            }
          }
          uint64_t v71 = [v69 countByEnumeratingWithState:&v101 objects:v113 count:16];
        }
        while (v71);
      }
    }
    if (a3) {
      v76 = @"rapFlowType";
    }
    else {
      v76 = @"rap_flow_type";
    }
    v77 = [v5 objectForKeyedSubscript:v76];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v78 = v77;
      if ([v78 isEqualToString:@"RAP_FLOW_UNKNOWN"])
      {
        uint64_t v79 = 0;
      }
      else if ([v78 isEqualToString:@"RAP_FLOW_POI"])
      {
        uint64_t v79 = 1;
      }
      else if ([v78 isEqualToString:@"RAP_FLOW_LOCALITY"])
      {
        uint64_t v79 = 2;
      }
      else if ([v78 isEqualToString:@"RAP_FLOW_EV"])
      {
        uint64_t v79 = 3;
      }
      else if ([v78 isEqualToString:@"RAP_FLOW_HIKING_TRAIL"])
      {
        uint64_t v79 = 4;
      }
      else if ([v78 isEqualToString:@"RAP_FLOW_HIKING_TRAILHEAD"])
      {
        uint64_t v79 = 5;
      }
      else if ([v78 isEqualToString:@"RAP_FLOW_ADDRESS"])
      {
        uint64_t v79 = 6;
      }
      else if ([v78 isEqualToString:@"RAP_FLOW_TRANSIT"])
      {
        uint64_t v79 = 7;
      }
      else
      {
        uint64_t v79 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_198;
      }
      uint64_t v79 = [v77 intValue];
    }
    [v6 setRapFlowType:v79];
LABEL_198:

    uint64_t v80 = [v5 objectForKeyedSubscript:@"referenceFrame"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v81 = v80;
      if ([v81 isEqualToString:@"UNKNOWN"])
      {
        uint64_t v82 = 0;
      }
      else if ([v81 isEqualToString:@"WGS84"])
      {
        uint64_t v82 = 1;
      }
      else if ([v81 isEqualToString:@"CHINA_SHIFTED"])
      {
        uint64_t v82 = 2;
      }
      else
      {
        uint64_t v82 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_210:

        if (a3) {
          long long v83 = @"requestData";
        }
        else {
          long long v83 = @"request_data";
        }
        long long v84 = [v5 objectForKeyedSubscript:v83];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v85 = [GEOMapItemInitialRequestData alloc];
          if (a3) {
            uint64_t v86 = [(GEOMapItemInitialRequestData *)v85 initWithJSON:v84];
          }
          else {
            uint64_t v86 = [(GEOMapItemInitialRequestData *)v85 initWithDictionary:v84];
          }
          long long v87 = (void *)v86;
          [v6 setRequestData:v86];
        }
        long long v88 = [v5 objectForKeyedSubscript:@"placeCacheKey"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v89 = (void *)[v88 copy];
          [v6 setPlaceCacheKey:v89];
        }
        if (a3) {
          long long v90 = @"nilPlace";
        }
        else {
          long long v90 = @"nil_place";
        }
        long long v91 = [v5 objectForKeyedSubscript:v90];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "setNilPlace:", objc_msgSend(v91, "BOOLValue"));
        }

        goto LABEL_226;
      }
      uint64_t v82 = [v80 intValue];
    }
    [v6 setReferenceFrame:v82];
    goto LABEL_210;
  }
LABEL_226:

  return v6;
}

- (GEOPDPlace)initWithJSON:(id)a3
{
  return (GEOPDPlace *)-[GEOPDPlace _initWithDictionary:isJSON:](self, a3, (id)1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceIsValid((char *)a3);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[GEOPDPlace _readComponents]((uint64_t)self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_components;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (-[GEOPDComponent hasGreenTeaWithValue:](*(void *)(*((void *)&v11 + 1) + 8 * v9), v3))
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[GEOPDPlace _readMapsId]((uint64_t)self);
  if (-[GEOPDMapsIdentifier hasGreenTeaWithValue:](self->_mapsId, "hasGreenTeaWithValue:", v3, (void)v11)) {
    return 1;
  }
  -[GEOPDPlace _readRequestData]((uint64_t)self);
  return [(GEOMapItemInitialRequestData *)self->_requestData hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v18 = (id *)a3;
  [(GEOPDPlace *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v18 + 1, self->_reader);
  *((_DWORD *)v18 + 26) = self->_readerMarkPos;
  *((_DWORD *)v18 + 27) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  $E293E9EAAB2B8016EDB279585BF8500E flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_3;
    }
LABEL_41:
    *((_DWORD *)v18 + 33) = self->_status;
    *((_DWORD *)v18 + 35) |= 0x100u;
    if ((*(_DWORD *)&self->_flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v18[7] = self->_muid;
  *((_DWORD *)v18 + 35) |= 2u;
  $E293E9EAAB2B8016EDB279585BF8500E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) != 0) {
    goto LABEL_41;
  }
LABEL_3:
  if ((*(unsigned char *)&flags & 4) != 0)
  {
LABEL_4:
    v18[10] = self->_preferredMuid;
    *((_DWORD *)v18 + 35) |= 4u;
  }
LABEL_5:
  if ([(GEOPDPlace *)self componentsCount])
  {
    [v18 clearComponents];
    unint64_t v5 = [(GEOPDPlace *)self componentsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOPDPlace *)self componentAtIndex:i];
        [v18 addComponent:v8];
      }
    }
  }
  $E293E9EAAB2B8016EDB279585BF8500E v9 = self->_flags;
  uint64_t v10 = v18;
  if ((*(unsigned char *)&v9 & 0x80) != 0)
  {
    *((_DWORD *)v18 + 32) = self->_resultProviderId;
    *((_DWORD *)v18 + 35) |= 0x80u;
    $E293E9EAAB2B8016EDB279585BF8500E v9 = self->_flags;
  }
  if ((*(unsigned char *)&v9 & 8) != 0)
  {
    v18[12] = self->_updateVersion;
    *((_DWORD *)v18 + 35) |= 8u;
  }
  if (self->_mapsId)
  {
    objc_msgSend(v18, "setMapsId:");
    uint64_t v10 = v18;
  }
  if (*(unsigned char *)&self->_flags)
  {
    v10[5] = self->_createdTime;
    *((_DWORD *)v10 + 35) |= 1u;
  }
  if (self->_placeLayoutData)
  {
    objc_msgSend(v18, "setPlaceLayoutData:");
    uint64_t v10 = v18;
  }
  $E293E9EAAB2B8016EDB279585BF8500E v11 = self->_flags;
  if ((*(_WORD *)&v11 & 0x200) != 0)
  {
    *((unsigned char *)v10 + 136) = self->_isPartiallyClientizedSearchResult;
    *((_DWORD *)v10 + 35) |= 0x200u;
    $E293E9EAAB2B8016EDB279585BF8500E v11 = self->_flags;
  }
  if ((*(unsigned char *)&v11 & 0x10) != 0)
  {
    *((_DWORD *)v10 + 29) = self->_mapDisplayType;
    *((_DWORD *)v10 + 35) |= 0x10u;
  }
  if ([(GEOPDPlace *)self abExpBranchIdsCount])
  {
    [v18 clearAbExpBranchIds];
    unint64_t v12 = [(GEOPDPlace *)self abExpBranchIdsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t j = 0; j != v13; ++j)
      {
        id v15 = [(GEOPDPlace *)self abExpBranchIdAtIndex:j];
        [v18 addAbExpBranchId:v15];
      }
    }
  }
  $E293E9EAAB2B8016EDB279585BF8500E v16 = self->_flags;
  uint64_t v17 = v18;
  if ((*(unsigned char *)&v16 & 0x20) != 0)
  {
    *((_DWORD *)v18 + 30) = self->_rapFlowType;
    *((_DWORD *)v18 + 35) |= 0x20u;
    $E293E9EAAB2B8016EDB279585BF8500E v16 = self->_flags;
  }
  if ((*(unsigned char *)&v16 & 0x40) != 0)
  {
    *((_DWORD *)v18 + 31) = self->_referenceFrame;
    *((_DWORD *)v18 + 35) |= 0x40u;
  }
  if (self->_requestData)
  {
    objc_msgSend(v18, "setRequestData:");
    uint64_t v17 = v18;
  }
  if (self->_placeCacheKey)
  {
    objc_msgSend(v18, "setPlaceCacheKey:");
    uint64_t v17 = v18;
  }
  if ((*((unsigned char *)&self->_flags + 1) & 4) != 0)
  {
    *((unsigned char *)v17 + 137) = self->_nilPlace;
    *((_DWORD *)v17 + 35) |= 0x400u;
  }
}

- (unint64_t)hash
{
  [(GEOPDPlace *)self readAll:1];
  $E293E9EAAB2B8016EDB279585BF8500E flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
    unint64_t v24 = 0;
    if ((*(_WORD *)&flags & 0x100) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v23 = 0;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v24 = 2654435761u * self->_muid;
  if ((*(_WORD *)&flags & 0x100) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v23 = 2654435761 * self->_status;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
LABEL_4:
    unint64_t v22 = 2654435761u * self->_preferredMuid;
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v22 = 0;
LABEL_8:
  uint64_t v21 = [(NSMutableArray *)self->_components hash];
  $E293E9EAAB2B8016EDB279585BF8500E v4 = self->_flags;
  if ((*(unsigned char *)&v4 & 0x80) != 0)
  {
    uint64_t v20 = 2654435761 * self->_resultProviderId;
    if ((*(unsigned char *)&v4 & 8) != 0) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v20 = 0;
    if ((*(unsigned char *)&v4 & 8) != 0)
    {
LABEL_10:
      unint64_t v19 = 2654435761u * self->_updateVersion;
      goto LABEL_13;
    }
  }
  unint64_t v19 = 0;
LABEL_13:
  unint64_t v18 = [(GEOPDMapsIdentifier *)self->_mapsId hash];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v17 = 2654435761u * self->_createdTime;
  }
  else {
    unint64_t v17 = 0;
  }
  unint64_t v16 = [(GEOPDPlacecardLayoutData *)self->_placeLayoutData hash];
  $E293E9EAAB2B8016EDB279585BF8500E v5 = self->_flags;
  if ((*(_WORD *)&v5 & 0x200) != 0)
  {
    uint64_t v6 = 2654435761 * self->_isPartiallyClientizedSearchResult;
    if ((*(unsigned char *)&v5 & 0x10) != 0) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&v5 & 0x10) != 0)
    {
LABEL_18:
      uint64_t v7 = 2654435761 * self->_mapDisplayType;
      goto LABEL_21;
    }
  }
  uint64_t v7 = 0;
LABEL_21:
  uint64_t v8 = [(NSMutableArray *)self->_abExpBranchIds hash];
  $E293E9EAAB2B8016EDB279585BF8500E v9 = self->_flags;
  if ((*(unsigned char *)&v9 & 0x20) != 0)
  {
    uint64_t v10 = 2654435761 * self->_rapFlowType;
    if ((*(unsigned char *)&v9 & 0x40) != 0) {
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(unsigned char *)&v9 & 0x40) != 0)
    {
LABEL_23:
      uint64_t v11 = 2654435761 * self->_referenceFrame;
      goto LABEL_26;
    }
  }
  uint64_t v11 = 0;
LABEL_26:
  unint64_t v12 = [(GEOMapItemInitialRequestData *)self->_requestData hash];
  NSUInteger v13 = [(NSString *)self->_placeCacheKey hash];
  if ((*((unsigned char *)&self->_flags + 1) & 4) != 0) {
    uint64_t v14 = 2654435761 * self->_nilPlace;
  }
  else {
    uint64_t v14 = 0;
  }
  return v23 ^ v24 ^ v22 ^ v20 ^ v19 ^ v21 ^ v18 ^ v17 ^ v16 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  int v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 2) != 0)
  {
    self->_muid = *((void *)v4 + 7);
    *(_DWORD *)&self->_flags |= 2u;
    int v5 = *((_DWORD *)v4 + 35);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_status = *((_DWORD *)v4 + 33);
  *(_DWORD *)&self->_flags |= 0x100u;
  if ((*((_DWORD *)v4 + 35) & 4) != 0)
  {
LABEL_4:
    self->_preferredMuid = *((void *)v4 + 10);
    *(_DWORD *)&self->_flags |= 4u;
  }
LABEL_5:
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = *((id *)v4 + 4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        [(GEOPDPlace *)self addComponent:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v8);
  }

  int v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x80) != 0)
  {
    self->_resultProviderId = *((_DWORD *)v4 + 32);
    *(_DWORD *)&self->_flags |= 0x80u;
    int v11 = *((_DWORD *)v4 + 35);
  }
  if ((v11 & 8) != 0)
  {
    self->_updateVersion = *((void *)v4 + 12);
    *(_DWORD *)&self->_flags |= 8u;
  }
  mapsId = self->_mapsId;
  uint64_t v13 = *((void *)v4 + 6);
  if (mapsId)
  {
    if (v13) {
      -[GEOPDMapsIdentifier mergeFrom:](mapsId, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEOPDPlace setMapsId:](self, "setMapsId:");
  }
  if (*((unsigned char *)v4 + 140))
  {
    self->_createdTime = *((void *)v4 + 5);
    *(_DWORD *)&self->_flags |= 1u;
  }
  placeLayoutData = self->_placeLayoutData;
  id v15 = (void *)*((void *)v4 + 9);
  if (placeLayoutData)
  {
    if (v15)
    {
      unint64_t v16 = v15;
      -[GEOPDPlacecardLayoutData readAll:]((uint64_t)v16, 0);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v17 = v16[4];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v42 != v20) {
              objc_enumerationMutation(v17);
            }
            -[GEOPDPlacecardLayoutData addModuleConfiguration:]((uint64_t)placeLayoutData, *(void **)(*((void *)&v41 + 1) + 8 * j));
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v19);
      }

      layoutConfiguration = placeLayoutData->_layoutConfiguration;
      uint64_t v23 = v16[3];
      if (layoutConfiguration)
      {
        if (v23) {
          -[GEOPDPlacecardLayoutConfiguration mergeFrom:](layoutConfiguration, "mergeFrom:");
        }
      }
      else if (v23)
      {
        -[GEOPDPlacecardLayoutData setLayoutConfiguration:]((uint64_t)placeLayoutData, v16[3]);
      }
    }
  }
  else if (v15)
  {
    [(GEOPDPlace *)self setPlaceLayoutData:"setPlaceLayoutData:"];
  }
  int v24 = *((_DWORD *)v4 + 35);
  if ((v24 & 0x200) != 0)
  {
    self->_isPartiallyClientizedSearchResult = *((unsigned char *)v4 + 136);
    *(_DWORD *)&self->_flags |= 0x200u;
    int v24 = *((_DWORD *)v4 + 35);
  }
  if ((v24 & 0x10) != 0)
  {
    self->_mapDisplayType = *((_DWORD *)v4 + 29);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v25 = *((id *)v4 + 3);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(v25);
        }
        -[GEOPDPlace addAbExpBranchId:](self, "addAbExpBranchId:", *(void *)(*((void *)&v33 + 1) + 8 * k), (void)v33);
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v27);
  }

  int v30 = *((_DWORD *)v4 + 35);
  if ((v30 & 0x20) != 0)
  {
    self->_rapFlowType = *((_DWORD *)v4 + 30);
    *(_DWORD *)&self->_flags |= 0x20u;
    int v30 = *((_DWORD *)v4 + 35);
  }
  if ((v30 & 0x40) != 0)
  {
    self->_referenceFrame = *((_DWORD *)v4 + 31);
    *(_DWORD *)&self->_flags |= 0x40u;
  }
  requestData = self->_requestData;
  uint64_t v32 = *((void *)v4 + 11);
  if (requestData)
  {
    if (v32) {
      -[GEOMapItemInitialRequestData mergeFrom:](requestData, "mergeFrom:");
    }
  }
  else if (v32)
  {
    -[GEOPDPlace setRequestData:](self, "setRequestData:");
  }
  if (*((void *)v4 + 8)) {
    -[GEOPDPlace setPlaceCacheKey:](self, "setPlaceCacheKey:");
  }
  if ((*((unsigned char *)v4 + 141) & 4) != 0)
  {
    self->_nilPlace = *((unsigned char *)v4 + 137);
    *(_DWORD *)&self->_flags |= 0x400u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 1) & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      int v5 = reader;
      objc_sync_enter(v5);
      GEOPDPlaceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_7054);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)setHasReferenceFrame:(BOOL)a3
{
  if (a3) {
    int v3 = 262208;
  }
  else {
    int v3 = 0x40000;
  }
  self->_$E293E9EAAB2B8016EDB279585BF8500E flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (void)_readPlaceCacheKey
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 141) & 0x80) == 0)
    {
      id v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceCacheKey_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasPlaceCacheKey
{
  return self->_placeCacheKey != 0;
}

- (NSString)placeCacheKey
{
  -[GEOPDPlace _readPlaceCacheKey]((uint64_t)self);
  placeCacheKey = self->_placeCacheKey;

  return placeCacheKey;
}

- (void)setPlaceCacheKey:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x48000u;
  objc_storeStrong((id *)&self->_placeCacheKey, a3);
}

- (BOOL)nilPlace
{
  return self->_nilPlace;
}

- (void)setHasNilPlace:(BOOL)a3
{
  if (a3) {
    int v3 = 263168;
  }
  else {
    int v3 = 0x40000;
  }
  self->_$E293E9EAAB2B8016EDB279585BF8500E flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasNilPlace
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (id)geoMapItem
{
  return [(GEOPDPlace *)self geoMapItemWithDetourInfo:0];
}

- (id)geoMapItemWithDetourInfo:(id)a3
{
  id v4 = a3;
  int v5 = [[_GEOPlaceDataItem alloc] initWithPlaceData:self detourInfo:v4];

  return v5;
}

@end