@interface GEOAdvisoryCard
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAction;
- (BOOL)hasArtworkOverride;
- (BOOL)hasDetails;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMetadata;
- (BOOL)hasTimeString;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAdvisoryCard)init;
- (GEOAdvisoryCard)initWithData:(id)a3;
- (GEOAdvisoryCard)initWithDictionary:(id)a3;
- (GEOAdvisoryCard)initWithJSON:(id)a3;
- (GEOAdvisoryCardAction)action;
- (GEOFormattedString)details;
- (GEOFormattedString)metadata;
- (GEOFormattedString)timeString;
- (GEOFormattedString)title;
- (GEOPBTransitArtwork)artworkOverride;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAction;
- (void)_readArtworkOverride;
- (void)_readDetails;
- (void)_readMetadata;
- (void)_readTimeString;
- (void)_readTitle;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAction:(id)a3;
- (void)setArtworkOverride:(id)a3;
- (void)setDetails:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setTimeString:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAdvisoryCard

- (GEOAdvisoryCard)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAdvisoryCard;
  v2 = [(GEOAdvisoryCard *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAdvisoryCard)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAdvisoryCard;
  v3 = [(GEOAdvisoryCard *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (GEOFormattedString)title
{
  -[GEOAdvisoryCard _readTitle]((uint64_t)self);
  title = self->_title;

  return title;
}

- (void)setTitle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDetails_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDetails
{
  return self->_details != 0;
}

- (GEOFormattedString)details
{
  -[GEOAdvisoryCard _readDetails]((uint64_t)self);
  details = self->_details;

  return details;
}

- (void)setDetails:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_details, a3);
}

- (void)_readArtworkOverride
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtworkOverride_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasArtworkOverride
{
  return self->_artworkOverride != 0;
}

- (GEOPBTransitArtwork)artworkOverride
{
  -[GEOAdvisoryCard _readArtworkOverride]((uint64_t)self);
  artworkOverride = self->_artworkOverride;

  return artworkOverride;
}

- (void)setArtworkOverride:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_artworkOverride, a3);
}

- (void)_readMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMetadata_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (GEOFormattedString)metadata
{
  -[GEOAdvisoryCard _readMetadata]((uint64_t)self);
  metadata = self->_metadata;

  return metadata;
}

- (void)setMetadata:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)_readTimeString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimeString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTimeString
{
  return self->_timeString != 0;
}

- (GEOFormattedString)timeString
{
  -[GEOAdvisoryCard _readTimeString]((uint64_t)self);
  timeString = self->_timeString;

  return timeString;
}

- (void)setTimeString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_timeString, a3);
}

- (void)_readAction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasAction
{
  return self->_action != 0;
}

- (GEOAdvisoryCardAction)action
{
  -[GEOAdvisoryCard _readAction]((uint64_t)self);
  action = self->_action;

  return action;
}

- (void)setAction:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  objc_storeStrong((id *)&self->_action, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAdvisoryCard;
  v4 = [(GEOAdvisoryCard *)&v8 description];
  v5 = [(GEOAdvisoryCard *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAdvisoryCard _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 title];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"title"];
    }
    objc_super v8 = [a1 details];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"details"];
    }
    v11 = [a1 artworkOverride];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"artworkOverride";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"artwork_override";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = [a1 metadata];
    v16 = v15;
    if (v15)
    {
      if (a2) {
        [v15 jsonRepresentation];
      }
      else {
      v17 = [v15 dictionaryRepresentation];
      }
      [v4 setObject:v17 forKey:@"metadata"];
    }
    v18 = [a1 timeString];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"timeString";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"time_string";
      }
      [v4 setObject:v20 forKey:v21];
    }
    v22 = [a1 action];
    v23 = v22;
    if (v22)
    {
      if (a2) {
        [v22 jsonRepresentation];
      }
      else {
      v24 = [v22 dictionaryRepresentation];
      }
      [v4 setObject:v24 forKey:@"action"];
    }
    v25 = (void *)a1[2];
    if (v25)
    {
      v26 = [v25 dictionaryRepresentation];
      v27 = v26;
      if (a2)
      {
        v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __45__GEOAdvisoryCard__dictionaryRepresentation___block_invoke;
        v32[3] = &unk_1E53D8860;
        id v29 = v28;
        id v33 = v29;
        [v27 enumerateKeysAndObjectsUsingBlock:v32];
        id v30 = v29;

        v27 = v30;
      }
      [v4 setObject:v27 forKey:@"Unknown Fields"];
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
  return -[GEOAdvisoryCard _dictionaryRepresentation:](self, 1);
}

void __45__GEOAdvisoryCard__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOAdvisoryCard)initWithDictionary:(id)a3
{
  return (GEOAdvisoryCard *)-[GEOAdvisoryCard _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"title"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v8 = [(GEOFormattedString *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOFormattedString *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setTitle:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"details"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v12 = [(GEOFormattedString *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEOFormattedString *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setDetails:v12];
      }
      if (a3) {
        v14 = @"artworkOverride";
      }
      else {
        v14 = @"artwork_override";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [GEOPBTransitArtwork alloc];
        if (a3) {
          uint64_t v17 = [(GEOPBTransitArtwork *)v16 initWithJSON:v15];
        }
        else {
          uint64_t v17 = [(GEOPBTransitArtwork *)v16 initWithDictionary:v15];
        }
        v18 = (void *)v17;
        [a1 setArtworkOverride:v17];
      }
      v19 = [v5 objectForKeyedSubscript:@"metadata"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v21 = [(GEOFormattedString *)v20 initWithJSON:v19];
        }
        else {
          uint64_t v21 = [(GEOFormattedString *)v20 initWithDictionary:v19];
        }
        v22 = (void *)v21;
        [a1 setMetadata:v21];
      }
      if (a3) {
        v23 = @"timeString";
      }
      else {
        v23 = @"time_string";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v26 = [(GEOFormattedString *)v25 initWithJSON:v24];
        }
        else {
          uint64_t v26 = [(GEOFormattedString *)v25 initWithDictionary:v24];
        }
        v27 = (void *)v26;
        [a1 setTimeString:v26];
      }
      v28 = [v5 objectForKeyedSubscript:@"action"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v29 = [GEOAdvisoryCardAction alloc];
        if (a3) {
          uint64_t v30 = [(GEOAdvisoryCardAction *)v29 initWithJSON:v28];
        }
        else {
          uint64_t v30 = [(GEOAdvisoryCardAction *)v29 initWithDictionary:v28];
        }
        v31 = (void *)v30;
        [a1 setAction:v30];
      }
    }
  }

  return a1;
}

- (GEOAdvisoryCard)initWithJSON:(id)a3
{
  return (GEOAdvisoryCard *)-[GEOAdvisoryCard _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_274;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_275;
    }
    GEOAdvisoryCardReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOAdvisoryCardCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAdvisoryCardIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAdvisoryCardReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAdvisoryCardIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOAdvisoryCard *)self readAll:0];
    if (self->_title) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_details)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_artworkOverride)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_metadata)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_timeString)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_action)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOAdvisoryCard _readAction]((uint64_t)self);
  action = self->_action;

  return [(GEOAdvisoryCardAction *)action hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOAdvisoryCard *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 18) = self->_readerMarkPos;
  *((_DWORD *)v5 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_title) {
    objc_msgSend(v5, "setTitle:");
  }
  if (self->_details) {
    objc_msgSend(v5, "setDetails:");
  }
  v4 = v5;
  if (self->_artworkOverride)
  {
    objc_msgSend(v5, "setArtworkOverride:");
    v4 = v5;
  }
  if (self->_metadata)
  {
    objc_msgSend(v5, "setMetadata:");
    v4 = v5;
  }
  if (self->_timeString)
  {
    objc_msgSend(v5, "setTimeString:");
    v4 = v5;
  }
  if (self->_action)
  {
    objc_msgSend(v5, "setAction:");
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
  if ((*(unsigned char *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAdvisoryCard *)self readAll:0];
    id v8 = [(GEOFormattedString *)self->_title copyWithZone:a3];
    v9 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v8;

    id v10 = [(GEOFormattedString *)self->_details copyWithZone:a3];
    v11 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;

    id v12 = [(GEOPBTransitArtwork *)self->_artworkOverride copyWithZone:a3];
    v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    id v14 = [(GEOFormattedString *)self->_metadata copyWithZone:a3];
    v15 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v14;

    id v16 = [(GEOFormattedString *)self->_timeString copyWithZone:a3];
    uint64_t v17 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v16;

    id v18 = [(GEOAdvisoryCardAction *)self->_action copyWithZone:a3];
    v19 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v18;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOAdvisoryCardReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOAdvisoryCard *)self readAll:1],
         [v4 readAll:1],
         title = self->_title,
         !((unint64_t)title | v4[8]))
     || -[GEOFormattedString isEqual:](title, "isEqual:"))
    && ((details = self->_details, !((unint64_t)details | v4[5]))
     || -[GEOFormattedString isEqual:](details, "isEqual:"))
    && ((artworkOverride = self->_artworkOverride, !((unint64_t)artworkOverride | v4[4]))
     || -[GEOPBTransitArtwork isEqual:](artworkOverride, "isEqual:"))
    && ((metadata = self->_metadata, !((unint64_t)metadata | v4[6]))
     || -[GEOFormattedString isEqual:](metadata, "isEqual:"))
    && ((timeString = self->_timeString, !((unint64_t)timeString | v4[7]))
     || -[GEOFormattedString isEqual:](timeString, "isEqual:")))
  {
    action = self->_action;
    if ((unint64_t)action | v4[3]) {
      char v11 = -[GEOAdvisoryCardAction isEqual:](action, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  [(GEOAdvisoryCard *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_title hash];
  unint64_t v4 = [(GEOFormattedString *)self->_details hash] ^ v3;
  unint64_t v5 = [(GEOPBTransitArtwork *)self->_artworkOverride hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOFormattedString *)self->_metadata hash];
  unint64_t v7 = [(GEOFormattedString *)self->_timeString hash];
  return v6 ^ v7 ^ [(GEOAdvisoryCardAction *)self->_action hash];
}

- (void)mergeFrom:(id)a3
{
  id v16 = a3;
  [v16 readAll:0];
  title = self->_title;
  uint64_t v5 = v16[8];
  if (title)
  {
    if (v5) {
      -[GEOFormattedString mergeFrom:](title, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOAdvisoryCard setTitle:](self, "setTitle:");
  }
  details = self->_details;
  uint64_t v7 = v16[5];
  if (details)
  {
    if (v7) {
      -[GEOFormattedString mergeFrom:](details, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOAdvisoryCard setDetails:](self, "setDetails:");
  }
  artworkOverride = self->_artworkOverride;
  uint64_t v9 = v16[4];
  if (artworkOverride)
  {
    if (v9) {
      -[GEOPBTransitArtwork mergeFrom:](artworkOverride, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOAdvisoryCard setArtworkOverride:](self, "setArtworkOverride:");
  }
  metadata = self->_metadata;
  uint64_t v11 = v16[6];
  if (metadata)
  {
    if (v11) {
      -[GEOFormattedString mergeFrom:](metadata, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOAdvisoryCard setMetadata:](self, "setMetadata:");
  }
  timeString = self->_timeString;
  uint64_t v13 = v16[7];
  if (timeString)
  {
    if (v13) {
      -[GEOFormattedString mergeFrom:](timeString, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEOAdvisoryCard setTimeString:](self, "setTimeString:");
  }
  action = self->_action;
  uint64_t v15 = v16[3];
  if (action)
  {
    if (v15) {
      -[GEOAdvisoryCardAction mergeFrom:](action, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEOAdvisoryCard setAction:](self, "setAction:");
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
      GEOAdvisoryCardReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_279);
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
  *(unsigned char *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOAdvisoryCard *)self readAll:0];
    [(GEOFormattedString *)self->_title clearUnknownFields:1];
    [(GEOFormattedString *)self->_details clearUnknownFields:1];
    [(GEOPBTransitArtwork *)self->_artworkOverride clearUnknownFields:1];
    [(GEOFormattedString *)self->_metadata clearUnknownFields:1];
    [(GEOFormattedString *)self->_timeString clearUnknownFields:1];
    action = self->_action;
    [(GEOAdvisoryCardAction *)action clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_timeString, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end