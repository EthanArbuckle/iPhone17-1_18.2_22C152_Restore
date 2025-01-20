@interface PHLocalIdentifierMapping
- (NSError)error;
- (NSString)localIdentifier;
- (PHLocalIdentifierMapping)initWithLocalIdentifier:(id)a3 error:(id)a4;
@end

@implementation PHLocalIdentifierMapping

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

- (NSError)error
{
  return self->_error;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (PHLocalIdentifierMapping)initWithLocalIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHLocalIdentifierMapping;
  v8 = [(PHLocalIdentifierMapping *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    localIdentifier = v8->_localIdentifier;
    v8->_localIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v8;
}

@end