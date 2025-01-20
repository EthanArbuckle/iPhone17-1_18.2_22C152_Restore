@interface MLTreeEnsembleClassifier
+ (BOOL)_convertStringClassVector:(const void *)a3 int64ClassVector:(const void *)a4 dimensions:(unint64_t)a5 toClassLabel:(id *)a6 classType:(int64_t *)a7 andReturnError:(id *)a8;
+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6;
+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5;
+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
+ (id)loadModelFromSpecificationWithCompilationOptions:(void *)a3 options:(id)a4 error:(id *)a5;
- (const)modelData;
- (id).cxx_construct;
- (id)_buildClassificationClasses:(double *)a3 topk:(unint64_t)a4 error:(id *)a5;
- (id)classify:(id)a3 options:(id)a4 error:(id *)a5;
- (id)prepareInput:(id)a3 error:(id *)a4;
- (void)_setSingleArrayLookupField;
@end

@implementation MLTreeEnsembleClassifier

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 22) = 0;
  *((void *)self + 20) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_single_array_key, 0);
  objc_storeStrong((id *)&self->_class_values, 0);
  begin = self->_classes_by_int64_t.__begin_;
  if (begin)
  {
    self->_classes_by_int64_t.__end_ = begin;
    operator delete(begin);
  }
  p_classes_by_string = &self->_classes_by_string;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_classes_by_string);
  objc_storeStrong((id *)&self->_model_data, 0);
  v4 = self->_cached_model.__begin_;
  if (v4)
  {
    self->_cached_model.__end_ = v4;
    operator delete(v4);
  }
}

- (id)classify:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v28, v10, 28, -[MLModel signpostID](self, "signpostID"), [v9 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  uint64_t v11 = [v9 classifyTopK];
  v12 = [(MLTreeEnsembleClassifier *)self prepareInput:v8 error:a5];
  if (v12)
  {
    unint64_t v13 = [(MLModel *)self signpostID];
    uint64_t v14 = [v9 parentSignpostID];
    kdebug_trace();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__MLTreeEnsembleClassifier_classify_options_error___block_invoke;
    aBlock[3] = &__block_descriptor_48_e5_v8__0l;
    aBlock[4] = v13;
    aBlock[5] = v14;
    v15 = (void (**)(void))_Block_copy(aBlock);
    unint64_t num_dimensions = self->num_dimensions;
    if (num_dimensions == 1)
    {
      v17 = [(MLTreeEnsembleClassifier *)self modelData];
      v18 = (const unsigned __int8 *)[v12 bytes];
      CoreML::TreeEnsembles::Internal::predict((CoreML::TreeEnsembles::Internal *)__p, (double *)v17, v18, v19);
      v20 = [(MLTreeEnsembleClassifier *)self _buildClassificationClasses:__p topk:v11 error:a5];
    }
    else
    {
      std::vector<double>::vector(__p, num_dimensions);
      v21 = (CoreML::TreeEnsembles::Internal *)__p[0];
      v22 = [(MLTreeEnsembleClassifier *)self modelData];
      v23 = (const unsigned __int8 *)[v12 bytes];
      CoreML::TreeEnsembles::Internal::predict(v21, (double *)v22, v23, v24);
      v20 = [(MLTreeEnsembleClassifier *)self _buildClassificationClasses:__p[0] topk:v11 error:a5];
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    v15[2](v15);
  }
  else
  {
    v20 = 0;
  }

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v28);

  return v20;
}

uint64_t __51__MLTreeEnsembleClassifier_classify_options_error___block_invoke()
{
  return kdebug_trace();
}

- (id)prepareInput:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (self->_single_array_key)
  {
    id v8 = objc_msgSend(v6, "featureValueForName:");
    id v9 = v8;
    if (v8)
    {
      v10 = [v8 multiArrayValue];
      uint64_t v11 = [v10 dataType];

      if (v11 == 65600)
      {
        v12 = [v9 multiArrayValue];
      }
      else
      {
        [(MLModel *)self signpostID];
        kdebug_trace();
        unint64_t v13 = [v9 multiArrayValue];
        v12 = +[MLMultiArray doubleMultiArrayWithCopyOfMultiArray:v13];

        [(MLModel *)self signpostID];
        kdebug_trace();
      }
    }
    else if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:@"INTERNAL ERROR -- feature not present that should have been."];
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    [(MLModel *)self signpostID];
    kdebug_trace();
    v12 = [(MLModel *)self vectorizeInput:v7 error:a4];
    [(MLModel *)self signpostID];
    kdebug_trace();
  }

  return v12;
}

- (id)_buildClassificationClasses:(double *)a3 topk:(unint64_t)a4 error:(id *)a5
{
  v115[1] = *MEMORY[0x1E4F143B8];
  if (!self->_class_values)
  {
    id v9 = objc_opt_class();
    unint64_t num_dimensions = self->num_dimensions;
    id v103 = 0;
    [v9 _convertStringClassVector:&self->_classes_by_string int64ClassVector:&self->_classes_by_int64_t dimensions:num_dimensions toClassLabel:&v103 classType:&self->_class_type andReturnError:a5];
    uint64_t v11 = (NSArray *)v103;
    if (!v11)
    {
      v22 = 0;
      goto LABEL_114;
    }
    class_values = self->_class_values;
    self->_class_values = v11;
  }
  if (!a4)
  {
    if (self->_class_type == 1) {
      +[MLClassifierResult resultWithIntClassProbability:](MLClassifierResult, "resultWithIntClassProbability:", MEMORY[0x1E4F1CC08], a4, a5);
    }
    else {
    v22 = +[MLClassifierResult resultWithStringClassProbability:](MLClassifierResult, "resultWithStringClassProbability:", MEMORY[0x1E4F1CC08], a4, a5);
    }
    goto LABEL_114;
  }
  unint64_t v13 = self->num_dimensions;
  if (v13 == 1)
  {
    if (a4 == 1)
    {
      double v14 = *a3;
      int64_t class_type = self->_class_type;
      v16 = self->_class_values;
      if (*a3 <= 0.5)
      {
        BOOL v74 = class_type == 1;
        uint64_t v75 = -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 0, a4, a5, v14);
        v19 = (void *)v75;
        if (v74)
        {
          uint64_t v110 = v75;
          v20 = [NSNumber numberWithDouble:1.0 - *a3];
          v111 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
          +[MLClassifierResult resultWithIntClassProbability:v21];
        }
        else
        {
          uint64_t v108 = v75;
          v20 = [NSNumber numberWithDouble:1.0 - *a3];
          v109 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
          +[MLClassifierResult resultWithStringClassProbability:v21];
        }
      }
      else
      {
        BOOL v17 = class_type == 1;
        uint64_t v18 = -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 1, a4, a5, v14);
        v19 = (void *)v18;
        if (v17)
        {
          uint64_t v114 = v18;
          v20 = [NSNumber numberWithDouble:*a3];
          v115[0] = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:&v114 count:1];
          +[MLClassifierResult resultWithIntClassProbability:v21];
        }
        else
        {
          uint64_t v112 = v18;
          v20 = [NSNumber numberWithDouble:*a3];
          v113 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v113 forKeys:&v112 count:1];
          +[MLClassifierResult resultWithStringClassProbability:v21];
        }
      v22 = };
    }
    else
    {
      BOOL v61 = self->_class_type == 1;
      uint64_t v62 = -[NSArray objectAtIndexedSubscript:](self->_class_values, "objectAtIndexedSubscript:", 0, a4, a5);
      v63 = (void *)v62;
      if (v61)
      {
        v106[0] = v62;
        v64 = [NSNumber numberWithDouble:1.0 - *a3];
        v107[0] = v64;
        v65 = [(NSArray *)self->_class_values objectAtIndexedSubscript:1];
        v106[1] = v65;
        v66 = [NSNumber numberWithDouble:*a3];
        v107[1] = v66;
        v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v106 count:2];
        +[MLClassifierResult resultWithIntClassProbability:v67];
      }
      else
      {
        v104[0] = v62;
        v64 = [NSNumber numberWithDouble:1.0 - *a3];
        v105[0] = v64;
        v65 = [(NSArray *)self->_class_values objectAtIndexedSubscript:1];
        v104[1] = v65;
        v66 = [NSNumber numberWithDouble:*a3];
        v105[1] = v66;
        v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:2];
        +[MLClassifierResult resultWithStringClassProbability:v67];
      v22 = };
    }
    goto LABEL_114;
  }
  if (v13 <= a4)
  {
    BOOL v68 = self->_class_type == 1;
    v69 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", self->num_dimensions, a4, a5);
    unint64_t v70 = self->num_dimensions;
    if (v68)
    {
      if (v70)
      {
        unint64_t v71 = 0;
        do
        {
          v72 = [NSNumber numberWithDouble:a3[v71]];
          v73 = [(NSArray *)self->_class_values objectAtIndexedSubscript:v71];
          [v69 setObject:v72 forKey:v73];

          ++v71;
        }
        while (v71 < self->num_dimensions);
      }
      v22 = +[MLClassifierResult resultWithIntClassProbability:v69];
    }
    else
    {
      if (v70)
      {
        unint64_t v76 = 0;
        do
        {
          v77 = [NSNumber numberWithDouble:a3[v76]];
          v78 = [(NSArray *)self->_class_values objectAtIndexedSubscript:v76];
          [v69 setValue:v77 forKey:v78];

          ++v76;
        }
        while (v76 < self->num_dimensions);
      }
      v22 = +[MLClassifierResult resultWithStringClassProbability:v69];
    }
    goto LABEL_114;
  }
  std::vector<unsigned long>::vector(&__p, v13);
  v23 = (uint64_t *)__p;
  v24 = v102;
  if (__p != v102)
  {
    uint64_t v25 = 0;
    v26 = (uint64_t *)__p;
    do
      *v26++ = v25++;
    while (v26 != v24);
  }
  v27 = &v23[a4];
  if (v27 == v24) {
    goto LABEL_101;
  }
  while (1)
  {
    unint64_t v28 = v24 - v23;
    if (v28 < 2) {
      goto LABEL_101;
    }
    if (v28 == 3)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:]::$_1 &,std::__wrap_iter<unsigned long *>>(v23, v23 + 1, v24 - 1, (uint64_t)a3);
      goto LABEL_101;
    }
    if (v28 == 2)
    {
      uint64_t v79 = *(v24 - 1);
      uint64_t v80 = *v23;
      if (a3[v79] > a3[*v23])
      {
        uint64_t *v23 = v79;
        *(v24 - 1) = v80;
      }
      goto LABEL_101;
    }
    if ((char *)v24 - (char *)v23 <= 63)
    {
      if (v24 - 1 == v23) {
        goto LABEL_101;
      }
      while (1)
      {
        v81 = v24;
        if (v23 == v24) {
          goto LABEL_98;
        }
        v82 = v23 + 1;
        if (v23 + 1 != v24) {
          break;
        }
LABEL_100:
        if (++v23 == v24 - 1) {
          goto LABEL_101;
        }
      }
      uint64_t v83 = *v23;
      v81 = v23;
      v84 = v23 + 1;
      do
      {
        uint64_t v86 = *v84++;
        uint64_t v85 = v86;
        if (a3[v86] > a3[v83])
        {
          uint64_t v83 = v85;
          v81 = v82;
        }
        v82 = v84;
      }
      while (v84 != v24);
LABEL_98:
      if (v81 != v23)
      {
        uint64_t v87 = *v23;
        uint64_t *v23 = *v81;
        uint64_t *v81 = v87;
      }
      goto LABEL_100;
    }
    v29 = &v23[v28 >> 1];
    v30 = v24 - 1;
    int v31 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:]::$_1 &,std::__wrap_iter<unsigned long *>>(v23, v29, v24 - 1, (uint64_t)a3);
    uint64_t v32 = *v23;
    double v33 = a3[*v23];
    double v34 = a3[*v29];
    if (v33 <= v34) {
      break;
    }
LABEL_27:
    v39 = v23 + 1;
    if (v23 + 1 >= v30)
    {
      v42 = v23 + 1;
    }
    else
    {
      v40 = v23 + 1;
      while (1)
      {
        double v41 = a3[*v29];
        do
        {
          v42 = v40;
          uint64_t v44 = *v40++;
          uint64_t v43 = v44;
        }
        while (a3[v44] > v41);
        do
        {
          uint64_t v46 = *--v30;
          uint64_t v45 = v46;
        }
        while (a3[v46] <= v41);
        if (v42 >= v30) {
          break;
        }
        uint64_t *v42 = v45;
        uint64_t *v30 = v43;
        ++v31;
        if (v29 == v42) {
          v29 = v30;
        }
      }
    }
    if (v42 != v29)
    {
      uint64_t v47 = *v42;
      if (a3[*v29] > a3[*v42])
      {
        uint64_t *v42 = *v29;
        uint64_t *v29 = v47;
        ++v31;
      }
    }
    if (v42 == v27) {
      goto LABEL_101;
    }
    if (!v31)
    {
      if (v42 <= v27)
      {
        v53 = v42 + 1;
        while (v53 != v24)
        {
          double v54 = a3[*v53];
          double v55 = a3[*(v53++ - 1)];
          if (v54 > v55) {
            goto LABEL_42;
          }
        }
      }
      else
      {
        while (v39 != v42)
        {
          double v49 = a3[*v39];
          double v50 = a3[*(v39++ - 1)];
          if (v49 > v50) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_101;
    }
LABEL_42:
    if (v42 <= v27)
    {
      v48 = v42 + 1;
    }
    else
    {
      v24 = v42;
      v48 = v23;
    }
LABEL_66:
    v23 = v48;
    if (v24 == v27) {
      goto LABEL_101;
    }
  }
  v35 = v24 - 2;
  while (v35 != v23)
  {
    v36 = v35;
    uint64_t v38 = *v35--;
    uint64_t v37 = v38;
    if (a3[v38] > v34)
    {
      uint64_t *v23 = v37;
      uint64_t *v36 = v32;
      ++v31;
      v30 = v36;
      goto LABEL_27;
    }
  }
  v51 = v23 + 1;
  if (v33 > a3[*v30])
  {
LABEL_58:
    if (v51 == v30) {
      goto LABEL_101;
    }
    while (1)
    {
      double v56 = a3[*v23];
      do
      {
        v48 = v51;
        uint64_t v58 = *v51++;
        uint64_t v57 = v58;
      }
      while (v56 <= a3[v58]);
      do
      {
        uint64_t v60 = *--v30;
        uint64_t v59 = v60;
      }
      while (v56 > a3[v60]);
      if (v48 >= v30) {
        break;
      }
      uint64_t *v48 = v59;
      uint64_t *v30 = v57;
    }
    if (v48 > v27) {
      goto LABEL_101;
    }
    goto LABEL_66;
  }
  while (v51 != v30)
  {
    uint64_t v52 = *v51;
    if (v33 > a3[*v51])
    {
      *v51++ = *v30;
      uint64_t *v30 = v52;
      goto LABEL_58;
    }
    ++v51;
  }
LABEL_101:
  std::vector<unsigned long>::resize(&__p, a4);
  if (self->_class_type == 1)
  {
    v88 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:a4];
    uint64_t v89 = 0;
    if (a4 <= 1) {
      unint64_t v90 = 1;
    }
    else {
      unint64_t v90 = a4;
    }
    do
    {
      uint64_t v91 = *((void *)__p + v89);
      v92 = [NSNumber numberWithDouble:a3[v91]];
      v93 = [(NSArray *)self->_class_values objectAtIndexedSubscript:v91];
      [v88 setObject:v92 forKey:v93];

      ++v89;
    }
    while (v90 != v89);
    uint64_t v94 = +[MLClassifierResult resultWithIntClassProbability:v88];
  }
  else
  {
    v88 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:a4];
    uint64_t v95 = 0;
    if (a4 <= 1) {
      unint64_t v96 = 1;
    }
    else {
      unint64_t v96 = a4;
    }
    do
    {
      uint64_t v97 = *((void *)__p + v95);
      v98 = [NSNumber numberWithDouble:a3[v97]];
      v99 = [(NSArray *)self->_class_values objectAtIndexedSubscript:v97];
      [v88 setValue:v98 forKey:v99];

      ++v95;
    }
    while (v96 != v95);
    uint64_t v94 = +[MLClassifierResult resultWithStringClassProbability:v88];
  }
  v22 = (void *)v94;

  if (__p)
  {
    v102 = (uint64_t *)__p;
    operator delete(__p);
  }
LABEL_114:

  return v22;
}

- (void)_setSingleArrayLookupField
{
  p_single_array_key = &self->_single_array_key;
  single_array_key = self->_single_array_key;
  self->_single_array_key = 0;

  v5 = [(MLModel *)self modelDescription];
  id v10 = [v5 inputDescriptionsByName];

  if ([v10 count] == 1)
  {
    id v6 = [v10 allKeys];
    v7 = [v6 objectAtIndexedSubscript:0];

    id v8 = [v10 objectForKeyedSubscript:v7];
    uint64_t v9 = [v8 type];

    if (v9 == 5) {
      objc_storeStrong((id *)p_single_array_key, v7);
    }
  }
}

- (const)modelData
{
  if (self->_model_data) {
    return (const char *)[(NSData *)self->_model_data bytes];
  }
  else {
    return self->_cached_model.__begin_;
  }
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = +[MLVersionInfo versionInfoWithMajor:1 minor:0 patch:0 variant:@"generic"];
  uint64_t v16 = [v15 majorVersion];
  if (v16 >= [v13 majorVersion])
  {
    v20 = [(MLModel *)[MLTreeEnsembleClassifier alloc] initInterfaceAndMetadataWithCompiledArchive:a3 error:a7];
    v21 = v20;
    if (v20)
    {
      operator>><unsigned char>((uint64_t)a3, v20 + 12);
      if (v21[12] == v21[13])
      {
        memset(&v56, 0, sizeof(v56));
        operator>>((uint64_t)a3, &v56);
        IArchive::blob(&v54, *(void *)a3, (uint64_t)&v56);
        uint64_t v22 = (*(void (**)(uint64_t))(*(void *)v54 + 32))(v54);
        v23 = (void *)v21[15];
        v21[15] = v22;

        if (v55) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v55);
        }
        if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v56.__r_.__value_.__l.__data_);
        }
      }
      operator>>((uint64_t)a3);
      operator>><std::string>((uint64_t)a3, (std::vector<std::string> *)(v21 + 17));
      operator>><long long>((uint64_t)a3, (char **)v21 + 20);
      uint64_t v24 = v21[16];
      id v53 = 0;
      [a1 _convertStringClassVector:v21 + 17 int64ClassVector:v21 + 20 dimensions:v24 toClassLabel:&v53 classType:v21 + 23 andReturnError:a7];
      id v25 = v53;
      id v26 = v53;
      if (v26)
      {
        objc_storeStrong((id *)v21 + 24, v25);
        v27 = [v21 modelDescription];
        [v27 setClassLabels:v26];

        if ((*(unsigned int (**)(void))(**(void **)a3 + 56))() == 1) {
          goto LABEL_32;
        }
        unint64_t v28 = (void *)MEMORY[0x1E4F1CB10];
        v29 = NSString;
        uint64_t v30 = *(void *)a3;
        if (*(char *)(*(void *)a3 + 31) < 0)
        {
          std::string::__init_copy_ctor_external(&v56, *(const std::string::value_type **)(v30 + 8), *(void *)(v30 + 16));
        }
        else
        {
          long long v31 = *(_OWORD *)(v30 + 8);
          v56.__r_.__value_.__r.__words[2] = *(void *)(v30 + 24);
          *(_OWORD *)&v56.__r_.__value_.__l.__data_ = v31;
        }
        if ((v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v32 = &v56;
        }
        else {
          uint64_t v32 = (std::string *)v56.__r_.__value_.__r.__words[0];
        }
        double v33 = [v29 stringWithUTF8String:v32];
        double v34 = [v28 fileURLWithPath:v33];

        if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v56.__r_.__value_.__l.__data_);
        }
        v35 = [v34 lastPathComponent];
        uint64_t v47 = [v35 stringByReplacingOccurrencesOfString:@".mlmodelc" withString:@".xgboost"];

        v19 = [v34 path];
        uint64_t v36 = [(MLTreeEnsembleXGBoostClassifier *)v19 stringByAppendingPathComponent:v47];

        uint64_t v46 = (void *)v36;
        uint64_t v45 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v37 = [v45 fileExistsAtPath:v36];
        char v38 = v37;
        if (v37)
        {
          uint64_t v43 = v34;
          v39 = [MLTreeEnsembleXGBoostClassifier alloc];
          uint64_t v44 = [v21 modelDescription];
          memset(&v52, 0, sizeof(v52));
          std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v52, (long long *)v21[17], (long long *)v21[18], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v21[18] - v21[17]) >> 3));
          double v50 = 0;
          uint64_t v51 = 0;
          __p = 0;
          std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, (const void *)v21[20], v21[21], (uint64_t)(v21[21] - v21[20]) >> 3);
          id v48 = 0;
          v19 = [(MLTreeEnsembleXGBoostClassifier *)v39 initWithDescription:v44 configuration:v14 indexToStringLabelArray:&v52 indexToIntLabelArray:&__p modelURL:v34 error:&v48];
          id v40 = v48;
          if (__p)
          {
            double v50 = __p;
            operator delete(__p);
          }
          v56.__r_.__value_.__r.__words[0] = (std::string::size_type)&v52;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v56);

          if (v19)
          {
            double v41 = v19;
          }
          else if (a7)
          {
            *a7 = +[MLModelErrorUtils errorWithCode:0 underlyingError:v40 format:@"Cannot initialize Tree Ensemble Classifier model which contains a trained model."];
          }

          double v34 = v43;
        }

        if ((v38 & 1) == 0)
        {
LABEL_32:
          [v21 _setSingleArrayLookupField];
          v19 = v21;
        }
      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    if (a7)
    {
      BOOL v17 = [v13 versionNumberString];
      uint64_t v18 = [v15 versionNumberString];
      *a7 = +[MLModelErrorUtils genericErrorWithFormat:@"compiler major version for compiled model is %@ and is more recent than this framework major version %@.", v17, v18];
    }
    v19 = 0;
  }

  return v19;
}

+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  v5 = +[MLVersionInfo versionInfoWithMajor:1 minor:0 patch:0 variant:@"generic"];

  return v5;
}

+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6
{
  +[MLModel serializeInterfaceAndMetadata:a3 toArchive:a4 error:a6];
  uint64_t v9 = objc_opt_new();
  id v10 = +[MLTreeEnsembleClassifier loadModelFromSpecification:a3 configuration:v9 error:a6];

  if (v10)
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v17 = 0;
    operator<<<unsigned char>((uint64_t)a4, (uint64_t *)__p);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)&unk_19EC86ACE);
    OArchive::uniqueBlob(&v14, *((void **)a4 + 1), (const void **)__p);
    if (SHIBYTE(v17) < 0) {
      operator delete(__p[0]);
    }
    uint64_t v11 = v14;
    operator<<((uint64_t)a4, (uint64_t *)(v14 + 576));
    if ((unint64_t)(v10[13] - v10[12]) >> 31)
    {
      if (a6)
      {
        +[MLModelErrorUtils genericErrorWithFormat:@"Internal error: model too large to be compiled."];
        id v12 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v12 = 0;
      }
    }
    else
    {
      if (!*(unsigned char *)v11 && !*(void *)(v11 + 624)) {
        Archiver::_ODataBlobImpl::_openAsStream(v11);
      }
      std::ostream::write();
      operator<<((uint64_t)a4, v10[16]);
      operator<<<std::string>((uint64_t)a4, v10 + 17);
      operator<<<long long>((uint64_t)a4, v10 + 20);
      id v12 = +[MLCompilerResult resultWithArchive:a4];
    }
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  v5 = +[MLTreeEnsembleClassifier loadModelFromSpecificationWithCompilationOptions:a3 options:MEMORY[0x1E4F1CC08] error:a5];

  return v5;
}

+ (id)loadModelFromSpecificationWithCompilationOptions:(void *)a3 options:(id)a4 error:(id *)a5
{
  v44[3] = *(void **)MEMORY[0x1E4F143B8];
  id v31 = a4;
  if (*(_DWORD *)(*(void *)a3 + 44) == 402)
  {
    id v30 = a1;
    id v8 = [MLTreeEnsembleClassifier alloc];
    uint64_t v9 = objc_alloc_init(MLModelConfiguration);
    uint64_t v10 = [(MLClassifier *)v8 initDescriptionOnlyWithSpecification:a3 configuration:v9 error:a5];

    if (v10)
    {
      CoreML::TreeEnsembles::constructAndValidateTreeEnsembleFromSpec((CoreML::TreeEnsembles *)&v39, *(const CoreML::Specification::Model **)a3);
      v44[0] = 0;
      v44[1] = 0;
      uint64_t v43 = (uint64_t *)v44;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v11 = v31;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v36 != v13) {
              objc_enumerationMutation(v11);
            }
            v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            id v16 = [v11 objectForKeyedSubscript:v15];
            uint64_t v17 = [v16 UTF8String];
            std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v15 UTF8String]);
            double v41 = __p;
            uint64_t v18 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v43, __p, (_OWORD **)&v41);
            MEMORY[0x19F3C1430]((char *)v18 + 56, v17);
            if (SHIBYTE(v34) < 0) {
              operator delete(__p[0]);
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v42 count:16];
        }
        while (v12);
      }

      uint64_t v20 = v39;
      v19 = v40;
      if (v40) {
        atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CoreML::TreeEnsembles::buildTreeEnsembleModelFromSpec((uint64_t)__p, v20, v19, (uint64_t)&v43);
      v21 = (void *)(v10 + 96);
      uint64_t v22 = *(void **)(v10 + 96);
      if (v22)
      {
        *(void *)(v10 + 104) = v22;
        operator delete(v22);
        void *v21 = 0;
        *(void *)(v10 + 104) = 0;
        *(void *)(v10 + 112) = 0;
      }
      *(_OWORD *)v21 = *(_OWORD *)__p;
      *(void *)(v10 + 112) = v34;
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v34 = 0;
      if (v19) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v19);
      }
      *(void *)(v10 + 128) = *(void *)(v20 + 16);
      if (v10 + 136 != v20 + 80) {
        std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>(v10 + 136, *(std::string **)(v20 + 80), *(long long **)(v20 + 88), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v20 + 88) - *(void *)(v20 + 80)) >> 3));
      }
      if (v10 + 160 != v20 + 104) {
        std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>((char *)(v10 + 160), *(char **)(v20 + 104), *(void *)(v20 + 112), (uint64_t)(*(void *)(v20 + 112) - *(void *)(v20 + 104)) >> 3);
      }
      uint64_t v23 = *(void *)(v10 + 128);
      id v32 = 0;
      [v30 _convertStringClassVector:v10 + 136 int64ClassVector:v10 + 160 dimensions:v23 toClassLabel:&v32 classType:v10 + 184 andReturnError:a5];
      id v24 = v32;
      id v25 = v32;
      if (v25)
      {
        id v26 = v25;
        objc_storeStrong((id *)(v10 + 192), v24);
        v27 = [(id)v10 modelDescription];
        [v27 setClassLabels:v26];

        std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v44[0]);
        if (v19) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v19);
        }
        [(id)v10 _setSingleArrayLookupField];
        id v28 = (id)v10;
        goto LABEL_32;
      }
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v44[0]);
      if (v19) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v19);
      }
    }
    id v28 = 0;
LABEL_32:

    goto LABEL_33;
  }
  if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:@"Interface type is not an TreeEnsembleClassifier"];
    id v28 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v28 = 0;
  }
LABEL_33:

  return v28;
}

+ (BOOL)_convertStringClassVector:(const void *)a3 int64ClassVector:(const void *)a4 dimensions:(unint64_t)a5 toClassLabel:(id *)a6 classType:(int64_t *)a7 andReturnError:(id *)a8
{
  if (a5 == 1) {
    unint64_t v11 = 2;
  }
  else {
    unint64_t v11 = a5;
  }
  uint64_t v12 = *((void *)a3 + 1);
  if (*(void *)a3 == v12)
  {
    uint64_t v20 = *((void *)a4 + 1);
    if (*(void *)a4 == v20)
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
      [v14 addObject:&unk_1EF11A2B0];
      [v14 addObject:&unk_1EF11A2C8];
    }
    else
    {
      if (v11 != (v20 - *(void *)a4) >> 3)
      {
        if (a8)
        {
          *a8 = +[MLModelErrorUtils genericErrorWithFormat:@"Incorrect number of classes given (TreeEnsembleClassifier)."];
        }
        uint64_t v23 = +[MLLogging coreChannel];
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          goto LABEL_32;
        }
        *(_WORD *)buf = 0;
        id v24 = buf;
        goto LABEL_37;
      }
      uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
      if (v11)
      {
        uint64_t v21 = 0;
        int64_t v16 = 1;
        do
        {
          uint64_t v22 = [NSNumber numberWithLongLong:*(void *)(*(void *)a4 + 8 * v21)];
          [v14 addObject:v22];

          ++v21;
        }
        while (v11 != v21);
        goto LABEL_24;
      }
    }
    int64_t v16 = 1;
    goto LABEL_24;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((v12 - *(void *)a3) >> 3) != v11)
  {
    if (a8)
    {
      *a8 = +[MLModelErrorUtils genericErrorWithFormat:@"Incorrect number of classes given (TreeEnsembleClassifier).", a4];
    }
    uint64_t v23 = +[MLLogging coreChannel];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    __int16 v27 = 0;
    id v24 = (uint8_t *)&v27;
LABEL_37:
    _os_log_error_impl(&dword_19E58B000, v23, OS_LOG_TYPE_ERROR, "Incorrect number of classes given (TreeEnsembleClassifier).", v24, 2u);
LABEL_32:

    uint64_t v14 = 0;
    BOOL v25 = 0;
    goto LABEL_33;
  }
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", v11, a4);
  if (!v11)
  {
    int64_t v16 = 3;
    if (!a6) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  uint64_t v15 = 0;
  int64_t v16 = 3;
  do
  {
    uint64_t v17 = (uint64_t *)(*(void *)a3 + v15);
    if (*((char *)v17 + 23) < 0) {
      uint64_t v17 = (uint64_t *)*v17;
    }
    uint64_t v18 = [NSString stringWithUTF8String:v17];
    [v14 addObject:v18];

    v15 += 24;
    --v11;
  }
  while (v11);
LABEL_24:
  if (a6) {
LABEL_25:
  }
    *a6 = v14;
LABEL_26:
  if (a7) {
    *a7 = v16;
  }
  BOOL v25 = 1;
LABEL_33:

  return v25;
}

@end