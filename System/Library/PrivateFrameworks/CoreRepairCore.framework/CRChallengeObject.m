@interface CRChallengeObject
+ (BOOL)supportsSecureCoding;
- (CRChallengeObject)init;
- (CRChallengeObject)initWithCoder:(id)a3;
- (CRChallengeObject)initWithComponentType:(id)a3 challenge:(id)a4 keyIndex:(id)a5 properties:(id)a6;
- (NSData)nonce;
- (NSDictionary)properties;
- (NSNumber)keyIndex;
- (NSString)componentType;
- (void)encodeWithCoder:(id)a3;
- (void)setComponentType:(id)a3;
- (void)setKeyIndex:(id)a3;
- (void)setNonce:(id)a3;
- (void)setProperties:(id)a3;
@end

@implementation CRChallengeObject

- (CRChallengeObject)initWithComponentType:(id)a3 challenge:(id)a4 keyIndex:(id)a5 properties:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CRChallengeObject;
  v15 = [(CRChallengeObject *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->componentType, a3);
    objc_storeStrong((id *)&v16->nonce, a4);
    objc_storeStrong((id *)&v16->keyIndex, a5);
    objc_storeStrong((id *)&v16->properties, a6);
  }

  return v16;
}

- (CRChallengeObject)init
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  componentType = self->componentType;
  id v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)componentType, @"componentType");
  objc_msgSend_encodeObject_forKey_(v9, v6, (uint64_t)self->nonce, @"nonce");
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->keyIndex, @"keyIndex");
  objc_msgSend_encodeObject_forKey_(v9, v8, (uint64_t)self->properties, @"properties");
}

- (CRChallengeObject)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v14 = objc_msgSend_setWithObjects_(v4, v12, v6, v13, v7, v8, v9, v10, v11, 0);
  v16 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v15, (uint64_t)v14, @"componentType");
  objc_super v18 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v17, (uint64_t)v14, @"nonce");
  v20 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v19, (uint64_t)v14, @"keyIndex");
  v22 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v21, (uint64_t)v14, @"properties");

  v23 = [CRChallengeObject alloc];
  v25 = (CRChallengeObject *)objc_msgSend_initWithComponentType_challenge_keyIndex_properties_(v23, v24, (uint64_t)v16, (uint64_t)v18, v20, v22);

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)componentType
{
  return self->componentType;
}

- (void)setComponentType:(id)a3
{
}

- (NSData)nonce
{
  return self->nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSNumber)keyIndex
{
  return self->keyIndex;
}

- (void)setKeyIndex:(id)a3
{
}

- (NSDictionary)properties
{
  return self->properties;
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->properties, 0);
  objc_storeStrong((id *)&self->keyIndex, 0);
  objc_storeStrong((id *)&self->nonce, 0);
  objc_storeStrong((id *)&self->componentType, 0);
}

@end