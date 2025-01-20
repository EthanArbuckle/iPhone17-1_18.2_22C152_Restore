@interface DEAttachmentItem
+ (BOOL)supportsSecureCoding;
+ (id)attachmentWithPath:(id)a3;
+ (id)attachmentWithPath:(id)a3 withDisplayName:(id)a4 modificationDate:(id)a5 andFilesize:(id)a6;
+ (id)attachmentWithPathURL:(id)a3;
- (DEAttachmentItem)init;
- (DEAttachmentItem)initWithCoder:(id)a3;
- (DEAttachmentItem)initWithPath:(id)a3;
- (DEAttachmentItem)initWithPath:(id)a3 withDisplayName:(id)a4 modificationDate:(id)a5 andFilesize:(id)a6;
- (DEAttachmentItem)initWithPathURL:(id)a3;
- (DEAttachmentItem)initWithPathURL:(id)a3 shouldCheckURLAttributes:(BOOL)a4;
- (NSDate)modificationDate;
- (NSNumber)deleteOnAttach;
- (NSNumber)filesize;
- (NSNumber)shouldCompress;
- (NSString)_sandboxExtensionToken;
- (NSString)attachmentType;
- (NSString)displayName;
- (NSURL)attachedPath;
- (NSURL)path;
- (id)attachToDestinationDir:(id)a3;
- (id)description;
- (id)sandboxExtensionHandleWithErrorOut:(id *)a3;
- (void)_generateSandboxExtensionTokenForPID:(int)a3;
- (void)detach;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachedPath:(id)a3;
- (void)setAttachmentType:(id)a3;
- (void)setDeleteOnAttach:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setFilesize:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setPath:(id)a3;
- (void)setShouldCompress:(id)a3;
@end

@implementation DEAttachmentItem

- (DEAttachmentItem)init
{
  v14.receiver = self;
  v14.super_class = (Class)DEAttachmentItem;
  v2 = [(DEAttachmentItem *)&v14 init];
  v3 = v2;
  if (v2)
  {
    displayName = v2->_displayName;
    v2->_displayName = 0;

    path = v3->_path;
    v3->_path = 0;

    shouldCompress = v3->_shouldCompress;
    v7 = (NSNumber *)MEMORY[0x1E4F1CC28];
    v3->_shouldCompress = (NSNumber *)MEMORY[0x1E4F1CC28];

    modificationDate = v3->_modificationDate;
    v3->_modificationDate = 0;

    filesize = v3->_filesize;
    v3->_filesize = 0;

    attachedPath = v3->_attachedPath;
    v3->_attachedPath = 0;

    attachmentType = v3->_attachmentType;
    v3->_attachmentType = (NSString *)@"DEAttachmentTypeItem";

    deleteOnAttach = v3->_deleteOnAttach;
    v3->_deleteOnAttach = v7;
  }
  return v3;
}

- (DEAttachmentItem)initWithPath:(id)a3
{
  v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  v5 = [(DEAttachmentItem *)self initWithPathURL:v4];

  return v5;
}

- (DEAttachmentItem)initWithPathURL:(id)a3
{
  return [(DEAttachmentItem *)self initWithPathURL:a3 shouldCheckURLAttributes:1];
}

- (DEAttachmentItem)initWithPathURL:(id)a3 shouldCheckURLAttributes:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v35 = 0;
  int v7 = [v6 checkResourceIsReachableAndReturnError:&v35];
  id v8 = v35;
  if (!v7)
  {
    if (!v4)
    {
LABEL_20:
      id v15 = 0;
      id v19 = 0;
      id v10 = 0;
      goto LABEL_21;
    }
    v20 = +[DELogging fwHandle];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[DEAttachmentItem initWithPathURL:shouldCheckURLAttributes:].cold.4();
    }
LABEL_19:

    goto LABEL_20;
  }
  if (!v4)
  {
    v20 = +[DELogging fwHandle];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v37 = v6;
      _os_log_impl(&dword_1A7E51000, v20, OS_LOG_TYPE_DEFAULT, "Not checking attributes on %{public}@", buf, 0xCu);
    }
    goto LABEL_19;
  }
  id v34 = 0;
  uint64_t v9 = *MEMORY[0x1E4F1C530];
  id v33 = 0;
  [v6 getResourceValue:&v34 forKey:v9 error:&v33];
  id v10 = v34;
  id v11 = v33;
  if (v11)
  {
    v12 = v11;
    v13 = +[DELogging fwHandle];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[DEAttachmentItem initWithPathURL:shouldCheckURLAttributes:]();
    }
  }
  id v32 = 0;
  uint64_t v14 = *MEMORY[0x1E4F1C628];
  id v31 = 0;
  [v6 getResourceValue:&v32 forKey:v14 error:&v31];
  id v15 = v32;
  id v16 = v31;
  if (v16)
  {
    v17 = v16;
    v18 = +[DELogging fwHandle];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[DEAttachmentItem initWithPathURL:shouldCheckURLAttributes:]();
    }
  }
  if (v15 && [v15 BOOLValue])
  {
    objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", +[DEUtils getDirectorySize:](DEUtils, "getDirectorySize:", v6));
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v30 = 0;
    uint64_t v25 = *MEMORY[0x1E4F1C5F8];
    id v29 = 0;
    [v6 getResourceValue:&v30 forKey:v25 error:&v29];
    id v19 = v30;
    id v26 = v29;
    if (v26)
    {
      v27 = v26;
      v28 = +[DELogging fwHandle];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[DEAttachmentItem initWithPathURL:shouldCheckURLAttributes:]();
      }
    }
  }
LABEL_21:
  v21 = +[DELogging fwHandle];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v37 = v6;
    __int16 v38 = 2112;
    id v39 = v10;
    __int16 v40 = 2112;
    id v41 = v19;
    _os_log_impl(&dword_1A7E51000, v21, OS_LOG_TYPE_DEFAULT, "New attachment at path: [%{public}@] mod date: %@ size: %@", buf, 0x20u);
  }

  v22 = [v6 lastPathComponent];
  v23 = [(DEAttachmentItem *)self initWithPath:v6 withDisplayName:v22 modificationDate:v10 andFilesize:v19];

  return v23;
}

- (void)_generateSandboxExtensionTokenForPID:(int)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v5 = [(DEAttachmentItem *)self deleteOnAttach];
  [v5 BOOLValue];

  id v6 = [(DEAttachmentItem *)self path];
  uint64_t v7 = [v6 fileSystemRepresentation];

  if (v7)
  {
    id v8 = [(DEAttachmentItem *)self path];
    id v32 = 0;
    char v9 = [v8 checkResourceIsReachableAndReturnError:&v32];
    id v10 = v32;

    if (v9)
    {
      uint64_t v11 = sandbox_extension_issue_file_to_process_by_pid();
      v12 = +[DELogging fwHandle];
      v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v25 = [(DEAttachmentItem *)self deleteOnAttach];
          int v26 = [v25 BOOLValue];
          v27 = "R";
          *(_DWORD *)buf = 136315650;
          if (v26) {
            v27 = "RW";
          }
          id v34 = v27;
          __int16 v35 = 2082;
          uint64_t v36 = v7;
          __int16 v37 = 1024;
          int v38 = a3;
          _os_log_debug_impl(&dword_1A7E51000, v13, OS_LOG_TYPE_DEBUG, "Granted %s sandbox extension for attachment item '%{public}s' to process with PID: %d.", buf, 0x1Cu);
        }
        uint64_t v14 = [NSString stringWithUTF8String:v11];
        sandboxExtensionToken = self->__sandboxExtensionToken;
        self->__sandboxExtensionToken = v14;

        id v16 = (void *)v11;
LABEL_6:
        free(v16);
        goto LABEL_12;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v28 = [(DEAttachmentItem *)self deleteOnAttach];
        if ([v28 BOOLValue]) {
          id v29 = "RW";
        }
        else {
          id v29 = "R";
        }
        id v30 = __error();
        id v31 = strerror(*v30);
        *(_DWORD *)buf = 136315906;
        id v34 = v29;
        __int16 v35 = 2082;
        uint64_t v36 = v7;
        __int16 v37 = 1024;
        int v38 = a3;
        __int16 v39 = 2080;
        __int16 v40 = v31;
        _os_log_error_impl(&dword_1A7E51000, v13, OS_LOG_TYPE_ERROR, "Failed to grant %s sandbox extension for attachment item '%{public}s' for PID: %d with error: %s. This DiagnosticExtension may not have appropriate access to the specified item.", buf, 0x26u);
      }
      v18 = [(DEAttachmentItem *)self deleteOnAttach];
      int v19 = [v18 BOOLValue];

      if (v19)
      {
        uint64_t v20 = sandbox_extension_issue_file_to_process_by_pid();
        v21 = +[DELogging fwHandle];
        v22 = v21;
        if (v20)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            -[DEAttachmentItem _generateSandboxExtensionTokenForPID:]();
          }

          v23 = [NSString stringWithUTF8String:v20];
          v24 = self->__sandboxExtensionToken;
          self->__sandboxExtensionToken = v23;

          id v16 = (void *)v20;
          goto LABEL_6;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          [(DEAttachmentItem *)v7 _generateSandboxExtensionTokenForPID:v22];
        }
      }
    }
    else
    {
      v17 = +[DELogging fwHandle];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[DEAttachmentItem _generateSandboxExtensionTokenForPID:].cold.4(v7, v10);
      }
    }
  }
  else
  {
    id v10 = +[DELogging fwHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DEAttachmentItem _generateSandboxExtensionTokenForPID:](self, v10);
    }
  }
LABEL_12:
}

- (DEAttachmentItem)initWithPath:(id)a3 withDisplayName:(id)a4 modificationDate:(id)a5 andFilesize:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [(DEAttachmentItem *)self init];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_path, a3);
    uint64_t v15 = [v10 lastPathComponent];
    displayName = v14->_displayName;
    v14->_displayName = (NSString *)v15;

    objc_storeStrong((id *)&v14->_modificationDate, a5);
    objc_storeStrong((id *)&v14->_filesize, a6);
    attachmentType = v14->_attachmentType;
    v14->_attachmentType = (NSString *)@"DEAttachmentTypeItem";
  }
  return v14;
}

- (DEAttachmentItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DEAttachmentItem *)self init];
  uint64_t v6 = [v4 decodeObjectForKey:@"DisplayName"];
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v6;

  uint64_t v8 = [v4 decodeObjectForKey:@"Path"];
  path = v5->_path;
  v5->_path = (NSURL *)v8;

  uint64_t v10 = [v4 decodeObjectForKey:@"ShouldCompress"];
  shouldCompress = v5->_shouldCompress;
  v5->_shouldCompress = (NSNumber *)v10;

  uint64_t v12 = [v4 decodeObjectForKey:@"ModificationDate"];
  modificationDate = v5->_modificationDate;
  v5->_modificationDate = (NSDate *)v12;

  uint64_t v14 = [v4 decodeObjectForKey:@"AttachedPath"];
  attachedPath = v5->_attachedPath;
  v5->_attachedPath = (NSURL *)v14;

  uint64_t v16 = [v4 decodeObjectForKey:@"AttachmentType"];
  attachmentType = v5->_attachmentType;
  v5->_attachmentType = (NSString *)v16;

  uint64_t v18 = [v4 decodeObjectForKey:@"DeleteOnAttach"];
  deleteOnAttach = v5->_deleteOnAttach;
  v5->_deleteOnAttach = (NSNumber *)v18;

  uint64_t v20 = [v4 decodeObjectForKey:@"SandboxExtensionToken"];

  sandboxExtensionToken = v5->__sandboxExtensionToken;
  v5->__sandboxExtensionToken = (NSString *)v20;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  path = self->_path;
  id v5 = a3;
  [v5 encodeObject:path forKey:@"Path"];
  [v5 encodeObject:self->_displayName forKey:@"DisplayName"];
  [v5 encodeObject:self->_shouldCompress forKey:@"ShouldCompress"];
  [v5 encodeObject:self->_modificationDate forKey:@"ModificationDate"];
  [v5 encodeObject:self->_attachedPath forKey:@"AttachedPath"];
  [v5 encodeObject:self->_attachmentType forKey:@"AttachmentType"];
  [v5 encodeObject:self->_deleteOnAttach forKey:@"DeleteOnAttach"];
  [v5 encodeObject:self->__sandboxExtensionToken forKey:@"SandboxExtensionToken"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)attachToDestinationDir:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[DELogging fwHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v16 = 138543362;
    id v17 = v4;
    _os_log_impl(&dword_1A7E51000, v5, OS_LOG_TYPE_INFO, "Log destination directory: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v6 = [(DEAttachmentItem *)self path];
  uint64_t v7 = [(DEAttachmentItem *)self shouldCompress];
  id v8 = +[DEUtils copyItem:toDestinationDir:zipped:](DEUtils, "copyItem:toDestinationDir:zipped:", v6, v4, [v7 BOOLValue]);
  [(DEAttachmentItem *)self setAttachedPath:v8];

  uint64_t v9 = [(DEAttachmentItem *)self attachedPath];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    id v11 = [(DEAttachmentItem *)self deleteOnAttach];
    int v12 = [v11 BOOLValue];

    if (v12)
    {
      v13 = [(DEAttachmentItem *)self path];
      +[DEUtils removeFile:v13];
    }
  }
  uint64_t v14 = [(DEAttachmentItem *)self attachedPath];

  return v14;
}

- (void)detach
{
  v3 = [(DEAttachmentItem *)self attachedPath];
  +[DEUtils removeFile:v3];

  [(DEAttachmentItem *)self setAttachedPath:0];
}

- (id)description
{
  v2 = [(DEAttachmentItem *)self path];
  v3 = [v2 path];

  return v3;
}

+ (id)attachmentWithPath:(id)a3 withDisplayName:(id)a4 modificationDate:(id)a5 andFilesize:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[DEAttachmentItem alloc] initWithPath:v12 withDisplayName:v11 modificationDate:v10 andFilesize:v9];

  return v13;
}

+ (id)attachmentWithPath:(id)a3
{
  id v3 = a3;
  id v4 = [[DEAttachmentItem alloc] initWithPath:v3];

  return v4;
}

+ (id)attachmentWithPathURL:(id)a3
{
  id v3 = a3;
  id v4 = [[DEAttachmentItem alloc] initWithPathURL:v3];

  return v4;
}

- (id)sandboxExtensionHandleWithErrorOut:(id *)a3
{
  id v5 = [(DEAttachmentItem *)self _sandboxExtensionToken];

  if (v5)
  {
    uint64_t v6 = [DEAttachmentItemSandboxExtensionHandle alloc];
    uint64_t v7 = [(DEAttachmentItem *)self _sandboxExtensionToken];
    id v8 = [(DEAttachmentItem *)self path];
    id v9 = [(DEAttachmentItemSandboxExtensionHandle *)v6 initWithSandboxExtensionToken:v7 itemURL:v8 errorOut:a3];

    sandboxExtensionToken = self->__sandboxExtensionToken;
    self->__sandboxExtensionToken = 0;
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSURL)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (NSNumber)filesize
{
  return self->_filesize;
}

- (void)setFilesize:(id)a3
{
}

- (NSNumber)shouldCompress
{
  return self->_shouldCompress;
}

- (void)setShouldCompress:(id)a3
{
}

- (NSURL)attachedPath
{
  return self->_attachedPath;
}

- (void)setAttachedPath:(id)a3
{
}

- (NSString)attachmentType
{
  return self->_attachmentType;
}

- (void)setAttachmentType:(id)a3
{
}

- (NSNumber)deleteOnAttach
{
  return self->_deleteOnAttach;
}

- (void)setDeleteOnAttach:(id)a3
{
}

- (NSString)_sandboxExtensionToken
{
  return self->__sandboxExtensionToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__sandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_deleteOnAttach, 0);
  objc_storeStrong((id *)&self->_attachmentType, 0);
  objc_storeStrong((id *)&self->_attachedPath, 0);
  objc_storeStrong((id *)&self->_shouldCompress, 0);
  objc_storeStrong((id *)&self->_filesize, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)initWithPathURL:shouldCheckURLAttributes:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_4(&dword_1A7E51000, v0, v1, "NSURLFileSizeKey: [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)initWithPathURL:shouldCheckURLAttributes:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_4(&dword_1A7E51000, v0, v1, "NSURLIsDirectoryKey: [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)initWithPathURL:shouldCheckURLAttributes:.cold.3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_4(&dword_1A7E51000, v0, v1, "NSURLContentModificationDateKey: [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)initWithPathURL:shouldCheckURLAttributes:.cold.4()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_4(&dword_1A7E51000, v0, v1, "%{public}@ is not reachable", v2, v3, v4, v5, v6);
}

- (void)_generateSandboxExtensionTokenForPID:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 path];
  uint64_t v4 = (void *)v3;
  uint64_t v5 = @"-";
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  int v6 = 138543362;
  uint64_t v7 = v5;
  _os_log_error_impl(&dword_1A7E51000, a2, OS_LOG_TYPE_ERROR, "Failed to get file system representation for file with URL: %{public}@. This DiagnosticExtension may not have appropriate access to the specified item.", (uint8_t *)&v6, 0xCu);
}

- (void)_generateSandboxExtensionTokenForPID:(NSObject *)a3 .cold.2(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v6 = __error();
  uint64_t v7 = strerror(*v6);
  int v8 = 136446722;
  uint64_t v9 = a1;
  __int16 v10 = 1024;
  int v11 = a2;
  __int16 v12 = 2080;
  v13 = v7;
  _os_log_error_impl(&dword_1A7E51000, a3, OS_LOG_TYPE_ERROR, "Fallback attempt to grant R sandbox extension failed for attachment item '%{public}s' for PID: %d with error: %s. This DiagnosticExtension may not have appropriate access to the specified item.", (uint8_t *)&v8, 0x1Cu);
}

- (void)_generateSandboxExtensionTokenForPID:.cold.3()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_1A7E51000, v1, OS_LOG_TYPE_DEBUG, "Succeeded in fallback attempt to grant R sandbox extension for %{public}s for PID %d.", v2, 0x12u);
}

- (void)_generateSandboxExtensionTokenForPID:(uint64_t)a1 .cold.4(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_3(&dword_1A7E51000, v3, v4, "Cannot grant sandbox extension for unreachable item with path '%s' due to error %@. This DiagnosticExtension may not have appropriate access to the specified item.", v5, v6, v7, v8, 2u);
}

@end