@interface MLTransposeBrick
- (BOOL)hasGPUSupport;
- (MLTransposeBrick)initWithParameters:(id)a3;
- (NSArray)axes;
- (NSArray)inputRanks;
- (NSArray)inputShapes;
- (NSArray)outputRanks;
- (NSArray)outputShapes;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLTransposeBrick

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputShapes, 0);
  objc_storeStrong((id *)&self->_inputShapes, 0);
  objc_storeStrong((id *)&self->_outputRanks, 0);
  objc_storeStrong((id *)&self->_inputRanks, 0);

  objc_storeStrong((id *)&self->_axes, 0);
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

- (NSArray)axes
{
  return self->_axes;
}

- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4
{
  id v65 = a3;
  id v6 = a4;
  v7 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
  unint64_t v8 = [v7 unsignedIntegerValue];

  v9 = [v65 objectAtIndexedSubscript:0];
  [v9 rawPointer];

  v10 = [v6 objectAtIndexedSubscript:0];
  [v10 rawPointer];

  v11 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v70, [v11 unsignedIntegerValue]);

  v12 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v68, [v12 unsignedIntegerValue]);

  v13 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v66, [v13 unsignedIntegerValue]);

  for (unsigned int i = 0; ; ++i)
  {
    v15 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
    unint64_t v16 = [v15 unsignedIntegerValue];

    if (v16 <= i) {
      break;
    }
    v17 = [(NSArray *)self->_axes objectAtIndexedSubscript:i];
    uint64_t v18 = [v17 unsignedIntegerValue];
    *((void *)v70 + i) = v18;
  }
  v19 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
  if ([v19 integerValue] > 5)
  {

LABEL_51:
    for (unsigned int j = 0; ; ++j)
    {
      v58 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
      unint64_t v59 = [v58 unsignedIntegerValue];

      if (v59 <= j) {
        break;
      }
      v60 = [(NSArray *)self->_inputShapes objectAtIndexedSubscript:0];
      v61 = [v60 objectAtIndexedSubscript:j];
      uint64_t v62 = [v61 unsignedIntegerValue];
      *((void *)v68 + j) = v62;
    }
    goto LABEL_12;
  }
  v20 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  uint64_t v21 = [v20 integerValue];

  if (v21 > 5) {
    goto LABEL_51;
  }
  if (v8)
  {
    v22 = [v65 objectAtIndexedSubscript:0];
    v23 = [v22 shape];
    int v24 = [v23 width];
    *((void *)v68 + v8 - 1) = v24;

    if (v8 >= 2)
    {
      v25 = [v65 objectAtIndexedSubscript:0];
      v26 = [v25 shape];
      int v27 = [v26 height];
      *((void *)v68 + v8 - 2) = v27;

      if (v8 >= 3)
      {
        v28 = [v65 objectAtIndexedSubscript:0];
        v29 = [v28 shape];
        int v30 = [v29 channels];
        *((void *)v68 + v8 - 3) = v30;

        if (v8 >= 4)
        {
          v31 = [v65 objectAtIndexedSubscript:0];
          v32 = [v31 shape];
          int v33 = [v32 batch];
          *((void *)v68 + v8 - 4) = v33;

          if (v8 == 5)
          {
            v34 = [v65 objectAtIndexedSubscript:0];
            v35 = [v34 shape];
            int v36 = [v35 sequence];
            *(void *)v68 = v36;
          }
        }
      }
    }
  }
LABEL_12:
  v38 = v70;
  v37 = v71;
  unint64_t v39 = ((unsigned char *)v71 - (unsigned char *)v70) >> 3;
  uint64_t v84 = 0;
  std::vector<unsigned long>::vector(&v82, v39);
  std::vector<unsigned long>::vector(&v80, v39);
  std::vector<unsigned long>::vector(&v78, v39);
  v75 = 0;
  v76 = 0;
  uint64_t v77 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v75, v70, (uint64_t)v71, ((unsigned char *)v71 - (unsigned char *)v70) >> 3);
  if (v39 != ((char *)v69 - (unsigned char *)v68) >> 3 || v39 != (v67 - (unsigned char *)v66) >> 3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3C1380](exception, "Mismatch between rank of input/output tensors and the length of axes.");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>();
  v40 = (uint64_t *)v68;
  if (v37 != v38)
  {
    uint64_t v41 = 0;
    if (v39 <= 1) {
      uint64_t v42 = 1;
    }
    else {
      uint64_t v42 = v39;
    }
    while (v41 == *((void *)v75 + v41))
    {
      if (!*((void *)v68 + v41))
      {
        v63 = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x19F3C1380](v63, "Invalid input shape");
        goto LABEL_56;
      }
      if (v42 == ++v41)
      {
        v43 = (uint64_t *)v70;
        v44 = v66;
        do
        {
          uint64_t v45 = *v43++;
          *v44++ = v40[v45];
          --v42;
        }
        while (v42);
        goto LABEL_23;
      }
    }
    v63 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3C1380](v63, "Invalid axes argument");
LABEL_56:
    __cxa_throw(v63, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
LABEL_23:
  unint64_t v46 = 1;
  while (v40 != v69)
  {
    uint64_t v47 = *v40++;
    v46 *= v47;
  }
  TensorAlgebraUtils::computeStrides((uint64_t)v68, (uint64_t)v69, (uint64_t)v82, (uint64_t)v83);
  if (v46)
  {
    unint64_t v48 = 0;
    uint64_t v49 = *((void *)v66 + v39 - 1);
    if (v39 <= 1) {
      unint64_t v39 = 1;
    }
    do
    {
      TensorAlgebraUtils::unravel_index(v48, (uint64_t)v66, (uint64_t)v67, (unint64_t *)v78, (uint64_t)v79);
      if (v37 != v38)
      {
        v50 = (uint64_t *)v78;
        v51 = (uint64_t *)v70;
        unint64_t v52 = v39;
        v53 = v80;
        do
        {
          uint64_t v55 = *v50++;
          uint64_t v54 = v55;
          uint64_t v56 = *v51++;
          v53[v56] = v54;
          --v52;
        }
        while (v52);
      }
      __p = 0;
      v73 = 0;
      uint64_t v74 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v82, (uint64_t)v83, (v83 - (unsigned char *)v82) >> 3);
      TensorAlgebraUtils::ravel_multi_index(v80, (uint64_t)v81, (uint64_t)v68, (uint64_t)v69, (uint64_t *)__p, &v84);
      if (__p)
      {
        v73 = __p;
        operator delete(__p);
      }
      cblas_scopy_NEWLAPACK();
      v48 += v49;
    }
    while (v48 < v46);
  }
  if (v75)
  {
    v76 = v75;
    operator delete(v75);
  }
  if (v78)
  {
    v79 = v78;
    operator delete(v78);
  }
  if (v80)
  {
    v81 = v80;
    operator delete(v80);
  }
  if (v82)
  {
    v83 = v82;
    operator delete(v82);
  }
  if (v66)
  {
    v67 = v66;
    operator delete(v66);
  }
  if (v68)
  {
    v69 = (uint64_t *)v68;
    operator delete(v68);
  }
  if (v70)
  {
    v71 = v70;
    operator delete(v70);
  }
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLTransposeBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MLTransposeBrick;
  v5 = [(MLTransposeBrick *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"inputRanks"];
    inputRanks = v5->_inputRanks;
    v5->_inputRanks = (NSArray *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"outputRanks"];
    outputRanks = v5->_outputRanks;
    v5->_outputRanks = (NSArray *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"inputShapes"];
    inputShapes = v5->_inputShapes;
    v5->_inputShapes = (NSArray *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"outputShapes"];
    outputShapes = v5->_outputShapes;
    v5->_outputShapes = (NSArray *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"axes"];
    axes = v5->_axes;
    v5->_axes = (NSArray *)v14;
  }
  return v5;
}

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F611E8]);
  uint64_t v10 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
  if ([v10 integerValue] >= 6)
  {
  }
  else
  {
    v11 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
    uint64_t v12 = [v11 integerValue];

    if (v12 < 6)
    {
      v13 = [(NSArray *)self->_inputRanks objectAtIndexedSubscript:0];
      unint64_t v14 = [v13 unsignedIntegerValue];

      std::vector<int>::vector(&v47, 5uLL);
      v15 = [v6 objectAtIndexedSubscript:0];
      int v16 = [v15 width];
      *v47.__begin_ = v16;

      objc_super v17 = [v6 objectAtIndexedSubscript:0];
      int v18 = [v17 height];
      v47.__begin_[1] = v18;

      v19 = [v6 objectAtIndexedSubscript:0];
      int v20 = [v19 channels];
      v47.__begin_[2] = v20;

      uint64_t v21 = [v6 objectAtIndexedSubscript:0];
      int v22 = [v21 batch];
      v47.__begin_[3] = v22;

      v23 = [v6 objectAtIndexedSubscript:0];
      int v24 = [v23 sequence];
      v47.__begin_[4] = v24;

      [v9 setSequence:1];
      [v9 setBatch:1];
      [v9 setChannels:1];
      [v9 setHeight:1];
      [v9 setWidth:1];
      if (v14)
      {
        v25 = [(NSArray *)self->_axes objectAtIndexedSubscript:v14 - 1];
        uint64_t v26 = [v25 unsignedIntegerValue];
        [v9 setWidth:v47.__begin_[v14 + ~v26]];

        if (v14 >= 2)
        {
          int v27 = [(NSArray *)self->_axes objectAtIndexedSubscript:v14 - 2];
          uint64_t v28 = [v27 unsignedIntegerValue];
          [v9 setHeight:v47.__begin_[v14 + ~v28]];

          if (v14 >= 3)
          {
            v29 = [(NSArray *)self->_axes objectAtIndexedSubscript:v14 - 3];
            uint64_t v30 = [v29 unsignedIntegerValue];
            [v9 setChannels:v47.__begin_[v14 + ~v30]];

            if (v14 >= 4)
            {
              v31 = [(NSArray *)self->_axes objectAtIndexedSubscript:v14 - 4];
              uint64_t v32 = [v31 unsignedIntegerValue];
              [v9 setBatch:v47.__begin_[v14 + ~v32]];

              if (v14 == 5)
              {
                int v33 = [(NSArray *)self->_axes objectAtIndexedSubscript:0];
                uint64_t v34 = [v33 unsignedIntegerValue];
                [v9 setSequence:v47.__begin_[4 - v34]];
              }
            }
          }
        }
      }
      v35 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
      objc_msgSend(v9, "setRank:", objc_msgSend(v35, "intValue"));

      goto LABEL_16;
    }
  }
  int v36 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  std::vector<unsigned long>::vector(&v47, [v36 unsignedIntegerValue]);

  std::vector<unsigned long>::vector(&__p, 5uLL);
  for (unsigned int i = 0; ; ++i)
  {
    v38 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
    unint64_t v39 = [v38 unsignedIntegerValue];

    if (v39 <= i) {
      break;
    }
    v40 = [(NSArray *)self->_outputShapes objectAtIndexedSubscript:0];
    uint64_t v41 = [v40 objectAtIndexedSubscript:i];
    uint64_t v42 = [v41 unsignedIntegerValue];
    *(void *)&v47.__begin_[2 * i] = v42;
  }
  TensorAlgebraUtils::Ndim_to_Mdim((uint64_t *)v47.__begin_, (uint64_t *)v47.__end_, (uint64_t *)__p, (uint64_t)v46);
  [v9 setSequence:*(unsigned int *)__p];
  [v9 setBatch:*((unsigned int *)__p + 2)];
  [v9 setChannels:*((unsigned int *)__p + 4)];
  [v9 setHeight:*((unsigned int *)__p + 6)];
  [v9 setWidth:*((unsigned int *)__p + 8)];
  v43 = [(NSArray *)self->_outputRanks objectAtIndexedSubscript:0];
  objc_msgSend(v9, "setRank:", objc_msgSend(v43, "intValue"));

  if (__p)
  {
    unint64_t v46 = __p;
    operator delete(__p);
  }
LABEL_16:
  if (v47.__begin_)
  {
    v47.__end_ = v47.__begin_;
    operator delete(v47.__begin_);
  }
  [v8 addObject:v9];

  return v8;
}

@end