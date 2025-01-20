@interface VCPHandGestureImageRequest
+ (BOOL)heuristicHeart:(id)a3 andRightHand:(id)a4 rotationInDegrees:(int)a5 relax:(BOOL)a6;
+ (BOOL)heuristicIsIndexMiddleTooClose:(id)a3 rotationInDegrees:(int)a4;
+ (BOOL)heuristicIsThumbOpenWide:(id)a3 rotationInDegrees:(int)a4 isRelaxed:(BOOL)a5;
+ (BOOL)isFistClosedTight:(id)a3 rotationInDegrees:(int)a4 scalingFactor:(float)a5;
+ (BOOL)isFistClosedTightOccluded:(id)a3 rotationInDegrees:(int)a4 scalingFactor:(float)a5 palmScale:(float)a6;
+ (float)tiltingAngleForHand:(id)a3 srcKeypointType:(int)a4 dstKeypointType:(int)a5 rotationInDegrees:(int)a6;
+ (unint64_t)heuristicFingerOpenness:(id)a3 rotationInDegrees:(int)a4;
- (BOOL)updateWithOptions:(id)a3 error:(id *)a4;
- (VCPHandGestureImageRequest)init;
- (VCPHandGestureImageRequest)initWithOptions:(id)a3;
- (id)processImage:(__CVBuffer *)a3 withOptions:(id)a4 error:(id *)a5;
- (id)taxonomyMappingStatic;
- (int)heuristicThumb:(id)a3 rotationInDegrees:(int)a4;
- (void)processImage:(__CVBuffer *)a3 withOptions:(id)a4 completion:(id)a5;
- (void)updateWithOptions:(id)a3 completion:(id)a4;
@end

@implementation VCPHandGestureImageRequest

- (VCPHandGestureImageRequest)init
{
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "Not implemented, please use initWithOptions", v5, 2u);
    }
  }
  return 0;
}

- (VCPHandGestureImageRequest)initWithOptions:(id)a3
{
  id v4 = a3;
  v5 = VCPSignPostLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = VCPSignPostLog();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "VCPHandGestureImageRequest_initWithOptions", "", buf, 2u);
  }

  v23.receiver = self;
  v23.super_class = (Class)VCPHandGestureImageRequest;
  v9 = [(VCPRequest *)&v23 initWithOptions:v4];
  if (v9)
  {
    v10 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v4];
    v11 = [v4 objectForKeyedSubscript:@"handPoseLite"];

    if (!v11) {
      [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"handPoseLite"];
    }
    [v10 setObject:&unk_1F15EB8F8 forKeyedSubscript:@"revision"];
    v12 = [[VCPHandPoseImageRequest alloc] initWithOptions:v10];
    handPoseRequest = v9->handPoseRequest;
    v9->handPoseRequest = v12;

    v14 = [[VCPCoreMLRequest alloc] initWithModelName:@"hand_gesture_static"];
    gestureCoreMLRequest = v9->gestureCoreMLRequest;
    v9->gestureCoreMLRequest = v14;

    if (!v9->handPoseRequest
      || !v9->gestureCoreMLRequest
      || (queue = v9->_queue, v9->_queue = 0, queue, v9->super._useAsync)
      && (dispatch_queue_t v17 = dispatch_queue_create("VCPHandGestureImageRequestSerialQueue", 0),
          v18 = v9->_queue,
          v9->_queue = (OS_dispatch_queue *)v17,
          v18,
          !v9->_queue))
    {
      v20 = 0;
      goto LABEL_17;
    }
  }
  v19 = VCPSignPostLog();
  v10 = v19;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_END, v6, "VCPHandGestureImageRequest_initWithOptions", "", buf, 2u);
  }
  v20 = v9;
LABEL_17:

  v21 = v20;
  return v21;
}

- (id)taxonomyMappingStatic
{
  v5[12] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1F15EB910;
  v4[1] = &unk_1F15EB940;
  v5[0] = &unk_1F15EB928;
  v5[1] = &unk_1F15EB958;
  v4[2] = &unk_1F15EB970;
  v4[3] = &unk_1F15EB9A0;
  v5[2] = &unk_1F15EB988;
  v5[3] = &unk_1F15EB940;
  v4[4] = &unk_1F15EB928;
  v4[5] = &unk_1F15EB958;
  v5[4] = &unk_1F15EB9B8;
  v5[5] = &unk_1F15EB9D0;
  v4[6] = &unk_1F15EB9E8;
  v4[7] = &unk_1F15EBA00;
  v5[6] = &unk_1F15EB910;
  v5[7] = &unk_1F15EBA00;
  v4[8] = &unk_1F15EB988;
  v4[9] = &unk_1F15EBA18;
  v5[8] = &unk_1F15EB9E8;
  v5[9] = &unk_1F15EB9A0;
  v4[10] = &unk_1F15EB9D0;
  v4[11] = &unk_1F15EB9B8;
  v5[10] = &unk_1F15EBA18;
  v5[11] = &unk_1F15EB970;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:12];
  return v2;
}

- (int)heuristicThumb:(id)a3 rotationInDegrees:(int)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_signpost_id_t v6 = [v5 keypoints];
  v7 = [v6 objectAtIndexedSubscript:5];

  v8 = [v5 keypoints];
  v9 = [v8 objectAtIndexedSubscript:13];

  [v7 location];
  transformLocation(v25, 0, a4);
  double v11 = v10;
  double v13 = v12;
  [v9 location];
  transformLocation(v26, 0, a4);
  float v16 = atan2(v11 - v14, v13 - v15);
  float v17 = v16 * 180.0 / 3.14159265;
  float v18 = fabsf(v17);
  if (v18 >= 40.0)
  {
    if (v18 <= 140.0)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v20 = VCPLogInstance();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          int v22 = 134217984;
          double v23 = v18;
          _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEBUG, "thumbs angle %f", (uint8_t *)&v22, 0xCu);
        }
      }
      int v19 = 0;
    }
    else
    {
      int v19 = 12;
    }
  }
  else
  {
    int v19 = 9;
  }

  return v19;
}

+ (BOOL)heuristicIsThumbOpenWide:(id)a3 rotationInDegrees:(int)a4 isRelaxed:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = v7;
  if (v7 && ([v7 bounds], v9 > 0.0))
  {
    double v10 = [v8 keypoints];
    double v11 = v10;
    if (!v10) {
      goto LABEL_16;
    }
    double v12 = [v10 objectAtIndexedSubscript:4];
    double v13 = keyPointPosition(v12, a4);

    double v14 = [v11 objectAtIndexedSubscript:3];
    double v15 = keyPointPosition(v14, a4);

    float v16 = [v11 objectAtIndexedSubscript:5];
    double v17 = keyPointPosition(v16, a4);

    float v18 = [v11 objectAtIndexedSubscript:13];
    double v19 = keyPointPosition(v18, a4);

    float32x2_t v20 = vsub_f32(*(float32x2_t *)&v13, *(float32x2_t *)&v15);
    LODWORD(v13) = atan2f(v20.f32[1], v20.f32[0]);
    float32x2_t v21 = vsub_f32(*(float32x2_t *)&v17, *(float32x2_t *)&v19);
    float v22 = fabsf(*(float *)&v13 - atan2f(v21.f32[1], v21.f32[0]));
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      double v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        int v24 = [v8 chirality];
        CGPoint v25 = "right";
        if (v24 == -1) {
          CGPoint v25 = "left";
        }
        int v29 = 136315394;
        v30 = v25;
        __int16 v31 = 2048;
        double v32 = v22;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "VCPHandGestureImageRequest : %s, thumbPalmLineAngle %f", (uint8_t *)&v29, 0x16u);
      }
    }
    double v26 = v5 ? 1.03672562 : 0.785398163;
    if (v22 < v26) {
      BOOL v27 = 1;
    }
    else {
LABEL_16:
    }
      BOOL v27 = 0;
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

+ (BOOL)heuristicIsIndexMiddleTooClose:(id)a3 rotationInDegrees:(int)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_signpost_id_t v6 = v5;
  if (v5 && ([v5 bounds], v7 > 0.0))
  {
    v8 = [v6 keypoints];
    double v9 = v8;
    if (!v8) {
      goto LABEL_13;
    }
    double v10 = [v8 objectAtIndexedSubscript:8];
    double v11 = keyPointPosition(v10, a4);

    double v12 = [v9 objectAtIndexedSubscript:12];
    double v13 = keyPointPosition(v12, a4);

    double v14 = [v9 objectAtIndexedSubscript:5];
    double v15 = keyPointPosition(v14, a4);

    float v16 = [v9 objectAtIndexedSubscript:9];
    double v17 = keyPointPosition(v16, a4);

    float32x2_t v18 = vsub_f32(*(float32x2_t *)&v11, *(float32x2_t *)&v13);
    int32x2_t v19 = (int32x2_t)vmul_f32(v18, v18);
    float32x2_t v20 = vsub_f32(*(float32x2_t *)&v15, *(float32x2_t *)&v17);
    int32x2_t v21 = (int32x2_t)vmul_f32(v20, v20);
    float32x2_t v22 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v19, v21), (float32x2_t)vzip2_s32(v19, v21)));
    if (vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v22, 1), v22).u8[0])
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        double v23 = VCPLogInstance();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          int v24 = [v6 chirality];
          CGPoint v25 = "right";
          if (v24 == -1) {
            CGPoint v25 = "left";
          }
          int v28 = 136315138;
          int v29 = v25;
          _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "VCPHandGestureImageRequest : %s hand victory FP check: index and middle tips are too close", (uint8_t *)&v28, 0xCu);
        }
      }
      BOOL v26 = 1;
    }
    else
    {
LABEL_13:
      BOOL v26 = 0;
    }
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

+ (float)tiltingAngleForHand:(id)a3 srcKeypointType:(int)a4 dstKeypointType:(int)a5 rotationInDegrees:(int)a6
{
  id v9 = a3;
  double v10 = v9;
  if (v9)
  {
    double v11 = [v9 keypoints];

    if (a5 <= 20 && a4 <= 20 && ((a5 | a4) & 0x80000000) == 0 && v11)
    {
      double v12 = [v10 keypoints];
      double v13 = [v12 objectAtIndexedSubscript:a4];
      double v14 = keyPointPosition(v13, a6);

      double v15 = [v12 objectAtIndexedSubscript:a5];
      double v16 = keyPointPosition(v15, a6);

      float32x2_t v17 = vsub_f32(*(float32x2_t *)&v16, *(float32x2_t *)&v14);
      float v18 = fabsf(atan2f(fabsf(v17.f32[1]), fabsf(v17.f32[0])));
LABEL_10:

      goto LABEL_11;
    }
  }
  float v18 = 0.0;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    double v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)float32x2_t v20 = 0;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "VCPHandGestureImageRequest : tiltingAngleForHand invalid input", v20, 2u);
    }
    goto LABEL_10;
  }
LABEL_11:

  return v18;
}

+ (BOOL)isFistClosedTight:(id)a3 rotationInDegrees:(int)a4 scalingFactor:(float)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = v7;
  if (v7 && ([v7 keypoints], id v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    double v10 = [v8 keypoints];
    double v11 = [v10 objectAtIndexedSubscript:8];
    double v12 = keyPointPosition(v11, a4);

    double v13 = [v10 objectAtIndexedSubscript:2];
    double v14 = keyPointPosition(v13, a4);

    double v15 = [v10 objectAtIndexedSubscript:4];
    double v16 = keyPointPosition(v15, a4);

    float32x2_t v17 = vsub_f32(*(float32x2_t *)&v12, *(float32x2_t *)&v14);
    float v18 = sqrtf(vaddv_f32(vmul_f32(v17, v17)));
    float32x2_t v19 = vsub_f32(*(float32x2_t *)&v12, *(float32x2_t *)&v16);
    float v20 = sqrtf(vaddv_f32(vmul_f32(v19, v19)));
    float v21 = v20 * a5;
    BOOL v22 = v18 < v21;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      double v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        int v25 = 134218496;
        double v26 = v18;
        __int16 v27 = 2048;
        double v28 = v20;
        __int16 v29 = 1024;
        BOOL v30 = v18 < v21;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "isFistClosedTight: distanceIndexClosed %f, distanceTwoTips %f, isTight %d", (uint8_t *)&v25, 0x1Cu);
      }
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 4)
    {
      BOOL v22 = 0;
      goto LABEL_13;
    }
    double v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEFAULT, "VCPHandGestureImageRequest : isFistClosedTight invalid input", (uint8_t *)&v25, 2u);
    }
    BOOL v22 = 0;
  }

LABEL_13:
  return v22;
}

+ (BOOL)isFistClosedTightOccluded:(id)a3 rotationInDegrees:(int)a4 scalingFactor:(float)a5 palmScale:(float)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  double v10 = v9;
  if (v9 && ([v9 keypoints], double v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    double v12 = [v10 keypoints];
    double v13 = [v12 objectAtIndexedSubscript:8];
    double v14 = keyPointPosition(v13, a4);

    double v15 = [v12 objectAtIndexedSubscript:2];
    double v16 = keyPointPosition(v15, a4);

    float32x2_t v17 = vsub_f32(*(float32x2_t *)&v14, *(float32x2_t *)&v16);
    float v18 = sqrtf(vaddv_f32(vmul_f32(v17, v17)));
    float v19 = a5 * a6;
    BOOL v20 = v18 < v19;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      float v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 134218496;
        double v24 = v18;
        __int16 v25 = 2048;
        double v26 = a6;
        __int16 v27 = 1024;
        BOOL v28 = v18 < v19;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEBUG, "isFistClosedTight: distanceIndexCloseToThumb %f, palmScale %f, isTight %d", (uint8_t *)&v23, 0x1Cu);
      }
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 4)
    {
      BOOL v20 = 0;
      goto LABEL_13;
    }
    double v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "VCPHandGestureImageRequest : isFistClosedTight invalid input", (uint8_t *)&v23, 2u);
    }
    BOOL v20 = 0;
  }

LABEL_13:
  return v20;
}

+ (unint64_t)heuristicFingerOpenness:(id)a3 rotationInDegrees:(int)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_signpost_id_t v6 = v5;
  if (v5 && ([v5 bounds], v7 > 0.0))
  {
    v8 = [v6 keypoints];
    id v9 = v8;
    if (v8)
    {
      double v10 = [v8 objectAtIndexedSubscript:4];
      double v11 = keyPointPosition(v10, a4);

      double v12 = [v9 objectAtIndexedSubscript:2];
      double v46 = keyPointPosition(v12, a4);

      double v13 = [v9 objectAtIndexedSubscript:8];
      double v14 = keyPointPosition(v13, a4);

      double v15 = [v9 objectAtIndexedSubscript:6];
      double v54 = keyPointPosition(v15, a4);

      double v16 = [v9 objectAtIndexedSubscript:5];
      double v53 = keyPointPosition(v16, a4);

      float32x2_t v17 = [v9 objectAtIndexedSubscript:12];
      double v18 = keyPointPosition(v17, a4);

      float v19 = [v9 objectAtIndexedSubscript:10];
      double v52 = keyPointPosition(v19, a4);

      BOOL v20 = [v9 objectAtIndexedSubscript:9];
      double v51 = keyPointPosition(v20, a4);

      float v21 = [v9 objectAtIndexedSubscript:16];
      double v22 = keyPointPosition(v21, a4);

      int v23 = [v9 objectAtIndexedSubscript:14];
      double v50 = keyPointPosition(v23, a4);

      double v24 = [v9 objectAtIndexedSubscript:13];
      double v49 = keyPointPosition(v24, a4);

      __int16 v25 = [v9 objectAtIndexedSubscript:20];
      double v26 = keyPointPosition(v25, a4);

      __int16 v27 = [v9 objectAtIndexedSubscript:18];
      double v48 = keyPointPosition(v27, a4);

      BOOL v28 = [v9 objectAtIndexedSubscript:17];
      double v47 = keyPointPosition(v28, a4);

      uint64_t v29 = [v9 objectAtIndexedSubscript:0];
      double v56 = keyPointPosition(v29, a4);

      float32x2_t v30 = vsub_f32(*(float32x2_t *)&v54, *(float32x2_t *)&v14);
      LODWORD(v14) = atan2f(v30.f32[1], v30.f32[0]);
      v64[0] = *(float *)&v14
             - atan2f(*((float *)&v54 + 1) - *((float *)&v53 + 1), vsub_f32(*(float32x2_t *)&v54, *(float32x2_t *)&v53).f32[0]);
      float32x2_t v31 = vsub_f32(*(float32x2_t *)&v52, *(float32x2_t *)&v18);
      LODWORD(v14) = atan2f(v31.f32[1], v31.f32[0]);
      v64[1] = *(float *)&v14
             - atan2f(*((float *)&v52 + 1) - *((float *)&v51 + 1), vsub_f32(*(float32x2_t *)&v52, *(float32x2_t *)&v51).f32[0]);
      float32x2_t v32 = vsub_f32(*(float32x2_t *)&v50, *(float32x2_t *)&v22);
      LODWORD(v14) = atan2f(v32.f32[1], v32.f32[0]);
      v64[2] = *(float *)&v14
             - atan2f(*((float *)&v50 + 1) - *((float *)&v49 + 1), vsub_f32(*(float32x2_t *)&v50, *(float32x2_t *)&v49).f32[0]);
      float32x2_t v33 = vsub_f32(*(float32x2_t *)&v48, *(float32x2_t *)&v26);
      LODWORD(v14) = atan2f(v33.f32[1], v33.f32[0]);
      v64[3] = *(float *)&v14
             - atan2f(*((float *)&v48 + 1) - *((float *)&v47 + 1), vsub_f32(*(float32x2_t *)&v48, *(float32x2_t *)&v47).f32[0]);
      LODWORD(v14) = atan2f(*((float *)&v53 + 1) - *((float *)&v54 + 1), vsub_f32(*(float32x2_t *)&v53, *(float32x2_t *)&v54).f32[0]);
      v63[0] = *(float *)&v14
             - atan2f(*((float *)&v53 + 1) - *((float *)&v56 + 1), vsub_f32(*(float32x2_t *)&v53, *(float32x2_t *)&v56).f32[0]);
      LODWORD(v14) = atan2f(*((float *)&v51 + 1) - *((float *)&v52 + 1), vsub_f32(*(float32x2_t *)&v51, *(float32x2_t *)&v52).f32[0]);
      v63[1] = *(float *)&v14
             - atan2f(*((float *)&v51 + 1) - *((float *)&v56 + 1), vsub_f32(*(float32x2_t *)&v51, *(float32x2_t *)&v56).f32[0]);
      LODWORD(v14) = atan2f(*((float *)&v49 + 1) - *((float *)&v50 + 1), vsub_f32(*(float32x2_t *)&v49, *(float32x2_t *)&v50).f32[0]);
      v63[2] = *(float *)&v14
             - atan2f(*((float *)&v49 + 1) - *((float *)&v56 + 1), vsub_f32(*(float32x2_t *)&v49, *(float32x2_t *)&v56).f32[0]);
      LODWORD(v14) = atan2f(*((float *)&v47 + 1) - *((float *)&v48 + 1), vsub_f32(*(float32x2_t *)&v47, *(float32x2_t *)&v48).f32[0]);
      v63[3] = *(float *)&v14
             - atan2f(*((float *)&v47 + 1) - *((float *)&v56 + 1), vsub_f32(*(float32x2_t *)&v47, *(float32x2_t *)&v56).f32[0]);
      float32x2_t v55 = vsub_f32(*(float32x2_t *)&v46, *(float32x2_t *)&v11);
      float v34 = atan2f(*((float *)&v46 + 1) - *((float *)&v56 + 1), vsub_f32(*(float32x2_t *)&v46, *(float32x2_t *)&v56).f32[0]);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      do
      {
        double v37 = fabsf(v64[v35]);
        if (v37 > 1.88495557 && v37 < 4.39822973)
        {
          double v38 = fabsf(v63[v35]);
          if (v38 > 1.57079633 && v38 < 4.71238898) {
            v36 |= (2 << v35);
          }
        }
        ++v35;
      }
      while (v35 != 4);
      double v39 = vabds_f32(atan2f(v55.f32[1], v55.f32[0]), v34);
      BOOL v40 = v39 < 3.45575192 && v39 > 2.82743338;
      unint64_t v41 = v36 | v40;
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v42 = VCPLogInstance();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          int v43 = [v6 chirality];
          v44 = "right";
          *(_DWORD *)buf = 136315650;
          if (v43 == -1) {
            v44 = "left";
          }
          v58 = v44;
          __int16 v59 = 1024;
          int v60 = v41;
          __int16 v61 = 2048;
          double v62 = v39;
          _os_log_impl(&dword_1BBEDA000, v42, OS_LOG_TYPE_DEBUG, "VCPHandGestureImageRequest : %s hand raw openness %d, thumbPIPAngle %f", buf, 0x1Cu);
        }
      }
    }
    else
    {
      unint64_t v41 = 0;
    }
  }
  else
  {
    unint64_t v41 = 0;
  }

  return v41;
}

+ (BOOL)heuristicHeart:(id)a3 andRightHand:(id)a4 rotationInDegrees:(int)a5 relax:(BOOL)a6
{
  BOOL v6 = a6;
  v115[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  double v11 = v10;
  BOOL v12 = 0;
  if (v9 && v10)
  {
    double v13 = [v9 keypoints];
    double v14 = [v13 objectAtIndexedSubscript:4];
    double v108 = keyPointPosition(v14, a5);

    double v15 = [v13 objectAtIndexedSubscript:2];
    double v94 = keyPointPosition(v15, a5);

    double v16 = [v13 objectAtIndexedSubscript:8];
    double v104 = keyPointPosition(v16, a5);

    float32x2_t v17 = [v13 objectAtIndexedSubscript:6];
    double v101 = keyPointPosition(v17, a5);

    double v18 = [v13 objectAtIndexedSubscript:12];
    double v103 = keyPointPosition(v18, a5);

    float v19 = [v13 objectAtIndexedSubscript:10];
    double v100 = keyPointPosition(v19, a5);

    BOOL v20 = [v13 objectAtIndexedSubscript:16];
    double v102 = keyPointPosition(v20, a5);

    float v21 = [v13 objectAtIndexedSubscript:14];
    double v99 = keyPointPosition(v21, a5);

    double v22 = [v13 objectAtIndexedSubscript:20];
    double v91 = keyPointPosition(v22, a5);

    int v23 = [v13 objectAtIndexedSubscript:18];
    double v24 = keyPointPosition(v23, a5);
    float v90 = *((float *)&v24 + 1);

    __int16 v25 = [v13 objectAtIndexedSubscript:0];
    double v26 = keyPointPosition(v25, a5);

    __int16 v27 = [v11 keypoints];
    BOOL v28 = [v27 objectAtIndexedSubscript:4];
    double v106 = keyPointPosition(v28, a5);

    uint64_t v29 = [v27 objectAtIndexedSubscript:2];
    double v93 = keyPointPosition(v29, a5);

    float32x2_t v30 = [v27 objectAtIndexedSubscript:8];
    double v107 = keyPointPosition(v30, a5);

    float32x2_t v31 = [v27 objectAtIndexedSubscript:6];
    double v98 = keyPointPosition(v31, a5);

    float32x2_t v32 = [v27 objectAtIndexedSubscript:12];
    double v105 = keyPointPosition(v32, a5);

    float32x2_t v33 = [v27 objectAtIndexedSubscript:10];
    double v97 = keyPointPosition(v33, a5);

    float v34 = [v27 objectAtIndexedSubscript:16];
    double v96 = keyPointPosition(v34, a5);

    uint64_t v35 = [v27 objectAtIndexedSubscript:14];
    double v95 = keyPointPosition(v35, a5);

    uint64_t v36 = [v27 objectAtIndexedSubscript:20];
    double v92 = keyPointPosition(v36, a5);

    double v37 = [v27 objectAtIndexedSubscript:18];
    double v88 = keyPointPosition(v37, a5);

    objc_msgSend(v27, "objectAtIndexedSubscript:", 0, *(void *)&v88);
    double v38 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    double v39 = keyPointPosition(v38, a5);

    BOOL v12 = 0;
    if (*(float *)&v108 < 0.0
      || *(float *)&v94 < 0.0
      || *(float *)&v104 < 0.0
      || *(float *)&v101 < 0.0
      || *(float *)&v103 < 0.0
      || *(float *)&v100 < 0.0
      || *(float *)&v102 < 0.0
      || *(float *)&v99 < 0.0
      || *(float *)&v106 < 0.0
      || *(float *)&v93 < 0.0
      || *(float *)&v107 < 0.0
      || *(float *)&v98 < 0.0
      || *(float *)&v105 < 0.0
      || *(float *)&v97 < 0.0
      || *(float *)&v96 < 0.0
      || *(float *)&v95 < 0.0)
    {
      goto LABEL_74;
    }
    objc_msgSend(v9, "bounds", v95);
    double v41 = v40;
    [v9 bounds];
    uint64_t v43 = 0;
    if (v41 >= v42) {
      double v44 = v42;
    }
    else {
      double v44 = v41;
    }
    *(double *)v115 = v107;
    *(double *)&v115[1] = v105;
    *(double *)&v115[2] = v96;
    *(double *)v114 = v104;
    *(double *)&v114[1] = v103;
    *(double *)&v114[2] = v102;
    unsigned long long v112 = __PAIR128__(*(unint64_t *)&v105, *(unint64_t *)&v107);
    float32x2_t v45 = 0;
    uint64_t v113 = 0;
    *(double *)v111 = v104;
    *(double *)&v111[1] = v103;
    v111[2] = 0;
    *(double *)v110 = v98;
    *(double *)&v110[1] = v97;
    *(double *)&v110[2] = v95;
    *(double *)v109 = v101;
    *(double *)&v109[1] = v100;
    __asm { FMOV            V1.2S, #3.0 }
    *(double *)&v109[2] = v99;
    do
      float32x2_t v45 = vadd_f32(v45, vdiv_f32((float32x2_t)v115[v43++], _D1));
    while (v43 != 3);
    uint64_t v50 = 0;
    float32x2_t v51 = 0;
    do
      float32x2_t v51 = vadd_f32(v51, vdiv_f32((float32x2_t)v114[v50++], _D1));
    while (v50 != 3);
    uint64_t v52 = 0;
    float v53 = v44;
    float32x2_t v54 = 0;
    do
    {
      float32x2_t v54 = vadd_f32(v54, vdiv_f32(*(float32x2_t *)((char *)&v112 + v52), _D1));
      v52 += 8;
    }
    while (v52 != 24);
    uint64_t v55 = 0;
    float32x2_t v56 = 0;
    do
      float32x2_t v56 = vadd_f32(v56, vdiv_f32((float32x2_t)v111[v55++], _D1));
    while (v55 != 3);
    uint64_t v57 = 0;
    float32x2_t v58 = 0;
    do
      float32x2_t v58 = vadd_f32(v58, vdiv_f32((float32x2_t)v110[v57++], _D1));
    while (v57 != 3);
    uint64_t v59 = 0;
    float32x2_t v60 = 0;
    do
      float32x2_t v60 = vadd_f32(v60, vdiv_f32((float32x2_t)v109[v59++], _D1));
    while (v59 != 3);
    float32x2_t v61 = vmul_f32(vadd_f32(v45, v51), (float32x2_t)0x3F0000003F000000);
    float32x2_t v62 = vmul_f32(vadd_f32(*(float32x2_t *)&v108, *(float32x2_t *)&v106), (float32x2_t)0x3F0000003F000000);
    float32x2_t v63 = vsub_f32(v45, v51);
    float v64 = sqrtf(vaddv_f32(vmul_f32(v63, v63)));
    float v65 = v53 * 0.2;
    if (v6)
    {
      float32x2_t v66 = vsub_f32(v54, v56);
      float v67 = sqrtf(vaddv_f32(vmul_f32(v66, v66)));
      _NF = v64 < v65 || v67 < v65;
      float32x2_t v69 = vsub_f32(*(float32x2_t *)&v107, *(float32x2_t *)&v104);
      float v70 = sqrtf(vaddv_f32(vmul_f32(v69, v69)));
      BOOL v71 = _NF || v70 < v65;
      float32x2_t v72 = vsub_f32(*(float32x2_t *)&v105, *(float32x2_t *)&v103);
      float v73 = sqrtf(vaddv_f32(vmul_f32(v72, v72)));
      if (v71 || v73 < v65)
      {
        float32x2_t v75 = vsub_f32(*(float32x2_t *)&v106, *(float32x2_t *)&v108);
        if (sqrtf(vaddv_f32(vmul_f32(v75, v75))) < v65)
        {
          float32x2_t v76 = vsub_f32(*(float32x2_t *)&v106, *(float32x2_t *)&v107);
          if (sqrtf(vaddv_f32(vmul_f32(v76, v76))) >= v65)
          {
            float32x2_t v77 = vsub_f32(*(float32x2_t *)&v106, *(float32x2_t *)&v105);
            if (sqrtf(vaddv_f32(vmul_f32(v77, v77))) >= v65)
            {
              float32x2_t v78 = vsub_f32(*(float32x2_t *)&v106, *(float32x2_t *)&v96);
              if (sqrtf(vaddv_f32(vmul_f32(v78, v78))) >= v65)
              {
                float32x2_t v79 = vsub_f32(*(float32x2_t *)&v106, *(float32x2_t *)&v92);
                if (sqrtf(vaddv_f32(vmul_f32(v79, v79))) >= v65)
                {
                  float32x2_t v80 = vsub_f32(*(float32x2_t *)&v108, *(float32x2_t *)&v104);
                  if (sqrtf(vaddv_f32(vmul_f32(v80, v80))) >= v65)
                  {
                    float32x2_t v81 = vsub_f32(*(float32x2_t *)&v108, *(float32x2_t *)&v103);
                    if (sqrtf(vaddv_f32(vmul_f32(v81, v81))) >= v65)
                    {
                      float32x2_t v82 = vsub_f32(*(float32x2_t *)&v108, *(float32x2_t *)&v102);
                      if (sqrtf(vaddv_f32(vmul_f32(v82, v82))) >= v65)
                      {
                        float32x2_t v83 = vsub_f32(*(float32x2_t *)&v108, *(float32x2_t *)&v91);
                        if (sqrtf(vaddv_f32(vmul_f32(v83, v83))) >= v65)
                        {
                          BOOL v12 = 0;
                          float32x2_t v84 = vsub_f32(*(float32x2_t *)&v39, *(float32x2_t *)&v26);
                          if (sqrtf(vaddv_f32(vmul_f32(v84, v84))) < v65 || (vcgt_f32(v61, v62).i32[1] & 1) == 0) {
                            goto LABEL_74;
                          }
                          if (*((float *)&v93 + 1) * 1.1 >= *((float *)&v106 + 1)
                            && *((float *)&v98 + 1) * 1.1 >= *((float *)&v107 + 1)
                            && *((float *)&v97 + 1) * 1.1 >= *((float *)&v105 + 1)
                            && *((float *)&v95 + 1) * 1.1 >= *((float *)&v96 + 1)
                            && v89 * 1.1 >= *((float *)&v92 + 1)
                            && *((float *)&v94 + 1) * 1.1 >= *((float *)&v108 + 1)
                            && *((float *)&v101 + 1) * 1.1 >= *((float *)&v104 + 1)
                            && *((float *)&v100 + 1) * 1.1 >= *((float *)&v103 + 1)
                            && *((float *)&v99 + 1) * 1.1 >= *((float *)&v102 + 1))
                          {
                            BOOL v12 = v90 * 1.1 >= *((float *)&v91 + 1);
LABEL_74:

                            goto LABEL_75;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else if (v64 < v65)
    {
      float32x2_t v85 = vsub_f32(*(float32x2_t *)&v106, *(float32x2_t *)&v108);
      if (sqrtf(vaddv_f32(vmul_f32(v85, v85))) < v65)
      {
        float32x2_t v86 = vsub_f32(v62, v61);
        if (vaddv_f32(vmul_f32(v86, vsub_f32(v51, v60))) > -0.01
          && vaddv_f32(vmul_f32(v86, vsub_f32(v45, v58))) > -0.01
          && vaddv_f32(vmul_f32(vsub_f32(*(float32x2_t *)&v108, *(float32x2_t *)&v94), v86)) > -0.01)
        {
          BOOL v12 = vaddv_f32(vmul_f32(vsub_f32(*(float32x2_t *)&v106, *(float32x2_t *)&v93), v86)) > -0.01;
          goto LABEL_74;
        }
      }
    }
    BOOL v12 = 0;
    goto LABEL_74;
  }
LABEL_75:

  return v12;
}

- (id)processImage:(__CVBuffer *)a3 withOptions:(id)a4 error:(id *)a5
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  double v96 = (NSDictionary *)a4;
  BOOL v6 = VCPSignPostLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  v8 = VCPSignPostLog();
  id v9 = v8;
  unint64_t v91 = v7 - 1;
  os_signpost_id_t spid = v7;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "VCPHandGestureImageRequest_processImage", "", buf, 2u);
  }

  double v94 = [(VCPHandPoseImageRequest *)self->handPoseRequest processImage:a3 withOptions:v96 error:a5];
  unsigned int RotationInDegrees = getRotationInDegrees(v96);
  int maxNumOfPersons = self->super._maxNumOfPersons;
  if (maxNumOfPersons >= 3) {
    int maxNumOfPersons = 3;
  }
  if (maxNumOfPersons <= 1) {
    int maxNumOfPersons = 1;
  }
  int v102 = maxNumOfPersons;
  v109 = [MEMORY[0x1E4F1CA48] array];
  double v11 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  obuint64_t j = v94;
  uint64_t v12 = [obj countByEnumeratingWithState:&v131 objects:v148 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v132;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v132 != v13) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v131 + 1) + 8 * i);
        double v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "groupID"));
        float32x2_t v17 = [v11 objectForKeyedSubscript:v16];
        BOOL v18 = v17 == 0;

        if (v18)
        {
          float v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v15, 0);
          BOOL v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "groupID"));
          [v11 setObject:v19 forKeyedSubscript:v20];
        }
        else
        {
          float v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "groupID"));
          BOOL v20 = [v11 objectForKeyedSubscript:v19];
          [v20 addObject:v15];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v131 objects:v148 count:16];
    }
    while (v12);
  }

  float v21 = [v11 allKeys];
  int v22 = [v21 count];
  int v23 = v102;
  if (v102 >= v22) {
    int v23 = v22;
  }
  int v95 = v23;

  double v108 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v105 = [v11 allKeys];
  uint64_t v24 = [v105 countByEnumeratingWithState:&v127 objects:v147 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v128;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v128 != v25) {
          objc_enumerationMutation(v105);
        }
        uint64_t v27 = *(void *)(*((void *)&v127 + 1) + 8 * j);
        BOOL v28 = [v11 objectForKeyedSubscript:v27];
        if ([v28 count])
        {
          long long v125 = 0u;
          long long v126 = 0u;
          long long v123 = 0u;
          long long v124 = 0u;
          id v29 = v28;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v123 objects:v146 count:16];
          if (v30)
          {
            uint64_t v31 = *(void *)v124;
            float v32 = 0.0;
            do
            {
              for (uint64_t k = 0; k != v30; ++k)
              {
                if (*(void *)v124 != v31) {
                  objc_enumerationMutation(v29);
                }
                float v32 = v32 + handArea(*(VCPHandObservation **)(*((void *)&v123 + 1) + 8 * k));
              }
              uint64_t v30 = [v29 countByEnumeratingWithState:&v123 objects:v146 count:16];
            }
            while (v30);
          }
          else
          {
            float v32 = 0.0;
          }

          *(float *)&double v34 = v32 / (float)(unint64_t)[v29 count];
          uint64_t v35 = [NSNumber numberWithFloat:v34];
          [v108 setObject:v35 forKeyedSubscript:v27];
        }
      }
      uint64_t v24 = [v105 countByEnumeratingWithState:&v127 objects:v147 count:16];
    }
    while (v24);
  }

  uint64_t v36 = [v108 keysSortedByValueUsingComparator:&__block_literal_global_31];
  double v97 = v36;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    double v37 = VCPLogInstance();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v141 = v36;
      __int16 v142 = 1024;
      int v143 = v102;
      __int16 v144 = 1024;
      int v145 = v95;
      _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_DEBUG, "VCPHandGestureVideoRequest - sorted groupIDs based on hand size = %@, max number of persons = %d, number of valid persons = %d", buf, 0x18u);
    }
  }
  uint64_t v38 = 0;
  while (1)
  {
    int v39 = [v36 count];
    int v40 = v95 >= v39 ? v39 : v95;
    if (v38 >= v40) {
      break;
    }
    double v41 = [v36 objectAtIndexedSubscript:v38];
    uint64_t v93 = v38;
    double v42 = [v11 objectForKeyedSubscript:v41];

    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id v99 = v42;
    uint64_t v43 = [v99 countByEnumeratingWithState:&v119 objects:v139 count:16];
    if (!v43) {
      goto LABEL_68;
    }
    uint64_t v98 = *(void *)v120;
    while (2)
    {
      for (uint64_t m = 0; m != v43; ++m)
      {
        if (*(void *)v120 != v98) {
          objc_enumerationMutation(v99);
        }
        float32x2_t v45 = *(void **)(*((void *)&v119 + 1) + 8 * m);
        double v46 = [[VCPCoreMLFeatureProviderGesture alloc] initWith:v45 rotationInDegrees:RotationInDegrees];
        double v103 = v46;
        if (!v46)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            p_super = VCPLogInstance();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, p_super, OS_LOG_TYPE_ERROR, "Failed to create VCPCoreMLFeatureProviderGesture", buf, 2u);
            }
LABEL_118:
          }
          if (a5)
          {
            float32x2_t v84 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v135 = *MEMORY[0x1E4F28568];
            float32x2_t v85 = [NSString stringWithFormat:@"Error: failed to processImage"];
            v136 = v85;
            float32x2_t v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
            *a5 = [v84 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v86];
          }
          id v87 = 0;
          goto LABEL_122;
        }
        double v47 = [(VCPCoreMLRequest *)self->gestureCoreMLRequest model];
        id v106 = [v47 predictionFromFeatures:v46 error:a5];

        if (!v106)
        {
          p_super = &v46->super;
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_118;
          }
          float32x2_t v82 = VCPLogInstance();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v82, OS_LOG_TYPE_ERROR, "Failed to get output feature", buf, 2u);
          }

          goto LABEL_117;
        }
        double v48 = [v106 featureValueForName:@"output"];
        id v49 = [v48 multiArrayValue];
        uint64_t v50 = [v49 dataPointer];

        if (!v50)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            float32x2_t v83 = VCPLogInstance();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              goto LABEL_114;
            }
LABEL_115:
          }
LABEL_116:

LABEL_117:
          p_super = &v46->super;
          goto LABEL_118;
        }
        float32x2_t v51 = [v48 multiArrayValue];
        BOOL v52 = [v51 count] == 12;

        if (!v52)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            float32x2_t v83 = VCPLogInstance();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
LABEL_114:
              _os_log_impl(&dword_1BBEDA000, v83, OS_LOG_TYPE_ERROR, "Failed to get multierarrayvalue", buf, 2u);
            }
            goto LABEL_115;
          }
          goto LABEL_116;
        }
        uint64_t v53 = 0;
        uint64_t v54 = 0;
        float v55 = 0.0;
        while (1)
        {
          float32x2_t v56 = [v48 multiArrayValue];
          BOOL v57 = [v56 count] > v53;

          if (!v57) {
            break;
          }
          float v58 = *(float *)(v50 + 4 * v53);
          if (v58 <= v55) {
            uint64_t v54 = v54;
          }
          else {
            uint64_t v54 = v53;
          }
          if (v58 > v55) {
            float v55 = *(float *)(v50 + 4 * v53);
          }
          ++v53;
        }
        uint64_t v59 = [(VCPHandGestureImageRequest *)self taxonomyMappingStatic];
        float32x2_t v60 = [NSNumber numberWithInt:v54];
        float32x2_t v61 = [v59 objectForKeyedSubscript:v60];
        objc_msgSend(v45, "setGestureType:", objc_msgSend(v61, "intValue"));

        if ([v45 gestureType] == 9) {
          objc_msgSend(v45, "setGestureType:", -[VCPHandGestureImageRequest heuristicThumb:rotationInDegrees:](self, "heuristicThumb:rotationInDegrees:", v45, RotationInDegrees));
        }
        *(float *)&double v62 = v55;
        [v45 setGestureConfidence:v62];
      }
      uint64_t v43 = [v99 countByEnumeratingWithState:&v119 objects:v139 count:16];
      if (v43) {
        continue;
      }
      break;
    }
LABEL_68:

    if ((unint64_t)[v99 count] < 2) {
      goto LABEL_93;
    }
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v107 = v99;
    uint64_t v63 = [v107 countByEnumeratingWithState:&v115 objects:v138 count:16];
    if (!v63)
    {

      float v65 = 0;
      float v64 = 0;
      goto LABEL_92;
    }
    float v64 = 0;
    float v65 = 0;
    uint64_t v66 = *(void *)v116;
    while (2)
    {
      uint64_t v67 = 0;
      while (2)
      {
        if (*(void *)v116 != v66) {
          objc_enumerationMutation(v107);
        }
        v68 = *(VCPHandObservation **)(*((void *)&v115 + 1) + 8 * v67);
        if ([(VCPHandObservation *)v68 chirality] != -1)
        {
          if ([(VCPHandObservation *)v68 chirality] != 1) {
            goto LABEL_85;
          }
          if (v65)
          {
            float v69 = handArea(v65);
            float v70 = v65;
            BOOL v71 = v64;
            float32x2_t v72 = v68;
            if (v69 >= handArea(v68)) {
              goto LABEL_85;
            }
          }
          else
          {
            float v70 = 0;
            BOOL v71 = v64;
            float32x2_t v72 = v68;
          }
          goto LABEL_84;
        }
        if (!v64)
        {
          float v70 = 0;
          BOOL v71 = v68;
          float32x2_t v72 = v65;
          goto LABEL_84;
        }
        float v73 = handArea(v64);
        float v70 = v64;
        BOOL v71 = v68;
        float32x2_t v72 = v65;
        if (v73 < handArea(v68))
        {
LABEL_84:
          v74 = v68;

          float v64 = v71;
          float v65 = v72;
        }
LABEL_85:
        if (v63 != ++v67) {
          continue;
        }
        break;
      }
      uint64_t v63 = [v107 countByEnumeratingWithState:&v115 objects:v138 count:16];
      if (v63) {
        continue;
      }
      break;
    }

    if (v64
      && v65
      && [(id)objc_opt_class() heuristicHeart:v64 andRightHand:v65 rotationInDegrees:RotationInDegrees relax:0])
    {
      [(VCPHandObservation *)v64 setGestureType:15];
      LODWORD(v75) = 0.5;
      [(VCPHandObservation *)v64 setGestureConfidence:v75];
      [(VCPHandObservation *)v65 setGestureType:15];
      LODWORD(v76) = 0.5;
      [(VCPHandObservation *)v65 setGestureConfidence:v76];
    }
LABEL_92:

LABEL_93:
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id v77 = v99;
    uint64_t v78 = [v77 countByEnumeratingWithState:&v111 objects:v137 count:16];
    if (v78)
    {
      uint64_t v79 = *(void *)v112;
      do
      {
        for (uint64_t n = 0; n != v78; ++n)
        {
          if (*(void *)v112 != v79) {
            objc_enumerationMutation(v77);
          }
          [v109 addObject:*(void *)(*((void *)&v111 + 1) + 8 * n)];
        }
        uint64_t v78 = [v77 countByEnumeratingWithState:&v111 objects:v137 count:16];
      }
      while (v78);
    }

    uint64_t v38 = v93 + 1;
    uint64_t v36 = v97;
  }
  float v89 = VCPSignPostLog();
  float v90 = v89;
  if (v91 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v90, OS_SIGNPOST_INTERVAL_END, spid, "VCPHandGestureImageRequest_processImage", "", buf, 2u);
  }

  id v87 = v109;
LABEL_122:

  return v87;
}

uint64_t __61__VCPHandGestureImageRequest_processImage_withOptions_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (BOOL)updateWithOptions:(id)a3 error:(id *)a4
{
  return [(VCPHandPoseImageRequest *)self->handPoseRequest updateWithOptions:a3 error:a4];
}

- (void)updateWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__VCPHandGestureImageRequest_updateWithOptions_completion___block_invoke;
    block[3] = &unk_1E6298900;
    block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(queue, block);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v11 = 0;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "VCPHandGestureImageRequest : queue not available for async updateWithOptions", v11, 2u);
      }
    }
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

void __59__VCPHandGestureImageRequest_updateWithOptions_completion___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  v3 = *(void **)(a1[4] + 64);
  id v8 = 0;
  int v4 = [v3 updateWithOptions:v2 error:&v8];
  id v5 = v8;
  uint64_t v6 = a1[6];
  if (v4)
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:0];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (void)processImage:(__CVBuffer *)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (self->_queue)
  {
    *(void *)buf = 0;
    BOOL v18 = buf;
    uint64_t v19 = 0x2020000000;
    CFTypeRef v20 = 0;
    CFTypeRef v20 = CFRetain(a3);
    queue = self->_queue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__VCPHandGestureImageRequest_processImage_withOptions_completion___block_invoke;
    v13[3] = &unk_1E6298CB8;
    v13[4] = self;
    double v16 = buf;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(queue, v13);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      double v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "VCPHandGestureImageRequest : queue not available for async processImage", buf, 2u);
      }
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:0];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v12);
  }
}

void __66__VCPHandGestureImageRequest_processImage_withOptions_completion___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1[7] + 8) + 24);
  v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v8 = 0;
  id v5 = [v3 processImage:v2 withOptions:v4 error:&v8];
  id v6 = v8;
  id v7 = *(const void **)(*(void *)(a1[7] + 8) + 24);
  if (v7) {
    CFRelease(v7);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->gestureCoreMLRequest, 0);
  objc_storeStrong((id *)&self->handPoseRequest, 0);
}

@end