@interface MCMConcreteContainerIdentity
+ (id)concreteContainerIdentityFromPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5;
+ (id)containerIdentityWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 transient:(BOOL)a8 userIdentityCache:(id)a9 error:(unint64_t *)a10;
+ (id)containerIdentityWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 userIdentityCache:(id)a8 error:(unint64_t *)a9;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConcreteContainerIdentity:(id)a3;
- (MCMConcreteContainerIdentity)init;
- (MCMConcreteContainerIdentity)initWithContainerIdentity:(id)a3 UUID:(id)a4 error:(unint64_t *)a5;
- (MCMConcreteContainerIdentity)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6;
- (MCMConcreteContainerIdentity)initWithPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5;
- (MCMConcreteContainerIdentity)initWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 transient:(BOOL)a8 userIdentityCache:(id)a9 error:(unint64_t *)a10;
- (MCMConcreteContainerIdentity)initWithVersion1PlistDictionary:(id)a3 containerIdentity:(id)a4 error:(unint64_t *)a5;
- (NSUUID)uuid;
- (container_object_s)createLibsystemContainerWithContainerPathIdentifier:(id)a3 existed:(BOOL)a4 error:(unint64_t *)a5;
- (id)containerIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)plist;
- (unint64_t)hash;
@end

@implementation MCMConcreteContainerIdentity

- (MCMConcreteContainerIdentity)initWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 transient:(BOOL)a8 userIdentityCache:(id)a9 error:(unint64_t *)a10
{
  BOOL v10 = a8;
  uint64_t v11 = *(void *)&a7;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  unint64_t v25 = 1;
  v24.receiver = self;
  v24.super_class = (Class)MCMConcreteContainerIdentity;
  v17 = [(MCMContainerIdentity *)&v24 initWithUserIdentity:a4 identifier:a5 containerConfig:a6 platform:v11 transient:v10 userIdentityCache:a9 error:&v25];
  if (!v17)
  {
LABEL_9:
    v18 = 0;
    if (a10) {
      *a10 = v25;
    }
    goto LABEL_11;
  }
  v18 = v17;
  objc_opt_class();
  id v19 = v16;
  if (objc_opt_isKindOfClass()) {
    v20 = (NSUUID *)v19;
  }
  else {
    v20 = 0;
  }

  uuid = v18->_uuid;
  v18->_uuid = v20;

  if (!v18->_uuid)
  {
    v22 = container_log_handle_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v19;
      _os_log_error_impl(&dword_1D7739000, v22, OS_LOG_TYPE_ERROR, "Invalid object: uuid = [%@]", buf, 0xCu);
    }

    unint64_t v25 = 11;
    goto LABEL_9;
  }
LABEL_11:

  return v18;
}

- (container_object_s)createLibsystemContainerWithContainerPathIdentifier:(id)a3 existed:(BOOL)a4 error:(unint64_t *)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v17[0] = 0;
  v17[1] = 0;
  id v6 = a3;
  v7 = [(MCMConcreteContainerIdentity *)self uuid];
  [v7 getUUIDBytes:v17];

  id v16 = [(MCMContainerIdentityMinimal *)self identifier];
  [v16 UTF8String];
  v8 = [(MCMContainerIdentityMinimal *)self containerConfig];
  [v8 containerClass];
  v9 = [(MCMContainerIdentityMinimal *)self userIdentity];
  BOOL v10 = [v9 posixUser];
  [v10 UID];
  id v11 = v6;
  [v11 UTF8String];

  v12 = [(MCMContainerIdentityMinimal *)self userIdentity];
  id v13 = [v12 personaUniqueString];
  [v13 UTF8String];
  [(MCMContainerIdentity *)self transient];
  v14 = (container_object_s *)container_object_create();

  return v14;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  p_uuid = &self->_uuid;

  objc_storeStrong((id *)p_uuid, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)MCMConcreteContainerIdentity;
  v5 = -[MCMContainerIdentity copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSUUID *)self->_uuid copyWithZone:a3];
    v7 = (void *)v5[7];
    v5[7] = v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MCMConcreteContainerIdentity *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(MCMConcreteContainerIdentity *)self isEqualToConcreteContainerIdentity:v4];
LABEL_5:
    BOOL v6 = v5;
    goto LABEL_6;
  }
  BOOL v6 = self == v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(MCMContainerIdentity *)self isEqualToContainerIdentity:v4];
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (BOOL)isEqualToConcreteContainerIdentity:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if ([(NSUUID *)self->_uuid isEqual:v4[7]])
  {
    v7.receiver = self;
    v7.super_class = (Class)MCMConcreteContainerIdentity;
    BOOL v5 = [(MCMContainerIdentity *)&v7 isEqualToContainerIdentity:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)MCMConcreteContainerIdentity;
  unint64_t v3 = [(MCMContainerIdentity *)&v5 hash];
  return [(NSUUID *)self->_uuid hash] ^ v3;
}

- (id)debugDescription
{
  v6[5] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__MCMConcreteContainerIdentity_debugDescription__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return v4;
}

id __48__MCMConcreteContainerIdentity_debugDescription__block_invoke(uint64_t a1, int a2)
{
  v20 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = *(void **)(a1 + 32);
  objc_super v7 = [v6 userIdentity];
  uint64_t v8 = [v7 shortDescription];
  objc_super v9 = v8;
  int v21 = a2;
  v22 = (void *)v5;
  if (a2)
  {
    uint64_t v10 = [v8 redactedDescription];
    id v19 = [*(id *)(a1 + 32) identifier];
    id v11 = [v19 redactedDescription];
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) identifier];
    uint64_t v10 = (uint64_t)v9;
  }
  v12 = [*(id *)(a1 + 32) containerConfig];
  id v13 = [v12 debugDescription];
  uint64_t v14 = [*(id *)(a1 + 32) platform];
  unsigned int v15 = [*(id *)(a1 + 32) transient];
  id v16 = [*(id *)(a1 + 32) uuid];
  objc_msgSend(v20, "stringWithFormat:", @"<%@: %p; userIdentity = %@, identifier = %@, class = %@, platform = %d, transient = %d, uuid = %@>",
    v22,
    v6,
    v10,
    v11,
    v13,
    v14,
    v15,
  v17 = v16);

  if (v21)
  {

    id v11 = (void *)v10;
  }

  return v17;
}

- (id)description
{
  v6[5] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__MCMConcreteContainerIdentity_description__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return v4;
}

id __43__MCMConcreteContainerIdentity_description__block_invoke(uint64_t a1, int a2)
{
  id v16 = NSString;
  v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = v4;
  uint64_t v6 = v4;
  if (a2)
  {
    uint64_t v6 = [v4 redactedDescription];
  }
  uint64_t v7 = [*(id *)(a1 + 32) containerConfig];
  if ([*(id *)(a1 + 32) transient]) {
    uint64_t v8 = "T";
  }
  else {
    uint64_t v8 = "";
  }
  objc_super v9 = [*(id *)(a1 + 32) userIdentity];
  uint64_t v10 = [v9 shortDescription];
  id v11 = v10;
  v12 = v10;
  if (a2)
  {
    v12 = [v10 redactedDescription];
  }
  id v13 = [*(id *)(a1 + 32) uuid];
  objc_msgSend(v16, "stringWithFormat:", @"<%@(%@%s);%@;u%@;pf%d>",
    v6,
    v7,
    v8,
    v12,
    v13,
  uint64_t v14 = [*(id *)(a1 + 32) platform]);

  if (a2)
  {

    id v11 = v9;
    objc_super v9 = (void *)v7;
  }
  else
  {
    uint64_t v6 = (void *)v7;
  }

  return v14;
}

- (id)containerIdentity
{
  unint64_t v3 = [MCMContainerIdentity alloc];
  v4 = [(MCMContainerIdentityMinimal *)self userIdentity];
  uint64_t v5 = [(MCMContainerIdentityMinimal *)self identifier];
  uint64_t v6 = [(MCMContainerIdentityMinimal *)self containerConfig];
  uint64_t v7 = [(MCMContainerIdentityMinimal *)self platform];
  BOOL v8 = [(MCMContainerIdentity *)self transient];
  objc_super v9 = [(MCMContainerIdentityMinimal *)self userIdentityCache];
  uint64_t v10 = [(MCMContainerIdentity *)v3 initWithUserIdentity:v4 identifier:v5 containerConfig:v6 platform:v7 transient:v8 userIdentityCache:v9 error:0];

  return v10;
}

- (id)plist
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)MCMConcreteContainerIdentity;
  unint64_t v3 = [(MCMContainerIdentity *)&v9 plist];
  v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = [(MCMConcreteContainerIdentity *)self uuid];
  uint64_t v6 = [v5 UUIDString];
  [v4 setObject:v6 forKeyedSubscript:@"UUID"];

  uint64_t v7 = (void *)[v4 copy];

  return v7;
}

- (MCMConcreteContainerIdentity)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v12 = 1;
  v11.receiver = self;
  v11.super_class = (Class)MCMConcreteContainerIdentity;
  uint64_t v7 = -[MCMContainerIdentity initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:](&v11, sel_initWithLibsystemContainer_defaultUserIdentity_userIdentityCache_error_);
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:container_object_get_uuid()];
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v8;
  }
  else if (a6)
  {
    *a6 = v12;
  }
  return v7;
}

- (MCMConcreteContainerIdentity)initWithVersion1PlistDictionary:(id)a3 containerIdentity:(id)a4 error:(unint64_t *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v17 = 1;
  uint64_t v10 = [v8 objectForKeyedSubscript:@"UUID"];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
      if (v11)
      {
        unint64_t v12 = (void *)v11;
        uint64_t v13 = [(MCMConcreteContainerIdentity *)self initWithContainerIdentity:v9 UUID:v11 error:&v17];
        self = v13;
        if (!a5) {
          goto LABEL_11;
        }
        goto LABEL_9;
      }
    }
  }
  unint64_t v17 = 116;
  uint64_t v14 = container_log_handle_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = @"UUID";
    __int16 v20 = 2112;
    id v21 = (id)objc_opt_class();
    __int16 v22 = 2112;
    id v23 = v8;
    id v16 = v21;
    _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Invalid container identity plist data. Expected UUID string for %@, got %@. Data: %@", buf, 0x20u);
  }
  unint64_t v12 = 0;
  uint64_t v13 = 0;
  if (a5)
  {
LABEL_9:
    if (!v13) {
      *a5 = v17;
    }
  }
LABEL_11:

  return v13;
}

- (MCMConcreteContainerIdentity)initWithContainerIdentity:(id)a3 UUID:(id)a4 error:(unint64_t *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v9 userIdentity];
  uint64_t v11 = [v9 identifier];
  unint64_t v12 = [v9 containerConfig];
  uint64_t v13 = [v9 platform];
  uint64_t v14 = [v9 transient];
  unsigned int v15 = [v9 userIdentityCache];

  id v16 = [(MCMConcreteContainerIdentity *)self initWithUUID:v8 userIdentity:v10 identifier:v11 containerConfig:v12 platform:v13 transient:v14 userIdentityCache:v15 error:a5];
  return v16;
}

- (MCMConcreteContainerIdentity)initWithPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v16[0] = 1;
  v15.receiver = self;
  v15.super_class = (Class)MCMConcreteContainerIdentity;
  id v9 = [(MCMContainerIdentityMinimal *)&v15 initWithPlist:v8 userIdentityCache:a4 error:v16];
  if (v9)
  {
    id v10 = v8;
    uint64_t v11 = [v10 objectForKeyedSubscript:@"version"];
    int v12 = [v11 isEqual:@"1"];

    if (v12)
    {
      uint64_t v13 = [(MCMConcreteContainerIdentity *)v9 initWithVersion1PlistDictionary:v10 containerIdentity:v9 error:a5];
    }
    else
    {

      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (MCMConcreteContainerIdentity)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = container_log_handle_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_error_impl(&dword_1D7739000, v3, OS_LOG_TYPE_ERROR, "You cannot init this class directly.", v5, 2u);
  }

  return 0;
}

+ (id)concreteContainerIdentityFromPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithPlist:v9 userIdentityCache:v8 error:a5];

  return v10;
}

+ (id)containerIdentityWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 userIdentityCache:(id)a8 error:(unint64_t *)a9
{
  uint64_t v9 = *(void *)&a7;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  __int16 v20 = (void *)[objc_alloc((Class)a1) initWithUUID:v19 userIdentity:v18 identifier:v17 containerConfig:v16 platform:v9 transient:0 userIdentityCache:v15 error:a9];

  return v20;
}

+ (id)containerIdentityWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 transient:(BOOL)a8 userIdentityCache:(id)a9 error:(unint64_t *)a10
{
  BOOL v10 = a8;
  uint64_t v11 = *(void *)&a7;
  id v17 = a9;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  __int16 v22 = (void *)[objc_alloc((Class)a1) initWithUUID:v21 userIdentity:v20 identifier:v19 containerConfig:v18 platform:v11 transient:v10 userIdentityCache:v17 error:a10];

  return v22;
}

@end