@interface CSUDataUtilities
+ (EspressoTensor)tensorForInputEmbedding:(SEL)a3;
@end

@implementation CSUDataUtilities

+ (EspressoTensor)tensorForInputEmbedding:(SEL)a3
{
  id v5 = a4;
  unint64_t v10 = objc_msgSend_length(v5, v6, v7, v8, v9);
  id v11 = v5;
  uint64_t v16 = objc_msgSend_bytes(v11, v12, v13, v14, v15);
  v17 = (int64x2_t *)operator new(0x20uLL);
  int64x2_t *v17 = vdupq_n_s64(1uLL);
  v17[1].i64[0] = 1;
  v17[1].i64[1] = v10 >> 2;
  LODWORD(v43[0]) = 4;
  v18 = (char *)operator new(0x20uLL);
  v39 = v18 + 32;
  v40 = v18 + 32;
  int64x2_t v19 = v17[1];
  *(int64x2_t *)v18 = *v17;
  *((int64x2_t *)v18 + 1) = v19;
  __p = v18;
  sub_24C67D4C0((uint64_t)retstr, (int *)v43, (uint64_t)&__p);
  if (__p)
  {
    v39 = (char *)__p;
    operator delete(__p);
  }
  if (retstr->type_ != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v20 = (*(uint64_t (**)(TensorStorage *))(*(void *)retstr->storage_.__ptr_ + 24))(retstr->storage_.__ptr_);
  (*(void (**)(void **__return_ptr))(*(void *)retstr->storage_.__ptr_ + 32))(v43);
  sub_24C67C4BC(&__p, v20, (uint64_t)v43);
  __p = &unk_26FEDD1C0;
  if (v43[0])
  {
    v43[1] = v43[0];
    operator delete(v43[0]);
  }
  if (v10 > 3)
  {
    if (v42 != 4)
    {
      v37 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v37, "Invalid number of indices provided.");
      __cxa_throw(v37, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    uint64_t v22 = 0;
    v23 = v39;
    v21 = v40;
    uint64_t v24 = v40[3];
    if (v10 >> 2 <= 1) {
      unint64_t v25 = 1;
    }
    else {
      unint64_t v25 = v10 >> 2;
    }
    if (v25 < 8) {
      goto LABEL_18;
    }
    if (v24 != 1) {
      goto LABEL_18;
    }
    if ((unint64_t)&v39[-v16] < 0x20) {
      goto LABEL_18;
    }
    uint64_t v22 = v25 & 0x3FFFFFFFFFFFFFF8;
    v26 = v39 + 16;
    v27 = (long long *)(v16 + 16);
    uint64_t v28 = v25 & 0x3FFFFFFFFFFFFFF8;
    do
    {
      long long v29 = *v27;
      *(v26 - 1) = *(v27 - 1);
      _OWORD *v26 = v29;
      v26 += 2;
      v27 += 2;
      v28 -= 8;
    }
    while (v28);
    if (v25 != v22)
    {
LABEL_18:
      v30 = (int *)(v16 + 4 * v22);
      v31 = &v23[4 * v22 * v24];
      uint64_t v32 = 4 * v24;
      unint64_t v33 = v25 - v22;
      do
      {
        int v34 = *v30++;
        *(_DWORD *)v31 = v34;
        v31 += v32;
        --v33;
      }
      while (v33);
    }
  }
  else
  {
    v21 = v40;
  }
  __p = off_26FEDD970;
  if (v21)
  {
    v41 = v21;
    operator delete(v21);
  }
  operator delete(v17);

  return result;
}

@end