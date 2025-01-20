@interface ISConcreteIcon
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIcon:(id)a3;
- (ISConcreteIcon)initWithCoder:(id)a3;
- (ISConcreteIcon)initWithDigest:(id)a3;
- (ISImageCache)imageCache;
- (NSUUID)digest;
- (double)_aspectRatio;
- (id)_cachedImageForDescriptor:(id)a3;
- (id)_fallbackKey;
- (id)_imageForSymbolImageDescriptor:(id)a3;
- (id)_imageFromStoreForDescriptor:(id)a3;
- (id)_placeholderImageForError:(id)a3 descriptor:(id)a4;
- (id)generateImageWithDescriptor:(id)a3;
- (id)imageForDescriptor:(id)a3;
- (id)makeResourceProvider;
- (id)symbol;
- (unint64_t)assessValidationToken:(id)a3;
- (unint64_t)hash;
- (void)_prepareImagesForImageDescriptors:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)generateImageWithDescriptor:(id)a3 completion:(id)a4;
- (void)getImageForImageDescriptor:(id)a3 completion:(id)a4;
@end

@implementation ISConcreteIcon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_digest, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ISConcreteIcon *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(ISConcreteIcon *)self isEqualToIcon:v4];
  }

  return v5;
}

- (BOOL)isEqualToIcon:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ISConcreteIcon *)self digest];
  v6 = [v4 digest];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (id)imageForDescriptor:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)[v4 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v5 ignoreCache])
    {
      v6 = _ISDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v25 = self;
        __int16 v26 = 2112;
        v27 = v5;
        _os_log_impl(&dword_1AE771000, v6, OS_LOG_TYPE_INFO, "IGNORING_CACHE: %@ - %@", buf, 0x16u);
      }

      if (v5)
      {
        v7 = _ISPrepareISIconSignpostLog();
        BOOL v8 = os_signpost_enabled(v7);

        if (v8)
        {
          v9 = [NSString stringWithUTF8String:"IGNORING_CACHE: %@ - %@"];
          v10 = objc_msgSend(NSString, "stringWithFormat:", v9, self, v5);
          [(ISIcon *)self _eventPrepareISIconSignpost:v5 message:v10];
        }
      }
      v11 = 0;
    }
    else
    {
      v11 = [(ISConcreteIcon *)self _cachedImageForDescriptor:v5];
    }
    if (![v11 placeholder])
    {
      if (v11) {
        goto LABEL_27;
      }
      v17 = _ISDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v25 = self;
        __int16 v26 = 2112;
        v27 = v5;
        _os_log_impl(&dword_1AE771000, v17, OS_LOG_TYPE_INFO, "%@ RETURNING_PLACEHOLDER: %@", buf, 0x16u);
      }

      if (v5)
      {
        v18 = _ISPrepareISIconSignpostLog();
        BOOL v19 = os_signpost_enabled(v18);

        if (v19)
        {
          v20 = [NSString stringWithUTF8String:"%@ RETURNING_PLACEHOLDER: %@"];
          v21 = objc_msgSend(NSString, "stringWithFormat:", v20, self, v5);
          [(ISIcon *)self _eventPrepareISIconSignpost:v5 message:v21];
        }
      }
      v22 = (void *)MEMORY[0x1E4F6F1E8];
      v15 = [(ISConcreteIcon *)self _fallbackKey];
      v11 = [v22 _placeholderImageWithImageDescriptor:v4 markAsPlaceholder:1 fallbackTypeID:v15 referenceIcon:self];
      goto LABEL_26;
    }
    v12 = _ISDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v25 = self;
      __int16 v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_1AE771000, v12, OS_LOG_TYPE_INFO, "%@ RETURNING_STALE_PLACEHOLDER: %@", buf, 0x16u);
    }

    if (v5)
    {
      v13 = _ISPrepareISIconSignpostLog();
      BOOL v14 = os_signpost_enabled(v13);

      if (v14)
      {
        v15 = [NSString stringWithUTF8String:"%@ RETURNING_STALE_PLACEHOLDER: %@"];
        v16 = objc_msgSend(NSString, "stringWithFormat:", v15, self, v5);
        [(ISIcon *)self _eventPrepareISIconSignpost:v5 message:v16];

LABEL_26:
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [(ISConcreteIcon *)self _imageForSymbolImageDescriptor:v5];
    }
    else
    {
      v11 = 0;
    }
  }
LABEL_27:

  return v11;
}

- (id)_cachedImageForDescriptor:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ISImageCache *)self->_imageCache imageForDescriptor:v4];
  v6 = [MEMORY[0x1E4F6F1E0] defaultIconSpecification];
  [v6 maxSize];
  double v8 = v7;

  v9 = [MEMORY[0x1E4F6F1E0] defaultIconSpecification];
  [v9 maxScale];
  double v11 = v10;

  if (!v5
    || ([v5 iconSize], double v13 = v12, objc_msgSend(v4, "size"), v13 >= v14)
    || ([v5 iconSize], v15 == v8) && (objc_msgSend(v5, "scale"), v16 == v11))
  {
    [v5 minimumSize];
    double v32 = v31;
    [v4 size];
    if (v32 > v33)
    {
      uint64_t v34 = [objc_alloc(MEMORY[0x1E4F6F200]) initWithImage:v5];

      BOOL v5 = (void *)v34;
    }
    if (!v5) {
      goto LABEL_16;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F6F1E0] iosDocumentIconSpecification];
    [v4 size];
    double v19 = v18;
    double v21 = v20;
    [v4 scale];
    v23 = objc_msgSend(v17, "imageSpecificationForSize:scale:", v19, v21, v22);

    [v5 iconSize];
    double v25 = v24;
    [v23 size];
    if (v25 == v26 && ([v5 iconSize], double v28 = v27, objc_msgSend(v23, "size"), v28 == v29))
    {
      v30 = _ISDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[ISConcreteIcon _cachedImageForDescriptor:]();
      }
    }
    else
    {

      BOOL v5 = 0;
    }

    if (!v5)
    {
LABEL_16:
      BOOL v5 = [(ISConcreteIcon *)self _imageFromStoreForDescriptor:v4];
      if (v5) {
        [(ISImageCache *)self->_imageCache setImage:v5 forDescriptor:v4];
      }
    }
  }
  v35 = [v5 validationToken];

  if (v35)
  {
    v36 = [v5 validationToken];
    unint64_t v37 = [(ISConcreteIcon *)self assessValidationToken:v36];

    [v5 setPlaceholder:v37 == 2];
  }
  if (v5)
  {
    v38 = _ISDefaultLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      [v4 size];
      uint64_t v41 = v40;
      [v5 size];
      uint64_t v43 = v42;
      [v4 size];
      uint64_t v45 = v44;
      [v5 size];
      uint64_t v47 = v46;
      [v5 scale];
      int v49 = 138414338;
      v50 = self;
      __int16 v51 = 2112;
      id v52 = v4;
      __int16 v53 = 2048;
      uint64_t v54 = v41;
      __int16 v55 = 2048;
      uint64_t v56 = v43;
      __int16 v57 = 2048;
      uint64_t v58 = v45;
      __int16 v59 = 2048;
      uint64_t v60 = v47;
      __int16 v61 = 2048;
      uint64_t v62 = v48;
      __int16 v63 = 1024;
      int v64 = [v5 placeholder];
      __int16 v65 = 2112;
      v66 = v5;
    }
  }
  return v5;
}

- (unint64_t)assessValidationToken:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "_is_invalidToken");
  int v6 = [v4 isEqual:v5];

  if (!v6)
  {
    double v11 = objc_msgSend(MEMORY[0x1E4F1C9B8], "_is_staleToken");
    int v12 = [v4 isEqual:v11];

    if (v12)
    {
      double v13 = _ISTraceLog();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

      if (v14)
      {
        double v10 = _ISTraceLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[ISConcreteIcon assessValidationToken:]();
        }
        unint64_t v8 = 1;
        goto LABEL_35;
      }
      unint64_t v8 = 1;
      goto LABEL_36;
    }
    double v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "_is_validToken");
    int v16 = [v4 isEqual:v15];

    if (v16)
    {
      v17 = _ISTraceLog();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);

      if (v18)
      {
        double v10 = _ISTraceLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[ISConcreteIcon assessValidationToken:]();
        }
        unint64_t v8 = 0;
        goto LABEL_35;
      }
      unint64_t v8 = 0;
      goto LABEL_36;
    }
    id v36 = 0;
    uint64_t v37 = 0;
    objc_msgSend(MEMORY[0x1E4F22468], "_is_getSequenceNumber:andUUID:", &v37, &v36);
    double v10 = v36;
    *(void *)uu2 = 0;
    uint64_t v39 = 0;
    [v10 getUUIDBytes:uu2];
    if ([v4 length] == 40)
    {
      id v19 = v4;
      uint64_t v20 = [v19 bytes];
      if (v20)
      {
        uint64_t v21 = v20;
        if (*(void *)(v20 + 16) == v37 && !uuid_compare((const unsigned __int8 *)v20, uu2))
        {
          double v24 = _ISDefaultLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            -[ISConcreteIcon assessValidationToken:].cold.5();
          }
          unint64_t v8 = 0;
          goto LABEL_34;
        }
        double v22 = _ISDefaultLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[ISConcreteIcon assessValidationToken:]0();
        }

        v23 = [(ISConcreteIcon *)self imageCache];
        double v24 = [v23 latestValidationToken];

        if ([v24 length] == 40)
        {
          double v25 = v24;
          uint64_t v26 = [v25 bytes];
          if (v26)
          {
            int v27 = uuid_compare((const unsigned __int8 *)(v26 + 24), (const unsigned __int8 *)(v21 + 24));
            double v28 = _ISTraceLog();
            BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);

            if (v27)
            {
              if (v29)
              {
                v30 = _ISTraceLog();
                unint64_t v8 = 2;
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  -[ISConcreteIcon assessValidationToken:].cold.8();
LABEL_46:
                  unint64_t v8 = 2;
                }
LABEL_51:

                goto LABEL_34;
              }
              unint64_t v8 = 2;
            }
            else
            {
              if (v29)
              {
                v30 = _ISTraceLog();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
                  -[ISConcreteIcon assessValidationToken:].cold.7();
                }
                unint64_t v8 = 1;
                goto LABEL_51;
              }
              unint64_t v8 = 1;
            }
LABEL_54:
            double v24 = v25;
            goto LABEL_34;
          }
          uint64_t v34 = _ISTraceLog();
          unint64_t v8 = 2;
          BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG);

          if (!v35) {
            goto LABEL_54;
          }
          v30 = _ISTraceLog();
          unint64_t v8 = 2;
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_51;
          }
LABEL_45:
          -[ISConcreteIcon assessValidationToken:].cold.6();
          goto LABEL_46;
        }
        double v32 = _ISTraceLog();
        unint64_t v8 = 2;
        BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG);

        if (v33)
        {
          v30 = _ISTraceLog();
          unint64_t v8 = 2;
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_51;
          }
          goto LABEL_45;
        }
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
      double v24 = _ISDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[ISConcreteIcon assessValidationToken:].cold.4((uint64_t)v19, v24);
      }
    }
    else
    {
      double v24 = _ISDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[ISConcreteIcon assessValidationToken:]1((uint64_t)v4, v24);
      }
    }
    unint64_t v8 = 2;
    goto LABEL_34;
  }
  double v7 = _ISTraceLog();
  unint64_t v8 = 2;
  BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    double v10 = _ISTraceLog();
    unint64_t v8 = 2;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[ISConcreteIcon assessValidationToken:]();
      unint64_t v8 = 2;
    }
    goto LABEL_35;
  }
LABEL_36:

  return v8;
}

- (id)_imageFromStoreForDescriptor:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ISIcon *)self manager];
  int v6 = [v5 iconCache];
  id v34 = 0;
  id v35 = 0;
  int v7 = [v6 findStoreUnitForIcon:self descriptor:v4 UUID:&v35 validationToken:&v34];
  unint64_t v8 = (ISConcreteIcon *)v35;
  id v9 = v34;

  double v10 = 0;
  if (v7)
  {
    double v11 = [(ISIcon *)self manager];
    int v12 = [v11 iconCache];
    double v13 = [v12 storeUnitForUUID:v8];

    uint64_t v14 = [v13 data];
    if (v14
      && (double v15 = (void *)v14,
          [v13 UUID],
          int v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          v15,
          v16))
    {
      id v17 = objc_alloc(MEMORY[0x1E4F6F1E8]);
      BOOL v18 = [v13 data];
      id v19 = [v13 UUID];
      double v10 = (void *)[v17 initWithData:v18 uuid:v19 validationToken:v9];

      uint64_t v20 = _ISDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = [v10 uuid];
        *(_DWORD *)buf = 138412290;
        uint64_t v37 = v21;
        _os_log_impl(&dword_1AE771000, v20, OS_LOG_TYPE_INFO, "SATISFIED_PERSISTENT_CACHE: %@", buf, 0xCu);
      }
      if (v4)
      {
        double v22 = _ISPrepareISIconSignpostLog();
        BOOL v23 = os_signpost_enabled(v22);

        if (v23)
        {
          double v24 = [NSString stringWithUTF8String:"SATISFIED_PERSISTENT_CACHE: %@"];
          double v25 = NSString;
          uint64_t v26 = [v10 uuid];
          int v27 = objc_msgSend(v25, "stringWithFormat:", v24, v26);
          [(ISIcon *)self _eventPrepareISIconSignpost:v4 message:v27];
        }
      }
      if (v10 && [v10 CGImage]) {
        goto LABEL_17;
      }
      double v28 = _ISDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        BOOL v29 = [v13 UUID];
        v30 = [v29 UUIDString];
        uint64_t v31 = [v10 CGImage];
        *(_DWORD *)buf = 138413314;
        uint64_t v37 = self;
        __int16 v38 = 2112;
        id v39 = v4;
        __int16 v40 = 2112;
        uint64_t v41 = v30;
        __int16 v42 = 2112;
        uint64_t v43 = v10;
        __int16 v44 = 2112;
        uint64_t v45 = v31;
        _os_log_fault_impl(&dword_1AE771000, v28, OS_LOG_TYPE_FAULT, "Failed to retrieve persistent cache entry. %@ - %@ with unitUUID: %@. Image: %@. Backing: %@", buf, 0x34u);
      }
    }
    else
    {
      double v28 = _ISDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v37 = v8;
        _os_log_impl(&dword_1AE771000, v28, OS_LOG_TYPE_DEFAULT, "Store Unit: %@ not found.", buf, 0xCu);
      }
      double v10 = 0;
    }

LABEL_17:
  }
  id v32 = v10;

  return v32;
}

- (unint64_t)hash
{
  v2 = [(ISConcreteIcon *)self digest];
  uint64_t v3 = [v2 hash];
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  unint64_t v6 = [v5 hash] ^ v3;

  return v6;
}

- (NSUUID)digest
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (ISImageCache)imageCache
{
  return (ISImageCache *)objc_getProperty(self, a2, 32, 1);
}

- (ISConcreteIcon)initWithDigest:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ISConcreteIcon;
  unint64_t v6 = [(ISCodableIcon *)&v10 _init];
  if (v6)
  {
    int v7 = objc_alloc_init(ISImageCache);
    imageCache = v6->_imageCache;
    v6->_imageCache = v7;

    objc_storeStrong((id *)&v6->_digest, a3);
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ISConcreteIcon *)self digest];
  [v4 encodeObject:v5 forKey:@"digest"];
}

- (ISConcreteIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ISConcreteIcon;
  id v5 = [(ISCodableIcon *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"digest"];
    digest = v5->_digest;
    v5->_digest = (NSUUID *)v6;

    unint64_t v8 = objc_alloc_init(ISImageCache);
    imageCache = v5->_imageCache;
    v5->_imageCache = v8;
  }
  return v5;
}

- (id)_fallbackKey
{
  return (id)*MEMORY[0x1E4F22608];
}

- (id)makeResourceProvider
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Abstract method called." reason:0 userInfo:0];
  objc_exception_throw(v2);
}

- (id)_placeholderImageForError:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_placeholderImageForError_descriptor__once != -1) {
    dispatch_once(&_placeholderImageForError_descriptor__once, &__block_literal_global_9);
  }
  if (_placeholderImageForError_descriptor__isInternal == 1 && _ISErrorIsXPCConnectionInterrupted(v6))
  {
    unint64_t v8 = (void *)MEMORY[0x1E4F6F1E8];
    id v9 = [(ISConcreteIcon *)self _fallbackKey];
    uint64_t v10 = [v8 _debugPlaceholderImageWithImageDescriptor:v7 markAsPlaceholder:0 fallbackTypeID:v9 referenceIcon:self];
  }
  else
  {
    objc_super v11 = (void *)MEMORY[0x1E4F6F1E8];
    id v9 = [(ISConcreteIcon *)self _fallbackKey];
    uint64_t v10 = [v11 _placeholderImageWithImageDescriptor:v7 markAsPlaceholder:0 fallbackTypeID:v9 referenceIcon:self];
  }
  int v12 = (void *)v10;

  return v12;
}

uint64_t __55__ISConcreteIcon__placeholderImageForError_descriptor___block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  if (result) {
    _placeholderImageForError_descriptor__isInternal = 1;
  }
  return result;
}

- (id)generateImageWithDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(ISGenerationRequest);
  [(ISGenerationRequest *)v5 setImageDescriptor:v4];
  [(ISGenerationRequest *)v5 setIcon:self];
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  BOOL v18 = __Block_byref_object_copy__0;
  id v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke;
  v11[3] = &unk_1E5F091C0;
  v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = v5;
  double v13 = v7;
  uint64_t v14 = &v15;
  id v8 = _ISRetryRequest((uint64_t)v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

id __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke(uint64_t a1)
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  BOOL v23 = __Block_byref_object_copy__0;
  double v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_2;
  v17[3] = &unk_1E5F09170;
  id v4 = *(void **)(a1 + 40);
  v17[4] = *(void *)(a1 + 32);
  id v18 = v4;
  id v19 = &v20;
  id v5 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v17];

  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_20;
  v13[3] = &unk_1E5F09198;
  v13[4] = *(void *)(a1 + 32);
  id v8 = v6;
  uint64_t v9 = *(void *)(a1 + 56);
  id v14 = v8;
  uint64_t v15 = v9;
  int v16 = &v20;
  [v5 generateImageWithRequest:v7 reply:v13];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = (void *)v21[5];
  }
  id v11 = v10;

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _ISDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    uint64_t v5 = _ISDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_20_cold_1(a1, v3, v5);
    }
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F6F1E8]);
    uint64_t v7 = [v3 data];
    id v8 = [v3 uuid];
    uint64_t v9 = [v3 validationToken];
    uint64_t v10 = [v6 initWithData:v7 uuid:v8 validationToken:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v13 = [*(id *)(a1 + 32) _placeholderImageForError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) descriptor:*(void *)(a1 + 40)];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

- (void)_prepareImagesForImageDescriptors:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0x1E5F08000uLL;
    uint64_t v7 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v10 = (void *)MEMORY[0x1B3E70EF0]();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v11 = COERCE_DOUBLE([v9 copy]);
          id v12 = +[ISDefaults sharedInstance];
          [v12 prepareImageDelay];
          double v14 = v13;

          if (v14 > 0.0)
          {
            uint64_t v15 = _ISDefaultLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              __int16 v40 = self;
              __int16 v41 = 2048;
              double v42 = v14 * 1000000.0;
              __int16 v43 = 2112;
              double v44 = v11;
              _os_log_impl(&dword_1AE771000, v15, OS_LOG_TYPE_INFO, "DELAYING_PREPARE: %@ - delay: %lf , %@", buf, 0x20u);
            }

            if (v11 != 0.0)
            {
              int v16 = _ISPrepareISIconSignpostLog();
              BOOL v17 = os_signpost_enabled(v16);

              if (v17)
              {
                id v18 = [NSString stringWithUTF8String:"DELAYING_PREPARE: %@ - delay: %lf, %@"];
                id v19 = objc_msgSend(NSString, "stringWithFormat:", v18, self, v14 * 1000000.0, *(void *)&v11);
                [(ISIcon *)self _eventPrepareISIconSignpost:*(void *)&v11 message:v19];
              }
            }
            usleep((v14 * 1000000.0));
          }
          if ([*(id *)&v11 ignoreCache])
          {
            uint64_t v20 = _ISDefaultLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              __int16 v40 = self;
              __int16 v41 = 2112;
              double v42 = v11;
              _os_log_impl(&dword_1AE771000, v20, OS_LOG_TYPE_INFO, "PREPARE_IGNORING_CACHE: %@ - %@", buf, 0x16u);
            }

            if (v11 != 0.0)
            {
              uint64_t v21 = _ISPrepareISIconSignpostLog();
              BOOL v22 = os_signpost_enabled(v21);

              if (v22)
              {
                BOOL v23 = [NSString stringWithUTF8String:"PREPARE_IGNORING_CACHE: %@ - %@"];
                double v24 = objc_msgSend(NSString, "stringWithFormat:", v23, self, *(void *)&v11);
                [(ISIcon *)self _eventPrepareISIconSignpost:*(void *)&v11 message:v24];
              }
            }
            id v25 = 0;
LABEL_23:
            unint64_t v27 = v6;
            double v28 = _ISDefaultLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              __int16 v40 = self;
              __int16 v41 = 2112;
              double v42 = v11;
              _os_log_impl(&dword_1AE771000, v28, OS_LOG_TYPE_INFO, "PREPARE_IMAGE: %@ - %@", buf, 0x16u);
            }

            if (v11 != 0.0)
            {
              BOOL v29 = _ISPrepareISIconSignpostLog();
              BOOL v30 = os_signpost_enabled(v29);

              if (v30)
              {
                uint64_t v31 = [NSString stringWithUTF8String:"PREPARE_IMAGE: %@ - %@"];
                id v32 = objc_msgSend(NSString, "stringWithFormat:", v31, self, *(void *)&v11);
                [(ISIcon *)self _eventPrepareISIconSignpost:*(void *)&v11 message:v32];
              }
            }
            BOOL v33 = [(ISConcreteIcon *)self generateImageWithDescriptor:*(void *)&v11];
            [(ISImageCache *)self->_imageCache setImage:v33 forDescriptor:*(void *)&v11];

            unint64_t v6 = v27;
          }
          else
          {
            uint64_t v26 = [(ISConcreteIcon *)self _cachedImageForDescriptor:*(void *)&v11];
            id v25 = v26;
            if (!v26 || [v26 placeholder]) {
              goto LABEL_23;
            }
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v5);
  }
}

- (id)_imageForSymbolImageDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ISConcreteIcon *)self makeSymbolResourceProvider];
  unint64_t v6 = [v5 symbol];
  uint64_t v7 = [v6 imageForDescriptor:v4];

  return v7;
}

- (id)symbol
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = [(ISConcreteIcon *)self makeSymbolResourceProvider];
  id v4 = [v3 symbol];
  if (!v4)
  {
    uint64_t v5 = _ISDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = self;
      _os_log_impl(&dword_1AE771000, v5, OS_LOG_TYPE_INFO, "Failed to get symbol for %@", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4;
}

- (void)generateImageWithDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(ISGenerationRequest);
  uint64_t v9 = (void *)[v6 copy];
  [(ISGenerationRequest *)v8 setImageDescriptor:v9];

  [(ISGenerationRequest *)v8 setIcon:self];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__0;
  v26[4] = __Block_byref_object_dispose__0;
  id v27 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __57__ISConcreteIcon_generateImageWithDescriptor_completion___block_invoke;
  v22[3] = &unk_1E5F091E8;
  v22[4] = self;
  id v10 = v6;
  id v23 = v10;
  id v25 = v26;
  id v11 = v7;
  id v24 = v11;
  id v12 = (void *)MEMORY[0x1B3E71130](v22);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__ISConcreteIcon_generateImageWithDescriptor_completion___block_invoke_32;
  v17[3] = &unk_1E5F09238;
  uint64_t v21 = v26;
  v17[4] = self;
  id v13 = v10;
  id v18 = v13;
  id v14 = v12;
  id v20 = v14;
  uint64_t v15 = v8;
  id v19 = v15;
  id v16 = _ISRetryRequest((uint64_t)v17);

  _Block_object_dispose(v26, 8);
}

void __57__ISConcreteIcon_generateImageWithDescriptor_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    uint64_t v5 = _ISDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_20_cold_1(a1, v3, v5);
    }
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F6F1E8]);
    id v8 = [v3 data];
    uint64_t v9 = [v3 uuid];
    id v10 = [v3 validationToken];
    id v6 = (void *)[v7 initWithData:v8 uuid:v9 validationToken:v10];

    if (v6) {
      goto LABEL_7;
    }
  }
  id v6 = [*(id *)(a1 + 32) _placeholderImageForError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) descriptor:*(void *)(a1 + 40)];
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id __57__ISConcreteIcon_generateImageWithDescriptor_completion___block_invoke_32(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 64) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id v4 = [*(id *)(a1 + 32) manager];
  uint64_t v5 = [v4 connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__ISConcreteIcon_generateImageWithDescriptor_completion___block_invoke_2;
  v12[3] = &unk_1E5F09210;
  id v6 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v6;
  long long v11 = *(_OWORD *)(a1 + 56);
  id v7 = (id)v11;
  long long v14 = v11;
  id v8 = [v5 remoteObjectProxyWithErrorHandler:v12];

  [v8 generateImageWithRequest:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
  id v9 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);

  return v9;
}

void __57__ISConcreteIcon_generateImageWithDescriptor_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _ISDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __57__ISConcreteIcon_generateImageWithDescriptor_completion___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [[ISGenerationResponse alloc] initWithError:v7];
  (*(void (**)(uint64_t, ISGenerationResponse *))(v8 + 16))(v8, v9);
}

- (void)getImageForImageDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(ISConcreteIcon *)self imageForDescriptor:v6];
  id v9 = v8;
  if ((v8 && ![v8 placeholder]
     || ([(ISConcreteIcon *)self _imageFromStoreForDescriptor:v6],
         uint64_t v10 = objc_claimAutoreleasedReturnValue(),
         v9,
         (id v9 = (void *)v10) != 0))
    && ![v9 placeholder])
  {
    v7[2](v7, v9);
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__ISConcreteIcon_getImageForImageDescriptor_completion___block_invoke;
    v11[3] = &unk_1E5F09260;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    [(ISConcreteIcon *)self generateImageWithDescriptor:v12 completion:v11];
  }
}

void __56__ISConcreteIcon_getImageForImageDescriptor_completion___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v5 = a2;
  id v4 = [v3 imageCache];
  [v4 setImage:v5 forDescriptor:a1[5]];

  (*(void (**)(void))(a1[6] + 16))();
}

- (double)_aspectRatio
{
  return 0.75;
}

- (void)_cachedImageForDescriptor:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AE771000, v0, v1, "Accepting image with document icon dimensions match", v2, v3, v4, v5, v6);
}

- (void)assessValidationToken:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AE771000, v0, v1, "VALIDATION_TOKEN_ASSMENT: invalid - constant", v2, v3, v4, v5, v6);
}

- (void)assessValidationToken:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AE771000, v0, v1, "VALIDATION_TOKEN_ASSMENT: stale - constant", v2, v3, v4, v5, v6);
}

- (void)assessValidationToken:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AE771000, v0, v1, "VALIDATION_TOKEN_ASSMENT: valid - constant", v2, v3, v4, v5, v6);
}

- (void)assessValidationToken:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1AE771000, a2, OS_LOG_TYPE_FAULT, "Invalid validation token data: %@", (uint8_t *)&v2, 0xCu);
}

- (void)assessValidationToken:.cold.5()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AE771000, v0, v1, "VALIDATION_TOKEN_ASSMENT: valid - LSDB state match", v2, v3, v4, v5, v6);
}

- (void)assessValidationToken:.cold.6()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AE771000, v0, v1, "VALIDATION_TOKEN_ASSMENT: invalid - no local validation token", v2, v3, v4, v5, v6);
}

- (void)assessValidationToken:.cold.7()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AE771000, v0, v1, "VALIDATION_TOKEN_ASSMENT: stale - resource UUID match", v2, v3, v4, v5, v6);
}

- (void)assessValidationToken:.cold.8()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AE771000, v0, v1, "VALIDATION_TOKEN_ASSMENT: invalid - resource UUID changed", v2, v3, v4, v5, v6);
}

- (void)assessValidationToken:.cold.10()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AE771000, v0, v1, "VALIDATION_TOKEN_ASSMENT: LSDB state missmatch", v2, v3, v4, v5, v6);
}

- (void)assessValidationToken:(uint64_t)a1 .cold.11(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1AE771000, a2, OS_LOG_TYPE_FAULT, "Invalid validation token data size: %@", (uint8_t *)&v2, 0xCu);
}

void __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_1AE771000, v0, (uint64_t)v0, "Failed to generate image for %@ - %@. Error: %@", v1);
}

void __46__ISConcreteIcon_generateImageWithDescriptor___block_invoke_20_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 error];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_1AE771000, a3, v5, "Error returned from iconservicesagent image request: %@ - %@ error: %@", v6);
}

void __57__ISConcreteIcon_generateImageWithDescriptor_completion___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_1AE771000, v0, (uint64_t)v0, "Failed to generate image with handler for %@ - %@. Error: %@", v1);
}

@end