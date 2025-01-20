@interface BWFaceDetectionNode
+ (void)initialize;
- (BOOL)boxedMetadataOutputEnabled;
- (BOOL)emitsEmptyObjectDetectionMetadata;
- (BOOL)metadataObjectOutputEnabled;
- (BWFaceDetectionNode)initWithObjectMetadataIdentifiers:(id)a3 movieFileOutputMetadataIdentifierGroups:(id)a4;
- (BWNodeOutput)metadataObjectOutput;
- (CGRect)rectOfInterest;
- (NSArray)boxedMetadataOutputs;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_addDetectedObjectsInfo:(uint64_t)a3 detectedObjectsSource:(const void *)a4 toSampleBuffer:;
- (uint64_t)_addFacesArray:(const void *)a3 toSampleBuffer:;
- (uint64_t)_getEmptyMetadataSampleData;
- (uint64_t)_populateLocalIDsForCatBodiesWithFormatDescription:(uint64_t)result;
- (uint64_t)_populateLocalIDsForDogBodiesWithFormatDescription:(uint64_t)result;
- (uint64_t)_populateLocalIDsForFacesWithFormatDescription:(uint64_t)result;
- (uint64_t)_populateLocalIDsForHumanBodiesWithFormatDescription:(uint64_t)result;
- (uint64_t)_populateLocalIDsForSalientObjectsWithFormatDescription:(uint64_t)result;
- (uint64_t)_renderSampleBufferForBoxedMetadataOutput:(void *)a3 withDetectedObjectsInfo:;
- (uint64_t)append:(_DWORD *)a3 toBoxedData:(_DWORD *)a4 localIDs:(int)a5 isFace:;
- (uint64_t)localIDsForKey:(uint64_t)result;
- (void)_renderSampleBuffer:(void *)a3 forBoxedMetadataOutput:(void *)a4 withDetectedObjectsInfo:;
- (void)_renderSampleBufferForBoxedMetadataOutput:(void *)a3 withFaceArray:;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setBoxedMetadataOutputEnabled:(BOOL)a3;
- (void)setEmitsEmptyObjectDetectionMetadata:(BOOL)a3;
- (void)setMetadataObjectOutputEnabled:(BOOL)a3;
- (void)setRectOfInterest:(CGRect)a3;
@end

@implementation BWFaceDetectionNode

- (id)nodeType
{
  return @"Effect";
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_metadataObjectOutputEnabled) {
    [(BWNodeOutput *)self->_metadataObjectOutput makeConfiguredFormatLive];
  }
  if (self->_boxedMetadataOutputEnabled)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    boxedMetadataOutputs = self->_boxedMetadataOutputs;
    uint64_t v7 = [(NSArray *)boxedMetadataOutputs countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(boxedMetadataOutputs);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) makeConfiguredFormatLive];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)boxedMetadataOutputs countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (BWNodeOutput)metadataObjectOutput
{
  return self->_metadataObjectOutput;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  if (!a3) {
    return;
  }
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    boxedMetadataOutputs = self->_boxedMetadataOutputs;
    uint64_t v7 = [(NSArray *)boxedMetadataOutputs countByEnumeratingWithState:&v79 objects:v86 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v80 != v9) {
            objc_enumerationMutation(boxedMetadataOutputs);
          }
          [*(id *)(*((void *)&v79 + 1) + 8 * i) emitSampleBuffer:a3];
        }
        uint64_t v8 = [(NSArray *)boxedMetadataOutputs countByEnumeratingWithState:&v79 objects:v86 count:16];
      }
      while (v8);
    }
    [(BWNodeOutput *)self->_metadataObjectOutput emitSampleBuffer:a3];
    [(BWNodeOutput *)self->super.super._output emitSampleBuffer:a3];
    long long v11 = (void *)CMGetAttachment(a3, @"FileWriterAction", 0);
    if (v11)
    {
      long long v12 = v11;
      if (([v11 isEqualToString:0x1EFA73580] & 1) == 0
        && ([v12 isEqualToString:0x1EFA735A0] & 1) == 0)
      {
        int v13 = [v12 isEqualToString:0x1EFA73540];
        p_startMarkerBufferPTS = &self->_startMarkerBufferPTS;
        v15 = (long long *)MEMORY[0x1E4F1F9F8];
        if (v13)
        {
          CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.duration, a3);
          *(_OWORD *)&p_startMarkerBufferPTS->value = *(_OWORD *)&sampleTimingArray.duration.value;
          CMTimeEpoch epoch = sampleTimingArray.duration.epoch;
        }
        else
        {
          *(_OWORD *)&p_startMarkerBufferPTS->value = *MEMORY[0x1E4F1F9F8];
          CMTimeEpoch epoch = *((void *)v15 + 2);
        }
        self->_startMarkerBufferPTS.CMTimeEpoch epoch = epoch;
        long long v52 = *v15;
        *(_OWORD *)&self->_prevBoxedFacePTS.value = *v15;
        int64_t v53 = *((void *)v15 + 2);
        self->_prevBoxedFacePTS.CMTimeEpoch epoch = v53;
        *(_OWORD *)&self->_prevBoxedFaceDur.value = v52;
        self->_prevBoxedFaceDur.CMTimeEpoch epoch = v53;
        long long v66 = v52;
        *(_OWORD *)&self->_prevBoxedNoFacePTS.value = v52;
        self->_prevBoxedNoFacePTS.CMTimeEpoch epoch = v53;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        v54 = [(NSDictionary *)self->_detectionTimingInfoByBoxedOutput allValues];
        uint64_t v55 = [(NSArray *)v54 countByEnumeratingWithState:&v75 objects:v85 count:16];
        if (v55)
        {
          uint64_t v56 = v55;
          uint64_t v57 = *(void *)v76;
          do
          {
            for (uint64_t j = 0; j != v56; ++j)
            {
              if (*(void *)v76 != v57) {
                objc_enumerationMutation(v54);
              }
              uint64_t v59 = *(void *)(*((void *)&v75 + 1) + 8 * j);
              if (v59)
              {
                *(_OWORD *)(v59 + 8) = v66;
                *(void *)(v59 + 24) = v53;
                *(_OWORD *)(v59 + 32) = v66;
                *(void *)(v59 + 48) = v53;
                *(_OWORD *)(v59 + 56) = v66;
                *(void *)(v59 + 72) = v53;
                *(_DWORD *)(v59 + 80) = 0;
              }
            }
            uint64_t v56 = [(NSArray *)v54 countByEnumeratingWithState:&v75 objects:v85 count:16];
          }
          while (v56);
        }
      }
    }
    return;
  }
  v17 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v17)
  {
    fig_log_get_emitter();
    goto LABEL_84;
  }
  v18 = v17;
  uint64_t v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F53DC8]];
  uint64_t v20 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F53DC0]];
  double v72 = 0.0;
  double v73 = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  long long v74 = _Q0;
  v26 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
  if (v20 | v19)
  {
    FigCFDictionaryGetCGRectIfPresent();
    if (self->_metadataObjectOutputEnabled)
    {
      memset(&sampleTimingArray, 0, sizeof(sampleTimingArray));
      if (!CMSampleBufferGetSampleTimingInfoArray(a3, 1, &sampleTimingArray, 0)
        && !CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, (CMSampleBufferRef *)&cf))
      {
        v26 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
        goto LABEL_21;
      }
      fig_log_get_emitter();
LABEL_84:
      FigDebugAssert3();
      return;
    }
  }
LABEL_21:
  os_unfair_lock_lock(&self->_rectOfInterestLock);
  double x = self->_rectOfInterest.origin.x;
  double y = self->_rectOfInterest.origin.y;
  double width = self->_rectOfInterest.size.width;
  double height = self->_rectOfInterest.size.height;
  os_unfair_lock_unlock(&self->_rectOfInterestLock);
  BOOL v31 = 0;
  double v32 = *(double *)&v74;
  double v33 = 1.0;
  if (*(double *)&v74 == 1.0)
  {
    double v32 = *((double *)&v74 + 1);
    if (*((double *)&v74 + 1) == 1.0)
    {
      v89.origin.double x = 0.0;
      v89.origin.double y = 0.0;
      v89.size.double width = 1.0;
      v89.size.double height = 1.0;
      v88.origin.double x = x;
      v88.origin.double y = y;
      v88.size.double width = width;
      v88.size.double height = height;
      BOOL v31 = CGRectEqualToRect(v88, v89);
    }
  }
  uint64_t v34 = objc_msgSend((id)v20, "count", v33, v32);
  v35 = (uint64_t *)MEMORY[0x1E4F54348];
  v63 = v18;
  BOOL v64 = v31;
  if (!v34)
  {
    if (self->_lastObjectFaceCount || self->_emitsEmptyObjectDetectionMetadata) {
      goto LABEL_29;
    }
LABEL_31:
    int v65 = 0;
    if (v19) {
      goto LABEL_42;
    }
LABEL_77:
    if (!v65) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }
  uint64_t v36 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v20, "firstObject"), "objectForKeyedSubscript:", *MEMORY[0x1E4F54348]), "longLongValue");
  if (v36 <= self->_previousDetectedFacesTimestamp) {
    goto LABEL_31;
  }
  self->_previousDetectedFacesTimestamp = v36;
LABEL_29:
  if (v31) {
    id v37 = (id)v20;
  }
  else {
    id v37 = BWCreateCorrectedFacesArray((void *)v20, v72, v73, *(double *)&v74, *((double *)&v74 + 1), x, y, width, height);
  }
  v38 = v37;
  if (self->_metadataObjectOutputEnabled
    && [(NSSet *)self->_enabledDetectedObjectTypes containsObject:*MEMORY[0x1E4F538C8]])
  {
    int v65 = -[BWFaceDetectionNode _addFacesArray:toSampleBuffer:]((uint64_t)self, v38, cf);
  }
  else
  {
    int v65 = 0;
  }
  if (self->_boxedMetadataOutputEnabled && !v19) {
    -[BWFaceDetectionNode _renderSampleBufferForBoxedMetadataOutput:withFaceArray:]((uint64_t)self, a3, v38);
  }

  if (!v19) {
    goto LABEL_77;
  }
LABEL_42:
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v39 = (void *)[(id)v19 allValues];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v67 objects:v84 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v68;
    uint64_t v43 = *v35;
    CFPropertyListRef propertyList = (CFPropertyListRef)v19;
LABEL_44:
    v44 = v26;
    uint64_t v45 = 0;
    while (1)
    {
      if (*(void *)v68 != v42) {
        objc_enumerationMutation(v39);
      }
      uint64_t v46 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * v45), "objectForKeyedSubscript:", v43), "longLongValue");
      if (v46 > self->_previousDetectedObjectsTimestamp) {
        break;
      }
      if (v41 == ++v45)
      {
        uint64_t v41 = [v39 countByEnumeratingWithState:&v67 objects:v84 count:16];
        v26 = v44;
        if (v41) {
          goto LABEL_44;
        }
        goto LABEL_77;
      }
    }
    self->_previousDetectedObjectsTimestamp = v46;
    v47 = v44;
    if (v64 && !*((unsigned char *)&self->super.super.super.isa + v44[265]))
    {
      v50 = 0;
      CFPropertyListRef v48 = propertyList;
      v51 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
    }
    else
    {
      CFPropertyListRef v48 = propertyList;
      v49 = (id)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], propertyList, 1uLL);
      v50 = v49;
      v51 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
      if (!v64) {
        BWCorrectRectanglesInDetectedObjectsInfo(v49, v72, v73, *(double *)&v74, *((double *)&v74 + 1), self->_rectOfInterest.origin.x, self->_rectOfInterest.origin.y, self->_rectOfInterest.size.width, self->_rectOfInterest.size.height);
      }
    }
    if (*((unsigned char *)&self->super.super.super.isa + v51[266]))
    {
      if (v50) {
        v60 = v50;
      }
      else {
        v60 = (void *)v48;
      }
      -[BWFaceDetectionNode _renderSampleBufferForBoxedMetadataOutput:withDetectedObjectsInfo:]((uint64_t)self, a3, v60);
    }
    if (!*((unsigned char *)&self->super.super.super.isa + v47[265])) {
      goto LABEL_77;
    }
    BWFilterDetectedObjectsInfoUsingSet((uint64_t)v50, self->_enabledDetectedObjectTypes);
    uint64_t v61 = objc_msgSend((id)objc_msgSend(v63, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DD0]), "intValue");
    if ((v65 | -[BWFaceDetectionNode _addDetectedObjectsInfo:detectedObjectsSource:toSampleBuffer:]((uint64_t)self, v50, v61, cf)))goto LABEL_78; {
    goto LABEL_79;
    }
  }
  if (v65) {
LABEL_78:
  }
    [(BWNodeOutput *)self->super.super._output emitSampleBuffer:cf];
LABEL_79:
  if (cf) {
    CFRelease(cf);
  }
}

- (uint64_t)_addDetectedObjectsInfo:(uint64_t)a3 detectedObjectsSource:(const void *)a4 toSampleBuffer:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  int v10 = 0;
  char v11 = 0;
  uint64_t v12 = *(void *)v19;
  uint64_t v13 = *MEMORY[0x1E4F538F8];
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(a2);
      }
      v15 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *(void *)(*((void *)&v18 + 1) + 8 * i)), "objectForKeyedSubscript:", v13);
      if (v15)
      {
        v10 += [v15 count];
        char v11 = 1;
      }
    }
    uint64_t v9 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v9);
  if (v10 > 0) {
    goto LABEL_12;
  }
  if (*(_DWORD *)(a1 + 204))
  {
    if ((v11 & 1) == 0) {
      return 0;
    }
  }
  else if (((*(unsigned char *)(a1 + 190) != 0) & v11) == 0)
  {
    return 0;
  }
LABEL_12:
  uint64_t v16 = 1;
  CMSetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F52FF0], a2, 1u);
  *(_DWORD *)(a1 + 204) = v10;
  CMSetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F52FF8], (CFTypeRef)[NSNumber numberWithInt:a3], 1u);
  return v16;
}

- (uint64_t)_addFacesArray:(const void *)a3 toSampleBuffer:
{
  if (!a1 || ![a2 count] && !*(_DWORD *)(a1 + 200) && !*(unsigned char *)(a1 + 190)) {
    return 0;
  }
  uint64_t v6 = 1;
  CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53028], a2, 1u);
  CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53030], (CFTypeRef)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "count")), 1u);
  *(_DWORD *)(a1 + 200) = [a2 count];
  return v6;
}

- (void)setRectOfInterest:(CGRect)a3
{
  v10.origin.CGFloat x = 0.0;
  v10.origin.CGFloat y = 0.0;
  v10.size.CGFloat width = 1.0;
  v10.size.CGFloat height = 1.0;
  CGRect v9 = CGRectIntersection(a3, v10);
  CGFloat x = v9.origin.x;
  CGFloat y = v9.origin.y;
  CGFloat width = v9.size.width;
  CGFloat height = v9.size.height;
  if (CGRectIsEmpty(v9))
  {
    CGFloat x = *MEMORY[0x1E4F1DB28];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  os_unfair_lock_lock(&self->_rectOfInterestLock);
  self->_rectOfInterest.origin.CGFloat x = x;
  self->_rectOfInterest.origin.CGFloat y = y;
  self->_rectOfInterest.size.CGFloat width = width;
  self->_rectOfInterest.size.CGFloat height = height;
  os_unfair_lock_unlock(&self->_rectOfInterestLock);
}

- (void)setMetadataObjectOutputEnabled:(BOOL)a3
{
  if (self->_metadataObjectOutputEnabled != a3) {
    self->_metadataObjectOutputEnabled = a3;
  }
}

- (void)setBoxedMetadataOutputEnabled:(BOOL)a3
{
  if (self->_boxedMetadataOutputEnabled != a3) {
    self->_boxedMetadataOutputEnabled = a3;
  }
}

- (BOOL)metadataObjectOutputEnabled
{
  return self->_metadataObjectOutputEnabled;
}

- (BWFaceDetectionNode)initWithObjectMetadataIdentifiers:(id)a3 movieFileOutputMetadataIdentifierGroups:(id)a4
{
  v130[3] = *MEMORY[0x1E4F143B8];
  v75.receiver = self;
  v75.super_class = (Class)BWFaceDetectionNode;
  long long v70 = [(BWNode *)&v75 init];
  if (!v70) {
    return 0;
  }
  uint64_t v6 = [[BWNodeInput alloc] initWithMediaType:1835365473 node:v70];
  [v70 addInput:v6];

  *((void *)v70 + 19) = 0;
  *((void *)v70 + 20) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(v70 + 168) = _Q0;
  *((_DWORD *)v70 + 46) = 0;
  *((void *)v70 + 17) = [[BWNodeOutput alloc] initWithMediaType:1836016234 node:v70];
  id v35 = a3;
  objc_msgSend(*((id *)v70 + 17), "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", a3));
  [v70 addOutput:*((void *)v70 + 17)];
  *((_DWORD *)v70 + 52) = 0;
  *((_DWORD *)v70 + 57) = 0;
  *((_DWORD *)v70 + 60) = 0;
  *((_DWORD *)v70 + 63) = 0;
  *((_DWORD *)v70 + 66) = 0;
  CFIndex v12 = [a4 count];
  uint64_t v13 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v12];
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDictionaryRef theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v12, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFAutorelease(theDict);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  obuint64_t j = a4;
  uint64_t v60 = [a4 countByEnumeratingWithState:&v71 objects:v77 count:16];
  if (v60)
  {
    uint64_t v57 = *(void *)v72;
    uint64_t v67 = *MEMORY[0x1E4F1F138];
    uint64_t v14 = *MEMORY[0x1E4F1F108];
    uint64_t v15 = *MEMORY[0x1E4F1F0F8];
    uint64_t v54 = *MEMORY[0x1E4F1F090];
    uint64_t v16 = *MEMORY[0x1E4F217B8];
    uint64_t v53 = *MEMORY[0x1E4F217F8];
    uint64_t v17 = *MEMORY[0x1E4F1F058];
    uint64_t v52 = *MEMORY[0x1E4F217F0];
    uint64_t v18 = *MEMORY[0x1E4F1F010];
    uint64_t v68 = *MEMORY[0x1E4F1F120];
    uint64_t v69 = *MEMORY[0x1E4F1F118];
    uint64_t v19 = *MEMORY[0x1E4F1CFC8];
    uint64_t v51 = *MEMORY[0x1E4F21800];
    uint64_t v49 = *MEMORY[0x1E4F21808];
    uint64_t v50 = *MEMORY[0x1E4F1EFD0];
    uint64_t v66 = *MEMORY[0x1E4F1F140];
    uint64_t v48 = *MEMORY[0x1E4F1F098];
    uint64_t v46 = *MEMORY[0x1E4F21818];
    uint64_t v47 = *MEMORY[0x1E4F21810];
    uint64_t v64 = *MEMORY[0x1E4F1F130];
    uint64_t v45 = *MEMORY[0x1E4F1F088];
    uint64_t v43 = *MEMORY[0x1E4F217E8];
    uint64_t v44 = *MEMORY[0x1E4F217E0];
    uint64_t v65 = *MEMORY[0x1E4F1F128];
    uint64_t v42 = *MEMORY[0x1E4F1F080];
    uint64_t v40 = *MEMORY[0x1E4F217D8];
    uint64_t v41 = *MEMORY[0x1E4F217D0];
    uint64_t v63 = *MEMORY[0x1E4F1F148];
    uint64_t v39 = *MEMORY[0x1E4F1F0A0];
    uint64_t v37 = *MEMORY[0x1E4F21888];
    uint64_t v38 = *MEMORY[0x1E4F21890];
    uint64_t v56 = *MEMORY[0x1E4F1F0F8];
    uint64_t v62 = *MEMORY[0x1E4F1F010];
    uint64_t v36 = v13;
    while (2)
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v72 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v61 = v20;
        long long v21 = *(void **)(*((void *)&v71 + 1) + 8 * v20);
        CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
        v22 = (void *)[MEMORY[0x1E4F1CA48] array];
        if ([v21 containsObject:v67])
        {
          v129[0] = v14;
          v129[1] = v15;
          v130[0] = v67;
          v130[1] = v54;
          v129[2] = v16;
          v126[0] = v14;
          v126[1] = v15;
          v127[0] = v53;
          v127[1] = v17;
          v128[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v127 forKeys:v126 count:2];
          v124[0] = v14;
          v124[1] = v15;
          v125[0] = v52;
          v125[1] = v62;
          v124[2] = v69;
          uint64_t v122 = v68;
          uint64_t v123 = v19;
          v125[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v123 forKeys:&v122 count:1];
          v128[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:v124 count:3];
          v120[0] = v14;
          v120[1] = v15;
          v121[0] = v51;
          v121[1] = v50;
          v120[2] = v69;
          uint64_t v118 = v68;
          uint64_t v119 = v19;
          v121[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
          v128[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v121 forKeys:v120 count:3];
          v116[0] = v14;
          v116[1] = v15;
          v117[0] = v49;
          v117[1] = v50;
          v116[2] = v69;
          uint64_t v13 = v36;
          uint64_t v114 = v68;
          uint64_t v115 = v19;
          v117[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
          v128[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v117 forKeys:v116 count:3];
          v130[2] = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:4];
          uint64_t v18 = v62;
          objc_msgSend(v22, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v130, v129, 3));
        }
        if ([v21 containsObject:v66])
        {
          v112[0] = v14;
          v112[1] = v15;
          v113[0] = v66;
          v113[1] = v48;
          v112[2] = v16;
          v109[0] = v14;
          v109[1] = v15;
          v110[0] = v47;
          v110[1] = v17;
          v111[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:2];
          v107[0] = v14;
          v107[1] = v15;
          v108[0] = v46;
          v108[1] = v18;
          v107[2] = v69;
          uint64_t v105 = v68;
          uint64_t v106 = v19;
          v108[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
          v111[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:3];
          v113[2] = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:2];
          objc_msgSend(v22, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v113, v112, 3));
        }
        if ([v21 containsObject:v64])
        {
          v103[0] = v14;
          v103[1] = v15;
          v104[0] = v64;
          v104[1] = v45;
          v103[2] = v16;
          v100[0] = v14;
          v100[1] = v15;
          v101[0] = v44;
          v101[1] = v17;
          v102[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:2];
          v98[0] = v14;
          v98[1] = v15;
          v99[0] = v43;
          v99[1] = v18;
          v98[2] = v69;
          uint64_t v96 = v68;
          uint64_t v97 = v19;
          v99[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
          v102[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:3];
          v104[2] = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:2];
          objc_msgSend(v22, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v104, v103, 3));
        }
        if ([v21 containsObject:v65])
        {
          v94[0] = v14;
          v94[1] = v15;
          v95[0] = v65;
          v95[1] = v42;
          v94[2] = v16;
          v91[0] = v14;
          v91[1] = v15;
          v92[0] = v41;
          v92[1] = v17;
          v93[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:2];
          v89[0] = v14;
          v89[1] = v15;
          v90[0] = v40;
          v90[1] = v18;
          v89[2] = v69;
          uint64_t v87 = v68;
          uint64_t v88 = v19;
          v90[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
          v93[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:3];
          v95[2] = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:2];
          objc_msgSend(v22, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v95, v94, 3));
        }
        if ([v21 containsObject:v63])
        {
          v85[0] = v14;
          v85[1] = v15;
          v86[0] = v63;
          v86[1] = v39;
          v85[2] = v16;
          v82[0] = v14;
          v82[1] = v15;
          v83[0] = v38;
          v83[1] = v17;
          v84[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
          v80[0] = v14;
          v80[1] = v15;
          v81[0] = v37;
          v81[1] = v18;
          v80[2] = v69;
          uint64_t v78 = v68;
          uint64_t v79 = v19;
          v81[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
          v84[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:3];
          v86[2] = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
          objc_msgSend(v22, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v86, v85, 3));
        }
        if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications(allocator, 0x6D656278u, (CFArrayRef)v22, &formatDescriptionOut))
        {
          goto LABEL_33;
        }
        uint64_t v23 = v14;
        uint64_t v24 = v16;
        CMMetadataFormatDescriptionRef v25 = formatDescriptionOut;
        CFAutorelease(formatDescriptionOut);
        v26 = [[BWNodeOutput alloc] initWithMediaType:1835365473 node:v70];
        [(BWNodeOutput *)v26 setFormat:+[BWMetadataFormat formatWithMetadataFormatDescription:v25]];
        [v70 addOutput:v26];
        v27 = v13;
        [v13 addObject:v26];
        v28 = objc_alloc_init(BWBoxedOutputDetectionTimingInfo);
        CFDictionaryAddValue(theDict, v26, v28);

        if ([v21 containsObject:v67])
        {
          if (-[BWFaceDetectionNode _populateLocalIDsForFacesWithFormatDescription:]((uint64_t)v70)) {
            goto LABEL_33;
          }
        }
        if ([v21 containsObject:v66]
          && -[BWFaceDetectionNode _populateLocalIDsForHumanBodiesWithFormatDescription:]((uint64_t)v70)
          || [v21 containsObject:v65]
          && -[BWFaceDetectionNode _populateLocalIDsForCatBodiesWithFormatDescription:]((uint64_t)v70)
          || [v21 containsObject:v64]
          && -[BWFaceDetectionNode _populateLocalIDsForDogBodiesWithFormatDescription:]((uint64_t)v70)
          || [v21 containsObject:v63]
          && -[BWFaceDetectionNode _populateLocalIDsForSalientObjectsWithFormatDescription:]((uint64_t)v70))
        {
LABEL_33:
          fig_log_get_emitter();
          FigDebugAssert3();

          return 0;
        }
        uint64_t v20 = v61 + 1;
        uint64_t v13 = v27;
        uint64_t v16 = v24;
        uint64_t v14 = v23;
        uint64_t v15 = v56;
        uint64_t v18 = v62;
      }
      while (v60 != v61 + 1);
      uint64_t v60 = [obj countByEnumeratingWithState:&v71 objects:v77 count:16];
      if (v60) {
        continue;
      }
      break;
    }
  }
  id v29 = (id)[v13 count];
  if (v29) {
    id v29 = v13;
  }
  *((void *)v70 + 18) = v29;
  *((void *)v70 + 35) = theDict;
  v30 = (void *)[MEMORY[0x1E4F1CA80] set];
  FigCaptureAddDetectedObjectTypesFromMetadataIdentifiersToSet(v35, v30);
  *((void *)v70 + 24) = v30;
  v70[188] = 0;
  v70[189] = 0;
  v70[190] = 0;
  *((_DWORD *)v70 + 104) = 0;
  uint64_t v31 = MEMORY[0x1E4F1F9F8];
  long long v32 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)(v70 + 344) = *MEMORY[0x1E4F1F9F8];
  uint64_t v33 = *(void *)(v31 + 16);
  *((void *)v70 + 45) = v33;
  *((_OWORD *)v70 + 23) = v32;
  *((void *)v70 + 48) = v33;
  *(_OWORD *)(v70 + 392) = v32;
  *((void *)v70 + 51) = v33;
  *((_DWORD *)v70 + 50) = -1;
  *((_DWORD *)v70 + 51) = -1;
  *((_DWORD *)v70 + 105) = 1667592803;
  *((_DWORD *)v70 + 106) = 1937008995;
  [v70 setSupportsLiveReconfiguration:0];
  return (BWFaceDetectionNode *)v70;
}

+ (void)initialize
{
}

- (uint64_t)_populateLocalIDsForFacesWithFormatDescription:(uint64_t)result
{
  if (result)
  {
    v1 = (_DWORD *)result;
    if (*(_DWORD *)(result + 208))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      unsigned int LocalIDForMetadataIdentifyingFactors = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
      if (LocalIDForMetadataIdentifyingFactors)
      {
        v1[52] = bswap32(LocalIDForMetadataIdentifyingFactors);
        v1[72] = v1[52];
        unsigned int v3 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
        if (v3)
        {
          v1[53] = bswap32(v3);
          v1[73] = v1[53];
          unsigned int v4 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
          if (v4)
          {
            v1[54] = bswap32(v4);
            v1[74] = v1[54];
            unsigned int v5 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
            if (v5)
            {
              v1[55] = bswap32(v5);
              v1[75] = v1[55];
              unsigned int v6 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
              if (v6)
              {
                unsigned int v7 = v6;
                result = 0;
                v1[56] = bswap32(v7);
                v1[76] = v1[56];
                return result;
              }
            }
          }
        }
      }
    }
    return 4294954516;
  }
  return result;
}

- (uint64_t)_populateLocalIDsForHumanBodiesWithFormatDescription:(uint64_t)result
{
  if (result)
  {
    v1 = (_DWORD *)result;
    if (*(_DWORD *)(result + 228))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      unsigned int LocalIDForMetadataIdentifyingFactors = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
      if (LocalIDForMetadataIdentifyingFactors)
      {
        v1[57] = bswap32(LocalIDForMetadataIdentifyingFactors);
        unsigned int v3 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
        if (v3)
        {
          v1[58] = bswap32(v3);
          unsigned int v4 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
          if (v4)
          {
            unsigned int v5 = v4;
            result = 0;
            v1[59] = bswap32(v5);
            return result;
          }
        }
      }
    }
    return 4294954516;
  }
  return result;
}

- (uint64_t)_populateLocalIDsForCatBodiesWithFormatDescription:(uint64_t)result
{
  if (result)
  {
    v1 = (_DWORD *)result;
    if (*(_DWORD *)(result + 240))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      unsigned int LocalIDForMetadataIdentifyingFactors = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
      if (LocalIDForMetadataIdentifyingFactors)
      {
        v1[60] = bswap32(LocalIDForMetadataIdentifyingFactors);
        unsigned int v3 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
        if (v3)
        {
          v1[61] = bswap32(v3);
          unsigned int v4 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
          if (v4)
          {
            unsigned int v5 = v4;
            result = 0;
            v1[62] = bswap32(v5);
            return result;
          }
        }
      }
    }
    return 4294954516;
  }
  return result;
}

- (uint64_t)_populateLocalIDsForDogBodiesWithFormatDescription:(uint64_t)result
{
  if (result)
  {
    v1 = (_DWORD *)result;
    if (*(_DWORD *)(result + 252))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      unsigned int LocalIDForMetadataIdentifyingFactors = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
      if (LocalIDForMetadataIdentifyingFactors)
      {
        v1[63] = bswap32(LocalIDForMetadataIdentifyingFactors);
        unsigned int v3 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
        if (v3)
        {
          v1[64] = bswap32(v3);
          unsigned int v4 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
          if (v4)
          {
            unsigned int v5 = v4;
            result = 0;
            v1[65] = bswap32(v5);
            return result;
          }
        }
      }
    }
    return 4294954516;
  }
  return result;
}

- (uint64_t)_populateLocalIDsForSalientObjectsWithFormatDescription:(uint64_t)result
{
  if (result)
  {
    v1 = (_DWORD *)result;
    if (*(_DWORD *)(result + 264))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      unsigned int LocalIDForMetadataIdentifyingFactors = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
      if (LocalIDForMetadataIdentifyingFactors)
      {
        v1[66] = bswap32(LocalIDForMetadataIdentifyingFactors);
        unsigned int v3 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
        if (v3)
        {
          v1[67] = bswap32(v3);
          unsigned int v4 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
          if (v4)
          {
            unsigned int v5 = v4;
            result = 0;
            v1[68] = bswap32(v5);
            return result;
          }
        }
      }
    }
    return 4294954516;
  }
  return result;
}

- (void)dealloc
{
  emptyMetadataSampleData = self->_emptyMetadataSampleData;
  if (emptyMetadataSampleData) {
    CFRelease(emptyMetadataSampleData);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWFaceDetectionNode;
  [(BWFanOutNode *)&v4 dealloc];
}

- (CGRect)rectOfInterest
{
  double x = self->_rectOfInterest.origin.x;
  double y = self->_rectOfInterest.origin.y;
  double width = self->_rectOfInterest.size.width;
  double height = self->_rectOfInterest.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)boxedMetadataOutputEnabled
{
  return self->_boxedMetadataOutputEnabled;
}

- (void)setEmitsEmptyObjectDetectionMetadata:(BOOL)a3
{
  if (self->_emitsEmptyObjectDetectionMetadata != a3) {
    self->_emitsEmptyObjectDetectionMetadata = a3;
  }
}

- (BOOL)emitsEmptyObjectDetectionMetadata
{
  return self->_emitsEmptyObjectDetectionMetadata;
}

- (id)nodeSubType
{
  return @"FaceDetection";
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_metadataObjectOutputEnabled) {
    [(BWNodeOutput *)self->_metadataObjectOutput markEndOfLiveOutput];
  }
  if (self->_boxedMetadataOutputEnabled)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    boxedMetadataOutputs = self->_boxedMetadataOutputs;
    uint64_t v5 = [(NSArray *)boxedMetadataOutputs countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(boxedMetadataOutputs);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) markEndOfLiveOutput];
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)boxedMetadataOutputs countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_renderSampleBufferForBoxedMetadataOutput:(void *)a3 withFaceArray:
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  objc_super v4 = *(void **)(a1 + 144);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v91 objects:v98 count:16];
  if (!v5) {
    return;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v92;
  uint64_t v8 = *MEMORY[0x1E4F1F138];
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v92 != v7) {
        objc_enumerationMutation(v4);
      }
      long long v10 = *(void **)(*((void *)&v91 + 1) + 8 * i);
      if (-[__CFArray containsObject:](CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)objc_msgSend((id)objc_msgSend(v10, "format"), "formatDescription")), "containsObject:", v8))
      {
        uint64_t v66 = v10;
        if (!v10) {
          return;
        }
        long long v11 = (const opaqueCMFormatDescription *)objc_msgSend((id)objc_msgSend(v10, "format"), "formatDescription");
        uint64_t v12 = [a3 count];
        int v13 = v12;
        uint64_t v14 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
        if (!v12 && !*(_DWORD *)(a1 + 416) && ((*(unsigned char *)(a1 + 332) & 1) == 0 || (*(unsigned char *)(a1 + 404) & 1) != 0)) {
          return;
        }
        CFTypeRef cf = 0;
        CMBlockBufferRef theBuffer = 0;
        CGFloat x = *MEMORY[0x1E4F1F9F8];
        CMTimeScale y_low = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
        double v65 = *(double *)(MEMORY[0x1E4F1F9F8] + 16);
        if (v12 < 1)
        {
          EmptyMetadataSample = (const void *)-[BWFaceDetectionNode _getEmptyMetadataSampleData](a1);
          if (!EmptyMetadataSample)
          {
            uint64_t v16 = 0;
            CMBlockBufferRef theBuffer = 0;
            goto LABEL_65;
          }
          uint64_t v50 = (OpaqueCMBlockBuffer *)CFRetain(EmptyMetadataSample);
          CMBlockBufferRef theBuffer = v50;
          if (!v50) {
            goto LABEL_76;
          }
          uint64_t v51 = v50;
          if (*(unsigned char *)(a1 + 380))
          {
            CMTime time2 = *(CMTime *)(a1 + 344);
            CMTime rhs = *(CMTime *)(a1 + 368);
            CMTimeAdd((CMTime *)&time1, &time2, &rhs);
            CGFloat x = time1.origin.x;
            CMTimeFlags y_high = HIDWORD(time1.origin.y);
            CMTimeScale y_low = LODWORD(time1.origin.y);
            CGFloat width = time1.size.width;
          }
          else if ((*(_DWORD *)(a1 + 332) & 1) == 0 {
                 || (CMTimeFlags v52 = *(_DWORD *)(a1 + 332), (*(unsigned char *)(a1 + 356) & 1) != 0)
          }
                 || (*(unsigned char *)(a1 + 404) & 1) != 0)
          {
            memset(&time1, 0, 24);
            CMTimeMake((CMTime *)&time1, *(_DWORD *)(a1 + 352) / 240, *(_DWORD *)(a1 + 352));
            if (!*(void *)&time1.origin.x) {
              *(void *)&time1.origin.CGFloat x = 1;
            }
            CMTime rhs = *(CMTime *)(a1 + 344);
            *(CGPoint *)&v79.value = time1.origin;
            v79.CMTimeEpoch epoch = *(void *)&time1.size.width;
            CMTimeAdd(&time2, &rhs, &v79);
            CGFloat x = *(double *)&time2.value;
            CMTimeFlags y_high = time2.flags;
            CMTimeScale y_low = time2.timescale;
            CGFloat width = *(double *)&time2.epoch;
          }
          else
          {
            CGFloat x = *(double *)(a1 + 320);
            CMTimeScale y_low = *(_DWORD *)(a1 + 328);
            CGFloat width = *(double *)(a1 + 336);
            CMTimeFlags y_high = v52;
          }
          *(double *)(a1 + 360) = v65;
          long long v58 = *MEMORY[0x1E4F1F9F8];
          *(_OWORD *)(a1 + 344) = *MEMORY[0x1E4F1F9F8];
          *(double *)(a1 + 384) = v65;
          *(_OWORD *)(a1 + 368) = v58;
          *(CGFloat *)(a1 + 392) = x;
          *(_DWORD *)(a1 + 400) = y_low;
          *(_DWORD *)(a1 + 404) = y_high;
          *(CGFloat *)(a1 + 408) = width;
          CFAllocatorRef v56 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          CMTimeEpoch v57 = *(void *)&width;
          goto LABEL_63;
        }
        uint64_t v62 = v11;
        int v63 = v12;
        uint64_t v15 = *(unsigned int *)(MEMORY[0x1E4F1F9F8] + 12);
        uint64_t blockLength = 100 * v12;
        uint64_t v16 = (char *)malloc_type_malloc(100 * v12, 0xBDFA0213uLL);
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        uint64_t v17 = [a3 countByEnumeratingWithState:&v85 objects:v95 count:16];
        if (v17)
        {
          unint64_t v18 = v17;
          memoryBlock = v16;
          size_t v19 = 0;
          uint64_t v20 = 0;
          uint64_t v68 = *MEMORY[0x1E4F54348];
          uint64_t v72 = *MEMORY[0x1E4F53E70];
          uint64_t v71 = *MEMORY[0x1E4F54180];
          uint64_t v70 = *MEMORY[0x1E4F53CB0];
          uint64_t v69 = *MEMORY[0x1E4F53CB8];
          uint64_t v73 = *(void *)v86;
          uint64_t v21 = *(void *)v86;
          CGFloat v22 = v65;
          uint64_t v23 = v15;
          while (1)
          {
            if (v21 != v73) {
              objc_enumerationMutation(a3);
            }
            uint64_t v24 = *(void **)(*((void *)&v85 + 1) + 8 * v20);
            if ((v23 & 1) == 0)
            {
              CMMetadataFormatDescriptionRef v25 = (void *)[*(id *)(*((void *)&v85 + 1) + 8 * v20) objectForKeyedSubscript:v68];
              if (v25)
              {
                [v25 longLongValue];
                int64_t v26 = FigHostTimeToNanoseconds();
                CMTimeMake(&time, v26, 1000000000);
                CMSampleBufferGetPresentationTimeStamp(&v83, a2);
                CMTimeConvertScale((CMTime *)&time1, &time, v83.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                CGFloat x = time1.origin.x;
                uint64_t v23 = HIDWORD(time1.origin.y);
                CMTimeScale y_low = LODWORD(time1.origin.y);
                CGFloat v22 = time1.size.width;
              }
            }
            v27 = &memoryBlock[v19];
            v28 = (void *)[v24 objectForKeyedSubscript:v72];
            if (v28)
            {
              *((_DWORD *)v27 + 6) = 201326592;
              *((_DWORD *)v27 + 7) = *(_DWORD *)(a1 + 292);
              *((_DWORD *)v27 + 8) = bswap32([v28 unsignedIntValue]);
              uint64_t v29 = 36;
            }
            else
            {
              uint64_t v29 = 24;
            }
            CFDictionaryRef v30 = (const __CFDictionary *)[v24 objectForKeyedSubscript:v71];
            if (v30)
            {
              uint64_t v31 = &v27[v29];
              *(_DWORD *)uint64_t v31 = 671088640;
              *((_DWORD *)v31 + 1) = *(_DWORD *)(a1 + 296);
              memset(&time1, 0, sizeof(time1));
              if (!CGRectMakeWithDictionaryRepresentation(v30, &time1))
              {
                fig_log_get_emitter();
                FigDebugAssert3();
                uint64_t v16 = memoryBlock;
                goto LABEL_65;
              }
              double v32 = time1.origin.x;
              *(float *)&unsigned int v33 = time1.origin.x;
              unsigned int v34 = bswap32(v33);
              id v35 = &v27[v29];
              *((_DWORD *)v35 + 2) = v34;
              v36.f64[0] = time1.origin.y;
              v36.f64[1] = v32 + time1.size.width;
              *(int8x8_t *)&long long v37 = vrev32_s8((int8x8_t)vcvt_f32_f64(v36));
              *((void *)&v37 + 1) = v37;
              *(_OWORD *)(v35 + 12) = v37;
              *(float *)&long long v37 = v36.f64[0] + time1.size.height;
              unsigned int v38 = bswap32(v37);
              *((_DWORD *)v35 + 7) = v38;
              *((_DWORD *)v35 + 8) = v34;
              *((_DWORD *)v35 + 9) = v38;
              v29 += 40;
            }
            uint64_t v39 = (void *)[v24 objectForKeyedSubscript:v70];
            if (v39)
            {
              size_t v40 = v19;
              double v41 = v22;
              uint64_t v42 = v23;
              uint64_t v43 = &v27[v29];
              *(_DWORD *)uint64_t v43 = 201326592;
              *((_DWORD *)v43 + 1) = *(_DWORD *)(a1 + 300);
              [v39 floatValue];
              *((_DWORD *)v43 + 2) = bswap32(v44);
              uint64_t v23 = v42;
              CGFloat v22 = v41;
              size_t v19 = v40;
              v29 += 12;
            }
            uint64_t v45 = (void *)[v24 objectForKeyedSubscript:v69];
            if (v45)
            {
              uint64_t v46 = &v27[v29];
              *(_DWORD *)uint64_t v46 = 201326592;
              *((_DWORD *)v46 + 1) = *(_DWORD *)(a1 + 304);
              [v45 floatValue];
              *((_DWORD *)v46 + 2) = bswap32(v47);
              v29 += 12;
            }
            *(_DWORD *)v27 = bswap32(v29);
            v19 += v29;
            *((_DWORD *)v27 + 1) = *(_DWORD *)(a1 + 288);
            *((_DWORD *)v27 + 2) = bswap32(v29 - 8);
            *((_DWORD *)v27 + 3) = 1667592803;
            *((_DWORD *)v27 + 4) = bswap32(v29 - 16);
            *((_DWORD *)v27 + 5) = 1937008995;
            if (++v20 >= v18)
            {
              uint64_t v48 = [a3 countByEnumeratingWithState:&v85 objects:v95 count:16];
              if (!v48)
              {
                CGFloat obja = v22;
                uint64_t v16 = memoryBlock;
                goto LABEL_45;
              }
              unint64_t v18 = v48;
              uint64_t v20 = 0;
            }
            uint64_t v21 = *(void *)v86;
          }
        }
        size_t v19 = 0;
        CGFloat obja = v65;
        LODWORD(v23) = v15;
LABEL_45:
        CMTimeFlags v55 = v23;
        CFAllocatorRef v56 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v16, blockLength, (CFAllocatorRef)*MEMORY[0x1E4F1CF90], 0, 0, v19, 0, &theBuffer))
        {
          fig_log_get_emitter();
          FigDebugAssert3();
LABEL_65:
          free(v16);
          if (theBuffer) {
            CFRelease(theBuffer);
          }
          if (cf) {
            CFRelease(cf);
          }
          return;
        }
        long long v11 = v62;
        int v13 = v63;
        uint64_t v14 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
        if (v55)
        {
          if (*(unsigned char *)(a1 + 356))
          {
            time1.origin.CGFloat x = x;
            *(void *)&time1.origin.double y = __PAIR64__(v55, y_low);
            CMTimeFlags y_high = v55;
            CMTimeEpoch v57 = *(void *)&obja;
            time1.size.CGFloat width = obja;
            CMTime time2 = *(CMTime *)(a1 + 344);
            if (CMTimeCompare((CMTime *)&time1, &time2) > 0)
            {
              *(CGFloat *)&time2.value = x;
              time2.timescale = y_low;
              time2.flags = v55;
              *(CGFloat *)&time2.CMTimeEpoch epoch = obja;
              CMTime rhs = *(CMTime *)(a1 + 344);
              CMTimeSubtract((CMTime *)&time1, &time2, &rhs);
              *(CGPoint *)(a1 + 368) = time1.origin;
              *(CGFloat *)(a1 + 384) = time1.size.width;
              goto LABEL_53;
            }
          }
          else
          {
            CMTimeFlags y_high = v55;
            CMTimeEpoch v57 = *(void *)&obja;
            if ((*(unsigned char *)(a1 + 404) & 1) == 0)
            {
LABEL_53:
              *(CGFloat *)(a1 + 344) = x;
              *(_DWORD *)(a1 + 352) = y_low;
              *(_DWORD *)(a1 + 356) = y_high;
              *(void *)(a1 + 360) = v57;
              uint64_t v51 = theBuffer;
LABEL_63:
              long long v59 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
              *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
              *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v59;
              CMTimeEpoch v60 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
              long long v61 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
              *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1FA70];
              sampleTimingArray.duration.CMTimeEpoch epoch = v61;
              *(CGFloat *)&sampleTimingArray.presentationTimeStamp.value = x;
              sampleTimingArray.presentationTimeStamp.timescale = y_low;
              sampleTimingArray.presentationTimeStamp.flags = y_high;
              sampleTimingArray.decodeTimeStamp.CMTimeEpoch epoch = v60;
              sampleTimingArray.presentationTimeStamp.CMTimeEpoch epoch = v57;
              sampleSizeArradouble y = CMBlockBufferGetDataLength(v51);
              if (!CMSampleBufferCreate(v56, theBuffer, 1u, 0, 0, v11, 1, 1, &sampleTimingArray, 1, &sampleSizeArray, (CMSampleBufferRef *)&cf))
              {
                [v66 emitSampleBuffer:cf];
                uint64_t v16 = 0;
                *(_DWORD *)(a1 + v14[268]) = v13;
                goto LABEL_65;
              }
              fig_log_get_emitter();
              goto LABEL_75;
            }
            time1.origin.CGFloat x = x;
            *(void *)&time1.origin.double y = __PAIR64__(v55, y_low);
            time1.size.CGFloat width = obja;
            CMTime time2 = *(CMTime *)(a1 + 392);
            if (CMTimeCompare((CMTime *)&time1, &time2) > 0)
            {
              *(_OWORD *)(a1 + 392) = *MEMORY[0x1E4F1F9F8];
              *(double *)(a1 + 408) = v65;
              CMTimeFlags y_high = v55;
              CMTimeEpoch v57 = *(void *)&obja;
              goto LABEL_53;
            }
          }
          fig_log_get_emitter();
        }
        else
        {
          fig_log_get_emitter();
        }
LABEL_75:
        FigDebugAssert3();
LABEL_76:
        uint64_t v16 = 0;
        goto LABEL_65;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v91 objects:v98 count:16];
    if (v6) {
      continue;
    }
    break;
  }
}

- (uint64_t)_renderSampleBufferForBoxedMetadataOutput:(void *)a3 withDetectedObjectsInfo:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = result;
  if (result)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = *(id *)(result + 144);
    CGRect result = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    uint64_t v24 = result;
    if (result)
    {
      uint64_t v21 = *(void *)v39;
      uint64_t v4 = *MEMORY[0x1E4F538C8];
      uint64_t v32 = *MEMORY[0x1E4F538A0];
      uint64_t v33 = *MEMORY[0x1E4F538C0];
      uint64_t v30 = *MEMORY[0x1E4F538B0];
      uint64_t v28 = *MEMORY[0x1E4F538E8];
      uint64_t v27 = *MEMORY[0x1E4F1F148];
      uint64_t v29 = *MEMORY[0x1E4F1F130];
      uint64_t v31 = *MEMORY[0x1E4F1F128];
      uint64_t v5 = *MEMORY[0x1E4F1F140];
      uint64_t v6 = *MEMORY[0x1E4F1F138];
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(obj);
          }
          CMMetadataFormatDescriptionRef v25 = *(void **)(*((void *)&v38 + 1) + 8 * v7);
          uint64_t v26 = v7;
          CFArrayRef Identifiers = CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)objc_msgSend((id)objc_msgSend(v25, "format"), "formatDescription"));
          long long v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v10 = [a3 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v35;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v35 != v12) {
                  objc_enumerationMutation(a3);
                }
                uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                char v15 = [v14 isEqualToString:v4];
                uint64_t v16 = v6;
                if ((v15 & 1) == 0)
                {
                  char v17 = [v14 isEqualToString:v33];
                  uint64_t v16 = v5;
                  if ((v17 & 1) == 0)
                  {
                    char v18 = [v14 isEqualToString:v32];
                    uint64_t v16 = v31;
                    if ((v18 & 1) == 0)
                    {
                      char v19 = [v14 isEqualToString:v30];
                      uint64_t v16 = v29;
                      if ((v19 & 1) == 0)
                      {
                        if ([v14 isEqualToString:v28]) {
                          uint64_t v16 = v27;
                        }
                        else {
                          uint64_t v16 = 0;
                        }
                      }
                    }
                  }
                }
                if ([(__CFArray *)Identifiers containsObject:v16]) {
                  objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", v14), v14);
                }
              }
              uint64_t v11 = [a3 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v11);
          }
          -[BWFaceDetectionNode _renderSampleBuffer:forBoxedMetadataOutput:withDetectedObjectsInfo:](v23, a2, v25, v9);
          uint64_t v7 = v26 + 1;
        }
        while (v26 + 1 != v24);
        CGRect result = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
        uint64_t v24 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)_renderSampleBuffer:(void *)a3 forBoxedMetadataOutput:(void *)a4 withDetectedObjectsInfo:
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  formatDescription = (const opaqueCMFormatDescription *)objc_msgSend((id)objc_msgSend(a3, "format"), "formatDescription");
  uint64_t v67 = a1;
  uint64_t v57 = [*(id *)(a1 + 280) objectForKeyedSubscript:a3];
  CMBlockBufferRef theBuffer = 0;
  CFTypeRef cf = 0;
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v92 objects:v100 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unsigned int v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = *(void *)v93;
    uint64_t v11 = *MEMORY[0x1E4F538C8];
    uint64_t v12 = *MEMORY[0x1E4F538F8];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v93 != v10) {
          objc_enumerationMutation(a4);
        }
        uint64_t v14 = *(void **)(*((void *)&v92 + 1) + 8 * i);
        int v15 = [v14 isEqualToString:v11];
        unsigned int v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", v14), "objectForKeyedSubscript:", v12), "count");
        if (v15) {
          unsigned int v17 = 0;
        }
        else {
          unsigned int v17 = v16;
        }
        v8 += v17;
        if (v15) {
          unsigned int v9 = v16;
        }
      }
      uint64_t v7 = [a4 countByEnumeratingWithState:&v92 objects:v100 count:16];
    }
    while (v7);
  }
  else
  {
    unsigned int v8 = 0;
    unsigned int v9 = 0;
  }
  char v18 = (long long *)MEMORY[0x1E4F1F9F8];
  CMTimeEpoch v19 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  if (v9 + v8)
  {
    uint64_t blockLength = 76 * v8 + 100 * v9;
    uint64_t v54 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    CMMetadataFormatDescriptionRef v25 = (char *)malloc_type_malloc(blockLength, 0xA1F3DE59uLL);
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    uint64_t v62 = [a4 countByEnumeratingWithState:&v88 objects:v99 count:16];
    if (v62)
    {
      int v26 = 0;
      size_t v27 = 0;
      CMTimeFlags flags = *((_DWORD *)v18 + 3);
      uint64_t v65 = *(void *)v89;
      uint64_t v63 = *MEMORY[0x1E4F538C8];
      uint64_t v64 = *MEMORY[0x1E4F54348];
      uint64_t v58 = *MEMORY[0x1E4F538F8];
      CMTimeEpoch epoch = v19;
      while (2)
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v89 != v65) {
            objc_enumerationMutation(a4);
          }
          uint64_t v29 = *(void **)(*((void *)&v88 + 1) + 8 * v28);
          uint64_t v30 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", v29), "objectForKeyedSubscript:", v64);
          if (v30)
          {
            [v30 longLongValue];
            int64_t v31 = FigHostTimeToNanoseconds();
            CMTimeMake(&time, v31, 1000000000);
            CMSampleBufferGetPresentationTimeStamp(&v85, a2);
            CMTimeConvertScale(&time1, &time, v85.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
            CMTimeValue value = time1.value;
            CMTimeFlags flags = time1.flags;
            CMTimeScale timescale = time1.timescale;
            CMTimeEpoch epoch = time1.epoch;
          }
          uint64_t v66 = v28;
          int v32 = [v29 isEqualToString:v63];
          uint64_t v33 = (_DWORD *)-[BWFaceDetectionNode localIDsForKey:](v67, v29);
          if (*v33)
          {
            long long v34 = v33;
            long long v35 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", v29), "objectForKeyedSubscript:", v58);
            long long v81 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            uint64_t v36 = [v35 countByEnumeratingWithState:&v81 objects:v98 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v82;
LABEL_37:
              uint64_t v39 = 0;
              v26 += v37;
              while (1)
              {
                if (*(void *)v82 != v38) {
                  objc_enumerationMutation(v35);
                }
                uint64_t v40 = -[BWFaceDetectionNode append:toBoxedData:localIDs:isFace:](v67, *(void **)(*((void *)&v81 + 1) + 8 * v39), &v25[v27], v34, v32);
                if (!v40) {
                  goto LABEL_53;
                }
                v27 += v40;
                if (v37 == ++v39)
                {
                  uint64_t v37 = [v35 countByEnumeratingWithState:&v81 objects:v98 count:16];
                  if (v37) {
                    goto LABEL_37;
                  }
                  break;
                }
              }
            }
          }
          uint64_t v28 = v66 + 1;
        }
        while (v66 + 1 != v62);
        uint64_t v62 = [a4 countByEnumeratingWithState:&v88 objects:v99 count:16];
        if (v62) {
          continue;
        }
        break;
      }
      long long v41 = (_OWORD *)MEMORY[0x1E4F1F9F8];
      if (v27)
      {
        if (!CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v25, blockLength, (CFAllocatorRef)*MEMORY[0x1E4F1CF90], 0, 0, v27, 0, &theBuffer))
        {
          uint64_t v20 = v57;
          CMTimeFlags v23 = flags;
          if (flags)
          {
            CMTimeEpoch v24 = epoch;
            if (!v57) {
              goto LABEL_68;
            }
            if (*(unsigned char *)(v57 + 20))
            {
              long long v51 = *(_OWORD *)(v57 + 8);
              v80.CMTimeEpoch epoch = *(void *)(v57 + 24);
              *(_OWORD *)&v80.CMTimeValue value = v51;
              time1.CMTimeValue value = value;
              time1.CMTimeScale timescale = timescale;
              time1.CMTimeFlags flags = flags;
              time1.CMTimeEpoch epoch = epoch;
              if (CMTimeCompare(&time1, &v80) > 0)
              {
                long long v52 = *(_OWORD *)(v57 + 8);
                v78.CMTimeEpoch epoch = *(void *)(v57 + 24);
                *(_OWORD *)&v78.CMTimeValue value = v52;
                time1.CMTimeValue value = value;
                time1.CMTimeScale timescale = timescale;
                time1.CMTimeFlags flags = flags;
                time1.CMTimeEpoch epoch = epoch;
                CMTimeSubtract(&v79, &time1, &v78);
                *(CMTime *)(v57 + 32) = v79;
                goto LABEL_78;
              }
            }
            else
            {
              if ((*(unsigned char *)(v57 + 68) & 1) == 0)
              {
LABEL_78:
                *(void *)(v57 + 8) = value;
                *(_DWORD *)(v57 + 16) = timescale;
                *(_DWORD *)(v57 + 20) = flags;
                uint64_t v47 = 24;
                goto LABEL_67;
              }
              CMTime time2 = *(CMTime *)(v57 + 56);
              time1.CMTimeValue value = value;
              time1.CMTimeScale timescale = timescale;
              time1.CMTimeFlags flags = flags;
              time1.CMTimeEpoch epoch = epoch;
              if (CMTimeCompare(&time1, &time2) > 0)
              {
                *(_OWORD *)(v57 + 56) = *v41;
                *(void *)(v57 + 72) = v54;
                goto LABEL_78;
              }
            }
          }
          fig_log_get_emitter();
          goto LABEL_80;
        }
      }
    }
LABEL_53:
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    uint64_t v20 = v57;
    if (v57)
    {
      if (!*(_DWORD *)(v57 + 80) && ((*(unsigned char *)(v67 + 332) & 1) == 0 || (*(unsigned char *)(v57 + 68) & 1) != 0)) {
        return;
      }
    }
    else if ((*(unsigned char *)(v67 + 332) & 1) == 0)
    {
      return;
    }
    EmptyMetadataSample = (const void *)-[BWFaceDetectionNode _getEmptyMetadataSampleData](v67);
    if (EmptyMetadataSample)
    {
      CMBlockBufferRef theBuffer = (CMBlockBufferRef)CFRetain(EmptyMetadataSample);
      if (!theBuffer) {
        goto LABEL_81;
      }
      if (v57)
      {
        if (*(unsigned char *)(v57 + 44))
        {
          long long v42 = *(_OWORD *)(v57 + 8);
          lhs.CMTimeEpoch epoch = *(void *)(v57 + 24);
          *(_OWORD *)&lhs.CMTimeValue value = v42;
          CMTime rhs = *(CMTime *)(v57 + 32);
          CMTimeAdd(&time1, &lhs, &rhs);
          CMTimeValue value = time1.value;
          CMTimeFlags v23 = time1.flags;
          CMTimeScale timescale = time1.timescale;
          CMTimeEpoch v24 = time1.epoch;
          long long v70 = *v18;
          CMTimeEpoch v71 = v19;
          goto LABEL_66;
        }
        uint64_t v22 = v67 + 320;
        if ((*(unsigned char *)(v67 + 332) & 1) != 0 && (*(unsigned char *)(v57 + 20) & 1) == 0 && (*(unsigned char *)(v57 + 68) & 1) == 0) {
          goto LABEL_26;
        }
        memset(&time1, 0, sizeof(time1));
        int32_t v43 = *(_DWORD *)(v57 + 16);
        int64_t v44 = v43 / 240;
      }
      else
      {
        uint64_t v22 = v67 + 320;
        if (*(unsigned char *)(v67 + 332))
        {
LABEL_26:
          CMTimeValue value = *(void *)v22;
          CMTimeFlags v23 = *(_DWORD *)(v22 + 12);
          CMTimeScale timescale = *(_DWORD *)(v22 + 8);
          CMTimeEpoch v24 = *(void *)(v22 + 16);
          goto LABEL_65;
        }
        int64_t v44 = 0;
        int32_t v43 = 0;
        memset(&time1, 0, sizeof(time1));
      }
      CMTimeMake(&time1, v44, v43);
      if (!time1.value) {
        time1.CMTimeValue value = 1;
      }
      if (v57)
      {
        long long v45 = *(_OWORD *)(v57 + 8);
        v73.CMTimeEpoch epoch = *(void *)(v57 + 24);
        *(_OWORD *)&v73.CMTimeValue value = v45;
      }
      else
      {
        memset(&v73, 0, sizeof(v73));
      }
      CMTime v72 = time1;
      CMTimeAdd(&v74, &v73, &v72);
      CMTimeValue value = v74.value;
      CMTimeFlags v23 = v74.flags;
      CMTimeScale timescale = v74.timescale;
      CMTimeEpoch v24 = v74.epoch;
LABEL_65:
      long long v70 = *v18;
      CMTimeEpoch v71 = v19;
      if (!v57)
      {
        int v26 = 0;
LABEL_68:
        long long v48 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
        *(_OWORD *)&sampleTimingArray.presentationTimeStamp.CMTimeScale timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
        *(_OWORD *)&sampleTimingArray.decodeTimeStamp.CMTimeValue value = v48;
        CMTimeEpoch v49 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
        long long v50 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
        *(_OWORD *)&sampleTimingArray.duration.CMTimeValue value = *MEMORY[0x1E4F1FA70];
        sampleTimingArray.duration.CMTimeEpoch epoch = v50;
        sampleTimingArray.presentationTimeStamp.CMTimeValue value = value;
        sampleTimingArray.presentationTimeStamp.CMTimeScale timescale = timescale;
        sampleTimingArray.presentationTimeStamp.CMTimeFlags flags = v23;
        sampleTimingArray.decodeTimeStamp.CMTimeEpoch epoch = v49;
        sampleTimingArray.presentationTimeStamp.CMTimeEpoch epoch = v24;
        sampleSizeArradouble y = CMBlockBufferGetDataLength(theBuffer);
        if (!CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], theBuffer, 1u, 0, 0, formatDescription, 1, 1, &sampleTimingArray, 1, &sampleSizeArray, (CMSampleBufferRef *)&cf))
        {
          [a3 emitSampleBuffer:cf];
          if (v20)
          {
            CMMetadataFormatDescriptionRef v25 = 0;
            *(_DWORD *)(v20 + 80) = v26;
            goto LABEL_71;
          }
LABEL_81:
          CMMetadataFormatDescriptionRef v25 = 0;
          goto LABEL_71;
        }
        fig_log_get_emitter();
LABEL_80:
        FigDebugAssert3();
        goto LABEL_81;
      }
LABEL_66:
      int v26 = 0;
      *(_OWORD *)(v57 + 8) = v70;
      *(void *)(v57 + 24) = v71;
      *(_OWORD *)(v57 + 32) = *v18;
      CMTimeValue v46 = value;
      *(void *)(v57 + 48) = v19;
      *(void *)(v57 + 56) = v46;
      uint64_t v47 = 72;
      *(_DWORD *)(v57 + 64) = timescale;
      *(_DWORD *)(v57 + 68) = v23;
LABEL_67:
      *(void *)(v20 + v47) = v24;
      goto LABEL_68;
    }
    CMMetadataFormatDescriptionRef v25 = 0;
    CMBlockBufferRef theBuffer = 0;
  }
LABEL_71:
  free(v25);
  if (theBuffer) {
    CFRelease(theBuffer);
  }
  if (cf) {
    CFRelease(cf);
  }
}

- (uint64_t)localIDsForKey:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if ([a2 isEqualToString:*MEMORY[0x1E4F538C8]])
    {
      uint64_t v4 = &OBJC_IVAR___BWFaceDetectionNode__localIDsForFaces_BE;
    }
    else if ([a2 isEqualToString:*MEMORY[0x1E4F538C0]])
    {
      uint64_t v4 = &OBJC_IVAR___BWFaceDetectionNode__localIDsForDetectedHumanBodies_BE;
    }
    else if ([a2 isEqualToString:*MEMORY[0x1E4F538B0]])
    {
      uint64_t v4 = &OBJC_IVAR___BWFaceDetectionNode__localIDsForDetectedDogBodies_BE;
    }
    else if ([a2 isEqualToString:*MEMORY[0x1E4F538A0]])
    {
      uint64_t v4 = &OBJC_IVAR___BWFaceDetectionNode__localIDsForDetectedCatBodies_BE;
    }
    else
    {
      if (![a2 isEqualToString:*MEMORY[0x1E4F538E8]]) {
        return 0;
      }
      uint64_t v4 = &OBJC_IVAR___BWFaceDetectionNode__localIDsForDetectedSalientObjects_BE;
    }
    return v3 + *v4;
  }
  return result;
}

- (uint64_t)append:(_DWORD *)a3 toBoxedData:(_DWORD *)a4 localIDs:(int)a5 isFace:
{
  if (!a1) {
    return 0;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F53E70];
  if (!a5) {
    uint64_t v10 = (void *)MEMORY[0x1E4F53888];
  }
  uint64_t v11 = (void *)[a2 objectForKeyedSubscript:*v10];
  if (v11)
  {
    int v12 = a4[1];
    a3[6] = 201326592;
    a3[7] = v12;
    a3[8] = bswap32([v11 unsignedIntValue]);
    uint64_t v13 = 9;
  }
  else
  {
    uint64_t v13 = 6;
  }
  CFDictionaryRef v14 = (const __CFDictionary *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F54180]];
  if (!v14) {
    goto LABEL_10;
  }
  int v15 = a4[2];
  unsigned int v16 = &a3[v13];
  *unsigned int v16 = 671088640;
  v16[1] = v15;
  memset(&rect, 0, sizeof(rect));
  if (!CGRectMakeWithDictionaryRepresentation(v14, &rect))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v17.f64[0] = rect.origin.y;
  *(float *)&unsigned int v18 = rect.origin.x;
  double height = rect.size.height;
  CGFloat v20 = rect.origin.x + rect.size.width;
  unsigned int v21 = bswap32(v18);
  uint64_t v22 = &a3[v13];
  v22[2] = v21;
  v17.f64[1] = v20;
  *(int8x8_t *)&long long v23 = vrev32_s8((int8x8_t)vcvt_f32_f64(v17));
  *((void *)&v23 + 1) = v23;
  *(_OWORD *)(v22 + 3) = v23;
  *(float *)&long long v23 = v17.f64[0] + height;
  unsigned int v24 = bswap32(v23);
  v22[7] = v24;
  v22[8] = v21;
  v22[9] = v24;
  v13 += 10;
LABEL_10:
  if (a5)
  {
    CMMetadataFormatDescriptionRef v25 = (void *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F53CB0]];
    if (v25)
    {
      int v26 = a4[3];
      size_t v27 = &a3[v13];
      _DWORD *v27 = 201326592;
      v27[1] = v26;
      [v25 floatValue];
      v27[2] = bswap32(v28);
      v13 += 3;
    }
    uint64_t v29 = (void *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F53CB8]];
    if (v29)
    {
      int v30 = a4[4];
      int64_t v31 = &a3[v13];
      *int64_t v31 = 201326592;
      v31[1] = v30;
      [v29 floatValue];
      v31[2] = bswap32(v32);
      v13 += 3;
    }
  }
  *a3 = bswap32(v13 * 4);
  a3[1] = *a4;
  a3[2] = bswap32(v13 * 4 - 8);
  a3[3] = *(_DWORD *)(a1 + 420);
  a3[4] = bswap32(v13 * 4 - 16);
  a3[5] = *(_DWORD *)(a1 + 424);
  return v13 * 4;
}

- (uint64_t)_getEmptyMetadataSampleData
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 312))
    {
      if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 8uLL, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 8uLL, 1u, (CMBlockBufferRef *)(result + 312)))
      {
        fig_log_get_emitter();
      }
      else
      {
        dataPointerOut = 0;
        if (!CMBlockBufferGetDataPointer(*(CMBlockBufferRef *)(v1 + 312), 0, 0, 0, &dataPointerOut))
        {
          *(void *)dataPointerOut = 0x8000000;
          return *(void *)(v1 + 312);
        }
        fig_log_get_emitter();
      }
      FigDebugAssert3();
    }
    return *(void *)(v1 + 312);
  }
  return result;
}

- (NSArray)boxedMetadataOutputs
{
  return self->_boxedMetadataOutputs;
}

@end