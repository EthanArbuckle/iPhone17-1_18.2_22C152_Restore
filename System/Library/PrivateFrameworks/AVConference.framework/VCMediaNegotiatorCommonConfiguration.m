@interface VCMediaNegotiatorCommonConfiguration
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)ssrc;
- (void)setSsrc:(unsigned int)a3;
@end

@implementation VCMediaNegotiatorCommonConfiguration

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0 && [a3 ssrc] == self->_ssrc;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setSsrc:self->_ssrc];
  return v4;
}

- (unsigned)ssrc
{
  return self->_ssrc;
}

- (void)setSsrc:(unsigned int)a3
{
  self->_ssrc = a3;
}

@end