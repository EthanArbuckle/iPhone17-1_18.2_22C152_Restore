@interface FAInviteLinkMetadataProvider
- (FAInviteLinkMetadataProvider)initWithContext:(id)a3;
- (id)_colorForString:(id)a3;
- (id)_defaultIcon;
- (id)_defaultImage;
- (id)_imageNamed:(id)a3;
- (id)linkMetadataWithImage:(id)a3 icon:(id)a4;
- (void)fetchImageFromURL:(id)a3 completion:(id)a4;
- (void)loadImageWithURL:(id)a3 enableTextOverlay:(BOOL)a4 completion:(id)a5;
- (void)loadMetatadataWithCompletion:(id)a3;
@end

@implementation FAInviteLinkMetadataProvider

- (FAInviteLinkMetadataProvider)initWithContext:(id)a3
{
  v4 = (FAInviteContext *)a3;
  v8.receiver = self;
  v8.super_class = (Class)FAInviteLinkMetadataProvider;
  v5 = [(FAInviteLinkMetadataProvider *)&v8 init];
  context = v5->_context;
  v5->_context = v4;

  return v5;
}

- (void)loadMetatadataWithCompletion:(id)a3
{
  id v4 = a3;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__3;
  v31[4] = __Block_byref_object_dispose__3;
  id v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__3;
  v29[4] = __Block_byref_object_dispose__3;
  id v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__3;
  v27[4] = __Block_byref_object_dispose__3;
  id v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__3;
  v25[4] = __Block_byref_object_dispose__3;
  id v26 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  dispatch_group_enter(v5);
  v6 = [(FAInviteContext *)self->_context imageURL];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __61__FAInviteLinkMetadataProvider_loadMetatadataWithCompletion___block_invoke;
  v21[3] = &unk_264349E28;
  v23 = v31;
  v24 = v27;
  v7 = v5;
  v22 = v7;
  [(FAInviteLinkMetadataProvider *)self loadImageWithURL:v6 enableTextOverlay:1 completion:v21];

  objc_super v8 = [(FAInviteContext *)self->_context iconURL];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __61__FAInviteLinkMetadataProvider_loadMetatadataWithCompletion___block_invoke_2;
  v17[3] = &unk_264349E28;
  v19 = v29;
  v20 = v25;
  v9 = v7;
  v18 = v9;
  [(FAInviteLinkMetadataProvider *)self loadImageWithURL:v8 enableTextOverlay:0 completion:v17];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__FAInviteLinkMetadataProvider_loadMetatadataWithCompletion___block_invoke_3;
  v11[3] = &unk_264349E50;
  v13 = v27;
  v14 = v25;
  v11[4] = self;
  id v12 = v4;
  v15 = v31;
  v16 = v29;
  id v10 = v4;
  dispatch_group_notify(v9, MEMORY[0x263EF83A0], v11);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
}

void __61__FAInviteLinkMetadataProvider_loadMetatadataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__FAInviteLinkMetadataProvider_loadMetatadataWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__FAInviteLinkMetadataProvider_loadMetatadataWithCompletion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v1 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v1();
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      v3 = *(void (**)(uint64_t, void))(v2 + 16);
      uint64_t v4 = *(void *)(a1 + 40);
      v3(v4, 0);
    }
    else
    {
      id v5 = [*(id *)(a1 + 32) linkMetadataWithImage:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) icon:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
      (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
    }
  }
}

- (void)loadImageWithURL:(id)a3 enableTextOverlay:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = v8;
  if (a3)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __78__FAInviteLinkMetadataProvider_loadImageWithURL_enableTextOverlay_completion___block_invoke;
    v10[3] = &unk_264349E78;
    BOOL v12 = a4;
    v10[4] = self;
    id v11 = v8;
    [(FAInviteLinkMetadataProvider *)self fetchImageFromURL:a3 completion:v10];
  }
  else
  {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

void __78__FAInviteLinkMetadataProvider_loadImageWithURL_enableTextOverlay_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) overlaidTextColorString];
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        id v10 = _FALogSystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_2189F0000, v10, OS_LOG_TYPE_DEFAULT, "Server specifying overlaid text color", (uint8_t *)&v20, 2u);
        }

        uint64_t v11 = [*(id *)(a1 + 32) _colorForString:v9];
        if (v11)
        {
          BOOL v12 = (void *)v11;
          v13 = _FALogSystem();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v20) = 0;
            _os_log_impl(&dword_2189F0000, v13, OS_LOG_TYPE_DEFAULT, "We have an overlaid text color, adding properties to LPImage", (uint8_t *)&v20, 2u);
          }

          id v14 = objc_alloc_init(MEMORY[0x263F103C8]);
          [v14 setOverlaidTextColor:v12];

          if (v14)
          {
            v15 = (void *)[objc_alloc(MEMORY[0x263F103C0]) initWithPlatformImage:v5 properties:v14];

LABEL_18:
            (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

            goto LABEL_19;
          }
        }
        else
        {
        }
      }
    }
    v15 = (void *)[objc_alloc(MEMORY[0x263F103C0]) initWithPlatformImage:v5];
    goto LABEL_18;
  }
  if (v6)
  {
    v16 = _FALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      v19 = [v7 description];
      int v20 = 138412546;
      v21 = v18;
      __int16 v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_2189F0000, v16, OS_LOG_TYPE_DEFAULT, "%@ - unable to load image: %@", (uint8_t *)&v20, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_19:
}

- (void)fetchImageFromURL:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F25CE0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedImageFetcher];
  [v8 fetchImageAtURL:v7 completionHandler:v6];
}

- (id)_colorForString:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = [MEMORY[0x263F08B08] scannerWithString:v3];
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    id v5 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    [v4 setCharactersToBeSkipped:v5];

    int v6 = objc_msgSend(v4, "scanUpToString:intoString:", @"("), 0;
    objc_msgSend(v4, "scanString:intoString:", @"("), 0;
    int v7 = [v4 scanInt:(char *)&v21 + 4];
    int v8 = [v4 scanString:@"," intoString:0];
    int v9 = [v4 scanInt:&v21];
    int v10 = [v4 scanString:@"," intoString:0];
    int v11 = [v4 scanInt:(char *)&v20 + 4];
    int v12 = [v4 scanString:@"," intoString:0];
    int v13 = [v4 scanFloat:&v20];
    if (v6 && v7 && v8 && v9 && v10 && v11)
    {
      double v14 = *(float *)&v20;
      if ((v12 & v13) == 0) {
        double v14 = 1.0;
      }
      v15 = [MEMORY[0x263F825C8] colorWithRed:(double)SHIDWORD(v21) / 255.0 green:(double)(int)v21 / 255.0 blue:(double)SHIDWORD(v20) / 255.0 alpha:v14];
    }
    else
    {
      v22[0] = @"black";
      v16 = [MEMORY[0x263F825C8] blackColor];
      v22[1] = @"white";
      v23[0] = v16;
      v17 = [MEMORY[0x263F825C8] whiteColor];
      v23[1] = v17;
      v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

      v15 = [v18 objectForKeyedSubscript:v3];
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)linkMetadataWithImage:(id)a3 icon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = objc_alloc_init(FAInviteLinkMetadata);
  [(FAInviteLinkMetadata *)v8 setContext:self->_context];
  if (v6)
  {
    [(FAInviteLinkMetadata *)v8 setImage:v6];
    if (v7)
    {
LABEL_3:
      [(FAInviteLinkMetadata *)v8 setIcon:v7];
      goto LABEL_6;
    }
  }
  else
  {
    int v9 = [(FAInviteLinkMetadataProvider *)self _defaultImage];
    [(FAInviteLinkMetadata *)v8 setImage:v9];

    if (v7) {
      goto LABEL_3;
    }
  }
  int v10 = [(FAInviteLinkMetadataProvider *)self _defaultIcon];
  [(FAInviteLinkMetadata *)v8 setIcon:v10];

LABEL_6:
  return v8;
}

- (id)_imageNamed:(id)a3
{
  id v3 = (void *)MEMORY[0x263F827E8];
  uint64_t v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  id v6 = [v4 bundleForClass:objc_opt_class()];
  id v7 = [v3 imageNamed:v5 inBundle:v6];

  int v8 = (void *)[objc_alloc(MEMORY[0x263F103C0]) initWithPlatformImage:v7];
  return v8;
}

- (id)_defaultImage
{
  return [(FAInviteLinkMetadataProvider *)self _imageNamed:@"family-asset-frame-background-A"];
}

- (id)_defaultIcon
{
  return [(FAInviteLinkMetadataProvider *)self _imageNamed:@"family"];
}

- (void).cxx_destruct
{
}

@end