@interface MLSupportVectorClassifier
+ (id)featureValueWithObject:(id)a3;
- (MLSVMEngine)engine;
- (MLSupportVectorClassifier)initWithEngine:(id)a3 description:(id)a4 configuration:(id)a5 error:(id *)a6;
- (id)classify:(id)a3 options:(id)a4 error:(id *)a5;
- (void)setEngine:(id)a3;
@end

@implementation MLSupportVectorClassifier

- (void).cxx_destruct
{
}

- (void)setEngine:(id)a3
{
}

- (MLSVMEngine)engine
{
  return (MLSVMEngine *)objc_getProperty(self, a2, 96, 1);
}

- (id)classify:(id)a3 options:(id)a4 error:(id *)a5
{
  v110[1] = *MEMORY[0x1E4F143B8];
  id v96 = a3;
  id v99 = a4;
  v8 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v104, v8, 26, -[MLModel signpostID](self, "signpostID"), [v99 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v9 = [(MLModel *)self signpostID];
  uint64_t v10 = [v99 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__MLSupportVectorClassifier_classify_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v9;
  aBlock[5] = v10;
  v95 = (void (**)(void))_Block_copy(aBlock);
  unint64_t v11 = [v99 classifyTopK];
  unint64_t v12 = [(MLSVMEngine *)self->_engine numberOfClasses];
  if (v12 >= v11) {
    unint64_t v13 = v11;
  }
  else {
    unint64_t v13 = v12;
  }
  v14 = [(MLModel *)self modelDescription];
  v15 = [v14 inputFeatureNames];
  v16 = [v15 array];
  v98 = +[MLFeatureProviderUtils vectorizeFeaturesProvidedBy:v96 featureNames:v16 error:a5];

  if (!v98) {
    goto LABEL_71;
  }
  if ([(MLSVMEngine *)self->_engine isInputSizeLowerBoundOnly])
  {
    int64_t v17 = [v98 count];
    if (v17 < (int64_t)[(MLSVMEngine *)self->_engine inputSize])
    {
      if (a5)
      {
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", @"Input feature length mismatch. Got features of length %d expected length of at least %d", [v98 count], -[MLSVMEngine inputSize](self->_engine, "inputSize"));
        id v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_70:
        v61 = 0;
        *a5 = v18;
        goto LABEL_109;
      }
      goto LABEL_71;
    }
  }
  else
  {
    uint64_t v19 = [v98 count];
    if (v19 != [(MLSVMEngine *)self->_engine inputSize])
    {
      if (a5)
      {
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", @"Input feature length mismatch. Got features of length %d expected length of %d", [v98 count], -[MLSVMEngine inputSize](self->_engine, "inputSize"));
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_70;
      }
LABEL_71:
      v61 = 0;
      goto LABEL_109;
    }
  }
  if (![(MLSVMEngine *)self->_engine hasProbabilityPredictionEnabled])
  {
    v62 = [(MLSVMEngine *)self->_engine predict:v98];
    v63 = [v62 objectAtIndexedSubscript:0];
    uint64_t v64 = [v63 integerValue];

    v65 = [(MLSupportVectorClassifier *)self engine];
    v66 = [v65 classLabels];
    BOOL v67 = v66 == 0;

    if (v67)
    {
      v71 = [NSNumber numberWithUnsignedInt:v64];
      v105 = v71;
      v106 = &unk_1EF119EC0;
      v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
      v61 = +[MLClassifierResult resultWithIntClassProbability:v72];
    }
    else
    {
      v68 = [(MLSupportVectorClassifier *)self engine];
      v69 = [v68 classLabels];
      v70 = [v69 objectAtIndexedSubscript:v64];
      v71 = +[MLSupportVectorClassifier featureValueWithObject:v70];

      if ([v71 type] == 1)
      {
        v72 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v71, "int64Value"));
        v109 = v72;
        v110[0] = &unk_1EF119EC0;
        v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:&v109 count:1];
        +[MLClassifierResult resultWithIntClassProbability:v73];
      }
      else
      {
        v72 = [v71 stringValue];
        v107 = v72;
        v108 = &unk_1EF119EC0;
        v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
        +[MLClassifierResult resultWithStringClassProbability:v73];
      v61 = };
    }
    goto LABEL_109;
  }
  std::vector<double>::vector(v102, [(MLSVMEngine *)self->_engine numberOfClasses]);
  [(MLSVMEngine *)self->_engine predictProbabilities:v98 probabilities:v102[0]];
  unint64_t v20 = [(MLSVMEngine *)self->_engine numberOfClasses];
  if (v20 < v13) {
    unint64_t v13 = v20;
  }
  std::vector<unsigned long>::vector(&__p, [(MLSVMEngine *)self->_engine numberOfClasses]);
  v21 = __p;
  v22 = v101;
  if (__p != v101)
  {
    uint64_t v23 = 0;
    do
      *v21++ = v23++;
    while (v21 != v22);
  }
  if (v13 >= [(MLSVMEngine *)self->_engine numberOfClasses]) {
    goto LABEL_94;
  }
  v25 = (uint64_t *)__p;
  v24 = (uint64_t *)v101;
  v26 = (uint64_t *)((char *)__p + 8 * v13);
  if (v26 == (uint64_t *)v101) {
    goto LABEL_93;
  }
  while (1)
  {
    unint64_t v27 = v24 - v25;
    if (v27 < 2) {
      goto LABEL_93;
    }
    if (v27 == 3)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:]::$_1 &,std::__wrap_iter<unsigned long *>>(v25, v25 + 1, v24 - 1, (uint64_t)v102[0]);
      goto LABEL_93;
    }
    if (v27 == 2)
    {
      uint64_t v74 = *(v24 - 1);
      uint64_t v75 = *v25;
      if (*((double *)v102[0] + v74) > *((double *)v102[0] + *v25))
      {
        uint64_t *v25 = v74;
        *(v24 - 1) = v75;
      }
      goto LABEL_93;
    }
    if ((char *)v24 - (char *)v25 <= 63)
    {
      if (v24 - 1 == v25) {
        goto LABEL_93;
      }
      v76 = (double *)v102[0];
      while (1)
      {
        v77 = v24;
        if (v25 == v24) {
          goto LABEL_90;
        }
        v78 = v25 + 1;
        if (v25 + 1 != v24) {
          break;
        }
LABEL_92:
        if (++v25 == v24 - 1) {
          goto LABEL_93;
        }
      }
      uint64_t v79 = *v25;
      v77 = v25;
      v80 = v25 + 1;
      do
      {
        uint64_t v82 = *v80++;
        uint64_t v81 = v82;
        if (v76[v82] > v76[v79])
        {
          uint64_t v79 = v81;
          v77 = v78;
        }
        v78 = v80;
      }
      while (v80 != v24);
LABEL_90:
      if (v77 != v25)
      {
        uint64_t v83 = *v25;
        uint64_t *v25 = *v77;
        uint64_t *v77 = v83;
      }
      goto LABEL_92;
    }
    v28 = &v25[v27 >> 1];
    v29 = v24 - 1;
    int v30 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:]::$_1 &,std::__wrap_iter<unsigned long *>>(v25, v28, v24 - 1, (uint64_t)v102[0]);
    uint64_t v31 = *v25;
    v32 = (double *)v102[0];
    double v33 = *((double *)v102[0] + *v25);
    double v34 = *((double *)v102[0] + *v28);
    if (v33 <= v34) {
      break;
    }
LABEL_27:
    v39 = v25 + 1;
    if (v25 + 1 >= v29)
    {
      v42 = v25 + 1;
    }
    else
    {
      v40 = v25 + 1;
      while (1)
      {
        double v41 = v32[*v28];
        do
        {
          v42 = v40;
          uint64_t v44 = *v40++;
          uint64_t v43 = v44;
        }
        while (v32[v44] > v41);
        do
        {
          uint64_t v46 = *--v29;
          uint64_t v45 = v46;
        }
        while (v32[v46] <= v41);
        if (v42 >= v29) {
          break;
        }
        uint64_t *v42 = v45;
        uint64_t *v29 = v43;
        ++v30;
        if (v28 == v42) {
          v28 = v29;
        }
      }
    }
    if (v42 != v28)
    {
      uint64_t v47 = *v42;
      if (v32[*v28] > v32[*v42])
      {
        uint64_t *v42 = *v28;
        uint64_t *v28 = v47;
        ++v30;
      }
    }
    if (v42 == v26) {
      goto LABEL_93;
    }
    if (!v30)
    {
      if (v42 <= v26)
      {
        v53 = v42 + 1;
        while (v53 != v24)
        {
          double v54 = v32[*v53];
          double v55 = v32[*(v53++ - 1)];
          if (v54 > v55) {
            goto LABEL_42;
          }
        }
      }
      else
      {
        while (v39 != v42)
        {
          double v49 = v32[*v39];
          double v50 = v32[*(v39++ - 1)];
          if (v49 > v50) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_93;
    }
LABEL_42:
    if (v42 <= v26)
    {
      v48 = v42 + 1;
    }
    else
    {
      v24 = v42;
      v48 = v25;
    }
LABEL_66:
    v25 = v48;
    if (v24 == v26) {
      goto LABEL_93;
    }
  }
  v35 = v24 - 2;
  while (v35 != v25)
  {
    v36 = v35;
    uint64_t v38 = *v35--;
    uint64_t v37 = v38;
    if (*((double *)v102[0] + v38) > v34)
    {
      uint64_t *v25 = v37;
      uint64_t *v36 = v31;
      ++v30;
      v29 = v36;
      goto LABEL_27;
    }
  }
  v51 = v25 + 1;
  if (v33 > *((double *)v102[0] + *v29))
  {
LABEL_58:
    if (v51 == v29) {
      goto LABEL_93;
    }
    while (1)
    {
      double v56 = v32[*v25];
      do
      {
        v48 = v51;
        uint64_t v58 = *v51++;
        uint64_t v57 = v58;
      }
      while (v56 <= v32[v58]);
      do
      {
        uint64_t v60 = *--v29;
        uint64_t v59 = v60;
      }
      while (v56 > v32[v60]);
      if (v48 >= v29) {
        break;
      }
      uint64_t *v48 = v59;
      uint64_t *v29 = v57;
    }
    if (v48 > v26) {
      goto LABEL_93;
    }
    goto LABEL_66;
  }
  while (v51 != v29)
  {
    uint64_t v52 = *v51;
    if (v33 > *((double *)v102[0] + *v51))
    {
      *v51++ = *v29;
      uint64_t *v29 = v52;
      goto LABEL_58;
    }
    ++v51;
  }
LABEL_93:
  std::vector<unsigned long>::resize(&__p, v13);
LABEL_94:
  v97 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v13];
  if (v13)
  {
    unint64_t v84 = v13;
    uint64_t v85 = 0;
    v86 = 0;
    do
    {
      uint64_t v87 = *((void *)__p + v85);
      v88 = [(MLSupportVectorClassifier *)self engine];
      v89 = [v88 classLabels];
      v90 = [v89 objectAtIndexedSubscript:v87];
      v91 = +[MLSupportVectorClassifier featureValueWithObject:v90];

      v92 = [NSNumber numberWithDouble:*((double *)v102[0] + v87)];
      if ([v91 type] == 1) {
        objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v91, "int64Value"));
      }
      else {
      v93 = [v91 stringValue];
      }
      [v97 setObject:v92 forKeyedSubscript:v93];

      ++v85;
      v86 = v91;
    }
    while (v84 != v85);
  }
  else
  {
    v91 = 0;
  }
  if ([v91 type] == 1) {
    +[MLClassifierResult resultWithIntClassProbability:v97];
  }
  else {
  v61 = +[MLClassifierResult resultWithStringClassProbability:v97];
  }

  if (__p)
  {
    v101 = (char *)__p;
    operator delete(__p);
  }
  if (v102[0])
  {
    v102[1] = v102[0];
    operator delete(v102[0]);
  }
LABEL_109:

  v95[2](v95);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v104);

  return v61;
}

uint64_t __52__MLSupportVectorClassifier_classify_options_error___block_invoke()
{
  return kdebug_trace();
}

- (MLSupportVectorClassifier)initWithEngine:(id)a3 description:(id)a4 configuration:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MLSupportVectorClassifier;
  v14 = [(MLClassifier *)&v19 initWithDescription:v12 configuration:v13 error:a6];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_engine, a3);
    v16 = [v11 classLabels];
    int64_t v17 = [(MLModel *)v15 modelDescription];
    [v17 setClassLabels:v16];
  }
  return v15;
}

+ (id)featureValueWithObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = +[MLFeatureValue featureValueWithString:v3];
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = +[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", [v3 longLongValue]);
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

@end