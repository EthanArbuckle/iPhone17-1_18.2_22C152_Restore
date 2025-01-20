@interface INIntent(CRContent)
- (id)underlyingInteraction;
@end

@implementation INIntent(CRContent)

- (id)underlyingInteraction
{
  v1 = (void *)[objc_alloc(MEMORY[0x263F0FBD8]) initWithIntent:a1 response:0];
  return v1;
}

@end