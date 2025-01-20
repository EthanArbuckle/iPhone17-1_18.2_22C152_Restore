@interface BWDeferredCaptureContainer
+ (id)captureRequestIdentifierForManifest:(id)a3;
+ (id)timeForManifest:(id)a3 index:(unint64_t)a4;
- (BOOL)cached;
- (BOOL)committed;
- (BWDeferredCaptureContainer)initWithApplicationID:(id)a3 captureRequestIdentifier:(id)a4 baseFolderURL:(id)a5 flushBuffersUponCommit:(BOOL)a6 err:(int *)a7;
- (id)copyXPCEncoding:(int *)a3;
- (int)abort;
- (int)commit;
- (int)commitArray:(id)a3 tag:(id)a4;
- (int)commitBuffer:(__CVBuffer *)a3 tag:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6 compressionProfile:(int)a7 metadataTag:(id)a8 portType:(id)a9;
- (int)commitBuffer:(__CVBuffer *)a3 tag:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6 compressionProfile:(int)a7 metadataTag:(id)a8 rawThumbnailsBufferTag:(id)a9 rawThumbnailsMetadataTag:(id)a10 mainRawThumbnailBufferTag:(id)a11 mainRawThumbnailMetadataTag:(id)a12 sifrRawThumbnailBufferTag:(id)a13 sifrRawThumbnailMetadataTag:(id)a14 portType:(id)a15;
- (int)commitCaptureSettings:(id)a3 settings:(id)a4;
- (int)commitDictionary:(id)a3 tag:(id)a4;
- (int)commitInference:(id)a3 tag:(id)a4 inferenceAttachmentKey:(id)a5 portType:(id)a6;
- (int)commitInferenceBuffer:(__CVBuffer *)a3 tag:(id)a4 metadataTag:(id)a5 inferenceAttachedMediaKey:(id)a6 compressionProfile:(int)a7 portType:(id)a8;
- (int)commitMetadata:(id)a3 tag:(id)a4 bufferTag:(id)a5;
- (int)commitPhotoDescriptor:(id)a3;
- (int)flush;
- (int)preflush;
- (int)waitForFlush;
- (int)waitForFlushWithTimeoutInSeconds:(int)a3;
- (int64_t)commitDurationNS;
- (int64_t)flushDurationNS;
- (uint64_t)_addIntermediateObjectToXPCDictionary:(void *)a3 xpcDictionary:;
- (uint64_t)_createFolders;
- (unint64_t)cacheExpiryTime;
- (void)dealloc;
- (void)setCacheExpiryTime:(unint64_t)a3;
- (void)setCached:(BOOL)a3;
@end

@implementation BWDeferredCaptureContainer

+ (id)captureRequestIdentifierForManifest:(id)a3
{
  if (a3)
  {
    return (id)[a3 objectForKeyedSubscript:@"CaptureRequestIdentifier"];
  }
  else
  {
    FigDebugAssert3();
    return 0;
  }
}

+ (id)timeForManifest:(id)a3 index:(unint64_t)a4
{
  if (!a3
    || (v5 = (void *)[a3 objectForKeyedSubscript:@"Photos"]) == 0
    || (v6 = (void *)[v5 objectAtIndexedSubscript:a4]) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  v7 = v6;
  if (![v6 objectForKeyedSubscript:@"Time"]) {
    return 0;
  }
  v8 = (void *)sContainerDateFormatter;
  uint64_t v9 = [v7 objectForKeyedSubscript:@"Time"];
  return (id)[v8 dateFromString:v9];
}

- (BWDeferredCaptureContainer)initWithApplicationID:(id)a3 captureRequestIdentifier:(id)a4 baseFolderURL:(id)a5 flushBuffersUponCommit:(BOOL)a6 err:(int *)a7
{
  v13 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    -[BWDeferredContainer _getUUIDBytes:high:]((uint64_t)self, (uint64_t)a4, 0);
    -[BWDeferredContainer _getUUIDBytes:high:]((uint64_t)self, (uint64_t)a4, 1);
    kdebug_trace();
  }
  int v17 = 0;
  v16.receiver = self;
  v16.super_class = (Class)BWDeferredCaptureContainer;
  v14 = [(BWDeferredContainer *)&v16 initWithApplicationID:a3 captureRequestIdentifier:a4 baseFolderURL:a5 queuePriority:14 err:&v17];
  if (v14)
  {
    [+[BWDeferredTransactionBroker sharedInstance] openTransaction:3 name:a4];
    v14->_flushQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v14->_flushGroup = (OS_dispatch_group *)dispatch_group_create();
    v14->_flushBuffersUponCommit = a6;
    v14->_committed = 0;
    v14->_preflushed = 0;
    v14->_cacheExpiryTime = -1;
    v14->super._intermediates = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14->super._photoDescriptors = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14->super._pipelineParameters = objc_alloc_init(BWDeferredPipelineParameters);
  }
  if (a7) {
    *a7 = v17;
  }
  if (*v13 == 1) {
    kdebug_trace();
  }
  return v14;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_flushQueue);
  dispatch_release((dispatch_object_t)self->_flushGroup);
  v3.receiver = self;
  v3.super_class = (Class)BWDeferredCaptureContainer;
  [(BWDeferredContainer *)&v3 dealloc];
}

- (uint64_t)_addIntermediateObjectToXPCDictionary:(void *)a3 xpcDictionary:
{
  if (result)
  {
    unsigned int v7 = 0;
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    if (v5
      && (xpc_dictionary_set_value(a3, (const char *)objc_msgSend((id)objc_msgSend(a2, "tag"), "UTF8String"), v5),
          (v6 = (void *)[a2 archive:&v7]) != 0))
    {
      xpc_dictionary_set_value(v5, "Object", v6);
    }
    else
    {
      FigDebugAssert3();
      unsigned int v7 = -16133;
    }
    xpc_release(v5);
    return v7;
  }
  return result;
}

- (id)copyXPCEncoding:(int *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  p_lock = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (!v6 || (unsigned int v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1]) == 0)
  {
    FigDebugAssert3();
    uint64_t v9 = 0;
LABEL_22:
    pthread_rwlock_unlock(p_lock);

    int v20 = -16133;
LABEL_16:
    xpc_release(v6);
    xpc_object_t v6 = 0;
    goto LABEL_17;
  }
  v8 = v7;
  objc_msgSend(v7, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithLong:", self->super._manifestVersion), @"Version");
  [v8 encodeObject:self->super._applicationID forKey:@"ApplicationID"];
  [v8 encodeObject:self->_commitTime forKey:@"CommitTime"];
  [v8 encodeObject:self->super._baseFolderURL forKey:@"BaseFolder"];
  [v8 encodeObject:self->super._captureRequestIdentifier forKey:@"CaptureRequestIdentifier"];
  [v8 encodeObject:self->super._stillImageCaptureSettings forKey:@"StillImageCaptureSettings"];
  [v8 encodeObject:self->super._stillImageSettings forKey:@"StillImageSettings"];
  [v8 encodeObject:self->super._intermediates forKey:@"Intermediates"];
  [v8 encodeObject:self->super._photoDescriptors forKey:@"PhotoDescriptors"];
  [v8 finishEncoding];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "encodedData"), "copy");

  v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (!v10
    || (v11 = v10,
        xpc_dictionary_set_value(v6, "Container", v10),
        xpc_release(v11),
        (xpc_object_t v12 = xpc_dictionary_create(0, 0, 0)) == 0))
  {
    FigDebugAssert3();
    goto LABEL_22;
  }
  v13 = v12;
  v22 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  intermediates = self->super._intermediates;
  uint64_t v15 = [(NSMutableArray *)intermediates countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(intermediates);
        }
        int v19 = -[BWDeferredCaptureContainer _addIntermediateObjectToXPCDictionary:xpcDictionary:]((uint64_t)self, *(void **)(*((void *)&v23 + 1) + 8 * i), v13);
        if (v19)
        {
          int v20 = v19;
          FigDebugAssert3();
          goto LABEL_15;
        }
      }
      uint64_t v16 = [(NSMutableArray *)intermediates countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  xpc_dictionary_set_value(v6, "IntermediateObjects", v13);
  int v20 = 0;
LABEL_15:
  pthread_rwlock_unlock(p_lock);
  xpc_release(v13);

  a3 = v22;
  if (v20) {
    goto LABEL_16;
  }
LABEL_17:
  if (a3) {
    *a3 = v20;
  }
  return v6;
}

- (uint64_t)_createFolders
{
  v8[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    if (*(unsigned char *)(result + 313)) {
      return 0;
    }
    id v7 = 0;
    objc_super v3 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    if (objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(*(id *)(v2 + 216), "path"), 1, 0, &v7))
    {
      v4 = (void *)MEMORY[0x1E4F1CB10];
      v8[0] = [*(id *)(v2 + 216) path];
      v8[1] = @"Intermediates";
      if (objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend((id)objc_msgSend(v4, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v8, 2)), "path"), 1, 0, &v7))
      {
        result = 0;
        *(unsigned char *)(v2 + 313) = 1;
        return result;
      }
      uint64_t v6 = v1;
      LODWORD(v5) = 0;
    }
    else
    {
      uint64_t v6 = v1;
      LODWORD(v5) = 0;
    }
    FigDebugAssert3();
    objc_msgSend(v7, "code", v5, v6);
    return FigSignalErrorAt();
  }
  return result;
}

- (int)commitCaptureSettings:(id)a3 settings:(id)a4
{
  id v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  pthread_rwlock_wrlock(&self->super._lock);
  if (a3 && a4)
  {
    if (self->_committed)
    {
      FigDebugAssert3();
      int v8 = -16135;
    }
    else
    {
      self->super._stillImageCaptureSettings = (BWStillImageCaptureSettings *)a3;
      self->super._stillImageSettings = (FigCaptureStillImageSettings *)[a4 copy];
      pthread_rwlock_unlock(&self->super._lock);
      int v8 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v8 = -16134;
  }
  if (*v7 == 1) {
    kdebug_trace();
  }
  return v8;
}

- (int)commitPhotoDescriptor:(id)a3
{
  uint64_t v5 = [a3 photoIdentifier];
  uint64_t v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  p_lock = &self->super._lock;
  pthread_rwlock_wrlock(&self->super._lock);
  if (!v5) {
    goto LABEL_14;
  }
  if (!a3)
  {
    v18[5] = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    goto LABEL_14;
  }
  [a3 presentationTimeStamp];
  if ((v19 & 0x100000000) == 0)
  {
LABEL_14:
    FigDebugAssert3();
    int v15 = -16134;
    goto LABEL_9;
  }
  if (self->_committed)
  {
    FigDebugAssert3();
  }
  else
  {
    photoDescriptors = self->super._photoDescriptors;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__BWDeferredCaptureContainer_commitPhotoDescriptor___block_invoke;
    v18[3] = &unk_1E5C293E0;
    v18[4] = a3;
    if ([(NSMutableArray *)photoDescriptors indexOfObjectPassingTest:v18] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = [a3 processingFlags] & 0xFFFFCFFF | 0x2000;
      v10 = [BWPhotoDescriptor alloc];
      uint64_t v11 = [a3 photoIdentifier];
      uint64_t v12 = [a3 time];
      uint64_t v13 = [a3 timeZone];
      [a3 presentationTimeStamp];
      v14 = [(BWPhotoDescriptor *)v10 initWithPhotoIdentifier:v11 processingFlags:v9 time:v12 timeZone:v13 presentationTimeStamp:v17];
      [(NSMutableArray *)self->super._photoDescriptors addObject:v14];

      int v15 = 0;
      goto LABEL_9;
    }
  }
  int v15 = -16135;
LABEL_9:
  pthread_rwlock_unlock(p_lock);
  if (*v6 == 1) {
    kdebug_trace();
  }
  return v15;
}

uint64_t __52__BWDeferredCaptureContainer_commitPhotoDescriptor___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (void *)[a2 photoIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) photoIdentifier];
  return [v3 isEqualToString:v4];
}

- (int)commitArray:(id)a3 tag:(id)a4
{
  id v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  pthread_rwlock_wrlock(&self->super._lock);
  int v8 = 0;
  int v9 = -16134;
  if (a3 && a4)
  {
    if (self->_committed)
    {
      int v8 = 0;
    }
    else
    {
      int v8 = (void *)[a3 copy];
      if (!-[BWDeferredContainer _intermediateForTag:]((uint64_t)self, (uint64_t)a4))
      {
        v10 = -[BWDeferredArrayIntermediate initWithArray:tag:URL:]([BWDeferredArrayIntermediate alloc], "initWithArray:tag:URL:", v8, a4, -[BWDeferredContainer _intermediateArrayURLForTag:]((uint64_t)self, (uint64_t)a4));
        [(BWDeferredIntermediate *)v10 setSettingsID:[(FigCaptureStillImageSettings *)self->super._stillImageSettings settingsID]];
        [(NSMutableArray *)self->super._intermediates addObject:v10];

        int v9 = 0;
        goto LABEL_8;
      }
    }
    int v9 = -16135;
  }
LABEL_8:
  pthread_rwlock_unlock(&self->super._lock);

  if (*v7 == 1) {
    kdebug_trace();
  }
  return v9;
}

- (int)commitInference:(id)a3 tag:(id)a4 inferenceAttachmentKey:(id)a5 portType:(id)a6
{
  uint64_t v11 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  pthread_rwlock_wrlock(&self->super._lock);
  uint64_t v12 = 0;
  int v13 = -16134;
  if (a3 && a4 && a5)
  {
    if (self->_committed)
    {
      uint64_t v12 = 0;
    }
    else
    {
      if ([a3 conformsToProtocol:&unk_1EFB0A148]) {
        id v14 = (id)[a3 copy];
      }
      else {
        id v14 = a3;
      }
      uint64_t v12 = v14;
      if (!-[BWDeferredContainer _intermediateForTag:]((uint64_t)self, (uint64_t)a4))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v15 = -[BWDeferredInferenceArrayIntermediate initWithArray:tag:inferenceAttachmentKey:portType:URL:]([BWDeferredInferenceArrayIntermediate alloc], "initWithArray:tag:inferenceAttachmentKey:portType:URL:", v12, a4, a5, a6, -[BWDeferredContainer _intermediateArrayURLForTag:]((uint64_t)self, (uint64_t)a4));
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Committing a deferred inference for key '%@' of type %@ must be implemented.", a5, objc_opt_class()), 0 reason userInfo];
            objc_exception_throw(v18);
          }
          int v15 = -[BWDeferredInferenceDictionaryIntermediate initWithDictionary:tag:inferenceAttachmentKey:portType:URL:]([BWDeferredInferenceDictionaryIntermediate alloc], "initWithDictionary:tag:inferenceAttachmentKey:portType:URL:", v12, a4, a5, a6, -[BWDeferredContainer _intermediateArrayURLForTag:]((uint64_t)self, (uint64_t)a4));
        }
        uint64_t v16 = v15;
        if (v15)
        {
          [(BWDeferredIntermediate *)v15 setSettingsID:[(FigCaptureStillImageSettings *)self->super._stillImageSettings settingsID]];
          [(NSMutableArray *)self->super._intermediates addObject:v16];
        }
        int v13 = 0;
        goto LABEL_18;
      }
    }
    int v13 = -16135;
  }
LABEL_18:
  pthread_rwlock_unlock(&self->super._lock);

  if (*v11 == 1) {
    kdebug_trace();
  }
  return v13;
}

- (int)commitBuffer:(__CVBuffer *)a3 tag:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6 compressionProfile:(int)a7 metadataTag:(id)a8 rawThumbnailsBufferTag:(id)a9 rawThumbnailsMetadataTag:(id)a10 mainRawThumbnailBufferTag:(id)a11 mainRawThumbnailMetadataTag:(id)a12 sifrRawThumbnailBufferTag:(id)a13 sifrRawThumbnailMetadataTag:(id)a14 portType:(id)a15
{
  v21 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  p_lock = &self->super._lock;
  pthread_rwlock_wrlock(&self->super._lock);
  int v23 = -16134;
  if (a3 && a4)
  {
    if (self->_committed)
    {
      int v23 = -16135;
    }
    else
    {
      LODWORD(v28) = a7;
      long long v24 = -[BWDeferredBufferIntermediate initWithBuffer:tag:bufferType:captureFrameFlags:metadataTag:rawThumbnailsBufferTag:rawThumbnailsMetadataTag:mainRawThumbnailBufferTag:mainRawThumbnailMetadataTag:sifrRawThumbnailBufferTag:sifrRawThumbnailMetadataTag:portType:compressionProfile:URL:]([BWDeferredBufferIntermediate alloc], "initWithBuffer:tag:bufferType:captureFrameFlags:metadataTag:rawThumbnailsBufferTag:rawThumbnailsMetadataTag:mainRawThumbnailBufferTag:mainRawThumbnailMetadataTag:sifrRawThumbnailBufferTag:sifrRawThumbnailMetadataTag:portType:compressionProfile:URL:", a3, a4, a5, a6, a8, a9, a10, a11, a12, a13, a14, a15, v28, -[BWDeferredContainer _intermediateBufferURLForTag:compressionProfile:]((uint64_t)self, (uint64_t)a4, a7));
      [(BWDeferredIntermediate *)v24 setSettingsID:[(FigCaptureStillImageSettings *)self->super._stillImageSettings settingsID]];
      [(NSMutableArray *)self->super._intermediates addObject:v24];

      if (self->_flushBuffersUponCommit)
      {
        int v23 = -[BWDeferredCaptureContainer _createFolders]((uint64_t)self);
        v21 = (_DWORD *)MEMORY[0x1E4F1EBA8];
        p_lock = &self->super._lock;
        if (v23)
        {
          FigDebugAssert3();
        }
        else
        {
          flushGroup = self->_flushGroup;
          flushQueue = self->_flushQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __272__BWDeferredCaptureContainer_commitBuffer_tag_bufferType_captureFrameFlags_compressionProfile_metadataTag_rawThumbnailsBufferTag_rawThumbnailsMetadataTag_mainRawThumbnailBufferTag_mainRawThumbnailMetadataTag_sifrRawThumbnailBufferTag_sifrRawThumbnailMetadataTag_portType___block_invoke;
          block[3] = &unk_1E5C24430;
          block[4] = v24;
          dispatch_group_async(flushGroup, flushQueue, block);
        }
      }
      else
      {
        int v23 = 0;
        v21 = (_DWORD *)MEMORY[0x1E4F1EBA8];
        p_lock = &self->super._lock;
      }
    }
  }
  pthread_rwlock_unlock(p_lock);
  if (*v21 == 1) {
    kdebug_trace();
  }
  return v23;
}

uint64_t __272__BWDeferredCaptureContainer_commitBuffer_tag_bufferType_captureFrameFlags_compressionProfile_metadataTag_rawThumbnailsBufferTag_rawThumbnailsMetadataTag_mainRawThumbnailBufferTag_mainRawThumbnailMetadataTag_sifrRawThumbnailBufferTag_sifrRawThumbnailMetadataTag_portType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) flush];
}

- (int)commitBuffer:(__CVBuffer *)a3 tag:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6 compressionProfile:(int)a7 metadataTag:(id)a8 portType:(id)a9
{
  return [(BWDeferredCaptureContainer *)self commitBuffer:a3 tag:a4 bufferType:a5 captureFrameFlags:a6 compressionProfile:*(void *)&a7 metadataTag:a8 rawThumbnailsBufferTag:0 rawThumbnailsMetadataTag:0 mainRawThumbnailBufferTag:0 mainRawThumbnailMetadataTag:0 sifrRawThumbnailBufferTag:0 sifrRawThumbnailMetadataTag:0 portType:a9];
}

- (int)commitMetadata:(id)a3 tag:(id)a4 bufferTag:(id)a5
{
  int v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  pthread_rwlock_wrlock(&self->super._lock);
  v10 = 0;
  int v11 = -16134;
  if (a3 && a4)
  {
    if (self->_committed)
    {
      v10 = 0;
    }
    else
    {
      v10 = (void *)[a3 copy];
      if (!-[BWDeferredContainer _intermediateForTag:]((uint64_t)self, (uint64_t)a4))
      {
        uint64_t v12 = -[BWDeferredMetadataIntermediate initWithMetadata:tag:bufferTag:URL:]([BWDeferredMetadataIntermediate alloc], "initWithMetadata:tag:bufferTag:URL:", v10, a4, a5, -[BWDeferredContainer _intermediateArrayURLForTag:]((uint64_t)self, (uint64_t)a4));
        [(BWDeferredIntermediate *)v12 setSettingsID:[(FigCaptureStillImageSettings *)self->super._stillImageSettings settingsID]];
        [(NSMutableArray *)self->super._intermediates addObject:v12];

        int v11 = 0;
        goto LABEL_8;
      }
    }
    int v11 = -16135;
  }
LABEL_8:
  pthread_rwlock_unlock(&self->super._lock);

  if (*v9 == 1) {
    kdebug_trace();
  }
  return v11;
}

- (int)commitInferenceBuffer:(__CVBuffer *)a3 tag:(id)a4 metadataTag:(id)a5 inferenceAttachedMediaKey:(id)a6 compressionProfile:(int)a7 portType:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  pthread_rwlock_wrlock(&self->super._lock);
  int v15 = -16134;
  if (a3 && a4 && a6)
  {
    if (self->_committed)
    {
      int v15 = -16135;
    }
    else
    {
      uint64_t v16 = -[BWDeferredInferenceBufferIntermediate initWithBuffer:tag:metadataTag:inferenceAttachedMediaKey:portType:compressionProfile:URL:]([BWDeferredInferenceBufferIntermediate alloc], "initWithBuffer:tag:metadataTag:inferenceAttachedMediaKey:portType:compressionProfile:URL:", a3, a4, a5, a6, a8, v9, -[BWDeferredContainer _intermediateBufferURLForTag:compressionProfile:]((uint64_t)self, (uint64_t)a4, v9));
      [(BWDeferredIntermediate *)v16 setSettingsID:[(FigCaptureStillImageSettings *)self->super._stillImageSettings settingsID]];
      [(NSMutableArray *)self->super._intermediates addObject:v16];

      if (self->_flushBuffersUponCommit)
      {
        int v15 = -[BWDeferredCaptureContainer _createFolders]((uint64_t)self);
        if (v15)
        {
          FigDebugAssert3();
        }
        else
        {
          flushGroup = self->_flushGroup;
          flushQueue = self->_flushQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __122__BWDeferredCaptureContainer_commitInferenceBuffer_tag_metadataTag_inferenceAttachedMediaKey_compressionProfile_portType___block_invoke;
          block[3] = &unk_1E5C24430;
          block[4] = v16;
          dispatch_group_async(flushGroup, flushQueue, block);
        }
      }
      else
      {
        int v15 = 0;
      }
    }
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  return v15;
}

uint64_t __122__BWDeferredCaptureContainer_commitInferenceBuffer_tag_metadataTag_inferenceAttachedMediaKey_compressionProfile_portType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) flush];
}

- (int)commitDictionary:(id)a3 tag:(id)a4
{
  id v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  pthread_rwlock_wrlock(&self->super._lock);
  int v8 = 0;
  int v9 = -16134;
  if (a3 && a4)
  {
    if (self->_committed)
    {
      int v8 = 0;
    }
    else
    {
      int v8 = (void *)[a3 copy];
      if (!-[BWDeferredContainer _intermediateForTag:]((uint64_t)self, (uint64_t)a4))
      {
        v10 = -[BWDeferredDictionaryIntermediate initWithDictionary:tag:URL:]([BWDeferredDictionaryIntermediate alloc], "initWithDictionary:tag:URL:", v8, a4, -[BWDeferredContainer _intermediateArrayURLForTag:]((uint64_t)self, (uint64_t)a4));
        [(BWDeferredIntermediate *)v10 setSettingsID:[(FigCaptureStillImageSettings *)self->super._stillImageSettings settingsID]];
        [(NSMutableArray *)self->super._intermediates addObject:v10];

        int v9 = 0;
        goto LABEL_8;
      }
    }
    int v9 = -16135;
  }
LABEL_8:
  pthread_rwlock_unlock(&self->super._lock);

  if (*v7 == 1) {
    kdebug_trace();
  }
  return v9;
}

- (int)commit
{
  objc_super v3 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  pthread_rwlock_wrlock(&self->super._lock);
  if (self->_committed)
  {
    FigDebugAssert3();
    int v4 = -16135;
  }
  else
  {
    self->_committed = 1;
    self->_cacheExpiryTime = dispatch_time(0, 0);
    self->_commitTime = (NSDate *)(id)[MEMORY[0x1E4F1C9C8] date];
    int v4 = 0;
    self->_commitDurationNS = FigGetUpTimeNanoseconds() - self->super._creationTimeNS;
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (*v3 == 1) {
    kdebug_trace();
  }
  return v4;
}

- (int)abort
{
  objc_super v3 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  p_lock = &self->super._lock;
  pthread_rwlock_wrlock(&self->super._lock);
  if (self->_committed)
  {
    FigDebugAssert3();
    int v7 = -16135;
  }
  else
  {
    self->_committed = 1;
    flushGroup = self->_flushGroup;
    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(flushGroup, v6))
    {
      FigDebugAssert3();
      int v7 = -16138;
    }
    else
    {
      int v7 = 0;
    }
  }
  pthread_rwlock_unlock(p_lock);
  if (*v3 == 1) {
    kdebug_trace();
  }
  return v7;
}

- (int)preflush
{
  if (self->_committed)
  {
    if (self->_preflushed)
    {
      FigDebugAssert3();
      int v3 = -16135;
    }
    else
    {
      pthread_rwlock_wrlock(&self->super._lock);
      self->_preflushed = 1;
      dispatch_group_enter((dispatch_group_t)self->_flushGroup);
      int v3 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v3 = -16131;
  }
  pthread_rwlock_unlock(&self->super._lock);
  return v3;
}

- (int)flush
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v36 = 0;
  int v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  pthread_rwlock_rdlock(&self->super._lock);
  uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  dispatch_time_t v6 = &unk_1EB4C5000;
  if (!self->_committed || !self->_preflushed)
  {
    int v19 = -16131;
LABEL_26:
    pthread_rwlock_unlock(&self->super._lock);
LABEL_27:
    [+[BWDeferredCaptureContainerManager sharedInstance] deleteContainerForApplicationID:[(BWStillImageCaptureSettings *)self->super._stillImageCaptureSettings applicationID] captureRequestIdentifier:self->super._captureRequestIdentifier];
    goto LABEL_28;
  }
  uint64_t v29 = UpTimeNanoseconds;
  if (dword_1EB4C5570)
  {
    unsigned int v35 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v8 = -[BWDeferredCaptureContainer _createFolders]((uint64_t)self);
  if (v8)
  {
    int v19 = v8;
    uint64_t v28 = v2;
    LODWORD(v27) = v8;
LABEL_42:
    FigDebugAssert3();
    goto LABEL_26;
  }
  int v9 = -[BWDeferredContainer _writeManifest]((uint64_t)self);
  if (v9)
  {
    int v19 = v9;
    uint64_t v28 = v2;
    LODWORD(v27) = v9;
    goto LABEL_42;
  }
  if (+[BWDeferredContainer archiveObjectWithURL:object:error:](BWDeferredContainer, "archiveObjectWithURL:object:error:", -[BWDeferredContainer _pipelineParametersURL]((uint64_t)self), self->super._pipelineParameters, &v36))
  {
    if (+[BWDeferredContainer archiveObjectWithURL:object:error:](BWDeferredContainer, "archiveObjectWithURL:object:error:", -[BWDeferredContainer _stillImageCaptureSettingsURL]((uint64_t)self), self->super._stillImageCaptureSettings, &v36)&& +[BWDeferredContainer archiveObjectWithURL:object:error:](BWDeferredContainer, "archiveObjectWithURL:object:error:", -[BWDeferredContainer _stillImageSettingsURL]((uint64_t)self), self->super._stillImageSettings, &v36))
    {
      v10 = v4;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      intermediates = self->super._intermediates;
      uint64_t v12 = [(NSMutableArray *)intermediates countByEnumeratingWithState:&v30 objects:v37 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v31 != v14) {
              objc_enumerationMutation(intermediates);
            }
            int v16 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "flush", v27, v28);
            if (v16)
            {
              int v19 = v16;
              uint64_t v28 = v2;
              LODWORD(v27) = v16;
              FigDebugAssert3();
              int v4 = v10;
              dispatch_time_t v6 = &unk_1EB4C5000;
              goto LABEL_26;
            }
          }
          uint64_t v13 = [(NSMutableArray *)intermediates countByEnumeratingWithState:&v30 objects:v37 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
      dispatch_group_leave((dispatch_group_t)self->_flushGroup);
      flushGroup = self->_flushGroup;
      dispatch_time_t v18 = dispatch_time(0, 10000000000);
      if (dispatch_group_wait(flushGroup, v18))
      {
        uint64_t v28 = v2;
        LODWORD(v27) = 0;
        FigDebugAssert3();
        int v19 = -16138;
      }
      else
      {
        int v19 = 0;
      }
      int v4 = v10;
      self->_flushDurationNS = FigGetUpTimeNanoseconds() - v29;
      dispatch_time_t v6 = (_DWORD *)&unk_1EB4C5000;
    }
    else
    {
      int v19 = objc_msgSend(v36, "code", v27, v28);
    }
  }
  else
  {
    int v19 = [v36 code];
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (v19) {
    goto LABEL_27;
  }
LABEL_28:
  if (v6[348])
  {
    unsigned int v35 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v21 = v35;
    if (os_log_type_enabled(v20, type)) {
      unsigned int v22 = v21;
    }
    else {
      unsigned int v22 = v21 & 0xFFFFFFFE;
    }
    if (v22)
    {
      int64_t v23 = [(BWStillImageCaptureSettings *)self->super._stillImageCaptureSettings settingsID];
      long long v24 = [(BWStillImageCaptureSettings *)self->super._stillImageCaptureSettings applicationID];
      captureRequestIdentifier = self->super._captureRequestIdentifier;
      int v38 = 136315907;
      v39 = "-[BWDeferredCaptureContainer flush]";
      __int16 v40 = 2048;
      int64_t v41 = v23;
      __int16 v42 = 2113;
      v43 = v24;
      __int16 v44 = 2113;
      v45 = captureRequestIdentifier;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (*v4 == 1) {
    kdebug_trace();
  }
  return v19;
}

- (int)waitForFlush
{
  return [(BWDeferredCaptureContainer *)self waitForFlushWithTimeoutInSeconds:10];
}

- (int)waitForFlushWithTimeoutInSeconds:(int)a3
{
  uint64_t v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  flushGroup = self->_flushGroup;
  dispatch_time_t v7 = dispatch_time(0, 1000000000 * a3);
  if (dispatch_group_wait(flushGroup, v7))
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int v8 = -16138;
  }
  else
  {
    int v8 = 0;
  }
  if (*v5 == 1) {
    kdebug_trace();
  }
  return v8;
}

- (BOOL)cached
{
  return self->_cached;
}

- (void)setCached:(BOOL)a3
{
  self->_cached = a3;
}

- (unint64_t)cacheExpiryTime
{
  return self->_cacheExpiryTime;
}

- (void)setCacheExpiryTime:(unint64_t)a3
{
  self->_cacheExpiryTime = a3;
}

- (int64_t)commitDurationNS
{
  return self->_commitDurationNS;
}

- (int64_t)flushDurationNS
{
  return self->_flushDurationNS;
}

- (BOOL)committed
{
  return self->_committed;
}

@end