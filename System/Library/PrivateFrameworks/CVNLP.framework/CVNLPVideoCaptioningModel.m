@interface CVNLPVideoCaptioningModel
- (CVNLPVideoCaptioningModel)initWithOptions:(id)a3 error:(id *)a4;
- (NSDictionary)options;
- (id).cxx_construct;
- (id)generateCaption:(id)a3 error:(id *)a4;
- (shared_ptr<cvnlp::vidcap::VideoCaptioningModel>)model;
@end

@implementation CVNLPVideoCaptioningModel

- (CVNLPVideoCaptioningModel)initWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CVNLPVideoCaptioningModelURL, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9) {
    CFRetain(v9);
  }
  sub_1B4C31960(&cf, v10);

  sub_1B4C2F540((const __CFURL **)&cf, v27);
  if (cf) {
    CFRelease(cf);
  }
  if (SHIBYTE(v28) < 0)
  {
    sub_1B4BCA11C(__p, v27[0], (unint64_t)v27[1]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v27;
    uint64_t v22 = v28;
  }
  sub_1B4C31FFC((uint64_t)v26, (uint64_t)__p);
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[0]);
  }
  if (sub_1B4BF9C48((uint64_t)v26))
  {
    v13 = objc_msgSend_objectForKey_(v6, v11, (uint64_t)CVNLPVideoCaptioningModelEspressoEngine, v12);
    BOOL v14 = v13 == 0;

    if (!v14)
    {
      v17 = objc_msgSend_objectForKey_(v6, v15, (uint64_t)CVNLPVideoCaptioningModelEspressoEngine, v16);
      sub_1B4C2FDF4(v17, &v24);

      sub_1B4C2FF08((uint64_t)&v24);
      if (v25 < 0) {
        operator delete(v24);
      }
    }
    objc_storeStrong((id *)&self->_options, a3);
    v18 = operator new(0x268uLL);
    v18[1] = 0;
    v18[2] = 0;
    void *v18 = &unk_1F0D55C88;
    sub_1B4BFA080((uint64_t)&v24, (uint64_t)v26);
    sub_1B4BFFA38((uint64_t)(v18 + 3), (uint64_t)&v24);
  }
  exception = __cxa_allocate_exception(0x28uLL);
  sub_1B4C65EF4((uint64_t)exception, (uint64_t)v27);
  __cxa_throw(exception, (struct type_info *)&unk_1F0D53678, (void (*)(void *))sub_1B4C2FDAC);
}

- (id)generateCaption:(id)a3 error:(id *)a4
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_msgSend_model(self, v6, v7, v8);
  id v9 = (char *)__p[0];
  if (*((char *)__p[0] + 23) < 0)
  {
    sub_1B4BCA11C(__dst, *(void **)__p[0], *((void *)__p[0] + 1));
  }
  else
  {
    long long v10 = *(_OWORD *)__p[0];
    uint64_t v84 = *((void *)__p[0] + 2);
    *(_OWORD *)__dst = v10;
  }
  if (v9[47] < 0)
  {
    sub_1B4BCA11C(&v85, *((void **)v9 + 3), *((void *)v9 + 4));
  }
  else
  {
    long long v11 = *(_OWORD *)(v9 + 24);
    uint64_t v86 = *((void *)v9 + 5);
    long long v85 = v11;
  }
  if (v9[71] < 0)
  {
    sub_1B4BCA11C(&v87, *((void **)v9 + 6), *((void *)v9 + 7));
  }
  else
  {
    long long v12 = *((_OWORD *)v9 + 3);
    uint64_t v88 = *((void *)v9 + 8);
    long long v87 = v12;
  }
  uint64_t v13 = *((void *)v9 + 9);
  int v90 = *((_DWORD *)v9 + 20);
  uint64_t v89 = v13;
  BOOL v14 = (std::__shared_weak_count *)__p[1];
  if (__p[1] && !atomic_fetch_add((atomic_ullong *volatile)__p[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  uint64_t v15 = SHIDWORD(v89);
  uint64_t v16 = operator new(8uLL);
  *uint64_t v16 = 1;
  v17 = operator new(0x10uLL);
  _OWORD *v17 = xmmword_1B4C9B250;
  v18 = v17 + 1;
  v80 = v17;
  v82 = (char *)(v17 + 1);
  operator delete(v16);
  unint64_t v81 = (unint64_t)(v17 + 1);
  uint64_t v19 = 3;
  if ((unint64_t)((v82 - (unsigned char *)v80) >> 2) > 3) {
    uint64_t v19 = ((char *)(v17 + 1) - (unsigned char *)v80) >> 2;
  }
  if ((unint64_t)(v82 - (unsigned char *)v80) >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v20 = v19;
  }
  if (v20)
  {
    if (v20 >> 61) {
      goto LABEL_97;
    }
    v21 = operator new(8 * v20);
    uint64_t v22 = (uint64_t)(v21 + 2);
    v23 = (char *)&v21[v20];
    v21[2] = v15;
    unint64_t v24 = (unint64_t)(v21 + 3);
    if (v18 != v17) {
      goto LABEL_22;
    }
  }
  else
  {
    v21 = 0;
    uint64_t v22 = 16;
    v23 = 0;
    MEMORY[0x10] = v15;
    unint64_t v24 = 24;
    if (v18 != v17)
    {
LABEL_22:
      uint64_t v22 = (uint64_t)v21;
      memcpy(v21, v17, 0x10uLL);
    }
  }
  v80 = (void *)v22;
  unint64_t v81 = v24;
  v82 = v23;
  if (v17)
  {
    operator delete(v17);
    v23 = v82;
  }
  unint64_t v81 = v24;
  if (v24 < (unint64_t)v23)
  {
    *(void *)unint64_t v24 = 7;
    char v25 = (char *)(v24 + 8);
    goto LABEL_48;
  }
  v26 = (char *)v80;
  uint64_t v27 = (uint64_t)(v24 - (void)v80) >> 3;
  unint64_t v28 = v27 + 1;
  if ((unint64_t)(v27 + 1) >> 61) {
    goto LABEL_96;
  }
  if ((v23 - (unsigned char *)v80) >> 2 > v28) {
    unint64_t v28 = (v23 - (unsigned char *)v80) >> 2;
  }
  if ((unint64_t)(v23 - (unsigned char *)v80) >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v29 = v28;
  }
  if (v29)
  {
    if (v29 >> 61) {
      goto LABEL_97;
    }
    v30 = (char *)operator new(8 * v29);
  }
  else
  {
    v30 = 0;
  }
  v31 = &v30[8 * v27];
  v23 = &v30[8 * v29];
  *(void *)v31 = 7;
  char v25 = v31 + 8;
  if ((char *)v24 != v26)
  {
    unint64_t v32 = v24 - (void)v26 - 8;
    if (v32 < 0x18)
    {
      v33 = (char *)v24;
      do
      {
LABEL_45:
        uint64_t v40 = *((void *)v33 - 1);
        v33 -= 8;
        *((void *)v31 - 1) = v40;
        v31 -= 8;
      }
      while (v33 != v26);
      goto LABEL_46;
    }
    uint64_t v34 = (v32 >> 3) + 1;
    uint64_t v35 = 8 * (v34 & 0x3FFFFFFFFFFFFFFCLL);
    v33 = (char *)(v24 - v35);
    v31 -= v35;
    v36 = &v30[8 * v27 - 16];
    v37 = (long long *)(v24 - 16);
    uint64_t v38 = v34 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v39 = *v37;
      *((_OWORD *)v36 - 1) = *(v37 - 1);
      *(_OWORD *)v36 = v39;
      v36 -= 32;
      v37 -= 2;
      v38 -= 4;
    }
    while (v38);
    if (v34 != (v34 & 0x3FFFFFFFFFFFFFFCLL)) {
      goto LABEL_45;
    }
  }
LABEL_46:
  v80 = v31;
  unint64_t v81 = (unint64_t)v25;
  v82 = &v30[8 * v29];
  if (v26)
  {
    operator delete(v26);
    v23 = v82;
  }
LABEL_48:
  unint64_t v81 = (unint64_t)v25;
  if (v25 < v23)
  {
    *(void *)char v25 = 7;
    v41 = v25 + 8;
    goto LABEL_71;
  }
  v42 = (char *)v80;
  int64_t v43 = v25 - (unsigned char *)v80;
  uint64_t v44 = (v25 - (unsigned char *)v80) >> 3;
  unint64_t v45 = v44 + 1;
  if ((unint64_t)(v44 + 1) >> 61) {
LABEL_96:
  }
    sub_1B4BB3244();
  if ((v23 - (unsigned char *)v80) >> 2 > v45) {
    unint64_t v45 = (v23 - (unsigned char *)v80) >> 2;
  }
  if ((unint64_t)(v23 - (unsigned char *)v80) >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v46 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v46 = v45;
  }
  if (v46)
  {
    if (!(v46 >> 61))
    {
      v47 = operator new(8 * v46);
      goto LABEL_60;
    }
LABEL_97:
    sub_1B4BB2D38();
  }
  v47 = 0;
LABEL_60:
  v48 = &v47[8 * v44];
  void *v48 = 7;
  v41 = v48 + 1;
  if (v25 == v42) {
    goto LABEL_69;
  }
  unint64_t v49 = v25 - v42 - 8;
  if (v49 < 0x58)
  {
    v50 = v25;
    goto LABEL_68;
  }
  if ((unint64_t)(v25 - v47 - v43) < 0x20)
  {
    v50 = v25;
    do
    {
LABEL_68:
      uint64_t v57 = *((void *)v50 - 1);
      v50 -= 8;
      *--v48 = v57;
    }
    while (v50 != v42);
    goto LABEL_69;
  }
  uint64_t v51 = (v49 >> 3) + 1;
  uint64_t v52 = 8 * (v51 & 0x3FFFFFFFFFFFFFFCLL);
  v50 = &v25[-v52];
  v48 = (void *)((char *)v48 - v52);
  v53 = &v47[8 * v44 - 16];
  v54 = (long long *)(v25 - 16);
  uint64_t v55 = v51 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    long long v56 = *v54;
    *(v53 - 1) = *(v54 - 1);
    _OWORD *v53 = v56;
    v53 -= 2;
    v54 -= 2;
    v55 -= 4;
  }
  while (v55);
  if (v51 != (v51 & 0x3FFFFFFFFFFFFFFCLL)) {
    goto LABEL_68;
  }
LABEL_69:
  v80 = v48;
  unint64_t v81 = (unint64_t)v41;
  v82 = &v47[8 * v46];
  if (v42) {
    operator delete(v42);
  }
LABEL_71:
  unint64_t v81 = (unint64_t)v41;
  id v58 = v5;
  uint64_t v101 = 0;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  *(_OWORD *)__p = 0u;
  long long v92 = 0u;
  espresso_buffer_pack_tensor_shape();
  LODWORD(v101) = 65568;
  id v59 = v58;
  __p[0] = objc_msgSend_bytes(v59, v60, v61, v62);
  LOWORD(v74) = 1;
  sub_1B4C0B744((uint64_t)v76, (uint64_t)__p, &v74);

  objc_msgSend_model(self, v63, v64, v65);
  sub_1B4C03774(v74, (uint64_t)v76);
  v66 = v75;
  if (v75 && !atomic_fetch_add(&v75->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
    std::__shared_weak_count::__release_weak(v66);
  }
  id v67 = [NSString alloc];
  if ((SBYTE7(v92) & 0x80u) == 0) {
    uint64_t v70 = objc_msgSend_initWithUTF8String_(v67, v68, (uint64_t)__p, v69);
  }
  else {
    uint64_t v70 = objc_msgSend_initWithUTF8String_(v67, v68, (uint64_t)__p[0], v69);
  }
  v71 = (void *)v70;
  if (SBYTE7(v92) < 0) {
    operator delete(__p[0]);
  }
  v76[0] = &unk_1F0D54F90;
  v72 = v79;
  if (v79 && !atomic_fetch_add(&v79->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
    std::__shared_weak_count::__release_weak(v72);
  }
  if (v77)
  {
    v78 = v77;
    operator delete(v77);
  }
  if (v80)
  {
    unint64_t v81 = (unint64_t)v80;
    operator delete(v80);
  }
  if ((SHIBYTE(v88) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v86) & 0x80000000) == 0) {
      goto LABEL_88;
    }
LABEL_91:
    operator delete((void *)v85);
    if ((SHIBYTE(v84) & 0x80000000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_92;
  }
  operator delete((void *)v87);
  if (SHIBYTE(v86) < 0) {
    goto LABEL_91;
  }
LABEL_88:
  if ((SHIBYTE(v84) & 0x80000000) == 0) {
    goto LABEL_93;
  }
LABEL_92:
  operator delete(__dst[0]);
LABEL_93:

  return v71;
}

- (shared_ptr<cvnlp::vidcap::VideoCaptioningModel>)model
{
  cntrl = self->_model.__cntrl_;
  *v2 = self->_model.__ptr_;
  v2[1] = (VideoCaptioningModel *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (VideoCaptioningModel *)self;
  return result;
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
    p_options = &self->_options;
  }
  else
  {
    p_options = &self->_options;
  }
  objc_storeStrong((id *)p_options, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end