@interface DataProviderKeyWrapper
- (DataProviderKeyWrapper)initWithKey:(const void *)a3;
- (NSData)serviceKey;
- (NSString)description;
- (id)redactedDescription;
- (unsigned)layer;
@end

@implementation DataProviderKeyWrapper

- (DataProviderKeyWrapper)initWithKey:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DataProviderKeyWrapper;
  v4 = [(DataProviderKeyWrapper *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_layer = *(_DWORD *)a3;
    uint64_t v6 = +[NSData dataWithBytes:*((void *)a3 + 1) length:*((void *)a3 + 2) - *((void *)a3 + 1)];
    serviceKey = v5->_serviceKey;
    v5->_serviceKey = (NSData *)v6;
  }
  return v5;
}

- (NSString)description
{
  v3 = [(NSData *)self->_serviceKey base64EncodedStringWithOptions:0];
  v4 = +[NSString stringWithFormat:@"{ layer: %llu, serviceKey: %@ }", self->_layer, v3];

  return (NSString *)v4;
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:@"{ layer: %llu, serviceKey: <redacted> }", self->_layer];
}

- (unsigned)layer
{
  return self->_layer;
}

- (NSData)serviceKey
{
  return self->_serviceKey;
}

- (void).cxx_destruct
{
}

@end