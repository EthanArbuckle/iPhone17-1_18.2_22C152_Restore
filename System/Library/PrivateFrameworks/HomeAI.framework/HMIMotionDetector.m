@interface HMIMotionDetector
- (BOOL)applyActivityZoneFilteringOnSourcePoint:(CGPoint)a3 destinationPoint:(CGPoint)a4 frameSize:(CGSize)a5 activityZones:(id)a6;
- (HMIMotionDetector)init;
- (__CFArray)resizedSampleBuffers;
- (id)_computeOpticalFlow:(__CVBuffer *)a3 with:(__CVBuffer *)a4 globalMotionScore:(float *)a5 activityZones:(id)a6 operationMode:(unint64_t)a7;
- (id)calculateMotionDetection:(vector<unsigned)char score:(std:()vector<float :(std:()vector<cv:(std:()vector<cv:(std:(id)a7 :(unint64_t)a8 allocator<cv:()vector<cv:(std:(CGSize)a10 :(float)a11 allocator<cv::Mat>> *)a9 :Mat :Point_<float>>> *)a6 :Point_<float> :allocator<cv::Point_<float>>> *)a5 :Point_<float> :allocator<float>> *)a4 allocator<unsigned char>> *)a3 srcFeatureCVPoints:dstFeatreCVPoints:activityZones:operationMode:srcPyramid:frameSize:brightnessChange:;
- (id)detectWithGlobalMotionScore:(float *)a3 referencePixelBuffer:(__CVBuffer *)a4 targetPixelBuffer:(__CVBuffer *)a5 activityZones:(id)a6 detectorMode:(unint64_t)a7;
- (id)visualizeMotionDetections:(id)a3 frameSize:(CGSize)a4 timeStamp:(id *)a5;
- (void)dealloc;
@end

@implementation HMIMotionDetector

- (HMIMotionDetector)init
{
  v4.receiver = self;
  v4.super_class = (Class)HMIMotionDetector;
  v2 = [(HMIMotionDetector *)&v4 init];
  if (v2) {
    v2->_resizedSampleBuffers = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  }
  return v2;
}

- (void)dealloc
{
  CFArrayRemoveAllValues(self->_resizedSampleBuffers);
  CFRelease(self->_resizedSampleBuffers);
  v3.receiver = self;
  v3.super_class = (Class)HMIMotionDetector;
  [(HMIMotionDetector *)&v3 dealloc];
}

- (id)_computeOpticalFlow:(__CVBuffer *)a3 with:(__CVBuffer *)a4 globalMotionScore:(float *)a5 activityZones:(id)a6 operationMode:(unint64_t)a7
{
  void (**v36[2])(uint64_t *__return_ptr);
  void (**v37)(uint64_t *__return_ptr, void, uint64_t);
  void *v38;
  int v39;
  void **v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45[3];
  uint64_t v46;
  void v47[3];
  _DWORD v48[2];
  _DWORD v49[2];
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  _DWORD *v56;
  cv *v57;
  void v58[2];
  uint64_t v59;
  void v60[3];
  _DWORD v61[2];
  _DWORD v62[2];
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  _DWORD *v69;
  void *v70;
  void v71[4];
  uint64_t vars8;

  id v10 = a6;
  *a5 = 0.0;
  double Size = HMICVPixelBufferGetSize(a4);
  double v13 = v12;
  if (Size == HMICVPixelBufferGetSize(a3) && v13 == v14)
  {
    v71[2] = [[HMISignpost alloc] initWithName:@"Sparse Optical Flow"];
    CVPixelBufferLockBaseAddress(a4, 1uLL);
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
    int v19 = (int)v13;
    int v20 = (int)Size;
    v62[0] = (int)v13;
    v62[1] = (int)Size;
    v63 = BaseAddressOfPlane;
    v64 = 0;
    if ((int)v13 == 1) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = BytesPerRowOfPlane;
    }
    if (BytesPerRowOfPlane) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    v69 = v62;
    v70 = v71;
    if (v21 == v20 || BytesPerRowOfPlane == 0) {
      int v24 = 1124024320;
    }
    else {
      int v24 = 1124007936;
    }
    v61[0] = v24;
    v61[1] = 2;
    v71[0] = v22;
    v71[1] = 1;
    v67 = &BaseAddressOfPlane[v22 * v19];
    v68 = 0;
    v65 = BaseAddressOfPlane;
    v66 = &v67[v20 - v22];
    memset(v60, 0, sizeof(v60));
    cv::_InputArray::_InputArray((uint64_t)v32, (const cv::Mat *)v61);
    cv::_OutputArray::_OutputArray((uint64_t)v48, (uint64_t)v60);
    v59 = 0xA0000000ALL;
    cv::buildOpticalFlowPyramid((void (***)(uint64_t *__return_ptr))v32, (uint64_t)v48, (int *)&v59, 2u, 1, 4, 0, 1);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    v25 = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    size_t v26 = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    v49[0] = (int)v13;
    v49[1] = (int)Size;
    v50 = v25;
    v51 = 0;
    if (v19 == 1) {
      size_t v27 = v20;
    }
    else {
      size_t v27 = v26;
    }
    if (v26) {
      size_t v28 = v27;
    }
    else {
      size_t v28 = v20;
    }
    v56 = v49;
    v57 = (cv *)v58;
    if (v27 == v20 || v26 == 0) {
      int v30 = 1124024320;
    }
    else {
      int v30 = 1124007936;
    }
    v48[1] = 2;
    v48[0] = v30;
    v58[0] = v28;
    v58[1] = 1;
    v55 = 0;
    v54 = &v25[v28 * v19];
    v52 = v25;
    v53 = &v54[v20 - v28];
    memset(v47, 0, sizeof(v47));
    cv::_InputArray::_InputArray((uint64_t)v32, (const cv::Mat *)v48);
    cv::_OutputArray::_OutputArray((uint64_t)v36, (uint64_t)v47);
    v46 = 0xA0000000ALL;
    cv::buildOpticalFlowPyramid((void (***)(uint64_t *__return_ptr))v32, (uint64_t)v36, (int *)&v46, 2u, 1, 4, 0, 1);
    memset(v45, 0, sizeof(v45));
    v43 = 0;
    v42 = 0;
    v44 = 0;
    cv::_InputArray::_InputArray((uint64_t)v36, (const cv::Mat *)v48);
    v39 = -2147287027;
    v40 = v45;
    v41 = 0;
    v38 = &unk_26D989EB8;
    v33 = &v32[2];
    v34 = (cv *)v35;
    v35[0] = 0;
    v35[1] = 0;
    v32[0] = 1124007936;
    memset(&v32[1], 0, 60);
    cv::_InputArray::_InputArray((uint64_t)&v37, (const cv::Mat *)v32);
    cv::goodFeaturesToTrack(v36, (const cv::_InputArray *)&v38, (const cv::_OutputArray *)0x1F4, &v37, 0.0299999993, 5.0, (const cv::_InputArray *)5, 0, 0.04);
  }
  v16 = (void *)MEMORY[0x263EFFA68];

  return v16;
}

- (id)calculateMotionDetection:(vector<unsigned)char score:(std:()vector<float :(std:()vector<cv:(std:()vector<cv:(std:(id)a7 :(unint64_t)a8 allocator<cv:()vector<cv:(std:(CGSize)a10 :(float)a11 allocator<cv::Mat>> *)a9 :Mat :Point_<float>>> *)a6 :Point_<float> :allocator<cv::Point_<float>>> *)a5 :Point_<float> :allocator<float>> *)a4 allocator<unsigned char>> *)a3 srcFeatureCVPoints:dstFeatreCVPoints:activityZones:operationMode:srcPyramid:frameSize:brightnessChange:
{
  double height = a10.height;
  double width = a10.width;
  int v20 = a9;
  id v21 = a7;
  double v117 = 9999.0;
  double v118 = 9999.0;
  double v115 = 9999.0;
  double v116 = 9999.0;
  double v113 = -9999.0;
  double v114 = -9999.0;
  double v111 = -9999.0;
  double v112 = -9999.0;
  v106 = (double *)malloc_type_malloc(2 * ((char *)a5->var1 - (char *)a5->var0), 0x1000040451B5BE8uLL);
  v105 = (double *)malloc_type_malloc(2 * ((char *)a5->var1 - (char *)a5->var0), 0x1000040451B5BE8uLL);
  var0 = a3->var0;
  if (a3->var1 != a3->var0)
  {
    unint64_t v23 = 0;
    int v24 = 0;
    float v25 = flt_225F2E350[(a8 & 1) == 0];
    float v26 = 0.0;
    uint64_t v27 = 4;
    while (1)
    {
      if (!var0[v23] || a4->__begin_[v23] <= v25) {
        goto LABEL_53;
      }
      float v28 = hypotf(*(float *)((char *)a5->var0 + v27 - 4) - *(float *)((char *)a6->var0 + v27 - 4), *(float *)((char *)a5->var0 + v27) - *(float *)((char *)a6->var0 + v27));
      uint64_t v29 = [v21 count];
      BOOL v30 = 1;
      if ((a8 & 1) != 0 && v29) {
        BOOL v30 = -[HMIMotionDetector applyActivityZoneFilteringOnSourcePoint:destinationPoint:frameSize:activityZones:](self, "applyActivityZoneFilteringOnSourcePoint:destinationPoint:frameSize:activityZones:", v21, (double)(int)(uint64_t)rint(*(float *)((char *)a5->var0 + v27 - 4)), (double)(int)(uint64_t)rint(*(float *)((char *)a5->var0 + v27)), (double)(int)(uint64_t)rint(*(float *)((char *)a6->var0 + v27 - 4)), (double)(int)(uint64_t)rint(*(float *)((char *)a6->var0 + v27)), width, height);
      }
      if (v28 <= 1.0 || !v30) {
        goto LABEL_53;
      }
      v32 = (float *)((char *)a5->var0 + v27);
      float v33 = *(v32 - 1);
      float v34 = *v32;
      v35 = (float *)((char *)a6->var0 + v27);
      float v36 = *(v35 - 1);
      if (v33 >= v36) {
        float v37 = *(v35 - 1);
      }
      else {
        float v37 = *(v32 - 1);
      }
      double v38 = v37;
      float v39 = *v35;
      if (v34 >= *v35) {
        float v40 = *v35;
      }
      else {
        float v40 = *v32;
      }
      double v41 = v118;
      if (v118 <= v38)
      {
        if (v116 <= v38) {
          goto LABEL_25;
        }
        v42 = &v116;
      }
      else
      {
        if (v118 >= 9998.0) {
          double v41 = v38;
        }
        double v116 = v41;
        v42 = &v118;
      }
      double *v42 = v38;
LABEL_25:
      double v43 = v40;
      double v44 = v117;
      if (v117 <= v43)
      {
        if (v115 <= v43) {
          goto LABEL_32;
        }
        v45 = &v115;
      }
      else
      {
        if (v117 >= 9998.0) {
          double v44 = v43;
        }
        double v115 = v44;
        v45 = &v117;
      }
      double *v45 = v43;
LABEL_32:
      if (v33 >= v36) {
        float v46 = v33;
      }
      else {
        float v46 = v36;
      }
      double v47 = v46;
      if (v34 >= v39) {
        float v48 = v34;
      }
      else {
        float v48 = v39;
      }
      double v49 = v114;
      if (v114 >= v47)
      {
        if (v112 >= v47) {
          goto LABEL_45;
        }
        v50 = &v112;
      }
      else
      {
        if (v114 <= -9998.0) {
          double v49 = v47;
        }
        double v112 = v49;
        v50 = &v114;
      }
      double *v50 = v47;
LABEL_45:
      double v51 = v48;
      double v52 = v113;
      if (v113 < v51)
      {
        if (v113 <= -9998.0) {
          double v52 = v51;
        }
        double v111 = v52;
        v53 = &v113;
        goto LABEL_51;
      }
      if (v111 < v51)
      {
        v53 = &v111;
LABEL_51:
        double *v53 = v51;
      }
      float v26 = v26 + sqrtf(v28);
      v54 = &v106[2 * v24];
      double *v54 = (double)(int)(uint64_t)rint(v33);
      v54[1] = (double)(int)(uint64_t)rint(v34);
      v55 = &v105[2 * v24];
      double *v55 = (double)(int)(uint64_t)rint(v36);
      v55[1] = (double)(int)(uint64_t)rint(v39);
      ++v24;
LABEL_53:
      ++v23;
      var0 = a3->var0;
      v27 += 8;
      if (a3->var1 - a3->var0 <= v23)
      {
        double v56 = v113;
        double v57 = v114;
        double v58 = v115;
        double v59 = v116;
        double v60 = v117;
        double v61 = v118;
        double v62 = v111;
        double v63 = v112;
        int v20 = a9;
        goto LABEL_56;
      }
    }
  }
  int v24 = 0;
  double v60 = 9999.0;
  double v62 = -9999.0;
  double v63 = -9999.0;
  double v58 = 9999.0;
  float v26 = 0.0;
  double v56 = -9999.0;
  double v61 = 9999.0;
  double v59 = 9999.0;
  double v57 = -9999.0;
LABEL_56:
  double v64 = flt_225F2E378[v26 < 20.0];
  double v65 = (v57 - v61 + 40.0) * v64;
  if (v57 - v59 + 40.0 >= v65) {
    double v59 = v61;
  }
  double v66 = (v56 - v60 + 40.0) * v64;
  if (v56 - v58 + 40.0 >= v66) {
    double v58 = v60;
  }
  if (v63 - v61 + 40.0 >= v65) {
    double v63 = v57;
  }
  if (v62 - v60 + 40.0 >= v66) {
    double v67 = v56;
  }
  else {
    double v67 = v62;
  }
  float v68 = v63;
  float v69 = v67;
  double v70 = (float)(v68 + 20.0);
  double v71 = (float)(v69 + 20.0);
  int v72 = *((_DWORD *)v20->var0 + 3) - 1;
  if (v70 <= (double)v72) {
    double v73 = v70;
  }
  else {
    double v73 = (double)v72;
  }
  int v74 = *((_DWORD *)v20->var0 + 2) - 1;
  if (v71 <= (double)v74) {
    double v75 = v71;
  }
  else {
    double v75 = (double)v74;
  }
  if (v26 == 0.0)
  {
    double v73 = *MEMORY[0x263F00148];
    double v75 = *(double *)(MEMORY[0x263F00148] + 8);
    double v76 = v75;
    double v77 = *MEMORY[0x263F00148];
  }
  else
  {
    float v78 = v59;
    float v79 = v58;
    double v77 = fmax((float)(v78 + -20.0), 0.0);
    double v76 = fmax((float)(v79 + -20.0), 0.0);
  }
  long double v80 = pow((fabsf(a11) + 5.0) / 5.0, 3.0);
  v120.size.double width = v73 - v77;
  v120.size.double height = v75 - v76;
  v120.origin.CGFloat x = v77;
  v120.origin.CGFloat y = v76;
  CGRect v121 = CGRectStandardize(v120);
  CGFloat x = v121.origin.x;
  CGFloat y = v121.origin.y;
  CGFloat v83 = v121.size.width;
  CGFloat v84 = v121.size.height;
  double v103 = height;
  double v104 = v80;
  memset(&v110, 0, sizeof(v110));
  double v102 = width;
  *(float *)&v121.origin.CGFloat x = width;
  *(float *)&v121.size.double width = height;
  CGAffineTransformMakeScale(&v110, (float)(1.0 / *(float *)&v121.origin.x), (float)(1.0 / *(float *)&v121.size.width));
  CGAffineTransform v109 = v110;
  v122.origin.CGFloat x = x;
  v122.origin.CGFloat y = y;
  v122.size.double width = v83;
  v122.size.double height = v84;
  CGRect v123 = CGRectApplyAffineTransform(v122, &v109);
  double v85 = v123.origin.x;
  double v86 = v123.origin.y;
  CGFloat v87 = v123.size.width;
  double v101 = v123.size.height;
  v88 = [MEMORY[0x263EFF980] array];
  double v100 = v87;
  int v89 = v24 - 1;
  if (v24 >= 1)
  {
    uint64_t v90 = 0;
    v91 = v105 + 1;
    v92 = v106 + 1;
    do
    {
      double v107 = *v92;
      double v108 = *(v92 - 1);
      v93 = -[HMIMotionVector initWithOrigin:motion:]([HMIMotionVector alloc], "initWithOrigin:motion:", v110.tx + v107 * v110.c + v110.a * v108, v110.ty + v107 * v110.d + v110.b * v108, v110.tx + *v91 * v110.c + v110.a * *(v91 - 1) - (v110.tx + v107 * v110.c + v110.a * v108), v110.ty + *v91 * v110.d + v110.b * *(v91 - 1) - (v110.ty + v107 * v110.d + v110.b * v108));
      [v88 addObject:v93];

      ++v90;
      v91 += 2;
      v92 += 2;
    }
    while (v90 < v89--);
  }
  float v95 = v26 / v104;
  free(v106);
  free(v105);
  if (v95 >= 0.001)
  {
    v97 = [HMIMotionDetection alloc];
    if (v95 <= 1000.0) {
      *(float *)&double v98 = v26 / v104;
    }
    else {
      *(float *)&double v98 = 1000.0;
    }
    v96 = -[HMIMotionDetection initWithBoundingBox:size:motionVectors:motionScore:motionMode:](v97, "initWithBoundingBox:size:motionVectors:motionScore:motionMode:", v88, a8, v85, v86, v100, v101, v102, v103, v98, *(void *)&v100, *(void *)&v86, *(void *)&v85);
  }
  else
  {
    v96 = 0;
  }

  return v96;
}

- (BOOL)applyActivityZoneFilteringOnSourcePoint:(CGPoint)a3 destinationPoint:(CGPoint)a4 frameSize:(CGSize)a5 activityZones:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v12 = a6;
  double v13 = [v12 firstObject];
  char v14 = [v13 isInclusion];

  double v15 = HMICGPointClampWithSize(v11, v10, width);
  double v17 = v16;
  double v39 = v15;
  double v18 = HMICGPointClampWithSize(x, y, width);
  double v37 = v19;
  double v38 = v18;
  *(float *)&double v18 = width;
  *(float *)&double v19 = height;
  memset(&v44, 0, sizeof(v44));
  CGAffineTransformMakeScale(&v44, (float)(1.0 / *(float *)&v18), (float)(1.0 / *(float *)&v19));
  double a = v44.a;
  double b = v44.b;
  double c = v44.c;
  double d = v44.d;
  tdouble x = v44.tx;
  tdouble y = v44.ty;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v26 = v12;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v40 objects:v45 count:16];
  char v28 = v14 ^ 1;
  if (v27)
  {
    double v29 = tx + v17 * c + a * v39;
    double v30 = ty + v17 * d + b * v39;
    double v31 = tx + v37 * c + a * v38;
    double v32 = ty + v37 * d + b * v38;
    uint64_t v33 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v41 != v33) {
          objc_enumerationMutation(v26);
        }
        v35 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (objc_msgSend(v35, "containsVectorWithSource:destination:", v29, v30, v31, v32))
        {
          char v28 = [v35 isInclusion];
          goto LABEL_11;
        }
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v28;
}

- (id)detectWithGlobalMotionScore:(float *)a3 referencePixelBuffer:(__CVBuffer *)a4 targetPixelBuffer:(__CVBuffer *)a5 activityZones:(id)a6 detectorMode:(unint64_t)a7
{
  v7 = [(HMIMotionDetector *)self _computeOpticalFlow:a4 with:a5 globalMotionScore:a3 activityZones:a6 operationMode:a7];
  return v7;
}

- (id)visualizeMotionDetections:(id)a3 frameSize:(CGSize)a4 timeStamp:(id *)a5
{
  double height = a4.height;
  double width = a4.width;
  v8 = +[HMIMotionDetection firstMotionDetectionInArray:a3 withMode:2];
  v9 = +[HMIVisionUtilities createPixelBufferWithSize:pixelFormat:useIOSurface:](HMIVisionUtilities, "createPixelBufferWithSize:pixelFormat:useIOSurface:", 875704422, 0, width, height);
  HMICVPixelBufferSetValue(v9, 0);
  CVPixelBufferLockBaseAddress(v9, 0);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(v9, 0);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v9, 0);
  id v12 = [v8 motionVectors];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__HMIMotionDetector_visualizeMotionDetections_frameSize_timeStamp___block_invoke;
  v17[3] = &__block_descriptor_64_e25_v16__0__HMIMotionVector_8l;
  *(double *)&v17[4] = width;
  *(double *)&v17[5] = height;
  v17[6] = BaseAddressOfPlane;
  v17[7] = BytesPerRowOfPlane;
  objc_msgSend(v12, "na_each:", v17);

  CVPixelBufferUnlockBaseAddress(v9, 0);
  double v13 = [HMIVideoFrame alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = *a5;
  char v14 = [(HMIVideoFrame *)v13 initWithPixelBuffer:v9 presentationTimeStamp:&v16];
  CVPixelBufferRelease(v9);

  return v14;
}

void __67__HMIMotionDetector_visualizeMotionDetections_frameSize_timeStamp___block_invoke(uint64_t a1, void *a2)
{
  id v31 = a2;
  [v31 origin];
  double v4 = v3;
  double v5 = *(double *)(a1 + 32);
  [v31 origin];
  double v7 = v6;
  double v8 = *(double *)(a1 + 40);
  [v31 target];
  double v10 = v9;
  double v11 = *(double *)(a1 + 32);
  [v31 target];
  double v12 = v4 * v5;
  double v13 = v7 * v8;
  double v14 = v10 * v11;
  double v16 = v15 * *(double *)(a1 + 40);
  if (v4 * v5 >= v10 * v11) {
    double v17 = v10 * v11;
  }
  else {
    double v17 = v4 * v5;
  }
  if (v4 * v5 >= v10 * v11) {
    double v18 = v16;
  }
  else {
    double v18 = v7 * v8;
  }
  double v19 = 0.0;
  double v20 = v14 - v12;
  double v21 = (v16 - v13) / (v14 - v12);
  if (v14 == v12) {
    double v21 = 0.0;
  }
  for (; (v17 - v12) * (v17 - v14) <= 0.0; double v18 = v21 + v18)
  {
    double v22 = *(double *)(a1 + 32);
    double v23 = *(double *)(a1 + 40) + -1.0;
    if (v23 >= v18) {
      double v23 = v18;
    }
    unint64_t v24 = (unint64_t)fmax(v23, 0.0);
    double v25 = v22 + -1.0;
    if (v22 + -1.0 >= v17) {
      double v25 = v17;
    }
    *(unsigned char *)(*(void *)(a1 + 48) + (unint64_t)fmax(v25, 0.0) + *(void *)(a1 + 56) * v24) = -1;
    double v17 = v17 + 1.0;
  }
  if (v13 < v16)
  {
    double v26 = v7 * v8;
  }
  else
  {
    double v12 = v10 * v11;
    double v26 = v16;
  }
  if (v16 != v13) {
    double v19 = v20 / (v16 - v13);
  }
  for (; (v26 - v13) * (v26 - v16) <= 0.0; double v26 = v26 + 1.0)
  {
    double v27 = *(double *)(a1 + 32);
    double v28 = *(double *)(a1 + 40) + -1.0;
    if (v28 >= v26) {
      double v28 = v26;
    }
    unint64_t v29 = (unint64_t)fmax(v28, 0.0);
    double v30 = v27 + -1.0;
    if (v27 + -1.0 >= v12) {
      double v30 = v12;
    }
    *(unsigned char *)(*(void *)(a1 + 48) + (unint64_t)fmax(v30, 0.0) + *(void *)(a1 + 56) * v29) = -1;
    double v12 = v19 + v12;
  }
}

- (__CFArray)resizedSampleBuffers
{
  return self->_resizedSampleBuffers;
}

@end