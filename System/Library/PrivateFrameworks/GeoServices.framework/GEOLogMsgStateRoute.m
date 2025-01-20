@interface GEOLogMsgStateRoute
+ (BOOL)isValid:(id)a3;
- (BOOL)hasRouteDetails;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateRoute)initWithDictionary:(id)a3;
- (GEOLogMsgStateRoute)initWithJSON:(id)a3;
- (GEORouteDetails)routeDetails;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRouteDetails:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateRoute

- (BOOL)hasRouteDetails
{
  return self->_routeDetails != 0;
}

- (GEORouteDetails)routeDetails
{
  return self->_routeDetails;
}

- (void)setRouteDetails:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateRoute;
  v4 = [(GEOLogMsgStateRoute *)&v8 description];
  v5 = [(GEOLogMsgStateRoute *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateRoute _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 routeDetails];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"routeDetails";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"route_details";
      }
      [v4 setObject:v7 forKey:v8];
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
  return -[GEOLogMsgStateRoute _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgStateRoute)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateRoute *)-[GEOLogMsgStateRoute _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"routeDetails";
      }
      else {
        v6 = @"route_details";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEORouteDetails alloc];
        if (a3) {
          uint64_t v9 = [(GEORouteDetails *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEORouteDetails *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setRouteDetails:v9];
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateRoute)initWithJSON:(id)a3
{
  return (GEOLogMsgStateRoute *)-[GEOLogMsgStateRoute _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateRouteIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateRouteReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_routeDetails) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOLogMsgStateRoute *)self readAll:0];
  if (self->_routeDetails) {
    objc_msgSend(v4, "setRouteDetails:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEORouteDetails *)self->_routeDetails copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEOLogMsgStateRoute *)self readAll:1];
    [v4 readAll:1];
    routeDetails = self->_routeDetails;
    if ((unint64_t)routeDetails | v4[1]) {
      char v5 = -[GEORouteDetails isEqual:](routeDetails, "isEqual:");
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
  [(GEOLogMsgStateRoute *)self readAll:1];
  routeDetails = self->_routeDetails;

  return [(GEORouteDetails *)routeDetails hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  routeDetails = self->_routeDetails;
  uint64_t v6 = v4[1];

  if (routeDetails)
  {
    if (v6)
    {
      [(GEORouteDetails *)routeDetails mergeFrom:v6];
    }
  }
  else if (v6)
  {
    [(GEOLogMsgStateRoute *)self setRouteDetails:v6];
  }
}

- (void).cxx_destruct
{
}

@end