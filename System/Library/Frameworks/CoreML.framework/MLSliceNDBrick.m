@interface MLSliceNDBrick
- (BOOL)hasGPUSupport;
- (BOOL)shapeInfoNeeded;
- (MLSliceNDBrick)initWithParameters:(id)a3;
- (NSArray)begin_ids;
- (NSArray)begin_masks;
- (NSArray)end_ids;
- (NSArray)end_masks;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (NSArray)strides;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (int)rank;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLSliceNDBrick

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputShapes, 0);
  objc_storeStrong((id *)&self->_inputShapes, 0);
  objc_storeStrong((id *)&self->_outputRanks, 0);
  objc_storeStrong((id *)&self->_inputRanks, 0);
  objc_storeStrong((id *)&self->_strides, 0);
  objc_storeStrong((id *)&self->_end_masks, 0);
  objc_storeStrong((id *)&self->_end_ids, 0);
  objc_storeStrong((id *)&self->_begin_masks, 0);

  objc_storeStrong((id *)&self->_begin_ids, 0);
}

- (NSArray)outputShapes
{
  return self->_outputShapes;
}

- (NSArray)inputShapes
{
  return self->_inputShapes;
}

- (NSArray)outputRanks
{
  return self->_outputRanks;
}

- (NSArray)inputRanks
{
  return self->_inputRanks;
}

- (NSArray)strides
{
  return self->_strides;
}

- (NSArray)end_masks
{
  return self->_end_masks;
}

- (NSArray)end_ids
{
  return self->_end_ids;
}

- (NSArray)begin_masks
{
  return self->_begin_masks;
}

- (NSArray)begin_ids
{
  return self->_begin_ids;
}

- (BOOL)shapeInfoNeeded
{
  return self->_shapeInfoNeeded;
}

- (int)rank
{
  return self->_rank;
}

- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v75 = v6;
  v8 = [v6 objectAtIndexedSubscript:0];
  [v8 rawPointer];

  v9 = [v7 objectAtIndexedSubscript:0];
  [v9 rawPointer];

  unint64_t rank = self->_rank;
  std::vector<long long>::vector(&v96, rank);
  std::vector<long long>::vector(&v94, rank);
  std::vector<BOOL>::vector(v93, rank);
  std::vector<BOOL>::vector(v92, rank);
  v74 = v7;
  std::vector<long long>::vector(v91, rank);
  if (rank)
  {
    for (unint64_t i = 0; i != rank; ++i)
    {
      v12 = [(NSArray *)self->_begin_ids objectAtIndexedSubscript:i];
      uint64_t v13 = [v12 integerValue];
      *((void *)v96 + i) = v13;

      v14 = [(NSArray *)self->_end_ids objectAtIndexedSubscript:i];
      uint64_t v15 = [v14 integerValue];
      *((void *)v94 + i) = v15;

      v16 = [(NSArray *)self->_begin_masks objectAtIndexedSubscript:i];
      unint64_t v17 = i >> 6;
      uint64_t v18 = 1 << i;
      if ([v16 BOOLValue]) {
        uint64_t v19 = *((void *)v93[0] + v17) | v18;
      }
      else {
        uint64_t v19 = *((void *)v93[0] + v17) & ~v18;
      }
      *((void *)v93[0] + v17) = v19;

      v20 = [(NSArray *)self->_end_masks objectAtIndexedSubscript:i];
      if ([v20 BOOLValue]) {
        uint64_t v21 = *((void *)v92[0] + v17) | v18;
      }
      else {
        uint64_t v21 = *((void *)v92[0] + v17) & ~v18;
      }
      *((void *)v92[0] + v17) = v21;

      v22 = [(NSArray *)self->_strides objectAtIndexedSubscript:i];
      uint64_t v23 = [v22 integerValue];
      *((void *)v91[0] + i) = v23;
    }
  }
  std::vector<unsigned long>::vector(&v89, rank);
  std::vector<unsigned long>::vector(&v87, rank);
  if (self->_shapeInfoNeeded)
  {
    v24 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v24, &v89);
  }
  else
  {
    v24 = [v6 objectAtIndexedSubscript:0];
    v25 = [v24 shape];
    EspressoBrickUtils::EspressoShape_to_NDShape(v25, (uint64_t)&v89);
  }
  v84 = 0;
  uint64_t v85 = 0;
  uint64_t v86 = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&v84, v96, (uint64_t)v97, (v97 - (unsigned char *)v96) >> 3);
  v81 = 0;
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&v81, v94, (uint64_t)v95, (v95 - (unsigned char *)v94) >> 3);
  v114 = 0;
  uint64_t v115 = 0;
  v113 = 0;
  v26 = v84;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&v113, v84, v85, (v85 - (uint64_t)v84) >> 3);
  v110 = 0;
  v111 = 0;
  uint64_t v112 = 0;
  v27 = v81;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&v110, v81, v82, (v82 - (uint64_t)v81) >> 3);
  BrickLayers::SliceNDShapeComputation((uint64_t)&v113, (uint64_t)&v110, (uint64_t)v91, (uint64_t *)v93, (uint64_t *)v92, (uint64_t *)&v89, (void **)&v87);
  if (v110)
  {
    v111 = v110;
    operator delete(v110);
  }
  if (v113)
  {
    v114 = v113;
    operator delete(v113);
  }
  uint64_t v109 = 0;
  v79 = v89;
  v80 = v90;
  unint64_t v28 = ((unsigned char *)v90 - (unsigned char *)v89) >> 3;
  std::vector<unsigned long>::vector(&v107, v28);
  std::vector<unsigned long>::vector(&v105, v28);
  std::vector<unsigned long>::vector(&v103, v28);
  std::vector<unsigned long>::vector(&v101, v28);
  if (v80 == v79) {
    goto LABEL_42;
  }
  unint64_t v29 = 0;
  v30 = (char *)v93[0];
  v31 = (uint64_t *)v91[0];
  v32 = (int *)v89;
  if (v28 <= 1) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = v28;
  }
  do
  {
    if ((*(void *)&v30[(v29 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v29))
    {
      if (v31[v29] <= 0) {
        uint64_t v34 = *(void *)&v32[2 * v29] - 1;
      }
      else {
        LODWORD(v34) = 0;
      }
      uint64_t v34 = (int)v34;
    }
    else
    {
      uint64_t v34 = v26[v29];
      if ((v34 & 0x8000000000000000) == 0) {
        goto LABEL_29;
      }
      v34 += v32[2 * v29];
    }
    v26[v29] = v34;
    if (v34 < 0) {
      goto LABEL_102;
    }
LABEL_29:
    if (v34 >= v32[2 * v29])
    {
LABEL_102:
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x19F3C1380](exception, "SliceND layer: Invalid values in begin_ids.");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    ++v29;
  }
  while (v33 != v29);
  unint64_t v35 = 0;
  v36 = (char *)v92[0];
  v37 = (uint64_t *)v91[0];
  v38 = (int *)v89;
  do
  {
    if ((*(void *)&v36[(v35 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v35))
    {
      if (v37[v35] < 1) {
        LODWORD(v39) = -1;
      }
      else {
        uint64_t v39 = *(void *)&v38[2 * v35];
      }
      uint64_t v39 = (int)v39;
      v27[v35] = (int)v39;
    }
    else
    {
      uint64_t v39 = v27[v35];
      if (v39 < 0)
      {
        v39 += v38[2 * v35];
        v27[v35] = v39;
        if (v39 < 0)
        {
LABEL_103:
          v72 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x19F3C1380](v72, "SliceND layer: Invalid values in end_ids.");
          __cxa_throw(v72, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
      }
    }
    if (v39 > v38[2 * v35]) {
      goto LABEL_103;
    }
    ++v35;
  }
  while (v33 != v35);
LABEL_42:
  v40 = v87;
  if (v87 == v88)
  {
    v42 = v87;
  }
  else
  {
    v41 = (char *)v87 + 8;
    v42 = v87;
    if ((char *)v87 + 8 != (char *)v88)
    {
      unint64_t v43 = *(void *)v87;
      v42 = v87;
      v44 = (char *)v87 + 8;
      do
      {
        unint64_t v46 = *(void *)v44;
        v44 += 8;
        unint64_t v45 = v46;
        BOOL v47 = v43 >= v46;
        if (v43 <= v46) {
          unint64_t v43 = v45;
        }
        if (!v47) {
          v42 = v41;
        }
        v41 = v44;
      }
      while (v44 != (char *)v88);
    }
  }
  uint64_t v48 = 1;
  if (v87 != v88)
  {
    v49 = (uint64_t *)v87;
    do
    {
      uint64_t v50 = *v49++;
      v48 *= v50;
    }
    while (v49 != v88);
  }
  uint64_t v78 = v48;
  v73 = v27;
  TensorAlgebraUtils::computeStrides((uint64_t)v89, (uint64_t)v90, (uint64_t)v107, (uint64_t)v108);
  TensorAlgebraUtils::computeStrides((uint64_t)v87, (uint64_t)v88, (uint64_t)v105, v106);
  unint64_t v51 = v78;
  if (v78)
  {
    unint64_t v52 = 0;
    uint64_t v53 = (v42 - v40) >> 3;
    v76 = v42;
    if (v28 <= 1) {
      uint64_t v54 = 1;
    }
    else {
      uint64_t v54 = v28;
    }
    v55 = v105;
    v77 = v40;
    do
    {
      if (v55[v53])
      {
        unint64_t v56 = 0;
        do
        {
          TensorAlgebraUtils::unravel_index(v56 + v52, (uint64_t)v87, (uint64_t)v88, v101, (uint64_t)v102);
          if (v80 != v79)
          {
            v57 = v101;
            v58 = (uint64_t *)v91[0];
            v59 = (uint64_t *)v89;
            v60 = v26;
            uint64_t v61 = v54;
            v62 = v103;
            do
            {
              uint64_t v64 = *v57++;
              uint64_t v63 = v64;
              uint64_t v66 = *v58++;
              uint64_t v65 = v66;
              uint64_t v67 = *v60++;
              uint64_t v68 = v67 + v65 * v63;
              if (v68 < 0 || v68 >= *v59)
              {
                v70 = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x19F3C1380](v70, "SliceND layer: Invalid values in arguments (begin_ids, end_ids, strides)");
                __cxa_throw(v70, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
              }
              *v62++ = v68;
              ++v59;
              --v61;
            }
            while (v61);
          }
          __p = 0;
          v99 = 0;
          uint64_t v100 = 0;
          std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v107, (uint64_t)v108, (v108 - (unsigned char *)v107) >> 3);
          TensorAlgebraUtils::ravel_multi_index(v103, (uint64_t)v104, (uint64_t)v89, (uint64_t)v90, (uint64_t *)__p, &v109);
          if (__p)
          {
            v99 = __p;
            operator delete(__p);
          }
          cblas_scopy_NEWLAPACK();
          ++v56;
          v55 = v105;
        }
        while (v56 < v105[v53]);
        v42 = v76;
        v40 = v77;
        unint64_t v51 = v78;
      }
      unint64_t v69 = v51;
      if (v42 != v40) {
        unint64_t v69 = v55[v53 - 1];
      }
      v52 += v69;
    }
    while (v52 < v51);
  }
  if (v101)
  {
    v102 = v101;
    operator delete(v101);
  }
  if (v103)
  {
    v104 = v103;
    operator delete(v103);
  }
  if (v105)
  {
    uint64_t v106 = (uint64_t)v105;
    operator delete(v105);
  }
  if (v107)
  {
    v108 = v107;
    operator delete(v107);
  }
  if (v73) {
    operator delete(v73);
  }
  if (v26) {
    operator delete(v26);
  }
  if (v87)
  {
    v88 = v87;
    operator delete(v87);
  }
  if (v89)
  {
    v90 = v89;
    operator delete(v89);
  }
  if (v91[0])
  {
    v91[1] = v91[0];
    operator delete(v91[0]);
  }
  if (v92[0]) {
    operator delete(v92[0]);
  }
  if (v93[0]) {
    operator delete(v93[0]);
  }
  if (v94)
  {
    v95 = v94;
    operator delete(v94);
  }
  if (v96)
  {
    v97 = v96;
    operator delete(v96);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLSliceNDBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MLSliceNDBrick;
  v5 = [(MLSliceNDBrick *)&v33 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"begin_ids"];
    begin_ids = v5->_begin_ids;
    v5->_begin_ids = (NSArray *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"begin_masks"];
    begin_masks = v5->_begin_masks;
    v5->_begin_masks = (NSArray *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"end_ids"];
    end_ids = v5->_end_ids;
    v5->_end_ids = (NSArray *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"end_masks"];
    end_masks = v5->_end_masks;
    v5->_end_masks = (NSArray *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"strides"];
    strides = v5->_strides;
    v5->_strides = (NSArray *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"inputRanks"];
    inputRanks = v5->_inputRanks;
    v5->_inputRanks = (NSArray *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"outputRanks"];
    outputRanks = v5->_outputRanks;
    v5->_outputRanks = (NSArray *)v18;

    uint64_t v20 = [v4 objectForKeyedSubscript:@"inputShapes"];
    inputShapes = v5->_inputShapes;
    v5->_inputShapes = (NSArray *)v20;

    uint64_t v22 = [v4 objectForKeyedSubscript:@"outputShapes"];
    outputShapes = v5->_outputShapes;
    v5->_outputShapes = (NSArray *)v22;

    v5->_shapeInfoNeeded = 0;
    v24 = v5->_inputRanks;
    if (v24)
    {
      for (unsigned int i = 0; [(NSArray *)v24 count] > i; ++i)
      {
        v26 = [(NSArray *)v5->_inputRanks objectAtIndexedSubscript:i];
        uint64_t v27 = [v26 integerValue];

        if (v27 >= 6) {
          v5->_shapeInfoNeeded = 1;
        }
        v24 = v5->_inputRanks;
      }
    }
    unint64_t v28 = v5->_outputRanks;
    if (v28)
    {
      for (unsigned int j = 0; [(NSArray *)v28 count] > j; ++j)
      {
        v30 = [(NSArray *)v5->_outputRanks objectAtIndexedSubscript:j];
        uint64_t v31 = [v30 integerValue];

        if (v31 >= 6) {
          v5->_shapeInfoNeeded = 1;
        }
        unint64_t v28 = v5->_outputRanks;
      }
    }
    v5->_unint64_t rank = [(NSArray *)v5->_begin_ids count];
  }

  return v5;
}

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F611E8]);
  LODWORD(a4) = self->_rank;
  uint64_t v10 = [v6 objectAtIndexedSubscript:0];
  int v11 = [v10 rank];

  if (a4 != v11)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3C1380](exception, "SliceND layer: mismatch between rank of the input and the length of 'begin ids' parameter");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  std::vector<unsigned long>::vector(v41, self->_rank);
  if (self->_shapeInfoNeeded)
  {
    uint64_t v12 = [(NSArray *)self->_outputShapes objectAtIndexedSubscript:0];
    EspressoBrickUtils::NSShape_to_VecShape(v12, v41);
  }
  else
  {
    unint64_t rank = self->_rank;
    id v30 = v7;
    std::vector<unsigned long>::vector(v40, rank);
    std::vector<long long>::vector(&v38, rank);
    std::vector<long long>::vector(&v36, rank);
    std::vector<BOOL>::vector(v35, rank);
    std::vector<BOOL>::vector(v34, rank);
    std::vector<long long>::vector(v33, rank);
    uint64_t v14 = [v6 objectAtIndexedSubscript:0];
    EspressoBrickUtils::EspressoShape_to_NDShape(v14, (uint64_t)v40);

    if (rank)
    {
      for (unint64_t i = 0; i != rank; ++i)
      {
        uint64_t v16 = [(NSArray *)self->_begin_ids objectAtIndexedSubscript:i];
        uint64_t v17 = [v16 integerValue];
        *((void *)v38 + i) = v17;

        uint64_t v18 = [(NSArray *)self->_end_ids objectAtIndexedSubscript:i];
        uint64_t v19 = [v18 integerValue];
        *((void *)v36 + i) = v19;

        uint64_t v20 = [(NSArray *)self->_begin_masks objectAtIndexedSubscript:i];
        unint64_t v21 = i >> 6;
        uint64_t v22 = 1 << i;
        if ([v20 BOOLValue]) {
          uint64_t v23 = *((void *)v35[0] + v21) | v22;
        }
        else {
          uint64_t v23 = *((void *)v35[0] + v21) & ~v22;
        }
        *((void *)v35[0] + v21) = v23;

        v24 = [(NSArray *)self->_end_masks objectAtIndexedSubscript:i];
        if ([v24 BOOLValue]) {
          uint64_t v25 = *((void *)v34[0] + v21) | v22;
        }
        else {
          uint64_t v25 = *((void *)v34[0] + v21) & ~v22;
        }
        *((void *)v34[0] + v21) = v25;

        v26 = [(NSArray *)self->_strides objectAtIndexedSubscript:i];
        uint64_t v27 = [v26 integerValue];
        *((void *)v33[0] + i) = v27;
      }
    }
    memset(v32, 0, sizeof(v32));
    id v7 = v30;
    std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(v32, v38, (uint64_t)v39, (v39 - (unsigned char *)v38) >> 3);
    memset(__p, 0, sizeof(__p));
    std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(__p, v36, (uint64_t)v37, (v37 - (unsigned char *)v36) >> 3);
    BrickLayers::SliceNDShapeComputation((uint64_t)v32, (uint64_t)__p, (uint64_t)v33, (uint64_t *)v35, (uint64_t *)v34, (uint64_t *)v40, v41);
    if (__p[0]) {
      operator delete(__p[0]);
    }
    if (v32[0]) {
      operator delete(v32[0]);
    }
    if (v33[0])
    {
      v33[1] = v33[0];
      operator delete(v33[0]);
    }
    if (v34[0]) {
      operator delete(v34[0]);
    }
    if (v35[0]) {
      operator delete(v35[0]);
    }
    if (v36)
    {
      v37 = v36;
      operator delete(v36);
    }
    if (v38)
    {
      uint64_t v39 = v38;
      operator delete(v38);
    }
    if (v40[0])
    {
      v40[1] = v40[0];
      operator delete(v40[0]);
    }
  }
  EspressoBrickUtils::NDShape_to_EspressoShape(v41, v9);
  [v8 addObject:v9];
  if (v41[0])
  {
    v41[1] = v41[0];
    operator delete(v41[0]);
  }

  return v8;
}

@end