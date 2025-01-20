@interface WKWebView(WKPrivate)
- (uint64_t)_adjustVisibilityForTargetedElements:()WKPrivate completionHandler:;
- (uint64_t)_archiveWithConfiguration:()WKPrivate completionHandler:;
- (uint64_t)_clearServiceWorkerEntitlementOverride:()WKPrivate;
- (uint64_t)_completeTextManipulation:()WKPrivate completion:;
- (uint64_t)_completeTextManipulationForItems:()WKPrivate completion:;
- (uint64_t)_dataTaskWithRequest:()WKPrivate runAtForegroundPriority:completionHandler:;
- (uint64_t)_didLoadAppInitiatedRequest:()WKPrivate;
- (uint64_t)_didLoadNonAppInitiatedRequest:()WKPrivate;
- (uint64_t)_executeEditCommand:()WKPrivate argument:completion:;
- (uint64_t)_frameTrees:()WKPrivate;
- (uint64_t)_frames:()WKPrivate;
- (uint64_t)_getApplicationManifestWithCompletionHandler:()WKPrivate;
- (uint64_t)_getContentsAsAttributedStringWithCompletionHandler:()WKPrivate;
- (uint64_t)_getContentsAsStringWithCompletionHandler:()WKPrivate;
- (uint64_t)_getContentsAsStringWithCompletionHandlerKeepIPCConnectionAliveForTesting:()WKPrivate;
- (uint64_t)_getContentsOfAllFramesAsStringWithCompletionHandler:()WKPrivate;
- (uint64_t)_getMainResourceDataWithCompletionHandler:()WKPrivate;
- (uint64_t)_getPDFFirstPageSizeInFrame:()WKPrivate completionHandler:;
- (uint64_t)_getProcessDisplayNameWithCompletionHandler:()WKPrivate;
- (uint64_t)_getTextFragmentMatchWithCompletionHandler:()WKPrivate;
- (uint64_t)_insertAttachmentWithFileWrapper:()WKPrivate contentType:completion:;
- (uint64_t)_isJITEnabled:()WKPrivate;
- (uint64_t)_loadAndDecodeImage:()WKPrivate constrainedToSize:maximumBytesFromNetwork:completionHandler:;
- (uint64_t)_loadServiceWorker:()WKPrivate usingModules:completionHandler:;
- (uint64_t)_numberOfVisibilityAdjustmentRectsWithCompletionHandler:()WKPrivate;
- (uint64_t)_pauseNowPlayingMediaSession:()WKPrivate;
- (uint64_t)_playPredominantOrNowPlayingMediaSession:()WKPrivate;
- (uint64_t)_removeDataDetectedLinks:()WKPrivate;
- (uint64_t)_requestTargetedElementInfo:()WKPrivate completionHandler:;
- (uint64_t)_resetVisibilityAdjustmentsForTargetedElements:()WKPrivate completionHandler:;
- (uint64_t)_resumePage:()WKPrivate;
- (uint64_t)_saveResources:()WKPrivate suggestedFileName:completionHandler:;
- (uint64_t)_sessionStateWithFilter:()WKPrivate;
- (uint64_t)_setDisplayCaptureState:()WKPrivate completionHandler:;
- (uint64_t)_setInputDelegate:;
- (uint64_t)_setInputDelegate:()WKPrivate;
- (uint64_t)_setSystemAudioCaptureState:()WKPrivate completionHandler:;
- (uint64_t)_showWarningViewWithURL:()WKPrivate title:warning:detailsWithLinks:completionHandler:;
- (uint64_t)_simulateClickOverFirstMatchingTextInViewportWithUserInteraction:()WKPrivate completionHandler:;
- (uint64_t)_startTextManipulationsWithConfiguration:()WKPrivate completion:;
- (uint64_t)_suspendPage:()WKPrivate;
- (uint64_t)_targetedPreviewForElementWithID:()WKPrivate completionHandler:;
- (void)_completeTextManipulationForItems:()WKPrivate completion:;
- (void)_dataTaskWithRequest:()WKPrivate runAtForegroundPriority:completionHandler:;
- (void)_frameTrees:()WKPrivate;
- (void)_frames:()WKPrivate;
- (void)_getApplicationManifestWithCompletionHandler:()WKPrivate;
- (void)_getContentsAsAttributedStringWithCompletionHandler:()WKPrivate;
- (void)_loadAndDecodeImage:()WKPrivate constrainedToSize:maximumBytesFromNetwork:completionHandler:;
- (void)_requestTargetedElementInfo:()WKPrivate completionHandler:;
- (void)_setInputDelegate:()WKPrivate;
- (void)_startTextManipulationsWithConfiguration:()WKPrivate completion:;
- (void)_targetedPreviewForElementWithID:()WKPrivate completionHandler:;
@end

@implementation WKWebView(WKPrivate)

- (uint64_t)_setInputDelegate:()WKPrivate
{
  *a1 = &unk_1EE9C4DF0;
  objc_destroyWeak(a1 + 1);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_setInputDelegate:()WKPrivate
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v12 = (WebKit::CompletionHandlerCallChecker *)objc_loadWeakRetained(WeakRetained + 58);
    if (objc_opt_respondsToSelector())
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a5[3]];
      uint64_t v14 = a5[3];
      if (v14)
      {
        uint64_t v15 = 16 * v14;
        v16 = (void *)(*(void *)a5 + 8);
        do
        {
          if (*v16) {
            v17 = (__CFString *)WTF::StringImpl::operator NSString *();
          }
          else {
            v17 = &stru_1EEA10550;
          }
          if (*(v16 - 1)) {
            v18 = (__CFString *)WTF::StringImpl::operator NSString *();
          }
          else {
            v18 = &stru_1EEA10550;
          }
          [v13 setObject:v17 forKey:v18];
          v16 += 2;
          v15 -= 16;
        }
        while (v15);
      }
      if (a6) {
        API::Object::toNSObject(a6, &cf);
      }
      else {
        CFTypeRef cf = 0;
      }
      WebKit::CompletionHandlerCallChecker::create(v12, (objc_object *)sel__webView_willSubmitFormValues_userObject_submissionHandler_, &v24);
      uint64_t v19 = *a7;
      *a7 = 0;
      uint64_t v20 = v24;
      CFTypeRef v21 = cf;
      v22 = malloc_type_malloc(0x30uLL, 0x10E0040FAC56454uLL);
      void *v22 = MEMORY[0x1E4F14398];
      v22[1] = 50331650;
      v22[2] = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView(WKPrivate) _setInputDelegate:]::FormClient::willSubmitForm(WebKit::WebPageProxy &,WebKit::WebFrameProxy &,WebKit::WebFrameProxy &,WTF::Vector<std::pair<WTF::String,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&,API::Object *,WTF::CompletionHandler<void ()(void)> &&)::{lambda(void)#1}>(-[WKWebView(WKPrivate) _setInputDelegate:]::FormClient::willSubmitForm(WebKit::WebPageProxy &,WebKit::WebFrameProxy &,WebKit::WebFrameProxy &,WTF::Vector<std::pair<WTF::String,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&,API::Object *,WTF::CompletionHandler<void ()(void)> &&)::{lambda(void)#1})::{lambda(void *)#1}::__invoke;
      v22[3] = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView(WKPrivate) _setInputDelegate:]::FormClient::willSubmitForm(WebKit::WebPageProxy &,WebKit::WebFrameProxy &,WebKit::WebFrameProxy &,WTF::Vector<std::pair<WTF::String,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&,API::Object *,WTF::CompletionHandler<void ()(void)> &&)::{lambda(void)#1}>(-[WKWebView(WKPrivate) _setInputDelegate:]::FormClient::willSubmitForm(WebKit::WebPageProxy &,WebKit::WebFrameProxy &,WebKit::WebFrameProxy &,WTF::Vector<std::pair<WTF::String,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&,API::Object *,WTF::CompletionHandler<void ()(void)> &&)::{lambda(void)#1})::descriptor;
      v22[4] = v19;
      v22[5] = v20;
      [(WebKit::CompletionHandlerCallChecker *)v12 _webView:v11 willSubmitFormValues:v13 userObject:v21 submissionHandler:v22];
      _Block_release(v22);
      CFTypeRef v23 = cf;
      CFTypeRef cf = 0;
      if (v23) {
        CFRelease(v23);
      }
      if (v13) {
        CFRelease(v13);
      }
    }
    else
    {
      WTF::CompletionHandler<void ()(void)>::operator()(a7);
    }
    if (v12) {
      CFRelease(v12);
    }
    CFRelease(v11);
  }
  else
  {
    WTF::CompletionHandler<void ()(void)>::operator()(a7);
  }
}

- (uint64_t)_setInputDelegate:
{
  uint64_t result = WebKit::CompletionHandlerCallChecker::completionHandlerHasBeenCalled(*(SEL **)(a1 + 40));
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 24) = 1;
    return WTF::CompletionHandler<void ()(void)>::operator()((uint64_t *)(a1 + 32));
  }
  return result;
}

- (uint64_t)_frames:()WKPrivate
{
  *(void *)a1 = &unk_1EE9C54A8;
  uint64_t v2 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v2) {
    CFRelease(*(CFTypeRef *)(v2 + 8));
  }
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  uint64_t v2;
  void *v3;
  uint64_t vars8;

  *(void *)a1 = &unk_1EE9C54A8;
  uint64_t v2 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v2) {
    CFRelease(*(CFTypeRef *)(v2 + 8));
  }
  _Block_release(*(const void **)(a1 + 8));

  return WTF::fastFree((WTF *)a1, v3);
}

- (void)_frames:()WKPrivate
{
  API::FrameTreeNode::create(a2, *(void *)(a1 + 16), &v5);
  v3 = *(const void **)(v5 + 8);
  if (v3) {
    CFRetain(*(CFTypeRef *)(v5 + 8));
  }
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = v5;
  uint64_t v5 = 0;
  if (v4) {
    CFRelease(*(CFTypeRef *)(v4 + 8));
  }
}

- (uint64_t)_frameTrees:()WKPrivate
{
  *(void *)a1 = &unk_1EE9C54D0;
  uint64_t v2 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v2) {
    CFRelease(*(CFTypeRef *)(v2 + 8));
  }
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  uint64_t v2;
  void *v3;
  uint64_t vars8;

  *(void *)a1 = &unk_1EE9C54D0;
  uint64_t v2 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v2) {
    CFRelease(*(CFTypeRef *)(v2 + 8));
  }
  _Block_release(*(const void **)(a1 + 8));

  return WTF::fastFree((WTF *)a1, v3);
}

- (void)_frameTrees:()WKPrivate
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:*(unsigned int *)(a2 + 12)];
  unsigned int v5 = *(_DWORD *)(a2 + 12);
  if (v5)
  {
    uint64_t v6 = *(void *)a2;
    uint64_t v7 = 312 * v5;
    do
    {
      API::FrameTreeNode::create(v6, *(void *)(a1 + 16), &v10);
      v8 = *(const void **)(v10 + 8);
      if (v8) {
        CFRetain(*(CFTypeRef *)(v10 + 8));
      }
      [v4 addObject:v8];
      if (v8) {
        CFRelease(v8);
      }
      uint64_t v9 = v10;
      uint64_t v10 = 0;
      if (v9) {
        CFRelease(*(CFTypeRef *)(v9 + 8));
      }
      v6 += 312;
      v7 -= 312;
    }
    while (v7);
  }
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v4) {
    CFRelease(v4);
  }
}

- (uint64_t)_executeEditCommand:()WKPrivate argument:completion:
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (uint64_t)_startTextManipulationsWithConfiguration:()WKPrivate completion:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (void)_startTextManipulationsWithConfiguration:()WKPrivate completion:
{
  v47 = a1;
  v49[4] = *(WTF::StringImpl **)MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)(a2 + 44)];
  v48 = (__CFString *)a2;
  uint64_t v4 = *(unsigned int *)(a2 + 44);
  if (!v4)
  {
LABEL_29:
    int v17 = 0;
    uint64_t v7 = v48;
    unint64_t isa = (unint64_t)v48->isa;
    unint64_t info = v48->info;
    unint64_t length = v48->length;
    unint64_t v21 = info;
    do
    {
      ++v17;
      BOOL v22 = v21 > 9;
      v21 /= 0xAuLL;
    }
    while (v22);
    int v23 = 0;
    unint64_t v24 = (unint64_t)v48->isa;
    do
    {
      ++v23;
      BOOL v22 = v24 > 9;
      v24 /= 0xAuLL;
    }
    while (v22);
    int v25 = 0;
    unint64_t v26 = v48->length;
    do
    {
      ++v25;
      BOOL v22 = v26 > 9;
      v26 /= 0xAuLL;
    }
    while (v22);
    if ((v25 & 0x80000000) == 0)
    {
      BOOL v27 = __OFADD__(v25, 1);
      int v28 = v25 + 1;
      BOOL v29 = v27;
      if ((v23 & 0x80000000) == 0 && !v29)
      {
        BOOL v27 = __OFADD__(v23, v28);
        int v30 = v23 + v28;
        if (!v27)
        {
          BOOL v27 = __OFADD__(v30, 1);
          int v31 = v30 + 1;
          BOOL v32 = v27;
          if ((v17 & 0x80000000) == 0 && !v32)
          {
            uint64_t v33 = (v17 + v31);
            if (!__OFADD__(v17, v31))
            {
              if (!v33) {
                goto LABEL_74;
              }
              if ((v33 & 0x80000000) == 0)
              {
                WTF::tryFastCompactMalloc((WTF *)(v33 + 20));
                v34 = v49[0];
                if (v49[0])
                {
                  uint64_t v35 = 0;
                  v36 = (char *)v49[0] + 20;
                  *(_DWORD *)v49[0] = 2;
                  *((_DWORD *)v34 + 1) = v33;
                  *((void *)v34 + 1) = (char *)v34 + 20;
                  *((_DWORD *)v34 + 4) = 4;
                  unint64_t v37 = info;
                  do
                  {
                    *((unsigned char *)&v49[3] + v35--) = (v37 % 0xA) | 0x30;
                    BOOL v22 = v37 > 9;
                    v37 /= 0xAuLL;
                  }
                  while (v22);
                  if (v35 + 26 <= 25) {
                    memcpy((char *)v34 + 20, (char *)&v49[3] + v35 + 1, -v35);
                  }
                  int v38 = 0;
                  do
                  {
                    ++v38;
                    BOOL v22 = info > 9;
                    info /= 0xAuLL;
                  }
                  while (v22);
                  uint64_t v39 = 0;
                  v40 = &v36[v38];
                  char *v40 = 45;
                  unint64_t v41 = isa;
                  do
                  {
                    *((unsigned char *)&v49[3] + v39--) = (v41 % 0xA) | 0x30;
                    BOOL v22 = v41 > 9;
                    v41 /= 0xAuLL;
                  }
                  while (v22);
                  v42 = v40 + 1;
                  if (v39 + 26 <= 25) {
                    memcpy(v42, (char *)&v49[3] + v39 + 1, -v39);
                  }
                  int v43 = 0;
                  do
                  {
                    ++v43;
                    BOOL v22 = isa > 9;
                    isa /= 0xAuLL;
                  }
                  while (v22);
                  uint64_t v44 = 0;
                  v45 = &v42[v43];
                  char *v45 = 45;
                  do
                  {
                    *((unsigned char *)&v49[3] + v44--) = (length % 0xA) | 0x30;
                    BOOL v22 = length > 9;
                    length /= 0xAuLL;
                  }
                  while (v22);
                  if (v44 + 26 <= 25) {
                    memcpy(v45 + 1, (char *)&v49[3] + v44 + 1, -v44);
                  }
                  goto LABEL_67;
                }
              }
            }
          }
        }
      }
    }
    __break(0xC471u);
    return;
  }
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = @"_WKTextManipulationTokenUserInfoVisibilityKey";
  uint64_t v8 = 96 * v4;
  while (1)
  {
    uint64_t v9 = objc_alloc_init(_WKTextManipulationToken);
    WTF::String::number(*(WTF::String **)(v6 + v5));
    if (v49[0]) {
      uint64_t v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v10 = &stru_1EEA10550;
    }
    -[_WKTextManipulationToken setIdentifier:](v9, "setIdentifier:", v10, v47);
    v12 = v49[0];
    v49[0] = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2) {
        WTF::StringImpl::destroy(v12, v11);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
    }
    if (*(void *)(v6 + v5 + 8)) {
      v13 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      v13 = &stru_1EEA10550;
    }
    [(_WKTextManipulationToken *)v9 setContent:v13];
    uint64_t v14 = v6 + v5;
    [(_WKTextManipulationToken *)v9 setExcluded:*(unsigned __int8 *)(v6 + v5 + 88)];
    if (!*(unsigned char *)(v6 + v5 + 80))
    {
      v16 = 0;
      goto LABEL_21;
    }
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    if (!*(unsigned char *)(v14 + 80)) {
      break;
    }
    v16 = v15;
    if (*(void *)(v6 + v5 + 32))
    {
      [v15 setObject:WTF::URL::operator NSURL *() forKey:@"_WKTextManipulationTokenUserInfoDocumentURLKey"];
      if (!*(unsigned char *)(v14 + 80)) {
        break;
      }
    }
    if (*(void *)(v14 + 16))
    {
      [v16 setObject:WTF::StringImpl::operator NSString *() forKey:@"_WKTextManipulationTokenUserInfoTagNameKey"];
      if (!*(unsigned char *)(v14 + 80)) {
        break;
      }
    }
    if (*(void *)(v6 + v5 + 24))
    {
      [v16 setObject:WTF::StringImpl::operator NSString *() forKey:@"_WKTextManipulationTokenUserInfoRoleAttributeKey"];
      if (!*(unsigned char *)(v14 + 80)) {
        break;
      }
    }
    objc_msgSend(v16, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(v6 + v5 + 72)), @"_WKTextManipulationTokenUserInfoVisibilityKey");
LABEL_21:
    [(_WKTextManipulationToken *)v9 setUserInfo:v16];
    if (v16) {
      CFRelease(v16);
    }
    if (v9)
    {
      [v3 addObject:v9];
      CFRelease(v9);
    }
    v5 += 96;
    if (v8 == v5) {
      goto LABEL_29;
    }
  }
  __break(1u);
LABEL_74:
  v34 = (WTF::StringImpl *)MEMORY[0x1E4F30960];
  *MEMORY[0x1E4F30960] += 2;
LABEL_67:
  void *v47 = [[_WKTextManipulationItem alloc] initWithIdentifier:WTF::StringImpl::operator NSString *() tokens:v3 isSubframe:LOBYTE(v7->data) isCrossSiteSubframe:BYTE1(v7->data)];
  if (*(_DWORD *)v34 == 2)
  {
    WTF::StringImpl::destroy(v34, v46);
    if (v3) {
LABEL_69:
    }
      CFRelease(v3);
  }
  else
  {
    *(_DWORD *)v34 -= 2;
    if (v3) {
      goto LABEL_69;
    }
  }
}

- (uint64_t)_completeTextManipulation:()WKPrivate completion:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_completeTextManipulationForItems:()WKPrivate completion:
{
  *(void *)a1 = &unk_1EE9C5598;
  _Block_release(*(const void **)(a1 + 16));
  uint64_t v2 = *(const void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

{
  void *v2;
  const void *v3;
  uint64_t vars8;

  *(void *)a1 = &unk_1EE9C5598;
  _Block_release(*(const void **)(a1 + 16));
  v3 = *(const void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_completeTextManipulationForItems:()WKPrivate completion:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    makeFailureSetForAllTextManipulationItems(v15, *(void **)(a1 + 8));
    uint64_t v4 = (void *)v15[0];
    (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
  }
  else
  {
    if (*(_DWORD *)(a3 + 12))
    {
      uint64_t v6 = *(void **)(a1 + 8);
      uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)(a3 + 12)];
      uint64_t v7 = *(unsigned int *)(a3 + 12);
      if (v7)
      {
        uint64_t v8 = 40 * v7;
        uint64_t v9 = *(void *)a3 + 24;
        do
        {
          unint64_t v10 = *(void *)v9;
          if (v10 < [v6 count])
          {
            uint64_t v11 = ((*(unsigned __int8 *)(v9 + 8) - 1) & 0xFC) != 0
                ? 0
                : (*(unsigned char *)(v9 + 8) - 1) + 1;
            uint64_t v12 = [v6 objectAtIndexedSubscript:*(void *)v9];
            uint64_t v14 = @"item";
            v15[0] = v12;
            uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"WKTextManipulationItemErrorDomain", v11, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1));
            if (v13) {
              [v4 addObject:v13];
            }
          }
          v9 += 40;
          v8 -= 40;
        }
        while (v8);
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
  }
  if (v4) {
    CFRelease(v4);
  }
}

- (uint64_t)_dataTaskWithRequest:()WKPrivate runAtForegroundPriority:completionHandler:
{
  *a1 = &unk_1EE9C55C0;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_dataTaskWithRequest:()WKPrivate runAtForegroundPriority:completionHandler:
{
  CFRetain(*(CFTypeRef *)(a2 + 8));
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  uint64_t v4 = *(const void **)(a2 + 8);

  CFRelease(v4);
}

- (uint64_t)_requestTargetedElementInfo:()WKPrivate completionHandler:
{
  *a1 = &unk_1EE9C5638;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_requestTargetedElementInfo:()WKPrivate completionHandler:
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned int *)a2 + 3)];
  uint64_t v5 = *((unsigned int *)a2 + 3);
  if (v5)
  {
    uint64_t v6 = *a2;
    uint64_t v7 = 8 * v5;
    do
    {
      if (*(void *)(*(void *)v6 + 8)) {
        objc_msgSend(v4, "addObject:");
      }
      v6 += 8;
      v7 -= 8;
    }
    while (v7);
  }
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v4)
  {
    CFRelease(v4);
  }
}

- (uint64_t)_loadAndDecodeImage:()WKPrivate constrainedToSize:maximumBytesFromNetwork:completionHandler:
{
  *(void *)a1 = &unk_1EE9C5660;
  v3 = *(WTF::StringImpl **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 2) {
      WTF::StringImpl::destroy(v3, a2);
    }
    else {
      *(_DWORD *)v3 -= 2;
    }
  }
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  WTF::StringImpl *v3;
  void *v4;
  uint64_t vars8;

  *(void *)a1 = &unk_1EE9C5660;
  v3 = *(WTF::StringImpl **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 2) {
      WTF::StringImpl::destroy(v3, a2);
    }
    else {
      *(_DWORD *)v3 -= 2;
    }
  }
  _Block_release(*(const void **)(a1 + 8));

  return WTF::fastFree((WTF *)a1, v4);
}

- (void)_loadAndDecodeImage:()WKPrivate constrainedToSize:maximumBytesFromNetwork:completionHandler:
{
  int v4 = *((_DWORD *)this + 20);
  if (v4 == 1)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F42A80]);
    WebCore::ShareableBitmap::makeCGImageCopy((uint64_t *)&cf, *(WebCore::ShareableBitmap **)this);
    uint64_t v7 = (const void *)[v6 initWithCGImage:cf];
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    if (v7) {
      CFRelease(v7);
    }
    CFTypeRef v8 = cf;
    CFTypeRef cf = 0;
    if (v8) {
      CFRelease(v8);
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v15 = (_Unwind_Exception *)std::__throw_bad_variant_access[abi:sn180100]();
      CFTypeRef v16 = v23;
      CFTypeRef v23 = 0;
      if (v16) {
        CFRelease(v16);
      }
      int v17 = v22;
      BOOL v22 = 0;
      if (v17)
      {
        if (*(_DWORD *)v17 == 2) {
          WTF::StringImpl::destroy(v17, v14);
        }
        else {
          *(_DWORD *)v17 -= 2;
        }
      }
      v18 = v21;
      unint64_t v21 = 0;
      if (v18)
      {
        if (*(_DWORD *)v18 == 2) {
          WTF::StringImpl::destroy(v18, v14);
        }
        else {
          *(_DWORD *)v18 -= 2;
        }
      }
      uint64_t v19 = (WTF::StringImpl *)cf;
      CFTypeRef cf = 0;
      if (v19)
      {
        if (*(_DWORD *)v19 == 2) {
          WTF::StringImpl::destroy(v19, v14);
        }
        else {
          *(_DWORD *)v19 -= 2;
        }
      }
      _Unwind_Resume(v15);
    }
    if (*((unsigned char *)this + 60))
    {
      WebCore::ResourceError::nsError(this);
      uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 8) + 16);
      v5();
    }
    else
    {
      WebCore::createInternalError();
      WebCore::ResourceError::nsError((WebCore::ResourceError *)&cf);
      (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
      CFTypeRef v10 = v23;
      CFTypeRef v23 = 0;
      if (v10) {
        CFRelease(v10);
      }
      uint64_t v11 = v22;
      BOOL v22 = 0;
      if (v11)
      {
        if (*(_DWORD *)v11 == 2) {
          WTF::StringImpl::destroy(v11, v9);
        }
        else {
          *(_DWORD *)v11 -= 2;
        }
      }
      uint64_t v12 = v21;
      unint64_t v21 = 0;
      if (v12)
      {
        if (*(_DWORD *)v12 == 2) {
          WTF::StringImpl::destroy(v12, v9);
        }
        else {
          *(_DWORD *)v12 -= 2;
        }
      }
      uint64_t v13 = (WTF::StringImpl *)cf;
      CFTypeRef cf = 0;
      if (v13)
      {
        if (*(_DWORD *)v13 == 2) {
          WTF::StringImpl::destroy(v13, v9);
        }
        else {
          *(_DWORD *)v13 -= 2;
        }
      }
    }
  }
}

- (uint64_t)_loadServiceWorker:()WKPrivate usingModules:completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_didLoadAppInitiatedRequest:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_didLoadNonAppInitiatedRequest:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_suspendPage:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_resumePage:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_getPDFFirstPageSizeInFrame:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_sessionStateWithFilter:()WKPrivate
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2) {
    return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a2 + 8));
  }
  else {
    return 1;
  }
}

- (uint64_t)_insertAttachmentWithFileWrapper:()WKPrivate contentType:completion:
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (uint64_t)_showWarningViewWithURL:()WKPrivate title:warning:detailsWithLinks:completionHandler:
{
  int v3 = *(_DWORD *)(a2 + 40);
  if (v3 == 1)
  {
    id v6 = *(WTF::StringImpl **)a2;
    if (*(void *)a2) {
      *(_DWORD *)v6 += 2;
    }
    uint64_t v11 = v6;
    WTF::URL::operator NSURL *();
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    uint64_t result = (uint64_t)v11;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2) {
        return WTF::StringImpl::destroy(v11, v7);
      }
      else {
        *(_DWORD *)v11 -= 2;
      }
    }
  }
  else
  {
    if (v3)
    {
      uint64_t v9 = (_Unwind_Exception *)std::__throw_bad_variant_access[abi:sn180100]();
      if (v10)
      {
        if (*(_DWORD *)v10 == 2) {
          WTF::StringImpl::destroy(v10, v8);
        }
        else {
          *(_DWORD *)v10 -= 2;
        }
      }
      _Unwind_Resume(v9);
    }
    int v4 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);
    return v4();
  }
  return result;
}

- (uint64_t)_isJITEnabled:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_saveResources:()WKPrivate suggestedFileName:completionHandler:
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (*a2 >= 0x100u)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    id v6 = (WTF::StringImpl *)v10[0];
    if (v10[0]) {
      uint64_t v7 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v7 = &stru_1EEA10550;
    }
    v10[0] = v7;
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", @"WKErrorDomain", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
    if (v6)
    {
      if (*(_DWORD *)v6 == 2) {
        return WTF::StringImpl::destroy(v6, v8);
      }
      else {
        *(_DWORD *)v6 -= 2;
      }
    }
  }
  else
  {
    int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);
    return v3();
  }
  return result;
}

- (uint64_t)_archiveWithConfiguration:()WKPrivate completionHandler:
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (*a2 >= 0x100u)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    id v6 = (WTF::StringImpl *)v10[0];
    if (v10[0]) {
      uint64_t v7 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v7 = &stru_1EEA10550;
    }
    v10[0] = v7;
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", @"WKErrorDomain", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
    if (v6)
    {
      if (*(_DWORD *)v6 == 2) {
        return WTF::StringImpl::destroy(v6, v8);
      }
      else {
        *(_DWORD *)v6 -= 2;
      }
    }
  }
  else
  {
    int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);
    return v3();
  }
  return result;
}

- (uint64_t)_getMainResourceDataWithCompletionHandler:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_getContentsAsStringWithCompletionHandler:()WKPrivate
{
  int v3 = *a2;
  if (*a2)
  {
    *(_DWORD *)v3 += 2;
    WTF::StringImpl::operator NSString *();
  }
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v3)
  {
    if (*(_DWORD *)v3 == 2)
    {
      return WTF::StringImpl::destroy(v3, v5);
    }
    else
    {
      *(_DWORD *)v3 -= 2;
    }
  }
  return result;
}

- (uint64_t)_getContentsAsStringWithCompletionHandlerKeepIPCConnectionAliveForTesting:()WKPrivate
{
  int v3 = *a2;
  if (*a2)
  {
    *(_DWORD *)v3 += 2;
    WTF::StringImpl::operator NSString *();
  }
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v3)
  {
    if (*(_DWORD *)v3 == 2)
    {
      return WTF::StringImpl::destroy(v3, v5);
    }
    else
    {
      *(_DWORD *)v3 -= 2;
    }
  }
  return result;
}

- (uint64_t)_getContentsOfAllFramesAsStringWithCompletionHandler:()WKPrivate
{
  int v3 = *a2;
  if (*a2)
  {
    *(_DWORD *)v3 += 2;
    WTF::StringImpl::operator NSString *();
  }
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v3)
  {
    if (*(_DWORD *)v3 == 2)
    {
      return WTF::StringImpl::destroy(v3, v5);
    }
    else
    {
      *(_DWORD *)v3 -= 2;
    }
  }
  return result;
}

- (uint64_t)_getContentsAsAttributedStringWithCompletionHandler:()WKPrivate
{
  *a1 = &unk_1EE9C5908;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_getContentsAsAttributedStringWithCompletionHandler:()WKPrivate
{
  WebCore::AttributedString::nsAttributedString((uint64_t *)&v7, this);
  if (v7) {
    WebCore::AttributedString::documentAttributesAsNSDictionary((uint64_t *)&cf, this);
  }
  else {
    createNSError(WKErrorUnknown, 0, &cf);
  }
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  if (v4) {
    CFRelease(v4);
  }
  CFTypeRef v5 = v7;
  CFTypeRef v7 = 0;
  if (v5) {
    CFRelease(v5);
  }
}

- (uint64_t)_getApplicationManifestWithCompletionHandler:()WKPrivate
{
  *a1 = &unk_1EE9C5930;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_getApplicationManifestWithCompletionHandler:()WKPrivate
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    if (*(unsigned char *)(a2 + 272))
    {
      API::ApplicationManifest::create(a2, &v6);
      (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
      CFTypeRef v4 = v6;
      id v6 = 0;
      if (v4) {
        CFRelease(*((CFTypeRef *)v4 + 1));
      }
    }
    else
    {
      CFTypeRef v5 = *(void (**)(void))(v3 + 16);
      v5();
    }
  }
}

- (uint64_t)_getTextFragmentMatchWithCompletionHandler:()WKPrivate
{
  if (*a2) {
    WTF::StringImpl::operator NSString *();
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);

  return v3();
}

- (uint64_t)_clearServiceWorkerEntitlementOverride:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_getProcessDisplayNameWithCompletionHandler:()WKPrivate
{
  if (*a2) {
    WTF::StringImpl::operator NSString *();
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);

  return v3();
}

- (uint64_t)_removeDataDetectedLinks:()WKPrivate
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 8);
    if (v4) {
      WebKit::WebPageProxy::setDataDetectionResult(v4 - 16, a2);
    }
  }
  uint64_t result = *(void *)(a1 + 8);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (uint64_t)_setDisplayCaptureState:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_setSystemAudioCaptureState:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_resetVisibilityAdjustmentsForTargetedElements:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_adjustVisibilityForTargetedElements:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_numberOfVisibilityAdjustmentRectsWithCompletionHandler:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_playPredominantOrNowPlayingMediaSession:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_pauseNowPlayingMediaSession:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_simulateClickOverFirstMatchingTextInViewportWithUserInteraction:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_targetedPreviewForElementWithID:()WKPrivate completionHandler:
{
  *(void *)a1 = &unk_1EE9C5B88;
  objc_destroyWeak((id *)(a1 + 16));
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  void *v2;
  uint64_t vars8;

  *(void *)a1 = &unk_1EE9C5B88;
  objc_destroyWeak((id *)(a1 + 16));
  _Block_release(*(const void **)(a1 + 8));

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_targetedPreviewForElementWithID:()WKPrivate completionHandler:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  if (WeakRetained)
  {
    CFTypeRef v5 = WeakRetained;
    if (*((unsigned char *)a2 + 112))
    {
      id v6 = (void *)*((void *)WeakRetained + 79);
      WebCore::TextIndicatorData::TextIndicatorData((WebCore::TextIndicatorData *)v16, a2);
      CFTypeRef v7 = (const void *)objc_msgSend(v6, "_createTargetedPreviewFromTextIndicator:previewContainer:", v16, objc_msgSend(v5, "scrollView"));
      uint64_t v9 = v7;
      if (v7) {
        CFRetain(v7);
      }
      if ((v22 & 0x8000000000000) != 0)
      {
        uint64_t v15 = (unsigned int *)(v22 & 0xFFFFFFFFFFFFLL);
        if (atomic_fetch_add((atomic_uint *volatile)(v22 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, v15);
          WTF::fastFree((WTF *)v15, v8);
        }
      }
      CFTypeRef v10 = v21;
      unint64_t v21 = 0;
      if (v10)
      {
        if (v10[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v10 + 8))(v10);
        }
        else {
          --v10[2];
        }
      }
      uint64_t v12 = v20;
      uint64_t v20 = 0;
      if (v12)
      {
        if (v12[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v12 + 8))(v12);
        }
        else {
          --v12[2];
        }
      }
      uint64_t v13 = v19;
      uint64_t v19 = 0;
      if (v13)
      {
        if (v13[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v13 + 8))(v13);
        }
        else {
          --v13[2];
        }
      }
      uint64_t v14 = v17;
      if (v17)
      {
        int v17 = 0;
        int v18 = 0;
        WTF::fastFree(v14, v8);
      }
      (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
      if (v9) {
        CFRelease(v9);
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 8) + 16);
    v11();
  }
}

@end