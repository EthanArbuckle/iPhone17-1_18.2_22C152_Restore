@interface MCMConcreteContainerIdentityForLibsystem
+ (id)containerIdentityWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 containerPathIdentifier:(id)a8 existed:(BOOL)a9 transient:(BOOL)a10 userIdentityCache:(id)a11 error:(unint64_t *)a12;
- (BOOL)existed;
- (MCMConcreteContainerIdentityForLibsystem)init;
- (MCMConcreteContainerIdentityForLibsystem)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6;
- (MCMConcreteContainerIdentityForLibsystem)initWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 containerPathIdentifier:(id)a8 existed:(BOOL)a9 transient:(BOOL)a10 userIdentityCache:(id)a11 error:(unint64_t *)a12;
- (NSString)containerPathIdentifier;
- (container_object_s)createLibsystemContainerWithError:(unint64_t *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)identityByChangingContainerPathIdentifier:(id)a3;
- (id)identityByChangingIdentifier:(id)a3;
- (id)identityByChangingTransient:(BOOL)a3;
- (id)identityByChangingUUID:(id)a3;
- (id)nontransientConcreteContainerIdentityForLibsystem;
- (id)nontransientContainerIdentity;
- (id)transientConcreteContainerIdentityForLibsystem;
- (id)transientContainerIdentity;
@end

@implementation MCMConcreteContainerIdentityForLibsystem

+ (id)containerIdentityWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 containerPathIdentifier:(id)a8 existed:(BOOL)a9 transient:(BOOL)a10 userIdentityCache:(id)a11 error:(unint64_t *)a12
{
  id v18 = a11;
  id v19 = a8;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  LOWORD(v26) = __PAIR16__(a10, a9);
  v24 = objc_msgSend(objc_alloc((Class)a1), "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v23, v22, v21, v20, a7, v19, v26, v18, a12);

  return v24;
}

- (MCMConcreteContainerIdentityForLibsystem)initWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 containerPathIdentifier:(id)a8 existed:(BOOL)a9 transient:(BOOL)a10 userIdentityCache:(id)a11 error:(unint64_t *)a12
{
  uint64_t v12 = *(void *)&a7;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v18 = a8;
  unint64_t v27 = 1;
  v26.receiver = self;
  v26.super_class = (Class)MCMConcreteContainerIdentityForLibsystem;
  id v19 = [(MCMConcreteContainerIdentity *)&v26 initWithUUID:a3 userIdentity:a4 identifier:a5 containerConfig:a6 platform:v12 transient:a10 userIdentityCache:a11 error:&v27];
  if (!v19)
  {
LABEL_9:
    id v20 = 0;
    if (a12) {
      *a12 = v27;
    }
    goto LABEL_11;
  }
  id v20 = v19;
  v19->_existed = a9;
  objc_opt_class();
  id v21 = v18;
  if (objc_opt_isKindOfClass()) {
    id v22 = (NSString *)v21;
  }
  else {
    id v22 = 0;
  }

  containerPathIdentifier = v20->_containerPathIdentifier;
  v20->_containerPathIdentifier = v22;

  if (!v20->_containerPathIdentifier)
  {
    v24 = container_log_handle_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v21;
      _os_log_error_impl(&dword_1D7739000, v24, OS_LOG_TYPE_ERROR, "Invalid object: containerPathIdentifier = [%@]", buf, 0xCu);
    }

    unint64_t v27 = 11;
    goto LABEL_9;
  }
LABEL_11:

  return v20;
}

- (void).cxx_destruct
{
  p_containerPathIdentifier = &self->_containerPathIdentifier;

  objc_storeStrong((id *)p_containerPathIdentifier, 0);
}

- (BOOL)existed
{
  return self->_existed;
}

- (NSString)containerPathIdentifier
{
  return self->_containerPathIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)MCMConcreteContainerIdentityForLibsystem;
  v5 = -[MCMConcreteContainerIdentity copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_containerPathIdentifier copyWithZone:a3];
    v7 = (void *)v5[9];
    v5[9] = v6;

    *((unsigned char *)v5 + 64) = self->_existed;
  }
  return v5;
}

- (id)debugDescription
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__MCMConcreteContainerIdentityForLibsystem_debugDescription__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return v4;
}

id __60__MCMConcreteContainerIdentityForLibsystem_debugDescription__block_invoke(uint64_t a1, int a2)
{
  id v20 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = *(void **)(a1 + 32);
  id v21 = [v6 userIdentity];
  v7 = [v21 shortDescription];
  uint64_t v8 = (uint64_t)v7;
  int v22 = a2;
  id v23 = (void *)v5;
  id v19 = v7;
  if (a2)
  {
    uint64_t v8 = [v7 redactedDescription];
    id v18 = [*(id *)(a1 + 32) identifier];
    [v18 redactedDescription];
  }
  else
  {
    [*(id *)(a1 + 32) identifier];
  objc_super v9 = };
  uint64_t v10 = [*(id *)(a1 + 32) containerConfig];
  v11 = [v10 debugDescription];
  uint64_t v12 = [*(id *)(a1 + 32) platform];
  unsigned int v13 = [*(id *)(a1 + 32) transient];
  v14 = [*(id *)(a1 + 32) uuid];
  v15 = [*(id *)(a1 + 32) containerPathIdentifier];
  objc_msgSend(v20, "stringWithFormat:", @"<%@: %p; userIdentity = %@, identifier = %@, class = %@, platform = %d, transient = %d, uuid = %@, containerPathIdentifier = %@, existed = %d>",
    v23,
    v6,
    v8,
    v9,
    v11,
    v12,
    v13,
    v14,
    v15,
  v16 = [*(id *)(a1 + 32) existed]);

  if (v22)
  {

    objc_super v9 = (void *)v8;
  }

  return v16;
}

- (id)description
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__MCMConcreteContainerIdentityForLibsystem_description__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return v4;
}

id __55__MCMConcreteContainerIdentityForLibsystem_description__block_invoke(uint64_t a1, int a2)
{
  int v22 = NSString;
  v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = v4;
  uint64_t v6 = v4;
  if (a2)
  {
    uint64_t v6 = [v4 redactedDescription];
  }
  id v23 = v5;
  uint64_t v7 = [*(id *)(a1 + 32) containerConfig];
  int v8 = [*(id *)(a1 + 32) transient];
  objc_super v9 = "T";
  if (!v8) {
    objc_super v9 = "";
  }
  id v21 = v9;
  uint64_t v10 = [*(id *)(a1 + 32) userIdentity];
  v11 = [v10 shortDescription];
  uint64_t v12 = v11;
  unsigned int v13 = v11;
  if (a2)
  {
    unsigned int v13 = [v11 redactedDescription];
  }
  v14 = [*(id *)(a1 + 32) uuid];
  v15 = [*(id *)(a1 + 32) containerPathIdentifier];
  uint64_t v16 = [*(id *)(a1 + 32) platform];
  int v17 = [*(id *)(a1 + 32) existed];
  id v18 = ";E";
  if (!v17) {
    id v18 = "";
  }
  id v19 = [v22 stringWithFormat:@"<%@(%@%s);%@;u%@;p%@;pf%d%s>", v6, v7, v21, v13, v14, v15, v16, v18];

  if (a2)
  {

    uint64_t v12 = v10;
    uint64_t v10 = (void *)v7;
  }
  else
  {
    uint64_t v6 = (void *)v7;
  }

  return v19;
}

- (id)identityByChangingIdentifier:(id)a3
{
  id v4 = a3;
  id v16 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [(MCMConcreteContainerIdentity *)self uuid];
  uint64_t v6 = [(MCMContainerIdentityMinimal *)self userIdentity];
  uint64_t v7 = [(MCMContainerIdentityMinimal *)self containerConfig];
  uint64_t v8 = [(MCMContainerIdentityMinimal *)self platform];
  objc_super v9 = [(MCMConcreteContainerIdentityForLibsystem *)self containerPathIdentifier];
  BOOL v10 = [(MCMConcreteContainerIdentityForLibsystem *)self existed];
  BOOL v11 = [(MCMContainerIdentity *)self transient];
  uint64_t v12 = [(MCMContainerIdentityMinimal *)self userIdentityCache];
  BYTE1(v15) = v11;
  LOBYTE(v15) = v10;
  unsigned int v13 = objc_msgSend(v16, "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v5, v6, v4, v7, v8, v9, v15, v12, 0);

  return v13;
}

- (id)identityByChangingContainerPathIdentifier:(id)a3
{
  id v4 = a3;
  id v16 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [(MCMConcreteContainerIdentity *)self uuid];
  uint64_t v6 = [(MCMContainerIdentityMinimal *)self userIdentity];
  uint64_t v7 = [(MCMContainerIdentityMinimal *)self identifier];
  uint64_t v8 = [(MCMContainerIdentityMinimal *)self containerConfig];
  uint64_t v9 = [(MCMContainerIdentityMinimal *)self platform];
  BOOL v10 = [(MCMConcreteContainerIdentityForLibsystem *)self existed];
  BOOL v11 = [(MCMContainerIdentity *)self transient];
  uint64_t v12 = [(MCMContainerIdentityMinimal *)self userIdentityCache];
  BYTE1(v15) = v11;
  LOBYTE(v15) = v10;
  unsigned int v13 = objc_msgSend(v16, "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v5, v6, v7, v8, v9, v4, v15, v12, 0);

  return v13;
}

- (id)identityByChangingTransient:(BOOL)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v6 = [(MCMConcreteContainerIdentity *)self uuid];
  uint64_t v7 = [(MCMContainerIdentityMinimal *)self userIdentity];
  uint64_t v8 = [(MCMContainerIdentityMinimal *)self identifier];
  uint64_t v9 = [(MCMContainerIdentityMinimal *)self containerConfig];
  uint64_t v10 = [(MCMContainerIdentityMinimal *)self platform];
  BOOL v11 = [(MCMConcreteContainerIdentityForLibsystem *)self containerPathIdentifier];
  BOOL v12 = [(MCMConcreteContainerIdentityForLibsystem *)self existed];
  unsigned int v13 = [(MCMContainerIdentityMinimal *)self userIdentityCache];
  BYTE1(v16) = a3;
  LOBYTE(v16) = v12;
  v14 = objc_msgSend(v5, "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v6, v7, v8, v9, v10, v11, v16, v13, 0);

  return v14;
}

- (id)identityByChangingUUID:(id)a3
{
  id v4 = a3;
  id v16 = objc_alloc((Class)objc_opt_class());
  id v5 = [(MCMContainerIdentityMinimal *)self userIdentity];
  uint64_t v6 = [(MCMContainerIdentityMinimal *)self identifier];
  uint64_t v7 = [(MCMContainerIdentityMinimal *)self containerConfig];
  uint64_t v8 = [(MCMContainerIdentityMinimal *)self platform];
  uint64_t v9 = [(MCMConcreteContainerIdentityForLibsystem *)self containerPathIdentifier];
  BOOL v10 = [(MCMConcreteContainerIdentityForLibsystem *)self existed];
  BOOL v11 = [(MCMContainerIdentity *)self transient];
  BOOL v12 = [(MCMContainerIdentityMinimal *)self userIdentityCache];
  BYTE1(v15) = v11;
  LOBYTE(v15) = v10;
  unsigned int v13 = objc_msgSend(v16, "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v4, v5, v6, v7, v8, v9, v15, v12, 0);

  return v13;
}

- (id)nontransientConcreteContainerIdentityForLibsystem
{
  return [(MCMConcreteContainerIdentityForLibsystem *)self nontransientContainerIdentity];
}

- (id)transientConcreteContainerIdentityForLibsystem
{
  return [(MCMConcreteContainerIdentityForLibsystem *)self transientContainerIdentity];
}

- (id)nontransientContainerIdentity
{
  v2 = self;
  if ([(MCMContainerIdentity *)v2 transient])
  {
    id v3 = objc_alloc((Class)objc_opt_class());
    id v4 = [(MCMConcreteContainerIdentity *)v2 uuid];
    id v5 = [(MCMContainerIdentityMinimal *)v2 userIdentity];
    uint64_t v6 = [(MCMContainerIdentityMinimal *)v2 identifier];
    uint64_t v7 = [(MCMContainerIdentityMinimal *)v2 containerConfig];
    uint64_t v8 = [(MCMContainerIdentityMinimal *)v2 platform];
    uint64_t v9 = [(MCMConcreteContainerIdentityForLibsystem *)v2 containerPathIdentifier];
    BOOL v10 = [(MCMConcreteContainerIdentityForLibsystem *)v2 existed];
    BOOL v11 = [(MCMContainerIdentityMinimal *)v2 userIdentityCache];
    LOWORD(v14) = v10;
    uint64_t v12 = objc_msgSend(v3, "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v4, v5, v6, v7, v8, v9, v14, v11, 0);

    v2 = (MCMConcreteContainerIdentityForLibsystem *)v12;
  }

  return v2;
}

- (id)transientContainerIdentity
{
  v2 = self;
  if (![(MCMContainerIdentity *)v2 transient])
  {
    id v3 = objc_alloc((Class)objc_opt_class());
    id v4 = [(MCMConcreteContainerIdentity *)v2 uuid];
    id v5 = [(MCMContainerIdentityMinimal *)v2 userIdentity];
    uint64_t v6 = [(MCMContainerIdentityMinimal *)v2 identifier];
    uint64_t v7 = [(MCMContainerIdentityMinimal *)v2 containerConfig];
    uint64_t v8 = [(MCMContainerIdentityMinimal *)v2 platform];
    uint64_t v9 = [(MCMConcreteContainerIdentityForLibsystem *)v2 containerPathIdentifier];
    BOOL v10 = [(MCMConcreteContainerIdentityForLibsystem *)v2 existed];
    BOOL v11 = [(MCMContainerIdentityMinimal *)v2 userIdentityCache];
    BYTE1(v14) = 1;
    LOBYTE(v14) = v10;
    uint64_t v12 = objc_msgSend(v3, "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v4, v5, v6, v7, v8, v9, v14, v11, 0);

    v2 = (MCMConcreteContainerIdentityForLibsystem *)v12;
  }

  return v2;
}

- (container_object_s)createLibsystemContainerWithError:(unint64_t *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = [(MCMConcreteContainerIdentityForLibsystem *)self containerPathIdentifier];
  v8.receiver = self;
  v8.super_class = (Class)MCMConcreteContainerIdentityForLibsystem;
  uint64_t v6 = [(MCMConcreteContainerIdentity *)&v8 createLibsystemContainerWithContainerPathIdentifier:v5 existed:[(MCMConcreteContainerIdentityForLibsystem *)self existed] error:a3];

  return v6;
}

- (MCMConcreteContainerIdentityForLibsystem)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v15 = 1;
  v14.receiver = self;
  v14.super_class = (Class)MCMConcreteContainerIdentityForLibsystem;
  objc_super v8 = [(MCMConcreteContainerIdentity *)&v14 initWithLibsystemContainer:a3 defaultUserIdentity:a4 userIdentityCache:a5 error:&v15];
  if (!v8)
  {
LABEL_4:
    if (!a6) {
      return v8;
    }
    goto LABEL_5;
  }
  uint64_t v9 = MEMORY[0x1D9478630](a3);
  if (v9)
  {
    uint64_t v10 = [NSString stringWithUTF8String:v9];
    containerPathIdentifier = v8->_containerPathIdentifier;
    v8->_containerPathIdentifier = (NSString *)v10;

    v8->_existed = container_is_new() ^ 1;
    goto LABEL_4;
  }
  unsigned int v13 = container_log_handle_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "container_object_t had a NULL unique path component when creating a concrete container identity", buf, 2u);
  }

  unint64_t v15 = 11;
  objc_super v8 = 0;
  if (a6)
  {
LABEL_5:
    if (v15 != 1) {
      *a6 = v15;
    }
  }
  return v8;
}

- (MCMConcreteContainerIdentityForLibsystem)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = container_log_handle_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v5 = 0;
    _os_log_error_impl(&dword_1D7739000, v3, OS_LOG_TYPE_ERROR, "You cannot init this class directly.", v5, 2u);
  }

  return 0;
}

@end