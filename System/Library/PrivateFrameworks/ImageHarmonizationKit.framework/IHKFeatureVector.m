@interface IHKFeatureVector
+ (BOOL)supportsSecureCoding;
+ (id)addFeatureVectorA:(id)a3 B:(id)a4;
+ (id)copy:(id)a3;
+ (id)multiplyFeatureVector:(id)a3 byScalar:(float)a4;
- (EspressoTensor)tensor;
- (IHKFeatureVector)initWithCoder:(id)a3;
- (IHKFeatureVector)initWithData:(id)a3;
- (IHKFeatureVector)initWithTensor:(EspressoTensor *)a3;
- (float)cosineSimilarity:(id)a3;
- (float)l2Distance:(id)a3;
- (id).cxx_construct;
- (id)featureVectorByAppendingFeatureVector:(id)a3;
- (id)subFeatureVectorWithRange:(_NSRange)a3;
- (unint64_t)size;
- (void)debugPrintTensor:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)saveToBinaryFile:(id)a3;
- (void)saveToTextFile:(id)a3;
- (void)setTensor:(EspressoTensor *)a3;
@end

@implementation IHKFeatureVector

- (IHKFeatureVector)initWithTensor:(EspressoTensor *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)IHKFeatureVector;
  v7 = [(IHKFeatureVector *)&v21 init];
  if (v7)
  {
    v14 = &unk_2702DD568;
    int type = a3->type_;
    v17 = 0;
    v18 = 0;
    __p = 0;
    begin = a3->shape_.sizes_.__begin_;
    end = a3->shape_.sizes_.__end_;
    int64_t v10 = (char *)end - (char *)begin;
    if (end != begin)
    {
      if (v10 < 0) {
        sub_2529C1558();
      }
      __p = operator new((char *)end - (char *)begin);
      v18 = (char *)__p + 8 * (v10 >> 3);
      memcpy(__p, begin, v10);
      v17 = v18;
    }
    cntrl = a3->storage_.__cntrl_;
    ptr = a3->storage_.__ptr_;
    v20 = cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    v14 = &unk_2702DD520;
    objc_msgSend_setTensor_(v7, v4, (uint64_t)&v14, v5, v6);
    v14 = &unk_2702DD568;
    v12 = (std::__shared_weak_count *)v20;
    if (v20 && !atomic_fetch_add((atomic_ullong *volatile)v20 + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    if (__p)
    {
      v17 = __p;
      operator delete(__p);
    }
  }
  return v7;
}

- (IHKFeatureVector)initWithData:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)IHKFeatureVector;
  v9 = [(IHKFeatureVector *)&v45 init];
  if (v9)
  {
    unint64_t v10 = objc_msgSend_length(v4, v5, v6, v7, v8);
    int v40 = 4;
    v11 = operator new(8uLL);
    v34 = v11;
    void *v11 = v10 >> 2;
    v35 = v11 + 1;
    v36 = v11 + 1;
    sub_2529C0C94((uint64_t)v41, &v40, (uint64_t)&v34);
    objc_msgSend_setTensor_(v9, v12, (uint64_t)v41, v13, v14);
    v41[0] = &unk_2702DD568;
    v19 = v44;
    if (v44 && !atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
    if (__p)
    {
      v43 = __p;
      operator delete(__p);
    }
    if (v34)
    {
      v35 = v34;
      operator delete(v34);
    }
    objc_msgSend_tensor(v9, v15, v16, v17, v18);
    v20 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v38 + 24))(v38);
    id v21 = v4;
    v26 = (const void *)objc_msgSend_bytes(v21, v22, v23, v24, v25);
    size_t v31 = objc_msgSend_length(v21, v27, v28, v29, v30);
    memcpy(v20, v26, v31);
    v34 = &unk_2702DD568;
    v32 = v39;
    if (v39 && !atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
    if (v36)
    {
      v37 = v36;
      operator delete(v36);
    }
  }

  return v9;
}

- (unint64_t)size
{
  objc_msgSend_tensor(self, a2, v2, v3, v4);
  if (__p == v24)
  {
    unint64_t v8 = 0;
    v9 = v25;
    if (!v25) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  unint64_t v5 = (char *)v24 - (char *)__p - 8;
  if (v5 < 0x38)
  {
    int v6 = 1;
    uint64_t v7 = (char *)__p;
    do
    {
LABEL_9:
      int v20 = *(_DWORD *)v7;
      v7 += 8;
      v6 *= v20;
    }
    while (v7 != (char *)v24);
    goto LABEL_10;
  }
  uint64_t v10 = (v5 >> 3) + 1;
  uint64_t v7 = &__p->i8[8 * (v10 & 0x3FFFFFFFFFFFFFF8)];
  v11 = __p + 2;
  v12.i64[0] = 0x100000001;
  v12.i64[1] = 0x100000001;
  uint64_t v13 = v10 & 0x3FFFFFFFFFFFFFF8;
  v14.i64[0] = 0x100000001;
  v14.i64[1] = 0x100000001;
  do
  {
    int32x4_t v16 = v11[-2];
    int32x4_t v15 = v11[-1];
    int32x4_t v18 = *v11;
    int32x4_t v17 = v11[1];
    v11 += 4;
    int32x4_t v12 = vmulq_s32(v12, vuzp1q_s32(v16, v15));
    int32x4_t v14 = vmulq_s32(v14, vuzp1q_s32(v18, v17));
    v13 -= 8;
  }
  while (v13);
  int8x16_t v19 = (int8x16_t)vmulq_s32(v14, v12);
  *(int32x2_t *)v19.i8 = vmul_s32(*(int32x2_t *)v19.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v19, v19, 8uLL));
  int v6 = v19.i32[0] * v19.i32[1];
  if (v10 != (v10 & 0x3FFFFFFFFFFFFFF8)) {
    goto LABEL_9;
  }
LABEL_10:
  unint64_t v8 = v6;
  v9 = v25;
  if (!v25) {
    goto LABEL_12;
  }
LABEL_11:
  if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
    id v21 = __p;
    if (!__p) {
      return v8;
    }
    goto LABEL_13;
  }
LABEL_12:
  id v21 = __p;
  if (__p) {
LABEL_13:
  }
    operator delete(v21);
  return v8;
}

- (id)featureVectorByAppendingFeatureVector:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_size(self, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_size(v4, v10, v11, v12, v13);
  int v68 = 4;
  int32x4_t v15 = operator new(8uLL);
  __p = v15;
  void *v15 = v14 + v9;
  v63 = v15 + 1;
  v64 = v15 + 1;
  sub_2529C0C94((uint64_t)&v69, &v68, (uint64_t)&__p);
  if (__p)
  {
    v63 = __p;
    operator delete(__p);
  }
  int32x4_t v16 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v73 + 24))(v73);
  objc_msgSend_tensor(self, v17, v18, v19, v20);
  id v21 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)v66 + 24))(v66);
  uint64_t v26 = objc_msgSend_size(self, v22, v23, v24, v25);
  memcpy(v16, v21, 4 * v26);
  __p = &unk_2702DD568;
  v27 = v67;
  if (v67 && !atomic_fetch_add(&v67->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
    std::__shared_weak_count::__release_weak(v27);
  }
  if (v64)
  {
    v65 = v64;
    operator delete(v64);
  }
  uint64_t v28 = (*(uint64_t (**)(uint64_t))(*(void *)v73 + 24))(v73);
  uint64_t v33 = objc_msgSend_size(self, v29, v30, v31, v32);
  objc_msgSend_tensor(v4, v34, v35, v36, v37);
  uint64_t v38 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)v66 + 24))(v66);
  uint64_t v43 = objc_msgSend_size(v4, v39, v40, v41, v42);
  memcpy((void *)(v28 + 4 * v33), v38, 4 * v43);
  __p = &unk_2702DD568;
  v44 = v67;
  if (v67 && !atomic_fetch_add(&v67->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
    std::__shared_weak_count::__release_weak(v44);
  }
  if (v64)
  {
    v65 = v64;
    operator delete(v64);
  }
  v48 = [IHKFeatureVector alloc];
  v55 = &unk_2702DD568;
  int v56 = v70;
  v58 = 0;
  v59 = 0;
  v57 = 0;
  v49 = v71;
  int64_t v50 = v72 - v71;
  if (v72 != v71)
  {
    if (v50 < 0) {
      sub_2529C1558();
    }
    v57 = operator new(v72 - v71);
    v59 = (char *)v57 + 8 * (v50 >> 3);
    memcpy(v57, v49, v50);
    v58 = v59;
  }
  uint64_t v60 = v73;
  v61 = v74;
  if (v74) {
    atomic_fetch_add_explicit(&v74->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v55 = &unk_2702DD520;
  v51 = objc_msgSend_initWithTensor_(v48, v45, (uint64_t)&v55, v46, v47);
  v55 = &unk_2702DD568;
  v52 = v61;
  if (v61 && !atomic_fetch_add(&v61->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
    std::__shared_weak_count::__release_weak(v52);
  }
  if (v57)
  {
    v58 = v57;
    operator delete(v57);
  }
  v69 = &unk_2702DD568;
  v53 = v74;
  if (v74 && !atomic_fetch_add(&v74->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
    std::__shared_weak_count::__release_weak(v53);
  }
  if (v71)
  {
    v72 = v71;
    operator delete(v71);
  }

  return v51;
}

- (id)subFeatureVectorWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  int v37 = 4;
  uint64_t v6 = operator new(8uLL);
  __p = v6;
  *uint64_t v6 = length;
  uint64_t v32 = v6 + 1;
  uint64_t v33 = v6 + 1;
  sub_2529C0C94((uint64_t)&v38, &v37, (uint64_t)&__p);
  if (__p)
  {
    uint64_t v32 = __p;
    operator delete(__p);
  }
  uint64_t v7 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v42 + 24))(v42);
  objc_msgSend_tensor(self, v8, v9, v10, v11);
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v35 + 24))(v35);
  memcpy(v7, (const void *)(v12 + 4 * location), 4 * length);
  __p = &unk_2702DD568;
  uint64_t v13 = v36;
  if (v36 && !atomic_fetch_add(&v36->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  if (v33)
  {
    v34 = v33;
    operator delete(v33);
  }
  int32x4_t v17 = [IHKFeatureVector alloc];
  uint64_t v24 = &unk_2702DD568;
  int v25 = v39;
  v27 = 0;
  uint64_t v28 = 0;
  uint64_t v26 = 0;
  uint64_t v18 = v40;
  int64_t v19 = v41 - v40;
  if (v41 != v40)
  {
    if (v19 < 0) {
      sub_2529C1558();
    }
    uint64_t v26 = operator new(v41 - v40);
    uint64_t v28 = (char *)v26 + 8 * (v19 >> 3);
    memcpy(v26, v18, v19);
    v27 = v28;
  }
  uint64_t v29 = v42;
  uint64_t v30 = v43;
  if (v43) {
    atomic_fetch_add_explicit(&v43->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v24 = &unk_2702DD520;
  uint64_t v20 = objc_msgSend_initWithTensor_(v17, v14, (uint64_t)&v24, v15, v16);
  uint64_t v24 = &unk_2702DD568;
  id v21 = v30;
  if (v30 && !atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
  }
  if (v26)
  {
    v27 = v26;
    operator delete(v26);
  }
  uint64_t v38 = &unk_2702DD568;
  v22 = v43;
  if (v43 && !atomic_fetch_add(&v43->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
  }
  if (v40)
  {
    uint64_t v41 = v40;
    operator delete(v40);
  }

  return v20;
}

- (void)saveToTextFile:(id)a3
{
  v34[19] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend_UTF8String(v4, v5, v6, v7, v8);
  sub_2529BDC0C(&v32);
  objc_msgSend_tensor(self, v9, v10, v11, v12);
  if (v31 && !atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v31->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v31);
  }
  if (__p)
  {
    uint64_t v29 = __p;
    operator delete(__p);
  }
  if (__p != v29)
  {
    sub_2529C196C(&v32, (uint64_t)"", 0);
    std::ostream::operator<<();
    for (i = __p + 8; i != v29; i += 8)
    {
      sub_2529C196C(&v32, (uint64_t)", ", 2);
      std::ostream::operator<<();
    }
  }
  sub_2529C196C(&v32, (uint64_t)"\n", 1);
  objc_msgSend_tensor(self, v14, v15, v16, v17, &unk_2702DD568);
  if (v27 != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v18 = (*(uint64_t (**)())(*(void *)v30 + 24))();
  unint64_t v20 = v19;
  if (v31 && !atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v31->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v31);
  }
  if (__p) {
    operator delete(__p);
  }
  if (v20 >= 4)
  {
    uint64_t v21 = 4 * (v20 >> 2);
    v22 = "";
    int v23 = -1;
    unsigned int v24 = 1;
    do
    {
      size_t v25 = strlen(v22);
      sub_2529C196C(&v32, (uint64_t)v22, v25);
      std::ostream::operator<<();
      if (v23 + 10 * (v24 / 0xA)) {
        v22 = ", ";
      }
      else {
        v22 = ",\n";
      }
      v18 += 4;
      --v23;
      ++v24;
      v21 -= 4;
    }
    while (v21);
  }
  sub_2529C196C(&v32, (uint64_t)"\n", 1);
  uint64_t v32 = *MEMORY[0x263F8C2B0];
  *(uint64_t *)((char *)&v32 + *(void *)(v32 - 24)) = *(void *)(MEMORY[0x263F8C2B0] + 24);
  MEMORY[0x2533C4770](&v33);
  std::ostream::~ostream();
  MEMORY[0x2533C4830](v34);
}

- (void)saveToBinaryFile:(id)a3
{
  id v4 = a3;
  uint64_t v9 = (const char *)objc_msgSend_UTF8String(v4, v5, v6, v7, v8);
  uint64_t v10 = fopen(v9, "wb");
  objc_msgSend_tensor(self, v11, v12, v13, v14);
  uint64_t v15 = (const void *)(*(uint64_t (**)())(*(void *)v39 + 24))();
  objc_msgSend_tensor(self, v16, v17, v18, v19);
  if (__p != (int32x4_t *)v36)
  {
    unint64_t v20 = v36 - (char *)__p - 8;
    if (v20 >= 0x38)
    {
      uint64_t v24 = (v20 >> 3) + 1;
      v22 = &__p->i8[8 * (v24 & 0x3FFFFFFFFFFFFFF8)];
      size_t v25 = __p + 2;
      v26.i64[0] = 0x100000001;
      v26.i64[1] = 0x100000001;
      uint64_t v27 = v24 & 0x3FFFFFFFFFFFFFF8;
      v28.i64[0] = 0x100000001;
      v28.i64[1] = 0x100000001;
      do
      {
        int32x4_t v30 = v25[-2];
        int32x4_t v29 = v25[-1];
        int32x4_t v32 = *v25;
        int32x4_t v31 = v25[1];
        v25 += 4;
        int32x4_t v26 = vmulq_s32(v26, vuzp1q_s32(v30, v29));
        int32x4_t v28 = vmulq_s32(v28, vuzp1q_s32(v32, v31));
        v27 -= 8;
      }
      while (v27);
      int8x16_t v33 = (int8x16_t)vmulq_s32(v28, v26);
      *(int32x2_t *)v33.i8 = vmul_s32(*(int32x2_t *)v33.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v33, v33, 8uLL));
      int v21 = v33.i32[0] * v33.i32[1];
      if (v24 == (v24 & 0x3FFFFFFFFFFFFFF8)) {
        goto LABEL_9;
      }
    }
    else
    {
      int v21 = 1;
      v22 = (char *)__p;
    }
    do
    {
      int v34 = *(_DWORD *)v22;
      v22 += 8;
      v21 *= v34;
    }
    while (v22 != v36);
LABEL_9:
    size_t v23 = v21;
    goto LABEL_10;
  }
  size_t v23 = 0;
LABEL_10:
  fwrite(v15, 4uLL, v23, v10);
  if (v37 && !atomic_fetch_add(&v37->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v37->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v37);
  }
  if (__p) {
    operator delete(__p);
  }
  if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v40->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v40);
  }
  if (v38) {
    operator delete(v38);
  }
  fclose(v10);
}

- (void)debugPrintTensor:(id)a3
{
  id v4 = a3;
  objc_msgSend_tensor(self, v5, v6, v7, v8);
  if (v40 != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v9 = (*(uint64_t (**)())(*(void *)v43 + 24))();
  if (v44 && !atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v44->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v44);
  }
  if (__p)
  {
    uint64_t v42 = __p;
    operator delete(__p);
  }
  id v39 = v4;
  uint64_t v14 = (const char *)objc_msgSend_UTF8String(v39, v10, v11, v12, v13);
  printf("DEBUG>> %s = [", v14);
  unint64_t v19 = 0;
  for (i = "; ; i = ", "")
  {
    objc_msgSend_tensor(self, v15, v16, v17, v18);
    if (__p == v42)
    {
      unint64_t v24 = 0;
      size_t v25 = v44;
      if (!v44) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    unint64_t v21 = (char *)v42 - (char *)__p - 8;
    if (v21 < 0x38)
    {
      int v22 = 1;
      size_t v23 = __p;
      do
      {
LABEL_16:
        __int32 v36 = v23->i32[0];
        size_t v23 = (int32x4_t *)((char *)v23 + 8);
        v22 *= v36;
      }
      while (v23 != v42);
      goto LABEL_17;
    }
    uint64_t v26 = (v21 >> 3) + 1;
    size_t v23 = (int32x4_t *)((char *)__p + 8 * (v26 & 0x3FFFFFFFFFFFFFF8));
    uint64_t v27 = __p + 2;
    v28.i64[0] = 0x100000001;
    v28.i64[1] = 0x100000001;
    uint64_t v29 = v26 & 0x3FFFFFFFFFFFFFF8;
    v30.i64[0] = 0x100000001;
    v30.i64[1] = 0x100000001;
    do
    {
      int32x4_t v32 = v27[-2];
      int32x4_t v31 = v27[-1];
      int32x4_t v34 = *v27;
      int32x4_t v33 = v27[1];
      v27 += 4;
      int32x4_t v28 = vmulq_s32(v28, vuzp1q_s32(v32, v31));
      int32x4_t v30 = vmulq_s32(v30, vuzp1q_s32(v34, v33));
      v29 -= 8;
    }
    while (v29);
    int8x16_t v35 = (int8x16_t)vmulq_s32(v30, v28);
    *(int32x2_t *)v35.i8 = vmul_s32(*(int32x2_t *)v35.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v35, v35, 8uLL));
    int v22 = v35.i32[0] * v35.i32[1];
    if (v26 != (v26 & 0x3FFFFFFFFFFFFFF8)) {
      goto LABEL_16;
    }
LABEL_17:
    unint64_t v24 = v22;
    size_t v25 = v44;
    if (!v44) {
      goto LABEL_19;
    }
LABEL_18:
    if (atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
LABEL_19:
      int v37 = __p;
      if (!__p) {
        goto LABEL_21;
      }
LABEL_20:
      uint64_t v42 = v37;
      operator delete(v37);
      goto LABEL_21;
    }
    ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
    std::__shared_weak_count::__release_weak(v25);
    int v37 = __p;
    if (__p) {
      goto LABEL_20;
    }
LABEL_21:
    if (v19 >= v24) {
      break;
    }
    printf("%s%f", i, *(float *)(v9 + 4 * v19++));
  }
  puts("]");
}

- (float)cosineSimilarity:(id)a3
{
  id v4 = a3;
  objc_msgSend_tensor(self, v5, v6, v7, v8);
  if (v37 != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v13 = (*(uint64_t (**)())(*(void *)v39 + 24))();
  unint64_t v14 = (unint64_t)v9;
  if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v40->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v40);
  }
  if (__p) {
    operator delete(__p);
  }
  if (!v4)
  {
    __int32 v36 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v36, "Incorrect data type requested.");
    __cxa_throw(v36, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  objc_msgSend_tensor(v4, v9, v10, v11, v12, &unk_2702DD568);
  uint64_t v15 = (*(uint64_t (**)())(*(void *)v39 + 24))();
  if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v40->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v40);
  }
  if (__p) {
    operator delete(__p);
  }
  float v16 = 0.0;
  if (v14 >= 4)
  {
    unint64_t v17 = v14 >> 2;
    if (v14 >> 2 <= 1) {
      unint64_t v17 = 1;
    }
    if (v17 >= 2)
    {
      uint64_t v18 = v17 & 0x3FFFFFFFFFFFFFFELL;
      int v22 = (float *)(v13 + 4);
      size_t v23 = (float *)(v15 + 4);
      float v19 = 0.0;
      uint64_t v24 = v17 & 0x3FFFFFFFFFFFFFFELL;
      float v20 = 0.0;
      float v21 = 0.0;
      do
      {
        float v25 = *(v22 - 1);
        float v26 = *(v23 - 1);
        float v19 = (float)(v19 + (float)(v25 * v26)) + (float)(*v22 * *v23);
        float v20 = (float)(v20 + (float)(v26 * v26)) + (float)(*v23 * *v23);
        float v21 = (float)(v21 + (float)(v25 * v25)) + (float)(*v22 * *v22);
        v22 += 2;
        v23 += 2;
        v24 -= 2;
      }
      while (v24);
      if (v17 == v18)
      {
LABEL_23:
        float v16 = 0.0;
        if (v21 != 0.0 && v20 != 0.0) {
          float v16 = v19 / (float)(sqrtf(v21) * sqrtf(v20));
        }
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v18 = 0;
      float v19 = 0.0;
      float v20 = 0.0;
      float v21 = 0.0;
    }
    unint64_t v27 = v17 - v18;
    uint64_t v28 = 4 * v18;
    uint64_t v29 = (float *)(v13 + 4 * v18);
    int32x4_t v30 = (float *)(v15 + v28);
    do
    {
      float v31 = *v29++;
      float v32 = v31;
      float v33 = *v30++;
      float v19 = v19 + (float)(v32 * v33);
      float v21 = v21 + (float)(v32 * v32);
      float v20 = v20 + (float)(v33 * v33);
      --v27;
    }
    while (v27);
    goto LABEL_23;
  }
LABEL_26:

  return v16;
}

- (float)l2Distance:(id)a3
{
  id v4 = a3;
  objc_msgSend_tensor(self, v5, v6, v7, v8);
  if (v37 != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v13 = (*(uint64_t (**)())(*(void *)v39 + 24))();
  unint64_t v14 = (unint64_t)v9;
  if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v40->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v40);
  }
  if (__p) {
    operator delete(__p);
  }
  if (!v4)
  {
    __int32 v36 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v36, "Incorrect data type requested.");
    __cxa_throw(v36, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  objc_msgSend_tensor(v4, v9, v10, v11, v12, &unk_2702DD568);
  uint64_t v15 = (*(uint64_t (**)())(*(void *)v39 + 24))();
  if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v40->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v40);
  }
  if (__p) {
    operator delete(__p);
  }
  float v16 = 0.0;
  if (v14 >= 4)
  {
    unint64_t v17 = v14 >> 2;
    if (v14 >> 2 <= 1) {
      unint64_t v17 = 1;
    }
    if (v17 < 8)
    {
      uint64_t v18 = 0;
LABEL_21:
      unint64_t v26 = v17 - v18;
      uint64_t v27 = 4 * v18;
      uint64_t v28 = (float *)(v13 + 4 * v18);
      uint64_t v29 = (float *)(v15 + v27);
      do
      {
        float v30 = *v28++;
        float v31 = v30;
        float v32 = *v29++;
        float v16 = v16 + (float)((float)(v31 - v32) * (float)(v31 - v32));
        --v26;
      }
      while (v26);
      goto LABEL_23;
    }
    uint64_t v18 = v17 & 0x3FFFFFFFFFFFFFF8;
    float v19 = (float32x4_t *)(v13 + 16);
    float v20 = (float32x4_t *)(v15 + 16);
    uint64_t v21 = v17 & 0x3FFFFFFFFFFFFFF8;
    do
    {
      float32x4_t v22 = vsubq_f32(v19[-1], v20[-1]);
      float32x4_t v23 = vsubq_f32(*v19, *v20);
      float32x4_t v24 = vmulq_f32(v22, v22);
      float32x4_t v25 = vmulq_f32(v23, v23);
      float v16 = (float)((float)((float)((float)((float)((float)((float)(v16 + v24.f32[0]) + v24.f32[1]) + v24.f32[2])
                                          + v24.f32[3])
                                  + v25.f32[0])
                          + v25.f32[1])
                  + v25.f32[2])
          + v25.f32[3];
      v19 += 2;
      v20 += 2;
      v21 -= 8;
    }
    while (v21);
    if (v17 != v18) {
      goto LABEL_21;
    }
  }
LABEL_23:
  float v33 = sqrtf(v16);

  return v33;
}

+ (id)copy:(id)a3
{
  id v3 = a3;
  uint64_t v8 = v3;
  if (v3)
  {
    objc_msgSend_tensor(v3, v4, v5, v6, v7);
    int v45 = DWORD2(v41);
    objc_msgSend_tensor(v8, v9, v10, v11, v12);
  }
  else
  {
    v44 = 0;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v41 = 0u;
    int v45 = 0;
    int v40 = 0;
    *(_OWORD *)__p = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
  }
  sub_2529C0C94((uint64_t)&v46, &v45, (uint64_t)__p);
  *(void *)&long long v37 = &unk_2702DD568;
  unint64_t v17 = v40;
  if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  *(void *)&long long v41 = &unk_2702DD568;
  uint64_t v18 = v44;
  if (v44 && !atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  if ((void)v42)
  {
    *((void *)&v42 + 1) = v42;
    operator delete((void *)v42);
  }
  if (v8)
  {
    objc_msgSend_tensor(v8, v13, v14, v15, v16);
  }
  else
  {
    v44 = 0;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v41 = 0u;
  }
  sub_2529BF0D0((uint64_t)&v46, (uint64_t)&v41);
  *(void *)&long long v41 = &unk_2702DD568;
  float v19 = v44;
  if (v44 && !atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
  if ((void)v42)
  {
    *((void *)&v42 + 1) = v42;
    operator delete((void *)v42);
  }
  float32x4_t v23 = [IHKFeatureVector alloc];
  float v30 = &unk_2702DD568;
  int v31 = v47;
  float v33 = 0;
  int32x4_t v34 = 0;
  float v32 = 0;
  float32x4_t v24 = v48;
  int64_t v25 = v49 - v48;
  if (v49 != v48)
  {
    if (v25 < 0) {
      sub_2529C1558();
    }
    float v32 = operator new(v49 - v48);
    int32x4_t v34 = (char *)v32 + 8 * (v25 >> 3);
    memcpy(v32, v24, v25);
    float v33 = v34;
  }
  uint64_t v35 = v50;
  __int32 v36 = v51;
  if (v51) {
    atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  float v30 = &unk_2702DD520;
  unint64_t v26 = objc_msgSend_initWithTensor_(v23, v20, (uint64_t)&v30, v21, v22);
  float v30 = &unk_2702DD568;
  uint64_t v27 = v36;
  if (v36 && !atomic_fetch_add(&v36->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
    std::__shared_weak_count::__release_weak(v27);
  }
  if (v32)
  {
    float v33 = v32;
    operator delete(v32);
  }
  uint64_t v46 = &unk_2702DD568;
  uint64_t v28 = v51;
  if (v51 && !atomic_fetch_add(&v51->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
  }
  if (v48)
  {
    v49 = v48;
    operator delete(v48);
  }

  return v26;
}

+ (id)addFeatureVectorA:(id)a3 B:(id)a4
{
  id v5 = a3;
  id v10 = a4;
  if (!v5)
  {
    uint64_t v66 = 0;
    long long __p = 0u;
    long long v65 = 0u;
    long long v63 = 0u;
LABEL_52:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  objc_msgSend_tensor(v5, v6, v7, v8, v9);
  if (DWORD2(v63) != 4) {
    goto LABEL_52;
  }
  uint64_t v15 = (*(uint64_t (**)(void))(**((void **)&v65 + 1) + 24))(*((void *)&v65 + 1));
  unint64_t v16 = (unint64_t)v11;
  *(void *)&long long v63 = &unk_2702DD568;
  if (v66 && !atomic_fetch_add(&v66->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
    std::__shared_weak_count::__release_weak(v66);
  }
  if ((void)__p)
  {
    *((void *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  if (!v10)
  {
    uint64_t v66 = 0;
    long long __p = 0u;
    long long v65 = 0u;
    long long v63 = 0u;
    uint64_t v50 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v50, "Incorrect data type requested.");
    __cxa_throw(v50, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  objc_msgSend_tensor(v10, v11, v12, v13, v14);
  uint64_t v21 = (*(uint64_t (**)(void))(**((void **)&v65 + 1) + 24))(*((void *)&v65 + 1));
  *(void *)&long long v63 = &unk_2702DD568;
  if (v66 && !atomic_fetch_add(&v66->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
    std::__shared_weak_count::__release_weak(v66);
  }
  if ((void)__p)
  {
    *((void *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  int v62 = 4;
  objc_msgSend_tensor(v5, v17, v18, v19, v20);
  sub_2529C0C94((uint64_t)&v63, &v62, (uint64_t)v60);
  v59 = &unk_2702DD568;
  uint64_t v22 = v61;
  if (v61 && !atomic_fetch_add(&v61->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
  }
  if (v60[0])
  {
    v60[1] = v60[0];
    operator delete(v60[0]);
  }
  if (DWORD2(v63) != 4)
  {
    v51 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v51, "Incorrect data type requested.");
    __cxa_throw(v51, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v23 = (*(uint64_t (**)(void))(**((void **)&v65 + 1) + 24))(*((void *)&v65 + 1));
  if (v16 >= 4)
  {
    unint64_t v24 = v16 >> 2;
    if (v16 >> 2 <= 1) {
      unint64_t v24 = 1;
    }
    if (v24 < 8)
    {
      uint64_t v25 = 0;
LABEL_25:
      unint64_t v26 = v24 - v25;
      uint64_t v27 = 4 * v25;
      uint64_t v28 = (float *)(v15 + 4 * v25);
      uint64_t v29 = (float *)(v21 + v27);
      float v30 = (float *)(v23 + v27);
      do
      {
        float v31 = *v28++;
        float v32 = v31;
        float v33 = *v29++;
        *v30++ = v32 + v33;
        --v26;
      }
      while (v26);
      goto LABEL_27;
    }
    uint64_t v25 = 0;
    if ((unint64_t)(v23 - v15) < 0x20) {
      goto LABEL_25;
    }
    if ((unint64_t)(v23 - v21) < 0x20) {
      goto LABEL_25;
    }
    uint64_t v25 = v24 & 0x3FFFFFFFFFFFFFF8;
    v44 = (float32x4_t *)(v15 + 16);
    int v45 = (float32x4_t *)(v21 + 16);
    uint64_t v46 = (float32x4_t *)(v23 + 16);
    uint64_t v47 = v24 & 0x3FFFFFFFFFFFFFF8;
    do
    {
      float32x4_t v48 = vaddq_f32(*v44, *v45);
      v46[-1] = vaddq_f32(v44[-1], v45[-1]);
      *uint64_t v46 = v48;
      v44 += 2;
      v45 += 2;
      v46 += 2;
      v47 -= 8;
    }
    while (v47);
    if (v24 != v25) {
      goto LABEL_25;
    }
  }
LABEL_27:
  long long v37 = [IHKFeatureVector alloc];
  v52 = &unk_2702DD568;
  int v53 = DWORD2(v63);
  v55 = 0;
  int v56 = 0;
  v54 = 0;
  uint64_t v38 = (const void *)__p;
  int64_t v39 = *((void *)&__p + 1) - __p;
  if (*((void *)&__p + 1) != (void)__p)
  {
    if (v39 < 0) {
      sub_2529C1558();
    }
    v54 = operator new(*((void *)&__p + 1) - __p);
    int v56 = (char *)v54 + 8 * (v39 >> 3);
    memcpy(v54, v38, v39);
    v55 = v56;
  }
  uint64_t v57 = *((void *)&v65 + 1);
  v58 = v66;
  if (v66) {
    atomic_fetch_add_explicit(&v66->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v52 = &unk_2702DD520;
  int v40 = objc_msgSend_initWithTensor_(v37, v34, (uint64_t)&v52, v35, v36);
  v52 = &unk_2702DD568;
  long long v41 = v58;
  if (v58 && !atomic_fetch_add(&v58->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
    std::__shared_weak_count::__release_weak(v41);
  }
  if (v54)
  {
    v55 = v54;
    operator delete(v54);
  }
  *(void *)&long long v63 = &unk_2702DD568;
  long long v42 = v66;
  if (v66 && !atomic_fetch_add(&v66->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
    std::__shared_weak_count::__release_weak(v42);
  }
  if ((void)__p)
  {
    *((void *)&__p + 1) = __p;
    operator delete((void *)__p);
  }

  return v40;
}

+ (id)multiplyFeatureVector:(id)a3 byScalar:(float)a4
{
  uint64_t v44 = *(void *)&a4;
  id v4 = a3;
  uint64_t v9 = v4;
  int v56 = 4;
  if (v4)
  {
    objc_msgSend_tensor(v4, v5, v6, v7, v8);
  }
  else
  {
    v55 = 0;
    *(_OWORD *)long long __p = 0u;
    long long v54 = 0u;
    long long v52 = 0u;
  }
  sub_2529C0C94((uint64_t)&v57, &v56, (uint64_t)__p);
  *(void *)&long long v52 = &unk_2702DD568;
  id v10 = v55;
  if (v55 && !atomic_fetch_add(&v55->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v58 != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v61 + 24))(v61);
  if (!v9)
  {
    v55 = 0;
    *(_OWORD *)long long __p = 0u;
    long long v54 = 0u;
    long long v52 = 0u;
LABEL_47:
    long long v43 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v43, "Incorrect data type requested.");
    __cxa_throw(v43, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v16 = v11;
  unint64_t v17 = (unint64_t)v12;
  objc_msgSend_tensor(v9, v12, v13, v14, v15);
  if (DWORD2(v52) != 4) {
    goto LABEL_47;
  }
  uint64_t v18 = (*(uint64_t (**)(void))(**((void **)&v54 + 1) + 24))(*((void *)&v54 + 1));
  *(void *)&long long v52 = &unk_2702DD568;
  uint64_t v19 = v55;
  float v20 = *(float *)&v44;
  if (v55 && !atomic_fetch_add(&v55->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
    float v20 = *(float *)&v44;
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
    float v20 = *(float *)&v44;
  }
  if (v17 >= 4)
  {
    uint64_t v21 = 0;
    unint64_t v22 = v17 >> 2;
    if (v17 >> 2 <= 1) {
      unint64_t v22 = 1;
    }
    if (v22 < 8) {
      goto LABEL_25;
    }
    if ((unint64_t)(v16 - v18) < 0x20) {
      goto LABEL_25;
    }
    uint64_t v21 = v22 & 0x3FFFFFFFFFFFFFF8;
    uint64_t v23 = (float32x4_t *)(v18 + 16);
    unint64_t v24 = (float32x4_t *)(v16 + 16);
    uint64_t v25 = v22 & 0x3FFFFFFFFFFFFFF8;
    do
    {
      float32x4_t v26 = vmulq_n_f32(*v23, v20);
      v24[-1] = vmulq_n_f32(v23[-1], v20);
      *unint64_t v24 = v26;
      v23 += 2;
      v24 += 2;
      v25 -= 8;
    }
    while (v25);
    if (v22 != v21)
    {
LABEL_25:
      unint64_t v27 = v22 - v21;
      uint64_t v28 = 4 * v21;
      uint64_t v29 = (float *)(v18 + 4 * v21);
      float v30 = (float *)(v16 + v28);
      do
      {
        float v31 = *v29++;
        *v30++ = v31 * v20;
        --v27;
      }
      while (v27);
    }
  }
  uint64_t v35 = [IHKFeatureVector alloc];
  int v45 = &unk_2702DD568;
  int v46 = v58;
  float32x4_t v48 = 0;
  v49 = 0;
  uint64_t v47 = 0;
  uint64_t v36 = v59;
  int64_t v37 = v60 - v59;
  if (v60 != v59)
  {
    if (v37 < 0) {
      sub_2529C1558();
    }
    uint64_t v47 = operator new(v60 - v59);
    v49 = (char *)v47 + 8 * (v37 >> 3);
    memcpy(v47, v36, v37);
    float32x4_t v48 = v49;
  }
  uint64_t v50 = v61;
  v51 = v62;
  if (v62) {
    atomic_fetch_add_explicit(&v62->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v45 = &unk_2702DD520;
  uint64_t v38 = objc_msgSend_initWithTensor_(v35, v32, (uint64_t)&v45, v33, v34, v44);
  int v45 = &unk_2702DD568;
  int64_t v39 = v51;
  if (v51 && !atomic_fetch_add(&v51->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
    std::__shared_weak_count::__release_weak(v39);
  }
  if (v47)
  {
    float32x4_t v48 = v47;
    operator delete(v47);
  }
  uint64_t v57 = &unk_2702DD568;
  int v40 = v62;
  if (v62 && !atomic_fetch_add(&v62->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
    std::__shared_weak_count::__release_weak(v40);
  }
  if (v59)
  {
    uint64_t v60 = v59;
    operator delete(v59);
  }

  return v38;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend_tensor(self, v5, v6, v7, v8);
  int v46 = 0;
  uint64_t v47 = 0;
  int64_t v11 = v43 - __p;
  if (v43 != __p)
  {
    if (v11 < 0) {
      sub_2529C1558();
    }
    uint64_t v12 = (char *)operator new(v43 - __p);
    uint64_t v13 = &v12[8 * (v11 >> 3)];
    int v46 = v12;
    memcpy(v12, __p, v11);
    uint64_t v47 = v13;
  }
  if (v45 && !atomic_fetch_add(&v45->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v45->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v45);
  }
  if (__p) {
    operator delete(__p);
  }
  objc_msgSend_encodeInt_forKey_(v4, v9, (unint64_t)(v47 - v46) >> 3, @"kTensorNDims", v10);
  objc_msgSend_encodeBytes_length_forKey_(v4, v14, (uint64_t)v46, v47 - v46, @"kTensorDimensions");
  objc_msgSend_tensor(self, v15, v16, v17, v18);
  uint64_t v19 = (*(uint64_t (**)())(*(void *)v44 + 24))();
  objc_msgSend_tensor(self, v20, v21, v22, v23);
  if (v39 != (int32x4_t *)v40)
  {
    unint64_t v25 = v40 - (char *)v39 - 8;
    if (v25 >= 0x38)
    {
      uint64_t v28 = (v25 >> 3) + 1;
      unint64_t v27 = &v39->i8[8 * (v28 & 0x3FFFFFFFFFFFFFF8)];
      uint64_t v29 = v39 + 2;
      v30.i64[0] = 0x100000001;
      v30.i64[1] = 0x100000001;
      uint64_t v31 = v28 & 0x3FFFFFFFFFFFFFF8;
      v32.i64[0] = 0x100000001;
      v32.i64[1] = 0x100000001;
      do
      {
        int32x4_t v34 = v29[-2];
        int32x4_t v33 = v29[-1];
        int32x4_t v36 = *v29;
        int32x4_t v35 = v29[1];
        v29 += 4;
        int32x4_t v30 = vmulq_s32(v30, vuzp1q_s32(v34, v33));
        int32x4_t v32 = vmulq_s32(v32, vuzp1q_s32(v36, v35));
        v31 -= 8;
      }
      while (v31);
      int8x16_t v37 = (int8x16_t)vmulq_s32(v32, v30);
      *(int32x2_t *)v37.i8 = vmul_s32(*(int32x2_t *)v37.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v37, v37, 8uLL));
      int v26 = v37.i32[0] * v37.i32[1];
      if (v28 == (v28 & 0x3FFFFFFFFFFFFFF8)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v26 = 1;
      unint64_t v27 = (char *)v39;
    }
    do
    {
      int v38 = *(_DWORD *)v27;
      v27 += 8;
      v26 *= v38;
    }
    while (v27 != v40);
LABEL_17:
    objc_msgSend_encodeBytes_length_forKey_(v4, v24, v19, 4 * v26, @"kTensorValues");
    goto LABEL_18;
  }
  objc_msgSend_encodeBytes_length_forKey_(v4, v24, v19, 0, @"kTensorValues");
LABEL_18:
  if (v41 && !atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v41->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v41);
  }
  if (v39) {
    operator delete(v39);
  }
  if (v45 && !atomic_fetch_add(&v45->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v45->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v45);
  }
  if (__p) {
    operator delete(__p);
  }
  if (v46) {
    operator delete(v46);
  }
}

- (IHKFeatureVector)initWithCoder:(id)a3
{
  id v4 = a3;
  int v8 = objc_msgSend_decodeIntForKey_(v4, v5, @"kTensorNDims", v6, v7);
  uint64_t v61 = 0;
  int v62 = 0;
  long long v63 = 0;
  if (!v8)
  {
    uint64_t v22 = 0;
    goto LABEL_33;
  }
  if (v8 < 0) {
    sub_2529C1558();
  }
  uint64_t v9 = v8;
  size_t v10 = 8 * v8;
  int64_t v11 = (int32x4_t *)operator new(v10);
  uint64_t v61 = v11;
  long long v63 = &v11->i8[8 * v9];
  bzero(v11, v10);
  int v62 = &v11->i8[v10];
  size_t v60 = 0;
  id v12 = v4;
  uint64_t v15 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(v12, v13, @"kTensorDimensions", (uint64_t)&v60, v14);
  if (v60 != v10) {
    goto LABEL_31;
  }
  memcpy(v11, v15, v10);
  size_t v60 = 0;
  id v16 = v12;
  uint64_t v19 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(v16, v17, @"kTensorValues", (uint64_t)&v60, v18);
  if (v10 - 8 < 0x38)
  {
    int v20 = 1;
    uint64_t v21 = v11;
    do
    {
LABEL_10:
      int v33 = v21->i32[0];
      uint64_t v21 = (int32x4_t *)((char *)v21 + 8);
      v20 *= v33;
    }
    while (v21 != (int32x4_t *)&v11->i8[v10]);
    goto LABEL_11;
  }
  unint64_t v23 = ((v10 - 8) >> 3) + 1;
  uint64_t v21 = (int32x4_t *)((char *)v11 + 8 * (v23 & 0x3FFFFFFFFFFFFFF8));
  unint64_t v24 = v11 + 2;
  v25.i64[0] = 0x100000001;
  v25.i64[1] = 0x100000001;
  uint64_t v26 = v23 & 0x3FFFFFFFFFFFFFF8;
  v27.i64[0] = 0x100000001;
  v27.i64[1] = 0x100000001;
  do
  {
    int32x4_t v29 = v24[-2];
    int32x4_t v28 = v24[-1];
    int32x4_t v31 = *v24;
    int32x4_t v30 = v24[1];
    v24 += 4;
    int32x4_t v25 = vmulq_s32(v25, vuzp1q_s32(v29, v28));
    int32x4_t v27 = vmulq_s32(v27, vuzp1q_s32(v31, v30));
    v26 -= 8;
  }
  while (v26);
  int8x16_t v32 = (int8x16_t)vmulq_s32(v27, v25);
  *(int32x2_t *)v32.i8 = vmul_s32(*(int32x2_t *)v32.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v32, v32, 8uLL));
  int v20 = v32.i32[0] * v32.i32[1];
  if (v23 != (v23 & 0x3FFFFFFFFFFFFFF8)) {
    goto LABEL_10;
  }
LABEL_11:
  if (v60 != 4 * v20)
  {
LABEL_31:
    uint64_t v22 = 0;
LABEL_32:
    operator delete(v11);
    goto LABEL_33;
  }
  int v53 = 4;
  long long __p = operator new(v10);
  long long v52 = (char *)__p + 8 * v9;
  memcpy(__p, v11, v10);
  v51 = (char *)__p + 8 * v9;
  sub_2529C0C94((uint64_t)&v54, &v53, (uint64_t)&__p);
  if (__p)
  {
    v51 = (char *)__p;
    operator delete(__p);
  }
  int32x4_t v34 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v58 + 24))(v58);
  memcpy(v34, v19, v60);
  long long v43 = &unk_2702DD568;
  int v44 = v55;
  int v46 = 0;
  uint64_t v47 = 0;
  int v45 = 0;
  int v38 = v56;
  int64_t v39 = v57 - (unsigned char *)v56;
  if (v57 != v56)
  {
    if (v39 < 0) {
      sub_2529C1558();
    }
    int v45 = operator new(v57 - (unsigned char *)v56);
    uint64_t v47 = (char *)v45 + 8 * (v39 >> 3);
    memcpy(v45, v38, v39);
    int v46 = v47;
  }
  uint64_t v48 = v58;
  v49 = v59;
  if (v59) {
    atomic_fetch_add_explicit(&v59->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  long long v43 = &unk_2702DD520;
  uint64_t v22 = (IHKFeatureVector *)(id)objc_msgSend_initWithTensor_(self, v35, (uint64_t)&v43, v36, v37);
  long long v43 = &unk_2702DD568;
  int v40 = v49;
  if (v49 && !atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
    std::__shared_weak_count::__release_weak(v40);
  }
  if (v45)
  {
    int v46 = v45;
    operator delete(v45);
  }
  long long v54 = &unk_2702DD568;
  long long v41 = v59;
  if (v59 && !atomic_fetch_add(&v59->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
    std::__shared_weak_count::__release_weak(v41);
  }
  if (v56)
  {
    uint64_t v57 = v56;
    operator delete(v56);
  }
  int64_t v11 = v61;
  self = v22;
  if (v61) {
    goto LABEL_32;
  }
LABEL_33:

  return v22;
}

- (EspressoTensor)tensor
{
  objc_copyCppObjectAtomic(retstr, &self->_tensor, (void (__cdecl *)(void *, const void *))sub_2529C0708);
  return result;
}

- (void)setTensor:(EspressoTensor *)a3
{
}

- (void).cxx_destruct
{
  self->_tensor._vptr$Tensor = (void **)&unk_2702DD568;
  cntrl = self->_tensor.storage_.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    begin = self->_tensor.shape_.sizes_.__begin_;
    if (!begin) {
      return;
    }
  }
  else
  {
    begin = self->_tensor.shape_.sizes_.__begin_;
    if (!begin) {
      return;
    }
  }
  self->_tensor.shape_.sizes_.__end_ = begin;

  operator delete(begin);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 4;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((void *)self + 7) = 0;
  *((void *)self + 1) = &unk_2702DD520;
  return self;
}

@end