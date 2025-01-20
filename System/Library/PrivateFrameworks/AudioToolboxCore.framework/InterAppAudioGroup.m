@interface InterAppAudioGroup
+ (id)sharedInstance;
- (id)getApps:(float)a3;
@end

@implementation InterAppAudioGroup

- (id)getApps:(float)a3
{
  mach_msg_return_t v35;
  mach_msg_return_t v36;
  vm_size_t v37;
  const void *v38;
  NSMutableArray *v40;
  void *v41;
  InterAppAudioAppInfo v42;
  int v43;
  unsigned char msg[64];
  uint64_t v45;

  v45 = *MEMORY[0x1E4F143B8];
  v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = CADeprecated::TSingleton<IPCAUClient>::sInstance;
  if (CADeprecated::TSingleton<IPCAUClient>::sInstance)
  {
    *(void *)msg = CADeprecated::TSingleton<IPCAUClient>::sInstance;
    msg[8] = (*(uint64_t (**)(uint64_t))(*(void *)CADeprecated::TSingleton<IPCAUClient>::sInstance + 16))(CADeprecated::TSingleton<IPCAUClient>::sInstance);
    if (!*(void *)(v5 + 328) || (v6 = *(void **)(v5 + 312), v41 = (void *)(v5 + 320), v6 == (void *)(v5 + 320)))
    {
      CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)msg);
    }
    else
    {
      v40 = v4;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      do
      {
        uint64_t v10 = v6[5];
        int v11 = *(_DWORD *)(*(void *)(v10 + 16) + 52);
        CFUUIDRef v12 = CFUUIDCreateFromUUIDBytes(0, *(CFUUIDBytes *)(v10 + 56));
        if (v12)
        {
          CFStringRef v13 = CFUUIDCreateString(0, v12);
          CFStringRef v14 = v13;
          if (v13)
          {
            CFStringRef v15 = CFStringCreateWithFormat(0, 0, @"com-apple-audiounit:%@/%c", v13, 78);
            if (v15)
            {
              CFURLRef v16 = CFURLCreateWithString(0, v15, 0);
              CFRelease(v15);
            }
            else
            {
              CFURLRef v16 = 0;
            }
            CFRelease(v14);
          }
          else
          {
            CFURLRef v16 = 0;
          }
          CFRelease(v12);
        }
        else
        {
          CFURLRef v16 = 0;
        }
        v17 = *(__CFString **)(*(void *)(v10 + 16) + 168);
        Icon = AudioComponentGetIcon(*(AudioComponent *)(v10 + 48), a3);
        CFRetain(v17);
        if (v8 >= v9)
        {
          unint64_t v20 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v8 - (char *)v7) >> 3) + 1;
          if (v20 > 0x666666666666666) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          if (0x999999999999999ALL * (((char *)v9 - (char *)v7) >> 3) > v20) {
            unint64_t v20 = 0x999999999999999ALL * (((char *)v9 - (char *)v7) >> 3);
          }
          if (0xCCCCCCCCCCCCCCCDLL * (((char *)v9 - (char *)v7) >> 3) >= 0x333333333333333) {
            unint64_t v21 = 0x666666666666666;
          }
          else {
            unint64_t v21 = v20;
          }
          if (v21)
          {
            if (v21 > 0x666666666666666) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            v22 = (char *)operator new(40 * v21);
          }
          else
          {
            v22 = 0;
          }
          v23 = &v22[8 * (((char *)v8 - (char *)v7) >> 3)];
          char *v23 = 0;
          *((_DWORD *)v23 + 1) = v11;
          *((void *)v23 + 1) = Icon;
          *((void *)v23 + 2) = v17;
          *((void *)v23 + 3) = 0;
          *((void *)v23 + 4) = v16;
          if (v8 == v7)
          {
            v27 = (InterAppAudioAppInfo *)&v22[8 * (((char *)v8 - (char *)v7) >> 3)];
          }
          else
          {
            v24 = &v22[8 * (((char *)v8 - (char *)v7) >> 3)];
            do
            {
              long long v25 = *(_OWORD *)&v8[-1].var0;
              long long v26 = *(_OWORD *)&v8[-1].var3;
              v27 = (InterAppAudioAppInfo *)(v24 - 40);
              *((void *)v24 - 1) = v8[-1].var5;
              *(_OWORD *)(v24 - 24) = v26;
              *(_OWORD *)(v24 - 40) = v25;
              --v8;
              v24 -= 40;
            }
            while (v8 != v7);
          }
          v9 = (InterAppAudioAppInfo *)&v22[40 * v21];
          v8 = (InterAppAudioAppInfo *)(v23 + 40);
          if (v7) {
            operator delete(v7);
          }
          v7 = v27;
        }
        else
        {
          v8->var0 = 0;
          __int16 v19 = *(_WORD *)&v42.var0;
          *(&v8->var0 + 3) = *(&v42.var0 + 2);
          *(_WORD *)(&v8->var0 + 1) = v19;
          v8->var1 = v11;
          v8->var2 = (ObjCImage *)Icon;
          v8->var3 = v17;
          v8->var4 = 0;
          v8->var5 = v16;
          ++v8;
        }
        v28 = (void *)v6[1];
        if (v28)
        {
          do
          {
            v29 = v28;
            v28 = (void *)*v28;
          }
          while (v28);
        }
        else
        {
          do
          {
            v29 = (void *)v6[2];
            BOOL v30 = *v29 == (void)v6;
            v6 = v29;
          }
          while (!v30);
        }
        v6 = v29;
      }
      while (v29 != v41);
      CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)msg);
      v4 = v40;
      if (v7 != v8)
      {
        v31 = v7;
        do
          AddApp(v31++, a3, v40);
        while (v31 != v8);
      }
      if (v7) {
        operator delete(v7);
      }
    }
  }
  if (CADeprecated::TSingleton<AURegistrationServerConnection>::sInstance)
  {
    v32 = v4;
    int v33 = *(_DWORD *)(CADeprecated::TSingleton<AURegistrationServerConnection>::sInstance + 48);
    memset(&msg[4], 0, 60);
    mach_port_name_t reply_port = mig_get_reply_port();
    *(_DWORD *)&msg[8] = v33;
    *(_DWORD *)&msg[12] = reply_port;
    *(_DWORD *)msg = 5395;
    *(void *)&msg[16] = 0x15F9E00000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      mach_port_name_t reply_port = *(_DWORD *)&msg[12];
    }
    v35 = mach_msg((mach_msg_header_t *)msg, 275, 0x18u, 0x40u, reply_port, gMediaServerTimeout, 0);
    v36 = v35;
    if ((v35 - 268435458) <= 0xE && ((1 << (v35 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg[12]);
      v4 = v32;
    }
    else
    {
      v4 = v32;
      if (!v35)
      {
        if (*(_DWORD *)&msg[20] != 90114
          || (*(_DWORD *)msg & 0x80000000) == 0
          || *(_DWORD *)&msg[24] != 1
          || *(_DWORD *)&msg[4] != 56
          || *(_DWORD *)&msg[8]
          || msg[39] != 1
          || (v37 = *(unsigned int *)&msg[40], *(_DWORD *)&msg[40] != *(_DWORD *)&msg[52]))
        {
LABEL_65:
          mach_msg_destroy((mach_msg_header_t *)msg);
          return v4;
        }
        v38 = *(const void **)&msg[28];
        goto LABEL_68;
      }
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    }
    if (v36 == 268435460)
    {
      if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
        mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
      }
      goto LABEL_65;
    }
    if (v36) {
      return v4;
    }
    v38 = 0;
    v37 = 0;
LABEL_68:
    CADeserializer::CADeserializer((CADeserializer *)msg, v38);
    while (*(void *)&msg[24] != *(void *)&msg[16])
    {
      v43 = 0;
      CADeserializer::Read((CADeserializer *)msg, &v43);
      v42.var0 = v43 != 0;
      CADeserializer::Read((CADeserializer *)msg, &v42.var1);
      v42.var2 = 0;
      operator>>();
      operator>>();
      operator>>();
      AddApp(&v42, a3, v4);
    }
    mig_deallocate((vm_address_t)v38, v37);
    MEMORY[0x192FC7A90](msg);
  }
  return v4;
}

+ (id)sharedInstance
{
  if (gInterAppAudioGroupOnce != -1) {
    dispatch_once(&gInterAppAudioGroupOnce, &__block_literal_global_1393);
  }
  return (id)gInterAppAudioGroup;
}

InterAppAudioGroup *__36__InterAppAudioGroup_sharedInstance__block_invoke()
{
  result = objc_alloc_init(InterAppAudioGroup);
  gInterAppAudioGroup = (uint64_t)result;
  return result;
}

@end