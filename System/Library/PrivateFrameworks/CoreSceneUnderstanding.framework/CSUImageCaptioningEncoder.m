@interface CSUImageCaptioningEncoder
- (BOOL)loadResources:(id *)a3;
- (BOOL)resampleImage:(__CVBuffer *)a3 intoInputImage:(__CVBuffer *)a4 error:(id *)a5;
- (CSUImageCaptioningEncoder)initWithConfiguration:(id)a3;
- (CSUImageCaptioningEncoderConfiguration)configuration;
- (id).cxx_construct;
- (id)computeEncodedCaptioningFeaturesForImage:(__CVBuffer *)a3 error:(id *)a4;
@end

@implementation CSUImageCaptioningEncoder

- (CSUImageCaptioningEncoder)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUImageCaptioningEncoder;
  v6 = [(CSUImageCaptioningEncoder *)&v10 init];
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
    objc_msgSend_encoderNetworkPath(self->_configuration, a2, (uint64_t)a3, v3, v4);
    id v6 = objc_claimAutoreleasedReturnValue();
    v11 = (const char *)objc_msgSend_UTF8String(v6, v7, v8, v9, v10);
    size_t v12 = strlen(v11);
    if (v12 >= 0x7FFFFFFFFFFFFFF8) {
      sub_24C6673C8();
    }
    size_t v13 = v12;
    if (v12 >= 0x17)
    {
      uint64_t v15 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v12 | 7) != 0x17) {
        uint64_t v15 = v12 | 7;
      }
      uint64_t v16 = v15 + 1;
      v14 = operator new(v15 + 1);
      __dst[1] = v13;
      unint64_t v37 = v16 | 0x8000000000000000;
      __dst[0] = v14;
    }
    else
    {
      HIBYTE(v37) = v12;
      v14 = __dst;
      if (!v12)
      {
LABEL_10:
        *((unsigned char *)v14 + v13) = 0;

        int v22 = objc_msgSend_espressoExecutionEngine(self->_configuration, v17, v18, v19, v20, 0, 0, 0);
        char v23 = 1;
        char v24 = 0;
        char v25 = 0;
        uint64_t v26 = 0xFFFFFFFFLL;
        char v27 = 0;
        char v28 = 0;
        char v29 = 0;
        char v30 = 0;
        *(_OWORD *)v31 = 0u;
        *(_OWORD *)v32 = 0u;
        int v33 = 1065353216;
        char v35 = 0;
        LOBYTE(__p) = 0;
        operator new();
      }
    }
    memmove(v14, v11, v13);
    goto LABEL_10;
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
  sub_24C6A0860(v6, "Image Transfer");
  return 1;
}

- (id)computeEncodedCaptioningFeaturesForImage:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  if (!objc_msgSend_loadResources_(self, a2, (uint64_t)a4, (uint64_t)a4, v4))
  {
LABEL_22:
    int v33 = 0;
    goto LABEL_23;
  }
  if (!a3)
  {
    v32 = sub_24C69662C();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24C664000, v32, OS_LOG_TYPE_INFO, "Input image to computeEncodedCaptioningFeaturesForImage is null", buf, 2u);
    }

    goto LABEL_22;
  }
  value = self->_net.__ptr_.__value_;
  objc_msgSend_inputImageTensorName(self->_configuration, v7, v8, v9, v10);
  id v12 = objc_claimAutoreleasedReturnValue();
  v54 = (const char *)objc_msgSend_UTF8String(v12, v13, v14, v15, v16);
  sub_24C671D40((uint64_t)v50, a3);
  sub_24C672AB4((uint64_t)buf, &v54, (uint64_t)v50);
  memset(v55, 0, sizeof(v55));
  int v56 = 1065353216;
  sub_24C672C8C((uint64_t)v55, (uint64_t)buf, (long long *)buf);
  sub_24C66D4AC((uint64_t)value, (uint64_t)v55, (uint64_t)v57);
  sub_24C6717DC((uint64_t)v55);
  *((void *)&v59 + 1) = &unk_26FEDD950;
  v17 = (std::__shared_weak_count *)*((void *)&v62 + 1);
  if (*((void *)&v62 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v62 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  if (*((void *)&v60 + 1))
  {
    *(void *)&long long v61 = *((void *)&v60 + 1);
    operator delete(*((void **)&v60 + 1));
  }
  if (SBYTE7(v59) < 0) {
    operator delete(*(void **)buf);
  }
  v50[0] = &unk_26FEDD950;
  uint64_t v18 = v53;
  if (v53 && !atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }

  objc_msgSend_imageEmbeddingTensorName(self->_configuration, v19, v20, v21, v22);
  id v23 = objc_claimAutoreleasedReturnValue();
  char v28 = (const char *)objc_msgSend_UTF8String(v23, v24, v25, v26, v27);
  size_t v29 = strlen(v28);
  if (v29 >= 0x7FFFFFFFFFFFFFF8) {
    sub_24C6673C8();
  }
  char v30 = (void *)v29;
  if (v29 >= 0x17)
  {
    uint64_t v35 = (v29 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v29 | 7) != 0x17) {
      uint64_t v35 = v29 | 7;
    }
    uint64_t v36 = v35 + 1;
    v31 = operator new(v35 + 1);
    v50[1] = v30;
    v51 = (void *)(v36 | 0x8000000000000000);
    v50[0] = v31;
  }
  else
  {
    HIBYTE(v51) = v29;
    v31 = v50;
    if (!v29) {
      goto LABEL_30;
    }
  }
  memmove(v31, v28, (size_t)v30);
LABEL_30:
  *((unsigned char *)v30 + (void)v31) = 0;
  unint64_t v37 = sub_24C66F168(v57, (uint64_t)v50);
  if (!v37) {
    sub_24C66DE30("unordered_map::at: key not found");
  }
  uint64_t v41 = v37[10];
  long long v42 = *(_OWORD *)(v41 + 40);
  long long v43 = *(_OWORD *)(v41 + 24);
  *(_OWORD *)buf = *(_OWORD *)(v41 + 8);
  long long v59 = v43;
  long long v60 = v42;
  long long v44 = *(_OWORD *)(v41 + 88);
  long long v45 = *(_OWORD *)(v41 + 104);
  long long v46 = *(_OWORD *)(v41 + 72);
  long long v61 = *(_OWORD *)(v41 + 56);
  long long v62 = v46;
  long long v47 = *(_OWORD *)(v41 + 120);
  long long v48 = *(_OWORD *)(v41 + 136);
  long long v49 = *(_OWORD *)(v41 + 152);
  uint64_t v68 = *(void *)(v41 + 168);
  long long v66 = v48;
  long long v67 = v49;
  long long v64 = v45;
  long long v65 = v47;
  long long v63 = v44;
  int v33 = objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v38, (uint64_t)buf, v39, v40);
  if (SHIBYTE(v51) < 0) {
    operator delete(v50[0]);
  }

  sub_24C6717DC((uint64_t)v57);
LABEL_23:
  return v33;
}

- (CSUImageCaptioningEncoderConfiguration)configuration
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
    uint64_t v6 = *(void (**)(void))(*(void *)v5 + 8);
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