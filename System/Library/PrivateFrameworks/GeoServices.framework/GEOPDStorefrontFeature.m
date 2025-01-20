@interface GEOPDStorefrontFeature
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGeometry;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDOrientedBoundingBox)geometry;
- (GEOPDStorefrontFeature)initWithDictionary:(id)a3;
- (GEOPDStorefrontFeature)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGeometry:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDStorefrontFeature

- (int)type
{
  if (*(unsigned char *)&self->_flags) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if a3 < 6 && ((0x37u >> a3))
  {
    v3 = off_1E53E0B60[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"POI_UNSPECIFIED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"POI_SIGN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"POI_BUILDING_FACE_WITH_ENTRY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"POI_ENTRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"POI_OTHER_BUILDING_FACE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasGeometry
{
  return self->_geometry != 0;
}

- (GEOPDOrientedBoundingBox)geometry
{
  return self->_geometry;
}

- (void)setGeometry:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDStorefrontFeature;
  int v4 = [(GEOPDStorefrontFeature *)&v8 description];
  v5 = [(GEOPDStorefrontFeature *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDStorefrontFeature _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 20))
    {
      uint64_t v5 = *(int *)(a1 + 16);
      if v5 < 6 && ((0x37u >> v5))
      {
        v6 = off_1E53E0B60[v5];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    v7 = [(id)a1 geometry];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"geometry"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDStorefrontFeature _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDStorefrontFeature)initWithDictionary:(id)a3
{
  return (GEOPDStorefrontFeature *)-[GEOPDStorefrontFeature _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_25;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_25;
  }
  v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"POI_UNSPECIFIED"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"POI_SIGN"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"POI_BUILDING_FACE_WITH_ENTRY"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"POI_ENTRY"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"POI_OTHER_BUILDING_FACE"])
    {
      uint64_t v8 = 4;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_18:
    [a1 setType:v8];
  }

  v9 = [v5 objectForKeyedSubscript:@"geometry"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [GEOPDOrientedBoundingBox alloc];
    if (a3) {
      uint64_t v11 = [(GEOPDOrientedBoundingBox *)v10 initWithJSON:v9];
    }
    else {
      uint64_t v11 = [(GEOPDOrientedBoundingBox *)v10 initWithDictionary:v9];
    }
    v12 = (void *)v11;
    [a1 setGeometry:v11];
  }
LABEL_25:

  return a1;
}

- (GEOPDStorefrontFeature)initWithJSON:(id)a3
{
  return (GEOPDStorefrontFeature *)-[GEOPDStorefrontFeature _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDStorefrontFeatureIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDStorefrontFeatureReadAllFrom((uint64_t)self, a3);
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
  if (self->_geometry)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPDStorefrontFeature *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 4) = self->_type;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  if (self->_geometry)
  {
    objc_msgSend(v5, "setGeometry:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_type;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  id v7 = [(GEOPDOrientedBoundingBox *)self->_geometry copyWithZone:a3];
  uint64_t v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEOPDStorefrontFeature *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  geometry = self->_geometry;
  if ((unint64_t)geometry | *((void *)v4 + 1)) {
    char v6 = -[GEOPDOrientedBoundingBox isEqual:](geometry, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPDStorefrontFeature *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(GEOPDOrientedBoundingBox *)self->_geometry hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v7 = (int *)a3;
  [v7 readAll:0];
  id v4 = v7;
  if (v7[5])
  {
    self->_type = v7[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
  geometry = self->_geometry;
  uint64_t v6 = *((void *)v7 + 1);
  if (geometry)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDOrientedBoundingBox mergeFrom:](geometry, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDStorefrontFeature setGeometry:](self, "setGeometry:");
  }
  id v4 = v7;
LABEL_9:
}

- (void).cxx_destruct
{
}

@end