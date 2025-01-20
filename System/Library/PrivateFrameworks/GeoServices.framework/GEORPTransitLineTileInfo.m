@interface GEORPTransitLineTileInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasTransitLineMuid;
- (BOOL)hasTransitLineName;
- (BOOL)hasTransitSystemName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPTransitLineTileInfo)init;
- (GEORPTransitLineTileInfo)initWithData:(id)a3;
- (GEORPTransitLineTileInfo)initWithDictionary:(id)a3;
- (GEORPTransitLineTileInfo)initWithJSON:(id)a3;
- (NSString)transitLineName;
- (NSString)transitSystemName;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)transitLineMuid;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readTransitLineName;
- (void)_readTransitSystemName;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasTransitLineMuid:(BOOL)a3;
- (void)setTransitLineMuid:(unint64_t)a3;
- (void)setTransitLineName:(id)a3;
- (void)setTransitSystemName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPTransitLineTileInfo

- (GEORPTransitLineTileInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPTransitLineTileInfo;
  v2 = [(GEORPTransitLineTileInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPTransitLineTileInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPTransitLineTileInfo;
  v3 = [(GEORPTransitLineTileInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)transitLineMuid
{
  return self->_transitLineMuid;
}

- (void)setTransitLineMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_transitLineMuid = a3;
}

- (void)setHasTransitLineMuid:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasTransitLineMuid
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readTransitLineName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitLineTileInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitLineName_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTransitLineName
{
  return self->_transitLineName != 0;
}

- (NSString)transitLineName
{
  -[GEORPTransitLineTileInfo _readTransitLineName]((uint64_t)self);
  transitLineName = self->_transitLineName;

  return transitLineName;
}

- (void)setTransitLineName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_transitLineName, a3);
}

- (void)_readTransitSystemName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitLineTileInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitSystemName_tags_1);
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
  -[GEORPTransitLineTileInfo _readTransitSystemName]((uint64_t)self);
  transitSystemName = self->_transitSystemName;

  return transitSystemName;
}

- (void)setTransitSystemName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_transitSystemName, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPTransitLineTileInfo;
  v4 = [(GEORPTransitLineTileInfo *)&v8 description];
  v5 = [(GEORPTransitLineTileInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPTransitLineTileInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 52))
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
      if (a2) {
        objc_super v6 = @"transitLineMuid";
      }
      else {
        objc_super v6 = @"transit_line_muid";
      }
      [v4 setObject:v5 forKey:v6];
    }
    objc_super v7 = [(id)a1 transitLineName];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"transitLineName";
      }
      else {
        objc_super v8 = @"transit_line_name";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [(id)a1 transitSystemName];
    if (v9)
    {
      if (a2) {
        v10 = @"transitSystemName";
      }
      else {
        v10 = @"transit_system_name";
      }
      [v4 setObject:v9 forKey:v10];
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
  return -[GEORPTransitLineTileInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPTransitLineTileInfo)initWithDictionary:(id)a3
{
  return (GEORPTransitLineTileInfo *)-[GEORPTransitLineTileInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"transitLineMuid";
      }
      else {
        objc_super v6 = @"transit_line_muid";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTransitLineMuid:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      if (a3) {
        objc_super v8 = @"transitLineName";
      }
      else {
        objc_super v8 = @"transit_line_name";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = (void *)[v9 copy];
        [a1 setTransitLineName:v10];
      }
      if (a3) {
        v11 = @"transitSystemName";
      }
      else {
        v11 = @"transit_system_name";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = (void *)[v12 copy];
        [a1 setTransitSystemName:v13];
      }
    }
  }

  return a1;
}

- (GEORPTransitLineTileInfo)initWithJSON:(id)a3
{
  return (GEORPTransitLineTileInfo *)-[GEORPTransitLineTileInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3325;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3326;
    }
    GEORPTransitLineTileInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPTransitLineTileInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPTransitLineTileInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
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
    [(GEORPTransitLineTileInfo *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_transitLineName) {
      PBDataWriterWriteStringField();
    }
    if (self->_transitSystemName) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPTransitLineTileInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    v5[2] = self->_transitLineMuid;
    *((unsigned char *)v5 + 52) |= 1u;
  }
  if (self->_transitLineName)
  {
    objc_msgSend(v5, "setTransitLineName:");
    v4 = v5;
  }
  if (self->_transitSystemName)
  {
    objc_msgSend(v5, "setTransitSystemName:");
    v4 = v5;
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
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPTransitLineTileInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPTransitLineTileInfo *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 16) = self->_transitLineMuid;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_transitLineName copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_transitSystemName copyWithZone:a3];
  id v8 = *(id *)(v5 + 32);
  *(void *)(v5 + 32) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEORPTransitLineTileInfo *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_transitLineMuid != *((void *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  transitLineName = self->_transitLineName;
  if ((unint64_t)transitLineName | *((void *)v4 + 3)
    && !-[NSString isEqual:](transitLineName, "isEqual:"))
  {
    goto LABEL_11;
  }
  transitSystemName = self->_transitSystemName;
  if ((unint64_t)transitSystemName | *((void *)v4 + 4)) {
    char v7 = -[NSString isEqual:](transitSystemName, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEORPTransitLineTileInfo *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_transitLineMuid;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_transitLineName hash] ^ v3;
  return v4 ^ [(NSString *)self->_transitSystemName hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (unint64_t *)a3;
  [v5 readAll:0];
  NSUInteger v4 = v5;
  if (*((unsigned char *)v5 + 52))
  {
    self->_transitLineMuid = v5[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (v5[3])
  {
    -[GEORPTransitLineTileInfo setTransitLineName:](self, "setTransitLineName:");
    NSUInteger v4 = v5;
  }
  if (v4[4])
  {
    -[GEORPTransitLineTileInfo setTransitSystemName:](self, "setTransitSystemName:");
    NSUInteger v4 = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitSystemName, 0);
  objc_storeStrong((id *)&self->_transitLineName, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end