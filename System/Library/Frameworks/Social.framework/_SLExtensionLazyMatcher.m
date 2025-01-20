@interface _SLExtensionLazyMatcher
- (NSExtension)extension;
- (_SLExtensionLazyMatcher)initWithIdentifier:(id)a3;
@end

@implementation _SLExtensionLazyMatcher

- (_SLExtensionLazyMatcher)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SLExtensionLazyMatcher;
  v5 = [(_SLExtensionLazyMatcher *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (NSExtension)extension
{
  extension = self->_extension;
  if (!extension)
  {
    identifier = self->_identifier;
    id v10 = 0;
    uint64_t v6 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:identifier error:&v10];
    id v7 = v10;
    v8 = self->_extension;
    self->_extension = v6;

    _SLLog(v2, 7, @"_SLExtensionLazyMatcher for %@ got extension %@ error %{public}@");
    extension = self->_extension;
  }

  return extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end