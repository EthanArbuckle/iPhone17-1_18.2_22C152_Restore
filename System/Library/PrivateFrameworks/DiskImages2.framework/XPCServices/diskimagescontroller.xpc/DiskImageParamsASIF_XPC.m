@interface DiskImageParamsASIF_XPC
+ (BOOL)supportsSecureCoding;
- (BOOL)isSparseFormat;
- (BOOL)isWritableFormat;
- (DiskImageParamsASIF_XPC)initWithBackendXPC:(id)a3 header:()unique_ptr<di_asif:(std::default_delete<di_asif::header>>)a4 :header;
- (DiskImageParamsASIF_XPC)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)instanceID;
- (int)setSizeWithDiskImage:(const void *)a3 newSize:(unint64_t)a4;
- (unint64_t)numBlocks;
- (unique_ptr<DiskImage,)createSinkDiskImage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DiskImageParamsASIF_XPC

- (DiskImageParamsASIF_XPC)initWithBackendXPC:(id)a3 header:()unique_ptr<di_asif:(std::default_delete<di_asif::header>>)a4 :header
{
  v10.receiver = self;
  v10.super_class = (Class)DiskImageParamsASIF_XPC;
  v5 = [(DiskImageParamsXPC *)&v10 initWithBackendXPC:a3];
  v6 = v5;
  if (v5)
  {
    v7 = *(header **)a4.__ptr_.__value_;
    *(void *)a4.__ptr_.__value_ = 0;
    value = v5->_header.__ptr_.__value_;
    v6->_header.__ptr_.__value_ = v7;
    if (value) {
      operator delete();
    }
  }
  return v6;
}

- (BOOL)isSparseFormat
{
  return 1;
}

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  v3 = [(DiskImageParamsXPC *)self backendXPC];
  v4 = v3;
  if (v3)
  {
    [v3 backend];
  }
  else
  {
    lpsrc[0] = 0;
    lpsrc[1] = 0;
  }

  v5 = (std::__shared_weak_count *)lpsrc[1];
  if (lpsrc[1]) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)lpsrc[1] + 1, 1uLL, memory_order_relaxed);
  }
  while (1)
  {
    v6 = lpsrc[0];
    if (!lpsrc[0]) {
      break;
    }
    v8 = (std::__shared_weak_count *)lpsrc[1];
    if (v7)
    {
      v12 = v7;
      if (lpsrc[1]) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)lpsrc[1] + 1, 1uLL, memory_order_relaxed);
      }
      *(void *)&long long v26 = 0x200000001;
      sub_1000AAD70((uint64_t)"header_ignore_fields_t", 2, (int *)&v26, 2);
      v12[48] = 2;
      if (v8) {
        sub_100004944(v8);
      }
LABEL_25:
      if (self->_header.__ptr_.__value_)
      {
        v13 = [(DiskImageParamsXPC *)self backendXPC];
        v14 = v13;
        if (v13)
        {
          [v13 backend];
        }
        else
        {
          uint64_t v23 = 0;
          v24 = 0;
        }
        sub_1001493EC((uint64_t)&v23, &v27);
        sub_100059160(&v27, (void **)&v26);
        if (v28) {
          sub_100004944(v28);
        }
        if (v24) {
          sub_100004944(v24);
        }

        uint64_t v16 = v26;
        if ((void)v26)
        {
          sub_1001275D4(*(void *)(v26 + 40));
          atomic_store(*(void *)(*(void *)(v16 + 40) + 16), (unint64_t *)(*(void *)(v16 + 40) + 64));
        }
        if (*((void *)&v26 + 1)) {
          sub_100004944(*((std::__shared_weak_count **)&v26 + 1));
        }
        v17 = [(DiskImageParamsXPC *)self backendXPC];
        v18 = v17;
        if (v17)
        {
          [v17 backend];
          uint64_t v19 = v26;
        }
        else
        {
          uint64_t v19 = 0;
          long long v26 = 0uLL;
        }
        uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)v19 + 40))(v19);
        if (*((void *)&v26 + 1)) {
          sub_100004944(*((std::__shared_weak_count **)&v26 + 1));
        }

        if (v20)
        {
          v21 = [(DiskImageParamsXPC *)self backendXPC];
          if (v21) {
            [v21 backend];
          }
          else {
            long long v26 = 0uLL;
          }
          operator new();
        }
        v22 = [(DiskImageParamsXPC *)self backendXPC];
        if (v22) {
          [v22 backend];
        }
        else {
          long long v26 = 0uLL;
        }
        operator new();
      }
      [(DiskImageParamsXPC *)self blockSize];
      [(DiskImageParamsXPC *)self blockSize];
      v15 = [(DiskImageParamsXPC *)self backendXPC];
      if (v15)
      {
        [v15 backend];
      }
      else
      {
        uint64_t v23 = 0;
        v24 = 0;
      }
      operator new();
    }
    if (lpsrc[1]) {
      goto LABEL_9;
    }
LABEL_10:
    if (v5) {
      sub_100004944(v5);
    }
    sub_1001498F0((uint64_t)lpsrc, &v26);
    long long v9 = v26;
    long long v26 = 0uLL;
    objc_super v10 = (std::__shared_weak_count *)lpsrc[1];
    *(_OWORD *)lpsrc = v9;
    if (v10)
    {
      sub_100004944(v10);
      v11 = lpsrc[0];
      if (*((void *)&v26 + 1)) {
        sub_100004944(*((std::__shared_weak_count **)&v26 + 1));
      }
      v5 = v8;
      if (v11 == v6) {
        goto LABEL_25;
      }
    }
    else
    {
      v5 = v8;
      if ((void *)v9 == v6) {
        goto LABEL_25;
      }
    }
  }
  v8 = (std::__shared_weak_count *)lpsrc[1];
  if (!lpsrc[1]) {
    goto LABEL_10;
  }
LABEL_9:
  atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  goto LABEL_10;
}

- (int)setSizeWithDiskImage:(const void *)a3 newSize:(unint64_t)a4
{
  v9[0].receiver = self;
  v9[0].super_class = (Class)DiskImageParamsASIF_XPC;
  int v5 = [(objc_super *)v9 setSizeWithDiskImage:a3 newSize:a4];
  if (!v5)
  {
    v6 = *(objc_super **)a3;
    objc_super v7 = *(objc_super *)(*(void *)a3 + 64);
    v9[1] = *(objc_super *)(*(void *)a3 + 48);
    v9[2] = v7;
    *(objc_super *)objc_super v10 = v6[5];
    *(void *)&v10[14] = *(Class *)((char *)&v6[5].super_class + 6);
    operator new();
  }
  return v5;
}

- (unint64_t)numBlocks
{
  return *((void *)self->_header.__ptr_.__value_ + 6);
}

- (BOOL)isWritableFormat
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DiskImageParamsASIF_XPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DiskImageParamsASIF_XPC;
  int v5 = [(DiskImageParamsXPC *)&v10 initWithCoder:v4];
  if (v5 && [v4 containsValueForKey:@"sparseHeader"])
  {
    uint64_t v9 = 0;
    if ([v4 decodeBytesForKey:@"sparseHeader" returnedLength:&v9])
    {
      if (v9 == 80) {
        operator new();
      }
    }
    exception = __cxa_allocate_exception(0x40uLL);
    sub_100003404((uint64_t)v8);
    sub_1000039A0(v8, (uint64_t)"Unexpected ASIF header length (", 31);
    std::ostream::operator<<();
    sub_1000039A0(v8, (uint64_t)")", 1);
    sub_10000550C((uint64_t)exception, (uint64_t)v8, 0x9Au);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DiskImageParamsASIF_XPC;
  [(DiskImageParamsXPC *)&v6 encodeWithCoder:v4];
  value = self->_header.__ptr_.__value_;
  if (value) {
    [v4 encodeBytes:value length:80 forKey:@"sparseHeader"];
  }
}

- (id)instanceID
{
  if (self->_header.__ptr_.__value_)
  {
    bzero(v11, 0x210uLL);
    v8.receiver = self;
    v8.super_class = (Class)DiskImageParamsASIF_XPC;
    v3 = [(DiskImageParamsXPC *)&v8 instanceID];
    [v3 getUUIDBytes:v11];
    id v4 = objc_alloc((Class)NSUUID);
    v10[0] = sub_10014B6F0(v11, 528);
    v10[1] = v5;
    id v6 = [v4 initWithUUIDBytes:v10];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)DiskImageParamsASIF_XPC;
    id v6 = [(DiskImageParamsXPC *)&v9 instanceID];
  }
  return v6;
}

- (void).cxx_destruct
{
  value = self->_header.__ptr_.__value_;
  self->_header.__ptr_.__value_ = 0;
  if (value) {
    operator delete();
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  return self;
}

@end