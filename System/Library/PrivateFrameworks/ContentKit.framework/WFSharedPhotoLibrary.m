@interface WFSharedPhotoLibrary
+ (id)sharedLibrary;
- (WFSharedPhotoLibrary)init;
- (id)fetchOptionsWithError:(id *)a3;
- (id)systemPhotoLibraryWithError:(id *)a3;
- (void)photoLibraryDidBecomeUnavailable:(id)a3;
@end

@implementation WFSharedPhotoLibrary

- (void).cxx_destruct
{
}

- (void)photoLibraryDidBecomeUnavailable:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = (PHPhotoLibrary *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_systemPhotoLibrary == v4)
  {
    self->_lock_systemPhotoLibrary = 0;

    v6 = @"System";
  }
  else
  {
    v6 = @"Unknown";
  }
  v7 = getWFGeneralLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315394;
    v9 = "-[WFSharedPhotoLibrary photoLibraryDidBecomeUnavailable:]";
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_ERROR, "%s %@ photo library became unavailable", (uint8_t *)&v8, 0x16u);
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)fetchOptionsWithError:(id *)a3
{
  v3 = [(WFSharedPhotoLibrary *)self systemPhotoLibraryWithError:a3];
  v4 = [v3 librarySpecificFetchOptions];

  return v4;
}

- (id)systemPhotoLibraryWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__WFSharedPhotoLibrary_systemPhotoLibraryWithError___block_invoke;
  aBlock[3] = &unk_26428A060;
  aBlock[4] = self;
  v5 = (void (**)(void))_Block_copy(aBlock);
  v6 = self->_lock_systemPhotoLibrary;
  if (v6) {
    goto LABEL_4;
  }
  id v7 = objc_alloc((Class)getPHPhotoLibraryClass());
  int v8 = [getPHPhotoLibraryClass() systemPhotoLibraryURL];
  v6 = (PHPhotoLibrary *)[v7 initWithPhotoLibraryURL:v8];

  id v14 = 0;
  char v9 = [(PHPhotoLibrary *)v6 openAndWaitWithUpgrade:0 error:&v14];
  id v10 = v14;
  if (v9)
  {
    [(PHPhotoLibrary *)v6 registerAvailabilityObserver:self];
    objc_storeStrong((id *)&self->_lock_systemPhotoLibrary, v6);

LABEL_4:
    v6 = v6;
    v11 = v6;
    goto LABEL_5;
  }
  v13 = getWFGeneralLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[WFSharedPhotoLibrary systemPhotoLibraryWithError:]";
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_216505000, v13, OS_LOG_TYPE_ERROR, "%s Unable to open system photo library: %@", buf, 0x16u);
  }

  if (a3) {
    *a3 = v10;
  }

  v11 = 0;
LABEL_5:

  v5[2](v5);
  return v11;
}

void __52__WFSharedPhotoLibrary_systemPhotoLibraryWithError___block_invoke(uint64_t a1)
{
}

- (WFSharedPhotoLibrary)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFSharedPhotoLibrary;
  v2 = [(WFSharedPhotoLibrary *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

+ (id)sharedLibrary
{
  if (sharedLibrary_onceToken != -1) {
    dispatch_once(&sharedLibrary_onceToken, &__block_literal_global_6681);
  }
  v2 = (void *)sharedLibrary_library;
  return v2;
}

uint64_t __37__WFSharedPhotoLibrary_sharedLibrary__block_invoke()
{
  v0 = objc_alloc_init(WFSharedPhotoLibrary);
  v1 = (void *)sharedLibrary_library;
  sharedLibrary_library = (uint64_t)v0;

  id PHPhotoLibraryClass = getPHPhotoLibraryClass();
  return [PHPhotoLibraryClass enableMultiLibraryMode];
}

@end