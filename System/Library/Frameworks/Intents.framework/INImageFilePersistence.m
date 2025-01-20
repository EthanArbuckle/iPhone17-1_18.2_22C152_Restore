@interface INImageFilePersistence
+ (NSDate)lastEphemeralStorePurgingDate;
+ (void)setLastEphemeralStorePurgingDate:(id)a3;
- (BOOL)canStoreImage:(id)a3;
- (INImageFilePersistence)init;
- (NSArray)_supportedClasses;
- (NSString)serviceIdentifier;
- (id)_deleteItemAtFilePath:(id)a3;
- (id)_filePathForImageWithFileName:(id)a3;
- (id)filePathForImageWithIdentifier:(id)a3 error:(id *)a4;
- (id)storeImage:(id)a3 scaled:(BOOL)a4 qualityOfService:(unsigned int)a5 storeType:(unint64_t)a6 error:(id *)a7;
- (unint64_t)servicePriority;
- (void)_setSupportedClasses:(id)a3;
- (void)purgeExpiredImagesInEphemeralStore;
- (void)purgeExpiredImagesInEphemeralStore:(BOOL)a3;
- (void)purgeImageWithIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveImageWithIdentifier:(id)a3 completion:(id)a4;
@end

@implementation INImageFilePersistence

- (NSString)serviceIdentifier
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 stringWithFormat:@"com.apple.intents.%@", v4];

  return (NSString *)v5;
}

- (unint64_t)servicePriority
{
  return 50;
}

- (INImageFilePersistence)init
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)INImageFilePersistence;
  v2 = [(INImageFilePersistence *)&v5 init];
  if (v2)
  {
    v6[0] = objc_opt_class();
    v6[1] = objc_opt_class();
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
    [(INImageFilePersistence *)v2 _setSupportedClasses:v3];
  }
  return v2;
}

- (void)_setSupportedClasses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__supportedClasses, 0);

  objc_storeStrong((id *)&self->_imageBundle, 0);
}

- (NSArray)_supportedClasses
{
  return self->__supportedClasses;
}

- (id)_deleteItemAtFilePath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = 0;
  int v5 = [v4 removeItemAtPath:v3 error:&v11];
  id v6 = v11;

  if (v5)
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[INImageFilePersistence _deleteItemAtFilePath:]";
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_INFO, "%s Successfully deleted image data at file path %@", buf, 0x16u);
    }
  }
  else if (!v6)
  {
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28228];
    v13 = @"Could not find image";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v6 = [v8 errorWithDomain:@"IntentsErrorDomain" code:6004 userInfo:v9];
  }

  return v6;
}

- (id)_filePathForImageWithFileName:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = v3;
  id v6 = _INImageFilePersistenceDirectoryPathWithStoreTypeCreateIfNeeded(1);
  v7 = [v6 stringByAppendingPathComponent:v5];

  if (v7) {
    [v4 addObject:v7];
  }
  id v8 = v5;
  v9 = _INImageFilePersistenceDirectoryPathWithStoreTypeCreateIfNeeded(2);
  v10 = [v9 stringByAppendingPathComponent:v8];

  if (v10) {
    [v4 addObject:v10];
  }
  if (![v4 count])
  {
    id v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[INImageFilePersistence _filePathForImageWithFileName:]";
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_INFO, "%s No possible file paths for image with file name %@", buf, 0x16u);
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    v23 = v7;
    uint64_t v15 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v19 = [v18 fileExistsAtPath:v17];

        if (v19)
        {
          v21 = INSiriLogContextIntents;
          if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v29 = "-[INImageFilePersistence _filePathForImageWithFileName:]";
            __int16 v30 = 2112;
            id v31 = v8;
            __int16 v32 = 2112;
            v33 = v17;
            _os_log_impl(&dword_18CB2F000, v21, OS_LOG_TYPE_INFO, "%s Found image data for file name %@ at file path %@", buf, 0x20u);
          }
          id v20 = v17;
          goto LABEL_20;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (v14) {
        continue;
      }
      break;
    }
    id v20 = 0;
LABEL_20:
    v7 = v23;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (void)purgeImageWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
  v7 = [a3 stringByReplacingOccurrencesOfString:@"/" withString:&stru_1EDA6DB28];
  id v8 = [v7 stringByReplacingOccurrencesOfString:@".." withString:&stru_1EDA6DB28];

  v9 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[INImageFilePersistence purgeImageWithIdentifier:completion:]";
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s Attempting to purge image with identifier %@ from file persistence", (uint8_t *)&v12, 0x16u);
  }
  v10 = [(INImageFilePersistence *)self _filePathForImageWithFileName:v8];
  id v11 = [(INImageFilePersistence *)self _deleteItemAtFilePath:v10];
  if (v6) {
    v6[2](v6, v11);
  }
}

- (void)retrieveImageWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, id, void *))a4;
  if (v7)
  {
    id v8 = [v6 stringByReplacingOccurrencesOfString:@"/" withString:&stru_1EDA6DB28];
    v9 = [v8 stringByReplacingOccurrencesOfString:@".." withString:&stru_1EDA6DB28];

    v10 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[INImageFilePersistence retrieveImageWithIdentifier:completion:]";
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_impl(&dword_18CB2F000, v10, OS_LOG_TYPE_INFO, "%s Attempting to retrieve image with identifier %@ using file persistence", buf, 0x16u);
    }
    id v11 = [(INImageFilePersistence *)self _filePathForImageWithFileName:v9];
    if (v11)
    {
      id v34 = 0;
      int v12 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v11 options:1 error:&v34];
      id v13 = v34;
      if (v13)
      {
        __int16 v14 = v13;
        uint64_t v15 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v36 = "-[INImageFilePersistence retrieveImageWithIdentifier:completion:]";
          __int16 v37 = 2112;
          id v38 = v14;
          __int16 v39 = 2112;
          v40 = v9;
          __int16 v41 = 2112;
          v42 = v11;
          _os_log_error_impl(&dword_18CB2F000, v15, OS_LOG_TYPE_ERROR, "%s Encountered error %@ when reading image data for identifier %@ at file path %@", buf, 0x2Au);
        }
        id v16 = 0;
        int v17 = 1;
      }
      else if (v12)
      {
        v23 = [v9 pathExtension];
        int v24 = [v23 isEqualToString:@"png"];

        if (v24)
        {
          id v22 = +[INImage imageWithImageData:v12];
          id v25 = _INImageSizeProviderClass();
          if (v25)
          {
            [v25 imageSizeForImage:v22];
            objc_msgSend(v22, "_setImageSize:");
          }
          id v16 = 0;
        }
        else
        {
          long long v26 = (void *)MEMORY[0x1E4F28DC0];
          long long v27 = (void *)MEMORY[0x1E4F1CAD0];
          v28 = +[INImage _classesInCluster];
          v29 = [v27 setWithArray:v28];
          id v33 = 0;
          __int16 v30 = [v26 unarchivedObjectOfClasses:v29 fromData:v12 error:&v33];
          id v16 = v33;

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v31 = v30;
          }
          else {
            id v31 = 0;
          }
          id v22 = v31;
          if (v16)
          {
            __int16 v32 = INSiriLogContextIntents;
            if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              v36 = "-[INImageFilePersistence retrieveImageWithIdentifier:completion:]";
              __int16 v37 = 2112;
              id v38 = v16;
              __int16 v39 = 2112;
              v40 = v9;
              __int16 v41 = 2112;
              v42 = v11;
              _os_log_error_impl(&dword_18CB2F000, v32, OS_LOG_TYPE_ERROR, "%s Encountered error %@ when unarchiving image data for identifier %@ at file path %@", buf, 0x2Au);
            }
          }
        }
        __int16 v14 = 0;
        if (v22)
        {
          v21 = 0;
LABEL_18:
          v7[2](v7, v22, v21);

          goto LABEL_19;
        }
        int v17 = 0;
      }
      else
      {
        id v16 = 0;
        int v17 = 0;
        __int16 v14 = 0;
      }
    }
    else
    {
      id v16 = 0;
      int v17 = 0;
      __int16 v14 = 0;
      int v12 = 0;
    }
    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    int v19 = [NSString stringWithFormat:@"Failed to retrieve image with identifier %@ from storage service %@", v9, self];
    [v18 setObject:v19 forKey:*MEMORY[0x1E4F28568]];

    if ((v17 & 1) != 0 || v16)
    {
      if (v17) {
        id v20 = v14;
      }
      else {
        id v20 = v16;
      }
      [v18 setObject:v20 forKey:*MEMORY[0x1E4F28A50]];
    }
    v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IntentsErrorDomain" code:6004 userInfo:v18];

    id v22 = 0;
    goto LABEL_18;
  }
  v9 = v6;
LABEL_19:
}

- (id)storeImage:(id)a3 scaled:(BOOL)a4 qualityOfService:(unsigned int)a5 storeType:(unint64_t)a6 error:(id *)a7
{
  BOOL v9 = a4;
  v93[1] = *MEMORY[0x1E4F143B8];
  id v11 = (_INDataImage *)a3;
  if (![(INImageFilePersistence *)self canStoreImage:v11])
  {
    if (!a7) {
      goto LABEL_54;
    }
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v92 = *MEMORY[0x1E4F28568];
    id v22 = NSString;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    int v19 = (_INDataImage *)objc_claimAutoreleasedReturnValue();
    int v24 = [v22 stringWithFormat:@"Image class %@ not supported by store", v19];
    v93[0] = v24;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:&v92 count:1];
    *a7 = [v21 errorWithDomain:@"IntentsErrorDomain" code:6002 userInfo:v25];

    goto LABEL_44;
  }
  [(INImageFilePersistence *)self purgeExpiredImagesInEphemeralStore:0];
  int v12 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v89 = "-[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]";
    __int16 v90 = 2112;
    v91 = v11;
    _os_log_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_INFO, "%s Attempting to store image %@ using file persistence", buf, 0x16u);
  }
  id v13 = [(_INDataImage *)v11 _imageData];

  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v14 = v11;
    }
    else {
      __int16 v14 = 0;
    }
    uint64_t v15 = v14;
    if (v15)
    {
      id v16 = v15;
      int v17 = [_INDataImage alloc];
      uint64_t v18 = [(_INDataImage *)v11 _imageData];
      int v19 = [(_INDataImage *)v17 initWithImageData:v18];

      [(INImage *)v11 _preferredScaledSize];
      -[INImage _setPreferredScaledSize:](v19, "_setPreferredScaledSize:");
      if (v9)
      {
LABEL_10:
        id v20 = [(INImage *)v19 _in_downscaledImageForFilePersistence];
LABEL_19:
        v28 = v20;
        v29 = [(_INDataImage *)v20 _imageData];
        if (!v29 && v9)
        {
          __int16 v30 = INSiriLogContextIntents;
          if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v89 = "-[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]";
            __int16 v90 = 2112;
            v91 = v19;
            _os_log_error_impl(&dword_18CB2F000, v30, OS_LOG_TYPE_ERROR, "%s No scaled image data, falling back to unscaled data image: %@", buf, 0x16u);
          }
          v29 = [(_INDataImage *)v19 _imageData];
        }
        if (v29)
        {
          id v83 = 0;
          id v31 = objc_msgSend(v29, "_in_writeDataToPathForImage:storeType:error:", v19, a6, &v83);
          id v32 = v83;
          if (v31)
          {
            id v33 = v31;
            a7 = v33;
LABEL_51:

            goto LABEL_52;
          }
          v59 = [MEMORY[0x1E4F1CA60] dictionary];
          v60 = NSString;
          v61 = [(_INDataImage *)v11 description];
          v62 = [v60 stringWithFormat:@"Failed to store image %@ in service %@", v61, self];
          [v59 setObject:v62 forKey:*MEMORY[0x1E4F28568]];

          if (v32) {
            [v59 setObject:v32 forKey:*MEMORY[0x1E4F28A50]];
          }
          if (a7)
          {
            *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IntentsErrorDomain" code:6002 userInfo:v59];
          }

          id v33 = 0;
        }
        else
        {
          if (!a7)
          {
LABEL_52:

            goto LABEL_53;
          }
          id v34 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v86 = *MEMORY[0x1E4F28568];
          uint64_t v35 = NSString;
          id v32 = [(_INDataImage *)v11 description];
          id v33 = [v35 stringWithFormat:@"Failed to store image %@ in service %@", v32, self];
          v87 = v33;
          v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
          id v37 = [v34 errorWithDomain:@"IntentsErrorDomain" code:6002 userInfo:v36];
          *a7 = v37;
        }
        a7 = 0;
        goto LABEL_51;
      }
    }
    else
    {
      int v19 = 0;
      if (v9) {
        goto LABEL_10;
      }
    }
    id v20 = v19;
    goto LABEL_19;
  }
  int v19 = [(INImage *)v11 _uri];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v26 = [(INImage *)v11 _sandboxExtensionData];
    if (v26)
    {
      int v27 = [(_INDataImage *)v19 startAccessingSecurityScopedResource];

      LODWORD(v26) = 1;
      if (!v19) {
        goto LABEL_40;
      }
      goto LABEL_31;
    }
  }
  else
  {
    LODWORD(v26) = 0;
  }
  int v27 = 1;
  if (v19)
  {
LABEL_31:
    if (([(_INDataImage *)v19 isFileURL] & v27) != 1) {
      goto LABEL_40;
    }
    [MEMORY[0x1E4F28CB8] defaultManager];
    v80 = a7;
    long long v26 = v38 = (int)v26;
    __int16 v39 = [(_INDataImage *)v19 path];
    int v40 = [v26 fileExistsAtPath:v39];

    LODWORD(v26) = v38;
    a7 = v80;
    if (!v40) {
      goto LABEL_40;
    }
    __int16 v41 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v89 = "-[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]";
      __int16 v90 = 2112;
      v91 = v11;
      _os_log_impl(&dword_18CB2F000, v41, OS_LOG_TYPE_INFO, "%s Copying file URL image to intents directory: %@", buf, 0x16u);
    }
    v42 = [(INImage *)v11 _in_writeableFilePersistenceConfigurationForStoreType:a6];
    uint64_t v43 = [v42 filePath];
    v44 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v45 = [v44 fileExistsAtPath:v43];

    if (!v45) {
      goto LABEL_61;
    }
    v46 = [MEMORY[0x1E4F28CB8] defaultManager];
    v47 = [(_INDataImage *)v19 filePathURL];
    v48 = [v47 absoluteString];
    int v49 = [v46 contentsEqualAtPath:v43 andPath:v48];

    v50 = &INThisProcessIsAssistantd_onceToken;
    v51 = INSiriLogContextIntents;
    BOOL v52 = os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO);
    if (v49)
    {
      if (v52)
      {
        *(_DWORD *)buf = 136315394;
        v89 = "-[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]";
        __int16 v90 = 2112;
        v91 = v11;
        _os_log_impl(&dword_18CB2F000, v51, OS_LOG_TYPE_INFO, "%s URL image already exists and is the same at destination path: %@, not copying (but updating modified date)", buf, 0x16u);
      }
      id v53 = _INImageFilePersistenceUpdateModifiedDateAtFilePath(v43);
LABEL_72:
      v77 = v50[38];
      int v70 = 1;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v89 = "-[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]";
        __int16 v90 = 2112;
        v91 = v43;
        _os_log_impl(&dword_18CB2F000, v77, OS_LOG_TYPE_INFO, "%s URL image now available at file path: %@", buf, 0x16u);
      }
      id v67 = 0;
      goto LABEL_75;
    }
    if (v52)
    {
      *(_DWORD *)buf = 136315394;
      v89 = "-[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]";
      __int16 v90 = 2112;
      v91 = v11;
      _os_log_impl(&dword_18CB2F000, v51, OS_LOG_TYPE_INFO, "%s URL image already exists and is different at destination path: %@, removing the old one and copying", buf, 0x16u);
    }
    v64 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v65 = [v64 isDeletableFileAtPath:v43];

    if ((v65 & 1) == 0)
    {
      v76 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v89 = "-[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]";
        __int16 v90 = 2112;
        v91 = v11;
        _os_log_error_impl(&dword_18CB2F000, v76, OS_LOG_TYPE_ERROR, "%s URL image at destination path is not deleteable: %@", buf, 0x16u);
      }
      goto LABEL_72;
    }
    v66 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v82 = 0;
    [v66 removeItemAtPath:v43 error:&v82];
    id v67 = v82;

    if (!v67)
    {
LABEL_61:
      v68 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v43];
      v69 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v81 = 0;
      [v69 copyItemAtURL:v19 toURL:v68 error:&v81];
      id v67 = v81;

      if (!v67)
      {
        if (v9)
        {
          v71 = +[INImage imageWithURL:v68];
          [(INImage *)v11 _preferredScaledSize];
          objc_msgSend(v71, "_setPreferredScaledSize:");
          v72 = objc_msgSend(v71, "_in_downscaledImageForFilePersistence");
          v73 = [v72 _uri];
          if (!v73)
          {
            v74 = INSiriLogContextIntents;
            if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v89 = "-[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]";
              __int16 v90 = 2112;
              v91 = v68;
              _os_log_error_impl(&dword_18CB2F000, v74, OS_LOG_TYPE_ERROR, "%s Failed to scale image at URL %@", buf, 0x16u);
            }
          }
        }
        id v75 = _INImageFilePersistenceUpdateModifiedDateAtFilePath(v43);

        v50 = &INThisProcessIsAssistantd_onceToken;
        goto LABEL_72;
      }
    }
    int v70 = 0;
LABEL_75:
    v78 = [v42 identifier];
    if (v80) {
      id *v80 = v67;
    }
    if (v70) {
      v79 = v78;
    }
    else {
      v79 = 0;
    }
    a7 = v79;

    goto LABEL_53;
  }
LABEL_40:
  if (a7)
  {
    v54 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v84 = *MEMORY[0x1E4F28568];
    int v55 = (int)v26;
    v56 = NSString;
    v57 = [(_INDataImage *)v11 description];
    v58 = [v56 stringWithFormat:@"No valid data to store for image %@ in service %@", v57, self];
    v85 = v58;
    long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
    *a7 = [v54 errorWithDomain:@"IntentsErrorDomain" code:6002 userInfo:v26];

    LODWORD(v26) = v55;
  }
  if ((v26 & v27) == 1) {
    [(_INDataImage *)v19 stopAccessingSecurityScopedResource];
  }
LABEL_44:
  a7 = 0;
LABEL_53:

LABEL_54:

  return a7;
}

- (id)filePathForImageWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(INImageFilePersistence *)self _filePathForImageWithFileName:v6];
  if (v7)
  {
    a4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
    goto LABEL_6;
  }
  id v8 = INSiriLogContextIntents;
  if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  *(_DWORD *)buf = 136315394;
  uint64_t v15 = "-[INImageFilePersistence filePathForImageWithIdentifier:error:]";
  __int16 v16 = 2112;
  id v17 = v6;
  _os_log_error_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_ERROR, "%s Failed to retrieve file path for image: %@", buf, 0x16u);
  if (a4)
  {
LABEL_5:
    BOOL v9 = [NSString stringWithFormat:@"Failed to retrieve image file path with identifier %@ from storage service %@", v6, self, *MEMORY[0x1E4F28568]];
    id v13 = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];

    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IntentsErrorDomain" code:6004 userInfo:v10];

    a4 = 0;
  }
LABEL_6:

  return a4;
}

- (BOOL)canStoreImage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(INImageFilePersistence *)self _supportedClasses];
    if ([v5 containsObject:objc_opt_class()])
    {
      id v6 = objc_msgSend(v4, "_in_writeableFilePersistenceConfigurationForStoreType:", 0);
      BOOL v7 = v6 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)purgeExpiredImagesInEphemeralStore:(BOOL)a3
{
  v65[2] = *MEMORY[0x1E4F143B8];
  id v3 = &INThisProcessIsAssistantd_onceToken;
  id v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v56 = "-[INImageFilePersistence purgeExpiredImagesInEphemeralStore:]";
    _os_log_impl(&dword_18CB2F000, v4, OS_LOG_TYPE_INFO, "%s Looking for images that have expired in the ephemeral store", buf, 0xCu);
  }
  id v5 = [(id)objc_opt_class() lastEphemeralStorePurgingDate];
  id v6 = v5;
  if (!v5 || ([v5 timeIntervalSinceNow], v7 <= -180.0))
  {
    int v45 = v6;
    v44 = _INImageFilePersistenceDirectoryPathWithStoreTypeCreateIfNeeded(1);
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");
    BOOL v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v10 = *MEMORY[0x1E4F1C628];
    uint64_t v11 = *MEMORY[0x1E4F1C530];
    v65[0] = *MEMORY[0x1E4F1C628];
    v65[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
    id v54 = 0;
    uint64_t v43 = (void *)v8;
    id v13 = [v9 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:v12 options:5 error:&v54];
    id v14 = v54;

    if (!v13)
    {
      uint64_t v15 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "-[INImageFilePersistence purgeExpiredImagesInEphemeralStore:]";
        __int16 v57 = 2112;
        id v58 = v14;
        _os_log_error_impl(&dword_18CB2F000, v15, OS_LOG_TYPE_ERROR, "%s Failed to purge ephemeral images with error: %@", buf, 0x16u);
      }
    }
    v42 = v14;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v13;
    uint64_t v16 = [obj countByEnumeratingWithState:&v50 objects:v64 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v48 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v51 != v48) {
            objc_enumerationMutation(obj);
          }
          int v19 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          v63[0] = v10;
          v63[1] = v11;
          id v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v63, 2, v42);
          id v49 = 0;
          v21 = [v19 resourceValuesForKeys:v20 error:&v49];
          id v22 = v49;

          if (v21)
          {
            v23 = [v21 objectForKeyedSubscript:v10];
            char v24 = [v23 BOOLValue];

            if ((v24 & 1) == 0)
            {
              id v25 = [v19 path];
              long long v26 = [v21 objectForKeyedSubscript:v11];
              int v27 = v26;
              if (v26)
              {
                [v26 timeIntervalSinceNow];
                double v29 = fabs(v28);
                if (v29 > 7776000.0)
                {
                  __int16 v30 = v3[38];
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                  {
                    id v31 = NSNumber;
                    id v32 = v30;
                    id v33 = [v31 numberWithDouble:v29];
                    *(_DWORD *)buf = 136315906;
                    v56 = "-[INImageFilePersistence purgeExpiredImagesInEphemeralStore:]";
                    __int16 v57 = 2112;
                    id v58 = v25;
                    __int16 v59 = 2112;
                    v60 = &unk_1EDBA79D0;
                    __int16 v61 = 2112;
                    v62 = v33;
                    _os_log_impl(&dword_18CB2F000, v32, OS_LOG_TYPE_INFO, "%s Deleting item at path %@ as it has exceeded the expiration duration interval of %@ with an interval of %@", buf, 0x2Au);
                  }
                  id v34 = [(INImageFilePersistence *)self _deleteItemAtFilePath:v25];
                  if (v34)
                  {
                    uint64_t v35 = INSiriLogContextIntents;
                    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315650;
                      v56 = "-[INImageFilePersistence purgeExpiredImagesInEphemeralStore:]";
                      __int16 v57 = 2112;
                      id v58 = v25;
                      __int16 v59 = 2112;
                      v60 = v34;
                      _os_log_error_impl(&dword_18CB2F000, v35, OS_LOG_TYPE_ERROR, "%s Failed to delete file at path %@: %@", buf, 0x20u);
                    }
                  }

                  id v3 = &INThisProcessIsAssistantd_onceToken;
                }
              }
              else
              {
                __int16 v39 = v3[38];
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v56 = "-[INImageFilePersistence purgeExpiredImagesInEphemeralStore:]";
                  __int16 v57 = 2112;
                  id v58 = v25;
                  _os_log_error_impl(&dword_18CB2F000, v39, OS_LOG_TYPE_ERROR, "%s Item %@ has no creation date", buf, 0x16u);
                }
              }
            }
          }
          else
          {
            v36 = v3[38];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              id v37 = v36;
              int v38 = [v19 path];
              *(_DWORD *)buf = 136315650;
              v56 = "-[INImageFilePersistence purgeExpiredImagesInEphemeralStore:]";
              __int16 v57 = 2112;
              id v58 = v38;
              __int16 v59 = 2112;
              v60 = v22;
              _os_log_error_impl(&dword_18CB2F000, v37, OS_LOG_TYPE_ERROR, "%s Attributes for path %@ could not be gathered: %@", buf, 0x20u);
            }
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v50 objects:v64 count:16];
      }
      while (v17);
    }

    int v40 = objc_opt_class();
    __int16 v41 = [MEMORY[0x1E4F1C9C8] date];
    [v40 setLastEphemeralStorePurgingDate:v41];

    id v6 = v45;
  }
}

- (void)purgeExpiredImagesInEphemeralStore
{
}

+ (void)setLastEphemeralStorePurgingDate:(id)a3
{
}

+ (NSDate)lastEphemeralStorePurgingDate
{
  return (NSDate *)(id)_lastEphemeralStorePurgingDate;
}

@end