void sub_1DD680128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char **a11, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24)
{
  void *v24;

  __cxa_free_exception(v24);
  if (a23 < 0) {
    operator delete(__p);
  }
  std::__tree<std::string>::destroy(*a11);
  _Unwind_Resume(a1);
}

void MIDICI::Profile::~Profile(MIDICI::Profile *this)
{
  v2 = (void *)*((void *)this + 11);
  if (v2)
  {
    *((void *)this + 12) = v2;
    operator delete(v2);
  }
  if (*((char *)this + 87) < 0) {
    operator delete(*((void **)this + 8));
  }
  *(void *)this = &unk_1F38D4860;
  XCFObject<__CFDictionary const*>::~XCFObject((uint64_t)this + 24);
  BaseOpaqueObject::~BaseOpaqueObject(this);

  JUMPOUT(0x1E01BB8C0);
}

{
  void *v2;
  uint64_t vars8;

  v2 = (void *)*((void *)this + 11);
  if (v2)
  {
    *((void *)this + 12) = v2;
    operator delete(v2);
  }
  if (*((char *)this + 87) < 0) {
    operator delete(*((void **)this + 8));
  }
  *(void *)this = &unk_1F38D4860;
  XCFObject<__CFDictionary const*>::~XCFObject((uint64_t)this + 24);

  BaseOpaqueObject::~BaseOpaqueObject(this);
}

uint64_t MIDICI::Profile::Profile(uint64_t a1, unsigned char *a2, long long *a3, char a4)
{
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, a3);
  MIDIObject::MIDIObject((MIDIObject *)a1);
  *(unsigned char *)(a1 + 44) = 0;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)a1 = &unk_1F38D2408;
  if (v10)
  {
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external((std::string *)(a1 + 64), __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    }
    else {
      *(std::string *)(a1 + 64) = __p;
    }
  }
  else
  {
    CIProfileBytesToName(a1 + 64, a2, 5uLL);
  }
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  v7 = (char *)operator new(5uLL);
  *(void *)(a1 + 88) = v7;
  *(void *)(a1 + 96) = v7;
  *(void *)(a1 + 104) = v7 + 5;
  *(_DWORD *)v7 = *(_DWORD *)a2;
  v7[4] = a2[4];
  *(void *)(a1 + 96) = v7 + 5;
  *(_DWORD *)(a1 + 112) = 0;
  *(unsigned char *)(a1 + 116) = a4;
  *(_WORD *)(a1 + 118) = 0;
  *(_DWORD *)(a1 + 120) = 0;
  if (v10 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return a1;
}

void sub_1DD68047C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MIDIObject::~MIDIObject(v15);
  if (a15)
  {
    if (a14 < 0) {
      operator delete(__p);
    }
  }
  _Unwind_Resume(a1);
}

void MIDIIORingBufferBase::Init(MIDIIORingBufferBase *this, unsigned int a2, std::string::value_type *__s)
{
  if (!MIDIIORingBufferBase::sLog) {
    operator new();
  }
  std::string::__assign_external((std::string *)((char *)this + 8), __s);
  *((_DWORD *)this + 9) = a2 != 0;
  if (a2) {
    int v6 = shm_open(__s, 514, 511);
  }
  else {
    int v6 = shm_open(__s, 2, 511);
  }
  if (v6 != -1)
  {
    int v7 = v6;
    if (a2) {
      ftruncate(v6, 0x4000);
    }
    *((void *)this + 11) = mmap(0, 0x4000uLL, 3, 1, v7, 0);
    close(v7);
    *((unsigned char *)this + 40) = 1;
    v8 = (void *)*((void *)this + 11);
    *((_DWORD *)this + 8) = 16352;
    if ((unint64_t)v8 + 1 > 1)
    {
      if (!a2) {
        return;
      }
      bzero(v8, 0x4000uLL);
      goto LABEL_15;
    }
    *((void *)this + 11) = (char *)this + 44;
  }
  if (a2)
  {
LABEL_15:
    atomic_store(a2, (unsigned int *)(*((void *)this + 11) + 8));
    atomic_store(0, (unsigned int *)(*((void *)this + 11) + 12));
  }
}

BOOL MIDIIORingBufferReader::readPacketList(MIDIRingBuffer *this, void *a2, uint64_t a3)
{
  while (1)
  {
    unsigned int v6 = atomic_load((unsigned int *)(*((void *)this + 11) + 12));
    uint64_t v7 = *((void *)this + 11);
    if (v6) {
      break;
    }
    if (!atomic_exchange((atomic_uint *volatile)(v7 + 20), 0)) {
      return 0;
    }
  }
  if (atomic_load((unsigned int *)(v7 + 12)))
  {
    uint64_t v10 = 0;
    char v11 = 1;
    while (1)
    {
      signed int v12 = MIDIRingBuffer::Peek(this, (char *)__dst, 20);
      if (v12 < 0) {
        break;
      }
      if (v11)
      {
        *a2 = __dst[0];
        *(void *)a3 = v17;
        uint64_t v10 = a3 + 8;
      }
      else
      {
        if (*(_DWORD *)a3 != v17 || __dst[0] != *a2) {
          return *(_DWORD *)(a3 + 4) != 0;
        }
        v10 += 4 * *(unsigned int *)(v10 + 8) + 12;
      }
      unsigned int v13 = (unsigned __int16)v18;
      if (a3 + 1024 - (v10 + 12) < (unsigned __int16)v18) {
        return *(_DWORD *)(a3 + 4) != 0;
      }
      if (*((_DWORD *)this + 8) <= v12) {
        break;
      }
      atomic_store(v12, (unsigned int *)(*((void *)this + 11) + 4));
      signed int v14 = MIDIRingBuffer::Peek(this, (char *)(v10 + 12), v13);
      if (v14 < 0 || *((_DWORD *)this + 8) <= v14) {
        break;
      }
      char v11 = 0;
      atomic_store(v14, (unsigned int *)(*((void *)this + 11) + 4));
      ++*(_DWORD *)(a3 + 4);
      *(_DWORD *)(v10 + 8) = v13 >> 2;
      *(void *)uint64_t v10 = __dst[1];
      atomic_fetch_add((atomic_uint *volatile)(*((void *)this + 11) + 12), 0xFFFFFFFF);
      if (!atomic_load((unsigned int *)(*((void *)this + 11) + 12))) {
        return *(_DWORD *)(a3 + 4) != 0;
      }
    }
    std::terminate();
  }
  return *(_DWORD *)(a3 + 4) != 0;
}

void MIDIIORingBufferWriter::writePacket2(uint64_t a1, char *__src, char *a3)
{
  if (*((unsigned __int16 *)__src + 9) >= 0x3E9u) {
    std::terminate();
  }
  int v6 = *(_DWORD *)(a1 + 136);
  if (v6)
  {
    if (v6 == 1 || mach_absolute_time() < *(void *)(a1 + 144)) {
      return;
    }
    *(_DWORD *)(a1 + 136) = 0;
  }
  uint64_t v7 = *(unsigned int **)(a1 + 88);
  unsigned int v8 = atomic_load(v7);
  LODWORD(v7) = atomic_load(v7 + 1);
  int v9 = v8 - v7;
  if (v9 < 0) {
    v9 += *(_DWORD *)(a1 + 32);
  }
  if ((unint64_t)*((unsigned __int16 *)__src + 9) + 20 >= *(int *)(a1 + 32) - (uint64_t)v9
    || (unsigned int v10 = atomic_load((unsigned int *)(*(void *)(a1 + 88) + 16))) != 0)
  {
    deque_vec<unsigned char>::append<unsigned char const*>(a1 + 104, __src, __src + 20);
    deque_vec<unsigned char>::append<unsigned char const*>(a1 + 104, a3, &a3[*((unsigned __int16 *)__src + 9)]);
    atomic_store(1u, (unsigned int *)(*(void *)(a1 + 88) + 16));
  }
  else
  {
    MIDIIORingBufferWriter::writePacket3((MIDIRingBuffer *)a1, (uint64_t)__src, a3);
  }
}

uint64_t MIDIIORingBufferWriter::writePacket3(MIDIRingBuffer *a1, uint64_t a2, char *a3)
{
  if ((MIDIRingBuffer::Write(a1, (char *)a2, 20) & 0x80000000) != 0
    || (uint64_t result = MIDIRingBuffer::Write(a1, a3, *(unsigned __int16 *)(a2 + 18)), (result & 0x80000000) != 0))
  {
    std::terminate();
  }
  atomic_fetch_add((atomic_uint *volatile)(*((void *)a1 + 11) + 12), 1u);
  return result;
}

void deque_vec<unsigned char>::append<unsigned char const*>(uint64_t a1, char *__src, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 24);
  if (v6)
  {
    unsigned int v8 = *(char **)a1;
    uint64_t v7 = *(char **)(a1 + 8);
    if (&v7[(void)a3] - &__src[*(void *)a1] > *(void *)(a1 + 16) - *(void *)a1)
    {
      int v9 = &v8[v6];
      size_t v10 = v7 - v9;
      if (v7 != v9) {
        memmove(*(void **)a1, v9, v10);
      }
      uint64_t v7 = &v8[v10];
      *(void *)(a1 + 8) = &v8[v10];
      *(void *)(a1 + 24) = 0;
    }
  }
  else
  {
    uint64_t v7 = *(char **)(a1 + 8);
  }

  std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, v7, __src, a3, a3 - __src);
}

BOOL MIDIIORingBufferWriter::emptySecondaryQueue(os_unfair_lock_s *this)
{
  v2 = this + 25;
  os_unfair_lock_lock(this + 25);
  do
  {
    uint64_t v3 = *(void *)&this[26]._os_unfair_lock_opaque;
    uint64_t v4 = *(void *)&this[28]._os_unfair_lock_opaque;
    uint64_t v5 = *(void *)&this[32]._os_unfair_lock_opaque;
    while (v5 + v3 != v4)
    {
      if ((unint64_t)(v4 - (v5 + v3)) <= 0x13
        || (uint64_t v6 = (long long *)(v3 + v5), v14 = *((_DWORD *)v6 + 4), v13 = *v6, HIWORD(v14) >= 0x3E9u))
      {
        std::terminate();
      }
      uint64_t v7 = *(unsigned int **)&this[22]._os_unfair_lock_opaque;
      unsigned int v8 = atomic_load(v7);
      LODWORD(v7) = atomic_load(v7 + 1);
      int v9 = v8 - v7;
      if (v9 < 0) {
        v9 += this[8]._os_unfair_lock_opaque;
      }
      uint64_t v10 = HIWORD(v14);
      if ((signed int)(this[8]._os_unfair_lock_opaque - v9) <= HIWORD(v14) + 20) {
        goto LABEL_13;
      }
      MIDIIORingBufferWriter::writePacket3((MIDIRingBuffer *)this, (uint64_t)&v13, (char *)(*(void *)&this[32]._os_unfair_lock_opaque + *(void *)&this[26]._os_unfair_lock_opaque + 20));
      uint64_t v5 = v10 + *(void *)&this[32]._os_unfair_lock_opaque + 20;
      *(void *)&this[32]._os_unfair_lock_opaque = v5;
      uint64_t v3 = *(void *)&this[26]._os_unfair_lock_opaque;
      uint64_t v4 = *(void *)&this[28]._os_unfair_lock_opaque;
      if (v5 + v3 == v4)
      {
        uint64_t v5 = 0;
        *(void *)&this[28]._os_unfair_lock_opaque = v3;
        *(void *)&this[32]._os_unfair_lock_opaque = 0;
        uint64_t v4 = v3;
      }
    }
    atomic_store(0, (unsigned int *)(*(void *)&this[22]._os_unfair_lock_opaque + 16));
    if (this[34]._os_unfair_lock_opaque == 1)
    {
      this[34]._os_unfair_lock_opaque = 2;
      *(void *)&this[36]._os_unfair_lock_opaque = (unint64_t)((double)mach_absolute_time() + 120000000.0);
    }
LABEL_13:
    ;
  }
  while (atomic_exchange((atomic_uint *volatile)(*(void *)&this[22]._os_unfair_lock_opaque + 24), 0));
  BOOL v11 = atomic_fetch_or((atomic_uint *volatile)(*(void *)&this[22]._os_unfair_lock_opaque + 20), 1u) == 0;
  os_unfair_lock_unlock(v2);
  return v11;
}

void sub_1DD680B64(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void BackgroundAppManager::Update(BackgroundAppManager *this)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  gBackgroundAppManager();
  v2 = (id) gBackgroundAppManager(void)::bgappm;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "BackgroundAppManager.mm";
    __int16 v22 = 1024;
    int v23 = 32;
    _os_log_impl(&dword_1DD5F4000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d [*] BackgroundManager::Update()", buf, 0x12u);
  }
  uint64_t v3 = *((void *)this + 1);
  uint64_t v4 = [MEMORY[0x1E4F96448] descriptor];
  [v4 setValues:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = *(void *)(*(void *)this + 40);
  for (uint64_t i = *(void *)(*(void *)this + 48); v6 != i; v6 += 8)
  {
    unsigned int v8 = [MEMORY[0x1E4F963F8] identifierWithPid:*(unsigned int *)(*(void *)v6 + 8)];
    [v5 addObject:v8];
  }
  int v9 = [MEMORY[0x1E4F96430] predicateMatchingIdentifiers:v5];
  BOOL v10 = v3 == 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___ZN20BackgroundAppManager6UpdateEv_block_invoke;
  aBlock[3] = &unk_1E6CD3130;
  v19 = this;
  id v11 = v9;
  id v17 = v11;
  id v12 = v4;
  id v18 = v12;
  long long v13 = _Block_copy(aBlock);
  if (v10)
  {
    uint64_t v14 = [MEMORY[0x1E4F96418] monitorWithConfiguration:v13];
    v15 = (void *)*((void *)this + 1);
    *((void *)this + 1) = v14;
  }
  else
  {
    [*((id *)this + 1) updateConfiguration:v13];
  }
}

void sub_1DD680DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void gBackgroundAppManager(void)
{
  {
    caulk::log_category::log_category((caulk::log_category *)&gBackgroundAppManager(void)::bgappm, "com.apple.coremidi", "bgappm");
  }
}

void ___ZN20BackgroundAppManager6UpdateEv_block_invoke(void *a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = a1[6];
  v7[0] = a1[4];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 setPredicates:v5];

  [v3 setStateDescriptor:a1[5]];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___ZN20BackgroundAppManager6UpdateEv_block_invoke_2;
  v6[3] = &__block_descriptor_40_e74_v32__0__RBSProcessMonitor_8__RBSProcessHandle_16__RBSProcessStateUpdate_24l;
  v6[4] = v4;
  [v3 setUpdateHandler:v6];
}

void sub_1DD680F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN20BackgroundAppManager6UpdateEv_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = *(ClientTable ***)(a1 + 32);
  uint64_t v7 = [v5 state];
  unsigned int v8 = [v7 process];
  int v9 = [v8 pid];

  BOOL v10 = [v5 state];
  int v11 = [v10 taskState];

  gBackgroundAppManager();
  id v12 = (id) gBackgroundAppManager(void)::bgappm;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    long long v13 = [v5 state];
    int v14 = [v13 taskState];
    v15 = "NO";
    *(_DWORD *)v26 = 136316162;
    *(void *)&v26[4] = "BackgroundAppManager.mm";
    int v28 = 52;
    __int16 v27 = 1024;
    if (v11 == 3) {
      v15 = "YES";
    }
    __int16 v29 = 1024;
    int v30 = v9;
    __int16 v31 = 1024;
    int v32 = v14;
    __int16 v33 = 2080;
    v34 = v15;
    _os_log_impl(&dword_1DD5F4000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d BackgroundAppManager:mProcessMonitor updateHandler called for pid %d, taskState = %d (isSuspended = %s)", v26, 0x28u);
  }
  v16 = *v6;
  uint64_t v19 = MIDIServer::defaultInstance(v17, v18);
  uint64_t v20 = *(void *)(v19 + 16);
  *(void *)v26 = v19 + 16;
  v26[8] = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v19 + 16, v21, v22);
  for (uint64_t i = (ClientProcess **)*((void *)v16 + 5); i != *((ClientProcess ***)v16 + 6); ++i)
  {
    uint64_t v24 = *i;
    if (*((_DWORD *)*i + 2) == v9)
    {
      int v25 = v11 == 3;
      if (*((unsigned __int8 *)v24 + 13) != v25)
      {
        *((unsigned char *)v24 + 13) = v25;
        if (v11 != 3 && !*((unsigned char *)v24 + 320)) {
          ClientProcess::DeliverNotifications(v24);
        }
      }
      ClientTable::CheckActiveProcesses(v16);
      break;
    }
  }
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)v26);
}

void sub_1DD6811A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&a9);

  _Unwind_Resume(a1);
}

void sub_1DD681278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD6812F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD68139C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL MNSGlobalState::AddOrRemoveContact(MNSGlobalState *this, objc_object *a2, char a3)
{
  uint64_t v4 = ContactOrConnectionSet::AddOrRemoveItem((id *)this + 13, a2, a3);
  if (v4)
  {
    CFDictionaryRef v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v4 forKey:@"entries"];
    MIDIObjectSetDictionaryProperty(*((_DWORD *)this + 23), @"apple.midirtp.addressbook", v5);
  }
  return v4 != 0;
}

void sub_1DD681440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ContactOrConnectionSet::AddOrRemoveItem(id *this, objc_object *a2, char a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = a2;
  uint64_t v21 = [(objc_object *)v20 host];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = this[1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v25 != v7) {
        objc_enumerationMutation(v5);
      }
      int v9 = [*(id *)(*((void *)&v24 + 1) + 8 * v8) host];
      char v10 = [v9 hasSameAddressAs:v21];

      if (v10) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }

    if ((a3 & 1) == 0)
    {
      [this[1] removeObject:v20];
      goto LABEL_16;
    }
    if (!*(unsigned char *)this) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
LABEL_13:

  if ((a3 & 1) == 0)
  {
LABEL_12:
    id v23 = 0;
    goto LABEL_24;
  }
LABEL_14:
  [this[1] addObject:v20];
LABEL_16:
  id v23 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = this[1];
  uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        int v14 = [*(id *)(*((void *)&v28 + 1) + 8 * i) host];
        v15 = (void *)MEMORY[0x1E4F1C9E8];
        v16 = [v14 name];
        id v17 = [v14 addressAsText];
        int v18 = objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v16, @"name", v17, @"address", 0);
        [v23 addObject:v18];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v11);
  }

LABEL_24:

  return v23;
}

void sub_1DD68170C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1DD681848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD681980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD681A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD681AC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD681C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&a9);
  _Unwind_Resume(a1);
}

void sub_1DD681CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&a9);
  _Unwind_Resume(a1);
}

void sub_1DD681E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1DD681EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&a9);
  _Unwind_Resume(a1);
}

void sub_1DD681FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&a9);
  _Unwind_Resume(a1);
}

void sub_1DD6820B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&a9);
  _Unwind_Resume(a1);
}

void sub_1DD6822EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ContactOrConnectionSet::ContactOrConnectionSet(ContactOrConnectionSet *this, char a2)
{
  *(unsigned char *)this = a2;
  *((void *)this + 1) = 0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = (void *)*((void *)this + 1);
  *((void *)this + 1) = v3;
}

void sub_1DD68239C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD682468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD6825D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ContactOrConnectionSet::UpdateFromDriver(id *this, NSArray *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  uint64_t v19 = (void *)[this[1] mutableCopy];
  [this[1] removeAllObjects];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v17;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v3)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v21 = v3;
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v6 = [v5 objectForKey:@"name"];
        uint64_t v7 = [v5 objectForKey:@"address"];
        uint64_t v8 = +[MIDINetworkHost fromAddressAsText:v7 withName:v6];

        if (*(unsigned char *)this && (!v6 || ![v6 length]))
        {
          uint64_t v9 = [v8 displayName];

          uint64_t v6 = (void *)v9;
          [v8 setName:v9];
        }
        if (v8)
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v10 = v19;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v23;
            while (2)
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v23 != v12) {
                  objc_enumerationMutation(v10);
                }
                int v14 = *(void **)(*((void *)&v22 + 1) + 8 * j);
                v15 = [v14 host];
                if ([v15 hasSameAddressAs:v8])
                {
                  [this[1] addObject:v14];
                  [v10 removeObject:v14];
                  [v15 setName:v6];

                  goto LABEL_24;
                }
              }
              uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }

          if (*(unsigned char *)this)
          {
            id v16 = +[MIDINetworkConnection connectionWithHost:v8];
          }
          else
          {
            id v16 = v8;
          }
          id v10 = v16;
          [this[1] addObject:v16];
LABEL_24:
        }
      }
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v3);
  }
}

void sub_1DD6828C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1DD682A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD682AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD682DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD682F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD683078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD6831FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD6832D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD6833B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD68346C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD683584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<+[MIDINetworkSession defaultSession]::$_0 &&>>()
{
}

void sub_1DD683798(_Unwind_Exception *a1)
{
  CADeprecated::CAMutex::~CAMutex((CADeprecated::CAMutex *)v1);
  MEMORY[0x1E01BB8C0](v1, 0x10F0C40D81B7B60);
  _Unwind_Resume(a1);
}

void MNSGlobalState::LoadContacts(MNSGlobalState *this)
{
  CFDictionaryRef outDict = 0;
  OSStatus DictionaryProperty = MIDIObjectGetDictionaryProperty(*((_DWORD *)this + 23), @"apple.midirtp.addressbook", &outDict);
  CFDictionaryRef v3 = outDict;
  if (DictionaryProperty) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = outDict == 0;
  }
  if (!v4)
  {
    id v5 = [(__CFDictionary *)outDict objectForKey:@"entries"];
    ContactOrConnectionSet::UpdateFromDriver((id *)this + 13, v5);
  }
}

void sub_1DD68387C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MNSGlobalState::CoreMIDINotifyCallback(MNSGlobalState *this, const MIDINotification *a2, void *a3)
{
  if (*(_DWORD *)this == 4)
  {
    int v4 = *((_DWORD *)this + 3);
    if (v4)
    {
      if (v4 != 1) {
        return;
      }
      uint64_t v9 = globals;
      char v10 = (*(uint64_t (**)(uint64_t, const MIDINotification *, void *))(*(void *)globals + 16))(globals, a2, a3);
      id v5 = *(void **)(globals + 96);
      if (v5) {
        [v5 sessionChanged];
      }
    }
    else
    {
      int v6 = *((_DWORD *)this + 2);
      uint64_t v9 = globals;
      char v10 = (*(uint64_t (**)(uint64_t, const MIDINotification *, void *))(*(void *)globals + 16))(globals, a2, a3);
      if (*(_DWORD *)(globals + 92) == v6)
      {
        id v7 = *((id *)this + 2);
        if ([v7 isEqualToString:@"apple.midirtp.addressbook"]) {
          MNSGlobalState::LoadContacts((MNSGlobalState *)globals);
        }
        uint64_t v8 = *(void **)(globals + 96);
        if (v8) {
          [v8 contactsChanged];
        }
      }
    }
    CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v9);
  }
}

void sub_1DD6839B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void MNSGlobalState::AppResumed(MNSGlobalState *this, id *a2, void *a3, const __CFString *a4, const void *a5, const __CFDictionary *a6)
{
  if (globals)
  {
    uint64_t v8 = globals;
    char v9 = (*(uint64_t (**)(uint64_t, id *, void *, const __CFString *, const void *, const __CFDictionary *))(*(void *)globals + 16))(globals, a2, a3, a4, a5, a6);
    MNSGlobalState::LoadContacts((MNSGlobalState *)a2);
    id v7 = a2[12];
    if (v7)
    {
      [v7 sessionChanged];
      [a2[12] contactsChanged];
    }
  }
  else
  {
    uint64_t v8 = 0;
    char v9 = 0;
  }
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v8);
}

void sub_1DD683A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void ClientNotification::serialize(UInt8 *bytes, CFMutableDataRef theData)
{
  CFDataAppendBytes(theData, bytes, *((unsigned int *)bytes + 1));
  if ((*(_DWORD *)bytes - 4096) >= 3)
  {
    if (*(_DWORD *)bytes == 4)
    {
      *(_DWORD *)bytesa = 2 * CFStringGetLength(*((CFStringRef *)bytes + 2));
      operator new[]();
    }
  }
  else
  {
    uint64_t v4 = *((void *)bytes + 2);
    *(void *)bytesa = 0;
    id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:0 error:bytesa];
    *(_DWORD *)bytesa = [v5 length];
    CFDataAppendBytes(theData, bytesa, 4);
    id v6 = v5;
    id v7 = (const UInt8 *)[v6 bytes];
    CFDataAppendBytes(theData, v7, *(unsigned int *)bytesa);
  }
}

void sub_1DD683BBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MIDIServerXPC_Client::dispatch_message(MIDIServerXPC_Client *this@<X0>, xpc_object_t *a2@<X1>, swix::message *a3@<X8>)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  swix::message::message(a3);
  if (*(_DWORD *)a2 == 220460584)
  {
    xpc_object_t v5 = xpc_null_create();
    swix::xpcobj_coder<swix::data>::decode(&block, a2[1], "data");
    xpc_object_t v6 = block;
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t block = v7;
    xpc_release(v5);
    xpc_release(v7);
    uint64_t v8 = *((void *)this + 2);
    if (!(*(unsigned int (**)(uint64_t))(*(void *)v8 + 56))(v8))
    {
      bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(v6);
      size_t length = xpc_data_get_length(v6);
      uint64_t v11 = *(__CFRunLoop **)(v8 + 440);
      if (v11 && v11 != CFRunLoopGetCurrent())
      {
        CFDataRef v12 = CFDataCreate(0, bytes_ptr, length);
        if (!v12)
        {
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1E01BB530](exception, "Could not construct");
        }
        applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)cf, v12);
        long long v13 = *(__CFRunLoop **)(v8 + 440);
        xpc_object_t block = (xpc_object_t)MEMORY[0x1E4F143A8];
        uint64_t v37 = 1174405120;
        v38 = ___ZN14MIDIProcessXPC14DispatchNotifyEPKvm_block_invoke;
        v39 = &__block_descriptor_tmp_1896;
        uint64_t v40 = v8;
        CFTypeRef v14 = cf[0];
        if (cf[0]) {
          CFRetain(cf[0]);
        }
        v15 = (const void *)*MEMORY[0x1E4F1D410];
        CFTypeRef v41 = v14;
        CFRunLoopPerformBlock(v13, v15, &block);
        CFRunLoopWakeUp(*(CFRunLoopRef *)(v8 + 440));
        if (v41) {
          CFRelease(v41);
        }
        if (cf[0]) {
          CFRelease(cf[0]);
        }
        goto LABEL_13;
      }
      if (!MIDIProcess::Notify((MIDIProcess *)v8, (const UniChar *)bytes_ptr, length))
      {
LABEL_13:
        uint64_t v16 = *(void *)(v8 + 432);
        v35[0] = &unk_1F38D3CB8;
        v35[3] = v35;
        swix::encode_message::encode_message((swix::encode_message *)v26, 220460585);
        uint64_t v17 = *(void *)(v16 + 8);
        if (!v17) {
          std::terminate();
        }
        xpc_object_t block = (xpc_object_t)MEMORY[0x1E4F143A8];
        uint64_t v37 = 1174405120;
        v38 = ___ZN20MIDIServerXPC_Client23acknowledgeNotificationENSt3__18functionIFvN4swix6resultIJEEEEEE_block_invoke;
        v39 = &__block_descriptor_tmp_3527;
        _ZNSt3__110__function12__value_funcIFvN4swix6resultIJEEEEEC2B8ne180100ERKS6_((uint64_t)&v40, (uint64_t)v35);
        swix::connection::xpc_connection((swix::connection *)&connection, v17);
        swix::encode_message::xpc_message((swix::encode_message *)&message, (uint64_t)v26);
        uint64_t v18 = *(void *)(v17 + 8);
        if (*(unsigned char *)(v18 + 88))
        {
          uint64_t v19 = *(NSObject **)(v18 + 80);
          BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
          xpc_object_t v21 = message;
          if (v20)
          {
            xpc_connection_t v22 = connection;
            long long v23 = (char *)MEMORY[0x1E01BC680](message);
            std::string::basic_string[abi:ne180100]<0>(cf, v23);
            free(v23);
            if (SHIBYTE(v29) >= 0) {
              long long v24 = cf;
            }
            else {
              long long v24 = (CFTypeRef *)cf[0];
            }
            *(_DWORD *)buf = 134218242;
            xpc_connection_t v43 = v22;
            __int16 v44 = 2080;
            v45 = v24;
            _os_log_impl(&dword_1DD5F4000, v19, OS_LOG_TYPE_DEFAULT, "%p send msg %s", buf, 0x16u);
            if (SHIBYTE(v29) < 0) {
              operator delete((void *)cf[0]);
            }
          }
        }
        else
        {
          xpc_object_t v21 = message;
        }
        cf[0] = (CFTypeRef)MEMORY[0x1E4F143A8];
        cf[1] = (CFTypeRef)0x40000000;
        long long v29 = ___ZN4swix10connection21send_with_async_replyERKNS_14encode_messageEU13block_pointerFvPvE_block_invoke;
        long long v30 = &unk_1E6CD2E00;
        p_xpc_object_t block = &block;
        uint64_t v32 = v17;
        xpc_connection_send_message_with_reply(connection, v21, 0, cf);
        xpc_release(v21);
        xpc_release(connection);
        _ZNSt3__110__function12__value_funcIFvN4swix6resultIJEEEEED2B8ne180100Ev(&v40);
        xpc_release(object);
        _ZNSt3__110__function12__value_funcIFvN4swix6resultIJEEEEED2B8ne180100Ev(v35);
      }
    }
    xpc_release(v6);
  }
}

void sub_1DD683FFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, xpc_object_t object,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  if (a2)
  {
    __cxa_free_exception(v24);
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

swix::message *swix::message::message(swix::message *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = xpc_null_create();
  *((void *)this + 2) = 0;
  return this;
}

void swix::xpcobj_coder<swix::data>::decode(xpc_object_t *a1, xpc_object_t xdict, char *key)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, key);
  if (value)
  {
    xpc_object_t v5 = value;
    xpc_retain(value);
    *a1 = v5;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a1 = v5;
    if (!v5) {
      goto LABEL_5;
    }
  }
  if (MEMORY[0x1E01BC790](v5) == MEMORY[0x1E4F14580])
  {
    xpc_retain(v5);
    goto LABEL_7;
  }
LABEL_5:
  *a1 = xpc_null_create();
LABEL_7:
  xpc_release(v5);
}

void swix::encode_message::~encode_message(xpc_object_t *this)
{
  this[1] = 0;
}

void MIDIServerXPC_Client::~MIDIServerXPC_Client(MIDIServerXPC_Client *this)
{
  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_1F38D3AA8;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  JUMPOUT(0x1E01BB8C0);
}

{
  uint64_t v2;

  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_1F38D3AA8;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
}

void MIDIServerXPC_Server::dispatch_message(MIDIServerXPC_Server **this@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X8>)
{
  v137[4] = *MEMORY[0x1E4F143B8];
  xpc_object_t v6 = swix::message::message((swix::message *)a3);
  switch(*(_DWORD *)a2)
  {
    case 0xD23F624:
      int Server = MIDIServerXPC_Server::queryServer(v6);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_dictionary_set_int64(a3[1], ".error", 0);
      xpc_dictionary_set_int64(a3[1], "process", Server);
      return;
    case 0xD23F625:
      xpc_object_t v8 = xpc_null_create();
      xpc_object_t v133 = v8;
      LOBYTE(xstring[0]) = 0;
      swix::xpcobj_coder<applesauce::xpc::object>::decode(&v136, a2[1]);
      char v9 = v136;
      xpc_object_t v133 = v136;
      xpc_release(v8);
      v136 = 0;
      BOOL v10 = xpc_dictionary_get_BOOL(a2[1], "isIntel");
      LOBYTE(xstring[0]) = v10;
      MIDIServerXPC_Server::registerProcess((uint64_t)this, (uint64_t)&v133, v10);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_dictionary_set_int64(a3[1], ".error", 0);
      xpc_release(v9);
      return;
    case 0xD23F626:
      xpc_object_t v133 = xpc_null_create();
      swix::xpcobj_coder<swix::string>::decode(&v126, a2[1], "name");
      swix::string::operator=(&v133, &v126);
      xpc_release(v126);
      unint64_t v11 = MIDIServerXPC_Server::createClient(this[1], &v133);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if (v11 >= 0x100000000) {
        int v12 = 0;
      }
      else {
        int v12 = v11;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v12);
      if (!v12) {
        xpc_dictionary_set_uint64(a3[1], "client", v11);
      }
      goto LABEL_217;
    case 0xD23F627:
      long long v13 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "client");
      unint64_t v14 = MIDIServerXPC_Server::disposeClient(v13);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v15 = a3[1];
      if ((v14 & 0xFF00000000) != 0) {
        int64_t v16 = 0;
      }
      else {
        int64_t v16 = (int)v14;
      }
      goto LABEL_210;
    case 0xD23F629:
      swix::decode_message::decode_message((swix::decode_message *)v135, (const swix::decode_message *)a2);
      uint64_t v17 = this[1];
      if (!v17) {
        std::terminate();
      }
      v135[4] = (uint64_t)&unk_1F38D3A58;
      v135[5] = *((void *)v17 + 1);
      uint64_t v18 = *((void *)v17 + 2);
      v135[6] = v18;
      if (v18) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v18 + 8), 1uLL, memory_order_relaxed);
      }
      _ZNSt3__18functionIFvN4swix6resultIJEEEEEC1IZN20MIDIServerXPC_Server16dispatch_messageERKNS1_14decode_messageEE3__0vEET_((uint64_t)v137, v135);
      MIDIServerXPC_Server::acknowledgeNotification((uint64_t)this[1], (uint64_t)v137);
      _ZNSt3__110__function12__value_funcIFvN4swix6resultIJEEEEED2B8ne180100Ev(v137);
      MIDIServerXPC_Server::dispatch_message(swix::decode_message const&)::$_0::~$_0((uint64_t)v135);
      return;
    case 0xD23F62A:
      LODWORD(v126) = 0;
      xpc_object_t object = xpc_null_create();
      LODWORD(v128) = 0;
      LODWORD(v126) = swix::coder<unsigned int>::decode(a2[1], "client");
      swix::xpcobj_coder<swix::string>::decode(&v133, a2[1], "name");
      swix::string::operator=(&object, &v133);
      xpc_release(v133);
      uint64_t v19 = (const swix::string *)swix::coder<int>::decode(a2[1], "proto");
      LODWORD(v128) = v19;
      unint64_t Source = MIDIServerXPC_Server::createSource((MIDIServerXPC_Server *)v126, object, v19);
      swix::encode_message::encode_message((swix::encode_message *)&v133, a2);
      swix::encode_message::operator=(a3, &v133);
      xpc_release(xstring[0]);
      if ((Source & 0xFF00000000) != 0) {
        int v21 = 0;
      }
      else {
        int v21 = Source;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v21);
      if (!v21) {
        xpc_dictionary_set_uint64(a3[1], "sourceRef", Source);
      }
      goto LABEL_129;
    case 0xD23F62B:
      LODWORD(v126) = 0;
      xpc_object_t object = xpc_null_create();
      LODWORD(v128) = 0;
      LODWORD(v126) = swix::coder<unsigned int>::decode(a2[1], "client");
      swix::xpcobj_coder<swix::string>::decode(&v133, a2[1], "name");
      swix::string::operator=(&object, &v133);
      xpc_release(v133);
      xpc_connection_t v22 = (const swix::string *)swix::coder<int>::decode(a2[1], "proto");
      LODWORD(v128) = v22;
      unint64_t Destination = MIDIServerXPC_Server::createDestination((MIDIServerXPC_Server *)v126, object, v22);
      swix::encode_message::encode_message((swix::encode_message *)&v133, a2);
      swix::encode_message::operator=(a3, &v133);
      xpc_release(xstring[0]);
      if ((Destination & 0xFF00000000) != 0) {
        int v24 = 0;
      }
      else {
        int v24 = Destination;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v24);
      if (!v24) {
        xpc_dictionary_set_uint64(a3[1], "destination", Destination);
      }
      goto LABEL_129;
    case 0xD23F62C:
      long long v25 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "endpointRef");
      unint64_t v26 = MIDIServerXPC_Server::disposeEndpoint(v25);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v15 = a3[1];
      if ((v26 & 0xFF00000000) != 0) {
        int64_t v16 = 0;
      }
      else {
        int64_t v16 = (int)v26;
      }
      goto LABEL_210;
    case 0xD23F62D:
      LODWORD(v126) = 0;
      xpc_object_t object = xpc_null_create();
      LODWORD(v128) = 0;
      LODWORD(v126) = swix::coder<unsigned int>::decode(a2[1], "client");
      swix::xpcobj_coder<swix::string>::decode(&v133, a2[1], "name");
      swix::string::operator=(&object, &v133);
      xpc_release(v133);
      long long v27 = (const swix::string *)swix::coder<int>::decode(a2[1], "proto");
      LODWORD(v128) = v27;
      unint64_t InputPort = MIDIServerXPC_Server::createInputPort((MIDIServerXPC_Server *)v126, object, v27);
      swix::encode_message::encode_message((swix::encode_message *)&v133, a2);
      swix::encode_message::operator=(a3, &v133);
      xpc_release(xstring[0]);
      if ((InputPort & 0xFF00000000) != 0) {
        int v29 = 0;
      }
      else {
        int v29 = InputPort;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v29);
      if (!v29) {
        xpc_dictionary_set_uint64(a3[1], "portRef", InputPort);
      }
      goto LABEL_129;
    case 0xD23F62E:
      LODWORD(v133) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v133) = swix::coder<unsigned int>::decode(a2[1], "client");
      swix::xpcobj_coder<swix::string>::decode(&v126, a2[1], "name");
      swix::string::operator=(xstring, &v126);
      xpc_release(v126);
      unint64_t OutputPort = MIDIServerXPC_Server::createOutputPort((MIDIServerXPC_Server *)v133, xstring[0], v30);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if ((OutputPort & 0xFF00000000) != 0) {
        int v32 = 0;
      }
      else {
        int v32 = OutputPort;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v32);
      if (!v32) {
        xpc_dictionary_set_uint64(a3[1], "portRef", OutputPort);
      }
      goto LABEL_199;
    case 0xD23F62F:
      __int16 v33 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "portRef");
      unint64_t v34 = MIDIServerXPC_Server::disposePort(v33);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v15 = a3[1];
      if ((v34 & 0xFF00000000) != 0) {
        int64_t v16 = 0;
      }
      else {
        int64_t v16 = (int)v34;
      }
      goto LABEL_210;
    case 0xD23F630:
      uint64_t v35 = (MIDIServer *)swix::coder<unsigned int>::decode(a2[1], "port");
      int v36 = swix::coder<unsigned int>::decode(a2[1], "source");
      uint64_t v37 = (uint64_t (**)())swix::coder<IPCPtr>::decode(a2[1]);
      unint64_t v38 = MIDIServerXPC_Server::portConnectSource(v35, v36, v37);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v15 = a3[1];
      if ((v38 & 0xFF00000000) != 0) {
        int64_t v16 = 0;
      }
      else {
        int64_t v16 = (int)v38;
      }
      goto LABEL_210;
    case 0xD23F631:
      v39 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "port");
      int v40 = swix::coder<unsigned int>::decode(a2[1], "source");
      unint64_t v41 = MIDIServerXPC_Server::portDisconnectSource(v39, v40);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v15 = a3[1];
      if ((v41 & 0xFF00000000) != 0) {
        int64_t v16 = 0;
      }
      else {
        int64_t v16 = (int)v41;
      }
      goto LABEL_210;
    case 0xD23F632:
      LODWORD(v126) = 0;
      xpc_object_t object = xpc_null_create();
      LODWORD(v128) = 0;
      LODWORD(v126) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v133, a2[1], "propertyID");
      swix::string::operator=(&object, &v133);
      xpc_release(v133);
      v42 = (const swix::string *)swix::coder<int>::decode(a2[1], "value");
      LODWORD(v128) = v42;
      unint64_t v43 = MIDIServerXPC_Server::objectSetIntegerProperty((MIDIServerXPC_Server *)v126, object, v42);
      swix::encode_message::encode_message((swix::encode_message *)&v133, a2);
      swix::encode_message::operator=(a3, &v133);
      xpc_release(xstring[0]);
      if ((v43 & 0xFF00000000) != 0) {
        int64_t v44 = 0;
      }
      else {
        int64_t v44 = (int)v43;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v44);
      xpc_release(object);
      return;
    case 0xD23F633:
      LODWORD(v133) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v133) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v126, a2[1], "propertyID");
      swix::string::operator=(xstring, &v126);
      xpc_release(v126);
      unint64_t IntegerProperty = MIDIServerXPC_Server::objectGetIntegerProperty((MIDIServerXPC_Server *)v133, xstring[0], v45);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if ((IntegerProperty & 0xFF00000000) != 0) {
        int v47 = 0;
      }
      else {
        int v47 = IntegerProperty;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v47);
      if (!v47) {
        xpc_dictionary_set_int64(a3[1], "value", (int)IntegerProperty);
      }
      goto LABEL_199;
    case 0xD23F634:
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,unsigned int,swix::string,swix::string>::__tuple_impl[abi:ne180100]((uint64_t)&v126);
      LODWORD(v126) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v133, a2[1], "propertyID");
      swix::string::operator=(&object, &v133);
      xpc_release(v133);
      swix::xpcobj_coder<swix::string>::decode(&v133, a2[1], "value");
      swix::string::operator=((void **)&v128, &v133);
      xpc_release(v133);
      unint64_t v49 = MIDIServerXPC_Server::objectSetStringProperty((MIDIServerXPC_Server *)v126, object, (xpc_object_t *)&v128, v48);
      swix::encode_message::encode_message((swix::encode_message *)&v133, a2);
      swix::encode_message::operator=(a3, &v133);
      xpc_release(xstring[0]);
      if ((v49 & 0xFF00000000) != 0) {
        int64_t v50 = 0;
      }
      else {
        int64_t v50 = (int)v49;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v50);
      std::tuple<unsigned int,swix::string,swix::string>::~tuple((uint64_t)&v126);
      return;
    case 0xD23F635:
      LODWORD(v133) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v133) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v126, a2[1], "propertyID");
      swix::string::operator=(xstring, &v126);
      xpc_release(v126);
      MIDIServerXPC_Server::objectGetStringProperty((MIDIServerXPC_Server *)&value, (MIDIServer *)v133, xstring[0]);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if (v132) {
        int v51 = 0;
      }
      else {
        int v51 = (int)value;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v51);
      if (!v51) {
        xpc_dictionary_set_value(a3[1], "value", value);
      }
      if (v132) {
        xpc_release(value);
      }
      goto LABEL_199;
    case 0xD23F636:
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,unsigned int,swix::string,swix::data>::__tuple_impl[abi:ne180100]((uint64_t)&v126);
      LODWORD(v126) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v133, a2[1], "propertyID");
      swix::string::operator=(&object, &v133);
      xpc_release(v133);
      swix::xpcobj_coder<swix::data>::decode(&v133, a2[1], "value");
      swix::data::operator=((void **)&v128, &v133);
      xpc_release(v133);
      unint64_t v53 = MIDIServerXPC_Server::objectSetDataProperty((MIDIServerXPC_Server *)v126, object, (xpc_object_t *)&v128, v52);
      swix::encode_message::encode_message((swix::encode_message *)&v133, a2);
      swix::encode_message::operator=(a3, &v133);
      xpc_release(xstring[0]);
      xpc_object_t v54 = a3[1];
      if ((v53 & 0xFF00000000) != 0) {
        int64_t v55 = 0;
      }
      else {
        int64_t v55 = (int)v53;
      }
      goto LABEL_89;
    case 0xD23F637:
      LODWORD(v133) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v133) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v126, a2[1], "propertyID");
      swix::string::operator=(xstring, &v126);
      xpc_release(v126);
      MIDIServerXPC_Server::objectGetDataProperty((MIDIServerXPC_Server *)&value, (MIDIServer *)v133, xstring[0]);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if (v132) {
        int v56 = 0;
      }
      else {
        int v56 = (int)value;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v56);
      if (!v56) {
        xpc_dictionary_set_value(a3[1], "value", value);
      }
      if (v132) {
        xpc_release(value);
      }
      goto LABEL_199;
    case 0xD23F638:
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,unsigned int,swix::string,swix::data>::__tuple_impl[abi:ne180100]((uint64_t)&v126);
      LODWORD(v126) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v133, a2[1], "propertyID");
      swix::string::operator=(&object, &v133);
      xpc_release(v133);
      swix::xpcobj_coder<swix::data>::decode(&v133, a2[1], "value");
      swix::data::operator=((void **)&v128, &v133);
      xpc_release(v133);
      unint64_t v58 = MIDIServerXPC_Server::objectSetDictionaryProperty((MIDIServerXPC_Server *)v126, object, (xpc_object_t *)&v128, v57);
      swix::encode_message::encode_message((swix::encode_message *)&v133, a2);
      swix::encode_message::operator=(a3, &v133);
      xpc_release(xstring[0]);
      xpc_object_t v54 = a3[1];
      if ((v58 & 0xFF00000000) != 0) {
        int64_t v55 = 0;
      }
      else {
        int64_t v55 = (int)v58;
      }
LABEL_89:
      xpc_dictionary_set_int64(v54, ".error", v55);
      std::tuple<unsigned int,swix::string,swix::data>::~tuple((uint64_t)&v126);
      return;
    case 0xD23F639:
      LODWORD(v133) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v133) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v126, a2[1], "propertyID");
      swix::string::operator=(xstring, &v126);
      xpc_release(v126);
      MIDIServerXPC_Server::objectGetDictionaryProperty((MIDIServerXPC_Server *)&value, (MIDIServer *)v133, xstring[0]);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if (v132) {
        int v59 = 0;
      }
      else {
        int v59 = (int)value;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v59);
      if (!v59) {
        xpc_dictionary_set_value(a3[1], "value", value);
      }
      if (v132) {
        xpc_release(value);
      }
      goto LABEL_199;
    case 0xD23F63A:
      LODWORD(v133) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v133) = swix::coder<unsigned int>::decode(a2[1], "object");
      swix::xpcobj_coder<swix::string>::decode(&v126, a2[1], "propertyID");
      swix::string::operator=(xstring, &v126);
      xpc_release(v126);
      unint64_t v61 = MIDIServerXPC_Server::objectRemoveProperty((MIDIServerXPC_Server *)v133, xstring[0], v60);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v62 = a3[1];
      if ((v61 & 0xFF00000000) != 0) {
        int64_t v63 = 0;
      }
      else {
        int64_t v63 = (int)v61;
      }
      goto LABEL_206;
    case 0xD23F63B:
      unsigned int DiscoveryMUID = MIDIServerXPC_Server::capabilityGetDiscoveryMUID(v6);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_dictionary_set_int64(a3[1], ".error", 0);
      xpc_dictionary_set_uint64(a3[1], "muid", DiscoveryMUID);
      return;
    case 0xD23F63C:
      v65 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "muid");
      char v66 = MIDIServerXPC_Server::capabilityMUIDCollides(v65);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_dictionary_set_int64(a3[1], ".error", 0);
      xpc_dictionary_set_BOOL(a3[1], "collides", v66 != 0);
      return;
    case 0xD23F63D:
      MIDIServerXPC_Server::createSetup(v6);
    case 0xD23F63E:
      xpc_object_t v133 = xpc_null_create();
      swix::xpcobj_coder<swix::data>::decode(&v126, a2[1], "data");
      swix::data::operator=(&v133, &v126);
      xpc_release(v126);
      unint64_t v68 = MIDIServerXPC_Server::createSetupFromData(&v133, v67);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if ((v68 & 0xFF00000000) != 0) {
        int v69 = 0;
      }
      else {
        int v69 = v68;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v69);
      if (!v69) {
        xpc_dictionary_set_uint64(a3[1], "setup", v68);
      }
      goto LABEL_217;
    case 0xD23F63F:
      v70 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "setup");
      unint64_t v71 = MIDIServerXPC_Server::installSetup(v70);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v15 = a3[1];
      if ((v71 & 0xFF00000000) != 0) {
        int64_t v16 = 0;
      }
      else {
        int64_t v16 = (int)v71;
      }
      goto LABEL_210;
    case 0xD23F640:
      unint64_t CurrentSetup = MIDIServerXPC_Server::getCurrentSetup(v6);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if ((CurrentSetup & 0xFF00000000) != 0) {
        int v73 = 0;
      }
      else {
        int v73 = CurrentSetup;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v73);
      if (!v73) {
        xpc_dictionary_set_uint64(a3[1], "setup", CurrentSetup);
      }
      return;
    case 0xD23F641:
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,swix::string,swix::string,swix::string>::__tuple_impl[abi:ne180100](&v126);
      swix::xpcobj_coder<swix::string>::decode(&v133, a2[1], "name");
      swix::string::operator=(&v126, &v133);
      xpc_release(v133);
      swix::xpcobj_coder<swix::string>::decode(&v133, a2[1], "manufacturer");
      swix::string::operator=(&object, &v133);
      xpc_release(v133);
      swix::xpcobj_coder<swix::string>::decode(&v133, a2[1], "model");
      swix::string::operator=((void **)&v128, &v133);
      xpc_release(v133);
      unint64_t v75 = MIDIServerXPC_Server::createExternalDevice((MIDIServerXPC_Server *)v126, &object, (xpc_object_t *)&v128, v74);
      swix::encode_message::encode_message((swix::encode_message *)&v133, a2);
      swix::encode_message::operator=(a3, &v133);
      xpc_release(xstring[0]);
      if ((v75 & 0xFF00000000) != 0) {
        int v76 = 0;
      }
      else {
        int v76 = v75;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v76);
      if (!v76) {
        xpc_dictionary_set_uint64(a3[1], "device", v75);
      }
      std::tuple<swix::string,swix::string,swix::string>::~tuple(&v126);
      return;
    case 0xD23F642:
      LODWORD(v126) = 0;
      xpc_object_t object = xpc_null_create();
      LODWORD(v128) = 0;
      BYTE4(v128) = 0;
      *(void *)v129 = 0;
      uint64_t uint64 = 0;
      LODWORD(v126) = swix::coder<unsigned int>::decode(a2[1], "device");
      swix::xpcobj_coder<swix::string>::decode(&v133, a2[1], "name");
      swix::string::operator=(&object, &v133);
      xpc_release(v133);
      LODWORD(v128) = swix::coder<int>::decode(a2[1], "proto");
      BYTE4(v128) = xpc_dictionary_get_BOOL(a2[1], "embedded");
      *(void *)v129 = xpc_dictionary_get_uint64(a2[1], "numSourceEndpoints");
      uint64_t uint64 = xpc_dictionary_get_uint64(a2[1], "numDestinationEndpoints");
      unint64_t v77 = MIDIServerXPC_Server::deviceAddEntity((MIDIServerXPC_Server *)v126, object, (const swix::string *)v128, BYTE4(v128), *(uint64_t *)v129, uint64);
      swix::encode_message::encode_message((swix::encode_message *)&v133, a2);
      swix::encode_message::operator=(a3, &v133);
      xpc_release(xstring[0]);
      if ((v77 & 0xFF00000000) != 0) {
        int v78 = 0;
      }
      else {
        int v78 = v77;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v78);
      if (!v78) {
        xpc_dictionary_set_uint64(a3[1], "entity", v77);
      }
LABEL_129:
      xpc_release(object);
      return;
    case 0xD23F643:
      v79 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "device");
      int v80 = swix::coder<unsigned int>::decode(a2[1], "entity");
      unint64_t v81 = MIDIServerXPC_Server::deviceRemoveEntity(v79, v80);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v15 = a3[1];
      if ((v81 & 0xFF00000000) != 0) {
        int64_t v16 = 0;
      }
      else {
        int64_t v16 = (int)v81;
      }
      goto LABEL_210;
    case 0xD23F644:
      v82 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "entity");
      uint64_t v83 = xpc_dictionary_get_uint64(a2[1], "numSourceEndpoints");
      uint64_t v84 = xpc_dictionary_get_uint64(a2[1], "numDestinationEndpoints");
      unint64_t v85 = MIDIServerXPC_Server::entityAddOrRemoveEndpoints(v82, v83, v84);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v15 = a3[1];
      if ((v85 & 0xFF00000000) != 0) {
        int64_t v16 = 0;
      }
      else {
        int64_t v16 = (int)v85;
      }
      goto LABEL_210;
    case 0xD23F645:
      v86 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "device");
      BOOL v87 = xpc_dictionary_get_BOOL(a2[1], "external");
      unint64_t v88 = MIDIServerXPC_Server::setupAddDevice(v86, v87);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v15 = a3[1];
      if ((v88 & 0xFF00000000) != 0) {
        int64_t v16 = 0;
      }
      else {
        int64_t v16 = (int)v88;
      }
      goto LABEL_210;
    case 0xD23F646:
      v89 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "device");
      BOOL v90 = xpc_dictionary_get_BOOL(a2[1], "external");
      unint64_t v91 = MIDIServerXPC_Server::setupRemoveDevice(v89, v90);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v15 = a3[1];
      if ((v91 & 0xFF00000000) != 0) {
        int64_t v16 = 0;
      }
      else {
        int64_t v16 = (int)v91;
      }
      goto LABEL_210;
    case 0xD23F647:
      unint64_t v92 = MIDIServerXPC_Server::midiRestart(v6);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v15 = a3[1];
      if ((v92 & 0xFF00000000) != 0) {
        int64_t v16 = 0;
      }
      else {
        int64_t v16 = (int)v92;
      }
      goto LABEL_210;
    case 0xD23F648:
      v93 = (MIDIServer *)swix::coder<unsigned int>::decode(a2[1], "object");
      BOOL v94 = xpc_dictionary_get_BOOL(a2[1], "deep");
      MIDIServerXPC_Server::objectGetProperties((MIDIServerXPC_Server *)&v133, v93, v94);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if (LOBYTE(xstring[0])) {
        int v95 = 0;
      }
      else {
        int v95 = (int)v133;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v95);
      if (!v95) {
        xpc_dictionary_set_value(a3[1], "properties", v133);
      }
      if (LOBYTE(xstring[0])) {
        goto LABEL_217;
      }
      return;
    case 0xD23F649:
      v96 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "destination");
      unint64_t v97 = MIDIServerXPC_Server::flushOutput(v96);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v15 = a3[1];
      if ((v97 & 0xFF00000000) != 0) {
        int64_t v16 = 0;
      }
      else {
        int64_t v16 = (int)v97;
      }
      goto LABEL_210;
    case 0xD23F64A:
      std::__tuple_impl<std::__tuple_indices<0ul,1ul>,swix::string,swix::data>::__tuple_impl[abi:ne180100](&v133);
      swix::xpcobj_coder<swix::string>::decode(&v126, a2[1], "persistentOwnerID");
      swix::string::operator=(&v133, &v126);
      xpc_release(v126);
      swix::xpcobj_coder<swix::data>::decode(&v126, a2[1], "connectionParams");
      swix::data::operator=(xstring, &v126);
      xpc_release(v126);
      unint64_t v98 = MIDIServerXPC_Server::createThruConnection(this[1], &v133, xstring);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if (v98 >= 0x100000000) {
        int v99 = 0;
      }
      else {
        int v99 = v98;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v99);
      if (!v99) {
        xpc_dictionary_set_uint64(a3[1], "conn", v98);
      }
      std::tuple<swix::string,swix::data>::~tuple(&v133);
      return;
    case 0xD23F64B:
      v100 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "conn");
      unint64_t v101 = MIDIServerXPC_Server::disposeThruConnection(v100);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v15 = a3[1];
      if ((v101 & 0xFF00000000) != 0) {
        int64_t v16 = 0;
      }
      else {
        int64_t v16 = (int)v101;
      }
      goto LABEL_210;
    case 0xD23F64C:
      v102 = (MIDIServer *)swix::coder<unsigned int>::decode(a2[1], "conn");
      MIDIServerXPC_Server::thruConnectionGetParams((MIDIServerXPC_Server *)&v133, v102);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if (LOBYTE(xstring[0])) {
        int v103 = 0;
      }
      else {
        int v103 = (int)v133;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v103);
      if (!v103) {
        xpc_dictionary_set_value(a3[1], "params", v133);
      }
      if (LOBYTE(xstring[0])) {
        goto LABEL_217;
      }
      return;
    case 0xD23F64D:
      LODWORD(v133) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v133) = swix::coder<unsigned int>::decode(a2[1], "conn");
      swix::xpcobj_coder<swix::data>::decode(&v126, a2[1], "connectionParams");
      swix::data::operator=(xstring, &v126);
      xpc_release(v126);
      unint64_t v105 = MIDIServerXPC_Server::thruConnectionSetParams((MIDIServerXPC_Server *)v133, xstring, v104);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v62 = a3[1];
      if ((v105 & 0xFF00000000) != 0) {
        int64_t v63 = 0;
      }
      else {
        int64_t v63 = (int)v105;
      }
      goto LABEL_206;
    case 0xD23F64E:
      xpc_object_t value = xpc_null_create();
      swix::xpcobj_coder<swix::string>::decode(&v126, a2[1], "persistentOwnerID");
      swix::string::operator=(&value, &v126);
      xpc_release(v126);
      MIDIServerXPC_Server::thruConnectionFind((MIDIServerXPC_Server *)&v133, value);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if (LOBYTE(xstring[0])) {
        int v106 = 0;
      }
      else {
        int v106 = (int)v133;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v106);
      if (!v106) {
        xpc_dictionary_set_value(a3[1], "connectionList", v133);
      }
      if (LOBYTE(xstring[0])) {
        xpc_release(v133);
      }
      xpc_release(value);
      return;
    case 0xD23F64F:
      v107 = (MIDIServerXPC_Server *)swix::coder<int>::decode(a2[1], "uniqueID");
      int64_t v108 = MIDIServerXPC_Server::objectFindByUniqueID(v107);
      char v110 = v109;
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if (v110) {
        int v111 = 0;
      }
      else {
        int v111 = v108;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v111);
      if (!v111)
      {
        xpc_dictionary_set_uint64(a3[1], "object", v108);
        xpc_dictionary_set_int64(a3[1], "objectType", v108 >> 32);
      }
      return;
    case 0xD23F650:
      BOOL v112 = xpc_dictionary_get_BOOL(a2[1], "isBigEndian");
      MIDIServerXPC_Server::getObjectTree((MIDIServerXPC_Server *)&v133, v112);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if (LOBYTE(xstring[0])) {
        int v113 = 0;
      }
      else {
        int v113 = (int)v133;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v113);
      if (!v113) {
        xpc_dictionary_set_value(a3[1], "data", v133);
      }
      if (LOBYTE(xstring[0])) {
        goto LABEL_217;
      }
      return;
    case 0xD23F651:
      LODWORD(v133) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v133) = swix::coder<int>::decode(a2[1], "objectType");
      swix::xpcobj_coder<swix::data>::decode(&v126, a2[1], "description");
      swix::data::operator=(xstring, &v126);
      xpc_release(v126);
      unint64_t v114 = MIDIServerXPC_Server::umpciObjectCreate(this[1], (int)v133, xstring);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if (v114 >= 0x100000000) {
        int v115 = 0;
      }
      else {
        int v115 = v114;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v115);
      if (!v115) {
        xpc_dictionary_set_uint64(a3[1], "umpcioo", v114);
      }
LABEL_199:
      xpc_release(xstring[0]);
      return;
    case 0xD23F652:
      v116 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "umpcioo");
      unint64_t v117 = MIDIServerXPC_Server::umpciObjectDispose(v116);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v15 = a3[1];
      if ((v117 & 0xFF00000000) != 0) {
        int64_t v16 = 0;
      }
      else {
        int64_t v16 = (int)v117;
      }
      goto LABEL_210;
    case 0xD23F653:
      LODWORD(v133) = 0;
      xstring[0] = xpc_null_create();
      LODWORD(v133) = swix::coder<unsigned int>::decode(a2[1], "umpcioo");
      swix::xpcobj_coder<swix::data>::decode(&v126, a2[1], "description");
      swix::data::operator=(xstring, &v126);
      xpc_release(v126);
      unint64_t v119 = MIDIServerXPC_Server::umpciObjectSetDescription((MIDIServerXPC_Server *)v133, xstring, v118);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v62 = a3[1];
      if ((v119 & 0xFF00000000) != 0) {
        int64_t v63 = 0;
      }
      else {
        int64_t v63 = (int)v119;
      }
LABEL_206:
      xpc_dictionary_set_int64(v62, ".error", v63);
      xpc_release(xstring[0]);
      return;
    case 0xD23F654:
      v120 = (MIDIServerXPC_Server *)swix::coder<unsigned int>::decode(a2[1], "umpcioo");
      BOOL v121 = xpc_dictionary_get_BOOL(a2[1], "enableState");
      unint64_t v122 = MIDIServerXPC_Server::umpciObjectSetEnableState(v120, v121);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      xpc_object_t v15 = a3[1];
      if ((v122 & 0xFF00000000) != 0) {
        int64_t v16 = 0;
      }
      else {
        int64_t v16 = (int)v122;
      }
LABEL_210:
      xpc_dictionary_set_int64(v15, ".error", v16);
      break;
    case 0xD23F655:
      MIDIServerXPC_Server::umpciGlobalState((MIDIServerXPC_Server *)&v133);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if (LOBYTE(xstring[0])) {
        int v123 = 0;
      }
      else {
        int v123 = (int)v133;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v123);
      if (!v123) {
        xpc_dictionary_set_value(a3[1], "value", v133);
      }
      if (LOBYTE(xstring[0])) {
LABEL_217:
      }
        xpc_release(v133);
      break;
    case 0xD23F656:
      unint64_t v124 = MIDIServerXPC_Server::umpciDiscover(v6);
      swix::encode_message::encode_message((swix::encode_message *)&v126, a2);
      swix::encode_message::operator=(a3, &v126);
      xpc_release(object);
      if ((v124 & 0xFF00000000) != 0) {
        int64_t v125 = 0;
      }
      else {
        int64_t v125 = (int)v124;
      }
      xpc_dictionary_set_int64(a3[1], ".error", v125);
      break;
    default:
      return;
  }
}

void sub_1DD686130(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, xpc_object_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t a15, char a16, xpc_object_t object, xpc_object_t a18, uint64_t a19, char a20)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *swix::encode_message::operator=(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  a2[1] = xpc_null_create();
  xpc_object_t v5 = (void *)a1[1];
  a1[1] = v4;
  xpc_release(v5);
  a1[2] = a2[2];
  return a1;
}

xpc_object_t swix::xpcobj_coder<applesauce::xpc::object>::decode(void *a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "ioPort");
  *a1 = value;
  if (value) {
    return xpc_retain(value);
  }
  xpc_object_t result = xpc_null_create();
  *a1 = result;
  return result;
}

void swix::xpcobj_coder<swix::string>::decode(xpc_object_t *a1, xpc_object_t xdict, char *key)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, key);
  if (value)
  {
    xpc_object_t v5 = value;
    xpc_retain(value);
    *a1 = v5;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a1 = v5;
    if (!v5) {
      goto LABEL_5;
    }
  }
  if (MEMORY[0x1E01BC790](v5) == MEMORY[0x1E4F145F0])
  {
    xpc_retain(v5);
    goto LABEL_7;
  }
LABEL_5:
  *a1 = xpc_null_create();
LABEL_7:
  xpc_release(v5);
}

void **swix::string::operator=(void **a1, xpc_object_t *a2)
{
  xpc_object_t v3 = *a2;
  *a2 = xpc_null_create();
  uint64_t v4 = *a1;
  *a1 = v3;
  xpc_release(v4);
  return a1;
}

uint64_t swix::coder<unsigned int>::decode(void *a1, const char *a2)
{
  uint64_t result = xpc_dictionary_get_uint64(a1, a2);
  if (HIDWORD(result))
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = &unk_1F38D5380;
  }
  return result;
}

swix::decode_message *swix::decode_message::decode_message(swix::decode_message *this, const swix::decode_message *a2)
{
  *(void *)this = *(void *)a2;
  uint64_t v4 = (void *)*((void *)a2 + 1);
  *((void *)this + 1) = v4;
  if (v4) {
    xpc_retain(v4);
  }
  else {
    *((void *)this + 1) = xpc_null_create();
  }
  uint64_t v5 = *((void *)a2 + 3);
  *((void *)this + 2) = *((void *)a2 + 2);
  *((void *)this + 3) = v5;
  return this;
}

uint64_t _ZNSt3__18functionIFvN4swix6resultIJEEEEEC1IZN20MIDIServerXPC_Server16dispatch_messageERKNS1_14decode_messageEE3__0vEET_(uint64_t a1, uint64_t *a2)
{
  *(void *)(a1 + 24) = 0;
  uint64_t v4 = operator new(0x40uLL);
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  *uint64_t v4 = &unk_1F38D3D00;
  v4[1] = v5;
  v4[2] = v6;
  a2[1] = (uint64_t)xpc_null_create();
  uint64_t v7 = a2[3];
  v4[3] = a2[2];
  v4[4] = v7;
  v4[5] = &unk_1F38D3A58;
  *((_OWORD *)v4 + 3) = *(_OWORD *)(a2 + 5);
  a2[5] = 0;
  a2[6] = 0;
  *(void *)(a1 + 24) = v4;
  return a1;
}

uint64_t MIDIServerXPC_Server::dispatch_message(swix::decode_message const&)::$_0::~$_0(uint64_t a1)
{
  *(void *)(a1 + 32) = &unk_1F38D3A58;
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  xpc_release(*(xpc_object_t *)(a1 + 8));
  *(void *)(a1 + 8) = 0;
  return a1;
}

uint64_t swix::coder<IPCPtr>::decode(void *a1)
{
  size_t length = 0;
  data = xpc_dictionary_get_data(a1, "connRefCon", &length);
  uint64_t result = 0;
  if (length == 8 && data != 0) {
    return *(void *)data;
  }
  return result;
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,unsigned int,swix::string,swix::string>::__tuple_impl[abi:ne180100](uint64_t a1)
{
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 8) = xpc_null_create();
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 16) = xpc_null_create();
  return a1;
}

uint64_t std::tuple<unsigned int,swix::string,swix::string>::~tuple(uint64_t a1)
{
  *(void *)(a1 + 16) = 0;
  xpc_release(*(xpc_object_t *)(a1 + 8));
  *(void *)(a1 + 8) = 0;
  return a1;
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,unsigned int,swix::string,swix::data>::__tuple_impl[abi:ne180100](uint64_t a1)
{
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 8) = xpc_null_create();
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 16) = xpc_null_create();
  return a1;
}

void **swix::data::operator=(void **a1, xpc_object_t *a2)
{
  xpc_object_t v3 = *a2;
  *a2 = xpc_null_create();
  uint64_t v4 = *a1;
  *a1 = v3;
  xpc_release(v4);
  return a1;
}

uint64_t std::tuple<unsigned int,swix::string,swix::data>::~tuple(uint64_t a1)
{
  *(void *)(a1 + 16) = 0;
  xpc_release(*(xpc_object_t *)(a1 + 8));
  *(void *)(a1 + 8) = 0;
  return a1;
}

xpc_object_t *std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,swix::string,swix::string,swix::string>::__tuple_impl[abi:ne180100](xpc_object_t *a1)
{
  *a1 = 0;
  *a1 = xpc_null_create();
  a1[1] = 0;
  a1[1] = xpc_null_create();
  a1[2] = 0;
  a1[2] = xpc_null_create();
  return a1;
}

xpc_object_t *std::tuple<swix::string,swix::string,swix::string>::~tuple(xpc_object_t *a1)
{
  a1[2] = 0;
  xpc_release(a1[1]);
  a1[1] = 0;
  xpc_release(*a1);
  *a1 = 0;
  return a1;
}

xpc_object_t *std::__tuple_impl<std::__tuple_indices<0ul,1ul>,swix::string,swix::data>::__tuple_impl[abi:ne180100](xpc_object_t *a1)
{
  *a1 = 0;
  *a1 = xpc_null_create();
  a1[1] = 0;
  a1[1] = xpc_null_create();
  return a1;
}

xpc_object_t *std::tuple<swix::string,swix::data>::~tuple(xpc_object_t *a1)
{
  a1[1] = 0;
  xpc_release(*a1);
  *a1 = 0;
  return a1;
}

void _ZNSt3__110__function6__funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEEclEOSB_(uint64_t a1, int *a2)
{
  if (!*((unsigned char *)a2 + 4))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    int v5 = *a2;
    *(void *)exception = &unk_1F38D3B28;
    exception[2] = v5;
  }
  swix::encode_message::encode_message((swix::encode_message *)v6, (xpc_object_t *)(a1 + 8));
  swix::connection::send((swix::connection *)(a1 + 40), (const swix::encode_message *)v6);
  xpc_release(object);
}

void sub_1DD6870D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object)
{
}

void _ZNSt3__110__function6__funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEE18destroy_deallocateEv(void *a1)
{
  _ZNSt3__110__function12__alloc_funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEE7destroyB8ne180100Ev((uint64_t)a1 + 8);

  operator delete(a1);
}

void _ZNSt3__110__function12__alloc_funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEE7destroyB8ne180100Ev(uint64_t a1)
{
  *(void *)(a1 + 32) = &unk_1F38D3A58;
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  xpc_release(*(xpc_object_t *)(a1 + 8));
  *(void *)(a1 + 8) = 0;
}

void _ZNSt3__110__function6__funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEE7destroyEv(uint64_t a1)
{
}

void *_ZNKSt3__110__function6__funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEE7__cloneEPNS0_6__baseISC_EE(uint64_t a1, void *a2)
{
  *a2 = &unk_1F38D3D00;
  return std::__compressed_pair_elem<MIDIServerXPC_Server::dispatch_message(swix::decode_message const&)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<MIDIServerXPC_Server::dispatch_message(swix::decode_message const&)::$_0 const&,0ul>(a2 + 1, (void *)(a1 + 8));
}

void *std::__compressed_pair_elem<MIDIServerXPC_Server::dispatch_message(swix::decode_message const&)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<MIDIServerXPC_Server::dispatch_message(swix::decode_message const&)::$_0 const&,0ul>(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = (void *)a2[1];
  a1[1] = v4;
  if (v4) {
    xpc_retain(v4);
  }
  else {
    a1[1] = xpc_null_create();
  }
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v7 = a2[5];
  uint64_t v6 = a2[6];
  a1[4] = &unk_1F38D3A58;
  a1[5] = v7;
  a1[6] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

void *_ZNKSt3__110__function6__funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEE7__cloneEv(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 8);
  uint64_t v2 = operator new(0x40uLL);
  void *v2 = &unk_1F38D3D00;
  std::__compressed_pair_elem<MIDIServerXPC_Server::dispatch_message(swix::decode_message const&)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<MIDIServerXPC_Server::dispatch_message(swix::decode_message const&)::$_0 const&,0ul>(v2 + 1, v1);
  return v2;
}

void _ZNSt3__110__function6__funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEED0Ev(uint64_t a1)
{
  *(void *)a1 = &unk_1F38D3D00;
  *(void *)(a1 + 40) = &unk_1F38D3A58;
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 56);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  xpc_release(*(xpc_object_t *)(a1 + 16));
  *(void *)(a1 + 16) = 0;

  JUMPOUT(0x1E01BB8C0);
}

uint64_t _ZNSt3__110__function6__funcIZN20MIDIServerXPC_Server16dispatch_messageERKN4swix14decode_messageEE3__0NS_9allocatorIS7_EEFvNS3_6resultIJEEEEED1Ev(uint64_t a1)
{
  *(void *)a1 = &unk_1F38D3D00;
  *(void *)(a1 + 40) = &unk_1F38D3A58;
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 56);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  xpc_release(*(xpc_object_t *)(a1 + 16));
  *(void *)(a1 + 16) = 0;
  return a1;
}

void MIDIServerXPC_Server::~MIDIServerXPC_Server(MIDIServerXPC_Server *this)
{
  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_1F38D3AA8;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  JUMPOUT(0x1E01BB8C0);
}

{
  uint64_t v2;

  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_1F38D3AA8;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
}

uint64_t std::construct_at[abi:ne180100]<swix::connection_config,swix::connection_config,swix::connection_config*>(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v4;
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  long long v5 = *(long long *)((char *)a2 + 24);
  *(void *)(a1 + 40) = *((void *)a2 + 5);
  *(_OWORD *)(a1 + 24) = v5;
  *((void *)a2 + 4) = 0;
  *((void *)a2 + 5) = 0;
  *((void *)a2 + 3) = 0;
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  xpc_object_t v6 = xpc_null_create();
  *(void *)(a1 + 56) = *((void *)a2 + 7);
  *((void *)a2 + 6) = v6;
  *((void *)a2 + 7) = 0;
  uint64_t v7 = *((void *)a2 + 8);
  *(_WORD *)(a1 + 72) = *((_WORD *)a2 + 36);
  *(void *)(a1 + 64) = v7;
  *(unsigned char *)(a1 + 80) = 0;
  *(unsigned char *)(a1 + 120) = 0;
  if (*((unsigned char *)a2 + 120))
  {
    *(void *)(a1 + 80) = *((void *)a2 + 10);
    std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](a1 + 88, (uint64_t)a2 + 88);
    *(unsigned char *)(a1 + 120) = 1;
  }
  return a1;
}

uint64_t ___ZN20MIDIServerXPC_Client23acknowledgeNotificationENSt3__18functionIFvN4swix6resultIJEEEEEE_block_invoke(uint64_t a1)
{
  return _ZNKSt3__18functionIFvN4swix6resultIJEEEEEclES3_(*(void *)(a1 + 56), 0x100000000);
}

void sub_1DD68758C(void *a1, int a2)
{
  long long v4 = (unsigned int *)__cxa_begin_catch(a1);
  if (a2 == 2) {
    _ZNKSt3__18functionIFvN4swix6resultIJEEEEEclES3_(*(void *)(v2 + 56), v4[4]);
  }
  else {
    _ZNKSt3__18functionIFvN4swix6resultIJEEEEEclES3_(*(void *)(v2 + 56), 4294966994);
  }
  __cxa_end_catch();
}

void sub_1DD6875D4(_Unwind_Exception *a1)
{
}

uint64_t _ZNSt3__110__function12__value_funcIFvN4swix6resultIJEEEEEC2B8ne180100ERKS6_(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void *__destroy_helper_block_e8_32c44_ZTSNSt3__18functionIFvN4swix6resultIJEEEEEE(uint64_t a1)
{
  return _ZNSt3__110__function12__value_funcIFvN4swix6resultIJEEEEED2B8ne180100Ev((void *)(a1 + 32));
}

uint64_t __copy_helper_block_e8_32c44_ZTSNSt3__18functionIFvN4swix6resultIJEEEEEE(uint64_t a1, uint64_t a2)
{
  return _ZNSt3__110__function12__value_funcIFvN4swix6resultIJEEEEEC2B8ne180100ERKS6_(a1 + 32, a2 + 32);
}

xpc_object_t *std::__tuple_leaf<0ul,swix::data,false>::__tuple_leaf[abi:ne180100](xpc_object_t *a1, xpc_object_t object)
{
  *a1 = object;
  if (object) {
    xpc_retain(object);
  }
  else {
    *a1 = xpc_null_create();
  }
  return a1;
}

unint64_t MIDIServerXPC_Client::setupAddDevice(MIDIServerXPC_Client *this, unsigned int a2, BOOL a3)
{
  swix::encode_message::encode_message((swix::encode_message *)&v11, 220460613);
  xpc_dictionary_set_uint64(xdict, "device", a2);
  xpc_dictionary_set_BOOL(xdict, "external", a3);
  xpc_object_t v6 = (const swix::encode_message *)*((void *)this + 1);
  if (!v6) {
    std::terminate();
  }
  swix::connection::send_and_await_reply((swix::connection *)v9, v6, &v11);
  unsigned int v7 = swix::coder<int>::decode(object, ".error");
  xpc_release(object);
  xpc_release(xdict);
  return ((unint64_t)(v7 == 0) << 32) | v7;
}

void sub_1DD6877AC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object)
{
}

unint64_t MIDIServerXPC_Client::setupRemoveDevice(MIDIServerXPC_Client *this, unsigned int a2, BOOL a3)
{
  swix::encode_message::encode_message((swix::encode_message *)&v11, 220460614);
  xpc_dictionary_set_uint64(xdict, "device", a2);
  xpc_dictionary_set_BOOL(xdict, "external", a3);
  xpc_object_t v6 = (const swix::encode_message *)*((void *)this + 1);
  if (!v6) {
    std::terminate();
  }
  swix::connection::send_and_await_reply((swix::connection *)v9, v6, &v11);
  unsigned int v7 = swix::coder<int>::decode(object, ".error");
  xpc_release(object);
  xpc_release(xdict);
  return ((unint64_t)(v7 == 0) << 32) | v7;
}

void sub_1DD6878C8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object)
{
}

uint64_t _XNotify(uint64_t result, uint64_t a2)
{
  mach_msg_return_t v11;
  unsigned int *v12;
  mach_msg_header_t msg;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v6 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v6;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  if (*(unsigned char *)(result + 39) != 1 || (size_t v3 = *(unsigned int *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v6 = -300;
    goto LABEL_9;
  }
  long long v4 = *(const UniChar **)(result + 28);
  if (gInMIDIServer) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = MIDIProcess::defaultInstance((MIDIProcess *)result);
  }
  unsigned int v7 = (MIDIProcess *)(*(uint64_t (**)(uint64_t *))*v5)(v5);
  if (!v7) {
    std::terminate();
  }
  xpc_object_t v8 = v7;
  uint64_t result = MIDIProcess::Notify(v7, v4, v3);
  int v9 = result;
  if (!result)
  {
    mach_port_t v10 = *((_DWORD *)v8 + 113);
    msg.msgh_size = 0;
    msg.msgh_bits = 19;
    msg.msgh_remote_port = v10;
    msg.msgh_local_port = 0;
    *(void *)&msg.msgh_voucher_port = 0x1F4100000000;
    if (MEMORY[0x1E4F14B18]) {
      voucher_mach_msg_set(&msg);
    }
    int v11 = mach_msg(&msg, 17, 0x18u, 0, 0, 0x493E0u, 0);
    int v12 = (unsigned int *)MEMORY[0x1E4F14960];
    if (v11 == 268435460)
    {
      if ((msg.msgh_bits & 0x1F00) == 0x1100) {
        mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
      }
      mach_msg_destroy(&msg);
    }
    uint64_t result = MEMORY[0x1E01BC570](*v12, v4, v3);
  }
  *(_DWORD *)(a2 + 32) = v9;
  return result;
}

uint64_t (*MIDIClientCallbacks_server_routine(uint64_t a1))(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 8000) {
    return _XNotify;
  }
  else {
    return 0;
  }
}

uint64_t MIDIClient_SetupAddDevice(int a1, int a2, int a3)
{
  *(_OWORD *)&msg[20] = 0u;
  uint64_t v10 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg[32] = a2;
  LODWORD(v10) = a3;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x1F6200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)msg, 275, 0x28u, 0x2Cu, reply_port, 0x493E0u, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v5)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8134)
      {
        uint64_t v7 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          uint64_t v7 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32]) {
            return 0;
          }
        }
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v7;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  uint64_t v7 = 268435460;
  if (v6 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_20;
  }
  return v6;
}

uint64_t MIDIClient_SetupRemoveDevice(int a1, int a2, int a3)
{
  *(_OWORD *)&msg[20] = 0u;
  uint64_t v10 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg[32] = a2;
  LODWORD(v10) = a3;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x1F6300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)msg, 275, 0x28u, 0x2Cu, reply_port, 0x493E0u, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v5)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 8135)
      {
        uint64_t v7 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          uint64_t v7 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32]) {
            return 0;
          }
        }
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_20:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v7;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  uint64_t v7 = 268435460;
  if (v6 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_20;
  }
  return v6;
}

uint64_t MIDIClient_ThruConnectionCreate(mach_port_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, int *a6)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)&v21[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v18 = 1;
  uint64_t v19 = a4;
  int v20 = 16777472;
  *(void *)int v21 = a5;
  *(void *)&v21[4] = *MEMORY[0x1E4F14068];
  if (a3 > 0x200) {
    return 4294966989;
  }
  __memcpy_chk();
  *(_DWORD *)&v21[12] = a3;
  uint64_t v11 = (a3 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v12 = v11 + 60;
  *(_DWORD *)((char *)&rcv_name + v11 + 56) = a5;
  mach_port_t reply_port = mig_get_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x1F6400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v14 = mach_msg(&rcv_name, 275, v12, 0x30u, reply_port, 0x493E0u, 0);
  uint64_t v6 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name.msgh_local_port);
    goto LABEL_21;
  }
  if (!v14)
  {
    if (rcv_name.msgh_id == 71)
    {
      uint64_t v6 = 4294966988;
    }
    else if (rcv_name.msgh_id == 8136)
    {
      if ((rcv_name.msgh_bits & 0x80000000) == 0)
      {
        if (rcv_name.msgh_size == 40)
        {
          if (!rcv_name.msgh_remote_port)
          {
            uint64_t v6 = HIDWORD(v19);
            if (!HIDWORD(v19))
            {
              *a6 = v20;
              return v6;
            }
            goto LABEL_29;
          }
        }
        else if (rcv_name.msgh_size == 36)
        {
          if (rcv_name.msgh_remote_port) {
            BOOL v15 = 1;
          }
          else {
            BOOL v15 = HIDWORD(v19) == 0;
          }
          if (v15) {
            uint64_t v6 = 4294966996;
          }
          else {
            uint64_t v6 = HIDWORD(v19);
          }
          goto LABEL_29;
        }
      }
      uint64_t v6 = 4294966996;
    }
    else
    {
      uint64_t v6 = 4294966995;
    }
LABEL_29:
    mach_msg_destroy(&rcv_name);
    return v6;
  }
  mig_dealloc_reply_port(rcv_name.msgh_local_port);
LABEL_21:
  if (v6 == 268435460)
  {
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
    mach_msg_destroy(&rcv_name);
    return 268435460;
  }
  return v6;
}

uint64_t _XUMPCIDiscover(MIDIServer *a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *((_DWORD *)a1 + 1) != 36) {
    uint64_t result = 4294966992;
  }
  else {
    uint64_t result = _UMPCIDiscover(a1);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

void _XUMPCIGlobalState(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    *(_DWORD *)(a2 + 36) = 16777472;
    CFTypeRef cf = 0;
    int v3 = _UMPCIGlobalState((MIDIServer *)&cf);
    if (v3)
    {
      int v4 = v3;
    }
    else
    {
      LODWORD(v5[0]) = 1;
      v5[1] = 0;
      int v4 = IPCBufferWriter::write((IPCBufferWriter *)v5, cf, (void **)(a2 + 28), (unsigned int *)(a2 + 52));
      CFRelease(cf);
      IPCBufferWriter::~IPCBufferWriter(v5);
      if (!v4)
      {
        *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
        *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
    }
    *(_DWORD *)(a2 + 32) = v4;
  }
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void sub_1DD6881B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

uint64_t _XUMPCIObjectSetEnableState(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40) {
    uint64_t result = 4294966992;
  }
  else {
    uint64_t result = _UMPCIObjectSetEnableState((MIDIServer *)*(unsigned int *)(a1 + 32), *(unsigned __int8 *)(a1 + 36));
  }
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

void _XUMPCIObjectSetDescription(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 60)
  {
    if (*(unsigned char *)(a1 + 39) == 1 && (uint64_t v3 = *(unsigned int *)(a1 + 40), v3 == *(_DWORD *)(a1 + 56)))
    {
      int v4 = (MIDIServer *)*(unsigned int *)(a1 + 52);
      uint64_t v5 = *(const UInt8 **)(a1 + 28);
      xpc_object_t v8 = v5;
      int v9 = v3;
      int v10 = 0;
      uint64_t v11 = 0;
      uint64_t v6 = IPCBufferReader::ReadCFPropertyList(&v8, 0);
      int v7 = _UMPCIObjectSetDescription(v4, v6);
      if (!v7) {
        MEMORY[0x1E01BC570](*MEMORY[0x1E4F14960], v5, v3);
      }
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v8);
    }
    else
    {
      int v7 = -300;
    }
  }
  else
  {
    int v7 = -304;
  }
  *(_DWORD *)(a2 + 32) = v7;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void sub_1DD688310(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

uint64_t _XUMPCIObjectDispose(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 36) {
    uint64_t result = 4294966992;
  }
  else {
    uint64_t result = _UMPCIObjectDispose((MIDIServer *)a1[8]);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XUMPCIObjectCreate(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    int v4 = -304;
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || (int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 56)))
  {
    int v4 = -300;
    goto LABEL_10;
  }
  if (*(_DWORD *)(result + 60) || *(_DWORD *)(result + 64) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    uint64_t v5 = *MEMORY[0x1E4F14068];
    goto LABEL_11;
  }
  int v6 = *(_DWORD *)(result + 52);
  int v7 = *(const UInt8 **)(result + 28);
  long long v8 = *(_OWORD *)(result + 96);
  v9[0] = *(_OWORD *)(result + 80);
  v9[1] = v8;
  uint64_t result = MIDIServer_UMPCIObjectCreate(v9, v6, v7, v3, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v5 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_11:
  *(void *)(a2 + 24) = v5;
  return result;
}

uint64_t _XCIMUIDCollides(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 36) {
    uint64_t result = 4294966992;
  }
  else {
    uint64_t result = _MIDICapabilityMUIDCollides((MIDIServer *)a1[8]);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

MIDIServer *_XCIGetDiscoveryMUID(MIDIServer *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *((_DWORD *)result + 1) != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = (MIDIServer *)_MIDICapabilityGetDiscoveryMUID(result);
    *(_DWORD *)(a2 + 32) = 0;
    *(_DWORD *)(a2 + 36) = result;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    *(_DWORD *)(a2 + 4) = 40;
  }
  return result;
}

void _XThruConnectionFind(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (unsigned int v3 = *(_DWORD *)(a1 + 4), v3 >= 0x24)
    && v3 <= 0x224
    && ((unsigned int v4 = *(_DWORD *)(a1 + 32), v4 <= 0x200) ? (v5 = v3 - 36 >= v4) : (v5 = 0),
        v5 ? (BOOL v6 = v3 == ((v4 + 3) & 0xFFFFFFFC) + 36) : (BOOL v6 = 0),
        v6))
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    CFIndex v7 = *(unsigned int *)(a1 + 32);
    uint64_t v11 = a1 + 36;
    int v12 = v7;
    int v13 = 0;
    uint64_t v14 = (MIDIServer *)CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 36), v7, 0x100u, 1u);
    CFTypeRef cf = 0;
    int v8 = _MIDIThruConnectionFind(v14, (__CFData **)&cf);
    if (v8)
    {
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v11);
    }
    else
    {
      LODWORD(v9[0]) = 1;
      v9[1] = 0;
      int v8 = IPCBufferWriter::write((IPCBufferWriter *)v9, (CFDataRef)cf, (void **)(a2 + 28), (unsigned int *)(a2 + 52));
      CFRelease(cf);
      IPCBufferWriter::~IPCBufferWriter(v9);
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v11);
      if (!v8)
      {
        *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
        *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
    }
    *(_DWORD *)(a2 + 32) = v8;
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void sub_1DD68867C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  unsigned int v3 = va_arg(va1, void *);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va1);
  _Unwind_Resume(a1);
}

void _XThruConnectionSetParams(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 60)
  {
    if (*(unsigned char *)(a1 + 39) == 1 && (CFIndex v3 = *(unsigned int *)(a1 + 40), v3 == *(_DWORD *)(a1 + 56)))
    {
      unsigned int v4 = (MIDIServer *)*(unsigned int *)(a1 + 52);
      uint64_t v5 = *(const UInt8 **)(a1 + 28);
      uint64_t v7 = v5;
      int v8 = v3;
      int v9 = 0;
      CFDataRef v10 = CFDataCreate(0, v5, v3);
      int v6 = _MIDIThruConnectionSetParams(v4, v10);
      if (!v6) {
        MEMORY[0x1E01BC570](*MEMORY[0x1E4F14960], v5, v3);
      }
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v7);
    }
    else
    {
      int v6 = -300;
    }
  }
  else
  {
    int v6 = -304;
  }
  *(_DWORD *)(a2 + 32) = v6;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void sub_1DD688790(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

void _XThruConnectionGetParams(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    CFIndex v3 = (MIDIServer *)a1[8];
    CFTypeRef cf = 0;
    int Params = _MIDIThruConnectionGetParams(v3, &cf);
    if (Params)
    {
      int v5 = Params;
    }
    else
    {
      LODWORD(v6[0]) = 1;
      v6[1] = 0;
      int v5 = IPCBufferWriter::write((IPCBufferWriter *)v6, (CFDataRef)cf, (void **)(a2 + 28), (unsigned int *)(a2 + 52));
      CFRelease(cf);
      IPCBufferWriter::~IPCBufferWriter(v6);
      if (!v5)
      {
        *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
        *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
    }
    *(_DWORD *)(a2 + 32) = v5;
  }
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void sub_1DD688898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

uint64_t _XThruConnectionDispose(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 36) {
    uint64_t result = 4294966992;
  }
  else {
    uint64_t result = _MIDIThruConnectionDispose((MIDIServer *)a1[8]);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XThruConnectionCreate(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x3C || v5 > 0x23C) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(result + 39) != 1) {
    goto LABEL_17;
  }
  CFIndex v6 = *(unsigned int *)(result + 52);
  if (v6 > 0x200)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_4;
  }
  int v3 = -304;
  if ((int)v5 - 60 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v5 != v7 + 60) {
    goto LABEL_3;
  }
  unsigned int v8 = *(_DWORD *)(result + 40);
  if (v8 != *(_DWORD *)(result + v7 + 56))
  {
LABEL_17:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v9 = ((v5 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v9 || *(_DWORD *)(v9 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }
  CFDataRef v10 = *(const UInt8 **)(result + 28);
  long long v11 = *(_OWORD *)(v9 + 36);
  v12[0] = *(_OWORD *)(v9 + 20);
  v12[1] = v11;
  uint64_t result = MIDIServer_ThruConnectionCreate(v12, (const UInt8 *)(result + 56), v6, v10, v8, a2 + 36);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_4:
  *(void *)(a2 + 24) = v4;
  return result;
}

uint64_t _XSetupRemoveDevice(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 40)
  {
    uint64_t result = 4294966992;
  }
  else if (a1[9])
  {
    uint64_t result = _MIDISetupRemoveExternalDevice((MIDIServer *)a1[8]);
  }
  else
  {
    uint64_t result = _MIDISetupRemoveDevice((MIDIServer *)a1[8]);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XSetupAddDevice(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 40)
  {
    uint64_t result = 4294966992;
  }
  else if (a1[9])
  {
    uint64_t result = _MIDISetupAddExternalDevice((MIDIServer *)a1[8]);
  }
  else
  {
    uint64_t result = _MIDISetupAddDevice((MIDIServer *)a1[8]);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XEntityAddOrRemoveEndpoints(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 44) {
    uint64_t result = 4294966992;
  }
  else {
    uint64_t result = _MIDIEntityAddOrRemoveEndpoints((MIDIServer *)a1[8], a1[9], a1[10]);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XDeviceRemoveEntity(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 40) {
    uint64_t result = 4294966992;
  }
  else {
    uint64_t result = _MIDIDeviceRemoveEntity((MIDIServer *)a1[8], a1[9]);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

void _XDeviceAddEntity(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (unsigned int v3 = *(_DWORD *)(a1 + 4), v3 >= 0x38)
    && v3 <= 0x238
    && (CFIndex v4 = *(unsigned int *)(a1 + 36), v4 <= 0x200)
    && ((v5 = (v4 + 3) & 0xFFFFFFFC, v3 - 56 >= v4) ? (BOOL v6 = v3 == v5 + 56) : (BOOL v6 = 0), v6))
  {
    unsigned int v8 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    uint64_t v9 = (unsigned int *)(a1 + v5);
    uint64_t v10 = v9[10];
    unsigned int v11 = v9[11];
    uint64_t v12 = v9[12];
    uint64_t v13 = v9[13];
    uint64_t v14 = a1 + 40;
    int v15 = v4;
    int v16 = 0;
    CFStringRef v17 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v4, 0x100u, 1u);
    LODWORD(v8) = _MIDIDeviceAddEntity(v8, (uint64_t)v17, v10, v11, v12, v13, a2 + 36);
    IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v14);
    *(_DWORD *)(a2 + 32) = v8;
    uint64_t v7 = *MEMORY[0x1E4F14068];
    if (!v8)
    {
      *(void *)(a2 + 24) = v7;
      *(_DWORD *)(a2 + 4) = 40;
      return;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v7 = *MEMORY[0x1E4F14068];
  }
  *(void *)(a2 + 24) = v7;
}

void sub_1DD688CDC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

uint64_t _XExternalDeviceCreate(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_23;
  }
  unsigned int v3 = *(_DWORD *)(result + 4);
  if (v3 < 0x2C) {
    goto LABEL_23;
  }
  if (v3 > 0x62C) {
    goto LABEL_23;
  }
  CFIndex v4 = *(unsigned int *)(result + 32);
  if (v4 > 0x200) {
    goto LABEL_23;
  }
  unsigned int v5 = (v4 + 3) & 0xFFFFFFFC;
  if (v3 - 44 < v4 || v3 < v5 + 44) {
    goto LABEL_23;
  }
  uint64_t v7 = result + v5;
  unsigned int v8 = *(_DWORD *)(v7 + 36);
  if (v8 > 0x200) {
    goto LABEL_23;
  }
  unsigned int v9 = v3 - v5;
  unsigned int v10 = (v8 + 3) & 0xFFFFFFFC;
  BOOL v11 = v9 - 44 >= v8 && v9 >= v10 + 44;
  if (!v11
    || ((uint64_t v12 = v7 - 512, v13 = v9 - v10, v14 = v7 - 512 + v10, v15 = *(_DWORD *)(v14 + 552), v15 <= 0x200)
      ? (BOOL v16 = v13 - 44 >= v15)
      : (BOOL v16 = 0),
        v16 ? (BOOL v17 = v13 == ((v15 + 3) & 0xFFFFFFFC) + 44) : (BOOL v17 = 0),
        !v17))
  {
LABEL_23:
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v18 = *MEMORY[0x1E4F14068];
LABEL_24:
    *(void *)(a2 + 24) = v18;
    return result;
  }
  uint64_t result = MIDIServer_ExternalDeviceCreate((UInt8 *)(result + 36), v4, (UInt8 *)(v12 + 552), v8, (UInt8 *)(v14 + 556), v15, (MIDIDeviceRef *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v18 = *MEMORY[0x1E4F14068];
  if (result) {
    goto LABEL_24;
  }
  *(void *)(a2 + 24) = v18;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

_DWORD *_XSetupGetCurrent(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v3 = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = (_DWORD *)_MIDISetupGetCurrent((MIDIServer *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = result;
    uint64_t v3 = *MEMORY[0x1E4F14068];
    if (!result)
    {
      *(void *)(a2 + 24) = v3;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }
  *(void *)(a2 + 24) = v3;
  return result;
}

uint64_t _XSetupInstall(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 36) {
    uint64_t result = 4294966992;
  }
  else {
    uint64_t result = _MIDISetupInstall((MIDIServer *)a1[8]);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

void _XSetupFromData(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 56)
  {
    int v6 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v6;
    goto LABEL_10;
  }
  if (*(unsigned char *)(a1 + 39) != 1 || (CFIndex v3 = *(unsigned int *)(a1 + 40), v3 != *(_DWORD *)(a1 + 52)))
  {
    int v6 = -300;
    goto LABEL_9;
  }
  CFIndex v4 = *(const UInt8 **)(a1 + 28);
  uint64_t v7 = v4;
  int v8 = v3;
  int v9 = 0;
  unsigned int v10 = CFDataCreate(0, v4, v3);
  int v5 = _MIDISetupFromData(v10, a2 + 36);
  if (!v5)
  {
    MEMORY[0x1E01BC570](*MEMORY[0x1E4F14960], v4, v3);
    IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v7);
    *(_DWORD *)(a2 + 32) = 0;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    *(_DWORD *)(a2 + 4) = 40;
    return;
  }
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v7);
  *(_DWORD *)(a2 + 32) = v5;
LABEL_10:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void sub_1DD688FE4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

_DWORD *_XSetupCreate(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0 && result[1] == 24) {
    _MIDISetupCreate((MIDIServer *)(a2 + 36));
  }
  *(_DWORD *)(a2 + 32) = -304;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XRestart(MIDIServer *a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *((_DWORD *)a1 + 1) != 36) {
    uint64_t result = 4294966992;
  }
  else {
    uint64_t result = _MIDIRestart(a1);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XFlushOutput(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 36) {
    uint64_t result = 4294966992;
  }
  else {
    uint64_t result = _MIDIFlushOutput(a1[8]);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XObjectFindByUniqueID(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v3 = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = (_DWORD *)_MIDIObjectFindByUniqueID((MIDIServer *)result[8], (_DWORD *)(a2 + 36), (_DWORD *)(a2 + 40));
    *(_DWORD *)(a2 + 32) = result;
    uint64_t v3 = *MEMORY[0x1E4F14068];
    if (!result)
    {
      *(void *)(a2 + 24) = v3;
      *(_DWORD *)(a2 + 4) = 44;
      return result;
    }
  }
  *(void *)(a2 + 24) = v3;
  return result;
}

void _XObjectRemoveProperty(uint64_t a1, uint64_t a2)
{
  int v3 = -304;
  if ((*(_DWORD *)a1 & 0x80000000) == 0)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 4);
    if (v4 >= 0x28 && v4 <= 0x228)
    {
      CFIndex v5 = *(unsigned int *)(a1 + 36);
      BOOL v6 = v5 <= 0x200 && v4 - 40 >= v5;
      if (v6 && v4 == ((v5 + 3) & 0xFFFFFFFC) + 40)
      {
        uint64_t v7 = (MIDIServer *)*(unsigned int *)(a1 + 32);
        uint64_t v8 = a1 + 40;
        int v9 = v5;
        int v10 = 0;
        CFStringRef v11 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v5, 0x100u, 1u);
        int v3 = _MIDIObjectRemoveProperty(v7, v11);
        IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v8);
      }
    }
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void sub_1DD689260(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

void _XObjectGetProperties(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    int v3 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 36);
    CFTypeRef cf = 0;
    int Properties = _MIDIObjectGetProperties(v3, (CFMutableDictionaryRef *)&cf, v4);
    if (Properties)
    {
      int v6 = Properties;
    }
    else
    {
      LODWORD(v7[0]) = 1;
      v7[1] = 0;
      int v6 = IPCBufferWriter::write((IPCBufferWriter *)v7, cf, (void **)(a2 + 28), (unsigned int *)(a2 + 52));
      CFRelease(cf);
      IPCBufferWriter::~IPCBufferWriter(v7);
      if (!v6)
      {
        *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
        *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
    }
    *(_DWORD *)(a2 + 32) = v6;
  }
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void sub_1DD68936C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

uint64_t _XObjectSetDictionaryProperty(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0)
  {
    uint64_t result = 4294966992;
    goto LABEL_3;
  }
  int v5 = *(_DWORD *)(a1 + 24);
  uint64_t result = 4294966992;
  if (v5 == 1)
  {
    unsigned int v6 = *(_DWORD *)(a1 + 4);
    if (v6 >= 0x40 && v6 <= 0x240)
    {
      if (*(unsigned char *)(a1 + 39) != 1) {
        goto LABEL_13;
      }
      CFIndex v7 = *(unsigned int *)(a1 + 56);
      if (v7 <= 0x200 && v6 - 64 >= v7)
      {
        unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
        if (v6 == v8 + 64)
        {
          unsigned int v9 = *(_DWORD *)(a1 + 40);
          if (v9 == *(_DWORD *)(a1 + v8 + 60))
          {
            uint64_t result = MIDIServer_ObjectSetDictionaryProperty((MIDIServer *)*(unsigned int *)(a1 + 52), (const UInt8 *)(a1 + 60), v7, *(const UInt8 **)(a1 + 28), v9);
            goto LABEL_3;
          }
LABEL_13:
          uint64_t result = 4294966996;
        }
      }
    }
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

void _XObjectGetDictionaryProperty(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (unsigned int v3 = *(_DWORD *)(a1 + 4), v3 >= 0x28)
    && v3 <= 0x228
    && ((unsigned int v4 = *(_DWORD *)(a1 + 36), v4 <= 0x200) ? (v5 = v3 - 40 >= v4) : (v5 = 0),
        v5 ? (BOOL v6 = v3 == ((v4 + 3) & 0xFFFFFFFC) + 40) : (BOOL v6 = 0),
        v6))
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    unsigned int v8 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    CFIndex v7 = *(unsigned int *)(a1 + 36);
    uint64_t v12 = a1 + 40;
    int v13 = v7;
    int v14 = 0;
    CFStringRef v15 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v7, 0x100u, 1u);
    CFTypeRef cf = 0;
    int DictionaryProperty = _MIDIObjectGetDictionaryProperty(v8, v15, &cf);
    if (DictionaryProperty)
    {
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v12);
    }
    else
    {
      LODWORD(v10[0]) = 1;
      v10[1] = 0;
      int DictionaryProperty = IPCBufferWriter::write((IPCBufferWriter *)v10, cf, (void **)(a2 + 28), (unsigned int *)(a2 + 52));
      CFRelease(cf);
      IPCBufferWriter::~IPCBufferWriter(v10);
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v12);
      if (!DictionaryProperty)
      {
        *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
        *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
    }
    *(_DWORD *)(a2 + 32) = DictionaryProperty;
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void sub_1DD6895A0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  unsigned int v3 = va_arg(va1, void *);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va1);
  _Unwind_Resume(a1);
}

uint64_t _XObjectSetDataProperty(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0)
  {
    uint64_t result = 4294966992;
    goto LABEL_3;
  }
  int v5 = *(_DWORD *)(a1 + 24);
  uint64_t result = 4294966992;
  if (v5 == 1)
  {
    unsigned int v6 = *(_DWORD *)(a1 + 4);
    if (v6 >= 0x40 && v6 <= 0x240)
    {
      if (*(unsigned char *)(a1 + 39) != 1) {
        goto LABEL_13;
      }
      CFIndex v7 = *(unsigned int *)(a1 + 56);
      if (v7 <= 0x200 && v6 - 64 >= v7)
      {
        unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
        if (v6 == v8 + 64)
        {
          unsigned int v9 = *(_DWORD *)(a1 + 40);
          if (v9 == *(_DWORD *)(a1 + v8 + 60))
          {
            uint64_t result = MIDIServer_ObjectSetDataProperty((MIDIServer *)*(unsigned int *)(a1 + 52), (const UInt8 *)(a1 + 60), v7, *(const UInt8 **)(a1 + 28), v9);
            goto LABEL_3;
          }
LABEL_13:
          uint64_t result = 4294966996;
        }
      }
    }
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

void _XObjectGetDataProperty(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (unsigned int v3 = *(_DWORD *)(a1 + 4), v3 >= 0x28)
    && v3 <= 0x228
    && ((unsigned int v4 = *(_DWORD *)(a1 + 36), v4 <= 0x200) ? (v5 = v3 - 40 >= v4) : (v5 = 0),
        v5 ? (BOOL v6 = v3 == ((v4 + 3) & 0xFFFFFFFC) + 40) : (BOOL v6 = 0),
        v6))
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    unsigned int v8 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    CFIndex v7 = *(unsigned int *)(a1 + 36);
    uint64_t v12 = a1 + 40;
    int v13 = v7;
    int v14 = 0;
    CFStringRef v15 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v7, 0x100u, 1u);
    CFTypeRef cf = 0;
    int DataProperty = _MIDIObjectGetDataProperty(v8, v15, (const __CFData **)&cf);
    if (DataProperty)
    {
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v12);
    }
    else
    {
      LODWORD(v10[0]) = 1;
      v10[1] = 0;
      int DataProperty = IPCBufferWriter::write((IPCBufferWriter *)v10, (CFDataRef)cf, (void **)(a2 + 28), (unsigned int *)(a2 + 52));
      CFRelease(cf);
      IPCBufferWriter::~IPCBufferWriter(v10);
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v12);
      if (!DataProperty)
      {
        *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
        *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
    }
    *(_DWORD *)(a2 + 32) = DataProperty;
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void sub_1DD6897E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  unsigned int v3 = va_arg(va1, void *);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va1);
  _Unwind_Resume(a1);
}

uint64_t _XObjectSetStringProperty(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0)
  {
    uint64_t result = 4294966992;
    goto LABEL_3;
  }
  int v5 = *(_DWORD *)(a1 + 24);
  uint64_t result = 4294966992;
  if (v5 == 1)
  {
    unsigned int v6 = *(_DWORD *)(a1 + 4);
    if (v6 >= 0x40 && v6 <= 0x240)
    {
      if (*(unsigned char *)(a1 + 39) != 1) {
        goto LABEL_13;
      }
      CFIndex v7 = *(unsigned int *)(a1 + 56);
      if (v7 <= 0x200 && v6 - 64 >= v7)
      {
        unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
        if (v6 == v8 + 64)
        {
          unsigned int v9 = *(_DWORD *)(a1 + 40);
          if (v9 == *(_DWORD *)(a1 + v8 + 60))
          {
            uint64_t result = MIDIServer_ObjectSetStringProperty((MIDIServer *)*(unsigned int *)(a1 + 52), (const UInt8 *)(a1 + 60), v7, *(UInt8 **)(a1 + 28), v9);
            goto LABEL_3;
          }
LABEL_13:
          uint64_t result = 4294966996;
        }
      }
    }
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

void _XObjectGetStringProperty(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (unsigned int v3 = *(_DWORD *)(a1 + 4), v3 >= 0x28)
    && v3 <= 0x228
    && ((unsigned int v4 = *(_DWORD *)(a1 + 36), v4 <= 0x200) ? (v5 = v3 - 40 >= v4) : (v5 = 0),
        v5 ? (BOOL v6 = v3 == ((v4 + 3) & 0xFFFFFFFC) + 40) : (BOOL v6 = 0),
        v6))
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    unsigned int v8 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    CFIndex v7 = *(unsigned int *)(a1 + 36);
    uint64_t v12 = a1 + 40;
    int v13 = v7;
    int v14 = 0;
    CFStringRef v15 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v7, 0x100u, 1u);
    CFTypeRef cf = 0;
    int StringProperty = _MIDIObjectGetStringProperty(v8, v15, (const __CFString **)&cf);
    if (StringProperty)
    {
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v12);
    }
    else
    {
      LODWORD(v10[0]) = 1;
      v10[1] = 0;
      int StringProperty = IPCBufferWriter::write((IPCBufferWriter *)v10, (CFStringRef)cf, (void **)(a2 + 28), (unsigned int *)(a2 + 52));
      CFRelease(cf);
      IPCBufferWriter::~IPCBufferWriter(v10);
      IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v12);
      if (!StringProperty)
      {
        *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
        *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
        *(_DWORD *)a2 |= 0x80000000;
        *(_DWORD *)(a2 + 4) = 56;
        *(_DWORD *)(a2 + 24) = 1;
        return;
      }
    }
    *(_DWORD *)(a2 + 32) = StringProperty;
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void sub_1DD689A30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  unsigned int v3 = va_arg(va1, void *);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  IPCBufferWriter::~IPCBufferWriter((void **)va);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va1);
  _Unwind_Resume(a1);
}

void _XObjectSetIntegerProperty(uint64_t a1, uint64_t a2)
{
  int v3 = -304;
  if ((*(_DWORD *)a1 & 0x80000000) == 0)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 4);
    if (v4 >= 0x2C && v4 <= 0x22C)
    {
      CFIndex v5 = *(unsigned int *)(a1 + 36);
      if (v5 <= 0x200 && v4 - 44 >= v5)
      {
        unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
        if (v4 == v6 + 44)
        {
          uint64_t v7 = (MIDIServer *)*(unsigned int *)(a1 + 32);
          int v8 = *(_DWORD *)(a1 + v6 + 40);
          uint64_t v9 = a1 + 40;
          int v10 = v5;
          int v11 = 0;
          CFStringRef v12 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v5, 0x100u, 1u);
          int v3 = _MIDIObjectSetIntegerProperty(v7, v12, v8);
          IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v9);
        }
      }
    }
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void sub_1DD689B30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

void _XObjectGetIntegerProperty(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (unsigned int v3 = *(_DWORD *)(a1 + 4), v3 >= 0x28)
    && v3 <= 0x228
    && ((CFIndex v4 = *(unsigned int *)(a1 + 36), v4 <= 0x200) ? (v5 = v3 - 40 >= v4) : (v5 = 0),
        v5 ? (BOOL v6 = v3 == ((v4 + 3) & 0xFFFFFFFC) + 40) : (BOOL v6 = 0),
        v6))
  {
    int v8 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    uint64_t v9 = a1 + 40;
    int v10 = v4;
    int v11 = 0;
    CFStringRef v12 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v4, 0x100u, 1u);
    LODWORD(v8) = _MIDIObjectGetIntegerProperty(v8, v12, (int *)(a2 + 36));
    IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v9);
    *(_DWORD *)(a2 + 32) = v8;
    uint64_t v7 = *MEMORY[0x1E4F14068];
    if (!v8)
    {
      *(void *)(a2 + 24) = v7;
      *(_DWORD *)(a2 + 4) = 40;
      return;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v7 = *MEMORY[0x1E4F14068];
  }
  *(void *)(a2 + 24) = v7;
}

void sub_1DD689C28(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

uint64_t _XEndpointDispose(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 36) {
    uint64_t result = 4294966992;
  }
  else {
    uint64_t result = _MIDIEndpointDispose((MIDIServer *)a1[8]);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

void _XSourceCreate(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (unsigned int v3 = *(_DWORD *)(a1 + 4), v3 >= 0x2C)
    && v3 <= 0x22C
    && (CFIndex v4 = *(unsigned int *)(a1 + 36), v4 <= 0x200)
    && (v3 - 44 >= v4 ? (BOOL v5 = v3 == ((v4 + 3) & 0xFFFFFFFC) + 44) : (BOOL v5 = 0), v5))
  {
    uint64_t v7 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    uint64_t v8 = a1 + 40;
    int v9 = v4;
    int v10 = 0;
    CFStringRef v11 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v4, 0x100u, 1u);
    LODWORD(v7) = _MIDISourceCreate(v7);
    IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v8);
    *(_DWORD *)(a2 + 32) = v7;
    uint64_t v6 = *MEMORY[0x1E4F14068];
    if (!v7)
    {
      *(void *)(a2 + 24) = v6;
      *(_DWORD *)(a2 + 4) = 40;
      return;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v6 = *MEMORY[0x1E4F14068];
  }
  *(void *)(a2 + 24) = v6;
}

void sub_1DD689D90(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

void _XDestinationCreate(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (unsigned int v3 = *(_DWORD *)(a1 + 4), v3 >= 0x2C)
    && v3 <= 0x22C
    && (CFIndex v4 = *(unsigned int *)(a1 + 36), v4 <= 0x200)
    && (v3 - 44 >= v4 ? (BOOL v5 = v3 == ((v4 + 3) & 0xFFFFFFFC) + 44) : (BOOL v5 = 0), v5))
  {
    uint64_t v7 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    uint64_t v8 = a1 + 40;
    int v9 = v4;
    int v10 = 0;
    CFStringRef v11 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v4, 0x100u, 1u);
    LODWORD(v7) = _MIDIDestinationCreate(v7);
    IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v8);
    *(_DWORD *)(a2 + 32) = v7;
    uint64_t v6 = *MEMORY[0x1E4F14068];
    if (!v7)
    {
      *(void *)(a2 + 24) = v6;
      *(_DWORD *)(a2 + 4) = 40;
      return;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v6 = *MEMORY[0x1E4F14068];
  }
  *(void *)(a2 + 24) = v6;
}

void sub_1DD689EA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

void _XGetObjectTree(MIDIServer *a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *((_DWORD *)a1 + 1) != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    int v3 = *((_DWORD *)a1 + 8);
    CFIndex v4 = MIDIServer::defaultInstance(a1);
    uint64_t v5 = v4[2];
    uint64_t v18 = v4 + 2;
    char v19 = (*(uint64_t (**)(void))(v5 + 16))();
    CFStringRef v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    ObjectTreeCache::GetObjectTree((MIDIServer *)&v15);
    uint64_t v6 = v15;
    CFDataRef v7 = CFDataCreateWithBytesNoCopy(0, v15, v16 - (void)v15, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    LODWORD(v14[0]) = 1;
    v14[1] = 0;
    int v8 = IPCBufferWriter::write((IPCBufferWriter *)v14, v7, (void **)(a2 + 28), (unsigned int *)(a2 + 52));
    int v9 = v8;
    if (v3)
    {
      if (!v8)
      {
        unsigned int v10 = *(_DWORD *)(a2 + 52);
        if (v10 >= 4)
        {
          unsigned int v11 = v10 >> 2;
          CFStringRef v12 = *(unsigned int **)(a2 + 28);
          unsigned int v13 = v11 + 1;
          do
          {
            *CFStringRef v12 = bswap32(*v12);
            ++v12;
            --v13;
          }
          while (v13 > 1);
        }
      }
    }
    CFRelease(v7);
    IPCBufferWriter::~IPCBufferWriter(v14);
    if (v6) {
      operator delete(v6);
    }
    CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v18);
    if (!v9)
    {
      *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
      *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
      *(_DWORD *)a2 |= 0x80000000;
      *(_DWORD *)(a2 + 4) = 56;
      *(_DWORD *)(a2 + 24) = 1;
      return;
    }
    *(_DWORD *)(a2 + 32) = v9;
  }
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void sub_1DD68A064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (v15) {
    operator delete(v15);
  }
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&a15);
  _Unwind_Resume(a1);
}

uint64_t _XPortDisconnectSource(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 40) {
    uint64_t result = 4294966992;
  }
  else {
    uint64_t result = _MIDIPortDisconnectSource((MIDIServer *)a1[8], a1[9]);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

void _XPortConnectSource(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 48)
  {
    unsigned int v7 = -304;
  }
  else
  {
    int v3 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 36);
    uint64_t v5 = *(uint64_t (***)())(a1 + 40);
    gMIDIServerLog();
    uint64_t v6 = gMIDIServerLog(void)::mdsrvr;
    if (os_log_type_enabled((os_log_t)gMIDIServerLog(void)::mdsrvr, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316418;
      CFStringRef v12 = "MIDIMachServer.cpp";
      __int16 v13 = 1024;
      int v14 = 324;
      __int16 v15 = 2080;
      uint64_t v16 = "MIDIServer_PortConnectSource";
      __int16 v17 = 1024;
      *(_DWORD *)uint64_t v18 = v3;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = v4;
      __int16 v19 = 2048;
      int v20 = v5;
      _os_log_impl(&dword_1DD5F4000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s port 0x%x src 0x%x, connRefCon 0x%qx", buf, 0x32u);
    }
    unsigned int v7 = _MIDIPortConnectSource(v3, v4, v5);
    gMIDIServerLog();
    int v8 = gMIDIServerLog(void)::mdsrvr;
    if (os_log_type_enabled((os_log_t)gMIDIServerLog(void)::mdsrvr, OS_LOG_TYPE_DEBUG))
    {
      ErrorFormatter::ErrorFormatter((ErrorFormatter *)v10, v7);
      *(_DWORD *)buf = 136315906;
      CFStringRef v12 = "MIDIMachServer.cpp";
      __int16 v13 = 1024;
      int v14 = 326;
      __int16 v15 = 2080;
      uint64_t v16 = "MIDIServer_PortConnectSource";
      __int16 v17 = 2080;
      *(void *)uint64_t v18 = v10;
      _os_log_impl(&dword_1DD5F4000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s%s", buf, 0x26u);
    }
  }
  int v9 = (void *)MEMORY[0x1E4F14068];
  *(_DWORD *)(a2 + 32) = v7;
  *(void *)(a2 + 24) = *v9;
}

uint64_t _XPortDispose(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 36) {
    uint64_t result = 4294966992;
  }
  else {
    uint64_t result = _MIDIPortDispose((MIDIServer *)a1[8]);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

void _XOutputPortCreate(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (unsigned int v3 = *(_DWORD *)(a1 + 4), v3 >= 0x28)
    && v3 <= 0x228
    && ((CFIndex v4 = *(unsigned int *)(a1 + 36), v4 <= 0x200) ? (v5 = v3 - 40 >= v4) : (v5 = 0),
        v5 ? (BOOL v6 = v3 == ((v4 + 3) & 0xFFFFFFFC) + 40) : (BOOL v6 = 0),
        v6))
  {
    int v8 = (MIDIServer *)*(unsigned int *)(a1 + 32);
    uint64_t v9 = a1 + 40;
    int v10 = v4;
    int v11 = 0;
    CFStringRef v12 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v4, 0x100u, 1u);
    LODWORD(v8) = _MIDIOutputPortCreate(v8);
    IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v9);
    *(_DWORD *)(a2 + 32) = v8;
    uint64_t v7 = *MEMORY[0x1E4F14068];
    if (!v8)
    {
      *(void *)(a2 + 24) = v7;
      *(_DWORD *)(a2 + 4) = 40;
      return;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v7 = *MEMORY[0x1E4F14068];
  }
  *(void *)(a2 + 24) = v7;
}

void sub_1DD68A408(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

void _XInputPortCreate(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0
    || (unsigned int v4 = *(_DWORD *)(a1 + 4), v4 < 0x2C)
    || v4 > 0x22C
    || (CFIndex v5 = *(unsigned int *)(a1 + 36), v5 > 0x200)
    || (v4 - 44 >= v5 ? (BOOL v6 = v4 == ((v5 + 3) & 0xFFFFFFFC) + 44) : (BOOL v6 = 0), !v6))
  {
    int v7 = -304;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v7;
    uint64_t v8 = *MEMORY[0x1E4F14068];
    goto LABEL_11;
  }
  uint64_t v9 = (MIDIServer *)*(unsigned int *)(a1 + 32);
  if (!BaseOpaqueObject::ResolveOpaqueRef((uint64_t)&TOpaqueRTTI<MIDIClient>::sRTTI, *(_DWORD *)(a1 + 32)))
  {
    int v7 = -50;
    goto LABEL_10;
  }
  uint64_t v11 = a1 + 40;
  int v12 = v5;
  int v13 = 0;
  CFStringRef v14 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 40), v5, 0x100u, 1u);
  int v10 = _MIDIInputPortCreate(v9);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v11);
  *(_DWORD *)(a2 + 32) = v10;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  if (!v10)
  {
    *(void *)(a2 + 24) = v8;
    *(_DWORD *)(a2 + 4) = 40;
    return;
  }
LABEL_11:
  *(void *)(a2 + 24) = v8;
}

void sub_1DD68A54C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

uint64_t _XClientDispose(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 36) {
    uint64_t result = 4294966992;
  }
  else {
    uint64_t result = _MIDIClientDispose((MIDIServer *)a1[8]);
  }
  *(_DWORD *)(a2 + 32) = result;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

void _XClientCreate(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((*(_DWORD *)a1 & 0x80000000) != 0
    || (uint64_t v3 = *(unsigned int *)(a1 + 4), v3 < 0x24)
    || v3 > 0x224
    || ((CFIndex v4 = *(unsigned int *)(a1 + 32), v4 <= 0x200)
      ? (BOOL v5 = (int)v3 - 36 >= v4)
      : (BOOL v5 = 0),
        v5 ? (BOOL v6 = v3 == ((v4 + 3) & 0xFFFFFFFC) + 36) : (BOOL v6 = 0),
        !v6))
  {
    int v7 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v7;
    uint64_t v8 = *MEMORY[0x1E4F14068];
    goto LABEL_13;
  }
  uint64_t v9 = ((v3 + 3) & 0x1FFFFFFFCLL) + a1;
  if (*(_DWORD *)v9 || *(_DWORD *)(v9 + 4) <= 0x1Fu)
  {
    int v7 = -309;
    goto LABEL_12;
  }
  long long v10 = *(_OWORD *)(v9 + 36);
  *(_OWORD *)v19.val = *(_OWORD *)(v9 + 20);
  *(_OWORD *)&v19.val[4] = v10;
  uint64_t v12 = a1 + 36;
  int v13 = v4;
  int v14 = 0;
  CFStringRef v15 = CFStringCreateWithBytes(0, (const UInt8 *)(a1 + 36), v4, 0x100u, 1u);
  uid_t euidp = 0;
  pid_t pidp = 0;
  audit_token_t atoken = v19;
  audit_token_to_au32(&atoken, 0, &euidp, 0, 0, 0, &pidp, 0, 0);
  int v11 = _MIDIClientCreate((MIDIServer *)pidp, (uint64_t)v15, (_DWORD *)(a2 + 36));
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)&v12);
  *(_DWORD *)(a2 + 32) = v11;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  if (!v11)
  {
    *(void *)(a2 + 24) = v8;
    *(_DWORD *)(a2 + 4) = 40;
    return;
  }
LABEL_13:
  *(void *)(a2 + 24) = v8;
}

void sub_1DD68A73C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IPCBufferReader::~IPCBufferReader((IPCBufferReader *)va);
  _Unwind_Resume(a1);
}

void _XAcknowledgeNotifications(_DWORD *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v5 = -304;
    goto LABEL_7;
  }
  int v4 = a1[6];
  uint64_t v3 = a1 + 6;
  if (v4 || v3[1] <= 0x1Fu)
  {
    int v5 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v5;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return;
  }
  long long v6 = *(_OWORD *)(v3 + 9);
  *(_OWORD *)v14.val = *(_OWORD *)(v3 + 5);
  *(_OWORD *)&v14.val[4] = v6;
  MIDIint Server = (MIDIServer *)getMIDIServer((MIDIServer *)v3);
  uint64_t v8 = MIDIServer::defaultInstance(MIDIServer);
  *(void *)pid_t pidp = 0;
  audit_token_t atoken = v14;
  audit_token_to_au32(&atoken, 0, (uid_t *)&pidp[1], 0, 0, 0, pidp, 0, 0);
  uint64_t v9 = v8[29];
  uint64_t v10 = v8[30];
  if (v9 != v10)
  {
    while (1)
    {
      uint64_t v11 = *(void *)v9;
      if (*(_DWORD *)(*(void *)v9 + 8) == pidp[0]) {
        break;
      }
      v9 += 8;
      if (v9 == v10) {
        goto LABEL_14;
      }
    }
    *(unsigned char *)(v11 + 320) = 0;
    if (*(void *)(v11 + 312)) {
      ClientProcess::DeliverNotifications((ClientProcess *)v11);
    }
  }
LABEL_14:
  *(_DWORD *)(a2 + 32) = 0;
}

uint64_t _XRegisterProcess(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 68)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112 && *(unsigned __int16 *)(result + 50) << 16 == 1114112)
    {
      if (!*(_DWORD *)(result + 68) && *(_DWORD *)(result + 72) >= 0x20u)
      {
        long long v3 = *(_OWORD *)(result + 104);
        v4[0] = *(_OWORD *)(result + 88);
        v4[1] = v3;
        MIDIServer_RegisterProcess((MIDIServer *)v4);
      }
      int v2 = -309;
    }
    else
    {
      int v2 = -300;
    }
  }
  else
  {
    int v2 = -304;
  }
  *(_DWORD *)(a2 + 32) = v2;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t (*MIDIIPC_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 8049) >= 0xFFFFFFCF) {
    return MIDIServer_MIDIIPC_subsystem[5 * (v1 - 8000) + 5];
  }
  else {
    return 0;
  }
}

uint64_t MIDIIPC_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 8049) >= 0xFFFFFFCF
    && (int v5 = (void (*)(void))MIDIServer_MIDIIPC_subsystem[5 * (v4 - 8000) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1F40D74A8](bundle, key, value, tableName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1F40D7538](bundleID);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7578](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFMachPortRef CFMachPortCreate(CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1F40D7C58](allocator, callout, context, shouldFreeInfo);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D7C60](allocator, port, order);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x1F40D7C78](port);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1F40D7D68]();
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x1F40D7D78](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPlugInRef CFPlugInCreate(CFAllocatorRef allocator, CFURLRef plugInURL)
{
  return (CFPlugInRef)MEMORY[0x1F40D7E40](allocator, plugInURL);
}

CFArrayRef CFPlugInFindFactoriesForPlugInTypeInPlugIn(CFUUIDRef typeUUID, CFPlugInRef plugIn)
{
  return (CFArrayRef)MEMORY[0x1F40D7E50](typeUUID, plugIn);
}

CFBundleRef CFPlugInGetBundle(CFPlugInRef plugIn)
{
  return (CFBundleRef)MEMORY[0x1F40D7E68](plugIn);
}

void *__cdecl CFPlugInInstanceCreate(CFAllocatorRef allocator, CFUUIDRef factoryUUID, CFUUIDRef typeUUID)
{
  return (void *)MEMORY[0x1F40D7E70](allocator, factoryUUID, typeUUID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F28](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x1F40D8180](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8390](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1F40D8460](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1F40D8770](url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D8848](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentationRelativeToBase(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D8850](allocator, buffer, bufLen, isDirectory, baseURL);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x1F40D89D0](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1F40D89E8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x1F40E8688](object, options);
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x1F40E8690](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86B8](*(void *)&connection, *(void *)&selector, *(void *)&wake_port, reference, *(void *)&referenceCnt, input, *(void *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86C8](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x1F40E86E8](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectRelease(io_connect_t connect)
{
  return MEMORY[0x1F40E86F0](*(void *)&connect);
}

kern_return_t IOConnectTrap3(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3)
{
  return MEMORY[0x1F40E8718](*(void *)&connect, *(void *)&index, p1, p2, p3);
}

kern_return_t IOConnectUnmapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x1F40E8738](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1F40E8EF0](*(void *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return MEMORY[0x1F40E8F50](*(void *)&object, *(void *)&anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1F40E8F68](*(void *)&object);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x1F40E9238](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t caulk::mach::os_eventlink::dissociate(caulk::mach::os_eventlink *this)
{
  return MEMORY[0x1F4177A30](this);
}

uint64_t caulk::mach::os_eventlink::signal_or_error(caulk::mach::os_eventlink *this)
{
  return MEMORY[0x1F4177A38](this);
}

uint64_t caulk::mach::os_eventlink::timed_wait_signal_or_error(caulk::mach::os_eventlink *this, double a2)
{
  return MEMORY[0x1F4177A40](this, a2);
}

uint64_t caulk::mach::os_eventlink::make()
{
  return MEMORY[0x1F4177A48]();
}

uint64_t caulk::mach::os_eventlink::associate(caulk::mach::os_eventlink *this)
{
  return MEMORY[0x1F4177A50](this);
}

uint64_t caulk::mach::details::release_os_object(caulk::mach::details *this, void *a2)
{
  return MEMORY[0x1F4177AC0](this, a2);
}

uint64_t caulk::mach::semaphore::signal_all_or_error(caulk::mach::semaphore *this)
{
  return MEMORY[0x1F4177AD0](this);
}

uint64_t caulk::mach::semaphore::timed_wait_or_error(caulk::mach::semaphore *this, double a2)
{
  return MEMORY[0x1F4177AD8](this, a2);
}

uint64_t caulk::mach::semaphore::semaphore(caulk::mach::semaphore *this)
{
  return MEMORY[0x1F4177AE8](this);
}

void caulk::mach::semaphore::~semaphore(caulk::mach::semaphore *this)
{
}

uint64_t caulk::alloc::get_realtime_safe_resource(caulk::alloc *this)
{
  return MEMORY[0x1F4177B08](this);
}

uint64_t caulk::thread::attributes::apply_to_this_thread(caulk::thread::attributes *this)
{
  return MEMORY[0x1F4177B20](this);
}

uint64_t caulk::thread::join(caulk::thread *this)
{
  return MEMORY[0x1F4177B28](this);
}

uint64_t caulk::thread::start(caulk::thread *this, caulk::thread::attributes *a2, void *(*a3)(void *), void *a4)
{
  return MEMORY[0x1F4177B30](this, a2, a3, a4);
}

uint64_t caulk::thread::thread()
{
  return MEMORY[0x1F4177B38]();
}

void caulk::thread::~thread(caulk::thread *this)
{
}

uint64_t caulk::thread::operator=()
{
  return MEMORY[0x1F4177B48]();
}

uint64_t caulk::mach::os_eventlink::copy_mach_port(caulk::mach::os_eventlink *this)
{
  return MEMORY[0x1F4177BB8](this);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x1F417E350](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return (const char *)MEMORY[0x1F417E430](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4C0](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1F417E4D8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4C8](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

{
  MEMORY[0x1F417E4F0](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

std::system_error *__cdecl std::system_error::system_error(std::system_error *this, int __ev, const std::error_category *__ecat, const char *__what_arg)
{
  return (std::system_error *)MEMORY[0x1F417E700](this, *(void *)&__ev, __ecat, __what_arg);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E868]();
}

{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8A0]();
}

{
  return MEMORY[0x1F417E8C0]();
}

{
  return MEMORY[0x1F417E8D0]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x1F417E908](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x1F417E918](this);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x1F417E9D0](this);
}

void std::recursive_mutex::~recursive_mutex(std::recursive_mutex *this)
{
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x1F417E9E0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void *__cdecl std::align(size_t __align, size_t __sz, void **__ptr, size_t *__space)
{
  return (void *)MEMORY[0x1F417EBF0](__align, __sz, __ptr, __space);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x1F417EC90]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x1F417EE78](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE88](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1F417EEA0]();
}

void std::bad_cast::~bad_cast(std::bad_cast *this)
{
}

void std::exception::~exception(std::exception *this)
{
}

int std::uncaught_exceptions(void)
{
  return MEMORY[0x1F417EF20]();
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
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

void operator new[]()
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1F417EF70](a1);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
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

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

uint64_t __udivti3()
{
  return MEMORY[0x1F40C9D08]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1F40C9F90]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2E8](atoken);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA538](*(void *)&bp, service_name, sp);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA548](*(void *)&bp, service_name, sp);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1F40CA550]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1F40CBD88]();
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CC1E8](*(void *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1F40CC2E0](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

FILE *__cdecl funopen(const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return (FILE *)MEMORY[0x1F40CC320](a1, a2, a3, a4, a5);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x1F40CC858]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1F40CCA08](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1F40CCA28](*(void *)&task, *(void *)&name, *(void *)&msgid, *(void *)&sync, *(void *)&notify, *(void *)&notifyPoly, previous);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40CCD70]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
}

uint64_t os_eventlink_associate()
{
  return MEMORY[0x1F40CD2D8]();
}

uint64_t os_eventlink_cancel()
{
  return MEMORY[0x1F40CD2E0]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD918](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x1F40CD920](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD930](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD940](a1, *(void *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1F40CD950](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD958](a1, *(void *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD978](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD980](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD990](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1F40CD9A0](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1F40CD9A8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x1F40CD9E0](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1F40CDA60](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA90](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1F40CDB60](a1);
}

int rand(void)
{
  return MEMORY[0x1F40CDC08]();
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1F40CDC68](a1, a2, a3);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

void rewind(FILE *a1)
{
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CDFE0](a1, *(void *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x1F40CDFE8](a1);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

void srand(unsigned int a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE148](__s1, __s2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1F40CE168](__dst, __src);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x1F40CE260](a1, a2);
  return result;
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2C0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1F40CE460](*(void *)&task, *(void *)&which_port, special_port);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1F40CE530](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1F40CE540](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1F40CE6A8](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x1F40CE8B0](__s, *(void *)&__c, __n);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBA8](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1F40CEBE8]();
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1F40CEBF8](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x1F40CF1C0]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x1F40CF1C8]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1F40CF208]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}