@interface GEOPDModuleOptions
+ (BOOL)isValid:(id)a3;
- (BOOL)hasWebContentUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDModuleOptions)initWithDictionary:(id)a3;
- (GEOPDModuleOptions)initWithJSON:(id)a3;
- (NSString)webContentUrl;
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
- (void)setWebContentUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDModuleOptions

- (BOOL)hasWebContentUrl
{
  return self->_webContentUrl != 0;
}

- (NSString)webContentUrl
{
  return self->_webContentUrl;
}

- (void)setWebContentUrl:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDModuleOptions;
  v4 = [(GEOPDModuleOptions *)&v8 description];
  v5 = [(GEOPDModuleOptions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDModuleOptions _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 webContentUrl];
    if (v5)
    {
      if (a2) {
        v6 = @"webContentUrl";
      }
      else {
        v6 = @"web_content_url";
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
        v14[2] = __48__GEOPDModuleOptions__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDModuleOptions _dictionaryRepresentation:](self, 1);
}

void __48__GEOPDModuleOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDModuleOptions)initWithDictionary:(id)a3
{
  return (GEOPDModuleOptions *)-[GEOPDModuleOptions _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"webContentUrl";
      }
      else {
        v6 = @"web_content_url";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setWebContentUrl:v8];
      }
    }
  }

  return a1;
}

- (GEOPDModuleOptions)initWithJSON:(id)a3
{
  return (GEOPDModuleOptions *)-[GEOPDModuleOptions _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDModuleOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDModuleOptionsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_webContentUrl)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOPDModuleOptions *)self readAll:0];
  if (self->_webContentUrl) {
    objc_msgSend(v4, "setWebContentUrl:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_webContentUrl copyWithZone:a3];
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
    [(GEOPDModuleOptions *)self readAll:1];
    [v4 readAll:1];
    webContentUrl = self->_webContentUrl;
    if ((unint64_t)webContentUrl | v4[2]) {
      char v5 = -[NSString isEqual:](webContentUrl, "isEqual:");
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
  [(GEOPDModuleOptions *)self readAll:1];
  webContentUrl = self->_webContentUrl;

  return [(NSString *)webContentUrl hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = v4[2];

  if (v5)
  {
    [(GEOPDModuleOptions *)self setWebContentUrl:v5];
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
    [(GEOPDModuleOptions *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webContentUrl, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end