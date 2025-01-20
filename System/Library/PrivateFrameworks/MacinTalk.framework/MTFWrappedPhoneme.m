@interface MTFWrappedPhoneme
- (NSString)name;
@end

@implementation MTFWrappedPhoneme

- (NSString)name
{
  v2 = NSString;
  v3 = [(MTFWrappedPhoneme *)self elem];
  uint64_t v4 = *(void *)(MEMORY[0x1E4FA5858] + 8 * v3->var9);

  return (NSString *)[v2 stringWithCString:v4 encoding:1];
}

@end