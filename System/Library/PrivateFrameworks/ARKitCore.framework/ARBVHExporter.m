@interface ARBVHExporter
+ (id)headerByApplyingScale:(id)a1;
+ (id)liftedSkeletonHeaderByApplyingScale:(id)a1;
+ (id)stickFigureHeaderByApplyingScale:(id)a1;
- (ARBVHExporter)initWithFilePath:(id)a3 type:(int64_t)a4 scale:;
- (BOOL)running;
- (void)appendBodyAnchor:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ARBVHExporter

- (ARBVHExporter)initWithFilePath:(id)a3 type:(int64_t)a4 scale:
{
  long long v16 = v4;
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARBVHExporter;
  v9 = [(ARBVHExporter *)&v17 init];
  v10 = v9;
  if (v9)
  {
    *(_OWORD *)&v9->_scale[4] = v16;
    v9->_exportType = a4;
    objc_storeStrong((id *)&v9->_filePath, a3);
    v11 = NSTemporaryDirectory();
    v12 = objc_opt_new();
    uint64_t v13 = [v11 stringByAppendingFormat:@"%@_tmp.bvh", v12];
    tmpFilePath = v10->_tmpFilePath;
    v10->_tmpFilePath = (NSString *)v13;

    v10->_running = 0;
  }

  return v10;
}

- (void)start
{
  self->_numberFrames = 0;
  v3 = (NSOutputStream *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initToFileAtPath:self->_tmpFilePath append:0];
  framesStreamToFile = self->_framesStreamToFile;
  self->_framesStreamToFile = v3;

  [(NSOutputStream *)self->_framesStreamToFile open];
  self->_running = 1;
}

- (void)stop
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(NSOutputStream *)self->_framesStreamToFile close];
  self->_running = 0;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initToFileAtPath:self->_filePath append:0];
  [v3 open];
  int64_t exportType = self->_exportType;
  if (exportType)
  {
    if (exportType == 1)
    {
      objc_super v17 = [(id)objc_opt_class() liftedSkeletonHeaderByApplyingScale:*(double *)&self->_scale[4]];
      [(__CFString *)v17 dataUsingEncoding:4];
    }
    else if (exportType == 2)
    {
      objc_super v17 = [(id)objc_opt_class() headerByApplyingScale:*(double *)&self->_scale[4]];
      [(__CFString *)v17 dataUsingEncoding:4];
    }
    else
    {
      objc_super v17 = @"ERROR";
      [@"ERROR" dataUsingEncoding:4];
    }
  }
  else
  {
    objc_super v17 = [(id)objc_opt_class() stickFigureHeaderByApplyingScale:*(double *)&self->_scale[4]];
    [(__CFString *)v17 dataUsingEncoding:4];
  }
  id v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "write:maxLength:", objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  v6 = objc_opt_new();
  [v6 appendString:@"MOTION\n"];
  objc_msgSend(v6, "appendFormat:", @"Frames:  %d\n", self->_numberFrames);
  objc_msgSend(v6, "appendFormat:", @"Frame Time:    %f\n", 0x3F91111111111111);
  id v7 = [v6 dataUsingEncoding:4];
  objc_msgSend(v3, "write:maxLength:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithFileAtPath:self->_tmpFilePath];
  [v8 open];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:1024];
  while ([v8 hasBytesAvailable])
  {
    id v10 = v9;
    objc_msgSend(v3, "write:maxLength:", objc_msgSend(v10, "bytes"), objc_msgSend(v8, "read:maxLength:", objc_msgSend(v10, "mutableBytes"), objc_msgSend(v10, "length")));
  }
  [v8 close];
  [v3 close];
  v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  tmpFilePath = self->_tmpFilePath;
  id v18 = 0;
  [v11 removeItemAtPath:tmpFilePath error:&v18];
  id v13 = v18;

  if (v13)
  {
    if (_ARLogGeneral(void)::onceToken != -1) {
      dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_77_1);
    }
    v14 = (id)_ARLogGeneral(void)::logObj;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      long long v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138543874;
      v20 = v16;
      __int16 v21 = 2048;
      v22 = self;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not delete temporary file: %@", buf, 0x20u);
    }
  }
}

- (void)appendBodyAnchor:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  if (!self->_running) {
    goto LABEL_47;
  }
  v75 = objc_opt_new();
  int64_t exportType = self->_exportType;
  if ((unint64_t)(exportType - 1) < 2)
  {
    [v74 transform];
    float v71 = v5;
    float v6 = *(float *)&self->_scale[4];
    [v74 transform];
    float v70 = v7;
    long long v69 = *(_OWORD *)&self->_scale[4];
    [v74 transform];
    objc_msgSend(v75, "appendFormat:", @"%f %f %f ", (float)(v6 * v71), vmuls_lane_f32(v70, *(float32x2_t *)&v69, 1), vmuls_lane_f32(*(float *)&self->_scale[12], v8, 2));
    [v74 transform];
    double v12 = AREulerAnglesFromMatrix(v9, v10, v11);
    float v13 = *(float *)&v12 * 0.318309886 * 180.0;
    float v14 = *((float *)&v12 + 1) * 0.318309886 * 180.0;
    *(float *)&double v12 = v15 * 0.318309886 * 180.0;
    objc_msgSend(v75, "appendFormat:", @"%f %f %f ", v13, v14, *(float *)&v12);
LABEL_6:
    int64_t exportType = self->_exportType;
    goto LABEL_7;
  }
  if (!exportType)
  {
    long long v16 = [v74 referenceBody];
    objc_super v17 = [v16 skeleton];
    float v72 = COERCE_FLOAT(*(void *)([v17 jointLandmarks] + 128));
    float v18 = *(float *)&self->_scale[4];
    v19 = [v74 referenceBody];
    v20 = [v19 skeleton];
    objc_msgSend(v75, "appendFormat:", @"%f %f %f ", (float)(v18 * v72), (float)(*(float *)(objc_msgSend(v20, "jointLandmarks") + 132) * *(float *)&self->_scale[8]), 0);

    objc_msgSend(v75, "appendFormat:", @"%f %f %f ", 0, 0, 0);
    goto LABEL_6;
  }
LABEL_7:
  if (exportType)
  {
    if (exportType == 1)
    {
      v60 = [v74 skeleton];
      v61 = [v60 coreRESkeleton];
      v62 = [v61 liftedSkeletonData];

      uint64_t v63 = 0;
      for (unint64_t i = 1; [v62 jointCount] > i; ++i)
      {
        uint64_t v65 = [v62 jointsLocalSpace];
        objc_msgSend(v75, "appendFormat:", @"%f %f %f ", (float)(*(float *)(v65 + v63 + 16) * *(float *)&self->_scale[4]), (float)(*(float *)(v65 + v63 + 20) * *(float *)&self->_scale[8]), (float)(*(float *)(v65 + v63 + 24) * *(float *)&self->_scale[12]));
        v63 += 16;
      }
      [v75 appendString:@"\n"];
    }
    else if (exportType == 2)
    {
      uint64_t v21 = 0;
      for (unint64_t j = 1; ; ++j)
      {
        __int16 v23 = [v74 skeleton];
        unint64_t v24 = [v23 jointCount];

        if (v24 <= j) {
          break;
        }
        uint64_t v25 = [v74 skeleton];
        uint64_t v26 = [v25 jointLocalTransforms];
        *(double *)&long long v27 = AREulerAnglesFromMatrix(*(__n128 *)(v26 + v21 + 64), *(__n128 *)(v26 + v21 + 80), *(__n128 *)(v26 + v21 + 96));
        long long v73 = v27;

        float v28 = *(float *)&v73 * 0.318309886 * 180.0;
        float v29 = *((float *)&v73 + 1) * 0.318309886 * 180.0;
        float v30 = *((float *)&v73 + 2) * 0.318309886 * 180.0;
        objc_msgSend(v75, "appendFormat:", @"%f %f %f ", v28, v29, v30);
        v21 += 64;
      }
      [v75 appendString:@"\n"];
    }
  }
  else
  {
    v31 = [v74 skeleton];
    v32 = [v31 coreRESkeleton];
    v33 = [v32 liftedSkeletonData];
    v34 = [v33 skeletonDetectionResult2D];

    id v35 = v34;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(__p, [v35 jointCount]);
    v36 = (const void *)[v35 joints];
    uint64_t v37 = [v35 joints];
    uint64_t v38 = [v35 jointCount];
    long long v90 = 0uLL;
    uint64_t v91 = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v90, v36, v37 + 8 * v38, (v37 + 8 * v38 - (uint64_t)v36) >> 3);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    *(_OWORD *)__p = v90;
    uint64_t v77 = v91;
    long long v88 = 0u;
    long long v86 = 0u;
    memset(v87, 0, sizeof(v87));
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    v39 = [&unk_1F125BFA8 objectAtIndexedSubscript:16];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v83 objects:&v90 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v84;
      do
      {
        for (uint64_t k = 0; k != v40; ++k)
        {
          if (*(void *)v84 != v41) {
            objc_enumerationMutation(v39);
          }
          v89[0] = [*(id *)(*((void *)&v83 + 1) + 8 * k) intValue];
          std::deque<std::pair<int,int>>::push_back(v87, v89);
        }
        uint64_t v40 = [v39 countByEnumeratingWithState:&v83 objects:&v90 count:16];
      }
      while (v40);
    }

    for (uint64_t m = *((void *)&v88 + 1); *((void *)&v88 + 1); uint64_t m = *((void *)&v88 + 1))
    {
      v44 = (int *)(*(void *)(*((void *)&v87[0] + 1) + (((unint64_t)v88 >> 6) & 0x3FFFFFFFFFFFFF8))
                  + 8 * (v88 & 0x1FF));
      uint64_t v46 = *v44;
      uint64_t v45 = v44[1];
      *(void *)&long long v88 = v88 + 1;
      *((void *)&v88 + 1) = m - 1;
      if ((unint64_t)v88 >= 0x400)
      {
        operator delete(**((void ***)&v87[0] + 1));
        *((void *)&v87[0] + 1) += 8;
        *(void *)&long long v88 = v88 - 512;
      }
      float32x2_t v47 = *(float32x2_t *)([v35 joints] + 8 * v46);
      uint64_t v48 = [v35 joints];
      *((float32x2_t *)__p[0] + v46) = vsub_f32(v47, *(float32x2_t *)(v48 + 8 * v45));
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      v49 = [&unk_1F125BFA8 objectAtIndexedSubscript:v46];
      uint64_t v50 = [v49 countByEnumeratingWithState:&v79 objects:v89 count:16];
      if (v50)
      {
        uint64_t v51 = *(void *)v80;
        uint64_t v52 = v46 << 32;
        do
        {
          for (uint64_t n = 0; n != v50; ++n)
          {
            if (*(void *)v80 != v51) {
              objc_enumerationMutation(v49);
            }
            uint64_t v78 = v52 | [*(id *)(*((void *)&v79 + 1) + 8 * n) intValue];
            std::deque<std::pair<int,int>>::push_back(v87, &v78);
          }
          uint64_t v50 = [v49 countByEnumeratingWithState:&v79 objects:v89 count:16];
        }
        while (v50);
      }
    }
    std::deque<std::pair<int,int>>::~deque[abi:ne180100](v87);

    for (unint64_t ii = 1; [v35 jointCount] > ii; ++ii)
    {
      uint64_t v55 = -[ARBVHExporter appendBodyAnchor:]::indexSequence[ii];
      v56 = +[ARSkeletonDefinition defaultBody2DSkeletonDefinition];
      v57 = [v56 parentIndices];
      v58 = [v57 objectAtIndexedSubscript:v55];
      int v59 = [v58 intValue];

      if (v59 >= 0) {
        objc_msgSend(v75, "appendFormat:", @"%f %f %f ", vmuls_n_f32(COERCE_FLOAT(*((void *)__p[0] + v55)), COERCE_FLOAT(*(_OWORD *)&self->_scale[4])), vmuls_lane_f32(COERCE_FLOAT(HIDWORD(*((void *)__p[0] + v55))), *(float32x2_t *)&self->_scale[4], 1), 0);
      }
    }
    [v75 appendString:@"\n"];
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  v66 = [v75 dataUsingEncoding:4];
  framesStreamToFile = self->_framesStreamToFile;
  id v68 = v66;
  -[NSOutputStream write:maxLength:](framesStreamToFile, "write:maxLength:", [v68 bytes], objc_msgSend(v68, "length"));
  ++self->_numberFrames;

LABEL_47:
}

+ (id)headerByApplyingScale:(id)a1
{
  __n128 v14 = v2;
  v3 = +[ARSkeletonDefinition defaultBody3DSkeletonDefinition];
  long long v4 = [v3 parentIndices];

  float v5 = +[ARSkeletonDefinition defaultBody3DSkeletonDefinition];
  float v6 = [v5 jointNames];

  float v7 = +[ARSkeletonDefinition defaultBody3DSkeletonDefinition];
  float32x4_t v8 = [v7 neutralBodySkeleton3D];

  int v9 = [v4 indexOfObjectPassingTest:&__block_literal_global_63];
  __n128 v10 = objc_opt_new();
  [v10 appendString:@"HIERARCHY\n"];
  __n128 v11 = [v6 objectAtIndexedSubscript:v9];
  [v10 appendFormat:@"ROOT %@\n{\n", v11];

  objc_msgSend(v10, "appendFormat:", @"\tOFFSET %f %f %f\n", (float)(*(float *)(objc_msgSend(v8, "jointLocalTransforms") + ((uint64_t)v9 << 6) + 48) * v14.n128_f32[0]), vmuls_lane_f32(COERCE_FLOAT(HIDWORD(*(void *)(objc_msgSend(v8, "jointLocalTransforms") + ((uint64_t)v9 << 6) + 48))), (float32x2_t)v14.n128_u64[0], 1), vmuls_lane_f32(*(float *)(objc_msgSend(v8, "jointLocalTransforms") + ((uint64_t)v9 << 6) + 56), (float32x4_t)v14, 2));
  [v10 appendString:@"\tCHANNELS 6 Xposition Yposition Zposition Xrotation Yrotation Zrotation\n"];
  double v12 = visitChildren(1, v9, v6, v4, [v8 jointLocalTransforms], 0, v14);
  [v10 appendString:v12];

  [v10 appendString:@"}\n"];
  return v10;
}

unint64_t __39__ARBVHExporter_headerByApplyingScale___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)[a2 integerValue] >> 63;
}

+ (id)liftedSkeletonHeaderByApplyingScale:(id)a1
{
  __n128 v16 = v2;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = +[AR3DSkeletonDetectionResult jointNames];
  long long v4 = +[AR3DSkeletonDetectionResult parentIndices];
  int v5 = [v4 indexOfObjectPassingTest:&__block_literal_global_43];
  uint64_t v6 = 0;
  v18[66] = 0u;
  v18[67] = xmmword_1B8A530E0;
  v18[68] = xmmword_1B8A530F0;
  v18[69] = xmmword_1B8A53100;
  v18[70] = xmmword_1B8A53110;
  v18[71] = xmmword_1B8A53120;
  v18[72] = xmmword_1B8A53130;
  v18[73] = xmmword_1B8A53140;
  v18[74] = xmmword_1B8A53150;
  v18[75] = xmmword_1B8A53160;
  v18[76] = xmmword_1B8A53170;
  v18[77] = xmmword_1B8A53180;
  v18[78] = xmmword_1B8A53190;
  v18[79] = xmmword_1B8A531A0;
  v18[80] = xmmword_1B8A531B0;
  v18[81] = xmmword_1B8A531C0;
  v18[82] = xmmword_1B8A531D0;
  float v7 = v18;
  do
  {
    ARMatrix4x4FromRotationAndTranslation();
    *(v7 - 2) = v8;
    *(v7 - 1) = v9;
    *float v7 = v10;
    v7[1] = v11;
    v7 += 4;
    v6 += 16;
  }
  while (v6 != 272);
  double v12 = objc_opt_new();
  [v12 appendString:@"HIERARCHY\n"];
  float v13 = [v3 objectAtIndexedSubscript:v5];
  [v12 appendFormat:@"ROOT %@\n{\n", v13];

  objc_msgSend(v12, "appendFormat:", @"\tOFFSET %f %f %f\n", (float)(*(float *)&v18[4 * (uint64_t)v5 + 1] * v16.n128_f32[0]), vmuls_lane_f32(*((float *)&v18[4 * (uint64_t)v5 + 1] + 1), (float32x2_t)v16.n128_u64[0], 1), vmuls_lane_f32(*((float *)&v18[4 * (uint64_t)v5 + 1] + 2), (float32x4_t)v16, 2));
  [v12 appendString:@"\tCHANNELS 6 Xposition Yposition Zposition Xrotation Yrotation Zrotation\n"];
  __n128 v14 = visitChildren(1, v5, v3, v4, (uint64_t)v17, 1, v16);
  [v12 appendString:v14];

  [v12 appendString:@"}\n"];
  return v12;
}

unint64_t __53__ARBVHExporter_liftedSkeletonHeaderByApplyingScale___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)[a2 integerValue] >> 63;
}

+ (id)stickFigureHeaderByApplyingScale:(id)a1
{
  __n128 v18 = v2;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = +[ARSkeletonDefinition defaultBody2DSkeletonDefinition];
  long long v4 = [v3 jointNames];

  int v5 = +[ARSkeletonDefinition defaultBody2DSkeletonDefinition];
  uint64_t v6 = [v5 parentIndices];

  int v7 = [v6 indexOfObjectPassingTest:&__block_literal_global_45_0];
  uint64_t v8 = 0;
  v20[66] = xmmword_1B8A531E0;
  v20[67] = xmmword_1B8A531F0;
  v20[68] = xmmword_1B8A53200;
  v20[69] = xmmword_1B8A53210;
  v20[70] = xmmword_1B8A53220;
  v20[71] = xmmword_1B8A53230;
  v20[72] = xmmword_1B8A53240;
  v20[73] = xmmword_1B8A53250;
  v20[74] = xmmword_1B8A53260;
  v20[75] = xmmword_1B8A53270;
  v20[76] = xmmword_1B8A53280;
  v20[77] = xmmword_1B8A53290;
  v20[78] = xmmword_1B8A532A0;
  v20[79] = xmmword_1B8A532B0;
  v20[80] = xmmword_1B8A532C0;
  v20[81] = xmmword_1B8A532D0;
  v20[82] = xmmword_1B8A532E0;
  long long v9 = v20;
  do
  {
    ARMatrix4x4FromRotationAndTranslation();
    *(v9 - 2) = v10;
    *(v9 - 1) = v11;
    _OWORD *v9 = v12;
    v9[1] = v13;
    v9 += 4;
    v8 += 16;
  }
  while (v8 != 272);
  __n128 v14 = objc_opt_new();
  [v14 appendString:@"HIERARCHY\n"];
  float v15 = [v4 objectAtIndexedSubscript:v7];
  [v14 appendFormat:@"ROOT %@\n{\n", v15];

  objc_msgSend(v14, "appendFormat:", @"\tOFFSET %f %f %f\n", (float)(*(float *)&v20[4 * (uint64_t)v7 + 1] * v18.n128_f32[0]), vmuls_lane_f32(*((float *)&v20[4 * (uint64_t)v7 + 1] + 1), (float32x2_t)v18.n128_u64[0], 1), vmuls_lane_f32(*((float *)&v20[4 * (uint64_t)v7 + 1] + 2), (float32x4_t)v18, 2));
  [v14 appendString:@"\tCHANNELS 6 Xposition Yposition Zposition Xrotation Yrotation Zrotation\n"];
  __n128 v16 = visitChildren(1, v7, v4, v6, (uint64_t)v19, 1, v18);
  [v14 appendString:v16];

  [v14 appendString:@"}\n"];
  return v14;
}

unint64_t __50__ARBVHExporter_stickFigureHeaderByApplyingScale___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)[a2 integerValue] >> 63;
}

- (BOOL)running
{
  return self->_running;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_framesStreamToFile, 0);
  objc_storeStrong((id *)&self->_tmpFilePath, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end