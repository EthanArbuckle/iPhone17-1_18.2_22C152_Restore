@interface DTTapMemo
- (unsigned)tapVersion;
- (void)setTapVersion:(unsigned int)a3;
@end

@implementation DTTapMemo

- (unsigned)tapVersion
{
  return self->_tapVersion;
}

- (void)setTapVersion:(unsigned int)a3
{
  self->_tapVersion = a3;
}

@end