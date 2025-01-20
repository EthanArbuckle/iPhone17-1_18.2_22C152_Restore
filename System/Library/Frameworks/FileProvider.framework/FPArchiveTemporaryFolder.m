@interface FPArchiveTemporaryFolder
- (FPArchiveTemporaryFolder)init;
- (FPArchiveTemporaryFolder)initWithURL:(id)a3;
- (id)temporaryFolderURLGetError:(id *)a3;
- (void)dealloc;
@end

@implementation FPArchiveTemporaryFolder

- (FPArchiveTemporaryFolder)init
{
  return [(FPArchiveTemporaryFolder *)self initWithURL:0];
}

- (FPArchiveTemporaryFolder)initWithURL:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"FPArchiveOperation.m", 62, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)FPArchiveTemporaryFolder;
  v7 = [(FPArchiveTemporaryFolder *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_url, a3);
  }

  return v8;
}

- (id)temporaryFolderURLGetError:(id *)a3
{
  temporaryFolderURL = self->_temporaryFolderURL;
  if (!temporaryFolderURL)
  {
    BOOL v6 = [(NSURL *)self->_url startAccessingSecurityScopedResource];
    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    v8 = [v7 URLForDirectory:99 inDomain:1 appropriateForURL:self->_url create:1 error:a3];
    v9 = self->_temporaryFolderURL;
    self->_temporaryFolderURL = v8;

    temporaryFolderURL = self->_temporaryFolderURL;
    if (!temporaryFolderURL && v6)
    {
      [(NSURL *)self->_url stopAccessingSecurityScopedResource];
      v10 = 0;
      goto LABEL_7;
    }
    self->_didStartAccessing = v6;
  }
  v10 = temporaryFolderURL;
LABEL_7:

  return v10;
}

- (void)dealloc
{
  if (self->_didStartAccessing) {
    [(NSURL *)self->_url stopAccessingSecurityScopedResource];
  }
  v3.receiver = self;
  v3.super_class = (Class)FPArchiveTemporaryFolder;
  [(FPArchiveTemporaryFolder *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryFolderURL, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end