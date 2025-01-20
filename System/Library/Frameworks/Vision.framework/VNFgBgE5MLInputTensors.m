@interface VNFgBgE5MLInputTensors
- (NSArray)inputTensors;
- (VNFgBgE5MLInputTensors)initWithTargetPoint:(CGPoint)a3 queryNumber:(int)a4 maxSpatialLength:(int)a5 inputSize:(CGSize)a6 radius:(int)a7 error:(id *)a8;
- (VNFgBgE5MLInputTensors)initWithTargetPointList:(const void *)a3 queryNumber:(int)a4 maxSpatialLength:(int)a5 inputSize:(CGSize)a6 radius:(int)a7 error:(id *)a8;
@end

@implementation VNFgBgE5MLInputTensors

- (void).cxx_destruct
{
}

- (NSArray)inputTensors
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (VNFgBgE5MLInputTensors)initWithTargetPointList:(const void *)a3 queryNumber:(int)a4 maxSpatialLength:(int)a5 inputSize:(CGSize)a6 radius:(int)a7 error:(id *)a8
{
  int v10 = a4;
  v67[4] = *MEMORY[0x1E4F143B8];
  v66.receiver = self;
  v66.super_class = (Class)VNFgBgE5MLInputTensors;
  v12 = [(VNFgBgE5MLInputTensors *)&v66 init];
  v13 = v12;
  if (v12)
  {
    v44 = v12;
    if (a5 >= 0) {
      int v14 = a5;
    }
    else {
      int v14 = a5 + 1;
    }
    LODWORD(v62) = -1082130432;
    std::vector<float>::vector(&v64, (int)(v14 & 0xFFFFFFFE), &v62);
    LODWORD(v60) = -1082130432;
    std::vector<float>::vector(&v62, 2 * a5, &v60);
    uint64_t v15 = (v14 >> 1);
    uint64_t v16 = (int)v15;
    LODWORD(v58) = 1065353216;
    std::vector<float>::vector(&v60, (int)v15, &v58);
    int v17 = a5 + v10;
    int v57 = -971227136;
    std::vector<float>::vector(&v58, (v17 * v17), &v57);
    if (v15 != ((*((void *)a3 + 1) - *(void *)a3) >> 3)) {
      __assert_rtn("-[VNFgBgE5MLInputTensors initWithTargetPointList:queryNumber:maxSpatialLength:inputSize:radius:error:]", "VNFgBgE5MLProcess.mm", 197, "targetPointNum == positiveMaxSpatialLength");
    }
    if (a5 <= 1)
    {
      int v18 = 0;
    }
    else
    {
      int v18 = 0;
      v19 = v60;
      v20 = (float *)(*(void *)a3 + 4);
      v21 = v64 + 1;
      v22 = (float *)((char *)v62 + 4);
      do
      {
        float v23 = *(v20 - 1);
        float v24 = *v20;
        if (v23 != -1.0 && v24 != -1.0)
        {
          ++v18;
          *(v21 - 1) = v23;
          float *v21 = v24;
          *(v22 - 1) = v23;
          float *v22 = v24;
          _DWORD *v19 = 0;
        }
        ++v19;
        v20 += 2;
        v21 += 2;
        v22 += 2;
        --v15;
      }
      while (v15);
    }
    if (v10 >= 1)
    {
      int v27 = 0;
      v28 = (char *)v58;
      uint64_t v29 = v10;
      do
      {
        bzero(&v28[4 * v27], 4 * v10);
        v27 += v17;
        --v29;
      }
      while (v29);
    }
    v13 = v44;
    if (v18 >= 1)
    {
      int v30 = v18 + v10;
      v31 = (char *)v58;
      int v32 = v10 * v17;
      do
      {
        if (v30 >= 1) {
          bzero(&v31[4 * v32], 4 * (v30 - 1) + 4);
        }
        ++v10;
        v32 += v17;
      }
      while (v10 < v30);
    }
    __p = 0;
    v55 = 0;
    uint64_t v56 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v64, (uint64_t)v65, v65 - v64);
    IOSurfaceRef v33 = createIOSurfaceWithInput(2, v16, 4, &__p, a8);
    if (__p)
    {
      v55 = __p;
      operator delete(__p);
    }
    if (v33)
    {
      v34 = [[VNFgBgE5MLInputElement alloc] initWithValueRef:v33 name:@"query_points_pos"];
      v51 = 0;
      v52 = 0;
      uint64_t v53 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v51, v62, (uint64_t)v63, (v63 - (unsigned char *)v62) >> 2);
      IOSurfaceRef v35 = createIOSurfaceWithInput(2, a5, 4, &v51, a8);
      if (v51)
      {
        v52 = v51;
        operator delete(v51);
      }
      if (v35)
      {
        v36 = [[VNFgBgE5MLInputElement alloc] initWithValueRef:v35 name:@"query_points"];
        v48 = 0;
        v49 = 0;
        uint64_t v50 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v48, v60, (uint64_t)v61, (v61 - (unsigned char *)v60) >> 2);
        IOSurfaceRef v37 = createIOSurfaceWithInput(1, v16, 2, &v48, a8);
        if (v48)
        {
          v49 = v48;
          operator delete(v48);
        }
        if (v37)
        {
          v38 = [[VNFgBgE5MLInputElement alloc] initWithValueRef:v37 name:@"query_mask_pos"];
          v45 = 0;
          v46 = 0;
          uint64_t v47 = 0;
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v45, v58, (uint64_t)v59, (v59 - (unsigned char *)v58) >> 2);
          IOSurfaceRef v39 = createIOSurfaceWithInput(v17, v17, 2 * v17, &v45, a8);
          if (v45)
          {
            v46 = v45;
            operator delete(v45);
          }
          v40 = [[VNFgBgE5MLInputElement alloc] initWithValueRef:v39 name:@"attn_mask"];
          v67[0] = v34;
          v67[1] = v36;
          v67[2] = v38;
          v67[3] = v40;
          uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:4];
          inputTensors = v44->_inputTensors;
          v44->_inputTensors = (NSArray *)v41;

          v26 = v44;
        }
        else
        {
          IOSurfaceRef v39 = 0;
          v26 = 0;
        }
      }
      else
      {
        IOSurfaceRef v37 = 0;
        IOSurfaceRef v39 = 0;
        v26 = 0;
      }

      CFRelease(v33);
      if (v35) {
        CFRelease(v35);
      }
      if (v37) {
        CFRelease(v37);
      }
      if (v39) {
        CFRelease(v39);
      }
    }
    else
    {
      v26 = 0;
    }
    if (v58)
    {
      v59 = v58;
      operator delete(v58);
    }
    if (v60)
    {
      v61 = v60;
      operator delete(v60);
    }
    if (v62)
    {
      v63 = v62;
      operator delete(v62);
    }
    if (v64)
    {
      v65 = v64;
      operator delete(v64);
    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (VNFgBgE5MLInputTensors)initWithTargetPoint:(CGPoint)a3 queryNumber:(int)a4 maxSpatialLength:(int)a5 inputSize:(CGSize)a6 radius:(int)a7 error:(id *)a8
{
  double height = a6.height;
  double width = a6.width;
  double y = a3.y;
  double x = a3.x;
  v76[4] = *MEMORY[0x1E4F143B8];
  v75.receiver = self;
  v75.super_class = (Class)VNFgBgE5MLInputTensors;
  uint64_t v16 = [(VNFgBgE5MLInputTensors *)&v75 init];
  if (v16)
  {
    if (a5 >= 0) {
      int v17 = a5;
    }
    else {
      int v17 = a5 + 1;
    }
    LODWORD(v71) = -1082130432;
    std::vector<float>::vector(&v73, (int)(v17 & 0xFFFFFFFE), &v71);
    LODWORD(v69) = -1082130432;
    std::vector<float>::vector(&v71, 2 * a5, &v69);
    int v18 = v17 >> 1;
    LODWORD(v67) = 1065353216;
    unint64_t v59 = v17 >> 1;
    std::vector<float>::vector(&v69, v59, &v67);
    v19 = a8;
    int v20 = a5 + a4;
    int v66 = -971227136;
    std::vector<float>::vector(&v67, (v20 * v20), &v66);
    if (a4 >= 1)
    {
      int v21 = 0;
      v22 = (char *)v67;
      uint64_t v23 = a4;
      do
      {
        bzero(&v22[4 * v21], 4 * a4);
        v21 += v20;
        --v23;
      }
      while (v23);
    }
    BOOL v24 = x == -1.0 || y == -1.0;
    v25 = v19;
    if (!v24)
    {
      if (a5 >= 2)
      {
        int v26 = v18 + a4;
        int v27 = (char *)v67;
        int v28 = a4 * v20;
        do
        {
          if (v26 >= 1) {
            bzero(&v27[4 * v28], 4 * (v26 - 1) + 4);
          }
          ++a4;
          v28 += v20;
        }
        while (a4 < v26);
      }
      if (v70 != v69)
      {
        unint64_t v29 = (v70 - (unsigned char *)v69) >> 2;
        if (v29 <= 1) {
          unint64_t v29 = 1;
        }
        bzero(v69, 4 * v29);
      }
      double v30 = (double)a7;
      int v31 = (int)fmax(x - (double)a7, 0.0);
      double v32 = fmin(width + -2.0, x + (double)a7);
      double v33 = (double)v31;
      if (v32 > (double)v31)
      {
        int v34 = 0;
        int v35 = (int)fmax(y - v30, 0.0);
        double v36 = fmin(height + -2.0, y + v30);
        double v37 = (double)v35;
        v38 = (float *)v73;
        IOSurfaceRef v39 = (float *)v71;
        int v40 = v35 + 1;
        do
        {
          if (v36 > v37)
          {
            float v41 = v33 / width;
            int v42 = v34;
            int v43 = 2 * v34;
            int v44 = v40;
            double v45 = v37;
            do
            {
              v38[v43] = v41;
              float v46 = v45 / height;
              int v47 = v43 + 1;
              v38[v47] = v46;
              v39[v43] = v41;
              v39[v47] = v46;
              ++v42;
              double v45 = (double)v44;
              v43 += 2;
              ++v44;
            }
            while (v36 > v45);
            int v34 = v42;
          }
          double v33 = (double)++v31;
        }
        while (v32 > (double)v31);
      }
    }
    __p = 0;
    v64 = 0;
    uint64_t v65 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v73, (uint64_t)v74, (v74 - (unsigned char *)v73) >> 2);
    IOSurfaceRef v48 = createIOSurfaceWithInput(2, v59, 4, &__p, v19);
    if (__p)
    {
      v64 = __p;
      operator delete(__p);
    }
    if (v48)
    {
      v49 = [[VNFgBgE5MLInputElement alloc] initWithValueRef:v48 name:@"query_points_pos"];
      CFRelease(v48);
      memset(v62, 0, sizeof(v62));
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v62, v71, (uint64_t)v72, (v72 - (unsigned char *)v71) >> 2);
      IOSurfaceRef IOSurfaceWithInput = createIOSurfaceWithInput(2, a5, 4, v62, v19);
      if (v62[0]) {
        operator delete(v62[0]);
      }
      if (IOSurfaceWithInput)
      {
        v51 = [[VNFgBgE5MLInputElement alloc] initWithValueRef:IOSurfaceWithInput name:@"query_points"];
        CFRelease(IOSurfaceWithInput);
        memset(v61, 0, sizeof(v61));
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v61, v69, (uint64_t)v70, (v70 - (unsigned char *)v69) >> 2);
        IOSurfaceRef v52 = createIOSurfaceWithInput(1, v59, 2, v61, v19);
        if (v61[0]) {
          operator delete(v61[0]);
        }
        if (v52)
        {
          uint64_t v53 = [[VNFgBgE5MLInputElement alloc] initWithValueRef:v52 name:@"query_mask_pos"];
          CFRelease(v52);
          memset(v60, 0, sizeof(v60));
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v60, v67, (uint64_t)v68, (v68 - (unsigned char *)v67) >> 2);
          v54 = (VNFgBgE5MLInputTensors *)createIOSurfaceWithInput(v20, v20, 2 * v20, v60, v25);
          if (v60[0]) {
            operator delete(v60[0]);
          }
          if (v54)
          {
            v55 = [[VNFgBgE5MLInputElement alloc] initWithValueRef:v54 name:@"attn_mask"];
            CFRelease(v54);
            v76[0] = v49;
            v76[1] = v51;
            v76[2] = v53;
            v76[3] = v55;
            uint64_t v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:4];
            inputTensors = v16->_inputTensors;
            v16->_inputTensors = (NSArray *)v56;

            v54 = v16;
          }
        }
        else
        {
          v54 = 0;
        }
      }
      else
      {
        v54 = 0;
      }
    }
    else
    {
      v54 = 0;
    }
    if (v67)
    {
      v68 = v67;
      operator delete(v67);
    }
    if (v69)
    {
      v70 = v69;
      operator delete(v69);
    }
    if (v71)
    {
      v72 = v71;
      operator delete(v71);
    }
    if (v73)
    {
      v74 = v73;
      operator delete(v73);
    }
  }
  else
  {
    v54 = 0;
  }

  return v54;
}

@end