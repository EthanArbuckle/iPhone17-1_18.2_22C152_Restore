@interface NEVPNIKEv2PPKConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isMandatory;
- (NEVPNIKEv2PPKConfiguration)initWithCoder:(id)a3;
- (NEVPNIKEv2PPKConfiguration)initWithIdentifier:(id)a3 keychainReference:(id)a4;
- (NSData)keychainReference;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setIsMandatory:(BOOL)a3;
@end

@implementation NEVPNIKEv2PPKConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainItem, 0);
  objc_storeStrong((id *)&self->_keychainReference, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setIsMandatory:(BOOL)a3
{
  self->_isMandatory = a3;
}

- (BOOL)isMandatory
{
  return self->_isMandatory;
}

- (NSData)keychainReference
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v8 = [(NEVPNIKEv2PPKConfiguration *)self identifier];
  [v7 appendPrettyObject:v8 withName:@"identifier" andIndent:v5 options:a4 | 9];

  if (self) {
    id Property = objc_getProperty(self, v9, 32, 1);
  }
  else {
    id Property = 0;
  }
  [v7 appendPrettyObject:Property withName:@"keychainItem" andIndent:v5 options:a4 | 9];
  v11 = [(NEVPNIKEv2PPKConfiguration *)self keychainReference];
  [v7 appendPrettyObject:v11 withName:@"keychainReference" andIndent:v5 options:a4 | 9];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNIKEv2PPKConfiguration isMandatory](self, "isMandatory"), @"isMandatory", v5, a4 | 8);

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEVPNIKEv2PPKConfiguration *)self identifier];
  uint64_t v6 = [v5 length];
  BOOL v7 = v6 != 0;

  if (!v6) {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Use of a PPK requires an identifier", v4);
  }
  v8 = [(NEVPNIKEv2PPKConfiguration *)self keychainReference];
  if (v8)
  {
  }
  else if (!self || !objc_getProperty(self, v9, 32, 1))
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Use of a PPK requires a key", v4);
    BOOL v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[NEVPNIKEv2PPKConfiguration allocWithZone:a3] init];
  if (v5)
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 32, 1);
    }
    else {
      id Property = 0;
    }
    uint64_t v7 = [Property copy];
    keychainItem = v5->_keychainItem;
    v5->_keychainItem = (NEKeychainItem *)v7;

    v9 = [(NEVPNIKEv2PPKConfiguration *)self identifier];
    uint64_t v10 = [v9 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    v12 = [(NEVPNIKEv2PPKConfiguration *)self keychainReference];
    uint64_t v13 = [v12 copy];
    keychainReference = v5->_keychainReference;
    v5->_keychainReference = (NSData *)v13;

    v5->_isMandatory = [(NEVPNIKEv2PPKConfiguration *)self isMandatory];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 32, 1);
  }
  else {
    id Property = 0;
  }
  [v8 encodeObject:Property forKey:@"PPKKeychainItem"];
  uint64_t v6 = [(NEVPNIKEv2PPKConfiguration *)self identifier];
  [v8 encodeObject:v6 forKey:@"PPKIdentifier"];

  uint64_t v7 = [(NEVPNIKEv2PPKConfiguration *)self keychainReference];
  [v8 encodeObject:v7 forKey:@"PPKReference"];

  objc_msgSend(v8, "encodeBool:forKey:", -[NEVPNIKEv2PPKConfiguration isMandatory](self, "isMandatory"), @"PPKMandatory");
}

- (NEVPNIKEv2PPKConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NEVPNIKEv2PPKConfiguration;
  uint64_t v5 = [(NEVPNIKEv2PPKConfiguration *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PPKKeychainItem"];
    keychainItem = v5->_keychainItem;
    v5->_keychainItem = (NEKeychainItem *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PPKIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PPKReference"];
    keychainReference = v5->_keychainReference;
    v5->_keychainReference = (NSData *)v10;

    v5->_isMandatory = [v4 decodeBoolForKey:@"PPKMandatory"];
    v12 = v5;
  }
  else
  {
    v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, "[super init] failed", v15, 2u);
    }
  }
  return v5;
}

- (NEVPNIKEv2PPKConfiguration)initWithIdentifier:(id)a3 keychainReference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NEVPNIKEv2PPKConfiguration;
  uint64_t v8 = [(NEVPNIKEv2PPKConfiguration *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    keychainReference = v8->_keychainReference;
    v8->_keychainReference = (NSData *)v11;

    v8->_isMandatory = 1;
    uint64_t v13 = v8;
  }
  else
  {
    v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)objc_super v16 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_FAULT, "[super init] failed", v16, 2u);
    }
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end