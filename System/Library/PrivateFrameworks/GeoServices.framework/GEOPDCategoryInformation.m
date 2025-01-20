@interface GEOPDCategoryInformation
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLocalizedMapsCategoryName;
- (BOOL)hasMapsCategoryId;
- (BOOL)hasMapsCategoryStyleAttributes;
- (BOOL)hasWalletCategoryId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocalizedString)localizedMapsCategoryName;
- (GEOPDCategoryInformation)init;
- (GEOPDCategoryInformation)initWithData:(id)a3;
- (GEOPDCategoryInformation)initWithDictionary:(id)a3;
- (GEOPDCategoryInformation)initWithJSON:(id)a3;
- (GEOStyleAttributes)mapsCategoryStyleAttributes;
- (NSString)mapsCategoryId;
- (NSString)walletCategoryId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLocalizedMapsCategoryName;
- (void)_readMapsCategoryId;
- (void)_readMapsCategoryStyleAttributes;
- (void)_readWalletCategoryId;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setLocalizedMapsCategoryName:(id)a3;
- (void)setMapsCategoryId:(id)a3;
- (void)setMapsCategoryStyleAttributes:(id)a3;
- (void)setWalletCategoryId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDCategoryInformation

- (GEOPDCategoryInformation)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDCategoryInformation;
  v2 = [(GEOPDCategoryInformation *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDCategoryInformation)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDCategoryInformation;
  v3 = [(GEOPDCategoryInformation *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readWalletCategoryId
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
        GEOPDCategoryInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWalletCategoryId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasWalletCategoryId
{
  return self->_walletCategoryId != 0;
}

- (NSString)walletCategoryId
{
  -[GEOPDCategoryInformation _readWalletCategoryId]((uint64_t)self);
  walletCategoryId = self->_walletCategoryId;

  return walletCategoryId;
}

- (void)setWalletCategoryId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_walletCategoryId, a3);
}

- (void)_readMapsCategoryId
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
        GEOPDCategoryInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsCategoryId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMapsCategoryId
{
  return self->_mapsCategoryId != 0;
}

- (NSString)mapsCategoryId
{
  -[GEOPDCategoryInformation _readMapsCategoryId]((uint64_t)self);
  mapsCategoryId = self->_mapsCategoryId;

  return mapsCategoryId;
}

- (void)setMapsCategoryId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_mapsCategoryId, a3);
}

- (void)_readLocalizedMapsCategoryName
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
        GEOPDCategoryInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedMapsCategoryName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLocalizedMapsCategoryName
{
  return self->_localizedMapsCategoryName != 0;
}

- (GEOLocalizedString)localizedMapsCategoryName
{
  -[GEOPDCategoryInformation _readLocalizedMapsCategoryName]((uint64_t)self);
  localizedMapsCategoryName = self->_localizedMapsCategoryName;

  return localizedMapsCategoryName;
}

- (void)setLocalizedMapsCategoryName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_localizedMapsCategoryName, a3);
}

- (void)_readMapsCategoryStyleAttributes
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
        GEOPDCategoryInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsCategoryStyleAttributes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMapsCategoryStyleAttributes
{
  return self->_mapsCategoryStyleAttributes != 0;
}

- (GEOStyleAttributes)mapsCategoryStyleAttributes
{
  -[GEOPDCategoryInformation _readMapsCategoryStyleAttributes]((uint64_t)self);
  mapsCategoryStyleAttributes = self->_mapsCategoryStyleAttributes;

  return mapsCategoryStyleAttributes;
}

- (void)setMapsCategoryStyleAttributes:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_mapsCategoryStyleAttributes, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDCategoryInformation;
  v4 = [(GEOPDCategoryInformation *)&v8 description];
  v5 = [(GEOPDCategoryInformation *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCategoryInformation _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 walletCategoryId];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"walletCategoryId";
      }
      else {
        objc_super v6 = @"wallet_category_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 mapsCategoryId];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"mapsCategoryId";
      }
      else {
        objc_super v8 = @"maps_category_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [a1 localizedMapsCategoryName];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"localizedMapsCategoryName";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"localized_maps_category_name";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [a1 mapsCategoryStyleAttributes];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"mapsCategoryStyleAttributes";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"maps_category_style_attributes";
      }
      [v4 setObject:v15 forKey:v16];
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
        v24[2] = __54__GEOPDCategoryInformation__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDCategoryInformation _dictionaryRepresentation:](self, 1);
}

void __54__GEOPDCategoryInformation__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDCategoryInformation)initWithDictionary:(id)a3
{
  return (GEOPDCategoryInformation *)-[GEOPDCategoryInformation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"walletCategoryId";
      }
      else {
        objc_super v6 = @"wallet_category_id";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setWalletCategoryId:v8];
      }
      if (a3) {
        v9 = @"mapsCategoryId";
      }
      else {
        v9 = @"maps_category_id";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setMapsCategoryId:v11];
      }
      if (a3) {
        v12 = @"localizedMapsCategoryName";
      }
      else {
        v12 = @"localized_maps_category_name";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = [GEOLocalizedString alloc];
        if (a3) {
          uint64_t v15 = [(GEOLocalizedString *)v14 initWithJSON:v13];
        }
        else {
          uint64_t v15 = [(GEOLocalizedString *)v14 initWithDictionary:v13];
        }
        v16 = (void *)v15;
        [a1 setLocalizedMapsCategoryName:v15];
      }
      if (a3) {
        v17 = @"mapsCategoryStyleAttributes";
      }
      else {
        v17 = @"maps_category_style_attributes";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [GEOStyleAttributes alloc];
        if (a3) {
          uint64_t v20 = [(GEOStyleAttributes *)v19 initWithJSON:v18];
        }
        else {
          uint64_t v20 = [(GEOStyleAttributes *)v19 initWithDictionary:v18];
        }
        id v21 = (void *)v20;
        [a1 setMapsCategoryStyleAttributes:v20];
      }
    }
  }

  return a1;
}

- (GEOPDCategoryInformation)initWithJSON:(id)a3
{
  return (GEOPDCategoryInformation *)-[GEOPDCategoryInformation _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1447;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1448;
    }
    GEOPDCategoryInformationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOLocalizedString *)self->_localizedMapsCategoryName readAll:1];
    [(GEOStyleAttributes *)self->_mapsCategoryStyleAttributes readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDCategoryInformationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDCategoryInformationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDCategoryInformationIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOPDCategoryInformation *)self readAll:0];
    if (self->_walletCategoryId) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_mapsCategoryId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_localizedMapsCategoryName)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_mapsCategoryStyleAttributes)
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
  [(GEOPDCategoryInformation *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_walletCategoryId) {
    objc_msgSend(v5, "setWalletCategoryId:");
  }
  if (self->_mapsCategoryId) {
    objc_msgSend(v5, "setMapsCategoryId:");
  }
  v4 = v5;
  if (self->_localizedMapsCategoryName)
  {
    objc_msgSend(v5, "setLocalizedMapsCategoryName:");
    v4 = v5;
  }
  if (self->_mapsCategoryStyleAttributes)
  {
    objc_msgSend(v5, "setMapsCategoryStyleAttributes:");
    v4 = v5;
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
    [(GEOPDCategoryInformation *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_walletCategoryId copyWithZone:a3];
    v9 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v8;

    uint64_t v10 = [(NSString *)self->_mapsCategoryId copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    id v12 = [(GEOLocalizedString *)self->_localizedMapsCategoryName copyWithZone:a3];
    v13 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v12;

    id v14 = [(GEOStyleAttributes *)self->_mapsCategoryStyleAttributes copyWithZone:a3];
    uint64_t v15 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDCategoryInformationReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPDCategoryInformation *)self readAll:1],
         [v4 readAll:1],
         walletCategoryId = self->_walletCategoryId,
         !((unint64_t)walletCategoryId | v4[6]))
     || -[NSString isEqual:](walletCategoryId, "isEqual:"))
    && ((mapsCategoryId = self->_mapsCategoryId, !((unint64_t)mapsCategoryId | v4[4]))
     || -[NSString isEqual:](mapsCategoryId, "isEqual:"))
    && ((localizedMapsCategoryName = self->_localizedMapsCategoryName,
         !((unint64_t)localizedMapsCategoryName | v4[3]))
     || -[GEOLocalizedString isEqual:](localizedMapsCategoryName, "isEqual:")))
  {
    mapsCategoryStyleAttributes = self->_mapsCategoryStyleAttributes;
    if ((unint64_t)mapsCategoryStyleAttributes | v4[5]) {
      char v9 = -[GEOStyleAttributes isEqual:](mapsCategoryStyleAttributes, "isEqual:");
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

- (unint64_t)hash
{
  [(GEOPDCategoryInformation *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_walletCategoryId hash];
  NSUInteger v4 = [(NSString *)self->_mapsCategoryId hash] ^ v3;
  unint64_t v5 = [(GEOLocalizedString *)self->_localizedMapsCategoryName hash];
  return v4 ^ v5 ^ [(GEOStyleAttributes *)self->_mapsCategoryStyleAttributes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v8 = a3;
  [v8 readAll:0];
  if (v8[6]) {
    -[GEOPDCategoryInformation setWalletCategoryId:](self, "setWalletCategoryId:");
  }
  if (v8[4]) {
    -[GEOPDCategoryInformation setMapsCategoryId:](self, "setMapsCategoryId:");
  }
  localizedMapsCategoryName = self->_localizedMapsCategoryName;
  uint64_t v5 = v8[3];
  if (localizedMapsCategoryName)
  {
    if (v5) {
      -[GEOLocalizedString mergeFrom:](localizedMapsCategoryName, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOPDCategoryInformation setLocalizedMapsCategoryName:](self, "setLocalizedMapsCategoryName:");
  }
  mapsCategoryStyleAttributes = self->_mapsCategoryStyleAttributes;
  uint64_t v7 = v8[5];
  if (mapsCategoryStyleAttributes)
  {
    if (v7) {
      -[GEOStyleAttributes mergeFrom:](mapsCategoryStyleAttributes, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOPDCategoryInformation setMapsCategoryStyleAttributes:](self, "setMapsCategoryStyleAttributes:");
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
      GEOPDCategoryInformationReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1452);
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
    [(GEOPDCategoryInformation *)self readAll:0];
    [(GEOLocalizedString *)self->_localizedMapsCategoryName clearUnknownFields:1];
    mapsCategoryStyleAttributes = self->_mapsCategoryStyleAttributes;
    [(GEOStyleAttributes *)mapsCategoryStyleAttributes clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletCategoryId, 0);
  objc_storeStrong((id *)&self->_mapsCategoryStyleAttributes, 0);
  objc_storeStrong((id *)&self->_mapsCategoryId, 0);
  objc_storeStrong((id *)&self->_localizedMapsCategoryName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end