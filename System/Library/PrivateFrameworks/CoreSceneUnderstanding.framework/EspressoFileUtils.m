@interface EspressoFileUtils
+ (EspressoTensor)createEspressoTensorFromTextFile:(SEL)a3 channels:(id)a4 height:(unint64_t)a5 width:(unint64_t)a6;
+ (void)writeEspressoBufferToBinFile:(id)a3 FromBuffer:(id)a4;
+ (void)writeEspressoBufferToTextFile:(id)a3 FromBuffer:(id)a4;
+ (void)writeIKFloatTensorBuffer:(const void *)a3 ToBinFile:(id)a4;
@end

@implementation EspressoFileUtils

+ (void)writeEspressoBufferToTextFile:(id)a3 FromBuffer:(id)a4
{
  v41[19] = *MEMORY[0x263EF8340];
  id v36 = a3;
  id v5 = a4;
  if (!v5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer instance is nil.");
    goto LABEL_39;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer is not an instance of CSUEspressoBuffer.");
LABEL_39:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  v10 = objc_msgSend_espressoBuffer(v5, v6, v7, v8, v9);

  uint64_t v11 = MEMORY[0x263F8C310] + 64;
  v41[0] = MEMORY[0x263F8C310] + 64;
  uint64_t v12 = *(void *)(MEMORY[0x263F8C2B0] + 16);
  uint64_t v39 = *(void *)(MEMORY[0x263F8C2B0] + 8);
  *(void *)&v40[*(void *)(v39 - 24) - 8] = v12;
  v13 = (std::ios_base *)&v40[*(void *)(v39 - 24) - 8];
  std::ios_base::init(v13, v40);
  uint64_t v14 = MEMORY[0x263F8C310] + 24;
  v13[1].__vftable = 0;
  v13[1].__fmtflags_ = -1;
  uint64_t v39 = v14;
  v41[0] = v11;
  MEMORY[0x2532F85F0](v40);
  id v35 = v36;
  v19 = (const char *)objc_msgSend_UTF8String(v35, v15, v16, v17, v18);
  size_t v20 = strlen(v19);
  if (v20 >= 0x7FFFFFFFFFFFFFF8) {
    sub_24C6673C8();
  }
  v21 = (void *)v20;
  if (v20 >= 0x17)
  {
    uint64_t v23 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v20 | 7) != 0x17) {
      uint64_t v23 = v20 | 7;
    }
    uint64_t v24 = v23 + 1;
    v22 = (void **)operator new(v23 + 1);
    __dst[1] = v21;
    unint64_t v38 = v24 | 0x8000000000000000;
    __dst[0] = v22;
  }
  else
  {
    HIBYTE(v38) = v20;
    v22 = __dst;
    if (!v20) {
      goto LABEL_11;
    }
  }
  memmove(v22, v19, (size_t)v21);
LABEL_11:
  *((unsigned char *)v21 + (void)v22) = 0;
  std::ofstream::open();
  unint64_t v25 = v10[12];
  if (v25)
  {
    unint64_t v26 = v10[11];
    if (v26)
    {
      uint64_t v27 = 0;
      unint64_t v28 = v10[11];
      while (!v28 || !v10[10])
      {
LABEL_15:
        if (++v27 >= v25) {
          goto LABEL_32;
        }
      }
      uint64_t v29 = 0;
      unint64_t v30 = 1;
      while (1)
      {
        unint64_t v31 = v29 + 1;
        if (v30) {
          break;
        }
LABEL_20:
        ++v29;
        if (v31 >= v26)
        {
          unint64_t v25 = v10[12];
          unint64_t v28 = v26;
          goto LABEL_15;
        }
      }
      unint64_t v32 = 0;
      while (1)
      {
        while (1)
        {
          std::ostream::operator<<();
          unint64_t v33 = v10[12];
          if (v33 >= 2) {
            break;
          }
          if (v33 == 1 && !((v32 + 1) % v10[10])) {
            goto LABEL_23;
          }
LABEL_30:
          sub_24C689D44(&v39, (uint64_t)" ", 1);
          ++v32;
          unint64_t v30 = v10[10];
          if (v32 >= v30)
          {
LABEL_19:
            unint64_t v26 = v10[11];
            goto LABEL_20;
          }
        }
        if (v31 % v10[11] || (v32 + 1) % v10[10]) {
          goto LABEL_30;
        }
LABEL_23:
        sub_24C689D44(&v39, (uint64_t)"\n", 1);
        ++v32;
        unint64_t v30 = v10[10];
        if (v32 >= v30) {
          goto LABEL_19;
        }
      }
    }
  }
LABEL_32:
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)&v40[*(void *)(v39 - 24) - 8], *(_DWORD *)&v40[*(void *)(v39 - 24) + 24] | 4);
  }
  if (SHIBYTE(v38) < 0) {
    operator delete(__dst[0]);
  }
  uint64_t v39 = *MEMORY[0x263F8C2B0];
  *(void *)&v40[*(void *)(v39 - 24) - 8] = *(void *)(MEMORY[0x263F8C2B0] + 24);
  MEMORY[0x2532F8600](v40);
  std::ostream::~ostream();
  MEMORY[0x2532F88A0](v41);
}

+ (EspressoTensor)createEspressoTensorFromTextFile:(SEL)a3 channels:(id)a4 height:(unint64_t)a5 width:(unint64_t)a6
{
  v42[19] = *MEMORY[0x263EF8340];
  id v11 = a4;
  sub_24C68A0D8((char **)&__p, 1, a5, a6, a7);
  LODWORD(__dst[0]) = 4;
  sub_24C67D4C0((uint64_t)retstr, (int *)__dst, (uint64_t)&__p);
  if (__p)
  {
    v40 = __p;
    operator delete(__p);
  }
  ptr = retstr->storage_.__ptr_;
  v13 = (_DWORD *)*((void *)ptr + 1);
  uint64_t v14 = *((void *)ptr + 11);
  uint64_t v15 = *((void *)ptr + 12);
  uint64_t v16 = *((void *)ptr + 13);
  uint64_t v17 = MEMORY[0x263F8C308] + 64;
  v42[0] = MEMORY[0x263F8C308] + 64;
  uint64_t v18 = *(void **)(MEMORY[0x263F8C2A8] + 16);
  __p = *(void **)(MEMORY[0x263F8C2A8] + 8);
  *(void **)((char *)&__p + *((void *)__p - 3)) = v18;
  v40 = 0;
  v19 = (std::ios_base *)((char *)&__p + *((void *)__p - 3));
  std::ios_base::init(v19, v41);
  size_t v20 = (void *)(MEMORY[0x263F8C308] + 24);
  v19[1].__vftable = 0;
  v19[1].__fmtflags_ = -1;
  __p = v20;
  v42[0] = v17;
  MEMORY[0x2532F85F0](v41);
  id v35 = v11;
  unint64_t v25 = (const char *)objc_msgSend_UTF8String(v35, v21, v22, v23, v24);
  size_t v26 = strlen(v25);
  if (v26 >= 0x7FFFFFFFFFFFFFF8) {
    sub_24C6673C8();
  }
  uint64_t v27 = (void *)v26;
  if (v26 >= 0x17)
  {
    uint64_t v29 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v26 | 7) != 0x17) {
      uint64_t v29 = v26 | 7;
    }
    uint64_t v30 = v29 + 1;
    unint64_t v28 = (void **)operator new(v29 + 1);
    __dst[1] = v27;
    unint64_t v38 = v30 | 0x8000000000000000;
    __dst[0] = v28;
  }
  else
  {
    HIBYTE(v38) = v26;
    unint64_t v28 = __dst;
    if (!v26) {
      goto LABEL_11;
    }
  }
  memmove(v28, v25, (size_t)v27);
LABEL_11:
  *((unsigned char *)v27 + (void)v28) = 0;
  std::ifstream::open();
  if (v16 && v15 && v14)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        uint64_t v33 = v14;
        do
        {
          int v36 = 0;
          MEMORY[0x2532F8660](&__p, &v36);
          *v13++ = v36;
          --v33;
        }
        while (v33);
      }
    }
  }
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)((char *)&__p + *((void *)__p - 3)), *(_DWORD *)&v41[*((void *)__p - 3) + 16] | 4);
  }
  if (SHIBYTE(v38) < 0) {
    operator delete(__dst[0]);
  }
  __p = (void *)*MEMORY[0x263F8C2A8];
  *(void **)((char *)&__p + *((void *)__p - 3)) = *(void **)(MEMORY[0x263F8C2A8] + 24);
  MEMORY[0x2532F8600](v41);
  std::istream::~istream();
  MEMORY[0x2532F88A0](v42);

  return result;
}

+ (void)writeEspressoBufferToBinFile:(id)a3 FromBuffer:(id)a4
{
  id v5 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_24C689648;
  v10[3] = &unk_2652E7E20;
  id v11 = v5;
  id v6 = v5;
  objc_msgSend_accessDataUsingBlock_(a4, v7, (uint64_t)v10, v8, v9);
}

+ (void)writeIKFloatTensorBuffer:(const void *)a3 ToBinFile:(id)a4
{
  v17[19] = *MEMORY[0x263EF8340];
  id v4 = a4;
  uint64_t v5 = MEMORY[0x263F8C310] + 64;
  v17[0] = MEMORY[0x263F8C310] + 64;
  id v6 = (uint64_t *)MEMORY[0x263F8C2B0];
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B0] + 16);
  uint64_t v15 = *(void *)(MEMORY[0x263F8C2B0] + 8);
  *(void *)&v16[*(void *)(v15 - 24) - 8] = v7;
  uint64_t v8 = (std::ios_base *)&v16[*(void *)(v15 - 24) - 8];
  std::ios_base::init(v8, v16);
  uint64_t v9 = MEMORY[0x263F8C310] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v15 = v9;
  v17[0] = v5;
  MEMORY[0x2532F85F0](v16);
  id v10 = v4;
  objc_msgSend_UTF8String(v10, v11, v12, v13, v14);
  std::ofstream::open();
  std::ostream::write();
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)&v16[*(void *)(v15 - 24) - 8], *(_DWORD *)&v16[*(void *)(v15 - 24) + 24] | 4);
  }
  uint64_t v15 = *v6;
  *(void *)&v16[*(void *)(v15 - 24) - 8] = v6[3];
  MEMORY[0x2532F8600](v16);
  std::ostream::~ostream();
  MEMORY[0x2532F88A0](v17);
}

@end