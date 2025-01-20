@interface DTAssetRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestWithIdentifier:(id)a3 path:(id)a4;
- (DTAssetRequest)initWithCoder:(id)a3;
- (DTAssetRequest)initWithIdentifier:(id)a3 path:(id)a4;
- (DTXMessage)message;
- (NSString)assetPath;
- (NSString)identifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DTAssetRequest

- (DTAssetRequest)initWithIdentifier:(id)a3 path:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"DTAssetRequest.m", 14, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"DTAssetRequest.m", 15, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)DTAssetRequest;
  v10 = [(DTAssetRequest *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    assetPath = v10->_assetPath;
    v10->_assetPath = (NSString *)v13;
  }
  return v10;
}

+ (id)requestWithIdentifier:(id)a3 path:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v7 path:v6];

  return v8;
}

- (DTXMessage)message
{
  return (DTXMessage *)[MEMORY[0x263F38CA0] messageWithObject:self];
}

- (DTAssetRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetPath"];

  id v7 = [(DTAssetRequest *)self initWithIdentifier:v5 path:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DTAssetRequest *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(DTAssetRequest *)self assetPath];
  [v4 encodeObject:v6 forKey:@"assetPath"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetPath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end