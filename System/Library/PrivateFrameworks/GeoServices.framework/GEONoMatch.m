@interface GEONoMatch
+ (BOOL)isValid:(id)a3;
- (BOOL)hasStretch;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEONoMatch)initWithDictionary:(id)a3;
- (GEONoMatch)initWithJSON:(id)a3;
- (GEOPathStretch)stretch;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setStretch:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONoMatch

- (BOOL)hasStretch
{
  return self->_stretch != 0;
}

- (GEOPathStretch)stretch
{
  return self->_stretch;
}

- (void)setStretch:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONoMatch;
  v4 = [(GEONoMatch *)&v8 description];
  v5 = [(GEONoMatch *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONoMatch _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 stretch];
    v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"stretch"];
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
        v15[2] = __40__GEONoMatch__dictionaryRepresentation___block_invoke;
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
  return -[GEONoMatch _dictionaryRepresentation:](self, 1);
}

void __40__GEONoMatch__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEONoMatch)initWithDictionary:(id)a3
{
  return (GEONoMatch *)-[GEONoMatch _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"stretch"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [GEOPathStretch alloc];
        if (a3) {
          uint64_t v8 = [(GEOPathStretch *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOPathStretch *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setStretch:v8];
      }
    }
  }

  return a1;
}

- (GEONoMatch)initWithJSON:(id)a3
{
  return (GEONoMatch *)-[GEONoMatch _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONoMatchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONoMatchReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_stretch)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEONoMatch *)self readAll:0];
  if (self->_stretch) {
    objc_msgSend(v4, "setStretch:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOPathStretch *)self->_stretch copyWithZone:a3];
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
    [(GEONoMatch *)self readAll:1];
    [v4 readAll:1];
    stretch = self->_stretch;
    if ((unint64_t)stretch | v4[2]) {
      char v5 = -[GEOPathStretch isEqual:](stretch, "isEqual:");
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
  [(GEONoMatch *)self readAll:1];
  stretch = self->_stretch;

  return [(GEOPathStretch *)stretch hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  stretch = self->_stretch;
  uint64_t v6 = v4[2];

  if (stretch)
  {
    if (v6)
    {
      [(GEOPathStretch *)stretch mergeFrom:v6];
    }
  }
  else if (v6)
  {
    [(GEONoMatch *)self setStretch:v6];
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
    [(GEONoMatch *)self readAll:0];
    stretch = self->_stretch;
    [(GEOPathStretch *)stretch clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stretch, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end