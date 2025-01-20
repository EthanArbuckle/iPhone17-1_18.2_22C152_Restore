@interface MLSVREngine
- (BOOL)freeModelOnDealloc;
- (BOOL)isInputSizeLowerBoundOnly;
- (MLSVREngine)initWithLibSVMFile:(id)a3;
- (MLSVREngine)initWithSVMModel:(svm_model *)a3 freeOnDealloc:(BOOL)a4 isInputSizeLowerBoundOnly:(BOOL)a5 inputSize:(unint64_t)a6;
- (MLSVREngine)initWithSpecification:(void *)a3 error:(id *)a4;
- (id)predict:(id)a3;
- (svm_model)model;
- (svm_node)allocSVMNodeVector:(unint64_t)a3;
- (unint64_t)inputSize;
- (void)dealloc;
- (void)deallocSVMNodeVector:(svm_node *)a3;
- (void)fillSVMNodeVector:(svm_node *)a3 values:(const double *)a4 count:(unint64_t)a5;
- (void)setFreeModelOnDealloc:(BOOL)a3;
- (void)setModel:(svm_model *)a3;
@end

@implementation MLSVREngine

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

- (unint64_t)inputSize
{
  return self->_inputSize;
}

- (BOOL)isInputSizeLowerBoundOnly
{
  return self->_isInputSizeLowerBoundOnly;
}

- (MLSVREngine)initWithSpecification:(void *)a3 error:(id *)a4
{
  v5 = self;
  if (*(_DWORD *)(*(void *)a3 + 44) == 301)
  {
    v6 = *(uint64_t **)(*(void *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)self);
    v6 = &CoreML::Specification::_SupportVectorRegressor_default_instance_;
  }
  if (v6[2]) {
    v7 = (const CoreML::Specification::Kernel *)v6[2];
  }
  else {
    v7 = (const CoreML::Specification::Kernel *)&CoreML::Specification::_Kernel_default_instance_;
  }
  CoreML::Specification::Kernel::Kernel((CoreML::Specification::Kernel *)v44, v7);
  uint64_t v8 = 0;
  if (v46 == 2)
  {
    int v9 = 0;
    uint64_t v10 = *(void *)(v45 + 16);
    int v11 = 2;
  }
  else if (v46 == 3)
  {
    int v9 = *(_DWORD *)(v45 + 32);
    uint64_t v8 = *(void *)(v45 + 16);
    uint64_t v10 = *(void *)(v45 + 24);
    int v11 = 1;
  }
  else
  {
    int v9 = 0;
    if (v46 == 4)
    {
      uint64_t v10 = *(void *)(v45 + 16);
      uint64_t v8 = *(void *)(v45 + 24);
      int v11 = 3;
    }
    else
    {
      int v11 = 0;
      uint64_t v10 = 0;
    }
  }
  v12 = (char *)malloc_type_malloc(0xB8uLL, 0x109004003BC950CuLL);
  *(_DWORD *)v12 = 4;
  *((_DWORD *)v12 + 1) = v11;
  *((_DWORD *)v12 + 2) = v9;
  *((void *)v12 + 2) = v10;
  *((void *)v12 + 3) = v8;
  *(_OWORD *)(v12 + 136) = 0u;
  *(_OWORD *)(v12 + 152) = 0u;
  *((_DWORD *)v12 + 26) = 2;
  *((void *)v12 + 21) = 0;
  v13 = (CoreML::Specification::protobuf_SVM_2eproto *)malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  *((void *)v12 + 16) = v13;
  *(void *)v13 = v6[4];
  if ((*((_DWORD *)v6 + 13) & 0xFFFFFFFE) == 2)
  {
    v14 = (uint64_t *)v6[5];
  }
  else
  {
    CoreML::Specification::protobuf_SVM_2eproto::InitDefaults(v13);
    v14 = &CoreML::Specification::_SparseSupportVectors_default_instance_;
  }
  uint64_t v15 = *((int *)v14 + 6);
  *((_DWORD *)v12 + 27) = v15;
  size_t v16 = 8 * v15;
  *((void *)v12 + 14) = malloc_type_malloc(8 * v15, 0x2004093837F09uLL);
  int v17 = *((_DWORD *)v6 + 13);
  if (v17)
  {
    uint64_t v18 = v15;
    if (v17 == 2)
    {
      CoreML::Specification::SparseSupportVectors::SparseSupportVectors((CoreML::Specification::SparseSupportVectors *)v42, (const CoreML::Specification::SparseSupportVectors *)v6[5]);
      if ((int)v15 < 1)
      {
        uint64_t v19 = -1;
      }
      else
      {
        uint64_t v29 = 0;
        uint64_t v19 = -1;
        do
        {
          uint64_t v30 = *(unsigned int *)(*(void *)(v43 + 8 * v29 + 8) + 24);
          v31 = (char *)malloc_type_malloc(16 * ((int)v30 + 1), 0x1000040F7F8B94BuLL);
          if ((int)v30 >= 1)
          {
            v32 = v31 + 8;
            v33 = (uint64_t *)(*(void *)(*(void *)(v43 + 8 * v29 + 8) + 32) + 8);
            uint64_t v34 = v30;
            do
            {
              uint64_t v35 = *v33++;
              *((_DWORD *)v32 - 2) = *(_DWORD *)(v35 + 24);
              void *v32 = *(void *)(v35 + 16);
              v32 += 2;
              --v34;
            }
            while (v34);
          }
          v36 = &v31[16 * (int)v30];
          *(_DWORD *)v36 = -1;
          *((void *)v36 + 1) = 0x7FF8000000000000;
          if (v19 <= *(int *)&v31[16 * (int)v30 - 16]) {
            uint64_t v19 = *(int *)&v31[16 * (int)v30 - 16];
          }
          *(void *)(*((void *)v12 + 14) + 8 * v29++) = v31;
        }
        while (v29 != v18);
      }
      CoreML::Specification::SparseSupportVectors::~SparseSupportVectors((CoreML::Specification::SparseSupportVectors *)v42);
      uint64_t v27 = 1;
    }
    else if (v17 == 3)
    {
      CoreML::Specification::DenseSupportVectors::DenseSupportVectors((CoreML::Specification::DenseSupportVectors *)v42, (const CoreML::Specification::DenseSupportVectors *)v6[5]);
      uint64_t v19 = *(int *)(*(void *)(v43 + 8) + 16);
      if ((int)v15 >= 1)
      {
        uint64_t v20 = 0;
        do
        {
          uint64_t v21 = *(unsigned int *)(*(void *)(v43 + 8 * v20 + 8) + 16);
          v22 = (char *)malloc_type_malloc(16 * ((int)v21 + 1), 0x1000040F7F8B94BuLL);
          if ((int)v21 >= 1)
          {
            uint64_t v23 = 0;
            v24 = v22 + 8;
            uint64_t v25 = *(void *)(*(void *)(v43 + 8 * v20 + 8) + 24) + 8;
            do
            {
              *((_DWORD *)v24 - 2) = v23 + 1;
              void *v24 = *(void *)(v25 + 8 * v23);
              v24 += 2;
              ++v23;
            }
            while (v21 != v23);
          }
          v26 = &v22[16 * (int)v21];
          *(_DWORD *)v26 = -1;
          *((void *)v26 + 1) = 0x7FF8000000000000;
          *(void *)(*((void *)v12 + 14) + 8 * v20++) = v22;
        }
        while (v20 != v18);
      }
      CoreML::Specification::DenseSupportVectors::~DenseSupportVectors((CoreML::Specification::DenseSupportVectors *)v42);
      uint64_t v27 = 0;
    }
    else
    {
      uint64_t v27 = 0;
      uint64_t v19 = 0;
    }
    if (v6[3]) {
      v37 = (uint64_t *)v6[3];
    }
    else {
      v37 = &CoreML::Specification::_Coefficients_default_instance_;
    }
    *((void *)v12 + 15) = malloc_type_malloc(8uLL, 0x80040B8603338uLL);
    **((void **)v12 + 15) = malloc_type_malloc(v16, 0x100004000313F17uLL);
    if ((int)v18 >= 1)
    {
      v38 = (void *)**((void **)v12 + 15);
      v39 = (uint64_t *)(v37[3] + 8);
      do
      {
        uint64_t v40 = *v39++;
        *v38++ = v40;
        --v18;
      }
      while (v18);
    }
    *((_DWORD *)v12 + 44) = 0;
    v5 = [(MLSVREngine *)v5 initWithSVMModel:v12 freeOnDealloc:1 isInputSizeLowerBoundOnly:v27 inputSize:v19];
    v28 = v5;
  }
  else
  {
    if (a4)
    {
      *a4 = +[MLModelErrorUtils genericErrorWithFormat:@"Internal error: support vectors not set."];
    }
    svm_free_model_content((uint64_t)v12);
    free(v12);
    v28 = 0;
  }
  CoreML::Specification::Kernel::~Kernel((CoreML::Specification::Kernel *)v44);

  return v28;
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
    uint64_t v8 = [v22 shape];
    int v9 = [v8 objectAtIndexedSubscript:1];
    uint64_t v10 = [v9 unsignedIntegerValue];
  }
  else
  {
    uint64_t v10 = 1;
  }

  int v11 = [(MLSVREngine *)self allocSVMNodeVector:v6];
  v12 = [MLMultiArray alloc];
  v23[0] = &unk_1EF11A040;
  v13 = [NSNumber numberWithUnsignedInteger:v10];
  v23[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  uint64_t v15 = [(MLMultiArray *)v12 initWithShape:v14 dataType:65600 error:0];

  id v16 = v22;
  uint64_t v17 = [v16 bytes];
  uint64_t v18 = v15;
  uint64_t v19 = [(MLMultiArray *)v18 mutableBytes];
  if (v10)
  {
    uint64_t v20 = (double *)v19;
    do
    {
      [(MLSVREngine *)self fillSVMNodeVector:v11 values:v17 count:v6];
      *v20++ = svm_predict((uint64_t)self->_model, (Kernel *)v11);
      v17 += 8 * v6;
      --v10;
    }
    while (v10);
  }
  [(MLSVREngine *)self deallocSVMNodeVector:v11];

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
  v6.super_class = (Class)MLSVREngine;
  [(MLSVREngine *)&v6 dealloc];
}

- (MLSVREngine)initWithSVMModel:(svm_model *)a3 freeOnDealloc:(BOOL)a4 isInputSizeLowerBoundOnly:(BOOL)a5 inputSize:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MLSVREngine;
  result = [(MLSVREngine *)&v11 init];
  if (result)
  {
    result->_freeModelOnDealloc = a4;
    result->_isInputSizeLowerBoundOnly = a5;
    result->_inputSize = a6;
    result->_model = a3;
  }
  return result;
}

- (MLSVREngine)initWithLibSVMFile:(id)a3
{
  id v4 = a3;
  model = svm_load_model((const char *)[v4 UTF8String]);
  if (model)
  {
    uint64_t v6 = *((unsigned int *)model + 27);
    if ((int)v6 < 1)
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v7 = 0;
      LODWORD(v8) = 0;
      do
      {
        uint64_t v9 = *(void *)(*((void *)model + 14) + 8 * v7);
        uint64_t v10 = (int *)(v9 + 16);
        unsigned int v11 = -1;
        do
        {
          int v12 = *v10;
          v10 += 4;
          ++v11;
        }
        while (v12 != -1);
        int v13 = *(_DWORD *)(v9 + 16 * v11);
        if ((int)v8 <= v13) {
          uint64_t v8 = v13;
        }
        else {
          uint64_t v8 = v8;
        }
        ++v7;
      }
      while (v7 != v6);
    }
    self = [(MLSVREngine *)self initWithSVMModel:model freeOnDealloc:1 isInputSizeLowerBoundOnly:1 inputSize:v8];
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end