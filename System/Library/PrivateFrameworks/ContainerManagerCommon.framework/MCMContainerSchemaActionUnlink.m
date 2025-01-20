@interface MCMContainerSchemaActionUnlink
+ (id)actionIdentifier;
- (BOOL)performWithError:(id *)a3;
- (MCMContainerSchemaActionUnlink)initWithPathArgument:(id)a3 context:(id)a4;
- (id)description;
@end

@implementation MCMContainerSchemaActionUnlink

- (void).cxx_destruct
{
  p_url = &self->_url;

  objc_storeStrong((id *)p_url, 0);
}

- (BOOL)performWithError:(id *)a3
{
  v11[1] = *(id *)MEMORY[0x1E4F143B8];
  url = self->_url;
  v11[0] = 0;
  BOOL v5 = [(MCMContainerSchemaActionBase *)self fixAndRetryIfPermissionsErrorWithURL:url error:v11 duringBlock:&__block_literal_global_2425];
  id v6 = v11[0];
  v7 = [v6 domain];
  if ([v7 isEqualToString:*MEMORY[0x1E4F28798]])
  {
    uint64_t v8 = [v6 code];

    if (v8 == 2)
    {

      id v6 = 0;
      BOOL v5 = 1;
      goto LABEL_10;
    }
  }
  else
  {
  }
  if (a3) {
    char v9 = v5;
  }
  else {
    char v9 = 1;
  }
  if ((v9 & 1) == 0)
  {
    id v6 = v6;
    BOOL v5 = 0;
    *a3 = v6;
  }
LABEL_10:

  return v5;
}

uint64_t __51__MCMContainerSchemaActionUnlink_performWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  BOOL v5 = +[MCMFileManager defaultManager];
  uint64_t v6 = [v5 removeItemAtURL:v4 error:a3];

  return v6;
}

- (id)description
{
  v3 = [(id)objc_opt_class() actionIdentifier];
  id v4 = [(NSURL *)self->_url path];
  BOOL v5 = [v3 stringByAppendingFormat:@" [%@]", v4];

  return v5;
}

- (MCMContainerSchemaActionUnlink)initWithPathArgument:(id)a3 context:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMContainerSchemaActionUnlink;
  v7 = [(MCMContainerSchemaActionBase *)&v11 initWithContext:a4];
  if (v7)
  {
    uint64_t v8 = [v6 fileURL];
    url = v7->_url;
    v7->_url = (NSURL *)v8;

    if (!v7->_url)
    {

      v7 = 0;
    }
  }

  return v7;
}

+ (id)actionIdentifier
{
  v2 = @"unlink";
  return @"unlink";
}

@end