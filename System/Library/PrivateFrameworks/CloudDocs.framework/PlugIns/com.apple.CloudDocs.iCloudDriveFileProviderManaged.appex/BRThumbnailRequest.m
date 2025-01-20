@interface BRThumbnailRequest
- (BRThumbnailRequest)initWithIdentifier:(id)a3 version:(id)a4;
- (NSFileProviderItemVersion)version;
- (NSString)identifier;
- (id)description;
@end

@implementation BRThumbnailRequest

- (BRThumbnailRequest)initWithIdentifier:(id)a3 version:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRThumbnailRequest;
  v9 = [(BRThumbnailRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_version, a4);
  }

  return v10;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %@>", self->_identifier, self->_version];
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSFileProviderItemVersion)version
{
  return (NSFileProviderItemVersion *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end