@interface GEONonTiledMaterialMap
+ (BOOL)isValid:(id)a3;
- (BOOL)hasInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEONonTiledInfo)info;
- (GEONonTiledMaterialMap)initWithDictionary:(id)a3;
- (GEONonTiledMaterialMap)initWithJSON:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONonTiledMaterialMap

- (GEONonTiledInfo)info
{
  return self->_info;
}

- (void).cxx_destruct
{
}

- (GEONonTiledMaterialMap)initWithJSON:(id)a3
{
  return (GEONonTiledMaterialMap *)-[GEONonTiledMaterial _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)setInfo:(id)a3
{
}

- (BOOL)hasInfo
{
  return self->_info != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONonTiledMaterialMap;
  v4 = [(GEONonTiledMaterialMap *)&v8 description];
  v5 = [(GEONonTiledMaterialMap *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONonTiledMaterial _dictionaryRepresentation:](self, 0);
}

- (id)jsonRepresentation
{
  return -[GEONonTiledMaterial _dictionaryRepresentation:](self, 1);
}

- (GEONonTiledMaterialMap)initWithDictionary:(id)a3
{
  return (GEONonTiledMaterialMap *)-[GEONonTiledMaterial _initWithDictionary:isJSON:](self, a3, 0);
}

+ (BOOL)isValid:(id)a3
{
  return GEONonTiledMaterialMapIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONonTiledMaterialMapReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_info) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEONonTiledMaterialMap *)self readAll:0];
  if (self->_info) {
    objc_msgSend(v4, "setInfo:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEONonTiledInfo *)self->_info copyWithZone:a3];
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
    [(GEONonTiledMaterialMap *)self readAll:1];
    [v4 readAll:1];
    info = self->_info;
    if ((unint64_t)info | v4[1]) {
      char v5 = -[GEONonTiledInfo isEqual:](info, "isEqual:");
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
  [(GEONonTiledMaterialMap *)self readAll:1];
  info = self->_info;

  return [(GEONonTiledInfo *)info hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  info = self->_info;
  uint64_t v6 = v4[1];

  if (info)
  {
    if (v6)
    {
      [(GEONonTiledInfo *)info mergeFrom:v6];
    }
  }
  else if (v6)
  {
    [(GEONonTiledMaterialMap *)self setInfo:v6];
  }
}

@end