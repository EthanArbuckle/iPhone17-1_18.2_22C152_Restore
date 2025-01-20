@interface SMTSimpleMmapBuffer
- (SMTSimpleMmapBuffer)initWithData:(const void *)a3 ofSize:(unint64_t)a4;
- (unint64_t)size;
- (void)dataPointer;
- (void)dealloc;
- (void)setDataPointer:(void *)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation SMTSimpleMmapBuffer

- (void)setDataPointer:(void *)a3
{
  self->_dataPointer = a3;
}

- (void)dataPointer
{
  return self->_dataPointer;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)dealloc
{
  if ([(SMTSimpleMmapBuffer *)self dataPointer]
    && [(SMTSimpleMmapBuffer *)self dataPointer] != (id)-1)
  {
    munmap([(SMTSimpleMmapBuffer *)self dataPointer], [(SMTSimpleMmapBuffer *)self size]);
  }
  v3.receiver = self;
  v3.super_class = (Class)SMTSimpleMmapBuffer;
  [(SMTSimpleMmapBuffer *)&v3 dealloc];
}

- (SMTSimpleMmapBuffer)initWithData:(const void *)a3 ofSize:(unint64_t)a4
{
  v6 = [(SMTSimpleMmapBuffer *)self init];
  if (!v6) {
    goto LABEL_57;
  }
  v7 = NSTemporaryDirectory();
  v8 = +[NSUUID UUID];
  v9 = [v8 UUIDString];
  id v10 = [v7 stringByAppendingPathComponent:v9];
  sub_1000070F4(__p, (char *)[v10 UTF8String]);

  *(void *)&v43[(void)*(v42 - 3) - 8] = v11;
  v12 = (std::ios_base *)&v43[(void)*(v42 - 3) - 8];
  std::ios_base::init(v12, v43);
  v12[1].__vftable = 0;
  v12[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf();
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)&v43[(void)*(v42 - 3) - 8], *(_DWORD *)&v43[(void)*(v42 - 3) + 24] | 4);
  }
  if (a3)
  {
    std::ostream::write();
    if ((v43[(void)*(v42 - 3) + 24] & 5) != 0)
    {
      if (v39 >= 0) {
        v13 = __p;
      }
      else {
        v13 = (void **)__p[0];
      }
      unlink((const char *)v13);
      goto LABEL_54;
    }
  }
  else
  {
    std::ostream::sentry::sentry();
    v14 = &v43[(void)*(v42 - 3) - 8];
    if ((v14[32] & 5) == 0)
    {
      uint64_t v15 = *((void *)v14 + 5);
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long __b = 0u;
      long long v47 = 0u;
      unint64_t v54 = a4;
      (*(void (**)(void *__return_ptr))(*(void *)v15 + 40))(v45);
      if (v45[16] == -1) {
        std::ios_base::clear((std::ios_base *)&v43[(void)*(v42 - 3) - 8], *(_DWORD *)&v43[(void)*(v42 - 3) + 24] | 4);
      }
    }
    std::ostream::sentry::~sentry();
    char v40 = 0;
    std::ostream::sentry::sentry();
    if (LOBYTE(v45[0]))
    {
      unint64_t v37 = a4;
      v16 = &v43[(void)*(v42 - 3) - 8];
      uint64_t v17 = *((void *)v16 + 5);
      int v18 = *((_DWORD *)v16 + 2);
      int v19 = *((_DWORD *)v16 + 36);
      if (v19 == -1)
      {
        std::ios_base::getloc((const std::ios_base *)&v43[(void)*(v42 - 3) - 8]);
        v20 = std::locale::use_facet((const std::locale *)&__b, &std::ctype<char>::id);
        int v19 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v20->__vftable[2].~facet_0)(v20, 32);
        std::locale::~locale((std::locale *)&__b);
        *((_DWORD *)v16 + 36) = v19;
      }
      if ((v18 & 0xB0) == 0x20) {
        v21 = v41;
      }
      else {
        v21 = &v40;
      }
      if (!v17) {
        goto LABEL_41;
      }
      uint64_t v22 = *((void *)v16 + 3);
      BOOL v23 = v22 <= 1;
      uint64_t v24 = v22 - 1;
      size_t v25 = v23 ? 0 : v24;
      if (v21 - &v40 >= 1
        && (*(uint64_t (**)(uint64_t, char *, int64_t))(*(void *)v17 + 96))(v17, &v40, v21 - &v40) != v21 - &v40)
      {
        goto LABEL_41;
      }
      if ((uint64_t)v25 >= 1)
      {
        if (v25 >= 0x7FFFFFFFFFFFFFF8) {
          sub_1000071A4();
        }
        if (v25 >= 0x17)
        {
          uint64_t v27 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v25 | 7) != 0x17) {
            uint64_t v27 = v25 | 7;
          }
          uint64_t v36 = v27 + 1;
          p_b = (long long *)operator new(v27 + 1);
          *((void *)&__b + 1) = v25;
          *(void *)&long long v47 = v36 | 0x8000000000000000;
          *(void *)&long long __b = p_b;
        }
        else
        {
          BYTE7(v47) = v25;
          p_b = &__b;
        }
        memset(p_b, v19, v25);
        *((unsigned char *)p_b + v25) = 0;
        if ((SBYTE7(v47) & 0x80u) == 0) {
          v28 = &__b;
        }
        else {
          v28 = (long long *)__b;
        }
        uint64_t v29 = (*(uint64_t (**)(uint64_t, long long *, size_t))(*(void *)v17 + 96))(v17, v28, v25);
        if (SBYTE7(v47) < 0) {
          operator delete((void *)__b);
        }
        if (v29 != v25) {
          goto LABEL_41;
        }
      }
      if (v41 - v21 < 1
        || (*(uint64_t (**)(uint64_t, char *, int64_t))(*(void *)v17 + 96))(v17, v21, v41 - v21) == v41 - v21)
      {
        *((void *)v16 + 3) = 0;
        a4 = v37;
      }
      else
      {
LABEL_41:
        a4 = v37;
        std::ios_base::clear((std::ios_base *)&v43[(void)*(v42 - 3) - 8], *(_DWORD *)&v43[(void)*(v42 - 3) + 24] | 5);
      }
    }
    std::ostream::sentry::~sentry();
  }
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)&v43[(void)*(v42 - 3) - 8], *(_DWORD *)&v43[(void)*(v42 - 3) + 24] | 4);
  }
  if (v39 >= 0) {
    v30 = __p;
  }
  else {
    v30 = (void **)__p[0];
  }
  int v31 = open((const char *)v30, 514, 384);
  if ((v31 & 0x80000000) == 0)
  {
    [(SMTSimpleMmapBuffer *)v6 setDataPointer:mmap(0, a4, 3, 1, v31, 0)];
    close(v31);
    v32 = v39 >= 0 ? (const char *)__p : (const char *)__p[0];
    unlink(v32);
    if ([(SMTSimpleMmapBuffer *)v6 dataPointer] != (id)-1)
    {
      [(SMTSimpleMmapBuffer *)v6 setSize:a4];
      char v33 = 1;
      goto LABEL_55;
    }
  }
LABEL_54:
  char v33 = 0;
LABEL_55:
  std::filebuf::~filebuf();
  std::ostream::~ostream();
  std::ios::~ios();
  if (v39 < 0)
  {
    operator delete(__p[0]);
    if (v33) {
      goto LABEL_57;
    }
LABEL_59:
    v34 = 0;
    goto LABEL_60;
  }
  if ((v33 & 1) == 0) {
    goto LABEL_59;
  }
LABEL_57:
  v34 = v6;
LABEL_60:

  return v34;
}

@end