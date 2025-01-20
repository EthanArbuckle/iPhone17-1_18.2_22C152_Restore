@interface NSError(DYNSErrorAdditions)
- (uint64_t)dy_errorSignature;
@end

@implementation NSError(DYNSErrorAdditions)

- (uint64_t)dy_errorSignature
{
  return [NSString stringWithFormat:@"%@ (%llu)", objc_msgSend(a1, "domain"), objc_msgSend(a1, "code")];
}

@end