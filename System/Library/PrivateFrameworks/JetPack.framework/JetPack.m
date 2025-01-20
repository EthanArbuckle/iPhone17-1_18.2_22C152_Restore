void JetPack::detail::resolvingAllSymlinksInNonExistentPath(const std::__fs::filesystem::path *this@<X0>, std::__fs::filesystem::path *a2@<X8>)
{
  BOOL v6;
  std::__fs::filesystem::path::__string_view v7;
  void *p_dst;
  std::basic_string_view<_CharT, _Traits>::size_type v9;
  std::basic_string_view<_CharT, _Traits>::size_type v10;
  std::string v11;
  _OWORD v12[2];
  std::__fs::filesystem::path v13;
  std::string pn;
  std::__fs::filesystem::path __p;
  std::__fs::filesystem::path::iterator __dst;
  std::__fs::filesystem::path::iterator v17;
  std::__fs::filesystem::path::iterator v18;
  std::__fs::filesystem::path::iterator v19;
  std::__fs::filesystem::path stashed_elem;

  memset(&stashed_elem, 0, sizeof(stashed_elem));
  std::__fs::filesystem::path::begin(&v19, this);
  std::__fs::filesystem::path::begin(&v18, this);
  std::__fs::filesystem::path::begin(&v17, this);
  while (1)
  {
    std::__fs::filesystem::path::end(&__dst, this);
    v6 = v17.__path_ptr_ != __dst.__path_ptr_ || v17.__entry_.__data_ != __dst.__entry_.__data_;
    if (SHIBYTE(__dst.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__dst.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    }
    if (!v6) {
      break;
    }
    if (SHIBYTE(v17.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&pn, v17.__stashed_elem_.__pn_.__r_.__value_.__l.__data_, v17.__stashed_elem_.__pn_.__r_.__value_.__l.__size_);
    }
    else {
      pn = v17.__stashed_elem_.__pn_;
    }
    __p.__pn_ = pn;
    memset(&pn, 0, sizeof(pn));
    std::__fs::filesystem::operator/[abi:ne180100](&__p, (uint64_t)&stashed_elem, &__dst.__stashed_elem_);
    if (SHIBYTE(stashed_elem.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(stashed_elem.__pn_.__r_.__value_.__l.__data_);
    }
    stashed_elem = __dst.__stashed_elem_;
    *((unsigned char *)&__dst.__stashed_elem_.__pn_.__r_.__value_.__s + 23) = 0;
    __dst.__stashed_elem_.__pn_.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__pn_.__r_.__value_.__l.__data_);
      if ((SHIBYTE(pn.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_18;
      }
    }
    else if ((SHIBYTE(pn.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_18;
    }
    operator delete(pn.__r_.__value_.__l.__data_);
LABEL_18:
    std::__fs::filesystem::__symlink_status(&stashed_elem, 0);
    if (__dst.__stashed_elem_.__pn_.__r_.__value_.__s.__data_[0] != 3) {
      goto LABEL_34;
    }
    v7 = std::__fs::filesystem::path::__parent_path(&stashed_elem);
    if (v7.__size_ >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v7.__size_ >= 0x17)
    {
      v9 = (v7.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v7.__size_ | 7) != 0x17) {
        v9 = v7.__size_ | 7;
      }
      v10 = v9 + 1;
      p_dst = operator new(v9 + 1);
      __dst.__stashed_elem_.__pn_.__r_.__value_.__l.__size_ = v7.__size_;
      __dst.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
      __dst.__stashed_elem_.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
LABEL_28:
      memmove(p_dst, v7.__data_, v7.__size_);
      goto LABEL_29;
    }
    *((unsigned char *)&__dst.__stashed_elem_.__pn_.__r_.__value_.__s + 23) = v7.__size_;
    p_dst = &__dst;
    if (v7.__size_) {
      goto LABEL_28;
    }
LABEL_29:
    *((unsigned char *)p_dst + v7.__size_) = 0;
    __p = __dst.__stashed_elem_;
    std::__fs::filesystem::__read_symlink(&__dst.__stashed_elem_, &stashed_elem, 0);
    std::__fs::filesystem::operator/[abi:ne180100](&__dst.__stashed_elem_, (uint64_t)&__p, &v13);
    std::__fs::filesystem::path::lexically_normal((std::__fs::filesystem::path *)&pn, &v13);
    if (SHIBYTE(stashed_elem.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(stashed_elem.__pn_.__r_.__value_.__l.__data_);
    }
    stashed_elem.__pn_ = pn;
    *((unsigned char *)&pn.__r_.__value_.__s + 23) = 0;
    pn.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v13.__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v13.__pn_.__r_.__value_.__l.__data_);
      if ((SHIBYTE(__dst.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_33:
        if ((SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_34;
        }
        goto LABEL_38;
      }
    }
    else if ((SHIBYTE(__dst.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_33;
    }
    operator delete(__dst.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_34:
      if (SHIBYTE(v17.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0) {
        goto LABEL_39;
      }
      goto LABEL_35;
    }
LABEL_38:
    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
    if (SHIBYTE(v17.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
LABEL_39:
      std::string::__init_copy_ctor_external(&v11, v17.__stashed_elem_.__pn_.__r_.__value_.__l.__data_, v17.__stashed_elem_.__pn_.__r_.__value_.__l.__size_);
      goto LABEL_40;
    }
LABEL_35:
    v11 = v17.__stashed_elem_.__pn_;
LABEL_40:
    v12[0] = *(_OWORD *)&v17.__path_ptr_;
    *(std::__fs::filesystem::path::__string_view *)((char *)v12 + 9) = *(std::__fs::filesystem::path::__string_view *)((char *)&v17.__entry_ + 1);
    std::__fs::filesystem::path::iterator::__increment(&v17);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v11.__r_.__value_.__l.__data_);
    }
  }
  if (SHIBYTE(v17.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
  }
  std::__fs::filesystem::path::lexically_normal(a2, &stashed_elem);
  if (SHIBYTE(v18.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v18.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    if (SHIBYTE(v19.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_49;
    }
LABEL_46:
    if (SHIBYTE(stashed_elem.__pn_.__r_.__value_.__r.__words[2]) < 0) {
LABEL_50:
    }
      operator delete(stashed_elem.__pn_.__r_.__value_.__l.__data_);
  }
  else
  {
    if ((SHIBYTE(v19.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_46;
    }
LABEL_49:
    operator delete(v19.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    if (SHIBYTE(stashed_elem.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_50;
    }
  }
}

void sub_2185655A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *__p,uint64_t a50,int a51,__int16 a52,char a53,char a54)
{
  if (*(char *)(v54 - 217) < 0)
  {
    operator delete(*(void **)(v54 - 240));
    if ((*(char *)(v54 - 161) & 0x80000000) == 0)
    {
LABEL_3:
      if ((*(char *)(v54 - 105) & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else if ((*(char *)(v54 - 161) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(*(void **)(v54 - 184));
  if ((*(char *)(v54 - 105) & 0x80000000) == 0) {
LABEL_4:
  }
    _Unwind_Resume(exception_object);
LABEL_7:
  operator delete(*(void **)(v54 - 128));
  _Unwind_Resume(exception_object);
}

std::string *std::__fs::filesystem::operator/[abi:ne180100]@<X0>(std::__fs::filesystem::path *this@<X1>, uint64_t a2@<X0>, std::__fs::filesystem::path *a3@<X8>)
{
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&a3->__pn_, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__pn_.__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
  }
  if (std::__fs::filesystem::path::__root_directory(this).__size_) {
    return std::string::operator=(&a3->__pn_, &this->__pn_);
  }
  if (std::__fs::filesystem::path::__filename(a3).__size_) {
    std::string::push_back(&a3->__pn_, 47);
  }
  int v6 = SHIBYTE(this->__pn_.__r_.__value_.__r.__words[2]);
  if (v6 >= 0) {
    v7 = this;
  }
  else {
    v7 = (std::__fs::filesystem::path *)this->__pn_.__r_.__value_.__r.__words[0];
  }
  if (v6 >= 0) {
    std::string::size_type size = HIBYTE(this->__pn_.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = this->__pn_.__r_.__value_.__l.__size_;
  }
  return std::string::append(&a3->__pn_, (const std::string::value_type *)v7, size);
}

void sub_2185657A0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void JetPack::SignedStreamDecoder::readBlock(JetPack::SignedStreamDecoder *this)
{
  if ((*(unsigned int (**)(void))(**((void **)this + 8) + 32))(*((void *)this + 8))
    && !*((unsigned char *)this + 128))
  {
    exception = (JetPack::MissingTerminationBlockException *)__cxa_allocate_exception(0x20uLL);
    JetPack::MissingTerminationBlockException::MissingTerminationBlockException(exception);
LABEL_58:
    __cxa_throw(exception, v29, (void (*)(void *))JetPack::NotEnoughDataException::~NotEnoughDataException);
  }
  if ((*(uint64_t (**)(void, char **, uint64_t))(**((void **)this + 8) + 16))(*((void *)this + 8), &v51, 4) != 4)
  {
    v27 = (char *)__cxa_allocate_exception(0x20uLL);
    strcpy(v27 + 8, "NotEnoughData");
    *((_WORD *)v27 + 11) = 0;
    v27[31] = 13;
    *(void *)v27 = &unk_26C9A9D60;
  }
  if (v51 >= 0x8000001)
  {
    exception = (JetPack::MissingTerminationBlockException *)__cxa_allocate_exception(0x20uLL);
    JetPack::BlockExceedsMaximumSizeException::BlockExceedsMaximumSizeException(exception);
    goto LABEL_58;
  }
  readVector(*((JetPack::BaseStream **)this + 8), v51, 1, (uint64_t)&v51);
  if ((*(uint64_t (**)(void, char **, uint64_t))(**((void **)this + 8) + 16))(*((void *)this + 8), &v49, 2) != 2)
  {
    v30 = (char *)__cxa_allocate_exception(0x20uLL);
    strcpy(v30 + 8, "NotEnoughData");
    *((_WORD *)v30 + 11) = 0;
    v30[31] = 13;
    *(void *)v30 = &unk_26C9A9D60;
  }
  readVector(*((JetPack::BaseStream **)this + 8), (unsigned __int16)v49, 1, (uint64_t)&v49);
  v45 = 0;
  v46 = 0;
  v44 = 0;
  v2 = v51;
  size_t v3 = v52 - v51;
  if (v52 != v51)
  {
    if ((v3 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    v44 = operator new(v52 - v51);
    v46 = (char *)v44 + v3;
    memcpy(v44, v2, v3);
    v45 = (char *)v44 + v3;
  }
  v4 = operator new(7uLL);
  v5 = v4;
  *(_DWORD *)((char *)v4 + 3) = 1801675120;
  _DWORD *v4 = 1886676298;
  if (*((unsigned char *)this + 120))
  {
    __p = 0;
    v42 = 0;
    v43 = 0;
    std::string::size_type v7 = (unsigned char *)*((void *)this + 12);
    std::string::size_type v6 = (unsigned char *)*((void *)this + 13);
    size_t v8 = v6 - v7;
    if (v6 != v7)
    {
      if ((v8 & 0x8000000000000000) != 0) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      v9 = (char *)operator new(v6 - v7);
      v10 = &v9[v8];
      __p = v9;
      v43 = &v9[v8];
      memcpy(v9, v7, v8);
      v42 = v10;
    }
  }
  else
  {
    __p = v4;
    v42 = (char *)v4 + 7;
    v43 = (char *)v4 + 7;
    v5 = 0;
  }
  JetPack::signingChunkForDataBlock((char **)&v44, (char **)&__p, &v47);
  if (__p)
  {
    v42 = __p;
    operator delete(__p);
  }
  if (v5) {
    operator delete(v5);
  }
  if (v44)
  {
    v45 = (char *)v44;
    operator delete(v44);
  }
  uint64_t v11 = *((void *)this + 10);
  v39 = 0;
  v40 = 0;
  v38 = 0;
  v12 = v49;
  size_t v13 = v50 - v49;
  if (v50 != v49)
  {
    if ((v13 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    v38 = operator new(v50 - v49);
    v40 = (char *)v38 + v13;
    memcpy(v38, v12, v13);
    v39 = (char *)v38 + v13;
  }
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v14 = v47;
  size_t v15 = v48 - (unsigned char *)v47;
  if (v48 != v47)
  {
    if ((v15 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    v35 = operator new(v48 - (unsigned char *)v47);
    v37 = (char *)v35 + v15;
    memcpy(v35, v14, v15);
    v36 = (char *)v35 + v15;
  }
  char v16 = (*(uint64_t (**)(uint64_t, void **, void **))(*(void *)v11 + 16))(v11, &v38, &v35);
  if (v35)
  {
    v36 = (char *)v35;
    operator delete(v35);
  }
  if (v38)
  {
    v39 = (char *)v38;
    operator delete(v38);
  }
  if ((v16 & 1) == 0)
  {
    v31 = (JetPack::InvalidSignatureException *)__cxa_allocate_exception(0x20uLL);
    JetPack::InvalidSignatureException::InvalidSignatureException(v31);
  }
  v17 = v51;
  v18 = v52;
  if (v52 != v51) {
    goto LABEL_36;
  }
  readToEndVector(*((JetPack::BaseStream **)this + 8), &v33);
  v19 = v33;
  v20 = v34;
  if (v33)
  {
    v34 = v33;
    operator delete(v33);
  }
  if (v20 != v19)
  {
    v32 = (JetPack::InvalidDataAfterTerminationBlockException *)__cxa_allocate_exception(0x20uLL);
    JetPack::InvalidDataAfterTerminationBlockException::InvalidDataAfterTerminationBlockException(v32);
  }
  *((unsigned char *)this + 128) = 1;
  v17 = v51;
  v18 = v52;
  if (v51 != v52)
  {
LABEL_36:
    uint64_t v21 = *((void *)this + 6);
    do
    {
      uint64_t v23 = *((void *)this + 3);
      uint64_t v24 = *((void *)this + 2);
      if (v23 == v24) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = ((v23 - v24) << 9) - 1;
      }
      unint64_t v26 = *((void *)this + 5) + v21;
      if (v25 == v26)
      {
        std::deque<unsigned char>::__add_back_capacity((uint64_t)this + 8);
        uint64_t v24 = *((void *)this + 2);
        unint64_t v26 = *((void *)this + 6) + *((void *)this + 5);
      }
      char v22 = *v17++;
      *(unsigned char *)(*(void *)(v24 + ((v26 >> 9) & 0x7FFFFFFFFFFFF8)) + (v26 & 0xFFF)) = v22;
      uint64_t v21 = *((void *)this + 6) + 1;
      *((void *)this + 6) = v21;
    }
    while (v17 != v18);
  }
  std::optional<std::vector<unsigned char>>::operator=[abi:ne180100]<std::vector<unsigned char>&,void>((uint64_t)this + 96, &v49);
  if (v47)
  {
    v48 = v47;
    operator delete(v47);
  }
  if (v49)
  {
    v50 = v49;
    operator delete(v49);
  }
  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }
}

void sub_218565E0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25)
{
  if (__p) {
    operator delete(__p);
  }
  v27 = *(void **)(v25 - 96);
  if (v27)
  {
    *(void *)(v25 - 88) = v27;
    operator delete(v27);
    v28 = *(void **)(v25 - 72);
    if (!v28) {
LABEL_5:
    }
      _Unwind_Resume(exception_object);
  }
  else
  {
    v28 = *(void **)(v25 - 72);
    if (!v28) {
      goto LABEL_5;
    }
  }
  *(void *)(v25 - 64) = v28;
  operator delete(v28);
  _Unwind_Resume(exception_object);
}

void std::deque<unsigned char>::__add_back_capacity(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = v2 >= 0x1000;
  unint64_t v4 = v2 - 4096;
  if (v3)
  {
    *(void *)(a1 + 32) = v4;
    std::string::size_type v6 = *(void **)(a1 + 8);
    v5 = *(char **)(a1 + 16);
    std::string::size_type v7 = (char *)(v6 + 1);
    uint64_t v8 = *v6;
    *(void *)(a1 + 8) = v6 + 1;
    if (v5 != *(char **)(a1 + 24))
    {
LABEL_56:
      *(void *)v5 = v8;
      *(void *)(a1 + 16) += 8;
      return;
    }
    v9 = *(char **)a1;
    uint64_t v10 = (uint64_t)&v7[-*(void *)a1];
    if ((unint64_t)v7 <= *(void *)a1)
    {
      unint64_t v29 = (v5 - v9) >> 2;
      if (v5 == v9) {
        unint64_t v29 = 1;
      }
      if (!(v29 >> 61))
      {
        unint64_t v30 = v29 >> 2;
        uint64_t v31 = 8 * v29;
        v32 = (char *)operator new(8 * v29);
        v33 = &v32[8 * v30];
        v34 = &v32[v31];
        int64_t v36 = v5 - v7;
        BOOL v35 = v5 == v7;
        v5 = v33;
        if (!v35)
        {
          v5 = &v33[v36 & 0xFFFFFFFFFFFFFFF8];
          unint64_t v37 = v36 - 8;
          if ((unint64_t)(v36 - 8) >= 0x38)
          {
            v53 = &v32[8 * v30];
            v38 = v53;
            if ((unint64_t)(v53 - v7) >= 0x20)
            {
              uint64_t v54 = (v37 >> 3) + 1;
              uint64_t v55 = 8 * (v54 & 0x3FFFFFFFFFFFFFFCLL);
              v38 = &v33[v55];
              v7 += v55;
              v56 = (long long *)(v6 + 3);
              v57 = v53 + 16;
              uint64_t v58 = v54 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v59 = *v56;
                *(v57 - 1) = *(v56 - 1);
                _OWORD *v57 = v59;
                v56 += 2;
                v57 += 2;
                v58 -= 4;
              }
              while (v58);
              if (v54 == (v54 & 0x3FFFFFFFFFFFFFFCLL)) {
                goto LABEL_54;
              }
            }
          }
          else
          {
            v38 = &v32[8 * v30];
          }
          do
          {
            uint64_t v60 = *(void *)v7;
            v7 += 8;
            *(void *)v38 = v60;
            v38 += 8;
          }
          while (v38 != v5);
        }
        goto LABEL_54;
      }
LABEL_64:
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
LABEL_5:
    uint64_t v11 = v10 >> 3;
    if (v11 >= -1) {
      uint64_t v12 = v11 + 1;
    }
    else {
      uint64_t v12 = v11 + 2;
    }
    uint64_t v13 = v12 >> 1;
    uint64_t v14 = -v13;
    size_t v15 = &v7[-8 * v13];
    int64_t v16 = v5 - v7;
    if (v5 != v7)
    {
      memmove(&v7[-8 * v13], v7, v5 - v7);
      std::string::size_type v7 = *(char **)(a1 + 8);
    }
    v5 = &v15[v16];
    *(void *)(a1 + 8) = &v7[8 * v14];
    *(void *)(a1 + 16) = &v15[v16];
    goto LABEL_56;
  }
  v18 = *(char **)(a1 + 8);
  v17 = *(char **)(a1 + 16);
  uint64_t v19 = v17 - v18;
  uint64_t v20 = (v17 - v18) >> 3;
  uint64_t v21 = *(char **)(a1 + 24);
  uint64_t v22 = (uint64_t)&v21[-*(void *)a1];
  if (v20 < (unint64_t)(v22 >> 3))
  {
    if (v21 != v17)
    {
      *(void *)&long long v69 = operator new(0x1000uLL);
      std::__split_buffer<unsigned char *>::push_back((char **)a1, &v69);
      return;
    }
    *(void *)&long long v69 = operator new(0x1000uLL);
    std::__split_buffer<unsigned char *>::push_front((void **)a1, &v69);
    v39 = *(void **)(a1 + 8);
    v5 = *(char **)(a1 + 16);
    std::string::size_type v7 = (char *)(v39 + 1);
    uint64_t v8 = *v39;
    *(void *)(a1 + 8) = v39 + 1;
    if (v5 != *(char **)(a1 + 24)) {
      goto LABEL_56;
    }
    v9 = *(char **)a1;
    uint64_t v10 = (uint64_t)&v7[-*(void *)a1];
    if ((unint64_t)v7 <= *(void *)a1)
    {
      unint64_t v40 = (v5 - v9) >> 2;
      if (v5 == v9) {
        unint64_t v40 = 1;
      }
      if (!(v40 >> 61))
      {
        unint64_t v41 = v40 >> 2;
        uint64_t v42 = 8 * v40;
        v32 = (char *)operator new(8 * v40);
        v33 = &v32[8 * v41];
        v34 = &v32[v42];
        int64_t v43 = v5 - v7;
        BOOL v35 = v5 == v7;
        v5 = v33;
        if (!v35)
        {
          v5 = &v33[v43 & 0xFFFFFFFFFFFFFFF8];
          unint64_t v44 = v43 - 8;
          if ((unint64_t)(v43 - 8) >= 0x38)
          {
            v61 = &v32[8 * v41];
            v45 = v61;
            if ((unint64_t)(v61 - v7) >= 0x20)
            {
              uint64_t v62 = (v44 >> 3) + 1;
              uint64_t v63 = 8 * (v62 & 0x3FFFFFFFFFFFFFFCLL);
              v45 = &v33[v63];
              v7 += v63;
              v64 = (long long *)(v39 + 3);
              v65 = v61 + 16;
              uint64_t v66 = v62 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v67 = *v64;
                *(v65 - 1) = *(v64 - 1);
                _OWORD *v65 = v67;
                v64 += 2;
                v65 += 2;
                v66 -= 4;
              }
              while (v66);
              if (v62 == (v62 & 0x3FFFFFFFFFFFFFFCLL)) {
                goto LABEL_54;
              }
            }
          }
          else
          {
            v45 = &v32[8 * v41];
          }
          do
          {
            uint64_t v68 = *(void *)v7;
            v7 += 8;
            *(void *)v45 = v68;
            v45 += 8;
          }
          while (v45 != v5);
        }
LABEL_54:
        *(void *)a1 = v32;
        *(void *)(a1 + 8) = v33;
        *(void *)(a1 + 16) = v5;
        *(void *)(a1 + 24) = v34;
        if (v9)
        {
          operator delete(v9);
          v5 = *(char **)(a1 + 16);
        }
        goto LABEL_56;
      }
      goto LABEL_64;
    }
    goto LABEL_5;
  }
  uint64_t v23 = v22 >> 2;
  if (v21 == *(char **)a1) {
    unint64_t v24 = 1;
  }
  else {
    unint64_t v24 = v23;
  }
  uint64_t v71 = a1 + 24;
  if (v24 >> 61) {
    goto LABEL_64;
  }
  uint64_t v25 = (char *)operator new(8 * v24);
  unint64_t v26 = &v25[8 * v20];
  *(void *)&long long v69 = v25;
  *((void *)&v69 + 1) = v26;
  *(void *)&long long v70 = v26;
  *((void *)&v70 + 1) = &v25[8 * v24];
  v27 = operator new(0x1000uLL);
  if (v20 == v24)
  {
    if (v19 < 1)
    {
      if (v17 == v18) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = v19 >> 2;
      }
      if (v46 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      v47 = (char *)operator new(8 * v46);
      unint64_t v26 = &v47[8 * (v46 >> 2)];
      *(void *)&long long v69 = v47;
      *((void *)&v69 + 1) = v26;
      *((void *)&v70 + 1) = &v47[8 * v46];
      operator delete(v25);
      v17 = *(char **)(a1 + 16);
    }
    else
    {
      unint64_t v28 = v20 + 2;
      if (v20 >= -1) {
        unint64_t v28 = v20 + 1;
      }
      v26 -= 8 * (v28 >> 1);
      *((void *)&v69 + 1) = v26;
    }
  }
  *(void *)unint64_t v26 = v27;
  *(void *)&long long v70 = v26 + 8;
  uint64_t v48 = -7 - (void)v17;
  while (v17 != *(char **)(a1 + 8))
  {
    v17 -= 8;
    v48 += 8;
    std::__split_buffer<unsigned char *>::push_front((void **)&v69, v17);
  }
  v49 = *(char **)a1;
  long long v50 = v69;
  long long v51 = v70;
  *(void *)&long long v69 = *(void *)a1;
  *((void *)&v69 + 1) = v17;
  long long v52 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a1 = v50;
  *(_OWORD *)(a1 + 16) = v51;
  long long v70 = v52;
  if (v17 != (char *)v52) {
    *(void *)&long long v70 = v52 + (-(v52 + v48) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v49) {
    operator delete(v49);
  }
}

void sub_21856636C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11)
{
  operator delete(v11);
  if (!__p) {
    _Unwind_Resume(a1);
  }
  operator delete(__p);
  _Unwind_Resume(a1);
}

void std::__split_buffer<unsigned char *>::push_back(char **a1, void *a2)
{
  unint64_t v4 = a1[2];
  if (v4 != a1[3]) {
    goto LABEL_22;
  }
  v5 = *a1;
  std::string::size_type v6 = a1[1];
  if (v6 > *a1)
  {
    uint64_t v7 = (v6 - *a1) >> 3;
    if (v7 >= -1) {
      uint64_t v8 = v7 + 1;
    }
    else {
      uint64_t v8 = v7 + 2;
    }
    uint64_t v9 = v8 >> 1;
    uint64_t v10 = -v9;
    uint64_t v11 = &v6[-8 * v9];
    int64_t v12 = v4 - v6;
    if (v4 != v6)
    {
      memmove(&v6[-8 * v9], a1[1], v4 - v6);
      unint64_t v4 = a1[1];
    }
    uint64_t v13 = &v4[8 * v10];
    unint64_t v4 = &v11[v12];
    a1[1] = v13;
    a1[2] = &v11[v12];
    goto LABEL_22;
  }
  unint64_t v14 = (v4 - v5) >> 2;
  if (v4 == v5) {
    unint64_t v14 = 1;
  }
  if (v14 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  unint64_t v15 = v14 >> 2;
  uint64_t v16 = 8 * v14;
  v17 = (char *)operator new(8 * v14);
  v18 = &v17[8 * v15];
  int64_t v20 = v4 - v6;
  BOOL v19 = v4 == v6;
  unint64_t v4 = v18;
  if (!v19)
  {
    unint64_t v4 = &v18[v20 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v21 = v20 - 8;
    if ((unint64_t)(v20 - 8) < 0x38)
    {
      uint64_t v22 = &v17[8 * v15];
      do
      {
LABEL_19:
        uint64_t v31 = *(void *)v6;
        v6 += 8;
        *(void *)uint64_t v22 = v31;
        v22 += 8;
      }
      while (v22 != v4);
      goto LABEL_20;
    }
    uint64_t v23 = &v17[8 * v15];
    uint64_t v22 = v23;
    if ((unint64_t)(v23 - v6) < 0x20) {
      goto LABEL_19;
    }
    uint64_t v24 = (v21 >> 3) + 1;
    uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
    uint64_t v22 = &v18[v25];
    unint64_t v26 = &v6[v25];
    v27 = (long long *)(v6 + 16);
    unint64_t v28 = v23 + 16;
    uint64_t v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v30 = *v27;
      *(v28 - 1) = *(v27 - 1);
      _OWORD *v28 = v30;
      v27 += 2;
      v28 += 2;
      v29 -= 4;
    }
    while (v29);
    std::string::size_type v6 = v26;
    if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL)) {
      goto LABEL_19;
    }
  }
LABEL_20:
  *a1 = v17;
  a1[1] = v18;
  a1[2] = v4;
  a1[3] = &v17[v16];
  if (v5)
  {
    operator delete(v5);
    unint64_t v4 = a1[2];
  }
LABEL_22:
  *(void *)unint64_t v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<unsigned char *>::push_front(void **a1, void *a2)
{
  unint64_t v4 = (char *)a1[1];
  if (v4 == *a1)
  {
    uint64_t v7 = a1[2];
    std::string::size_type v6 = a1[3];
    if (v7 >= v6)
    {
      uint64_t v13 = v6 - v4;
      BOOL v12 = v13 == 0;
      unint64_t v14 = v13 >> 2;
      if (v12) {
        unint64_t v14 = 1;
      }
      if (v14 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v15 = (v14 + 3) >> 2;
      uint64_t v16 = 8 * v14;
      v17 = (char *)operator new(8 * v14);
      v5 = &v17[8 * v15];
      v18 = v5;
      uint64_t v19 = v7 - v4;
      if (v7 != v4)
      {
        v18 = &v5[v19 & 0xFFFFFFFFFFFFFFF8];
        unint64_t v20 = v19 - 8;
        unint64_t v21 = &v17[8 * v15];
        uint64_t v22 = v4;
        if (v20 < 0x38) {
          goto LABEL_27;
        }
        uint64_t v23 = &v17[8 * v15];
        unint64_t v21 = v23;
        uint64_t v22 = v4;
        if ((unint64_t)(v23 - v4) < 0x20) {
          goto LABEL_27;
        }
        uint64_t v24 = (v20 >> 3) + 1;
        uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
        unint64_t v21 = &v5[v25];
        uint64_t v22 = &v4[v25];
        unint64_t v26 = (long long *)(v4 + 16);
        v27 = v23 + 16;
        uint64_t v28 = v24 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v29 = *v26;
          *(v27 - 1) = *(v26 - 1);
          _OWORD *v27 = v29;
          v26 += 2;
          v27 += 2;
          v28 -= 4;
        }
        while (v28);
        if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_27:
          do
          {
            uint64_t v30 = *(void *)v22;
            v22 += 8;
            *(void *)unint64_t v21 = v30;
            v21 += 8;
          }
          while (v21 != v18);
        }
      }
      *a1 = v17;
      a1[1] = v5;
      a1[2] = v18;
      a1[3] = &v17[v16];
      if (v4)
      {
        operator delete(v4);
        v5 = (char *)a1[1];
      }
    }
    else
    {
      uint64_t v8 = (v6 - v7) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v11 = &v7[8 * (v9 >> 1)];
      v5 = &v11[-(v7 - v4)];
      if (v7 != v4)
      {
        memmove(&v11[-(v7 - v4)], v4, v7 - v4);
        unint64_t v4 = (char *)a1[2];
      }
      a1[1] = v5;
      a1[2] = &v4[8 * v10];
    }
  }
  else
  {
    v5 = (char *)a1[1];
  }
  *((void *)v5 - 1) = *a2;
  a1[1] = (char *)a1[1] - 8;
}

uint64_t JetPackStreamIsFinished(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    a1 = (uint64_t *)*a1;
    unint64_t v2 = (std::__shared_weak_count *)v1[1];
    if (v2) {
      atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    unint64_t v2 = 0;
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t *))(*a1 + 32))(a1);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  return v3;
}

void sub_2185668B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t JetPack::ArchiveStream::isFinished(JetPack::ArchiveStream *this)
{
  return *((unsigned __int8 *)this + 56);
}

uint64_t JetPackStreamRead(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    a1 = (uint64_t *)*a1;
    unint64_t v2 = (std::__shared_weak_count *)v1[1];
    if (v2) {
      atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    unint64_t v2 = 0;
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t *))(*a1 + 16))(a1);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  return v3;
}

void sub_218566998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

size_t JetPack::ArchiveStream::read(JetPack::ArchiveStream *this, unsigned __int8 *__dst, size_t a3)
{
  if (*((unsigned char *)this + 56)) {
    return 0;
  }
  size_t v3 = a3;
  uint64_t v7 = (size_t *)((char *)this + 24);
  size_t v6 = *((void *)this + 3);
  if (!v6)
  {
    int data_block = archive_read_data_block();
    if (data_block == 1)
    {
      size_t v3 = 0;
      *((unsigned char *)this + 56) = 1;
      return v3;
    }
    if (data_block)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      unint64_t v12 = archive_error_string();
      JetPack::archiveErrorToString(v12, v13);
      JetPack::LibArchiveException::LibArchiveException(exception, (uint64_t)v13);
    }
    size_t v6 = *v7;
  }
  if (v6 < v3) {
    size_t v3 = v6;
  }
  memcpy(__dst, *((const void **)this + 2), v3);
  size_t v9 = *((void *)this + 3) - v3;
  *((void *)this + 2) += v3;
  *((void *)this + 3) = v9;
  *((void *)this + 5) += v3;
  return v3;
}

void sub_218566AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

size_t JetPack::FileStream::read(JetPack::FileStream *this, unsigned __int8 *__ptr, size_t a3)
{
  size_t v3 = (FILE *)*((void *)this + 1);
  if (v3)
  {
    return fread(__ptr, 1uLL, a3, v3);
  }
  else
  {
    {
      getGlobalLog(void)::sharedContext = 4;
      {
        JetPack::getSharedOSLog(void)::log = (uint64_t)os_log_create("com.apple.JetPack", "Diagnostics");
      }
      qword_26AB31848 = JetPack::getSharedOSLog(void)::log;
    }
    v5 = qword_26AB31848;
    if (os_log_type_enabled((os_log_t)qword_26AB31848, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)size_t v6 = 0;
      _os_log_impl(&dword_218564000, v5, OS_LOG_TYPE_ERROR, "THIS IS A FATAL BUG: Trying to read from null file pointer", v6, 2u);
    }
    return 0;
  }
}

void readVector(JetPack::BaseStream *a1@<X0>, size_t __sz@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if (__sz)
  {
    if ((__sz & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v8 = (char *)operator new(__sz);
    *(void *)a4 = v8;
    *(void *)(a4 + 16) = &v8[__sz];
    bzero(v8, __sz);
    *(void *)(a4 + 8) = &v8[__sz];
  }
  else
  {
    uint64_t v8 = 0;
  }
  unint64_t v9 = (*(uint64_t (**)(JetPack::BaseStream *, char *, size_t))(*(void *)a1 + 16))(a1, v8, __sz);
  if (v9 != __sz && a3 != 0)
  {
    exception = (char *)__cxa_allocate_exception(0x20uLL);
    strcpy(exception + 8, "NotEnoughData");
    *((_WORD *)exception + 11) = 0;
    exception[31] = 13;
    *(void *)exception = &unk_26C9A9D60;
  }
  unint64_t v11 = *(void *)(a4 + 8) - *(void *)a4;
  if (v9 <= v11)
  {
    if (v9 < v11) {
      *(void *)(a4 + 8) = *(void *)a4 + v9;
    }
  }
  else
  {
    std::vector<unsigned char>::__append((void **)a4, v9 - v11);
  }
}

void sub_218566D78(_Unwind_Exception *exception_object)
{
  size_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t JetPack::readSegmentContainer(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = a2[1];
  uint64_t v19 = *a2;
  unint64_t v20 = (std::__shared_weak_count *)v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v21 = JetPack::parseSegmentContainerHeader(&v19, a1 + 16);
  v5 = v20;
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  size_t v6 = (std::__shared_weak_count *)operator new(0x48uLL);
  v6->__shared_owners_ = 0;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA6F0;
  uint64_t v7 = &v6[1].__vftable;
  std::allocator_traits<std::allocator<JetPack::PartialStream>>::construct[abi:ne180100]<JetPack::PartialStream,std::shared_ptr<JetPack::BaseStream> &,unsigned int &,void>((uint64_t)&v22, &v6[1].__vftable, a2, (unsigned int *)&v21 + 1);
  v17 = &v6[1].__vftable;
  v18 = v6;
  if (!*(unsigned char *)(a1 + 224)) {
    goto LABEL_12;
  }
  char v8 = v21;
  unint64_t v15 = &v6[1].__vftable;
  int v16 = v6;
  atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  char v22 = v8;
  uint64_t v9 = *(void *)(a1 + 216);
  if (!v9) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, char *, void **))(*(void *)v9 + 48))(v9, a1, &v22, &v15);
  uint64_t v11 = v10;
  unint64_t v12 = v16;
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    if (!v11) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v10)
  {
LABEL_11:
    uint64_t v7 = v17;
LABEL_12:
    (*(void (**)(void *))(*v7 + 40))(v7);
    uint64_t v11 = 1;
  }
LABEL_13:
  uint64_t v13 = v18;
  if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  return v11;
}

void sub_218566FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t JetPack::UnownedPartialStream::seekToEnd(JetPack::UnownedPartialStream *this)
{
  uint64_t v2 = *((void *)this + 2);
  uint64_t v3 = v2 - (*(uint64_t (**)(JetPack::UnownedPartialStream *))(*(void *)this + 24))(this);
  uint64_t v4 = *(uint64_t (**)(JetPack::UnownedPartialStream *, uint64_t))(*(void *)this + 48);
  return v4(this, v3);
}

uint64_t JetPack::UnownedPartialStream::seekForward(JetPack::UnownedPartialStream *this)
{
  (*(uint64_t (**)(JetPack::UnownedPartialStream *))(*(void *)this + 24))(this);
  uint64_t v2 = *(uint64_t (**)(void))(**((void **)this + 1) + 48);
  return v2();
}

unint64_t JetPack::BaseStream::seekForward(JetPack::BaseStream *this, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = (*(uint64_t (**)(JetPack::BaseStream *))(*(void *)this + 24))(this);
  unint64_t result = (*(uint64_t (**)(JetPack::BaseStream *))(*(void *)this + 32))(this);
  if ((result & 1) == 0)
  {
    unint64_t v6 = v4 + a2;
    do
    {
      unint64_t result = (*(uint64_t (**)(JetPack::BaseStream *))(*(void *)this + 24))(this);
      if (v6 <= result) {
        break;
      }
      uint64_t v7 = (*(uint64_t (**)(JetPack::BaseStream *))(*(void *)this + 24))(this);
      uint64_t v8 = v6 - v7 >= 0x400 ? 1024 : v6 - v7;
      (*(void (**)(JetPack::BaseStream *, unsigned char *, uint64_t))(*(void *)this + 16))(this, v9, v8);
      unint64_t result = (*(uint64_t (**)(JetPack::BaseStream *))(*(void *)this + 32))(this);
    }
    while (!result);
  }
  return result;
}

unint64_t JetPack::AESDecoderStream::read(JetPack::AESDecoderStream *this, unsigned __int8 *a2, unint64_t a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  while (((*(uint64_t (**)(void))(**((void **)this + 1) + 32))(*((void *)this + 1)) & 1) == 0)
  {
    if (*((void *)this + 13) >= a3) {
      break;
    }
    int v6 = *((_DWORD *)this + 13);
    *((_DWORD *)this + 13) = v6 + 1;
    uint64_t v43 = 0;
    int v44 = v6;
    if ((*(uint64_t (**)(void, unsigned char *, uint64_t))(**((void **)this + 1) + 16))(*((void *)this + 1), v42, 16) != 16)
    {
      exception = (JetPack::InvalidEncryptionTagLengthException *)__cxa_allocate_exception(0x20uLL);
      JetPack::InvalidEncryptionTagLengthException::InvalidEncryptionTagLengthException(exception);
    }
    uint64_t v7 = (*(uint64_t (**)(void, void, void))(**((void **)this + 1) + 16))(*((void *)this + 1), *((void *)this + 14), *((unsigned int *)this + 12));
    if ((*(unsigned int (**)(void, char *, uint64_t, uint64_t *, uint64_t, void, void, void, uint64_t, void, unsigned char *, uint64_t))(**((void **)this + 3) + 40))(*((void *)this + 3), (char *)this + 32, 16, &v43, 12, 0, 0, *((void *)this + 14), v7, *((void *)this + 17), v42, 16) != 1)
    {
      v39 = (JetPack::CommonCryptoInvalidStatusException *)__cxa_allocate_exception(0x28uLL);
      int v40 = (*(uint64_t (**)(void, char *, uint64_t, uint64_t *, uint64_t, void, void, void, uint64_t, void, unsigned char *, uint64_t))(**((void **)this + 3) + 40))(*((void *)this + 3), (char *)this + 32, 16, &v43, 12, 0, 0, *((void *)this + 14), v7, *((void *)this + 17), v42, 16);
      JetPack::CommonCryptoInvalidStatusException::CommonCryptoInvalidStatusException(v39, v40);
    }
    if (v7)
    {
      uint64_t v8 = (char *)*((void *)this + 17);
      uint64_t v9 = *((void *)this + 13);
      do
      {
        uint64_t v11 = *((void *)this + 10);
        uint64_t v12 = *((void *)this + 9);
        if (v11 == v12) {
          uint64_t v13 = 0;
        }
        else {
          uint64_t v13 = ((v11 - v12) << 9) - 1;
        }
        unint64_t v14 = *((void *)this + 12) + v9;
        if (v13 == v14)
        {
          std::deque<unsigned char>::__add_back_capacity((uint64_t)this + 64);
          uint64_t v12 = *((void *)this + 9);
          unint64_t v14 = *((void *)this + 13) + *((void *)this + 12);
        }
        char v10 = *v8++;
        *(unsigned char *)(*(void *)(v12 + ((v14 >> 9) & 0x7FFFFFFFFFFFF8)) + (v14 & 0xFFF)) = v10;
        uint64_t v9 = *((void *)this + 13) + 1;
        *((void *)this + 13) = v9;
        --v7;
      }
      while (v7);
    }
  }
  if (*((void *)this + 13) >= a3) {
    unint64_t v15 = a3;
  }
  else {
    unint64_t v15 = *((void *)this + 13);
  }
  uint64_t v16 = *((void *)this + 9);
  v17 = (void *)(v16 + 8 * (*((void *)this + 12) >> 12));
  if (*((void *)this + 10) == v16)
  {
    v18 = 0;
    if (!v15) {
      goto LABEL_33;
    }
  }
  else
  {
    v18 = (unsigned char *)(*v17 + (*((void *)this + 12) & 0xFFFLL));
    if (!v15) {
      goto LABEL_33;
    }
  }
  unint64_t v19 = (unint64_t)&v18[v15 - *v17];
  if ((uint64_t)v19 >= 1)
  {
    unint64_t v20 = v19 >> 12;
    uint64_t v21 = (unsigned char *)(v17[v19 >> 12] + (v19 & 0xFFF));
    if (v19 >> 12) {
      goto LABEL_23;
    }
LABEL_31:
    size_t v27 = v21 - v18;
    if (v21 == v18) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  unint64_t v28 = 4095 - v19;
  __int16 v29 = ~(_WORD)v28;
  v28 >>= 12;
  unint64_t v20 = -(uint64_t)v28;
  uint64_t v21 = (unsigned char *)(v17[-v28] + (v29 & 0xFFF));
  if (!v28) {
    goto LABEL_31;
  }
LABEL_23:
  uint64_t v22 = *v17 + 4096;
  uint64_t v23 = v22 - (void)v18;
  if ((unsigned char *)v22 != v18) {
    memmove(a2, v18, v22 - (void)v18);
  }
  a2 += v23;
  if (v20 != 1)
  {
    uint64_t v24 = (const void **)(v17 + 1);
    uint64_t v25 = 8 * v20 - 8;
    do
    {
      unint64_t v26 = *v24++;
      memmove(a2, v26, 0x1000uLL);
      a2 += 4096;
      v25 -= 8;
    }
    while (v25);
  }
  v18 = (unsigned char *)v17[v20];
  if (v18 != v21)
  {
    size_t v27 = v21 - v18;
LABEL_32:
    memmove(a2, v18, v27);
  }
LABEL_33:
  unint64_t v30 = *((void *)this + 12);
  uint64_t v31 = *((void *)this + 9);
  v32 = (char *)(v31 + 8 * (v30 >> 12));
  if (*((void *)this + 10) != v31)
  {
    v33 = (char *)(*(void *)v32 + (*((void *)this + 12) & 0xFFFLL));
    if (v15) {
      goto LABEL_35;
    }
LABEL_38:
    int64_t v36 = v33;
    BOOL v35 = (char *)(v31 + 8 * (v30 >> 12));
    goto LABEL_40;
  }
  v33 = 0;
  if (!v15) {
    goto LABEL_38;
  }
LABEL_35:
  uint64_t v34 = (uint64_t)&v33[v15 - *(void *)v32];
  if (v34 < 1)
  {
    unint64_t v37 = 4095 - v34;
    BOOL v35 = &v32[-8 * (v37 >> 12)];
    int64_t v36 = (char *)(*(void *)v35 + (~(_WORD)v37 & 0xFFF));
  }
  else
  {
    BOOL v35 = &v32[8 * ((unint64_t)v34 >> 12)];
    int64_t v36 = (char *)(*(void *)v35 + (v34 & 0xFFF));
  }
LABEL_40:
  std::deque<unsigned char>::erase((void *)this + 8, v32, v33, v35, v36);
  *((void *)this + 7) += v15;
  return v15;
}

void sub_218567758(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t JetPack::detail::readCallback(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2 + 1;
  uint64_t result = (*(uint64_t (**)(void, void *, uint64_t))(*(void *)*a2 + 16))(*a2, a2 + 1, 0x20000);
  *a3 = v4;
  return result;
}

uint64_t JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>::read(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1)) {
    return 0;
  }
  *(void *)(a1 + 32) = a3;
  *(void *)(a1 + 40) = a2;
  while (1)
  {
    if (*(_DWORD *)(a1 + 48) == 2
      && ((*(uint64_t (**)(void))(**(void **)(a1 + 56) + 32))(*(void *)(a1 + 56)) & 1) == 0)
    {
      if (*(void *)(a1 + 16))
      {
        exception = (JetPack::BrotliAvailableInNotEmptyOnFillException *)__cxa_allocate_exception(0x20uLL);
        JetPack::BrotliAvailableInNotEmptyOnFillException::BrotliAvailableInNotEmptyOnFillException(exception);
        goto LABEL_17;
      }
      uint64_t v7 = (*(uint64_t (**)(void, void, void))(**(void **)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 72), *(void *)(a1 + 80) - *(void *)(a1 + 72));
      uint64_t v8 = *(void *)(a1 + 72);
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v8;
    }
    uint64_t v9 = *(void *)(a1 + 8);
    uint64_t v10 = (*(uint64_t (**)(void))(**(void **)(a1 + 56) + 32))(*(void *)(a1 + 56));
    int v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v9 + 16))(v9, a1 + 16, a1 + 24, a1 + 32, a1 + 40, v10);
    *(_DWORD *)(a1 + 48) = v11;
    if (v11 != 2) {
      break;
    }
    if ((*(unsigned int (**)(void))(**(void **)(a1 + 56) + 32))(*(void *)(a1 + 56)))
    {
      uint64_t v12 = (char *)__cxa_allocate_exception(0x20uLL);
      strcpy(v12 + 8, "NotEnoughData");
      *((_WORD *)v12 + 11) = 0;
      v12[31] = 13;
      *(void *)uint64_t v12 = &unk_26C9A9D60;
    }
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (v11 == 1)
  {
    if ((*(uint64_t (**)(void))(**(void **)(a1 + 56) + 32))(*(void *)(a1 + 56))) {
      goto LABEL_15;
    }
    exception = (JetPack::BrotliAvailableInNotEmptyOnFillException *)__cxa_allocate_exception(0x20uLL);
    JetPack::BrotliStreamNotFinishedAfterDecodingException::BrotliStreamNotFinishedAfterDecodingException(exception);
LABEL_17:
    __cxa_throw(exception, v15, (void (*)(void *))JetPack::NotEnoughDataException::~NotEnoughDataException);
  }
  if (v11 != 3)
  {
    exception = (JetPack::BrotliAvailableInNotEmptyOnFillException *)__cxa_allocate_exception(0x28uLL);
    JetPack::BrotliUnknownDecoderResultException::BrotliUnknownDecoderResultException(exception, *(_DWORD *)(a1 + 48));
    goto LABEL_17;
  }
LABEL_15:
  uint64_t result = a3 - v13;
  *(void *)(a1 + 96) += a3 - v13;
  return result;
}

void sub_218567AA8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t JetPack::UnownedPartialStream::read(JetPack::UnownedPartialStream *this, unsigned __int8 *a2)
{
  (*(uint64_t (**)(JetPack::UnownedPartialStream *))(*(void *)this + 24))(this);
  uint64_t v3 = *(uint64_t (**)(void))(**((void **)this + 1) + 16);
  return v3();
}

BOOL JetPack::UnownedPartialStream::isFinished(JetPack::UnownedPartialStream *this)
{
  return ((*(uint64_t (**)(void))(**((void **)this + 1) + 32))(*((void *)this + 1)) & 1) != 0
      || (*(uint64_t (**)(JetPack::UnownedPartialStream *))(*(void *)this + 24))(this) == *((void *)this + 2);
}

uint64_t JetPack::UnownedPartialStream::position(JetPack::UnownedPartialStream *this)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**((void **)this + 1) + 24))(*((void *)this + 1));
  if (*((void *)this + 2) >= (unint64_t)(v2 - *((void *)this + 3))) {
    return v2 - *((void *)this + 3);
  }
  else {
    return *((void *)this + 2);
  }
}

uint64_t JetPack::BufferedStream::position(JetPack::BufferedStream *this)
{
  return *((void *)this + 7);
}

uint64_t JetPack::AESDecoderStream::position(JetPack::AESDecoderStream *this)
{
  return *((void *)this + 7);
}

uint64_t JetPack::AppleDecompressionInterface::process(JetPack::AppleDecompressionInterface *this, unint64_t *a2, const unsigned __int8 **a3, unint64_t *a4, unsigned __int8 **a5, BOOL flags)
{
  uint64_t v11 = *a2;
  *((void *)this + 3) = *a3;
  *((void *)this + 1) = *a5;
  uint64_t v12 = (char *)this + 8;
  *((void *)this + 4) = v11;
  *((void *)this + 2) = *a4;
  uint64_t result = compression_stream_process((compression_stream *)((char *)this + 8), flags);
  *a2 = *((void *)v12 + 3);
  *a3 = (const unsigned __int8 *)*((void *)this + 3);
  unint64_t v14 = *(unsigned __int8 **)v12;
  *a4 = *((void *)v12 + 1);
  *a5 = v14;
  if (result == -1) {
    return 0;
  }
  if (result)
  {
    if (result == 1)
    {
      *((unsigned char *)this + 48) = 1;
      return result;
    }
    return 0;
  }
  if (!*((void *)this + 2)) {
    return 3;
  }
  if (*((void *)this + 4)) {
    return 0;
  }
  return 2;
}

uint64_t JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>::position(uint64_t a1)
{
  return *(void *)(a1 + 96);
}

uint64_t JetPack::AppleDecompressionInterface::isFinished(JetPack::AppleDecompressionInterface *this)
{
  return *((unsigned __int8 *)this + 48);
}

uint64_t JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>::isFinished(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 24))();
}

uint64_t JetPack::AESDecoderStream::isFinished(JetPack::AESDecoderStream *this)
{
  if (*((void *)this + 13)) {
    return 0;
  }
  else {
    return (*(uint64_t (**)(void))(**((void **)this + 1) + 32))();
  }
}

uint64_t JetPack::BufferedStream::isFinished(JetPack::BufferedStream *this)
{
  if (*((void *)this + 6)) {
    return 0;
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)this + 64))();
  }
}

unint64_t JetPack::BufferedStream::read(JetPack::BufferedStream *this, unsigned __int8 *a2, unint64_t a3)
{
  if (((*(uint64_t (**)(JetPack::BufferedStream *))(*(void *)this + 64))(this) & 1) == 0)
  {
    do
    {
      if (*((void *)this + 6) >= a3) {
        break;
      }
      (*(void (**)(JetPack::BufferedStream *, unint64_t))(*(void *)this + 56))(this, a3);
    }
    while (!(*(unsigned int (**)(JetPack::BufferedStream *))(*(void *)this + 64))(this));
  }
  if (*((void *)this + 6) < a3) {
    a3 = *((void *)this + 6);
  }
  uint64_t v6 = *((void *)this + 2);
  uint64_t v7 = (void *)(v6 + 8 * (*((void *)this + 5) >> 12));
  if (*((void *)this + 3) == v6)
  {
    uint64_t v8 = 0;
    if (!a3) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v8 = (unsigned char *)(*v7 + (*((void *)this + 5) & 0xFFFLL));
    if (!a3) {
      goto LABEL_22;
    }
  }
  unint64_t v9 = (unint64_t)&v8[a3 - *v7];
  if ((uint64_t)v9 >= 1)
  {
    unint64_t v10 = v9 >> 12;
    uint64_t v11 = (unsigned char *)(v7[v9 >> 12] + (v9 & 0xFFF));
    if (v9 >> 12) {
      goto LABEL_12;
    }
LABEL_20:
    size_t v17 = v11 - v8;
    if (v11 == v8) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  unint64_t v18 = 4095 - v9;
  __int16 v19 = ~(_WORD)v18;
  v18 >>= 12;
  unint64_t v10 = -(uint64_t)v18;
  uint64_t v11 = (unsigned char *)(v7[-v18] + (v19 & 0xFFF));
  if (!v18) {
    goto LABEL_20;
  }
LABEL_12:
  uint64_t v12 = *v7 + 4096;
  uint64_t v13 = v12 - (void)v8;
  if ((unsigned char *)v12 != v8) {
    memmove(a2, v8, v12 - (void)v8);
  }
  a2 += v13;
  if (v10 != 1)
  {
    unint64_t v14 = (const void **)(v7 + 1);
    uint64_t v15 = 8 * v10 - 8;
    do
    {
      uint64_t v16 = *v14++;
      memmove(a2, v16, 0x1000uLL);
      a2 += 4096;
      v15 -= 8;
    }
    while (v15);
  }
  uint64_t v8 = (unsigned char *)v7[v10];
  if (v8 != v11)
  {
    size_t v17 = v11 - v8;
LABEL_21:
    memmove(a2, v8, v17);
  }
LABEL_22:
  unint64_t v20 = *((void *)this + 5);
  uint64_t v21 = *((void *)this + 2);
  uint64_t v22 = (char *)(v21 + 8 * (v20 >> 12));
  if (*((void *)this + 3) != v21)
  {
    uint64_t v23 = (char *)(*(void *)v22 + (*((void *)this + 5) & 0xFFFLL));
    if (a3) {
      goto LABEL_24;
    }
LABEL_27:
    unint64_t v26 = v23;
    uint64_t v25 = (char *)(v21 + 8 * (v20 >> 12));
    goto LABEL_29;
  }
  uint64_t v23 = 0;
  if (!a3) {
    goto LABEL_27;
  }
LABEL_24:
  uint64_t v24 = (uint64_t)&v23[a3 - *(void *)v22];
  if (v24 < 1)
  {
    unint64_t v27 = 4095 - v24;
    uint64_t v25 = &v22[-8 * (v27 >> 12)];
    unint64_t v26 = (char *)(*(void *)v25 + (~(_WORD)v27 & 0xFFF));
  }
  else
  {
    uint64_t v25 = &v22[8 * ((unint64_t)v24 >> 12)];
    unint64_t v26 = (char *)(*(void *)v25 + (v24 & 0xFFF));
  }
LABEL_29:
  std::deque<unsigned char>::erase((void *)this + 1, v22, v23, v25, v26);
  *((void *)this + 7) += a3;
  return a3;
}

uint64_t JetPack::SignedStreamDecoder::inputIsFinished(JetPack::SignedStreamDecoder *this)
{
  uint64_t result = (*(uint64_t (**)(void))(**((void **)this + 8) + 32))(*((void *)this + 8));
  if (result) {
    return *((unsigned char *)this + 128) != 0;
  }
  return result;
}

BOOL JetPack::FileStream::isFinished(FILE **this)
{
  return feof(this[1]) != 0;
}

void **std::deque<unsigned char>::erase(void *a1, char *a2, char *a3, char *a4, char *a5)
{
  v5 = a3;
  if (a5 == a3) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = &a5[512 * (a4 - a2)] - a3 - *(void *)a4 + *(void *)a2;
  }
  unint64_t v9 = a1[4];
  i = (void **)a1[1];
  uint64_t v11 = (void **)a1[2];
  uint64_t v12 = (const void **)&i[v9 >> 12];
  if (v11 != i)
  {
    uint64_t v13 = (char *)*v12 + (a1[4] & 0xFFFLL);
    if (v5 != v13) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v15 = 0;
    char v17 = 1;
    goto LABEL_13;
  }
  uint64_t v13 = 0;
  if (!v5) {
    goto LABEL_11;
  }
LABEL_6:
  int64_t v14 = &v5[512 * (a2 - (char *)v12)] - &v13[*(void *)a2];
  uint64_t v15 = (char *)*v12 + v14;
  if (!v15)
  {
    char v17 = 1;
    v5 = v13;
LABEL_13:
    unint64_t v18 = (const void **)&i[v9 >> 12];
    if (v8 < 1) {
      goto LABEL_35;
    }
    goto LABEL_14;
  }
  uint64_t v16 = (uint64_t)&v13[v14];
  if (v16 < 1)
  {
    char v17 = 0;
    unint64_t v26 = 4095 - v16;
    unint64_t v18 = &v12[-(v26 >> 12)];
    v5 = (char *)*v18 + (~(_WORD)v26 & 0xFFF);
    if (v8 < 1) {
      goto LABEL_35;
    }
  }
  else
  {
    char v17 = 0;
    unint64_t v18 = &v12[(unint64_t)v16 >> 12];
    v5 = (char *)*v18 + (v16 & 0xFFF);
    if (v8 < 1) {
      goto LABEL_35;
    }
  }
LABEL_14:
  uint64_t v19 = a1[5];
  uint64_t v20 = v5 - (unsigned char *)*v18 + v8;
  if ((unint64_t)v15 <= (unint64_t)(v19 - v8) >> 1)
  {
    if (v20 < 1)
    {
      uint64_t v23 = &v18[-((unint64_t)(4095 - v20) >> 12)];
      uint64_t v24 = (char *)*v23;
      uint64_t v25 = ~(4095 - (_WORD)v20) & 0xFFF;
    }
    else
    {
      uint64_t v23 = &v18[(unint64_t)v20 >> 12];
      uint64_t v24 = (char *)*v23;
      uint64_t v25 = v20 & 0xFFF;
    }
    std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>,0>(v12, v13, v18, v5, v23, &v24[v25], v39);
    uint64_t v31 = a1[5] - v8;
    unint64_t v9 = a1[4] + v8;
    a1[4] = v9;
    a1[5] = v31;
    for (i = (void **)a1[1]; v9 >= 0x2000; a1[4] = v9)
    {
      operator delete(*i);
      i = (void **)(a1[1] + 8);
      a1[1] = i;
      unint64_t v9 = a1[4] - 4096;
    }
  }
  else
  {
    if (v20 < 1)
    {
      unint64_t v27 = 4095 - v20;
      uint64_t v21 = &v18[-(v27 >> 12)];
      uint64_t v22 = (char *)*v21 + (~(_WORD)v27 & 0xFFF);
    }
    else
    {
      uint64_t v21 = &v18[(unint64_t)v20 >> 12];
      uint64_t v22 = (char *)*v21 + (v20 & 0xFFF);
    }
    unint64_t v28 = v19 + v9;
    __int16 v29 = (const void **)&i[v28 >> 12];
    if (v11 == i) {
      unint64_t v30 = 0;
    }
    else {
      unint64_t v30 = (char *)*v29 + (v28 & 0xFFF);
    }
    v39[0] = v18;
    v39[1] = (const void **)v5;
    std::__for_each_segment[abi:ne180100]<std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>,std::__move_loop<std::_ClassicAlgPolicy>::_MoveSegment<std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>>>(v21, v22, v29, v30, (uint64_t)v39);
    i = (void **)a1[1];
    uint64_t v32 = a1[2];
    uint64_t v33 = ((v32 - i) << 9) - 1;
    if ((void **)v32 == i) {
      uint64_t v33 = 0;
    }
    unint64_t v9 = a1[4];
    uint64_t v34 = a1[5] - v8;
    a1[5] = v34;
    if (v33 - (v34 + v9) >= 0x2000)
    {
      do
      {
        operator delete(*(void **)(v32 - 8));
        i = (void **)a1[1];
        uint64_t v32 = a1[2] - 8;
        uint64_t v35 = ((v32 - i) << 9) - 1;
        a1[2] = v32;
        if ((void **)v32 == i) {
          uint64_t v35 = 0;
        }
        unint64_t v9 = a1[4];
      }
      while ((v35 - (a1[5] + v9)) >> 13);
    }
  }
LABEL_35:
  uint64_t result = &i[v9 >> 12];
  if ((void **)a1[2] == i)
  {
    unint64_t v37 = 0;
    if (v17) {
      return result;
    }
  }
  else
  {
    unint64_t v37 = (unint64_t)*result + (v9 & 0xFFF);
    if (v17) {
      return result;
    }
  }
  uint64_t v38 = (uint64_t)&v15[v37 - (void)*result];
  if (v38 < 1) {
    result -= (unint64_t)(4095 - v38) >> 12;
  }
  else {
    result += (unint64_t)v38 >> 12;
  }
  return result;
}

void *std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>,0>@<X0>(const void **a1@<X1>, char *a2@<X2>, const void **a3@<X3>, char *a4@<X4>, const void **a5@<X5>, char *a6@<X6>, const void ***a7@<X8>)
{
  uint64_t v8 = a5;
  if (a1 == a3)
  {
    if (a2 == a4) {
      goto LABEL_46;
    }
    uint64_t v35 = (uint64_t)*a5;
    int64_t v36 = a4;
    while (1)
    {
      unint64_t v37 = &a6[-v35];
      if (v36 - a2 >= (uint64_t)v37) {
        size_t v38 = (size_t)v37;
      }
      else {
        size_t v38 = v36 - a2;
      }
      v36 -= v38;
      a6 -= v38;
      if (v38) {
        uint64_t result = memmove(a6, v36, v38);
      }
      if (v36 == a2) {
        break;
      }
      uint64_t v39 = (uint64_t)*--v8;
      uint64_t v35 = v39;
      a6 = (char *)(v39 + 4096);
    }
    goto LABEL_44;
  }
  int64_t v14 = *a3;
  if (*a3 != a4)
  {
    uint64_t v15 = (uint64_t)*a5;
    uint64_t v16 = a4;
    while (1)
    {
      char v17 = &a6[-v15];
      if (v16 - v14 >= (uint64_t)v17) {
        size_t v18 = (size_t)v17;
      }
      else {
        size_t v18 = v16 - v14;
      }
      v16 -= v18;
      a6 -= v18;
      if (v18) {
        uint64_t result = memmove(a6, v16, v18);
      }
      if (v16 == v14) {
        break;
      }
      uint64_t v20 = (uint64_t)*--v8;
      uint64_t v15 = v20;
      a6 = (char *)(v20 + 4096);
    }
    if ((char *)*v8 + 4096 == a6)
    {
      uint64_t v21 = (char *)v8[1];
      ++v8;
      a6 = v21;
    }
  }
  uint64_t v22 = a3 - 1;
  if (a3 - 1 != a1)
  {
    uint64_t v23 = (char *)*v8;
    do
    {
      uint64_t v24 = *v22;
      uint64_t v25 = (char *)*v22 + 4096;
      while (1)
      {
        unint64_t v26 = (char *)(a6 - v23);
        if (v25 - v24 >= (uint64_t)v26) {
          size_t v27 = (size_t)v26;
        }
        else {
          size_t v27 = v25 - v24;
        }
        v25 -= v27;
        a6 -= v27;
        if (v27) {
          uint64_t result = memmove(a6, v25, v27);
        }
        if (v25 == v24) {
          break;
        }
        unint64_t v28 = (char *)*--v8;
        uint64_t v23 = v28;
        a6 = v28 + 4096;
      }
      uint64_t v23 = (char *)*v8;
      if ((char *)*v8 + 4096 == a6)
      {
        __int16 v29 = (char *)v8[1];
        ++v8;
        uint64_t v23 = v29;
        a6 = v29;
      }
      --v22;
    }
    while (v22 != a1);
  }
  unint64_t v30 = (char *)*a1 + 4096;
  if (v30 != a2)
  {
    uint64_t v31 = (uint64_t)*v8;
    while (1)
    {
      uint64_t v32 = &a6[-v31];
      if (v30 - a2 >= (uint64_t)v32) {
        size_t v33 = (size_t)v32;
      }
      else {
        size_t v33 = v30 - a2;
      }
      v30 -= v33;
      a6 -= v33;
      if (v33) {
        uint64_t result = memmove(a6, v30, v33);
      }
      if (v30 == a2) {
        break;
      }
      uint64_t v34 = (uint64_t)*--v8;
      uint64_t v31 = v34;
      a6 = (char *)(v34 + 4096);
    }
LABEL_44:
    if ((char *)*v8 + 4096 == a6)
    {
      int v40 = (char *)v8[1];
      ++v8;
      a6 = v40;
    }
  }
LABEL_46:
  *a7 = a3;
  a7[1] = (const void **)a4;
  a7[2] = v8;
  a7[3] = (const void **)a6;
  return result;
}

void JetPack::FileStream::position(JetPack::FileStream *this)
{
}

uint64_t JetPack::CommonCryptoBackend::aesGCMDecrypt(JetPack::CommonCryptoBackend *this, const unsigned __int8 *a2, unint64_t a3, const unsigned __int8 *a4, unint64_t a5, const unsigned __int8 *a6, unint64_t a7, const unsigned __int8 *a8, long long a9, unsigned __int8 *a10, unsigned __int8 *a11, unint64_t a12)
{
  if (CCCryptorGCMOneshotDecrypt()) {
    return 4294966296;
  }
  else {
    return 1;
  }
}

uint64_t std::__shared_ptr_emplace<JetPack::PartialStream>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::allocator_traits<std::allocator<JetPack::PartialStream>>::construct[abi:ne180100]<JetPack::PartialStream,std::shared_ptr<JetPack::BaseStream> &,unsigned int &,void>(uint64_t a1, void *a2, uint64_t *a3, unsigned int *a4)
{
  uint64_t v5 = *a3;
  uint64_t v4 = (std::__shared_weak_count *)a3[1];
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = JetPack::UnownedPartialStream::UnownedPartialStream(a2, v5, *a4);
  *uint64_t v6 = &unk_26C9A9AB0;
  v6[4] = v5;
  v6[5] = v4;
  if (v4)
  {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

void sub_218568724(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::allocator_traits<std::allocator<JetPack::PartialStream>>::construct[abi:ne180100]<JetPack::PartialStream,std::shared_ptr<JetPack::BaseStream> &,unsigned int &,void>(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>::operator()(uint64_t a1, uint64_t a2, unsigned __int8 *a3, long long *a4)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, long long *))(a1 + 8);
  uint64_t v6 = *a3;
  long long v10 = *a4;
  *(void *)a4 = 0;
  *((void *)a4 + 1) = 0;
  uint64_t v7 = v5(a2, v6, &v10);
  uint64_t v8 = (std::__shared_weak_count *)*((void *)&v10 + 1);
  if (*((void *)&v10 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v10 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  return v7;
}

void sub_2185687D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::operator()(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t JetPack::parseSegmentContainerHeader(void *a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v15 = 19;
  strcpy(__p, "UnableToParseHeader");
  JetPack::ParseException::ParseException(v12, (uint64_t)__p);
  if (v15 < 0) {
    operator delete(*(void **)__p);
  }
  v12[0].__vftable = (std::exception_vtbl *)&unk_26C9A9F18;
  uint64_t v4 = *(NSObject **)(a2 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__p = 0;
    _os_log_impl(&dword_218564000, v4, OS_LOG_TYPE_DEFAULT, "Reading segment container header", (uint8_t *)__p, 2u);
  }
  uint64_t v5 = *a1;
  __p[0] = 0;
  if ((*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)v5 + 16))(v5, __p, 1) != 1) {
    goto LABEL_14;
  }
  uint64_t v6 = __p[0];
  uint64_t v7 = *(NSObject **)(a2 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__p = 67240192;
    *(_DWORD *)&__p[4] = v6;
    _os_log_impl(&dword_218564000, v7, OS_LOG_TYPE_DEBUG, "Tag is %{public}hhu", (uint8_t *)__p, 8u);
  }
  if ((*(uint64_t (**)(void, char *, uint64_t))(*(void *)*a1 + 16))(*a1, __p, 4) != 4)
  {
LABEL_14:
    exception = (char *)__cxa_allocate_exception(0x20uLL);
    strcpy(exception + 8, "NotEnoughData");
    *((_WORD *)exception + 11) = 0;
    exception[31] = 13;
    *(void *)exception = &unk_26C9A9D60;
  }
  uint64_t v8 = *(unsigned int *)__p;
  unint64_t v9 = *(NSObject **)(a2 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__p = 67240192;
    *(_DWORD *)&__p[4] = v8;
    _os_log_impl(&dword_218564000, v9, OS_LOG_TYPE_DEBUG, "Length is %{public}i", (uint8_t *)__p, 8u);
  }
  v12[0].__vftable = (std::exception_vtbl *)&unk_26C9AA300;
  if (v13 < 0) {
    operator delete(v12[1].__vftable);
  }
  std::exception::~exception(v12);
  return v6 | (v8 << 32);
}

void sub_218568AA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_218568ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::exception a9)
{
}

void sub_218568AF4(void *a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x218568AFCLL);
  }
  __clang_call_terminate(a1);
}

void *JetPack::UnownedPartialStream::UnownedPartialStream(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = &unk_26C9A9D18;
  a1[1] = a2;
  a1[2] = a3;
  a1[3] = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24))(a2);
  return a1;
}

{
  *a1 = &unk_26C9A9D18;
  a1[1] = a2;
  a1[2] = a3;
  a1[3] = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24))(a2);
  return a1;
}

void JetPack::PartialStream::~PartialStream(JetPack::PartialStream *this)
{
  *(void *)this = &unk_26C9A9AB0;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v1)
  {
    if (!atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26C9A9AB0;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
  JUMPOUT(0x21D46C1B0);
}

uint64_t JetPack::readSegment(uint64_t a1, int a2, JetPack **a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t DataSegment = 1;
  switch(a2)
  {
    case 1:
      return DataSegment;
    case 2:
      uint64_t v6 = *(NSObject **)(a1 + 24);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218564000, v6, OS_LOG_TYPE_DEBUG, "Reading data segment", buf, 2u);
      }
      uint64_t v7 = (std::__shared_weak_count *)a3[1];
      uint64_t v22 = *a3;
      uint64_t v23 = v7;
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t DataSegment = JetPack::readDataSegment(a1, (uint64_t)&v22);
      uint64_t v8 = v23;
      if (!v23) {
        return DataSegment;
      }
      goto LABEL_24;
    case 3:
      uint64_t v11 = *(NSObject **)(a1 + 24);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218564000, v11, OS_LOG_TYPE_DEBUG, "Reading serialization segment", buf, 2u);
      }
      uint64_t v12 = (std::__shared_weak_count *)a3[1];
      v19[2] = *a3;
      uint64_t v20 = v12;
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t DataSegment = JetPack::readSerializationSegment();
      uint64_t v8 = v20;
      if (!v20) {
        return DataSegment;
      }
LABEL_24:
      if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
      return DataSegment;
    case 4:
      char v13 = *(NSObject **)(a1 + 24);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218564000, v13, OS_LOG_TYPE_DEBUG, "Reading brotli segment", buf, 2u);
      }
      int64_t v14 = a3[1];
      v21[0] = *a3;
      v21[1] = v14;
      if (v14) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v14 + 1, 1uLL, memory_order_relaxed);
      }
      JetPack::readBrotliSegment(a1, (uint64_t)v21);
    case 7:
      unint64_t v9 = *(NSObject **)(a1 + 24);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218564000, v9, OS_LOG_TYPE_DEBUG, "Reading encryption segment", buf, 2u);
      }
      long long v10 = (atomic_ullong *)a3[1];
      v19[0] = *a3;
      v19[1] = (JetPack *)v10;
      if (v10) {
        atomic_fetch_add_explicit(v10 + 1, 1uLL, memory_order_relaxed);
      }
      JetPack::readEncryptedSegment(a1, v19);
    default:
      char v17 = *(NSObject **)(a1 + 24);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67240192;
        int v25 = a2;
        _os_log_impl(&dword_218564000, v17, OS_LOG_TYPE_ERROR, "Unable to find segment for tag %{public}i", buf, 8u);
      }
      exception = (JetPack::InvalidSegmentTagException *)__cxa_allocate_exception(0x28uLL);
      JetPack::InvalidSegmentTagException::InvalidSegmentTagException(exception, a2);
  }
}

void sub_218568F1C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_218568F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t JetPack::signingChunkForDataBlock@<X0>(char **a1@<X0>, char **a2@<X1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  int64_t v6 = a2[1] - *a2;
  int64_t v7 = a1[1] - *a1;
  int64_t v8 = v7 + v6;
  if (v7 + v6)
  {
    if (v8 < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = (char *)operator new(v7 + v6);
    *a3 = v9;
    a3[1] = v9;
    a3[2] = &v9[v8];
  }
  __int16 v15 = v6;
  i = a3;
  std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100]((uint64_t)&i, (char *)&v15);
  uint64_t result = std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100]((uint64_t)&i, (char *)&v15 + 1);
  uint64_t v12 = *a2;
  uint64_t v11 = a2[1];
  for (i = a3; v12 != v11; ++v12)
    uint64_t result = std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100]((uint64_t)&i, v12);
  int64_t v14 = *a1;
  char v13 = a1[1];
  for (i = a3; v14 != v13; ++v14)
    uint64_t result = std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100]((uint64_t)&i, v14);
  return result;
}

void sub_218569060(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100](uint64_t a1, char *a2)
{
  uint64_t v4 = *(void **)a1;
  int64_t v6 = *(char **)(*(void *)a1 + 8);
  unint64_t v5 = *(void *)(*(void *)a1 + 16);
  int64_t v7 = v6;
  if ((unint64_t)v6 < v5)
  {
    *int64_t v6 = *a2;
    uint64_t v8 = (uint64_t)(v6 + 1);
    goto LABEL_32;
  }
  unint64_t v9 = (char *)*v4;
  unint64_t v10 = (unint64_t)&v6[-*v4];
  unint64_t v11 = v10 + 1;
  if ((uint64_t)(v10 + 1) < 0) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  unint64_t v12 = v5 - (void)v9;
  if (2 * v12 > v11) {
    unint64_t v11 = 2 * v12;
  }
  if (v12 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v13 = v11;
  }
  if (v13) {
    int64_t v14 = operator new(v13);
  }
  else {
    int64_t v14 = 0;
  }
  __int16 v15 = &v14[v10];
  uint64_t v16 = &v14[v13];
  v14[v10] = *a2;
  uint64_t v8 = (uint64_t)&v14[v10 + 1];
  if (v6 == v9)
  {
    v14 += v10;
    goto LABEL_30;
  }
  if (v10 >= 8 && (unint64_t)(v9 - v14) >= 0x20)
  {
    if (v10 < 0x20)
    {
      unint64_t v17 = 0;
      goto LABEL_22;
    }
    unint64_t v17 = v10 & 0xFFFFFFFFFFFFFFE0;
    size_t v18 = (long long *)(v6 - 16);
    uint64_t v19 = &v14[v6 - 16 - v9];
    unint64_t v20 = v10 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v21 = *v18;
      *(v19 - 1) = *(v18 - 1);
      _OWORD *v19 = v21;
      v19 -= 2;
      v18 -= 2;
      v20 -= 32;
    }
    while (v20);
    if (v10 == v17) {
      goto LABEL_29;
    }
    if ((v10 & 0x18) != 0)
    {
LABEL_22:
      int64_t v7 = &v6[-(v10 & 0xFFFFFFFFFFFFFFF8)];
      v15 -= v10 & 0xFFFFFFFFFFFFFFF8;
      uint64_t v22 = &v6[-v17 - 8];
      uint64_t v23 = &v14[v22 - v9];
      unint64_t v24 = v17 - (v10 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v25 = *(void *)v22;
        v22 -= 8;
        *v23-- = v25;
        v24 += 8;
      }
      while (v24);
      if (v10 == (v10 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_29;
      }
      goto LABEL_27;
    }
    v15 -= v17;
    int64_t v7 = &v6[-v17];
  }
LABEL_27:
  uint64_t v26 = v15 - 1;
  do
  {
    char v27 = *--v7;
    *v26-- = v27;
  }
  while (v7 != v9);
LABEL_29:
  int64_t v7 = (char *)*v4;
LABEL_30:
  void *v4 = v14;
  v4[1] = v8;
  v4[2] = v16;
  if (v7) {
    operator delete(v7);
  }
LABEL_32:
  v4[1] = v8;
  return a1;
}

uint64_t std::optional<std::vector<unsigned char>>::operator=[abi:ne180100]<std::vector<unsigned char>&,void>(uint64_t a1, char **a2)
{
  if (*(unsigned char *)(a1 + 24))
  {
    if ((char **)a1 != a2) {
      std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>((void *)a1, *a2, a2[1], a2[1] - *a2);
    }
  }
  else
  {
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    uint64_t v4 = *a2;
    uint64_t v3 = a2[1];
    size_t v5 = v3 - *a2;
    if (v3 != *a2)
    {
      if ((v5 & 0x8000000000000000) != 0) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      int64_t v6 = (char *)operator new(v3 - *a2);
      *(void *)a1 = v6;
      *(void *)(a1 + 8) = v6;
      int64_t v7 = &v6[v5];
      *(void *)(a1 + 16) = &v6[v5];
      memcpy(v6, v4, v5);
      *(void *)(a1 + 8) = v7;
    }
    *(unsigned char *)(a1 + 24) = 1;
  }
  return a1;
}

void sub_2185692DC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void JetPack::SignedStreamDecoder::fill(JetPack::SignedStreamDecoder *this, unint64_t a2)
{
  while (*((void *)this + 6) < a2)
  {
    if ((*(uint64_t (**)(JetPack::SignedStreamDecoder *))(*(void *)this + 64))(this)) {
      break;
    }
    JetPack::SignedStreamDecoder::readBlock(this);
  }
}

void *std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, char *__src, char *a3, unint64_t a4)
{
  int64_t v7 = result;
  unint64_t v8 = result[2];
  unint64_t v9 = (char *)*result;
  if (v8 - *result < a4)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      unint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0) {
      goto LABEL_23;
    }
    uint64_t v10 = 2 * v8;
    if (2 * v8 <= a4) {
      uint64_t v10 = a4;
    }
    size_t v11 = v8 >= 0x3FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v10;
    if ((v11 & 0x8000000000000000) != 0) {
LABEL_23:
    }
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    uint64_t result = operator new(v11);
    unint64_t v9 = (char *)result;
    void *v7 = result;
    v7[1] = result;
    v7[2] = (char *)result + v11;
    size_t v12 = a3 - __src;
    if (v12) {
      uint64_t result = memcpy(result, __src, v12);
    }
LABEL_21:
    uint64_t v16 = &v9[v12];
    goto LABEL_22;
  }
  size_t v13 = (unsigned char *)result[1];
  size_t v14 = v13 - v9;
  if (v13 - v9 >= a4)
  {
    size_t v12 = a3 - __src;
    if (v12) {
      uint64_t result = memmove((void *)*result, __src, v12);
    }
    goto LABEL_21;
  }
  __int16 v15 = &__src[v14];
  if (v13 != v9)
  {
    uint64_t result = memmove((void *)*result, __src, v14);
    unint64_t v9 = (char *)v7[1];
  }
  if (a3 != v15) {
    uint64_t result = memmove(v9, v15, a3 - v15);
  }
  uint64_t v16 = &v9[a3 - v15];
LABEL_22:
  v7[1] = v16;
  return result;
}

uint64_t JetPack::UnsafeIgnoreSignatureVerifier::signatureIsValid()
{
  return 1;
}

uint64_t JetPack::detail::closeCallback()
{
  return 0;
}

uint64_t JetPack::detail::openCallback()
{
  return 0;
}

void JetPack::AESDecoderStream::~AESDecoderStream(JetPack::AESDecoderStream *this)
{
  *(void *)this = &unk_26C9A9BE8;
  uint64_t v2 = (void *)*((void *)this + 17);
  if (v2)
  {
    *((void *)this + 18) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  std::deque<unsigned char>::~deque[abi:ne180100]((uint64_t)this + 64);
  uint64_t v4 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  size_t v5 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v5)
  {
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

{
  void *v2;
  void *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  uint64_t vars8;

  *(void *)this = &unk_26C9A9BE8;
  uint64_t v2 = (void *)*((void *)this + 17);
  if (v2)
  {
    *((void *)this + 18) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 14);
  if (v3)
  {
    *((void *)this + 15) = v3;
    operator delete(v3);
  }
  std::deque<unsigned char>::~deque[abi:ne180100]((uint64_t)this + 64);
  uint64_t v4 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  size_t v5 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  JUMPOUT(0x21D46C1B0);
}

void JetPack::UnsafeIgnoreSignatureVerifier::~UnsafeIgnoreSignatureVerifier(JetPack::UnsafeIgnoreSignatureVerifier *this)
{
}

void JetPack::readEncryptedSegment(uint64_t a1, JetPack **a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  __p = operator new(0x20uLL);
  *(_OWORD *)size_t v13 = xmmword_21857B960;
  strcpy((char *)__p, "UnableToParseEncryptedSegment");
  JetPack::ParseException::ParseException(&v11, (uint64_t)&__p);
  if (SHIBYTE(v13[1]) < 0) {
    operator delete(__p);
  }
  v11.__vftable = (std::exception_vtbl *)&unk_26C9AA238;
  uint64_t v16 = &unk_26C9A9C30;
  v14[0] = 4;
  {
    JetPack::getSharedOSLog(void)::log = (uint64_t)os_log_create("com.apple.JetPack", "Diagnostics");
  }
  uint64_t v15 = JetPack::getSharedOSLog(void)::log;
  JetPack::parseEncryptedSegmentHeader(*a2, (JetPack::BaseStream *)v14, (uint64_t)&__p);
  if (*(unsigned char *)(a1 + 64))
  {
    LOWORD(v17) = (_WORD)__p;
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4)
    {
      (*(void (**)(long long *__return_ptr))(*(void *)v4 + 48))(&v20);
      if (v21)
      {
        *(_OWORD *)uint64_t v19 = v20;
        if (JetPack::CommonCryptoBackend::deriveKey((JetPack::CommonCryptoBackend *)&v16, (const unsigned __int8 *)v13[0], (char *)v13[1] - (char *)v13[0], v19, 0x10uLL, v18) == 1)
        {
          if (HIDWORD(__p) < 0x8000001)
          {
            size_t v5 = operator new(0xB8uLL);
            v5[1] = 0;
            v5[2] = 0;
            void *v5 = &unk_26C9AA760;
            std::allocator<JetPack::AESDecoderStream>::construct[abi:ne180100]<JetPack::AESDecoderStream,std::shared_ptr<JetPack::BaseStream> &,std::array<unsigned char,16ul> &,unsigned int &>((uint64_t)&v17, (uint64_t)(v5 + 3), (uint64_t *)a2);
          }
          exception = (JetPack::BlockExceedsMaximumSizeException *)__cxa_allocate_exception(0x20uLL);
          JetPack::BlockExceedsMaximumSizeException::BlockExceedsMaximumSizeException(exception);
        }
        else
        {
          exception = (JetPack::BlockExceedsMaximumSizeException *)__cxa_allocate_exception(0x28uLL);
          int v9 = JetPack::CommonCryptoBackend::deriveKey((JetPack::CommonCryptoBackend *)&v16, (const unsigned __int8 *)v13[0], (char *)v13[1] - (char *)v13[0], v19, 0x10uLL, v18);
          JetPack::CommonCryptoInvalidStatusException::CommonCryptoInvalidStatusException(exception, v9);
        }
        __cxa_throw(exception, v10, (void (*)(void *))JetPack::NotEnoughDataException::~NotEnoughDataException);
      }
      int64_t v7 = (JetPack::MissingEncryptionKeyException *)__cxa_allocate_exception(0x28uLL);
      JetPack::MissingEncryptionKeyException::MissingEncryptionKeyException(v7, (unsigned __int16)__p);
    }
    std::__throw_bad_function_call[abi:ne180100]();
  }
  int64_t v6 = (JetPack::KeyProviderNotSpecifiedException *)__cxa_allocate_exception(0x20uLL);
  JetPack::KeyProviderNotSpecifiedException::KeyProviderNotSpecifiedException(v6);
}

void sub_218569B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::exception a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, char a16, uint64_t a17, void *a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  __cxa_free_exception(v25);
  if (__p)
  {
    a20 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseEncryptedSegmentException &>((uint64_t)&a10);
  }
  JetPack::NotEnoughDataException::~NotEnoughDataException(&a10);
  _Unwind_Resume(a1);
}

void sub_218569C4C()
{
}

void sub_218569C64(void *a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x218569C6CLL);
  }
  __clang_call_terminate(a1);
}

uint64_t JetPack::readDataSegment(uint64_t a1, uint64_t a2)
{
  v16.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&v16.__r_.__value_.__r.__words[1] = xmmword_21857B550;
  strcpy(v16.__r_.__value_.__l.__data_, "UnableToParseDataSegment");
  JetPack::ParseException::ParseException(v11, (uint64_t)&v16);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }
  v11[0].__vftable = (std::exception_vtbl *)&unk_26C9AA0A8;
  JetPack::parseDataSegmentHeader(*(JetPack **)a2, (JetPack::BaseStream *)(a1 + 16), (char *)&v16);
  if (!*(unsigned char *)(a1 + 144))
  {
LABEL_17:
    uint64_t v9 = 1;
    if ((SHIBYTE(v16.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v4 = *(NSObject **)(a1 + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_218564000, v4, OS_LOG_TYPE_DEBUG, "Found data segment handler", (uint8_t *)&buf, 2u);
    if (!*(unsigned char *)(a1 + 144)) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&buf, v16.__r_.__value_.__l.__data_, v16.__r_.__value_.__l.__size_);
  }
  else {
    std::string buf = v16;
  }
  size_t v5 = *(std::__shared_weak_count **)(a2 + 8);
  size_t v13 = *(JetPack **)a2;
  size_t v14 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = *(void *)(a1 + 136);
  if (!v6) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  char v7 = (*(uint64_t (**)(uint64_t, uint64_t, std::string *, JetPack **))(*(void *)v6 + 48))(v6, a1, &buf, &v13);
  unint64_t v8 = v14;
  if (!v14 || atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_15;
    }
LABEL_23:
    operator delete(buf.__r_.__value_.__l.__data_);
    if (v7) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }
  ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
  std::__shared_weak_count::__release_weak(v8);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_23;
  }
LABEL_15:
  if (v7)
  {
LABEL_16:
    (*(void (**)(void))(**(void **)a2 + 40))();
    goto LABEL_17;
  }
LABEL_24:
  uint64_t v9 = 0;
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
LABEL_18:
  }
    operator delete(v16.__r_.__value_.__l.__data_);
LABEL_19:
  v11[0].__vftable = (std::exception_vtbl *)&unk_26C9AA300;
  if (v12 < 0) {
    operator delete(v11[1].__vftable);
  }
  std::exception::~exception(v11);
  return v9;
}

void sub_218569EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (*(char *)(v20 - 33) < 0)
  {
    operator delete(*(void **)(v20 - 56));
    if (a2 != 1) {
      goto LABEL_6;
    }
  }
  else if (a2 != 1)
  {
LABEL_6:
    JetPack::NotEnoughDataException::~NotEnoughDataException((std::exception *)&a9);
    _Unwind_Resume(a1);
  }
  __cxa_begin_catch(a1);
  std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseDataSegmentException &>((uint64_t)&a9);
}

void sub_218569F9C()
{
}

uint64_t std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  *(_OWORD *)__p = *(_OWORD *)a3;
  uint64_t v12 = *(void *)(a3 + 16);
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  uint64_t v5 = *a4;
  uint64_t v6 = (std::__shared_weak_count *)a4[1];
  *a4 = 0;
  a4[1] = 0;
  if (v6)
  {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v13 = v5;
    size_t v14 = v6;
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  else
  {
    uint64_t v13 = v5;
    size_t v14 = 0;
  }
  if (v12 >= 0) {
    char v7 = __p;
  }
  else {
    char v7 = (void **)__p[0];
  }
  uint64_t v8 = (*(uint64_t (**)(void, void **, uint64_t *))(a1 + 8))(*(void *)(a1 + 16), v7, &v13);
  uint64_t v9 = v14;
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
    if ((SHIBYTE(v12) & 0x80000000) == 0) {
      return v8;
    }
    goto LABEL_14;
  }
  if (SHIBYTE(v12) < 0) {
LABEL_14:
  }
    operator delete(__p[0]);
  return v8;
}

void sub_21856A134(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  if (a17) {
    std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::operator()(a17);
  }
  if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t dataSegmentFound(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = JetPackReaderGetProperty(a1, 0);
  uint64_t v6 = [v5 dataSegmentFound];

  if (v6)
  {
    if (a2) {
      char v7 = (__CFString *)[[NSString alloc] initWithUTF8String:a2];
    }
    else {
      char v7 = &stru_26C9AAC18;
    }
    uint64_t v9 = [[JPStream alloc] initWithBacking:a3 releaseOnDealloc:0];
    uint64_t v10 = [v5 dataSegmentFound];
    uint64_t v8 = ((uint64_t (**)(void, __CFString *, JPStream *))v10)[2](v10, v7, v9);
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

uint64_t JetPackFileEntryGetPathname(JetPack::DiagnosticContext *a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1;
  v8[0] = 4;
  unint64_t v4 = 0x26AB31000uLL;
  {
    unint64_t v4 = 0x26AB31000;
    uint64_t v3 = a1;
    if (v6)
    {
      JetPack::getSharedOSLog(void)::log = (uint64_t)os_log_create("com.apple.JetPack", "Diagnostics");
      unint64_t v4 = 0x26AB31000;
      uint64_t v3 = a1;
    }
  }
  uint64_t v9 = *(void *)(v4 + 2200);
  return JetPack::FileEntryGetPathname((JetPack *)v8, v3, a3);
}

uint64_t JetPack::FileEntryGetPathname(JetPack *this, JetPack::DiagnosticContext *a2, void *a3)
{
  return archive_entry_pathname();
}

BOOL JetPack::readSerializationSegment()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v27 = *MEMORY[0x263EF8340];
  __p = operator new(0x28uLL);
  long long v26 = xmmword_21857B7E0;
  strcpy((char *)__p, "UnableToParseSerializationSegment");
  JetPack::ParseException::ParseException(v19, (uint64_t)&__p);
  if (SHIBYTE(v26) < 0) {
    operator delete(__p);
  }
  v19[0].__vftable = (std::exception_vtbl *)&unk_26C9AA2B0;
  __p = *v2;
  uint64_t v4 = archive_read_new();
  uint64_t v23 = 0;
  archive_read_support_format_all();
  if (archive_read_open())
  {
    unint64_t v17 = archive_error_string();
    JetPack::archiveErrorToString(v17, &v22);
    exception = __cxa_allocate_exception(0x20uLL);
    if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v21, v22.__r_.__value_.__l.__data_, v22.__r_.__value_.__l.__size_);
    }
    else {
      std::string v21 = v22;
    }
    JetPack::LibArchiveException::LibArchiveException(exception, (uint64_t)&v21);
  }
  while (1)
  {
    while (1)
    {
      int next_header = archive_read_next_header();
      int v6 = next_header;
      if (next_header == 1)
      {
        archive_read_close();
        goto LABEL_16;
      }
      if (next_header)
      {
        uint64_t v15 = __cxa_allocate_exception(0x20uLL);
        unint64_t v16 = archive_error_string();
        JetPack::archiveErrorToString(v16, &v22);
        JetPack::LibArchiveException::LibArchiveException(v15, (uint64_t)&v22);
      }
      char v7 = (char *)operator new(0x58uLL);
      uint64_t v8 = (std::__shared_weak_count *)v7;
      *((void *)v7 + 1) = 0;
      *((void *)v7 + 2) = 0;
      *(void *)char v7 = &unk_26C9AA6B8;
      *((void *)v7 + 3) = &unk_26C9A9A68;
      *((void *)v7 + 4) = v4;
      *(_OWORD *)(v7 + 40) = 0u;
      *(_OWORD *)(v7 + 56) = 0u;
      *(_OWORD *)(v7 + 65) = 0u;
      v22.__r_.__value_.__r.__words[0] = (std::string::size_type)(v7 + 24);
      v22.__r_.__value_.__l.__size_ = (std::string::size_type)v7;
      if (*(unsigned char *)(v3 + 184)) {
        break;
      }
LABEL_13:
      if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    uint64_t v9 = v23;
    v21.__r_.__value_.__r.__words[0] = (std::string::size_type)(v7 + 24);
    v21.__r_.__value_.__l.__size_ = (std::string::size_type)v7;
    atomic_fetch_add_explicit((atomic_ullong *volatile)v7 + 1, 1uLL, memory_order_relaxed);
    uint64_t v24 = v9;
    uint64_t v10 = *(void *)(v3 + 176);
    if (!v10) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, std::string *))(*(void *)v10 + 48))(v10, v3, &v24, &v21);
    std::string::size_type size = (std::__shared_weak_count *)v21.__r_.__value_.__l.__size_;
    if (v21.__r_.__value_.__l.__size_
      && !atomic_fetch_add((atomic_ullong *volatile)(v21.__r_.__value_.__l.__size_ + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
    if ((v11 & 1) == 0) {
      break;
    }
    uint64_t v8 = (std::__shared_weak_count *)v22.__r_.__value_.__l.__size_;
    if (v22.__r_.__value_.__l.__size_) {
      goto LABEL_13;
    }
  }
  archive_read_close();
  size_t v14 = (std::__shared_weak_count *)v22.__r_.__value_.__l.__size_;
  if (v22.__r_.__value_.__l.__size_
    && !atomic_fetch_add((atomic_ullong *volatile)(v22.__r_.__value_.__l.__size_ + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
LABEL_16:
  if (v4) {
    archive_read_free();
  }
  v19[0].__vftable = (std::exception_vtbl *)&unk_26C9AA300;
  if (v20 < 0) {
    operator delete(v19[1].__vftable);
  }
  std::exception::~exception(v19);
  return v6 == 1;
}

void sub_21856A7C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  __cxa_free_exception(v33);
  if (a24 < 0) {
    operator delete(__p);
  }
  if (v32) {
    archive_read_free();
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseSerializationSegmentException &>((uint64_t)&a9);
  }
  JetPack::NotEnoughDataException::~NotEnoughDataException((std::exception *)&a9);
  _Unwind_Resume(a1);
}

void sub_21856A8E8()
{
}

void sub_21856A900(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t std::__shared_ptr_emplace<JetPack::ArchiveStream>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t std::__function::__func<JetPackReaderSetFileEntryFoundCallback::$_0,std::allocator<JetPackReaderSetFileEntryFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::operator()(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v5 = *a3;
  uint64_t v6 = *a4;
  char v7 = (std::__shared_weak_count *)a4[1];
  *a4 = 0;
  a4[1] = 0;
  if (v7)
  {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v11 = v6;
    uint64_t v12 = v7;
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  else
  {
    uint64_t v11 = v6;
    uint64_t v12 = 0;
  }
  uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t *))(a1 + 8))(*(void *)(a1 + 16), v5, &v11);
  uint64_t v9 = v12;
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  return v8;
}

void sub_21856AA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::operator()(a10);
  }
  std::__function::__func<JetPackReaderSetFileEntryFoundCallback::$_0,std::allocator<JetPackReaderSetFileEntryFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::operator()((uint64_t)&a9, v10 == 0, v10);
  _Unwind_Resume(a1);
}

uint64_t fileEntryFound(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = JetPackReaderGetProperty(a1, 0);
  uint64_t v6 = [v5 fileEntryFound];

  if (v6)
  {
    char v7 = [[JPFileEntry alloc] initWithBacking:a2 releaseOnDealloc:0];
    uint64_t v8 = [[JPStream alloc] initWithBacking:a3 releaseOnDealloc:0];
    uint64_t v9 = [v5 fileEntryFound];
    uint64_t v10 = ((uint64_t (**)(void, JPFileEntry *, JPStream *))v9)[2](v9, v7, v8);
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

uint64_t JetPackReaderGetProperty(uint64_t a1, int a2)
{
  if (!a1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    if (a2) {
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v4 = *v2;
    if (!v3) {
      return v4;
    }
    goto LABEL_9;
  }
  uint64_t v2 = *(uint64_t **)a1;
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 8);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!a2) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v4 = 0;
  if (!v3) {
    return v4;
  }
LABEL_9:
  if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  return v4;
}

void JetPack::parseDataSegmentHeader(JetPack *this@<X0>, JetPack::BaseStream *a2@<X1>, char *a3@<X8>)
{
  __p[3] = *(void **)MEMORY[0x263EF8340];
  HIBYTE(__p[2]) = 19;
  strcpy((char *)__p, "UnableToParseHeader");
  JetPack::ParseException::ParseException(v13, (uint64_t)__p);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  v13[0].__vftable = (std::exception_vtbl *)&unk_26C9A9F18;
  char v7 = *((void *)a2 + 1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_218564000, v7, OS_LOG_TYPE_DEFAULT, "Reading data segment header", (uint8_t *)__p, 2u);
  }
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  *((void *)a3 + 2) = 0;
  LOBYTE(__p[0]) = 0;
  if ((*(uint64_t (**)(JetPack *, void **, uint64_t))(*(void *)this + 16))(this, __p, 1) != 1)
  {
    exception = (char *)__cxa_allocate_exception(0x20uLL);
    strcpy(exception + 8, "NotEnoughData");
    *((_WORD *)exception + 11) = 0;
    exception[31] = 13;
    *(void *)exception = &unk_26C9A9D60;
  }
  size_t v8 = LOBYTE(__p[0]);
  uint64_t v9 = *((void *)a2 + 1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(__p[0]) = 67240192;
    HIDWORD(__p[0]) = v8;
    _os_log_impl(&dword_218564000, v9, OS_LOG_TYPE_DEBUG, "Name length is %{public}i", (uint8_t *)__p, 8u);
  }
  readString(this, v8, (char *)__p);
  *(_OWORD *)a3 = *(_OWORD *)__p;
  *((void **)a3 + 2) = __p[2];
  uint64_t v10 = *((void *)a2 + 1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    if (a3[23] >= 0) {
      uint64_t v11 = a3;
    }
    else {
      uint64_t v11 = *(char **)a3;
    }
    LODWORD(__p[0]) = 136446210;
    *(void **)((char *)__p + 4) = v11;
    _os_log_impl(&dword_218564000, v10, OS_LOG_TYPE_DEBUG, "Name is %{public}s", (uint8_t *)__p, 0xCu);
  }
  v13[0].__vftable = (std::exception_vtbl *)&unk_26C9AA300;
  if (v14 < 0) {
    operator delete(v13[1].__vftable);
  }
  std::exception::~exception(v13);
}

void sub_21856AFE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21856B020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::exception a9)
{
}

void sub_21856B038(void *a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x21856B040);
  }
  __clang_call_terminate(a1);
}

uint64_t JetPack::readRootSegment(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  __p = operator new(0x20uLL);
  long long v36 = xmmword_21857B550;
  strcpy((char *)__p, "UnableToParseRootSegment");
  JetPack::ParseException::ParseException(v29, (uint64_t)&__p);
  if (SHIBYTE(v36) < 0) {
    operator delete(__p);
  }
  v29[0].__vftable = (std::exception_vtbl *)&unk_26C9AA0D0;
  uint64_t v9 = JetPack::parseRootHeader(*(JetPack **)a2, (JetPack::BaseStream *)(a1 + 16), v8);
  unsigned __int8 v11 = v10;
  uint64_t v38 = v9;
  __int16 v39 = v10;
  if (v9 != 0xA6B63615074654ALL)
  {
    std::string v21 = *(NSObject **)(a1 + 24);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_218564000, v21, OS_LOG_TYPE_ERROR, "Magic number does not match expectation", (uint8_t *)&__p, 2u);
    }
    exception = (char *)__cxa_allocate_exception(0x20uLL);
    strcpy(exception + 8, "InvalidMagicNumber");
    exception[31] = 18;
    *(void *)exception = &unk_26C9A9EC8;
  }
  if ((v10 & 0xFE) == 0)
  {
    uint64_t v23 = *(NSObject **)(a1 + 24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p) = 67240192;
      HIDWORD(__p) = v11;
      _os_log_impl(&dword_218564000, v23, OS_LOG_TYPE_ERROR, "Unsupported version %{public}i", (uint8_t *)&__p, 8u);
    }
    uint64_t v24 = (JetPack::UnsupportedJetPackVersionException *)__cxa_allocate_exception(0x20uLL);
    JetPack::UnsupportedJetPackVersionException::UnsupportedJetPackVersionException(v24);
  }
  if (*(unsigned char *)(a1 + 104))
  {
    uint64_t v12 = *(NSObject **)(a1 + 24);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_218564000, v12, OS_LOG_TYPE_DEBUG, "Calling didReadHeader callback", (uint8_t *)&__p, 2u);
      if (!*(unsigned char *)(a1 + 104)) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
    }
    uint64_t v13 = *(void *)(a1 + 96);
    if (!v13) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)v13 + 48))(v13, a1, &v38);
  }
  char v14 = *(std::__shared_weak_count **)(a2 + 8);
  size_t v33 = *(JetPack **)a2;
  uint64_t v34 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (a3 && !HIBYTE(v39))
  {
    uint64_t v25 = *(NSObject **)(a1 + 24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_218564000, v25, OS_LOG_TYPE_ERROR, "JetPack is not signed even though a signature is required", (uint8_t *)&__p, 2u);
    }
    long long v26 = (char *)__cxa_allocate_exception(0x20uLL);
    strcpy(v26 + 8, "MissingSignature");
    v26[31] = 16;
    *(void *)long long v26 = &unk_26C9A9DF8;
  }
  if (HIBYTE(v39))
  {
    uint64_t v15 = *(NSObject **)(a1 + 24);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_218564000, v15, OS_LOG_TYPE_DEBUG, "Header specifies JetPack is signed", (uint8_t *)&__p, 2u);
    }
    if (!*a4)
    {
      uint64_t v27 = *(NSObject **)(a1 + 24);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p) = 0;
        _os_log_impl(&dword_218564000, v27, OS_LOG_TYPE_ERROR, "JetPack is signed but no verifier is provided", (uint8_t *)&__p, 2u);
      }
      unint64_t v28 = (JetPack::SignatureVerifierRequiredException *)__cxa_allocate_exception(0x20uLL);
      JetPack::SignatureVerifierRequiredException::SignatureVerifierRequiredException(v28);
    }
    unint64_t v16 = (std::__shared_weak_count *)operator new(0xA0uLL);
    v16->__shared_owners_ = 0;
    v16->__shared_weak_owners_ = 0;
    v16->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA798;
    std::allocator<JetPack::SignedStreamDecoder>::construct[abi:ne180100]<JetPack::SignedStreamDecoder,std::shared_ptr<JetPack::BaseStream> &,std::shared_ptr<JetPack::SignatureVerifier> &>((uint64_t)&__p, (uint64_t)&v16[1], (uint64_t *)a2, a4);
    size_t v33 = (JetPack *)&v16[1];
    uint64_t v34 = v16;
    if (!v14)
    {
      uint64_t v31 = (JetPack *)&v16[1];
      uint64_t v32 = v16;
      goto LABEL_24;
    }
    if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  unint64_t v16 = v34;
  uint64_t v31 = v33;
  uint64_t v32 = v34;
  if (v34) {
LABEL_24:
  }
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  __p = &unk_26C9AA380;
  *(void *)&long long v36 = JetPack::readSegmentContainer;
  p_p = &__p;
  uint64_t v17 = JetPack::readMultiSegmentContainer(a1, (uint64_t *)&v31, &__p);
  if (p_p == &__p)
  {
    (*((void (**)(void **))__p + 4))(&__p);
    size_t v18 = v32;
    if (!v32) {
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  if (p_p) {
    (*((void (**)(void))*p_p + 5))();
  }
  size_t v18 = v32;
  if (v32)
  {
LABEL_31:
    if (!atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
LABEL_33:
  uint64_t v19 = v34;
  if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
  v29[0].__vftable = (std::exception_vtbl *)&unk_26C9AA300;
  if (v30 < 0) {
    operator delete(v29[1].__vftable);
  }
  std::exception::~exception(v29);
  return v17;
}

void sub_21856B6E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  __cxa_free_exception(v22);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseRootSegmentException &>((uint64_t)&a9);
  }
  JetPack::NotEnoughDataException::~NotEnoughDataException((std::exception *)&a9);
  _Unwind_Resume(a1);
}

void sub_21856B79C()
{
}

void sub_21856B7B4(void *a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x21856B7BCLL);
  }
  __clang_call_terminate(a1);
}

uint64_t JetPack::readMultiSegmentContainer(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(NSObject **)(a1 + 24);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_218564000, v6, OS_LOG_TYPE_DEFAULT, "Reading multi segment container", buf, 2u);
  }
  int v7 = 0;
  do
  {
    size_t v8 = *(NSObject **)(a1 + 24);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)std::string buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_218564000, v8, OS_LOG_TYPE_DEBUG, "Reading segment %{public}i", buf, 8u);
    }
    JetPack::UnableToParseMultiSegmentException::UnableToParseMultiSegmentException((JetPack::UnableToParseMultiSegmentException *)&v20, v7);
    uint64_t v23 = a1;
    uint64_t v9 = a3[3];
    if (!v9) {
      goto LABEL_9;
    }
    if ((void *)v9 != a3)
    {
      uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 16))(v9);
LABEL_9:
      uint64_t v25 = (void *)v9;
      goto LABEL_11;
    }
    uint64_t v25 = v24;
    (*(void (**)(void *, void *))(*a3 + 24))(a3, v24);
LABEL_11:
    uint64_t v10 = *a2;
    unsigned __int8 v11 = (std::__shared_weak_count *)a2[1];
    uint64_t v26 = *a2;
    uint64_t v27 = v11;
    if (v11)
    {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v12 = v23;
      *(void *)std::string buf = v26;
      __int16 v29 = v27;
      if (v27) {
        atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v13 = v25;
      if (!v25) {
LABEL_33:
      }
        std::__throw_bad_function_call[abi:ne180100]();
    }
    else
    {
      uint64_t v12 = v23;
      *(void *)std::string buf = v10;
      __int16 v29 = 0;
      uint64_t v13 = v25;
      if (!v25) {
        goto LABEL_33;
      }
    }
    uint64_t v14 = (*(uint64_t (**)(void *, uint64_t, uint8_t *))(*v13 + 48))(v13, v12, buf);
    uint64_t v15 = v29;
    if (v29 && !atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
      unint64_t v16 = v27;
      if (!v27) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v16 = v27;
      if (!v27) {
        goto LABEL_23;
      }
    }
    if (!atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
LABEL_23:
    if (v25 == v24)
    {
      (*(void (**)(void *))(v24[0] + 32))(v24);
    }
    else if (v25)
    {
      (*(void (**)(void))(*v25 + 40))();
    }
    v20.__vftable = (std::exception_vtbl *)&unk_26C9AA300;
    if (v22 < 0) {
      operator delete(__p);
    }
    std::exception::~exception(&v20);
    if ((v14 & 1) == 0) {
      break;
    }
    uint64_t v17 = *a2;
    buf[0] = 0;
    if ((*(uint64_t (**)(uint64_t, uint8_t *, uint64_t))(*(void *)v17 + 16))(v17, buf, 1) != 1)
    {
      exception = (char *)__cxa_allocate_exception(0x20uLL);
      strcpy(exception + 8, "NotEnoughData");
      *((_WORD *)exception + 11) = 0;
      exception[31] = 13;
      *(void *)exception = &unk_26C9A9D60;
    }
    ++v7;
  }
  while (buf[0]);
  return v14;
}

void sub_21856BBC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::exception a11)
{
}

void sub_21856BBD0(void *a1, int a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v12 = va_arg(va2, void);
  uint64_t v14 = va_arg(va2, void);
  uint64_t v15 = va_arg(va2, void);
  uint64_t v16 = va_arg(va2, void);
  uint64_t v17 = va_arg(va2, void);
  uint64_t v18 = va_arg(va2, void);
  uint64_t v19 = va_arg(va2, void);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va2);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseMultiSegmentException &>((uint64_t)va);
  }
  JetPack::readMultiSegmentContainer(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>,std::function<BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>)::$_0::~$_0((uint64_t *)va1);
  JUMPOUT(0x21856BC10);
}

void sub_21856BC00()
{
}

void sub_21856BC20(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::operator()(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, long long *))(a1 + 8);
  long long v7 = *a3;
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  uint64_t v4 = v3(a2, &v7);
  uint64_t v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
  if (*((void *)&v7 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  return v4;
}

void sub_21856BCD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::operator()(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C9AA380;
  a2[1] = v2;
  return result;
}

JetPack::UnableToParseMultiSegmentException *JetPack::UnableToParseMultiSegmentException::UnableToParseMultiSegmentException(JetPack::UnableToParseMultiSegmentException *this, int a2)
{
  v11.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&v11.__r_.__value_.__r.__words[1] = xmmword_21857B560;
  strcpy(v11.__r_.__value_.__l.__data_, "UnableToParseMultiSegment");
  uint64_t v4 = std::string::append(&v11, " index=");
  std::to_string(&__p, a2);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  long long v7 = std::string::append(v4, (const std::string::value_type *)p_p, size);
  if (SHIBYTE(v7->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v12, v7->__r_.__value_.__l.__data_, v7->__r_.__value_.__l.__size_);
  }
  else
  {
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v12.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v8;
  }
  JetPack::ParseException::ParseException(this, (uint64_t)&v12);
  if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_12;
    }
LABEL_15:
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v11.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_13;
    }
LABEL_16:
    operator delete(v11.__r_.__value_.__l.__data_);
    goto LABEL_13;
  }
  operator delete(v12.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_15;
  }
LABEL_12:
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_16;
  }
LABEL_13:
  *(void *)this = &unk_26C9AA148;
  *((_DWORD *)this + 8) = a2;
  return this;
}

void sub_21856BE58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0)
  {
    operator delete(__p);
    if (a14 < 0)
    {
LABEL_5:
      operator delete(a9);
      if ((a20 & 0x80000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_8;
    }
  }
  else if (a14 < 0)
  {
    goto LABEL_5;
  }
  if ((a20 & 0x80000000) == 0) {
LABEL_6:
  }
    _Unwind_Resume(a1);
LABEL_8:
  operator delete(a15);
  _Unwind_Resume(a1);
}

void *JetPack::ParseException::ParseException(void *a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  *a1 = &unk_26C9AA300;
  uint64_t v3 = (std::string *)(a1 + 1);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v3, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    a1[3] = *((void *)&__p.__r_.__value_.__l + 2);
  }
  *a1 = &unk_26C9A9B98;
  return a1;
}

void sub_21856BF98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  std::exception::~exception(v14);
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::allocator<JetPack::SignedStreamDecoder>::construct[abi:ne180100]<JetPack::SignedStreamDecoder,std::shared_ptr<JetPack::BaseStream> &,std::shared_ptr<JetPack::SignatureVerifier> &>(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v4 = *a3;
  uint64_t v5 = (std::__shared_weak_count *)a3[1];
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = *a4;
  long long v7 = (std::__shared_weak_count *)a4[1];
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = v4;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 8) = 0u;
  *(void *)a2 = &unk_26C9A9CC0;
  *(void *)(a2 + 72) = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *(void *)(a2 + 80) = v6;
  *(void *)(a2 + 88) = v7;
  if (!v7)
  {
    *(unsigned char *)(a2 + 96) = 0;
    *(unsigned char *)(a2 + 120) = 0;
    *(unsigned char *)(a2 + 128) = 0;
    if (!v5) {
      return;
    }
    goto LABEL_13;
  }
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  *(unsigned char *)(a2 + 96) = 0;
  *(unsigned char *)(a2 + 120) = 0;
  *(unsigned char *)(a2 + 128) = 0;
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  if (v5)
  {
LABEL_13:
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

uint64_t std::__shared_ptr_emplace<JetPack::SignedStreamDecoder>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void JetPack::SignedStreamDecoder::~SignedStreamDecoder(JetPack::SignedStreamDecoder *this)
{
  *(void *)this = &unk_26C9A9CC0;
  if (*((unsigned char *)this + 120))
  {
    uint64_t v2 = (void *)*((void *)this + 12);
    if (v2)
    {
      *((void *)this + 13) = v2;
      operator delete(v2);
    }
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 11);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 9);
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 9);
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
LABEL_10:
  *(void *)this = &unk_26C9A9AF8;
  std::deque<unsigned char>::~deque[abi:ne180100]((uint64_t)this + 8);
}

{
  void *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  uint64_t vars8;

  *(void *)this = &unk_26C9A9CC0;
  if (*((unsigned char *)this + 120))
  {
    uint64_t v2 = (void *)*((void *)this + 12);
    if (v2)
    {
      *((void *)this + 13) = v2;
      operator delete(v2);
    }
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 11);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 9);
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 9);
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
LABEL_10:
  *(void *)this = &unk_26C9A9AF8;
  std::deque<unsigned char>::~deque[abi:ne180100]((uint64_t)this + 8);
  JUMPOUT(0x21D46C1B0);
}

uint64_t std::deque<unsigned char>::~deque[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 8);
  uint64_t v3 = *(void ***)(a1 + 16);
  *(void *)(a1 + 40) = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = *(void ***)(a1 + 16);
      uint64_t v2 = (void **)(*(void *)(a1 + 8) + 8);
      *(void *)(a1 + 8) = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 2048;
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    uint64_t v6 = 4096;
LABEL_7:
    *(void *)(a1 + 32) = v6;
  }
  if (v2 != v3)
  {
    do
    {
      long long v7 = *v2++;
      operator delete(v7);
    }
    while (v2 != v3);
    uint64_t v9 = *(void *)(a1 + 8);
    uint64_t v8 = *(void *)(a1 + 16);
    if (v8 != v9) {
      *(void *)(a1 + 16) = v8 + ((v9 - v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t JetPack::parseRootHeader(JetPack *this, JetPack::BaseStream *a2, JetPack::DiagnosticContext *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  char v17 = 19;
  strcpy(__p, "UnableToParseHeader");
  JetPack::ParseException::ParseException(v14, (uint64_t)__p);
  if (v17 < 0) {
    operator delete(*(void **)__p);
  }
  v14[0].__vftable = (std::exception_vtbl *)&unk_26C9A9F18;
  unint64_t v5 = *((void *)a2 + 1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string __p = 0;
    _os_log_impl(&dword_218564000, v5, OS_LOG_TYPE_DEFAULT, "Reading root header", (uint8_t *)__p, 2u);
  }
  if ((*(uint64_t (**)(JetPack *, char *, uint64_t))(*(void *)this + 16))(this, __p, 8) != 8) {
    goto LABEL_15;
  }
  uint64_t v6 = *(void *)__p;
  __p[0] = 0;
  if ((*(uint64_t (**)(JetPack *, char *, uint64_t))(*(void *)this + 16))(this, __p, 1) != 1) {
    goto LABEL_15;
  }
  int v7 = __p[0];
  uint64_t v8 = *((void *)a2 + 1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string __p = 67240192;
    *(_DWORD *)&__p[4] = v7;
    _os_log_impl(&dword_218564000, v8, OS_LOG_TYPE_DEFAULT, "File format version is %{public}i", (uint8_t *)__p, 8u);
  }
  if ((*(uint64_t (**)(JetPack *, char *, uint64_t))(*(void *)this + 16))(this, __p, 4) != 4)
  {
LABEL_15:
    exception = (char *)__cxa_allocate_exception(0x20uLL);
    strcpy(exception + 8, "NotEnoughData");
    *((_WORD *)exception + 11) = 0;
    exception[31] = 13;
    *(void *)exception = &unk_26C9A9D60;
  }
  uint64_t v9 = *(unsigned int *)__p;
  uint64_t v10 = *((void *)a2 + 1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)std::string __p = 67240192;
    *(_DWORD *)&__p[4] = v9;
    _os_log_impl(&dword_218564000, v10, OS_LOG_TYPE_DEBUG, "Dynamic region length is %{public}i", (uint8_t *)__p, 8u);
  }
  JetPack::UnownedPartialStream::UnownedPartialStream(__p, (uint64_t)this, v9);
  JetPack::parseRootDynamicRegion((JetPack *)__p, a2, v11);
  JetPack::UnownedPartialStream::seekToEnd((JetPack::UnownedPartialStream *)__p);
  v14[0].__vftable = (std::exception_vtbl *)&unk_26C9AA300;
  if (v15 < 0) {
    operator delete(v14[1].__vftable);
  }
  std::exception::~exception(v14);
  return v6;
}

void sub_21856C640(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21856C67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::exception a9)
{
}

void sub_21856C694(void *a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x21856C69CLL);
  }
  __clang_call_terminate(a1);
}

BOOL JetPack::parseRootDynamicRegion(JetPack *this, JetPack::BaseStream *a2, JetPack::DiagnosticContext *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v5 = *((void *)a2 + 1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl(&dword_218564000, v5, OS_LOG_TYPE_DEBUG, "Reading root dynamic region", (uint8_t *)v10, 2u);
  }
  LOBYTE(v10[0]) = 0;
  if ((*(uint64_t (**)(JetPack *, _DWORD *, uint64_t))(*(void *)this + 16))(this, v10, 1) != 1)
  {
    exception = (char *)__cxa_allocate_exception(0x20uLL);
    strcpy(exception + 8, "NotEnoughData");
    *((_WORD *)exception + 11) = 0;
    exception[31] = 13;
    *(void *)exception = &unk_26C9A9D60;
  }
  int v6 = LOBYTE(v10[0]);
  int v7 = *((void *)a2 + 1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67240192;
    v10[1] = v6;
    _os_log_impl(&dword_218564000, v7, OS_LOG_TYPE_DEBUG, "Is signed flag is %{public}i", (uint8_t *)v10, 8u);
  }
  return v6 == 1;
}

void readString(JetPack::BaseStream *a1@<X0>, size_t __sz@<X1>, char *a3@<X8>)
{
  std::string __p = 0;
  if (__sz)
  {
    if ((__sz & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    int v6 = (long long *)operator new(__sz);
    std::string __p = v6;
    bzero(v6, __sz);
  }
  else
  {
    int v6 = 0;
  }
  if ((*(uint64_t (**)(JetPack::BaseStream *, long long *, size_t))(*(void *)a1 + 16))(a1, v6, __sz) != __sz)
  {
    exception = (char *)__cxa_allocate_exception(0x20uLL);
    strcpy(exception + 8, "NotEnoughData");
    *((_WORD *)exception + 11) = 0;
    exception[31] = 13;
    *(void *)exception = &unk_26C9A9D60;
  }
  if (__sz >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__sz < 0x17)
  {
    a3[23] = __sz;
    if (!__sz) {
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  size_t v9 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((__sz | 7) != 0x17) {
    size_t v9 = __sz | 7;
  }
  size_t v10 = v9 + 1;
  uint64_t v11 = (char *)operator new(v9 + 1);
  *((void *)a3 + 1) = __sz;
  *((void *)a3 + 2) = v10 | 0x8000000000000000;
  *(void *)a3 = v11;
  a3 = v11;
  if (__sz < 0x20)
  {
LABEL_9:
    int v7 = (char *)v6;
    uint64_t v8 = a3;
LABEL_16:
    a3 = v8;
    do
    {
      char v16 = *v7++;
      *a3++ = v16;
    }
    while (v7 != (char *)v6 + __sz);
    goto LABEL_18;
  }
  int v7 = (char *)v6 + (__sz & 0xFFFFFFFFFFFFFFE0);
  uint64_t v8 = &v11[__sz & 0xFFFFFFFFFFFFFFE0];
  std::string v12 = v11 + 16;
  uint64_t v13 = v6 + 1;
  size_t v14 = __sz & 0xFFFFFFFFFFFFFFE0;
  do
  {
    long long v15 = *v13;
    *(v12 - 1) = *(v13 - 1);
    _OWORD *v12 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 32;
  }
  while (v14);
  a3 = &v11[__sz & 0xFFFFFFFFFFFFFFE0];
  if ((__sz & 0x7FFFFFFFFFFFFFE0) != __sz) {
    goto LABEL_16;
  }
LABEL_18:
  *a3 = 0;
  if (__p)
  {
    operator delete(__p);
  }
}

void sub_21856CAC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t JetPackStreamDestroy(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(std::__shared_weak_count **)(result + 8);
    if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
    JUMPOUT(0x21D46C1B0);
  }
  return result;
}

uint64_t std::__shared_ptr_emplace<JetPack::FileStream>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void JetPack::FileStream::~FileStream(FILE **this)
{
  *this = (FILE *)&unk_26C9A99D8;
  if (*((unsigned char *)this + 16)) {
    fclose(this[1]);
  }
}

{
  *this = (FILE *)&unk_26C9A99D8;
  if (*((unsigned char *)this + 16)) {
    fclose(this[1]);
  }
}

{
  uint64_t vars8;

  *this = (FILE *)&unk_26C9A99D8;
  if (*((unsigned char *)this + 16)) {
    fclose(this[1]);
  }
  JUMPOUT(0x21D46C1B0);
}

void std::allocator<JetPack::AESDecoderStream>::construct[abi:ne180100]<JetPack::AESDecoderStream,std::shared_ptr<JetPack::BaseStream> &,std::array<unsigned char,16ul> &,unsigned int &>(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = a3[1];
  uint64_t v4 = *a3;
  uint64_t v5 = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  operator new();
}

void sub_21856CD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  if (a3) {
    std::allocator<JetPack::AESDecoderStream>::construct[abi:ne180100]<JetPack::AESDecoderStream,std::shared_ptr<JetPack::BaseStream> &,std::array<unsigned char,16ul> &,unsigned int &>(a3);
  }
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<JetPack::AESDecoderStream>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t std::__function::__func<JetPackReaderSetKeyForIdentifierCallback::$_0,std::allocator<JetPackReaderSetKeyForIdentifierCallback::$_0>,std::optional<std::array<unsigned char,16ul>> ()(JetPack::ReaderConfig &,unsigned short)>::operator()@<X0>(uint64_t a1@<X0>, unsigned __int16 *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t result = (*(uint64_t (**)(void, void, long long *, uint64_t))(a1 + 8))(*(void *)(a1 + 16), *a2, &v6, 16);
  if (result)
  {
    *(_OWORD *)a3 = v6;
    char v5 = 1;
  }
  else
  {
    char v5 = 0;
    *(unsigned char *)a3 = 0;
  }
  *(unsigned char *)(a3 + 16) = v5;
  return result;
}

BOOL keyForIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v7 = JetPackReaderGetProperty(a1, 0);
  uint64_t v8 = [v7 keyForIdentifier];

  if (v8)
  {
    size_t v9 = [v7 keyForIdentifier];
    size_t v10 = v9[2](v9, a2);

    BOOL v11 = v10 != 0;
    if (v10) {
      [v10 getBytes:a3 length:a4];
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void JetPack::parseEncryptedSegmentHeader(JetPack *this@<X0>, JetPack::BaseStream *a2@<X1>, uint64_t a3@<X8>)
{
  __p[3] = *(void **)MEMORY[0x263EF8340];
  HIBYTE(__p[2]) = 19;
  strcpy((char *)__p, "UnableToParseHeader");
  JetPack::ParseException::ParseException(v16, (uint64_t)__p);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  v16[0].__vftable = (std::exception_vtbl *)&unk_26C9A9F18;
  uint64_t v7 = *((void *)a2 + 1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_218564000, v7, OS_LOG_TYPE_DEFAULT, "Reading encrypted segment header", (uint8_t *)__p, 2u);
  }
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  if ((*(uint64_t (**)(JetPack *, void **, uint64_t))(*(void *)this + 16))(this, __p, 2) != 2) {
    goto LABEL_17;
  }
  int v8 = LOWORD(__p[0]);
  *(_WORD *)a3 = __p[0];
  size_t v9 = *((void *)a2 + 1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(__p[0]) = 67240192;
    HIDWORD(__p[0]) = v8;
    _os_log_impl(&dword_218564000, v9, OS_LOG_TYPE_DEBUG, "Key identifier is %{public}i", (uint8_t *)__p, 8u);
  }
  if ((*(uint64_t (**)(JetPack *, void **, uint64_t))(*(void *)this + 16))(this, __p, 4) != 4) {
    goto LABEL_17;
  }
  int v10 = (int)__p[0];
  *(_DWORD *)(a3 + 4) = __p[0];
  BOOL v11 = *((void *)a2 + 1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(__p[0]) = 67240192;
    HIDWORD(__p[0]) = v10;
    _os_log_impl(&dword_218564000, v11, OS_LOG_TYPE_DEBUG, "Block size is %{public}i", (uint8_t *)__p, 8u);
  }
  LOBYTE(__p[0]) = 0;
  if ((*(uint64_t (**)(JetPack *, void **, uint64_t))(*(void *)this + 16))(this, __p, 1) != 1)
  {
LABEL_17:
    exception = (char *)__cxa_allocate_exception(0x20uLL);
    strcpy(exception + 8, "NotEnoughData");
    *((_WORD *)exception + 11) = 0;
    exception[31] = 13;
    *(void *)exception = &unk_26C9A9D60;
  }
  size_t v12 = LOBYTE(__p[0]);
  uint64_t v13 = *((void *)a2 + 1);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(__p[0]) = 67240192;
    HIDWORD(__p[0]) = v12;
    _os_log_impl(&dword_218564000, v13, OS_LOG_TYPE_DEBUG, "Nonce length is %{public}i", (uint8_t *)__p, 8u);
  }
  readVector(this, v12, 1, (uint64_t)__p);
  size_t v14 = __p[2];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)__p;
  *(void *)(a3 + 24) = v14;
  v16[0].__vftable = (std::exception_vtbl *)&unk_26C9AA300;
  if (v17 < 0) {
    operator delete(v16[1].__vftable);
  }
  std::exception::~exception(v16);
}

void sub_21856D22C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21856D268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::exception a9)
{
}

void sub_21856D280(void *a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x21856D288);
  }
  __clang_call_terminate(a1);
}

uint64_t JetPack::CommonCryptoBackend::deriveKey(JetPack::CommonCryptoBackend *this, const unsigned __int8 *a2, unint64_t a3, const unsigned __int8 *a4, unint64_t a5, unsigned __int8 *a6)
{
  if (CCDeriveKey()) {
    return 4294966296;
  }
  else {
    return 1;
  }
}

void sub_21856D340(_Unwind_Exception *exception_object)
{
  if (v1) {
    CCKDFParametersDestroy();
  }
  _Unwind_Resume(exception_object);
}

uint64_t JetPack::AESDecoderStream::AESDecoderStream(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, size_t __sz, uint64_t *a6)
{
  *(void *)a1 = &unk_26C9A9BE8;
  uint64_t v8 = a2[1];
  *(void *)(a1 + 8) = *a2;
  *(void *)(a1 + 16) = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = *a6;
  *a6 = 0;
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = a3;
  *(void *)(a1 + 40) = a4;
  *(_DWORD *)(a1 + 48) = __sz;
  *(_OWORD *)(a1 + 52) = 0u;
  *(_OWORD *)(a1 + 68) = 0u;
  *(_OWORD *)(a1 + 84) = 0u;
  *(_OWORD *)(a1 + 100) = 0u;
  *(_OWORD *)(a1 + 116) = 0u;
  *(_DWORD *)(a1 + 132) = 0;
  if (__sz)
  {
    if ((__sz & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    int v10 = (char *)operator new(__sz);
    *(void *)(a1 + 112) = v10;
    BOOL v11 = &v10[__sz];
    *(void *)(a1 + 128) = &v10[__sz];
    bzero(v10, __sz);
    *(void *)(a1 + 120) = v11;
    *(void *)(a1 + 144) = 0;
    *(void *)(a1 + 152) = 0;
    *(void *)(a1 + 136) = 0;
    size_t v12 = (char *)operator new(__sz);
    *(void *)(a1 + 136) = v12;
    uint64_t v13 = &v12[__sz];
    *(void *)(a1 + 152) = &v12[__sz];
    bzero(v12, __sz);
    *(void *)(a1 + 144) = v13;
  }
  else
  {
    *(void *)(a1 + 136) = 0;
    *(void *)(a1 + 144) = 0;
    *(void *)(a1 + 152) = 0;
  }
  return a1;
}

void sub_21856D470(_Unwind_Exception *a1)
{
  *(void *)(v1 + 120) = v3;
  operator delete(v3);
  std::deque<unsigned char>::~deque[abi:ne180100](v1 + 64);
  uint64_t v5 = *(void *)(v1 + 24);
  *(void *)(v1 + 24) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

void JetPackSignatureVerifierCreateDefault()
{
}

void makePublicRef<JetPackSignatureVerifier,JetPack::UnsafeIgnoreSignatureVerifier>()
{
}

uint64_t JetPackReaderDestroy(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 40) && *(char *)(result + 39) < 0) {
      operator delete(*(void **)(result + 16));
    }
    uint64_t v2 = *(std::__shared_weak_count **)(v1 + 8);
    if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
    JUMPOUT(0x21D46C1B0);
  }
  return result;
}

void std::__shared_ptr_emplace<JetPack::ReaderConfig>::__on_zero_shared(uint64_t a1)
{
}

void JetPack::ReaderConfig::~ReaderConfig(JetPack::ReaderConfig *this)
{
  if (*((unsigned char *)this + 224))
  {
    uint64_t v2 = (char *)this + 192;
    uint64_t v3 = (JetPack::ReaderConfig *)*((void *)this + 27);
    if (v3 == (JetPack::ReaderConfig *)((char *)this + 192))
    {
      (*(void (**)(char *))(*(void *)v2 + 32))((char *)this + 192);
      if (!*((unsigned char *)this + 184)) {
        goto LABEL_12;
      }
      goto LABEL_6;
    }
    if (v3) {
      (*(void (**)(JetPack::ReaderConfig *))(*(void *)v3 + 40))(v3);
    }
  }
  if (!*((unsigned char *)this + 184)) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v4 = (JetPack::ReaderConfig *)*((void *)this + 22);
  if (v4 == (JetPack::ReaderConfig *)((char *)this + 152))
  {
    (*(void (**)(char *))(*((void *)this + 19) + 32))((char *)this + 152);
  }
  else if (v4)
  {
    (*(void (**)(JetPack::ReaderConfig *))(*(void *)v4 + 40))(v4);
  }
LABEL_12:
  if (*((unsigned char *)this + 144))
  {
    uint64_t v5 = (JetPack::ReaderConfig *)*((void *)this + 17);
    if (v5 == (JetPack::ReaderConfig *)((char *)this + 112))
    {
      (*(void (**)(char *))(*((void *)this + 14) + 32))((char *)this + 112);
      if (!*((unsigned char *)this + 104)) {
        goto LABEL_23;
      }
      goto LABEL_17;
    }
    if (v5) {
      (*(void (**)(JetPack::ReaderConfig *))(*(void *)v5 + 40))(v5);
    }
  }
  if (!*((unsigned char *)this + 104)) {
    goto LABEL_23;
  }
LABEL_17:
  long long v6 = (JetPack::ReaderConfig *)*((void *)this + 12);
  if (v6 == (JetPack::ReaderConfig *)((char *)this + 72))
  {
    (*(void (**)(char *))(*((void *)this + 9) + 32))((char *)this + 72);
  }
  else if (v6)
  {
    (*(void (**)(JetPack::ReaderConfig *))(*(void *)v6 + 40))(v6);
  }
LABEL_23:
  if (*((unsigned char *)this + 64))
  {
    uint64_t v7 = (JetPack::ReaderConfig *)*((void *)this + 7);
    if (v7 == (JetPack::ReaderConfig *)((char *)this + 32))
    {
      (*(void (**)(char *))(*((void *)this + 4) + 32))((char *)this + 32);
    }
    else if (v7)
    {
      (*(void (**)(JetPack::ReaderConfig *))(*(void *)v7 + 40))(v7);
    }
  }
}

uint64_t JetPackReaderProcess(uint64_t *a1, uint64_t *a2, uint64_t *a3, char a4)
{
  {
    JetPack::DiagnosticContext::DiagnosticContext((uint64_t)&getGlobalLog(void)::sharedContext);
  }
  uint64_t v8 = qword_26AB31828;
  if (os_log_type_enabled((os_log_t)qword_26AB31828, OS_LOG_TYPE_DEBUG))
  {
    v21[0] = 0;
    _os_log_impl(&dword_218564000, v8, OS_LOG_TYPE_DEBUG, "JetPackReaderProcess() API called", (uint8_t *)v21, 2u);
  }
  if (!a1)
  {
    uint64_t v9 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    if (a2) {
      goto LABEL_8;
    }
LABEL_34:
    size_t v12 = 0;
    uint64_t v11 = 0;
    uint64_t v28 = 0;
    __int16 v29 = 0;
    if (a3) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  uint64_t v30 = *a1;
  uint64_t v31 = (std::__shared_weak_count *)v10;
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }
  if (!a2) {
    goto LABEL_34;
  }
LABEL_8:
  uint64_t v11 = *a2;
  size_t v12 = (std::__shared_weak_count *)a2[1];
  uint64_t v28 = *a2;
  __int16 v29 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (a3)
  {
LABEL_11:
    uint64_t v13 = *a3;
    size_t v14 = (std::__shared_weak_count *)a3[1];
    uint64_t v26 = *a3;
    uint64_t v27 = v14;
    if (v14) {
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v24 = v11;
    uint64_t v25 = v12;
    if (v12) {
      goto LABEL_14;
    }
    goto LABEL_15;
  }
LABEL_35:
  size_t v14 = 0;
  uint64_t v13 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v24 = v11;
  uint64_t v25 = v12;
  if (v12) {
LABEL_14:
  }
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_15:
  uint64_t v22 = v13;
  uint64_t v23 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  JetPack::readJetPackStream(v9, &v24, (a4 & 1) == 0, &v22);
  long long v15 = v23;
  if (v23 && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
  char v16 = v25;
  if (v25 && !atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  char v17 = v27;
  if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  uint64_t v18 = v29;
  if (v29 && !atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  uint64_t v19 = v31;
  if (v31 && !atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
  return 1;
}

void sub_21856DE74(_Unwind_Exception *a1)
{
}

void sub_21856DE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, uint64_t a17, char a18, uint64_t a19, char a20,uint64_t a21,char a22)
{
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  if (a2 == 1)
  {
    uint64_t v26 = (const std::exception *)__cxa_begin_catch(a1);
    nestedExceptionString(v26, (std::string *)&__p);
    std::optional<std::string>::operator=[abi:ne180100]<std::string,void>(v22 + 16, (long long *)&__p);
    if (a14 < 0) {
      operator delete(__p);
    }
    __cxa_end_catch();
    if (!a21) {
      JUMPOUT(0x21856DD68);
    }
    JUMPOUT(0x21856DD28);
  }
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a20);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a22);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100](v23 - 64);
  _Unwind_Resume(a1);
}

void JetPack::readJetPackStream(uint64_t a1, uint64_t *a2, int a3, uint64_t *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!*a2)
  {
    exception = (JetPack::InputStreamRequiredException *)__cxa_allocate_exception(0x20uLL);
    JetPack::InputStreamRequiredException::InputStreamRequiredException(exception);
  }
  uint64_t v8 = *(NSObject **)(a1 + 24);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_218564000, v8, OS_LOG_TYPE_DEFAULT, "Reading JetPack stream", buf, 2u);
  }
  if (!*(unsigned char *)(a1 + 224))
  {
    uint64_t v9 = *(NSObject **)(a1 + 24);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)
      && (*(_WORD *)std::string buf = 0,
          _os_log_impl(&dword_218564000, v9, OS_LOG_TYPE_DEBUG, "Setting readSegment to default implementation", buf, 2u), *(unsigned char *)(a1 + 224)))
    {
      *(void *)std::string buf = &unk_26C9AA328;
      std::exception v20 = JetPack::readSegment;
      std::string v21 = buf;
      std::__function::__value_func<BOOL ()(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>::swap[abi:ne180100](buf, (void *)(a1 + 192));
      if (v21 == buf)
      {
        (*(void (**)(uint8_t *))(*(void *)buf + 32))(buf);
      }
      else if (v21)
      {
        (*(void (**)(void))(*(void *)v21 + 40))();
      }
    }
    else
    {
      *(void *)(a1 + 192) = &unk_26C9AA328;
      *(void *)(a1 + 200) = JetPack::readSegment;
      *(void *)(a1 + 216) = a1 + 192;
      *(unsigned char *)(a1 + 224) = 1;
    }
  }
  uint64_t v10 = (std::__shared_weak_count *)a2[1];
  uint64_t v17 = *a2;
  uint64_t v18 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v11 = a4[1];
  uint64_t v15 = *a4;
  char v16 = (std::__shared_weak_count *)v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  JetPack::readRootSegment(a1, (uint64_t)&v17, a3, &v15);
  size_t v12 = v16;
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  uint64_t v13 = v18;
  if (v18)
  {
    if (!atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

void sub_21856E22C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21856E240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

uint64_t JetPackSignatureVerifierDestroy(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(std::__shared_weak_count **)(result + 8);
    if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
    JUMPOUT(0x21D46C1B0);
  }
  return result;
}

uint64_t std::__shared_ptr_emplace<JetPack::CommonCryptoSignatureVerifier>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void JetPack::CommonCryptoSignatureVerifier::~CommonCryptoSignatureVerifier(JetPack::CommonCryptoSignatureVerifier *this)
{
  *(void *)this = &unk_26C9A9F40;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
}

{
  std::__shared_weak_count *v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = &unk_26C9A9F40;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  JUMPOUT(0x21D46C1B0);
}

uint64_t std::__shared_ptr_pointer<__SecTrust *,void (*)(void const*),std::allocator<__SecTrust>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24));
}

void JetPackSignatureVerifierCreateWithCertificateData(const void *a1, size_t __sz)
{
  if (__sz)
  {
    if ((__sz & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v4 = operator new(__sz);
    memcpy(v4, a1, __sz);
  }
  makePublicRef<JetPackSignatureVerifier,JetPack::CommonCryptoSignatureVerifier,std::vector<unsigned char> &>();
}

void sub_21856E4F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void makePublicRef<JetPackSignatureVerifier,JetPack::CommonCryptoSignatureVerifier,std::vector<unsigned char> &>()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  operator new();
}

void sub_21856E5D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  std::__shared_weak_count::~__shared_weak_count(v9);
  operator delete(v12);
  if (a2 == 1)
  {
    uint64_t v13 = __cxa_begin_catch(a1);
    GlobalLog = getGlobalLog();
    if (os_log_type_enabled(GlobalLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = (*(uint64_t (**)(void *))(*(void *)v13 + 16))(v13);
      LODWORD(a9) = 136446210;
      *(void *)((char *)&a9 + 4) = v15;
      _os_log_impl(&dword_218564000, GlobalLog, OS_LOG_TYPE_ERROR, "Unable to make public ref with error: %{public}s", (uint8_t *)&a9, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x21856E5A0);
  }
  _Unwind_Resume(a1);
}

void std::allocator<JetPack::CommonCryptoSignatureVerifier>::construct[abi:ne180100]<JetPack::CommonCryptoSignatureVerifier,std::vector<unsigned char> &>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  std::string __p = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v4 = *(const void **)a3;
  uint64_t v3 = *(void *)(a3 + 8);
  size_t v5 = v3 - *(void *)a3;
  if (v3 != *(void *)a3)
  {
    if ((v5 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    long long v6 = (char *)operator new(v3 - *(void *)a3);
    uint64_t v7 = &v6[v5];
    std::string __p = v6;
    uint64_t v10 = &v6[v5];
    memcpy(v6, v4, v5);
    uint64_t v9 = v7;
  }
  operator new();
}

void sub_21856E7B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (a9) {
    std::allocator<JetPack::CommonCryptoSignatureVerifier>::construct[abi:ne180100]<JetPack::CommonCryptoSignatureVerifier,std::vector<unsigned char> &>();
  }
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void JetPack::CommonCryptoSignatureVerifier::CommonCryptoSignatureVerifier(uint64_t a1, uint64_t a2)
{
  std::string __p = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v3 = *(const void **)a2;
  uint64_t v2 = *(void *)(a2 + 8);
  size_t v4 = v2 - *(void *)a2;
  if (v2 != *(void *)a2)
  {
    if ((v4 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    size_t v5 = (char *)operator new(v2 - *(void *)a2);
    long long v6 = &v5[v4];
    std::string __p = v5;
    uint64_t v9 = &v5[v4];
    memcpy(v5, v3, v4);
    uint64_t v8 = v6;
  }
  JetPack::CommonCryptoBackend::certificateForData((uint64_t)&__p);
}

void sub_21856E968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13)
{
  if (v13) {
    std::allocator<JetPack::CommonCryptoSignatureVerifier>::construct[abi:ne180100]<JetPack::CommonCryptoSignatureVerifier,std::vector<unsigned char> &>();
  }
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_pointer<__SecCertificate *,void (*)(void const*),std::allocator<__SecCertificate>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24));
}

void JetPack::CommonCryptoBackend::trustForCertificate(JetPack::CommonCryptoBackend *this@<X0>, void *a2@<X8>)
{
  SecTrustRef trust = 0;
  if (!SecTrustCreateWithCertificates(this, 0, &trust))
  {
    if (trust) {
      JetPack::makeCFSharedPtr<__SecTrust *>((uint64_t)trust, a2);
    }
  }
  puts("Unable to create trust");
  exception = (JetPack::FailedToDecodeX509CertificateException *)__cxa_allocate_exception(0x20uLL);
  JetPack::FailedToDecodeX509CertificateException::FailedToDecodeX509CertificateException(exception);
}

void sub_21856EA50(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void JetPack::CommonCryptoBackend::certificateForData(uint64_t a1)
{
  uint64_t v2 = *(const void **)a1;
  uint64_t v1 = *(void *)(a1 + 8);
  size_t v3 = v1 - *(void *)a1;
  if (v1 == *(void *)a1)
  {
    size_t v5 = 0;
    size_t v4 = 0;
  }
  else
  {
    if ((v3 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    size_t v4 = (char *)operator new(v1 - *(void *)a1);
    size_t v5 = &v4[v3];
    memcpy(v4, v2, v3);
  }
  CFDataRef v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v4, v5 - v4);
  JetPack::makeCFSharedPtr<__CFData const*>((uint64_t)v6, &data);
}

void sub_21856EB84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void JetPack::CommonCryptoSignatureVerifier::signatureIsValid(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  JetPack::CommonCryptoBackend::publicKeyForTrust(*(JetPack::CommonCryptoBackend **)(a1 + 16), &key);
}

void sub_21856EEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, char a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,char a21)
{
}

void JetPack::makeCFSharedPtr<__CFData const*>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  operator new();
}

void sub_21856EFB8(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21856EFD0(_Unwind_Exception *a1)
{
}

uint64_t std::__shared_ptr_pointer<__CFData const*,void (*)(void const*),std::allocator<__CFData const>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24));
}

void JetPack::CFReleaseIgnoringNull(CFTypeRef this, const void *a2)
{
  if (this) {
    CFRelease(this);
  }
}

uint64_t std::__shared_ptr_pointer<__SecKey *,void (*)(void const*),std::allocator<__SecKey>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24));
}

unsigned __int8 *JetPack::CommonCryptoBackend::computeSHA256Digest@<X0>(uint64_t a1@<X1>, unsigned __int8 *a2@<X8>)
{
  return CC_SHA256(*(const void **)a1, *(_DWORD *)(a1 + 8) - *(void *)a1, a2);
}

void JetPack::CommonCryptoBackend::publicKeyForTrust(JetPack::CommonCryptoBackend *this@<X0>, void *a2@<X8>)
{
  SecKeyRef v4 = SecTrustCopyKey(this);
  if (v4)
  {
    JetPack::makeCFSharedPtr<__SecKey *>((uint64_t)v4, a2);
  }
  puts("Unable to copy public key");
  exception = (JetPack::FailedToDecodeX509CertificateException *)__cxa_allocate_exception(0x20uLL);
  JetPack::FailedToDecodeX509CertificateException::FailedToDecodeX509CertificateException(exception);
}

void sub_21856F0C0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void JetPack::makeCFSharedPtr<__SecKey *>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  operator new();
}

void sub_21856F148(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21856F160(_Unwind_Exception *a1)
{
}

void JetPack::makeCFSharedPtr<__SecCertificate *>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  operator new();
}

void sub_21856F1E8(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21856F200(_Unwind_Exception *a1)
{
}

void JetPack::makeCFSharedPtr<__SecTrust *>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  operator new();
}

void sub_21856F288(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21856F2A0(_Unwind_Exception *a1)
{
}

uint64_t std::__shared_ptr_emplace<JetPack::UnsafeIgnoreSignatureVerifier>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t JetPack::DiagnosticContext::DiagnosticContext(uint64_t this)
{
  *(unsigned char *)this = 4;
  unint64_t v1 = 0x26AB31000uLL;
  {
    uint64_t v4 = this;
    unint64_t v1 = 0x26AB31000;
    int v3 = v2;
    this = v4;
    if (v3)
    {
      JetPack::getSharedOSLog(void)::log = (uint64_t)os_log_create("com.apple.JetPack", "Diagnostics");
      unint64_t v1 = 0x26AB31000;
      this = v4;
    }
  }
  *(void *)(this + 8) = *(void *)(v1 + 2200);
  return this;
}

void JetPackCreateFileStream()
{
}

void makePublicRef<JetPackStream,JetPack::FileStream,char const*&>()
{
}

void sub_21856F4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  std::__shared_weak_count::~__shared_weak_count(v9);
  operator delete(v12);
  if (a2 == 1)
  {
    uint64_t v13 = __cxa_begin_catch(a1);
    GlobalLog = getGlobalLog();
    if (os_log_type_enabled(GlobalLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = (*(uint64_t (**)(void *))(*(void *)v13 + 16))(v13);
      LODWORD(a9) = 136446210;
      *(void *)((char *)&a9 + 4) = v15;
      _os_log_impl(&dword_218564000, GlobalLog, OS_LOG_TYPE_ERROR, "Unable to make public ref with error: %{public}s", (uint8_t *)&a9, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x21856F49CLL);
  }
  _Unwind_Resume(a1);
}

JetPack::FileStream *JetPack::FileStream::FileStream(JetPack::FileStream *this, const char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    p_dst = (std::string *)operator new(v7 + 1);
    __dst.__r_.__value_.__l.__size_ = v5;
    __dst.__r_.__value_.__r.__words[2] = v8 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_8;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v4;
  p_dst = &__dst;
  if (v4) {
LABEL_8:
  }
    memcpy(p_dst, __s, v5);
  p_dst->__r_.__value_.__s.__data_[v5] = 0;
  *(void *)this = &unk_26C9A99D8;
  int v9 = SHIBYTE(__dst.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v13, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  }
  else {
    std::string v13 = __dst;
  }
  File = JetPack::FileStream::makeFile((const char *)&v13);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  *((void *)this + 1) = File;
  *((unsigned char *)this + 16) = 1;
  if (v9 < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  return this;
}

void sub_21856F6E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
}

FILE *JetPack::FileStream::makeFile(const char *a1)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  uint64_t result = fopen(a1, "rb");
  if (!result)
  {
    exception = (JetPack::UnableToOpenFileException *)__cxa_allocate_exception(0x20uLL);
    JetPack::UnableToOpenFileException::UnableToOpenFileException(exception);
  }
  return result;
}

void sub_21856F788(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void JetPack::readBrotliSegment(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = operator new(0x80uLL);
  v3[1] = 0;
  v3[2] = 0;
  *int v3 = &unk_26C9AA7D0;
  std::allocator<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>>::construct[abi:ne180100]<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>,std::shared_ptr<JetPack::BaseStream> &>((uint64_t)&v4, (uint64_t)(v3 + 3), a2);
}

void sub_21856F998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
}

void sub_21856F9BC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void std::allocator<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>>::construct[abi:ne180100]<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>,std::shared_ptr<JetPack::BaseStream> &>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 8);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  operator new();
}

void sub_21856FAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11 = v10;
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100](v11);
  uint64_t v13 = *(void *)(v9 + 8);
  *(void *)(v9 + 8) = 0;
  if (v13) {
    std::allocator<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>>::construct[abi:ne180100]<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>,std::shared_ptr<JetPack::BaseStream> &>(v13);
  }
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

JetPack::AppleDecompressionInterface *JetPack::AppleDecompressionInterface::AppleDecompressionInterface(JetPack::AppleDecompressionInterface *this)
{
  *(void *)this = &unk_26C9A9E70;
  *((unsigned char *)this + 48) = 0;
  if (compression_stream_init((compression_stream *)((char *)this + 8), COMPRESSION_STREAM_DECODE, COMPRESSION_BROTLI))
  {
    exception = (JetPack::CompressionUnableToInitException *)__cxa_allocate_exception(0x20uLL);
    JetPack::CompressionUnableToInitException::CompressionUnableToInitException(exception);
  }
  return this;
}

{
  JetPack::CompressionUnableToInitException *exception;

  *(void *)this = &unk_26C9A9E70;
  *((unsigned char *)this + 48) = 0;
  if (compression_stream_init((compression_stream *)((char *)this + 8), COMPRESSION_STREAM_DECODE, COMPRESSION_BROTLI))
  {
    exception = (JetPack::CompressionUnableToInitException *)__cxa_allocate_exception(0x20uLL);
    JetPack::CompressionUnableToInitException::CompressionUnableToInitException(exception);
  }
  return this;
}

void sub_21856FBC4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>::~BrotliDecoderStreamImpl(void *a1)
{
  *a1 = &unk_26C9A9D88;
  int v2 = (void *)a1[9];
  if (v2)
  {
    a1[10] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[8];
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  uint64_t v4 = a1[1];
  a1[1] = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  return a1;
}

void JetPack::AppleDecompressionInterface::~AppleDecompressionInterface(JetPack::AppleDecompressionInterface *this)
{
  JetPack::AppleDecompressionInterface::~AppleDecompressionInterface(this);
  JUMPOUT(0x21D46C1B0);
}

{
  NSObject *v1;
  uint8_t v2[16];

  *(void *)this = &unk_26C9A9E70;
  if (compression_stream_destroy((compression_stream *)((char *)this + 8)))
  {
    {
      JetPack::DiagnosticContext::DiagnosticContext((uint64_t)&getGlobalLog(void)::sharedContext);
    }
    unint64_t v1 = qword_26AB31838;
    if (os_log_type_enabled((os_log_t)qword_26AB31838, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v2 = 0;
      _os_log_impl(&dword_218564000, v1, OS_LOG_TYPE_ERROR, "Unable to destroy compression stream", v2, 2u);
    }
  }
}

void sub_21856FDA4(void *a1)
{
}

void makePublicRef<JetPackReader,JetPack::ReaderConfig>()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  operator new();
}

char *_ZNSt3__115allocate_sharedB8ne180100IN7JetPack12ReaderConfigENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_@<X0>(void *a1@<X8>)
{
  uint64_t result = (char *)operator new(0x100uLL);
  *((void *)result + 1) = 0;
  *((void *)result + 2) = 0;
  *(void *)uint64_t result = &unk_26C9AA680;
  *(_OWORD *)(result + 24) = 0u;
  uint64_t v3 = result + 24;
  *(_OWORD *)(result + 40) = 0u;
  *(_OWORD *)(result + 56) = 0u;
  *(_OWORD *)(result + 72) = 0u;
  *(_OWORD *)(result + 88) = 0u;
  *(_OWORD *)(result + 104) = 0u;
  *(_OWORD *)(result + 120) = 0u;
  *(_OWORD *)(result + 136) = 0u;
  *(_OWORD *)(result + 152) = 0u;
  *(_OWORD *)(result + 168) = 0u;
  *(_OWORD *)(result + 184) = 0u;
  *(_OWORD *)(result + 200) = 0u;
  *(_OWORD *)(result + 216) = 0u;
  *(_OWORD *)(result + 232) = 0u;
  *((void *)result + 31) = 0;
  result[32] = 4;
  result[40] = 4;
  unint64_t v4 = 0x26AB31000uLL;
  {
    uint64_t v7 = result + 24;
    uint64_t v8 = result;
    unint64_t v4 = 0x26AB31000;
    int v6 = v5;
    uint64_t v3 = v7;
    uint64_t result = v8;
    if (v6)
    {
      JetPack::getSharedOSLog(void)::log = (uint64_t)os_log_create("com.apple.JetPack", "Diagnostics");
      unint64_t v4 = 0x26AB31000;
      uint64_t v3 = v7;
      uint64_t result = v8;
    }
  }
  *((void *)result + 6) = *(void *)(v4 + 2200);
  result[56] = 0;
  result[88] = 0;
  result[96] = 0;
  result[128] = 0;
  result[136] = 0;
  result[168] = 0;
  result[176] = 0;
  result[208] = 0;
  result[216] = 0;
  result[248] = 0;
  *a1 = v3;
  a1[1] = result;
  return result;
}

BOOL JetPackReaderSetProperty(uint64_t a1, int a2, uint64_t a3)
{
  if (!a1)
  {
    unint64_t v4 = 0;
    int v5 = 0;
    if (a2) {
      goto LABEL_5;
    }
LABEL_8:
    void *v4 = a3;
    if (!v5) {
      return a2 == 0;
    }
    goto LABEL_9;
  }
  unint64_t v4 = *(void **)a1;
  int v5 = *(std::__shared_weak_count **)(a1 + 8);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!a2) {
    goto LABEL_8;
  }
LABEL_5:
  if (!v5) {
    return a2 == 0;
  }
LABEL_9:
  if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  return a2 == 0;
}

void JetPackReaderSetKeyForIdentifierCallback(uint64_t *a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (std::__shared_weak_count *)a1[1];
    if (v3) {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
  }
  if (*(unsigned char *)(v2 + 64))
  {
    v4[0] = &unk_26C9AA590;
    v4[1] = a2;
    v4[2] = a1;
    int v5 = v4;
    std::__function::__value_func<std::optional<std::array<unsigned char,16ul>> ()(JetPack::ReaderConfig &,unsigned short)>::swap[abi:ne180100](v4, (void *)(v2 + 32));
    if (v5 == v4)
    {
      (*(void (**)(void *))(v4[0] + 32))(v4);
      if (!v3) {
        return;
      }
      goto LABEL_12;
    }
    if (v5)
    {
      (*(void (**)(void))(*v5 + 40))();
      if (!v3) {
        return;
      }
      goto LABEL_12;
    }
  }
  else
  {
    *(void *)(v2 + 32) = &unk_26C9AA590;
    *(void *)(v2 + 40) = a2;
    *(void *)(v2 + 48) = a1;
    *(void *)(v2 + 56) = v2 + 32;
    *(unsigned char *)(v2 + 64) = 1;
  }
  if (!v3) {
    return;
  }
LABEL_12:
  if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void JetPackReaderSetFileEntryFoundCallback(uint64_t *a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (std::__shared_weak_count *)a1[1];
    if (v3) {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
  }
  if (*(unsigned char *)(v2 + 184))
  {
    v4[0] = &unk_26C9AA4E0;
    v4[1] = a2;
    v4[2] = a1;
    int v5 = v4;
    std::__function::__value_func<BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::swap[abi:ne180100](v4, (void *)(v2 + 152));
    if (v5 == v4)
    {
      (*(void (**)(void *))(v4[0] + 32))(v4);
      if (!v3) {
        return;
      }
      goto LABEL_12;
    }
    if (v5)
    {
      (*(void (**)(void))(*v5 + 40))();
      if (!v3) {
        return;
      }
      goto LABEL_12;
    }
  }
  else
  {
    *(void *)(v2 + 152) = &unk_26C9AA4E0;
    *(void *)(v2 + 160) = a2;
    *(void *)(v2 + 168) = a1;
    *(void *)(v2 + 176) = v2 + 152;
    *(unsigned char *)(v2 + 184) = 1;
  }
  if (!v3) {
    return;
  }
LABEL_12:
  if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void JetPackReaderSetDataSegmentFoundCallback(uint64_t *a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (std::__shared_weak_count *)a1[1];
    if (v3) {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
  }
  if (*(unsigned char *)(v2 + 144))
  {
    v4[0] = &unk_26C9AA538;
    v4[1] = a2;
    v4[2] = a1;
    int v5 = v4;
    std::__function::__value_func<BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::swap[abi:ne180100](v4, (void *)(v2 + 112));
    if (v5 == v4)
    {
      (*(void (**)(void *))(v4[0] + 32))(v4);
      if (!v3) {
        return;
      }
      goto LABEL_12;
    }
    if (v5)
    {
      (*(void (**)(void))(*v5 + 40))();
      if (!v3) {
        return;
      }
      goto LABEL_12;
    }
  }
  else
  {
    *(void *)(v2 + 112) = &unk_26C9AA538;
    *(void *)(v2 + 120) = a2;
    *(void *)(v2 + 128) = a1;
    *(void *)(v2 + 136) = v2 + 112;
    *(unsigned char *)(v2 + 144) = 1;
  }
  if (!v3) {
    return;
  }
LABEL_12:
  if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

uint64_t JetPackFileEntryWriteToDirectory(uint64_t a1, JetPack::ArchiveStream **a2, char *__s)
{
  if (a2)
  {
    int v5 = (std::__shared_weak_count *)a2[1];
    uint64_t v18 = *a2;
    uint64_t v19 = v5;
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
  }
  v16[0] = 4;
  {
    JetPack::getSharedOSLog(void)::log = (uint64_t)os_log_create("com.apple.JetPack", "Diagnostics");
  }
  uint64_t v17 = JetPack::getSharedOSLog(void)::log;
  uint64_t v6 = v18;
  size_t v7 = strlen(__s);
  if (v7 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v8 = (void *)v7;
  if (v7 >= 0x17)
  {
    uint64_t v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v10 = v7 | 7;
    }
    uint64_t v11 = v10 + 1;
    uint64_t v9 = (void **)operator new(v10 + 1);
    __dst[1] = v8;
    unint64_t v15 = v11 | 0x8000000000000000;
    __dst[0] = v9;
    goto LABEL_13;
  }
  HIBYTE(v15) = v7;
  uint64_t v9 = __dst;
  if (v7) {
LABEL_13:
  }
    memcpy(v9, __s, (size_t)v8);
  *((unsigned char *)v8 + (void)v9) = 0;
  JetPack::FileEntryWriteToDirectory((uint64_t)v16, a1, v6, (uint64_t)__dst);
  if (SHIBYTE(v15) < 0) {
    operator delete(__dst[0]);
  }
  size_t v12 = v19;
  if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  return 1;
}

void sub_2185707EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    __cxa_end_catch();
    if (!a19) {
      JUMPOUT(0x21857078CLL);
    }
    JUMPOUT(0x21857074CLL);
  }
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  _Unwind_Resume(a1);
}

void JetPack::FileEntryWriteToDirectory(uint64_t a1, uint64_t a2, JetPack::ArchiveStream *a3, uint64_t a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v6 = archive_write_disk_new();
  if (archive_write_disk_set_standard_lookup())
  {
    HIBYTE(v39[2]) = 21;
    strcpy((char *)v39, "set standard settings");
    JetPack::throwLibArchiveException(v6, v39);
  }
  if (archive_write_disk_set_options())
  {
    unint64_t v37 = (char *)operator new(0x20uLL);
    long long v38 = xmmword_21857B020;
    strcpy(v37, "set archive writer options");
    JetPack::throwLibArchiveException(v6, (uint64_t *)&v37);
  }
  size_t v7 = (const char *)archive_entry_pathname();
  size_t v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v9 = v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    p_dst = (void **)operator new(v11 + 1);
    size_t v35 = v9;
    int64_t v36 = v12 | 0x8000000000000000;
    std::string __dst = (std::string *)p_dst;
    goto LABEL_10;
  }
  HIBYTE(v36) = v8;
  p_dst = (void **)&__dst;
  if (v8) {
LABEL_10:
  }
    memmove(p_dst, v7, v9);
  *((unsigned char *)p_dst + v9) = 0;
  memset(&__p, 0, sizeof(__p));
  uint64_t v13 = *(unsigned __int8 *)(a4 + 23);
  if ((v13 & 0x80u) == 0) {
    size_t v14 = (std::string *)a4;
  }
  else {
    size_t v14 = *(std::string **)a4;
  }
  if ((v13 & 0x80u) != 0) {
    uint64_t v13 = *(void *)(a4 + 8);
  }
  std::string::append[abi:ne180100]<char const*,0>(&__p.__pn_, v14, (std::string *)((char *)v14 + v13));
  memset(&v40, 0, sizeof(v40));
  size_t v15 = HIBYTE(v36);
  if (v36 >= 0) {
    char v16 = (std::string *)&__dst;
  }
  else {
    char v16 = __dst;
  }
  if (v36 < 0) {
    size_t v15 = v35;
  }
  std::string::append[abi:ne180100]<char const*,0>(&v40, v16, (std::string *)((char *)v16 + v15));
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&v40, (uint64_t)&__p, &v33);
  if ((SHIBYTE(v40.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_23;
    }
LABEL_26:
    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v33.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_27;
  }
  operator delete(v40.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_26;
  }
LABEL_23:
  if ((SHIBYTE(v33.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_24:
    std::string pn = v33.__pn_;
    goto LABEL_28;
  }
LABEL_27:
  std::string::__init_copy_ctor_external(&pn, v33.__pn_.__r_.__value_.__l.__data_, v33.__pn_.__r_.__value_.__l.__size_);
LABEL_28:
  JetPack::detail::resolvingAllSymlinksInNonExistentPath((const std::__fs::filesystem::path *)&pn, &__p);
  if (SHIBYTE(pn.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(pn.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_30;
    }
  }
  else if ((SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_30:
    std::string v40 = __p.__pn_;
    goto LABEL_33;
  }
  std::string::__init_copy_ctor_external(&v40, __p.__pn_.__r_.__value_.__l.__data_, __p.__pn_.__r_.__value_.__l.__size_);
LABEL_33:
  archive_entry_set_pathname();
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v40.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_35;
    }
  }
  else if ((SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_35:
    std::string v30 = __p.__pn_;
    goto LABEL_38;
  }
  std::string::__init_copy_ctor_external(&v30, __p.__pn_.__r_.__value_.__l.__data_, __p.__pn_.__r_.__value_.__l.__size_);
LABEL_38:
  memset(&v29, 0, sizeof(v29));
  uint64_t v17 = *(unsigned __int8 *)(a4 + 23);
  if ((v17 & 0x80u) == 0) {
    uint64_t v18 = (std::string *)a4;
  }
  else {
    uint64_t v18 = *(std::string **)a4;
  }
  if ((v17 & 0x80u) != 0) {
    uint64_t v17 = *(void *)(a4 + 8);
  }
  std::string::append[abi:ne180100]<char const*,0>(&v29, v18, (std::string *)((char *)v18 + v17));
  BOOL IsContainedBy = JetPack::detail::pathIsContainedBy(&v30, (std::__fs::filesystem::path *)&v29, v19);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v29.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v30.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_45:
      if (IsContainedBy) {
        goto LABEL_46;
      }
LABEL_57:
      archive_entry_set_pathname();
      GlobalLog = getGlobalLog();
      if (os_log_type_enabled(GlobalLog, OS_LOG_TYPE_ERROR))
      {
        p_CFDataRef data = (void **)&__dst;
        if (v36 < 0) {
          p_CFDataRef data = (void **)&__dst->__r_.__value_.__l.__data_;
        }
        p_p = &__p;
        if ((__p.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          p_p = (std::__fs::filesystem::path *)__p.__pn_.__r_.__value_.__r.__words[0];
        }
        LODWORD(v40.__r_.__value_.__l.__data_) = 136446466;
        *(std::string::size_type *)((char *)v40.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_data;
        WORD2(v40.__r_.__value_.__r.__words[1]) = 2082;
        *(std::string::size_type *)((char *)&v40.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)p_p;
        _os_log_impl(&dword_218564000, GlobalLog, OS_LOG_TYPE_ERROR, "Path is outside output directory. Raw: %{public}s Resolved: %{public}s", (uint8_t *)&v40, 0x16u);
      }
      exception = (JetPack::PathOutsideOutputDestinationException *)__cxa_allocate_exception(0x38uLL);
      if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v28, __p.__pn_.__r_.__value_.__l.__data_, __p.__pn_.__r_.__value_.__l.__size_);
      }
      else {
        std::string v28 = __p.__pn_;
      }
      JetPack::PathOutsideOutputDestinationException::PathOutsideOutputDestinationException(exception, (std::__fs::filesystem::path *)&v28);
    }
  }
  else if ((SHIBYTE(v30.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_45;
  }
  operator delete(v30.__r_.__value_.__l.__data_);
  if (!IsContainedBy) {
    goto LABEL_57;
  }
LABEL_46:
  if ((archive_write_header() & 0x80000000) != 0)
  {
    archive_entry_set_pathname();
    HIBYTE(v27[2]) = 19;
    strcpy((char *)v27, "create file on disk");
    JetPack::throwLibArchiveException(v6, v27);
  }
  if (archive_entry_size() >= 1)
  {
    JetPack::ArchiveStream::getBackingArchive(a3);
    JetPack::detail::copyArchiveData();
  }
  int v21 = archive_write_finish_entry();
  archive_entry_set_pathname();
  if (v21 < 0)
  {
    HIBYTE(v26[2]) = 18;
    strcpy((char *)v26, "write file to disk");
    JetPack::throwLibArchiveException(v6, v26);
  }
  archive_write_close();
  if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v33.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_52:
      if ((SHIBYTE(v36) & 0x80000000) == 0) {
        goto LABEL_53;
      }
LABEL_67:
      operator delete(__dst);
      if (!v6) {
        return;
      }
      goto LABEL_68;
    }
  }
  else if ((SHIBYTE(v33.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_52;
  }
  operator delete(v33.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v36) < 0) {
    goto LABEL_67;
  }
LABEL_53:
  if (!v6) {
    return;
  }
LABEL_68:
  archive_write_free();
}

void sub_218570E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,__int16 a45,char a46,char a47,uint64_t a48,void *__p,uint64_t a50,int a51,__int16 a52,char a53,char a54,void *a55,uint64_t a56,int a57,__int16 a58,char a59,char a60)
{
  __cxa_free_exception(v61);
  if (a54 < 0) {
    operator delete(__p);
  }
  if (a60 < 0) {
    operator delete(a55);
  }
  if (*(char *)(v62 - 169) < 0) {
    operator delete(*(void **)(v62 - 192));
  }
  if (v60) {
    archive_write_free();
  }
  _Unwind_Resume(a1);
}

std::string *std::string::append[abi:ne180100]<char const*,0>(std::string *this, std::string *__src, std::string *a3)
{
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  size_t v7 = (char *)a3 - (char *)__src;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == __src) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unint64_t v11 = this->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    uint64_t v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    unint64_t v6 = HIBYTE(v11);
    if (this->__r_.__value_.__r.__words[0] > (unint64_t)__src) {
      goto LABEL_12;
    }
  }
  else
  {
    if (a3 == __src) {
      return this;
    }
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = 22;
    uint64_t v10 = this;
    if (this > __src)
    {
LABEL_12:
      if (v9 - size < v7)
      {
        std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
        this->__r_.__value_.__l.__size_ = size;
        LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
      }
      uint64_t v13 = this;
      if ((v6 & 0x80) != 0) {
        uint64_t v13 = (std::string *)this->__r_.__value_.__r.__words[0];
      }
      size_t v14 = (char *)v13 + size;
      unint64_t v15 = (char *)a3 - (char *)__src;
      if (a3 == __src) {
        goto LABEL_37;
      }
      if (v15 >= 0x20)
      {
        int v21 = (char *)v13 + size;
        if ((unint64_t)((char *)v13 + size - (char *)__src) >= 0x20)
        {
          char v16 = (std::string *)((char *)__src + (v15 & 0xFFFFFFFFFFFFFFE0));
          v14 += v15 & 0xFFFFFFFFFFFFFFE0;
          uint64_t v22 = v21 + 16;
          uint64_t v23 = &__src->__r_.__value_.__r.__words[2];
          unint64_t v24 = v15 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            long long v25 = *(_OWORD *)v23;
            *(v22 - 1) = *((_OWORD *)v23 - 1);
            *uint64_t v22 = v25;
            v22 += 2;
            v23 += 4;
            v24 -= 32;
          }
          while (v24);
          if (v15 == (v15 & 0xFFFFFFFFFFFFFFE0)) {
            goto LABEL_37;
          }
        }
        else
        {
          char v16 = __src;
        }
      }
      else
      {
        char v16 = __src;
      }
      do
      {
        std::string::value_type v26 = v16->__r_.__value_.__s.__data_[0];
        char v16 = (std::string *)((char *)v16 + 1);
        *v14++ = v26;
      }
      while (v16 != a3);
LABEL_37:
      std::string::value_type *v14 = 0;
      std::string::size_type v27 = v7 + size;
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
        this->__r_.__value_.__l.__size_ = v27;
      }
      else {
        *((unsigned char *)&this->__r_.__value_.__s + 23) = v27 & 0x7F;
      }
      return this;
    }
  }
  if ((std::string *)((char *)&v10->__r_.__value_.__l.__data_ + size + 1) <= __src) {
    goto LABEL_12;
  }
  if (v7 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v7 > 0x16)
  {
    uint64_t v17 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v17 = v7 | 7;
    }
    uint64_t v18 = v17 + 1;
    p_dst = (void **)operator new(v17 + 1);
    size_t v30 = v7;
    int64_t v31 = v18 | 0x8000000000000000;
    std::string __dst = p_dst;
    if (a3 == __src) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  HIBYTE(v31) = v7;
  p_dst = (void **)&__dst;
  if (a3 != __src)
  {
LABEL_22:
    memcpy(p_dst, __src, v7);
    p_dst = (void **)((char *)p_dst + v7);
  }
LABEL_23:
  *(unsigned char *)p_dst = 0;
  if (v31 >= 0) {
    uint64_t v19 = (const std::string::value_type *)&__dst;
  }
  else {
    uint64_t v19 = (const std::string::value_type *)__dst;
  }
  if (v31 >= 0) {
    std::string::size_type v20 = HIBYTE(v31);
  }
  else {
    std::string::size_type v20 = v30;
  }
  std::string::append(this, v19, v20);
  if (SHIBYTE(v31) < 0) {
    operator delete(__dst);
  }
  return this;
}

void sub_2185711D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL JetPack::detail::pathIsContainedBy(std::string *this, std::__fs::filesystem::path *a2, std::__fs::filesystem::path *a3)
{
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v22, this->__r_.__value_.__l.__data_, this->__r_.__value_.__l.__size_);
  }
  else {
    std::string v22 = *this;
  }
  JetPack::detail::resolvingAllSymlinksInNonExistentPath((const std::__fs::filesystem::path *)&v22, &v23);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v22.__r_.__value_.__l.__data_);
    if ((SHIBYTE(a2->__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_6;
    }
  }
  else if ((SHIBYTE(a2->__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_6:
    std::string pn = a2->__pn_;
    goto LABEL_9;
  }
  std::string::__init_copy_ctor_external(&pn, a2->__pn_.__r_.__value_.__l.__data_, a2->__pn_.__r_.__value_.__l.__size_);
LABEL_9:
  JetPack::detail::resolvingAllSymlinksInNonExistentPath((const std::__fs::filesystem::path *)&pn, &v21);
  if (SHIBYTE(pn.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(pn.__r_.__value_.__l.__data_);
  }
  std::__fs::filesystem::path::begin(&v13, &v21);
  std::__fs::filesystem::path::end(&v12, &v21);
  std::__fs::filesystem::path::begin(&v11, &v23);
  std::mismatch[abi:ne180100]<std::__fs::filesystem::path::iterator,std::__fs::filesystem::path::iterator>((uint64_t)&v13, (uint64_t)&v12, (uint64_t)&v11, (uint64_t)&v14);
  if ((SHIBYTE(v11.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v12.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_13;
    }
LABEL_27:
    operator delete(v12.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v13.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
  operator delete(v11.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_27;
  }
LABEL_13:
  if ((SHIBYTE(v13.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_14;
  }
LABEL_28:
  operator delete(v13.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
LABEL_14:
  std::__fs::filesystem::path::end(&__p, &v21);
  unint64_t v4 = v16;
  int v5 = v17;
  path_ptr = __p.__path_ptr_;
  CFDataRef data = __p.__entry_.__data_;
  if (SHIBYTE(__p.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    if ((v19 & 0x80000000) == 0)
    {
LABEL_16:
      if ((v15 & 0x80000000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_31;
    }
  }
  else if ((v19 & 0x80000000) == 0)
  {
    goto LABEL_16;
  }
  operator delete(v18);
  if ((v15 & 0x80000000) == 0)
  {
LABEL_17:
    if ((SHIBYTE(v21.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_18;
    }
LABEL_32:
    operator delete(v21.__pn_.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v23.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return v4 == path_ptr && v5 == data;
    }
    goto LABEL_33;
  }
LABEL_31:
  operator delete(v14);
  if (SHIBYTE(v21.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_32;
  }
LABEL_18:
  if ((SHIBYTE(v23.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    return v4 == path_ptr && v5 == data;
  }
LABEL_33:
  operator delete(v23.__pn_.__r_.__value_.__l.__data_);
  return v4 == path_ptr && v5 == data;
}

void sub_2185713C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  if (*(char *)(v46 - 49) < 0) {
    operator delete(*(void **)(v46 - 72));
  }
  _Unwind_Resume(exception_object);
}

void sub_218571494()
{
  if (*(char *)(v0 - 121) < 0) {
    JUMPOUT(0x218571474);
  }
  JUMPOUT(0x218571478);
}

void sub_2185714A8()
{
  if (*(char *)(v0 - 73) < 0) {
    JUMPOUT(0x218571484);
  }
  JUMPOUT(0x21857148CLL);
}

void std::mismatch[abi:ne180100]<std::__fs::filesystem::path::iterator,std::__fs::filesystem::path::iterator>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v12, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v12 = *(std::string *)a1;
  }
  v13[0] = *(_OWORD *)(a1 + 24);
  *(_OWORD *)((char *)v13 + 9) = *(_OWORD *)(a1 + 33);
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v10 = *(std::string *)a2;
  }
  v11[0] = *(_OWORD *)(a2 + 24);
  *(_OWORD *)((char *)v11 + 9) = *(_OWORD *)(a2 + 33);
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string __p = *(std::string *)a3;
  }
  v9[0] = *(_OWORD *)(a3 + 24);
  *(_OWORD *)((char *)v9 + 9) = *(_OWORD *)(a3 + 33);
  std::mismatch[abi:ne180100]<std::__fs::filesystem::path::iterator,std::__fs::filesystem::path::iterator,std::__equal_to>((uint64_t)&v12, (uint64_t)&v10, (uint64_t)&__p, a4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_12:
      if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        return;
      }
LABEL_16:
      operator delete(v12.__r_.__value_.__l.__data_);
      return;
    }
  }
  else if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_12;
  }
  operator delete(v10.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_16;
  }
}

void sub_218571604(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0)
  {
    operator delete(__p);
    if ((*(char *)(v25 - 89) & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((*(char *)(v25 - 89) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(*(void **)(v25 - 112));
  _Unwind_Resume(exception_object);
}

__n128 std::mismatch[abi:ne180100]<std::__fs::filesystem::path::iterator,std::__fs::filesystem::path::iterator,std::__equal_to>@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  size_t v7 = (_OWORD *)(a1 + 24);
  while (*(void *)(a1 + 24) != *(void *)(a2 + 24) || *(void *)(a1 + 32) != *(void *)(a2 + 32))
  {
    if (*(char *)(a1 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v15, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
      if ((*(char *)(a3 + 23) & 0x80000000) == 0)
      {
LABEL_7:
        std::string __p = *(std::string *)a3;
        goto LABEL_10;
      }
    }
    else
    {
      std::string v15 = *(std::string *)a1;
      if ((*(char *)(a3 + 23) & 0x80000000) == 0) {
        goto LABEL_7;
      }
    }
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
LABEL_10:
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v10.__data_ = (const std::string_view::value_type *)&__p;
    }
    else {
      v10.__data_ = (const std::string_view::value_type *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v10.__size_ = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      v10.__size_ = __p.__r_.__value_.__l.__size_;
    }
    int v11 = std::__fs::filesystem::path::__compare((const std::__fs::filesystem::path *)&v15, v10);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
      {
LABEL_21:
        operator delete(v15.__r_.__value_.__l.__data_);
        if (v11) {
          break;
        }
        goto LABEL_22;
      }
    }
    else if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    {
      goto LABEL_21;
    }
    if (v11) {
      break;
    }
LABEL_22:
    std::__fs::filesystem::path::iterator::__increment((std::__fs::filesystem::path::iterator *)a1);
    std::__fs::filesystem::path::iterator::__increment((std::__fs::filesystem::path::iterator *)a3);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)a4, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)a4 = *(_OWORD *)a1;
    *(void *)(a4 + 16) = *(void *)(a1 + 16);
  }
  *(_OWORD *)(a4 + 24) = *v7;
  *(_OWORD *)(a4 + 33) = *(_OWORD *)((char *)v7 + 9);
  std::string v12 = (std::string *)(a4 + 56);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v12, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v12->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *(void *)(a4 + 72) = *(void *)(a3 + 16);
  }
  *(_OWORD *)(a4 + 80) = *(_OWORD *)(a3 + 24);
  __n128 result = *(__n128 *)(a3 + 33);
  *(__n128 *)(a4 + 89) = result;
  return result;
}

void sub_21857182C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (*(char *)(v18 + 23) < 0) {
    operator delete(*(void **)v18);
  }
  _Unwind_Resume(exception_object);
}

uint64_t JetPack::detail::copyArchiveData()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v13 = 0;
  while (1)
  {
    int data_block = archive_read_data_block();
    if (data_block == 1) {
      break;
    }
    if (data_block < 0)
    {
      unint64_t v6 = archive_error_string();
      JetPack::archiveErrorToString(v6, &v12);
      GlobalLog = getGlobalLog();
      if (os_log_type_enabled(GlobalLog, OS_LOG_TYPE_ERROR))
      {
        size_t v8 = &v12;
        if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          size_t v8 = (std::string *)v12.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)std::string buf = 136446210;
        uint64_t v17 = v8;
        _os_log_impl(&dword_218564000, GlobalLog, OS_LOG_TYPE_ERROR, "Archive error occurred while reading data block: %{public}s", buf, 0xCu);
      }
      exception = __cxa_allocate_exception(0x20uLL);
      if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v11, v12.__r_.__value_.__l.__data_, v12.__r_.__value_.__l.__size_);
      }
      else {
        std::string v11 = v12;
      }
      JetPack::LibArchiveException::LibArchiveException(exception, (uint64_t)&v11);
    }
    if ((archive_write_data_block() & 0x80000000) != 0)
    {
      unint64_t v1 = archive_error_string();
      JetPack::archiveErrorToString(v1, &v12);
      uint64_t v2 = getGlobalLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        uint64_t v3 = &v12;
        if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          uint64_t v3 = (std::string *)v12.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)std::string buf = 136446210;
        uint64_t v17 = v3;
        _os_log_impl(&dword_218564000, v2, OS_LOG_TYPE_ERROR, "Archive error occurred while writing data block: %{public}s", buf, 0xCu);
      }
      unint64_t v4 = __cxa_allocate_exception(0x20uLL);
      if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v10, v12.__r_.__value_.__l.__data_, v12.__r_.__value_.__l.__size_);
      }
      else {
        std::string v10 = v12;
      }
      JetPack::LibArchiveException::LibArchiveException(v4, (uint64_t)&v10);
    }
  }
  return 0;
}

void sub_218571AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  __cxa_free_exception(v28);
  if (a28 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t JetPack::ArchiveStream::getBackingArchive(JetPack::ArchiveStream *this)
{
  return *((void *)this + 1);
}

uint64_t readStreamCallback(void *a1, uint64_t a2, uint64_t a3)
{
  int v5 = [a1 readCallback];
  uint64_t v6 = v5[2](v5, a2, a3);

  return v6;
}

void *std::function<BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::~function(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void std::__shared_ptr_emplace<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA7D0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA7D0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D46C1B0);
}

void JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>::~BrotliDecoderStreamImpl(void *a1)
{
  *a1 = &unk_26C9A9D88;
  uint64_t v2 = (void *)a1[9];
  if (v2)
  {
    a1[10] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[8];
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  uint64_t v4 = a1[1];
  a1[1] = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  JUMPOUT(0x21D46C1B0);
}

uint64_t JetPack::BaseStream::seekToEnd(JetPack::BaseStream *this)
{
  uint64_t result = (*(uint64_t (**)(JetPack::BaseStream *))(*(void *)this + 32))(this);
  if ((result & 1) == 0)
  {
    do
    {
      (*(void (**)(JetPack::BaseStream *, uint64_t))(*(void *)this + 48))(this, 1024);
      uint64_t result = (*(uint64_t (**)(JetPack::BaseStream *))(*(void *)this + 32))(this);
    }
    while (!result);
  }
  return result;
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264328AA8, MEMORY[0x263F8C060]);
}

void sub_218572538(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void JetPack::NotEnoughDataException::~NotEnoughDataException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26C9AA300;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
}

JetPack::BrotliStreamNotFinishedAfterDecodingException *JetPack::BrotliStreamNotFinishedAfterDecodingException::BrotliStreamNotFinishedAfterDecodingException(JetPack::BrotliStreamNotFinishedAfterDecodingException *this)
{
  uint64_t v2 = (char *)operator new(0x28uLL);
  strcpy(v2, "BrotliStreamNotFinishedAfterDecoding");
  *(void *)this = &unk_26C9AA300;
  std::string::__init_copy_ctor_external((std::string *)((char *)this + 8), v2, 0x24uLL);
  operator delete(v2);
  *(void *)this = &unk_26C9AA2D8;
  return this;
}

void sub_218572688(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

JetPack::BrotliAvailableInNotEmptyOnFillException *JetPack::BrotliAvailableInNotEmptyOnFillException::BrotliAvailableInNotEmptyOnFillException(JetPack::BrotliAvailableInNotEmptyOnFillException *this)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  strcpy(v2, "BrotliAvailableInNotEmptyOnFill");
  *(void *)this = &unk_26C9AA300;
  std::string::__init_copy_ctor_external((std::string *)((char *)this + 8), v2, 0x1FuLL);
  operator delete(v2);
  *(void *)this = &unk_26C9AA260;
  return this;
}

void sub_21857274C(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

void JetPack::BrotliAvailableInNotEmptyOnFillException::~BrotliAvailableInNotEmptyOnFillException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26C9AA300;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
  JUMPOUT(0x21D46C1B0);
}

uint64_t JetPack::Exception::what(JetPack::Exception *this)
{
  uint64_t result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0) {
    return *(void *)result;
  }
  return result;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

JetPack::BrotliUnknownDecoderResultException *JetPack::BrotliUnknownDecoderResultException::BrotliUnknownDecoderResultException(JetPack::BrotliUnknownDecoderResultException *this, int a2)
{
  v12.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&v12.__r_.__value_.__r.__words[1] = xmmword_21857B020;
  strcpy(v12.__r_.__value_.__l.__data_, "BrotliUnknownDecoderResult");
  uint64_t v4 = std::string::append(&v12, " result=");
  std::to_string(&__p, a2);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  size_t v7 = std::string::append(v4, (const std::string::value_type *)p_p, size);
  if (SHIBYTE(v7->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v13, v7->__r_.__value_.__l.__data_, v7->__r_.__value_.__l.__size_);
  }
  else
  {
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v13.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v8;
  }
  *(void *)this = &unk_26C9AA300;
  std::string::size_type v9 = (std::string *)((char *)this + 8);
  if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
    *((void *)this + 3) = *((void *)&v13.__r_.__value_.__l + 2);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_12;
    }
LABEL_16:
    if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  std::string::__init_copy_ctor_external(v9, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v13.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_16;
    }
  }
  else if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_16;
  }
LABEL_12:
  operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
LABEL_13:
  }
    operator delete(v12.__r_.__value_.__l.__data_);
LABEL_17:
  *(void *)this = &unk_26C9AA198;
  *((_DWORD *)this + 8) = a2;
  return this;
}

void sub_218572998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  std::exception::~exception(v26);
  if (a26 < 0)
  {
    operator delete(__p);
    if (a14 < 0)
    {
LABEL_5:
      operator delete(a9);
      if ((a20 & 0x80000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_8;
    }
  }
  else if (a14 < 0)
  {
    goto LABEL_5;
  }
  if ((a20 & 0x80000000) == 0) {
LABEL_6:
  }
    _Unwind_Resume(a1);
LABEL_8:
  operator delete(a15);
  _Unwind_Resume(a1);
}

void JetPack::BrotliUnknownDecoderResultException::~BrotliUnknownDecoderResultException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26C9AA300;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
  JUMPOUT(0x21D46C1B0);
}

void std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::~__func()
{
}

void *std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26C9AA380;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::target(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021857B2B1
    || ((v3 & 0x800000021857B2B1 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000021857B2B1)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021857B2B1 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::target_type()
{
}

JetPack::InputStreamRequiredException *JetPack::InputStreamRequiredException::InputStreamRequiredException(JetPack::InputStreamRequiredException *this)
{
  char v4 = 19;
  strcpy(__p, "InputStreamRequired");
  JetPack::ReaderException::ReaderException(this, (uint64_t)__p);
  if (v4 < 0) {
    operator delete(*(void **)__p);
  }
  *(void *)this = &unk_26C9A9EF0;
  return this;
}

void sub_218572BE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *JetPack::ReaderException::ReaderException(void *a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  *a1 = &unk_26C9AA300;
  uint64_t v3 = (std::string *)(a1 + 1);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v3, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    a1[3] = *((void *)&__p.__r_.__value_.__l + 2);
  }
  *a1 = &unk_26C9A9BC0;
  return a1;
}

void sub_218572CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  std::exception::~exception(v14);
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

JetPack::InvalidSegmentTagException *JetPack::InvalidSegmentTagException::InvalidSegmentTagException(JetPack::InvalidSegmentTagException *this, int a2)
{
  *((unsigned char *)&v11.__r_.__value_.__s + 23) = 17;
  strcpy((char *)&v11, "InvalidSegmentTag");
  char v4 = std::string::append(&v11, " tag=");
  std::to_string(&v10, a2);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v5 = &v10;
  }
  else {
    int v5 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v10.__r_.__value_.__l.__size_;
  }
  size_t v7 = std::string::append(v4, (const std::string::value_type *)v5, size);
  if (SHIBYTE(v7->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v12, v7->__r_.__value_.__l.__data_, v7->__r_.__value_.__l.__size_);
  }
  else
  {
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v12.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v8;
  }
  JetPack::ReaderException::ReaderException(this, (uint64_t)&v12);
  if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_12;
    }
LABEL_15:
    operator delete(v10.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v11.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_13;
    }
LABEL_16:
    operator delete(v11.__r_.__value_.__l.__data_);
    goto LABEL_13;
  }
  operator delete(v12.__r_.__value_.__l.__data_);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_15;
  }
LABEL_12:
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_16;
  }
LABEL_13:
  *(void *)this = &unk_26C9A9E48;
  *((_DWORD *)this + 8) = a2;
  return this;
}

void sub_218572E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0)
  {
    operator delete(__p);
    if (a15 < 0)
    {
LABEL_5:
      operator delete(a10);
      if ((a21 & 0x80000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_8;
    }
  }
  else if (a15 < 0)
  {
    goto LABEL_5;
  }
  if ((a21 & 0x80000000) == 0) {
LABEL_6:
  }
    _Unwind_Resume(a1);
LABEL_8:
  operator delete(a16);
  _Unwind_Resume(a1);
}

void *std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26C9AA328;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C9AA328;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>::target(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021857B49FLL
    || ((v3 & 0x800000021857B49FLL & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000021857B49FLL)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021857B49FLL & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>::target_type()
{
}

void *std::__function::__value_func<BOOL ()(JetPack::ReaderConfig &,JetPack::SegmentTag,std::shared_ptr<JetPack::BaseStream>)>::swap[abi:ne180100](void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    uint64_t v3 = result;
    char v4 = (void *)result[3];
    int v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_218573214(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseRootSegmentException &>(uint64_t a1)
{
}

JetPack::UnsupportedJetPackVersionException *JetPack::UnsupportedJetPackVersionException::UnsupportedJetPackVersionException(JetPack::UnsupportedJetPackVersionException *this)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  strcpy(v2, "UnsupportedJetPackVersion");
  *(void *)this = &unk_26C9AA300;
  std::string::__init_copy_ctor_external((std::string *)((char *)this + 8), v2, 0x19uLL);
  operator delete(v2);
  *(void *)this = &unk_26C9AA170;
  return this;
}

void sub_2185732D4(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

JetPack::SignatureVerifierRequiredException *JetPack::SignatureVerifierRequiredException::SignatureVerifierRequiredException(JetPack::SignatureVerifierRequiredException *this)
{
  std::string __p = operator new(0x20uLL);
  long long v4 = xmmword_21857B560;
  strcpy((char *)__p, "SignatureVerifierRequired");
  JetPack::ReaderException::ReaderException(this, (uint64_t)&__p);
  if (SHIBYTE(v4) < 0) {
    operator delete(__p);
  }
  *(void *)this = &unk_26C9AA120;
  return this;
}

void sub_218573388(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3B0] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C200], MEMORY[0x263F8C088]);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x21D46C1B0);
}

void std::__shared_ptr_emplace<JetPack::SignedStreamDecoder>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA798;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::SignedStreamDecoder>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA798;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D46C1B0);
}

void std::__throw_with_nested<JetPack::UnableToParseRootSegmentException &,JetPack::UnableToParseRootSegmentException,true>::__do_throw[abi:ne180100](uint64_t a1)
{
  exception = (std::nested_exception *)__cxa_allocate_exception(0x30uLL);
  std::__nested<JetPack::UnableToParseRootSegmentException>::__nested[abi:ne180100](exception, a1);
}

void sub_218573534(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::nested_exception *std::__nested<JetPack::UnableToParseRootSegmentException>::__nested[abi:ne180100](std::nested_exception *a1, uint64_t a2)
{
  a1->__vftable = (std::nested_exception_vtbl *)&unk_26C9AA300;
  p_ptr = (std::string *)&a1->__ptr_;
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(p_ptr, *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    long long v4 = *(_OWORD *)(a2 + 8);
    p_ptr->__r_.__value_.__r.__words[2] = *(void *)(a2 + 24);
    *(_OWORD *)&p_ptr->__r_.__value_.__l.__data_ = v4;
  }
  a1->__vftable = (std::nested_exception_vtbl *)&unk_26C9AA0D0;
  std::nested_exception::nested_exception(a1 + 2);
  a1->__vftable = (std::nested_exception_vtbl *)&unk_26C9AAAC8;
  a1[2].__vftable = (std::nested_exception_vtbl *)&unk_26C9AAAF0;
  return a1;
}

void sub_218573610(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void std::__nested<JetPack::UnableToParseRootSegmentException>::~__nested(uint64_t a1)
{
  std::nested_exception::~nested_exception((std::nested_exception *)(a1 + 32));
  *(void *)a1 = &unk_26C9AA300;
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  std::exception::~exception((std::exception *)a1);
}

{
  uint64_t vars8;

  std::nested_exception::~nested_exception((std::nested_exception *)(a1 + 32));
  *(void *)a1 = &unk_26C9AA300;
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  std::exception::~exception((std::exception *)a1);
  JUMPOUT(0x21D46C1B0);
}

void non-virtual thunk to'std::__nested<JetPack::UnableToParseRootSegmentException>::~__nested(std::nested_exception *a1)
{
  unint64_t v1 = (std::exception *)&a1[-2];
  std::nested_exception::~nested_exception(a1);
  *(void *)(v2 - 32) = &unk_26C9AA300;
  if (*(char *)(v2 - 1) < 0) {
    operator delete(*(void **)(v2 - 24));
  }
  std::exception::~exception(v1);
}

{
  std::exception *v1;
  uint64_t v2;
  uint64_t vars8;

  unint64_t v1 = (std::exception *)&a1[-2];
  std::nested_exception::~nested_exception(a1);
  *(void *)(v2 - 32) = &unk_26C9AA300;
  if (*(char *)(v2 - 1) < 0) {
    operator delete(*(void **)(v2 - 24));
  }
  std::exception::~exception(v1);
  JUMPOUT(0x21D46C1B0);
}

void std::__shared_ptr_emplace<JetPack::PartialStream>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA6F0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::PartialStream>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA6F0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D46C1B0);
}

void std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseDataSegmentException &>(uint64_t a1)
{
}

void std::__throw_with_nested<JetPack::UnableToParseDataSegmentException &,JetPack::UnableToParseDataSegmentException,true>::__do_throw[abi:ne180100](uint64_t a1)
{
  exception = (std::nested_exception *)__cxa_allocate_exception(0x30uLL);
  std::__nested<JetPack::UnableToParseDataSegmentException>::__nested[abi:ne180100](exception, a1);
}

void sub_218573958(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::nested_exception *std::__nested<JetPack::UnableToParseDataSegmentException>::__nested[abi:ne180100](std::nested_exception *a1, uint64_t a2)
{
  a1->__vftable = (std::nested_exception_vtbl *)&unk_26C9AA300;
  p_ptr = (std::string *)&a1->__ptr_;
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(p_ptr, *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    long long v4 = *(_OWORD *)(a2 + 8);
    p_ptr->__r_.__value_.__r.__words[2] = *(void *)(a2 + 24);
    *(_OWORD *)&p_ptr->__r_.__value_.__l.__data_ = v4;
  }
  a1->__vftable = (std::nested_exception_vtbl *)&unk_26C9AA0A8;
  std::nested_exception::nested_exception(a1 + 2);
  a1->__vftable = (std::nested_exception_vtbl *)&unk_26C9AAA80;
  a1[2].__vftable = (std::nested_exception_vtbl *)&unk_26C9AAAA8;
  return a1;
}

void sub_218573A34(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseSerializationSegmentException &>(uint64_t a1)
{
}

void *JetPack::LibArchiveException::LibArchiveException(void *a1, uint64_t a2)
{
  *((unsigned char *)&__p.__r_.__value_.__s + 23) = 19;
  strcpy((char *)&__p, "LibArchiveException");
  long long v4 = std::string::append(&__p, " message=");
  int v5 = *(char *)(a2 + 23);
  if (v5 >= 0) {
    uint64_t v6 = (const std::string::value_type *)a2;
  }
  else {
    uint64_t v6 = *(const std::string::value_type **)a2;
  }
  if (v5 >= 0) {
    std::string::size_type v7 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v7 = *(void *)(a2 + 8);
  }
  long long v8 = std::string::append(v4, v6, v7);
  if (SHIBYTE(v8->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v13, v8->__r_.__value_.__l.__data_, v8->__r_.__value_.__l.__size_);
  }
  else
  {
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v13.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v9;
  }
  *a1 = &unk_26C9AA300;
  std::string v10 = (std::string *)(a1 + 1);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v10, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v13.__r_.__value_.__l.__data_);
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
LABEL_15:
    }
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
    a1[3] = *((void *)&v13.__r_.__value_.__l + 2);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_15;
    }
  }
LABEL_16:
  *a1 = &unk_26C9A9C98;
  return a1;
}

void sub_218573B98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  std::exception::~exception(v21);
  if (a21 < 0)
  {
    operator delete(__p);
    if ((a14 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(a1);
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<JetPack::ArchiveStream>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA6B8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::ArchiveStream>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA6B8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D46C1B0);
}

void std::__throw_with_nested<JetPack::UnableToParseSerializationSegmentException &,JetPack::UnableToParseSerializationSegmentException,true>::__do_throw[abi:ne180100](uint64_t a1)
{
  exception = (std::nested_exception *)__cxa_allocate_exception(0x30uLL);
  std::__nested<JetPack::UnableToParseSerializationSegmentException>::__nested[abi:ne180100](exception, a1);
}

void sub_218573CA8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::nested_exception *std::__nested<JetPack::UnableToParseSerializationSegmentException>::__nested[abi:ne180100](std::nested_exception *a1, uint64_t a2)
{
  a1->__vftable = (std::nested_exception_vtbl *)&unk_26C9AA300;
  p_ptr = (std::string *)&a1->__ptr_;
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(p_ptr, *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    long long v4 = *(_OWORD *)(a2 + 8);
    p_ptr->__r_.__value_.__r.__words[2] = *(void *)(a2 + 24);
    *(_OWORD *)&p_ptr->__r_.__value_.__l.__data_ = v4;
  }
  a1->__vftable = (std::nested_exception_vtbl *)&unk_26C9AA2B0;
  std::nested_exception::nested_exception(a1 + 2);
  a1->__vftable = (std::nested_exception_vtbl *)&unk_26C9AABA0;
  a1[2].__vftable = (std::nested_exception_vtbl *)&unk_26C9AABC8;
  return a1;
}

void sub_218573D84(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

JetPack::InvalidEncryptionTagLengthException *JetPack::InvalidEncryptionTagLengthException::InvalidEncryptionTagLengthException(JetPack::InvalidEncryptionTagLengthException *this)
{
  std::string __p = operator new(0x20uLL);
  long long v4 = xmmword_21857B020;
  strcpy((char *)__p, "InvalidEncryptionTagLength");
  JetPack::ParseException::ParseException(this, (uint64_t)&__p);
  if (SHIBYTE(v4) < 0) {
    operator delete(__p);
  }
  *(void *)this = &unk_26C9AA1C0;
  return this;
}

void sub_218573E30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  unint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

JetPack::CommonCryptoInvalidStatusException *JetPack::CommonCryptoInvalidStatusException::CommonCryptoInvalidStatusException(JetPack::CommonCryptoInvalidStatusException *this, int a2)
{
  v12.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&v12.__r_.__value_.__r.__words[1] = xmmword_21857B560;
  strcpy(v12.__r_.__value_.__l.__data_, "CommonCryptoInvalidStatus");
  long long v4 = std::string::append(&v12, " statusCode=");
  std::to_string(&__p, a2);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  std::string::size_type v7 = std::string::append(v4, (const std::string::value_type *)p_p, size);
  if (SHIBYTE(v7->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v13, v7->__r_.__value_.__l.__data_, v7->__r_.__value_.__l.__size_);
  }
  else
  {
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v13.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v8;
  }
  *(void *)this = &unk_26C9AA300;
  long long v9 = (std::string *)((char *)this + 8);
  if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
    *((void *)this + 3) = *((void *)&v13.__r_.__value_.__l + 2);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_12;
    }
LABEL_16:
    if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  std::string::__init_copy_ctor_external(v9, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v13.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_16;
    }
  }
  else if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_16;
  }
LABEL_12:
  operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
LABEL_13:
  }
    operator delete(v12.__r_.__value_.__l.__data_);
LABEL_17:
  *(void *)this = &unk_26C9AA0F8;
  *((_DWORD *)this + 8) = a2;
  return this;
}

void sub_21857410C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  std::exception::~exception(v26);
  if (a26 < 0)
  {
    operator delete(__p);
    if (a14 < 0)
    {
LABEL_5:
      operator delete(a9);
      if ((a20 & 0x80000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_8;
    }
  }
  else if (a14 < 0)
  {
    goto LABEL_5;
  }
  if ((a20 & 0x80000000) == 0) {
LABEL_6:
  }
    _Unwind_Resume(a1);
LABEL_8:
  operator delete(a15);
  _Unwind_Resume(a1);
}

const void **std::__for_each_segment[abi:ne180100]<std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>,std::__move_loop<std::_ClassicAlgPolicy>::_MoveSegment<std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>,std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>>>(const void **result, unsigned char *__src, const void **a3, unsigned char *a4, uint64_t a5)
{
  std::string::size_type v7 = __src;
  long long v9 = *(void ***)a5;
  long long v8 = *(char **)(a5 + 8);
  if (result == a3)
  {
    if (__src == a4) {
      goto LABEL_51;
    }
    char v19 = (char *)*v9++;
    uint64_t v18 = v19;
    while (1)
    {
      uint64_t v20 = v18 - v8 + 4096;
      if (a4 - v7 >= v20) {
        size_t v21 = v20;
      }
      else {
        size_t v21 = a4 - v7;
      }
      if (v21) {
        uint64_t result = (const void **)memmove(v8, v7, v21);
      }
      v7 += v21;
      if (v7 == a4) {
        break;
      }
      std::string v22 = (char *)*v9++;
      uint64_t v18 = v22;
      long long v8 = v22;
    }
    v8 += v21;
    goto LABEL_48;
  }
  std::string v11 = result;
  std::string v12 = (char *)*result + 4096;
  if (v12 != __src)
  {
    uint64_t v14 = (char *)*v9++;
    std::string v13 = v14;
    while (1)
    {
      uint64_t v15 = v13 - v8 + 4096;
      if (v12 - v7 >= v15) {
        size_t v16 = v15;
      }
      else {
        size_t v16 = v12 - v7;
      }
      if (v16) {
        uint64_t result = (const void **)memmove(v8, v7, v16);
      }
      v7 += v16;
      if (v7 == v12) {
        break;
      }
      uint64_t v17 = (char *)*v9++;
      std::string v13 = v17;
      long long v8 = v17;
    }
    v8 += v16;
    if ((char *)*(v9 - 1) + 4096 == v8) {
      long long v8 = (char *)*v9;
    }
    else {
      --v9;
    }
  }
  *(void *)a5 = v9;
  *(void *)(a5 + 8) = v8;
  for (i = v11 + 1; i != a3; ++i)
  {
    uint64_t v24 = 0;
    uint64_t v25 = (char *)*i;
    std::string::size_type v27 = (char *)*v9++;
    std::string::value_type v26 = v27;
    while (1)
    {
      uint64_t v28 = v26 - v8 + 4096;
      if (4096 - v24 >= v28) {
        size_t v29 = v28;
      }
      else {
        size_t v29 = 4096 - v24;
      }
      if (v29) {
        uint64_t result = (const void **)memmove(v8, &v25[v24], v29);
      }
      v24 += v29;
      if (v24 == 4096) {
        break;
      }
      size_t v30 = (char *)*v9++;
      std::string::value_type v26 = v30;
      long long v8 = v30;
    }
    v8 += v29;
    if ((char *)*(v9 - 1) + 4096 == v8) {
      long long v8 = (char *)*v9;
    }
    else {
      --v9;
    }
    *(void *)a5 = v9;
    *(void *)(a5 + 8) = v8;
  }
  int64_t v31 = *a3;
  if (v31 != a4)
  {
    std::__fs::filesystem::path v33 = (char *)*v9++;
    uint64_t v32 = v33;
    while (1)
    {
      uint64_t v34 = v32 - v8 + 4096;
      size_t v35 = a4 - v31 >= v34 ? v34 : a4 - v31;
      if (v35) {
        uint64_t result = (const void **)memmove(v8, v31, v35);
      }
      v31 += v35;
      if (v31 == a4) {
        break;
      }
      int64_t v36 = (char *)*v9++;
      uint64_t v32 = v36;
      long long v8 = v36;
    }
    v8 += v35;
LABEL_48:
    if ((char *)*(v9 - 1) + 4096 == v8) {
      long long v8 = (char *)*v9;
    }
    else {
      --v9;
    }
  }
LABEL_51:
  *(void *)a5 = v9;
  *(void *)(a5 + 8) = v8;
  return result;
}

void std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseEncryptedSegmentException &>(uint64_t a1)
{
}

JetPack::KeyProviderNotSpecifiedException *JetPack::KeyProviderNotSpecifiedException::KeyProviderNotSpecifiedException(JetPack::KeyProviderNotSpecifiedException *this)
{
  std::string __p = operator new(0x19uLL);
  long long v4 = xmmword_21857B970;
  strcpy((char *)__p, "KeyProviderNotSpecified");
  JetPack::ReaderException::ReaderException(this, (uint64_t)&__p);
  if (SHIBYTE(v4) < 0) {
    operator delete(__p);
  }
  *(void *)this = &unk_26C9AA030;
  return this;
}

void sub_21857446C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

JetPack::BlockExceedsMaximumSizeException *JetPack::BlockExceedsMaximumSizeException::BlockExceedsMaximumSizeException(JetPack::BlockExceedsMaximumSizeException *this)
{
  std::string __p = operator new(0x19uLL);
  long long v4 = xmmword_21857B970;
  strcpy((char *)__p, "BlockExceedsMaximumSize");
  JetPack::ParseException::ParseException(this, (uint64_t)&__p);
  if (SHIBYTE(v4) < 0) {
    operator delete(__p);
  }
  *(void *)this = &unk_26C9A9FB8;
  return this;
}

void sub_218574520(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

JetPack::MissingEncryptionKeyException *JetPack::MissingEncryptionKeyException::MissingEncryptionKeyException(JetPack::MissingEncryptionKeyException *this, int a2)
{
  *((unsigned char *)&v11.__r_.__value_.__s + 23) = 20;
  strcpy((char *)&v11, "MissingEncryptionKey");
  long long v4 = std::string::append(&v11, " identifier=");
  std::to_string(&v10, a2);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v5 = &v10;
  }
  else {
    int v5 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v10.__r_.__value_.__l.__size_;
  }
  std::string::size_type v7 = std::string::append(v4, (const std::string::value_type *)v5, size);
  if (SHIBYTE(v7->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v12, v7->__r_.__value_.__l.__data_, v7->__r_.__value_.__l.__size_);
  }
  else
  {
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v12.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v8;
  }
  JetPack::ReaderException::ReaderException(this, (uint64_t)&v12);
  if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_12;
    }
LABEL_15:
    operator delete(v10.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v11.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_13;
    }
LABEL_16:
    operator delete(v11.__r_.__value_.__l.__data_);
    goto LABEL_13;
  }
  operator delete(v12.__r_.__value_.__l.__data_);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_15;
  }
LABEL_12:
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_16;
  }
LABEL_13:
  *(void *)this = &unk_26C9A9F68;
  *((_WORD *)this + 16) = a2;
  return this;
}

void sub_218574678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0)
  {
    operator delete(__p);
    if (a15 < 0)
    {
LABEL_5:
      operator delete(a10);
      if ((a21 & 0x80000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_8;
    }
  }
  else if (a15 < 0)
  {
    goto LABEL_5;
  }
  if ((a21 & 0x80000000) == 0) {
LABEL_6:
  }
    _Unwind_Resume(a1);
LABEL_8:
  operator delete(a16);
  _Unwind_Resume(a1);
}

void JetPack::MissingEncryptionKeyException::~MissingEncryptionKeyException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26C9AA300;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
  JUMPOUT(0x21D46C1B0);
}

void std::__shared_ptr_emplace<JetPack::AESDecoderStream>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA760;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::AESDecoderStream>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA760;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D46C1B0);
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_with_nested<JetPack::UnableToParseEncryptedSegmentException &,JetPack::UnableToParseEncryptedSegmentException,true>::__do_throw[abi:ne180100](uint64_t a1)
{
  exception = (std::nested_exception *)__cxa_allocate_exception(0x30uLL);
  std::__nested<JetPack::UnableToParseEncryptedSegmentException>::__nested[abi:ne180100](exception, a1);
}

void sub_218574838(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::nested_exception *std::__nested<JetPack::UnableToParseEncryptedSegmentException>::__nested[abi:ne180100](std::nested_exception *a1, uint64_t a2)
{
  a1->__vftable = (std::nested_exception_vtbl *)&unk_26C9AA300;
  p_ptr = (std::string *)&a1->__ptr_;
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(p_ptr, *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    long long v4 = *(_OWORD *)(a2 + 8);
    p_ptr->__r_.__value_.__r.__words[2] = *(void *)(a2 + 24);
    *(_OWORD *)&p_ptr->__r_.__value_.__l.__data_ = v4;
  }
  a1->__vftable = (std::nested_exception_vtbl *)&unk_26C9AA238;
  std::nested_exception::nested_exception(a1 + 2);
  a1->__vftable = (std::nested_exception_vtbl *)&unk_26C9AAB58;
  a1[2].__vftable = (std::nested_exception_vtbl *)&unk_26C9AAB80;
  return a1;
}

void sub_218574914(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void *JetPack::readMultiSegmentContainer(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>,std::function<BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>)::$_0::~$_0(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = (void *)a1[4];
  if (v3 == a1 + 1)
  {
    (*(void (**)(void *))(a1[1] + 32))(a1 + 1);
  }
  else if (v3)
  {
    (*(void (**)(void *))(*v3 + 40))(v3);
  }
  return a1;
}

void std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseMultiSegmentException &>(uint64_t a1)
{
}

void std::__throw_with_nested<JetPack::UnableToParseMultiSegmentException &,JetPack::UnableToParseMultiSegmentException,true>::__do_throw[abi:ne180100](uint64_t a1)
{
  exception = __cxa_allocate_exception(0x38uLL);
  std::__nested<JetPack::UnableToParseMultiSegmentException>::__nested[abi:ne180100]((uint64_t)exception, a1);
}

void sub_218574A50(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__nested<JetPack::UnableToParseMultiSegmentException>::__nested[abi:ne180100](uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C9AA300;
  long long v4 = (std::string *)(a1 + 8);
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 8);
    v4->__r_.__value_.__r.__words[2] = *(void *)(a2 + 24);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  }
  *(void *)a1 = &unk_26C9AA148;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::nested_exception::nested_exception((std::nested_exception *)(a1 + 40));
  *(void *)a1 = &unk_26C9AAB10;
  *(void *)(a1 + 40) = &unk_26C9AAB38;
  return a1;
}

void sub_218574B34(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void std::__nested<JetPack::UnableToParseMultiSegmentException>::~__nested(uint64_t a1)
{
  std::nested_exception::~nested_exception((std::nested_exception *)(a1 + 40));
  *(void *)a1 = &unk_26C9AA300;
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  std::exception::~exception((std::exception *)a1);
}

{
  uint64_t vars8;

  std::nested_exception::~nested_exception((std::nested_exception *)(a1 + 40));
  *(void *)a1 = &unk_26C9AA300;
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  std::exception::~exception((std::exception *)a1);
  JUMPOUT(0x21D46C1B0);
}

void non-virtual thunk to'std::__nested<JetPack::UnableToParseMultiSegmentException>::~__nested(std::nested_exception *a1)
{
  p_ptr = (std::exception *)&a1[-3].__ptr_;
  std::nested_exception::~nested_exception(a1);
  *(void *)(v2 - 40) = &unk_26C9AA300;
  if (*(char *)(v2 - 9) < 0) {
    operator delete(*(void **)(v2 - 32));
  }
  std::exception::~exception(p_ptr);
}

{
  std::exception *p_ptr;
  uint64_t v2;
  uint64_t vars8;

  p_ptr = (std::exception *)&a1[-3].__ptr_;
  std::nested_exception::~nested_exception(a1);
  *(void *)(v2 - 40) = &unk_26C9AA300;
  if (*(char *)(v2 - 9) < 0) {
    operator delete(*(void **)(v2 - 32));
  }
  std::exception::~exception(p_ptr);
  JUMPOUT(0x21D46C1B0);
}

JetPack::MissingTerminationBlockException *JetPack::MissingTerminationBlockException::MissingTerminationBlockException(JetPack::MissingTerminationBlockException *this)
{
  std::string __p = operator new(0x19uLL);
  long long v4 = xmmword_21857B970;
  strcpy((char *)__p, "MissingTerminationBlock");
  JetPack::ParseException::ParseException(this, (uint64_t)&__p);
  if (SHIBYTE(v4) < 0) {
    operator delete(__p);
  }
  *(void *)this = &unk_26C9AA058;
  return this;
}

void sub_218574DA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

JetPack::InvalidSignatureException *JetPack::InvalidSignatureException::InvalidSignatureException(JetPack::InvalidSignatureException *this)
{
  char v4 = 16;
  strcpy(__p, "InvalidSignature");
  JetPack::ReaderException::ReaderException(this, (uint64_t)__p);
  if (v4 < 0) {
    operator delete(*(void **)__p);
  }
  *(void *)this = &unk_26C9A9DD0;
  return this;
}

void sub_218574E38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void readToEndVector(JetPack::BaseStream *a1@<X0>, void **a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<unsigned char>::__append(a2, 0x20000uLL);
  for (unint64_t i = 0;
        ;
        i += (*(uint64_t (**)(JetPack::BaseStream *, char *, int64_t))(*(void *)a1 + 16))(a1, &v6[i], v8 - v7))
  {
    char v5 = (*(uint64_t (**)(JetPack::BaseStream *))(*(void *)a1 + 32))(a1);
    uint64_t v6 = (char *)*a2;
    if (v5) {
      break;
    }
    std::string::size_type v7 = &v6[i];
    long long v8 = (char *)a2[1];
    if ((unint64_t)((unsigned char *)a2[2] - &v6[i]) >> 10 <= 4)
    {
      size_t v9 = v8 - v6;
      if (v8 - v6 < 1)
      {
        if ((v9 & 0x8000000000000000) != 0)
        {
          long long v8 = &v6[2 * v9];
          a2[1] = v8;
        }
      }
      else
      {
        std::vector<unsigned char>::__append(a2, v9);
        uint64_t v6 = (char *)*a2;
        long long v8 = (char *)a2[1];
        std::string::size_type v7 = (char *)*a2 + i;
      }
    }
  }
  unint64_t v10 = (unsigned char *)a2[1] - v6;
  if (i <= v10)
  {
    if (i < v10) {
      a2[1] = &v6[i];
    }
  }
  else
  {
    std::vector<unsigned char>::__append(a2, i - v10);
  }
}

void sub_218574F70(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

JetPack::InvalidDataAfterTerminationBlockException *JetPack::InvalidDataAfterTerminationBlockException::InvalidDataAfterTerminationBlockException(JetPack::InvalidDataAfterTerminationBlockException *this)
{
  std::string __p = operator new(0x28uLL);
  long long v4 = xmmword_21857BB40;
  strcpy((char *)__p, "InvalidDataAfterTerminationBlock");
  JetPack::ParseException::ParseException(this, (uint64_t)&__p);
  if (SHIBYTE(v4) < 0) {
    operator delete(__p);
  }
  *(void *)this = &unk_26C9AA288;
  return this;
}

void sub_218575028(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<unsigned char>::__append(void **a1, size_t a2)
{
  char v5 = (char *)a1[1];
  long long v4 = a1[2];
  uint64_t v6 = v5;
  if (v4 - v5 < a2)
  {
    std::string::size_type v7 = (char *)*a1;
    unint64_t v8 = v5 - (unsigned char *)*a1;
    unint64_t v9 = v8 + a2;
    if ((uint64_t)(v8 + a2) < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = v4 - v7;
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v11 = v9;
    }
    if (v11) {
      std::string v12 = (char *)operator new(v11);
    }
    else {
      std::string v12 = 0;
    }
    std::string v13 = &v12[v8];
    uint64_t v14 = &v12[v11];
    uint64_t v15 = &v12[v8 + a2];
    bzero(&v12[v8], a2);
    if (v5 == v7)
    {
      v12 += v8;
      goto LABEL_32;
    }
    if (v8 >= 8 && (unint64_t)(v7 - v12) >= 0x20)
    {
      if (v8 < 0x20)
      {
        unint64_t v16 = 0;
        goto LABEL_24;
      }
      unint64_t v16 = v8 & 0xFFFFFFFFFFFFFFE0;
      uint64_t v17 = v5 - 16;
      uint64_t v18 = &v12[v5 - 16 - v7];
      unint64_t v19 = v8 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        long long v20 = *(_OWORD *)v17;
        *((_OWORD *)v18 - 1) = *((_OWORD *)v17 - 1);
        *(_OWORD *)uint64_t v18 = v20;
        v18 -= 32;
        v17 -= 32;
        v19 -= 32;
      }
      while (v19);
      if (v8 == v16) {
        goto LABEL_31;
      }
      if ((v8 & 0x18) != 0)
      {
LABEL_24:
        uint64_t v6 = &v5[-(v8 & 0xFFFFFFFFFFFFFFF8)];
        v13 -= v8 & 0xFFFFFFFFFFFFFFF8;
        size_t v21 = &v5[-v16 - 8];
        std::string v22 = &v12[v21 - v7];
        unint64_t v23 = v16 - (v8 & 0xFFFFFFFFFFFFFFF8);
        do
        {
          uint64_t v24 = *(void *)v21;
          v21 -= 8;
          *(void *)std::string v22 = v24;
          v22 -= 8;
          v23 += 8;
        }
        while (v23);
        if (v8 == (v8 & 0xFFFFFFFFFFFFFFF8)) {
          goto LABEL_31;
        }
        goto LABEL_29;
      }
      v13 -= v16;
      uint64_t v6 = &v5[-v16];
    }
LABEL_29:
    uint64_t v25 = v13 - 1;
    do
    {
      char v26 = *--v6;
      *v25-- = v26;
    }
    while (v6 != v7);
LABEL_31:
    uint64_t v6 = (char *)*a1;
LABEL_32:
    *a1 = v12;
    a1[1] = v15;
    a1[2] = v14;
    if (v6)
    {
      operator delete(v6);
    }
    return;
  }
  if (a2)
  {
    bzero(v5, a2);
    uint64_t v6 = &v5[a2];
  }
  a1[1] = v6;
}

uint64_t JetPackReaderGetErrorMessage(uint64_t a1)
{
  uint64_t result = a1 + 16;
  if (*(char *)(a1 + 39) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t getGlobalLog(void)
{
  {
    JetPack::DiagnosticContext::DiagnosticContext((uint64_t)&getGlobalLog(void)::sharedContext);
  }
  return qword_26AB31828;
}

{
  {
    JetPack::DiagnosticContext::DiagnosticContext((uint64_t)&getGlobalLog(void)::sharedContext);
  }
  return qword_26AB31858;
}

{
  {
    JetPack::DiagnosticContext::DiagnosticContext((uint64_t)&getGlobalLog(void)::sharedContext);
  }
  return qword_26AB31868;
}

void sub_2185753E8(_Unwind_Exception *a1)
{
}

void nestedExceptionString(const std::exception *a1@<X0>, std::string *a2@<X8>)
{
  memset(&v6, 0, sizeof(v6));
  long long v4 = (const std::string::value_type *)((uint64_t (*)(const std::exception *))a1->what)(a1);
  std::string::append(&v6, v4);
  char v5 = (const std::nested_exception *)__dynamic_cast(a1, MEMORY[0x263F8C220], (const struct __class_type_info *)off_264328AB0, -2);
  if (v5)
  {
    std::nested_exception::rethrow_nested(v5);
    __break(1u);
  }
  else
  {
    *a2 = v6;
  }
}

void sub_2185754D0(void *__p, int a2, int a3, __int16 a4, char a5, char a6, std::string *a7, uint64_t a8, std::string::value_type *__pa, std::string::size_type a10, int a11, __int16 a12, char a13, unsigned __int8 a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  std::string v22 = (const std::exception *)__cxa_begin_catch(__p);
  if (a2 == 2)
  {
    unint64_t v23 = v22;
    uint64_t v24 = std::string::append((std::string *)&a15, " -> ");
    nestedExceptionString(v23, (std::string *)&__pa);
    if ((a14 & 0x80u) == 0) {
      p_pa = (const std::string::value_type *)&__pa;
    }
    else {
      p_pa = __pa;
    }
    if ((a14 & 0x80u) == 0) {
      std::string::size_type v26 = a14;
    }
    else {
      std::string::size_type v26 = a10;
    }
    std::string::size_type v27 = std::string::append(v24, p_pa, v26);
    if (SHIBYTE(v27->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v20, v27->__r_.__value_.__l.__data_, v27->__r_.__value_.__l.__size_);
    }
    else
    {
      long long v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
      v20->__r_.__value_.__r.__words[2] = v27->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v28;
    }
    if ((char)a14 < 0) {
      operator delete(__pa);
    }
    __cxa_end_catch();
    if (a20 < 0) {
      operator delete(a15);
    }
    JUMPOUT(0x2185754B4);
  }
  __cxa_end_catch();
  JUMPOUT(0x2185754A4);
}

void sub_218575584(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::optional<std::string>::operator=[abi:ne180100]<std::string,void>(uint64_t a1, long long *a2)
{
  if (*(unsigned char *)(a1 + 24))
  {
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    long long v4 = *a2;
    *(void *)(a1 + 16) = *((void *)a2 + 2);
    *(_OWORD *)a1 = v4;
    *((unsigned char *)a2 + 23) = 0;
    *(unsigned char *)a2 = 0;
  }
  else
  {
    long long v5 = *a2;
    *(void *)(a1 + 16) = *((void *)a2 + 2);
    *(_OWORD *)a1 = v5;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    *(unsigned char *)(a1 + 24) = 1;
  }
  return a1;
}

void std::__shared_ptr_emplace<JetPack::ReaderConfig>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA680;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::ReaderConfig>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA680;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D46C1B0);
}

void std::__shared_ptr_emplace<JetPack::CommonCryptoSignatureVerifier>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA808;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::CommonCryptoSignatureVerifier>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA808;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D46C1B0);
}

void std::__shared_ptr_emplace<JetPack::UnsafeIgnoreSignatureVerifier>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA840;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::UnsafeIgnoreSignatureVerifier>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA840;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D46C1B0);
}

void std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::~__func()
{
}

__n128 std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C9AA538;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AA538;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z40JetPackReaderSetDataSegmentFoundCallbackE3$_0"
    || ((v3 & (unint64_t)"Z40JetPackReaderSetDataSegmentFoundCallbackE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z40JetPackReaderSetDataSegmentFoundCallbackE3$_0")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z40JetPackReaderSetDataSegmentFoundCallbackE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::target_type()
{
}

void *std::__function::__value_func<BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::swap[abi:ne180100](void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    unint64_t v3 = result;
    long long v4 = (void *)result[3];
    long long v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        __n128 result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_218575AFC(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void std::__function::__func<JetPackReaderSetFileEntryFoundCallback::$_0,std::allocator<JetPackReaderSetFileEntryFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::~__func()
{
}

__n128 std::__function::__func<JetPackReaderSetFileEntryFoundCallback::$_0,std::allocator<JetPackReaderSetFileEntryFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C9AA4E0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<JetPackReaderSetFileEntryFoundCallback::$_0,std::allocator<JetPackReaderSetFileEntryFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AA4E0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<JetPackReaderSetFileEntryFoundCallback::$_0,std::allocator<JetPackReaderSetFileEntryFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z38JetPackReaderSetFileEntryFoundCallbackE3$_0"
    || ((v3 & (unint64_t)"Z38JetPackReaderSetFileEntryFoundCallbackE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z38JetPackReaderSetFileEntryFoundCallbackE3$_0")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z38JetPackReaderSetFileEntryFoundCallbackE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<JetPackReaderSetFileEntryFoundCallback::$_0,std::allocator<JetPackReaderSetFileEntryFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::target_type()
{
}

void *std::__function::__value_func<BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::swap[abi:ne180100](void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    unint64_t v3 = result;
    long long v4 = (void *)result[3];
    long long v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        __n128 result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_218575E5C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void std::__function::__func<JetPackReaderSetKeyForIdentifierCallback::$_0,std::allocator<JetPackReaderSetKeyForIdentifierCallback::$_0>,std::optional<std::array<unsigned char,16ul>> ()(JetPack::ReaderConfig &,unsigned short)>::~__func()
{
}

__n128 std::__function::__func<JetPackReaderSetKeyForIdentifierCallback::$_0,std::allocator<JetPackReaderSetKeyForIdentifierCallback::$_0>,std::optional<std::array<unsigned char,16ul>> ()(JetPack::ReaderConfig &,unsigned short)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C9AA590;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<JetPackReaderSetKeyForIdentifierCallback::$_0,std::allocator<JetPackReaderSetKeyForIdentifierCallback::$_0>,std::optional<std::array<unsigned char,16ul>> ()(JetPack::ReaderConfig &,unsigned short)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AA590;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<JetPackReaderSetKeyForIdentifierCallback::$_0,std::allocator<JetPackReaderSetKeyForIdentifierCallback::$_0>,std::optional<std::array<unsigned char,16ul>> ()(JetPack::ReaderConfig &,unsigned short)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z40JetPackReaderSetKeyForIdentifierCallbackE3$_0"
    || ((v3 & (unint64_t)"Z40JetPackReaderSetKeyForIdentifierCallbackE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z40JetPackReaderSetKeyForIdentifierCallbackE3$_0")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z40JetPackReaderSetKeyForIdentifierCallbackE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<JetPackReaderSetKeyForIdentifierCallback::$_0,std::allocator<JetPackReaderSetKeyForIdentifierCallback::$_0>,std::optional<std::array<unsigned char,16ul>> ()(JetPack::ReaderConfig &,unsigned short)>::target_type()
{
}

void *std::__function::__value_func<std::optional<std::array<unsigned char,16ul>> ()(JetPack::ReaderConfig &,unsigned short)>::swap[abi:ne180100](void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    unint64_t v3 = result;
    long long v4 = (void *)result[3];
    long long v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        __n128 result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_2185761BC(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void std::__shared_ptr_pointer<__CFData const*,void (*)(void const*),std::allocator<__CFData const>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D46C1B0);
}

uint64_t std::__shared_ptr_pointer<__CFData const*,void (*)(void const*),std::allocator<__CFData const>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021857C306
    || ((v3 & 0x800000021857C306 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000021857C306)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021857C306 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

void sub_2185763D8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

JetPack::CompressionUnableToInitException *JetPack::CompressionUnableToInitException::CompressionUnableToInitException(JetPack::CompressionUnableToInitException *this)
{
  uint64_t v2 = (char *)operator new(0x28uLL);
  strcpy(v2, "CompressionUnableToInitException");
  *(void *)this = &unk_26C9AA300;
  std::string::__init_copy_ctor_external((std::string *)((char *)this + 8), v2, 0x20uLL);
  operator delete(v2);
  *(void *)this = &unk_26C9A9FE0;
  return this;
}

void sub_218576488(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

void std::throw_with_nested[abi:ne180100]<JetPack::UnableToParseHeaderException &>(uint64_t a1)
{
}

void std::__throw_with_nested<JetPack::UnableToParseHeaderException &,JetPack::UnableToParseHeaderException,true>::__do_throw[abi:ne180100](uint64_t a1)
{
  exception = (std::nested_exception *)__cxa_allocate_exception(0x30uLL);
  std::__nested<JetPack::UnableToParseHeaderException>::__nested[abi:ne180100](exception, a1);
}

void sub_218576500(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::nested_exception *std::__nested<JetPack::UnableToParseHeaderException>::__nested[abi:ne180100](std::nested_exception *a1, uint64_t a2)
{
  a1->__vftable = (std::nested_exception_vtbl *)&unk_26C9AA300;
  p_ptr = (std::string *)&a1->__ptr_;
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(p_ptr, *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    long long v4 = *(_OWORD *)(a2 + 8);
    p_ptr->__r_.__value_.__r.__words[2] = *(void *)(a2 + 24);
    *(_OWORD *)&p_ptr->__r_.__value_.__l.__data_ = v4;
  }
  a1->__vftable = (std::nested_exception_vtbl *)&unk_26C9A9F18;
  std::nested_exception::nested_exception(a1 + 2);
  a1->__vftable = (std::nested_exception_vtbl *)&unk_26C9AAA38;
  a1[2].__vftable = (std::nested_exception_vtbl *)&unk_26C9AAA60;
  return a1;
}

void sub_2185765DC(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void JetPack::UnownedPartialStream::~UnownedPartialStream(JetPack::UnownedPartialStream *this)
{
}

JetPack::UnableToOpenFileException *JetPack::UnableToOpenFileException::UnableToOpenFileException(JetPack::UnableToOpenFileException *this)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  strcpy(v2, "UnableToOpenFileException");
  *(void *)this = &unk_26C9AA300;
  std::string::__init_copy_ctor_external((std::string *)((char *)this + 8), v2, 0x19uLL);
  operator delete(v2);
  *(void *)this = &unk_26C9A9E20;
  return this;
}

void sub_218576768(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

uint64_t std::pair<std::__fs::filesystem::path::iterator,std::__fs::filesystem::path::iterator>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 79) < 0)
  {
    operator delete(*(void **)(a1 + 56));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      return a1;
    }
LABEL_5:
    operator delete(*(void **)a1);
    return a1;
  }
  if (*(char *)(a1 + 23) < 0) {
    goto LABEL_5;
  }
  return a1;
}

void sub_218576834(_Unwind_Exception *a1)
{
}

void JetPack::throwLibArchiveException(uint64_t a1, uint64_t *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v3 = archive_error_string();
  JetPack::archiveErrorToString(v3, &v8);
  {
    JetPack::DiagnosticContext::DiagnosticContext((uint64_t)&getGlobalLog(void)::sharedContext);
  }
  long long v4 = qword_26AB31858;
  if (os_log_type_enabled((os_log_t)qword_26AB31858, OS_LOG_TYPE_ERROR))
  {
    if (*((char *)a2 + 23) < 0) {
      a2 = (uint64_t *)*a2;
    }
    long long v5 = &v8;
    if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      long long v5 = (std::string *)v8.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::string buf = 136446466;
    unint64_t v10 = a2;
    __int16 v11 = 2082;
    std::string v12 = v5;
    _os_log_impl(&dword_218564000, v4, OS_LOG_TYPE_ERROR, "Failed to %{public}s: %{public}s", buf, 0x16u);
  }
  exception = __cxa_allocate_exception(0x20uLL);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v7, v8.__r_.__value_.__l.__data_, v8.__r_.__value_.__l.__size_);
  }
  else {
    std::string v7 = v8;
  }
  JetPack::LibArchiveException::LibArchiveException(exception, (uint64_t)&v7);
}

void sub_2185769A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

void JetPack::PathOutsideOutputDestinationException::~PathOutsideOutputDestinationException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26C9AA1E8;
  if (SHIBYTE(this[6].__vftable) < 0) {
    operator delete(this[4].__vftable);
  }
  this->__vftable = (std::exception_vtbl *)&unk_26C9AA300;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_26C9AA1E8;
  if (SHIBYTE(this[6].__vftable) < 0) {
    operator delete(this[4].__vftable);
  }
  this->__vftable = (std::exception_vtbl *)&unk_26C9AA300;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
  JUMPOUT(0x21D46C1B0);
}

JetPack::PathOutsideOutputDestinationException *JetPack::PathOutsideOutputDestinationException::PathOutsideOutputDestinationException(JetPack::PathOutsideOutputDestinationException *this, std::__fs::filesystem::path *a2)
{
  v13.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&v13.__r_.__value_.__r.__words[1] = xmmword_21857C450;
  strcpy(v13.__r_.__value_.__l.__data_, "PathOutsideOutputDestination");
  long long v4 = std::string::append(&v13, " path=");
  if (SHIBYTE(a2->__pn_.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, a2->__pn_.__r_.__value_.__l.__data_, a2->__pn_.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = a2->__pn_;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  std::string v7 = std::string::append(v4, (const std::string::value_type *)p_p, size);
  if (SHIBYTE(v7->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v14, v7->__r_.__value_.__l.__data_, v7->__r_.__value_.__l.__size_);
  }
  else
  {
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v14.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v8;
  }
  JetPack::ReaderException::ReaderException(this, (uint64_t)&v14);
  if ((SHIBYTE(v14.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_15;
    }
LABEL_19:
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_20;
  }
  operator delete(v14.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_19;
  }
LABEL_15:
  if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_16;
  }
LABEL_20:
  operator delete(v13.__r_.__value_.__l.__data_);
LABEL_16:
  *(void *)this = &unk_26C9AA1E8;
  unint64_t v9 = (std::string *)((char *)this + 32);
  if (SHIBYTE(a2->__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v9, a2->__pn_.__r_.__value_.__l.__data_, a2->__pn_.__r_.__value_.__l.__size_);
  }
  else
  {
    long long v10 = *(_OWORD *)&a2->__pn_.__r_.__value_.__l.__data_;
    *((void *)this + 6) = *((void *)&a2->__pn_.__r_.__value_.__l + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
  }
  return this;
}

void sub_218576C20(_Unwind_Exception *a1)
{
  JetPack::NotEnoughDataException::~NotEnoughDataException(v1);
  _Unwind_Resume(a1);
}

void sub_218576C34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if ((a20 & 0x80000000) == 0) {
    _Unwind_Resume(exception_object);
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t JetPack::ArchiveStream::position(JetPack::ArchiveStream *this)
{
  return *((void *)this + 5);
}

void JetPack::ArchiveStream::~ArchiveStream(JetPack::ArchiveStream *this)
{
}

unint64_t JetPack::CallbackStream::read(JetPack::CallbackStream *this, unsigned __int8 *a2, unint64_t a3)
{
  unint64_t v7 = a3;
  long long v8 = a2;
  uint64_t v4 = *((void *)this + 4);
  if (!v4) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  unint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 **, unint64_t *))(*(void *)v4 + 48))(v4, &v8, &v7);
  *((void *)this + 15) += result;
  if (result < a3) {
    *((unsigned char *)this + 128) = 1;
  }
  return result;
}

uint64_t JetPack::CallbackStream::position(JetPack::CallbackStream *this)
{
  return *((void *)this + 15);
}

uint64_t JetPack::CallbackStream::isFinished(JetPack::CallbackStream *this)
{
  return *((unsigned __int8 *)this + 128);
}

unint64_t JetPack::CallbackStream::seekForward(JetPack::CallbackStream *this, uint64_t a2)
{
  v12[128] = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 72))
  {
    uint64_t v4 = *((void *)this + 15);
    v12[0] = a2;
    uint64_t v5 = *((void *)this + 8);
    if (!v5) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    uint64_t v6 = v4 + a2;
    unint64_t result = (*(uint64_t (**)(uint64_t, void *))(*(void *)v5 + 48))(v5, v12);
    *((void *)this + 15) = v6;
  }
  else
  {
    uint64_t v8 = (*(uint64_t (**)(JetPack::CallbackStream *))(*(void *)this + 24))(this);
    unint64_t result = (*(uint64_t (**)(JetPack::CallbackStream *))(*(void *)this + 32))(this);
    if ((result & 1) == 0)
    {
      unint64_t v9 = v8 + a2;
      do
      {
        unint64_t result = (*(uint64_t (**)(JetPack::CallbackStream *))(*(void *)this + 24))(this);
        if (v9 <= result) {
          break;
        }
        uint64_t v10 = (*(uint64_t (**)(JetPack::CallbackStream *))(*(void *)this + 24))(this);
        uint64_t v11 = v9 - v10 >= 0x400 ? 1024 : v9 - v10;
        (*(void (**)(JetPack::CallbackStream *, void *, uint64_t))(*(void *)this + 16))(this, v12, v11);
        unint64_t result = (*(uint64_t (**)(JetPack::CallbackStream *))(*(void *)this + 32))(this);
      }
      while (!result);
    }
  }
  return result;
}

uint64_t JetPack::CallbackStream::seekToEnd(JetPack::CallbackStream *this)
{
  if (*((unsigned char *)this + 112))
  {
    uint64_t v2 = *((void *)this + 13);
    if (!v2) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 48))(v2);
    *((void *)this + 15) = result;
    *((unsigned char *)this + 128) = 1;
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(JetPack::CallbackStream *))(*(void *)this + 32))(this);
    if ((result & 1) == 0)
    {
      do
      {
        (*(void (**)(JetPack::CallbackStream *, uint64_t))(*(void *)this + 48))(this, 1024);
        uint64_t result = (*(uint64_t (**)(JetPack::CallbackStream *))(*(void *)this + 32))(this);
      }
      while (!result);
    }
  }
  return result;
}

void JetPack::CallbackStream::~CallbackStream(JetPack::CallbackStream *this)
{
  *(void *)this = &unk_26C9A9B50;
  if (*((unsigned char *)this + 112))
  {
    uint64_t v2 = (char *)this + 80;
    unint64_t v3 = (JetPack::CallbackStream *)*((void *)this + 13);
    if (v3 == (JetPack::CallbackStream *)((char *)this + 80))
    {
      (*(void (**)(char *))(*(void *)v2 + 32))((char *)this + 80);
      if (!*((unsigned char *)this + 72)) {
        goto LABEL_12;
      }
      goto LABEL_6;
    }
    if (v3) {
      (*(void (**)(JetPack::CallbackStream *))(*(void *)v3 + 40))(v3);
    }
  }
  if (!*((unsigned char *)this + 72)) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v4 = (JetPack::CallbackStream *)*((void *)this + 8);
  if (v4 == (JetPack::CallbackStream *)((char *)this + 40))
  {
    (*(void (**)(char *))(*((void *)this + 5) + 32))((char *)this + 40);
  }
  else if (v4)
  {
    (*(void (**)(JetPack::CallbackStream *))(*(void *)v4 + 40))(v4);
  }
LABEL_12:
  uint64_t v5 = (JetPack::CallbackStream *)*((void *)this + 4);
  if (v5 == (JetPack::CallbackStream *)((char *)this + 8))
  {
    (*(void (**)(char *))(*((void *)this + 1) + 32))((char *)this + 8);
  }
  else if (v5)
  {
    (*(void (**)(JetPack::CallbackStream *))(*(void *)v5 + 40))(v5);
  }
}

{
  char *v2;
  JetPack::CallbackStream *v3;
  JetPack::CallbackStream *v4;
  JetPack::CallbackStream *v5;
  uint64_t vars8;

  *(void *)this = &unk_26C9A9B50;
  if (*((unsigned char *)this + 112))
  {
    uint64_t v2 = (char *)this + 80;
    unint64_t v3 = (JetPack::CallbackStream *)*((void *)this + 13);
    if (v3 == (JetPack::CallbackStream *)((char *)this + 80))
    {
      (*(void (**)(char *))(*(void *)v2 + 32))((char *)this + 80);
      if (!*((unsigned char *)this + 72)) {
        goto LABEL_12;
      }
      goto LABEL_6;
    }
    if (v3) {
      (*(void (**)(JetPack::CallbackStream *))(*(void *)v3 + 40))(v3);
    }
  }
  if (!*((unsigned char *)this + 72)) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v4 = (JetPack::CallbackStream *)*((void *)this + 8);
  if (v4 == (JetPack::CallbackStream *)((char *)this + 40))
  {
    (*(void (**)(char *))(*((void *)this + 5) + 32))((char *)this + 40);
  }
  else if (v4)
  {
    (*(void (**)(JetPack::CallbackStream *))(*(void *)v4 + 40))(v4);
  }
LABEL_12:
  uint64_t v5 = (JetPack::CallbackStream *)*((void *)this + 4);
  if (v5 == (JetPack::CallbackStream *)((char *)this + 8))
  {
    (*(void (**)(char *))(*((void *)this + 1) + 32))((char *)this + 8);
  }
  else if (v5)
  {
    (*(void (**)(JetPack::CallbackStream *))(*(void *)v5 + 40))(v5);
  }
  JUMPOUT(0x21D46C1B0);
}

size_t JetPack::BufferStream::read(JetPack::BufferStream *this, unsigned __int8 *a2, size_t a3)
{
  if ((*(uint64_t (**)(JetPack::BufferStream *))(*(void *)this + 32))(this)) {
    return 0;
  }
  uint64_t v6 = *((void *)this + 3);
  if (*((void *)this + 2) - v6 < a3) {
    a3 = *((void *)this + 2) - v6;
  }
  if (a3)
  {
    memmove(a2, (const void *)(*((void *)this + 1) + v6), a3);
    uint64_t v6 = *((void *)this + 3);
  }
  *((void *)this + 3) = v6 + a3;
  return a3;
}

uint64_t JetPack::BufferStream::position(JetPack::BufferStream *this)
{
  return *((void *)this + 3);
}

BOOL JetPack::BufferStream::isFinished(JetPack::BufferStream *this)
{
  return *((void *)this + 2) == *((void *)this + 3);
}

void JetPack::BufferStream::~BufferStream(JetPack::BufferStream *this)
{
}

unint64_t JetPack::archiveErrorToString@<X0>(unint64_t this@<X0>, unsigned char *a2@<X8>)
{
  unint64_t v3 = a2;
  if (!this)
  {
    a2[23] = 0;
    *a2 = 0;
    return this;
  }
  uint64_t v4 = (const void *)this;
  this = strlen((const char *)this);
  if (this >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = this;
  if (this >= 0x17)
  {
    uint64_t v6 = (this & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((this | 7) != 0x17) {
      uint64_t v6 = this | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v3[1] = v5;
    v3[2] = v7 | 0x8000000000000000;
    *unint64_t v3 = v8;
    unint64_t v3 = v8;
  }
  else
  {
    *((unsigned char *)v3 + 23) = this;
    if (!this) {
      goto LABEL_11;
    }
  }
  this = (unint64_t)memcpy(v3, v4, v5);
LABEL_11:
  *((unsigned char *)v3 + v5) = 0;
  return this;
}

void JetPackStreamCreate()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  operator new();
}

void sub_2185777F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t *a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t *a24)
{
  if (a15) {
    JetPackStreamCreate_cold_1(&a14, (uint64_t)&a11);
  }
  if (a20)
  {
    if (a19 == &a16)
    {
      (*(void (**)(uint64_t *))(a16 + 32))(&a16);
    }
    else if (a19)
    {
      (*(void (**)(void))(*a19 + 40))();
    }
  }
  if (a24 == &a21)
  {
    (*(void (**)(uint64_t *))(a21 + 32))(&a21);
  }
  else if (a24)
  {
    (*(void (**)(void))(*a24 + 40))();
  }
  std::__shared_weak_count::~__shared_weak_count(v24);
  operator delete(v27);
  if (a2 == 1)
  {
    long long v28 = __cxa_begin_catch(a1);
    {
      getGlobalLog(void)::sharedContext = 4;
      {
        JetPack::getSharedOSLog(void)::log = (uint64_t)os_log_create("com.apple.JetPack", "Diagnostics");
      }
      qword_26AB31868 = JetPack::getSharedOSLog(void)::log;
    }
    size_t v29 = qword_26AB31868;
    if (os_log_type_enabled((os_log_t)qword_26AB31868, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = (*(uint64_t (**)(void *))(*(void *)v28 + 16))(v28);
      LODWORD(a9) = 136446210;
      *(void *)((char *)&a9 + 4) = v30;
      _os_log_impl(&dword_218564000, v29, OS_LOG_TYPE_ERROR, "Unable to make public ref with error: %{public}s", (uint8_t *)&a9, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x2185777BCLL);
  }
  _Unwind_Resume(a1);
}

void JetPackCreateDataStream()
{
}

void makePublicRef<JetPackStream,JetPack::BufferStream,unsigned char const*&,unsigned long &>()
{
}

uint64_t JetPackStreamPosition(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    a1 = (uint64_t *)*a1;
    uint64_t v2 = (std::__shared_weak_count *)v1[1];
    if (v2) {
      atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t *))(*a1 + 24))(a1);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  return v3;
}

void sub_218577CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_218577D38(_Unwind_Exception *a1)
{
}

void std::__shared_ptr_emplace<JetPack::CallbackStream>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA728;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::CallbackStream>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA728;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D46C1B0);
}

uint64_t std::__shared_ptr_emplace<JetPack::CallbackStream>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t std::optional<std::function<void ()(unsigned long)>>::~optional(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 24);
    if (v2 == a1)
    {
      (*(void (**)(uint64_t))(*(void *)a1 + 32))(a1);
    }
    else if (v2)
    {
      (*(void (**)(uint64_t))(*(void *)v2 + 40))(v2);
    }
  }
  return a1;
}

void *std::function<unsigned long ()(unsigned char *,unsigned long)>::~function(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::__function::__func<JetPackStreamCreate::$_0,std::allocator<JetPackStreamCreate::$_0>,unsigned long ()(unsigned char *,unsigned long)>::~__func()
{
}

__n128 std::__function::__func<JetPackStreamCreate::$_0,std::allocator<JetPackStreamCreate::$_0>,unsigned long ()(unsigned char *,unsigned long)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C9AA3D8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<JetPackStreamCreate::$_0,std::allocator<JetPackStreamCreate::$_0>,unsigned long ()(unsigned char *,unsigned long)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AA3D8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<JetPackStreamCreate::$_0,std::allocator<JetPackStreamCreate::$_0>,unsigned long ()(unsigned char *,unsigned long)>::operator()(uint64_t a1, void *a2, void *a3)
{
  return (*(uint64_t (**)(void, void, void))(a1 + 16))(*(void *)(a1 + 8), *a2, *a3);
}

uint64_t std::__function::__func<JetPackStreamCreate::$_0,std::allocator<JetPackStreamCreate::$_0>,unsigned long ()(unsigned char *,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z19JetPackStreamCreateE3$_0"
    || ((v3 & (unint64_t)"Z19JetPackStreamCreateE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z19JetPackStreamCreateE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z19JetPackStreamCreateE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<JetPackStreamCreate::$_0,std::allocator<JetPackStreamCreate::$_0>,unsigned long ()(unsigned char *,unsigned long)>::target_type()
{
}

void std::__function::__func<JetPackStreamCreate::$_1,std::allocator<JetPackStreamCreate::$_1>,void ()(unsigned long)>::~__func()
{
}

__n128 std::__function::__func<JetPackStreamCreate::$_1,std::allocator<JetPackStreamCreate::$_1>,void ()(unsigned long)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C9AA430;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<JetPackStreamCreate::$_1,std::allocator<JetPackStreamCreate::$_1>,void ()(unsigned long)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AA430;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<JetPackStreamCreate::$_1,std::allocator<JetPackStreamCreate::$_1>,void ()(unsigned long)>::operator()(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(a1 + 16))(*(void *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<JetPackStreamCreate::$_1,std::allocator<JetPackStreamCreate::$_1>,void ()(unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z19JetPackStreamCreateE3$_1"
    || ((v3 & (unint64_t)"Z19JetPackStreamCreateE3$_1" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z19JetPackStreamCreateE3$_1")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z19JetPackStreamCreateE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<JetPackStreamCreate::$_1,std::allocator<JetPackStreamCreate::$_1>,void ()(unsigned long)>::target_type()
{
}

void std::__function::__func<JetPackStreamCreate::$_2,std::allocator<JetPackStreamCreate::$_2>,unsigned long ()(void)>::~__func()
{
}

__n128 std::__function::__func<JetPackStreamCreate::$_2,std::allocator<JetPackStreamCreate::$_2>,unsigned long ()(void)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C9AA488;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<JetPackStreamCreate::$_2,std::allocator<JetPackStreamCreate::$_2>,unsigned long ()(void)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AA488;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<JetPackStreamCreate::$_2,std::allocator<JetPackStreamCreate::$_2>,unsigned long ()(void)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))(*(void *)(a1 + 8));
}

uint64_t std::__function::__func<JetPackStreamCreate::$_2,std::allocator<JetPackStreamCreate::$_2>,unsigned long ()(void)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z19JetPackStreamCreateE3$_2"
    || ((v3 & (unint64_t)"Z19JetPackStreamCreateE3$_2" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z19JetPackStreamCreateE3$_2")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z19JetPackStreamCreateE3$_2" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<JetPackStreamCreate::$_2,std::allocator<JetPackStreamCreate::$_2>,unsigned long ()(void)>::target_type()
{
}

uint64_t JetPack::CallbackStream::CallbackStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26C9A9B50;
  uint64_t v7 = a1 + 8;
  uint64_t v8 = *(void *)(a2 + 24);
  if (v8)
  {
    if (v8 == a2)
    {
      *(void *)(a1 + 32) = v7;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), v7);
    }
    else
    {
      *(void *)(a1 + 32) = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 16))(v8);
    }
  }
  else
  {
    *(void *)(a1 + 32) = 0;
  }
  std::__optional_move_base<std::function<void ()(unsigned long)>,false>::__optional_move_base[abi:ne180100](a1 + 40, a3);
  std::__optional_move_base<std::function<unsigned long ()(void)>,false>::__optional_move_base[abi:ne180100](a1 + 80, a4);
  *(void *)(a1 + 120) = 0;
  *(unsigned char *)(a1 + 128) = 0;
  return a1;
}

void sub_2185782FC(_Unwind_Exception *a1)
{
  std::optional<std::function<void ()(unsigned long)>>::~optional(v2);
  std::function<unsigned long ()(unsigned char *,unsigned long)>::~function(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__optional_move_base<std::function<void ()(unsigned long)>,false>::__optional_move_base[abi:ne180100](uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = 0;
  *(unsigned char *)(a1 + 32) = 0;
  if (*(unsigned char *)(a2 + 32))
  {
    uint64_t v3 = *(void *)(a2 + 24);
    if (v3)
    {
      if (v3 == a2)
      {
        *(void *)(a1 + 24) = a1;
        (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
        goto LABEL_7;
      }
      uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
    *(void *)(a1 + 24) = v3;
LABEL_7:
    *(unsigned char *)(a1 + 32) = 1;
  }
  return a1;
}

void sub_2185783C8(_Unwind_Exception *exception_object)
{
  if (*(unsigned char *)(v1 + 32)) {
    std::__optional_move_base<std::function<void ()(unsigned long)>,false>::__optional_move_base[abi:ne180100]((void *)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__optional_move_base<std::function<unsigned long ()(void)>,false>::__optional_move_base[abi:ne180100](uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = 0;
  *(unsigned char *)(a1 + 32) = 0;
  if (*(unsigned char *)(a2 + 32))
  {
    uint64_t v3 = *(void *)(a2 + 24);
    if (v3)
    {
      if (v3 == a2)
      {
        *(void *)(a1 + 24) = a1;
        (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
        goto LABEL_7;
      }
      uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
    *(void *)(a1 + 24) = v3;
LABEL_7:
    *(unsigned char *)(a1 + 32) = 1;
  }
  return a1;
}

void sub_21857848C(_Unwind_Exception *exception_object)
{
  if (*(unsigned char *)(v1 + 32)) {
    std::__optional_move_base<std::function<unsigned long ()(void)>,false>::__optional_move_base[abi:ne180100]((void *)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_emplace<JetPack::BufferStream>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA648;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::BufferStream>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA648;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D46C1B0);
}

uint64_t std::__shared_ptr_emplace<JetPack::BufferStream>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<JetPack::FileStream>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA610;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<JetPack::FileStream>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AA610;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D46C1B0);
}

uint64_t JetPack::CCKDFParametersCreateHkdfWrapper(JetPack *this, const void *a2, unint64_t a3, const void *a4, _DWORD *a5, int *a6)
{
  *a5 = CCKDFParametersCreateHkdf();
  return 0;
}

uint64_t JetPack::CCKDFParametersDestroyWrapper(uint64_t result)
{
  if (result) {
    return CCKDFParametersDestroy();
  }
  return result;
}

uint64_t JetPack::CommonCryptoBackend::generateSecureRandomBytes(JetPack::CommonCryptoBackend *this, unsigned __int8 *bytes, size_t count)
{
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], count, bytes)) {
    return 4294966296;
  }
  else {
    return 1;
  }
}

uint64_t JetPack::CommonCryptoBackend::convertCCStatusToCryptoStatus(JetPack::CommonCryptoBackend *this, int a2)
{
  if (a2) {
    return 4294966296;
  }
  else {
    return 1;
  }
}

uint64_t JetPack::CommonCryptoBackend::aesGCMEncrypt(JetPack::CommonCryptoBackend *this, const unsigned __int8 *a2, unint64_t a3, const unsigned __int8 *a4, unint64_t a5, const unsigned __int8 *a6, unint64_t a7, unsigned __int8 *a8, unsigned __int8 *a9, unint64_t a10)
{
  if (CCCryptorGCMOneshotEncrypt()) {
    return 4294966296;
  }
  else {
    return 1;
  }
}

void JetPack::CommonCryptoBackend::generateSigningKey(JetPack::CommonCryptoBackend *this)
{
  valuePtr[4] = *MEMORY[0x263EF8340];
  LODWORD(valuePtr[0]) = 256;
  CFNumberRef v1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, valuePtr);
  JetPack::makeCFSharedPtr<__CFNumber const*>((uint64_t)v1, &v2);
}

void sub_2185789F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v6 = va_arg(va2, void);
  uint64_t v8 = va_arg(va2, void);
  uint64_t v9 = va_arg(va2, void);
  uint64_t v10 = va_arg(va2, void);
  uint64_t v11 = va_arg(va2, void);
  uint64_t v12 = va_arg(va2, void);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va2);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void JetPack::CFDictionaryWrapper::convert(void ***a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = a3;
  keys = 0;
  long long v50 = 0;
  long long v51 = 0;
  uint64_t v46 = 0;
  v47 = 0;
  uint64_t v48 = 0;
  if (a2)
  {
    uint64_t v4 = a1;
    uint64_t v5 = &a1[2 * a2];
    do
    {
      uint64_t v7 = *v4;
      uint64_t v8 = (void **)v50;
      if (v50 >= v51)
      {
        uint64_t v10 = (v50 - (char *)keys) >> 3;
        unint64_t v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) >> 61) {
          goto LABEL_52;
        }
        uint64_t v12 = v51 - (char *)keys;
        if ((v51 - (char *)keys) >> 2 > v11) {
          unint64_t v11 = v12 >> 2;
        }
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v13 = v11;
        }
        if (v13)
        {
          if (v13 >> 61) {
            goto LABEL_51;
          }
          std::string v14 = operator new(8 * v13);
        }
        else
        {
          std::string v14 = 0;
        }
        uint64_t v15 = (void **)&v14[8 * v10];
        *uint64_t v15 = *v7;
        uint64_t v9 = (char *)(v15 + 1);
        if (v50 != (char *)keys)
        {
          unint64_t v16 = v50 - (char *)keys - 8;
          if (v16 < 0x58) {
            goto LABEL_55;
          }
          if ((unint64_t)((char *)keys - v14) < 0x20) {
            goto LABEL_55;
          }
          uint64_t v17 = (v16 >> 3) + 1;
          uint64_t v18 = 8 * (v17 & 0x3FFFFFFFFFFFFFFCLL);
          unint64_t v19 = (void **)&v50[-v18];
          uint64_t v15 = (void **)((char *)v15 - v18);
          long long v20 = &v14[8 * v10 - 16];
          size_t v21 = (long long *)(v50 - 16);
          uint64_t v22 = v17 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v23 = *v21;
            *(v20 - 1) = *(v21 - 1);
            _OWORD *v20 = v23;
            v20 -= 2;
            v21 -= 2;
            v22 -= 4;
          }
          while (v22);
          uint64_t v8 = v19;
          if (v17 != (v17 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_55:
            do
            {
              uint64_t v24 = *--v8;
              *--uint64_t v15 = v24;
            }
            while (v8 != keys);
          }
          uint64_t v8 = keys;
        }
        keys = v15;
        long long v51 = &v14[8 * v13];
        if (v8) {
          operator delete(v8);
        }
      }
      else
      {
        *(void *)long long v50 = *v7;
        uint64_t v9 = v50 + 8;
      }
      long long v50 = v9;
      uint64_t v25 = *v4;
      std::string::size_type v26 = v47;
      if (v47 < v48)
      {
        *(void *)v47 = v25[1];
        uint64_t v6 = v47 + 8;
      }
      else
      {
        uint64_t v27 = (v47 - v46) >> 3;
        unint64_t v28 = v27 + 1;
        if ((unint64_t)(v27 + 1) >> 61) {
LABEL_52:
        }
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        uint64_t v29 = v48 - v46;
        if ((v48 - v46) >> 2 > v28) {
          unint64_t v28 = v29 >> 2;
        }
        if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v30 = v28;
        }
        if (v30)
        {
          if (v30 >> 61) {
LABEL_51:
          }
            std::__throw_bad_array_new_length[abi:ne180100]();
          int64_t v31 = (char *)operator new(8 * v30);
        }
        else
        {
          int64_t v31 = 0;
        }
        uint64_t v32 = &v31[8 * v27];
        *(void *)uint64_t v32 = v25[1];
        uint64_t v6 = v32 + 8;
        if (v47 != v46)
        {
          unint64_t v33 = v47 - v46 - 8;
          if (v33 < 0x58) {
            goto LABEL_56;
          }
          if ((unint64_t)(v46 - v31) < 0x20) {
            goto LABEL_56;
          }
          uint64_t v34 = (v33 >> 3) + 1;
          uint64_t v35 = 8 * (v34 & 0x3FFFFFFFFFFFFFFCLL);
          int64_t v36 = &v47[-v35];
          v32 -= v35;
          unint64_t v37 = &v31[8 * v27 - 16];
          long long v38 = (long long *)(v47 - 16);
          uint64_t v39 = v34 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v40 = *v38;
            *((_OWORD *)v37 - 1) = *(v38 - 1);
            *(_OWORD *)unint64_t v37 = v40;
            v37 -= 32;
            v38 -= 2;
            v39 -= 4;
          }
          while (v39);
          std::string::size_type v26 = v36;
          if (v34 != (v34 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_56:
            do
            {
              uint64_t v41 = *((void *)v26 - 1);
              v26 -= 8;
              *((void *)v32 - 1) = v41;
              v32 -= 8;
            }
            while (v26 != v46);
          }
          std::string::size_type v26 = v46;
        }
        uint64_t v46 = v32;
        uint64_t v48 = &v31[8 * v30];
        if (v26) {
          operator delete(v26);
        }
      }
      v47 = v6;
      v4 += 2;
    }
    while (v4 != v5);
    uint64_t v42 = (const void **)keys;
    uint64_t v3 = a3;
    uint64_t v43 = (const void **)v46;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v43 = 0;
    uint64_t v42 = 0;
  }
  CFDictionaryRef v44 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v42, v43, (v6 - (char *)v43) >> 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  JetPack::makeCFSharedPtr<__CFDictionary const*>((uint64_t)v44, v3);
}

void sub_218578DD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15)
{
  if (__p)
  {
    operator delete(__p);
    unint64_t v16 = a14;
    if (!a14) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else
  {
    unint64_t v16 = a14;
    if (!a14) {
      goto LABEL_3;
    }
  }
  operator delete(v16);
  _Unwind_Resume(exception_object);
}

JetPack::FailedToGenerateKeyPairException *JetPack::FailedToGenerateKeyPairException::FailedToGenerateKeyPairException(JetPack::FailedToGenerateKeyPairException *this)
{
  uint64_t v2 = (char *)operator new(0x19uLL);
  strcpy(v2, "FailedToGenerateKeyPair");
  *(void *)this = &unk_26C9AA300;
  std::string::__init_copy_ctor_external((std::string *)((char *)this + 8), v2, 0x17uLL);
  operator delete(v2);
  *(void *)this = &unk_26C9AA008;
  return this;
}

void sub_218578EB8(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

void JetPack::CommonCryptoBackend::generateSelfSignedCertificate()
{
  cStr[23] = 12;
  strcpy(cStr, "JetPackTests");
  CFStringRef v0 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
  JetPack::makeCFSharedPtr<__CFString const*>((uint64_t)v0, &v2);
}

void sub_218579298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20,char a21,uint64_t a22,char a23)
{
  if (v23) {
    operator delete(v23);
  }
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a21);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100](v24 - 72);
  _Unwind_Resume(a1);
}

void JetPack::CommonCryptoBackend::subjectEntry(JetPack::CommonCryptoBackend *this, const __CFString *a2, const __CFString *a3)
{
  values[0] = (void *)a2;
  values[1] = (void *)a3;
  CFArrayRef v3 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)values, 2, MEMORY[0x263EFFF70]);
  JetPack::makeCFSharedPtr<__CFArray const*>((uint64_t)v3, &v4);
}

void sub_218579410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void JetPack::CommonCryptoBackend::keyFromData()
{
  valuePtr[6] = *MEMORY[0x263EF8340];
  LODWORD(valuePtr[0]) = 256;
  CFNumberRef v0 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, valuePtr);
  JetPack::makeCFSharedPtr<__CFNumber const*>((uint64_t)v0, &v1);
}

void sub_2185796EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100](v22);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a22);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a12);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  _Unwind_Resume(a1);
}

void JetPack::CommonCryptoBackend::exportPrivateKeyAsDER(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = 0;
  CFArrayRef v3 = *(const void **)a2;
  uint64_t v2 = *(void *)(a2 + 8);
  size_t v4 = v2 - *(void *)a2;
  if (v2 != *(void *)a2)
  {
    if ((v4 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = (char *)operator new(v2 - *(void *)a2);
    uint64_t v6 = &v5[v4];
    uint64_t v7 = v5;
    uint64_t v9 = &v5[v4];
    memcpy(v5, v3, v4);
    uint64_t v8 = v6;
  }
  JetPack::CommonCryptoBackend::keyFromData();
}

void sub_218579904(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  unint64_t v13 = v12;
  if (v13) {
    operator delete(v13);
  }
  _Unwind_Resume(exception_object);
}

void sub_218579934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::shared_ptr<JetPack::BaseStream>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void JetPack::makeCFSharedPtr<__CFDictionary const*>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  operator new();
}

void sub_2185799E4(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_2185799FC(_Unwind_Exception *a1)
{
}

__n128 JetPack::CommonCryptoBackend::exportCertificateAsDER@<Q0>(__n128 *a1@<X1>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  a1->n128_u64[1] = 0;
  a1[1].n128_u64[0] = 0;
  a1->n128_u64[0] = 0;
  return result;
}

JetPack::FailedToDecodePrivateKeyException *JetPack::FailedToDecodePrivateKeyException::FailedToDecodePrivateKeyException(JetPack::FailedToDecodePrivateKeyException *this)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  strcpy(v2, "FailedToDecodePrivateKey");
  *(void *)this = &unk_26C9AA300;
  std::string::__init_copy_ctor_external((std::string *)((char *)this + 8), v2, 0x18uLL);
  operator delete(v2);
  *(void *)this = &unk_26C9AA080;
  return this;
}

void sub_218579AD0(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

JetPack::FailedToDecodeX509CertificateException *JetPack::FailedToDecodeX509CertificateException::FailedToDecodeX509CertificateException(JetPack::FailedToDecodeX509CertificateException *this)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  strcpy(v2, "FailedToDecodeX509Certificate");
  *(void *)this = &unk_26C9AA300;
  std::string::__init_copy_ctor_external((std::string *)((char *)this + 8), v2, 0x1DuLL);
  operator delete(v2);
  *(void *)this = &unk_26C9AA210;
  return this;
}

void sub_218579B90(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

void JetPack::CFArrayWrapper::convert<std::shared_ptr<__CFArray const>,1ul>(uint64_t a1@<X0>, void *a2@<X8>)
{
  CFArrayRef v3 = *(atomic_ullong **)(a1 + 8);
  v5[0] = *(const void **)a1;
  v5[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit(v3 + 1, 1uLL, memory_order_relaxed);
  }
  CFArrayRef v4 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v5, 1, MEMORY[0x263EFFF70]);
  JetPack::makeCFSharedPtr<__CFArray const*>((uint64_t)v4, a2);
}

void sub_218579C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void JetPack::makeCFSharedPtr<__CFString const*>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  operator new();
}

void sub_218579CE4(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_218579CFC(_Unwind_Exception *a1)
{
}

uint64_t std::__shared_ptr_pointer<__CFString const*,void (*)(void const*),std::allocator<__CFString const>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<__CFString const*,void (*)(void const*),std::allocator<__CFString const>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021857C306
    || ((v3 & 0x800000021857C306 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000021857C306)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021857C306 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<__CFDictionary const*,void (*)(void const*),std::allocator<__CFDictionary const>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<__CFDictionary const*,void (*)(void const*),std::allocator<__CFDictionary const>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021857C306
    || ((v3 & 0x800000021857C306 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000021857C306)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021857C306 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

void JetPack::makeCFSharedPtr<__CFNumber const*>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  operator new();
}

void sub_218579E9C(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_218579EB4(_Unwind_Exception *a1)
{
}

uint64_t std::__shared_ptr_pointer<__CFNumber const*,void (*)(void const*),std::allocator<__CFNumber const>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<__CFNumber const*,void (*)(void const*),std::allocator<__CFNumber const>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021857C306
    || ((v3 & 0x800000021857C306 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000021857C306)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021857C306 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

void std::__shared_ptr_pointer<__SecKey *,void (*)(void const*),std::allocator<__SecKey>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D46C1B0);
}

uint64_t std::__shared_ptr_pointer<__SecKey *,void (*)(void const*),std::allocator<__SecKey>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021857C306
    || ((v3 & 0x800000021857C306 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000021857C306)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021857C306 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

void JetPack::makeCFSharedPtr<__CFArray const*>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  operator new();
}

void sub_21857A068(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21857A080(_Unwind_Exception *a1)
{
}

uint64_t std::__shared_ptr_pointer<__CFArray const*,void (*)(void const*),std::allocator<__CFArray const>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<__CFArray const*,void (*)(void const*),std::allocator<__CFArray const>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021857C306
    || ((v3 & 0x800000021857C306 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000021857C306)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021857C306 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<__SecCertificate *,void (*)(void const*),std::allocator<__SecCertificate>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021857C306
    || ((v3 & 0x800000021857C306 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000021857C306)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021857C306 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<__SecTrust *,void (*)(void const*),std::allocator<__SecTrust>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021857C306
    || ((v3 & 0x800000021857C306 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000021857C306)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021857C306 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

uint64_t std::allocator<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>>::construct[abi:ne180100]<JetPack::BrotliDecoderStreamImpl<JetPack::AppleDecompressionInterface>,std::shared_ptr<JetPack::BaseStream> &>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void std::__function::__func<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>),std::allocator<BOOL (*)(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>,BOOL ()(JetPack::ReaderConfig &,std::shared_ptr<JetPack::BaseStream>)>::operator()(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::allocator_traits<std::allocator<JetPack::PartialStream>>::construct[abi:ne180100]<JetPack::PartialStream,std::shared_ptr<JetPack::BaseStream> &,unsigned int &,void>(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t std::allocator<JetPack::AESDecoderStream>::construct[abi:ne180100]<JetPack::AESDecoderStream,std::shared_ptr<JetPack::BaseStream> &,std::array<unsigned char,16ul> &,unsigned int &>(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

uint64_t std::allocator<JetPack::CommonCryptoSignatureVerifier>::construct[abi:ne180100]<JetPack::CommonCryptoSignatureVerifier,std::vector<unsigned char> &>()
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void std::__function::__func<JetPackReaderSetDataSegmentFoundCallback::$_0,std::allocator<JetPackReaderSetDataSegmentFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,std::string,std::shared_ptr<JetPack::BaseStream>)>::operator()(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    OUTLINED_FUNCTION_0();
    (*(void (**)(void))(v2 + 16))();
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::__function::__func<JetPackReaderSetFileEntryFoundCallback::$_0,std::allocator<JetPackReaderSetFileEntryFoundCallback::$_0>,BOOL ()(JetPack::ReaderConfig &,void *,std::shared_ptr<JetPack::ArchiveStream>)>::operator()(uint64_t a1, char a2, std::__shared_weak_count *a3)
{
  if ((a2 & 1) == 0 && !atomic_fetch_add(&a3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a3->__on_zero_shared)(a3);
    std::__shared_weak_count::__release_weak(a3);
  }
}

uint64_t JetPackStreamCreate_cold_1(uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (result == a2) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 32))(a2);
  }
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 40))(result);
  }
  return result;
}

uint64_t std::__optional_move_base<std::function<void ()(unsigned long)>,false>::__optional_move_base[abi:ne180100](void *a1)
{
  uint64_t result = a1[3];
  if ((void *)result == a1) {
    return (*(uint64_t (**)(void *))(*a1 + 32))(a1);
  }
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 40))();
  }
  return result;
}

uint64_t std::__optional_move_base<std::function<unsigned long ()(void)>,false>::__optional_move_base[abi:ne180100](void *a1)
{
  uint64_t result = a1[3];
  if ((void *)result == a1) {
    return (*(uint64_t (**)(void *))(*a1 + 32))(a1);
  }
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 40))();
  }
  return result;
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x270ED7910]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x270ED7918]();
}

uint64_t CCDeriveKey()
{
  return MEMORY[0x270ED7958]();
}

uint64_t CCKDFParametersCreateHkdf()
{
  return MEMORY[0x270ED7A20]();
}

uint64_t CCKDFParametersDestroy()
{
  return MEMORY[0x270ED7A28]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x270EFD940]();
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x270EFD998](key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B0](key, error);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA40](parameters, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA60](keyData, attributes, error);
}

Boolean SecKeyIsAlgorithmSupported(SecKeyRef key, SecKeyOperationType operation, SecKeyAlgorithm algorithm)
{
  return MEMORY[0x270EFDAA8](key, operation, algorithm);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x270EFDAC8](key, algorithm, signedData, signature, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x270EFDD28](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::nested_exception::rethrow_nested(const std::nested_exception *this)
{
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F98288](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F98298](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F982A0](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::path::lexically_normal(std::__fs::filesystem::path *__return_ptr retstr, const std::__fs::filesystem::path *this)
{
  return (std::__fs::filesystem::path *)MEMORY[0x270F982A8](retstr, this);
}

std::__fs::filesystem::path::iterator *__cdecl std::__fs::filesystem::path::end(std::__fs::filesystem::path::iterator *__return_ptr retstr, const std::__fs::filesystem::path *this)
{
  return (std::__fs::filesystem::path::iterator *)MEMORY[0x270F982B8](retstr, this);
}

std::__fs::filesystem::path::iterator *__cdecl std::__fs::filesystem::path::begin(std::__fs::filesystem::path::iterator *__return_ptr retstr, const std::__fs::filesystem::path *this)
{
  return (std::__fs::filesystem::path::iterator *)MEMORY[0x270F982C0](retstr, this);
}

int std::__fs::filesystem::path::__compare(const std::__fs::filesystem::path *this, std::__fs::filesystem::path::__string_view a2)
{
  return MEMORY[0x270F982D0](this, a2.__data_, a2.__size_);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::nested_exception *__cdecl std::nested_exception::nested_exception(std::nested_exception *this)
{
  return (std::nested_exception *)MEMORY[0x270F98418](this);
}

void std::nested_exception::~nested_exception(std::nested_exception *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::__read_symlink(std::__fs::filesystem::path *__return_ptr retstr, const std::__fs::filesystem::path *a2, std::error_code *__ec)
{
  return (std::__fs::filesystem::path *)MEMORY[0x270F98A98](retstr, a2, __ec);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__symlink_status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x270F98AB0](a1, __ec);
}

std::__fs::filesystem::path::iterator *__cdecl std::__fs::filesystem::path::iterator::__increment(std::__fs::filesystem::path::iterator *this)
{
  return (std::__fs::filesystem::path::iterator *)MEMORY[0x270F98B38](this);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x270F97D88]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x270F97DF0]();
}

uint64_t archive_entry_size()
{
  return MEMORY[0x270F97E20]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x270F97E58]();
}

uint64_t archive_read_close()
{
  return MEMORY[0x270F97E78]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x270F97E88]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x270F97EE0]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x270F97EF0]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x270F97EF8]();
}

uint64_t archive_read_open()
{
  return MEMORY[0x270F97F08]();
}

uint64_t archive_read_support_format_all()
{
  return MEMORY[0x270F97F68]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x270F97FA8]();
}

uint64_t archive_write_data_block()
{
  return MEMORY[0x270F97FB8]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x270F97FC0]();
}

uint64_t archive_write_disk_set_options()
{
  return MEMORY[0x270F97FC8]();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return MEMORY[0x270F97FD0]();
}

uint64_t archive_write_finish_entry()
{
  return MEMORY[0x270F97FE0]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x270F97FE8]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x270F97FF0]();
}

void bzero(void *a1, size_t a2)
{
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x270F98F68](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F78](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x270F98F80](stream, *(void *)&flags);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}