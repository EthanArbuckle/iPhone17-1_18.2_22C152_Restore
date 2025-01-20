@interface GEONonTiledMaterial
+ (BOOL)isValid:(id)a3;
- (BOOL)hasInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEONonTiledInfo)info;
- (GEONonTiledMaterial)initWithDictionary:(id)a3;
- (GEONonTiledMaterial)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONonTiledMaterial

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"info"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [GEONonTiledInfo alloc];
        if (a3) {
          uint64_t v8 = [(GEONonTiledInfo *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEONonTiledInfo *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setInfo:v8];
      }
    }
  }

  return a1;
}

- (BOOL)hasInfo
{
  return self->_info != 0;
}

- (GEONonTiledInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONonTiledMaterial;
  v4 = [(GEONonTiledMaterial *)&v8 description];
  id v5 = [(GEONonTiledMaterial *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONonTiledMaterial _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 info];
    v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"info"];
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
  return -[GEONonTiledMaterial _dictionaryRepresentation:](self, 1);
}

- (GEONonTiledMaterial)initWithDictionary:(id)a3
{
  return (GEONonTiledMaterial *)-[GEONonTiledMaterial _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEONonTiledMaterial)initWithJSON:(id)a3
{
  return (GEONonTiledMaterial *)-[GEONonTiledMaterial _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONonTiledMaterialIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONonTiledMaterialReadAllFrom((uint64_t)self, a3);
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
  [(GEONonTiledMaterial *)self readAll:0];
  if (self->_info) {
    objc_msgSend(v4, "setInfo:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
    [(GEONonTiledMaterial *)self readAll:1];
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
  [(GEONonTiledMaterial *)self readAll:1];
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
    [(GEONonTiledMaterial *)self setInfo:v6];
  }
}

- (void).cxx_destruct
{
}

@end