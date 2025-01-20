@interface GEOLabelInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDetail;
- (BOOL)hasIconArtwork;
- (BOOL)hasLabelStyleAttributes;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)detail;
- (GEOFormattedString)title;
- (GEOLabelInfo)init;
- (GEOLabelInfo)initWithData:(id)a3;
- (GEOLabelInfo)initWithDictionary:(id)a3;
- (GEOLabelInfo)initWithJSON:(id)a3;
- (GEOPBTransitArtwork)iconArtwork;
- (GEOStyleAttributes)labelStyleAttributes;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDetail;
- (void)_readIconArtwork;
- (void)_readLabelStyleAttributes;
- (void)_readTitle;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDetail:(id)a3;
- (void)setIconArtwork:(id)a3;
- (void)setLabelStyleAttributes:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLabelInfo

- (GEOLabelInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLabelInfo;
  v2 = [(GEOLabelInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLabelInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLabelInfo;
  v3 = [(GEOLabelInfo *)&v7 initWithData:a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLabelInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_3548);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (GEOFormattedString)title
{
  -[GEOLabelInfo _readTitle]((uint64_t)self);
  title = self->_title;

  return title;
}

- (void)setTitle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readDetail
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLabelInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDetail_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasDetail
{
  return self->_detail != 0;
}

- (GEOFormattedString)detail
{
  -[GEOLabelInfo _readDetail]((uint64_t)self);
  detail = self->_detail;

  return detail;
}

- (void)setDetail:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_detail, a3);
}

- (void)_readIconArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLabelInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIconArtwork_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasIconArtwork
{
  return self->_iconArtwork != 0;
}

- (GEOPBTransitArtwork)iconArtwork
{
  -[GEOLabelInfo _readIconArtwork]((uint64_t)self);
  iconArtwork = self->_iconArtwork;

  return iconArtwork;
}

- (void)setIconArtwork:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_iconArtwork, a3);
}

- (void)_readLabelStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLabelInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabelStyleAttributes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLabelStyleAttributes
{
  return self->_labelStyleAttributes != 0;
}

- (GEOStyleAttributes)labelStyleAttributes
{
  -[GEOLabelInfo _readLabelStyleAttributes]((uint64_t)self);
  labelStyleAttributes = self->_labelStyleAttributes;

  return labelStyleAttributes;
}

- (void)setLabelStyleAttributes:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_labelStyleAttributes, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLabelInfo;
  v4 = [(GEOLabelInfo *)&v8 description];
  v5 = [(GEOLabelInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLabelInfo _dictionaryRepresentation:](self, 0);
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
    objc_super v8 = [a1 detail];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"detail"];
    }
    v11 = [a1 iconArtwork];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"iconArtwork";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"icon_artwork";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = [a1 labelStyleAttributes];
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"labelStyleAttributes";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"label_style_attributes";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = (void *)a1[2];
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __42__GEOLabelInfo__dictionaryRepresentation___block_invoke;
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
  return -[GEOLabelInfo _dictionaryRepresentation:](self, 1);
}

void __42__GEOLabelInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLabelInfo)initWithDictionary:(id)a3
{
  return (GEOLabelInfo *)-[GEOLabelInfo _initWithDictionary:isJSON:](self, a3, 0);
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
      id v10 = [v5 objectForKeyedSubscript:@"detail"];
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
        [a1 setDetail:v12];
      }
      if (a3) {
        v14 = @"iconArtwork";
      }
      else {
        v14 = @"icon_artwork";
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
        [a1 setIconArtwork:v17];
      }
      if (a3) {
        v19 = @"labelStyleAttributes";
      }
      else {
        v19 = @"label_style_attributes";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = [GEOStyleAttributes alloc];
        if (a3) {
          uint64_t v22 = [(GEOStyleAttributes *)v21 initWithJSON:v20];
        }
        else {
          uint64_t v22 = [(GEOStyleAttributes *)v21 initWithDictionary:v20];
        }
        id v23 = (void *)v22;
        [a1 setLabelStyleAttributes:v22];
      }
    }
  }

  return a1;
}

- (GEOLabelInfo)initWithJSON:(id)a3
{
  return (GEOLabelInfo *)-[GEOLabelInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_3565;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_3566;
    }
    GEOLabelInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLabelInfoCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLabelInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLabelInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLabelInfoIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOLabelInfo *)self readAll:0];
    if (self->_title) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_detail)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_iconArtwork)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_labelStyleAttributes)
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
  [(GEOLabelInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_title) {
    objc_msgSend(v5, "setTitle:");
  }
  if (self->_detail) {
    objc_msgSend(v5, "setDetail:");
  }
  v4 = v5;
  if (self->_iconArtwork)
  {
    objc_msgSend(v5, "setIconArtwork:");
    v4 = v5;
  }
  if (self->_labelStyleAttributes)
  {
    objc_msgSend(v5, "setLabelStyleAttributes:");
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
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLabelInfo *)self readAll:0];
    id v8 = [(GEOFormattedString *)self->_title copyWithZone:a3];
    v9 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v8;

    id v10 = [(GEOFormattedString *)self->_detail copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    id v12 = [(GEOPBTransitArtwork *)self->_iconArtwork copyWithZone:a3];
    v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    id v14 = [(GEOStyleAttributes *)self->_labelStyleAttributes copyWithZone:a3];
    v15 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLabelInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLabelInfo *)self readAll:1],
         [v4 readAll:1],
         title = self->_title,
         !((unint64_t)title | v4[6]))
     || -[GEOFormattedString isEqual:](title, "isEqual:"))
    && ((detail = self->_detail, !((unint64_t)detail | v4[3]))
     || -[GEOFormattedString isEqual:](detail, "isEqual:"))
    && ((iconArtwork = self->_iconArtwork, !((unint64_t)iconArtwork | v4[4]))
     || -[GEOPBTransitArtwork isEqual:](iconArtwork, "isEqual:")))
  {
    labelStyleAttributes = self->_labelStyleAttributes;
    if ((unint64_t)labelStyleAttributes | v4[5]) {
      char v9 = -[GEOStyleAttributes isEqual:](labelStyleAttributes, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  [(GEOLabelInfo *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_title hash];
  unint64_t v4 = [(GEOFormattedString *)self->_detail hash] ^ v3;
  unint64_t v5 = [(GEOPBTransitArtwork *)self->_iconArtwork hash];
  return v4 ^ v5 ^ [(GEOStyleAttributes *)self->_labelStyleAttributes hash];
}

- (void)mergeFrom:(id)a3
{
  id v12 = a3;
  [v12 readAll:0];
  title = self->_title;
  uint64_t v5 = v12[6];
  if (title)
  {
    if (v5) {
      -[GEOFormattedString mergeFrom:](title, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOLabelInfo setTitle:](self, "setTitle:");
  }
  detail = self->_detail;
  uint64_t v7 = v12[3];
  if (detail)
  {
    if (v7) {
      -[GEOFormattedString mergeFrom:](detail, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOLabelInfo setDetail:](self, "setDetail:");
  }
  iconArtwork = self->_iconArtwork;
  uint64_t v9 = v12[4];
  if (iconArtwork)
  {
    if (v9) {
      -[GEOPBTransitArtwork mergeFrom:](iconArtwork, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOLabelInfo setIconArtwork:](self, "setIconArtwork:");
  }
  labelStyleAttributes = self->_labelStyleAttributes;
  uint64_t v11 = v12[5];
  if (labelStyleAttributes)
  {
    if (v11) {
      -[GEOStyleAttributes mergeFrom:](labelStyleAttributes, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOLabelInfo setLabelStyleAttributes:](self, "setLabelStyleAttributes:");
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
      GEOLabelInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3570);
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
  *(unsigned char *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOLabelInfo *)self readAll:0];
    [(GEOFormattedString *)self->_title clearUnknownFields:1];
    [(GEOFormattedString *)self->_detail clearUnknownFields:1];
    [(GEOPBTransitArtwork *)self->_iconArtwork clearUnknownFields:1];
    labelStyleAttributes = self->_labelStyleAttributes;
    [(GEOStyleAttributes *)labelStyleAttributes clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_labelStyleAttributes, 0);
  objc_storeStrong((id *)&self->_iconArtwork, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end