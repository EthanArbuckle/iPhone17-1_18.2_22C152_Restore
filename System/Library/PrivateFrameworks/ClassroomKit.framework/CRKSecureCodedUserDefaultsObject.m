@interface CRKSecureCodedUserDefaultsObject
- (BOOL)setValue:(id)a3 error:(id *)a4;
- (CRKSecureCodedUserDefaultsObject)initWithKey:(id)a3 classes:(id)a4;
- (CRKSecureCodedUserDefaultsObject)initWithStore:(id)a3 key:(id)a4 classes:(id)a5;
- (NSSet)classes;
- (id)value;
- (id)valueWithError:(id *)a3;
- (void)registerDefaultValue:(id)a3;
- (void)setValue:(id)a3;
- (void)value;
@end

@implementation CRKSecureCodedUserDefaultsObject

- (CRKSecureCodedUserDefaultsObject)initWithKey:(id)a3 classes:(id)a4
{
  v6 = (void *)MEMORY[0x263EFFA40];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 standardUserDefaults];
  v10 = [(CRKSecureCodedUserDefaultsObject *)self initWithStore:v9 key:v8 classes:v7];

  return v10;
}

- (CRKSecureCodedUserDefaultsObject)initWithStore:(id)a3 key:(id)a4 classes:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CRKSecureCodedUserDefaultsObject;
  v9 = [(CRKUserDefaultsObject *)&v13 initWithStore:a3 key:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    classes = v9->_classes;
    v9->_classes = (NSSet *)v10;
  }
  return v9;
}

- (id)valueWithError:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CRKSecureCodedUserDefaultsObject;
  v5 = [(CRKUserDefaultsObject *)&v10 value];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263F08928];
    id v7 = [(CRKSecureCodedUserDefaultsObject *)self classes];
    id v8 = objc_msgSend(v6, "cat_unarchiveObjectOfClasses:withData:error:", v7, v5, a3);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)setValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263F08910], "cat_archivedDataWithRootObject:error:", v6, a4);
    if (!v7)
    {
      BOOL v9 = 0;
      goto LABEL_7;
    }
    id v8 = (void *)v7;
    v12.receiver = self;
    v12.super_class = (Class)CRKSecureCodedUserDefaultsObject;
    [(CRKUserDefaultsObject *)&v12 setValue:v7];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CRKSecureCodedUserDefaultsObject;
    [(CRKUserDefaultsObject *)&v11 setValue:0];
  }
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

- (id)value
{
  id v8 = 0;
  v3 = [(CRKSecureCodedUserDefaultsObject *)self valueWithError:&v8];
  id v4 = v8;
  v5 = v4;
  if (!v3 && v4)
  {
    id v6 = _CRKLogGeneral_19();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(CRKSecureCodedUserDefaultsObject *)self value];
    }
  }

  return v3;
}

- (void)setValue:(id)a3
{
  id v7 = 0;
  BOOL v4 = [(CRKSecureCodedUserDefaultsObject *)self setValue:a3 error:&v7];
  id v5 = v7;
  if (!v4)
  {
    id v6 = _CRKLogGeneral_19();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CRKSecureCodedUserDefaultsObject setValue:](self, v5);
    }
  }
}

- (void)registerDefaultValue:(id)a3
{
  id v8 = 0;
  BOOL v4 = objc_msgSend(MEMORY[0x263F08910], "cat_archivedDataWithRootObject:error:", a3, &v8);
  id v5 = v8;
  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)CRKSecureCodedUserDefaultsObject;
    [(CRKUserDefaultsObject *)&v7 registerDefaultValue:v4];
  }
  else
  {
    id v6 = _CRKLogGeneral_19();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CRKSecureCodedUserDefaultsObject setValue:](self, v5);
    }
  }
}

- (NSSet)classes
{
  return self->_classes;
}

- (void).cxx_destruct
{
}

- (void)value
{
  v3 = [a1 key];
  BOOL v4 = [a2 verboseDescription];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_1(&dword_224C00000, v5, v6, "Failed to deserialize value for key %{public}@: %{public}@", v7, v8, v9, v10, v11);
}

- (void)setValue:(void *)a1 .cold.1(void *a1, void *a2)
{
  v3 = [a1 key];
  BOOL v4 = [a2 verboseDescription];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_1(&dword_224C00000, v5, v6, "Failed to serialize value for key %{public}@: %{public}@", v7, v8, v9, v10, v11);
}

@end