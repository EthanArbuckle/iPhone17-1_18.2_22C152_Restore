@interface AVContentKeyRequestParams
- (AVContentKeyRequestParams)initWithInitializationData:(id)a3 contentIdentifier:(id)a4 keyIDFromInitializationData:(id)a5 options:(id)a6 identifier:(id)a7;
- (NSData)contentIdentifier;
- (NSData)initializationData;
- (NSData)keyIDFromInitializationData;
- (NSDictionary)options;
- (id)identifier;
- (void)dealloc;
- (void)setContentIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInitializationData:(id)a3;
- (void)setKeyIDFromInitializationData:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation AVContentKeyRequestParams

- (AVContentKeyRequestParams)initWithInitializationData:(id)a3 contentIdentifier:(id)a4 keyIDFromInitializationData:(id)a5 options:(id)a6 identifier:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)AVContentKeyRequestParams;
  v12 = [(AVContentKeyRequestParams *)&v14 init];
  if (v12)
  {
    v12->_initializationData = (NSData *)[a3 copy];
    v12->_contentIdentifier = (NSData *)[a4 copy];
    v12->_keyIDFromInitializationData = (NSData *)[a5 copy];
    v12->_options = (NSDictionary *)[a6 copy];
    v12->_identifier = (id)[a7 copy];
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVContentKeyRequestParams;
  [(AVContentKeyRequestParams *)&v3 dealloc];
}

- (NSData)initializationData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInitializationData:(id)a3
{
}

- (NSData)contentIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContentIdentifier:(id)a3
{
}

- (NSData)keyIDFromInitializationData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKeyIDFromInitializationData:(id)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOptions:(id)a3
{
}

- (id)identifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setIdentifier:(id)a3
{
}

@end