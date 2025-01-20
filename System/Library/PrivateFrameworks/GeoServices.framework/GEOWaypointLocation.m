@interface GEOWaypointLocation
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocation)location;
- (GEOWaypointLocation)initWithDictionary:(id)a3;
- (GEOWaypointLocation)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLocation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWaypointLocation

- (void)setLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (GEOLocation)location
{
  return self->_location;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOLocation *)self->_location copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWaypointLocation;
  id v4 = [(GEOWaypointLocation *)&v8 description];
  id v5 = [(GEOWaypointLocation *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWaypointLocation _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 location];
    id v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"location"];
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
        v15[2] = __49__GEOWaypointLocation__dictionaryRepresentation___block_invoke;
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
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWaypointLocation _dictionaryRepresentation:](self, 1);
}

void __49__GEOWaypointLocation__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOWaypointLocation)initWithDictionary:(id)a3
{
  return (GEOWaypointLocation *)-[GEOWaypointLocation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"location"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [GEOLocation alloc];
        if (a3) {
          uint64_t v8 = [(GEOLocation *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOLocation *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setLocation:v8];
      }
    }
  }

  return a1;
}

- (GEOWaypointLocation)initWithJSON:(id)a3
{
  return (GEOWaypointLocation *)-[GEOWaypointLocation _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWaypointLocationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWaypointLocationReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOLocation *)self->_location hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOWaypointLocation *)self readAll:0];
  if (self->_location) {
    objc_msgSend(v4, "setLocation:");
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEOWaypointLocation *)self readAll:1];
    [v4 readAll:1];
    location = self->_location;
    if ((unint64_t)location | v4[2]) {
      char v5 = -[GEOLocation isEqual:](location, "isEqual:");
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
  [(GEOWaypointLocation *)self readAll:1];
  location = self->_location;

  return [(GEOLocation *)location hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  location = self->_location;
  uint64_t v6 = v4[2];

  if (location)
  {
    if (v6)
    {
      [(GEOLocation *)location mergeFrom:v6];
    }
  }
  else if (v6)
  {
    [(GEOWaypointLocation *)self setLocation:v6];
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
    [(GEOWaypointLocation *)self readAll:0];
    location = self->_location;
    [(GEOLocation *)location clearUnknownFields:1];
  }
}

@end