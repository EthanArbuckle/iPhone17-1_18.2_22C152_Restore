@interface CSUCLIPImageEncoderV3
- (BOOL)loadResources:(id *)a3;
- (BOOL)resampleImage:(__CVBuffer *)a3 intoInputImage:(__CVBuffer *)a4 error:(id *)a5;
- (CSUCLIPImageEncoderV3)initWithConfiguration:(id)a3;
- (CSUCLIPImageEncoderV3Configuration)configuration;
- (id).cxx_construct;
- (void)_unsafeRunOnInputImage:(__CVBuffer *)a3 completion:(id)a4;
- (void)runOnInputImage:(__CVBuffer *)a3 completion:(id)a4;
@end

@implementation CSUCLIPImageEncoderV3

- (CSUCLIPImageEncoderV3)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUCLIPImageEncoderV3;
  v6 = [(CSUCLIPImageEncoderV3 *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)loadResources:(id *)a3
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
  sub_24C6ADE54(v6, "Image Transfer");
  return 1;
}

- (void)runOnInputImage:(__CVBuffer *)a3 completion:(id)a4
{
  id v6 = a4;
  objc_msgSend__unsafeRunOnInputImage_completion_(self, v7, (uint64_t)a3, (uint64_t)v6, v8);
}

- (void)_unsafeRunOnInputImage:(__CVBuffer *)a3 completion:(id)a4
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void *, id))a4;
  id v82 = 0;
  char Resources = objc_msgSend_loadResources_(self, v7, (uint64_t)&v82, v8, v9);
  id v15 = v82;
  if (Resources)
  {
    value = self->_net.__ptr_.__value_;
    objc_msgSend_inputImageTensorName(self->_configuration, v11, v12, v13, v14);
    id v17 = objc_claimAutoreleasedReturnValue();
    v78 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20, v21);
    sub_24C671D40((uint64_t)v74, a3);
    sub_24C672AB4((uint64_t)__dst, &v78, (uint64_t)v74);
    memset(v79, 0, sizeof(v79));
    int v80 = 1065353216;
    sub_24C672C8C((uint64_t)v79, (uint64_t)__dst, (long long *)__dst);
    sub_24C66D4AC((uint64_t)value, (uint64_t)v79, (uint64_t)v81);
    sub_24C6717DC((uint64_t)v79);
    *((void *)&v84 + 1) = &unk_26FEDD950;
    v22 = (std::__shared_weak_count *)*((void *)&v87 + 1);
    if (*((void *)&v87 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v87 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
    if (*((void *)&v85 + 1))
    {
      *(void *)&long long v86 = *((void *)&v85 + 1);
      operator delete(*((void **)&v85 + 1));
    }
    if (SBYTE7(v84) < 0) {
      operator delete(__dst[0]);
    }
    v74[0] = &unk_26FEDD950;
    v23 = v77;
    if (v77 && !atomic_fetch_add(&v77->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
    if (v75)
    {
      v76 = v75;
      operator delete(v75);
    }

    v24 = [CSUCLIPImageEncoderV3NetworkOutput alloc];
    objc_msgSend_imageEmbeddingTensorName(self->_configuration, v25, v26, v27, v28);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (!v29) {
      goto LABEL_31;
    }
    id v31 = v29;
    v36 = (const char *)objc_msgSend_UTF8String(v31, v32, v33, v34, v35);
    size_t v37 = strlen(v36);
    if (v37 > 0x7FFFFFFFFFFFFFF7) {
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
      v39 = operator new(v40 + 1);
      __dst[1] = v38;
      *(void *)&long long v84 = v41 | 0x8000000000000000;
      __dst[0] = v39;
    }
    else
    {
      BYTE7(v84) = v37;
      v39 = __dst;
      if (!v37)
      {
LABEL_24:
        *((unsigned char *)v38 + (void)v39) = 0;
        v42 = sub_24C66F168(v81, (uint64_t)__dst);
        v43 = v42;
        if (SBYTE7(v84) < 0)
        {
          operator delete(__dst[0]);
          if (v43)
          {
LABEL_26:
            id v44 = v31;
            v49 = (const char *)objc_msgSend_UTF8String(v44, v45, v46, v47, v48);
            size_t v50 = strlen(v49);
            if (v50 > 0x7FFFFFFFFFFFFFF7) {
              sub_24C6673C8();
            }
            v51 = (void *)v50;
            if (v50 >= 0x17)
            {
              uint64_t v54 = (v50 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v50 | 7) != 0x17) {
                uint64_t v54 = v50 | 7;
              }
              uint64_t v55 = v54 + 1;
              v52 = operator new(v54 + 1);
              v74[1] = v51;
              v75 = (void *)(v55 | 0x8000000000000000);
              v74[0] = v52;
            }
            else
            {
              HIBYTE(v75) = v50;
              v52 = v74;
              if (!v50) {
                goto LABEL_36;
              }
            }
            memmove(v52, v49, (size_t)v51);
LABEL_36:
            *((unsigned char *)v51 + (void)v52) = 0;
            v56 = sub_24C66F168(v81, (uint64_t)v74);
            if (!v56) {
              sub_24C66DE30("unordered_map::at: key not found");
            }
            uint64_t v60 = v56[10];
            long long v61 = *(_OWORD *)(v60 + 40);
            long long v62 = *(_OWORD *)(v60 + 24);
            *(_OWORD *)__dst = *(_OWORD *)(v60 + 8);
            long long v84 = v62;
            long long v85 = v61;
            long long v63 = *(_OWORD *)(v60 + 88);
            long long v64 = *(_OWORD *)(v60 + 104);
            long long v65 = *(_OWORD *)(v60 + 72);
            long long v86 = *(_OWORD *)(v60 + 56);
            long long v87 = v65;
            long long v66 = *(_OWORD *)(v60 + 120);
            long long v67 = *(_OWORD *)(v60 + 136);
            long long v68 = *(_OWORD *)(v60 + 152);
            uint64_t v93 = *(void *)(v60 + 168);
            long long v91 = v67;
            long long v92 = v68;
            long long v89 = v64;
            long long v90 = v66;
            long long v88 = v63;
            uint64_t v69 = objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v57, (uint64_t)__dst, v58, v59);
            if (SHIBYTE(v75) < 0) {
              operator delete(v74[0]);
            }
            v53 = (void *)v69;
            goto LABEL_40;
          }
        }
        else if (v42)
        {
          goto LABEL_26;
        }
LABEL_31:
        v53 = 0;
LABEL_40:

        v73 = objc_msgSend_initWithImageEmbedding_(v24, v70, (uint64_t)v53, v71, v72);
        v6[2](v6, v73, v15);

        sub_24C6717DC((uint64_t)v81);
        goto LABEL_41;
      }
    }
    memmove(v39, v36, (size_t)v38);
    goto LABEL_24;
  }
  v6[2](v6, 0, v15);
LABEL_41:
}

- (CSUCLIPImageEncoderV3Configuration)configuration
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