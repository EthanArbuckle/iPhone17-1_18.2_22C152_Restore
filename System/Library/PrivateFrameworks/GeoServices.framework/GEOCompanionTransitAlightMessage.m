@interface GEOCompanionTransitAlightMessage
+ (BOOL)isValid:(id)a3;
- (BOOL)hasArtwork;
- (BOOL)hasDetail;
- (BOOL)hasIdentifier;
- (BOOL)hasStepID;
- (BOOL)hasStopID;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCompanionTransitAlightMessage)init;
- (GEOCompanionTransitAlightMessage)initWithData:(id)a3;
- (GEOCompanionTransitAlightMessage)initWithDictionary:(id)a3;
- (GEOCompanionTransitAlightMessage)initWithJSON:(id)a3;
- (GEOFormattedString)detail;
- (GEOFormattedString)title;
- (GEOPBTransitArtwork)artwork;
- (NSString)identifier;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)stepID;
- (unsigned)stopID;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readArtwork;
- (void)_readDetail;
- (void)_readIdentifier;
- (void)_readTitle;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArtwork:(id)a3;
- (void)setDetail:(id)a3;
- (void)setHasStepID:(BOOL)a3;
- (void)setHasStopID:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setStepID:(unsigned int)a3;
- (void)setStopID:(unsigned int)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCompanionTransitAlightMessage

- (GEOCompanionTransitAlightMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionTransitAlightMessage;
  v2 = [(GEOCompanionTransitAlightMessage *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionTransitAlightMessage)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionTransitAlightMessage;
  v3 = [(GEOCompanionTransitAlightMessage *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionTransitAlightMessageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIdentifier_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOCompanionTransitAlightMessage _readIdentifier]((uint64_t)self);
  identifier = self->_identifier;

  return identifier;
}

- (void)setIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasStepID
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)stopID
{
  return self->_stopID;
}

- (void)setStopID:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_stopID = a3;
}

- (void)setHasStopID:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStopID
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionTransitAlightMessageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtwork_tags_0);
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
  -[GEOCompanionTransitAlightMessage _readArtwork]((uint64_t)self);
  artwork = self->_artwork;

  return artwork;
}

- (void)setArtwork:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void)_readTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionTransitAlightMessageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (GEOFormattedString)title
{
  -[GEOCompanionTransitAlightMessage _readTitle]((uint64_t)self);
  title = self->_title;

  return title;
}

- (void)setTitle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readDetail
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionTransitAlightMessageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDetail_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDetail
{
  return self->_detail != 0;
}

- (GEOFormattedString)detail
{
  -[GEOCompanionTransitAlightMessage _readDetail]((uint64_t)self);
  detail = self->_detail;

  return detail;
}

- (void)setDetail:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_detail, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCompanionTransitAlightMessage;
  v4 = [(GEOCompanionTransitAlightMessage *)&v8 description];
  v5 = [(GEOCompanionTransitAlightMessage *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionTransitAlightMessage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 identifier];
    if (v5) {
      [v4 setObject:v5 forKey:@"identifier"];
    }

    char v6 = *(unsigned char *)(a1 + 68);
    if (v6)
    {
      objc_super v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 60)];
      [v4 setObject:v7 forKey:@"stepID"];

      char v6 = *(unsigned char *)(a1 + 68);
    }
    if ((v6 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
      [v4 setObject:v8 forKey:@"stopID"];
    }
    v9 = [(id)a1 artwork];
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"artwork"];
    }
    v12 = [(id)a1 title];
    v13 = v12;
    if (v12)
    {
      if (a2) {
        [v12 jsonRepresentation];
      }
      else {
      v14 = [v12 dictionaryRepresentation];
      }
      [v4 setObject:v14 forKey:@"title"];
    }
    v15 = [(id)a1 detail];
    v16 = v15;
    if (v15)
    {
      if (a2) {
        [v15 jsonRepresentation];
      }
      else {
      v17 = [v15 dictionaryRepresentation];
      }
      [v4 setObject:v17 forKey:@"detail"];
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
  return -[GEOCompanionTransitAlightMessage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCompanionTransitAlightMessage)initWithDictionary:(id)a3
{
  return (GEOCompanionTransitAlightMessage *)-[GEOCompanionTransitAlightMessage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      char v6 = [v5 objectForKeyedSubscript:@"identifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[v6 copy];
        [a1 setIdentifier:v7];
      }
      objc_super v8 = [v5 objectForKeyedSubscript:@"stepID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStepID:", objc_msgSend(v8, "unsignedIntValue"));
      }

      v9 = [v5 objectForKeyedSubscript:@"stopID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStopID:", objc_msgSend(v9, "unsignedIntValue"));
      }

      v10 = [v5 objectForKeyedSubscript:@"artwork"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOPBTransitArtwork alloc];
        if (a3) {
          uint64_t v12 = [(GEOPBTransitArtwork *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEOPBTransitArtwork *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setArtwork:v12];
      }
      v14 = [v5 objectForKeyedSubscript:@"title"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v16 = [(GEOFormattedString *)v15 initWithJSON:v14];
        }
        else {
          uint64_t v16 = [(GEOFormattedString *)v15 initWithDictionary:v14];
        }
        v17 = (void *)v16;
        [a1 setTitle:v16];
      }
      v18 = [v5 objectForKeyedSubscript:@"detail"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v20 = [(GEOFormattedString *)v19 initWithJSON:v18];
        }
        else {
          uint64_t v20 = [(GEOFormattedString *)v19 initWithDictionary:v18];
        }
        v21 = (void *)v20;
        [a1 setDetail:v20];
      }
    }
  }

  return a1;
}

- (GEOCompanionTransitAlightMessage)initWithJSON:(id)a3
{
  return (GEOCompanionTransitAlightMessage *)-[GEOCompanionTransitAlightMessage _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1170;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1171;
    }
    GEOCompanionTransitAlightMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOPBTransitArtwork *)self->_artwork readAll:1];
    [(GEOFormattedString *)self->_title readAll:1];
    [(GEOFormattedString *)self->_detail readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionTransitAlightMessageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionTransitAlightMessageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOCompanionTransitAlightMessageIsDirty((uint64_t)self) & 1) == 0)
  {
    char v6 = self->_reader;
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
    [(GEOCompanionTransitAlightMessage *)self readAll:0];
    if (self->_identifier) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_artwork) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_title) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_detail) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  char v6 = (id *)a3;
  [(GEOCompanionTransitAlightMessage *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_identifier) {
    objc_msgSend(v6, "setIdentifier:");
  }
  char flags = (char)self->_flags;
  id v5 = v6;
  if (flags)
  {
    *((_DWORD *)v6 + 15) = self->_stepID;
    *((unsigned char *)v6 + 68) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_stopID;
    *((unsigned char *)v6 + 68) |= 2u;
  }
  if (self->_artwork)
  {
    objc_msgSend(v6, "setArtwork:");
    id v5 = v6;
  }
  if (self->_title)
  {
    objc_msgSend(v6, "setTitle:");
    id v5 = v6;
  }
  if (self->_detail)
  {
    objc_msgSend(v6, "setDetail:");
    id v5 = v6;
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
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOCompanionTransitAlightMessageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCompanionTransitAlightMessage *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_identifier copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 60) = self->_stepID;
    *(unsigned char *)(v5 + 68) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_stopID;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  id v12 = [(GEOPBTransitArtwork *)self->_artwork copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  id v14 = [(GEOFormattedString *)self->_title copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  id v16 = [(GEOFormattedString *)self->_detail copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v16;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  [(GEOCompanionTransitAlightMessage *)self readAll:1];
  [v4 readAll:1];
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_stepID != *((_DWORD *)v4 + 15)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_20:
    char v9 = 0;
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_stopID != *((_DWORD *)v4 + 16)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_20;
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((void *)v4 + 2) && !-[GEOPBTransitArtwork isEqual:](artwork, "isEqual:")) {
    goto LABEL_20;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 5))
  {
    if (!-[GEOFormattedString isEqual:](title, "isEqual:")) {
      goto LABEL_20;
    }
  }
  detail = self->_detail;
  if ((unint64_t)detail | *((void *)v4 + 3)) {
    char v9 = -[GEOFormattedString isEqual:](detail, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  [(GEOCompanionTransitAlightMessage *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v4 = 2654435761 * self->_stepID;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_stopID;
LABEL_6:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(GEOPBTransitArtwork *)self->_artwork hash];
  unint64_t v7 = [(GEOFormattedString *)self->_title hash];
  return v6 ^ v7 ^ [(GEOFormattedString *)self->_detail hash];
}

- (void)mergeFrom:(id)a3
{
  id v12 = a3;
  [v12 readAll:0];
  uint64_t v4 = v12;
  if (v12[4])
  {
    -[GEOCompanionTransitAlightMessage setIdentifier:](self, "setIdentifier:");
    uint64_t v4 = v12;
  }
  char v5 = *((unsigned char *)v4 + 68);
  if (v5)
  {
    self->_stepID = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v4 + 68);
  }
  if ((v5 & 2) != 0)
  {
    self->_stopID = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_flags |= 2u;
  }
  artwork = self->_artwork;
  uint64_t v7 = v4[2];
  if (artwork)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[GEOCompanionTransitAlightMessage setArtwork:](self, "setArtwork:");
  }
  uint64_t v4 = v12;
LABEL_13:
  title = self->_title;
  uint64_t v9 = v4[5];
  if (title)
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[GEOFormattedString mergeFrom:](title, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[GEOCompanionTransitAlightMessage setTitle:](self, "setTitle:");
  }
  uint64_t v4 = v12;
LABEL_19:
  detail = self->_detail;
  uint64_t v11 = v4[3];
  if (detail)
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[GEOFormattedString mergeFrom:](detail, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[GEOCompanionTransitAlightMessage setDetail:](self, "setDetail:");
  }
  uint64_t v4 = v12;
LABEL_25:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_artwork, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end