@interface VNTracker
+ (id)supportedComputeDevicesForOptions:(id)a3 error:(id *)a4;
+ (int64_t)VNTrackerOptionToTrackerType:(id)a3;
- (BOOL)_updateTrackerWithModifiedBBoxForImageBuffer:(id)a3 error:(id *)a4;
- (BOOL)_visionBBoxToTrackerBBox:(id)a3 trackedObjects:(void *)a4 imageSize:(CGSize)a5 results:(id)a6 error:(id *)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResettable;
- (BOOL)isTracking;
- (BOOL)reset:(id *)a3;
- (CGRect)lastTrackedBBox;
- (NSString)level;
- (NSUUID)key;
- (VNRequestSpecifier)originatingRequestSpecifier;
- (VNTracker)initWithOptions:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)_parseInputObservations:(id)a3 imageBuffer:(id)a4 error:(id *)a5;
- (id)_postProcessTrackingResults:(id)a3 trackerResults:(id)a4 error:(id *)a5;
- (id)setTrackedObjects:(id)a3 inFrame:(id)a4 error:(id *)a5;
- (id)trackInFrame:(id)a3 error:(id *)a4;
- (int64_t)trackedFrameNumber;
- (unint64_t)hash;
- (unsigned)trackedFrameCVPixelBufferFormat;
- (void)_createTrackerWithLevel:(id)a3 options:(ObjectTrackerOptions *)a4 error:(id *)a5;
- (void)setLastTrackedBBox:(CGRect)a3;
- (void)setTrackedFrameCVPixelBufferFormat:(unsigned int)a3;
- (void)setTrackedFrameNumber:(int64_t)a3;
@end

@implementation VNTracker

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_level, 0);
  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);
  cntrl = self->mTrackerImpl.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (NSUUID)key
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastTrackedBBox:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_lastTrackedBBox, &v3, 32, 1, 0);
}

- (CGRect)lastTrackedBBox
{
  objc_copyStruct(v6, &self->_lastTrackedBBox, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setTrackedFrameNumber:(int64_t)a3
{
  self->_trackedFrameNumber = a3;
}

- (int64_t)trackedFrameNumber
{
  return self->_trackedFrameNumber;
}

- (NSString)level
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTrackedFrameCVPixelBufferFormat:(unsigned int)a3
{
  self->_trackedFrameCVPixelBufferFormat = a3;
}

- (unsigned)trackedFrameCVPixelBufferFormat
{
  return self->_trackedFrameCVPixelBufferFormat;
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return self->_originatingRequestSpecifier;
}

- (BOOL)_updateTrackerWithModifiedBBoxForImageBuffer:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(VNTracker *)self key];
  v22 = v7;
  [(VNTracker *)self lastTrackedBBox];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v24);
  v23[0] = DictionaryRepresentation;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];

  unint64_t v10 = [v9 count];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
  std::vector<vision::mod::DetectedObject>::vector(v20, v10);
  unint64_t v12 = [v6 width];
  double v13 = (double)(unint64_t)[v6 height];
  if (-[VNTracker _visionBBoxToTrackerBBox:trackedObjects:imageSize:results:error:](self, "_visionBBoxToTrackerBBox:trackedObjects:imageSize:results:error:", v9, v20, v11, a4, (double)v12, v13))
  {
    v14 = (__CVBuffer *)[v6 bufferWithWidth:(unint64_t)(double)v12 height:(unint64_t)v13 format:875704422 options:0 error:a4];
    if (!v14)
    {
      if (a4)
      {
        v18 = [NSString stringWithFormat:@"No frame to track objects was passed to the tracker"];
        *a4 = +[VNError errorWithCode:14 message:v18];
      }
      goto LABEL_10;
    }
    uint64_t v15 = (*(uint64_t (**)(ObjectTrackerAbstract *, __CVBuffer *, void *))(*(void *)self->mTrackerImpl.__ptr_
                                                                                     + 40))(self->mTrackerImpl.__ptr_, v14, v20);
    CVPixelBufferRelease(v14);
    BOOL v16 = v15 == 128;
    if (a4 && v15 != 128)
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Tracking objects failed with error: %llu", v15);
      *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:v17];

LABEL_10:
      BOOL v16 = 0;
    }
  }
  else
  {
    if (!a4) {
      goto LABEL_10;
    }
    +[VNError errorForInternalErrorWithLocalizedDescription:@"Conversion to Tracker coordinate system failed"];
    BOOL v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = (void **)v20;
  std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100](&v21);

  return v16;
}

- (BOOL)_visionBBoxToTrackerBBox:(id)a3 trackedObjects:(void *)a4 imageSize:(CGSize)a5 results:(id)a6 error:(id *)a7
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v42 = a6;
  v43 = [(VNTracker *)self originatingRequestSpecifier];
  v11 = (objc_class *)[(id)objc_opt_class() trackerObservationClass];
  v44 = [(VNTracker *)self key];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = [v45 allKeys];
  uint64_t v12 = [obj countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (v12)
  {
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v48;
    uint64_t v15 = 40;
    uint64_t v16 = MEMORY[0x1E4F1DB28];
    uint64_t v38 = 40;
    while (2)
    {
      uint64_t v17 = 0;
      uint64_t v18 = v15 + 80 * v13;
      do
      {
        if (*(void *)v48 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v47 + 1) + 8 * v17);
        CGSize v20 = *(CGSize *)(v16 + 16);
        rect.origin = *(CGPoint *)v16;
        rect.size = v20;
        objc_msgSend(v45, "objectForKeyedSubscript:", v19, v38);
        CFDictionaryRef v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        BOOL v22 = CGRectMakeWithDictionaryRepresentation(v21, &rect);

        if (!v22)
        {
          if (a7)
          {
            *a7 = +[VNError errorForInternalErrorWithLocalizedDescription:@"failed to initialize object IDs to rectangles dictionary"];
          }
          BOOL v36 = 0;
          goto LABEL_17;
        }
        id v23 = [v11 alloc];
        CGRect v24 = objc_msgSend(v23, "initWithOriginatingRequestSpecifier:boundingBox:", v43, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
        [v24 setUUID:v44];
        [v42 setObject:v24 atIndexedSubscript:v13 + v17];
        rect.origin.x = width * rect.origin.x;
        rect.origin.y = height * rect.origin.y;
        rect.size.double width = width * rect.size.width;
        rect.size.double height = height * rect.size.height;
        double MinX = CGRectGetMinX(rect);
        CGFloat v26 = height - CGRectGetMaxY(rect);
        rect.origin.x = MinX;
        rect.origin.y = v26;
        double v28 = rect.size.width;
        double v27 = rect.size.height;
        std::string::basic_string[abi:ne180100]<0>(&__str, "unknown");
        *(float *)&unsigned int v29 = v28;
        *(float *)&unsigned int v30 = v27;
        *(float *)&unsigned int v31 = MinX;
        *(float *)&unsigned int v32 = v26;
        *(void *)&long long v52 = __PAIR64__(v32, v31);
        *((void *)&v52 + 1) = __PAIR64__(v29, v30);
        int v55 = 0;
        char v56 = 0;
        int v57 = 0;
        uint64_t v53 = 0;
        __int16 v54 = 0;
        uint64_t v33 = *(void *)a4;
        uint64_t v34 = *(void *)a4 + v18;
        if ((std::string *)(v34 - 40) != &__str)
        {
          *(_OWORD *)(v34 + 24) = v58;
          std::string::operator=((std::string *)(v34 - 40), &__str);
          uint64_t v35 = v33 + v18;
          *(_OWORD *)(v35 - 16) = v52;
          *(_WORD *)(v35 + 8) = v54;
          *(void *)uint64_t v35 = v53;
          *(unsigned char *)(v35 + 16) = v56;
          *(_DWORD *)(v35 + 12) = v55;
          *(_DWORD *)(v35 + 20) = v57;
        }
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__str.__r_.__value_.__l.__data_);
        }

        ++v17;
        v18 += 80;
      }
      while (v12 != v17);
      uint64_t v12 = [obj countByEnumeratingWithState:&v47 objects:v59 count:16];
      v13 += v17;
      uint64_t v15 = v38;
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v36 = 1;
LABEL_17:

  return v36;
}

- (id)_postProcessTrackingResults:(id)a3 trackerResults:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = v9;
  if (v9 && [v9 count] == 1)
  {
    v11 = [v10 objectAtIndexedSubscript:0];
    [v11 boundingBox];
    -[VNTracker setLastTrackedBBox:](self, "setLastTrackedBBox:");

    id v12 = v10;
  }
  else if (a5)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:@"no tracker results"];
    id v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_parseInputObservations:(id)a3 imageBuffer:(id)a4 error:(id *)a5
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (BOOL)isResettable
{
  return 1;
}

- (BOOL)isTracking
{
  return [(VNTracker *)self trackedFrameNumber] >= 0;
}

- (BOOL)reset:(id *)a3
{
  ptr = self->mTrackerImpl.__ptr_;
  if (ptr)
  {
    uint64_t v6 = (*(uint64_t (**)(ObjectTrackerAbstract *, SEL))(*(void *)ptr + 16))(ptr, a2);
    if (v6 == 128)
    {
      [(VNTracker *)self setTrackedFrameNumber:-1];
      -[VNTracker setLastTrackedBBox:](self, "setLastTrackedBBox:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      return 1;
    }
    if (a3)
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Resetting tracker failed with error: %llu", v6);
      *a3 = +[VNError errorForInternalErrorWithLocalizedDescription:v9];
    }
  }
  else if (a3)
  {
    id v8 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Tracker is not initialized"];
    BOOL result = 0;
    *a3 = v8;
    return result;
  }
  return 0;
}

- (id)trackInFrame:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!self->mTrackerImpl.__ptr_ || ![(VNTracker *)self isTracking])
  {
    if (a4)
    {
      v37 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Tracker is not initialized"];
LABEL_14:
      id v36 = 0;
      *a4 = v37;
      goto LABEL_22;
    }
LABEL_17:
    id v36 = 0;
    goto LABEL_22;
  }
  double v7 = (double)(unint64_t)[v6 width];
  double v8 = (double)(unint64_t)[v6 height];
  id v9 = (__CVBuffer *)objc_msgSend(v6, "bufferWithWidth:height:format:options:error:", (unint64_t)v7, (unint64_t)v8, -[VNTracker trackedFrameCVPixelBufferFormat](self, "trackedFrameCVPixelBufferFormat"), 0, a4);
  unint64_t v10 = v9;
  if (!v9)
  {
    if (a4)
    {
      v37 = +[VNError errorForInvalidArgumentWithLocalizedDescription:@"No frame to track objects was passed to the tracker"];
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x4812000000;
  v44 = __Block_byref_object_copy__35941;
  id v45 = __Block_byref_object_dispose__35942;
  v46 = "";
  memset(v47, 0, sizeof(v47));
  CVPixelBufferLockBaseAddress(v9, 1uLL);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __32__VNTracker_trackInFrame_error___block_invoke;
  aBlock[3] = &unk_1E5B1FD40;
  aBlock[5] = &v41;
  aBlock[6] = v10;
  aBlock[4] = self;
  v11 = _Block_copy(aBlock);
  char v12 = VNExecuteBlock(v11, (uint64_t)a4);
  CVPixelBufferUnlockBaseAddress(v10, 1uLL);
  CVPixelBufferRelease(v10);
  if (v12)
  {
    id v39 = v6;
    uint64_t v13 = [(VNTracker *)self originatingRequestSpecifier];
    id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = (void *)[v14 initWithCapacity:0xCCCCCCCCCCCCCCCDLL * ((v42[7] - v42[6]) >> 4)];
    uint64_t v17 = v42[6];
    uint64_t v16 = v42[7];
    if (v17 != v16)
    {
      uint64_t v18 = 0;
      do
      {
        uint64_t v19 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:]([VNDetectedObjectObservation alloc], "initWithOriginatingRequestSpecifier:boundingBox:", v13, *(float *)(v17 + 24) / v7, *(float *)(v17 + 28) / v8, *(float *)(v17 + 36) / v7, *(float *)(v17 + 32) / v8);
        CGSize v20 = [(VNTracker *)self key];
        [(VNObservation *)v19 setUUID:v20];

        LODWORD(v21) = *(_DWORD *)(v17 + 60);
        [(VNObservation *)v19 setConfidence:v21];
        [v15 setObject:v19 atIndexedSubscript:v18++];

        v17 += 80;
      }
      while (v17 != v16);
    }
    BOOL v22 = [v15 objectAtIndexedSubscript:0];
    id v6 = v39;
    [v22 boundingBox];
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;

    unsigned int v31 = [(VNTracker *)self _postProcessTrackingResults:v39 trackerResults:v15 error:a4];
    if (!v31) {
      goto LABEL_19;
    }
    [(VNTracker *)self setTrackedFrameNumber:[(VNTracker *)self trackedFrameNumber] + 1];
    [(VNTracker *)self lastTrackedBBox];
    v51.origin.x = v32;
    v51.origin.y = v33;
    v51.size.double width = v34;
    v51.size.double height = v35;
    v50.origin.x = v24;
    v50.origin.y = v26;
    v50.size.double width = v28;
    v50.size.double height = v30;
    if (CGRectEqualToRect(v50, v51)
      || [(VNTracker *)self _updateTrackerWithModifiedBBoxForImageBuffer:v39 error:a4])
    {
      id v36 = v31;
    }
    else
    {
LABEL_19:
      id v36 = 0;
    }
  }
  else
  {
    id v36 = 0;
  }

  _Block_object_dispose(&v41, 8);
  long long v48 = (void **)v47;
  std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100](&v48);
LABEL_22:

  return v36;
}

BOOL __32__VNTracker_trackInFrame_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (*(uint64_t (**)(void, void, uint64_t))(**(void **)(a1[4] + 8) + 32))(*(void *)(a1[4] + 8), a1[6], *(void *)(a1[5] + 8) + 48);
  uint64_t v4 = v3;
  if (a2 && v3 != 128)
  {
    double v5 = objc_msgSend(NSString, "stringWithFormat:", @"Tracking objects failed with error: %llu", v3);
    *a2 = +[VNError errorForInternalErrorWithLocalizedDescription:v5];
  }
  return v4 == 128;
}

- (id)setTrackedObjects:(id)a3 inFrame:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(VNTracker *)self _parseInputObservations:a3 imageBuffer:v8 error:a5];
  if (!v9)
  {
LABEL_9:
    id v11 = 0;
    goto LABEL_18;
  }
  if (!self->mTrackerImpl.__ptr_)
  {
    if (a5)
    {
      unint64_t v10 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Tracker is not initialized"];
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  if ([(VNTracker *)self isTracking])
  {
    if (a5)
    {
      unint64_t v10 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Tracker is busy with previous tracking requests. It needs to be reset to restart tracking sequence"];
LABEL_8:
      id v11 = 0;
      *a5 = v10;
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  unint64_t v12 = [v9 count];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v12];
  std::vector<vision::mod::DetectedObject>::vector(&v24, v12);
  unint64_t v14 = [v8 width];
  double v15 = (double)(unint64_t)[v8 height];
  if (-[VNTracker _visionBBoxToTrackerBBox:trackedObjects:imageSize:results:error:](self, "_visionBBoxToTrackerBBox:trackedObjects:imageSize:results:error:", v9, &v24, v13, a5, (double)v14, v15)&& (uint64_t v16 = (__CVBuffer *)objc_msgSend(v8, "bufferWithWidth:height:format:options:error:", (unint64_t)(double)v14, (unint64_t)v15, -[VNTracker trackedFrameCVPixelBufferFormat](self, "trackedFrameCVPixelBufferFormat"), 0, a5), (v17 = v16) != 0))
  {
    CVPixelBufferLockBaseAddress(v16, 1uLL);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3321888768;
    aBlock[2] = __45__VNTracker_setTrackedObjects_inFrame_error___block_invoke;
    aBlock[3] = &unk_1EF754220;
    aBlock[4] = self;
    aBlock[5] = v17;
    memset(v23, 0, sizeof(v23));
    std::vector<vision::mod::DetectedObject>::__init_with_size[abi:ne180100]<vision::mod::DetectedObject*,vision::mod::DetectedObject*>(v23, v24, v25, 0xCCCCCCCCCCCCCCCDLL * ((v25 - v24) >> 4));
    uint64_t v18 = _Block_copy(aBlock);
    char v19 = VNExecuteBlock(v18, (uint64_t)a5);
    CVPixelBufferUnlockBaseAddress(v17, 1uLL);
    CVPixelBufferRelease(v17);
    if (v19)
    {
      CGSize v20 = [v13 objectAtIndexedSubscript:0];
      [v20 boundingBox];
      -[VNTracker setLastTrackedBBox:](self, "setLastTrackedBBox:");

      [(VNTracker *)self setTrackedFrameNumber:0];
      id v11 = v13;
    }
    else
    {
      id v11 = 0;
    }

    CGFloat v26 = (void **)v23;
    std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100](&v26);
  }
  else
  {
    id v11 = 0;
  }
  CGFloat v26 = (void **)&v24;
  std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100](&v26);

LABEL_18:

  return v11;
}

BOOL __45__VNTracker_setTrackedObjects_inFrame_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)(*(uint64_t (**)(void, void, uint64_t))(**(void **)(*(void *)(a1 + 32) + 8) + 24))(*(void *)(*(void *)(a1 + 32) + 8), *(void *)(a1 + 40), a1 + 48);
  uint64_t v4 = v3;
  if (a2 && v3 != 128)
  {
    double v5 = VNErrorForCVMLStatus(v3);
    *a2 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Setting objects to track failed" underlyingError:v5];
  }
  return v4 == 128;
}

- (void)_createTrackerWithLevel:(id)a3 options:(ObjectTrackerOptions *)a4 error:(id *)a5
{
  int64_t v7 = +[VNTracker VNTrackerOptionToTrackerType:a3];
  if (v7 == -1)
  {
    if (a5)
    {
      id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown Tracker type: %ld", -1);
      *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:v8];
    }
  }
  else
  {
    switch(v7)
    {
      case 3:
        {
          operator new();
        }
        __cxa_bad_cast();
      case 2:
        operator new();
      case 1:
        operator new();
    }
    if (a5)
    {
      *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Cannot create a Tracker object"];
    }
  }
  return 0;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VNTracker;
  return [(NSUUID *)self->_key hash] ^ __ROR8__([(VNTracker *)&v3 hash], 51);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VNTracker *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(NSUUID *)self->_key isEqual:v4->_key];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (VNTracker)initWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VNTracker;
  int64_t v7 = [(VNTracker *)&v19 init];
  if (!v7)
  {
    if (a4)
    {
      +[VNError errorForMemoryAllocationFailure];
      uint64_t v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v16 = 0;
    goto LABEL_10;
  }
  uint64_t v8 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v6 error:a4];
  originatingRequestSpecifier = v7->_originatingRequestSpecifier;
  v7->_originatingRequestSpecifier = (VNRequestSpecifier *)v8;

  if (!v7->_originatingRequestSpecifier) {
    goto LABEL_9;
  }
  v7->_trackedFrameNumber = -1;
  CGSize v10 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v7->_lastTrackedBBox.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v7->_lastTrackedBBox.size = v10;
  id v11 = [v6 objectForKeyedSubscript:@"VNTrackingOption_TrackerKey"];
  uint64_t v12 = [v11 copy];
  key = v7->_key;
  v7->_key = (NSUUID *)v12;

  if (!v7->_key) {
    goto LABEL_9;
  }
  uint64_t v14 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNTrackingOption_TrackingLevel" inOptions:v6 error:a4];
  level = v7->_level;
  v7->_level = (NSString *)v14;

  if (!v7->_level) {
    goto LABEL_9;
  }
  uint64_t v18 = 0;
  if (!+[VNValidationUtilities getNSUIntegerValue:&v18 forKey:@"VNTrackingOption_CVPixelBufferFormat" inOptions:v6 error:a4])goto LABEL_9; {
  v7->_trackedFrameCVPixelBufferFormat = v18;
  }
  uint64_t v16 = v7;
LABEL_10:

  return v16;
}

+ (id)supportedComputeDevicesForOptions:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[VNError errorForUnimplementedMethod:a2 ofObject:a1];
  }
  return 0;
}

+ (int64_t)VNTrackerOptionToTrackerType:(id)a3
{
  id v3 = a3;
  if (+[VNTracker VNTrackerOptionToTrackerType:]::onceToken != -1) {
    dispatch_once(&+[VNTracker VNTrackerOptionToTrackerType:]::onceToken, &__block_literal_global_35973);
  }
  uint64_t v4 = [(id)+[VNTracker VNTrackerOptionToTrackerType:]::s_visTrackerOptionToTrackerType objectForKeyedSubscript:v3];
  char v5 = v4;
  if (v4) {
    int64_t v6 = [v4 integerValue];
  }
  else {
    int64_t v6 = -1;
  }

  return v6;
}

void __42__VNTracker_VNTrackerOptionToTrackerType___block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VNTrackingOption_TrackingLevelAccurate";
  v2[1] = @"VNTrackingOption_TrackingLevelFast";
  v3[0] = &unk_1EF7A79D0;
  v3[1] = &unk_1EF7A79E8;
  v2[2] = @"VNTrackingOption_TrackingLevelRPN";
  v3[2] = &unk_1EF7A7A00;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)+[VNTracker VNTrackerOptionToTrackerType:]::s_visTrackerOptionToTrackerType;
  +[VNTracker VNTrackerOptionToTrackerType:]::s_visTrackerOptionToTrackerType = v0;
}

@end