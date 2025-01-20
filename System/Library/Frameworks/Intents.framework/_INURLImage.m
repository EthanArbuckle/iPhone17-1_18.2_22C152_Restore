@interface _INURLImage
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEligibleForProxying;
- (BOOL)_isSupportedForDonation;
- (BOOL)_requiresRetrieval;
- (NSURL)imageURL;
- (_INURLImage)initWithCoder:(id)a3;
- (_INURLImage)initWithImageURL:(id)a3;
- (id)_copyWithSubclass:(Class)a3;
- (id)_dictionaryRepresentation;
- (id)_identifier;
- (id)_sandboxExtensionData;
- (void)_loadImageDataAndSizeWithHelper:(id)a3 accessSpecifier:(id)a4 completion:(id)a5;
- (void)_setSandboxExtensionData:(id)a3;
- (void)_setUri:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _INURLImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);

  objc_storeStrong((id *)&self->_sandboxExtensionData, 0);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (_INURLImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_INURLImage;
  v5 = [(INImage *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageURL"];
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sandboxExtensionData"];
    sandboxExtensionData = v5->_sandboxExtensionData;
    v5->_sandboxExtensionData = (NSData *)v8;

    if (v5->_imageURL)
    {
      if (v5->_sandboxExtensionData) {
        MEMORY[0x192F97DE0]();
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_INURLImage;
  id v4 = a3;
  [(INImage *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageURL, @"imageURL", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_sandboxExtensionData forKey:@"_sandboxExtensionData"];
}

- (void)_setSandboxExtensionData:(id)a3
{
  id v4 = (NSData *)[a3 copy];
  sandboxExtensionData = self->_sandboxExtensionData;
  self->_sandboxExtensionData = v4;

  MEMORY[0x1F41817F8](v4, sandboxExtensionData);
}

- (id)_sandboxExtensionData
{
  return self->_sandboxExtensionData;
}

- (BOOL)_isSupportedForDonation
{
  v2 = [(_INURLImage *)self imageURL];
  if ([v2 isFileURL])
  {
    BOOL v3 = 1;
  }
  else
  {
    if (INThisProcessIsSystemProcess_onceToken != -1) {
      dispatch_once(&INThisProcessIsSystemProcess_onceToken, &__block_literal_global_48);
    }
    BOOL v3 = INThisProcessIsSystemProcess_isSystemProcess != 0;
  }

  return v3;
}

- (BOOL)_isEligibleForProxying
{
  v2 = [(_INURLImage *)self imageURL];
  char v3 = [v2 isFileURL];

  return v3;
}

- (void)_setUri:(id)a3
{
  p_imageURL = &self->_imageURL;
  id v5 = a3;
  if ((-[NSURL isEqual:](*p_imageURL, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_imageURL, a3);
  }
}

- (id)_copyWithSubclass:(Class)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_INURLImage;
  id v4 = [(INImage *)&v10 _copyWithSubclass:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(_INURLImage *)self imageURL];
    [v5 _setUri:v6];
  }
  else
  {
    id v5 = 0;
  }
  if (v5) {
    v7 = v5;
  }
  else {
    v7 = v4;
  }
  id v8 = v7;

  return v8;
}

- (BOOL)_requiresRetrieval
{
  return 1;
}

- (id)_identifier
{
  v2 = [(_INURLImage *)self imageURL];
  char v3 = [v2 absoluteString];

  return v3;
}

- (id)_dictionaryRepresentation
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_INURLImage;
  char v3 = [(INImage *)&v9 _dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  objc_super v10 = @"imageURL";
  imageURL = self->_imageURL;
  uint64_t v6 = imageURL;
  if (!imageURL)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v4 addEntriesFromDictionary:v7];

  if (!imageURL) {

  }
  return v4;
}

- (_INURLImage)initWithImageURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_INURLImage;
  uint64_t v6 = [(INImage *)&v9 _initWithIdentifier:0];
  v7 = (_INURLImage *)v6;
  if (v6) {
    objc_storeStrong(v6 + 8, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_loadImageDataAndSizeWithHelper:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    objc_super v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[_INURLImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]";
      _os_log_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_INFO, "%s Attempting URL image loading strategy without the sent helper", buf, 0xCu);
    }
    v12 = [(_INURLImage *)self imageURL];
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v50 = "-[_INURLImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]";
        __int16 v51 = 2112;
        id v52 = v8;
        _os_log_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_INFO, "%s Attempting URL image loading strategy with helper: %@", buf, 0x16u);
      }
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke;
      v43[3] = &unk_1E551F888;
      id v44 = v10;
      [v8 loadImageDataFromURL:v12 completion:v43];
      v14 = v44;
      goto LABEL_26;
    }
    if (![v12 isFileURL])
    {
      if (v12)
      {
        v23 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v50 = "-[_INURLImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]";
          _os_log_impl(&dword_18CB2F000, v23, OS_LOG_TYPE_INFO, "%s Attempting remote URL image loading strategy", buf, 0xCu);
        }
        v14 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
        [v14 setURLCache:0];
        v24 = [MEMORY[0x1E4F28E88] requestWithURL:v12];
        [v24 setTimeoutInterval:4.0];
        [v24 setCachePolicy:1];
        v25 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v14];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke_126;
        v33[3] = &unk_1E551BC50;
        v33[4] = self;
        id v36 = v10;
        id v34 = v8;
        id v35 = v9;
        v26 = [v25 dataTaskWithRequest:v24 completionHandler:v33];
        [v26 resume];
      }
      else
      {
        v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v45 = *MEMORY[0x1E4F28568];
        v28 = NSString;
        v14 = [0 absoluteString];
        v29 = [v28 stringWithFormat:@"Failed to load image %@ from URL %@", self, v14];
        v46 = v29;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        v31 = [v27 errorWithDomain:@"IntentsErrorDomain" code:6003 userInfo:v30];
        (*((void (**)(id, void, void, void *, double, double))v10 + 2))(v10, 0, 0, v31, 0.0, 0.0);
      }
      goto LABEL_26;
    }
    v15 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[_INURLImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]";
      _os_log_impl(&dword_18CB2F000, v15, OS_LOG_TYPE_INFO, "%s Attempting file URL image loading strategy", buf, 0xCu);
    }
    char v16 = [v12 startAccessingSecurityScopedResource];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke_120;
    v40[3] = &unk_1E551BC28;
    char v42 = v16;
    id v17 = v12;
    id v41 = v17;
    v18 = (void (**)(void))MEMORY[0x192F984C0](v40);
    id v39 = 0;
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v17 options:0 error:&v39];
    id v20 = v39;
    if (v19)
    {
      v21 = +[INImage imageWithImageData:v19];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke_122;
      v37[3] = &unk_1E551BC00;
      id v38 = v10;
      [v21 _retrieveImageDataWithReply:v37];
      v22 = v38;
LABEL_25:

      v18[2](v18);
      v14 = v41;
LABEL_26:

      goto LABEL_27;
    }
    v32 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v50 = "-[_INURLImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]";
      __int16 v51 = 2114;
      id v52 = v17;
      __int16 v53 = 2114;
      id v54 = v20;
      _os_log_error_impl(&dword_18CB2F000, v32, OS_LOG_TYPE_ERROR, "%s Failed to load image from file URL %{public}@: %{public}@", buf, 0x20u);
      if (v20) {
        goto LABEL_21;
      }
    }
    else if (v20)
    {
LABEL_21:
      uint64_t v47 = *MEMORY[0x1E4F28A50];
      id v48 = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
LABEL_24:
      v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IntentsErrorDomain" code:6003 userInfo:v21];
      (*((void (**)(id, void, void, void *, double, double))v10 + 2))(v10, 0, 0, v22, 0.0, 0.0);
      goto LABEL_25;
    }
    v21 = 0;
    goto LABEL_24;
  }
LABEL_27:
}

@end