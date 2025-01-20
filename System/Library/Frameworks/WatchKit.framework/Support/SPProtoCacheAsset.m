@interface SPProtoCacheAsset
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (double)accessDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)size;
- (unsigned)state;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessDate:(double)a3;
- (void)setKey:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setState:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoCacheAsset

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SPProtoCacheAsset;
  v3 = [(SPProtoCacheAsset *)&v7 description];
  v4 = [(SPProtoCacheAsset *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithUnsignedInt:self->_state];
  [v3 setObject:v4 forKey:@"state"];

  v5 = +[NSNumber numberWithUnsignedLongLong:self->_size];
  [v3 setObject:v5 forKey:@"size"];

  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  objc_super v7 = +[NSNumber numberWithDouble:self->_accessDate];
  [v3 setObject:v7 forKey:@"accessDate"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoCacheAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 8) = self->_state;
  *((void *)a3 + 2) = self->_size;
  key = self->_key;
  v5 = (double *)a3;
  [v5 setKey:key];
  v5[1] = self->_accessDate;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[8] = self->_state;
  *((void *)v5 + 2) = self->_size;
  id v6 = [(NSString *)self->_key copyWithZone:a3];
  objc_super v7 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v6;

  *((void *)v5 + 1) = *(void *)&self->_accessDate;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_state == *((_DWORD *)v4 + 8)
    && self->_size == *((void *)v4 + 2)
    && ((key = self->_key, !((unint64_t)key | *((void *)v4 + 3)))
     || -[NSString isEqual:](key, "isEqual:"))
    && self->_accessDate == *((double *)v4 + 1);

  return v6;
}

- (unint64_t)hash
{
  unsigned int state = self->_state;
  unint64_t size = self->_size;
  NSUInteger v5 = [(NSString *)self->_key hash];
  double accessDate = self->_accessDate;
  double v7 = -accessDate;
  if (accessDate >= 0.0) {
    double v7 = self->_accessDate;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  double v10 = fmod(v8, 1.84467441e19);
  unint64_t v11 = 2654435761u * (unint64_t)v10;
  unint64_t v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0) {
    unint64_t v12 = 2654435761u * (unint64_t)v10;
  }
  unint64_t v13 = v11 - (unint64_t)fabs(v9);
  if (v9 >= 0.0) {
    unint64_t v13 = v12;
  }
  return (2654435761u * size) ^ (2654435761 * state) ^ v5 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unsigned int state = *((_DWORD *)v4 + 8);
  self->_unint64_t size = *((void *)v4 + 2);
  if (*((void *)v4 + 3))
  {
    id v5 = v4;
    -[SPProtoCacheAsset setKey:](self, "setKey:");
    id v4 = v5;
  }
  self->_double accessDate = *((double *)v4 + 1);
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned int)a3
{
  self->_unsigned int state = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_unint64_t size = a3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (double)accessDate
{
  return self->_accessDate;
}

- (void)setAccessDate:(double)a3
{
  self->_double accessDate = a3;
}

- (void).cxx_destruct
{
}

@end