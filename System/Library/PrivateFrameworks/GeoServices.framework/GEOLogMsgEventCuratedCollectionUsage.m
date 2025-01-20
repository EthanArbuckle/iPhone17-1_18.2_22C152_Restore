@interface GEOLogMsgEventCuratedCollectionUsage
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCollectionFirstViewedDate;
- (BOOL)hasCollectionLastViewedDate;
- (BOOL)hasCollectionMuid;
- (BOOL)hasHomeCountryCode;
- (BOOL)hasHomeMetroRegion;
- (BOOL)hasTouristInfo;
- (BOOL)hasViewsToday;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventCuratedCollectionUsage)init;
- (GEOLogMsgEventCuratedCollectionUsage)initWithData:(id)a3;
- (GEOLogMsgEventCuratedCollectionUsage)initWithDictionary:(id)a3;
- (GEOLogMsgEventCuratedCollectionUsage)initWithJSON:(id)a3;
- (GEOTouristInfo)touristInfo;
- (NSString)homeCountryCode;
- (NSString)homeMetroRegion;
- (double)collectionFirstViewedDate;
- (double)collectionLastViewedDate;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)collectionMuid;
- (unint64_t)hash;
- (unsigned)viewsToday;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readHomeCountryCode;
- (void)_readHomeMetroRegion;
- (void)_readTouristInfo;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCollectionFirstViewedDate:(double)a3;
- (void)setCollectionLastViewedDate:(double)a3;
- (void)setCollectionMuid:(unint64_t)a3;
- (void)setHasCollectionFirstViewedDate:(BOOL)a3;
- (void)setHasCollectionLastViewedDate:(BOOL)a3;
- (void)setHasCollectionMuid:(BOOL)a3;
- (void)setHasViewsToday:(BOOL)a3;
- (void)setHomeCountryCode:(id)a3;
- (void)setHomeMetroRegion:(id)a3;
- (void)setTouristInfo:(id)a3;
- (void)setViewsToday:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventCuratedCollectionUsage

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventCuratedCollectionUsage;
  v4 = [(GEOLogMsgEventCuratedCollectionUsage *)&v8 description];
  v5 = [(GEOLogMsgEventCuratedCollectionUsage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (GEOLogMsgEventCuratedCollectionUsage)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventCuratedCollectionUsage;
  v2 = [(GEOLogMsgEventCuratedCollectionUsage *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventCuratedCollectionUsage)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventCuratedCollectionUsage;
  v3 = [(GEOLogMsgEventCuratedCollectionUsage *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)collectionMuid
{
  return self->_collectionMuid;
}

- (void)setCollectionMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  self->_collectionMuid = a3;
}

- (void)setHasCollectionMuid:(BOOL)a3
{
  if (a3) {
    char v3 = -124;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasCollectionMuid
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)viewsToday
{
  return self->_viewsToday;
}

- (void)setViewsToday:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  self->_viewsToday = a3;
}

- (void)setHasViewsToday:(BOOL)a3
{
  if (a3) {
    char v3 = -120;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasViewsToday
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)collectionFirstViewedDate
{
  return self->_collectionFirstViewedDate;
}

- (void)setCollectionFirstViewedDate:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_collectionFirstViewedDate = a3;
}

- (void)setHasCollectionFirstViewedDate:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasCollectionFirstViewedDate
{
  return *(unsigned char *)&self->_flags & 1;
}

- (double)collectionLastViewedDate
{
  return self->_collectionLastViewedDate;
}

- (void)setCollectionLastViewedDate:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_collectionLastViewedDate = a3;
}

- (void)setHasCollectionLastViewedDate:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCollectionLastViewedDate
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readTouristInfo
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
        GEOLogMsgEventCuratedCollectionUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTouristInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasTouristInfo
{
  return self->_touristInfo != 0;
}

- (GEOTouristInfo)touristInfo
{
  -[GEOLogMsgEventCuratedCollectionUsage _readTouristInfo]((uint64_t)self);
  touristInfo = self->_touristInfo;

  return touristInfo;
}

- (void)setTouristInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_touristInfo, a3);
}

- (void)_readHomeCountryCode
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
        GEOLogMsgEventCuratedCollectionUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHomeCountryCode_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasHomeCountryCode
{
  return self->_homeCountryCode != 0;
}

- (NSString)homeCountryCode
{
  -[GEOLogMsgEventCuratedCollectionUsage _readHomeCountryCode]((uint64_t)self);
  homeCountryCode = self->_homeCountryCode;

  return homeCountryCode;
}

- (void)setHomeCountryCode:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_homeCountryCode, a3);
}

- (void)_readHomeMetroRegion
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
        GEOLogMsgEventCuratedCollectionUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHomeMetroRegion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasHomeMetroRegion
{
  return self->_homeMetroRegion != 0;
}

- (NSString)homeMetroRegion
{
  -[GEOLogMsgEventCuratedCollectionUsage _readHomeMetroRegion]((uint64_t)self);
  homeMetroRegion = self->_homeMetroRegion;

  return homeMetroRegion;
}

- (void)setHomeMetroRegion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_homeMetroRegion, a3);
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventCuratedCollectionUsage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_39;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 80);
  if ((v5 & 4) != 0)
  {
    v12 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
    if (a2) {
      v13 = @"collectionMuid";
    }
    else {
      v13 = @"collection_muid";
    }
    [v4 setObject:v12 forKey:v13];

    char v5 = *(unsigned char *)(a1 + 80);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
LABEL_21:
      v16 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
      if (a2) {
        v17 = @"collectionFirstViewedDate";
      }
      else {
        v17 = @"collection_first_viewed_date";
      }
      [v4 setObject:v16 forKey:v17];

      if ((*(unsigned char *)(a1 + 80) & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)(a1 + 80) & 8) == 0)
  {
    goto LABEL_4;
  }
  v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
  if (a2) {
    v15 = @"viewsToday";
  }
  else {
    v15 = @"views_today";
  }
  [v4 setObject:v14 forKey:v15];

  char v5 = *(unsigned char *)(a1 + 80);
  if (v5) {
    goto LABEL_21;
  }
LABEL_5:
  if ((v5 & 2) != 0)
  {
LABEL_6:
    objc_super v6 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    if (a2) {
      objc_super v7 = @"collectionLastViewedDate";
    }
    else {
      objc_super v7 = @"collection_last_viewed_date";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_10:
  objc_super v8 = [(id)a1 touristInfo];
  v9 = v8;
  if (v8)
  {
    if (a2)
    {
      v10 = [v8 jsonRepresentation];
      v11 = @"touristInfo";
    }
    else
    {
      v10 = [v8 dictionaryRepresentation];
      v11 = @"tourist_info";
    }
    [v4 setObject:v10 forKey:v11];
  }
  v18 = [(id)a1 homeCountryCode];
  if (v18)
  {
    if (a2) {
      v19 = @"homeCountryCode";
    }
    else {
      v19 = @"home_country_code";
    }
    [v4 setObject:v18 forKey:v19];
  }

  v20 = [(id)a1 homeMetroRegion];
  if (v20)
  {
    if (a2) {
      v21 = @"homeMetroRegion";
    }
    else {
      v21 = @"home_metro_region";
    }
    [v4 setObject:v20 forKey:v21];
  }

LABEL_39:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventCuratedCollectionUsage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventCuratedCollectionUsage)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventCuratedCollectionUsage *)-[GEOLogMsgEventCuratedCollectionUsage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"collectionMuid";
      }
      else {
        objc_super v6 = @"collection_muid";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCollectionMuid:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      if (a3) {
        objc_super v8 = @"viewsToday";
      }
      else {
        objc_super v8 = @"views_today";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setViewsToday:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        v10 = @"collectionFirstViewedDate";
      }
      else {
        v10 = @"collection_first_viewed_date";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 doubleValue];
        objc_msgSend(a1, "setCollectionFirstViewedDate:");
      }

      if (a3) {
        v12 = @"collectionLastViewedDate";
      }
      else {
        v12 = @"collection_last_viewed_date";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v13 doubleValue];
        objc_msgSend(a1, "setCollectionLastViewedDate:");
      }

      if (a3) {
        v14 = @"touristInfo";
      }
      else {
        v14 = @"tourist_info";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [GEOTouristInfo alloc];
        if (a3) {
          uint64_t v17 = [(GEOTouristInfo *)v16 initWithJSON:v15];
        }
        else {
          uint64_t v17 = [(GEOTouristInfo *)v16 initWithDictionary:v15];
        }
        v18 = (void *)v17;
        [a1 setTouristInfo:v17];
      }
      if (a3) {
        v19 = @"homeCountryCode";
      }
      else {
        v19 = @"home_country_code";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = (void *)[v20 copy];
        [a1 setHomeCountryCode:v21];
      }
      if (a3) {
        v22 = @"homeMetroRegion";
      }
      else {
        v22 = @"home_metro_region";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = (void *)[v23 copy];
        [a1 setHomeMetroRegion:v24];
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventCuratedCollectionUsage)initWithJSON:(id)a3
{
  return (GEOLogMsgEventCuratedCollectionUsage *)-[GEOLogMsgEventCuratedCollectionUsage _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_2001;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2002;
    }
    GEOLogMsgEventCuratedCollectionUsageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOTouristInfo *)self->_touristInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventCuratedCollectionUsageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventCuratedCollectionUsageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if (*(unsigned char *)&self->_flags <= 0xFu)
    {
      objc_super v6 = self->_reader;
      objc_sync_enter(v6);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v8 writeData:v7];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v6);
      goto LABEL_19;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventCuratedCollectionUsage *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0) {
        goto LABEL_6;
      }
LABEL_16:
      PBDataWriterWriteDoubleField();
      if ((*(unsigned char *)&self->_flags & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_16;
  }
LABEL_6:
  if ((flags & 2) != 0) {
LABEL_7:
  }
    PBDataWriterWriteDoubleField();
LABEL_8:
  if (self->_touristInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_homeCountryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_homeMetroRegion) {
    PBDataWriterWriteStringField();
  }
LABEL_19:
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOLogMsgEventCuratedCollectionUsage *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 16) = self->_readerMarkPos;
  *((_DWORD *)v6 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v6[4] = self->_collectionMuid;
    *((unsigned char *)v6 + 80) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 19) = self->_viewsToday;
  *((unsigned char *)v6 + 80) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_17:
  v6[2] = *(id *)&self->_collectionFirstViewedDate;
  *((unsigned char *)v6 + 80) |= 1u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_5:
    v6[3] = *(id *)&self->_collectionLastViewedDate;
    *((unsigned char *)v6 + 80) |= 2u;
  }
LABEL_6:
  if (self->_touristInfo)
  {
    objc_msgSend(v6, "setTouristInfo:");
    v4 = v6;
  }
  if (self->_homeCountryCode)
  {
    objc_msgSend(v6, "setHomeCountryCode:");
    v4 = v6;
  }
  if (self->_homeMetroRegion)
  {
    objc_msgSend(v6, "setHomeMetroRegion:");
    v4 = v6;
  }
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
    [(GEOLogMsgEventCuratedCollectionUsage *)self readAll:0];
    char flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      *(void *)(v5 + 32) = self->_collectionMuid;
      *(unsigned char *)(v5 + 80) |= 4u;
      char flags = (char)self->_flags;
      if ((flags & 8) == 0)
      {
LABEL_7:
        if ((flags & 1) == 0) {
          goto LABEL_8;
        }
        goto LABEL_14;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 76) = self->_viewsToday;
    *(unsigned char *)(v5 + 80) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_8:
      if ((flags & 2) == 0)
      {
LABEL_10:
        id v10 = [(GEOTouristInfo *)self->_touristInfo copyWithZone:a3];
        v11 = *(void **)(v5 + 56);
        *(void *)(v5 + 56) = v10;

        uint64_t v12 = [(NSString *)self->_homeCountryCode copyWithZone:a3];
        v13 = *(void **)(v5 + 40);
        *(void *)(v5 + 40) = v12;

        uint64_t v14 = [(NSString *)self->_homeMetroRegion copyWithZone:a3];
        id v8 = *(id *)(v5 + 48);
        *(void *)(v5 + 48) = v14;
        goto LABEL_11;
      }
LABEL_9:
      *(double *)(v5 + 24) = self->_collectionLastViewedDate;
      *(unsigned char *)(v5 + 80) |= 2u;
      goto LABEL_10;
    }
LABEL_14:
    *(double *)(v5 + 16) = self->_collectionFirstViewedDate;
    *(unsigned char *)(v5 + 80) |= 1u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgEventCuratedCollectionUsageReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_11:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  [(GEOLogMsgEventCuratedCollectionUsage *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_collectionMuid != *((void *)v4 + 4)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
LABEL_28:
    char v8 = 0;
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 8) == 0 || self->_viewsToday != *((_DWORD *)v4 + 19)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 8) != 0)
  {
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_collectionFirstViewedDate != *((double *)v4 + 2)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_collectionLastViewedDate != *((double *)v4 + 3)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_28;
  }
  touristInfo = self->_touristInfo;
  if ((unint64_t)touristInfo | *((void *)v4 + 7) && !-[GEOTouristInfo isEqual:](touristInfo, "isEqual:")) {
    goto LABEL_28;
  }
  homeCountryCode = self->_homeCountryCode;
  if ((unint64_t)homeCountryCode | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](homeCountryCode, "isEqual:")) {
      goto LABEL_28;
    }
  }
  homeMetroRegion = self->_homeMetroRegion;
  if ((unint64_t)homeMetroRegion | *((void *)v4 + 6)) {
    char v8 = -[NSString isEqual:](homeMetroRegion, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_29:

  return v8;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventCuratedCollectionUsage *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v10 = 0;
    goto LABEL_13;
  }
  unint64_t v4 = 2654435761u * self->_collectionMuid;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_viewsToday;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double collectionFirstViewedDate = self->_collectionFirstViewedDate;
  double v7 = -collectionFirstViewedDate;
  if (collectionFirstViewedDate >= 0.0) {
    double v7 = self->_collectionFirstViewedDate;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if ((flags & 2) != 0)
  {
    double collectionLastViewedDate = self->_collectionLastViewedDate;
    double v13 = -collectionLastViewedDate;
    if (collectionLastViewedDate >= 0.0) {
      double v13 = self->_collectionLastViewedDate;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  unint64_t v16 = v5 ^ v4 ^ v10 ^ v11 ^ [(GEOTouristInfo *)self->_touristInfo hash];
  NSUInteger v17 = [(NSString *)self->_homeCountryCode hash];
  return v16 ^ v17 ^ [(NSString *)self->_homeMetroRegion hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  unint64_t v4 = v8;
  char v5 = *((unsigned char *)v8 + 80);
  if ((v5 & 4) != 0)
  {
    self->_collectionMuid = *((void *)v8 + 4);
    *(unsigned char *)&self->_flags |= 4u;
    char v5 = *((unsigned char *)v8 + 80);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v8 + 80) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_viewsToday = *((_DWORD *)v8 + 19);
  *(unsigned char *)&self->_flags |= 8u;
  char v5 = *((unsigned char *)v8 + 80);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_double collectionFirstViewedDate = *((double *)v8 + 2);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v8 + 80) & 2) != 0)
  {
LABEL_5:
    self->_double collectionLastViewedDate = *((double *)v8 + 3);
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_6:
  touristInfo = self->_touristInfo;
  uint64_t v7 = *((void *)v8 + 7);
  if (touristInfo)
  {
    if (!v7) {
      goto LABEL_16;
    }
    -[GEOTouristInfo mergeFrom:](touristInfo, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_16;
    }
    -[GEOLogMsgEventCuratedCollectionUsage setTouristInfo:](self, "setTouristInfo:");
  }
  unint64_t v4 = v8;
LABEL_16:
  if (v4[5])
  {
    -[GEOLogMsgEventCuratedCollectionUsage setHomeCountryCode:](self, "setHomeCountryCode:");
    unint64_t v4 = v8;
  }
  if (v4[6])
  {
    -[GEOLogMsgEventCuratedCollectionUsage setHomeMetroRegion:](self, "setHomeMetroRegion:");
    unint64_t v4 = v8;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touristInfo, 0);
  objc_storeStrong((id *)&self->_homeMetroRegion, 0);
  objc_storeStrong((id *)&self->_homeCountryCode, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end