@interface CNUuidIdentifierProvider
- (CNUuidIdentifierProvider)initWithSuffix:(id)a3;
- (id)makeIdentifier;
@end

@implementation CNUuidIdentifierProvider

- (id)makeIdentifier
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [v3 UUIDString];
  v5 = [v4 stringByAppendingString:self->_suffix];

  return v5;
}

- (CNUuidIdentifierProvider)initWithSuffix:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUuidIdentifierProvider;
  v5 = [(CNUuidIdentifierProvider *)&v10 init];
  if (v5)
  {
    if (v4)
    {
      v6 = [@":" stringByAppendingString:v4];
    }
    else
    {
      v6 = (NSString *)objc_alloc_init(NSString);
    }
    suffix = v5->_suffix;
    v5->_suffix = v6;

    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end