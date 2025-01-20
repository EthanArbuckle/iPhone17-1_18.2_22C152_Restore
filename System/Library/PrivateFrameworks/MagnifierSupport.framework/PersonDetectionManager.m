@interface PersonDetectionManager
- (ARCamera)arCamera;
- (BOOL)isCenterDetectionEnabled;
- (BOOL)isInCenterRectFromRow:(unint64_t)a3 column:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6;
- (BOOL)isIntersectingWithCenter:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (CGPoint)project3dPoint:(CGSize)a3 viewSize:(int64_t)a4 interfaceOrientation:;
- (CGSize)centerDetectionSize;
- (NSArray)detectedPersonArray;
- (PersonDetectionManager)initWithCenterDetectionSize:(CGSize)a3 labellingTolerance:(float)a4 significantAreaThresholdMM:(float)a5 closeDetectionFactor:(float)a6;
- (__CVBuffer)labelBuffer;
- (double)unprojectPoint:(double)a3 atDepth:(double)a4 viewSize:(double)a5 interfaceOrientation:(double)a6;
- (float)areaFactorForDepth:(float)a3 camera:(id)a4 orientation:(int64_t)a5;
- (float)closeDetectionFactor;
- (float)labellingTolerance;
- (float)significantAreaThresholdMM;
- (id)computeLabelIn:(id)a3 x:(unint64_t)a4 y:(unint64_t)a5 depth:(float)a6;
- (id)getDetectedPersonsFromBuffer:(__CVBuffer *)a3 camera:(id)a4 interfaceOrientation:(int64_t)a5;
- (unsigned)findLabel:(unsigned __int16)a3 inLabels:(id)a4;
- (unsigned)maxLabel;
- (unsigned)unionLabel:(unsigned __int16)a3 with:(unsigned __int16)a4 inLabels:(id)a5;
- (void)computePersonDetectionFromFrame:(id)a3 interfaceOrientation:(int64_t)a4;
- (void)dealloc;
- (void)setArCamera:(id)a3;
- (void)setIsCenterDetectionEnabled:(BOOL)a3;
- (void)updateLabel:(id)a3 x:(unint64_t)a4 y:(unint64_t)a5 depth:(float)a6;
@end

@implementation PersonDetectionManager

- (PersonDetectionManager)initWithCenterDetectionSize:(CGSize)a3 labellingTolerance:(float)a4 significantAreaThresholdMM:(float)a5 closeDetectionFactor:(float)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v17.receiver = self;
  v17.super_class = (Class)PersonDetectionManager;
  v11 = [(PersonDetectionManager *)&v17 init];
  v12 = v11;
  if (v11)
  {
    detectedPersonArray = v11->_detectedPersonArray;
    v11->_detectedPersonArray = (NSArray *)MEMORY[0x263EFFA68];

    arCamera = v12->_arCamera;
    v12->_arCamera = 0;

    v12->_isCenterDetectionEnabled = 0;
    v12->_maxLabel = 0;
    v12->_centerDetectionSize.CGFloat width = width;
    v12->_centerDetectionSize.CGFloat height = height;
    v12->_labellingTolerance = a4;
    v12->_significantAreaThresholdMM = a5;
    v12->_closeDetectionFactor = a6;
    v15 = v12;
  }

  return v12;
}

- (void)dealloc
{
  labelBuffer = self->_labelBuffer;
  if (labelBuffer) {
    CVPixelBufferRelease(labelBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)PersonDetectionManager;
  [(PersonDetectionManager *)&v4 dealloc];
}

- (void)computePersonDetectionFromFrame:(id)a3 interfaceOrientation:(int64_t)a4
{
  id v22 = a3;
  if (v22)
  {
    if (self->_arCamera)
    {
      v6 = [v22 camera];
      [v6 intrinsics];
      -[ARCamera setIntrinsics:](self->_arCamera, "setIntrinsics:");

      v7 = [v22 camera];
      [v7 imageResolution];
      -[ARCamera setImageResolution:](self->_arCamera, "setImageResolution:");
    }
    else
    {
      id v8 = objc_alloc(MEMORY[0x263EF8F10]);
      v7 = [v22 camera];
      [v7 intrinsics];
      double v20 = v10;
      double v21 = v9;
      double v19 = v11;
      v12 = [v22 camera];
      [v12 imageResolution];
      v15 = (ARCamera *)objc_msgSend(v8, "initWithIntrinsics:imageResolution:", v21, v20, v19, v13, v14);
      arCamera = self->_arCamera;
      self->_arCamera = v15;
    }
    -[PersonDetectionManager getDetectedPersonsFromBuffer:camera:interfaceOrientation:](self, "getDetectedPersonsFromBuffer:camera:interfaceOrientation:", [v22 estimatedDepthData], self->_arCamera, a4);
    objc_super v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    detectedPersonArray = self->_detectedPersonArray;
    self->_detectedPersonArray = v17;
  }
}

- (double)unprojectPoint:(double)a3 atDepth:(double)a4 viewSize:(double)a5 interfaceOrientation:(double)a6
{
  v6 = *(void **)(a1 + 40);
  if (!v6) {
    return 0.0;
  }
  objc_msgSend(v6, "unprojectPoint:ontoPlaneWithTransform:orientation:viewportSize:", a2, a3, *(double *)&_PromotedConst, 0.0, -0.0078125, 0.0, a5, a6);
  return result;
}

- (CGPoint)project3dPoint:(CGSize)a3 viewSize:(int64_t)a4 interfaceOrientation:
{
  arCamera = self->_arCamera;
  if (arCamera)
  {
    [(ARCamera *)arCamera projectPoint:a4 orientation:a3.width viewportSize:a3.height];
  }
  else
  {
    double v5 = *MEMORY[0x263F00148];
    double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (id)getDetectedPersonsFromBuffer:(__CVBuffer *)a3 camera:(id)a4 interfaceOrientation:(int64_t)a5
{
  uint64_t v5 = MEMORY[0x270FA5388](self, a2, a3, a4, a5);
  uint64_t v78 = v6;
  id v8 = v7;
  uint64_t v9 = v5;
  v87[1] = *MEMORY[0x263EF8340];
  id v74 = v10;
  if (v8)
  {
    CVPixelBufferLockBaseAddress(v8, 0);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v8);
    unint64_t width = CVPixelBufferGetWidth(v8);
    unint64_t height = CVPixelBufferGetHeight(v8);
    uint64_t v86 = *MEMORY[0x263F04130];
    v87[0] = MEMORY[0x263EFFA78];
    CFDictionaryRef pixelBufferAttributes = [NSDictionary dictionaryWithObjects:v87 forKeys:&v86 count:1];
    double v13 = (CVPixelBufferRef *)(v9 + 32);
    v12 = *(__CVBuffer **)(v9 + 32);
    if (!v12)
    {
      if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], width, height, 0x4C303136u, pixelBufferAttributes, (CVPixelBufferRef *)(v9 + 32)))
      {
        id v8 = 0;
        *double v13 = 0;
LABEL_78:

        goto LABEL_79;
      }
      v12 = *v13;
    }
    CVPixelBufferLockBaseAddress(v12, 0);
    size_t v14 = CVPixelBufferGetBytesPerRow(*v13);
    BaseAddress = (float *)CVPixelBufferGetBaseAddress(v8);
    v69 = CVPixelBufferGetBaseAddress(*v13);
    size_t v72 = v14;
    size_t v68 = BytesPerRow;
    pixelBuffer = v8;
    v77 = objc_opt_new();
    for (uint64_t i = 0; i != 0xFFFF; ++i)
    {
      v16 = [[BoundingBoxWithLabel alloc] initWithLabel:(unsigned __int16)i];
      [v77 addObject:v16];
    }
    size_t v18 = v14;
    size_t v19 = BytesPerRow;
    if (height)
    {
      uint64_t v20 = 0;
      double v21 = v69 - 1;
      id v22 = BaseAddress;
      while (1)
      {
        v23 = (char *)BaseAddress + (v20 - 1) * v19;
        if (v20) {
          v24 = v23;
        }
        else {
          v24 = 0;
        }
        v25 = (char *)v69 + (v20 - 1) * v18;
        if (!v20) {
          v25 = 0;
        }
        obuint64_t j = (unsigned __int16 *)v25;
        if (width) {
          break;
        }
LABEL_47:
        ++v20;
        size_t v19 = v68;
        id v22 = (float *)((char *)v22 + v68);
        size_t v18 = v72;
        double v21 = (unsigned __int16 *)((char *)v21 + v72);
        if (v20 == height) {
          goto LABEL_48;
        }
      }
      uint64_t v26 = 0;
      v27 = v21;
      v28 = v22;
      while (1)
      {
        *(float *)&double v17 = *v28;
        if (*v28 != 0.0) {
          break;
        }
LABEL_46:
        ++v26;
        ++v28;
        ++v27;
        if (width == v26) {
          goto LABEL_47;
        }
      }
      double v29 = 0.0;
      float v30 = 0.0;
      if (v26) {
        float v30 = *(v28 - 1);
      }
      if (v24) {
        LODWORD(v29) = *(_DWORD *)&v24[4 * v26];
      }
      float v31 = vabds_f32(*(float *)&v17, v30);
      float v32 = *(float *)(v9 + 12);
      *(float *)&double v29 = vabds_f32(*(float *)&v17, *(float *)&v29);
      if (v31 >= v32 && *(float *)&v29 >= v32)
      {
        v37 = objc_msgSend((id)v9, "computeLabelIn:x:y:depth:", v77, v26, v20, v17, v29);
        unsigned int v38 = [v37 alias];

LABEL_45:
        v27[1] = v38;
        v40 = [v77 objectAtIndexedSubscript:v38];
        *(float *)&double v41 = *v28;
        [(id)v9 updateLabel:v40 x:v26 y:v20 depth:v41];

        goto LABEL_46;
      }
      if (v31 >= v32 || *(float *)&v29 < v32)
      {
        if (v31 < v32 || *(float *)&v29 >= v32)
        {
          if (v26) {
            uint64_t v36 = *v27;
          }
          else {
            uint64_t v36 = 0;
          }
          if (obj) {
            uint64_t v39 = obj[v26];
          }
          else {
            uint64_t v39 = 0;
          }
          unsigned int v38 = objc_msgSend((id)v9, "unionLabel:with:inLabels:", v36, v39, v77, v17, v29);
          goto LABEL_45;
        }
        if (obj)
        {
          unsigned int v38 = obj[v26];
          goto LABEL_45;
        }
      }
      else if (v26)
      {
        unsigned int v38 = *v27;
        goto LABEL_45;
      }
      unsigned int v38 = 0;
      goto LABEL_45;
    }
LABEL_48:
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    bzero(v85, 0x1FFFEuLL);
    v42 = v69;
    if (height)
    {
      for (uint64_t j = 0; j != height; ++j)
      {
        v44 = v42;
        for (unint64_t k = width; k; --k)
        {
          if (*v42)
          {
            int v46 = objc_msgSend((id)v9, "findLabel:inLabels:");
            __int16 v47 = v85[v46];
            if (!v47)
            {
              __int16 v47 = v85[0] + 1;
              v85[0] = v47;
              v85[v46] = v47;
            }
            _WORD *v42 = v47;
          }
          ++v42;
        }
        v42 = (_WORD *)((char *)v44 + v72);
      }
    }
    CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(v9 + 32), 0);
    *(_WORD *)(v9 + 10) = v85[0];
    v70 = objc_opt_new();
    for (uint64_t m = 1; m != 0xFFFF; ++m)
    {
      if (v85[m])
      {
        v49 = [v77 objectAtIndexedSubscript:m];
        [v70 addObject:v49];
      }
    }
    v73 = objc_opt_new();
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obja = v70;
    uint64_t v50 = [obja countByEnumeratingWithState:&v80 objects:v84 count:16];
    if (v50)
    {
      uint64_t v51 = *(void *)v81;
      do
      {
        for (uint64_t n = 0; n != v50; ++n)
        {
          if (*(void *)v81 != v51) {
            objc_enumerationMutation(obja);
          }
          v53 = *(void **)(*((void *)&v80 + 1) + 8 * n);
          if ((unint64_t)[v53 computeArea] >= 0x19)
          {
            unint64_t v54 = [v53 minX];
            unint64_t v55 = [v53 maxX];
            unint64_t v56 = [v53 minY];
            unint64_t v57 = [v53 maxY];
            v58 = [DetectedPersonData alloc];
            [v53 depth];
            LODWORD(v60) = v59;
            v61 = [(DetectedPersonData *)v58 initWithNormalizedMinX:v74 maxX:v78 minY:(double)v54 / (double)width maxY:(double)v55 / (double)width depth:(double)v56 / (double)height camera:(double)v57 / (double)height orientation:v60];
            unint64_t v62 = [(DetectedPersonData *)v61 computeArea];
            [v53 depth];
            objc_msgSend((id)v9, "areaFactorForDepth:camera:orientation:", *(void *)(v9 + 40), v78);
            if ((float)(v63 * *(float *)(v9 + 16)) > (float)v62) {
              [(DetectedPersonData *)v61 setIsEnabled:0];
            }
            if (*(unsigned char *)(v9 + 8)
              && ([(id)v9 isIntersectingWithCenter:v61 width:width height:height] & 1) == 0)
            {
              [(DetectedPersonData *)v61 setIsEnabled:0];
            }
            [v73 addObject:v61];
          }
        }
        uint64_t v50 = [obja countByEnumeratingWithState:&v80 objects:v84 count:16];
      }
      while (v50);
    }

    [v73 sortUsingComparator:&__block_literal_global_121];
    id v8 = (__CVBuffer *)[v73 copy];

    goto LABEL_78;
  }
LABEL_79:

  return v8;
}

uint64_t __83__PersonDetectionManager_getDetectedPersonsFromBuffer_camera_interfaceOrientation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if [v4 isValid] && (objc_msgSend(v4, "isEnabled"))
  {
    if (![v5 isValid] || !objc_msgSend(v5, "isEnabled"))
    {
      uint64_t v8 = -1;
      goto LABEL_7;
    }
    [v4 position];
    int32x4_t v12 = v6;
    [v5 position];
    if ((vmovn_s32(vcgtq_s32(v12, v7)).i32[1] & 1) == 0)
    {
      [v4 position];
      int32x4_t v13 = v10;
      [v5 position];
      uint64_t v8 = (uint64_t)((unint64_t)vmovn_s32(vcgtq_s32(v11, v13)).u16[2] << 63) >> 63;
      goto LABEL_7;
    }
  }
  uint64_t v8 = 1;
LABEL_7:

  return v8;
}

- (unsigned)findLabel:(unsigned __int16)a3 inLabels:(id)a4
{
  id v5 = a4;
  unsigned __int16 v6 = a3;
  while (1)
  {
    int32x4_t v7 = [v5 objectAtIndexedSubscript:v6];
    int v8 = [v7 alias];

    if (v8 == v6) {
      break;
    }
    uint64_t v9 = [v5 objectAtIndexedSubscript:v6];
    unsigned __int16 v6 = [v9 alias];
  }
  while (1)
  {
    uint64_t v12 = a3;
    int32x4_t v13 = [v5 objectAtIndexedSubscript:a3];
    int v14 = [v13 alias];

    if (v14 == v12) {
      break;
    }
    int32x4_t v10 = [v5 objectAtIndexedSubscript:v12];
    a3 = [v10 alias];

    int32x4_t v11 = [v5 objectAtIndexedSubscript:v12];
    [v11 setAlias:v6];
  }
  return v6;
}

- (unsigned)unionLabel:(unsigned __int16)a3 with:(unsigned __int16)a4 inLabels:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  id v8 = a5;
  unsigned int v9 = [(PersonDetectionManager *)self findLabel:v6 inLabels:v8];
  uint64_t v10 = [(PersonDetectionManager *)self findLabel:v5 inLabels:v8];
  int32x4_t v11 = [v8 objectAtIndexedSubscript:v9];
  uint64_t v12 = [v8 objectAtIndexedSubscript:v10];
  [v11 setAlias:v10];
  unint64_t v13 = [v11 minX];
  unint64_t v14 = [v12 minX];
  if (v13 >= v14) {
    unint64_t v15 = v14;
  }
  else {
    unint64_t v15 = v13;
  }
  [v12 setMinX:v15];
  unint64_t v16 = [v11 maxX];
  unint64_t v17 = [v12 maxX];
  if (v16 <= v17) {
    unint64_t v18 = v17;
  }
  else {
    unint64_t v18 = v16;
  }
  [v12 setMaxX:v18];
  unint64_t v19 = [v11 minY];
  unint64_t v20 = [v12 minY];
  if (v19 >= v20) {
    unint64_t v21 = v20;
  }
  else {
    unint64_t v21 = v19;
  }
  [v12 setMinY:v21];
  unint64_t v22 = [v11 maxY];
  unint64_t v23 = [v12 maxY];
  if (v22 <= v23) {
    unint64_t v24 = v23;
  }
  else {
    unint64_t v24 = v22;
  }
  [v12 setMaxY:v24];

  return v10;
}

- (id)computeLabelIn:(id)a3 x:(unint64_t)a4 y:(unint64_t)a5 depth:(float)a6
{
  id v8 = a3;
  unsigned int v9 = [v8 objectAtIndexedSubscript:0];
  objc_msgSend(v9, "setAlias:", (unsigned __int16)(objc_msgSend(v9, "alias") + 1));

  uint64_t v10 = [v8 objectAtIndexedSubscript:0];
  int32x4_t v11 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v10, "alias"));

  uint64_t v12 = [v8 objectAtIndexedSubscript:0];
  objc_msgSend(v11, "setAlias:", objc_msgSend(v12, "alias"));

  [v11 setMinX:a4];
  [v11 setMaxX:a4];
  [v11 setMinY:a5];
  [v11 setMaxY:a5];

  return v11;
}

- (void)updateLabel:(id)a3 x:(unint64_t)a4 y:(unint64_t)a5 depth:(float)a6
{
  id v18 = a3;
  unint64_t v9 = [v18 minX];
  if (v9 >= a4) {
    unint64_t v10 = a4;
  }
  else {
    unint64_t v10 = v9;
  }
  [v18 setMinX:v10];
  unint64_t v11 = [v18 maxX];
  if (v11 <= a4) {
    unint64_t v12 = a4;
  }
  else {
    unint64_t v12 = v11;
  }
  [v18 setMaxX:v12];
  unint64_t v13 = [v18 minY];
  if (v13 >= a5) {
    unint64_t v14 = a5;
  }
  else {
    unint64_t v14 = v13;
  }
  [v18 setMinY:v14];
  unint64_t v15 = [v18 maxY];
  if (v15 <= a5) {
    unint64_t v16 = a5;
  }
  else {
    unint64_t v16 = v15;
  }
  [v18 setMaxY:v16];
  *(float *)&double v17 = a6;
  [v18 setDepth:v17];
}

- (BOOL)isIntersectingWithCenter:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  id v8 = a3;
  double width = self->_centerDetectionSize.width;
  double height = self->_centerDetectionSize.height;
  [v8 screenRect];
  v13.size.double width = width / (double)a4;
  v13.origin.x = v13.size.width * -0.5 + 0.5;
  v13.size.double height = height / (double)a5;
  v13.origin.y = v13.size.height * -0.5 + 0.5;
  LOBYTE(a5) = CGRectIntersectsRect(v12, v13);

  return a5;
}

- (BOOL)isInCenterRectFromRow:(unint64_t)a3 column:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  if ((a5 & 0x8000000000000000) == 0) {
    int64_t v6 = a5;
  }
  else {
    int64_t v6 = a5 + 1;
  }
  int64_t v7 = a4 - (v6 >> 1);
  if (v7 < 0) {
    int64_t v7 = -v7;
  }
  if (v7 > (uint64_t)(self->_centerDetectionSize.width * 0.5)) {
    return 0;
  }
  if ((a6 & 0x8000000000000000) == 0) {
    int64_t v9 = a6;
  }
  else {
    int64_t v9 = a6 + 1;
  }
  int64_t v10 = a3 - (v9 >> 1);
  if (v10 < 0) {
    int64_t v10 = -v10;
  }
  return v10 <= (uint64_t)(self->_centerDetectionSize.height * 0.5);
}

- (float)areaFactorForDepth:(float)a3 camera:(id)a4 orientation:(int64_t)a5
{
  id v8 = a4;
  int64_t v9 = [DetectedPersonData alloc];
  *(float *)&double v10 = a3;
  unint64_t v11 = [(DetectedPersonData *)v9 initWithNormalizedMinX:v8 maxX:a5 minY:0.0 maxY:1.0 depth:0.0 camera:1.0 orientation:v10];
  unint64_t v12 = [(DetectedPersonData *)v11 computeArea];
  float closeDetectionFactor = self->_closeDetectionFactor;
  if ((float)((float)v12 / (float)(self->_significantAreaThresholdMM * closeDetectionFactor)) <= 1.0) {
    float v14 = (float)v12 / (float)(self->_significantAreaThresholdMM * closeDetectionFactor);
  }
  else {
    float v14 = 1.0;
  }

  return v14;
}

- (BOOL)isCenterDetectionEnabled
{
  return self->_isCenterDetectionEnabled;
}

- (void)setIsCenterDetectionEnabled:(BOOL)a3
{
  self->_isCenterDetectionEnabled = a3;
}

- (CGSize)centerDetectionSize
{
  double width = self->_centerDetectionSize.width;
  double height = self->_centerDetectionSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (float)labellingTolerance
{
  return self->_labellingTolerance;
}

- (float)significantAreaThresholdMM
{
  return self->_significantAreaThresholdMM;
}

- (float)closeDetectionFactor
{
  return self->_closeDetectionFactor;
}

- (NSArray)detectedPersonArray
{
  return self->_detectedPersonArray;
}

- (__CVBuffer)labelBuffer
{
  return self->_labelBuffer;
}

- (unsigned)maxLabel
{
  return self->_maxLabel;
}

- (ARCamera)arCamera
{
  return (ARCamera *)objc_getProperty(self, a2, 40, 1);
}

- (void)setArCamera:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arCamera, 0);
  objc_storeStrong((id *)&self->_detectedPersonArray, 0);
}

@end