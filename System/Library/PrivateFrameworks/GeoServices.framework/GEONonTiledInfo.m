@interface GEONonTiledInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasMuid;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEONonTiledInfo)initWithDictionary:(id)a3;
- (GEONonTiledInfo)initWithJSON:(id)a3;
- (NSString)name;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONonTiledInfo

- (NSString)name
{
  return self->_name;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (BOOL)hasMuid
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void).cxx_destruct
{
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (GEONonTiledInfo)initWithJSON:(id)a3
{
  return (GEONonTiledInfo *)-[GEONonTiledInfo _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = (void *)[v4 copy];
        [a1 setName:v5];
      }
      v6 = [v3 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMuid:", objc_msgSend(v6, "unsignedLongLongValue"));
      }
    }
  }

  return a1;
}

- (void)setName:(id)a3
{
}

- (void)setMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONonTiledInfo;
  v4 = [(GEONonTiledInfo *)&v8 description];
  v5 = [(GEONonTiledInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    id v3 = [(id)a1 name];
    if (v3) {
      [v2 setObject:v3 forKey:@"name"];
    }

    if (*(unsigned char *)(a1 + 24))
    {
      v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
      [v2 setObject:v4 forKey:@"muid"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEONonTiledInfo)initWithDictionary:(id)a3
{
  return (GEONonTiledInfo *)-[GEONonTiledInfo _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEONonTiledInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONonTiledInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEONonTiledInfo *)self readAll:0];
  if (self->_name) {
    objc_msgSend(v4, "setName:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((void *)v4 + 1) = self->_muid;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 8) = self->_muid;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEONonTiledInfo *)self readAll:1];
  [v4 readAll:1];
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_muid == *((void *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  [(GEONonTiledInfo *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v4 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unint64_t *)a3;
  [v4 readAll:0];
  if (v4[2]) {
    -[GEONonTiledInfo setName:](self, "setName:");
  }
  if (v4[3])
  {
    self->_muid = v4[1];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end