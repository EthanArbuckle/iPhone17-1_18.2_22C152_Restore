@interface BKSAbstractDefaults
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation BKSAbstractDefaults

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(BKSAbstractDefaults *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__BKSAbstractDefaults_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E5441BB0;
  v10[4] = self;
  id v5 = v4;
  id v11 = v5;
  id v6 = (id)[v5 modifyBody:v10];
  v7 = v11;
  id v8 = v5;

  return v8;
}

void __61__BKSAbstractDefaults_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  unsigned int outCount = 0;
  v2 = (objc_class *)objc_opt_class();
  v3 = class_copyPropertyList(v2, &outCount);
  if (v3)
  {
    v4 = v3;
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        id v6 = v4[i];
        Name = property_getName(v6);
        if (Name)
        {
          id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", Name, objc_msgSend(NSString, "defaultCStringEncoding"));
          v9 = property_copyAttributeValue(v6, "G");
          if (v9)
          {
            uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, objc_msgSend(NSString, "defaultCStringEncoding"));

            id v8 = (void *)v10;
          }
          id v11 = *(void **)(a1 + 40);
          v12 = [*(id *)(a1 + 32) valueForKey:v8];
          id v13 = (id)[v11 appendObject:v12 withName:v8];
        }
      }
    }
    free(v4);
  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKSAbstractDefaults *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)succinctDescription
{
  v2 = [(BKSAbstractDefaults *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (NSString)description
{
  return (NSString *)[(BKSAbstractDefaults *)self descriptionWithMultilinePrefix:0];
}

@end