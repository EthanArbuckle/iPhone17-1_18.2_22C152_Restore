@interface CVNLPCLIPModel
- (CVNLPCLIPModel)initWithOptions:(id)a3 error:(id *)a4;
- (NSDictionary)options;
- (NSString)modelName;
- (id).cxx_construct;
- (id)encodeImage:(__CVBuffer *)a3 error:(id *)a4;
- (id)encodeText:(id)a3 error:(id *)a4;
- (id)encodeTextAverage:(id)a3 error:(id *)a4;
- (shared_ptr<cvnlp::clip::CLIPModel>)model;
@end

@implementation CVNLPCLIPModel

- (CVNLPCLIPModel)initWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  memset(&v68, 0, sizeof(v68));
  v67 = &unk_1F0D55498;
  v9 = objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CVNLPCLIPModelURL, v8);

  if (v9)
  {
    modelName = self->_modelName;
    self->_modelName = 0;

    objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)CVNLPCLIPModelURL, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15) {
      CFRetain(v15);
    }
    sub_1B4C31960(&v66, v16);

    sub_1B4C2F540(&v66, v57);
    if (v66) {
      CFRelease(v66);
    }
    if (SHIBYTE(v58) < 0)
    {
      sub_1B4BCA11C(__p, v57[0], (unint64_t)v57[1]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)v57;
      uint64_t v65 = v58;
    }
    sub_1B4C31FFC((uint64_t)buf, (uint64_t)__p);
    std::string::operator=(&v68, &v70);
    if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v70.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v65) & 0x80000000) == 0)
      {
LABEL_16:
        if ((SHIBYTE(v58) & 0x80000000) == 0)
        {
LABEL_17:

          goto LABEL_63;
        }
LABEL_20:
        operator delete(v57[0]);
        goto LABEL_17;
      }
    }
    else if ((SHIBYTE(v65) & 0x80000000) == 0)
    {
      goto LABEL_16;
    }
    operator delete(__p[0]);
    if ((SHIBYTE(v58) & 0x80000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  v17 = objc_msgSend_objectForKeyedSubscript_(v6, v10, (uint64_t)CVNLPCLIPModelName, v11);

  if (v17)
  {
    objc_msgSend_objectForKeyedSubscript_(v6, v18, (uint64_t)CVNLPCLIPModelName, v19);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    v21 = self->_modelName;
    self->_modelName = v20;

    v25 = (const char *)objc_msgSend_UTF8String(self->_modelName, v22, v23, v24);
    size_t v26 = strlen(v25);
    if (v26 > 0x7FFFFFFFFFFFFFF7) {
      sub_1B4BB33D8();
    }
    size_t v27 = v26;
    if (v26 >= 0x17)
    {
      uint64_t v36 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v26 | 7) != 0x17) {
        uint64_t v36 = v26 | 7;
      }
      uint64_t v37 = v36 + 1;
      p_dst = (long long *)operator new(v36 + 1);
      *((void *)&__dst + 1) = v27;
      unint64_t v63 = v37 | 0x8000000000000000;
      *(void *)&long long __dst = p_dst;
    }
    else
    {
      HIBYTE(v63) = v26;
      p_dst = &__dst;
      if (!v26)
      {
LABEL_29:
        *((unsigned char *)p_dst + v27) = 0;
        v57[0] = (void *)0x736C65646F4DLL;
        HIBYTE(v58) = 6;
        v59 = objc_alloc_init(BundleHelper);
        sub_1B4C2F698(v60, (uint64_t)v57);
        sub_1B4C31FFC((uint64_t)buf, (uint64_t)v60);
        std::string::operator=(&v68, &v70);
        if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v70.__r_.__value_.__l.__data_);
          if ((v61 & 0x80000000) == 0)
          {
LABEL_31:

            if ((SHIBYTE(v58) & 0x80000000) == 0) {
              goto LABEL_32;
            }
            goto LABEL_36;
          }
        }
        else if ((v61 & 0x80000000) == 0)
        {
          goto LABEL_31;
        }
        operator delete(v60[0]);

        if ((SHIBYTE(v58) & 0x80000000) == 0)
        {
LABEL_32:
          if ((SHIBYTE(v63) & 0x80000000) == 0)
          {
LABEL_33:
            long long v55 = __dst;
            unint64_t v56 = v63;
LABEL_38:
            sub_1B4C2FAC8(buf, (uint64_t)&v67, (uint64_t)&v55);
            std::string::operator=(&v68, &v70);
            if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
            {
              operator delete(v70.__r_.__value_.__l.__data_);
              if ((SHIBYTE(v56) & 0x80000000) == 0) {
                goto LABEL_61;
              }
            }
            else if ((SHIBYTE(v56) & 0x80000000) == 0)
            {
              goto LABEL_61;
            }
            v38 = (void *)v55;
LABEL_60:
            operator delete(v38);
LABEL_61:
            if (SHIBYTE(v63) < 0) {
              operator delete((void *)__dst);
            }
LABEL_63:
            if (!sub_1B4BF9C48((uint64_t)&v67))
            {
              exception = __cxa_allocate_exception(0x28uLL);
              sub_1B4C2FBAC((uint64_t)exception, (uint64_t)&v67);
              __cxa_throw(exception, (struct type_info *)&unk_1F0D53678, (void (*)(void *))sub_1B4C2FDAC);
            }
            v43 = objc_msgSend_objectForKeyedSubscript_(v6, v41, (uint64_t)CVNLPCLIPModelEspressoEngine, v42);

            if (v43)
            {
              v46 = objc_msgSend_objectForKeyedSubscript_(v6, v44, (uint64_t)CVNLPCLIPModelEspressoEngine, v45);
              sub_1B4C2FDF4(v46, buf);

              sub_1B4C2FF08((uint64_t)buf);
              if (v70.__r_.__value_.__s.__data_[15] < 0) {
                operator delete(*(void **)buf);
              }
            }
            else
            {
              if (qword_1EB9FE328 == -1)
              {
                if (byte_1EB9FE320) {
                  goto LABEL_76;
                }
              }
              else
              {
                dispatch_once(&qword_1EB9FE328, &unk_1F0D55FC0);
                if (byte_1EB9FE320) {
                  goto LABEL_76;
                }
              }
              if (qword_1E9D40AE0 != -1) {
                dispatch_once(&qword_1E9D40AE0, &unk_1F0D55F60);
              }
              v47 = (id)qword_1E9D40AD0;
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B4BAD000, v47, OS_LOG_TYPE_DEBUG, "Setting Espresso engine to CPU since ANE is not available and we are investigating issues when running on pre-ANE devices with MPS.", buf, 2u);
              }
            }
LABEL_76:
            objc_storeStrong((id *)&self->_options, a3);
            v48 = operator new(0x138uLL);
            v48[1] = 0;
            v48[2] = 0;
            void *v48 = &unk_1F0D55C50;
            sub_1B4BFA080((uint64_t)buf, (uint64_t)&v67);
            sub_1B4C74DF8((uint64_t)(v48 + 3), (uint64_t)buf);
          }
LABEL_37:
          sub_1B4BCA11C(&v55, (void *)__dst, *((unint64_t *)&__dst + 1));
          goto LABEL_38;
        }
LABEL_36:
        operator delete(v57[0]);
        if ((SHIBYTE(v63) & 0x80000000) == 0) {
          goto LABEL_33;
        }
        goto LABEL_37;
      }
    }
    memmove(p_dst, v25, v27);
    goto LABEL_29;
  }
  objc_storeStrong((id *)&self->_modelName, CVNLPCLIPModelNameDefaultValue);
  v32 = (const char *)objc_msgSend_UTF8String(self->_modelName, v29, v30, v31);
  size_t v33 = strlen(v32);
  if (v33 > 0x7FFFFFFFFFFFFFF7) {
    sub_1B4BB33D8();
  }
  size_t v34 = v33;
  if (v33 >= 0x17)
  {
    uint64_t v39 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v33 | 7) != 0x17) {
      uint64_t v39 = v33 | 7;
    }
    uint64_t v40 = v39 + 1;
    v35 = (long long *)operator new(v39 + 1);
    *((void *)&__dst + 1) = v34;
    unint64_t v63 = v40 | 0x8000000000000000;
    *(void *)&long long __dst = v35;
  }
  else
  {
    HIBYTE(v63) = v33;
    v35 = &__dst;
    if (!v33)
    {
LABEL_47:
      *((unsigned char *)v35 + v34) = 0;
      v57[0] = (void *)0x736C65646F4DLL;
      HIBYTE(v58) = 6;
      v59 = objc_alloc_init(BundleHelper);
      sub_1B4C2F698(v53, (uint64_t)v57);
      sub_1B4C31FFC((uint64_t)buf, (uint64_t)v53);
      std::string::operator=(&v68, &v70);
      if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v70.__r_.__value_.__l.__data_);
        if ((v54 & 0x80000000) == 0)
        {
LABEL_49:

          if ((SHIBYTE(v58) & 0x80000000) == 0) {
            goto LABEL_50;
          }
          goto LABEL_54;
        }
      }
      else if ((v54 & 0x80000000) == 0)
      {
        goto LABEL_49;
      }
      operator delete(v53[0]);

      if ((SHIBYTE(v58) & 0x80000000) == 0)
      {
LABEL_50:
        if ((SHIBYTE(v63) & 0x80000000) == 0)
        {
LABEL_51:
          *(_OWORD *)v51 = __dst;
          unint64_t v52 = v63;
LABEL_56:
          sub_1B4C2FAC8(buf, (uint64_t)&v67, (uint64_t)v51);
          std::string::operator=(&v68, &v70);
          if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v70.__r_.__value_.__l.__data_);
          }
          if ((SHIBYTE(v52) & 0x80000000) == 0) {
            goto LABEL_61;
          }
          v38 = v51[0];
          goto LABEL_60;
        }
LABEL_55:
        sub_1B4BCA11C(v51, (void *)__dst, *((unint64_t *)&__dst + 1));
        goto LABEL_56;
      }
LABEL_54:
      operator delete(v57[0]);
      if ((SHIBYTE(v63) & 0x80000000) == 0) {
        goto LABEL_51;
      }
      goto LABEL_55;
    }
  }
  memmove(v35, v32, v34);
  goto LABEL_47;
}

- (id)encodeImage:(__CVBuffer *)a3 error:(id *)a4
{
  v74[1] = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend_options(self, a2, (uint64_t)a3, (uint64_t)a4);
  v10 = objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)CVNLPCLIPModelURL, v9);

  if (v10)
  {
    if (qword_1E9D40AE0 != -1) {
      dispatch_once(&qword_1E9D40AE0, &unk_1F0D55F60);
    }
    uint64_t v11 = (id)qword_1E9D40AD0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v63) = 0;
      _os_log_impl(&dword_1B4BAD000, v11, OS_LOG_TYPE_DEBUG, "Using user-provided CLIP model to encode image instead of Vision.", (uint8_t *)&v63, 2u);
    }

    objc_msgSend_model(self, v12, v13, v14);
    sub_1B4C76A3C(*v70, a3, (uint64_t)&v63);
    id v15 = (std::__shared_weak_count *)v71;
    if (v71 && !atomic_fetch_add((atomic_ullong *volatile)v71 + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
    if (v64 != 1)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v68 + 24))(v68);
    v18 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v17, v16, (unint64_t)v17 & 0xFFFFFFFFFFFFFFFCLL);
    uint64_t v19 = [CVNLPCLIPEmbedding alloc];
    v22 = objc_msgSend_initWithData_(v19, v20, (uint64_t)v18, v21);

    unint64_t v63 = &unk_1F0D54F90;
    uint64_t v23 = v69;
    if (!v69 || atomic_fetch_add(&v69->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v24 = __p;
      if (!__p) {
        goto LABEL_27;
      }
      goto LABEL_13;
    }
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
    uint64_t v24 = __p;
    if (__p)
    {
LABEL_13:
      CFURLRef v66 = v24;
      operator delete(v24);
    }
  }
  else
  {
    std::string v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2050000000;
    v25 = (uint64_t **)qword_1EB9FE330;
    uint64_t v73 = qword_1EB9FE330;
    if (!qword_1EB9FE330)
    {
      unint64_t v63 = (void *)MEMORY[0x1E4F143A8];
      uint64_t v64 = 3221225472;
      __p = sub_1B4C31CE0;
      CFURLRef v66 = &unk_1E60A38E0;
      v67 = &v70;
      sub_1B4C31CE0((uint64_t)&v63);
      v25 = v71[3];
    }
    size_t v26 = v25;
    _Block_object_dispose(&v70, 8);
    id v27 = objc_alloc_init(v26);
    if (objc_msgSend_setRevision_error_(v27, v28, 3737841671, (uint64_t)a4))
    {
      std::string v70 = 0;
      v71 = &v70;
      uint64_t v72 = 0x2050000000;
      v29 = (uint64_t **)qword_1EB9FE340;
      uint64_t v73 = qword_1EB9FE340;
      if (!qword_1EB9FE340)
      {
        unint64_t v63 = (void *)MEMORY[0x1E4F143A8];
        uint64_t v64 = 3221225472;
        __p = sub_1B4C31EA8;
        CFURLRef v66 = &unk_1E60A38E0;
        v67 = &v70;
        sub_1B4C31EA8((uint64_t)&v63);
        v29 = v71[3];
      }
      uint64_t v30 = v29;
      _Block_object_dispose(&v70, 8);
      id v31 = [v30 alloc];
      size_t v33 = objc_msgSend_initWithCVPixelBuffer_options_(v31, v32, (uint64_t)a3, MEMORY[0x1E4F1CC08]);
      v74[0] = v27;
      v35 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v34, (uint64_t)v74, 1);
      char v37 = objc_msgSend_performRequests_error_(v33, v36, (uint64_t)v35, (uint64_t)a4);

      if (v37)
      {
        v41 = objc_msgSend_results(v27, v38, v39, v40);
        uint64_t v45 = objc_msgSend_firstObject(v41, v42, v43, v44);
        v49 = objc_msgSend_sceneprints(v45, v46, v47, v48);
        v53 = objc_msgSend_firstObject(v49, v50, v51, v52);

        char v54 = [CVNLPCLIPEmbedding alloc];
        uint64_t v58 = objc_msgSend_descriptorData(v53, v55, v56, v57);
        v22 = objc_msgSend_initWithData_(v54, v59, (uint64_t)v58, v60);
      }
      else
      {
        v22 = 0;
      }
    }
    else
    {
      v22 = 0;
    }
  }
LABEL_27:
  return v22;
}

- (id)encodeText:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_msgSend_model(self, v6, v7, v8);
  uint64_t v9 = v33;
  id v10 = v5;
  uint64_t v14 = (const char *)objc_msgSend_UTF8String(v10, v11, v12, v13);
  size_t v15 = strlen(v14);
  if (v15 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1B4BB33D8();
  }
  uint64_t v16 = (void *)v15;
  if (v15 >= 0x17)
  {
    uint64_t v18 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v18 = v15 | 7;
    }
    uint64_t v19 = v18 + 1;
    v17 = (void **)operator new(v18 + 1);
    __dst[1] = v16;
    unint64_t v32 = v19 | 0x8000000000000000;
    __dst[0] = v17;
    goto LABEL_8;
  }
  HIBYTE(v32) = v15;
  v17 = __dst;
  if (v15) {
LABEL_8:
  }
    memmove(v17, v14, (size_t)v16);
  *((unsigned char *)v16 + (void)v17) = 0;
  sub_1B4C73330(*(void *)(v9 + 8), (uint64_t)__dst, (uint64_t)&v35);
  if (SHIBYTE(v32) < 0) {
    operator delete(__dst[0]);
  }
  v20 = v34;
  if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
  }
  if (v36 != 1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  uint64_t v21 = (*(uint64_t (**)(uint64_t))(*(void *)v39 + 24))(v39);
  uint64_t v23 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v22, v21, (unint64_t)v22 & 0xFFFFFFFFFFFFFFFCLL);
  uint64_t v24 = [CVNLPCLIPEmbedding alloc];
  id v27 = objc_msgSend_initWithData_(v24, v25, (uint64_t)v23, v26);

  v35 = &unk_1F0D54F90;
  v28 = v40;
  if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
  }
  if (__p)
  {
    v38 = __p;
    operator delete(__p);
  }

  return v27;
}

- (id)encodeTextAverage:(id)a3 error:(id *)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v52 = 0;
  v53 = 0;
  uint64_t v51 = 0;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = a3;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v56, (uint64_t)&v60, 16, a4);
  if (v5)
  {
    id v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v49 = *(void *)v57;
    do
    {
      uint64_t v9 = 0;
      id v10 = v6;
      do
      {
        if (*(void *)v57 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = v5;
        id v50 = *(id *)(*((void *)&v56 + 1) + 8 * v9);
        size_t v15 = (const char *)objc_msgSend_UTF8String(v50, v12, v13, v14);
        size_t v16 = strlen(v15);
        if (v16 >= 0x7FFFFFFFFFFFFFF8) {
          sub_1B4BB33D8();
        }
        size_t v17 = v16;
        if (v16 >= 0x17)
        {
          uint64_t v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v16 | 7) != 0x17) {
            uint64_t v19 = v16 | 7;
          }
          uint64_t v20 = v19 + 1;
          p_dst = (long long *)operator new(v19 + 1);
          *((void *)&__dst + 1) = v17;
          unint64_t v55 = v20 | 0x8000000000000000;
          *(void *)&long long __dst = p_dst;
LABEL_13:
          memmove(p_dst, v15, v17);
          goto LABEL_14;
        }
        HIBYTE(v55) = v16;
        p_dst = &__dst;
        if (v16) {
          goto LABEL_13;
        }
LABEL_14:
        *((unsigned char *)p_dst + v17) = 0;

        uint64_t v5 = v11;
        if (v8 >= v7)
        {
          unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((v8 - v10) >> 3) + 1;
          if (v22 > 0xAAAAAAAAAAAAAAALL) {
            sub_1B4BB3244();
          }
          if (0x5555555555555556 * ((v7 - v10) >> 3) > v22) {
            unint64_t v22 = 0x5555555555555556 * ((v7 - v10) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((v7 - v10) >> 3) >= 0x555555555555555) {
            unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v23 = v22;
          }
          if (v23)
          {
            if (v23 > 0xAAAAAAAAAAAAAAALL) {
              sub_1B4BB2D38();
            }
            uint64_t v24 = (char *)operator new(24 * v23);
          }
          else
          {
            uint64_t v24 = 0;
          }
          id v6 = &v24[8 * ((v8 - v10) >> 3)];
          *(_OWORD *)id v6 = __dst;
          *((void *)v6 + 2) = v55;
          uint64_t v7 = &v24[24 * v23];
          unint64_t v55 = 0;
          long long __dst = 0uLL;
          v25 = v6 + 24;
          if (v8 == v10)
          {
            uint64_t v51 = &v24[8 * ((v8 - v10) >> 3)];
            v53 = &v24[24 * v23];
          }
          else
          {
            uint64_t v26 = v8;
            do
            {
              long long v27 = *(_OWORD *)(v26 - 24);
              *((void *)v6 - 1) = *((void *)v26 - 1);
              *(_OWORD *)(v6 - 24) = v27;
              v6 -= 24;
              *((void *)v26 - 2) = 0;
              *((void *)v26 - 1) = 0;
              *((void *)v26 - 3) = 0;
              v26 -= 24;
            }
            while (v26 != v10);
            uint64_t v51 = v6;
            uint64_t v52 = v25;
            v53 = &v24[24 * v23];
            do
            {
              if (*(v8 - 1) < 0) {
                operator delete(*((void **)v8 - 3));
              }
              v8 -= 24;
            }
            while (v8 != v10);
          }
          if (v10) {
            operator delete(v10);
          }
          uint64_t v52 = v25;
          if (SHIBYTE(v55) < 0) {
            operator delete((void *)__dst);
          }
          id v10 = v6;
          uint64_t v8 = v25;
        }
        else
        {
          long long v21 = __dst;
          *((void *)v8 + 2) = v55;
          *(_OWORD *)uint64_t v8 = v21;
          v8 += 24;
          uint64_t v52 = v8;
        }

        ++v9;
      }
      while (v9 != v5);
      uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v56, (uint64_t)&v60, 16);
    }
    while (v5);
  }

  objc_msgSend_model(self, v29, v30, v31);
  sub_1B4C772A8(v56, &v51, (uint64_t)&v60);
  unint64_t v32 = (std::__shared_weak_count *)*((void *)&v56 + 1);
  if (*((void *)&v56 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v56 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
    std::__shared_weak_count::__release_weak(v32);
  }
  if (v61 != 1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  uint64_t v33 = (*(uint64_t (**)(uint64_t))(*(void *)v64 + 24))(v64);
  v35 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v34, v33, (unint64_t)v34 & 0xFFFFFFFFFFFFFFFCLL);
  int v36 = [CVNLPCLIPEmbedding alloc];
  uint64_t v39 = objc_msgSend_initWithData_(v36, v37, (uint64_t)v35, v38);

  uint64_t v60 = &unk_1F0D54F90;
  uint64_t v40 = v65;
  if (v65 && !atomic_fetch_add(&v65->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
    std::__shared_weak_count::__release_weak(v40);
  }
  if (__p)
  {
    unint64_t v63 = __p;
    operator delete(__p);
  }
  v41 = (void **)v51;
  if (v51)
  {
    uint64_t v42 = (void **)v52;
    uint64_t v43 = v51;
    if (v52 != v51)
    {
      do
      {
        if (*((char *)v42 - 1) < 0) {
          operator delete(*(v42 - 3));
        }
        v42 -= 3;
      }
      while (v42 != v41);
      uint64_t v43 = v51;
    }
    uint64_t v52 = (char *)v41;
    operator delete(v43);
  }

  return v39;
}

- (shared_ptr<cvnlp::clip::CLIPModel>)model
{
  cntrl = self->_model.__cntrl_;
  *v2 = self->_model.__ptr_;
  v2[1] = (CLIPModel *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (CLIPModel *)self;
  return result;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  cntrl = self->_model.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end