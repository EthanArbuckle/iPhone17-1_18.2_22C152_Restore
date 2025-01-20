@interface MTKTextureLoader
- (BOOL)validateGenerateMipmapsForPixelFormat:(unint64_t)a3 options:(id)a4 error:(id *)a5;
- (MTKTextureLoader)initWithDevice:(id)device;
- (NSArray)newTexturesWithContentsOfURLs:(NSArray *)URLs options:(NSDictionary *)options error:(NSError *)error;
- (id)_newSyncTexturesFromTXRTextures:(id)a3 labels:(id)a4 options:(id)a5 error:(id *)a6;
- (id)device;
- (id)newTextureFromTXRTexture:(id)a3 options:(id)a4 error:(id *)a5;
- (id)newTextureWithCGImage:(CGImageRef)cgImage options:(NSDictionary *)options error:(NSError *)error;
- (id)newTextureWithContentsOfURL:(NSURL *)URL options:(NSDictionary *)options error:(NSError *)error;
- (id)newTextureWithData:(NSData *)data options:(NSDictionary *)options error:(NSError *)error;
- (id)newTextureWithMDLTexture:(MDLTexture *)texture options:(NSDictionary *)options error:(NSError *)error;
- (id)newTextureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor bundle:(NSBundle *)bundle options:(NSDictionary *)options error:(NSError *)error;
- (id)newTextureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor displayGamut:(NSDisplayGamut)displayGamut bundle:(NSBundle *)bundle options:(NSDictionary *)options error:(NSError *)error;
- (id)newTexturesFromTXRTextures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)newUploaderForOptions:(id)a3;
- (unint64_t)_determineFileType:(id)a3;
- (void)_loadCGImage:(CGImage *)a3 options:(id)a4 completionHandler:(id)a5;
- (void)_loadData:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)_loadData:(id)a3 options:(id)a4 uploader:(id)a5 label:(id)a6 completionHandler:(id)a7;
- (void)_loadMDLTexture:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)_newAsyncTextureWithNames:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 bundle:(id)a6 options:(id)a7 completionHandler:(id)a8;
- (void)dealloc;
- (void)newTextureWithCGImage:(CGImageRef)cgImage options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler;
- (void)newTextureWithContentsOfURL:(NSURL *)URL options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler;
- (void)newTextureWithData:(NSData *)data options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler;
- (void)newTextureWithMDLTexture:(MDLTexture *)texture options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler;
- (void)newTextureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor bundle:(NSBundle *)bundle options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler;
- (void)newTextureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor displayGamut:(NSDisplayGamut)displayGamut bundle:(NSBundle *)bundle options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler;
- (void)newTexturesWithContentsOfURLs:(NSArray *)URLs options:(NSDictionary *)options completionHandler:(MTKTextureLoaderArrayCallback)completionHandler;
- (void)newTexturesWithNames:(NSArray *)names scaleFactor:(CGFloat)scaleFactor bundle:(NSBundle *)bundle options:(NSDictionary *)options completionHandler:(MTKTextureLoaderArrayCallback)completionHandler;
- (void)newTexturesWithNames:(NSArray *)names scaleFactor:(CGFloat)scaleFactor displayGamut:(NSDisplayGamut)displayGamut bundle:(NSBundle *)bundle options:(NSDictionary *)options completionHandler:(MTKTextureLoaderArrayCallback)completionHandler;
@end

@implementation MTKTextureLoader

- (void)_loadData:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v9 = [(MTKTextureLoader *)self newUploaderForOptions:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__MTKTextureLoader__loadData_options_completionHandler___block_invoke;
  v10[3] = &unk_2642551F8;
  v10[4] = v9;
  v10[5] = a5;
  [(MTKTextureLoader *)self _loadData:a3 options:a4 uploader:v9 label:0 completionHandler:v10];
}

intptr_t __76__MTKTextureLoader_newTexturesWithContentsOfURLs_options_completionHandler___block_invoke_66(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 32), 0xFFFFFFFFFFFFFFFFLL);
  id v15 = 0;
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:*(void *)(a1 + 40) options:1 error:&v15];
  v3 = v2;
  if (v15)
  {
    if (v2) {

    }
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) lock];
    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = _newMTKTextureErrorWithCodeAndErrorString(0, [NSString stringWithFormat:@"Invalid NSData, %@", objc_msgSend(v15, "localizedDescription")]);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) unlock];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) lastPathComponent];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __76__MTKTextureLoader_newTexturesWithContentsOfURLs_options_completionHandler___block_invoke_2;
    v11[3] = &unk_2642550B8;
    uint64_t v9 = *(void *)(a1 + 88);
    uint64_t v8 = *(void *)(a1 + 96);
    long long v12 = *(_OWORD *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 80);
    uint64_t v14 = v8;
    v11[4] = v3;
    v11[5] = v9;
    [v6 _loadData:v3 options:v4 uploader:v5 label:v7 completionHandler:v11];
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 32));
}

void __76__MTKTextureLoader_newTexturesWithContentsOfURLs_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v16 = (void *)[*(id *)(a1 + 32) newUploaderForOptions:*(void *)(a1 + 40)];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3052000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  uint64_t v46 = 0;
  unint64_t v2 = 0;
  uint64_t v46 = [MEMORY[0x263EFF980] array];
  while (v2 < [*(id *)(a1 + 48) count])
  {
    objc_msgSend((id)v42[5], "addObject:", objc_msgSend(MEMORY[0x263EFF9D0], "null"));
    ++v2;
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3052000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  dispatch_semaphore_t v40 = 0;
  dispatch_semaphore_t v40 = dispatch_semaphore_create(0);
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3052000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  uint64_t v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3052000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  id v28 = objc_alloc_init(MEMORY[0x263F08958]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v3 = *(void **)(a1 + 48);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v47 count:16];
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v8 checkResourceIsReachableAndReturnError:0])
        {
          uint64_t v9 = *(void *)(a1 + 32);
          v10 = *(NSObject **)(v9 + 8);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __76__MTKTextureLoader_newTexturesWithContentsOfURLs_options_completionHandler___block_invoke_66;
          block[3] = &unk_2642550E0;
          block[4] = v9;
          block[5] = v8;
          block[8] = &v23;
          block[9] = &v29;
          block[6] = *(void *)(a1 + 40);
          block[7] = v16;
          block[10] = &v35;
          block[11] = &v41;
          block[12] = v5 + i;
          dispatch_async(v10, block);
        }
        else
        {
          [(id)v24[5] lock];
          if (!v30[5])
          {
            uint64_t v11 = _newMTKTextureErrorWithCodeAndErrorString(0, [NSString stringWithFormat:@"Could not find resource %@ at specified location.", objc_msgSend(v8, "lastPathComponent")]);
            v30[5] = v11;
          }
          [(id)v24[5] unlock];
          dispatch_semaphore_signal((dispatch_semaphore_t)v36[5]);
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v47 count:16];
      v5 += i;
    }
    while (v4);
  }
  for (unint64_t j = 0; ; ++j)
  {
    unint64_t v13 = [*(id *)(a1 + 48) count];
    uint64_t v14 = v36[5];
    if (j >= v13) {
      break;
    }
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  }
  dispatch_release(v14);

  id v15 = (id)v42[5];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __76__MTKTextureLoader_newTexturesWithContentsOfURLs_options_completionHandler___block_invoke_3;
  v17[3] = &unk_264255108;
  v17[4] = *(void *)(a1 + 56);
  v17[5] = &v41;
  v17[6] = &v29;
  [v16 finishWithCompletionHandler:v17];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);
}

- (void)_loadCGImage:(CGImage *)a3 options:(id)a4 completionHandler:(id)a5
{
  id v9 = [(MTKTextureLoader *)self newUploaderForOptions:a4];
  uint64_t v17 = 0;
  v10 = [[MTKTextureLoaderImageIO alloc] initWithCGImage:a3 options:a4 error:&v17];
  if (v10)
  {
    uint64_t v11 = v10;
    if ([(MTKTextureLoader *)self validateGenerateMipmapsForPixelFormat:[(MTKTextureLoaderData *)v10 pixelFormat] options:a4 error:&v17])
    {
      uploadQueue = self->_uploadQueue;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __59__MTKTextureLoader__loadCGImage_options_completionHandler___block_invoke_3;
      v14[3] = &unk_264255130;
      v14[4] = v9;
      v14[5] = v11;
      v14[6] = a4;
      v14[7] = a5;
      unint64_t v13 = v14;
    }
    else
    {

      uploadQueue = self->_notifyQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __59__MTKTextureLoader__loadCGImage_options_completionHandler___block_invoke_2;
      block[3] = &unk_264255220;
      block[4] = v17;
      block[5] = a5;
      unint64_t v13 = block;
    }
  }
  else
  {
    uploadQueue = self->_notifyQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __59__MTKTextureLoader__loadCGImage_options_completionHandler___block_invoke;
    v16[3] = &unk_264255220;
    v16[4] = v17;
    v16[5] = a5;
    unint64_t v13 = v16;
  }
  dispatch_async(uploadQueue, v13);
}

- (id)newUploaderForOptions:(id)a3
{
  int v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"MTKTextureLoaderOptionGenerateMipmaps"), "BOOLValue");
  if ([a3 objectForKey:@"MTKTextureLoaderOptionTextureStorageMode"])
  {
    if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"MTKTextureLoaderOptionTextureStorageMode"), "unsignedIntegerValue") == 2)char v6 = 1; {
    else
    }
      char v6 = v5;
    if (v6) {
      goto LABEL_6;
    }
LABEL_10:
    blitQueue = 0;
    goto LABEL_11;
  }
  if (!v5) {
    goto LABEL_10;
  }
LABEL_6:
  objc_sync_enter(self);
  if (!self->_blitQueue) {
    self->_blitQueue = (MTLCommandQueue *)[(MTLDeviceSPI *)self->_device newCommandQueue];
  }
  objc_sync_exit(self);
  blitQueue = self->_blitQueue;
LABEL_11:
  uint64_t v8 = [MTKTextureUploader alloc];
  device = self->_device;
  notifyQueue = self->_notifyQueue;

  return [(MTKTextureUploader *)v8 initWithDevice:device commandQueue:blitQueue notifyQueue:notifyQueue];
}

void __56__MTKTextureLoader__loadData_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__MTKTextureLoader__loadData_options_completionHandler___block_invoke_2;
  v10[3] = &unk_2642551D0;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v10[5] = a2;
  void v10[6] = v9;
  v10[4] = a3;
  [v8 finishWithCompletionHandler:v10];
}

uint64_t __59__MTKTextureLoader__loadCGImage_options_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) newTextureWithData:*(void *)(a1 + 40) options:*(void *)(a1 + 48) error:&v7];

  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", @"MTKTextureLoaderOptionGenerateMipmaps"), "BOOLValue"))objc_msgSend(*(id *)(a1 + 32), "generateMipmapsForTexture:", v2); {
  v3 = *(void **)(a1 + 32);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__MTKTextureLoader__loadCGImage_options_completionHandler___block_invoke_4;
  v6[3] = &unk_264255248;
  uint64_t v4 = *(void *)(a1 + 56);
  v6[4] = v2;
  v6[5] = v7;
  v6[6] = v4;
  return [v3 finishWithCompletionHandler:v6];
}

void __71__MTKTextureLoader__loadData_options_uploader_label_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = 0;
  uint64_t v2 = (void *)[*(id *)(a1 + 32) newTextureWithData:*(void *)(a1 + 40) options:*(void *)(a1 + 48) error:&v7];
  v3 = v2;
  if (*(void *)(a1 + 56)) {
    objc_msgSend(v2, "setLabel:");
  }

  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", @"MTKTextureLoaderOptionGenerateMipmaps"), "BOOLValue"))objc_msgSend(*(id *)(a1 + 32), "generateMipmapsForTexture:", v3); {
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 64) + 24);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__MTKTextureLoader__loadData_options_uploader_label_completionHandler___block_invoke_4;
  v6[3] = &unk_264255248;
  uint64_t v5 = *(void *)(a1 + 72);
  v6[4] = v3;
  v6[5] = v7;
  v6[6] = v5;
  dispatch_async(v4, v6);
}

- (void)_loadData:(id)a3 options:(id)a4 uploader:(id)a5 label:(id)a6 completionHandler:(id)a7
{
  uint64_t v11 = 0;
  uint64_t v22 = 0;
  unint64_t v12 = -[MTKTextureLoader _determineFileType:](self, "_determineFileType:") - 1;
  if (v12 <= 3) {
    uint64_t v11 = (void *)[objc_alloc(*off_264255300[v12]) initWithData:a3 options:a4 error:&v22];
  }
  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  [v11 pixelFormat];
  MTLPixelFormatGetInfoForDevice();

  uint64_t v13 = v22;
  if (!v22)
  {
    uint64_t v14 = NSString;
    [0 pixelFormat];
    uint64_t v15 = objc_msgSend(v14, "stringWithFormat:", @"Pixel format(%s) is not valid on this device", MTLPixelFormatGetName());
    uint64_t v13 = _newMTKTextureErrorWithCodeAndErrorString(0, v15);
    uint64_t v22 = v13;
  }
  notifyQueue = self->_notifyQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__MTKTextureLoader__loadData_options_uploader_label_completionHandler___block_invoke;
  v17[3] = &unk_264255220;
  v17[4] = v13;
  v17[5] = a7;
  dispatch_async(notifyQueue, v17);
}

- (BOOL)validateGenerateMipmapsForPixelFormat:(unint64_t)a3 options:(id)a4 error:(id *)a5
{
  if (!objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"MTKTextureLoaderOptionGenerateMipmaps"), "BOOLValue"))return 1; {
  MTLPixelFormatGetInfoForDevice();
  }
  BOOL v6 = 0;
  if (a5) {
    *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, @"MTKTextureLoaderOptionGenerateMipmaps is only supported for color renderable and filterable pixel formats");
  }
  return v6;
}

- (unint64_t)_determineFileType:(id)a3
{
  if (+[MTKTextureLoaderKTX isKTXFile:](MTKTextureLoaderKTX, "isKTXFile:")) {
    return 1;
  }
  if (+[MTKTextureLoaderPVR isPVRFile:a3]) {
    return 2;
  }
  if (+[MTKTextureLoaderPVR3 isPVR3File:a3]) {
    return 3;
  }
  return 4;
}

void __71__MTKTextureLoader__loadData_options_uploader_label_completionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  uint64_t v2 = *(void **)(a1 + 40);
}

void __76__MTKTextureLoader_newTexturesWithContentsOfURLs_options_completionHandler___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = *(void **)(*(void *)(a1[5] + 8) + 40);
    objc_sync_enter(v5);
    [*(id *)(*(void *)(a1[5] + 8) + 40) setObject:a2 atIndexedSubscript:a1[9]];
    objc_sync_exit(v5);
  }
  else
  {
    [*(id *)(*(void *)(a1[6] + 8) + 40) lock];
    if (!*(void *)(*(void *)(a1[7] + 8) + 40)) {
      *(void *)(*(void *)(a1[7] + 8) + 40) = a3;
    }
    [*(id *)(*(void *)(a1[6] + 8) + 40) unlock];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[8] + 8) + 40));
  uint64_t v7 = (void *)a1[4];
}

void __56__MTKTextureLoader__loadData_options_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  uint64_t v2 = *(void **)(a1 + 32);
}

intptr_t __53__MTKTextureLoader_newTextureWithData_options_error___block_invoke(void *a1, void *a2, void *a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = a2;
  *(void *)(*(void *)(a1[6] + 8) + 40) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

intptr_t __65__MTKTextureLoader_newTextureWithData_options_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 32), 0xFFFFFFFFFFFFFFFFLL);
  [*(id *)(a1 + 32) _loadData:*(void *)(a1 + 40) options:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);

  return dispatch_semaphore_signal(v2);
}

void __59__MTKTextureLoader__loadCGImage_options_completionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  uint64_t v2 = *(void **)(a1 + 40);
}

intptr_t __56__MTKTextureLoader_newTextureWithCGImage_options_error___block_invoke(void *a1, void *a2, void *a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = a2;
  *(void *)(*(void *)(a1[6] + 8) + 40) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

intptr_t __68__MTKTextureLoader_newTextureWithCGImage_options_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 32), 0xFFFFFFFFFFFFFFFFLL);
  [*(id *)(a1 + 32) _loadCGImage:*(void *)(a1 + 56) options:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  CGImageRelease(*(CGImageRef *)(a1 + 56));
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);

  return dispatch_semaphore_signal(v2);
}

void __76__MTKTextureLoader_newTexturesWithContentsOfURLs_options_completionHandler___block_invoke_3(void *a1)
{
  (*(void (**)(void))(a1[4] + 16))();

  uint64_t v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
}

uint64_t __74__MTKTextureLoader_newTextureWithContentsOfURL_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  [a2 objectAtIndexedSubscript:0];
  objc_opt_class();
  objc_opt_isKindOfClass();
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

intptr_t __62__MTKTextureLoader_newTextureWithContentsOfURL_options_error___block_invoke(void *a1, void *a2, void *a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = a2;
  *(void *)(*(void *)(a1[6] + 8) + 40) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

- (id)newTextureWithCGImage:(CGImageRef)cgImage options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v9 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  uint64_t v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  uint64_t v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__MTKTextureLoader_newTextureWithCGImage_options_error___block_invoke;
  v12[3] = &unk_264255180;
  v12[5] = &v19;
  v12[6] = &v13;
  v12[4] = v9;
  [(MTKTextureLoader *)self newTextureWithCGImage:cgImage options:options completionHandler:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  if (error) {
    *error = (NSError *)(id)v14[5];
  }
  v10 = (void *)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)newTextureWithCGImage:(CGImageRef)cgImage options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler
{
  CGImageRetain(cgImage);
  loadQueue = self->_loadQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__MTKTextureLoader_newTextureWithCGImage_options_completionHandler___block_invoke;
  v10[3] = &unk_264255158;
  v10[4] = self;
  v10[5] = options;
  void v10[6] = completionHandler;
  void v10[7] = cgImage;
  dispatch_async(loadQueue, v10);
}

- (id)newTextureWithContentsOfURL:(NSURL *)URL options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v9 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  uint64_t v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  uint64_t v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__MTKTextureLoader_newTextureWithContentsOfURL_options_error___block_invoke;
  v12[3] = &unk_264255180;
  v12[5] = &v19;
  v12[6] = &v13;
  v12[4] = v9;
  [(MTKTextureLoader *)self newTextureWithContentsOfURL:URL options:options completionHandler:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  if (error) {
    *error = (NSError *)(id)v14[5];
  }
  v10 = (void *)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)newTextureWithContentsOfURL:(NSURL *)URL options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler
{
  v11[1] = *MEMORY[0x263EF8340];
  if (URL)
  {
    v11[0] = URL;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __74__MTKTextureLoader_newTextureWithContentsOfURL_options_completionHandler___block_invoke;
    v10[3] = &unk_264255090;
    v10[4] = completionHandler;
    [(MTKTextureLoader *)self newTexturesWithContentsOfURLs:v8 options:options completionHandler:v10];
  }
  else
  {
    id v9 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, @"URL is nil");
    (*((void (**)(MTKTextureLoaderCallback, void))completionHandler + 2))(completionHandler, 0);
  }
}

- (void)newTexturesWithContentsOfURLs:(NSArray *)URLs options:(NSDictionary *)options completionHandler:(MTKTextureLoaderArrayCallback)completionHandler
{
  loadQueue = self->_loadQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__MTKTextureLoader_newTexturesWithContentsOfURLs_options_completionHandler___block_invoke;
  v6[3] = &unk_264255130;
  v6[4] = self;
  v6[5] = options;
  v6[6] = URLs;
  void v6[7] = completionHandler;
  dispatch_async(loadQueue, v6);
}

- (id)newTextureWithData:(NSData *)data options:(NSDictionary *)options error:(NSError *)error
{
  id v9 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  uint64_t v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  uint64_t v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__MTKTextureLoader_newTextureWithData_options_error___block_invoke;
  v12[3] = &unk_264255180;
  v12[5] = &v19;
  v12[6] = &v13;
  v12[4] = v9;
  [(MTKTextureLoader *)self newTextureWithData:data options:options completionHandler:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  if (error) {
    *error = (NSError *)(id)v14[5];
  }
  v10 = (void *)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)newTextureWithData:(NSData *)data options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler
{
  loadQueue = self->_loadQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__MTKTextureLoader_newTextureWithData_options_completionHandler___block_invoke;
  v6[3] = &unk_264255130;
  v6[4] = self;
  v6[5] = data;
  v6[6] = options;
  void v6[7] = completionHandler;
  dispatch_async(loadQueue, v6);
}

- (void)dealloc
{
  self->_device = 0;
  dispatch_release((dispatch_object_t)self->_notifyQueue);
  self->_notifyQueue = 0;
  dispatch_release((dispatch_object_t)self->_uploadQueue);
  self->_uploadQueue = 0;
  dispatch_release((dispatch_object_t)self->_loadQueue);
  self->_loadQueue = 0;
  dispatch_release((dispatch_object_t)self->_loadSemaphore);
  self->_loadSemaphore = 0;

  self->_blitQueue = 0;
  self->_bufferAllocator = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTKTextureLoader;
  [(MTKTextureLoader *)&v3 dealloc];
}

- (MTKTextureLoader)initWithDevice:(id)device
{
  v11.receiver = self;
  v11.super_class = (Class)MTKTextureLoader;
  id v4 = [(MTKTextureLoader *)&v11 init];
  if (v4)
  {
    *((void *)v4 + 7) = device;
    uint64_t v5 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_UNSPECIFIED, 0);
    initially_inactive = dispatch_queue_attr_make_initially_inactive(v5);
    uint64_t v7 = dispatch_queue_create("com.apple.mtktextureloaderload", initially_inactive);
    *((void *)v4 + 1) = v7;
    dispatch_set_qos_class_floor(v7, QOS_CLASS_DEFAULT, 0);
    dispatch_activate(*((dispatch_object_t *)v4 + 1));
    uint64_t v8 = dispatch_queue_create("com.apple.mtktextureloaderupload", initially_inactive);
    *((void *)v4 + 2) = v8;
    dispatch_set_qos_class_floor(v8, QOS_CLASS_DEFAULT, 0);
    dispatch_activate(*((dispatch_object_t *)v4 + 2));
    id v9 = dispatch_queue_create("com.apple.mtktextureloadernotify", initially_inactive);
    *((void *)v4 + 3) = v9;
    dispatch_set_qos_class_floor(v9, QOS_CLASS_DEFAULT, 0);
    dispatch_activate(*((dispatch_object_t *)v4 + 3));
    *((void *)v4 + 4) = dispatch_semaphore_create(3);
    *((void *)v4 + 5) = 0;
    *((void *)v4 + 6) = [[MTKTextureIOBufferAllocator alloc] initWithDevice:*((void *)v4 + 7)];
  }
  return (MTKTextureLoader *)v4;
}

- (id)device
{
  return self->_device;
}

- (void)newTextureWithMDLTexture:(MDLTexture *)texture options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler
{
  loadQueue = self->_loadQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__MTKTextureLoader_newTextureWithMDLTexture_options_completionHandler___block_invoke;
  v6[3] = &unk_264255130;
  v6[4] = self;
  v6[5] = texture;
  v6[6] = options;
  void v6[7] = completionHandler;
  dispatch_async(loadQueue, v6);
}

intptr_t __71__MTKTextureLoader_newTextureWithMDLTexture_options_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 32), 0xFFFFFFFFFFFFFFFFLL);
  [*(id *)(a1 + 32) _loadMDLTexture:*(void *)(a1 + 40) options:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);

  return dispatch_semaphore_signal(v2);
}

- (NSArray)newTexturesWithContentsOfURLs:(NSArray *)URLs options:(NSDictionary *)options error:(NSError *)error
{
  id v9 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  uint64_t v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  uint64_t v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__MTKTextureLoader_newTexturesWithContentsOfURLs_options_error___block_invoke;
  v12[3] = &unk_2642551A8;
  v12[5] = &v19;
  v12[6] = &v13;
  v12[4] = v9;
  [(MTKTextureLoader *)self newTexturesWithContentsOfURLs:URLs options:options completionHandler:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  if (error) {
    *error = (NSError *)(id)v14[5];
  }
  v10 = (NSArray *)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

intptr_t __64__MTKTextureLoader_newTexturesWithContentsOfURLs_options_error___block_invoke(void *a1, void *a2, void *a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = a2;
  *(void *)(*(void *)(a1[6] + 8) + 40) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

- (id)newTextureWithMDLTexture:(MDLTexture *)texture options:(NSDictionary *)options error:(NSError *)error
{
  id v9 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  uint64_t v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  uint64_t v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__MTKTextureLoader_newTextureWithMDLTexture_options_error___block_invoke;
  v12[3] = &unk_264255180;
  v12[5] = &v19;
  v12[6] = &v13;
  v12[4] = v9;
  [(MTKTextureLoader *)self newTextureWithMDLTexture:texture options:options completionHandler:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  if (error) {
    *error = (NSError *)(id)v14[5];
  }
  v10 = (void *)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

intptr_t __59__MTKTextureLoader_newTextureWithMDLTexture_options_error___block_invoke(void *a1, void *a2, void *a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = a2;
  *(void *)(*(void *)(a1[6] + 8) + 40) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

void __71__MTKTextureLoader__loadData_options_uploader_label_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
}

void __71__MTKTextureLoader__loadData_options_uploader_label_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
}

void __59__MTKTextureLoader__loadCGImage_options_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
}

void __59__MTKTextureLoader__loadCGImage_options_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
}

- (void)_loadMDLTexture:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v9 = [(MTKTextureLoader *)self newUploaderForOptions:a4];
  uint64_t v17 = 0;
  v10 = [[MTKTextureLoaderMDL alloc] initWithMDLTexture:a3 options:a4 error:&v17];
  if (v10)
  {
    objc_super v11 = v10;
    if ([(MTKTextureLoader *)self validateGenerateMipmapsForPixelFormat:[(MTKTextureLoaderData *)v10 pixelFormat] options:a4 error:&v17])
    {
      uploadQueue = self->_uploadQueue;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __62__MTKTextureLoader__loadMDLTexture_options_completionHandler___block_invoke_3;
      v14[3] = &unk_264255130;
      v14[4] = v9;
      v14[5] = v11;
      v14[6] = a4;
      v14[7] = a5;
      uint64_t v13 = v14;
    }
    else
    {

      uploadQueue = self->_notifyQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __62__MTKTextureLoader__loadMDLTexture_options_completionHandler___block_invoke_2;
      block[3] = &unk_264255220;
      block[4] = v17;
      block[5] = a5;
      uint64_t v13 = block;
    }
  }
  else
  {
    uploadQueue = self->_notifyQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __62__MTKTextureLoader__loadMDLTexture_options_completionHandler___block_invoke;
    v16[3] = &unk_264255220;
    v16[4] = v17;
    v16[5] = a5;
    uint64_t v13 = v16;
  }
  dispatch_async(uploadQueue, v13);
}

void __62__MTKTextureLoader__loadMDLTexture_options_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
}

void __62__MTKTextureLoader__loadMDLTexture_options_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
}

uint64_t __62__MTKTextureLoader__loadMDLTexture_options_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) newTextureWithData:*(void *)(a1 + 40) options:*(void *)(a1 + 48) error:&v7];

  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", @"MTKTextureLoaderOptionGenerateMipmaps"), "BOOLValue"))objc_msgSend(*(id *)(a1 + 32), "generateMipmapsForTexture:", v2); {
  objc_super v3 = *(void **)(a1 + 32);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__MTKTextureLoader__loadMDLTexture_options_completionHandler___block_invoke_4;
  v6[3] = &unk_264255248;
  uint64_t v4 = *(void *)(a1 + 56);
  v6[4] = v2;
  v6[5] = v7;
  v6[6] = v4;
  return [v3 finishWithCompletionHandler:v6];
}

void __62__MTKTextureLoader__loadMDLTexture_options_completionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  uint64_t v2 = *(void **)(a1 + 40);
}

- (void)_newAsyncTextureWithNames:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 bundle:(id)a6 options:(id)a7 completionHandler:(id)a8
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v58 = 0;
  uint64_t v14 = [MEMORY[0x263F38378] defaultUICatalogForBundle:a6];
  if (!v14)
  {
    uint64_t v38 = _newMTKTextureErrorWithCodeAndErrorString(0, @"Could not get asset catalog from supplied bundle");
    notifyQueue = self->_notifyQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __104__MTKTextureLoader__newAsyncTextureWithNames_scaleFactor_displayGamut_bundle_options_completionHandler___block_invoke;
    block[3] = &unk_264255220;
    block[4] = v38;
    block[5] = a8;
    uint64_t v37 = block;
    v36 = notifyQueue;
    goto LABEL_32;
  }
  uint64_t v15 = (void *)v14;
  id v40 = a8;
  v42 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a3, "count"));
  obuint64_t j = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v16 = [a3 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (!v16) {
    goto LABEL_21;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v54;
  BOOL v41 = a5 == 2;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v54 != v18) {
        objc_enumerationMutation(a3);
      }
      uint64_t v20 = *(void *)(*((void *)&v53 + 1) + 8 * i);
      uint64_t v21 = [v15 namedTextureWithName:v20 scaleFactor:a4];
      if (v21)
      {
        uint64_t v22 = (void *)v21;
        uint64_t v23 = (void *)MEMORY[0x2166C14B0]();
        uint64_t v24 = (void *)[v22 textureWithBufferAllocator:self->_bufferAllocator];
        id v25 = v24;
        uint64_t v52 = 0;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v49 = 0u;
        [v24 pixelFormat];
        MTLPixelFormatGetInfoForDevice();
        if (objc_msgSend(MEMORY[0x263F7F248], "isGammaEncoded:", objc_msgSend(v24, "pixelFormat"))) {
          uint64_t v26 = 71;
        }
        else {
          uint64_t v26 = 70;
        }
        [v24 reformat:v26 gammaDegamma:1 bufferAllocator:self->_bufferAllocator error:0];
        v27 = v42;
        goto LABEL_14;
      }
      if ([v15 imageExistsWithName:v20 scaleFactor:a4])
      {
        uint64_t v24 = (void *)[v15 imageWithName:v20 scaleFactor:v41 displayGamut:5 layoutDirection:a4];
        if ([v24 image])
        {
          id v28 = v24;
          v27 = obj;
LABEL_14:
          [v27 addObject:v24];
          continue;
        }
      }
      else
      {
        uint64_t v58 = _newMTKTextureErrorWithCodeAndErrorString(0, [NSString stringWithFormat:@"Could not find texture or image named \"%@\" in supplied bundle", v20]);
      }
    }
    uint64_t v17 = [a3 countByEnumeratingWithState:&v53 objects:v60 count:16];
  }
  while (v17);
LABEL_21:
  id v29 = [(MTKTextureLoader *)self _newSyncTexturesFromTXRTextures:v42 labels:a3 options:a7 error:&v58];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v30 = [obj countByEnumeratingWithState:&v45 objects:v59 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v46 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        id v35 = -[MTKTextureLoader newTextureWithCGImage:options:error:](self, "newTextureWithCGImage:options:error:", [v34 image], a7, &v58);

        if (v35) {
          [v29 addObject:v35];
        }
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v45 objects:v59 count:16];
    }
    while (v31);
  }

  v36 = self->_notifyQueue;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __104__MTKTextureLoader__newAsyncTextureWithNames_scaleFactor_displayGamut_bundle_options_completionHandler___block_invoke_2;
  v44[3] = &unk_264255248;
  v44[4] = v29;
  v44[5] = v58;
  v44[6] = v40;
  uint64_t v37 = v44;
LABEL_32:
  dispatch_async(v36, v37);
}

void __104__MTKTextureLoader__newAsyncTextureWithNames_scaleFactor_displayGamut_bundle_options_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __104__MTKTextureLoader__newAsyncTextureWithNames_scaleFactor_displayGamut_bundle_options_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)newTexturesFromTXRTextures:(id)a3 options:(id)a4 error:(id *)a5
{
  [a3 enumerateObjectsUsingBlock:&__block_literal_global];

  return [(MTKTextureLoader *)self _newSyncTexturesFromTXRTextures:a3 labels:0 options:a4 error:a5];
}

- (id)newTextureFromTXRTexture:(id)a3 options:(id)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  v14[0] = a3;
  id v10 = -[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:](self, "_newSyncTexturesFromTXRTextures:labels:options:error:", [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1], 0, a4, a5);
  if (!v10) {
    return 0;
  }
  objc_super v11 = v10;
  if (![v10 count]) {
    return 0;
  }
  uint64_t v12 = (void *)[v11 objectAtIndexedSubscript:0];
  if (v12) {

  }
  return v12;
}

- (id)_newSyncTexturesFromTXRTextures:(id)a3 labels:(id)a4 options:(id)a5 error:(id *)a6
{
  id v8 = a3;
  uint64_t v127 = *MEMORY[0x263EF8340];
  long long v121 = 0uLL;
  uint64_t v122 = 0;
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a3, "count"));
  objc_super v11 = (void *)[(MTLDeviceSPI *)self->_device newCommandQueue];
  [v11 setLabel:@"com.apple.MTKTextureLoader"];
  v77 = v11;
  v76 = (void *)[v11 commandBuffer];
  v94 = (void *)[v76 blitCommandEncoder];
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  uint64_t v12 = [v8 countByEnumeratingWithState:&v117 objects:v126 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v86 = *(void *)v118;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v118 != v86) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void **)(*((void *)&v117 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x263EFF9D0], "null"));
        }
        else
        {
          uint64_t v89 = i;
          id v17 = objc_alloc_init(MEMORY[0x263F12A50]);
          [v16 dimensions];
          [v17 setWidth:v18];
          [v16 dimensions];
          [v17 setHeight:v19];
          [v16 dimensions];
          [v17 setDepth:v20];
          objc_msgSend(v17, "setArrayLength:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "mipmapLevels"), "objectAtIndexedSubscript:", 0), "elements"), "count"));
          if ((unint64_t)[v16 pixelFormat] >> 31) {
            -[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:]();
          }
          objc_msgSend(v17, "setPixelFormat:", objc_msgSend(v16, "pixelFormat"));
          uint64_t v87 = [v17 arrayLength];
          v101 = v16;
          if ([v16 cubemap])
          {
            if ((unint64_t)[v17 arrayLength] < 2)
            {
              uint64_t v22 = 5;
            }
            else
            {
              int v21 = [(MTLDeviceSPI *)self->_device supportsTextureCubeArray];
              if (v21) {
                uint64_t v22 = 6;
              }
              else {
                uint64_t v22 = 5;
              }
              uint64_t v23 = v87;
              if (!v21) {
                uint64_t v23 = 1;
              }
              uint64_t v87 = v23;
              if ((v21 & 1) == 0 && a6)
              {
                *a6 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, @"Attempt to load a cubemap array on platform that does not support cubemap arrays");
                uint64_t v22 = 5;
                uint64_t v87 = 1;
              }
            }
            [v17 setTextureType:v22];
            [v16 dimensions];
            if (v26 != 1) {
              -[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:].cold.4();
            }
            [v16 dimensions];
            int32x4_t v98 = v27;
            [v16 dimensions];
            if ((vmovn_s32(vceqq_s32(v98, vdupq_lane_s32(v28, 1))).u8[0] & 1) == 0) {
              -[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:]();
            }
          }
          else
          {
            [v16 dimensions];
            if (v24 <= 1)
            {
              [v16 dimensions];
              unsigned int v30 = v29;
              unint64_t v31 = [v17 arrayLength];
              if (v30 < 2)
              {
                uint64_t v25 = v31 > 1;
              }
              else if (v31 <= 1)
              {
                uint64_t v25 = 2;
              }
              else
              {
                uint64_t v25 = 3;
              }
            }
            else
            {
              uint64_t v25 = 7;
            }
            [v17 setTextureType:v25];
          }
          if ([a5 objectForKey:@"MTKTextureLoaderOptionTextureStorageMode"]) {
            objc_msgSend(v17, "setStorageMode:", objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"MTKTextureLoaderOptionTextureStorageMode"), "unsignedIntegerValue"));
          }
          if ([a5 objectForKey:@"MTKTextureLoaderOptionTextureUsage"]) {
            objc_msgSend(v17, "setUsage:", objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"MTKTextureLoaderOptionTextureUsage"), "unsignedIntegerValue"));
          }
          if ([a5 objectForKey:@"MTKTextureLoaderOptionTextureCPUCacheMode"]) {
            objc_msgSend(v17, "setCpuCacheMode:", objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"MTKTextureLoaderOptionTextureCPUCacheMode"), "unsignedIntegerValue"));
          }
          if (objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"MTKTextureLoaderOptionAllocateMipmaps"), "BOOLValue"))
          {
            unint64_t v32 = [v17 width];
            unint64_t v33 = [v17 height];
            if (v32 <= v33) {
              unint64_t v34 = v33;
            }
            else {
              unint64_t v34 = v32;
            }
            unint64_t v35 = (unint64_t)(floor(log2((double)v34)) + 1.0);
          }
          else
          {
            unint64_t v35 = objc_msgSend((id)objc_msgSend(v101, "mipmapLevels"), "count");
          }
          [v17 setMipmapLevelCount:v35];
          v36 = (void *)[a5 objectForKeyedSubscript:@"MTKTextureLoaderOptionLoadAsArray"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v36 BOOLValue]) {
            objc_msgSend(v17, "setTextureType:", arrayTextureTypeFromTextureType(objc_msgSend(v17, "textureType")));
          }
          uint64_t v37 = [(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v17];

          if (v37)
          {
            v93 = (void *)v37;
            [v10 addObject:v37];
            [v101 dimensions];
            int8x8_t v99 = v38;
            [v101 dimensions];
            int8x8_t v92 = v39;
            [v101 dimensions];
            unsigned int v97 = v40;
            long long v113 = 0u;
            long long v114 = 0u;
            long long v115 = 0u;
            long long v116 = 0u;
            obuint64_t j = (id)[v101 mipmapLevels];
            uint64_t i = v89;
            uint64_t v79 = [obj countByEnumeratingWithState:&v113 objects:v125 count:16];
            if (v79)
            {
              uint64_t v95 = 0;
              unint64_t v96 = v97;
              int8x8_t v41 = vext_s8(v92, v99, 4uLL);
              v42.i64[0] = v41.u32[0];
              v42.i64[1] = v41.u32[1];
              uint64x2_t v82 = (uint64x2_t)v42;
              uint64_t v43 = *(void *)v114;
              id v73 = a4;
              id v74 = a5;
              id v71 = v8;
              v72 = v10;
              uint64_t v69 = v14;
              v70 = self;
              uint64_t v68 = v13;
              uint64_t v75 = *(void *)v114;
              do
              {
                uint64_t v44 = 0;
                do
                {
                  if (*(void *)v114 != v43)
                  {
                    uint64_t v45 = v44;
                    objc_enumerationMutation(obj);
                    uint64_t v44 = v45;
                  }
                  uint64_t v81 = v44;
                  long long v46 = *(void **)(*((void *)&v113 + 1) + 8 * v44);
                  long long v109 = 0u;
                  long long v110 = 0u;
                  long long v111 = 0u;
                  long long v112 = 0u;
                  id v83 = (id)[v46 elements];
                  long long v47 = v101;
                  uint64_t v84 = [v83 countByEnumeratingWithState:&v109 objects:v124 count:16];
                  if (v84)
                  {
                    uint64_t v100 = 0;
                    uint64_t v85 = *(void *)v110;
                    double v90 = COERCE_DOUBLE(vrev64_s32(vmovn_s64((int64x2_t)v82)));
LABEL_54:
                    uint64_t v48 = 0;
                    while (1)
                    {
                      if (*(void *)v110 != v85) {
                        objc_enumerationMutation(v83);
                      }
                      uint64_t v88 = v48;
                      long long v49 = *(void **)(*((void *)&v109 + 1) + 8 * v48);
                      long long v105 = 0u;
                      long long v106 = 0u;
                      long long v107 = 0u;
                      long long v108 = 0u;
                      id v91 = (id)[v49 faces];
                      uint64_t v50 = [v91 countByEnumeratingWithState:&v105 objects:v123 count:16];
                      if (v50)
                      {
                        uint64_t v51 = v50;
                        uint64_t v52 = 0;
                        uint64_t v53 = *(void *)v106;
                        do
                        {
                          for (uint64_t j = 0; j != v51; ++j)
                          {
                            if (*(void *)v106 != v53) {
                              objc_enumerationMutation(v91);
                            }
                            long long v55 = *(void **)(*((void *)&v105 + 1) + 8 * j);
                            uint64_t v56 = [v55 bytesPerRow];
                            uint64_t v57 = [v55 bytesPerImage];
                            if (!v56) {
                              uint64_t v56 = objc_msgSend(MEMORY[0x263F7F248], "packedMemoryLayoutForFormat:dimensions:", objc_msgSend(v47, "pixelFormat"), v90);
                            }
                            int v58 = [v47 cubemap];
                            [v55 buffer];
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0) {
                              -[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:]();
                            }
                            if (!v57) {
                              uint64_t v57 = v56 * v82.i64[0];
                            }
                            uint64_t v59 = 6;
                            if (!v58) {
                              uint64_t v59 = 1;
                            }
                            uint64_t v60 = v52 + j + v100 * v59;
                            uint64_t v61 = objc_msgSend((id)objc_msgSend(v55, "buffer"), "buffer");
                            uint64_t v62 = [v55 offset];
                            v104[0] = v82.i64[1];
                            v104[1] = v82.i64[0];
                            v104[2] = v96;
                            long long v102 = v121;
                            uint64_t v103 = v122;
                            [v94 copyFromBuffer:v61 sourceOffset:v62 sourceBytesPerRow:v56 sourceBytesPerImage:v57 sourceSize:v104 toTexture:v93 destinationSlice:v60 destinationLevel:v95 destinationOrigin:&v102];
                            long long v47 = v101;
                          }
                          uint64_t v51 = [v91 countByEnumeratingWithState:&v105 objects:v123 count:16];
                          v52 += j;
                        }
                        while (v51);
                      }
                      uint64_t i = v89;
                      if (v87 == 1) {
                        break;
                      }
                      ++v100;
                      uint64_t v48 = v88 + 1;
                      if (v88 + 1 == v84)
                      {
                        uint64_t v84 = [v83 countByEnumeratingWithState:&v109 objects:v124 count:16];
                        if (v84) {
                          goto LABEL_54;
                        }
                        break;
                      }
                    }
                  }
                  int8x16_t v63 = (int8x16_t)vcgtq_u64(v82, (uint64x2_t)vdupq_n_s64(1uLL));
                  uint64x2_t v82 = (uint64x2_t)vsubq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64(v82, 1uLL), v63), (int64x2_t)vmvnq_s8(v63));
                  uint64_t v64 = v96 >> 1;
                  if (v96 <= 1) {
                    uint64_t v64 = 1;
                  }
                  ++v95;
                  unint64_t v96 = v64;
                  uint64_t v44 = v81 + 1;
                  a4 = v73;
                  a5 = v74;
                  id v8 = v71;
                  id v10 = v72;
                  uint64_t v14 = v69;
                  self = v70;
                  uint64_t v13 = v68;
                  uint64_t v43 = v75;
                }
                while (v81 + 1 != v79);
                uint64_t v65 = [obj countByEnumeratingWithState:&v113 objects:v125 count:16];
                uint64_t v43 = v75;
                uint64_t v79 = v65;
              }
              while (v65);
            }

            if (a4)
            {
              uint64_t v66 = [a4 objectAtIndexedSubscript:v14];
              if (v66 != [MEMORY[0x263EFF9D0] null]) {
                objc_msgSend(v93, "setLabel:", objc_msgSend(a4, "objectAtIndexedSubscript:", v14));
              }
            }
            ++v14;
          }
          else
          {
            objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x263EFF9D0], "null"));
            uint64_t i = v89;
          }
        }
      }
      uint64_t v13 = [v8 countByEnumeratingWithState:&v117 objects:v126 count:16];
    }
    while (v13);
  }
  [v94 endEncoding];
  [v76 commit];
  [v76 waitUntilCompleted];

  return v10;
}

- (void)newTexturesWithNames:(NSArray *)names scaleFactor:(CGFloat)scaleFactor bundle:(NSBundle *)bundle options:(NSDictionary *)options completionHandler:(MTKTextureLoaderArrayCallback)completionHandler
{
  loadQueue = self->_loadQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __86__MTKTextureLoader_newTexturesWithNames_scaleFactor_bundle_options_completionHandler___block_invoke;
  v8[3] = &unk_2642552B8;
  v8[4] = self;
  v8[5] = names;
  *(CGFloat *)&v8[9] = scaleFactor;
  v8[6] = bundle;
  v8[7] = options;
  v8[8] = completionHandler;
  dispatch_async(loadQueue, v8);
}

uint64_t __86__MTKTextureLoader_newTexturesWithNames_scaleFactor_bundle_options_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _newAsyncTextureWithNames:*(void *)(a1 + 40) scaleFactor:1 displayGamut:*(void *)(a1 + 48) bundle:*(void *)(a1 + 56) options:*(void *)(a1 + 64) completionHandler:*(double *)(a1 + 72)];
}

- (void)newTexturesWithNames:(NSArray *)names scaleFactor:(CGFloat)scaleFactor displayGamut:(NSDisplayGamut)displayGamut bundle:(NSBundle *)bundle options:(NSDictionary *)options completionHandler:(MTKTextureLoaderArrayCallback)completionHandler
{
  loadQueue = self->_loadQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__MTKTextureLoader_newTexturesWithNames_scaleFactor_displayGamut_bundle_options_completionHandler___block_invoke;
  block[3] = &unk_2642552E0;
  block[4] = self;
  block[5] = names;
  *(CGFloat *)&block[9] = scaleFactor;
  block[10] = displayGamut;
  void block[6] = bundle;
  block[7] = options;
  block[8] = completionHandler;
  dispatch_async(loadQueue, block);
}

uint64_t __99__MTKTextureLoader_newTexturesWithNames_scaleFactor_displayGamut_bundle_options_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _newAsyncTextureWithNames:*(void *)(a1 + 40) scaleFactor:*(void *)(a1 + 80) displayGamut:*(void *)(a1 + 48) bundle:*(void *)(a1 + 56) options:*(void *)(a1 + 64) completionHandler:*(double *)(a1 + 72)];
}

- (void)newTextureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor bundle:(NSBundle *)bundle options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler
{
  v14[1] = *MEMORY[0x263EF8340];
  v14[0] = name;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __84__MTKTextureLoader_newTextureWithName_scaleFactor_bundle_options_completionHandler___block_invoke;
  v13[3] = &unk_264255090;
  v13[4] = completionHandler;
  [(MTKTextureLoader *)self newTexturesWithNames:v12 scaleFactor:bundle bundle:options options:v13 completionHandler:scaleFactor];
}

uint64_t __84__MTKTextureLoader_newTextureWithName_scaleFactor_bundle_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 count] == 1)
  {
    [a2 objectAtIndexedSubscript:0];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

- (void)newTextureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor displayGamut:(NSDisplayGamut)displayGamut bundle:(NSBundle *)bundle options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler
{
  v16[1] = *MEMORY[0x263EF8340];
  v16[0] = name;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __97__MTKTextureLoader_newTextureWithName_scaleFactor_displayGamut_bundle_options_completionHandler___block_invoke;
  v15[3] = &unk_264255090;
  v15[4] = completionHandler;
  [(MTKTextureLoader *)self newTexturesWithNames:v14 scaleFactor:displayGamut displayGamut:bundle bundle:options options:v15 completionHandler:scaleFactor];
}

uint64_t __97__MTKTextureLoader_newTextureWithName_scaleFactor_displayGamut_bundle_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 count] == 1)
  {
    [a2 objectAtIndexedSubscript:0];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

- (id)newTextureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor bundle:(NSBundle *)bundle options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v13 = dispatch_semaphore_create(0);
  uint64_t v23 = 0;
  unsigned int v24 = &v23;
  uint64_t v25 = 0x3052000000;
  int v26 = __Block_byref_object_copy_;
  int32x4_t v27 = __Block_byref_object_dispose_;
  uint64_t v28 = 0;
  uint64_t v17 = 0;
  unsigned int v18 = &v17;
  uint64_t v19 = 0x3052000000;
  unsigned int v20 = __Block_byref_object_copy_;
  int v21 = __Block_byref_object_dispose_;
  uint64_t v22 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __72__MTKTextureLoader_newTextureWithName_scaleFactor_bundle_options_error___block_invoke;
  v16[3] = &unk_264255180;
  v16[5] = &v23;
  void v16[6] = &v17;
  v16[4] = v13;
  [(MTKTextureLoader *)self newTextureWithName:name scaleFactor:bundle bundle:options options:v16 completionHandler:scaleFactor];
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v13);
  if (error) {
    *error = (NSError *)(id)v18[5];
  }
  uint64_t v14 = (void *)v24[5];
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v14;
}

intptr_t __72__MTKTextureLoader_newTextureWithName_scaleFactor_bundle_options_error___block_invoke(void *a1, void *a2, void *a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = a2;
  *(void *)(*(void *)(a1[6] + 8) + 40) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

- (id)newTextureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor displayGamut:(NSDisplayGamut)displayGamut bundle:(NSBundle *)bundle options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v15 = dispatch_semaphore_create(0);
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x3052000000;
  uint64_t v28 = __Block_byref_object_copy_;
  unsigned int v29 = __Block_byref_object_dispose_;
  uint64_t v30 = 0;
  uint64_t v19 = 0;
  unsigned int v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  uint64_t v24 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __85__MTKTextureLoader_newTextureWithName_scaleFactor_displayGamut_bundle_options_error___block_invoke;
  v18[3] = &unk_264255180;
  v18[5] = &v25;
  v18[6] = &v19;
  v18[4] = v15;
  [(MTKTextureLoader *)self newTextureWithName:name scaleFactor:displayGamut displayGamut:bundle bundle:options options:v18 completionHandler:scaleFactor];
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v15);
  if (error) {
    *error = (NSError *)(id)v20[5];
  }
  uint64_t v16 = (void *)v26[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v16;
}

intptr_t __85__MTKTextureLoader_newTextureWithName_scaleFactor_displayGamut_bundle_options_error___block_invoke(void *a1, void *a2, void *a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = a2;
  *(void *)(*(void *)(a1[6] + 8) + 40) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

- (void)_loadData:options:uploader:label:completionHandler:.cold.1()
{
}

- (void)_loadData:options:uploader:label:completionHandler:.cold.2()
{
}

- (void)_newSyncTexturesFromTXRTextures:labels:options:error:.cold.1()
{
}

- (void)_newSyncTexturesFromTXRTextures:labels:options:error:.cold.2()
{
}

- (void)_newSyncTexturesFromTXRTextures:labels:options:error:.cold.3()
{
  __assert_rtn("-[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:]", "MTKTextureLoader.m", 1028, "txrTexture.dimensions.x == txrTexture.dimensions.y");
}

- (void)_newSyncTexturesFromTXRTextures:labels:options:error:.cold.4()
{
  __assert_rtn("-[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:]", "MTKTextureLoader.m", 1027, "1 == txrTexture.dimensions.z");
}

@end