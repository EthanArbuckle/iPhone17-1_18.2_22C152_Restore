@interface GEOPDSearchAttributeIntent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchAttributeIntent)init;
- (GEOPDSearchAttributeIntent)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchAttributeIntent

- (GEOPDSearchAttributeIntent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchAttributeIntent;
  v2 = [(GEOPDSearchAttributeIntent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchAttributeIntent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchAttributeIntent;
  v3 = [(GEOPDSearchAttributeIntent *)&v7 initWithData:a3];
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
  v8.super_class = (Class)GEOPDSearchAttributeIntent;
  v4 = [(GEOPDSearchAttributeIntent *)&v8 description];
  v5 = [(GEOPDSearchAttributeIntent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchAttributeIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchAttributeIntent readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchAttributeIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_223);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v7 = *(id *)(a1 + 32);
    if (v7) {
      [v4 setObject:v7 forKey:@"name"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 2) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDSearchAttributeIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributeId_tags_224);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
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

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v12 = *(void **)(a1 + 8);
      if (v12)
      {
        id v13 = v12;
        objc_sync_enter(v13);
        GEOPDSearchAttributeIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenSet_tags_225);
        objc_sync_exit(v13);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v14 = *(id *)(a1 + 48);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      v18 = *(void **)(a1 + 8);
      if (v18)
      {
        id v19 = v18;
        objc_sync_enter(v19);
        GEOPDSearchAttributeIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributeValue_tags_226);
        objc_sync_exit(v19);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
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

    if (*(unsigned char *)(a1 + 72))
    {
      v22 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 68)];
      if (a2) {
        v23 = @"isOptionalAttribute";
      }
      else {
        v23 = @"is_optional_attribute";
      }
      [v4 setObject:v22 forKey:v23];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v24 = *(void **)(a1 + 8);
      if (v24)
      {
        id v25 = v24;
        objc_sync_enter(v25);
        GEOPDSearchAttributeIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStructuredAttribute_tags);
        objc_sync_exit(v25);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v26 = *(id *)(a1 + 40);
    v27 = v26;
    if (v26)
    {
      if (a2)
      {
        v28 = [v26 jsonRepresentation];
        v29 = @"structuredAttribute";
      }
      else
      {
        v28 = [v26 dictionaryRepresentation];
        v29 = @"structured_attribute";
      }
      [v4 setObject:v28 forKey:v29];
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
  return -[GEOPDSearchAttributeIntent _dictionaryRepresentation:]((uint64_t)self, 1);
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
        id v6 = (int *)&readAll__recursiveTag_234;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_235;
      }
      GEOPDSearchAttributeIntentReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      -[GEOPDSearchTokenSet readAll:](*(void *)(a1 + 48), 1);
      -[GEOPDSearchStructuredAttribute readAll:](*(void *)(a1 + 40), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchAttributeIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchAttributeIntentIsDirty((uint64_t)self) & 1) == 0)
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchAttributeIntent readAll:]((uint64_t)self, 0);
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
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_structuredAttribute) {
      PBDataWriterWriteSubmessage();
    }
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
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchAttributeIntentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchAttributeIntent readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_attributeId copyWithZone:a3];
  v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  id v13 = [(GEOPDSearchTokenSet *)self->_tokenSet copyWithZone:a3];
  id v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  uint64_t v15 = [(NSString *)self->_attributeValue copyWithZone:a3];
  v16 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v15;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 68) = self->_isOptionalAttribute;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  id v17 = [(GEOPDSearchStructuredAttribute *)self->_structuredAttribute copyWithZone:a3];
  id v8 = *(id *)(v5 + 40);
  *(void *)(v5 + 40) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  -[GEOPDSearchAttributeIntent readAll:]((uint64_t)self, 1);
  -[GEOPDSearchAttributeIntent readAll:]((uint64_t)v4, 1);
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_14;
    }
  }
  attributeId = self->_attributeId;
  if ((unint64_t)attributeId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](attributeId, "isEqual:")) {
      goto LABEL_14;
    }
  }
  tokenSet = self->_tokenSet;
  if ((unint64_t)tokenSet | *((void *)v4 + 6))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](tokenSet, "isEqual:")) {
      goto LABEL_14;
    }
  }
  attributeValue = self->_attributeValue;
  if ((unint64_t)attributeValue | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](attributeValue, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 72))
    {
      if (self->_isOptionalAttribute)
      {
        if (*((unsigned char *)v4 + 68)) {
          goto LABEL_20;
        }
      }
      else if (!*((unsigned char *)v4 + 68))
      {
        goto LABEL_20;
      }
    }
LABEL_14:
    char v9 = 0;
    goto LABEL_15;
  }
  if (*((unsigned char *)v4 + 72)) {
    goto LABEL_14;
  }
LABEL_20:
  structuredAttribute = self->_structuredAttribute;
  if ((unint64_t)structuredAttribute | *((void *)v4 + 5)) {
    char v9 = -[GEOPDSearchStructuredAttribute isEqual:](structuredAttribute, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDSearchAttributeIntent readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_attributeId hash];
  unint64_t v5 = [(GEOPDSearchTokenSet *)self->_tokenSet hash];
  NSUInteger v6 = [(NSString *)self->_attributeValue hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v7 = 2654435761 * self->_isOptionalAttribute;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(GEOPDSearchStructuredAttribute *)self->_structuredAttribute hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSet, 0);
  objc_storeStrong((id *)&self->_structuredAttribute, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attributeValue, 0);
  objc_storeStrong((id *)&self->_attributeId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end