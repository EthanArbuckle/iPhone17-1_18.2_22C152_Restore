@interface GEOPhoto
+ (BOOL)isValid:(id)a3;
+ (Class)photoInfoType;
- (BOOL)hasPhotoType;
- (BOOL)hasUid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPhoto)init;
- (GEOPhoto)initWithData:(id)a3;
- (GEOPhoto)initWithDictionary:(id)a3;
- (GEOPhoto)initWithJSON:(id)a3;
- (GEOPhoto)initWithPlaceDataPhoto:(id)a3;
- (NSMutableArray)photoInfos;
- (NSString)uid;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)photoInfoAtIndex:(unint64_t)a3;
- (id)photoTypeAsString:(int)a3;
- (int)StringAsPhotoType:(id)a3;
- (int)photoType;
- (unint64_t)hash;
- (unint64_t)photoInfosCount;
- (void)_addNoFlagsPhotoInfo:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readPhotoInfos;
- (void)_readUid;
- (void)addPhotoInfo:(id)a3;
- (void)clearPhotoInfos;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasPhotoType:(BOOL)a3;
- (void)setPhotoInfos:(id)a3;
- (void)setPhotoType:(int)a3;
- (void)setUid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPhoto

- (GEOPhoto)initWithPlaceDataPhoto:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOPhoto;
  v5 = [(GEOPhoto *)&v21 init];
  if (v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v6 = -[GEOPDPhoto photoVersions](v4);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
          v12 = [GEOPhotoInfo alloc];
          v13 = -[GEOPhotoInfo initWithPlaceDataPhotoContent:](v12, "initWithPlaceDataPhotoContent:", v11, (void)v17);
          [(GEOPhoto *)v5 addPhotoInfo:v13];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v8);
    }

    v14 = -[GEOPDPhoto photoId](v4);
    [(GEOPhoto *)v5 setUid:v14];

    v15 = v5;
  }

  return v5;
}

- (void)addPhotoInfo:(id)a3
{
  id v4 = a3;
  -[GEOPhoto _readPhotoInfos]((uint64_t)self);
  -[GEOPhoto _addNoFlagsPhotoInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsPhotoInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readPhotoInfos
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
        GEOPhotoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)setUid:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_uid, a3);
}

- (GEOPhoto)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPhoto;
  v2 = [(GEOPhoto *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPhoto)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPhoto;
  id v3 = [(GEOPhoto *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (int)photoType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_photoType;
  }
  else {
    return 0;
  }
}

- (void)setPhotoType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_photoType = a3;
}

- (void)setHasPhotoType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasPhotoType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)photoTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E6FD8[a3];
  }

  return v3;
}

- (int)StringAsPhotoType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STOREFRONT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TOP_RATED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"USER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PRIMARY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"STANDARD"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSMutableArray)photoInfos
{
  -[GEOPhoto _readPhotoInfos]((uint64_t)self);
  photoInfos = self->_photoInfos;

  return photoInfos;
}

- (void)setPhotoInfos:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  photoInfos = self->_photoInfos;
  self->_photoInfos = v4;
}

- (void)clearPhotoInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  photoInfos = self->_photoInfos;

  [(NSMutableArray *)photoInfos removeAllObjects];
}

- (unint64_t)photoInfosCount
{
  -[GEOPhoto _readPhotoInfos]((uint64_t)self);
  photoInfos = self->_photoInfos;

  return [(NSMutableArray *)photoInfos count];
}

- (id)photoInfoAtIndex:(unint64_t)a3
{
  -[GEOPhoto _readPhotoInfos]((uint64_t)self);
  photoInfos = self->_photoInfos;

  return (id)[(NSMutableArray *)photoInfos objectAtIndex:a3];
}

+ (Class)photoInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readUid
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
        GEOPhotoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUid_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasUid
{
  return self->_uid != 0;
}

- (NSString)uid
{
  -[GEOPhoto _readUid]((uint64_t)self);
  uid = self->_uid;

  return uid;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPhoto;
  int v4 = [(GEOPhoto *)&v8 description];
  id v5 = [(GEOPhoto *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPhoto _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v5 = *(int *)(a1 + 52);
      if (v5 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E6FD8[v5];
      }
      [v4 setObject:v6 forKey:@"photoType"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      objc_super v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v8 = *(id *)(a1 + 24);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v10);
      }

      [v4 setObject:v7 forKey:@"photoInfo"];
    }
    v15 = [(id)a1 uid];
    if (v15) {
      [v4 setObject:v15 forKey:@"uid"];
    }

    v16 = *(void **)(a1 + 16);
    if (v16)
    {
      long long v17 = [v16 dictionaryRepresentation];
      long long v18 = v17;
      if (a2)
      {
        long long v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __38__GEOPhoto__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        long long v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
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
  return -[GEOPhoto _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __38__GEOPhoto__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPhoto)initWithDictionary:(id)a3
{
  return (GEOPhoto *)-[GEOPhoto _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_36;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_36;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"photoType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"STOREFRONT"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"TOP_RATED"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"USER"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"PRIMARY"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"STANDARD"])
    {
      uint64_t v8 = 4;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_18:
    [a1 setPhotoType:v8];
  }

  uint64_t v9 = [v5 objectForKeyedSubscript:@"photoInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v5;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 = [GEOPhotoInfo alloc];
            if (a3) {
              uint64_t v17 = [(GEOPhotoInfo *)v16 initWithJSON:v15];
            }
            else {
              uint64_t v17 = [(GEOPhotoInfo *)v16 initWithDictionary:v15];
            }
            long long v18 = (void *)v17;
            [a1 addPhotoInfo:v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    id v5 = v22;
  }

  long long v19 = [v5 objectForKeyedSubscript:@"uid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = (void *)[v19 copy];
    [a1 setUid:v20];
  }
LABEL_36:

  return a1;
}

- (GEOPhoto)initWithJSON:(id)a3
{
  return (GEOPhoto *)-[GEOPhoto _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_1733;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_1734;
    }
    GEOPhotoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPhotoCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPhotoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPhotoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPhoto *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_photoInfos;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_uid) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOPhoto *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 10) = self->_readerMarkPos;
  *((_DWORD *)v8 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v8 + 13) = self->_photoType;
    *((unsigned char *)v8 + 56) |= 1u;
  }
  if ([(GEOPhoto *)self photoInfosCount])
  {
    [v8 clearPhotoInfos];
    unint64_t v4 = [(GEOPhoto *)self photoInfosCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPhoto *)self photoInfoAtIndex:i];
        [v8 addPhotoInfo:v7];
      }
    }
  }
  if (self->_uid) {
    objc_msgSend(v8, "setUid:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPhotoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPhoto *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_photoType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = self->_photoInfos;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addPhotoInfo:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_uid copyWithZone:a3];
  long long v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOPhoto *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_photoType != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  photoInfos = self->_photoInfos;
  if ((unint64_t)photoInfos | *((void *)v4 + 3)
    && !-[NSMutableArray isEqual:](photoInfos, "isEqual:"))
  {
    goto LABEL_11;
  }
  uid = self->_uid;
  if ((unint64_t)uid | *((void *)v4 + 4)) {
    char v7 = -[NSString isEqual:](uid, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPhoto *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_photoType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_photoInfos hash] ^ v3;
  return v4 ^ [(NSString *)self->_uid hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 56))
  {
    self->_photoType = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOPhoto addPhotoInfo:](self, "addPhotoInfo:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 4)) {
    -[GEOPhoto setUid:](self, "setUid:");
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
      id v5 = reader;
      objc_sync_enter(v5);
      GEOPhotoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1738);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPhoto *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_photoInfos;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_photoInfos, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end