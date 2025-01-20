@interface DEDialog
- (BOOL)isEqual:(id)a3;
- (BOOL)isSelectable:(id)a3;
- (BOOL)validate:(id)a3;
- (DEDialog)init;
- (DEDialog)initWithSharedPtr:(shared_ptr<siri::dialogengine::Dialog>)a3;
- (DESpeakableString)caption;
- (DESpeakableString)content;
- (NSString)id;
- (id).cxx_construct;
- (id)getExpandedCaption:(id)a3;
- (id)getExpandedContent:(id)a3;
- (shared_ptr<siri::dialogengine::Dialog>)This;
- (void)setCaption:(id)a3;
- (void)setContent:(id)a3;
- (void)setId:(id)a3;
- (void)setThis:(shared_ptr<siri::dialogengine::Dialog>)a3;
@end

@implementation DEDialog

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_This.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setThis:(shared_ptr<siri::dialogengine::Dialog>)a3
{
}

- (shared_ptr<siri::dialogengine::Dialog>)This
{
  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__24748);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  [(DEDialog *)self This];
  [v4 This];
  BOOL v5 = siri::dialogengine::Dialog::operator==(v9, v7);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }

  return v5;
}

- (BOOL)isSelectable:(id)a3
{
  id v4 = a3;
  [(DEDialog *)self This];
  char v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v7 + 48))(v7, [v4 This]);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }

  return v5;
}

- (BOOL)validate:(id)a3
{
  id v4 = a3;
  [(DEDialog *)self This];
  char v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v7 + 32))(v7, [v4 This]);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }

  return v5;
}

- (void)setCaption:(id)a3
{
  id v4 = a3;
  id v5 = [v4 print];
  std::string::basic_string[abi:ne180100]<0>(&v23, (char *)[v5 UTF8String]);

  id v6 = [v4 speak];
  std::string::basic_string[abi:ne180100]<0>(&v22, (char *)[v6 UTF8String]);

  siri::dialogengine::SpeakableString::SpeakableString((uint64_t)&v9, &v23, &v22);
  [(DEDialog *)self This];
  siri::dialogengine::Dialog::SetSupporting(v7, &v9);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (v21 < 0) {
    operator delete(__p);
  }
  if (v19 < 0) {
    operator delete(v18);
  }
  if (v17 < 0) {
    operator delete(v16);
  }
  if (v15 < 0) {
    operator delete(v14);
  }
  if (v13 < 0) {
    operator delete(v12);
  }
  if (v11 < 0) {
    operator delete(v10);
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v23.__r_.__value_.__l.__data_);
  }
}

- (id)getExpandedCaption:(id)a3
{
  id v4 = a3;
  [(DEDialog *)self This];
  siri::dialogengine::Dialog::GetExpandedSupporting((siri::dialogengine::Dialog *)v15.__r_.__value_.__l.__data_, (siri::dialogengine::Context *)[v4 This], (uint64_t)&v16);
  if (v15.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v15.__r_.__value_.__l.__size_);
  }
  id v5 = [DESpeakableString alloc];
  id v6 = NSString;
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v15, v16.__r_.__value_.__l.__data_, v16.__r_.__value_.__l.__size_);
  }
  else {
    std::string v15 = v16;
  }
  if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v7 = &v15;
  }
  else {
    uint64_t v7 = (std::string *)v15.__r_.__value_.__r.__words[0];
  }
  v8 = [v6 stringWithUTF8String:v7];
  std::string v9 = NSString;
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v17.__r_.__value_.__l.__data_, v17.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v17;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  char v11 = objc_msgSend(v9, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  v12 = [(DESpeakableString *)v5 initWithPrint:v8 speak:v11];

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  if (v27 < 0) {
    operator delete(v26);
  }
  if (v25 < 0) {
    operator delete(v24);
  }
  if (v23 < 0) {
    operator delete(v22);
  }
  if (v21 < 0) {
    operator delete(v20);
  }
  if (v19 < 0) {
    operator delete(v18);
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }

  return v12;
}

- (DESpeakableString)caption
{
  [(DEDialog *)self This];
  siri::dialogengine::SpeakableString::SpeakableString(&v13, (const siri::dialogengine::SpeakableString *)(v12.__r_.__value_.__r.__words[0] + 376));
  if (v12.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12.__r_.__value_.__l.__size_);
  }
  v2 = [DESpeakableString alloc];
  v3 = NSString;
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v12, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
  }
  else {
    std::string v12 = v13;
  }
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    id v4 = &v12;
  }
  else {
    id v4 = (std::string *)v12.__r_.__value_.__r.__words[0];
  }
  id v5 = [v3 stringWithUTF8String:v4];
  id v6 = NSString;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v14.__r_.__value_.__l.__data_, v14.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v14;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  v8 = objc_msgSend(v6, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  std::string v9 = [(DESpeakableString *)v2 initWithPrint:v5 speak:v8];

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  if (v24 < 0) {
    operator delete(v23);
  }
  if (v22 < 0) {
    operator delete(v21);
  }
  if (v20 < 0) {
    operator delete(v19);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  return v9;
}

- (void)setContent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 print];
  std::string::basic_string[abi:ne180100]<0>(&v23, (char *)[v5 UTF8String]);

  id v6 = [v4 speak];
  std::string::basic_string[abi:ne180100]<0>(&v22, (char *)[v6 UTF8String]);

  siri::dialogengine::SpeakableString::SpeakableString((uint64_t)&v9, &v23, &v22);
  [(DEDialog *)self This];
  siri::dialogengine::Dialog::SetFull(v7, &v9);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (v21 < 0) {
    operator delete(__p);
  }
  if (v19 < 0) {
    operator delete(v18);
  }
  if (v17 < 0) {
    operator delete(v16);
  }
  if (v15 < 0) {
    operator delete(v14);
  }
  if (v13 < 0) {
    operator delete(v12);
  }
  if (v11 < 0) {
    operator delete(v10);
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v23.__r_.__value_.__l.__data_);
  }
}

- (id)getExpandedContent:(id)a3
{
  id v4 = a3;
  [(DEDialog *)self This];
  siri::dialogengine::Dialog::GetExpandedFull((siri::dialogengine::Dialog *)v15.__r_.__value_.__l.__data_, (siri::dialogengine::Context *)[v4 This], (uint64_t)&v16);
  if (v15.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v15.__r_.__value_.__l.__size_);
  }
  id v5 = [DESpeakableString alloc];
  id v6 = NSString;
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v15, v16.__r_.__value_.__l.__data_, v16.__r_.__value_.__l.__size_);
  }
  else {
    std::string v15 = v16;
  }
  if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v7 = &v15;
  }
  else {
    uint64_t v7 = (std::string *)v15.__r_.__value_.__r.__words[0];
  }
  v8 = [v6 stringWithUTF8String:v7];
  std::string v9 = NSString;
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v17.__r_.__value_.__l.__data_, v17.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v17;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  char v11 = objc_msgSend(v9, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  std::string v12 = [(DESpeakableString *)v5 initWithPrint:v8 speak:v11];

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  if (v27 < 0) {
    operator delete(v26);
  }
  if (v25 < 0) {
    operator delete(v24);
  }
  if (v23 < 0) {
    operator delete(v22);
  }
  if (v21 < 0) {
    operator delete(v20);
  }
  if (v19 < 0) {
    operator delete(v18);
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }

  return v12;
}

- (DESpeakableString)content
{
  [(DEDialog *)self This];
  siri::dialogengine::SpeakableString::SpeakableString(&v13, (const siri::dialogengine::SpeakableString *)(v12.__r_.__value_.__r.__words[0] + 208));
  if (v12.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12.__r_.__value_.__l.__size_);
  }
  v2 = [DESpeakableString alloc];
  v3 = NSString;
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v12, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
  }
  else {
    std::string v12 = v13;
  }
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    id v4 = &v12;
  }
  else {
    id v4 = (std::string *)v12.__r_.__value_.__r.__words[0];
  }
  id v5 = [v3 stringWithUTF8String:v4];
  id v6 = NSString;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v14.__r_.__value_.__l.__data_, v14.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v14;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  v8 = objc_msgSend(v6, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  std::string v9 = [(DESpeakableString *)v2 initWithPrint:v5 speak:v8];

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  if (v24 < 0) {
    operator delete(v23);
  }
  if (v22 < 0) {
    operator delete(v21);
  }
  if (v20 < 0) {
    operator delete(v19);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  return v9;
}

- (void)setId:(id)a3
{
  id v4 = a3;
  [(DEDialog *)self This];
  id v5 = v8;
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v6 UTF8String]);
  std::string::operator=(v5 + 4, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

- (NSString)id
{
  v2 = NSString;
  [(DEDialog *)self This];
  if (*(char *)(v6 + 119) < 0) {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)(v6 + 96), *(void *)(v6 + 104));
  }
  else {
    std::string v8 = *(std::string *)(v6 + 96);
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

- (DEDialog)initWithSharedPtr:(shared_ptr<siri::dialogengine::Dialog>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)DEDialog;
  id v4 = [(DENode *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v8 = *(void *)ptr;
    std::string v9 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(DEDialog *)v4 setThis:&v8];
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  return v5;
}

- (DEDialog)init
{
  v6.receiver = self;
  v6.super_class = (Class)DEDialog;
  v2 = [(DENode *)&v6 init];
  if (v2)
  {
    _ZNSt3__115allocate_sharedB8ne180100IN4siri12dialogengine6DialogENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v4);
    [(DEDialog *)v2 setThis:&v4];
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
  return v2;
}

@end