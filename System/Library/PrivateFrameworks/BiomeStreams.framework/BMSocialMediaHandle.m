@interface BMSocialMediaHandle
- (BMSocialMediaHandle)initWithBundleId:(id)a3 handle:(id)a4;
- (BMSocialMediaHandle)initWithProto:(id)a3;
- (BMSocialMediaHandle)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleId;
- (NSString)handle;
- (id)encodeAsProto;
- (id)proto;
@end

@implementation BMSocialMediaHandle

- (BMSocialMediaHandle)initWithBundleId:(id)a3 handle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMSocialMediaHandle;
  v9 = [(BMSocialMediaHandle *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleId, a3);
    objc_storeStrong((id *)&v10->_handle, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    bundleId = self->_bundleId;
    id v7 = [v5 bundleId];
    if ([(NSString *)bundleId isEqualToString:v7])
    {
      handle = self->_handle;
      v9 = [v5 handle];
      BOOL v10 = [(NSString *)handle isEqualToString:v9];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)encodeAsProto
{
  v2 = [(BMSocialMediaHandle *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMSocialMediaHandle)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [v5 bundleId];
    id v7 = [v5 handle];

    self = [(BMSocialMediaHandle *)self initWithBundleId:v6 handle:v7];
    id v8 = self;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BMSocialMediaHandle)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBSocialMediaHandle alloc] initWithData:v4];

    self = [(BMSocialMediaHandle *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(BMSocialMediaHandle *)self bundleId];
  [v3 setBundleId:v4];

  id v5 = [(BMSocialMediaHandle *)self handle];
  [v3 setHandle:v5];

  return v3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end