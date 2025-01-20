@interface GEOPDAutocompleteEntryDirectionIntent
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDirectionIntent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAutocompleteEntryDirectionIntent)initWithDictionary:(id)a3;
- (GEOPDAutocompleteEntryDirectionIntent)initWithJSON:(id)a3;
- (GEOPDDirectionIntent)directionIntent;
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
- (void)setDirectionIntent:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteEntryDirectionIntent

- (BOOL)hasDirectionIntent
{
  return self->_directionIntent != 0;
}

- (GEOPDDirectionIntent)directionIntent
{
  return self->_directionIntent;
}

- (void)setDirectionIntent:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteEntryDirectionIntent;
  v4 = [(GEOPDAutocompleteEntryDirectionIntent *)&v8 description];
  v5 = [(GEOPDAutocompleteEntryDirectionIntent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteEntryDirectionIntent _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 directionIntent];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"directionIntent";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"direction_intent";
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
        v16[2] = __67__GEOPDAutocompleteEntryDirectionIntent__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDAutocompleteEntryDirectionIntent _dictionaryRepresentation:](self, 1);
}

void __67__GEOPDAutocompleteEntryDirectionIntent__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteEntryDirectionIntent)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteEntryDirectionIntent *)-[GEOPDAutocompleteEntryDirectionIntent _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"directionIntent";
      }
      else {
        v6 = @"direction_intent";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOPDDirectionIntent alloc];
        if (v8) {
          v9 = (void *)-[GEOPDDirectionIntent _initWithDictionary:isJSON:]((uint64_t)v8, v7, a3);
        }
        else {
          v9 = 0;
        }
        [a1 setDirectionIntent:v9];
      }
    }
  }

  return a1;
}

- (GEOPDAutocompleteEntryDirectionIntent)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteEntryDirectionIntent *)-[GEOPDAutocompleteEntryDirectionIntent _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteEntryDirectionIntentIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteEntryDirectionIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_directionIntent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOPDAutocompleteEntryDirectionIntent *)self readAll:0];
  if (self->_directionIntent) {
    objc_msgSend(v4, "setDirectionIntent:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOPDDirectionIntent *)self->_directionIntent copyWithZone:a3];
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
    [(GEOPDAutocompleteEntryDirectionIntent *)self readAll:1];
    [v4 readAll:1];
    directionIntent = self->_directionIntent;
    if ((unint64_t)directionIntent | v4[2]) {
      char v5 = -[GEOPDDirectionIntent isEqual:](directionIntent, "isEqual:");
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
  [(GEOPDAutocompleteEntryDirectionIntent *)self readAll:1];
  directionIntent = self->_directionIntent;

  return [(GEOPDDirectionIntent *)directionIntent hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  directionIntent = self->_directionIntent;
  id v6 = (void *)v4[2];

  if (directionIntent)
  {
    if (v6)
    {
      -[GEOPDDirectionIntent mergeFrom:]((uint64_t)directionIntent, v6);
    }
  }
  else if (v6)
  {
    [(GEOPDAutocompleteEntryDirectionIntent *)self setDirectionIntent:v6];
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
    [(GEOPDAutocompleteEntryDirectionIntent *)self readAll:0];
    directionIntent = self->_directionIntent;
    -[GEOPDDirectionIntent clearUnknownFields:]((uint64_t)directionIntent, 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionIntent, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end