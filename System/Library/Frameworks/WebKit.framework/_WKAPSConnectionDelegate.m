@interface _WKAPSConnectionDelegate
- (_WKAPSConnectionDelegate)initWithConnection:(void *)a3;
- (id).cxx_construct;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
@end

@implementation _WKAPSConnectionDelegate

- (_WKAPSConnectionDelegate)initWithConnection:(void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_WKAPSConnectionDelegate;
  v5 = [(_WKAPSConnectionDelegate *)&v9 init];
  if (v5)
  {
    if (a3)
    {
      WTF::WeakPtrFactory<WebPushD::PushServiceConnection,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3 + 2, (uint64_t)a3);
      v6 = (atomic_uint *)*((void *)a3 + 1);
      if (v6) {
        atomic_fetch_add(v6, 1u);
      }
    }
    else
    {
      v6 = 0;
    }
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

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  m_ptr = self->_connection.m_impl.m_ptr;
  if (m_ptr && *((void *)m_ptr + 1) && objc_msgSend(a4, "length", a3))
  {
    v7 = self->_connection.m_impl.m_ptr;
    if (v7)
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (a4) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v8 = 0;
      if (a4)
      {
LABEL_6:
        objc_super v9 = (char *)[a4 bytes];
        unint64_t v10 = [a4 length];
        unint64_t v11 = v10;
        v16 = 0;
        LODWORD(v17) = 0;
        HIDWORD(v17) = v10;
        if (v10)
        {
          if (HIDWORD(v10))
          {
            __break(0xC471u);
            return;
          }
          v12 = (WTF *)WTF::fastMalloc((WTF *)v10);
          LODWORD(v17) = v11;
          v16 = v12;
          do
          {
            char v13 = *v9++;
            *(unsigned char *)v12 = v13;
            v12 = (WTF *)((char *)v12 + 1);
            --v11;
          }
          while (v11);
        }
        goto LABEL_10;
      }
    }
    v16 = 0;
    uint64_t v17 = 0;
LABEL_10:
    WebPushD::PushServiceConnection::didReceivePublicToken(v8, (uint64_t *)&v16);
    v15 = v16;
    if (v16)
    {
      v16 = 0;
      LODWORD(v17) = 0;
      WTF::fastFree(v15, v14);
    }
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  m_ptr = self->_connection.m_impl.m_ptr;
  if (m_ptr)
  {
    v5 = (WebPushD::PushServiceConnection *)*((void *)m_ptr + 1);
    if (v5)
    {
      v7 = (NSString *)objc_msgSend(a4, "topic", a3);
      uint64_t v8 = (NSDictionary *)[a4 userInfo];
      WebPushD::PushServiceConnection::didReceivePushMessage(v5, v7, v8);
    }
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

@end