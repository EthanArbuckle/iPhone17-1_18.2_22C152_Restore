@interface NSKeyValueProxyShareKey
+ (id)_proxyShare;
- ($37969B22FF855670809DBD7BF2B8540E)_proxyLocator;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
@end

@implementation NSKeyValueProxyShareKey

- ($37969B22FF855670809DBD7BF2B8540E)_proxyLocator
{
  key = self->_key;
  container = self->_container;
  result.var1 = key;
  result.var0 = container;
  return result;
}

+ (id)_proxyShare
{
  return 0;
}

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  return 0;
}

@end