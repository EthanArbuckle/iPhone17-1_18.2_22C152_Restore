@interface _DPDediscoError
+ (id)errorWithCode:(int64_t)a3 description:(id)a4;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5;
- (BOOL)logAndStoreInError:(id *)a3;
- (_DPDediscoError)initWithCode:(int64_t)a3 description:(id)a4;
- (_DPDediscoError)initWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5;
@end

@implementation _DPDediscoError

- (_DPDediscoError)initWithCode:(int64_t)a3 description:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = *MEMORY[0x1E4F28568];
  v13[0] = a4;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11.receiver = self;
  v11.super_class = (Class)_DPDediscoError;
  v9 = [(_DPDediscoError *)&v11 initWithDomain:@"com.apple.DPDedisco" code:a3 userInfo:v8];

  return v9;
}

- (_DPDediscoError)initWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  v27[2] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v9 = *MEMORY[0x1E4F28A50];
    v26[0] = *MEMORY[0x1E4F28568];
    v26[1] = v9;
    v27[0] = a5;
    v27[1] = a4;
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    id v11 = a5;
    id v12 = a4;
    v13 = (id *)v27;
    v14 = v26;
    v15 = v10;
    uint64_t v16 = 2;
  }
  else
  {
    uint64_t v24 = *MEMORY[0x1E4F28568];
    id v25 = a5;
    v17 = (void *)MEMORY[0x1E4F1C9E8];
    id v18 = a5;
    id v19 = 0;
    v13 = &v25;
    v14 = &v24;
    v15 = v17;
    uint64_t v16 = 1;
  }
  v20 = [v15 dictionaryWithObjects:v13 forKeys:v14 count:v16];
  v23.receiver = self;
  v23.super_class = (Class)_DPDediscoError;
  v21 = [(_DPDediscoError *)&v23 initWithDomain:@"com.apple.DPDedisco" code:a3 userInfo:v20];

  return v21;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  id v5 = a4;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCode:a3 description:v5];

  return v6;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCode:a3 underlyingError:v8 description:v7];

  return v9;
}

- (BOOL)logAndStoreInError:(id *)a3
{
  id v5 = +[_DPLog service];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_DPSemanticVersion initWithString:error:]((uint64_t)self, v5);
  }

  if (a3) {
    *a3 = self;
  }
  return 1;
}

@end