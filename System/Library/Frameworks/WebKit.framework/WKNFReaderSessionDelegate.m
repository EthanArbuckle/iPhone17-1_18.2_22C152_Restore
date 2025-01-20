@interface WKNFReaderSessionDelegate
- (WKNFReaderSessionDelegate)initWithConnection:(void *)a3;
- (id).cxx_construct;
- (uint64_t)readerSession:(WTF *)this didDetectTags:(void *)a2;
- (void)readerSession:(id)a3 didDetectTags:(id)a4;
- (void)readerSession:(void *)a1 didDetectTags:(void *)a2;
- (void)readerSession:(void *)result didDetectTags:;
@end

@implementation WKNFReaderSessionDelegate

- (WKNFReaderSessionDelegate)initWithConnection:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WKNFReaderSessionDelegate;
  v5 = [(WKNFReaderSessionDelegate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = *((void *)a3 + 1);
    if (v6) {
      goto LABEL_7;
    }
    uint64_t v6 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)uint64_t v6 = 1;
    *(void *)(v6 + 8) = a3;
    v7 = (unsigned int *)*((void *)a3 + 1);
    *((void *)a3 + 1) = v6;
    if (!v7) {
      goto LABEL_7;
    }
    if (atomic_fetch_add((atomic_uint *volatile)v7, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v7);
      WTF::fastFree((WTF *)v7, v4);
    }
    uint64_t v6 = *((void *)a3 + 1);
    if (v6) {
LABEL_7:
    }
      atomic_fetch_add((atomic_uint *volatile)v6, 1u);
    m_ptr = (unsigned int *)v5->_connection.m_impl.m_ptr;
    v5->_connection.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
    if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v4);
    }
  }
  return v5;
}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  WTF::RunLoop::main((WTF::RunLoop *)self);
  m_ptr = self->_connection.m_impl.m_ptr;
  if (m_ptr) {
    atomic_fetch_add((atomic_uint *volatile)m_ptr, 1u);
  }
  if (a4) {
    CFRetain(a4);
  }
  v7 = (void *)WTF::fastMalloc((WTF *)0x18);
  void *v7 = &unk_1EE9D2D08;
  v7[1] = m_ptr;
  v7[2] = a4;
  v8 = v7;
  WTF::RunLoop::dispatch();
  if (v8) {
    (*(void (**)(void *))(*v8 + 8))(v8);
  }
}

- (void).cxx_destruct
{
  m_ptr = (unsigned int *)self->_connection.m_impl.m_ptr;
  self->_connection.m_impl.m_ptr = 0;
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

- (void)readerSession:(void *)a1 didDetectTags:(void *)a2
{
  *a1 = &unk_1EE9D2D08;
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (unsigned int *)a1[1];
  a1[1] = 0;
  if (v4 && atomic_fetch_add((atomic_uint *volatile)v4, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v4);
    WTF::fastFree((WTF *)v4, a2);
  }
  return a1;
}

- (uint64_t)readerSession:(WTF *)this didDetectTags:(void *)a2
{
  *(void *)this = &unk_1EE9D2D08;
  v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (unsigned int *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4 && atomic_fetch_add((atomic_uint *volatile)v4, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v4);
    WTF::fastFree((WTF *)v4, a2);
  }

  return WTF::fastFree(this, a2);
}

- (void)readerSession:(void *)result didDetectTags:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = result[1];
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 8);
    if (v2)
    {
      uint64_t v3 = *(void *)(v2 + 32);
      if (v3)
      {
        if (*(void *)(v3 + 8))
        {
          v4 = (void *)result[2];
          result = (void *)[v4 count];
          if (result)
          {
            v5 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 0), "tagID");
            long long v30 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
            if (v6)
            {
              uint64_t v7 = *(void *)v31;
              while (2)
              {
                for (uint64_t i = 0; i != v6; ++i)
                {
                  if (*(void *)v31 != v7) {
                    objc_enumerationMutation(v4);
                  }
                  if ((objc_msgSend(v5, "isEqualToData:", objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "tagID")) & 1) == 0)
                  {
                    uint64_t v20 = *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 16);
                    if (v20)
                    {
                      uint64_t v21 = *(void *)(v20 + 8);
                      if (v21) {
                        (*(void (**)(uint64_t, void))(*(void *)v21 + 24))(v21, 0);
                      }
                    }
                    [*(id *)(v2 + 16) stopPolling];
                    return (void *)WTF::RunLoop::TimerBase::start();
                  }
                }
                uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
                if (v6) {
                  continue;
                }
                break;
              }
            }
            long long v28 = 0u;
            long long v29 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            uint64_t v9 = [v4 countByEnumeratingWithState:&v26 objects:v35 count:16];
            if (v9)
            {
              uint64_t v10 = *(void *)v27;
              while (2)
              {
                for (uint64_t j = 0; j != v9; ++j)
                {
                  if (*(void *)v27 != v10) {
                    objc_enumerationMutation(v4);
                  }
                  v12 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                  if (([v12 type] == 3
                     || [v12 type] == 6
                     || [v12 type] == 16)
                    && [*(id *)(v2 + 16) connectTag:v12])
                  {
                    v13 = *(void **)(v2 + 16);
                    v14 = (const void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&fido::kCtapNfcAppletSelectionCommand length:13];
                    v15 = (void *)[v13 transceive:v14];
                    if (v14) {
                      CFRelease(v14);
                    }
                    if (v15)
                    {
                      if ([v15 length] == 8
                        && *(void *)[v15 bytes] == 0x9032565F463255)
                      {
                        goto LABEL_47;
                      }
                      if ([v15 length] == 10)
                      {
                        uint64_t v16 = [v15 bytes];
                        if (*(void *)v16 == 0x305F325F4F444946 && *(_WORD *)(v16 + 8) == 144) {
                          goto LABEL_47;
                        }
                      }
                    }
                    v18 = (const void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&fido::kCtapNfcU2fVersionCommand length:5];
                    v19 = (void *)[v13 transceive:v18];
                    if (v18) {
                      CFRelease(v18);
                    }
                    if (v19
                      && [v19 length] == 8
                      && *(void *)[v19 bytes] == 0x9032565F463255)
                    {
LABEL_47:
                      uint64_t v22 = *(void *)(v2 + 32);
                      if (v22) {
                        uint64_t v23 = *(void *)(v22 + 8);
                      }
                      else {
                        uint64_t v23 = 0;
                      }
                      v24 = *(_DWORD **)(v23 + 32);
                      if (v24) {
                        ++*v24;
                      }
                      uint64_t v25 = WTF::fastMalloc((WTF *)0x20);
                      *(_DWORD *)(v25 + 16) = 0;
                      *(unsigned char *)(v25 + 20) = 1;
                      *(void *)uint64_t v25 = &unk_1EE9E5888;
                      *(void *)(v25 + 8) = 0;
                      *(void *)(v25 + 24) = v24;
                      v34 = (void *)v25;
                      WebKit::FidoService::getInfo(v23, (uint64_t *)&v34);
                      result = v34;
                      v34 = 0;
                      if (result) {
                        return (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
                      }
                      return result;
                    }
                    [*(id *)(v2 + 16) disconnectTag];
                  }
                }
                uint64_t v9 = [v4 countByEnumeratingWithState:&v26 objects:v35 count:16];
                if (v9) {
                  continue;
                }
                break;
              }
            }
            [*(id *)(v2 + 16) stopPolling];
            return (void *)WTF::RunLoop::TimerBase::start();
          }
        }
      }
    }
  }
  return result;
}

@end