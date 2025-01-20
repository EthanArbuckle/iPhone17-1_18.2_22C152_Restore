@interface NTKUltraCubeAuxiliaryDataDescription
- (BOOL)isThresholdMask;
- (id)description;
- (int)bytesPerRow;
- (int)height;
- (int)width;
- (unsigned)format;
- (void)setBytesPerRow:(int)a3;
- (void)setFormat:(unsigned int)a3;
- (void)setHeight:(int)a3;
- (void)setIsThresholdMask:(BOOL)a3;
- (void)setWidth:(int)a3;
@end

@implementation NTKUltraCubeAuxiliaryDataDescription

- (id)description
{
  return +[NSString stringWithFormat:@"(%ld x %ld), bpr == %ld, fmt == '%c%c%c%c'", self->_width, self->_height, self->_bytesPerRow, ((int)self->_format >> 24), ((int)(self->_format << 8) >> 24), ((__int16)self->_format >> 8), (char)self->_format];
}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (int)bytesPerRow
{
  return self->_bytesPerRow;
}

- (void)setBytesPerRow:(int)a3
{
  self->_bytesPerRow = a3;
}

- (unsigned)format
{
  return self->_format;
}

- (void)setFormat:(unsigned int)a3
{
  self->_format = a3;
}

- (BOOL)isThresholdMask
{
  return self->_isThresholdMask;
}

- (void)setIsThresholdMask:(BOOL)a3
{
  self->_isThresholdMask = a3;
}

@end