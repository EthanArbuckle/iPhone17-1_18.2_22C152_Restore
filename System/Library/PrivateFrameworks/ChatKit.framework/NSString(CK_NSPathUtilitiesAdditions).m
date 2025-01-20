@interface NSString(CK_NSPathUtilitiesAdditions)
- (id)__ck_stringByExpandingTildeInPath;
@end

@implementation NSString(CK_NSPathUtilitiesAdditions)

- (id)__ck_stringByExpandingTildeInPath
{
  if ([a1 hasPrefix:@"~"])
  {
    v2 = (void *)[a1 mutableCopy];
    objc_msgSend(v2, "replaceCharactersInRange:withString:", 0, 1, @"/var/mobile/");
    v3 = (void *)[v2 copy];
  }
  else
  {
    v3 = [a1 stringByExpandingTildeInPath];
  }

  return v3;
}

@end