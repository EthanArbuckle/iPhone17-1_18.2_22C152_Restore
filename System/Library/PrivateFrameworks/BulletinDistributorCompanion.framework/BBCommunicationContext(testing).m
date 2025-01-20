@interface BBCommunicationContext(testing)
- (id)imageDataForContentURL;
@end

@implementation BBCommunicationContext(testing)

- (id)imageDataForContentURL
{
  v1 = (void *)MEMORY[0x263F843B0];
  v2 = [a1 contentURL];
  v3 = [v1 imageDataForContentURL:v2];

  return v3;
}

@end