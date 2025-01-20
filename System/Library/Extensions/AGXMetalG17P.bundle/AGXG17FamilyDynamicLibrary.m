@interface AGXG17FamilyDynamicLibrary
- (AGXG17FamilyDynamicLibrary)initWithBinaryData:(id)a3 name:(id)a4 device:(id)a5;
- (AGXG17FamilyDynamicLibrary)initWithLibrary:(id)a3 binaryData:(id)a4 device:(id)a5 error:(id *)a6;
- (AGXG17FamilyDynamicLibrary)initWithURL:(id)a3 device:(id)a4 error:(id *)a5;
- (AGXG17FamilyDynamicLibrary)initWithURL:(id)a3 device:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id).cxx_construct;
- (unint64_t)binaryUniqueId;
@end

@implementation AGXG17FamilyDynamicLibrary

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_impl.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (unint64_t)binaryUniqueId
{
  return *(void *)self->_impl.__ptr_;
}

- (AGXG17FamilyDynamicLibrary)initWithBinaryData:(id)a3 name:(id)a4 device:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)AGXG17FamilyDynamicLibrary;
  v8 = [(_MTLObjectWithLabel *)&v15 init];
  if (v8)
  {
    v9 = (char *)operator new(0x4B0uLL);
    *((void *)v9 + 1) = 0;
    *((void *)v9 + 2) = 0;
    *(void *)v9 = &unk_26F852488;
    uint64_t v10 = (uint64_t)(v9 + 24);
    bzero(v9 + 24, 0x408uLL);
    *((_DWORD *)v9 + 40) = -1;
    *(void *)(v9 + 164) = 0;
    *(void *)(v9 + 180) = 0;
    *(void *)(v9 + 172) = 0;
    *(void *)(v9 + 188) = 0xFFFFFFFF00000001;
    *(void *)(v9 + 196) = 1610612736;
    *(_OWORD *)(v9 + 204) = 0u;
    *(_OWORD *)(v9 + 220) = 0u;
    *(void *)(v9 + 236) = 0;
    *(void *)&long long v11 = -1;
    *((void *)&v11 + 1) = -1;
    *(_OWORD *)(v9 + 244) = v11;
    *(_OWORD *)(v9 + 260) = v11;
    *(_OWORD *)(v9 + 276) = v11;
    *(_OWORD *)(v9 + 312) = 0u;
    *(_OWORD *)(v9 + 328) = 0u;
    *((_DWORD *)v9 + 73) = 0;
    *((_WORD *)v9 + 148) = 0;
    *((_DWORD *)v9 + 86) = 1065353216;
    *((_OWORD *)v9 + 22) = 0u;
    *((_OWORD *)v9 + 23) = 0u;
    *((_DWORD *)v9 + 96) = 1065353216;
    *(_OWORD *)(v9 + 392) = 0u;
    *(_OWORD *)(v9 + 408) = 0u;
    *((_DWORD *)v9 + 106) = 1065353216;
    *((_OWORD *)v9 + 27) = 0u;
    *((_OWORD *)v9 + 28) = 0u;
    *((_OWORD *)v9 + 29) = 0u;
    *((_OWORD *)v9 + 30) = 0u;
    *((_OWORD *)v9 + 31) = 0u;
    *(_OWORD *)(v9 + 509) = 0u;
    *((_OWORD *)v9 + 33) = 0u;
    *((_OWORD *)v9 + 34) = 0u;
    *((_OWORD *)v9 + 35) = 0u;
    *((_OWORD *)v9 + 36) = 0u;
    *((void *)v9 + 74) = 0;
    *((_DWORD *)v9 + 150) = 1;
    *(_OWORD *)(v9 + 604) = 0u;
    *(_OWORD *)(v9 + 620) = 0u;
    *(_OWORD *)(v9 + 636) = 0u;
    *(_OWORD *)(v9 + 652) = 0u;
    *(_OWORD *)(v9 + 668) = 0u;
    *(_OWORD *)(v9 + 680) = 0u;
    *((_OWORD *)v9 + 47) = 0u;
    *((_OWORD *)v9 + 48) = 0u;
    *((_OWORD *)v9 + 45) = 0u;
    *((_OWORD *)v9 + 46) = 0u;
    *((_OWORD *)v9 + 44) = 0u;
    *(_OWORD *)(v9 + 840) = 0u;
    *(_OWORD *)(v9 + 856) = 0u;
    *(_OWORD *)(v9 + 808) = 0u;
    *(_OWORD *)(v9 + 824) = 0u;
    *(_OWORD *)(v9 + 792) = 0u;
    *((_OWORD *)v9 + 58) = 0u;
    *((_OWORD *)v9 + 59) = 0u;
    *((_OWORD *)v9 + 56) = 0u;
    *((_OWORD *)v9 + 57) = 0u;
    *((_OWORD *)v9 + 55) = 0u;
    *(_OWORD *)(v9 + 1016) = 0u;
    *(_OWORD *)(v9 + 1032) = 0u;
    *(_OWORD *)(v9 + 984) = 0u;
    *(_OWORD *)(v9 + 1000) = 0u;
    *(_OWORD *)(v9 + 968) = 0u;
    *((_OWORD *)v9 + 74) = 0u;
    *((_OWORD *)v9 + 73) = 0u;
    *((_OWORD *)v9 + 72) = 0u;
    *((_OWORD *)v9 + 71) = 0u;
    *((_OWORD *)v9 + 70) = 0u;
    *((_OWORD *)v9 + 69) = 0u;
    *((_OWORD *)v9 + 68) = 0u;
    *((_OWORD *)v9 + 67) = 0u;
    *((_OWORD *)v9 + 66) = 0u;
    p_impl = (uint64_t *)&v8->_impl;
    cntrl = (std::__shared_weak_count *)v8->_impl.__cntrl_;
    v8->_impl.__ptr_ = (DynamicLibrary *)(v9 + 24);
    v8->_impl.__cntrl_ = (__shared_weak_count *)v9;
    if (cntrl)
    {
      if (atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        uint64_t v10 = *p_impl;
        if (!*p_impl) {
          goto LABEL_8;
        }
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
        uint64_t v10 = *p_impl;
        if (!*p_impl)
        {
LABEL_8:

          return 0;
        }
      }
    }
    if (!AGX::DynamicLibrary<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,void>::initialize(v10, *((void *)a5 + 101), (dispatch_data_t)a3, [a4 UTF8String]))goto LABEL_8; {
  }
    }
  return v8;
}

- (AGXG17FamilyDynamicLibrary)initWithURL:(id)a3 device:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  v17.receiver = self;
  v17.super_class = (Class)AGXG17FamilyDynamicLibrary;
  v7 = [(_MTLDynamicLibrary *)&v17 initWithURL:a3 device:a4 options:a5 error:a6];
  if (v7)
  {
    v8 = (char *)operator new(0x4B0uLL);
    *((void *)v8 + 1) = 0;
    *((void *)v8 + 2) = 0;
    *(void *)v8 = &unk_26F852488;
    uint64_t v9 = (uint64_t)(v8 + 24);
    bzero(v8 + 24, 0x408uLL);
    *((_DWORD *)v8 + 40) = -1;
    *(void *)(v8 + 164) = 0;
    *(void *)(v8 + 180) = 0;
    *(void *)(v8 + 172) = 0;
    *(void *)(v8 + 188) = 0xFFFFFFFF00000001;
    *(void *)(v8 + 196) = 1610612736;
    *(_OWORD *)(v8 + 204) = 0u;
    *(_OWORD *)(v8 + 220) = 0u;
    *(void *)(v8 + 236) = 0;
    *(void *)&long long v10 = -1;
    *((void *)&v10 + 1) = -1;
    *(_OWORD *)(v8 + 244) = v10;
    *(_OWORD *)(v8 + 260) = v10;
    *(_OWORD *)(v8 + 276) = v10;
    *(_OWORD *)(v8 + 312) = 0u;
    *(_OWORD *)(v8 + 328) = 0u;
    *((_DWORD *)v8 + 73) = 0;
    *((_WORD *)v8 + 148) = 0;
    *((_DWORD *)v8 + 86) = 1065353216;
    *((_OWORD *)v8 + 22) = 0u;
    *((_OWORD *)v8 + 23) = 0u;
    *((_DWORD *)v8 + 96) = 1065353216;
    *(_OWORD *)(v8 + 392) = 0u;
    *(_OWORD *)(v8 + 408) = 0u;
    *((_DWORD *)v8 + 106) = 1065353216;
    *((_OWORD *)v8 + 27) = 0u;
    *((_OWORD *)v8 + 28) = 0u;
    *((_OWORD *)v8 + 29) = 0u;
    *((_OWORD *)v8 + 30) = 0u;
    *((_OWORD *)v8 + 31) = 0u;
    *(_OWORD *)(v8 + 509) = 0u;
    *((_OWORD *)v8 + 33) = 0u;
    *((_OWORD *)v8 + 34) = 0u;
    *((_OWORD *)v8 + 35) = 0u;
    *((_OWORD *)v8 + 36) = 0u;
    *((void *)v8 + 74) = 0;
    *((_DWORD *)v8 + 150) = 1;
    *(_OWORD *)(v8 + 604) = 0u;
    *(_OWORD *)(v8 + 620) = 0u;
    *(_OWORD *)(v8 + 636) = 0u;
    *(_OWORD *)(v8 + 652) = 0u;
    *(_OWORD *)(v8 + 668) = 0u;
    *(_OWORD *)(v8 + 680) = 0u;
    *((_OWORD *)v8 + 47) = 0u;
    *((_OWORD *)v8 + 48) = 0u;
    *((_OWORD *)v8 + 45) = 0u;
    *((_OWORD *)v8 + 46) = 0u;
    *((_OWORD *)v8 + 44) = 0u;
    *(_OWORD *)(v8 + 840) = 0u;
    *(_OWORD *)(v8 + 856) = 0u;
    *(_OWORD *)(v8 + 808) = 0u;
    *(_OWORD *)(v8 + 824) = 0u;
    *(_OWORD *)(v8 + 792) = 0u;
    *((_OWORD *)v8 + 58) = 0u;
    *((_OWORD *)v8 + 59) = 0u;
    *((_OWORD *)v8 + 56) = 0u;
    *((_OWORD *)v8 + 57) = 0u;
    *((_OWORD *)v8 + 55) = 0u;
    *(_OWORD *)(v8 + 1016) = 0u;
    *(_OWORD *)(v8 + 1032) = 0u;
    *(_OWORD *)(v8 + 984) = 0u;
    *(_OWORD *)(v8 + 1000) = 0u;
    *(_OWORD *)(v8 + 968) = 0u;
    *((_OWORD *)v8 + 74) = 0u;
    *((_OWORD *)v8 + 73) = 0u;
    *((_OWORD *)v8 + 72) = 0u;
    *((_OWORD *)v8 + 71) = 0u;
    *((_OWORD *)v8 + 70) = 0u;
    *((_OWORD *)v8 + 69) = 0u;
    *((_OWORD *)v8 + 68) = 0u;
    *((_OWORD *)v8 + 67) = 0u;
    *((_OWORD *)v8 + 66) = 0u;
    p_impl = (uint64_t *)&v7->_impl;
    cntrl = (std::__shared_weak_count *)v7->_impl.__cntrl_;
    v7->_impl.__ptr_ = (DynamicLibrary *)(v8 + 24);
    v7->_impl.__cntrl_ = (__shared_weak_count *)v8;
    if (cntrl)
    {
      if (atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        uint64_t v9 = *p_impl;
        if (!*p_impl) {
          goto LABEL_11;
        }
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
        uint64_t v9 = *p_impl;
        if (!*p_impl)
        {
LABEL_11:

          return 0;
        }
      }
    }
    uint64_t v13 = *((void *)a4 + 101);
    v14 = [(_MTLDynamicLibrary *)v7 binaryData];
    if ([(_MTLDynamicLibrary *)v7 installName]) {
      objc_super v15 = [(_MTLDynamicLibrary *)v7 installName];
    }
    else {
      objc_super v15 = [(_MTLObjectWithLabel *)v7 label];
    }
    if (!AGX::DynamicLibrary<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,void>::initialize(v9, v13, v14, (uint64_t)[(NSString *)v15 UTF8String]))goto LABEL_11; {
  }
    }
  return v7;
}

- (AGXG17FamilyDynamicLibrary)initWithURL:(id)a3 device:(id)a4 error:(id *)a5
{
  return [(AGXG17FamilyDynamicLibrary *)self initWithURL:a3 device:a4 options:0 error:a5];
}

- (AGXG17FamilyDynamicLibrary)initWithLibrary:(id)a3 binaryData:(id)a4 device:(id)a5 error:(id *)a6
{
  v17.receiver = self;
  v17.super_class = (Class)AGXG17FamilyDynamicLibrary;
  v8 = [(_MTLDynamicLibrary *)&v17 initWithLibrary:a3 binaryData:a4 device:a5 error:a6];
  if (v8)
  {
    uint64_t v9 = (char *)operator new(0x4B0uLL);
    *((void *)v9 + 1) = 0;
    *((void *)v9 + 2) = 0;
    *(void *)uint64_t v9 = &unk_26F852488;
    uint64_t v10 = (uint64_t)(v9 + 24);
    bzero(v9 + 24, 0x408uLL);
    *((_DWORD *)v9 + 40) = -1;
    *(void *)(v9 + 164) = 0;
    *(void *)(v9 + 180) = 0;
    *(void *)(v9 + 172) = 0;
    *(void *)(v9 + 188) = 0xFFFFFFFF00000001;
    *(void *)(v9 + 196) = 1610612736;
    *(_OWORD *)(v9 + 204) = 0u;
    *(_OWORD *)(v9 + 220) = 0u;
    *(void *)(v9 + 236) = 0;
    *(void *)&long long v11 = -1;
    *((void *)&v11 + 1) = -1;
    *(_OWORD *)(v9 + 244) = v11;
    *(_OWORD *)(v9 + 260) = v11;
    *(_OWORD *)(v9 + 276) = v11;
    *(_OWORD *)(v9 + 312) = 0u;
    *(_OWORD *)(v9 + 328) = 0u;
    *((_DWORD *)v9 + 73) = 0;
    *((_WORD *)v9 + 148) = 0;
    *((_DWORD *)v9 + 86) = 1065353216;
    *((_OWORD *)v9 + 22) = 0u;
    *((_OWORD *)v9 + 23) = 0u;
    *((_DWORD *)v9 + 96) = 1065353216;
    *(_OWORD *)(v9 + 392) = 0u;
    *(_OWORD *)(v9 + 408) = 0u;
    *((_DWORD *)v9 + 106) = 1065353216;
    *((_OWORD *)v9 + 27) = 0u;
    *((_OWORD *)v9 + 28) = 0u;
    *((_OWORD *)v9 + 29) = 0u;
    *((_OWORD *)v9 + 30) = 0u;
    *((_OWORD *)v9 + 31) = 0u;
    *(_OWORD *)(v9 + 509) = 0u;
    *((_OWORD *)v9 + 33) = 0u;
    *((_OWORD *)v9 + 34) = 0u;
    *((_OWORD *)v9 + 35) = 0u;
    *((_OWORD *)v9 + 36) = 0u;
    *((void *)v9 + 74) = 0;
    *((_DWORD *)v9 + 150) = 1;
    *(_OWORD *)(v9 + 604) = 0u;
    *(_OWORD *)(v9 + 620) = 0u;
    *(_OWORD *)(v9 + 636) = 0u;
    *(_OWORD *)(v9 + 652) = 0u;
    *(_OWORD *)(v9 + 668) = 0u;
    *(_OWORD *)(v9 + 680) = 0u;
    *((_OWORD *)v9 + 47) = 0u;
    *((_OWORD *)v9 + 48) = 0u;
    *((_OWORD *)v9 + 45) = 0u;
    *((_OWORD *)v9 + 46) = 0u;
    *((_OWORD *)v9 + 44) = 0u;
    *(_OWORD *)(v9 + 840) = 0u;
    *(_OWORD *)(v9 + 856) = 0u;
    *(_OWORD *)(v9 + 808) = 0u;
    *(_OWORD *)(v9 + 824) = 0u;
    *(_OWORD *)(v9 + 792) = 0u;
    *((_OWORD *)v9 + 58) = 0u;
    *((_OWORD *)v9 + 59) = 0u;
    *((_OWORD *)v9 + 56) = 0u;
    *((_OWORD *)v9 + 57) = 0u;
    *((_OWORD *)v9 + 55) = 0u;
    *(_OWORD *)(v9 + 1016) = 0u;
    *(_OWORD *)(v9 + 1032) = 0u;
    *(_OWORD *)(v9 + 984) = 0u;
    *(_OWORD *)(v9 + 1000) = 0u;
    *(_OWORD *)(v9 + 968) = 0u;
    *((_OWORD *)v9 + 74) = 0u;
    *((_OWORD *)v9 + 73) = 0u;
    *((_OWORD *)v9 + 72) = 0u;
    *((_OWORD *)v9 + 71) = 0u;
    *((_OWORD *)v9 + 70) = 0u;
    *((_OWORD *)v9 + 69) = 0u;
    *((_OWORD *)v9 + 68) = 0u;
    *((_OWORD *)v9 + 67) = 0u;
    *((_OWORD *)v9 + 66) = 0u;
    p_impl = (uint64_t *)&v8->_impl;
    cntrl = (std::__shared_weak_count *)v8->_impl.__cntrl_;
    v8->_impl.__ptr_ = (DynamicLibrary *)(v9 + 24);
    v8->_impl.__cntrl_ = (__shared_weak_count *)v9;
    if (cntrl)
    {
      if (atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        uint64_t v10 = *p_impl;
        if (!*p_impl) {
          goto LABEL_11;
        }
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
        uint64_t v10 = *p_impl;
        if (!*p_impl)
        {
LABEL_11:

          return 0;
        }
      }
    }
    uint64_t v14 = *((void *)a5 + 101);
    if ([(_MTLDynamicLibrary *)v8 installName]) {
      objc_super v15 = [(_MTLDynamicLibrary *)v8 installName];
    }
    else {
      objc_super v15 = [(_MTLObjectWithLabel *)v8 label];
    }
    if (!AGX::DynamicLibrary<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,void>::initialize(v10, v14, (dispatch_data_t)a4, (uint64_t)[(NSString *)v15 UTF8String]))goto LABEL_11; {
  }
    }
  return v8;
}

@end