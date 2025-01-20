@interface NSString(TextDirectionality)
- (uint64_t)wf_hasStrongRTLCharacter;
@end

@implementation NSString(TextDirectionality)

- (uint64_t)wf_hasStrongRTLCharacter
{
  if (![a1 length]) {
    return 0;
  }
  unint64_t v2 = 0;
  do
  {
    [a1 characterAtIndex:v2];
    uint64_t IsMemberOf = CFUniCharIsMemberOf();
    if (IsMemberOf) {
      break;
    }
    ++v2;
  }
  while ([a1 length] > v2);
  return IsMemberOf;
}

@end