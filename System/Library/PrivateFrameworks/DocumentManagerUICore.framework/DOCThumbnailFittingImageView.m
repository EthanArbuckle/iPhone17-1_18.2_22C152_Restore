@interface DOCThumbnailFittingImageView
- (DOCNode)node;
- (DOCThumbnailFittingImageView)initWithCoder:(id)a3;
- (DOCThumbnailFittingImageView)initWithSize:(CGSize)a3 node:(id)a4;
- (DOCThumbnailFittingImageView)initWithSize:(CGSize)a3 url:(id)a4;
- (NSURL)url;
- (int64_t)generatorGeneration;
- (void)didMoveToWindow;
- (void)doc_commonInitWithSize:(CGSize)a3;
- (void)setGeneratorGeneration:(int64_t)a3;
- (void)updateThumbnail;
- (void)updateThumbnailForNode:(id)a3;
- (void)updateThumbnailForURL:(id)a3;
@end

@implementation DOCThumbnailFittingImageView

- (DOCThumbnailFittingImageView)initWithSize:(CGSize)a3 node:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DOCThumbnailFittingImageView;
  v9 = -[DOCFittingImageView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_node, a4);
    -[DOCThumbnailFittingImageView doc_commonInitWithSize:](v10, "doc_commonInitWithSize:", width, height);
  }

  return v10;
}

- (DOCThumbnailFittingImageView)initWithSize:(CGSize)a3 url:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DOCThumbnailFittingImageView;
  v9 = -[DOCFittingImageView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a4);
    -[DOCThumbnailFittingImageView doc_commonInitWithSize:](v10, "doc_commonInitWithSize:", width, height);
  }

  return v10;
}

- (void)doc_commonInitWithSize:(CGSize)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  -[DOCBorderedFittingImageView setFittingSize:](self, "setFittingSize:", a3.width, a3.height);
  [(DOCThumbnailFittingImageView *)self setAccessibilityIgnoresInvertColors:1];
  v4 = self;
  v8[0] = v4;
  v5 = self;
  v8[1] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  id v7 = (id)[(DOCThumbnailFittingImageView *)self registerForTraitChanges:v6 withAction:sel_updateThumbnail];
}

- (DOCThumbnailFittingImageView)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F08690] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"DOCStackedThumbnailView.m" lineNumber:65 description:@"initWithCoder: is not supported"];

  abort();
}

- (void)updateThumbnail
{
  id v6 = [(DOCThumbnailFittingImageView *)self traitCollection];
  [v6 displayScale];
  if (v3 <= 0.0)
  {
  }
  else
  {
    v4 = [(DOCThumbnailFittingImageView *)self traitCollection];
    uint64_t v5 = [v4 userInterfaceStyle];

    if (v5)
    {
      if (self->_node)
      {
        -[DOCThumbnailFittingImageView updateThumbnailForNode:](self, "updateThumbnailForNode:");
      }
      else if (self->_url)
      {
        -[DOCThumbnailFittingImageView updateThumbnailForURL:](self, "updateThumbnailForURL:");
      }
    }
  }
}

- (void)updateThumbnailForNode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DOCThumbnailFittingImageView *)self traitCollection];
  BOOL v6 = [v5 userInterfaceStyle] != 2;

  id v16 = +[DOCThumbnailGenerator sharedGenerator];
  id v7 = [DOCThumbnailDescriptor alloc];
  [(DOCFittingImageView *)self fittingSize];
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = [(DOCThumbnailFittingImageView *)self traitCollection];
  [v12 displayScale];
  v14 = -[DOCThumbnailDescriptor initWithSize:scale:style:isFolded:isInteractive:isFolder:](v7, "initWithSize:scale:style:isFolded:isInteractive:isFolder:", v6, 0, 0, [v4 isFolder], v9, v11, v13);

  v15 = [v16 thumbnailForNode:v4 descriptor:v14];
  LODWORD(v12) = [v4 isFolder];

  [(DOCBorderedFittingImageView *)self updateImage:v15 addDecoration:v12 ^ 1];
}

- (void)updateThumbnailForURL:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  v33[1] = (id)MEMORY[0x263EF8330];
  v33[2] = (id)3221225472;
  v33[3] = __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke;
  v33[4] = &unk_2646747B8;
  objc_copyWeak(&v34, &location);
  v33[5] = v35;
  DOCRunInMainThread();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_2;
  block[3] = &unk_2646747E0;
  objc_copyWeak(v33, &location);
  v32 = v35;
  block[4] = self;
  id v5 = v4;
  id v31 = v5;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  char v7 = [v5 startAccessingSecurityScopedResource];
  double v8 = [MEMORY[0x263F160D0] sharedGenerator];
  id v9 = objc_alloc(MEMORY[0x263F160C8]);
  [(DOCFittingImageView *)self fittingSize];
  double v11 = v10;
  double v13 = v12;
  v14 = [(DOCThumbnailFittingImageView *)self traitCollection];
  [v14 displayScale];
  id v16 = objc_msgSend(v9, "initWithFileAtURL:size:scale:representationTypes:", v5, -1, v11, v13, v15);

  [v16 setBadgeType:0];
  v17 = [MEMORY[0x263F3AB90] useBlastDoorThumbnails];
  objc_msgSend(v16, "setShouldUseRestrictedExtension:", objc_msgSend(v17, "isEnabled"));

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_3;
  v24[3] = &unk_264674830;
  objc_copyWeak(&v28, &location);
  v27 = v35;
  id v18 = v5;
  id v25 = v18;
  id v19 = v6;
  id v26 = v19;
  char v29 = v7;
  [v8 generateBestRepresentationForRequest:v16 completionHandler:v24];
  dispatch_time_t v20 = dispatch_time(0, 100000000);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_16;
  v22[3] = &unk_264674858;
  id v23 = v19;
  id v21 = v19;
  dispatch_after(v20, MEMORY[0x263EF83A0], v22);

  objc_destroyWeak(&v28);
  objc_destroyWeak(v33);
  objc_destroyWeak(&v34);
  _Block_object_dispose(v35, 8);
  objc_destroyWeak(&location);
}

void __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [WeakRetained generatorGeneration] + 1;
    [v3 setGeneratorGeneration:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
    id WeakRetained = v3;
  }
}

void __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v4 == [WeakRetained generatorGeneration])
    {
      id v5 = [*(id *)(a1 + 32) traitCollection];
      uint64_t v6 = [v5 userInterfaceStyle];

      int v7 = [*(id *)(a1 + 40) startAccessingSecurityScopedResource];
      double v8 = *(void **)(a1 + 40);
      id v22 = 0;
      int v9 = [v8 getPromisedItemResourceValue:&v22 forKey:*MEMORY[0x263EFF608] error:0];
      id v10 = v22;
      if (v9)
      {
        BOOL v11 = v6 != 2;
        double v12 = +[DOCThumbnailGenerator sharedGenerator];
        double v13 = [DOCThumbnailDescriptor alloc];
        [v3 fittingSize];
        double v15 = v14;
        double v17 = v16;
        id v18 = [v3 traitCollection];
        [v18 displayScale];
        dispatch_time_t v20 = -[DOCThumbnailDescriptor initWithSize:scale:style:isFolded:isInteractive:isFolder:](v13, "initWithSize:scale:style:isFolded:isInteractive:isFolder:", v11, 1, 0, v10 == (id)*MEMORY[0x263F1DAB0], v15, v17, v19);

        id v21 = [v12 iconForURL:*(void *)(a1 + 40) descriptor:v20];
        [v3 setThumbnail:v21];
      }
      if (v7) {
        [*(id *)(a1 + 40) stopAccessingSecurityScopedResource];
      }
    }
  }
}

void __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  double v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v10 = v5;
    id v11 = v6;
    id v12 = a1[4];
    id v13 = a1[5];
    DOCRunInMainThread();
  }
}

void __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v2 == [*(id *)(a1 + 32) generatorGeneration])
  {
    id v3 = [*(id *)(a1 + 40) UIImage];
    if (v3)
    {
      dispatch_block_cancel(*(dispatch_block_t *)(a1 + 64));
      [*(id *)(a1 + 32) setThumbnail:0];
      [*(id *)(a1 + 32) setImage:v3];
      uint64_t v4 = *(void **)(a1 + 56);
      id v10 = 0;
      int v5 = [v4 getPromisedItemResourceValue:&v10 forKey:*MEMORY[0x263EFF608] error:0];
      id v6 = v10;
      int v7 = v6;
      if (v5) {
        objc_msgSend(*(id *)(a1 + 32), "setAddDecoration:", objc_msgSend(v6, "isEqual:", *MEMORY[0x263F1DAB0]) ^ 1);
      }
    }
    else
    {
      double v8 = (NSObject **)MEMORY[0x263F3AC88];
      id v9 = *MEMORY[0x263F3AC88];
      if (!*MEMORY[0x263F3AC88])
      {
        DOCInitLogging();
        id v9 = *v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_4_cold_1(a1, v9);
      }
    }
  }
  if (*(unsigned char *)(a1 + 80)) {
    [*(id *)(a1 + 56) stopAccessingSecurityScopedResource];
  }
}

void __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_16(uint64_t a1)
{
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)DOCThumbnailFittingImageView;
  [(DOCThumbnailFittingImageView *)&v4 didMoveToWindow];
  id v3 = [(DOCThumbnailFittingImageView *)self window];

  if (v3) {
    [(DOCThumbnailFittingImageView *)self updateThumbnail];
  }
}

- (DOCNode)node
{
  return self->_node;
}

- (NSURL)url
{
  return self->_url;
}

- (int64_t)generatorGeneration
{
  return self->_generatorGeneration;
}

- (void)setGeneratorGeneration:(int64_t)a3
{
  self->_generatorGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_node, 0);
}

void __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 136315650;
  int v5 = "-[DOCThumbnailFittingImageView updateThumbnailForURL:]_block_invoke_4";
  __int16 v6 = 2112;
  uint64_t v7 = v2;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_error_impl(&dword_222E2D000, a2, OS_LOG_TYPE_ERROR, "%s: Failed to get thumbnail for %@ (error: %@), falling back to default doc type", (uint8_t *)&v4, 0x20u);
}

@end