@interface MCMManagedPath
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToManagedPath:(id)a3;
- (MCMFSNode)fsNode;
- (MCMManagedPath)initWithURL:(id)a3 flags:(unint64_t)a4 ACLConfig:(unint64_t)a5 mode:(unsigned __int16)a6 dpClass:(int)a7 owner:(id)a8 parent:(id)a9;
- (MCMManagedPath)parent;
- (MCMPOSIXUser)owner;
- (NSString)description;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)managedPathByAppendingPathComponent:(id)a3 flags:(unint64_t)a4 ACLConfig:(unint64_t)a5 mode:(unsigned __int16)a6 dpClass:(int)a7 owner:(id)a8;
- (int)dpClass;
- (unint64_t)ACLConfig;
- (unint64_t)flags;
- (unint64_t)hash;
- (unsigned)mode;
- (void)setFsNode:(id)a3;
@end

@implementation MCMManagedPath

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fsNode, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_owner, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setFsNode:(id)a3
{
  p_fsNode = &self->_fsNode;

  objc_storeStrong((id *)p_fsNode, a3);
}

- (MCMFSNode)fsNode
{
  return self->_fsNode;
}

- (MCMManagedPath)parent
{
  return self->_parent;
}

- (MCMPOSIXUser)owner
{
  return self->_owner;
}

- (int)dpClass
{
  return self->_dpClass;
}

- (unsigned)mode
{
  return self->_mode;
}

- (unint64_t)ACLConfig
{
  return self->_ACLConfig;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)description
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__MCMManagedPath_description__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return (NSString *)v4;
}

id __29__MCMManagedPath_description__block_invoke(uint64_t a1, int a2)
{
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = *(void **)(a1 + 32);
  uint64_t v29 = [v7 flags];
  uint64_t v28 = [*(id *)(a1 + 32) ACLConfig];
  uint64_t v27 = [*(id *)(a1 + 32) mode];
  uint64_t v26 = [*(id *)(a1 + 32) dpClass];
  v8 = [*(id *)(a1 + 32) owner];
  v9 = v8;
  uint64_t v10 = (uint64_t)v8;
  if (a2)
  {
    uint64_t v10 = [v8 redactedDescription];
  }
  v11 = [*(id *)(a1 + 32) parent];
  v12 = [*(id *)(a1 + 32) fsNode];
  v13 = v12;
  if (a2)
  {
    v14 = [v12 redactedDescription];
    v15 = [*(id *)(a1 + 32) url];
    [v15 path];
    v17 = v16 = v7;
    uint64_t v18 = [v17 redactedDescription];
    v19 = v4;
    v20 = v9;
    v21 = v6;
    v22 = (void *)v18;
    objc_msgSend(v19, "stringWithFormat:", @"<%@: %p; flags = 0x%lx, ACLConfig = 0x%lx, mode = 0%o, dpClass = %d, owner = %@, parent = %p, fsNode = %@, url = [%@]>",
      v21,
      v16,
      v29,
      v28,
      v27,
      v26,
      v10,
      v11,
      v14,
    v23 = v18);

    v6 = v21;
    v9 = v20;

    v24 = v13;
    v13 = v11;
    v11 = (void *)v10;
  }
  else
  {
    v24 = [*(id *)(a1 + 32) url];
    v14 = [v24 path];
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; flags = 0x%lx, ACLConfig = 0x%lx, mode = 0%o, dpClass = %d, owner = %@, parent = %p, fsNode = %@, url = [%@]>",
      v6,
      v7,
      v29,
      v28,
      v27,
      v26,
      v10,
      v11,
      v13,
    v23 = v14);
  }

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSURL *)self->_url copyWithZone:a3];
    v7 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v6;

    *(void *)(v5 + 24) = self->_flags;
    *(void *)(v5 + 32) = self->_ACLConfig;
    *(_WORD *)(v5 + 8) = self->_mode;
    *(_DWORD *)(v5 + 12) = self->_dpClass;
    id v8 = [(MCMPOSIXUser *)self->_owner copyWithZone:a3];
    v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v8;

    objc_storeStrong((id *)(v5 + 48), self->_parent);
    id v10 = [(MCMFSNode *)self->_fsNode copyWithZone:a3];
    v11 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v10;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MCMManagedPath *)a3;
  BOOL v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(MCMManagedPath *)self isEqualToManagedPath:v4];
    }
  }

  return v5;
}

- (BOOL)isEqualToManagedPath:(id)a3
{
  url = self->_url;
  uint64_t v4 = *((void *)a3 + 2);

  return [(NSURL *)url isEqual:v4];
}

- (unint64_t)hash
{
  url = self->_url;

  return [(NSURL *)url hash];
}

- (id)managedPathByAppendingPathComponent:(id)a3 flags:(unint64_t)a4 ACLConfig:(unint64_t)a5 mode:(unsigned __int16)a6 dpClass:(int)a7 owner:(id)a8
{
  uint64_t v8 = *(void *)&a7;
  uint64_t v9 = a6;
  id v14 = a8;
  id v15 = a3;
  v16 = [(MCMManagedPath *)self url];
  v17 = [v16 URLByAppendingPathComponent:v15 isDirectory:1];

  uint64_t v18 = (void *)[objc_alloc((Class)objc_opt_class()) initWithURL:v17 flags:a4 ACLConfig:a5 mode:v9 dpClass:v8 owner:v14 parent:self];

  return v18;
}

- (MCMManagedPath)initWithURL:(id)a3 flags:(unint64_t)a4 ACLConfig:(unint64_t)a5 mode:(unsigned __int16)a6 dpClass:(int)a7 owner:(id)a8 parent:(id)a9
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a8;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)MCMManagedPath;
  uint64_t v18 = [(MCMManagedPath *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_url, a3);
    v19->_flags = a4;
    v19->_ACLConfig = a5;
    v19->_mode = a6;
    v19->_dpClass = a7;
    objc_storeStrong((id *)&v19->_owner, a8);
    objc_storeStrong((id *)&v19->_parent, a9);
    fsNode = v19->_fsNode;
    v19->_fsNode = 0;
  }
  return v19;
}

@end