@interface IMSticker(CKImageUtils)
- (uint64_t)prepareToSend;
@end

@implementation IMSticker(CKImageUtils)

- (uint64_t)prepareToSend
{
  return 1;
}

@end