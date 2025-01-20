@interface _ABVCardTimeProvider
- (id)now;
@end

@implementation _ABVCardTimeProvider

- (id)now
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

@end