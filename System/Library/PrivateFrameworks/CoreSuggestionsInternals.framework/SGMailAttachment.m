@interface SGMailAttachment
+ (id)attachmentWithType:(id)a3 filename:(id)a4 path:(id)a5;
+ (id)attachmentsFromBiomeAttachments:(id)a3;
+ (id)attachmentsFromSearchableItem:(id)a3;
+ (id)testAttachmentWithType:(id)a3 size:(unint64_t)a4;
- (BOOL)isApplicationMimeType;
- (BOOL)isCalendarMimeType;
- (BOOL)isDownloadedLocally;
- (BOOL)isMediaMimeType;
- (BOOL)isOthersMimeType;
- (BOOL)isWalletOrderMimeType;
- (BOOL)isWalletPassMimeType;
- (NSString)filename;
- (NSString)path;
- (NSString)type;
- (SGMailAttachment)initWithType:(id)a3 filename:(id)a4 path:(id)a5;
- (id)description;
- (id)mimeCategory;
- (unint64_t)size;
- (void)setSize:(unint64_t)a3;
@end

@implementation SGMailAttachment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (BOOL)isDownloadedLocally
{
  return self->_isDownloadedLocally;
}

- (NSString)path
{
  return self->_path;
}

- (unint64_t)size
{
  return self->_size;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)type
{
  return self->_type;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@ type:%@ path:%@>", v5, self->_type, self->_path];

  return v6;
}

- (id)mimeCategory
{
  v2 = [(NSString *)self->_type componentsSeparatedByString:@"/"];
  id v3 = [v2 firstObject];

  return v3;
}

- (BOOL)isOthersMimeType
{
  if ([(SGMailAttachment *)self isApplicationMimeType]) {
    return 0;
  }
  else {
    return ![(SGMailAttachment *)self isMediaMimeType];
  }
}

- (BOOL)isWalletOrderMimeType
{
  if ([(NSString *)self->_type isEqualToString:@"application/com.apple.finance.order"]
    || [(NSString *)self->_type isEqualToString:@"application/vnd.apple.finance.order"]
    || [(NSString *)self->_type isEqualToString:@"com.apple.finance.order-data"]
    || [(NSString *)self->_type isEqualToString:@"vnd.apple.finance.order-data"])
  {
    return 1;
  }
  type = self->_type;
  return [(NSString *)type containsString:@"octet-stream"];
}

- (BOOL)isMediaMimeType
{
  id v3 = (void *)MEMORY[0x1CB79B230](self, a2);
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"image", @"audio", @"video", 0);
  v5 = [(SGMailAttachment *)self mimeCategory];
  LOBYTE(v3) = [v4 containsObject:v5];

  return (char)v3;
}

- (BOOL)isWalletPassMimeType
{
  if ([(NSString *)self->_type isEqualToString:@"application/com.apple.pkpass"]) {
    return 1;
  }
  type = self->_type;
  return [(NSString *)type isEqualToString:@"application/vnd.apple.pkpass"];
}

- (BOOL)isApplicationMimeType
{
  v2 = [(SGMailAttachment *)self mimeCategory];
  char v3 = [v2 isEqualToString:@"application"];

  return v3;
}

- (BOOL)isCalendarMimeType
{
  return [(NSString *)self->_type isEqualToString:@"text/calendar"];
}

- (SGMailAttachment)initWithType:(id)a3 filename:(id)a4 path:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SGMailAttachment;
  v12 = [(SGMailAttachment *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_type, a3);
    objc_storeStrong((id *)&v13->_filename, a4);
    if ([v11 length])
    {
      objc_storeStrong((id *)&v13->_path, a5);
      v13->_isDownloadedLocally = 1;
      v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v21 = 0;
      v15 = [v14 attributesOfItemAtPath:v11 error:&v21];
      id v16 = v21;
      v13->_size = [v15 fileSize];

      if (v16)
      {
        v17 = sgLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v20 = [v16 localizedDescription];
          *(_DWORD *)buf = 138412290;
          v24 = v20;
          _os_log_error_impl(&dword_1CA650000, v17, OS_LOG_TYPE_ERROR, "Error getting file size from path: %@", buf, 0xCu);
        }
        v13->_size = 0;
      }
    }
    else
    {
      path = v13->_path;
      v13->_path = 0;

      v13->_isDownloadedLocally = 0;
      v13->_size = 0;
    }
  }

  return v13;
}

+ (id)testAttachmentWithType:(id)a3 size:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithType:v6 filename:@"test" path:@"testpath"];

  [v7 setSize:a4];
  return v7;
}

+ (id)attachmentsFromSearchableItem:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v4 = [a3 attributeSet];
  v5 = [v4 attachmentTypes];
  uint64_t v6 = [v5 count];

  v7 = [v4 attachmentNames];
  uint64_t v8 = [v7 count];

  id v9 = [v4 attachmentPaths];
  uint64_t v10 = [v9 count];

  if (v6 == v8 && v6 == v10)
  {
    uint64_t v11 = objc_opt_new();
    v12 = (void *)v11;
    if (v6)
    {
      uint64_t v13 = 0;
      id v24 = a1;
      uint64_t v25 = (void *)v11;
      do
      {
        v14 = objc_msgSend(v4, "attachmentTypes", v24);
        v15 = [v14 objectAtIndexedSubscript:v13];
        id v16 = [v4 attachmentNames];
        v17 = [v16 objectAtIndexedSubscript:v13];
        v18 = [v4 attachmentPaths];
        v19 = [v18 objectAtIndexedSubscript:v13];
        [v24 attachmentWithType:v15 filename:v17 path:v19];
        id v21 = v20 = v6;
        [v25 addObject:v21];

        uint64_t v6 = v20;
        ++v13;
      }
      while (v20 != v13);
      v12 = v25;
    }
  }
  else
  {
    objc_super v22 = sgLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v27 = v6;
      __int16 v28 = 2048;
      uint64_t v29 = v8;
      __int16 v30 = 2048;
      uint64_t v31 = v10;
      _os_log_error_impl(&dword_1CA650000, v22, OS_LOG_TYPE_ERROR, "Attachment info length mismatch: %lu types, %lu names, %lu paths", buf, 0x20u);
    }

    v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

+ (id)attachmentsFromBiomeAttachments:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__SGMailAttachment_attachmentsFromBiomeAttachments___block_invoke;
  v5[3] = &__block_descriptor_40_e29__16__0__BMContentAttachment_8l;
  v5[4] = a1;
  char v3 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v5);
  return v3;
}

id __52__SGMailAttachment_attachmentsFromBiomeAttachments___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v3 type];
  v5 = [v3 filename];
  uint64_t v6 = [v3 path];

  v7 = [v2 attachmentWithType:v4 filename:v5 path:v6];

  return v7;
}

+ (id)attachmentWithType:(id)a3 filename:(id)a4 path:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithType:v10 filename:v9 path:v8];

  return v11;
}

@end