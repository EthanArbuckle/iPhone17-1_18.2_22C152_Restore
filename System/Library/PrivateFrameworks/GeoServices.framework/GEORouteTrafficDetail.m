@interface GEORouteTrafficDetail
+ (BOOL)isValid:(id)a3;
- (BOOL)hasRouteTrafficCondition;
- (BOOL)hasSpokenRouteName;
- (BOOL)hasUnabbreviatedRouteName;
- (BOOL)hasWrittenRouteName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORouteTrafficDetail)init;
- (GEORouteTrafficDetail)initWithData:(id)a3;
- (GEORouteTrafficDetail)initWithDictionary:(id)a3;
- (GEORouteTrafficDetail)initWithJSON:(id)a3;
- (NSString)spokenRouteName;
- (NSString)unabbreviatedRouteName;
- (NSString)writtenRouteName;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)routeTrafficConditionAsString:(int)a3;
- (int)StringAsRouteTrafficCondition:(id)a3;
- (int)routeTrafficCondition;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readSpokenRouteName;
- (void)_readUnabbreviatedRouteName;
- (void)_readWrittenRouteName;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasRouteTrafficCondition:(BOOL)a3;
- (void)setRouteTrafficCondition:(int)a3;
- (void)setSpokenRouteName:(id)a3;
- (void)setUnabbreviatedRouteName:(id)a3;
- (void)setWrittenRouteName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORouteTrafficDetail

- (GEORouteTrafficDetail)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORouteTrafficDetail;
  v2 = [(GEORouteTrafficDetail *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORouteTrafficDetail)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORouteTrafficDetail;
  v3 = [(GEORouteTrafficDetail *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)routeTrafficCondition
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_routeTrafficCondition;
  }
  else {
    return 0;
  }
}

- (void)setRouteTrafficCondition:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_routeTrafficCondition = a3;
}

- (void)setHasRouteTrafficCondition:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasRouteTrafficCondition
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)routeTrafficConditionAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E0698[a3];
  }

  return v3;
}

- (int)StringAsRouteTrafficCondition:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TRAFFIC_CONDITION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_CONDITION_EXTREMELY_LIGHT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_CONDITION_LIGHT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_CONDITION_MEDIUM"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_CONDITION_HEAVY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_CONDITION_EXTREMELY_HEAVY"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readWrittenRouteName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteTrafficDetailReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWrittenRouteName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasWrittenRouteName
{
  return self->_writtenRouteName != 0;
}

- (NSString)writtenRouteName
{
  -[GEORouteTrafficDetail _readWrittenRouteName]((uint64_t)self);
  writtenRouteName = self->_writtenRouteName;

  return writtenRouteName;
}

- (void)setWrittenRouteName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_writtenRouteName, a3);
}

- (void)_readSpokenRouteName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteTrafficDetailReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpokenRouteName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSpokenRouteName
{
  return self->_spokenRouteName != 0;
}

- (NSString)spokenRouteName
{
  -[GEORouteTrafficDetail _readSpokenRouteName]((uint64_t)self);
  spokenRouteName = self->_spokenRouteName;

  return spokenRouteName;
}

- (void)setSpokenRouteName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_spokenRouteName, a3);
}

- (void)_readUnabbreviatedRouteName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteTrafficDetailReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUnabbreviatedRouteName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasUnabbreviatedRouteName
{
  return self->_unabbreviatedRouteName != 0;
}

- (NSString)unabbreviatedRouteName
{
  -[GEORouteTrafficDetail _readUnabbreviatedRouteName]((uint64_t)self);
  unabbreviatedRouteName = self->_unabbreviatedRouteName;

  return unabbreviatedRouteName;
}

- (void)setUnabbreviatedRouteName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_unabbreviatedRouteName, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORouteTrafficDetail;
  int v4 = [(GEORouteTrafficDetail *)&v8 description];
  v5 = [(GEORouteTrafficDetail *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteTrafficDetail _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v5 = *(int *)(a1 + 60);
      if (v5 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E0698[v5];
      }
      if (a2) {
        objc_super v7 = @"routeTrafficCondition";
      }
      else {
        objc_super v7 = @"route_traffic_condition";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 writtenRouteName];
    if (v8)
    {
      if (a2) {
        v9 = @"writtenRouteName";
      }
      else {
        v9 = @"written_route_name";
      }
      [v4 setObject:v8 forKey:v9];
    }

    v10 = [(id)a1 spokenRouteName];
    if (v10)
    {
      if (a2) {
        v11 = @"spokenRouteName";
      }
      else {
        v11 = @"spoken_route_name";
      }
      [v4 setObject:v10 forKey:v11];
    }

    v12 = [(id)a1 unabbreviatedRouteName];
    if (v12)
    {
      if (a2) {
        v13 = @"unabbreviatedRouteName";
      }
      else {
        v13 = @"unabbreviated_route_name";
      }
      [v4 setObject:v12 forKey:v13];
    }

    v14 = *(void **)(a1 + 16);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __51__GEORouteTrafficDetail__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
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
  return -[GEORouteTrafficDetail _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEORouteTrafficDetail__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORouteTrafficDetail)initWithDictionary:(id)a3
{
  return (GEORouteTrafficDetail *)-[GEORouteTrafficDetail _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_40;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_40;
  }
  if (a3) {
    objc_super v6 = @"routeTrafficCondition";
  }
  else {
    objc_super v6 = @"route_traffic_condition";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"TRAFFIC_CONDITION_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"TRAFFIC_CONDITION_EXTREMELY_LIGHT"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"TRAFFIC_CONDITION_LIGHT"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"TRAFFIC_CONDITION_MEDIUM"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"TRAFFIC_CONDITION_HEAVY"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"TRAFFIC_CONDITION_EXTREMELY_HEAVY"])
    {
      uint64_t v9 = 5;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_23:
    [a1 setRouteTrafficCondition:v9];
  }

  if (a3) {
    id v10 = @"writtenRouteName";
  }
  else {
    id v10 = @"written_route_name";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = (void *)[v11 copy];
    [a1 setWrittenRouteName:v12];
  }
  if (a3) {
    v13 = @"spokenRouteName";
  }
  else {
    v13 = @"spoken_route_name";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = (void *)[v14 copy];
    [a1 setSpokenRouteName:v15];
  }
  if (a3) {
    v16 = @"unabbreviatedRouteName";
  }
  else {
    v16 = @"unabbreviated_route_name";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = (void *)[v17 copy];
    [a1 setUnabbreviatedRouteName:v18];
  }
LABEL_40:

  return a1;
}

- (GEORouteTrafficDetail)initWithJSON:(id)a3
{
  return (GEORouteTrafficDetail *)-[GEORouteTrafficDetail _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_6653;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_6654;
    }
    GEORouteTrafficDetailReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteTrafficDetailIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteTrafficDetailReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3C) == 0))
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
    [(GEORouteTrafficDetail *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_writtenRouteName)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_spokenRouteName)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_unabbreviatedRouteName)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORouteTrafficDetail *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 15) = self->_routeTrafficCondition;
    *((unsigned char *)v5 + 64) |= 1u;
  }
  if (self->_writtenRouteName)
  {
    objc_msgSend(v5, "setWrittenRouteName:");
    int v4 = v5;
  }
  if (self->_spokenRouteName)
  {
    objc_msgSend(v5, "setSpokenRouteName:");
    int v4 = v5;
  }
  if (self->_unabbreviatedRouteName)
  {
    objc_msgSend(v5, "setUnabbreviatedRouteName:");
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORouteTrafficDetailReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORouteTrafficDetail *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_routeTrafficCondition;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_writtenRouteName copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_spokenRouteName copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  uint64_t v13 = [(NSString *)self->_unabbreviatedRouteName copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  v15 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEORouteTrafficDetail *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_routeTrafficCondition != *((_DWORD *)v4 + 15)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  writtenRouteName = self->_writtenRouteName;
  if ((unint64_t)writtenRouteName | *((void *)v4 + 5)
    && !-[NSString isEqual:](writtenRouteName, "isEqual:"))
  {
    goto LABEL_13;
  }
  spokenRouteName = self->_spokenRouteName;
  if ((unint64_t)spokenRouteName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](spokenRouteName, "isEqual:")) {
      goto LABEL_13;
    }
  }
  unabbreviatedRouteName = self->_unabbreviatedRouteName;
  if ((unint64_t)unabbreviatedRouteName | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](unabbreviatedRouteName, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  [(GEORouteTrafficDetail *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_routeTrafficCondition;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_writtenRouteName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_spokenRouteName hash];
  return v4 ^ v5 ^ [(NSString *)self->_unabbreviatedRouteName hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v5 = (int *)a3;
  [v5 readAll:0];
  NSUInteger v4 = v5;
  if (v5[16])
  {
    self->_routeTrafficCondition = v5[15];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 5))
  {
    [(GEORouteTrafficDetail *)self setWrittenRouteName:"setWrittenRouteName:"];
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    [(GEORouteTrafficDetail *)self setSpokenRouteName:"setSpokenRouteName:"];
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    [(GEORouteTrafficDetail *)self setUnabbreviatedRouteName:"setUnabbreviatedRouteName:"];
    NSUInteger v4 = v5;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEORouteTrafficDetailReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6658);
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
  *(unsigned char *)&self->_flags |= 0x22u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORouteTrafficDetail *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writtenRouteName, 0);
  objc_storeStrong((id *)&self->_unabbreviatedRouteName, 0);
  objc_storeStrong((id *)&self->_spokenRouteName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end