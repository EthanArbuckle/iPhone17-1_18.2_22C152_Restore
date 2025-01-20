@interface GEOPDResultRefinementMetadata
+ (BOOL)isValid:(id)a3;
- (BOOL)hasMetadataDefault;
- (BOOL)hasMetadataSort;
- (BOOL)hasMetadataType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDResultRefinementMetadata)init;
- (GEOPDResultRefinementMetadata)initWithData:(id)a3;
- (GEOPDResultRefinementMetadata)initWithDictionary:(id)a3;
- (GEOPDResultRefinementMetadata)initWithJSON:(id)a3;
- (GEOPDResultRefinementMetadataDefault)metadataDefault;
- (GEOPDResultRefinementMetadataSort)metadataSort;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)metadataTypeAsString:(int)a3;
- (int)StringAsMetadataType:(id)a3;
- (int)metadataType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readMetadataDefault;
- (void)_readMetadataSort;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasMetadataType:(BOOL)a3;
- (void)setMetadataDefault:(id)a3;
- (void)setMetadataSort:(id)a3;
- (void)setMetadataType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultRefinementMetadata

- (GEOPDResultRefinementMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementMetadata;
  v2 = [(GEOPDResultRefinementMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementMetadata;
  v3 = [(GEOPDResultRefinementMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)metadataType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_metadataType;
  }
  else {
    return 0;
  }
}

- (void)setMetadataType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_metadataType = a3;
}

- (void)setHasMetadataType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasMetadataType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)metadataTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E5C88[a3];
  }

  return v3;
}

- (int)StringAsMetadataType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESULT_REFINEMENT_METADATA_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESULT_REFINEMENT_METADATA_TYPE_DEFAULT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESULT_REFINEMENT_METADATA_TYPE_SORT"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readMetadataDefault
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
        GEOPDResultRefinementMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMetadataDefault_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasMetadataDefault
{
  return self->_metadataDefault != 0;
}

- (GEOPDResultRefinementMetadataDefault)metadataDefault
{
  -[GEOPDResultRefinementMetadata _readMetadataDefault]((uint64_t)self);
  metadataDefault = self->_metadataDefault;

  return metadataDefault;
}

- (void)setMetadataDefault:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_metadataDefault, a3);
}

- (void)_readMetadataSort
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
        GEOPDResultRefinementMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMetadataSort_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasMetadataSort
{
  return self->_metadataSort != 0;
}

- (GEOPDResultRefinementMetadataSort)metadataSort
{
  -[GEOPDResultRefinementMetadata _readMetadataSort]((uint64_t)self);
  metadataSort = self->_metadataSort;

  return metadataSort;
}

- (void)setMetadataSort:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_metadataSort, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultRefinementMetadata;
  int v4 = [(GEOPDResultRefinementMetadata *)&v8 description];
  v5 = [(GEOPDResultRefinementMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
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
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E5C88[v5];
      }
      if (a2) {
        objc_super v7 = @"metadataType";
      }
      else {
        objc_super v7 = @"metadata_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 metadataDefault];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"metadataDefault";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"metadata_default";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [(id)a1 metadataSort];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"metadataSort";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"metadata_sort";
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
        v23[2] = __59__GEOPDResultRefinementMetadata__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDResultRefinementMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOPDResultRefinementMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDResultRefinementMetadata)initWithDictionary:(id)a3
{
  return (GEOPDResultRefinementMetadata *)-[GEOPDResultRefinementMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_35;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_35;
  }
  if (a3) {
    objc_super v6 = @"metadataType";
  }
  else {
    objc_super v6 = @"metadata_type";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"RESULT_REFINEMENT_METADATA_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"RESULT_REFINEMENT_METADATA_TYPE_DEFAULT"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"RESULT_REFINEMENT_METADATA_TYPE_SORT"])
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_17:
    [a1 setMetadataType:v9];
  }

  if (a3) {
    id v10 = @"metadataDefault";
  }
  else {
    id v10 = @"metadata_default";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [GEOPDResultRefinementMetadataDefault alloc];
    if (a3) {
      uint64_t v13 = [(GEOPDResultRefinementMetadataDefault *)v12 initWithJSON:v11];
    }
    else {
      uint64_t v13 = [(GEOPDResultRefinementMetadataDefault *)v12 initWithDictionary:v11];
    }
    v14 = (void *)v13;
    [a1 setMetadataDefault:v13];
  }
  if (a3) {
    v15 = @"metadataSort";
  }
  else {
    v15 = @"metadata_sort";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [GEOPDResultRefinementMetadataSort alloc];
    if (a3) {
      uint64_t v18 = [(GEOPDResultRefinementMetadataSort *)v17 initWithJSON:v16];
    }
    else {
      uint64_t v18 = [(GEOPDResultRefinementMetadataSort *)v17 initWithDictionary:v16];
    }
    v19 = (void *)v18;
    [a1 setMetadataSort:v18];
  }
LABEL_35:

  return a1;
}

- (GEOPDResultRefinementMetadata)initWithJSON:(id)a3
{
  return (GEOPDResultRefinementMetadata *)-[GEOPDResultRefinementMetadata _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_602;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_603;
    }
    GEOPDResultRefinementMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOPDResultRefinementMetadataDefault *)self->_metadataDefault readAll:1];
    [(GEOPDResultRefinementMetadataSort *)self->_metadataSort readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDResultRefinementMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDResultRefinementMetadataIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOPDResultRefinementMetadata *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_metadataDefault)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_metadataSort)
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
  [(GEOPDResultRefinementMetadata *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 13) = self->_metadataType;
    *((unsigned char *)v5 + 56) |= 1u;
  }
  if (self->_metadataDefault)
  {
    objc_msgSend(v5, "setMetadataDefault:");
    int v4 = v5;
  }
  if (self->_metadataSort)
  {
    objc_msgSend(v5, "setMetadataSort:");
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
      GEOPDResultRefinementMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDResultRefinementMetadata *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_metadataType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v9 = [(GEOPDResultRefinementMetadataDefault *)self->_metadataDefault copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOPDResultRefinementMetadataSort *)self->_metadataSort copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

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
    goto LABEL_11;
  }
  [(GEOPDResultRefinementMetadata *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_metadataType != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  metadataDefault = self->_metadataDefault;
  if ((unint64_t)metadataDefault | *((void *)v4 + 3)
    && !-[GEOPDResultRefinementMetadataDefault isEqual:](metadataDefault, "isEqual:"))
  {
    goto LABEL_11;
  }
  metadataSort = self->_metadataSort;
  if ((unint64_t)metadataSort | *((void *)v4 + 4)) {
    char v7 = -[GEOPDResultRefinementMetadataSort isEqual:](metadataSort, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPDResultRefinementMetadata *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_metadataType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDResultRefinementMetadataDefault *)self->_metadataDefault hash] ^ v3;
  return v4 ^ [(GEOPDResultRefinementMetadataSort *)self->_metadataSort hash];
}

- (void)mergeFrom:(id)a3
{
  id v9 = (int *)a3;
  [v9 readAll:0];
  unint64_t v4 = v9;
  if (v9[14])
  {
    self->_metadataType = v9[13];
    *(unsigned char *)&self->_flags |= 1u;
  }
  metadataDefault = self->_metadataDefault;
  uint64_t v6 = *((void *)v9 + 3);
  if (metadataDefault)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDResultRefinementMetadataDefault mergeFrom:](metadataDefault, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDResultRefinementMetadata setMetadataDefault:](self, "setMetadataDefault:");
  }
  unint64_t v4 = v9;
LABEL_9:
  metadataSort = self->_metadataSort;
  uint64_t v8 = *((void *)v4 + 4);
  if (metadataSort)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOPDResultRefinementMetadataSort mergeFrom:](metadataSort, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOPDResultRefinementMetadata setMetadataSort:](self, "setMetadataSort:");
  }
  unint64_t v4 = v9;
LABEL_15:
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
      GEOPDResultRefinementMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_607);
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
    [(GEOPDResultRefinementMetadata *)self readAll:0];
    [(GEOPDResultRefinementMetadataDefault *)self->_metadataDefault clearUnknownFields:1];
    metadataSort = self->_metadataSort;
    [(GEOPDResultRefinementMetadataSort *)metadataSort clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataSort, 0);
  objc_storeStrong((id *)&self->_metadataDefault, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end