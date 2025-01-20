@interface AKAppleIDPasskeySetupContext
+ (BOOL)supportsSecureCoding;
- (AKAppleIDPasskeySetupContext)initWithAltDSID:(id)a3;
- (AKAppleIDPasskeySetupContext)initWithCoder:(id)a3;
- (NSDictionary)appProvidedData;
- (NSString)altDSID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAppProvidedData:(id)a3;
@end

@implementation AKAppleIDPasskeySetupContext

- (AKAppleIDPasskeySetupContext)initWithAltDSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAppleIDPasskeySetupContext;
  v6 = [(AKAppleIDPasskeySetupContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_altDSID, a3);
  }

  return v7;
}

- (AKAppleIDPasskeySetupContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AKAppleIDPasskeySetupContext;
  id v5 = [(AKAppleIDPasskeySetupContext *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_appProvidedData"];
    appProvidedData = v5->_appProvidedData;
    v5->_appProvidedData = (NSDictionary *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  altDSID = self->_altDSID;
  id v5 = a3;
  [v5 encodeObject:altDSID forKey:@"_altDSID"];
  [v5 encodeObject:self->_appProvidedData forKey:@"_appProvidedData"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_altDSID copy];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSDictionary *)self->_appProvidedData copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p {\n\taltDSID: %@, \n\tappProvidedData: %@, \n}>", v5, self, self->_altDSID, self->_appProvidedData];

  return v6;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSDictionary)appProvidedData
{
  return self->_appProvidedData;
}

- (void)setAppProvidedData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appProvidedData, 0);

  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end