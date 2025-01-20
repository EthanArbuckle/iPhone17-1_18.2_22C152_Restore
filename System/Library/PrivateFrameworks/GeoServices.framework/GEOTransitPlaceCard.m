@interface GEOTransitPlaceCard
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIncidentType;
- (BOOL)hasTransitCategory;
- (BOOL)hasTransitDepartureSequenceUsage;
- (BOOL)hasTransitSystemName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitDepartureSequenceUsage)transitDepartureSequenceUsage;
- (GEOTransitPlaceCard)init;
- (GEOTransitPlaceCard)initWithData:(id)a3;
- (GEOTransitPlaceCard)initWithDictionary:(id)a3;
- (GEOTransitPlaceCard)initWithJSON:(id)a3;
- (NSString)incidentType;
- (NSString)transitSystemName;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)transitCategoryAsString:(int)a3;
- (int)StringAsTransitCategory:(id)a3;
- (int)transitCategory;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readIncidentType;
- (void)_readTransitDepartureSequenceUsage;
- (void)_readTransitSystemName;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasTransitCategory:(BOOL)a3;
- (void)setIncidentType:(id)a3;
- (void)setTransitCategory:(int)a3;
- (void)setTransitDepartureSequenceUsage:(id)a3;
- (void)setTransitSystemName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitPlaceCard

- (GEOTransitPlaceCard)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitPlaceCard;
  v2 = [(GEOTransitPlaceCard *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitPlaceCard)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitPlaceCard;
  v3 = [(GEOTransitPlaceCard *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)transitCategory
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_transitCategory;
  }
  else {
    return 0;
  }
}

- (void)setTransitCategory:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_transitCategory = a3;
}

- (void)setHasTransitCategory:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasTransitCategory
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)transitCategoryAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E4C68[a3];
  }

  return v3;
}

- (int)StringAsTransitCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CATEGORY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SUMMARY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LOW_FREQUENCY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HIGH_FREQUENCY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MIXED_FREQUENCY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CONNECTIONS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"OUT_OF_SERVICE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readTransitSystemName
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
        GEOTransitPlaceCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitSystemName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTransitSystemName
{
  return self->_transitSystemName != 0;
}

- (NSString)transitSystemName
{
  -[GEOTransitPlaceCard _readTransitSystemName]((uint64_t)self);
  transitSystemName = self->_transitSystemName;

  return transitSystemName;
}

- (void)setTransitSystemName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_transitSystemName, a3);
}

- (void)_readTransitDepartureSequenceUsage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitPlaceCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitDepartureSequenceUsage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTransitDepartureSequenceUsage
{
  return self->_transitDepartureSequenceUsage != 0;
}

- (GEOTransitDepartureSequenceUsage)transitDepartureSequenceUsage
{
  -[GEOTransitPlaceCard _readTransitDepartureSequenceUsage]((uint64_t)self);
  transitDepartureSequenceUsage = self->_transitDepartureSequenceUsage;

  return transitDepartureSequenceUsage;
}

- (void)setTransitDepartureSequenceUsage:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_transitDepartureSequenceUsage, a3);
}

- (void)_readIncidentType
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitPlaceCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentType_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasIncidentType
{
  return self->_incidentType != 0;
}

- (NSString)incidentType
{
  -[GEOTransitPlaceCard _readIncidentType]((uint64_t)self);
  incidentType = self->_incidentType;

  return incidentType;
}

- (void)setIncidentType:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_incidentType, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitPlaceCard;
  int v4 = [(GEOTransitPlaceCard *)&v8 description];
  v5 = [(GEOTransitPlaceCard *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitPlaceCard _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v5 = *(int *)(a1 + 52);
      if (v5 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E4C68[v5];
      }
      if (a2) {
        objc_super v7 = @"transitCategory";
      }
      else {
        objc_super v7 = @"transit_category";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 transitSystemName];
    if (v8)
    {
      if (a2) {
        v9 = @"transitSystemName";
      }
      else {
        v9 = @"transit_system_name";
      }
      [v4 setObject:v8 forKey:v9];
    }

    v10 = [(id)a1 transitDepartureSequenceUsage];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"transitDepartureSequenceUsage";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"transit_departure_sequence_usage";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = [(id)a1 incidentType];
    if (v14)
    {
      if (a2) {
        v15 = @"incidentType";
      }
      else {
        v15 = @"incident_type";
      }
      [v4 setObject:v14 forKey:v15];
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
  return -[GEOTransitPlaceCard _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTransitPlaceCard)initWithDictionary:(id)a3
{
  return (GEOTransitPlaceCard *)-[GEOTransitPlaceCard _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_45;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_45;
  }
  if (a3) {
    objc_super v6 = @"transitCategory";
  }
  else {
    objc_super v6 = @"transit_category";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN_CATEGORY"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"SUMMARY"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"LOW_FREQUENCY"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"HIGH_FREQUENCY"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"MIXED_FREQUENCY"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"CONNECTIONS"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"OUT_OF_SERVICE"])
    {
      uint64_t v9 = 6;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_25:
    [a1 setTransitCategory:v9];
  }

  if (a3) {
    v10 = @"transitSystemName";
  }
  else {
    v10 = @"transit_system_name";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = (void *)[v11 copy];
    [a1 setTransitSystemName:v12];
  }
  if (a3) {
    v13 = @"transitDepartureSequenceUsage";
  }
  else {
    v13 = @"transit_departure_sequence_usage";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [GEOTransitDepartureSequenceUsage alloc];
    if (a3) {
      uint64_t v16 = [(GEOTransitDepartureSequenceUsage *)v15 initWithJSON:v14];
    }
    else {
      uint64_t v16 = [(GEOTransitDepartureSequenceUsage *)v15 initWithDictionary:v14];
    }
    v17 = (void *)v16;
    [a1 setTransitDepartureSequenceUsage:v16];
  }
  if (a3) {
    v18 = @"incidentType";
  }
  else {
    v18 = @"incident_type";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = (void *)[v19 copy];
    [a1 setIncidentType:v20];
  }
LABEL_45:

  return a1;
}

- (GEOTransitPlaceCard)initWithJSON:(id)a3
{
  return (GEOTransitPlaceCard *)-[GEOTransitPlaceCard _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_1587;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_1588;
    }
    GEOTransitPlaceCardReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOTransitDepartureSequenceUsage *)self->_transitDepartureSequenceUsage readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitPlaceCardIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitPlaceCardReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitPlaceCardIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOTransitPlaceCard *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_transitSystemName) {
      PBDataWriterWriteStringField();
    }
    if (self->_transitDepartureSequenceUsage) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_incidentType) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOTransitPlaceCard *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 13) = self->_transitCategory;
    *((unsigned char *)v5 + 56) |= 1u;
  }
  if (self->_transitSystemName)
  {
    objc_msgSend(v5, "setTransitSystemName:");
    int v4 = v5;
  }
  if (self->_transitDepartureSequenceUsage)
  {
    objc_msgSend(v5, "setTransitDepartureSequenceUsage:");
    int v4 = v5;
  }
  if (self->_incidentType)
  {
    objc_msgSend(v5, "setIncidentType:");
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
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTransitPlaceCardReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitPlaceCard *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_transitCategory;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_transitSystemName copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOTransitDepartureSequenceUsage *)self->_transitDepartureSequenceUsage copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  uint64_t v13 = [(NSString *)self->_incidentType copyWithZone:a3];
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOTransitPlaceCard *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_transitCategory != *((_DWORD *)v4 + 13)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  transitSystemName = self->_transitSystemName;
  if ((unint64_t)transitSystemName | *((void *)v4 + 4)
    && !-[NSString isEqual:](transitSystemName, "isEqual:"))
  {
    goto LABEL_13;
  }
  transitDepartureSequenceUsage = self->_transitDepartureSequenceUsage;
  if ((unint64_t)transitDepartureSequenceUsage | *((void *)v4 + 3))
  {
    if (!-[GEOTransitDepartureSequenceUsage isEqual:](transitDepartureSequenceUsage, "isEqual:")) {
      goto LABEL_13;
    }
  }
  incidentType = self->_incidentType;
  if ((unint64_t)incidentType | *((void *)v4 + 2)) {
    char v8 = -[NSString isEqual:](incidentType, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  [(GEOTransitPlaceCard *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_transitCategory;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_transitSystemName hash];
  unint64_t v5 = v4 ^ v3 ^ [(GEOTransitDepartureSequenceUsage *)self->_transitDepartureSequenceUsage hash];
  return v5 ^ [(NSString *)self->_incidentType hash];
}

- (void)mergeFrom:(id)a3
{
  id v7 = (int *)a3;
  [v7 readAll:0];
  NSUInteger v4 = v7;
  if (v7[14])
  {
    self->_transitCategory = v7[13];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v7 + 4))
  {
    -[GEOTransitPlaceCard setTransitSystemName:](self, "setTransitSystemName:");
    NSUInteger v4 = v7;
  }
  transitDepartureSequenceUsage = self->_transitDepartureSequenceUsage;
  uint64_t v6 = *((void *)v4 + 3);
  if (transitDepartureSequenceUsage)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOTransitDepartureSequenceUsage mergeFrom:](transitDepartureSequenceUsage, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOTransitPlaceCard setTransitDepartureSequenceUsage:](self, "setTransitDepartureSequenceUsage:");
  }
  NSUInteger v4 = v7;
LABEL_11:
  if (*((void *)v4 + 2))
  {
    -[GEOTransitPlaceCard setIncidentType:](self, "setIncidentType:");
    NSUInteger v4 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitSystemName, 0);
  objc_storeStrong((id *)&self->_transitDepartureSequenceUsage, 0);
  objc_storeStrong((id *)&self->_incidentType, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end