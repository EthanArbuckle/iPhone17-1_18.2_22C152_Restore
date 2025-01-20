@interface GEOPBTransitZoomRangeString
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLabelLanguage;
- (BOOL)hasLabelText;
- (BOOL)hasMinZoom;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBTransitZoomRangeString)init;
- (GEOPBTransitZoomRangeString)initWithData:(id)a3;
- (GEOPBTransitZoomRangeString)initWithDictionary:(id)a3;
- (GEOPBTransitZoomRangeString)initWithJSON:(id)a3;
- (NSString)labelLanguage;
- (NSString)labelText;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)minZoom;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLabelLanguage;
- (void)_readLabelText;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasMinZoom:(BOOL)a3;
- (void)setLabelLanguage:(id)a3;
- (void)setLabelText:(id)a3;
- (void)setMinZoom:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitZoomRangeString

- (GEOPBTransitZoomRangeString)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitZoomRangeString;
  v2 = [(GEOPBTransitZoomRangeString *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitZoomRangeString)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitZoomRangeString;
  v3 = [(GEOPBTransitZoomRangeString *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)minZoom
{
  return self->_minZoom;
}

- (void)setMinZoom:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_minZoom = a3;
}

- (void)setHasMinZoom:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasMinZoom
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readLabelLanguage
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
        GEOPBTransitZoomRangeStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabelLanguage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLabelLanguage
{
  return self->_labelLanguage != 0;
}

- (NSString)labelLanguage
{
  -[GEOPBTransitZoomRangeString _readLabelLanguage]((uint64_t)self);
  labelLanguage = self->_labelLanguage;

  return labelLanguage;
}

- (void)setLabelLanguage:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_labelLanguage, a3);
}

- (void)_readLabelText
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
        GEOPBTransitZoomRangeStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabelText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLabelText
{
  return self->_labelText != 0;
}

- (NSString)labelText
{
  -[GEOPBTransitZoomRangeString _readLabelText]((uint64_t)self);
  labelText = self->_labelText;

  return labelText;
}

- (void)setLabelText:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_labelText, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitZoomRangeString;
  v4 = [(GEOPBTransitZoomRangeString *)&v8 description];
  v5 = [(GEOPBTransitZoomRangeString *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitZoomRangeString _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 56))
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        objc_super v6 = @"minZoom";
      }
      else {
        objc_super v6 = @"min_zoom";
      }
      [v4 setObject:v5 forKey:v6];
    }
    objc_super v7 = [(id)a1 labelLanguage];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"labelLanguage";
      }
      else {
        objc_super v8 = @"label_language";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [(id)a1 labelText];
    if (v9)
    {
      if (a2) {
        v10 = @"labelText";
      }
      else {
        v10 = @"label_text";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = *(void **)(a1 + 16);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __57__GEOPBTransitZoomRangeString__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOPBTransitZoomRangeString _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOPBTransitZoomRangeString__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitZoomRangeString)initWithDictionary:(id)a3
{
  return (GEOPBTransitZoomRangeString *)-[GEOPBTransitZoomRangeString _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"minZoom";
      }
      else {
        objc_super v6 = @"min_zoom";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMinZoom:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"labelLanguage";
      }
      else {
        objc_super v8 = @"label_language";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = (void *)[v9 copy];
        [a1 setLabelLanguage:v10];
      }
      if (a3) {
        v11 = @"labelText";
      }
      else {
        v11 = @"label_text";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = (void *)[v12 copy];
        [a1 setLabelText:v13];
      }
    }
  }

  return a1;
}

- (GEOPBTransitZoomRangeString)initWithJSON:(id)a3
{
  return (GEOPBTransitZoomRangeString *)-[GEOPBTransitZoomRangeString _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1286;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1287;
    }
    GEOPBTransitZoomRangeStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitZoomRangeStringIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitZoomRangeStringReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
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
    [(GEOPBTransitZoomRangeString *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    id v5 = v8;
    if (self->_labelLanguage)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_labelText)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOPBTransitZoomRangeString *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 13) = self->_minZoom;
    *((unsigned char *)v5 + 56) |= 1u;
  }
  if (self->_labelLanguage)
  {
    objc_msgSend(v5, "setLabelLanguage:");
    v4 = v5;
  }
  if (self->_labelText)
  {
    objc_msgSend(v5, "setLabelText:");
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
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPBTransitZoomRangeStringReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBTransitZoomRangeString *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_minZoom;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_labelLanguage copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_labelText copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOPBTransitZoomRangeString *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_minZoom != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  labelLanguage = self->_labelLanguage;
  if ((unint64_t)labelLanguage | *((void *)v4 + 3)
    && !-[NSString isEqual:](labelLanguage, "isEqual:"))
  {
    goto LABEL_11;
  }
  labelText = self->_labelText;
  if ((unint64_t)labelText | *((void *)v4 + 4)) {
    char v7 = -[NSString isEqual:](labelText, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPBTransitZoomRangeString *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_minZoom;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_labelLanguage hash] ^ v3;
  return v4 ^ [(NSString *)self->_labelText hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (unsigned int *)a3;
  [v5 readAll:0];
  NSUInteger v4 = v5;
  if (v5[14])
  {
    self->_minZoom = v5[13];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 3))
  {
    -[GEOPBTransitZoomRangeString setLabelLanguage:](self, "setLabelLanguage:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[GEOPBTransitZoomRangeString setLabelText:](self, "setLabelText:");
    NSUInteger v4 = v5;
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPBTransitZoomRangeStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, unknownFields_tags_1291);
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
  *(unsigned char *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPBTransitZoomRangeString *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelText, 0);
  objc_storeStrong((id *)&self->_labelLanguage, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end