@interface WKURLSessionTaskDelegate
- (WKURLSessionTaskDelegate)initWithTask:(id)a3 identifier:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long)long :(WTF:(void *)a5 :SupportsObjectIdentifierNullState::Yes>)a4 ObjectIdentifierMainThreadAccessTraits<uint64_t> :DataTaskIdentifierType session:;
- (WTF::StringImpl)URLSession:(uint64_t)a1 task:didReceiveChallenge:completionHandler:;
- (WTF::StringImpl)URLSession:task:didReceiveChallenge:completionHandler:;
- (id).cxx_construct;
- (uint64_t)URLSession:dataTask:didReceiveResponse:completionHandler:;
- (uint64_t)URLSession:task:didReceiveChallenge:completionHandler:;
- (uint64_t)URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)connection;
- (void)dealloc;
@end

@implementation WKURLSessionTaskDelegate

- (WKURLSessionTaskDelegate)initWithTask:(id)a3 identifier:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long)long :(WTF:(void *)a5 :SupportsObjectIdentifierNullState::Yes>)a4 ObjectIdentifierMainThreadAccessTraits<uint64_t> :DataTaskIdentifierType session:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)WKURLSessionTaskDelegate;
  v8 = [(WKURLSessionTaskDelegate *)&v23 init];
  if (v8)
  {
    if (kdebug_is_enabled())
    {
      BOOL v13 = *MEMORY[0x1E4F30948] == 0;
      v14 = WTFSignpostLogHandle();
      v15 = v14;
      if (v13)
      {
        os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v14, v8);
        if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v20 = v19;
          if (os_signpost_enabled(v15))
          {
            uint64_t v21 = objc_msgSend((id)objc_msgSend(a3, "originalRequest"), "HTTPMethod");
            uint64_t v22 = objc_msgSend((id)objc_msgSend(a3, "originalRequest"), "URL");
            *(_DWORD *)buf = 138543619;
            *(void *)v25 = v21;
            *(_WORD *)&v25[8] = 2113;
            *(void *)v26 = v22;
            _os_signpost_emit_with_name_impl(&dword_1985F2000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v20, "DataTask", "%{public}@ %{private}@", buf, 0x16u);
          }
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = WTFCurrentContinuousTime();
        uint64_t v17 = objc_msgSend((id)objc_msgSend(a3, "originalRequest"), "HTTPMethod");
        uint64_t v18 = objc_msgSend((id)objc_msgSend(a3, "originalRequest"), "URL");
        *(_DWORD *)buf = 67110403;
        *(_DWORD *)v25 = 1;
        *(_WORD *)&v25[4] = 1024;
        *(_DWORD *)&v25[6] = 0;
        *(_WORD *)v26 = 2048;
        *(void *)&v26[2] = v8;
        __int16 v27 = 2048;
        uint64_t v28 = v16;
        __int16 v29 = 2114;
        uint64_t v30 = v17;
        __int16 v31 = 2113;
        uint64_t v32 = v18;
        _os_log_impl(&dword_1985F2000, v15, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu %{public}@ %{private}@", buf, 0x36u);
      }
    }
    v8->_identifier = a4;
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a5 + 2, (uint64_t)a5);
    v10 = (atomic_uint *)*((void *)a5 + 1);
    if (v10) {
      atomic_fetch_add(v10, 1u);
    }
    m_ptr = (unsigned int *)v8->_session.m_impl.m_ptr;
    v8->_session.m_impl.m_ptr = (DefaultWeakPtrImpl *)v10;
    if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v9);
    }
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (kdebug_is_enabled())
  {
    int v3 = *MEMORY[0x1E4F30948];
    v4 = WTFSignpostLogHandle();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        int v9 = 2;
        __int16 v10 = 1024;
        int v11 = 0;
        __int16 v12 = 2048;
        BOOL v13 = self;
        __int16 v14 = 2048;
        uint64_t v15 = WTFCurrentContinuousTime();
        _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu ", buf, 0x22u);
      }
    }
    else
    {
      if (self)
      {
        os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v4, self);
        if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_2;
        }
      }
      else
      {
        os_signpost_id_t v6 = 0xEEEEB0B5B2B2EEEELL;
      }
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1985F2000, v5, OS_SIGNPOST_INTERVAL_END, v6, "DataTask", (const char *)&unk_1995EAC3E, buf, 2u);
      }
    }
  }
LABEL_2:
  v7.receiver = self;
  v7.super_class = (Class)WKURLSessionTaskDelegate;
  [(WKURLSessionTaskDelegate *)&v7 dealloc];
}

- (void)connection
{
  m_ptr = self->_session.m_impl.m_ptr;
  if (m_ptr && (uint64_t v3 = *((void *)m_ptr + 1)) != 0) {
    return *(void **)(*(void *)(v3 + 32) + 40);
  }
  else {
    return 0;
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (kdebug_is_enabled())
  {
    int v23 = *MEMORY[0x1E4F30948];
    v24 = WTFSignpostLogHandle();
    v25 = v24;
    if (v23)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        int v30 = 0;
        __int16 v31 = 1024;
        int v32 = 0;
        __int16 v33 = 2048;
        v34 = self;
        __int16 v35 = 2048;
        uint64_t v36 = WTFCurrentContinuousTime();
        _os_log_impl(&dword_1985F2000, v25, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu received challenge", buf, 0x22u);
      }
    }
    else
    {
      if (self)
      {
        os_signpost_id_t v26 = os_signpost_id_make_with_pointer(v24, self);
        if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_2;
        }
      }
      else
      {
        os_signpost_id_t v26 = 0xEEEEB0B5B2B2EEEELL;
      }
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1985F2000, v25, OS_SIGNPOST_EVENT, v26, "DataTask", "received challenge", buf, 2u);
      }
    }
  }
LABEL_2:
  int v9 = [(WKURLSessionTaskDelegate *)self connection];
  __int16 v10 = v9;
  if (v9)
  {
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref((atomic_uchar *volatile *)v9);
    MEMORY[0x199737840](buf, a5);
    int v11 = _Block_copy(a6);
    __int16 v12 = (void *)WTF::fastMalloc((WTF *)0x10);
    *__int16 v12 = &unk_1EE9BD580;
    v12[1] = v11;
    _Block_release(0);
    uint64_t v13 = WTF::ObjectIdentifierGeneric<IPC::AsyncReplyIDType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>::generate();
    __int16 v14 = (IPC::Encoder *)WTF::fastMalloc((WTF *)0x238);
    *(_WORD *)__int16 v14 = 319;
    *((void *)v14 + 1) = 0;
    *((void *)v14 + 66) = (char *)v14 + 16;
    *((void *)v14 + 67) = 512;
    *((void *)v14 + 68) = 0;
    *((void *)v14 + 70) = 0;
    *((void *)v14 + 69) = 0;
    IPC::Encoder::encodeHeader(v14);
    uint64_t v28 = v14;
    IPC::ArgumentCoder<WebKit::MonotonicObjectIdentifier<WebKit::EditorStateIdentifierType>,void>::encode(v14, (uint64_t *)&self->_identifier);
    IPC::ArgumentCoder<WebCore::AuthenticationChallenge,void>::encode(v14, (WebCore::AuthenticationChallengeBase *)buf);
    v27[0] = (uint64_t)v12;
    v27[1] = v13;
    IPC::Connection::sendMessageWithAsyncReply(v10, &v28, v27, 0, 0);
    uint64_t v16 = v27[0];
    v27[0] = 0;
    if (v16) {
      (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
    }
    uint64_t v17 = v28;
    uint64_t v28 = 0;
    if (v17)
    {
      IPC::Encoder::~Encoder(v17, v15);
      WTF::fastFree(v21, v22);
    }
    _Block_release(0);
    CFTypeRef v19 = cf;
    CFTypeRef cf = 0;
    if (v19) {
      CFRelease(v19);
    }
    CFTypeRef v20 = v37;
    CFTypeRef v37 = 0;
    if (v20) {
      CFRelease(v20);
    }
    WebCore::AuthenticationChallengeBase::~AuthenticationChallengeBase((WebCore::AuthenticationChallengeBase *)buf, v18);
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<IPC::Connection,(WTF::DestructionThread)2>(*(atomic_uchar **)&v10->_os_unfair_lock_opaque);
  }
  else
  {
    (*((void (**)(id, uint64_t, void))a6 + 2))(a6, 3, 0);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (kdebug_is_enabled())
  {
    int v25 = *MEMORY[0x1E4F30948];
    os_signpost_id_t v26 = WTFSignpostLogHandle();
    __int16 v27 = v26;
    if (v25)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        int v34 = 0;
        __int16 v35 = 1024;
        int v36 = 0;
        __int16 v37 = 2048;
        v38 = self;
        __int16 v39 = 2048;
        uint64_t v40 = WTFCurrentContinuousTime();
        _os_log_impl(&dword_1985F2000, v27, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu redirect", buf, 0x22u);
      }
    }
    else
    {
      if (self)
      {
        os_signpost_id_t v28 = os_signpost_id_make_with_pointer(v26, self);
        if (v28 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_2;
        }
      }
      else
      {
        os_signpost_id_t v28 = 0xEEEEB0B5B2B2EEEELL;
      }
      if (os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1985F2000, v27, OS_SIGNPOST_EVENT, v28, "DataTask", "redirect", buf, 2u);
      }
    }
  }
LABEL_2:
  int v11 = [(WKURLSessionTaskDelegate *)self connection];
  __int16 v12 = v11;
  if (v11)
  {
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref((atomic_uchar *volatile *)v11);
    WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)buf, (NSURLResponse *)a5);
    MEMORY[0x199732A50](v29, a6);
    uint64_t v13 = _Block_copy(a7);
    if (a6) {
      CFRetain(a6);
    }
    __int16 v14 = (void *)WTF::fastMalloc((WTF *)0x18);
    void *v14 = &unk_1EE9BD5A8;
    v14[1] = v13;
    v14[2] = a6;
    _Block_release(0);
    uint64_t v15 = WTF::ObjectIdentifierGeneric<IPC::AsyncReplyIDType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>::generate();
    uint64_t v16 = (IPC::Encoder *)WTF::fastMalloc((WTF *)0x238);
    *(_WORD *)uint64_t v16 = 320;
    *((void *)v16 + 1) = 0;
    *((void *)v16 + 66) = (char *)v16 + 16;
    *((void *)v16 + 67) = 512;
    *((void *)v16 + 68) = 0;
    *((void *)v16 + 70) = 0;
    *((void *)v16 + 69) = 0;
    IPC::Encoder::encodeHeader(v16);
    int v32 = v16;
    IPC::ArgumentCoder<WebKit::MonotonicObjectIdentifier<WebKit::EditorStateIdentifierType>,void>::encode(v16, (uint64_t *)&self->_identifier);
    IPC::ArgumentCoder<WebCore::ResourceResponse,void>::encode(v16, (WebCore::ResourceResponseBase *)buf);
    IPC::ArgumentCoder<WebCore::ResourceRequest,void>::encode(v16, (WebCore::ResourceRequest *)v29);
    v31[0] = (uint64_t)v14;
    v31[1] = v15;
    IPC::Connection::sendMessageWithAsyncReply(v12, &v32, v31, 0, 0);
    uint64_t v18 = v31[0];
    v31[0] = 0;
    if (v18) {
      (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
    }
    CFTypeRef v19 = v32;
    int v32 = 0;
    if (v19)
    {
      IPC::Encoder::~Encoder(v19, v17);
      WTF::fastFree(v23, v24);
    }
    _Block_release(0);
    CFTypeRef v20 = v30;
    CFTypeRef v30 = 0;
    if (v20) {
      CFRelease(v20);
    }
    WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v29);
    CFTypeRef v22 = cf;
    CFTypeRef cf = 0;
    if (v22) {
      CFRelease(v22);
    }
    WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)buf, v21);
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<IPC::Connection,(WTF::DestructionThread)2>(*(atomic_uchar **)&v12->_os_unfair_lock_opaque);
  }
  else
  {
    (*((void (**)(id, void))a7 + 2))(a7, 0);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (kdebug_is_enabled())
  {
    int v22 = *MEMORY[0x1E4F30948];
    int v23 = WTFSignpostLogHandle();
    v24 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        int v29 = 0;
        __int16 v30 = 1024;
        int v31 = 0;
        __int16 v32 = 2048;
        __int16 v33 = self;
        __int16 v34 = 2048;
        uint64_t v35 = WTFCurrentContinuousTime();
        _os_log_impl(&dword_1985F2000, v24, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu received response headers", buf, 0x22u);
      }
    }
    else
    {
      if (self)
      {
        os_signpost_id_t v25 = os_signpost_id_make_with_pointer(v23, self);
        if (v25 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_2;
        }
      }
      else
      {
        os_signpost_id_t v25 = 0xEEEEB0B5B2B2EEEELL;
      }
      if (os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1985F2000, v24, OS_SIGNPOST_EVENT, v25, "DataTask", "received response headers", buf, 2u);
      }
    }
  }
LABEL_2:
  int v9 = [(WKURLSessionTaskDelegate *)self connection];
  __int16 v10 = v9;
  if (v9)
  {
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref((atomic_uchar *volatile *)v9);
    WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)buf, (NSURLResponse *)a5);
    int v11 = _Block_copy(a6);
    __int16 v12 = (void *)WTF::fastMalloc((WTF *)0x10);
    *__int16 v12 = &unk_1EE9BD5D0;
    v12[1] = v11;
    _Block_release(0);
    uint64_t v13 = WTF::ObjectIdentifierGeneric<IPC::AsyncReplyIDType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>::generate();
    __int16 v14 = (IPC::Encoder *)WTF::fastMalloc((WTF *)0x238);
    *(_WORD *)__int16 v14 = 318;
    *((void *)v14 + 1) = 0;
    *((void *)v14 + 66) = (char *)v14 + 16;
    *((void *)v14 + 67) = 512;
    *((void *)v14 + 68) = 0;
    *((void *)v14 + 70) = 0;
    *((void *)v14 + 69) = 0;
    IPC::Encoder::encodeHeader(v14);
    __int16 v27 = v14;
    IPC::ArgumentCoder<WebKit::MonotonicObjectIdentifier<WebKit::EditorStateIdentifierType>,void>::encode(v14, (uint64_t *)&self->_identifier);
    IPC::ArgumentCoder<WebCore::ResourceResponse,void>::encode(v14, (WebCore::ResourceResponseBase *)buf);
    v26[0] = (uint64_t)v12;
    v26[1] = v13;
    IPC::Connection::sendMessageWithAsyncReply(v10, &v27, v26, 0, 0);
    uint64_t v16 = v26[0];
    v26[0] = 0;
    if (v16) {
      (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
    }
    uint64_t v17 = v27;
    __int16 v27 = 0;
    if (v17)
    {
      IPC::Encoder::~Encoder(v17, v15);
      WTF::fastFree(v20, v21);
    }
    _Block_release(0);
    CFTypeRef v19 = cf;
    CFTypeRef cf = 0;
    if (v19) {
      CFRelease(v19);
    }
    WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)buf, v18);
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<IPC::Connection,(WTF::DestructionThread)2>(*(atomic_uchar **)&v10->_os_unfair_lock_opaque);
  }
  else
  {
    (*((void (**)(id, void))a6 + 2))(a6, 0);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (kdebug_is_enabled())
  {
    int v11 = *MEMORY[0x1E4F30948];
    __int16 v12 = WTFSignpostLogHandle();
    uint64_t v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)&long long buf = 67110144;
        WORD4(buf) = 1024;
        *(_DWORD *)((char *)&buf + 10) = 0;
        HIWORD(buf) = 2048;
        uint64_t v17 = self;
        __int16 v18 = 2048;
        uint64_t v19 = WTFCurrentContinuousTime();
        __int16 v20 = 2048;
        uint64_t v21 = [a5 length];
        _os_log_impl(&dword_1985F2000, v13, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu received %zu bytes", (uint8_t *)&buf, 0x2Cu);
      }
    }
    else
    {
      if (self)
      {
        os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v12, self);
        if (v14 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_2;
        }
      }
      else
      {
        os_signpost_id_t v14 = 0xEEEEB0B5B2B2EEEELL;
      }
      if (os_signpost_enabled(v13))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = [a5 length];
        _os_signpost_emit_with_name_impl(&dword_1985F2000, v13, OS_SIGNPOST_EVENT, v14, "DataTask", "received %zu bytes", (uint8_t *)&buf, 0xCu);
      }
    }
  }
LABEL_2:
  objc_super v7 = [(WKURLSessionTaskDelegate *)self connection];
  v8 = v7;
  if (v7)
  {
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref(v7);
    if (a5)
    {
      uint64_t v9 = [a5 bytes];
      uint64_t v10 = [a5 length];
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
    v15[0] = v9;
    v15[1] = v10;
    *(void *)&long long buf = &self->_identifier;
    *((void *)&buf + 1) = v15;
    IPC::Connection::send<Messages::NetworkProcessProxy::DataTaskDidReceiveData>((uint64_t)v8, (uint64_t)&buf, 0, 0, 0);
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<IPC::Connection,(WTF::DestructionThread)2>(*v8);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (kdebug_is_enabled())
  {
    int v16 = *MEMORY[0x1E4F30948];
    uint64_t v17 = WTFSignpostLogHandle();
    __int16 v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67110144;
        *(_DWORD *)&uint8_t buf[4] = 0;
        LOWORD(v22) = 1024;
        *(_DWORD *)((char *)&v22 + 2) = 0;
        HIWORD(v22) = 2048;
        int v23 = self;
        __int16 v24 = 2048;
        uint64_t v25 = WTFCurrentContinuousTime();
        __int16 v26 = 1024;
        BOOL v27 = a5 != 0;
        _os_log_impl(&dword_1985F2000, v18, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu completed with error: %d", buf, 0x28u);
      }
    }
    else
    {
      if (self)
      {
        os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v17, self);
        if (v19 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_2;
        }
      }
      else
      {
        os_signpost_id_t v19 = 0xEEEEB0B5B2B2EEEELL;
      }
      if (os_signpost_enabled(v18))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = a5 != 0;
        _os_signpost_emit_with_name_impl(&dword_1985F2000, v18, OS_SIGNPOST_EVENT, v19, "DataTask", "completed with error: %d", buf, 8u);
      }
    }
  }
LABEL_2:
  objc_super v7 = [(WKURLSessionTaskDelegate *)self connection];
  v8 = v7;
  if (v7)
  {
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref(v7);
    MEMORY[0x199731570](buf, a5);
    v20[0] = &self->_identifier;
    v20[1] = buf;
    IPC::Connection::send<Messages::NetworkProcessProxy::DataTaskDidCompleteWithError>((uint64_t)v8, (uint64_t)v20, 0, 0, 0);
    CFTypeRef v10 = cf;
    CFTypeRef cf = 0;
    if (v10) {
      CFRelease(v10);
    }
    int v11 = v28;
    os_signpost_id_t v28 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2) {
        WTF::StringImpl::destroy(v11, v9);
      }
      else {
        *(_DWORD *)v11 -= 2;
      }
    }
    __int16 v12 = v22;
    uint64_t v22 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2) {
        WTF::StringImpl::destroy(v12, v9);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
    }
    uint64_t v13 = *(WTF::StringImpl **)buf;
    *(void *)long long buf = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2) {
        WTF::StringImpl::destroy(v13, v9);
      }
      else {
        *(_DWORD *)v13 -= 2;
      }
    }
    m_ptr = self->_session.m_impl.m_ptr;
    if (m_ptr)
    {
      uint64_t v15 = *((void *)m_ptr + 1);
      if (v15) {
        WebKit::NetworkSessionCocoa::removeDataTask(v15, self->_identifier.m_identifier);
      }
    }
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<IPC::Connection,(WTF::DestructionThread)2>(*v8);
  }
}

- (void).cxx_destruct
{
  m_ptr = (unsigned int *)self->_session.m_impl.m_ptr;
  self->_session.m_impl.m_ptr = 0;
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
  *((void *)self + 2) = 0;
  return self;
}

- (uint64_t)URLSession:task:didReceiveChallenge:completionHandler:
{
  *a1 = &unk_1EE9BD580;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (WTF::StringImpl)URLSession:task:didReceiveChallenge:completionHandler:
{
  uint64_t v2 = a1 + 8;
  if (a2 && *a2)
  {
    unsigned __int16 v4 = IPC::Decoder::decode<WebKit::AuthenticationChallengeDisposition>(a2);
    if (v4 > 0xFFu)
    {
      char v7 = v4;
      IPC::Decoder::decode<WebCore::Credential>(a2, (uint64_t)&v20);
      if (v23)
      {
        long long v9 = v20;
        long long v20 = 0uLL;
        long long v16 = v9;
        char v17 = v21;
        uint64_t v10 = v22;
        uint64_t v22 = 0;
        uint64_t v18 = v10;
        v15[0] = v7;
        char v19 = 1;
        std::__optional_destruct_base<WebCore::Credential,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v20, v8);
LABEL_12:
        if (v19)
        {
          WebKit::fromAuthenticationChallengeDisposition(v15[0]);
          WebCore::Credential::nsCredential((WebCore::Credential *)&v16);
          (*(void (**)(void))(*(void *)v2 + 16))();
          return (WTF::StringImpl *)std::__optional_destruct_base<std::tuple<WebKit::AuthenticationChallengeDisposition,WebCore::Credential>,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v15, v14);
        }
        else
        {
          std::__optional_destruct_base<std::tuple<WebKit::AuthenticationChallengeDisposition,WebCore::Credential>,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v15, v11);
          return IPC::Connection::cancelReply<Messages::NetworkProcessProxy::DataTaskReceivedChallenge,-[WKURLSessionTaskDelegate URLSession:task:didReceiveChallenge:completionHandler:]::$_0>(v2);
        }
      }
      v15[0] = 0;
      char v19 = 0;
      std::__optional_destruct_base<WebCore::Credential,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v20, v8);
    }
    else
    {
      v15[0] = 0;
      char v19 = 0;
    }
    int v11 = (WTF::StringImpl *)*a2;
    uint64_t v12 = a2[1];
    *a2 = 0;
    a2[1] = 0;
    uint64_t v13 = a2[3];
    if (v13 && v12) {
      (*(void (**)(uint64_t, WTF::StringImpl *))(*(void *)v13 + 16))(v13, v11);
    }
    goto LABEL_12;
  }
  uint64_t v5 = a1 + 8;

  return IPC::Connection::cancelReply<Messages::NetworkProcessProxy::DataTaskReceivedChallenge,-[WKURLSessionTaskDelegate URLSession:task:didReceiveChallenge:completionHandler:]::$_0>(v5);
}

- (WTF::StringImpl)URLSession:(uint64_t)a1 task:didReceiveChallenge:completionHandler:
{
  WebCore::CredentialBase::CredentialBase((WebCore::CredentialBase *)&v6);
  CFTypeRef cf = 0;
  WebKit::fromAuthenticationChallengeDisposition(0);
  WebCore::Credential::nsCredential((WebCore::Credential *)&v6);
  (*(void (**)(void))(*(void *)a1 + 16))();
  CFTypeRef v3 = cf;
  CFTypeRef cf = 0;
  if (v3) {
    CFRelease(v3);
  }
  unsigned __int16 v4 = v7;
  char v7 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v2);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  result = v6;
  os_signpost_id_t v6 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2) {
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v2);
    }
    else {
      *(_DWORD *)result -= 2;
    }
  }
  return result;
}

- (uint64_t)URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:
{
  if (a2 && *a2)
  {
    if ((unsigned __int16)IPC::ArgumentCoder<std::tuple<BOOL>,void>::decode<IPC::Decoder>(a2) > 0xFFu)
    {
      unsigned __int16 v4 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);
      goto LABEL_7;
    }
    uint64_t v5 = *a2;
    uint64_t v6 = a2[1];
    *a2 = 0;
    a2[1] = 0;
    uint64_t v7 = a2[3];
    if (v7 && v6) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)v7 + 16))(v7, v5);
    }
  }
  unsigned __int16 v4 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);
LABEL_7:

  return v4();
}

- (uint64_t)URLSession:dataTask:didReceiveResponse:completionHandler:
{
  if (a2 && *a2)
  {
    if ((unsigned __int16)IPC::ArgumentCoder<std::tuple<BOOL>,void>::decode<IPC::Decoder>(a2) > 0xFFu)
    {
      unsigned __int16 v4 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);
      goto LABEL_7;
    }
    uint64_t v5 = *a2;
    uint64_t v6 = a2[1];
    *a2 = 0;
    a2[1] = 0;
    uint64_t v7 = a2[3];
    if (v7 && v6) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)v7 + 16))(v7, v5);
    }
  }
  unsigned __int16 v4 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);
LABEL_7:

  return v4();
}

@end