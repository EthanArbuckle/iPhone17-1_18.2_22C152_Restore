@interface MPSGraphTensorData
- (MPSDataType)dataType;
- (MPSGraphDevice)device;
- (MPSGraphTensorData)initWithDevice:(MPSGraphDevice *)device data:(NSData *)data shape:(MPSShape *)shape dataType:(MPSDataType)dataType;
- (MPSGraphTensorData)initWithDevice:(id)a3 IOSurface:(__IOSurface *)a4 rowBytesAlignment:(unint64_t)a5 shape:(id)a6 dataType:(unsigned int)a7;
- (MPSGraphTensorData)initWithDevice:(id)a3 rowBytesAlignment:(unint64_t)a4 shape:(id)a5 dataType:(unsigned int)a6;
- (MPSGraphTensorData)initWithMPSImageBatch:(MPSImageBatch *)imageBatch;
- (MPSGraphTensorData)initWithMPSMatrix:(MPSMatrix *)matrix;
- (MPSGraphTensorData)initWithMPSMatrix:(MPSMatrix *)matrix rank:(NSUInteger)rank;
- (MPSGraphTensorData)initWithMPSNDArray:(MPSNDArray *)ndarray;
- (MPSGraphTensorData)initWithMPSNDArray:(id)a3 device:(id)a4;
- (MPSGraphTensorData)initWithMPSVector:(MPSVector *)vector;
- (MPSGraphTensorData)initWithMPSVector:(MPSVector *)vector rank:(NSUInteger)rank;
- (MPSGraphTensorData)initWithMTLBuffer:(id)a3 shape:(id)a4 strideBytes:(id)a5 dataType:(unsigned int)a6;
- (MPSGraphTensorData)initWithMTLBuffer:(id)a3 shape:(id)a4 strides:(id)a5 dataType:(unsigned int)a6;
- (MPSGraphTensorData)initWithMTLBuffer:(id)a3 shape:(id)a4 strides:(id)a5 interleaves:(id)a6 dataType:(unsigned int)a7;
- (MPSGraphTensorData)initWithMTLBuffer:(id)buffer shape:(MPSShape *)shape dataType:(MPSDataType)dataType;
- (MPSGraphTensorData)initWithMTLBuffer:(id)buffer shape:(MPSShape *)shape dataType:(MPSDataType)dataType rowBytes:(NSUInteger)rowBytes;
- (MPSNDArray)mpsndarray;
- (MPSShape)shape;
- (NSString)label;
- (__IOSurface)iosurface;
- (__n128)getShapeVector;
- (id)checkTensorData:(const float *)a3 nativeUlps:(float)a4 absoluteErr:(float)a5;
- (id)checkTensorData:(const float *)a3 nativeUlps:(float)a4 absoluteErr:(float)a5 PSNR:(float)a6;
- (id)checkWithReferenceTensorData:(id)a3 nativeUlps:(float)a4 absoluteError:(float)a5 PSNR:(float)a6;
- (id)debugDescription;
- (id)initEmptyWithShape:(id)a3 dataType:(unsigned int)a4 device:(id)a5;
- (id)mpsndarrayWithCommandBuffer:(id)a3;
- (int64_t)tensorDataType;
- (unint64_t)getRank;
- (void)commonInitialize;
- (void)copyDataFromNDArrayToImageBatchWithCommandBuffer:(id)a3;
- (void)dealloc;
- (void)print;
- (void)printIOSurface;
- (void)printNDArray;
- (void)setLabel:(id)a3;
@end

@implementation MPSGraphTensorData

- (void)dealloc
{
  iosurface = self->_iosurface;
  if (iosurface) {
    CFRelease(iosurface);
  }
  v4.receiver = self;
  v4.super_class = (Class)MPSGraphTensorData;
  [(MPSGraphTensorData *)&v4 dealloc];
}

- (__IOSurface)iosurface
{
  iosurface = self->_iosurface;
  if (iosurface) {
    return iosurface;
  }
  mpsndarray = self->_mpsndarray;
  iosurface = *(Class *)((char *)&mpsndarray->super.isa + (int)*MEMORY[0x1E4F359B8]);
  if (iosurface) {
    return iosurface;
  }
  v5 = [(MPSNDArray *)mpsndarray buffer];
  v6 = (__IOSurface *)[v5 _aneIOSurface];

  return v6;
}

- (void)commonInitialize
{
  self->_numElements = 1;
  if (self->_rank)
  {
    unint64_t v2 = 0;
    unint64_t v3 = 1;
    do
    {
      v3 *= *(unsigned int *)&self->_shapeValues[4 * (v2 & 0xF)];
      self->_numElements = v3;
      ++v2;
    }
    while (v2 < self->_rank);
  }
  mpsndarray = self->_mpsndarray;
  if (mpsndarray) {
    self->_rowBytes = *(unint64_t *)((char *)mpsndarray + (int)*MEMORY[0x1E4F359D0]);
  }
}

- (MPSShape)shape
{
  unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:self->_rank];
  if (self->_rank)
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)&self->_shapeValues[4 * (v4 & 0xF)]];
      [v3 addObject:v5];

      ++v4;
    }
    while (self->_rank > v4);
  }

  return (MPSShape *)v3;
}

- (unint64_t)getRank
{
  return self->_rank;
}

- (__n128)getShapeVector
{
  __n128 result = *(__n128 *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 48) = v4;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (MPSGraphTensorData)initWithDevice:(MPSGraphDevice *)device data:(NSData *)data shape:(MPSShape *)shape dataType:(MPSDataType)dataType
{
  v21 = device;
  v20 = data;
  v22.receiver = self;
  v22.super_class = (Class)MPSGraphTensorData;
  v19 = shape;
  v11 = [(MPSGraphTensorData *)&v22 init];
  v11->_tensorDataType = 2;
  v12 = v19;
  unint64_t v13 = [(MPSShape *)v12 count];
  *(void *)&long long v14 = 0x100000001;
  *((void *)&v14 + 1) = 0x100000001;
  *(_OWORD *)&v11->_shapeValues[32] = v14;
  *(_OWORD *)&v11->_shapeValues[48] = v14;
  if (v13 >= 0x10) {
    uint64_t v15 = 16;
  }
  else {
    uint64_t v15 = v13;
  }
  *(_OWORD *)v11->_shapeValues = v14;
  *(_OWORD *)&v11->_shapeValues[16] = v14;
  if (v15)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      v17 = [(MPSShape *)v12 objectAtIndexedSubscript:i];
      *(_DWORD *)&v11->_shapeValues[4 * i] = [v17 unsignedIntValue];
    }
  }

  v11->_rank = v15;
  v11->_dataType = dataType;
  objc_storeStrong((id *)&v11->_device, device);
  objc_storeStrong((id *)&v11->_data, data);
  [(MPSGraphTensorData *)v11 commonInitialize];

  return v11;
}

- (MPSGraphTensorData)initWithMTLBuffer:(id)buffer shape:(MPSShape *)shape dataType:(MPSDataType)dataType
{
  uint64_t v5 = *(void *)&dataType;
  id v8 = buffer;
  v9 = shape;
  v28.receiver = self;
  v28.super_class = (Class)MPSGraphTensorData;
  v10 = [(MPSGraphTensorData *)&v28 init];
  v11 = v10;
  v10->_tensorDataType = 0;
  v12 = v9;
  unint64_t v13 = [(MPSShape *)v12 count];
  *(void *)&long long v14 = 0x100000001;
  *((void *)&v14 + 1) = 0x100000001;
  *(_OWORD *)&v10->_shapeValues[32] = v14;
  *(_OWORD *)&v10->_shapeValues[48] = v14;
  if (v13 >= 0x10) {
    uint64_t v15 = 16;
  }
  else {
    uint64_t v15 = v13;
  }
  *(_OWORD *)v10->_shapeValues = v14;
  *(_OWORD *)&v10->_shapeValues[16] = v14;
  if (v15)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      v17 = [(MPSShape *)v12 objectAtIndexedSubscript:i];
      *(_DWORD *)&v10->_shapeValues[4 * i] = [v17 unsignedIntValue];
    }
  }

  v10->_rank = v15;
  v10->_dataType = v5;
  v18 = [v8 device];
  uint64_t v19 = +[MPSGraphDevice deviceWithMTLDevice:v18];
  device = v11->_device;
  v11->_device = (MPSGraphDevice *)v19;

  v21 = (__IOSurface *)[v8 iosurface];
  v11->_iosurface = v21;
  if (v21) {
    CFRetain(v21);
  }
  objc_super v22 = (void *)MEMORY[0x1E4F35720];
  v23 = adaptForMPS(v12);
  v24 = [v22 descriptorWithDataType:v5 shape:v23];

  [v24 setPreferPackedRows:1];
  uint64_t v25 = [objc_alloc(MEMORY[0x1E4F35690]) initWithBuffer:v8 descriptor:v24];
  mpsndarray = v11->_mpsndarray;
  v11->_mpsndarray = (MPSNDArray *)v25;

  [(MPSGraphTensorData *)v11 commonInitialize];
  return v11;
}

- (MPSGraphTensorData)initWithMTLBuffer:(id)buffer shape:(MPSShape *)shape dataType:(MPSDataType)dataType rowBytes:(NSUInteger)rowBytes
{
  uint64_t v7 = *(void *)&dataType;
  id v10 = buffer;
  v33 = shape;
  v34.receiver = self;
  v34.super_class = (Class)MPSGraphTensorData;
  v11 = [(MPSGraphTensorData *)&v34 init];
  v12 = v11;
  v11->_tensorDataType = 0;
  unint64_t v13 = v33;
  unint64_t v14 = [(MPSShape *)v13 count];
  *(void *)&long long v15 = 0x100000001;
  *((void *)&v15 + 1) = 0x100000001;
  *(_OWORD *)&v11->_shapeValues[32] = v15;
  *(_OWORD *)&v11->_shapeValues[48] = v15;
  if (v14 >= 0x10) {
    uint64_t v16 = 16;
  }
  else {
    uint64_t v16 = v14;
  }
  *(_OWORD *)v11->_shapeValues = v15;
  *(_OWORD *)&v11->_shapeValues[16] = v15;
  if (v16)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      v18 = [(MPSShape *)v13 objectAtIndexedSubscript:i];
      *(_DWORD *)&v11->_shapeValues[4 * i] = [v18 unsignedIntValue];
    }
  }

  v11->_rank = v16;
  v11->_dataType = v7;
  uint64_t v19 = [v10 device];
  uint64_t v20 = +[MPSGraphDevice deviceWithMTLDevice:v19];
  device = v12->_device;
  v12->_device = (MPSGraphDevice *)v20;

  objc_super v22 = (__IOSurface *)[v10 iosurface];
  v12->_iosurface = v22;
  if (v22) {
    CFRetain(v22);
  }
  v23 = [(MPSShape *)v13 objectAtIndexedSubscript:v12->_rank - 1];
  [v23 longLongValue];

  v24 = [(MPSShape *)v13 objectAtIndexedSubscript:v12->_rank - 1];
  unint64_t v25 = (unsigned __int16)v7 >> 3;
  NSUInteger v26 = [v24 longLongValue] * v25;

  if (v26 > rowBytes && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  if (rowBytes % v25 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  v12->_rowBytes = rowBytes;
  v27 = (void *)MEMORY[0x1E4F35720];
  objc_super v28 = adaptForMPS(v13);
  v29 = [v27 descriptorWithDataType:v7 shape:v28];

  [v29 setRowBytes:v12->_rowBytes];
  uint64_t v30 = [objc_alloc(MEMORY[0x1E4F35690]) initWithBuffer:v10 descriptor:v29];
  mpsndarray = v12->_mpsndarray;
  v12->_mpsndarray = (MPSNDArray *)v30;

  [(MPSGraphTensorData *)v12 commonInitialize];
  return v12;
}

- (MPSGraphTensorData)initWithMTLBuffer:(id)a3 shape:(id)a4 strides:(id)a5 dataType:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  for (unint64_t i = 0; i < [v11 count]; ++i)
    [v13 addObject:&unk_1EC9EFDF8];
  long long v15 = [(MPSGraphTensorData *)self initWithMTLBuffer:v10 shape:v11 strides:v12 interleaves:v13 dataType:v6];

  return v15;
}

- (MPSGraphTensorData)initWithMTLBuffer:(id)a3 shape:(id)a4 strides:(id)a5 interleaves:(id)a6 dataType:(unsigned int)a7
{
  v129[15] = *MEMORY[0x1E4F143B8];
  id v109 = a3;
  id v107 = a4;
  id v11 = a5;
  id v114 = a6;
  v124.receiver = self;
  v124.super_class = (Class)MPSGraphTensorData;
  id v12 = v11;
  v111 = [(MPSGraphTensorData *)&v124 init];
  v111->_tensorDataType = 0;
  id v116 = v107;
  id v110 = v11;
  unint64_t v13 = [v116 count];
  *(void *)&long long v14 = 0x100000001;
  *((void *)&v14 + 1) = 0x100000001;
  *(_OWORD *)&v111->_shapeValues[32] = v14;
  *(_OWORD *)&v111->_shapeValues[48] = v14;
  if (v13 >= 0x10) {
    uint64_t v15 = 16;
  }
  else {
    uint64_t v15 = v13;
  }
  *(_OWORD *)v111->_shapeValues = v14;
  *(_OWORD *)&v111->_shapeValues[16] = v14;
  if (v15)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      v17 = [v116 objectAtIndexedSubscript:i];
      *(_DWORD *)&v111->_shapeValues[4 * i] = [v17 unsignedIntValue];
    }
  }

  v111->_unint64_t rank = v15;
  v111->_dataType = a7;
  v18 = [v109 device];
  uint64_t v19 = +[MPSGraphDevice deviceWithMTLDevice:v18];
  device = v111->_device;
  v111->_device = (MPSGraphDevice *)v19;

  v21 = (__IOSurface *)[v109 iosurface];
  v111->_iosurface = v21;
  if (v21) {
    CFRetain(v21);
  }
  [v116 count];
  [v11 count];
  uint64_t v22 = [v116 count];
  if (v22 != [v11 count] && MTLReportFailureTypeEnabled())
  {
    uint64_t v100 = [v116 count];
    uint64_t v103 = [v11 count];
    MTLReportFailure();
  }
  objc_msgSend(v116, "count", v100, v103);
  [v114 count];
  uint64_t v23 = [v116 count];
  if (v23 != [v114 count] && MTLReportFailureTypeEnabled())
  {
    v101 = (void *)[v116 count];
    v104 = (void *)[v114 count];
    MTLReportFailure();
  }
  memset(v129, 0, 120);
  uint64_t v24 = 1;
  uint64_t v128 = 1;
  memset(v127, 0, sizeof(v127));
  uint64_t v126 = 1;
  memset(&v125[1], 0, 120);
  v125[0] = 1;
  unint64_t rank = v111->_rank;
  NSUInteger v26 = v111;
  if (rank >= 0x10) {
    unint64_t rank = 16;
  }
  v121 = 0;
  uint64_t v122 = 0;
  v123 = 0;
  unint64_t v115 = rank;
  if (!rank)
  {
    objc_super v28 = 0;
    goto LABEL_49;
  }
  v27 = 0;
  __p = 0;
  objc_super v28 = 0;
  uint64_t v29 = 0;
  uint64_t v24 = 1;
  unint64_t v30 = rank;
  do
  {
    unint64_t v32 = v30 + ~v29;
    v33 = objc_msgSend(v12, "objectAtIndexedSubscript:", v32, v101, v104);
    v129[v29 - 1] = [v33 unsignedIntegerValue];

    objc_super v34 = [v114 objectAtIndexedSubscript:v32];
    unint64_t v35 = [v34 unsignedIntegerValue];
    v125[v29] = v35;

    v127[v29 - 1] = *(unsigned int *)&v111->_shapeValues[4 * (v32 & 0xF)];
    if (v29 && v35 >= 2)
    {
      if (v28 < __p)
      {
        *(_DWORD *)objc_super v28 = v29;
        uint64_t v31 = (uint64_t)(v28 + 4);
LABEL_16:
        uint64_t v122 = v31;
        v24 *= v35;
        objc_super v28 = (char *)v31;
        goto LABEL_17;
      }
      uint64_t v36 = (v28 - v27) >> 2;
      unint64_t v37 = v36 + 1;
      if ((unint64_t)(v36 + 1) >> 62) {
        std::vector<int>::__throw_length_error[abi:ne180100]();
      }
      if ((__p - v27) >> 1 > v37) {
        unint64_t v37 = (__p - v27) >> 1;
      }
      if ((unint64_t)(__p - v27) >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v38 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v38 = v37;
      }
      if (v38)
      {
        if (v38 >> 62) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        v39 = operator new(4 * v38);
        v40 = &v39[4 * v36];
        *(_DWORD *)v40 = v29;
        uint64_t v31 = (uint64_t)(v40 + 4);
        int64_t v41 = v28 - v27;
        if (v28 != v27)
        {
LABEL_30:
          unint64_t v42 = v41 - 4;
          if (v42 < 0xBC
            || (unint64_t v45 = (v28 - 4 - v27) & 0xFFFFFFFFFFFFFFFCLL, &v39[v28 - v27 - 4 - v45] > &v39[v28 - v27 - 4])
            || &v28[-v45 - 4] > v28 - 4
            || (unint64_t)(v27 - v39) < 0x20)
          {
            v43 = v28;
            id v12 = v110;
          }
          else
          {
            uint64_t v46 = (v42 >> 2) + 1;
            uint64_t v47 = 4 * (v46 & 0x7FFFFFFFFFFFFFF8);
            v43 = &v28[-v47];
            v40 -= v47;
            v48 = &v39[4 * v36 - 16];
            v49 = v28 - 16;
            uint64_t v50 = v46 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              long long v51 = *(_OWORD *)v49;
              *(v48 - 1) = *((_OWORD *)v49 - 1);
              _OWORD *v48 = v51;
              v48 -= 2;
              v49 -= 32;
              v50 -= 8;
            }
            while (v50);
            id v12 = v110;
            if (v46 == (v46 & 0x7FFFFFFFFFFFFFF8))
            {
LABEL_33:
              v121 = v40;
              uint64_t v122 = v31;
              __p = &v39[4 * v38];
              v123 = __p;
              if (!v27)
              {
LABEL_35:
                v27 = v40;
                goto LABEL_16;
              }
LABEL_34:
              operator delete(v27);
              goto LABEL_35;
            }
          }
          do
          {
            int v44 = *((_DWORD *)v43 - 1);
            v43 -= 4;
            *((_DWORD *)v40 - 1) = v44;
            v40 -= 4;
          }
          while (v43 != v27);
          goto LABEL_33;
        }
      }
      else
      {
        v39 = 0;
        v40 = (char *)(4 * v36);
        *(_DWORD *)(4 * v36) = v29;
        uint64_t v31 = 4 * v36 + 4;
        int64_t v41 = v28 - v27;
        if (v28 != v27) {
          goto LABEL_30;
        }
      }
      id v12 = v110;
      v121 = v40;
      uint64_t v122 = v31;
      __p = &v39[4 * v38];
      v123 = __p;
      if (!v27) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
LABEL_17:
    ++v29;
    unint64_t v30 = v115;
  }
  while (v29 != v115);
  if (v125[0] == 1) {
    goto LABEL_47;
  }
  NSUInteger v26 = v111;
  if (MTLReportFailureTypeEnabled())
  {
    v101 = [v114 lastObject];
    MTLReportFailure();

LABEL_47:
    NSUInteger v26 = v111;
  }
LABEL_49:
  unint64_t v52 = v115 - 1;
  if (v115 <= 1) {
    uint64_t v53 = 1;
  }
  else {
    uint64_t v53 = v115;
  }
  uint64_t v54 = objc_msgSend(MEMORY[0x1E4F35720], "descriptorWithDataType:dimensionCount:dimensionSizes:", a7, v53, &v126, v101);
  v55 = (char *)v54;
  __pa = v121;
  uint64_t v56 = (v28 - v121) >> 2;
  if (v56)
  {
    v57 = (int *)MEMORY[0x1E4F359F0];
    v58 = (int *)MEMORY[0x1E4F35A18];
    if (v56 == 1 && v127[*(int *)v121 - 1] == v24)
    {
      *(_DWORD *)(v54 + (int)*MEMORY[0x1E4F35A18]) = v24;
      unint64_t v59 = v128;
      *(_DWORD *)(v54 + *v57) = v128;
      if (v115 >= 2)
      {
        for (uint64_t j = 1; j != v115; ++j)
        {
          unint64_t v61 = v129[j - 1];
          uint64_t v62 = 4 * j;
          *(_DWORD *)(v54 + *v57 + v62) = v61 / v59;
          *(_DWORD *)(v54 + *v58 + v62) = v127[(int)(j - (j <= *(int *)__pa)) - 1];
          unint64_t v59 = v61;
        }
      }
    }
    else
    {
      *(_DWORD *)(v54 + (int)*MEMORY[0x1E4F35A18]) *= v24;
      if (v115 >= 2)
      {
        unint64_t v63 = v129[0];
        *(_DWORD *)(v54 + (int)*MEMORY[0x1E4F359F0]) = v129[0];
        uint64_t v64 = v125[1];
        *(_DWORD *)(v54 + *v58 + 4) = v127[0] / v125[1];
        unint64_t v65 = v115;
        if (v64 * *(unsigned int *)(v54 + *v58 + 4) != v127[0] && MTLReportFailureTypeEnabled())
        {
          v106 = [v116 description];
          [v114 description];
          v104 = uint64_t v102 = (uint64_t)v106;
          MTLReportFailure();

          id v12 = v110;
          unint64_t v65 = v115;
        }
        if (v65 != 2)
        {
          uint64_t v97 = 0;
          do
          {
            unint64_t v98 = v63;
            unint64_t v63 = v129[v97 + 1];
            *(_DWORD *)&v55[4 * (v97 + 1) + *MEMORY[0x1E4F359F0]] = v63 / v98;
            unint64_t v99 = v125[v97 + 2];
            *(_DWORD *)&v55[4 * (v97 + 2) + *v58] = v127[v97 + 1] / v99;
            if (v99 * *(unsigned int *)&v55[4 * (((int)v97 + 2) & 0xFLL) + *v58] != v127[v97 + 1]
              && MTLReportFailureTypeEnabled())
            {
              v105 = [v116 description];
              [v114 description];
              v104 = uint64_t v102 = (uint64_t)v105;
              MTLReportFailure();
            }
            ++v97;
          }
          while (v65 - 2 != v97);
        }
      }
      v57 = (int *)MEMORY[0x1E4F359F0];
      *(_DWORD *)&v55[4 * v52 + (int)*MEMORY[0x1E4F359F0]] = v127[v52 - 1];
      NSUInteger v26 = v111;
    }
    v26->_rowBytes = *(unsigned int *)&v55[*v57] * (unint64_t)((unsigned __int16)a7 >> 3);
    objc_msgSend(v55, "setRowBytes:", v102, v104);
    uint64_t v66 = [objc_alloc(MEMORY[0x1E4F35690]) initWithBuffer:v109 descriptor:v55];
    mpsndarray = v26->_mpsndarray;
    v26->_mpsndarray = (MPSNDArray *)v66;

    v68 = v111;
    if (v115)
    {
      uint64_t v69 = 0;
      long long v71 = *(_OWORD *)&v111->_shapeValues[32];
      long long v70 = *(_OWORD *)&v111->_shapeValues[48];
      long long v73 = *(_OWORD *)v111->_shapeValues;
      long long v72 = *(_OWORD *)&v111->_shapeValues[16];
      do
      {
        int v74 = *(_DWORD *)&v55[4 * (v52 & 0xF) + *v58];
        long long v117 = v73;
        long long v118 = v72;
        long long v119 = v71;
        long long v120 = v70;
        *((_DWORD *)&v117 + (v69 & 0xF)) = v74;
        long long v71 = v119;
        long long v70 = v120;
        long long v73 = v117;
        long long v72 = v118;
        *(_OWORD *)&v111->_shapeValues[32] = v119;
        *(_OWORD *)&v111->_shapeValues[48] = v70;
        *(_OWORD *)v111->_shapeValues = v73;
        *(_OWORD *)&v111->_shapeValues[16] = v72;
        ++v69;
        --v52;
      }
      while (v52 != -1);
    }
    goto LABEL_87;
  }
  unint64_t v75 = v128;
  if (v115) {
    BOOL v76 = v128 == 1;
  }
  else {
    BOOL v76 = 1;
  }
  int v77 = !v76;
  if (v76)
  {
    v86 = (int *)MEMORY[0x1E4F35A18];
    *(_DWORD *)(v54 + (int)*MEMORY[0x1E4F35A18]) = v126;
    if (v115 >= 2)
    {
      uint64_t v87 = 0;
      v88 = (int *)MEMORY[0x1E4F359F0];
      do
      {
        unint64_t v89 = v129[v87];
        *(_DWORD *)(v54 + *v88 + 4 * v87) = v89 / v75;
        uint64_t v90 = v87 + 1;
        *(_DWORD *)(v54 + *v86 + 4 * v90) = v127[v87++];
        unint64_t v75 = v89;
      }
      while (v52 != v90);
    }
    *(_DWORD *)(v54 + (int)*MEMORY[0x1E4F359F0] + 4 * v52) = v127[v52 - 1];
  }
  else
  {
    if (v115 >= 0x10)
    {
      if (MTLReportFailureTypeEnabled())
      {
        uint64_t v102 = [v116 count];
        MTLReportFailure();
      }
      *(_DWORD *)&v55[*MEMORY[0x1E4F359F0]] = v75;
      *(_DWORD *)&v55[*MEMORY[0x1E4F35A18]] = 1;
LABEL_76:
      uint64_t v78 = 0;
      v79 = (int *)MEMORY[0x1E4F359F0];
      v80 = (int *)MEMORY[0x1E4F35A18];
      do
      {
        uint64_t v81 = v78;
        unint64_t v82 = v129[v78++];
        uint64_t v83 = 4 * v78;
        *(_DWORD *)&v55[*v79 + v83] = v82 / v75;
        *(_DWORD *)&v55[*v80 + v83] = v127[v81 - 1];
        unint64_t v75 = v82;
      }
      while (v52 != v78);
    }
    else
    {
      *(_DWORD *)(v54 + (int)*MEMORY[0x1E4F359F0]) = v128;
      *(_DWORD *)(v54 + (int)*MEMORY[0x1E4F35A18]) = 1;
      if (v115 > 1) {
        goto LABEL_76;
      }
    }
    v84 = (int *)MEMORY[0x1E4F35A18];
    uint64_t v85 = 4 * v115;
    *(_DWORD *)&v55[(int)*MEMORY[0x1E4F35A18] + v85] = v127[v115 - 2];
    *(_DWORD *)&v55[(int)*MEMORY[0x1E4F359F0] + v85] = *(_DWORD *)&v55[4 * (v115 & 0xF) + *v84];
    ++*(void *)&v55[*MEMORY[0x1E4F35A00]];
  }
  v26->_rowBytes = *(unsigned int *)&v55[*MEMORY[0x1E4F359F0]] * (unint64_t)((unsigned __int16)a7 >> 3);
  [v55 setRowBytes:v102];
  uint64_t v91 = [objc_alloc(MEMORY[0x1E4F35690]) initWithBuffer:v109 descriptor:v55];
  v92 = v26->_mpsndarray;
  v26->_mpsndarray = (MPSNDArray *)v91;

  v68 = v111;
  if (v77)
  {
    uint64_t v93 = 0;
    v94 = (int *)MEMORY[0x1E4F359B0];
    do
    {
      *((unsigned char *)&v111->_mpsndarray->super.isa + *v94 + v93) = v93 + 1;
      ++v93;
    }
    while (v115 != v93);
    *((unsigned char *)&v111->_mpsndarray->super.isa + *v94 + v115) = 0;
    --*(Class *)((char *)&v111->_mpsndarray->super.isa + (int)*MEMORY[0x1E4F359C8]);
  }
LABEL_87:
  [(MPSGraphTensorData *)v68 commonInitialize];
  v95 = v68;

  if (__pa) {
    operator delete(__pa);
  }

  return v95;
}

- (MPSGraphTensorData)initWithMTLBuffer:(id)a3 shape:(id)a4 strideBytes:(id)a5 dataType:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v22, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v22;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = [*(id *)(*((void *)&v23 + 1) + 8 * i) integerValue];
        if (v15 < 1 || v15 % (unint64_t)((unsigned __int16)v6 >> 3))
        {
          if (MTLReportFailureTypeEnabled())
          {
            uint64_t v19 = [v11 description];
            MTLReportFailure();
          }
          v17 = 0;
          goto LABEL_14;
        }
        uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
        [v10 addObject:v16];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  self = [(MPSGraphTensorData *)self initWithMTLBuffer:v20 shape:v21 strides:v10 dataType:v6];
  v17 = self;
LABEL_14:

  return v17;
}

- (MPSGraphTensorData)initWithMPSMatrix:(MPSMatrix *)matrix rank:(NSUInteger)rank
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = matrix;
  v32.receiver = self;
  v32.super_class = (Class)MPSGraphTensorData;
  uint64_t v7 = [(MPSGraphTensorData *)&v32 init];
  v7->_tensorDataType = 0;
  v33[0] = [(MPSMatrix *)v6 columns];
  v33[1] = [(MPSMatrix *)v6 rows];
  v33[2] = [(MPSMatrix *)v6 matrices];
  int64x2_t v34 = vdupq_n_s64(1uLL);
  int64x2_t v35 = v34;
  int64x2_t v36 = v34;
  int64x2_t v37 = v34;
  int64x2_t v38 = v34;
  int64x2_t v39 = v34;
  uint64_t v40 = 1;
  if (rank - 1 >= 0x10 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  uint64_t v8 = 0;
  NSUInteger v9 = 16;
  if (rank < 0x10) {
    NSUInteger v9 = rank;
  }
  if (v9 <= 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v9;
  }
  *(void *)&long long v11 = 0x100000001;
  *((void *)&v11 + 1) = 0x100000001;
  *(_OWORD *)&v7->_shapeValues[32] = v11;
  *(_OWORD *)&v7->_shapeValues[48] = v11;
  *(_OWORD *)v7->_shapeValues = v11;
  *(_OWORD *)&v7->_shapeValues[16] = v11;
  v7->_unint64_t rank = v10;
  long long v13 = *(_OWORD *)&v7->_shapeValues[32];
  long long v12 = *(_OWORD *)&v7->_shapeValues[48];
  long long v15 = *(_OWORD *)v7->_shapeValues;
  long long v14 = *(_OWORD *)&v7->_shapeValues[16];
  uint64_t v16 = v10 - 1;
  do
  {
    uint64_t v17 = v33[v16];
    long long v28 = v15;
    long long v29 = v14;
    long long v30 = v13;
    long long v31 = v12;
    *((_DWORD *)&v28 + (v8 & 0xF)) = v17;
    long long v13 = v30;
    long long v12 = v31;
    long long v15 = v28;
    long long v14 = v29;
    *(_OWORD *)&v7->_shapeValues[32] = v30;
    *(_OWORD *)&v7->_shapeValues[48] = v12;
    *(_OWORD *)v7->_shapeValues = v15;
    *(_OWORD *)&v7->_shapeValues[16] = v14;
    ++v8;
    --v16;
  }
  while (v16 != -1);
  v7->_dataType = [(MPSMatrix *)v6 dataType];
  v18 = [(MPSMatrix *)v6 device];
  uint64_t v19 = +[MPSGraphDevice deviceWithMTLDevice:v18];
  device = v7->_device;
  v7->_device = (MPSGraphDevice *)v19;

  uint64_t v21 = [(MPSMatrix *)v6 columns];
  v7->_rowBytes = v21 * ((unsigned __int16)[(MPSMatrix *)v6 dataType] >> 3);
  id v22 = objc_msgSend(MEMORY[0x1E4F35720], "descriptorWithDataType:dimensionCount:dimensionSizes:", -[MPSMatrix dataType](v6, "dataType"), v10, v33);
  if ([(MPSMatrix *)v6 rowBytes] == v7->_rowBytes) {
    [v22 setPreferPackedRows:1];
  }
  id v23 = objc_alloc(MEMORY[0x1E4F35690]);
  long long v24 = [(MPSMatrix *)v6 data];
  uint64_t v25 = [v23 initWithBuffer:v24 descriptor:v22];
  mpsndarray = v7->_mpsndarray;
  v7->_mpsndarray = (MPSNDArray *)v25;

  [(MPSGraphTensorData *)v7 commonInitialize];
  return v7;
}

- (MPSGraphTensorData)initWithMPSMatrix:(MPSMatrix *)matrix
{
  v28[3] = *MEMORY[0x1E4F143B8];
  long long v4 = matrix;
  v27.receiver = self;
  v27.super_class = (Class)MPSGraphTensorData;
  uint64_t v5 = [(MPSGraphTensorData *)&v27 init];
  v5->_tensorDataType = 0;
  uint64_t v6 = [(MPSMatrix *)v4 columns];
  unsigned int v7 = v6;
  v28[0] = v6;
  uint64_t v8 = [(MPSMatrix *)v4 rows];
  unsigned int v9 = v8;
  v28[1] = v8;
  uint64_t v10 = [(MPSMatrix *)v4 matrices];
  v28[2] = v10;
  if (v10 == 1) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 3;
  }
  *(void *)&long long v12 = 0x100000001;
  *((void *)&v12 + 1) = 0x100000001;
  *(_OWORD *)&v5->_shapeValues[32] = v12;
  *(_OWORD *)&v5->_shapeValues[48] = v12;
  *(_OWORD *)v5->_shapeValues = v12;
  *(_OWORD *)&v5->_shapeValues[16] = v12;
  v5->_unint64_t rank = v11;
  long long v14 = *(_OWORD *)&v5->_shapeValues[32];
  long long v13 = *(_OWORD *)&v5->_shapeValues[48];
  long long v15 = *(_OWORD *)v5->_shapeValues;
  long long v16 = *(_OWORD *)&v5->_shapeValues[16];
  if (v10 == 1)
  {
    *(void *)&long long v15 = __PAIR64__(v7, v9);
    *(_DWORD *)v5->_shapeValues = v9;
  }
  else
  {
    *(void *)&long long v15 = __PAIR64__(v9, v10);
    *(_OWORD *)&v5->_shapeValues[32] = v14;
    *(_OWORD *)&v5->_shapeValues[48] = v13;
    *(_OWORD *)v5->_shapeValues = v15;
    *(_OWORD *)&v5->_shapeValues[16] = v16;
    DWORD2(v15) = v7;
  }
  *(_OWORD *)v5->_shapeValues = v15;
  *(_OWORD *)&v5->_shapeValues[16] = v16;
  *(_OWORD *)&v5->_shapeValues[32] = v14;
  *(_OWORD *)&v5->_shapeValues[48] = v13;
  v5->_dataType = [(MPSMatrix *)v4 dataType];
  uint64_t v17 = [(MPSMatrix *)v4 device];
  uint64_t v18 = +[MPSGraphDevice deviceWithMTLDevice:v17];
  device = v5->_device;
  v5->_device = (MPSGraphDevice *)v18;

  uint64_t v20 = [(MPSMatrix *)v4 columns];
  v5->_rowBytes = v20 * ((unsigned __int16)[(MPSMatrix *)v4 dataType] >> 3);
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F35720], "descriptorWithDataType:dimensionCount:dimensionSizes:", -[MPSMatrix dataType](v4, "dataType"), v11, v28);
  if ([(MPSMatrix *)v4 rowBytes] == v5->_rowBytes) {
    [v21 setPreferPackedRows:1];
  }
  id v22 = objc_alloc(MEMORY[0x1E4F35690]);
  id v23 = [(MPSMatrix *)v4 data];
  uint64_t v24 = [v22 initWithBuffer:v23 descriptor:v21];
  mpsndarray = v5->_mpsndarray;
  v5->_mpsndarray = (MPSNDArray *)v24;

  [(MPSGraphTensorData *)v5 commonInitialize];
  return v5;
}

- (MPSGraphTensorData)initWithMPSVector:(MPSVector *)vector
{
  v27[2] = *MEMORY[0x1E4F143B8];
  long long v4 = vector;
  v26.receiver = self;
  v26.super_class = (Class)MPSGraphTensorData;
  uint64_t v5 = [(MPSGraphTensorData *)&v26 init];
  v5->_tensorDataType = 0;
  uint64_t v6 = [(MPSVector *)v4 length];
  unsigned int v7 = v6;
  v27[0] = v6;
  uint64_t v8 = [(MPSVector *)v4 vectors];
  v27[1] = v8;
  if (v8 == 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  *(void *)&long long v10 = 0x100000001;
  *((void *)&v10 + 1) = 0x100000001;
  *(_OWORD *)&v5->_shapeValues[32] = v10;
  *(_OWORD *)&v5->_shapeValues[48] = v10;
  *(_OWORD *)v5->_shapeValues = v10;
  *(_OWORD *)&v5->_shapeValues[16] = v10;
  v5->_unint64_t rank = v9;
  long long v12 = *(_OWORD *)&v5->_shapeValues[32];
  long long v11 = *(_OWORD *)&v5->_shapeValues[48];
  long long v13 = *(_OWORD *)v5->_shapeValues;
  long long v14 = *(_OWORD *)&v5->_shapeValues[16];
  if (v8 == 1)
  {
    LODWORD(v13) = v7;
  }
  else
  {
    *(void *)&long long v13 = __PAIR64__(v7, v8);
    *(_DWORD *)v5->_shapeValues = v8;
  }
  *(_OWORD *)v5->_shapeValues = v13;
  *(_OWORD *)&v5->_shapeValues[16] = v14;
  *(_OWORD *)&v5->_shapeValues[32] = v12;
  *(_OWORD *)&v5->_shapeValues[48] = v11;
  v5->_dataType = [(MPSVector *)v4 dataType];
  long long v15 = [(MPSVector *)v4 device];
  uint64_t v16 = +[MPSGraphDevice deviceWithMTLDevice:v15];
  device = v5->_device;
  v5->_device = (MPSGraphDevice *)v16;

  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F35720], "descriptorWithDataType:dimensionCount:dimensionSizes:", -[MPSVector dataType](v4, "dataType"), v9, v27);
  uint64_t v19 = [(MPSVector *)v4 vectorBytes];
  uint64_t v20 = [(MPSVector *)v4 length];
  if (v19 == v20 * ((unsigned __int16)[(MPSVector *)v4 dataType] >> 3)) {
    [v18 setPreferPackedRows:1];
  }
  id v21 = objc_alloc(MEMORY[0x1E4F35690]);
  id v22 = [(MPSVector *)v4 data];
  uint64_t v23 = [v21 initWithBuffer:v22 descriptor:v18];
  mpsndarray = v5->_mpsndarray;
  v5->_mpsndarray = (MPSNDArray *)v23;

  [(MPSGraphTensorData *)v5 commonInitialize];
  return v5;
}

- (MPSGraphTensorData)initWithMPSVector:(MPSVector *)vector rank:(NSUInteger)rank
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = vector;
  v33.receiver = self;
  v33.super_class = (Class)MPSGraphTensorData;
  unsigned int v7 = [(MPSGraphTensorData *)&v33 init];
  v7->_tensorDataType = 0;
  v34[0] = [(MPSVector *)v6 length];
  v34[1] = [(MPSVector *)v6 vectors];
  int64x2_t v35 = vdupq_n_s64(1uLL);
  int64x2_t v36 = v35;
  int64x2_t v37 = v35;
  int64x2_t v38 = v35;
  int64x2_t v39 = v35;
  int64x2_t v40 = v35;
  int64x2_t v41 = v35;
  if (rank - 1 >= 0x10 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  uint64_t v8 = 0;
  NSUInteger v9 = 16;
  if (rank < 0x10) {
    NSUInteger v9 = rank;
  }
  if (v9 <= 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v9;
  }
  *(void *)&long long v11 = 0x100000001;
  *((void *)&v11 + 1) = 0x100000001;
  *(_OWORD *)&v7->_shapeValues[32] = v11;
  *(_OWORD *)&v7->_shapeValues[48] = v11;
  *(_OWORD *)v7->_shapeValues = v11;
  *(_OWORD *)&v7->_shapeValues[16] = v11;
  v7->_unint64_t rank = v10;
  long long v13 = *(_OWORD *)&v7->_shapeValues[32];
  long long v12 = *(_OWORD *)&v7->_shapeValues[48];
  long long v15 = *(_OWORD *)v7->_shapeValues;
  long long v14 = *(_OWORD *)&v7->_shapeValues[16];
  uint64_t v16 = v10 - 1;
  do
  {
    uint64_t v17 = v34[v16];
    long long v29 = v15;
    long long v30 = v14;
    long long v31 = v13;
    long long v32 = v12;
    *((_DWORD *)&v29 + (v8 & 0xF)) = v17;
    long long v13 = v31;
    long long v12 = v32;
    long long v15 = v29;
    long long v14 = v30;
    *(_OWORD *)&v7->_shapeValues[32] = v31;
    *(_OWORD *)&v7->_shapeValues[48] = v12;
    *(_OWORD *)v7->_shapeValues = v15;
    *(_OWORD *)&v7->_shapeValues[16] = v14;
    ++v8;
    --v16;
  }
  while (v16 != -1);
  v7->_dataType = [(MPSVector *)v6 dataType];
  uint64_t v18 = [(MPSVector *)v6 device];
  uint64_t v19 = +[MPSGraphDevice deviceWithMTLDevice:v18];
  device = v7->_device;
  v7->_device = (MPSGraphDevice *)v19;

  id v21 = objc_msgSend(MEMORY[0x1E4F35720], "descriptorWithDataType:dimensionCount:dimensionSizes:", -[MPSVector dataType](v6, "dataType"), v10, v34);
  uint64_t v22 = [(MPSVector *)v6 vectorBytes];
  uint64_t v23 = [(MPSVector *)v6 length];
  if (v22 == v23 * ((unsigned __int16)[(MPSVector *)v6 dataType] >> 3)) {
    [v21 setPreferPackedRows:1];
  }
  id v24 = objc_alloc(MEMORY[0x1E4F35690]);
  uint64_t v25 = [(MPSVector *)v6 data];
  uint64_t v26 = [v24 initWithBuffer:v25 descriptor:v21];
  mpsndarray = v7->_mpsndarray;
  v7->_mpsndarray = (MPSNDArray *)v26;

  [(MPSGraphTensorData *)v7 commonInitialize];
  return v7;
}

- (MPSGraphTensorData)initWithMPSNDArray:(id)a3 device:(id)a4
{
  unsigned int v7 = (char *)a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)MPSGraphTensorData;
  NSUInteger v9 = [(MPSGraphTensorData *)&v28 init];
  uint64_t v10 = v9;
  long long v11 = v9;
  v9->_tensorDataType = 0;
  v9->_unint64_t rank = *(void *)&v7[*MEMORY[0x1E4F359C8]];
  *(void *)&long long v12 = 0x100000001;
  *((void *)&v12 + 1) = 0x100000001;
  *(_OWORD *)v9->_shapeValues = v12;
  *(_OWORD *)&v9->_shapeValues[16] = v12;
  *(_OWORD *)&v9->_shapeValues[32] = v12;
  *(_OWORD *)&v9->_shapeValues[48] = v12;
  unint64_t rank = v9->_rank;
  if (rank)
  {
    unint64_t v14 = 0;
    uint64_t v15 = -1;
    uint64_t v16 = (int *)MEMORY[0x1E4F359D8];
    uint64_t v17 = (int *)MEMORY[0x1E4F359B0];
    *(void *)&long long v18 = 0x100000001;
    *((void *)&v18 + 1) = 0x100000001;
    *(void *)&long long v19 = 0x100000001;
    *((void *)&v19 + 1) = 0x100000001;
    *(void *)&long long v20 = 0x100000001;
    *((void *)&v20 + 1) = 0x100000001;
    do
    {
      id v21 = &v7[*v16];
      long long v23 = *(_OWORD *)&v7[*v17];
      LODWORD(v21) = *(_DWORD *)&v21[4 * (*(unsigned char *)((unint64_t)&v23 | v14 & 0xF) & 0xF)];
      long long v24 = v12;
      long long v25 = v18;
      long long v26 = v19;
      long long v27 = v20;
      *((_DWORD *)&v24 + (((_BYTE)rank + (_BYTE)v15) & 0xF)) = v21;
      long long v19 = v26;
      long long v20 = v27;
      long long v12 = v24;
      long long v18 = v25;
      *(_OWORD *)&v9->_shapeValues[32] = v26;
      *(_OWORD *)&v9->_shapeValues[48] = v20;
      *(_OWORD *)v9->_shapeValues = v12;
      *(_OWORD *)&v9->_shapeValues[16] = v18;
      ++v14;
      unint64_t rank = v9->_rank;
      --v15;
    }
    while (v14 < rank);
  }
  v9->_dataType = objc_msgSend(v7, "dataType", v23, v24, v25, v26, v27);
  objc_storeStrong((id *)&v10->_device, a4);
  objc_storeStrong((id *)&v10->_mpsndarray, a3);
  [(MPSGraphTensorData *)v11 commonInitialize];

  return v11;
}

- (MPSGraphTensorData)initWithMPSNDArray:(MPSNDArray *)ndarray
{
  long long v4 = ndarray;
  uint64_t v5 = [(MPSNDArray *)v4 device];
  uint64_t v6 = +[MPSGraphDevice deviceWithMTLDevice:v5];
  unsigned int v7 = [(MPSGraphTensorData *)self initWithMPSNDArray:v4 device:v6];

  return v7;
}

- (MPSGraphTensorData)initWithMPSImageBatch:(MPSImageBatch *)imageBatch
{
  uint64_t v5 = imageBatch;
  v22.receiver = self;
  v22.super_class = (Class)MPSGraphTensorData;
  uint64_t v6 = [(MPSGraphTensorData *)&v22 init];
  v6->_tensorDataType = 1;
  v6->_unint64_t rank = 4;
  *(void *)&long long v7 = 0x100000001;
  *((void *)&v7 + 1) = 0x100000001;
  *(_OWORD *)&v6->_shapeValues[32] = v7;
  *(_OWORD *)&v6->_shapeValues[48] = v7;
  *(_OWORD *)v6->_shapeValues = v7;
  *(_OWORD *)&v6->_shapeValues[16] = v7;
  *(_DWORD *)v6->_shapeValues = [(MPSImageBatch *)v5 count];
  id v8 = [(MPSImageBatch *)v5 objectAtIndexedSubscript:0];
  *(_DWORD *)&v6->_shapeValues[4] = [v8 height];

  NSUInteger v9 = [(MPSImageBatch *)v5 objectAtIndexedSubscript:0];
  *(_DWORD *)&v6->_shapeValues[8] = [v9 width];

  uint64_t v10 = [(MPSImageBatch *)v5 objectAtIndexedSubscript:0];
  *(_DWORD *)&v6->_shapeValues[12] = [v10 featureChannels];

  long long v11 = v5;
  long long v12 = [(MPSImageBatch *)v11 objectAtIndexedSubscript:0];
  uint64_t v13 = [v12 featureChannelFormat];

  if ((unint64_t)(v13 - 1) >= 4)
  {
    if (MTLReportFailureTypeEnabled())
    {
      uint64_t v15 = [(MPSImageBatch *)v11 objectAtIndexedSubscript:0];
      id v21 = [v15 debugDescription];
      MTLReportFailure();
    }
    int v14 = 268435488;
  }
  else
  {
    int v14 = dword_1811329B0[v13 - 1];
  }

  v6->_dataType = v14;
  uint64_t v16 = [(MPSImageBatch *)v11 objectAtIndexedSubscript:0];
  uint64_t v17 = [v16 device];
  uint64_t v18 = +[MPSGraphDevice deviceWithMTLDevice:v17];
  device = v6->_device;
  v6->_device = (MPSGraphDevice *)v18;

  objc_storeStrong((id *)&v6->_mpsimagebatch, imageBatch);
  [(MPSGraphTensorData *)v6 commonInitialize];

  return v6;
}

- (MPSGraphTensorData)initWithDevice:(id)a3 IOSurface:(__IOSurface *)a4 rowBytesAlignment:(unint64_t)a5 shape:(id)a6 dataType:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v30 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MPSGraphTensorData;
  id v31 = a6;
  uint64_t v13 = [(MPSGraphTensorData *)&v32 init];
  *((void *)v13 + 17) = 0;
  adaptForMPS(v31);
  long long v29 = a4;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v15 = [v14 count];
  uint64_t v16 = v13 + 32;
  *(void *)&long long v17 = 0x100000001;
  *((void *)&v17 + 1) = 0x100000001;
  *((_OWORD *)v13 + 4) = v17;
  *((_OWORD *)v13 + 5) = v17;
  if (v15 >= 0x10) {
    uint64_t v18 = 16;
  }
  else {
    uint64_t v18 = v15;
  }
  *uint64_t v16 = v17;
  *((_OWORD *)v13 + 3) = v17;
  if (v18)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      long long v20 = [v14 objectAtIndexedSubscript:i];
      *(_DWORD *)&v13[4 * i + 32] = [v20 unsignedIntValue];
    }
  }

  *((void *)v13 + 12) = v18;
  *((_DWORD *)v13 + 36) = v7;
  objc_storeStrong((id *)v13 + 19, a3);
  *((void *)v13 + 1) = (a5
                        + *((unsigned int *)v16 + ((*((_DWORD *)v13 + 24) - 1) & 0xF))
                        * (unint64_t)((unsigned __int16)v7 >> 3)
                        - 1)
                       / a5
                       * a5;
  id v21 = (void *)MEMORY[0x1E4F35720];
  objc_super v22 = adaptForMPS(v31);
  long long v23 = [v21 descriptorWithDataType:v7 shape:v22];

  [v23 setRowBytes:*((void *)v13 + 1)];
  *((void *)v13 + 15) = v29;
  CFRetain(v29);
  long long v24 = [v30 metalDevice];
  long long v25 = (void *)[v24 newBufferWithIOSurface:v29];

  if (v25)
  {
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F35690]) initWithBuffer:v25 descriptor:v23];
    long long v27 = (void *)*((void *)v13 + 13);
    *((void *)v13 + 13) = v26;
  }
  else if (MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  [v13 commonInitialize];

  return (MPSGraphTensorData *)v13;
}

- (MPSGraphTensorData)initWithDevice:(id)a3 rowBytesAlignment:(unint64_t)a4 shape:(id)a5 dataType:(unsigned int)a6
{
  id v50 = a3;
  id v52 = a5;
  v55.receiver = self;
  v55.super_class = (Class)MPSGraphTensorData;
  uint64_t v10 = [(MPSGraphTensorData *)&v55 init];
  long long v11 = (MPSGraphTensorData *)v10;
  *((void *)v10 + 17) = 0;
  adaptForMPS(v52);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v13 = [v12 count];
  id v14 = v10 + 32;
  *(void *)&long long v15 = 0x100000001;
  *((void *)&v15 + 1) = 0x100000001;
  *((_OWORD *)v10 + 4) = v15;
  *((_OWORD *)v10 + 5) = v15;
  if (v13 >= 0x10) {
    uint64_t v16 = 16;
  }
  else {
    uint64_t v16 = v13;
  }
  *id v14 = v15;
  *((_OWORD *)v10 + 3) = v15;
  if (v16)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      uint64_t v18 = [v12 objectAtIndexedSubscript:i];
      *(_DWORD *)&v10[4 * i + 32] = [v18 unsignedIntValue];
    }
  }

  *((void *)v10 + 12) = v16;
  *((_DWORD *)v10 + 36) = a6;
  long long v19 = (id *)(v10 + 152);
  objc_storeStrong((id *)v10 + 19, a3);
  *((void *)v10 + 1) = (a4
                        + *((unsigned int *)v14 + ((*((_DWORD *)v10 + 24) - 1) & 0xF))
                        * (unint64_t)((unsigned __int16)a6 >> 3)
                        - 1)
                       / a4
                       * a4;
  if ([*((id *)v10 + 19) type] != 1)
  {
    if ([*v19 type] != 2)
    {
      int64x2_t v35 = (void *)MEMORY[0x1E4F35720];
      int64x2_t v36 = adaptForMPS(v52);
      int64x2_t v37 = [v35 descriptorWithDataType:a6 shape:v36];

      [v37 setRowBytes:v11->_rowBytes];
      id v38 = objc_alloc(MEMORY[0x1E4F35690]);
      int64x2_t v39 = [*v19 metalDevice];
      uint64_t v40 = [v38 initWithDevice:v39 descriptor:v37];
      mpsndarray = v11->_mpsndarray;
      v11->_mpsndarray = (MPSNDArray *)v40;

LABEL_24:
      goto LABEL_25;
    }
    uint64_t v27 = *((void *)v10 + 12) - 1;
    if (*((void *)v10 + 12) == 1)
    {
      uint64_t v34 = *((void *)v10 + 1);
      if (v34)
      {
LABEL_23:
        int64x2_t v37 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
        int v44 = [NSNumber numberWithUnsignedInteger:v34];
        [v37 setObject:v44 forKeyedSubscript:*MEMORY[0x1E4F2F2C0]];

        [v37 setObject:&unk_1EC9EFDF8 forKeyedSubscript:*MEMORY[0x1E4F2F0E8]];
        unint64_t v45 = [NSNumber numberWithUnsignedInteger:v34];
        [v37 setObject:v45 forKeyedSubscript:*MEMORY[0x1E4F2EFE0]];

        CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFDictionaryRef)v37);
        IOSurfaceRef v47 = IOSurfaceCreate(Copy);
        CFRelease(Copy);
        uint64_t v48 = [(MPSGraphTensorData *)v11 initWithDevice:v50 IOSurface:v47 rowBytesAlignment:a4 shape:v52 dataType:a6];
        CFRelease(v47);
        long long v11 = (MPSGraphTensorData *)v48;
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v28 = 0;
      long long v30 = *((_OWORD *)v10 + 4);
      long long v29 = *((_OWORD *)v10 + 5);
      long long v32 = *((_OWORD *)v10 + 2);
      long long v31 = *((_OWORD *)v10 + 3);
      uint64_t v33 = 1;
      do
      {
        v54[0] = v32;
        v54[1] = v31;
        v54[2] = v30;
        v54[3] = v29;
        v33 *= *((unsigned int *)v54 + (v28++ & 0xF));
      }
      while (v27 != v28);
      uint64_t v34 = *((void *)v10 + 1) * v33;
      if (v34) {
        goto LABEL_23;
      }
    }
    NSLog(&cfstr_InvalidPlaneco.isa, 1, 0);
    goto LABEL_23;
  }
  uint64_t v20 = *((void *)v10 + 12) - 1;
  if (*((void *)v10 + 12) == 1)
  {
    uint64_t v26 = 1;
  }
  else
  {
    uint64_t v21 = 0;
    long long v23 = *((_OWORD *)v10 + 4);
    long long v22 = *((_OWORD *)v10 + 5);
    long long v25 = *((_OWORD *)v10 + 2);
    long long v24 = *((_OWORD *)v10 + 3);
    uint64_t v26 = 1;
    do
    {
      v53[0] = v25;
      v53[1] = v24;
      v53[2] = v23;
      v53[3] = v22;
      v26 *= *((unsigned int *)v53 + (v21++ & 0xF));
    }
    while (v20 != v21);
  }
  uint64_t v42 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_malloc(*((void *)v10 + 1) * v26, 0x4BDB370AuLL), *((void *)v10 + 1) * v26, 1);
  v43 = (void *)*((void *)v10 + 16);
  *((void *)v10 + 16) = v42;

  *((void *)v10 + 17) = 2;
  long long v11 = (MPSGraphTensorData *)[v10 initWithDevice:v50 data:*((void *)v10 + 16) shape:v52 dataType:a6];
LABEL_25:
  [(MPSGraphTensorData *)v11 commonInitialize];

  return v11;
}

- (id)initEmptyWithShape:(id)a3 dataType:(unsigned int)a4 device:(id)a5
{
  id v8 = a3;
  id v17 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MPSGraphTensorData;
  NSUInteger v9 = [(MPSGraphTensorData *)&v18 init];
  v9->_tensorDataType = 0;
  id v10 = v8;
  unint64_t v11 = [v10 count];
  *(void *)&long long v12 = 0x100000001;
  *((void *)&v12 + 1) = 0x100000001;
  *(_OWORD *)&v9->_shapeValues[32] = v12;
  *(_OWORD *)&v9->_shapeValues[48] = v12;
  if (v11 >= 0x10) {
    uint64_t v13 = 16;
  }
  else {
    uint64_t v13 = v11;
  }
  *(_OWORD *)v9->_shapeValues = v12;
  *(_OWORD *)&v9->_shapeValues[16] = v12;
  if (v13)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      long long v15 = [v10 objectAtIndexedSubscript:i];
      *(_DWORD *)&v9->_shapeValues[4 * i] = [v15 unsignedIntValue];
    }
  }

  v9->_unint64_t rank = v13;
  v9->_dataType = a4;
  objc_storeStrong((id *)&v9->_device, a5);
  [(MPSGraphTensorData *)v9 commonInitialize];

  return v9;
}

- (id)mpsndarrayWithCommandBuffer:(id)a3
{
  id v4 = a3;
  if (self->_tensorDataType == 1)
  {
    mpsndarray = self->_mpsndarray;
    if (!mpsndarray)
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F35720];
      unsigned int dataType = self->_dataType;
      uint64_t v6 = [(NSArray *)self->_mpsimagebatch objectAtIndexedSubscript:0];
      uint64_t v7 = [v6 featureChannels];
      id v8 = [(NSArray *)self->_mpsimagebatch objectAtIndexedSubscript:0];
      uint64_t v9 = [v8 width];
      id v10 = [(NSArray *)self->_mpsimagebatch objectAtIndexedSubscript:0];
      unint64_t v11 = objc_msgSend(v21, "descriptorWithDataType:dimensionSizes:", dataType, v7, v9, objc_msgSend(v10, "height"), -[NSArray count](self->_mpsimagebatch, "count"), 0);

      id v12 = objc_alloc(MEMORY[0x1E4F35690]);
      uint64_t v13 = [(NSArray *)self->_mpsimagebatch objectAtIndexedSubscript:0];
      id v14 = [v13 device];
      long long v15 = (MPSNDArray *)[v12 initWithDevice:v14 descriptor:v11];
      uint64_t v16 = self->_mpsndarray;
      self->_mpsndarray = v15;

      mpsndarray = self->_mpsndarray;
    }
    memset(v22, 0, sizeof(v22));
    [(MPSNDArray *)mpsndarray importDataWithCommandBuffer:v4 fromImages:self->_mpsimagebatch offset:v22];
    id v17 = self->_mpsndarray;
  }
  else
  {
    id v17 = [(MPSGraphTensorData *)self mpsndarray];
  }
  objc_super v18 = v17;

  return v18;
}

- (MPSNDArray)mpsndarray
{
  mpsndarray = self->_mpsndarray;
  if (!mpsndarray)
  {
    int64_t tensorDataType = self->_tensorDataType;
    if (tensorDataType == 1)
    {
      id v14 = [(NSArray *)self->_mpsimagebatch objectAtIndexedSubscript:0];
      long long v15 = [v14 device];
      uint64_t v16 = (void *)[v15 newCommandQueue];
      uint64_t v9 = [v16 commandBuffer];

      id v17 = [(MPSGraphTensorData *)self mpsndarrayWithCommandBuffer:v9];
      [v9 commit];
      [v9 waitUntilCompleted];
      goto LABEL_6;
    }
    if (tensorDataType == 2)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F35720];
      uint64_t dataType = self->_dataType;
      uint64_t v7 = [(MPSGraphTensorData *)self shape];
      id v8 = adaptForMPS(v7);
      uint64_t v9 = [v5 descriptorWithDataType:dataType shape:v8];

      id v10 = objc_alloc(MEMORY[0x1E4F35690]);
      unint64_t v11 = [(MPSGraphDevice *)self->_device metalDevice];
      id v12 = (MPSNDArray *)[v10 initWithDevice:v11 descriptor:v9];
      uint64_t v13 = self->_mpsndarray;
      self->_mpsndarray = v12;

      [(MPSNDArray *)self->_mpsndarray writeBytes:[(NSData *)self->_data bytes] strideBytes:0];
LABEL_6:

      mpsndarray = self->_mpsndarray;
      goto LABEL_8;
    }
    mpsndarray = 0;
  }
LABEL_8:
  objc_super v18 = mpsndarray;

  return v18;
}

- (void)copyDataFromNDArrayToImageBatchWithCommandBuffer:(id)a3
{
  memset(v3, 0, sizeof(v3));
  [(MPSNDArray *)self->_mpsndarray exportDataWithCommandBuffer:a3 toImages:self->_mpsimagebatch offset:v3];
}

- (id)debugDescription
{
  long long v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)MPSGraphTensorData;
  id v4 = [(MPSGraphTensorData *)&v9 debugDescription];
  uint64_t v5 = [(MPSNDArray *)self->_mpsndarray debugDescription];
  uint64_t v6 = [(NSArray *)self->_mpsimagebatch debugDescription];
  uint64_t v7 = [v3 stringWithFormat:@"%@\nmpsndarray: %@, imageBatch: %@", v4, v5, v6];

  return v7;
}

- (void)printNDArray
{
  id v2 = [(MPSGraphTensorData *)self mpsndarray];
  [v2 printNDArray];
}

- (void)printIOSurface
{
  int rank = self->_rank;
  long long v4 = *(_OWORD *)self->_shapeValues;
  long long v5 = *(_OWORD *)&self->_shapeValues[16];
  long long v6 = *(_OWORD *)&self->_shapeValues[48];
  long long v34 = *(_OWORD *)&self->_shapeValues[32];
  long long v35 = v6;
  v33[0] = v4;
  v33[1] = v5;
  uint64_t v7 = *((unsigned int *)v33 + (((_BYTE)rank - 1) & 0xF));
  v32[2] = v34;
  v32[3] = v6;
  v32[0] = v4;
  v32[1] = v5;
  uint64_t v8 = *((unsigned int *)v32 + (((_BYTE)rank - 2) & 0xF));
  v31[2] = v34;
  v31[3] = v6;
  v31[0] = v4;
  v31[1] = v5;
  unsigned int v9 = *((_DWORD *)v31 + (((_BYTE)rank - 3) & 0xF));
  uint64_t v10 = (rank - 4) & 0xFLL;
  v30[2] = v34;
  v30[3] = v6;
  v30[0] = v4;
  v30[1] = v5;
  IOSurfaceLock(self->_iosurface, 0, 0);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(self->_iosurface);
  printf("IOSurface %dx%dx%dx%d\n\n", *((_DWORD *)v30 + v10), v9, v8, v7);
  if (v9)
  {
    if (v8)
    {
      if (v7)
      {
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v27 = v9;
        do
        {
          uint64_t v28 = v13;
          printf("Channel %d:    \n", v13);
          uint64_t v14 = 0;
          uint64_t v29 = v12;
          do
          {
            uint64_t v15 = v7;
            uint64_t v16 = BaseAddress;
            do
            {
              _H0 = *(_WORD *)&v16[v12 * self->_rowBytes];
              __asm { FCVT            D0, H0 }
              printf("%f ", _D0);
              v16 += 2;
              --v15;
            }
            while (v15);
            putchar(10);
            ++v14;
            ++v12;
          }
          while (v14 != v8);
          putchar(10);
          uint64_t v13 = v28 + 1;
          uint64_t v12 = v29 + v8;
        }
        while (v28 + 1 != v27);
      }
      else
      {
        for (int i = 0; i != v9; ++i)
        {
          printf("Channel %d:    \n", i);
          int v25 = v8;
          do
          {
            putchar(10);
            --v25;
          }
          while (v25);
          putchar(10);
        }
      }
    }
    else
    {
      for (int j = 0; j != v9; ++j)
      {
        printf("Channel %d:    \n", j);
        putchar(10);
      }
    }
  }
  puts("\n");
  iosurface = self->_iosurface;

  IOSurfaceUnlock(iosurface, 0, 0);
}

- (void)print
{
  if ((self->_tensorDataType | 2) == 2) {
    [(MPSGraphTensorData *)self printNDArray];
  }
}

- (id)checkTensorData:(const float *)a3 nativeUlps:(float)a4 absoluteErr:(float)a5 PSNR:(float)a6
{
  uint64_t v10 = [(MPSGraphTensorData *)self mpsndarray];
  *(float *)&double v11 = a4;
  *(float *)&double v12 = a5;
  *(float *)&double v13 = a6;
  uint64_t v14 = [v10 checkNDArray:a3 nativeUlps:v11 absoluteErr:v12 PSNR:v13];

  return v14;
}

- (id)checkTensorData:(const float *)a3 nativeUlps:(float)a4 absoluteErr:(float)a5
{
  return -[MPSGraphTensorData checkTensorData:nativeUlps:absoluteErr:PSNR:](self, "checkTensorData:nativeUlps:absoluteErr:PSNR:", a3);
}

- (id)checkWithReferenceTensorData:(id)a3 nativeUlps:(float)a4 absoluteError:(float)a5 PSNR:(float)a6
{
  id v10 = a3;
  double v11 = [v10 mpsndarray];
  [v10 dataType];
  double v12 = [v10 shape];
  uint64_t v13 = [v12 count];
  if (v13)
  {
    uint64_t v14 = 0;
    size_t v15 = 1;
    do
    {
      uint64_t v16 = [v12 objectAtIndexedSubscript:v14];
      v15 *= [v16 unsignedIntValue];

      ++v14;
    }
    while (v13 != v14);
  }
  else
  {
    size_t v15 = 1;
  }
  int v17 = [v10 dataType];
  if (v17 == 285212736 || v17 == 285212704) {
    v15 *= 2;
  }
  objc_super v18 = (float32x4_t *)malloc_type_malloc(4 * v15, 0x1435DDE9uLL);
  int v19 = [v10 dataType];
  if (v19 > 268435487)
  {
    if (v19 <= 536870919)
    {
      switch(v19)
      {
        case 268435488:
          id v43 = v11;
          [v43 readBytes:v18 strideBytes:0];
          uint64_t v21 = (char *)malloc_type_malloc(4 * v15, 0x89876B49uLL);
          [v43 readBytes:v21 strideBytes:0];
          if (v15)
          {
            unint64_t v44 = 0;
            if (v15 < 8 || (unint64_t)((char *)v18 - v21) < 0x20) {
              goto LABEL_162;
            }
            uint64_t v45 = 0;
            unint64_t v44 = v15 & 0xFFFFFFFFFFFFFFF8;
            unint64_t v46 = v15 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              long long v47 = *(_OWORD *)&v21[v45 * 16 + 16];
              uint64_t v48 = (char *)&v18[v45];
              *(_OWORD *)uint64_t v48 = *(_OWORD *)&v21[v45 * 16];
              *((_OWORD *)v48 + 1) = v47;
              v45 += 2;
              v46 -= 8;
            }
            while (v46);
            while (v15 != v44)
            {
LABEL_162:
              v18->i32[v44] = *(_DWORD *)&v21[4 * v44];
              ++v44;
            }
          }
          break;
        case 285212704:
          id v62 = v11;
          uint64_t v21 = (char *)malloc_type_malloc(2 * v15, 0x89876B49uLL);
          [v62 readBytes:v21 strideBytes:0];
          if (v15)
          {
            if (v15 >= 0x10)
            {
              unint64_t v63 = v15 & 0xFFFFFFFFFFFFFFF0;
              v104 = (float16x4_t *)(v21 + 16);
              v105 = v18 + 2;
              unint64_t v106 = v15 & 0xFFFFFFFFFFFFFFF0;
              do
              {
                float16x8_t v107 = *(float16x8_t *)v104[-2].i8;
                float32x4_t v108 = vcvtq_f32_f16(*v104);
                float32x4_t v109 = vcvt_hight_f32_f16(*(float16x8_t *)v104->i8);
                v105[-2] = vcvtq_f32_f16(*(float16x4_t *)v107.i8);
                v105[-1] = vcvt_hight_f32_f16(v107);
                float32x4_t *v105 = v108;
                v105[1] = v109;
                v105 += 4;
                v104 += 4;
                v106 -= 16;
              }
              while (v106);
              goto LABEL_158;
            }
            unint64_t v63 = 0;
            do
            {
              _H0 = *(_WORD *)&v21[2 * v63];
              __asm { FCVT            S0, H0 }
              v18->i32[v63++] = _S0;
LABEL_158:
              ;
            }
            while (v15 != v63);
          }
          break;
        case 285212736:
          id v30 = v11;
          [v30 readBytes:v18 strideBytes:0];
          uint64_t v21 = (char *)malloc_type_malloc(4 * v15, 0x89876B49uLL);
          [v30 readBytes:v21 strideBytes:0];
          if (v15)
          {
            unint64_t v31 = 0;
            if (v15 < 8 || (unint64_t)((char *)v18 - v21) < 0x20) {
              goto LABEL_139;
            }
            uint64_t v32 = 0;
            unint64_t v31 = v15 & 0xFFFFFFFFFFFFFFF8;
            unint64_t v33 = v15 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              long long v34 = *(_OWORD *)&v21[v32 * 16 + 16];
              long long v35 = (char *)&v18[v32];
              *(_OWORD *)long long v35 = *(_OWORD *)&v21[v32 * 16];
              *((_OWORD *)v35 + 1) = v34;
              v32 += 2;
              v33 -= 8;
            }
            while (v33);
            while (v15 != v31)
            {
LABEL_139:
              v18->i32[v31] = *(_DWORD *)&v21[4 * v31];
              ++v31;
            }
          }
          break;
        default:
          goto LABEL_137;
      }
      goto LABEL_164;
    }
    if (v19 > 536870943)
    {
      if (v19 == 536870944)
      {
        id v57 = v11;
        uint64_t v21 = (char *)malloc_type_malloc(4 * v15, 0x89876B49uLL);
        [v57 readBytes:v21 strideBytes:0];
        if (v15)
        {
          if (v15 >= 8)
          {
            uint64_t v77 = 0;
            unint64_t v58 = v15 & 0xFFFFFFFFFFFFFFF8;
            unint64_t v78 = v15 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              float32x4_t v79 = vcvtq_f32_s32(*(int32x4_t *)&v21[v77 * 16 + 16]);
              v80 = &v18[v77];
              float32x4_t *v80 = vcvtq_f32_s32(*(int32x4_t *)&v21[v77 * 16]);
              v80[1] = v79;
              v77 += 2;
              v78 -= 8;
            }
            while (v78);
            goto LABEL_148;
          }
          unint64_t v58 = 0;
          do
          {
            v18->f32[v58] = (float)*(int *)&v21[4 * v58];
            ++v58;
LABEL_148:
            ;
          }
          while (v15 != v58);
        }
      }
      else
      {
        if (v19 != 536870976) {
          goto LABEL_137;
        }
        id v38 = v11;
        uint64_t v21 = (char *)malloc_type_malloc(8 * v15, 0x89876B49uLL);
        [v38 readBytes:v21 strideBytes:0];
        if (v15)
        {
          if (v15 >= 8)
          {
            unint64_t v39 = v15 & 0xFFFFFFFFFFFFFFF8;
            uint64_t v97 = (int64x2_t *)(v21 + 32);
            unint64_t v98 = v18 + 1;
            unint64_t v99 = v15 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              int64x2_t v101 = v97[-2];
              int64x2_t v100 = v97[-1];
              int64x2_t v103 = *v97;
              int64x2_t v102 = v97[1];
              v97 += 4;
              v98[-1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_s64(v101)), vcvtq_f64_s64(v100));
              *unint64_t v98 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_s64(v103)), vcvtq_f64_s64(v102));
              v98 += 2;
              v99 -= 8;
            }
            while (v99);
            goto LABEL_156;
          }
          unint64_t v39 = 0;
          do
          {
            v18->f32[v39] = (float)*(uint64_t *)&v21[8 * v39];
            ++v39;
LABEL_156:
            ;
          }
          while (v15 != v39);
        }
      }
      goto LABEL_164;
    }
    if (v19 != 536870920)
    {
      if (v19 != 536870928) {
        goto LABEL_137;
      }
      id v23 = v11;
      uint64_t v21 = (char *)malloc_type_malloc(2 * v15, 0x89876B49uLL);
      [v23 readBytes:v21 strideBytes:0];
      if (v15)
      {
        if (v15 >= 0x10)
        {
          unint64_t v25 = v15 & 0xFFFFFFFFFFFFFFF0;
          uint64_t v85 = (int16x4_t *)(v21 + 16);
          v86 = v18 + 2;
          unint64_t v87 = v15 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            int16x8_t v88 = *(int16x8_t *)v85[-2].i8;
            float32x4_t v89 = vcvtq_f32_s32(vmovl_s16(*v85));
            int32x4_t v90 = vmovl_high_s16(*(int16x8_t *)v85->i8);
            v86[-2] = vcvtq_f32_s32(vmovl_s16(*(int16x4_t *)v88.i8));
            v86[-1] = vcvtq_f32_s32(vmovl_high_s16(v88));
            float32x4_t v24 = vcvtq_f32_s32(v90);
            float32x4_t *v86 = v89;
            v86[1] = v24;
            v86 += 4;
            v85 += 4;
            v87 -= 16;
          }
          while (v87);
          goto LABEL_152;
        }
        unint64_t v25 = 0;
        do
        {
          v24.i16[0] = *(_WORD *)&v21[2 * v25];
          v24.i64[0] = vmovl_s16(*(int16x4_t *)v24.f32).u64[0];
          v24.f32[0] = (float)v24.i32[0];
          v18->i32[v25++] = v24.i32[0];
LABEL_152:
          ;
        }
        while (v15 != v25);
      }
      goto LABEL_164;
    }
    id v52 = v11;
    uint64_t v21 = (char *)malloc_type_malloc(v15, 0x89876B49uLL);
    [v52 readBytes:v21 strideBytes:0];
    if (!v15) {
      goto LABEL_164;
    }
    if (v15 < 8 || v18 < (float32x4_t *)&v21[v15] && v21 < &v18->i8[4 * v15])
    {
      unint64_t v54 = 0;
      do
      {
LABEL_145:
        v53.i8[0] = v21[v54];
        v53.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v53.f32)).u64[0];
        v53.f32[0] = (float)v53.i32[0];
        v18->i32[v54++] = v53.i32[0];
LABEL_144:
        ;
      }
      while (v15 != v54);
      goto LABEL_164;
    }
    if (v15 >= 0x10)
    {
      uint64_t v128 = 0;
      unint64_t v54 = v15 & 0xFFFFFFFFFFFFFFF0;
      v129 = v18;
      do
      {
        int8x16_t v130 = *(int8x16_t *)&v21[v128];
        int8x8_t v131 = (int8x8_t)vextq_s8(v130, v130, 8uLL).u64[0];
        float32x4_t v132 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v131, *(int8x8_t *)v130.i8), 8uLL), 8uLL)));
        float32x4_t v133 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v131, *(int8x8_t *)v130.i8), 8uLL), 8uLL)));
        float32x4_t v134 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v130.i8, *(int8x8_t *)v130.i8), 8uLL), 8uLL)));
        float32x4_t v53 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v130.i8, *(int8x8_t *)v130.i8), 8uLL), 8uLL)));
        float32x4_t *v129 = v134;
        v129[1] = v53;
        v129[2] = v132;
        v129[3] = v133;
        v128 += 16;
        v129 += 4;
      }
      while (v54 != v128);
      if (v15 == v54) {
        goto LABEL_164;
      }
      if ((v15 & 8) == 0) {
        goto LABEL_145;
      }
    }
    else
    {
      unint64_t v54 = 0;
    }
    unint64_t v114 = v54;
    unint64_t v54 = v15 & 0xFFFFFFFFFFFFFFF8;
    unint64_t v115 = (float32x4_t *)((char *)v18 + 4 * v114);
    do
    {
      int8x8_t v116 = *(int8x8_t *)&v21[v114];
      float32x4_t v117 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v116, v116), 8uLL), 8uLL)));
      float32x4_t v53 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v116, v116), 8uLL), 8uLL)));
      *unint64_t v115 = v117;
      v115[1] = v53;
      v115 += 2;
      v114 += 8;
    }
    while (v54 != v114);
    goto LABEL_144;
  }
  if (v19 <= 15)
  {
    if (v19 != -2147483640)
    {
      if (v19 == -1879048176)
      {
        id v59 = v11;
        uint64_t v21 = (char *)malloc_type_malloc(2 * v15, 0x89876B49uLL);
        [v59 readBytes:v21 strideBytes:0];
        if (v15)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            unint64_t v61 = &v18->i8[4 * i];
            *((_WORD *)v61 + 1) = *(_WORD *)&v21[2 * i];
            *(_WORD *)unint64_t v61 = 0;
          }
        }
        goto LABEL_164;
      }
      if (v19 != 8) {
        goto LABEL_137;
      }
      id v26 = v11;
      uint64_t v21 = (char *)malloc_type_malloc(v15, 0x89876B49uLL);
      [v26 readBytes:v21 strideBytes:0];
      if (!v15) {
        goto LABEL_164;
      }
      if (v15 < 8 || v18 < (float32x4_t *)&v21[v15] && v21 < &v18->i8[4 * v15])
      {
        unint64_t v29 = 0;
        do
        {
LABEL_161:
          LOBYTE(v27) = v21[v29];
          float v27 = (float)LODWORD(v27);
          v18->f32[v29++] = v27;
LABEL_160:
          ;
        }
        while (v15 != v29);
        goto LABEL_164;
      }
      if (v15 >= 0x10)
      {
        uint64_t v135 = 0;
        unint64_t v29 = v15 & 0xFFFFFFFFFFFFFFF0;
        float v27 = NAN;
        v28.i64[1] = 0xFFFFFF07FFFFFF06;
        v136 = v18;
        do
        {
          int8x16_t v137 = *(int8x16_t *)&v21[v135];
          v136[2] = vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v137, (int8x16_t)xmmword_181132980));
          v136[3] = vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v137, (int8x16_t)xmmword_181132970));
          float32x4_t *v136 = vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v137, (int8x16_t)xmmword_1811329A0));
          v136[1] = vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v137, (int8x16_t)xmmword_181132990));
          v136 += 4;
          v135 += 16;
        }
        while (v29 != v135);
        if (v15 == v29) {
          goto LABEL_164;
        }
        if ((v15 & 8) == 0) {
          goto LABEL_161;
        }
      }
      else
      {
        unint64_t v29 = 0;
      }
      unint64_t v118 = v29;
      unint64_t v29 = v15 & 0xFFFFFFFFFFFFFFF8;
      long long v119 = (float32x4_t *)((char *)v18 + 4 * v118);
      float v27 = NAN;
      do
      {
        v28.i64[0] = *(void *)&v21[v118];
        uint32x4_t v120 = (uint32x4_t)vqtbl1q_s8(v28, (int8x16_t)xmmword_181132990);
        int8x16_t v28 = (int8x16_t)vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v28, (int8x16_t)xmmword_1811329A0));
        *long long v119 = (float32x4_t)v28;
        v119[1] = vcvtq_f32_u32(v120);
        v119 += 2;
        v118 += 8;
      }
      while (v29 != v118);
      goto LABEL_160;
    }
    id v40 = v11;
    uint64_t v21 = (char *)malloc_type_malloc(v15, 0x89876B49uLL);
    [v40 readBytes:v21 strideBytes:0];
    if (!v15) {
      goto LABEL_164;
    }
    if (v15 < 8 || v18 < (float32x4_t *)&v21[v15] && v21 < &v18->i8[4 * v15])
    {
      unint64_t v42 = 0;
      do
      {
LABEL_141:
        v41.i8[0] = v21[v42];
        v41.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v41.f32)).u64[0];
        v41.f32[0] = (float)v41.i32[0];
        v18->i32[v42++] = v41.i32[0];
LABEL_140:
        ;
      }
      while (v15 != v42);
      goto LABEL_164;
    }
    if (v15 >= 0x10)
    {
      uint64_t v121 = 0;
      unint64_t v42 = v15 & 0xFFFFFFFFFFFFFFF0;
      uint64_t v122 = v18;
      do
      {
        int8x16_t v123 = *(int8x16_t *)&v21[v121];
        int8x8_t v124 = (int8x8_t)vextq_s8(v123, v123, 8uLL).u64[0];
        float32x4_t v125 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v124, *(int8x8_t *)v123.i8), 8uLL), 8uLL)));
        float32x4_t v126 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v124, *(int8x8_t *)v123.i8), 8uLL), 8uLL)));
        float32x4_t v127 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v123.i8, *(int8x8_t *)v123.i8), 8uLL), 8uLL)));
        float32x4_t v41 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v123.i8, *(int8x8_t *)v123.i8), 8uLL), 8uLL)));
        *uint64_t v122 = v127;
        v122[1] = v41;
        v122[2] = v125;
        v122[3] = v126;
        v121 += 16;
        v122 += 4;
      }
      while (v42 != v121);
      if (v15 == v42) {
        goto LABEL_164;
      }
      if ((v15 & 8) == 0) {
        goto LABEL_141;
      }
    }
    else
    {
      unint64_t v42 = 0;
    }
    unint64_t v110 = v42;
    unint64_t v42 = v15 & 0xFFFFFFFFFFFFFFF8;
    v111 = (float32x4_t *)((char *)v18 + 4 * v110);
    do
    {
      int8x8_t v112 = *(int8x8_t *)&v21[v110];
      float32x4_t v113 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v112, v112), 8uLL), 8uLL)));
      float32x4_t v41 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v112, v112), 8uLL), 8uLL)));
      float32x4_t *v111 = v113;
      v111[1] = v41;
      v111 += 2;
      v110 += 8;
    }
    while (v42 != v110);
    goto LABEL_140;
  }
  if (v19 > 63)
  {
    if (v19 == 64)
    {
      id v55 = v11;
      uint64_t v21 = (char *)malloc_type_malloc(8 * v15, 0x89876B49uLL);
      [v55 readBytes:v21 strideBytes:0];
      if (v15)
      {
        if (v15 >= 8)
        {
          unint64_t v56 = v15 & 0xFFFFFFFFFFFFFFF8;
          long long v70 = (uint64x2_t *)(v21 + 32);
          long long v71 = v18 + 1;
          unint64_t v72 = v15 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            uint64x2_t v74 = v70[-2];
            uint64x2_t v73 = v70[-1];
            uint64x2_t v76 = *v70;
            uint64x2_t v75 = v70[1];
            v70 += 4;
            v71[-1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(v74)), vcvtq_f64_u64(v73));
            *long long v71 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(v76)), vcvtq_f64_u64(v75));
            v71 += 2;
            v72 -= 8;
          }
          while (v72);
          goto LABEL_146;
        }
        unint64_t v56 = 0;
        do
        {
          v18->f32[v56] = (float)*(unint64_t *)&v21[8 * v56];
          ++v56;
LABEL_146:
          ;
        }
        while (v15 != v56);
      }
    }
    else
    {
      if (v19 != 268435472) {
        goto LABEL_137;
      }
      id v36 = v11;
      uint64_t v21 = (char *)malloc_type_malloc(2 * v15, 0x89876B49uLL);
      [v36 readBytes:v21 strideBytes:0];
      if (v15)
      {
        if (v15 >= 0x10)
        {
          unint64_t v37 = v15 & 0xFFFFFFFFFFFFFFF0;
          uint64_t v91 = (float16x4_t *)(v21 + 16);
          v92 = v18 + 2;
          unint64_t v93 = v15 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            float16x8_t v94 = *(float16x8_t *)v91[-2].i8;
            float32x4_t v95 = vcvtq_f32_f16(*v91);
            float32x4_t v96 = vcvt_hight_f32_f16(*(float16x8_t *)v91->i8);
            v92[-2] = vcvtq_f32_f16(*(float16x4_t *)v94.i8);
            v92[-1] = vcvt_hight_f32_f16(v94);
            float32x4_t *v92 = v95;
            v92[1] = v96;
            v92 += 4;
            v91 += 4;
            v93 -= 16;
          }
          while (v93);
          goto LABEL_154;
        }
        unint64_t v37 = 0;
        do
        {
          _H0 = *(_WORD *)&v21[2 * v37];
          __asm { FCVT            S0, H0 }
          v18->i32[v37++] = _S0;
LABEL_154:
          ;
        }
        while (v15 != v37);
      }
    }
  }
  else
  {
    if (v19 != 16)
    {
      if (v19 == 32)
      {
        id v20 = v11;
        uint64_t v21 = (char *)malloc_type_malloc(4 * v15, 0x89876B49uLL);
        [v20 readBytes:v21 strideBytes:0];
        if (v15)
        {
          if (v15 >= 8)
          {
            uint64_t v81 = 0;
            unint64_t v22 = v15 & 0xFFFFFFFFFFFFFFF8;
            unint64_t v82 = v15 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              float32x4_t v83 = vcvtq_f32_u32(*(uint32x4_t *)&v21[v81 * 16 + 16]);
              v84 = &v18[v81];
              float32x4_t *v84 = vcvtq_f32_u32(*(uint32x4_t *)&v21[v81 * 16]);
              v84[1] = v83;
              v81 += 2;
              v82 -= 8;
            }
            while (v82);
            goto LABEL_150;
          }
          unint64_t v22 = 0;
          do
          {
            v18->f32[v22] = (float)*(unsigned int *)&v21[4 * v22];
            ++v22;
LABEL_150:
            ;
          }
          while (v15 != v22);
        }
        goto LABEL_164;
      }
LABEL_137:
      __assert_rtn("-[MPSGraphTensorData checkWithReferenceTensorData:nativeUlps:absoluteError:PSNR:]", "MPSGraphTensorData.mm", 882, "0 && \"unsupported datatype\"");
    }
    id v49 = v11;
    uint64_t v21 = (char *)malloc_type_malloc(2 * v15, 0x89876B49uLL);
    [v49 readBytes:v21 strideBytes:0];
    if (v15)
    {
      if (v15 >= 0x10)
      {
        unint64_t v51 = v15 & 0xFFFFFFFFFFFFFFF0;
        uint64_t v64 = (uint16x4_t *)(v21 + 16);
        unint64_t v65 = v18 + 2;
        unint64_t v66 = v15 & 0xFFFFFFFFFFFFFFF0;
        do
        {
          uint16x8_t v67 = *(uint16x8_t *)v64[-2].i8;
          float32x4_t v68 = vcvtq_f32_u32(vmovl_u16(*v64));
          uint32x4_t v69 = vmovl_high_u16(*(uint16x8_t *)v64->i8);
          v65[-2] = vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v67.i8));
          v65[-1] = vcvtq_f32_u32(vmovl_high_u16(v67));
          float32x4_t v50 = vcvtq_f32_u32(v69);
          *unint64_t v65 = v68;
          v65[1] = v50;
          v65 += 4;
          v64 += 4;
          v66 -= 16;
        }
        while (v66);
        goto LABEL_142;
      }
      unint64_t v51 = 0;
      do
      {
        v50.i16[0] = *(_WORD *)&v21[2 * v51];
        v50.f32[0] = (float)v50.u32[0];
        v18->i32[v51++] = v50.i32[0];
LABEL_142:
        ;
      }
      while (v15 != v51);
    }
  }
LABEL_164:
  free(v21);

  *(float *)&double v146 = a4;
  *(float *)&double v147 = a5;
  *(float *)&double v148 = a6;
  v149 = [(MPSGraphTensorData *)self checkTensorData:v18 nativeUlps:v146 absoluteErr:v147 PSNR:v148];
  free(v18);

  return v149;
}

- (int64_t)tensorDataType
{
  return self->_tensorDataType;
}

- (MPSDataType)dataType
{
  return self->_dataType;
}

- (MPSGraphDevice)device
{
  return self->_device;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_mpsimagebatch, 0);

  objc_storeStrong((id *)&self->_mpsndarray, 0);
}

@end