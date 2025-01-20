@interface MLSVMEngine
- (BOOL)freeModelOnDealloc;
- (BOOL)hasProbabilityPredictionEnabled;
- (BOOL)isInputSizeLowerBoundOnly;
- (MLSVMEngine)initWithLibSVMFile:(id)a3 classLabels:(id)a4;
- (MLSVMEngine)initWithSVMModel:(svm_model *)a3 freeOnDealloc:(BOOL)a4 isInputSizeLowerBoundOnly:(BOOL)a5 inputSize:(unint64_t)a6 classLabels:(id)a7;
- (MLSVMEngine)initWithSpecification:(void *)a3 error:(id *)a4;
- (NSArray)classLabels;
- (id)predict:(id)a3;
- (svm_model)model;
- (svm_node)allocSVMNodeVector:(unint64_t)a3;
- (unint64_t)inputSize;
- (unint64_t)numberOfClasses;
- (void)dealloc;
- (void)deallocSVMNodeVector:(svm_node *)a3;
- (void)fillSVMNodeVector:(svm_node *)a3 values:(const double *)a4 count:(unint64_t)a5;
- (void)predictProbabilities:(id)a3 probabilities:(double *)a4;
- (void)setClassLabels:(id)a3;
- (void)setFreeModelOnDealloc:(BOOL)a3;
- (void)setInputSize:(unint64_t)a3;
- (void)setIsInputSizeLowerBoundOnly:(BOOL)a3;
- (void)setModel:(svm_model *)a3;
@end

@implementation MLSVMEngine

- (void).cxx_destruct
{
}

- (void)setClassLabels:(id)a3
{
}

- (NSArray)classLabels
{
  return self->_classLabels;
}

- (void)setInputSize:(unint64_t)a3
{
  self->_inputSize = a3;
}

- (unint64_t)inputSize
{
  return self->_inputSize;
}

- (void)setIsInputSizeLowerBoundOnly:(BOOL)a3
{
  self->_isInputSizeLowerBoundOnly = a3;
}

- (BOOL)isInputSizeLowerBoundOnly
{
  return self->_isInputSizeLowerBoundOnly;
}

- (void)setFreeModelOnDealloc:(BOOL)a3
{
  self->_freeModelOnDealloc = a3;
}

- (BOOL)freeModelOnDealloc
{
  return self->_freeModelOnDealloc;
}

- (void)setModel:(svm_model *)a3
{
  self->_model = a3;
}

- (svm_model)model
{
  return self->_model;
}

- (MLSVMEngine)initWithSpecification:(void *)a3 error:(id *)a4
{
  v6 = self;
  if (*(_DWORD *)(*(void *)a3 + 44) == 401)
  {
    v7 = *(uint64_t **)(*(void *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)self);
    v7 = &CoreML::Specification::_SupportVectorClassifier_default_instance_;
  }
  uint64_t v100 = 0;
  uint64_t v101 = 0;
  v98 = &unk_1EF0D6218;
  unint64_t v99 = 0;
  int v8 = *((_DWORD *)v7 + 4);
  if (v8)
  {
    google::protobuf::RepeatedField<float>::Reserve((unsigned int *)&v100, v8);
    memcpy((void *)(v101 + 8), (const void *)(v7[3] + 8), 4 * *((int *)v7 + 4));
    LODWORD(v100) = *((_DWORD *)v7 + 4);
  }
  uint64_t v103 = 0;
  v104 = 0;
  unint64_t v102 = 0;
  unsigned int v9 = *((_DWORD *)v7 + 12);
  if (v9)
  {
    uint64_t v10 = v7[7];
    v11 = google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)&v102, *((_DWORD *)v7 + 12));
    google::protobuf::internal::RepeatedPtrFieldBase::MergeFromInnerLoop<google::protobuf::RepeatedPtrField<CoreML::Specification::Coefficients>::TypeHandler>(&v102, (CoreML::Specification::MILSpec::TensorValue_RepeatedLongInts **)v11, (CoreML::Specification::MILSpec::TensorValue_RepeatedLongInts **)(v10 + 8), v9, *v104 - v103);
    int v12 = v103 + v9;
    LODWORD(v103) = v12;
    if (*v104 < v12) {
      _DWORD *v104 = v12;
    }
  }
  uint64_t v105 = 0;
  uint64_t v106 = 0;
  int v13 = *((_DWORD *)v7 + 16);
  if (v13)
  {
    google::protobuf::RepeatedField<double>::Reserve((unsigned int *)&v105, v13);
    memcpy((void *)(v106 + 8), (const void *)(v7[9] + 8), 8 * *((int *)v7 + 16));
    LODWORD(v105) = *((_DWORD *)v7 + 16);
  }
  uint64_t v107 = 0;
  uint64_t v108 = 0;
  int v14 = *((_DWORD *)v7 + 22);
  if (v14)
  {
    google::protobuf::RepeatedField<double>::Reserve((unsigned int *)&v107, v14);
    memcpy((void *)(v108 + 8), (const void *)(v7[12] + 8), 8 * *((int *)v7 + 22));
    LODWORD(v107) = *((_DWORD *)v7 + 22);
  }
  uint64_t v109 = 0;
  uint64_t v110 = 0;
  int v15 = *((_DWORD *)v7 + 28);
  if (v15)
  {
    google::protobuf::RepeatedField<double>::Reserve((unsigned int *)&v109, v15);
    memcpy((void *)(v110 + 8), (const void *)(v7[15] + 8), 8 * *((int *)v7 + 28));
    LODWORD(v109) = *((_DWORD *)v7 + 28);
  }
  int v113 = 0;
  uint64_t v16 = v7[1];
  if (v16) {
    google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v99, v16 & 0xFFFFFFFFFFFFFFFELL);
  }
  if (v7 != &CoreML::Specification::_SupportVectorClassifier_default_instance_ && v7[17]) {
    operator new();
  }
  uint64_t v111 = 0;
  int v114 = 0;
  int v17 = *((_DWORD *)v7 + 41);
  if (v17 == 4)
  {
    int v114 = 4;
    operator new();
  }
  if (v17 == 3)
  {
    int v114 = 3;
    operator new();
  }
  int v115 = 0;
  int v18 = *((_DWORD *)v7 + 42);
  if (v18 == 101)
  {
    int v115 = 101;
    operator new();
  }
  if (v18 == 100)
  {
    int v115 = 100;
    operator new();
  }
  CoreML::Specification::Kernel::Kernel((CoreML::Specification::Kernel *)v95, (const CoreML::Specification::Kernel *)&CoreML::Specification::_Kernel_default_instance_);
  uint64_t v19 = 0;
  if (v97 == 2)
  {
    int v20 = 0;
    uint64_t v21 = *(void *)(v96 + 16);
    int v22 = 2;
  }
  else if (v97 == 3)
  {
    int v20 = *(_DWORD *)(v96 + 32);
    uint64_t v19 = *(void *)(v96 + 16);
    uint64_t v21 = *(void *)(v96 + 24);
    int v22 = 1;
  }
  else
  {
    int v20 = 0;
    if (v97 == 4)
    {
      uint64_t v21 = *(void *)(v96 + 16);
      uint64_t v19 = *(void *)(v96 + 24);
      int v22 = 3;
    }
    else
    {
      int v22 = 0;
      uint64_t v21 = 0;
    }
  }
  v23 = (int *)malloc_type_malloc(0xB8uLL, 0x109004003BC950CuLL);
  int *v23 = 0;
  v23[1] = v22;
  v23[2] = v20;
  *((void *)v23 + 2) = v21;
  *((void *)v23 + 3) = v19;
  *((void *)v23 + 19) = 0;
  v24 = malloc_type_malloc(8 * (int)v105, 0x100004000313F17uLL);
  *((void *)v23 + 16) = v24;
  uint64_t v25 = v105;
  if ((int)v105 >= 1)
  {
    v26 = (uint64_t *)(v106 + 8);
    do
    {
      uint64_t v27 = *v26++;
      *v24++ = v27;
      --v25;
    }
    while (v25);
  }
  if ((int)v107 <= 0)
  {
    *((void *)v23 + 17) = 0;
  }
  else
  {
    v28 = malloc_type_malloc(8 * v107, 0x100004000313F17uLL);
    *((void *)v23 + 17) = v28;
    uint64_t v29 = v107;
    if ((int)v107 >= 1)
    {
      v30 = (uint64_t *)(v108 + 8);
      do
      {
        uint64_t v31 = *v30++;
        *v28++ = v31;
        --v29;
      }
      while (v29);
    }
  }
  if ((int)v109 < 1)
  {
    *((void *)v23 + 18) = 0;
  }
  else
  {
    v32 = malloc_type_malloc(8 * v109, 0x100004000313F17uLL);
    *((void *)v23 + 18) = v32;
    uint64_t v33 = v109;
    if ((int)v109 >= 1)
    {
      v34 = (uint64_t *)(v110 + 8);
      do
      {
        uint64_t v35 = *v34++;
        *v32++ = v35;
        --v33;
      }
      while (v33);
    }
  }
  inited = (unint64_t *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v37 = inited;
  if (*(_DWORD *)(*(void *)a3 + 44) == 401)
  {
    v38 = *(uint64_t **)(*(void *)a3 + 32);
  }
  else
  {
    inited = CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)inited);
    v38 = &CoreML::Specification::_SupportVectorClassifier_default_instance_;
  }
  int v39 = *((_DWORD *)v38 + 42);
  switch(v39)
  {
    case 0:
      if (a4)
      {
        *a4 = +[MLModelErrorUtils genericErrorWithFormat:@"class labels not set."];
      }
      if (!v23) {
        goto LABEL_134;
      }
      goto LABEL_133;
    case 101:
      for (uint64_t i = 0; ; ++i)
      {
        if (*(_DWORD *)(*(void *)a3 + 44) == 401)
        {
          v49 = *(uint64_t **)(*(void *)a3 + 32);
        }
        else
        {
          inited = CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)inited);
          v49 = &CoreML::Specification::_SupportVectorClassifier_default_instance_;
        }
        if (*((_DWORD *)v49 + 42) == 101)
        {
          v50 = (uint64_t *)v49[19];
        }
        else
        {
          inited = CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults((CoreML::Specification::protobuf_DataStructures_2eproto *)inited);
          v50 = &CoreML::Specification::_Int64Vector_default_instance_;
        }
        if (i >= *((int *)v50 + 4)) {
          break;
        }
        v51 = NSNumber;
        if (*(_DWORD *)(*(void *)a3 + 44) == 401)
        {
          v52 = *(uint64_t **)(*(void *)a3 + 32);
        }
        else
        {
          inited = CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)inited);
          v52 = &CoreML::Specification::_SupportVectorClassifier_default_instance_;
        }
        if (*((_DWORD *)v52 + 42) == 101)
        {
          v53 = (uint64_t *)v52[19];
        }
        else
        {
          CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults((CoreML::Specification::protobuf_DataStructures_2eproto *)inited);
          v53 = &CoreML::Specification::_Int64Vector_default_instance_;
        }
        v54 = [v51 numberWithLongLong:*(void *)(v53[3] + 8 * i + 8)];
        [v37 addObject:v54];
      }
      if (*(_DWORD *)(*(void *)a3 + 44) == 401)
      {
        v57 = *(uint64_t **)(*(void *)a3 + 32);
      }
      else
      {
        inited = CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)inited);
        v57 = &CoreML::Specification::_SupportVectorClassifier_default_instance_;
      }
      if (*((_DWORD *)v57 + 42) == 101)
      {
        v59 = (uint64_t *)v57[19];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults((CoreML::Specification::protobuf_DataStructures_2eproto *)inited);
        v59 = &CoreML::Specification::_Int64Vector_default_instance_;
      }
      int v55 = *((_DWORD *)v59 + 4);
      break;
    case 100:
      for (uint64_t j = 0; ; ++j)
      {
        if (*(_DWORD *)(*(void *)a3 + 44) == 401)
        {
          v41 = *(uint64_t **)(*(void *)a3 + 32);
        }
        else
        {
          inited = CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)inited);
          v41 = &CoreML::Specification::_SupportVectorClassifier_default_instance_;
        }
        if (*((_DWORD *)v41 + 42) == 100)
        {
          v42 = (uint64_t *)v41[19];
        }
        else
        {
          inited = CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults((CoreML::Specification::protobuf_DataStructures_2eproto *)inited);
          v42 = &CoreML::Specification::_StringVector_default_instance_;
        }
        if (j >= *((int *)v42 + 6)) {
          break;
        }
        v43 = NSString;
        if (*(_DWORD *)(*(void *)a3 + 44) == 401)
        {
          v44 = *(uint64_t **)(*(void *)a3 + 32);
        }
        else
        {
          inited = CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)inited);
          v44 = &CoreML::Specification::_SupportVectorClassifier_default_instance_;
        }
        if (*((_DWORD *)v44 + 42) == 100)
        {
          v45 = (uint64_t *)v44[19];
        }
        else
        {
          CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults((CoreML::Specification::protobuf_DataStructures_2eproto *)inited);
          v45 = &CoreML::Specification::_StringVector_default_instance_;
        }
        v46 = *(uint64_t **)(v45[4] + 8 * j + 8);
        if (*((char *)v46 + 23) < 0) {
          v46 = (uint64_t *)*v46;
        }
        v47 = [v43 stringWithUTF8String:v46];
        [v37 addObject:v47];
      }
      if (*(_DWORD *)(*(void *)a3 + 44) == 401)
      {
        v56 = *(uint64_t **)(*(void *)a3 + 32);
      }
      else
      {
        inited = CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)inited);
        v56 = &CoreML::Specification::_SupportVectorClassifier_default_instance_;
      }
      if (*((_DWORD *)v56 + 42) == 100)
      {
        v58 = (uint64_t *)v56[19];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults((CoreML::Specification::protobuf_DataStructures_2eproto *)inited);
        v58 = &CoreML::Specification::_StringVector_default_instance_;
      }
      int v55 = *((_DWORD *)v58 + 6);
      break;
    default:
      int v55 = v23[26];
      goto LABEL_108;
  }
  v23[26] = v55;
LABEL_108:
  v60 = malloc_type_malloc(4 * v55, 0x100004052888210uLL);
  *((void *)v23 + 20) = v60;
  if (v23[26] >= 1)
  {
    uint64_t v61 = 0;
    do
    {
      v60[v61] = v61;
      ++v61;
    }
    while (v61 < v23[26]);
  }
  int v62 = v100;
  v63 = (CoreML::Specification::protobuf_SVM_2eproto *)malloc_type_malloc(4 * (int)v100, 0x100004052888210uLL);
  uint64_t v64 = v62;
  *((void *)v23 + 21) = v63;
  if (v62 >= 1)
  {
    v65 = (int *)(v101 + 8);
    do
    {
      int v66 = *v65++;
      *(_DWORD *)v63 = v66;
      v63 = (CoreML::Specification::protobuf_SVM_2eproto *)((char *)v63 + 4);
      --v64;
    }
    while (v64);
  }
  if (v114 == 3 || v114 == 4)
  {
    v67 = v112;
  }
  else
  {
    CoreML::Specification::protobuf_SVM_2eproto::InitDefaults(v63);
    v67 = (CoreML::Specification::SparseSupportVectors *)&CoreML::Specification::_SparseSupportVectors_default_instance_;
  }
  uint64_t v68 = *((unsigned int *)v67 + 6);
  v23[27] = v68;
  if ((int)v68 <= 0)
  {
    if (a4)
    {
      v78 = +[MLModelErrorUtils genericErrorWithFormat:@"SVM has invalid number of support vectors or clases"];
LABEL_132:
      *a4 = v78;
    }
LABEL_133:
    svm_free_model_content((uint64_t)v23);
    free(v23);
LABEL_134:
    v79 = 0;
    goto LABEL_151;
  }
  *((void *)v23 + 14) = malloc_type_malloc(8 * v68, 0x2004093837F09uLL);
  switch(v114)
  {
    case 0:
      if (a4)
      {
        v78 = +[MLModelErrorUtils genericErrorWithFormat:@"Internal error: support vectors not set."];
        goto LABEL_132;
      }
      goto LABEL_133;
    case 3:
      CoreML::Specification::SparseSupportVectors::SparseSupportVectors((CoreML::Specification::SparseSupportVectors *)v93, v112);
      uint64_t v80 = 0;
      uint64_t v70 = -1;
      do
      {
        uint64_t v81 = *(unsigned int *)(*(void *)(v94 + 8 * v80 + 8) + 24);
        v82 = (char *)malloc_type_malloc(16 * ((int)v81 + 1), 0x1000040F7F8B94BuLL);
        if ((int)v81 >= 1)
        {
          v83 = v82 + 8;
          v84 = (uint64_t *)(*(void *)(*(void *)(v94 + 8 * v80 + 8) + 32) + 8);
          uint64_t v85 = v81;
          do
          {
            uint64_t v86 = *v84++;
            *((_DWORD *)v83 - 2) = *(_DWORD *)(v86 + 24);
            void *v83 = *(void *)(v86 + 16);
            v83 += 2;
            --v85;
          }
          while (v85);
        }
        v87 = &v82[16 * (int)v81];
        *(_DWORD *)v87 = -1;
        *((void *)v87 + 1) = 0x7FF8000000000000;
        if (v81 && v70 <= *(int *)&v82[16 * (int)v81 - 16]) {
          uint64_t v70 = *(int *)&v82[16 * (int)v81 - 16];
        }
        *(void *)(*((void *)v23 + 14) + 8 * v80++) = v82;
      }
      while (v80 != v68);
      CoreML::Specification::SparseSupportVectors::~SparseSupportVectors((CoreML::Specification::SparseSupportVectors *)v93);
      uint64_t v77 = 1;
      break;
    case 4:
      CoreML::Specification::DenseSupportVectors::DenseSupportVectors((CoreML::Specification::DenseSupportVectors *)v93, v112);
      uint64_t v69 = 0;
      uint64_t v70 = *(int *)(*(void *)(v94 + 8) + 16);
      do
      {
        uint64_t v71 = *(unsigned int *)(*(void *)(v94 + 8 * v69 + 8) + 16);
        v72 = (char *)malloc_type_malloc(16 * ((int)v71 + 1), 0x1000040F7F8B94BuLL);
        if ((int)v71 >= 1)
        {
          uint64_t v73 = 0;
          v74 = v72 + 8;
          uint64_t v75 = *(void *)(*(void *)(v94 + 8 * v69 + 8) + 24) + 8;
          do
          {
            *((_DWORD *)v74 - 2) = v73 + 1;
            void *v74 = *(void *)(v75 + 8 * v73);
            v74 += 2;
            ++v73;
          }
          while (v71 != v73);
        }
        v76 = &v72[16 * (int)v71];
        *(_DWORD *)v76 = -1;
        *((void *)v76 + 1) = 0x7FF8000000000000;
        *(void *)(*((void *)v23 + 14) + 8 * v69++) = v72;
      }
      while (v69 != v68);
      CoreML::Specification::DenseSupportVectors::~DenseSupportVectors((CoreML::Specification::DenseSupportVectors *)v93);
      uint64_t v77 = 0;
      break;
    default:
      uint64_t v77 = 0;
      uint64_t v70 = 0;
      break;
  }
  *((void *)v23 + 15) = malloc_type_malloc(8 * (int)v103, 0x80040B8603338uLL);
  if ((int)v103 >= 1)
  {
    uint64_t v88 = 0;
    do
    {
      v89 = malloc_type_malloc(8 * v68, 0x100004000313F17uLL);
      uint64_t v90 = 0;
      uint64_t v91 = *(void *)(*(void *)&v104[2 * v88 + 2] + 24) + 8;
      do
      {
        v89[v90] = *(void *)(v91 + 8 * v90);
        ++v90;
      }
      while (v68 != v90);
      *(void *)(*((void *)v23 + 15) + 8 * v88++) = v89;
    }
    while (v88 < (int)v103);
  }
  v23[44] = 0;
  v6 = [(MLSVMEngine *)v6 initWithSVMModel:v23 freeOnDealloc:1 isInputSizeLowerBoundOnly:v77 inputSize:v70 classLabels:v37];
  v79 = v6;
LABEL_151:

  CoreML::Specification::Kernel::~Kernel((CoreML::Specification::Kernel *)v95);
  CoreML::Specification::SupportVectorClassifier::~SupportVectorClassifier((CoreML::Specification::SupportVectorClassifier *)&v98);

  return v79;
}

- (void)predictProbabilities:(id)a3 probabilities:(double *)a4
{
  id v6 = a3;
  v7 = [v6 shape];
  int v8 = [v7 objectAtIndexedSubscript:0];
  uint64_t v9 = [v8 unsignedIntegerValue];

  uint64_t v10 = [(MLSVMEngine *)self allocSVMNodeVector:v9];
  id v11 = v6;
  -[MLSVMEngine fillSVMNodeVector:values:count:](self, "fillSVMNodeVector:values:count:", v10, [v11 bytes], v9);
  -[MLSVMEngine deallocSVMNodeVector:](self, "deallocSVMNodeVector:", v10, svm_predict_probability((uint64_t)self->_model, (Kernel *)v10, a4));
}

- (BOOL)hasProbabilityPredictionEnabled
{
  model = self->_model;
  return model->var6 && model->var7 != 0;
}

- (id)predict:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  v4 = [v22 shape];
  v5 = [v4 objectAtIndexedSubscript:0];
  uint64_t v6 = [v5 unsignedIntegerValue];

  v7 = [v22 shape];
  if ([v7 count] == 2)
  {
    int v8 = [v22 shape];
    uint64_t v9 = [v8 objectAtIndexedSubscript:1];
    uint64_t v10 = [v9 unsignedIntegerValue];
  }
  else
  {
    uint64_t v10 = 1;
  }

  id v11 = [(MLSVMEngine *)self allocSVMNodeVector:v6];
  int v12 = [MLMultiArray alloc];
  v23[0] = &unk_1EF11A178;
  int v13 = [NSNumber numberWithUnsignedInteger:v10];
  v23[1] = v13;
  int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  int v15 = [(MLMultiArray *)v12 initWithShape:v14 dataType:65600 error:0];

  id v16 = v22;
  uint64_t v17 = [v16 bytes];
  int v18 = v15;
  uint64_t v19 = [(MLMultiArray *)v18 mutableBytes];
  if (v10)
  {
    int v20 = (double *)v19;
    do
    {
      [(MLSVMEngine *)self fillSVMNodeVector:v11 values:v17 count:v6];
      *v20++ = svm_predict((uint64_t)self->_model, (Kernel *)v11);
      v17 += 8 * v6;
      --v10;
    }
    while (v10);
  }
  [(MLSVMEngine *)self deallocSVMNodeVector:v11];

  return v18;
}

- (void)deallocSVMNodeVector:(svm_node *)a3
{
}

- (void)fillSVMNodeVector:(svm_node *)a3 values:(const double *)a4 count:(unint64_t)a5
{
  if (a5)
  {
    uint64_t v5 = 0;
    p_var1 = &a3->var1;
    do
    {
      double v7 = a4[v5];
      *((_DWORD *)p_var1 - 2) = v5 + 1;
      double *p_var1 = v7;
      p_var1 += 2;
      ++v5;
    }
    while (a5 != v5);
  }
}

- (svm_node)allocSVMNodeVector:(unint64_t)a3
{
  result = (svm_node *)malloc_type_malloc(16 * a3 + 16, 0x1000040F7F8B94BuLL);
  uint64_t v5 = &result[a3];
  v5->var0 = -1;
  v5->var1 = NAN;
  return result;
}

- (unint64_t)numberOfClasses
{
  return self->_model->var1;
}

- (void)dealloc
{
  if (self->_freeModelOnDealloc)
  {
    p_model = &self->_model;
    model = self->_model;
    if (!model->var11 && model->var2 >= 1)
    {
      uint64_t v5 = 0;
      do
      {
        free(model->var3[v5++]);
        model = *p_model;
      }
      while (v5 < (*p_model)->var2);
    }
    svm_free_and_destroy_model((void **)&self->_model);
  }
  v6.receiver = self;
  v6.super_class = (Class)MLSVMEngine;
  [(MLSVMEngine *)&v6 dealloc];
}

- (MLSVMEngine)initWithSVMModel:(svm_model *)a3 freeOnDealloc:(BOOL)a4 isInputSizeLowerBoundOnly:(BOOL)a5 inputSize:(unint64_t)a6 classLabels:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)MLSVMEngine;
  int v14 = [(MLSVMEngine *)&v17 init];
  int v15 = v14;
  if (v14)
  {
    v14->_freeModelOnDealloc = a4;
    v14->_isInputSizeLowerBoundOnly = a5;
    v14->_model = a3;
    v14->_inputSize = a6;
    objc_storeStrong((id *)&v14->_classLabels, a7);
  }

  return v15;
}

- (MLSVMEngine)initWithLibSVMFile:(id)a3 classLabels:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  model = svm_load_model((const char *)[v8 UTF8String]);
  if (model)
  {
    uint64_t v10 = *((unsigned int *)model + 27);
    if ((int)v10 < 1)
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v11 = 0;
      LODWORD(v12) = 0;
      do
      {
        uint64_t v13 = *(void *)(*((void *)model + 14) + 8 * v11);
        int v14 = (int *)(v13 + 16);
        unsigned int v15 = -1;
        do
        {
          int v16 = *v14;
          v14 += 4;
          ++v15;
        }
        while (v16 != -1);
        int v17 = *(_DWORD *)(v13 + 16 * v15);
        if ((int)v12 <= v17) {
          uint64_t v12 = v17;
        }
        else {
          uint64_t v12 = v12;
        }
        ++v11;
      }
      while (v11 != v10);
    }
    self = [(MLSVMEngine *)self initWithSVMModel:model freeOnDealloc:1 isInputSizeLowerBoundOnly:1 inputSize:v12 classLabels:v7];
    int v18 = self;
  }
  else
  {
    int v18 = 0;
  }

  return v18;
}

@end