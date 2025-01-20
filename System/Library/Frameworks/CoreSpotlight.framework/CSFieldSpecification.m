@interface CSFieldSpecification
- (CSFieldSpecification)initWithCoder:(id)a3;
- (CSFieldSpecification)initWithDisplayName:(id)a3 attribute:(id)a4 status:(id)a5 token:(id)a6;
- (NSString)attribute;
- (NSString)displayName;
- (NSString)status;
- (NSString)token;
- (id)dictionaryFormat;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSFieldSpecification

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)attribute
{
  return self->_attribute;
}

- (NSString)status
{
  return self->_status;
}

- (NSString)token
{
  return self->_token;
}

- (id)dictionaryFormat
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  long long v2 = *(_OWORD *)&self->_attribute;
  v5[0] = @"ATTRIBUTE";
  v5[1] = @"STATUS";
  long long v6 = v2;
  v5[2] = @"TOKEN";
  token = self->_token;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:v5 count:3];

  return v3;
}

- (CSFieldSpecification)initWithDisplayName:(id)a3 attribute:(id)a4 status:(id)a5 token:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CSFieldSpecification;
  v15 = [(CSFieldSpecification *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_displayName, a3);
    objc_storeStrong((id *)&v16->_attribute, a4);
    objc_storeStrong((id *)&v16->_status, a5);
    objc_storeStrong((id *)&v16->_token, a6);
  }

  return v16;
}

- (CSFieldSpecification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSFieldSpecification;
  v5 = [(CSFieldSpecification *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attribute"];
    attribute = v5->_attribute;
    v5->_attribute = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    status = v5->_status;
    v5->_status = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
    token = v5->_token;
    v5->_token = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  displayName = self->_displayName;
  id v5 = a3;
  [v5 encodeObject:displayName forKey:@"displayName"];
  [v5 encodeObject:self->_attribute forKey:@"attribute"];
  [v5 encodeObject:self->_status forKey:@"status"];
  [v5 encodeObject:self->_token forKey:@"token"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_attribute, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end