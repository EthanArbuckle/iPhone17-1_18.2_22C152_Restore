@interface GEORPTileFeedback
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCoordinate;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLabel;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPCorrectedCoordinate)coordinate;
- (GEORPCorrectedLabel)label;
- (GEORPTileFeedback)init;
- (GEORPTileFeedback)initWithData:(id)a3;
- (GEORPTileFeedback)initWithDictionary:(id)a3;
- (GEORPTileFeedback)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readCoordinate;
- (void)_readLabel;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCoordinate:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPTileFeedback

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPTileFeedbackIsDirty((uint64_t)self))
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPTileFeedback *)self readAll:0];
    if (self->_label) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_coordinate)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (GEORPTileFeedback)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPTileFeedback;
  v2 = [(GEORPTileFeedback *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPTileFeedback)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPTileFeedback;
  v3 = [(GEORPTileFeedback *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readLabel
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
        GEORPTileFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabel_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (GEORPCorrectedLabel)label
{
  -[GEORPTileFeedback _readLabel]((uint64_t)self);
  label = self->_label;

  return label;
}

- (void)setLabel:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_label, a3);
}

- (void)_readCoordinate
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
        GEORPTileFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCoordinate_tags_3729);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (GEORPCorrectedCoordinate)coordinate
{
  -[GEORPTileFeedback _readCoordinate]((uint64_t)self);
  coordinate = self->_coordinate;

  return coordinate;
}

- (void)setCoordinate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DBDB8[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TILE_CORRECTION_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TILE_CORRECTION_TYPE_EDIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TILE_CORRECTION_TYPE_REMOVE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPTileFeedback;
  int v4 = [(GEORPTileFeedback *)&v8 description];
  id v5 = [(GEORPTileFeedback *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPTileFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 label];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"label"];
    }
    objc_super v8 = [(id)a1 coordinate];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"coordinate"];
    }
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v11 = *(int *)(a1 + 52);
      if (v11 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_1E53DBDB8[v11];
      }
      [v4 setObject:v12 forKey:@"type"];
    }
    v13 = *(void **)(a1 + 16);
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __47__GEORPTileFeedback__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
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
  return -[GEORPTileFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEORPTileFeedback__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPTileFeedback)initWithDictionary:(id)a3
{
  return (GEORPTileFeedback *)-[GEORPTileFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"label"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEORPCorrectedLabel alloc];
        if (a3) {
          uint64_t v8 = [(GEORPCorrectedLabel *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEORPCorrectedLabel *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setLabel:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"coordinate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [GEORPCorrectedCoordinate alloc];
        if (a3) {
          uint64_t v12 = [(GEORPCorrectedCoordinate *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEORPCorrectedCoordinate *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setCoordinate:v12];
      }
      v14 = [v5 objectForKeyedSubscript:@"type"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
        if ([v15 isEqualToString:@"TILE_CORRECTION_TYPE_UNKNOWN"])
        {
          uint64_t v16 = 0;
        }
        else if ([v15 isEqualToString:@"TILE_CORRECTION_TYPE_EDIT"])
        {
          uint64_t v16 = 1;
        }
        else if ([v15 isEqualToString:@"TILE_CORRECTION_TYPE_REMOVE"])
        {
          uint64_t v16 = 2;
        }
        else
        {
          uint64_t v16 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_25:

          goto LABEL_26;
        }
        uint64_t v16 = [v14 intValue];
      }
      [a1 setType:v16];
      goto LABEL_25;
    }
  }
LABEL_26:

  return a1;
}

- (GEORPTileFeedback)initWithJSON:(id)a3
{
  return (GEORPTileFeedback *)-[GEORPTileFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_3734;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_3735;
    }
    GEORPTileFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORPCorrectedLabel *)self->_label readAll:1];
    [(GEORPCorrectedCoordinate *)self->_coordinate readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPTileFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPTileFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPTileFeedback _readCoordinate]((uint64_t)self);
  if ([(GEORPCorrectedCoordinate *)self->_coordinate hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPTileFeedback _readLabel]((uint64_t)self);
  label = self->_label;

  return [(GEORPCorrectedLabel *)label hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  int v4 = (id *)a3;
  [(GEORPTileFeedback *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_label) {
    objc_msgSend(v4, "setLabel:");
  }
  if (self->_coordinate) {
    objc_msgSend(v4, "setCoordinate:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 13) = self->_type;
    *((unsigned char *)v4 + 56) |= 1u;
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
      GEORPTileFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPTileFeedback *)self readAll:0];
  id v9 = [(GEORPCorrectedLabel *)self->_label copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEORPCorrectedCoordinate *)self->_coordinate copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_type;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
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
    goto LABEL_10;
  }
  [(GEORPTileFeedback *)self readAll:1];
  [v4 readAll:1];
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 4))
  {
    if (!-[GEORPCorrectedLabel isEqual:](label, "isEqual:")) {
      goto LABEL_10;
    }
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((void *)v4 + 3))
  {
    if (!-[GEORPCorrectedCoordinate isEqual:](coordinate, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) != 0 && self->_type == *((_DWORD *)v4 + 13))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  [(GEORPTileFeedback *)self readAll:1];
  unint64_t v3 = [(GEORPCorrectedLabel *)self->_label hash];
  unint64_t v4 = [(GEORPCorrectedCoordinate *)self->_coordinate hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_type;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v9 = a3;
  [v9 readAll:0];
  unint64_t v4 = v9;
  label = self->_label;
  uint64_t v6 = v9[4];
  if (label)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEORPCorrectedLabel mergeFrom:](label, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEORPTileFeedback setLabel:](self, "setLabel:");
  }
  unint64_t v4 = v9;
LABEL_7:
  coordinate = self->_coordinate;
  uint64_t v8 = v4[3];
  if (coordinate)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEORPCorrectedCoordinate mergeFrom:](coordinate, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEORPTileFeedback setCoordinate:](self, "setCoordinate:");
  }
  unint64_t v4 = v9;
LABEL_13:
  if (v4[7])
  {
    self->_type = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
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
      GEORPTileFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3739);
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
    [(GEORPTileFeedback *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end