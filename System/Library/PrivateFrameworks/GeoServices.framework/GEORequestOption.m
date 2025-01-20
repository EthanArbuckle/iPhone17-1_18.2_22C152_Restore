@interface GEORequestOption
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEnumValue;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)name;
- (GEORequestOption)initWithDictionary:(id)a3;
- (GEORequestOption)initWithJSON:(id)a3;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)enumValue;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEnumValue:(int)a3;
- (void)setHasEnumValue:(BOOL)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORequestOption

- (int)enumValue
{
  return self->_enumValue;
}

- (void)setEnumValue:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_enumValue = a3;
}

- (void)setHasEnumValue:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEnumValue
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (GEOFormattedString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORequestOption;
  v4 = [(GEORequestOption *)&v8 description];
  v5 = [(GEORequestOption *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORequestOption _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 28))
    {
      v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v6 = @"enumValue";
      }
      else {
        v6 = @"enum_value";
      }
      [v4 setObject:v5 forKey:v6];
    }
    v7 = [(id)a1 name];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"name"];
    }
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = [v10 dictionaryRepresentation];
      v12 = v11;
      if (a2)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __46__GEORequestOption__dictionaryRepresentation___block_invoke;
        v17[3] = &unk_1E53D8860;
        id v14 = v13;
        id v18 = v14;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
        id v15 = v14;

        v12 = v15;
      }
      [v4 setObject:v12 forKey:@"Unknown Fields"];
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
  return -[GEORequestOption _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEORequestOption__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORequestOption)initWithDictionary:(id)a3
{
  return (GEORequestOption *)-[GEORequestOption _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"enumValue";
      }
      else {
        v6 = @"enum_value";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEnumValue:", objc_msgSend(v7, "intValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v10 = [(GEOFormattedString *)v9 initWithJSON:v8];
        }
        else {
          uint64_t v10 = [(GEOFormattedString *)v9 initWithDictionary:v8];
        }
        v11 = (void *)v10;
        [a1 setName:v10];
      }
    }
  }

  return a1;
}

- (GEORequestOption)initWithJSON:(id)a3
{
  return (GEORequestOption *)-[GEORequestOption _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORequestOptionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORequestOptionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEORequestOption *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 6) = self->_enumValue;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_enumValue;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  id v7 = [(GEOFormattedString *)self->_name copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEORequestOption *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_enumValue != *((_DWORD *)v4 + 6)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 2)) {
    char v6 = -[GEOFormattedString isEqual:](name, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEORequestOption *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_enumValue;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(GEOFormattedString *)self->_name hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v7 = (int *)a3;
  [v7 readAll:0];
  id v4 = v7;
  if (v7[7])
  {
    self->_enumValue = v7[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
  name = self->_name;
  uint64_t v6 = *((void *)v7 + 2);
  if (name)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOFormattedString mergeFrom:](name, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORequestOption setName:](self, "setName:");
  }
  id v4 = v7;
LABEL_9:
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
    [(GEORequestOption *)self readAll:0];
    name = self->_name;
    [(GEOFormattedString *)name clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end