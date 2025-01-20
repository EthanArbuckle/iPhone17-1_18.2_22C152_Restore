@interface NSURLSessionConfiguration(Network)
- (id)proxyConfigurations;
@end

@implementation NSURLSessionConfiguration(Network)

- (id)proxyConfigurations
{
  v2 = [a1 _proxyConfigurations];

  if (v2)
  {
    v3 = [a1 _proxyConfigurations];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

@end