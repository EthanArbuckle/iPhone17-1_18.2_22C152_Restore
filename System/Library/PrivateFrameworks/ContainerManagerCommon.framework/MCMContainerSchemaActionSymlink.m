@interface MCMContainerSchemaActionSymlink
+ (id)actionIdentifier;
- (BOOL)performWithError:(id *)a3;
- (MCMContainerSchemaActionSymlink)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6;
- (id)description;
@end

@implementation MCMContainerSchemaActionSymlink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetPath, 0);
  objc_storeStrong((id *)&self->_finalLinkURL, 0);

  objc_storeStrong((id *)&self->_linkURL, 0);
}

- (BOOL)performWithError:(id *)a3
{
  v30[1] = *(id *)MEMORY[0x1E4F143B8];
  v4 = [(NSURL *)self->_finalLinkURL path];
  v5 = self->_targetPath;
  v6 = (void *)MEMORY[0x1E4F1CA48];
  v7 = [v4 pathComponents];
  v8 = [v6 arrayWithArray:v7];

  v9 = (void *)MEMORY[0x1E4F1CA48];
  v10 = [(NSString *)v5 pathComponents];
  v11 = [v9 arrayWithArray:v10];
  while (1)
  {

    if (![v8 count] || !objc_msgSend(v11, "count")) {
      break;
    }
    v10 = [v8 objectAtIndexedSubscript:0];
    v12 = [v11 objectAtIndexedSubscript:0];
    if (([v10 isEqualToString:v12] & 1) == 0)
    {

      break;
    }
    [v8 removeObjectAtIndex:0];
    [v11 removeObjectAtIndex:0];
  }
  if ([v8 count]) {
    [v8 removeObjectAtIndex:0];
  }
  v13 = [MEMORY[0x1E4F1CA48] array];
  if ([v8 count])
  {
    unint64_t v14 = 0;
    do
    {
      [v13 addObject:@".."];
      ++v14;
    }
    while (v14 < [v8 count]);
  }
  [v13 addObjectsFromArray:v11];
  v15 = [NSString pathWithComponents:v13];

  targetPath = self->_targetPath;
  self->_targetPath = v15;

  v17 = self->_targetPath;
  v18 = self->_finalLinkURL;
  linkURL = self->_linkURL;
  v30[0] = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __52__MCMContainerSchemaActionSymlink_performWithError___block_invoke;
  v27[3] = &unk_1E6A80090;
  v27[4] = self;
  v20 = v18;
  v28 = v20;
  v21 = v17;
  v29 = v21;
  BOOL v22 = [(MCMContainerSchemaActionBase *)self fixAndRetryIfPermissionsErrorWithURL:linkURL error:v30 duringBlock:v27];
  id v23 = v30[0];
  v24 = v23;
  if (a3 && !v22) {
    *a3 = v23;
  }

  return v22;
}

uint64_t __52__MCMContainerSchemaActionSymlink_performWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v18[1] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = [v5 URLByDeletingLastPathComponent];
  if (![*(id *)(a1 + 32) makedirAtURL:v6 followTerminalSymlink:1 error:a3])
  {
    v8 = 0;
    id v9 = 0;
    goto LABEL_7;
  }
  if (![*(id *)(a1 + 40) isEqual:v5])
  {
    v8 = 0;
    id v9 = 0;
    goto LABEL_9;
  }
  v7 = +[MCMFileManager defaultManager];
  v18[0] = 0;
  v8 = [v7 targetOfSymbolicLinkAtURL:v5 error:v18];
  id v9 = v18[0];

  if (!v8)
  {
    v13 = [v9 domain];
    uint64_t v14 = *MEMORY[0x1E4F28798];
    if ([v13 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v15 = [v9 code];

      if (v15 == 17)
      {
        v8 = 0;
        if (([*(id *)(a1 + 32) backupFileURL:v5 error:a3] & 1) == 0) {
          goto LABEL_7;
        }
LABEL_9:
        v11 = +[MCMFileManager defaultManager];
        uint64_t v10 = [v11 symbolicallyLinkURL:v5 toSymlinkTarget:*(void *)(a1 + 48) error:a3];

        goto LABEL_10;
      }
    }
    else
    {
    }
    v16 = [v9 domain];
    if ([v16 isEqualToString:v14])
    {
      uint64_t v17 = [v9 code];

      if (v17 == 2)
      {
        v8 = 0;
        goto LABEL_9;
      }
    }
    else
    {
    }
    id v9 = v9;
    v8 = 0;
    uint64_t v10 = 0;
    *a3 = v9;
    goto LABEL_10;
  }
  if (([v8 isEqualToString:*(void *)(a1 + 48)] & 1) == 0)
  {
    if ([*(id *)(a1 + 32) backupFileURL:v5 error:a3]) {
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  uint64_t v10 = 1;
LABEL_10:

  return v10;
}

- (id)description
{
  v3 = [(id)objc_opt_class() actionIdentifier];
  v4 = [(NSURL *)self->_linkURL path];
  id v5 = [v3 stringByAppendingFormat:@" [%@] → [%@]", v4, self->_targetPath];

  return v5;
}

- (MCMContainerSchemaActionSymlink)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MCMContainerSchemaActionSymlink;
  v13 = [(MCMContainerSchemaActionBase *)&v21 initWithContext:a6];
  if (v13)
  {
    uint64_t v14 = [v11 fileURL];
    linkURL = v13->_linkURL;
    v13->_linkURL = (NSURL *)v14;

    uint64_t v16 = [v12 fileURL];
    finalLinkURL = v13->_finalLinkURL;
    v13->_finalLinkURL = (NSURL *)v16;

    uint64_t v18 = [v10 string];
    targetPath = v13->_targetPath;
    v13->_targetPath = (NSString *)v18;

    if (!v13->_linkURL || !v13->_targetPath)
    {

      v13 = 0;
    }
  }

  return v13;
}

+ (id)actionIdentifier
{
  v2 = @"symlink";
  return @"symlink";
}

@end