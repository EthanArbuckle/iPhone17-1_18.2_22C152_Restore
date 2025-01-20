@interface NSCFURLLocalStreamTaskFromDataTask
@end

@implementation NSCFURLLocalStreamTaskFromDataTask

void __77____NSCFURLLocalStreamTaskFromDataTask_connection_didReceiveData_completion___block_invoke(void *a1)
{
  v2 = [__NSCFURLLocalStreamTaskFromDataTaskDataBlobby alloc];
  if (v2)
  {
    v3 = a1[4];
    v4 = (const void *)a1[6];
    v8.receiver = v2;
    v8.super_class = (Class)__NSCFURLLocalStreamTaskFromDataTaskDataBlobby;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    v6 = v5;
    if (v5)
    {
      v5[1] = v3;
      dispatch_retain(v3);
      v6[2] = _Block_copy(v4);
    }
  }
  else
  {
    v6 = 0;
  }
  [*(id *)(a1[5] + 1232) addObject:v6];

  -[__NSCFURLLocalStreamTaskFromDataTask _onqueue_ioTickFromDataTaskConversion:](a1[5], (uint64_t)"didReceiveData");
  v7 = a1[4];

  dispatch_release(v7);
}

void __78____NSCFURLLocalStreamTaskFromDataTask__onqueue_ioTickFromDataTaskConversion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1
    && *(void *)(v1 + 1200)
    && !*(unsigned char *)(v1 + 1208)
    && !*(void *)(v1 + 1216)
    && *(unsigned char *)(v1 + 1209)
    && [*(id *)(v1 + 1232) count])
  {
    *(unsigned char *)(v1 + 1209) = 0;
    uint64_t v2 = [*(id *)(v1 + 1232) firstObject];
    if (v2)
    {
      uint64_t v3 = v2;
      v4 = *(__CFWriteStream **)(v1 + 1200);
      if (!CFWriteStreamCanAcceptBytes(v4)) {
        return;
      }
      CFIndex v10 = 0;
      buffer_ptr = 0;
      map = dispatch_data_create_map(*(dispatch_data_t *)(v3 + 8), (const void **)&buffer_ptr, (size_t *)&v10);
      size_t v6 = CFWriteStreamWrite(v4, (const UInt8 *)buffer_ptr, v10);
      if (v6)
      {
        if ((v6 & 0x8000000000000000) != 0)
        {
          dispatch_release(map);
          *(CFStreamError *)(v1 + 1216) = CFWriteStreamGetError((CFWriteStreamRef)*(void *)(v1 + 1200));
        }
        else
        {
          if (v10 != v6)
          {
            dispatch_data_t subrange = dispatch_data_create_subrange(*(dispatch_data_t *)(v3 + 8), v6, v10 - v6);
            dispatch_release(*(dispatch_object_t *)(v3 + 8));
            *(void *)(v3 + 8) = subrange;
            dispatch_release(map);
            return;
          }
          dispatch_release(map);
          v7 = *(void (***)(void))(v3 + 16);
          if (v7)
          {
            *(void *)(v3 + 16) = 0;
            v7[2](v7);
            _Block_release(v7);
          }
        }
      }
      else
      {
        dispatch_release(map);
        *(unsigned char *)(v1 + 1208) = 1;
      }
    }
    objc_super v8 = *(void **)(v1 + 1232);
    [v8 removeObjectAtIndex:0];
  }
}

void __77____NSCFURLLocalStreamTaskFromDataTask_connection_didFinishLoadingWithError___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77____NSCFURLLocalStreamTaskFromDataTask_connection_didFinishLoadingWithError___block_invoke_2;
  v4[3] = &unk_1E5257FB0;
  long long v5 = *(_OWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 768), "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v4, (uint64_t)"connection:didFinishLoadingWithError"));
  [(__NSCFURLLocalStreamTask *)*(void *)(a1 + 32) _onqueue_ioTick];
}

void __77____NSCFURLLocalStreamTaskFromDataTask_connection_didFinishLoadingWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(__CFWriteStream **)(v1 + 1200);
    if (v2)
    {
      CFWriteStreamSetClient(v2, 0, 0, 0);
      CFWriteStreamClose(*(CFWriteStreamRef *)(v1 + 1200));
      CFRelease(*(CFTypeRef *)(v1 + 1200));
      *(void *)(v1 + 1200) = 0;
    }
    uint64_t v3 = *(__CFReadStream **)(v1 + 1168);
    if (v3)
    {
      CFReadStreamSetClient(v3, 0, 0, 0);
      CFReadStreamClose(*(CFReadStreamRef *)(v1 + 1168));
      CFRelease(*(CFTypeRef *)(v1 + 1168));
      *(void *)(v1 + 1168) = 0;
    }
  }
}

void __86____NSCFURLLocalStreamTaskFromDataTask_initWithTask_inputStream_ouptutStream_disavow___block_invoke(uint64_t a1)
{
}

uint64_t __104____NSCFURLLocalStreamTaskFromDataTask_initWithTask_remainingInputStream_remainingOutputStream_disavow___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFWriteStreamRef writeStream = 0;
  CFReadStreamRef v15 = 0;
  if (a1[4] && a1[5])
  {
    CFReadStreamRef readStream = 0;
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStreamCreateBoundPair((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &readStream, (CFWriteStreamRef *)(a1[6] + 1200), 0xFFFFLL);
    uint64_t v3 = (void *)a1[4];
    values.version = (CFIndex)readStream;
    values.info = v3;
    CFArrayRef v4 = CFArrayCreate(v2, (const void **)&values, 2, MEMORY[0x1E4F1D510]);
    if (readStream) {
      CFRelease(readStream);
    }
    long long v5 = (__CFReadStream *)CFReadStreamCreate();
    CFReadStreamRef v15 = v5;
    if (v4) {
      CFRelease(v4);
    }
    size_t v6 = (const void *)a1[5];
    if (v6) {
      v7 = (__CFWriteStream *)CFRetain(v6);
    }
    else {
      v7 = 0;
    }
    CFWriteStreamRef writeStream = v7;
  }
  else
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStreamCreateBoundPair((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &v15, (CFWriteStreamRef *)(a1[6] + 1200), 0xFFFFLL);
    CFStreamCreateBoundPair(v8, (CFReadStreamRef *)(a1[6] + 1168), &writeStream, 0xFFFFLL);
    v7 = writeStream;
    long long v5 = v15;
  }
  -[__NSCFURLLocalStreamTask _onqueue_readStream:writeStreamAvailable:](a1[6], v5, v7);
  CFReadStreamRef v9 = v15;
  CFReadStreamRef v15 = 0;
  if (v9) {
    CFRelease(v9);
  }
  CFWriteStreamRef v10 = writeStream;
  CFWriteStreamRef writeStream = 0;
  if (v10) {
    CFRelease(v10);
  }
  v11 = (CFReadStreamRef *)a1[6];
  values.version = 0;
  values.info = v11;
  values.retain = _rr_retain;
  values.release = _rr_release;
  values.copyDescription = (CFStringRef (__cdecl *)(void *))MEMORY[0x1E4F1C220];
  CFReadStreamSetClient(v11[146], 0x1AuLL, (CFReadStreamClientCallBack)_onqueue_stFromDataTaskReadCallback, &values);
  MEMORY[0x185319F20](*(void *)(a1[6] + 1168), [(id)a1[6] workQueue]);
  CFReadStreamOpen(*(CFReadStreamRef *)(a1[6] + 1168));
  if (!a1[5]) {
    -[__NSCFURLLocalStreamTask _onqueue_closeWriteOp]((void *)a1[6]);
  }
  CFWriteStreamSetClient(*(CFWriteStreamRef *)(a1[6] + 1200), 0x1CuLL, (CFWriteStreamClientCallBack)_onqueue_stFromDataTaskWriteCallback, &values);
  MEMORY[0x18531A970](*(void *)(a1[6] + 1200), [(id)a1[6] workQueue]);
  return CFWriteStreamOpen(*(CFWriteStreamRef *)(a1[6] + 1200));
}

uint64_t __61____NSCFURLLocalStreamTaskFromDataTask_initWithTask_disavow___block_invoke(uint64_t a1)
{
  CFReadStreamRef readStream = 0;
  CFStreamCreateBoundPair((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &readStream, (CFWriteStreamRef *)(*(void *)(a1 + 32) + 1200), 0xFFFFLL);
  CFAllocatorRef v2 = (const void *)CFWriteStreamCreate();
  -[__NSCFURLLocalStreamTask _onqueue_readStream:writeStreamAvailable:](*(void *)(a1 + 32), readStream, v2);
  CFReadStreamRef v3 = readStream;
  CFReadStreamRef readStream = 0;
  if (v3) {
    CFRelease(v3);
  }
  if (v2) {
    CFRelease(v2);
  }
  CFArrayRef v4 = *(CFWriteStreamRef **)(a1 + 32);
  v6.version = 0;
  v6.info = v4;
  v6.retain = _rr_retain;
  v6.release = _rr_release;
  v6.copyDescription = (CFStringRef (__cdecl *)(void *))MEMORY[0x1E4F1C220];
  CFWriteStreamSetClient(v4[150], 0x1CuLL, (CFWriteStreamClientCallBack)_onqueue_stFromDataTaskWriteCallback, &v6);
  MEMORY[0x18531A970](*(void *)(*(void *)(a1 + 32) + 1200), [*(id *)(a1 + 32) workQueue]);
  return CFWriteStreamOpen(*(CFWriteStreamRef *)(*(void *)(a1 + 32) + 1200));
}

void *__61____NSCFURLLocalStreamTaskFromDataTask_initWithTask_disavow___block_invoke_2(uint64_t a1, uint64_t a2)
{
  result = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 32, 0);
  void *result = &unk_1ECFA2B68;
  result[1] = a2;
  result[2] = 0;
  result[3] = 0;
  return result;
}

@end