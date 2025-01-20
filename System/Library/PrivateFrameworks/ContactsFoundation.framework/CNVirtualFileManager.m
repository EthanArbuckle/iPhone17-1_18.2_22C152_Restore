@interface CNVirtualFileManager
+ (BOOL)isHiddenURL:(id)a3;
+ (id)URLByNormalizingDirectoryURL:(id)a3;
+ (id)allParentFoldersOfURL:(id)a3;
- (BOOL)fileExistsAtURL:(id)a3;
- (BOOL)fileExistsAtURL:(id)a3 isDirectory:(BOOL *)a4;
- (BOOL)getValue:(id *)a3 forExtendendAttribute:(id)a4 url:(id)a5 error:(id *)a6;
- (CNVirtualFileManager)init;
- (id)asyncDataWithContentsOfURL:(id)a3;
- (id)asyncWriteData:(id)a3 toURL:(id)a4 options:(unint64_t)a5;
- (id)containerURLForSecurityApplicationGroupIdentifier:(id)a3;
- (id)contentsOfDirectoryAtURL:(id)a3 includingPropertiesForKeys:(id)a4 options:(unint64_t)a5;
- (id)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5;
- (id)dataWithContentsOfURL:(id)a3;
- (id)observableWithContentsOfURL:(id)a3;
- (id)removeExtendedAttribute:(id)a3 atURL:(id)a4;
- (id)removeItemAtURL:(id)a3;
- (id)setValue:(id)a3 forExtendedAttribute:(id)a4 atURL:(id)a5;
- (id)valueForExtendedAttribute:(id)a3 atURL:(id)a4;
- (id)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5;
- (void)setContainerURL:(id)a3 forSecurityApplicationGroupIdentifier:(id)a4;
@end

@implementation CNVirtualFileManager

- (CNVirtualFileManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)CNVirtualFileManager;
  v2 = [(CNVirtualFileManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    files = v2->_files;
    v2->_files = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    directories = v2->_directories;
    v2->_directories = (NSMutableOrderedSet *)v5;

    uint64_t v7 = objc_opt_new();
    containers = v2->_containers;
    v2->_containers = (NSMutableDictionary *)v7;

    v9 = v2;
  }

  return v2;
}

- (id)dataWithContentsOfURL:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_28);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT)) {
      -[CNVirtualFileManager dataWithContentsOfURL:]();
    }
  }
  files = self->_files;
  v6 = [v4 absoluteURL];
  uint64_t v7 = [(NSMutableDictionary *)files objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = [v7 contents];
    v9 = +[CNResult successWithValue:v8];
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F281F8];
    v16[0] = *MEMORY[0x1E4F28328];
    v8 = [v4 path];
    v17[0] = v8;
    v16[1] = *MEMORY[0x1E4F28A50];
    v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:2 userInfo:0];
    v17[1] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    v14 = [v10 errorWithDomain:v11 code:260 userInfo:v13];
    v9 = +[CNResult failureWithError:v14];
  }

  return v9;
}

- (id)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  v25[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_28);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT)) {
      -[CNVirtualFileManager dataWithContentsOfURL:]();
    }
  }
  v10 = [v9 URLByDeletingLastPathComponent];
  if (v5)
  {
    id v18 = [(CNVirtualFileManager *)self createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0];
  }
  else
  {
    char v23 = 0;
    if (![(CNVirtualFileManager *)self fileExistsAtURL:v10 isDirectory:&v23] || !v23)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F281F8];
      v24[0] = *MEMORY[0x1E4F28328];
      v13 = [v9 path];
      v25[0] = v13;
      v24[1] = *MEMORY[0x1E4F28A50];
      v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:2 userInfo:0];
      v25[1] = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
      v16 = [v11 errorWithDomain:v12 code:4 userInfo:v15];
      v17 = +[CNResult failureWithError:v16];

      goto LABEL_12;
    }
  }
  v19 = objc_alloc_init(_CNVirtualFile);
  [(_CNVirtualFile *)v19 setContents:v8];
  files = self->_files;
  v21 = [v9 absoluteURL];
  [(NSMutableDictionary *)files setObject:v19 forKeyedSubscript:v21];

  v17 = +[CNResult successWithValue:MEMORY[0x1E4F1CC38]];

LABEL_12:

  return v17;
}

- (id)asyncDataWithContentsOfURL:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_28);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT)) {
      -[CNVirtualFileManager dataWithContentsOfURL:]();
    }
  }
  id v4 = objc_alloc_init(CNData);
  char v5 = [(CNData *)v4 dataWithContentsOfURL:v3];

  return v5;
}

- (id)observableWithContentsOfURL:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_28);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT)) {
      -[CNVirtualFileManager dataWithContentsOfURL:]();
    }
  }
  id v4 = objc_alloc_init(CNData);
  char v5 = [(CNData *)v4 observableWithContentsOfURL:v3];

  return v5;
}

- (id)asyncWriteData:(id)a3 toURL:(id)a4 options:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_28);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT)) {
      -[CNVirtualFileManager dataWithContentsOfURL:]();
    }
  }
  id v9 = objc_alloc_init(CNData);
  v10 = [(CNData *)v9 writeData:v7 toURL:v8 options:a5];

  return v10;
}

- (id)removeItemAtURL:(id)a3
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  files = self->_files;
  v6 = [v4 absoluteURL];
  id v7 = [(NSMutableDictionary *)files objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = self->_files;
    id v9 = [v4 absoluteURL];
    [(NSMutableDictionary *)v8 setObject:0 forKeyedSubscript:v9];

    v10 = +[CNResult successWithValue:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    directories = self->_directories;
    uint64_t v12 = [v4 absoluteURL];
    LODWORD(directories) = [(NSMutableOrderedSet *)directories containsObject:v12];

    if (directories)
    {
      v13 = self->_directories;
      v14 = [v4 absoluteURL];
      [(NSMutableOrderedSet *)v13 removeObject:v14];

      v15 = [(NSMutableDictionary *)self->_files allKeys];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __40__CNVirtualFileManager_removeItemAtURL___block_invoke;
      v31[3] = &unk_1E56A0428;
      id v16 = v4;
      id v32 = v16;
      v17 = objc_msgSend(v15, "_cn_filter:", v31);

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __40__CNVirtualFileManager_removeItemAtURL___block_invoke_2;
      v30[3] = &unk_1E56A0450;
      v30[4] = self;
      objc_msgSend(v17, "_cn_each:", v30);
      id v18 = [(NSMutableOrderedSet *)self->_directories array];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __40__CNVirtualFileManager_removeItemAtURL___block_invoke_3;
      v28[3] = &unk_1E56A0428;
      id v29 = v16;
      v19 = objc_msgSend(v18, "_cn_filter:", v28);

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __40__CNVirtualFileManager_removeItemAtURL___block_invoke_4;
      v27[3] = &unk_1E56A0450;
      v27[4] = self;
      objc_msgSend(v19, "_cn_each:", v27);
      v10 = +[CNResult successWithValue:MEMORY[0x1E4F1CC38]];
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F281F8];
      v33[0] = *MEMORY[0x1E4F28328];
      v22 = [v4 path];
      v34[0] = v22;
      v33[1] = *MEMORY[0x1E4F28A50];
      char v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:2 userInfo:0];
      v34[1] = v23;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
      v25 = [v20 errorWithDomain:v21 code:4 userInfo:v24];
      v10 = +[CNResult failureWithError:v25];
    }
  }

  return v10;
}

uint64_t __40__CNVirtualFileManager_removeItemAtURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 absoluteString];
  id v4 = [*(id *)(a1 + 32) absoluteString];
  uint64_t v5 = [v3 hasPrefix:v4];

  return v5;
}

uint64_t __40__CNVirtualFileManager_removeItemAtURL___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKeyedSubscript:a2];
}

uint64_t __40__CNVirtualFileManager_removeItemAtURL___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 absoluteString];
  id v4 = [*(id *)(a1 + 32) absoluteString];
  uint64_t v5 = [v3 hasPrefix:v4];

  return v5;
}

uint64_t __40__CNVirtualFileManager_removeItemAtURL___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:a2];
}

- (BOOL)fileExistsAtURL:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_28);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT)) {
      -[CNVirtualFileManager dataWithContentsOfURL:]();
    }
  }
  files = self->_files;
  v6 = [v4 absoluteURL];
  id v7 = [(NSMutableDictionary *)files objectForKeyedSubscript:v6];
  if (v7)
  {
    char v8 = 1;
  }
  else
  {
    directories = self->_directories;
    v10 = [v4 absoluteURL];
    char v8 = [(NSMutableOrderedSet *)directories containsObject:v10];
  }
  return v8;
}

- (BOOL)fileExistsAtURL:(id)a3 isDirectory:(BOOL *)a4
{
  id v6 = a3;
  if (!v6)
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_28);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT)) {
      -[CNVirtualFileManager dataWithContentsOfURL:]();
    }
  }
  files = self->_files;
  char v8 = [v6 absoluteURL];
  id v9 = [(NSMutableDictionary *)files objectForKeyedSubscript:v8];

  if (v9)
  {
    if (a4) {
      *a4 = 0;
    }
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v11 = [(id)objc_opt_class() URLByNormalizingDirectoryURL:v6];
    char v12 = [(NSMutableOrderedSet *)self->_directories containsObject:v11];
    BOOL v10 = v12;
    if (a4) {
      *a4 = v12;
    }
  }
  return v10;
}

- (void)setContainerURL:(id)a3 forSecurityApplicationGroupIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() URLByNormalizingDirectoryURL:v7];

  [(NSMutableDictionary *)self->_containers setObject:v8 forKeyedSubscript:v6];
  [(NSMutableOrderedSet *)self->_directories addObject:v8];
}

- (id)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5
{
  id v6 = a3;
  id v7 = [(id)objc_opt_class() URLByNormalizingDirectoryURL:v6];
  directories = self->_directories;
  id v9 = [(id)objc_opt_class() allParentFoldersOfURL:v6];
  [(NSMutableOrderedSet *)directories addObjectsFromArray:v9];

  [(NSMutableOrderedSet *)self->_directories addObject:v7];
  BOOL v10 = +[CNResult successWithValue:v6];

  return v10;
}

- (id)contentsOfDirectoryAtURL:(id)a3 includingPropertiesForKeys:(id)a4 options:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [(id)objc_opt_class() URLByNormalizingDirectoryURL:v7];
  id v9 = [v8 path];
  BOOL v10 = [(NSMutableDictionary *)self->_files allKeys];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __84__CNVirtualFileManager_contentsOfDirectoryAtURL_includingPropertiesForKeys_options___block_invoke;
  v26[3] = &unk_1E56A0478;
  id v11 = v9;
  v28 = self;
  unint64_t v29 = a5;
  id v27 = v11;
  char v12 = objc_msgSend(v10, "_cn_filter:", v26);

  v13 = [(NSMutableOrderedSet *)self->_directories array];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__CNVirtualFileManager_contentsOfDirectoryAtURL_includingPropertiesForKeys_options___block_invoke_2;
  v21[3] = &unk_1E56A04A0;
  id v22 = v11;
  id v23 = v7;
  v24 = self;
  unint64_t v25 = a5;
  id v14 = v7;
  id v15 = v11;
  id v16 = objc_msgSend(v13, "_cn_filter:", v21);

  v17 = objc_opt_new();
  [v17 addObjectsFromArray:v12];
  [v17 addObjectsFromArray:v16];
  id v18 = objc_msgSend(v17, "_cn_distinctObjects");
  v19 = +[CNResult successWithValue:v18];

  return v19;
}

BOOL __84__CNVirtualFileManager_contentsOfDirectoryAtURL_includingPropertiesForKeys_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 path];
  int v5 = [v4 hasPrefix:*(void *)(a1 + 32)];

  BOOL v6 = v5 && ((*(unsigned char *)(a1 + 48) & 4) == 0 || ([(id)objc_opt_class() isHiddenURL:v3] & 1) == 0);
  return v6;
}

uint64_t __84__CNVirtualFileManager_contentsOfDirectoryAtURL_includingPropertiesForKeys_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 path];
  char v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5) {
    goto LABEL_8;
  }
  BOOL v6 = [v3 path];
  int v7 = [v6 hasPrefix:*(void *)(a1 + 32)];

  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8)
  {
    id v9 = [v3 pathComponents];
    unint64_t v10 = [v9 count];
    id v11 = [*(id *)(a1 + 40) pathComponents];
    unint64_t v12 = [v11 count] + 1;

    if (v10 > v12) {
      goto LABEL_8;
    }
    uint64_t v8 = *(void *)(a1 + 56);
  }
  if ((v8 & 4) == 0 || ([(id)objc_opt_class() isHiddenURL:v3] & 1) == 0)
  {
    uint64_t v13 = 1;
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v13 = 0;
LABEL_9:

  return v13;
}

+ (BOOL)isHiddenURL:(id)a3
{
  id v3 = [a3 lastPathComponent];
  char v4 = [v3 hasPrefix:@"."];

  return v4;
}

- (BOOL)getValue:(id *)a3 forExtendendAttribute:(id)a4 url:(id)a5 error:(id *)a6
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  files = self->_files;
  uint64_t v13 = [v11 absoluteURL];
  id v14 = [(NSMutableDictionary *)files objectForKeyedSubscript:v13];

  if (v14)
  {
    id v15 = [v14 extendedAttributes];
    id v16 = [v15 objectForKeyedSubscript:v10];

    id v17 = v16;
    *a3 = v17;
  }
  else
  {
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F281F8];
    v26[0] = *MEMORY[0x1E4F28328];
    v20 = [v11 path];
    v27[0] = v20;
    v26[1] = *MEMORY[0x1E4F28A50];
    uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:2 userInfo:0];
    v27[1] = v21;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
    id v23 = [v18 errorWithDomain:v19 code:4 userInfo:v22];
    v24 = v23;
    if (a6) {
      *a6 = v23;
    }
  }
  return v14 != 0;
}

- (id)valueForExtendedAttribute:(id)a3 atURL:(id)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v18 = 0;
  id v19 = 0;
  BOOL v7 = [(CNVirtualFileManager *)self getValue:&v19 forExtendendAttribute:a3 url:v6 error:&v18];
  id v8 = v19;
  id v9 = v18;
  if (!v7)
  {
    uint64_t v10 = +[CNResult failureWithError:v9];
    goto LABEL_5;
  }
  if (v8)
  {
    uint64_t v10 = +[CNResult successWithValue:v8];
LABEL_5:
    id v11 = (void *)v10;
    goto LABEL_6;
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
  v20[0] = *MEMORY[0x1E4F28328];
  id v14 = [v6 path];
  v21[0] = v14;
  v20[1] = *MEMORY[0x1E4F28A50];
  id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:93 userInfo:0];
  v21[1] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  id v17 = [v13 errorWithDomain:@"CNContactsFoundationErrorDomain" code:1302 userInfo:v16];
  id v11 = +[CNResult failureWithError:v17];

LABEL_6:

  return v11;
}

- (id)setValue:(id)a3 forExtendedAttribute:(id)a4 atURL:(id)a5
{
  files = self->_files;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [a5 absoluteURL];
  id v11 = [(NSMutableDictionary *)files objectForKeyedSubscript:v10];

  unint64_t v12 = [v11 extendedAttributes];
  [v12 setObject:v9 forKeyedSubscript:v8];

  uint64_t v13 = +[CNResult successWithValue:MEMORY[0x1E4F1CC38]];

  return v13;
}

- (id)removeExtendedAttribute:(id)a3 atURL:(id)a4
{
  return [(CNVirtualFileManager *)self setValue:0 forExtendedAttribute:a3 atURL:a4];
}

- (id)containerURLForSecurityApplicationGroupIdentifier:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(NSMutableDictionary *)self->_containers objectForKeyedSubscript:a3];
  if (v3)
  {
    char v4 = 0;
  }
  else
  {
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"Failed to find the container URL for the given application group identifier";
    char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    char v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:13 userInfo:v5];
  }
  id v6 = +[CNResult resultWithValue:v3 orError:v4];

  return v6;
}

+ (id)URLByNormalizingDirectoryURL:(id)a3
{
  id v3 = [a3 path];
  char v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];

  return v4;
}

+ (id)allParentFoldersOfURL:(id)a3
{
  id v4 = a3;
  char v5 = objc_opt_new();
  id v6 = [v4 pathComponents];
  if ([v6 count])
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = objc_msgSend(v6, "_cn_take:", ++v7);
      id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPathComponents:v8];
      uint64_t v10 = [a1 URLByNormalizingDirectoryURL:v9];

      [v5 addObject:v10];
    }
    while ([v6 count] > v7);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_directories, 0);

  objc_storeStrong((id *)&self->_files, 0);
}

- (void)dataWithContentsOfURL:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_19091D000, v0, v1, "parameter ‘url’ must be nonnull", v2, v3, v4, v5, v6);
}

@end