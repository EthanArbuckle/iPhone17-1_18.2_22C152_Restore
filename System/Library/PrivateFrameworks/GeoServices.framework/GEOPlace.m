@interface GEOPlace
+ (BOOL)isValid:(id)a3;
+ (Class)businessType;
+ (Class)entryPointType;
+ (Class)roadAccessPointsType;
+ (id)_placesFromDirectionsAction:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5;
+ (id)_placesFromDirectionsAction:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6;
+ (id)_placesFromPresentAction:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6;
+ (id)_placesFromShowAction:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5;
+ (id)_placesFromShowAction:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6;
+ (id)_placesFromURL:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5;
+ (id)_placesFromURL:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6;
+ (id)_urlForAction:(id)a3 rison:(id)a4;
+ (id)_urlForDirectionsFromOrigin:(id)a3 toDestination:(id)a4 options:(id)a5;
+ (id)_urlForDirectionsWithWaypoints:(id)a3 options:(id)a4;
+ (id)_urlRepresentationForCurrentLocation;
+ (id)_urlToShowCurrentLocationAndPlaces:(id)a3 currentLocationIndex:(unint64_t)a4 options:(id)a5;
+ (id)_urlToShowCurrentLocationWithOptions:(id)a3;
+ (id)_urlToShowPlaces:(id)a3 options:(id)a4;
+ (id)_urlToShowURLRepresentations:(id)a3 options:(id)a4;
+ (id)placeForPlaceData:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)_isEquivalentURLRepresentationTo:(id)a3;
- (BOOL)hasAddress;
- (BOOL)hasAddressGeocodeAccuracy;
- (BOOL)hasArea;
- (BOOL)hasCenter;
- (BOOL)hasDisplayMapRegion;
- (BOOL)hasGeoId;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsDisputed;
- (BOOL)hasLocalSearchProviderID;
- (BOOL)hasMapRegion;
- (BOOL)hasName;
- (BOOL)hasPhoneticAddress;
- (BOOL)hasPhoneticLocaleIdentifier;
- (BOOL)hasPhoneticName;
- (BOOL)hasReferenceFrame;
- (BOOL)hasSpokenAddress;
- (BOOL)hasSpokenName;
- (BOOL)hasSpokenStructuredAddress;
- (BOOL)hasTimezone;
- (BOOL)hasType;
- (BOOL)hasUID;
- (BOOL)isDisputed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAddress)address;
- (GEOAddress)phoneticAddress;
- (GEOBusiness)firstBusiness;
- (GEOLatLng)center;
- (GEOMapRegion)displayMapRegion;
- (GEOMapRegion)mapRegion;
- (GEOPlace)init;
- (GEOPlace)initWithData:(id)a3;
- (GEOPlace)initWithDictionary:(id)a3;
- (GEOPlace)initWithJSON:(id)a3;
- (GEOPlace)initWithLatitude:(double)a3 longitude:(double)a4;
- (GEOPlace)initWithLatitude:(double)a3 longitude:(double)a4 addressDictionary:(id)a5;
- (GEOPlace)initWithLatitude:(double)a3 longitude:(double)a4 placeType:(int)a5;
- (GEOPlace)initWithLocation:(id)a3 addressDictionary:(id)a4 name:(id)a5 businessURL:(id)a6 phoneNumber:(id)a7 muid:(unint64_t)a8 attributionID:(id)a9 sampleSizeForUserRatingScore:(unsigned int)a10 normalizedUserRatingScore:(float)a11;
- (GEOPlace)initWithName:(id)a3 placeType:(int)a4 areaInMeters:(double)a5;
- (GEOPlace)initWithPlaceInfo:(id)a3 entity:(id)a4 addressObject:(id)a5 bounds:(id)a6 roadAccessInfo:(id)a7;
- (GEOPlace)initWithUrlRepresentation:(id)a3;
- (GEOStructuredAddress)spokenStructuredAddress;
- (GEOTimezone)timezone;
- (NSMutableArray)business;
- (NSMutableArray)entryPoints;
- (NSMutableArray)roadAccessPoints;
- (NSString)description;
- (NSString)name;
- (NSString)phoneticLocaleIdentifier;
- (NSString)phoneticName;
- (NSString)spokenAddress;
- (NSString)spokenName;
- (PBUnknownFields)unknownFields;
- (double)area;
- (double)radialDistance;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)_urlForDirectionsFromCurrentLocationWithOptions:(id)a3;
- (id)_urlForDirectionsFromPlace:(id)a3 options:(id)a4;
- (id)_urlForDirectionsToCurrentLocationWithOptions:(id)a3;
- (id)_urlForDirectionsToPlace:(id)a3 options:(id)a4;
- (id)_urlToShowWithOptions:(id)a3;
- (id)addressDictionary;
- (id)addressGeocodeAccuracyAsString:(int)a3;
- (id)arrivalMapRegion;
- (id)arrivalMapRegionForTransportType:(int)a3;
- (id)bestName;
- (id)businessAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)entryPointAtIndex:(unint64_t)a3;
- (id)geoMapItem;
- (id)jsonRepresentation;
- (id)referenceFrameAsString:(int)a3;
- (id)roadAccessPointsAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (id)urlRepresentation;
- (int)StringAsAddressGeocodeAccuracy:(id)a3;
- (int)StringAsReferenceFrame:(id)a3;
- (int)StringAsType:(id)a3;
- (int)addressGeocodeAccuracy;
- (int)localSearchProviderID;
- (int)referenceFrame;
- (int)type;
- (int64_t)geoId;
- (int64_t)uID;
- (unint64_t)businessCount;
- (unint64_t)entryPointsCount;
- (unint64_t)hash;
- (unint64_t)roadAccessPointsCount;
- (void)_addNoFlagsBusiness:(uint64_t)a1;
- (void)_addNoFlagsEntryPoint:(uint64_t)a1;
- (void)_addNoFlagsRoadAccessPoints:(uint64_t)a1;
- (void)_readAddress;
- (void)_readBusiness;
- (void)_readCenter;
- (void)_readDisplayMapRegion;
- (void)_readEntryPoints;
- (void)_readMapRegion;
- (void)_readName;
- (void)_readPhoneticAddress;
- (void)_readPhoneticLocaleIdentifier;
- (void)_readPhoneticName;
- (void)_readRoadAccessPoints;
- (void)_readSpokenAddress;
- (void)_readSpokenName;
- (void)_readSpokenStructuredAddress;
- (void)_readTimezone;
- (void)addBusiness:(id)a3;
- (void)addEntryPoint:(id)a3;
- (void)addRoadAccessPoints:(id)a3;
- (void)clearBusiness;
- (void)clearEntryPoints;
- (void)clearRoadAccessPoints;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddress:(id)a3;
- (void)setAddressGeocodeAccuracy:(int)a3;
- (void)setArea:(double)a3;
- (void)setBusiness:(id)a3;
- (void)setCenter:(id)a3;
- (void)setCenterCoordinate:(id)a3;
- (void)setDisplayMapRegion:(id)a3;
- (void)setEntryPoints:(id)a3;
- (void)setGeoId:(int64_t)a3;
- (void)setHasAddressGeocodeAccuracy:(BOOL)a3;
- (void)setHasArea:(BOOL)a3;
- (void)setHasGeoId:(BOOL)a3;
- (void)setHasIsDisputed:(BOOL)a3;
- (void)setHasLocalSearchProviderID:(BOOL)a3;
- (void)setHasReferenceFrame:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasUID:(BOOL)a3;
- (void)setIsDisputed:(BOOL)a3;
- (void)setLocalSearchProviderID:(int)a3;
- (void)setMapRegion:(id)a3;
- (void)setNSTimeZone:(id)a3;
- (void)setName:(id)a3;
- (void)setPhoneticAddress:(id)a3;
- (void)setPhoneticLocaleIdentifier:(id)a3;
- (void)setPhoneticName:(id)a3;
- (void)setReferenceFrame:(int)a3;
- (void)setRoadAccessPoints:(id)a3;
- (void)setSpokenAddress:(id)a3;
- (void)setSpokenName:(id)a3;
- (void)setSpokenStructuredAddress:(id)a3;
- (void)setTimezone:(id)a3;
- (void)setType:(int)a3;
- (void)setUID:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPlace

void __47__GEOPlace_PlaceDataExtras__placeForPlaceData___block_invoke(void *a1, void *a2)
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v4 = -[GEOPDComponent values](v3);
  v5 = v4;
  if (!v3 || (*((_WORD *)v3 + 50) & 0x80) == 0) {
    goto LABEL_66;
  }
  int v6 = *((_DWORD *)v3 + 22);
  switch(v6)
  {
    case 1:
      v7 = [v4 firstObject];
      uint64_t v8 = -[GEOPDComponentValue entity](v7);
      uint64_t v9 = *(void *)(a1[5] + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      if (!v3[2]) {
        goto LABEL_26;
      }
      uint64_t v11 = -[GEOPDComponent attribution](v3);
      uint64_t v12 = a1[6];
      goto LABEL_25;
    case 2:
      v7 = [v4 firstObject];
      uint64_t v11 = -[GEOPDComponentValue placeInfo](v7);
      uint64_t v12 = a1[4];
      goto LABEL_25;
    case 3:
      v7 = [v4 firstObject];
      uint64_t v11 = -[GEOPDComponentValue accessInfo](v7);
      uint64_t v12 = a1[14];
      goto LABEL_25;
    case 4:
      v7 = [v4 firstObject];
      uint64_t v11 = -[GEOPDComponentValue bounds](v7);
      uint64_t v12 = a1[13];
      goto LABEL_25;
    case 5:
      goto LABEL_66;
    case 6:
      v7 = [v4 firstObject];
      uint64_t v11 = -[GEOPDComponentValue rating](v7);
      uint64_t v12 = a1[12];
LABEL_25:
      uint64_t v24 = *(void *)(v12 + 8);
      v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v11;

LABEL_26:
      goto LABEL_66;
    case 7:
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      v72 = v4;
      id v13 = v4;
      uint64_t v26 = [v13 countByEnumeratingWithState:&v86 objects:v97 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v87;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v87 != v28) {
              objc_enumerationMutation(v13);
            }
            uint64_t v30 = *(void *)(*((void *)&v86 + 1) + 8 * i);
            if (v30 && *(void *)(v30 + 536))
            {
              v31 = *(void **)(*(void *)(a1[8] + 8) + 40);
              if (!v31)
              {
                uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
                uint64_t v33 = *(void *)(a1[8] + 8);
                v34 = *(void **)(v33 + 40);
                *(void *)(v33 + 40) = v32;

                v31 = *(void **)(*(void *)(a1[8] + 8) + 40);
              }
              v35 = -[GEOPDComponentValue review]((id *)v30);
              [v31 addObject:v35];
            }
          }
          uint64_t v27 = [v13 countByEnumeratingWithState:&v86 objects:v97 count:16];
        }
        while (v27);
      }
      goto LABEL_65;
    case 8:
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      v72 = v4;
      id v13 = v4;
      uint64_t v36 = [v13 countByEnumeratingWithState:&v78 objects:v95 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v79;
        do
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void *)v79 != v38) {
              objc_enumerationMutation(v13);
            }
            uint64_t v40 = *(void *)(*((void *)&v78 + 1) + 8 * j);
            if (v40 && *(void *)(v40 + 368))
            {
              v41 = *(void **)(*(void *)(a1[10] + 8) + 40);
              if (!v41)
              {
                uint64_t v42 = [MEMORY[0x1E4F1CA48] array];
                uint64_t v43 = *(void *)(a1[10] + 8);
                v44 = *(void **)(v43 + 40);
                *(void *)(v43 + 40) = v42;

                v41 = *(void **)(*(void *)(a1[10] + 8) + 40);
              }
              v45 = -[GEOPDComponentValue photo]((id *)v40);
              [v41 addObject:v45];
            }
          }
          uint64_t v37 = [v13 countByEnumeratingWithState:&v78 objects:v95 count:16];
        }
        while (v37);
      }
      goto LABEL_65;
    case 9:
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      v72 = v4;
      id v13 = v4;
      uint64_t v46 = [v13 countByEnumeratingWithState:&v90 objects:v98 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v91;
        do
        {
          for (uint64_t k = 0; k != v47; ++k)
          {
            if (*(void *)v91 != v48) {
              objc_enumerationMutation(v13);
            }
            uint64_t v50 = *(void *)(*((void *)&v90 + 1) + 8 * k);
            if (v50 && *(void *)(v50 + 296))
            {
              v51 = *(void **)(*(void *)(a1[7] + 8) + 40);
              if (!v51)
              {
                uint64_t v52 = [MEMORY[0x1E4F1CA48] array];
                uint64_t v53 = *(void *)(a1[7] + 8);
                v54 = *(void **)(v53 + 40);
                *(void *)(v53 + 40) = v52;

                v51 = *(void **)(*(void *)(a1[7] + 8) + 40);
              }
              v55 = -[GEOPDComponentValue hours]((id *)v50);
              [v51 addObject:v55];
            }
          }
          uint64_t v47 = [v13 countByEnumeratingWithState:&v90 objects:v98 count:16];
        }
        while (v47);
      }
      goto LABEL_65;
    default:
      if (v6 == 26)
      {
        v73 = v4;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v56 = v4;
        uint64_t v57 = [v56 countByEnumeratingWithState:&v74 objects:v94 count:16];
        if (!v57)
        {
LABEL_84:

          v5 = v73;
          goto LABEL_66;
        }
        uint64_t v58 = v57;
        uint64_t v59 = *(void *)v75;
LABEL_69:
        uint64_t v60 = 0;
        while (1)
        {
          if (*(void *)v75 != v59) {
            objc_enumerationMutation(v56);
          }
          uint64_t v61 = *(void *)(*((void *)&v74 + 1) + 8 * v60);
          if (!v61 || !*(void *)(v61 + 128)) {
            goto LABEL_80;
          }
          uint64_t v62 = -[GEOPDComponentValue captionedPhoto](*(id **)(*((void *)&v74 + 1) + 8 * v60));
          if (!v62) {
            break;
          }
          v63 = (void *)v62;
          -[GEOPDCaptionedPhoto _readPhoto](v62);
          uint64_t v64 = v63[10];

          if (v64)
          {
            v65 = *(void **)(*(void *)(a1[11] + 8) + 40);
            if (!v65)
            {
              uint64_t v66 = [MEMORY[0x1E4F1CA48] array];
              uint64_t v67 = *(void *)(a1[11] + 8);
              v68 = *(void **)(v67 + 40);
              *(void *)(v67 + 40) = v66;

              v65 = *(void **)(*(void *)(a1[11] + 8) + 40);
            }
            -[GEOPDComponentValue captionedPhoto]((id *)v61);
            v69 = (id *)objc_claimAutoreleasedReturnValue();
            v70 = -[GEOPDCaptionedPhoto photo](v69);
            [v65 addObject:v70];

            goto LABEL_79;
          }
LABEL_80:
          if (v58 == ++v60)
          {
            uint64_t v71 = [v56 countByEnumeratingWithState:&v74 objects:v94 count:16];
            uint64_t v58 = v71;
            if (!v71) {
              goto LABEL_84;
            }
            goto LABEL_69;
          }
        }
        v69 = 0;
LABEL_79:

        goto LABEL_80;
      }
      if (v6 == 36)
      {
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        v72 = v4;
        id v13 = v4;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v82 objects:v96 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v83;
          do
          {
            for (uint64_t m = 0; m != v15; ++m)
            {
              if (*(void *)v83 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v82 + 1) + 8 * m);
              if (v18 && *(void *)(v18 + 624))
              {
                v19 = *(void **)(*(void *)(a1[9] + 8) + 40);
                if (!v19)
                {
                  uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
                  uint64_t v21 = *(void *)(a1[9] + 8);
                  v22 = *(void **)(v21 + 40);
                  *(void *)(v21 + 40) = v20;

                  v19 = *(void **)(*(void *)(a1[9] + 8) + 40);
                }
                v23 = -[GEOPDComponentValue tip]((id *)v18);
                [v19 addObject:v23];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v82 objects:v96 count:16];
          }
          while (v15);
        }
LABEL_65:

        v5 = v72;
      }
LABEL_66:

      return;
  }
}

- (GEOMapRegion)mapRegion
{
  -[GEOPlace _readMapRegion]((uint64_t)self);
  mapRegion = self->_mapRegion;

  return mapRegion;
}

- (void)_readMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 201) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_6);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
}

- (id)geoMapItem
{
  v2 = [[_GEOPlaceItem alloc] initWithPlace:self];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 3) & 1) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPlaceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_43;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPlace *)self readAll:0];
  $E5113E26C002D925BA55E10430DBDBDB flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    *(void *)(v5 + 24) = self->_uID;
    *(_DWORD *)(v5 + 200) |= 1u;
    $E5113E26C002D925BA55E10430DBDBDB flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 192) = self->_type;
    *(_DWORD *)(v5 + 200) |= 0x40u;
  }
  uint64_t v10 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v10;

  id v12 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  id v13 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v12;

  id v14 = [(GEOAddress *)self->_address copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  uint64_t v16 = [(NSString *)self->_phoneticName copyWithZone:a3];
  v17 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v16;

  id v18 = [(GEOAddress *)self->_phoneticAddress copyWithZone:a3];
  v19 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v18;

  id v20 = [(GEOLatLng *)self->_center copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v20;

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v22 = self->_business;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v61 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = (void *)[*(id *)(*((void *)&v60 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addBusiness:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v60 objects:v66 count:16];
    }
    while (v23);
  }

  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 180) = self->_addressGeocodeAccuracy;
    *(_DWORD *)(v5 + 200) |= 8u;
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v27 = self->_entryPoints;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v57 != v29) {
          objc_enumerationMutation(v27);
        }
        v31 = (void *)[*(id *)(*((void *)&v56 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addEntryPoint:v31];
      }
      uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v56 objects:v65 count:16];
    }
    while (v28);
  }

  $E5113E26C002D925BA55E10430DBDBDB v32 = self->_flags;
  if ((*(unsigned char *)&v32 & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 196) = self->_isDisputed;
    *(_DWORD *)(v5 + 200) |= 0x80u;
    $E5113E26C002D925BA55E10430DBDBDB v32 = self->_flags;
  }
  if ((*(unsigned char *)&v32 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 184) = self->_localSearchProviderID;
    *(_DWORD *)(v5 + 200) |= 0x10u;
  }
  uint64_t v33 = [(NSString *)self->_spokenName copyWithZone:a3];
  v34 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v33;

  uint64_t v35 = [(NSString *)self->_spokenAddress copyWithZone:a3];
  uint64_t v36 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v35;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(double *)(v5 + 40) = self->_area;
    *(_DWORD *)(v5 + 200) |= 2u;
  }
  id v37 = [(GEOStructuredAddress *)self->_spokenStructuredAddress copyWithZone:a3];
  uint64_t v38 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v37;

  id v39 = [(GEOTimezone *)self->_timezone copyWithZone:a3];
  uint64_t v40 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v39;

  id v41 = [(GEOMapRegion *)self->_displayMapRegion copyWithZone:a3];
  uint64_t v42 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v41;

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v43 = self->_roadAccessPoints;
  uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v53;
    do
    {
      for (uint64_t k = 0; k != v44; ++k)
      {
        if (*(void *)v53 != v45) {
          objc_enumerationMutation(v43);
        }
        uint64_t v47 = objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * k), "copyWithZone:", a3, (void)v52);
        [(id)v5 addRoadAccessPoints:v47];
      }
      uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v52 objects:v64 count:16];
    }
    while (v44);
  }

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(void *)(v5 + 80) = self->_geoId;
    *(_DWORD *)(v5 + 200) |= 4u;
  }
  uint64_t v48 = -[NSString copyWithZone:](self->_phoneticLocaleIdentifier, "copyWithZone:", a3, (void)v52);
  v49 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v48;

  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 188) = self->_referenceFrame;
    *(_DWORD *)(v5 + 200) |= 0x20u;
  }
  uint64_t v50 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v50;
LABEL_43:

  return (id)v5;
}

- (GEOPlace)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPlace;
  v2 = [(GEOPlace *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_1876;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_1877;
    }
    GEOPlaceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPlaceCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOBusiness)firstBusiness
{
  BOOL v3 = [(GEOPlace *)self business];
  if ([v3 count])
  {
    v4 = [(GEOPlace *)self businessAtIndex:0];
  }
  else
  {
    v4 = 0;
  }

  return (GEOBusiness *)v4;
}

- (NSMutableArray)business
{
  -[GEOPlace _readBusiness]((uint64_t)self);
  business = self->_business;

  return business;
}

- (id)businessAtIndex:(unint64_t)a3
{
  -[GEOPlace _readBusiness]((uint64_t)self);
  business = self->_business;

  return (id)[(NSMutableArray *)business objectAtIndex:a3];
}

+ (id)placeForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__37;
  long long v74 = __Block_byref_object_dispose__37;
  id v75 = 0;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  uint64_t v67 = __Block_byref_object_copy__37;
  v68 = __Block_byref_object_dispose__37;
  id v69 = 0;
  uint64_t v58 = 0;
  long long v59 = &v58;
  uint64_t v60 = 0x3032000000;
  long long v61 = __Block_byref_object_copy__37;
  long long v62 = __Block_byref_object_dispose__37;
  id v63 = 0;
  uint64_t v52 = 0;
  long long v53 = &v52;
  uint64_t v54 = 0x3032000000;
  long long v55 = __Block_byref_object_copy__37;
  long long v56 = __Block_byref_object_dispose__37;
  id v57 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__37;
  uint64_t v50 = __Block_byref_object_dispose__37;
  id v51 = 0;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__37;
  uint64_t v44 = __Block_byref_object_dispose__37;
  id v45 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__37;
  uint64_t v38 = __Block_byref_object_dispose__37;
  id v39 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__37;
  v32[4] = __Block_byref_object_dispose__37;
  id v33 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__37;
  uint64_t v30 = __Block_byref_object_dispose__37;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__37;
  uint64_t v24 = __Block_byref_object_dispose__37;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__37;
  id v18 = __Block_byref_object_dispose__37;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__GEOPlace_PlaceDataExtras__placeForPlaceData___block_invoke;
  v13[3] = &unk_1E53E16C8;
  v13[4] = &v70;
  v13[5] = &v64;
  v13[6] = &v14;
  v13[7] = &v40;
  v13[8] = &v34;
  v13[9] = v32;
  v13[10] = &v26;
  v13[11] = &v20;
  v13[12] = &v58;
  v13[13] = &v52;
  v13[14] = &v46;
  [v3 enumerateValidComponentsWithValuesUsingBlock:v13];
  uint64_t v4 = +[GEOAddressObject addressObjectForPlaceData:v3];
  uint64_t v5 = (void *)v4;
  if (v71[5] || v65[5] | v4 || v53[5] || v47[5])
  {
    objc_super v6 = [GEOPlace alloc];
    v7 = [(GEOPlace *)v6 initWithPlaceInfo:v71[5] entity:v65[5] addressObject:v5 bounds:v53[5] roadAccessInfo:v47[5]];
    if ([v3 hasMuid]) {
      -[GEOPlace setUID:](v7, "setUID:", [v3 muid]);
    }
    if ([v3 hasResultProviderId]) {
      -[GEOPlace setLocalSearchProviderID:](v7, "setLocalSearchProviderID:", [v3 resultProviderId]);
    }
    if (v7 && v65[5])
    {
      id v8 = [GEOBusiness alloc];
      uint64_t v9 = v21[5];
      if (!v9) {
        uint64_t v9 = v27[5];
      }
      uint64_t v10 = [(GEOBusiness *)v8 initWithPlaceDataEntity:v65[5] rating:v59[5] hours:v41[5] reviews:v35[5] photos:v9 entityAttribution:v15[5]];
      if ([v3 hasMuid]) {
        -[GEOBusiness setUID:](v10, "setUID:", [v3 muid]);
      }
      if (!v10) {
        goto LABEL_24;
      }
      if ([(GEOBusiness *)v10 hasName] || ![(GEOPlace *)v7 hasName])
      {
        if (![(GEOBusiness *)v10 hasName] || [(GEOPlace *)v7 hasName]) {
          goto LABEL_23;
        }
        uint64_t v11 = [(GEOBusiness *)v10 name];
        [(GEOPlace *)v7 setName:v11];
      }
      else
      {
        uint64_t v11 = [(GEOPlace *)v7 name];
        [(GEOBusiness *)v10 setName:v11];
      }

LABEL_23:
      [(GEOPlace *)v7 addBusiness:v10];
LABEL_24:
    }
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v70, 8);

  return v7;
}

- (NSString)name
{
  -[GEOPlace _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 201) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_1816);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (void)addBusiness:(id)a3
{
  id v4 = a3;
  -[GEOPlace _readBusiness]((uint64_t)self);
  -[GEOPlace _addNoFlagsBusiness:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
}

- (void)_readBusiness
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 201) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusiness_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (void)_addNoFlagsBusiness:(uint64_t)a1
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

- (void)setLocalSearchProviderID:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x1000010u;
  self->_localSearchProviderID = a3;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setUID:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x1000001u;
  self->_uID = a3;
}

- (id)bestName
{
  id v3 = [(GEOPlace *)self name];
  if ([v3 length])
  {
    id v4 = v3;
LABEL_5:
    id v7 = v4;
    objc_super v6 = v4;
    goto LABEL_6;
  }
  id v5 = [(GEOPlace *)self firstBusiness];
  objc_super v6 = [v5 name];

  if ([v6 length])
  {
    id v4 = v6;
    goto LABEL_5;
  }
  uint64_t v9 = [(GEOPlace *)self address];
  id v7 = [v9 bestName];

LABEL_6:

  return v7;
}

- (GEOPlace)initWithPlaceInfo:(id)a3 entity:(id)a4 addressObject:(id)a5 bounds:(id)a6 roadAccessInfo:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = (id *)a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = (id *)a6;
  uint64_t v16 = (id *)a7;
  v43.receiver = self;
  v43.super_class = (Class)GEOPlace;
  v17 = [(GEOPlace *)&v43 init];
  if (v17)
  {
    if ([v13 hasType])
    {
      [v13 type];
      -[GEOPlace setType:](v17, "setType:");
    }
    if (v15)
    {
      -[GEOPDBounds _readDisplayMapRegion]((uint64_t)v15);
      if (v15[3])
      {
        id v18 = -[GEOPDBounds displayMapRegion](v15);
        [(GEOPlace *)v17 setMapRegion:v18];
      }
    }
    if (v14)
    {
      id v19 = [v14 address];
      [(GEOPlace *)v17 setAddress:v19];

      uint64_t v20 = [v14 spokenAddress];
      [(GEOPlace *)v17 setSpokenAddress:v20];

      uint64_t v21 = [v14 phoneticLocaleIdentifier];
      [(GEOPlace *)v17 setPhoneticLocaleIdentifier:v21];
    }
    if (v12)
    {
      -[GEOPDPlaceInfo _readCenter]((uint64_t)v12);
      if (v12[5])
      {
        uint64_t v22 = -[GEOPDPlaceInfo center](v12);
        [(GEOPlace *)v17 setCenter:v22];
      }
    }
    if ([v13 namesCount])
    {
      uint64_t v23 = [v13 bestLocalizedName];
      if ([v23 hasStringValue])
      {
        uint64_t v24 = [v23 stringValue];
        [(GEOPlace *)v17 setName:v24];
      }
    }
    if ([v13 spokenNamesCount])
    {
      id v25 = [v13 spokenNameAtIndex:0];
      if ([v25 hasStringValue])
      {
        uint64_t v26 = [v25 stringValue];
        [(GEOPlace *)v17 setSpokenName:v26];
      }
    }
    if (v16 && [v16[2] count])
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v38 = v16;
      uint64_t v27 = -[GEOPDRoadAccessInfo roadAccessPoints](v16);
      uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v40 != v30) {
              objc_enumerationMutation(v27);
            }
            $E5113E26C002D925BA55E10430DBDBDB v32 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if ([v32 hasLocation])
            {
              id v33 = [v32 location];
              [(GEOPlace *)v17 addEntryPoint:v33];
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v29);
      }

      uint64_t v16 = v38;
    }
    if (v12 && (*((_WORD *)v12 + 46) & 1) != 0) {
      [(GEOPlace *)v17 setArea:*((double *)v12 + 3)];
    }
    if ([v13 isDisputed]) {
      -[GEOPlace setIsDisputed:](v17, "setIsDisputed:", [v13 isDisputed]);
    }
    if (v14 && [v14 hasKnownAccuracy])
    {
      unsigned int v34 = [v14 knownAccuracy];
      if (v34 - 1 >= 5) {
        uint64_t v35 = 0;
      }
      else {
        uint64_t v35 = v34;
      }
      [(GEOPlace *)v17 setAddressGeocodeAccuracy:v35];
    }
    uint64_t v36 = v17;
  }

  return v17;
}

- (void)setName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1008000u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setCenter:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1000800u;
  objc_storeStrong((id *)&self->_center, a3);
}

- (void)setMapRegion:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1004000u;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)setAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1000200u;
  objc_storeStrong((id *)&self->_address, a3);
}

- (void)setType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x1000040u;
  self->_type = a3;
}

- (void)setSpokenAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1100000u;
  objc_storeStrong((id *)&self->_spokenAddress, a3);
}

- (void)setPhoneticLocaleIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1020000u;
  objc_storeStrong((id *)&self->_phoneticLocaleIdentifier, a3);
}

- (void)setSpokenName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1200000u;
  objc_storeStrong((id *)&self->_spokenName, a3);
}

- (void)setAddressGeocodeAccuracy:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x1000008u;
  self->_addressGeocodeAccuracy = a3;
}

- (GEOPlace)initWithLatitude:(double)a3 longitude:(double)a4 placeType:(int)a5
{
  objc_super v6 = [(GEOPlace *)self initWithLatitude:a3 longitude:a4];
  if (v6) {
    [(GEOPlace *)v6 setType:_PlaceTypeForMapItemPlaceType(a5)];
  }
  return v6;
}

- (GEOPlace)initWithLatitude:(double)a3 longitude:(double)a4
{
  return [(GEOPlace *)self initWithLatitude:0 longitude:a3 addressDictionary:a4];
}

- (GEOPlace)initWithLocation:(id)a3 addressDictionary:(id)a4 name:(id)a5 businessURL:(id)a6 phoneNumber:(id)a7 muid:(unint64_t)a8 attributionID:(id)a9 sampleSizeForUserRatingScore:(unsigned int)a10 normalizedUserRatingScore:(float)a11
{
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a4;
  [a3 coordinate];
  uint64_t v23 = -[GEOPlace initWithLatitude:longitude:addressDictionary:](self, "initWithLatitude:longitude:addressDictionary:", v22);

  if (v23)
  {
    if (v18) {
      [(GEOPlace *)v23 setName:v18];
    }
    uint64_t v24 = [GEOBusiness alloc];
    *(float *)&double v25 = a11;
    uint64_t v26 = [(GEOBusiness *)v24 initWithBusinessURL:v19 phoneNumber:v20 muid:a8 attributionID:v21 sampleSizeForUserRatingScore:a10 normalizedUserRatingScore:v25];
    if (v26) {
      [(GEOPlace *)v23 addBusiness:v26];
    }
    uint64_t v27 = v23;
  }
  return v23;
}

- (GEOPlace)initWithLatitude:(double)a3 longitude:(double)a4 addressDictionary:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)GEOPlace;
  uint64_t v9 = [(GEOPlace *)&v16 init];
  if (v9)
  {
    if (fabs(a3 + 180.0) >= 0.00000001 || fabs(a4 + 180.0) >= 0.00000001)
    {
      uint64_t v10 = [[GEOMapRegion alloc] initWithLatitude:a3 longitude:a4];
      [(GEOPlace *)v9 setMapRegion:v10];
      uint64_t v11 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", a3, a4);
      [(GEOPlace *)v9 setCenter:v11];
    }
    if (v8)
    {
      id v12 = [[GEOAddress alloc] initWithAddressDictionary:v8];
      [(GEOPlace *)v9 setAddress:v12];
      if (![(GEOPlace *)v9 hasName])
      {
        id v13 = [v8 objectForKey:@"Name"];
        if ([v13 length]) {
          [(GEOPlace *)v9 setName:v13];
        }
      }
    }
    id v14 = v9;
  }

  return v9;
}

- (GEOAddress)address
{
  -[GEOPlace _readAddress]((uint64_t)self);
  address = self->_address;

  return address;
}

- (void)_readAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 201) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddress_tags_7);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (int)type
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $E5113E26C002D925BA55E10430DBDBDB flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x40) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (BOOL)hasAddressGeocodeAccuracy
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (NSMutableArray)entryPoints
{
  -[GEOPlace _readEntryPoints]((uint64_t)self);
  entryPoints = self->_entryPoints;

  return entryPoints;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  if ([(GEOPlace *)self hasCenter])
  {
    id v3 = [(GEOPlace *)self center];
    if (!v3)
    {
LABEL_7:
      unint64_t v6 = 0xC066800000000000;
      unint64_t v8 = 0xC066800000000000;
      goto LABEL_8;
    }
  }
  else
  {
    if (![(GEOPlace *)self entryPointsCount]) {
      goto LABEL_7;
    }
    id v4 = [(GEOPlace *)self entryPoints];
    id v3 = [v4 objectAtIndex:0];

    if (!v3) {
      goto LABEL_7;
    }
  }
  [v3 coordinate];
  unint64_t v6 = v5;
  unint64_t v8 = v7;

LABEL_8:
  double v9 = *(double *)&v6;
  double v10 = *(double *)&v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (BOOL)hasCenter
{
  return self->_center != 0;
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 201) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_1818);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (GEOLatLng)center
{
  -[GEOPlace _readCenter]((uint64_t)self);
  center = self->_center;

  return center;
}

- (unint64_t)entryPointsCount
{
  -[GEOPlace _readEntryPoints]((uint64_t)self);
  entryPoints = self->_entryPoints;

  return [(NSMutableArray *)entryPoints count];
}

- (void)_readEntryPoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 201) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEntryPoints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_spokenStructuredAddress, 0);
  objc_storeStrong((id *)&self->_spokenName, 0);
  objc_storeStrong((id *)&self->_spokenAddress, 0);
  objc_storeStrong((id *)&self->_roadAccessPoints, 0);
  objc_storeStrong((id *)&self->_phoneticName, 0);
  objc_storeStrong((id *)&self->_phoneticLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneticAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_entryPoints, 0);
  objc_storeStrong((id *)&self->_displayMapRegion, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_business, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)hasSpokenAddress
{
  return self->_spokenAddress != 0;
}

- (GEOStructuredAddress)spokenStructuredAddress
{
  -[GEOPlace _readSpokenStructuredAddress]((uint64_t)self);
  spokenStructuredAddress = self->_spokenStructuredAddress;

  return spokenStructuredAddress;
}

- (NSString)spokenAddress
{
  -[GEOPlace _readSpokenAddress]((uint64_t)self);
  spokenAddress = self->_spokenAddress;

  return spokenAddress;
}

- (void)_readSpokenAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 202) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpokenAddress_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasAddress
{
  return self->_address != 0;
}

- (void)_readSpokenStructuredAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 202) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpokenStructuredAddress_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (int)referenceFrame
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $E5113E26C002D925BA55E10430DBDBDB flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    return self->_referenceFrame;
  }
  else {
    return 0;
  }
}

- (GEOTimezone)timezone
{
  -[GEOPlace _readTimezone]((uint64_t)self);
  timezone = self->_timezone;

  return timezone;
}

- (void)_readTimezone
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 202) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimezone_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (void)setCenterCoordinate:(id)a3
{
  if (a3.var1 >= -180.0 && a3.var1 <= 180.0 && a3.var0 >= -90.0 && a3.var0 <= 90.0)
  {
    id v4 = [[GEOLatLng alloc] initWithLatitude:a3.var0 longitude:a3.var1];
    [(GEOPlace *)self setCenter:v4];
  }
}

- (GEOPlace)initWithUrlRepresentation:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOPlace;
  unint64_t v5 = [(GEOPlace *)&v20 init];
  if (v5)
  {
    unint64_t v6 = [v4 objectForKey:@"latlng"];
    unint64_t v7 = v6;
    if (v6 && [v6 count] == 2)
    {
      unint64_t v8 = [v7 firstObject];
      uint64_t v9 = [v7 lastObject];
      double v10 = (void *)v9;
      if (v8 && v9)
      {
        uint64_t v11 = [GEOLatLng alloc];
        [v8 doubleValue];
        double v13 = v12;
        [v10 doubleValue];
        uint64_t v15 = [(GEOLatLng *)v11 initWithLatitude:v13 longitude:v14];
        [(GEOPlace *)v5 setCenter:v15];
      }
    }
    objc_super v16 = [v4 objectForKey:@"name"];
    if ([v16 length]) {
      [(GEOPlace *)v5 setName:v16];
    }
    v17 = [[GEOAddress alloc] initWithUrlRepresentation:v4];
    if (v17) {
      [(GEOPlace *)v5 setAddress:v17];
    }
    id v18 = v5;
  }
  return v5;
}

- (id)urlRepresentation
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(GEOPlace *)self hasCenter])
  {
    id v4 = NSNumber;
    unint64_t v5 = [(GEOPlace *)self center];
    [v5 lat];
    unint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
    v17[0] = v6;
    unint64_t v7 = NSNumber;
    unint64_t v8 = [(GEOPlace *)self center];
    [v8 lng];
    uint64_t v9 = objc_msgSend(v7, "numberWithDouble:");
    v17[1] = v9;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    [v3 setObject:v10 forKey:@"latlng"];
  }
  uint64_t v11 = [(GEOPlace *)self name];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    double v13 = [(GEOPlace *)self name];
    [v3 setObject:v13 forKey:@"name"];
  }
  if ([(GEOPlace *)self hasAddress])
  {
    double v14 = [(GEOPlace *)self address];
    uint64_t v15 = [v14 urlRepresentation];
    [v3 addEntriesFromDictionary:v15];
  }

  return v3;
}

- (BOOL)_isEquivalentURLRepresentationTo:(id)a3
{
  id v8 = a3;
  if (-[GEOPlace hasName](self, "hasName") || [v8 hasName])
  {
    id v3 = [(GEOPlace *)self name];
    id v4 = [v8 name];
    if (![v3 isEqual:v4])
    {
      char v10 = 0;
      goto LABEL_12;
    }
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
  }
  if (!-[GEOPlace hasCenter](self, "hasCenter") && ![v8 hasCenter])
  {
    int v11 = 0;
LABEL_15:
    if (-[GEOPlace hasAddress](self, "hasAddress") || ([v8 hasAddress] & 1) != 0)
    {
      double v13 = [(GEOPlace *)self address];
      double v14 = [v8 address];
      char v10 = [v13 _isEquivalentURLRepresentationTo:v14];

      if (v11) {
        goto LABEL_18;
      }
    }
    else
    {
      char v10 = 1;
      if (v11)
      {
LABEL_18:

        if ((v9 & 1) == 0) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
    if (!v9) {
      goto LABEL_13;
    }
LABEL_12:

    goto LABEL_13;
  }
  unint64_t v5 = [(GEOPlace *)self center];
  unint64_t v6 = [v8 center];
  if ([v5 isEqual:v6])
  {
    int v11 = 1;
    goto LABEL_15;
  }

  char v10 = 0;
  if (v9) {
    goto LABEL_12;
  }
LABEL_13:

  return v10;
}

+ (id)_urlRepresentationForCurrentLocation
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"currentloc";
  v5[0] = MEMORY[0x1E4F1CC38];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)_urlForAction:(id)a3 rison:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = objc_alloc_init(GEORisonParser);
  id v8 = (void *)MEMORY[0x1E4F1CB10];
  int v9 = NSString;
  char v10 = [(GEORisonParser *)v7 stringFromRisonObject:v5];

  int v11 = [v9 stringWithFormat:@"%@:%@?%@", @"map", v6, v10];

  uint64_t v12 = [v8 URLWithString:v11];

  return v12;
}

+ (id)_urlToShowURLRepresentations:(id)a3 options:(id)a4
{
  id v6 = a4;
  unint64_t v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  [v9 setObject:v8 forKey:@"pois"];

  char v10 = (GEOURLOptions *)v6;
  int v11 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v12 = [v11 bundleIdentifier];

  double v13 = v10;
  if (v12)
  {
    double v13 = v10;
    if (!v10) {
      double v13 = objc_alloc_init(GEOURLOptions);
    }
    if (![(GEOURLOptions *)v13 hasReferralIdentifier]) {
      [(GEOURLOptions *)v13 setReferralIdentifier:v12];
    }
  }

  double v14 = [(GEOURLOptions *)v13 urlRepresentation];
  if (v14) {
    [v9 setObject:v14 forKey:@"options"];
  }
  uint64_t v15 = [a1 _urlForAction:@"show" rison:v9];

  return v15;
}

- (id)_urlToShowWithOptions:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(GEOPlace *)self urlRepresentation];
  if (v5)
  {
    id v6 = objc_opt_class();
    v10[0] = v5;
    unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v8 = [v6 _urlToShowURLRepresentations:v7 options:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_urlToShowPlaces:(id)a3 options:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v7, "containsObject:", v14, (void)v18) & 1) == 0)
        {
          [v7 addObject:v14];
          uint64_t v15 = [v14 urlRepresentation];
          if (v15) {
            [v8 addObject:v15];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  objc_super v16 = [(id)objc_opt_class() _urlToShowURLRepresentations:v8 options:v6];

  return v16;
}

+ (id)_urlToShowCurrentLocationAndPlaces:(id)a3 currentLocationIndex:(unint64_t)a4 options:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count") + 1);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v10, "containsObject:", v17, (void)v22) & 1) == 0)
        {
          [v10 addObject:v17];
          long long v18 = [v17 urlRepresentation];
          if (v18) {
            [v11 addObject:v18];
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  long long v19 = [a1 _urlRepresentationForCurrentLocation];
  [v11 insertObject:v19 atIndex:a4];

  long long v20 = [(id)objc_opt_class() _urlToShowURLRepresentations:v11 options:v9];

  return v20;
}

+ (id)_urlToShowCurrentLocationWithOptions:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _urlRepresentationForCurrentLocation];
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  unint64_t v7 = [a1 _urlToShowURLRepresentations:v6 options:v4];

  return v7;
}

+ (id)_urlForDirectionsWithWaypoints:(id)a3 options:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v33 = a1;
  id v8 = [a1 _urlRepresentationForCurrentLocation];
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (!v11) {
    goto LABEL_15;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v35;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v35 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v16 = [v15 urlRepresentation];
        [v9 addObject:v16];

        continue;
      }
      if ([v15 isEqual:v8])
      {
        v17 = v9;
        long long v18 = v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        v17 = v9;
        long long v18 = v15;
      }
      [v17 addObject:v18];
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v42 count:16];
  }
  while (v12);
LABEL_15:

  unsigned int v19 = [v7 transportType];
  if (v19 > 3) {
    long long v20 = @"preferred";
  }
  else {
    long long v20 = off_1E53DB480[v19];
  }
  v40[0] = @"saddr";
  long long v21 = [v9 firstObject];
  v41[0] = v21;
  v40[1] = @"daddr";
  if ((unint64_t)[v9 count] >= 3) {
    objc_msgSend(v9, "subarrayWithRange:", 1, objc_msgSend(v9, "count") - 1);
  }
  else {
  long long v22 = [v9 lastObject];
  }
  v40[2] = @"dirtype";
  v41[1] = v22;
  v41[2] = v20;
  long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];

  long long v24 = (GEOURLOptions *)v7;
  long long v25 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v26 = [v25 bundleIdentifier];

  uint64_t v27 = v24;
  if (v26)
  {
    uint64_t v27 = v24;
    if (!v24) {
      uint64_t v27 = objc_alloc_init(GEOURLOptions);
    }
    if (![(GEOURLOptions *)v27 hasReferralIdentifier]) {
      [(GEOURLOptions *)v27 setReferralIdentifier:v26];
    }
  }

  uint64_t v28 = [(GEOURLOptions *)v27 urlRepresentation];
  uint64_t v29 = (void *)[v28 mutableCopy];

  if ([(GEOURLOptions *)v27 hasTransportType]) {
    [v29 removeObjectForKey:@"dirtype"];
  }
  if (!v29)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v38[0] = @"route";
  v38[1] = @"options";
  v39[0] = v23;
  v39[1] = v29;
  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  id v31 = [v33 _urlForAction:@"directions" rison:v30];

  return v31;
}

+ (id)_urlForDirectionsFromOrigin:(id)a3 toDestination:(id)a4 options:(id)a5
{
  id v5 = 0;
  v15[2] = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    v15[0] = a3;
    v15[1] = a4;
    id v9 = (void *)MEMORY[0x1E4F1C978];
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    uint64_t v13 = [v9 arrayWithObjects:v15 count:2];

    id v5 = [a1 _urlForDirectionsWithWaypoints:v13 options:v10];
  }

  return v5;
}

- (id)_urlForDirectionsToPlace:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(GEOPlace *)self _isEquivalentURLRepresentationTo:v6])
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(GEOPlace *)self urlRepresentation];
    id v10 = [v6 urlRepresentation];
    id v8 = [(id)objc_opt_class() _urlForDirectionsFromOrigin:v9 toDestination:v10 options:v7];
  }

  return v8;
}

- (id)_urlForDirectionsFromPlace:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(GEOPlace *)self _isEquivalentURLRepresentationTo:v6])
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [v6 urlRepresentation];
    id v10 = [(GEOPlace *)self urlRepresentation];
    id v8 = [(id)objc_opt_class() _urlForDirectionsFromOrigin:v9 toDestination:v10 options:v7];
  }

  return v8;
}

- (id)_urlForDirectionsToCurrentLocationWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOPlace *)self urlRepresentation];
  id v6 = [(id)objc_opt_class() _urlRepresentationForCurrentLocation];
  id v7 = [(id)objc_opt_class() _urlForDirectionsFromOrigin:v5 toDestination:v6 options:v4];

  return v7;
}

- (id)_urlForDirectionsFromCurrentLocationWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _urlRepresentationForCurrentLocation];
  id v6 = [(GEOPlace *)self urlRepresentation];
  id v7 = [(id)objc_opt_class() _urlForDirectionsFromOrigin:v5 toDestination:v6 options:v4];

  return v7;
}

+ (id)_placesFromPresentAction:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6
{
  id v9 = a3;
  if (a4) {
    *a4 = 0;
  }
  long long v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v9 options:1];
  id v10 = [[GEOURLPresent alloc] initWithData:v22];
  p_isa = (id *)&v10->super.super.isa;
  if (a6)
  {
    -[GEOURLPresent options]((id *)&v10->super.super.isa);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v12 = -[GEOURLPresent items](p_isa);
  uint64_t v13 = [v12 count];

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v13];
  if (!v13)
  {
LABEL_18:
    id v20 = v14;
    goto LABEL_19;
  }
  unint64_t v15 = 0;
  while (1)
  {
    objc_super v16 = -[GEOURLPresent items](p_isa);
    uint64_t v17 = [v16 objectAtIndex:v15];

    if (!v17) {
      break;
    }
    if (*(unsigned char *)(v17 + 44))
    {
      int v18 = 1;
      if (a4) {
        goto LABEL_13;
      }
    }
    else
    {
      -[GEOURLItem _readPlace](v17);
      if (!*(void *)(v17 + 24)) {
        break;
      }
      unsigned int v19 = -[GEOURLItem place]((id *)v17);
      [v14 addObject:v19];

      int v18 = *(unsigned __int8 *)(v17 + 44);
      if (a4)
      {
LABEL_13:
        if (v18)
        {
          if (!*a4)
          {
            *a4 = 1;
            if (a5) {
              *a5 = v15;
            }
          }
        }
      }
    }

    if (v13 == ++v15) {
      goto LABEL_18;
    }
  }

  id v20 = 0;
LABEL_19:

  return v20;
}

+ (id)_placesFromShowAction:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6
{
  id v10 = 0;
  id v8 = [a1 _placesFromShowAction:a3 currentLocationIndices:&v10 options:a6];
  if (a5) {
    *a5 = [v10 lastIndex];
  }
  if (a4) {
    *a4 = [v10 count] != 0;
  }

  return v8;
}

+ (id)_placesFromShowAction:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5
{
  id v8 = a3;
  if (a5) {
    *a5 = 0;
  }
  if (a4)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    *a4 = v9;
  }
  else
  {
    id v9 = 0;
  }
  id v10 = [v8 objectForKey:@"present"];
  if (v10)
  {
    uint64_t v23 = 0;
    char v22 = 0;
    id v11 = [a1 _placesFromPresentAction:v10 hasCurrentLocation:&v22 currentLocationIndex:&v23 options:a5];
    [v9 addIndex:v23];
  }
  else
  {
    uint64_t v12 = [v8 objectForKey:@"options"];
    uint64_t v13 = (void *)v12;
    if (a5 && v12) {
      *a5 = [[GEOURLOptions alloc] initWithUrlRepresentation:v12];
    }
    uint64_t v14 = [v8 objectForKey:@"pois"];
    unint64_t v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 count];
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v16];
      if (v16)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          int v18 = [v15 objectAtIndex:i];
          char v21 = 0;
          unsigned int v19 = [v18 _placeOrCurrentLocation:&v21];
          if (v19) {
            [v11 addObject:v19];
          }
          if (v21) {
            [v9 addIndex:i];
          }
        }
      }
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

+ (id)_placesFromDirectionsAction:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6
{
  id v12 = 0;
  id v8 = [a1 _placesFromDirectionsAction:a3 currentLocationIndices:&v12 options:a6];
  id v9 = v12;
  id v10 = v9;
  if (a5) {
    *a5 = [v9 firstIndex];
  }
  if (a4) {
    *a4 = [v10 count] != 0;
  }

  return v8;
}

+ (id)_placesFromDirectionsAction:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    *a4 = v9;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v9 = 0;
  if (a5) {
LABEL_3:
  }
    *a5 = 0;
LABEL_4:
  id v10 = [v8 objectForKey:@"present"];
  if (v10)
  {
    uint64_t v30 = 0;
    char v34 = 0;
    id v11 = [a1 _placesFromPresentAction:v10 hasCurrentLocation:&v34 currentLocationIndex:&v30 options:a5];
    [v9 addIndex:v30];
    goto LABEL_41;
  }
  id v12 = [v8 objectForKey:@"options"];
  if (v12) {
    long long v25 = [[GEOURLOptions alloc] initWithUrlRepresentation:v12];
  }
  else {
    long long v25 = 0;
  }
  uint64_t v13 = [v8 objectForKey:@"route"];
  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v15 = [v13 objectForKey:@"saddr"];
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x2020000000;
    v33[0] = 0;
    uint64_t v23 = [v15 _placeOrCurrentLocation:v33];
    if (v23) {
      [v14 addObject:v23];
    }
    if (*((unsigned char *)v31 + 24)) {
      [v9 addIndex:0];
    }
    uint64_t v16 = objc_msgSend(v13, "objectForKey:", @"daddr", v23);

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v16;
    }
    else
    {
      if (!v16)
      {
        int v18 = 0;
LABEL_22:
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __85__GEOPlace_GEOURLExtras___placesFromDirectionsAction_currentLocationIndices_options___block_invoke;
        v26[3] = &unk_1E53DB440;
        uint64_t v29 = &v30;
        id v19 = v14;
        id v27 = v19;
        id v28 = v9;
        [v18 enumerateObjectsUsingBlock:v26];
        id v20 = [v13 objectForKey:@"dirtype"];
        if (v20)
        {
          if (!v25) {
            long long v25 = objc_alloc_init(GEOURLOptions);
          }
          if ([v20 isEqualToString:@"drive"])
          {
            uint64_t v21 = 0;
LABEL_36:
            [(GEOURLOptions *)v25 setTransportType:v21];
            goto LABEL_37;
          }
          if ([v20 isEqualToString:@"walk"])
          {
            uint64_t v21 = 2;
            goto LABEL_36;
          }
          if ([v20 isEqualToString:@"transit"])
          {
            uint64_t v21 = 1;
            goto LABEL_36;
          }
          if ([v20 isEqualToString:@"cycling"])
          {
            uint64_t v21 = 3;
            goto LABEL_36;
          }
          if ([v20 isEqualToString:@"preferred"])
          {
            uint64_t v21 = 4;
            goto LABEL_36;
          }
        }
LABEL_37:
        if (a5) {
          *a5 = v25;
        }
        id v11 = (void *)[v19 copy];

        _Block_object_dispose(&v30, 8);
        goto LABEL_40;
      }
      v35[0] = v16;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    }
    int v18 = v17;
    goto LABEL_22;
  }
  id v11 = 0;
LABEL_40:

LABEL_41:

  return v11;
}

void __85__GEOPlace_GEOURLExtras___placesFromDirectionsAction_currentLocationIndices_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 _placeOrCurrentLocation:*(void *)(*(void *)(a1 + 48) + 8) + 24];
  id v6 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v5 = v6;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [*(id *)(a1 + 40) addIndex:a3 + 1];
    id v5 = v6;
  }
}

+ (id)_placesFromURL:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6
{
  id v12 = 0;
  id v8 = [a1 _placesFromURL:a3 currentLocationIndices:&v12 options:a6];
  id v9 = v12;
  id v10 = v9;
  if (a5) {
    *a5 = [v9 firstIndex];
  }
  if (a4) {
    *a4 = [v10 count] != 0;
  }

  return v8;
}

+ (id)_placesFromURL:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5
{
  id v8 = a3;
  id v9 = [v8 scheme];
  int v10 = [v9 isEqualToString:@"map"];

  if (!v10)
  {
    id v14 = 0;
    goto LABEL_19;
  }
  id v11 = [v8 resourceSpecifier];
  if ([v11 hasPrefix:@"//"])
  {
    uint64_t v12 = [v11 substringFromIndex:2];

    id v11 = (void *)v12;
  }
  uint64_t v13 = [v11 rangeOfString:@"?"];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = v13;
    uint64_t v16 = [v11 substringToIndex:v13];
    if (([v16 isEqualToString:@"show"] & 1) == 0
      && ![v16 isEqualToString:@"directions"])
    {
      id v14 = 0;
LABEL_17:

      goto LABEL_18;
    }
    id v17 = [v11 substringFromIndex:v15 + 1];
    int v18 = objc_alloc_init(GEORisonParser);
    id v19 = [(GEORisonParser *)v18 objectFromRisonString:v17];
    if ([v16 isEqualToString:@"show"])
    {
      uint64_t v20 = [a1 _placesFromShowAction:v19 currentLocationIndices:a4 options:a5];
    }
    else
    {
      if (![v16 isEqualToString:@"directions"])
      {
        id v14 = 0;
        goto LABEL_16;
      }
      uint64_t v20 = [a1 _placesFromDirectionsAction:v19 currentLocationIndices:a4 options:a5];
    }
    id v14 = (void *)v20;
LABEL_16:

    goto LABEL_17;
  }
  id v14 = 0;
LABEL_18:

LABEL_19:

  return v14;
}

- (GEOPlace)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPlace;
  id v3 = [(GEOPlace *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (int64_t)uID
{
  return self->_uID;
}

- (void)setHasUID:(BOOL)a3
{
  self->_$E5113E26C002D925BA55E10430DBDBDB flags = ($E5113E26C002D925BA55E10430DBDBDB)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x1000000);
}

- (BOOL)hasUID
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    int v3 = 16777280;
  }
  else {
    int v3 = 0x1000000;
  }
  self->_$E5113E26C002D925BA55E10430DBDBDB flags = ($E5113E26C002D925BA55E10430DBDBDB)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 > 99)
  {
    switch(a3)
    {
      case 'd':
        id v4 = @"DMA";
        break;
      case 'e':
        id v4 = @"CAT_10284_POSTAL";
        break;
      case 'f':
        id v4 = @"CAT_10285_CITY";
        break;
      case 'g':
        id v4 = @"CAT_10286_COUNTY";
        break;
      case 'h':
        id v4 = @"CAT_10287_STATE";
        break;
      case 'i':
        id v4 = @"CAT_10288_COUNTRY";
        break;
      case 'j':
        id v4 = @"CAT_10288_COUNTRY_CODE";
        break;
      case 'k':
        id v4 = @"CAT_10287_STATE_CODE";
        break;
      default:
        if (a3 == 1016)
        {
          id v4 = @"PERDU_CITY";
        }
        else
        {
LABEL_94:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
          id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_95:
        }
        break;
    }
  }
  else
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
      case '<':
      case '>':
      case '?':
      case '@':
        goto LABEL_94;
      case '+':
        id v4 = @"NEIGHBORHOOD";
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
        id v4 = @"POI";
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
      case ';':
        id v4 = @"ZCTAS";
        break;
      case '=':
        id v4 = @"CONTINENT";
        break;
      case 'A':
        id v4 = @"PHYSICAL_FEATURE";
        break;
      default:
        id v4 = @"PT_UNKNOWN";
        switch(a3)
        {
          case 0:
            goto LABEL_95;
          case 1:
            id v4 = @"COUNTRY";
            break;
          case 2:
            id v4 = @"STATE";
            break;
          case 3:
            goto LABEL_94;
          case 4:
            id v4 = @"COUNTY";
            break;
          default:
            if (a3 != 16) {
              goto LABEL_94;
            }
            id v4 = @"CITY";
            break;
        }
        break;
    }
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COUNTRY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"COUNTY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CITY"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"TIME_ZONE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"NEIGHBORHOOD"])
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
  else if ([v3 isEqualToString:@"POI"])
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
  else if ([v3 isEqualToString:@"ZCTAS"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"CONTINENT"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"PHYSICAL_FEATURE"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"PERDU_CITY"])
  {
    int v4 = 1016;
  }
  else if ([v3 isEqualToString:@"DMA"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"CAT_10284_POSTAL"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"CAT_10285_CITY"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"CAT_10286_COUNTY"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"CAT_10287_STATE"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"CAT_10288_COUNTRY"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"CAT_10288_COUNTRY_CODE"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"CAT_10287_STATE_CODE"])
  {
    int v4 = 107;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readPhoneticName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 202) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoneticName_tags_1817);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasPhoneticName
{
  return self->_phoneticName != 0;
}

- (NSString)phoneticName
{
  -[GEOPlace _readPhoneticName]((uint64_t)self);
  phoneticName = self->_phoneticName;

  return phoneticName;
}

- (void)setPhoneticName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1040000u;
  objc_storeStrong((id *)&self->_phoneticName, a3);
}

- (void)_readPhoneticAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 202) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoneticAddress_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasPhoneticAddress
{
  return self->_phoneticAddress != 0;
}

- (GEOAddress)phoneticAddress
{
  -[GEOPlace _readPhoneticAddress]((uint64_t)self);
  phoneticAddress = self->_phoneticAddress;

  return phoneticAddress;
}

- (void)setPhoneticAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1010000u;
  objc_storeStrong((id *)&self->_phoneticAddress, a3);
}

- (void)setBusiness:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
  business = self->_business;
  self->_business = v4;
}

- (void)clearBusiness
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
  business = self->_business;

  [(NSMutableArray *)business removeAllObjects];
}

- (unint64_t)businessCount
{
  -[GEOPlace _readBusiness]((uint64_t)self);
  business = self->_business;

  return [(NSMutableArray *)business count];
}

+ (Class)businessType
{
  return (Class)objc_opt_class();
}

- (int)addressGeocodeAccuracy
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $E5113E26C002D925BA55E10430DBDBDB flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 8) != 0) {
    return self->_addressGeocodeAccuracy;
  }
  else {
    return 0;
  }
}

- (void)setHasAddressGeocodeAccuracy:(BOOL)a3
{
  if (a3) {
    int v3 = 16777224;
  }
  else {
    int v3 = 0x1000000;
  }
  self->_$E5113E26C002D925BA55E10430DBDBDB flags = ($E5113E26C002D925BA55E10430DBDBDB)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (id)addressGeocodeAccuracyAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E70D0[a3];
  }

  return v3;
}

- (int)StringAsAddressGeocodeAccuracy:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"POINT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INTERPOLATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"APPROXIMATE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"POSTAL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PARCEL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SUBPREMISE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setEntryPoints:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
  entryPoints = self->_entryPoints;
  self->_entryPoints = v4;
}

- (void)clearEntryPoints
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
  entryPoints = self->_entryPoints;

  [(NSMutableArray *)entryPoints removeAllObjects];
}

- (void)addEntryPoint:(id)a3
{
  id v4 = a3;
  -[GEOPlace _readEntryPoints]((uint64_t)self);
  -[GEOPlace _addNoFlagsEntryPoint:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
}

- (void)_addNoFlagsEntryPoint:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)entryPointAtIndex:(unint64_t)a3
{
  -[GEOPlace _readEntryPoints]((uint64_t)self);
  entryPoints = self->_entryPoints;

  return (id)[(NSMutableArray *)entryPoints objectAtIndex:a3];
}

+ (Class)entryPointType
{
  return (Class)objc_opt_class();
}

- (BOOL)isDisputed
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $E5113E26C002D925BA55E10430DBDBDB flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(unsigned char *)&flags & 0x80) != 0 && self->_isDisputed;
}

- (void)setIsDisputed:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x1000080u;
  self->_isDisputed = a3;
}

- (void)setHasIsDisputed:(BOOL)a3
{
  if (a3) {
    int v3 = 16777344;
  }
  else {
    int v3 = 0x1000000;
  }
  self->_$E5113E26C002D925BA55E10430DBDBDB flags = ($E5113E26C002D925BA55E10430DBDBDB)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasIsDisputed
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (int)localSearchProviderID
{
  return self->_localSearchProviderID;
}

- (void)setHasLocalSearchProviderID:(BOOL)a3
{
  if (a3) {
    int v3 = 16777232;
  }
  else {
    int v3 = 0x1000000;
  }
  self->_$E5113E26C002D925BA55E10430DBDBDB flags = ($E5113E26C002D925BA55E10430DBDBDB)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasLocalSearchProviderID
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (void)_readSpokenName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 202) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpokenName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasSpokenName
{
  return self->_spokenName != 0;
}

- (NSString)spokenName
{
  -[GEOPlace _readSpokenName]((uint64_t)self);
  spokenName = self->_spokenName;

  return spokenName;
}

- (double)area
{
  return self->_area;
}

- (void)setArea:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x1000002u;
  self->_area = a3;
}

- (void)setHasArea:(BOOL)a3
{
  if (a3) {
    int v3 = 16777218;
  }
  else {
    int v3 = 0x1000000;
  }
  self->_$E5113E26C002D925BA55E10430DBDBDB flags = ($E5113E26C002D925BA55E10430DBDBDB)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasArea
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)hasSpokenStructuredAddress
{
  return self->_spokenStructuredAddress != 0;
}

- (void)setSpokenStructuredAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1400000u;
  objc_storeStrong((id *)&self->_spokenStructuredAddress, a3);
}

- (BOOL)hasTimezone
{
  return self->_timezone != 0;
}

- (void)setTimezone:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1800000u;
  objc_storeStrong((id *)&self->_timezone, a3);
}

- (void)_readDisplayMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 201) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayMapRegion_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasDisplayMapRegion
{
  return self->_displayMapRegion != 0;
}

- (GEOMapRegion)displayMapRegion
{
  -[GEOPlace _readDisplayMapRegion]((uint64_t)self);
  displayMapRegion = self->_displayMapRegion;

  return displayMapRegion;
}

- (void)setDisplayMapRegion:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1001000u;
  objc_storeStrong((id *)&self->_displayMapRegion, a3);
}

- (void)_readRoadAccessPoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 202) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoadAccessPoints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (NSMutableArray)roadAccessPoints
{
  -[GEOPlace _readRoadAccessPoints]((uint64_t)self);
  roadAccessPoints = self->_roadAccessPoints;

  return roadAccessPoints;
}

- (void)setRoadAccessPoints:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
  roadAccessPoints = self->_roadAccessPoints;
  self->_roadAccessPoints = v4;
}

- (void)clearRoadAccessPoints
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
  roadAccessPoints = self->_roadAccessPoints;

  [(NSMutableArray *)roadAccessPoints removeAllObjects];
}

- (void)addRoadAccessPoints:(id)a3
{
  id v4 = a3;
  -[GEOPlace _readRoadAccessPoints]((uint64_t)self);
  -[GEOPlace _addNoFlagsRoadAccessPoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
}

- (void)_addNoFlagsRoadAccessPoints:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 128);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v6 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v5;

      id v4 = *(void **)(a1 + 128);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)roadAccessPointsCount
{
  -[GEOPlace _readRoadAccessPoints]((uint64_t)self);
  roadAccessPoints = self->_roadAccessPoints;

  return [(NSMutableArray *)roadAccessPoints count];
}

- (id)roadAccessPointsAtIndex:(unint64_t)a3
{
  -[GEOPlace _readRoadAccessPoints]((uint64_t)self);
  roadAccessPoints = self->_roadAccessPoints;

  return (id)[(NSMutableArray *)roadAccessPoints objectAtIndex:a3];
}

+ (Class)roadAccessPointsType
{
  return (Class)objc_opt_class();
}

- (int64_t)geoId
{
  return self->_geoId;
}

- (void)setGeoId:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x1000004u;
  self->_geoId = a3;
}

- (void)setHasGeoId:(BOOL)a3
{
  if (a3) {
    int v3 = 16777220;
  }
  else {
    int v3 = 0x1000000;
  }
  self->_$E5113E26C002D925BA55E10430DBDBDB flags = ($E5113E26C002D925BA55E10430DBDBDB)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasGeoId
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (NSString)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPlace;
  id v4 = [(GEOPlace *)&v8 description];
  id v5 = [(GEOPlace *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPlace _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    int v5 = *(_DWORD *)(a1 + 200);
    if (v5)
    {
      id v6 = [NSNumber numberWithLongLong:*(void *)(a1 + 24)];
      if (a2) {
        id v7 = @"uID";
      }
      else {
        id v7 = @"UID";
      }
      [v4 setObject:v6 forKey:v7];

      int v5 = *(_DWORD *)(a1 + 200);
    }
    if ((v5 & 0x40) != 0)
    {
      int v8 = *(_DWORD *)(a1 + 192);
      if (v8 > 99)
      {
        switch(v8)
        {
          case 'd':
            id v9 = @"DMA";
            break;
          case 'e':
            id v9 = @"CAT_10284_POSTAL";
            break;
          case 'f':
            id v9 = @"CAT_10285_CITY";
            break;
          case 'g':
            id v9 = @"CAT_10286_COUNTY";
            break;
          case 'h':
            id v9 = @"CAT_10287_STATE";
            break;
          case 'i':
            id v9 = @"CAT_10288_COUNTRY";
            break;
          case 'j':
            id v9 = @"CAT_10288_COUNTRY_CODE";
            break;
          case 'k':
            id v9 = @"CAT_10287_STATE_CODE";
            break;
          default:
            if (v8 == 1016)
            {
              id v9 = @"PERDU_CITY";
            }
            else
            {
LABEL_19:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 192));
              id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            break;
        }
      }
      else
      {
        switch(v8)
        {
          case '#':
            id v9 = @"TIME_ZONE";
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
          case '<':
          case '>':
          case '?':
          case '@':
            goto LABEL_19;
          case '+':
            id v9 = @"NEIGHBORHOOD";
            break;
          case ',':
            id v9 = @"OCEAN";
            break;
          case '-':
            id v9 = @"AOI";
            break;
          case '.':
            id v9 = @"INLAND_WATER";
            break;
          case '/':
            id v9 = @"POI";
            break;
          case '0':
            id v9 = @"ISLAND";
            break;
          case '1':
            id v9 = @"STREET";
            break;
          case '2':
            id v9 = @"ADMIN";
            break;
          case '3':
            id v9 = @"POSTAL";
            break;
          case '6':
            id v9 = @"INTERSECTION";
            break;
          case '7':
            id v9 = @"BUILDING";
            break;
          case '9':
            id v9 = @"ADDRESS";
            break;
          case ';':
            id v9 = @"ZCTAS";
            break;
          case '=':
            id v9 = @"CONTINENT";
            break;
          case 'A':
            id v9 = @"PHYSICAL_FEATURE";
            break;
          default:
            id v9 = @"PT_UNKNOWN";
            switch(v8)
            {
              case 0:
                goto LABEL_44;
              case 1:
                id v9 = @"COUNTRY";
                break;
              case 2:
                id v9 = @"STATE";
                break;
              case 3:
                goto LABEL_19;
              case 4:
                id v9 = @"COUNTY";
                break;
              default:
                if (v8 != 16) {
                  goto LABEL_19;
                }
                id v9 = @"CITY";
                break;
            }
            break;
        }
      }
LABEL_44:
      [v4 setObject:v9 forKey:@"type"];
    }
    int v10 = [(id)a1 name];
    if (v10) {
      [v4 setObject:v10 forKey:@"name"];
    }

    id v11 = [(id)a1 mapRegion];
    uint64_t v12 = v11;
    if (v11)
    {
      if (a2) {
        [v11 jsonRepresentation];
      }
      else {
      id v13 = [v11 dictionaryRepresentation];
      }

      [v4 setObject:v13 forKey:@"mapRegion"];
    }

    id v14 = [(id)a1 address];
    uint64_t v15 = v14;
    if (v14)
    {
      if (a2) {
        [v14 jsonRepresentation];
      }
      else {
      id v16 = [v14 dictionaryRepresentation];
      }

      [v4 setObject:v16 forKey:@"address"];
    }

    id v17 = [(id)a1 phoneticName];
    if (v17) {
      [v4 setObject:v17 forKey:@"phoneticName"];
    }

    int v18 = [(id)a1 phoneticAddress];
    id v19 = v18;
    if (v18)
    {
      if (a2) {
        [v18 jsonRepresentation];
      }
      else {
      id v20 = [v18 dictionaryRepresentation];
      }

      [v4 setObject:v20 forKey:@"phoneticAddress"];
    }

    uint64_t v21 = [(id)a1 center];
    char v22 = v21;
    if (v21)
    {
      if (a2) {
        [v21 jsonRepresentation];
      }
      else {
      id v23 = [v21 dictionaryRepresentation];
      }

      [v4 setObject:v23 forKey:@"center"];
    }

    if ([*(id *)(a1 + 48) count])
    {
      long long v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v25 = *(id *)(a1 + 48);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v87 objects:v93 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v88;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v88 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void **)(*((void *)&v87 + 1) + 8 * i);
            if (a2) {
              [v30 jsonRepresentation];
            }
            else {
            id v31 = [v30 dictionaryRepresentation];
            }

            [v24 addObject:v31];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v87 objects:v93 count:16];
        }
        while (v27);
      }

      [v4 setObject:v24 forKey:@"business"];
    }
    if ((*(unsigned char *)(a1 + 200) & 8) != 0)
    {
      uint64_t v32 = *(int *)(a1 + 180);
      if (v32 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 180));
        id v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v33 = off_1E53E70D0[v32];
      }
      [v4 setObject:v33 forKey:@"addressGeocodeAccuracy"];
    }
    if ([*(id *)(a1 + 72) count])
    {
      char v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v35 = *(id *)(a1 + 72);
      uint64_t v36 = [v35 countByEnumeratingWithState:&v83 objects:v92 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v84;
        do
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void *)v84 != v38) {
              objc_enumerationMutation(v35);
            }
            long long v40 = *(void **)(*((void *)&v83 + 1) + 8 * j);
            if (a2) {
              [v40 jsonRepresentation];
            }
            else {
            id v41 = [v40 dictionaryRepresentation];
            }

            [v34 addObject:v41];
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v83 objects:v92 count:16];
        }
        while (v37);
      }

      [v4 setObject:v34 forKey:@"entryPoint"];
    }
    int v42 = *(_DWORD *)(a1 + 200);
    if ((v42 & 0x80) != 0)
    {
      uint64_t v43 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 196)];
      [v4 setObject:v43 forKey:@"isDisputed"];

      int v42 = *(_DWORD *)(a1 + 200);
    }
    if ((v42 & 0x10) != 0)
    {
      uint64_t v44 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 184)];
      [v4 setObject:v44 forKey:@"localSearchProviderID"];
    }
    uint64_t v45 = [(id)a1 spokenName];
    if (v45) {
      [v4 setObject:v45 forKey:@"spokenName"];
    }

    uint64_t v46 = [(id)a1 spokenAddress];
    if (v46) {
      [v4 setObject:v46 forKey:@"spokenAddress"];
    }

    if ((*(unsigned char *)(a1 + 200) & 2) != 0)
    {
      uint64_t v47 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
      [v4 setObject:v47 forKey:@"area"];
    }
    uint64_t v48 = [(id)a1 spokenStructuredAddress];
    v49 = v48;
    if (v48)
    {
      if (a2) {
        [v48 jsonRepresentation];
      }
      else {
      id v50 = [v48 dictionaryRepresentation];
      }

      [v4 setObject:v50 forKey:@"spokenStructuredAddress"];
    }

    id v51 = [(id)a1 timezone];
    uint64_t v52 = v51;
    if (v51)
    {
      if (a2) {
        [v51 jsonRepresentation];
      }
      else {
      id v53 = [v51 dictionaryRepresentation];
      }

      [v4 setObject:v53 forKey:@"timezone"];
    }

    uint64_t v54 = [(id)a1 displayMapRegion];
    long long v55 = v54;
    if (v54)
    {
      if (a2) {
        [v54 jsonRepresentation];
      }
      else {
      id v56 = [v54 dictionaryRepresentation];
      }

      [v4 setObject:v56 forKey:@"displayMapRegion"];
    }

    if ([*(id *)(a1 + 128) count])
    {
      id v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v58 = *(id *)(a1 + 128);
      uint64_t v59 = [v58 countByEnumeratingWithState:&v79 objects:v91 count:16];
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = *(void *)v80;
        do
        {
          for (uint64_t k = 0; k != v60; ++k)
          {
            if (*(void *)v80 != v61) {
              objc_enumerationMutation(v58);
            }
            id v63 = *(void **)(*((void *)&v79 + 1) + 8 * k);
            if (a2) {
              [v63 jsonRepresentation];
            }
            else {
            id v64 = [v63 dictionaryRepresentation];
            }

            [v57 addObject:v64];
          }
          uint64_t v60 = [v58 countByEnumeratingWithState:&v79 objects:v91 count:16];
        }
        while (v60);
      }

      [v4 setObject:v57 forKey:@"roadAccessPoints"];
    }
    if ((*(unsigned char *)(a1 + 200) & 4) != 0)
    {
      v65 = [NSNumber numberWithLongLong:*(void *)(a1 + 80)];
      [v4 setObject:v65 forKey:@"geoId"];
    }
    uint64_t v66 = [(id)a1 phoneticLocaleIdentifier];
    if (v66) {
      [v4 setObject:v66 forKey:@"phoneticLocaleIdentifier"];
    }

    if ((*(unsigned char *)(a1 + 200) & 0x20) != 0)
    {
      uint64_t v67 = *(int *)(a1 + 188);
      if (v67 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 188));
        v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v68 = off_1E53E7050[v67];
      }
      [v4 setObject:v68 forKey:@"referenceFrame"];
    }
    id v69 = *(void **)(a1 + 16);
    if (v69)
    {
      uint64_t v70 = [v69 dictionaryRepresentation];
      uint64_t v71 = v70;
      if (a2)
      {
        uint64_t v72 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v70, "count"));
        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = __38__GEOPlace__dictionaryRepresentation___block_invoke;
        v77[3] = &unk_1E53D8860;
        id v73 = v72;
        id v78 = v73;
        [v71 enumerateKeysAndObjectsUsingBlock:v77];
        id v74 = v73;

        uint64_t v71 = v74;
      }
      [v4 setObject:v71 forKey:@"Unknown Fields"];
    }
    id v75 = v4;
  }
  else
  {
    id v75 = 0;
  }

  return v75;
}

- (id)jsonRepresentation
{
  return -[GEOPlace _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __38__GEOPlace__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    int v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    int v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPlace)initWithDictionary:(id)a3
{
  return (GEOPlace *)-[GEOPlace _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (id)[a1 init];

    if (a1)
    {
      if (a3) {
        id v6 = @"uID";
      }
      else {
        id v6 = @"UID";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setUID:", objc_msgSend(v7, "longLongValue"));
      }

      int v8 = [v5 objectForKeyedSubscript:@"type"];
      objc_opt_class();
      id v89 = v5;
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
        if ([v9 isEqualToString:@"PT_UNKNOWN"])
        {
          uint64_t v10 = 0;
        }
        else if ([v9 isEqualToString:@"COUNTRY"])
        {
          uint64_t v10 = 1;
        }
        else if ([v9 isEqualToString:@"STATE"])
        {
          uint64_t v10 = 2;
        }
        else if ([v9 isEqualToString:@"COUNTY"])
        {
          uint64_t v10 = 4;
        }
        else if ([v9 isEqualToString:@"CITY"])
        {
          uint64_t v10 = 16;
        }
        else if ([v9 isEqualToString:@"TIME_ZONE"])
        {
          uint64_t v10 = 35;
        }
        else if ([v9 isEqualToString:@"NEIGHBORHOOD"])
        {
          uint64_t v10 = 43;
        }
        else if ([v9 isEqualToString:@"OCEAN"])
        {
          uint64_t v10 = 44;
        }
        else if ([v9 isEqualToString:@"AOI"])
        {
          uint64_t v10 = 45;
        }
        else if ([v9 isEqualToString:@"INLAND_WATER"])
        {
          uint64_t v10 = 46;
        }
        else if ([v9 isEqualToString:@"POI"])
        {
          uint64_t v10 = 47;
        }
        else if ([v9 isEqualToString:@"ISLAND"])
        {
          uint64_t v10 = 48;
        }
        else if ([v9 isEqualToString:@"STREET"])
        {
          uint64_t v10 = 49;
        }
        else if ([v9 isEqualToString:@"ADMIN"])
        {
          uint64_t v10 = 50;
        }
        else if ([v9 isEqualToString:@"POSTAL"])
        {
          uint64_t v10 = 51;
        }
        else if ([v9 isEqualToString:@"INTERSECTION"])
        {
          uint64_t v10 = 54;
        }
        else if ([v9 isEqualToString:@"BUILDING"])
        {
          uint64_t v10 = 55;
        }
        else if ([v9 isEqualToString:@"ADDRESS"])
        {
          uint64_t v10 = 57;
        }
        else if ([v9 isEqualToString:@"ZCTAS"])
        {
          uint64_t v10 = 59;
        }
        else if ([v9 isEqualToString:@"CONTINENT"])
        {
          uint64_t v10 = 61;
        }
        else if ([v9 isEqualToString:@"PHYSICAL_FEATURE"])
        {
          uint64_t v10 = 65;
        }
        else if ([v9 isEqualToString:@"PERDU_CITY"])
        {
          uint64_t v10 = 1016;
        }
        else if ([v9 isEqualToString:@"DMA"])
        {
          uint64_t v10 = 100;
        }
        else if ([v9 isEqualToString:@"CAT_10284_POSTAL"])
        {
          uint64_t v10 = 101;
        }
        else if ([v9 isEqualToString:@"CAT_10285_CITY"])
        {
          uint64_t v10 = 102;
        }
        else if ([v9 isEqualToString:@"CAT_10286_COUNTY"])
        {
          uint64_t v10 = 103;
        }
        else if ([v9 isEqualToString:@"CAT_10287_STATE"])
        {
          uint64_t v10 = 104;
        }
        else if ([v9 isEqualToString:@"CAT_10288_COUNTRY"])
        {
          uint64_t v10 = 105;
        }
        else if ([v9 isEqualToString:@"CAT_10288_COUNTRY_CODE"])
        {
          uint64_t v10 = 106;
        }
        else if ([v9 isEqualToString:@"CAT_10287_STATE_CODE"])
        {
          uint64_t v10 = 107;
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
          goto LABEL_74;
        }
        uint64_t v10 = [v8 intValue];
      }
      [a1 setType:v10];
LABEL_74:

      id v11 = [v5 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = (void *)[v11 copy];
        [a1 setName:v12];
      }
      id v13 = [v5 objectForKeyedSubscript:@"mapRegion"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = [GEOMapRegion alloc];
        if (a3) {
          uint64_t v15 = [(GEOMapRegion *)v14 initWithJSON:v13];
        }
        else {
          uint64_t v15 = [(GEOMapRegion *)v14 initWithDictionary:v13];
        }
        id v16 = (void *)v15;
        [a1 setMapRegion:v15];
      }
      id v17 = [v5 objectForKeyedSubscript:@"address"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v18 = [GEOAddress alloc];
        if (a3) {
          uint64_t v19 = [(GEOAddress *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEOAddress *)v18 initWithDictionary:v17];
        }
        id v20 = (void *)v19;
        [a1 setAddress:v19];
      }
      uint64_t v21 = [v5 objectForKeyedSubscript:@"phoneticName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v22 = (void *)[v21 copy];
        [a1 setPhoneticName:v22];
      }
      id v23 = [v5 objectForKeyedSubscript:@"phoneticAddress"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v24 = [GEOAddress alloc];
        if (a3) {
          uint64_t v25 = [(GEOAddress *)v24 initWithJSON:v23];
        }
        else {
          uint64_t v25 = [(GEOAddress *)v24 initWithDictionary:v23];
        }
        uint64_t v26 = (void *)v25;
        [a1 setPhoneticAddress:v25];
      }
      uint64_t v27 = [v5 objectForKeyedSubscript:@"center"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v28 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v29 = [(GEOLatLng *)v28 initWithJSON:v27];
        }
        else {
          uint64_t v29 = [(GEOLatLng *)v28 initWithDictionary:v27];
        }
        uint64_t v30 = (void *)v29;
        [a1 setCenter:v29];
      }
      id v31 = [v5 objectForKeyedSubscript:@"business"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        id v32 = v31;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v98 objects:v104 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v99;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v99 != v35) {
                objc_enumerationMutation(v32);
              }
              uint64_t v37 = *(void *)(*((void *)&v98 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v38 = [GEOBusiness alloc];
                if (a3) {
                  uint64_t v39 = [(GEOBusiness *)v38 initWithJSON:v37];
                }
                else {
                  uint64_t v39 = [(GEOBusiness *)v38 initWithDictionary:v37];
                }
                long long v40 = (void *)v39;
                [a1 addBusiness:v39];
              }
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v98 objects:v104 count:16];
          }
          while (v34);
        }

        id v5 = v89;
      }

      id v41 = [v5 objectForKeyedSubscript:@"addressGeocodeAccuracy"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v42 = v41;
        if ([v42 isEqualToString:@"POINT"])
        {
          uint64_t v43 = 0;
        }
        else if ([v42 isEqualToString:@"INTERPOLATION"])
        {
          uint64_t v43 = 1;
        }
        else if ([v42 isEqualToString:@"APPROXIMATE"])
        {
          uint64_t v43 = 2;
        }
        else if ([v42 isEqualToString:@"POSTAL"])
        {
          uint64_t v43 = 3;
        }
        else if ([v42 isEqualToString:@"PARCEL"])
        {
          uint64_t v43 = 4;
        }
        else if ([v42 isEqualToString:@"SUBPREMISE"])
        {
          uint64_t v43 = 5;
        }
        else
        {
          uint64_t v43 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_130;
        }
        uint64_t v43 = [v41 intValue];
      }
      [a1 setAddressGeocodeAccuracy:v43];
LABEL_130:

      uint64_t v44 = [v5 objectForKeyedSubscript:@"entryPoint"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id v45 = v44;
        uint64_t v46 = [v45 countByEnumeratingWithState:&v94 objects:v103 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v95;
          do
          {
            for (uint64_t j = 0; j != v47; ++j)
            {
              if (*(void *)v95 != v48) {
                objc_enumerationMutation(v45);
              }
              uint64_t v50 = *(void *)(*((void *)&v94 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v51 = [GEOLatLng alloc];
                if (a3) {
                  uint64_t v52 = [(GEOLatLng *)v51 initWithJSON:v50];
                }
                else {
                  uint64_t v52 = [(GEOLatLng *)v51 initWithDictionary:v50];
                }
                id v53 = (void *)v52;
                [a1 addEntryPoint:v52];
              }
            }
            uint64_t v47 = [v45 countByEnumeratingWithState:&v94 objects:v103 count:16];
          }
          while (v47);
        }

        id v5 = v89;
      }

      uint64_t v54 = [v5 objectForKeyedSubscript:@"isDisputed"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsDisputed:", objc_msgSend(v54, "BOOLValue"));
      }

      long long v55 = [v5 objectForKeyedSubscript:@"localSearchProviderID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLocalSearchProviderID:", objc_msgSend(v55, "intValue"));
      }

      id v56 = [v5 objectForKeyedSubscript:@"spokenName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v57 = (void *)[v56 copy];
        [a1 setSpokenName:v57];
      }
      id v58 = [v5 objectForKeyedSubscript:@"spokenAddress"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v59 = (void *)[v58 copy];
        [a1 setSpokenAddress:v59];
      }
      uint64_t v60 = [v5 objectForKeyedSubscript:@"area"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v60 doubleValue];
        objc_msgSend(a1, "setArea:");
      }

      uint64_t v61 = [v5 objectForKeyedSubscript:@"spokenStructuredAddress"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v62 = [GEOStructuredAddress alloc];
        if (a3) {
          uint64_t v63 = [(GEOStructuredAddress *)v62 initWithJSON:v61];
        }
        else {
          uint64_t v63 = [(GEOStructuredAddress *)v62 initWithDictionary:v61];
        }
        id v64 = (void *)v63;
        [a1 setSpokenStructuredAddress:v63];
      }
      v65 = [v5 objectForKeyedSubscript:@"timezone"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v66 = [GEOTimezone alloc];
        if (v66) {
          uint64_t v67 = -[GEOTimezone _initWithDictionary:isJSON:](v66, v65);
        }
        else {
          uint64_t v67 = 0;
        }
        [a1 setTimezone:v67];
      }
      v68 = [v5 objectForKeyedSubscript:@"displayMapRegion"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v69 = [GEOMapRegion alloc];
        if (a3) {
          uint64_t v70 = [(GEOMapRegion *)v69 initWithJSON:v68];
        }
        else {
          uint64_t v70 = [(GEOMapRegion *)v69 initWithDictionary:v68];
        }
        uint64_t v71 = (void *)v70;
        [a1 setDisplayMapRegion:v70];
      }
      uint64_t v72 = [v5 objectForKeyedSubscript:@"roadAccessPoints"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        id v73 = v72;
        uint64_t v74 = [v73 countByEnumeratingWithState:&v90 objects:v102 count:16];
        if (v74)
        {
          uint64_t v75 = v74;
          uint64_t v76 = *(void *)v91;
          do
          {
            for (uint64_t k = 0; k != v75; ++k)
            {
              if (*(void *)v91 != v76) {
                objc_enumerationMutation(v73);
              }
              uint64_t v78 = *(void *)(*((void *)&v90 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v79 = [GEORoadAccessPoint alloc];
                if (a3) {
                  uint64_t v80 = [(GEORoadAccessPoint *)v79 initWithJSON:v78];
                }
                else {
                  uint64_t v80 = [(GEORoadAccessPoint *)v79 initWithDictionary:v78];
                }
                long long v81 = (void *)v80;
                [a1 addRoadAccessPoints:v80];
              }
            }
            uint64_t v75 = [v73 countByEnumeratingWithState:&v90 objects:v102 count:16];
          }
          while (v75);
        }

        id v5 = v89;
      }

      long long v82 = [v5 objectForKeyedSubscript:@"geoId"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setGeoId:", objc_msgSend(v82, "longLongValue"));
      }

      long long v83 = [v5 objectForKeyedSubscript:@"phoneticLocaleIdentifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v84 = (void *)[v83 copy];
        [a1 setPhoneticLocaleIdentifier:v84];
      }
      long long v85 = [v5 objectForKeyedSubscript:@"referenceFrame"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v86 = v85;
        if ([v86 isEqualToString:@"UNKNOWN"])
        {
          uint64_t v87 = 0;
        }
        else if ([v86 isEqualToString:@"WGS84"])
        {
          uint64_t v87 = 1;
        }
        else if ([v86 isEqualToString:@"CHINA_SHIFTED"])
        {
          uint64_t v87 = 2;
        }
        else
        {
          uint64_t v87 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_198:

          a1 = a1;
          goto LABEL_199;
        }
        uint64_t v87 = [v85 intValue];
      }
      [a1 setReferenceFrame:v87];
      goto LABEL_198;
    }
  }
LABEL_199:

  return a1;
}

- (GEOPlace)initWithJSON:(id)a3
{
  return (GEOPlace *)-[GEOPlace _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPlaceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPlaceIsDirty((uint64_t)self) & 1) == 0)
  {
    id v20 = self->_reader;
    objc_sync_enter(v20);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v21 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v21];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v20);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPlace *)self readAll:0];
    $E5113E26C002D925BA55E10430DBDBDB flags = self->_flags;
    if (*(unsigned char *)&flags)
    {
      PBDataWriterWriteInt64Field();
      $E5113E26C002D925BA55E10430DBDBDB flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x40) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    if (self->_mapRegion) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_address) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_phoneticName) {
      PBDataWriterWriteStringField();
    }
    if (self->_phoneticAddress) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_center) {
      PBDataWriterWriteSubmessage();
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v7 = self->_business;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v31;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v8);
    }

    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = self->_entryPoints;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v27;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v12);
    }

    $E5113E26C002D925BA55E10430DBDBDB v15 = self->_flags;
    if ((*(unsigned char *)&v15 & 0x80) != 0)
    {
      PBDataWriterWriteBOOLField();
      $E5113E26C002D925BA55E10430DBDBDB v15 = self->_flags;
    }
    if ((*(unsigned char *)&v15 & 0x10) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_spokenName) {
      PBDataWriterWriteStringField();
    }
    if (self->_spokenAddress) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_spokenStructuredAddress) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_timezone) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_displayMapRegion) {
      PBDataWriterWriteSubmessage();
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v16 = self->_roadAccessPoints;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v23;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v16);
          }
          PBDataWriterWriteSubmessage();
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v17);
    }

    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteInt64Field();
    }
    if (self->_phoneticLocaleIdentifier) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      PBDataWriterWriteInt32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v22);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  -[GEOPlace _readBusiness]((uint64_t)self);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = self->_business;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v28 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_30;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEOPlace _readCenter]((uint64_t)self);
  if (![(GEOLatLng *)self->_center hasGreenTeaWithValue:v3])
  {
    -[GEOPlace _readDisplayMapRegion]((uint64_t)self);
    if (![(GEOMapRegion *)self->_displayMapRegion hasGreenTeaWithValue:v3])
    {
      -[GEOPlace _readEntryPoints]((uint64_t)self);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v5 = self->_entryPoints;
      uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v25;
LABEL_14:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v24 + 1) + 8 * v14) hasGreenTeaWithValue:v3]) {
            break;
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
            if (v12) {
              goto LABEL_14;
            }
            goto LABEL_20;
          }
        }
      }
      else
      {
LABEL_20:

        -[GEOPlace _readMapRegion]((uint64_t)self);
        if ([(GEOMapRegion *)self->_mapRegion hasGreenTeaWithValue:v3]) {
          return 1;
        }
        -[GEOPlace _readRoadAccessPoints]((uint64_t)self);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v5 = self->_roadAccessPoints;
        uint64_t v15 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v32 count:16];
        if (!v15)
        {
LABEL_29:
          BOOL v10 = 0;
LABEL_31:

          return v10;
        }
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v21;
LABEL_23:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v18), "hasGreenTeaWithValue:", v3, (void)v20)) {
            break;
          }
          if (v16 == ++v18)
          {
            uint64_t v16 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v32 count:16];
            if (v16) {
              goto LABEL_23;
            }
            goto LABEL_29;
          }
        }
      }
LABEL_30:
      BOOL v10 = 1;
      goto LABEL_31;
    }
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  long long v20 = (id *)a3;
  [(GEOPlace *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v20 + 1, self->_reader);
  *((_DWORD *)v20 + 42) = self->_readerMarkPos;
  *((_DWORD *)v20 + 43) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  $E5113E26C002D925BA55E10430DBDBDB flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    v20[3] = self->_uID;
    *((_DWORD *)v20 + 50) |= 1u;
    $E5113E26C002D925BA55E10430DBDBDB flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    *((_DWORD *)v20 + 48) = self->_type;
    *((_DWORD *)v20 + 50) |= 0x40u;
  }
  if (self->_name) {
    objc_msgSend(v20, "setName:");
  }
  if (self->_mapRegion) {
    objc_msgSend(v20, "setMapRegion:");
  }
  if (self->_address) {
    objc_msgSend(v20, "setAddress:");
  }
  if (self->_phoneticName) {
    objc_msgSend(v20, "setPhoneticName:");
  }
  if (self->_phoneticAddress) {
    objc_msgSend(v20, "setPhoneticAddress:");
  }
  if (self->_center) {
    objc_msgSend(v20, "setCenter:");
  }
  if ([(GEOPlace *)self businessCount])
  {
    [v20 clearBusiness];
    unint64_t v5 = [(GEOPlace *)self businessCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOPlace *)self businessAtIndex:i];
        [v20 addBusiness:v8];
      }
    }
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v20 + 45) = self->_addressGeocodeAccuracy;
    *((_DWORD *)v20 + 50) |= 8u;
  }
  if ([(GEOPlace *)self entryPointsCount])
  {
    [v20 clearEntryPoints];
    unint64_t v9 = [(GEOPlace *)self entryPointsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(GEOPlace *)self entryPointAtIndex:j];
        [v20 addEntryPoint:v12];
      }
    }
  }
  $E5113E26C002D925BA55E10430DBDBDB v13 = self->_flags;
  uint64_t v14 = v20;
  if ((*(unsigned char *)&v13 & 0x80) != 0)
  {
    *((unsigned char *)v20 + 196) = self->_isDisputed;
    *((_DWORD *)v20 + 50) |= 0x80u;
    $E5113E26C002D925BA55E10430DBDBDB v13 = self->_flags;
  }
  if ((*(unsigned char *)&v13 & 0x10) != 0)
  {
    *((_DWORD *)v20 + 46) = self->_localSearchProviderID;
    *((_DWORD *)v20 + 50) |= 0x10u;
  }
  if (self->_spokenName)
  {
    objc_msgSend(v20, "setSpokenName:");
    uint64_t v14 = v20;
  }
  if (self->_spokenAddress)
  {
    objc_msgSend(v20, "setSpokenAddress:");
    uint64_t v14 = v20;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v14[5] = *(id *)&self->_area;
    *((_DWORD *)v14 + 50) |= 2u;
  }
  if (self->_spokenStructuredAddress) {
    objc_msgSend(v20, "setSpokenStructuredAddress:");
  }
  if (self->_timezone) {
    objc_msgSend(v20, "setTimezone:");
  }
  if (self->_displayMapRegion) {
    objc_msgSend(v20, "setDisplayMapRegion:");
  }
  if ([(GEOPlace *)self roadAccessPointsCount])
  {
    [v20 clearRoadAccessPoints];
    unint64_t v15 = [(GEOPlace *)self roadAccessPointsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t k = 0; k != v16; ++k)
      {
        uint64_t v18 = [(GEOPlace *)self roadAccessPointsAtIndex:k];
        [v20 addRoadAccessPoints:v18];
      }
    }
  }
  uint64_t v19 = v20;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    v20[10] = self->_geoId;
    *((_DWORD *)v20 + 50) |= 4u;
  }
  if (self->_phoneticLocaleIdentifier)
  {
    objc_msgSend(v20, "setPhoneticLocaleIdentifier:");
    uint64_t v19 = v20;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    *((_DWORD *)v19 + 47) = self->_referenceFrame;
    *((_DWORD *)v19 + 50) |= 0x20u;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_77;
  }
  [(GEOPlace *)self readAll:1];
  [v4 readAll:1];
  $E5113E26C002D925BA55E10430DBDBDB flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 50);
  if (*(unsigned char *)&flags)
  {
    if ((v6 & 1) == 0 || self->_uID != *((void *)v4 + 3)) {
      goto LABEL_77;
    }
  }
  else if (v6)
  {
    goto LABEL_77;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_type != *((_DWORD *)v4 + 48)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_77;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 12) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_77;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 11))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
      goto LABEL_77;
    }
  }
  address = self->_address;
  if ((unint64_t)address | *((void *)v4 + 4))
  {
    if (!-[GEOAddress isEqual:](address, "isEqual:")) {
      goto LABEL_77;
    }
  }
  phoneticName = self->_phoneticName;
  if ((unint64_t)phoneticName | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](phoneticName, "isEqual:")) {
      goto LABEL_77;
    }
  }
  phoneticAddress = self->_phoneticAddress;
  if ((unint64_t)phoneticAddress | *((void *)v4 + 13))
  {
    if (!-[GEOAddress isEqual:](phoneticAddress, "isEqual:")) {
      goto LABEL_77;
    }
  }
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:")) {
      goto LABEL_77;
    }
  }
  business = self->_business;
  if ((unint64_t)business | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](business, "isEqual:")) {
      goto LABEL_77;
    }
  }
  $E5113E26C002D925BA55E10430DBDBDB v14 = self->_flags;
  int v15 = *((_DWORD *)v4 + 50);
  if ((*(unsigned char *)&v14 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_addressGeocodeAccuracy != *((_DWORD *)v4 + 45)) {
      goto LABEL_77;
    }
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_77;
  }
  entryPoints = self->_entryPoints;
  if ((unint64_t)entryPoints | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](entryPoints, "isEqual:")) {
      goto LABEL_77;
    }
    $E5113E26C002D925BA55E10430DBDBDB v14 = self->_flags;
    int v15 = *((_DWORD *)v4 + 50);
  }
  if ((*(unsigned char *)&v14 & 0x80) != 0)
  {
    if ((v15 & 0x80) == 0) {
      goto LABEL_77;
    }
    if (self->_isDisputed)
    {
      if (!*((unsigned char *)v4 + 196)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)v4 + 196))
    {
      goto LABEL_77;
    }
  }
  else if ((v15 & 0x80) != 0)
  {
    goto LABEL_77;
  }
  if ((*(unsigned char *)&v14 & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_localSearchProviderID != *((_DWORD *)v4 + 46)) {
      goto LABEL_77;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_77;
  }
  spokenName = self->_spokenName;
  if ((unint64_t)spokenName | *((void *)v4 + 18)
    && !-[NSString isEqual:](spokenName, "isEqual:"))
  {
    goto LABEL_77;
  }
  spokenAddress = self->_spokenAddress;
  if ((unint64_t)spokenAddress | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](spokenAddress, "isEqual:")) {
      goto LABEL_77;
    }
  }
  int v19 = *((_DWORD *)v4 + 50);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v19 & 2) == 0 || self->_area != *((double *)v4 + 5)) {
      goto LABEL_77;
    }
  }
  else if ((v19 & 2) != 0)
  {
    goto LABEL_77;
  }
  spokenStructuredAddress = self->_spokenStructuredAddress;
  if ((unint64_t)spokenStructuredAddress | *((void *)v4 + 19)
    && !-[GEOStructuredAddress isEqual:](spokenStructuredAddress, "isEqual:"))
  {
    goto LABEL_77;
  }
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((void *)v4 + 20))
  {
    if (!-[GEOTimezone isEqual:](timezone, "isEqual:")) {
      goto LABEL_77;
    }
  }
  displayMapRegion = self->_displayMapRegion;
  if ((unint64_t)displayMapRegion | *((void *)v4 + 8))
  {
    if (!-[GEOMapRegion isEqual:](displayMapRegion, "isEqual:")) {
      goto LABEL_77;
    }
  }
  roadAccessPoints = self->_roadAccessPoints;
  if ((unint64_t)roadAccessPoints | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](roadAccessPoints, "isEqual:")) {
      goto LABEL_77;
    }
  }
  $E5113E26C002D925BA55E10430DBDBDB v24 = self->_flags;
  int v25 = *((_DWORD *)v4 + 50);
  if ((*(unsigned char *)&v24 & 4) != 0)
  {
    if ((v25 & 4) == 0 || self->_geoId != *((void *)v4 + 10)) {
      goto LABEL_77;
    }
  }
  else if ((v25 & 4) != 0)
  {
    goto LABEL_77;
  }
  phoneticLocaleIdentifier = self->_phoneticLocaleIdentifier;
  if ((unint64_t)phoneticLocaleIdentifier | *((void *)v4 + 14))
  {
    if (-[NSString isEqual:](phoneticLocaleIdentifier, "isEqual:"))
    {
      $E5113E26C002D925BA55E10430DBDBDB v24 = self->_flags;
      int v25 = *((_DWORD *)v4 + 50);
      goto LABEL_72;
    }
LABEL_77:
    BOOL v27 = 0;
    goto LABEL_78;
  }
LABEL_72:
  if ((*(unsigned char *)&v24 & 0x20) != 0)
  {
    if ((v25 & 0x20) == 0 || self->_referenceFrame != *((_DWORD *)v4 + 47)) {
      goto LABEL_77;
    }
    BOOL v27 = 1;
  }
  else
  {
    BOOL v27 = (v25 & 0x20) == 0;
  }
LABEL_78:

  return v27;
}

- (unint64_t)hash
{
  [(GEOPlace *)self readAll:1];
  $E5113E26C002D925BA55E10430DBDBDB flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    uint64_t v32 = 2654435761 * self->_uID;
    if ((*(unsigned char *)&flags & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v32 = 0;
    if ((*(unsigned char *)&flags & 0x40) != 0)
    {
LABEL_3:
      uint64_t v31 = 2654435761 * self->_type;
      goto LABEL_6;
    }
  }
  uint64_t v31 = 0;
LABEL_6:
  NSUInteger v30 = [(NSString *)self->_name hash];
  unint64_t v29 = [(GEOMapRegion *)self->_mapRegion hash];
  unint64_t v28 = [(GEOAddress *)self->_address hash];
  NSUInteger v27 = [(NSString *)self->_phoneticName hash];
  unint64_t v26 = [(GEOAddress *)self->_phoneticAddress hash];
  unint64_t v25 = [(GEOLatLng *)self->_center hash];
  uint64_t v24 = [(NSMutableArray *)self->_business hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v23 = 2654435761 * self->_addressGeocodeAccuracy;
  }
  else {
    uint64_t v23 = 0;
  }
  uint64_t v22 = [(NSMutableArray *)self->_entryPoints hash];
  $E5113E26C002D925BA55E10430DBDBDB v4 = self->_flags;
  if ((*(unsigned char *)&v4 & 0x80) != 0)
  {
    uint64_t v21 = 2654435761 * self->_isDisputed;
    if ((*(unsigned char *)&v4 & 0x10) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((*(unsigned char *)&v4 & 0x10) != 0)
    {
LABEL_11:
      uint64_t v20 = 2654435761 * self->_localSearchProviderID;
      goto LABEL_14;
    }
  }
  uint64_t v20 = 0;
LABEL_14:
  NSUInteger v19 = [(NSString *)self->_spokenName hash];
  NSUInteger v5 = [(NSString *)self->_spokenAddress hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    double area = self->_area;
    double v8 = -area;
    if (area >= 0.0) {
      double v8 = self->_area;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  unint64_t v11 = [(GEOStructuredAddress *)self->_spokenStructuredAddress hash];
  unint64_t v12 = [(GEOTimezone *)self->_timezone hash];
  unint64_t v13 = [(GEOMapRegion *)self->_displayMapRegion hash];
  uint64_t v14 = [(NSMutableArray *)self->_roadAccessPoints hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v15 = 2654435761 * self->_geoId;
  }
  else {
    uint64_t v15 = 0;
  }
  NSUInteger v16 = [(NSString *)self->_phoneticLocaleIdentifier hash];
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    uint64_t v17 = 2654435761 * self->_referenceFrame;
  }
  else {
    uint64_t v17 = 0;
  }
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v5 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  int v5 = *((_DWORD *)v4 + 50);
  if (v5)
  {
    self->_uID = *((void *)v4 + 3);
    *(_DWORD *)&self->_flags |= 1u;
    int v5 = *((_DWORD *)v4 + 50);
  }
  if ((v5 & 0x40) != 0)
  {
    self->_type = *((_DWORD *)v4 + 48);
    *(_DWORD *)&self->_flags |= 0x40u;
  }
  if (*((void *)v4 + 12)) {
    -[GEOPlace setName:](self, "setName:");
  }
  mapRegion = self->_mapRegion;
  uint64_t v7 = *((void *)v4 + 11);
  if (mapRegion)
  {
    if (v7) {
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOPlace setMapRegion:](self, "setMapRegion:");
  }
  address = self->_address;
  uint64_t v9 = *((void *)v4 + 4);
  if (address)
  {
    if (v9) {
      -[GEOAddress mergeFrom:](address, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOPlace setAddress:](self, "setAddress:");
  }
  if (*((void *)v4 + 15)) {
    -[GEOPlace setPhoneticName:](self, "setPhoneticName:");
  }
  phoneticAddress = self->_phoneticAddress;
  uint64_t v11 = *((void *)v4 + 13);
  if (phoneticAddress)
  {
    if (v11) {
      -[GEOAddress mergeFrom:](phoneticAddress, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOPlace setPhoneticAddress:](self, "setPhoneticAddress:");
  }
  center = self->_center;
  uint64_t v13 = *((void *)v4 + 7);
  if (center)
  {
    if (v13) {
      -[GEOLatLng mergeFrom:](center, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEOPlace setCenter:](self, "setCenter:");
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v14 = *((id *)v4 + 6);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v46 != v17) {
          objc_enumerationMutation(v14);
        }
        [(GEOPlace *)self addBusiness:*(void *)(*((void *)&v45 + 1) + 8 * i)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v16);
  }

  if ((*((unsigned char *)v4 + 200) & 8) != 0)
  {
    self->_addressGeocodeAccuracy = *((_DWORD *)v4 + 45);
    *(_DWORD *)&self->_flags |= 8u;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v19 = *((id *)v4 + 9);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v42 != v22) {
          objc_enumerationMutation(v19);
        }
        [(GEOPlace *)self addEntryPoint:*(void *)(*((void *)&v41 + 1) + 8 * j)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v21);
  }

  int v24 = *((_DWORD *)v4 + 50);
  if ((v24 & 0x80) != 0)
  {
    self->_isDisputed = *((unsigned char *)v4 + 196);
    *(_DWORD *)&self->_flags |= 0x80u;
    int v24 = *((_DWORD *)v4 + 50);
  }
  if ((v24 & 0x10) != 0)
  {
    self->_localSearchProviderID = *((_DWORD *)v4 + 46);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  if (*((void *)v4 + 18)) {
    -[GEOPlace setSpokenName:](self, "setSpokenName:");
  }
  if (*((void *)v4 + 17)) {
    -[GEOPlace setSpokenAddress:](self, "setSpokenAddress:");
  }
  if ((*((unsigned char *)v4 + 200) & 2) != 0)
  {
    self->_double area = *((double *)v4 + 5);
    *(_DWORD *)&self->_flags |= 2u;
  }
  spokenStructuredAddress = self->_spokenStructuredAddress;
  uint64_t v26 = *((void *)v4 + 19);
  if (spokenStructuredAddress)
  {
    if (v26) {
      -[GEOStructuredAddress mergeFrom:](spokenStructuredAddress, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[GEOPlace setSpokenStructuredAddress:](self, "setSpokenStructuredAddress:");
  }
  timezone = self->_timezone;
  uint64_t v28 = *((void *)v4 + 20);
  if (timezone)
  {
    if (v28)
    {
      unint64_t v29 = *(void **)(v28 + 16);
      if (v29) {
        -[GEOTimezone setIdentifier:]((uint64_t)timezone, v29);
      }
    }
  }
  else if (v28)
  {
    -[GEOPlace setTimezone:](self, "setTimezone:");
  }
  displayMapRegion = self->_displayMapRegion;
  uint64_t v31 = *((void *)v4 + 8);
  if (displayMapRegion)
  {
    if (v31) {
      -[GEOMapRegion mergeFrom:](displayMapRegion, "mergeFrom:");
    }
  }
  else if (v31)
  {
    -[GEOPlace setDisplayMapRegion:](self, "setDisplayMapRegion:");
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v32 = *((id *)v4 + 16);
  uint64_t v33 = [v32 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v38 != v35) {
          objc_enumerationMutation(v32);
        }
        -[GEOPlace addRoadAccessPoints:](self, "addRoadAccessPoints:", *(void *)(*((void *)&v37 + 1) + 8 * k), (void)v37);
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v34);
  }

  if ((*((unsigned char *)v4 + 200) & 4) != 0)
  {
    self->_geoId = *((void *)v4 + 10);
    *(_DWORD *)&self->_flags |= 4u;
  }
  if (*((void *)v4 + 14)) {
    -[GEOPlace setPhoneticLocaleIdentifier:](self, "setPhoneticLocaleIdentifier:");
  }
  if ((*((unsigned char *)v4 + 200) & 0x20) != 0)
  {
    self->_referenceFrame = *((_DWORD *)v4 + 47);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 1) & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      int v5 = reader;
      objc_sync_enter(v5);
      GEOPlaceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1881);
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
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000100u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPlace *)self readAll:0];
    [(GEOMapRegion *)self->_mapRegion clearUnknownFields:1];
    [(GEOAddress *)self->_address clearUnknownFields:1];
    [(GEOAddress *)self->_phoneticAddress clearUnknownFields:1];
    [(GEOLatLng *)self->_center clearUnknownFields:1];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v7 = self->_business;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v33;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v9);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    unint64_t v12 = self->_entryPoints;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v14);
    }

    [(GEOStructuredAddress *)self->_spokenStructuredAddress clearUnknownFields:1];
    timezone = self->_timezone;
    if (timezone)
    {
      uint64_t v18 = timezone->_unknownFields;
      timezone->_unknownFields = 0;
    }
    [(GEOMapRegion *)self->_displayMapRegion clearUnknownFields:1];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v19 = self->_roadAccessPoints;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v25;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v23++), "clearUnknownFields:", 1, (void)v24);
        }
        while (v21 != v23);
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v21);
    }
  }
}

- (void)_readPhoneticLocaleIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 202) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoneticLocaleIdentifier_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasPhoneticLocaleIdentifier
{
  return self->_phoneticLocaleIdentifier != 0;
}

- (NSString)phoneticLocaleIdentifier
{
  -[GEOPlace _readPhoneticLocaleIdentifier]((uint64_t)self);
  phoneticLocaleIdentifier = self->_phoneticLocaleIdentifier;

  return phoneticLocaleIdentifier;
}

- (void)setReferenceFrame:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x1000020u;
  self->_referenceFrame = a3;
}

- (void)setHasReferenceFrame:(BOOL)a3
{
  if (a3) {
    int v3 = 16777248;
  }
  else {
    int v3 = 0x1000000;
  }
  self->_$E5113E26C002D925BA55E10430DBDBDB flags = ($E5113E26C002D925BA55E10430DBDBDB)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasReferenceFrame
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)referenceFrameAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E7050[a3];
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

- (id)addressDictionary
{
  id v3 = [(GEOPlace *)self address];
  int v4 = [v3 addressDictionary];

  if (!v4) {
    int v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:12];
  }
  if ([(GEOPlace *)self hasName])
  {
    int v5 = [(GEOPlace *)self name];
    [v4 setObject:v5 forKey:@"Name"];
  }

  return v4;
}

- (double)radialDistance
{
  if (![(GEOPlace *)self hasAddressGeocodeAccuracy]) {
    return 100.0;
  }
  int v3 = [(GEOPlace *)self addressGeocodeAccuracy];
  double result = 100.0;
  if (!v3) {
    return 50.0;
  }
  return result;
}

- (id)arrivalMapRegion
{
  if ([(GEOPlace *)self hasType] && ![(GEOPlace *)self addressGeocodeAccuracy])
  {
    unsigned int v5 = [(GEOPlace *)self type];
    int v3 = 0;
    if (v5 <= 0x39 && ((1 << v5) & 0x242A00000000000) != 0)
    {
      int v3 = [(GEOPlace *)self mapRegion];
    }
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

- (id)arrivalMapRegionForTransportType:(int)a3
{
  uint64_t v5 = [(GEOPlace *)self arrivalMapRegion];
  unint64_t v6 = (void *)v5;
  if (a3 || v5 || ![(GEOPlace *)self hasCenter]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = [[GEOMapRegion alloc] initWithRadialPlace:self];
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)setNSTimeZone:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    int v4 = objc_alloc_init(GEOTimezone);
    uint64_t v5 = [v6 name];
    -[GEOTimezone setIdentifier:]((uint64_t)v4, v5);

    [(GEOPlace *)self setTimezone:v4];
  }
  else
  {
    [(GEOPlace *)self setTimezone:0];
  }
}

- (GEOPlace)initWithName:(id)a3 placeType:(int)a4 areaInMeters:(double)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOPlace;
  uint64_t v9 = [(GEOPlace *)&v13 init];
  if (v9)
  {
    uint64_t v10 = (void *)[v8 copy];
    [(GEOPlace *)v9 setName:v10];

    [(GEOPlace *)v9 setType:_PlaceTypeForMapItemPlaceType(a4)];
    [(GEOPlace *)v9 setArea:a5];
    uint64_t v11 = v9;
  }

  return v9;
}

@end