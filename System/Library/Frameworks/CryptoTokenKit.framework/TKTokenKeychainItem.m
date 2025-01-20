@interface TKTokenKeychainItem
+ (NSDictionary)operationMap;
+ (TKTokenKeychainItem)keychainItemWithInfo:(id)a3;
+ (id)accessControlForConstraints:(id)a3 tokenID:(id)a4 error:(id *)a5;
- (NSData)accessControl;
- (NSDictionary)constraints;
- (NSMutableDictionary)keychainAttributes;
- (NSString)label;
- (TKTokenID)tokenID;
- (TKTokenKeychainItem)initWithItemInfo:(id)a3;
- (TKTokenKeychainItem)initWithObjectID:(TKTokenObjectID)objectID;
- (TKTokenObjectID)objectID;
- (id)description;
- (void)setAccessControl:(id)a3;
- (void)setConstraints:(NSDictionary *)constraints;
- (void)setLabel:(NSString *)label;
- (void)setTokenID:(id)a3;
@end

@implementation TKTokenKeychainItem

- (TKTokenKeychainItem)initWithObjectID:(TKTokenObjectID)objectID
{
  TKTokenObjectID v5 = objectID;
  v9.receiver = self;
  v9.super_class = (Class)TKTokenKeychainItem;
  v6 = [(TKTokenKeychainItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_objectID, objectID);
  }

  return v7;
}

- (id)description
{
  v3 = [(TKTokenKeychainItem *)self objectID];
  v4 = [v3 description];

  if ((unint64_t)[v4 length] >= 0x21)
  {
    TKTokenObjectID v5 = [v4 substringToIndex:32];
    uint64_t v6 = [v5 stringByAppendingString:@"..."];

    v4 = (void *)v6;
  }
  v7 = [(TKTokenKeychainItem *)self label];

  v8 = NSString;
  objc_super v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  v11 = (void *)v10;
  if (v7)
  {
    v12 = [(TKTokenKeychainItem *)self label];
    v13 = [v8 stringWithFormat:@"<%@: %@ '%@'>", v11, v4, v12];
  }
  else
  {
    v13 = [v8 stringWithFormat:@"<%@: %@>", v10, v4];
  }

  return v13;
}

+ (NSDictionary)operationMap
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"ord";
  v4[1] = @"osgn";
  v5[0] = &unk_1F19F81E0;
  v5[1] = &unk_1F19F81F8;
  v4[2] = @"od";
  v4[3] = @"ock";
  v5[2] = &unk_1F19F8210;
  v5[3] = &unk_1F19F8228;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];

  return (NSDictionary *)v2;
}

+ (id)accessControlForConstraints:(id)a3 tokenID:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = (void *)SecAccessControlCreate();
  if (v9)
  {
    v20 = @"tkid";
    uint64_t v10 = [v8 stringRepresentation];
    v21[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];

    if (SecAccessControlSetProtection())
    {
      v12 = [MEMORY[0x1E4F1CA60] dictionary];
      v13 = [a1 operationMap];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __65__TKTokenKeychainItem_accessControlForConstraints_tokenID_error___block_invoke;
      v17[3] = &unk_1E63C8B28;
      id v18 = v7;
      id v19 = v12;
      id v14 = v12;
      [v13 enumerateKeysAndObjectsUsingBlock:v17];

      SecAccessControlSetConstraints();
      v15 = (void *)SecAccessControlCopyData();
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __65__TKTokenKeychainItem_accessControlForConstraints_tokenID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  TKTokenObjectID v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a3];
  uint64_t v6 = v5;
  if (v5 && ([v5 isEqual:MEMORY[0x1E4F1CC28]] & 1) == 0) {
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
  }
}

- (void)setAccessControl:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_accessControl, a3);
  if (v5)
  {
    v33 = 0;
    uint64_t v6 = (void *)SecAccessControlCreateFromData();
    if (v6)
    {
      id v7 = SecAccessControlGetProtection();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v7 objectForKeyedSubscript:@"tkid"];
        objc_super v9 = [(TKTokenKeychainItem *)self tokenID];
        uint64_t v10 = [v9 stringRepresentation];
        int v11 = [v8 isEqual:v10];

        if (v11)
        {
          v12 = SecAccessControlGetConstraints();
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v27 = v7;
            v28 = v6;
            v13 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
            long long v29 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            v26 = v12;
            id v14 = v12;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v30;
              do
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v30 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * i);
                  v20 = [(id)objc_opt_class() operationMap];
                  v21 = [v20 objectForKeyedSubscript:v19];

                  if (v21)
                  {
                    v22 = [v14 objectForKeyedSubscript:v19];
                    [v13 setObject:v22 forKeyedSubscript:v21];
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
              }
              while (v16);
            }

            v23 = (NSDictionary *)[v13 copy];
            constraints = self->_constraints;
            self->_constraints = v23;

            id v7 = v27;
            uint64_t v6 = v28;
            v12 = v26;
          }
        }
      }
    }
    else
    {
      id v7 = TK_LOG_token_2();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(TKTokenKeychainItem *)(uint64_t *)&v33 setAccessControl:v7];
      }
    }

    v25 = v33;
  }
  else
  {
    v25 = self->_constraints;
    self->_constraints = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
}

- (NSData)accessControl
{
  accessControl = self->_accessControl;
  if (!accessControl)
  {
    v4 = [(TKTokenKeychainItem *)self constraints];
    if (v4)
    {
      id v5 = [(TKTokenKeychainItem *)self tokenID];

      if (v5)
      {
        uint64_t v6 = objc_opt_class();
        id v7 = [(TKTokenKeychainItem *)self tokenID];
        id v8 = [v6 accessControlForConstraints:v4 tokenID:v7 error:0];
        objc_super v9 = self->_accessControl;
        self->_accessControl = v8;
      }
    }

    accessControl = self->_accessControl;
  }

  return accessControl;
}

- (NSMutableDictionary)keychainAttributes
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v14[0] = *MEMORY[0x1E4F3B890];
  v4 = [(TKTokenKeychainItem *)self tokenID];
  id v5 = [v4 stringRepresentation];
  v15[0] = v5;
  v14[1] = *MEMORY[0x1E4F3B8B0];
  uint64_t v6 = [(TKTokenKeychainItem *)self encodedObjectID];
  v14[2] = *MEMORY[0x1E4F3B558];
  uint64_t v7 = *MEMORY[0x1E4F3B588];
  v15[1] = v6;
  v15[2] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  objc_super v9 = [v3 dictionaryWithDictionary:v8];

  uint64_t v10 = [(TKTokenKeychainItem *)self label];

  if (v10)
  {
    int v11 = [(TKTokenKeychainItem *)self label];
    [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
  }
  v12 = [(TKTokenKeychainItem *)self accessControl];
  if (v12) {
    [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F3B548]];
  }

  return (NSMutableDictionary *)v9;
}

- (TKTokenKeychainItem)initWithItemInfo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [TKTokenID alloc];
  uint64_t v6 = *MEMORY[0x1E4F3B890];
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B890]];
  id v8 = [(TKTokenID *)v5 initWithTokenID:v7];

  if (v8)
  {
    char v23 = 0;
    uint64_t v9 = *MEMORY[0x1E4F3B8B0];
    uint64_t v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B8B0]];
    id v22 = 0;
    int v11 = [(TKTokenID *)v8 decodedObjectID:v10 isCertificate:&v23 error:&v22];
    v12 = v22;

    if (v11)
    {
      v21.receiver = self;
      v21.super_class = (Class)TKTokenKeychainItem;
      v13 = [(TKTokenKeychainItem *)&v21 init];
      id v14 = v13;
      if (v13)
      {
        objc_storeStrong(&v13->_objectID, v11);
        [(TKTokenKeychainItem *)v14 setTokenID:v8];
        uint64_t v15 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B788]];
        [(TKTokenKeychainItem *)v14 setLabel:v15];

        uint64_t v16 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B548]];
        [(TKTokenKeychainItem *)v14 setAccessControl:v16];
      }
      self = v14;
      uint64_t v17 = self;
    }
    else
    {
      id v18 = TK_LOG_token_2();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = [v4 objectForKeyedSubscript:v9];
        *(_DWORD *)buf = 138543618;
        v25 = v20;
        __int16 v26 = 2114;
        v27 = v12;
        _os_log_error_impl(&dword_1BED55000, v18, OS_LOG_TYPE_ERROR, "Failed to recreate TKTokenKeychainItem from attributes: invalid kSecAttrTokenOID: %{public}@, error:%{public}@", buf, 0x16u);
      }
      uint64_t v17 = 0;
    }
  }
  else
  {
    v12 = TK_LOG_token_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(TKTokenKeychainItem *)v4 initWithItemInfo:v12];
    }
    uint64_t v17 = 0;
  }

  return v17;
}

+ (TKTokenKeychainItem)keychainItemWithInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F3B978]];
  if ([v4 isEqual:*MEMORY[0x1E4F3B980]])
  {
    id v5 = off_1E63C7C78;
LABEL_5:
    uint64_t v6 = (void *)[objc_alloc(*v5) initWithItemInfo:v3];
    goto LABEL_7;
  }
  if ([v4 isEqual:*MEMORY[0x1E4F3B9A0]])
  {
    id v5 = off_1E63C7C90;
    goto LABEL_5;
  }
  uint64_t v6 = 0;
LABEL_7:

  return (TKTokenKeychainItem *)v6;
}

- (TKTokenObjectID)objectID
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLabel:(NSString *)label
{
}

- (NSDictionary)constraints
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConstraints:(NSDictionary *)constraints
{
}

- (TKTokenID)tokenID
{
  return (TKTokenID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTokenID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenID, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_objectID, 0);

  objc_storeStrong((id *)&self->_accessControl, 0);
}

- (void)setAccessControl:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1BED55000, log, OS_LOG_TYPE_ERROR, "TKTokenKeychainItem got invalid accessControl, error:%{public}@ data:%{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)initWithItemInfo:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = [a1 objectForKeyedSubscript:a2];
  int v5 = 138543362;
  __int16 v6 = v4;
  _os_log_error_impl(&dword_1BED55000, a3, OS_LOG_TYPE_ERROR, "Failed to recreate TKTokenKeychainItem from attributes: invalid kSecAttrTokenID: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end