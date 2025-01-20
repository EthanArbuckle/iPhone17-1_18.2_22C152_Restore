@interface HMCameraClipFetchAssetContextOperationDataSource
- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4;
- (BOOL)writeData:(id)a3 toFileURL:(id)a4 error:(id *)a5;
- (id)createTemporaryDirectoryAppropriateForURL:(id)a3 error:(id *)a4;
- (id)createVideoFileCombinerWithVideoFileURLs:(id)a3 queue:(id)a4;
- (id)dataFromEncryptedDataContext:(id)a3 usingDecryptionManager:(id)a4;
- (id)dataTaskWithURL:(id)a3 httpHeaderFields:(id)a4;
- (id)outputStreamToFileAtURL:(id)a3 shouldAppend:(BOOL)a4;
@end

@implementation HMCameraClipFetchAssetContextOperationDataSource

- (id)createVideoFileCombinerWithVideoFileURLs:(id)a3 queue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[HMCameraClipVideoFileCombiner alloc] initWithVideoFileURLs:v6 queue:v5];

  return v7;
}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  id v5 = (void *)MEMORY[0x1E4F28CB8];
  id v6 = a3;
  v7 = [v5 defaultManager];
  LOBYTE(a4) = [v7 removeItemAtURL:v6 error:a4];

  return (char)a4;
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x1E4F28CB8];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 defaultManager];
  LOBYTE(a5) = [v10 copyItemAtURL:v9 toURL:v8 error:a5];

  return (char)a5;
}

- (id)createTemporaryDirectoryAppropriateForURL:(id)a3 error:(id *)a4
{
  id v5 = (void *)MEMORY[0x1E4F28CB8];
  id v6 = a3;
  v7 = [v5 defaultManager];
  id v8 = [v7 URLForDirectory:99 inDomain:1 appropriateForURL:v6 create:1 error:a4];

  return v8;
}

- (id)outputStreamToFileAtURL:(id)a3 shouldAppend:(BOOL)a4
{
  return (id)[MEMORY[0x1E4F1CAA8] outputStreamWithURL:a3 append:a4];
}

- (BOOL)writeData:(id)a3 toFileURL:(id)a4 error:(id *)a5
{
  return [a3 writeToURL:a4 options:0 error:a5];
}

- (id)dataFromEncryptedDataContext:(id)a3 usingDecryptionManager:(id)a4
{
  return (id)[a4 dataFromEncryptedDataContext:a3];
}

- (id)dataTaskWithURL:(id)a3 httpHeaderFields:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[HMCameraClipDownloadAssetDataTask alloc] initWithURL:v6 httpHeaderFields:v5];

  return v7;
}

@end