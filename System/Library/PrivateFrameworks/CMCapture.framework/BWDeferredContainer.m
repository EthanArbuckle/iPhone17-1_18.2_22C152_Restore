@interface BWDeferredContainer
+ (BOOL)archiveObjectWithURL:(id)a3 object:(id)a4 error:(id *)a5;
+ (id)archiveObject:(id)a3 error:(id *)a4;
+ (id)buildArchiveClasses:(id)a3;
+ (id)manifestDictionaryForApplicationIdentifier:(id)a3 captureRequestIdentifier:(id)a4 photoDescriptors:(id)a5;
+ (id)manifestDictionaryForURL:(id)a3 err:(int *)a4;
+ (id)unarchiveObject:(id)a3 classes:(id)a4 error:(id *)a5;
+ (id)unarchiveObjectWithURL:(id)a3 classes:(id)a4 error:(id *)a5;
+ (int)validateManifestURLSize:(id)a3;
+ (void)initialize;
- (BOOL)hasTag:(id)a3;
- (BOOL)valid:(int *)a3;
- (BWDeferredContainer)init;
- (BWDeferredContainer)initWithApplicationID:(id)a3 captureRequestIdentifier:(id)a4 baseFolderURL:(id)a5 queuePriority:(unsigned int)a6 err:(int *)a7;
- (BWDeferredContainer)initWithApplicationID:(id)a3 resolvedSettings:(id)a4 unresolvedSettings:(id)a5 pipelineParameters:(id)a6 intermediates:(id)a7 photoDescriptors:(id)a8;
- (BWDeferredPipelineParameters)pipelineParameters;
- (BWStillImageCaptureSettings)captureSettings;
- (FigCaptureStillImageSettings)settings;
- (NSArray)bufferAttributes;
- (NSArray)intermediates;
- (NSArray)photoDescriptors;
- (NSDictionary)manifest;
- (NSString)applicationID;
- (NSString)captureRequestIdentifier;
- (NSString)prettyDescription;
- (id)description;
- (int64_t)manifestVersion;
- (uint64_t)_containerManifestURL;
- (uint64_t)_containerSessionDataURL;
- (uint64_t)_getUUIDBytes:(int)a3 high:;
- (uint64_t)_intermediateArrayURLForTag:(uint64_t)result;
- (uint64_t)_intermediateBufferURLForTag:(int)a3 compressionProfile:;
- (uint64_t)_intermediateFolderURL;
- (uint64_t)_intermediateForTag:(uint64_t)result;
- (uint64_t)_pipelineParametersURL;
- (uint64_t)_stillImageCaptureSettingsURL;
- (uint64_t)_stillImageSettingsURL;
- (uint64_t)_validate;
- (uint64_t)_writeManifest;
- (unint64_t)captureRequestIdentifierBytesHigh;
- (unint64_t)captureRequestIdentifierBytesLow;
- (unsigned)processingType;
- (void)dealloc;
@end

@implementation BWDeferredContainer

- (BOOL)hasTag:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  intermediates = self->_intermediates;
  uint64_t v7 = [(NSMutableArray *)intermediates countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(intermediates);
        }
        if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "tag")))
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSMutableArray *)intermediates countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:
  pthread_rwlock_unlock(p_lock);
  return v11;
}

uint64_t __43__BWDeferredContainer__intermediateForTag___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 tag];
  return [v2 isEqualToString:v3];
}

uint64_t __33__BWDeferredContainer_initialize__block_invoke()
{
  sContainerDateFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28D48]);
  uint64_t v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9A8], "calendarWithIdentifier:", *MEMORY[0x1E4F1C318]), "timeZone");
  [(id)sContainerDateFormatter setTimeZone:v0];
  v1 = (void *)sContainerDateFormatter;
  uint64_t v2 = [(id)sContainerDateFormatter formatOptions] | 0x800;
  return [v1 setFormatOptions:v2];
}

- (BWStillImageCaptureSettings)captureSettings
{
  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  v4 = self->_stillImageCaptureSettings;
  pthread_rwlock_unlock(p_lock);
  return v4;
}

- (FigCaptureStillImageSettings)settings
{
  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  v4 = self->_stillImageSettings;
  pthread_rwlock_unlock(p_lock);
  return v4;
}

- (uint64_t)_intermediateForTag:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void **)(result + 272);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__BWDeferredContainer__intermediateForTag___block_invoke;
    v5[3] = &unk_1E5C293B8;
    v5[4] = a2;
    uint64_t v4 = [v3 indexOfObjectPassingTest:v5];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    else {
      return [*(id *)(v2 + 272) objectAtIndexedSubscript:v4];
    }
  }
  return result;
}

- (BWDeferredPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (unint64_t)captureRequestIdentifierBytesLow
{
  return -[BWDeferredContainer _getUUIDBytes:high:]((uint64_t)self, (uint64_t)self->_captureRequestIdentifier, 0);
}

- (unint64_t)captureRequestIdentifierBytesHigh
{
  return -[BWDeferredContainer _getUUIDBytes:high:]((uint64_t)self, (uint64_t)self->_captureRequestIdentifier, 1);
}

- (uint64_t)_getUUIDBytes:(int)a3 high:
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v9[0] = 0;
  v9[1] = 0;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:a2];
  v5 = v4;
  if (v4)
  {
    [v4 getUUIDBytes:v9];
    uint64_t v6 = 1;
    if (!a3) {
      uint64_t v6 = 0;
    }
    uint64_t v7 = v9[v6];
  }
  else
  {
    FigDebugAssert3();
    uint64_t v7 = 0;
  }

  return v7;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
  if (initialize_sContainerDateFormatterToken != -1)
  {
    dispatch_once(&initialize_sContainerDateFormatterToken, &__block_literal_global_76);
  }
}

- (BWDeferredContainer)initWithApplicationID:(id)a3 resolvedSettings:(id)a4 unresolvedSettings:(id)a5 pipelineParameters:(id)a6 intermediates:(id)a7 photoDescriptors:(id)a8
{
  long long v14 = [(BWDeferredContainer *)self init];
  long long v15 = v14;
  if (v14)
  {
    pthread_rwlock_init(&v14->_lock, 0);
    v15->_baseFolderURL = 0;
    v15->_applicationID = (NSString *)[a3 copy];
    v15->_captureRequestIdentifier = 0;
    v15->_stillImageCaptureSettings = (BWStillImageCaptureSettings *)a4;
    v15->_stillImageSettings = (FigCaptureStillImageSettings *)a5;
    v15->_pipelineParameters = (BWDeferredPipelineParameters *)a6;
    v15->_intermediates = (NSMutableArray *)[a7 copy];
    v15->_photoDescriptors = (NSMutableArray *)[a8 copy];
  }
  return v15;
}

- (BWDeferredContainer)init
{
  v4.receiver = self;
  v4.super_class = (Class)BWDeferredContainer;
  uint64_t v2 = [(BWDeferredContainer *)&v4 init];
  if (v2)
  {
    v2->_creationTimeNS = FigGetUpTimeNanoseconds();
    v2->_manifestVersion = 8;
  }
  return v2;
}

- (BWDeferredContainer)initWithApplicationID:(id)a3 captureRequestIdentifier:(id)a4 baseFolderURL:(id)a5 queuePriority:(unsigned int)a6 err:(int *)a7
{
  BOOL v11 = [(BWDeferredContainer *)self init];
  v12 = v11;
  if (v11)
  {
    pthread_rwlock_init(&v11->_lock, 0);
    v12->_baseFolderURL = (NSURL *)[a5 copy];
    v12->_applicationID = (NSString *)[a3 copy];
    v12->_captureRequestIdentifier = (NSString *)[a4 copy];
  }
  if (a7) {
    *a7 = 0;
  }
  return v12;
}

- (void)dealloc
{
  pthread_rwlock_destroy(&self->_lock);

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredContainer;
  [(BWDeferredContainer *)&v3 dealloc];
}

- (unsigned)processingType
{
  int v3 = [(BWStillImageCaptureSettings *)self->_stillImageCaptureSettings captureType];
  if (v3 == 1)
  {
    if (([(BWStillImageCaptureSettings *)self->_stillImageCaptureSettings captureFlags] & 0x80) != 0) {
      return 3;
    }
    else {
      return 0;
    }
  }
  else if (v3 == 12)
  {
    return 2;
  }
  else
  {
    return v3 == 10;
  }
}

+ (id)archiveObject:(id)a3 error:(id *)a4
{
  id v9 = 0;
  if (a3)
  {
    id result = (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v9];
    if (!result)
    {
      LODWORD(v8) = 0;
      FigDebugAssert3();
      objc_msgSend(v9, "code", v8, v4);
      FigSignalErrorAt();
      id result = 0;
    }
  }
  else
  {
    LODWORD(v8) = 0;
    FigDebugAssert3();
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -16134, 0, v8, v4);
    id result = 0;
    id v9 = v7;
  }
  if (a4) {
    *a4 = v9;
  }
  return result;
}

+ (BOOL)archiveObjectWithURL:(id)a3 object:(id)a4 error:(id *)a5
{
  v12 = 0;
  if (a3)
  {
    uint64_t v8 = (void *)[a1 archiveObject:a4 error:&v12];
    if (v8) {
      LOBYTE(v8) = [v8 writeToURL:a3 options:1 error:&v12];
    }
    if (a5) {
      goto LABEL_5;
    }
  }
  else
  {
    LODWORD(v11) = 0;
    FigDebugAssert3();
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -16134, 0, v11, v5);
    LOBYTE(v8) = 0;
    v12 = (void *)v9;
    if (a5) {
LABEL_5:
    }
      *a5 = v12;
  }
  return (char)v8;
}

+ (id)unarchiveObject:(id)a3 classes:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v12 = 0;
  if (a3)
  {
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:a3 error:&v12];
    if (v7)
    {
      objc_msgSend(v7, "setDelegate:", +[FigCaptureCIFilterUnarchiverDelegate sharedInstance](FigCaptureCIFilterUnarchiverDelegate, "sharedInstance"));
      uint64_t v9 = (void *)[v7 decodeTopLevelObjectOfClasses:a4 forKey:*MEMORY[0x1E4F284E8] error:&v12];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    LODWORD(v11) = 0;
    FigDebugAssert3();
    uint64_t v9 = 0;
    v12 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -16134, 0, v11, v5);
  }

  if (a5) {
    *a5 = v12;
  }
  return v9;
}

+ (id)unarchiveObjectWithURL:(id)a3 classes:(id)a4 error:(id *)a5
{
  v12 = 0;
  if (!a3)
  {
    LODWORD(v11) = 0;
    FigDebugAssert3();
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -16134, 0, v11, v5);
    id result = 0;
    v12 = (void *)v10;
    if (!a5) {
      return result;
    }
    goto LABEL_5;
  }
  id result = (id)[MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:0 error:&v12];
  if (result) {
    id result = (id)[a1 unarchiveObject:result classes:a4 error:a5];
  }
  if (a5) {
LABEL_5:
  }
    *a5 = v12;
  return result;
}

+ (int)validateManifestURLSize:(id)a3
{
  if (!a3)
  {
    FigDebugAssert3();
    return -16134;
  }
  id v7 = 0;
  int v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(a3, "path"), &v7);
  if (v3) {
    BOOL v4 = v7 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    int v5 = 0;
LABEL_12:
    if ((unint64_t)[v3 fileSize] > 0x100000) {
      return -16132;
    }
    return v5;
  }
  if ([v7 code] == 260) {
    int v5 = -16131;
  }
  else {
    int v5 = -16132;
  }
  if (v3) {
    goto LABEL_12;
  }
  return v5;
}

+ (id)manifestDictionaryForURL:(id)a3 err:(int *)a4
{
  id v20 = 0;
  if (!a3)
  {
    FigDebugAssert3();
    long long v16 = 0;
    uint64_t v8 = 0;
    int v17 = -16134;
    goto LABEL_10;
  }
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CB10] fileURLWithPath:objc_msgSend(NSString, "stringWithFormat:", @"%@/%@", objc_msgSend(a3, "path"), @"manifest.plist"];
  if (!v8) {
    goto LABEL_16;
  }
  int v9 = +[BWDeferredContainer validateManifestURLSize:v8];
  if (v9)
  {
    int v17 = v9;
    long long v16 = 0;
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  uint64_t v8 = (void *)[MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8];
  if (!v8)
  {
    FigDebugAssert3();
    goto LABEL_16;
  }
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v8 error:&v20];
  if (!v8)
  {
    LODWORD(v19) = 0;
    FigDebugAssert3();
    objc_msgSend(v20, "code", v19, v4);
    int v17 = FigSignalErrorAt();
LABEL_19:
    long long v16 = 0;
    goto LABEL_10;
  }
  uint64_t v10 = [v8 decodeTopLevelObjectOfClass:objc_opt_class() forKey:@"CaptureRequestIdentifier" error:&v20];
  if (!v10)
  {
    int v17 = [v20 code];
    goto LABEL_19;
  }
  id v11 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
  if (!v11)
  {
LABEL_16:
    long long v16 = 0;
    int v17 = -16132;
    goto LABEL_10;
  }
  v12 = v11;
  long long v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_msgSend(v8, "decodeTopLevelObjectOfClasses:forKey:error:", objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0), @"PhotoDescriptors", &v20);
  if (v15)
  {
    long long v16 = objc_msgSend(a1, "manifestDictionaryForApplicationIdentifier:captureRequestIdentifier:photoDescriptors:", objc_msgSend((id)objc_msgSend(a3, "URLByDeletingLastPathComponent"), "lastPathComponent"), objc_msgSend(v12, "UUIDString"), v15);
    int v17 = 0;
  }
  else
  {
    long long v16 = 0;
    int v17 = [v20 code];
  }
LABEL_10:

  if (a4) {
    *a4 = v17;
  }
  return v16;
}

+ (id)manifestDictionaryForApplicationIdentifier:(id)a3 captureRequestIdentifier:(id)a4 photoDescriptors:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3 && a4 && a5)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v6 = [a5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v18 = *(void *)v22;
      CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      id obj = a5;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(obj);
          }
          int v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (v9) {
            [*(id *)(*((void *)&v21 + 1) + 8 * i) presentationTimeStamp];
          }
          else {
            memset(&time, 0, sizeof(time));
          }
          CFDictionaryRef v10 = CMTimeCopyAsDictionary(&time, allocator);
          uint64_t v11 = objc_msgSend((id)sContainerDateFormatter, "stringFromDate:", objc_msgSend(v9, "time"));
          v27[0] = @"PhotoIdentifier";
          v28[0] = [v9 photoIdentifier];
          v28[1] = v11;
          v27[1] = @"Time";
          v27[2] = @"TimeZone";
          v28[2] = objc_msgSend((id)objc_msgSend(v9, "timeZone"), "name");
          v28[3] = v10;
          v27[3] = @"PTS";
          v27[4] = @"ProcessingFlags";
          v28[4] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "processingFlags"));
          objc_msgSend(v19, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, v27, 5));
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v7);
    }
    v25[0] = @"ApplicationIdentifier";
    v25[1] = @"CaptureRequestIdentifier";
    v26[0] = a3;
    v26[1] = a4;
    v25[2] = @"Photos";
    v26[2] = v19;
    v12 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  }
  else
  {
    FigDebugAssert3();
    return 0;
  }
  return v12;
}

+ (id)buildArchiveClasses:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  return (id)[v11 setByAddingObjectsFromSet:a3];
}

- (uint64_t)_validate
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(uint64_t *)(result + 240) < 7)
    {
      return 4294951166;
    }
    else if (*(void *)(result + 232) {
           && *(void *)(result + 248)
    }
           && *(void *)(result + 256)
           && [*(id *)(result + 272) count]
           && [*(id *)(v1 + 280) count])
    {
      return 0;
    }
    else
    {
      FigDebugAssert3();
      return 4294951164;
    }
  }
  return result;
}

- (BOOL)valid:(int *)a3
{
  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  int v6 = -[BWDeferredContainer _validate]((uint64_t)self);
  pthread_rwlock_unlock(p_lock);
  if (a3) {
    *a3 = v6;
  }
  return v6 == 0;
}

- (NSString)applicationID
{
  uint64_t v2 = self->_applicationID;
  return v2;
}

- (NSString)captureRequestIdentifier
{
  uint64_t v2 = self->_captureRequestIdentifier;
  return v2;
}

- (int64_t)manifestVersion
{
  return self->_manifestVersion;
}

- (NSDictionary)manifest
{
  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  uint64_t v4 = +[BWDeferredContainer manifestDictionaryForApplicationIdentifier:self->_applicationID captureRequestIdentifier:self->_captureRequestIdentifier photoDescriptors:self->_photoDescriptors];
  pthread_rwlock_unlock(p_lock);
  return v4;
}

- (NSArray)intermediates
{
  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_intermediates];
  pthread_rwlock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSString)prettyDescription
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  int v3 = (NSString *)(id)[v2 copy];

  return v3;
}

- (id)description
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p> captureRequestIdentifier:%@ version:%ld\n", objc_opt_class(), self, self->_captureRequestIdentifier, self->_manifestVersion];
  p_lock = &self->_lock;
  uint64_t v5 = pthread_rwlock_rdlock(&self->_lock);
  int v6 = (void *)MEMORY[0x1A6272C70](v5);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  photoDescriptors = self->_photoDescriptors;
  uint64_t v8 = [(NSMutableArray *)photoDescriptors countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(photoDescriptors);
        }
        [v3 appendFormat:@"%@\n", *(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v9 = [(NSMutableArray *)photoDescriptors countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  intermediates = self->_intermediates;
  uint64_t v13 = [(NSMutableArray *)intermediates countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(intermediates);
        }
        [v3 appendFormat:@"%@\n", *(void *)(*((void *)&v18 + 1) + 8 * j)];
      }
      uint64_t v14 = [(NSMutableArray *)intermediates countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
  pthread_rwlock_unlock(p_lock);
  return (id)[v3 copy];
}

- (uint64_t)_writeManifest
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v9 = 0;
  int v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  if (v3)
  {
    pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 16));
    objc_msgSend(v3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithLong:", *(void *)(a1 + 240)), @"Version");
    [v3 encodeObject:*(void *)(a1 + 232) forKey:@"CaptureRequestIdentifier"];
    [v3 encodeObject:*(void *)(a1 + 272) forKey:@"Intermediates"];
    [v3 encodeObject:*(void *)(a1 + 280) forKey:@"PhotoDescriptors"];
    pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 16));
    [v3 finishEncoding];
    uint64_t v4 = (void *)[v3 encodedData];
    uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
    v10[0] = [*(id *)(a1 + 216) path];
    v10[1] = @"manifest.plist";
    if ((objc_msgSend(v4, "writeToURL:options:error:", objc_msgSend(v5, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v10, 2)), 1, &v9) & 1) == 0)
    {
      LODWORD(v8) = 0;
      FigDebugAssert3();
      objc_msgSend(v9, "code", v8, v1);
      FigSignalErrorAt();
    }
    uint64_t v6 = 0;
  }
  else
  {
    FigDebugAssert3();
    uint64_t v6 = 4294951163;
  }

  return v6;
}

- (uint64_t)_containerManifestURL
{
  v2[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (void *)MEMORY[0x1E4F1CB10];
    v2[0] = [*(id *)(result + 216) path];
    v2[1] = @"manifest.plist";
    return objc_msgSend(v1, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v2, 2));
  }
  return result;
}

- (uint64_t)_containerSessionDataURL
{
  v2[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (void *)MEMORY[0x1E4F1CB10];
    v2[0] = [*(id *)(result + 216) path];
    v2[1] = @"session.plist";
    return objc_msgSend(v1, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v2, 2));
  }
  return result;
}

- (uint64_t)_pipelineParametersURL
{
  v2[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (void *)MEMORY[0x1E4F1CB10];
    v2[0] = [*(id *)(result + 216) path];
    v2[1] = @"BWDeferredPipelineParameters.plist";
    return objc_msgSend(v1, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v2, 2));
  }
  return result;
}

- (uint64_t)_stillImageCaptureSettingsURL
{
  v2[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (void *)MEMORY[0x1E4F1CB10];
    v2[0] = [*(id *)(result + 216) path];
    v2[1] = @"BWStillImageCaptureSettings.plist";
    return objc_msgSend(v1, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v2, 2));
  }
  return result;
}

- (uint64_t)_stillImageSettingsURL
{
  v2[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (void *)MEMORY[0x1E4F1CB10];
    v2[0] = [*(id *)(result + 216) path];
    v2[1] = @"FigCaptureStillImageSettings.plist";
    return objc_msgSend(v1, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v2, 2));
  }
  return result;
}

- (uint64_t)_intermediateFolderURL
{
  v2[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (void *)MEMORY[0x1E4F1CB10];
    v2[0] = [*(id *)(result + 216) path];
    v2[1] = @"Intermediates";
    return objc_msgSend(v1, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v2, 2));
  }
  return result;
}

- (uint64_t)_intermediateArrayURLForTag:(uint64_t)result
{
  v5[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    int v3 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v4 = [*(id *)(result + 216) path];
    v5[2] = [NSString stringWithFormat:@"%@.%@", a2, @"plist", v4, @"Intermediates"];
    return objc_msgSend(v3, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v5, 3));
  }
  return result;
}

- (uint64_t)_intermediateBufferURLForTag:(int)a3 compressionProfile:
{
  v7[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    if (a3 == 1)
    {
      uint64_t v4 = @"heif";
    }
    else
    {
      if (a3 != 2) {
        return 0;
      }
      uint64_t v4 = @"jpeg";
    }
    id result = [NSString stringWithFormat:@"%@.%@", a2, v4];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = (void *)MEMORY[0x1E4F1CB10];
      v7[0] = [*(id *)(v3 + 216) path];
      v7[1] = @"Intermediates";
      v7[2] = v5;
      return objc_msgSend(v6, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v7, 3));
    }
  }
  return result;
}

- (NSArray)photoDescriptors
{
  return &self->_photoDescriptors->super;
}

- (NSArray)bufferAttributes
{
  return self->_bufferAttributes;
}

@end