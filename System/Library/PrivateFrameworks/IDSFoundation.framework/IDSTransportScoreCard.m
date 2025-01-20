@interface IDSTransportScoreCard
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation IDSTransportScoreCard

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(IDSTransportScoreCard);
  *((void *)result + 1) = self->score;
  *((void *)result + 2) = self->stunTransport;
  *((void *)result + 3) = self->transportInterface;
  *((_DWORD *)result + 8) = self->interfaceIndex;
  *((unsigned char *)result + 36) = self->alreadySelected;
  *((unsigned char *)result + 37) = self->isIPv6;
  return result;
}

@end