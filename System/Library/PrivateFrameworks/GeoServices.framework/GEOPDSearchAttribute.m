@interface GEOPDSearchAttribute
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchAttribute)init;
- (GEOPDSearchAttribute)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchAttribute

- (GEOPDSearchAttribute)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchAttribute;
  v2 = [(GEOPDSearchAttribute *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchAttribute)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchAttribute;
  v3 = [(GEOPDSearchAttribute *)&v7 initWithData:a3];
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
  v8.super_class = (Class)GEOPDSearchAttribute;
  v4 = [(GEOPDSearchAttribute *)&v8 description];
  v5 = [(GEOPDSearchAttribute *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchAttribute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_55;
  }
  -[GEOPDSearchAttribute readAll:](a1, 1);
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_WORD *)(a1 + 68) & 0x40) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      id v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchAttributeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_8);
      objc_sync_exit(v6);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  id v7 = *(id *)(a1 + 32);
  if (v7) {
    [v4 setObject:v7 forKey:@"name"];
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_WORD *)(a1 + 68) & 0x10) == 0)
  {
    objc_super v8 = *(void **)(a1 + 8);
    if (v8)
    {
      id v9 = v8;
      objc_sync_enter(v9);
      GEOPDSearchAttributeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributeId_tags);
      objc_sync_exit(v9);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  id v10 = *(id *)(a1 + 16);
  if (v10)
  {
    if (a2) {
      v11 = @"attributeId";
    }
    else {
      v11 = @"attribute_id";
    }
    [v4 setObject:v10 forKey:v11];
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_WORD *)(a1 + 68) & 0x80) == 0)
  {
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      id v13 = v12;
      objc_sync_enter(v13);
      GEOPDSearchAttributeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenSet_tags);
      objc_sync_exit(v13);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  id v14 = *(id *)(a1 + 40);
  v15 = v14;
  if (v14)
  {
    if (a2)
    {
      v16 = [v14 jsonRepresentation];
      v17 = @"tokenSet";
    }
    else
    {
      v16 = [v14 dictionaryRepresentation];
      v17 = @"token_set";
    }
    [v4 setObject:v16 forKey:v17];
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_WORD *)(a1 + 68) & 0x20) == 0)
  {
    v18 = *(void **)(a1 + 8);
    if (v18)
    {
      id v19 = v18;
      objc_sync_enter(v19);
      GEOPDSearchAttributeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributeValue_tags);
      objc_sync_exit(v19);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  id v20 = *(id *)(a1 + 24);
  if (v20)
  {
    if (a2) {
      v21 = @"attributeValue";
    }
    else {
      v21 = @"attribute_value";
    }
    [v4 setObject:v20 forKey:v21];
  }

  __int16 v22 = *(_WORD *)(a1 + 68);
  if ((v22 & 2) != 0)
  {
    v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
    if (a2) {
      v24 = @"isOptionalAttribute";
    }
    else {
      v24 = @"is_optional_attribute";
    }
    [v4 setObject:v23 forKey:v24];

    __int16 v22 = *(_WORD *)(a1 + 68);
    if ((v22 & 8) == 0)
    {
LABEL_33:
      if ((v22 & 1) == 0) {
        goto LABEL_34;
      }
LABEL_44:
      uint64_t v27 = *(int *)(a1 + 60);
      if (v27 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = off_1E53E2558[v27];
      }
      if (a2) {
        v29 = @"rankingOrder";
      }
      else {
        v29 = @"ranking_order";
      }
      [v4 setObject:v28 forKey:v29];

      if ((*(_WORD *)(a1 + 68) & 4) == 0) {
        goto LABEL_55;
      }
      goto LABEL_51;
    }
  }
  else if ((v22 & 8) == 0)
  {
    goto LABEL_33;
  }
  v25 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 66)];
  if (a2) {
    v26 = @"negateAttribute";
  }
  else {
    v26 = @"negate_attribute";
  }
  [v4 setObject:v25 forKey:v26];

  __int16 v22 = *(_WORD *)(a1 + 68);
  if (v22) {
    goto LABEL_44;
  }
LABEL_34:
  if ((v22 & 4) != 0)
  {
LABEL_51:
    v30 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 65)];
    if (a2) {
      v31 = @"isOptionalKeyword";
    }
    else {
      v31 = @"is_optional_keyword";
    }
    [v4 setObject:v30 forKey:v31];
  }
LABEL_55:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchAttribute _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_201;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_202;
      }
      GEOPDSearchAttributeReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDSearchTokenSet readAll:](*(void *)(a1 + 40), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchAttributeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchAttributeIsDirty((uint64_t)self) & 1) == 0)
  {
    id v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
    goto LABEL_21;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchAttribute readAll:]((uint64_t)self, 0);
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_attributeId) {
    PBDataWriterWriteStringField();
  }
  if (self->_tokenSet) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_attributeValue) {
    PBDataWriterWriteStringField();
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_13:
      if ((flags & 1) == 0) {
        goto LABEL_14;
      }
LABEL_18:
      PBDataWriterWriteInt32Field();
      if ((*(_WORD *)&self->_flags & 4) == 0) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if (flags) {
    goto LABEL_18;
  }
LABEL_14:
  if ((flags & 4) != 0) {
LABEL_19:
  }
    PBDataWriterWriteBOOLField();
LABEL_21:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchAttribute readAll:]((uint64_t)self, 0);
    uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
    id v10 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v9;

    uint64_t v11 = [(NSString *)self->_attributeId copyWithZone:a3];
    v12 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v11;

    id v13 = [(GEOPDSearchTokenSet *)self->_tokenSet copyWithZone:a3];
    id v14 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v13;

    uint64_t v15 = [(NSString *)self->_attributeValue copyWithZone:a3];
    v16 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v15;

    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(unsigned char *)(v5 + 64) = self->_isOptionalAttribute;
      *(_WORD *)(v5 + 68) |= 2u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 8) == 0)
      {
LABEL_7:
        if ((flags & 1) == 0) {
          goto LABEL_8;
        }
        goto LABEL_13;
      }
    }
    else if ((flags & 8) == 0)
    {
      goto LABEL_7;
    }
    *(unsigned char *)(v5 + 66) = self->_negateAttribute;
    *(_WORD *)(v5 + 68) |= 8u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_8:
      if ((flags & 4) == 0) {
        return (id)v5;
      }
LABEL_9:
      *(unsigned char *)(v5 + 65) = self->_isOptionalKeyword;
      *(_WORD *)(v5 + 68) |= 4u;
      return (id)v5;
    }
LABEL_13:
    *(_DWORD *)(v5 + 60) = self->_rankingOrder;
    *(_WORD *)(v5 + 68) |= 1u;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_9;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSearchAttributeReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  -[GEOPDSearchAttribute readAll:]((uint64_t)self, 1);
  -[GEOPDSearchAttribute readAll:]((uint64_t)v4, 1);
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_33;
    }
  }
  attributeId = self->_attributeId;
  if ((unint64_t)attributeId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](attributeId, "isEqual:")) {
      goto LABEL_33;
    }
  }
  tokenSet = self->_tokenSet;
  if ((unint64_t)tokenSet | *((void *)v4 + 5))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](tokenSet, "isEqual:")) {
      goto LABEL_33;
    }
  }
  attributeValue = self->_attributeValue;
  if ((unint64_t)attributeValue | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](attributeValue, "isEqual:")) {
      goto LABEL_33;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v10 = *((_WORD *)v4 + 34);
  if ((flags & 2) != 0)
  {
    if ((v10 & 2) == 0) {
      goto LABEL_33;
    }
    if (self->_isOptionalAttribute)
    {
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_33;
      }
    }
    else if (*((unsigned char *)v4 + 64))
    {
      goto LABEL_33;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 8) != 0)
  {
    if ((v10 & 8) == 0) {
      goto LABEL_33;
    }
    if (self->_negateAttribute)
    {
      if (!*((unsigned char *)v4 + 66)) {
        goto LABEL_33;
      }
    }
    else if (*((unsigned char *)v4 + 66))
    {
      goto LABEL_33;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_33;
  }
  if (flags)
  {
    if ((v10 & 1) == 0 || self->_rankingOrder != *((_DWORD *)v4 + 15)) {
      goto LABEL_33;
    }
  }
  else if (v10)
  {
    goto LABEL_33;
  }
  BOOL v11 = (v10 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v10 & 4) != 0)
    {
      if (self->_isOptionalKeyword)
      {
        if (!*((unsigned char *)v4 + 65)) {
          goto LABEL_33;
        }
      }
      else if (*((unsigned char *)v4 + 65))
      {
        goto LABEL_33;
      }
      BOOL v11 = 1;
      goto LABEL_34;
    }
LABEL_33:
    BOOL v11 = 0;
  }
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  -[GEOPDSearchAttribute readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_attributeId hash];
  unint64_t v5 = [(GEOPDSearchTokenSet *)self->_tokenSet hash];
  NSUInteger v6 = [(NSString *)self->_attributeValue hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    uint64_t v8 = 2654435761 * self->_isOptionalAttribute;
    if ((flags & 8) != 0)
    {
LABEL_3:
      uint64_t v9 = 2654435761 * self->_negateAttribute;
      if (flags) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v10 = 0;
      if ((flags & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v11 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((flags & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = 0;
  if ((flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v10 = 2654435761 * self->_rankingOrder;
  if ((flags & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v11 = 2654435761 * self->_isOptionalKeyword;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSet, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attributeValue, 0);
  objc_storeStrong((id *)&self->_attributeId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end