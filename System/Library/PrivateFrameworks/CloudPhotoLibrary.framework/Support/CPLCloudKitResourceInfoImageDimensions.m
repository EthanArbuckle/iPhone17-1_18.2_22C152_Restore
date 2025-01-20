@interface CPLCloudKitResourceInfoImageDimensions
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)height;
- (int64_t)width;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHeight:(int64_t)a3;
- (void)setWidth:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLCloudKitResourceInfoImageDimensions

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CPLCloudKitResourceInfoImageDimensions;
  v3 = [(CPLCloudKitResourceInfoImageDimensions *)&v7 description];
  v4 = [(CPLCloudKitResourceInfoImageDimensions *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithLongLong:self->_width];
  [v3 setObject:v4 forKey:@"width"];

  v5 = +[NSNumber numberWithLongLong:self->_height];
  [v3 setObject:v5 forKey:@"height"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CPLCloudKitResourceInfoImageDimensionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt64Field();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 2) = self->_width;
  *((void *)a3 + 1) = self->_height;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 2) = self->_width;
  *((void *)result + 1) = self->_height;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_width == v4[2]
    && self->_height == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_height) ^ (2654435761 * self->_width);
}

- (void)mergeFrom:(id)a3
{
  self->_width = *((void *)a3 + 2);
  self->_height = *((void *)a3 + 1);
}

- (int64_t)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
}

- (int64_t)height
{
  return self->_height;
}

- (void)setHeight:(int64_t)a3
{
  self->_height = a3;
}

@end