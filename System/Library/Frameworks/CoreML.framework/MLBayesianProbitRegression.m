@interface MLBayesianProbitRegression
+ (BOOL)setFeatureName:(id *)a3 to:(id)a4 descriptions:(id)a5;
+ (BOOL)validateModelDescription:(id)a3;
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
+ (id)modelWithContentsOfURL:(id)a3 error:(id *)a4;
- (BOOL)convertOutputFeatureToPredictionValues:(id)a3 event:(BOOL *)a4 importance:(double *)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBopr:(id)a3;
- (BOOL)setFeatureCount:(unint64_t)a3;
- (BOOL)setInputFeatureName:(id *)a3 to:(id)a4;
- (BOOL)setOutputFeatureName:(id *)a3 to:(id)a4;
- (BOOL)updateModelFromFeatures:(id)a3 toTarget:(id)a4 error:(id *)a5;
- (BOOL)updateModelFromFeatures:(id)a3 toTarget:(id)a4 options:(id)a5 error:(id *)a6;
- (MLBayesianProbitRegression)initWithDescription:(id)a3 numberOfFeatures:(int64_t)a4 priorMean:(id)a5;
- (MLBayesianProbitRegression)initWithDescription:(id)a3 numberOfFeatures:(int64_t)a4 priorMean:(id)a5 regressionInputName:(id)a6 optimismInputName:(id)a7 samplingScaleInputName:(id)a8 samplingTruncationInputName:(id)a9 meanOutputName:(id)a10 varianceOutputName:(id)a11 pessimisticProbabilityOutputName:(id)a12 sampledProbabilityOutputName:(id)a13;
- (MLBayesianProbitRegression)initWithSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (double)getFeatureValue:(id)a3 forName:(id)a4 withType:(int64_t)a5;
- (double)getOptimism:(id)a3;
- (double)getSamplingScale:(id)a3;
- (double)getSamplingTruncation:(id)a3;
- (id).cxx_construct;
- (id)createRegressorResult:(Prediction *)a3;
- (id)getArrayFeatureValue:(id)a3;
- (id)regress:(id)a3 options:(id)a4 error:(id *)a5;
- (shared_ptr<CoreML::BayesianProbitRegression::BayesianProbitRegression>)model;
- (shared_ptr<CoreML::BayesianProbitRegression::FeatureValues>)getOneHotFeatureValues:(id)a3 error:(id *)a4;
- (unint64_t)FeatureCount;
- (void)reset;
- (void)saveModelToSpecification:(id *)a3;
@end

@implementation MLBayesianProbitRegression

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplingTruncationInputFeatureName, 0);
  objc_storeStrong((id *)&self->_samplingScaleInputFeatureName, 0);
  objc_storeStrong((id *)&self->_sampledProbabilityOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_pessimisticProbabilityOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_varianceOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_meanOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_optimismInputFeatureName, 0);
  objc_storeStrong((id *)&self->_regressionInputFeatureName, 0);
  cntrl = self->_model.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)reset
{
}

- (BOOL)isEqualToBopr:(id)a3
{
  v4 = (MLBayesianProbitRegression *)a3;
  if (self == v4)
  {
LABEL_10:
    BOOL v9 = 1;
    goto LABEL_26;
  }
  v5 = [(MLModel *)self modelDescription];
  v6 = [(MLModel *)v4 modelDescription];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0) {
    goto LABEL_25;
  }
  [(MLBayesianProbitRegression *)self model];
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  if (v4)
  {
    [(MLBayesianProbitRegression *)v4 model];
    uint64_t v8 = v15;
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (!(v8 | v15)) {
    goto LABEL_10;
  }
  BOOL v9 = 0;
  if (v8)
  {
    if (v15)
    {
      BOOL v9 = 0;
      if (*(double *)(v8 + 48) == *(double *)(v15 + 48) && *(double *)(v8 + 56) == *(double *)(v15 + 56))
      {
        if (*(void *)(v8 + 32) == *(void *)(v15 + 32))
        {
          v10 = (double *)(v8 + 24);
          do
          {
            v10 = *(double **)v10;
            BOOL v9 = v10 == 0;
            if (!v10) {
              break;
            }
            unint64_t v11 = *((void *)v10 + 2);
            v12 = (double *)std::__hash_table<std::__hash_value_type<unsigned long long,CoreML::BayesianProbitRegression::Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CoreML::BayesianProbitRegression::Gaussian>,CoreML::BayesianProbitRegression::SuperHasher,CoreML::BayesianProbitRegression::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CoreML::BayesianProbitRegression::Gaussian>,CoreML::BayesianProbitRegression::SuperHasher,CoreML::BayesianProbitRegression::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,CoreML::BayesianProbitRegression::Gaussian>>>::find<unsigned long long>((void *)(v15 + 8), v11);
            if (!v12 || v11 != *((void *)v12 + 2)) {
              goto LABEL_25;
            }
            BOOL v9 = 0;
          }
          while (v10[3] == v12[3] && v10[4] == v12[4]);
          goto LABEL_26;
        }
LABEL_25:
        BOOL v9 = 0;
      }
    }
  }
LABEL_26:

  return v9;
}

- (shared_ptr<CoreML::BayesianProbitRegression::BayesianProbitRegression>)model
{
  cntrl = self->_model.__cntrl_;
  *v2 = self->_model.__ptr_;
  v2[1] = (BayesianProbitRegression *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (BayesianProbitRegression *)self;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MLBayesianProbitRegression *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(MLBayesianProbitRegression *)self isEqualToBopr:v5];

  return v6;
}

- (BOOL)updateModelFromFeatures:(id)a3 toTarget:(id)a4 error:(id *)a5
{
  id v8 = a4;
  [(MLBayesianProbitRegression *)self getOneHotFeatureValues:a3 error:a5];
  if (!v43) {
    goto LABEL_28;
  }
  unsigned __int8 v42 = 0;
  double v41 = 1.0;
  if (![(MLBayesianProbitRegression *)self convertOutputFeatureToPredictionValues:v8 event:&v42 importance:&v41 error:a5])goto LABEL_28; {
  ptr = self->_model.__ptr_;
  }
  uint64_t v10 = v43;
  int v11 = v42;
  double v12 = v41;
  pthread_rwlock_wrlock((pthread_rwlock_t *)((char *)ptr + 88));
  uint64_t v13 = *(unsigned int *)(v10 + 8);
  unint64_t v14 = *(void *)ptr;
  if (*(void *)ptr == v13)
  {
    __p = 0;
    v54 = 0;
    uint64_t v55 = 0;
    if (1.0 - v12 >= 0.5 && 1.0 - v12 <= 1.0) {
      double v16 = 1.0 - v12;
    }
    else {
      double v16 = 1.0;
    }
    v50 = 0;
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    v47 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    CoreML::BayesianProbitRegression::BayesianProbitRegression::GetGaussiansAndBias((uint64_t)ptr, v10, (uint64_t)&__p, (uint64_t)&v50, (uint64_t)&v47);
    double v45 = 0.0;
    double __C = 0.0;
    v17 = v50;
    vDSP_Length v18 = (v51 - (uint64_t)v50) >> 3;
    vDSP_sveD(v50, 1, &__C, v18);
    v19 = v47;
    vDSP_sveD(v47, 1, &v45, (v48 - (uint64_t)v47) >> 3);
    double v21 = v45 + (double)*(void *)ptr;
    double v22 = sqrt(v21);
    double v23 = 1.0 / v22;
    if (v11) {
      double v24 = 1.0;
    }
    else {
      double v24 = -1.0;
    }
    double v25 = v24 * __C;
    double v26 = v24 * __C * v23;
    CoreML::BayesianProbitRegression::Gaussian::stdNormalCDF(v20, v26);
    double v28 = -(v25 * v23);
    if (v27 >= 1.0e-300)
    {
      double v30 = exp(v26 * v28 * 0.5) / 2.50662827 / v27;
      double v29 = v16 * (v24 * v30) / v22;
    }
    else
    {
      double v29 = v16 * (v24 * v28) / v22;
      double v30 = v28;
    }
    if (v30 == v28) {
      double v31 = 1.0;
    }
    else {
      double v31 = v30 * (v30 + v26);
    }
    double v32 = v16 * v31 / v21;
    v33 = __p;
    if (v54 != __p)
    {
      unint64_t v34 = 0;
      do
      {
        CoreML::BayesianProbitRegression::BayesianProbitRegression::setWeight((CoreML::BayesianProbitRegression::BayesianProbitRegression *)ptr, v33[v34], v17[v34] + v19[v34] * v29, 1.0 / (v19[v34] * (1.0 - v19[v34] * v32)));
        ++v34;
        v33 = __p;
      }
      while (v34 < (v54 - (unsigned char *)__p) >> 3);
    }
    uint64_t v35 = 8 * v18 - 8;
    double v36 = *(double *)((char *)v19 + v35);
    double v37 = *(double *)((char *)v17 + v35) + v36 * v29;
    double v38 = 1.0 / (v36 * (1.0 - v36 * v32));
    *((double *)ptr + 6) = v38;
    *((double *)ptr + 7) = v37 * v38;
    operator delete(v19);
    operator delete(v17);
    if (__p)
    {
      v54 = __p;
      operator delete(__p);
    }
  }
  pthread_rwlock_unlock((pthread_rwlock_t *)((char *)ptr + 88));
  if (v14 == v13)
  {
    BOOL v39 = 1;
    goto LABEL_29;
  }
  if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:@"updateModelFromFeatures failed"];
    BOOL v39 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_28:
    BOOL v39 = 0;
  }
LABEL_29:
  if (v44) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v44);
  }

  return v39;
}

- (BOOL)updateModelFromFeatures:(id)a3 toTarget:(id)a4 options:(id)a5 error:(id *)a6
{
  return [(MLBayesianProbitRegression *)self updateModelFromFeatures:a3 toTarget:a4 error:a6];
}

- (BOOL)convertOutputFeatureToPredictionValues:(id)a3 event:(BOOL *)a4 importance:(double *)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v9 = [v8 featureNames];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    int v11 = 0;
    int v12 = 0;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = [v8 featureValueForName:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        double v16 = v15;
        if (v15)
        {
          uint64_t v17 = [v15 type];
          if (v17 == 1)
          {
            *a4 = [v16 int64Value] != 0;
            ++v12;
          }
          else
          {
            if (v17 != 2)
            {
              if (a6)
              {
                *a6 = +[MLModelErrorUtils genericErrorWithFormat:@"invalid prediction feature type"];
              }

              goto LABEL_22;
            }
            [v16 doubleValue];
            *(void *)a5 = v18;
            ++v11;
          }
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }

    if (v12 == 1 && v11 < 2)
    {
      BOOL v19 = 1;
      goto LABEL_23;
    }
  }
  else
  {
  }
  if (a6)
  {
    +[MLModelErrorUtils genericErrorWithFormat:@"invalid prediction features"];
    BOOL v19 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_22:
    BOOL v19 = 0;
  }
LABEL_23:

  return v19;
}

- (id)regress:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v70, v10, 25, -[MLModel signpostID](self, "signpostID"), [v9 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v11 = [(MLModel *)self signpostID];
  uint64_t v12 = [v9 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__MLBayesianProbitRegression_regress_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  uint64_t v13 = (void (**)(void))_Block_copy(aBlock);
  [(MLBayesianProbitRegression *)self getOneHotFeatureValues:v8 error:a5];
  if (v67)
  {
    [(MLBayesianProbitRegression *)self getOptimism:v8];
    double v15 = v14;
    [(MLBayesianProbitRegression *)self getSamplingScale:v8];
    double v17 = v16;
    [(MLBayesianProbitRegression *)self getSamplingTruncation:v8];
    double v19 = v18;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v64 = 0u;
    ptr = self->_model.__ptr_;
    double v21 = (pthread_rwlock_t *)((char *)ptr + 88);
    pthread_rwlock_rdlock((pthread_rwlock_t *)((char *)ptr + 88));
    if (*(void *)ptr == *(_DWORD *)(v67 + 8))
    {
      v76 = 0;
      uint64_t v77 = 0;
      uint64_t v78 = 0;
      v73 = 0;
      uint64_t v74 = 0;
      uint64_t v75 = 0;
      CoreML::BayesianProbitRegression::BayesianProbitRegression::GetGaussiansAndBias((uint64_t)ptr, v67, 0, (uint64_t)&v76, (uint64_t)&v73);
      double __C = 0.0;
      double v71 = 0.0;
      long long v22 = v76;
      vDSP_sveD(v76, 1, &__C, (v77 - (uint64_t)v76) >> 3);
      long long v23 = v73;
      vDSP_sveD(v73, 1, &v71, (v74 - (uint64_t)v73) >> 3);
      double v25 = v71;
      double v26 = sqrt(v71 + (double)*(void *)ptr);
      double v27 = 1.0 / v26;
      if (v17 > 0.0 || (double v28 = 0.5, v29 = v71, v19 > 0.0))
      {
        double v61 = 1.0 / v26;
        double v62 = v15;
        int v30 = 0;
        if (v17 <= 0.0) {
          double v31 = 1.0;
        }
        else {
          double v31 = v17;
        }
        double v60 = v71;
        double v32 = __C;
        double v33 = sqrt(v31 * v31 * v71);
        BOOL v34 = v19 > 0.0;
        double v35 = __C + v33 * v19;
        if (v19 <= 0.0) {
          double v36 = -1.79769313e308;
        }
        else {
          double v36 = __C - v33 * v19;
        }
        if (v34) {
          double v37 = v35;
        }
        else {
          double v37 = 1.79769313e308;
        }
        double v63 = v37;
        while (1)
        {
          do
          {
            uint32_t v38 = arc4random();
            uint32_t v39 = arc4random();
            double v40 = ((double)v38 + (double)v38) / 4294967300.0 + -1.0;
            double v41 = ((double)v39 + (double)v39) / 4294967300.0 + -1.0;
            double v42 = v41 * v41;
            double v43 = v42 + v40 * v40;
          }
          while (v43 == 0.0 || v43 > 1.0);
          double v46 = v32 + v40 * sqrt(log(v42 + v40 * v40) * -2.0 / v43) * v33;
          if (v46 >= v36 && v46 <= v63) {
            break;
          }
          if (++v30 == 20)
          {
            double v45 = (CoreML::BayesianProbitRegression::Gaussian *)arc4random();
            double v46 = v36 + (double)v45 / 4294967300.0 * (v63 - v36);
            break;
          }
        }
        double v27 = v61;
        CoreML::BayesianProbitRegression::Gaussian::stdNormalCDF(v45, v61 * v46);
        double v28 = v48;
        double v29 = v71;
        double v15 = v62;
        double v25 = v60;
      }
      double v49 = __C;
      CoreML::BayesianProbitRegression::Gaussian::stdNormalCDF(v24, v27 * (__C + v15 * sqrt(v25)));
      *((void *)&v65 + 1) = v50;
      CoreML::BayesianProbitRegression::Gaussian::stdNormalCDF(v51, v27 * v49);
      *(double *)&long long v64 = v49;
      *((double *)&v64 + 1) = v29;
      *(void *)&long long v65 = v52;
      *(double *)&long long v66 = v28;
      BYTE8(v66) = 1;
      if (v23) {
        operator delete(v23);
      }
      if (v22) {
        operator delete(v22);
      }
    }
    else
    {
      __asm { FMOV            V1.2D, #0.5 }
      long long v64 = xmmword_19EC7B8A0;
      long long v65 = _Q1;
      *(void *)&long long v66 = 0x3FE0000000000000;
      BYTE8(v66) = 0;
    }
    pthread_rwlock_unlock(v21);
    v53 = [(MLBayesianProbitRegression *)self createRegressorResult:&v64];
  }
  else
  {
    v53 = 0;
  }
  if (v68) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v68);
  }
  v13[2](v13);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v70);

  return v53;
}

uint64_t __52__MLBayesianProbitRegression_regress_options_error___block_invoke()
{
  return kdebug_trace();
}

- (double)getSamplingTruncation:(id)a3
{
  [(MLBayesianProbitRegression *)self getFeatureValue:a3 forName:self->_samplingTruncationInputFeatureName withType:2];
  return result;
}

- (double)getSamplingScale:(id)a3
{
  [(MLBayesianProbitRegression *)self getFeatureValue:a3 forName:self->_samplingScaleInputFeatureName withType:2];
  return result;
}

- (double)getOptimism:(id)a3
{
  [(MLBayesianProbitRegression *)self getFeatureValue:a3 forName:self->_optimismInputFeatureName withType:2];
  return result;
}

- (double)getFeatureValue:(id)a3 forName:(id)a4 withType:(int64_t)a5
{
  BOOL v6 = [a3 featureValueForName:a4];
  char v7 = v6;
  double v8 = 0.0;
  if (v6 && [v6 type] == a5)
  {
    [v7 doubleValue];
    double v8 = v9;
  }

  return v8;
}

- (id)createRegressorResult:(Prediction *)a3
{
  v5 = [[MLMultiArray alloc] initWithShape:&unk_1EF11AAF0 dataType:65600 error:0];
  BOOL v6 = [NSNumber numberWithDouble:a3->var2];
  [(MLMultiArray *)v5 setObject:v6 atIndexedSubscript:0];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (self->_meanOutputFeatureName)
  {
    double v8 = +[MLFeatureValue featureValueWithDouble:a3->var0];
    [v7 setObject:v8 forKeyedSubscript:self->_meanOutputFeatureName];
  }
  if (self->_varianceOutputFeatureName)
  {
    double v9 = +[MLFeatureValue featureValueWithDouble:a3->var1];
    [v7 setObject:v9 forKeyedSubscript:self->_varianceOutputFeatureName];
  }
  if (self->_pessimisticProbabilityOutputFeatureName)
  {
    uint64_t v10 = +[MLFeatureValue featureValueWithDouble:a3->var3];
    [v7 setObject:v10 forKeyedSubscript:self->_pessimisticProbabilityOutputFeatureName];
  }
  if (self->_sampledProbabilityOutputFeatureName)
  {
    unint64_t v11 = +[MLFeatureValue featureValueWithDouble:a3->var4];
    [v7 setObject:v11 forKeyedSubscript:self->_sampledProbabilityOutputFeatureName];
  }
  uint64_t v12 = [[MLDictionaryFeatureProvider alloc] initWithFeatureValueDictionary:v7];
  uint64_t v13 = +[MLRegressorResult resultWithValue:v5 additionalFeatures:v12];

  return v13;
}

- (shared_ptr<CoreML::BayesianProbitRegression::FeatureValues>)getOneHotFeatureValues:(id)a3 error:(id *)a4
{
  id v7 = v4;
  id v8 = a3;
  id v42 = v8;
  if (self->_regressionInputFeatureName)
  {
    double v9 = objc_msgSend(v8, "featureValueForName:");
    goto LABEL_8;
  }
  uint64_t v10 = [(MLBayesianProbitRegression *)self getArrayFeatureValue:v8];
  unint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  int v12 = [v10 isEqual:v11];

  if (!v12)
  {
    double v9 = v10;
LABEL_8:
    if ([v9 type] == 5)
    {
      uint64_t v13 = [v9 multiArrayValue];
      if ([v13 dataType] == 131104)
      {
        double v14 = [v9 multiArrayValue];
        double v15 = [v14 shape];
        uint64_t v16 = [v15 count];

        if (v16 == 1)
        {
          double v17 = [v9 multiArrayValue];
          double v18 = [v17 shape];
          if ([v18 count] == 1)
          {
            double v40 = [v9 multiArrayValue];
            double v19 = [v40 shape];
            v20 = [v19 objectAtIndex:0];
            int v21 = [v20 intValue];
            uint64_t v22 = *(void *)self->_model.__ptr_;

            if (v22 == v21)
            {
              double v41 = [v9 multiArrayValue];
              long long v23 = [v41 shape];
              uint64_t v24 = [v23 count];
              double v25 = [v9 multiArrayValue];
              double v26 = [v25 shape];
              double v27 = [v26 objectAtIndex:0];
              int v28 = [v27 intValue];
              id v29 = [v9 multiArrayValue];
              uint64_t v30 = [v29 bytes];
              double v31 = operator new(0x30uLL);
              v31[1] = 0;
              v31[2] = 0;
              *double v31 = &unk_1EF0DD7D8;
              v31[3] = v30;
              *((_DWORD *)v31 + 8) = v28;
              v31[5] = v24;
              if (v24 != 1)
              {
                exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
                std::logic_error::logic_error(exception, "sparse features not yet supported");
                exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4E8] + 16);
                __cxa_throw(exception, (struct type_info *)off_1E59A3028, MEMORY[0x1E4FBA1E8]);
              }
              *id v7 = v31 + 3;
              v7[1] = v31;

              goto LABEL_20;
            }
          }
          else
          {
          }
          double v35 = [v9 multiArrayValue];
          double v36 = [v35 shape];
          double v37 = [v36 objectAtIndex:0];
          uint64_t v38 = [v37 intValue];

          if (a4)
          {
            double v32 = +[MLModelErrorUtils genericErrorWithFormat:@"incorrect number of features: expected %d but got %d", *(void *)self->_model.__ptr_, v38];
            goto LABEL_18;
          }
          goto LABEL_19;
        }
      }
      else
      {
      }
    }
    if (a4)
    {
      double v32 = +[MLModelErrorUtils genericErrorWithFormat:@"require feature type of MLMultiArray with one of Int32 values"];
LABEL_18:
      *a4 = v32;
    }
LABEL_19:
    *id v7 = 0;
    v7[1] = 0;
LABEL_20:
    uint64_t v10 = v9;
    goto LABEL_21;
  }
  if (a4)
  {
    *a4 = +[MLModelErrorUtils genericErrorWithFormat:@"no features"];
  }
  *id v7 = 0;
  v7[1] = 0;
LABEL_21:

  result.var1 = v34;
  result.var0 = v33;
  return result;
}

- (id)getArrayFeatureValue:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = objc_msgSend(v3, "featureNames", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v4);
      }
      id v8 = [v3 featureValueForName:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
      if ([v8 type] == 5) {
        break;
      }

      if (v5 == ++v7)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v8 = 0;
  }

  return v8;
}

- (MLBayesianProbitRegression)initWithDescription:(id)a3 numberOfFeatures:(int64_t)a4 priorMean:(id)a5
{
  return [(MLBayesianProbitRegression *)self initWithDescription:a3 numberOfFeatures:a4 priorMean:a5 regressionInputName:0 optimismInputName:0 samplingScaleInputName:0 samplingTruncationInputName:0 meanOutputName:0 varianceOutputName:0 pessimisticProbabilityOutputName:0 sampledProbabilityOutputName:0];
}

- (MLBayesianProbitRegression)initWithDescription:(id)a3 numberOfFeatures:(int64_t)a4 priorMean:(id)a5 regressionInputName:(id)a6 optimismInputName:(id)a7 samplingScaleInputName:(id)a8 samplingTruncationInputName:(id)a9 meanOutputName:(id)a10 varianceOutputName:(id)a11 pessimisticProbabilityOutputName:(id)a12 sampledProbabilityOutputName:(id)a13
{
  id v18 = a3;
  id v37 = a5;
  id v36 = a6;
  id v35 = a7;
  id v34 = a8;
  double v19 = self;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  if (+[MLBayesianProbitRegression validateModelDescription:v18])
  {
    v39.receiver = self;
    v39.super_class = (Class)MLBayesianProbitRegression;
    double v25 = [(MLModel *)&v39 initWithDescription:v18];
    if (v25)
    {
      _ZNSt3__115allocate_sharedB8ne180100IN6CoreML24BayesianProbitRegression24BayesianProbitRegressionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v38);
      double v26 = (CoreML::BayesianProbitRegression::BayesianProbitRegression *)v38;
      double v27 = (std::__shared_weak_count *)*((void *)v25 + 11);
      *((_OWORD *)v25 + 5) = v38;
      if (v27)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v27);
        int v28 = (CoreML::BayesianProbitRegression::BayesianProbitRegression *)*((void *)v25 + 10);
      }
      else
      {
        int v28 = v26;
      }
      objc_msgSend(v37, "doubleValue", a4);
      CoreML::BayesianProbitRegression::BayesianProbitRegression::initializeFeatures(v28, v33, v30);
      [v25 setInputFeatureName:v25 + 96 to:v36];
      [v25 setInputFeatureName:v25 + 104 to:v35];
      [v25 setInputFeatureName:v25 + 144 to:v34];
      [v25 setInputFeatureName:v25 + 152 to:v20];
      [v25 setOutputFeatureName:v25 + 112 to:v21];
      [v25 setOutputFeatureName:v25 + 120 to:v22];
      [v25 setOutputFeatureName:v25 + 128 to:v23];
      [v25 setOutputFeatureName:v25 + 136 to:v24];
    }
    double v19 = v25;
    id v29 = v19;
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (MLBayesianProbitRegression)initWithSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (*(_DWORD *)(*(void *)a3 + 44) == 304)
  {
    v52.receiver = self;
    v52.super_class = (Class)MLBayesianProbitRegression;
    double v9 = [(MLRegressor *)&v52 initDescriptionOnlyWithSpecification:a3 configuration:v8 error:a5];
    if (v9)
    {
      std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model&,void>((CoreML::Specification::Model **)&v50, *(const CoreML::Specification::Model **)a3);
      _ZNSt3__115allocate_sharedB8ne180100IN6CoreML24BayesianProbitRegression24BayesianProbitRegressionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v49);
      long long v10 = v9[11];
      *((_OWORD *)v9 + 5) = v49;
      if (v10) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v10);
      }
      long long v11 = v9[10];
      long long v12 = (CoreML::Specification::Model *)v50;
      long long v13 = v51;
      if (v51) {
        atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      id v48 = v8;
      if (*((_DWORD *)v12 + 11) == 304)
      {
        double v14 = (uint64_t *)*((void *)v12 + 4);
      }
      else
      {
        CoreML::Specification::protobuf_BayesianProbitRegressor_2eproto::InitDefaults((CoreML::Specification::protobuf_BayesianProbitRegressor_2eproto *)v10);
        double v14 = &CoreML::Specification::_BayesianProbitRegressor_default_instance_;
      }
      v11->__vftable = (std::__shared_weak_count_vtbl *)*((unsigned int *)v14 + 28);
      uint64_t v16 = v14[4];
      if (v16) {
        double v17 = (uint64_t *)(v16 + 8);
      }
      else {
        double v17 = 0;
      }
      uint64_t v18 = *((int *)v14 + 6);
      if (v18)
      {
        unint64_t v19 = 0;
        uint64_t v20 = 8 * v18;
        do
        {
          uint64_t v21 = *v17++;
          v19 += *(int *)(v21 + 24);
          v20 -= 8;
        }
        while (v20);
        float v22 = (float)v19;
      }
      else
      {
        float v22 = 0.0;
      }
      std::__hash_table<std::shared_ptr<MIL::Builder::OperationBuilder>,std::hash<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::equal_to<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::allocator<std::shared_ptr<MIL::Builder::OperationBuilder>>>::__rehash<true>((uint64_t)&v11->__shared_owners_, vcvtps_u32_f32(v22 / *(float *)&v11[1].__shared_weak_owners_));
      uint64_t v24 = v14[4];
      if (v24) {
        uint64_t v25 = v24 + 8;
      }
      else {
        uint64_t v25 = 0;
      }
      uint64_t v26 = *((int *)v14 + 6);
      if (v26)
      {
        uint64_t v27 = v25 + 8 * v26;
        do
        {
          uint64_t v28 = *(void *)v25;
          uint64_t v29 = *(void *)(*(void *)v25 + 32);
          if (v29) {
            uint64_t v30 = v29 + 8;
          }
          else {
            uint64_t v30 = 0;
          }
          uint64_t v31 = *(int *)(v28 + 24);
          if (v31)
          {
            unint64_t v32 = (unint64_t)*(unsigned int *)(v28 + 40) << 32;
            uint64_t v33 = 8 * v31;
            do
            {
              id v34 = *(uint64_t **)(*(void *)v30 + 16);
              if (!v34) {
                id v34 = &CoreML::Specification::_BayesianProbitRegressor_Gaussian_default_instance_;
              }
              CoreML::BayesianProbitRegression::BayesianProbitRegression::setWeight((CoreML::BayesianProbitRegression::BayesianProbitRegression *)v11, v32 | *(unsigned int *)(*(void *)v30 + 24), *((double *)v34 + 2), *((double *)v34 + 3));
              v30 += 8;
              v33 -= 8;
            }
            while (v33);
          }
          v25 += 8;
        }
        while (v25 != v27);
      }
      id v35 = (uint64_t *)v14[13];
      if (!v35) {
        id v35 = &CoreML::Specification::_BayesianProbitRegressor_Gaussian_default_instance_;
      }
      double v36 = *((double *)v35 + 3);
      *(double *)&uint64_t v37 = *((double *)v35 + 2) * v36;
      *(double *)&v11[2].__vftable = v36;
      v11[2].__shared_owners_ = v37;
      *(double *)&v11[3].__shared_owners_ = *(double *)&v37 / v36;
      if (v13) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v13);
      }
      id v8 = v48;
      if (*((_DWORD *)v50 + 11) == 304)
      {
        long long v38 = v50[4];
      }
      else
      {
        CoreML::Specification::protobuf_BayesianProbitRegressor_2eproto::InitDefaults(v23);
        long long v38 = (uint64_t **)&CoreML::Specification::_BayesianProbitRegressor_default_instance_;
      }
      objc_super v39 = getString(v38[5]);
      [v9 setInputFeatureName:v9 + 12 to:v39];

      double v40 = getString(v38[6]);
      [v9 setInputFeatureName:v9 + 13 to:v40];

      double v41 = getString(v38[7]);
      [v9 setInputFeatureName:v9 + 18 to:v41];

      id v42 = getString(v38[8]);
      [v9 setInputFeatureName:v9 + 19 to:v42];

      double v43 = getString(v38[9]);
      [v9 setOutputFeatureName:v9 + 14 to:v43];

      v44 = getString(v38[10]);
      [v9 setOutputFeatureName:v9 + 15 to:v44];

      double v45 = getString(v38[11]);
      [v9 setOutputFeatureName:v9 + 16 to:v45];

      double v46 = getString(v38[12]);
      [v9 setOutputFeatureName:v9 + 17 to:v46];

      if (v51) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v51);
      }
    }
    self = v9;
    uint64_t v15 = self;
  }
  else if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:@"Interface type is not a Bayesian Online Probit Regressor"];
    uint64_t v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (unint64_t)FeatureCount
{
  return *(void *)self->_model.__ptr_;
}

- (BOOL)setFeatureCount:(unint64_t)a3
{
  ptr = self->_model.__ptr_;
  unint64_t v4 = *(void *)ptr;
  if (*(void *)ptr < a3) {
    *(void *)ptr = a3;
  }
  return v4 <= a3;
}

- (BOOL)setOutputFeatureName:(id *)a3 to:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MLModel *)self modelDescription];
  id v8 = [v7 outputDescriptionsByName];
  LOBYTE(a3) = +[MLBayesianProbitRegression setFeatureName:a3 to:v6 descriptions:v8];

  return (char)a3;
}

- (BOOL)setInputFeatureName:(id *)a3 to:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MLModel *)self modelDescription];
  id v8 = [v7 inputDescriptionsByName];
  LOBYTE(a3) = +[MLBayesianProbitRegression setFeatureName:a3 to:v6 descriptions:v8];

  return (char)a3;
}

- (void)saveModelToSpecification:(id *)a3
{
}

+ (BOOL)validateModelDescription:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 outputDescriptionsByName];
  uint64_t v5 = [v3 predictedFeatureName];
  id v6 = [v4 objectForKey:v5];

  if (v6) {
    BOOL v7 = [v6 type] == 2;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)setFeatureName:(id *)a3 to:(id)a4 descriptions:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  long long v10 = v9;
  if (v8
    && ([v9 objectForKey:v8], long long v11 = objc_claimAutoreleasedReturnValue(),
                                               v11,
                                               !v11))
  {
    BOOL v12 = 0;
  }
  else
  {
    objc_storeStrong(a3, a4);
    BOOL v12 = 1;
  }

  return v12;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = (void *)[objc_alloc((Class)a1) initWithSpecification:a3 configuration:v8 error:a5];

  return v9;
}

+ (id)modelWithContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = +[MLModelAsset modelAssetWithURL:error:](MLModelAsset, "modelAssetWithURL:error:", a3);
  if (v5)
  {
    id v6 = objc_alloc_init(MLModelConfiguration);
    BOOL v7 = [v5 modelWithConfiguration:v6 error:a4];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end