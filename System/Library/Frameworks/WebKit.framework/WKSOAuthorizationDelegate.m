@interface WKSOAuthorizationDelegate
- (id).cxx_construct;
- (void)authorization:(id)a3 didCompleteWithError:(id)a4;
- (void)authorization:(id)a3 didCompleteWithHTTPAuthorizationHeaders:(id)a4;
- (void)authorization:(id)a3 didCompleteWithHTTPResponse:(id)a4 httpBody:(id)a5;
- (void)authorization:(id)a3 presentViewController:(id)a4 withCompletion:(id)a5;
- (void)authorizationDidCancel:(id)a3;
- (void)authorizationDidComplete:(id)a3;
- (void)authorizationDidNotHandle:(id)a3;
- (void)setSession:(void *)a3;
@end

@implementation WKSOAuthorizationDelegate

- (void)authorization:(id)a3 presentViewController:(id)a4 withCompletion:(id)a5
{
  v8 = self;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v38 = self;
  v9 = qword_1EB357BC8;
  if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
  {
    m_ptr = v8->_session.m_ptr;
    *(_DWORD *)buf = 134218496;
    *(void *)&buf[4] = &v38;
    __int16 v40 = 2048;
    id v41 = a3;
    __int16 v42 = 2048;
    v43 = (const char *)m_ptr;
    _os_log_impl(&dword_1985F2000, v9, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization (authorization = %p, _session = %p)", buf, 0x20u);
    v8 = v38;
  }
  v11 = v8->_session.m_ptr;
  if (!v11)
  {
    v16 = qword_1EB357BC8;
    if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = &v38;
      _os_log_impl(&dword_1985F2000, v16, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization: No session, so completing with NO as success state.", buf, 0xCu);
    }
    goto LABEL_14;
  }
  v12 = qword_1EB357BC8;
  BOOL v13 = os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT);
  if (!a4)
  {
    if (v13)
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = &v38;
      _os_log_impl(&dword_1985F2000, v12, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization: No view controller to present, so completing with NO as success state.", buf, 0xCu);
    }
LABEL_14:
    (*((void (**)(id, void, void))a5 + 2))(a5, 0, 0);
    return;
  }
  if (v13)
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = &v38;
    __int16 v40 = 2048;
    id v41 = a4;
    _os_log_impl(&dword_1985F2000, v12, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization: presentingViewController %p", buf, 0x16u);
    v11 = v38->_session.m_ptr;
    v12 = qword_1EB357BC8;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = *((unsigned __int8 *)v11 + 48);
    if (*((unsigned char *)v11 + 48))
    {
      if (v14 == 2)
      {
        v15 = "SubFrame";
      }
      else if (v14 == 1)
      {
        v15 = "PopUp";
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = "Redirect";
    }
    v17 = "Idle";
    switch(*((unsigned char *)v11 + 16))
    {
      case 0:
        break;
      case 1:
        v17 = "Active";
        break;
      case 2:
        v17 = "Waiting";
        break;
      case 3:
        v17 = "Completed";
        break;
      default:
        v17 = 0;
        break;
    }
    uint64_t v18 = *((void *)v11 + 7);
    *(_DWORD *)buf = 134218754;
    *(void *)&buf[4] = v11;
    __int16 v40 = 2080;
    id v41 = (id)v15;
    __int16 v42 = 2080;
    v43 = v17;
    __int16 v44 = 2048;
    uint64_t v45 = v18;
    _os_log_impl(&dword_1985F2000, v12, OS_LOG_TYPE_DEFAULT, "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::presentViewController: m_viewController=%p", buf, 0x2Au);
  }
  uint64_t v19 = *((void *)v11 + 5);
  if (v19 && (uint64_t v20 = *(void *)(v19 + 8)) != 0 && !*(unsigned char *)(v20 + 785) && !*((void *)v11 + 7))
  {
    CFRetain(a4);
    v30 = (const void *)*((void *)v11 + 7);
    *((void *)v11 + 7) = a4;
    if (v30) {
      CFRelease(v30);
    }
    uint64_t v31 = *(void *)(*((void *)v11 + 5) + 8);
    if (v31) {
      uint64_t v32 = v31 - 16;
    }
    else {
      uint64_t v32 = 0;
    }
    v33 = (void *)(*(uint64_t (**)(void))(**(void **)(v32 + 104) + 488))(*(void *)(v32 + 104));
    if (v33) {
      goto LABEL_69;
    }
    uint64_t v34 = *((void *)v11 + 5);
    if (v34)
    {
      uint64_t v35 = *(void *)(v34 + 8);
      if (v35) {
        v36 = (WebKit::WebPageProxy *)(v35 - 16);
      }
      else {
        v36 = 0;
      }
    }
    else
    {
      v36 = 0;
    }
    WebKit::WebPageProxy::cocoaView(v36, buf);
    v37 = *(const void **)buf;
    v33 = objc_msgSend(*(id *)buf, "_wk_viewControllerForFullScreenPresentation");
    if (v37) {
      CFRelease(v37);
    }
    if (v33)
    {
LABEL_69:
      [v33 presentViewController:*((void *)v11 + 7) animated:1 completion:0];
      (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 1, 0);
      return;
    }
  }
  else
  {
    v21 = qword_1EB357BC8;
    if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = *((unsigned __int8 *)v11 + 48);
      if (*((unsigned char *)v11 + 48))
      {
        if (v22 == 2)
        {
          v23 = "SubFrame";
        }
        else if (v22 == 1)
        {
          v23 = "PopUp";
        }
        else
        {
          v23 = 0;
        }
      }
      else
      {
        v23 = "Redirect";
      }
      v24 = "Idle";
      switch(*((unsigned char *)v11 + 16))
      {
        case 0:
          goto LABEL_45;
        case 1:
          v24 = "Active";
          if (!v19) {
            goto LABEL_43;
          }
          goto LABEL_46;
        case 2:
          v24 = "Waiting";
          if (!v19) {
            goto LABEL_43;
          }
          goto LABEL_46;
        case 3:
          v24 = "Completed";
LABEL_45:
          if (v19) {
            goto LABEL_46;
          }
          goto LABEL_43;
        default:
          v24 = 0;
          if (v19)
          {
LABEL_46:
            uint64_t v26 = *(void *)(v19 + 8);
            uint64_t v25 = v26 - 16;
            if (v26) {
              LODWORD(v26) = *(unsigned __int8 *)(v26 + 785);
            }
            else {
              uint64_t v25 = 0;
            }
          }
          else
          {
LABEL_43:
            uint64_t v25 = 0;
            LODWORD(v26) = 0;
          }
          uint64_t v27 = *((void *)v11 + 7);
          *(_DWORD *)buf = 134219266;
          *(void *)&buf[4] = v11;
          __int16 v40 = 2080;
          id v41 = (id)v23;
          __int16 v42 = 2080;
          v43 = v24;
          __int16 v44 = 2048;
          uint64_t v45 = v25;
          __int16 v46 = 1024;
          int v47 = v26;
          __int16 v48 = 2048;
          uint64_t v49 = v27;
          _os_log_impl(&dword_1985F2000, v21, OS_LOG_TYPE_DEFAULT, "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::presentViewController: m_page=%p, m_page->isClosed=%d, m_viewController=%p", buf, 0x3Au);
          break;
      }
    }
  }
  id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
  v29 = (const void *)[v28 initWithDomain:PAL::get_AppSSO_SOErrorDomain((PAL *)v28) code:-7 userInfo:0];
  (*((void (**)(id, void, const void *))a5 + 2))(a5, 0, v29);
  if (v29) {
    CFRelease(v29);
  }
}

- (void)authorizationDidNotHandle:(id)a3
{
  v4 = self;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v9 = self;
  v5 = qword_1EB357BC8;
  if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
  {
    m_ptr = v4->_session.m_ptr;
    *(_DWORD *)buf = 134218496;
    v11 = &v9;
    __int16 v12 = 2048;
    id v13 = a3;
    __int16 v14 = 2048;
    v15 = m_ptr;
    _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidNotHandle: (authorization = %p, _session = %p)", buf, 0x20u);
    v4 = v9;
    v5 = qword_1EB357BC8;
  }
  v7 = (WebKit::SOAuthorizationSession *)v4->_session.m_ptr;
  BOOL v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      v11 = &v9;
      _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidNotHandle: Falling back to web path.", buf, 0xCu);
      v7 = (WebKit::SOAuthorizationSession *)v9->_session.m_ptr;
    }
    WebKit::SOAuthorizationSession::fallBackToWebPath(v7);
  }
  else if (v8)
  {
    *(_DWORD *)buf = 134217984;
    v11 = &v9;
    _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidNotHandle: No session, so returning early.", buf, 0xCu);
  }
}

- (void)authorizationDidCancel:(id)a3
{
  v4 = self;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v9 = self;
  v5 = qword_1EB357BC8;
  if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
  {
    m_ptr = v4->_session.m_ptr;
    *(_DWORD *)buf = 134218496;
    v11 = &v9;
    __int16 v12 = 2048;
    id v13 = a3;
    __int16 v14 = 2048;
    v15 = m_ptr;
    _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidCancel: (authorization = %p, _session = %p)", buf, 0x20u);
    v4 = v9;
    v5 = qword_1EB357BC8;
  }
  v7 = (WebKit::SOAuthorizationSession *)v4->_session.m_ptr;
  BOOL v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      v11 = &v9;
      _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidCancel: Aborting session.", buf, 0xCu);
      v7 = (WebKit::SOAuthorizationSession *)v9->_session.m_ptr;
    }
    WebKit::SOAuthorizationSession::abort(v7);
  }
  else if (v8)
  {
    *(_DWORD *)buf = 134217984;
    v11 = &v9;
    _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidCancel: No session, so returning early.", buf, 0xCu);
  }
}

- (void)authorizationDidComplete:(id)a3
{
  v4 = self;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v9 = self;
  v5 = qword_1EB357BC8;
  if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
  {
    m_ptr = v4->_session.m_ptr;
    *(_DWORD *)buf = 134218496;
    v11 = &v9;
    __int16 v12 = 2048;
    id v13 = a3;
    __int16 v14 = 2048;
    v15 = m_ptr;
    _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidComplete: (authorization = %p, _session = %p)", buf, 0x20u);
    v4 = v9;
    v5 = qword_1EB357BC8;
  }
  v7 = (WebKit::SOAuthorizationSession *)v4->_session.m_ptr;
  BOOL v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      v11 = &v9;
      _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidComplete: Falling back to web path.", buf, 0xCu);
      v7 = (WebKit::SOAuthorizationSession *)v9->_session.m_ptr;
    }
    WebKit::SOAuthorizationSession::fallBackToWebPath(v7);
  }
  else if (v8)
  {
    *(_DWORD *)buf = 134217984;
    v11 = &v9;
    _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidComplete: No session, so returning early.", buf, 0xCu);
  }
}

- (void)authorization:(id)a3 didCompleteWithHTTPAuthorizationHeaders:(id)a4
{
  v5 = self;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v10 = self;
  v6 = qword_1EB357BC8;
  if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
  {
    m_ptr = v5->_session.m_ptr;
    *(_DWORD *)buf = 134218496;
    __int16 v12 = &v10;
    __int16 v13 = 2048;
    id v14 = a3;
    __int16 v15 = 2048;
    uint64_t v16 = m_ptr;
    _os_log_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithHTTPAuthorizationHeaders: (authorization = %p, _session = %p)", buf, 0x20u);
    v5 = v10;
    v6 = qword_1EB357BC8;
  }
  BOOL v8 = (WebKit::SOAuthorizationSession *)v5->_session.m_ptr;
  BOOL v9 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      __int16 v12 = &v10;
      _os_log_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithHTTPAuthorizationHeaders: Falling back to web path.", buf, 0xCu);
      BOOL v8 = (WebKit::SOAuthorizationSession *)v10->_session.m_ptr;
    }
    WebKit::SOAuthorizationSession::fallBackToWebPath(v8);
  }
  else if (v9)
  {
    *(_DWORD *)buf = 134217984;
    __int16 v12 = &v10;
    _os_log_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithHTTPAuthorizationHeaders: No session, so returning early.", buf, 0xCu);
  }
}

- (void)authorization:(id)a3 didCompleteWithHTTPResponse:(id)a4 httpBody:(id)a5
{
  BOOL v8 = self;
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  v99 = self;
  BOOL v9 = qword_1EB357BC8;
  if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t m_ptr = (uint64_t)v8->_session.m_ptr;
    *(_DWORD *)buf = 134218496;
    *(void *)&uint8_t buf[4] = &v99;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v125 = m_ptr;
    _os_log_impl(&dword_1985F2000, v9, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithHTTPResponse: (authorization = %p, _session = %p)", buf, 0x20u);
    BOOL v8 = v99;
    BOOL v9 = qword_1EB357BC8;
  }
  v11 = v8->_session.m_ptr;
  BOOL v12 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v12)
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = &v99;
      _os_log_impl(&dword_1985F2000, v9, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithHTTPResponse: Completing.", buf, 0xCu);
      v11 = v99->_session.m_ptr;
      BOOL v9 = qword_1EB357BC8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = *((unsigned __int8 *)v11 + 48);
      if (*((unsigned char *)v11 + 48))
      {
        if (v13 == 2)
        {
          id v14 = "SubFrame";
        }
        else if (v13 == 1)
        {
          id v14 = "PopUp";
        }
        else
        {
          id v14 = 0;
        }
      }
      else
      {
        id v14 = "Redirect";
      }
      __int16 v15 = "Idle";
      switch(*((unsigned char *)v11 + 16))
      {
        case 0:
          break;
        case 1:
          __int16 v15 = "Active";
          break;
        case 2:
          __int16 v15 = "Waiting";
          break;
        case 3:
          __int16 v15 = "Completed";
          break;
        default:
          __int16 v15 = 0;
          break;
      }
      int v16 = objc_msgSend(a4, "statusCode", v99);
      uint64_t v17 = *((void *)v11 + 7);
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2080;
      uint64_t v125 = (uint64_t)v15;
      *(_WORD *)v126 = 1024;
      *(_DWORD *)&v126[2] = v16;
      *(_WORD *)&v126[6] = 2048;
      *(void *)&v126[8] = v17;
      _os_log_impl(&dword_1985F2000, v9, OS_LOG_TYPE_DEFAULT, "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::complete: httpState=%d, m_viewController=%p", buf, 0x30u);
    }
    int v18 = *((unsigned __int8 *)v11 + 16);
    if (v18 == 1)
    {
      WebKit::SOAuthorizationSession::becomeCompleted((WebKit::SOAuthorizationSession *)v11);
      WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)&v103, (NSURLResponse *)a4);
      if ((*(unsigned int (**)(SOAuthorizationSession *, uint64_t *))(*(void *)v11 + 48))(v11, &v103))
      {
        uint64_t v19 = qword_1EB357BC8;
        if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = *((unsigned __int8 *)v11 + 48);
          if (*((unsigned char *)v11 + 48))
          {
            if (v20 == 2)
            {
              v21 = "SubFrame";
            }
            else if (v20 == 1)
            {
              v21 = "PopUp";
            }
            else
            {
              v21 = 0;
            }
          }
          else
          {
            v21 = "Redirect";
          }
          __int16 v48 = "Idle";
          switch(*((unsigned char *)v11 + 16))
          {
            case 0:
              break;
            case 1:
              __int16 v48 = "Active";
              break;
            case 2:
              __int16 v48 = "Waiting";
              break;
            case 3:
              __int16 v48 = "Completed";
              break;
            default:
              __int16 v48 = 0;
              break;
          }
          *(_DWORD *)buf = 134218498;
          *(void *)&uint8_t buf[4] = v11;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = v21;
          *(_WORD *)&buf[22] = 2080;
          uint64_t v125 = (uint64_t)v48;
          v51 = "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::complete: CSP failed. Falling back to web path.";
LABEL_89:
          _os_log_impl(&dword_1985F2000, v19, OS_LOG_TYPE_DEFAULT, v51, buf, 0x20u);
          goto LABEL_90;
        }
        goto LABEL_90;
      }
      uint64_t v25 = (WebCore::SecurityOrigin *)WebCore::ResourceRequestBase::url((WebCore::ResourceRequestBase *)(*((void *)v11 + 4) + 40));
      WebCore::SecurityOrigin::create((uint64_t *)buf, v25, v26);
      uint64_t v27 = *(WebCore::SecurityOrigin **)buf;
      id v28 = (WebCore::SecurityOrigin *)WebCore::ResourceResponseBase::url((WebCore::ResourceResponseBase *)&v103);
      WebCore::SecurityOrigin::create((uint64_t *)&v101, v28, v29);
      char isSameOriginAs = WebCore::SecurityOrigin::isSameOriginAs(v27, v101);
      uint64_t v32 = v101;
      v101 = 0;
      if (v32) {
        WTF::ThreadSafeRefCounted<WebCore::SecurityOrigin,(WTF::DestructionThread)0>::deref((uint64_t)v32, v30);
      }
      uint64_t v33 = *(void *)buf;
      *(void *)buf = 0;
      if (v33)
      {
        WTF::ThreadSafeRefCounted<WebCore::SecurityOrigin,(WTF::DestructionThread)0>::deref(v33, v30);
        if (isSameOriginAs) {
          goto LABEL_38;
        }
      }
      else if (isSameOriginAs)
      {
LABEL_38:
        uint64_t v34 = (void *)MEMORY[0x1E4F18D28];
        uint64_t v35 = objc_msgSend(a4, "allHeaderFields", v99);
        WebCore::ResourceResponseBase::url((WebCore::ResourceResponseBase *)&v103);
        v36 = (void *)[v34 cookiesWithResponseHeaderFields:v35 forURL:WTF::URL::operator NSURL *()];
        unint64_t v37 = [v36 count];
        unint64_t v38 = v37;
        v101 = 0;
        uint64_t v102 = 0;
        if (v37)
        {
          if (v37 >= 0x1E1E1E2)
          {
            __break(0xC471u);
            return;
          }
          unsigned int v39 = 136 * v37;
          __int16 v40 = (WebCore::SecurityOrigin *)WTF::fastMalloc((WTF *)(136 * v37));
          uint64_t v41 = 0;
          LODWORD(v102) = v39 / 0x88;
          v101 = v40;
          uint64_t v42 = (uint64_t)v40;
          do
          {
            MEMORY[0x19973A9B0](buf, [v36 objectAtIndexedSubscript:v41]);
            WebCore::Cookie::Cookie(v42, (uint64_t *)buf);
            WebCore::Cookie::~Cookie((WebCore::Cookie *)buf, v43);
            v42 += 136;
            ++v41;
          }
          while (v38 != v41);
          HIDWORD(v102) = v38;
        }
        __int16 v44 = qword_1EB357BC8;
        if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
        {
          int v45 = *((unsigned __int8 *)v11 + 48);
          if (*((unsigned char *)v11 + 48))
          {
            if (v45 == 2)
            {
              __int16 v46 = "SubFrame";
            }
            else if (v45 == 1)
            {
              __int16 v46 = "PopUp";
            }
            else
            {
              __int16 v46 = 0;
            }
          }
          else
          {
            __int16 v46 = "Redirect";
          }
          v53 = "Idle";
          switch(*((unsigned char *)v11 + 16))
          {
            case 0:
              break;
            case 1:
              v53 = "Active";
              break;
            case 2:
              v53 = "Waiting";
              break;
            case 3:
              v53 = "Completed";
              break;
            default:
              v53 = 0;
              break;
          }
          int v55 = WebCore::ResourceResponseBase::httpStatusCode((WebCore::ResourceResponseBase *)&v103);
          int v56 = HIDWORD(v102);
          uint64_t v57 = [a5 length];
          *(_DWORD *)buf = 134219266;
          *(void *)&uint8_t buf[4] = v11;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = v46;
          *(_WORD *)&buf[22] = 2080;
          uint64_t v125 = (uint64_t)v53;
          *(_WORD *)v126 = 1024;
          *(_DWORD *)&v126[2] = v55;
          *(_WORD *)&v126[6] = 1024;
          *(_DWORD *)&v126[8] = v56 != 0;
          *(_WORD *)&v126[12] = 1024;
          *(_DWORD *)&v126[14] = v57 != 0;
          _os_log_impl(&dword_1985F2000, v44, OS_LOG_TYPE_DEFAULT, "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::complete: (httpStatusCode=%d, hasCookies=%d, hasData=%d)", buf, 0x32u);
          LODWORD(v38) = HIDWORD(v102);
        }
        if (v38)
        {
          uint64_t v58 = *((void *)v11 + 5);
          if (v58 && (uint64_t v59 = *(void *)(v58 + 8)) != 0)
          {
            v60 = WebKit::WebsiteDataStore::cookieStore(*(WebKit::WebsiteDataStore **)(v59 + 296));
            *(void *)buf = v11;
            v61 = (atomic_uchar *)*((void *)v11 + 1);
            if (v61) {
              v61 = WTF::ThreadSafeWeakPtrControlBlock::weakRef(v61);
            }
            *(_OWORD *)v126 = v104;
            *(_OWORD *)&v126[16] = v105;
            long long v62 = v108;
            long long v108 = 0u;
            long long v63 = v109;
            long long v109 = 0u;
            *(void *)&buf[8] = v61;
            *(void *)&buf[16] = v11;
            uint64_t v64 = v103;
            uint64_t v103 = 0;
            uint64_t v125 = v64;
            LODWORD(v104) = v104 & 0xFFFFFFFE;
            uint64_t v65 = v106;
            uint64_t v106 = 0;
            uint64_t v127 = v65;
            *(void *)v128 = v107;
            *(_OWORD *)&v128[8] = v62;
            long long v129 = v63;
            *(void *)&long long v62 = v110;
            uint64_t v110 = 0;
            uint64_t v130 = v62;
            uint64_t v66 = v111;
            uint64_t v111 = 0;
            uint64_t v131 = v66;
            *(void *)&long long v62 = v112;
            uint64_t v112 = 0;
            uint64_t v132 = v62;
            uint64_t v67 = v113;
            uint64_t v113 = 0;
            uint64_t v133 = v67;
            LOBYTE(v134) = 0;
            char v135 = 0;
            if (v115)
            {
              uint64_t v97 = v114;
              uint64_t v114 = 0;
              uint64_t v134 = v97;
              char v135 = 1;
            }
            long long v140 = v120;
            *(_OWORD *)v141 = *(_OWORD *)v121;
            *(_DWORD *)&v141[15] = *(_DWORD *)&v121[15];
            long long v136 = v116;
            long long v137 = v117;
            long long v138 = v118;
            long long v139 = v119;
            CFTypeRef v68 = v122;
            CFTypeRef v122 = 0;
            CFTypeRef v142 = v68;
            char v143 = v123;
            CFTypeRef cf = (CFTypeRef)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithData:a5];
            uint64_t v69 = WTF::fastMalloc((WTF *)0x128);
            *(void *)uint64_t v69 = &unk_1EE9D1788;
            *(void *)(v69 + 8) = *(void *)buf;
            *(void *)(v69 + 16) = *(void *)&buf[8];
            uint64_t v70 = *(void *)&buf[16];
            *(void *)&buf[8] = 0;
            *(void *)&buf[16] = 0;
            *(void *)(v69 + 24) = v70;
            WTF::URL::URL(v69 + 32, &v125);
            uint64_t v71 = v127;
            uint64_t v127 = 0;
            *(void *)(v69 + 72) = v71;
            *(_OWORD *)(v69 + 80) = *(_OWORD *)v128;
            *(void *)(v69 + 96) = *(void *)&v128[16];
            *(void *)(v69 + 104) = v129;
            uint64_t v72 = *((void *)&v129 + 1);
            *(_OWORD *)&v128[8] = 0u;
            long long v129 = 0u;
            *(void *)(v69 + 112) = v72;
            uint64_t v73 = v130;
            uint64_t v130 = 0;
            *(void *)(v69 + 120) = v73;
            uint64_t v74 = v131;
            uint64_t v131 = 0;
            *(void *)(v69 + 128) = v74;
            uint64_t v75 = v132;
            uint64_t v132 = 0;
            *(void *)(v69 + 136) = v75;
            uint64_t v76 = v133;
            uint64_t v133 = 0;
            *(void *)(v69 + 144) = v76;
            *(unsigned char *)(v69 + 152) = 0;
            *(unsigned char *)(v69 + 160) = 0;
            if (v135)
            {
              uint64_t v98 = v134;
              uint64_t v134 = 0;
              *(void *)(v69 + 152) = v98;
              *(unsigned char *)(v69 + 160) = 1;
            }
            long long v77 = v139;
            long long v78 = v140;
            long long v79 = *(_OWORD *)v141;
            *(_DWORD *)(v69 + 263) = *(_DWORD *)&v141[15];
            long long v80 = v136;
            long long v81 = v137;
            *(_OWORD *)(v69 + 200) = v138;
            *(_OWORD *)(v69 + 184) = v81;
            *(_OWORD *)(v69 + 168) = v80;
            *(_OWORD *)(v69 + 248) = v79;
            *(_OWORD *)(v69 + 232) = v78;
            *(_OWORD *)(v69 + 216) = v77;
            *(void *)(v69 + 272) = v142;
            *(unsigned char *)(v69 + 280) = v143;
            CFTypeRef v82 = cf;
            CFTypeRef v142 = 0;
            CFTypeRef cf = 0;
            *(void *)(v69 + 288) = v82;
            uint64_t v100 = v69;
            API::HTTPCookieStore::setCookies((uint64_t)v60, (uint64_t *)&v101, &v100);
            if (v100) {
              (*(void (**)(uint64_t))(*(void *)v100 + 8))(v100);
            }
            CFTypeRef v84 = cf;
            CFTypeRef cf = 0;
            if (v84) {
              CFRelease(v84);
            }
            CFTypeRef v85 = v142;
            CFTypeRef v142 = 0;
            if (v85) {
              CFRelease(v85);
            }
            WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)&v125, v83);
            v87 = *(atomic_uchar **)&buf[8];
            *(void *)&buf[8] = 0;
            if (v87) {
              WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v87, v86);
            }
          }
          else
          {
            v88 = qword_1EB357BC8;
            if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
            {
              int v89 = *((unsigned __int8 *)v11 + 48);
              if (*((unsigned char *)v11 + 48))
              {
                if (v89 == 2)
                {
                  v90 = "SubFrame";
                }
                else if (v89 == 1)
                {
                  v90 = "PopUp";
                }
                else
                {
                  v90 = 0;
                }
              }
              else
              {
                v90 = "Redirect";
              }
              v94 = "Idle";
              switch(*((unsigned char *)v11 + 16))
              {
                case 0:
                  break;
                case 1:
                  v94 = "Active";
                  break;
                case 2:
                  v94 = "Waiting";
                  break;
                case 3:
                  v94 = "Completed";
                  break;
                default:
                  v94 = 0;
                  break;
              }
              *(_DWORD *)buf = 134218498;
              *(void *)&uint8_t buf[4] = v11;
              *(_WORD *)&unsigned char buf[12] = 2080;
              *(void *)&buf[14] = v90;
              *(_WORD *)&buf[22] = 2080;
              uint64_t v125 = (uint64_t)v94;
              _os_log_impl(&dword_1985F2000, v88, OS_LOG_TYPE_DEFAULT, "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::complete:  Returning early because m_page is null.", buf, 0x20u);
            }
          }
        }
        else
        {
          v91 = qword_1EB357BC8;
          if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
          {
            int v92 = *((unsigned __int8 *)v11 + 48);
            if (*((unsigned char *)v11 + 48))
            {
              if (v92 == 2)
              {
                v93 = "SubFrame";
              }
              else if (v92 == 1)
              {
                v93 = "PopUp";
              }
              else
              {
                v93 = 0;
              }
            }
            else
            {
              v93 = "Redirect";
            }
            v95 = "Idle";
            switch(*((unsigned char *)v11 + 16))
            {
              case 0:
                break;
              case 1:
                v95 = "Active";
                break;
              case 2:
                v95 = "Waiting";
                break;
              case 3:
                v95 = "Completed";
                break;
              default:
                v95 = 0;
                break;
            }
            *(_DWORD *)buf = 134218498;
            *(void *)&uint8_t buf[4] = v11;
            *(_WORD *)&unsigned char buf[12] = 2080;
            *(void *)&buf[14] = v93;
            *(_WORD *)&buf[22] = 2080;
            uint64_t v125 = (uint64_t)v95;
            _os_log_impl(&dword_1985F2000, v91, OS_LOG_TYPE_DEFAULT, "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::complete:  No cookies to set. Completing (internal).", buf, 0x20u);
          }
          (*(void (**)(SOAuthorizationSession *, uint64_t *, id))(*(void *)v11 + 40))(v11, &v103, a5);
        }
        WTF::Vector<WebCore::Cookie,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v101, v86);
        goto LABEL_142;
      }
      uint64_t v19 = qword_1EB357BC8;
      if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = *((unsigned __int8 *)v11 + 48);
        if (*((unsigned char *)v11 + 48))
        {
          if (v49 == 2)
          {
            uint64_t v50 = "SubFrame";
          }
          else if (v49 == 1)
          {
            uint64_t v50 = "PopUp";
          }
          else
          {
            uint64_t v50 = 0;
          }
        }
        else
        {
          uint64_t v50 = "Redirect";
        }
        v52 = "Idle";
        switch(*((unsigned char *)v11 + 16))
        {
          case 0:
            break;
          case 1:
            v52 = "Active";
            break;
          case 2:
            v52 = "Waiting";
            break;
          case 3:
            v52 = "Completed";
            break;
          default:
            v52 = 0;
            break;
        }
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = v50;
        *(_WORD *)&buf[22] = 2080;
        uint64_t v125 = (uint64_t)v52;
        v51 = "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::complete:  Origins don't match. Falling back to web path.";
        goto LABEL_89;
      }
LABEL_90:
      (*(void (**)(SOAuthorizationSession *))(*(void *)v11 + 24))(v11);
LABEL_142:
      CFTypeRef v96 = v122;
      CFTypeRef v122 = 0;
      if (v96) {
        CFRelease(v96);
      }
      WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)&v103, v54);
      return;
    }
    int v22 = qword_1EB357BC8;
    if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = *((unsigned __int8 *)v11 + 48);
      if (*((unsigned char *)v11 + 48))
      {
        if (v23 == 2)
        {
          v24 = "SubFrame";
        }
        else if (v23 == 1)
        {
          v24 = "PopUp";
        }
        else
        {
          v24 = 0;
        }
      }
      else
      {
        v24 = "Redirect";
      }
      if (v18)
      {
        if (v18 == 3)
        {
          int v47 = "Completed";
        }
        else if (v18 == 2)
        {
          int v47 = "Waiting";
        }
        else
        {
          int v47 = 0;
        }
      }
      else
      {
        int v47 = "Idle";
      }
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2080;
      uint64_t v125 = (uint64_t)v47;
      _os_log_impl(&dword_1985F2000, v22, OS_LOG_TYPE_DEFAULT, "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::complete: Returning early since not active.", buf, 0x20u);
    }
    WebKit::SOAuthorizationSession::dismissViewController((WebKit::SOAuthorizationSession *)v11);
  }
  else if (v12)
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = &v99;
    _os_log_impl(&dword_1985F2000, v9, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithHTTPResponse: No session, so returning early.", buf, 0xCu);
  }
}

- (void)authorization:(id)a3 didCompleteWithError:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v12 = self;
  v7 = qword_1EB357BC8;
  if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t m_ptr = self->_session.m_ptr;
    *(_DWORD *)buf = 134218496;
    id v14 = &v12;
    __int16 v15 = 2048;
    id v16 = a3;
    __int16 v17 = 2048;
    int v18 = m_ptr;
    _os_log_impl(&dword_1985F2000, v7, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithError: (authorization = %p, _session = %p)", buf, 0x20u);
  }
  [a4 code];
  BOOL v9 = (WebKit::SOAuthorizationSession *)v12->_session.m_ptr;
  v10 = qword_1EB357BC8;
  BOOL v11 = os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134217984;
      id v14 = &v12;
      _os_log_impl(&dword_1985F2000, v10, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithError: Falling back to web path.", buf, 0xCu);
      BOOL v9 = (WebKit::SOAuthorizationSession *)v12->_session.m_ptr;
    }
    WebKit::SOAuthorizationSession::fallBackToWebPath(v9);
  }
  else if (v11)
  {
    *(_DWORD *)buf = 134217984;
    id v14 = &v12;
    _os_log_impl(&dword_1985F2000, v10, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithError: No session, so returning early.", buf, 0xCu);
  }
}

- (void)setSession:(void *)a3
{
  v4 = self;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v18 = self;
  v5 = (WTF::RunLoop *)WTF::RunLoop::main((WTF::RunLoop *)self);
  if ((WTF::RunLoop::isCurrent(v5) & 1) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x198D58AD4);
  }
  v6 = qword_1EB357BC8;
  if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t m_ptr = v4->_session.m_ptr;
    BOOL v8 = *(SOAuthorizationSession **)a3;
    *(_DWORD *)buf = 134218496;
    int v20 = &v18;
    __int16 v21 = 2048;
    int v22 = (const char *)m_ptr;
    __int16 v23 = 2048;
    v24 = (const char *)v8;
    _os_log_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::setSession: (existing session = %p, new session = %p)", buf, 0x20u);
    v4 = v18;
  }
  BOOL v9 = *(SOAuthorizationSession **)a3;
  *(void *)a3 = 0;
  v10 = v4->_session.m_ptr;
  v4->_session.uint64_t m_ptr = v9;
  if (v10)
  {
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::SOAuthorizationSession,(WTF::DestructionThread)2>(*((atomic_uchar **)v10 + 1));
    BOOL v9 = v18->_session.m_ptr;
  }
  if (v9)
  {
    BOOL v11 = qword_1EB357BC8;
    if (os_log_type_enabled((os_log_t)qword_1EB357BC8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *((unsigned __int8 *)v9 + 48);
      if (*((unsigned char *)v9 + 48))
      {
        if (v12 == 2)
        {
          int v13 = "SubFrame";
        }
        else if (v12 == 1)
        {
          int v13 = "PopUp";
        }
        else
        {
          int v13 = 0;
        }
      }
      else
      {
        int v13 = "Redirect";
      }
      id v14 = "Idle";
      switch(*((unsigned char *)v9 + 16))
      {
        case 0:
          break;
        case 1:
          id v14 = "Active";
          break;
        case 2:
          id v14 = "Waiting";
          break;
        case 3:
          id v14 = "Completed";
          break;
        default:
          id v14 = 0;
          break;
      }
      uint64_t v15 = *((void *)v9 + 5);
      if (v15)
      {
        uint64_t v16 = *(void *)(v15 + 8);
        if (v16) {
          uint64_t v15 = v16 - 16;
        }
        else {
          uint64_t v15 = 0;
        }
      }
      *(_DWORD *)buf = 134218754;
      int v20 = (WKSOAuthorizationDelegate **)v9;
      __int16 v21 = 2080;
      int v22 = v13;
      __int16 v23 = 2080;
      v24 = v14;
      __int16 v25 = 2048;
      uint64_t v26 = v15;
      _os_log_impl(&dword_1985F2000, v11, OS_LOG_TYPE_DEFAULT, "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::shouldStart: m_page=%p", buf, 0x2Au);
    }
    uint64_t v17 = *((void *)v9 + 5);
    if (v17)
    {
      if (*(void *)(v17 + 8)) {
        (*(void (**)(SOAuthorizationSession *))(*(void *)v9 + 16))(v9);
      }
    }
  }
}

- (void).cxx_destruct
{
  uint64_t m_ptr = self->_session.m_ptr;
  self->_session.uint64_t m_ptr = 0;
  if (m_ptr) {
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::SOAuthorizationSession,(WTF::DestructionThread)2>(*((atomic_uchar **)m_ptr + 1));
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end