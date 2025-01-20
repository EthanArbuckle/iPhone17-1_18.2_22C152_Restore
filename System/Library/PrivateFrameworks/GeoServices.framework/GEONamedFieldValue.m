@interface GEONamedFieldValue
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEONamedFieldValue)init;
- (GEONamedFieldValue)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEONamedFieldValue

- (GEONamedFieldValue)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEONamedFieldValue;
  v2 = [(GEONamedFieldValue *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEONamedFieldValue)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEONamedFieldValue;
  v3 = [(GEONamedFieldValue *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONamedFieldValue;
  v4 = [(GEONamedFieldValue *)&v8 description];
  v5 = [(GEONamedFieldValue *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONamedFieldValue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEONamedFieldValue readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 72))
    {
      v5 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      if (a2) {
        objc_super v6 = @"doubleValue";
      }
      else {
        objc_super v6 = @"double_value";
      }
      [v4 setObject:v5 forKey:v6];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      objc_super v7 = *(void **)(a1 + 8);
      if (v7)
      {
        id v8 = v7;
        objc_sync_enter(v8);
        GEONamedFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStringValue_tags_0);
        objc_sync_exit(v8);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v9 = *(id *)(a1 + 48);
    if (v9)
    {
      if (a2) {
        v10 = @"stringValue";
      }
      else {
        v10 = @"string_value";
      }
      [v4 setObject:v9 forKey:v10];
    }

    char v11 = *(unsigned char *)(a1 + 72);
    if ((v11 & 2) != 0)
    {
      v12 = [NSNumber numberWithLongLong:*(void *)(a1 + 32)];
      if (a2) {
        v13 = @"intValue";
      }
      else {
        v13 = @"int_value";
      }
      [v4 setObject:v12 forKey:v13];

      char v11 = *(unsigned char *)(a1 + 72);
    }
    if ((v11 & 4) != 0)
    {
      v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 68)];
      if (a2) {
        v15 = @"BOOLValue";
      }
      else {
        v15 = @"BOOL_value";
      }
      [v4 setObject:v14 forKey:v15];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v16 = *(void **)(a1 + 8);
      if (v16)
      {
        id v17 = v16;
        objc_sync_enter(v17);
        GEONamedFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapValue_tags);
        objc_sync_exit(v17);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v18 = *(id *)(a1 + 40);
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"mapValue";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"map_value";
      }
      [v4 setObject:v20 forKey:v21];
    }
    v22 = *(void **)(a1 + 16);
    if (v22)
    {
      v23 = [v22 dictionaryRepresentation];
      v24 = v23;
      if (a2)
      {
        v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __48__GEONamedFieldValue__dictionaryRepresentation___block_invoke;
        v29[3] = &unk_1E53D8860;
        id v26 = v25;
        id v30 = v26;
        [v24 enumerateKeysAndObjectsUsingBlock:v29];
        id v27 = v26;

        v24 = v27;
      }
      [v4 setObject:v24 forKey:@"Unknown Fields"];
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
  return -[GEONamedFieldValue _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_1704;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_1705;
      }
      GEONamedFieldValueReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEONamedField readAll:](*(void *)(a1 + 40), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __48__GEONamedFieldValue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEONamedFieldValueReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEONamedFieldValueIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEONamedFieldValue readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
    id v5 = v9;
    if (self->_stringValue)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt64Field();
      id v5 = v9;
      char flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v9;
    }
    if (self->_mapValue)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
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
      GEONamedFieldValueReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEONamedFieldValue readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 24) = self->_doubleValue;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_stringValue copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 32) = self->_intValue;
    *(unsigned char *)(v5 + 72) |= 2u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 68) = self->_BOOLValue;
    *(unsigned char *)(v5 + 72) |= 4u;
  }
  id v12 = [(GEONamedField *)self->_mapValue copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  v14 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v14;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  -[GEONamedFieldValue readAll:]((uint64_t)self, 1);
  -[GEONamedFieldValue readAll:]((uint64_t)v4, 1);
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 72);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_doubleValue != *((double *)v4 + 3)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_19;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_19;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 72);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_intValue != *((void *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((flags & 4) == 0)
  {
    if ((v6 & 4) == 0) {
      goto LABEL_25;
    }
LABEL_19:
    char v8 = 0;
    goto LABEL_20;
  }
  if ((v6 & 4) == 0) {
    goto LABEL_19;
  }
  if (!self->_BOOLValue)
  {
    if (!*((unsigned char *)v4 + 68)) {
      goto LABEL_25;
    }
    goto LABEL_19;
  }
  if (!*((unsigned char *)v4 + 68)) {
    goto LABEL_19;
  }
LABEL_25:
  mapValue = self->_mapValue;
  if ((unint64_t)mapValue | *((void *)v4 + 5)) {
    char v8 = -[GEONamedField isEqual:](mapValue, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  -[GEONamedFieldValue readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags)
  {
    double doubleValue = self->_doubleValue;
    double v5 = -doubleValue;
    if (doubleValue >= 0.0) {
      double v5 = self->_doubleValue;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_stringValue hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v9 = 2654435761 * self->_intValue;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v10 = 0;
    return v8 ^ v3 ^ v9 ^ v10 ^ [(GEONamedField *)self->_mapValue hash];
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_BOOLValue;
  return v8 ^ v3 ^ v9 ^ v10 ^ [(GEONamedField *)self->_mapValue hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_mapValue, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end