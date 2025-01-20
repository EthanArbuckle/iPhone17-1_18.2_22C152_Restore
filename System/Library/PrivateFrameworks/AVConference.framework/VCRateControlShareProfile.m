@interface VCRateControlShareProfile
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)rateSharingCount;
- (unsigned)reservedBitrate;
- (void)setRateSharingCount:(unsigned int)a3;
- (void)setReservedBitrate:(unsigned int)a3;
@end

@implementation VCRateControlShareProfile

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[VCRateControlShareProfile allocWithZone:a3];
  [(VCRateControlShareProfile *)v4 setReservedBitrate:self->_reservedBitrate];
  [(VCRateControlShareProfile *)v4 setRateSharingCount:self->_rateSharingCount];
  return v4;
}

- (unsigned)reservedBitrate
{
  return self->_reservedBitrate;
}

- (void)setReservedBitrate:(unsigned int)a3
{
  self->_reservedBitrate = a3;
}

- (unsigned)rateSharingCount
{
  return self->_rateSharingCount;
}

- (void)setRateSharingCount:(unsigned int)a3
{
  self->_rateSharingCount = a3;
}

@end