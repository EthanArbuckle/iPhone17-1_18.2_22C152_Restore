@interface GEOPDPlacesRequestResponseAnalyticsData
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlacesRequestResponseAnalyticsData)initWithDictionary:(id)a3;
- (GEOPDPlacesRequestResponseAnalyticsData)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlacesRequestResponseAnalyticsData

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlacesRequestResponseAnalyticsData;
  v4 = [(GEOPDPlacesRequestResponseAnalyticsData *)&v8 description];
  v5 = [(GEOPDPlacesRequestResponseAnalyticsData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlacesRequestResponseAnalyticsData _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = (void *)a1[1];
    if (v5)
    {
      v6 = [v5 dictionaryRepresentation];
      v7 = v6;
      if (a2)
      {
        objc_super v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __69__GEOPDPlacesRequestResponseAnalyticsData__dictionaryRepresentation___block_invoke;
        v12[3] = &unk_1E53D8860;
        id v9 = v8;
        id v13 = v9;
        [v7 enumerateKeysAndObjectsUsingBlock:v12];
        id v10 = v9;

        v7 = v10;
      }
      [v4 setObject:v7 forKey:@"Unknown Fields"];
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
  return -[GEOPDPlacesRequestResponseAnalyticsData _dictionaryRepresentation:](self, 1);
}

void __69__GEOPDPlacesRequestResponseAnalyticsData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDPlacesRequestResponseAnalyticsData)initWithDictionary:(id)a3
{
  return (GEOPDPlacesRequestResponseAnalyticsData *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
}

- (GEOPDPlacesRequestResponseAnalyticsData)initWithJSON:(id)a3
{
  return (GEOPDPlacesRequestResponseAnalyticsData *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlacesRequestResponseAnalyticsDataIsValid((unsigned __int8 *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlacesRequestResponseAnalyticsDataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_unknownFields);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    [(GEOPDPlacesRequestResponseAnalyticsData *)self readAll:1];
    [v4 readAll:1];
  }

  return v5;
}

- (unint64_t)hash
{
  return 0;
}

- (void)mergeFrom:(id)a3
{
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
    [(GEOPDPlacesRequestResponseAnalyticsData *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end