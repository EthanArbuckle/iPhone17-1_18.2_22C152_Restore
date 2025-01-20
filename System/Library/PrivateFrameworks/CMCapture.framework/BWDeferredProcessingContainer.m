@interface BWDeferredProcessingContainer
+ (unsigned)maxProcessingCount;
- (BOOL)hasBufferForType:(unint64_t)a3 portType:(id)a4;
- (BOOL)hasInference:(id)a3 portType:(id)a4;
- (BOOL)hasInferenceBuffer:(id)a3 portType:(id)a4;
- (BOOL)isRemote;
- (BWDeferredProcessingContainer)initWithApplicationID:(id)a3 captureRequestIdentifier:(id)a4 baseFolderURL:(id)a5 openForPeeking:(BOOL)a6 err:(int *)a7;
- (BWDeferredProcessingContainer)initWithApplicationID:(id)a3 resolvedSettings:(id)a4 unresolvedSettings:(id)a5 pipelineParameters:(id)a6 intermediates:(id)a7 photoDescriptors:(id)a8;
- (BWDeferredProcessingContainer)initWithXPCEncoding:(id)a3 applicationID:(id)a4 captureRequestIdentifier:(id)a5 baseFolderURL:(id)a6 err:(int *)a7;
- (BWPhotoManifest)photoManifest;
- (__CVBuffer)copyBufferForTag:(id)a3 err:(int *)a4;
- (__CVBuffer)copyBufferForType:(unint64_t)a3 portType:(id)a4 metadata:(id *)a5 err:(int *)a6;
- (__CVBuffer)copyInferenceBufferForKey:(id)a3 portType:(id)a4 err:(int *)a5;
- (id)copyArrayForTag:(id)a3 customClasses:(id)a4 err:(int *)a5;
- (id)copyAttributesForBufferType:(unint64_t)a3 portType:(id)a4 err:(int *)a5;
- (id)copyBuffersForType:(unint64_t)a3 portType:(id)a4 metadataArray:(id *)a5 err:(int *)a6;
- (id)copyDictionaryForTag:(id)a3 customClasses:(id)a4 err:(int *)a5;
- (id)copyDictionaryForTag:(id)a3 err:(int *)a4;
- (id)copyInferenceForKey:(id)a3 customClasses:(id)a4 portType:(id)a5 err:(int *)a6;
- (id)copyMetadataForBufferTag:(id)a3 err:(int *)a4;
- (id)copyMetadataForTag:(id)a3 err:(int *)a4;
- (int)previousAttemptErrorCode;
- (uint64_t)_buildFolderStatistics;
- (uint64_t)_convertIntermediatesToCurrentCompatibleVersion;
- (uint64_t)_copyObjectForTag:(uint64_t)a3 customClasses:(int *)a4 err:;
- (unint64_t)sizeBytes;
- (unsigned)ageSeconds;
- (unsigned)processingCount;
- (void)abortingProcessingDueToError:(int)a3;
- (void)dealloc;
- (void)releaseIntermediates;
@end

@implementation BWDeferredProcessingContainer

uint64_t __59__BWDeferredProcessingContainer_hasBufferForType_portType___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", *(void *)(a1 + 32));
  if (result) {
    return [a2 bufferType] == *(void *)(a1 + 40);
  }
  return result;
}

- (id)copyDictionaryForTag:(id)a3 customClasses:(id)a4 err:(int *)a5
{
  int v13 = 0;
  v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  v10 = (void *)-[BWDeferredProcessingContainer _copyObjectForTag:customClasses:err:]((uint64_t)self, (uint64_t)a3, (uint64_t)a4, &v13);
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (*v9 == 1) {
      kdebug_trace();
    }
  }
  else
  {
    int v13 = -16132;
  }
  int v11 = v13;
  if (a5) {
    *a5 = v13;
  }
  if (v11)
  {

    return 0;
  }
  return v10;
}

- (uint64_t)_copyObjectForTag:(uint64_t)a3 customClasses:(int *)a4 err:
{
  if (!a1) {
    return 0;
  }
  int v13 = 0;
  v8 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 16));
  uint64_t v9 = -[BWDeferredContainer _intermediateForTag:](a1, a2);
  if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v11 = [v10 fetchWithCustomClassesAndRetain:a3 err:&v13];
  }
  else
  {
    uint64_t v11 = 0;
    int v13 = -16136;
  }
  pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 16));
  if (a4) {
    *a4 = v13;
  }
  if (*v8 == 1) {
    kdebug_trace();
  }
  return v11;
}

- (id)copyDictionaryForTag:(id)a3 err:(int *)a4
{
  return [(BWDeferredProcessingContainer *)self copyDictionaryForTag:a3 customClasses:0 err:a4];
}

- (BWPhotoManifest)photoManifest
{
  return self->_photoManifest;
}

- (BOOL)hasBufferForType:(unint64_t)a3 portType:(id)a4
{
  p_lock = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  intermediates = self->super._intermediates;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__BWDeferredProcessingContainer_hasBufferForType_portType___block_invoke;
  v13[3] = &unk_1E5C29430;
  v13[4] = a4;
  v13[5] = a3;
  unint64_t v9 = [(NSMutableArray *)intermediates indexOfObjectPassingTest:v13];
  BOOL v11 = v9 != 0x7FFFFFFFFFFFFFFFLL
     && (unint64_t v10 = v9, v9 < [(NSMutableArray *)self->super._intermediates count])
     && [(NSMutableArray *)self->super._intermediates objectAtIndexedSubscript:v10] != 0;
  pthread_rwlock_unlock(p_lock);
  return v11;
}

- (BWDeferredProcessingContainer)initWithApplicationID:(id)a3 resolvedSettings:(id)a4 unresolvedSettings:(id)a5 pipelineParameters:(id)a6 intermediates:(id)a7 photoDescriptors:(id)a8
{
  v9.receiver = self;
  v9.super_class = (Class)BWDeferredProcessingContainer;
  return [(BWDeferredContainer *)&v9 initWithApplicationID:a3 resolvedSettings:a4 unresolvedSettings:a5 pipelineParameters:a6 intermediates:a7 photoDescriptors:a8];
}

+ (unsigned)maxProcessingCount
{
  return 10;
}

- (BWDeferredProcessingContainer)initWithApplicationID:(id)a3 captureRequestIdentifier:(id)a4 baseFolderURL:(id)a5 openForPeeking:(BOOL)a6 err:(int *)a7
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  int v100 = 0;
  id v99 = 0;
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    -[BWDeferredContainer _getUUIDBytes:high:]((uint64_t)self, (uint64_t)a4, 0);
    -[BWDeferredContainer _getUUIDBytes:high:]((uint64_t)self, (uint64_t)a4, 1);
    kdebug_trace();
  }
  v98.receiver = self;
  v98.super_class = (Class)BWDeferredProcessingContainer;
  int v13 = [(BWDeferredContainer *)&v98 initWithApplicationID:a3 captureRequestIdentifier:a4 baseFolderURL:a5 queuePriority:39 err:&v100];
  if (!v13)
  {
    v27 = 0;
    goto LABEL_100;
  }
  [+[BWDeferredTransactionBroker sharedInstance] openTransaction:4 name:a4];
  v13->_metadataPrefetchQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  v13->_bufferPrefetchQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  int v100 = -[BWDeferredProcessingContainer _buildFolderStatistics]((uint64_t)v13);
  if (v100)
  {
    FigDebugAssert3();
    goto LABEL_111;
  }
  uint64_t v14 = -[BWDeferredContainer _containerManifestURL]((uint64_t)v13);
  int v100 = +[BWDeferredContainer validateManifestURLSize:v14];
  if (v100)
  {
LABEL_111:
    v27 = 0;
    goto LABEL_102;
  }
  v78 = a7;
  uint64_t v97 = 0;
  uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v14 options:0 error:&v97];
  if (!v15)
  {
    v27 = 0;
    int v72 = -16132;
LABEL_123:
    int v100 = v72;
    goto LABEL_124;
  }
  uint64_t v80 = v15;
  unsigned int v16 = +[BWDeferredProcessingContainer maxProcessingCount];
  uint64_t v17 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:-[BWDeferredContainer _containerSessionDataURL]((uint64_t)v13)];
  if (!v17)
  {
    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v25 = &unk_1EFB004D0;
    goto LABEL_16;
  }
  uint64_t v18 = v17;
  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  id v22 = +[BWDeferredContainer unarchiveObject:classes:error:](BWDeferredContainer, "unarchiveObject:classes:error:", v18, objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0), &v99);
  if (!v22)
  {
    v27 = 0;
    int v100 = [v99 code];
    goto LABEL_124;
  }
  id v23 = v22;
  uint64_t v24 = [v22 objectForKeyedSubscript:@"ProcessingCount"];
  if (!v24 || (v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_122:
    v27 = 0;
    int v72 = -16140;
    goto LABEL_123;
  }
  if (v16 && [v25 unsignedIntValue] >= v16)
  {
    FigDebugAssert3();
    goto LABEL_122;
  }
  v26 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v23];
LABEL_16:
  v13->_sessionDictionary = v26;
  v13->_processingCount = [v25 longValue];
  uint64_t v28 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v13->_sessionDictionary, "objectForKeyedSubscript:", @"PreviousError"), "intValue");
  v13->_previousAttemptErrorCode = v28;
  if (!a6)
  {
    if (objc_msgSend(&unk_1EFB03AB8, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v28)))
    {
      [(NSMutableDictionary *)v13->_sessionDictionary removeObjectForKey:@"PreviousError"];
      if (dword_1EB4C5570)
      {
        int v96 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else if (([a3 isEqualToString:0x1EFA55820] & 1) == 0)
    {
      ++v13->_processingCount;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13->_sessionDictionary, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v13->_processingCount, v73, v74), @"ProcessingCount");
    if (v13->_previousAttemptErrorCode && dword_1EB4C5570)
    {
      int v96 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (!+[BWDeferredContainer archiveObjectWithURL:object:error:](BWDeferredContainer, "archiveObjectWithURL:object:error:", -[BWDeferredContainer _containerSessionDataURL]((uint64_t)v13), v13->_sessionDictionary, &v99))
    {
      LODWORD(v73) = 0;
      FigDebugAssert3();
      objc_msgSend(v99, "code", v73, v77);
      v27 = 0;
      int v100 = FigSignalErrorAt();
      goto LABEL_124;
    }
  }
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v80 error:&v99];
  if (!v27)
  {
    LODWORD(v73) = 0;
    FigDebugAssert3();
    objc_msgSend(v99, "code", v73, v77);
    FigSignalErrorAt();
LABEL_124:
    a7 = v78;
    goto LABEL_102;
  }
  v31 = (void *)[v27 decodeTopLevelObjectOfClass:objc_opt_class() forKey:@"Version" error:&v99];
  a7 = v78;
  if (!v31) {
    goto LABEL_120;
  }
  uint64_t v32 = [v31 longValue];
  v13->super._manifestVersion = v32;
  if (v32 <= 6)
  {
    int v100 = -16130;
    goto LABEL_102;
  }
  uint64_t v33 = -[BWDeferredContainer _stillImageCaptureSettingsURL]((uint64_t)v13);
  v34 = (BWStillImageCaptureSettings *)+[BWDeferredContainer unarchiveObjectWithURL:classes:error:](BWDeferredContainer, "unarchiveObjectWithURL:classes:error:", v33, [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()], &v99);
  v13->super._stillImageCaptureSettings = v34;
  if (!v34)
  {
    uint64_t v75 = v77;
    LODWORD(v73) = 0;
LABEL_118:
    FigDebugAssert3();
    objc_msgSend(v99, "code", v73, v75);
    int v100 = FigSignalErrorAt();
    goto LABEL_102;
  }
  uint64_t v35 = -[BWDeferredContainer _pipelineParametersURL]((uint64_t)v13);
  v36 = (BWDeferredPipelineParameters *)+[BWDeferredContainer unarchiveObjectWithURL:classes:error:](BWDeferredContainer, "unarchiveObjectWithURL:classes:error:", v35, [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()], &v99);
  v13->super._pipelineParameters = v36;
  if (!v36) {
    v13->super._pipelineParameters = (BWDeferredPipelineParameters *)-[BWDeferredPipelineParameters _initWithLegacyCaptureSettings:]([BWDeferredPipelineParameters alloc], v13->super._stillImageCaptureSettings);
  }
  if (([(BWStillImageCaptureSettings *)v13->super._stillImageCaptureSettings captureFlags] & 0x800) != 0
    && ![(BWDeferredPipelineParameters *)v13->super._pipelineParameters depthDataType])
  {
    if ([(BWDeferredPipelineParameters *)v13->super._pipelineParameters pearlModuleType]) {
      uint64_t v37 = 3;
    }
    else {
      uint64_t v37 = 8;
    }
    [(BWDeferredPipelineParameters *)v13->super._pipelineParameters setDepthDataType:v37];
  }
  [(BWStillImageCaptureSettings *)v13->super._stillImageCaptureSettings setDeliverDeferredPhotoProxyImage:0];
  if (([(BWStillImageCaptureSettings *)v13->super._stillImageCaptureSettings captureFlags] & 0x8000000000) != 0) {
    [(BWStillImageCaptureSettings *)v13->super._stillImageCaptureSettings disableAWBReflow];
  }
  if (([(BWStillImageCaptureSettings *)v13->super._stillImageCaptureSettings captureFlags] & 0x200000000) != 0
    && ![(BWDeferredPipelineParameters *)v13->super._pipelineParameters canProcessEnhancedResolution])
  {
    [(BWStillImageCaptureSettings *)v13->super._stillImageCaptureSettings cannotProcessDeepFusionEnhancedResolution];
  }
  uint64_t v38 = -[BWDeferredContainer _stillImageSettingsURL]((uint64_t)v13);
  v39 = (FigCaptureStillImageSettings *)+[BWDeferredContainer unarchiveObjectWithURL:classes:error:](BWDeferredContainer, "unarchiveObjectWithURL:classes:error:", v38, [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()], &v99);
  v13->super._stillImageSettings = v39;
  if ([(FigCaptureStillImageSettings *)v39 deferredPhotoFinalWidth]
    && [(FigCaptureStillImageSettings *)v13->super._stillImageSettings deferredPhotoFinalHeight])
  {
    [(FigCaptureStillImageSettings *)v13->super._stillImageSettings setOutputWidth:[(FigCaptureStillImageSettings *)v13->super._stillImageSettings deferredPhotoFinalWidth]];
    [(FigCaptureStillImageSettings *)v13->super._stillImageSettings setOutputHeight:[(FigCaptureStillImageSettings *)v13->super._stillImageSettings deferredPhotoFinalHeight]];
  }
  if (!v13->super._stillImageSettings)
  {
    uint64_t v75 = v77;
    LODWORD(v73) = 0;
    goto LABEL_118;
  }
  v40 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v41 = objc_opt_class();
  v42 = objc_msgSend(v27, "decodeTopLevelObjectOfClasses:forKey:error:", objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0), @"Intermediates", &v99);
  if (!v42) {
    goto LABEL_120;
  }
  v43 = v42;
  v13->super._intermediates = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v42, "count"));
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v91 objects:v104 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v92;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v92 != v46) {
          objc_enumerationMutation(v43);
        }
        v48 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        objc_msgSend(v48, "setSettingsID:", -[FigCaptureStillImageSettings settingsID](v13->super._stillImageSettings, "settingsID"));
        [(NSMutableArray *)v13->super._intermediates addObject:v48];
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v91 objects:v104 count:16];
    }
    while (v45);
  }
  if (v13->super._manifestVersion == 7)
  {
    int v100 = -[BWDeferredProcessingContainer _convertIntermediatesToCurrentCompatibleVersion]((uint64_t)v13);
    if (v100) {
      goto LABEL_102;
    }
  }
  v49 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v50 = objc_opt_class();
  uint64_t v51 = objc_msgSend((id)objc_msgSend(v27, "decodeTopLevelObjectOfClasses:forKey:error:", objc_msgSend(v49, "setWithObjects:", v50, objc_opt_class(), 0), @"PhotoDescriptors", &v99), "mutableCopy");
  v13->super._photoDescriptors = (NSMutableArray *)v51;
  if (!v51)
  {
LABEL_120:
    int v100 = objc_msgSend(v99, "code", v73, v74);
    goto LABEL_102;
  }
  v13->_photoManifest = [[BWPhotoManifest alloc] initWithDescriptors:v13->super._photoDescriptors captureRequestIdentifier:v13->super._captureRequestIdentifier];
  v81 = (void *)-[BWDeferredContainer _intermediateFolderURL]((uint64_t)v13);
  uint64_t v52 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsOfDirectoryAtPath:error:", objc_msgSend(v81, "path"), &v99);
  if (!v52)
  {
    uint64_t v74 = v77;
    LODWORD(v73) = 0;
    FigDebugAssert3();
    goto LABEL_120;
  }
  v76 = v27;
  v53 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v52];
  [v53 sortUsingSelector:sel_caseInsensitiveCompare_];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  obuint64_t j = v13->super._intermediates;
  uint64_t v54 = [(NSMutableArray *)obj countByEnumeratingWithState:&v87 objects:v103 count:16];
  if (!v54) {
    goto LABEL_83;
  }
  uint64_t v55 = v54;
  uint64_t v56 = *(void *)v88;
  while (2)
  {
    for (uint64_t j = 0; j != v55; ++j)
    {
      if (*(void *)v88 != v56) {
        objc_enumerationMutation(obj);
      }
      v58 = *(void **)(*((void *)&v87 + 1) + 8 * j);
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __113__BWDeferredProcessingContainer_initWithApplicationID_captureRequestIdentifier_baseFolderURL_openForPeeking_err___block_invoke;
      v86[3] = &unk_1E5C29408;
      v86[4] = v58;
      uint64_t v59 = [v53 indexOfObjectPassingTest:v86];
      if (v59 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_107:
        int v100 = -16132;
LABEL_109:
        a7 = v78;
        v27 = v76;
        goto LABEL_102;
      }
      v60 = (void *)[v53 objectAtIndexedSubscript:v59];
      if ([v60 hasSuffix:@"heif"]
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v61 = [(BWStillImageCaptureSettings *)v13->super._stillImageCaptureSettings captureFlags];
        p_bufferPrefetchQueue = &v13->_bufferPrefetchQueue;
        if ((v61 & 0x100000000) != 0)
        {
          v63 = 0;
          goto LABEL_80;
        }
      }
      else
      {
        if (![v60 hasSuffix:@"plist"]
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (![v60 hasSuffix:@"plist"]
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            if (![v60 hasSuffix:@"plist"]
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              if (![v60 hasSuffix:@"jpeg"]) {
                goto LABEL_107;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_107;
              }
            }
          }
        }
        [(BWStillImageCaptureSettings *)v13->super._stillImageCaptureSettings captureFlags];
        p_bufferPrefetchQueue = &v13->_metadataPrefetchQueue;
      }
      v63 = *p_bufferPrefetchQueue;
LABEL_80:
      v64 = (void *)MEMORY[0x1E4F1CB10];
      v102[0] = [v81 path];
      v102[1] = v60;
      int v100 = objc_msgSend(v58, "setURL:prefetchQueue:", objc_msgSend(v64, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v102, 2)), v63);
      if (v100)
      {
        FigDebugAssert3();
        goto LABEL_109;
      }
    }
    uint64_t v55 = [(NSMutableArray *)obj countByEnumeratingWithState:&v87 objects:v103 count:16];
    if (v55) {
      continue;
    }
    break;
  }
LABEL_83:
  if ((([(BWStillImageCaptureSettings *)v13->super._stillImageCaptureSettings captureFlags] & 0x800) == 0
     || [(BWDeferredPipelineParameters *)v13->super._pipelineParameters depthDataType] != 9)
    && ![(BWDeferredProcessingContainer *)v13 hasBufferForType:2001 portType:[(BWStillImageCaptureSettings *)v13->super._stillImageCaptureSettings masterPortType]])
  {
    [(FigCaptureStillImageSettings *)v13->super._stillImageSettings cannotProcessDepthPhotos];
    [(BWStillImageCaptureSettings *)v13->super._stillImageCaptureSettings cannotProcessDepthPhotos];
    [(BWPhotoManifest *)v13->_photoManifest cannotProcessDepthPhotos];
    [(NSMutableArray *)v13->super._photoDescriptors removeAllObjects];
    [(NSMutableArray *)v13->super._photoDescriptors addObjectsFromArray:[(BWPhotoManifest *)v13->_photoManifest photoDescriptors]];
  }
  if (([(BWStillImageCaptureSettings *)v13->super._stillImageCaptureSettings captureFlags] & 0x4000000000) != 0)
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    intermediates = v13->super._intermediates;
    uint64_t v66 = [(NSMutableArray *)intermediates countByEnumeratingWithState:&v82 objects:v101 count:16];
    if (v66)
    {
      uint64_t v67 = v66;
      uint64_t v68 = *(void *)v83;
      do
      {
        for (uint64_t k = 0; k != v67; ++k)
        {
          if (*(void *)v83 != v68) {
            objc_enumerationMutation(intermediates);
          }
          v70 = *(void **)(*((void *)&v82 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend((id)objc_msgSend(v70, "portType"), "isEqualToString:", -[BWStillImageCaptureSettings masterPortType](v13->super._stillImageCaptureSettings, "masterPortType")) & 1) == 0&& objc_msgSend(v70, "bufferType") == 1)
          {
            -[BWStillImageCaptureSettings setLearnedNRStereoPhotoFrameFlag:](v13->super._stillImageCaptureSettings, "setLearnedNRStereoPhotoFrameFlag:", [v70 captureFrameFlags] & 0x14);
          }
        }
        uint64_t v67 = [(NSMutableArray *)intermediates countByEnumeratingWithState:&v82 objects:v101 count:16];
      }
      while (v67);
    }
  }
  a7 = v78;
  v27 = v76;
LABEL_100:
  int v100 = -[BWDeferredContainer _validate]((uint64_t)v13);
  if (v100) {
    FigDebugAssert3();
  }
LABEL_102:

  if (a7) {
    *a7 = v100;
  }
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  return v13;
}

- (uint64_t)_buildFolderStatistics
{
  if (!result) {
    return result;
  }
  uint64_t v2 = result;
  id v17 = 0;
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(*(id *)(result + 216), "path"), &v17);
  if (!v3)
  {
    uint64_t v16 = v1;
    LODWORD(v15) = 0;
LABEL_14:
    FigDebugAssert3();
    objc_msgSend(v17, "code", v15, v16);
    FigSignalErrorAt();
    return 0;
  }
  v4 = (void *)v3;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSince1970");
  double v6 = v5;
  objc_msgSend((id)objc_msgSend(v4, "fileCreationDate"), "timeIntervalSince1970");
  *(_DWORD *)(v2 + 336) = (v6 - v7);
  v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "subpathsOfDirectoryAtPath:error:", objc_msgSend(*(id *)(v2 + 216), "path"), &v17);
  if (!v8)
  {
    uint64_t v16 = v1;
    LODWORD(v15) = 0;
    goto LABEL_14;
  }
  objc_super v9 = (void *)[v8 objectEnumerator];
  if (v9)
  {
    unint64_t v10 = v9;
    uint64_t v11 = [v9 nextObject];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 216), "path"), "stringByAppendingPathComponent:", v12), &v17);
        if (!v14) {
          break;
        }
        v13 += [v14 fileSize];
        uint64_t v12 = [v10 nextObject];
        if (!v12) {
          goto LABEL_11;
        }
      }
      uint64_t v16 = v1;
      LODWORD(v15) = 0;
      goto LABEL_14;
    }
    uint64_t v13 = 0;
LABEL_11:
    uint64_t result = 0;
    *(void *)(v2 + 328) = v13;
  }
  else
  {
    FigDebugAssert3();
    return 4294951164;
  }
  return result;
}

- (uint64_t)_convertIntermediatesToCurrentCompatibleVersion
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    unsigned int v48 = 0;
    v39 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:*(void *)(result + 272)];
    context = (void *)MEMORY[0x1A6272C70]();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v2 = *(void **)(v1 + 272);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v41 = 0;
      uint64_t v5 = *(void *)v45;
      p_vtable = &OBJC_METACLASS___BWInferenceSchedulerGraph.vtable;
      uint64_t v38 = 1;
      v43 = v2;
      uint64_t v40 = v1;
      uint64_t v42 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v45 != v5) {
            objc_enumerationMutation(v2);
          }
          if (*(uint64_t *)(v1 + 240) <= 7)
          {
            v8 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v9 = [v8 bufferType] - 1001;
              unint64_t v10 = @"PersonSemanticsSkin";
              switch(v9)
              {
                case 0:
                  goto LABEL_20;
                case 1:
                case 2:
                  goto LABEL_21;
                case 3:
                  unint64_t v10 = @"PersonSegmentationMask";
LABEL_20:
                  if (v10) {
                    goto LABEL_21;
                  }
                  continue;
                case 4:
                  uint64_t v33 = [NSString stringWithFormat:@"%@%d", 0x1EFA6A360, v38];
                  uint64_t v38 = (v38 + 1);
                  if (!v33) {
                    continue;
                  }
LABEL_21:
                  id v24 = (id)[v8 fetchAndRetain:&v48];
                  if (v48) {
                    goto LABEL_36;
                  }
                  id v25 = v24;
                  v26 = [BWDeferredInferenceBufferIntermediate alloc];
                  uint64_t v27 = [v8 tag];
                  uint64_t v28 = [v8 metadataTag];
                  uint64_t v29 = [v8 portType];
                  uint64_t v30 = [v8 compressionProfile];
                  uint64_t v31 = [v8 URL];
                  uint64_t v32 = v28;
                  uint64_t v1 = v40;
                  id v23 = [(BWDeferredInferenceBufferIntermediate *)v26 initWithBuffer:v25 tag:v27 metadataTag:v32 inferenceAttachedMediaKey:@"PersonSemanticsSkin" portType:v29 compressionProfile:v30 URL:v31];
                  break;
                default:
                  if ((unint64_t)@"PersonSemanticsSkin" >= 2
                    || [v8 pixelFormat] != 1651519798)
                  {
                    continue;
                  }
                  id v13 = (id)[v8 fetchAndRetain:&v48];
                  if (v48) {
                    goto LABEL_36;
                  }
                  id v14 = v13;
                  id v15 = objc_alloc((Class)(p_vtable + 497));
                  uint64_t v16 = [v8 tag];
                  uint64_t v17 = [v8 captureFrameFlags];
                  uint64_t v18 = [v8 metadataTag];
                  uint64_t v19 = [v8 portType];
                  int v20 = [v8 compressionProfile];
                  uint64_t v21 = [v8 URL];
                  LODWORD(v36) = v20;
                  uint64_t v22 = v17;
                  uint64_t v1 = v40;
                  id v23 = (BWDeferredInferenceArrayIntermediate *)[v15 initWithBuffer:v14 tag:v16 bufferType:37 captureFrameFlags:v22 metadataTag:v18 portType:v19 compressionProfile:v36 URL:v21];
                  break;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              if (objc_msgSend((id)objc_msgSend(v8, "tag"), "hasPrefix:", @"LowResPersonInstanceConfidences-"))
              {
                uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
                uint64_t v12 = 0x1EFA6A380;
              }
              else if (objc_msgSend((id)objc_msgSend(v8, "tag"), "hasPrefix:", @"LowResPersonInstanceBoundingBoxes-"))
              {
                uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
                uint64_t v12 = 0x1EFA6A3A0;
              }
              else if (objc_msgSend((id)objc_msgSend(v8, "tag"), "hasPrefix:", @"SkinToneClassifications-"))
              {
                uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
                getVNFaceObservationClass();
                uint64_t v12 = 0x1EFA6A1A0;
              }
              else
              {
                if (!objc_msgSend((id)objc_msgSend(v8, "tag"), "hasPrefix:", @"FaceObservations-")) {
                  continue;
                }
                uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
                getVNFaceObservationClass();
                uint64_t v12 = 0x1EFA6A0A0;
              }
              id v34 = (id)objc_msgSend(v8, "fetchWithCustomClassesAndRetain:err:", objc_msgSend(v11, "setWithObject:", objc_opt_class()), &v48);
              if (v48) {
                goto LABEL_36;
              }
              id v23 = -[BWDeferredInferenceArrayIntermediate initWithArray:tag:inferenceAttachmentKey:portType:URL:]([BWDeferredInferenceArrayIntermediate alloc], "initWithArray:tag:inferenceAttachmentKey:portType:URL:", v34, [v8 tag], v12, 0, objc_msgSend(v8, "URL"));
            }
            uint64_t v35 = v23;
            if (v23)
            {
              -[BWDeferredIntermediate setSettingsID:](v23, "setSettingsID:", [*(id *)(v1 + 256) settingsID]);
              [v39 setObject:v35 atIndexedSubscript:v41 + i];
            }
            uint64_t v5 = v42;
            uint64_t v2 = v43;
            p_vtable = (void **)(&OBJC_METACLASS___BWInferenceSchedulerGraph + 24);
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v44 objects:v49 count:16];
        v41 += i;
      }
      while (v4);
    }
LABEL_36:
    uint64_t result = v48;
    if (!v48)
    {

      *(void *)(v1 + 272) = [v39 copy];
      return v48;
    }
  }
  return result;
}

uint64_t __113__BWDeferredProcessingContainer_initWithApplicationID_captureRequestIdentifier_baseFolderURL_openForPeeking_err___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 stringByDeletingPathExtension];
  uint64_t v4 = (void *)[*(id *)(a1 + 32) tag];
  return [v4 isEqualToString:v3];
}

- (BWDeferredProcessingContainer)initWithXPCEncoding:(id)a3 applicationID:(id)a4 captureRequestIdentifier:(id)a5 baseFolderURL:(id)a6 err:(int *)a7
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v64 = 0;
  int v63 = 0;
  id v13 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    -[BWDeferredContainer _getUUIDBytes:high:]((uint64_t)self, (uint64_t)a5, 0);
    -[BWDeferredContainer _getUUIDBytes:high:]((uint64_t)self, (uint64_t)a5, 1);
    kdebug_trace();
  }
  if (a3)
  {
    v62.receiver = self;
    v62.super_class = (Class)BWDeferredProcessingContainer;
    id v14 = [(BWDeferredContainer *)&v62 initWithApplicationID:a4 captureRequestIdentifier:a5 baseFolderURL:a6 queuePriority:39 err:&v63];
    if (!v14)
    {
      value = 0;
      uint64_t v16 = 0;
LABEL_52:

      if (v63)
      {

        id v14 = 0;
      }
      if (*v13 == 1) {
        kdebug_trace();
      }
      return v14;
    }
    [+[BWDeferredTransactionBroker sharedInstance] openTransaction:4 name:a5];
    v14->_isRemote = 1;
    value = xpc_dictionary_get_value(a3, "Container");
    if (value)
    {
      xpc_object_t xdict = xpc_dictionary_get_value(a3, "IntermediateObjects");
      if (!xdict)
      {
        FigDebugAssert3();
        value = 0;
LABEL_61:
        uint64_t v16 = 0;
        goto LABEL_63;
      }
      value = (void *)_CFXPCCreateCFObjectFromXPCObject();
      if (value)
      {
        uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:value error:&v64];
        if (!v64)
        {
          uint64_t v17 = (void *)[v16 decodeTopLevelObjectOfClass:objc_opt_class() forKey:@"Version" error:&v64];
          if (v17)
          {
            uint64_t v19 = [v17 longValue];
            v14->super._manifestVersion = v19;
            if (v19 != 8)
            {
              int v48 = -16130;
LABEL_44:
              int v63 = v48;
              goto LABEL_52;
            }
            uint64_t v18 = [v16 decodeTopLevelObjectOfClass:objc_opt_class() forKey:@"ApplicationID" error:&v64];
            applicationID = v14->super._applicationID;
            if (applicationID)
            {
              if (![(NSString *)applicationID isEqualToString:v18]) {
                goto LABEL_62;
              }
              uint64_t v21 = [v16 decodeTopLevelObjectOfClass:objc_opt_class() forKey:@"CommitTime" error:&v64];
              if (!v21) {
                goto LABEL_57;
              }
              uint64_t v22 = (void *)v21;
              uint64_t v23 = [v16 decodeTopLevelObjectOfClass:objc_opt_class() forKey:@"BaseFolder" error:&v64];
              if (!v23) {
                goto LABEL_57;
              }
              if (([(NSURL *)v14->super._baseFolderURL isEqual:v23] & 1) == 0) {
                goto LABEL_62;
              }
              uint64_t v24 = [v16 decodeTopLevelObjectOfClass:objc_opt_class() forKey:@"CaptureRequestIdentifier" error:&v64];
              if (!v24) {
                goto LABEL_57;
              }
              if (![(NSString *)v14->super._captureRequestIdentifier isEqualToString:v24])
              {
LABEL_62:
                FigDebugAssert3();
                goto LABEL_63;
              }
              id v25 = (BWStillImageCaptureSettings *)(id)[v16 decodeTopLevelObjectOfClass:objc_opt_class() forKey:@"StillImageCaptureSettings" error:&v64];
              v14->super._stillImageCaptureSettings = v25;
              if (v25)
              {
                v26 = (FigCaptureStillImageSettings *)(id)[v16 decodeTopLevelObjectOfClass:objc_opt_class() forKey:@"StillImageSettings" error:&v64];
                v14->super._stillImageSettings = v26;
                if (v26)
                {
                  uint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
                  uint64_t v28 = objc_opt_class();
                  uint64_t v29 = objc_msgSend((id)objc_msgSend(v16, "decodeTopLevelObjectOfClasses:forKey:error:", objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0), @"Intermediates", &v64), "mutableCopy");
                  v14->super._intermediates = (NSMutableArray *)v29;
                  if (v29)
                  {
                    uint64_t v30 = (void *)MEMORY[0x1E4F1CAD0];
                    uint64_t v31 = objc_opt_class();
                    uint64_t v32 = objc_msgSend((id)objc_msgSend(v16, "decodeTopLevelObjectOfClasses:forKey:error:", objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0), @"PhotoDescriptors", &v64), "mutableCopy");
                    v14->super._photoDescriptors = (NSMutableArray *)v32;
                    if (v32)
                    {
                      v53 = v16;
                      uint64_t v54 = value;
                      long long v60 = 0u;
                      long long v61 = 0u;
                      long long v58 = 0u;
                      long long v59 = 0u;
                      uint64_t v55 = (uint64_t)v14;
                      intermediates = v14->super._intermediates;
                      uint64_t v34 = [(NSMutableArray *)intermediates countByEnumeratingWithState:&v58 objects:v65 count:16];
                      if (v34)
                      {
                        uint64_t v35 = v34;
                        uint64_t v36 = 0;
                        uint64_t v37 = *(void *)v59;
                        CFAllocatorRef v38 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
                        while (2)
                        {
                          for (uint64_t i = 0; i != v35; ++i)
                          {
                            if (*(void *)v59 != v37) {
                              objc_enumerationMutation(intermediates);
                            }
                            uint64_t v40 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                            xpc_object_t v41 = xpc_dictionary_get_value(xdict, (const char *)objc_msgSend((id)objc_msgSend(v40, "tag"), "UTF8String"));
                            if (!v41 || (xpc_object_t v42 = xpc_dictionary_get_value(v41, "Object")) == 0)
                            {
LABEL_49:
                              FigDebugAssert3();
LABEL_50:
                              int v63 = -16132;
                              id v13 = (_DWORD *)MEMORY[0x1E4F1EBA8];
                              id v14 = (BWDeferredProcessingContainer *)v55;
                              goto LABEL_51;
                            }
                            v43 = v42;
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              long long v44 = (void *)_CFXPCCreateCFObjectFromXPCObject();
                              [v40 setArchive:v44];
                              size_t AllocSize = [v44 length];
                            }
                            else
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0) {
                                goto LABEL_50;
                              }
                              CVPixelBufferRef pixelBufferOut = 0;
                              long long v46 = IOSurfaceLookupFromXPCObject(v43);
                              if (!v46) {
                                goto LABEL_49;
                              }
                              long long v47 = v46;
                              CVPixelBufferCreateWithIOSurface(v38, v46, 0, &pixelBufferOut);
                              [v40 setBuffer:pixelBufferOut];
                              size_t AllocSize = IOSurfaceGetAllocSize(v47);
                              CFRelease(v47);
                              CFRelease(pixelBufferOut);
                            }
                            v36 += AllocSize;
                          }
                          uint64_t v35 = [(NSMutableArray *)intermediates countByEnumeratingWithState:&v58 objects:v65 count:16];
                          if (v35) {
                            continue;
                          }
                          break;
                        }
                      }
                      else
                      {
                        uint64_t v36 = 0;
                      }
                      id v14 = (BWDeferredProcessingContainer *)v55;
                      int v63 = -[BWDeferredContainer _validate](v55);
                      if (v63)
                      {
                        FigDebugAssert3();
                      }
                      else
                      {
                        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSince1970");
                        double v50 = v49;
                        [v22 timeIntervalSince1970];
                        *(_DWORD *)(v55 + 336) = (v50 - v51);
                        *(void *)(v55 + 328) = v36;
                        int v63 = 0;
                      }
                      id v13 = (_DWORD *)MEMORY[0x1E4F1EBA8];
LABEL_51:
                      uint64_t v16 = v53;
                      value = v54;
                      goto LABEL_52;
                    }
                  }
                  goto LABEL_62;
                }
              }
            }
          }
LABEL_57:
          int v63 = objc_msgSend(v64, "code", v18);
          goto LABEL_52;
        }
LABEL_63:
        int v48 = -16132;
        goto LABEL_44;
      }
    }
    FigDebugAssert3();
    goto LABEL_61;
  }

  if (a7) {
    *a7 = -16134;
  }
  if (*v13 == 1) {
    kdebug_trace();
  }
  return 0;
}

- (void)dealloc
{
  metadataPrefetchQueue = self->_metadataPrefetchQueue;
  if (metadataPrefetchQueue) {
    dispatch_release(metadataPrefetchQueue);
  }
  bufferPrefetchQueue = self->_bufferPrefetchQueue;
  if (bufferPrefetchQueue) {
    dispatch_release(bufferPrefetchQueue);
  }
  v5.receiver = self;
  v5.super_class = (Class)BWDeferredProcessingContainer;
  [(BWDeferredContainer *)&v5 dealloc];
}

- (__CVBuffer)copyBufferForTag:(id)a3 err:(int *)a4
{
  int v10 = 0;
  double v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (!a3)
  {
    FigDebugAssert3();
    int v9 = -16134;
LABEL_16:
    int v10 = v9;
    goto LABEL_8;
  }
  pthread_rwlock_rdlock(&self->super._lock);
  a3 = (id)-[BWDeferredContainer _intermediateForTag:]((uint64_t)self, (uint64_t)a3);
  if (!a3)
  {
LABEL_15:
    int v9 = -16136;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    a3 = 0;
    goto LABEL_15;
  }
  a3 = (id)[a3 fetchAndRetain:&v10];
  if (v10) {
    FigDebugAssert3();
  }
LABEL_8:
  pthread_rwlock_unlock(&self->super._lock);
  if (a4) {
    *a4 = v10;
  }
  if (*v7 == 1) {
    kdebug_trace();
  }
  return (__CVBuffer *)a3;
}

- (__CVBuffer)copyBufferForType:(unint64_t)a3 portType:(id)a4 metadata:(id *)a5 err:(int *)a6
{
  int v21 = 0;
  p_locuint64_t k = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  intermediates = self->super._intermediates;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__BWDeferredProcessingContainer_copyBufferForType_portType_metadata_err___block_invoke;
  v20[3] = &unk_1E5C29430;
  v20[4] = a4;
  v20[5] = a3;
  unint64_t v13 = [(NSMutableArray *)intermediates indexOfObjectPassingTest:v20];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v14 = v13, v13 >= [(NSMutableArray *)self->super._intermediates count])
    || ![(NSMutableArray *)self->super._intermediates objectAtIndexedSubscript:v14])
  {
    uint64_t v17 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    id v15 = (void *)[(NSMutableArray *)self->super._intermediates objectAtIndexedSubscript:v14];
    uint64_t v16 = (__CVBuffer *)[v15 tag];
    uint64_t v17 = [v15 metadataTag];
    if (v16) {
      uint64_t v16 = [(BWDeferredProcessingContainer *)self copyBufferForTag:v16 err:&v21];
    }
  }
  if (v21)
  {
    FigDebugAssert3();
    id v18 = 0;
  }
  else
  {
    id v18 = 0;
    if (a5 && v17) {
      id v18 = [(BWDeferredProcessingContainer *)self copyMetadataForTag:v17 err:&v21];
    }
  }
  pthread_rwlock_unlock(p_lock);
  if (a6) {
    *a6 = v21;
  }
  if (a5) {
    *a5 = v18;
  }
  return v16;
}

uint64_t __73__BWDeferredProcessingContainer_copyBufferForType_portType_metadata_err___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", *(void *)(a1 + 32));
  if (result) {
    return [a2 bufferType] == *(void *)(a1 + 40);
  }
  return result;
}

- (id)copyBuffersForType:(unint64_t)a3 portType:(id)a4 metadataArray:(id *)a5 err:(int *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int v36 = 0;
  p_locuint64_t k = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  intermediates = self->super._intermediates;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __79__BWDeferredProcessingContainer_copyBuffersForType_portType_metadataArray_err___block_invoke;
  v35[3] = &unk_1E5C29430;
  v35[4] = a4;
  v35[5] = a3;
  unint64_t v14 = (void *)[(NSMutableArray *)self->super._intermediates objectsAtIndexes:[(NSMutableArray *)intermediates indexesOfObjectsPassingTest:v35]];
  if ([v14 count])
  {
    id v15 = (void *)[MEMORY[0x1E4F1CA48] array];
    if (a5) {
      uint64_t v16 = (void *)[MEMORY[0x1E4F1CA48] array];
    }
    else {
      uint64_t v16 = 0;
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v17 = [v14 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v29 = p_lock;
      uint64_t v30 = a6;
      uint64_t v19 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v14);
          }
          int v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v22 = [v21 tag];
          uint64_t v23 = [v21 metadataTag];
          if (v22)
          {
            uint64_t v24 = [(BWDeferredProcessingContainer *)self copyBufferForTag:v22 err:&v36];
            if (v24) {
              [v15 addObject:v24];
            }
            CVPixelBufferRelease(v24);
            if (v36)
            {
              uint64_t v28 = v6;
              LODWORD(v27) = v36;
LABEL_24:
              FigDebugAssert3();
              goto LABEL_25;
            }
          }
          if (a5 && v23)
          {
            id v25 = [(BWDeferredProcessingContainer *)self copyMetadataForTag:v23 err:&v36];
            if (v25) {
              [v16 addObject:v25];
            }

            if (v36)
            {
              uint64_t v28 = v6;
              LODWORD(v27) = v36;
              goto LABEL_24;
            }
          }
        }
        uint64_t v18 = [v14 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v18) {
          continue;
        }
        break;
      }
LABEL_25:
      p_locuint64_t k = v29;
      a6 = v30;
    }
  }
  else
  {
    uint64_t v16 = 0;
    id v15 = 0;
  }
  pthread_rwlock_unlock(p_lock);
  if (a6) {
    *a6 = v36;
  }
  if (a5) {
    *a5 = (id)[v16 copy];
  }
  return (id)objc_msgSend(v15, "copy", v27, v28);
}

uint64_t __79__BWDeferredProcessingContainer_copyBuffersForType_portType_metadataArray_err___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", *(void *)(a1 + 32));
  if (result) {
    return [a2 bufferType] == *(void *)(a1 + 40);
  }
  return result;
}

- (id)copyAttributesForBufferType:(unint64_t)a3 portType:(id)a4 err:(int *)a5
{
  p_locuint64_t k = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  intermediates = self->super._intermediates;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__BWDeferredProcessingContainer_copyAttributesForBufferType_portType_err___block_invoke;
  v17[3] = &unk_1E5C29430;
  v17[4] = a4;
  v17[5] = a3;
  uint64_t v11 = [(NSMutableArray *)intermediates indexOfObjectPassingTest:v17];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL
    && (uint64_t v14 = v11,
        [(NSMutableArray *)self->super._intermediates objectAtIndexedSubscript:v11])
    && (id v15 = (void *)[(NSMutableArray *)self->super._intermediates objectAtIndexedSubscript:v14], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v12 = (void *)[v15 attributes];
    int v13 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    int v13 = -16136;
  }
  pthread_rwlock_unlock(p_lock);
  if (a5) {
    *a5 = v13;
  }
  return v12;
}

uint64_t __74__BWDeferredProcessingContainer_copyAttributesForBufferType_portType_err___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [a2 bufferType] != *(void *)(a1 + 40)) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 portType];
  uint64_t v5 = *(void *)(a1 + 32);
  return [v4 isEqualToString:v5];
}

- (id)copyMetadataForBufferTag:(id)a3 err:(int *)a4
{
  double v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (a3)
  {
    pthread_rwlock_rdlock(&self->super._lock);
    intermediates = self->super._intermediates;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__BWDeferredProcessingContainer_copyMetadataForBufferTag_err___block_invoke;
    v12[3] = &unk_1E5C293B8;
    v12[4] = a3;
    uint64_t v9 = [(NSMutableArray *)intermediates indexOfObjectPassingTest:v12];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      a3 = 0;
    }
    else {
      a3 = (id)[(NSMutableArray *)self->super._intermediates objectAtIndexedSubscript:v9];
    }
    int v10 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v10 = -16134;
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (a4) {
    *a4 = v10;
  }
  if (*v7 == 1) {
    kdebug_trace();
  }
  return a3;
}

uint64_t __62__BWDeferredProcessingContainer_copyMetadataForBufferTag_err___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [a2 bufferTag];
  return [v4 isEqualToString:v5];
}

- (id)copyMetadataForTag:(id)a3 err:(int *)a4
{
  int v11 = 0;
  double v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  v8 = (void *)-[BWDeferredProcessingContainer _copyObjectForTag:customClasses:err:]((uint64_t)self, (uint64_t)a3, 0, &v11);
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (*v7 == 1) {
      kdebug_trace();
    }
  }
  else
  {
    int v11 = -16132;
  }
  int v9 = v11;
  if (a4) {
    *a4 = v11;
  }
  if (v9)
  {

    return 0;
  }
  return v8;
}

- (BOOL)hasInferenceBuffer:(id)a3 portType:(id)a4
{
  p_locuint64_t k = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  intermediates = self->super._intermediates;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__BWDeferredProcessingContainer_hasInferenceBuffer_portType___block_invoke;
  v13[3] = &unk_1E5C29458;
  v13[4] = a4;
  v13[5] = a3;
  unint64_t v9 = [(NSMutableArray *)intermediates indexOfObjectPassingTest:v13];
  BOOL v11 = v9 != 0x7FFFFFFFFFFFFFFFLL
     && (unint64_t v10 = v9, v9 < [(NSMutableArray *)self->super._intermediates count])
     && [(NSMutableArray *)self->super._intermediates objectAtIndexedSubscript:v10] != 0;
  pthread_rwlock_unlock(p_lock);
  return v11;
}

uint64_t __61__BWDeferredProcessingContainer_hasInferenceBuffer_portType___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", *(void *)(a1 + 32)))
  {
    return 0;
  }
  uint64_t v4 = (void *)[a2 inferenceAttachedMediaKey];
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 isEqual:v5];
}

- (__CVBuffer)copyInferenceBufferForKey:(id)a3 portType:(id)a4 err:(int *)a5
{
  int v16 = 0;
  p_locuint64_t k = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  intermediates = self->super._intermediates;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__BWDeferredProcessingContainer_copyInferenceBufferForKey_portType_err___block_invoke;
  v15[3] = &unk_1E5C29458;
  v15[4] = a4;
  v15[5] = a3;
  unint64_t v11 = [(NSMutableArray *)intermediates indexOfObjectPassingTest:v15];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v12 = v11, v11 >= [(NSMutableArray *)self->super._intermediates count])
    || ![(NSMutableArray *)self->super._intermediates objectAtIndexedSubscript:v12])
  {
    int v13 = 0;
  }
  else
  {
    int v13 = (__CVBuffer *)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->super._intermediates, "objectAtIndexedSubscript:", v12), "fetchAndRetain:", &v16);
    if (v16) {
      FigDebugAssert3();
    }
  }
  pthread_rwlock_unlock(p_lock);
  if (a5) {
    *a5 = v16;
  }
  return v13;
}

uint64_t __72__BWDeferredProcessingContainer_copyInferenceBufferForKey_portType_err___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", *(void *)(a1 + 32)))
  {
    return 0;
  }
  uint64_t v4 = (void *)[a2 inferenceAttachedMediaKey];
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 isEqual:v5];
}

- (BOOL)hasInference:(id)a3 portType:(id)a4
{
  p_locuint64_t k = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  intermediates = self->super._intermediates;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__BWDeferredProcessingContainer_hasInference_portType___block_invoke;
  v13[3] = &unk_1E5C29458;
  v13[4] = a4;
  v13[5] = a3;
  unint64_t v9 = [(NSMutableArray *)intermediates indexOfObjectPassingTest:v13];
  BOOL v11 = v9 != 0x7FFFFFFFFFFFFFFFLL
     && (unint64_t v10 = v9, v9 < [(NSMutableArray *)self->super._intermediates count])
     && [(NSMutableArray *)self->super._intermediates objectAtIndexedSubscript:v10] != 0;
  pthread_rwlock_unlock(p_lock);
  return v11;
}

uint64_t __55__BWDeferredProcessingContainer_hasInference_portType___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", *(void *)(a1 + 32)))
  {
    return 0;
  }
  uint64_t v4 = (void *)[a2 inferenceAttachmentKey];
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 isEqual:v5];
}

- (id)copyInferenceForKey:(id)a3 customClasses:(id)a4 portType:(id)a5 err:(int *)a6
{
  int v18 = 0;
  p_locuint64_t k = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  intermediates = self->super._intermediates;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__BWDeferredProcessingContainer_copyInferenceForKey_customClasses_portType_err___block_invoke;
  v17[3] = &unk_1E5C29458;
  v17[4] = a5;
  v17[5] = a3;
  unint64_t v13 = [(NSMutableArray *)intermediates indexOfObjectPassingTest:v17];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v14 = v13, v13 >= [(NSMutableArray *)self->super._intermediates count])
    || ![(NSMutableArray *)self->super._intermediates objectAtIndexedSubscript:v14])
  {
    id v15 = 0;
  }
  else
  {
    id v15 = objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->super._intermediates, "objectAtIndexedSubscript:", v14), "fetchWithCustomClassesAndRetain:err:", a4, &v18);
    if (v18) {
      FigDebugAssert3();
    }
  }
  pthread_rwlock_unlock(p_lock);
  if (a6) {
    *a6 = v18;
  }
  return v15;
}

uint64_t __80__BWDeferredProcessingContainer_copyInferenceForKey_customClasses_portType_err___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", *(void *)(a1 + 32)))
  {
    return 0;
  }
  uint64_t v4 = (void *)[a2 inferenceAttachmentKey];
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 isEqual:v5];
}

- (id)copyArrayForTag:(id)a3 customClasses:(id)a4 err:(int *)a5
{
  int v13 = 0;
  unint64_t v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  unint64_t v10 = (void *)-[BWDeferredProcessingContainer _copyObjectForTag:customClasses:err:]((uint64_t)self, (uint64_t)a3, (uint64_t)a4, &v13);
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (*v9 == 1) {
      kdebug_trace();
    }
  }
  else
  {
    int v13 = -16132;
  }
  int v11 = v13;
  if (a5) {
    *a5 = v13;
  }
  if (v11)
  {

    return 0;
  }
  return v10;
}

- (void)releaseIntermediates
{
  p_locuint64_t k = &self->super._lock;
  pthread_rwlock_wrlock(&self->super._lock);

  self->super._intermediates = 0;
  pthread_rwlock_unlock(p_lock);
}

- (void)abortingProcessingDueToError:(int)a3
{
  if (!self->_sessionDictionary
    || (-[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionDictionary, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:*(void *)&a3], @"PreviousError"), uint64_t v4 = 0, !+[BWDeferredContainer archiveObjectWithURL:object:error:](BWDeferredContainer, "archiveObjectWithURL:object:error:", -[BWDeferredContainer _containerSessionDataURL]((uint64_t)self), self->_sessionDictionary, &v4)))
  {
    FigDebugAssert3();
  }
}

- (unsigned)processingCount
{
  return self->_processingCount;
}

- (unint64_t)sizeBytes
{
  return self->_sizeBytes;
}

- (unsigned)ageSeconds
{
  return self->_ageSeconds;
}

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (int)previousAttemptErrorCode
{
  return self->_previousAttemptErrorCode;
}

@end