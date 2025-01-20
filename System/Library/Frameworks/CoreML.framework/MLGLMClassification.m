@interface MLGLMClassification
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (BOOL)calculateClassProbability:(double *)a3 input:(id)a4 error:(id *)a5;
- (MLGLMClassification)initWithSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (id).cxx_construct;
- (id)classify:(id)a3 error:(id *)a4;
- (id)classify:(id)a3 options:(id)a4 error:(id *)a5;
- (id)classify:(id)a3 topK:(unint64_t)a4 error:(id *)a5;
@end

@implementation MLGLMClassification

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 22) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->m_spec.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->classLabels, 0);
  p_weights = &self->weights;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_weights);
  begin = self->intercept.__begin_;
  if (begin)
  {
    self->intercept.__end_ = begin;
    operator delete(begin);
  }
}

- (id)classify:(id)a3 topK:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  unint64_t v9 = [(NSMutableArray *)self->classLabels count];
  if (v9 >= a4) {
    unint64_t v10 = a4;
  }
  else {
    unint64_t v10 = v9;
  }
  unint64_t v71 = v10;
  unint64_t v11 = [(NSMutableArray *)self->classLabels count];
  std::vector<double>::vector(v74, v11);
  if (![(MLGLMClassification *)self calculateClassProbability:v74[0] input:v8 error:a5])
  {
    v51 = 0;
    goto LABEL_87;
  }
  std::vector<unsigned long>::vector(&__p, v11);
  v12 = (uint64_t *)__p;
  v13 = v73;
  if (__p != v73)
  {
    uint64_t v14 = 0;
    v15 = (uint64_t *)__p;
    do
      *v15++ = v14++;
    while (v15 != v13);
  }
  if (v71 >= v11) {
    goto LABEL_75;
  }
  v16 = &v12[v71];
  if (v16 == v13) {
    goto LABEL_74;
  }
  while (1)
  {
    unint64_t v17 = v13 - v12;
    if (v17 < 2) {
      goto LABEL_74;
    }
    if (v17 == 3)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:]::$_1 &,std::__wrap_iter<unsigned long *>>(v12, v12 + 1, v13 - 1, (uint64_t)v74[0]);
      goto LABEL_74;
    }
    if (v17 == 2)
    {
      uint64_t v52 = *(v13 - 1);
      uint64_t v53 = *v12;
      if (*((double *)v74[0] + v52) > *((double *)v74[0] + *v12))
      {
        uint64_t *v12 = v52;
        *(v13 - 1) = v53;
      }
      goto LABEL_74;
    }
    if ((char *)v13 - (char *)v12 <= 63)
    {
      if (v13 - 1 == v12) {
        goto LABEL_74;
      }
      v54 = (double *)v74[0];
      while (1)
      {
        v55 = v13;
        if (v12 == v13) {
          goto LABEL_71;
        }
        v56 = v12 + 1;
        if (v12 + 1 != v13) {
          break;
        }
LABEL_73:
        if (++v12 == v13 - 1) {
          goto LABEL_74;
        }
      }
      uint64_t v57 = *v12;
      v55 = v12;
      v58 = v12 + 1;
      do
      {
        uint64_t v60 = *v58++;
        uint64_t v59 = v60;
        if (v54[v60] > v54[v57])
        {
          uint64_t v57 = v59;
          v55 = v56;
        }
        v56 = v58;
      }
      while (v58 != v13);
LABEL_71:
      if (v55 != v12)
      {
        uint64_t v61 = *v12;
        uint64_t *v12 = *v55;
        uint64_t *v55 = v61;
      }
      goto LABEL_73;
    }
    v18 = &v12[v17 >> 1];
    v19 = v13 - 1;
    int v20 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:]::$_1 &,std::__wrap_iter<unsigned long *>>(v12, v18, v13 - 1, (uint64_t)v74[0]);
    uint64_t v21 = *v12;
    v22 = (double *)v74[0];
    double v23 = *((double *)v74[0] + *v12);
    double v24 = *((double *)v74[0] + *v18);
    if (v23 <= v24) {
      break;
    }
LABEL_19:
    v29 = v12 + 1;
    if (v12 + 1 >= v19)
    {
      v32 = v12 + 1;
    }
    else
    {
      v30 = v12 + 1;
      while (1)
      {
        double v31 = v22[*v18];
        do
        {
          v32 = v30;
          uint64_t v34 = *v30++;
          uint64_t v33 = v34;
        }
        while (v22[v34] > v31);
        do
        {
          uint64_t v36 = *--v19;
          uint64_t v35 = v36;
        }
        while (v22[v36] <= v31);
        if (v32 >= v19) {
          break;
        }
        uint64_t *v32 = v35;
        uint64_t *v19 = v33;
        ++v20;
        if (v18 == v32) {
          v18 = v19;
        }
      }
    }
    if (v32 != v18)
    {
      uint64_t v37 = *v32;
      if (v22[*v18] > v22[*v32])
      {
        uint64_t *v32 = *v18;
        uint64_t *v18 = v37;
        ++v20;
      }
    }
    if (v32 == v16) {
      goto LABEL_74;
    }
    if (!v20)
    {
      if (v32 <= v16)
      {
        v43 = v32 + 1;
        while (v43 != v13)
        {
          double v44 = v22[*v43];
          double v45 = v22[*(v43++ - 1)];
          if (v44 > v45) {
            goto LABEL_34;
          }
        }
      }
      else
      {
        while (v29 != v32)
        {
          double v39 = v22[*v29];
          double v40 = v22[*(v29++ - 1)];
          if (v39 > v40) {
            goto LABEL_34;
          }
        }
      }
      goto LABEL_74;
    }
LABEL_34:
    if (v32 <= v16)
    {
      v38 = v32 + 1;
    }
    else
    {
      v13 = v32;
      v38 = v12;
    }
LABEL_57:
    v12 = v38;
    if (v13 == v16) {
      goto LABEL_74;
    }
  }
  v25 = v13 - 2;
  while (v25 != v12)
  {
    v26 = v25;
    uint64_t v28 = *v25--;
    uint64_t v27 = v28;
    if (*((double *)v74[0] + v28) > v24)
    {
      uint64_t *v12 = v27;
      uint64_t *v26 = v21;
      ++v20;
      v19 = v26;
      goto LABEL_19;
    }
  }
  v41 = v12 + 1;
  if (v23 > *((double *)v74[0] + *v19))
  {
LABEL_50:
    if (v41 == v19) {
      goto LABEL_74;
    }
    while (1)
    {
      double v46 = v22[*v12];
      do
      {
        v38 = v41;
        uint64_t v48 = *v41++;
        uint64_t v47 = v48;
      }
      while (v46 <= v22[v48]);
      do
      {
        uint64_t v50 = *--v19;
        uint64_t v49 = v50;
      }
      while (v46 > v22[v50]);
      if (v38 >= v19) {
        break;
      }
      uint64_t *v38 = v49;
      uint64_t *v19 = v47;
    }
    if (v38 > v16) {
      goto LABEL_74;
    }
    goto LABEL_57;
  }
  while (v41 != v19)
  {
    uint64_t v42 = *v41;
    if (v23 > *((double *)v74[0] + *v41))
    {
      *v41++ = *v19;
      uint64_t *v19 = v42;
      goto LABEL_50;
    }
    ++v41;
  }
LABEL_74:
  std::vector<unsigned long>::resize(&__p, v71);
LABEL_75:
  v62 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v11];
  if (v71)
  {
    id v70 = v8;
    for (uint64_t i = 0; i != v71; ++i)
    {
      uint64_t v64 = *((void *)__p + i);
      v65 = objc_msgSend(NSNumber, "numberWithDouble:", *((double *)v74[0] + v64), v70);
      if (self->classType == 1)
      {
        v66 = NSNumber;
        v67 = [(NSMutableArray *)self->classLabels objectAtIndexedSubscript:v64];
        objc_msgSend(v66, "numberWithLongLong:", objc_msgSend(v67, "int64Value"));
      }
      else
      {
        v67 = [(NSMutableArray *)self->classLabels objectAtIndexedSubscript:v64];
        [v67 stringValue];
      v68 = };
      [v62 setObject:v65 forKeyedSubscript:v68];
    }
    id v8 = v70;
  }
  if (self->classType == 1) {
    +[MLClassifierResult resultWithIntClassProbability:v62];
  }
  else {
  v51 = +[MLClassifierResult resultWithStringClassProbability:v62];
  }

  if (__p)
  {
    v73 = (uint64_t *)__p;
    operator delete(__p);
  }
LABEL_87:
  if (v74[0])
  {
    v74[1] = v74[0];
    operator delete(v74[0]);
  }

  return v51;
}

- (id)classify:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  unint64_t v10 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v18, v10, 27, -[MLModel signpostID](self, "signpostID"), [v9 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v11 = [(MLModel *)self signpostID];
  uint64_t v12 = [v9 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__MLGLMClassification_classify_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  v13 = (void (**)(void))_Block_copy(aBlock);
  unint64_t v14 = [v9 classifyTopK];
  if (v14 >= [(NSMutableArray *)self->classLabels count]) {
    [(MLGLMClassification *)self classify:v8 error:a5];
  }
  else {
  v15 = [(MLGLMClassification *)self classify:v8 topK:v14 error:a5];
  }
  v13[2](v13);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v18);

  return v15;
}

uint64_t __46__MLGLMClassification_classify_options_error___block_invoke()
{
  return kdebug_trace();
}

- (BOOL)calculateClassProbability:(double *)a3 input:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(MLModel *)self modelDescription];
  unint64_t v10 = [v9 inputFeatureNames];
  unint64_t v11 = [v10 array];
  uint64_t v12 = +[MLFeatureProviderUtils vectorizeFeaturesProvidedBy:v8 featureNames:v11 error:a5];

  if (!v12)
  {
LABEL_14:
    BOOL v25 = 0;
    goto LABEL_32;
  }
  p_weights = &self->weights;
  if ([v12 count] != (uint64_t)(*((void *)self->weights.__begin_ + 1)
                                             - *(void *)self->weights.__begin_) >> 3)
  {
    if (a5)
    {
      double v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "count"));
      double v24 = [NSNumber numberWithUnsignedLong:(uint64_t)(*((void *)p_weights->__begin_ + 1) - *(void *)p_weights->__begin_) >> 3];
      *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Input feature length mismatch. Got features of length %@ expected length %@", v23, v24];
    }
    goto LABEL_14;
  }
  if ([(NSMutableArray *)self->classLabels count] == 2 || self->classEncoding)
  {
    unint64_t v14 = v12;
    int v15 = 0;
  }
  else
  {
    unint64_t v14 = v12;
    *a3 = 0.0;
    int v15 = 1;
  }
  if (self->weights.__end_ != p_weights->__begin_)
  {
    uint64_t v16 = 0;
    unsigned int v17 = 1;
    do
    {
      double v18 = self->intercept.__begin_[v16];
      [v14 bytes];
      cblas_ddot_NEWLAPACK();
      a3[v15 - 1 + v17] = v18 + v19;
      uint64_t v16 = v17;
    }
    while (0xAAAAAAAAAAAAAAABLL * (((char *)self->weights.__end_ - (char *)self->weights.__begin_) >> 3) > v17++);
  }
  uint64_t v12 = v14;
  if ([(NSMutableArray *)self->classLabels count] == 2)
  {
    double v21 = *a3;
    if (self->postEvalTransForm)
    {
      double v22 = (erf(v21 / 1.41421356) + 1.0) * 0.5;
    }
    else
    {
      double v33 = exp(-fabs(v21));
      if (v21 >= 0.0) {
        double v34 = 1.0;
      }
      else {
        double v34 = v33;
      }
      double v22 = v34 / (v33 + 1.0);
    }
    *a3 = 1.0 - v22;
    a3[1] = v22;
  }
  else if (self->classEncoding)
  {
    unsigned int v26 = 0;
    double v27 = 0.0;
    while ([(NSMutableArray *)self->classLabels count] > (unint64_t)v26)
    {
      double v28 = a3[v26];
      double v29 = exp(-fabs(v28));
      if (v28 >= 0.0) {
        double v30 = 1.0;
      }
      else {
        double v30 = v29;
      }
      double v31 = v30 / (v29 + 1.0);
      a3[v26] = v31;
      double v27 = v27 + v31;
      ++v26;
    }
    for (unsigned int i = 0; [(NSMutableArray *)self->classLabels count] > (unint64_t)i; ++i)
      a3[i] = a3[i] / v27;
  }
  else
  {
    uint64_t v36 = [(NSMutableArray *)self->classLabels count];
    if (v36)
    {
      uint64_t v37 = 8 * v36;
      v38 = a3;
      if (v36 != 1)
      {
        double v39 = a3 + 1;
        double v40 = *a3;
        uint64_t v41 = v37 - 8;
        v38 = a3;
        uint64_t v42 = a3 + 1;
        do
        {
          double v43 = *v42++;
          double v44 = v43;
          if (v40 < v43)
          {
            double v40 = v44;
            v38 = v39;
          }
          double v39 = v42;
          v41 -= 8;
        }
        while (v41);
      }
      double v45 = *v38;
      double v46 = 0.0;
      uint64_t v47 = 8 * v36;
      uint64_t v48 = a3;
      do
      {
        long double v49 = exp(*v48 - v45);
        *v48++ = v49;
        double v46 = v46 + v49;
        v47 -= 8;
      }
      while (v47);
      do
      {
        *a3 = *a3 / v46;
        ++a3;
        v37 -= 8;
      }
      while (v37);
    }
  }
  BOOL v25 = 1;
LABEL_32:

  return v25;
}

- (id)classify:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(NSMutableArray *)self->classLabels count];
  std::vector<double>::vector(__p, v7);
  if ([(MLGLMClassification *)self calculateClassProbability:__p[0] input:v6 error:a4])
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v7];
    if (v7)
    {
      id v16 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        unint64_t v10 = objc_msgSend(NSNumber, "numberWithDouble:", *((double *)__p[0] + i), v16);
        if (self->classType == 1)
        {
          unint64_t v11 = NSNumber;
          uint64_t v12 = [(NSMutableArray *)self->classLabels objectAtIndexedSubscript:i];
          objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v12, "int64Value"));
        }
        else
        {
          uint64_t v12 = [(NSMutableArray *)self->classLabels objectAtIndexedSubscript:i];
          [v12 stringValue];
        v13 = };
        [v8 setObject:v10 forKeyedSubscript:v13];
      }
      id v6 = v16;
    }
    if (self->classType == 1) {
      +[MLClassifierResult resultWithIntClassProbability:v8];
    }
    else {
    unint64_t v14 = +[MLClassifierResult resultWithStringClassProbability:v8];
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v14;
}

- (MLGLMClassification)initWithSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v82.receiver = self;
  v82.super_class = (Class)MLGLMClassification;
  id v75 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
  id v9 = [(MLClassifier *)&v82 initWithDescription:v75 configuration:v8 error:a5];
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = (void *)*((void *)v9 + 18);
    uint64_t v72 = 144;
    *((void *)v9 + 18) = v11;

    std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model&,void>((CoreML::Specification::Model **)&v80, *(const CoreML::Specification::Model **)a3);
    inited = (std::__shared_weak_count *)*((void *)v9 + 22);
    v79 = v9 + 168;
    *(_OWORD *)(v9 + 168) = v80;
    if (inited) {
      std::__shared_weak_count::__release_shared[abi:ne180100](inited);
    }
    if (*(_DWORD *)(*(void *)v79 + 44) == 400)
    {
      unint64_t v14 = *(uint64_t **)(*(void *)v79 + 32);
    }
    else
    {
      inited = (std::__shared_weak_count *)CoreML::Specification::protobuf_GLMClassifier_2eproto::InitDefaults((CoreML::Specification::protobuf_GLMClassifier_2eproto *)inited);
      unint64_t v14 = &CoreML::Specification::_GLMClassifier_default_instance_;
    }
    v77 = v10;
    id v74 = v8;
    uint64_t v15 = v14[6];
    if (v15) {
      id v16 = (std::__shared_weak_count_vtbl **)(v15 + 8);
    }
    else {
      id v16 = 0;
    }
    if (v15) {
      uint64_t v17 = v15 + 8 + 8 * *((int *)v14 + 10);
    }
    else {
      uint64_t v17 = 0;
    }
    v78 = (uint64_t *)v9;
    if (v16 != (std::__shared_weak_count_vtbl **)v17)
    {
      double v18 = (std::__shared_weak_count **)(v9 + 96);
      double v19 = (char *)*((void *)v9 + 13);
      do
      {
        unint64_t v20 = *((void *)v9 + 14);
        if ((unint64_t)v19 >= v20)
        {
          inited = *v18;
          uint64_t v22 = (v19 - (char *)*v18) >> 3;
          unint64_t v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 61) {
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v24 = v20 - (void)inited;
          if (v24 >> 2 > v23) {
            unint64_t v23 = v24 >> 2;
          }
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v25 = v23;
          }
          if (v25)
          {
            unint64_t v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v25);
            inited = *v18;
            double v19 = (char *)*((void *)v9 + 13);
          }
          else
          {
            uint64_t v26 = 0;
          }
          double v27 = (std::__shared_weak_count *)(v25 + 8 * v22);
          v27->__vftable = *v16;
          p_shared_owners = &v27->__shared_owners_;
          while (v19 != (char *)inited)
          {
            uint64_t v28 = *((void *)v19 - 1);
            v19 -= 8;
            v27[-1].__shared_weak_owners_ = v28;
            double v27 = (std::__shared_weak_count *)((char *)v27 - 8);
          }
          uint64_t *v18 = v27;
          *((void *)v9 + 13) = p_shared_owners;
          *((void *)v9 + 14) = v25 + 8 * v26;
          if (inited) {
            operator delete(inited);
          }
        }
        else
        {
          *(void *)double v19 = *v16;
          p_shared_owners = (uint64_t *)(v19 + 8);
        }
        *((void *)v9 + 13) = p_shared_owners;
        ++v16;
        double v19 = (char *)p_shared_owners;
      }
      while (v16 != (std::__shared_weak_count_vtbl **)v17);
    }
    uint64_t v29 = v14[4];
    if (v29) {
      double v30 = (uint64_t *)(v29 + 8);
    }
    else {
      double v30 = 0;
    }
    v73 = v14;
    uint64_t v31 = *((int *)v14 + 6);
    if (v31)
    {
      v76 = &v30[v31];
      do
      {
        uint64_t v32 = *v30;
        long long v80 = 0uLL;
        unint64_t v81 = 0;
        uint64_t v33 = *(void *)(v32 + 24);
        if (v33) {
          double v34 = (void *)(v33 + 8);
        }
        else {
          double v34 = 0;
        }
        if (v33) {
          uint64_t v35 = v33 + 8 + 8 * *(int *)(v32 + 16);
        }
        else {
          uint64_t v35 = 0;
        }
        if (v34 == (void *)v35)
        {
          uint64_t v36 = 0;
        }
        else
        {
          uint64_t v36 = 0;
          unint64_t v37 = 0;
          v38 = 0;
          do
          {
            if ((unint64_t)v38 >= v37)
            {
              uint64_t v40 = (v38 - v36) >> 3;
              unint64_t v41 = v40 + 1;
              if ((unint64_t)(v40 + 1) >> 61)
              {
                unint64_t v81 = v37;
                *(void *)&long long v80 = v36;
                std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
              }
              if ((uint64_t)(v37 - (void)v36) >> 2 > v41) {
                unint64_t v41 = (uint64_t)(v37 - (void)v36) >> 2;
              }
              if (v37 - (unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v42 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v42 = v41;
              }
              if (v42) {
                unint64_t v42 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v42);
              }
              else {
                uint64_t v43 = 0;
              }
              double v44 = (char *)(v42 + 8 * v40);
              *(void *)double v44 = *v34;
              double v39 = v44 + 8;
              while (v38 != v36)
              {
                uint64_t v45 = *((void *)v38 - 1);
                v38 -= 8;
                *((void *)v44 - 1) = v45;
                v44 -= 8;
              }
              unint64_t v37 = v42 + 8 * v43;
              *((void *)&v80 + 1) = v39;
              if (v36) {
                operator delete(v36);
              }
              uint64_t v36 = v44;
            }
            else
            {
              *(void *)v38 = *v34;
              double v39 = v38 + 8;
            }
            *((void *)&v80 + 1) = v39;
            ++v34;
            v38 = v39;
          }
          while (v34 != (void *)v35);
          unint64_t v81 = v37;
          *(void *)&long long v80 = v36;
        }
        id v9 = (char *)v78;
        double v46 = (std::__shared_weak_count *)v78[16];
        if ((unint64_t)v46 >= v78[17])
        {
          inited = (std::__shared_weak_count *)std::vector<std::vector<double>>::__push_back_slow_path<std::vector<double> const&>(v78 + 15, (uint64_t)&v80);
        }
        else
        {
          std::vector<std::vector<double>>::__construct_one_at_end[abi:ne180100]<std::vector<double> const&>((uint64_t)(v78 + 15), (uint64_t)&v80);
          inited = v46 + 1;
        }
        v78[16] = (uint64_t)inited;
        if (v36)
        {
          *((void *)&v80 + 1) = v36;
          operator delete(v36);
        }
        ++v30;
      }
      while (v30 != v76);
    }
    if (*(_DWORD *)(*(void *)v79 + 44) == 400)
    {
      uint64_t v47 = *(uint64_t **)(*(void *)v79 + 32);
      id v8 = v74;
      uint64_t v48 = v77;
    }
    else
    {
      id v8 = v74;
      uint64_t v48 = v77;
      inited = (std::__shared_weak_count *)CoreML::Specification::protobuf_GLMClassifier_2eproto::InitDefaults((CoreML::Specification::protobuf_GLMClassifier_2eproto *)inited);
      uint64_t v47 = &CoreML::Specification::_GLMClassifier_default_instance_;
    }
    int v49 = *((_DWORD *)v47 + 21);
    uint64_t v50 = v73;
    if (v49 == 101)
    {
      uint64_t v61 = 0;
      uint64_t v52 = 1;
      while (1)
      {
        if (*(_DWORD *)(*(void *)v79 + 44) == 400)
        {
          v62 = *(uint64_t **)(*(void *)v79 + 32);
        }
        else
        {
          inited = (std::__shared_weak_count *)CoreML::Specification::protobuf_GLMClassifier_2eproto::InitDefaults((CoreML::Specification::protobuf_GLMClassifier_2eproto *)inited);
          v62 = &CoreML::Specification::_GLMClassifier_default_instance_;
        }
        if (*((_DWORD *)v62 + 21) == 101)
        {
          v63 = (uint64_t *)v62[9];
        }
        else
        {
          inited = (std::__shared_weak_count *)CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults((CoreML::Specification::protobuf_DataStructures_2eproto *)inited);
          v63 = &CoreML::Specification::_Int64Vector_default_instance_;
        }
        if (v61 >= *((int *)v63 + 4)) {
          break;
        }
        if (*(_DWORD *)(*(void *)v79 + 44) == 400)
        {
          uint64_t v64 = *(uint64_t **)(*(void *)v79 + 32);
        }
        else
        {
          inited = (std::__shared_weak_count *)CoreML::Specification::protobuf_GLMClassifier_2eproto::InitDefaults((CoreML::Specification::protobuf_GLMClassifier_2eproto *)inited);
          uint64_t v64 = &CoreML::Specification::_GLMClassifier_default_instance_;
        }
        if (*((_DWORD *)v64 + 21) == 101)
        {
          v65 = (uint64_t *)v64[9];
        }
        else
        {
          CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults((CoreML::Specification::protobuf_DataStructures_2eproto *)inited);
          v65 = &CoreML::Specification::_Int64Vector_default_instance_;
        }
        uint64_t v66 = *(void *)(v65[3] + 8 * v61 + 8);
        v67 = (void *)v78[18];
        v68 = +[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", v66, v72);
        [v67 addObject:v68];

        v69 = [NSNumber numberWithLongLong:v66];
        [v77 addObject:v69];

        ++v61;
      }
      id v9 = (char *)v78;
    }
    else
    {
      if (v49 != 100)
      {
LABEL_110:
        *((_DWORD *)v9 + 40) = *((_DWORD *)v50 + 15);
        *((_DWORD *)v9 + 41) = *((_DWORD *)v50 + 16);
        id v70 = objc_msgSend(v9, "modelDescription", v72);
        [v70 setClassLabels:v48];

        goto LABEL_111;
      }
      uint64_t v51 = 0;
      uint64_t v52 = 3;
      while (1)
      {
        if (*(_DWORD *)(*(void *)v79 + 44) == 400)
        {
          uint64_t v53 = *(uint64_t **)(*(void *)v79 + 32);
        }
        else
        {
          inited = (std::__shared_weak_count *)CoreML::Specification::protobuf_GLMClassifier_2eproto::InitDefaults((CoreML::Specification::protobuf_GLMClassifier_2eproto *)inited);
          uint64_t v53 = &CoreML::Specification::_GLMClassifier_default_instance_;
        }
        if (*((_DWORD *)v53 + 21) == 100)
        {
          v54 = (uint64_t *)v53[9];
        }
        else
        {
          inited = (std::__shared_weak_count *)CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults((CoreML::Specification::protobuf_DataStructures_2eproto *)inited);
          v54 = &CoreML::Specification::_StringVector_default_instance_;
        }
        if (v51 >= *((int *)v54 + 6)) {
          break;
        }
        if (*(_DWORD *)(*(void *)v79 + 44) == 400)
        {
          v55 = *(uint64_t **)(*(void *)v79 + 32);
        }
        else
        {
          inited = (std::__shared_weak_count *)CoreML::Specification::protobuf_GLMClassifier_2eproto::InitDefaults((CoreML::Specification::protobuf_GLMClassifier_2eproto *)inited);
          v55 = &CoreML::Specification::_GLMClassifier_default_instance_;
        }
        if (*((_DWORD *)v55 + 21) == 100)
        {
          v56 = (uint64_t *)v55[9];
        }
        else
        {
          CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults((CoreML::Specification::protobuf_DataStructures_2eproto *)inited);
          v56 = &CoreML::Specification::_StringVector_default_instance_;
        }
        uint64_t v57 = *(uint64_t **)(v56[4] + 8 * v51 + 8);
        if (*((char *)v57 + 23) < 0) {
          uint64_t v57 = (uint64_t *)*v57;
        }
        v58 = objc_msgSend(NSString, "stringWithUTF8String:", v57, v72);
        uint64_t v59 = (void *)*((void *)v9 + 18);
        uint64_t v60 = +[MLFeatureValue featureValueWithString:v58];
        [v59 addObject:v60];

        [v77 addObject:v58];
        ++v51;
      }
    }
    *((void *)v9 + 19) = v52;
    uint64_t v50 = v73;
    id v8 = v74;
    uint64_t v48 = v77;
    goto LABEL_110;
  }
LABEL_111:

  return (MLGLMClassification *)v9;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = (void *)[objc_alloc((Class)a1) initWithSpecification:a3 configuration:v8 error:a5];

  return v9;
}

@end