@interface CNFileManager
- (BOOL)fileExistsAtURL:(id)a3;
- (BOOL)fileExistsAtURL:(id)a3 isDirectory:(BOOL *)a4;
- (BOOL)getValue:(id *)a3 forExtendendAttribute:(id)a4 url:(id)a5 error:(id *)a6;
- (CNFileManager)init;
- (CNFileManager)initWithFileManager:(id)a3;
- (NSFileManager)fileManager;
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
@end

@implementation CNFileManager

- (CNFileManager)init
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(CNFileManager *)self initWithFileManager:v3];

  return v4;
}

- (CNFileManager)initWithFileManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNFileManager;
  v6 = [(CNFileManager *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileManager, a3);
    v8 = v7;
  }

  return v7;
}

- (id)dataWithContentsOfURL:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__CNFileManager_dataWithContentsOfURL___block_invoke;
  v7[3] = &unk_1E569FB38;
  id v8 = v3;
  id v4 = v3;
  id v5 = +[CNResult resultWithBlock:v7];

  return v5;
}

uint64_t __39__CNFileManager_dataWithContentsOfURL___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:*(void *)(a1 + 32) options:0 error:a2];
}

- (id)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __41__CNFileManager_writeData_toURL_options___block_invoke;
  v14[3] = &unk_1E56A11F0;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  unint64_t v17 = a5;
  id v10 = v8;
  id v11 = v9;
  v12 = +[CNResult resultWithBlock:v14];

  return v12;
}

id __41__CNFileManager_writeData_toURL_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 8);
    v6 = [*(id *)(a1 + 40) URLByDeletingLastPathComponent];
    id v16 = 0;
    int v7 = [v5 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v16];
    id v8 = v16;

    if (!v7) {
      goto LABEL_6;
    }

    uint64_t v4 = *(void *)(a1 + 56);
  }
  unint64_t v9 = +[CNData NSDataWritingOptionsFromCNDataWritingOptions:v4];
  uint64_t v11 = *(void *)(a1 + 40);
  id v10 = *(void **)(a1 + 48);
  id v15 = 0;
  int v12 = [v10 writeToURL:v11 options:v9 error:&v15];
  id v8 = v15;
  if (v12)
  {
    id v13 = *(id *)(a1 + 40);
    goto LABEL_8;
  }
LABEL_6:
  id v13 = 0;
  if (a2) {
    *a2 = v8;
  }
LABEL_8:

  return v13;
}

- (id)asyncDataWithContentsOfURL:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__CNFileManager_asyncDataWithContentsOfURL___block_invoke;
  v8[3] = &unk_1E56A1218;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  v6 = +[CNFuture futureWithBlock:v8];

  return v6;
}

id __44__CNFileManager_asyncDataWithContentsOfURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [*(id *)(a1 + 32) dataWithContentsOfURL:*(void *)(a1 + 40)];
  id v4 = [v3 value];
  id v5 = [v3 error];
  id v6 = v4;
  int v7 = v6;
  if (a2 && !v6) {
    *a2 = v5;
  }

  return v7;
}

- (id)asyncWriteData:(id)a3 toURL:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__CNFileManager_asyncWriteData_toURL_options___block_invoke;
  v14[3] = &unk_1E56A11F0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a5;
  id v10 = v9;
  id v11 = v8;
  int v12 = +[CNFuture futureWithBlock:v14];

  return v12;
}

id __46__CNFileManager_asyncWriteData_toURL_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [*(id *)(a1 + 32) writeData:*(void *)(a1 + 40) toURL:*(void *)(a1 + 48) options:*(void *)(a1 + 56)];
  id v4 = [v3 value];
  id v5 = [v3 error];
  id v6 = v4;
  int v7 = v6;
  if (a2 && !v6) {
    *a2 = v5;
  }

  return v7;
}

- (id)observableWithContentsOfURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(CNData);
  id v5 = [(CNData *)v4 observableWithContentsOfURL:v3];

  return v5;
}

- (BOOL)fileExistsAtURL:(id)a3
{
  fileManager = self->_fileManager;
  id v4 = [a3 path];
  LOBYTE(fileManager) = [(NSFileManager *)fileManager fileExistsAtPath:v4];

  return (char)fileManager;
}

- (BOOL)fileExistsAtURL:(id)a3 isDirectory:(BOOL *)a4
{
  fileManager = self->_fileManager;
  id v6 = [a3 path];
  LOBYTE(a4) = [(NSFileManager *)fileManager fileExistsAtPath:v6 isDirectory:a4];

  return (char)a4;
}

- (id)removeItemAtURL:(id)a3
{
  fileManager = self->_fileManager;
  id v8 = 0;
  BOOL v4 = [(NSFileManager *)fileManager removeItemAtURL:a3 error:&v8];
  id v5 = v8;
  if (v4) {
    +[CNResult successWithValue:MEMORY[0x1E4F1CC38]];
  }
  else {
  id v6 = +[CNResult failureWithError:v5];
  }

  return v6;
}

- (id)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__CNFileManager_createDirectoryAtURL_withIntermediateDirectories_attributes___block_invoke;
  v14[3] = &unk_1E56A1240;
  v14[4] = self;
  id v15 = v8;
  BOOL v17 = a4;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  int v12 = +[CNResult resultWithBlock:v14];

  return v12;
}

id __77__CNFileManager_createDirectoryAtURL_withIntermediateDirectories_attributes___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4 = [*(id *)(a1 + 32) fileManager];
  LODWORD(a2) = [v4 createDirectoryAtURL:*(void *)(a1 + 40) withIntermediateDirectories:*(unsigned __int8 *)(a1 + 56) attributes:*(void *)(a1 + 48) error:a2];

  if (a2) {
    id v5 = *(void **)(a1 + 40);
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)contentsOfDirectoryAtURL:(id)a3 includingPropertiesForKeys:(id)a4 options:(unint64_t)a5
{
  fileManager = self->_fileManager;
  id v10 = 0;
  id v6 = [(NSFileManager *)fileManager contentsOfDirectoryAtURL:a3 includingPropertiesForKeys:a4 options:a5 error:&v10];
  id v7 = v10;
  id v8 = +[CNResult resultWithValue:v6 orError:v7];

  return v8;
}

- (id)containerURLForSecurityApplicationGroupIdentifier:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(NSFileManager *)self->_fileManager containerURLForSecurityApplicationGroupIdentifier:a3];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"Failed to find the container URL for the given application group identifier";
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    BOOL v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:13 userInfo:v5];
  }
  id v6 = +[CNResult resultWithValue:v3 orError:v4];

  return v6;
}

- (id)setValue:(id)a3 forExtendedAttribute:(id)a4 atURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  fileManager = self->_fileManager;
  int v12 = [v10 path];
  if (v8)
  {
    id v20 = 0;
    BOOL v13 = [(NSFileManager *)fileManager _cn_setValue:v8 forExtendedAttribute:v9 path:v12 error:&v20];
    id v14 = v20;

    if (v13)
    {
LABEL_3:
      uint64_t v15 = +[CNResult successWithValue:MEMORY[0x1E4F1CC38]];
      goto LABEL_6;
    }
  }
  else
  {
    id v19 = 0;
    BOOL v16 = [(NSFileManager *)fileManager _cn_removeExtendedAttributeForKey:v9 path:v12 error:&v19];
    id v14 = v19;

    if (v16) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = +[CNResult failureWithError:v14];
LABEL_6:
  BOOL v17 = (void *)v15;

  return v17;
}

- (id)valueForExtendedAttribute:(id)a3 atURL:(id)a4
{
  fileManager = self->_fileManager;
  id v16 = 0;
  id v6 = a3;
  id v7 = [a4 path];
  id v15 = 0;
  BOOL v8 = [(NSFileManager *)fileManager _cn_getValue:&v16 forExtendendAttribute:v6 path:v7 error:&v15];

  id v9 = (__CFString *)v16;
  id v10 = v15;

  if (v8)
  {
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = &stru_1EE0267A8;
    }
    uint64_t v12 = +[CNResult successWithValue:v11];
  }
  else
  {
    uint64_t v12 = +[CNResult failureWithError:v10];
  }
  BOOL v13 = (void *)v12;

  return v13;
}

- (BOOL)getValue:(id *)a3 forExtendendAttribute:(id)a4 url:(id)a5 error:(id *)a6
{
  return [(NSFileManager *)self->_fileManager _cn_getValue:a3 forExtendendAttribute:a4 url:a5 error:a6];
}

- (id)removeExtendedAttribute:(id)a3 atURL:(id)a4
{
  fileManager = self->_fileManager;
  id v6 = a3;
  id v7 = [a4 path];
  id v11 = 0;
  LODWORD(fileManager) = [(NSFileManager *)fileManager _cn_removeExtendedAttributeForKey:v6 path:v7 error:&v11];

  id v8 = v11;
  if (fileManager) {
    +[CNResult successWithValue:MEMORY[0x1E4F1CC38]];
  }
  else {
  id v9 = +[CNResult failureWithError:v8];
  }

  return v9;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void).cxx_destruct
{
}

@end