@interface VNFgBgE5MLInstanceSegmenter
+ (id)instanceSegmenterWithConfiguration:(id)a3 error:(id *)a4;
+ (id)instanceSegmenterWithRevision:(int64_t)a3 error:(id *)a4;
- (BOOL)isFullyIntersection:(CGRect)a3 withRect2:(CGRect)a4;
- (CGRect)getDetection:(const void *)a3 mapSize:(CGSize)a4 isRotated:(BOOL)a5;
- (ConnectedComponentResult)generateInstanceConnectedComponentsFromMLMultiArray:(SEL)a3 maskThreshold:(id)a4 queryID:(float)a5 inverseColor:(int)a6;
- (ConnectedComponentResult)generateInstanceConnectedComponentsFromMask:(SEL)a3;
- (ConnectedComponentResult)generateInstanceConnectedComponentsFromMask:(SEL)a3 fillGapsAreaRatio:(vImage_Buffer *)a4;
- (ConnectedComponentResult)generateInstanceConnectedComponentsFromMask:(SEL)a3 inverseColor:(vImage_Buffer *)a4;
- (VNFgBgE5MLInstanceSegmenterConfiguration)configuration;
- (VNFgBgE5MLProcess)process;
- (id)_initWithConfiguration:(id)a3 e5mlProcess:(id)a4;
- (id)composeInstanceFeatures:(id)a3 miyoshiConfidence:(id)a4 cocoConfidence:(id)a5 predictionIoU:(id)a6 stabilityScore:(id)a7 decodeMatch:(id)a8 isRotated:(BOOL)a9 minimumMaskPixelCount:(unint64_t)a10 useInteractive:(BOOL)a11;
- (vImage_Buffer)generateMaskForInstanceFeatures:(SEL)a3 maskImageType:(id)a4;
- (vImage_Buffer)generateMaskForLabel:(SEL)a3 fromConnectedComponents:(unint64_t)a4 error:(const void *)a5;
- (vImage_Buffer)generateMaskFromInstanceFeatures:(SEL)a3 toCategory:(id)a4 drawBox:(int)a5 maskImageType:(BOOL)a6;
- (vector<std::vector<CGPoint>,)computeSegmentation:(VNFgBgE5MLInstanceSegmenter *)self withQueryID:(SEL)a3;
- (vector<std::vector<CGPoint>,)computeVectorConnectedComponentSegmentation:(VNFgBgE5MLInstanceSegmenter *)self minimumMaskPixelCount:(SEL)a3 withQueryID:(id)a4;
- (void)computeConfidenceInput:(id)a3 confidence:(float *)a4 withQueryID:(int)a5 category:(int *)a6 invalidCategory:(int)a7;
- (void)modifyMask:(vImage_Buffer *)a3 forLabel:(unint64_t)a4 fromConnectedComponents:(const void *)a5 error:(id *)a6;
@end

@implementation VNFgBgE5MLInstanceSegmenter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_process, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (VNFgBgE5MLProcess)process
{
  return self->_process;
}

- (VNFgBgE5MLInstanceSegmenterConfiguration)configuration
{
  return self->_configuration;
}

- (ConnectedComponentResult)generateInstanceConnectedComponentsFromMLMultiArray:(SEL)a3 maskThreshold:(id)a4 queryID:(float)a5 inverseColor:(int)a6
{
  id v8 = a4;
  v9 = [v8 shape];
  v10 = [v9 objectAtIndexedSubscript:1];
  int v11 = [v10 intValue];

  v12 = [v8 shape];
  v13 = [v12 objectAtIndexedSubscript:2];
  LODWORD(v9) = [v13 intValue];

  apple::vision::fgbg::ConnectedComponentResult::ConnectedComponentResult((apple::vision::fgbg::ConnectedComponentResult *)retstr, (int)v9, v11, 1, 1, 1);
}

- (vector<std::vector<CGPoint>,)computeVectorConnectedComponentSegmentation:(VNFgBgE5MLInstanceSegmenter *)self minimumMaskPixelCount:(SEL)a3 withQueryID:(id)a4
{
  uint64_t v6 = *(void *)&a6;
  id v34 = a4;
  v10 = [(VNFgBgE5MLInstanceSegmenter *)self configuration];
  int v11 = [v10 thresholds];
  [v11 maskThreshold];
  int v13 = v12;

  v14 = [(VNFgBgE5MLInstanceSegmenter *)self configuration];
  v15 = [v14 thresholds];
  [v15 defaultValidMinimumMaskPixelCount];

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  LODWORD(v16) = v13;
  [(VNFgBgE5MLInstanceSegmenter *)self generateInstanceConnectedComponentsFromMLMultiArray:v34 maskThreshold:v6 queryID:0 inverseColor:v16];
  for (unint64_t i = 0; i < (v41 - (unsigned char *)v40) >> 3; ++i)
  {
    if (*((void *)v40 + i) > a5)
    {
      v18 = 0;
      unint64_t v19 = 0;
      __p = 0;
      v37 = 0;
      unint64_t v38 = 0;
      do
      {
        v20 = (long long *)(*(void *)(v46 + 24 * i) + 16 * v19);
        long long v35 = *v20;
        if ((unint64_t)v18 >= v38)
        {
          v22 = (char *)__p;
          uint64_t v23 = (v18 - (unsigned char *)__p) >> 4;
          unint64_t v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 60) {
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v25 = v38 - (void)__p;
          if ((uint64_t)(v38 - (void)__p) >> 3 > v24) {
            unint64_t v24 = v25 >> 3;
          }
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v26 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v26 = v24;
          }
          if (v26) {
            unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v26);
          }
          else {
            uint64_t v27 = 0;
          }
          v28 = (_OWORD *)(v26 + 16 * v23);
          _OWORD *v28 = v35;
          v29 = (char *)v28;
          if (v18 != v22)
          {
            do
            {
              *((_OWORD *)v29 - 1) = *((_OWORD *)v18 - 1);
              v29 -= 16;
              v18 -= 16;
            }
            while (v18 != v22);
            v18 = (char *)__p;
          }
          v21 = v28 + 1;
          __p = v29;
          v37 = v28 + 1;
          unint64_t v38 = v26 + 16 * v27;
          if (v18) {
            operator delete(v18);
          }
        }
        else
        {
          *(_OWORD *)v18 = *v20;
          v21 = v18 + 16;
        }
        v37 = v21;
        ++v19;
        v18 = (char *)v21;
      }
      while (*((void *)v40 + i) > v19);
      var1 = (char *)retstr->var1;
      if (var1 >= retstr->var2.var0)
      {
        v31 = (void *)std::vector<std::vector<CGPoint>>::__push_back_slow_path<std::vector<CGPoint> const&>(retstr, (uint64_t)&__p);
      }
      else
      {
        std::vector<std::vector<CGPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<CGPoint> const&>((uint64_t)retstr, (uint64_t)&__p);
        v31 = var1 + 24;
      }
      retstr->var1 = v31;
      if (__p) {
        operator delete(__p);
      }
    }
  }
  __p = &v46;
  std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  if (v44)
  {
    v45 = v44;
    operator delete(v44);
  }
  if (v42)
  {
    v43 = v42;
    operator delete(v42);
  }
  if (v40)
  {
    v41 = v40;
    operator delete(v40);
  }
  uint64_t v32 = v39;
  uint64_t v39 = 0;
  if (v32) {
    MEMORY[0x1A62562A0](v32, 0x1000C8000313F17);
  }

  return result;
}

- (vImage_Buffer)generateMaskForInstanceFeatures:(SEL)a3 maskImageType:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (a5) {
    *a5 = 1;
  }
  v9 = [(VNFgBgE5MLInstanceSegmenter *)self configuration];
  [v9 inputSize];
  double v11 = v10;
  double v13 = v12;

  unint64_t v14 = (unint64_t)v11;
  *(_OWORD *)&retstr->data = 0u;
  *(_OWORD *)&retstr->width = 0u;
  ImageProcessing_reallocVImageBuffer((uint64_t)retstr, (unint64_t)v11, (unint64_t)v13, 1);
  data = retstr->data;
  if ((unint64_t)v13)
  {
    double v16 = (char *)retstr->data;
    unint64_t v17 = (unint64_t)v13;
    do
    {
      if (v14) {
        bzero(v16, (unint64_t)v11);
      }
      v16 += v14;
      --v17;
    }
    while (v17);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v18 = v8;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v31;
    double v21 = (double)v14;
    double v22 = (double)(unint64_t)v13;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v18);
        }
        unint64_t v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (v24)
        {
          [v24 segmentation];
          for (j = v28; j != v29; j += 2)
          {
            if (*j < v21)
            {
              double v26 = j[1];
              if (v26 < v22) {
                data[(unint64_t)(*j + v26 * v21)] = -1;
              }
            }
          }
          if (v28)
          {
            v29 = v28;
            operator delete(v28);
          }
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v19);
  }

  return result;
}

- (void)modifyMask:(vImage_Buffer *)a3 forLabel:(unint64_t)a4 fromConnectedComponents:(const void *)a5 error:(id *)a6
{
  data = a3->data;
  if (a3->data)
  {
    v7 = (uint64_t *)(*((void *)a5 + 10) + 24 * (a4 - *((int *)a5 + 30)));
    uint64_t v8 = *v7;
    if (v7[1] != *v7)
    {
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      do
      {
        data[(int)(*(double *)(v8 + v9) + *(double *)(v8 + v9 + 8) * (double)*((unint64_t *)a5 + 13))] = -1;
        ++v10;
        uint64_t v8 = *(void *)(*((void *)a5 + 10) + 24 * (a4 - *((int *)a5 + 30)));
        v9 += 16;
      }
      while (v10 < (*(void *)(*((void *)a5 + 10) + 24 * (a4 - *((int *)a5 + 30)) + 8) - v8) >> 4);
    }
  }
  else if (a6)
  {
    *a6 = +[VNFgBgInstanceSegmenterError errorWithCode:-6, @"null mask image", a5 description];
  }
}

- (vImage_Buffer)generateMaskForLabel:(SEL)a3 fromConnectedComponents:(unint64_t)a4 error:(const void *)a5
{
  vImagePixelCount v9 = *((void *)a5 + 13);
  vImagePixelCount v10 = *((void *)a5 + 14);
  retstr->data = 0;
  retstr->height = v10;
  retstr->width = v9;
  retstr->rowBytes = v9;
  result = (vImage_Buffer *)malloc_type_calloc(v10 * v9, 1uLL, 0x100004077774924uLL);
  retstr->data = result;
  double v12 = (uint64_t *)(*((void *)a5 + 10) + 24 * (a4 - *((int *)a5 + 30)));
  uint64_t v13 = *v12;
  if (v12[1] != *v12)
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    do
    {
      *((unsigned char *)&result->data
      + (int)(*(double *)(v13 + v14) + *(double *)(v13 + v14 + 8) * (double)*((unint64_t *)a5 + 13))) = -1;
      ++v15;
      uint64_t v13 = *(void *)(*((void *)a5 + 10) + 24 * (a4 - *((int *)a5 + 30)));
      v14 += 16;
    }
    while (v15 < (*(void *)(*((void *)a5 + 10) + 24 * (a4 - *((int *)a5 + 30)) + 8) - v13) >> 4);
  }
  return result;
}

- (ConnectedComponentResult)generateInstanceConnectedComponentsFromMask:(SEL)a3
{
}

- (vImage_Buffer)generateMaskFromInstanceFeatures:(SEL)a3 toCategory:(id)a4 drawBox:(int)a5 maskImageType:(BOOL)a6
{
  BOOL v8 = a6;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v50 = a4;
  if (a7) {
    *a7 = 1;
  }
  double v11 = [(VNFgBgE5MLInstanceSegmenter *)self configuration];
  [v11 inputSize];
  double v13 = v12;
  double v15 = v14;
  BOOL v52 = v8;

  unint64_t v16 = (unint64_t)v13;
  unint64_t v17 = (unint64_t)v15;
  *(_OWORD *)&retstr->data = 0u;
  *(_OWORD *)&retstr->width = 0u;
  ImageProcessing_reallocVImageBuffer((uint64_t)retstr, (unint64_t)v13, (unint64_t)v15, 1);
  data = retstr->data;
  if ((unint64_t)v15)
  {
    uint64_t v19 = (char *)retstr->data;
    unint64_t v20 = (unint64_t)v15;
    do
    {
      if (v16) {
        bzero(v19, (unint64_t)v13);
      }
      v19 += v16;
      --v20;
    }
    while (v20);
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v50;
  uint64_t v21 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v63;
    double v23 = (double)v16;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v63 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        if ([v25 miyoshiCategory] == a5 && v25)
        {
          [v25 segmentation];
          double v26 = (double *)__p;
          uint64_t v27 = v61;
          if (__p != v61)
          {
            do
            {
              if (*v26 < v23)
              {
                double v28 = v26[1];
                if (v28 < (double)v17) {
                  data[(unint64_t)(*v26 + v28 * v23)] = -1;
                }
              }
              v26 += 2;
            }
            while (v26 != v27);
            double v26 = (double *)__p;
          }
          if (v26)
          {
            v61 = v26;
            operator delete(v26);
          }
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v21);
  }

  if (v52)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v51 = obj;
    uint64_t v29 = [v51 countByEnumeratingWithState:&v56 objects:v66 count:16];
    if (v29)
    {
      double v30 = (double)v16;
      double v31 = (double)(v16 - 1);
      double v32 = (double)v17;
      uint64_t v53 = *(void *)v57;
      double v33 = (double)(v17 - 1);
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v57 != v53) {
            objc_enumerationMutation(v51);
          }
          uint64_t v35 = *(void **)(*((void *)&v56 + 1) + 8 * j);
          if ([v35 miyoshiCategory] == a5)
          {
            [v35 bbox];
            int v37 = (int)fmax(fmin(v36 * v30, v31), 0.0);
            int v39 = (int)fmax(fmin(v38 * v32, v33), 0.0);
            int v41 = (int)fmax(fmin((v36 + v40) * v30, v31), 0.0);
            int v43 = (int)fmax(fmin((v38 + v42) * v32, v33), 0.0);
            if (v37 < v41)
            {
              memset(&data[v39 * v16 + v37], 255, (~v37 + v41) + 1);
              memset(&data[v43 * v16 + v37], 255, (~v37 + v41) + 1);
            }
            if (v39 < v43)
            {
              uint64_t v44 = v43 - (uint64_t)v39;
              unint64_t v45 = v16 * v39;
              uint64_t v46 = &data[v45 + v37];
              uint64_t v47 = v44;
              do
              {
                *uint64_t v46 = -1;
                v46 += v16;
                --v47;
              }
              while (v47);
              v48 = &data[v45 + v41];
              do
              {
                unsigned char *v48 = -1;
                v48 += v16;
                --v44;
              }
              while (v44);
            }
          }
        }
        uint64_t v29 = [v51 countByEnumeratingWithState:&v56 objects:v66 count:16];
      }
      while (v29);
    }
  }
  return result;
}

- (vector<std::vector<CGPoint>,)computeSegmentation:(VNFgBgE5MLInstanceSegmenter *)self withQueryID:(SEL)a3
{
  id v8 = a4;
  vImagePixelCount v9 = [(VNFgBgE5MLInstanceSegmenter *)self configuration];
  vImagePixelCount v10 = [v9 thresholds];
  [v10 maskThreshold];
  float v12 = v11;

  double v13 = [v8 shape];
  double v14 = [v13 objectAtIndexedSubscript:1];
  int v15 = [v14 intValue];

  unint64_t v16 = [v8 shape];
  unint64_t v17 = [v16 objectAtIndexedSubscript:2];
  int v43 = [v17 intValue];

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  uint64_t v44 = 0;
  unint64_t v45 = 0;
  unint64_t v46 = 0;
  id v40 = v8;
  uint64_t v18 = [v40 dataPointer];
  if (v15 < 1)
  {
    unint64_t v20 = 0;
  }
  else
  {
    uint64_t v19 = v18;
    int v39 = retstr;
    unint64_t v20 = 0;
    unint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    int v41 = v15 * a5;
    uint64_t v42 = v15;
    int v24 = v43;
    do
    {
      if (v24 >= 1)
      {
        uint64_t v25 = 0;
        double v26 = (double)(int)v23;
        uint64_t v27 = (v41 + (int)v23) * v24;
        do
        {
          if (*(float *)(v19 + 4 * (v25 + v27)) > v12)
          {
            double v28 = (double)(int)v25;
            if ((unint64_t)v22 >= v21)
            {
              uint64_t v29 = ((char *)v22 - (char *)v20) >> 4;
              unint64_t v30 = v29 + 1;
              if ((unint64_t)(v29 + 1) >> 60) {
                std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
              }
              if ((uint64_t)(v21 - (void)v20) >> 3 > v30) {
                unint64_t v30 = (uint64_t)(v21 - (void)v20) >> 3;
              }
              if (v21 - (unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v31 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v31 = v30;
              }
              if (v31) {
                unint64_t v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v31);
              }
              else {
                uint64_t v32 = 0;
              }
              double v33 = (double *)(v31 + 16 * v29);
              *double v33 = v28;
              v33[1] = v26;
              if (v22 == v20)
              {
                uint64_t v35 = (double *)(v31 + 16 * v29);
              }
              else
              {
                unint64_t v34 = v31 + 16 * v29;
                do
                {
                  uint64_t v35 = (double *)(v34 - 16);
                  *(_OWORD *)(v34 - 16) = *((_OWORD *)v22 - 1);
                  v22 -= 2;
                  v34 -= 16;
                }
                while (v22 != v20);
              }
              unint64_t v21 = v31 + 16 * v32;
              uint64_t v22 = v33 + 2;
              if (v20) {
                operator delete(v20);
              }
              unint64_t v20 = v35;
            }
            else
            {
              double *v22 = v28;
              v22[1] = v26;
              v22 += 2;
            }
          }
          ++v25;
        }
        while (v25 != v43);
      }
      ++v23;
      int v24 = v43;
    }
    while (v23 != v42);
    unint64_t v45 = v22;
    unint64_t v46 = v21;
    uint64_t v44 = v20;
    retstr = v39;
  }
  var1 = (char *)retstr->var1;
  if (var1 >= retstr->var2.var0)
  {
    int v37 = (void *)std::vector<std::vector<CGPoint>>::__push_back_slow_path<std::vector<CGPoint> const&>(retstr, (uint64_t)&v44);
  }
  else
  {
    std::vector<std::vector<CGPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<CGPoint> const&>((uint64_t)retstr, (uint64_t)&v44);
    int v37 = var1 + 24;
  }
  retstr->var1 = v37;
  if (v20) {
    operator delete(v20);
  }

  return result;
}

- (void)computeConfidenceInput:(id)a3 confidence:(float *)a4 withQueryID:(int)a5 category:(int *)a6 invalidCategory:(int)a7
{
  id v11 = a3;
  *a4 = 0.0;
  *a6 = a7;
  id v21 = v11;
  uint64_t v12 = [v21 dataPointer];
  for (int i = 0; ; ++i)
  {
    double v14 = [v21 shape];
    int v15 = [v14 objectAtIndexedSubscript:1];
    int v16 = [v15 intValue];

    if (i >= v16) {
      break;
    }
    unint64_t v17 = [v21 shape];
    uint64_t v18 = [v17 objectAtIndexedSubscript:1];
    int v19 = i + [v18 intValue] * a5;

    float v20 = *(float *)(v12 + 4 * v19);
    if (v20 > *a4)
    {
      *a4 = v20;
      *a6 = i;
    }
  }
}

- (CGRect)getDetection:(const void *)a3 mapSize:(CGSize)a4 isRotated:(BOOL)a5
{
  CGFloat height = a4.height;
  int32x2_t v6 = vmovn_s64(vcvtq_s64_f64((float64x2_t)a4));
  v7 = *(float64x2_t **)a3;
  int32x2_t v8 = 0;
  while (v7 != *((float64x2_t **)a3 + 1))
  {
    v9.i64[0] = v6.i32[0];
    v9.i64[1] = v6.i32[1];
    float64x2_t v10 = vcvtq_f64_s64(v9);
    v9.i64[0] = v8.i32[0];
    v9.i64[1] = v8.i32[1];
    float64x2_t v11 = *v7++;
    int8x8_t v12 = (int8x8_t)vmovn_s64(vcvtq_s64_f64(v11));
    int32x2_t v6 = (int32x2_t)vbsl_s8((int8x8_t)vmovn_s64(vcgtq_f64(v10, v11)), v12, (int8x8_t)v6);
    int32x2_t v8 = (int32x2_t)vbsl_s8((int8x8_t)vmovn_s64(vcgtq_f64(v11, vcvtq_f64_s64(v9))), v12, (int8x8_t)v8);
  }
  int32x2_t v13 = vrev64_s32(vadd_s32(v6, v8));
  v14.i64[0] = v13.i32[0];
  v14.i64[1] = v13.i32[1];
  __asm { FMOV            V5.2D, #0.5 }
  float32x2_t v20 = vcvt_f32_f64(vdivq_f64(vmulq_f64(vcvtq_f64_s64(v14), _Q5), (float64x2_t)vextq_s8((int8x16_t)a4, (int8x16_t)a4, 8uLL)));
  int32x2_t v21 = vadd_s32(vsub_s32(v8, v6), (int32x2_t)0x100000001);
  v14.i64[0] = v21.i32[0];
  v14.i64[1] = v21.i32[1];
  float32x2_t v22 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_s64(v14), (float64x2_t)a4));
  if (a5)
  {
    float32_t v23 = 1.0 - v20.f32[0];
    v24.i32[0] = vdup_lane_s32((int32x2_t)v20, 1).u32[0];
    float64x2_t v25 = vcvtq_f64_f32(v22);
    v24.f32[1] = v23;
    float64x2_t v26 = vcvtq_f64_f32(v24);
  }
  else
  {
    float64x2_t v26 = vcvtq_f64_f32(v20);
    float64x2_t v25 = vcvtq_f64_f32((float32x2_t)vrev64_s32((int32x2_t)v22));
  }
  __asm { FMOV            V1.2D, #-0.5 }
  float64x2_t v28 = vmlaq_f64(v26, _Q1, v25);
  double v29 = v25.f64[1];
  *(float *)_Q1.f64 = v28.f64[0];
  double v30 = *(float *)_Q1.f64;
  *(float *)v28.f64 = v28.f64[1];
  double v31 = *(float *)v28.f64;
  result.size.CGFloat height = v25.f64[0];
  result.size.width = v29;
  result.origin.y = v30;
  result.origin.x = v31;
  return result;
}

- (id)composeInstanceFeatures:(id)a3 miyoshiConfidence:(id)a4 cocoConfidence:(id)a5 predictionIoU:(id)a6 stabilityScore:(id)a7 decodeMatch:(id)a8 isRotated:(BOOL)a9 minimumMaskPixelCount:(unint64_t)a10 useInteractive:(BOOL)a11
{
  id v94 = a3;
  id v17 = a4;
  id v102 = a5;
  id v92 = a6;
  id v91 = a7;
  id v90 = a8;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v19 = [(VNFgBgE5MLInstanceSegmenter *)self configuration];
  v98 = [v19 thresholds];

  float32x2_t v20 = [v94 shape];
  id v95 = v17;
  id v101 = v18;
  int32x2_t v21 = [v20 objectAtIndexedSubscript:1];
  int v22 = [v21 intValue];

  float32_t v23 = [v94 shape];
  float32x2_t v24 = [v23 objectAtIndexedSubscript:2];
  int v25 = [v24 intValue];

  id v89 = v92;
  uint64_t v100 = [v89 dataPointer];
  id v88 = v91;
  uint64_t v99 = [v88 dataPointer];
  id v87 = v90;
  uint64_t v97 = [v87 dataPointer];
  [v98 matchScoreThreshold];
  float v96 = *(float *)&v26;
  unsigned int v27 = -1;
  if (a11 && *(float *)&v26 <= 0.0)
  {
    uint64_t v28 = 0;
    float v29 = -3.4028e38;
    while (1)
    {
      double v30 = [(VNFgBgE5MLInstanceSegmenter *)self configuration];
      int v31 = [v30 queryNumber];

      if (v28 >= v31) {
        break;
      }
      LODWORD(v26) = *(_DWORD *)(v97 + 4 * v28);
      if (*(float *)&v26 > v29)
      {
        unsigned int v27 = v28;
        float v29 = *(float *)(v97 + 4 * v28);
      }
      ++v28;
    }
  }
  uint64_t v32 = 0;
  double v33 = (double)v25;
  uint64_t v93 = v27;
  double v34 = (double)v22;
  while (1)
  {
    uint64_t v35 = [(VNFgBgE5MLInstanceSegmenter *)self configuration];
    int v36 = [v35 queryNumber];

    if (v32 >= v36) {
      break;
    }
    context = (void *)MEMORY[0x1A6257080]();
    uint64_t v111 = 0;
    unsigned int v110 = 0;
    int v37 = [(VNFgBgE5MLInstanceSegmenter *)self configuration];
    double v38 = [v37 modelOutputInstanceInvalidMiyoshiCategory];
    int v39 = [v38 objectAtIndexedSubscript:0];
    unsigned int v40 = [v39 intValue];

    unsigned int v109 = 0;
    unsigned int v110 = v40;
    int v41 = [(VNFgBgE5MLInstanceSegmenter *)self configuration];
    uint64_t v42 = [v41 modelOutputInstanceInvalidCocoCategory];
    int v43 = [v42 objectAtIndexedSubscript:0];
    unsigned int v44 = [v43 intValue];

    unsigned int v109 = v44;
    [(VNFgBgE5MLInstanceSegmenter *)self computeConfidenceInput:v17 confidence:(char *)&v111 + 4 withQueryID:v32 category:&v110 invalidCategory:v110];
    [(VNFgBgE5MLInstanceSegmenter *)self computeConfidenceInput:v102 confidence:&v111 withQueryID:v32 category:&v109 invalidCategory:v109];
    float v45 = *(float *)(v100 + 4 * v32);
    float v46 = *(float *)(v99 + 4 * v32);
    unint64_t v47 = (int)v110;
    if (_categoryMiyoshiNameForCategoryIndex(int)::onceToken != -1) {
      dispatch_once(&_categoryMiyoshiNameForCategoryIndex(int)::onceToken, &__block_literal_global_2253);
    }
    if ([(id)_categoryMiyoshiNameForCategoryIndex(int)::categoryNames count] <= v47)
    {
      uint64_t v48 = 0;
    }
    else
    {
      uint64_t v48 = [(id)_categoryMiyoshiNameForCategoryIndex(int)::categoryNames objectAtIndex:v47];
    }
    unint64_t v49 = (int)v109;
    if (_categoryCocoNameForCategoryIndex(int)::onceToken != -1) {
      dispatch_once(&_categoryCocoNameForCategoryIndex(int)::onceToken, &__block_literal_global_85);
    }
    v104 = (void *)v48;
    if ([(id)_categoryCocoNameForCategoryIndex(int)::categoryNames count] <= v49)
    {
      id v50 = 0;
    }
    else
    {
      id v50 = [(id)_categoryCocoNameForCategoryIndex(int)::categoryNames objectAtIndex:v49];
    }
    id v51 = [(VNFgBgE5MLInstanceSegmenter *)self configuration];
    BOOL v52 = [v51 modelOutputInstanceInvalidMiyoshiCategory];
    uint64_t v53 = [NSNumber numberWithInt:v110];
    if ([v52 containsObject:v53])
    {

      id v18 = v101;
      if (!a11) {
        goto LABEL_43;
      }
    }
    else
    {
      v55 = [(VNFgBgE5MLInstanceSegmenter *)self configuration];
      long long v56 = [v55 modelOutputInstanceInvalidCocoCategory];
      long long v57 = [NSNumber numberWithInt:v109];
      if (([v56 containsObject:v57] & 1) != 0
        || ([v98 IoUThreshold], v45 <= v58)
        || (float v59 = *((float *)&v111 + 1), [v98 cocoConfidenceThreshold], v59 <= v60))
      {
        BOOL v63 = 0;
      }
      else
      {
        float v61 = *(float *)&v111;
        [v98 cocoConfidenceThreshold];
        BOOL v63 = v61 > v62;
      }

      id v17 = v95;
      id v18 = v101;
      if (!a11)
      {
        if (!v63) {
          goto LABEL_43;
        }
LABEL_36:
        long long v107 = 0uLL;
        uint64_t v108 = 0;
        if (a10) {
          [(VNFgBgE5MLInstanceSegmenter *)self computeVectorConnectedComponentSegmentation:v94 minimumMaskPixelCount:a10 withQueryID:v32];
        }
        else {
          [(VNFgBgE5MLInstanceSegmenter *)self computeSegmentation:v94 withQueryID:v32];
        }
        std::vector<std::vector<CGPoint>>::__vdeallocate((uint64_t *)&v107);
        long long v107 = v105;
        uint64_t v108 = v106;
        uint64_t v106 = 0;
        long long v105 = 0uLL;
        v112 = (void **)&v105;
        std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100](&v112);
        uint64_t v71 = *((void *)&v107 + 1);
        for (uint64_t i = v107; i != v71; i += 24)
        {
          -[VNFgBgE5MLInstanceSegmenter getDetection:mapSize:isRotated:](self, "getDetection:mapSize:isRotated:", i, a9, v33, v34);
          double v73 = v72;
          double v75 = v74;
          double v77 = v76;
          double v79 = v78;
          v80 = [VNFgBgE5MLInstanceFeature alloc];
          LODWORD(v81) = HIDWORD(v111);
          LODWORD(v82) = v111;
          *(float *)&double v83 = v45;
          *(float *)&double v84 = v46;
          v85 = -[VNFgBgE5MLInstanceFeature initWithQueryID:miyoshiConfidence:cocoConfidence:IoU:stabilityScore:miyoshiCategory:cocoCategory:miyoshiCategoryName:cocoCategoryName:bbox:mapSize:segmentation:](v80, "initWithQueryID:miyoshiConfidence:cocoConfidence:IoU:stabilityScore:miyoshiCategory:cocoCategory:miyoshiCategoryName:cocoCategoryName:bbox:mapSize:segmentation:", v32, v110, v109, v104, v50, i, v81, v82, v83, v84, v73, v75, v77, v79, *(void *)&v33, *(void *)&v34);
          [v18 addObject:v85];
        }
        *(void *)&long long v105 = &v107;
        std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v105);
        goto LABEL_43;
      }
    }
    *(float *)&double v54 = v96;
    if (v96 > 0.0)
    {
      float v64 = *(float *)(v97 + 4 * v32);
      long long v65 = [(VNFgBgE5MLInstanceSegmenter *)self configuration];
      v66 = [v65 thresholds];
      [v66 matchScoreThreshold];
      float v68 = v67;

      if (v64 <= v68) {
        goto LABEL_43;
      }
    }
    else if (v32 != v93)
    {
      goto LABEL_43;
    }
    objc_msgSend(v98, "stabilityScoreThreshold", v54);
    if (v46 > v69) {
      goto LABEL_36;
    }
LABEL_43:

    ++v32;
  }

  return v18;
}

- (ConnectedComponentResult)generateInstanceConnectedComponentsFromMask:(SEL)a3 fillGapsAreaRatio:(vImage_Buffer *)a4
{
  long long v9 = *(_OWORD *)&a4->width;
  v56[0] = *(_OWORD *)&a4->data;
  v56[1] = v9;
  [(VNFgBgE5MLInstanceSegmenter *)self generateInstanceConnectedComponentsFromMask:v56 inverseColor:1];
  long long v10 = *(_OWORD *)&a4->width;
  v55[0] = *(_OWORD *)&a4->data;
  v55[1] = v10;
  [(VNFgBgE5MLInstanceSegmenter *)self generateInstanceConnectedComponentsFromMask:v55 inverseColor:0];
  for (unint64_t i = 0; i < (v59 - (unsigned char *)v58) >> 3; ++i)
  {
    if ((float)((float)((float)v64[3] * a5) * (float)v64[4]) >= (float)*((unint64_t *)v58 + i))
    {
      uint64_t v12 = 0;
      int32x2_t v13 = (unint64_t *)((char *)v60 + 32 * i);
      unint64_t v14 = v13[2];
      double v15 = (double)v14;
      double v16 = (double)*v13;
      double v17 = (double)(v13[3] - v14 + 1);
      double v18 = (double)(v13[1] - *v13 + 1);
      uint64_t v19 = -1;
      while (v19 + 1 < (unint64_t)(retstr->var1.__end_ - retstr->var1.__begin_))
      {
        float32x2_t v20 = (unint64_t *)((char *)retstr->var2.var0 + v12);
        ++v19;
        v12 += 32;
        if (-[VNFgBgE5MLInstanceSegmenter isFullyIntersection:withRect2:](self, "isFullyIntersection:withRect2:", v15, v16, v17, v18, (double)v20[2], (double)*v20, (double)(v20[3] - v20[2] + 1), (double)(v20[1] - *v20 + 1)))
        {
          int32x2_t v21 = v58;
          retstr->var8 += *((void *)v58 + i);
          retstr->var1.__begin_[v19] += v21[i];
          uint64_t v22 = v64[0] + 24 * i;
          float32x2_t v24 = *(char **)v22;
          float32_t v23 = *(char **)(v22 + 8);
          if (v23 - v24 >= 1)
          {
            int v25 = (unint64_t *)((char *)retstr->var4.var0 + 24 * v19);
            unsigned int v27 = (void **)(v25 + 1);
            double v26 = (char *)v25[1];
            uint64_t v28 = (v23 - v24) >> 4;
            unint64_t v29 = v25[2];
            if (v28 <= (uint64_t)(v29 - (void)v26) >> 4)
            {
              if (v28 <= 0)
              {
                int v36 = &v26[-16 * v28];
                int v37 = (_OWORD *)v25[1];
                while (v36 < v26)
                {
                  long long v38 = *(_OWORD *)v36;
                  v36 += 16;
                  *v37++ = v38;
                }
                *unsigned int v27 = v37;
                if (v26 != &v26[16 * v28]) {
                  memmove(&v26[-16 * ((-16 * v28) >> 4)], v26, -16 * v28);
                }
                if (&v24[16 * v28] != v24) {
                  memmove(v26, v24, 16 * v28);
                }
              }
              else
              {
                int64_t v35 = v23 - v24;
                if (v23 != v24) {
                  memmove(v26, v24, v23 - v24);
                }
                *unsigned int v27 = &v26[v35];
              }
            }
            else
            {
              uint64_t v30 = (uint64_t)&v26[-*v25] >> 4;
              if ((unint64_t)(v30 + v28) >> 60) {
                std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v31 = v29 - *v25;
              uint64_t v32 = v31 >> 3;
              if (v31 >> 3 <= (unint64_t)(v30 + v28)) {
                uint64_t v32 = v30 + v28;
              }
              if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v33 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v33 = v32;
              }
              if (v33) {
                unint64_t v33 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v33);
              }
              else {
                uint64_t v34 = 0;
              }
              int v39 = (_OWORD *)(v33 + 16 * v30);
              unsigned int v40 = (char *)&v39[v28];
              uint64_t v41 = 16 * v28;
              uint64_t v42 = v39;
              do
              {
                long long v43 = *(_OWORD *)v24;
                v24 += 16;
                *v42++ = v43;
                v41 -= 16;
              }
              while (v41);
              unsigned int v44 = (char *)*v25;
              if ((char *)*v25 == v26)
              {
                unint64_t v46 = v33 + 16 * v30;
              }
              else
              {
                float v45 = v26;
                do
                {
                  unint64_t v46 = (unint64_t)(v39 - 1);
                  *(v39 - 1) = *((_OWORD *)v45 - 1);
                  v45 -= 16;
                  --v39;
                }
                while (v45 != v44);
              }
              size_t v47 = (unsigned char *)*v27 - v26;
              if (*v27 != v26)
              {
                unint64_t v54 = v33;
                uint64_t v48 = v34;
                unint64_t v49 = v26;
                id v50 = v40;
                memmove(v40, v49, v47);
                unsigned int v40 = v50;
                uint64_t v34 = v48;
                unsigned int v27 = (void **)(v25 + 1);
                unint64_t v33 = v54;
              }
              unint64_t v51 = v33 + 16 * v34;
              BOOL v52 = (void *)*v25;
              *int v25 = v46;
              *unsigned int v27 = &v40[v47];
              v25[2] = v51;
              if (v52) {
                operator delete(v52);
              }
            }
          }
          break;
        }
      }
    }
  }
  long long v65 = (void **)v64;
  std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100](&v65);
  if (__p)
  {
    BOOL v63 = __p;
    operator delete(__p);
  }
  if (v60)
  {
    float v61 = v60;
    operator delete(v60);
  }
  if (v58)
  {
    float v59 = v58;
    operator delete(v58);
  }
  CGRect result = v57;
  long long v57 = 0;
  if (result) {
    return (ConnectedComponentResult *)MEMORY[0x1A62562A0](result, 0x1000C8000313F17);
  }
  return result;
}

- (ConnectedComponentResult)generateInstanceConnectedComponentsFromMask:(SEL)a3 inverseColor:(vImage_Buffer *)a4
{
}

- (BOOL)isFullyIntersection:(CGRect)a3 withRect2:(CGRect)a4
{
  return (int)a3.origin.x > (int)a4.origin.x
      && (int)(a3.origin.x + a3.size.width) < (int)(a4.origin.x + a4.size.width)
      && (int)a3.origin.y > (int)a4.origin.y
      && (int)(a3.origin.y + a3.size.height) < (int)(a4.origin.y + a4.size.height);
}

- (id)_initWithConfiguration:(id)a3 e5mlProcess:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VNFgBgE5MLInstanceSegmenter;
  long long v9 = [(VNFgBgE5MLInstanceSegmenter *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

+ (id)instanceSegmenterWithRevision:(int64_t)a3 error:(id *)a4
{
  int32x2_t v6 = +[VNFgBgE5MLInstanceSegmenterConfiguration configurationForRevision:error:](VNFgBgE5MLInstanceSegmenterConfiguration, "configurationForRevision:error:", a3);
  if (v6)
  {
    id v7 = [a1 instanceSegmenterWithConfiguration:v6 error:a4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)instanceSegmenterWithConfiguration:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 revision];
  if (v6 == 1)
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = [[VNFgBgE5MLProcess alloc] initWithConfiguration:v5];
    long long v9 = (void *)[[v7 alloc] _initWithConfiguration:v5 e5mlProcess:v8];
LABEL_5:

    goto LABEL_6;
  }
  if (a4)
  {
    id v8 = (VNFgBgE5MLProcess *)objc_msgSend([NSString alloc], "initWithFormat:", @"Revision %lu is not supported", v6);
    +[VNFgBgInstanceSegmenterError errorWithCode:-4 description:v8];
    long long v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  long long v9 = 0;
LABEL_6:

  return v9;
}

@end