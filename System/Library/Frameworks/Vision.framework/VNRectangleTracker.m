@interface VNRectangleTracker
+ (Class)trackerObservationClass;
+ (id)_trackingRectAroundPoint:(CGPoint)a3 trackingRectSize:(CGSize)a4;
+ (id)supportedComputeDevicesForOptions:(id)a3 error:(id *)a4;
+ (id)trackedCorners;
- (BOOL)isTracking;
- (BOOL)reset:(id *)a3;
- (VNRectangleTracker)initWithOptions:(id)a3 error:(id *)a4;
- (id)_convertCornerObservationsToRectangleObservation:(id)a3 error:(id *)a4;
- (id)_parseInputObservations:(id)a3 imageBuffer:(id)a4 error:(id *)a5;
- (id)setTrackedObjects:(id)a3 inFrame:(id)a4 error:(id *)a5;
- (id)trackInFrame:(id)a3 error:(id *)a4;
@end

@implementation VNRectangleTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectangleTrackingProcessingQueue, 0);

  objc_storeStrong((id *)&self->_cornerTrackersImpl, 0);
}

- (id)_convertCornerObservationsToRectangleObservation:(id)a3 error:(id *)a4
{
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__7445;
  v73 = __Block_byref_object_dispose__7446;
  id v74 = 0;
  uint64_t v62 = 0;
  v63 = (double *)&v62;
  uint64_t v64 = 0x4012000000;
  v65 = __Block_byref_object_copy__87;
  v66 = __Block_byref_object_dispose__88;
  v67 = "";
  long long v68 = *MEMORY[0x1E4F1DAD8];
  uint64_t v55 = 0;
  v56 = (double *)&v55;
  uint64_t v57 = 0x4012000000;
  v58 = __Block_byref_object_copy__87;
  v59 = __Block_byref_object_dispose__88;
  v60 = "";
  long long v61 = *MEMORY[0x1E4F1DAD8];
  uint64_t v48 = 0;
  v49 = (double *)&v48;
  uint64_t v50 = 0x4012000000;
  v51 = __Block_byref_object_copy__87;
  v52 = __Block_byref_object_dispose__88;
  v53 = "";
  long long v54 = *MEMORY[0x1E4F1DAD8];
  uint64_t v41 = 0;
  v42 = (double *)&v41;
  uint64_t v43 = 0x4012000000;
  v44 = __Block_byref_object_copy__87;
  v45 = __Block_byref_object_dispose__88;
  v46 = "";
  long long v47 = *MEMORY[0x1E4F1DAD8];
  uint64_t v34 = 0;
  v35 = (double *)&v34;
  uint64_t v36 = 0x4012000000;
  v37 = __Block_byref_object_copy__87;
  v38 = __Block_byref_object_dispose__88;
  v39 = "";
  int64x2_t v40 = vdupq_n_s64(0x47EFFFFFE0000000uLL);
  uint64_t v26 = 0;
  v27 = (double *)&v26;
  uint64_t v28 = 0x4012000000;
  v29 = __Block_byref_object_copy__87;
  v30 = __Block_byref_object_dispose__88;
  v31 = "";
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v22 = 0;
  v23 = (float *)&v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__VNRectangleTracker__convertCornerObservationsToRectangleObservation_error___block_invoke;
  v17[3] = &unk_1E5B1CBA8;
  v17[4] = &v69;
  v17[5] = &v22;
  v17[6] = &v18;
  v17[7] = &v34;
  v17[8] = &v26;
  v17[9] = &v62;
  v17[10] = &v48;
  v17[11] = &v55;
  v17[12] = &v41;
  [a3 enumerateKeysAndObjectsUsingBlock:v17];
  v6 = (void *)v70[5];
  if (v6)
  {
    v7 = 0;
    if (a4) {
      *a4 = v6;
    }
  }
  else
  {
    double v8 = v35[6];
    double v9 = v35[7];
    double v10 = v27[6];
    double v11 = v27[7];
    v12 = [(VNTracker *)self originatingRequestSpecifier];
    v13 = [VNRectangleObservation alloc];
    v7 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:boundingBox:](v13, "initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:boundingBox:", v12, v49[6], v49[7], v42[6], v42[7], v56[6], v56[7], v63[6], v63[7], *(void *)&v8, *(void *)&v9, v10 - v8, v11 - v9);
    *(float *)&double v14 = v23[6] / (float)(unint64_t)v19[3];
    [(VNObservation *)v7 setConfidence:v14];
    v15 = [(VNTracker *)self key];
    [(VNObservation *)v7 setUUID:v15];
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v69, 8);

  return v7;
}

void __77__VNRectangleTracker__convertCornerObservationsToRectangleObservation_error___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v32 = v7;
  id v9 = v8;
  double v10 = [v9 objectAtIndexedSubscript:1];
  double v11 = [MEMORY[0x1E4F1CA98] null];

  if (v10 != v11)
  {
    uint64_t v12 = [v9 objectAtIndexedSubscript:1];
    uint64_t v13 = *(void *)(a1[4] + 8);
    double v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a4 = 1;
    goto LABEL_15;
  }
  v15 = [v9 objectAtIndexedSubscript:0];
  [v15 confidence];
  if (v16 >= 0.65)
  {
    [v15 confidence];
    *(float *)(*(void *)(a1[5] + 8) + 24) = v23 + *(float *)(*(void *)(a1[5] + 8) + 24);
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
    [v15 boundingBox];
    double v26 = v25 + v24 * 0.5;
    double v29 = v28 + v27 * 0.5;
    *(double *)(*(void *)(a1[7] + 8) + 48) = fmin(*(double *)(*(void *)(a1[7] + 8) + 48), v26);
    *(double *)(*(void *)(a1[7] + 8) + 56) = fmin(*(double *)(*(void *)(a1[7] + 8) + 56), v29);
    *(double *)(*(void *)(a1[8] + 8) + 48) = fmax(*(double *)(*(void *)(a1[8] + 8) + 48), v26);
    *(double *)(*(void *)(a1[8] + 8) + 56) = fmax(*(double *)(*(void *)(a1[8] + 8) + 56), v29);
    if ([v32 isEqualToString:@"VNRectangleTracking_BottomLeftTracker"])
    {
      uint64_t v30 = a1[9];
    }
    else if ([v32 isEqualToString:@"VNRectangleTracking_TopLeftTracker"])
    {
      uint64_t v30 = a1[10];
    }
    else if ([v32 isEqualToString:@"VNRectangleTracking_BottomRightTracker"])
    {
      uint64_t v30 = a1[11];
    }
    else
    {
      if (![v32 isEqualToString:@"VNRectangleTracking_TopRightTracker"]) {
        goto LABEL_14;
      }
      uint64_t v30 = a1[12];
    }
    uint64_t v31 = *(void *)(v30 + 8);
    *(double *)(v31 + 48) = v26;
    *(double *)(v31 + 56) = v29;
    goto LABEL_14;
  }
  v17 = NSString;
  [v15 confidence];
  objc_msgSend(v17, "stringWithFormat:", @"Tracking of %@ failed: confidence = %f; threshold = %f",
    v32,
    v18,
  v19 = 0x3FE4CCCCC0000000);
  uint64_t v20 = +[VNError errorForInternalErrorWithLocalizedDescription:v19];
  uint64_t v21 = *(void *)(a1[4] + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  *a4 = 1;
LABEL_14:

LABEL_15:
}

- (id)_parseInputObservations:(id)a3 imageBuffer:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v8 width];
    [v8 height];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v9 bottomLeft];
    double v11 = +[VNRectangleTracker _trackingRectAroundPoint:trackingRectSize:](VNRectangleTracker, "_trackingRectAroundPoint:trackingRectSize:");
    [v10 setObject:v11 forKey:@"VNRectangleTracking_BottomLeftTracker"];

    [v9 bottomRight];
    uint64_t v12 = +[VNRectangleTracker _trackingRectAroundPoint:trackingRectSize:](VNRectangleTracker, "_trackingRectAroundPoint:trackingRectSize:");
    [v10 setObject:v12 forKey:@"VNRectangleTracking_BottomRightTracker"];

    [v9 topLeft];
    uint64_t v13 = +[VNRectangleTracker _trackingRectAroundPoint:trackingRectSize:](VNRectangleTracker, "_trackingRectAroundPoint:trackingRectSize:");
    [v10 setObject:v13 forKey:@"VNRectangleTracking_TopLeftTracker"];

    [v9 topRight];
    double v14 = +[VNRectangleTracker _trackingRectAroundPoint:trackingRectSize:](VNRectangleTracker, "_trackingRectAroundPoint:trackingRectSize:");
    [v10 setObject:v14 forKey:@"VNRectangleTracking_TopRightTracker"];

    v15 = [v9 uuid];
    float v18 = v15;
    v19[0] = v10;
    float v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  }
  else if (a5)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:@"VNRectangleObservation object is expected to initialize Rectangle Tracker"];
    float v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    float v16 = 0;
  }

  return v16;
}

- (BOOL)isTracking
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  cornerTrackersImpl = self->_cornerTrackersImpl;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__VNRectangleTracker_isTracking__block_invoke;
  v5[3] = &unk_1E5B1CB80;
  v5[4] = &v6;
  [(NSMutableDictionary *)cornerTrackersImpl enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __32__VNRectangleTracker_isTracking__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= [v4 isTracking];
}

- (BOOL)reset:(id *)a3
{
  if (self->super.mTrackerImpl.__ptr_)
  {
    uint64_t v17 = 0;
    float v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    double v14 = __Block_byref_object_copy__7445;
    v15 = __Block_byref_object_dispose__7446;
    id v16 = 0;
    cornerTrackersImpl = self->_cornerTrackersImpl;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __28__VNRectangleTracker_reset___block_invoke;
    v10[3] = &unk_1E5B1CB58;
    v10[4] = &v17;
    v10[5] = &v11;
    [(NSMutableDictionary *)cornerTrackersImpl enumerateKeysAndObjectsUsingBlock:v10];
    uint64_t v6 = v18[3];
    BOOL v7 = v6 == 0;
    if (v6)
    {
      if (a3)
      {
        uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Resetting tracker failed with error: %llu", v18[3]);
        *a3 = +[VNError errorForInternalErrorWithLocalizedDescription:v8 underlyingError:v12[5]];
      }
    }
    else
    {
      [(VNTracker *)self setTrackedFrameNumber:-1];
      -[VNTracker setLastTrackedBBox:](self, "setLastTrackedBBox:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }
  else if (a3)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"Tracker is not initialized"];
    BOOL v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v7;
}

void __28__VNRectangleTracker_reset___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  unsigned int v8 = [v6 reset:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
}

- (id)trackInFrame:(id)a3 error:(id *)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  cornerTrackersImpl = self->_cornerTrackersImpl;
  if (cornerTrackersImpl
    && (uint64_t v8 = [(NSMutableDictionary *)cornerTrackersImpl count],
        +[VNRectangleTracker trackedCorners],
        char v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        v8 == v10))
  {
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    int64x2_t v40 = __Block_byref_object_copy__7445;
    uint64_t v41 = __Block_byref_object_dispose__7446;
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = (void *)v38[5];
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
    [v11 setObject:v12 forKey:@"VNRectangleTracking_BottomLeftTracker"];

    uint64_t v13 = (void *)v38[5];
    double v14 = [MEMORY[0x1E4F1CA98] null];
    [v13 setObject:v14 forKey:@"VNRectangleTracking_BottomRightTracker"];

    v15 = (void *)v38[5];
    id v16 = [MEMORY[0x1E4F1CA98] null];
    [v15 setObject:v16 forKey:@"VNRectangleTracking_TopLeftTracker"];

    uint64_t v17 = (void *)v38[5];
    float v18 = [MEMORY[0x1E4F1CA98] null];
    [v17 setObject:v18 forKey:@"VNRectangleTracking_TopRightTracker"];

    dispatch_group_t v19 = dispatch_group_create();
    uint64_t v20 = self->_cornerTrackersImpl;
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    uint64_t v31 = __41__VNRectangleTracker_trackInFrame_error___block_invoke;
    id v32 = &unk_1E5B1CB30;
    uint64_t v21 = v19;
    uint64_t v33 = v21;
    uint64_t v34 = self;
    uint64_t v36 = &v37;
    id v22 = v6;
    id v35 = v22;
    [(NSMutableDictionary *)v20 enumerateKeysAndObjectsUsingBlock:&v29];
    dispatch_group_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v23 = -[VNRectangleTracker _convertCornerObservationsToRectangleObservation:error:](self, "_convertCornerObservationsToRectangleObservation:error:", v38[5], a4, v29, v30, v31, v32);
    double v24 = (void *)v23;
    if (v23)
    {
      v43[0] = v23;
      double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
      double v26 = [(VNTracker *)self _postProcessTrackingResults:v22 trackerResults:v25 error:a4];

      if (v26)
      {
        [(VNTracker *)self setTrackedFrameNumber:[(VNTracker *)self trackedFrameNumber] + 1];
        id v27 = v26;
      }
    }
    else
    {
      double v26 = 0;
    }

    _Block_object_dispose(&v37, 8);
  }
  else if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"Tracker is not initialized"];
    double v26 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v26 = 0;
  }

  return v26;
}

void __41__VNRectangleTracker_trackInFrame_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(a1 + 32);
  uint64_t v8 = *(NSObject **)(*(void *)(a1 + 40) + 104);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__VNRectangleTracker_trackInFrame_error___block_invoke_2;
  block[3] = &unk_1E5B1CB08;
  id v14 = v5;
  id v15 = v6;
  long long v12 = *(_OWORD *)(a1 + 48);
  id v9 = (id)v12;
  long long v16 = v12;
  id v10 = v6;
  id v11 = v5;
  dispatch_group_async(v7, v8, block);
}

void __41__VNRectangleTracker_trackInFrame_error___block_invoke_2(uint64_t a1)
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  uint64_t v5 = [v4 UTF8String];
  VNValidatedLog(1, @"trackInFrame started for %s", v6, v7, v8, v9, v10, v11, v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = +[VNError errorForInternalErrorWithLocalizedDescription:@"wrong type of a corner tracker object created"];
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
    v31[0] = v13;
    v31[1] = v15;
    double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v26 forKeyedSubscript:v4];
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v12 = *(void *)(a1 + 48);
  id v28 = 0;
  uint64_t v13 = [v3 trackInFrame:v12 error:&v28];
  id v14 = v28;
  id v15 = v14;
  if (!v13)
  {
    if (!v14)
    {
      id v15 = +[VNError errorForInternalErrorWithLocalizedDescription:@"tracking of one or more of the rectangle corners failed"];
    }
    double v26 = [MEMORY[0x1E4F1CA98] null];
    v30[0] = v26;
    v30[1] = v15;
    id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v27 forKeyedSubscript:v4];

    uint64_t v13 = 0;
    goto LABEL_9;
  }
  if ([v13 count] == 1)
  {
    long long v16 = [v13 objectAtIndexedSubscript:0];
    v29[0] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
    v29[1] = v17;
    float v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v18 forKeyedSubscript:v4];

    uint64_t v19 = [v4 UTF8String];
    VNValidatedLog(1, @"trackInFrame finished for %s", v20, v21, v22, v23, v24, v25, v19);
  }
LABEL_10:
}

- (id)setTrackedObjects:(id)a3 inFrame:(id)a4 error:(id *)a5
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(VNRectangleTracker *)self _parseInputObservations:v8 imageBuffer:v9 error:a5];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  if ([v10 count] == 1)
  {
    uint64_t v12 = [v11 allValues];
    uint64_t v13 = [v12 objectAtIndexedSubscript:0];

    uint64_t v39 = 0;
    int64x2_t v40 = &v39;
    uint64_t v41 = 0x3032000000;
    id v42 = __Block_byref_object_copy__7445;
    uint64_t v43 = __Block_byref_object_dispose__7446;
    id v44 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v14 = (void *)v40[5];
    id v15 = [MEMORY[0x1E4F1CA98] null];
    [v14 setObject:v15 forKey:@"VNRectangleTracking_BottomLeftTracker"];

    long long v16 = (void *)v40[5];
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
    [v16 setObject:v17 forKey:@"VNRectangleTracking_BottomRightTracker"];

    float v18 = (void *)v40[5];
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
    [v18 setObject:v19 forKey:@"VNRectangleTracking_TopLeftTracker"];

    uint64_t v20 = (void *)v40[5];
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
    [v20 setObject:v21 forKey:@"VNRectangleTracking_TopRightTracker"];

    dispatch_group_t v22 = dispatch_group_create();
    uint64_t v23 = [(VNTracker *)self originatingRequestSpecifier];
    cornerTrackersImpl = self->_cornerTrackersImpl;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __54__VNRectangleTracker_setTrackedObjects_inFrame_error___block_invoke;
    v32[3] = &unk_1E5B1CAE0;
    uint64_t v25 = v22;
    uint64_t v33 = v25;
    uint64_t v34 = self;
    v38 = &v39;
    id v26 = v13;
    id v35 = v26;
    id v27 = v23;
    id v36 = v27;
    id v37 = v9;
    [(NSMutableDictionary *)cornerTrackersImpl enumerateKeysAndObjectsUsingBlock:v32];
    dispatch_group_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
    id v28 = [(VNRectangleTracker *)self _convertCornerObservationsToRectangleObservation:v40[5] error:a5];
    uint64_t v29 = v28;
    if (v28)
    {
      [v28 boundingBox];
      -[VNTracker setLastTrackedBBox:](self, "setLastTrackedBBox:");
      [(VNTracker *)self setTrackedFrameNumber:0];
      v45[0] = v29;
      uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
    }
    else
    {
      uint64_t v30 = 0;
    }

    _Block_object_dispose(&v39, 8);
    goto LABEL_10;
  }
  if (a5)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:@"No objects to track passed to the tracker"];
    uint64_t v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    uint64_t v30 = 0;
  }
LABEL_10:

  return v30;
}

void __54__VNRectangleTracker_setTrackedObjects_inFrame_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(a1 + 32);
  id v8 = *(NSObject **)(*(void *)(a1 + 40) + 104);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__VNRectangleTracker_setTrackedObjects_inFrame_error___block_invoke_2;
  v11[3] = &unk_1E5B1CAB8;
  id v12 = v5;
  id v13 = v6;
  uint64_t v17 = *(void *)(a1 + 72);
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  id v9 = v6;
  id v10 = v5;
  dispatch_group_async(v7, v8, v11);
}

void __54__VNRectangleTracker_setTrackedObjects_inFrame_error___block_invoke_2(uint64_t a1)
{
  v37[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) UTF8String];
  VNValidatedLog(1, @"setTrackedObjects finished for %s", v3, v4, v5, v6, v7, v8, v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    rect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    rect.size = v9;
    CFDictionaryRef v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 32)];
    BOOL v11 = CGRectMakeWithDictionaryRepresentation(v10, &rect);

    if (v11)
    {
      id v12 = [VNDetectedObjectObservation alloc];
      id v13 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:](v12, "initWithOriginatingRequestSpecifier:boundingBox:", *(void *)(a1 + 56), rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
      id v14 = *(void **)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 64);
      id v32 = 0;
      id v16 = [v14 setTrackedObjects:v13 inFrame:v15 error:&v32];
      id v17 = v32;
      if (v16 && [v16 count] == 1)
      {
        float v18 = [v16 objectAtIndexedSubscript:0];
        v34[0] = v18;
        uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
        v34[1] = v19;
        uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
        [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v20 forKeyedSubscript:*(void *)(a1 + 32)];

        uint64_t v21 = [*(id *)(a1 + 32) UTF8String];
        VNValidatedLog(1, @"setTrackedObjects finished for %s", v22, v23, v24, v25, v26, v27, v21);
      }
      else
      {
        if (!v17)
        {
          id v17 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Setting input rectangles to one of the rectangle corners failed"];
        }
        uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
        v35[0] = v30;
        v35[1] = v17;
        uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
        [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v31 forKeyedSubscript:*(void *)(a1 + 32)];
      }
    }
    else
    {
      id v17 = +[VNError errorForInternalErrorWithLocalizedDescription:@"initialization of internal object"];
      id v13 = [MEMORY[0x1E4F1CA98] null];
      v36[0] = v13;
      v36[1] = v17;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v16 forKeyedSubscript:*(void *)(a1 + 32)];
    }
  }
  else
  {
    id v17 = +[VNError errorForInternalErrorWithLocalizedDescription:@"wrong type of a corner tracker allocated"];
    id v28 = [MEMORY[0x1E4F1CA98] null];
    v37[0] = v28;
    v37[1] = v17;
    uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v29 forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

- (VNRectangleTracker)initWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VNRectangleTracker;
  uint64_t v7 = [(VNTracker *)&v25 initWithOptions:v6 error:a4];
  if (v7)
  {
    uint64_t v19 = +[VNRectangleTracker trackedCorners];
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v19, "count"));
    cornerTrackersImpl = v7->_cornerTrackersImpl;
    v7->_cornerTrackersImpl = (NSMutableDictionary *)v8;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v19;
    uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          id v14 = [[VNObjectTrackerRevision1 alloc] initWithOptions:v6 error:a4];
          if (!v14)
          {

            goto LABEL_13;
          }
          [(NSMutableDictionary *)v7->_cornerTrackersImpl setObject:v14 forKey:v13];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v15 = [v6 objectForKeyedSubscript:@"VNTrackingOption_ProcessingQueue"];
    rectangleTrackingProcessingQueue = v7->_rectangleTrackingProcessingQueue;
    v7->_rectangleTrackingProcessingQueue = (OS_dispatch_queue *)v15;

    if (v7->_rectangleTrackingProcessingQueue)
    {
      id v17 = v7;
    }
    else if (a4)
    {
      +[VNError errorForMissingOptionNamed:@"VNTrackingOption_ProcessingQueue"];
      id v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_13:
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (id)_trackingRectAroundPoint:(CGPoint)a3 trackingRectSize:(CGSize)a4
{
  {
    CGFloat height = a4.height;
    CGFloat width = a4.width;
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    a4.CGFloat width = width;
    a3.CGFloat x = x;
    a3.CGFloat y = y;
    a4.CGFloat height = height;
    if (v8)
    {
      *(void *)+[VNRectangleTracker _trackingRectAroundPoint:trackingRectSize:]::fullFrame = 0;
      *(void *)&+[VNRectangleTracker _trackingRectAroundPoint:trackingRectSize:]::fullFrame[8] = 0;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)&+[VNRectangleTracker _trackingRectAroundPoint:trackingRectSize:]::fullFrame[16] = _Q0;
      a4.CGFloat width = width;
      a3.CGFloat x = x;
      a3.CGFloat y = y;
      a4.CGFloat height = height;
    }
  }
  CGFloat v4 = a3.x - a4.width * 0.5;
  CGFloat v5 = a3.y - a4.height * 0.5;
  CGRect v19 = CGRectIntersection(*(CGRect *)&a4.width, *(CGRect *)+[VNRectangleTracker _trackingRectAroundPoint:trackingRectSize:]::fullFrame);
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v19);

  return DictionaryRepresentation;
}

+ (id)trackedCorners
{
  if (+[VNRectangleTracker trackedCorners]::onceToken != -1) {
    dispatch_once(&+[VNRectangleTracker trackedCorners]::onceToken, &__block_literal_global_7517);
  }
  uint64_t v2 = (void *)+[VNRectangleTracker trackedCorners]::trackedCorners;

  return v2;
}

void __36__VNRectangleTracker_trackedCorners__block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VNRectangleTracking_BottomLeftTracker";
  v2[1] = @"VNRectangleTracking_BottomRightTracker";
  v2[2] = @"VNRectangleTracking_TopLeftTracker";
  v2[3] = @"VNRectangleTracking_TopRightTracker";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  v1 = (void *)+[VNRectangleTracker trackedCorners]::trackedCorners;
  +[VNRectangleTracker trackedCorners]::trackedCorners = v0;
}

+ (Class)trackerObservationClass
{
  return (Class)objc_opt_class();
}

+ (id)supportedComputeDevicesForOptions:(id)a3 error:(id *)a4
{
  CGFloat v4 = +[VNComputeDeviceUtilities allCPUComputeDevices];

  return v4;
}

@end