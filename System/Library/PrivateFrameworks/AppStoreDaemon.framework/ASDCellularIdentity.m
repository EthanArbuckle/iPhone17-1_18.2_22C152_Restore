@interface ASDCellularIdentity
+ (id)identityForSubscription:(id)a3 usingClient:(id)a4 error:(id *)a5;
+ (id)nullIdentity;
- (BOOL)isRoaming;
- (NSString)defaultsKey;
- (NSString)simIdentity;
- (id)copyWithRoaming:(BOOL)a3;
- (id)description;
- (id)initWithSIMIdentity:(char)a3 roaming:;
- (id)initWithSIMIdentity:(char)a3 roaming:(void *)a4 defaultsKey:;
@end

@implementation ASDCellularIdentity

+ (id)identityForSubscription:(id)a3 usingClient:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  id v10 = 0;
  if (!v7) {
    goto LABEL_11;
  }
  if (!v8) {
    goto LABEL_11;
  }
  id v19 = 0;
  v11 = (void *)[v8 copySIMIdentity:v7 error:&v19];
  id v10 = v19;
  if (!v11) {
    goto LABEL_11;
  }
  if ([v11 length])
  {
    id v18 = v10;
    v12 = [v9 getDataStatus:v7 error:&v18];
    id v13 = v18;

    char v14 = v12 ? [v12 inHomeCountry] ^ 1 : 0;
    v15 = -[ASDCellularIdentity initWithSIMIdentity:roaming:]([ASDCellularIdentity alloc], v11, v14);

    id v10 = v13;
  }
  else
  {
    v15 = [a1 nullIdentity];
  }

  if (!v15)
  {
LABEL_11:
    v16 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v10;
      _os_log_error_impl(&dword_19BF6A000, v16, OS_LOG_TYPE_ERROR, "[Cellular] Returning 'null' identity after error occurred: %{public}@", buf, 0xCu);
    }

    v15 = [a1 nullIdentity];
  }

  return v15;
}

- (id)initWithSIMIdentity:(char)a3 roaming:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v5 = a2;
  id v6 = [v5 dataUsingEncoding:4];
  self;
  id v7 = v6;
  CC_MD5((const void *)[v7 bytes], objc_msgSend(v7, "length"), md);
  id v8 = [MEMORY[0x1E4F28E78] stringWithCapacity:32];
  for (uint64_t i = 0; i != 16; ++i)
    objc_msgSend(v8, "appendFormat:", @"%02x", md[i]);
  id v10 = (void *)[v8 copy];

  id v11 = -[ASDCellularIdentity initWithSIMIdentity:roaming:defaultsKey:](a1, v5, a3, v10);
  id v12 = v11;

  return v12;
}

- (id)initWithSIMIdentity:(char)a3 roaming:(void *)a4 defaultsKey:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)ASDCellularIdentity;
    a1 = objc_msgSendSuper2(&v14, sel_init);
    if (a1)
    {
      uint64_t v9 = [v7 copy];
      id v10 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v9;

      *((unsigned char *)a1 + 8) = a3;
      uint64_t v11 = [v8 copy];
      id v12 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v11;
    }
  }

  return a1;
}

+ (id)nullIdentity
{
  id v2 = -[ASDCellularIdentity initWithSIMIdentity:roaming:](objc_alloc((Class)a1), @"00000000000000000000", 0);
  return v2;
}

- (id)copyWithRoaming:(BOOL)a3
{
  id v5 = [ASDCellularIdentity alloc];
  defaultsKey = self->_defaultsKey;
  simIdentity = self->_simIdentity;
  return -[ASDCellularIdentity initWithSIMIdentity:roaming:defaultsKey:](v5, simIdentity, a3, defaultsKey);
}

- (id)description
{
  if (os_variant_has_internal_content()) {
    objc_msgSend(NSString, "stringWithFormat:", @"<ASDCellularIdentity %p; sim = %@; key = %@ }",
  }
      self,
      self->_simIdentity,
      self->_defaultsKey);
  else {
    objc_msgSend(NSString, "stringWithFormat:", @"<ASDCellularIdentity %p; sim = <private>; key = %@ }",
  }
      self,
      self->_defaultsKey,
  v3 = v5);
  return v3;
}

- (NSString)defaultsKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isRoaming
{
  return self->_roaming;
}

- (NSString)simIdentity
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simIdentity, 0);
  objc_storeStrong((id *)&self->_defaultsKey, 0);
}

@end