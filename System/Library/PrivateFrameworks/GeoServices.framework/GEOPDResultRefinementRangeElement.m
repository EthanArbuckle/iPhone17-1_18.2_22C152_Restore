@interface GEOPDResultRefinementRangeElement
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDResultRefinementRangeElement)init;
- (GEOPDResultRefinementRangeElement)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultRefinementRangeElement

- (GEOPDResultRefinementRangeElement)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementRangeElement;
  v3 = [(GEOPDResultRefinementRangeElement *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 8u;
    *(unsigned char *)(a1 + 76) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementRangeElement readAll:](a1, 0);
    }
  }
}

- (GEOPDResultRefinementRangeElement)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementRangeElement;
  v2 = [(GEOPDResultRefinementRangeElement *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultRefinementRangeElement;
  v4 = [(GEOPDResultRefinementRangeElement *)&v8 description];
  v5 = [(GEOPDResultRefinementRangeElement *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementRangeElement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDResultRefinementRangeElement readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDResultRefinementRangeElementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_1101);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v7 = *(id *)(a1 + 24);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"displayName";
      }
      else {
        objc_super v8 = @"display_name";
      }
      [v4 setObject:v7 forKey:v8];
    }

    char v9 = *(unsigned char *)(a1 + 76);
    if (v9)
    {
      v10 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      [v4 setObject:v10 forKey:@"value"];

      char v9 = *(unsigned char *)(a1 + 76);
    }
    if ((v9 & 4) != 0)
    {
      v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
      if (a2) {
        v12 = @"isEnabled";
      }
      else {
        v12 = @"is_enabled";
      }
      [v4 setObject:v11 forKey:v12];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v13 = *(void **)(a1 + 8);
      if (v13)
      {
        id v14 = v13;
        objc_sync_enter(v14);
        GEOPDResultRefinementRangeElementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRefinementKey_tags_1102);
        objc_sync_exit(v14);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v15 = *(id *)(a1 + 32);
    if (v15)
    {
      if (a2) {
        v16 = @"refinementKey";
      }
      else {
        v16 = @"refinement_key";
      }
      [v4 setObject:v15 forKey:v16];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
    {
      v17 = *(void **)(a1 + 8);
      if (v17)
      {
        id v18 = v17;
        objc_sync_enter(v18);
        GEOPDResultRefinementRangeElementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStringValue_tags);
        objc_sync_exit(v18);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v19 = *(id *)(a1 + 40);
    if (v19)
    {
      if (a2) {
        v20 = @"stringValue";
      }
      else {
        v20 = @"string_value";
      }
      [v4 setObject:v19 forKey:v20];
    }

    if ((*(unsigned char *)(a1 + 76) & 2) != 0)
    {
      int v21 = *(_DWORD *)(a1 + 68);
      if (v21)
      {
        if (v21 == 1)
        {
          v22 = @"RESULT_REFINEMENT_RANGE_VALUE_TYPE_NUMERIC";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 68));
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v22 = @"RESULT_REFINEMENT_RANGE_VALUE_TYPE_STRING";
      }
      if (a2) {
        v23 = @"valueType";
      }
      else {
        v23 = @"value_type";
      }
      [v4 setObject:v22 forKey:v23];
    }
    v24 = *(void **)(a1 + 16);
    if (v24)
    {
      v25 = [v24 dictionaryRepresentation];
      v26 = v25;
      if (a2)
      {
        v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __63__GEOPDResultRefinementRangeElement__dictionaryRepresentation___block_invoke;
        v31[3] = &unk_1E53D8860;
        id v28 = v27;
        id v32 = v28;
        [v26 enumerateKeysAndObjectsUsingBlock:v31];
        id v29 = v28;

        v26 = v29;
      }
      [v4 setObject:v26 forKey:@"Unknown Fields"];
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
  return -[GEOPDResultRefinementRangeElement _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_1124;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_1125;
      }
      GEOPDResultRefinementRangeElementReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __63__GEOPDResultRefinementRangeElement__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    char v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      id v7 = @"displayName";
    }
    else {
      id v7 = @"display_name";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v9 = (void *)[v8 copy];
      id v10 = v9;
      *(unsigned char *)(v6 + 76) |= 0x10u;
      *(unsigned char *)(v6 + 76) |= 0x80u;
      objc_storeStrong((id *)(v6 + 24), v9);
    }
    v11 = [v5 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 doubleValue];
      *(unsigned char *)(v6 + 76) |= 0x80u;
      *(unsigned char *)(v6 + 76) |= 1u;
      *(void *)(v6 + 48) = v12;
    }

    if (a3) {
      v13 = @"isEnabled";
    }
    else {
      v13 = @"is_enabled";
    }
    id v14 = [v5 objectForKeyedSubscript:v13];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v15 = [v14 BOOLValue];
      *(unsigned char *)(v6 + 76) |= 0x80u;
      *(unsigned char *)(v6 + 76) |= 4u;
      *(unsigned char *)(v6 + 72) = v15;
    }

    if (a3) {
      v16 = @"refinementKey";
    }
    else {
      v16 = @"refinement_key";
    }
    v17 = [v5 objectForKeyedSubscript:v16];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = (void *)[v17 copy];
      id v19 = v18;
      *(unsigned char *)(v6 + 76) |= 0x20u;
      *(unsigned char *)(v6 + 76) |= 0x80u;
      objc_storeStrong((id *)(v6 + 32), v18);
    }
    if (a3) {
      v20 = @"stringValue";
    }
    else {
      v20 = @"string_value";
    }
    int v21 = [v5 objectForKeyedSubscript:v20];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      id v23 = v22;
      *(unsigned char *)(v6 + 76) |= 0x40u;
      *(unsigned char *)(v6 + 76) |= 0x80u;
      objc_storeStrong((id *)(v6 + 40), v22);
    }
    if (a3) {
      v24 = @"valueType";
    }
    else {
      v24 = @"value_type";
    }
    v25 = [v5 objectForKeyedSubscript:v24];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v26 = v25;
      if ([v26 isEqualToString:@"RESULT_REFINEMENT_RANGE_VALUE_TYPE_STRING"]) {
        int v27 = 0;
      }
      else {
        int v27 = [v26 isEqualToString:@"RESULT_REFINEMENT_RANGE_VALUE_TYPE_NUMERIC"];
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_35:

        goto LABEL_36;
      }
      int v27 = [v25 intValue];
    }
    *(unsigned char *)(v6 + 76) |= 0x80u;
    *(unsigned char *)(v6 + 76) |= 2u;
    *(_DWORD *)(v6 + 68) = v27;
    goto LABEL_35;
  }
LABEL_36:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementRangeElementReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 0xFu))
  {
    id v7 = self->_reader;
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
    -[GEOPDResultRefinementRangeElement readAll:]((uint64_t)self, 0);
    if (self->_displayName) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    id v6 = v9;
    if (flags)
    {
      PBDataWriterWriteDoubleField();
      id v6 = v9;
      char flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v6 = v9;
    }
    if (self->_refinementKey)
    {
      PBDataWriterWriteStringField();
      id v6 = v9;
    }
    if (self->_stringValue)
    {
      PBDataWriterWriteStringField();
      id v6 = v9;
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDResultRefinementRangeElementReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDResultRefinementRangeElement readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_displayName copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(double *)(v5 + 48) = self->_value;
    *(unsigned char *)(v5 + 76) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 72) = self->_isEnabled;
    *(unsigned char *)(v5 + 76) |= 4u;
  }
  uint64_t v12 = [(NSString *)self->_refinementKey copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  uint64_t v14 = [(NSString *)self->_stringValue copyWithZone:a3];
  char v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_valueType;
    *(unsigned char *)(v5 + 76) |= 2u;
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
    goto LABEL_25;
  }
  -[GEOPDResultRefinementRangeElement readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinementRangeElement readAll:]((uint64_t)v4, 1);
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_25;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_value != *((double *)v4 + 6)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) != 0)
    {
      if (self->_isEnabled)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_17;
      }
    }
LABEL_25:
    BOOL v8 = 0;
    goto LABEL_26;
  }
  if ((*((unsigned char *)v4 + 76) & 4) != 0) {
    goto LABEL_25;
  }
LABEL_17:
  refinementKey = self->_refinementKey;
  if ((unint64_t)refinementKey | *((void *)v4 + 4)
    && !-[NSString isEqual:](refinementKey, "isEqual:"))
  {
    goto LABEL_25;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_25;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 76) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_valueType != *((_DWORD *)v4 + 17)) {
      goto LABEL_25;
    }
    BOOL v8 = 1;
  }
LABEL_26:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDResultRefinementRangeElement readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_displayName hash];
  char flags = (char)self->_flags;
  if (flags)
  {
    double value = self->_value;
    double v7 = -value;
    if (value >= 0.0) {
      double v7 = self->_value;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((flags & 4) != 0) {
    uint64_t v10 = 2654435761 * self->_isEnabled;
  }
  else {
    uint64_t v10 = 0;
  }
  NSUInteger v11 = [(NSString *)self->_refinementKey hash];
  NSUInteger v12 = [(NSString *)self->_stringValue hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v13 = 2654435761 * self->_valueType;
  }
  else {
    uint64_t v13 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_refinementKey, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end