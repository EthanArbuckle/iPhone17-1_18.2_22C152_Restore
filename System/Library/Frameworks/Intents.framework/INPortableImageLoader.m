@interface INPortableImageLoader
+ (BOOL)supportsSecureCoding;
- (BOOL)canLoadImageDataForImage:(id)a3;
- (INPortableImageLoader)initWithCoder:(id)a3;
- (INPortableImageLoaderHelping)helper;
- (NSString)serviceIdentifier;
- (id)_helperClassName;
- (unint64_t)servicePriority;
- (void)filePathForImage:(id)a3 completion:(id)a4;
- (void)filePathForImage:(id)a3 usingPortableImageLoader:(id)a4 completion:(id)a5;
- (void)loadDataImageFromImage:(id)a3 usingPortableImageLoader:(id)a4 scaledSize:(id)a5 completion:(id)a6;
- (void)loadImageDataFromImage:(id)a3 accessSpecifier:(id)a4 completion:(id)a5;
@end

@implementation INPortableImageLoader

void __42__INPortableImageLoader_serviceIdentifier__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSString;
  id v6 = [MEMORY[0x1E4F28B50] bundleForClass:v0];
  v2 = [v6 bundleIdentifier];
  v3 = NSStringFromClass(v0);
  uint64_t v4 = [v1 stringWithFormat:@"%@.%@", v2, v3];
  v5 = (void *)serviceIdentifier_sServiceIdentifier_83547;
  serviceIdentifier_sServiceIdentifier_83547 = v4;
}

- (NSString)serviceIdentifier
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__INPortableImageLoader_serviceIdentifier__block_invoke;
  block[3] = &unk_1E55208F8;
  block[4] = self;
  if (serviceIdentifier_onceToken_83546 != -1) {
    dispatch_once(&serviceIdentifier_onceToken_83546, block);
  }
  return (NSString *)(id)serviceIdentifier_sServiceIdentifier_83547;
}

- (unint64_t)servicePriority
{
  return 50;
}

- (void).cxx_destruct
{
}

- (INPortableImageLoader)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INPortableImageLoader;
  return [(INPortableImageLoader *)&v4 init];
}

- (void)filePathForImage:(id)a3 usingPortableImageLoader:(id)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  if (v8)
  {
    [v8 filePathForImage:v7 usingPortableImageLoader:0 completion:v9];
  }
  else
  {
    v10 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[INPortableImageLoader filePathForImage:usingPortableImageLoader:completion:]";
      __int16 v18 = 2112;
      v19 = @"The INPortableImageLoader provided to filePathForImage:usingPortableImageLoader:completion: is nil";
      _os_log_error_impl(&dword_18CB2F000, v10, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28228];
    v15 = @"The INPortableImageLoader provided to filePathForImage:usingPortableImageLoader:completion: is nil";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v13 = [v11 errorWithDomain:@"IntentsErrorDomain" code:6000 userInfo:v12];
    v9[2](v9, 0, v13);
  }
}

- (void)loadDataImageFromImage:(id)a3 usingPortableImageLoader:(id)a4 scaledSize:(id)a5 completion:(id)a6
{
  if (a4) {
    objc_msgSend(a4, "loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:", a3, 0, a6, a5.var0, a5.var1);
  }
  else {
    -[INPortableImageLoader loadImageDataFromImage:accessSpecifier:completion:](self, "loadImageDataFromImage:accessSpecifier:completion:", a3, 0, a6, a5.var0, a5.var1);
  }
}

- (BOOL)canLoadImageDataForImage:(id)a3
{
  return a3 != 0;
}

- (void)filePathForImage:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = (__CFString *)a3;
  id v6 = (void (**)(id, void, void *))a4;
  if (v6)
  {
    id v7 = INSiriLogContextIntents;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v14 = "-[INPortableImageLoader filePathForImage:completion:]";
        __int16 v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_INFO, "%s Attempting to grab file path for image: %@", buf, 0x16u);
      }
      [(__CFString *)v5 _retrieveFilePathWithCompletion:v6];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v14 = "-[INPortableImageLoader filePathForImage:completion:]";
        __int16 v15 = 2112;
        v16 = @"The INImage provided to INPortableImageLoader:filePathForImage is nil";
        _os_log_error_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F28228];
      v12 = @"The INImage provided to INPortableImageLoader:filePathForImage is nil";
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      v10 = [v8 errorWithDomain:@"IntentsErrorDomain" code:6000 userInfo:v9];
      v6[2](v6, 0, v10);
    }
  }
}

- (void)loadImageDataFromImage:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = INSiriLogContextIntents;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[INPortableImageLoader loadImageDataFromImage:accessSpecifier:completion:]";
        __int16 v23 = 2112;
        v24 = v8;
        _os_log_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_INFO, "%s Attempting intrinsic loading strategy for image: %@", buf, 0x16u);
      }
      v12 = [(INPortableImageLoader *)self helper];
      v13 = v9;
      if (!v9)
      {
        v13 = +[INHelperServiceAccessSpecifier accessSpecifierAppropriateForCurrentProcess];
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __75__INPortableImageLoader_loadImageDataFromImage_accessSpecifier_completion___block_invoke;
      v17[3] = &unk_1E551BB88;
      id v18 = v10;
      [(__CFString *)v8 _loadImageDataAndSizeWithHelper:v12 accessSpecifier:v13 completion:v17];
      if (!v9) {

      }
      uint64_t v14 = v18;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[INPortableImageLoader loadImageDataFromImage:accessSpecifier:completion:]";
        __int16 v23 = 2112;
        v24 = @"The INImage provided to INPortableImageLoader:loadImageDataFromImage is nil";
        _os_log_error_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
      __int16 v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28228];
      uint64_t v20 = @"The INImage provided to INPortableImageLoader:loadImageDataFromImage is nil";
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      v16 = [v15 errorWithDomain:@"IntentsErrorDomain" code:6000 userInfo:v14];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
    }
  }
}

void __75__INPortableImageLoader_loadImageDataFromImage_accessSpecifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  if (!a2 || a4)
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v10();
  }
  else
  {
    id v11 = +[INImage imageWithImageData:a2];
    objc_msgSend(v11, "_setImageSize:", a5, a6);
    [v11 _setRenderingMode:a3];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)_helperClassName
{
  v3 = [(INPortableImageLoader *)self helper];

  if (v3)
  {
    objc_super v4 = [(INPortableImageLoader *)self helper];
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (INPortableImageLoaderHelping)helper
{
  helper = self->_helper;
  if (!helper)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    objc_super v4 = (void *)getINUIPortableImageLoaderHelperClass_softClass;
    uint64_t v13 = getINUIPortableImageLoaderHelperClass_softClass;
    if (!getINUIPortableImageLoaderHelperClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getINUIPortableImageLoaderHelperClass_block_invoke;
      v9[3] = &unk_1E5520EB8;
      v9[4] = &v10;
      __getINUIPortableImageLoaderHelperClass_block_invoke((uint64_t)v9);
      objc_super v4 = (void *)v11[3];
    }
    v5 = v4;
    _Block_object_dispose(&v10, 8);
    id v6 = (INPortableImageLoaderHelping *)objc_alloc_init(v5);
    id v7 = self->_helper;
    self->_helper = v6;

    helper = self->_helper;
  }

  return helper;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end