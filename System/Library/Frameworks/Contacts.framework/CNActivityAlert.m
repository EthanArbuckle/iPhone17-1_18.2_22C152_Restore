@interface CNActivityAlert
+ (BOOL)supportsSecureCoding;
- (BOOL)ignoreMute;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid:(id *)a3;
- (CNActivityAlert)initWithCoder:(id)a3;
- (CNActivityAlert)initWithSound:(id)a3 vibration:(id)a4 ignoreMute:(BOOL)a5;
- (CNActivityAlert)initWithSound:(id)a3 vibration:(id)a4 ignoreMute:(BOOL)a5 userInfo:(id)a6;
- (NSDictionary)userInfo;
- (NSString)description;
- (NSString)sound;
- (NSString)vibration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIgnoreMute:(BOOL)a3;
- (void)setSound:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setVibration:(id)a3;
@end

@implementation CNActivityAlert

- (CNActivityAlert)initWithSound:(id)a3 vibration:(id)a4 ignoreMute:(BOOL)a5
{
  return [(CNActivityAlert *)self initWithSound:a3 vibration:a4 ignoreMute:a5 userInfo:0];
}

- (CNActivityAlert)initWithSound:(id)a3 vibration:(id)a4 ignoreMute:(BOOL)a5 userInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CNActivityAlert;
  v13 = [(CNActivityAlert *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    sound = v13->_sound;
    v13->_sound = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    vibration = v13->_vibration;
    v13->_vibration = (NSString *)v16;

    v13->_ignoreMute = a5;
    uint64_t v18 = [v12 copy];
    userInfo = v13->_userInfo;
    v13->_userInfo = (NSDictionary *)v18;

    v20 = v13;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CNActivityAlert alloc];
  sound = self->_sound;
  vibration = self->_vibration;
  BOOL ignoreMute = self->_ignoreMute;
  userInfo = self->_userInfo;

  return [(CNActivityAlert *)v4 initWithSound:sound vibration:vibration ignoreMute:ignoreMute userInfo:userInfo];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CNMutableActivityAlert);
  v5 = [(CNActivityAlert *)self sound];
  [(CNActivityAlert *)v4 setSound:v5];

  v6 = [(CNActivityAlert *)self vibration];
  [(CNActivityAlert *)v4 setVibration:v6];

  [(CNActivityAlert *)v4 setIgnoreMute:[(CNActivityAlert *)self ignoreMute]];
  v7 = [(CNActivityAlert *)self userInfo];
  [(CNActivityAlert *)v4 setUserInfo:v7];

  return v4;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  sound = self->_sound;
  vibration = self->_vibration;
  v6 = [NSNumber numberWithBool:self->_ignoreMute];
  id v7 = (id)objc_msgSend(v3, "appendNamesAndObjects:", @"sound", sound, @"vibration", vibration, @"ignoreMute", v6, 0);

  if (self->_userInfo) {
    id v8 = (id)objc_msgSend(v3, "appendName:object:", @"userInfo");
  }
  v9 = [v3 build];

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v6 = objc_opt_class();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __27__CNActivityAlert_isEqual___block_invoke;
  v24[3] = &unk_1E56B3E18;
  v24[4] = self;
  id v25 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __27__CNActivityAlert_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E56B3E18;
  aBlock[4] = self;
  id v7 = v25;
  id v23 = v7;
  id v8 = _Block_copy(aBlock);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __27__CNActivityAlert_isEqual___block_invoke_3;
  v20[3] = &unk_1E56B3E18;
  v20[4] = self;
  id v9 = v7;
  id v21 = v9;
  id v10 = _Block_copy(v20);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __27__CNActivityAlert_isEqual___block_invoke_4;
  v17 = &unk_1E56B3E18;
  uint64_t v18 = self;
  id v19 = v9;
  id v11 = v9;
  id v12 = _Block_copy(&v14);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v11, v6, self, v24, v8, v10, v12, 0, v14, v15, v16, v17, v18);

  return (char)self;
}

uint64_t __27__CNActivityAlert_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) vibration];
  id v4 = [*(id *)(a1 + 40) vibration];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __27__CNActivityAlert_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) sound];
  id v4 = [*(id *)(a1 + 40) sound];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __27__CNActivityAlert_isEqual___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) ignoreMute];
  uint64_t v4 = [*(id *)(a1 + 40) ignoreMute];

  return [v2 isBool:v3 equalToOther:v4];
}

uint64_t __27__CNActivityAlert_isEqual___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) userInfo];
  uint64_t v4 = [*(id *)(a1 + 40) userInfo];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = (void *)MEMORY[0x1E4F5A418];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __23__CNActivityAlert_hash__block_invoke;
  v12[3] = &unk_1E56B3E40;
  v12[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __23__CNActivityAlert_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  aBlock[4] = self;
  uint64_t v4 = _Block_copy(aBlock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __23__CNActivityAlert_hash__block_invoke_3;
  v10[3] = &unk_1E56B3E40;
  v10[4] = self;
  uint64_t v5 = _Block_copy(v10);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __23__CNActivityAlert_hash__block_invoke_4;
  v9[3] = &unk_1E56B3E40;
  v9[4] = self;
  uint64_t v6 = _Block_copy(v9);
  unint64_t v7 = objc_msgSend(v3, "hashWithBlocks:", v12, v4, v5, v6, 0);

  return v7;
}

uint64_t __23__CNActivityAlert_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) sound];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __23__CNActivityAlert_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) vibration];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __23__CNActivityAlert_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) ignoreMute];

  return [v1 BOOLHash:v2];
}

uint64_t __23__CNActivityAlert_hash__block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNActivityAlert)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNActivityAlert;
  uint64_t v5 = [(CNActivityAlert *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sound"];
    uint64_t v7 = [v6 copy];
    sound = v5->_sound;
    v5->_sound = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_vibration"];
    uint64_t v10 = [v9 copy];
    vibration = v5->_vibration;
    v5->_vibration = (NSString *)v10;

    v5->_BOOL ignoreMute = [v4 decodeBoolForKey:@"_ignoreMute"];
    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"_userInfo"];
    uint64_t v16 = [v15 copy];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v16;

    uint64_t v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sound = self->_sound;
  id v5 = a3;
  [v5 encodeObject:sound forKey:@"_sound"];
  [v5 encodeObject:self->_vibration forKey:@"_vibration"];
  [v5 encodeBool:self->_ignoreMute forKey:@"_ignoreMute"];
  [v5 encodeObject:self->_userInfo forKey:@"_userInfo"];
}

- (BOOL)isValid:(id *)a3
{
  if (isValid__cn_once_token_0 != -1) {
    dispatch_once(&isValid__cn_once_token_0, &__block_literal_global_34);
  }
  id v5 = (id)isValid__cn_once_object_0;
  if (isValid__cn_once_token_1 != -1) {
    dispatch_once(&isValid__cn_once_token_1, &__block_literal_global_35_0);
  }
  uint64_t v6 = isValid__cn_once_token_2;
  id v7 = (id)isValid__cn_once_object_1;
  if (v6 != -1) {
    dispatch_once(&isValid__cn_once_token_2, &__block_literal_global_38);
  }
  BOOL v8 = +[CN areValidKeyPaths:v5 forObject:self expectedClasses:v7 allowNil:isValid__cn_once_object_2 error:a3];

  return v8;
}

uint64_t __27__CNActivityAlert_isValid___block_invoke()
{
  isValid__cn_once_object_0 = [&unk_1EE0896B0 copy];

  return MEMORY[0x1F41817F8]();
}

void __27__CNActivityAlert_isValid___block_invoke_2()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)isValid__cn_once_object_1;
  isValid__cn_once_object_1 = v1;
}

uint64_t __27__CNActivityAlert_isValid___block_invoke_3()
{
  isValid__cn_once_object_2 = [&unk_1EE0896C8 copy];

  return MEMORY[0x1F41817F8]();
}

- (NSString)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
}

- (NSString)vibration
{
  return self->_vibration;
}

- (void)setVibration:(id)a3
{
}

- (BOOL)ignoreMute
{
  return self->_ignoreMute;
}

- (void)setIgnoreMute:(BOOL)a3
{
  self->_BOOL ignoreMute = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_vibration, 0);

  objc_storeStrong((id *)&self->_sound, 0);
}

@end