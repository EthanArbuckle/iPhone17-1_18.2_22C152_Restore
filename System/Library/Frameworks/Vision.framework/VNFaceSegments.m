@interface VNFaceSegments
+ (BOOL)supportsSecureCoding;
+ (NSDictionary)faceSegmentIndexToFlagMap;
+ (NSDictionary)faceSegmentToSegmentMaskGrayLevelDictionary;
+ (unint64_t)faceSegmentsPixelSizeInBytes;
- (BOOL)isEqual:(id)a3;
- (CGRect)_normalizeRegion:(CGRect)a3;
- (CGRect)boundingBox;
- (NSData)outputBufferData;
- (NSDictionary)faceSegmentLabelToProbabilityMap;
- (VNFaceSegments)initWithCoder:(id)a3;
- (VNFaceSegments)initWithRequestRevision:(unint64_t)a3 outputBufferWidth:(unint64_t)a4 outputBufferHeight:(unint64_t)a5 outputBufferData:(id)a6 numberOfFaceSegments:(unint64_t)a7 faceSegmentBBox:(CGRect)a8 faceSegmentLabelToProbabilityMap:(id)a9;
- (__CVBuffer)_createFaceSegmentProabilityDataPixelBufferWithSize:(CGSize)a3 error:(id *)a4;
- (__CVBuffer)createMaskImageOfFaceSegments:(unint64_t)a3 error:(id *)a4;
- (__CVBuffer)createProbabilityImageOfFaceSegment:(unint64_t)a3 error:(id *)a4;
- (__CVBuffer)createProbabilityImageOfFaceSegment:(unint64_t)a3 region:(CGRect)a4 normalize:(BOOL)a5 error:(id *)a6;
- (id).cxx_construct;
- (unint64_t)hash;
- (unint64_t)numberOfFaceSegments;
- (unint64_t)outputBufferHeight;
- (unint64_t)outputBufferWidth;
- (unint64_t)requestRevision;
- (vImage_Buffer)_makeFaceSegmentProbabilityDataImageBuffer:(SEL)a3 rect:(id)a4;
- (void)_calculateProbabilityNormalSumsForRect:(CGRect)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNFaceSegments

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_probabilityNormSums.__begin_;
  if (begin)
  {
    self->_probabilityNormSums.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_faceSegmentLabelToProbabilityMap, 0);

  objc_storeStrong((id *)&self->_outputBufferData, 0);
}

- (NSDictionary)faceSegmentLabelToProbabilityMap
{
  return self->_faceSegmentLabelToProbabilityMap;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)numberOfFaceSegments
{
  return self->_numberOfFaceSegments;
}

- (NSData)outputBufferData
{
  return self->_outputBufferData;
}

- (unint64_t)outputBufferHeight
{
  return self->_outputBufferHeight;
}

- (unint64_t)outputBufferWidth
{
  return self->_outputBufferWidth;
}

- (unint64_t)requestRevision
{
  return self->_requestRevision;
}

- (void)_calculateProbabilityNormalSumsForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  p_probabilityNormSums = (char **)&self->_probabilityNormSums;
  if (self->_probabilityNormSums.__begin_ == self->_probabilityNormSums.__end_)
  {
    v7 = self;
    unint64_t v8 = self->_outputBufferHeight * self->_outputBufferWidth;
    int v42 = 2143289344;
    std::vector<float>::resize(p_probabilityNormSums, v8, &v42);
    self = v7;
  }
  v37 = self;
  unint64_t numberOfFaceSegments = self->_numberOfFaceSegments;
  if (numberOfFaceSegments)
  {
    if (numberOfFaceSegments >> 60) {
      std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
    }
    v10 = (uint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(numberOfFaceSegments);
    v12 = &v10[2 * v11];
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v13 = +[VNFaceSegments faceSegmentToSegmentMaskGrayLevelDictionary];
  v14 = [v13 allKeys];

  id obj = v14;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v39;
    v17 = v10;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(obj);
        }
        v19 = [(NSDictionary *)v37->_faceSegmentLabelToProbabilityMap objectForKeyedSubscript:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        id v20 = [v19 objectForKeyedSubscript:@"data"];
        uint64_t v21 = [v20 bytes];

        v22 = [v19 objectForKeyedSubscript:@"rowBytes"];
        uint64_t v23 = [v22 unsignedIntegerValue];

        if (v17 >= v12)
        {
          uint64_t v24 = ((char *)v17 - (char *)v10) >> 4;
          unint64_t v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 60) {
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          }
          if (v12 - v10 > v25) {
            unint64_t v25 = v12 - v10;
          }
          if ((unint64_t)((char *)v12 - (char *)v10) >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v26 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v26 = v25;
          }
          if (v26) {
            unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v26);
          }
          else {
            uint64_t v27 = 0;
          }
          v28 = (uint64_t *)(v26 + 16 * v24);
          uint64_t *v28 = v21;
          v28[1] = v23;
          if (v17 == v10)
          {
            v30 = (uint64_t *)(v26 + 16 * v24);
          }
          else
          {
            unint64_t v29 = v26 + 16 * v24;
            do
            {
              v30 = (uint64_t *)(v29 - 16);
              *(_OWORD *)(v29 - 16) = *((_OWORD *)v17 - 1);
              v17 -= 2;
              v29 -= 16;
            }
            while (v17 != v10);
          }
          v12 = (uint64_t *)(v26 + 16 * v27);
          v17 = v28 + 2;
          if (v10) {
            operator delete(v10);
          }
          v10 = v30;
        }
        else
        {
          uint64_t *v17 = v21;
          v17[1] = v23;
          v17 += 2;
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v15);
  }

  if ((int)height >= 1)
  {
    unint64_t outputBufferWidth = v37->_outputBufferWidth;
    uint64_t v32 = (int)y;
    uint64_t v33 = (uint64_t)&(*p_probabilityNormSums)[4 * outputBufferWidth * v32];
    do
    {
      uint64_t v34 = (int)x;
      if ((int)width >= 1)
      {
        do
          ++v34;
        while (v34 < (int)x + (int)width);
      }
      v33 += 4 * outputBufferWidth;
      ++v32;
    }
    while (v32 < (int)y + (int)height);
  }
  if (v10) {
    operator delete(v10);
  }
}

- (__CVBuffer)_createFaceSegmentProabilityDataPixelBufferWithSize:(CGSize)a3 error:(id *)a4
{
  return +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, (unint64_t)a3.width, (unint64_t)a3.height, 1278226534, a4);
}

- (vImage_Buffer)_makeFaceSegmentProbabilityDataImageBuffer:(SEL)a3 rect:(id)a4
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v15 = a4;
  v10 = [v15 objectForKeyedSubscript:@"rowBytes"];
  size_t v11 = [v10 unsignedIntegerValue];

  id v12 = [v15 objectForKeyedSubscript:@"data"];
  v13 = (void *)([v12 bytes] + v11 * (unint64_t)y + 4 * (unint64_t)x);

  retstr->data = v13;
  retstr->double height = (unint64_t)height;
  retstr->double width = (unint64_t)width;
  retstr->rowBytes = v11;

  return result;
}

- (CGRect)_normalizeRegion:(CGRect)a3
{
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  double v5 = (a3.origin.x - self->_boundingBox.origin.x) / (1.0 / width);
  double v6 = (a3.origin.y - self->_boundingBox.origin.y) / (1.0 / height);
  double v7 = a3.size.width / width;
  double v8 = a3.size.height / height;
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (__CVBuffer)createProbabilityImageOfFaceSegment:(unint64_t)a3 region:(CGRect)a4 normalize:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  faceSegmentLabelToProbabilityMap = self->_faceSegmentLabelToProbabilityMap;
  v14 = [NSNumber numberWithUnsignedInteger:a3];
  id v15 = [(NSDictionary *)faceSegmentLabelToProbabilityMap objectForKeyedSubscript:v14];

  if (!v15)
  {
    if (a6)
    {
      long long v39 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Cannot create CVPixelBuffer object: faceSegment parameter is out of range"];
LABEL_16:
      uint64_t v27 = 0;
      *a6 = v39;
      goto LABEL_23;
    }
LABEL_22:
    uint64_t v27 = 0;
    goto LABEL_23;
  }
  v48.origin.double x = x;
  v48.origin.double y = y;
  v48.size.double width = width;
  v48.size.double height = height;
  if (!CGRectContainsRect(self->_boundingBox, v48))
  {
    if (a6)
    {
      long long v39 = +[VNError errorForInvalidArgumentWithLocalizedDescription:@"Cannot create CVPixelBuffer object: region parameter is out of range"];
      goto LABEL_16;
    }
    goto LABEL_22;
  }
  -[VNFaceSegments _normalizeRegion:](self, "_normalizeRegion:", x, y, width, height);
  unint64_t outputBufferHeight = self->_outputBufferHeight;
  double outputBufferWidth = (double)self->_outputBufferWidth;
  double v21 = v20 * outputBufferWidth;
  double v23 = v22 * outputBufferWidth;
  double v24 = (1.0 - v16 - v17) * (double)outputBufferHeight;
  double v25 = v17 * (double)outputBufferHeight;
  memset(&src, 0, sizeof(src));
  -[VNFaceSegments _makeFaceSegmentProbabilityDataImageBuffer:rect:](self, "_makeFaceSegmentProbabilityDataImageBuffer:rect:", v15, v20 * outputBufferWidth, v24, v22 * outputBufferWidth, v25);
  unint64_t v26 = -[VNFaceSegments _createFaceSegmentProabilityDataPixelBufferWithSize:error:](self, "_createFaceSegmentProabilityDataPixelBufferWithSize:error:", a6, v23, v25);
  uint64_t v27 = v26;
  if (v26)
  {
    CVPixelBufferLockBaseAddress(v26, 0);
    if (v7)
    {
      -[VNFaceSegments _calculateProbabilityNormalSumsForRect:](self, "_calculateProbabilityNormalSumsForRect:", v21, v24, v23, v25);
      size_t rowBytes = src.rowBytes;
      data = (float *)src.data;
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v27);
      BaseAddress = (float *)CVPixelBufferGetBaseAddress(v27);
      if ((int)v25 < 1)
      {
        vImage_Error v38 = 0;
      }
      else
      {
        v30 = BaseAddress;
        int v42 = a6;
        v43 = v15;
        int v31 = (int)v23;
        uint64_t v32 = (int)v21;
        uint64_t v33 = (int)v21 + (int)v23;
        uint64_t v34 = (int)v24;
        do
        {
          if (v31 >= 1)
          {
            uint64_t v35 = 0;
            v36 = &self->_probabilityNormSums.__begin_[v32 + self->_outputBufferWidth * v34];
            do
            {
              float v37 = v36[v35];
              v30[v35] = expf(data[v35]) / v37;
              ++v35;
            }
            while (v32 + v35 < v33);
          }
          v30 = (float *)((char *)v30 + BytesPerRow);
          data = (float *)((char *)data + rowBytes);
          ++v34;
        }
        while (v34 < (int)v24 + (int)v25);
        vImage_Error v38 = 0;
        a6 = v42;
        id v15 = v43;
      }
    }
    else
    {
      dest.data = CVPixelBufferGetBaseAddress(v27);
      dest.double height = CVPixelBufferGetHeight(v27);
      dest.double width = CVPixelBufferGetWidth(v27);
      dest.size_t rowBytes = CVPixelBufferGetBytesPerRow(v27);
      vImage_Error v38 = vImageCopyBuffer(&src, &dest, 4uLL, 0);
    }
    CVPixelBufferUnlockBaseAddress(v27, 0);
    if (v38)
    {
      if (a6)
      {
        long long v40 = objc_msgSend(NSString, "stringWithFormat:", @"Cannot copy face segment probability map. Error = %d", v38);
        *a6 = +[VNError errorForInternalErrorWithLocalizedDescription:v40];
      }
      goto LABEL_22;
    }
  }
LABEL_23:

  return v27;
}

- (__CVBuffer)createProbabilityImageOfFaceSegment:(unint64_t)a3 error:(id *)a4
{
  return -[VNFaceSegments createProbabilityImageOfFaceSegment:region:normalize:error:](self, "createProbabilityImageOfFaceSegment:region:normalize:error:", a3, 0, a4, self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
}

- (__CVBuffer)createMaskImageOfFaceSegments:(unint64_t)a3 error:(id *)a4
{
  int v31 = a3;
  v4 = self;
  v28 = a4;
  double v5 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, (unint64_t)(double)[(VNFaceSegments *)self outputBufferWidth], (unint64_t)(double)[(VNFaceSegments *)self outputBufferHeight], 1278226488, a4);
  double v6 = v5;
  if (v5)
  {
    CVPixelBufferLockBaseAddress(v5, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(v6);
    size_t Height = CVPixelBufferGetHeight(v6);
    size_t Width = CVPixelBufferGetWidth(v6);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v6);
    unint64_t v29 = BaseAddress;
    bzero(BaseAddress, BytesPerRow * Height);
    uint64_t v32 = +[VNFaceSegments faceSegmentIndexToFlagMap];
    uint64_t v11 = [(VNFaceSegments *)v4 numberOfFaceSegments];
    if (v11)
    {
      uint64_t v12 = 0;
      size_t v13 = BytesPerRow - Width;
      uint64_t v30 = v11;
      while (1)
      {
        v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v12, v28);
        id v15 = [v32 objectForKeyedSubscript:v14];

        if (!v15) {
          break;
        }
        if (([v15 intValue] & v31) != 0)
        {
          uint64_t v33 = +[VNFaceSegments faceSegmentToSegmentMaskGrayLevelDictionary];
          double v16 = v4;
          [(VNFaceSegments *)v4 outputBufferData];
          double v17 = v6;
          id v18 = objc_claimAutoreleasedReturnValue();
          uint64_t v19 = [v18 bytes];

          double v20 = [v33 objectForKey:v15];
          char v21 = [v20 unsignedCharValue];

          double v6 = v17;
          v4 = v16;
          if (Height)
          {
            uint64_t v22 = 0;
            double v23 = v29;
            do
            {
              double v24 = (unsigned __int8 *)v19;
              for (size_t i = Width; i; --i)
              {
                int v26 = *v24++;
                if (v12 == v26) {
                  *double v23 = v21;
                }
                ++v23;
              }
              v23 += v13;
              ++v22;
              v19 += Width;
            }
            while (v22 != Height);
          }
        }
        if (++v12 == v30) {
          goto LABEL_15;
        }
      }
      if (v28)
      {
        id *v28 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Cannot create CVPixelBuffer object: faceSegments is out of range"];
      }
      CVPixelBufferUnlockBaseAddress(v6, 0);
      double v6 = 0;
    }
    else
    {
LABEL_15:
      CVPixelBufferUnlockBaseAddress(v6, 0);
    }
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNFaceSegments *)a3;
  if (self == v4)
  {
    char v27 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      unint64_t v6 = [(VNFaceSegments *)self requestRevision];
      if (v6 != [(VNFaceSegments *)v5 requestRevision]) {
        goto LABEL_12;
      }
      unint64_t v7 = [(VNFaceSegments *)self outputBufferWidth];
      if (v7 != [(VNFaceSegments *)v5 outputBufferWidth]) {
        goto LABEL_12;
      }
      unint64_t v8 = [(VNFaceSegments *)self outputBufferHeight];
      if (v8 != [(VNFaceSegments *)v5 outputBufferHeight]) {
        goto LABEL_12;
      }
      v9 = [(VNFaceSegments *)self outputBufferData];
      v10 = [(VNFaceSegments *)v5 outputBufferData];
      char v11 = VisionCoreEqualOrNilObjects();

      if ((v11 & 1) == 0) {
        goto LABEL_12;
      }
      unint64_t v12 = [(VNFaceSegments *)self numberOfFaceSegments];
      if (v12 != [(VNFaceSegments *)v5 numberOfFaceSegments]) {
        goto LABEL_12;
      }
      [(VNFaceSegments *)self boundingBox];
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      [(VNFaceSegments *)v5 boundingBox];
      v30.origin.double x = v21;
      v30.origin.double y = v22;
      v30.size.double width = v23;
      v30.size.double height = v24;
      v29.origin.double x = v14;
      v29.origin.double y = v16;
      v29.size.double width = v18;
      v29.size.double height = v20;
      if (CGRectEqualToRect(v29, v30))
      {
        double v25 = [(VNFaceSegments *)self faceSegmentLabelToProbabilityMap];
        int v26 = [(VNFaceSegments *)v5 faceSegmentLabelToProbabilityMap];
        char v27 = VisionCoreEqualOrNilObjects();
      }
      else
      {
LABEL_12:
        char v27 = 0;
      }
    }
    else
    {
      char v27 = 0;
    }
  }

  return v27;
}

- (unint64_t)hash
{
  v3 = [(VNFaceSegments *)self outputBufferData];
  uint64_t v4 = [v3 hash];

  double v5 = [(VNFaceSegments *)self faceSegmentLabelToProbabilityMap];
  uint64_t v6 = [v5 hash] ^ __ROR8__(v4, 51);

  unint64_t v7 = [(VNFaceSegments *)self numberOfFaceSegments] ^ __ROR8__([(VNFaceSegments *)self outputBufferHeight] ^ __ROR8__([(VNFaceSegments *)self outputBufferWidth] ^ __ROR8__([(VNFaceSegments *)self requestRevision] ^ __ROR8__(v6, 51), 51), 51), 51);
  [(VNFaceSegments *)self boundingBox];
  double v12 = v11;
  if (v11 == 0.0) {
    double v12 = 0.0;
  }
  double v13 = v8;
  if (v8 == 0.0) {
    double v13 = 0.0;
  }
  uint64_t v14 = *(void *)&v13 ^ __ROR8__(*(void *)&v12, 51);
  double v15 = v9;
  if (v9 == 0.0) {
    double v15 = 0.0;
  }
  uint64_t v16 = *(void *)&v15 ^ __ROR8__(v14, 51);
  double v17 = v10;
  if (v10 == 0.0) {
    double v17 = 0.0;
  }
  return *(void *)&v17 ^ __ROR8__(v16, 51) ^ __ROR8__(v7, 51);
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:0];
  [v9 encodeObject:v4 forKey:@"VNFaceSegmentsVersion"];

  [v9 encodeInteger:self->_requestRevision forKey:@"fsRev"];
  [v9 encodeInteger:self->_outputBufferWidth forKey:@"fsWidth"];
  [v9 encodeInteger:self->_outputBufferHeight forKey:@"fsHeight"];
  [v9 encodeObject:self->_outputBufferData forKey:@"fsData"];
  [v9 encodeInteger:self->_numberOfFaceSegments forKey:@"fsNumOfSgmnts"];
  CGFloat x = self->_boundingBox.origin.x;
  *(float *)&CGFloat x = x;
  [v9 encodeFloat:@"fsBBoxOrgX" forKey:x];
  CGFloat y = self->_boundingBox.origin.y;
  *(float *)&CGFloat y = y;
  [v9 encodeFloat:@"fsBBoxOrgY" forKey:y];
  CGFloat width = self->_boundingBox.size.width;
  *(float *)&CGFloat width = width;
  [v9 encodeFloat:@"fsBBoxSzW" forKey:width];
  CGFloat height = self->_boundingBox.size.height;
  *(float *)&CGFloat height = height;
  [v9 encodeFloat:@"fsBBoxSzH" forKey:height];
  [v9 encodeObject:self->_faceSegmentLabelToProbabilityMap forKey:@"fsLblToProbMap"];
}

- (VNFaceSegments)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VNFaceSegmentsVersion"];
  uint64_t v6 = v5;
  if (v5 && ![v5 unsignedIntValue])
  {
    uint64_t v8 = [v4 decodeIntegerForKey:@"fsRev"];
    uint64_t v9 = [v4 decodeIntegerForKey:@"fsWidth"];
    uint64_t v10 = [v4 decodeIntegerForKey:@"fsHeight"];
    double v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fsData"];
    uint64_t v12 = [v4 decodeIntegerForKey:@"fsNumOfSgmnts"];
    uint64_t v13 = [(id)objc_opt_class() faceSegmentsPixelSizeInBytes];
    if (v10 * v9 * v13 == [v11 length])
    {
      [v4 decodeFloatForKey:@"fsBBoxOrgX"];
      float v15 = v14;
      [v4 decodeFloatForKey:@"fsBBoxOrgY"];
      float v17 = v16;
      [v4 decodeFloatForKey:@"fsBBoxSzW"];
      float v19 = v18;
      uint64_t v30 = v12;
      uint64_t v31 = v8;
      [v4 decodeFloatForKey:@"fsBBoxSzH"];
      float v21 = v20;
      CGFloat v22 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = objc_opt_class();
      int v26 = objc_msgSend(v22, "setWithObjects:", v23, v24, v25, objc_opt_class(), 0);
      char v27 = [v4 decodeObjectOfClasses:v26 forKey:@"fsLblToProbMap"];

      self = -[VNFaceSegments initWithRequestRevision:outputBufferWidth:outputBufferHeight:outputBufferData:numberOfFaceSegments:faceSegmentBBox:faceSegmentLabelToProbabilityMap:](self, "initWithRequestRevision:outputBufferWidth:outputBufferHeight:outputBufferData:numberOfFaceSegments:faceSegmentBBox:faceSegmentLabelToProbabilityMap:", v31, v9, v10, v11, v30, v27, v15, v17, v19, v21);
      unint64_t v7 = self;
    }
    else
    {
      char v27 = (void *)[[NSString alloc] initWithFormat:@"Data integrity check failed when un-archiving an object of type: %@", objc_opt_class()];
      v28 = +[VNError errorForInternalErrorWithLocalizedDescription:v27];
      [v4 failWithError:v28];

      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (VNFaceSegments)initWithRequestRevision:(unint64_t)a3 outputBufferWidth:(unint64_t)a4 outputBufferHeight:(unint64_t)a5 outputBufferData:(id)a6 numberOfFaceSegments:(unint64_t)a7 faceSegmentBBox:(CGRect)a8 faceSegmentLabelToProbabilityMap:(id)a9
{
  CGFloat height = a8.size.height;
  CGFloat width = a8.size.width;
  CGFloat y = a8.origin.y;
  CGFloat x = a8.origin.x;
  id v19 = a6;
  id v20 = a9;
  v26.receiver = self;
  v26.super_class = (Class)VNFaceSegments;
  float v21 = [(VNFaceSegments *)&v26 init];
  if (v21
    && (uint64_t v22 = [(id)objc_opt_class() faceSegmentsPixelSizeInBytes],
        a5 * a4 * v22 == [v19 length]))
  {
    v21->_requestRevision = a3;
    v21->_double outputBufferWidth = a4;
    v21->_unint64_t outputBufferHeight = a5;
    objc_storeStrong((id *)&v21->_outputBufferData, a6);
    v21->_unint64_t numberOfFaceSegments = a7;
    v21->_boundingBox.origin.CGFloat x = x;
    v21->_boundingBox.origin.CGFloat y = y;
    v21->_boundingBox.size.CGFloat width = width;
    v21->_boundingBox.size.CGFloat height = height;
    objc_storeStrong((id *)&v21->_faceSegmentLabelToProbabilityMap, a9);
    uint64_t v23 = v21;
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

+ (unint64_t)faceSegmentsPixelSizeInBytes
{
  return 1;
}

+ (NSDictionary)faceSegmentIndexToFlagMap
{
  if (+[VNFaceSegments faceSegmentIndexToFlagMap]::onceToken != -1) {
    dispatch_once(&+[VNFaceSegments faceSegmentIndexToFlagMap]::onceToken, &__block_literal_global_74_24575);
  }
  v2 = (void *)+[VNFaceSegments faceSegmentIndexToFlagMap]::faceSegmentIndexToFlagMap;

  return (NSDictionary *)v2;
}

void __43__VNFaceSegments_faceSegmentIndexToFlagMap__block_invoke()
{
  v3[15] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EF7A73D0;
  v2[1] = &unk_1EF7A7400;
  v3[0] = &unk_1EF7A73E8;
  v3[1] = &unk_1EF7A7418;
  v2[2] = &unk_1EF7A7430;
  v2[3] = &unk_1EF7A7460;
  v3[2] = &unk_1EF7A7448;
  v3[3] = &unk_1EF7A7478;
  v2[4] = &unk_1EF7A7490;
  v2[5] = &unk_1EF7A74C0;
  v3[4] = &unk_1EF7A74A8;
  v3[5] = &unk_1EF7A74D8;
  v2[6] = &unk_1EF7A74F0;
  v2[7] = &unk_1EF7A7520;
  v3[6] = &unk_1EF7A7508;
  v3[7] = &unk_1EF7A7538;
  v2[8] = &unk_1EF7A7550;
  v2[9] = &unk_1EF7A7580;
  v3[8] = &unk_1EF7A7568;
  v3[9] = &unk_1EF7A7598;
  v2[10] = &unk_1EF7A75B0;
  v2[11] = &unk_1EF7A75E0;
  v3[10] = &unk_1EF7A75C8;
  v3[11] = &unk_1EF7A75F8;
  v2[12] = &unk_1EF7A7610;
  v2[13] = &unk_1EF7A7640;
  v3[12] = &unk_1EF7A7628;
  v3[13] = &unk_1EF7A7658;
  v2[14] = &unk_1EF7A7670;
  v3[14] = &unk_1EF7A7688;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:15];
  v1 = (void *)+[VNFaceSegments faceSegmentIndexToFlagMap]::faceSegmentIndexToFlagMap;
  +[VNFaceSegments faceSegmentIndexToFlagMap]::faceSegmentIndexToFlagMap = v0;
}

+ (NSDictionary)faceSegmentToSegmentMaskGrayLevelDictionary
{
  if (+[VNFaceSegments faceSegmentToSegmentMaskGrayLevelDictionary]::onceToken != -1) {
    dispatch_once(&+[VNFaceSegments faceSegmentToSegmentMaskGrayLevelDictionary]::onceToken, &__block_literal_global_24581);
  }
  v2 = (void *)+[VNFaceSegments faceSegmentToSegmentMaskGrayLevelDictionary]::faceSegmentToSegmentMaskGrayLevelDictionary;

  return (NSDictionary *)v2;
}

void __61__VNFaceSegments_faceSegmentToSegmentMaskGrayLevelDictionary__block_invoke()
{
  id v8 = +[VNFaceSegments faceSegmentIndexToFlagMap];
  uint64_t v0 = [v8 count];
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v0];
  if (v0)
  {
    for (uint64_t i = 0; i != v0; ++i)
    {
      v3 = [NSNumber numberWithUnsignedInteger:i];
      id v4 = [v8 objectForKeyedSubscript:v3];

      double v5 = [NSNumber numberWithInt:~(i + 5)];
      [v1 setObject:v5 forKeyedSubscript:v4];
    }
  }
  uint64_t v6 = [v1 copy];
  unint64_t v7 = (void *)+[VNFaceSegments faceSegmentToSegmentMaskGrayLevelDictionary]::faceSegmentToSegmentMaskGrayLevelDictionary;
  +[VNFaceSegments faceSegmentToSegmentMaskGrayLevelDictionary]::faceSegmentToSegmentMaskGrayLevelDictionarCGFloat y = v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end