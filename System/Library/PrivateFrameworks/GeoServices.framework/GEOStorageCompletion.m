@interface GEOStorageCompletion
+ (BOOL)isValid:(id)a3;
+ (id)storageForCompletionItem:(id)a3;
- (BOOL)hasAutocompleteEntry;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAutocompleteEntry)autocompleteEntry;
- (GEOStorageCompletion)initWithDictionary:(id)a3;
- (GEOStorageCompletion)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)applyToUserSearchInput:(id)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAutocompleteEntry:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOStorageCompletion

- (BOOL)hasAutocompleteEntry
{
  return self->_autocompleteEntry != 0;
}

- (GEOPDAutocompleteEntry)autocompleteEntry
{
  return self->_autocompleteEntry;
}

- (void)setAutocompleteEntry:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOStorageCompletion;
  v4 = [(GEOStorageCompletion *)&v8 description];
  v5 = [(GEOStorageCompletion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStorageCompletion _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 autocompleteEntry];
    v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"autocompleteEntry"];
    }
    objc_super v8 = (void *)a1[1];
    if (v8)
    {
      v9 = [v8 dictionaryRepresentation];
      v10 = v9;
      if (a2)
      {
        v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __50__GEOStorageCompletion__dictionaryRepresentation___block_invoke;
        v15[3] = &unk_1E53D8860;
        id v12 = v11;
        id v16 = v12;
        [v10 enumerateKeysAndObjectsUsingBlock:v15];
        id v13 = v12;

        v10 = v13;
      }
      [v4 setObject:v10 forKey:@"Unknown Fields"];
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
  return -[GEOStorageCompletion _dictionaryRepresentation:](self, 1);
}

void __50__GEOStorageCompletion__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOStorageCompletion)initWithDictionary:(id)a3
{
  return (GEOStorageCompletion *)-[GEOStorageCompletion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"autocompleteEntry"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [GEOPDAutocompleteEntry alloc];
        if (a3) {
          uint64_t v8 = [(GEOPDAutocompleteEntry *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOPDAutocompleteEntry *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setAutocompleteEntry:v8];
      }
    }
  }

  return a1;
}

- (GEOStorageCompletion)initWithJSON:(id)a3
{
  return (GEOStorageCompletion *)-[GEOStorageCompletion _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStorageCompletionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStorageCompletionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_autocompleteEntry)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOPDAutocompleteEntry *)self->_autocompleteEntry hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOStorageCompletion *)self readAll:0];
  if (self->_autocompleteEntry) {
    objc_msgSend(v4, "setAutocompleteEntry:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOPDAutocompleteEntry *)self->_autocompleteEntry copyWithZone:a3];
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
    [(GEOStorageCompletion *)self readAll:1];
    [v4 readAll:1];
    autocompleteEntry = self->_autocompleteEntry;
    if ((unint64_t)autocompleteEntry | v4[2]) {
      char v5 = -[GEOPDAutocompleteEntry isEqual:](autocompleteEntry, "isEqual:");
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
  [(GEOStorageCompletion *)self readAll:1];
  autocompleteEntry = self->_autocompleteEntry;

  return [(GEOPDAutocompleteEntry *)autocompleteEntry hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  autocompleteEntry = self->_autocompleteEntry;
  uint64_t v6 = v4[2];

  if (autocompleteEntry)
  {
    if (v6)
    {
      [(GEOPDAutocompleteEntry *)autocompleteEntry mergeFrom:v6];
    }
  }
  else if (v6)
  {
    [(GEOStorageCompletion *)self setAutocompleteEntry:v6];
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
    [(GEOStorageCompletion *)self readAll:0];
    autocompleteEntry = self->_autocompleteEntry;
    [(GEOPDAutocompleteEntry *)autocompleteEntry clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autocompleteEntry, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

+ (id)storageForCompletionItem:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1ED77CBD0])
  {
    id v5 = v4;
    id v6 = objc_alloc_init((Class)a1);
    v7 = [v5 _placeDataAutocompleteEntry];

    [v6 setAutocompleteEntry:v7];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)applyToUserSearchInput:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOStorageCompletion *)self autocompleteEntry];
  [v4 setAutocompleteEntry:v5];
}

@end