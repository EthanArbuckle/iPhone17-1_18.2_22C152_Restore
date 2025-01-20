@interface CRStrongComponent
+ (BOOL)supportsSecureCoding;
- (CRStrongComponent)init;
- (CRStrongComponent)initWithCoder:(id)a3;
- (CRStrongComponent)initWithComponentType:(id)a3 identifier:(id)a4 fwVersion:(id)a5;
- (NSString)componentType;
- (NSString)fwVersion;
- (NSString)identifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setComponentType:(id)a3;
- (void)setFwVersion:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation CRStrongComponent

- (CRStrongComponent)initWithComponentType:(id)a3 identifier:(id)a4 fwVersion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRStrongComponent;
  v12 = [(CRStrongComponent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->componentType, a3);
    objc_storeStrong((id *)&v13->identifier, a4);
    objc_storeStrong((id *)&v13->fwVersion, a5);
  }

  return v13;
}

- (CRStrongComponent)init
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  componentType = self->componentType;
  id v8 = a3;
  objc_msgSend_encodeObject_forKey_(v8, v5, (uint64_t)componentType, @"componentType");
  objc_msgSend_encodeObject_forKey_(v8, v6, (uint64_t)self->identifier, @"identifier");
  objc_msgSend_encodeObject_forKey_(v8, v7, (uint64_t)self->fwVersion, @"fwVersion");
}

- (CRStrongComponent)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v14 = objc_msgSend_setWithObjects_(v4, v12, v6, v13, v7, v8, v9, v10, v11, 0);
  v16 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v15, (uint64_t)v14, @"componentType");
  v18 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v17, (uint64_t)v14, @"identifier");
  v20 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v19, (uint64_t)v14, @"fwVersion");

  v21 = [CRStrongComponent alloc];
  v23 = (CRStrongComponent *)objc_msgSend_initWithComponentType_identifier_fwVersion_(v21, v22, (uint64_t)v16, (uint64_t)v18, v20);

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v5 = NSString;
  uint64_t v6 = objc_msgSend_componentType(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_identifier(self, v7, v8, v9);
  v14 = objc_msgSend_fwVersion(self, v11, v12, v13);
  v17 = objc_msgSend_stringWithFormat_(v5, v15, @"[CRStrongComponent: Type:%@: ID:%@: FW:%@:]", v16, v6, v10, v14);

  return v17;
}

- (NSString)componentType
{
  return self->componentType;
}

- (void)setComponentType:(id)a3
{
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)fwVersion
{
  return self->fwVersion;
}

- (void)setFwVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fwVersion, 0);
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong((id *)&self->componentType, 0);
}

@end