@interface NSError(CPSafeDescription)
- (id)CPSafeDescription;
@end

@implementation NSError(CPSafeDescription)

- (id)CPSafeDescription
{
  id v2 = [NSString alloc];
  v3 = [a1 domain];
  v4 = (void *)[v2 initWithFormat:@"<NSError %p>(domain: %@, code: %ld)", a1, v3, objc_msgSend(a1, "code")];

  return v4;
}

@end