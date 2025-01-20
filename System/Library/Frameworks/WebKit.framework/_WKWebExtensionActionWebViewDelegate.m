@interface _WKWebExtensionActionWebViewDelegate
- (_WKWebExtensionActionWebViewDelegate)initWithWebExtensionAction:(void *)a3;
- (id).cxx_construct;
- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6;
- (uint64_t)webView:(uint64_t)a1 createWebViewWithConfiguration:(uint64_t *)a2 forNavigationAction:windowFeatures:;
- (uint64_t)webView:(uint64_t)a1 decidePolicyForNavigationAction:(uint64_t *)a2 decisionHandler:;
- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webViewDidClose:(id)a3;
- (void)webViewWebContentProcessDidTerminate:(id)a3;
@end

@implementation _WKWebExtensionActionWebViewDelegate

- (_WKWebExtensionActionWebViewDelegate)initWithWebExtensionAction:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_WKWebExtensionActionWebViewDelegate;
  v4 = [(_WKWebExtensionActionWebViewDelegate *)&v10 init];
  if (v4)
  {
    WTF::WeakPtrFactory<WebPushD::PushServiceConnection,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3 + 4, (uint64_t)a3);
    v6 = (atomic_uint *)*((void *)a3 + 2);
    if (v6) {
      atomic_fetch_add(v6, 1u);
    }
    m_ptr = (unsigned int *)v4->_webExtensionAction.m_impl.m_ptr;
    v4->_webExtensionAction.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
    if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v5);
    }
    v8 = v4;
  }

  return v4;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(void, void))v10;
  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr)
  {
    uint64_t v13 = *((void *)m_ptr + 1);
    if (v13)
    {
      uint64_t v14 = *(void *)(v13 + 24);
      if (v14)
      {
        if (*(void *)(v14 + 8))
        {
          v15 = [v9 request];
          v16 = [v15 URL];

          uint64_t v17 = *(void *)(*((void *)self->_webExtensionAction.m_impl.m_ptr + 1) + 24);
          if (v17)
          {
            uint64_t v18 = *(void *)(v17 + 8);
            if (v18) {
              uint64_t v19 = v18 - 16;
            }
            else {
              uint64_t v19 = 0;
            }
          }
          else
          {
            uint64_t v19 = 0;
          }
          MEMORY[0x19972E8A0](&v47, v16);
          if (*((unsigned char *)&v47 + 8)) {
            int v22 = WTF::protocolHostAndPortAreEqual((WTF *)(v19 + 80), &v47, v21);
          }
          else {
            int v22 = 0;
          }
          v23 = v47.m_string.m_impl.m_ptr;
          v47.m_string.m_impl.m_ptr = 0;
          if (v23)
          {
            if (*(_DWORD *)v23 == 2) {
              WTF::StringImpl::destroy((WTF::StringImpl *)v23, v20);
            }
            else {
              *(_DWORD *)v23 -= 2;
            }
          }
          v24 = [v9 targetFrame];
          if (v24)
          {
            v25 = [v9 targetFrame];
            int v26 = [v25 isMainFrame];

            if ((v26 ^ 1 | v22))
            {
              v27 = [v9 targetFrame];
              [v27 isMainFrame];

              v11[2](v11, 1);
LABEL_70:

              goto LABEL_10;
            }
          }
          v28 = self->_webExtensionAction.m_impl.m_ptr;
          if (v28) {
            uint64_t v29 = *((void *)v28 + 1);
          }
          else {
            uint64_t v29 = 0;
          }
          if (*(unsigned char *)(v29 + 56) && (uint64_t v30 = *(void *)(v29 + 48)) != 0)
          {
            v31 = *(StringImpl **)(v30 + 8);
            if (v31) {
              ++*(_DWORD *)v31;
            }
          }
          else
          {
            v31 = 0;
          }
          if (v28) {
            v28 = (DefaultWeakPtrImpl *)*((void *)v28 + 1);
          }
          if (*((unsigned char *)v28 + 40) && (uint64_t v32 = *((void *)v28 + 4)) != 0)
          {
            v33 = *(WebKit::WebExtensionTab **)(v32 + 8);
            if (v33) {
              ++*(_DWORD *)v33;
            }
            if (!v31) {
              goto LABEL_39;
            }
          }
          else
          {
            v33 = 0;
            if (!v31)
            {
LABEL_39:
              if (v33)
              {
                WebKit::WebExtensionTab::window(v33, &v47);
                v31 = v47.m_string.m_impl.m_ptr;
              }
              else
              {
                v31 = 0;
              }
            }
          }
          LOBYTE(v47.m_string.m_impl.m_ptr) = 0;
          *((unsigned char *)&v47 + 8) = 0;
          LOBYTE(v47.m_userEnd) = 0;
          char v48 = 0;
          LOBYTE(v49) = 0;
          char v50 = 0;
          LOBYTE(v51) = 0;
          char v52 = 0;
          LOBYTE(v53) = 0;
          char v54 = 0;
          char v55 = 0;
          char v56 = 0;
          char v57 = 0;
          char v58 = 0;
          uint64_t v59 = 0;
          uint64_t v60 = 0;
          __int16 v61 = 0;
          MEMORY[0x19972E8A0](&v47.m_userEnd, v16);
          char v48 = 1;
          if (v31) {
            uint64_t v34 = *((void *)v31 + 2);
          }
          else {
            uint64_t v34 = -3;
          }
          if (!v52) {
            char v52 = 1;
          }
          uint64_t v51 = v34;
          if (v33)
          {
            uint64_t v35 = WebKit::WebExtensionTab::index(v33);
            unsigned __int8 v36 = v35 + 1;
            unint64_t v37 = (v35 + 1) & 0xFFFFFFFFFFFFFF00;
            char v38 = 1;
          }
          else
          {
            char v38 = 0;
            unsigned __int8 v36 = 0;
            unint64_t v37 = 0;
          }
          unint64_t v53 = v37 | v36;
          char v54 = v38;
          LOWORD(v59) = 257;
          uint64_t v39 = *(void *)(*((void *)self->_webExtensionAction.m_impl.m_ptr + 1) + 24);
          if (v39)
          {
            uint64_t v40 = *(void *)(v39 + 8);
            if (v40) {
              uint64_t v41 = v40 - 16;
            }
            else {
              uint64_t v41 = 0;
            }
          }
          else
          {
            uint64_t v41 = 0;
          }
          v42 = (void *)WTF::fastMalloc((WTF *)0x10);
          void *v42 = &unk_1EE9FB540;
          v46 = v42;
          WebKit::WebExtensionContext::openNewTab(v41, (uint64_t)&v47, (uint64_t *)&v46);
          if (v46) {
            (*(void (**)(void *))(*v46 + 8))(v46);
          }
          v11[2](v11, 0);
          if (v50)
          {
            v44 = v49;
            v49 = 0;
            if (v44)
            {
              if (*(_DWORD *)v44 == 2) {
                WTF::StringImpl::destroy(v44, v43);
              }
              else {
                *(_DWORD *)v44 -= 2;
              }
            }
          }
          if (v48)
          {
            v45 = *(WTF::StringImpl **)&v47.m_userEnd;
            *(void *)&v47.m_userEnd = 0;
            if (v45)
            {
              if (*(_DWORD *)v45 == 2)
              {
                WTF::StringImpl::destroy(v45, v43);
                if (!v33)
                {
LABEL_68:
                  if (v31) {
                    WTF::RefCounted<WebKit::WebExtensionWindow>::deref((uint64_t)v31);
                  }
                  goto LABEL_70;
                }
LABEL_67:
                WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v33);
                goto LABEL_68;
              }
              *(_DWORD *)v45 -= 2;
            }
          }
          if (!v33) {
            goto LABEL_68;
          }
          goto LABEL_67;
        }
      }
    }
  }
  (*((void (**)(id, void))v10 + 2))(v10, 0);
LABEL_10:
}

- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (!m_ptr) {
    goto LABEL_97;
  }
  uint64_t v15 = *((void *)m_ptr + 1);
  if (!v15) {
    goto LABEL_97;
  }
  uint64_t v16 = *(void *)(v15 + 24);
  if (!v16 || !*(void *)(v16 + 8)) {
    goto LABEL_97;
  }
  LOBYTE(v79) = 0;
  BYTE8(v79) = 0;
  LOBYTE(v80[0]) = 0;
  char v81 = 0;
  LOBYTE(v82) = 0;
  char v83 = 0;
  LOBYTE(v84) = 0;
  BYTE8(v84) = 0;
  LOBYTE(v85) = 0;
  BYTE8(v85) = 0;
  LOBYTE(v86) = 0;
  LOBYTE(v87) = 0;
  BYTE8(v87) = 0;
  LOBYTE(v88[0]) = 0;
  memset((char *)v88 + 8, 0, 18);
  uint64_t v17 = [v12 request];
  uint64_t v18 = [v17 URL];
  MEMORY[0x19972E8A0](v80, v18);
  char v81 = 1;

  uint64_t v19 = *(void *)(*((void *)self->_webExtensionAction.m_impl.m_ptr + 1) + 24);
  if (v19)
  {
    uint64_t v20 = *(void *)(v19 + 8);
    if (v20) {
      v21 = (WebKit::WebExtensionContext *)(v20 - 16);
    }
    else {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }
  if (!WebKit::WebExtensionContext::canOpenNewWindow(v21))
  {
    int v26 = self->_webExtensionAction.m_impl.m_ptr;
    if (v26) {
      uint64_t v27 = *((void *)v26 + 1);
    }
    else {
      uint64_t v27 = 0;
    }
    if (*(unsigned char *)(v27 + 56) && (uint64_t v28 = *(void *)(v27 + 48)) != 0)
    {
      uint64_t v29 = *(WTF::StringImpl **)(v28 + 8);
      if (v29) {
        ++*(_DWORD *)v29;
      }
    }
    else
    {
      uint64_t v29 = 0;
    }
    if (v26) {
      int v26 = (DefaultWeakPtrImpl *)*((void *)v26 + 1);
    }
    if (*((unsigned char *)v26 + 40) && (uint64_t v30 = *((void *)v26 + 4)) != 0)
    {
      v31 = *(WebKit::WebExtensionTab **)(v30 + 8);
      if (v31) {
        ++*(_DWORD *)v31;
      }
      if (v29) {
        goto LABEL_36;
      }
    }
    else
    {
      v31 = 0;
      if (v29)
      {
LABEL_36:
        uint64_t v32 = *((void *)v29 + 2);
LABEL_71:
        if (!BYTE8(v84)) {
          BYTE8(v84) = 1;
        }
        *(void *)&long long v84 = v32;
        if (v31)
        {
          uint64_t v57 = WebKit::WebExtensionTab::index(v31);
          unsigned __int8 v58 = v57 + 1;
          unint64_t v59 = (v57 + 1) & 0xFFFFFFFFFFFFFF00;
          char v60 = 1;
        }
        else
        {
          char v60 = 0;
          unsigned __int8 v58 = 0;
          unint64_t v59 = 0;
        }
        *(void *)&long long v85 = v59 | v58;
        BYTE8(v85) = v60;
        WORD4(v88[0]) = 257;
        uint64_t v61 = *(void *)(*((void *)self->_webExtensionAction.m_impl.m_ptr + 1) + 24);
        if (v61)
        {
          uint64_t v62 = *(void *)(v61 + 8);
          if (v62) {
            uint64_t v63 = v62 - 16;
          }
          else {
            uint64_t v63 = 0;
          }
        }
        else
        {
          uint64_t v63 = 0;
        }
        v64 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
        *(void *)v64 = &unk_1EE9FB590;
        v89[0] = v64;
        WebKit::WebExtensionContext::openNewTab(v63, (uint64_t)&v79, (uint64_t *)v89);
        if (v89[0]) {
          (*(void (**)(WTF::StringImpl *))(*(void *)v89[0] + 8))(v89[0]);
        }
        if (v31) {
          WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v31);
        }
        if (v29) {
          WTF::RefCounted<WebKit::WebExtensionWindow>::deref((uint64_t)v29);
        }
        goto LABEL_87;
      }
    }
    if (v31)
    {
      WebKit::WebExtensionTab::window(v31, v89);
      uint64_t v29 = v89[0];
      if (v89[0]) {
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v29 = 0;
    }
    uint64_t v32 = -3;
    goto LABEL_71;
  }
  v69[0] = 0;
  v69[8] = 0;
  v71[0] = 0;
  char v72 = 0;
  LOBYTE(v73) = 0;
  char v77 = 0;
  int v70 = 0;
  int v78 = 257;
  *(_OWORD *)v89 = v79;
  std::__optional_move_base<WTF::URL,false>::__optional_move_base[abi:sn180100](&v90, (uint64_t)v80);
  LOBYTE(v92) = 0;
  char v93 = 0;
  if (v83)
  {
    int v22 = v82;
    v82 = 0;
    v92 = v22;
    char v93 = 1;
  }
  long long v96 = v86;
  long long v97 = v87;
  v98[0] = v88[0];
  *(_OWORD *)((char *)v98 + 10) = *(_OWORD *)((char *)v88 + 10);
  long long v94 = v84;
  long long v95 = v85;
  WTF::Vector<WebKit::WebExtensionTabParameters,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector(v68, (uint64_t)v89, 1uLL);
  std::optional<WTF::Vector<WebKit::WebExtensionTabParameters,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>::operator=[abi:sn180100]<WTF::Vector<WebKit::WebExtensionTabParameters,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,void>((uint64_t)v71, v68);
  WTF::Vector<WebKit::WebExtensionTabParameters,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v68, v23);
  if (v93)
  {
    v25 = v92;
    v92 = 0;
    if (v25)
    {
      if (*(_DWORD *)v25 == 2) {
        WTF::StringImpl::destroy(v25, v24);
      }
      else {
        *(_DWORD *)v25 -= 2;
      }
    }
  }
  if (v91)
  {
    v33 = v90;
    v90 = 0;
    if (v33)
    {
      if (*(_DWORD *)v33 == 2) {
        WTF::StringImpl::destroy(v33, v24);
      }
      else {
        *(_DWORD *)v33 -= 2;
      }
    }
  }
  HIWORD(v70) = [v13 _wantsPopup] | 0x100;
  uint64_t v34 = [v13 _fullscreenDisplay];
  if ([v34 BOOLValue]) {
    __int16 v35 = 259;
  }
  else {
    __int16 v35 = 256;
  }
  LOWORD(v70) = v35;

  unsigned __int8 v36 = [v13 x];
  if (v36)
  {
    unint64_t v37 = [v13 x];
    [v37 doubleValue];
    uint64_t v39 = v38;
  }
  else
  {
    uint64_t v39 = 0x7FF8000000000000;
  }

  uint64_t v40 = [v13 y];
  if (v40)
  {
    uint64_t v41 = [v13 y];
    [v41 doubleValue];
    uint64_t v43 = v42;
  }
  else
  {
    uint64_t v43 = 0x7FF8000000000000;
  }

  v44 = [v13 width];
  if (v44)
  {
    v45 = [v13 width];
    [v45 doubleValue];
    uint64_t v47 = v46;
  }
  else
  {
    uint64_t v47 = 0x7FF8000000000000;
  }

  char v48 = [v13 height];
  if (v48)
  {
    v49 = [v13 height];
    [v49 doubleValue];
    uint64_t v51 = v50;
  }
  else
  {
    uint64_t v51 = 0x7FF8000000000000;
  }

  uint64_t v73 = v39;
  uint64_t v74 = v43;
  uint64_t v75 = v47;
  uint64_t v76 = v51;
  if (!v77) {
    char v77 = 1;
  }
  uint64_t v52 = *(void *)(*((void *)self->_webExtensionAction.m_impl.m_ptr + 1) + 24);
  if (v52)
  {
    uint64_t v53 = *(void *)(v52 + 8);
    if (v53) {
      uint64_t v54 = v53 - 16;
    }
    else {
      uint64_t v54 = 0;
    }
  }
  else
  {
    uint64_t v54 = 0;
  }
  char v55 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
  *(void *)char v55 = &unk_1EE9FB568;
  v89[0] = v55;
  WebKit::WebExtensionContext::openNewWindow(v54, (uint64_t)v69, (uint64_t *)v89);
  if (v89[0]) {
    (*(void (**)(WTF::StringImpl *))(*(void *)v89[0] + 8))(v89[0]);
  }
  if (v72) {
    WTF::Vector<WebKit::WebExtensionTabParameters,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v71, v56);
  }
LABEL_87:
  if (v83)
  {
    v65 = v82;
    v82 = 0;
    if (v65)
    {
      if (*(_DWORD *)v65 == 2) {
        WTF::StringImpl::destroy(v65, (WTF::StringImpl *)v56);
      }
      else {
        *(_DWORD *)v65 -= 2;
      }
    }
  }
  if (v81)
  {
    v66 = v80[0];
    v80[0] = 0;
    if (v66)
    {
      if (*(_DWORD *)v66 == 2) {
        WTF::StringImpl::destroy(v66, (WTF::StringImpl *)v56);
      }
      else {
        *(_DWORD *)v66 -= 2;
      }
    }
  }
LABEL_97:

  return 0;
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr)
  {
    v4 = (WebKit::WebExtensionAction *)*((void *)m_ptr + 1);
    if (v4) {
      WebKit::WebExtensionAction::closePopup(v4);
    }
  }
}

- (void)webViewDidClose:(id)a3
{
  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr)
  {
    v4 = (WebKit::WebExtensionAction *)*((void *)m_ptr + 1);
    if (v4) {
      WebKit::WebExtensionAction::closePopup(v4);
    }
  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (WebKit *)a5;
  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr && *((void *)m_ptr + 1))
  {
    id v12 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = WebKit::privacyPreservingDescription(v10, v13);
      int v17 = 138543362;
      uint64_t v18 = v16;
      _os_log_error_impl(&dword_1985F2000, v12, OS_LOG_TYPE_ERROR, "Popup provisional load failed: %{public}@", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v14 = self->_webExtensionAction.m_impl.m_ptr;
    if (v14) {
      uint64_t v15 = (WebKit::WebExtensionAction *)*((void *)v14 + 1);
    }
    else {
      uint64_t v15 = 0;
    }
    WebKit::WebExtensionAction::closePopup(v15);
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (WebKit *)a5;
  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr && *((void *)m_ptr + 1))
  {
    id v12 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = WebKit::privacyPreservingDescription(v10, v13);
      int v17 = 138543362;
      uint64_t v18 = v16;
      _os_log_error_impl(&dword_1985F2000, v12, OS_LOG_TYPE_ERROR, "Popup load failed: %{public}@", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v14 = self->_webExtensionAction.m_impl.m_ptr;
    if (v14) {
      uint64_t v15 = (WebKit::WebExtensionAction *)*((void *)v14 + 1);
    }
    else {
      uint64_t v15 = 0;
    }
    WebKit::WebExtensionAction::closePopup(v15);
  }
}

- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4
{
  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr)
  {
    uint64_t v5 = *((void *)m_ptr + 1);
    if (v5)
    {
      uint64_t v6 = *(void *)(v5 + 24);
      if (v6)
      {
        if (*(void *)(v6 + 8)
          && (*(unsigned char *)(v5 + 180) & 2) == 0
          && (*(unsigned char *)(v5 + 180) & 1) != 0
          && *(void *)(v5 + 72))
        {
          dispatch_time_t v7 = dispatch_time(0, 250000000);
          CFRetain(*(CFTypeRef *)(v5 + 8));
          id v8 = malloc_type_malloc(0x30uLL, 0x10E0040FAC56454uLL);
          void *v8 = MEMORY[0x1E4F14398];
          v8[1] = 50331650;
          v8[2] = WTF::BlockPtrArc<void ()(void)>::fromCallable<WebKit::WebExtensionAction::popupDidFinishDocumentLoad(void)::$_0>(WebKit::WebExtensionAction::popupDidFinishDocumentLoad(void)::$_0)::{lambda(void *)#1}::__invoke;
          v8[3] = &WTF::BlockPtrArc<void ()(void)>::fromCallable<WebKit::WebExtensionAction::popupDidFinishDocumentLoad(void)::$_0>(WebKit::WebExtensionAction::popupDidFinishDocumentLoad(void)::$_0)::descriptor;
          v8[4] = v5;
          v8[5] = v5;
          aBlock = _Block_copy(v8);

          id v9 = _Block_copy(aBlock);
          dispatch_after(v7, MEMORY[0x1E4F14428], v9);
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  m_ptr = (unsigned int *)self->_webExtensionAction.m_impl.m_ptr;
  self->_webExtensionAction.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (uint64_t)webView:(uint64_t)a1 decidePolicyForNavigationAction:(uint64_t *)a2 decisionHandler:
{
  uint64_t result = *a2;
  *a2 = 0;
  if (result) {
    return WTF::RefCounted<WebKit::WebExtensionTab>::deref(result);
  }
  return result;
}

- (uint64_t)webView:(uint64_t)a1 createWebViewWithConfiguration:(uint64_t *)a2 forNavigationAction:windowFeatures:
{
  uint64_t result = *a2;
  *a2 = 0;
  if (result) {
    return WTF::RefCounted<WebKit::WebExtensionTab>::deref(result);
  }
  return result;
}

@end