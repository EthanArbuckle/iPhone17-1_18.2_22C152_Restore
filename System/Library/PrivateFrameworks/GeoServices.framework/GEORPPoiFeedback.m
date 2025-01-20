@interface GEORPPoiFeedback
+ (BOOL)isValid:(id)a3;
- (BOOL)addOtherPoi;
- (BOOL)hasAddOtherPoi;
- (BOOL)hasCorrectionType;
- (BOOL)hasCorrections;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasPlace;
- (BOOL)hasPlaceRequest;
- (BOOL)hasPoiCuratedCollectionContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlace)place;
- (GEOPDPlaceRequest)placeRequest;
- (GEORPCuratedCollectionContext)poiCuratedCollectionContext;
- (GEORPPoiCorrections)corrections;
- (GEORPPoiFeedback)init;
- (GEORPPoiFeedback)initWithData:(id)a3;
- (GEORPPoiFeedback)initWithDictionary:(id)a3;
- (GEORPPoiFeedback)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)correctionTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsCorrectionType:(id)a3;
- (int)correctionType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCorrections;
- (void)_readPlace;
- (void)_readPlaceRequest;
- (void)_readPoiCuratedCollectionContext;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddOtherPoi:(BOOL)a3;
- (void)setCorrectionType:(int)a3;
- (void)setCorrections:(id)a3;
- (void)setHasAddOtherPoi:(BOOL)a3;
- (void)setHasCorrectionType:(BOOL)a3;
- (void)setPlace:(id)a3;
- (void)setPlaceRequest:(id)a3;
- (void)setPoiCuratedCollectionContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPoiFeedback

- (void)setAddOtherPoi:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_addOtherPoi = a3;
}

- (GEORPPoiFeedback)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPPoiFeedback;
  v2 = [(GEORPPoiFeedback *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPoiFeedback)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPPoiFeedback;
  v3 = [(GEORPPoiFeedback *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)correctionType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_correctionType;
  }
  else {
    return 0;
  }
}

- (void)setCorrectionType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_correctionType = a3;
}

- (void)setHasCorrectionType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasCorrectionType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)correctionTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53DBD10[a3];
  }

  return v3;
}

- (int)StringAsCorrectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"POI_CORRECTION_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"POI_CORRECTION_TYPE_ADD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"POI_CORRECTION_TYPE_EDIT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"POI_CORRECTION_TYPE_OTHER"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readCorrections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrections_tags_3155);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasCorrections
{
  return self->_corrections != 0;
}

- (GEORPPoiCorrections)corrections
{
  -[GEORPPoiFeedback _readCorrections]((uint64_t)self);
  corrections = self->_corrections;

  return corrections;
}

- (void)setCorrections:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_corrections, a3);
}

- (void)_readPlace
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlace_tags_3156);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlace
{
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEORPPoiFeedback _readPlace]((uint64_t)self);
  place = self->_place;

  return place;
}

- (void)setPlace:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (void)_readPlaceRequest
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceRequest_tags_3157);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlaceRequest
{
  return self->_placeRequest != 0;
}

- (GEOPDPlaceRequest)placeRequest
{
  -[GEORPPoiFeedback _readPlaceRequest]((uint64_t)self);
  placeRequest = self->_placeRequest;

  return placeRequest;
}

- (void)setPlaceRequest:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_placeRequest, a3);
}

- (BOOL)addOtherPoi
{
  return self->_addOtherPoi;
}

- (void)setHasAddOtherPoi:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAddOtherPoi
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readPoiCuratedCollectionContext
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiCuratedCollectionContext_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPoiCuratedCollectionContext
{
  return self->_poiCuratedCollectionContext != 0;
}

- (GEORPCuratedCollectionContext)poiCuratedCollectionContext
{
  -[GEORPPoiFeedback _readPoiCuratedCollectionContext]((uint64_t)self);
  poiCuratedCollectionContext = self->_poiCuratedCollectionContext;

  return poiCuratedCollectionContext;
}

- (void)setPoiCuratedCollectionContext:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_poiCuratedCollectionContext, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPoiFeedback;
  int v4 = [(GEORPPoiFeedback *)&v8 description];
  v5 = [(GEORPPoiFeedback *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPoiFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 76))
    {
      uint64_t v5 = *(int *)(a1 + 68);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53DBD10[v5];
      }
      if (a2) {
        objc_super v7 = @"correctionType";
      }
      else {
        objc_super v7 = @"correction_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 corrections];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"corrections"];
    }
    v11 = [(id)a1 place];
    v12 = v11;
    if (v11)
    {
      if (a2) {
        [v11 jsonRepresentation];
      }
      else {
      v13 = [v11 dictionaryRepresentation];
      }
      [v4 setObject:v13 forKey:@"place"];
    }
    v14 = [(id)a1 placeRequest];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"placeRequest";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"place_request";
      }
      [v4 setObject:v16 forKey:v17];
    }
    if ((*(unsigned char *)(a1 + 76) & 2) != 0)
    {
      v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
      if (a2) {
        v19 = @"addOtherPoi";
      }
      else {
        v19 = @"add_other_poi";
      }
      [v4 setObject:v18 forKey:v19];
    }
    v20 = [(id)a1 poiCuratedCollectionContext];
    v21 = v20;
    if (v20)
    {
      if (a2)
      {
        v22 = [v20 jsonRepresentation];
        v23 = @"poiCuratedCollectionContext";
      }
      else
      {
        v22 = [v20 dictionaryRepresentation];
        v23 = @"poi_curated_collection_context";
      }
      [v4 setObject:v22 forKey:v23];
    }
    v24 = *(void **)(a1 + 16);
    if (v24)
    {
      v25 = [v24 dictionaryRepresentation];
      v26 = v25;
      if (a2)
      {
        v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __46__GEORPPoiFeedback__dictionaryRepresentation___block_invoke;
        v31[3] = &unk_1E53D8860;
        id v28 = v27;
        id v32 = v28;
        [v26 enumerateKeysAndObjectsUsingBlock:v31];
        id v29 = v28;

        v26 = v29;
      }
      [v4 setObject:v26 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPPoiFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEORPPoiFeedback__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPPoiFeedback)initWithDictionary:(id)a3
{
  return (GEORPPoiFeedback *)-[GEORPPoiFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_52;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_52;
  }
  if (a3) {
    objc_super v6 = @"correctionType";
  }
  else {
    objc_super v6 = @"correction_type";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"POI_CORRECTION_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"POI_CORRECTION_TYPE_ADD"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"POI_CORRECTION_TYPE_EDIT"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"POI_CORRECTION_TYPE_OTHER"])
    {
      uint64_t v9 = 3;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_19:
    [a1 setCorrectionType:v9];
  }

  id v10 = [v5 objectForKeyedSubscript:@"corrections"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [GEORPPoiCorrections alloc];
    if (a3) {
      uint64_t v12 = [(GEORPPoiCorrections *)v11 initWithJSON:v10];
    }
    else {
      uint64_t v12 = [(GEORPPoiCorrections *)v11 initWithDictionary:v10];
    }
    v13 = (void *)v12;
    [a1 setCorrections:v12];
  }
  v14 = [v5 objectForKeyedSubscript:@"place"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [GEOPDPlace alloc];
    if (a3) {
      uint64_t v16 = [(GEOPDPlace *)v15 initWithJSON:v14];
    }
    else {
      uint64_t v16 = [(GEOPDPlace *)v15 initWithDictionary:v14];
    }
    v17 = (void *)v16;
    [a1 setPlace:v16];
  }
  if (a3) {
    v18 = @"placeRequest";
  }
  else {
    v18 = @"place_request";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = [GEOPDPlaceRequest alloc];
    if (a3) {
      uint64_t v21 = [(GEOPDPlaceRequest *)v20 initWithJSON:v19];
    }
    else {
      uint64_t v21 = [(GEOPDPlaceRequest *)v20 initWithDictionary:v19];
    }
    v22 = (void *)v21;
    [a1 setPlaceRequest:v21];
  }
  if (a3) {
    v23 = @"addOtherPoi";
  }
  else {
    v23 = @"add_other_poi";
  }
  v24 = [v5 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAddOtherPoi:", objc_msgSend(v24, "BOOLValue"));
  }

  if (a3) {
    v25 = @"poiCuratedCollectionContext";
  }
  else {
    v25 = @"poi_curated_collection_context";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = [GEORPCuratedCollectionContext alloc];
    if (a3) {
      uint64_t v28 = [(GEORPCuratedCollectionContext *)v27 initWithJSON:v26];
    }
    else {
      uint64_t v28 = [(GEORPCuratedCollectionContext *)v27 initWithDictionary:v26];
    }
    id v29 = (void *)v28;
    [a1 setPoiCuratedCollectionContext:v28];
  }
LABEL_52:

  return a1;
}

- (GEORPPoiFeedback)initWithJSON:(id)a3
{
  return (GEORPPoiFeedback *)-[GEORPPoiFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_3171;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_3172;
    }
    GEORPPoiFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPPoiFeedbackCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPoiFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPoiFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPPoiFeedbackIsDirty((uint64_t)self))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPPoiFeedback *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_corrections)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_place)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_placeRequest)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v8;
    }
    if (self->_poiCuratedCollectionContext)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPPoiFeedback _readCorrections]((uint64_t)self);
  if ([(GEORPPoiCorrections *)self->_corrections hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPPoiFeedback _readPlace]((uint64_t)self);
  if ([(GEOPDPlace *)self->_place hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPPoiFeedback _readPlaceRequest]((uint64_t)self);
  placeRequest = self->_placeRequest;

  return [(GEOPDPlaceRequest *)placeRequest hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPPoiFeedback *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 17) = self->_correctionType;
    *((unsigned char *)v5 + 76) |= 1u;
  }
  if (self->_corrections)
  {
    objc_msgSend(v5, "setCorrections:");
    int v4 = v5;
  }
  if (self->_place)
  {
    objc_msgSend(v5, "setPlace:");
    int v4 = v5;
  }
  if (self->_placeRequest)
  {
    objc_msgSend(v5, "setPlaceRequest:");
    int v4 = v5;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((unsigned char *)v4 + 72) = self->_addOtherPoi;
    *((unsigned char *)v4 + 76) |= 2u;
  }
  if (self->_poiCuratedCollectionContext)
  {
    objc_msgSend(v5, "setPoiCuratedCollectionContext:");
    int v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPPoiFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPPoiFeedback *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_correctionType;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  id v9 = [(GEORPPoiCorrections *)self->_corrections copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOPDPlace *)self->_place copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  id v13 = [(GEOPDPlaceRequest *)self->_placeRequest copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 72) = self->_addOtherPoi;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  id v15 = [(GEORPCuratedCollectionContext *)self->_poiCuratedCollectionContext copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  [(GEORPPoiFeedback *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_correctionType != *((_DWORD *)v4 + 17)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_17;
  }
  corrections = self->_corrections;
  if ((unint64_t)corrections | *((void *)v4 + 3) && !-[GEORPPoiCorrections isEqual:](corrections, "isEqual:")) {
    goto LABEL_17;
  }
  place = self->_place;
  if ((unint64_t)place | *((void *)v4 + 5))
  {
    if (!-[GEOPDPlace isEqual:](place, "isEqual:")) {
      goto LABEL_17;
    }
  }
  placeRequest = self->_placeRequest;
  if ((unint64_t)placeRequest | *((void *)v4 + 4))
  {
    if (!-[GEOPDPlaceRequest isEqual:](placeRequest, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0) {
      goto LABEL_23;
    }
LABEL_17:
    char v8 = 0;
    goto LABEL_18;
  }
  if ((*((unsigned char *)v4 + 76) & 2) == 0) {
    goto LABEL_17;
  }
  if (!self->_addOtherPoi)
  {
    if (!*((unsigned char *)v4 + 72)) {
      goto LABEL_23;
    }
    goto LABEL_17;
  }
  if (!*((unsigned char *)v4 + 72)) {
    goto LABEL_17;
  }
LABEL_23:
  poiCuratedCollectionContext = self->_poiCuratedCollectionContext;
  if ((unint64_t)poiCuratedCollectionContext | *((void *)v4 + 6)) {
    char v8 = -[GEORPCuratedCollectionContext isEqual:](poiCuratedCollectionContext, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  [(GEORPPoiFeedback *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_correctionType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEORPPoiCorrections *)self->_corrections hash];
  unint64_t v5 = [(GEOPDPlace *)self->_place hash];
  unint64_t v6 = [(GEOPDPlaceRequest *)self->_placeRequest hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_addOtherPoi;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(GEORPCuratedCollectionContext *)self->_poiCuratedCollectionContext hash];
}

- (void)mergeFrom:(id)a3
{
  id v13 = (int *)a3;
  [v13 readAll:0];
  unint64_t v4 = v13;
  if (v13[19])
  {
    self->_correctionType = v13[17];
    *(unsigned char *)&self->_flags |= 1u;
  }
  corrections = self->_corrections;
  uint64_t v6 = *((void *)v13 + 3);
  if (corrections)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORPPoiCorrections mergeFrom:](corrections, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORPPoiFeedback setCorrections:](self, "setCorrections:");
  }
  unint64_t v4 = v13;
LABEL_9:
  place = self->_place;
  uint64_t v8 = *((void *)v4 + 5);
  if (place)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEORPPoiFeedback setPlace:](self, "setPlace:");
  }
  unint64_t v4 = v13;
LABEL_15:
  placeRequest = self->_placeRequest;
  uint64_t v10 = *((void *)v4 + 4);
  if (placeRequest)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOPDPlaceRequest mergeFrom:](placeRequest, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEORPPoiFeedback setPlaceRequest:](self, "setPlaceRequest:");
  }
  unint64_t v4 = v13;
LABEL_21:
  if ((v4[19] & 2) != 0)
  {
    self->_addOtherPoi = *((unsigned char *)v4 + 72);
    *(unsigned char *)&self->_flags |= 2u;
  }
  poiCuratedCollectionContext = self->_poiCuratedCollectionContext;
  uint64_t v12 = *((void *)v4 + 6);
  if (poiCuratedCollectionContext)
  {
    if (!v12) {
      goto LABEL_29;
    }
    -[GEORPCuratedCollectionContext mergeFrom:](poiCuratedCollectionContext, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_29;
    }
    -[GEORPPoiFeedback setPoiCuratedCollectionContext:](self, "setPoiCuratedCollectionContext:");
  }
  unint64_t v4 = v13;
LABEL_29:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPPoiFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3176);
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
  *(unsigned char *)&self->_flags |= 0x84u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPPoiFeedback *)self readAll:0];
    [(GEORPPoiCorrections *)self->_corrections clearUnknownFields:1];
    [(GEOPDPlace *)self->_place clearUnknownFields:1];
    [(GEOPDPlaceRequest *)self->_placeRequest clearUnknownFields:1];
    poiCuratedCollectionContext = self->_poiCuratedCollectionContext;
    [(GEORPCuratedCollectionContext *)poiCuratedCollectionContext clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiCuratedCollectionContext, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_placeRequest, 0);
  objc_storeStrong((id *)&self->_corrections, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end