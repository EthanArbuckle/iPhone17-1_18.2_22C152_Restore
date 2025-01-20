@interface GEOPDMapsResult
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBatchReverseGeocode;
- (BOOL)hasCollection;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasPlace;
- (BOOL)hasPlaceQuestionnaire;
- (BOOL)hasPublisher;
- (BOOL)hasResultType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDBatchReverseGeocodeResult)batchReverseGeocode;
- (GEOPDCollectionResult)collection;
- (GEOPDMapsResult)init;
- (GEOPDMapsResult)initWithData:(id)a3;
- (GEOPDMapsResult)initWithDictionary:(id)a3;
- (GEOPDMapsResult)initWithJSON:(id)a3;
- (GEOPDPlace)place;
- (GEOPDPlaceQuestionnaireResult)placeQuestionnaire;
- (GEOPDPublisherResult)publisher;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)resultTypeAsString:(int)a3;
- (int)StringAsResultType:(id)a3;
- (int)resultType;
- (unint64_t)hash;
- (void)_initWithDictionary:(uint64_t)a3 isJSON:;
- (void)_readBatchReverseGeocode;
- (void)_readCollection;
- (void)_readPlace;
- (void)_readPlaceQuestionnaire;
- (void)_readPublisher;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBatchReverseGeocode:(id)a3;
- (void)setCollection:(id)a3;
- (void)setHasResultType:(BOOL)a3;
- (void)setPlace:(id)a3;
- (void)setPlaceQuestionnaire:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setResultType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDMapsResult

- (BOOL)hasPlace
{
  return self->_place != 0;
}

- (int)resultType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_resultType;
  }
  else {
    return 0;
  }
}

- (GEOPDPlace)place
{
  -[GEOPDMapsResult _readPlace]((uint64_t)self);
  place = self->_place;

  return place;
}

- (void)_readPlace
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlace_tags_6229);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_placeQuestionnaire, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocode, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)setResultType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_resultType = a3;
}

- (void)setPlace:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDMapsResultIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDMapsResult *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_place)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_collection)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_publisher)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_placeQuestionnaire)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_batchReverseGeocode)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_6248;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_6249;
    }
    GEOPDMapsResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDMapsResultCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOPDMapsResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDMapsResult;
  v2 = [(GEOPDMapsResult *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)hasCollection
{
  return self->_collection != 0;
}

- (GEOPDCollectionResult)collection
{
  -[GEOPDMapsResult _readCollection]((uint64_t)self);
  collection = self->_collection;

  return collection;
}

- (void)_readCollection
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollection_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (GEOPDMapsResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDMapsResult;
  id v3 = [(GEOPDMapsResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)setHasResultType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasResultType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)resultTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E3B48[a3];
  }

  return v3;
}

- (int)StringAsResultType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_PLACE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_COLLECTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_PUBLISHER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_PLACE_QUESTIONNAIRE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULT_TYPE_BATCH_REVERSE_GEOCODE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setCollection:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_collection, a3);
}

- (void)_readPublisher
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisher_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPublisher
{
  return self->_publisher != 0;
}

- (GEOPDPublisherResult)publisher
{
  -[GEOPDMapsResult _readPublisher]((uint64_t)self);
  publisher = self->_publisher;

  return publisher;
}

- (void)setPublisher:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (void)_readPlaceQuestionnaire
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceQuestionnaire_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPlaceQuestionnaire
{
  return self->_placeQuestionnaire != 0;
}

- (GEOPDPlaceQuestionnaireResult)placeQuestionnaire
{
  -[GEOPDMapsResult _readPlaceQuestionnaire]((uint64_t)self);
  placeQuestionnaire = self->_placeQuestionnaire;

  return placeQuestionnaire;
}

- (void)setPlaceQuestionnaire:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_placeQuestionnaire, a3);
}

- (void)_readBatchReverseGeocode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchReverseGeocode_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasBatchReverseGeocode
{
  return self->_batchReverseGeocode != 0;
}

- (GEOPDBatchReverseGeocodeResult)batchReverseGeocode
{
  -[GEOPDMapsResult _readBatchReverseGeocode]((uint64_t)self);
  batchReverseGeocode = self->_batchReverseGeocode;

  return batchReverseGeocode;
}

- (void)setBatchReverseGeocode:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_batchReverseGeocode, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDMapsResult;
  int v4 = [(GEOPDMapsResult *)&v8 description];
  id v5 = [(GEOPDMapsResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMapsResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v5 = *(int *)(a1 + 76);
      if (v5 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E3B48[v5];
      }
      if (a2) {
        objc_super v7 = @"resultType";
      }
      else {
        objc_super v7 = @"result_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 place];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"place"];
    }
    v11 = [(id)a1 collection];
    v12 = v11;
    if (v11)
    {
      if (a2) {
        [v11 jsonRepresentation];
      }
      else {
      v13 = [v11 dictionaryRepresentation];
      }
      [v4 setObject:v13 forKey:@"collection"];
    }
    v14 = [(id)a1 publisher];
    v15 = v14;
    if (v14)
    {
      if (a2) {
        [v14 jsonRepresentation];
      }
      else {
      v16 = [v14 dictionaryRepresentation];
      }
      [v4 setObject:v16 forKey:@"publisher"];
    }
    v17 = [(id)a1 placeQuestionnaire];
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"placeQuestionnaire";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"place_questionnaire";
      }
      [v4 setObject:v19 forKey:v20];
    }
    v21 = [(id)a1 batchReverseGeocode];
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"batchReverseGeocode";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"batch_reverse_geocode";
      }
      [v4 setObject:v23 forKey:v24];
    }
    v25 = *(void **)(a1 + 16);
    if (v25)
    {
      v26 = [v25 dictionaryRepresentation];
      v27 = v26;
      if (a2)
      {
        v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __45__GEOPDMapsResult__dictionaryRepresentation___block_invoke;
        v32[3] = &unk_1E53D8860;
        id v29 = v28;
        id v33 = v29;
        [v27 enumerateKeysAndObjectsUsingBlock:v32];
        id v30 = v29;

        v27 = v30;
      }
      [v4 setObject:v27 forKey:@"Unknown Fields"];
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
  return -[GEOPDMapsResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOPDMapsResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDMapsResult)initWithDictionary:(id)a3
{
  return (GEOPDMapsResult *)-[GEOPDMapsResult _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(uint64_t)a3 isJSON:
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    objc_super v6 = 0;
    goto LABEL_174;
  }
  objc_super v6 = (void *)[a1 init];
  if (v6)
  {
    if (a3) {
      objc_super v7 = @"resultType";
    }
    else {
      objc_super v7 = @"result_type";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      if ([v9 isEqualToString:@"MAPS_RESULT_TYPE_UNKNOWN"])
      {
        uint64_t v10 = 0;
      }
      else if ([v9 isEqualToString:@"MAPS_RESULT_TYPE_PLACE"])
      {
        uint64_t v10 = 1;
      }
      else if ([v9 isEqualToString:@"MAPS_RESULT_TYPE_COLLECTION"])
      {
        uint64_t v10 = 2;
      }
      else if ([v9 isEqualToString:@"MAPS_RESULT_TYPE_PUBLISHER"])
      {
        uint64_t v10 = 3;
      }
      else if ([v9 isEqualToString:@"MAPS_RESULT_TYPE_PLACE_QUESTIONNAIRE"])
      {
        uint64_t v10 = 4;
      }
      else if ([v9 isEqualToString:@"MAPS_RESULT_TYPE_BATCH_REVERSE_GEOCODE"])
      {
        uint64_t v10 = 5;
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
        goto LABEL_24;
      }
      uint64_t v10 = [v8 intValue];
    }
    [v6 setResultType:v10];
LABEL_24:

    v11 = [v5 objectForKeyedSubscript:@"place"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [GEOPDPlace alloc];
      if (a3) {
        uint64_t v13 = [(GEOPDPlace *)v12 initWithJSON:v11];
      }
      else {
        uint64_t v13 = [(GEOPDPlace *)v12 initWithDictionary:v11];
      }
      v14 = (void *)v13;
      [v6 setPlace:v13];
    }
    v15 = [v5 objectForKeyedSubscript:@"collection"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_82:

      v36 = [v5 objectForKeyedSubscript:@"publisher"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_135:

        if (a3) {
          v57 = @"placeQuestionnaire";
        }
        else {
          v57 = @"place_questionnaire";
        }
        v58 = [v5 objectForKeyedSubscript:v57];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v59 = [GEOPDPlaceQuestionnaireResult alloc];
          if (v59) {
            v60 = (void *)-[GEOPDPlaceQuestionnaireResult _initWithDictionary:isJSON:](v59, v58, a3);
          }
          else {
            v60 = 0;
          }
          [v6 setPlaceQuestionnaire:v60];
        }
        if (a3) {
          v61 = @"batchReverseGeocode";
        }
        else {
          v61 = @"batch_reverse_geocode";
        }
        v62 = [v5 objectForKeyedSubscript:v61];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v63 = [GEOPDBatchReverseGeocodeResult alloc];
          if (v63)
          {
            id v64 = v62;
            v63 = [(GEOPDBatchReverseGeocodeResult *)v63 init];
            if (v63)
            {
              v65 = [v64 objectForKeyedSubscript:@"place"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v66 = [GEOPDPlace alloc];
                if (a3) {
                  v67 = [(GEOPDPlace *)v66 initWithJSON:v65];
                }
                else {
                  v67 = [(GEOPDPlace *)v66 initWithDictionary:v65];
                }
                v68 = v67;
                -[GEOPDBatchReverseGeocodeResult setPlace:]((uint64_t)v63, v67);
              }
              if (a3) {
                v69 = @"additionalPlace";
              }
              else {
                v69 = @"additional_place";
              }
              v70 = [v64 objectForKeyedSubscript:v69];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v84 = v6;
                id v87 = v5;
                long long v90 = 0u;
                long long v91 = 0u;
                long long v88 = 0u;
                long long v89 = 0u;
                v81 = v70;
                id v71 = v70;
                uint64_t v72 = [v71 countByEnumeratingWithState:&v88 objects:v92 count:16];
                if (v72)
                {
                  uint64_t v73 = v72;
                  uint64_t v74 = *(void *)v89;
                  do
                  {
                    for (uint64_t i = 0; i != v73; ++i)
                    {
                      if (*(void *)v89 != v74) {
                        objc_enumerationMutation(v71);
                      }
                      uint64_t v76 = *(void *)(*((void *)&v88 + 1) + 8 * i);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v77 = [GEOPDPlace alloc];
                        if (a3) {
                          v78 = [(GEOPDPlace *)v77 initWithJSON:v76];
                        }
                        else {
                          v78 = [(GEOPDPlace *)v77 initWithDictionary:v76];
                        }
                        v79 = v78;
                        -[GEOPDBatchReverseGeocodeResult addAdditionalPlace:]((uint64_t)v63, v78);
                      }
                    }
                    uint64_t v73 = [v71 countByEnumeratingWithState:&v88 objects:v92 count:16];
                  }
                  while (v73);
                }

                objc_super v6 = v84;
                id v5 = v87;
                v70 = v81;
              }
            }
          }
          objc_msgSend(v6, "setBatchReverseGeocode:", v63, v81);
        }
        goto LABEL_174;
      }
      v37 = [GEOPDPublisherResult alloc];
      if (!v37)
      {
LABEL_134:
        objc_msgSend(v6, "setPublisher:", v37, v81);

        goto LABEL_135;
      }
      id v38 = v36;
      v37 = [(GEOPDPublisherResult *)v37 init];
      if (!v37)
      {
LABEL_133:

        goto LABEL_134;
      }
      if (a3) {
        v39 = @"publisherId";
      }
      else {
        v39 = @"publisher_id";
      }
      v40 = [v38 objectForKeyedSubscript:v39];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v41 = [GEOPDMapsIdentifier alloc];
        if (a3) {
          v42 = [(GEOPDMapsIdentifier *)v41 initWithJSON:v40];
        }
        else {
          v42 = [(GEOPDMapsIdentifier *)v41 initWithDictionary:v40];
        }
        v43 = v42;
        -[GEOPDPublisherResult setPublisherId:]((uint64_t)v37, v42);
      }
      v44 = [v38 objectForKeyedSubscript:@"status"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v45 = v44;
        if ([v45 isEqualToString:@"STATUS_SUCCESS"])
        {
          int v46 = 0;
        }
        else if ([v45 isEqualToString:@"STATUS_FAILED"])
        {
          int v46 = 1;
        }
        else if ([v45 isEqualToString:@"STATUS_INCOMPLETE"])
        {
          int v46 = 2;
        }
        else if ([v45 isEqualToString:@"INVALID_REQUEST"])
        {
          int v46 = 5;
        }
        else if ([v45 isEqualToString:@"FAILED_NO_RESULT"])
        {
          int v46 = 20;
        }
        else if ([v45 isEqualToString:@"NEEDS_REFINEMENT"])
        {
          int v46 = 30;
        }
        else if ([v45 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
        {
          int v46 = 40;
        }
        else if ([v45 isEqualToString:@"STATUS_DEDUPED"])
        {
          int v46 = 50;
        }
        else if ([v45 isEqualToString:@"VERSION_MISMATCH"])
        {
          int v46 = 60;
        }
        else
        {
          int v46 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_117:

          v47 = [v38 objectForKeyedSubscript:@"component"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v83 = v6;
            id v86 = v5;
            long long v90 = 0u;
            long long v91 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            v81 = v47;
            id v48 = v47;
            uint64_t v49 = [v48 countByEnumeratingWithState:&v88 objects:v92 count:16];
            if (v49)
            {
              uint64_t v50 = v49;
              uint64_t v51 = *(void *)v89;
              do
              {
                uint64_t v52 = 0;
                do
                {
                  if (*(void *)v89 != v51) {
                    objc_enumerationMutation(v48);
                  }
                  v53 = *(void **)(*((void *)&v88 + 1) + 8 * v52);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v54 = [GEOPDComponent alloc];
                    if (v54) {
                      v55 = -[GEOPDComponent _initWithDictionary:isJSON:]((char *)v54, v53, a3);
                    }
                    else {
                      v55 = 0;
                    }
                    -[GEOPDPublisherResult addComponent:]((uint64_t)v37, v55);
                  }
                  ++v52;
                }
                while (v50 != v52);
                uint64_t v56 = [v48 countByEnumeratingWithState:&v88 objects:v92 count:16];
                uint64_t v50 = v56;
              }
              while (v56);
            }

            objc_super v6 = v83;
            id v5 = v86;
            v47 = v81;
          }

          goto LABEL_133;
        }
        int v46 = [v44 intValue];
      }
      *(unsigned char *)&v37->_flags |= 0x10u;
      *(unsigned char *)&v37->_flags |= 1u;
      v37->_status = v46;
      goto LABEL_117;
    }
    v16 = [GEOPDCollectionResult alloc];
    if (!v16)
    {
LABEL_81:
      objc_msgSend(v6, "setCollection:", v16, v81);

      goto LABEL_82;
    }
    id v17 = v15;
    v16 = [(GEOPDCollectionResult *)v16 init];
    if (!v16)
    {
LABEL_80:

      goto LABEL_81;
    }
    if (a3) {
      v18 = @"collectionId";
    }
    else {
      v18 = @"collection_id";
    }
    v19 = [v17 objectForKeyedSubscript:v18];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [GEOPDMapsIdentifier alloc];
      if (a3) {
        v21 = [(GEOPDMapsIdentifier *)v20 initWithJSON:v19];
      }
      else {
        v21 = [(GEOPDMapsIdentifier *)v20 initWithDictionary:v19];
      }
      v22 = v21;
      -[GEOPDCollectionResult setCollectionId:]((uint64_t)v16, v21);
    }
    v23 = [v17 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v23;
      if ([v24 isEqualToString:@"STATUS_SUCCESS"])
      {
        int v25 = 0;
      }
      else if ([v24 isEqualToString:@"STATUS_FAILED"])
      {
        int v25 = 1;
      }
      else if ([v24 isEqualToString:@"STATUS_INCOMPLETE"])
      {
        int v25 = 2;
      }
      else if ([v24 isEqualToString:@"INVALID_REQUEST"])
      {
        int v25 = 5;
      }
      else if ([v24 isEqualToString:@"FAILED_NO_RESULT"])
      {
        int v25 = 20;
      }
      else if ([v24 isEqualToString:@"NEEDS_REFINEMENT"])
      {
        int v25 = 30;
      }
      else if ([v24 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
      {
        int v25 = 40;
      }
      else if ([v24 isEqualToString:@"STATUS_DEDUPED"])
      {
        int v25 = 50;
      }
      else if ([v24 isEqualToString:@"VERSION_MISMATCH"])
      {
        int v25 = 60;
      }
      else
      {
        int v25 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_64:

        v26 = [v17 objectForKeyedSubscript:@"component"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v82 = v6;
          id v85 = v5;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          v81 = v26;
          id v27 = v26;
          uint64_t v28 = [v27 countByEnumeratingWithState:&v88 objects:v92 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v89;
            do
            {
              uint64_t v31 = 0;
              do
              {
                if (*(void *)v89 != v30) {
                  objc_enumerationMutation(v27);
                }
                v32 = *(void **)(*((void *)&v88 + 1) + 8 * v31);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v33 = [GEOPDComponent alloc];
                  if (v33) {
                    v34 = -[GEOPDComponent _initWithDictionary:isJSON:]((char *)v33, v32, a3);
                  }
                  else {
                    v34 = 0;
                  }
                  -[GEOPDCollectionResult addComponent:]((uint64_t)v16, v34);
                }
                ++v31;
              }
              while (v29 != v31);
              uint64_t v35 = [v27 countByEnumeratingWithState:&v88 objects:v92 count:16];
              uint64_t v29 = v35;
            }
            while (v35);
          }

          objc_super v6 = v82;
          id v5 = v85;
          v26 = v81;
        }

        goto LABEL_80;
      }
      int v25 = [v23 intValue];
    }
    *(unsigned char *)&v16->_flags |= 0x10u;
    *(unsigned char *)&v16->_flags |= 1u;
    v16->_status = v25;
    goto LABEL_64;
  }
LABEL_174:

  return v6;
}

- (GEOPDMapsResult)initWithJSON:(id)a3
{
  return (GEOPDMapsResult *)-[GEOPDMapsResult _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDMapsResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDMapsResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  -[GEOPDMapsResult _readBatchReverseGeocode]((uint64_t)self);
  batchReverseGeocode = self->_batchReverseGeocode;
  if (batchReverseGeocode)
  {
    -[GEOPDBatchReverseGeocodeResult _readAdditionalPlaces]((uint64_t)self->_batchReverseGeocode);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    objc_super v6 = batchReverseGeocode->_additionalPlaces;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v10), "hasGreenTeaWithValue:", v3, (void)v23))
          {

            return 1;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    -[GEOPDBatchReverseGeocodeResult _readPlace]((uint64_t)batchReverseGeocode);
    if ([(GEOPDPlace *)batchReverseGeocode->_place hasGreenTeaWithValue:v3]) {
      return 1;
    }
  }
  -[GEOPDMapsResult _readCollection]((uint64_t)self);
  collection = self->_collection;
  if (!collection) {
    goto LABEL_22;
  }
  -[GEOPDCollectionResult _readCollectionId]((uint64_t)self->_collection);
  if (![(GEOPDMapsIdentifier *)collection->_collectionId hasGreenTeaWithValue:v3])
  {
    -[GEOPDCollectionResult _readComponents]((uint64_t)collection);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v12 = collection->_components;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
LABEL_15:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        if (-[GEOPDComponent hasGreenTeaWithValue:](*(void *)(*((void *)&v23 + 1) + 8 * v16), v3)) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v14) {
            goto LABEL_15;
          }
          goto LABEL_21;
        }
      }
LABEL_37:

      return 1;
    }
LABEL_21:

LABEL_22:
    -[GEOPDMapsResult _readPlace]((uint64_t)self);
    if ([(GEOPDPlace *)self->_place hasGreenTeaWithValue:v3]) {
      return 1;
    }
    -[GEOPDMapsResult _readPlaceQuestionnaire]((uint64_t)self);
    if (-[GEOPDPlaceQuestionnaireResult hasGreenTeaWithValue:]((uint64_t)self->_placeQuestionnaire, v3)) {
      return 1;
    }
    -[GEOPDMapsResult _readPublisher]((uint64_t)self);
    publisher = self->_publisher;
    if (!publisher) {
      return 0;
    }
    -[GEOPDPublisherResult _readComponents]((uint64_t)publisher);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v12 = publisher->_components;
    uint64_t v18 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (!v18)
    {
LABEL_33:

      -[GEOPDPublisherResult _readPublisherId]((uint64_t)publisher);
      return [(GEOPDMapsIdentifier *)publisher->_publisherId hasGreenTeaWithValue:v3];
    }
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
LABEL_27:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v24 != v20) {
        objc_enumerationMutation(v12);
      }
      if (-[GEOPDComponent hasGreenTeaWithValue:](*(void *)(*((void *)&v23 + 1) + 8 * v21), v3)) {
        goto LABEL_37;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v19) {
          goto LABEL_27;
        }
        goto LABEL_33;
      }
    }
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOPDMapsResult *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 19) = self->_resultType;
    *((unsigned char *)v5 + 80) |= 1u;
  }
  if (self->_place)
  {
    objc_msgSend(v5, "setPlace:");
    int v4 = v5;
  }
  if (self->_collection)
  {
    objc_msgSend(v5, "setCollection:");
    int v4 = v5;
  }
  if (self->_publisher)
  {
    objc_msgSend(v5, "setPublisher:");
    int v4 = v5;
  }
  if (self->_placeQuestionnaire)
  {
    objc_msgSend(v5, "setPlaceQuestionnaire:");
    int v4 = v5;
  }
  if (self->_batchReverseGeocode)
  {
    objc_msgSend(v5, "setBatchReverseGeocode:");
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
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDMapsResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDMapsResult *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 76) = self->_resultType;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  id v9 = [(GEOPDPlace *)self->_place copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  id v11 = [(GEOPDCollectionResult *)self->_collection copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  id v13 = [(GEOPDPublisherResult *)self->_publisher copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v13;

  id v15 = [(GEOPDPlaceQuestionnaireResult *)self->_placeQuestionnaire copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  id v17 = [(GEOPDBatchReverseGeocodeResult *)self->_batchReverseGeocode copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v17;

  uint64_t v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  [(GEOPDMapsResult *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_resultType != *((_DWORD *)v4 + 19)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  place = self->_place;
  if ((unint64_t)place | *((void *)v4 + 6) && !-[GEOPDPlace isEqual:](place, "isEqual:")) {
    goto LABEL_17;
  }
  collection = self->_collection;
  if ((unint64_t)collection | *((void *)v4 + 4))
  {
    if (!-[GEOPDCollectionResult isEqual:](collection, "isEqual:")) {
      goto LABEL_17;
    }
  }
  publisher = self->_publisher;
  if ((unint64_t)publisher | *((void *)v4 + 7))
  {
    if (!-[GEOPDPublisherResult isEqual:](publisher, "isEqual:")) {
      goto LABEL_17;
    }
  }
  placeQuestionnaire = self->_placeQuestionnaire;
  if ((unint64_t)placeQuestionnaire | *((void *)v4 + 5))
  {
    if (!-[GEOPDPlaceQuestionnaireResult isEqual:](placeQuestionnaire, "isEqual:")) {
      goto LABEL_17;
    }
  }
  batchReverseGeocode = self->_batchReverseGeocode;
  if ((unint64_t)batchReverseGeocode | *((void *)v4 + 3)) {
    char v10 = -[GEOPDBatchReverseGeocodeResult isEqual:](batchReverseGeocode, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  [(GEOPDMapsResult *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_resultType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDPlace *)self->_place hash] ^ v3;
  unint64_t v5 = [(GEOPDCollectionResult *)self->_collection hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOPDPublisherResult *)self->_publisher hash];
  unint64_t v7 = [(GEOPDPlaceQuestionnaireResult *)self->_placeQuestionnaire hash];
  return v6 ^ v7 ^ [(GEOPDBatchReverseGeocodeResult *)self->_batchReverseGeocode hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v39 = (int *)a3;
  [v39 readAll:0];
  unint64_t v4 = v39;
  if (v39[20])
  {
    self->_resultType = v39[19];
    *(unsigned char *)&self->_flags |= 1u;
  }
  place = self->_place;
  uint64_t v6 = *((void *)v39 + 6);
  if (place)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDMapsResult setPlace:](self, "setPlace:");
  }
  unint64_t v4 = v39;
LABEL_9:
  collection = self->_collection;
  id v8 = (void *)*((void *)v4 + 4);
  if (collection)
  {
    if (!v8) {
      goto LABEL_29;
    }
    id v9 = v8;
    -[GEOPDCollectionResult readAll:]((uint64_t)v9, 0);
    collectionId = collection->_collectionId;
    uint64_t v11 = *((void *)v9 + 3);
    if (collectionId)
    {
      if (v11) {
        -[GEOPDMapsIdentifier mergeFrom:](collectionId, "mergeFrom:");
      }
    }
    else if (v11)
    {
      -[GEOPDCollectionResult setCollectionId:]((uint64_t)collection, *((void **)v9 + 3));
    }
    if (*((unsigned char *)v9 + 56))
    {
      collection->_status = *((_DWORD *)v9 + 13);
      *(unsigned char *)&collection->_flags |= 1u;
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v12 = *((id *)v9 + 4);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v41 != v15) {
            objc_enumerationMutation(v12);
          }
          -[GEOPDCollectionResult addComponent:]((uint64_t)collection, *(void **)(*((void *)&v40 + 1) + 8 * i));
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v14);
    }
  }
  else
  {
    if (!v8) {
      goto LABEL_29;
    }
    -[GEOPDMapsResult setCollection:](self, "setCollection:");
  }
  unint64_t v4 = v39;
LABEL_29:
  publisher = self->_publisher;
  uint64_t v18 = (void *)*((void *)v4 + 7);
  if (publisher)
  {
    if (!v18) {
      goto LABEL_49;
    }
    id v19 = v18;
    -[GEOPDPublisherResult readAll:]((uint64_t)v19, 0);
    publisherId = publisher->_publisherId;
    uint64_t v21 = *((void *)v19 + 4);
    if (publisherId)
    {
      if (v21) {
        -[GEOPDMapsIdentifier mergeFrom:](publisherId, "mergeFrom:");
      }
    }
    else if (v21)
    {
      -[GEOPDPublisherResult setPublisherId:]((uint64_t)publisher, *((void **)v19 + 4));
    }
    if (*((unsigned char *)v19 + 56))
    {
      publisher->_status = *((_DWORD *)v19 + 13);
      *(unsigned char *)&publisher->_flags |= 1u;
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v22 = *((id *)v19 + 3);
    uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(v22);
          }
          -[GEOPDPublisherResult addComponent:]((uint64_t)publisher, *(void **)(*((void *)&v40 + 1) + 8 * j));
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v24);
    }
  }
  else
  {
    if (!v18) {
      goto LABEL_49;
    }
    -[GEOPDMapsResult setPublisher:](self, "setPublisher:");
  }
  unint64_t v4 = v39;
LABEL_49:
  placeQuestionnaire = self->_placeQuestionnaire;
  uint64_t v28 = (void *)*((void *)v4 + 5);
  if (placeQuestionnaire)
  {
    if (!v28) {
      goto LABEL_55;
    }
    -[GEOPDPlaceQuestionnaireResult mergeFrom:]((uint64_t)placeQuestionnaire, v28);
  }
  else
  {
    if (!v28) {
      goto LABEL_55;
    }
    [(GEOPDMapsResult *)self setPlaceQuestionnaire:*((void *)v4 + 5)];
  }
  unint64_t v4 = v39;
LABEL_55:
  batchReverseGeocode = self->_batchReverseGeocode;
  uint64_t v30 = (void *)*((void *)v4 + 3);
  if (batchReverseGeocode)
  {
    if (v30)
    {
      uint64_t v31 = v30;
      -[GEOPDBatchReverseGeocodeResult readAll:]((uint64_t)v31, 0);
      v32 = batchReverseGeocode->_place;
      id v33 = v31[4];
      if (v32)
      {
        if (v33) {
          -[GEOPDPlace mergeFrom:](v32, "mergeFrom:");
        }
      }
      else if (v33)
      {
        -[GEOPDBatchReverseGeocodeResult setPlace:]((uint64_t)batchReverseGeocode, v31[4]);
      }
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v34 = v31[3];
      uint64_t v35 = [v34 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v41;
        do
        {
          for (uint64_t k = 0; k != v36; ++k)
          {
            if (*(void *)v41 != v37) {
              objc_enumerationMutation(v34);
            }
            -[GEOPDBatchReverseGeocodeResult addAdditionalPlace:]((uint64_t)batchReverseGeocode, *(void **)(*((void *)&v40 + 1) + 8 * k));
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v36);
      }
    }
  }
  else if (v30)
  {
    -[GEOPDMapsResult setBatchReverseGeocode:](self, "setBatchReverseGeocode:");
  }

  MEMORY[0x1F4181870]();
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPDMapsResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6253);
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
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x82u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDMapsResult *)self readAll:0];
    [(GEOPDPlace *)self->_place clearUnknownFields:1];
    collection = self->_collection;
    if (collection)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)&collection->_flags |= 2u;
      *(unsigned char *)&collection->_flags |= 0x10u;
      os_unfair_lock_unlock(&collection->_readerLock);
      id v8 = collection->_unknownFields;
      collection->_unknownFields = 0;

      -[GEOPDCollectionResult readAll:]((uint64_t)collection, 0);
      [(GEOPDMapsIdentifier *)collection->_collectionId clearUnknownFields:1];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v9 = collection->_components;
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v29;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v29 != v12) {
              objc_enumerationMutation(v9);
            }
            -[GEOPDComponent clearUnknownFields:](*(void *)(*((void *)&v28 + 1) + 8 * v13++), 1);
          }
          while (v11 != v13);
          uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v11);
      }
    }
    publisher = self->_publisher;
    if (publisher)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)&publisher->_flags |= 2u;
      *(unsigned char *)&publisher->_flags |= 0x10u;
      os_unfair_lock_unlock(&publisher->_readerLock);
      uint64_t v15 = publisher->_unknownFields;
      publisher->_unknownFields = 0;

      -[GEOPDPublisherResult readAll:]((uint64_t)publisher, 0);
      [(GEOPDMapsIdentifier *)publisher->_publisherId clearUnknownFields:1];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v16 = publisher->_components;
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v29;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v29 != v19) {
              objc_enumerationMutation(v16);
            }
            -[GEOPDComponent clearUnknownFields:](*(void *)(*((void *)&v28 + 1) + 8 * v20++), 1);
          }
          while (v18 != v20);
          uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v18);
      }
    }
    batchReverseGeocode = self->_batchReverseGeocode;
    if (batchReverseGeocode)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)&batchReverseGeocode->_flags |= 1u;
      *(unsigned char *)&batchReverseGeocode->_flags |= 8u;
      os_unfair_lock_unlock(&batchReverseGeocode->_readerLock);
      id v22 = batchReverseGeocode->_unknownFields;
      batchReverseGeocode->_unknownFields = 0;

      -[GEOPDBatchReverseGeocodeResult readAll:]((uint64_t)batchReverseGeocode, 0);
      [(GEOPDPlace *)batchReverseGeocode->_place clearUnknownFields:1];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v23 = batchReverseGeocode->_additionalPlaces;
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v29;
        do
        {
          uint64_t v27 = 0;
          do
          {
            if (*(void *)v29 != v26) {
              objc_enumerationMutation(v23);
            }
            [*(id *)(*((void *)&v28 + 1) + 8 * v27++) clearUnknownFields:1];
          }
          while (v25 != v27);
          uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v25);
      }
    }
  }
}

@end