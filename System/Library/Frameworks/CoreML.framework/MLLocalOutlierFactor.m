@interface MLLocalOutlierFactor
- (MLLocalOutlierFactor)initWithKNearestNeighborsModelAtURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (double)computeLOFForQueryPoint:(id)a3;
- (double)localReachabilityDensityForIndex:(unint64_t)a3;
- (double)localReachabilityDensityForQeuryPoint:(const void *)a3;
- (double)localReachabilityDensityOfNeighbors:(const void *)a3;
- (float)kDistanceToIndex:(unint64_t)a3;
- (id).cxx_construct;
- (id)inputMultiArray:(id)a3 error:(id *)a4;
- (id)parameterValueForKey:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (vector<std::pair<unsigned)findNearestNeighborsToIndex:(std:(float>>> *__return_ptr)retstr :(MLLocalOutlierFactor *)self allocator<std:(SEL)a3 :(unint64_t)a4 pair<unsigned)long;
- (vector<std::pair<unsigned)findNearestNeighborsToQueryPoint:(std:(float>>> *__return_ptr)retstr :(MLLocalOutlierFactor *)self allocator<std:(SEL)a3 :(const void *)a4 pair<unsigned)long;
- (void)updateToValidDistance:(void *)a3;
@end

@implementation MLLocalOutlierFactor

- (id).cxx_construct
{
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 13) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterContainer, 0);
  begin = self->_cachedKDistances.__begin_;
  if (begin)
  {
    self->_cachedKDistances.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_index, 0);
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 hasGlobalScope]
    || ([(MLParameterContainer *)self->_parameterContainer currentParameterValues],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKeyedSubscript:v6],
        v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    if (a4)
    {
      +[MLModelErrorUtils parameterErrorWithUnderlyingError:0, @"%@ does not have a parameter for requested key %@.", objc_opt_class(), v6 format];
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v24, v10, 30, -[MLModel signpostID](self, "signpostID"), [v9 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v11 = [(MLModel *)self signpostID];
  uint64_t v12 = [v9 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__MLLocalOutlierFactor_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  v13 = (void (**)(void))_Block_copy(aBlock);
  v14 = [(MLLocalOutlierFactor *)self inputMultiArray:v8 error:a5];
  if (v14)
  {
    [(MLLocalOutlierFactor *)self computeLOFForQueryPoint:v14];
    double v16 = v15;
    v17 = [(MLModel *)self modelDescription];
    v18 = [v17 predictedFeatureName];
    v25 = v18;
    v19 = [NSNumber numberWithDouble:v16];
    v26[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

    v21 = [[MLDictionaryFeatureProvider alloc] initWithFeatureValueDictionary:v20];
  }
  else
  {
    v21 = 0;
  }

  v13[2](v13);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v24);

  return v21;
}

uint64_t __61__MLLocalOutlierFactor_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (id)inputMultiArray:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MLModel *)self modelDescription];
  id v8 = [v7 inputDescriptionsByName];
  id v9 = [v8 allKeys];
  v10 = [v9 objectAtIndexedSubscript:0];

  if (v10)
  {
    unint64_t v11 = [v6 featureValueForName:v10];
    uint64_t v12 = [v11 multiArrayValue];
    v13 = v12;
    if (v12)
    {
      v14 = [v12 shape];
      if ([v14 count] != 1)
      {

        goto LABEL_12;
      }
      double v15 = [v13 shape];
      id v23 = v6;
      double v16 = [v15 firstObject];
      uint64_t v17 = [v16 unsignedIntegerValue];
      unint64_t numberOfDimensions = self->_numberOfDimensions;

      BOOL v19 = v17 == numberOfDimensions;
      id v6 = v23;
      if (!v19)
      {
LABEL_12:
        if (a4)
        {
          v21 = [v13 shape];
          *a4 = +[MLModelErrorUtils featureTypeErrorWithFormat:@"Shape of input MLMultiArray is %@, expected [%lu]", v21, self->_numberOfDimensions];
        }
        goto LABEL_14;
      }
      id v20 = v13;
    }
    else
    {
      if (!a4)
      {
LABEL_14:
        id v20 = 0;
        goto LABEL_15;
      }
      +[MLModelErrorUtils featureTypeErrorWithFormat:@"Invalid MLFeatureTypeMultiArray value for %@.", objc_opt_class()];
      id v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_15:

    goto LABEL_16;
  }
  if (a4)
  {
    +[MLModelErrorUtils featureTypeErrorWithFormat:@"Missing input name in model description for %@.", objc_opt_class()];
    id v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v20 = 0;
  }
LABEL_16:

  return v20;
}

- (double)computeLOFForQueryPoint:(id)a3
{
  id v4 = a3;
  unint64_t v5 = 0;
  id v6 = 0;
  uint64_t v7 = 0;
  v28 = 0;
  v29 = 0;
  unint64_t v30 = 0;
  while (v7 < [v4 count])
  {
    id v8 = [v4 objectAtIndexedSubscript:v7];
    [v8 floatValue];
    int v10 = v9;
    if ((unint64_t)v6 >= v5)
    {
      uint64_t v12 = (char *)v28;
      uint64_t v13 = (v6 - (unsigned char *)v28) >> 2;
      unint64_t v14 = v13 + 1;
      if ((unint64_t)(v13 + 1) >> 62) {
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
      }
      if ((uint64_t)(v5 - (void)v28) >> 1 > v14) {
        unint64_t v14 = (uint64_t)(v5 - (void)v28) >> 1;
      }
      if (v5 - (unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v15 = v14;
      }
      if (v15) {
        unint64_t v15 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v15);
      }
      else {
        uint64_t v16 = 0;
      }
      uint64_t v17 = (_DWORD *)(v15 + 4 * v13);
      _DWORD *v17 = v10;
      unint64_t v11 = v17 + 1;
      while (v6 != v12)
      {
        int v18 = *((_DWORD *)v6 - 1);
        v6 -= 4;
        *--uint64_t v17 = v18;
      }
      unint64_t v5 = v15 + 4 * v16;
      v28 = v17;
      unint64_t v30 = v5;
      if (v12) {
        operator delete(v12);
      }
    }
    else
    {
      *(_DWORD *)id v6 = v9;
      unint64_t v11 = v6 + 4;
    }
    v29 = v11;

    ++v7;
    id v6 = (char *)v11;
  }
  [(MLLocalOutlierFactor *)self findNearestNeighborsToQueryPoint:&v28];
  BOOL v19 = __p;
  double v20 = 0.0;
  if (__p == v27)
  {
    v22 = __p;
  }
  else
  {
    do
    {
      [(MLLocalOutlierFactor *)self localReachabilityDensityForIndex:*(void *)v19];
      double v20 = v20 + v21;
      v19 += 16;
    }
    while (v19 != v27);
    BOOL v19 = __p;
    v22 = v27;
  }
  [(MLLocalOutlierFactor *)self localReachabilityDensityForQeuryPoint:&v28];
  double v24 = v23;
  if (__p) {
    operator delete(__p);
  }
  if (v28)
  {
    v29 = v28;
    operator delete(v28);
  }

  return v20 / (double)(unint64_t)((v22 - v19) >> 4) / v24;
}

- (double)localReachabilityDensityForQeuryPoint:(const void *)a3
{
  [(MLLocalOutlierFactor *)self findNearestNeighborsToQueryPoint:a3];
  [(MLLocalOutlierFactor *)self localReachabilityDensityOfNeighbors:__p];
  double v5 = v4;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v5;
}

- (double)localReachabilityDensityForIndex:(unint64_t)a3
{
  [(MLLocalOutlierFactor *)self findNearestNeighborsToIndex:a3];
  [(MLLocalOutlierFactor *)self localReachabilityDensityOfNeighbors:__p];
  double v5 = v4;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v5;
}

- (double)localReachabilityDensityOfNeighbors:(const void *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)a3;
  uint64_t v4 = *((void *)a3 + 1);
  unint64_t v6 = (v4 - *(void *)a3) >> 4;
  if (v6 != self->_numberOfNeighbors)
  {
    std::to_string(&v18, v6);
    uint64_t v12 = std::string::insert(&v18, 0, "using wrong sized neighbors with size=");
    long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
    v17.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v13;
    v12->__r_.__value_.__l.__size_ = 0;
    v12->__r_.__value_.__r.__words[2] = 0;
    v12->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v18.__r_.__value_.__l.__data_);
    }
    unint64_t v14 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unint64_t v15 = &v17;
      if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        unint64_t v15 = (std::string *)v17.__r_.__value_.__r.__words[0];
      }
      LODWORD(v18.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v18.__r_.__value_.__r.__words + 4) = (std::string::size_type)v15;
      _os_log_error_impl(&dword_19E58B000, v14, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v18, 0xCu);
    }

    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, &v17);
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4E8] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E59A3028, MEMORY[0x1E4FBA1E8]);
  }
  if (v5 == v4)
  {
    double v8 = 2.22044605e-16;
    uint64_t v10 = *((void *)a3 + 1);
  }
  else
  {
    double v8 = 2.22044605e-16;
    do
    {
      [(MLLocalOutlierFactor *)self kDistanceToIndex:*(void *)v5];
      double v8 = v8 + fmaxf(v9, *(float *)(v5 + 8));
      v5 += 16;
    }
    while (v5 != v4);
    uint64_t v4 = *(void *)a3;
    uint64_t v10 = *((void *)a3 + 1);
  }
  return (double)(unint64_t)((v10 - v4) >> 4) / v8;
}

- (float)kDistanceToIndex:(unint64_t)a3
{
  float v3 = self->_cachedKDistances.__begin_[a3];
  if (v3 < 0.0)
  {
    -[MLLocalOutlierFactor findNearestNeighborsToIndex:](self, "findNearestNeighborsToIndex:");
    float v3 = *(float *)(v8 - 8);
    self->_cachedKDistances.__begin_[a3] = v3;
    if (__p) {
      operator delete(__p);
    }
  }
  return v3;
}

- (vector<std::pair<unsigned)findNearestNeighborsToIndex:(std:(float>>> *__return_ptr)retstr :(MLLocalOutlierFactor *)self allocator<std:(SEL)a3 :(unint64_t)a4 pair<unsigned)long
{
  index = self->_index;
  if (index)
  {
    [(MLNearestNeighborsIndex *)index findNearestNeighbors:self->_numberOfNeighbors toIndex:a4];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }
  return (vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *)[(MLLocalOutlierFactor *)self updateToValidDistance:retstr];
}

- (vector<std::pair<unsigned)findNearestNeighborsToQueryPoint:(std:(float>>> *__return_ptr)retstr :(MLLocalOutlierFactor *)self allocator<std:(SEL)a3 :(const void *)a4 pair<unsigned)long
{
  index = self->_index;
  if (index)
  {
    [(MLNearestNeighborsIndex *)index findNearestNeighbors:self->_numberOfNeighbors toQueryPoint:a4];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }
  return (vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *)[(MLLocalOutlierFactor *)self updateToValidDistance:retstr];
}

- (void)updateToValidDistance:(void *)a3
{
  uint64_t v3 = *(void *)a3;
  uint64_t v4 = *((void *)a3 + 1);
  while (v3 != v4)
  {
    *(float *)(v3 + 8) = sqrtf(*(float *)(v3 + 8));
    v3 += 16;
  }
}

- (MLLocalOutlierFactor)initWithKNearestNeighborsModelAtURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v44 = v8;
  uint64_t v10 = +[MLModel modelWithContentsOfURL:v8 error:a5];
  if (v10)
  {
    unint64_t v11 = +[MLParameterKey numberOfNeighbors];
    uint64_t v12 = [v10 parameterValueForKey:v11 error:a5];

    v43 = (void *)v12;
    if (!v12)
    {
      v36 = 0;
LABEL_25:

      goto LABEL_26;
    }
    v42 = +[MLFeatureDescription featureDescriptionWithName:@"localOutlierFactorScore" type:2 optional:0 constraints:0];
    long long v13 = [MLModelDescription alloc];
    unint64_t v14 = [v10 modelDescription];
    unint64_t v15 = [v14 inputDescriptionsByName];
    v50 = @"localOutlierFactorScore";
    v51[0] = v42;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
    v41 = [(MLModelDescription *)v13 initWithInputDescriptions:v15 outputDescriptions:v16 predictedFeatureName:@"localOutlierFactorScore" predictedProbabilitiesName:0 metadata:0];

    std::string v17 = v9;
    if (!v9)
    {
      unint64_t v15 = [v10 configuration];
      std::string v17 = (void *)[v15 copy];
    }
    v48.receiver = self;
    v48.super_class = (Class)MLLocalOutlierFactor;
    self = [(MLModel *)&v48 initWithDescription:v41 configuration:v17];
    if (!v9)
    {
    }
    if (!self) {
      goto LABEL_16;
    }
    self->_unint64_t numberOfDimensions = [v10 numberOfDimensions];
    std::string v18 = [v10 index];
    int v45 = -1082130432;
    std::vector<float>::vector(&v46, [v18 dataPointCount], &v45);
    p_cachedKDistances = &self->_cachedKDistances;
    begin = self->_cachedKDistances.__begin_;
    if (begin)
    {
      self->_cachedKDistances.__end_ = begin;
      operator delete(begin);
      p_cachedKDistances->__begin_ = 0;
      self->_cachedKDistances.__end_ = 0;
      self->_cachedKDistances.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&p_cachedKDistances->__begin_ = v46;
    self->_cachedKDistances.__end_cap_.__value_ = v47;
    long long v46 = 0uLL;
    v47 = 0;

    double v21 = [v10 index];
    index = self->_index;
    self->_index = v21;

    self->_unint64_t numberOfNeighbors = [v43 unsignedIntegerValue];
    double v23 = [v9 parameters];
    double v24 = +[MLParameterKey numberOfNeighbors];
    v40 = [v23 objectForKeyedSubscript:v24];

    if (v40)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a5)
        {
          +[MLModelErrorUtils parameterErrorWithUnderlyingError:0, @"Local Outlier Factor can not override numberOfNeighbors with value of class=%@.", objc_opt_class() format];
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_23;
      }
      self->_unint64_t numberOfNeighbors = [v40 unsignedIntegerValue];
    }
    v25 = +[MLParameterKey numberOfNeighbors];
    v49 = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    v27 = [v10 modelDescription];
    v28 = [v27 parameterDescriptionsByKey];
    v29 = +[MLParameterContainer parameterContainerFor:v26 descriptions:v28];
    parameterContainer = self->_parameterContainer;
    self->_parameterContainer = v29;

    v31 = self->_parameterContainer;
    v32 = [NSNumber numberWithUnsignedInteger:self->_numberOfNeighbors];
    v33 = +[MLParameterKey numberOfNeighbors];
    LOBYTE(v31) = [(MLParameterContainer *)v31 setCurrentValue:v32 forKey:v33 error:a5];

    if (v31)
    {
      v34 = [v10 index];
      BOOL v35 = [v34 dataPointCount] > self->_numberOfNeighbors;

      if (v35)
      {

LABEL_16:
        v36 = self;
LABEL_24:

        goto LABEL_25;
      }
      if (a5)
      {
        unint64_t numberOfNeighbors = self->_numberOfNeighbors;
        v38 = [v10 index];
        +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", 0, @"Local Outlier Factor should have at least numberOfNeighbors(%lu) + 1 data points, but we got (%lu) data points.", numberOfNeighbors, [v38 dataPointCount]);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
LABEL_23:

    v36 = 0;
    goto LABEL_24;
  }
  v36 = 0;
LABEL_26:

  return v36;
}

@end