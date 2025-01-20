@interface CSUSceneNetV5CustomClassifier
- (BOOL)enumerateClassificationLikelihoods:(id)a3 usingBlock:(id)a4;
- (BOOL)enumerateClassificationLikelihoods:(id)a3 usingBlock:(id)a4 error:(id *)a5;
- (BOOL)loadResourcesAndReturnError:(id *)a3;
- (CSUSceneNetV5CustomClassifier)initWithConfiguration:(id)a3;
- (CSUSceneNetV5CustomClassifierConfiguration)configuration;
- (id).cxx_construct;
- (id)allClassificationLikelihoods:(id)a3;
- (id)allClassificationLikelihoods:(id)a3 error:(id *)a4;
- (id)labelsFromClassificationLikelihoods:(id)a3;
- (void)enumerateLabelsFromClassificationLikelihoods:(id)a3 usingBlock:(id)a4;
- (void)runOnInputScenePrint:(id)a3 completion:(id)a4;
- (void)unsafeRunOnInputScenePrint:(id)a3 completion:(id)a4;
@end

@implementation CSUSceneNetV5CustomClassifier

- (CSUSceneNetV5CustomClassifier)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUSceneNetV5CustomClassifier;
  v6 = [(CSUSceneNetV5CustomClassifier *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)loadResourcesAndReturnError:(id *)a3
{
  if (!self->_net.__ptr_.__value_)
  {
    objc_msgSend_espressoNetworkPath(self->_configuration, a2, (uint64_t)a3, v3, v4);
    id v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v6, v7, v8, v9, v10);
    objc_msgSend_espressoExecutionEngine(self->_configuration, v11, v12, v13, v14);
    sub_24C669758();
  }
  return 1;
}

- (void)runOnInputScenePrint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_unsafeRunOnInputScenePrint_completion_(self, v8, (uint64_t)v6, (uint64_t)v7, v9);
}

- (id)allClassificationLikelihoods:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_24C695B34;
  v13[3] = &unk_2652E7C28;
  id v14 = v7;
  id v8 = v7;
  if (objc_msgSend_enumerateClassificationLikelihoods_usingBlock_error_(self, v9, (uint64_t)v6, (uint64_t)v13, (uint64_t)a4))uint64_t v10 = v8; {
  else
  }
    uint64_t v10 = 0;
  id v11 = v10;

  return v11;
}

- (id)allClassificationLikelihoods:(id)a3
{
  uint64_t v4 = objc_msgSend_allClassificationLikelihoods_error_(self, a2, (uint64_t)a3, 0, v3);
  return v4;
}

- (id)labelsFromClassificationLikelihoods:(id)a3
{
  id v5 = objc_msgSend_allClassificationLikelihoods_(self, a2, (uint64_t)a3, v3, v4);
  return v5;
}

- (BOOL)enumerateClassificationLikelihoods:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v17 = objc_msgSend_taxonomyWithError_(self->_configuration, v10, (uint64_t)a5, v11, v12);
  if (!v17)
  {
    BOOL v25 = 0;
    goto LABEL_9;
  }
  v18 = objc_msgSend_vocabularyName(self->_configuration, v13, v14, v15, v16);
  id v19 = v8;
  if (!v19)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer instance is nil.");
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer is not an instance of CSUEspressoBuffer.");
LABEL_7:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  v24 = objc_msgSend_espressoBuffer(v19, v20, v21, v22, v23);

  sub_24C6A0A44(v17, v18, v24, v9);
  BOOL v25 = 1;
LABEL_9:

  return v25;
}

- (BOOL)enumerateClassificationLikelihoods:(id)a3 usingBlock:(id)a4
{
  return objc_msgSend_enumerateClassificationLikelihoods_usingBlock_error_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (void)enumerateLabelsFromClassificationLikelihoods:(id)a3 usingBlock:(id)a4
{
}

- (void)unsafeRunOnInputScenePrint:(id)a3 completion:(id)a4
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v70 = 0;
  char ResourcesAndReturnError = objc_msgSend_loadResourcesAndReturnError_(self, v8, (uint64_t)&v70, v9, v10);
  id v16 = v70;
  if ((ResourcesAndReturnError & 1) == 0)
  {
    v7[2](v7, 0, v16);
    goto LABEL_27;
  }
  value = self->_net.__ptr_.__value_;
  id v60 = v6;
  objc_msgSend_inputImageTensorName(self->_configuration, v12, v13, v14, v15);
  id v18 = objc_claimAutoreleasedReturnValue();
  v66 = (const char *)objc_msgSend_UTF8String(v18, v19, v20, v21, v22);
  uint64_t v23 = sub_24C695E24(v6);
  __int16 v61 = 1;
  sub_24C66FCBC((uint64_t)__dst, v23, &v61);
  sub_24C6964C0((uint64_t)&v71, &v66, (uint64_t)__dst);
  memset(v67, 0, sizeof(v67));
  int v68 = 1065353216;
  sub_24C672C8C((uint64_t)v67, (uint64_t)&v71, &v71);
  sub_24C66D4AC((uint64_t)value, (uint64_t)v67, (uint64_t)v69);
  sub_24C6717DC((uint64_t)v67);
  *((void *)&v72 + 1) = &unk_26FEDD950;
  v24 = (std::__shared_weak_count *)*((void *)&v75 + 1);
  if (*((void *)&v75 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v75 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
    std::__shared_weak_count::__release_weak(v24);
  }
  if (*((void *)&v73 + 1))
  {
    *(void *)&long long v74 = *((void *)&v73 + 1);
    operator delete(*((void **)&v73 + 1));
  }
  if (SBYTE7(v72) < 0) {
    operator delete((void *)v71);
  }
  __dst[0] = &unk_26FEDD950;
  BOOL v25 = v65;
  if (v65 && !atomic_fetch_add(&v65->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
    std::__shared_weak_count::__release_weak(v25);
  }
  if (__p)
  {
    v64 = __p;
    operator delete(__p);
  }

  v26 = [CSUSceneNetV5CustomClassifierNetworkOutput alloc];
  objc_msgSend_classificationTensorName(self->_configuration, v27, v28, v29, v30);
  id v31 = objc_claimAutoreleasedReturnValue();
  v36 = (const char *)objc_msgSend_UTF8String(v31, v32, v33, v34, v35);
  size_t v37 = strlen(v36);
  if (v37 >= 0x7FFFFFFFFFFFFFF8) {
    sub_24C6673C8();
  }
  v38 = (void *)v37;
  if (v37 >= 0x17)
  {
    uint64_t v40 = (v37 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v37 | 7) != 0x17) {
      uint64_t v40 = v37 | 7;
    }
    uint64_t v41 = v40 + 1;
    v39 = (void **)operator new(v40 + 1);
    __dst[1] = v38;
    __p = (void *)(v41 | 0x8000000000000000);
    __dst[0] = v39;
  }
  else
  {
    HIBYTE(__p) = v37;
    v39 = __dst;
    if (!v37) {
      goto LABEL_23;
    }
  }
  memmove(v39, v36, (size_t)v38);
LABEL_23:
  *((unsigned char *)v38 + (void)v39) = 0;
  id v6 = v60;
  v42 = sub_24C66F168(v69, (uint64_t)__dst);
  if (!v42) {
    sub_24C66DE30("unordered_map::at: key not found");
  }
  uint64_t v46 = v42[10];
  long long v47 = *(_OWORD *)(v46 + 40);
  long long v48 = *(_OWORD *)(v46 + 24);
  long long v71 = *(_OWORD *)(v46 + 8);
  long long v72 = v48;
  long long v73 = v47;
  long long v49 = *(_OWORD *)(v46 + 88);
  long long v50 = *(_OWORD *)(v46 + 104);
  long long v51 = *(_OWORD *)(v46 + 72);
  long long v74 = *(_OWORD *)(v46 + 56);
  long long v75 = v51;
  long long v52 = *(_OWORD *)(v46 + 120);
  long long v53 = *(_OWORD *)(v46 + 136);
  long long v54 = *(_OWORD *)(v46 + 152);
  uint64_t v81 = *(void *)(v46 + 168);
  long long v80 = v54;
  long long v79 = v53;
  long long v78 = v52;
  long long v77 = v50;
  long long v76 = v49;
  v55 = objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v43, (uint64_t)&v71, v44, v45);
  if (SHIBYTE(__p) < 0) {
    operator delete(__dst[0]);
  }

  v59 = objc_msgSend_initWithClassificationLikelihoods_(v26, v56, (uint64_t)v55, v57, v58);
  ((void (**)(id, void *, id))v7)[2](v7, v59, v16);

  sub_24C6717DC((uint64_t)v69);
LABEL_27:
}

- (CSUSceneNetV5CustomClassifierConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  value = self->_transferSession.__ptr_.__value_;
  self->_transferSession.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v4 = *(CFTypeRef **)value;
    *(void *)value = 0;
    if (v4)
    {
      if (*v4) {
        CFRelease(*v4);
      }
      MEMORY[0x2532F8960](v4, 0x20C4093837F09);
    }
    MEMORY[0x2532F8960](value, 0x20C4093837F09);
  }
  id v5 = self->_net.__ptr_.__value_;
  self->_net.__ptr_.__value_ = 0;
  if (v5)
  {
    id v6 = *(void (**)(void))(*(void *)v5 + 8);
    v6();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end