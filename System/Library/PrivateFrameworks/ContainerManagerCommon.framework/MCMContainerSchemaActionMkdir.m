@interface MCMContainerSchemaActionMkdir
+ (id)actionIdentifier;
- (BOOL)performWithError:(id *)a3;
- (MCMContainerSchemaActionMkdir)initWithPathArgument:(id)a3 context:(id)a4;
- (id)description;
@end

@implementation MCMContainerSchemaActionMkdir

- (void).cxx_destruct
{
  p_url = &self->_url;

  objc_storeStrong((id *)p_url, 0);
}

- (BOOL)performWithError:(id *)a3
{
  v16[1] = *(id *)MEMORY[0x1E4F143B8];
  v5 = [(NSURL *)self->_url URLByDeletingLastPathComponent];
  v15[4] = self;
  v16[0] = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__MCMContainerSchemaActionMkdir_performWithError___block_invoke;
  v15[3] = &unk_1E6A809E0;
  BOOL v6 = [(MCMContainerSchemaActionBase *)self fixAndRetryIfPermissionsErrorWithURL:v5 error:v16 duringBlock:v15];
  id v7 = v16[0];
  v8 = v7;
  if (v6)
  {
    url = self->_url;
    v13[4] = self;
    id v14 = v7;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__MCMContainerSchemaActionMkdir_performWithError___block_invoke_2;
    v13[3] = &unk_1E6A809E0;
    BOOL v10 = [(MCMContainerSchemaActionBase *)self fixAndRetryIfPermissionsErrorWithURL:url error:&v14 duringBlock:v13];
    id v11 = v14;

    v8 = v11;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v10 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v10) {
    *a3 = v8;
  }
LABEL_7:

  return v10;
}

uint64_t __50__MCMContainerSchemaActionMkdir_performWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);

  return [v3 makedirAtURL:a2 followTerminalSymlink:1 error:a3];
}

uint64_t __50__MCMContainerSchemaActionMkdir_performWithError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);

  return [v3 makedirAtURL:a2 followTerminalSymlink:0 error:a3];
}

- (id)description
{
  v3 = [(id)objc_opt_class() actionIdentifier];
  v4 = [(NSURL *)self->_url path];
  v5 = [v3 stringByAppendingFormat:@" [%@]", v4];

  return v5;
}

- (MCMContainerSchemaActionMkdir)initWithPathArgument:(id)a3 context:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMContainerSchemaActionMkdir;
  id v7 = [(MCMContainerSchemaActionBase *)&v11 initWithContext:a4];
  if (v7)
  {
    uint64_t v8 = [v6 fileURL];
    url = v7->_url;
    v7->_url = (NSURL *)v8;

    if (!v7->_url)
    {

      id v7 = 0;
    }
  }

  return v7;
}

+ (id)actionIdentifier
{
  v2 = @"mkdir";
  return @"mkdir";
}

@end