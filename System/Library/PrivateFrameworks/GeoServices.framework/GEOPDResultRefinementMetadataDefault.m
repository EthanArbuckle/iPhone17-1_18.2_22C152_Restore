@interface GEOPDResultRefinementMetadataDefault
+ (BOOL)isValid:(id)a3;
- (BOOL)hasRefinementKey;
- (BOOL)hasRefinementMetadataDefaultType;
- (BOOL)hasRefinementValue;
- (BOOL)hasRefinementValueMetadata;
- (BOOL)hasSelectionFromQuery;
- (BOOL)hasSelectionFromQuerySequenceNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)selectionFromQuery;
- (GEOPDResultRefinementMetadataDefault)init;
- (GEOPDResultRefinementMetadataDefault)initWithData:(id)a3;
- (GEOPDResultRefinementMetadataDefault)initWithDictionary:(id)a3;
- (GEOPDResultRefinementMetadataDefault)initWithJSON:(id)a3;
- (NSData)refinementValueMetadata;
- (NSString)refinementKey;
- (NSString)refinementValue;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)refinementMetadataDefaultTypeAsString:(int)a3;
- (int)StringAsRefinementMetadataDefaultType:(id)a3;
- (int)refinementMetadataDefaultType;
- (unint64_t)hash;
- (unsigned)selectionFromQuerySequenceNumber;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readRefinementKey;
- (void)_readRefinementValue;
- (void)_readRefinementValueMetadata;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasRefinementMetadataDefaultType:(BOOL)a3;
- (void)setHasSelectionFromQuery:(BOOL)a3;
- (void)setHasSelectionFromQuerySequenceNumber:(BOOL)a3;
- (void)setRefinementKey:(id)a3;
- (void)setRefinementMetadataDefaultType:(int)a3;
- (void)setRefinementValue:(id)a3;
- (void)setRefinementValueMetadata:(id)a3;
- (void)setSelectionFromQuery:(BOOL)a3;
- (void)setSelectionFromQuerySequenceNumber:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultRefinementMetadataDefault

- (GEOPDResultRefinementMetadataDefault)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementMetadataDefault;
  v2 = [(GEOPDResultRefinementMetadataDefault *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementMetadataDefault)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementMetadataDefault;
  v3 = [(GEOPDResultRefinementMetadataDefault *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRefinementKey
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMetadataDefaultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRefinementKey_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRefinementKey
{
  return self->_refinementKey != 0;
}

- (NSString)refinementKey
{
  -[GEOPDResultRefinementMetadataDefault _readRefinementKey]((uint64_t)self);
  refinementKey = self->_refinementKey;

  return refinementKey;
}

- (void)setRefinementKey:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_refinementKey, a3);
}

- (int)refinementMetadataDefaultType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_refinementMetadataDefaultType;
  }
  else {
    return 0;
  }
}

- (void)setRefinementMetadataDefaultType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_refinementMetadataDefaultType = a3;
}

- (void)setHasRefinementMetadataDefaultType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasRefinementMetadataDefaultType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)refinementMetadataDefaultTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E5CA0[a3];
  }

  return v3;
}

- (int)StringAsRefinementMetadataDefaultType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESULT_REFINEMENT_METADATA_DEFAULT_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESULT_REFINEMENT_METADATA_DEFAULT_TYPE_STRING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESULT_REFINEMENT_METADATA_DEFAULT_TYPE_BYTES"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readRefinementValue
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 72) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMetadataDefaultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRefinementValue_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRefinementValue
{
  return self->_refinementValue != 0;
}

- (NSString)refinementValue
{
  -[GEOPDResultRefinementMetadataDefault _readRefinementValue]((uint64_t)self);
  refinementValue = self->_refinementValue;

  return refinementValue;
}

- (void)setRefinementValue:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_refinementValue, a3);
}

- (void)_readRefinementValueMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMetadataDefaultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRefinementValueMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRefinementValueMetadata
{
  return self->_refinementValueMetadata != 0;
}

- (NSData)refinementValueMetadata
{
  -[GEOPDResultRefinementMetadataDefault _readRefinementValueMetadata]((uint64_t)self);
  refinementValueMetadata = self->_refinementValueMetadata;

  return refinementValueMetadata;
}

- (void)setRefinementValueMetadata:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_refinementValueMetadata, a3);
}

- (unsigned)selectionFromQuerySequenceNumber
{
  return self->_selectionFromQuerySequenceNumber;
}

- (void)setSelectionFromQuerySequenceNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_selectionFromQuerySequenceNumber = a3;
}

- (void)setHasSelectionFromQuerySequenceNumber:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSelectionFromQuerySequenceNumber
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)selectionFromQuery
{
  return self->_selectionFromQuery;
}

- (void)setSelectionFromQuery:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  self->_selectionFromQuery = a3;
}

- (void)setHasSelectionFromQuery:(BOOL)a3
{
  if (a3) {
    char v3 = -124;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSelectionFromQuery
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultRefinementMetadataDefault;
  int v4 = [(GEOPDResultRefinementMetadataDefault *)&v8 description];
  v5 = [(GEOPDResultRefinementMetadataDefault *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementMetadataDefault _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 refinementKey];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"refinementKey";
      }
      else {
        objc_super v6 = @"refinement_key";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v7 = *(int *)(a1 + 60);
      if (v7 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v8 = off_1E53E5CA0[v7];
      }
      if (a2) {
        v9 = @"refinementMetadataDefaultType";
      }
      else {
        v9 = @"refinement_metadata_default_type";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = [(id)a1 refinementValue];
    if (v10)
    {
      if (a2) {
        v11 = @"refinementValue";
      }
      else {
        v11 = @"refinement_value";
      }
      [v4 setObject:v10 forKey:v11];
    }

    v12 = [(id)a1 refinementValueMetadata];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 base64EncodedStringWithOptions:0];
        [v4 setObject:v14 forKey:@"refinementValueMetadata"];
      }
      else
      {
        [v4 setObject:v12 forKey:@"refinement_value_metadata"];
      }
    }

    char v15 = *(unsigned char *)(a1 + 72);
    if ((v15 & 2) != 0)
    {
      v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
      if (a2) {
        v17 = @"selectionFromQuerySequenceNumber";
      }
      else {
        v17 = @"selection_from_query_sequence_number";
      }
      [v4 setObject:v16 forKey:v17];

      char v15 = *(unsigned char *)(a1 + 72);
    }
    if ((v15 & 4) != 0)
    {
      v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 68)];
      if (a2) {
        v19 = @"selectionFromQuery";
      }
      else {
        v19 = @"selection_from_query";
      }
      [v4 setObject:v18 forKey:v19];
    }
    v20 = *(void **)(a1 + 16);
    if (v20)
    {
      v21 = [v20 dictionaryRepresentation];
      v22 = v21;
      if (a2)
      {
        v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __66__GEOPDResultRefinementMetadataDefault__dictionaryRepresentation___block_invoke;
        v27[3] = &unk_1E53D8860;
        id v24 = v23;
        id v28 = v24;
        [v22 enumerateKeysAndObjectsUsingBlock:v27];
        id v25 = v24;

        v22 = v25;
      }
      [v4 setObject:v22 forKey:@"Unknown Fields"];
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
  return -[GEOPDResultRefinementMetadataDefault _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __66__GEOPDResultRefinementMetadataDefault__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
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

- (GEOPDResultRefinementMetadataDefault)initWithDictionary:(id)a3
{
  return (GEOPDResultRefinementMetadataDefault *)-[GEOPDResultRefinementMetadataDefault _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_44;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_44;
  }
  if (a3) {
    objc_super v6 = @"refinementKey";
  }
  else {
    objc_super v6 = @"refinement_key";
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setRefinementKey:v8];
  }
  if (a3) {
    v9 = @"refinementMetadataDefaultType";
  }
  else {
    v9 = @"refinement_metadata_default_type";
  }
  id v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    if ([v11 isEqualToString:@"RESULT_REFINEMENT_METADATA_DEFAULT_TYPE_UNKNOWN"])
    {
      uint64_t v12 = 0;
    }
    else if ([v11 isEqualToString:@"RESULT_REFINEMENT_METADATA_DEFAULT_TYPE_STRING"])
    {
      uint64_t v12 = 1;
    }
    else if ([v11 isEqualToString:@"RESULT_REFINEMENT_METADATA_DEFAULT_TYPE_BYTES"])
    {
      uint64_t v12 = 2;
    }
    else
    {
      uint64_t v12 = 0;
    }

    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v10 intValue];
LABEL_22:
    [a1 setRefinementMetadataDefaultType:v12];
  }

  if (a3) {
    v13 = @"refinementValue";
  }
  else {
    v13 = @"refinement_value";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v15 = (void *)[v14 copy];
    [a1 setRefinementValue:v15];
  }
  if (a3) {
    v16 = @"refinementValueMetadata";
  }
  else {
    v16 = @"refinement_value_metadata";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v17 options:0];
    [a1 setRefinementValueMetadata:v18];
  }
  if (a3) {
    v19 = @"selectionFromQuerySequenceNumber";
  }
  else {
    v19 = @"selection_from_query_sequence_number";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSelectionFromQuerySequenceNumber:", objc_msgSend(v20, "unsignedIntValue"));
  }

  if (a3) {
    v21 = @"selectionFromQuery";
  }
  else {
    v21 = @"selection_from_query";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSelectionFromQuery:", objc_msgSend(v22, "BOOLValue"));
  }

LABEL_44:
  return a1;
}

- (GEOPDResultRefinementMetadataDefault)initWithJSON:(id)a3
{
  return (GEOPDResultRefinementMetadataDefault *)-[GEOPDResultRefinementMetadataDefault _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_682;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_683;
    }
    GEOPDResultRefinementMetadataDefaultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDResultRefinementMetadataDefaultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementMetadataDefaultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 0xFu))
  {
    uint64_t v7 = self->_reader;
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
    [(GEOPDResultRefinementMetadataDefault *)self readAll:0];
    if (self->_refinementKey) {
      PBDataWriterWriteStringField();
    }
    id v5 = v9;
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
    }
    if (self->_refinementValue)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    if (self->_refinementValueMetadata)
    {
      PBDataWriterWriteDataField();
      id v5 = v9;
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v9;
      char flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOPDResultRefinementMetadataDefault *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_refinementKey) {
    objc_msgSend(v6, "setRefinementKey:");
  }
  int v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v6 + 15) = self->_refinementMetadataDefaultType;
    *((unsigned char *)v6 + 72) |= 1u;
  }
  if (self->_refinementValue)
  {
    objc_msgSend(v6, "setRefinementValue:");
    int v4 = v6;
  }
  if (self->_refinementValueMetadata)
  {
    objc_msgSend(v6, "setRefinementValueMetadata:");
    int v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_selectionFromQuerySequenceNumber;
    *((unsigned char *)v4 + 72) |= 2u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v4 + 68) = self->_selectionFromQuery;
    *((unsigned char *)v4 + 72) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDResultRefinementMetadataDefaultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDResultRefinementMetadataDefault *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_refinementKey copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_refinementMetadataDefaultType;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v11 = [(NSString *)self->_refinementValue copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  uint64_t v13 = [(NSData *)self->_refinementValueMetadata copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_selectionFromQuerySequenceNumber;
    *(unsigned char *)(v5 + 72) |= 2u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 68) = self->_selectionFromQuery;
    *(unsigned char *)(v5 + 72) |= 4u;
  }
  v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  [(GEOPDResultRefinementMetadataDefault *)self readAll:1];
  [v4 readAll:1];
  refinementKey = self->_refinementKey;
  if ((unint64_t)refinementKey | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](refinementKey, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_refinementMetadataDefaultType != *((_DWORD *)v4 + 15)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_20;
  }
  refinementValue = self->_refinementValue;
  if ((unint64_t)refinementValue | *((void *)v4 + 5)
    && !-[NSString isEqual:](refinementValue, "isEqual:"))
  {
    goto LABEL_20;
  }
  refinementValueMetadata = self->_refinementValueMetadata;
  if ((unint64_t)refinementValueMetadata | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](refinementValueMetadata, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_selectionFromQuerySequenceNumber != *((_DWORD *)v4 + 16)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_20;
  }
  BOOL v8 = (*((unsigned char *)v4 + 72) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0)
    {
LABEL_20:
      BOOL v8 = 0;
      goto LABEL_21;
    }
    if (self->_selectionFromQuery)
    {
      if (!*((unsigned char *)v4 + 68)) {
        goto LABEL_20;
      }
    }
    else if (*((unsigned char *)v4 + 68))
    {
      goto LABEL_20;
    }
    BOOL v8 = 1;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  [(GEOPDResultRefinementMetadataDefault *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_refinementKey hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_refinementMetadataDefaultType;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_refinementValue hash];
  uint64_t v6 = [(NSData *)self->_refinementValueMetadata hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_selectionFromQuerySequenceNumber;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_selectionFromQuery;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v6 = a3;
  [v6 readAll:0];
  uint64_t v4 = v6;
  if (v6[3])
  {
    -[GEOPDResultRefinementMetadataDefault setRefinementKey:](self, "setRefinementKey:");
    uint64_t v4 = v6;
  }
  if (v4[9])
  {
    self->_refinementMetadataDefaultType = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (v4[5])
  {
    -[GEOPDResultRefinementMetadataDefault setRefinementValue:](self, "setRefinementValue:");
    uint64_t v4 = v6;
  }
  if (v4[4])
  {
    -[GEOPDResultRefinementMetadataDefault setRefinementValueMetadata:](self, "setRefinementValueMetadata:");
    uint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 72);
  if ((v5 & 2) != 0)
  {
    self->_selectionFromQuerySequenceNumber = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 72);
  }
  if ((v5 & 4) != 0)
  {
    self->_selectionFromQuery = *((unsigned char *)v4 + 68);
    *(unsigned char *)&self->_flags |= 4u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      char v5 = reader;
      objc_sync_enter(v5);
      GEOPDResultRefinementMetadataDefaultReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_687);
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
  *(unsigned char *)&self->_flags |= 0x88u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDResultRefinementMetadataDefault *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinementValue, 0);
  objc_storeStrong((id *)&self->_refinementValueMetadata, 0);
  objc_storeStrong((id *)&self->_refinementKey, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end