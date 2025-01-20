@interface DiskImageParamsUDIF_XPC
+ (BOOL)supportsSecureCoding;
- (BOOL)isWritableFormat;
- (DiskImageParamsUDIF_XPC)initWithBackendXPC:(id)a3 header:()unique_ptr<udif:(std::default_delete<udif::header>>)a4 :header;
- (DiskImageParamsUDIF_XPC)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)instanceID;
- (unint64_t)blockSize;
- (unint64_t)numBlocks;
- (unique_ptr<DiskImage,)createSinkDiskImage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DiskImageParamsUDIF_XPC

- (DiskImageParamsUDIF_XPC)initWithBackendXPC:(id)a3 header:()unique_ptr<udif:(std::default_delete<udif::header>>)a4 :header
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DiskImageParamsUDIF_XPC;
  v7 = [(DiskImageParamsXPC *)&v13 initWithBackendXPC:v6];
  v8 = v7;
  if (v7)
  {
    v9 = *(header **)a4.__ptr_.__value_;
    *(void *)a4.__ptr_.__value_ = 0;
    value = v7->_header.__ptr_.__value_;
    v8->_header.__ptr_.__value_ = v9;
    if (value)
    {
      MEMORY[0x223C249A0](value, 0x1000C407784F2AFLL);
      v9 = v8->_header.__ptr_.__value_;
    }
    if (!*(void *)((char *)v9 + 492))
    {
      [(DiskImageParamsUDIF_XPC *)v8 createSinkDiskImage];
      *(void *)((char *)v8->_header.__ptr_.__value_ + 492) = (*(uint64_t (**)())(*(void *)v12 + 32))();
      if (v12) {
        (*(void (**)())(*(void *)v12 + 16))();
      }
    }
  }

  return v8;
}

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  v3 = [(DiskImageParamsXPC *)self backendXPC];
  v4 = v3;
  if (v3) {
    [v3 backend];
  }
  else {
    long long v11 = 0uLL;
  }

  if ((*(unsigned int (**)(void))(*(void *)v11 + 48))(v11))
  {
    v5 = [(DiskImageParamsXPC *)self backendXPC];
    int v6 = [v5 isUnlocked];

    if (v6)
    {
      unint64_t v10 = [(DiskImageParamsUDIF_XPC *)self blockSize];
      std::allocate_shared[abi:ne180100]<BufferedWriteBackend,std::allocator<BufferedWriteBackend>,std::shared_ptr<Backend> &,unsigned long,void>((uint64_t)&v11, &v10, &v9);
      long long v7 = v9;
      long long v9 = 0uLL;
      v8 = (std::__shared_weak_count *)*((void *)&v11 + 1);
      long long v11 = v7;
      if (v8)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v8);
        if (*((void *)&v9 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v9 + 1));
        }
      }
    }
  }
  operator new();
}

- (unint64_t)numBlocks
{
  return *(void *)((char *)self->_header.__ptr_.__value_ + 492);
}

- (unint64_t)blockSize
{
  return 512;
}

- (BOOL)isWritableFormat
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DiskImageParamsUDIF_XPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DiskImageParamsUDIF_XPC;
  if ([(DiskImageParamsXPC *)&v9 initWithCoder:v4])
  {
    uint64_t v8 = 0;
    if ([v4 decodeBytesForKey:@"udifHeader" returnedLength:&v8])
    {
      if (v8 == 500) {
        operator new();
      }
    }
    exception = __cxa_allocate_exception(0x40uLL);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v7);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)"Unexpected UDIF header length (", 31);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)")", 1);
    DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)v7, 0x9Au);
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DiskImageParamsUDIF_XPC;
  [(DiskImageParamsXPC *)&v5 encodeWithCoder:v4];
  [v4 encodeBytes:self->_header.__ptr_.__value_ length:500 forKey:@"udifHeader"];
}

- (id)instanceID
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  bzero(v10, 0x210uLL);
  v8.receiver = self;
  v8.super_class = (Class)DiskImageParamsUDIF_XPC;
  v3 = [(DiskImageParamsXPC *)&v8 instanceID];
  [v3 getUUIDBytes:v10];
  udif::header::write((udif::header *)self->_header.__ptr_.__value_, v11);
  id v4 = objc_alloc(MEMORY[0x263F08C38]);
  v9[0] = di_utils::buffer_to_uuid((di_utils *)v10, 528);
  v9[1] = v5;
  int v6 = (void *)[v4 initWithUUIDBytes:v9];

  return v6;
}

- (void).cxx_destruct
{
  value = self->_header.__ptr_.__value_;
  self->_header.__ptr_.__value_ = 0;
  if (value) {
    JUMPOUT(0x223C249A0);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  return self;
}

- (uint64_t)initWithBackendXPC:(uint64_t)a1 header:.cold.1(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
}

@end