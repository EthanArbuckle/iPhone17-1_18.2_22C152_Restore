@interface CRKFTSEnumeration
+ (int)defaultOptions;
- ($44CB7BE6C0083754BDAD9427CD5EF788)makeFTSWithError:(id *)a3;
- (BOOL)shouldSkipEntry:(_ftsent *)a3;
- (CRKFTSEnumeration)init;
- (CRKFTSEnumeration)initWithDirectoryPath:(id)a3;
- (CRKFTSEnumeration)initWithDirectoryPath:(id)a3 options:(int)a4;
- (id)entriesWithError:(id *)a3;
- (id)readAllEntriesFromFTS:(id *)a3 error:(id *)a4;
- (id)readNextEntryFromFTS:(id *)a3 error:(id *)a4;
- (void)closeFTS:(id *)a3;
@end

@implementation CRKFTSEnumeration

+ (int)defaultOptions
{
  return 84;
}

- (CRKFTSEnumeration)init
{
  return [(CRKFTSEnumeration *)self initWithDirectoryPath:@"/"];
}

- (CRKFTSEnumeration)initWithDirectoryPath:(id)a3
{
  id v4 = a3;
  v5 = -[CRKFTSEnumeration initWithDirectoryPath:options:](self, "initWithDirectoryPath:options:", v4, [(id)objc_opt_class() defaultOptions]);

  return v5;
}

- (CRKFTSEnumeration)initWithDirectoryPath:(id)a3 options:(int)a4
{
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CRKFTSEnumeration.m", 39, @"Invalid parameter not satisfying: %@", @"directoryPath" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)CRKFTSEnumeration;
  v8 = [(CRKFTSEnumeration *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    mDirectoryPath = v8->mDirectoryPath;
    v8->mDirectoryPath = (NSString *)v9;

    v8->mOptions = a4;
  }

  return v8;
}

- (id)entriesWithError:(id *)a3
{
  v5 = -[CRKFTSEnumeration makeFTSWithError:](self, "makeFTSWithError:");
  if (v5)
  {
    v6 = v5;
    id v7 = [(CRKFTSEnumeration *)self readAllEntriesFromFTS:v5 error:a3];
    [(CRKFTSEnumeration *)self closeFTS:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- ($44CB7BE6C0083754BDAD9427CD5EF788)makeFTSWithError:(id *)a3
{
  v8[2] = *(char **)MEMORY[0x263EF8340];
  v8[0] = (char *)[(NSString *)self->mDirectoryPath fileSystemRepresentation];
  v8[1] = 0;
  v5 = fts_open(v8, self->mOptions, 0);
  v6 = ($44CB7BE6C0083754BDAD9427CD5EF788 *)v5;
  if (a3 && !v5)
  {
    *a3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
  }
  return v6;
}

- (void)closeFTS:(id *)a3
{
  if (fts_close((FTS *)a3))
  {
    v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    if (_CRKLogGeneral_onceToken_2 != -1) {
      dispatch_once(&_CRKLogGeneral_onceToken_2, &__block_literal_global_16);
    }
    id v4 = (void *)_CRKLogGeneral_logObj_2;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_2, OS_LOG_TYPE_ERROR)) {
      -[CRKFTSEnumeration closeFTS:](v4, v3);
    }
  }
}

- (id)readAllEntriesFromFTS:(id *)a3 error:(id *)a4
{
  id v7 = objc_opt_new();
  id v15 = 0;
  v8 = [(CRKFTSEnumeration *)self readNextEntryFromFTS:a3 error:&v15];
  id v9 = v15;
  v10 = v9;
  if (v8)
  {
    do
    {
      [v7 addObject:v8];
      id v15 = v10;
      uint64_t v11 = [(CRKFTSEnumeration *)self readNextEntryFromFTS:a3 error:&v15];
      id v12 = v15;

      v10 = v12;
      v8 = (void *)v11;
    }
    while (v11);
    if (a4) {
      goto LABEL_4;
    }
  }
  else
  {
    id v12 = v9;
    if (a4) {
LABEL_4:
    }
      *a4 = v12;
  }
  if (v12) {
    objc_super v13 = 0;
  }
  else {
    objc_super v13 = (void *)[v7 copy];
  }

  return v13;
}

- (id)readNextEntryFromFTS:(id *)a3 error:(id *)a4
{
  while (1)
  {
    id v7 = fts_read((FTS *)a3);
    if (!v7) {
      break;
    }
    v8 = v7;
    if (![(CRKFTSEnumeration *)self shouldSkipEntry:v7])
    {
      id v9 = [[CRKFTSEntry alloc] initWithFTSEntry:v8 error:a4];
      goto LABEL_7;
    }
  }
  v10 = __error();
  id v9 = 0;
  if (a4 && *v10)
  {
    id v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    id v9 = 0;
    *a4 = v11;
  }
LABEL_7:

  return v9;
}

- (BOOL)shouldSkipEntry:(_ftsent *)a3
{
  return (a3->fts_info < 0xFu) & (0x4266u >> a3->fts_info);
}

- (void).cxx_destruct
{
}

- (void)closeFTS:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  id v4 = [a2 verboseDescription];
  int v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_224C00000, v3, OS_LOG_TYPE_ERROR, "Failed to close FTS: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end