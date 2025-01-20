@interface _CRKImageLoader
+ (id)sharedInstance;
+ (id)sharedInstanceWithInitialDelegate:(id)a3;
- (BOOL)active;
- (BOOL)loadImage:(id)a3 withCompletionHandler:(id)a4;
- (_CRKImageLoaderDelegate)delegate;
- (id)resourceIdentifierForLocalImageType:(int)a3;
- (void)_loadSFImageForURL:(id)a3 completion:(id)a4;
- (void)_registerWithSearchFoundation;
- (void)_unregisterWithSearchFoundaton;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _CRKImageLoader

+ (id)sharedInstance
{
  return (id)[a1 sharedInstanceWithInitialDelegate:0];
}

+ (id)sharedInstanceWithInitialDelegate:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53___CRKImageLoader_sharedInstanceWithInitialDelegate___block_invoke;
  block[3] = &unk_26470E988;
  id v9 = v3;
  uint64_t v4 = sharedInstanceWithInitialDelegate__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&sharedInstanceWithInitialDelegate__onceToken, block);
  }
  id v6 = (id)sharedInstanceWithInitialDelegate__sImageLoader;

  return v6;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3) {
      [(_CRKImageLoader *)self _registerWithSearchFoundation];
    }
    else {
      [(_CRKImageLoader *)self _unregisterWithSearchFoundaton];
    }
  }
}

- (void)_registerWithSearchFoundation
{
}

- (void)_unregisterWithSearchFoundaton
{
}

- (BOOL)loadImage:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[_CRKImageLoader resourceIdentifierForLocalImageType:](self, "resourceIdentifierForLocalImageType:", [v6 localImageType]);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        id v9 = (void *)MEMORY[0x263F1C6B0];
        v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v11 = [v9 imageNamed:v8 inBundle:v10 compatibleWithTraitCollection:0];

        v12 = UIImagePNGRepresentation(v11);
        v13 = [MEMORY[0x263F678C8] imageWithData:v12];
        v7[2](v7, v13, 0);

LABEL_9:
        BOOL v14 = 1;
LABEL_26:

        goto LABEL_27;
      }
      v20 = [MEMORY[0x263F31670] errorWithCode:203 description:@"SFLocalImage missing resourceIdentifier"];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
        -[_CRKImageLoader loadImage:withCompletionHandler:]();
      }
      ((void (**)(id, void *, void *))v7)[2](v7, 0, v20);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v6;
        v15 = [v8 urlValue];
        v16 = [v15 scheme];
        int v17 = [v16 isEqualToString:@"http"];

        v12 = [v8 urlValue];
        if (!v17)
        {
          v21 = [MEMORY[0x263F0FB88] imageWithURL:v12];
          v22 = v21;
          BOOL v14 = v21 != 0;
          if (v21)
          {
            id v23 = v21;
            v24 = [v23 _imageData];
            if (v24)
            {
              v25 = [MEMORY[0x263F678C8] imageWithData:v24];
              v7[2](v7, v25, 0);
            }
            else
            {
              if (!self->_imageLoader)
              {
                v30 = [MEMORY[0x263F10328] registeredImageLoaderWithScreenDelegate];
                imageLoader = self->_imageLoader;
                self->_imageLoader = v30;
              }
              v34[0] = MEMORY[0x263EF8330];
              v34[1] = 3221225472;
              v34[2] = __51___CRKImageLoader_loadImage_withCompletionHandler___block_invoke;
              v34[3] = &unk_26470EFA0;
              v35 = v7;
              [v23 _retrieveImageDataWithReply:v34];
            }
          }
          else
          {
            v33 = (void *)MEMORY[0x263F31670];
            v26 = NSString;
            v27 = [v8 urlValue];
            v28 = [v27 scheme];
            v29 = [v26 stringWithFormat:@"_CRKImageLoader doesn't support loading this URL scheme: %@", v28];
            v24 = [v33 errorWithCode:202 description:v29];

            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
              -[_CRKImageLoader loadImage:withCompletionHandler:]();
            }
            ((void (**)(id, void *, void *))v7)[2](v7, 0, v24);
          }

          goto LABEL_26;
        }
        [(_CRKImageLoader *)self _loadSFImageForURL:v12 completion:v7];
        goto LABEL_9;
      }
      v18 = (void *)MEMORY[0x263F31670];
      v19 = [NSString stringWithFormat:@"_CRKImageLoader doesn't support loading this class: %@", v6];
      id v8 = [v18 errorWithCode:201 description:v19];

      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
        -[_CRKImageLoader loadImage:withCompletionHandler:]();
      }
    }
    BOOL v14 = 0;
    goto LABEL_26;
  }
  BOOL v14 = 0;
LABEL_27:

  return v14;
}

- (void)_loadSFImageForURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v5)
    {
      v7 = [MEMORY[0x263F089E0] requestWithURL:v5];
      [v7 setTimeoutInterval:4.0];
      id v8 = [MEMORY[0x263F08BF8] sharedSession];
      uint64_t v10 = MEMORY[0x263EF8330];
      uint64_t v11 = 3221225472;
      v12 = __49___CRKImageLoader__loadSFImageForURL_completion___block_invoke;
      v13 = &unk_26470EFC8;
      id v14 = v5;
      id v15 = v6;
      id v9 = [v8 dataTaskWithRequest:v7 completionHandler:&v10];

      objc_msgSend(v9, "resume", v10, v11, v12, v13);
    }
    else
    {
      v7 = [MEMORY[0x263F31670] errorWithCode:204 description:@"Attempted to fetch SFImage using nil URL"];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
        -[_CRKImageLoader loadImage:withCompletionHandler:]();
      }
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v7);
    }
  }
}

- (id)resourceIdentifierForLocalImageType:(int)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return off_26470EFE8[a3];
  }
}

- (_CRKImageLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_CRKImageLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_imageLoader, 0);
}

- (void)loadImage:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224F73000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

@end