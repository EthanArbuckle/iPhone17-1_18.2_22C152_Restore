@interface UIImage(BlackbeardPrivateBridge)
- (uint64_t)initWithData:()BlackbeardPrivateBridge immediateLoadWithMaxSize:scale:;
@end

@implementation UIImage(BlackbeardPrivateBridge)

- (uint64_t)initWithData:()BlackbeardPrivateBridge immediateLoadWithMaxSize:scale:
{
  return objc_msgSend(a1, "_initWithData:immediateLoadWithMaxSize:scale:renderingIntent:cache:", a3, 0, 0);
}

@end