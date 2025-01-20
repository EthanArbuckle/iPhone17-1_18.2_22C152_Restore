@interface Predictor
- (BOOL)predict:(void *)a3 afib:(void *)a4 be_mode:(BOOL *)a5 with_error_status:(BOOL *)a6;
- (MLMultiArray)TeModelInput;
- (MLPredictionOptions)modelOptions;
- (Predictor)init;
- (Te_c3seuakuh8)mTe_c3seuakuh8;
- (Te_c3seuakuh8Input)TeModelInput_c3seuakuh8;
- (Te_c3seuakuh8Output)TeModelOutput_c3seuakuh8;
- (Te_tjejjxf8q3)mTe_tjejjxf8q3;
- (Te_tjejjxf8q3Input)TeModelInput_tjejjxf8q3;
- (Te_tjejjxf8q3Output)TeModelOutput_tjejjxf8q3;
- (void)resample:(void *)a3 output:(void *)a4;
@end

@implementation Predictor

- (Predictor)init
{
  v21.receiver = self;
  v21.super_class = (Class)Predictor;
  v2 = [(Predictor *)&v21 init];
  if (v2)
  {
    id v20 = 0;
    uint64_t v3 = [objc_alloc(MEMORY[0x263F00DA8]) initWithShape:&unk_26FBC3478 dataType:65600 error:&v20];
    id v4 = v20;
    TeModelInput = v2->_TeModelInput;
    v2->_TeModelInput = (MLMultiArray *)v3;

    if (v4)
    {
      v6 = 0;
LABEL_13:

      goto LABEL_14;
    }
    id v7 = objc_alloc_init(MEMORY[0x263F00D98]);
    v8 = v7;
    if (v7)
    {
      [v7 setComputeUnits:0];
      id v19 = 0;
      v9 = [[Te_c3seuakuh8 alloc] initWithConfiguration:v8 error:&v19];
      id v10 = v19;
      mTe_c3seuakuh8 = v2->_mTe_c3seuakuh8;
      v2->_mTe_c3seuakuh8 = v9;

      id v18 = v10;
      v12 = [[Te_tjejjxf8q3 alloc] initWithConfiguration:v8 error:&v18];
      id v4 = v18;

      mTe_tjejjxf8q3 = v2->_mTe_tjejjxf8q3;
      v2->_mTe_tjejjxf8q3 = v12;

      if (v2->_mTe_c3seuakuh8)
      {
        if (v2->_mTe_tjejjxf8q3)
        {
          v14 = (MLPredictionOptions *)objc_alloc_init(MEMORY[0x263F00DC8]);
          modelOptions = v2->_modelOptions;
          v2->_modelOptions = v14;

          v16 = v2->_modelOptions;
          if (v16)
          {
            [(MLPredictionOptions *)v16 setUsesCPUOnly:1];
            v6 = v2;
LABEL_12:

            goto LABEL_13;
          }
        }
      }
    }
    else
    {
      id v4 = 0;
    }
    v6 = 0;
    goto LABEL_12;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

- (BOOL)predict:(void *)a3 afib:(void *)a4 be_mode:(BOOL *)a5 with_error_status:(BOOL *)a6
{
  v77[2] = *MEMORY[0x263EF8340];
  v73 = 0;
  v74 = 0;
  uint64_t v75 = 0;
  __p = 0;
  long long v72 = 0uLL;
  [(Predictor *)self resample:a3 output:&v73];
  for (uint64_t i = 0; i != 240; ++i)
  {
    TeModelInput = self->_TeModelInput;
    v12 = [NSNumber numberWithDouble:*((double *)v73 + i)];
    [(MLMultiArray *)TeModelInput setObject:v12 atIndexedSubscript:i];
  }
  v13 = [[Te_c3seuakuh8Input alloc] initWithPlaceholder:self->_TeModelInput];
  TeModelInput_c3seuakuh8 = self->_TeModelInput_c3seuakuh8;
  self->_TeModelInput_c3seuakuh8 = v13;

  v15 = [[Te_tjejjxf8q3Input alloc] initWithPlaceholder:self->_TeModelInput];
  TeModelInput_tjejjxf8q3 = self->_TeModelInput_tjejjxf8q3;
  self->_TeModelInput_tjejjxf8q3 = v15;

  mTe_c3seuakuh8 = self->_mTe_c3seuakuh8;
  id v18 = self->_TeModelInput_c3seuakuh8;
  modelOptions = self->_modelOptions;
  id v70 = 0;
  id v20 = [mTe_c3seuakuh8 predictionFromFeatures:v18 options:modelOptions error:&v70];
  unint64_t v21 = (unint64_t)v70;
  TeModelOutput_c3seuakuh8 = self->_TeModelOutput_c3seuakuh8;
  self->_TeModelOutput_c3seuakuh8 = v20;

  mTe_tjejjxf8q3 = self->_mTe_tjejjxf8q3;
  v24 = self->_TeModelInput_tjejjxf8q3;
  v25 = self->_modelOptions;
  id v69 = 0;
  v26 = [mTe_tjejjxf8q3 predictionFromFeatures:v24 options:v25 error:&v69];
  unint64_t v27 = (unint64_t)v69;
  TeModelOutput_tjejjxf8q3 = self->_TeModelOutput_tjejjxf8q3;
  self->_TeModelOutput_tjejjxf8q3 = v26;

  if (v21 | v27)
  {
    BOOL v29 = 0;
    *a6 = 1;
  }
  else
  {
    *a6 = 0;
    v30 = [(Te_c3seuakuh8Output *)self->_TeModelOutput_c3seuakuh8 RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd];
    v31 = [v30 objectAtIndexedSubscript:1];
    [v31 doubleValue];
    double v33 = exp(v32 * -1.62473583 + 0.976720872);

    v34 = [(Te_tjejjxf8q3Output *)self->_TeModelOutput_tjejjxf8q3 RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd];
    v35 = [v34 objectAtIndexedSubscript:1];
    [v35 doubleValue];
    double v37 = exp(v36 * -1.51426294 + 0.182884028);

    double v38 = 1.0 / (v33 + 1.0);
    double v39 = 1.0 / (v37 + 1.0);
    double v40 = (v38 + v39) * 0.5;
    float v41 = v40;
    unint64_t v42 = *((void *)a4 + 2);
    v43 = (float *)*((void *)a4 + 1);
    if ((unint64_t)v43 >= v42)
    {
      v45 = *(float **)a4;
      uint64_t v46 = ((uint64_t)v43 - *(void *)a4) >> 2;
      unint64_t v47 = v46 + 1;
      if ((unint64_t)(v46 + 1) >> 62) {
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v48 = v42 - (void)v45;
      if (v48 >> 1 > v47) {
        unint64_t v47 = v48 >> 1;
      }
      if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v49 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v49 = v47;
      }
      if (v49)
      {
        v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)a4 + 16, v49);
        v45 = *(float **)a4;
        v43 = (float *)*((void *)a4 + 1);
      }
      else
      {
        v50 = 0;
      }
      v51 = (float *)&v50[4 * v46];
      v52 = &v50[4 * v49];
      float *v51 = v41;
      v44 = v51 + 1;
      while (v43 != v45)
      {
        int v53 = *((_DWORD *)v43-- - 1);
        *((_DWORD *)v51-- - 1) = v53;
      }
      *(void *)a4 = v51;
      *((void *)a4 + 1) = v44;
      *((void *)a4 + 2) = v52;
      if (v45) {
        operator delete(v45);
      }
    }
    else
    {
      float *v43 = v41;
      v44 = v43 + 1;
    }
    *((void *)a4 + 1) = v44;
    std::to_string(&v67, v38);
    v54 = std::string::insert(&v67, 0, "Tellurium AFib probabilities from two models: ");
    long long v55 = *(_OWORD *)&v54->__r_.__value_.__l.__data_;
    v68.__r_.__value_.__r.__words[2] = v54->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v68.__r_.__value_.__l.__data_ = v55;
    v54->__r_.__value_.__l.__size_ = 0;
    v54->__r_.__value_.__r.__words[2] = 0;
    v54->__r_.__value_.__r.__words[0] = 0;
    v56 = std::string::append(&v68, " ");
    long long v57 = *(_OWORD *)&v56->__r_.__value_.__l.__data_;
    v76.__r_.__value_.__r.__words[2] = v56->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v57;
    v56->__r_.__value_.__l.__size_ = 0;
    v56->__r_.__value_.__r.__words[2] = 0;
    v56->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v66, v39);
    if ((v66.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v58 = &v66;
    }
    else {
      v58 = (std::string *)v66.__r_.__value_.__r.__words[0];
    }
    if ((v66.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v66.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v66.__r_.__value_.__l.__size_;
    }
    v60 = std::string::append(&v76, (const std::string::value_type *)v58, size);
    v61 = (void *)v60->__r_.__value_.__r.__words[0];
    v77[0] = v60->__r_.__value_.__l.__size_;
    *(void *)((char *)v77 + 7) = *(std::string::size_type *)((char *)&v60->__r_.__value_.__r.__words[1] + 7);
    int v62 = SHIBYTE(v60->__r_.__value_.__r.__words[2]);
    v60->__r_.__value_.__l.__size_ = 0;
    v60->__r_.__value_.__r.__words[2] = 0;
    v60->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v72) < 0) {
      operator delete(__p);
    }
    __p = v61;
    *(void *)&long long v72 = v77[0];
    *(void *)((char *)&v72 + 7) = *(void *)((char *)v77 + 7);
    HIBYTE(v72) = v62;
    if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v66.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v76.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v68.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v67.__r_.__value_.__l.__data_);
    }
    v63 = algs_get_log_0();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      p_p = &__p;
      if (v62 < 0) {
        p_p = (void **)v61;
      }
      LODWORD(v76.__r_.__value_.__l.__data_) = 136446210;
      *(std::string::size_type *)((char *)v76.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
      _os_log_impl(&dword_2477CF000, v63, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v76, 0xCu);
    }

    BOOL v29 = v40 > dbl_2477E9070[!*a5];
    if (SHIBYTE(v72) < 0) {
      operator delete(__p);
    }
  }
  if (v73)
  {
    v74 = v73;
    operator delete(v73);
  }

  return v29;
}

- (void)resample:(void *)a3 output:(void *)a4
{
  __p = 0;
  int v62 = 0;
  v63 = 0;
  std::vector<double>::reserve((void **)a4, 0xF0uLL);
  v6 = *(double **)a3;
  uint64_t v7 = *((void *)a3 + 1);
  if (v7 - *(void *)a3 != 8)
  {
    unint64_t v21 = 0;
    uint64_t v22 = 0;
    do
    {
      unint64_t v23 = v22 + 1;
      double v24 = 60.0 / (v6[v22 + 1] - v6[v22]);
      if (v21 >= v63)
      {
        v25 = __p;
        uint64_t v26 = v21 - __p;
        unint64_t v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 61) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v28 = (char *)v63 - (char *)__p;
        if (((char *)v63 - (char *)__p) >> 2 > v27) {
          unint64_t v27 = v28 >> 2;
        }
        if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v29 = v27;
        }
        if (v29)
        {
          v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v63, v29);
          v25 = __p;
          unint64_t v21 = v62;
        }
        else
        {
          v30 = 0;
        }
        v31 = (double *)&v30[8 * v26];
        double *v31 = v24;
        double v32 = v31 + 1;
        while (v21 != v25)
        {
          uint64_t v33 = *((void *)v21-- - 1);
          *((void *)v31-- - 1) = v33;
        }
        __p = v31;
        v63 = (double *)&v30[8 * v29];
        if (v25) {
          operator delete(v25);
        }
        unint64_t v21 = v32;
      }
      else
      {
        *v21++ = v24;
      }
      int v62 = v21;
      v6 = *(double **)a3;
      uint64_t v7 = *((void *)a3 + 1);
      ++v22;
    }
    while (((v7 - *(void *)a3) >> 3) - 1 > v23);
  }
  uint64_t v8 = v7 - 8;
  *((void *)a3 + 1) = v7 - 8;
  if (*v6 <= 0.0)
  {
    double v11 = 0.0;
  }
  else
  {
    v9 = (char *)a4 + 16;
    id v10 = (double *)*((void *)a4 + 1);
    double v11 = 0.0;
    do
    {
      if ((unint64_t)v10 >= *v9)
      {
        v13 = *(double **)a4;
        uint64_t v14 = ((uint64_t)v10 - *(void *)a4) >> 3;
        unint64_t v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 61) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v16 = *v9 - (void)v13;
        if (v16 >> 2 > v15) {
          unint64_t v15 = v16 >> 2;
        }
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v17 = v15;
        }
        if (v17)
        {
          id v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a4 + 16, v17);
          v13 = *(double **)a4;
          id v10 = (double *)*((void *)a4 + 1);
        }
        else
        {
          id v18 = 0;
        }
        id v19 = &v18[8 * v14];
        *(void *)id v19 = 0;
        v12 = (double *)(v19 + 8);
        while (v10 != v13)
        {
          uint64_t v20 = *((void *)v10-- - 1);
          *((void *)v19 - 1) = v20;
          v19 -= 8;
        }
        *(void *)a4 = v19;
        *((void *)a4 + 1) = v12;
        *((void *)a4 + 2) = &v18[8 * v17];
        if (v13) {
          operator delete(v13);
        }
      }
      else
      {
        *id v10 = 0.0;
        v12 = v10 + 1;
      }
      *((void *)a4 + 1) = v12;
      double v11 = v11 + 0.25;
      v6 = *(double **)a3;
      id v10 = v12;
    }
    while (v11 < **(double **)a3);
    uint64_t v8 = *((void *)a3 + 1);
  }
  if (v8 - (void)v6 == 8)
  {
    v34 = (double *)*((void *)a4 + 1);
  }
  else
  {
    uint64_t v35 = 0;
    int v36 = 0;
    double v37 = (char *)a4 + 16;
    double v38 = (double *)*((void *)a4 + 1);
    do
    {
      int v39 = v36 + 1;
      double v40 = __p[v35] + (__p[v39] - __p[v35]) / (v6[v39] - v6[v35]) * (v11 - v6[v35]);
      if ((unint64_t)v38 >= *v37)
      {
        float v41 = *(double **)a4;
        uint64_t v42 = ((uint64_t)v38 - *(void *)a4) >> 3;
        unint64_t v43 = v42 + 1;
        if ((unint64_t)(v42 + 1) >> 61) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v44 = *v37 - (void)v41;
        if (v44 >> 2 > v43) {
          unint64_t v43 = v44 >> 2;
        }
        if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v45 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v45 = v43;
        }
        if (v45)
        {
          uint64_t v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a4 + 16, v45);
          float v41 = *(double **)a4;
          double v38 = (double *)*((void *)a4 + 1);
        }
        else
        {
          uint64_t v46 = 0;
        }
        unint64_t v47 = (double *)&v46[8 * v42];
        *unint64_t v47 = v40;
        v34 = v47 + 1;
        while (v38 != v41)
        {
          uint64_t v48 = *((void *)v38-- - 1);
          *((void *)v47-- - 1) = v48;
        }
        *(void *)a4 = v47;
        *((void *)a4 + 1) = v34;
        *((void *)a4 + 2) = &v46[8 * v45];
        if (v41) {
          operator delete(v41);
        }
      }
      else
      {
        *double v38 = v40;
        v34 = v38 + 1;
      }
      *((void *)a4 + 1) = v34;
      double v11 = v11 + 0.25;
      v6 = *(double **)a3;
      if (v11 >= *(double *)(*(void *)a3 + 8 * v39)) {
        ++v36;
      }
      uint64_t v35 = v36;
      double v38 = v34;
    }
    while (((uint64_t)(*((void *)a3 + 1) - (void)v6) >> 3) - 1 > (unint64_t)v36);
  }
  unint64_t v49 = *(double **)a4;
  unint64_t v50 = (unint64_t)v34 - *(void *)a4;
  if (v50 <= 0x77F)
  {
    v51 = (char *)a4 + 16;
    do
    {
      if ((unint64_t)v34 >= *v51)
      {
        unint64_t v52 = v50 >> 3;
        uint64_t v53 = *v51 - (void)v49;
        if (v53 >> 2 <= (v50 >> 3) + 1) {
          uint64_t v54 = v52 + 1;
        }
        else {
          uint64_t v54 = v53 >> 2;
        }
        if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v55 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v55 = v54;
        }
        long long v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a4 + 16, v55);
        v58 = *(double **)a4;
        v59 = (double *)*((void *)a4 + 1);
        unint64_t v49 = (double *)&v57[8 * v52];
        *unint64_t v49 = 0.0;
        v34 = v49 + 1;
        while (v59 != v58)
        {
          uint64_t v60 = *((void *)v59-- - 1);
          *((void *)v49-- - 1) = v60;
        }
        *(void *)a4 = v49;
        *((void *)a4 + 1) = v34;
        *((void *)a4 + 2) = &v57[8 * v56];
        if (v58)
        {
          operator delete(v58);
          unint64_t v49 = *(double **)a4;
        }
      }
      else
      {
        *v34++ = 0.0;
      }
      *((void *)a4 + 1) = v34;
      unint64_t v50 = (char *)v34 - (char *)v49;
    }
    while ((unint64_t)((char *)v34 - (char *)v49) < 0x780);
  }
  while (v49 != v34)
    ++v49;
  if (__p) {
    operator delete(__p);
  }
}

- (MLMultiArray)TeModelInput
{
  return self->_TeModelInput;
}

- (Te_c3seuakuh8)mTe_c3seuakuh8
{
  return self->_mTe_c3seuakuh8;
}

- (Te_tjejjxf8q3)mTe_tjejjxf8q3
{
  return self->_mTe_tjejjxf8q3;
}

- (Te_c3seuakuh8Output)TeModelOutput_c3seuakuh8
{
  return self->_TeModelOutput_c3seuakuh8;
}

- (Te_tjejjxf8q3Output)TeModelOutput_tjejjxf8q3
{
  return self->_TeModelOutput_tjejjxf8q3;
}

- (Te_c3seuakuh8Input)TeModelInput_c3seuakuh8
{
  return self->_TeModelInput_c3seuakuh8;
}

- (Te_tjejjxf8q3Input)TeModelInput_tjejjxf8q3
{
  return self->_TeModelInput_tjejjxf8q3;
}

- (MLPredictionOptions)modelOptions
{
  return self->_modelOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelOptions, 0);
  objc_storeStrong((id *)&self->_TeModelInput_tjejjxf8q3, 0);
  objc_storeStrong((id *)&self->_TeModelInput_c3seuakuh8, 0);
  objc_storeStrong((id *)&self->_TeModelOutput_tjejjxf8q3, 0);
  objc_storeStrong((id *)&self->_TeModelOutput_c3seuakuh8, 0);
  objc_storeStrong((id *)&self->_mTe_tjejjxf8q3, 0);
  objc_storeStrong((id *)&self->_mTe_c3seuakuh8, 0);
  objc_storeStrong((id *)&self->_TeModelInput, 0);
}

@end