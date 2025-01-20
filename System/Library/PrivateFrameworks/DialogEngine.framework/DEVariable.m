@interface DEVariable
- (BOOL)isEmpty;
- (DEVariable)init;
- (DEVariable)initWithSharedPtr:(void *)a3;
- (NSString)name;
- (NSString)type;
- (id).cxx_construct;
- (id)toString:(int)a3;
- (shared_ptr<siri::dialogengine::Variable>)This;
- (void)getSharedPtr;
- (void)setName:(id)a3;
- (void)setThis:(shared_ptr<siri::dialogengine::Variable>)a3;
- (void)setType:(id)a3;
@end

@implementation DEVariable

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_This.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setThis:(shared_ptr<siri::dialogengine::Variable>)a3
{
}

- (shared_ptr<siri::dialogengine::Variable>)This
{
  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__25950);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (id)toString:(int)a3
{
  if (a3 == 1)
  {
    v3 = NSString;
    [(DEVariable *)self This];
    (*(void (**)(std::string *__return_ptr))(*(void *)v7 + 48))(&v9);
    if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v21, v9.__r_.__value_.__l.__data_, v9.__r_.__value_.__l.__size_);
    }
    else {
      std::string v21 = v9;
    }
    if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v5 = &v21;
    }
    else {
      v5 = (std::string *)v21.__r_.__value_.__r.__words[0];
    }
  }
  else
  {
    if (a3)
    {
      v4 = &stru_1F2127290;
      goto LABEL_34;
    }
    v3 = NSString;
    [(DEVariable *)self This];
    (*(void (**)(std::string *__return_ptr))(*(void *)v7 + 48))(&v9);
    if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v21, v10.__r_.__value_.__l.__data_, v10.__r_.__value_.__l.__size_);
    }
    else {
      std::string v21 = v10;
    }
    if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v5 = &v21;
    }
    else {
      v5 = (std::string *)v21.__r_.__value_.__r.__words[0];
    }
  }
  v4 = [v3 stringWithUTF8String:v5];
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v21.__r_.__value_.__l.__data_);
  }
  if (v20 < 0) {
    operator delete(__p);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
LABEL_34:
  return v4;
}

- (BOOL)isEmpty
{
  [(DEVariable *)self This];
  char v2 = (*(uint64_t (**)())(*(void *)v4 + 32))();
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v2;
}

- (void)setType:(id)a3
{
  id v4 = a3;
  [(DEVariable *)self This];
  uint64_t v5 = v8;
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v6 UTF8String]);
  std::string::operator=((std::string *)(v5 + 32), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

- (NSString)type
{
  char v2 = NSString;
  [(DEVariable *)self This];
  if (*(char *)(v6 + 55) < 0) {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)(v6 + 32), *(void *)(v6 + 40));
  }
  else {
    std::string v8 = *(std::string *)(v6 + 32);
  }
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v3 = &v8;
  }
  else {
    v3 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  id v4 = [v2 stringWithUTF8String:v3];
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return (NSString *)v4;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  [(DEVariable *)self This];
  uint64_t v5 = v8;
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v6 UTF8String]);
  std::string::operator=((std::string *)(v5 + 8), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

- (NSString)name
{
  char v2 = NSString;
  [(DEVariable *)self This];
  if (*(char *)(v7 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)(v7 + 8), *(void *)(v7 + 16));
  }
  else
  {
    long long v3 = *(_OWORD *)(v7 + 8);
    v9.__r_.__value_.__r.__words[2] = *(void *)(v7 + 24);
    *(_OWORD *)&v9.__r_.__value_.__l.__data_ = v3;
  }
  if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    id v4 = &v9;
  }
  else {
    id v4 = (std::string *)v9.__r_.__value_.__r.__words[0];
  }
  uint64_t v5 = [v2 stringWithUTF8String:v4];
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  return (NSString *)v5;
}

- (void)getSharedPtr
{
  return &self->_This;
}

- (DEVariable)initWithSharedPtr:(void *)a3
{
  v23.receiver = self;
  v23.super_class = (Class)DEVariable;
  id v4 = [(DEVariable *)&v23 init];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = (std::__shared_weak_count *)*((void *)a3 + 1);
    uint64_t v21 = *(void *)a3;
    v22 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(DEVariable *)v4 setThis:&v21];
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
  }
  uint64_t v7 = [(DEVariable *)v5 type];
  char v8 = [v7 isEqualToString:@"dialog.String"];

  if (v8)
  {
    std::string v9 = off_1E651CF08;
  }
  else
  {
    std::string v10 = [(DEVariable *)v5 type];
    char v11 = [v10 isEqualToString:@"dialog.Boolean"];

    if (v11)
    {
      std::string v9 = off_1E651CEF0;
    }
    else
    {
      char v12 = [(DEVariable *)v5 type];
      char v13 = [v12 isEqualToString:@"dialog.Number"];

      if (v13)
      {
        std::string v9 = off_1E651CEF8;
      }
      else
      {
        char v14 = [(DEVariable *)v5 type];
        char v15 = [v14 isEqualToString:@"dialog.Object"];

        if (v15)
        {
          std::string v9 = off_1E651CF00;
        }
        else
        {
          char v16 = [(DEVariable *)v5 type];
          int v17 = [v16 isEqualToString:@"dialog.Array"];

          if (!v17)
          {
            char v18 = v5;
            goto LABEL_17;
          }
          std::string v9 = off_1E651CEE8;
        }
      }
    }
  }
  char v18 = (DEVariable *)[objc_alloc(*v9) initWithSharedPtr:a3];
LABEL_17:
  v19 = v18;

  return v19;
}

- (DEVariable)init
{
  v7.receiver = self;
  v7.super_class = (Class)DEVariable;
  char v2 = [(DEVariable *)&v7 init];
  if (v2)
  {
    long long v3 = (std::__shared_weak_count *)operator new(0x60uLL);
    v3->__shared_owners_ = 0;
    v3->__shared_weak_owners_ = 0;
    v3->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2123330;
    uint64_t v5 = siri::dialogengine::Variable::Variable((siri::dialogengine::Variable *)&v3[1]);
    id v6 = v3;
    [(DEVariable *)v2 setThis:&v5];
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
  return v2;
}

@end