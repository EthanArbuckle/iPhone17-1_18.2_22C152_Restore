@interface TKTokenKeyExchangeParameters
- (NSData)sharedInfo;
- (NSInteger)requestedSize;
- (TKTokenKeyExchangeParameters)initWithParameters:(id)a3;
@end

@implementation TKTokenKeyExchangeParameters

- (TKTokenKeyExchangeParameters)initWithParameters:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TKTokenKeyExchangeParameters;
  v5 = [(TKTokenKeyExchangeParameters *)&v11 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3BB48]];
    v6->_requestedSize = [v7 integerValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3BB50]];
    sharedInfo = v6->_sharedInfo;
    v6->_sharedInfo = (NSData *)v8;
  }
  return v6;
}

- (NSInteger)requestedSize
{
  return self->_requestedSize;
}

- (NSData)sharedInfo
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end