@interface CRChallengeResponse
+ (BOOL)supportsSecureCoding;
- (CRChallengeResponse)init;
- (CRChallengeResponse)initWithCoder:(id)a3;
- (CRChallengeResponse)initWithComponentType:(id)a3 identifier:(id)a4 signedResponse:(id)a5 keyIndex:(id)a6 properties:(id)a7;
- (NSData)signedResponse;
- (NSDictionary)properties;
- (NSNumber)keyIndex;
- (NSString)componentType;
- (NSString)identifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setComponentType:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeyIndex:(id)a3;
- (void)setProperties:(id)a3;
- (void)setSignedResponse:(id)a3;
@end

@implementation CRChallengeResponse

- (CRChallengeResponse)initWithComponentType:(id)a3 identifier:(id)a4 signedResponse:(id)a5 keyIndex:(id)a6 properties:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CRChallengeResponse;
  v17 = [(CRChallengeResponse *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->componentType, a3);
    objc_storeStrong((id *)&v18->identifier, a4);
    objc_storeStrong((id *)&v18->signedResponse, a5);
    objc_storeStrong((id *)&v18->keyIndex, a6);
    objc_storeStrong((id *)&v18->properties, a7);
  }

  return v18;
}

- (CRChallengeResponse)init
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  componentType = self->componentType;
  id v10 = a3;
  objc_msgSend_encodeObject_forKey_(v10, v5, (uint64_t)componentType, @"componentType");
  objc_msgSend_encodeObject_forKey_(v10, v6, (uint64_t)self->identifier, @"identifier");
  objc_msgSend_encodeObject_forKey_(v10, v7, (uint64_t)self->signedResponse, @"signedResponse");
  objc_msgSend_encodeObject_forKey_(v10, v8, (uint64_t)self->keyIndex, @"keyIndex");
  objc_msgSend_encodeObject_forKey_(v10, v9, (uint64_t)self->properties, @"properties");
}

- (CRChallengeResponse)initWithCoder:(id)a3
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
  id v16 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v15, (uint64_t)v14, @"componentType");
  v18 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v17, (uint64_t)v14, @"identifier");
  id v20 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v19, (uint64_t)v14, @"signedResponse");
  v22 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v21, (uint64_t)v14, @"keyIndex");
  v24 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v23, (uint64_t)v14, @"properties");

  v25 = [CRChallengeResponse alloc];
  v27 = (CRChallengeResponse *)objc_msgSend_initWithComponentType_identifier_signedResponse_keyIndex_properties_(v25, v26, (uint64_t)v16, (uint64_t)v18, v20, v22, v24);

  return v27;
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
  id v14 = objc_msgSend_signedResponse(self, v11, v12, v13);
  v18 = objc_msgSend_keyIndex(self, v15, v16, v17);
  v22 = objc_msgSend_properties(self, v19, v20, v21);
  v25 = objc_msgSend_stringWithFormat_(v5, v23, @"[CRChallengeResponse: Type:%@: ID:%@: Response:%@: Index:%@: properties:%@:]", v24, v6, v10, v14, v18, v22);

  return v25;
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

- (NSData)signedResponse
{
  return self->signedResponse;
}

- (void)setSignedResponse:(id)a3
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
  objc_storeStrong((id *)&self->signedResponse, 0);
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong((id *)&self->componentType, 0);
}

@end