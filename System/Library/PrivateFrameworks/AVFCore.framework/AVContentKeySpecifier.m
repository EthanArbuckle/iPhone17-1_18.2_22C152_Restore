@interface AVContentKeySpecifier
+ (AVContentKeySpecifier)contentKeySpecifierForKeySystem:(AVContentKeySystem)keySystem identifier:(id)contentKeyIdentifier options:(NSDictionary *)options;
- (AVContentKeySpecifier)initForKeySystem:(AVContentKeySystem)keySystem identifier:(id)contentKeyIdentifier options:(NSDictionary *)options;
- (AVContentKeySystem)keySystem;
- (NSData)initializationData;
- (NSDictionary)options;
- (id)identifier;
- (id)initForKeySystem:(id)a3 identifier:(id)a4 initializationData:(id)a5 options:(id)a6;
- (id)initForKeySystem:(id)a3 initializationData:(id)a4;
- (void)dealloc;
@end

@implementation AVContentKeySpecifier

- (id)initForKeySystem:(id)a3 identifier:(id)a4 initializationData:(id)a5 options:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)AVContentKeySpecifier;
  v10 = [(AVContentKeySpecifier *)&v12 init];
  if (v10)
  {
    v10->_keySystem = (NSString *)[a3 copy];
    v10->_identifier = (id)[a4 copy];
    v10->_options = (NSDictionary *)[a6 copy];
    v10->_initializationData = (NSData *)[a5 copy];
  }
  return v10;
}

- (AVContentKeySpecifier)initForKeySystem:(AVContentKeySystem)keySystem identifier:(id)contentKeyIdentifier options:(NSDictionary *)options
{
  return (AVContentKeySpecifier *)[(AVContentKeySpecifier *)self initForKeySystem:keySystem identifier:contentKeyIdentifier initializationData:0 options:options];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVContentKeySpecifier;
  [(AVContentKeySpecifier *)&v3 dealloc];
}

+ (AVContentKeySpecifier)contentKeySpecifierForKeySystem:(AVContentKeySystem)keySystem identifier:(id)contentKeyIdentifier options:(NSDictionary *)options
{
  id v5 = [[AVContentKeySpecifier alloc] initForKeySystem:keySystem identifier:contentKeyIdentifier initializationData:0 options:options];
  return (AVContentKeySpecifier *)v5;
}

- (AVContentKeySystem)keySystem
{
  return self->_keySystem;
}

- (id)identifier
{
  return self->_identifier;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSData)initializationData
{
  v2 = (void *)[(NSData *)self->_initializationData copy];
  return (NSData *)v2;
}

- (id)initForKeySystem:(id)a3 initializationData:(id)a4
{
  return [(AVContentKeySpecifier *)self initForKeySystem:a3 identifier:0 initializationData:a4 options:0];
}

@end