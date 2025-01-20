@interface IDSOffGridEncryptedMessage
- (int64_t)__im__preferredServiceType;
@end

@implementation IDSOffGridEncryptedMessage

- (int64_t)__im__preferredServiceType
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return -1;
  }

  return (int64_t)[(IDSOffGridEncryptedMessage *)self preferredServiceType];
}

@end