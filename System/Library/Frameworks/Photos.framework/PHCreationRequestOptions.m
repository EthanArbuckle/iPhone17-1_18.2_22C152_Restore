@interface PHCreationRequestOptions
+ (BOOL)supportsSecureCoding;
- (PHCloudIdentifier)reservedCloudIdentifier;
- (PHCreationRequestOptions)initWithCoder:(id)a3;
- (PHCreationRequestOptions)initWithXPCDict:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeToXPCDict:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setReservedCloudIdentifier:(id)a3;
@end

@implementation PHCreationRequestOptions

- (void).cxx_destruct
{
}

- (void)setReservedCloudIdentifier:(id)a3
{
}

- (PHCloudIdentifier)reservedCloudIdentifier
{
  return (PHCloudIdentifier *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)PHCreationRequestOptions;
  v3 = [(PHCreationRequestOptions *)&v9 description];
  v4 = [(PHCreationRequestOptions *)self reservedCloudIdentifier];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 stringValue];
    uint64_t v7 = [v3 stringByAppendingFormat:@" rci=%@", v6];

    v3 = (void *)v7;
  }

  return v3;
}

- (PHCreationRequestOptions)initWithXPCDict:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHCreationRequestOptions;
  v5 = [(PHCreationRequestOptions *)&v11 init];
  if (v5)
  {
    v6 = xpc_dictionary_get_value(v4, "changeRequestOptions");
    if (v6)
    {
      uint64_t v7 = PLStringFromXPCDictionary();
      if (v7)
      {
        v8 = [[PHCloudIdentifier alloc] initWithArchivalStringValue:v7];
        reservedCloudIdentifier = v5->_reservedCloudIdentifier;
        v5->_reservedCloudIdentifier = v8;
      }
    }
  }
  return v5;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4 = a3;
  id v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v4, "changeRequestOptions", v7);

  v5 = [(PHCreationRequestOptions *)self reservedCloudIdentifier];
  v6 = [v5 archivalStringValue];

  PLXPCDictionarySetString();
}

- (PHCreationRequestOptions)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PHCreationRequestOptions;
  id v3 = a3;
  id v4 = [(PHCreationRequestOptions *)&v7 init];
  v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"reservedCloudIdentifier", v7.receiver, v7.super_class);

  [(PHCreationRequestOptions *)v4 setReservedCloudIdentifier:v5];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PHCreationRequestOptions *)self reservedCloudIdentifier];
  [v4 encodeObject:v5 forKey:@"reservedCloudIdentifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  id v5 = [(PHCreationRequestOptions *)self reservedCloudIdentifier];
  [v4 setReservedCloudIdentifier:v5];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end