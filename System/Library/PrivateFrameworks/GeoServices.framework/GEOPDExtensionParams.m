@interface GEOPDExtensionParams
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDExtensionParams)init;
- (GEOPDExtensionParams)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)externalItemId;
- (id)jsonRepresentation;
- (id)vendorId;
- (unint64_t)hash;
- (void)_readExternalItemId;
- (void)_readVendorId;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDExtensionParams

- (GEOPDExtensionParams)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDExtensionParams;
  v2 = [(GEOPDExtensionParams *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDExtensionParams)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDExtensionParams;
  v3 = [(GEOPDExtensionParams *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDExtensionParams;
  [(GEOPDExtensionParams *)&v3 dealloc];
}

- (void)_readVendorId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDExtensionParamsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVendorId_tags_5041);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)vendorId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDExtensionParams _readVendorId]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readExternalItemId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDExtensionParamsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExternalItemId_tags_5042);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)externalItemId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDExtensionParams _readExternalItemId]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDExtensionParams;
  v4 = [(GEOPDExtensionParams *)&v8 description];
  v5 = [(GEOPDExtensionParams *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDExtensionParams _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDExtensionParams readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDExtensionParams vendorId]((id *)a1);
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"vendorId";
      }
      else {
        objc_super v6 = @"vendor_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = -[GEOPDExtensionParams externalItemId]((id *)a1);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"externalItemId";
      }
      else {
        objc_super v8 = @"external_item_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    if (*(void *)(a1 + 32))
    {
      v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v10 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v11 = 0;
        do
        {
          uint64_t v12 = *(int *)(*v10 + 4 * v11);
          if (v12 >= 3)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = off_1E53E39C8[v12];
          }
          [v9 addObject:v13];

          ++v11;
          v10 = (void *)(a1 + 24);
        }
        while (v11 < *(void *)(a1 + 32));
      }
      if (a2) {
        v14 = @"extensionType";
      }
      else {
        v14 = @"extension_type";
      }
      [v4 setObject:v9 forKey:v14];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v15 = *(void **)(a1 + 8);
      if (v15)
      {
        id v16 = v15;
        objc_sync_enter(v16);
        GEOPDExtensionParamsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppAdamId_tags_5043);
        objc_sync_exit(v16);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v17 = *(id *)(a1 + 48);
    if (v17)
    {
      if (a2) {
        v18 = @"appAdamId";
      }
      else {
        v18 = @"app_adam_id";
      }
      [v4 setObject:v17 forKey:v18];
    }

    v19 = *(void **)(a1 + 16);
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __50__GEOPDExtensionParams__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
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
  return -[GEOPDExtensionParams _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_5050;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_5051;
      }
      GEOPDExtensionParamsReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __50__GEOPDExtensionParams__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDExtensionParamsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3E) == 0))
  {
    objc_super v7 = self->_reader;
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
    -[GEOPDExtensionParams readAll:]((uint64_t)self, 0);
    if (self->_vendorId) {
      PBDataWriterWriteStringField();
    }
    id v5 = v9;
    if (self->_externalItemId)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    if (self->_extensionTypes.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v9;
        ++v6;
      }
      while (v6 < self->_extensionTypes.count);
    }
    if (self->_appAdamId)
    {
      PBDataWriterWriteStringField();
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
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDExtensionParams readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_vendorId copyWithZone:a3];
    id v9 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v8;

    uint64_t v10 = [(NSString *)self->_externalItemId copyWithZone:a3];
    unint64_t v11 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v10;

    PBRepeatedInt32Copy();
    uint64_t v12 = [(NSString *)self->_appAdamId copyWithZone:a3];
    v13 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDExtensionParamsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDExtensionParams readAll:]((uint64_t)self, 1),
         -[GEOPDExtensionParams readAll:]((uint64_t)v4, 1),
         vendorId = self->_vendorId,
         !((unint64_t)vendorId | v4[8]))
     || -[NSString isEqual:](vendorId, "isEqual:"))
    && ((externalItemId = self->_externalItemId, !((unint64_t)externalItemId | v4[7]))
     || -[NSString isEqual:](externalItemId, "isEqual:"))
    && PBRepeatedInt32IsEqual())
  {
    appAdamId = self->_appAdamId;
    if ((unint64_t)appAdamId | v4[6]) {
      char v8 = -[NSString isEqual:](appAdamId, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDExtensionParams readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_vendorId hash];
  NSUInteger v4 = [(NSString *)self->_externalItemId hash] ^ v3;
  uint64_t v5 = v4 ^ PBRepeatedInt32Hash();
  return v5 ^ [(NSString *)self->_appAdamId hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorId, 0);
  objc_storeStrong((id *)&self->_externalItemId, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end