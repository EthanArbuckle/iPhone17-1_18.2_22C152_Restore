@interface CNUIPropertyGroupItemIDSHandle
+ (BOOL)isSupportedGroupItem:(id)a3;
+ (BOOL)supportsPropertyGroupItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CNContactProperty)contactProperty;
- (CNUIContactPropertyIDSHandle)contactPropertyHandle;
- (CNUIPropertyGroupItemIDSHandle)initWithPropertyGroupItem:(id)a3;
- (NSString)_cnui_IDSIDRepresentation;
- (NSString)description;
- (unint64_t)hash;
@end

@implementation CNUIPropertyGroupItemIDSHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactPropertyHandle, 0);

  objc_storeStrong((id *)&self->_contactProperty, 0);
}

- (CNUIContactPropertyIDSHandle)contactPropertyHandle
{
  return self->_contactPropertyHandle;
}

- (CNContactProperty)contactProperty
{
  return self->_contactProperty;
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__CNUIPropertyGroupItemIDSHandle_hash__block_invoke;
  v3[3] = &unk_1E549ADA8;
  v3[4] = self;
  return objc_msgSend(MEMORY[0x1E4F5A418], "hashWithBlocks:", v3, 0);
}

uint64_t __38__CNUIPropertyGroupItemIDSHandle_hash__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) contactPropertyHandle];
  uint64_t v2 = [v1 hash];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F5A3E0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__CNUIPropertyGroupItemIDSHandle_isEqual___block_invoke;
  v8[3] = &unk_1E549BCB0;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToOther:withBlocks:", self, v6, v8, 0);

  return (char)self;
}

uint64_t __42__CNUIPropertyGroupItemIDSHandle_isEqual___block_invoke(uint64_t a1)
{
  v3 = [*(id *)(a1 + 32) contactPropertyHandle];
  if (!v3)
  {
    v1 = [*(id *)(a1 + 40) contactPropertyHandle];
    if (!v1)
    {
      uint64_t v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v4 = [*(id *)(a1 + 32) contactPropertyHandle];
  v5 = [*(id *)(a1 + 40) contactPropertyHandle];
  uint64_t v6 = [v4 isEqual:v5];

  if (!v3) {
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = [(CNUIPropertyGroupItemIDSHandle *)self contactPropertyHandle];
  id v5 = (id)[v3 appendName:@"handle" object:v4];

  uint64_t v6 = [v3 build];

  return (NSString *)v6;
}

- (NSString)_cnui_IDSIDRepresentation
{
  uint64_t v2 = [(CNUIPropertyGroupItemIDSHandle *)self contactPropertyHandle];
  v3 = objc_msgSend(v2, "_cnui_IDSIDRepresentation");

  return (NSString *)v3;
}

- (CNUIPropertyGroupItemIDSHandle)initWithPropertyGroupItem:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F5A630] supportedContactPropertyKeys];
  uint64_t v6 = [v4 contactProperty];
  v7 = [v6 key];
  char v8 = [v5 containsObject:v7];

  if ((v8 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    v23 = @"groupItem";
    v24[0] = v4;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v21 = [v18 exceptionWithName:v19 reason:@"Unsupported property group item" userInfo:v20];

    objc_exception_throw(v21);
  }
  v22.receiver = self;
  v22.super_class = (Class)CNUIPropertyGroupItemIDSHandle;
  id v9 = [(CNUIPropertyGroupItemIDSHandle *)&v22 init];
  if (v9)
  {
    uint64_t v10 = [v4 contactProperty];
    contactProperty = v9->_contactProperty;
    v9->_contactProperty = (CNContactProperty *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4F5A630]);
    v13 = [v4 contactProperty];
    uint64_t v14 = [v12 initWithContactProperty:v13];
    contactPropertyHandle = v9->_contactPropertyHandle;
    v9->_contactPropertyHandle = (CNUIContactPropertyIDSHandle *)v14;

    v16 = v9;
  }

  return v9;
}

+ (BOOL)supportsPropertyGroupItem:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F5A630];
  id v4 = a3;
  id v5 = [v3 supportedContactPropertyKeys];
  uint64_t v6 = [v4 contactProperty];

  v7 = [v6 key];
  char v8 = [v5 containsObject:v7];

  return v8;
}

+ (BOOL)isSupportedGroupItem:(id)a3
{
  return CNUIPropertyGroupItemIDSHandleSupported_block_invoke_2((uint64_t)a1, a3);
}

@end