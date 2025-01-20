@interface GEOPDStorefrontBundle
+ (BOOL)isValid:(id)a3;
+ (Class)faceType;
- (BOOL)hasIdentifier;
- (BOOL)hasMatchedMuid;
- (BOOL)hasPresentation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDStorefrontBundle)init;
- (GEOPDStorefrontBundle)initWithData:(id)a3;
- (GEOPDStorefrontBundle)initWithDictionary:(id)a3;
- (GEOPDStorefrontBundle)initWithJSON:(id)a3;
- (GEOPDStorefrontPresentation)presentation;
- (NSMutableArray)faces;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)faceAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)facesCount;
- (unint64_t)hash;
- (unint64_t)identifier;
- (unint64_t)matchedMuid;
- (void)_addNoFlagsFace:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readFaces;
- (void)_readPresentation;
- (void)addFace:(id)a3;
- (void)clearFaces;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setFaces:(id)a3;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setHasMatchedMuid:(BOOL)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setMatchedMuid:(unint64_t)a3;
- (void)setPresentation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDStorefrontBundle

- (GEOPDStorefrontBundle)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDStorefrontBundle;
  v2 = [(GEOPDStorefrontBundle *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDStorefrontBundle)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDStorefrontBundle;
  v3 = [(GEOPDStorefrontBundle *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasIdentifier
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readPresentation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDStorefrontBundleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPresentation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasPresentation
{
  return self->_presentation != 0;
}

- (GEOPDStorefrontPresentation)presentation
{
  -[GEOPDStorefrontBundle _readPresentation]((uint64_t)self);
  presentation = self->_presentation;

  return presentation;
}

- (void)setPresentation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_presentation, a3);
}

- (void)_readFaces
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDStorefrontBundleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFaces_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)faces
{
  -[GEOPDStorefrontBundle _readFaces]((uint64_t)self);
  faces = self->_faces;

  return faces;
}

- (void)setFaces:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  faces = self->_faces;
  self->_faces = v4;
}

- (void)clearFaces
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  faces = self->_faces;

  [(NSMutableArray *)faces removeAllObjects];
}

- (void)addFace:(id)a3
{
  id v4 = a3;
  -[GEOPDStorefrontBundle _readFaces]((uint64_t)self);
  -[GEOPDStorefrontBundle _addNoFlagsFace:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsFace:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)facesCount
{
  -[GEOPDStorefrontBundle _readFaces]((uint64_t)self);
  faces = self->_faces;

  return [(NSMutableArray *)faces count];
}

- (id)faceAtIndex:(unint64_t)a3
{
  -[GEOPDStorefrontBundle _readFaces]((uint64_t)self);
  faces = self->_faces;

  return (id)[(NSMutableArray *)faces objectAtIndex:a3];
}

+ (Class)faceType
{
  return (Class)objc_opt_class();
}

- (unint64_t)matchedMuid
{
  return self->_matchedMuid;
}

- (void)setMatchedMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  self->_matchedMuid = a3;
}

- (void)setHasMatchedMuid:(BOOL)a3
{
  if (a3) {
    char v3 = 18;
  }
  else {
    char v3 = 16;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasMatchedMuid
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDStorefrontBundle;
  id v4 = [(GEOPDStorefrontBundle *)&v8 description];
  id v5 = [(GEOPDStorefrontBundle *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDStorefrontBundle _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 60))
    {
      id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      [v4 setObject:v5 forKey:@"identifier"];
    }
    objc_super v6 = [(id)a1 presentation];
    id v7 = v6;
    if (v6)
    {
      if (a2) {
        [v6 jsonRepresentation];
      }
      else {
      objc_super v8 = [v6 dictionaryRepresentation];
      }
      [v4 setObject:v8 forKey:@"presentation"];
    }
    if ([*(id *)(a1 + 16) count])
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v10 = *(id *)(a1 + 16);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = objc_msgSend(v15, "dictionaryRepresentation", (void)v20);
            }
            objc_msgSend(v9, "addObject:", v16, (void)v20);
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v12);
      }

      [v4 setObject:v9 forKey:@"face"];
    }
    if ((*(unsigned char *)(a1 + 60) & 2) != 0)
    {
      v17 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      if (a2) {
        v18 = @"matchedMuid";
      }
      else {
        v18 = @"matched_muid";
      }
      objc_msgSend(v4, "setObject:forKey:", v17, v18, (void)v20);
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
  return -[GEOPDStorefrontBundle _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDStorefrontBundle)initWithDictionary:(id)a3
{
  return (GEOPDStorefrontBundle *)-[GEOPDStorefrontBundle _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"identifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIdentifier:", objc_msgSend(v6, "unsignedLongLongValue"));
      }

      id v7 = [v5 objectForKeyedSubscript:@"presentation"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOPDStorefrontPresentation alloc];
        if (a3) {
          uint64_t v9 = [(GEOPDStorefrontPresentation *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOPDStorefrontPresentation *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setPresentation:v9];
      }
      uint64_t v11 = [v5 objectForKeyedSubscript:@"face"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v24 = v11;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v18 = [GEOPDStorefrontFace alloc];
                if (a3) {
                  uint64_t v19 = [(GEOPDStorefrontFace *)v18 initWithJSON:v17];
                }
                else {
                  uint64_t v19 = [(GEOPDStorefrontFace *)v18 initWithDictionary:v17];
                }
                long long v20 = (void *)v19;
                [a1 addFace:v19];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v14);
        }

        uint64_t v11 = v24;
      }

      if (a3) {
        long long v21 = @"matchedMuid";
      }
      else {
        long long v21 = @"matched_muid";
      }
      long long v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMatchedMuid:", objc_msgSend(v22, "unsignedLongLongValue"));
      }
    }
  }

  return a1;
}

- (GEOPDStorefrontBundle)initWithJSON:(id)a3
{
  return (GEOPDStorefrontBundle *)-[GEOPDStorefrontBundle _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_28;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_28;
    }
    GEOPDStorefrontBundleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDStorefrontBundleCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDStorefrontBundleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDStorefrontBundleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDStorefrontBundleIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOPDStorefrontBundle *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_presentation) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_faces;
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

    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint64Field();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOPDStorefrontBundle *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    v8[3] = self->_identifier;
    *((unsigned char *)v8 + 60) |= 1u;
  }
  if (self->_presentation) {
    objc_msgSend(v8, "setPresentation:");
  }
  if ([(GEOPDStorefrontBundle *)self facesCount])
  {
    [v8 clearFaces];
    unint64_t v4 = [(GEOPDStorefrontBundle *)self facesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDStorefrontBundle *)self faceAtIndex:i];
        [v8 addFace:v7];
      }
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v8[4] = self->_matchedMuid;
    *((unsigned char *)v8 + 60) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
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
      GEOPDStorefrontBundleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDStorefrontBundle *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 24) = self->_identifier;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  id v9 = [(GEOPDStorefrontPresentation *)self->_presentation copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = self->_faces;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [(id)v5 addFace:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(void *)(v5 + 32) = self->_matchedMuid;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEOPDStorefrontBundle *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_identifier != *((void *)v4 + 3)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  presentation = self->_presentation;
  if ((unint64_t)presentation | *((void *)v4 + 5)
    && !-[GEOPDStorefrontPresentation isEqual:](presentation, "isEqual:"))
  {
    goto LABEL_15;
  }
  faces = self->_faces;
  if ((unint64_t)faces | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](faces, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_matchedMuid != *((void *)v4 + 4)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPDStorefrontBundle *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_identifier;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDStorefrontPresentation *)self->_presentation hash];
  uint64_t v5 = [(NSMutableArray *)self->_faces hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    unint64_t v6 = 2654435761u * self->_matchedMuid;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 60))
  {
    self->_identifier = *((void *)v4 + 3);
    *(unsigned char *)&self->_flags |= 1u;
  }
  presentation = self->_presentation;
  uint64_t v6 = *((void *)v4 + 5);
  if (presentation)
  {
    if (v6) {
      -[GEOPDStorefrontPresentation mergeFrom:](presentation, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOPDStorefrontBundle setPresentation:](self, "setPresentation:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEOPDStorefrontBundle addFace:](self, "addFace:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    self->_matchedMuid = *((void *)v4 + 4);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_faces, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end