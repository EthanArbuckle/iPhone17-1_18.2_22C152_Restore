void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t PlatformUtilities_iOS::ProductSupportsClosedLoopHaptics(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

void sub_1BA904248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9046F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void std::__call_once_param<std::tuple<CADeprecated::TSingleton<AVFASoftLink>::instance(void)::{lambda(void)#1} &&>>::__execute[abi:ne180100]<>()
{
}

void sub_1BA904940(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9F2850](v1, 0x80C40C96DFCA5);
  _Unwind_Resume(a1);
}

void AVFASoftLink::AVFASoftLink(AVFASoftLink *this)
{
  *((_OWORD *)this + 1) = 0u;
  v2 = (id *)((char *)this + 16);
  v3 = (id *)((char *)this + 24);
  *((_OWORD *)this + 2) = 0u;
  v4 = (id *)((char *)this + 32);
  *(_OWORD *)this = 0u;
  v5 = (id *)((char *)this + 40);
  *((void *)this + 6) = 0;
  v6 = (id *)((char *)this + 48);
  v7 = dlopen("/System/Library/Frameworks/AVFoundation.framework/AVFoundation", 1);
  if (v7)
  {
    *(void *)this = NSClassFromString(&cfstr_Avaudioformat.isa);
    *((void *)this + 1) = NSClassFromString(&cfstr_Avaudiosession.isa);
    v8 = (id *)dlsym(v7, "AVAudioSessionMediaServicesWereResetNotification");
    if (v8) {
      objc_storeStrong(v3, *v8);
    }
    v9 = (id *)dlsym(v7, "AVAudioSessionMediaServicesWereLostNotification");
    if (v9) {
      objc_storeStrong(v2, *v9);
    }
    v10 = (id *)dlsym(v7, "AVAudioSessionCategorySystemSoundsAndHaptics");
    if (v10) {
      objc_storeStrong(v4, *v10);
    }
    v11 = (id *)dlsym(v7, "AVAudioSessionCategoryPlayback");
    if (v11) {
      objc_storeStrong(v5, *v11);
    }
    v12 = (id *)dlsym(v7, "AVAudioSessionModeHapticsConstantVolume");
    if (v12) {
      objc_storeStrong(v6, *v12);
    }
  }
}

void sub_1BA904AA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___Z20setupClientLogScopesv_block_invoke()
{
}

void sub_1BA904BE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___Z20setupHapticLogScopesv_block_invoke()
{
  int v0 = _os_feature_enabled_impl();
  uint64_t v1 = SecTaskCreateFromSelf(0);
  if (v1)
  {
    v2 = v1;
    CFBooleanRef v3 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v1, @"com.apple.coreaudio.LoadDecodersInProcess", 0);
    if (v3)
    {
      CFBooleanRef v4 = v3;
      CFTypeID v5 = CFGetTypeID(v3);
      BOOL v6 = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) != 0;
      CFRelease(v4);
    }
    else
    {
      BOOL v6 = 0;
    }
    CFRelease(v2);
    if (!v0) {
LABEL_13:
    }
      operator new();
  }
  else
  {
    BOOL v6 = 0;
    if (!v0) {
      goto LABEL_13;
    }
  }
  if (!v6) {
    AudioConverterPrepare();
  }
  goto LABEL_13;
}

void sub_1BA904E14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::vector<CASmartPreferences::Pref>::__emplace_back_slow_path<__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0x555555555555555) {
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * ((a1[2] - *a1) >> 4) > v6) {
    unint64_t v6 = 0x5555555555555556 * ((a1[2] - *a1) >> 4);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v10 = 0x555555555555555;
  }
  else {
    unint64_t v10 = v6;
  }
  v18 = a1 + 2;
  if (v10) {
    v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CASmartPreferences::Pref>>((uint64_t)(a1 + 2), v10);
  }
  else {
    v11 = 0;
  }
  v14 = v11;
  v15 = &v11[48 * v5];
  v17 = &v11[48 * v10];
  std::allocator<CASmartPreferences::Pref>::construct[abi:ne180100]<CASmartPreferences::Pref,__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &>((uint64_t)(a1 + 2), v15, a2, a3, a4);
  v16 = v15 + 48;
  std::vector<CASmartPreferences::Pref>::__swap_out_circular_buffer(a1, &v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<CASmartPreferences::Pref>::~__split_buffer((uint64_t)&v14);
  return v12;
}

void sub_1BA904F40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<CASmartPreferences::Pref>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *CALog::Scope::SetPriorityThresholdFromPreference(CALog::Scope *this, __CFString *a2, __CFString *a3)
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1F14529A0;
  v4[1] = this;
  v4[3] = v4;
  CASmartPreferences::AddHandler<int>((CASmartPreferences *)a3, a2, (uint64_t)CALog::PrefValueToPriority, (uint64_t)v4);
  return std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](v4);
}

void sub_1BA904FEC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *CASmartPreferences::AddHandler<int>(CASmartPreferences *a1, __CFString *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v8 = CASmartPreferences::instance(a1);
  std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)v11, a4);
  v13 = 0;
  v9 = operator new(0x30uLL);
  void *v9 = &unk_1F1452948;
  v9[1] = a3;
  std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)(v9 + 2), (uint64_t)v11);
  v13 = v9;
  CASmartPreferences::_RegisterFirstHandler((uint64_t)v8, a1, a2, (uint64_t)v12);
  std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100](v12);
  return std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](v11);
}

void sub_1BA9050F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100]((uint64_t *)va);
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](v6);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  CFBooleanRef v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    CFBooleanRef v3 = (void *)(a1 + 24);
  }
  void *v3 = 0;
  return a1;
}

{
  uint64_t v3;

  CFBooleanRef v3 = *(void *)(a2 + 24);
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

void *CASmartPreferences::instance(CASmartPreferences *this)
{
  {
    CASmartPreferences::CASmartPreferences((CASmartPreferences *)&CASmartPreferences::instance(void)::global);
  }
  return &CASmartPreferences::instance(void)::global;
}

void sub_1BA9051FC(_Unwind_Exception *a1)
{
}

void CASmartPreferences::_RegisterFirstHandler(uint64_t a1, const void *a2, __CFString *a3, uint64_t a4)
{
  value = a3;
  v11 = a2;
  std::mutex::lock((std::mutex *)a1);
  if ((CASmartPreferences::HavePref((CASmartPreferences *)a1, a2, a3) & 1) == 0)
  {
    CFRetain(a2);
    CFRetain(a3);
    unint64_t v8 = *(void *)(a1 + 80);
    if (v8 >= *(void *)(a1 + 88))
    {
      uint64_t v9 = std::vector<CASmartPreferences::Pref>::__emplace_back_slow_path<__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &>((uint64_t *)(a1 + 72), (uint64_t *)&v11, (uint64_t *)&value, a4);
    }
    else
    {
      std::allocator<CASmartPreferences::Pref>::construct[abi:ne180100]<CASmartPreferences::Pref,__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &>(a1 + 88, *(void **)(a1 + 80), (uint64_t *)&v11, (uint64_t *)&value, a4);
      uint64_t v9 = v8 + 48;
      *(void *)(a1 + 80) = v8 + 48;
    }
    *(void *)(a1 + 80) = v9;
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 64), value);
    CASmartPreferences::Pref::Load((CFStringRef *)(*(void *)(a1 + 80) - 48));
  }
  std::mutex::unlock((std::mutex *)a1);
}

void sub_1BA9052E8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 80) = v2;
  std::mutex::unlock((std::mutex *)v1);
  _Unwind_Resume(a1);
}

uint64_t CASmartPreferences::HavePref(CASmartPreferences *this, CFTypeRef cf1, const __CFString *a3)
{
  CFBooleanRef v3 = (CFTypeRef *)*((void *)this + 9);
  uint64_t v4 = (CFTypeRef *)*((void *)this + 10);
  if (v3 == v4) {
    return 0;
  }
  while (!CFEqual(cf1, *v3) || !CFEqual(a3, v3[1]))
  {
    v3 += 6;
    if (v3 == v4) {
      return 0;
    }
  }
  return 1;
}

CFPropertyListRef CASmartPreferences::Pref::Load(CFStringRef *this)
{
  CFPropertyListRef result = CFPreferencesCopyAppValue(*this, this[1]);
  if (result)
  {
    return (CFPropertyListRef)std::function<BOOL ()(void const*)>::operator()((uint64_t)(this + 2), (uint64_t)result);
  }
  return result;
}

void *std::allocator<CASmartPreferences::Pref>::construct[abi:ne180100]<CASmartPreferences::Pref,__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &>(uint64_t a1, void *a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *a3;
  uint64_t v7 = *a4;
  std::__function::__value_func<BOOL ()(void const*)>::__value_func[abi:ne180100]((uint64_t)v9, a5);
  *a2 = v6;
  a2[1] = v7;
  std::__function::__value_func<BOOL ()(void const*)>::__value_func[abi:ne180100]((uint64_t)(a2 + 2), (uint64_t)v9);
  return std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100](v9);
}

void sub_1BA905454(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<BOOL ()(void const*)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
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

{
  void *v3;
  uint64_t v4;

  uint64_t v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }
  CFTypeRef *v3 = 0;
  return a1;
}

void *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::__clone(uint64_t a1)
{
  uint64_t v2 = operator new(0x30uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *v2 = &unk_1F1452948;
  v2[1] = v3;
  std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_1BA905560(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1F14529A0;
  a2[1] = v2;
  return result;
}

uint64_t *std::vector<CASmartPreferences::Pref>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v5 = *result;
  uint64_t v4 = result[1];
  uint64_t v6 = a2[1];
  if (v4 == *result)
  {
    uint64_t v7 = a2[1];
  }
  else
  {
    do
    {
      uint64_t v7 = v6 - 48;
      uint64_t v8 = v4 - 48;
      *(_OWORD *)(v6 - 48) = *(_OWORD *)(v4 - 48);
      CFPropertyListRef result = (uint64_t *)std::__function::__value_func<BOOL ()(void const*)>::__value_func[abi:ne180100](v6 - 32, v4 - 32);
      uint64_t v4 = v8;
      uint64_t v6 = v7;
    }
    while (v8 != v5);
  }
  a2[1] = v7;
  uint64_t v9 = *v3;
  uint64_t *v3 = v7;
  a2[1] = v9;
  uint64_t v10 = v3[1];
  v3[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = v3[2];
  v3[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CASmartPreferences::Pref>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

uint64_t std::__split_buffer<CASmartPreferences::Pref>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 48;
    std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100]((void *)(i - 32));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::destroy_deallocate(void *a1)
{
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](a1 + 2);

  operator delete(a1);
}

void *std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](void *a1)
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

void CASmartPreferences::CASmartPreferences(CASmartPreferences *this)
{
  *(void *)this = 850045863;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = CFSetCreateMutable(0, 0, MEMORY[0x1E4F1D548]);
  global_queue = dispatch_get_global_queue(0, 0);
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  uint64_t v3 = dispatch_source_create(MEMORY[0x1E4F14480], 1uLL, 0, global_queue);
  *((void *)this + 12) = v3;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 0x40000000;
  handler[2] = ___ZN18CASmartPreferencesC2Ev_block_invoke;
  handler[3] = &__block_descriptor_tmp_0;
  handler[4] = this;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_resume(*((dispatch_object_t *)this + 12));
}

void sub_1BA905A34(_Unwind_Exception *a1)
{
  std::mutex::~mutex(v1);
  _Unwind_Resume(a1);
}

void sub_1BA90661C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,void *a41)
{
  *(void *)(v45 - 248) = a1;

  _Unwind_Resume(*(_Unwind_Exception **)(v45 - 248));
}

void sub_1BA907364(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  if (a2 == 1)
  {
    v26 = (NSException *)objc_begin_catch(a1);
    v28 = CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v27);
    v29 = v28;
    if (v28 && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)(v23 - 160) = 136315650;
      uint64_t v30 = v23 - 160;
      *(void *)(v30 + 4) = "HapticServerConfig.mm";
      *(_WORD *)(v23 - 148) = 1024;
      *(_DWORD *)(v30 + 14) = 174;
      *(_WORD *)(v23 - 142) = 2080;
      *(void *)(v30 + 20) = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]_block_invoke";
      _os_log_impl(&dword_1BA902000, v29, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Caught exception during dictionary parse", (uint8_t *)(v23 - 160), 0x1Cu);
    }

    uint64_t v31 = NSErrorFromNSException(v26);
    uint64_t v32 = *(void *)(*(void *)(v20 + 48) + 8);
    v33 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = v31;

    objc_end_catch();
    JUMPOUT(0x1BA9072F4);
  }

  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__assign_unique<std::pair<AVHapticPlayerEventType const,NSString * {__strong}> const*>(void *a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = a1[1];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
      *(void *)(*a1 + 8 * i) = 0;
    uint64_t v8 = (id *)a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8) {
      BOOL v9 = a2 == a3;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      uint64_t v10 = v8;
    }
    else
    {
      do
      {
        uint64_t v11 = (void *)v4[1];
        v8[2] = (id)*v4;
        objc_storeStrong(v8 + 3, v11);
        uint64_t v10 = (id *)*v8;
        std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__node_insert_unique(a1, v8);
        v4 += 2;
        if (v10) {
          BOOL v12 = v4 == a3;
        }
        else {
          BOOL v12 = 1;
        }
        uint64_t v8 = v10;
      }
      while (!v12);
    }
    std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__deallocate_node((uint64_t)a1, v10);
  }
  while (v4 != a3)
  {
    std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__emplace_unique_key_args<AVHapticPlayerEventType,std::pair<AVHapticPlayerEventType const,NSString * {__strong}> const&>((uint64_t)a1, v4, v4);
    v4 += 2;
  }
}

void sub_1BA90772C(void *a1)
{
  __cxa_begin_catch(a1);
  std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__deallocate_node(v1, v2);
  __cxa_rethrow();
}

void sub_1BA907744(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__emplace_unique_key_args<AVHapticPlayerEventType,std::pair<AVHapticPlayerEventType const,NSString * {__strong}> const&>(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    BOOL v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  BOOL v12 = (void *)(a1 + 16);
  uint64_t i = operator new(0x20uLL);
  *uint64_t i = 0;
  i[1] = v6;
  v13 = (void *)a3[1];
  i[2] = *a3;
  i[3] = v13;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v7 || (float)(v15 * (float)v7) < v14)
  {
    BOOL v16 = 1;
    if (v7 >= 3) {
      BOOL v16 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v7);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__rehash<true>(a1, v19);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v20 = *(void *)a1;
  v21 = *(void **)(*(void *)a1 + 8 * v3);
  if (v21)
  {
    *uint64_t i = *v21;
LABEL_38:
    void *v21 = i;
    goto LABEL_39;
  }
  *uint64_t i = *v12;
  void *v12 = i;
  *(void *)(v20 + 8 * v3) = v12;
  if (*i)
  {
    unint64_t v22 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v22 >= v7) {
        v22 %= v7;
      }
    }
    else
    {
      v22 &= v7 - 1;
    }
    v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1BA90798C(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void sub_1BA907DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA907E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *__copy_helper_atomic_property_(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(a1, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
}

void sub_1BA908188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA908444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9086C4(_Unwind_Exception *a1)
{
  unint64_t v5 = v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1BA908D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  _Unwind_Resume(a1);
}

void sub_1BA908EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA9093E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

void sub_1BA909578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9098B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1BA909BD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA909DE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA909FE0(_Unwind_Exception *a1)
{
  int8x8_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BA90A180(_Unwind_Exception *a1)
{
  int8x8_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BA90A494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA90A858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_sync_exit(v22);
  _Unwind_Resume(a1);
}

void sub_1BA90ABE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BA90AD48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  objc_destroyWeak(v13);
  objc_destroyWeak((id *)(v15 - 40));
  _Unwind_Resume(a1);
}

void sub_1BA90AEA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA90AFE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA90B330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_1BA90B5A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA90B8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1BA90BA1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  objc_destroyWeak(v13);
  objc_destroyWeak((id *)(v15 - 40));
  _Unwind_Resume(a1);
}

void sub_1BA90BD10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  _Unwind_Resume(a1);
}

void *__copy_helper_atomic_property__67(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(a1, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
}

void *__copy_helper_atomic_property__66(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(a1, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
}

void sub_1BA90C030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA90C428()
{
}

void sub_1BA90C99C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA90CDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1BA90D654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id a31)
{
  v37 = v33;

  objc_destroyWeak(v34);
  objc_destroyWeak(v31);
  _Block_object_dispose(&a26, 8);

  objc_destroyWeak((id *)(v36 - 152));
  _Unwind_Resume(a1);
}

void sub_1BA90D7E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA90DB2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA90DD64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA90DEF0(_Unwind_Exception *exception_object)
{
}

void sub_1BA90DFC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1BA90E2BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA90ED6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose((const void *)(v42 - 176), 8);

  objc_destroyWeak(v39);
  objc_destroyWeak(location);
  objc_destroyWeak(&a38);

  _Unwind_Resume(a1);
}

void sub_1BA90F04C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA90F3E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA90FA44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_signpost_id_t spid, uint64_t a11, uint64_t a12, uint8_t buf)
{
  _Unwind_Resume(a1);
}

void sub_1BA910004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BA910448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1BA910884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA910B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1BA91141C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CALog::Scope::oslog(id *this)
{
  return *this;
}

id AVFASoftLink::getAVAudioSession(AVFASoftLink *this)
{
  uint64_t v1 = *(void **)(CADeprecated::TSingleton<AVFASoftLink>::instance() + 8);

  return v1;
}

uint64_t CADeprecated::TSingleton<AVFASoftLink>::instance()
{
  if (atomic_load_explicit((atomic_ullong *volatile)&CADeprecated::TSingleton<AVFASoftLink>::sOnce, memory_order_acquire) != -1)
  {
    unint64_t v3 = &v1;
    uint64_t v2 = &v3;
    std::__call_once(&CADeprecated::TSingleton<AVFASoftLink>::sOnce, &v2, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<CADeprecated::TSingleton<AVFASoftLink>::instance(void)::{lambda(void)#1} &&>>);
  }
  return CADeprecated::TSingleton<AVFASoftLink>::sInstance;
}

void sub_1BA911734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA911E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA911EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA912080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA9121C0(_Unwind_Exception *exception_object)
{
}

void sub_1BA9122AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id AVFASoftLink::getAVAudioSessionMediaServicesWereResetNotification(AVFASoftLink *this)
{
  char v1 = *(void **)(CADeprecated::TSingleton<AVFASoftLink>::instance() + 24);

  return v1;
}

id AVFASoftLink::getAVAudioSessionMediaServicesWereLostNotification(AVFASoftLink *this)
{
  char v1 = *(void **)(CADeprecated::TSingleton<AVFASoftLink>::instance() + 16);

  return v1;
}

void sub_1BA912568(_Unwind_Exception *a1)
{
  unint64_t v5 = v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1BA912804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  _Unwind_Resume(a1);
}

void sub_1BA912B70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9131B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA913D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1BA9140E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA914240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9149F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, uint64_t a11, void *a12, void *a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  _Unwind_Resume(a1);
}

void *std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    CFPropertyListRef result = std::vector<unsigned long>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      CFPropertyListRef result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1BA914BAC(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned long>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  }
  CFPropertyListRef result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void sub_1BA914CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA915624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29)
{
  _Unwind_Resume(a1);
}

void sub_1BA915880(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA916520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1BA91682C(_Unwind_Exception *a1)
{
  unint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BA916A24(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BA916D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA91711C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BA9172A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9173E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA917610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9177A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA917C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA917CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA917EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA918FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1BA919100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA91917C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA919204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA91933C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA919478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9195F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA919890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BA919B1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA919CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA919FC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA91A140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA91A340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA91A514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA91A9E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  _Unwind_Resume(a1);
}

void sub_1BA91AABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA91AB4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void setupHapticLogScopes(void)
{
  if (setupHapticLogScopes(void)::once != -1) {
    dispatch_once(&setupHapticLogScopes(void)::once, &__block_literal_global_2);
  }
}

void startEventFromEvent(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a1;
  id v7 = a2;
  v40 = v6;
  uint64_t v8 = [v6 fixedParamCount];
  int v42 = 0;
  memset(v41, 0, sizeof(v41));
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v36 = v8;
    uint64_t v10 = v8;
    unint64_t v11 = (_DWORD *)([v40 fixedParams] + 8);
    unint64_t v12 = (float *)v41 + 2;
    do
    {
      uint64_t v13 = *((void *)v11 - 1);
      *((_DWORD *)v12 - 1) = v13;
      if (v7)
      {
        float v14 = [NSNumber numberWithUnsignedInt:v13];
        uint64_t v15 = [v7 objectForKey:v14];

        if (v15)
        {
          float v16 = *(float *)v11;
          [v15 floatValue];
          applyImmediateParameters(v16, v17, v13);
        }
      }
      clientParamValueToFixedParamValue();
      float v19 = v18;
      float *v12 = v18;
      if (kAVHCScope)
      {
        if (*(unsigned char *)(kAVHCScope + 8))
        {
          uint64_t v20 = *(id *)kAVHCScope;
          if (v20)
          {
            v21 = v20;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136316418;
              v44 = "AVHapticClient.mm";
              __int16 v45 = 1024;
              int v46 = 533;
              __int16 v47 = 2080;
              v48 = "startEventFromEvent";
              __int16 v49 = 1024;
              *(_DWORD *)v50 = v9;
              *(_WORD *)&v50[4] = 1024;
              *(_DWORD *)&v50[6] = v13;
              LOWORD(v51[0]) = 2048;
              *(double *)((char *)v51 + 2) = v19;
              _os_log_impl(&dword_1BA902000, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Copied fixed param[%d]: ID %d, normalized value %f, for start event", buf, 0x32u);
            }
          }
        }
      }
      ++v9;
      v11 += 4;
      v12 += 2;
    }
    while (v10 != v9);
    LODWORD(v41[0]) = v36;
    unint64_t v22 = v41;
  }
  else
  {
    unint64_t v22 = 0;
  }
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v23 = *(id *)kAVHCScope;
      if (v23)
      {
        v24 = v23;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          [v40 time];
          uint64_t v26 = v25;
          int v27 = [v40 eventType];
          *(_DWORD *)buf = 136316162;
          v44 = "AVHapticClient.mm";
          __int16 v45 = 1024;
          int v46 = 538;
          __int16 v47 = 2080;
          v48 = "startEventFromEvent";
          __int16 v49 = 2048;
          *(void *)v50 = v26;
          *(_WORD *)&v50[8] = 1024;
          v51[0] = v27;
          _os_log_impl(&dword_1BA902000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating start event at relative time %f for eventID: %u", buf, 0x2Cu);
        }
      }
    }
  }
  objc_msgSend(v40, "time", v36);
  uint64_t v29 = v28;
  uint64_t v30 = [v40 eventType];
  if (v22)
  {
    long long v31 = *v22;
    uint64_t v32 = a5;
    *(_OWORD *)(a5 + 56) = v22[1];
    long long v33 = v22[3];
    *(_OWORD *)(a5 + 72) = v22[2];
    *(_OWORD *)(a5 + 88) = v33;
    __int16 v34 = 8 * *(_WORD *)v22 + 44;
    *(_DWORD *)(a5 + 104) = *((_DWORD *)v22 + 16);
    *(_OWORD *)(a5 + 40) = v31;
    int v35 = v34 & 0xFFFC | 0x10000;
  }
  else
  {
    uint64_t v32 = a5;
    *(_DWORD *)(a5 + 104) = 0;
    *(_OWORD *)(a5 + 88) = 0u;
    *(_OWORD *)(a5 + 72) = 0u;
    *(_OWORD *)(a5 + 56) = 0u;
    *(_OWORD *)(a5 + 40) = 0u;
    int v35 = 65648;
  }
  *(_DWORD *)uint64_t v32 = v35;
  *(void *)(v32 + 8) = v29;
  *(void *)(v32 + 16) = a3;
  *(void *)(v32 + 24) = v30;
  *(void *)(v32 + 32) = a4;
}

void sub_1BA91AF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BA91B1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)PatternPlayer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA91B3C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA91B4D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA91B564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA91C0D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA91C57C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA91C6BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA91C830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BA91CA0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA91CB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BA91CE10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA91CEDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA91CFC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA91D258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA91D550(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);

  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v5 - 72));
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA91DACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,id location)
{
  _Unwind_Resume(a1);
}

void sub_1BA91DDF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BA91DFF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BA91E1AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA91E254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA91E2C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA91E5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_1BA91ECB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1BA91F094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BA91F180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA91F248(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA91F3EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA91F73C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);

  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

void sub_1BA91FA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1BA91FE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1BA920504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CALog::LogObjIfEnabled(CALog *this, uint64_t a2, const CALog::Scope *a3)
{
  if ((int)this < 6)
  {
    if (!a2)
    {
      id v3 = (id)MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (a2)
  {
    uint64_t v5 = 1;
    if (this != 6) {
      uint64_t v5 = 2;
    }
    if ((*(void *)(a2 + 8) & v5) != 0)
    {
LABEL_8:
      id v3 = *(id *)a2;
      goto LABEL_10;
    }
  }
  id v3 = 0;
LABEL_10:

  return v3;
}

void sub_1BA920678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BA920968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void NSExceptionToNSError(void *a1, void *a2)
{
  id v3 = a1;
  if (a2)
  {
    id v4 = v3;
    NSErrorFromNSException(v3);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = v4;
  }
}

void sub_1BA920A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

BOOL _Haptic_Check(uint64_t a1, uint64_t a2, const char *a3, const char *a4, int a5, void *a6)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a5) {
    return a5 == 0;
  }
  if (!kHAPIScope)
  {
    uint64_t v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
    goto LABEL_6;
  }
  uint64_t v10 = *(id *)kHAPIScope;
  if (v10)
  {
LABEL_6:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      float v19 = "HapticUtils.h";
      __int16 v20 = 1024;
      int v21 = 61;
      __int16 v22 = 2080;
      id v23 = "_Haptic_Check";
      __int16 v24 = 2080;
      uint64_t v25 = a3;
      __int16 v26 = 2080;
      int v27 = a4;
      __int16 v28 = 1024;
      int v29 = a5;
      _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: %s: %s error %d", buf, 0x36u);
    }
  }
  if (!a6)
  {
    snprintf((char *)buf, 0x400uLL, "%s: %s", a3, a4);
    float v16 = [NSString stringWithCString:buf encoding:1];
    Haptic_RaiseException(&cfstr_ComAppleCoreha.isa, v16, a5);
  }
  unint64_t v12 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
  float v14 = [NSString stringWithUTF8String:a4];
  uint64_t v15 = objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, @"Error ", 0);
  *a6 = [v12 errorWithDomain:@"com.apple.CoreHaptics" code:a5 userInfo:v15];

  return a5 == 0;
}

void sub_1BA920D94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA921110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA921464()
{
  objc_end_catch();

  JUMPOUT(0x1BA921484);
}

void sub_1BA921470()
{
}

void sub_1BA92178C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA921B70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA921FDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA922134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id NSErrorFromNSException(NSException *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = [(NSException *)v1 name];
  char v3 = [v2 isEqual:*MEMORY[0x1E4F1C3C8]];

  if (v3)
  {
    int v4 = -4814;
  }
  else
  {
    uint64_t v5 = [(NSException *)v1 userInfo];
    id v6 = [v5 objectForKey:@"OSStatus"];
    id v7 = v6;
    if (v6)
    {
      int v4 = [v6 integerValue];

      if (!v4)
      {
        uint64_t v8 = 0;
        goto LABEL_8;
      }
    }
    else
    {

      int v4 = -4898;
    }
  }
  uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:v4 userInfo:0];
LABEL_8:

  return v8;
}

void sub_1BA92222C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void Haptic_RaiseException(NSString *a1, NSString *a2, int a3)
{
  uint64_t v5 = a1;
  id v6 = a2;
  id v7 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v8 = [NSNumber numberWithInteger:a3];
  uint64_t v9 = [v7 dictionaryWithObject:v8 forKey:@"OSStatus"];

  id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:v5 reason:v6 userInfo:v9];
  objc_exception_throw(v10);
}

void sub_1BA9222F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA922508(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BA9226D0(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BA922898(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BA922AB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CATimeUtilities::GetCurrentGregorianDate(CATimeUtilities *this)
{
  double Current = CFAbsoluteTimeGetCurrent();

  return CATimeUtilities::GregorianDateFromAbsoluteTime(v1, Current);
}

uint64_t CATimeUtilities::GregorianDateFromAbsoluteTime(CATimeUtilities *this, CFAbsoluteTime a2)
{
  {
    CATimeUtilities::GregorianDateFromAbsoluteTime(double)::tz = (uint64_t)CFTimeZoneCopySystem();
  }
  CFTimeZoneRef v3 = (const __CFTimeZone *)CATimeUtilities::GregorianDateFromAbsoluteTime(double)::tz;

  return *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(a2, v3);
}

void sub_1BA922B7C(_Unwind_Exception *a1)
{
}

void sub_1BA922C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<unsigned long>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E622DE08, MEMORY[0x1E4FBA1C8]);
}

void sub_1BA922E94(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  CFPropertyListRef result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void sub_1BA923120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA923290(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA9237AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BA9239D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)AdvancedPatternPlayer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA923D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA923FF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9241F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9243FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA924734(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA924B10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA92500C()
{
}

void sub_1BA9251A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9253EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA92561C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA925888(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA925A58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA925C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA925E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA926008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BA9261F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9265A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA926818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void AudioResource::AudioResource(AudioResource *this, NSURL *a2)
{
  CFTimeZoneRef v3 = a2;
  *((void *)this + 8) = 0;
  *((unsigned char *)this + 72) = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = v3;
}

void AudioResource::~AudioResource(AudioResource *this)
{
  if (*((unsigned char *)this + 72))
  {
    AudioResource::decrementAllocatedBytes((AudioResource *)(4
                                                           * *((void *)this + 2)
                                                           * *((unsigned int *)this + 13)));
    *((unsigned char *)this + 72) = 0;
  }
  uint64_t v2 = (OpaqueExtAudioFile *)*((void *)this + 1);
  if (v2)
  {
    ExtAudioFileDispose(v2);
    *((void *)this + 1) = 0;
  }
}

void AudioResource::decrementAllocatedBytes(AudioResource *this)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!this) {
    return;
  }
  AudioResource::getTotalAllocationLock(this);
  std::mutex::lock(&AudioResource::getTotalAllocationLock(void)::sMutex);
  if (!kHAPIScope)
  {
    uint64_t v2 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
    goto LABEL_6;
  }
  uint64_t v2 = *(id *)kHAPIScope;
  if (v2)
  {
LABEL_6:
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v4 = 136316162;
      uint64_t v5 = "AudioResource.mm";
      __int16 v6 = 1024;
      int v7 = 153;
      __int16 v8 = 2080;
      uint64_t v9 = "decrementAllocatedBytes";
      __int16 v10 = 2048;
      id v11 = this;
      __int16 v12 = 2048;
      uint64_t v13 = AudioResource::_sTotalAllocatedBytes;
      _os_log_impl(&dword_1BA902000, v2, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Removing %llu bytes from our existing %llu", (uint8_t *)&v4, 0x30u);
    }
  }
  if (AudioResource::_sTotalAllocatedBytes < (unint64_t)this) {
    AudioResource::decrementAllocatedBytes();
  }
  AudioResource::_sTotalAllocatedBytes -= (uint64_t)this;
  std::mutex::unlock(&AudioResource::getTotalAllocationLock(void)::sMutex);
}

OpaqueExtAudioFile *AudioResource::close(AudioResource *this)
{
  CFPropertyListRef result = (OpaqueExtAudioFile *)*((void *)this + 1);
  if (result)
  {
    CFPropertyListRef result = (OpaqueExtAudioFile *)ExtAudioFileDispose(result);
    *((void *)this + 1) = 0;
  }
  return result;
}

uint64_t AudioResource::open(AudioResource *this)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*((void *)this + 1)) {
    return 0;
  }
  OSStatus v3 = ExtAudioFileOpenURL(*(CFURLRef *)this, (ExtAudioFileRef *)this + 1);
  if (!v3) {
    return 0;
  }
  if (!kHAPIScope)
  {
    int v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
    goto LABEL_8;
  }
  int v4 = *(id *)kHAPIScope;
  if (v4)
  {
LABEL_8:
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)this;
      int v7 = 136316162;
      __int16 v8 = "AudioResource.mm";
      __int16 v9 = 1024;
      int v10 = 50;
      __int16 v11 = 2080;
      __int16 v12 = "open";
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 1024;
      OSStatus v16 = v3;
      _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Failed to open audio resource %@: %u", (uint8_t *)&v7, 0x2Cu);
    }
  }
  return 4294962472;
}

uint64_t AudioResource::verifyAudioFile(ExtAudioFileRef *this, int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = AudioResource::open((AudioResource *)this);
  if (v4) {
    return v4;
  }
  UInt32 ioPropertyDataSize = 40;
  uint64_t Property = ExtAudioFileGetProperty(this[1], 0x66666D74u, &ioPropertyDataSize, this + 3);
  this[8] = this[3];
  if (Property)
  {
    uint64_t v4 = Property;
    if (kHAPIScope)
    {
      uint64_t v6 = *(id *)kHAPIScope;
      if (!v6) {
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    ExtAudioFileRef v8 = *this;
    *(_DWORD *)buf = 136315906;
    __int16 v15 = "AudioResource.mm";
    __int16 v16 = 1024;
    int v17 = 75;
    __int16 v18 = 2080;
    float v19 = "verifyAudioFile";
    __int16 v20 = 2112;
    ExtAudioFileRef v21 = v8;
    goto LABEL_16;
  }
  UInt32 ioPropertyDataSize = 8;
  uint64_t v4 = ExtAudioFileGetProperty(this[1], 0x2366726Du, &ioPropertyDataSize, this + 2);
  if (v4)
  {
    if (kHAPIScope)
    {
      uint64_t v6 = *(id *)kHAPIScope;
      if (!v6) {
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v6 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    ExtAudioFileRef v10 = *this;
    *(_DWORD *)buf = 136315906;
    __int16 v15 = "AudioResource.mm";
    __int16 v16 = 1024;
    int v17 = 81;
    __int16 v18 = 2080;
    float v19 = "verifyAudioFile";
    __int16 v20 = 2112;
    ExtAudioFileRef v21 = v10;
LABEL_16:
    _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Failed to get property for audio resource %@", buf, 0x26u);
LABEL_17:
  }
LABEL_18:
  if (a2)
  {
    __int16 v11 = this[1];
    if (v11)
    {
      ExtAudioFileDispose(v11);
      this[1] = 0;
    }
  }
  return v4;
}

uint64_t AudioResource::readAndAllocateRawBuffer(AudioResource *this, char **a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  *a2 = 0;
  uint64_t v16 = 0;
  unsigned int v3 = *((_DWORD *)this + 13);
  inPropertyData[0] = *((void *)this + 3);
  inPropertyData[1] = 0x96C70636DLL;
  int v12 = 4 * v3;
  int v13 = 1;
  int v14 = 4 * v3;
  unsigned int v15 = v3;
  LODWORD(v16) = 32;
  uint64_t v4 = ExtAudioFileSetProperty(*((ExtAudioFileRef *)this + 1), 0x63666D74u, 0x28u, inPropertyData);
  if (v4)
  {
    uint64_t v5 = v4;
    if (kHAPIScope)
    {
      uint64_t v6 = *(id *)kHAPIScope;
      if (!v6)
      {
LABEL_11:
        id v9 = (OpaqueExtAudioFile *)*((void *)this + 1);
        if (v9)
        {
          ExtAudioFileDispose(v9);
          *((void *)this + 1) = 0;
        }
        return v5;
      }
    }
    else
    {
      uint64_t v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)this;
      *(_DWORD *)buf = 136315906;
      __int16 v18 = "AudioResource.mm";
      __int16 v19 = 1024;
      int v20 = 99;
      __int16 v21 = 2080;
      uint64_t v22 = "readAndAllocateRawBuffer";
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Failed to set property on audio resource %@", buf, 0x26u);
    }

    goto LABEL_11;
  }
  uint64_t v5 = AudioResource::incrementAllocatedBytes((AudioResource *)(4 * *((void *)this + 2) * v15));
  if (!v5) {
    operator new[]();
  }
  return v5;
}

uint64_t AudioResource::incrementAllocatedBytes(AudioResource *this)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  AudioResource::getTotalAllocationLock(this);
  std::mutex::lock(&AudioResource::getTotalAllocationLock(void)::sMutex);
  if (kHAPIScope)
  {
    uint64_t v2 = *(id *)kHAPIScope;
    if (!v2) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v11 = 136316162;
    int v12 = "AudioResource.mm";
    __int16 v13 = 1024;
    int v14 = 139;
    __int16 v15 = 2080;
    uint64_t v16 = "incrementAllocatedBytes";
    __int16 v17 = 2048;
    __int16 v18 = this;
    __int16 v19 = 2048;
    uint64_t v20 = AudioResource::_sTotalAllocatedBytes;
    _os_log_impl(&dword_1BA902000, v2, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Adding %llu bytes to our existing %llu", (uint8_t *)&v11, 0x30u);
  }

LABEL_8:
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ignore_custom_audio_limit", @"com.apple.corehaptics", 0);
  uint64_t v5 = (char *)this + AudioResource::_sTotalAllocatedBytes;
  if ((unint64_t)this + AudioResource::_sTotalAllocatedBytes > 0x800000 && AppBooleanValue == 0)
  {
    if (kHAPIScope)
    {
      uint64_t v8 = *(id *)kHAPIScope;
      if (!v8)
      {
LABEL_20:
        uint64_t v7 = 4294962471;
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315650;
      int v12 = "AudioResource.mm";
      __int16 v13 = 1024;
      int v14 = 142;
      __int16 v15 = 2080;
      uint64_t v16 = "incrementAllocatedBytes";
      _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Memory limit reached on custom audio resources - unregister others to make space", (uint8_t *)&v11, 0x1Cu);
    }

    goto LABEL_20;
  }
  uint64_t v7 = 0;
  AudioResource::_sTotalAllocatedBytes = (uint64_t)v5;
LABEL_21:
  std::mutex::unlock(&AudioResource::getTotalAllocationLock(void)::sMutex);
  return v7;
}

void sub_1BA9275AC(_Unwind_Exception *a1)
{
}

void *AudioResource::getTotalAllocationLock(AudioResource *this)
{
  {
    __cxa_atexit(MEMORY[0x1E4FBA268], &AudioResource::getTotalAllocationLock(void)::sMutex, &dword_1BA902000);
  }
  return &AudioResource::getTotalAllocationLock(void)::sMutex;
}

uint64_t CALog::PrefValueToPriority(const __CFString *this, BOOL *a2, BOOL *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int valuePtr = -1;
  CFTypeID v5 = CFGetTypeID(this);
  if (v5 == CFNumberGetTypeID())
  {
    CFNumberGetValue((CFNumberRef)this, kCFNumberIntType, &valuePtr);
    int v6 = valuePtr + 3;
  }
  else
  {
    if (v5 != CFStringGetTypeID()) {
      goto LABEL_22;
    }
    if (CFEqual(this, @"error"))
    {
      int v6 = 1;
      goto LABEL_23;
    }
    if (CFEqual(this, @"warning"))
    {
      int v6 = 2;
      goto LABEL_23;
    }
    if (CFEqual(this, @"note") || CFEqual(this, @"notice"))
    {
      int v6 = 3;
      goto LABEL_23;
    }
    if (CFEqual(this, @"info"))
    {
      int v6 = 4;
      goto LABEL_23;
    }
    if (CFEqual(this, @"details"))
    {
      int v6 = 5;
      goto LABEL_23;
    }
    if (CFEqual(this, @"minutiae"))
    {
      int v6 = 6;
      goto LABEL_23;
    }
    if (CFEqual(this, @"spew"))
    {
      int v6 = 7;
      goto LABEL_23;
    }
    if (!CFStringGetCString(this, buffer, 64, 0x8000100u))
    {
LABEL_22:
      int v6 = -1;
      goto LABEL_23;
    }
    int v10 = 0;
    int v7 = sscanf(buffer, "%d", &v10);
    int v6 = v10 + 3;
    if (v7 != 1) {
      int v6 = -1;
    }
  }
LABEL_23:
  *a2 = v6 > 0;
  return v6 & ~(v6 >> 31);
}

void *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::~__func(void *a1)
{
  *a1 = &unk_1F1452948;
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](a1 + 2);
  return a1;
}

void std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::~__func(void *a1)
{
  *a1 = &unk_1F1452948;
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](a1 + 2);

  JUMPOUT(0x1BA9F2850);
}

uint64_t std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::__clone(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *a2 = &unk_1F1452948;
  a2[1] = v2;
  return std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)(a2 + 2), a1 + 16);
}

void *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::destroy(uint64_t a1)
{
  return std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100]((void *)(a1 + 16));
}

BOOL std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::operator()(uint64_t a1, uint64_t *a2)
{
  return std::__invoke_void_return_wrapper<BOOL,false>::__call[abi:ne180100]<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1} &,void const*>((uint64_t (**)(uint64_t, char *))(a1 + 8), a2);
}

uint64_t std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::target_type()
{
}

BOOL std::__invoke_void_return_wrapper<BOOL,false>::__call[abi:ne180100]<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1} &,void const*>(uint64_t (**a1)(uint64_t, char *), uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v6 = 0;
  int v4 = (*a1)(v3, &v6);
  if (!v6) {
    return 0;
  }
  std::function<void ()(int)>::operator()((uint64_t)(a1 + 1), v4);
  return v6 != 0;
}

uint64_t std::function<void ()(int)>::operator()(uint64_t a1, int a2)
{
  int v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, int *))(*(void *)v2 + 48))(v2, &v4);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x1BA9F2850);
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::~__func()
{
}

void *std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::__clone(uint64_t a1)
{
  CFPropertyListRef result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *CFPropertyListRef result = &unk_1F14529A0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::operator()(uint64_t result, int *a2)
{
  uint64_t v2 = 3;
  if (*a2 <= 6) {
    uint64_t v2 = 1;
  }
  *(void *)(*(void *)(result + 8) + 8) = v2;
  return result;
}

uint64_t std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::target_type()
{
}

void virtual thunk to'CAException::~CAException(CAException *this)
{
}

{
  uint64_t vars8;

  std::exception::~exception((std::exception *)((char *)this + *(void *)(*(void *)this - 24)));

  JUMPOUT(0x1BA9F2850);
}

void CAException::~CAException(std::exception *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x1BA9F2850);
}

void CAXException::~CAXException(std::exception *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x1BA9F2850);
}

const char *CAException::what(CAException *this)
{
  return "CAException";
}

uint64_t CAXException::what(CAXException *this)
{
  return (uint64_t)this + 8;
}

void sub_1BA9283B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34)
{
  _Unwind_Resume(a1);
}

void sub_1BA9288B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BA928F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1BA929450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BA92993C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA929BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA929D74(_Unwind_Exception *a1)
{
  CFTypeID v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BA929F08(_Unwind_Exception *a1)
{
  char v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1BA92A124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA92A2D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA92AE08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1BA92AF90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA92B118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA92B220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA92B288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA92BD3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  _Unwind_Resume(a1);
}

void sub_1BA92C658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  _Unwind_Resume(a1);
}

void sub_1BA92C7DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA92C884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA92D7F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA92DB00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA92DF3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA92E744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA92E9DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA92ED28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA92EE54(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  if (a2 == 1)
  {
    uint64_t v20 = (NSException *)objc_begin_catch(a1);
    uint64_t v21 = NSErrorFromNSException(v20);
    uint64_t v22 = v21;
    if (v17) {
      void *v17 = v21;
    }

    objc_end_catch();
    JUMPOUT(0x1BA92EE18);
  }

  _Unwind_Resume(a1);
}

void sub_1BA92F3D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA92F60C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

void sub_1BA92F908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA92FE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BA930144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA9308B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v40 - 192), 8);

  _Unwind_Resume(a1);
}

void sub_1BA930AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA930E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BA931134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);

  _Unwind_Resume(a1);
}

void sub_1BA93128C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA931578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  id v17 = va_arg(va1, id);
  _Block_object_dispose(va, 8);

  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);

  _Unwind_Resume(a1);
}

void sub_1BA9316D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA931A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA931B58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA931CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)CHMetrics;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA931EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA932510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA932658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA932820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA932994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA932BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA932D6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA932F24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9331EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9337B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, uint64_t a12)
{
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__node_insert_unique(void *a1, void *a2)
{
  uint64_t v2 = a2;
  CFTypeID v5 = a2 + 2;
  unint64_t v4 = a2[2];
  *(v5 - 1) = v4;
  char v6 = std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__node_insert_unique_prepare[abi:ne180100]((uint64_t)a1, v4, v5);
  if (v6) {
    return v6;
  }
  std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__node_insert_unique_perform[abi:ne180100](a1, v2);
  return v2;
}

void std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__deallocate_node(uint64_t a1, id *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (id *)*v2;

      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void *std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__node_insert_unique_prepare[abi:ne180100](uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL) {
      uint64_t v5 = v3 <= a2 ? a2 % v3 : a2;
    }
    else {
      uint64_t v5 = (v3 - 1) & a2;
    }
    char v6 = *(void **)(*(void *)a1 + 8 * v5);
    if (v6)
    {
      for (uint64_t i = (void *)*v6; i; uint64_t i = (void *)*i)
      {
        unint64_t v8 = i[1];
        if (v8 == a2)
        {
          if (i[2] == *a3) {
            return i;
          }
        }
        else
        {
          if (v4.u32[0] > 1uLL)
          {
            if (v8 >= v3) {
              v8 %= v3;
            }
          }
          else
          {
            v8 &= v3 - 1;
          }
          if (v8 != v5) {
            break;
          }
        }
      }
    }
  }
  float v9 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v10 = *(float *)(a1 + 32);
  if (!v3 || (float)(v10 * (float)v3) < v9)
  {
    uint64_t v11 = 2 * v3;
    BOOL v12 = v3 < 3 || (v3 & (v3 - 1)) != 0;
    size_t v13 = v12 | v11;
    unint64_t v14 = vcvtps_u32_f32(v9 / v10);
    if (v13 <= v14) {
      size_t v15 = v14;
    }
    else {
      size_t v15 = v13;
    }
    std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__rehash<true>(a1, v15);
  }
  return 0;
}

void *std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__node_insert_unique_perform[abi:ne180100](void *result, void *a2)
{
  int8x8_t v2 = (int8x8_t)result[1];
  unint64_t v3 = a2[1];
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    if (v3 >= *(void *)&v2) {
      v3 %= *(void *)&v2;
    }
  }
  else
  {
    v3 &= *(void *)&v2 - 1;
  }
  uint64_t v5 = *(void **)(*result + 8 * v3);
  if (v5)
  {
    *a2 = *v5;
LABEL_13:
    void *v5 = a2;
    goto LABEL_14;
  }
  *a2 = result[2];
  result[2] = a2;
  *(void *)(*result + 8 * v3) = result + 2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v4.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v2) {
        v6 %= *(void *)&v2;
      }
    }
    else
    {
      v6 &= *(void *)&v2 - 1;
    }
    uint64_t v5 = (void *)(*result + 8 * v6);
    goto LABEL_13;
  }
LABEL_14:
  ++result[3];
  return result;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,void *>>>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (*(unsigned char *)(a1 + 8))
  {
  }
  else if (!a2)
  {
    return;
  }

  operator delete(a2);
}

void *std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::find<AVHapticPlayerEventType>(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  unint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  CFPropertyListRef result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      CFPropertyListRef result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E622DE10, MEMORY[0x1E4FBA1D0]);
}

void sub_1BA933D60(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  CFPropertyListRef result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D8] + 16);
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__deallocate_node(a1, *(id **)(a1 + 16));
  int8x8_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

BOOL PlatformUtilities_iOS::ProductIsAPhone(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 1;
}

BOOL PlatformUtilities_iOS::ProductIsAppleTV(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 4;
}

BOOL PlatformUtilities_iOS::ProductIsAppleWatch(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 6;
}

BOOL PlatformUtilities_iOS::ProductIsiPod(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 2;
}

BOOL PlatformUtilities_iOS::ProductIsiPad(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 3;
}

uint64_t PlatformUtilities_iOS::ProductIsMuseDevice(PlatformUtilities_iOS *this)
{
  {
    uint64_t v2 = MGGetBoolAnswer();
    BOOL v4 = (v2 & 1) != 0
      || (ProductType = (PlatformUtilities_iOS *)PlatformUtilities_iOS::GetProductType((PlatformUtilities_iOS *)v2),
          ProductType == 131)
      || PlatformUtilities_iOS::GetProductType(ProductType) == 143;
    PlatformUtilities_iOS::ProductIsMuseDevice(void)::isMuseDevice = v4;
  }
  return PlatformUtilities_iOS::ProductIsMuseDevice(void)::isMuseDevice;
}

void sub_1BA933F48(_Unwind_Exception *a1)
{
}

uint64_t PlatformUtilities_iOS::GetProductType(PlatformUtilities_iOS *this)
{
  if ((PlatformUtilities_iOS::GetProductType(void)::sCompletedCheck & 1) == 0)
  {
    PlatformUtilities_iOS::GetProductType(void)::sCompletedCheck = 1;
    uint64_t v1 = MGGetProductType();
    if (v1 <= 2089455187)
    {
      if (v1 > 1293446024)
      {
        if (v1 > 1602181455)
        {
          if (v1 <= 1868379042)
          {
            if (v1 <= 1721691076)
            {
              if (v1 <= 1625227433)
              {
                if (v1 == 1602181456)
                {
                  int v2 = 126;
                  goto LABEL_354;
                }
                if (v1 == 1608945770)
                {
                  int v2 = 145;
                  goto LABEL_354;
                }
                goto LABEL_353;
              }
              if (v1 != 1625227434)
              {
                if (v1 == 1644180312)
                {
                  int v2 = 117;
                  goto LABEL_354;
                }
                if (v1 == 1701146937)
                {
                  int v2 = 34;
LABEL_354:
                  PlatformUtilities_iOS::GetProductType(void)::sType = v2;
                  return PlatformUtilities_iOS::GetProductType(void)::sType;
                }
                goto LABEL_353;
              }
LABEL_226:
              int v2 = 78;
              goto LABEL_354;
            }
            if (v1 <= 1737882205)
            {
              if (v1 == 1721691077)
              {
                int v2 = 15;
                goto LABEL_354;
              }
              if (v1 == 1733600853)
              {
                int v2 = 100;
                goto LABEL_354;
              }
              goto LABEL_353;
            }
            if (v1 == 1737882206)
            {
              int v2 = 88;
              goto LABEL_354;
            }
            if (v1 == 1756509290)
            {
              int v2 = 116;
              goto LABEL_354;
            }
            uint64_t v6 = 1834147427;
            goto LABEL_283;
          }
          if (v1 <= 2032616840)
          {
            if (v1 > 1990293941)
            {
              if (v1 == 1990293942)
              {
                int v2 = 112;
                goto LABEL_354;
              }
              if (v1 != 2001966017)
              {
                uint64_t v5 = 2023824667;
                goto LABEL_148;
              }
LABEL_239:
              int v2 = 70;
              goto LABEL_354;
            }
            if (v1 != 1868379043)
            {
              if (v1 == 1895344378)
              {
                int v2 = 68;
                goto LABEL_354;
              }
              goto LABEL_353;
            }
LABEL_210:
            int v2 = 76;
            goto LABEL_354;
          }
          if (v1 > 2078329140)
          {
            if (v1 == 2078329141)
            {
              int v2 = 24;
              goto LABEL_354;
            }
            if (v1 == 2080700391)
            {
              int v2 = 31;
              goto LABEL_354;
            }
            uint64_t v7 = 2081274472;
LABEL_220:
            if (v1 == v7)
            {
              int v2 = 94;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
          if (v1 != 2032616841)
          {
            if (v1 == 2048538371)
            {
              int v2 = 45;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
LABEL_296:
          int v2 = 20;
          goto LABEL_354;
        }
        if (v1 > 1402208363)
        {
          if (v1 > 1429914405)
          {
            if (v1 <= 1549248875)
            {
              if (v1 == 1429914406)
              {
                int v2 = 18;
                goto LABEL_354;
              }
              if (v1 == 1517755655)
              {
                int v2 = 129;
                goto LABEL_354;
              }
            }
            else
            {
              switch(v1)
              {
                case 1549248876:
                  int v2 = 130;
                  goto LABEL_354;
                case 1559256613:
                  int v2 = 40;
                  goto LABEL_354;
                case 1573906122:
                  int v2 = 110;
                  goto LABEL_354;
              }
            }
          }
          else if (v1 <= 1412429327)
          {
            if (v1 == 1402208364)
            {
              int v2 = 102;
              goto LABEL_354;
            }
            if (v1 == 1408738134)
            {
              int v2 = 122;
              goto LABEL_354;
            }
          }
          else
          {
            switch(v1)
            {
              case 1412429328:
                int v2 = 50;
                goto LABEL_354;
              case 1415625992:
                int v2 = 108;
                goto LABEL_354;
              case 1419435331:
                int v2 = 114;
                goto LABEL_354;
            }
          }
          goto LABEL_353;
        }
        if (v1 > 1325975681)
        {
          if (v1 > 1371389548)
          {
            if (v1 == 1371389549)
            {
              int v2 = 22;
              goto LABEL_354;
            }
            if (v1 != 1373516433)
            {
              if (v1 == 1380747801)
              {
                int v2 = 99;
                goto LABEL_354;
              }
              goto LABEL_353;
            }
            goto LABEL_210;
          }
          if (v1 == 1325975682)
          {
            int v2 = 52;
            goto LABEL_354;
          }
          uint64_t v3 = 1353145733;
LABEL_238:
          if (v1 != v3) {
            goto LABEL_353;
          }
          goto LABEL_239;
        }
        if (v1 <= 1302273957)
        {
          if (v1 != 1293446025)
          {
            if (v1 == 1294429942)
            {
              int v2 = 119;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
LABEL_276:
          int v2 = 74;
          goto LABEL_354;
        }
        if (v1 != 1302273958)
        {
          if (v1 == 1309571158)
          {
            int v2 = 113;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
LABEL_297:
        int v2 = 80;
        goto LABEL_354;
      }
      if (v1 <= 551446204)
      {
        if (v1 > 253148924)
        {
          if (v1 > 344862119)
          {
            if (v1 <= 358923951)
            {
              if (v1 == 344862120)
              {
                int v2 = 87;
                goto LABEL_354;
              }
              if (v1 == 355234908)
              {
                int v2 = 101;
                goto LABEL_354;
              }
            }
            else
            {
              switch(v1)
              {
                case 358923952:
                  int v2 = 98;
                  goto LABEL_354;
                case 445396642:
                  int v2 = 89;
                  goto LABEL_354;
                case 502329937:
                  int v2 = 17;
                  goto LABEL_354;
              }
            }
            goto LABEL_353;
          }
          if (v1 > 337183580)
          {
            if (v1 == 337183581)
            {
              int v2 = 10;
              goto LABEL_354;
            }
            if (v1 == 340218669)
            {
              int v2 = 83;
              goto LABEL_354;
            }
            uint64_t v3 = 341800273;
            goto LABEL_238;
          }
          if (v1 != 253148925)
          {
            if (v1 == 262180327)
            {
              int v2 = 95;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
LABEL_290:
          int v2 = 92;
          goto LABEL_354;
        }
        if (v1 <= 79936590)
        {
          if (v1 > 40511011)
          {
            if (v1 == 40511012)
            {
              int v2 = 106;
              goto LABEL_354;
            }
            if (v1 == 42878382)
            {
              int v2 = 11;
              goto LABEL_354;
            }
          }
          else
          {
            if (v1 == 23433786)
            {
              int v2 = 46;
              goto LABEL_354;
            }
            if (v1 == 33245053)
            {
              int v2 = 53;
              goto LABEL_354;
            }
          }
          goto LABEL_353;
        }
        if (v1 > 157833460)
        {
          if (v1 != 157833461)
          {
            if (v1 == 173258742)
            {
              int v2 = 44;
              goto LABEL_354;
            }
            if (v1 != 228444038) {
              goto LABEL_353;
            }
            goto LABEL_289;
          }
LABEL_257:
          int v2 = 63;
          goto LABEL_354;
        }
        if (v1 != 79936591)
        {
          uint64_t v8 = 88647037;
          goto LABEL_216;
        }
LABEL_293:
        int v2 = 61;
        goto LABEL_354;
      }
      if (v1 > 952317140)
      {
        if (v1 <= 1119807501)
        {
          if (v1 > 1085318933)
          {
            switch(v1)
            {
              case 1085318934:
                int v2 = 103;
                goto LABEL_354;
              case 1110205732:
                int v2 = 33;
                goto LABEL_354;
              case 1114644381:
                int v2 = 64;
                goto LABEL_354;
            }
            goto LABEL_353;
          }
          if (v1 != 952317141)
          {
            if (v1 == 1060988941)
            {
              int v2 = 8;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
          goto LABEL_292;
        }
        if (v1 > 1234705394)
        {
          if (v1 == 1234705395)
          {
            int v2 = 97;
            goto LABEL_354;
          }
          if (v1 != 1280441783)
          {
            if (v1 == 1280909812)
            {
              int v2 = 124;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
          goto LABEL_257;
        }
        if (v1 != 1119807502)
        {
          if (v1 == 1169082144)
          {
            int v2 = 26;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
LABEL_256:
        int v2 = 36;
        goto LABEL_354;
      }
      if (v1 <= 761631963)
      {
        if (v1 > 689804741)
        {
          if (v1 == 689804742)
          {
            int v2 = 29;
            goto LABEL_354;
          }
          uint64_t v6 = 746003606;
LABEL_283:
          if (v1 != v6) {
            goto LABEL_353;
          }
          goto LABEL_288;
        }
        if (v1 != 551446205)
        {
          if (v1 == 676119128)
          {
            int v2 = 118;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
        goto LABEL_256;
      }
      if (v1 > 820711326)
      {
        if (v1 != 820711327)
        {
          if (v1 == 896202454)
          {
            int v2 = 56;
            goto LABEL_354;
          }
          if (v1 != 910181310) {
            goto LABEL_353;
          }
          goto LABEL_296;
        }
LABEL_272:
        int v2 = 54;
        goto LABEL_354;
      }
      if (v1 != 761631964)
      {
        if (v1 == 776033019)
        {
          int v2 = 42;
          goto LABEL_354;
        }
        goto LABEL_353;
      }
LABEL_294:
      int v2 = 81;
      goto LABEL_354;
    }
    if (v1 > 3133873108)
    {
      if (v1 > 3645319984)
      {
        if (v1 > 3885279869)
        {
          if (v1 > 4067129263)
          {
            if (v1 <= 4201643248)
            {
              if (v1 == 4067129264)
              {
                int v2 = 111;
                goto LABEL_354;
              }
              if (v1 == 4172444931)
              {
                int v2 = 104;
                goto LABEL_354;
              }
            }
            else
            {
              switch(v1)
              {
                case 4201643249:
                  int v2 = 28;
                  goto LABEL_354;
                case 4232256925:
                  int v2 = 86;
                  goto LABEL_354;
                case 4240173202:
                  int v2 = 2;
                  goto LABEL_354;
              }
            }
          }
          else if (v1 <= 3953847431)
          {
            if (v1 == 3885279870)
            {
              int v2 = 25;
              goto LABEL_354;
            }
            if (v1 == 3933982784)
            {
              int v2 = 38;
              goto LABEL_354;
            }
          }
          else
          {
            switch(v1)
            {
              case 3953847432:
                int v2 = 128;
                goto LABEL_354;
              case 4025247511:
                int v2 = 105;
                goto LABEL_354;
              case 4055323051:
                int v2 = 43;
                goto LABEL_354;
            }
          }
          goto LABEL_353;
        }
        if (v1 <= 3767261005)
        {
          if (v1 <= 3707345670)
          {
            if (v1 != 3645319985)
            {
              if (v1 == 3683904382)
              {
                int v2 = 109;
                goto LABEL_354;
              }
              goto LABEL_353;
            }
LABEL_289:
            int v2 = 57;
            goto LABEL_354;
          }
          if (v1 != 3707345671)
          {
            if (v1 == 3711192744)
            {
              int v2 = 66;
              goto LABEL_354;
            }
            if (v1 == 3743999268)
            {
              int v2 = 19;
              goto LABEL_354;
            }
LABEL_353:
            int v2 = 0;
            goto LABEL_354;
          }
          goto LABEL_256;
        }
        if (v1 <= 3856877969)
        {
          if (v1 == 3767261006)
          {
            int v2 = 125;
            goto LABEL_354;
          }
          uint64_t v3 = 3801472101;
          goto LABEL_238;
        }
        if (v1 == 3856877970)
        {
          int v2 = 82;
          goto LABEL_354;
        }
        if (v1 != 3863625342)
        {
          if (v1 == 3865922942)
          {
            int v2 = 41;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
LABEL_252:
        int v2 = 75;
        goto LABEL_354;
      }
      if (v1 <= 3361025852)
      {
        if (v1 > 3215673113)
        {
          if (v1 > 3242623366)
          {
            switch(v1)
            {
              case 3242623367:
                int v2 = 14;
                goto LABEL_354;
              case 3300281076:
                int v2 = 39;
                goto LABEL_354;
              case 3348380076:
                int v2 = 4;
                goto LABEL_354;
            }
            goto LABEL_353;
          }
          if (v1 == 3215673114)
          {
            int v2 = 60;
            goto LABEL_354;
          }
          if (v1 != 3228373941) {
            goto LABEL_353;
          }
          goto LABEL_226;
        }
        if (v1 <= 3196158496)
        {
          if (v1 == 3133873109)
          {
            int v2 = 47;
            goto LABEL_354;
          }
          uint64_t v8 = 3184375231;
LABEL_216:
          if (v1 == v8)
          {
            int v2 = 62;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
        if (v1 != 3196158497)
        {
          if (v1 == 3196805751)
          {
            int v2 = 6;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
      }
      else
      {
        if (v1 <= 3571532205)
        {
          if (v1 > 3402870383)
          {
            switch(v1)
            {
              case 3402870384:
                int v2 = 55;
                goto LABEL_354;
              case 3455223061:
                int v2 = 65;
                goto LABEL_354;
              case 3540156652:
                int v2 = 73;
                goto LABEL_354;
            }
            goto LABEL_353;
          }
          if (v1 != 3361025853)
          {
            if (v1 == 3397214291)
            {
              int v2 = 59;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
          goto LABEL_291;
        }
        if (v1 <= 3599094682)
        {
          if (v1 == 3571532206)
          {
            int v2 = 123;
            goto LABEL_354;
          }
          if (v1 == 3585085679)
          {
            int v2 = 9;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
        if (v1 == 3599094683) {
          goto LABEL_252;
        }
        if (v1 != 3636345305)
        {
          if (v1 == 3637438250)
          {
            int v2 = 37;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
      }
      goto LABEL_280;
    }
    if (v1 <= 2516717267)
    {
      if (v1 <= 2288107368)
      {
        if (v1 <= 2159747552)
        {
          if (v1 > 2132302343)
          {
            if (v1 == 2132302344)
            {
              int v2 = 120;
              goto LABEL_354;
            }
            if (v1 != 2158787296) {
              goto LABEL_353;
            }
            goto LABEL_272;
          }
          if (v1 != 2089455188)
          {
            if (v1 != 2103978418) {
              goto LABEL_353;
            }
            goto LABEL_276;
          }
LABEL_291:
          int v2 = 79;
          goto LABEL_354;
        }
        if (v1 <= 2236272847)
        {
          if (v1 == 2159747553)
          {
            int v2 = 21;
            goto LABEL_354;
          }
          uint64_t v7 = 2162679683;
          goto LABEL_220;
        }
        if (v1 != 2236272848)
        {
          if (v1 != 2262113699)
          {
            if (v1 == 2270970153)
            {
              int v2 = 16;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
          goto LABEL_293;
        }
LABEL_280:
        int v2 = 69;
        goto LABEL_354;
      }
      if (v1 > 2418348557)
      {
        if (v1 <= 2454275342)
        {
          if (v1 == 2418348558)
          {
            int v2 = 107;
            goto LABEL_354;
          }
          if (v1 == 2445473385)
          {
            int v2 = 96;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
        if (v1 == 2454275343)
        {
          int v2 = 48;
          goto LABEL_354;
        }
        if (v1 != 2458172802)
        {
          if (v1 != 2468178735) {
            goto LABEL_353;
          }
          goto LABEL_290;
        }
        goto LABEL_280;
      }
      if (v1 <= 2311900305)
      {
        if (v1 != 2288107369)
        {
          if (v1 == 2309863438)
          {
            int v2 = 30;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
        goto LABEL_297;
      }
      if (v1 == 2311900306)
      {
        int v2 = 13;
        goto LABEL_354;
      }
      if (v1 == 2336512887)
      {
LABEL_292:
        int v2 = 93;
        goto LABEL_354;
      }
      uint64_t v4 = 2385671069;
LABEL_181:
      if (v1 == v4)
      {
        int v2 = 35;
        goto LABEL_354;
      }
      goto LABEL_353;
    }
    if (v1 > 2781508712)
    {
      if (v1 <= 2943112656)
      {
        if (v1 <= 2823174121)
        {
          if (v1 == 2781508713)
          {
            int v2 = 5;
            goto LABEL_354;
          }
          if (v1 == 2797549163)
          {
            int v2 = 85;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
        if (v1 != 2823174122)
        {
          if (v1 != 2880863278)
          {
            if (v1 == 2903084588)
            {
              int v2 = 67;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
          goto LABEL_256;
        }
        goto LABEL_294;
      }
      if (v1 <= 3001488777)
      {
        if (v1 == 2943112657)
        {
          int v2 = 121;
          goto LABEL_354;
        }
        if (v1 == 2979575960)
        {
          int v2 = 127;
          goto LABEL_354;
        }
        goto LABEL_353;
      }
      if (v1 == 3001488778)
      {
        int v2 = 27;
        goto LABEL_354;
      }
      if (v1 != 3054476161)
      {
        uint64_t v5 = 3101941570;
LABEL_148:
        if (v1 != v5) {
          goto LABEL_353;
        }
        goto LABEL_210;
      }
LABEL_288:
      int v2 = 77;
      goto LABEL_354;
    }
    if (v1 <= 2673319455)
    {
      if (v1 > 2628394913)
      {
        if (v1 != 2628394914)
        {
          if (v1 == 2644487444)
          {
            int v2 = 72;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
        goto LABEL_288;
      }
      if (v1 != 2516717268)
      {
        uint64_t v4 = 2614323575;
        goto LABEL_181;
      }
    }
    else
    {
      if (v1 > 2722529671)
      {
        switch(v1)
        {
          case 2722529672:
            int v2 = 23;
            goto LABEL_354;
          case 2730762296:
            int v2 = 84;
            goto LABEL_354;
          case 2751865418:
            int v2 = 115;
            goto LABEL_354;
        }
        goto LABEL_353;
      }
      if (v1 != 2673319456)
      {
        if (v1 == 2702125347)
        {
          int v2 = 3;
          goto LABEL_354;
        }
        goto LABEL_353;
      }
    }
    int v2 = 58;
    goto LABEL_354;
  }
  return PlatformUtilities_iOS::GetProductType(void)::sType;
}

uint64_t PlatformUtilities_iOS::ProductSupportsAssistant(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsCarPlay(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsLivePhoto(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsVibrator(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsHaptics(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsSiriBargeIn(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsWirelessCharging(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsPictureInPicture(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::CopyProductAssignedName(PlatformUtilities_iOS *this)
{
  return MEMORY[0x1F417CE38](@"UserAssignedDeviceName");
}

uint64_t PlatformUtilities_iOS::IsTelephonyCaptureAllowed(int a1)
{
  if (queryBuildType(void)::once != -1) {
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_98);
  }
  if (!gIsInternal && !gIsCarrier) {
    return 0;
  }
  CFPreferencesAppSynchronize(@"com.apple.coreaudio");
  uint64_t result = CACFPreferencesGetAppIntegerValue(@"EnableTelephonyMonitor", @"com.apple.coreaudio", 0);
  if (result)
  {
    switch(a1)
    {
      case 0:
        CFStringRef v3 = @"com.apple.coreaudio";
        CFPreferencesAppSynchronize(@"com.apple.coreaudio");
        CFStringRef v4 = @"EnableVPTelephonyMonitor";
        break;
      case 1:
        CFStringRef v3 = @"com.apple.audio.virtualaudio";
        CFPreferencesAppSynchronize(@"com.apple.audio.virtualaudio");
        CFStringRef v4 = @"EnableVADTelephonyMonitor";
        break;
      case 2:
        CFStringRef v3 = @"com.apple.coreaudio";
        CFPreferencesAppSynchronize(@"com.apple.coreaudio");
        CFStringRef v4 = @"EnableHALTelephonyMonitor";
        break;
      case 3:
        CFStringRef v3 = @"com.apple.audio.virtualaudio";
        CFPreferencesAppSynchronize(@"com.apple.audio.virtualaudio");
        CFStringRef v4 = @"EnableEANCTelephonyMonitor";
        break;
      default:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          PlatformUtilities_iOS::IsTelephonyCaptureAllowed();
        }
        __break(1u);
        JUMPOUT(0x1BA9352C4);
    }
    return CACFPreferencesGetAppIntegerValue(v4, v3, 0) != 0;
  }
  return result;
}

uint64_t PlatformUtilities_iOS::IsInternalBuild(PlatformUtilities_iOS *this)
{
  if (queryBuildType(void)::once != -1) {
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_98);
  }
  return gIsInternal;
}

uint64_t PlatformUtilities_iOS::IsCarrierBuild(PlatformUtilities_iOS *this)
{
  if (queryBuildType(void)::once != -1) {
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_98);
  }
  return gIsCarrier;
}

uint64_t PlatformUtilities_iOS::ProductSupportsTelephonyOverUSB(PlatformUtilities_iOS *this)
{
  uint64_t result = MGGetBoolAnswer();
  if (result)
  {
    return MGGetBoolAnswer();
  }
  return result;
}

uint64_t PlatformUtilities_iOS::ProductSupportsSiriSpeaks(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsStereoRecording(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsBrook(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::IsUIBuild(PlatformUtilities_iOS *this)
{
  if (queryBuildType(void)::once != -1) {
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_98);
  }
  return gIsUI;
}

uint64_t PlatformUtilities_iOS::_eaJyFmO(PlatformUtilities_iOS *this)
{
  if (PlatformUtilities_iOS::_eaJyFmO(void)::once != -1) {
    dispatch_once(&PlatformUtilities_iOS::_eaJyFmO(void)::once, &__block_literal_global_0);
  }
  return PlatformUtilities_iOS::_eaJyFmO(void)::isMonarchLowEndHardware;
}

void ___ZN21PlatformUtilities_iOS8_eaJyFmOEv_block_invoke()
{
  int v0 = (const void *)MGCopyAnswer();
  int v2 = v0;
  char v3 = 1;
  if (v0) {
    BOOL v1 = CFEqual(v0, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0;
  }
  else {
    BOOL v1 = 0;
  }
  PlatformUtilities_iOS::_eaJyFmO(void)::isMonarchLowEndHardware = v1;
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v2);
}

void sub_1BA9354C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t PlatformUtilities_iOS::ProductHasAOP(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductHasBaseband(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

void PlatformUtilities_iOS::TrimHardwareModelShortName(__CFString *this, __CFString *a2)
{
  if (!this) {
    return;
  }
  CFStringRef v3 = @"AP";
  if (CFStringHasSuffix(this, @"AP")
    || (CFStringRef v3 = @"DEV", CFStringHasSuffix(this, @"DEV"))
    || (CFStringRef v3 = @"ap", CFStringHasSuffix(this, @"ap"))
    || (CFStringRef v3 = @"dev", CFStringHasSuffix(this, @"dev")))
  {
    CFStringTrim(this, v3);
  }
  CFStringRef suffix = 0;
  char v10 = 1;
  uint64_t v4 = MGGetProductType();
  if (v4 == 952317141)
  {
    CFStringRef v7 = CFStringCreateWithCString(0, "u", 0x600u);
    char v8 = 1;
    CACFString::operator=((uint64_t)&suffix, (uint64_t)&v7);
  }
  else
  {
    if (v4 != 2081274472 && v4 != 2468178735) {
      goto LABEL_14;
    }
    CFStringRef v7 = CFStringCreateWithCString(0, "m", 0x600u);
    char v8 = 1;
    CACFString::operator=((uint64_t)&suffix, (uint64_t)&v7);
  }
  CACFString::~CACFString((CACFString *)&v7);
LABEL_14:
  CFStringRef v5 = suffix;
  if (suffix)
  {
    if (CFStringHasSuffix(this, suffix))
    {
      CFIndex Length = CFStringGetLength(this);
      v11.length = CFStringGetLength(v5);
      v11.location = Length - v11.length;
      CFStringFindAndReplace(this, v5, &stru_1F14548C8, v11, 1uLL);
    }
  }
  CACFString::~CACFString((CACFString *)&suffix);
}

void sub_1BA9356B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

uint64_t PlatformUtilities_iOS::GetBuiltInMicCount(PlatformUtilities_iOS *this)
{
  {
    PlatformUtilities_iOS::GetBuiltInMicCount(void)::sMicCount = PlatformUtilities_iOS::GetBuiltInMicCount(void)::$_0::operator()();
  }
  return PlatformUtilities_iOS::GetBuiltInMicCount(void)::sMicCount;
}

void sub_1BA935744(_Unwind_Exception *a1)
{
}

const __CFNumber *PlatformUtilities_iOS::GetBuiltInMicCount(void)::$_0::operator()()
{
  CFNumberRef result = (const __CFNumber *)MGCopyAnswer();
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberRef v1 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v1);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFStringRef PlatformUtilities_iOS::CopyAcousticIDFilePrefix(PlatformUtilities_iOS *this)
{
  if (MGIsQuestionValid()) {
    MGGetSInt32Answer();
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"AID", 3);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v6 >= 0) {
    p_p = (const char *)&__p;
  }
  else {
    p_p = (const char *)__p;
  }
  CFStringRef v2 = CFStringCreateWithCString(0, p_p, 0x600u);
  if (v6 < 0) {
    operator delete(__p);
  }
  v7[0] = *MEMORY[0x1E4FBA408];
  uint64_t v3 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)v7 + *(void *)(v7[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  v8[0] = v3;
  v8[1] = MEMORY[0x1E4FBA470] + 16;
  if (v9 < 0) {
    operator delete((void *)v8[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1BA9F2800](&v10);
  return v2;
}

void sub_1BA935994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA488] + 104;
  *(void *)(a1 + 128) = MEMORY[0x1E4FBA488] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x1E4FBA488] + 64;
  *(void *)(a1 + 16) = MEMORY[0x1E4FBA488] + 64;
  CFStringRef v5 = (void *)MEMORY[0x1E4FBA408];
  uint64_t v6 = *(void *)(MEMORY[0x1E4FBA408] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x1E4FBA408] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  char v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x1E4FBA488] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x1E4FBA470] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_1BA935C74(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x1BA9F2800](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA408];
  uint64_t v3 = *MEMORY[0x1E4FBA408];
  *(void *)a1 = *MEMORY[0x1E4FBA408];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1BA9F2800](a1 + 128);
  return a1;
}

CFStringRef PlatformUtilities_iOS::CopyProductTypeFilePrefix(int a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  __str[0] = 0;
  switch(a1)
  {
    case 1:
      uint64_t v21 = 0;
      int v1 = 184;
      goto LABEL_7;
    case 2:
      uint64_t v21 = 0;
      goto LABEL_5;
    case 3:
      uint64_t v21 = 97;
LABEL_5:
      int v1 = 238;
      goto LABEL_7;
    case 4:
      uint64_t v21 = 0;
      int v1 = 520;
LABEL_7:
      uint64_t v2 = 98;
      goto LABEL_179;
    case 5:
      uint64_t v21 = 0;
      int v1 = 10;
      goto LABEL_35;
    case 6:
      uint64_t v21 = 0;
      int v1 = 11;
      goto LABEL_35;
    case 7:
      uint64_t v21 = 0;
      int v1 = 12;
      goto LABEL_35;
    case 8:
      uint64_t v21 = 0;
      int v1 = 16;
      goto LABEL_35;
    case 9:
      uint64_t v21 = 0;
      int v1 = 17;
      goto LABEL_35;
    case 10:
      uint64_t v21 = 0;
      int v1 = 101;
      goto LABEL_35;
    case 11:
      uint64_t v21 = 0;
      int v1 = 111;
      goto LABEL_35;
    case 12:
      uint64_t v21 = 0;
      int v1 = 121;
      goto LABEL_35;
    case 13:
      uint64_t v21 = 0;
      int v1 = 20;
      goto LABEL_35;
    case 14:
      uint64_t v21 = 0;
      int v1 = 21;
      goto LABEL_35;
    case 15:
      uint64_t v21 = 0;
      int v1 = 22;
      goto LABEL_35;
    case 16:
      uint64_t v21 = 0;
      int v1 = 201;
      goto LABEL_35;
    case 17:
      uint64_t v21 = 0;
      int v1 = 211;
      goto LABEL_35;
    case 18:
      uint64_t v21 = 0;
      int v1 = 221;
      goto LABEL_35;
    case 19:
      uint64_t v21 = 0;
      int v1 = 32;
      goto LABEL_35;
    case 20:
      uint64_t v21 = 0;
      int v1 = 33;
      goto LABEL_35;
    case 21:
      uint64_t v21 = 0;
      int v1 = 79;
      goto LABEL_35;
    case 22:
      uint64_t v21 = 0;
      int v1 = 42;
      goto LABEL_35;
    case 23:
      uint64_t v21 = 0;
      int v1 = 43;
      goto LABEL_35;
    case 24:
      uint64_t v21 = 0;
      int v1 = 49;
      goto LABEL_35;
    case 25:
      uint64_t v21 = 103;
      int v1 = 52;
      goto LABEL_35;
    case 26:
      uint64_t v3 = 103;
      goto LABEL_31;
    case 27:
      uint64_t v3 = 112;
LABEL_31:
      uint64_t v21 = v3;
      int v1 = 53;
      goto LABEL_35;
    case 28:
      uint64_t v21 = 112;
      int v1 = 54;
      goto LABEL_35;
    case 29:
      uint64_t v21 = 0;
      int v1 = 63;
      goto LABEL_35;
    case 30:
      uint64_t v21 = 0;
      int v1 = 64;
LABEL_35:
      uint64_t v2 = 100;
      goto LABEL_179;
    case 31:
      uint64_t v21 = 0;
      int v1 = 104;
      goto LABEL_178;
    case 32:
      uint64_t v21 = 0;
      goto LABEL_39;
    case 33:
      uint64_t v21 = 100;
LABEL_39:
      int v1 = 42;
      goto LABEL_94;
    case 34:
      uint64_t v21 = 0;
      goto LABEL_44;
    case 35:
      uint64_t v4 = 98;
      goto LABEL_43;
    case 36:
      uint64_t v4 = 115;
LABEL_43:
      uint64_t v21 = v4;
LABEL_44:
      int v1 = 71;
      goto LABEL_94;
    case 37:
      uint64_t v21 = 0;
      int v1 = 72;
      goto LABEL_94;
    case 38:
      uint64_t v21 = 0;
      int v1 = 73;
      goto LABEL_94;
    case 39:
      uint64_t v21 = 0;
      int v1 = 81;
      goto LABEL_94;
    case 40:
      uint64_t v21 = 0;
      int v1 = 82;
      goto LABEL_94;
    case 41:
      uint64_t v21 = 0;
      goto LABEL_51;
    case 42:
      uint64_t v21 = 109;
LABEL_51:
      int v1 = 85;
      goto LABEL_94;
    case 43:
      uint64_t v21 = 0;
      goto LABEL_54;
    case 44:
      uint64_t v21 = 109;
LABEL_54:
      int v1 = 86;
      goto LABEL_94;
    case 45:
      uint64_t v21 = 0;
      goto LABEL_57;
    case 46:
      uint64_t v21 = 109;
LABEL_57:
      int v1 = 87;
      goto LABEL_94;
    case 47:
      uint64_t v21 = 0;
      int v1 = 96;
      goto LABEL_94;
    case 48:
      uint64_t v21 = 0;
      int v1 = 97;
      goto LABEL_94;
    case 49:
      uint64_t v21 = 0;
      goto LABEL_62;
    case 50:
      uint64_t v21 = 97;
LABEL_62:
      int v1 = 98;
      goto LABEL_94;
    case 51:
      uint64_t v21 = 0;
      goto LABEL_65;
    case 52:
      uint64_t v21 = 97;
LABEL_65:
      int v1 = 99;
      goto LABEL_94;
    case 53:
      uint64_t v21 = 97;
      int v1 = 105;
      goto LABEL_94;
    case 54:
      uint64_t v21 = 0;
      int v1 = 120;
      goto LABEL_94;
    case 55:
      uint64_t v21 = 0;
      int v1 = 127;
      goto LABEL_94;
    case 56:
      uint64_t v21 = 0;
      int v1 = 128;
      goto LABEL_94;
    case 57:
      uint64_t v21 = 0;
      goto LABEL_72;
    case 58:
      uint64_t v21 = 97;
LABEL_72:
      int v1 = 171;
      goto LABEL_94;
    case 59:
      uint64_t v21 = 0;
      int v1 = 181;
      goto LABEL_94;
    case 60:
      uint64_t v21 = 0;
      int v1 = 182;
      goto LABEL_94;
    case 61:
      uint64_t v21 = 0;
      int v1 = 207;
      goto LABEL_94;
    case 62:
      uint64_t v21 = 0;
      int v1 = 210;
      goto LABEL_94;
    case 63:
      uint64_t v21 = 0;
      int v1 = 217;
      goto LABEL_94;
    case 64:
      uint64_t v21 = 0;
      int v1 = 305;
      goto LABEL_94;
    case 65:
      uint64_t v21 = 0;
      int v1 = 307;
      goto LABEL_94;
    case 66:
      uint64_t v21 = 0;
      int v1 = 308;
      goto LABEL_94;
    case 67:
      uint64_t v21 = 0;
      int v1 = 310;
      goto LABEL_94;
    case 68:
      uint64_t v21 = 0;
      int v1 = 311;
      goto LABEL_94;
    case 69:
      uint64_t v21 = 0;
      int v1 = 317;
      goto LABEL_94;
    case 70:
      uint64_t v21 = 0;
      int v1 = 320;
      goto LABEL_94;
    case 71:
      uint64_t v21 = 0;
      int v1 = 348;
      goto LABEL_94;
    case 72:
      uint64_t v21 = 0;
      int v1 = 407;
      goto LABEL_94;
    case 73:
      uint64_t v21 = 0;
      int v1 = 408;
      goto LABEL_94;
    case 74:
      uint64_t v21 = 0;
      int v1 = 417;
      goto LABEL_94;
    case 75:
      uint64_t v21 = 0;
      int v1 = 420;
      goto LABEL_94;
    case 76:
      uint64_t v21 = 0;
      int v1 = 517;
      goto LABEL_94;
    case 77:
      uint64_t v21 = 0;
      int v1 = 522;
      goto LABEL_94;
    case 78:
      uint64_t v21 = 0;
      int v1 = 617;
      goto LABEL_94;
    case 79:
      uint64_t v21 = 0;
      int v1 = 620;
LABEL_94:
      uint64_t v2 = 106;
      goto LABEL_179;
    case 80:
      uint64_t v21 = 97;
      int v1 = 27;
      goto LABEL_178;
    case 81:
      uint64_t v21 = 97;
      int v1 = 28;
      goto LABEL_178;
    case 82:
      uint64_t v21 = 0;
      int v1 = 41;
      goto LABEL_178;
    case 83:
      uint64_t v21 = 0;
      int v1 = 42;
      goto LABEL_178;
    case 84:
      uint64_t v21 = 0;
      int v1 = 48;
      goto LABEL_178;
    case 85:
      uint64_t v21 = 0;
      int v1 = 49;
      goto LABEL_178;
    case 86:
      uint64_t v21 = 0;
      int v1 = 51;
      goto LABEL_178;
    case 87:
      uint64_t v21 = 0;
      int v1 = 53;
      goto LABEL_178;
    case 88:
      uint64_t v21 = 0;
      int v1 = 56;
      goto LABEL_178;
    case 89:
      uint64_t v21 = 0;
      int v1 = 61;
      goto LABEL_178;
    case 90:
      uint64_t v21 = 0;
      int v1 = 64;
      goto LABEL_178;
    case 91:
      uint64_t v21 = 0;
      int v1 = 65;
      goto LABEL_178;
    case 92:
      uint64_t v21 = 0;
      int v1 = 66;
      goto LABEL_178;
    case 93:
      uint64_t v21 = 0;
      int v1 = 69;
      goto LABEL_178;
    case 94:
      uint64_t v21 = 0;
      int v1 = 71;
      goto LABEL_178;
    case 95:
      uint64_t v21 = 0;
      int v1 = 74;
      goto LABEL_178;
    case 96:
      uint64_t v21 = 0;
      int v1 = 75;
      goto LABEL_178;
    case 97:
      uint64_t v21 = 0;
      int v1 = 841;
      goto LABEL_178;
    case 98:
      uint64_t v21 = 0;
      int v1 = 102;
      goto LABEL_178;
    case 99:
      uint64_t v21 = 0;
      int v1 = 112;
      goto LABEL_178;
    case 100:
      uint64_t v5 = 115;
      goto LABEL_117;
    case 101:
      uint64_t v5 = 98;
LABEL_117:
      uint64_t v21 = v5;
      int v1 = 111;
      goto LABEL_178;
    case 102:
      uint64_t v6 = 115;
      goto LABEL_120;
    case 103:
      uint64_t v6 = 98;
LABEL_120:
      uint64_t v21 = v6;
      int v1 = 121;
      goto LABEL_178;
    case 104:
      uint64_t v7 = 115;
      goto LABEL_123;
    case 105:
      uint64_t v7 = 98;
LABEL_123:
      uint64_t v21 = v7;
      int v1 = 131;
      goto LABEL_178;
    case 106:
      uint64_t v8 = 115;
      goto LABEL_126;
    case 107:
      uint64_t v8 = 98;
LABEL_126:
      uint64_t v21 = v8;
      int v1 = 140;
      goto LABEL_178;
    case 108:
      uint64_t v9 = 115;
      goto LABEL_129;
    case 109:
      uint64_t v9 = 98;
LABEL_129:
      uint64_t v21 = v9;
      int v1 = 141;
      goto LABEL_178;
    case 110:
      uint64_t v10 = 115;
      goto LABEL_132;
    case 111:
      uint64_t v10 = 98;
LABEL_132:
      uint64_t v21 = v10;
      int v1 = 142;
      goto LABEL_178;
    case 112:
      uint64_t v11 = 98;
      goto LABEL_135;
    case 113:
      uint64_t v11 = 115;
LABEL_135:
      uint64_t v21 = v11;
      int v1 = 143;
      goto LABEL_178;
    case 114:
      uint64_t v12 = 115;
      goto LABEL_138;
    case 115:
      uint64_t v12 = 98;
LABEL_138:
      uint64_t v21 = v12;
      int v1 = 144;
      goto LABEL_178;
    case 116:
      uint64_t v13 = 115;
      goto LABEL_141;
    case 117:
      uint64_t v13 = 98;
LABEL_141:
      uint64_t v21 = v13;
      int v1 = 146;
      goto LABEL_178;
    case 118:
      uint64_t v14 = 98;
      goto LABEL_144;
    case 119:
      uint64_t v14 = 115;
LABEL_144:
      uint64_t v21 = v14;
      int v1 = 149;
      goto LABEL_178;
    case 120:
      uint64_t v15 = 115;
      goto LABEL_147;
    case 121:
      uint64_t v15 = 98;
LABEL_147:
      uint64_t v21 = v15;
      int v1 = 157;
      goto LABEL_178;
    case 122:
      uint64_t v16 = 115;
      goto LABEL_150;
    case 123:
      uint64_t v16 = 98;
LABEL_150:
      uint64_t v21 = v16;
      int v1 = 158;
      goto LABEL_178;
    case 124:
      uint64_t v17 = 115;
      goto LABEL_153;
    case 125:
      uint64_t v17 = 98;
LABEL_153:
      uint64_t v21 = v17;
      int v1 = 187;
      goto LABEL_178;
    case 126:
      uint64_t v18 = 115;
      goto LABEL_156;
    case 127:
      uint64_t v18 = 98;
LABEL_156:
      uint64_t v21 = v18;
      int v1 = 188;
      goto LABEL_178;
    case 128:
      uint64_t v21 = 0;
      int v1 = 101;
      goto LABEL_160;
    case 129:
      uint64_t v21 = 0;
      int v1 = 102;
      goto LABEL_160;
    case 130:
      uint64_t v21 = 0;
      int v1 = 103;
LABEL_160:
      uint64_t v2 = 112;
      goto LABEL_179;
    case 131:
      uint64_t v19 = 110;
      goto LABEL_163;
    case 132:
      uint64_t v19 = 112;
LABEL_163:
      uint64_t v21 = v19;
      int v1 = 398;
      goto LABEL_174;
    case 133:
      uint64_t v21 = 0;
      int v1 = 456;
      goto LABEL_174;
    case 134:
      uint64_t v21 = 112;
      int v1 = 698;
      goto LABEL_174;
    case 135:
      uint64_t v21 = 0;
      int v1 = 720;
      goto LABEL_174;
    case 136:
      uint64_t v21 = 0;
      int v1 = 721;
      goto LABEL_174;
    case 137:
      uint64_t v21 = 0;
      int v1 = 734;
      goto LABEL_174;
    case 138:
      uint64_t v21 = 0;
      int v1 = 1125;
      goto LABEL_174;
    case 139:
      uint64_t v21 = 0;
      int v1 = 1250;
      goto LABEL_174;
    case 140:
      uint64_t v21 = 0;
      int v1 = 1251;
      goto LABEL_174;
    case 141:
      uint64_t v21 = 0;
      int v1 = 1252;
      goto LABEL_174;
    case 142:
      uint64_t v21 = 0;
      int v1 = 1253;
LABEL_174:
      uint64_t v2 = 116;
      goto LABEL_179;
    case 143:
      snprintf(__str, 0x18uLL, "%c%d%c", 116, 698, 116);
      goto LABEL_180;
    case 144:
      uint64_t v21 = 0;
      int v1 = 100;
      uint64_t v2 = 113;
      goto LABEL_179;
    case 145:
      uint64_t v21 = 0;
      int v1 = 301;
LABEL_178:
      uint64_t v2 = 110;
LABEL_179:
      snprintf(__str, 0x18uLL, "%c%d%c", v2, v1, v21);
LABEL_180:
      if (!__str[0]) {
        goto LABEL_182;
      }
      CFStringRef result = CFStringCreateWithCString(0, __str, 0x600u);
      break;
    default:
LABEL_182:
      CFStringRef result = 0;
      break;
  }
  return result;
}

void ___ZL14queryBuildTypev_block_invoke()
{
  int v0 = (const void *)MGCopyAnswer();
  uint64_t v11 = v0;
  char v12 = 1;
  int v1 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
  if (v0) {
    BOOL v2 = CFEqual(v0, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  gIsInternal = v2;
  CFStringRef v3 = (const __CFString *)MGCopyAnswer();
  CFStringRef v9 = v3;
  char v10 = 1;
  if (v3) {
    BOOL v4 = CFEqual(@"Carrier", v3);
  }
  else {
    BOOL v4 = 0;
  }
  gIsCarrier = v4;
  uint64_t v5 = (const void *)MGCopyAnswer();
  uint64_t v7 = v5;
  char v8 = 1;
  if (v5) {
    BOOL v6 = CFEqual(v5, *v1) != 0;
  }
  else {
    BOOL v6 = 0;
  }
  gIsUI = v6;
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v7);
  CACFString::~CACFString((CACFString *)&v9);
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v11);
}

void sub_1BA9368D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
}

void CACFString::~CACFString(CACFString *this)
{
  if (*((unsigned char *)this + 8))
  {
    BOOL v2 = *(const void **)this;
    if (*(void *)this) {
      CFRelease(v2);
    }
  }
}

void CACFBoolean::~CACFBoolean(CACFBoolean *this)
{
  if (*((unsigned char *)this + 8))
  {
    BOOL v2 = *(const void **)this;
    if (*(void *)this) {
      CFRelease(v2);
    }
  }
}

uint64_t CACFString::operator=(uint64_t a1, uint64_t a2)
{
  CFStringRef v3 = *(const void **)a2;
  if (*(void *)a2 != *(void *)a1)
  {
    if (*(void *)a1) {
      BOOL v5 = *(unsigned char *)(a1 + 8) == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5)
    {
      CFRelease(*(CFTypeRef *)a1);
      CFStringRef v3 = *(const void **)a2;
    }
    *(void *)a1 = v3;
    int v6 = *(unsigned __int8 *)(a2 + 8);
    *(unsigned char *)(a1 + 8) = v6;
    if (v6) {
      BOOL v7 = v3 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7) {
      CFRetain(v3);
    }
  }
  return a1;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1BA9F2710](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      char v10 = std::locale::use_facet(&v14, MEMORY[0x1E4FBA258]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x1BA9F2720](v13);
  return a1;
}

void sub_1BA936B38(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x1BA9F2720](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1BA936B18);
}

void sub_1BA936B8C(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_1BA936D0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

double CACFPreferencesGetAppFloatValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  CFStringRef v4 = (const __CFString *)CFPreferencesCopyAppValue(a1, a2);
  CFStringRef v6 = v4;
  if (a3) {
    size_t v7 = a3;
  }
  else {
    size_t v7 = (BOOL *)&v10;
  }
  double v8 = CASmartPreferences::InterpretFloat(v4, v7, v5);
  if (v6) {
    CFRelease(v6);
  }
  return v8;
}

double CASmartPreferences::InterpretFloat(const __CFString *this, unsigned char *a2, BOOL *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double valuePtr = 0.0;
  *a2 = 0;
  if (this)
  {
    CFTypeID v5 = CFGetTypeID(this);
    if (v5 == CFBooleanGetTypeID())
    {
      double valuePtr = (double)CFBooleanGetValue((CFBooleanRef)this);
LABEL_6:
      *a2 = 1;
      return valuePtr;
    }
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)this, kCFNumberDoubleType, &valuePtr);
      goto LABEL_6;
    }
    if (v5 == CFStringGetTypeID())
    {
      CFStringGetCString(this, buffer, 64, 0x600u);
      if (sscanf(buffer, "%lf", &valuePtr) == 1) {
        goto LABEL_6;
      }
    }
  }
  return valuePtr;
}

uint64_t CACFPreferencesGetAppIntegerValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  CFStringRef v4 = (const __CFString *)CFPreferencesCopyAppValue(a1, a2);
  CFStringRef v6 = v4;
  if (a3) {
    size_t v7 = a3;
  }
  else {
    size_t v7 = (BOOL *)&v10;
  }
  uint64_t v8 = CASmartPreferences::InterpretInteger(v4, v7, v5);
  if (v6) {
    CFRelease(v6);
  }
  return v8;
}

uint64_t CASmartPreferences::InterpretInteger(const __CFString *this, unsigned char *a2, BOOL *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int valuePtr = 0;
  *a2 = 0;
  if (this)
  {
    CFTypeID v5 = CFGetTypeID(this);
    if (v5 == CFBooleanGetTypeID())
    {
      int valuePtr = CFBooleanGetValue((CFBooleanRef)this);
LABEL_6:
      *a2 = 1;
      return valuePtr;
    }
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)this, kCFNumberIntType, &valuePtr);
      goto LABEL_6;
    }
    if (v5 == CFStringGetTypeID())
    {
      CFStringGetCString(this, buffer, 64, 0x600u);
      if (sscanf(buffer, "%d", &valuePtr) == 1) {
        goto LABEL_6;
      }
    }
  }
  return valuePtr;
}

BOOL CACFPreferencesGetAppBooleanValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  CFStringRef v4 = (CASmartPreferences *)CFPreferencesCopyAppValue(a1, a2);
  CFStringRef v6 = v4;
  if (a3) {
    size_t v7 = a3;
  }
  else {
    size_t v7 = (BOOL *)&v10;
  }
  BOOL v8 = CASmartPreferences::InterpretBoolean(v4, v7, v5);
  if (v6) {
    CFRelease(v6);
  }
  return v8;
}

BOOL CASmartPreferences::InterpretBoolean(CASmartPreferences *this, unsigned char *a2, BOOL *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int valuePtr = 0;
  *a2 = 0;
  if (this)
  {
    CFBooleanRef v4 = this;
    CFTypeID v5 = CFGetTypeID(this);
    if (v5 == CFBooleanGetTypeID())
    {
      LODWORD(this) = CFBooleanGetValue(v4);
LABEL_6:
      *a2 = 1;
      return this != 0;
    }
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
      LODWORD(this) = valuePtr != 0;
      goto LABEL_6;
    }
    if (v5 != CFStringGetTypeID())
    {
      LODWORD(this) = 0;
      return this != 0;
    }
    CFStringGetCString((CFStringRef)v4, buffer, 64, 0x600u);
    if (sscanf(buffer, "%d", &valuePtr) == 1)
    {
      *a2 = 1;
      LODWORD(this) = valuePtr != 0;
      return this != 0;
    }
    char v7 = buffer[0];
    if (buffer[0])
    {
      BOOL v8 = &buffer[1];
      do
      {
        *(v8 - 1) = __tolower(v7);
        int v9 = *v8++;
        char v7 = v9;
      }
      while (v9);
    }
    if (!(*(unsigned __int16 *)buffer ^ 0x6F6E | buffer[2])
      || (*(_DWORD *)buffer == 1936482662 ? (BOOL v10 = v13 == 101) : (BOOL v10 = 0), v10))
    {
      LODWORD(this) = 0;
      goto LABEL_6;
    }
    if (*(_DWORD *)buffer == 7562617 || !(*(_DWORD *)buffer ^ 0x65757274 | v13))
    {
      LODWORD(this) = 1;
      *a2 = 1;
    }
    else
    {
      LODWORD(this) = valuePtr;
    }
  }
  return this != 0;
}

uint64_t CACFPreferencesGetAppFourCCValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFStringRef v4 = (const __CFString *)CFPreferencesCopyAppValue(a1, a2);
  if (!v4)
  {
    uint64_t v7 = 0;
    BOOL v8 = 0;
    if (!a3) {
      return v7;
    }
    goto LABEL_7;
  }
  CFStringRef v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 == CFStringGetTypeID() && (CFStringGetCString(v5, buffer, 64, 0x600u), strlen(buffer) == 4))
  {
    uint64_t v7 = bswap32(*(unsigned int *)buffer);
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v7 = 0;
    BOOL v8 = 0;
  }
  CFRelease(v5);
  if (a3) {
LABEL_7:
  }
    *a3 = v8;
  return v7;
}

void ___ZN18CASmartPreferencesC2Ev_block_invoke(uint64_t a1)
{
}

void CASmartPreferences::RereadPrefs(CASmartPreferences *this)
{
  std::mutex::lock((std::mutex *)this);
  CFSetApplyFunction(*((CFSetRef *)this + 8), (CFSetApplierFunction)SynchronizePrefDomain, 0);
  BOOL v2 = (CFStringRef *)*((void *)this + 9);
  CFStringRef v3 = (CFStringRef *)*((void *)this + 10);
  while (v2 != v3)
  {
    CASmartPreferences::Pref::Load(v2);
    v2 += 6;
  }

  std::mutex::unlock((std::mutex *)this);
}

void sub_1BA937414(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t std::function<BOOL ()(void const*)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

uint64_t SynchronizePrefDomain(const __CFString *a1, void *a2)
{
  return CFPreferencesSynchronize(a1, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
}

void sub_1BA937510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA937678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void setupClientLogScopes(void)
{
  if (setupClientLogScopes(void)::once != -1) {
    dispatch_once(&setupClientLogScopes(void)::once, &__block_literal_global_1);
  }
}

void sub_1BA937898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)AVHapticClient;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA937A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA937B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_1BA937CB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA938218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9386FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_1BA938BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_1BA939048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1BA9394D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1BA9397A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9398F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA939990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA939AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA939C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA939CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA93A140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float applyImmediateParameters(float a1, float a2, uint64_t a3)
{
  int v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3 != 2000 && a3 != 1000)
  {
    if (kAVHCScope)
    {
      int v9 = *(id *)kAVHCScope;
      if (!v9) {
        return a1;
      }
    }
    else
    {
      int v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315906;
      __int16 v13 = "AVHapticClient.mm";
      __int16 v14 = 1024;
      int v15 = 506;
      __int16 v16 = 2080;
      uint64_t v17 = "applyImmediateParameters";
      __int16 v18 = 1024;
      int v19 = v3;
      _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: ImmediateParameter for ID %u is not supported", (uint8_t *)&v12, 0x22u);
    }
    float v7 = a1;
    goto LABEL_18;
  }
  float v6 = fminf(a1 * a2, 1.0);
  if ((float)(a1 * a2) <= 0.0) {
    float v7 = 0.0;
  }
  else {
    float v7 = v6;
  }
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      BOOL v8 = *(id *)kAVHCScope;
      if (v8)
      {
        int v9 = v8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          int v12 = 136316674;
          __int16 v13 = "AVHapticClient.mm";
          __int16 v14 = 1024;
          int v15 = 503;
          __int16 v16 = 2080;
          uint64_t v17 = "applyImmediateParameters";
          __int16 v18 = 1024;
          int v19 = v3;
          __int16 v20 = 2048;
          double v21 = a1;
          __int16 v22 = 2048;
          double v23 = a2;
          __int16 v24 = 2048;
          double v25 = v7;
          _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: fixed param[%u]: source value: %.2f, immediateParameter value: %.2f, result value: %.2f", (uint8_t *)&v12, 0x40u);
        }
LABEL_18:
      }
    }
  }
  return v7;
}

unint64_t HapticClientUtil::getIndexOfSplitPoint<AVHapticEvent>(void *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  unint64_t v2 = [v1 count];
  int v3 = [v1 objectAtIndexedSubscript:0];
  [v3 time];
  double v5 = v4;

  if (v2 < 2)
  {
LABEL_10:
    if (kAVHCScope)
    {
      if (*(unsigned char *)(kAVHCScope + 8))
      {
        int v12 = *(id *)kAVHCScope;
        if (v12)
        {
          __int16 v13 = v12;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            int v19 = 136315906;
            __int16 v20 = "AVHapticClient.mm";
            __int16 v21 = 1024;
            int v22 = 1534;
            __int16 v23 = 2080;
            __int16 v24 = "getIndexOfSplitPoint";
            __int16 v25 = 1024;
            unsigned int v26 = v2 >> 1;
            _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No good split point found - returning midpoint %u", (uint8_t *)&v19, 0x22u);
          }
        }
      }
    }
    unint64_t v6 = v2 >> 1;
  }
  else
  {
    unint64_t v6 = 1;
    while (1)
    {
      float v7 = [v1 objectAtIndexedSubscript:v6];
      [v7 time];
      double v9 = v8 - v5;
      if (v9 > 0.01 && v6 >= 3 * v2 / 5) {
        break;
      }
      if (v6 >= 4 * v2 / 5 && v9 > 0.0)
      {
        if (kAVHCScope)
        {
          if (*(unsigned char *)(kAVHCScope + 8))
          {
            uint64_t v17 = *(id *)kAVHCScope;
            if (v17)
            {
              int v15 = v17;
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                int v19 = 136316418;
                __int16 v20 = "AVHapticClient.mm";
                __int16 v21 = 1024;
                int v22 = 1528;
                __int16 v23 = 2080;
                __int16 v24 = "getIndexOfSplitPoint";
                __int16 v25 = 1024;
                unsigned int v26 = v2;
                __int16 v27 = 1024;
                int v28 = v6;
                __int16 v29 = 2048;
                double v30 = v9;
                __int16 v16 = "%25s:%-5d %s: Force-splitting length-%u array at index %u (delta from previous event: %f seconds)";
LABEL_27:
                _os_log_impl(&dword_1BA902000, v15, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v19, 0x32u);
              }
              goto LABEL_28;
            }
          }
        }
        goto LABEL_29;
      }
      [v7 time];
      double v5 = v11;

      if (v2 == ++v6) {
        goto LABEL_10;
      }
    }
    if (kAVHCScope)
    {
      if (*(unsigned char *)(kAVHCScope + 8))
      {
        __int16 v14 = *(id *)kAVHCScope;
        if (v14)
        {
          int v15 = v14;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            int v19 = 136316418;
            __int16 v20 = "AVHapticClient.mm";
            __int16 v21 = 1024;
            int v22 = 1521;
            __int16 v23 = 2080;
            __int16 v24 = "getIndexOfSplitPoint";
            __int16 v25 = 1024;
            unsigned int v26 = v2;
            __int16 v27 = 1024;
            int v28 = v6;
            __int16 v29 = 2048;
            double v30 = v9;
            __int16 v16 = "%25s:%-5d %s: Splitting length-%u array at index %u (delta from previous event: %f seconds)";
            goto LABEL_27;
          }
LABEL_28:
        }
      }
    }
LABEL_29:
  }
  return v6;
}

void sub_1BA93A7F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA93AA9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA93B3F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA93B5D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA93B7BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA93B914(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1BA93BDD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA93C4EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA93CBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA93D1B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA93D4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  std::mutex::unlock(v10);
  _Unwind_Resume(a1);
}

void sub_1BA93D5E4(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BA93D7B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA93D884(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BA93DAAC(_Unwind_Exception *exception_object)
{
}

void sub_1BA93DE7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA93E268(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA93E458(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA93E648(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA93E814(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA93E9C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA93EB78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA93ED28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA93EED4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA93F084(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA93F234(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA93F40C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA93F5A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA93F734(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA93F93C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA93F9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA93F9FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA93FBBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA93FD94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA94006C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  __int16 v21 = v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1BA9404A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_sync_exit(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BA940650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA94091C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA940AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_1BA940F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9412C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA941448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN16HapticClientUtil19getSortedEventArrayI13AVHapticEventEEP7NSArrayIPT_ES6__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 time];
  double v6 = v5;
  [v4 time];
  if (v6 >= v7) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = -1;
  }
  if (v6 > v7) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }

  return v9;
}

void sub_1BA94158C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN16HapticClientUtil19getSortedEventArrayI40AVHapticPlayerParameterCurveControlPointEEP7NSArrayIPT_ES6__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 time];
  double v6 = v5;
  [v4 time];
  if (v6 >= v7) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = -1;
  }
  if (v6 > v7) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }

  return v9;
}

void sub_1BA9415F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::erase(uint64_t **a1, uint64_t a2)
{
  int v3 = std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__remove_node_pointer(a1, (uint64_t *)a2);

  operator delete((void *)a2);
  return v3;
}

uint64_t *std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  unint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      int v3 = v2;
      unint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    id v4 = a2;
    do
    {
      int v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      id v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  double v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  int v3 = a2;
  if (*a2)
  {
    id v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      int v3 = a2;
      goto LABEL_7;
    }
    do
    {
      int v3 = v4;
      id v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  double v6 = (uint64_t **)v3[2];
  double v7 = *v6;
  if (*v6 == v3)
  {
    uint64_t *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      double v7 = 0;
      CFStringRef result = (uint64_t *)v2;
    }
    else
    {
      double v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      CFStringRef result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      __int16 v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      uint64_t *v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        CFStringRef result = v7;
      }
      double v7 = *(uint64_t **)(*v7 + 8);
    }
    int v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      __int16 v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        uint64_t *v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        void v7[2] = (uint64_t)v15;
        __int16 v16 = v7;
      }
      else
      {
        int v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      __int16 v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      uint64_t *v24 = v23;
      goto LABEL_72;
    }
    __int16 v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      uint64_t v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    double v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    void v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      CFStringRef result = v7;
    }
    double v7 = *(uint64_t **)v12;
  }
  int v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  __int16 v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    __int16 v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    *__int16 v20 = (uint64_t)v7;
    void v7[2] = (uint64_t)v20;
    int v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  __int16 v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t *std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__emplace_unique_key_args<unsigned long,unsigned long &,AVHapticSequenceEntry * {__strong}>(uint64_t **a1, unint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  int v8 = a1 + 1;
  double v7 = a1[1];
  if (v7)
  {
    unint64_t v9 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v10 = (uint64_t **)v7;
        unint64_t v11 = v7[4];
        if (v9 >= v11) {
          break;
        }
        double v7 = *v10;
        int v8 = v10;
        if (!*v10) {
          goto LABEL_10;
        }
      }
      if (v11 >= v9) {
        break;
      }
      double v7 = v10[1];
      if (!v7)
      {
        int v8 = v10 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v10 = a1 + 1;
LABEL_10:
    uint64_t v12 = (uint64_t *)operator new(0x30uLL);
    uint64_t v13 = *a3;
    uint64_t v14 = *a4;
    *a4 = 0;
    v12[4] = v13;
    v12[5] = v14;
    std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__insert_node_at(a1, (uint64_t)v10, v8, v12);
    return v12;
  }
  return (uint64_t *)v10;
}

uint64_t *std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  int v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  CFStringRef result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      id v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), int v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            void *v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), int v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::destroy(a1, a2[1]);

    operator delete(a2);
  }
}

void sub_1BA941EA0(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BA941F9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA94223C(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  if (a2 == 1)
  {
    uint64_t v23 = (NSException *)objc_begin_catch(exc_buf);
    uint64_t v24 = NSErrorFromNSException(v23);
    uint64_t v25 = *(void **)(a16 + 40);
    *(void *)(a16 + 40) = v24;

    objc_end_catch();
    JUMPOUT(0x1BA9421C8);
  }
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(exc_buf);
}

void sub_1BA942804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSURL *FullURLPathFromURL(NSURL *a1, NSURL *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  int v3 = a1;
  id v4 = a2;
  int v28 = v3;
  double v30 = v4;
  uint64_t v31 = [(NSURL *)v3 relativePath];
  if ([v31 characterAtIndex:0] == 47)
  {
    int v5 = v3;
    goto LABEL_41;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = v6;
  if (v4) {
    [v6 addObject:v4];
  }
  int v8 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v9 = [v8 bundleURL];

  uint64_t v27 = (void *)v9;
  [v7 addObject:v9];
  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v12 = [v10 URLsForDirectory:qword_1BA95A430[i] inDomains:1];
    if (v12) {
      [v7 addObjectsFromArray:v12];
    }
  }
  uint64_t v13 = [v10 ubiquityIdentityToken];

  if (v13)
  {
    uint64_t v14 = [v10 URLForUbiquityContainerIdentifier:0];
    if (v14) {
      [v7 addObject:v14];
    }
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v7;
  uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v34;
LABEL_15:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v34 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = (NSURL *)*(id *)(*((void *)&v33 + 1) + 8 * v17);
      if (kHAPIScope)
      {
        int v19 = *(id *)kHAPIScope;
        if (!v19) {
          goto LABEL_25;
        }
      }
      else
      {
        int v19 = MEMORY[0x1E4F14500];
        id v20 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        v38 = "CHHapticPattern.mm";
        __int16 v39 = 1024;
        int v40 = 329;
        __int16 v41 = 2080;
        int v42 = "FullURLPathFromURL";
        __int16 v43 = 2112;
        v44 = v18;
        _os_log_impl(&dword_1BA902000, v19, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Searching for resource in '%@'", buf, 0x26u);
      }

LABEL_25:
      BOOL v21 = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v31 isDirectory:0 relativeToURL:v18];
      int v5 = v21;
      if (v21)
      {
        id v32 = 0;
        BOOL v22 = [(NSURL *)v21 checkResourceIsReachableAndReturnError:&v32];
        id v23 = v32;
        if (v22)
        {
          if (kHAPIScope)
          {
            uint64_t v24 = *(id *)kHAPIScope;
            id v4 = v30;
            if (!v24)
            {
LABEL_39:

              goto LABEL_40;
            }
          }
          else
          {
            uint64_t v24 = MEMORY[0x1E4F14500];
            id v25 = MEMORY[0x1E4F14500];
            id v4 = v30;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315906;
            v38 = "CHHapticPattern.mm";
            __int16 v39 = 1024;
            int v40 = 333;
            __int16 v41 = 2080;
            int v42 = "FullURLPathFromURL";
            __int16 v43 = 2112;
            v44 = v5;
            _os_log_impl(&dword_1BA902000, v24, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Found it at '%@'", buf, 0x26u);
          }

          goto LABEL_39;
        }
        id v4 = v30;
      }
      else
      {
        id v23 = 0;
      }

      if (v15 == ++v17)
      {
        uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
        if (v15) {
          goto LABEL_15;
        }
        break;
      }
    }
  }
  int v5 = 0;
LABEL_40:

LABEL_41:

  return v5;
}

void sub_1BA942E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1BA94393C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA943A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA943BEC(_Unwind_Exception *exception_object)
{
}

void sub_1BA943E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA94423C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  BOOL v22 = v20;
  objc_destroyWeak(v22);

  objc_destroyWeak(&location);
  objc_sync_exit(v19);

  _Unwind_Resume(a1);
}

void sub_1BA9444F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA944590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9448BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA944984(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1BA945034(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, long long a12)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    int v19 = CALog::LogObjIfEnabled((CALog *)1, *(void *)(v15 + 4008), v18);
    id v20 = v19;
    if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315650;
      *(void *)((char *)&buf + 4) = "CHHapticEngine.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 553;
      WORD1(a12) = 2080;
      *(void *)((char *)&a12 + 4) = "-[CHHapticEngine handleMediaServerRecovery:]_block_invoke";
      _os_log_impl(&dword_1BA902000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: FATAL ERROR: Unable to reconnect to server", (uint8_t *)&buf, 0x1Cu);
    }

    BOOL v21 = (void *)v12[7];
    v12[7] = 0;

    objc_end_catch();
    JUMPOUT(0x1BA944F98);
  }

  _Unwind_Resume(a1);
}

void sub_1BA945234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA9452A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA945510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9456DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);

  _Unwind_Resume(a1);
}

void sub_1BA9458B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA945AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA945CC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1BA945E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA94604C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  objc_destroyWeak(v15);
  _Unwind_Resume(a1);
}

void sub_1BA946130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BA946624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA946C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  objc_sync_exit(v13);
  _Unwind_Resume(a1);
}

void sub_1BA946FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)CHHapticEngine;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA9473B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9478E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA947BC4()
{
}

void sub_1BA947D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA948454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1BA948614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BA948CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1BA948EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA949344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9496D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA949788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA949924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA949AB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA949C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA949DD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA949F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA94A2DC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BA94A520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BA94A7D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA94ABA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_1BA94AED0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA94B0CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA94B5E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA94BAD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA94BEEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_1BA94C158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BA94C2F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA94CA74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA94DDA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::mutex *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *a56)
{
  std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>::~tuple(v59 - 256);
  _Block_object_dispose((const void *)(v59 - 192), 8);

  _Block_object_dispose(&a35, 8);
  if (v57) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v57);
  }
  std::mutex::unlock(a16);

  _Unwind_Resume(a1);
}

void sub_1BA94E078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>::~tuple(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

id AVFASoftLink::getAVAudioFormat(AVFASoftLink *this)
{
  id v1 = *(void **)CADeprecated::TSingleton<AVFASoftLink>::instance();

  return v1;
}

void sub_1BA94E254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA94E938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  std::mutex::unlock(v20);
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

uint64_t newStateFromOld(int a1, int a2, int a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  switch(a1)
  {
    case 0:
      if (a3) {
        unsigned int v6 = 3;
      }
      else {
        unsigned int v6 = 2;
      }
      if (a2) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      break;
    case 1:
      if (a2) {
        unsigned int v8 = 3;
      }
      else {
        unsigned int v8 = 1;
      }
      if (a3) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = v8;
      }
      break;
    case 2:
      if (a2) {
        unsigned int v9 = 2;
      }
      else {
        unsigned int v9 = 0;
      }
      BOOL v10 = a3 == 0;
      goto LABEL_20;
    case 3:
      unsigned int v9 = a3 ^ 1;
      BOOL v10 = a2 == 0;
LABEL_20:
      if (v10) {
        uint64_t v7 = v9;
      }
      else {
        uint64_t v7 = 3;
      }
      break;
    default:
      uint64_t v7 = 0;
      break;
  }
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      uint64_t v11 = *(id *)kHAPIScope;
      if (v11)
      {
        uint64_t v12 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          int v14 = 136316674;
          uint64_t v15 = "CHHapticEngine.mm";
          __int16 v16 = 1024;
          int v17 = 2208;
          __int16 v18 = 2080;
          int v19 = "newStateFromOld";
          __int16 v20 = 1024;
          int v21 = a1;
          __int16 v22 = 1024;
          int v23 = a2;
          __int16 v24 = 1024;
          int v25 = a3;
          __int16 v26 = 1024;
          int v27 = v7;
          _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Old: %d mute: %d running: %d => New: %d", (uint8_t *)&v14, 0x34u);
        }
      }
    }
  }
  return v7;
}

void std::__tree<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<unsigned long const,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<unsigned long const,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,0>(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 16);
  if (v2)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

void std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::destroy(a1, a2[1]);

    operator delete(a2);
  }
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t **std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::__emplace_unique_key_args<unsigned long,unsigned long &,std::tuple<NSURL * {__strong},NSDictionary * {__strong}>>(uint64_t **a1, unint64_t *a2, void *a3, long long *a4)
{
  unsigned int v8 = a1 + 1;
  uint64_t v7 = a1[1];
  if (v7)
  {
    unint64_t v9 = *a2;
    while (1)
    {
      while (1)
      {
        BOOL v10 = (uint64_t **)v7;
        unint64_t v11 = v7[4];
        if (v9 >= v11) {
          break;
        }
        uint64_t v7 = *v10;
        unsigned int v8 = v10;
        if (!*v10) {
          goto LABEL_10;
        }
      }
      if (v11 >= v9) {
        break;
      }
      uint64_t v7 = v10[1];
      if (!v7)
      {
        unsigned int v8 = v10 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    BOOL v10 = a1 + 1;
LABEL_10:
    uint64_t v12 = (char *)operator new(0x38uLL);
    *((void *)v12 + 4) = *a3;
    long long v13 = *a4;
    *(void *)a4 = 0;
    *((void *)a4 + 1) = 0;
    *(_OWORD *)(v12 + 40) = v13;
    std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__insert_node_at(a1, (uint64_t)v10, v8, (uint64_t *)v12);
    return (uint64_t **)v12;
  }
  return v10;
}

uint64_t *std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::erase(uint64_t **a1, uint64_t a2)
{
  int v3 = std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__remove_node_pointer(a1, (uint64_t *)a2);

  operator delete((void *)a2);
  return v3;
}

uint64_t **std::__tree<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>>>::__emplace_unique_key_args<unsigned long,unsigned long &,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>(uint64_t **a1, unint64_t *a2, void *a3, uint64_t a4)
{
  unsigned int v8 = a1 + 1;
  uint64_t v7 = a1[1];
  unint64_t v9 = a1 + 1;
  BOOL v10 = a1 + 1;
  if (v7)
  {
    unint64_t v11 = *a2;
    while (1)
    {
      while (1)
      {
        BOOL v10 = (uint64_t **)v7;
        unint64_t v12 = v7[4];
        if (v11 >= v12) {
          break;
        }
        uint64_t v7 = *v10;
        unint64_t v9 = v10;
        if (!*v10) {
          goto LABEL_9;
        }
      }
      if (v12 >= v11) {
        break;
      }
      uint64_t v7 = v10[1];
      if (!v7)
      {
        unint64_t v9 = v10 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    long long v13 = (char *)operator new(0x48uLL);
    v16[1] = v8;
    *((void *)v13 + 4) = *a3;
    *(_OWORD *)(v13 + 40) = *(_OWORD *)a4;
    *(void *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    uint64_t v14 = *(void *)(a4 + 16);
    *(void *)(a4 + 16) = 0;
    *((void *)v13 + 7) = v14;
    *((_DWORD *)v13 + 16) = *(_DWORD *)(a4 + 24);
    char v17 = 1;
    std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__insert_node_at(a1, (uint64_t)v10, v9, (uint64_t *)v13);
    v16[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,void *>>>>::reset[abi:ne180100]((uint64_t)v16, 0);
    return (uint64_t **)v13;
  }
  return v10;
}

void std::unique_ptr<std::__tree_node<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<unsigned long const,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void *std::allocate_shared[abi:ne180100]<AudioResource,std::allocator<AudioResource>,NSURL * {__strong}&,void>@<X0>(NSURL **a1@<X1>, void *a2@<X8>)
{
  id v4 = operator new(0x68uLL);
  CFStringRef result = std::__shared_ptr_emplace<AudioResource>::__shared_ptr_emplace[abi:ne180100]<NSURL * {__strong}&,std::allocator<AudioResource>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_1BA94EFB8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<AudioResource>::__shared_ptr_emplace[abi:ne180100]<NSURL * {__strong}&,std::allocator<AudioResource>,0>(void *a1, NSURL **a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_1F1452A20;
  AudioResource::AudioResource((AudioResource *)(a1 + 3), *a2);
  return a1;
}

void sub_1BA94F018(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<AudioResource>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F1452A20;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<AudioResource>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F1452A20;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1BA9F2850);
}

void std::__shared_ptr_emplace<AudioResource>::__on_zero_shared(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1BA94F318(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA94F5CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA94F8B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA94FBC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA94FD6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA94FECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA95020C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA950448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9506F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)AVHapticPlayer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA950B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1BA950CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA950E24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA950F60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA951188(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA95132C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA95150C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9516C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA951858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9519E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA951B9C(_Unwind_Exception *a1)
{
  unsigned int v6 = v5;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_1BA951D64(_Unwind_Exception *a1)
{
  unsigned int v6 = v5;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_1BA951F2C(_Unwind_Exception *a1)
{
  unsigned int v6 = v5;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_1BA9520B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9525EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA9527AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA952974(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA952DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v19 = va_arg(va2, void);
  uint64_t v21 = va_arg(va2, void);
  uint64_t v22 = va_arg(va2, void);
  uint64_t v23 = va_arg(va2, void);
  _Block_object_dispose((const void *)(v12 - 112), 8);

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);

  _Unwind_Resume(a1);
}

void sub_1BA9532AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v19 = va_arg(va2, void);
  uint64_t v21 = va_arg(va2, void);
  uint64_t v22 = va_arg(va2, void);
  uint64_t v23 = va_arg(va2, void);
  _Block_object_dispose((const void *)(v12 - 112), 8);

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);

  _Unwind_Resume(a1);
}

void sub_1BA953724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1BA953B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v12 = v10;

  a9.super_class = (Class)AVHapticSequence;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA953E34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA953F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA953FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA954040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA954110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA954188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA9543E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA954940(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA954CBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA954FE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA955304(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA955620(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA955900(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA955C70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA955F80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA956504(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BA95686C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA956B44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA956D44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA956E08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA956EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA956FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void AudioResource::decrementAllocatedBytes()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v0 = 136315394;
    id v1 = "AudioResource.mm";
    __int16 v2 = 1024;
    int v3 = 154;
    _os_log_impl(&dword_1BA902000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(_sTotalAllocatedBytes >= bytes) != 0 is false]: ", (uint8_t *)&v0, 0x12u);
  }
  __break(1u);
}

void PlatformUtilities_iOS::IsTelephonyCaptureAllowed()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl(&dword_1BA902000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, " Unhandled case in switch", v0, 2u);
}

uint64_t AudioConverterPrepare()
{
  return MEMORY[0x1F410B520]();
}

uint64_t CAReportingClientCreateReporterID()
{
  return MEMORY[0x1F4179738]();
}

uint64_t CAReportingClientDestroyReporterID()
{
  return MEMORY[0x1F4179740]();
}

uint64_t CAReportingClientSendMessage()
{
  return MEMORY[0x1F4179758]();
}

uint64_t CAReportingClientSetAudioServiceType()
{
  return MEMORY[0x1F4179780]();
}

uint64_t CAReportingClientSetConfiguration()
{
  return MEMORY[0x1F4179788]();
}

uint64_t CAReportingClientStartReporter()
{
  return MEMORY[0x1F41797A0]();
}

uint64_t CAReportingClientStopReporter()
{
  return MEMORY[0x1F41797B0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2 = MEMORY[0x1F40D70D8](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
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

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D84D0](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1F40D8608](theString, suffix);
}

void CFStringTrim(CFMutableStringRef theString, CFStringRef trimString)
{
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D86F8]();
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x1F410B6C8](inExtAudioFile);
}

OSStatus ExtAudioFileGetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1F410B6D0](inExtAudioFile, *(void *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus ExtAudioFileOpenURL(CFURLRef inURL, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x1F410B6E0](inURL, outExtAudioFile);
}

OSStatus ExtAudioFileRead(ExtAudioFileRef inExtAudioFile, UInt32 *ioNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x1F410B6E8](inExtAudioFile, ioNumberFrames, ioData);
}

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x1F410B6F8](inExtAudioFile, *(void *)&inPropertyID, *(void *)&inPropertyDataSize, inPropertyData);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1F417CE50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1F417E3A8]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E898]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
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

void std::exception::~exception(std::exception *this)
{
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
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

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t clientParamToSynthParam()
{
  return MEMORY[0x1F410BC78]();
}

uint64_t clientParamValueToFixedParamValue()
{
  return MEMORY[0x1F410BC80]();
}

uint64_t createHapticCommandWriter()
{
  return MEMORY[0x1F410BC88]();
}

uint64_t destroyHapticCommandWriter()
{
  return MEMORY[0x1F410BC90]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

uint64_t reserveForWrite()
{
  return MEMORY[0x1F410BCA0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t updateReservedWriteIndex()
{
  return MEMORY[0x1F410BCA8]();
}

uint64_t writeCommand()
{
  return MEMORY[0x1F410BCB0]();
}

uint64_t writeCommandToReserved()
{
  return MEMORY[0x1F410BCB8]();
}