@interface WKRotationCoordinatorObserver
- (WKRotationCoordinatorObserver)initWithRequestManagerProxy:(void *)a3;
- (id).cxx_construct;
- (optional<WebCore::VideoFrameRotation>)start:(const void *)a3 layer:(id)a4;
- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(WTF::StringImpl *)a2 change:context:;
- (unsigned)observeValueForKeyPath:(unsigned int *)result ofObject:change:context:;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)observeValueForKeyPath:(void *)a1 ofObject:(WTF::StringImpl *)a2 change:context:;
- (void)stop:(const void *)a3;
@end

@implementation WKRotationCoordinatorObserver

- (WKRotationCoordinatorObserver)initWithRequestManagerProxy:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WKRotationCoordinatorObserver;
  v4 = [(WKRotationCoordinatorObserver *)&v10 init];
  v6 = v4;
  if (v4)
  {
    v7 = *(DefaultWeakPtrImpl **)a3;
    *(void *)a3 = 0;
    m_ptr = (unsigned int *)v4->_managerProxy.m_impl.m_ptr;
    v6->_managerProxy.m_impl.m_ptr = v7;
    if (m_ptr)
    {
      if (atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v5);
      }
    }
  }
  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  m_ptr = self->_managerProxy.m_impl.m_ptr;
  if (!m_ptr
    || !*((void *)m_ptr + 1)
    || !objc_msgSend(a3, "isEqualToString:", @"videoRotationAngleForHorizonLevelPreview", a4, a5, a6))
  {
    return;
  }
  MEMORY[0x19972EAD0](&v20, objc_msgSend((id)objc_msgSend(a4, "device"), "uniqueID"));
  v9 = (WTF::RunLoop *)[a4 videoRotationAngleForHorizonLevelPreview];
  if (v10 >= 2147483650.0 || v10 <= -2147483650.0) {
    goto LABEL_9;
  }
  int v15 = (int)v10;
  if ((int)v10 == 90)
  {
    __int16 v12 = 90;
    goto LABEL_10;
  }
  if (v15 == 270)
  {
    __int16 v12 = 270;
    goto LABEL_10;
  }
  if (v15 != 180) {
LABEL_9:
  }
    __int16 v12 = 0;
  else {
    __int16 v12 = 180;
  }
LABEL_10:
  WTF::RunLoop::main(v9);
  cf[0] = self;
  CFRetain(self);
  cf[1] = self;
  WTF::String::isolatedCopy();
  uint64_t v13 = WTF::fastMalloc((WTF *)0x28);
  *(void *)uint64_t v13 = &unk_1EE9D0278;
  *(_OWORD *)(v13 + 8) = *(_OWORD *)cf;
  *(void *)(v13 + 24) = v18;
  *(_WORD *)(v13 + 32) = v12;
  uint64_t v19 = v13;
  WTF::RunLoop::dispatch();
  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
  }
  v16 = v20;
  v20 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy(v16, v14);
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
}

- (optional<WebCore::VideoFrameRotation>)start:(const void *)a3 layer:(id)a4
{
  p_m_coordinators = (uint64_t *)&self->m_coordinators;
  m_tableForLLDB = self->m_coordinators.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB
    || (WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::RetainPtr<AVCaptureDeviceRotationCoordinator>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::RetainPtr<AVCaptureDeviceRotationCoordinator>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::RetainPtr<AVCaptureDeviceRotationCoordinator>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RetainPtr<AVCaptureDeviceRotationCoordinator>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand((uint64_t *)&self->m_coordinators, 0), (m_tableForLLDB = (_DWORD *)*p_m_coordinators) != 0))
  {
    int v9 = *(m_tableForLLDB - 2);
  }
  else
  {
    int v9 = 0;
  }
  unsigned int v10 = *(_DWORD *)(*(void *)a3 + 16);
  if (v10 >= 0x100) {
    unsigned int v11 = v10 >> 8;
  }
  else {
    unsigned int v11 = WTF::StringImpl::hashSlowCase(*(WTF::StringImpl **)a3);
  }
  __int16 v12 = 0;
  for (int i = 1; ; ++i)
  {
    unsigned int v14 = v11 & v9;
    int v15 = (uint64_t *)&m_tableForLLDB[4 * (v11 & v9)];
    v16 = (WTF *)*v15;
    if (*v15 == -1)
    {
      __int16 v12 = (uint64_t *)&m_tableForLLDB[4 * v14];
      goto LABEL_13;
    }
    if (!v16) {
      break;
    }
    if (WTF::equal(v16, *(const WTF::StringImpl **)a3, (const WTF::StringImpl *)a3)) {
      goto LABEL_27;
    }
LABEL_13:
    unsigned int v11 = i + v14;
  }
  if (v12)
  {
    *__int16 v12 = 0;
    v12[1] = 0;
    --*(_DWORD *)(*p_m_coordinators - 16);
    int v15 = v12;
  }
  WTF::String::operator=(v15, (WTF::StringImpl **)a3);
  v17 = (const void *)v15[1];
  v15[1] = 0;
  if (v17) {
    CFRelease(v17);
  }
  uint64_t v18 = *p_m_coordinators;
  if (*p_m_coordinators) {
    int v19 = *(_DWORD *)(v18 - 12) + 1;
  }
  else {
    int v19 = 1;
  }
  *(_DWORD *)(v18 - 12) = v19;
  uint64_t v20 = *p_m_coordinators;
  if (*p_m_coordinators) {
    int v21 = *(_DWORD *)(v20 - 12);
  }
  else {
    int v21 = 0;
  }
  uint64_t v22 = (*(_DWORD *)(v20 - 16) + v21);
  unint64_t v23 = *(unsigned int *)(v20 - 4);
  if (v23 > 0x400)
  {
    if (v23 <= 2 * v22) {
LABEL_26:
    }
      int v15 = (uint64_t *)WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::RetainPtr<AVCaptureDeviceRotationCoordinator>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::RetainPtr<AVCaptureDeviceRotationCoordinator>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::RetainPtr<AVCaptureDeviceRotationCoordinator>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RetainPtr<AVCaptureDeviceRotationCoordinator>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(p_m_coordinators, (WTF::StringImpl **)v15);
  }
  else if (3 * v23 <= 4 * v22)
  {
    goto LABEL_26;
  }
LABEL_27:
  v24 = (void *)v15[1];
  if (v24)
  {
LABEL_28:
    [v24 videoRotationAngleForHorizonLevelPreview];
    if (v25 >= 2147483650.0 || v25 <= -2147483650.0)
    {
LABEL_35:
      int v27 = 0;
      goto LABEL_36;
    }
    int v27 = (int)v25;
    if ((int)v25 == 90) {
      goto LABEL_36;
    }
    if (v27 == 270)
    {
      int v28 = 256;
      int v27 = 14;
    }
    else
    {
      if (v27 != 180) {
        goto LABEL_35;
      }
LABEL_36:
      int v28 = 0;
    }
    int v29 = 0x10000;
  }
  else
  {
    v30 = (uint64_t (**)(CFTypeRef))MEMORY[0x1E4FB6438];
    if (((uint64_t (*)(void))*MEMORY[0x1E4FB6438])())
    {
      v31 = (void *)((uint64_t (*)(void))*MEMORY[0x1E4FB62D8])();
      v32 = *(void *)a3 ? (__CFString *)WTF::StringImpl::operator NSString *() : &stru_1EEA10550;
      v33 = (const void *)[v31 deviceWithUniqueID:v32];
      if (v33)
      {
        v34 = v33;
        CFTypeRef v35 = CFRetain(v33);
        v36 = (void *)[objc_alloc((Class)(*v30)(v35)) initWithDevice:v34 previewLayer:a4];
        [v36 addObserver:self forKeyPath:@"videoRotationAngleForHorizonLevelPreview" options:1 context:0];
        v37 = (const void *)v15[1];
        v15[1] = (uint64_t)v36;
        if (v37) {
          CFRelease(v37);
        }
        CFRelease(v34);
        v24 = (void *)v15[1];
        goto LABEL_28;
      }
    }
    int v29 = 0;
    int v27 = 0;
    int v28 = 0;
  }
  return (optional<WebCore::VideoFrameRotation>)(v27 | v29 | v28);
}

- (void)stop:(const void *)a3
{
  p_m_coordinators = (uint64_t *)&self->m_coordinators;
  m_tableForLLDB = self->m_coordinators.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    int v7 = *(m_tableForLLDB - 2);
    unsigned int v8 = *(_DWORD *)(*(void *)a3 + 16);
    if (v8 >= 0x100) {
      unsigned int v9 = v8 >> 8;
    }
    else {
      unsigned int v9 = WTF::StringImpl::hashSlowCase(*(WTF::StringImpl **)a3);
    }
    for (i = 0; ; unsigned int v9 = i + v11)
    {
      uint64_t v11 = v9 & v7;
      __int16 v12 = *(WTF **)&m_tableForLLDB[4 * v11];
      if (v12 != (WTF *)-1)
      {
        if (!v12)
        {
          uint64_t v13 = *p_m_coordinators;
          if (!*p_m_coordinators) {
            return;
          }
          unsigned int v14 = (char *)(v13 + 16 * *(unsigned int *)(v13 - 4));
          goto LABEL_13;
        }
        if (WTF::equal(v12, *(const WTF::StringImpl **)a3, (const WTF::StringImpl *)a3)) {
          break;
        }
      }
      ++i;
    }
    unsigned int v14 = (char *)&m_tableForLLDB[4 * v11];
    uint64_t v13 = *p_m_coordinators;
    if (!*p_m_coordinators) {
      goto LABEL_14;
    }
LABEL_13:
    v13 += 16 * *(unsigned int *)(v13 - 4);
LABEL_14:
    if ((char *)v13 != v14)
    {
      int v15 = (void *)*((void *)v14 + 1);
      *((void *)v14 + 1) = 0;
      uint64_t v16 = *p_m_coordinators;
      if (!*p_m_coordinators || (v16 += 16 * *(unsigned int *)(v16 - 4), (char *)v16 != v14))
      {
        if ((char *)v16 != v14)
        {
          WTF::HashTraits<WTF::String>::customDeleteBucket((WTF::StringImpl **)v14, (WTF::StringImpl *)a2);
          v17 = (const void *)*((void *)v14 + 1);
          *((void *)v14 + 1) = 0;
          if (v17) {
            CFRelease(v17);
          }
          ++*(_DWORD *)(*p_m_coordinators - 16);
          uint64_t v18 = *p_m_coordinators;
          if (*p_m_coordinators) {
            int v19 = *(_DWORD *)(v18 - 12) - 1;
          }
          else {
            int v19 = -1;
          }
          *(_DWORD *)(v18 - 12) = v19;
          uint64_t v20 = *p_m_coordinators;
          if (*p_m_coordinators)
          {
            unsigned int v21 = 6 * *(_DWORD *)(v20 - 12);
            unsigned int v22 = *(_DWORD *)(v20 - 4);
            if (v21 < v22 && v22 >= 9) {
              WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::RetainPtr<AVCaptureDeviceRotationCoordinator>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::RetainPtr<AVCaptureDeviceRotationCoordinator>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::RetainPtr<AVCaptureDeviceRotationCoordinator>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RetainPtr<AVCaptureDeviceRotationCoordinator>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::rehash(p_m_coordinators, v22 >> 1, 0);
            }
          }
        }
      }
      if (v15)
      {
        [v15 removeObserver:self forKeyPath:@"videoRotationAngleForHorizonLevelPreview"];
        CFRelease(v15);
      }
    }
  }
}

- (void).cxx_destruct
{
  m_tableForLLDB = self->m_coordinators.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    uint64_t v4 = *(m_tableForLLDB - 1);
    if (v4)
    {
      m_table = (WTF::StringImpl **)self->m_coordinators.m_impl.var0.m_table;
      do
      {
        v6 = *m_table;
        if (*m_table != (WTF::StringImpl *)-1)
        {
          int v7 = m_table[1];
          m_table[1] = 0;
          if (v7)
          {
            CFRelease(v7);
            v6 = *m_table;
          }
          *m_table = 0;
          if (v6)
          {
            if (*(_DWORD *)v6 == 2) {
              WTF::StringImpl::destroy(v6, (WTF::StringImpl *)a2);
            }
            else {
              *(_DWORD *)v6 -= 2;
            }
          }
        }
        m_table += 2;
        --v4;
      }
      while (v4);
    }
    WTF::fastFree((WTF *)(m_tableForLLDB - 4), (void *)a2);
  }
  m_ptr = (unsigned int *)self->_managerProxy.m_impl.m_ptr;
  self->_managerProxy.m_impl.m_ptr = 0;
  if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, m_ptr);
    WTF::fastFree((WTF *)m_ptr, (void *)a2);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)observeValueForKeyPath:(void *)a1 ofObject:(WTF::StringImpl *)a2 change:context:
{
  *a1 = &unk_1EE9D0278;
  v3 = (WTF::StringImpl *)a1[3];
  a1[3] = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 2) {
      WTF::StringImpl::destroy(v3, a2);
    }
    else {
      *(_DWORD *)v3 -= 2;
    }
  }
  uint64_t v4 = (const void *)a1[1];
  a1[1] = 0;
  if (v4) {
    CFRelease(v4);
  }
  return a1;
}

- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(WTF::StringImpl *)a2 change:context:
{
  *(void *)this = &unk_1EE9D0278;
  v3 = (WTF::StringImpl *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 2) {
      WTF::StringImpl::destroy(v3, a2);
    }
    else {
      *(_DWORD *)v3 -= 2;
    }
  }
  uint64_t v4 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    CFRelease(v4);
  }

  return WTF::fastFree(this, a2);
}

- (unsigned)observeValueForKeyPath:(unsigned int *)result ofObject:change:context:
{
  uint64_t v1 = *(void *)(*((void *)result + 2) + 8);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 8);
    if (v2)
    {
      uint64_t v3 = (uint64_t)(result + 6);
      uint64_t v4 = (const WTF::StringImpl *)*((unsigned __int16 *)result + 16);
      uint64_t v5 = *(void *)(*(void *)(v2 + 64) + 8);
      if (v5) {
        uint64_t v6 = v5 - 16;
      }
      else {
        uint64_t v6 = 0;
      }
      return WebKit::WebPageProxy::rotationAngleForCaptureDeviceChanged(v6, v3, v4);
    }
  }
  return result;
}

@end