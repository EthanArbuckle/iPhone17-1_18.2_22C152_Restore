@interface UNNotificationAttachment
+ (BOOL)supportsSecureCoding;
+ (UNNotificationAttachment)attachmentWithIdentifier:(NSString *)identifier URL:(NSURL *)URL options:(NSDictionary *)options error:(NSError *)error;
+ (UNNotificationAttachment)attachmentWithIdentifier:(id)a3 URL:(id)a4 options:(id)a5 userInfo:(id)a6 error:(id *)a7;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)userInfo;
- (NSString)description;
- (NSString)identifier;
- (NSString)type;
- (NSURL)URL;
- (UNNotificationAttachment)init;
- (UNNotificationAttachment)initWithCoder:(id)a3;
- (UNNotificationAttachment)initWithIdentifier:(id)a3 URL:(id)a4 type:(id)a5 options:(id)a6;
- (UNNotificationAttachment)initWithIdentifier:(id)a3 URL:(id)a4 type:(id)a5 options:(id)a6 userInfo:(id)a7;
- (UNNotificationAttachment)initWithIdentifier:(id)a3 family:(unint64_t)a4 URL:(id)a5 type:(id)a6 options:(id)a7;
- (UNNotificationAttachmentOptions)options;
- (id)_encodableURL;
- (unint64_t)family;
- (unint64_t)hash;
- (void)_withSecurityScopeLock:(id)a3;
- (void)addSecurityScope:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enterSecurityScope;
- (void)leaveSecurityScope;
- (void)removeSecurityScope;
@end

@implementation UNNotificationAttachment

+ (UNNotificationAttachment)attachmentWithIdentifier:(NSString *)identifier URL:(NSURL *)URL options:(NSDictionary *)options error:(NSError *)error
{
  return (UNNotificationAttachment *)[a1 attachmentWithIdentifier:identifier URL:URL options:options userInfo:0 error:error];
}

+ (UNNotificationAttachment)attachmentWithIdentifier:(id)a3 URL:(id)a4 options:(id)a5 userInfo:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = objc_msgSend(v14, "bs_safeStringForKey:", @"typeHint");
  if (!v16)
  {
    v17 = [v13 pathExtension];
    if (!v17
      || ([MEMORY[0x1E4F442D8] typeWithFilenameExtension:v17],
          v18 = objc_claimAutoreleasedReturnValue(),
          [v18 identifier],
          v16 = objc_claimAutoreleasedReturnValue(),
          v18,
          !v16))
    {
      v16 = [(id)*MEMORY[0x1E4F44408] identifier];
    }
  }
  uint64_t v19 = UNNotificationAttachmentFamilyFromTypeIdentifier(v16);
  if (v19)
  {
    uint64_t v20 = v19;
    v21 = [v15 objectForKey:@"data"];

    if (v21)
    {
      v22 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v12 URL:v13 type:v16 options:0 userInfo:v15];
      goto LABEL_27;
    }
    v44 = (objc_class *)a1;
    v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    v24 = [v13 path];
    v25 = [v23 attributesOfItemAtPath:v24 error:0];

    v45 = v25;
    v26 = [v25 objectForKey:*MEMORY[0x1E4F28390]];
    unint64_t v27 = UNNotificationAttachmentFamilyMaximumSize(v20);
    if ([v26 unsignedLongValue] > v27)
    {
      if (a7)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "un_errorWithUNErrorCode:userInfo:", 102, 0);
        v22 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
      v39 = v45;
LABEL_26:

      goto LABEL_27;
    }
    v43 = v26;
    v28 = objc_alloc_init(UNMutableNotificationAttachmentOptions);
    v29 = objc_msgSend(v14, "bs_safeNumberForKey:", @"hidden");
    char v30 = [v29 BOOLValue];

    if (v30)
    {
      uint64_t v31 = 1;
      v32 = v44;
    }
    else
    {
      v33 = objc_msgSend(v14, "bs_safeNumberForKey:", @"thumbnailHidden");
      int v34 = [v33 BOOLValue];

      v32 = v44;
      if (!v34)
      {
LABEL_20:
        v35 = objc_msgSend(v14, "bs_safeDictionaryForKey:", @"thumbnailClippingRect");
        v36 = objc_msgSend(v14, "bs_safeDictionaryForKey:", @"thumbnailTime");
        v37 = v36;
        if (v36)
        {
          id v38 = v36;
        }
        else
        {
          objc_msgSend(v14, "bs_safeNumberForKey:", @"thumbnailTime");
          id v38 = (id)objc_claimAutoreleasedReturnValue();
        }
        v40 = v38;

        v41 = [MEMORY[0x1E4F1CA60] dictionary];
        objc_msgSend(v41, "bs_setSafeObject:forKey:", v35, @"thumbnailClippingRect");
        objc_msgSend(v41, "bs_setSafeObject:forKey:", v40, @"thumbnailTime");
        [(UNMutableNotificationAttachmentOptions *)v28 setThumbnailGeneratorUserInfo:v41];
        v22 = (void *)[[v32 alloc] initWithIdentifier:v12 URL:v13 type:v16 options:v28 userInfo:v15];

        v39 = v45;
        v26 = v43;
        goto LABEL_26;
      }
      uint64_t v31 = 2;
    }
    [(UNMutableNotificationAttachmentOptions *)v28 setDisplayLocation:v31];
    goto LABEL_20;
  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "un_errorWithUNErrorCode:userInfo:", 101, 0);
    v22 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
LABEL_27:

  return (UNNotificationAttachment *)v22;
}

- (UNNotificationAttachment)init
{
  return 0;
}

- (UNNotificationAttachment)initWithIdentifier:(id)a3 URL:(id)a4 type:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)UNNotificationAttachment;
  id v14 = [(UNNotificationAttachment *)&v32 init];
  if (v14)
  {
    id v15 = (void *)[v10 copy];
    v16 = v15;
    if (v15)
    {
      v17 = v15;
      identifier = v14->_identifier;
      v14->_identifier = v17;
    }
    else
    {
      identifier = [MEMORY[0x1E4F29128] UUID];
      uint64_t v19 = [identifier UUIDString];
      uint64_t v20 = v14->_identifier;
      v14->_identifier = (NSString *)v19;
    }
    v21 = (void *)[v11 copy];
    v22 = v21;
    if (v21) {
      v23 = v21;
    }
    else {
      v23 = (NSURL *)objc_alloc_init(MEMORY[0x1E4F1CB10]);
    }
    URL = v14->_URL;
    v14->_URL = v23;

    v25 = (void *)[v12 copy];
    v26 = v25;
    if (v25)
    {
      unint64_t v27 = v25;
    }
    else
    {
      unint64_t v27 = [(id)*MEMORY[0x1E4F44408] identifier];
    }
    type = v14->_type;
    v14->_type = v27;

    uint64_t v29 = [v13 copy];
    options = v14->_options;
    v14->_options = (UNNotificationAttachmentOptions *)v29;
  }
  return v14;
}

- (UNNotificationAttachment)initWithIdentifier:(id)a3 family:(unint64_t)a4 URL:(id)a5 type:(id)a6 options:(id)a7
{
  return [(UNNotificationAttachment *)self initWithIdentifier:a3 URL:a5 type:a6 options:a7];
}

- (UNNotificationAttachment)initWithIdentifier:(id)a3 URL:(id)a4 type:(id)a5 options:(id)a6 userInfo:(id)a7
{
  id v12 = a7;
  id v13 = [(UNNotificationAttachment *)self initWithIdentifier:a3 URL:a4 type:a5 options:a6];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    userInfo = v13->_userInfo;
    v13->_userInfo = (NSDictionary *)v14;
  }
  return v13;
}

- (unint64_t)family
{
  v2 = [(UNNotificationAttachment *)self type];
  unint64_t v3 = UNNotificationAttachmentFamilyFromTypeIdentifier(v2);

  return v3;
}

- (void)_withSecurityScopeLock:(id)a3
{
  p_securityScopeLock = &self->_securityScopeLock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_securityScopeLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_securityScopeLock);
}

- (void)addSecurityScope:(id)a3
{
  id v4 = a3;
  v5 = [(UNNotificationAttachment *)self URL];
  v6 = [v5 path];

  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__UNNotificationAttachment_addSecurityScope___block_invoke;
    v7[3] = &unk_1E5F06088;
    v7[4] = self;
    id v8 = v6;
    id v9 = v4;
    [(UNNotificationAttachment *)self _withSecurityScopeLock:v7];
  }
}

uint64_t __45__UNNotificationAttachment_addSecurityScope___block_invoke(void *a1)
{
  *(void *)(a1[4] + 8) = [[UNSecurityScopedURL alloc] initFileURLWithPath:a1[5] sandboxExtensionClass:a1[6]];

  return MEMORY[0x1F41817F8]();
}

- (id)_encodableURL
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = [(UNNotificationAttachment *)self URL];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__UNNotificationAttachment__encodableURL__block_invoke;
  v5[3] = &unk_1E5F06340;
  v5[4] = self;
  v5[5] = &v6;
  [(UNNotificationAttachment *)self _withSecurityScopeLock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__UNNotificationAttachment__encodableURL__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v1) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v1);
  }
}

- (void)removeSecurityScope
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__UNNotificationAttachment_removeSecurityScope__block_invoke;
  v2[3] = &unk_1E5F06368;
  v2[4] = self;
  [(UNNotificationAttachment *)self _withSecurityScopeLock:v2];
}

void __47__UNNotificationAttachment_removeSecurityScope__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void)enterSecurityScope
{
  id v2 = [(UNNotificationAttachment *)self URL];
  [v2 startAccessingSecurityScopedResource];
}

- (void)leaveSecurityScope
{
  id v2 = [(UNNotificationAttachment *)self URL];
  [v2 stopAccessingSecurityScopedResource];
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(UNNotificationAttachment *)self identifier];
  uint64_t v6 = [(UNNotificationAttachment *)self URL];
  v7 = [(UNNotificationAttachment *)self type];
  uint64_t v8 = [(UNNotificationAttachment *)self options];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier: %@, URL: %@, type: %@, options: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
  id v9 = v8);

  return (NSString *)v9;
}

- (unint64_t)hash
{
  id v3 = [(UNNotificationAttachment *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(UNNotificationAttachment *)self URL];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(UNNotificationAttachment *)self type];
  uint64_t v8 = [v7 hash];
  id v9 = [(UNNotificationAttachment *)self options];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  id v11 = [(UNNotificationAttachment *)self userInfo];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = UNSafeCast(v5, v4);

  if (v6)
  {
    v7 = [(UNNotificationAttachment *)self URL];
    uint64_t v8 = [v6 URL];
    if (UNEqualObjects(v7, v8))
    {
      id v9 = [(UNNotificationAttachment *)self identifier];
      uint64_t v10 = [v6 identifier];
      if (UNEqualObjects(v9, v10))
      {
        id v11 = [(UNNotificationAttachment *)self type];
        unint64_t v12 = [v6 type];
        if (UNEqualObjects(v11, v12))
        {
          id v13 = [(UNNotificationAttachment *)self options];
          uint64_t v14 = [v6 options];
          if (UNEqualObjects(v13, v14))
          {
            v18 = [(UNNotificationAttachment *)self userInfo];
            [v6 userInfo];
            id v15 = v19 = v13;
            char v16 = UNEqualObjects(v18, v15);

            id v13 = v19;
          }
          else
          {
            char v16 = 0;
          }
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UNNotificationAttachment *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  uint64_t v6 = [(UNNotificationAttachment *)self _encodableURL];
  [v4 encodeObject:v6 forKey:@"URL"];

  v7 = [(UNNotificationAttachment *)self type];
  [v4 encodeObject:v7 forKey:@"type"];

  uint64_t v8 = [(UNNotificationAttachment *)self options];
  [v4 encodeObject:v8 forKey:@"options"];

  id v9 = [(UNNotificationAttachment *)self userInfo];
  [v4 encodeObject:v9 forKey:@"userInfo"];
}

- (UNNotificationAttachment)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v3 decodeObjectOfClasses:v7 forKey:@"URL"];

  id v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  uint64_t v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"options"];
  id v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  unint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  id v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
  char v16 = [v3 decodeDictionaryWithKeysOfClasses:v11 objectsOfClasses:v15 forKey:@"userInfo"];

  if (v16)
  {
    v17 = [MEMORY[0x1E4F1CA60] dictionary];
    v18 = [v16 objectForKey:@"data"];
    objc_msgSend(v17, "bs_setSafeObject:forKey:", v18, @"data");

    uint64_t v19 = [v16 objectForKey:@"purpose"];
    objc_msgSend(v17, "bs_setSafeObject:forKey:", v19, @"purpose");

    uint64_t v20 = [v16 objectForKey:@"relocationUUID"];
    objc_msgSend(v17, "bs_setSafeObject:forKey:", v20, @"relocationUUID");

    v21 = [v16 objectForKey:@"identityImageStyle"];
    objc_msgSend(v17, "bs_setSafeObject:forKey:", v21, @"identityImageStyle");

    v22 = (void *)[v17 copy];
  }
  else
  {
    v22 = 0;
  }
  v23 = [(UNNotificationAttachment *)self initWithIdentifier:v4 URL:v8 type:v9 options:v10 userInfo:v22];

  return v23;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)type
{
  return self->_type;
}

- (UNNotificationAttachmentOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_securityScopedURL, 0);
}

@end