@interface NSError(HomeError)
- (BOOL)isHomeError;
@end

@implementation NSError(HomeError)

- (BOOL)isHomeError
{
  if ([a1 code] != 1016 && objc_msgSend(a1, "code") != 1002) {
    return 0;
  }
  v2 = [a1 domain];
  BOOL v3 = v2 == (void *)*MEMORY[0x1E4F4A4C8];

  return v3;
}

@end