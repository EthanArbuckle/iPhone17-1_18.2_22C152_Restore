@interface GEOPDEntity
+ (BOOL)isValid:(id)a3;
+ (Class)altFaxType;
+ (Class)altTelephoneType;
+ (Class)altUrlType;
+ (Class)alternateSearchableNameType;
+ (Class)localizedCategoryType;
+ (Class)mapsAltCategoryIdType;
+ (Class)modernLocalizedCategoryType;
+ (Class)nameType;
+ (Class)spokenNameType;
+ (id)entityForPlaceData:(id)a3;
- (BOOL)altTelephoneAdsOptOut;
- (BOOL)enableRapLightweightFeedback;
- (BOOL)hasAltTelephoneAdsOptOut;
- (BOOL)hasAreaHighlightId;
- (BOOL)hasBrandMuid;
- (BOOL)hasBuildingId;
- (BOOL)hasCapacity;
- (BOOL)hasDisclaimerText;
- (BOOL)hasDisplayStyle;
- (BOOL)hasEnableRapLightweightFeedback;
- (BOOL)hasFax;
- (BOOL)hasGlobalBrandMuid;
- (BOOL)hasInlineRapEnablement;
- (BOOL)hasIsDisputed;
- (BOOL)hasIsPermanentlyClosed;
- (BOOL)hasIsStandaloneBrand;
- (BOOL)hasMapsCategoryId;
- (BOOL)hasMapsCategoryMuid;
- (BOOL)hasModernMapsCategoryId;
- (BOOL)hasPhotosMemoryScore;
- (BOOL)hasPlaceCategoryType;
- (BOOL)hasPlaceDisplayType;
- (BOOL)hasSearchSection;
- (BOOL)hasSecondaryName;
- (BOOL)hasSecondarySpokenName;
- (BOOL)hasStyleAttributes;
- (BOOL)hasTelephone;
- (BOOL)hasTelephoneAdsOptOut;
- (BOOL)hasType;
- (BOOL)hasUrl;
- (BOOL)hasUrlData;
- (BOOL)hasWalletCategoryId;
- (BOOL)isDisputed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPermanentlyClosed;
- (BOOL)isStandaloneBrand;
- (BOOL)readFrom:(id)a3;
- (BOOL)telephoneAdsOptOut;
- (GEOLocalizedString)disclaimerText;
- (GEOLocalizedString)secondaryName;
- (GEOLocalizedString)secondarySpokenName;
- (GEOPDEntity)init;
- (GEOPDEntity)initWithData:(id)a3;
- (GEOPDEntity)initWithDictionary:(id)a3;
- (GEOPDEntity)initWithJSON:(id)a3;
- (GEOPDInlineRapEnablement)inlineRapEnablement;
- (GEOPDURLData)urlData;
- (GEOStyleAttributes)styleAttributes;
- (NSMutableArray)altFaxs;
- (NSMutableArray)altTelephones;
- (NSMutableArray)altUrls;
- (NSMutableArray)alternateSearchableNames;
- (NSMutableArray)localizedCategorys;
- (NSMutableArray)mapsAltCategoryIds;
- (NSMutableArray)modernLocalizedCategorys;
- (NSMutableArray)names;
- (NSMutableArray)spokenNames;
- (NSString)fax;
- (NSString)mapsCategoryId;
- (NSString)modernMapsCategoryId;
- (NSString)telephone;
- (NSString)url;
- (NSString)walletCategoryId;
- (PBUnknownFields)unknownFields;
- (float)photosMemoryScore;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)altFaxAtIndex:(unint64_t)a3;
- (id)altTelephoneAtIndex:(unint64_t)a3;
- (id)altUrlAtIndex:(unint64_t)a3;
- (id)alternateSearchableNameAtIndex:(unint64_t)a3;
- (id)bestLocalizedName;
- (id)bestLocalizedString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayStyleAsString:(int)a3;
- (id)jsonRepresentation;
- (id)localizedCategoryAtIndex:(unint64_t)a3;
- (id)mapsAltCategoryIdAtIndex:(unint64_t)a3;
- (id)modernLocalizedCategoryAtIndex:(unint64_t)a3;
- (id)nameAtIndex:(unint64_t)a3;
- (id)placeCategoryTypeAsString:(int)a3;
- (id)placeDisplayTypeAsString:(int)a3;
- (id)placeLookupCategorysAsString:(int)a3;
- (id)searchSectionAsString:(int)a3;
- (id)spokenNameAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsDisplayStyle:(id)a3;
- (int)StringAsPlaceCategoryType:(id)a3;
- (int)StringAsPlaceDisplayType:(id)a3;
- (int)StringAsPlaceLookupCategorys:(id)a3;
- (int)StringAsSearchSection:(id)a3;
- (int)StringAsType:(id)a3;
- (int)capacity;
- (int)displayStyle;
- (int)placeCategoryType;
- (int)placeDisplayType;
- (int)placeLookupCategoryAtIndex:(unint64_t)a3;
- (int)placeLookupCategorys;
- (int)searchSection;
- (int)type;
- (unint64_t)altFaxsCount;
- (unint64_t)altTelephonesCount;
- (unint64_t)altUrlsCount;
- (unint64_t)alternateSearchableNamesCount;
- (unint64_t)areaHighlightId;
- (unint64_t)brandMuid;
- (unint64_t)buildingId;
- (unint64_t)globalBrandMuid;
- (unint64_t)hash;
- (unint64_t)localizedCategorysCount;
- (unint64_t)mapsAltCategoryIdsCount;
- (unint64_t)mapsAltCategoryMuidAtIndex:(unint64_t)a3;
- (unint64_t)mapsAltCategoryMuids;
- (unint64_t)mapsAltCategoryMuidsCount;
- (unint64_t)mapsCategoryMuid;
- (unint64_t)modernLocalizedCategorysCount;
- (unint64_t)namesCount;
- (unint64_t)placeLookupCategorysCount;
- (unint64_t)spokenNamesCount;
- (void)_addNoFlagsAltFax:(uint64_t)a1;
- (void)_addNoFlagsAltTelephone:(uint64_t)a1;
- (void)_addNoFlagsAltUrl:(uint64_t)a1;
- (void)_addNoFlagsAlternateSearchableName:(uint64_t)a1;
- (void)_addNoFlagsLocalizedCategory:(uint64_t)a1;
- (void)_addNoFlagsMapsAltCategoryId:(uint64_t)a1;
- (void)_addNoFlagsModernLocalizedCategory:(uint64_t)a1;
- (void)_addNoFlagsName:(uint64_t)a1;
- (void)_addNoFlagsSpokenName:(uint64_t)a1;
- (void)_readAltFaxs;
- (void)_readAltTelephones;
- (void)_readAltUrls;
- (void)_readAlternateSearchableNames;
- (void)_readDisclaimerText;
- (void)_readFax;
- (void)_readInlineRapEnablement;
- (void)_readLocalizedCategorys;
- (void)_readMapsAltCategoryIds;
- (void)_readMapsAltCategoryMuids;
- (void)_readMapsCategoryId;
- (void)_readModernLocalizedCategorys;
- (void)_readModernMapsCategoryId;
- (void)_readNames;
- (void)_readPlaceLookupCategorys;
- (void)_readSecondaryName;
- (void)_readSecondarySpokenName;
- (void)_readSpokenNames;
- (void)_readStyleAttributes;
- (void)_readTelephone;
- (void)_readUrl;
- (void)_readUrlData;
- (void)_readWalletCategoryId;
- (void)addAltFax:(id)a3;
- (void)addAltTelephone:(id)a3;
- (void)addAltUrl:(id)a3;
- (void)addAlternateSearchableName:(id)a3;
- (void)addLocalizedCategory:(id)a3;
- (void)addMapsAltCategoryId:(id)a3;
- (void)addMapsAltCategoryMuid:(unint64_t)a3;
- (void)addModernLocalizedCategory:(id)a3;
- (void)addName:(id)a3;
- (void)addPlaceLookupCategory:(int)a3;
- (void)addSpokenName:(id)a3;
- (void)clearAltFaxs;
- (void)clearAltTelephones;
- (void)clearAltUrls;
- (void)clearAlternateSearchableNames;
- (void)clearLocalizedCategorys;
- (void)clearMapsAltCategoryIds;
- (void)clearMapsAltCategoryMuids;
- (void)clearModernLocalizedCategorys;
- (void)clearNames;
- (void)clearPlaceLookupCategorys;
- (void)clearSpokenNames;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAltFaxs:(id)a3;
- (void)setAltTelephoneAdsOptOut:(BOOL)a3;
- (void)setAltTelephones:(id)a3;
- (void)setAltUrls:(id)a3;
- (void)setAlternateSearchableNames:(id)a3;
- (void)setAreaHighlightId:(unint64_t)a3;
- (void)setBrandMuid:(unint64_t)a3;
- (void)setBuildingId:(unint64_t)a3;
- (void)setCapacity:(int)a3;
- (void)setDisclaimerText:(id)a3;
- (void)setDisplayStyle:(int)a3;
- (void)setEnableRapLightweightFeedback:(BOOL)a3;
- (void)setFax:(id)a3;
- (void)setGlobalBrandMuid:(unint64_t)a3;
- (void)setHasAltTelephoneAdsOptOut:(BOOL)a3;
- (void)setHasAreaHighlightId:(BOOL)a3;
- (void)setHasBrandMuid:(BOOL)a3;
- (void)setHasBuildingId:(BOOL)a3;
- (void)setHasCapacity:(BOOL)a3;
- (void)setHasDisplayStyle:(BOOL)a3;
- (void)setHasEnableRapLightweightFeedback:(BOOL)a3;
- (void)setHasGlobalBrandMuid:(BOOL)a3;
- (void)setHasIsDisputed:(BOOL)a3;
- (void)setHasIsPermanentlyClosed:(BOOL)a3;
- (void)setHasIsStandaloneBrand:(BOOL)a3;
- (void)setHasMapsCategoryMuid:(BOOL)a3;
- (void)setHasPhotosMemoryScore:(BOOL)a3;
- (void)setHasPlaceCategoryType:(BOOL)a3;
- (void)setHasPlaceDisplayType:(BOOL)a3;
- (void)setHasSearchSection:(BOOL)a3;
- (void)setHasTelephoneAdsOptOut:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setInlineRapEnablement:(id)a3;
- (void)setIsDisputed:(BOOL)a3;
- (void)setIsPermanentlyClosed:(BOOL)a3;
- (void)setIsStandaloneBrand:(BOOL)a3;
- (void)setLocalizedCategorys:(id)a3;
- (void)setMapsAltCategoryIds:(id)a3;
- (void)setMapsAltCategoryMuids:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setMapsCategoryId:(id)a3;
- (void)setMapsCategoryMuid:(unint64_t)a3;
- (void)setModernLocalizedCategorys:(id)a3;
- (void)setModernMapsCategoryId:(id)a3;
- (void)setNames:(id)a3;
- (void)setPhotosMemoryScore:(float)a3;
- (void)setPlaceCategoryType:(int)a3;
- (void)setPlaceDisplayType:(int)a3;
- (void)setPlaceLookupCategorys:(int *)a3 count:(unint64_t)a4;
- (void)setSearchSection:(int)a3;
- (void)setSecondaryName:(id)a3;
- (void)setSecondarySpokenName:(id)a3;
- (void)setSpokenNames:(id)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setTelephone:(id)a3;
- (void)setTelephoneAdsOptOut:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setUrl:(id)a3;
- (void)setUrlData:(id)a3;
- (void)setWalletCategoryId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDEntity

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDEntity;
  [(GEOPDEntity *)&v3 dealloc];
}

- (int)placeDisplayType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F2AA8D11DDD6D71BA01031F215D029B3 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x200) != 0) {
    return self->_placeDisplayType;
  }
  else {
    return 0;
  }
}

void __51__GEOPDEntity_PlaceDataExtras__entityForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue entity](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

+ (id)entityForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__GEOPDEntity_PlaceDataExtras__entityForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:1 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)hasAreaHighlightId
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)bestLocalizedName
{
  v2 = [(GEOPDEntity *)self names];
  id v3 = +[GEOLocalizedString bestLocalizedStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (NSMutableArray)names
{
  -[GEOPDEntity _readNames]((uint64_t)self);
  names = self->_names;

  return names;
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F2AA8D11DDD6D71BA01031F215D029B3 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x800) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (unint64_t)namesCount
{
  -[GEOPDEntity _readNames]((uint64_t)self);
  names = self->_names;

  return [(NSMutableArray *)names count];
}

- (BOOL)hasType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (unint64_t)spokenNamesCount
{
  -[GEOPDEntity _readSpokenNames]((uint64_t)self);
  spokenNames = self->_spokenNames;

  return [(NSMutableArray *)spokenNames count];
}

- (void)_readSpokenNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 332) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpokenNames_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)isDisputed
{
  return self->_isDisputed;
}

- (id)spokenNameAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readSpokenNames]((uint64_t)self);
  spokenNames = self->_spokenNames;

  return (id)[(NSMutableArray *)spokenNames objectAtIndex:a3];
}

- (NSString)url
{
  -[GEOPDEntity _readUrl]((uint64_t)self);
  url = self->_url;

  return url;
}

- (NSString)telephone
{
  -[GEOPDEntity _readTelephone]((uint64_t)self);
  telephone = self->_telephone;

  return telephone;
}

- (void)_readNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 332) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNames_tags_4412);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (void)_addNoFlagsLocalizedCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 160);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = v5;

      id v4 = *(void **)(a1 + 160);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 208);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 208);
      *(void *)(a1 + 208) = v5;

      id v4 = *(void **)(a1 + 208);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (NSMutableArray)localizedCategorys
{
  -[GEOPDEntity _readLocalizedCategorys]((uint64_t)self);
  localizedCategorys = self->_localizedCategorys;

  return localizedCategorys;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (void)_readUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 333) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags_4411);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasTelephone
{
  return self->_telephone != 0;
}

- (void)_readTelephone
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 332) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTelephone_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasIsPermanentlyClosed
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (void)_readLocalizedCategorys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 331) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedCategorys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (void)_addNoFlagsSpokenName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 232);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 232);
      *(void *)(a1 + 232) = v5;

      id v4 = *(void **)(a1 + 232);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (BOOL)isPermanentlyClosed
{
  return self->_isPermanentlyClosed;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOPDEntity _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return styleAttributes;
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 332) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_4414);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 5) & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDEntityReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_96;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDEntity *)self readAll:0];
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0)
  {
    *(_DWORD *)(v5 + 316) = self->_type;
    *(void *)(v5 + 328) |= 0x800uLL;
  }
  uint64_t v9 = [(NSString *)self->_telephone copyWithZone:a3];
  v10 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v9;

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  v11 = self->_altTelephones;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v115 objects:v127 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v116;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v116 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = (void *)[*(id *)(*((void *)&v115 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addAltTelephone:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v115 objects:v127 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(NSString *)self->_fax copyWithZone:a3];
  v17 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v16;

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v18 = self->_altFaxs;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v111 objects:v126 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v112;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v112 != v20) {
          objc_enumerationMutation(v18);
        }
        v22 = (void *)[*(id *)(*((void *)&v111 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addAltFax:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v111 objects:v126 count:16];
    }
    while (v19);
  }

  uint64_t v23 = [(NSString *)self->_url copyWithZone:a3];
  v24 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v23;

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  v25 = self->_altUrls;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v107 objects:v125 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v108;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v108 != v27) {
          objc_enumerationMutation(v25);
        }
        v29 = (void *)[*(id *)(*((void *)&v107 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addAltUrl:v29];
      }
      uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v107 objects:v125 count:16];
    }
    while (v26);
  }

  $F2AA8D11DDD6D71BA01031F215D029B3 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    *(unsigned char *)(v5 + 323) = self->_isPermanentlyClosed;
    *(void *)(v5 + 328) |= 0x8000uLL;
    $F2AA8D11DDD6D71BA01031F215D029B3 flags = self->_flags;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    *(unsigned char *)(v5 + 322) = self->_isDisputed;
    *(void *)(v5 + 328) |= 0x4000uLL;
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  v31 = self->_names;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v103 objects:v124 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v104;
    do
    {
      for (uint64_t m = 0; m != v32; ++m)
      {
        if (*(void *)v104 != v33) {
          objc_enumerationMutation(v31);
        }
        v35 = (void *)[*(id *)(*((void *)&v103 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addName:v35];
      }
      uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v103 objects:v124 count:16];
    }
    while (v32);
  }

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  v36 = self->_spokenNames;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v99 objects:v123 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v100;
    do
    {
      for (uint64_t n = 0; n != v37; ++n)
      {
        if (*(void *)v100 != v38) {
          objc_enumerationMutation(v36);
        }
        v40 = (void *)[*(id *)(*((void *)&v99 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addSpokenName:v40];
      }
      uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v99 objects:v123 count:16];
    }
    while (v37);
  }

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v41 = self->_localizedCategorys;
  uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v95 objects:v122 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v96;
    do
    {
      for (iuint64_t i = 0; ii != v42; ++ii)
      {
        if (*(void *)v96 != v43) {
          objc_enumerationMutation(v41);
        }
        v45 = (void *)[*(id *)(*((void *)&v95 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addLocalizedCategory:v45];
      }
      uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v95 objects:v122 count:16];
    }
    while (v42);
  }

  $F2AA8D11DDD6D71BA01031F215D029B3 v46 = self->_flags;
  if ((*(_DWORD *)&v46 & 0x20000) != 0)
  {
    *(unsigned char *)(v5 + 325) = self->_telephoneAdsOptOut;
    *(void *)(v5 + 328) |= 0x20000uLL;
    $F2AA8D11DDD6D71BA01031F215D029B3 v46 = self->_flags;
    if ((*(_WORD *)&v46 & 0x1000) == 0)
    {
LABEL_55:
      if ((*(_DWORD *)&v46 & 0x10000) == 0) {
        goto LABEL_56;
      }
      goto LABEL_99;
    }
  }
  else if ((*(_WORD *)&v46 & 0x1000) == 0)
  {
    goto LABEL_55;
  }
  *(unsigned char *)(v5 + 320) = self->_altTelephoneAdsOptOut;
  *(void *)(v5 + 328) |= 0x1000uLL;
  $F2AA8D11DDD6D71BA01031F215D029B3 v46 = self->_flags;
  if ((*(_DWORD *)&v46 & 0x10000) == 0)
  {
LABEL_56:
    if ((*(unsigned char *)&v46 & 0x40) == 0) {
      goto LABEL_57;
    }
    goto LABEL_100;
  }
LABEL_99:
  *(unsigned char *)(v5 + 324) = self->_isStandaloneBrand;
  *(void *)(v5 + 328) |= 0x10000uLL;
  $F2AA8D11DDD6D71BA01031F215D029B3 v46 = self->_flags;
  if ((*(unsigned char *)&v46 & 0x40) == 0)
  {
LABEL_57:
    if ((*(_WORD *)&v46 & 0x400) == 0) {
      goto LABEL_58;
    }
    goto LABEL_101;
  }
LABEL_100:
  *(_DWORD *)(v5 + 296) = self->_displayStyle;
  *(void *)(v5 + 328) |= 0x40uLL;
  $F2AA8D11DDD6D71BA01031F215D029B3 v46 = self->_flags;
  if ((*(_WORD *)&v46 & 0x400) == 0)
  {
LABEL_58:
    if ((*(_WORD *)&v46 & 0x200) == 0) {
      goto LABEL_59;
    }
    goto LABEL_102;
  }
LABEL_101:
  *(_DWORD *)(v5 + 312) = self->_searchSection;
  *(void *)(v5 + 328) |= 0x400uLL;
  $F2AA8D11DDD6D71BA01031F215D029B3 v46 = self->_flags;
  if ((*(_WORD *)&v46 & 0x200) == 0)
  {
LABEL_59:
    if ((*(unsigned char *)&v46 & 2) == 0) {
      goto LABEL_60;
    }
    goto LABEL_103;
  }
LABEL_102:
  *(_DWORD *)(v5 + 308) = self->_placeDisplayType;
  *(void *)(v5 + 328) |= 0x200uLL;
  $F2AA8D11DDD6D71BA01031F215D029B3 v46 = self->_flags;
  if ((*(unsigned char *)&v46 & 2) == 0)
  {
LABEL_60:
    if ((*(unsigned char *)&v46 & 0x20) == 0) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
LABEL_103:
  *(void *)(v5 + 112) = self->_brandMuid;
  *(void *)(v5 + 328) |= 2uLL;
  if ((*(void *)&self->_flags & 0x20) != 0)
  {
LABEL_61:
    *(_DWORD *)(v5 + 292) = self->_capacity;
    *(void *)(v5 + 328) |= 0x20uLL;
  }
LABEL_62:
  PBRepeatedInt32Copy();
  id v47 = [(GEOLocalizedString *)self->_secondaryName copyWithZone:a3];
  v48 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v47;

  id v49 = [(GEOLocalizedString *)self->_secondarySpokenName copyWithZone:a3];
  v50 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v49;

  id v51 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  v52 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v51;

  uint64_t v53 = [(NSString *)self->_walletCategoryId copyWithZone:a3];
  v54 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v53;

  uint64_t v55 = [(NSString *)self->_mapsCategoryId copyWithZone:a3];
  v56 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v55;

  if ((*((unsigned char *)&self->_flags + 1) & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 321) = self->_enableRapLightweightFeedback;
    *(void *)(v5 + 328) |= 0x2000uLL;
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v57 = self->_alternateSearchableNames;
  uint64_t v58 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v91 objects:v121 count:16];
  if (v58)
  {
    uint64_t v59 = *(void *)v92;
    do
    {
      for (juint64_t j = 0; jj != v58; ++jj)
      {
        if (*(void *)v92 != v59) {
          objc_enumerationMutation(v57);
        }
        v61 = (void *)[*(id *)(*((void *)&v91 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v5 addAlternateSearchableName:v61];
      }
      uint64_t v58 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v91 objects:v121 count:16];
    }
    while (v58);
  }

  $F2AA8D11DDD6D71BA01031F215D029B3 v62 = self->_flags;
  if ((*(unsigned char *)&v62 & 8) == 0)
  {
    if ((*(unsigned char *)&v62 & 4) == 0) {
      goto LABEL_73;
    }
LABEL_106:
    *(void *)(v5 + 120) = self->_buildingId;
    *(void *)(v5 + 328) |= 4uLL;
    if ((*(void *)&self->_flags & 1) == 0) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }
  *(void *)(v5 + 144) = self->_globalBrandMuid;
  *(void *)(v5 + 328) |= 8uLL;
  $F2AA8D11DDD6D71BA01031F215D029B3 v62 = self->_flags;
  if ((*(unsigned char *)&v62 & 4) != 0) {
    goto LABEL_106;
  }
LABEL_73:
  if (*(unsigned char *)&v62)
  {
LABEL_74:
    *(void *)(v5 + 104) = self->_areaHighlightId;
    *(void *)(v5 + 328) |= 1uLL;
  }
LABEL_75:
  uint64_t v63 = [(NSString *)self->_modernMapsCategoryId copyWithZone:a3];
  v64 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v63;

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  v65 = self->_modernLocalizedCategorys;
  uint64_t v66 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v87 objects:v120 count:16];
  if (v66)
  {
    uint64_t v67 = *(void *)v88;
    do
    {
      for (kuint64_t k = 0; kk != v66; ++kk)
      {
        if (*(void *)v88 != v67) {
          objc_enumerationMutation(v65);
        }
        v69 = (void *)[*(id *)(*((void *)&v87 + 1) + 8 * kk) copyWithZone:a3];
        [(id)v5 addModernLocalizedCategory:v69];
      }
      uint64_t v66 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v87 objects:v120 count:16];
    }
    while (v66);
  }

  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    *(float *)(v5 + 300) = self->_photosMemoryScore;
    *(void *)(v5 + 328) |= 0x80uLL;
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v70 = self->_mapsAltCategoryIds;
  uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v83 objects:v119 count:16];
  if (v71)
  {
    uint64_t v72 = *(void *)v84;
    do
    {
      for (muint64_t m = 0; mm != v71; ++mm)
      {
        if (*(void *)v84 != v72) {
          objc_enumerationMutation(v70);
        }
        v74 = objc_msgSend(*(id *)(*((void *)&v83 + 1) + 8 * mm), "copyWithZone:", a3, (void)v83);
        [(id)v5 addMapsAltCategoryId:v74];
      }
      uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v83 objects:v119 count:16];
    }
    while (v71);
  }

  if (*((unsigned char *)&self->_flags + 1))
  {
    *(_DWORD *)(v5 + 304) = self->_placeCategoryType;
    *(void *)(v5 + 328) |= 0x100uLL;
  }
  id v75 = -[GEOPDInlineRapEnablement copyWithZone:](self->_inlineRapEnablement, "copyWithZone:", a3, (void)v83);
  v76 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v75;

  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *(void *)(v5 + 184) = self->_mapsCategoryMuid;
    *(void *)(v5 + 328) |= 0x10uLL;
  }
  PBRepeatedUInt64Copy();
  id v77 = [(GEOLocalizedString *)self->_disclaimerText copyWithZone:a3];
  v78 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v77;

  id v79 = [(GEOPDURLData *)self->_urlData copyWithZone:a3];
  v80 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v79;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  id v81 = (id)v5;
LABEL_96:

  return (id)v5;
}

- (GEOPDEntity)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDEntity;
  v2 = [(GEOPDEntity *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletCategoryId, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_urlData, 0);
  objc_storeStrong((id *)&self->_telephone, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_spokenNames, 0);
  objc_storeStrong((id *)&self->_secondarySpokenName, 0);
  objc_storeStrong((id *)&self->_secondaryName, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_modernMapsCategoryId, 0);
  objc_storeStrong((id *)&self->_modernLocalizedCategorys, 0);
  objc_storeStrong((id *)&self->_mapsCategoryId, 0);
  objc_storeStrong((id *)&self->_mapsAltCategoryIds, 0);
  objc_storeStrong((id *)&self->_localizedCategorys, 0);
  objc_storeStrong((id *)&self->_inlineRapEnablement, 0);
  objc_storeStrong((id *)&self->_fax, 0);
  objc_storeStrong((id *)&self->_disclaimerText, 0);
  objc_storeStrong((id *)&self->_alternateSearchableNames, 0);
  objc_storeStrong((id *)&self->_altUrls, 0);
  objc_storeStrong((id *)&self->_altTelephones, 0);
  objc_storeStrong((id *)&self->_altFaxs, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)hasIsDisputed
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (void)writeTo:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDEntityIsDirty((uint64_t)self) & 1) == 0)
  {
    id v47 = self->_reader;
    objc_sync_enter(v47);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v48 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v48];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v47);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDEntity *)self readAll:0];
    if ((*((unsigned char *)&self->_flags + 1) & 8) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_telephone) {
      PBDataWriterWriteStringField();
    }
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    objc_super v6 = self->_altTelephones;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v81 objects:v93 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v82 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v81 objects:v93 count:16];
      }
      while (v7);
    }

    if (self->_fax) {
      PBDataWriterWriteStringField();
    }
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v10 = self->_altFaxs;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v77 objects:v92 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v78;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v78 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v77 objects:v92 count:16];
      }
      while (v11);
    }

    if (self->_url) {
      PBDataWriterWriteStringField();
    }
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v14 = self->_altUrls;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v73 objects:v91 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v74;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v74 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v73 objects:v91 count:16];
      }
      while (v15);
    }

    $F2AA8D11DDD6D71BA01031F215D029B3 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x8000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $F2AA8D11DDD6D71BA01031F215D029B3 flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x4000) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    uint64_t v19 = self->_names;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v69 objects:v90 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v70;
      do
      {
        for (uint64_t m = 0; m != v20; ++m)
        {
          if (*(void *)v70 != v21) {
            objc_enumerationMutation(v19);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v69 objects:v90 count:16];
      }
      while (v20);
    }

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v23 = self->_spokenNames;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v65 objects:v89 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v66;
      do
      {
        for (uint64_t n = 0; n != v24; ++n)
        {
          if (*(void *)v66 != v25) {
            objc_enumerationMutation(v23);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v65 objects:v89 count:16];
      }
      while (v24);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v27 = self->_localizedCategorys;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v61 objects:v88 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v62;
      do
      {
        for (iuint64_t i = 0; ii != v28; ++ii)
        {
          if (*(void *)v62 != v29) {
            objc_enumerationMutation(v27);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v61 objects:v88 count:16];
      }
      while (v28);
    }

    $F2AA8D11DDD6D71BA01031F215D029B3 v31 = self->_flags;
    if ((*(_DWORD *)&v31 & 0x20000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $F2AA8D11DDD6D71BA01031F215D029B3 v31 = self->_flags;
    }
    if ((*(_WORD *)&v31 & 0x1000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $F2AA8D11DDD6D71BA01031F215D029B3 v31 = self->_flags;
    }
    if ((*(_DWORD *)&v31 & 0x10000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $F2AA8D11DDD6D71BA01031F215D029B3 v31 = self->_flags;
    }
    if ((*(unsigned char *)&v31 & 0x40) != 0)
    {
      PBDataWriterWriteInt32Field();
      $F2AA8D11DDD6D71BA01031F215D029B3 v31 = self->_flags;
    }
    if ((*(_WORD *)&v31 & 0x400) != 0)
    {
      PBDataWriterWriteInt32Field();
      $F2AA8D11DDD6D71BA01031F215D029B3 v31 = self->_flags;
    }
    if ((*(_WORD *)&v31 & 0x200) != 0)
    {
      PBDataWriterWriteInt32Field();
      $F2AA8D11DDD6D71BA01031F215D029B3 v31 = self->_flags;
    }
    if ((*(unsigned char *)&v31 & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      $F2AA8D11DDD6D71BA01031F215D029B3 v31 = self->_flags;
    }
    if ((*(unsigned char *)&v31 & 0x20) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_placeLookupCategorys.count)
    {
      unint64_t v32 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v32;
      }
      while (v32 < self->_placeLookupCategorys.count);
    }
    if (self->_secondaryName) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_secondarySpokenName) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_styleAttributes) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_walletCategoryId) {
      PBDataWriterWriteStringField();
    }
    if (self->_mapsCategoryId) {
      PBDataWriterWriteStringField();
    }
    if ((*((unsigned char *)&self->_flags + 1) & 0x20) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v33 = self->_alternateSearchableNames;
    uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v57 objects:v87 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v58;
      do
      {
        for (juint64_t j = 0; jj != v34; ++jj)
        {
          if (*(void *)v58 != v35) {
            objc_enumerationMutation(v33);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v57 objects:v87 count:16];
      }
      while (v34);
    }

    $F2AA8D11DDD6D71BA01031F215D029B3 v37 = self->_flags;
    if ((*(unsigned char *)&v37 & 8) != 0)
    {
      PBDataWriterWriteUint64Field();
      $F2AA8D11DDD6D71BA01031F215D029B3 v37 = self->_flags;
    }
    if ((*(unsigned char *)&v37 & 4) != 0)
    {
      PBDataWriterWriteUint64Field();
      $F2AA8D11DDD6D71BA01031F215D029B3 v37 = self->_flags;
    }
    if (*(unsigned char *)&v37) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_modernMapsCategoryId) {
      PBDataWriterWriteStringField();
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v38 = self->_modernLocalizedCategorys;
    uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v53 objects:v86 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v54;
      do
      {
        for (kuint64_t k = 0; kk != v39; ++kk)
        {
          if (*(void *)v54 != v40) {
            objc_enumerationMutation(v38);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v53 objects:v86 count:16];
      }
      while (v39);
    }

    if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
      PBDataWriterWriteFloatField();
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v42 = self->_mapsAltCategoryIds;
    uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v49 objects:v85 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v50;
      do
      {
        for (muint64_t m = 0; mm != v43; ++mm)
        {
          if (*(void *)v50 != v44) {
            objc_enumerationMutation(v42);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v49 objects:v85 count:16];
      }
      while (v43);
    }

    if (*((unsigned char *)&self->_flags + 1)) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_inlineRapEnablement) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_mapsAltCategoryMuids.count)
    {
      unint64_t v46 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v46;
      }
      while (v46 < self->_mapsAltCategoryMuids.count);
    }
    if (self->_disclaimerText) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_urlData) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v49);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_157;
  }
  [(GEOPDEntity *)self readAll:1];
  [v4 readAll:1];
  uint64_t v5 = *((void *)v4 + 41);
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0)
  {
    if ((v5 & 0x800) == 0 || self->_type != *((_DWORD *)v4 + 79)) {
      goto LABEL_157;
    }
  }
  else if ((v5 & 0x800) != 0)
  {
    goto LABEL_157;
  }
  telephone = self->_telephone;
  if ((unint64_t)telephone | *((void *)v4 + 31) && !-[NSString isEqual:](telephone, "isEqual:")) {
    goto LABEL_157;
  }
  altTelephones = self->_altTelephones;
  if ((unint64_t)altTelephones | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](altTelephones, "isEqual:")) {
      goto LABEL_157;
    }
  }
  fax = self->_fax;
  if ((unint64_t)fax | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](fax, "isEqual:")) {
      goto LABEL_157;
    }
  }
  altFaxs = self->_altFaxs;
  if ((unint64_t)altFaxs | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](altFaxs, "isEqual:")) {
      goto LABEL_157;
    }
  }
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](url, "isEqual:")) {
      goto LABEL_157;
    }
  }
  altUrls = self->_altUrls;
  if ((unint64_t)altUrls | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](altUrls, "isEqual:")) {
      goto LABEL_157;
    }
  }
  $F2AA8D11DDD6D71BA01031F215D029B3 flags = self->_flags;
  uint64_t v13 = *((void *)v4 + 41);
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    if ((v13 & 0x8000) == 0) {
      goto LABEL_157;
    }
    if (self->_isPermanentlyClosed)
    {
      if (!*((unsigned char *)v4 + 323)) {
        goto LABEL_157;
      }
    }
    else if (*((unsigned char *)v4 + 323))
    {
      goto LABEL_157;
    }
  }
  else if ((v13 & 0x8000) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v13 & 0x4000) == 0) {
      goto LABEL_157;
    }
    if (self->_isDisputed)
    {
      if (!*((unsigned char *)v4 + 322)) {
        goto LABEL_157;
      }
    }
    else if (*((unsigned char *)v4 + 322))
    {
      goto LABEL_157;
    }
  }
  else if ((v13 & 0x4000) != 0)
  {
    goto LABEL_157;
  }
  names = self->_names;
  if ((unint64_t)names | *((void *)v4 + 26) && !-[NSMutableArray isEqual:](names, "isEqual:")) {
    goto LABEL_157;
  }
  spokenNames = self->_spokenNames;
  if ((unint64_t)spokenNames | *((void *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](spokenNames, "isEqual:")) {
      goto LABEL_157;
    }
  }
  localizedCategorys = self->_localizedCategorys;
  if ((unint64_t)localizedCategorys | *((void *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](localizedCategorys, "isEqual:")) {
      goto LABEL_157;
    }
  }
  $F2AA8D11DDD6D71BA01031F215D029B3 v17 = self->_flags;
  uint64_t v18 = *((void *)v4 + 41);
  if ((*(_DWORD *)&v17 & 0x20000) != 0)
  {
    if ((v18 & 0x20000) == 0) {
      goto LABEL_157;
    }
    if (self->_telephoneAdsOptOut)
    {
      if (!*((unsigned char *)v4 + 325)) {
        goto LABEL_157;
      }
    }
    else if (*((unsigned char *)v4 + 325))
    {
      goto LABEL_157;
    }
  }
  else if ((v18 & 0x20000) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_WORD *)&v17 & 0x1000) != 0)
  {
    if ((v18 & 0x1000) == 0) {
      goto LABEL_157;
    }
    if (self->_altTelephoneAdsOptOut)
    {
      if (!*((unsigned char *)v4 + 320)) {
        goto LABEL_157;
      }
    }
    else if (*((unsigned char *)v4 + 320))
    {
      goto LABEL_157;
    }
  }
  else if ((v18 & 0x1000) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_DWORD *)&v17 & 0x10000) != 0)
  {
    if ((v18 & 0x10000) == 0) {
      goto LABEL_157;
    }
    if (self->_isStandaloneBrand)
    {
      if (!*((unsigned char *)v4 + 324)) {
        goto LABEL_157;
      }
    }
    else if (*((unsigned char *)v4 + 324))
    {
      goto LABEL_157;
    }
  }
  else if ((v18 & 0x10000) != 0)
  {
    goto LABEL_157;
  }
  if ((*(unsigned char *)&v17 & 0x40) != 0)
  {
    if ((v18 & 0x40) == 0 || self->_displayStyle != *((_DWORD *)v4 + 74)) {
      goto LABEL_157;
    }
  }
  else if ((v18 & 0x40) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_WORD *)&v17 & 0x400) != 0)
  {
    if ((v18 & 0x400) == 0 || self->_searchSection != *((_DWORD *)v4 + 78)) {
      goto LABEL_157;
    }
  }
  else if ((v18 & 0x400) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_WORD *)&v17 & 0x200) != 0)
  {
    if ((v18 & 0x200) == 0 || self->_placeDisplayType != *((_DWORD *)v4 + 77)) {
      goto LABEL_157;
    }
  }
  else if ((v18 & 0x200) != 0)
  {
    goto LABEL_157;
  }
  if ((*(unsigned char *)&v17 & 2) != 0)
  {
    if ((v18 & 2) == 0 || self->_brandMuid != *((void *)v4 + 14)) {
      goto LABEL_157;
    }
  }
  else if ((v18 & 2) != 0)
  {
    goto LABEL_157;
  }
  if ((*(unsigned char *)&v17 & 0x20) != 0)
  {
    if ((v18 & 0x20) == 0 || self->_capacity != *((_DWORD *)v4 + 73)) {
      goto LABEL_157;
    }
  }
  else if ((v18 & 0x20) != 0)
  {
    goto LABEL_157;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_157;
  }
  secondaryName = self->_secondaryName;
  if ((unint64_t)secondaryName | *((void *)v4 + 27))
  {
    if (!-[GEOLocalizedString isEqual:](secondaryName, "isEqual:")) {
      goto LABEL_157;
    }
  }
  secondarySpokenName = self->_secondarySpokenName;
  if ((unint64_t)secondarySpokenName | *((void *)v4 + 28))
  {
    if (!-[GEOLocalizedString isEqual:](secondarySpokenName, "isEqual:")) {
      goto LABEL_157;
    }
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 30))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:")) {
      goto LABEL_157;
    }
  }
  walletCategoryId = self->_walletCategoryId;
  if ((unint64_t)walletCategoryId | *((void *)v4 + 34))
  {
    if (!-[NSString isEqual:](walletCategoryId, "isEqual:")) {
      goto LABEL_157;
    }
  }
  mapsCategoryId = self->_mapsCategoryId;
  if ((unint64_t)mapsCategoryId | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](mapsCategoryId, "isEqual:")) {
      goto LABEL_157;
    }
  }
  $F2AA8D11DDD6D71BA01031F215D029B3 v24 = self->_flags;
  uint64_t v25 = *((void *)v4 + 41);
  if ((*(_WORD *)&v24 & 0x2000) != 0)
  {
    if ((v25 & 0x2000) == 0) {
      goto LABEL_157;
    }
    if (self->_enableRapLightweightFeedback)
    {
      if (!*((unsigned char *)v4 + 321)) {
        goto LABEL_157;
      }
    }
    else if (*((unsigned char *)v4 + 321))
    {
      goto LABEL_157;
    }
  }
  else if ((v25 & 0x2000) != 0)
  {
    goto LABEL_157;
  }
  alternateSearchableNames = self->_alternateSearchableNames;
  if ((unint64_t)alternateSearchableNames | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](alternateSearchableNames, "isEqual:")) {
      goto LABEL_157;
    }
    $F2AA8D11DDD6D71BA01031F215D029B3 v24 = self->_flags;
    uint64_t v25 = *((void *)v4 + 41);
  }
  if ((*(unsigned char *)&v24 & 8) != 0)
  {
    if ((v25 & 8) == 0 || self->_globalBrandMuid != *((void *)v4 + 18)) {
      goto LABEL_157;
    }
  }
  else if ((v25 & 8) != 0)
  {
    goto LABEL_157;
  }
  if ((*(unsigned char *)&v24 & 4) != 0)
  {
    if ((v25 & 4) == 0 || self->_buildingId != *((void *)v4 + 15)) {
      goto LABEL_157;
    }
  }
  else if ((v25 & 4) != 0)
  {
    goto LABEL_157;
  }
  if (*(unsigned char *)&v24)
  {
    if ((v25 & 1) == 0 || self->_areaHighlightId != *((void *)v4 + 13)) {
      goto LABEL_157;
    }
  }
  else if (v25)
  {
    goto LABEL_157;
  }
  modernMapsCategoryId = self->_modernMapsCategoryId;
  if ((unint64_t)modernMapsCategoryId | *((void *)v4 + 25)
    && !-[NSString isEqual:](modernMapsCategoryId, "isEqual:"))
  {
    goto LABEL_157;
  }
  modernLocalizedCategorys = self->_modernLocalizedCategorys;
  if ((unint64_t)modernLocalizedCategorys | *((void *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](modernLocalizedCategorys, "isEqual:")) {
      goto LABEL_157;
    }
  }
  $F2AA8D11DDD6D71BA01031F215D029B3 v29 = self->_flags;
  uint64_t v30 = *((void *)v4 + 41);
  if ((*(unsigned char *)&v29 & 0x80) != 0)
  {
    if ((v30 & 0x80) == 0 || self->_photosMemoryScore != *((float *)v4 + 75)) {
      goto LABEL_157;
    }
  }
  else if ((v30 & 0x80) != 0)
  {
    goto LABEL_157;
  }
  mapsAltCategoryIds = self->_mapsAltCategoryIds;
  if ((unint64_t)mapsAltCategoryIds | *((void *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](mapsAltCategoryIds, "isEqual:")) {
      goto LABEL_157;
    }
    $F2AA8D11DDD6D71BA01031F215D029B3 v29 = self->_flags;
    uint64_t v30 = *((void *)v4 + 41);
  }
  if ((*(_WORD *)&v29 & 0x100) != 0)
  {
    if ((v30 & 0x100) == 0 || self->_placeCategoryType != *((_DWORD *)v4 + 76)) {
      goto LABEL_157;
    }
  }
  else if ((v30 & 0x100) != 0)
  {
    goto LABEL_157;
  }
  inlineRapEnablement = self->_inlineRapEnablement;
  if ((unint64_t)inlineRapEnablement | *((void *)v4 + 19))
  {
    if (-[GEOPDInlineRapEnablement isEqual:](inlineRapEnablement, "isEqual:"))
    {
      $F2AA8D11DDD6D71BA01031F215D029B3 v29 = self->_flags;
      uint64_t v30 = *((void *)v4 + 41);
      goto LABEL_147;
    }
LABEL_157:
    char v35 = 0;
    goto LABEL_158;
  }
LABEL_147:
  if ((*(unsigned char *)&v29 & 0x10) != 0)
  {
    if ((v30 & 0x10) == 0 || self->_mapsCategoryMuid != *((void *)v4 + 23)) {
      goto LABEL_157;
    }
  }
  else if ((v30 & 0x10) != 0)
  {
    goto LABEL_157;
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_157;
  }
  disclaimerText = self->_disclaimerText;
  if ((unint64_t)disclaimerText | *((void *)v4 + 16))
  {
    if (!-[GEOLocalizedString isEqual:](disclaimerText, "isEqual:")) {
      goto LABEL_157;
    }
  }
  urlData = self->_urlData;
  if ((unint64_t)urlData | *((void *)v4 + 32)) {
    char v35 = -[GEOPDURLData isEqual:](urlData, "isEqual:");
  }
  else {
    char v35 = 1;
  }
LABEL_158:

  return v35;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_4606;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_4607;
    }
    GEOPDEntityReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDEntityCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (id)bestLocalizedString
{
  v2 = [(GEOPDEntity *)self names];
  BOOL v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (GEOPDEntity)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDEntity;
  BOOL v3 = [(GEOPDEntity *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)setType:(int)a3
{
  *(void *)&self->_flags |= 0x40000000800uLL;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000800;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (id)typeAsString:(int)a3
{
  switch(a3)
  {
    case '#':
      id v4 = @"TIME_ZONE";
      break;
    case '$':
    case '%':
    case '&':
    case '\'':
    case '(':
    case ')':
    case '*':
    case '4':
    case '5':
    case '8':
    case ':':
    case ';':
    case '<':
    case '>':
LABEL_13:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      break;
    case '+':
      id v4 = @"SUB_LOCALITY";
      break;
    case ',':
      id v4 = @"OCEAN";
      break;
    case '-':
      id v4 = @"AOI";
      break;
    case '.':
      id v4 = @"INLAND_WATER";
      break;
    case '/':
      id v4 = @"BUSINESS";
      break;
    case '0':
      id v4 = @"ISLAND";
      break;
    case '1':
      id v4 = @"STREET";
      break;
    case '2':
      id v4 = @"ADMIN";
      break;
    case '3':
      id v4 = @"POSTAL";
      break;
    case '6':
      id v4 = @"INTERSECTION";
      break;
    case '7':
      id v4 = @"BUILDING";
      break;
    case '9':
      id v4 = @"ADDRESS";
      break;
    case '=':
      id v4 = @"CONTINENT";
      break;
    case '?':
      id v4 = @"REGION";
      break;
    case '@':
      id v4 = @"DIVISION";
      break;
    case 'A':
      id v4 = @"PHYSICAL_FEATURE";
      break;
    default:
      id v4 = @"UNKNOWN_PLACE_TYPE";
      switch(a3)
      {
        case 0:
          goto LABEL_14;
        case 1:
          id v4 = @"COUNTRY";
          break;
        case 2:
          id v4 = @"ADMINISTRATIVE_AREA";
          break;
        case 3:
          goto LABEL_13;
        case 4:
          id v4 = @"SUB_ADMINISTRATIVE_AREA";
          break;
        default:
          if (a3 != 16) {
            goto LABEL_13;
          }
          id v4 = @"LOCALITY";
          break;
      }
      break;
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PLACE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COUNTRY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ADMINISTRATIVE_AREA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SUB_ADMINISTRATIVE_AREA"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LOCALITY"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"TIME_ZONE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"SUB_LOCALITY"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"OCEAN"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"AOI"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"INLAND_WATER"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"BUSINESS"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"ISLAND"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"STREET"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"ADMIN"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"POSTAL"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"INTERSECTION"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"BUILDING"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"ADDRESS"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"CONTINENT"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"REGION"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"DIVISION"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"PHYSICAL_FEATURE"])
  {
    int v4 = 65;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setTelephone:(id)a3
{
  *(void *)&self->_flags |= 0x44000000000uLL;
  objc_storeStrong((id *)&self->_telephone, a3);
}

- (void)_readAltTelephones
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 330) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAltTelephones_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)altTelephones
{
  -[GEOPDEntity _readAltTelephones]((uint64_t)self);
  altTelephones = self->_altTelephones;

  return altTelephones;
}

- (void)setAltTelephones:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  altTelephones = self->_altTelephones;
  self->_altTelephones = v4;
}

- (void)clearAltTelephones
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  altTelephones = self->_altTelephones;

  [(NSMutableArray *)altTelephones removeAllObjects];
}

- (void)addAltTelephone:(id)a3
{
  id v4 = a3;
  -[GEOPDEntity _readAltTelephones]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsAltTelephone:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsAltTelephone:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      id v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)altTelephonesCount
{
  -[GEOPDEntity _readAltTelephones]((uint64_t)self);
  altTelephones = self->_altTelephones;

  return [(NSMutableArray *)altTelephones count];
}

- (id)altTelephoneAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readAltTelephones]((uint64_t)self);
  altTelephones = self->_altTelephones;

  return (id)[(NSMutableArray *)altTelephones objectAtIndex:a3];
}

+ (Class)altTelephoneType
{
  return (Class)objc_opt_class();
}

- (void)_readFax
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 331) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFax_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasFax
{
  return self->_fax != 0;
}

- (NSString)fax
{
  -[GEOPDEntity _readFax]((uint64_t)self);
  fax = self->_fax;

  return fax;
}

- (void)setFax:(id)a3
{
  *(void *)&self->_flags |= 0x40004000000uLL;
  objc_storeStrong((id *)&self->_fax, a3);
}

- (void)_readAltFaxs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 330) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAltFaxs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)altFaxs
{
  -[GEOPDEntity _readAltFaxs]((uint64_t)self);
  altFaxs = self->_altFaxs;

  return altFaxs;
}

- (void)setAltFaxs:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  altFaxs = self->_altFaxs;
  self->_altFaxs = v4;
}

- (void)clearAltFaxs
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  altFaxs = self->_altFaxs;

  [(NSMutableArray *)altFaxs removeAllObjects];
}

- (void)addAltFax:(id)a3
{
  id v4 = a3;
  -[GEOPDEntity _readAltFaxs]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsAltFax:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsAltFax:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)altFaxsCount
{
  -[GEOPDEntity _readAltFaxs]((uint64_t)self);
  altFaxs = self->_altFaxs;

  return [(NSMutableArray *)altFaxs count];
}

- (id)altFaxAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readAltFaxs]((uint64_t)self);
  altFaxs = self->_altFaxs;

  return (id)[(NSMutableArray *)altFaxs objectAtIndex:a3];
}

+ (Class)altFaxType
{
  return (Class)objc_opt_class();
}

- (void)setUrl:(id)a3
{
  *(void *)&self->_flags |= 0x50000000000uLL;
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)_readAltUrls
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 330) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAltUrls_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)altUrls
{
  -[GEOPDEntity _readAltUrls]((uint64_t)self);
  altUrls = self->_altUrls;

  return altUrls;
}

- (void)setAltUrls:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  altUrls = self->_altUrls;
  self->_altUrls = v4;
}

- (void)clearAltUrls
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  altUrls = self->_altUrls;

  [(NSMutableArray *)altUrls removeAllObjects];
}

- (void)addAltUrl:(id)a3
{
  id v4 = a3;
  -[GEOPDEntity _readAltUrls]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsAltUrl:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsAltUrl:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      id v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)altUrlsCount
{
  -[GEOPDEntity _readAltUrls]((uint64_t)self);
  altUrls = self->_altUrls;

  return [(NSMutableArray *)altUrls count];
}

- (id)altUrlAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readAltUrls]((uint64_t)self);
  altUrls = self->_altUrls;

  return (id)[(NSMutableArray *)altUrls objectAtIndex:a3];
}

+ (Class)altUrlType
{
  return (Class)objc_opt_class();
}

- (void)setIsPermanentlyClosed:(BOOL)a3
{
  *(void *)&self->_flags |= 0x40000008000uLL;
  self->_isPermanentlyClosed = a3;
}

- (void)setHasIsPermanentlyClosed:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000008000;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (void)setIsDisputed:(BOOL)a3
{
  *(void *)&self->_flags |= 0x40000004000uLL;
  self->_isDisputed = a3;
}

- (void)setHasIsDisputed:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000004000;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (void)setNames:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  names = self->_names;
  self->_names = v4;
}

- (void)clearNames
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  names = self->_names;

  [(NSMutableArray *)names removeAllObjects];
}

- (void)addName:(id)a3
{
  id v4 = a3;
  -[GEOPDEntity _readNames]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (id)nameAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readNames]((uint64_t)self);
  names = self->_names;

  return (id)[(NSMutableArray *)names objectAtIndex:a3];
}

+ (Class)nameType
{
  return (Class)objc_opt_class();
}

- (NSMutableArray)spokenNames
{
  -[GEOPDEntity _readSpokenNames]((uint64_t)self);
  spokenNames = self->_spokenNames;

  return spokenNames;
}

- (void)setSpokenNames:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  spokenNames = self->_spokenNames;
  self->_spokenNames = v4;
}

- (void)clearSpokenNames
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  spokenNames = self->_spokenNames;

  [(NSMutableArray *)spokenNames removeAllObjects];
}

- (void)addSpokenName:(id)a3
{
  id v4 = a3;
  -[GEOPDEntity _readSpokenNames]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsSpokenName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

+ (Class)spokenNameType
{
  return (Class)objc_opt_class();
}

- (void)setLocalizedCategorys:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  localizedCategorys = self->_localizedCategorys;
  self->_localizedCategorys = v4;
}

- (void)clearLocalizedCategorys
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  localizedCategorys = self->_localizedCategorys;

  [(NSMutableArray *)localizedCategorys removeAllObjects];
}

- (void)addLocalizedCategory:(id)a3
{
  id v4 = a3;
  -[GEOPDEntity _readLocalizedCategorys]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsLocalizedCategory:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (unint64_t)localizedCategorysCount
{
  -[GEOPDEntity _readLocalizedCategorys]((uint64_t)self);
  localizedCategorys = self->_localizedCategorys;

  return [(NSMutableArray *)localizedCategorys count];
}

- (id)localizedCategoryAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readLocalizedCategorys]((uint64_t)self);
  localizedCategorys = self->_localizedCategorys;

  return (id)[(NSMutableArray *)localizedCategorys objectAtIndex:a3];
}

+ (Class)localizedCategoryType
{
  return (Class)objc_opt_class();
}

- (BOOL)telephoneAdsOptOut
{
  return self->_telephoneAdsOptOut;
}

- (void)setTelephoneAdsOptOut:(BOOL)a3
{
  *(void *)&self->_flags |= 0x40000020000uLL;
  self->_telephoneAdsOptOut = a3;
}

- (void)setHasTelephoneAdsOptOut:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000020000;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasTelephoneAdsOptOut
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (BOOL)altTelephoneAdsOptOut
{
  return self->_altTelephoneAdsOptOut;
}

- (void)setAltTelephoneAdsOptOut:(BOOL)a3
{
  *(void *)&self->_flags |= 0x40000001000uLL;
  self->_altTelephoneAdsOptOut = a3;
}

- (void)setHasAltTelephoneAdsOptOut:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000001000;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasAltTelephoneAdsOptOut
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (BOOL)isStandaloneBrand
{
  return self->_isStandaloneBrand;
}

- (void)setIsStandaloneBrand:(BOOL)a3
{
  *(void *)&self->_flags |= 0x40000010000uLL;
  self->_isStandaloneBrand = a3;
}

- (void)setHasIsStandaloneBrand:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000010000;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasIsStandaloneBrand
{
  return *((unsigned char *)&self->_flags + 2) & 1;
}

- (int)displayStyle
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F2AA8D11DDD6D71BA01031F215D029B3 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x40) != 0) {
    return self->_displayStyle;
  }
  else {
    return 1;
  }
}

- (void)setDisplayStyle:(int)a3
{
  *(void *)&self->_flags |= 0x40000000040uLL;
  self->_displayStyle = a3;
}

- (void)setHasDisplayStyle:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000040;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasDisplayStyle
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)displayStyleAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E3920[a3];
  }

  return v3;
}

- (int)StringAsDisplayStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLACE_DISPLAY_STYLE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLACE_DISPLAY_STYLE_FULL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PLACE_DISPLAY_STYLE_SHORT"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)searchSection
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F2AA8D11DDD6D71BA01031F215D029B3 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x400) != 0) {
    return self->_searchSection;
  }
  else {
    return 0;
  }
}

- (void)setSearchSection:(int)a3
{
  *(void *)&self->_flags |= 0x40000000400uLL;
  self->_searchSectiouint64_t n = a3;
}

- (void)setHasSearchSection:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000400;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFBFFFFFFFBFFLL | v3);
}

- (BOOL)hasSearchSection
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (id)searchSectionAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E3938[a3];
  }

  return v3;
}

- (int)StringAsSearchSection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLACE_SEARCH_SECTION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLACE_SEARCH_SECTION_MAPS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PLACE_SEARCH_SECTION_BUSINESS"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPlaceDisplayType:(int)a3
{
  *(void *)&self->_flags |= 0x40000000200uLL;
  self->_placeDisplayType = a3;
}

- (void)setHasPlaceDisplayType:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000200;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasPlaceDisplayType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (id)placeDisplayTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E3950[a3];
  }

  return v3;
}

- (int)StringAsPlaceDisplayType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BUSINESS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REGION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ADDRESS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BRAND"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)brandMuid
{
  return self->_brandMuid;
}

- (void)setBrandMuid:(unint64_t)a3
{
  *(void *)&self->_flags |= 0x40000000002uLL;
  self->_brandMuid = a3;
}

- (void)setHasBrandMuid:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000002;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasBrandMuid
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(int)a3
{
  *(void *)&self->_flags |= 0x40000000020uLL;
  self->_capacity = a3;
}

- (void)setHasCapacity:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000020;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasCapacity
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)_readPlaceLookupCategorys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 330) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceLookupCategorys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (unint64_t)placeLookupCategorysCount
{
  return self->_placeLookupCategorys.count;
}

- (int)placeLookupCategorys
{
  return self->_placeLookupCategorys.list;
}

- (void)clearPlaceLookupCategorys
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;

  PBRepeatedInt32Clear();
}

- (void)addPlaceLookupCategory:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (int)placeLookupCategoryAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readPlaceLookupCategorys]((uint64_t)self);
  p_placeLookupCategorys = &self->_placeLookupCategorys;
  unint64_t count = self->_placeLookupCategorys.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_placeLookupCategorys->list[a3];
}

- (void)setPlaceLookupCategorys:(int *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;

  MEMORY[0x1F4147390](&self->_placeLookupCategorys, a3, a4);
}

- (id)placeLookupCategorysAsString:(int)a3
{
  if (a3 >= 0x18)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E4238[a3];
  }

  return v3;
}

- (int)StringAsPlaceLookupCategorys:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_ENTERTAINMENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AQUARIUM"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_ZOO"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_STADIUM"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_SKATE_PARK"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_CULTURE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_LANDMARK"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_MUSEUM"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_RESTAURANT"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_NIGHTLIFE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_PARK"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AIRPORT"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_SHOPPING"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_BEACH"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_MOUNTAIN"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_FITNESS"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_ACTIVITY"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_DIVING"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_HIKING"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_PERFORMANCE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_HOSPITAL"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK_RIDE"])
  {
    int v4 = 23;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readSecondaryName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 332) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSecondaryName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasSecondaryName
{
  return self->_secondaryName != 0;
}

- (GEOLocalizedString)secondaryName
{
  -[GEOPDEntity _readSecondaryName]((uint64_t)self);
  secondaryName = self->_secondaryName;

  return secondaryName;
}

- (void)setSecondaryName:(id)a3
{
  *(void *)&self->_flags |= 0x40400000000uLL;
  objc_storeStrong((id *)&self->_secondaryName, a3);
}

- (void)_readSecondarySpokenName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 332) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSecondarySpokenName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasSecondarySpokenName
{
  return self->_secondarySpokenName != 0;
}

- (GEOLocalizedString)secondarySpokenName
{
  -[GEOPDEntity _readSecondarySpokenName]((uint64_t)self);
  secondarySpokenName = self->_secondarySpokenName;

  return secondarySpokenName;
}

- (void)setSecondarySpokenName:(id)a3
{
  *(void *)&self->_flags |= 0x40800000000uLL;
  objc_storeStrong((id *)&self->_secondarySpokenName, a3);
}

- (BOOL)hasStyleAttributes
{
  return self->_styleAttributes != 0;
}

- (void)setStyleAttributes:(id)a3
{
  *(void *)&self->_flags |= 0x42000000000uLL;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readWalletCategoryId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 333) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWalletCategoryId_tags_4415);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasWalletCategoryId
{
  return self->_walletCategoryId != 0;
}

- (NSString)walletCategoryId
{
  -[GEOPDEntity _readWalletCategoryId]((uint64_t)self);
  walletCategoryId = self->_walletCategoryId;

  return walletCategoryId;
}

- (void)setWalletCategoryId:(id)a3
{
  *(void *)&self->_flags |= 0x60000000000uLL;
  objc_storeStrong((id *)&self->_walletCategoryId, a3);
}

- (void)_readMapsCategoryId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 331) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsCategoryId_tags_4416);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasMapsCategoryId
{
  return self->_mapsCategoryId != 0;
}

- (NSString)mapsCategoryId
{
  -[GEOPDEntity _readMapsCategoryId]((uint64_t)self);
  mapsCategoryId = self->_mapsCategoryId;

  return mapsCategoryId;
}

- (void)setMapsCategoryId:(id)a3
{
  *(void *)&self->_flags |= 0x40040000000uLL;
  objc_storeStrong((id *)&self->_mapsCategoryId, a3);
}

- (BOOL)enableRapLightweightFeedback
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F2AA8D11DDD6D71BA01031F215D029B3 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x2000) != 0 && self->_enableRapLightweightFeedback;
}

- (void)setEnableRapLightweightFeedback:(BOOL)a3
{
  *(void *)&self->_flags |= 0x40000002000uLL;
  self->_enableRapLightweightFeedbacuint64_t k = a3;
}

- (void)setHasEnableRapLightweightFeedback:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000002000;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasEnableRapLightweightFeedback
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (void)_readAlternateSearchableNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 331) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlternateSearchableNames_tags_4417);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)alternateSearchableNames
{
  -[GEOPDEntity _readAlternateSearchableNames]((uint64_t)self);
  alternateSearchableNames = self->_alternateSearchableNames;

  return alternateSearchableNames;
}

- (void)setAlternateSearchableNames:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  alternateSearchableNames = self->_alternateSearchableNames;
  self->_alternateSearchableNames = v4;
}

- (void)clearAlternateSearchableNames
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  alternateSearchableNames = self->_alternateSearchableNames;

  [(NSMutableArray *)alternateSearchableNames removeAllObjects];
}

- (void)addAlternateSearchableName:(id)a3
{
  id v4 = a3;
  -[GEOPDEntity _readAlternateSearchableNames]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsAlternateSearchableName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsAlternateSearchableName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 96);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      id v4 = *(void **)(a1 + 96);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)alternateSearchableNamesCount
{
  -[GEOPDEntity _readAlternateSearchableNames]((uint64_t)self);
  alternateSearchableNames = self->_alternateSearchableNames;

  return [(NSMutableArray *)alternateSearchableNames count];
}

- (id)alternateSearchableNameAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readAlternateSearchableNames]((uint64_t)self);
  alternateSearchableNames = self->_alternateSearchableNames;

  return (id)[(NSMutableArray *)alternateSearchableNames objectAtIndex:a3];
}

+ (Class)alternateSearchableNameType
{
  return (Class)objc_opt_class();
}

- (unint64_t)globalBrandMuid
{
  return self->_globalBrandMuid;
}

- (void)setGlobalBrandMuid:(unint64_t)a3
{
  *(void *)&self->_flags |= 0x40000000008uLL;
  self->_globalBrandMuid = a3;
}

- (void)setHasGlobalBrandMuid:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000008;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasGlobalBrandMuid
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unint64_t)buildingId
{
  return self->_buildingId;
}

- (void)setBuildingId:(unint64_t)a3
{
  *(void *)&self->_flags |= 0x40000000004uLL;
  self->_buildingId = a3;
}

- (void)setHasBuildingId:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000004;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasBuildingId
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unint64_t)areaHighlightId
{
  return self->_areaHighlightId;
}

- (void)setAreaHighlightId:(unint64_t)a3
{
  *(void *)&self->_flags |= 0x40000000001uLL;
  self->_areaHighlightId = a3;
}

- (void)setHasAreaHighlightId:(BOOL)a3
{
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x40000000000);
}

- (void)_readModernMapsCategoryId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 332) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModernMapsCategoryId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasModernMapsCategoryId
{
  return self->_modernMapsCategoryId != 0;
}

- (NSString)modernMapsCategoryId
{
  -[GEOPDEntity _readModernMapsCategoryId]((uint64_t)self);
  modernMapsCategoryId = self->_modernMapsCategoryId;

  return modernMapsCategoryId;
}

- (void)setModernMapsCategoryId:(id)a3
{
  *(void *)&self->_flags |= 0x40100000000uLL;
  objc_storeStrong((id *)&self->_modernMapsCategoryId, a3);
}

- (void)_readModernLocalizedCategorys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 331) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModernLocalizedCategorys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)modernLocalizedCategorys
{
  -[GEOPDEntity _readModernLocalizedCategorys]((uint64_t)self);
  modernLocalizedCategorys = self->_modernLocalizedCategorys;

  return modernLocalizedCategorys;
}

- (void)setModernLocalizedCategorys:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  modernLocalizedCategorys = self->_modernLocalizedCategorys;
  self->_modernLocalizedCategorys = v4;
}

- (void)clearModernLocalizedCategorys
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  modernLocalizedCategorys = self->_modernLocalizedCategorys;

  [(NSMutableArray *)modernLocalizedCategorys removeAllObjects];
}

- (void)addModernLocalizedCategory:(id)a3
{
  id v4 = a3;
  -[GEOPDEntity _readModernLocalizedCategorys]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsModernLocalizedCategory:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsModernLocalizedCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 192);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 192);
      *(void *)(a1 + 192) = v5;

      id v4 = *(void **)(a1 + 192);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)modernLocalizedCategorysCount
{
  -[GEOPDEntity _readModernLocalizedCategorys]((uint64_t)self);
  modernLocalizedCategorys = self->_modernLocalizedCategorys;

  return [(NSMutableArray *)modernLocalizedCategorys count];
}

- (id)modernLocalizedCategoryAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readModernLocalizedCategorys]((uint64_t)self);
  modernLocalizedCategorys = self->_modernLocalizedCategorys;

  return (id)[(NSMutableArray *)modernLocalizedCategorys objectAtIndex:a3];
}

+ (Class)modernLocalizedCategoryType
{
  return (Class)objc_opt_class();
}

- (float)photosMemoryScore
{
  return self->_photosMemoryScore;
}

- (void)setPhotosMemoryScore:(float)a3
{
  *(void *)&self->_flags |= 0x40000000080uLL;
  self->_photosMemoryScore = a3;
}

- (void)setHasPhotosMemoryScore:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000080;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasPhotosMemoryScore
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (void)_readMapsAltCategoryIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 331) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsAltCategoryIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)mapsAltCategoryIds
{
  -[GEOPDEntity _readMapsAltCategoryIds]((uint64_t)self);
  mapsAltCategoryIds = self->_mapsAltCategoryIds;

  return mapsAltCategoryIds;
}

- (void)setMapsAltCategoryIds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  mapsAltCategoryIds = self->_mapsAltCategoryIds;
  self->_mapsAltCategoryIds = v4;
}

- (void)clearMapsAltCategoryIds
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
  mapsAltCategoryIds = self->_mapsAltCategoryIds;

  [(NSMutableArray *)mapsAltCategoryIds removeAllObjects];
}

- (void)addMapsAltCategoryId:(id)a3
{
  id v4 = a3;
  -[GEOPDEntity _readMapsAltCategoryIds]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsMapsAltCategoryId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsMapsAltCategoryId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 168);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = v5;

      id v4 = *(void **)(a1 + 168);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)mapsAltCategoryIdsCount
{
  -[GEOPDEntity _readMapsAltCategoryIds]((uint64_t)self);
  mapsAltCategoryIds = self->_mapsAltCategoryIds;

  return [(NSMutableArray *)mapsAltCategoryIds count];
}

- (id)mapsAltCategoryIdAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readMapsAltCategoryIds]((uint64_t)self);
  mapsAltCategoryIds = self->_mapsAltCategoryIds;

  return (id)[(NSMutableArray *)mapsAltCategoryIds objectAtIndex:a3];
}

+ (Class)mapsAltCategoryIdType
{
  return (Class)objc_opt_class();
}

- (int)placeCategoryType
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F2AA8D11DDD6D71BA01031F215D029B3 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x100) != 0) {
    return self->_placeCategoryType;
  }
  else {
    return 0;
  }
}

- (void)setPlaceCategoryType:(int)a3
{
  *(void *)&self->_flags |= 0x40000000100uLL;
  self->_placeCategoryType = a3;
}

- (void)setHasPlaceCategoryType:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000100;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasPlaceCategoryType
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (id)placeCategoryTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E3980[a3];
  }

  return v3;
}

- (int)StringAsPlaceCategoryType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLACE_CATEGORY_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLACE_CATEGORY_TYPE_TRAIL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PLACE_CATEGORY_TYPE_TRAIL_HEAD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PLACE_CATEGORY_TYPE_PHYSICAL_FEATURE_MOUNTAIN"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PLACE_CATEGORY_TYPE_PHYSICAL_FEATURE_VOLCANO"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readInlineRapEnablement
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 331) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInlineRapEnablement_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasInlineRapEnablement
{
  return self->_inlineRapEnablement != 0;
}

- (GEOPDInlineRapEnablement)inlineRapEnablement
{
  -[GEOPDEntity _readInlineRapEnablement]((uint64_t)self);
  inlineRapEnablement = self->_inlineRapEnablement;

  return inlineRapEnablement;
}

- (void)setInlineRapEnablement:(id)a3
{
  *(void *)&self->_flags |= 0x40008000000uLL;
  objc_storeStrong((id *)&self->_inlineRapEnablement, a3);
}

- (unint64_t)mapsCategoryMuid
{
  return self->_mapsCategoryMuid;
}

- (void)setMapsCategoryMuid:(unint64_t)a3
{
  *(void *)&self->_flags |= 0x40000000010uLL;
  self->_mapsCategoryMuid = a3;
}

- (void)setHasMapsCategoryMuid:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (a3) {
    uint64_t v3 = 0x40000000010;
  }
  self->_$F2AA8D11DDD6D71BA01031F215D029B3 flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasMapsCategoryMuid
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (void)_readMapsAltCategoryMuids
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 330) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsAltCategoryMuids_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (unint64_t)mapsAltCategoryMuidsCount
{
  return self->_mapsAltCategoryMuids.count;
}

- (unint64_t)mapsAltCategoryMuids
{
  return self->_mapsAltCategoryMuids.list;
}

- (void)clearMapsAltCategoryMuids
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;

  PBRepeatedUInt64Clear();
}

- (void)addMapsAltCategoryMuid:(unint64_t)a3
{
  if (self) {
    PBRepeatedUInt64Add();
  }
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;
}

- (unint64_t)mapsAltCategoryMuidAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readMapsAltCategoryMuids]((uint64_t)self);
  p_mapsAltCategoryMuids = &self->_mapsAltCategoryMuids;
  unint64_t count = self->_mapsAltCategoryMuids.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_mapsAltCategoryMuids->list[a3];
}

- (void)setMapsAltCategoryMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x40000000000uLL;

  MEMORY[0x1F4147438](&self->_mapsAltCategoryMuids, a3, a4);
}

- (void)_readDisclaimerText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 331) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisclaimerText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasDisclaimerText
{
  return self->_disclaimerText != 0;
}

- (GEOLocalizedString)disclaimerText
{
  -[GEOPDEntity _readDisclaimerText]((uint64_t)self);
  disclaimerText = self->_disclaimerText;

  return disclaimerText;
}

- (void)setDisclaimerText:(id)a3
{
  *(void *)&self->_flags |= 0x40002000000uLL;
  objc_storeStrong((id *)&self->_disclaimerText, a3);
}

- (void)_readUrlData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(unsigned char *)(a1 + 332) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrlData_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasUrlData
{
  return self->_urlData != 0;
}

- (GEOPDURLData)urlData
{
  -[GEOPDEntity _readUrlData]((uint64_t)self);
  urlData = self->_urlData;

  return urlData;
}

- (void)setUrlData:(id)a3
{
  *(void *)&self->_flags |= 0x48000000000uLL;
  objc_storeStrong((id *)&self->_urlData, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDEntity;
  int v4 = [(GEOPDEntity *)&v8 description];
  id v5 = [(GEOPDEntity *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDEntity _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v147 = 0;
    goto LABEL_269;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = &OBJC_IVAR___GEOPDAddressComponent__unknownFields;
  if ((*(unsigned char *)(a1 + 329) & 8) != 0)
  {
    int v6 = *(_DWORD *)(a1 + 316);
    switch(v6)
    {
      case '#':
        id v7 = @"TIME_ZONE";
        break;
      case '$':
      case '%':
      case '&':
      case '\'':
      case '(':
      case ')':
      case '*':
      case '4':
      case '5':
      case '8':
      case ':':
      case ';':
      case '<':
      case '>':
LABEL_9:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 316));
        id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case '+':
        id v7 = @"SUB_LOCALITY";
        break;
      case ',':
        id v7 = @"OCEAN";
        break;
      case '-':
        id v7 = @"AOI";
        break;
      case '.':
        id v7 = @"INLAND_WATER";
        break;
      case '/':
        id v7 = @"BUSINESS";
        break;
      case '0':
        id v7 = @"ISLAND";
        break;
      case '1':
        id v7 = @"STREET";
        break;
      case '2':
        id v7 = @"ADMIN";
        break;
      case '3':
        id v7 = @"POSTAL";
        break;
      case '6':
        id v7 = @"INTERSECTION";
        break;
      case '7':
        id v7 = @"BUILDING";
        break;
      case '9':
        id v7 = @"ADDRESS";
        break;
      case '=':
        id v7 = @"CONTINENT";
        break;
      case '?':
        id v7 = @"REGION";
        break;
      case '@':
        id v7 = @"DIVISION";
        break;
      case 'A':
        id v7 = @"PHYSICAL_FEATURE";
        break;
      default:
        id v7 = @"UNKNOWN_PLACE_TYPE";
        switch(v6)
        {
          case 0:
            goto LABEL_28;
          case 1:
            id v7 = @"COUNTRY";
            break;
          case 2:
            id v7 = @"ADMINISTRATIVE_AREA";
            break;
          case 3:
            goto LABEL_9;
          case 4:
            id v7 = @"SUB_ADMINISTRATIVE_AREA";
            break;
          default:
            if (v6 != 16) {
              goto LABEL_9;
            }
            id v7 = @"LOCALITY";
            break;
        }
        break;
    }
LABEL_28:
    [v4 setObject:v7 forKey:@"type"];
  }
  objc_super v8 = [(id)a1 telephone];
  if (v8) {
    [v4 setObject:v8 forKey:@"telephone"];
  }

  if (*(void *)(a1 + 80))
  {
    uint64_t v9 = [(id)a1 altTelephones];
    if (a2) {
      v10 = @"altTelephone";
    }
    else {
      v10 = @"alt_telephone";
    }
    [v4 setObject:v9 forKey:v10];
  }
  uint64_t v11 = [(id)a1 fax];
  if (v11) {
    [v4 setObject:v11 forKey:@"fax"];
  }

  if (*(void *)(a1 + 72))
  {
    uint64_t v12 = [(id)a1 altFaxs];
    if (a2) {
      uint64_t v13 = @"altFax";
    }
    else {
      uint64_t v13 = @"alt_fax";
    }
    [v4 setObject:v12 forKey:v13];
  }
  v14 = [(id)a1 url];
  if (v14) {
    [v4 setObject:v14 forKey:@"url"];
  }

  if (*(void *)(a1 + 88))
  {
    uint64_t v15 = [(id)a1 altUrls];
    if (a2) {
      uint64_t v16 = @"altUrl";
    }
    else {
      uint64_t v16 = @"alt_url";
    }
    [v4 setObject:v15 forKey:v16];
  }
  uint64_t v17 = *(void *)(a1 + 328);
  if ((v17 & 0x8000) != 0)
  {
    uint64_t v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 323)];
    if (a2) {
      uint64_t v19 = @"isPermanentlyClosed";
    }
    else {
      uint64_t v19 = @"is_permanently_closed";
    }
    [v4 setObject:v18 forKey:v19];

    uint64_t v17 = *(void *)(a1 + 328);
  }
  if ((v17 & 0x4000) != 0)
  {
    uint64_t v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 322)];
    if (a2) {
      uint64_t v21 = @"isDisputed";
    }
    else {
      uint64_t v21 = @"is_disputed";
    }
    [v4 setObject:v20 forKey:v21];
  }
  if ([*(id *)(a1 + 208) count])
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 208), "count"));
    long long v173 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    id v23 = *(id *)(a1 + 208);
    uint64_t v24 = [v23 countByEnumeratingWithState:&v173 objects:v181 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v174;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v174 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void **)(*((void *)&v173 + 1) + 8 * i);
          if (a2) {
            [v28 jsonRepresentation];
          }
          else {
          id v29 = [v28 dictionaryRepresentation];
          }

          [v22 addObject:v29];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v173 objects:v181 count:16];
      }
      while (v25);
    }

    [v4 setObject:v22 forKey:@"name"];
    id v5 = &OBJC_IVAR___GEOPDAddressComponent__unknownFields;
  }
  if ([*(id *)(a1 + 232) count])
  {
    uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 232), "count"));
    long long v169 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    id v31 = *(id *)(a1 + 232);
    uint64_t v32 = [v31 countByEnumeratingWithState:&v169 objects:v180 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v170;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v170 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = *(void **)(*((void *)&v169 + 1) + 8 * j);
          if (a2) {
            [v36 jsonRepresentation];
          }
          else {
          id v37 = [v36 dictionaryRepresentation];
          }

          [v30 addObject:v37];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v169 objects:v180 count:16];
      }
      while (v33);
    }

    if (a2) {
      uint64_t v38 = @"spokenName";
    }
    else {
      uint64_t v38 = @"spoken_name";
    }
    [v4 setObject:v30 forKey:v38];

    id v5 = &OBJC_IVAR___GEOPDAddressComponent__unknownFields;
  }
  if ([*(id *)(a1 + 160) count])
  {
    uint64_t v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 160), "count"));
    long long v165 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    id v40 = *(id *)(a1 + 160);
    uint64_t v41 = [v40 countByEnumeratingWithState:&v165 objects:v179 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v166;
      do
      {
        for (uint64_t k = 0; k != v42; ++k)
        {
          if (*(void *)v166 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = *(void **)(*((void *)&v165 + 1) + 8 * k);
          if (a2) {
            [v45 jsonRepresentation];
          }
          else {
          id v46 = [v45 dictionaryRepresentation];
          }

          [v39 addObject:v46];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v165 objects:v179 count:16];
      }
      while (v42);
    }

    if (a2) {
      id v47 = @"localizedCategory";
    }
    else {
      id v47 = @"localized_category";
    }
    [v4 setObject:v39 forKey:v47];

    id v5 = &OBJC_IVAR___GEOPDAddressComponent__unknownFields;
  }
  uint64_t v48 = *(void *)(a1 + v5[366]);
  if ((v48 & 0x20000) != 0)
  {
    long long v60 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 325)];
    if (a2) {
      long long v61 = @"telephoneAdsOptOut";
    }
    else {
      long long v61 = @"telephone_ads_opt_out";
    }
    [v4 setObject:v60 forKey:v61];

    uint64_t v48 = *(void *)(a1 + 328);
    if ((v48 & 0x1000) == 0)
    {
LABEL_104:
      if ((v48 & 0x10000) == 0) {
        goto LABEL_105;
      }
      goto LABEL_133;
    }
  }
  else if ((v48 & 0x1000) == 0)
  {
    goto LABEL_104;
  }
  long long v62 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 320)];
  if (a2) {
    long long v63 = @"altTelephoneAdsOptOut";
  }
  else {
    long long v63 = @"alt_telephone_ads_opt_out";
  }
  [v4 setObject:v62 forKey:v63];

  uint64_t v48 = *(void *)(a1 + 328);
  if ((v48 & 0x10000) == 0)
  {
LABEL_105:
    if ((v48 & 0x40) == 0) {
      goto LABEL_106;
    }
    goto LABEL_137;
  }
LABEL_133:
  long long v64 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 324)];
  if (a2) {
    long long v65 = @"isStandaloneBrand";
  }
  else {
    long long v65 = @"is_standalone_brand";
  }
  [v4 setObject:v64 forKey:v65];

  uint64_t v48 = *(void *)(a1 + 328);
  if ((v48 & 0x40) == 0)
  {
LABEL_106:
    if ((v48 & 0x400) == 0) {
      goto LABEL_107;
    }
    goto LABEL_235;
  }
LABEL_137:
  uint64_t v66 = *(int *)(a1 + 296);
  if (v66 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 296));
    long long v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v67 = off_1E53E3920[v66];
  }
  if (a2) {
    v119 = @"displayStyle";
  }
  else {
    v119 = @"display_style";
  }
  [v4 setObject:v67 forKey:v119];

  uint64_t v48 = *(void *)(a1 + v5[366]);
  if ((v48 & 0x400) == 0)
  {
LABEL_107:
    if ((v48 & 0x200) == 0) {
      goto LABEL_108;
    }
    goto LABEL_277;
  }
LABEL_235:
  uint64_t v120 = *(int *)(a1 + 312);
  if (v120 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 312));
    v121 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v121 = off_1E53E3938[v120];
  }
  if (a2) {
    v149 = @"searchSection";
  }
  else {
    v149 = @"search_section";
  }
  [v4 setObject:v121 forKey:v149];

  uint64_t v48 = *(void *)(a1 + v5[366]);
  if ((v48 & 0x200) == 0)
  {
LABEL_108:
    if ((v48 & 2) == 0) {
      goto LABEL_109;
    }
    goto LABEL_284;
  }
LABEL_277:
  uint64_t v150 = *(int *)(a1 + 308);
  if (v150 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 308));
    v151 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v151 = off_1E53E3950[v150];
  }
  if (a2) {
    v152 = @"placeDisplayType";
  }
  else {
    v152 = @"place_display_type";
  }
  [v4 setObject:v151 forKey:v152];

  uint64_t v48 = *(void *)(a1 + v5[366]);
  if ((v48 & 2) == 0)
  {
LABEL_109:
    if ((v48 & 0x20) == 0) {
      goto LABEL_111;
    }
    goto LABEL_110;
  }
LABEL_284:
  v153 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 112)];
  if (a2) {
    v154 = @"brandMuid";
  }
  else {
    v154 = @"brand_muid";
  }
  [v4 setObject:v153 forKey:v154];

  if ((*(void *)(a1 + 328) & 0x20) != 0)
  {
LABEL_110:
    long long v49 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 292)];
    [v4 setObject:v49 forKey:@"capacity"];
  }
LABEL_111:
  if (*(void *)(a1 + 56))
  {
    long long v50 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    long long v51 = (void *)(a1 + 48);
    if (*(void *)(a1 + 56))
    {
      unint64_t v52 = 0;
      do
      {
        uint64_t v53 = *(int *)(*v51 + 4 * v52);
        if (v53 >= 0x18)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v53);
          long long v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          long long v54 = off_1E53E4238[v53];
        }
        [v50 addObject:v54];

        ++v52;
        long long v51 = (void *)(a1 + 48);
      }
      while (v52 < *(void *)(a1 + 56));
    }
    if (a2) {
      long long v55 = @"placeLookupCategory";
    }
    else {
      long long v55 = @"place_lookup_category";
    }
    [v4 setObject:v50 forKey:v55];

    id v5 = &OBJC_IVAR___GEOPDAddressComponent__unknownFields;
  }
  long long v56 = [(id)a1 secondaryName];
  long long v57 = v56;
  if (v56)
  {
    if (a2)
    {
      long long v58 = [v56 jsonRepresentation];
      long long v59 = @"secondaryName";
    }
    else
    {
      long long v58 = [v56 dictionaryRepresentation];
      long long v59 = @"secondary_name";
    }
    id v68 = v58;

    [v4 setObject:v68 forKey:v59];
  }

  long long v69 = [(id)a1 secondarySpokenName];
  long long v70 = v69;
  if (v69)
  {
    if (a2)
    {
      long long v71 = [v69 jsonRepresentation];
      long long v72 = @"secondarySpokenName";
    }
    else
    {
      long long v71 = [v69 dictionaryRepresentation];
      long long v72 = @"secondary_spoken_name";
    }
    id v73 = v71;

    [v4 setObject:v73 forKey:v72];
  }

  long long v74 = [(id)a1 styleAttributes];
  long long v75 = v74;
  if (v74)
  {
    if (a2)
    {
      long long v76 = [v74 jsonRepresentation];
      long long v77 = @"styleAttributes";
    }
    else
    {
      long long v76 = [v74 dictionaryRepresentation];
      long long v77 = @"style_attributes";
    }
    id v78 = v76;

    [v4 setObject:v78 forKey:v77];
  }

  long long v79 = [(id)a1 walletCategoryId];
  if (v79)
  {
    if (a2) {
      long long v80 = @"walletCategoryId";
    }
    else {
      long long v80 = @"wallet_category_id";
    }
    [v4 setObject:v79 forKey:v80];
  }

  long long v81 = [(id)a1 mapsCategoryId];
  if (v81)
  {
    if (a2) {
      long long v82 = @"mapsCategoryId";
    }
    else {
      long long v82 = @"maps_category_id";
    }
    [v4 setObject:v81 forKey:v82];
  }

  if ((*(unsigned char *)(a1 + v5[366] + 1) & 0x20) != 0)
  {
    long long v83 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 321)];
    if (a2) {
      long long v84 = @"enableRapLightweightFeedback";
    }
    else {
      long long v84 = @"enable_rap_lightweight_feedback";
    }
    [v4 setObject:v83 forKey:v84];
  }
  if ([*(id *)(a1 + 96) count])
  {
    long long v85 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    long long v161 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    id v86 = *(id *)(a1 + 96);
    uint64_t v87 = [v86 countByEnumeratingWithState:&v161 objects:v178 count:16];
    if (v87)
    {
      uint64_t v88 = v87;
      uint64_t v89 = *(void *)v162;
      do
      {
        for (uint64_t m = 0; m != v88; ++m)
        {
          if (*(void *)v162 != v89) {
            objc_enumerationMutation(v86);
          }
          long long v91 = *(void **)(*((void *)&v161 + 1) + 8 * m);
          if (a2) {
            [v91 jsonRepresentation];
          }
          else {
          id v92 = [v91 dictionaryRepresentation];
          }

          [v85 addObject:v92];
        }
        uint64_t v88 = [v86 countByEnumeratingWithState:&v161 objects:v178 count:16];
      }
      while (v88);
    }

    if (a2) {
      long long v93 = @"alternateSearchableName";
    }
    else {
      long long v93 = @"alternate_searchable_name";
    }
    [v4 setObject:v85 forKey:v93];

    id v5 = &OBJC_IVAR___GEOPDAddressComponent__unknownFields;
  }
  uint64_t v94 = *(void *)(a1 + v5[366]);
  if ((v94 & 8) == 0)
  {
    if ((v94 & 4) == 0) {
      goto LABEL_183;
    }
LABEL_225:
    long long v117 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 120)];
    if (a2) {
      long long v118 = @"buildingId";
    }
    else {
      long long v118 = @"building_id";
    }
    [v4 setObject:v117 forKey:v118];

    if ((*(void *)(a1 + 328) & 1) == 0) {
      goto LABEL_188;
    }
    goto LABEL_184;
  }
  long long v115 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 144)];
  if (a2) {
    long long v116 = @"globalBrandMuid";
  }
  else {
    long long v116 = @"global_brand_muid";
  }
  [v4 setObject:v115 forKey:v116];

  uint64_t v94 = *(void *)(a1 + 328);
  if ((v94 & 4) != 0) {
    goto LABEL_225;
  }
LABEL_183:
  if (v94)
  {
LABEL_184:
    long long v95 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 104)];
    if (a2) {
      long long v96 = @"areaHighlightId";
    }
    else {
      long long v96 = @"area_highlight_id";
    }
    [v4 setObject:v95 forKey:v96];
  }
LABEL_188:
  long long v97 = [(id)a1 modernMapsCategoryId];
  if (v97)
  {
    if (a2) {
      long long v98 = @"modernMapsCategoryId";
    }
    else {
      long long v98 = @"modern_maps_category_id";
    }
    [v4 setObject:v97 forKey:v98];
  }

  if ([*(id *)(a1 + 192) count])
  {
    long long v100 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 192), "count"));
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    id v101 = *(id *)(a1 + 192);
    uint64_t v102 = [v101 countByEnumeratingWithState:&v157 objects:v177 count:16];
    if (v102)
    {
      uint64_t v103 = v102;
      uint64_t v104 = *(void *)v158;
      do
      {
        for (uint64_t n = 0; n != v103; ++n)
        {
          if (*(void *)v158 != v104) {
            objc_enumerationMutation(v101);
          }
          long long v106 = *(void **)(*((void *)&v157 + 1) + 8 * n);
          if (a2) {
            [v106 jsonRepresentation];
          }
          else {
          id v107 = [v106 dictionaryRepresentation];
          }

          [v100 addObject:v107];
        }
        uint64_t v103 = [v101 countByEnumeratingWithState:&v157 objects:v177 count:16];
      }
      while (v103);
    }

    if (a2) {
      long long v108 = @"modernLocalizedCategory";
    }
    else {
      long long v108 = @"modern_localized_category";
    }
    [v4 setObject:v100 forKey:v108];

    id v5 = &OBJC_IVAR___GEOPDAddressComponent__unknownFields;
  }
  if ((*(unsigned char *)(a1 + v5[366]) & 0x80) != 0)
  {
    LODWORD(v99) = *(_DWORD *)(a1 + 300);
    long long v109 = [NSNumber numberWithFloat:v99];
    if (a2) {
      long long v110 = @"photosMemoryScore";
    }
    else {
      long long v110 = @"photos_memory_score";
    }
    [v4 setObject:v109 forKey:v110];
  }
  if (*(void *)(a1 + 168))
  {
    long long v111 = [(id)a1 mapsAltCategoryIds];
    if (a2) {
      long long v112 = @"mapsAltCategoryId";
    }
    else {
      long long v112 = @"maps_alt_category_id";
    }
    [v4 setObject:v111 forKey:v112];
  }
  if (*(unsigned char *)(a1 + v5[366] + 1))
  {
    uint64_t v113 = *(int *)(a1 + 304);
    if (v113 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 304));
      long long v114 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v114 = off_1E53E3980[v113];
    }
    [v4 setObject:v114 forKey:@"placeCategoryType"];
  }
  v122 = [(id)a1 inlineRapEnablement];
  v123 = v122;
  if (v122)
  {
    if (a2)
    {
      v124 = [v122 jsonRepresentation];
      v125 = @"inlineRapEnablement";
    }
    else
    {
      v124 = [v122 dictionaryRepresentation];
      v125 = @"inline_rap_enablement";
    }
    id v126 = v124;

    [v4 setObject:v126 forKey:v125];
  }

  if ((*(unsigned char *)(a1 + v5[366]) & 0x10) != 0)
  {
    v127 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 184)];
    if (a2) {
      uint64_t v128 = @"mapsCategoryMuid";
    }
    else {
      uint64_t v128 = @"maps_category_muid";
    }
    [v4 setObject:v127 forKey:v128];
  }
  if (*(void *)(a1 + 32))
  {
    v129 = PBRepeatedUInt64NSArray();
    if (a2) {
      v130 = @"mapsAltCategoryMuid";
    }
    else {
      v130 = @"maps_alt_category_muid";
    }
    [v4 setObject:v129 forKey:v130];
  }
  v131 = [(id)a1 disclaimerText];
  v132 = v131;
  if (v131)
  {
    if (a2)
    {
      v133 = [v131 jsonRepresentation];
      v134 = @"disclaimerText";
    }
    else
    {
      v133 = [v131 dictionaryRepresentation];
      v134 = @"disclaimer_text";
    }
    id v135 = v133;

    [v4 setObject:v135 forKey:v134];
  }

  v136 = [(id)a1 urlData];
  v137 = v136;
  if (v136)
  {
    if (a2)
    {
      v138 = [v136 jsonRepresentation];
      v139 = @"urlData";
    }
    else
    {
      v138 = [v136 dictionaryRepresentation];
      v139 = @"url_data";
    }
    id v140 = v138;

    [v4 setObject:v140 forKey:v139];
  }

  v141 = *(void **)(a1 + 16);
  if (v141)
  {
    v142 = [v141 dictionaryRepresentation];
    v143 = v142;
    if (a2)
    {
      v144 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v142, "count"));
      v155[0] = MEMORY[0x1E4F143A8];
      v155[1] = 3221225472;
      v155[2] = __41__GEOPDEntity__dictionaryRepresentation___block_invoke;
      v155[3] = &unk_1E53D8860;
      id v145 = v144;
      id v156 = v145;
      [v143 enumerateKeysAndObjectsUsingBlock:v155];
      id v146 = v145;

      v143 = v146;
    }
    [v4 setObject:v143 forKey:@"Unknown Fields"];
  }
  id v147 = v4;

LABEL_269:

  return v147;
}

- (id)jsonRepresentation
{
  return -[GEOPDEntity _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOPDEntity__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (GEOPDEntity)initWithDictionary:(id)a3
{
  return (GEOPDEntity *)-[GEOPDEntity _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v266 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_471;
  }
  id v6 = (id)[a1 init];

  if (!v6)
  {
    a1 = 0;
    goto LABEL_471;
  }
  id v7 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  id v210 = v5;
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN_PLACE_TYPE"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"COUNTRY"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"ADMINISTRATIVE_AREA"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"SUB_ADMINISTRATIVE_AREA"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"LOCALITY"])
    {
      uint64_t v9 = 16;
    }
    else if ([v8 isEqualToString:@"TIME_ZONE"])
    {
      uint64_t v9 = 35;
    }
    else if ([v8 isEqualToString:@"SUB_LOCALITY"])
    {
      uint64_t v9 = 43;
    }
    else if ([v8 isEqualToString:@"OCEAN"])
    {
      uint64_t v9 = 44;
    }
    else if ([v8 isEqualToString:@"AOI"])
    {
      uint64_t v9 = 45;
    }
    else if ([v8 isEqualToString:@"INLAND_WATER"])
    {
      uint64_t v9 = 46;
    }
    else if ([v8 isEqualToString:@"BUSINESS"])
    {
      uint64_t v9 = 47;
    }
    else if ([v8 isEqualToString:@"ISLAND"])
    {
      uint64_t v9 = 48;
    }
    else if ([v8 isEqualToString:@"STREET"])
    {
      uint64_t v9 = 49;
    }
    else if ([v8 isEqualToString:@"ADMIN"])
    {
      uint64_t v9 = 50;
    }
    else if ([v8 isEqualToString:@"POSTAL"])
    {
      uint64_t v9 = 51;
    }
    else if ([v8 isEqualToString:@"INTERSECTION"])
    {
      uint64_t v9 = 54;
    }
    else if ([v8 isEqualToString:@"BUILDING"])
    {
      uint64_t v9 = 55;
    }
    else if ([v8 isEqualToString:@"ADDRESS"])
    {
      uint64_t v9 = 57;
    }
    else if ([v8 isEqualToString:@"CONTINENT"])
    {
      uint64_t v9 = 61;
    }
    else if ([v8 isEqualToString:@"REGION"])
    {
      uint64_t v9 = 63;
    }
    else if ([v8 isEqualToString:@"DIVISION"])
    {
      uint64_t v9 = 64;
    }
    else if ([v8 isEqualToString:@"PHYSICAL_FEATURE"])
    {
      uint64_t v9 = 65;
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
      goto LABEL_54;
    }
    uint64_t v9 = [v7 intValue];
  }
  [v6 setType:v9];
LABEL_54:

  id v10 = [v5 objectForKeyedSubscript:@"telephone"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = (void *)[v10 copy];
    [v6 setTelephone:v11];
  }
  if (a3) {
    uint64_t v12 = @"altTelephone";
  }
  else {
    uint64_t v12 = @"alt_telephone";
  }
  uint64_t v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v253 = 0u;
    long long v254 = 0u;
    long long v251 = 0u;
    long long v252 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v251 objects:v265 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v252;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v252 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v251 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v20 = (void *)[v19 copy];
            [v6 addAltTelephone:v20];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v251 objects:v265 count:16];
      }
      while (v16);
    }

    id v5 = v210;
  }

  uint64_t v21 = [v5 objectForKeyedSubscript:@"fax"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = (void *)[v21 copy];
    [v6 setFax:v22];
  }
  if (a3) {
    id v23 = @"altFax";
  }
  else {
    id v23 = @"alt_fax";
  }
  uint64_t v24 = [v5 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v249 = 0u;
    long long v250 = 0u;
    long long v247 = 0u;
    long long v248 = 0u;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v247 objects:v264 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v248;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v248 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void **)(*((void *)&v247 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v31 = (void *)[v30 copy];
            [v6 addAltFax:v31];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v247 objects:v264 count:16];
      }
      while (v27);
    }

    id v5 = v210;
  }

  uint64_t v32 = [v5 objectForKeyedSubscript:@"url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v33 = (void *)[v32 copy];
    [v6 setUrl:v33];
  }
  if (a3) {
    uint64_t v34 = @"altUrl";
  }
  else {
    uint64_t v34 = @"alt_url";
  }
  char v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v245 = 0u;
    long long v246 = 0u;
    long long v243 = 0u;
    long long v244 = 0u;
    id v36 = v35;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v243 objects:v263 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v244;
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v244 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void **)(*((void *)&v243 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v42 = (void *)[v41 copy];
            [v6 addAltUrl:v42];
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v243 objects:v263 count:16];
      }
      while (v38);
    }

    id v5 = v210;
  }

  if (a3) {
    uint64_t v43 = @"isPermanentlyClosed";
  }
  else {
    uint64_t v43 = @"is_permanently_closed";
  }
  uint64_t v44 = [v5 objectForKeyedSubscript:v43];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIsPermanentlyClosed:", objc_msgSend(v44, "BOOLValue"));
  }

  if (a3) {
    v45 = @"isDisputed";
  }
  else {
    v45 = @"is_disputed";
  }
  id v46 = [v5 objectForKeyedSubscript:v45];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIsDisputed:", objc_msgSend(v46, "BOOLValue"));
  }

  id v47 = [v5 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v241 = 0u;
    long long v242 = 0u;
    long long v239 = 0u;
    long long v240 = 0u;
    v204 = v47;
    id v48 = v47;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v239 objects:v262 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v240;
      do
      {
        for (uint64_t m = 0; m != v50; ++m)
        {
          if (*(void *)v240 != v51) {
            objc_enumerationMutation(v48);
          }
          uint64_t v53 = *(void *)(*((void *)&v239 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v54 = [GEOLocalizedString alloc];
            if (a3) {
              uint64_t v55 = [(GEOLocalizedString *)v54 initWithJSON:v53];
            }
            else {
              uint64_t v55 = [(GEOLocalizedString *)v54 initWithDictionary:v53];
            }
            long long v56 = (void *)v55;
            objc_msgSend(v6, "addName:", v55, v204);
          }
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v239 objects:v262 count:16];
      }
      while (v50);
    }

    id v47 = v204;
    id v5 = v210;
  }

  if (a3) {
    long long v57 = @"spokenName";
  }
  else {
    long long v57 = @"spoken_name";
  }
  long long v58 = objc_msgSend(v5, "objectForKeyedSubscript:", v57, v204);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v237 = 0u;
    long long v238 = 0u;
    long long v235 = 0u;
    long long v236 = 0u;
    v205 = v58;
    id v59 = v58;
    uint64_t v60 = [v59 countByEnumeratingWithState:&v235 objects:v261 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v236;
      do
      {
        for (uint64_t n = 0; n != v61; ++n)
        {
          if (*(void *)v236 != v62) {
            objc_enumerationMutation(v59);
          }
          uint64_t v64 = *(void *)(*((void *)&v235 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v65 = [GEOLocalizedString alloc];
            if (a3) {
              uint64_t v66 = [(GEOLocalizedString *)v65 initWithJSON:v64];
            }
            else {
              uint64_t v66 = [(GEOLocalizedString *)v65 initWithDictionary:v64];
            }
            long long v67 = (void *)v66;
            objc_msgSend(v6, "addSpokenName:", v66, v205);
          }
        }
        uint64_t v61 = [v59 countByEnumeratingWithState:&v235 objects:v261 count:16];
      }
      while (v61);
    }

    long long v58 = v205;
    id v5 = v210;
  }

  if (a3) {
    id v68 = @"localizedCategory";
  }
  else {
    id v68 = @"localized_category";
  }
  long long v69 = objc_msgSend(v5, "objectForKeyedSubscript:", v68, v205);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v233 = 0u;
    long long v234 = 0u;
    long long v231 = 0u;
    long long v232 = 0u;
    v206 = v69;
    id v70 = v69;
    uint64_t v71 = [v70 countByEnumeratingWithState:&v231 objects:v260 count:16];
    if (v71)
    {
      uint64_t v72 = v71;
      uint64_t v73 = *(void *)v232;
      do
      {
        for (iuint64_t i = 0; ii != v72; ++ii)
        {
          if (*(void *)v232 != v73) {
            objc_enumerationMutation(v70);
          }
          uint64_t v75 = *(void *)(*((void *)&v231 + 1) + 8 * ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v76 = [GEOPDCategory alloc];
            if (a3) {
              uint64_t v77 = [(GEOPDCategory *)v76 initWithJSON:v75];
            }
            else {
              uint64_t v77 = [(GEOPDCategory *)v76 initWithDictionary:v75];
            }
            id v78 = (void *)v77;
            objc_msgSend(v6, "addLocalizedCategory:", v77, v206);
          }
        }
        uint64_t v72 = [v70 countByEnumeratingWithState:&v231 objects:v260 count:16];
      }
      while (v72);
    }

    long long v69 = v206;
    id v5 = v210;
  }

  if (a3) {
    long long v79 = @"telephoneAdsOptOut";
  }
  else {
    long long v79 = @"telephone_ads_opt_out";
  }
  long long v80 = objc_msgSend(v5, "objectForKeyedSubscript:", v79, v206);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setTelephoneAdsOptOut:", objc_msgSend(v80, "BOOLValue"));
  }

  if (a3) {
    long long v81 = @"altTelephoneAdsOptOut";
  }
  else {
    long long v81 = @"alt_telephone_ads_opt_out";
  }
  long long v82 = [v5 objectForKeyedSubscript:v81];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setAltTelephoneAdsOptOut:", objc_msgSend(v82, "BOOLValue"));
  }

  if (a3) {
    long long v83 = @"isStandaloneBrand";
  }
  else {
    long long v83 = @"is_standalone_brand";
  }
  long long v84 = [v5 objectForKeyedSubscript:v83];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIsStandaloneBrand:", objc_msgSend(v84, "BOOLValue"));
  }

  if (a3) {
    long long v85 = @"displayStyle";
  }
  else {
    long long v85 = @"display_style";
  }
  id v86 = [v5 objectForKeyedSubscript:v85];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v87 = v86;
    if ([v87 isEqualToString:@"PLACE_DISPLAY_STYLE_UNKNOWN"])
    {
      uint64_t v88 = 0;
    }
    else if ([v87 isEqualToString:@"PLACE_DISPLAY_STYLE_FULL"])
    {
      uint64_t v88 = 1;
    }
    else if ([v87 isEqualToString:@"PLACE_DISPLAY_STYLE_SHORT"])
    {
      uint64_t v88 = 2;
    }
    else
    {
      uint64_t v88 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_190;
    }
    uint64_t v88 = [v86 intValue];
  }
  [v6 setDisplayStyle:v88];
LABEL_190:

  if (a3) {
    uint64_t v89 = @"searchSection";
  }
  else {
    uint64_t v89 = @"search_section";
  }
  long long v90 = [v5 objectForKeyedSubscript:v89];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v91 = v90;
    if ([v91 isEqualToString:@"PLACE_SEARCH_SECTION_UNKNOWN"])
    {
      uint64_t v92 = 0;
    }
    else if ([v91 isEqualToString:@"PLACE_SEARCH_SECTION_MAPS"])
    {
      uint64_t v92 = 1;
    }
    else if ([v91 isEqualToString:@"PLACE_SEARCH_SECTION_BUSINESS"])
    {
      uint64_t v92 = 2;
    }
    else
    {
      uint64_t v92 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_205;
    }
    uint64_t v92 = [v90 intValue];
  }
  [v6 setSearchSection:v92];
LABEL_205:

  if (a3) {
    long long v93 = @"placeDisplayType";
  }
  else {
    long long v93 = @"place_display_type";
  }
  uint64_t v94 = [v5 objectForKeyedSubscript:v93];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v95 = v94;
    if ([v95 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v96 = 0;
    }
    else if ([v95 isEqualToString:@"BUSINESS"])
    {
      uint64_t v96 = 1;
    }
    else if ([v95 isEqualToString:@"REGION"])
    {
      uint64_t v96 = 2;
    }
    else if ([v95 isEqualToString:@"ADDRESS"])
    {
      uint64_t v96 = 3;
    }
    else if ([v95 isEqualToString:@"TRANSIT"])
    {
      uint64_t v96 = 4;
    }
    else if ([v95 isEqualToString:@"BRAND"])
    {
      uint64_t v96 = 5;
    }
    else
    {
      uint64_t v96 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_226;
    }
    uint64_t v96 = [v94 intValue];
  }
  [v6 setPlaceDisplayType:v96];
LABEL_226:

  if (a3) {
    long long v97 = @"brandMuid";
  }
  else {
    long long v97 = @"brand_muid";
  }
  long long v98 = [v5 objectForKeyedSubscript:v97];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setBrandMuid:", objc_msgSend(v98, "unsignedLongLongValue"));
  }

  double v99 = [v5 objectForKeyedSubscript:@"capacity"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setCapacity:", objc_msgSend(v99, "intValue"));
  }

  if (a3) {
    long long v100 = @"placeLookupCategory";
  }
  else {
    long long v100 = @"place_lookup_category";
  }
  id v101 = [v5 objectForKeyedSubscript:v100];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v229 = 0u;
    long long v230 = 0u;
    long long v227 = 0u;
    long long v228 = 0u;
    v207 = v101;
    id v102 = v101;
    uint64_t v103 = [v102 countByEnumeratingWithState:&v227 objects:v259 count:16];
    if (!v103) {
      goto LABEL_298;
    }
    uint64_t v104 = v103;
    uint64_t v105 = *(void *)v228;
    while (1)
    {
      for (juint64_t j = 0; jj != v104; ++jj)
      {
        if (*(void *)v228 != v105) {
          objc_enumerationMutation(v102);
        }
        id v107 = *(void **)(*((void *)&v227 + 1) + 8 * jj);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v108 = v107;
          if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_UNKNOWN"])
          {
            uint64_t v109 = 0;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_ENTERTAINMENT"])
          {
            uint64_t v109 = 1;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK"])
          {
            uint64_t v109 = 2;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AQUARIUM"])
          {
            uint64_t v109 = 3;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_ZOO"])
          {
            uint64_t v109 = 4;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_STADIUM"])
          {
            uint64_t v109 = 5;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_SKATE_PARK"])
          {
            uint64_t v109 = 6;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_CULTURE"])
          {
            uint64_t v109 = 7;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_LANDMARK"])
          {
            uint64_t v109 = 8;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_MUSEUM"])
          {
            uint64_t v109 = 9;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_RESTAURANT"])
          {
            uint64_t v109 = 10;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_NIGHTLIFE"])
          {
            uint64_t v109 = 11;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_PARK"])
          {
            uint64_t v109 = 12;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AIRPORT"])
          {
            uint64_t v109 = 13;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_SHOPPING"])
          {
            uint64_t v109 = 14;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_BEACH"])
          {
            uint64_t v109 = 15;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_MOUNTAIN"])
          {
            uint64_t v109 = 16;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_FITNESS"])
          {
            uint64_t v109 = 17;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_ACTIVITY"])
          {
            uint64_t v109 = 18;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_DIVING"])
          {
            uint64_t v109 = 19;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_HIKING"])
          {
            uint64_t v109 = 20;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_PERFORMANCE"])
          {
            uint64_t v109 = 21;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_HOSPITAL"])
          {
            uint64_t v109 = 22;
          }
          else if ([v108 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK_RIDE"])
          {
            uint64_t v109 = 23;
          }
          else
          {
            uint64_t v109 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v109 = [v107 intValue];
        }
        objc_msgSend(v6, "addPlaceLookupCategory:", v109, v207);
      }
      uint64_t v104 = [v102 countByEnumeratingWithState:&v227 objects:v259 count:16];
      if (!v104)
      {
LABEL_298:

        id v101 = v207;
        id v5 = v210;
        break;
      }
    }
  }

  if (a3) {
    long long v110 = @"secondaryName";
  }
  else {
    long long v110 = @"secondary_name";
  }
  long long v111 = objc_msgSend(v5, "objectForKeyedSubscript:", v110, v207);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v112 = [GEOLocalizedString alloc];
    if (a3) {
      uint64_t v113 = [(GEOLocalizedString *)v112 initWithJSON:v111];
    }
    else {
      uint64_t v113 = [(GEOLocalizedString *)v112 initWithDictionary:v111];
    }
    long long v114 = (void *)v113;
    [v6 setSecondaryName:v113];
  }
  if (a3) {
    long long v115 = @"secondarySpokenName";
  }
  else {
    long long v115 = @"secondary_spoken_name";
  }
  long long v116 = [v5 objectForKeyedSubscript:v115];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v117 = [GEOLocalizedString alloc];
    if (a3) {
      uint64_t v118 = [(GEOLocalizedString *)v117 initWithJSON:v116];
    }
    else {
      uint64_t v118 = [(GEOLocalizedString *)v117 initWithDictionary:v116];
    }
    v119 = (void *)v118;
    [v6 setSecondarySpokenName:v118];
  }
  if (a3) {
    uint64_t v120 = @"styleAttributes";
  }
  else {
    uint64_t v120 = @"style_attributes";
  }
  v121 = [v5 objectForKeyedSubscript:v120];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v122 = [GEOStyleAttributes alloc];
    if (a3) {
      uint64_t v123 = [(GEOStyleAttributes *)v122 initWithJSON:v121];
    }
    else {
      uint64_t v123 = [(GEOStyleAttributes *)v122 initWithDictionary:v121];
    }
    v124 = (void *)v123;
    [v6 setStyleAttributes:v123];
  }
  if (a3) {
    v125 = @"walletCategoryId";
  }
  else {
    v125 = @"wallet_category_id";
  }
  id v126 = [v5 objectForKeyedSubscript:v125];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v127 = (void *)[v126 copy];
    [v6 setWalletCategoryId:v127];
  }
  if (a3) {
    uint64_t v128 = @"mapsCategoryId";
  }
  else {
    uint64_t v128 = @"maps_category_id";
  }
  v129 = [v5 objectForKeyedSubscript:v128];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v130 = (void *)[v129 copy];
    [v6 setMapsCategoryId:v130];
  }
  if (a3) {
    v131 = @"enableRapLightweightFeedback";
  }
  else {
    v131 = @"enable_rap_lightweight_feedback";
  }
  v132 = [v5 objectForKeyedSubscript:v131];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setEnableRapLightweightFeedback:", objc_msgSend(v132, "BOOLValue"));
  }

  if (a3) {
    v133 = @"alternateSearchableName";
  }
  else {
    v133 = @"alternate_searchable_name";
  }
  v134 = [v5 objectForKeyedSubscript:v133];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v225 = 0u;
    long long v226 = 0u;
    long long v223 = 0u;
    long long v224 = 0u;
    v208 = v134;
    id v135 = v134;
    uint64_t v136 = [v135 countByEnumeratingWithState:&v223 objects:v258 count:16];
    if (v136)
    {
      uint64_t v137 = v136;
      uint64_t v138 = *(void *)v224;
      do
      {
        for (kuint64_t k = 0; kk != v137; ++kk)
        {
          if (*(void *)v224 != v138) {
            objc_enumerationMutation(v135);
          }
          uint64_t v140 = *(void *)(*((void *)&v223 + 1) + 8 * kk);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v141 = [GEOLocalizedString alloc];
            if (a3) {
              uint64_t v142 = [(GEOLocalizedString *)v141 initWithJSON:v140];
            }
            else {
              uint64_t v142 = [(GEOLocalizedString *)v141 initWithDictionary:v140];
            }
            v143 = (void *)v142;
            objc_msgSend(v6, "addAlternateSearchableName:", v142, v208);
          }
        }
        uint64_t v137 = [v135 countByEnumeratingWithState:&v223 objects:v258 count:16];
      }
      while (v137);
    }

    v134 = v208;
    id v5 = v210;
  }

  if (a3) {
    v144 = @"globalBrandMuid";
  }
  else {
    v144 = @"global_brand_muid";
  }
  id v145 = objc_msgSend(v5, "objectForKeyedSubscript:", v144, v208);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setGlobalBrandMuid:", objc_msgSend(v145, "unsignedLongLongValue"));
  }

  if (a3) {
    id v146 = @"buildingId";
  }
  else {
    id v146 = @"building_id";
  }
  id v147 = [v5 objectForKeyedSubscript:v146];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setBuildingId:", objc_msgSend(v147, "unsignedLongLongValue"));
  }

  if (a3) {
    v148 = @"areaHighlightId";
  }
  else {
    v148 = @"area_highlight_id";
  }
  v149 = [v5 objectForKeyedSubscript:v148];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setAreaHighlightId:", objc_msgSend(v149, "unsignedLongLongValue"));
  }

  if (a3) {
    uint64_t v150 = @"modernMapsCategoryId";
  }
  else {
    uint64_t v150 = @"modern_maps_category_id";
  }
  v151 = [v5 objectForKeyedSubscript:v150];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v152 = (void *)[v151 copy];
    [v6 setModernMapsCategoryId:v152];
  }
  if (a3) {
    v153 = @"modernLocalizedCategory";
  }
  else {
    v153 = @"modern_localized_category";
  }
  v154 = [v5 objectForKeyedSubscript:v153];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v221 = 0u;
    long long v222 = 0u;
    long long v219 = 0u;
    long long v220 = 0u;
    v209 = v154;
    id v155 = v154;
    uint64_t v156 = [v155 countByEnumeratingWithState:&v219 objects:v257 count:16];
    if (v156)
    {
      uint64_t v157 = v156;
      uint64_t v158 = *(void *)v220;
      do
      {
        for (muint64_t m = 0; mm != v157; ++mm)
        {
          if (*(void *)v220 != v158) {
            objc_enumerationMutation(v155);
          }
          uint64_t v160 = *(void *)(*((void *)&v219 + 1) + 8 * mm);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v161 = [GEOPDCategory alloc];
            if (a3) {
              uint64_t v162 = [(GEOPDCategory *)v161 initWithJSON:v160];
            }
            else {
              uint64_t v162 = [(GEOPDCategory *)v161 initWithDictionary:v160];
            }
            long long v163 = (void *)v162;
            objc_msgSend(v6, "addModernLocalizedCategory:", v162, v209);
          }
        }
        uint64_t v157 = [v155 countByEnumeratingWithState:&v219 objects:v257 count:16];
      }
      while (v157);
    }

    v154 = v209;
    id v5 = v210;
  }

  if (a3) {
    long long v164 = @"photosMemoryScore";
  }
  else {
    long long v164 = @"photos_memory_score";
  }
  long long v165 = objc_msgSend(v5, "objectForKeyedSubscript:", v164, v209);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v165 floatValue];
    objc_msgSend(v6, "setPhotosMemoryScore:");
  }

  if (a3) {
    long long v166 = @"mapsAltCategoryId";
  }
  else {
    long long v166 = @"maps_alt_category_id";
  }
  long long v167 = [v5 objectForKeyedSubscript:v166];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v217 = 0u;
    long long v218 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    id v168 = v167;
    uint64_t v169 = [v168 countByEnumeratingWithState:&v215 objects:v256 count:16];
    if (v169)
    {
      uint64_t v170 = v169;
      uint64_t v171 = *(void *)v216;
      do
      {
        for (nuint64_t n = 0; nn != v170; ++nn)
        {
          if (*(void *)v216 != v171) {
            objc_enumerationMutation(v168);
          }
          long long v173 = *(void **)(*((void *)&v215 + 1) + 8 * nn);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v174 = (void *)[v173 copy];
            [v6 addMapsAltCategoryId:v174];
          }
        }
        uint64_t v170 = [v168 countByEnumeratingWithState:&v215 objects:v256 count:16];
      }
      while (v170);
    }

    id v5 = v210;
  }

  long long v175 = [v5 objectForKeyedSubscript:@"placeCategoryType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v176 = v175;
    if ([v176 isEqualToString:@"PLACE_CATEGORY_TYPE_UNKNOWN"])
    {
      uint64_t v177 = 0;
    }
    else if ([v176 isEqualToString:@"PLACE_CATEGORY_TYPE_TRAIL"])
    {
      uint64_t v177 = 1;
    }
    else if ([v176 isEqualToString:@"PLACE_CATEGORY_TYPE_TRAIL_HEAD"])
    {
      uint64_t v177 = 2;
    }
    else if ([v176 isEqualToString:@"PLACE_CATEGORY_TYPE_PHYSICAL_FEATURE_MOUNTAIN"])
    {
      uint64_t v177 = 3;
    }
    else if ([v176 isEqualToString:@"PLACE_CATEGORY_TYPE_PHYSICAL_FEATURE_VOLCANO"])
    {
      uint64_t v177 = 4;
    }
    else
    {
      uint64_t v177 = 0;
    }

    goto LABEL_426;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v177 = [v175 intValue];
LABEL_426:
    [v6 setPlaceCategoryType:v177];
  }

  if (a3) {
    v178 = @"inlineRapEnablement";
  }
  else {
    v178 = @"inline_rap_enablement";
  }
  v179 = [v5 objectForKeyedSubscript:v178];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v180 = [GEOPDInlineRapEnablement alloc];
    if (a3) {
      uint64_t v181 = [(GEOPDInlineRapEnablement *)v180 initWithJSON:v179];
    }
    else {
      uint64_t v181 = [(GEOPDInlineRapEnablement *)v180 initWithDictionary:v179];
    }
    uint64_t v182 = (void *)v181;
    [v6 setInlineRapEnablement:v181];
  }
  if (a3) {
    v183 = @"mapsCategoryMuid";
  }
  else {
    v183 = @"maps_category_muid";
  }
  v184 = [v5 objectForKeyedSubscript:v183];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setMapsCategoryMuid:", objc_msgSend(v184, "unsignedLongLongValue"));
  }

  if (a3) {
    v185 = @"mapsAltCategoryMuid";
  }
  else {
    v185 = @"maps_alt_category_muid";
  }
  v186 = [v5 objectForKeyedSubscript:v185];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v213 = 0u;
    long long v214 = 0u;
    long long v211 = 0u;
    long long v212 = 0u;
    id v187 = v186;
    uint64_t v188 = [v187 countByEnumeratingWithState:&v211 objects:v255 count:16];
    if (v188)
    {
      uint64_t v189 = v188;
      uint64_t v190 = *(void *)v212;
      do
      {
        for (uint64_t i1 = 0; i1 != v189; ++i1)
        {
          if (*(void *)v212 != v190) {
            objc_enumerationMutation(v187);
          }
          v192 = *(void **)(*((void *)&v211 + 1) + 8 * i1);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v6, "addMapsAltCategoryMuid:", objc_msgSend(v192, "unsignedLongLongValue"));
          }
        }
        uint64_t v189 = [v187 countByEnumeratingWithState:&v211 objects:v255 count:16];
      }
      while (v189);
    }

    id v5 = v210;
  }

  if (a3) {
    v193 = @"disclaimerText";
  }
  else {
    v193 = @"disclaimer_text";
  }
  v194 = [v5 objectForKeyedSubscript:v193];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v195 = [GEOLocalizedString alloc];
    if (a3) {
      uint64_t v196 = [(GEOLocalizedString *)v195 initWithJSON:v194];
    }
    else {
      uint64_t v196 = [(GEOLocalizedString *)v195 initWithDictionary:v194];
    }
    v197 = (void *)v196;
    [v6 setDisclaimerText:v196];
  }
  if (a3) {
    v198 = @"urlData";
  }
  else {
    v198 = @"url_data";
  }
  v199 = [v5 objectForKeyedSubscript:v198];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v200 = [GEOPDURLData alloc];
    if (a3) {
      uint64_t v201 = [(GEOPDURLData *)v200 initWithJSON:v199];
    }
    else {
      uint64_t v201 = [(GEOPDURLData *)v200 initWithDictionary:v199];
    }
    v202 = (void *)v201;
    [v6 setUrlData:v201];
  }
  a1 = v6;

LABEL_471:
  return a1;
}

- (GEOPDEntity)initWithJSON:(id)a3
{
  return (GEOPDEntity *)-[GEOPDEntity _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDEntityIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDEntityReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  uint64_t v51 = (id *)a3;
  [(GEOPDEntity *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v51 + 1, self->_reader);
  *((_DWORD *)v51 + 70) = self->_readerMarkPos;
  *((_DWORD *)v51 + 71) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0)
  {
    *((_DWORD *)v51 + 79) = self->_type;
    v51[41] = (id)((unint64_t)v51[41] | 0x800);
  }
  if (self->_telephone) {
    objc_msgSend(v51, "setTelephone:");
  }
  if ([(GEOPDEntity *)self altTelephonesCount])
  {
    [v51 clearAltTelephones];
    unint64_t v4 = [(GEOPDEntity *)self altTelephonesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(GEOPDEntity *)self altTelephoneAtIndex:i];
        [v51 addAltTelephone:v7];
      }
    }
  }
  if (self->_fax) {
    objc_msgSend(v51, "setFax:");
  }
  if ([(GEOPDEntity *)self altFaxsCount])
  {
    [v51 clearAltFaxs];
    unint64_t v8 = [(GEOPDEntity *)self altFaxsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOPDEntity *)self altFaxAtIndex:j];
        [v51 addAltFax:v11];
      }
    }
  }
  if (self->_url) {
    objc_msgSend(v51, "setUrl:");
  }
  if ([(GEOPDEntity *)self altUrlsCount])
  {
    [v51 clearAltUrls];
    unint64_t v12 = [(GEOPDEntity *)self altUrlsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOPDEntity *)self altUrlAtIndex:k];
        [v51 addAltUrl:v15];
      }
    }
  }
  $F2AA8D11DDD6D71BA01031F215D029B3 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    *((unsigned char *)v51 + 323) = self->_isPermanentlyClosed;
    v51[41] = (id)((unint64_t)v51[41] | 0x8000);
    $F2AA8D11DDD6D71BA01031F215D029B3 flags = self->_flags;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    *((unsigned char *)v51 + 322) = self->_isDisputed;
    v51[41] = (id)((unint64_t)v51[41] | 0x4000);
  }
  if ([(GEOPDEntity *)self namesCount])
  {
    [v51 clearNames];
    unint64_t v17 = [(GEOPDEntity *)self namesCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        uint64_t v20 = [(GEOPDEntity *)self nameAtIndex:m];
        [v51 addName:v20];
      }
    }
  }
  if ([(GEOPDEntity *)self spokenNamesCount])
  {
    [v51 clearSpokenNames];
    unint64_t v21 = [(GEOPDEntity *)self spokenNamesCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = [(GEOPDEntity *)self spokenNameAtIndex:n];
        [v51 addSpokenName:v24];
      }
    }
  }
  if ([(GEOPDEntity *)self localizedCategorysCount])
  {
    [v51 clearLocalizedCategorys];
    unint64_t v25 = [(GEOPDEntity *)self localizedCategorysCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        uint64_t v28 = [(GEOPDEntity *)self localizedCategoryAtIndex:ii];
        [v51 addLocalizedCategory:v28];
      }
    }
  }
  $F2AA8D11DDD6D71BA01031F215D029B3 v29 = self->_flags;
  if ((*(_DWORD *)&v29 & 0x20000) != 0)
  {
    *((unsigned char *)v51 + 325) = self->_telephoneAdsOptOut;
    v51[41] = (id)((unint64_t)v51[41] | 0x20000);
    $F2AA8D11DDD6D71BA01031F215D029B3 v29 = self->_flags;
    if ((*(_WORD *)&v29 & 0x1000) == 0)
    {
LABEL_39:
      if ((*(_DWORD *)&v29 & 0x10000) == 0) {
        goto LABEL_40;
      }
      goto LABEL_101;
    }
  }
  else if ((*(_WORD *)&v29 & 0x1000) == 0)
  {
    goto LABEL_39;
  }
  *((unsigned char *)v51 + 320) = self->_altTelephoneAdsOptOut;
  v51[41] = (id)((unint64_t)v51[41] | 0x1000);
  $F2AA8D11DDD6D71BA01031F215D029B3 v29 = self->_flags;
  if ((*(_DWORD *)&v29 & 0x10000) == 0)
  {
LABEL_40:
    if ((*(unsigned char *)&v29 & 0x40) == 0) {
      goto LABEL_41;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((unsigned char *)v51 + 324) = self->_isStandaloneBrand;
  v51[41] = (id)((unint64_t)v51[41] | 0x10000);
  $F2AA8D11DDD6D71BA01031F215D029B3 v29 = self->_flags;
  if ((*(unsigned char *)&v29 & 0x40) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v29 & 0x400) == 0) {
      goto LABEL_42;
    }
    goto LABEL_103;
  }
LABEL_102:
  *((_DWORD *)v51 + 74) = self->_displayStyle;
  v51[41] = (id)((unint64_t)v51[41] | 0x40);
  $F2AA8D11DDD6D71BA01031F215D029B3 v29 = self->_flags;
  if ((*(_WORD *)&v29 & 0x400) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v29 & 0x200) == 0) {
      goto LABEL_43;
    }
    goto LABEL_104;
  }
LABEL_103:
  *((_DWORD *)v51 + 78) = self->_searchSection;
  v51[41] = (id)((unint64_t)v51[41] | 0x400);
  $F2AA8D11DDD6D71BA01031F215D029B3 v29 = self->_flags;
  if ((*(_WORD *)&v29 & 0x200) == 0)
  {
LABEL_43:
    if ((*(unsigned char *)&v29 & 2) == 0) {
      goto LABEL_44;
    }
LABEL_105:
    v51[14] = self->_brandMuid;
    v51[41] = (id)((unint64_t)v51[41] | 2);
    if ((*(void *)&self->_flags & 0x20) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_104:
  *((_DWORD *)v51 + 77) = self->_placeDisplayType;
  v51[41] = (id)((unint64_t)v51[41] | 0x200);
  $F2AA8D11DDD6D71BA01031F215D029B3 v29 = self->_flags;
  if ((*(unsigned char *)&v29 & 2) != 0) {
    goto LABEL_105;
  }
LABEL_44:
  if ((*(unsigned char *)&v29 & 0x20) != 0)
  {
LABEL_45:
    *((_DWORD *)v51 + 73) = self->_capacity;
    v51[41] = (id)((unint64_t)v51[41] | 0x20);
  }
LABEL_46:
  if ([(GEOPDEntity *)self placeLookupCategorysCount])
  {
    [v51 clearPlaceLookupCategorys];
    unint64_t v30 = [(GEOPDEntity *)self placeLookupCategorysCount];
    if (v30)
    {
      unint64_t v31 = v30;
      for (juint64_t j = 0; jj != v31; ++jj)
        objc_msgSend(v51, "addPlaceLookupCategory:", -[GEOPDEntity placeLookupCategoryAtIndex:](self, "placeLookupCategoryAtIndex:", jj));
    }
  }
  if (self->_secondaryName) {
    objc_msgSend(v51, "setSecondaryName:");
  }
  if (self->_secondarySpokenName) {
    objc_msgSend(v51, "setSecondarySpokenName:");
  }
  if (self->_styleAttributes) {
    objc_msgSend(v51, "setStyleAttributes:");
  }
  if (self->_walletCategoryId) {
    objc_msgSend(v51, "setWalletCategoryId:");
  }
  if (self->_mapsCategoryId) {
    objc_msgSend(v51, "setMapsCategoryId:");
  }
  if ((*((unsigned char *)&self->_flags + 1) & 0x20) != 0)
  {
    *((unsigned char *)v51 + 321) = self->_enableRapLightweightFeedback;
    v51[41] = (id)((unint64_t)v51[41] | 0x2000);
  }
  if ([(GEOPDEntity *)self alternateSearchableNamesCount])
  {
    [v51 clearAlternateSearchableNames];
    unint64_t v33 = [(GEOPDEntity *)self alternateSearchableNamesCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (kuint64_t k = 0; kk != v34; ++kk)
      {
        id v36 = [(GEOPDEntity *)self alternateSearchableNameAtIndex:kk];
        [v51 addAlternateSearchableName:v36];
      }
    }
  }
  $F2AA8D11DDD6D71BA01031F215D029B3 v37 = self->_flags;
  if ((*(unsigned char *)&v37 & 8) != 0)
  {
    v51[18] = self->_globalBrandMuid;
    v51[41] = (id)((unint64_t)v51[41] | 8);
    $F2AA8D11DDD6D71BA01031F215D029B3 v37 = self->_flags;
    if ((*(unsigned char *)&v37 & 4) == 0)
    {
LABEL_68:
      if ((*(unsigned char *)&v37 & 1) == 0) {
        goto LABEL_70;
      }
      goto LABEL_69;
    }
  }
  else if ((*(unsigned char *)&v37 & 4) == 0)
  {
    goto LABEL_68;
  }
  v51[15] = self->_buildingId;
  v51[41] = (id)((unint64_t)v51[41] | 4);
  if (*(void *)&self->_flags)
  {
LABEL_69:
    v51[13] = self->_areaHighlightId;
    v51[41] = (id)((unint64_t)v51[41] | 1);
  }
LABEL_70:
  if (self->_modernMapsCategoryId) {
    objc_msgSend(v51, "setModernMapsCategoryId:");
  }
  if ([(GEOPDEntity *)self modernLocalizedCategorysCount])
  {
    [v51 clearModernLocalizedCategorys];
    unint64_t v38 = [(GEOPDEntity *)self modernLocalizedCategorysCount];
    if (v38)
    {
      unint64_t v39 = v38;
      for (muint64_t m = 0; mm != v39; ++mm)
      {
        uint64_t v41 = [(GEOPDEntity *)self modernLocalizedCategoryAtIndex:mm];
        [v51 addModernLocalizedCategory:v41];
      }
    }
  }
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    *((_DWORD *)v51 + 75) = LODWORD(self->_photosMemoryScore);
    v51[41] = (id)((unint64_t)v51[41] | 0x80);
  }
  if ([(GEOPDEntity *)self mapsAltCategoryIdsCount])
  {
    [v51 clearMapsAltCategoryIds];
    unint64_t v42 = [(GEOPDEntity *)self mapsAltCategoryIdsCount];
    if (v42)
    {
      unint64_t v43 = v42;
      for (nuint64_t n = 0; nn != v43; ++nn)
      {
        v45 = [(GEOPDEntity *)self mapsAltCategoryIdAtIndex:nn];
        [v51 addMapsAltCategoryId:v45];
      }
    }
  }
  id v46 = v51;
  if (*((unsigned char *)&self->_flags + 1))
  {
    *((_DWORD *)v51 + 76) = self->_placeCategoryType;
    v51[41] = (id)((unint64_t)v51[41] | 0x100);
  }
  if (self->_inlineRapEnablement)
  {
    objc_msgSend(v51, "setInlineRapEnablement:");
    id v46 = v51;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    v46[23] = self->_mapsCategoryMuid;
    v46[41] = (id)((unint64_t)v46[41] | 0x10);
  }
  if ([(GEOPDEntity *)self mapsAltCategoryMuidsCount])
  {
    [v51 clearMapsAltCategoryMuids];
    unint64_t v47 = [(GEOPDEntity *)self mapsAltCategoryMuidsCount];
    if (v47)
    {
      unint64_t v48 = v47;
      for (uint64_t i1 = 0; i1 != v48; ++i1)
        objc_msgSend(v51, "addMapsAltCategoryMuid:", -[GEOPDEntity mapsAltCategoryMuidAtIndex:](self, "mapsAltCategoryMuidAtIndex:", i1));
    }
  }
  if (self->_disclaimerText) {
    objc_msgSend(v51, "setDisclaimerText:");
  }
  uint64_t v50 = v51;
  if (self->_urlData)
  {
    objc_msgSend(v51, "setUrlData:");
    uint64_t v50 = v51;
  }
}

- (unint64_t)hash
{
  [(GEOPDEntity *)self readAll:1];
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0) {
    uint64_t v52 = 2654435761 * self->_type;
  }
  else {
    uint64_t v52 = 0;
  }
  NSUInteger v51 = [(NSString *)self->_telephone hash];
  uint64_t v50 = [(NSMutableArray *)self->_altTelephones hash];
  NSUInteger v49 = [(NSString *)self->_fax hash];
  uint64_t v48 = [(NSMutableArray *)self->_altFaxs hash];
  NSUInteger v47 = [(NSString *)self->_url hash];
  uint64_t v46 = [(NSMutableArray *)self->_altUrls hash];
  $F2AA8D11DDD6D71BA01031F215D029B3 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    uint64_t v45 = 2654435761 * self->_isPermanentlyClosed;
    if ((*(_WORD *)&flags & 0x4000) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v45 = 0;
    if ((*(_WORD *)&flags & 0x4000) != 0)
    {
LABEL_6:
      uint64_t v44 = 2654435761 * self->_isDisputed;
      goto LABEL_9;
    }
  }
  uint64_t v44 = 0;
LABEL_9:
  uint64_t v43 = [(NSMutableArray *)self->_names hash];
  uint64_t v42 = [(NSMutableArray *)self->_spokenNames hash];
  uint64_t v41 = [(NSMutableArray *)self->_localizedCategorys hash];
  $F2AA8D11DDD6D71BA01031F215D029B3 v4 = self->_flags;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
    uint64_t v40 = 2654435761 * self->_telephoneAdsOptOut;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
    {
LABEL_11:
      uint64_t v39 = 2654435761 * self->_altTelephoneAdsOptOut;
      if ((*(_DWORD *)&v4 & 0x10000) != 0) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v40 = 0;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_11;
    }
  }
  uint64_t v39 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_12:
    uint64_t v38 = 2654435761 * self->_isStandaloneBrand;
    if ((*(unsigned char *)&v4 & 0x40) != 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v38 = 0;
  if ((*(unsigned char *)&v4 & 0x40) != 0)
  {
LABEL_13:
    uint64_t v37 = 2654435761 * self->_displayStyle;
    if ((*(_WORD *)&v4 & 0x400) != 0) {
      goto LABEL_14;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v37 = 0;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_14:
    uint64_t v36 = 2654435761 * self->_searchSection;
    if ((*(_WORD *)&v4 & 0x200) != 0) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v36 = 0;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_15:
    uint64_t v35 = 2654435761 * self->_placeDisplayType;
    if ((*(unsigned char *)&v4 & 2) != 0) {
      goto LABEL_16;
    }
LABEL_24:
    unint64_t v34 = 0;
    if ((*(unsigned char *)&v4 & 0x20) != 0) {
      goto LABEL_17;
    }
    goto LABEL_25;
  }
LABEL_23:
  uint64_t v35 = 0;
  if ((*(unsigned char *)&v4 & 2) == 0) {
    goto LABEL_24;
  }
LABEL_16:
  unint64_t v34 = 2654435761u * self->_brandMuid;
  if ((*(unsigned char *)&v4 & 0x20) != 0)
  {
LABEL_17:
    uint64_t v33 = 2654435761 * self->_capacity;
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v33 = 0;
LABEL_26:
  uint64_t v32 = PBRepeatedInt32Hash();
  unint64_t v31 = [(GEOLocalizedString *)self->_secondaryName hash];
  unint64_t v30 = [(GEOLocalizedString *)self->_secondarySpokenName hash];
  unint64_t v29 = [(GEOStyleAttributes *)self->_styleAttributes hash];
  NSUInteger v28 = [(NSString *)self->_walletCategoryId hash];
  NSUInteger v27 = [(NSString *)self->_mapsCategoryId hash];
  if ((*((unsigned char *)&self->_flags + 1) & 0x20) != 0) {
    uint64_t v26 = 2654435761 * self->_enableRapLightweightFeedback;
  }
  else {
    uint64_t v26 = 0;
  }
  uint64_t v25 = [(NSMutableArray *)self->_alternateSearchableNames hash];
  $F2AA8D11DDD6D71BA01031F215D029B3 v5 = self->_flags;
  if ((*(unsigned char *)&v5 & 8) == 0)
  {
    unint64_t v23 = 0;
    if ((*(unsigned char *)&v5 & 4) != 0) {
      goto LABEL_31;
    }
LABEL_34:
    unint64_t v6 = 0;
    if (*(unsigned char *)&v5) {
      goto LABEL_32;
    }
    goto LABEL_35;
  }
  unint64_t v23 = 2654435761u * self->_globalBrandMuid;
  if ((*(unsigned char *)&v5 & 4) == 0) {
    goto LABEL_34;
  }
LABEL_31:
  unint64_t v6 = 2654435761u * self->_buildingId;
  if (*(unsigned char *)&v5)
  {
LABEL_32:
    unint64_t v7 = 2654435761u * self->_areaHighlightId;
    goto LABEL_36;
  }
LABEL_35:
  unint64_t v7 = 0;
LABEL_36:
  NSUInteger v8 = [(NSString *)self->_modernMapsCategoryId hash];
  uint64_t v9 = [(NSMutableArray *)self->_modernLocalizedCategorys hash];
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    float photosMemoryScore = self->_photosMemoryScore;
    double v12 = photosMemoryScore;
    if (photosMemoryScore < 0.0) {
      double v12 = -photosMemoryScore;
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
  uint64_t v15 = [(NSMutableArray *)self->_mapsAltCategoryIds hash];
  if (*((unsigned char *)&self->_flags + 1)) {
    uint64_t v16 = 2654435761 * self->_placeCategoryType;
  }
  else {
    uint64_t v16 = 0;
  }
  unint64_t v17 = [(GEOPDInlineRapEnablement *)self->_inlineRapEnablement hash];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    unint64_t v18 = 2654435761u * self->_mapsCategoryMuid;
  }
  else {
    unint64_t v18 = 0;
  }
  NSUInteger v19 = v51 ^ v52 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v15 ^ v16 ^ v17 ^ v18;
  uint64_t v20 = PBRepeatedUInt64Hash();
  unint64_t v21 = v20 ^ [(GEOLocalizedString *)self->_disclaimerText hash];
  return v19 ^ v21 ^ [(GEOPDURLData *)self->_urlData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((unsigned char *)v4 + 329) & 8) != 0)
  {
    self->_type = *((_DWORD *)v4 + 79);
    *(void *)&self->_flags |= 0x800uLL;
  }
  if (*((void *)v4 + 31)) {
    -[GEOPDEntity setTelephone:](self, "setTelephone:");
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v5 = *((id *)v4 + 10);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v103 objects:v115 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v104;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v104 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOPDEntity *)self addAltTelephone:*(void *)(*((void *)&v103 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v103 objects:v115 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 17)) {
    -[GEOPDEntity setFax:](self, "setFax:");
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v10 = *((id *)v4 + 9);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v99 objects:v114 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v100;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v100 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOPDEntity *)self addAltFax:*(void *)(*((void *)&v99 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v99 objects:v114 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 33)) {
    -[GEOPDEntity setUrl:](self, "setUrl:");
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v15 = *((id *)v4 + 11);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v95 objects:v113 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v96;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v96 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEOPDEntity *)self addAltUrl:*(void *)(*((void *)&v95 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v95 objects:v113 count:16];
    }
    while (v17);
  }

  uint64_t v20 = *((void *)v4 + 41);
  if ((v20 & 0x8000) != 0)
  {
    self->_isPermanentlyClosed = *((unsigned char *)v4 + 323);
    *(void *)&self->_flags |= 0x8000uLL;
    uint64_t v20 = *((void *)v4 + 41);
  }
  if ((v20 & 0x4000) != 0)
  {
    self->_isDisputed = *((unsigned char *)v4 + 322);
    *(void *)&self->_flags |= 0x4000uLL;
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v21 = *((id *)v4 + 26);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v91 objects:v112 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v92;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v92 != v24) {
          objc_enumerationMutation(v21);
        }
        [(GEOPDEntity *)self addName:*(void *)(*((void *)&v91 + 1) + 8 * m)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v91 objects:v112 count:16];
    }
    while (v23);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v26 = *((id *)v4 + 29);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v87 objects:v111 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v88;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v88 != v29) {
          objc_enumerationMutation(v26);
        }
        [(GEOPDEntity *)self addSpokenName:*(void *)(*((void *)&v87 + 1) + 8 * n)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v87 objects:v111 count:16];
    }
    while (v28);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v31 = *((id *)v4 + 20);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v83 objects:v110 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v84;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v84 != v34) {
          objc_enumerationMutation(v31);
        }
        [(GEOPDEntity *)self addLocalizedCategory:*(void *)(*((void *)&v83 + 1) + 8 * ii)];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v83 objects:v110 count:16];
    }
    while (v33);
  }

  uint64_t v36 = *((void *)v4 + 41);
  if ((v36 & 0x20000) != 0)
  {
    self->_telephoneAdsOptOut = *((unsigned char *)v4 + 325);
    *(void *)&self->_flags |= 0x20000uLL;
    uint64_t v36 = *((void *)v4 + 41);
    if ((v36 & 0x1000) == 0)
    {
LABEL_57:
      if ((v36 & 0x10000) == 0) {
        goto LABEL_58;
      }
      goto LABEL_72;
    }
  }
  else if ((v36 & 0x1000) == 0)
  {
    goto LABEL_57;
  }
  self->_altTelephoneAdsOptOut = *((unsigned char *)v4 + 320);
  *(void *)&self->_flags |= 0x1000uLL;
  uint64_t v36 = *((void *)v4 + 41);
  if ((v36 & 0x10000) == 0)
  {
LABEL_58:
    if ((v36 & 0x40) == 0) {
      goto LABEL_59;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_isStandaloneBrand = *((unsigned char *)v4 + 324);
  *(void *)&self->_flags |= 0x10000uLL;
  uint64_t v36 = *((void *)v4 + 41);
  if ((v36 & 0x40) == 0)
  {
LABEL_59:
    if ((v36 & 0x400) == 0) {
      goto LABEL_60;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_displayStyle = *((_DWORD *)v4 + 74);
  *(void *)&self->_flags |= 0x40uLL;
  uint64_t v36 = *((void *)v4 + 41);
  if ((v36 & 0x400) == 0)
  {
LABEL_60:
    if ((v36 & 0x200) == 0) {
      goto LABEL_61;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_searchSectiouint64_t n = *((_DWORD *)v4 + 78);
  *(void *)&self->_flags |= 0x400uLL;
  uint64_t v36 = *((void *)v4 + 41);
  if ((v36 & 0x200) == 0)
  {
LABEL_61:
    if ((v36 & 2) == 0) {
      goto LABEL_62;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_placeDisplayType = *((_DWORD *)v4 + 77);
  *(void *)&self->_flags |= 0x200uLL;
  uint64_t v36 = *((void *)v4 + 41);
  if ((v36 & 2) == 0)
  {
LABEL_62:
    if ((v36 & 0x20) == 0) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
LABEL_76:
  self->_brandMuid = *((void *)v4 + 14);
  *(void *)&self->_flags |= 2uLL;
  if ((*((void *)v4 + 41) & 0x20) != 0)
  {
LABEL_63:
    self->_capacity = *((_DWORD *)v4 + 73);
    *(void *)&self->_flags |= 0x20uLL;
  }
LABEL_64:
  uint64_t v37 = [v4 placeLookupCategorysCount];
  if (v37)
  {
    uint64_t v38 = v37;
    for (juint64_t j = 0; jj != v38; ++jj)
      -[GEOPDEntity addPlaceLookupCategory:](self, "addPlaceLookupCategory:", [v4 placeLookupCategoryAtIndex:jj]);
  }
  secondaryName = self->_secondaryName;
  uint64_t v41 = *((void *)v4 + 27);
  if (secondaryName)
  {
    if (v41) {
      -[GEOLocalizedString mergeFrom:](secondaryName, "mergeFrom:");
    }
  }
  else if (v41)
  {
    -[GEOPDEntity setSecondaryName:](self, "setSecondaryName:");
  }
  secondarySpokenName = self->_secondarySpokenName;
  uint64_t v43 = *((void *)v4 + 28);
  if (secondarySpokenName)
  {
    if (v43) {
      -[GEOLocalizedString mergeFrom:](secondarySpokenName, "mergeFrom:");
    }
  }
  else if (v43)
  {
    -[GEOPDEntity setSecondarySpokenName:](self, "setSecondarySpokenName:");
  }
  styleAttributes = self->_styleAttributes;
  uint64_t v45 = *((void *)v4 + 30);
  if (styleAttributes)
  {
    if (v45) {
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
    }
  }
  else if (v45)
  {
    -[GEOPDEntity setStyleAttributes:](self, "setStyleAttributes:");
  }
  if (*((void *)v4 + 34)) {
    -[GEOPDEntity setWalletCategoryId:](self, "setWalletCategoryId:");
  }
  if (*((void *)v4 + 22)) {
    -[GEOPDEntity setMapsCategoryId:](self, "setMapsCategoryId:");
  }
  if ((*((unsigned char *)v4 + 329) & 0x20) != 0)
  {
    self->_enableRapLightweightFeedbacuint64_t k = *((unsigned char *)v4 + 321);
    *(void *)&self->_flags |= 0x2000uLL;
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v46 = *((id *)v4 + 12);
  uint64_t v47 = [v46 countByEnumeratingWithState:&v79 objects:v109 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v80;
    do
    {
      for (kuint64_t k = 0; kk != v48; ++kk)
      {
        if (*(void *)v80 != v49) {
          objc_enumerationMutation(v46);
        }
        [(GEOPDEntity *)self addAlternateSearchableName:*(void *)(*((void *)&v79 + 1) + 8 * kk)];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v79 objects:v109 count:16];
    }
    while (v48);
  }

  uint64_t v51 = *((void *)v4 + 41);
  if ((v51 & 8) != 0)
  {
    self->_globalBrandMuid = *((void *)v4 + 18);
    *(void *)&self->_flags |= 8uLL;
    uint64_t v51 = *((void *)v4 + 41);
    if ((v51 & 4) == 0)
    {
LABEL_105:
      if ((v51 & 1) == 0) {
        goto LABEL_107;
      }
      goto LABEL_106;
    }
  }
  else if ((v51 & 4) == 0)
  {
    goto LABEL_105;
  }
  self->_buildingId = *((void *)v4 + 15);
  *(void *)&self->_flags |= 4uLL;
  if (*((void *)v4 + 41))
  {
LABEL_106:
    self->_areaHighlightId = *((void *)v4 + 13);
    *(void *)&self->_flags |= 1uLL;
  }
LABEL_107:
  if (*((void *)v4 + 25)) {
    -[GEOPDEntity setModernMapsCategoryId:](self, "setModernMapsCategoryId:");
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v52 = *((id *)v4 + 24);
  uint64_t v53 = [v52 countByEnumeratingWithState:&v75 objects:v108 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v76;
    do
    {
      for (muint64_t m = 0; mm != v54; ++mm)
      {
        if (*(void *)v76 != v55) {
          objc_enumerationMutation(v52);
        }
        [(GEOPDEntity *)self addModernLocalizedCategory:*(void *)(*((void *)&v75 + 1) + 8 * mm)];
      }
      uint64_t v54 = [v52 countByEnumeratingWithState:&v75 objects:v108 count:16];
    }
    while (v54);
  }

  if ((*((unsigned char *)v4 + 328) & 0x80) != 0)
  {
    self->_float photosMemoryScore = *((float *)v4 + 75);
    *(void *)&self->_flags |= 0x80uLL;
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v57 = *((id *)v4 + 21);
  uint64_t v58 = [v57 countByEnumeratingWithState:&v71 objects:v107 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v72;
    do
    {
      for (nuint64_t n = 0; nn != v59; ++nn)
      {
        if (*(void *)v72 != v60) {
          objc_enumerationMutation(v57);
        }
        -[GEOPDEntity addMapsAltCategoryId:](self, "addMapsAltCategoryId:", *(void *)(*((void *)&v71 + 1) + 8 * nn), (void)v71);
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v71 objects:v107 count:16];
    }
    while (v59);
  }

  if (*((unsigned char *)v4 + 329))
  {
    self->_placeCategoryType = *((_DWORD *)v4 + 76);
    *(void *)&self->_flags |= 0x100uLL;
  }
  inlineRapEnablement = self->_inlineRapEnablement;
  uint64_t v63 = *((void *)v4 + 19);
  if (inlineRapEnablement)
  {
    if (v63) {
      -[GEOPDInlineRapEnablement mergeFrom:](inlineRapEnablement, "mergeFrom:");
    }
  }
  else if (v63)
  {
    -[GEOPDEntity setInlineRapEnablement:](self, "setInlineRapEnablement:");
  }
  if ((*((unsigned char *)v4 + 328) & 0x10) != 0)
  {
    self->_mapsCategoryMuid = *((void *)v4 + 23);
    *(void *)&self->_flags |= 0x10uLL;
  }
  uint64_t v64 = objc_msgSend(v4, "mapsAltCategoryMuidsCount", (void)v71);
  if (v64)
  {
    uint64_t v65 = v64;
    for (uint64_t i1 = 0; i1 != v65; ++i1)
      -[GEOPDEntity addMapsAltCategoryMuid:](self, "addMapsAltCategoryMuid:", [v4 mapsAltCategoryMuidAtIndex:i1]);
  }
  disclaimerText = self->_disclaimerText;
  uint64_t v68 = *((void *)v4 + 16);
  if (disclaimerText)
  {
    if (v68) {
      -[GEOLocalizedString mergeFrom:](disclaimerText, "mergeFrom:");
    }
  }
  else if (v68)
  {
    -[GEOPDEntity setDisclaimerText:](self, "setDisclaimerText:");
  }
  urlData = self->_urlData;
  uint64_t v70 = *((void *)v4 + 32);
  if (urlData)
  {
    if (v70) {
      -[GEOPDURLData mergeFrom:](urlData, "mergeFrom:");
    }
  }
  else if (v70)
  {
    -[GEOPDEntity setUrlData:](self, "setUrlData:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 2) & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOPDEntityReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_4611);
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
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000040000uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDEntity *)self readAll:0];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v7 = self->_names;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v49;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v49 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v48 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v9);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v12 = self->_spokenNames;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v45;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v45 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v44 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
      }
      while (v14);
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v17 = self->_localizedCategorys;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v41;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * v21++) clearUnknownFields:1];
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
      }
      while (v19);
    }

    [(GEOLocalizedString *)self->_secondaryName clearUnknownFields:1];
    [(GEOLocalizedString *)self->_secondarySpokenName clearUnknownFields:1];
    [(GEOStyleAttributes *)self->_styleAttributes clearUnknownFields:1];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v22 = self->_alternateSearchableNames;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v36 objects:v53 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v37;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v36 + 1) + 8 * v26++) clearUnknownFields:1];
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v36 objects:v53 count:16];
      }
      while (v24);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v27 = self->_modernLocalizedCategorys;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v33;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v33 != v30) {
            objc_enumerationMutation(v27);
          }
          objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v31++), "clearUnknownFields:", 1, (void)v32);
        }
        while (v29 != v31);
        uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
      }
      while (v29);
    }

    [(GEOPDInlineRapEnablement *)self->_inlineRapEnablement clearUnknownFields:1];
    [(GEOLocalizedString *)self->_disclaimerText clearUnknownFields:1];
    [(GEOPDURLData *)self->_urlData clearUnknownFields:1];
  }
}

@end