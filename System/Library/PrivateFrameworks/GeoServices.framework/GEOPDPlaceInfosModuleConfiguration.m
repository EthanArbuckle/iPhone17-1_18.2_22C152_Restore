@interface GEOPDPlaceInfosModuleConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceInfosModuleConfiguration)init;
- (GEOPDPlaceInfosModuleConfiguration)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)factoidInfoItem;
- (id)jsonRepresentation;
- (id)locationInfoItem;
- (uint64_t)attributionType;
- (unint64_t)hash;
- (void)_readFactoidInfoItem;
- (void)_readLocationInfoItem;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceInfosModuleConfiguration

- (GEOPDPlaceInfosModuleConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceInfosModuleConfiguration;
  v2 = [(GEOPDPlaceInfosModuleConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceInfosModuleConfiguration)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceInfosModuleConfiguration;
  v3 = [(GEOPDPlaceInfosModuleConfiguration *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocationInfoItem
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
        GEOPDPlaceInfosModuleConfigurationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationInfoItem_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)locationInfoItem
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceInfosModuleConfiguration _readLocationInfoItem]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readFactoidInfoItem
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
        GEOPDPlaceInfosModuleConfigurationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFactoidInfoItem_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)factoidInfoItem
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceInfosModuleConfiguration _readFactoidInfoItem]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)attributionType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 56);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    if (v2) {
      return *(unsigned int *)(v1 + 52);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceInfosModuleConfiguration;
  v4 = [(GEOPDPlaceInfosModuleConfiguration *)&v8 description];
  v5 = [(GEOPDPlaceInfosModuleConfiguration *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceInfosModuleConfiguration _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPlaceInfosModuleConfiguration readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDPlaceInfosModuleConfiguration locationInfoItem]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"locationInfoItem";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"location_info_item";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = -[GEOPDPlaceInfosModuleConfiguration factoidInfoItem]((id *)a1);
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"factoidInfoItem";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"factoid_info_item";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if (*(unsigned char *)(a1 + 56))
    {
      int v13 = *(_DWORD *)(a1 + 52);
      if (v13)
      {
        if (v13 == 1)
        {
          v14 = @"ATTRIBUTION_TYPE_INDIGENOUS_ACKNOWLEDGEMENT";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 52));
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v14 = @"ATTRIBUTION_TYPE_VENDOR";
      }
      if (a2) {
        v15 = @"attributionType";
      }
      else {
        v15 = @"attribution_type";
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
        v23[2] = __64__GEOPDPlaceInfosModuleConfiguration__dictionaryRepresentation___block_invoke;
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
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceInfosModuleConfiguration _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_7601;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_7602;
      }
      GEOPDPlaceInfosModuleConfigurationReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __64__GEOPDPlaceInfosModuleConfiguration__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDPlaceInfosModuleConfigurationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
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
    -[GEOPDPlaceInfosModuleConfiguration readAll:]((uint64_t)self, 0);
    if (self->_locationInfoItem) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_factoidInfoItem)
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
      GEOPDPlaceInfosModuleConfigurationReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceInfosModuleConfiguration readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDLocationInfoItem *)self->_locationInfoItem copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOPDFactoidInfoItem *)self->_factoidInfoItem copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_attributionType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  int v13 = self->_unknownFields;
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
  -[GEOPDPlaceInfosModuleConfiguration readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceInfosModuleConfiguration readAll:]((uint64_t)v4, 1);
  locationInfoItem = self->_locationInfoItem;
  if ((unint64_t)locationInfoItem | *((void *)v4 + 4))
  {
    if (!-[GEOPDLocationInfoItem isEqual:](locationInfoItem, "isEqual:")) {
      goto LABEL_10;
    }
  }
  factoidInfoItem = self->_factoidInfoItem;
  if ((unint64_t)factoidInfoItem | *((void *)v4 + 3))
  {
    if (!-[GEOPDFactoidInfoItem isEqual:](factoidInfoItem, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) != 0 && self->_attributionType == *((_DWORD *)v4 + 13))
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
  -[GEOPDPlaceInfosModuleConfiguration readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDLocationInfoItem *)self->_locationInfoItem hash];
  unint64_t v4 = [(GEOPDFactoidInfoItem *)self->_factoidInfoItem hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_attributionType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationInfoItem, 0);
  objc_storeStrong((id *)&self->_factoidInfoItem, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end