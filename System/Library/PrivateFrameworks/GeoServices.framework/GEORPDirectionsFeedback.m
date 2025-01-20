@interface GEORPDirectionsFeedback
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCorrectionType;
- (BOOL)hasDirectionsContext;
- (BOOL)hasDirectionsCorrections;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPDirectionsCorrections)directionsCorrections;
- (GEORPDirectionsFeedback)init;
- (GEORPDirectionsFeedback)initWithData:(id)a3;
- (GEORPDirectionsFeedback)initWithDictionary:(id)a3;
- (GEORPDirectionsFeedback)initWithJSON:(id)a3;
- (GEORPDirectionsFeedbackContext)directionsContext;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)correctionTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsCorrectionType:(id)a3;
- (int)correctionType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDirectionsContext;
- (void)_readDirectionsCorrections;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCorrectionType:(int)a3;
- (void)setDirectionsContext:(id)a3;
- (void)setDirectionsCorrections:(id)a3;
- (void)setHasCorrectionType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPDirectionsFeedback

- (GEORPDirectionsFeedback)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPDirectionsFeedback;
  v2 = [(GEORPDirectionsFeedback *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPDirectionsFeedback)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPDirectionsFeedback;
  v3 = [(GEORPDirectionsFeedback *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDirectionsContext
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
        GEORPDirectionsFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsContext_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDirectionsContext
{
  return self->_directionsContext != 0;
}

- (GEORPDirectionsFeedbackContext)directionsContext
{
  -[GEORPDirectionsFeedback _readDirectionsContext]((uint64_t)self);
  directionsContext = self->_directionsContext;

  return directionsContext;
}

- (void)setDirectionsContext:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_directionsContext, a3);
}

- (void)_readDirectionsCorrections
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
        GEORPDirectionsFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsCorrections_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDirectionsCorrections
{
  return self->_directionsCorrections != 0;
}

- (GEORPDirectionsCorrections)directionsCorrections
{
  -[GEORPDirectionsFeedback _readDirectionsCorrections]((uint64_t)self);
  directionsCorrections = self->_directionsCorrections;

  return directionsCorrections;
}

- (void)setDirectionsCorrections:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_directionsCorrections, a3);
}

- (int)correctionType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_correctionType;
  }
  else {
    return 0;
  }
}

- (void)setCorrectionType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_correctionType = a3;
}

- (void)setHasCorrectionType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasCorrectionType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)correctionTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DB8F0[a3];
  }

  return v3;
}

- (int)StringAsCorrectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DIRECTIONS_CORRECTION_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_CORRECTION_TYPE_INSTRUCTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_CORRECTION_TYPE_ARRIVAL_ENTRY_POINT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_CORRECTION_TYPE_OTHER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_CORRECTION_TYPE_ROUTE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_CORRECTION_TYPE_ETA"])
  {
    int v4 = 5;
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
  v8.super_class = (Class)GEORPDirectionsFeedback;
  int v4 = [(GEORPDirectionsFeedback *)&v8 description];
  v5 = [(GEORPDirectionsFeedback *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPDirectionsFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 directionsContext];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"directionsContext";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"directions_context";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 directionsCorrections];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"directionsCorrections";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"directions_corrections";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v13 = *(int *)(a1 + 52);
      if (v13 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = off_1E53DB8F0[v13];
      }
      if (a2) {
        v15 = @"correctionType";
      }
      else {
        v15 = @"correction_type";
      }
      [v4 setObject:v14 forKey:v15];
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
        v23[2] = __53__GEORPDirectionsFeedback__dictionaryRepresentation___block_invoke;
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
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPDirectionsFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEORPDirectionsFeedback__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPDirectionsFeedback)initWithDictionary:(id)a3
{
  return (GEORPDirectionsFeedback *)-[GEORPDirectionsFeedback _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"directionsContext";
      }
      else {
        objc_super v6 = @"directions_context";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEORPDirectionsFeedbackContext alloc];
        if (a3) {
          uint64_t v9 = [(GEORPDirectionsFeedbackContext *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEORPDirectionsFeedbackContext *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setDirectionsContext:v9];
      }
      if (a3) {
        v11 = @"directionsCorrections";
      }
      else {
        v11 = @"directions_corrections";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [GEORPDirectionsCorrections alloc];
        if (a3) {
          uint64_t v14 = [(GEORPDirectionsCorrections *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEORPDirectionsCorrections *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setDirectionsCorrections:v14];
      }
      if (a3) {
        v16 = @"correctionType";
      }
      else {
        v16 = @"correction_type";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v17;
        if ([v18 isEqualToString:@"DIRECTIONS_CORRECTION_TYPE_UNKNOWN"])
        {
          uint64_t v19 = 0;
        }
        else if ([v18 isEqualToString:@"DIRECTIONS_CORRECTION_TYPE_INSTRUCTION"])
        {
          uint64_t v19 = 1;
        }
        else if ([v18 isEqualToString:@"DIRECTIONS_CORRECTION_TYPE_ARRIVAL_ENTRY_POINT"])
        {
          uint64_t v19 = 2;
        }
        else if ([v18 isEqualToString:@"DIRECTIONS_CORRECTION_TYPE_OTHER"])
        {
          uint64_t v19 = 3;
        }
        else if ([v18 isEqualToString:@"DIRECTIONS_CORRECTION_TYPE_ROUTE"])
        {
          uint64_t v19 = 4;
        }
        else if ([v18 isEqualToString:@"DIRECTIONS_CORRECTION_TYPE_ETA"])
        {
          uint64_t v19 = 5;
        }
        else
        {
          uint64_t v19 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_40:

          goto LABEL_41;
        }
        uint64_t v19 = [v17 intValue];
      }
      [a1 setCorrectionType:v19];
      goto LABEL_40;
    }
  }
LABEL_41:

  return a1;
}

- (GEORPDirectionsFeedback)initWithJSON:(id)a3
{
  return (GEORPDirectionsFeedback *)-[GEORPDirectionsFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_742;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_743;
    }
    GEORPDirectionsFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORPDirectionsFeedbackContext *)self->_directionsContext readAll:1];
    [(GEORPDirectionsCorrections *)self->_directionsCorrections readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPDirectionsFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPDirectionsFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPDirectionsFeedbackIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORPDirectionsFeedback *)self readAll:0];
    if (self->_directionsContext) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_directionsCorrections)
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

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPDirectionsFeedback _readDirectionsContext]((uint64_t)self);
  if ([(GEORPDirectionsFeedbackContext *)self->_directionsContext hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPDirectionsFeedback _readDirectionsCorrections]((uint64_t)self);
  directionsCorrections = self->_directionsCorrections;

  return [(GEORPDirectionsCorrections *)directionsCorrections hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  int v4 = (id *)a3;
  [(GEORPDirectionsFeedback *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_directionsContext) {
    objc_msgSend(v4, "setDirectionsContext:");
  }
  if (self->_directionsCorrections) {
    objc_msgSend(v4, "setDirectionsCorrections:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 13) = self->_correctionType;
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
      GEORPDirectionsFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPDirectionsFeedback *)self readAll:0];
  id v9 = [(GEORPDirectionsFeedbackContext *)self->_directionsContext copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEORPDirectionsCorrections *)self->_directionsCorrections copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_correctionType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v13 = self->_unknownFields;
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
  [(GEORPDirectionsFeedback *)self readAll:1];
  [v4 readAll:1];
  directionsContext = self->_directionsContext;
  if ((unint64_t)directionsContext | *((void *)v4 + 3))
  {
    if (!-[GEORPDirectionsFeedbackContext isEqual:](directionsContext, "isEqual:")) {
      goto LABEL_10;
    }
  }
  directionsCorrections = self->_directionsCorrections;
  if ((unint64_t)directionsCorrections | *((void *)v4 + 4))
  {
    if (!-[GEORPDirectionsCorrections isEqual:](directionsCorrections, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) != 0 && self->_correctionType == *((_DWORD *)v4 + 13))
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
  [(GEORPDirectionsFeedback *)self readAll:1];
  unint64_t v3 = [(GEORPDirectionsFeedbackContext *)self->_directionsContext hash];
  unint64_t v4 = [(GEORPDirectionsCorrections *)self->_directionsCorrections hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_correctionType;
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
  directionsContext = self->_directionsContext;
  uint64_t v6 = v9[3];
  if (directionsContext)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEORPDirectionsFeedbackContext mergeFrom:](directionsContext, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEORPDirectionsFeedback setDirectionsContext:](self, "setDirectionsContext:");
  }
  unint64_t v4 = v9;
LABEL_7:
  directionsCorrections = self->_directionsCorrections;
  uint64_t v8 = v4[4];
  if (directionsCorrections)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEORPDirectionsCorrections mergeFrom:](directionsCorrections, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEORPDirectionsFeedback setDirectionsCorrections:](self, "setDirectionsCorrections:");
  }
  unint64_t v4 = v9;
LABEL_13:
  if (v4[7])
  {
    self->_correctionType = *((_DWORD *)v4 + 13);
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
      GEORPDirectionsFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_747);
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
    [(GEORPDirectionsFeedback *)self readAll:0];
    [(GEORPDirectionsFeedbackContext *)self->_directionsContext clearUnknownFields:1];
    directionsCorrections = self->_directionsCorrections;
    [(GEORPDirectionsCorrections *)directionsCorrections clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsCorrections, 0);
  objc_storeStrong((id *)&self->_directionsContext, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end