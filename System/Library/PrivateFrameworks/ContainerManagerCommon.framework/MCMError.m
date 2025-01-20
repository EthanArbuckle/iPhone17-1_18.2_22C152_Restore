@interface MCMError
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMCMError:(id)a3;
- (MCMError)init;
- (MCMError)initWithErrorType:(unint64_t)a3;
- (MCMError)initWithErrorType:(unint64_t)a3 category:(unint64_t)a4;
- (MCMError)initWithErrorType:(unint64_t)a3 category:(unint64_t)a4 path:(id)a5 POSIXerrno:(int)a6;
- (MCMError)initWithLibsystemError:(container_error_extended_s *)a3;
- (MCMError)initWithNSError:(id)a3 url:(id)a4 defaultErrorType:(unint64_t)a5;
- (NSString)path;
- (container_error_extended_s)libsystemError;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fullDescription;
- (int)POSIXerrno;
- (unint64_t)category;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation MCMError

id __23__MCMError_description__block_invoke(uint64_t a1, char a2)
{
  v4 = NSString;
  uint64_t v5 = [*(id *)(a1 + 32) type];
  uint64_t v6 = [*(id *)(a1 + 32) category];
  uint64_t v7 = [*(id *)(a1 + 32) POSIXerrno];
  uint64_t v8 = v7;
  if (a2)
  {
    v9 = [*(id *)(a1 + 32) path];
    v10 = [v4 stringWithFormat:@"(%llu|%llu|%d|[%@])", v5, v6, v8, v9];
  }
  else
  {
    v10 = [v4 stringWithFormat:@"(%llu|%llu|%d|[%@])", v5, v6, v7, @"~~"];
  }

  return v10;
}

- (NSString)path
{
  return self->_path;
}

- (unint64_t)category
{
  return self->_category;
}

- (int)POSIXerrno
{
  return self->_POSIXerrno;
}

- (id)description
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __23__MCMError_description__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  p_path = &self->_path;

  objc_storeStrong((id *)p_path, 0);
}

- (MCMError)initWithErrorType:(unint64_t)a3 category:(unint64_t)a4
{
  return [(MCMError *)self initWithErrorType:a3 category:a4 path:0 POSIXerrno:0];
}

- (MCMError)initWithErrorType:(unint64_t)a3 category:(unint64_t)a4 path:(id)a5 POSIXerrno:(int)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  if (a3 == 1)
  {
    v12 = 0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)MCMError;
    v13 = [(MCMError *)&v16 init];
    v14 = v13;
    if (v13)
    {
      v13->_type = a3;
      v13->_category = a4;
      objc_storeStrong((id *)&v13->_path, a5);
      v14->_POSIXerrno = a6;
    }
    self = v14;
    v12 = self;
  }

  return v12;
}

- (MCMError)initWithErrorType:(unint64_t)a3
{
  return [(MCMError *)self initWithErrorType:a3 category:0 path:0 POSIXerrno:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    *(void *)(v5 + 16) = self->_type;
    *(void *)(v5 + 24) = self->_category;
    uint64_t v7 = [(NSString *)self->_path copyWithZone:a3];
    uint64_t v8 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v7;

    *(_DWORD *)(v6 + 8) = self->_POSIXerrno;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MCMError *)a3;
  BOOL v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(MCMError *)self isEqualToMCMError:v4];
    }
  }

  return v5;
}

- (BOOL)isEqualToMCMError:(id)a3
{
  v4 = a3;
  path = self->_path;
  if (!path) {
    goto LABEL_4;
  }
  if (!v4[4])
  {
    LOBYTE(path) = 0;
    goto LABEL_6;
  }
  LOBYTE(path) = -[NSString isEqualToString:](path, "isEqualToString:");
  if (self->_path)
  {
LABEL_6:
    BOOL v6 = 0;
    goto LABEL_7;
  }
LABEL_4:
  BOOL v6 = v4[4] == 0;
LABEL_7:
  if (self->_type == v4[2] && self->_category == v4[3])
  {
    char v7 = path | v6;
    if (self->_POSIXerrno == *((_DWORD *)v4 + 2)) {
      BOOL v8 = v7;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t type = self->_type;
  unint64_t category = self->_category;
  return category ^ type ^ [(NSString *)self->_path hash];
}

- (id)fullDescription
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__MCMError_fullDescription__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return v4;
}

id __27__MCMError_fullDescription__block_invoke(uint64_t a1, char a2)
{
  v4 = NSString;
  BOOL v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  char v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v7 type];
  uint64_t v9 = [*(id *)(a1 + 32) category];
  uint64_t v10 = [*(id *)(a1 + 32) POSIXerrno];
  uint64_t v11 = v10;
  if (a2)
  {
    v12 = [*(id *)(a1 + 32) path];
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; unint64_t type = %llu, category = %llu, POSIX errno = %d, path = [%@]>",
      v6,
      v7,
      v8,
      v9,
      v11,
    v13 = v12);
  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; unint64_t type = %llu, category = %llu, POSIX errno = %d, path = [%@]>",
      v6,
      v7,
      v8,
      v9,
      v10,
    v13 = @"~~");
  }

  return v13;
}

- (container_error_extended_s)libsystemError
{
  [(MCMError *)self category];
  [(MCMError *)self type];
  id v3 = [(MCMError *)self path];
  [v3 fileSystemRepresentation];
  [(MCMError *)self POSIXerrno];
  v4 = (container_error_extended_s *)container_error_create();

  return v4;
}

- (MCMError)initWithNSError:(id)a3 url:(id)a4 defaultErrorType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v18 = 0;
    goto LABEL_14;
  }
  uint64_t v10 = [v8 domain];
  int v11 = [v10 isEqual:*MEMORY[0x1E4F28798]];

  if (v11)
  {
    v12 = [v9 path];
    uint64_t v13 = [v8 code];
    v14 = self;
    unint64_t v15 = a5;
    uint64_t v16 = 1;
    uint64_t v17 = v12;
LABEL_4:
    self = [(MCMError *)v14 initWithErrorType:v15 category:v16 path:v17 POSIXerrno:v13];

    v18 = self;
    goto LABEL_14;
  }
  v19 = [v8 domain];
  if ([v19 isEqual:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v20 = [v8 code];

    if (v20 == 2048)
    {
      v12 = [v9 path];
      v14 = self;
      unint64_t v15 = a5;
      uint64_t v16 = 5;
      uint64_t v17 = v12;
      uint64_t v13 = 100;
      goto LABEL_4;
    }
  }
  else
  {
  }
  v21 = [v8 domain];
  int v22 = [v21 isEqual:@"MCMErrorDomain"];

  if (v22)
  {
    unint64_t v23 = [v8 code];
    v24 = self;
  }
  else
  {
    v24 = self;
    unint64_t v23 = a5;
  }
  self = [(MCMError *)v24 initWithErrorType:v23];
  v18 = self;
LABEL_14:

  return v18;
}

- (MCMError)init
{
  return [(MCMError *)self initWithErrorType:1 category:0 path:0 POSIXerrno:0];
}

- (MCMError)initWithLibsystemError:(container_error_extended_s *)a3
{
  if (a3)
  {
    uint64_t type = container_error_get_type();
    uint64_t category = container_error_get_category();
    uint64_t posix_errno = container_error_get_posix_errno();
    uint64_t path = container_error_get_path();
    if (path)
    {
      id v8 = [NSString stringWithUTF8String:path];
    }
    else
    {
      id v8 = 0;
    }
    self = [(MCMError *)self initWithErrorType:type category:category path:v8 POSIXerrno:posix_errno];

    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end