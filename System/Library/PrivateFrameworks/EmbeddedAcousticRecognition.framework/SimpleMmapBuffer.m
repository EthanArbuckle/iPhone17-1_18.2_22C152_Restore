@interface SimpleMmapBuffer
- (SimpleMmapBuffer)initWithData:(const void *)a3 ofSize:(unint64_t)a4;
- (unint64_t)size;
- (void)dataPointer;
- (void)dealloc;
- (void)setDataPointer:(void *)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation SimpleMmapBuffer

- (SimpleMmapBuffer)initWithData:(const void *)a3 ofSize:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v6 = [(SimpleMmapBuffer *)self init];
  if (!v6)
  {
LABEL_20:
    v16 = v6;
    goto LABEL_24;
  }
  v7 = NSTemporaryDirectory();
  v8 = [MEMORY[0x1E4F29128] UUID];
  v9 = [v8 UUIDString];
  id v10 = [v7 stringByAppendingPathComponent:v9];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v10 UTF8String]);

  std::ofstream::basic_ofstream(&v21);
  if (a3)
  {
    std::ostream::write();
  }
  else
  {
    MEMORY[0x1B3EA7E70](v20, &v21);
    v11 = &v22[*(void *)(v21 - 24) - 8];
    if ((v11[32] & 5) == 0)
    {
      uint64_t v12 = *((void *)v11 + 5);
      memset(v25, 0, sizeof(v25));
      unint64_t v26 = a4;
      (*(void (**)(void *__return_ptr))(*(void *)v12 + 40))(v24);
      if (v24[16] == -1) {
        std::ios_base::clear((std::ios_base *)&v22[*(void *)(v21 - 24) - 8], *(_DWORD *)&v22[*(void *)(v21 - 24) + 24] | 4);
      }
    }
    MEMORY[0x1B3EA7E80](v20);
    v25[0] = 0;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v21, (uint64_t)v25, 1);
  }
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)&v22[*(void *)(v21 - 24) - 8], *(_DWORD *)&v22[*(void *)(v21 - 24) + 24] | 4);
  }
  if (v19 >= 0) {
    v13 = __p;
  }
  else {
    v13 = (void **)__p[0];
  }
  int v14 = open((const char *)v13, 514, 384);
  if ((v14 & 0x80000000) == 0)
  {
    [(SimpleMmapBuffer *)v6 setDataPointer:mmap(0, a4, 3, 1, v14, 0)];
    close(v14);
    v15 = v19 >= 0 ? (const char *)__p : (const char *)__p[0];
    unlink(v15);
    if ([(SimpleMmapBuffer *)v6 dataPointer] != (void *)-1)
    {
      [(SimpleMmapBuffer *)v6 setSize:a4];
      uint64_t v21 = *MEMORY[0x1E4FBA400];
      *(void *)&v22[*(void *)(v21 - 24) - 8] = *(void *)(MEMORY[0x1E4FBA400] + 24);
      MEMORY[0x1B3EA7CF0](v22);
      std::ostream::~ostream();
      MEMORY[0x1B3EA8520](v23);
      if (v19 < 0) {
        operator delete(__p[0]);
      }
      goto LABEL_20;
    }
  }
  uint64_t v21 = *MEMORY[0x1E4FBA400];
  *(void *)&v22[*(void *)(v21 - 24) - 8] = *(void *)(MEMORY[0x1E4FBA400] + 24);
  MEMORY[0x1B3EA7CF0](v22);
  std::ostream::~ostream();
  MEMORY[0x1B3EA8520](v23);
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  v16 = 0;
LABEL_24:

  return v16;
}

- (void)dealloc
{
  if ([(SimpleMmapBuffer *)self dataPointer]
    && [(SimpleMmapBuffer *)self dataPointer] != (void *)-1)
  {
    munmap([(SimpleMmapBuffer *)self dataPointer], [(SimpleMmapBuffer *)self size]);
  }
  v3.receiver = self;
  v3.super_class = (Class)SimpleMmapBuffer;
  [(SimpleMmapBuffer *)&v3 dealloc];
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void)dataPointer
{
  return self->_dataPointer;
}

- (void)setDataPointer:(void *)a3
{
  self->_dataPointer = a3;
}

@end