@interface ETImageFolderDataProvider
- (ETImageFolderDataProvider)initWithFolder:(id)a3 forImageTensor:(id)a4 andLabelTensor:(id)a5 shuffleBeforeEachEpoch:(BOOL)a6 shuffleRandomSeed:(id)a7 withImagePreprocessParams:(id)a8;
- (id).cxx_construct;
- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4;
- (unint64_t)numberOfDataPoints;
- (void)prepareForEpoch;
@end

@implementation ETImageFolderDataProvider

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 24) = 1;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->imageProcessor, 0);
  objc_storeStrong((id *)&self->labelShape, 0);
  objc_storeStrong((id *)&self->labelTensorName, 0);
  objc_storeStrong((id *)&self->imageTensorName, 0);
  cntrl = self->labelBlob.__cntrl_;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  begin = self->classes.__begin_;
  if (begin)
  {
    var0 = self->classes.var0;
    v6 = self->classes.__begin_;
    if (var0 != begin)
    {
      do
      {
        v7 = *--var0;
      }
      while (var0 != begin);
      v6 = self->classes.__begin_;
    }
    self->classes.var0 = begin;
    operator delete(v6);
  }
  v8 = (char *)self->samples.__begin_;
  if (v8)
  {
    end = (char *)self->samples.__end_;
    v10 = self->samples.__begin_;
    if (end != v8)
    {
      do
      {
        v11 = (void *)*((void *)end - 2);
        end -= 16;
      }
      while (end != v8);
      v10 = self->samples.__begin_;
    }
    self->samples.__end_ = v8;
    operator delete(v10);
  }
}

- (void)prepareForEpoch
{
  if (self->shuffleBeforeEpoch)
  {
    begin = (char *)self->samples.__begin_;
    end = self->samples.__end_;
    if (end - begin >= 17)
    {
      v4 = end - 16;
      if (end - 16 > begin)
      {
        p_randomgen = &self->randomgen;
        uint64_t v6 = ((unint64_t)(end - begin) >> 4) - 1;
        do
        {
          v13[0] = 0;
          v13[1] = v6;
          uint64_t v7 = std::uniform_int_distribution<long>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)p_randomgen, v13);
          if (v7)
          {
            v8 = (void **)&begin[16 * v7];
            v9 = *(void **)begin;
            v10 = *v8;
            char *v8 = 0;
            *(void *)begin = v10;
            v11 = *v8;
            char *v8 = v9;

            v12 = (void *)*((void *)begin + 1);
            *((void *)begin + 1) = v8[1];
            v8[1] = v12;
          }
          begin += 16;
          --v6;
        }
        while (begin < v4);
      }
    }
  }
}

- (unint64_t)numberOfDataPoints
{
  return ((char *)self->samples.__end_ - (char *)self->samples.__begin_) >> 4;
}

- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v5 = (char *)self->samples.__begin_ + 16 * a3;
  id v6 = *(id *)v5;
  unint64_t v7 = *((void *)v5 + 1);
  v8 = [(ETImagePreprocessor *)self->imageProcessor tensorWithPath:v6];
  **(float **)(*((void *)self->labelBlob.__ptr_ + 20) + 24) = (float)v7;
  v9 = [ETDataTensor alloc];
  v10 = [(ETDataTensor *)v9 initWithData:*(void *)(*((void *)self->labelBlob.__ptr_ + 20) + 24) type:2 shape:self->labelShape strides:MEMORY[0x1E4F1CBF0]];
  labelTensorName = self->labelTensorName;
  v14[0] = self->imageTensorName;
  v14[1] = labelTensorName;
  v15[0] = v8;
  v15[1] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v12;
}

- (ETImageFolderDataProvider)initWithFolder:(id)a3 forImageTensor:(id)a4 andLabelTensor:(id)a5 shuffleBeforeEachEpoch:(BOOL)a6 shuffleRandomSeed:(id)a7 withImagePreprocessParams:(id)a8
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v89 = a3;
  id v82 = a4;
  id v83 = a4;
  id v81 = a5;
  id v84 = a5;
  id v85 = a7;
  id v86 = a8;
  v117.receiver = self;
  v117.super_class = (Class)ETImageFolderDataProvider;
  v97 = [(ETImageFolderDataProvider *)&v117 init];
  if (v97)
  {
    v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v116 = 0;
    v14 = [v13 contentsOfDirectoryAtPath:v89 error:&v116];
    id v15 = v116;

    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    obuint64_t j = v14;
    uint64_t v90 = [obj countByEnumeratingWithState:&v112 objects:v119 count:16];
    if (v90)
    {
      uint64_t v94 = 0;
      uint64_t v88 = *(void *)v113;
      do
      {
        for (uint64_t i = 0; i != v90; ++i)
        {
          if (*(void *)v113 != v88) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v112 + 1) + 8 * i);
          v95 = [v89 stringByAppendingPathComponent:v16];
          LOBYTE(v100) = 0;
          v17 = [MEMORY[0x1E4F28CB8] defaultManager];
          int v18 = [v17 fileExistsAtPath:v95 isDirectory:&v100];

          if ((_BYTE)v100) {
            int v19 = v18;
          }
          else {
            int v19 = 0;
          }
          if (v19 == 1)
          {
            v21 = (void *)*((void *)v97 + 5);
            unint64_t v20 = *((void *)v97 + 6);
            if ((unint64_t)v21 >= v20)
            {
              uint64_t v23 = *((void *)v97 + 4);
              uint64_t v24 = ((uint64_t)v21 - v23) >> 3;
              if ((unint64_t)(v24 + 1) >> 61) {
                std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v25 = v20 - v23;
              uint64_t v26 = v25 >> 2;
              if (v25 >> 2 <= (unint64_t)(v24 + 1)) {
                uint64_t v26 = v24 + 1;
              }
              if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v27 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v27 = v26;
              }
              if (v27)
              {
                if (v27 >> 61) {
                  std::__throw_bad_array_new_length[abi:ne180100]();
                }
                v28 = (char *)operator new(8 * v27);
              }
              else
              {
                v28 = 0;
              }
              v29 = &v28[8 * v24];
              *(void *)v29 = v16;
              v22 = v29 + 8;
              v31 = (void *)*((void *)v97 + 4);
              v30 = (void *)*((void *)v97 + 5);
              if (v30 == v31)
              {
                int64x2_t v34 = vdupq_n_s64((unint64_t)v30);
                v33 = v97;
              }
              else
              {
                do
                {
                  uint64_t v32 = *--v30;
                  void *v30 = 0;
                  *((void *)v29 - 1) = v32;
                  v29 -= 8;
                }
                while (v30 != v31);
                v33 = v97;
                int64x2_t v34 = *((int64x2_t *)v97 + 2);
              }
              v33[4] = v29;
              v33[5] = v22;
              v33[6] = &v28[8 * v27];
              v36 = (char *)v34.i64[1];
              v35 = (char *)v34.i64[0];
              while (v36 != v35)
              {
                v37 = (void *)*((void *)v36 - 1);
                v36 -= 8;
              }
              if (v35) {
                operator delete(v35);
              }
            }
            else
            {
              void *v21 = v16;
              v22 = v21 + 1;
            }
            *((void *)v97 + 5) = v22;
            v38 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v111 = v15;
            v91 = [v38 contentsOfDirectoryAtPath:v95 error:&v111];
            id v92 = v111;

            if (v92)
            {
              NSLog(&cfstr_ErrorWithImage.isa, v92);
            }
            else
            {
              long long v109 = 0u;
              long long v110 = 0u;
              long long v107 = 0u;
              long long v108 = 0u;
              id v96 = v91;
              uint64_t v39 = [v96 countByEnumeratingWithState:&v107 objects:v118 count:16];
              if (v39)
              {
                uint64_t v40 = *(void *)v108;
                do
                {
                  for (uint64_t j = 0; j != v39; ++j)
                  {
                    if (*(void *)v108 != v40) {
                      objc_enumerationMutation(v96);
                    }
                    v42 = *(void **)(*((void *)&v107 + 1) + 8 * j);
                    v43 = [v42 pathExtension];
                    v44 = [v43 lowercaseString];
                    int v45 = [v44 isEqualToString:@"jpeg"];

                    v46 = [v42 pathExtension];
                    v47 = [v46 lowercaseString];
                    int v48 = [v47 isEqualToString:@"jpg"];

                    v49 = [v42 pathExtension];
                    v50 = [v49 lowercaseString];
                    LODWORD(v46) = [v50 isEqualToString:@"png"];

                    v51 = [v42 pathExtension];
                    v52 = [v51 lowercaseString];
                    int v53 = [v52 isEqualToString:@"PNG"];

                    if (v45 | v48 | v46 | v53)
                    {
                      uint64_t v54 = [v95 stringByAppendingPathComponent:v42];
                      uint64_t v55 = v54;
                      v57 = (uint64_t *)*((void *)v97 + 2);
                      unint64_t v56 = *((void *)v97 + 3);
                      if ((unint64_t)v57 >= v56)
                      {
                        v59 = (uint64_t *)*((void *)v97 + 1);
                        uint64_t v60 = ((char *)v57 - (char *)v59) >> 4;
                        unint64_t v61 = v60 + 1;
                        if ((unint64_t)(v60 + 1) >> 60) {
                          std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
                        }
                        uint64_t v62 = v56 - (void)v59;
                        if (v62 >> 3 > v61) {
                          unint64_t v61 = v62 >> 3;
                        }
                        if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF0) {
                          unint64_t v63 = 0xFFFFFFFFFFFFFFFLL;
                        }
                        else {
                          unint64_t v63 = v61;
                        }
                        if (v63 >> 60) {
                          std::__throw_bad_array_new_length[abi:ne180100]();
                        }
                        v64 = (char *)operator new(16 * v63);
                        v65 = (uint64_t *)&v64[16 * v60];
                        uint64_t *v65 = v55;
                        v65[1] = v94;
                        if (v57 == v59)
                        {
                          v58 = v65 + 2;
                          *((void *)v97 + 1) = v65;
                          *((void *)v97 + 2) = v65 + 2;
                          *((void *)v97 + 3) = &v64[16 * v63];
                        }
                        else
                        {
                          v66 = &v64[16 * v60];
                          v67 = v57;
                          do
                          {
                            uint64_t v68 = *(v67 - 2);
                            v67 -= 2;
                            uint64_t *v67 = 0;
                            *((void *)v66 - 2) = v68;
                            v66 -= 16;
                            *((void *)v66 + 1) = v67[1];
                          }
                          while (v67 != v59);
                          v58 = v65 + 2;
                          *((void *)v97 + 1) = v66;
                          *((void *)v97 + 2) = v65 + 2;
                          *((void *)v97 + 3) = &v64[16 * v63];
                          while (v57 != v59)
                          {
                            v69 = (void *)*(v57 - 2);
                            v57 -= 2;
                          }
                        }
                        if (v59) {
                          operator delete(v59);
                        }
                      }
                      else
                      {
                        uint64_t *v57 = v54;
                        v57[1] = v94;
                        v58 = v57 + 2;
                      }
                      *((void *)v97 + 2) = v58;
                    }
                  }
                  uint64_t v39 = [v96 countByEnumeratingWithState:&v107 objects:v118 count:16];
                }
                while (v39);
              }
            }
            ++v94;
            id v15 = v92;
          }
        }
        uint64_t v90 = [obj countByEnumeratingWithState:&v112 objects:v119 count:16];
      }
      while (v90);
    }

    if (v85)
    {
      unsigned int v70 = [v85 intValue];
      unsigned int v71 = v70 + ((v70 / 0x7FFFFFFF) | ((v70 / 0x7FFFFFFF) << 31));
      if (v71 <= 1) {
        unsigned int v71 = 1;
      }
    }
    else
    {
      unsigned int v71 = 1;
    }
    *((_DWORD *)v97 + 24) = v71;
    v72 = [[ETImagePreprocessor alloc] initWithImagePreprocessParams:v86];
    v73 = (void *)*((void *)v97 + 13);
    *((void *)v97 + 13) = v72;

    objc_storeStrong((id *)v97 + 9, v82);
    LODWORD(v100) = 0;
    Espresso::create_context((int *)&v100, &v105);
    std::allocate_shared[abi:ne180100]<Espresso::blob_cpu,std::allocator<Espresso::blob_cpu>,std::shared_ptr<Espresso::abstract_context> &,Espresso::compute_path,void>((uint64_t *)&v100, &v105, 0);
    uint64_t v74 = v100;
    v75 = (std::__shared_weak_count *)*((void *)v97 + 8);
    *(_OWORD *)(v97 + 56) = v100;
    if (v75)
    {
      nitro::nitro_function::nitro_function(v75);
      uint64_t v76 = *((void *)v97 + 7);
    }
    else
    {
      uint64_t v76 = v74;
    }
    uint64_t v104 = 0;
    *(_OWORD *)__p = 0u;
    long long v102 = 0u;
    *(void *)&long long v77 = 0x100000001;
    *((void *)&v77 + 1) = 0x100000001;
    long long v100 = v77;
    unint64_t v101 = 0xFFFFFFFF00000001;
    uint64_t v98 = 0;
    v99 = 0;
    (*(void (**)(uint64_t, long long *, uint64_t *))(*(void *)v76 + 16))(v76, &v100, &v98);
    if (v99) {
      nitro::nitro_function::nitro_function(v99);
    }
    v78 = (void *)*((void *)v97 + 11);
    *((void *)v97 + 11) = &unk_1EE3AF040;

    objc_storeStrong((id *)v97 + 10, v81);
    v97[112] = a6;
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v106) {
      nitro::nitro_function::nitro_function(v106);
    }
  }
  return (ETImageFolderDataProvider *)v97;
}

@end