@interface GEOOutOfMapsAlertsInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAlertNonRecommendedRouteText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAlertNonRecommendedRouteText)alertNonRecommendedRouteText;
- (GEOOutOfMapsAlertsInfo)initWithDictionary:(id)a3;
- (GEOOutOfMapsAlertsInfo)initWithJSON:(id)a3;
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
- (void)setAlertNonRecommendedRouteText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOOutOfMapsAlertsInfo

- (BOOL)hasAlertNonRecommendedRouteText
{
  return self->_alertNonRecommendedRouteText != 0;
}

- (GEOAlertNonRecommendedRouteText)alertNonRecommendedRouteText
{
  return self->_alertNonRecommendedRouteText;
}

- (void)setAlertNonRecommendedRouteText:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOOutOfMapsAlertsInfo;
  v4 = [(GEOOutOfMapsAlertsInfo *)&v8 description];
  v5 = [(GEOOutOfMapsAlertsInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOOutOfMapsAlertsInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 alertNonRecommendedRouteText];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"alertNonRecommendedRouteText";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"alert_non_recommended_route_text";
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
        v16[2] = __52__GEOOutOfMapsAlertsInfo__dictionaryRepresentation___block_invoke;
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
  return -[GEOOutOfMapsAlertsInfo _dictionaryRepresentation:](self, 1);
}

void __52__GEOOutOfMapsAlertsInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOOutOfMapsAlertsInfo)initWithDictionary:(id)a3
{
  return (GEOOutOfMapsAlertsInfo *)-[GEOOutOfMapsAlertsInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"alertNonRecommendedRouteText";
      }
      else {
        v6 = @"alert_non_recommended_route_text";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOAlertNonRecommendedRouteText alloc];
        if (a3) {
          uint64_t v9 = [(GEOAlertNonRecommendedRouteText *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOAlertNonRecommendedRouteText *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setAlertNonRecommendedRouteText:v9];
      }
    }
  }

  return a1;
}

- (GEOOutOfMapsAlertsInfo)initWithJSON:(id)a3
{
  return (GEOOutOfMapsAlertsInfo *)-[GEOOutOfMapsAlertsInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOOutOfMapsAlertsInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOOutOfMapsAlertsInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_alertNonRecommendedRouteText)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOOutOfMapsAlertsInfo *)self readAll:0];
  if (self->_alertNonRecommendedRouteText) {
    objc_msgSend(v4, "setAlertNonRecommendedRouteText:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOAlertNonRecommendedRouteText *)self->_alertNonRecommendedRouteText copyWithZone:a3];
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
    [(GEOOutOfMapsAlertsInfo *)self readAll:1];
    [v4 readAll:1];
    alertNonRecommendedRouteText = self->_alertNonRecommendedRouteText;
    if ((unint64_t)alertNonRecommendedRouteText | v4[2]) {
      char v5 = -[GEOAlertNonRecommendedRouteText isEqual:](alertNonRecommendedRouteText, "isEqual:");
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
  [(GEOOutOfMapsAlertsInfo *)self readAll:1];
  alertNonRecommendedRouteText = self->_alertNonRecommendedRouteText;

  return [(GEOAlertNonRecommendedRouteText *)alertNonRecommendedRouteText hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  alertNonRecommendedRouteText = self->_alertNonRecommendedRouteText;
  uint64_t v6 = v4[2];

  if (alertNonRecommendedRouteText)
  {
    if (v6)
    {
      [(GEOAlertNonRecommendedRouteText *)alertNonRecommendedRouteText mergeFrom:v6];
    }
  }
  else if (v6)
  {
    [(GEOOutOfMapsAlertsInfo *)self setAlertNonRecommendedRouteText:v6];
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
    [(GEOOutOfMapsAlertsInfo *)self readAll:0];
    alertNonRecommendedRouteText = self->_alertNonRecommendedRouteText;
    [(GEOAlertNonRecommendedRouteText *)alertNonRecommendedRouteText clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertNonRecommendedRouteText, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end