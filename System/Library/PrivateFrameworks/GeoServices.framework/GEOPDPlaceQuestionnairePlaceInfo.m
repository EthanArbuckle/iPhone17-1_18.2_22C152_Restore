@interface GEOPDPlaceQuestionnairePlaceInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceQuestionnairePlaceInfo)init;
- (GEOPDPlaceQuestionnairePlaceInfo)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_readMapsId;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceQuestionnairePlaceInfo

- (GEOPDPlaceQuestionnairePlaceInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceQuestionnairePlaceInfo;
  v2 = [(GEOPDPlaceQuestionnairePlaceInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceQuestionnairePlaceInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceQuestionnairePlaceInfo;
  v3 = [(GEOPDPlaceQuestionnairePlaceInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMapsId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceQuestionnairePlaceInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsId_tags_5);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceQuestionnairePlaceInfo;
  v4 = [(GEOPDPlaceQuestionnairePlaceInfo *)&v8 description];
  v5 = [(GEOPDPlaceQuestionnairePlaceInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceQuestionnairePlaceInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPlaceQuestionnairePlaceInfo readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    -[GEOPDPlaceQuestionnairePlaceInfo _readMapsId](a1);
    id v5 = *(id *)(a1 + 32);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"mapsId";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"maps_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDPlaceQuestionnairePlaceInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsCategoryId_tags_1);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v11 = *(id *)(a1 + 24);
    if (v11)
    {
      if (a2) {
        v12 = @"mapsCategoryId";
      }
      else {
        v12 = @"maps_category_id";
      }
      [v4 setObject:v11 forKey:v12];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 2) == 0)
    {
      v13 = *(void **)(a1 + 8);
      if (v13)
      {
        id v14 = v13;
        objc_sync_enter(v14);
        GEOPDPlaceQuestionnairePlaceInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryCode_tags_6);
        objc_sync_exit(v14);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v15 = *(id *)(a1 + 16);
    if (v15)
    {
      if (a2) {
        v16 = @"countryCode";
      }
      else {
        v16 = @"country_code";
      }
      [v4 setObject:v15 forKey:v16];
    }

    if (*(unsigned char *)(a1 + 56))
    {
      v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 52)];
      if (a2) {
        v18 = @"hasRichData";
      }
      else {
        v18 = @"has_rich_data";
      }
      [v4 setObject:v17 forKey:v18];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceQuestionnairePlaceInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_87;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_87;
      }
      GEOPDPlaceQuestionnairePlaceInfoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 32) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceQuestionnairePlaceInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceQuestionnairePlaceInfo readAll:]((uint64_t)self, 0);
    if (self->_mapsId) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapsCategoryId) {
      PBDataWriterWriteStringField();
    }
    if (self->_countryCode) {
      PBDataWriterWriteStringField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPlaceQuestionnairePlaceInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceQuestionnairePlaceInfo readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDMapsIdentifier *)self->_mapsId copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_mapsCategoryId copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  uint64_t v13 = [(NSString *)self->_countryCode copyWithZone:a3];
  id v14 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v13;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 52) = self->_hasRichData;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  -[GEOPDPlaceQuestionnairePlaceInfo readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceQuestionnairePlaceInfo readAll:]((uint64_t)v4, 1);
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((void *)v4 + 4))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:")) {
      goto LABEL_10;
    }
  }
  mapsCategoryId = self->_mapsCategoryId;
  if ((unint64_t)mapsCategoryId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](mapsCategoryId, "isEqual:")) {
      goto LABEL_10;
    }
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0)
    {
LABEL_10:
      BOOL v8 = 0;
      goto LABEL_11;
    }
    if (self->_hasRichData)
    {
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_10;
      }
    }
    else if (*((unsigned char *)v4 + 52))
    {
      goto LABEL_10;
    }
    BOOL v8 = 1;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDPlaceQuestionnairePlaceInfo readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDMapsIdentifier *)self->_mapsId hash];
  NSUInteger v4 = [(NSString *)self->_mapsCategoryId hash];
  NSUInteger v5 = [(NSString *)self->_countryCode hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_hasRichData;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_mapsCategoryId, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end