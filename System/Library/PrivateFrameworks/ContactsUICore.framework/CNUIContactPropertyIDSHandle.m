@interface CNUIContactPropertyIDSHandle
+ (id)idsIDForEmail:(id)a3;
+ (id)idsIDForPhoneNumber:(id)a3;
+ (id)supportedContactPropertyKeys;
- (BOOL)isEqual:(id)a3;
- (CNContactProperty)contactProperty;
- (CNUIContactPropertyIDSHandle)initWithContactProperty:(id)a3;
- (NSString)description;
- (NSString)idsID;
- (unint64_t)hash;
@end

@implementation CNUIContactPropertyIDSHandle

+ (id)supportedContactPropertyKeys
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EFE070];
  v5[0] = *MEMORY[0x263EFDF80];
  v5[1] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  return v3;
}

+ (id)idsIDForPhoneNumber:(id)a3
{
  v3 = (uint64_t (*)(void *, void *, uint64_t))softLinkIDSCopyIDForPhoneNumberWithOptions;
  id v4 = a3;
  v5 = [v4 digits];
  v6 = [v4 countryCode];

  v7 = (void *)v3(v5, v6, 1);
  return v7;
}

+ (id)idsIDForEmail:(id)a3
{
  v3 = (void *)softLinkIDSCopyIDForEmailAddress(a3);
  return v3;
}

- (CNUIContactPropertyIDSHandle)initWithContactProperty:(id)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(id)objc_opt_class() supportedContactPropertyKeys];
  v6 = [v4 key];
  char v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    v20 = (void *)MEMORY[0x263EFF940];
    uint64_t v21 = *MEMORY[0x263EFF498];
    v26 = @"unsupportedKey";
    v22 = [v4 key];
    v27[0] = v22;
    v23 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v24 = [v20 exceptionWithName:v21 reason:@"Unsupported key passed to CNUIContactPropertyIDSHandle" userInfo:v23];

    objc_exception_throw(v24);
  }
  v25.receiver = self;
  v25.super_class = (Class)CNUIContactPropertyIDSHandle;
  v8 = [(CNUIContactPropertyIDSHandle *)&v25 init];
  if (v8)
  {
    uint64_t v9 = [v4 copy];
    contactProperty = v8->_contactProperty;
    v8->_contactProperty = (CNContactProperty *)v9;

    v11 = [v4 key];
    int v12 = [v11 isEqual:*MEMORY[0x263EFE070]];

    v13 = objc_opt_class();
    v14 = [v4 value];
    if (v12) {
      [v13 idsIDForPhoneNumber:v14];
    }
    else {
    v15 = [v13 idsIDForEmail:v14];
    }

    uint64_t v16 = [v15 copy];
    idsID = v8->_idsID;
    v8->_idsID = (NSString *)v16;

    v18 = v8;
  }

  return v8;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  id v4 = [(CNUIContactPropertyIDSHandle *)self contactProperty];
  id v5 = (id)[v3 appendName:@"contactProperty" object:v4];

  v6 = [(CNUIContactPropertyIDSHandle *)self idsID];
  id v7 = (id)[v3 appendName:@"idsID" object:v6];

  v8 = [v3 build];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F335D0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__CNUIContactPropertyIDSHandle_isEqual___block_invoke;
  v8[3] = &unk_2640172E0;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToOther:withBlocks:", self, v6, v8, 0);

  return (char)self;
}

uint64_t __40__CNUIContactPropertyIDSHandle_isEqual___block_invoke(uint64_t a1)
{
  v3 = [*(id *)(a1 + 32) idsID];
  if (!v3)
  {
    v1 = [*(id *)(a1 + 40) idsID];
    if (!v1)
    {
      uint64_t v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v4 = [*(id *)(a1 + 32) idsID];
  id v5 = [*(id *)(a1 + 40) idsID];
  uint64_t v6 = [v4 isEqual:v5];

  if (!v3) {
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __36__CNUIContactPropertyIDSHandle_hash__block_invoke;
  v3[3] = &unk_264017308;
  v3[4] = self;
  return objc_msgSend(MEMORY[0x263F335E8], "hashWithBlocks:", v3, 0);
}

uint64_t __36__CNUIContactPropertyIDSHandle_hash__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) idsID];
  uint64_t v2 = [v1 hash];

  return v2;
}

- (CNContactProperty)contactProperty
{
  return self->_contactProperty;
}

- (NSString)idsID
{
  return self->_idsID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsID, 0);
  objc_storeStrong((id *)&self->_contactProperty, 0);
}

@end