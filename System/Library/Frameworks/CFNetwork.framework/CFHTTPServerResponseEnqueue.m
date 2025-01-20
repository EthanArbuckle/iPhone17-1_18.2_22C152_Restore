@interface CFHTTPServerResponseEnqueue
@end

@implementation CFHTTPServerResponseEnqueue

void ___CFHTTPServerResponseEnqueue_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2[10];
  if (v3 && (uint64_t v4 = *(void *)(v3 + 136)) != 0)
  {
    if (HTTPServerConnection::Class(void)::sOnce_HTTPServerConnection != -1) {
      dispatch_once(&HTTPServerConnection::Class(void)::sOnce_HTTPServerConnection, &__block_literal_global_16431);
    }
    v5 = (HTTPServerRequest *)a2[10];
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v4 + 104));
    uint64_t v6 = *(void *)(v4 + 256);
    if (v6)
    {
      while (*(HTTPServerRequest **)(v6 + 16) != v5)
      {
        uint64_t v6 = *(void *)(v6 + 32);
        if (!v6) {
          goto LABEL_8;
        }
      }
      if (*(void *)(v6 + 24) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Already have a response for this request!", v18, 2u);
      }
      v11 = (__CFHTTPMessage *)a2[12];
      if (v11 && CFHTTPMessageGetResponseStatusCode(v11) == 100)
      {
        v12 = CFAllocatorAllocate(*(CFAllocatorRef *)(v6 + 8), 40, 0);
        _OWORD *v12 = 0u;
        v12[1] = 0u;
        *((void *)v12 + 4) = 0;
        v13 = HTTPServerConnection::PendingQueue::PendingQueue(v12, *(void *)(v6 + 16));
        v13[4] = *(void *)(v6 + 32);
        *(void *)(v6 + 32) = v13;
        CFGetAllocator((CFTypeRef)v4);
        if (TCFObject<HTTPServerRequest>::Class(void)::sOnce != -1) {
          dispatch_once(&TCFObject<HTTPServerRequest>::Class(void)::sOnce, &__block_literal_global_79_16410);
        }
        Instance = (_OWORD *)_CFRuntimeCreateInstance();
        uint64_t v15 = (uint64_t)Instance;
        if (Instance)
        {
          Instance[1] = 0u;
          uint64_t v15 = (uint64_t)(Instance + 1);
          Instance[14] = 0u;
          Instance[15] = 0u;
          Instance[12] = 0u;
          Instance[13] = 0u;
          Instance[10] = 0u;
          Instance[11] = 0u;
          Instance[8] = 0u;
          Instance[9] = 0u;
          Instance[6] = 0u;
          Instance[7] = 0u;
          Instance[4] = 0u;
          Instance[5] = 0u;
          Instance[2] = 0u;
          Instance[3] = 0u;
        }
        v16 = (HTTPServerRequest *)HTTPServerRequest::HTTPServerRequest(v15, (NSObject **)v4);
        HTTPServerRequest::producerEOFEncountered(v16);
        HTTPServerConnection::RRQueue::setRequest(v6, v15);
        CFRelease((CFTypeRef)(v15 - 16));
        v17 = (char *)a2[11];
        if (v17 != (char *)v5 - 16)
        {
          if (v17) {
            CFRelease(v17);
          }
          a2[11] = CFRetain((char *)v5 - 16);
        }
      }
      HTTPServerConnection::RRQueue::setResponse(v6, (uint64_t)a2);
      HTTPServerConnection::checkPendingQueue((dispatch_queue_t *)(v4 + 16));
    }
    else
    {
LABEL_8:
      HTTPServerRequest::loseConnectionReferenceAndTerminateReads(v5);
      v7 = (const void *)a2[9];
      a2[9] = 0;
      if (v7) {
        CFRelease(v7);
      }
      CFErrorRef v8 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"kCFHTTPServerErrorDomain", 1102, 0);
      v9 = (__CFError *)CFAutorelease(v8);
      HTTPServerConnection::connectionError((dispatch_queue_t *)(v4 + 16), v9);
    }
  }
  else
  {
    v10 = (const void *)a2[9];
    a2[9] = 0;
    if (v10)
    {
      CFRelease(v10);
    }
  }
}

@end