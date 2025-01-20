@interface NWStreamPair
- (CFTypeRef)_offqueue_owner_copyProperty:(uint64_t)a1;
- (void)_onqueue_checkForCompletion;
- (void)_onqueue_issue_read;
- (void)_onqueue_issue_read0:(void *)a1;
- (void)dealloc;
- (void)withTLSMetadata:(uint64_t)a1;
@end

@implementation NWStreamPair

- (void)dealloc
{
  if (self->_rs || self->_ws) {
    __assert_rtn("-[NWStreamPair dealloc]", "HTTPServerNWStream.mm", 662, "_rs == NULL && _ws == NULL");
  }
  readData = self->_readData;
  if (readData)
  {
    (*((void (**)(ReadBuffer *, SEL))readData->var0 + 1))(readData, a2);
    self->_readData = 0;
  }
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  connection = self->_connection;
  if (connection)
  {
    nw_release(connection);
    self->_connection = 0;
  }
  cachedPeerName = self->_cachedPeerName;
  self->_cachedPeerName = 0;
  if (cachedPeerName) {
    CFRelease(cachedPeerName);
  }
  cachedPeerCerts = self->_cachedPeerCerts;
  self->_cachedPeerCerts = 0;
  if (cachedPeerCerts) {
    CFRelease(cachedPeerCerts);
  }
  cachedTrust = self->_cachedTrust;
  self->_cachedTrust = 0;
  if (cachedTrust) {
    CFRelease(cachedTrust);
  }
  readError = self->_readError;
  self->_readError = 0;
  if (readError) {
    CFRelease(readError);
  }
  writeError = self->_writeError;
  self->_writeError = 0;
  if (writeError) {
    CFRelease(writeError);
  }
  v11.receiver = self;
  v11.super_class = (Class)NWStreamPair;
  [(__CFNCoreLoggable *)&v11 dealloc];
}

BOOL __39__NWStreamPair_copyConnectionPeerCerts__block_invoke(uint64_t a1, sec_protocol_metadata_t metadata)
{
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __39__NWStreamPair_copyConnectionPeerCerts__block_invoke_2;
  handler[3] = &__block_descriptor_40_e38_v16__0__NSObject_OS_sec_certificate__8l;
  handler[4] = *(void *)(a1 + 32);
  return sec_protocol_metadata_access_peer_certificate_chain(metadata, handler);
}

- (void)withTLSMetadata:(uint64_t)a1
{
  v4 = MEMORY[0x18531D270]();
  if (v4)
  {
    v5 = v4;
    nw_protocol_metadata_t v6 = nw_connection_copy_protocol_metadata(*(nw_connection_t *)(a1 + 16), v4);
    CFRelease(v5);
    if (v6)
    {
      if (nw_protocol_metadata_is_tls(v6))
      {
        v7 = v6;
        if (v7)
        {
          v8 = v7;
          (*(void (**)(uint64_t, NSObject *))(a2 + 16))(a2, v7);
          CFRelease(v8);
        }
      }
      CFRelease(v6);
    }
  }
}

void __39__NWStreamPair_copyConnectionPeerCerts__block_invoke_2(uint64_t a1, sec_certificate_t certificate)
{
  SecCertificateRef v3 = sec_certificate_copy_ref(certificate);
  if (v3)
  {
    SecCertificateRef v4 = v3;
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v3);
    CFRelease(v4);
  }
}

void __39__NWStreamPair_copyConnectionPeerTrust__block_invoke(uint64_t a1)
{
  v2 = sec_protocol_metadata_copy_sec_trust();
  if (v2)
  {
    SecCertificateRef v3 = v2;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sec_trust_copy_ref(v2);
    CFRelease(v3);
  }
}

- (void)_onqueue_issue_read
{
  if (*(void *)(a1 + 24))
  {
    if (!*(unsigned char *)(a1 + 80) && !*(void *)(a1 + 56) && !*(unsigned char *)(a1 + 82))
    {
      uint64_t v1 = *(void *)(a1 + 72);
      if (!*(unsigned char *)(v1 + 32))
      {
        uint64_t v2 = *(void *)(v1 + 8);
        uint64_t v3 = *(void *)(v1 + 24);
        uint64_t v4 = v2 - v3;
        if (v2 != v3)
        {
          *(unsigned char *)(v1 + 32) = 1;
          if (v4 >= 1) {
            -[NWStreamPair _onqueue_issue_read0:]((void *)a1, v4);
          }
        }
      }
    }
  }
}

- (void)_onqueue_issue_read0:(void *)a1
{
  if (a2 >= 0xFFFF) {
    uint32_t v3 = 0xFFFF;
  }
  else {
    uint32_t v3 = a2;
  }
  CFRetain(a1);
  uint64_t v4 = a1[2];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__NWStreamPair__onqueue_issue_read0___block_invoke;
  v5[3] = &unk_1E5256690;
  v5[4] = a1;
  uint32_t v6 = v3;
  nw_connection_receive(v4, 1u, v3, v5);
}

void __37__NWStreamPair__onqueue_issue_read0___block_invoke(uint64_t a1, dispatch_data_t data, nw_content_context_t context, BOOL a4, nw_error_t error)
{
  if (context) {
    BOOL is_final = 0;
  }
  else {
    BOOL is_final = a4;
  }
  if (context && a4) {
    BOOL is_final = nw_content_context_get_is_final(context);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    if (!*(void *)(v9 + 24)) {
      goto LABEL_28;
    }
    if (data)
    {
      uint64_t v10 = *(void *)(v9 + 72);
      if (!*(unsigned char *)(v10 + 32)) {
        __assert_rtn("copyInData", "HTTPServerNWStream.mm", 61, "_readOutstanding");
      }
      *(unsigned char *)(v10 + 32) = 0;
      int64_t size = dispatch_data_get_size(data);
      v12 = *(const void **)(v10 + 16);
      if (v12)
      {
        *(void *)(v10 + 16) = dispatch_data_create_concat(*(dispatch_data_t *)(v10 + 16), data);
        CFRelease(v12);
        data = *(dispatch_data_t *)(v10 + 16);
        size += *(void *)(v10 + 24);
      }
      else
      {
        CFRetain(data);
        *(void *)(v10 + 16) = data;
      }
      *(void *)(v10 + 24) = size;
      if (dispatch_data_get_size(data) != size) {
        __assert_rtn("copyInData", "HTTPServerNWStream.mm", 75, "dispatch_data_get_size(_dataBuffer) == _dataBufferSize");
      }
      if (size > *(void *)(v10 + 8)) {
        __assert_rtn("copyInData", "HTTPServerNWStream.mm", 76, "_dataBufferSize <= _maxReadCount");
      }
    }
    *(unsigned char *)(v9 + 80) = is_final;
    if (error && !*(void *)(v9 + 56)) {
      *(void *)(v9 + 56) = nw_error_copy_cf_error(error);
    }
    v13 = *(void **)(v9 + 24);
    v14 = ReadBuffer::countOfAvailableBytes(*(ReadBuffer **)(v9 + 72));
    int v15 = *(unsigned __int8 *)(v9 + 80);
    uint64_t v16 = *(void *)(v9 + 56);
    v17 = v13[5];
    if (v17)
    {
      dispatch_semaphore_signal(v17);
      v13[5] = 0;
    }
    if ((uint64_t)v14 >= 1) {
      (*(void (**)(void *, uint64_t))(*v13 + 56))(v13, 2);
    }
    if (v15) {
      (*(void (**)(void *, uint64_t))(*v13 + 56))(v13, 16);
    }
    if (v16) {
      (*(void (**)(void *, uint64_t))(*v13 + 64))(v13, v16);
    }
    -[NWStreamPair _onqueue_issue_read](v9);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
LABEL_28:
      CFRelease((CFTypeRef)v9);
    }
  }
}

- (void)_onqueue_checkForCompletion
{
  if (*(unsigned char *)(a1 + 82) && *(unsigned char *)(a1 + 81) && (*(void *)(a1 + 64) || !*(void *)(a1 + 112))) {
    nw_connection_cancel(*(nw_connection_t *)(a1 + 16));
  }
}

void __44__NWStreamPair__onqueue_writeData_outError___block_invoke(uint64_t a1, nw_error_t error)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = v2[14] - 1;
    v2[14] = v6;
    if (!v6) {
      -[NWStreamPair _onqueue_checkForCompletion]((uint64_t)v2);
    }
    if (error && !v2[8])
    {
      v2[8] = nw_error_copy_cf_error(error);
      -[NWStreamPair _onqueue_checkForCompletion]((uint64_t)v2);
    }
    v7 = (void *)v2[4];
    if (v7)
    {
      uint64_t v8 = v2[8];
      if (v5 >= 1) {
        v7[5] -= v5;
      }
      uint64_t v9 = v7[6];
      if (v9)
      {
        dispatch_semaphore_signal(v9);
        v7[6] = 0;
      }
      if ((uint64_t)v7[5] <= 65534) {
        (*(void (**)(void *, uint64_t))(*v7 + 56))(v7, 4);
      }
      if (v8) {
        (*(void (**)(void *, uint64_t))(*v7 + 64))(v7, v8);
      }
    }
    uint64_t v10 = *(const void **)(a1 + 32);
    if (v10)
    {
      CFRelease(v10);
    }
  }
}

- (CFTypeRef)_offqueue_owner_copyProperty:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  int ExactString = _findExactString(theString, 2u);
  switch(ExactString)
  {
    case 230928472:
      uint64_t v4 = 96;
      break;
    case 229937221:
      uint64_t v4 = 104;
      break;
    case 122947790:
      uint64_t v4 = 88;
      break;
    default:
      return 0;
  }
  uint64_t v5 = *(const void **)(a1 + v4);
  if (!v5) {
    return 0;
  }

  return CFRetain(v5);
}

@end