@interface WKUserDefaults
- (WKUserDefaults)initWithSuiteName:(id)a3;
- (id).cxx_construct;
- (void)_notifyObserversOfChangeFromValuesForKeys:(id)a3 toValuesForKeys:(id)a4;
- (void)findPreferenceChangesAndNotifyForKeys:(id)a3 toValuesForKeys:(id)a4;
@end

@implementation WKUserDefaults

- (void)findPreferenceChangesAndNotifyForKeys:(id)a3 toValuesForKeys:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  location = &self->m_observer;
  id WeakRetained = objc_loadWeakRetained(&self->m_observer.m_weakReference);
  if (WeakRetained)
  {
    CFRelease(WeakRetained);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v33 = [a3 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v33)
    {
      uint64_t v32 = *(void *)v36;
      CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
      CFStringRef userName = (const __CFString *)*MEMORY[0x1E4F1D3D0];
      CFStringRef hostName = (CFStringRef)*MEMORY[0x1E4F1D3C8];
      CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
      id v25 = a3;
      CFStringRef v26 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
      CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v36 != v32) {
            objc_enumerationMutation(a3);
          }
          CFStringRef v11 = *(const __CFString **)(*((void *)&v35 + 1) + 8 * i);
          v12 = objc_msgSend(a3, "objectForKeyedSubscript:", v11, v25, v26);
          uint64_t v13 = [a4 objectForKeyedSubscript:v11];
          if (([v12 isEqual:v13] & 1) == 0)
          {
            if (v13)
            {
              if (![(id)objc_opt_class() supportsSecureCoding]) {
                continue;
              }
              uint64_t v34 = 0;
              v14 = (void *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v34];
              v15 = v14;
              if (v14) {
                CFRetain(v14);
              }
              uint64_t v31 = [v15 base64EncodedStringWithOptions:0];
              CFStringRef v16 = hostName;
              if (v15) {
                CFRelease(v15);
              }
            }
            else
            {
              uint64_t v31 = 0;
              CFStringRef v16 = hostName;
            }
            v17 = (void *)CFPreferencesCopyValue(v11, v7, userName, v16);
            v18 = (void *)CFPreferencesCopyValue(v11, v7, v8, v9);
            id v19 = a4;
            CFStringRef v20 = v8;
            v21 = (void *)CFPreferencesCopyValue(v11, (CFStringRef)self->m_suiteName.m_ptr, v8, v9);
            if (v17 == (void *)v13
              || ((char v22 = [v17 isEqual:v13], v18 == (void *)v13) ? (v23 = 1) : (v23 = v22),
                  (v23 & 1) != 0 || [v18 isEqual:v13]))
            {
              [objc_loadWeak(&location->m_weakReference) preferenceDidChange:0 key:v11 encodedValue:v31];
            }
            if (v21 == (void *)v13 || [v21 isEqual:v13]) {
              [objc_loadWeak(&location->m_weakReference) preferenceDidChange:self->m_suiteName.m_ptr key:v11 encodedValue:v31];
            }
            if (v21) {
              CFRelease(v21);
            }
            if (v18) {
              CFRelease(v18);
            }
            v24 = v19;
            a3 = v25;
            CFStringRef v7 = v26;
            CFStringRef v8 = v20;
            a4 = v24;
            if (v17) {
              CFRelease(v17);
            }
          }
        }
        uint64_t v33 = [a3 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v33);
    }
  }
}

uint64_t __76__WKUserDefaults__notifyObserversOfChangeFromValuesForKeys_toValuesForKeys___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) findPreferenceChangesAndNotifyForKeys:*(void *)(a1 + 48) toValuesForKeys:*(void *)(a1 + 56)];
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

- (WKUserDefaults)initWithSuiteName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WKUserDefaults;
  v4 = -[WKUserDefaults initWithSuiteName:](&v7, sel_initWithSuiteName_);
  if (v4)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v4->m_suiteName.m_ptr;
    v4->m_suiteName.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    objc_storeWeak(&v4->m_observer.m_weakReference, 0);
  }
  return v4;
}

- (void)_notifyObserversOfChangeFromValuesForKeys:(id)a3 toValuesForKeys:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)WKUserDefaults;
  objc_super v7 = (WTF *)-[WKUserDefaults _notifyObserversOfChangeFromValuesForKeys:toValuesForKeys:](&v16, sel__notifyObserversOfChangeFromValuesForKeys_toValuesForKeys_);
  if ((WTF::isMainRunLoop(v7) & 1) == 0)
  {
    [(WKUserDefaults *)self findPreferenceChangesAndNotifyForKeys:a3 toValuesForKeys:a4];
    return;
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3321888768;
  v12[2] = __76__WKUserDefaults__notifyObserversOfChangeFromValuesForKeys_toValuesForKeys___block_invoke;
  v12[3] = &__block_descriptor_64_e8_32c89_ZTSKZ76__WKUserDefaults__notifyObserversOfChangeFromValuesForKeys_toValuesForKeys__E3__1_e5_v8__0l;
  if (self) {
    CFRetain(self);
  }
  if (a3) {
    CFRetain(a3);
  }
  if (a4) {
    CFRetain(a4);
  }
  v12[4] = self;
  CFTypeRef v13 = self;
  if (self) {
    CFRetain(self);
  }
  CFTypeRef v14 = a3;
  if (a3) {
    CFRetain(a3);
  }
  CFTypeRef cf = a4;
  if (!a4)
  {
    dispatch_async(global_queue, v12);
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  CFRetain(a4);
  dispatch_async(global_queue, v12);
  CFRelease(a4);
  if (a3) {
LABEL_14:
  }
    CFRelease(a3);
LABEL_15:
  if (self) {
    CFRelease(self);
  }
  CFTypeRef v9 = cf;
  CFTypeRef cf = 0;
  if (v9) {
    CFRelease(v9);
  }
  CFTypeRef v10 = v14;
  CFTypeRef v14 = 0;
  if (v10) {
    CFRelease(v10);
  }
  CFTypeRef v11 = v13;
  CFTypeRef v13 = 0;
  if (v11) {
    CFRelease(v11);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->m_observer.m_weakReference);
  m_ptr = self->m_suiteName.m_ptr;
  self->m_suiteName.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

@end