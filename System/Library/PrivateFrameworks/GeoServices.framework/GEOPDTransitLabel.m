@interface GEOPDTransitLabel
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLabelArtwork;
- (BOOL)hasLabelTextString;
- (BOOL)hasLabelType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDTransitLabel)init;
- (GEOPDTransitLabel)initWithData:(id)a3;
- (GEOPDTransitLabel)initWithDictionary:(id)a3;
- (GEOPDTransitLabel)initWithJSON:(id)a3;
- (GEOTransitArtworkDataSource)labelArtwork;
- (NSString)description;
- (NSString)labelString;
- (NSString)labelTextString;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)labelTypeAsString:(int)a3;
- (int)StringAsLabelType:(id)a3;
- (int)labelType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLabelArtwork;
- (void)_readLabelTextString;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasLabelType:(BOOL)a3;
- (void)setLabelArtwork:(id)a3;
- (void)setLabelTextString:(id)a3;
- (void)setLabelType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTransitLabel

- (GEOPDTransitLabel)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitLabel;
  v2 = [(GEOPDTransitLabel *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDTransitLabel)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitLabel;
  v3 = [(GEOPDTransitLabel *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)labelType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_labelType;
  }
  else {
    return 0;
  }
}

- (void)setLabelType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_labelType = a3;
}

- (void)setHasLabelType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasLabelType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)labelTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E4350[a3];
  }

  return v3;
}

- (int)StringAsLabelType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TRANSIT_LABEL_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LABEL_TYPE_STRING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LABEL_TYPE_SHIELD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LABEL_TYPE_ARTWORK"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LABEL_TYPE_SEPARATOR"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readLabelTextString
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
        GEOPDTransitLabelReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabelTextString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLabelTextString
{
  return self->_labelTextString != 0;
}

- (NSString)labelTextString
{
  -[GEOPDTransitLabel _readLabelTextString]((uint64_t)self);
  labelTextString = self->_labelTextString;

  return labelTextString;
}

- (void)setLabelTextString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_labelTextString, a3);
}

- (void)_readLabelArtwork
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
        GEOPDTransitLabelReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabelArtwork_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLabelArtwork
{
  return self->_labelArtwork != 0;
}

- (GEOTransitArtworkDataSource)labelArtwork
{
  -[GEOPDTransitLabel _readLabelArtwork]((uint64_t)self);
  labelArtwork = self->_labelArtwork;

  return (GEOTransitArtworkDataSource *)labelArtwork;
}

- (void)setLabelArtwork:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_labelArtwork, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTransitLabel;
  int v4 = [(GEOPDTransitLabel *)&v8 description];
  v5 = [(GEOPDTransitLabel *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitLabel _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
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
        objc_super v6 = off_1E53E4350[v5];
      }
      if (a2) {
        objc_super v7 = @"labelType";
      }
      else {
        objc_super v7 = @"label_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 labelTextString];
    if (v8)
    {
      if (a2) {
        v9 = @"labelTextString";
      }
      else {
        v9 = @"label_text_string";
      }
      [v4 setObject:v8 forKey:v9];
    }

    v10 = [(id)a1 labelArtwork];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"labelArtwork";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"label_artwork";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = *(void **)(a1 + 16);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __47__GEOPDTransitLabel__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
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
  return -[GEOPDTransitLabel _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOPDTransitLabel__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDTransitLabel)initWithDictionary:(id)a3
{
  return (GEOPDTransitLabel *)-[GEOPDTransitLabel _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_36;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_36;
  }
  if (a3) {
    objc_super v6 = @"labelType";
  }
  else {
    objc_super v6 = @"label_type";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"TRANSIT_LABEL_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"TRANSIT_LABEL_TYPE_STRING"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"TRANSIT_LABEL_TYPE_SHIELD"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"TRANSIT_LABEL_TYPE_ARTWORK"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"TRANSIT_LABEL_TYPE_SEPARATOR"])
    {
      uint64_t v9 = 4;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_21:
    [a1 setLabelType:v9];
  }

  if (a3) {
    id v10 = @"labelTextString";
  }
  else {
    id v10 = @"label_text_string";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = (void *)[v11 copy];
    [a1 setLabelTextString:v12];
  }
  if (a3) {
    v13 = @"labelArtwork";
  }
  else {
    v13 = @"label_artwork";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [GEOPBTransitArtwork alloc];
    if (a3) {
      uint64_t v16 = [(GEOPBTransitArtwork *)v15 initWithJSON:v14];
    }
    else {
      uint64_t v16 = [(GEOPBTransitArtwork *)v15 initWithDictionary:v14];
    }
    v17 = (void *)v16;
    [a1 setLabelArtwork:v16];
  }
LABEL_36:

  return a1;
}

- (GEOPDTransitLabel)initWithJSON:(id)a3
{
  return (GEOPDTransitLabel *)-[GEOPDTransitLabel _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_9385;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_9386;
    }
    GEOPDTransitLabelReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOPBTransitArtwork *)self->_labelArtwork readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDTransitLabelIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitLabelReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDTransitLabelIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOPDTransitLabel *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_labelTextString)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_labelArtwork)
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
  [(GEOPDTransitLabel *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 13) = self->_labelType;
    *((unsigned char *)v5 + 56) |= 1u;
  }
  if (self->_labelTextString)
  {
    objc_msgSend(v5, "setLabelTextString:");
    int v4 = v5;
  }
  if (self->_labelArtwork)
  {
    objc_msgSend(v5, "setLabelArtwork:");
    int v4 = v5;
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
      GEOPDTransitLabelReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDTransitLabel *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_labelType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_labelTextString copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOPBTransitArtwork *)self->_labelArtwork copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

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
  [(GEOPDTransitLabel *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_labelType != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  labelTextString = self->_labelTextString;
  if ((unint64_t)labelTextString | *((void *)v4 + 4)
    && !-[NSString isEqual:](labelTextString, "isEqual:"))
  {
    goto LABEL_11;
  }
  labelArtwork = self->_labelArtwork;
  if ((unint64_t)labelArtwork | *((void *)v4 + 3)) {
    char v7 = -[GEOPBTransitArtwork isEqual:](labelArtwork, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPDTransitLabel *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_labelType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_labelTextString hash] ^ v3;
  return v4 ^ [(GEOPBTransitArtwork *)self->_labelArtwork hash];
}

- (void)mergeFrom:(id)a3
{
  char v7 = (int *)a3;
  [v7 readAll:0];
  NSUInteger v4 = v7;
  if (v7[14])
  {
    self->_labelType = v7[13];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v7 + 4))
  {
    -[GEOPDTransitLabel setLabelTextString:](self, "setLabelTextString:");
    NSUInteger v4 = v7;
  }
  labelArtwork = self->_labelArtwork;
  uint64_t v6 = *((void *)v4 + 3);
  if (labelArtwork)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOPBTransitArtwork mergeFrom:](labelArtwork, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOPDTransitLabel setLabelArtwork:](self, "setLabelArtwork:");
  }
  NSUInteger v4 = v7;
LABEL_11:
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
      GEOPDTransitLabelReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_9390);
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
    [(GEOPDTransitLabel *)self readAll:0];
    labelArtwork = self->_labelArtwork;
    [(GEOPBTransitArtwork *)labelArtwork clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelTextString, 0);
  objc_storeStrong((id *)&self->_labelArtwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (unint64_t)type
{
  if ([(GEOPDTransitLabel *)self hasLabelType]
    && (int v3 = [(GEOPDTransitLabel *)self labelType], v3 <= 4))
  {
    return qword_18A63E860[v3];
  }
  else
  {
    return 0;
  }
}

- (NSString)labelString
{
  if ([(GEOPDTransitLabel *)self type] == 2)
  {
    int v3 = [(GEOPDTransitLabel *)self labelTextString];
  }
  else
  {
    int v3 = 0;
  }

  return (NSString *)v3;
}

@end