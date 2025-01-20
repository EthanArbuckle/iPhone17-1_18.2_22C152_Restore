@interface VNTrackingRequest
+ (id)trackerTypeForRequestRevision:(unint64_t)a3 error:(id *)a4;
+ (unsigned)frameCVPixelBufferFormatForRequestRevision:(unint64_t)a3;
- (BOOL)allowsCachingOfResults;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)isLastFrame;
- (BOOL)warmUpSession:(id)a3 error:(id *)a4;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (NSUInteger)supportedNumberOfTrackersAndReturnError:(NSError *)error;
- (VNDetectedObjectObservation)inputObservation;
- (VNRequestTrackingLevel)trackingLevel;
- (VNTrackingRequest)initWithDetectedObjectObservation:(id)a3;
- (VNTrackingRequest)initWithDetectedObjectObservation:(id)a3 completionHandler:(id)a4;
- (id)_resetTrackerIfNeeded:(id)a3 session:(id)a4 options:(id)a5 error:(id *)a6;
- (id)_trackingLevelOptionFromTrackingLevelEnum;
- (id)applicableTrackerAndOptions:(id *)a3 forRevision:(unint64_t)a4 loadedInSession:(id)a5 error:(id *)a6;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)newDuplicateInstance;
- (id)sequencedRequestPreviousObservationsKey;
- (id)supportedComputeStageDevicesAndReturnError:(id *)a3;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setInputObservation:(VNDetectedObjectObservation *)inputObservation;
- (void)setLastFrame:(BOOL)lastFrame;
- (void)setTrackingLevel:(VNRequestTrackingLevel)trackingLevel;
@end

@implementation VNTrackingRequest

- (void).cxx_destruct
{
}

- (void)setLastFrame:(BOOL)lastFrame
{
  self->_lastFrame = lastFrame;
}

- (BOOL)isLastFrame
{
  return self->_lastFrame;
}

- (VNRequestTrackingLevel)trackingLevel
{
  return self->_trackingLevel;
}

- (id)_resetTrackerIfNeeded:(id)a3 session:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([v9 isTracking] & 1) == 0 || (objc_msgSend(v9, "isResettable") & 1) == 0) {
    goto LABEL_22;
  }
  v12 = [v9 key];
  v13 = [v11 objectForKeyedSubscript:@"VNTrackingOption_TrackerKey"];
  v14 = [v12 UUIDString];
  v15 = [v13 UUIDString];
  char v16 = [v14 isEqualToString:v15];

  if (v16)
  {
    v23 = [v9 level];
    v24 = [v11 objectForKeyedSubscript:@"VNTrackingOption_TrackingLevel"];
    if (([v23 isEqualToString:v24] & 1) == 0)
    {
      VNValidatedLog(1, @"Tracker level has changed, restarting tracking sequence: current tracking level = %@; new tracking level = %@",
        v25,
        v26,
        v27,
        v28,
        v29,
        v30,
        (uint64_t)v23);
LABEL_11:

      goto LABEL_12;
    }
    [v9 lastTrackedBBox];
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    double v36 = v35;
    double v38 = v37;
    CGSize v39 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    rect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    rect.size = v39;
    CFDictionaryRef v40 = [v11 objectForKeyedSubscript:@"VNTrackingOption_InputBBox"];
    BOOL v41 = CGRectMakeWithDictionaryRepresentation(v40, &rect);

    if (!v41)
    {
      if (a6)
      {
        v49 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Internal error: internal type conversion failed"];
        goto LABEL_17;
      }
LABEL_18:

      id v51 = 0;
      goto LABEL_23;
    }
    v76.origin.x = v32;
    v76.origin.y = v34;
    v76.size.width = v36;
    v76.size.height = v38;
    CGRect v77 = CGRectIntersection(v76, rect);
    float v48 = v36 * v38;
    if (v48 < 1.1755e-38)
    {
      if (a6)
      {
        v49 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Internal error: unexpected tracked object bounding box size"];
LABEL_17:
        *a6 = v49;
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    float v53 = v77.size.width * v77.size.height;
    if ((float)(v53 / v48) < 0.35)
    {
      VNValidatedLog(1, @"Bounding box input location has changed, restarting tracking sequence", v42, v43, v44, v45, v46, v47, v73);
      VNValidatedLog(1, @"currentTrackerBBox.x = %f; currentTrackerBBox.x = %f; currentTrackerBBox.width = %f; currentTrackerBBox.height = %f; ",
        v54,
        v55,
        v56,
        v57,
        v58,
        v59,
        *(uint64_t *)&v32);
      VNValidatedLog(1, @"newTrackerBBox.x = %f; newTrackerBBox.x = %f; newTrackerBBox.width = %f; newTrackerBBox.height = %f; ",
        v60,
        v61,
        v62,
        v63,
        v64,
        v65,
        *(uint64_t *)&rect.origin.x);
      VNValidatedLog(1, @"currentBBoxArea = %f; overlappedBBoxArea = %f; overlappedBBoxArea / currentBBoxArea = %f",
        v66,
        v67,
        v68,
        v69,
        v70,
        v71,
        COERCE__INT64(v48));
      goto LABEL_11;
    }

LABEL_22:
    id v51 = v9;
    goto LABEL_23;
  }
  VNValidatedLog(1, @"Tracker key has changed, restarting tracking sequence: current tracker key = %@; new tracker key = %@",
    v17,
    v18,
    v19,
    v20,
    v21,
    v22,
    (uint64_t)v12);
LABEL_12:

  [v10 releaseTracker:v9];
  v50 = [v10 trackerWithOptions:v11 error:a6];
  id v51 = v50;
  if (v50) {
    id v52 = v50;
  }

LABEL_23:

  return v51;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [v8 session];
  id v10 = [v8 requestPerformerAndReturnError:a5];
  if (!v10)
  {
    char v16 = 0;
    uint64_t v17 = 0;
    goto LABEL_17;
  }
  id v11 = [v8 imageBufferAndReturnError:a5];
  if (!v11)
  {
    char v16 = 0;
    uint64_t v17 = 0;
    int v18 = 1;
    goto LABEL_14;
  }
  id v12 = [(VNTrackingRequest *)self newDefaultDetectorOptionsForRequestRevision:a3 session:v9];
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v11, "width"));
  [v12 setObject:v13 forKeyedSubscript:@"VNTrackingOption_InputImageMaxWidth"];

  v14 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v11, "height"));
  [v12 setObject:v14 forKeyedSubscript:@"VNTrackingOption_InputImageMaxHeight"];

  [(VNTrackingRequest *)self populateDetectorProcessingOptions:v12 session:v9];
  v15 = [v9 trackerWithOptions:v12 error:a5];
  if (v15)
  {
    [v10 recordTracker:v15];
    char v16 = [(VNTrackingRequest *)self _resetTrackerIfNeeded:v15 session:v9 options:v12 error:a5];

    if (v16)
    {
      if ([v16 isTracking])
      {
        uint64_t v17 = [v16 trackInFrame:v11 error:a5];
      }
      else
      {
        uint64_t v19 = [(VNTrackingRequest *)self inputObservation];
        uint64_t v17 = [v16 setTrackedObjects:v19 inFrame:v11 error:a5];
      }
      int v18 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    char v16 = 0;
  }
  uint64_t v17 = 0;
  int v18 = 1;
LABEL_13:

LABEL_14:
  if ([(VNTrackingRequest *)self isLastFrame]) {
    [v9 releaseTracker:v16];
  }
  if (!v18)
  {
    [(VNRequest *)self setResults:v17];
    BOOL v20 = v17 != 0;
    goto LABEL_19;
  }
LABEL_17:
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

- (VNDetectedObjectObservation)inputObservation
{
  return self->_inputObservation;
}

- (void)setInputObservation:(VNDetectedObjectObservation *)inputObservation
{
}

- (void)applyConfigurationOfRequest:(id)a3
{
  v4 = (VNTrackingRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNTrackingRequest;
    [(VNImageBasedRequest *)&v5 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_trackingLevel = [(VNTrackingRequest *)v4 trackingLevel];
      self->_lastFrame = [(VNTrackingRequest *)v4 isLastFrame];
    }
  }
}

- (id)newDuplicateInstance
{
  id v3 = objc_alloc((Class)objc_opt_class());
  v4 = [(VNTrackingRequest *)self inputObservation];
  objc_super v5 = [(VNRequest *)self completionHandler];
  v6 = (void *)[v3 initWithDetectedObjectObservation:v4 completionHandler:v5];

  return v6;
}

- (VNTrackingRequest)initWithDetectedObjectObservation:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VNTrackingRequest;
  id v9 = [(VNRequest *)&v13 initWithCompletionHandler:v8];
  id v10 = v9;
  id v11 = 0;
  if (v7 && v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&v10->_inputObservation, a3);
      v10->_trackingLevel = 1;
      v10->_lastFrame = 0;
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

- (VNTrackingRequest)initWithDetectedObjectObservation:(id)a3
{
  return [(VNTrackingRequest *)self initWithDetectedObjectObservation:a3 completionHandler:0];
}

- (id)sequencedRequestPreviousObservationsKey
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)VNTrackingRequest;
  v4 = [(VNRequest *)&v8 sequencedRequestPreviousObservationsKey];
  objc_super v5 = [(VNTrackingRequest *)self _trackingLevelOptionFromTrackingLevelEnum];
  v6 = (void *)[v3 initWithFormat:@"%@:Trk=%@", v4, v5];

  return v6;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  return 0;
}

- (BOOL)allowsCachingOfResults
{
  return 0;
}

- (void)setTrackingLevel:(VNRequestTrackingLevel)trackingLevel
{
  self->_trackingLevel = trackingLevel;
}

- (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VNTrackingRequest;
  if ([(VNRequest *)&v10 warmUpSession:v6 error:a4])
  {
    id v7 = [(VNTrackingRequest *)self applicableTrackerAndOptions:0 forRevision:[(VNRequest *)self resolvedRevision] loadedInSession:v6 error:a4];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_trackingLevelOptionFromTrackingLevelEnum
{
  if (self->_trackingLevel) {
    v2 = @"VNTrackingOption_TrackingLevelFast";
  }
  else {
    v2 = @"VNTrackingOption_TrackingLevelAccurate";
  }
  id v3 = v2;

  return v3;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)VNTrackingRequest;
  id v6 = [(VNRequest *)&v19 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  id v7 = objc_opt_class();
  BOOL v8 = [v7 trackerTypeForRequestRevision:a3 error:0];
  if (v8)
  {
    [v6 setObject:v8 forKeyedSubscript:@"VNTrackingOption_TrackerType"];
    id v9 = [(VNTrackingRequest *)self _trackingLevelOptionFromTrackingLevelEnum];
    [v6 setObject:v9 forKeyedSubscript:@"VNTrackingOption_TrackingLevel"];

    objc_super v10 = [(VNTrackingRequest *)self inputObservation];
    id v11 = [v10 uuid];
    [v6 setObject:v11 forKeyedSubscript:@"VNTrackingOption_TrackerKey"];

    [v10 boundingBox];
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v20);
    [v6 setObject:DictionaryRepresentation forKeyedSubscript:@"VNTrackingOption_InputBBox"];

    objc_super v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "frameCVPixelBufferFormatForRequestRevision:", a3));
    [v6 setObject:v13 forKeyedSubscript:@"VNTrackingOption_CVPixelBufferFormat"];

    v14 = [v6 objectForKeyedSubscript:@"VNDetectorOption_ComputeStageDeviceAssignments"];
    v15 = [v14 objectForKeyedSubscript:@"VNComputeStageMain"];

    if (!v15)
    {
      char v16 = [VNProcessingDeviceComputeDeviceBridge alloc];
      uint64_t v17 = +[VNProcessingDevice defaultDevice];
      v15 = [(VNProcessingDeviceComputeDeviceBridge *)v16 initWithProcessingDevice:v17];
    }
    [v6 setObject:v15 forKeyedSubscript:@"VNTrackingOption_ComputeDevice"];
  }
  return v6;
}

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(VNRequest *)self resolvedRevision];
  id v6 = [(id)objc_opt_class() trackerTypeForRequestRevision:v5 error:a3];
  if (v6)
  {
    id v7 = [(VNTrackingRequest *)self newDefaultDetectorOptionsForRequestRevision:v5 session:0];
    [v7 setObject:v6 forKeyedSubscript:@"VNTrackingOption_TrackerType"];
    BOOL v8 = (void *)[v7 copy];
    id v9 = +[VNTrackerManager trackerClassForOptions:error:]((uint64_t)VNTrackerManager, v8, a3);

    if (v9)
    {
      uint64_t v10 = [v9 supportedComputeDevicesForOptions:v7 error:a3];
      id v11 = (void *)v10;
      if (v10)
      {
        v14 = @"VNComputeStageMain";
        v15[0] = v10;
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      }
      else
      {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)applicableTrackerAndOptions:(id *)a3 forRevision:(unint64_t)a4 loadedInSession:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = [(VNTrackingRequest *)self newDefaultDetectorOptionsForRequestRevision:a4 session:v10];
  id v12 = [v10 trackerWithOptions:v11 error:a6];
  if (v12)
  {
    if (a3) {
      *a3 = v11;
    }
    id v13 = v12;
  }

  return v12;
}

- (NSUInteger)supportedNumberOfTrackersAndReturnError:(NSError *)error
{
  return 32;
}

+ (id)trackerTypeForRequestRevision:(unint64_t)a3 error:(id *)a4
{
  return 0;
}

+ (unsigned)frameCVPixelBufferFormatForRequestRevision:(unint64_t)a3
{
  return 875704422;
}

@end