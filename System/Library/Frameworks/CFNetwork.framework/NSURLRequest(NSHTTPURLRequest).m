@interface NSURLRequest(NSHTTPURLRequest)
- (NSString)cookiePartitionIdentifier;
@end

@implementation NSURLRequest(NSHTTPURLRequest)

- (NSString)cookiePartitionIdentifier
{
  return *(NSString **)([(NSURLRequest *)self _inner] + 128);
}

@end