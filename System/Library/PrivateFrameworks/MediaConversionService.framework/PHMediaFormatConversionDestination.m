@interface PHMediaFormatConversionDestination
+ (id)destinationForConversionReturningUnchangedSource:(id)a3;
+ (id)sharedCleanupQueue;
- (BOOL)createTemporaryOutputDirectoryWithError:(id *)a3;
- (BOOL)createTemporaryOutputFileWithErrorError:(id *)a3;
- (BOOL)padImageToLength:(unint64_t)a3 fileHandle:(id)a4 error:(id *)a5;
- (BOOL)padToLength:(unint64_t)a3 error:(id *)a4;
- (BOOL)padVideoToLength:(unint64_t)a3 fileHandle:(id)a4 error:(id *)a5;
- (BOOL)usesSinglePassVideoConversion;
- (BOOL)waitForAvailabilityOfRange:(_NSRange)a3 timeout:(unint64_t)a4 error:(id *)a5;
- (NSString)outputPathExtension;
- (NSURL)temporaryOutputDirectoryURL;
- (NSURL)temporaryOutputFileURL;
- (PFVideoExportRangeCoordinator)singlePassVideoExportRangeCoordinator;
- (id)errorForSinglePassVideoConversionError:(id)a3;
- (id)temporaryDirectoryPrefix;
- (unint64_t)length;
- (unint64_t)singlePassVideoConversionTargetLength;
- (void)addAvailableRange:(_NSRange)a3;
- (void)dealloc;
- (void)enableSinglePassVideoConversionWithTargetLength:(unint64_t)a3;
- (void)generateTemporaryOutputFileURLForRequest:(id)a3;
- (void)removeTemporaryFiles;
- (void)removeTemporaryFilesWithCompletionHandler:(id)a3;
- (void)setOutputPathExtension:(id)a3;
- (void)setSinglePassVideoConversionTargetLength:(unint64_t)a3;
- (void)setSinglePassVideoExportRangeCoordinator:(id)a3;
@end

@implementation PHMediaFormatConversionDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputPathExtension, 0);
  objc_storeStrong((id *)&self->_singlePassVideoExportRangeCoordinator, 0);
  objc_storeStrong((id *)&self->_temporaryOutputFileURL, 0);
  objc_storeStrong((id *)&self->_temporaryOutputDirectoryURL, 0);
  objc_storeStrong((id *)&self->_temporaryFilesURLToDelete, 0);
}

- (void)setSinglePassVideoConversionTargetLength:(unint64_t)a3
{
  self->_singlePassVideoConversionTargetLength = a3;
}

- (unint64_t)singlePassVideoConversionTargetLength
{
  return self->_singlePassVideoConversionTargetLength;
}

- (void)setOutputPathExtension:(id)a3
{
}

- (NSString)outputPathExtension
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSinglePassVideoExportRangeCoordinator:(id)a3
{
}

- (PFVideoExportRangeCoordinator)singlePassVideoExportRangeCoordinator
{
  return (PFVideoExportRangeCoordinator *)objc_getProperty(self, a2, 64, 1);
}

- (id)errorForSinglePassVideoConversionError:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4F8D300]];

    if (v6 && (uint64_t v7 = [v4 code], (unint64_t)(v7 - 3) <= 2)) {
      uint64_t v8 = qword_1DD99A6D0[v7 - 3];
    }
    else {
      uint64_t v8 = 0;
    }
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28A50];
    v14[0] = v4;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v11 = [v9 errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:v8 userInfo:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)waitForAvailabilityOfRange:(_NSRange)a3 timeout:(unint64_t)a4 error:(id *)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (![(PHMediaFormatConversionDestination *)self usesSinglePassVideoConversion])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:811 description:@"Unexpected nil single pass video conversion range coordinator"];
  }
  singlePassVideoExportRangeCoordinator = self->_singlePassVideoExportRangeCoordinator;
  id v16 = 0;
  char v12 = -[PFVideoExportRangeCoordinator waitForAvailabilityOfRange:timeout:error:](singlePassVideoExportRangeCoordinator, "waitForAvailabilityOfRange:timeout:error:", location, length, a4, &v16);
  id v13 = v16;
  if (a5 && (v12 & 1) == 0)
  {
    *a5 = [(PHMediaFormatConversionDestination *)self errorForSinglePassVideoConversionError:v13];
  }

  return v12;
}

- (void)addAvailableRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ([(PHMediaFormatConversionDestination *)self usesSinglePassVideoConversion])
  {
    singlePassVideoExportRangeCoordinator = self->_singlePassVideoExportRangeCoordinator;
    -[PFVideoExportRangeCoordinator updateAvailableRange:](singlePassVideoExportRangeCoordinator, "updateAvailableRange:", 0, location + length);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unexpected nil single pass video conversion range coordinator", v7, 2u);
  }
}

- (BOOL)usesSinglePassVideoConversion
{
  return self->_singlePassVideoExportRangeCoordinator != 0;
}

- (void)enableSinglePassVideoConversionWithTargetLength:(unint64_t)a3
{
  self->_singlePassVideoConversionTargetLength = a3;
  self->_singlePassVideoExportRangeCoordinator = (PFVideoExportRangeCoordinator *)objc_opt_new();
  MEMORY[0x1F41817F8]();
}

- (BOOL)padImageToLength:(unint64_t)a3 fileHandle:(id)a4 error:(id *)a5
{
  id v8 = a4;
  unint64_t v9 = [(PHMediaFormatConversionDestination *)self length];
  if (v9 > a3)
  {
    char v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:1 userInfo:0];
    id v13 = v12;
    if (a5) {
      *a5 = v12;
    }
  }
  else
  {
    uint64_t v10 = a3 - [(PHMediaFormatConversionDestination *)self length];
    [v8 seekToEndOfFile];
    v11 = [MEMORY[0x1E4F1CA58] dataWithLength:v10];
    [v8 writeData:v11];

    self->super._NSUInteger length = a3;
  }

  return v9 <= a3;
}

- (BOOL)padVideoToLength:(unint64_t)a3 fileHandle:(id)a4 error:(id *)a5
{
  id v8 = a4;
  unint64_t v9 = [(PHMediaFormatConversionDestination *)self length] + 8;
  if (v9 > a3)
  {
    v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:1 userInfo:0];
    v15 = v14;
    if (a5) {
      *a5 = v14;
    }
  }
  else
  {
    unsigned int v10 = a3 - [(PHMediaFormatConversionDestination *)self length];
    unsigned int v11 = v10 - 8;
    char v12 = [MEMORY[0x1E4F1CA58] dataWithCapacity:v10];
    unsigned int v17 = bswap32(v10);
    [v12 appendBytes:&v17 length:4];
    [v12 appendBytes:"free" length:4];
    [v8 seekToEndOfFile];
    [v8 writeData:v12];
    [v12 setLength:0];
    if (v10 != 8)
    {
      LODWORD(v13) = 0x80000;
      do
      {
        if (v13 >= v11) {
          uint64_t v13 = v11;
        }
        else {
          uint64_t v13 = v13;
        }
        [v12 setLength:v13];
        [v8 writeData:v12];
        v11 -= v13;
      }
      while (v11);
    }
    self->super._NSUInteger length = a3;
  }
  return v9 <= a3;
}

- (BOOL)padToLength:(unint64_t)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if ([(PHMediaFormatConversionDestination *)self length] != a3)
  {
    id v8 = (void *)MEMORY[0x1E4F28CB0];
    unint64_t v9 = [(PHMediaFormatConversionContent *)self fileURL];
    id v17 = 0;
    unsigned int v10 = [v8 fileHandleForUpdatingURL:v9 error:&v17];
    id v11 = v17;

    if (v10)
    {
      if ([(PHMediaFormatConversionContent *)self isVideo])
      {
        BOOL v12 = [(PHMediaFormatConversionDestination *)self padVideoToLength:a3 fileHandle:v10 error:a4];
      }
      else
      {
        if (![(PHMediaFormatConversionContent *)self isImage])
        {
          [v10 closeFile];
          BOOL v7 = 0;
          goto LABEL_13;
        }
        BOOL v12 = [(PHMediaFormatConversionDestination *)self padImageToLength:a3 fileHandle:v10 error:a4];
      }
      BOOL v7 = v12;
LABEL_13:
      id v15 = v11;
      goto LABEL_14;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28A50];
    v21[0] = v11;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v15 = [v13 errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:1 userInfo:v14];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v15;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to open image filehandle for padding: %@", buf, 0xCu);
      if (a4) {
        goto LABEL_8;
      }
    }
    else if (a4)
    {
LABEL_8:
      id v15 = v15;
      BOOL v7 = 0;
      *a4 = v15;
LABEL_14:

      return v7;
    }
    BOOL v7 = 0;
    goto LABEL_14;
  }
  return 1;
}

- (void)dealloc
{
  singlePassVideoExportRangeCoordinator = self->_singlePassVideoExportRangeCoordinator;
  if (singlePassVideoExportRangeCoordinator) {
    [(PFVideoExportRangeCoordinator *)singlePassVideoExportRangeCoordinator cancel];
  }
  [(PHMediaFormatConversionDestination *)self removeTemporaryFiles];
  v4.receiver = self;
  v4.super_class = (Class)PHMediaFormatConversionDestination;
  [(PHMediaFormatConversionDestination *)&v4 dealloc];
}

- (void)removeTemporaryFilesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() sharedCleanupQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PHMediaFormatConversionDestination_removeTemporaryFilesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6CFEA00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __80__PHMediaFormatConversionDestination_removeTemporaryFilesWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeTemporaryFiles];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)removeTemporaryFiles
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  temporaryFilesURLToDelete = self->_temporaryFilesURLToDelete;
  if (temporaryFilesURLToDelete)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      id v19 = self;
      __int16 v20 = 2112;
      *(void *)v21 = self;
      *(_WORD *)&v21[8] = 2112;
      *(void *)&v21[10] = temporaryFilesURLToDelete;
      _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Delete temporary output %p %@ %@", buf, 0x20u);
      temporaryFilesURLToDelete = self->_temporaryFilesURLToDelete;
    }
    id v4 = [(NSURL *)temporaryFilesURLToDelete lastPathComponent];
    v5 = [(PHMediaFormatConversionDestination *)self temporaryDirectoryPrefix];
    int v6 = [v4 hasPrefix:v5];

    if (v6)
    {
      BOOL v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      int v8 = [v7 BOOLForKey:@"PHMediaFormatConversionKeepTemporaryFiles"];

      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v9 = [(NSURL *)self->_temporaryFilesURLToDelete path];
          *(_DWORD *)buf = 138543618;
          id v19 = v9;
          __int16 v20 = 2112;
          *(void *)v21 = @"PHMediaFormatConversionKeepTemporaryFiles";
          _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Not deleting temporary media conversion files at %{public}@ because the %@ user defaults key is set", buf, 0x16u);
        }
      }
      else
      {
        id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
        BOOL v12 = self->_temporaryFilesURLToDelete;
        id v17 = 0;
        int v13 = [v11 removeItemAtURL:v12 error:&v17];
        v14 = (PHMediaFormatConversionDestination *)v17;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          id v15 = self->_temporaryFilesURLToDelete;
          *(_DWORD *)buf = 138412802;
          id v19 = (PHMediaFormatConversionDestination *)v15;
          __int16 v20 = 1024;
          *(_DWORD *)v21 = v13;
          *(_WORD *)&v21[4] = 2112;
          *(void *)&v21[6] = v14;
          _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Deleted temporary output: %@ %d %@", buf, 0x1Cu);
        }
        if ((v13 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v14;
          _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to delete temporary output: %@", buf, 0xCu);
        }
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      unsigned int v10 = self->_temporaryFilesURLToDelete;
      *(_DWORD *)buf = 138412290;
      id v19 = (PHMediaFormatConversionDestination *)v10;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Won't delete temporary output outside of temporary directory: %@", buf, 0xCu);
    }
    id v16 = self->_temporaryFilesURLToDelete;
    self->_temporaryFilesURLToDelete = 0;
  }
}

- (NSURL)temporaryOutputFileURL
{
  temporaryOutputFileURL = self->_temporaryOutputFileURL;
  if (!temporaryOutputFileURL)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"PHMediaFormatConversion.m", 662, @"You must call generateTemporaryOutputFileURLForRequest before calling %@", v7 object file lineNumber description];

    temporaryOutputFileURL = self->_temporaryOutputFileURL;
  }
  return temporaryOutputFileURL;
}

- (NSURL)temporaryOutputDirectoryURL
{
  temporaryOutputDirectoryURL = self->_temporaryOutputDirectoryURL;
  if (!temporaryOutputDirectoryURL)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"PHMediaFormatConversion.m", 656, @"You must call generateTemporaryOutputFileURLForRequest before calling %@", v7 object file lineNumber description];

    temporaryOutputDirectoryURL = self->_temporaryOutputDirectoryURL;
  }
  return temporaryOutputDirectoryURL;
}

- (BOOL)createTemporaryOutputFileWithErrorError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_temporaryOutputFileURL)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v12 = NSStringFromSelector(a2);
    [v11 handleFailureInMethod:a2, self, @"PHMediaFormatConversion.m", 636, @"You must call generateTemporaryOutputFileURLForRequest before calling %@", v12 object file lineNumber description];
  }
  if (![(PHMediaFormatConversionDestination *)self createTemporaryOutputDirectoryWithError:a3])return 0; {
  v5 = [MEMORY[0x1E4F1C9B8] data];
  }
  temporaryOutputFileURL = self->_temporaryOutputFileURL;
  id v13 = 0;
  char v7 = [v5 writeToURL:temporaryOutputFileURL options:0 error:&v13];
  id v8 = v13;

  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create format conversion output temporary file: %@", buf, 0xCu);
      if (!a3) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    if (a3) {
LABEL_7:
    }
      *a3 = v8;
  }
LABEL_8:

  return v7;
}

- (BOOL)createTemporaryOutputDirectoryWithError:(id *)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (!self->_temporaryOutputDirectoryURL)
  {
    BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = NSStringFromSelector(a2);
    [v12 handleFailureInMethod:a2, self, @"PHMediaFormatConversion.m", 618, @"You must call generateTemporaryOutputFileURLForRequest before calling %@", v13 object file lineNumber description];
  }
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [(NSURL *)self->_temporaryOutputDirectoryURL path];
  uint64_t v17 = *MEMORY[0x1E4F28320];
  v18[0] = @"mobile";
  char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  id v14 = 0;
  char v8 = [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v7 error:&v14];
  id v9 = v14;

  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v9;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create format conversion output temporary directory: %@", buf, 0xCu);
      if (!a3) {
        goto LABEL_8;
      }
    }
    else if (!a3)
    {
      goto LABEL_8;
    }
    *a3 = v9;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&self->_temporaryFilesURLToDelete, self->_temporaryOutputDirectoryURL);
LABEL_8:

  return v8;
}

- (void)generateTemporaryOutputFileURLForRequest:(id)a3
{
  id v26 = a3;
  if (([v26 preflighted] & 1) == 0)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PHMediaFormatConversion.m", 591, @"Invalid parameter not satisfying: %@", @"request.preflighted" object file lineNumber description];
  }
  v5 = [v26 directoryForTemporaryFiles];

  if (!v5)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PHMediaFormatConversion.m", 592, @"Invalid parameter not satisfying: %@", @"request.directoryForTemporaryFiles" object file lineNumber description];
  }
  int v6 = [v26 directoryForTemporaryFiles];
  char v7 = NSString;
  char v8 = [(PHMediaFormatConversionDestination *)self temporaryDirectoryPrefix];
  id v9 = [v26 identifier];
  unsigned int v10 = [v7 stringWithFormat:@"%@-%@/", v8, v9];
  id v11 = [v6 URLByAppendingPathComponent:v10 isDirectory:1];
  temporaryOutputDirectoryURL = self->_temporaryOutputDirectoryURL;
  self->_temporaryOutputDirectoryURL = v11;

  id v13 = [v26 outputFilename];
  id v14 = v13;
  if (v13)
  {
    if (![v13 length])
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:599 description:@"Unexpected nil or zero-length requested output filename"];
    }
    id v15 = v14;
  }
  else
  {
    id v16 = [v26 source];
    uint64_t v17 = [v16 fileURL];

    id v15 = [v17 lastPathComponent];
    if (![v15 length])
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:604 description:@"Unexpected nil or zero-length input filename"];
    }
  }
  if (self->_outputPathExtension)
  {
    v18 = [v15 stringByDeletingPathExtension];
    uint64_t v19 = [v18 stringByAppendingPathExtension:self->_outputPathExtension];

    id v15 = (id)v19;
  }
  __int16 v20 = [(NSURL *)self->_temporaryOutputDirectoryURL URLByAppendingPathComponent:v15];
  temporaryOutputFileURL = self->_temporaryOutputFileURL;
  self->_temporaryOutputFileURL = v20;

  objc_storeStrong((id *)&self->super._fileURL, self->_temporaryOutputFileURL);
}

- (id)temporaryDirectoryPrefix
{
  return @"PHMediaFormatConversionRequest";
}

- (unint64_t)length
{
  if ([(PHMediaFormatConversionDestination *)self usesSinglePassVideoConversion])
  {
    return [(PHMediaFormatConversionDestination *)self singlePassVideoConversionTargetLength];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PHMediaFormatConversionDestination;
    return [(PHMediaFormatConversionContent *)&v4 length];
  }
}

+ (id)sharedCleanupQueue
{
  if (sharedCleanupQueue_onceToken != -1) {
    dispatch_once(&sharedCleanupQueue_onceToken, &__block_literal_global_400);
  }
  v2 = (void *)sharedCleanupQueue_sharedCleanupQueue;
  return v2;
}

uint64_t __56__PHMediaFormatConversionDestination_sharedCleanupQueue__block_invoke()
{
  sharedCleanupQueue_sharedCleanupQueue = (uint64_t)dispatch_queue_create("com.apple.photos.mediaformatconversion.destination.cleanup", 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)destinationForConversionReturningUnchangedSource:(id)a3
{
  id v3 = a3;
  objc_super v4 = objc_opt_new();
  v5 = [v3 fileURL];
  [v4 setFileURL:v5];

  uint64_t v6 = [v3 length];
  v4[1] = v6;
  return v4;
}

@end