@interface PHImageIODecoder
+ (id)sharedDecoder;
+ (int64_t)maxConcurrentDecodeCount;
+ (void)setMaxConcurrentDecodeCount:(int64_t)a3;
- (PHImageIODecoder)init;
- (id)decodeImageFromData:(id)a3 orFileURL:(id)a4 options:(id)a5 completion:(id)a6;
- (id)decodeImageFromData:(id)a3 orFileURL:(id)a4 options:(id)a5 existingRequestHandle:(id)a6 completion:(id)a7;
@end

@implementation PHImageIODecoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concurrentRequestSemaphore, 0);
  objc_storeStrong((id *)&self->_activeRequestQueue, 0);

  objc_storeStrong((id *)&self->_pendingRequestQueue, 0);
}

- (id)decodeImageFromData:(id)a3 orFileURL:(id)a4 options:(id)a5 existingRequestHandle:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, CGImage *, CFTypeRef, void, id))a7;
  if ([v14 waitUntilComplete])
  {
    CFTypeRef v31 = 0;
    unsigned int v30 = 1;
    id v29 = 0;
    v17 = _createDecodedImageUsingImageIOWithFileUrlOrData(v14, v13, v12, [v14 maximumLongSideLength], objc_msgSend(v14, "optimizeForDrawing"), objc_msgSend(v14, "shouldLoadGainMap"), (uint64_t *)&v31, (int *)&v30, &v29);
    id v18 = v29;
    v16[2](v16, v17, v31, v30, v18);
    CGImageRelease(v17);
    if (v31) {
      CFRelease(v31);
    }

    v19 = 0;
  }
  else
  {
    if (v15) {
      v20 = (PHImageDecoderAsyncDecodeRequestHandle *)v15;
    }
    else {
      v20 = [[PHImageDecoderAsyncDecodeRequestHandle alloc] initWithImageIODecoder:self];
    }
    pendingRequestQueue = self->_pendingRequestQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__PHImageIODecoder_decodeImageFromData_orFileURL_options_existingRequestHandle_completion___block_invoke;
    block[3] = &unk_1E58432F8;
    block[4] = self;
    v19 = v20;
    v24 = v19;
    v28 = v16;
    id v25 = v14;
    id v26 = v13;
    id v27 = v12;
    dispatch_async(pendingRequestQueue, block);
  }

  return v19;
}

void __91__PHImageIODecoder_decodeImageFromData_orFileURL_options_existingRequestHandle_completion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 24), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__PHImageIODecoder_decodeImageFromData_orFileURL_options_existingRequestHandle_completion___block_invoke_2;
  v5[3] = &unk_1E58432F8;
  id v6 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 72);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v3 = *(id *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v4;
  dispatch_async(v2, v5);
}

intptr_t __91__PHImageIODecoder_decodeImageFromData_orFileURL_options_existingRequestHandle_completion___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) cancelRequested])
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    int v2 = [*(id *)(a1 + 40) shouldLoadGainMap];
    CFTypeRef cf = 0;
    int v12 = 1;
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void **)(a1 + 48);
    v5 = *(void **)(a1 + 56);
    uint64_t v6 = [v3 maximumLongSideLength];
    int v7 = [*(id *)(a1 + 40) optimizeForDrawing];
    id v11 = 0;
    id v8 = _createDecodedImageUsingImageIOWithFileUrlOrData(v3, v4, v5, v6, v7, v2, (uint64_t *)&cf, &v12, &v11);
    id v9 = v11;
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    CGImageRelease(v8);
    if (cf) {
      CFRelease(cf);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 64) + 24));
}

- (id)decodeImageFromData:(id)a3 orFileURL:(id)a4 options:(id)a5 completion:(id)a6
{
  return [(PHImageIODecoder *)self decodeImageFromData:a3 orFileURL:a4 options:a5 existingRequestHandle:0 completion:a6];
}

- (PHImageIODecoder)init
{
  v12.receiver = self;
  v12.super_class = (Class)PHImageIODecoder;
  int v2 = [(PHImageIODecoder *)&v12 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.photos.imgmgr.iodecode.pendingrequests", v3);
    pendingRequestQueue = v2->_pendingRequestQueue;
    v2->_pendingRequestQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.photos.imgmgr.iodecode.activerequests", v6);
    activeRequestQueue = v2->_activeRequestQueue;
    v2->_activeRequestQueue = (OS_dispatch_queue *)v7;

    dispatch_semaphore_t v9 = dispatch_semaphore_create(+[PHImageIODecoder maxConcurrentDecodeCount]);
    concurrentRequestSemaphore = v2->_concurrentRequestSemaphore;
    v2->_concurrentRequestSemaphore = (OS_dispatch_semaphore *)v9;
  }
  return v2;
}

+ (void)setMaxConcurrentDecodeCount:(int64_t)a3
{
  if (a3 <= 1) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = a3;
  }
  sMaxConcurrentDecodeCount = v3;
}

+ (int64_t)maxConcurrentDecodeCount
{
  return sMaxConcurrentDecodeCount;
}

+ (id)sharedDecoder
{
  if (sharedDecoder_s_onceToken != -1) {
    dispatch_once(&sharedDecoder_s_onceToken, &__block_literal_global_7702);
  }
  int v2 = (void *)sharedDecoder_s_shared;

  return v2;
}

void __33__PHImageIODecoder_sharedDecoder__block_invoke()
{
  v0 = objc_alloc_init(PHImageIODecoder);
  v1 = (void *)sharedDecoder_s_shared;
  sharedDecoder_s_shared = (uint64_t)v0;
}

@end