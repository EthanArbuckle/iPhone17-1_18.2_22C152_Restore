@interface WKWebGeolocationPolicyDecider
+ (id)sharedPolicyDecider;
- (WKWebGeolocationPolicyDecider)init;
- (id).cxx_construct;
- (id)_siteFile;
- (id)_siteFileInContainerDirectory:(id)a3 creatingIntermediateDirectoriesIfNecessary:(BOOL)a4;
- (int64_t)_getChallengeCountFromHistoryForToken:(id)a3 requestingURL:(id)a4;
- (void)_addChallengeCount:(int64_t)a3 forToken:(id)a4 requestingURL:(id)a5;
- (void)_executeNextChallenge;
- (void)_finishActiveChallenge:(BOOL)a3;
- (void)_loadWithCompletionHandler:(id)a3;
- (void)_save;
- (void)clearCache;
- (void)dealloc;
- (void)decidePolicyForGeolocationRequestFromOrigin:(const void *)a3 requestingURL:(id)a4 view:(id)a5 listener:(id)a6;
@end

@implementation WKWebGeolocationPolicyDecider

+ (id)sharedPolicyDecider
{
  id result = (id)+[WKWebGeolocationPolicyDecider sharedPolicyDecider]::policyDecider;
  if (!+[WKWebGeolocationPolicyDecider sharedPolicyDecider]::policyDecider)
  {
    id result = objc_alloc_init(WKWebGeolocationPolicyDecider);
    +[WKWebGeolocationPolicyDecider sharedPolicyDecider]::policyDecider = (uint64_t)result;
  }
  return result;
}

- (WKWebGeolocationPolicyDecider)init
{
  v7.receiver = self;
  v7.super_class = (Class)WKWebGeolocationPolicyDecider;
  v2 = [(WKWebGeolocationPolicyDecider *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.WebKit.WKWebGeolocationPolicyDecider", 0);
    m_ptr = v2->_diskDispatchQueue.m_ptr;
    v2->_diskDispatchQueue.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)clearGeolocationCache, @"com.apple.locationd.appreset", 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.locationd.appreset", 0);
  v4.receiver = self;
  v4.super_class = (Class)WKWebGeolocationPolicyDecider;
  [(WKWebGeolocationPolicyDecider *)&v4 dealloc];
}

- (void)decidePolicyForGeolocationRequestFromOrigin:(const void *)a3 requestingURL:(id)a4 view:(id)a5 listener:(id)a6
{
  uint64_t v11 = WTF::fastMalloc((WTF *)0x28);
  *(_OWORD *)uint64_t v11 = 0u;
  *(_OWORD *)(v11 + 16) = 0u;
  *(void *)(v11 + 32) = 0;
  if ([a4 isFileURL])
  {
    uint64_t v12 = [a4 path];
    goto LABEL_7;
  }
  int v13 = *((_DWORD *)a3 + 6);
  if (v13)
  {
    if (v13 != 1)
    {
      std::__throw_bad_variant_access[abi:sn180100]();
      __break(1u);
      goto LABEL_52;
    }
    v14 = (void *)MEMORY[0x1E4F30980];
  }
  else
  {
    v14 = (char *)a3 + 8;
  }
  if (*v14)
  {
    uint64_t v12 = WTF::StringImpl::operator NSString *();
LABEL_7:
    v15 = (__CFString *)v12;
    if (!v12) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v15 = &stru_1EEA10550;
LABEL_8:
  CFRetain(v15);
LABEL_9:
  v16 = *(const void **)v11;
  *(void *)uint64_t v11 = v15;
  if (v16) {
    CFRelease(v16);
  }
  if (a4) {
    CFRetain(a4);
  }
  v17 = *(const void **)(v11 + 16);
  *(void *)(v11 + 16) = a4;
  if (v17) {
    CFRelease(v17);
  }
  if (a5) {
    CFRetain(a5);
  }
  v18 = *(const void **)(v11 + 24);
  *(void *)(v11 + 24) = a5;
  if (v18) {
    CFRelease(v18);
  }
  if (a6) {
    CFRetain(a6);
  }
  v19 = *(const void **)(v11 + 32);
  *(void *)(v11 + 32) = a6;
  if (v19) {
    CFRelease(v19);
  }
  unint64_t m_start = self->_challenges.m_start;
  unint64_t m_end = self->_challenges.m_end;
  if (!m_start)
  {
    uint64_t m_capacity = self->_challenges.m_buffer.m_capacity;
    if (m_end)
    {
      if (m_end != m_capacity - 1) {
        goto LABEL_42;
      }
    }
    else if (m_capacity)
    {
      unint64_t m_end = 0;
      goto LABEL_42;
    }
LABEL_31:
    uint64_t v23 = m_capacity;
    unint64_t v24 = ((unint64_t)m_capacity >> 2) + m_capacity;
    if (v24 <= 0xF) {
      unint64_t v24 = 15;
    }
    if (v24 < 0x1FFFFFFF)
    {
      m_buffer = (char *)self->_challenges.m_buffer.m_buffer;
      unsigned int v26 = v24 + 1;
      v27 = (char *)WTF::fastMalloc((WTF *)(8 * (v24 + 1)));
      self->_challenges.m_buffer.uint64_t m_capacity = v26;
      self->_challenges.m_buffer.m_buffer = v27;
      unint64_t v28 = self->_challenges.m_start;
      unint64_t v29 = self->_challenges.m_end;
      if (v28 <= v29)
      {
        memcpy(&v27[8 * v28], &m_buffer[8 * v28], 8 * v29 - 8 * v28);
        if (!m_buffer)
        {
LABEL_41:
          unint64_t m_end = self->_challenges.m_end;
          goto LABEL_42;
        }
      }
      else
      {
        memcpy(v27, m_buffer, 8 * v29);
        unint64_t v30 = self->_challenges.m_start;
        unint64_t v31 = v30 - v23 + self->_challenges.m_buffer.m_capacity;
        memcpy((char *)self->_challenges.m_buffer.m_buffer + 8 * v31, &m_buffer[8 * v30], 8 * v23 - 8 * v30);
        self->_challenges.unint64_t m_start = v31;
        if (!m_buffer) {
          goto LABEL_41;
        }
      }
      if (self->_challenges.m_buffer.m_buffer == m_buffer)
      {
        self->_challenges.m_buffer.m_buffer = 0;
        self->_challenges.m_buffer.uint64_t m_capacity = 0;
      }
      WTF::fastFree((WTF *)m_buffer, v32);
      goto LABEL_41;
    }
LABEL_52:
    __break(0xC471u);
    return;
  }
  if (m_end + 1 == m_start)
  {
    LODWORD(m_capacity) = self->_challenges.m_buffer.m_capacity;
    goto LABEL_31;
  }
LABEL_42:
  *((void *)self->_challenges.m_buffer.m_buffer + m_end) = v11;
  if (m_end == self->_challenges.m_buffer.m_capacity - 1) {
    unint64_t v33 = 0;
  }
  else {
    unint64_t v33 = m_end + 1;
  }
  self->_challenges.unint64_t m_end = v33;

  [(WKWebGeolocationPolicyDecider *)self _executeNextChallenge];
}

- (void)_executeNextChallenge
{
  unint64_t m_start = self->_challenges.m_start;
  if (m_start != self->_challenges.m_end && !self->_activeChallenge.__ptr_.__value_)
  {
    m_buffer = self->_challenges.m_buffer.m_buffer;
    v5 = (PermissionRequest *)m_buffer[m_start];
    m_buffer[m_start] = 0;
    v6 = self->_challenges.m_buffer.m_buffer;
    objc_super v7 = (WTF *)v6[m_start];
    v6[m_start] = 0;
    if (v7)
    {
      std::default_delete<PermissionRequest>::operator()[abi:sn180100](v7, (void *)a2);
      unint64_t m_start = self->_challenges.m_start;
    }
    if (m_start == self->_challenges.m_buffer.m_capacity - 1) {
      unint64_t v8 = 0;
    }
    else {
      unint64_t v8 = m_start + 1;
    }
    self->_challenges.unint64_t m_start = v8;
    value = self->_activeChallenge.__ptr_.__value_;
    self->_activeChallenge.__ptr_.__value_ = v5;
    if (value) {
      std::default_delete<PermissionRequest>::operator()[abi:sn180100]((WTF *)value, (void *)a2);
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__WKWebGeolocationPolicyDecider__executeNextChallenge__block_invoke;
    v10[3] = &unk_1E5812158;
    v10[4] = self;
    [(WKWebGeolocationPolicyDecider *)self _loadWithCompletionHandler:v10];
  }
}

void __54__WKWebGeolocationPolicyDecider__executeNextChallenge__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 56) + 24) _shouldBypassGeolocationPromptForTesting];
  dispatch_queue_t v3 = *(void ***)(a1 + 32);
  if (v2) {
    goto LABEL_4;
  }
  uint64_t v4 = [v3 _getChallengeCountFromHistoryForToken:*v3[7] requestingURL:v3[7][2]];
  if (v4 >= 2)
  {
    dispatch_queue_t v3 = *(void ***)(a1 + 32);
LABEL_4:
    uint64_t v5 = 1;
LABEL_5:
    [v3 _finishActiveChallenge:v5];
    return;
  }
  if (v4 <= -2)
  {
    dispatch_queue_t v3 = *(void ***)(a1 + 32);
    uint64_t v5 = 0;
    goto LABEL_5;
  }
  v6 = (void *)[MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v8 = [v6 objectForInfoDictionaryKey:*MEMORY[0x1E4F1CC48]];
  if (!v8)
  {
    uint64_t v8 = [v6 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D008]];
    if (!v8)
    {
      uint64_t v8 = [v6 objectForInfoDictionaryKey:*MEMORY[0x1E4F1CFF0]];
      if (!v8) {
        uint64_t v8 = [v6 bundleIdentifier];
      }
    }
  }
  v9 = NSString;
  WebCore::localizedString((uint64_t *)&v40, (WebCore *)@"“%@” would like to use your current location.", v7);
  if (v40) {
    v10 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v10 = &stru_1EEA10550;
  }
  uint64_t v12 = (WebKit *)objc_msgSend(v9, "stringWithFormat:", v10, **(void **)(*(void *)(a1 + 32) + 56));
  int v13 = v40;
  v40 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v11);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  v14 = (void *)[objc_alloc((Class)getCLLocationManagerClass()) init];
  if ([v14 authorizationStatus] - 3 > 1)
  {
    BOOL v16 = 0;
    if (!v14) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  BOOL v16 = [v14 accuracyAuthorization] == 0;
  if (v14) {
LABEL_24:
  }
    CFRelease(v14);
LABEL_25:
  v17 = NSString;
  if (v16)
  {
    WebCore::localizedString((uint64_t *)&v40, (WebCore *)@"This website will use your precise location because “%@” currently has access to your precise location.", v15);
    if (!v40)
    {
      v18 = &stru_1EEA10550;
      goto LABEL_30;
    }
  }
  else
  {
    WebCore::localizedString((uint64_t *)&v40, (WebCore *)@"This website will use your approximate location because “%@” currently has access to your approximate location.", v15);
    if (!v40)
    {
      v18 = &stru_1EEA10550;
      goto LABEL_30;
    }
  }
  v18 = (__CFString *)WTF::StringImpl::operator NSString *();
LABEL_30:
  v20 = (NSString *)objc_msgSend(v17, "stringWithFormat:", v18, v8);
  v21 = v40;
  v40 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2) {
      WTF::StringImpl::destroy(v21, v19);
    }
    else {
      *(_DWORD *)v21 -= 2;
    }
  }
  WebCore::localizedString((uint64_t *)&v40, (WebCore *)@"Allow", (const __CFString *)v19);
  if (v40)
  {
    uint64_t v23 = (__CFString *)WTF::StringImpl::operator NSString *();
    unint64_t v24 = v40;
    v40 = 0;
    if (v24)
    {
      if (*(_DWORD *)v24 == 2) {
        WTF::StringImpl::destroy(v24, v22);
      }
      else {
        *(_DWORD *)v24 -= 2;
      }
    }
  }
  else
  {
    uint64_t v23 = &stru_1EEA10550;
  }
  WebCore::localizedString((uint64_t *)&v40, (WebCore *)@"Don’t Allow (website location dialog)", (const __CFString *)v22);
  if (v40)
  {
    unsigned int v26 = (__CFString *)WTF::StringImpl::operator NSString *();
    v27 = v40;
    v40 = 0;
    if (v27)
    {
      if (*(_DWORD *)v27 == 2) {
        WTF::StringImpl::destroy(v27, v25);
      }
      else {
        *(_DWORD *)v27 -= 2;
      }
    }
  }
  else
  {
    unsigned int v26 = &stru_1EEA10550;
  }
  WebKit::createUIAlertController(v12, v20, &v40);
  unint64_t v28 = (void *)MEMORY[0x1E4F42720];
  id location = 0;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3321888768;
  v38[2] = __54__WKWebGeolocationPolicyDecider__executeNextChallenge__block_invoke_2;
  v38[3] = &__block_descriptor_40_e8_32c72_ZTSKZZ54__WKWebGeolocationPolicyDecider__executeNextChallenge_EUb_E3__2_e23_v16__0__UIAlertAction_8l;
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v39 = 0;
  objc_copyWeak(&v39, &location);
  uint64_t v29 = [v28 actionWithTitle:v26 style:0 handler:v38];
  objc_destroyWeak(&location);
  unint64_t v30 = (void *)MEMORY[0x1E4F42720];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3321888768;
  v35[2] = __54__WKWebGeolocationPolicyDecider__executeNextChallenge__block_invoke_47;
  v35[3] = &__block_descriptor_40_e8_32c72_ZTSKZZ54__WKWebGeolocationPolicyDecider__executeNextChallenge_EUb_E3__3_e23_v16__0__UIAlertAction_8l;
  unint64_t v31 = *(void **)(a1 + 32);
  id location = 0;
  objc_initWeak(&location, v31);
  id v36 = 0;
  objc_copyWeak(&v36, &location);
  uint64_t v32 = [v30 actionWithTitle:v23 style:0 handler:v35];
  objc_destroyWeak(&location);
  [(WTF::StringImpl *)v40 addAction:v29];
  [(WTF::StringImpl *)v40 addAction:v32];
  unint64_t v33 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 56) + 24), "_wk_viewControllerForFullScreenPresentation");
  [v33 presentViewController:v40 animated:1 completion:0];
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v39);
  v34 = v40;
  v40 = 0;
  if (v34) {
    CFRelease(v34);
  }
}

void __54__WKWebGeolocationPolicyDecider__executeNextChallenge__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v2 = WeakRetained;
    [WeakRetained _finishActiveChallenge:0];
    CFRelease(v2);
  }
}

void __54__WKWebGeolocationPolicyDecider__executeNextChallenge__block_invoke_47(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v2 = WeakRetained;
    [WeakRetained _finishActiveChallenge:1];
    CFRelease(v2);
  }
}

- (void)_finishActiveChallenge:(BOOL)a3
{
  value = self->_activeChallenge.__ptr_.__value_;
  if (value)
  {
    BOOL v4 = a3;
    if (a3) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = -1;
    }
    [(WKWebGeolocationPolicyDecider *)self _addChallengeCount:v6 forToken:*(void *)value requestingURL:*((void *)value + 2)];
    CFStringRef v7 = (void *)*((void *)self->_activeChallenge.__ptr_.__value_ + 4);
    if (v4) {
      [v7 allow];
    }
    else {
      [v7 deny];
    }
    v9 = self->_activeChallenge.__ptr_.__value_;
    self->_activeChallenge.__ptr_.__value_ = 0;
    if (v9) {
      std::default_delete<PermissionRequest>::operator()[abi:sn180100]((WTF *)v9, v8);
    }
    [(WKWebGeolocationPolicyDecider *)self _executeNextChallenge];
  }
}

- (void)clearCache
{
  m_ptr = self->_sites.m_ptr;
  self->_sites.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  BOOL v4 = self->_diskDispatchQueue.m_ptr;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__WKWebGeolocationPolicyDecider_clearCache__block_invoke;
  block[3] = &unk_1E5812158;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __43__WKWebGeolocationPolicyDecider_clearCache__block_invoke(uint64_t a1)
{
  int v2 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [*(id *)(a1 + 32) _siteFile];

  return objc_msgSend(v2, "_web_removeFileOnlyAtPath:", v3);
}

- (id)_siteFileInContainerDirectory:(id)a3 creatingIntermediateDirectoriesIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = (void *)[a3 stringByAppendingPathComponent:@"Library/WebKit"];
  if (v4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v5, 0);
  }

  return (id)[v5 stringByAppendingPathComponent:@"GeolocationSitesV2.plist"];
}

- (id)_siteFile
{
  id result = (id)-[WKWebGeolocationPolicyDecider _siteFile]::sSiteFile;
  if (!-[WKWebGeolocationPolicyDecider _siteFile]::sSiteFile)
  {
    id result = [(WKWebGeolocationPolicyDecider *)self _siteFileInContainerDirectory:NSHomeDirectory() creatingIntermediateDirectoriesIfNecessary:1];
    -[WKWebGeolocationPolicyDecider _siteFile]::sSiteFile = (uint64_t)result;
  }
  return result;
}

- (void)_loadWithCompletionHandler:(id)a3
{
  if (self->_sites.m_ptr)
  {
    uint64_t v3 = (void (*)(id))*((void *)a3 + 2);
    v3(a3);
  }
  else
  {
    m_ptr = self->_diskDispatchQueue.m_ptr;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__WKWebGeolocationPolicyDecider__loadWithCompletionHandler___block_invoke;
    v5[3] = &unk_1E5813670;
    v5[4] = self;
    v5[5] = a3;
    dispatch_async(m_ptr, v5);
  }
}

void __60__WKWebGeolocationPolicyDecider__loadWithCompletionHandler___block_invoke(uint64_t a1)
{
  int v2 = (const void *)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfFile:options:error:", objc_msgSend(*(id *)(a1 + 32), "_siteFile"), 1, 0);
  uint64_t v3 = v2;
  if (v2)
  {
    CFRetain(v2);
    uint64_t v9 = 200;
    uint64_t v10 = 0;
    BOOL v4 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:v3 options:2 format:&v9 error:&v10];
    id v5 = v4;
    if (v4) {
      CFRetain(v4);
    }
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __60__WKWebGeolocationPolicyDecider__loadWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1EE9D4550;
  block[4] = *(void *)(a1 + 32);
  CFTypeRef cf = v5;
  if (v5) {
    CFRetain(v5);
  }
  void block[5] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
  CFTypeRef v6 = cf;
  CFTypeRef cf = 0;
  if (v6) {
    CFRelease(v6);
  }
  if (v3) {
    CFRelease(v3);
  }
  if (v5) {
    CFRelease(v5);
  }
}

uint64_t __60__WKWebGeolocationPolicyDecider__loadWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 16))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3)
    {
      CFRetain(*(CFTypeRef *)(a1 + 48));
      BOOL v4 = *(const void **)(v2 + 16);
      *(void *)(v2 + 16) = v3;
      if (v4) {
        CFRelease(v4);
      }
    }
    else
    {
      *(void *)(v2 + 16) = 0;
    }
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v5();
}

- (void)_save
{
  if ([self->_sites.m_ptr count])
  {
    uint64_t v8 = 0;
    uint64_t v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:self->_sites.m_ptr format:200 options:0 error:&v8];
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = [(WKWebGeolocationPolicyDecider *)self _siteFile];
      m_ptr = self->_diskDispatchQueue.m_ptr;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__WKWebGeolocationPolicyDecider__save__block_invoke;
      block[3] = &unk_1E5812CB8;
      block[4] = v4;
      void block[5] = v5;
      dispatch_async(m_ptr, block);
    }
  }
}

uint64_t __38__WKWebGeolocationPolicyDecider__save__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeToFile:*(void *)(a1 + 40) atomically:1];
}

- (int64_t)_getChallengeCountFromHistoryForToken:(id)a3 requestingURL:(id)a4
{
  uint64_t v5 = [self->_sites.m_ptr objectForKey:a3];
  if (!v5) {
    return 0;
  }
  CFTypeRef v6 = (void *)v5;
  if (objc_msgSend((id)objc_msgSend(a4, "scheme"), "isEqualToString:", @"data")) {
    return 0;
  }
  CFStringRef v7 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"ChallengeDate"), "dateByAddingTimeInterval:", 86400.0);
  if (objc_msgSend(v7, "compare:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date")) == -1) {
    return 0;
  }
  uint64_t v8 = (void *)[v6 objectForKey:@"ChallengeCount"];

  return [v8 integerValue];
}

- (void)_addChallengeCount:(int64_t)a3 forToken:(id)a4 requestingURL:(id)a5
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int64_t v8 = [(WKWebGeolocationPolicyDecider *)self _getChallengeCountFromHistoryForToken:a4 requestingURL:a5];
  v9[0] = @"ChallengeCount";
  v9[1] = @"ChallengeDate";
  v10[0] = [NSNumber numberWithInteger:v8 + a3];
  v10[1] = [MEMORY[0x1E4F1C9C8] date];
  objc_msgSend(self->_sites.m_ptr, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v10, v9, 2), a4);
  [(WKWebGeolocationPolicyDecider *)self _save];
}

- (void).cxx_destruct
{
  value = self->_activeChallenge.__ptr_.__value_;
  self->_activeChallenge.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<PermissionRequest>::operator()[abi:sn180100]((WTF *)value, (void *)a2);
  }
  unint64_t m_start = self->_challenges.m_start;
  unint64_t m_end = self->_challenges.m_end;
  m_buffer = (WTF *)self->_challenges.m_buffer.m_buffer;
  if (m_start <= m_end)
  {
    if (m_start == m_end) {
      goto LABEL_22;
    }
    int v13 = (WTF **)((char *)m_buffer + 8 * m_start);
    uint64_t v14 = 8 * m_end - 8 * m_start;
    do
    {
      CFStringRef v15 = *v13;
      *int v13 = 0;
      if (v15) {
        std::default_delete<PermissionRequest>::operator()[abi:sn180100](v15, (void *)a2);
      }
      ++v13;
      v14 -= 8;
    }
    while (v14);
  }
  else
  {
    if (m_end)
    {
      uint64_t v7 = 8 * m_end;
      do
      {
        int64_t v8 = *(WTF **)m_buffer;
        *(void *)m_buffer = 0;
        if (v8) {
          std::default_delete<PermissionRequest>::operator()[abi:sn180100](v8, (void *)a2);
        }
        m_buffer = (WTF *)((char *)m_buffer + 8);
        v7 -= 8;
      }
      while (v7);
      m_buffer = (WTF *)self->_challenges.m_buffer.m_buffer;
      unint64_t m_start = self->_challenges.m_start;
    }
    uint64_t m_capacity = self->_challenges.m_buffer.m_capacity;
    if (m_start != m_capacity)
    {
      uint64_t v10 = (WTF **)((char *)m_buffer + 8 * m_start);
      uint64_t v11 = 8 * m_capacity - 8 * m_start;
      do
      {
        uint64_t v12 = *v10;
        __CFString *v10 = 0;
        if (v12) {
          std::default_delete<PermissionRequest>::operator()[abi:sn180100](v12, (void *)a2);
        }
        ++v10;
        v11 -= 8;
      }
      while (v11);
    }
  }
  m_buffer = (WTF *)self->_challenges.m_buffer.m_buffer;
LABEL_22:
  if (m_buffer)
  {
    self->_challenges.m_buffer.m_buffer = 0;
    self->_challenges.m_buffer.uint64_t m_capacity = 0;
    WTF::fastFree(m_buffer, (void *)a2);
  }
  m_ptr = self->_sites.m_ptr;
  self->_sites.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v17 = self->_diskDispatchQueue.m_ptr;
  self->_diskDispatchQueue.m_ptr = 0;
  if (v17)
  {
    CFRelease(v17);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end