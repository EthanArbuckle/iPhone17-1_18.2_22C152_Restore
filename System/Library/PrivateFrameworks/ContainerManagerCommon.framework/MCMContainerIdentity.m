@interface MCMContainerIdentity
+ (id)containerIdentityFromPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5;
+ (id)containerIdentityWithIdentifier:(id)a3 containerConfig:(id)a4 platform:(unsigned int)a5 userIdentityCache:(id)a6 error:(unint64_t *)a7;
+ (id)containerIdentityWithMinimalContainerIdentity:(id)a3 transient:(BOOL)a4;
+ (id)containerIdentityWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 transient:(BOOL)a7 userIdentityCache:(id)a8 error:(unint64_t *)a9;
+ (id)containerIdentityWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 userIdentityCache:(id)a7 error:(unint64_t *)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainerIdentity:(id)a3;
- (BOOL)transient;
- (MCMContainerIdentity)init;
- (MCMContainerIdentity)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6;
- (MCMContainerIdentity)initWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 transient:(BOOL)a7 userIdentityCache:(id)a8 error:(unint64_t *)a9;
- (MCMContainerIdentity)initWithVersion1PlistDictionary:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5;
- (id)containerIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)identityByChangingTransient:(BOOL)a3;
- (id)identityByChangingUserIdentity:(id)a3;
- (id)nontransientContainerIdentity;
- (id)plist;
- (id)transientContainerIdentity;
- (unint64_t)hash;
@end

@implementation MCMContainerIdentity

- (MCMContainerIdentity)initWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 transient:(BOOL)a7 userIdentityCache:(id)a8 error:(unint64_t *)a9
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v12[0] = 1;
  v11.receiver = self;
  v11.super_class = (Class)MCMContainerIdentity;
  result = [(MCMContainerIdentityMinimal *)&v11 initWithUserIdentity:a3 identifier:a4 containerConfig:a5 platform:*(void *)&a6 userIdentityCache:a8 error:v12];
  if (result)
  {
    result->_transient = a7;
  }
  else if (a9)
  {
    *a9 = v12[0];
  }
  return result;
}

- (BOOL)transient
{
  return self->_transient;
}

+ (id)containerIdentityWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 userIdentityCache:(id)a7 error:(unint64_t *)a8
{
  uint64_t v9 = *(void *)&a6;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = (void *)[objc_alloc((Class)a1) initWithUserIdentity:v17 identifier:v16 containerConfig:v15 platform:v9 transient:0 userIdentityCache:v14 error:a8];

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v6 = [(MCMContainerIdentityMinimal *)self userIdentity];
  v7 = [(MCMContainerIdentityMinimal *)self identifier];
  v8 = (void *)[v7 copyWithZone:a3];
  uint64_t v9 = [(MCMContainerIdentityMinimal *)self containerConfig];
  uint64_t v10 = [(MCMContainerIdentityMinimal *)self platform];
  BOOL transient = self->_transient;
  v12 = [(MCMContainerIdentityMinimal *)self userIdentityCache];
  v13 = (void *)[v5 initWithUserIdentity:v6 identifier:v8 containerConfig:v9 platform:v10 transient:transient userIdentityCache:v12 error:0];

  return v13;
}

+ (id)containerIdentityWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 transient:(BOOL)a7 userIdentityCache:(id)a8 error:(unint64_t *)a9
{
  BOOL v9 = a7;
  uint64_t v10 = *(void *)&a6;
  id v15 = a8;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = (void *)[objc_alloc((Class)a1) initWithUserIdentity:v18 identifier:v17 containerConfig:v16 platform:v10 transient:v9 userIdentityCache:v15 error:a9];

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MCMContainerIdentity *)a3;
  BOOL v5 = self == v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(MCMContainerIdentity *)self isEqualToContainerIdentity:v4];
  }

  return v5;
}

- (BOOL)isEqualToContainerIdentity:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)MCMContainerIdentity;
  if ([(MCMContainerIdentityMinimal *)&v7 isEqualToContainerIdentity:v4]) {
    BOOL v5 = self->_transient == v4[48];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)MCMContainerIdentity;
  unint64_t v3 = [(MCMContainerIdentityMinimal *)&v6 hash];
  uint64_t v4 = 15;
  if (!self->_transient) {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (id)debugDescription
{
  v6[5] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__MCMContainerIdentity_debugDescription__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  uint64_t v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return v4;
}

id __40__MCMContainerIdentity_debugDescription__block_invoke(uint64_t a1, int a2)
{
  id v16 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v17 = NSStringFromClass(v4);
  BOOL v5 = *(void **)(a1 + 32);
  objc_super v6 = [v5 userIdentity];
  uint64_t v7 = [v6 shortDescription];
  uint64_t v8 = v7;
  if (a2)
  {
    uint64_t v9 = [v7 redactedDescription];
    id v15 = [*(id *)(a1 + 32) identifier];
    uint64_t v10 = [v15 redactedDescription];
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) identifier];
    uint64_t v9 = (uint64_t)v8;
  }
  objc_super v11 = [*(id *)(a1 + 32) containerConfig];
  v12 = [v11 debugDescription];
  objc_msgSend(v16, "stringWithFormat:", @"<%@: %p; userIdentity = %@, identifier = %@, class = %@, platform = %d, BOOL transient = %d>",
    v17,
    v5,
    v9,
    v10,
    v12,
    [*(id *)(a1 + 32) platform],
  v13 = [*(id *)(a1 + 32) transient]);

  if (a2)
  {

    uint64_t v10 = (void *)v9;
  }

  return v13;
}

- (id)description
{
  v6[5] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__MCMContainerIdentity_description__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  uint64_t v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return v4;
}

id __35__MCMContainerIdentity_description__block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = NSString;
  BOOL v5 = [*(id *)(a1 + 32) identifier];
  objc_super v6 = v5;
  uint64_t v7 = v5;
  if (a2)
  {
    uint64_t v7 = [v5 redactedDescription];
  }
  uint64_t v8 = [*(id *)(a1 + 32) containerConfig];
  if ([*(id *)(a1 + 32) transient]) {
    uint64_t v9 = "T";
  }
  else {
    uint64_t v9 = "";
  }
  uint64_t v10 = [*(id *)(a1 + 32) userIdentity];
  objc_super v11 = [v10 shortDescription];
  v12 = v11;
  v13 = v11;
  if (a2)
  {
    v13 = [v11 redactedDescription];
  }
  objc_msgSend(v4, "stringWithFormat:", @"<%@(%@%s);%@;pf%d>",
    v7,
    v8,
    v9,
    v13,
  id v14 = [*(id *)(a1 + 32) platform]);
  if (a2)
  {

    v12 = v10;
    uint64_t v10 = (void *)v8;
  }
  else
  {
    uint64_t v7 = (void *)v8;
  }

  return v14;
}

- (id)containerIdentity
{
  return self;
}

- (id)identityByChangingUserIdentity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MCMContainerIdentityMinimal *)self identifier];
  objc_super v6 = [(MCMContainerIdentityMinimal *)self containerConfig];
  uint64_t v7 = [(MCMContainerIdentityMinimal *)self platform];
  BOOL v8 = [(MCMContainerIdentity *)self transient];
  uint64_t v9 = [(MCMContainerIdentityMinimal *)self userIdentityCache];
  uint64_t v10 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v4 identifier:v5 containerConfig:v6 platform:v7 transient:v8 userIdentityCache:v9 error:0];

  return v10;
}

- (id)identityByChangingTransient:(BOOL)a3
{
  id v4 = (unsigned char *)[(MCMContainerIdentity *)self copy];
  v4[48] = a3;

  return v4;
}

- (id)nontransientContainerIdentity
{
  v2 = self;
  if ([(MCMContainerIdentity *)v2 transient])
  {
    id v3 = objc_alloc((Class)objc_opt_class());
    id v4 = [(MCMContainerIdentityMinimal *)v2 userIdentity];
    BOOL v5 = [(MCMContainerIdentityMinimal *)v2 identifier];
    objc_super v6 = [(MCMContainerIdentityMinimal *)v2 containerConfig];
    uint64_t v7 = [(MCMContainerIdentityMinimal *)v2 platform];
    BOOL v8 = [(MCMContainerIdentityMinimal *)v2 userIdentityCache];
    uint64_t v9 = [v3 initWithUserIdentity:v4 identifier:v5 containerConfig:v6 platform:v7 transient:0 userIdentityCache:v8 error:0];

    v2 = (MCMContainerIdentity *)v9;
  }

  return v2;
}

- (id)transientContainerIdentity
{
  v2 = self;
  if (![(MCMContainerIdentity *)v2 transient])
  {
    id v3 = objc_alloc((Class)objc_opt_class());
    id v4 = [(MCMContainerIdentityMinimal *)v2 userIdentity];
    BOOL v5 = [(MCMContainerIdentityMinimal *)v2 identifier];
    objc_super v6 = [(MCMContainerIdentityMinimal *)v2 containerConfig];
    uint64_t v7 = [(MCMContainerIdentityMinimal *)v2 platform];
    BOOL v8 = [(MCMContainerIdentityMinimal *)v2 userIdentityCache];
    uint64_t v9 = [v3 initWithUserIdentity:v4 identifier:v5 containerConfig:v6 platform:v7 transient:1 userIdentityCache:v8 error:0];

    v2 = (MCMContainerIdentity *)v9;
  }

  return v2;
}

- (MCMContainerIdentity)initWithVersion1PlistDictionary:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v19[0] = 1;
  v18.receiver = self;
  v18.super_class = (Class)MCMContainerIdentity;
  uint64_t v10 = [(MCMContainerIdentityMinimal *)&v18 initWithVersion1PlistDictionary:v8 userIdentityCache:v9 error:v19];
  if (!v10)
  {
    id v16 = 0;
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  objc_super v11 = [v8 objectForKeyedSubscript:@"transient"];
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v12 = [v11 BOOLValue];
  }
  else {
    uint64_t v12 = 0;
  }
  v13 = [(MCMContainerIdentityMinimal *)v10 userIdentity];
  id v14 = [(MCMContainerIdentityMinimal *)v10 identifier];
  id v15 = [(MCMContainerIdentityMinimal *)v10 containerConfig];
  id v16 = [(MCMContainerIdentity *)v10 initWithUserIdentity:v13 identifier:v14 containerConfig:v15 platform:[(MCMContainerIdentityMinimal *)v10 platform] transient:v12 userIdentityCache:v9 error:v19];

  if (a5)
  {
LABEL_9:
    if (!v16) {
      *a5 = v19[0];
    }
  }
LABEL_11:

  return v16;
}

- (id)plist
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)MCMContainerIdentity;
  id v3 = [(MCMContainerIdentityMinimal *)&v8 plist];
  id v4 = (void *)[v3 mutableCopy];

  BOOL v5 = objc_msgSend(NSNumber, "numberWithBool:", -[MCMContainerIdentity transient](self, "transient"));
  [v4 setObject:v5 forKeyedSubscript:@"transient"];

  objc_super v6 = (void *)[v4 copy];

  return v6;
}

- (MCMContainerIdentity)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = 1;
  BOOL v10 = 0;
  v9.receiver = self;
  v9.super_class = (Class)MCMContainerIdentity;
  uint64_t v7 = -[MCMContainerIdentityMinimal initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:](&v9, sel_initWithLibsystemContainer_defaultUserIdentity_userIdentityCache_error_);
  if (v7)
  {
    container_is_transient();
    v7->_BOOL transient = v10;
  }
  else if (a6)
  {
    *a6 = v11;
  }
  return v7;
}

- (MCMContainerIdentity)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = container_log_handle_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_error_impl(&dword_1D7739000, v3, OS_LOG_TYPE_ERROR, "You cannot init this class directly.", v5, 2u);
  }

  return 0;
}

+ (id)containerIdentityWithMinimalContainerIdentity:(id)a3 transient:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  objc_super v8 = [v6 userIdentity];
  objc_super v9 = [v6 identifier];
  BOOL v10 = [v6 containerConfig];
  uint64_t v11 = [v6 platform];
  uint64_t v12 = [v6 userIdentityCache];

  v13 = (void *)[v7 initWithUserIdentity:v8 identifier:v9 containerConfig:v10 platform:v11 transient:v4 userIdentityCache:v12 error:0];

  return v13;
}

+ (id)containerIdentityFromPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = (void *)[objc_alloc((Class)a1) initWithPlist:v9 userIdentityCache:v8 error:a5];

  return v10;
}

+ (id)containerIdentityWithIdentifier:(id)a3 containerConfig:(id)a4 platform:(unsigned int)a5 userIdentityCache:(id)a6 error:(unint64_t *)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  unint64_t v20 = 1;
  if (![v13 personaAndUserSpecific])
  {
    id v17 = objc_alloc((Class)a1);
    objc_super v18 = [v14 defaultUserIdentity];
    id v16 = (void *)[v17 initWithUserIdentity:v18 identifier:v12 containerConfig:v13 platform:v9 transient:0 userIdentityCache:v14 error:&v20];

    if (!a7) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  id v15 = container_log_handle_for_category();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = v12;
    __int16 v23 = 2114;
    id v24 = v13;
    _os_log_fault_impl(&dword_1D7739000, v15, OS_LOG_TYPE_FAULT, "Attempt to create a container identity without a user identity when one is required; identifier = [%{public}@], cl"
      "ass = %{public}@",
      buf,
      0x16u);
  }

  id v16 = 0;
  unint64_t v20 = 11;
  if (a7)
  {
LABEL_7:
    if (!v16) {
      *a7 = v20;
    }
  }
LABEL_9:

  return v16;
}

@end