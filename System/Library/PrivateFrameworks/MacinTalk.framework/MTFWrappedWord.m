@interface MTFWrappedWord
- (NSString)fGroupPOS;
- (NSString)fResolvedPOS;
- (NSString)fText;
@end

@implementation MTFWrappedWord

- (NSString)fText
{
  v2 = NSString;
  v3 = [(MTFWrappedWord *)self elem] + 200;

  return (NSString *)[v2 stringWithCString:v3 encoding:1];
}

- (NSString)fResolvedPOS
{
  return (NSString *)&stru_1F3482DA8;
}

- (NSString)fGroupPOS
{
  v2 = NSString;
  v3 = [(MTFWrappedWord *)self elem];
  uint64_t v4 = *(void *)(MEMORY[0x1E4FA5840] + 8 * v3->var13);

  return (NSString *)[v2 stringWithCString:v4 encoding:1];
}

@end