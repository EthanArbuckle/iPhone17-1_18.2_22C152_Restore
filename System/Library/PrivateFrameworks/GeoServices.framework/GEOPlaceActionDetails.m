@interface GEOPlaceActionDetails
+ (BOOL)isValid:(id)a3;
+ (GEOPlaceActionDetails)actionDetailsWithChildPlace:(id)a3 timestamp:(double)a4 resultIndex:(int)a5;
+ (GEOPlaceActionDetails)actionDetailsWithDetails:(id)a3 timestamp:(double)a4;
+ (GEOPlaceActionDetails)actionDetailsWithMapItem:(id)a3 childPlace:(id)a4 timestamp:(double)a5 resultIndex:(int)a6 targetID:(unint64_t)a7 transitCardCategory:(int)a8 transitSystem:(id)a9 transitDepartureSequence:(id)a10 transitIncident:(id)a11;
+ (GEOPlaceActionDetails)actionDetailsWithMapItem:(id)a3 timestamp:(double)a4 resultIndex:(int)a5;
+ (GEOPlaceActionDetails)actionDetailsWithMapItem:(id)a3 timestamp:(double)a4 resultIndex:(int)a5 targetID:(unint64_t)a6;
+ (GEOPlaceActionDetails)actionDetailsWithMapItem:(id)a3 timestamp:(double)a4 resultIndex:(int)a5 targetID:(unint64_t)a6 transitCardCategory:(int)a7 transitSystem:(id)a8 transitDepartureSequence:(id)a9 transitIncident:(id)a10;
+ (GEOPlaceActionDetails)actionDetailsWithTargetID:(unint64_t)a3;
- (BOOL)hasActionUrl;
- (BOOL)hasAnimationID;
- (BOOL)hasBusinessID;
- (BOOL)hasDestinationApp;
- (BOOL)hasLocalSearchProviderID;
- (BOOL)hasPhotoId;
- (BOOL)hasPlaceID;
- (BOOL)hasResultIndex;
- (BOOL)hasRichProviderId;
- (BOOL)hasSearchResponseRelativeTimestamp;
- (BOOL)hasShowcaseId;
- (BOOL)hasTargetID;
- (BOOL)hasTransitPlaceCard;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPlaceActionDetails)init;
- (GEOPlaceActionDetails)initWithData:(id)a3;
- (GEOPlaceActionDetails)initWithDictionary:(id)a3;
- (GEOPlaceActionDetails)initWithJSON:(id)a3;
- (GEOPlaceActionDetails)initWithMapItem:(id)a3 childPlace:(id)a4 relativeTimestamp:(double)a5 resultIndex:(int)a6 targetID:(unint64_t)a7 transitCardCategory:(int)a8 transitSystem:(id)a9 transitDepartureSequence:(id)a10 transitIncident:(id)a11;
- (GEOPlaceActionDetails)initWithMapItem:(id)a3 relativeTimestamp:(double)a4 resultIndex:(int)a5;
- (GEOPlaceActionDetails)initWithMapItem:(id)a3 relativeTimestamp:(double)a4 resultIndex:(int)a5 targetID:(unint64_t)a6;
- (GEOTransitPlaceCard)transitPlaceCard;
- (NSString)actionUrl;
- (NSString)destinationApp;
- (NSString)photoId;
- (NSString)richProviderId;
- (NSString)showcaseId;
- (double)searchResponseRelativeTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)localSearchProviderID;
- (int)resultIndex;
- (int64_t)placeID;
- (unint64_t)animationID;
- (unint64_t)businessID;
- (unint64_t)hash;
- (unint64_t)targetID;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readActionUrl;
- (void)_readDestinationApp;
- (void)_readPhotoId;
- (void)_readRichProviderId;
- (void)_readShowcaseId;
- (void)_readTransitPlaceCard;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setActionUrl:(id)a3;
- (void)setAnimationID:(unint64_t)a3;
- (void)setBusinessID:(unint64_t)a3;
- (void)setDestinationApp:(id)a3;
- (void)setHasAnimationID:(BOOL)a3;
- (void)setHasBusinessID:(BOOL)a3;
- (void)setHasLocalSearchProviderID:(BOOL)a3;
- (void)setHasPlaceID:(BOOL)a3;
- (void)setHasResultIndex:(BOOL)a3;
- (void)setHasSearchResponseRelativeTimestamp:(BOOL)a3;
- (void)setHasTargetID:(BOOL)a3;
- (void)setLocalSearchProviderID:(int)a3;
- (void)setPhotoId:(id)a3;
- (void)setPlaceID:(int64_t)a3;
- (void)setResultIndex:(int)a3;
- (void)setRichProviderId:(id)a3;
- (void)setSearchResponseRelativeTimestamp:(double)a3;
- (void)setShowcaseId:(id)a3;
- (void)setTargetID:(unint64_t)a3;
- (void)setTransitPlaceCard:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPlaceActionDetails

+ (GEOPlaceActionDetails)actionDetailsWithMapItem:(id)a3 timestamp:(double)a4 resultIndex:(int)a5 targetID:(unint64_t)a6
{
  return (GEOPlaceActionDetails *)[a1 actionDetailsWithMapItem:a3 timestamp:*(void *)&a5 resultIndex:a6 targetID:0 transitCardCategory:0 transitSystem:0 transitDepartureSequence:a4 transitIncident:0];
}

+ (GEOPlaceActionDetails)actionDetailsWithMapItem:(id)a3 timestamp:(double)a4 resultIndex:(int)a5 targetID:(unint64_t)a6 transitCardCategory:(int)a7 transitSystem:(id)a8 transitDepartureSequence:(id)a9 transitIncident:(id)a10
{
  return (GEOPlaceActionDetails *)[a1 actionDetailsWithMapItem:a3 childPlace:0 timestamp:*(void *)&a5 resultIndex:a6 targetID:*(void *)&a7 transitCardCategory:a8 transitSystem:a4 transitDepartureSequence:a9 transitIncident:a10];
}

+ (GEOPlaceActionDetails)actionDetailsWithDetails:(id)a3 timestamp:(double)a4
{
  id v5 = a3;
  double v6 = 0.0;
  if (a4 <= 0.0
    || (double v6 = CFAbsoluteTimeGetCurrent() - a4,
        (double)GEOConfigGetInteger(GeoServicesConfig_MaximumSearchLifetimeInMinutes, (uint64_t)off_1E9113A78) * 60.0 >= v6))
  {
    v7 = (void *)[v5 copy];
    [v7 setSearchResponseRelativeTimestamp:v6];
    if (v6 == 0.0) {
      [v7 setHasSearchResponseRelativeTimestamp:0];
    }
  }
  else
  {
    v7 = 0;
  }

  return (GEOPlaceActionDetails *)v7;
}

+ (GEOPlaceActionDetails)actionDetailsWithMapItem:(id)a3 childPlace:(id)a4 timestamp:(double)a5 resultIndex:(int)a6 targetID:(unint64_t)a7 transitCardCategory:(int)a8 transitSystem:(id)a9 transitDepartureSequence:(id)a10 transitIncident:(id)a11
{
  uint64_t v12 = *(void *)&a8;
  uint64_t v14 = *(void *)&a6;
  id v17 = a3;
  id v18 = a4;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  if ((v17 || v18 || a5 != 0.0 || (v14 & 0x80000000) == 0 || a7)
    && ((double v22 = 0.0, a5 <= 0.0)
     || (double v22 = CFAbsoluteTimeGetCurrent() - a5,
         (double)GEOConfigGetInteger(GeoServicesConfig_MaximumSearchLifetimeInMinutes, (uint64_t)off_1E9113A78) * 60.0 >= v22)))
  {
    v23 = [[GEOPlaceActionDetails alloc] initWithMapItem:v17 childPlace:v18 relativeTimestamp:v14 resultIndex:a7 targetID:v12 transitCardCategory:v19 transitSystem:v22 transitDepartureSequence:v20 transitIncident:v21];
  }
  else
  {
    v23 = 0;
  }

  return v23;
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
    [(GEOPlaceActionDetails *)self readAll:0];
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(void *)(v5 + 32) = self->_businessID;
      *(_WORD *)(v5 + 124) |= 2u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_7:
        if ((flags & 0x20) == 0) {
          goto LABEL_8;
        }
        goto LABEL_17;
      }
    }
    else if ((flags & 4) == 0)
    {
      goto LABEL_7;
    }
    *(void *)(v5 + 56) = self->_placeID;
    *(_WORD *)(v5 + 124) |= 4u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_8:
      if ((flags & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_18;
    }
LABEL_17:
    *(_DWORD *)(v5 + 116) = self->_localSearchProviderID;
    *(_WORD *)(v5 + 124) |= 0x20u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_9:
      if ((flags & 0x40) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
LABEL_18:
    *(double *)(v5 + 72) = self->_searchResponseRelativeTimestamp;
    *(_WORD *)(v5 + 124) |= 8u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_10:
      if ((flags & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_20;
    }
LABEL_19:
    *(_DWORD *)(v5 + 120) = self->_resultIndex;
    *(_WORD *)(v5 + 124) |= 0x40u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_11:
      if ((flags & 0x10) == 0)
      {
LABEL_13:
        uint64_t v10 = [(NSString *)self->_photoId copyWithZone:a3];
        v11 = *(void **)(v5 + 48);
        *(void *)(v5 + 48) = v10;

        uint64_t v12 = [(NSString *)self->_actionUrl copyWithZone:a3];
        v13 = *(void **)(v5 + 16);
        *(void *)(v5 + 16) = v12;

        id v14 = [(GEOTransitPlaceCard *)self->_transitPlaceCard copyWithZone:a3];
        v15 = *(void **)(v5 + 96);
        *(void *)(v5 + 96) = v14;

        uint64_t v16 = [(NSString *)self->_richProviderId copyWithZone:a3];
        id v17 = *(void **)(v5 + 64);
        *(void *)(v5 + 64) = v16;

        uint64_t v18 = [(NSString *)self->_destinationApp copyWithZone:a3];
        id v19 = *(void **)(v5 + 40);
        *(void *)(v5 + 40) = v18;

        uint64_t v20 = [(NSString *)self->_showcaseId copyWithZone:a3];
        id v8 = *(id *)(v5 + 80);
        *(void *)(v5 + 80) = v20;
        goto LABEL_14;
      }
LABEL_12:
      *(void *)(v5 + 88) = self->_targetID;
      *(_WORD *)(v5 + 124) |= 0x10u;
      goto LABEL_13;
    }
LABEL_20:
    *(void *)(v5 + 24) = self->_animationID;
    *(_WORD *)(v5 + 124) |= 1u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPlaceActionDetailsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_14:
  return (id)v5;
}

- (GEOPlaceActionDetails)initWithMapItem:(id)a3 relativeTimestamp:(double)a4 resultIndex:(int)a5
{
  return [(GEOPlaceActionDetails *)self initWithMapItem:a3 relativeTimestamp:*(void *)&a5 resultIndex:0 targetID:a4];
}

- (GEOPlaceActionDetails)initWithMapItem:(id)a3 relativeTimestamp:(double)a4 resultIndex:(int)a5 targetID:(unint64_t)a6
{
  return [(GEOPlaceActionDetails *)self initWithMapItem:a3 childPlace:0 relativeTimestamp:*(void *)&a5 resultIndex:a6 targetID:0 transitCardCategory:0 transitSystem:a4 transitDepartureSequence:0 transitIncident:0];
}

- (GEOPlaceActionDetails)initWithMapItem:(id)a3 childPlace:(id)a4 relativeTimestamp:(double)a5 resultIndex:(int)a6 targetID:(unint64_t)a7 transitCardCategory:(int)a8 transitSystem:(id)a9 transitDepartureSequence:(id)a10 transitIncident:(id)a11
{
  uint64_t v12 = *(void *)&a8;
  uint64_t v14 = *(void *)&a6;
  id v18 = a3;
  id v19 = a4;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  v38.receiver = self;
  v38.super_class = (Class)GEOPlaceActionDetails;
  v23 = [(GEOPlaceActionDetails *)&v38 init];
  if (v23)
  {
    if ([v18 _hasMUID])
    {
      -[GEOPlaceActionDetails setPlaceID:](v23, "setPlaceID:", [v18 _muid]);
      -[GEOPlaceActionDetails setBusinessID:](v23, "setBusinessID:", [v18 _muid]);
    }
    if (v19)
    {
      v24 = [v19 identifier];
      -[GEOPlaceActionDetails setBusinessID:](v23, "setBusinessID:", [v24 muid]);
    }
    v25 = [v18 _vendorID];
    [(GEOPlaceActionDetails *)v23 setRichProviderId:v25];

    uint64_t v26 = [v18 _resultProviderID];
    if (v26) {
      [(GEOPlaceActionDetails *)v23 setLocalSearchProviderID:v26];
    }
    if (a5 > 0.0) {
      [(GEOPlaceActionDetails *)v23 setSearchResponseRelativeTimestamp:a5];
    }
    if ((v14 & 0x80000000) == 0) {
      [(GEOPlaceActionDetails *)v23 setResultIndex:v14];
    }
    if (a7) {
      [(GEOPlaceActionDetails *)v23 setTargetID:a7];
    }
    if (v12 || v20)
    {
      v27 = objc_opt_new();
      [v27 setTransitCategory:v12];
      if (v20)
      {
        v28 = [v20 name];
        [v27 setTransitSystemName:v28];

        if (v21)
        {
          v29 = objc_opt_new();
          v30 = [v21 headsign];
          v31 = (void *)[v30 copy];
          [v29 setHeadsign:v31];

          v32 = [v21 direction];
          v33 = (void *)[v32 copy];
          [v29 setDirection:v33];

          v34 = [v21 line];
          objc_msgSend(v29, "setLineId:", objc_msgSend(v34, "muid"));

          [v27 setTransitDepartureSequenceUsage:v29];
        }
        if (v22)
        {
          v35 = [v22 title];
          [v27 setIncidentType:v35];
        }
      }
      [(GEOPlaceActionDetails *)v23 setTransitPlaceCard:v27];
    }
    v36 = v23;
  }

  return v23;
}

+ (GEOPlaceActionDetails)actionDetailsWithTargetID:(unint64_t)a3
{
  return (GEOPlaceActionDetails *)[a1 actionDetailsWithMapItem:0 timestamp:0xFFFFFFFFLL resultIndex:a3 targetID:0.0];
}

+ (GEOPlaceActionDetails)actionDetailsWithMapItem:(id)a3 timestamp:(double)a4 resultIndex:(int)a5
{
  return (GEOPlaceActionDetails *)[a1 actionDetailsWithMapItem:a3 timestamp:*(void *)&a5 resultIndex:0 targetID:a4];
}

+ (GEOPlaceActionDetails)actionDetailsWithChildPlace:(id)a3 timestamp:(double)a4 resultIndex:(int)a5
{
  return (GEOPlaceActionDetails *)[a1 actionDetailsWithMapItem:0 childPlace:a3 timestamp:*(void *)&a5 resultIndex:0 targetID:0 transitCardCategory:0 transitSystem:a4 transitDepartureSequence:0 transitIncident:0];
}

- (GEOPlaceActionDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceActionDetails;
  v2 = [(GEOPlaceActionDetails *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPlaceActionDetails)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPlaceActionDetails;
  v3 = [(GEOPlaceActionDetails *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (unint64_t)businessID
{
  return self->_businessID;
}

- (void)setBusinessID:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_businessID = a3;
}

- (void)setHasBusinessID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8194;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasBusinessID
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (int64_t)placeID
{
  return self->_placeID;
}

- (void)setPlaceID:(int64_t)a3
{
  *(_WORD *)&self->_flags |= 0x2004u;
  self->_placeID = a3;
}

- (void)setHasPlaceID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8196;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasPlaceID
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (int)localSearchProviderID
{
  return self->_localSearchProviderID;
}

- (void)setLocalSearchProviderID:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2020u;
  self->_localSearchProviderID = a3;
}

- (void)setHasLocalSearchProviderID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8224;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasLocalSearchProviderID
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (double)searchResponseRelativeTimestamp
{
  return self->_searchResponseRelativeTimestamp;
}

- (void)setSearchResponseRelativeTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  self->_searchResponseRelativeTimestamp = a3;
}

- (void)setHasSearchResponseRelativeTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8200;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasSearchResponseRelativeTimestamp
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (int)resultIndex
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0) {
    return self->_resultIndex;
  }
  else {
    return -1;
  }
}

- (void)setResultIndex:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2040u;
  self->_resultIndex = a3;
}

- (void)setHasResultIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8256;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasResultIndex
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (unint64_t)animationID
{
  return self->_animationID;
}

- (void)setAnimationID:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_animationID = a3;
}

- (void)setHasAnimationID:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasAnimationID
{
  return *(_WORD *)&self->_flags & 1;
}

- (unint64_t)targetID
{
  return self->_targetID;
}

- (void)setTargetID:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  self->_targetID = a3;
}

- (void)setHasTargetID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8208;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasTargetID
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)_readPhotoId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 124) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceActionDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasPhotoId
{
  return self->_photoId != 0;
}

- (NSString)photoId
{
  -[GEOPlaceActionDetails _readPhotoId]((uint64_t)self);
  photoId = self->_photoId;

  return photoId;
}

- (void)setPhotoId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2200u;
  objc_storeStrong((id *)&self->_photoId, a3);
}

- (void)_readActionUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 124) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceActionDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActionUrl_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasActionUrl
{
  return self->_actionUrl != 0;
}

- (NSString)actionUrl
{
  -[GEOPlaceActionDetails _readActionUrl]((uint64_t)self);
  actionUrl = self->_actionUrl;

  return actionUrl;
}

- (void)setActionUrl:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2080u;
  objc_storeStrong((id *)&self->_actionUrl, a3);
}

- (void)_readTransitPlaceCard
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 124) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceActionDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitPlaceCard_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasTransitPlaceCard
{
  return self->_transitPlaceCard != 0;
}

- (GEOTransitPlaceCard)transitPlaceCard
{
  -[GEOPlaceActionDetails _readTransitPlaceCard]((uint64_t)self);
  transitPlaceCard = self->_transitPlaceCard;

  return transitPlaceCard;
}

- (void)setTransitPlaceCard:(id)a3
{
  *(_WORD *)&self->_flags |= 0x3000u;
  objc_storeStrong((id *)&self->_transitPlaceCard, a3);
}

- (void)_readRichProviderId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 124) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceActionDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRichProviderId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRichProviderId
{
  return self->_richProviderId != 0;
}

- (NSString)richProviderId
{
  -[GEOPlaceActionDetails _readRichProviderId]((uint64_t)self);
  richProviderId = self->_richProviderId;

  return richProviderId;
}

- (void)setRichProviderId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2400u;
  objc_storeStrong((id *)&self->_richProviderId, a3);
}

- (void)_readDestinationApp
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 124) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceActionDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestinationApp_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasDestinationApp
{
  return self->_destinationApp != 0;
}

- (NSString)destinationApp
{
  -[GEOPlaceActionDetails _readDestinationApp]((uint64_t)self);
  destinationApp = self->_destinationApp;

  return destinationApp;
}

- (void)setDestinationApp:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2100u;
  objc_storeStrong((id *)&self->_destinationApp, a3);
}

- (void)_readShowcaseId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 124) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceActionDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShowcaseId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasShowcaseId
{
  return self->_showcaseId != 0;
}

- (NSString)showcaseId
{
  -[GEOPlaceActionDetails _readShowcaseId]((uint64_t)self);
  showcaseId = self->_showcaseId;

  return showcaseId;
}

- (void)setShowcaseId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2800u;
  objc_storeStrong((id *)&self->_showcaseId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPlaceActionDetails;
  v4 = [(GEOPlaceActionDetails *)&v8 description];
  uint64_t v5 = [(GEOPlaceActionDetails *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPlaceActionDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_48;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 124);
  if ((v5 & 2) != 0)
  {
    v15 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
    [v4 setObject:v15 forKey:@"businessID"];

    __int16 v5 = *(_WORD *)(a1 + 124);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 0x20) == 0) {
        goto LABEL_5;
      }
      goto LABEL_25;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_4;
  }
  uint64_t v16 = [NSNumber numberWithLongLong:*(void *)(a1 + 56)];
  [v4 setObject:v16 forKey:@"placeID"];

  __int16 v5 = *(_WORD *)(a1 + 124);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  id v17 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 116)];
  [v4 setObject:v17 forKey:@"localSearchProviderID"];

  __int16 v5 = *(_WORD *)(a1 + 124);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  id v18 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
  [v4 setObject:v18 forKey:@"searchResponseRelativeTimestamp"];

  __int16 v5 = *(_WORD *)(a1 + 124);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
LABEL_28:
    id v20 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
    [v4 setObject:v20 forKey:@"animationID"];

    if ((*(_WORD *)(a1 + 124) & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_27:
  id v19 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 120)];
  [v4 setObject:v19 forKey:@"resultIndex"];

  __int16 v5 = *(_WORD *)(a1 + 124);
  if (v5) {
    goto LABEL_28;
  }
LABEL_8:
  if ((v5 & 0x10) != 0)
  {
LABEL_9:
    objc_super v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 88)];
    [v4 setObject:v6 forKey:@"targetID"];
  }
LABEL_10:
  objc_super v7 = [(id)a1 photoId];
  if (v7)
  {
    if (a2) {
      objc_super v8 = @"photoId";
    }
    else {
      objc_super v8 = @"photo_id";
    }
    [v4 setObject:v7 forKey:v8];
  }

  v9 = [(id)a1 actionUrl];
  if (v9)
  {
    if (a2) {
      uint64_t v10 = @"actionUrl";
    }
    else {
      uint64_t v10 = @"action_url";
    }
    [v4 setObject:v9 forKey:v10];
  }

  v11 = [(id)a1 transitPlaceCard];
  uint64_t v12 = v11;
  if (v11)
  {
    if (a2)
    {
      v13 = [v11 jsonRepresentation];
      uint64_t v14 = @"transitPlaceCard";
    }
    else
    {
      v13 = [v11 dictionaryRepresentation];
      uint64_t v14 = @"transit_place_card";
    }
    [v4 setObject:v13 forKey:v14];
  }
  id v21 = [(id)a1 richProviderId];
  if (v21)
  {
    if (a2) {
      id v22 = @"richProviderId";
    }
    else {
      id v22 = @"rich_provider_id";
    }
    [v4 setObject:v21 forKey:v22];
  }

  v23 = [(id)a1 destinationApp];
  if (v23)
  {
    if (a2) {
      v24 = @"destinationApp";
    }
    else {
      v24 = @"destination_app";
    }
    [v4 setObject:v23 forKey:v24];
  }

  v25 = [(id)a1 showcaseId];
  if (v25)
  {
    if (a2) {
      uint64_t v26 = @"showcaseId";
    }
    else {
      uint64_t v26 = @"showcase_id";
    }
    [v4 setObject:v25 forKey:v26];
  }

LABEL_48:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPlaceActionDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPlaceActionDetails)initWithDictionary:(id)a3
{
  return (GEOPlaceActionDetails *)-[GEOPlaceActionDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"businessID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBusinessID:", objc_msgSend(v6, "unsignedLongLongValue"));
      }

      objc_super v7 = [v5 objectForKeyedSubscript:@"placeID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setPlaceID:", objc_msgSend(v7, "longLongValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"localSearchProviderID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLocalSearchProviderID:", objc_msgSend(v8, "intValue"));
      }

      v9 = [v5 objectForKeyedSubscript:@"searchResponseRelativeTimestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        objc_msgSend(a1, "setSearchResponseRelativeTimestamp:");
      }

      uint64_t v10 = [v5 objectForKeyedSubscript:@"resultIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setResultIndex:", objc_msgSend(v10, "intValue"));
      }

      v11 = [v5 objectForKeyedSubscript:@"animationID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAnimationID:", objc_msgSend(v11, "unsignedLongLongValue"));
      }

      uint64_t v12 = [v5 objectForKeyedSubscript:@"targetID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTargetID:", objc_msgSend(v12, "unsignedLongLongValue"));
      }

      if (a3) {
        v13 = @"photoId";
      }
      else {
        v13 = @"photo_id";
      }
      uint64_t v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = (void *)[v14 copy];
        [a1 setPhotoId:v15];
      }
      if (a3) {
        uint64_t v16 = @"actionUrl";
      }
      else {
        uint64_t v16 = @"action_url";
      }
      id v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = (void *)[v17 copy];
        [a1 setActionUrl:v18];
      }
      if (a3) {
        id v19 = @"transitPlaceCard";
      }
      else {
        id v19 = @"transit_place_card";
      }
      id v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = [GEOTransitPlaceCard alloc];
        if (a3) {
          uint64_t v22 = [(GEOTransitPlaceCard *)v21 initWithJSON:v20];
        }
        else {
          uint64_t v22 = [(GEOTransitPlaceCard *)v21 initWithDictionary:v20];
        }
        v23 = (void *)v22;
        [a1 setTransitPlaceCard:v22];
      }
      if (a3) {
        v24 = @"richProviderId";
      }
      else {
        v24 = @"rich_provider_id";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v26 = (void *)[v25 copy];
        [a1 setRichProviderId:v26];
      }
      if (a3) {
        v27 = @"destinationApp";
      }
      else {
        v27 = @"destination_app";
      }
      v28 = [v5 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v29 = (void *)[v28 copy];
        [a1 setDestinationApp:v29];
      }
      if (a3) {
        v30 = @"showcaseId";
      }
      else {
        v30 = @"showcase_id";
      }
      v31 = [v5 objectForKeyedSubscript:v30];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v32 = (void *)[v31 copy];
        [a1 setShowcaseId:v32];
      }
    }
  }

  return a1;
}

- (GEOPlaceActionDetails)initWithJSON:(id)a3
{
  return (GEOPlaceActionDetails *)-[GEOPlaceActionDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_842;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_843;
    }
    GEOPlaceActionDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOTransitPlaceCard *)self->_transitPlaceCard readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPlaceActionDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceActionDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPlaceActionDetailsIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
    goto LABEL_31;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPlaceActionDetails *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 0x20) == 0) {
        goto LABEL_6;
      }
      goto LABEL_25;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_8:
    if ((flags & 1) == 0) {
      goto LABEL_9;
    }
LABEL_28:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if (flags) {
    goto LABEL_28;
  }
LABEL_9:
  if ((flags & 0x10) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint64Field();
LABEL_11:
  if (self->_photoId) {
    PBDataWriterWriteStringField();
  }
  if (self->_actionUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_transitPlaceCard) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_richProviderId) {
    PBDataWriterWriteStringField();
  }
  if (self->_destinationApp) {
    PBDataWriterWriteStringField();
  }
  if (self->_showcaseId) {
    PBDataWriterWriteStringField();
  }
LABEL_31:
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOPlaceActionDetails *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 26) = self->_readerMarkPos;
  *((_DWORD *)v6 + 27) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v6[4] = self->_businessID;
    *((_WORD *)v6 + 62) |= 2u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v6[7] = self->_placeID;
  *((_WORD *)v6 + 62) |= 4u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v6 + 29) = self->_localSearchProviderID;
  *((_WORD *)v6 + 62) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  v6[9] = *(id *)&self->_searchResponseRelativeTimestamp;
  *((_WORD *)v6 + 62) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v6 + 30) = self->_resultIndex;
  *((_WORD *)v6 + 62) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_29:
  v6[3] = self->_animationID;
  *((_WORD *)v6 + 62) |= 1u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_8:
    v6[11] = self->_targetID;
    *((_WORD *)v6 + 62) |= 0x10u;
  }
LABEL_9:
  if (self->_photoId)
  {
    objc_msgSend(v6, "setPhotoId:");
    v4 = v6;
  }
  if (self->_actionUrl)
  {
    objc_msgSend(v6, "setActionUrl:");
    v4 = v6;
  }
  if (self->_transitPlaceCard)
  {
    objc_msgSend(v6, "setTransitPlaceCard:");
    v4 = v6;
  }
  if (self->_richProviderId)
  {
    objc_msgSend(v6, "setRichProviderId:");
    v4 = v6;
  }
  if (self->_destinationApp)
  {
    objc_msgSend(v6, "setDestinationApp:");
    v4 = v6;
  }
  if (self->_showcaseId)
  {
    objc_msgSend(v6, "setShowcaseId:");
    v4 = v6;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  [(GEOPlaceActionDetails *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 62);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_businessID != *((void *)v4 + 4)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 2) != 0)
  {
LABEL_49:
    char v13 = 0;
    goto LABEL_50;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_placeID != *((void *)v4 + 7)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_localSearchProviderID != *((_DWORD *)v4 + 29)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_searchResponseRelativeTimestamp != *((double *)v4 + 9)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_resultIndex != *((_DWORD *)v4 + 30)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_49;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_animationID != *((void *)v4 + 3)) {
      goto LABEL_49;
    }
  }
  else if (v6)
  {
    goto LABEL_49;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_targetID != *((void *)v4 + 11)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  photoId = self->_photoId;
  if ((unint64_t)photoId | *((void *)v4 + 6) && !-[NSString isEqual:](photoId, "isEqual:")) {
    goto LABEL_49;
  }
  actionUrl = self->_actionUrl;
  if ((unint64_t)actionUrl | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](actionUrl, "isEqual:")) {
      goto LABEL_49;
    }
  }
  transitPlaceCard = self->_transitPlaceCard;
  if ((unint64_t)transitPlaceCard | *((void *)v4 + 12))
  {
    if (!-[GEOTransitPlaceCard isEqual:](transitPlaceCard, "isEqual:")) {
      goto LABEL_49;
    }
  }
  richProviderId = self->_richProviderId;
  if ((unint64_t)richProviderId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](richProviderId, "isEqual:")) {
      goto LABEL_49;
    }
  }
  destinationApp = self->_destinationApp;
  if ((unint64_t)destinationApp | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](destinationApp, "isEqual:")) {
      goto LABEL_49;
    }
  }
  showcaseId = self->_showcaseId;
  if ((unint64_t)showcaseId | *((void *)v4 + 10)) {
    char v13 = -[NSString isEqual:](showcaseId, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_50:

  return v13;
}

- (unint64_t)hash
{
  [(GEOPlaceActionDetails *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    unint64_t v4 = 2654435761u * self->_businessID;
    if ((flags & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_placeID;
      if ((flags & 0x20) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v6 = 0;
      if ((flags & 8) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((flags & 0x20) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_localSearchProviderID;
  if ((flags & 8) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double searchResponseRelativeTimestamp = self->_searchResponseRelativeTimestamp;
  double v8 = -searchResponseRelativeTimestamp;
  if (searchResponseRelativeTimestamp >= 0.0) {
    double v8 = self->_searchResponseRelativeTimestamp;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_15:
  if ((flags & 0x40) == 0)
  {
    uint64_t v12 = 0;
    if (flags) {
      goto LABEL_17;
    }
LABEL_20:
    unint64_t v13 = 0;
    if ((flags & 0x10) != 0) {
      goto LABEL_18;
    }
LABEL_21:
    unint64_t v14 = 0;
    goto LABEL_22;
  }
  uint64_t v12 = 2654435761 * self->_resultIndex;
  if ((flags & 1) == 0) {
    goto LABEL_20;
  }
LABEL_17:
  unint64_t v13 = 2654435761u * self->_animationID;
  if ((flags & 0x10) == 0) {
    goto LABEL_21;
  }
LABEL_18:
  unint64_t v14 = 2654435761u * self->_targetID;
LABEL_22:
  NSUInteger v15 = v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ [(NSString *)self->_photoId hash];
  NSUInteger v16 = [(NSString *)self->_actionUrl hash];
  unint64_t v17 = v15 ^ v16 ^ [(GEOTransitPlaceCard *)self->_transitPlaceCard hash];
  NSUInteger v18 = [(NSString *)self->_richProviderId hash];
  NSUInteger v19 = v18 ^ [(NSString *)self->_destinationApp hash];
  return v17 ^ v19 ^ [(NSString *)self->_showcaseId hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  unint64_t v4 = v8;
  __int16 v5 = *((_WORD *)v8 + 62);
  if ((v5 & 2) != 0)
  {
    self->_businessID = *((void *)v8 + 4);
    *(_WORD *)&self->_flags |= 2u;
    __int16 v5 = *((_WORD *)v8 + 62);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_placeID = *((void *)v8 + 7);
  *(_WORD *)&self->_flags |= 4u;
  __int16 v5 = *((_WORD *)v8 + 62);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_localSearchProviderID = *((_DWORD *)v8 + 29);
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v5 = *((_WORD *)v8 + 62);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_double searchResponseRelativeTimestamp = *((double *)v8 + 9);
  *(_WORD *)&self->_flags |= 8u;
  __int16 v5 = *((_WORD *)v8 + 62);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_resultIndex = *((_DWORD *)v8 + 30);
  *(_WORD *)&self->_flags |= 0x40u;
  __int16 v5 = *((_WORD *)v8 + 62);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_21:
  self->_animationID = *((void *)v8 + 3);
  *(_WORD *)&self->_flags |= 1u;
  if ((*((_WORD *)v8 + 62) & 0x10) != 0)
  {
LABEL_8:
    self->_targetID = *((void *)v8 + 11);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_9:
  if (*((void *)v8 + 6))
  {
    -[GEOPlaceActionDetails setPhotoId:](self, "setPhotoId:");
    unint64_t v4 = v8;
  }
  if (v4[2])
  {
    -[GEOPlaceActionDetails setActionUrl:](self, "setActionUrl:");
    unint64_t v4 = v8;
  }
  transitPlaceCard = self->_transitPlaceCard;
  uint64_t v7 = v4[12];
  if (transitPlaceCard)
  {
    if (!v7) {
      goto LABEL_26;
    }
    -[GEOTransitPlaceCard mergeFrom:](transitPlaceCard, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_26;
    }
    -[GEOPlaceActionDetails setTransitPlaceCard:](self, "setTransitPlaceCard:");
  }
  unint64_t v4 = v8;
LABEL_26:
  if (v4[8])
  {
    -[GEOPlaceActionDetails setRichProviderId:](self, "setRichProviderId:");
    unint64_t v4 = v8;
  }
  if (v4[5])
  {
    -[GEOPlaceActionDetails setDestinationApp:](self, "setDestinationApp:");
    unint64_t v4 = v8;
  }
  if (v4[10])
  {
    -[GEOPlaceActionDetails setShowcaseId:](self, "setShowcaseId:");
    unint64_t v4 = v8;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitPlaceCard, 0);
  objc_storeStrong((id *)&self->_showcaseId, 0);
  objc_storeStrong((id *)&self->_richProviderId, 0);
  objc_storeStrong((id *)&self->_photoId, 0);
  objc_storeStrong((id *)&self->_destinationApp, 0);
  objc_storeStrong((id *)&self->_actionUrl, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end