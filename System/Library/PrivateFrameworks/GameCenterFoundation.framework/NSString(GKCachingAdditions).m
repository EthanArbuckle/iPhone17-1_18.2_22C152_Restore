@interface NSString(GKCachingAdditions)
- (id)cacheKeyRepresentation;
@end

@implementation NSString(GKCachingAdditions)

- (id)cacheKeyRepresentation
{
  v2 = (void *)[a1 mutableCopy];
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"/", @"_", 2, 0, objc_msgSend(a1, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @":", @"_", 2, 0, objc_msgSend(a1, "length"));

  return v2;
}

@end