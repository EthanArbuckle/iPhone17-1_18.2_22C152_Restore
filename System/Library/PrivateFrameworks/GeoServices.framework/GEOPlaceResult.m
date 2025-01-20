@interface GEOPlaceResult
+ (BOOL)isValid:(id)a3;
+ (Class)additionalPlaceType;
+ (Class)disambiguationLabelType;
+ (Class)matchedTokenType;
+ (Class)namedFeatureType;
+ (Class)namedFieldType;
+ (Class)unmatchedStringType;
- (BOOL)hasCacheControl;
- (BOOL)hasFlyoverTourMuid;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasQuad;
- (BOOL)hasRevgeoRequestTemplate;
- (BOOL)hasSuggestedQuery;
- (BOOL)hasTokenEntity;
- (BOOL)hasTravelDistance;
- (BOOL)hasTravelTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAddress)tokenEntity;
- (GEOPlace)place;
- (GEOPlaceResult)init;
- (GEOPlaceResult)initWithData:(id)a3;
- (GEOPlaceResult)initWithDictionary:(id)a3;
- (GEOPlaceResult)initWithJSON:(id)a3;
- (GEOPlaceSearchRequest)revgeoRequestTemplate;
- (NSMutableArray)additionalPlaces;
- (NSMutableArray)disambiguationLabels;
- (NSMutableArray)matchedTokens;
- (NSMutableArray)namedFeatures;
- (NSMutableArray)namedFields;
- (NSMutableArray)unmatchedStrings;
- (NSString)quad;
- (NSString)suggestedQuery;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)additionalPlaceAtIndex:(unint64_t)a3;
- (id)cacheControlAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)disambiguationLabelAtIndex:(unint64_t)a3;
- (id)geoMapItem;
- (id)jsonRepresentation;
- (id)matchedTokenAtIndex:(unint64_t)a3;
- (id)namedFeatureAtIndex:(unint64_t)a3;
- (id)namedFieldAtIndex:(unint64_t)a3;
- (id)unmatchedStringAtIndex:(unint64_t)a3;
- (int)StringAsCacheControl:(id)a3;
- (int)cacheControl;
- (unint64_t)additionalPlacesCount;
- (unint64_t)disambiguationLabelsCount;
- (unint64_t)flyoverTourMuid;
- (unint64_t)hash;
- (unint64_t)matchedTokensCount;
- (unint64_t)namedFeaturesCount;
- (unint64_t)namedFieldsCount;
- (unint64_t)unmatchedStringsCount;
- (unsigned)travelDistance;
- (unsigned)travelTime;
- (void)_addNoFlagsAdditionalPlace:(uint64_t)a1;
- (void)_addNoFlagsDisambiguationLabel:(uint64_t)a1;
- (void)_addNoFlagsMatchedToken:(uint64_t)a1;
- (void)_addNoFlagsNamedFeature:(uint64_t)a1;
- (void)_addNoFlagsNamedField:(uint64_t)a1;
- (void)_addNoFlagsUnmatchedString:(uint64_t)a1;
- (void)_initWithDictionary:(uint64_t)a3 isJSON:;
- (void)_readAdditionalPlaces;
- (void)_readDisambiguationLabels;
- (void)_readMatchedTokens;
- (void)_readNamedFeatures;
- (void)_readNamedFields;
- (void)_readPlace;
- (void)_readQuad;
- (void)_readRevgeoRequestTemplate;
- (void)_readSuggestedQuery;
- (void)_readTokenEntity;
- (void)_readUnmatchedStrings;
- (void)addAdditionalPlace:(id)a3;
- (void)addDisambiguationLabel:(id)a3;
- (void)addMatchedToken:(id)a3;
- (void)addNamedFeature:(id)a3;
- (void)addNamedField:(id)a3;
- (void)addUnmatchedString:(id)a3;
- (void)clearAdditionalPlaces;
- (void)clearDisambiguationLabels;
- (void)clearMatchedTokens;
- (void)clearNamedFeatures;
- (void)clearNamedFields;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearUnmatchedStrings;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAdditionalPlaces:(id)a3;
- (void)setCacheControl:(int)a3;
- (void)setDisambiguationLabels:(id)a3;
- (void)setFlyoverTourMuid:(unint64_t)a3;
- (void)setHasCacheControl:(BOOL)a3;
- (void)setHasFlyoverTourMuid:(BOOL)a3;
- (void)setHasTravelDistance:(BOOL)a3;
- (void)setHasTravelTime:(BOOL)a3;
- (void)setMatchedTokens:(id)a3;
- (void)setNamedFeatures:(id)a3;
- (void)setNamedFields:(id)a3;
- (void)setPlace:(id)a3;
- (void)setQuad:(id)a3;
- (void)setRevgeoRequestTemplate:(id)a3;
- (void)setSuggestedQuery:(id)a3;
- (void)setTokenEntity:(id)a3;
- (void)setTravelDistance:(unsigned int)a3;
- (void)setTravelTime:(unsigned int)a3;
- (void)setUnmatchedStrings:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPlaceResult

- (GEOPlaceResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceResult;
  v2 = [(GEOPlaceResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPlaceResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPlaceResult;
  v3 = [(GEOPlaceResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPlace
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 145) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlace_tags_5);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (GEOPlace)place
{
  -[GEOPlaceResult _readPlace]((uint64_t)self);
  place = self->_place;

  return place;
}

- (void)setPlace:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10400u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (void)_readAdditionalPlaces
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 144) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdditionalPlaces_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)additionalPlaces
{
  -[GEOPlaceResult _readAdditionalPlaces]((uint64_t)self);
  additionalPlaces = self->_additionalPlaces;

  return additionalPlaces;
}

- (void)setAdditionalPlaces:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  additionalPlaces = self->_additionalPlaces;
  self->_additionalPlaces = v4;
}

- (void)clearAdditionalPlaces
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  additionalPlaces = self->_additionalPlaces;

  [(NSMutableArray *)additionalPlaces removeAllObjects];
}

- (void)addAdditionalPlace:(id)a3
{
  id v4 = a3;
  -[GEOPlaceResult _readAdditionalPlaces]((uint64_t)self);
  -[GEOPlaceResult _addNoFlagsAdditionalPlace:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsAdditionalPlace:(uint64_t)a1
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

- (unint64_t)additionalPlacesCount
{
  -[GEOPlaceResult _readAdditionalPlaces]((uint64_t)self);
  additionalPlaces = self->_additionalPlaces;

  return [(NSMutableArray *)additionalPlaces count];
}

- (id)additionalPlaceAtIndex:(unint64_t)a3
{
  -[GEOPlaceResult _readAdditionalPlaces]((uint64_t)self);
  additionalPlaces = self->_additionalPlaces;

  return (id)[(NSMutableArray *)additionalPlaces objectAtIndex:a3];
}

+ (Class)additionalPlaceType
{
  return (Class)objc_opt_class();
}

- (void)_readSuggestedQuery
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 145) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestedQuery_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasSuggestedQuery
{
  return self->_suggestedQuery != 0;
}

- (NSString)suggestedQuery
{
  -[GEOPlaceResult _readSuggestedQuery]((uint64_t)self);
  suggestedQuery = self->_suggestedQuery;

  return suggestedQuery;
}

- (void)setSuggestedQuery:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x12000u;
  objc_storeStrong((id *)&self->_suggestedQuery, a3);
}

- (unsigned)travelTime
{
  return self->_travelTime;
}

- (void)setTravelTime:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10008u;
  self->_travelTime = a3;
}

- (void)setHasTravelTime:(BOOL)a3
{
  if (a3) {
    int v3 = 65544;
  }
  else {
    int v3 = 0x10000;
  }
  self->_flags = ($66C0C4ECE49E8B6147DBDEB385FCD304)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTravelTime
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)travelDistance
{
  return self->_travelDistance;
}

- (void)setTravelDistance:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10004u;
  self->_travelDistance = a3;
}

- (void)setHasTravelDistance:(BOOL)a3
{
  if (a3) {
    int v3 = 65540;
  }
  else {
    int v3 = 0x10000;
  }
  self->_flags = ($66C0C4ECE49E8B6147DBDEB385FCD304)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasTravelDistance
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readTokenEntity
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 145) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenEntity_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasTokenEntity
{
  return self->_tokenEntity != 0;
}

- (GEOAddress)tokenEntity
{
  -[GEOPlaceResult _readTokenEntity]((uint64_t)self);
  tokenEntity = self->_tokenEntity;

  return tokenEntity;
}

- (void)setTokenEntity:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x14000u;
  objc_storeStrong((id *)&self->_tokenEntity, a3);
}

- (void)_readQuad
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 145) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuad_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasQuad
{
  return self->_quad != 0;
}

- (NSString)quad
{
  -[GEOPlaceResult _readQuad]((uint64_t)self);
  quad = self->_quad;

  return quad;
}

- (void)setQuad:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10800u;
  objc_storeStrong((id *)&self->_quad, a3);
}

- (void)_readUnmatchedStrings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 145) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUnmatchedStrings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)unmatchedStrings
{
  -[GEOPlaceResult _readUnmatchedStrings]((uint64_t)self);
  unmatchedStrings = self->_unmatchedStrings;

  return unmatchedStrings;
}

- (void)setUnmatchedStrings:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  unmatchedStrings = self->_unmatchedStrings;
  self->_unmatchedStrings = v4;
}

- (void)clearUnmatchedStrings
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  unmatchedStrings = self->_unmatchedStrings;

  [(NSMutableArray *)unmatchedStrings removeAllObjects];
}

- (void)addUnmatchedString:(id)a3
{
  id v4 = a3;
  -[GEOPlaceResult _readUnmatchedStrings]((uint64_t)self);
  -[GEOPlaceResult _addNoFlagsUnmatchedString:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsUnmatchedString:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 112);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v5;

      id v4 = *(void **)(a1 + 112);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)unmatchedStringsCount
{
  -[GEOPlaceResult _readUnmatchedStrings]((uint64_t)self);
  unmatchedStrings = self->_unmatchedStrings;

  return [(NSMutableArray *)unmatchedStrings count];
}

- (id)unmatchedStringAtIndex:(unint64_t)a3
{
  -[GEOPlaceResult _readUnmatchedStrings]((uint64_t)self);
  unmatchedStrings = self->_unmatchedStrings;

  return (id)[(NSMutableArray *)unmatchedStrings objectAtIndex:a3];
}

+ (Class)unmatchedStringType
{
  return (Class)objc_opt_class();
}

- (void)_readNamedFeatures
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 145) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNamedFeatures_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)namedFeatures
{
  -[GEOPlaceResult _readNamedFeatures]((uint64_t)self);
  namedFeatures = self->_namedFeatures;

  return namedFeatures;
}

- (void)setNamedFeatures:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  namedFeatures = self->_namedFeatures;
  self->_namedFeatures = v4;
}

- (void)clearNamedFeatures
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  namedFeatures = self->_namedFeatures;

  [(NSMutableArray *)namedFeatures removeAllObjects];
}

- (void)addNamedFeature:(id)a3
{
  id v4 = a3;
  -[GEOPlaceResult _readNamedFeatures]((uint64_t)self);
  -[GEOPlaceResult _addNoFlagsNamedFeature:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsNamedFeature:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)namedFeaturesCount
{
  -[GEOPlaceResult _readNamedFeatures]((uint64_t)self);
  namedFeatures = self->_namedFeatures;

  return [(NSMutableArray *)namedFeatures count];
}

- (id)namedFeatureAtIndex:(unint64_t)a3
{
  -[GEOPlaceResult _readNamedFeatures]((uint64_t)self);
  namedFeatures = self->_namedFeatures;

  return (id)[(NSMutableArray *)namedFeatures objectAtIndex:a3];
}

+ (Class)namedFeatureType
{
  return (Class)objc_opt_class();
}

- (void)_readRevgeoRequestTemplate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 145) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRevgeoRequestTemplate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasRevgeoRequestTemplate
{
  return self->_revgeoRequestTemplate != 0;
}

- (GEOPlaceSearchRequest)revgeoRequestTemplate
{
  -[GEOPlaceResult _readRevgeoRequestTemplate]((uint64_t)self);
  revgeoRequestTemplate = self->_revgeoRequestTemplate;

  return revgeoRequestTemplate;
}

- (void)setRevgeoRequestTemplate:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x11000u;
  objc_storeStrong((id *)&self->_revgeoRequestTemplate, a3);
}

- (void)_readMatchedTokens
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 144) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMatchedTokens_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)matchedTokens
{
  -[GEOPlaceResult _readMatchedTokens]((uint64_t)self);
  matchedTokens = self->_matchedTokens;

  return matchedTokens;
}

- (void)setMatchedTokens:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  matchedTokens = self->_matchedTokens;
  self->_matchedTokens = v4;
}

- (void)clearMatchedTokens
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  matchedTokens = self->_matchedTokens;

  [(NSMutableArray *)matchedTokens removeAllObjects];
}

- (void)addMatchedToken:(id)a3
{
  id v4 = a3;
  -[GEOPlaceResult _readMatchedTokens]((uint64_t)self);
  -[GEOPlaceResult _addNoFlagsMatchedToken:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsMatchedToken:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)matchedTokensCount
{
  -[GEOPlaceResult _readMatchedTokens]((uint64_t)self);
  matchedTokens = self->_matchedTokens;

  return [(NSMutableArray *)matchedTokens count];
}

- (id)matchedTokenAtIndex:(unint64_t)a3
{
  -[GEOPlaceResult _readMatchedTokens]((uint64_t)self);
  matchedTokens = self->_matchedTokens;

  return (id)[(NSMutableArray *)matchedTokens objectAtIndex:a3];
}

+ (Class)matchedTokenType
{
  return (Class)objc_opt_class();
}

- (unint64_t)flyoverTourMuid
{
  return self->_flyoverTourMuid;
}

- (void)setFlyoverTourMuid:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x10001u;
  self->_flyoverTourMuid = a3;
}

- (void)setHasFlyoverTourMuid:(BOOL)a3
{
  self->_flags = ($66C0C4ECE49E8B6147DBDEB385FCD304)(*(_DWORD *)&self->_flags & 0xFFFEFFFE | a3 | 0x10000);
}

- (BOOL)hasFlyoverTourMuid
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)cacheControl
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $66C0C4ECE49E8B6147DBDEB385FCD304 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 2) != 0) {
    return self->_cacheControl;
  }
  else {
    return 0;
  }
}

- (void)setCacheControl:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10002u;
  self->_cacheControl = a3;
}

- (void)setHasCacheControl:(BOOL)a3
{
  if (a3) {
    int v3 = 65538;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$66C0C4ECE49E8B6147DBDEB385FCD304 flags = ($66C0C4ECE49E8B6147DBDEB385FCD304)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasCacheControl
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)cacheControlAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E7068[a3];
  }

  return v3;
}

- (int)StringAsCacheControl:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CACHEABILITY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UNCACHEABLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CACHEABLE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readDisambiguationLabels
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 144) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisambiguationLabels_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)disambiguationLabels
{
  -[GEOPlaceResult _readDisambiguationLabels]((uint64_t)self);
  disambiguationLabels = self->_disambiguationLabels;

  return disambiguationLabels;
}

- (void)setDisambiguationLabels:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  disambiguationLabels = self->_disambiguationLabels;
  self->_disambiguationLabels = v4;
}

- (void)clearDisambiguationLabels
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  disambiguationLabels = self->_disambiguationLabels;

  [(NSMutableArray *)disambiguationLabels removeAllObjects];
}

- (void)addDisambiguationLabel:(id)a3
{
  id v4 = a3;
  -[GEOPlaceResult _readDisambiguationLabels]((uint64_t)self);
  -[GEOPlaceResult _addNoFlagsDisambiguationLabel:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsDisambiguationLabel:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)disambiguationLabelsCount
{
  -[GEOPlaceResult _readDisambiguationLabels]((uint64_t)self);
  disambiguationLabels = self->_disambiguationLabels;

  return [(NSMutableArray *)disambiguationLabels count];
}

- (id)disambiguationLabelAtIndex:(unint64_t)a3
{
  -[GEOPlaceResult _readDisambiguationLabels]((uint64_t)self);
  disambiguationLabels = self->_disambiguationLabels;

  return (id)[(NSMutableArray *)disambiguationLabels objectAtIndex:a3];
}

+ (Class)disambiguationLabelType
{
  return (Class)objc_opt_class();
}

- (void)_readNamedFields
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 145) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNamedFields_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)namedFields
{
  -[GEOPlaceResult _readNamedFields]((uint64_t)self);
  namedFields = self->_namedFields;

  return namedFields;
}

- (void)setNamedFields:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  namedFields = self->_namedFields;
  self->_namedFields = v4;
}

- (void)clearNamedFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  namedFields = self->_namedFields;

  [(NSMutableArray *)namedFields removeAllObjects];
}

- (void)addNamedField:(id)a3
{
  id v4 = a3;
  -[GEOPlaceResult _readNamedFields]((uint64_t)self);
  -[GEOPlaceResult _addNoFlagsNamedField:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsNamedField:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)namedFieldsCount
{
  -[GEOPlaceResult _readNamedFields]((uint64_t)self);
  namedFields = self->_namedFields;

  return [(NSMutableArray *)namedFields count];
}

- (id)namedFieldAtIndex:(unint64_t)a3
{
  -[GEOPlaceResult _readNamedFields]((uint64_t)self);
  namedFields = self->_namedFields;

  return (id)[(NSMutableArray *)namedFields objectAtIndex:a3];
}

+ (Class)namedFieldType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPlaceResult;
  id v4 = [(GEOPlaceResult *)&v8 description];
  id v5 = [(GEOPlaceResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPlaceResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 place];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      id v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"place"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v9 = *(id *)(a1 + 24);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v92 objects:v100 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v93;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v93 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v92 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = [v14 dictionaryRepresentation];
            }
            [v8 addObject:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v92 objects:v100 count:16];
        }
        while (v11);
      }

      [v4 setObject:v8 forKey:@"additionalPlace"];
    }
    v16 = [(id)a1 suggestedQuery];
    if (v16) {
      [v4 setObject:v16 forKey:@"suggestedQuery"];
    }

    int v17 = *(_DWORD *)(a1 + 144);
    if ((v17 & 8) != 0)
    {
      v18 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 140)];
      [v4 setObject:v18 forKey:@"travelTime"];

      int v17 = *(_DWORD *)(a1 + 144);
    }
    if ((v17 & 4) != 0)
    {
      v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 136)];
      [v4 setObject:v19 forKey:@"travelDistance"];
    }
    v20 = [(id)a1 tokenEntity];
    v21 = v20;
    if (v20)
    {
      if (a2) {
        [v20 jsonRepresentation];
      }
      else {
      v22 = [v20 dictionaryRepresentation];
      }
      [v4 setObject:v22 forKey:@"tokenEntity"];
    }
    v23 = [(id)a1 quad];
    if (v23) {
      [v4 setObject:v23 forKey:@"quad"];
    }

    if (*(void *)(a1 + 112))
    {
      v24 = [(id)a1 unmatchedStrings];
      [v4 setObject:v24 forKey:@"unmatchedString"];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v26 = *(id *)(a1 + 56);
      uint64_t v27 = [v26 countByEnumeratingWithState:&v88 objects:v99 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v89;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v89 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v88 + 1) + 8 * j);
            if (a2) {
              [v31 jsonRepresentation];
            }
            else {
            v32 = [v31 dictionaryRepresentation];
            }
            [v25 addObject:v32];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v88 objects:v99 count:16];
        }
        while (v28);
      }

      [v4 setObject:v25 forKey:@"namedFeature"];
    }
    v33 = [(id)a1 revgeoRequestTemplate];
    v34 = v33;
    if (v33)
    {
      if (a2) {
        [v33 jsonRepresentation];
      }
      else {
      v35 = [v33 dictionaryRepresentation];
      }
      [v4 setObject:v35 forKey:@"revgeoRequestTemplate"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v37 = *(id *)(a1 + 48);
      uint64_t v38 = [v37 countByEnumeratingWithState:&v84 objects:v98 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v85;
        do
        {
          for (uint64_t k = 0; k != v39; ++k)
          {
            if (*(void *)v85 != v40) {
              objc_enumerationMutation(v37);
            }
            v42 = *(void **)(*((void *)&v84 + 1) + 8 * k);
            if (a2) {
              [v42 jsonRepresentation];
            }
            else {
            v43 = [v42 dictionaryRepresentation];
            }
            [v36 addObject:v43];
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v84 objects:v98 count:16];
        }
        while (v39);
      }

      [v4 setObject:v36 forKey:@"matchedToken"];
    }
    int v44 = *(_DWORD *)(a1 + 144);
    if (v44)
    {
      v45 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      if (a2) {
        v46 = @"flyoverTourMuid";
      }
      else {
        v46 = @"flyover_tour_muid";
      }
      [v4 setObject:v45 forKey:v46];

      int v44 = *(_DWORD *)(a1 + 144);
    }
    if ((v44 & 2) != 0)
    {
      uint64_t v47 = *(int *)(a1 + 132);
      if (v47 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 132));
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v48 = off_1E53E7068[v47];
      }
      if (a2) {
        v49 = @"cacheControl";
      }
      else {
        v49 = @"cache_control";
      }
      [v4 setObject:v48 forKey:v49];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v51 = *(id *)(a1 + 32);
      uint64_t v52 = [v51 countByEnumeratingWithState:&v80 objects:v97 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v81;
        do
        {
          for (uint64_t m = 0; m != v53; ++m)
          {
            if (*(void *)v81 != v54) {
              objc_enumerationMutation(v51);
            }
            v56 = *(void **)(*((void *)&v80 + 1) + 8 * m);
            if (a2) {
              [v56 jsonRepresentation];
            }
            else {
            v57 = [v56 dictionaryRepresentation];
            }
            [v50 addObject:v57];
          }
          uint64_t v53 = [v51 countByEnumeratingWithState:&v80 objects:v97 count:16];
        }
        while (v53);
      }

      if (a2) {
        v58 = @"disambiguationLabel";
      }
      else {
        v58 = @"disambiguation_label";
      }
      [v4 setObject:v50 forKey:v58];
    }
    if ([*(id *)(a1 + 64) count])
    {
      v59 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v60 = *(id *)(a1 + 64);
      uint64_t v61 = [v60 countByEnumeratingWithState:&v76 objects:v96 count:16];
      if (v61)
      {
        uint64_t v62 = v61;
        uint64_t v63 = *(void *)v77;
        do
        {
          for (uint64_t n = 0; n != v62; ++n)
          {
            if (*(void *)v77 != v63) {
              objc_enumerationMutation(v60);
            }
            v65 = *(void **)(*((void *)&v76 + 1) + 8 * n);
            if (a2) {
              [v65 jsonRepresentation];
            }
            else {
            v66 = [v65 dictionaryRepresentation];
            }
            [v59 addObject:v66];
          }
          uint64_t v62 = [v60 countByEnumeratingWithState:&v76 objects:v96 count:16];
        }
        while (v62);
      }

      [v4 setObject:v59 forKey:@"namedField"];
    }
    v67 = *(void **)(a1 + 16);
    if (v67)
    {
      v68 = [v67 dictionaryRepresentation];
      v69 = v68;
      if (a2)
      {
        v70 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v68, "count"));
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __44__GEOPlaceResult__dictionaryRepresentation___block_invoke;
        v74[3] = &unk_1E53D8860;
        id v71 = v70;
        id v75 = v71;
        [v69 enumerateKeysAndObjectsUsingBlock:v74];
        id v72 = v71;

        v69 = v72;
      }
      [v4 setObject:v69 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPlaceResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOPlaceResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPlaceResult)initWithDictionary:(id)a3
{
  return (GEOPlaceResult *)-[GEOPlaceResult _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(uint64_t)a3 isJSON:
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    objc_super v6 = 0;
    goto LABEL_137;
  }
  objc_super v6 = (void *)[a1 init];
  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:@"place"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v8 = [GEOPlace alloc];
      if (a3) {
        uint64_t v9 = [(GEOPlace *)v8 initWithJSON:v7];
      }
      else {
        uint64_t v9 = [(GEOPlace *)v8 initWithDictionary:v7];
      }
      id v10 = (void *)v9;
      [v6 setPlace:v9];
    }
    uint64_t v11 = [v5 objectForKeyedSubscript:@"additionalPlace"];
    objc_opt_class();
    id v98 = v5;
    if (objc_opt_isKindOfClass())
    {
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v120 objects:v129 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v121;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v121 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v120 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = [GEOPlace alloc];
              if (a3) {
                uint64_t v19 = [(GEOPlace *)v18 initWithJSON:v17];
              }
              else {
                uint64_t v19 = [(GEOPlace *)v18 initWithDictionary:v17];
              }
              v20 = (void *)v19;
              [v6 addAdditionalPlace:v19];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v120 objects:v129 count:16];
        }
        while (v14);
      }

      id v5 = v98;
    }

    v21 = [v5 objectForKeyedSubscript:@"suggestedQuery"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [v6 setSuggestedQuery:v22];
    }
    v23 = [v5 objectForKeyedSubscript:@"travelTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setTravelTime:", objc_msgSend(v23, "unsignedIntValue"));
    }

    v24 = [v5 objectForKeyedSubscript:@"travelDistance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setTravelDistance:", objc_msgSend(v24, "unsignedIntValue"));
    }

    v25 = [v5 objectForKeyedSubscript:@"tokenEntity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v26 = [GEOAddress alloc];
      if (a3) {
        uint64_t v27 = [(GEOAddress *)v26 initWithJSON:v25];
      }
      else {
        uint64_t v27 = [(GEOAddress *)v26 initWithDictionary:v25];
      }
      uint64_t v28 = (void *)v27;
      [v6 setTokenEntity:v27];
    }
    uint64_t v29 = [v5 objectForKeyedSubscript:@"quad"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = (void *)[v29 copy];
      [v6 setQuad:v30];
    }
    v31 = [v5 objectForKeyedSubscript:@"unmatchedString"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id v32 = v31;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v116 objects:v128 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v117;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v117 != v35) {
              objc_enumerationMutation(v32);
            }
            id v37 = *(void **)(*((void *)&v116 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v38 = (void *)[v37 copy];
              [v6 addUnmatchedString:v38];
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v116 objects:v128 count:16];
        }
        while (v34);
      }

      id v5 = v98;
    }

    uint64_t v39 = [v5 objectForKeyedSubscript:@"namedFeature"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id v40 = v39;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v112 objects:v127 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v113;
        do
        {
          for (uint64_t k = 0; k != v42; ++k)
          {
            if (*(void *)v113 != v43) {
              objc_enumerationMutation(v40);
            }
            uint64_t v45 = *(void *)(*((void *)&v112 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v46 = [GEONamedFeature alloc];
              if (a3) {
                uint64_t v47 = [(GEONamedFeature *)v46 initWithJSON:v45];
              }
              else {
                uint64_t v47 = [(GEONamedFeature *)v46 initWithDictionary:v45];
              }
              v48 = (void *)v47;
              [v6 addNamedFeature:v47];
            }
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v112 objects:v127 count:16];
        }
        while (v42);
      }

      id v5 = v98;
    }

    v49 = [v5 objectForKeyedSubscript:@"revgeoRequestTemplate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v50 = [GEOPlaceSearchRequest alloc];
      if (a3) {
        uint64_t v51 = [(GEOPlaceSearchRequest *)v50 initWithJSON:v49];
      }
      else {
        uint64_t v51 = [(GEOPlaceSearchRequest *)v50 initWithDictionary:v49];
      }
      uint64_t v52 = (void *)v51;
      [v6 setRevgeoRequestTemplate:v51];
    }
    uint64_t v53 = [v5 objectForKeyedSubscript:@"matchedToken"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id v54 = v53;
      uint64_t v55 = [v54 countByEnumeratingWithState:&v108 objects:v126 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v109;
        do
        {
          for (uint64_t m = 0; m != v56; ++m)
          {
            if (*(void *)v109 != v57) {
              objc_enumerationMutation(v54);
            }
            uint64_t v59 = *(void *)(*((void *)&v108 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v60 = [GEOMatchedToken alloc];
              if (a3) {
                uint64_t v61 = [(GEOMatchedToken *)v60 initWithJSON:v59];
              }
              else {
                uint64_t v61 = [(GEOMatchedToken *)v60 initWithDictionary:v59];
              }
              uint64_t v62 = (void *)v61;
              [v6 addMatchedToken:v61];
            }
          }
          uint64_t v56 = [v54 countByEnumeratingWithState:&v108 objects:v126 count:16];
        }
        while (v56);
      }

      id v5 = v98;
    }

    if (a3) {
      uint64_t v63 = @"flyoverTourMuid";
    }
    else {
      uint64_t v63 = @"flyover_tour_muid";
    }
    v64 = [v5 objectForKeyedSubscript:v63];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setFlyoverTourMuid:", objc_msgSend(v64, "unsignedLongLongValue"));
    }

    if (a3) {
      v65 = @"cacheControl";
    }
    else {
      v65 = @"cache_control";
    }
    v66 = [v5 objectForKeyedSubscript:v65];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v67 = v66;
      if ([v67 isEqualToString:@"UNKNOWN_CACHEABILITY"])
      {
        uint64_t v68 = 0;
      }
      else if ([v67 isEqualToString:@"UNCACHEABLE"])
      {
        uint64_t v68 = 1;
      }
      else if ([v67 isEqualToString:@"CACHEABLE"])
      {
        uint64_t v68 = 2;
      }
      else
      {
        uint64_t v68 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_99:

        if (a3) {
          v69 = @"disambiguationLabel";
        }
        else {
          v69 = @"disambiguation_label";
        }
        v70 = [v5 objectForKeyedSubscript:v69];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v106 = 0u;
          long long v107 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          v97 = v70;
          obuint64_t j = v70;
          uint64_t v71 = [obj countByEnumeratingWithState:&v104 objects:v125 count:16];
          if (v71)
          {
            uint64_t v72 = v71;
            uint64_t v73 = *(void *)v105;
            do
            {
              for (uint64_t n = 0; n != v72; ++n)
              {
                if (*(void *)v105 != v73) {
                  objc_enumerationMutation(obj);
                }
                id v75 = *(void **)(*((void *)&v104 + 1) + 8 * n);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v76 = [GEOLocalizedDisambiguationLabel alloc];
                  if (v76)
                  {
                    long long v77 = v6;
                    uint64_t v78 = a3;
                    id v79 = v75;
                    long long v76 = [(GEOLocalizedDisambiguationLabel *)v76 init];
                    if (v76)
                    {
                      long long v80 = [v79 objectForKeyedSubscript:@"locale"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v81 = (void *)[v80 copy];
                        id v82 = v81;
                        *(unsigned char *)&v76->_flags |= 2u;
                        *(unsigned char *)&v76->_flags |= 8u;
                        objc_storeStrong((id *)&v76->_locale, v81);
                      }
                      long long v83 = [v79 objectForKeyedSubscript:@"string"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v84 = (void *)[v83 copy];
                        id v85 = v84;
                        *(unsigned char *)&v76->_flags |= 4u;
                        *(unsigned char *)&v76->_flags |= 8u;
                        objc_storeStrong((id *)&v76->_string, v84);
                      }
                    }

                    a3 = v78;
                    objc_super v6 = v77;
                  }
                  [v6 addDisambiguationLabel:v76];
                }
              }
              uint64_t v72 = [obj countByEnumeratingWithState:&v104 objects:v125 count:16];
            }
            while (v72);
          }

          v70 = v97;
          id v5 = v98;
        }

        long long v86 = [v5 objectForKeyedSubscript:@"namedField"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v102 = 0u;
          long long v103 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          id v87 = v86;
          uint64_t v88 = [v87 countByEnumeratingWithState:&v100 objects:v124 count:16];
          if (v88)
          {
            uint64_t v89 = v88;
            uint64_t v90 = *(void *)v101;
            do
            {
              uint64_t v91 = 0;
              do
              {
                if (*(void *)v101 != v90) {
                  objc_enumerationMutation(v87);
                }
                long long v92 = *(void **)(*((void *)&v100 + 1) + 8 * v91);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v93 = [GEONamedField alloc];
                  if (v93) {
                    long long v94 = (void *)-[GEONamedField _initWithDictionary:isJSON:](v93, v92, a3);
                  }
                  else {
                    long long v94 = 0;
                  }
                  [v6 addNamedField:v94];
                }
                ++v91;
              }
              while (v89 != v91);
              uint64_t v95 = [v87 countByEnumeratingWithState:&v100 objects:v124 count:16];
              uint64_t v89 = v95;
            }
            while (v95);
          }

          id v5 = v98;
        }

        goto LABEL_137;
      }
      uint64_t v68 = [v66 intValue];
    }
    [v6 setCacheControl:v68];
    goto LABEL_99;
  }
LABEL_137:

  return v6;
}

- (GEOPlaceResult)initWithJSON:(id)a3
{
  return (GEOPlaceResult *)-[GEOPlaceResult _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_2108;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2109;
    }
    GEOPlaceResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPlaceResultCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPlaceResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPlaceResultIsDirty((uint64_t)self) & 1) == 0)
  {
    id v32 = self->_reader;
    objc_sync_enter(v32);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v33 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v33];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v32);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPlaceResult *)self readAll:0];
    PBDataWriterWriteSubmessage();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    objc_super v6 = self->_additionalPlaces;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v55;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v55 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v54 objects:v63 count:16];
      }
      while (v7);
    }

    if (self->_suggestedQuery) {
      PBDataWriterWriteStringField();
    }
    $66C0C4ECE49E8B6147DBDEB385FCD304 flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      $66C0C4ECE49E8B6147DBDEB385FCD304 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_tokenEntity) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_quad) {
      PBDataWriterWriteStringField();
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v11 = self->_unmatchedStrings;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v50 objects:v62 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v51;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v51 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteStringField();
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v50 objects:v62 count:16];
      }
      while (v12);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v15 = self->_namedFeatures;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v46 objects:v61 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v47;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v47 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteSubmessage();
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v46 objects:v61 count:16];
      }
      while (v16);
    }

    if (self->_revgeoRequestTemplate) {
      PBDataWriterWriteSubmessage();
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v19 = self->_matchedTokens;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v42 objects:v60 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v43;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v19);
          }
          PBDataWriterWriteSubmessage();
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v42 objects:v60 count:16];
      }
      while (v20);
    }

    $66C0C4ECE49E8B6147DBDEB385FCD304 v23 = self->_flags;
    if (*(unsigned char *)&v23)
    {
      PBDataWriterWriteUint64Field();
      $66C0C4ECE49E8B6147DBDEB385FCD304 v23 = self->_flags;
    }
    if ((*(unsigned char *)&v23 & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v24 = self->_disambiguationLabels;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v38 objects:v59 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v39;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v39 != v26) {
            objc_enumerationMutation(v24);
          }
          PBDataWriterWriteSubmessage();
          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v38 objects:v59 count:16];
      }
      while (v25);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v28 = self->_namedFields;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v34 objects:v58 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v35;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v35 != v30) {
            objc_enumerationMutation(v28);
          }
          PBDataWriterWriteSubmessage();
          ++v31;
        }
        while (v29 != v31);
        uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v34 objects:v58 count:16];
      }
      while (v29);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v34);
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[GEOPlaceResult _readAdditionalPlaces]((uint64_t)self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_additionalPlaces;
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
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (void)v11))
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

  -[GEOPlaceResult _readPlace]((uint64_t)self);
  if ([(GEOPlace *)self->_place hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPlaceResult _readRevgeoRequestTemplate]((uint64_t)self);
  return [(GEOPlaceSearchRequest *)self->_revgeoRequestTemplate hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v30 = (id *)a3;
  [(GEOPlaceResult *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v30 + 1, self->_reader);
  *((_DWORD *)v30 + 30) = self->_readerMarkPos;
  *((_DWORD *)v30 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  [v30 setPlace:self->_place];
  if ([(GEOPlaceResult *)self additionalPlacesCount])
  {
    [v30 clearAdditionalPlaces];
    unint64_t v4 = [(GEOPlaceResult *)self additionalPlacesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPlaceResult *)self additionalPlaceAtIndex:i];
        [v30 addAdditionalPlace:v7];
      }
    }
  }
  if (self->_suggestedQuery) {
    objc_msgSend(v30, "setSuggestedQuery:");
  }
  $66C0C4ECE49E8B6147DBDEB385FCD304 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    *((_DWORD *)v30 + 35) = self->_travelTime;
    *((_DWORD *)v30 + 36) |= 8u;
    $66C0C4ECE49E8B6147DBDEB385FCD304 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    *((_DWORD *)v30 + 34) = self->_travelDistance;
    *((_DWORD *)v30 + 36) |= 4u;
  }
  if (self->_tokenEntity) {
    objc_msgSend(v30, "setTokenEntity:");
  }
  if (self->_quad) {
    objc_msgSend(v30, "setQuad:");
  }
  if ([(GEOPlaceResult *)self unmatchedStringsCount])
  {
    [v30 clearUnmatchedStrings];
    unint64_t v9 = [(GEOPlaceResult *)self unmatchedStringsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        long long v12 = [(GEOPlaceResult *)self unmatchedStringAtIndex:j];
        [v30 addUnmatchedString:v12];
      }
    }
  }
  if ([(GEOPlaceResult *)self namedFeaturesCount])
  {
    [v30 clearNamedFeatures];
    unint64_t v13 = [(GEOPlaceResult *)self namedFeaturesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(GEOPlaceResult *)self namedFeatureAtIndex:k];
        [v30 addNamedFeature:v16];
      }
    }
  }
  if (self->_revgeoRequestTemplate) {
    objc_msgSend(v30, "setRevgeoRequestTemplate:");
  }
  if ([(GEOPlaceResult *)self matchedTokensCount])
  {
    [v30 clearMatchedTokens];
    unint64_t v17 = [(GEOPlaceResult *)self matchedTokensCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        uint64_t v20 = [(GEOPlaceResult *)self matchedTokenAtIndex:m];
        [v30 addMatchedToken:v20];
      }
    }
  }
  $66C0C4ECE49E8B6147DBDEB385FCD304 v21 = self->_flags;
  if (*(unsigned char *)&v21)
  {
    v30[5] = self->_flyoverTourMuid;
    *((_DWORD *)v30 + 36) |= 1u;
    $66C0C4ECE49E8B6147DBDEB385FCD304 v21 = self->_flags;
  }
  if ((*(unsigned char *)&v21 & 2) != 0)
  {
    *((_DWORD *)v30 + 33) = self->_cacheControl;
    *((_DWORD *)v30 + 36) |= 2u;
  }
  if ([(GEOPlaceResult *)self disambiguationLabelsCount])
  {
    [v30 clearDisambiguationLabels];
    unint64_t v22 = [(GEOPlaceResult *)self disambiguationLabelsCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (uint64_t n = 0; n != v23; ++n)
      {
        uint64_t v25 = [(GEOPlaceResult *)self disambiguationLabelAtIndex:n];
        [v30 addDisambiguationLabel:v25];
      }
    }
  }
  if ([(GEOPlaceResult *)self namedFieldsCount])
  {
    [v30 clearNamedFields];
    unint64_t v26 = [(GEOPlaceResult *)self namedFieldsCount];
    if (v26)
    {
      unint64_t v27 = v26;
      for (iuint64_t i = 0; ii != v27; ++ii)
      {
        uint64_t v29 = [(GEOPlaceResult *)self namedFieldAtIndex:ii];
        [v30 addNamedField:v29];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 1) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPlaceResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_56;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPlaceResult *)self readAll:0];
  id v9 = [(GEOPlace *)self->_place copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v9;

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v11 = self->_additionalPlaces;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v73 objects:v82 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v74 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = (void *)[*(id *)(*((void *)&v73 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addAdditionalPlace:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v73 objects:v82 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(NSString *)self->_suggestedQuery copyWithZone:a3];
  unint64_t v17 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v16;

  $66C0C4ECE49E8B6147DBDEB385FCD304 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_travelTime;
    *(_DWORD *)(v5 + 144) |= 8u;
    $66C0C4ECE49E8B6147DBDEB385FCD304 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_travelDistance;
    *(_DWORD *)(v5 + 144) |= 4u;
  }
  id v19 = [(GEOAddress *)self->_tokenEntity copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v19;

  uint64_t v21 = [(NSString *)self->_quad copyWithZone:a3];
  unint64_t v22 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v21;

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  unint64_t v23 = self->_unmatchedStrings;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v69 objects:v81 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v70;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v70 != v25) {
          objc_enumerationMutation(v23);
        }
        unint64_t v27 = (void *)[*(id *)(*((void *)&v69 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addUnmatchedString:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v69 objects:v81 count:16];
    }
    while (v24);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v28 = self->_namedFeatures;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v65 objects:v80 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v66;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v66 != v30) {
          objc_enumerationMutation(v28);
        }
        id v32 = (void *)[*(id *)(*((void *)&v65 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addNamedFeature:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v65 objects:v80 count:16];
    }
    while (v29);
  }

  id v33 = [(GEOPlaceSearchRequest *)self->_revgeoRequestTemplate copyWithZone:a3];
  long long v34 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v33;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v35 = self->_matchedTokens;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v61 objects:v79 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v62;
    do
    {
      for (uint64_t m = 0; m != v36; ++m)
      {
        if (*(void *)v62 != v37) {
          objc_enumerationMutation(v35);
        }
        long long v39 = (void *)[*(id *)(*((void *)&v61 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addMatchedToken:v39];
      }
      uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v61 objects:v79 count:16];
    }
    while (v36);
  }

  $66C0C4ECE49E8B6147DBDEB385FCD304 v40 = self->_flags;
  if (*(unsigned char *)&v40)
  {
    *(void *)(v5 + 40) = self->_flyoverTourMuid;
    *(_DWORD *)(v5 + 144) |= 1u;
    $66C0C4ECE49E8B6147DBDEB385FCD304 v40 = self->_flags;
  }
  if ((*(unsigned char *)&v40 & 2) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_cacheControl;
    *(_DWORD *)(v5 + 144) |= 2u;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v41 = self->_disambiguationLabels;
  uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v57 objects:v78 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v58;
    do
    {
      for (uint64_t n = 0; n != v42; ++n)
      {
        if (*(void *)v58 != v43) {
          objc_enumerationMutation(v41);
        }
        long long v45 = (void *)[*(id *)(*((void *)&v57 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addDisambiguationLabel:v45];
      }
      uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v57 objects:v78 count:16];
    }
    while (v42);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v46 = self->_namedFields;
  uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v53 objects:v77 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v54;
    do
    {
      for (iuint64_t i = 0; ii != v47; ++ii)
      {
        if (*(void *)v54 != v48) {
          objc_enumerationMutation(v46);
        }
        long long v50 = objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * ii), "copyWithZone:", a3, (void)v53);
        [(id)v5 addNamedField:v50];
      }
      uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v53 objects:v77 count:16];
    }
    while (v47);
  }

  long long v51 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v51;
LABEL_56:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  [(GEOPlaceResult *)self readAll:1];
  [v4 readAll:1];
  place = self->_place;
  if ((unint64_t)place | *((void *)v4 + 9))
  {
    if (!-[GEOPlace isEqual:](place, "isEqual:")) {
      goto LABEL_44;
    }
  }
  additionalPlaces = self->_additionalPlaces;
  if ((unint64_t)additionalPlaces | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](additionalPlaces, "isEqual:")) {
      goto LABEL_44;
    }
  }
  suggestedQuery = self->_suggestedQuery;
  if ((unint64_t)suggestedQuery | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](suggestedQuery, "isEqual:")) {
      goto LABEL_44;
    }
  }
  $66C0C4ECE49E8B6147DBDEB385FCD304 flags = self->_flags;
  int v9 = *((_DWORD *)v4 + 36);
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_travelTime != *((_DWORD *)v4 + 35)) {
      goto LABEL_44;
    }
  }
  else if ((v9 & 8) != 0)
  {
LABEL_44:
    char v20 = 0;
    goto LABEL_45;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_travelDistance != *((_DWORD *)v4 + 34)) {
      goto LABEL_44;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_44;
  }
  tokenEntity = self->_tokenEntity;
  if ((unint64_t)tokenEntity | *((void *)v4 + 13) && !-[GEOAddress isEqual:](tokenEntity, "isEqual:")) {
    goto LABEL_44;
  }
  quad = self->_quad;
  if ((unint64_t)quad | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](quad, "isEqual:")) {
      goto LABEL_44;
    }
  }
  unmatchedStrings = self->_unmatchedStrings;
  if ((unint64_t)unmatchedStrings | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](unmatchedStrings, "isEqual:")) {
      goto LABEL_44;
    }
  }
  namedFeatures = self->_namedFeatures;
  if ((unint64_t)namedFeatures | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](namedFeatures, "isEqual:")) {
      goto LABEL_44;
    }
  }
  revgeoRequestTemplate = self->_revgeoRequestTemplate;
  if ((unint64_t)revgeoRequestTemplate | *((void *)v4 + 11))
  {
    if (!-[GEOPlaceSearchRequest isEqual:](revgeoRequestTemplate, "isEqual:")) {
      goto LABEL_44;
    }
  }
  matchedTokens = self->_matchedTokens;
  if ((unint64_t)matchedTokens | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](matchedTokens, "isEqual:")) {
      goto LABEL_44;
    }
  }
  $66C0C4ECE49E8B6147DBDEB385FCD304 v16 = self->_flags;
  int v17 = *((_DWORD *)v4 + 36);
  if (*(unsigned char *)&v16)
  {
    if ((v17 & 1) == 0 || self->_flyoverTourMuid != *((void *)v4 + 5)) {
      goto LABEL_44;
    }
  }
  else if (v17)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&v16 & 2) != 0)
  {
    if ((v17 & 2) == 0 || self->_cacheControl != *((_DWORD *)v4 + 33)) {
      goto LABEL_44;
    }
  }
  else if ((v17 & 2) != 0)
  {
    goto LABEL_44;
  }
  disambiguationLabels = self->_disambiguationLabels;
  if ((unint64_t)disambiguationLabels | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](disambiguationLabels, "isEqual:"))
  {
    goto LABEL_44;
  }
  namedFields = self->_namedFields;
  if ((unint64_t)namedFields | *((void *)v4 + 8)) {
    char v20 = -[NSMutableArray isEqual:](namedFields, "isEqual:");
  }
  else {
    char v20 = 1;
  }
LABEL_45:

  return v20;
}

- (unint64_t)hash
{
  [(GEOPlaceResult *)self readAll:1];
  unint64_t v20 = [(GEOPlace *)self->_place hash];
  uint64_t v19 = [(NSMutableArray *)self->_additionalPlaces hash];
  NSUInteger v18 = [(NSString *)self->_suggestedQuery hash];
  $66C0C4ECE49E8B6147DBDEB385FCD304 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_travelTime;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&flags & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_travelDistance;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  unint64_t v6 = [(GEOAddress *)self->_tokenEntity hash];
  NSUInteger v7 = [(NSString *)self->_quad hash];
  uint64_t v8 = [(NSMutableArray *)self->_unmatchedStrings hash];
  uint64_t v9 = [(NSMutableArray *)self->_namedFeatures hash];
  unint64_t v10 = [(GEOPlaceSearchRequest *)self->_revgeoRequestTemplate hash];
  uint64_t v11 = [(NSMutableArray *)self->_matchedTokens hash];
  $66C0C4ECE49E8B6147DBDEB385FCD304 v12 = self->_flags;
  if (*(unsigned char *)&v12)
  {
    unint64_t v13 = 2654435761u * self->_flyoverTourMuid;
    if ((*(unsigned char *)&v12 & 2) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v14 = 0;
    goto LABEL_11;
  }
  unint64_t v13 = 0;
  if ((*(unsigned char *)&v12 & 2) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v14 = 2654435761 * self->_cacheControl;
LABEL_11:
  unint64_t v15 = v19 ^ v20 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  uint64_t v16 = v13 ^ v14 ^ [(NSMutableArray *)self->_disambiguationLabels hash];
  return v15 ^ v16 ^ [(NSMutableArray *)self->_namedFields hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  place = self->_place;
  uint64_t v6 = *((void *)v4 + 9);
  if (place)
  {
    if (v6) {
      -[GEOPlace mergeFrom:](place, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOPlaceResult setPlace:](self, "setPlace:");
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v7 = *((id *)v4 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v64 != v10) {
          objc_enumerationMutation(v7);
        }
        [(GEOPlaceResult *)self addAdditionalPlace:*(void *)(*((void *)&v63 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v63 objects:v72 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 12)) {
    -[GEOPlaceResult setSuggestedQuery:](self, "setSuggestedQuery:");
  }
  int v12 = *((_DWORD *)v4 + 36);
  if ((v12 & 8) != 0)
  {
    self->_travelTime = *((_DWORD *)v4 + 35);
    *(_DWORD *)&self->_flags |= 8u;
    int v12 = *((_DWORD *)v4 + 36);
  }
  if ((v12 & 4) != 0)
  {
    self->_travelDistance = *((_DWORD *)v4 + 34);
    *(_DWORD *)&self->_flags |= 4u;
  }
  tokenEntity = self->_tokenEntity;
  uint64_t v14 = *((void *)v4 + 13);
  if (tokenEntity)
  {
    if (v14) {
      -[GEOAddress mergeFrom:](tokenEntity, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[GEOPlaceResult setTokenEntity:](self, "setTokenEntity:");
  }
  if (*((void *)v4 + 10)) {
    -[GEOPlaceResult setQuad:](self, "setQuad:");
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v15 = *((id *)v4 + 14);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v59 objects:v71 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v60 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEOPlaceResult *)self addUnmatchedString:*(void *)(*((void *)&v59 + 1) + 8 * j)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v59 objects:v71 count:16];
    }
    while (v17);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v20 = *((id *)v4 + 7);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v55 objects:v70 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v56;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v56 != v23) {
          objc_enumerationMutation(v20);
        }
        [(GEOPlaceResult *)self addNamedFeature:*(void *)(*((void *)&v55 + 1) + 8 * k)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v55 objects:v70 count:16];
    }
    while (v22);
  }

  revgeoRequestTemplate = self->_revgeoRequestTemplate;
  uint64_t v26 = *((void *)v4 + 11);
  if (revgeoRequestTemplate)
  {
    if (v26) {
      -[GEOPlaceSearchRequest mergeFrom:](revgeoRequestTemplate, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[GEOPlaceResult setRevgeoRequestTemplate:](self, "setRevgeoRequestTemplate:");
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v27 = *((id *)v4 + 6);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v51 objects:v69 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v52;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v52 != v30) {
          objc_enumerationMutation(v27);
        }
        [(GEOPlaceResult *)self addMatchedToken:*(void *)(*((void *)&v51 + 1) + 8 * m)];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v51 objects:v69 count:16];
    }
    while (v29);
  }

  int v32 = *((_DWORD *)v4 + 36);
  if (v32)
  {
    self->_flyoverTourMuid = *((void *)v4 + 5);
    *(_DWORD *)&self->_flags |= 1u;
    int v32 = *((_DWORD *)v4 + 36);
  }
  if ((v32 & 2) != 0)
  {
    self->_cacheControl = *((_DWORD *)v4 + 33);
    *(_DWORD *)&self->_flags |= 2u;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v33 = *((id *)v4 + 4);
  uint64_t v34 = [v33 countByEnumeratingWithState:&v47 objects:v68 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v48;
    do
    {
      for (uint64_t n = 0; n != v35; ++n)
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(v33);
        }
        [(GEOPlaceResult *)self addDisambiguationLabel:*(void *)(*((void *)&v47 + 1) + 8 * n)];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v47 objects:v68 count:16];
    }
    while (v35);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v38 = *((id *)v4 + 8);
  uint64_t v39 = [v38 countByEnumeratingWithState:&v43 objects:v67 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v44;
    do
    {
      for (iuint64_t i = 0; ii != v40; ++ii)
      {
        if (*(void *)v44 != v41) {
          objc_enumerationMutation(v38);
        }
        -[GEOPlaceResult addNamedField:](self, "addNamedField:", *(void *)(*((void *)&v43 + 1) + 8 * ii), (void)v43);
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v43 objects:v67 count:16];
    }
    while (v40);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPlaceResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2113);
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
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10010u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPlaceResult *)self readAll:0];
    [(GEOPlace *)self->_place clearUnknownFields:1];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v7 = self->_additionalPlaces;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v51;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v51 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v50 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v9);
    }

    [(GEOAddress *)self->_tokenEntity clearUnknownFields:1];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    int v12 = self->_namedFeatures;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v46 objects:v57 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v47;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v47 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v46 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v46 objects:v57 count:16];
      }
      while (v14);
    }

    [(GEOPlaceSearchRequest *)self->_revgeoRequestTemplate clearUnknownFields:1];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v17 = self->_matchedTokens;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v42 objects:v56 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v43;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v43 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v42 + 1) + 8 * v21++) clearUnknownFields:1];
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v42 objects:v56 count:16];
      }
      while (v19);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v22 = self->_disambiguationLabels;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v38 objects:v55 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v39;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v38 + 1) + 8 * v26);
          if (v27)
          {
            os_unfair_lock_lock_with_options();
            *(unsigned char *)(v27 + 52) |= 1u;
            *(unsigned char *)(v27 + 52) |= 8u;
            os_unfair_lock_unlock((os_unfair_lock_t)(v27 + 48));
            uint64_t v28 = *(void **)(v27 + 16);
            *(void *)(v27 + 16) = 0;

            -[GEOLocalizedDisambiguationLabel readAll:](v27, 0);
          }
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v38 objects:v55 count:16];
      }
      while (v24);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v29 = self->_namedFields;
    uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v34 objects:v54 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v35;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v35 != v32) {
            objc_enumerationMutation(v29);
          }
          -[GEONamedField clearUnknownFields:](*(void *)(*((void *)&v34 + 1) + 8 * v33++));
        }
        while (v31 != v33);
        uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v34 objects:v54 count:16];
      }
      while (v31);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmatchedStrings, 0);
  objc_storeStrong((id *)&self->_tokenEntity, 0);
  objc_storeStrong((id *)&self->_suggestedQuery, 0);
  objc_storeStrong((id *)&self->_revgeoRequestTemplate, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_namedFields, 0);
  objc_storeStrong((id *)&self->_namedFeatures, 0);
  objc_storeStrong((id *)&self->_matchedTokens, 0);
  objc_storeStrong((id *)&self->_disambiguationLabels, 0);
  objc_storeStrong((id *)&self->_additionalPlaces, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)geoMapItem
{
  v2 = [[_GEOPlaceItem alloc] initWithPlaceResult:self];

  return v2;
}

@end