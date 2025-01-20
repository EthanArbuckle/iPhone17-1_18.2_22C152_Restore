@interface GEOPDLinkedPlace
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDLinkedPlace)init;
- (GEOPDLinkedPlace)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)center;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mapsId;
- (id)name;
- (id)styleAttributes;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)clearUnknownFields:(uint64_t)result;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_readCenter;
- (void)_readMapsId;
- (void)_readName;
- (void)_readStyleAttributes;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDLinkedPlace

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDLinkedPlace _readCenter](result);
    if ([*(id *)(v3 + 24) hasGreenTeaWithValue:a2])
    {
      return 1;
    }
    else
    {
      -[GEOPDLinkedPlace _readMapsId](v3);
      v4 = *(void **)(v3 + 40);
      return [v4 hasGreenTeaWithValue:a2];
    }
  }
  return result;
}

- (uint64_t)clearUnknownFields:(uint64_t)result
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(v1 + 76) |= 2u;
    *(unsigned char *)(v1 + 76) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    v2 = *(void **)(v1 + 16);
    *(void *)(v1 + 16) = 0;

    -[GEOPDLinkedPlace readAll:](v1, 0);
    [*(id *)(v1 + 40) clearUnknownFields:1];
    [*(id *)(v1 + 24) clearUnknownFields:1];
    uint64_t v3 = *(void **)(v1 + 56);
    return [v3 clearUnknownFields:1];
  }
  return result;
}

- (GEOPDLinkedPlace)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDLinkedPlace;
  v2 = [(GEOPDLinkedPlace *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDLinkedPlace)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDLinkedPlace;
  uint64_t v3 = [(GEOPDLinkedPlace *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMapsId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDLinkedPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsId_tags_6099);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)mapsId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDLinkedPlace _readMapsId]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDLinkedPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_6100);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)name
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDLinkedPlace _readName]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDLinkedPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_6101);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)center
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDLinkedPlace _readCenter]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDLinkedPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_6102);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)styleAttributes
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDLinkedPlace _readStyleAttributes]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDLinkedPlace;
  v4 = [(GEOPDLinkedPlace *)&v8 description];
  v5 = [(GEOPDLinkedPlace *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLinkedPlace _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDLinkedPlace readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDLinkedPlace mapsId]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"mapsId";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"maps_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = -[GEOPDLinkedPlace name]((id *)a1);
    if (v9) {
      [v4 setObject:v9 forKey:@"name"];
    }

    v10 = -[GEOPDLinkedPlace center]((id *)a1);
    v11 = v10;
    if (v10)
    {
      if (a2) {
        [v10 jsonRepresentation];
      }
      else {
      v12 = [v10 dictionaryRepresentation];
      }
      [v4 setObject:v12 forKey:@"center"];
    }
    v13 = -[GEOPDLinkedPlace styleAttributes]((id *)a1);
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"styleAttributes";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"style_attributes";
      }
      [v4 setObject:v15 forKey:v16];
    }
    if (*(unsigned char *)(a1 + 76))
    {
      v17 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      if (a2) {
        v18 = @"featureId";
      }
      else {
        v18 = @"feature_id";
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
        v26[2] = __46__GEOPDLinkedPlace__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDLinkedPlace _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_6103;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_6104;
      }
      GEOPDLinkedPlaceReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      [*(id *)(a1 + 40) readAll:1];
      [*(id *)(a1 + 24) readAll:1];
      [*(id *)(a1 + 56) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __46__GEOPDLinkedPlace__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      objc_super v7 = @"mapsId";
    }
    else {
      objc_super v7 = @"maps_id";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [GEOPDMapsIdentifier alloc];
      if (a3) {
        id v10 = [(GEOPDMapsIdentifier *)v9 initWithJSON:v8];
      }
      else {
        id v10 = [(GEOPDMapsIdentifier *)v9 initWithDictionary:v8];
      }
      v11 = v10;
      v12 = v10;
      *(unsigned char *)(v6 + 76) |= 8u;
      *(unsigned char *)(v6 + 76) |= 0x40u;
      objc_storeStrong((id *)(v6 + 40), v11);
    }
    v13 = [v5 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = (void *)[v13 copy];
      id v15 = v14;
      *(unsigned char *)(v6 + 76) |= 0x10u;
      *(unsigned char *)(v6 + 76) |= 0x40u;
      objc_storeStrong((id *)(v6 + 48), v14);
    }
    v16 = [v5 objectForKeyedSubscript:@"center"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [GEOLatLng alloc];
      if (a3) {
        v18 = [(GEOLatLng *)v17 initWithJSON:v16];
      }
      else {
        v18 = [(GEOLatLng *)v17 initWithDictionary:v16];
      }
      v19 = v18;
      v20 = v18;
      *(unsigned char *)(v6 + 76) |= 4u;
      *(unsigned char *)(v6 + 76) |= 0x40u;
      objc_storeStrong((id *)(v6 + 24), v19);
    }
    if (a3) {
      v21 = @"styleAttributes";
    }
    else {
      v21 = @"style_attributes";
    }
    v22 = [v5 objectForKeyedSubscript:v21];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = [GEOStyleAttributes alloc];
      if (a3) {
        id v24 = [(GEOStyleAttributes *)v23 initWithJSON:v22];
      }
      else {
        id v24 = [(GEOStyleAttributes *)v23 initWithDictionary:v22];
      }
      v25 = v24;
      v26 = v24;
      *(unsigned char *)(v6 + 76) |= 0x20u;
      *(unsigned char *)(v6 + 76) |= 0x40u;
      objc_storeStrong((id *)(v6 + 56), v25);
    }
    if (a3) {
      id v27 = @"featureId";
    }
    else {
      id v27 = @"feature_id";
    }
    v28 = [v5 objectForKeyedSubscript:v27];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v29 = [v28 unsignedLongLongValue];
      *(unsigned char *)(v6 + 76) |= 0x40u;
      *(unsigned char *)(v6 + 76) |= 1u;
      *(void *)(v6 + 32) = v29;
    }
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDLinkedPlaceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7C) == 0))
  {
    uint64_t v6 = self->_reader;
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
    -[GEOPDLinkedPlace readAll:]((uint64_t)self, 0);
    if (self->_mapsId) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_name)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_center)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_styleAttributes)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteUint64Field();
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
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDLinkedPlaceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDLinkedPlace readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDMapsIdentifier *)self->_mapsId copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_name copyWithZone:a3];
  v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  id v13 = [(GEOLatLng *)self->_center copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  id v15 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  v16 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v15;

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 32) = self->_featureId;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  -[GEOPDLinkedPlace readAll:]((uint64_t)self, 1);
  -[GEOPDLinkedPlace readAll:]((uint64_t)v4, 1);
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((void *)v4 + 5))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:")) {
      goto LABEL_14;
    }
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_14;
    }
  }
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:")) {
      goto LABEL_14;
    }
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 7))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:")) {
      goto LABEL_14;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 76) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) != 0 && self->_featureId == *((void *)v4 + 4))
    {
      BOOL v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDLinkedPlace readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDMapsIdentifier *)self->_mapsId hash];
  NSUInteger v4 = [(NSString *)self->_name hash];
  unint64_t v5 = [(GEOLatLng *)self->_center hash];
  unint64_t v6 = [(GEOStyleAttributes *)self->_styleAttributes hash];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v7 = 2654435761u * self->_featureId;
  }
  else {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end