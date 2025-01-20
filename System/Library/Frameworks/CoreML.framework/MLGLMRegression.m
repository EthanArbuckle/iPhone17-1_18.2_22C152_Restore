@interface MLGLMRegression
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLGLMRegression)initWithLRSpec:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (id).cxx_construct;
- (id)regress:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation MLGLMRegression

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->m_spec.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  p_weights = &self->weights;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_weights);
  begin = self->intercept.__begin_;
  if (begin)
  {
    self->intercept.__end_ = begin;
    operator delete(begin);
  }
}

- (id)regress:(id)a3 options:(id)a4 error:(id *)a5
{
  id v33 = a3;
  id v8 = a4;
  v9 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v36, v9, 23, -[MLModel signpostID](self, "signpostID"), [v8 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v10 = [(MLModel *)self signpostID];
  uint64_t v11 = [v8 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__MLGLMRegression_regress_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v10;
  aBlock[5] = v11;
  v12 = (void (**)(void))_Block_copy(aBlock);
  v34 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->intercept.__end_ - self->intercept.__begin_];
  v13 = [(MLModel *)self modelDescription];
  v14 = [v13 inputFeatureNames];
  v15 = [v14 array];
  v16 = +[MLFeatureProviderUtils vectorizeFeaturesProvidedBy:v33 featureNames:v15 error:a5];

  uint64_t v17 = [v16 count];
  begin = self->weights.__begin_;
  if (v17 == (uint64_t)(begin[1] - *begin) >> 3)
  {
    if (self->weights.__end_ != begin)
    {
      uint64_t v19 = 0;
      unsigned int v20 = 1;
      do
      {
        double v21 = self->intercept.__begin_[v19];
        [v16 bytes];
        cblas_ddot_NEWLAPACK();
        double v23 = v21 + v22;
        int postEvalTransForm = self->postEvalTransForm;
        if (postEvalTransForm == 2)
        {
          double v23 = (erf(v23 / 1.41421356) + 1.0) * 0.5;
        }
        else if (postEvalTransForm == 1)
        {
          double v25 = exp(-fabs(v23));
          if (v23 >= 0.0) {
            double v26 = 1.0;
          }
          else {
            double v26 = v25;
          }
          double v23 = v26 / (v25 + 1.0);
        }
        v27 = [NSNumber numberWithDouble:v23];
        [v34 setObject:v27 atIndexedSubscript:v19];

        uint64_t v19 = v20;
      }
      while (0xAAAAAAAAAAAAAAABLL * (((char *)self->weights.__end_ - (char *)self->weights.__begin_) >> 3) > v20++);
    }
    v29 = +[MLMultiArray doubleVectorWithValues:v34];
    v30 = +[MLRegressorResult resultWithValue:v29];
    goto LABEL_15;
  }
  if (a5)
  {
    uint64_t v31 = [v16 count];
    v29 = [NSNumber numberWithUnsignedLong:(uint64_t)(*((void *)self->weights.__begin_ + 1) - *(void *)self->weights.__begin_) >> 3];
    +[MLModelErrorUtils genericErrorWithFormat:@"Input feature length mismatch. Got features of length %d expected length %@", v31, v29];
    v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  v30 = 0;
LABEL_16:

  v12[2](v12);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v36);

  return v30;
}

uint64_t __41__MLGLMRegression_regress_options_error___block_invoke()
{
  return kdebug_trace();
}

- (MLGLMRegression)initWithLRSpec:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v54.receiver = self;
  v54.super_class = (Class)MLGLMRegression;
  v9 = [(MLRegressor *)&v54 initDescriptionOnlyWithSpecification:a3 configuration:v8 error:a5];
  if (v9)
  {
    std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model&,void>((CoreML::Specification::Model **)&v52, *(const CoreML::Specification::Model **)a3);
    uint64_t v10 = v52;
    uint64_t v11 = (std::__shared_weak_count *)*((void *)v9 + 18);
    *(_OWORD *)(v9 + 136) = v52;
    if (v11)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
      uint64_t v12 = *((void *)v9 + 17);
    }
    else
    {
      uint64_t v12 = v10;
    }
    if (*(_DWORD *)(v12 + 44) == 300)
    {
      v13 = *(uint64_t **)(v12 + 32);
    }
    else
    {
      CoreML::Specification::protobuf_GLMRegressor_2eproto::InitDefaults((CoreML::Specification::protobuf_GLMRegressor_2eproto *)v11);
      v13 = &CoreML::Specification::_GLMRegressor_default_instance_;
    }
    uint64_t v14 = v13[6];
    if (v14) {
      v15 = (void *)(v14 + 8);
    }
    else {
      v15 = 0;
    }
    id v50 = v8;
    v16 = v9;
    if (v14) {
      uint64_t v17 = v14 + 8 + 8 * *((int *)v13 + 10);
    }
    else {
      uint64_t v17 = 0;
    }
    if (v15 != (void *)v17)
    {
      v18 = (void **)(v9 + 80);
      uint64_t v19 = (char *)*((void *)v9 + 11);
      do
      {
        unint64_t v20 = *((void *)v16 + 12);
        if ((unint64_t)v19 >= v20)
        {
          double v22 = (char *)*v18;
          uint64_t v23 = (v19 - (unsigned char *)*v18) >> 3;
          unint64_t v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 61) {
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v25 = v20 - (void)v22;
          if (v25 >> 2 > v24) {
            unint64_t v24 = v25 >> 2;
          }
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v26 = v24;
          }
          if (v26)
          {
            unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v26);
            double v22 = (char *)*v18;
            uint64_t v19 = (char *)*((void *)v16 + 11);
          }
          else
          {
            uint64_t v27 = 0;
          }
          v28 = (char *)(v26 + 8 * v23);
          *(void *)v28 = *v15;
          double v21 = v28 + 8;
          while (v19 != v22)
          {
            uint64_t v29 = *((void *)v19 - 1);
            v19 -= 8;
            *((void *)v28 - 1) = v29;
            v28 -= 8;
          }
          *v18 = v28;
          *((void *)v16 + 11) = v21;
          *((void *)v16 + 12) = v26 + 8 * v27;
          if (v22) {
            operator delete(v22);
          }
        }
        else
        {
          *(void *)uint64_t v19 = *v15;
          double v21 = v19 + 8;
        }
        *((void *)v16 + 11) = v21;
        ++v15;
        uint64_t v19 = v21;
      }
      while (v15 != (void *)v17);
    }
    uint64_t v30 = v13[4];
    if (v30) {
      uint64_t v31 = (uint64_t *)(v30 + 8);
    }
    else {
      uint64_t v31 = 0;
    }
    uint64_t v32 = *((int *)v13 + 6);
    v9 = v16;
    if (v32)
    {
      v51 = &v31[v32];
      do
      {
        uint64_t v33 = *v31;
        long long v52 = 0uLL;
        unint64_t v53 = 0;
        uint64_t v34 = *(void *)(v33 + 24);
        if (v34) {
          v35 = (void *)(v34 + 8);
        }
        else {
          v35 = 0;
        }
        if (v34) {
          uint64_t v36 = v34 + 8 + 8 * *(int *)(v33 + 16);
        }
        else {
          uint64_t v36 = 0;
        }
        if (v35 == (void *)v36)
        {
          v37 = 0;
        }
        else
        {
          v37 = 0;
          unint64_t v38 = 0;
          v39 = 0;
          do
          {
            if ((unint64_t)v39 >= v38)
            {
              uint64_t v41 = (v39 - v37) >> 3;
              unint64_t v42 = v41 + 1;
              if ((unint64_t)(v41 + 1) >> 61)
              {
                unint64_t v53 = v38;
                *(void *)&long long v52 = v37;
                std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
              }
              if ((uint64_t)(v38 - (void)v37) >> 2 > v42) {
                unint64_t v42 = (uint64_t)(v38 - (void)v37) >> 2;
              }
              if (v38 - (unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v43 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v43 = v42;
              }
              if (v43) {
                unint64_t v43 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v43);
              }
              else {
                uint64_t v44 = 0;
              }
              v45 = (char *)(v43 + 8 * v41);
              *(void *)v45 = *v35;
              v40 = v45 + 8;
              while (v39 != v37)
              {
                uint64_t v46 = *((void *)v39 - 1);
                v39 -= 8;
                *((void *)v45 - 1) = v46;
                v45 -= 8;
              }
              unint64_t v38 = v43 + 8 * v44;
              *((void *)&v52 + 1) = v40;
              if (v37) {
                operator delete(v37);
              }
              v37 = v45;
            }
            else
            {
              *(void *)v39 = *v35;
              v40 = v39 + 8;
            }
            *((void *)&v52 + 1) = v40;
            ++v35;
            v39 = v40;
          }
          while (v35 != (void *)v36);
          unint64_t v53 = v38;
          *(void *)&long long v52 = v37;
          v9 = v16;
        }
        unint64_t v47 = *((void *)v9 + 14);
        if (v47 >= *((void *)v9 + 15))
        {
          uint64_t v48 = std::vector<std::vector<double>>::__push_back_slow_path<std::vector<double> const&>((uint64_t *)v9 + 13, (uint64_t)&v52);
        }
        else
        {
          std::vector<std::vector<double>>::__construct_one_at_end[abi:ne180100]<std::vector<double> const&>((uint64_t)(v9 + 104), (uint64_t)&v52);
          uint64_t v48 = v47 + 24;
        }
        *((void *)v9 + 14) = v48;
        if (v37)
        {
          *((void *)&v52 + 1) = v37;
          operator delete(v37);
        }
        ++v31;
      }
      while (v31 != v51);
    }
    id v8 = v50;
    *((_DWORD *)v9 + 32) = *((_DWORD *)v13 + 15);
  }

  return (MLGLMRegression *)v9;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = (void *)[objc_alloc((Class)a1) initWithSpecification:a3 configuration:v8 error:a5];

  return v9;
}

@end