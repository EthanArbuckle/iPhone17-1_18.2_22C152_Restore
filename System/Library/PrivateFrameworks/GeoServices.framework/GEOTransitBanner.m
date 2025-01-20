@interface GEOTransitBanner
+ (BOOL)isValid:(id)a3;
- (BOOL)hasArtwork;
- (BOOL)hasPrimaryText;
- (BOOL)hasSecondaryText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)primaryText;
- (GEOFormattedString)secondaryText;
- (GEOPBTransitArtwork)artwork;
- (GEOTransitBanner)init;
- (GEOTransitBanner)initWithData:(id)a3;
- (GEOTransitBanner)initWithDictionary:(id)a3;
- (GEOTransitBanner)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readArtwork;
- (void)_readPrimaryText;
- (void)_readSecondaryText;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArtwork:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitBanner

- (GEOTransitBanner)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitBanner;
  v2 = [(GEOTransitBanner *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitBanner)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitBanner;
  v3 = [(GEOTransitBanner *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPrimaryText
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
        GEOTransitBannerReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrimaryText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasPrimaryText
{
  return self->_primaryText != 0;
}

- (GEOFormattedString)primaryText
{
  -[GEOTransitBanner _readPrimaryText]((uint64_t)self);
  primaryText = self->_primaryText;

  return primaryText;
}

- (void)setPrimaryText:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_primaryText, a3);
}

- (void)_readSecondaryText
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
        GEOTransitBannerReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSecondaryText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSecondaryText
{
  return self->_secondaryText != 0;
}

- (GEOFormattedString)secondaryText
{
  -[GEOTransitBanner _readSecondaryText]((uint64_t)self);
  secondaryText = self->_secondaryText;

  return secondaryText;
}

- (void)setSecondaryText:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_secondaryText, a3);
}

- (void)_readArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBannerReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtwork_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasArtwork
{
  return self->_artwork != 0;
}

- (GEOPBTransitArtwork)artwork
{
  -[GEOTransitBanner _readArtwork]((uint64_t)self);
  artwork = self->_artwork;

  return artwork;
}

- (void)setArtwork:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitBanner;
  v4 = [(GEOTransitBanner *)&v8 description];
  v5 = [(GEOTransitBanner *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitBanner _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 primaryText];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"primaryText";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"primary_text";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 secondaryText];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"secondaryText";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"secondary_text";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [a1 artwork];
    v14 = v13;
    if (v13)
    {
      if (a2) {
        [v13 jsonRepresentation];
      }
      else {
      v15 = [v13 dictionaryRepresentation];
      }
      [v4 setObject:v15 forKey:@"artwork"];
    }
    v16 = (void *)a1[2];
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __46__GEOTransitBanner__dictionaryRepresentation___block_invoke;
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
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitBanner _dictionaryRepresentation:](self, 1);
}

void __46__GEOTransitBanner__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitBanner)initWithDictionary:(id)a3
{
  return (GEOTransitBanner *)-[GEOTransitBanner _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"primaryText";
      }
      else {
        objc_super v6 = @"primary_text";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v9 = [(GEOFormattedString *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOFormattedString *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setPrimaryText:v9];
      }
      if (a3) {
        v11 = @"secondaryText";
      }
      else {
        v11 = @"secondary_text";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v14 = [(GEOFormattedString *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOFormattedString *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setSecondaryText:v14];
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
    }
  }

  return a1;
}

- (GEOTransitBanner)initWithJSON:(id)a3
{
  return (GEOTransitBanner *)-[GEOTransitBanner _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_6;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_6;
    }
    GEOTransitBannerReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOFormattedString *)self->_primaryText readAll:1];
    [(GEOFormattedString *)self->_secondaryText readAll:1];
    [(GEOPBTransitArtwork *)self->_artwork readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitBannerIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitBannerReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitBannerIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOTransitBanner *)self readAll:0];
    if (self->_primaryText) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_secondaryText)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_artwork)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOTransitBanner *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_primaryText) {
    objc_msgSend(v5, "setPrimaryText:");
  }
  if (self->_secondaryText) {
    objc_msgSend(v5, "setSecondaryText:");
  }
  v4 = v5;
  if (self->_artwork)
  {
    objc_msgSend(v5, "setArtwork:");
    v4 = v5;
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
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitBanner *)self readAll:0];
    id v8 = [(GEOFormattedString *)self->_primaryText copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEOFormattedString *)self->_secondaryText copyWithZone:a3];
    v11 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;

    id v12 = [(GEOPBTransitArtwork *)self->_artwork copyWithZone:a3];
    v13 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOTransitBannerReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOTransitBanner *)self readAll:1],
         [v4 readAll:1],
         primaryText = self->_primaryText,
         !((unint64_t)primaryText | v4[4]))
     || -[GEOFormattedString isEqual:](primaryText, "isEqual:"))
    && ((secondaryText = self->_secondaryText, !((unint64_t)secondaryText | v4[5]))
     || -[GEOFormattedString isEqual:](secondaryText, "isEqual:")))
  {
    artwork = self->_artwork;
    if ((unint64_t)artwork | v4[3]) {
      char v8 = -[GEOPBTransitArtwork isEqual:](artwork, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  [(GEOTransitBanner *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_primaryText hash];
  unint64_t v4 = [(GEOFormattedString *)self->_secondaryText hash] ^ v3;
  return v4 ^ [(GEOPBTransitArtwork *)self->_artwork hash];
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  primaryText = self->_primaryText;
  uint64_t v5 = v10[4];
  if (primaryText)
  {
    if (v5) {
      -[GEOFormattedString mergeFrom:](primaryText, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOTransitBanner setPrimaryText:](self, "setPrimaryText:");
  }
  secondaryText = self->_secondaryText;
  uint64_t v7 = v10[5];
  if (secondaryText)
  {
    if (v7) {
      -[GEOFormattedString mergeFrom:](secondaryText, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOTransitBanner setSecondaryText:](self, "setSecondaryText:");
  }
  artwork = self->_artwork;
  uint64_t v9 = v10[3];
  if (artwork)
  {
    if (v9) {
      -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOTransitBanner setArtwork:](self, "setArtwork:");
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
      GEOTransitBannerReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_0);
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
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitBanner *)self readAll:0];
    [(GEOFormattedString *)self->_primaryText clearUnknownFields:1];
    [(GEOFormattedString *)self->_secondaryText clearUnknownFields:1];
    artwork = self->_artwork;
    [(GEOPBTransitArtwork *)artwork clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end