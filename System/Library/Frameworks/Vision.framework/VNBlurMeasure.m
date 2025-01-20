@interface VNBlurMeasure
+ (BOOL)computeApproximateBlurScore:(float *)a3 onGrayscaleImage:(__CVBuffer *)a4 sampledPixelsCount:(int)a5 insetFactor:(float)a6 error:(id *)a7;
+ (BOOL)computeApproximateBlurScore:(float *)a3 onRGBAImage:(__CVBuffer *)a4 sampledPixelsCount:(int)a5 insetFactor:(float)a6 error:(id *)a7;
+ (BOOL)computeBlurScore:(float *)a3 onGrayscaleImage:(__CVBuffer *)a4 andWithRegionOfInterestInImageCoordinates:(CGRect)a5 andRegionOfInterestInsetFactor:(float)a6 error:(id *)a7;
+ (BOOL)computeBlurScore:(float *)a3 onGrayscaleImage:(__CVBuffer *)a4 insetFactor:(float)a5 error:(id *)a6;
+ (BOOL)computeBlurScore:(float *)a3 usingBlurSignature:(id)a4 insetFactor:(float)a5 imageROI:(CGRect)a6 error:(id *)a7;
+ (BOOL)computeEdgeWidthBlurScore:(float *)a3 onGrayscaleImage:(__CVBuffer *)a4 error:(id *)a5;
@end

@implementation VNBlurMeasure

+ (BOOL)computeApproximateBlurScore:(float *)a3 onRGBAImage:(__CVBuffer *)a4 sampledPixelsCount:(int)a5 insetFactor:(float)a6 error:(id *)a7
{
  HIDWORD(v21) = 1065353216;
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  Width = (unsigned __int8 *)CVPixelBufferGetWidth(a4);
  int Height = CVPixelBufferGetHeight(a4);
  BytesPerRow = (int *)CVPixelBufferGetBytesPerRow(a4);
  BaseAddress = (_anonymous_namespace_ *)CVPixelBufferGetBaseAddress(a4);
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
  if (v17 == 2688)
  {
    if (a3) {
      *a3 = *((float *)&v21 + 1);
    }
  }
  else if (a7)
  {
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"Error while computing blur score: %s", CVML_getStatusDescription(v17));
    *a7 = +[VNError errorWithCode:3 message:v18];
  }
  return v17 == 2688;
}

+ (BOOL)computeApproximateBlurScore:(float *)a3 onGrayscaleImage:(__CVBuffer *)a4 sampledPixelsCount:(int)a5 insetFactor:(float)a6 error:(id *)a7
{
  HIDWORD(v21) = 1065353216;
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  Width = (unsigned __int8 *)CVPixelBufferGetWidth(a4);
  int Height = CVPixelBufferGetHeight(a4);
  BytesPerRow = (int *)CVPixelBufferGetBytesPerRow(a4);
  BaseAddress = (_anonymous_namespace_ *)CVPixelBufferGetBaseAddress(a4);
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
  if (v17 == 2688)
  {
    if (a3) {
      *a3 = *((float *)&v21 + 1);
    }
  }
  else if (a7)
  {
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"Error while computing blur score: %s", CVML_getStatusDescription(v17));
    *a7 = +[VNError errorWithCode:3 message:v18];
  }
  return v17 == 2688;
}

+ (BOOL)computeEdgeWidthBlurScore:(float *)a3 onGrayscaleImage:(__CVBuffer *)a4 error:(id *)a5
{
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  v9 = (char *)malloc_type_malloc(Height * Width, 0x69E79101uLL);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
  size_t v12 = Width - 2;
  size_t v13 = Height - 2;
  if (Height == 2)
  {
    int v37 = 0;
    int v36 = 0;
    if (Width == 2) {
      goto LABEL_72;
    }
    goto LABEL_43;
  }
  uint64_t v14 = 0;
  v15 = BaseAddressOfPlane + 1;
  v16 = BaseAddressOfPlane + 2;
  do
  {
    if (Width == 2)
    {
      uint64_t v17 = v14 + 1;
    }
    else
    {
      uint64_t v17 = v14 + 1;
      uint64_t v18 = v14 + 2;
      v19 = &v9[v14 * Width];
      v20 = &v15[v14 * BytesPerRowOfPlane];
      v21 = &v16[BytesPerRowOfPlane * (v14 + 1)];
      v22 = &v16[BytesPerRowOfPlane * v18];
      size_t v23 = Width - 2;
      v24 = v20;
      do
      {
        int v25 = *(v20 - 1);
        int v27 = *++v24;
        int v26 = v27;
        int v28 = *(v21 - 2);
        int v29 = *v21++;
        int v30 = *(v22 - 2);
        int v31 = *v22;
        int v32 = v26 - (v25 + v30) + v31 + 2 * (v29 - v28);
        int v33 = v30 - (v26 + v25) + v31 + 2 * (*(v22 - 1) - *v20);
        unsigned int v34 = (v32 * v32 + v33 * v33) >> 4;
        if (v34 >= 0xFF) {
          LOBYTE(v34) = -1;
        }
        *v19++ = v34;
        ++v22;
        v20 = v24;
        --v23;
      }
      while (v23);
    }
    uint64_t v14 = v17;
  }
  while (v17 != v13);
  uint64_t v35 = 0;
  int v36 = 0;
  int v37 = 0;
  v38 = v9;
  do
  {
    if (Width != 2)
    {
      uint64_t v39 = 0;
      int v40 = 0;
      int v41 = 0;
      BOOL v42 = 0;
      do
      {
        unsigned int v43 = v38[v39];
        BOOL v44 = v43 > 0x63;
        if (v43 < 0x64)
        {
          int v50 = v42 && v41 > 0;
          int v51 = v39 + v36 - v41;
          if ((int)v39 - v41 < 3) {
            int v52 = v37;
          }
          else {
            int v52 = v37 + 1;
          }
          if ((int)v39 - v41 < 3) {
            int v51 = v36;
          }
          if (v50 == 1)
          {
            int v37 = v52;
            int v36 = v51;
          }
        }
        else
        {
          int v45 = v39 - v41 + v36;
          if ((int)v39 - v41 < 3) {
            int v46 = v37;
          }
          else {
            int v46 = v37 + 1;
          }
          if ((int)v39 - v41 < 3) {
            int v45 = v36;
          }
          if (v41 < 1)
          {
            int v46 = v37;
            int v45 = v36;
          }
          BOOL v47 = v40 == 1;
          if (v40 == 1) {
            int v48 = v37;
          }
          else {
            int v48 = v46;
          }
          if (v47)
          {
            int v45 = v36;
            int v49 = 1;
          }
          else
          {
            int v49 = 0;
          }
          if (v42)
          {
            int v37 = v48;
            int v36 = v45;
            int v40 = v49;
          }
          else
          {
            int v41 = v39;
            int v40 = 1;
          }
        }
        ++v39;
        BOOL v42 = v44;
      }
      while (v12 != v39);
    }
    ++v35;
    v38 += Width;
  }
  while (v35 != v13);
  if (Width != 2)
  {
LABEL_43:
    uint64_t v53 = 0;
    v54 = (unsigned __int8 *)v9;
    do
    {
      if (Height != 2)
      {
        uint64_t v55 = 0;
        int v56 = 0;
        int v57 = 0;
        BOOL v58 = 0;
        v59 = v54;
        do
        {
          unsigned int v60 = *v59;
          BOOL v61 = v60 > 0x63;
          if (v60 < 0x64)
          {
            int v67 = v58 && v57 > 0;
            int v68 = v55 + v36 - v57;
            if ((int)v55 - v57 < 3) {
              int v69 = v37;
            }
            else {
              int v69 = v37 + 1;
            }
            if ((int)v55 - v57 < 3) {
              int v68 = v36;
            }
            if (v67 == 1)
            {
              int v37 = v69;
              int v36 = v68;
            }
          }
          else
          {
            int v62 = v55 - v57 + v36;
            if ((int)v55 - v57 < 3) {
              int v63 = v37;
            }
            else {
              int v63 = v37 + 1;
            }
            if ((int)v55 - v57 < 3) {
              int v62 = v36;
            }
            if (v57 < 1)
            {
              int v63 = v37;
              int v62 = v36;
            }
            BOOL v64 = v56 == 1;
            if (v56 == 1) {
              int v65 = v37;
            }
            else {
              int v65 = v63;
            }
            if (v64)
            {
              int v62 = v36;
              int v66 = 1;
            }
            else
            {
              int v66 = 0;
            }
            if (v58)
            {
              int v37 = v65;
              int v36 = v62;
              int v56 = v66;
            }
            else
            {
              int v57 = v55;
              int v56 = 1;
            }
          }
          v59 += Width;
          ++v55;
          BOOL v58 = v61;
        }
        while (v13 != v55);
      }
      ++v53;
      ++v54;
    }
    while (v53 != v12);
  }
LABEL_72:
  float v70 = 0.0;
  if (Height + Width <= v37) {
    float v70 = 4.0 / (float)((float)v36 / (float)v37);
  }
  float v71 = fmaxf(1.0 - v70, 0.0);
  if (v71 > 1.0) {
    float v71 = 1.0;
  }
  *a3 = v71;
  free(v9);
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
  return 1;
}

+ (BOOL)computeBlurScore:(float *)a3 usingBlurSignature:(id)a4 insetFactor:(float)a5 imageROI:(CGRect)a6 error:(id *)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v14 = a4;
  int v21 = 1065353216;
  v15 = (vision::mod::image_quality::BlurMeasure *)[v14 getSignatureData];
  v22.origin.double x = x;
  v22.origin.double y = y;
  v22.size.double height = height;
  v22.size.double width = width;
  unint64_t v17 = vision::mod::image_quality::BlurMeasure::computeEdgeBasedBlurForImageRegionUsingBlurSignature(v15, (float *)&v21, v22, 0, a5, 0, v16);
  unint64_t v18 = v17;
  if (v17 == 2688)
  {
    if (a3) {
      *(_DWORD *)a3 = v21;
    }
  }
  else if (a7)
  {
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"Error while computing blur score: %s", CVML_getStatusDescription(v17));
    *a7 = +[VNError errorWithCode:3 message:v19];
  }
  return v18 == 2688;
}

+ (BOOL)computeBlurScore:(float *)a3 onGrayscaleImage:(__CVBuffer *)a4 insetFactor:(float)a5 error:(id *)a6
{
  double Width = (double)CVPixelBufferGetWidth(a4);
  double Height = (double)CVPixelBufferGetHeight(a4);
  *(float *)&double v13 = a5;

  return objc_msgSend(a1, "computeBlurScore:onGrayscaleImage:andWithRegionOfInterestInImageCoordinates:andRegionOfInterestInsetFactor:error:", a3, a4, a6, 0.0, 0.0, Width, Height, v13);
}

+ (BOOL)computeBlurScore:(float *)a3 onGrayscaleImage:(__CVBuffer *)a4 andWithRegionOfInterestInImageCoordinates:(CGRect)a5 andRegionOfInterestInsetFactor:(float)a6 error:(id *)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  *(_DWORD *)int v27 = 1065353216;
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  unint64_t v15 = (unint64_t)(y + height + 0.5);
  size_t v16 = CVPixelBufferGetHeight(a4);
  if (x >= 0.0) {
    unint64_t v17 = (unint64_t)(x + 0.5);
  }
  else {
    unint64_t v17 = 0;
  }
  if (v16 >= v15) {
    size_t v18 = v16 - v15;
  }
  else {
    size_t v18 = 0;
  }
  if (height >= 0.0) {
    unint64_t v19 = (unint64_t)(height + 0.5);
  }
  else {
    unint64_t v19 = 0;
  }
  if (width >= 0.0) {
    unint64_t v20 = (unint64_t)(width + 0.5);
  }
  else {
    unint64_t v20 = 0;
  }
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  v26[0] = (char *)CVPixelBufferGetBaseAddress(a4) + v18 * BytesPerRow + v17;
  v26[1] = v19;
  v26[2] = v20;
  v26[3] = BytesPerRow;
  unint64_t v23 = vision::mod::image_quality::BlurMeasure::computeEdgeBasedBlurScoreForPlanar8Image((vision::mod::image_quality::BlurMeasure *)v26, (vImage_Buffer *)v27, 0, a6, 0, 0, v22);
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
  if (v23 == 2688)
  {
    if (a3) {
      *a3 = *(float *)v27;
    }
  }
  else if (a7)
  {
    v24 = objc_msgSend(NSString, "stringWithFormat:", @"Error while computing blur score: %s", CVML_getStatusDescription(v23));
    *a7 = +[VNError errorWithCode:3 message:v24];
  }
  return v23 == 2688;
}

@end