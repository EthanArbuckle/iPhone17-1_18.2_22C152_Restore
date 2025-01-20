@interface GEOSFSymbol
+ (BOOL)isValid:(id)a3;
- (BOOL)hasSymbolName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSFSymbol)initWithDictionary:(id)a3;
- (GEOSFSymbol)initWithJSON:(id)a3;
- (NSString)symbolName;
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
- (void)setSymbolName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSFSymbol

- (BOOL)hasSymbolName
{
  return self->_symbolName != 0;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSFSymbol;
  v4 = [(GEOSFSymbol *)&v8 description];
  v5 = [(GEOSFSymbol *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSFSymbol _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 symbolName];
    if (v5)
    {
      if (a2) {
        v6 = @"symbolName";
      }
      else {
        v6 = @"symbol_name";
      }
      [v4 setObject:v5 forKey:v6];
    }

    v7 = (void *)a1[1];
    if (v7)
    {
      objc_super v8 = [v7 dictionaryRepresentation];
      v9 = v8;
      if (a2)
      {
        v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __41__GEOSFSymbol__dictionaryRepresentation___block_invoke;
        v14[3] = &unk_1E53D8860;
        id v11 = v10;
        id v15 = v11;
        [v9 enumerateKeysAndObjectsUsingBlock:v14];
        id v12 = v11;

        v9 = v12;
      }
      [v4 setObject:v9 forKey:@"Unknown Fields"];
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
  return -[GEOSFSymbol _dictionaryRepresentation:](self, 1);
}

void __41__GEOSFSymbol__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSFSymbol)initWithDictionary:(id)a3
{
  return (GEOSFSymbol *)-[GEOSFSymbol _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"symbolName";
      }
      else {
        v6 = @"symbol_name";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setSymbolName:v8];
      }
    }
  }

  return a1;
}

- (GEOSFSymbol)initWithJSON:(id)a3
{
  return (GEOSFSymbol *)-[GEOSFSymbol _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSFSymbolIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSFSymbolReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_symbolName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOSFSymbol *)self readAll:0];
  if (self->_symbolName) {
    objc_msgSend(v4, "setSymbolName:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_symbolName copyWithZone:a3];
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
    [(GEOSFSymbol *)self readAll:1];
    [v4 readAll:1];
    symbolName = self->_symbolName;
    if ((unint64_t)symbolName | v4[2]) {
      char v5 = -[NSString isEqual:](symbolName, "isEqual:");
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
  [(GEOSFSymbol *)self readAll:1];
  symbolName = self->_symbolName;

  return [(NSString *)symbolName hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = v4[2];

  if (v5)
  {
    [(GEOSFSymbol *)self setSymbolName:v5];
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
    [(GEOSFSymbol *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end