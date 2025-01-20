@interface QLServiceThumbnailRenderer
- (BOOL)_canCreateContextOfSize:(CGSize)a3 forRequest:(id)a4;
- (CGSize)_IOSurfaceSizeFromThumbnailReply:(id)a3;
- (NSXPCConnection)connection;
- (QLFileThumbnailRequest)request;
- (QLServiceThumbnailRenderer)initWithRequest:(id)a3 reply:(id)a4 connection:(id)a5 completionHandler:(id)a6;
- (QLThumbnailReply)reply;
- (id)_drawInContextOfSize:(CGSize)a3 colorSpace:(CGColorSpace *)a4 error:(id *)a5 drawingBlock:(id)a6;
- (id)_thumbnailDataDestructionConcurrenQueue;
- (id)completionHandler;
- (id)protocolHostWithErrorHandler:(id)a3;
- (void)_afterGeneratingIOSurfaceThumbnail:(BOOL)a3 surface:(id)a4;
- (void)_drawInCurrentContextOfSize:(CGSize)a3 colorSpace:(CGColorSpace *)a4 drawingBlock:(id)a5;
- (void)_drawInIOSurface;
- (void)_drawMultipleImages;
- (void)_drawWithRendererBlock;
- (void)_finishWithSuccess:(BOOL)a3 error:(id)a4;
- (void)generateThumbnailAndPerformCompletionHandler;
- (void)setCompletionHandler:(id)a3;
- (void)setConnection:(id)a3;
- (void)setReply:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation QLServiceThumbnailRenderer

- (QLServiceThumbnailRenderer)initWithRequest:(id)a3 reply:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)QLServiceThumbnailRenderer;
  v15 = [(QLServiceThumbnailRenderer *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_request, a3);
    objc_storeStrong((id *)&v16->_reply, a4);
    v17 = _Block_copy(v14);
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v17;

    objc_storeStrong((id *)&v16->_connection, a5);
    v19 = v16;
  }

  return v16;
}

- (void)generateThumbnailAndPerformCompletionHandler
{
  v28[1] = *MEMORY[0x1E4F143B8];
  reply = self->_reply;
  if (reply)
  {
    switch([(QLThumbnailReply *)reply type])
    {
      case 0uLL:
        [(QLThumbnailReply *)self->_reply contextSize];
        double v5 = v4;
        double v7 = v6;
        v8 = [(QLThumbnailReply *)self->_reply colorSpace];
        id v27 = 0;
        v9 = [(QLThumbnailReply *)self->_reply drawInContextBlock];
        v10 = -[QLServiceThumbnailRenderer _drawInContextOfSize:colorSpace:error:drawingBlock:](self, "_drawInContextOfSize:colorSpace:error:drawingBlock:", v8, &v27, v9, v5, v7);
        id v11 = v27;

        if (v10)
        {
          v28[0] = v10;
          id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
          [(QLThumbnailReply *)self->_reply setBitmapImages:v12];

          id v13 = self;
          uint64_t v14 = 1;
          id v15 = 0;
        }
        else
        {
          id v13 = self;
          uint64_t v14 = 0;
          id v15 = v11;
        }
        [(QLServiceThumbnailRenderer *)v13 _finishWithSuccess:v14 error:v15];

        return;
      case 1uLL:
        v16 = self;
        v17 = [(QLServiceThumbnailRenderer *)v16 reply];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __74__QLServiceThumbnailRenderer_generateThumbnailAndPerformCompletionHandler__block_invoke;
        v24[3] = &unk_1E6009870;
        v25 = v16;
        id v26 = v17;
        id v18 = v17;
        v19 = v16;
        QLTRunInMainThreadAsync(v24);

        goto LABEL_19;
      case 3uLL:
        [(QLServiceThumbnailRenderer *)self _finishWithSuccess:1 error:0];
        return;
      case 4uLL:
        [(QLServiceThumbnailRenderer *)self _drawInIOSurface];
        return;
      case 5uLL:
        [(QLServiceThumbnailRenderer *)self _drawMultipleImages];
        return;
      case 6uLL:
        v20 = self;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __74__QLServiceThumbnailRenderer_generateThumbnailAndPerformCompletionHandler__block_invoke_2;
        v22[3] = &unk_1E6009C28;
        v23 = v20;
        v19 = v20;
        QLTRunInMainThreadAsync(v22);

LABEL_19:
        break;
      default:
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.quicklook.QLThumbnailServiceContextGenerator" code:0 userInfo:0];
    -[QLServiceThumbnailRenderer _finishWithSuccess:error:](self, "_finishWithSuccess:error:", 0);
  }
}

void __74__QLServiceThumbnailRenderer_generateThumbnailAndPerformCompletionHandler__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) contextSize];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [*(id *)(a1 + 40) colorSpace];
  id v8 = [*(id *)(a1 + 40) drawingBlock];
  objc_msgSend(v2, "_drawInCurrentContextOfSize:colorSpace:drawingBlock:", v7, v8, v4, v6);
}

uint64_t __74__QLServiceThumbnailRenderer_generateThumbnailAndPerformCompletionHandler__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _drawWithRendererBlock];
}

- (id)_drawInContextOfSize:(CGSize)a3 colorSpace:(CGColorSpace *)a4 error:(id *)a5 drawingBlock:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v11 = (uint64_t (**)(id, CGContext *))a6;
  if (v11)
  {
    if (!-[QLServiceThumbnailRenderer _canCreateContextOfSize:forRequest:](self, "_canCreateContextOfSize:forRequest:", self->_request, width, height))
    {
      v20 = _log_2();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        [(QLFileThumbnailRequest *)self->_request maximumSize];
        uint64_t v41 = v40;
        [(QLFileThumbnailRequest *)self->_request maximumSize];
        uint64_t v43 = v42;
        [(QLFileThumbnailRequest *)self->_request minimumSize];
        uint64_t v45 = v44;
        [(QLFileThumbnailRequest *)self->_request minimumSize];
        *(_DWORD *)v47 = 134219264;
        *(double *)&v47[4] = width;
        __int16 v48 = 2048;
        double v49 = height;
        __int16 v50 = 2048;
        uint64_t v51 = v41;
        __int16 v52 = 2048;
        uint64_t v53 = v43;
        __int16 v54 = 2048;
        uint64_t v55 = v45;
        __int16 v56 = 2048;
        uint64_t v57 = v46;
        _os_log_error_impl(&dword_1B281E000, v20, OS_LOG_TYPE_ERROR, "Could not draw thumbnail from QLThumbnailReply because the requested context size is invalid (received: (%f, %f), maximum size is: (%f, %f), minimum size is: (%f, %f)). The maximum supported thumbnail size is 1284 * 2778", v47, 0x3Eu);
      }

      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = 2;
      goto LABEL_21;
    }
    *(void *)v47 = 0;
    if (a4 && CGColorSpaceSupportsOutput(a4)) {
      CFRetain(a4);
    }
    else {
      a4 = QLCreateColorSpaceForThumbnailExtension();
    }
    [(QLFileThumbnailRequest *)self->_request scale];
    v24 = QLTCreateCGContextWithSize(a4, 1, (size_t *)v47, width, height, v23);
    CFRelease(a4);
    if (!v24)
    {
      v31 = _log_2();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[QLServiceThumbnailRenderer _drawInContextOfSize:colorSpace:error:drawingBlock:](v31, v32, v33, v34, v35, v36, v37, v38);
      }

      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = 1;
      goto LABEL_21;
    }
    if (v11[2](v11, v24))
    {
      id v25 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      Data = CGBitmapContextGetData(v24);
      size_t BytesPerRow = CGBitmapContextGetBytesPerRow(v24);
      v28 = (void *)[v25 initWithBytesNoCopy:Data length:CGBitmapContextGetHeight(v24) * BytesPerRow deallocator:*MEMORY[0x1E4F28210]];
      v29 = [[QLTBitmapFormat alloc] initWithBitmapContext:v24];
      CGContextRelease(v24);
      v30 = objc_opt_new();
      [v30 setFormat:v29];
      [v30 setData:v28];

      goto LABEL_22;
    }
    CGContextRelease(v24);
  }
  else
  {
    id v12 = _log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[QLServiceThumbnailRenderer _drawInContextOfSize:colorSpace:error:drawingBlock:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  id v21 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v22 = 0;
LABEL_21:
  [v21 errorWithDomain:@"com.apple.quicklook.QLThumbnailServiceContextGenerator" code:v22 userInfo:0];
  v30 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v30;
}

- (void)_drawInCurrentContextOfSize:(CGSize)a3 colorSpace:(CGColorSpace *)a4 drawingBlock:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  v28[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  v10 = v9;
  if (v9)
  {
    id v27 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __82__QLServiceThumbnailRenderer__drawInCurrentContextOfSize_colorSpace_drawingBlock___block_invoke;
    v25[3] = &unk_1E600A328;
    v25[4] = self;
    id v26 = v9;
    id v11 = -[QLServiceThumbnailRenderer _drawInContextOfSize:colorSpace:error:drawingBlock:](self, "_drawInContextOfSize:colorSpace:error:drawingBlock:", a4, &v27, v25, width, height);
    id v12 = v27;
    if (v11)
    {
      v28[0] = v11;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      [(QLThumbnailReply *)self->_reply setBitmapImages:v13];

      uint64_t v14 = self;
      uint64_t v15 = 1;
      id v16 = 0;
    }
    else
    {
      uint64_t v14 = self;
      uint64_t v15 = 0;
      id v16 = v12;
    }
    [(QLServiceThumbnailRenderer *)v14 _finishWithSuccess:v15 error:v16];
  }
  else
  {
    uint64_t v17 = _log_2();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[QLServiceThumbnailRenderer _drawInContextOfSize:colorSpace:error:drawingBlock:](v17, v18, v19, v20, v21, v22, v23, v24);
    }

    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.quicklook.QLThumbnailServiceContextGenerator" code:0 userInfo:0];
    [(QLServiceThumbnailRenderer *)self _finishWithSuccess:0 error:v12];
  }
}

uint64_t __82__QLServiceThumbnailRenderer__drawInCurrentContextOfSize_colorSpace_drawingBlock___block_invoke(uint64_t a1, CGContextRef context)
{
  size_t Height = CGBitmapContextGetHeight(context);
  CGContextTranslateCTM(context, 0.0, (double)Height);
  double v5 = [*(id *)(a1 + 32) request];
  [v5 scale];
  CGFloat v7 = v6;
  id v8 = [*(id *)(a1 + 32) request];
  [v8 scale];
  CGContextScaleCTM(context, v7, -v9);

  CGContextGetCTM(&v12, context);
  CGContextSetBaseCTM();
  _UIGraphicsPushContext((uint64_t)context);
  uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  _UIGraphicsPopContext();
  return v10;
}

- (id)protocolHostWithErrorHandler:(id)a3
{
  id v4 = a3;
  double v5 = [(QLServiceThumbnailRenderer *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__QLServiceThumbnailRenderer_protocolHostWithErrorHandler___block_invoke;
  v9[3] = &unk_1E6009F78;
  id v10 = v4;
  id v6 = v4;
  CGFloat v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __59__QLServiceThumbnailRenderer_protocolHostWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _log_2();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__QLServiceThumbnailRenderer_protocolHostWithErrorHandler___block_invoke_cold_1(v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)_drawInIOSurface
{
  [(QLServiceThumbnailRenderer *)self _IOSurfaceSizeFromThumbnailReply:self->_reply];
  double v4 = v3;
  double v6 = v5;
  connection = self->_connection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke;
  v10[3] = &unk_1E6009CF0;
  v10[4] = self;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke_8;
  v9[3] = &unk_1E600A378;
  void v9[4] = self;
  objc_msgSend(v8, "ioSurfaceWithSize:completionHandler:", v9, v4, v6);
}

void __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = _log_2();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke_cold_1((uint64_t)v3, v4);
  }

  [*(id *)(a1 + 32) _finishWithSuccess:0 error:v3];
}

void __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    CGFloat v7 = [*(id *)(a1 + 32) reply];
    id v8 = [v7 ioSurfaceAsyncBlock];

    double v9 = [*(id *)(a1 + 32) reply];
    id v10 = v9;
    if (v8)
    {
      id v11 = [v9 ioSurfaceAsyncBlock];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke_9;
      v15[3] = &unk_1E600A350;
      v15[4] = *(void *)(a1 + 32);
      id v16 = v5;
      ((void (**)(void, id, void *))v11)[2](v11, v16, v15);
    }
    else
    {
      uint64_t v13 = [v9 ioSurfaceBlock];
      uint64_t v14 = ((uint64_t (**)(void, id))v13)[2](v13, v5);

      [*(id *)(a1 + 32) _afterGeneratingIOSurfaceThumbnail:v14 surface:v5];
    }
  }
  else
  {
    CGAffineTransform v12 = _log_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke_8_cold_1(a1, (uint64_t)v6, v12);
    }

    [*(id *)(a1 + 32) _finishWithSuccess:0 error:v6];
  }
}

uint64_t __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke_9(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _afterGeneratingIOSurfaceThumbnail:a2 surface:*(void *)(a1 + 40)];
}

- (void)_afterGeneratingIOSurfaceThumbnail:(BOOL)a3 surface:(id)a4
{
  BOOL v4 = a3;
  if (a3) {
    [(QLThumbnailReply *)self->_reply setIoSurface:a4];
  }

  [(QLServiceThumbnailRenderer *)self _finishWithSuccess:v4 error:0];
}

- (CGSize)_IOSurfaceSizeFromThumbnailReply:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  request = self->_request;
  id v4 = a3;
  [(QLFileThumbnailRequest *)request scale];
  double v6 = v5;
  [v4 contextSize];
  double v8 = v7;
  double v10 = v9;

  double v11 = v6 * v8;
  double v12 = round(v6 * v8 * 1000.0) / 1000.0;
  double v13 = v6 * v10;
  double v14 = round(v6 * v10 * 1000.0) / 1000.0;
  double v15 = ceil(v14);
  if (ceil(v12) != v12 || v15 != v14)
  {
    uint64_t v17 = _log_2();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      int v18 = 134218752;
      double v19 = v12;
      __int16 v20 = 2048;
      double v21 = v14;
      __int16 v22 = 2048;
      double v23 = v8;
      __int16 v24 = 2048;
      double v25 = v10;
      _os_log_fault_impl(&dword_1B281E000, v17, OS_LOG_TYPE_FAULT, "Requested scaled IOSurface context size of non-integer pixel width or height (%f, %f). Will ceil requested size values (%f, %f)", (uint8_t *)&v18, 0x2Au);
    }

    double v11 = v6 * round(v8);
    double v13 = v6 * round(v10);
  }
  result.double height = v13;
  result.double width = v11;
  return result;
}

- (void)_drawMultipleImages
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(QLServiceThumbnailRenderer *)self reply];
  double v5 = [v4 images];
  double v6 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  [(QLFileThumbnailRequest *)self->_request scale];
  uint64_t v8 = v7;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v9 = [(QLServiceThumbnailRenderer *)self reply];
  double v10 = [v9 images];

  id obj = v10;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = 0;
    uint64_t v14 = *(void *)v27;
    while (2)
    {
      uint64_t v15 = 0;
      id v16 = v13;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(CGImage **)(*((void *)&v26 + 1) + 8 * v15);
        double Width = (double)CGImageGetWidth(v17);
        double Height = (double)CGImageGetHeight(v17);
        CGColorSpaceRef ColorSpace = CGImageGetColorSpace(v17);
        v24[7] = v17;
        id v25 = v16;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __49__QLServiceThumbnailRenderer__drawMultipleImages__block_invoke;
        v24[3] = &__block_descriptor_64_e20_B16__0__CGContext__8l;
        void v24[4] = v8;
        *(double *)&v24[5] = Width;
        *(double *)&v24[6] = Height;
        double v21 = -[QLServiceThumbnailRenderer _drawInContextOfSize:colorSpace:error:drawingBlock:](self, "_drawInContextOfSize:colorSpace:error:drawingBlock:", ColorSpace, &v25, v24, Width, Height);
        id v13 = v25;

        if (!v21)
        {
          [(QLServiceThumbnailRenderer *)self _finishWithSuccess:0 error:v13];
          goto LABEL_11;
        }
        [v6 addObject:v21];

        ++v15;
        id v16 = v13;
      }
      while (v12 != v15);
      uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v12) {
        continue;
      }
      break;
    }
LABEL_11:
  }
  __int16 v22 = [(QLServiceThumbnailRenderer *)self reply];
  [v22 setBitmapImages:v6];

  [(QLServiceThumbnailRenderer *)self _finishWithSuccess:1 error:0];
}

uint64_t __49__QLServiceThumbnailRenderer__drawMultipleImages__block_invoke(uint64_t a1, CGContextRef c)
{
  CGContextScaleCTM(c, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 32));
  v5.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
  v5.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
  v5.size.double width = *(CGFloat *)(a1 + 40);
  v5.size.double height = *(CGFloat *)(a1 + 48);
  CGContextDrawImage(c, v5, *(CGImageRef *)(a1 + 56));
  return 1;
}

- (void)_drawWithRendererBlock
{
  v20[1] = *MEMORY[0x1E4F143B8];
  [(QLFileThumbnailRequest *)self->_request scale];
  uint64_t v4 = v3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  CGRect v5 = [(QLThumbnailReply *)self->_reply rendererBlock];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__QLServiceThumbnailRenderer__drawWithRendererBlock__block_invoke;
  v15[3] = &unk_1E600A3C0;
  v15[4] = &v16;
  void v15[5] = v4;
  ((void (**)(void, void *))v5)[2](v5, v15);

  id v6 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  Data = CGBitmapContextGetData((CGContextRef)v17[3]);
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow((CGContextRef)v17[3]);
  double v9 = (void *)[v6 initWithBytesNoCopy:Data length:CGBitmapContextGetHeight((CGContextRef)v17[3]) * BytesPerRow deallocator:*MEMORY[0x1E4F28210]];
  double v10 = [QLTBitmapFormat alloc];
  uint64_t v11 = [(QLTBitmapFormat *)v10 initWithBitmapContext:v17[3]];
  CGContextRelease((CGContextRef)v17[3]);
  uint64_t v12 = objc_opt_new();
  [v12 setFormat:v11];
  [v12 setData:v9];
  v20[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  uint64_t v14 = [(QLServiceThumbnailRenderer *)self reply];
  [v14 setBitmapImages:v13];

  [(QLServiceThumbnailRenderer *)self _finishWithSuccess:1 error:0];
  _Block_object_dispose(&v16, 8);
}

uint64_t __52__QLServiceThumbnailRenderer__drawWithRendererBlock__block_invoke(uint64_t a1, double a2, double a3)
{
  id v6 = QLCreateColorSpaceForThumbnailExtension();
  size_t v8 = 0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = QLTCreateCGContextWithSize(v6, 1, &v8, a2, a3, *(double *)(a1 + 40));
  CFRelease(v6);
  CGContextScaleCTM(*(CGContextRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (void)_finishWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(QLFileThumbnailRequest *)v6->_request item];
  [v7 cleanup];

  id completionHandler = (void (**)(id, QLThumbnailReply *, void))v6->_completionHandler;
  if (completionHandler)
  {
    if (v4)
    {
      completionHandler[2](v6->_completionHandler, v6->_reply, 0);
    }
    else
    {
      double v9 = v11;
      if (!v11)
      {
        double v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QLThumbnailErrorDomain" code:0 userInfo:0];
      }
      ((void (**)(id, QLThumbnailReply *, void *))completionHandler)[2](completionHandler, 0, v9);
      if (!v11) {
    }
      }
    id v10 = v6->_completionHandler;
    v6->_id completionHandler = 0;
  }
  objc_sync_exit(v6);
}

- (BOOL)_canCreateContextOfSize:(CGSize)a3 forRequest:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  uint64_t v7 = v6;
  BOOL v8 = 0;
  if (width > 0.0 && height > 0.0)
  {
    [v6 maximumSize];
    if (width <= v9 + 1.0
      && ([v7 maximumSize], height <= v10 + 1.0)
      && ([v7 minimumSize], width >= v11 + -1.0)
      && ([v7 minimumSize], height >= v12 + -1.0))
    {
      [v7 scale];
      double v15 = width * height * v14;
      [v7 scale];
      BOOL v8 = v15 * v16 < 3566952.0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)_thumbnailDataDestructionConcurrenQueue
{
  if (_thumbnailDataDestructionConcurrenQueue_onceToken != -1) {
    dispatch_once(&_thumbnailDataDestructionConcurrenQueue_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)_thumbnailDataDestructionConcurrenQueue__thumbnailDataDestructionConcurrenQueue;

  return v2;
}

uint64_t __69__QLServiceThumbnailRenderer__thumbnailDataDestructionConcurrenQueue__block_invoke()
{
  _thumbnailDataDestructionConcurrenQueue__thumbnailDataDestructionConcurrenQueue = (uint64_t)dispatch_queue_create("com.apple.quicklook.thumbnailrenderer.datadestruction", MEMORY[0x1E4F14430]);

  return MEMORY[0x1F41817F8]();
}

- (QLFileThumbnailRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (QLThumbnailReply)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_reply, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)_drawInContextOfSize:(uint64_t)a3 colorSpace:(uint64_t)a4 error:(uint64_t)a5 drawingBlock:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_drawInContextOfSize:(uint64_t)a3 colorSpace:(uint64_t)a4 error:(uint64_t)a5 drawingBlock:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__QLServiceThumbnailRenderer_protocolHostWithErrorHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  CGRect v5 = v3;
  _os_log_error_impl(&dword_1B281E000, a2, OS_LOG_TYPE_ERROR, "Error while calling host: %@", (uint8_t *)&v4, 0xCu);
}

void __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B281E000, a2, OS_LOG_TYPE_ERROR, "Host connection error: %@", (uint8_t *)&v2, 0xCu);
}

void __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke_8_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CGRect v5 = [*(id *)(a1 + 32) request];
  uint64_t v6 = [v5 fileURL];
  int v7 = 138412546;
  BOOL v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1B281E000, a3, OS_LOG_TYPE_ERROR, "Could not draw thumbnail because received nil IOSurface for request %@. Error: %@", (uint8_t *)&v7, 0x16u);
}

@end