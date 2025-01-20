@interface DKDAAPParserContainer
- (unsigned)code;
- (unsigned)length;
- (unsigned)remaining;
- (void)setCode:(unsigned int)a3;
- (void)setLength:(unsigned int)a3;
- (void)setRemaining:(unsigned int)a3;
@end

@implementation DKDAAPParserContainer

- (unsigned)remaining
{
  return self->_remaining;
}

- (void)setRemaining:(unsigned int)a3
{
  self->_remaining = a3;
}

- (void)setLength:(unsigned int)a3
{
  self->_length = a3;
}

- (void)setCode:(unsigned int)a3
{
  self->_code = a3;
}

- (unsigned)length
{
  return self->_length;
}

- (unsigned)code
{
  return self->_code;
}

@end