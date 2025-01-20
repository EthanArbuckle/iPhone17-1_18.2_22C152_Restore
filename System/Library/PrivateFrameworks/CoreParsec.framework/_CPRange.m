@interface _CPRange
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)location;
- (void)setLength:(unint64_t)a3;
- (void)setLocation:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPRange

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
}

- (unint64_t)location
{
  return self->_location;
}

- (unint64_t)hash
{
  return (2654435761u * self->_length) ^ (2654435761u * self->_location);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (unint64_t location = self->_location, location == [v4 location]))
  {
    unint64_t length = self->_length;
    BOOL v7 = length == [v4 length];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_CPRange *)self location]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPRange *)self length]) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPRangeReadFrom(self, (uint64_t)a3);
}

@end