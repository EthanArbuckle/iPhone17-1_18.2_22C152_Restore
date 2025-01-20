@interface VCPHandGestureVideoRequest
- (BOOL)updateWithOptions:(id)a3 error:(id *)a4;
- (VCPHandGestureVideoRequest)initWithOptions:(id)a3;
- (id)processBuffer:(__CVBuffer *)a3 timestamp:(id *)a4 withOptions:(id)a5 error:(id *)a6;
- (void)processBuffer:(__CVBuffer *)a3 timestamp:(id *)a4 withOptions:(id)a5 completion:(id)a6;
- (void)updateWithOptions:(id)a3 completion:(id)a4;
@end

@implementation VCPHandGestureVideoRequest

- (VCPHandGestureVideoRequest)initWithOptions:(id)a3
{
  id v4 = a3;
  v5 = VCPSignPostLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = VCPSignPostLog();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "VCPHandGestureVideoRequest_initWithOptions", "", buf, 2u);
  }

  v26.receiver = self;
  v26.super_class = (Class)VCPHandGestureVideoRequest;
  v9 = [(VCPRequest *)&v26 initWithOptions:v4];
  if (v9)
  {
    v10 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v4];
    v11 = [v4 objectForKeyedSubscript:@"handPoseLite"];

    if (!v11) {
      [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"handPoseLite"];
    }
    [v10 setObject:&unk_1F15EB898 forKeyedSubscript:@"revision"];
    v12 = [[VCPHandPoseImageRequest alloc] initWithOptions:v10];
    poseImageRequest = v9->_poseImageRequest;
    v9->_poseImageRequest = v12;

    v14 = [VCPHandGestureClassifier alloc];
    *(float *)&double v15 = v9->super._minHandSize;
    uint64_t v16 = [(VCPHandGestureClassifier *)v14 initWithMinHandSize:v4 options:v15];
    handGestureClassifier = v9->_handGestureClassifier;
    v9->_handGestureClassifier = (VCPHandGestureClassifier *)v16;

    int64_t v18 = *(void *)(MEMORY[0x1E4F1FA08] + 16);
    *(_OWORD *)&v9->_previousTime.value = *MEMORY[0x1E4F1FA08];
    v9->_previousTime.epoch = v18;
    v9->_minTimeInterval = 0.19;
    if (!v9->_poseImageRequest
      || !v9->_handGestureClassifier
      || (queue = v9->_queue, v9->_queue = 0, queue, v9->super._useAsync)
      && (dispatch_queue_t v20 = dispatch_queue_create("VCPHandGestureVideoRequestSerialQueue", 0),
          v21 = v9->_queue,
          v9->_queue = (OS_dispatch_queue *)v20,
          v21,
          !v9->_queue))
    {
      v23 = 0;
      goto LABEL_17;
    }
  }
  v22 = VCPSignPostLog();
  v10 = v22;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_END, v6, "VCPHandGestureVideoRequest_initWithOptions", "", buf, 2u);
  }
  v23 = v9;
LABEL_17:

  v24 = v23;
  return v24;
}

- (id)processBuffer:(__CVBuffer *)a3 timestamp:(id *)a4 withOptions:(id)a5 error:(id *)a6
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  v82 = (NSDictionary *)a5;
  v8 = VCPSignPostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = VCPSignPostLog();
  v11 = v10;
  unint64_t v76 = v9 - 1;
  os_signpost_id_t spid = v9;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf.var0) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPHandGestureVideoRequest_processBuffer", "", (uint8_t *)&buf, 2u);
  }

  v83 = [(NSDictionary *)v82 objectForKeyedSubscript:@"faceRects"];
  v79 = [(NSDictionary *)v82 objectForKeyedSubscript:@"faceYaws"];
  if ([v83 count])
  {
    v12 = [v83 firstObject];
    NSRectFromString(v12);
  }
  v13 = [(VCPHandPoseImageRequest *)self->_poseImageRequest processImage:a3 withOptions:v82 error:a6];
  int maxNumOfPersons = self->super._maxNumOfPersons;
  if (maxNumOfPersons >= 3) {
    int maxNumOfPersons = 3;
  }
  if (maxNumOfPersons <= 1) {
    int maxNumOfPersons = 1;
  }
  signed int v78 = maxNumOfPersons;
  v80 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v13);
  v89 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  obuint64_t j = v13;
  uint64_t v15 = [obj countByEnumeratingWithState:&v103 objects:v112 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v104;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v104 != v16) {
          objc_enumerationMutation(obj);
        }
        int64_t v18 = *(void **)(*((void *)&v103 + 1) + 8 * i);
        v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v18, "groupID"));
        dispatch_queue_t v20 = [v89 objectForKeyedSubscript:v19];
        BOOL v21 = v20 == 0;

        if (v21)
        {
          v24 = (void *)MEMORY[0x1E4F1CA48];
          v111 = v18;
          v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
          v23 = [v24 arrayWithArray:v22];
          v25 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v18, "groupID"));
          [v89 setObject:v23 forKeyedSubscript:v25];
        }
        else
        {
          v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v18, "groupID"));
          v23 = [v89 objectForKeyedSubscript:v22];
          [v23 addObject:v18];
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v103 objects:v112 count:16];
    }
    while (v15);
  }

  objc_super v26 = [v89 allKeys];
  signed int v27 = [v26 count];
  signed int v28 = v78;
  if (v78 >= v27) {
    signed int v28 = v27;
  }
  signed int v81 = v28;

  v86 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v85 = [v89 allKeys];
  uint64_t v29 = [v85 countByEnumeratingWithState:&v99 objects:v110 count:16];
  if (v29)
  {
    uint64_t v87 = *(void *)v100;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v100 != v87) {
          objc_enumerationMutation(v85);
        }
        uint64_t v31 = *(void *)(*((void *)&v99 + 1) + 8 * j);
        v32 = [v89 objectForKeyedSubscript:v31];
        if ([v32 count])
        {
          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          id v33 = v32;
          uint64_t v34 = [v33 countByEnumeratingWithState:&v95 objects:v109 count:16];
          if (v34)
          {
            uint64_t v35 = *(void *)v96;
            float v36 = 0.0;
            do
            {
              for (uint64_t k = 0; k != v34; ++k)
              {
                if (*(void *)v96 != v35) {
                  objc_enumerationMutation(v33);
                }
                id v38 = *(id *)(*((void *)&v95 + 1) + 8 * k);
                [v38 bounds];
                double v40 = v39;
                [v38 bounds];
                double v42 = v41;

                float v43 = v40 * v42;
                float v36 = v36 + v43;
              }
              uint64_t v34 = [v33 countByEnumeratingWithState:&v95 objects:v109 count:16];
            }
            while (v34);
          }
          else
          {
            float v36 = 0.0;
          }

          *(float *)&double v44 = v36 / (float)(unint64_t)[v33 count];
          v45 = [NSNumber numberWithFloat:v44];
          [v86 setObject:v45 forKeyedSubscript:v31];
        }
      }
      uint64_t v29 = [v85 countByEnumeratingWithState:&v99 objects:v110 count:16];
    }
    while (v29);
  }

  v46 = [v86 keysSortedByValueUsingComparator:&__block_literal_global_28];
  v47 = v82;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v48 = VCPLogInstance();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf.var0) = 138412802;
      *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v46;
      LOWORD(buf.var2) = 1024;
      *(unsigned int *)((char *)&buf.var2 + 2) = v78;
      WORD1(buf.var3) = 1024;
      HIDWORD(buf.var3) = v81;
      _os_log_impl(&dword_1BBEDA000, v48, OS_LOG_TYPE_DEBUG, "VCPHandGestureVideoRequest - sorted groupIDs based on hand size = %@, max number of persons = %d, number of valid persons = %d", (uint8_t *)&buf, 0x18u);
    }

    v47 = v82;
  }
  p_previousTime = &self->_previousTime;
  if (self->_previousTime.flags)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a4;
    *(_OWORD *)&rhs.value = *(_OWORD *)&p_previousTime->value;
    rhs.epoch = self->_previousTime.epoch;
    CMTimeSubtract(&time, (CMTime *)&buf, &rhs);
    if (CMTimeGetSeconds(&time) > self->_minTimeInterval)
    {
      v50 = [(NSDictionary *)v47 objectForKeyedSubscript:@"rotationInDegrees"];
      BOOL v51 = v50 == 0;

      if (!v51)
      {
        uint64_t RotationInDegrees = getRotationInDegrees(v82);
        if ([(VCPHandGestureClassifier *)self->_handGestureClassifier rotationInDegrees] != RotationInDegrees)
        {
          [(VCPHandGestureClassifier *)self->_handGestureClassifier reset];
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v53 = VCPLogInstance();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              int v54 = [(VCPHandGestureClassifier *)self->_handGestureClassifier rotationInDegrees];
              LODWORD(buf.var0) = 67109376;
              HIDWORD(buf.var0) = v54;
              LOWORD(buf.var1) = 1024;
              *(int *)((char *)&buf.var1 + 2) = RotationInDegrees;
              _os_log_impl(&dword_1BBEDA000, v53, OS_LOG_TYPE_INFO, "gesture rotation updated from %d to %d", (uint8_t *)&buf, 0xEu);
            }
          }
        }
        [(VCPHandGestureClassifier *)self->_handGestureClassifier setRotationInDegrees:RotationInDegrees];
      }
      long long v55 = *(_OWORD *)&a4->var0;
      self->_previousTime.epoch = a4->var3;
      *(_OWORD *)&p_previousTime->value = v55;
      v56 = [MEMORY[0x1E4F1CA48] array];
      for (uint64_t m = 0; ; ++m)
      {
        signed int v58 = [v46 count];
        int v59 = v81 >= v58 ? v58 : v81;
        if (m >= v59) {
          break;
        }
        v60 = [v46 objectAtIndexedSubscript:m];
        v61 = [v89 objectForKeyedSubscript:v60];

        if ([v61 count])
        {
          handGestureClassifier = self->_handGestureClassifier;
          v63 = [v46 objectAtIndexedSubscript:m];
          LODWORD(handGestureClassifier) = -[VCPHandGestureClassifier processPerson:withObservations:andFaceRects:faceYaws:](handGestureClassifier, "processPerson:withObservations:andFaceRects:faceYaws:", [v63 intValue], v61, v83, v79);

          if (handGestureClassifier)
          {

LABEL_79:
            v72 = 0;
            goto LABEL_76;
          }
          [v80 addObjectsFromArray:v61];
          v64 = [v46 objectAtIndexedSubscript:m];
          [v56 addObject:v64];
        }
      }
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      v65 = [(VCPHandGestureClassifier *)self->_handGestureClassifier existingGroupIDs];
      uint64_t v66 = [v65 countByEnumeratingWithState:&v90 objects:v108 count:16];
      if (v66)
      {
        uint64_t v67 = *(void *)v91;
        uint64_t v68 = MEMORY[0x1E4F1CBF0];
        while (2)
        {
          for (uint64_t n = 0; n != v66; ++n)
          {
            if (*(void *)v91 != v67) {
              objc_enumerationMutation(v65);
            }
            v70 = *(void **)(*((void *)&v90 + 1) + 8 * n);
            if (([v56 containsObject:v70] & 1) == 0
              && -[VCPHandGestureClassifier processPerson:withObservations:andFaceRects:faceYaws:](self->_handGestureClassifier, "processPerson:withObservations:andFaceRects:faceYaws:", [v70 intValue], v68, v68, v68))
            {

              goto LABEL_79;
            }
          }
          uint64_t v66 = [v65 countByEnumeratingWithState:&v90 objects:v108 count:16];
          if (v66) {
            continue;
          }
          break;
        }
      }
    }
  }
  v71 = VCPSignPostLog();
  v56 = v71;
  if (v76 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
  {
    LOWORD(buf.var0) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v56, OS_SIGNPOST_INTERVAL_END, spid, "VCPHandGestureVideoRequest_processBuffer", "", (uint8_t *)&buf, 2u);
  }
  v72 = v80;
LABEL_76:

  id v73 = v72;
  return v73;
}

uint64_t __72__VCPHandGestureVideoRequest_processBuffer_timestamp_withOptions_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (BOOL)updateWithOptions:(id)a3 error:(id *)a4
{
  return [(VCPHandPoseImageRequest *)self->_poseImageRequest updateWithOptions:a3 error:a4];
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
    block[2] = __59__VCPHandGestureVideoRequest_updateWithOptions_completion___block_invoke;
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
      os_signpost_id_t v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "VCPHandGestureVideoRequest : queue not available for async updateWithOptions", v11, 2u);
      }
    }
    v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

void __59__VCPHandGestureVideoRequest_updateWithOptions_completion___block_invoke(void *a1)
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

- (void)processBuffer:(__CVBuffer *)a3 timestamp:(id *)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (self->_queue)
  {
    *(void *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 0;
    v22 = buf;
    uint64_t v23 = 0x2020000000;
    CFTypeRef v24 = 0;
    CFTypeRef v24 = CFRetain(a3);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__VCPHandGestureVideoRequest_processBuffer_timestamp_withOptions_completion___block_invoke;
    block[3] = &unk_1E6298928;
    block[4] = self;
    int64_t v18 = buf;
    long long v19 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    id v16 = v10;
    id v17 = v11;
    dispatch_async(queue, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 0;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "VCPHandGestureVideoRequest : queue not available for async processBuffer", buf, 2u);
      }
    }
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:0];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v14);
  }
}

void __77__VCPHandGestureVideoRequest_processBuffer_timestamp_withOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  long long v9 = *(_OWORD *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 80);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = 0;
  id v5 = [v3 processBuffer:v2 timestamp:&v9 withOptions:v4 error:&v8];
  id v6 = v8;
  id v7 = *(const void **)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v7) {
    CFRelease(v7);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_handGestureClassifier, 0);
  objc_storeStrong((id *)&self->_poseImageRequest, 0);
}

@end