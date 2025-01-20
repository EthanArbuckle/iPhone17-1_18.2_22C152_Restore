@interface _EXPromise
+ (BOOL)supportsSecureCoding;
- (NSUUID)identifier;
- (_EXPromise)initWithCoder:(id)a3;
- (_EXPromise)initWithPromiseBlock:(id)a3;
- (id)promiseBlock;
- (id)resolveObjectOfClass:(Class)a3 error:(id *)a4;
- (id)resolveObjectOfClasses:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)resolveObjectOfClass:(Class)a3 completion:(id)a4;
- (void)resolveObjectOfClasses:(id)a3 completion:(id)a4;
@end

@implementation _EXPromise

- (_EXPromise)initWithPromiseBlock:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_EXPromise;
  v5 = [(_EXPromise *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __35___EXPromise_initWithPromiseBlock___block_invoke;
    aBlock[3] = &unk_1E573D4D8;
    id v12 = v4;
    v8 = _Block_copy(aBlock);
    id promiseBlock = v5->_promiseBlock;
    v5->_id promiseBlock = v8;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = _EXDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138543362;
    v8 = identifier;
  }

  v5 = +[_EXPromiseManager sharedInstance];
  [v5 unregisterPromise:self];

  v6.receiver = self;
  v6.super_class = (Class)_EXPromise;
  [(_EXPromise *)&v6 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_identifier = &self->_identifier;
  [v4 encodeObject:self->_identifier forKey:@"identifier"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = _EXDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_EXPromise encodeWithCoder:]((uint64_t)p_identifier, v12, v13, v14, v15, v16, v17, v18);
    }

    id v19 = objc_alloc(MEMORY[0x1E4F1CA00]);
    objc_exception_throw((id)[v19 initWithName:@"EXPromiseCoderException" reason:@"This class may only be encoded by an NSXPCCoder" userInfo:MEMORY[0x1E4F1CC08]]);
  }
  id v6 = v4;
  v7 = _EXDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v6 connection];
    int v20 = 138543362;
    v21 = v8;
    _os_log_impl(&dword_191F29000, v7, OS_LOG_TYPE_DEFAULT, "Registering promise to send over XPC connection: %{public}@", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v9 = +[_EXPromiseManager sharedInstance];
  [v9 registerPromise:self];

  v10 = +[_EXPromiseManager sharedInstance];
  v11 = [v10 endpoint];
  [v6 encodeObject:v11 forKey:@"endpoint"];
}

- (_EXPromise)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_EXPromise;
  v5 = [(_EXPromise *)&v19 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpoint"];
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F1CA00]);
    }
    uint64_t v9 = (void *)v7;
    objc_storeStrong((id *)&v5->_identifier, v6);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __28___EXPromise_initWithCoder___block_invoke;
    v16[3] = &unk_1E573D500;
    id v17 = v6;
    id v18 = v9;
    id v10 = v9;
    id v11 = v6;
    id v12 = _Block_copy(v16);
    id promiseBlock = v5->_promiseBlock;
    v5->_id promiseBlock = v12;
  }
  return v5;
}

- (id)resolveObjectOfClass:(Class)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  uint64_t v7 = [(_EXPromise *)self resolveObjectOfClasses:v6 error:a4];

  return v7;
}

- (void)resolveObjectOfClass:(Class)a3 completion:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = [v6 setWithObject:a3];
  [(_EXPromise *)self resolveObjectOfClasses:v8 completion:v7];
}

- (id)resolveObjectOfClasses:(id)a3 error:(id *)a4
{
  id v6 = (*((void (**)(void))self->_promiseBlock + 2))();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43___EXPromise_resolveObjectOfClasses_error___block_invoke;
  aBlock[3] = &unk_1E573D528;
  id v7 = v6;
  id v12 = v7;
  id v8 = _Block_copy(aBlock);
  id promiseBlock = self->_promiseBlock;
  self->_id promiseBlock = v8;

  if (a4 && !v7)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.extensionKit.errorDomain" code:9 userInfo:MEMORY[0x1E4F1CC08]];
  }

  return v7;
}

- (void)resolveObjectOfClasses:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, id, void))a4;
  id promiseBlock = (void (**)(void))self->_promiseBlock;
  id v17 = 0;
  id v7 = promiseBlock[2]();
  id v8 = v17;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __48___EXPromise_resolveObjectOfClasses_completion___block_invoke;
  id v15 = &unk_1E573D550;
  id v9 = v7;
  id v16 = v9;
  id v10 = _Block_copy(&v12);
  id v11 = self->_promiseBlock;
  self->_id promiseBlock = v10;

  if (v9)
  {
    v5[2](v5, v9, 0);
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.extensionKit.errorDomain", 9, MEMORY[0x1E4F1CC08], v12, v13, v14, v15);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    ((void (**)(id, id, id))v5)[2](v5, 0, v8);
  }
}

- (id)promiseBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong(&self->_promiseBlock, 0);
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end