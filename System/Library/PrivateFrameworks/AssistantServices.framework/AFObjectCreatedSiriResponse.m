@interface AFObjectCreatedSiriResponse
+ (BOOL)supportsSecureCoding;
- (AFObjectCreatedSiriResponse)initWithCoder:(id)a3;
- (id)_initWithRequest:(id)a3 objectIdentifier:(id)a4;
- (id)_objectIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFObjectCreatedSiriResponse

- (void).cxx_destruct
{
}

- (AFObjectCreatedSiriResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AFObjectCreatedSiriResponse;
  v5 = [(AFSiriResponse *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ObjectCreatedResponseObjectIdentifier"];
    uint64_t v7 = [v6 copy];
    objectIdentifier = v5->_objectIdentifier;
    v5->_objectIdentifier = (NSURL *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFObjectCreatedSiriResponse;
  id v4 = a3;
  [(AFSiriResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_objectIdentifier, @"ObjectCreatedResponseObjectIdentifier", v5.receiver, v5.super_class);
}

- (id)_objectIdentifier
{
  return self->_objectIdentifier;
}

- (id)_initWithRequest:(id)a3 objectIdentifier:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AFObjectCreatedSiriResponse;
  uint64_t v7 = [(AFSiriResponse *)&v11 _initWithRequest:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    v9 = (void *)v7[2];
    v7[2] = v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end