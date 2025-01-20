@interface GEOPBTransitSystem
+ (BOOL)isValid:(id)a3;
- (BOOL)hasArtwork;
- (BOOL)hasMuid;
- (BOOL)hasNameDisplayString;
- (BOOL)hasStyleAttributes;
- (BOOL)hasSystemIndex;
- (BOOL)hasWebsite;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBTransitArtwork)artwork;
- (GEOPBTransitSystem)init;
- (GEOPBTransitSystem)initWithData:(id)a3;
- (GEOPBTransitSystem)initWithDictionary:(id)a3;
- (GEOPBTransitSystem)initWithJSON:(id)a3;
- (GEOStyleAttributes)styleAttributes;
- (NSString)description;
- (NSString)nameDisplayString;
- (NSString)website;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)geoTransitSystem;
- (id)identifier;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)muid;
- (unsigned)systemIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readArtwork;
- (void)_readNameDisplayString;
- (void)_readStyleAttributes;
- (void)_readWebsite;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArtwork:(id)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasSystemIndex:(BOOL)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setNameDisplayString:(id)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setSystemIndex:(unsigned int)a3;
- (void)setWebsite:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitSystem

- (GEOPBTransitSystem)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitSystem;
  v2 = [(GEOPBTransitSystem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitSystem)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitSystem;
  v3 = [(GEOPBTransitSystem *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)systemIndex
{
  return self->_systemIndex;
}

- (void)setSystemIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_systemIndex = a3;
}

- (void)setHasSystemIndex:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSystemIndex
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasMuid
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readWebsite
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
        GEOPBTransitSystemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWebsite_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasWebsite
{
  return self->_website != 0;
}

- (NSString)website
{
  -[GEOPBTransitSystem _readWebsite]((uint64_t)self);
  website = self->_website;

  return website;
}

- (void)setWebsite:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_website, a3);
}

- (void)_readStyleAttributes
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
        GEOPBTransitSystemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_1085);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasStyleAttributes
{
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOPBTransitSystem _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readArtwork
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
        GEOPBTransitSystemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtwork_tags_1086);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasArtwork
{
  return self->_artwork != 0;
}

- (GEOPBTransitArtwork)artwork
{
  -[GEOPBTransitSystem _readArtwork]((uint64_t)self);
  artwork = self->_artwork;

  return artwork;
}

- (void)setArtwork:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void)_readNameDisplayString
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
        GEOPBTransitSystemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNameDisplayString_tags_1087);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasNameDisplayString
{
  return self->_nameDisplayString != 0;
}

- (NSString)nameDisplayString
{
  -[GEOPBTransitSystem _readNameDisplayString]((uint64_t)self);
  nameDisplayString = self->_nameDisplayString;

  return nameDisplayString;
}

- (void)setNameDisplayString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_nameDisplayString, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitSystem;
  v4 = [(GEOPBTransitSystem *)&v8 description];
  v5 = [(GEOPBTransitSystem *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitSystem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 80);
    if ((v5 & 2) != 0)
    {
      objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
      if (a2) {
        objc_super v7 = @"systemIndex";
      }
      else {
        objc_super v7 = @"system_index";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 80);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      [v4 setObject:v8 forKey:@"muid"];
    }
    v9 = [(id)a1 website];
    if (v9) {
      [v4 setObject:v9 forKey:@"website"];
    }

    v10 = [(id)a1 styleAttributes];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"styleAttributes";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"style_attributes";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = [(id)a1 artwork];
    v15 = v14;
    if (v14)
    {
      if (a2) {
        [v14 jsonRepresentation];
      }
      else {
      v16 = [v14 dictionaryRepresentation];
      }
      [v4 setObject:v16 forKey:@"artwork"];
    }
    v17 = [(id)a1 nameDisplayString];
    if (v17)
    {
      if (a2) {
        v18 = @"nameDisplayString";
      }
      else {
        v18 = @"name_display_string";
      }
      [v4 setObject:v17 forKey:v18];
    }

    v19 = *(void **)(a1 + 16);
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __48__GEOPBTransitSystem__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
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
  return -[GEOPBTransitSystem _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOPBTransitSystem__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitSystem)initWithDictionary:(id)a3
{
  return (GEOPBTransitSystem *)-[GEOPBTransitSystem _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"systemIndex";
      }
      else {
        objc_super v6 = @"system_index";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSystemIndex:", objc_msgSend(v7, "unsignedIntValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMuid:", objc_msgSend(v8, "unsignedLongLongValue"));
      }

      v9 = [v5 objectForKeyedSubscript:@"website"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = (void *)[v9 copy];
        [a1 setWebsite:v10];
      }
      if (a3) {
        v11 = @"styleAttributes";
      }
      else {
        v11 = @"style_attributes";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOStyleAttributes alloc];
        if (a3) {
          uint64_t v14 = [(GEOStyleAttributes *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOStyleAttributes *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setStyleAttributes:v14];
      }
      v16 = [v5 objectForKeyedSubscript:@"artwork"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [GEOPBTransitArtwork alloc];
        if (a3) {
          uint64_t v18 = [(GEOPBTransitArtwork *)v17 initWithJSON:v16];
        }
        else {
          uint64_t v18 = [(GEOPBTransitArtwork *)v17 initWithDictionary:v16];
        }
        v19 = (void *)v18;
        [a1 setArtwork:v18];
      }
      if (a3) {
        v20 = @"nameDisplayString";
      }
      else {
        v20 = @"name_display_string";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = (void *)[v21 copy];
        [a1 setNameDisplayString:v22];
      }
    }
  }

  return a1;
}

- (GEOPBTransitSystem)initWithJSON:(id)a3
{
  return (GEOPBTransitSystem *)-[GEOPBTransitSystem _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1091;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1092;
    }
    GEOPBTransitSystemReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOStyleAttributes *)self->_styleAttributes readAll:1];
    [(GEOPBTransitArtwork *)self->_artwork readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitSystemIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitSystemReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPBTransitSystemIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPBTransitSystem *)self readAll:0];
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      char flags = (char)self->_flags;
    }
    id v6 = v9;
    if (flags)
    {
      PBDataWriterWriteUint64Field();
      id v6 = v9;
    }
    if (self->_website)
    {
      PBDataWriterWriteStringField();
      id v6 = v9;
    }
    if (self->_styleAttributes)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if (self->_artwork)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if (self->_nameDisplayString)
    {
      PBDataWriterWriteStringField();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (void)copyTo:(id)a3
{
  id v6 = (id *)a3;
  [(GEOPBTransitSystem *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 16) = self->_readerMarkPos;
  *((_DWORD *)v6 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 19) = self->_systemIndex;
    *((unsigned char *)v6 + 80) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v6[4] = self->_muid;
    *((unsigned char *)v6 + 80) |= 1u;
  }
  if (self->_website)
  {
    objc_msgSend(v6, "setWebsite:");
    v4 = v6;
  }
  if (self->_styleAttributes)
  {
    objc_msgSend(v6, "setStyleAttributes:");
    v4 = v6;
  }
  if (self->_artwork)
  {
    objc_msgSend(v6, "setArtwork:");
    v4 = v6;
  }
  if (self->_nameDisplayString)
  {
    objc_msgSend(v6, "setNameDisplayString:");
    v4 = v6;
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
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPBTransitSystemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBTransitSystem *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_systemIndex;
    *(unsigned char *)(v5 + 80) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 32) = self->_muid;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_website copyWithZone:a3];
  v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  id v12 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  id v14 = [(GEOPBTransitArtwork *)self->_artwork copyWithZone:a3];
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  uint64_t v16 = [(NSString *)self->_nameDisplayString copyWithZone:a3];
  v17 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v16;

  uint64_t v18 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v18;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  [(GEOPBTransitSystem *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_systemIndex != *((_DWORD *)v4 + 19)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
LABEL_20:
    char v9 = 0;
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_muid != *((void *)v4 + 4)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_20;
  }
  website = self->_website;
  if ((unint64_t)website | *((void *)v4 + 7) && !-[NSString isEqual:](website, "isEqual:")) {
    goto LABEL_20;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 6))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:")) {
      goto LABEL_20;
    }
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((void *)v4 + 3))
  {
    if (!-[GEOPBTransitArtwork isEqual:](artwork, "isEqual:")) {
      goto LABEL_20;
    }
  }
  nameDisplayString = self->_nameDisplayString;
  if ((unint64_t)nameDisplayString | *((void *)v4 + 5)) {
    char v9 = -[NSString isEqual:](nameDisplayString, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  [(GEOPBTransitSystem *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_systemIndex;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_muid;
LABEL_6:
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_website hash];
  unint64_t v6 = [(GEOStyleAttributes *)self->_styleAttributes hash];
  unint64_t v7 = v5 ^ v6 ^ [(GEOPBTransitArtwork *)self->_artwork hash];
  return v7 ^ [(NSString *)self->_nameDisplayString hash];
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  unint64_t v4 = v10;
  char v5 = *((unsigned char *)v10 + 80);
  if ((v5 & 2) != 0)
  {
    self->_systemIndex = *((_DWORD *)v10 + 19);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v10 + 80);
  }
  if (v5)
  {
    self->_muid = *((void *)v10 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v10 + 7))
  {
    -[GEOPBTransitSystem setWebsite:](self, "setWebsite:");
    unint64_t v4 = v10;
  }
  styleAttributes = self->_styleAttributes;
  uint64_t v7 = v4[6];
  if (styleAttributes)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[GEOPBTransitSystem setStyleAttributes:](self, "setStyleAttributes:");
  }
  unint64_t v4 = v10;
LABEL_13:
  artwork = self->_artwork;
  uint64_t v9 = v4[3];
  if (artwork)
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[GEOPBTransitSystem setArtwork:](self, "setArtwork:");
  }
  unint64_t v4 = v10;
LABEL_19:
  if (v4[5])
  {
    -[GEOPBTransitSystem setNameDisplayString:](self, "setNameDisplayString:");
    unint64_t v4 = v10;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      char v5 = reader;
      objc_sync_enter(v5);
      GEOPBTransitSystemReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1096);
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
  *(unsigned char *)&self->_flags |= 0x84u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPBTransitSystem *)self readAll:0];
    [(GEOStyleAttributes *)self->_styleAttributes clearUnknownFields:1];
    artwork = self->_artwork;
    [(GEOPBTransitArtwork *)artwork clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_website, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_nameDisplayString, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)geoTransitSystem
{
  v2 = [[_GEOTransitSystem alloc] initWithSystem:self];

  return v2;
}

- (id)identifier
{
  v2 = [[GEOMapItemIdentifier alloc] initWithMUID:[(GEOPBTransitSystem *)self muid]];

  return v2;
}

@end