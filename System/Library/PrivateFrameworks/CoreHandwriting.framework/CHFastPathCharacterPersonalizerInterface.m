@interface CHFastPathCharacterPersonalizerInterface
- (CHFastPathCharacterPersonalizerInterface)initWithStyleInventory:(id)a3 characterSet:(id)a4;
- (id).cxx_construct;
- (void)runPersonalizationWithBlock:(id)a3 resynthesizeAll:(BOOL)a4;
@end

@implementation CHFastPathCharacterPersonalizerInterface

- (CHFastPathCharacterPersonalizerInterface)initWithStyleInventory:(id)a3 characterSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = objc_msgSend_init(self, v8, v9, v10, v11, v12);
  if (v13)
  {
    CoreHandwriting::synthesis::fast_path::CHFastPathCharacterPersonalizerWithPrefixForStyleInventory::CHFastPathCharacterPersonalizerWithPrefixForStyleInventory(&v18, v7, v6);
    long long v14 = v18;
    long long v18 = 0uLL;
    v15 = *(std::__shared_weak_count **)(v13 + 16);
    *(_OWORD *)(v13 + 8) = v14;
    if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
    v16 = (std::__shared_weak_count *)*((void *)&v18 + 1);
    if (*((void *)&v18 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v18 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  return (CHFastPathCharacterPersonalizerInterface *)v13;
}

- (void)runPersonalizationWithBlock:(id)a3 resynthesizeAll:(BOOL)a4
{
  CoreHandwriting::synthesis::fast_path::CHFastPathCharacterPersonalizerWithPrefixForStyleInventory::runPersonalization((void (****)(void **__return_ptr))&self->_fastPathCharacterPersonalizer, a3);
}

- (void).cxx_destruct
{
  cntrl = self->_fastPathCharacterPersonalizer._fastPathCharacterPersonalizer.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end