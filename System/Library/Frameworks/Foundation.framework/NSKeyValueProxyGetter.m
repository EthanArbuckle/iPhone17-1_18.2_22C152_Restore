@interface NSKeyValueProxyGetter
- (Class)proxyClass;
- (NSKeyValueProxyGetter)initWithContainerClassID:(id)a3 key:(id)a4 proxyClass:(Class)a5;
@end

@implementation NSKeyValueProxyGetter

- (Class)proxyClass
{
  return self->_proxyClass;
}

- (NSKeyValueProxyGetter)initWithContainerClassID:(id)a3 key:(id)a4 proxyClass:(Class)a5
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v8[1] = 0;
  v8[2] = 0;
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueProxyGetter;
  v8[0] = self;
  result = [(NSKeyValueAccessor *)&v7 initWithContainerClassID:a3 key:a4 implementation:_NSGetProxyValueWithGetter selector:0 extraArguments:v8 count:1];
  if (result) {
    result->_proxyClass = a5;
  }
  return result;
}

@end