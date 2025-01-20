@interface GEOABBranchInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAbBranchId;
- (BOOL)hasMultilayerAbBranchId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOABBranchInfo)init;
- (GEOABBranchInfo)initWithData:(id)a3;
- (GEOABBranchInfo)initWithDictionary:(id)a3;
- (GEOABBranchInfo)initWithJSON:(id)a3;
- (NSString)abBranchId;
- (NSString)multilayerAbBranchId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAbBranchId;
- (void)_readMultilayerAbBranchId;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbBranchId:(id)a3;
- (void)setMultilayerAbBranchId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOABBranchInfo

- (GEOABBranchInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOABBranchInfo;
  v2 = [(GEOABBranchInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOABBranchInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOABBranchInfo;
  v3 = [(GEOABBranchInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAbBranchId
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
        GEOABBranchInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbBranchId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAbBranchId
{
  return self->_abBranchId != 0;
}

- (NSString)abBranchId
{
  -[GEOABBranchInfo _readAbBranchId]((uint64_t)self);
  abBranchId = self->_abBranchId;

  return abBranchId;
}

- (void)setAbBranchId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_abBranchId, a3);
}

- (void)_readMultilayerAbBranchId
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
        GEOABBranchInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMultilayerAbBranchId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasMultilayerAbBranchId
{
  return self->_multilayerAbBranchId != 0;
}

- (NSString)multilayerAbBranchId
{
  -[GEOABBranchInfo _readMultilayerAbBranchId]((uint64_t)self);
  multilayerAbBranchId = self->_multilayerAbBranchId;

  return multilayerAbBranchId;
}

- (void)setMultilayerAbBranchId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_multilayerAbBranchId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOABBranchInfo;
  v4 = [(GEOABBranchInfo *)&v8 description];
  v5 = [(GEOABBranchInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOABBranchInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 abBranchId];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"abBranchId";
      }
      else {
        objc_super v6 = @"ab_branch_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 multilayerAbBranchId];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"multilayerAbBranchId";
      }
      else {
        objc_super v8 = @"multilayer_ab_branch_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = (void *)a1[2];
    if (v9)
    {
      v10 = [v9 dictionaryRepresentation];
      v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __45__GEOABBranchInfo__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
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
  return -[GEOABBranchInfo _dictionaryRepresentation:](self, 1);
}

void __45__GEOABBranchInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOABBranchInfo)initWithDictionary:(id)a3
{
  return (GEOABBranchInfo *)-[GEOABBranchInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"abBranchId";
      }
      else {
        objc_super v6 = @"ab_branch_id";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setAbBranchId:v8];
      }
      if (a3) {
        v9 = @"multilayerAbBranchId";
      }
      else {
        v9 = @"multilayer_ab_branch_id";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setMultilayerAbBranchId:v11];
      }
    }
  }

  return a1;
}

- (GEOABBranchInfo)initWithJSON:(id)a3
{
  return (GEOABBranchInfo *)-[GEOABBranchInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_311_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_312_0;
    }
    GEOABBranchInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOABBranchInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOABBranchInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
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
    [(GEOABBranchInfo *)self readAll:0];
    if (self->_abBranchId) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_multilayerAbBranchId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOABBranchInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_abBranchId) {
    objc_msgSend(v4, "setAbBranchId:");
  }
  if (self->_multilayerAbBranchId) {
    objc_msgSend(v4, "setMultilayerAbBranchId:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOABBranchInfo *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_abBranchId copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSString *)self->_multilayerAbBranchId copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOABBranchInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOABBranchInfo *)self readAll:1],
         [v4 readAll:1],
         abBranchId = self->_abBranchId,
         !((unint64_t)abBranchId | v4[3]))
     || -[NSString isEqual:](abBranchId, "isEqual:")))
  {
    multilayerAbBranchId = self->_multilayerAbBranchId;
    if ((unint64_t)multilayerAbBranchId | v4[4]) {
      char v7 = -[NSString isEqual:](multilayerAbBranchId, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  [(GEOABBranchInfo *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_abBranchId hash];
  return [(NSString *)self->_multilayerAbBranchId hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  [v4 readAll:0];
  if (v4[3]) {
    -[GEOABBranchInfo setAbBranchId:](self, "setAbBranchId:");
  }
  if (v4[4]) {
    -[GEOABBranchInfo setMultilayerAbBranchId:](self, "setMultilayerAbBranchId:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOABBranchInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_316_0);
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
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOABBranchInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multilayerAbBranchId, 0);
  objc_storeStrong((id *)&self->_abBranchId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end