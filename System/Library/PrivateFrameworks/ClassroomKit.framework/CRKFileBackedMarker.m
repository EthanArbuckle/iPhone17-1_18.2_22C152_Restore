@interface CRKFileBackedMarker
- (BOOL)createWithError:(id *)a3;
- (BOOL)deleteWithError:(id *)a3;
- (BOOL)exists;
- (CRKFileBackedMarker)init;
- (CRKFileBackedMarker)initWithFileURL:(id)a3;
@end

@implementation CRKFileBackedMarker

- (CRKFileBackedMarker)init
{
  v3 = objc_msgSend(NSURL, "crk_uniqueTemporaryFileURL");
  v4 = [(CRKFileBackedMarker *)self initWithFileURL:v3];

  return v4;
}

- (CRKFileBackedMarker)initWithFileURL:(id)a3
{
  id v6 = a3;
  if (([v6 isFileURL] & 1) == 0)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"CRKFileBackedMarker.m" lineNumber:26 description:@"File URL must point to a file"];
  }
  v11.receiver = self;
  v11.super_class = (Class)CRKFileBackedMarker;
  v7 = [(CRKFileBackedMarker *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->mFileURL, a3);
  }

  return v8;
}

- (BOOL)exists
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(NSURL *)self->mFileURL path];
  char v5 = [v3 fileExistsAtPath:v4 isDirectory:0];

  return v5;
}

- (BOOL)createWithError:(id *)a3
{
  if ([(CRKFileBackedMarker *)self exists]) {
    return 1;
  }
  id v6 = [MEMORY[0x263F08850] defaultManager];
  v7 = [(NSURL *)self->mFileURL URLByDeletingLastPathComponent];
  int v8 = [v6 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:a3];

  if (!v8) {
    return 0;
  }
  v9 = objc_opt_new();
  char v10 = [v9 writeToURL:self->mFileURL options:1 error:a3];

  return v10;
}

- (BOOL)deleteWithError:(id *)a3
{
  char v5 = [MEMORY[0x263F08850] defaultManager];
  LOBYTE(a3) = objc_msgSend(v5, "crk_safeRemoveItemAtURL:error:", self->mFileURL, a3);

  return (char)a3;
}

- (void).cxx_destruct
{
}

@end