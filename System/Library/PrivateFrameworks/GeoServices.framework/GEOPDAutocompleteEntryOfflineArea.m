@interface GEOPDAutocompleteEntryOfflineArea
+ (BOOL)isValid:(id)a3;
- (BOOL)availableForDownload;
- (BOOL)hasAvailableForDownload;
- (BOOL)hasFeatureId;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMapsId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAutocompleteEntryOfflineArea)initWithDictionary:(id)a3;
- (GEOPDAutocompleteEntryOfflineArea)initWithJSON:(id)a3;
- (GEOPDMapsIdentifier)mapsId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)featureId;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvailableForDownload:(BOOL)a3;
- (void)setFeatureId:(unint64_t)a3;
- (void)setHasAvailableForDownload:(BOOL)a3;
- (void)setHasFeatureId:(BOOL)a3;
- (void)setMapsId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteEntryOfflineArea

- (unint64_t)featureId
{
  return self->_featureId;
}

- (void)setFeatureId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_featureId = a3;
}

- (void)setHasFeatureId:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFeatureId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)availableForDownload
{
  return self->_availableForDownload;
}

- (void)setAvailableForDownload:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_availableForDownload = a3;
}

- (void)setHasAvailableForDownload:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAvailableForDownload
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)hasMapsId
{
  return self->_mapsId != 0;
}

- (GEOPDMapsIdentifier)mapsId
{
  return self->_mapsId;
}

- (void)setMapsId:(id)a3
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteEntryOfflineArea;
  v4 = [(GEOPDAutocompleteEntryOfflineArea *)&v8 description];
  v5 = [(GEOPDAutocompleteEntryOfflineArea *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteEntryOfflineArea _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 36);
    if (v5)
    {
      v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
      if (a2) {
        v7 = @"featureId";
      }
      else {
        v7 = @"feature_id";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 36);
    }
    if ((v5 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
      if (a2) {
        v9 = @"availableForDownload";
      }
      else {
        v9 = @"available_for_download";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = [(id)a1 mapsId];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"mapsId";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"maps_id";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __63__GEOPDAutocompleteEntryOfflineArea__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
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
  return -[GEOPDAutocompleteEntryOfflineArea _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __63__GEOPDAutocompleteEntryOfflineArea__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (GEOPDAutocompleteEntryOfflineArea)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteEntryOfflineArea *)-[GEOPDAutocompleteEntryOfflineArea _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"featureId";
      }
      else {
        v6 = @"feature_id";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setFeatureId:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      if (a3) {
        objc_super v8 = @"availableForDownload";
      }
      else {
        objc_super v8 = @"available_for_download";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAvailableForDownload:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        id v10 = @"mapsId";
      }
      else {
        id v10 = @"maps_id";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEOPDMapsIdentifier alloc];
        if (a3) {
          uint64_t v13 = [(GEOPDMapsIdentifier *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOPDMapsIdentifier *)v12 initWithDictionary:v11];
        }
        v14 = (void *)v13;
        [a1 setMapsId:v13];
      }
    }
  }

  return a1;
}

- (GEOPDAutocompleteEntryOfflineArea)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteEntryOfflineArea *)-[GEOPDAutocompleteEntryOfflineArea _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteEntryOfflineAreaIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteEntryOfflineAreaReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_mapsId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOPDMapsIdentifier *)self->_mapsId hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOPDAutocompleteEntryOfflineArea *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if (flags)
  {
    *((void *)v6 + 2) = self->_featureId;
    *((unsigned char *)v6 + 36) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v6 + 32) = self->_availableForDownload;
    *((unsigned char *)v6 + 36) |= 2u;
  }
  if (self->_mapsId)
  {
    objc_msgSend(v6, "setMapsId:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 16) = self->_featureId;
    *(unsigned char *)(v5 + 36) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_availableForDownload;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  id v8 = [(GEOPDMapsIdentifier *)self->_mapsId copyWithZone:a3];
  v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOPDAutocompleteEntryOfflineArea *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_featureId != *((void *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0) {
      goto LABEL_17;
    }
LABEL_11:
    char v5 = 0;
    goto LABEL_12;
  }
  if ((*((unsigned char *)v4 + 36) & 2) == 0) {
    goto LABEL_11;
  }
  if (!self->_availableForDownload)
  {
    if (!*((unsigned char *)v4 + 32)) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  if (!*((unsigned char *)v4 + 32)) {
    goto LABEL_11;
  }
LABEL_17:
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((void *)v4 + 3)) {
    char v5 = -[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOPDAutocompleteEntryOfflineArea *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v3 = 2654435761u * self->_featureId;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3 ^ [(GEOPDMapsIdentifier *)self->_mapsId hash];
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_availableForDownload;
  return v4 ^ v3 ^ [(GEOPDMapsIdentifier *)self->_mapsId hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  uint64_t v4 = v8;
  char v5 = *((unsigned char *)v8 + 36);
  if (v5)
  {
    self->_featureId = *((void *)v8 + 2);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v8 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_availableForDownload = *((unsigned char *)v8 + 32);
    *(unsigned char *)&self->_flags |= 2u;
  }
  mapsId = self->_mapsId;
  uint64_t v7 = *((void *)v8 + 3);
  if (mapsId)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOPDMapsIdentifier mergeFrom:](mapsId, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOPDAutocompleteEntryOfflineArea setMapsId:](self, "setMapsId:");
  }
  uint64_t v4 = v8;
LABEL_11:
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDAutocompleteEntryOfflineArea *)self readAll:0];
    mapsId = self->_mapsId;
    [(GEOPDMapsIdentifier *)mapsId clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsId, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end