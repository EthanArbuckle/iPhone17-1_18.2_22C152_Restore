@interface PHCloudIdentifierMapping
- (NSError)error;
- (PHCloudIdentifier)cloudIdentifier;
- (PHCloudIdentifierMapping)initWithCloudIdentifier:(id)a3 error:(id)a4;
@end

@implementation PHCloudIdentifierMapping

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_cloudIdentifier, 0);
}

- (NSError)error
{
  return self->_error;
}

- (PHCloudIdentifier)cloudIdentifier
{
  return self->_cloudIdentifier;
}

- (PHCloudIdentifierMapping)initWithCloudIdentifier:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHCloudIdentifierMapping;
  v9 = [(PHCloudIdentifierMapping *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cloudIdentifier, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

@end