@interface PFUbiquitySafeSaveFile
- (BOOL)loadFileFromLocation:(id)a3 error:(id *)a4;
- (BOOL)moveToPermanentLocation:(id *)a3;
- (BOOL)removeFileFromLocation:(void *)a3 error:;
- (BOOL)waitForFileToUpload:(id *)a3;
- (BOOL)writeFileToLocation:(id)a3 error:(id *)a4;
- (PFUbiquitySafeSaveFile)init;
- (PFUbiquitySafeSaveFile)initWithPermanentLocation:(id)a3 safeSaveLocation:(id)a4 andLocalPeerID:(id)a5;
- (id)description;
- (uint64_t)downloadLatestVersion:(uint64_t *)a3 error:;
- (uint64_t)existsInCloud;
- (uint64_t)isFileDownloaded:(uint64_t)a1;
- (uint64_t)isFileUploaded:(uint64_t)result;
- (uint64_t)safeSaveFile:(char)a3 moveToPermanentLocation:(void *)a4 error:;
- (void)checkFileDownload;
- (void)checkSafeSaveFileUpload;
- (void)checkSafeSaveFileUploadAsync;
- (void)dealloc;
- (void)safeSaveFinishedUpload;
- (void)setCurrentLocation:(void *)result;
- (void)setSafeSaveError:(void *)result;
@end

@implementation PFUbiquitySafeSaveFile

- (PFUbiquitySafeSaveFile)init
{
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquitySafeSaveFile;
  v2 = [(PFUbiquitySafeSaveFile *)&v5 init];
  v3 = v2;
  if (v2)
  {
    *((_WORD *)v2 + 28) = 0;
    *((void *)v2 + 8) = 0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *((void *)v2 + 9) = dispatch_semaphore_create(0);
    *((_WORD *)v3 + 20) = 0;
    *((void *)v3 + 6) = 0;
  }
  return (PFUbiquitySafeSaveFile *)v3;
}

- (PFUbiquitySafeSaveFile)initWithPermanentLocation:(id)a3 safeSaveLocation:(id)a4 andLocalPeerID:(id)a5
{
  v8 = [(PFUbiquitySafeSaveFile *)self init];
  if (v8)
  {
    v8->_localPeerID = (NSString *)a5;
    v8->_permanentLocation = (PFUbiquityLocation *)a3;
    v8->_safeSaveLocation = (PFUbiquityLocation *)a4;
    -[PFUbiquitySafeSaveFile setCurrentLocation:](v8, v8->_permanentLocation);
  }
  return v8;
}

- (void)setCurrentLocation:(void *)result
{
  if (result)
  {
    v3 = result;
    v4 = (void *)result[3];
    if (v4 != a2)
    {

      result = a2;
      v3[3] = result;
    }
  }
  return result;
}

- (void)dealloc
{
  self->_currentLocation = 0;
  self->_permanentLocation = 0;

  self->_localPeerID = 0;
  self->_safeSaveLocation = 0;

  self->_safeSaveError = 0;
  self->_downloadError = 0;
  safeSaveSemaphore = self->_safeSaveSemaphore;
  if (safeSaveSemaphore)
  {
    dispatch_release(safeSaveSemaphore);
    self->_safeSaveSemaphore = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PFUbiquitySafeSaveFile;
  [(PFUbiquitySafeSaveFile *)&v4 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquitySafeSaveFile;
  return (id)[NSString stringWithFormat:@"%@(%d)\n\tpermanentLocation: %@\n\tsafeLocation: %@\n\tcurrentLocation: %@\n", -[PFUbiquitySafeSaveFile description](&v3, sel_description), self->_safeSaveSuccess, self->_permanentLocation, self->_safeSaveLocation, self->_currentLocation];
}

- (uint64_t)existsInCloud
{
  if (a1)
  {
    v2 = (void **)(a1 + 2);
    if (-[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](a1[2], a1[4], 0))
    {
      self;
      char v3 = _usesCloudDocs ^ 1;
    }
    else
    {
      v2 = (void **)(a1 + 1);
      char v3 = -[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](a1[1], a1[4], 0);
    }
    -[PFUbiquitySafeSaveFile setCurrentLocation:](a1, *v2);
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)downloadLatestVersion:(uint64_t *)a3 error:
{
  uint64_t v3 = a1;
  v43[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v34 = 0;
    if (-[PFUbiquitySafeSaveFile isFileDownloaded:](a1, (uint64_t)a3))
    {
      v6 = 0;
LABEL_4:
      uint64_t v3 = 1;
LABEL_27:

      return v3;
    }
    v7 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, *(void *)(v3 + 24), *(void *)(v3 + 32));
    v6 = v7;
    if (v7)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v37 = 0;
      uint64_t v8 = *(void *)(v3 + 24);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __54__PFUbiquitySafeSaveFile_downloadLatestVersion_error___block_invoke;
      v33[3] = &unk_1E544E958;
      v33[4] = buf;
      -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v7, v8, 1, 1, &v34, (uint64_t)v33);
      if (!*(unsigned char *)(*(void *)&buf[8] + 24))
      {
LABEL_20:
        _Block_object_dispose(buf, 8);
        goto LABEL_21;
      }
      if (a2)
      {
        uint64_t v35 = 0;
        if (-[PFUbiquitySafeSaveFile isFileDownloaded:](v3, (uint64_t)&v35))
        {
LABEL_9:
          _Block_object_dispose(buf, 8);
          goto LABEL_4;
        }
        uint64_t v10 = v35;
        if (v35) {
          goto LABEL_19;
        }
        *(unsigned char *)(v3 + 40) = 1;
        self;
        id v11 = (id)-[PFUbiquitySwitchboard filePresenterForUbiquityRootLocation:andLocalPeerID:]((id *)_sharedSwitchboard, *(void *)(v3 + 24), *(void *)(v3 + 32));
        -[PFUbiquityFilePresenter registerSafeSaveFile:]((uint64_t)v11, v3);
        *(unsigned char *)(v3 + 80) = 1;

        -[PFUbiquitySafeSaveFile checkFileDownload](v3);
        v12 = *(NSObject **)(v3 + 72);
        dispatch_time_t v13 = dispatch_time(0, 120000000000);
        if (!dispatch_semaphore_wait(v12, v13) && *(unsigned char *)(v3 + 57)) {
          goto LABEL_9;
        }
        uint64_t v35 = *(void *)(v3 + 48);
        if (!v35)
        {
          v14 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v42 = *MEMORY[0x1E4F28568];
          v43[0] = @"The file download timed out.";
          uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
          uint64_t v35 = [v14 errorWithDomain:*MEMORY[0x1E4F281F8] code:512 userInfo:v15];
        }
        if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nDownload failed for file, error: %@", "-[PFUbiquitySafeSaveFile waitForFileToDownload:]", 492, v3, v35);
        }
        uint64_t v10 = v35;
        if (v35)
        {
LABEL_19:
          uint64_t v34 = v10;
        }
        else
        {
          uint64_t v25 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m");
          v32 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v38 = 136315394;
            v39 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiqui"
                  "tySafeSaveFile.m";
            __int16 v40 = 1024;
            int v41 = 497;
            _os_log_fault_impl(&dword_18AB82000, v32, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v38, 0x12u);
          }
        }
        goto LABEL_20;
      }
      char v9 = -[PFUbiquitySafeSaveFile isFileDownloaded:](v3, (uint64_t)&v34);
      _Block_object_dispose(buf, 8);
      if (v9) {
        goto LABEL_4;
      }
    }
LABEL_21:
    if (v34)
    {
      if (a3)
      {
        uint64_t v3 = 0;
        *a3 = v34;
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v16 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m");
      v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structu"
                             "re/PFUbiquitySafeSaveFile.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 160;
        _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    uint64_t v3 = 0;
    goto LABEL_27;
  }
  return v3;
}

- (uint64_t)isFileDownloaded:(uint64_t)a1
{
  self;
  if (_usesCloudDocs) {
    return 1;
  }
  uint64_t v5 = *(void *)(a1 + 24);

  return -[PFUbiquityLocation fileAtLocationIsDownloaded:](v5, a2);
}

uint64_t __54__PFUbiquitySafeSaveFile_downloadLatestVersion_error___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (BOOL)removeFileFromLocation:(void *)a3 error:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 1;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3052000000;
  uint64_t v34 = __Block_byref_object_copy__70;
  uint64_t v35 = __Block_byref_object_dispose__70;
  uint64_t v36 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v6 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)a2);
  v7 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)a2, a1[4]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __55__PFUbiquitySafeSaveFile_removeFileFromLocation_error___block_invoke;
  v26[3] = &unk_1E544F7C8;
  v26[4] = &v27;
  v26[5] = &v37;
  v26[6] = &v31;
  [v7 coordinateWritingItemAtURL:v6 options:1 error:v32 + 5 byAccessor:v26];
  if (!*((unsigned char *)v28 + 24))
  {
    uint64_t v8 = -[PFUbiquityLocation createFullPath]((uint64_t)a2);
    if (unlink((const char *)[v8 fileSystemRepresentation]))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0])
      {
        char v9 = __error();
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to remove file at location: %@\nerrno: %d", "-[PFUbiquitySafeSaveFile removeFileFromLocation:error:]", 206, a1, a2, *v9);
      }
      char v10 = 0;
    }
    else
    {
      char v10 = 1;
    }
    *((unsigned char *)v38 + 24) = v10;
  }
  if (*((unsigned char *)v38 + 24) && [a2 isEqual:a1[3]])
  {
    uint64_t v11 = a1[2];
    v12 = (void *)a1[3];
    dispatch_time_t v13 = (void *)a1[1];
    if (v12 != (void *)v11)
    {
      if (v12 != v13 || !-[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](v11, a1[4], 0)) {
        goto LABEL_16;
      }
      dispatch_time_t v13 = (void *)a1[2];
    }
    -[PFUbiquitySafeSaveFile setCurrentLocation:](a1, v13);
  }
LABEL_16:
  if (!*((unsigned char *)v38 + 24))
  {
    uint64_t v16 = (void *)[(id)v32[5] domain];
    if ([v16 isEqualToString:*MEMORY[0x1E4F281F8]]
      && [(id)v32[5] code] == 4)
    {
      *((unsigned char *)v38 + 24) = 1;
      v32[5] = 0;
    }
    else
    {
      uint64_t v17 = v32[5];
      if (v17)
      {
        if (a3) {
          *a3 = v17;
        }
      }
      else
      {
        uint64_t v18 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m");
        uint64_t v25 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v42 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m";
          __int16 v43 = 1024;
          int v44 = 232;
          _os_log_fault_impl(&dword_18AB82000, v25, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
    }
  }

  BOOL v14 = *((unsigned char *)v38 + 24) != 0;
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  return v14;
}

uint64_t __55__PFUbiquitySafeSaveFile_removeFileFromLocation_error___block_invoke(void *a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", a2, *(void *)(a1[6] + 8) + 40);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (uint64_t)safeSaveFile:(char)a3 moveToPermanentLocation:(void *)a4 error:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v18 = 0;
  *(unsigned char *)(a1 + 57) = 0;
  *(void *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 58) = a3;
  -[PFUbiquitySafeSaveFile setCurrentLocation:]((void *)a1, *(void **)(a1 + 16));
  if (![(id)a1 writeFileToLocation:*(void *)(a1 + 24) error:&v18])
  {
LABEL_8:
    if (v18)
    {
      if (a4)
      {
        uint64_t v8 = 0;
        *a4 = v18;
        return v8;
      }
    }
    else
    {
      uint64_t v9 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m");
      uint64_t v16 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m";
        __int16 v21 = 1024;
        int v22 = 275;
        _os_log_fault_impl(&dword_18AB82000, v16, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    return 0;
  }
  self;
  id v7 = (id)-[PFUbiquitySwitchboard filePresenterForUbiquityRootLocation:andLocalPeerID:]((id *)_sharedSwitchboard, *(void *)(a1 + 24), *(void *)(a1 + 32));
  -[PFUbiquityFilePresenter registerSafeSaveFile:]((uint64_t)v7, a1);
  *(unsigned char *)(a1 + 80) = 1;

  self;
  if ((_usesCloudDocs & 1) == 0)
  {
    if (!a2)
    {
      uint64_t v8 = 1;
      *(unsigned char *)(a1 + 56) = 1;
      -[PFUbiquitySafeSaveFile checkSafeSaveFileUploadAsync](a1);
      return v8;
    }
    if ([(id)a1 waitForFileToUpload:&v18]) {
      return 1;
    }
    goto LABEL_8;
  }
  uint64_t v8 = 1;
  *(unsigned char *)(a1 + 57) = 1;
  -[PFUbiquitySafeSaveFile safeSaveFinishedUpload](a1);
  return v8;
}

- (void)checkSafeSaveFileUploadAsync
{
  if (a1 && *(unsigned char *)(a1 + 56))
  {
    uint64_t v1 = *(void *)(a1 + 24);
    if (v1 && *(unsigned char *)(v1 + 88))
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __54__PFUbiquitySafeSaveFile_checkSafeSaveFileUploadAsync__block_invoke;
      v3[3] = &unk_1E544B868;
      v3[4] = a1;
      +[_PFUbiquityRecordsImporter afterDelay:executeBlockOnRootQueue:](30.0, (uint64_t)_PFUbiquityRecordsImporter, (uint64_t)v3);
    }
    else
    {
      v2[0] = MEMORY[0x1E4F143A8];
      v2[1] = 3221225472;
      v2[2] = __54__PFUbiquitySafeSaveFile_checkSafeSaveFileUploadAsync__block_invoke_2;
      v2[3] = &unk_1E544B868;
      v2[4] = a1;
      +[_PFUbiquityRecordsImporter executeBlockOnRootQueue:]((uint64_t)_PFUbiquityRecordsImporter, (uint64_t)v2);
    }
  }
}

- (void)safeSaveFinishedUpload
{
  *(unsigned char *)(a1 + 56) = 0;
  if (*(unsigned char *)(a1 + 57))
  {
    if (*(unsigned char *)(a1 + 58))
    {
      objc_super v4 = 0;
      char v2 = [(id)a1 moveToPermanentLocation:&v4];
      *(unsigned char *)(a1 + 57) = v2;
      if ((v2 & 1) == 0) {
        -[PFUbiquitySafeSaveFile setSafeSaveError:]((void *)a1, v4);
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
  if (*(unsigned char *)(a1 + 80))
  {
    self;
    id v3 = (id)-[PFUbiquitySwitchboard filePresenterForUbiquityRootLocation:andLocalPeerID:]((id *)_sharedSwitchboard, *(void *)(a1 + 24), *(void *)(a1 + 32));
    -[PFUbiquityFilePresenter unregisterSafeSaveFile:]((uint64_t)v3, a1);
    *(unsigned char *)(a1 + 80) = 0;
  }
}

- (BOOL)waitForFileToUpload:(id *)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  safeSaveError = 0;
  if ((-[PFUbiquitySafeSaveFile isFileUploaded:]((uint64_t)self, (uint64_t)&safeSaveError) & 1) == 0)
  {
    id v7 = safeSaveError;
    if (safeSaveError) {
      goto LABEL_11;
    }
    self->_continueCheckingUpload = 1;
    -[PFUbiquitySafeSaveFile checkSafeSaveFileUploadAsync]((uint64_t)self);
    safeSaveSemaphore = self->_safeSaveSemaphore;
    dispatch_time_t v9 = dispatch_time(0, 120000000000);
    if (!dispatch_semaphore_wait(safeSaveSemaphore, v9) && self->_safeSaveSuccess) {
      return 1;
    }
    safeSaveError = self->_safeSaveError;
    if (!safeSaveError)
    {
      uint64_t v10 = *MEMORY[0x1E4F281F8];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27[0] = @"The file upload timed out.";
      safeSaveError = (NSError *)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v10, 512, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1));
    }
    BOOL v11 = +[PFUbiquityLogging canLogMessageAtLevel:0];
    id v7 = safeSaveError;
    if (v11)
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSafe save failed for file, error: %@", "-[PFUbiquitySafeSaveFile waitForFileToUpload:]", 309, self, safeSaveError);
      id v7 = safeSaveError;
    }
LABEL_10:
    if (!v7)
    {
      uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m");
      uint64_t v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m";
        __int16 v24 = 1024;
        int v25 = 314;
        _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
      return 0;
    }
LABEL_11:
    if (a3)
    {
      BOOL v5 = 0;
      *a3 = v7;
      return v5;
    }
    return 0;
  }
  BOOL v5 = 1;
  self->_continueCheckingUpload = 1;
  -[PFUbiquitySafeSaveFile checkSafeSaveFileUpload]((uint64_t)self);
  BOOL safeSaveSuccess = self->_safeSaveSuccess;
  id v7 = self->_safeSaveError;
  safeSaveError = v7;
  if (!safeSaveSuccess) {
    goto LABEL_10;
  }
  return v5;
}

- (uint64_t)isFileUploaded:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    self;
    if (_usesCloudDocs)
    {
      return 1;
    }
    else
    {
      uint64_t v4 = *(void *)(v3 + 24);
      return -[PFUbiquityLocation fileAtLocationIsUploaded:](v4, a2);
    }
  }
  return result;
}

- (void)checkSafeSaveFileUpload
{
  if (a1 && *(unsigned char *)(a1 + 56))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Checking peer file upload: %@", "-[PFUbiquitySafeSaveFile checkSafeSaveFileUpload]", 394, a1);
    }
    char v2 = 0;
    if (-[PFUbiquitySafeSaveFile isFileUploaded:](a1, (uint64_t)&v2))
    {
      *(unsigned char *)(a1 + 57) = 1;
LABEL_9:
      -[PFUbiquitySafeSaveFile safeSaveFinishedUpload](a1);
      return;
    }
    if (v2)
    {
      -[PFUbiquitySafeSaveFile setSafeSaveError:]((void *)a1, v2);
      *(unsigned char *)(a1 + 57) = 0;
      goto LABEL_9;
    }
    -[PFUbiquitySafeSaveFile checkSafeSaveFileUploadAsync](a1);
  }
}

- (BOOL)moveToPermanentLocation:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3052000000;
  uint64_t v23 = __Block_byref_object_copy__70;
  __int16 v24 = __Block_byref_object_dispose__70;
  uint64_t v25 = 0;
  BOOL v5 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)self->_permanentLocation);
  v6 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)self->_safeSaveLocation);
  id v7 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)self->_permanentLocation);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __50__PFUbiquitySafeSaveFile_moveToPermanentLocation___block_invoke;
  v19[3] = &unk_1E544FD28;
  v19[5] = &v26;
  v19[6] = &v20;
  v19[4] = self;
  [v5 coordinateWritingItemAtURL:v7 options:8 writingItemAtURL:v6 options:2 error:v21 + 5 byAccessor:v19];
  if (*((unsigned char *)v27 + 24)) {
    -[PFUbiquitySafeSaveFile setCurrentLocation:](self, self->_permanentLocation);
  }
  if (!*((unsigned char *)v27 + 24))
  {
    uint64_t v10 = (void *)v21[5];
    if (v10)
    {
      if (a3) {
        *a3 = v10;
      }
    }
    else
    {
      uint64_t v11 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m");
      uint64_t v18 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m";
        __int16 v32 = 1024;
        int v33 = 349;
        _os_log_fault_impl(&dword_18AB82000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  char v8 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v8;
}

void __50__PFUbiquitySafeSaveFile_moveToPermanentLocation___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = 0;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", a2, a3, 0, 0, &v8, *(void *)(a1[6] + 8) + 40);
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSuccessfully moved file from: %@ to: %@", "-[PFUbiquitySafeSaveFile moveToPermanentLocation:]_block_invoke", 338, a1[4], a3, a2);
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
  {
    uint64_t v6 = a1[4];
    id v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nHad trouble file from: %@ to: %@\nError: %@\nuserInfo: %@", "-[PFUbiquitySafeSaveFile moveToPermanentLocation:]_block_invoke", 340, v6, a3, a2, v7, [v7 userInfo]);
  }
}

- (BOOL)loadFileFromLocation:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)writeFileToLocation:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)setSafeSaveError:(void *)result
{
  char v2 = (void *)result[8];
  if (v2 != a2)
  {
    uint64_t v4 = result;

    uint64_t result = a2;
    v4[8] = result;
  }
  return result;
}

void __54__PFUbiquitySafeSaveFile_checkSafeSaveFileUploadAsync__block_invoke(uint64_t a1)
{
}

void __54__PFUbiquitySafeSaveFile_checkSafeSaveFileUploadAsync__block_invoke_2(uint64_t a1)
{
}

- (void)checkFileDownload
{
  if (a1 && *(unsigned char *)(a1 + 40))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nChecking file download: %@", "-[PFUbiquitySafeSaveFile checkFileDownload]", 505, a1, *(void *)(a1 + 24));
    }
    id v7 = 0;
    if (-[PFUbiquitySafeSaveFile isFileDownloaded:](a1, (uint64_t)&v7))
    {
      char v2 = 1;
    }
    else
    {
      uint64_t v3 = v7;
      if (!v7) {
        return;
      }
      uint64_t v4 = *(void **)(a1 + 48);
      if (v4 == v7)
      {
        char v2 = 0;
      }
      else
      {

        id v5 = v3;
        char v2 = 0;
        *(void *)(a1 + 48) = v5;
      }
    }
    *(unsigned char *)(a1 + 41) = v2;
    *(unsigned char *)(a1 + 40) = 0;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
    if (*(unsigned char *)(a1 + 80))
    {
      self;
      id v6 = (id)-[PFUbiquitySwitchboard filePresenterForUbiquityRootLocation:andLocalPeerID:]((id *)_sharedSwitchboard, *(void *)(a1 + 24), *(void *)(a1 + 32));
      -[PFUbiquityFilePresenter unregisterSafeSaveFile:]((uint64_t)v6, a1);
      *(unsigned char *)(a1 + 80) = 0;
    }
  }
}

@end