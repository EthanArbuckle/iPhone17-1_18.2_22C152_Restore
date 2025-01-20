@interface GEOLogMsgEventPlaceDataCache
+ (BOOL)isValid:(id)a3;
- (BOOL)hasPlaceDataRequestingAppIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventPlaceDataCache)initWithDictionary:(id)a3;
- (GEOLogMsgEventPlaceDataCache)initWithJSON:(id)a3;
- (NSString)placeDataRequestingAppIdentifier;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPlaceDataRequestingAppIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventPlaceDataCache

- (BOOL)hasPlaceDataRequestingAppIdentifier
{
  return self->_placeDataRequestingAppIdentifier != 0;
}

- (NSString)placeDataRequestingAppIdentifier
{
  return self->_placeDataRequestingAppIdentifier;
}

- (void)setPlaceDataRequestingAppIdentifier:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventPlaceDataCache;
  v4 = [(GEOLogMsgEventPlaceDataCache *)&v8 description];
  v5 = [(GEOLogMsgEventPlaceDataCache *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventPlaceDataCache _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 placeDataRequestingAppIdentifier];
    if (v5)
    {
      if (a2) {
        v6 = @"placeDataRequestingAppIdentifier";
      }
      else {
        v6 = @"place_data_requesting_app_identifier";
      }
      [v4 setObject:v5 forKey:v6];
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
  return -[GEOLogMsgEventPlaceDataCache _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgEventPlaceDataCache)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventPlaceDataCache *)-[GEOLogMsgEventPlaceDataCache _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"placeDataRequestingAppIdentifier";
      }
      else {
        v6 = @"place_data_requesting_app_identifier";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setPlaceDataRequestingAppIdentifier:v8];
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventPlaceDataCache)initWithJSON:(id)a3
{
  return (GEOLogMsgEventPlaceDataCache *)-[GEOLogMsgEventPlaceDataCache _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventPlaceDataCacheIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventPlaceDataCacheReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_placeDataRequestingAppIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOLogMsgEventPlaceDataCache *)self readAll:0];
  if (self->_placeDataRequestingAppIdentifier) {
    objc_msgSend(v4, "setPlaceDataRequestingAppIdentifier:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_placeDataRequestingAppIdentifier copyWithZone:a3];
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
    [(GEOLogMsgEventPlaceDataCache *)self readAll:1];
    [v4 readAll:1];
    placeDataRequestingAppIdentifier = self->_placeDataRequestingAppIdentifier;
    if ((unint64_t)placeDataRequestingAppIdentifier | v4[1]) {
      char v5 = -[NSString isEqual:](placeDataRequestingAppIdentifier, "isEqual:");
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
  [(GEOLogMsgEventPlaceDataCache *)self readAll:1];
  placeDataRequestingAppIdentifier = self->_placeDataRequestingAppIdentifier;

  return [(NSString *)placeDataRequestingAppIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = v4[1];

  if (v5)
  {
    [(GEOLogMsgEventPlaceDataCache *)self setPlaceDataRequestingAppIdentifier:v5];
  }
}

- (void).cxx_destruct
{
}

@end