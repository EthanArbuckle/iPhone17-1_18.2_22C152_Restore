@interface LCSSessionPath
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)finalizedSessionPathsWithType:(unint64_t)a3;
+ (id)temporarySessionPathWithType:(unint64_t)a3;
- (BOOL)_lock_purgeContentsIncludingDirectory:(BOOL)a3;
- (BOOL)isTemporaryPath;
- (LCSSessionPath)initWithBSXPCCoder:(id)a3;
- (LCSSessionPath)initWithCoder:(id)a3;
- (NSURL)url;
- (id)_initWithURL:(id)a3 type:(unint64_t)a4 isTemporaryPath:(BOOL)a5;
- (id)finalizeTemporarySessionPathForExtension:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
@end

@implementation LCSSessionPath

+ (id)temporarySessionPathWithType:(unint64_t)a3
{
  v4 = @"com.apple.GenericSession";
  if (a3 == 1) {
    v4 = @"com.apple.SecureCapture";
  }
  v5 = v4;
  v6 = [[LCSSessionURLBuilder alloc] initWithTypeIdentifier:v5];

  v7 = [(LCSSessionURLBuilder *)v6 temporarySessionURL];
  if (v7)
  {
    v8 = [MEMORY[0x263F08850] defaultManager];
    id v14 = 0;
    char v9 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v14];
    v10 = v14;

    if (v9)
    {
      id v11 = [[LCSSessionPath alloc] _initWithURL:v7 type:a3 isTemporaryPath:1];
      goto LABEL_12;
    }
    v12 = LCSLogSessionContents();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[LCSSessionPath temporarySessionPathWithType:]((uint64_t)v7, v12);
    }
  }
  else
  {
    v10 = LCSLogSessionContents();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[LCSSessionPath temporarySessionPathWithType:](v10);
    }
  }
  id v11 = 0;
LABEL_12:

  return v11;
}

+ (id)finalizedSessionPathsWithType:(unint64_t)a3
{
  v4 = @"com.apple.GenericSession";
  if (a3 == 1) {
    v4 = @"com.apple.SecureCapture";
  }
  v5 = v4;
  v6 = [[LCSSessionURLBuilder alloc] initWithTypeIdentifier:v5];

  v7 = [(LCSSessionURLBuilder *)v6 finalizedSessionURLsForCurrentApplication];
  if ([v7 count])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__LCSSessionPath_finalizedSessionPathsWithType___block_invoke;
    v10[3] = &__block_descriptor_40_e15__16__0__NSURL_8l;
    v10[4] = a3;
    v8 = objc_msgSend(v7, "bs_map:", v10);
  }
  else
  {
    v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

id __48__LCSSessionPath_finalizedSessionPathsWithType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[LCSSessionPath alloc] _initWithURL:v3 type:*(void *)(a1 + 32) isTemporaryPath:0];

  return v4;
}

- (id)_initWithURL:(id)a3 type:(unint64_t)a4 isTemporaryPath:(BOOL)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LCSSessionPath;
  char v9 = [(LCSSessionPath *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_type = a4;
    v9->_isTemporaryPath = a5;
    uint64_t v11 = [v8 copy];
    url = v10->_url;
    v10->_url = (NSURL *)v11;
  }
  return v10;
}

- (id)finalizeTemporarySessionPathForExtension:(id)a3
{
  id v4 = a3;
  v5 = [(LCSSessionPath *)self url];
  v6 = +[LCSSessionFinalizer finalizeTemporarySessionAtURL:v5 forBundleProvider:v4];

  if (v6) {
    id v7 = [[LCSSessionPath alloc] _initWithURL:v6 type:self->_type isTemporaryPath:0];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isTemporaryPath
{
  return self->_isTemporaryPath;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_lock_isInvalidating = &self->_lock_isInvalidating;
  if (!self->_lock_isInvalidating)
  {
    BOOL isTemporaryPath = self->_isTemporaryPath;
    p_lock_invalidated = &self->_lock_isInvalidating;
    if (!self->_isTemporaryPath)
    {
      p_lock_invalidated = &self->_lock_invalidated;
      if (self->_lock_invalidated) {
        goto LABEL_7;
      }
      BOOL *p_lock_isInvalidating = 1;
    }
    BOOL *p_lock_invalidated = 1;
    if (![(LCSSessionPath *)self _lock_purgeContentsIncludingDirectory:!isTemporaryPath])self->_lock_invalidated = 0; {
    BOOL *p_lock_isInvalidating = 0;
    }
  }
LABEL_7:
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_lock_purgeContentsIncludingDirectory:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v45 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_lock);
  if (v3)
  {
    v5 = [MEMORY[0x263F08850] defaultManager];
    url = self->_url;
    id v41 = 0;
    char v7 = [v5 removeItemAtURL:url error:&v41];
    id v8 = v41;

    if (v7)
    {
LABEL_3:
      BOOL v9 = 1;
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__0;
    v39 = __Block_byref_object_dispose__0;
    id v40 = [MEMORY[0x263EFF9A0] dictionary];
    v10 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v11 = self->_url;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __56__LCSSessionPath__lock_purgeContentsIncludingDirectory___block_invoke;
    v34[3] = &unk_2653BEC98;
    v34[4] = &v35;
    v12 = [v10 enumeratorAtURL:v11 includingPropertiesForKeys:0 options:3 errorHandler:v34];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v13 = v12;
    id v8 = 0;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v31;
      while (2)
      {
        uint64_t v16 = 0;
        v17 = v8;
        do
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * v16);
          v19 = [MEMORY[0x263F08850] defaultManager];
          id v29 = v17;
          char v20 = [v19 removeItemAtURL:v18 error:&v29];
          id v8 = v29;

          if ((v20 & 1) == 0)
          {
            LOBYTE(v14) = 0;
            goto LABEL_14;
          }
          ++v16;
          v17 = v8;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v44 count:16];
        if (v14) {
          continue;
        }
        break;
      }
      LOBYTE(v14) = 1;
    }
LABEL_14:

    if ([(id)v36[5] count])
    {
      uint64_t v14 = [NSString stringWithFormat:@"Failed to purge one or more contents of %@", self->_url];
      v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = *MEMORY[0x263F083F0];
      v42[0] = *MEMORY[0x263F08320];
      v42[1] = v22;
      v43[0] = v14;
      v23 = [(id)v36[5] allValues];
      v24 = (void *)[v23 copy];
      v43[1] = v24;
      v25 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
      uint64_t v26 = [v21 errorWithDomain:@"com.apple.LCSSessionPath" code:-1 userInfo:v25];

      LOBYTE(v14) = 0;
      id v8 = (id)v26;
    }

    _Block_object_dispose(&v35, 8);
    if (v14) {
      goto LABEL_3;
    }
  }
  v27 = LCSLogSessionContents();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    [(LCSSessionPath *)(uint64_t)self _lock_purgeContentsIncludingDirectory:v27];
  }

  BOOL v9 = 0;
LABEL_20:

  return v9;
}

uint64_t __56__LCSSessionPath__lock_purgeContentsIncludingDirectory___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LCSSessionPath)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    uint64_t v8 = [v4 decodeBoolForKey:@"isTemporaryPath"];
    BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v10 = v9;
    if (!v9 || (unint64_t v11 = [v9 integerValue], v11 > 1)) {
      unint64_t v11 = 0;
    }
    char v7 = [(LCSSessionPath *)self _initWithURL:v6 type:v11 isTemporaryPath:v8];
  }
  else
  {
    id v6 = [(LCSSessionPath *)self _initWithURL:0 type:0 isTemporaryPath:1];
    [v6 invalidate];
    char v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v5 = a3;
  [v5 encodeObject:url forKey:@"url"];
  [v5 encodeBool:self->_isTemporaryPath forKey:@"isTemporaryPath"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_type];
  [v5 encodeObject:v6 forKey:@"type"];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (LCSSessionPath)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    uint64_t v8 = [v4 decodeBoolForKey:@"isTemporaryPath"];
    BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v10 = v9;
    if (!v9 || (unint64_t v11 = [v9 integerValue], v11 > 1)) {
      unint64_t v11 = 0;
    }
    char v7 = [(LCSSessionPath *)self _initWithURL:v6 type:v11 isTemporaryPath:v8];
  }
  else
  {
    id v6 = [(LCSSessionPath *)self _initWithURL:0 type:0 isTemporaryPath:1];
    [v6 invalidate];
    char v7 = 0;
  }

  return v7;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  url = self->_url;
  id v5 = a3;
  [v5 encodeObject:url forKey:@"url"];
  [v5 encodeBool:self->_isTemporaryPath forKey:@"isTemporaryPath"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_type];
  [v5 encodeObject:v6 forKey:@"type"];
}

- (void).cxx_destruct
{
}

+ (void)temporarySessionPathWithType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_255087000, log, OS_LOG_TYPE_ERROR, "Unable to resolve a temporary session path", v1, 2u);
}

+ (void)temporarySessionPathWithType:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_255087000, a2, OS_LOG_TYPE_ERROR, "Unable to create directory for session path: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_lock_purgeContentsIncludingDirectory:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_255087000, log, OS_LOG_TYPE_ERROR, "Unable to purge contents of path %@: %@", (uint8_t *)&v3, 0x16u);
}

@end