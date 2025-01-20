@interface NSString(AXFRExtras)
- (id)stringByTrimmingEmptySpaceEdges;
@end

@implementation NSString(AXFRExtras)

- (id)stringByTrimmingEmptySpaceEdges
{
  if ([a1 length])
  {
    v2 = (__CFString *)[a1 mutableCopy];
    CFStringTrimWhitespace(v2);
    id v3 = (id)[(__CFString *)v2 copy];
  }
  else
  {
    id v3 = a1;
  }

  return v3;
}

@end