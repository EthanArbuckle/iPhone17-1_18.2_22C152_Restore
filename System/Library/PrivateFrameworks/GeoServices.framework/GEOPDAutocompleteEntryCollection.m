@interface GEOPDAutocompleteEntryCollection
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCollectionId;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAutocompleteEntryCollection)initWithDictionary:(id)a3;
- (GEOPDAutocompleteEntryCollection)initWithJSON:(id)a3;
- (GEOPDMapsIdentifier)collectionId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCollectionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteEntryCollection

- (BOOL)hasCollectionId
{
  return self->_collectionId != 0;
}

- (GEOPDMapsIdentifier)collectionId
{
  return self->_collectionId;
}

- (void)setCollectionId:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteEntryCollection;
  v4 = [(GEOPDAutocompleteEntryCollection *)&v8 description];
  v5 = [(GEOPDAutocompleteEntryCollection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteEntryCollection _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 collectionId];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"collectionId";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"collection_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = (void *)a1[1];
    if (v9)
    {
      v10 = [v9 dictionaryRepresentation];
      v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __62__GEOPDAutocompleteEntryCollection__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
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
  return -[GEOPDAutocompleteEntryCollection _dictionaryRepresentation:](self, 1);
}

void __62__GEOPDAutocompleteEntryCollection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteEntryCollection)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteEntryCollection *)-[GEOPDAutocompleteEntryCollection _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"collectionId";
      }
      else {
        v6 = @"collection_id";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOPDMapsIdentifier alloc];
        if (a3) {
          uint64_t v9 = [(GEOPDMapsIdentifier *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOPDMapsIdentifier *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setCollectionId:v9];
      }
    }
  }

  return a1;
}

- (GEOPDAutocompleteEntryCollection)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteEntryCollection *)-[GEOPDAutocompleteEntryCollection _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteEntryCollectionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteEntryCollectionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_collectionId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOPDMapsIdentifier *)self->_collectionId hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOPDAutocompleteEntryCollection *)self readAll:0];
  if (self->_collectionId) {
    objc_msgSend(v4, "setCollectionId:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOPDMapsIdentifier *)self->_collectionId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEOPDAutocompleteEntryCollection *)self readAll:1];
    [v4 readAll:1];
    collectionId = self->_collectionId;
    if ((unint64_t)collectionId | v4[2]) {
      char v5 = -[GEOPDMapsIdentifier isEqual:](collectionId, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  [(GEOPDAutocompleteEntryCollection *)self readAll:1];
  collectionId = self->_collectionId;

  return [(GEOPDMapsIdentifier *)collectionId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  collectionId = self->_collectionId;
  uint64_t v6 = v4[2];

  if (collectionId)
  {
    if (v6)
    {
      [(GEOPDMapsIdentifier *)collectionId mergeFrom:v6];
    }
  }
  else if (v6)
  {
    [(GEOPDAutocompleteEntryCollection *)self setCollectionId:v6];
  }
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
    [(GEOPDAutocompleteEntryCollection *)self readAll:0];
    collectionId = self->_collectionId;
    [(GEOPDMapsIdentifier *)collectionId clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionId, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end