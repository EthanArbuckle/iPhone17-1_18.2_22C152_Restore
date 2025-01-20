@interface CSUDetectionPrintNetwork
- (BOOL)loadResourcesAndReturnError:(id *)a3;
- (BOOL)resampleImage:(__CVBuffer *)a3 intoInputImage:(__CVBuffer *)a4 error:(id *)a5;
- (CSUDetectionPrintNetwork)initWithConfiguration:(id)a3;
- (CSUDetectionPrintNetworkConfiguration)configuration;
- (id).cxx_construct;
- (void)_unsafeRunOnInputImage:(__CVBuffer *)a3 completion:(id)a4;
- (void)runOnInputImage:(__CVBuffer *)a3 completion:(id)a4;
@end

@implementation CSUDetectionPrintNetwork

- (CSUDetectionPrintNetwork)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUDetectionPrintNetwork;
  v6 = [(CSUDetectionPrintNetwork *)&v10 init];
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

- (BOOL)resampleImage:(__CVBuffer *)a3 intoInputImage:(__CVBuffer *)a4 error:(id *)a5
{
  value = (VTPixelTransferSessionRef **)self->_transferSession.__ptr_.__value_;
  if (!value) {
    operator new();
  }
  uint64_t v6 = VTPixelTransferSessionTransferImage(**value, a3, a4);
  sub_24C690670(v6, "Image Transfer");
  return 1;
}

- (void)runOnInputImage:(__CVBuffer *)a3 completion:(id)a4
{
  id v6 = a4;
  objc_msgSend__unsafeRunOnInputImage_completion_(self, v7, (uint64_t)a3, (uint64_t)v6, v8);
}

- (void)_unsafeRunOnInputImage:(__CVBuffer *)a3 completion:(id)a4
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  v82 = (void (**)(id, void *, void))a4;
  id v96 = 0;
  char ResourcesAndReturnError = objc_msgSend_loadResourcesAndReturnError_(self, v6, (uint64_t)&v96, v7, v8);
  id v10 = v96;
  v15 = v10;
  if (ResourcesAndReturnError)
  {
    id v80 = v10;
    value = self->_net.__ptr_.__value_;
    objc_msgSend_inputImageTensorName(self->_configuration, v11, v12, v13, v14);
    id v17 = objc_claimAutoreleasedReturnValue();
    v92 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20, v21);
    sub_24C671D40((uint64_t)__dst, a3);
    sub_24C672AB4((uint64_t)v98, &v92, (uint64_t)__dst);
    memset(v93, 0, sizeof(v93));
    int v94 = 1065353216;
    sub_24C672C8C((uint64_t)v93, (uint64_t)v98, (long long *)v98);
    sub_24C66D4AC((uint64_t)value, (uint64_t)v93, (uint64_t)v95);
    sub_24C6717DC((uint64_t)v93);
    *((void *)&v99 + 1) = &unk_26FEDD950;
    v22 = (std::__shared_weak_count *)*((void *)&v102 + 1);
    if (*((void *)&v102 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v102 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
    if (*((void *)&v100 + 1))
    {
      *(void *)&long long v101 = *((void *)&v100 + 1);
      operator delete(*((void **)&v100 + 1));
    }
    if (SBYTE7(v99) < 0) {
      operator delete(v98[0]);
    }
    __dst[0] = &unk_26FEDD950;
    v23 = v91;
    if (v91 && !atomic_fetch_add(&v91->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
    if (v89)
    {
      v90 = v89;
      operator delete(v89);
    }

    v28 = objc_msgSend_outputTapPointFeatures(self->_configuration, v24, v25, v26, v27);
    v81 = objc_msgSend_allKeys(v28, v29, v30, v31, v32);

    uint64_t v37 = objc_msgSend_count(v81, v33, v34, v35, v36);
    id v38 = objc_alloc(MEMORY[0x263EFF9A0]);
    v42 = objc_msgSend_initWithCapacity_(v38, v39, v37, v40, v41);
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id obj = v81;
    uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v84, (uint64_t)v97, 16);
    if (v44)
    {
      uint64_t v45 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v85 != v45) {
            objc_enumerationMutation(obj);
          }
          id v47 = *(id *)(*((void *)&v84 + 1) + 8 * i);
          v52 = (const char *)objc_msgSend_UTF8String(v47, v48, v49, v50, v51);
          size_t v53 = strlen(v52);
          if (v53 >= 0x7FFFFFFFFFFFFFF8) {
            sub_24C6673C8();
          }
          v54 = (void *)v53;
          if (v53 >= 0x17)
          {
            uint64_t v56 = (v53 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v53 | 7) != 0x17) {
              uint64_t v56 = v53 | 7;
            }
            uint64_t v57 = v56 + 1;
            v55 = (void **)operator new(v56 + 1);
            __dst[1] = v54;
            v89 = (void *)(v57 | 0x8000000000000000);
            __dst[0] = v55;
LABEL_26:
            memmove(v55, v52, (size_t)v54);
            goto LABEL_27;
          }
          HIBYTE(v89) = v53;
          v55 = __dst;
          if (v53) {
            goto LABEL_26;
          }
LABEL_27:
          *((unsigned char *)v54 + (void)v55) = 0;
          v58 = sub_24C66F168(v95, (uint64_t)__dst);
          if (!v58) {
            sub_24C66DE30("unordered_map::at: key not found");
          }
          uint64_t v62 = v58[10];
          long long v63 = *(_OWORD *)(v62 + 40);
          long long v64 = *(_OWORD *)(v62 + 24);
          *(_OWORD *)v98 = *(_OWORD *)(v62 + 8);
          long long v99 = v64;
          long long v100 = v63;
          long long v65 = *(_OWORD *)(v62 + 88);
          long long v66 = *(_OWORD *)(v62 + 104);
          long long v67 = *(_OWORD *)(v62 + 72);
          long long v101 = *(_OWORD *)(v62 + 56);
          long long v102 = v67;
          long long v68 = *(_OWORD *)(v62 + 120);
          long long v69 = *(_OWORD *)(v62 + 136);
          long long v70 = *(_OWORD *)(v62 + 152);
          uint64_t v108 = *(void *)(v62 + 168);
          long long v106 = v69;
          long long v107 = v70;
          long long v104 = v66;
          long long v105 = v68;
          long long v103 = v65;
          v71 = objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v59, (uint64_t)v98, v60, v61);
          if (SHIBYTE(v89) < 0) {
            operator delete(__dst[0]);
          }

          objc_msgSend_setObject_forKeyedSubscript_(v42, v72, (uint64_t)v71, (uint64_t)v47, v73);
        }
        uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v74, (uint64_t)&v84, (uint64_t)v97, 16);
      }
      while (v44);
    }

    v75 = [CSUDetectionPrintNetworkOutput alloc];
    v79 = objc_msgSend_initWithDetectionPrintPerTapPoint_(v75, v76, (uint64_t)v42, v77, v78);
    ((void (**)(id, void *, id))v82)[2](v82, v79, v80);

    sub_24C6717DC((uint64_t)v95);
    v15 = v80;
  }
  else
  {
    ((void (**)(id, void *, id))v82)[2](v82, 0, v10);
  }
}

- (CSUDetectionPrintNetworkConfiguration)configuration
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