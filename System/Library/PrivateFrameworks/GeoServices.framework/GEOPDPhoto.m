@interface GEOPDPhoto
+ (id)photosForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPhoto)init;
- (GEOPDPhoto)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)bestURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)photoId;
- (id)photoVersions;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)_addNoFlagsPhotoVersion:(uint64_t)a1;
- (void)_readPhotoId;
- (void)_readPhotoVersions;
- (void)addPhotoVersion:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setPhotoId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPhoto

- (GEOPDPhoto)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPhoto;
  v2 = [(GEOPDPhoto *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)photoVersions
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPhoto _readPhotoVersions]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPhotoVersions
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
        GEOPDPhotoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoVersions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)_addNoFlagsPhotoVersion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)photoId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPhoto _readPhotoId]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPhotoId
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
        GEOPDPhotoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
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
        objc_super v6 = (int *)&readAll__recursiveTag_6870;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_6871;
      }
      GEOPDPhotoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDPhotoCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoVersions, 0);
  objc_storeStrong((id *)&self->_photoId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

+ (id)photosForPlaceData:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = [v3 array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__GEOPDPhoto_PlaceDataExtras__photosForPlaceData___block_invoke;
  v10[3] = &unk_1E53E1940;
  id v11 = v5;
  id v6 = v5;
  [v4 enumerateValidComponentValuesOfType:8 usingBlock:v10];

  if ([v6 count]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

void __50__GEOPDPhoto_PlaceDataExtras__photosForPlaceData___block_invoke(uint64_t a1, id *a2)
{
  id v3 = -[GEOPDComponentValue photo](a2);
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

- (id)bestURL
{
  v2 = -[GEOPDPhoto photoVersions]((id *)&self->super.super.isa);
  id v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_77];
  id v4 = [v3 lastObject];

  id v5 = -[GEOPDPhotoContent url](v4);

  return v5;
}

uint64_t __38__GEOPDPhoto_PlaceDataExtras__bestURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 _area];
  unint64_t v6 = [v4 _area];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 52) |= 1u;
    *(unsigned char *)(a1 + 52) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDPhoto readAll:](a1, 0);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
          if (v8)
          {
            v9 = *(void **)(v8 + 8);
            *(void *)(v8 + 8) = 0;
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

- (GEOPDPhoto)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPhoto;
  id v3 = [(GEOPDPhoto *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)setPhotoId:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 52) |= 2u;
  *(unsigned char *)(a1 + 52) |= 8u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)addPhotoVersion:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPhoto _readPhotoVersions](a1);
    -[GEOPDPhoto _addNoFlagsPhotoVersion:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 52) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 52) |= 8u;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPhoto;
  id v4 = [(GEOPDPhoto *)&v8 description];
  uint64_t v5 = [(GEOPDPhoto *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPhoto _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDPhoto readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = -[GEOPDPhoto photoId]((id *)a1);
    if (v5)
    {
      if (a2) {
        uint64_t v6 = @"photoId";
      }
      else {
        uint64_t v6 = @"photo_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if ([*(id *)(a1 + 32) count])
    {
      objc_super v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v8 = *(id *)(a1 + 32);
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
            long long v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
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

      if (a2) {
        uint64_t v15 = @"photoVersion";
      }
      else {
        uint64_t v15 = @"photo_version";
      }
      [v4 setObject:v7 forKey:v15];
    }
    v16 = *(void **)(a1 + 16);
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __40__GEOPDPhoto__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPhoto _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOPDPhoto__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      objc_super v7 = @"photoId";
    }
    else {
      objc_super v7 = @"photo_id";
    }
    id v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = (void *)[v8 copy];
      -[GEOPDPhoto setPhotoId:](v6, v9);
    }
    if (a3) {
      id v10 = @"photoVersion";
    }
    else {
      id v10 = @"photo_version";
    }
    uint64_t v11 = [v5 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = v11;
      id v35 = v5;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (!v13) {
        goto LABEL_42;
      }
      uint64_t v14 = v13;
      uint64_t v15 = @"url_type";
      uint64_t v16 = *(void *)v39;
      if (a3) {
        uint64_t v15 = @"urlType";
      }
      uint64_t v36 = v6;
      v37 = v15;
      while (1)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(v12);
          }
          v18 = *(void **)(*((void *)&v38 + 1) + 8 * v17);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v19 = [GEOPDPhotoContent alloc];
            if (v19)
            {
              id v20 = v19;
              id v21 = v18;
              uint64_t v22 = [(GEOPDPhotoContent *)v20 init];
              if (v22)
              {
                v23 = [v21 objectForKeyedSubscript:@"width"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v24 = [v23 unsignedIntValue];
                  *(unsigned char *)(v22 + 36) |= 4u;
                  *(_DWORD *)(v22 + 32) = v24;
                }

                long long v25 = [v21 objectForKeyedSubscript:@"height"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v26 = [v25 unsignedIntValue];
                  *(unsigned char *)(v22 + 36) |= 1u;
                  *(_DWORD *)(v22 + 24) = v26;
                }

                long long v27 = [v21 objectForKeyedSubscript:@"url"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v28 = (void *)[v27 copy];
                  -[GEOPDPhotoContent setUrl:](v22, v28);
                }
                v29 = [v21 objectForKeyedSubscript:v37];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v30 = v29;
                  if ([v30 isEqualToString:@"URL_TYPE_REGULAR"]) {
                    int v31 = 0;
                  }
                  else {
                    int v31 = [v30 isEqualToString:@"URL_TYPE_AMP_TEMPLATE"];
                  }

LABEL_34:
                  *(unsigned char *)(v22 + 36) |= 2u;
                  *(_DWORD *)(v22 + 28) = v31;
                  uint64_t v6 = v36;
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    int v31 = [v29 intValue];
                    goto LABEL_34;
                  }
                }
              }
            }
            else
            {
              uint64_t v22 = 0;
            }
            -[GEOPDPhoto addPhotoVersion:](v6, (void *)v22);
          }
          ++v17;
        }
        while (v14 != v17);
        uint64_t v32 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
        uint64_t v14 = v32;
        if (!v32)
        {
LABEL_42:

          uint64_t v11 = v34;
          id v5 = v35;
          break;
        }
      }
    }
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPhotoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
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
    -[GEOPDPhoto readAll:]((uint64_t)self, 0);
    if (self->_photoId) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = self->_photoVersions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPhotoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPhoto readAll:]((uint64_t)self, 0);
  uint64_t v8 = [(NSString *)self->_photoId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = self->_photoVersions;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "copyWithZone:", a3, (void)v16);
        -[GEOPDPhoto addPhotoVersion:](v5, v14);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDPhoto readAll:]((uint64_t)self, 1),
         -[GEOPDPhoto readAll:]((uint64_t)v4, 1),
         photoId = self->_photoId,
         !((unint64_t)photoId | v4[3]))
     || -[NSString isEqual:](photoId, "isEqual:")))
  {
    photoVersions = self->_photoVersions;
    if ((unint64_t)photoVersions | v4[4]) {
      char v7 = -[NSMutableArray isEqual:](photoVersions, "isEqual:");
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
  -[GEOPDPhoto readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_photoId hash];
  return [(NSMutableArray *)self->_photoVersions hash] ^ v3;
}

@end