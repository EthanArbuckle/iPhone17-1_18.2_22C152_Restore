@interface INUIImageLoader
+ (id)registeredImageLoaderWithScreenDelegate;
- (BOOL)canLoadImageDataForImage:(id)a3;
- (BOOL)loadImage:(id)a3 withCompletionHandler:(id)a4;
- (BOOL)loadImage:(id)a3 withContext:(id)a4 completionHandler:(id)a5;
- (INUIImageLoaderDelegate)delegate;
- (NSString)serviceIdentifier;
- (unint64_t)servicePriority;
- (void)dealloc;
- (void)deregisterWithIntents;
- (void)deregisterWithSearchFoundation;
- (void)loadDataImageFromImage:(id)a3 usingPortableImageLoader:(id)a4 scaledSize:(id)a5 completion:(id)a6;
- (void)registerWithIntents;
- (void)registerWithSearchFoundation;
- (void)setDelegate:(id)a3;
@end

@implementation INUIImageLoader

- (void).cxx_destruct
{
}

- (INUIImageLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (INUIImageLoaderDelegate *)WeakRetained;
}

- (unint64_t)servicePriority
{
  return 76;
}

- (BOOL)canLoadImageDataForImage:(id)a3
{
  return a3 != 0;
}

- (void)loadDataImageFromImage:(id)a3 usingPortableImageLoader:(id)a4 scaledSize:(id)a5 completion:(id)a6
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v13) {
    goto LABEL_27;
  }
  if (!v12) {
    id v12 = objc_alloc_init(MEMORY[0x263F0FD80]);
  }
  v14 = [v12 helper];
  v15 = (os_log_t *)MEMORY[0x263F0F810];
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = [(INUIImageLoader *)self delegate];
    v17 = [v16 traitCollectionForImageLoader:self];
    [v14 setTraitCollection:v17];
  }
  else
  {

    os_log_t v18 = *v15;
    if (!os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    v14 = v18;
    v38 = [v12 helper];
    *(_DWORD *)buf = 136315394;
    v52 = "-[INUIImageLoader loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:]";
    __int16 v53 = 2112;
    id v54 = (id)objc_opt_class();
    id v39 = v54;
    _os_log_error_impl(&dword_20A3EB000, v14, OS_LOG_TYPE_ERROR, "%s The helper on INPortableImageLoader was of an expected class (expected INUIPortableImageLoaderHelper, got %@)", buf, 0x16u);
  }
LABEL_9:
  id v41 = v12;
  v19 = objc_msgSend(MEMORY[0x263F0FBA0], "sharedInstance", v13);
  v20 = [v19 imageLoaders];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v21 = v20;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v61 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v46;
    v25 = &_OBJC_LABEL_PROTOCOL____INUIRemoteViewControllerServing;
LABEL_11:
    uint64_t v26 = 0;
    v27 = v25;
    while (1)
    {
      if (*(void *)v46 != v24) {
        objc_enumerationMutation(v21);
      }
      v28 = *(INUIImageLoader **)(*((void *)&v45 + 1) + 8 * v26);
      if (((objc_opt_respondsToSelector() & 1) == 0
         || [(INUIImageLoader *)v28 canLoadImageDataForImage:v11])
        && (objc_opt_respondsToSelector() & 1) != 0
        && v28 != self)
      {
        break;
      }
      if (v23 == ++v26)
      {
        uint64_t v23 = [v21 countByEnumeratingWithState:&v45 objects:v61 count:16];
        v25 = v27;
        if (v23) {
          goto LABEL_11;
        }
        goto LABEL_20;
      }
    }
    v29 = v28;

    if (!v29) {
      goto LABEL_25;
    }
    v30 = (void *)*MEMORY[0x263F0F810];
    id v13 = v40;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
    {
      v31 = NSNumber;
      v32 = v30;
      v33 = [v31 numberWithDouble:var0];
      v34 = [NSNumber numberWithDouble:var1];
      *(_DWORD *)buf = 136316162;
      v52 = "-[INUIImageLoader loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:]";
      __int16 v53 = 2112;
      id v54 = v29;
      __int16 v55 = 2112;
      v56 = self;
      __int16 v57 = 2112;
      v58 = v33;
      __int16 v59 = 2112;
      v60 = v34;
      _os_log_impl(&dword_20A3EB000, v32, OS_LOG_TYPE_INFO, "%s Found preferred image loader %@ for image %@, attempting load at size {%@, %@}", buf, 0x34u);
    }
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __89__INUIImageLoader_loadDataImageFromImage_usingPortableImageLoader_scaledSize_completion___block_invoke;
    v42[3] = &unk_263FD6990;
    v44 = v40;
    id v43 = v11;
    id v12 = v41;
    -[INUIImageLoader loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:](v29, "loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:", v43, v41, v42, var0, var1);

    v35 = v44;
  }
  else
  {
LABEL_20:

LABEL_25:
    v36 = (void *)MEMORY[0x263F087E8];
    uint64_t v37 = *MEMORY[0x263F0F768];
    uint64_t v49 = *MEMORY[0x263F08320];
    v50 = @"No preferred image loader available for image: %@";
    v29 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    v35 = [v36 errorWithDomain:v37 code:6001 userInfo:v29];
    id v13 = v40;
    ((void (**)(void, void, void *))v40)[2](v40, 0, v35);
    id v12 = v41;
  }

LABEL_27:
}

void __89__INUIImageLoader_loadDataImageFromImage_usingPortableImageLoader_scaledSize_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v5)
    {
      [v5 _imageSize];
      double v9 = v8;
      double v11 = v10;
      id v12 = (void *)*MEMORY[0x263F0F810];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
      {
        id v13 = NSNumber;
        v14 = v12;
        v15 = [v13 numberWithDouble:v9];
        v16 = [NSNumber numberWithDouble:v11];
        uint64_t v17 = *(void *)(a1 + 32);
        int v20 = 136316162;
        id v21 = "-[INUIImageLoader loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:]_block_invoke";
        __int16 v22 = 2112;
        id v23 = v5;
        __int16 v24 = 2112;
        v25 = v15;
        __int16 v26 = 2112;
        v27 = v16;
        __int16 v28 = 2112;
        uint64_t v29 = v17;
        _os_log_impl(&dword_20A3EB000, v14, OS_LOG_TYPE_INFO, "%s Loaded data image %@ of size {%@, %@} from input image %@", (uint8_t *)&v20, 0x34u);
      }
    }
    else
    {
      os_log_t v18 = *MEMORY[0x263F0F810];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
      {
        v19 = *(void **)(a1 + 32);
        int v20 = 136315394;
        id v21 = "-[INUIImageLoader loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:]_block_invoke";
        __int16 v22 = 2112;
        id v23 = v19;
        _os_log_error_impl(&dword_20A3EB000, v18, OS_LOG_TYPE_ERROR, "%s No image was loaded for input image %@", (uint8_t *)&v20, 0x16u);
      }
    }
    v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

- (NSString)serviceIdentifier
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__INUIImageLoader_serviceIdentifier__block_invoke;
  block[3] = &unk_263FD6DB8;
  block[4] = self;
  if (serviceIdentifier_onceToken != -1) {
    dispatch_once(&serviceIdentifier_onceToken, block);
  }
  return (NSString *)(id)serviceIdentifier_sServiceIdentifier;
}

void __36__INUIImageLoader_serviceIdentifier__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSString;
  id v6 = [MEMORY[0x263F086E0] bundleForClass:v0];
  v2 = [v6 bundleIdentifier];
  v3 = NSStringFromClass(v0);
  uint64_t v4 = [v1 stringWithFormat:@"%@.%@", v2, v3];
  id v5 = (void *)serviceIdentifier_sServiceIdentifier;
  serviceIdentifier_sServiceIdentifier = v4;
}

- (BOOL)loadImage:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    double v9 = [v8 intentsImage];
    double v10 = v9;
    if (v9)
    {
      double v11 = [v9 _imageData];
      id v12 = [v10 _uri];
      id v13 = v12;
      if (v11)
      {
        v14 = [MEMORY[0x263F678C8] imageWithData:v11];
        v7[2](v7, v14, 0);
      }
      else
      {
        if (!v12 || ![v12 isFileURL])
        {
          v23[0] = MEMORY[0x263EF8330];
          v23[1] = 3221225472;
          v23[2] = __59__INUIImageLoader_loadImage_withContext_completionHandler___block_invoke_2;
          v23[3] = &unk_263FD6968;
          __int16 v24 = v7;
          [v10 _retrieveImageDataWithReply:v23];

          goto LABEL_15;
        }
        v14 = (void *)[objc_alloc(MEMORY[0x263F67B50]) initWithFacade:v8];
        [v14 setType:52];
        id v16 = objc_alloc_init(MEMORY[0x263F67BE0]);
        id v17 = objc_alloc_init(MEMORY[0x263F67BD8]);
        uint64_t v18 = [v13 absoluteString];
        v19 = (void *)v18;
        if (v18) {
          int v20 = (__CFString *)v18;
        }
        else {
          int v20 = &stru_26BE4DC38;
        }
        [v17 setAddress:v20];

        [v16 setUrlValue:v17];
        [v14 setUrlImage:v16];
        id v21 = (void *)[objc_alloc(MEMORY[0x263F678C8]) initWithProtobuf:v14];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __59__INUIImageLoader_loadImage_withContext_completionHandler___block_invoke;
        v25[3] = &unk_263FD6940;
        __int16 v26 = v7;
        [v21 loadImageDataWithCompletionAndErrorHandler:v25];
      }
LABEL_15:

      BOOL v15 = 1;
      goto LABEL_16;
    }
    BOOL v15 = 0;
  }
  else
  {
    BOOL v15 = 0;
    double v10 = 0;
    id v8 = 0;
  }
LABEL_16:

  return v15;
}

void __59__INUIImageLoader_loadImage_withContext_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = (void *)MEMORY[0x263F678C8];
    id v6 = a3;
    id v7 = [v5 imageWithData:a2];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);
  }
}

void __59__INUIImageLoader_loadImage_withContext_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = (void *)MEMORY[0x263F678C8];
    id v6 = a3;
    id v8 = [a2 _imageData];
    id v7 = [v5 imageWithData:v8];
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v7, v6);
  }
}

- (BOOL)loadImage:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  LOBYTE(self) = [(INUIImageLoader *)self loadImage:v7 withContext:v8 completionHandler:v6];

  return (char)self;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    id v6 = obj;
  }
}

- (void)dealloc
{
  [(INUIImageLoader *)self deregisterWithIntents];
  [(INUIImageLoader *)self deregisterWithSearchFoundation];
  v3.receiver = self;
  v3.super_class = (Class)INUIImageLoader;
  [(INUIImageLoader *)&v3 dealloc];
}

- (void)deregisterWithIntents
{
  id v3 = [MEMORY[0x263F0FBA0] sharedInstance];
  [v3 unregisterImageService:self];
}

- (void)deregisterWithSearchFoundation
{
}

- (void)registerWithSearchFoundation
{
}

- (void)registerWithIntents
{
  id v3 = [MEMORY[0x263F0FBA0] sharedInstance];
  [v3 registerImageService:self];
}

+ (id)registeredImageLoaderWithScreenDelegate
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 registerWithIntents];
  [v2 registerWithSearchFoundation];
  id v3 = [MEMORY[0x263F1C920] mainScreen];
  [v2 setDelegate:v3];

  return v2;
}

@end