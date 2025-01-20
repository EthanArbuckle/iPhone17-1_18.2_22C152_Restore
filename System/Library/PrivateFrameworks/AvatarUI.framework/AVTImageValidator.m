@interface AVTImageValidator
+ ($8452678F12DBC466148836A9D382CAFC)_calculateStatistics:(SEL)a3 withSize:(CGImage *)a4;
+ (BOOL)isImageValid:(id)a3 error:(id *)a4;
+ (id)sharedValidator;
- (AVTImageValidator)init;
- (AVTImageValidator)initWithConfiguration:(id)a3 environment:(id)a4;
- (AVTImageValidatorConfiguration)configuration;
- (AVTUILogger)logger;
- (BOOL)validateImageDataIsNotDuplicate:(id)a3 forFileName:(id)a4 avatarDataHash:(id)a5;
- (BOOL)validateImageIsNotTransparent:(id)a3 error:(id *)a4;
- (NSMutableDictionary)fileNameToImageHashesMap;
- (NSMutableDictionary)imageHashesToAvatarDataHashesMap;
- (NSMutableDictionary)imageHashesToFileNameMap;
- (OS_dispatch_queue)duplicateValidationQueue;
- (void)nts_addHash:(id)a3 forKey:(id)a4 avatarDataHash:(id)a5;
- (void)setConfiguration:(id)a3;
- (void)setDuplicateValidationQueue:(id)a3;
- (void)setFileNameToImageHashesMap:(id)a3;
- (void)setImageHashesToAvatarDataHashesMap:(id)a3;
- (void)setImageHashesToFileNameMap:(id)a3;
- (void)setLogger:(id)a3;
@end

@implementation AVTImageValidator

+ ($8452678F12DBC466148836A9D382CAFC)_calculateStatistics:(SEL)a3 withSize:(CGImage *)a4
{
  double height = a5.height;
  double width = a5.width;
  size_t v9 = (unint64_t)a5.width;
  size_t v10 = (unint64_t)a5.height;
  size_t v11 = 4 * (unint64_t)a5.width;
  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  v12 = malloc_type_malloc(v11 * (unint64_t)a5.height, 0xDC59A542uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v14 = CGBitmapContextCreate(v12, v9, v10, 8uLL, v11, DeviceRGB, 0x4001u);
  v57.size.double width = (double)(unint64_t)width;
  v57.size.double height = (double)(unint64_t)height;
  v57.origin.x = 0.0;
  v57.origin.y = 0.0;
  CGContextDrawImage(v14, v57, a4);
  CGContextRelease(v14);
  CGColorSpaceRelease(DeviceRGB);
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v17 = 0;
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  unint64_t v20 = 0;
  unint64_t v21 = 0;
  unint64_t v22 = 0;
  unint64_t v23 = 0;
  char v24 = 1;
  do
  {
    char v25 = v24;
    size_t v26 = qword_20AFF21E0[v15];
    if (v26 < v10)
    {
      uint64_t v27 = (uint64_t)v12 + (v11 + 4) * v26 + 3;
      size_t v28 = v26;
      do
      {
        v29 = (unsigned __int8 *)v27;
        for (size_t i = v26; i < v9; v29 += 4 * v26)
        {
          uint64_t v31 = *(v29 - 3);
          v23 += v31;
          uint64_t v32 = *(v29 - 2);
          v22 += v32;
          uint64_t v33 = *(v29 - 1);
          v21 += v33;
          v20 += *v29;
          v19 += (v31 * v31);
          v18 += (v32 * v32);
          v17 += (v33 * v33);
          ++v16;
          i += v26;
        }
        v28 += v26;
        v27 += v11 * v26;
      }
      while (v28 < v10);
    }
    char v24 = 0;
    uint64_t v15 = 1;
  }
  while ((v25 & 1) != 0);
  double v34 = 1.0 / (double)v16;
  unint64_t v35 = (unint64_t)(v34 * (double)v23);
  unint64_t v36 = (unint64_t)(v34 * (double)v22);
  unint64_t v37 = (unint64_t)(v34 * (double)v21);
  float v38 = fmax(-((double)(v35 * v35) - (double)v19 * v34), 0.0);
  double v39 = sqrtf(v38);
  float v40 = fmax(-((double)(v36 * v36) - (double)v18 * v34), 0.0);
  double v41 = sqrtf(v40);
  float v42 = fmax(-((double)(v37 * v37) - (double)v17 * v34), 0.0);
  double v43 = sqrtf(v42);
  double v55 = 0.0;
  double v56 = 0.0;
  double v54 = 0.0;
  double v51 = 0.0;
  double v52 = 0.0;
  double v44 = (double)v35 * 0.00392156863;
  double v45 = (double)v36 * 0.00392156863;
  double v46 = (double)v37 * 0.00392156863;
  __AVT_RGBtoHSV(&v56, &v55, &v54, v44, v45, v46);
  result = ($8452678F12DBC466148836A9D382CAFC *)__AVT_RGBtoHSV(&v53, &v52, &v51, v39 * 0.00392156863, v41 * 0.00392156863, v43 * 0.00392156863);
  if (a4) {
    free(v12);
  }
  retstr->var0 = v44;
  retstr->var1 = v45;
  retstr->var2 = v46;
  retstr->var3 = v56;
  double v48 = v54;
  retstr->var4 = v55;
  retstr->var5 = v48;
  double v49 = v52;
  double v50 = v51;
  retstr->var6 = (double)(unint64_t)(v34 * (double)v20) * 0.00392156863;
  retstr->var7 = v50;
  retstr->var8 = v49;
  return result;
}

+ (BOOL)isImageValid:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!v5)
  {
    if (!a4)
    {
      LOBYTE(v6) = 0;
      goto LABEL_12;
    }
    id v9 = [MEMORY[0x263F29748] errorWithCode:606 userInfo:0];
    LOBYTE(v6) = 0;
    goto LABEL_10;
  }
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  uint64_t v8 = objc_msgSend(v7, "CGImage", 0, 0, 0, 0, 0, 0);
  [v7 size];
  if (v6)
  {
    objc_msgSend((id)v6, "_calculateStatistics:withSize:", v8);
    LOBYTE(v6) = 0.0 > 2.22044605e-16;
    if (!a4) {
      goto LABEL_12;
    }
  }
  else if (!a4)
  {
    goto LABEL_12;
  }
  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x263F29748], "errorWithCode:userInfo:", 605, 0, 0.0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    *a4 = v9;
  }
LABEL_12:

  return v6;
}

+ (id)sharedValidator
{
  if (sharedValidator_onceToken != -1) {
    dispatch_once(&sharedValidator_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)sharedValidator__validator;
  return v2;
}

uint64_t __36__AVTImageValidator_sharedValidator__block_invoke()
{
  v0 = objc_alloc_init(AVTImageValidator);
  uint64_t v1 = sharedValidator__validator;
  sharedValidator__validator = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (AVTImageValidator)init
{
  v3 = objc_alloc_init(AVTImageValidatorConfiguration);
  [(AVTImageValidatorConfiguration *)v3 setShouldCheckForDuplicateImages:1];
  [(AVTImageValidatorConfiguration *)v3 setShouldCheckForTransparentImages:1];
  v4 = +[AVTUIEnvironment defaultEnvironment];
  id v5 = [(AVTImageValidator *)self initWithConfiguration:v3 environment:v4];

  return v5;
}

- (AVTImageValidator)initWithConfiguration:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)AVTImageValidator;
  id v9 = [(AVTImageValidator *)&v21 init];
  size_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    fileNameToImageHashesMap = v10->_fileNameToImageHashesMap;
    v10->_fileNameToImageHashesMap = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    imageHashesToFileNameMap = v10->_imageHashesToFileNameMap;
    v10->_imageHashesToFileNameMap = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    imageHashesToAvatarDataHashesMap = v10->_imageHashesToAvatarDataHashesMap;
    v10->_imageHashesToAvatarDataHashesMap = (NSMutableDictionary *)v15;

    unint64_t v17 = [v8 serialQueueProvider];
    uint64_t v18 = ((void (**)(void, const char *))v17)[2](v17, "com.apple.AvatarUI.AVTImageValidator");
    duplicateValidationQueue = v10->_duplicateValidationQueue;
    v10->_duplicateValidationQueue = (OS_dispatch_queue *)v18;
  }
  return v10;
}

- (BOOL)validateImageIsNotTransparent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(AVTImageValidator *)self configuration];
  int v8 = [v7 shouldCheckForTransparentImages];

  if (v8) {
    char v9 = [(id)objc_opt_class() isImageValid:v6 error:a4];
  }
  else {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)validateImageDataIsNotDuplicate:(id)a3 forFileName:(id)a4 avatarDataHash:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(AVTImageValidator *)self configuration];
  int v12 = [v11 shouldCheckForDuplicateImages];

  if (v12)
  {
    if (!v8)
    {
      BOOL v16 = 0;
      goto LABEL_6;
    }
    uint64_t v13 = objc_msgSend(v8, "avt_SHA256");
    v14 = [(AVTImageValidator *)self duplicateValidationQueue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __80__AVTImageValidator_validateImageDataIsNotDuplicate_forFileName_avatarDataHash___block_invoke;
    v18[3] = &unk_263FF1A80;
    v18[4] = self;
    id v19 = v13;
    id v20 = v9;
    id v21 = v10;
    id v15 = v13;
    dispatch_sync(v14, v18);
  }
  BOOL v16 = 1;
LABEL_6:

  return v16;
}

void __80__AVTImageValidator_validateImageDataIsNotDuplicate_forFileName_avatarDataHash___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageHashesToFileNameMap];
  id v6 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  char v3 = [v6 isEqualToString:*(void *)(a1 + 48)];
  if (!v6
    || (v3 & 1) != 0
    || *(void *)(a1 + 56)
    && ([*(id *)(a1 + 32) imageHashesToAvatarDataHashesMap],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:*(void *)(a1 + 40)],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        LODWORD(v4) = [*(id *)(a1 + 56) isEqualToString:v5],
        v5,
        v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "nts_addHash:forKey:avatarDataHash:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
}

- (void)nts_addHash:(id)a3 forKey:(id)a4 avatarDataHash:(id)a5
{
  id v16 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(AVTImageValidator *)self fileNameToImageHashesMap];
  uint64_t v11 = [v10 objectForKeyedSubscript:v16];

  if (v11)
  {
    int v12 = [(AVTImageValidator *)self imageHashesToFileNameMap];
    [v12 setObject:0 forKeyedSubscript:v11];

    uint64_t v13 = [(AVTImageValidator *)self imageHashesToAvatarDataHashesMap];
    [v13 setObject:0 forKeyedSubscript:v11];
  }
  v14 = [(AVTImageValidator *)self imageHashesToFileNameMap];
  [v14 setObject:v16 forKeyedSubscript:v9];

  id v15 = [(AVTImageValidator *)self imageHashesToAvatarDataHashesMap];
  [v15 setObject:v8 forKeyedSubscript:v9];
}

- (OS_dispatch_queue)duplicateValidationQueue
{
  return self->_duplicateValidationQueue;
}

- (void)setDuplicateValidationQueue:(id)a3
{
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (AVTImageValidatorConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSMutableDictionary)fileNameToImageHashesMap
{
  return self->_fileNameToImageHashesMap;
}

- (void)setFileNameToImageHashesMap:(id)a3
{
}

- (NSMutableDictionary)imageHashesToAvatarDataHashesMap
{
  return self->_imageHashesToAvatarDataHashesMap;
}

- (void)setImageHashesToAvatarDataHashesMap:(id)a3
{
}

- (NSMutableDictionary)imageHashesToFileNameMap
{
  return self->_imageHashesToFileNameMap;
}

- (void)setImageHashesToFileNameMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageHashesToFileNameMap, 0);
  objc_storeStrong((id *)&self->_imageHashesToAvatarDataHashesMap, 0);
  objc_storeStrong((id *)&self->_fileNameToImageHashesMap, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_duplicateValidationQueue, 0);
}

@end