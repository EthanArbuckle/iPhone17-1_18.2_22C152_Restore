@interface BRCLazyPackage
- (BOOL)addItem:(id)a3 error:(id *)a4;
- (BRCLazyPackage)initWithRegistry:(id)a3 stageID:(id)a4 name:(id)a5 boundaryKey:(id)a6;
- (id)closeAndReturn;
- (unint64_t)itemCount;
@end

@implementation BRCLazyPackage

- (BRCLazyPackage)initWithRegistry:(id)a3 stageID:(id)a4 name:(id)a5 boundaryKey:(id)a6
{
  v10 = (BRCStageRegistry *)a3;
  v11 = (NSString *)a4;
  v12 = (NSString *)a5;
  v13 = (NSData *)a6;
  v23.receiver = self;
  v23.super_class = (Class)BRCLazyPackage;
  v14 = [(BRCLazyPackage *)&v23 init];
  registry = v14->_registry;
  v14->_registry = v10;
  v16 = v10;

  stageID = v14->_stageID;
  v14->_stageID = v11;
  v18 = v11;

  name = v14->_name;
  v14->_name = v12;
  v20 = v12;

  boundaryKey = v14->_boundaryKey;
  v14->_boundaryKey = v13;

  return v14;
}

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  package = self->_package;
  if (package) {
    goto LABEL_2;
  }
  v9 = [(BRCStageRegistry *)self->_registry createURLForUploadWithStageID:self->_stageID name:self->_name];
  boundaryKey = self->_boundaryKey;
  id v32 = 0;
  objc_msgSend(MEMORY[0x1E4F1A250], "br_packageWithBoundaryKey:error:", boundaryKey, &v32);
  v11 = (CKPackage *)objc_claimAutoreleasedReturnValue();
  id v12 = v32;
  v13 = self->_package;
  self->_package = v11;

  v14 = self->_package;
  if (!v14)
  {
    v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
      -[BRCLazyPackage addItem:error:]((uint64_t)v12, (uint64_t)v19, v20);
    }

    if (!a4) {
      goto LABEL_11;
    }
LABEL_10:
    id v12 = v12;
    *a4 = v12;
LABEL_11:

    char v8 = 0;
    goto LABEL_12;
  }
  id v31 = v12;
  BOOL v15 = [(CKPackage *)v14 anchorAtURL:v9 error:&v31];
  id v16 = v31;

  if (!v15)
  {
    v22 = brc_bread_crumbs();
    objc_super v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_package;
      v25 = [v9 path];
      *(_DWORD *)buf = 138413058;
      v34 = v24;
      __int16 v35 = 2112;
      v36 = v25;
      __int16 v37 = 2112;
      id v38 = v16;
      __int16 v39 = 2112;
      v40 = v22;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to anchor package %@ at %@: %@%@", buf, 0x2Au);
    }
    id v12 = v16;
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v17 = self->_package;
  id v30 = v16;
  char v18 = [(CKPackage *)v17 openWithError:&v30];
  id v12 = v30;

  if ((v18 & 1) == 0)
  {
    v26 = brc_bread_crumbs();
    v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = self->_package;
      v29 = [v9 path];
      *(_DWORD *)buf = 138413058;
      v34 = v28;
      __int16 v35 = 2112;
      v36 = v29;
      __int16 v37 = 2112;
      id v38 = v12;
      __int16 v39 = 2112;
      v40 = v26;
      _os_log_impl(&dword_1D353B000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to open package %@ at %@: %@%@", buf, 0x2Au);
    }
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  package = self->_package;
LABEL_2:
  char v8 = [(CKPackage *)package addItem:v6];
LABEL_12:

  return v8;
}

- (id)closeAndReturn
{
  package = self->_package;
  if (package)
  {
    [(CKPackage *)package close];
    package = self->_package;
  }

  return package;
}

- (unint64_t)itemCount
{
  unint64_t result = (unint64_t)self->_package;
  if (result) {
    return [(id)result itemCount];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundaryKey, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_stageID, 0);

  objc_storeStrong((id *)&self->_registry, 0);
}

- (void)addItem:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D353B000, log, (os_log_type_t)0x90u, "[ERROR] Failed to create package: %@%@", (uint8_t *)&v3, 0x16u);
}

@end