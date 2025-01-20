@interface BWPhotoDecompressorNode
+ (void)initialize;
- (BOOL)downstreamIsSharingOutputPool;
- (BWPhotoDecompressorNode)initWithSynchronizedSlaveAttachedMediaDecompressionEnabled:(BOOL)a3;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_ensureSemaphoresAreBalanced;
- (void)_releaseResources;
- (void)_setOverCaptureSynchronizedSlaveSemaphoreEnabled:(void *)result;
- (void)addEmitSampleBufferSemaphore:(id)a3;
- (void)addEmitSynchronizedSlaveSampleBufferSemaphore:(id)a3;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setDownstreamIsSharingOutputPool:(BOOL)a3;
- (void)suspendResources;
@end

@implementation BWPhotoDecompressorNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (self->_synchronizedSlaveAttachedMediaDecompressionEnabled)
  {
    int v8 = objc_msgSend(a5, "isEqualToString:", 0x1EFA742E0, a4);
    if (v8) {
      v9 = @"SynchronizedSlaveFrame";
    }
    else {
      v9 = (__CFString *)a5;
    }
  }
  else
  {
    int v8 = 0;
    v9 = (__CFString *)a5;
  }
  v10 = [(BWNodeOutput *)self->super._output mediaPropertiesForAttachedMediaKey:v9];
  if (v10)
  {
    v11 = v10;
    if (([(__CFString *)v9 isEqualToString:@"PrimaryFormat"] & 1) == 0)
    {
      uint64_t v12 = [NSString stringWithFormat:@"%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)", self, self->super._output, v9, a5];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:0]);
    }
  }
  else
  {
    v11 = objc_alloc_init(BWNodeOutputMediaProperties);
    [(BWNodeOutput *)self->super._output _setMediaProperties:v11 forAttachedMediaKey:v9];
  }
  if ((v8 | [(__CFString *)v9 isEqualToString:@"PrimaryFormat"]) == 1)
  {
    v13 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v13, "setWidth:", [a3 width]);
    -[BWVideoFormatRequirements setHeight:](v13, "setHeight:", [a3 height]);
    if (FigCapturePixelFormatIsFullRange([a3 pixelFormat])) {
      uint64_t v14 = 875704422;
    }
    else {
      uint64_t v14 = 875704438;
    }
    v17[0] = [NSNumber numberWithUnsignedInt:v14];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v13, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1]);
    if ([a3 colorSpaceProperties])
    {
      uint64_t v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
      -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v13, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1]);
    }
    id v15 = [(BWNodeOutput *)self->super._output mediaConfigurationForAttachedMediaKey:v9];
    [v15 setFormatRequirements:v13];
    [v15 setProvidesPixelBufferPool:1];
  }
  else
  {
    [(BWNodeOutputMediaProperties *)v11 setResolvedFormat:a3];
  }
}

- (id)nodeType
{
  return @"Effect";
}

- (BWPhotoDecompressorNode)initWithSynchronizedSlaveAttachedMediaDecompressionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BWPhotoDecompressorNode;
  v4 = [(BWNode *)&v12 init];
  if (v4)
  {
    v5 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v4];
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v6 setSupportedPixelFormats:&unk_1EFB02AE0];
    [(BWNodeInput *)v5 setFormatRequirements:v6];

    [(BWNode *)v4 addInput:v5];
    v4->_synchronizedSlaveAttachedMediaDecompressionEnabled = v3;
    if (v3)
    {
      v7 = objc_alloc_init(BWNodeInputMediaConfiguration);
      [(BWNodeInputMediaConfiguration *)v7 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeInputMediaConfiguration *)v7 setPassthroughMode:0];
      [(BWNodeInput *)v5 setMediaConfiguration:v7 forAttachedMediaKey:0x1EFA742E0];
    }
    int v8 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v4];
    [(BWNode *)v4 addOutput:v8];

    if (v4->_synchronizedSlaveAttachedMediaDecompressionEnabled)
    {
      v9 = objc_alloc_init(BWVideoFormatRequirements);
      v10 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      [(BWNodeOutputMediaConfiguration *)v10 setFormatRequirements:v9];
      [(BWNodeOutputMediaConfiguration *)v10 setPassthroughMode:0];
      [(BWNodeOutputMediaConfiguration *)v10 setIndexOfInputWhichDrivesThisOutput:0];
      [(BWNodeOutputMediaConfiguration *)v10 setAttachedMediaKeyOfInputWhichDrivesThisOutput:0x1EFA742E0];
      [(BWNodeOutput *)v8 setMediaConfiguration:v10 forAttachedMediaKey:@"SynchronizedSlaveFrame"];
    }
  }
  return v4;
}

- (void)addEmitSampleBufferSemaphore:(id)a3
{
  emitSampleBufferSemaphores = self->_emitSampleBufferSemaphores;
  if (!emitSampleBufferSemaphores)
  {
    emitSampleBufferSemaphores = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_emitSampleBufferSemaphores = emitSampleBufferSemaphores;
  }
  [(NSMutableArray *)emitSampleBufferSemaphores addObject:a3];
}

+ (void)initialize
{
}

- (void)dealloc
{
  -[BWPhotoDecompressorNode _releaseResources]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)BWPhotoDecompressorNode;
  [(BWNode *)&v3 dealloc];
}

- (void)_releaseResources
{
  if (a1)
  {
    -[BWPhotoDecompressorNode _ensureSemaphoresAreBalanced](a1);

    *(void *)(a1 + 104) = 0;
    *(void *)(a1 + 112) = 0;
  }
}

- (id)nodeSubType
{
  return @"PhotoDecompressor";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v2.receiver = self;
  v2.super_class = (Class)BWPhotoDecompressorNode;
  [(BWNode *)&v2 prepareForCurrentConfigurationToBecomeLive];
}

- (void)suspendResources
{
  v3.receiver = self;
  v3.super_class = (Class)BWPhotoDecompressorNode;
  [(BWNode *)&v3 suspendResources];
  [(BWPhotoDecompressor *)self->_photoDecompressor flush];
  [(BWPhotoDecompressor *)self->_synchronizedSlavePhotoDecompressor flush];
}

- (void)didReachEndOfDataForInput:(id)a3
{
  -[BWPhotoDecompressorNode _releaseResources]((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)BWPhotoDecompressorNode;
  [(BWNode *)&v5 didReachEndOfDataForInput:a3];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  v4 = a3;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  memset(&v54, 0, sizeof(v54));
  CMSampleBufferGetPresentationTimeStamp(&v54, a3);
  CMBlockBufferRef DataBuffer = CMSampleBufferGetDataBuffer(v4);
  if (DataBuffer)
  {
    CFTypeRef v40 = CMGetAttachment(v4, @"SampleDataToBeDropped", 0);
    if ([(NSMutableArray *)self->_emitSampleBufferSemaphores count])
    {
      ++self->_numberOfTimesWaited;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      emitSampleBufferSemaphores = self->_emitSampleBufferSemaphores;
      uint64_t v8 = [(NSMutableArray *)emitSampleBufferSemaphores countByEnumeratingWithState:&v50 objects:v57 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v51 != v10) {
              objc_enumerationMutation(emitSampleBufferSemaphores);
            }
            dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*((void *)&v50 + 1) + 8 * i), 0xFFFFFFFFFFFFFFFFLL);
          }
          uint64_t v9 = [(NSMutableArray *)emitSampleBufferSemaphores countByEnumeratingWithState:&v50 objects:v57 count:16];
        }
        while (v9);
      }
    }
    objc_super v12 = (const void **)MEMORY[0x1E4F1CFD0];
    if ([(NSMutableArray *)self->_emitSynchronizedSlaveSampleBufferSemaphores count]
      && (unint64_t v13 = [(NSMutableArray *)self->_emitSynchronizedSlaveSampleBufferSemaphores count],
          v13 <= [(NSMutableSet *)self->_disabledSynchronizedSlaveSemaphores count]))
    {
      BOOL v14 = 0;
      uint64_t AttachedMedia = 0;
    }
    else
    {
      uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(v4, 0x1EFA742E0);
      BOOL v14 = AttachedMedia != 0;
    }
    CFTypeRef v21 = *v12;
    photoDecompressor = self->_photoDecompressor;
    if (!photoDecompressor)
    {
      photoDecompressor = [[BWPhotoDecompressor alloc] initWithOutputPixelBufferPool:[(BWNodeOutput *)self->super._output livePixelBufferPool]];
      self->_photoDecompressor = photoDecompressor;
    }
    v20 = [(BWPhotoDecompressor *)photoDecompressor newUncompressedSampleBufferFromSampleBuffer:v4];
    FigCaptureMetadataUtilitiesAddSampleBufferMetadataUsedByVideoEncoderToPixelBuffer(v20);
    id v19 = 0;
    if (v40 == v21 && v20)
    {
      if (![(NSMutableArray *)self->_emitSampleBufferSemaphores count])
      {
        id v19 = 0;
        if (v14) {
          goto LABEL_27;
        }
        goto LABEL_46;
      }
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v19 addObjectsFromArray:self->_emitSampleBufferSemaphores];
      CMSetAttachment(v20, @"SampleDataToBeDroppedEmitSampleBufferSemaphores", v19, 1u);
    }
    if (v14) {
      goto LABEL_27;
    }
LABEL_46:
    if (v20)
    {
      int v17 = 0;
      BOOL v18 = 0;
      v4 = v20;
      goto LABEL_52;
    }
    if (![(NSMutableArray *)self->_emitSynchronizedSlaveSampleBufferSemaphores count])
    {
      v20 = 0;
LABEL_53:
      CMTime v41 = v54;
      [(BWNodeOutput *)self->super._output emitDroppedSample:+[BWDroppedSample newDroppedSampleWithReason:0x1EFA67F60 pts:&v41]];
      ++self->_numberOfBuffersEmitted;
LABEL_54:
      ++self->_numberOfSynchronizedSlaveBuffersEmitted;
      goto LABEL_55;
    }
LABEL_27:
    CFTypeRef v36 = v21;
    BOOL v37 = v14;
    v38 = DataBuffer;
    if ([(NSMutableArray *)self->_emitSynchronizedSlaveSampleBufferSemaphores count])
    {
      ++self->_numberOfTimesSynchronizedSlaveWaited;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      emitSynchronizedSlaveSampleBufferSemaphores = self->_emitSynchronizedSlaveSampleBufferSemaphores;
      uint64_t v24 = [(NSMutableArray *)emitSynchronizedSlaveSampleBufferSemaphores countByEnumeratingWithState:&v46 objects:v56 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v47;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v47 != v26) {
              objc_enumerationMutation(emitSynchronizedSlaveSampleBufferSemaphores);
            }
            v28 = *(NSObject **)(*((void *)&v46 + 1) + 8 * j);
            if (([(NSMutableSet *)self->_disabledSynchronizedSlaveSemaphores containsObject:v28] & 1) == 0) {
              dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
            }
          }
          uint64_t v25 = [(NSMutableArray *)emitSynchronizedSlaveSampleBufferSemaphores countByEnumeratingWithState:&v46 objects:v56 count:16];
        }
        while (v25);
      }
    }
    else if ([(NSMutableArray *)self->_emitSampleBufferSemaphores count])
    {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"We have an emitSampleBufferSemaphore but no emitSynchronizedSlaveSampleBufferSemaphore" userInfo:0]);
    }
    if (!v20) {
      goto LABEL_53;
    }
    synchronizedSlavePhotoDecompressor = self->_synchronizedSlavePhotoDecompressor;
    if (!synchronizedSlavePhotoDecompressor)
    {
      synchronizedSlavePhotoDecompressor = -[BWPhotoDecompressor initWithOutputPixelBufferPool:]([BWPhotoDecompressor alloc], "initWithOutputPixelBufferPool:", objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", @"SynchronizedSlaveFrame"), "livePixelBufferPool"));
      self->_synchronizedSlavePhotoDecompressor = synchronizedSlavePhotoDecompressor;
    }
    v30 = [(BWPhotoDecompressor *)synchronizedSlavePhotoDecompressor newUncompressedSampleBufferFromSampleBuffer:AttachedMedia];
    FigCaptureMetadataUtilitiesAddSampleBufferMetadataUsedByVideoEncoderToPixelBuffer(v20);
    BWSampleBufferRemoveAttachedMedia(v20, 0x1EFA742E0);
    BOOL v18 = v37;
    if (v30)
    {
      BWSampleBufferSetAttachedMedia(v20, @"SynchronizedSlaveFrame", (uint64_t)v30);
      if (v40 == v36)
      {
        if ([(NSMutableArray *)self->_emitSynchronizedSlaveSampleBufferSemaphores count])
        {
          [v19 addObjectsFromArray:self->_emitSynchronizedSlaveSampleBufferSemaphores];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          disabledSynchronizedSlaveSemaphores = self->_disabledSynchronizedSlaveSemaphores;
          uint64_t v32 = [(NSMutableSet *)disabledSynchronizedSlaveSemaphores countByEnumeratingWithState:&v42 objects:v55 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v43;
            do
            {
              for (uint64_t k = 0; k != v33; ++k)
              {
                if (*(void *)v43 != v34) {
                  objc_enumerationMutation(disabledSynchronizedSlaveSemaphores);
                }
                [v19 removeObject:*(void *)(*((void *)&v42 + 1) + 8 * k)];
              }
              uint64_t v33 = [(NSMutableSet *)disabledSynchronizedSlaveSemaphores countByEnumeratingWithState:&v42 objects:v55 count:16];
            }
            while (v33);
          }
        }
      }
      CFRelease(v30);
      int v17 = 1;
    }
    else
    {
      int v17 = 0;
    }
    v4 = v20;
    CMBlockBufferRef DataBuffer = v38;
    if (v17) {
      goto LABEL_58;
    }
    goto LABEL_52;
  }
  id v15 = (void *)CMGetAttachment(v4, @"FileWriterAction", 0);
  if (v15)
  {
    if (self->_synchronizedSlaveAttachedMediaDecompressionEnabled)
    {
      if ([v15 isEqualToString:0x1EFA73540])
      {
        uint64_t v16 = (void *)CMGetAttachment(v4, @"RecordingSettings", 0);
        if (v16) {
          -[BWPhotoDecompressorNode _setOverCaptureSynchronizedSlaveSemaphoreEnabled:](self, [v16 spatialOverCaptureMovieURL] != 0);
        }
      }
    }
  }
  int v17 = 0;
  BOOL v18 = 0;
  id v19 = 0;
  v20 = 0;
LABEL_52:
  if (v18) {
    goto LABEL_53;
  }
LABEL_58:
  if (v4)
  {
    [(BWNodeOutput *)self->super._output emitSampleBuffer:v4];
    if (DataBuffer) {
      ++self->_numberOfBuffersEmitted;
    }
    if (v17) {
      goto LABEL_54;
    }
  }
LABEL_55:
  if (v20) {
    CFRelease(v20);
  }
}

- (void)_setOverCaptureSynchronizedSlaveSemaphoreEnabled:(void *)result
{
  if (result)
  {
    objc_super v2 = result;
    result = (void *)result[16];
    if (result)
    {
      uint64_t v4 = [result lastObject];
      id v5 = (id)v2[17];
      if (!v5)
      {
        id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v2[17] = v5;
      }
      if (a2)
      {
        return (void *)[v5 removeObject:v4];
      }
      else
      {
        return (void *)[v5 addObject:v4];
      }
    }
  }
  return result;
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if ([(NSMutableArray *)self->_emitSampleBufferSemaphores count])
  {
    v6 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:self->_emitSampleBufferSemaphores];
    if ([(NSMutableArray *)self->_emitSynchronizedSlaveSampleBufferSemaphores count]) {
      [v6 addObjectsFromArray:self->_emitSynchronizedSlaveSampleBufferSemaphores];
    }
    id v7 = +[BWDroppedSample newDroppedSampleFromDroppedSample:a3 backPressureSemaphoresToIgnore:v6];
  }
  else
  {
    id v7 = a3;
  }
  id v8 = v7;
  [(BWNodeOutput *)self->super._output emitDroppedSample:v7];
}

- (BOOL)downstreamIsSharingOutputPool
{
  return self->_downstreamIsSharingOutputPool;
}

- (void)setDownstreamIsSharingOutputPool:(BOOL)a3
{
  self->_downstreamIsSharingOutputPool = a3;
}

- (void)addEmitSynchronizedSlaveSampleBufferSemaphore:(id)a3
{
  emitSynchronizedSlaveSampleBufferSemaphores = self->_emitSynchronizedSlaveSampleBufferSemaphores;
  if (!emitSynchronizedSlaveSampleBufferSemaphores)
  {
    emitSynchronizedSlaveSampleBufferSemaphores = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_emitSynchronizedSlaveSampleBufferSemaphores = emitSynchronizedSlaveSampleBufferSemaphores;
  }
  [(NSMutableArray *)emitSynchronizedSlaveSampleBufferSemaphores addObject:a3];
}

- (uint64_t)_ensureSemaphoresAreBalanced
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if ([*(id *)(result + 120) count] && *(_DWORD *)(v1 + 148) < *(_DWORD *)(v1 + 144))
    {
      do
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        objc_super v2 = *(void **)(v1 + 120);
        uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v3)
        {
          uint64_t v4 = v3;
          uint64_t v5 = *(void *)v16;
          do
          {
            for (uint64_t i = 0; i != v4; ++i)
            {
              if (*(void *)v16 != v5) {
                objc_enumerationMutation(v2);
              }
              dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((void *)&v15 + 1) + 8 * i));
            }
            uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v20 count:16];
          }
          while (v4);
        }
        ++*(_DWORD *)(v1 + 148);
      }
      while (*(_DWORD *)(v1 + 148) < *(_DWORD *)(v1 + 144));
    }
    result = [*(id *)(v1 + 128) count];
    if (result && *(_DWORD *)(v1 + 156) < *(_DWORD *)(v1 + 152))
    {
      do
      {
        long long v13 = 0u;
        long long v14 = 0u;
        long long v11 = 0u;
        long long v12 = 0u;
        id v7 = *(void **)(v1 + 128);
        result = [v7 countByEnumeratingWithState:&v11 objects:v19 count:16];
        if (result)
        {
          uint64_t v8 = result;
          uint64_t v9 = *(void *)v12;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v12 != v9) {
                objc_enumerationMutation(v7);
              }
              dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((void *)&v11 + 1) + 8 * v10++));
            }
            while (v8 != v10);
            result = [v7 countByEnumeratingWithState:&v11 objects:v19 count:16];
            uint64_t v8 = result;
          }
          while (result);
        }
        ++*(_DWORD *)(v1 + 156);
      }
      while (*(_DWORD *)(v1 + 156) < *(_DWORD *)(v1 + 152));
    }
  }
  return result;
}

@end