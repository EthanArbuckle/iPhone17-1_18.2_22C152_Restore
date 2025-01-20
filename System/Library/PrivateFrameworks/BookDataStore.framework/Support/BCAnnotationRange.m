@interface BCAnnotationRange
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)location;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLength:(unint64_t)a3;
- (void)setLocation:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCAnnotationRange

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)BCAnnotationRange;
  v3 = [(BCAnnotationRange *)&v7 description];
  v4 = [(BCAnnotationRange *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithUnsignedLongLong:self->_location];
  [v3 setObject:v4 forKey:@"location"];

  v5 = +[NSNumber numberWithUnsignedLongLong:self->_length];
  [v3 setObject:v5 forKey:@"length"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006A508((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 2) = self->_location;
  *((void *)a3 + 1) = self->_length;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 2) = self->_location;
  *((void *)result + 1) = self->_length;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_location == v4[2]
    && self->_length == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return (2654435761u * self->_length) ^ (2654435761u * self->_location);
}

- (void)mergeFrom:(id)a3
{
  self->_location = *((void *)a3 + 2);
  self->_length = *((void *)a3 + 1);
}

- (unint64_t)location
{
  return self->_location;
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

@end