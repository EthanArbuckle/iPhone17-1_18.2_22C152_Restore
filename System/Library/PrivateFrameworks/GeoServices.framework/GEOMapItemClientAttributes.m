@interface GEOMapItemClientAttributes
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddressBookAttributes;
- (BOOL)hasCorrectedLocationAttributes;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMapsSyncAttributes;
- (BOOL)hasRoutineAttributes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapItemAddressBookAttributes)addressBookAttributes;
- (GEOMapItemClientAttributes)init;
- (GEOMapItemClientAttributes)initWithData:(id)a3;
- (GEOMapItemClientAttributes)initWithDictionary:(id)a3;
- (GEOMapItemClientAttributes)initWithJSON:(id)a3;
- (GEOMapItemCorrectedLocationAttributes)correctedLocationAttributes;
- (GEOMapItemMapsSyncAttributes)mapsSyncAttributes;
- (GEOMapItemRoutineAttributes)routineAttributes;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readAddressBookAttributes;
- (void)_readCorrectedLocationAttributes;
- (void)_readMapsSyncAttributes;
- (void)_readRoutineAttributes;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddressBookAttributes:(id)a3;
- (void)setCorrectedLocationAttributes:(id)a3;
- (void)setMapsSyncAttributes:(id)a3;
- (void)setRoutineAttributes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapItemClientAttributes

- (BOOL)hasCorrectedLocationAttributes
{
  return self->_correctedLocationAttributes != 0;
}

- (void)_readCorrectedLocationAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemClientAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrectedLocationAttributes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)setMapsSyncAttributes:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_mapsSyncAttributes, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOMapItemClientAttributes *)self readAll:0];
    id v8 = [(GEOMapItemAddressBookAttributes *)self->_addressBookAttributes copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    id v10 = [(GEOMapItemRoutineAttributes *)self->_routineAttributes copyWithZone:a3];
    v11 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v10;

    id v12 = [(GEOMapItemCorrectedLocationAttributes *)self->_correctedLocationAttributes copyWithZone:a3];
    v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    id v14 = [(GEOMapItemMapsSyncAttributes *)self->_mapsSyncAttributes copyWithZone:a3];
    v15 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOMapItemClientAttributesReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (GEOMapItemClientAttributes)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapItemClientAttributes;
  v2 = [(GEOMapItemClientAttributes *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineAttributes, 0);
  objc_storeStrong((id *)&self->_mapsSyncAttributes, 0);
  objc_storeStrong((id *)&self->_correctedLocationAttributes, 0);
  objc_storeStrong((id *)&self->_addressBookAttributes, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOMapItemClientAttributesIsDirty((uint64_t)self))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOMapItemClientAttributes *)self readAll:0];
    if (self->_addressBookAttributes) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_routineAttributes)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_correctedLocationAttributes)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_mapsSyncAttributes)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOMapItemClientAttributes *)self readAll:1],
         [v4 readAll:1],
         addressBookAttributes = self->_addressBookAttributes,
         !((unint64_t)addressBookAttributes | v4[3]))
     || -[GEOMapItemAddressBookAttributes isEqual:](addressBookAttributes, "isEqual:"))
    && ((routineAttributes = self->_routineAttributes, !((unint64_t)routineAttributes | v4[6]))
     || -[GEOMapItemRoutineAttributes isEqual:](routineAttributes, "isEqual:"))
    && ((correctedLocationAttributes = self->_correctedLocationAttributes,
         !((unint64_t)correctedLocationAttributes | v4[4]))
     || -[GEOMapItemCorrectedLocationAttributes isEqual:](correctedLocationAttributes, "isEqual:")))
  {
    mapsSyncAttributes = self->_mapsSyncAttributes;
    if ((unint64_t)mapsSyncAttributes | v4[5]) {
      char v9 = -[GEOMapItemMapsSyncAttributes isEqual:](mapsSyncAttributes, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_868;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_869;
    }
    GEOMapItemClientAttributesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOMapItemClientAttributesCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (BOOL)hasRoutineAttributes
{
  return self->_routineAttributes != 0;
}

- (BOOL)hasAddressBookAttributes
{
  return self->_addressBookAttributes != 0;
}

- (void)_readRoutineAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemClientAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoutineAttributes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)_readAddressBookAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemClientAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressBookAttributes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (GEOMapItemClientAttributes)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMapItemClientAttributes;
  id v3 = [(GEOMapItemClientAttributes *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (GEOMapItemAddressBookAttributes)addressBookAttributes
{
  -[GEOMapItemClientAttributes _readAddressBookAttributes]((uint64_t)self);
  addressBookAttributes = self->_addressBookAttributes;

  return addressBookAttributes;
}

- (void)setAddressBookAttributes:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_addressBookAttributes, a3);
}

- (GEOMapItemRoutineAttributes)routineAttributes
{
  -[GEOMapItemClientAttributes _readRoutineAttributes]((uint64_t)self);
  routineAttributes = self->_routineAttributes;

  return routineAttributes;
}

- (void)setRoutineAttributes:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_routineAttributes, a3);
}

- (GEOMapItemCorrectedLocationAttributes)correctedLocationAttributes
{
  -[GEOMapItemClientAttributes _readCorrectedLocationAttributes]((uint64_t)self);
  correctedLocationAttributes = self->_correctedLocationAttributes;

  return correctedLocationAttributes;
}

- (void)setCorrectedLocationAttributes:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_correctedLocationAttributes, a3);
}

- (void)_readMapsSyncAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemClientAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsSyncAttributes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMapsSyncAttributes
{
  return self->_mapsSyncAttributes != 0;
}

- (GEOMapItemMapsSyncAttributes)mapsSyncAttributes
{
  -[GEOMapItemClientAttributes _readMapsSyncAttributes]((uint64_t)self);
  mapsSyncAttributes = self->_mapsSyncAttributes;

  return mapsSyncAttributes;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapItemClientAttributes;
  v4 = [(GEOMapItemClientAttributes *)&v8 description];
  id v5 = [(GEOMapItemClientAttributes *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapItemClientAttributes _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 addressBookAttributes];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"addressBookAttributes"];
    }
    objc_super v8 = [a1 routineAttributes];
    char v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      id v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"routineAttributes"];
    }
    v11 = [a1 correctedLocationAttributes];
    id v12 = v11;
    if (v11)
    {
      if (a2) {
        [v11 jsonRepresentation];
      }
      else {
      v13 = [v11 dictionaryRepresentation];
      }
      [v4 setObject:v13 forKey:@"correctedLocationAttributes"];
    }
    id v14 = [a1 mapsSyncAttributes];
    v15 = v14;
    if (v14)
    {
      if (a2) {
        [v14 jsonRepresentation];
      }
      else {
      v16 = [v14 dictionaryRepresentation];
      }
      [v4 setObject:v16 forKey:@"mapsSyncAttributes"];
    }
    v17 = (void *)a1[2];
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __56__GEOMapItemClientAttributes__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
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
  return -[GEOMapItemClientAttributes _dictionaryRepresentation:](self, 1);
}

void __56__GEOMapItemClientAttributes__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOMapItemClientAttributes)initWithDictionary:(id)a3
{
  return (GEOMapItemClientAttributes *)-[GEOMapItemClientAttributes _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"addressBookAttributes"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOMapItemAddressBookAttributes alloc];
        if (a3) {
          uint64_t v8 = [(GEOMapItemAddressBookAttributes *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOMapItemAddressBookAttributes *)v7 initWithDictionary:v6];
        }
        char v9 = (void *)v8;
        [a1 setAddressBookAttributes:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"routineAttributes"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOMapItemRoutineAttributes alloc];
        if (a3) {
          uint64_t v12 = [(GEOMapItemRoutineAttributes *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEOMapItemRoutineAttributes *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setRoutineAttributes:v12];
      }
      id v14 = [v5 objectForKeyedSubscript:@"correctedLocationAttributes"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [GEOMapItemCorrectedLocationAttributes alloc];
        if (a3) {
          uint64_t v16 = [(GEOMapItemCorrectedLocationAttributes *)v15 initWithJSON:v14];
        }
        else {
          uint64_t v16 = [(GEOMapItemCorrectedLocationAttributes *)v15 initWithDictionary:v14];
        }
        v17 = (void *)v16;
        [a1 setCorrectedLocationAttributes:v16];
      }
      v18 = [v5 objectForKeyedSubscript:@"mapsSyncAttributes"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [GEOMapItemMapsSyncAttributes alloc];
        if (a3) {
          uint64_t v20 = [(GEOMapItemMapsSyncAttributes *)v19 initWithJSON:v18];
        }
        else {
          uint64_t v20 = [(GEOMapItemMapsSyncAttributes *)v19 initWithDictionary:v18];
        }
        id v21 = (void *)v20;
        [a1 setMapsSyncAttributes:v20];
      }
    }
  }

  return a1;
}

- (GEOMapItemClientAttributes)initWithJSON:(id)a3
{
  return (GEOMapItemClientAttributes *)-[GEOMapItemClientAttributes _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapItemClientAttributesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapItemClientAttributesReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOMapItemClientAttributes _readCorrectedLocationAttributes]((uint64_t)self);
  correctedLocationAttributes = self->_correctedLocationAttributes;

  return [(GEOMapItemCorrectedLocationAttributes *)correctedLocationAttributes hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOMapItemClientAttributes *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_addressBookAttributes) {
    objc_msgSend(v5, "setAddressBookAttributes:");
  }
  if (self->_routineAttributes) {
    objc_msgSend(v5, "setRoutineAttributes:");
  }
  v4 = v5;
  if (self->_correctedLocationAttributes)
  {
    objc_msgSend(v5, "setCorrectedLocationAttributes:");
    v4 = v5;
  }
  if (self->_mapsSyncAttributes)
  {
    objc_msgSend(v5, "setMapsSyncAttributes:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  [(GEOMapItemClientAttributes *)self readAll:1];
  unint64_t v3 = [(GEOMapItemAddressBookAttributes *)self->_addressBookAttributes hash];
  unint64_t v4 = [(GEOMapItemRoutineAttributes *)self->_routineAttributes hash] ^ v3;
  unint64_t v5 = [(GEOMapItemCorrectedLocationAttributes *)self->_correctedLocationAttributes hash];
  return v4 ^ v5 ^ [(GEOMapItemMapsSyncAttributes *)self->_mapsSyncAttributes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v12 = a3;
  [v12 readAll:0];
  addressBookAttributes = self->_addressBookAttributes;
  uint64_t v5 = v12[3];
  if (addressBookAttributes)
  {
    if (v5) {
      -[GEOMapItemAddressBookAttributes mergeFrom:](addressBookAttributes, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOMapItemClientAttributes setAddressBookAttributes:](self, "setAddressBookAttributes:");
  }
  routineAttributes = self->_routineAttributes;
  uint64_t v7 = v12[6];
  if (routineAttributes)
  {
    if (v7) {
      -[GEOMapItemRoutineAttributes mergeFrom:](routineAttributes, "mergeFrom:");
    }
  }
  else if (v7)
  {
    [(GEOMapItemClientAttributes *)self setRoutineAttributes:"setRoutineAttributes:"];
  }
  correctedLocationAttributes = self->_correctedLocationAttributes;
  uint64_t v9 = v12[4];
  if (correctedLocationAttributes)
  {
    if (v9) {
      -[GEOMapItemCorrectedLocationAttributes mergeFrom:](correctedLocationAttributes, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOMapItemClientAttributes setCorrectedLocationAttributes:](self, "setCorrectedLocationAttributes:");
  }
  mapsSyncAttributes = self->_mapsSyncAttributes;
  uint64_t v11 = v12[5];
  if (mapsSyncAttributes)
  {
    if (v11) {
      -[GEOMapItemMapsSyncAttributes mergeFrom:](mapsSyncAttributes, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOMapItemClientAttributes setMapsSyncAttributes:](self, "setMapsSyncAttributes:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOMapItemClientAttributesReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_873);
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
  *(unsigned char *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOMapItemClientAttributes *)self readAll:0];
    [(GEOMapItemAddressBookAttributes *)self->_addressBookAttributes clearUnknownFields:1];
    [(GEOMapItemRoutineAttributes *)self->_routineAttributes clearUnknownFields:1];
    [(GEOMapItemCorrectedLocationAttributes *)self->_correctedLocationAttributes clearUnknownFields:1];
    mapsSyncAttributes = self->_mapsSyncAttributes;
    [(GEOMapItemMapsSyncAttributes *)mapsSyncAttributes clearUnknownFields:1];
  }
}

@end