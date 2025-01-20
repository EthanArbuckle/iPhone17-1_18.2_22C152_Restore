@interface MSPQuerySearch
- (BOOL)hasLanguage;
- (BOOL)hasLocationDisplayString;
- (BOOL)hasMapRegion;
- (BOOL)hasQuery;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapRegion)mapRegion;
- (NSString)language;
- (NSString)locationDisplayString;
- (NSString)query;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLocationDisplayString:(id)a3;
- (void)setMapRegion:(id)a3;
- (void)setQuery:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPQuerySearch

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (BOOL)hasLocationDisplayString
{
  return self->_locationDisplayString != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPQuerySearch;
  v4 = [(MSPQuerySearch *)&v8 description];
  v5 = [(MSPQuerySearch *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  query = self->_query;
  if (query) {
    [v3 setObject:query forKey:@"query"];
  }
  locationDisplayString = self->_locationDisplayString;
  if (locationDisplayString) {
    [v4 setObject:locationDisplayString forKey:@"locationDisplayString"];
  }
  language = self->_language;
  if (language) {
    [v4 setObject:language forKey:@"language"];
  }
  mapRegion = self->_mapRegion;
  if (mapRegion)
  {
    v9 = [(GEOMapRegion *)mapRegion dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"mapRegion"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v11 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"Unknown Fields"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MSPQuerySearchReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_query)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_locationDisplayString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_mapRegion)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_query)
  {
    objc_msgSend(v4, "setQuery:");
    id v4 = v5;
  }
  if (self->_locationDisplayString)
  {
    objc_msgSend(v5, "setLocationDisplayString:");
    id v4 = v5;
  }
  if (self->_language)
  {
    objc_msgSend(v5, "setLanguage:");
    id v4 = v5;
  }
  if (self->_mapRegion)
  {
    objc_msgSend(v5, "setMapRegion:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_query copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_locationDisplayString copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_language copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((query = self->_query, !((unint64_t)query | v4[5]))
     || -[NSString isEqual:](query, "isEqual:"))
    && ((locationDisplayString = self->_locationDisplayString, !((unint64_t)locationDisplayString | v4[3]))
     || -[NSString isEqual:](locationDisplayString, "isEqual:"))
    && ((language = self->_language, !((unint64_t)language | v4[2]))
     || -[NSString isEqual:](language, "isEqual:")))
  {
    mapRegion = self->_mapRegion;
    if ((unint64_t)mapRegion | v4[4]) {
      char v9 = -[GEOMapRegion isEqual:](mapRegion, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_query hash];
  NSUInteger v4 = [(NSString *)self->_locationDisplayString hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_language hash];
  return v4 ^ v5 ^ [(GEOMapRegion *)self->_mapRegion hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  v7 = v4;
  if (v4[5])
  {
    -[MSPQuerySearch setQuery:](self, "setQuery:");
    NSUInteger v4 = v7;
  }
  if (v4[3])
  {
    -[MSPQuerySearch setLocationDisplayString:](self, "setLocationDisplayString:");
    NSUInteger v4 = v7;
  }
  if (v4[2])
  {
    -[MSPQuerySearch setLanguage:](self, "setLanguage:");
    NSUInteger v4 = v7;
  }
  mapRegion = self->_mapRegion;
  uint64_t v6 = v4[4];
  if (mapRegion)
  {
    if (v6) {
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[MSPQuerySearch setMapRegion:](self, "setMapRegion:");
  }

  MEMORY[0x1F41817F8]();
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSString)locationDisplayString
{
  return self->_locationDisplayString;
}

- (void)setLocationDisplayString:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_locationDisplayString, 0);
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end