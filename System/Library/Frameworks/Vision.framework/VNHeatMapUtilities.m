@interface VNHeatMapUtilities
+ (BOOL)smoothedFloat32ImageBuffer:(vImage_Buffer *)a3 fromImageBuffer:(vImage_Buffer *)a4 originalImageSize:(CGSize)a5 sigmaX:(float)a6 sigmaY:(float)a7 nStd:(float)a8;
+ (float)maximumValueFromFloat32ImageBuffer:(vImage_Buffer *)a3;
+ (id)boundingBoxesFromFloat32ImageBuffer:(vImage_Buffer *)a3 thresholds:(id)a4 error:(id *)a5;
+ (id)boundingBoxesFromFloat32ImageBuffer:(vImage_Buffer *)a3 thresholds:(id)a4 relativeToMaximum:(BOOL)a5 applySmoothing:(BOOL)a6 originalImageSize:(CGSize)a7 sigmaX:(float)a8 sigmaY:(float)a9 nStd:(float)a10 error:(id *)a11;
+ (id)boundingBoxesFromFloat32PixelBuffer:(__CVBuffer *)a3 thresholds:(id)a4 relativeToMaximum:(BOOL)a5 applySmoothing:(BOOL)a6 originalImageSize:(CGSize)a7 sigmaX:(float)a8 sigmaY:(float)a9 nStd:(float)a10 error:(id *)a11;
+ (id)significantRegionsFromFloat32ImageBuffer:(vImage_Buffer *)a3 threshold:(float)a4;
+ (id)significantRegionsFromFloat32ImageBuffer:(vImage_Buffer *)a3 threshold:(float)a4 relativeToMaximum:(BOOL)a5;
+ (id)significantRegionsFromFloat32PixelBuffer:(__CVBuffer *)a3 threshold:(float)a4 relativeToMaximum:(BOOL)a5 error:(id *)a6;
@end

@implementation VNHeatMapUtilities

+ (id)boundingBoxesFromFloat32PixelBuffer:(__CVBuffer *)a3 thresholds:(id)a4 relativeToMaximum:(BOOL)a5 applySmoothing:(BOOL)a6 originalImageSize:(CGSize)a7 sigmaX:(float)a8 sigmaY:(float)a9 nStd:(float)a10 error:(id *)a11
{
  double height = a7.height;
  double width = a7.width;
  BOOL v17 = a6;
  BOOL v18 = a5;
  id v21 = a4;
  if (!a3)
  {
    if (a11)
    {
      v24 = @"pixelBuffer cannot be null";
LABEL_10:
      v23 = +[VNError errorForInvalidArgumentWithLocalizedDescription:v24];
      goto LABEL_11;
    }
LABEL_12:
    v25 = 0;
    goto LABEL_14;
  }
  if (CVPixelBufferGetPixelFormatType(a3) != 1278226534)
  {
    if (a11)
    {
      v24 = @"pixelBuffer is not in correct format. (Required format is one component, 32-float)";
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  uint64_t v22 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  if (v22)
  {
    if (a11)
    {
      v23 = +[VNError errorForCVReturnCode:v22 localizedDescription:@"unable to lock base address of pixelBuffer"];
LABEL_11:
      v25 = 0;
      *a11 = v23;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  v30[0] = CVPixelBufferGetBaseAddress(a3);
  v30[1] = CVPixelBufferGetHeight(a3);
  v30[2] = CVPixelBufferGetWidth(a3);
  v30[3] = CVPixelBufferGetBytesPerRow(a3);
  *(float *)&double v26 = a8;
  *(float *)&double v27 = a9;
  *(float *)&double v28 = a10;
  v25 = objc_msgSend(a1, "boundingBoxesFromFloat32ImageBuffer:thresholds:relativeToMaximum:applySmoothing:originalImageSize:sigmaX:sigmaY:nStd:error:", v30, v21, v18, v17, a11, width, height, v26, v27, v28);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
LABEL_14:

  return v25;
}

+ (id)boundingBoxesFromFloat32ImageBuffer:(vImage_Buffer *)a3 thresholds:(id)a4 relativeToMaximum:(BOOL)a5 applySmoothing:(BOOL)a6 originalImageSize:(CGSize)a7 sigmaX:(float)a8 sigmaY:(float)a9 nStd:(float)a10 error:(id *)a11
{
  double height = a7.height;
  double width = a7.width;
  BOOL v16 = a6;
  BOOL v17 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v19 = a4;
  v40 = v19;
  if (v16)
  {
    id v41 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:a3->height * a3->rowBytes];
    uint64_t v20 = [v41 mutableBytes];
    vImagePixelCount v22 = a3->height;
    vImagePixelCount v21 = a3->width;
    size_t rowBytes = a3->rowBytes;
    uint64_t data = v20;
    v52[0] = v20;
    v52[1] = v22;
    v52[2] = v21;
    v52[3] = rowBytes;
    long long v24 = *(_OWORD *)&a3->width;
    v51[0] = *(_OWORD *)&a3->data;
    v51[1] = v24;
    *(float *)&double v25 = a8;
    *(float *)&double v26 = a9;
    *(float *)&double v27 = a10;
    if ((objc_msgSend(a1, "smoothedFloat32ImageBuffer:fromImageBuffer:originalImageSize:sigmaX:sigmaY:nStd:", v52, v51, width, height, v25, v26, v27) & 1) == 0)
    {
      if (a11)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:@"Unable to generate smoothed float-32 image buffer"];
        double v28 = 0;
        *a11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        double v28 = 0;
      }
      goto LABEL_17;
    }
  }
  else
  {
    vImagePixelCount v22 = a3->height;
    id v41 = 0;
    uint64_t data = (uint64_t)a3->data;
    vImagePixelCount v21 = a3->width;
    size_t rowBytes = a3->rowBytes;
  }
  if (v17)
  {
    v50[0] = data;
    v50[1] = v22;
    v50[2] = v21;
    v50[3] = rowBytes;
    [a1 maximumValueFromFloat32ImageBuffer:v50];
    float v30 = v29;
    id v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v19, "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v32 = v19;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v53 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v47 != v34) {
            objc_enumerationMutation(v32);
          }
          [*(id *)(*((void *)&v46 + 1) + 8 * i) floatValue];
          *(float *)&double v37 = v30 * v36;
          v38 = [NSNumber numberWithFloat:v37];
          [v31 addObject:v38];
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v53 count:16];
      }
      while (v33);
    }
  }
  else
  {
    id v31 = v19;
  }
  v45[0] = data;
  v45[1] = v22;
  v45[2] = v21;
  v45[3] = rowBytes;
  double v28 = [a1 boundingBoxesFromFloat32ImageBuffer:v45 thresholds:v31 error:a11];

LABEL_17:

  return v28;
}

+ (id)boundingBoxesFromFloat32ImageBuffer:(vImage_Buffer *)a3 thresholds:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v40 = a4;
  uint64_t v7 = [v40 count];
  uint64_t v8 = v7;
  if (v7)
  {
    v9 = malloc_type_malloc(4 * v7, 0x100004052888210uLL);
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
    uint64_t v11 = 0;
    do
    {
      v12 = objc_alloc_init(VNHeatMapExtrema);
      [v10 addObject:v12];
      v13 = [v40 objectAtIndexedSubscript:v11];
      [v13 floatValue];
      v9[v11] = v14;

      ++v11;
    }
    while (v8 != v11);
    vImagePixelCount height = a3->height;
    if (height)
    {
      vImagePixelCount v16 = 0;
      uint64_t data = (float *)a3->data;
      vImagePixelCount width = a3->width;
      do
      {
        if (width)
        {
          vImagePixelCount v19 = 0;
          uint64_t v20 = data;
          do
          {
            uint64_t v21 = 0;
            float v22 = *v20;
            do
            {
              if (v22 >= *(float *)&v9[v21])
              {
                v23 = [v10 objectAtIndexedSubscript:v21];
                *(float *)&double v24 = v22;
                [v23 updateExtrema:v19 x:v16 y:v24];
              }
              ++v21;
            }
            while (v8 != v21);
            ++v20;
            ++v19;
            vImagePixelCount width = a3->width;
          }
          while (v19 < width);
          vImagePixelCount height = a3->height;
        }
        uint64_t data = (float *)((char *)data + a3->rowBytes);
        ++v16;
      }
      while (v16 < height);
    }
    double v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v40;
    uint64_t v26 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v26)
    {
      uint64_t v27 = 0;
      uint64_t v28 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v46 != v28) {
            objc_enumerationMutation(obj);
          }
          [*(id *)(*((void *)&v45 + 1) + 8 * i) floatValue];
          unsigned int v31 = v30;
          id v32 = [v10 objectAtIndexedSubscript:v27 + i];
          long long v43 = 0u;
          long long v44 = 0u;
          long long v33 = *(_OWORD *)&a3->width;
          v42[0] = *(_OWORD *)&a3->data;
          v42[1] = v33;
          objc_msgSend(v32, "computeRectFromExtremaUsingThreshold:vImage:", v42, COERCE_DOUBLE(__PAIR64__(DWORD1(v42[0]), v31)));
          *(void *)&long long v43 = v34;
          *((void *)&v43 + 1) = v35;
          *(void *)&long long v44 = v36;
          *((void *)&v44 + 1) = v37;
          v38 = [MEMORY[0x1E4F29238] value:&v43 withObjCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
          [v25 addObject:v38];
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
        v27 += i;
      }
      while (v26);
    }

    free(v9);
  }
  else if (a5)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:@"thresholds not provided"];
    double v25 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v25 = 0;
  }

  return v25;
}

+ (id)significantRegionsFromFloat32PixelBuffer:(__CVBuffer *)a3 threshold:(float)a4 relativeToMaximum:(BOOL)a5 error:(id *)a6
{
  if (!a3)
  {
    if (a6)
    {
      v13 = @"pixelBuffer cannot be null";
LABEL_10:
      v12 = +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v13, a5);
      goto LABEL_11;
    }
LABEL_12:
    int v14 = 0;
    goto LABEL_14;
  }
  BOOL v7 = a5;
  if (CVPixelBufferGetPixelFormatType(a3) != 1278226534)
  {
    if (a6)
    {
      v13 = @"pixelBuffer is not in correct format. (Required format is one component, 32-float)";
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  uint64_t v11 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  if (v11)
  {
    if (a6)
    {
      v12 = +[VNError errorForCVReturnCode:v11 localizedDescription:@"unable to lock base address of pixelBuffer"];
LABEL_11:
      int v14 = 0;
      *a6 = v12;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  v17[0] = CVPixelBufferGetBaseAddress(a3);
  v17[1] = CVPixelBufferGetHeight(a3);
  v17[2] = CVPixelBufferGetWidth(a3);
  v17[3] = CVPixelBufferGetBytesPerRow(a3);
  *(float *)&double v15 = a4;
  int v14 = [a1 significantRegionsFromFloat32ImageBuffer:v17 threshold:v7 relativeToMaximum:v15];
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
LABEL_14:

  return v14;
}

+ (id)significantRegionsFromFloat32ImageBuffer:(vImage_Buffer *)a3 threshold:(float)a4 relativeToMaximum:(BOOL)a5
{
  if (a5)
  {
    long long v8 = *(_OWORD *)&a3->width;
    v14[0] = *(_OWORD *)&a3->data;
    v14[1] = v8;
    [a1 maximumValueFromFloat32ImageBuffer:v14];
    a4 = v9 * a4;
  }
  long long v10 = *(_OWORD *)&a3->width;
  v13[0] = *(_OWORD *)&a3->data;
  v13[1] = v10;
  uint64_t v11 = objc_msgSend(a1, "significantRegionsFromFloat32ImageBuffer:threshold:", v13, COERCE_DOUBLE(__PAIR64__(DWORD1(v13[0]), LODWORD(a4))));

  return v11;
}

+ (id)significantRegionsFromFloat32ImageBuffer:(vImage_Buffer *)a3 threshold:(float)a4
{
  unint64_t v6 = a3->height * a3->width;
  LOBYTE(v52) = 0;
  std::vector<BOOL>::vector(__p, v6, (unsigned __int8 *)&v52);
  vImagePixelCount height = a3->height;
  if (height)
  {
    long long v8 = 0;
    float v9 = 0;
    unint64_t v48 = 0;
    vImagePixelCount v10 = 0;
    vImagePixelCount width = a3->width;
    do
    {
      if (width)
      {
        vImagePixelCount v12 = 0;
        uint64_t v13 = v10;
        int v14 = __p[0];
        do
        {
          unsigned int v15 = v12 + width * v10;
          uint64_t v16 = v15 >> 6;
          uint64_t v17 = 1 << v15;
          if ((v14[v16] & (1 << v15)) == 0
            && *(float *)((char *)a3->data + 4 * v12 + a3->rowBytes * v13) > a4)
          {
            long long v49 = v8;
            CGFloat x = *MEMORY[0x1E4F1DB20];
            double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
            CGFloat v21 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
            double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
            float v22 = __p[1];
            long long v53 = 0u;
            long long v54 = 0u;
            long long v52 = 0u;
            unint64_t v51 = __PAIR64__(v10, v12);
            std::deque<std::pair<unsigned int,unsigned int>>::emplace_back<std::pair<unsigned int,unsigned int>>(&v52, &v51);
            while (*((void *)&v54 + 1))
            {
              unint64_t v23 = *(void *)(*(void *)(*((void *)&v52 + 1) + (((unint64_t)v54 >> 6) & 0x3FFFFFFFFFFFFF8))
                              + 8 * (v54 & 0x1FF));
              *(void *)&long long v54 = v54 + 1;
              --*((void *)&v54 + 1);
              if ((unint64_t)v54 >= 0x400)
              {
                operator delete(**((void ***)&v52 + 1));
                *((void *)&v52 + 1) += 8;
                *(void *)&long long v54 = v54 - 512;
              }
              if ((unint64_t)v22 > (v23 + LODWORD(a3->width) * HIDWORD(v23)))
              {
                unint64_t v24 = (unint64_t)(v23 + LODWORD(a3->width) * HIDWORD(v23)) >> 6;
                uint64_t v25 = 1 << (v23 + LOBYTE(a3->width) * BYTE4(v23));
                uint64_t v26 = *((void *)__p[0] + v24);
                if ((v26 & v25) == 0)
                {
                  *((void *)__p[0] + v24) = v26 | v25;
                  if (*(float *)((char *)a3->data + 4 * v23 + a3->rowBytes * HIDWORD(v23)) > a4)
                  {
                    v59.origin.CGFloat x = (float)v23;
                    v59.origin.double y = (float)HIDWORD(v23);
                    v59.size.vImagePixelCount width = 0.0;
                    v59.size.vImagePixelCount height = 0.0;
                    v56.origin.CGFloat x = x;
                    v56.origin.double y = y;
                    v56.size.vImagePixelCount width = v21;
                    v56.size.vImagePixelCount height = v20;
                    CGRect v57 = CGRectUnion(v56, v59);
                    CGFloat x = v57.origin.x;
                    double y = v57.origin.y;
                    CGFloat v21 = v57.size.width;
                    double v20 = v57.size.height;
                    if (a3->width > (v23 + 1))
                    {
                      LODWORD(v51) = v23 + 1;
                      HIDWORD(v51) = HIDWORD(v23);
                      std::deque<std::pair<unsigned int,unsigned int>>::emplace_back<std::pair<unsigned int,unsigned int>>(&v52, &v51);
                    }
                    if (v23)
                    {
                      LODWORD(v51) = v23 - 1;
                      HIDWORD(v51) = HIDWORD(v23);
                      std::deque<std::pair<unsigned int,unsigned int>>::emplace_back<std::pair<unsigned int,unsigned int>>(&v52, &v51);
                    }
                    if (a3->height > (HIDWORD(v23) + 1))
                    {
                      unint64_t v51 = v23 + 0x100000000;
                      std::deque<std::pair<unsigned int,unsigned int>>::emplace_back<std::pair<unsigned int,unsigned int>>(&v52, &v51);
                    }
                    if (HIDWORD(v23))
                    {
                      unint64_t v51 = v23 - 0x100000000;
                      std::deque<std::pair<unsigned int,unsigned int>>::emplace_back<std::pair<unsigned int,unsigned int>>(&v52, &v51);
                    }
                  }
                }
              }
            }
            double v27 = (double)a3->height - (y + v20);
            std::deque<std::pair<int,int>>::~deque[abi:ne180100]((uint64_t)&v52);
            v58.origin.CGFloat x = x;
            v58.origin.double y = v27;
            v58.size.vImagePixelCount width = v21;
            v58.size.vImagePixelCount height = v20;
            long long v8 = v49;
            if (!CGRectIsEmpty(v58))
            {
              if ((unint64_t)v9 >= v48)
              {
                uint64_t v28 = ((char *)v9 - (char *)v49) >> 5;
                unint64_t v29 = v28 + 1;
                if ((unint64_t)(v28 + 1) >> 59) {
                  std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                }
                if ((uint64_t)(v48 - (void)v49) >> 4 > v29) {
                  unint64_t v29 = (uint64_t)(v48 - (void)v49) >> 4;
                }
                if (v48 - (unint64_t)v49 >= 0x7FFFFFFFFFFFFFE0) {
                  unint64_t v30 = 0x7FFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v30 = v29;
                }
                if (v30) {
                  unint64_t v30 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vImage_Buffer>>(v30);
                }
                else {
                  uint64_t v31 = 0;
                }
                id v32 = (CGFloat *)(v30 + 32 * v28);
                *id v32 = x;
                v32[1] = v27;
                v32[2] = v21;
                v32[3] = v20;
                if (v9 == v49)
                {
                  unint64_t v35 = v30 + 32 * v28;
                }
                else
                {
                  unint64_t v33 = v30 + 32 * v28;
                  do
                  {
                    long long v34 = *((_OWORD *)v9 - 1);
                    unint64_t v35 = v33 - 32;
                    *(_OWORD *)(v33 - 32) = *((_OWORD *)v9 - 2);
                    *(_OWORD *)(v33 - 16) = v34;
                    v9 -= 4;
                    v33 -= 32;
                  }
                  while (v9 != v49);
                }
                unint64_t v48 = v30 + 32 * v31;
                float v9 = v32 + 4;
                if (v49) {
                  operator delete(v49);
                }
                long long v8 = (double *)v35;
              }
              else
              {
                CGFloat *v9 = x;
                v9[1] = v27;
                v9[2] = v21;
                v9[3] = v20;
                v9 += 4;
              }
            }
            uint64_t v13 = v10;
          }
          int v14 = __p[0];
          *((void *)__p[0] + v16) |= v17;
          ++v12;
          vImagePixelCount width = a3->width;
        }
        while (v12 < width);
        vImagePixelCount height = a3->height;
      }
      ++v10;
    }
    while (v10 < height);
  }
  else
  {
    long long v8 = 0;
    float v9 = 0;
  }
  if (__p[0]) {
    operator delete(__p[0]);
  }
  uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:((char *)v9 - (char *)v8) >> 5];
  if (v9 == v8)
  {
    v38 = v8;
    if (!v8) {
      goto LABEL_63;
    }
  }
  else
  {
    if ((unint64_t)(((char *)v9 - (char *)v8) >> 5) <= 1) {
      uint64_t v37 = 1;
    }
    else {
      uint64_t v37 = ((char *)v9 - (char *)v8) >> 5;
    }
    v38 = v8;
    v39 = v8 + 2;
    do
    {
      long long v52 = 0u;
      long long v53 = 0u;
      double v40 = 0.0;
      double v41 = 0.0;
      double v42 = 0.0;
      vImagePixelCount v43 = a3->width;
      if (v43)
      {
        double v41 = *(v39 - 2) / (double)v43;
        double v42 = *v39 / (double)v43;
      }
      vImagePixelCount v44 = a3->height;
      double v45 = 0.0;
      if (v44)
      {
        double v40 = *(v39 - 1) / (double)v44;
        double v45 = v39[1] / (double)v44;
      }
      *(double *)&long long v52 = v41;
      *((double *)&v52 + 1) = v40;
      *(double *)&long long v53 = v42;
      *((double *)&v53 + 1) = v45;
      long long v46 = [MEMORY[0x1E4F29238] value:&v52 withObjCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      [v36 addObject:v46];

      v39 += 4;
      --v37;
    }
    while (v37);
  }
  operator delete(v38);
LABEL_63:

  return v36;
}

+ (float)maximumValueFromFloat32ImageBuffer:(vImage_Buffer *)a3
{
  float __C = 1.1755e-38;
  vImagePixelCount width = a3->width;
  if (a3->rowBytes == 4 * width)
  {
    vDSP_maxv((const float *)a3->data, 1, &__C, a3->height * width);
    return __C;
  }
  else if (a3->height)
  {
    vImagePixelCount v6 = 0;
    uint64_t data = (const float *)a3->data;
    float v5 = 1.1755e-38;
    do
    {
      float v9 = 1.1755e-38;
      vDSP_maxv(data, 1, &v9, a3->width);
      if (v9 > v5) {
        float v5 = v9;
      }
      ++v6;
      uint64_t data = (const float *)((char *)data + a3->rowBytes);
    }
    while (v6 < a3->height);
  }
  else
  {
    return 1.1755e-38;
  }
  return v5;
}

+ (BOOL)smoothedFloat32ImageBuffer:(vImage_Buffer *)a3 fromImageBuffer:(vImage_Buffer *)a4 originalImageSize:(CGSize)a5 sigmaX:(float)a6 sigmaY:(float)a7 nStd:(float)a8
{
  if (!a3->data) {
    return 0;
  }
  double width = a5.width;
  float v12 = (float)a4->width * a6;
  if (a5.height <= width)
  {
    float v12 = a5.height * v12 / width;
    float v13 = (float)a4->height * a7;
  }
  else
  {
    float v13 = width * a7 * (double)a4->height / a5.height;
  }
  unint64_t v30 = 0;
  kernel = 0;
  *(void *)kernel_double width = 0;
  if (ImageProcessing_smoothGaussian_createKernelForPlanarF(&kernel, (int *)&kernel_width[1], v12, a8) == 4224)
  {
    uint64_t v15 = ImageProcessing_smoothGaussian_createKernelForPlanarF(&v30, (int *)kernel_width, v13, a8);
    uint64_t v16 = kernel;
    if (v15 == 4224 && kernel != 0 && v30 != 0)
    {
      vImagePixelCount v21 = a4->width;
      dest.vImagePixelCount height = a4->height;
      dest.double width = v21;
      dest.size_t rowBytes = (4 * v21 + 15) & 0xFFFFFFFFFFFFFFF0;
      size_t v22 = dest.rowBytes * dest.height;
      uint32_t v23 = kernel_width[1];
      vImage_Error v24 = vImageConvolve_PlanarF(a4, a3, 0, 0, 0, 0, 1u, kernel_width[1], 0.0, 0x88u);
      vImage_Error v25 = vImageConvolve_PlanarF(a4, a3, 0, 0, 0, 0, kernel_width[0], 1u, 0.0, 0x88u);
      if (v24 <= v25) {
        vImage_Error v26 = v25;
      }
      else {
        vImage_Error v26 = v24;
      }
      vImagePixelCount v19 = (char *)malloc_type_malloc(v26 + v22, 0x1055093BuLL);
      dest.uint64_t data = v19;
      double v27 = &v19[v22];
      if (vImageConvolve_PlanarF(a4, &dest, v27, 0, 0, kernel, 1u, v23, 0.0, 8u))
      {
        unsigned __int8 v20 = 122;
      }
      else if (vImageConvolve_PlanarF(&dest, a3, v27, 0, 0, v30, kernel_width[0], 1u, 0.0, 8u))
      {
        unsigned __int8 v20 = 122;
      }
      else
      {
        unsigned __int8 v20 = 0x80;
      }
      uint64_t v16 = kernel;
      goto LABEL_27;
    }
    vImagePixelCount v19 = 0;
  }
  else
  {
    vImagePixelCount v19 = 0;
    uint64_t v16 = kernel;
  }
  unsigned __int8 v20 = 123;
LABEL_27:
  free(v16);
  free(v30);
  BOOL result = v20 == 128;
  if (v20 == 128)
  {
    free(v19);
    return 1;
  }
  return result;
}

@end