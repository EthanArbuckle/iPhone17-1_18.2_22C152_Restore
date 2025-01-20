@interface PHLivePhotoExportSession
+ (BOOL)_canCreateLivePhotoWithURLs:(id)a3 outError:(id *)a4;
+ (BOOL)_identifyResourceURLs:(id)a3 outImageURL:(id *)a4 outVideoURL:(id *)a5 error:(id *)a6;
- (BOOL)_isOutputURLValid:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (NSArray)fileURLs;
- (NSURL)imageURL;
- (NSURL)videoURL;
- (PHLivePhotoExportSession)initWithResourceFileURLs:(id)a3;
- (id)writeToFileURL:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)setImageURL:(id)a3;
- (void)setVideoURL:(id)a3;
@end

@implementation PHLivePhotoExportSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);

  objc_storeStrong((id *)&self->_fileURLs, 0);
}

- (void)setVideoURL:(id)a3
{
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setImageURL:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSArray)fileURLs
{
  return self->_fileURLs;
}

- (BOOL)_isOutputURLValid:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 isFileURL])
  {
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    v10 = [v7 path];
    if ([v9 fileExistsAtPath:v10])
    {
      uint64_t v11 = [v8 format];

      if (v11 != 1)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"destination already exists: '%@'", v7);
        goto LABEL_7;
      }
    }
    else
    {
    }
    uint64_t v16 = [v8 format];
    if (v16 != 1)
    {
      if (!v16)
      {
        v17 = [v7 pathExtension];
        uint64_t v18 = *MEMORY[0x1E4F8CED8];
        char v19 = [v17 isEqualToString:*MEMORY[0x1E4F8CED8]];

        if ((v19 & 1) == 0)
        {
          v20 = (void *)MEMORY[0x1E4F28C58];
          v21 = [v7 pathExtension];
          objc_msgSend(v20, "ph_genericErrorWithLocalizedDescription:", @"destination has extension '%@' but requires '%@'", v21, v18);
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          if (a5) {
            *a5 = v22;
          }

          goto LABEL_16;
        }
      }
LABEL_18:
      BOOL v15 = 1;
      goto LABEL_19;
    }
    if ([v7 hasDirectoryPath]) {
      goto LABEL_18;
    }
    v12 = (void *)MEMORY[0x1E4F28C58];
    v13 = @"destination is not directory, PHLivePhotoExportFormatResources requires a directory";
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    id v24 = v7;
    v13 = @"destination is not a file url: '%@'";
  }
  objc_msgSend(v12, "ph_genericErrorWithLocalizedDescription:", v13, v24);
LABEL_7:
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!a5)
  {
LABEL_16:
    BOOL v15 = 0;
    goto LABEL_19;
  }
  BOOL v15 = 0;
  *a5 = v14;
LABEL_19:

  return v15;
}

- (id)writeToFileURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  v76[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (PHLivePhotoExportSessionOptions *)a4;
  v10 = (void (**)(id, id))a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v9) {
    v9 = objc_alloc_init(PHLivePhotoExportSessionOptions);
  }
  id v75 = 0;
  BOOL v12 = [(PHLivePhotoExportSession *)self _isOutputURLValid:v8 withOptions:v9 error:&v75];
  id v13 = v75;
  if (v12)
  {
    v66 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
    v67 = self->_fileURLs;
    p_imageURL = &self->_imageURL;
    BOOL v15 = self->_imageURL;
    p_videoURL = &self->_videoURL;
    v17 = self->_videoURL;
    uint64_t v18 = v17;
    if (v15 && v17)
    {
      char v19 = v15;
      v20 = v17;
LABEL_20:
      if (*p_imageURL && *p_videoURL && !v13)
      {
        uint64_t v29 = [(PHLivePhotoExportSessionOptions *)v9 format];
        if (v29 == 1)
        {
          v63 = v11;
          v65 = v20;
          v58 = v19;
          v35 = (void *)MEMORY[0x1E4F1CB10];
          v36 = NSString;
          v37 = [MEMORY[0x1E4F29128] UUID];
          [v37 UUIDString];
          v39 = id v38 = v8;
          v40 = [(NSURL *)*p_imageURL pathExtension];
          v41 = [v36 stringWithFormat:@"%@.%@", v39, v40];
          uint64_t v42 = [v35 fileURLWithPath:v41 relativeToURL:v38];

          v60 = (void *)MEMORY[0x1E4F1CB10];
          v43 = NSString;
          v44 = [MEMORY[0x1E4F29128] UUID];
          v45 = [v44 UUIDString];
          v46 = [(NSURL *)*p_videoURL pathExtension];
          v47 = [v43 stringWithFormat:@"%@.%@", v45, v46];
          v48 = v60;
          v61 = v38;
          v49 = [v48 fileURLWithPath:v47 relativeToURL:v38];

          v50 = [MEMORY[0x1E4F28CB8] defaultManager];
          v51 = *p_imageURL;
          v34 = (void *)v42;
          id v69 = 0;
          [v50 copyItemAtURL:v51 toURL:v42 error:&v69];
          id v13 = v69;

          if (!v13)
          {
            v52 = [MEMORY[0x1E4F28CB8] defaultManager];
            v53 = *p_videoURL;
            id v68 = 0;
            [v52 copyItemAtURL:v53 toURL:v49 error:&v68];
            id v13 = v68;

            if (!v13)
            {
              [v63 setObject:v42 forKeyedSubscript:@"PHLivePhotoExportSessionInfoPhotoURLKey"];
              [v63 setObject:v49 forKeyedSubscript:@"PHLivePhotoExportSessionInfoVideoURLKey"];
            }
          }

          char v19 = v58;
          id v8 = v61;
          id v11 = v63;
          v20 = v65;
        }
        else
        {
          if (v29)
          {
            if (v10)
            {
              v21 = v66;
              [v66 setCompletedUnitCount:100];
              id v13 = 0;
LABEL_34:
              v10[2](v10, v11);
LABEL_40:

              goto LABEL_41;
            }
            id v13 = 0;
LABEL_39:
            v21 = v66;
            goto LABEL_40;
          }
          id v30 = objc_alloc(MEMORY[0x1E4F8CE20]);
          [(NSURL *)*p_videoURL path];
          v32 = v31 = v20;
          v33 = [(NSURL *)*p_imageURL path];
          v34 = (void *)[v30 initWithPathToVideo:v32 pathToImage:v33];

          v20 = v31;
          id v70 = 0;
          [v34 writeToBundleAtURL:v8 error:&v70];
          id v13 = v70;
          [v11 setObject:v8 forKeyedSubscript:@"PHLivePhotoExportSessionInfoBundleURLKey"];
        }
      }
      if (v10)
      {
        v21 = v66;
        [v66 setCompletedUnitCount:100];
        if (v13) {
          [v11 setObject:v13 forKeyedSubscript:@"PHLivePhotoExportSessionInfoErrorKey"];
        }
        goto LABEL_34;
      }
      goto LABEL_39;
    }
    id v59 = v8;
    id v62 = v11;
    v73 = v17;
    v74 = v15;
    id v72 = v13;
    int v22 = [(id)objc_opt_class() _identifyResourceURLs:v67 outImageURL:&v74 outVideoURL:&v73 error:&v72];
    obj = v74;
    v23 = v74;

    id v24 = v73;
    v64 = v73;

    id v25 = v72;
    if (v22)
    {
      v57 = v23;
      if (v23)
      {
        v55 = v24;
        v20 = v64;
        if (!v64)
        {
          id v13 = v25;
          char v19 = v23;
          id v8 = v59;
          id v11 = v62;
          goto LABEL_20;
        }
        v26 = objc_opt_class();
        v76[0] = v23;
        v76[1] = v64;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
        id v71 = v25;
        int v28 = [v26 _canCreateLivePhotoWithURLs:v27 outError:&v71];
        id v13 = v71;

        id v11 = v62;
        if (v28)
        {
          objc_storeStrong((id *)p_imageURL, obj);
          objc_storeStrong((id *)p_videoURL, v55);
        }
        char v19 = v57;
        id v8 = v59;
        goto LABEL_19;
      }
      id v13 = v25;
      char v19 = 0;
      id v8 = v59;
    }
    else
    {
      id v13 = v25;
      id v8 = v59;
      char v19 = v23;
    }
    id v11 = v62;
LABEL_19:
    v20 = v64;
    goto LABEL_20;
  }
  [v11 setObject:v13 forKeyedSubscript:@"PHLivePhotoExportSessionInfoErrorKey"];
  if (v10) {
    v10[2](v10, v11);
  }
  v21 = 0;
LABEL_41:

  return v21;
}

- (PHLivePhotoExportSession)initWithResourceFileURLs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHLivePhotoExportSession;
  v6 = [(PHLivePhotoExportSession *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fileURLs, a3);
  }

  return v7;
}

+ (BOOL)_canCreateLivePhotoWithURLs:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(PHValidator);
  id v11 = 0;
  BOOL v7 = [(PHValidator *)v6 validateURLs:v5 withOptions:66 videoComplementMetadata:0 error:&v11];

  id v8 = v11;
  objc_super v9 = v8;
  if (a4 && !v7) {
    *a4 = v8;
  }

  return v7;
}

+ (BOOL)_identifyResourceURLs:(id)a3 outImageURL:(id *)a4 outVideoURL:(id *)a5 error:(id *)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__48564;
  v51 = __Block_byref_object_dispose__48565;
  id v52 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PHLivePhotoExportSession__identifyResourceURLs_outImageURL_outVideoURL_error___block_invoke;
  aBlock[3] = &unk_1E5848C60;
  aBlock[4] = &v47;
  BOOL v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (!v8)
  {

    id v9 = 0;
    goto LABEL_28;
  }
  id v9 = 0;
  id v10 = 0;
  uint64_t v11 = *(void *)v43;
  uint64_t v12 = *MEMORY[0x1E4F8CED8];
  uint64_t v40 = *MEMORY[0x1E4F44400];
  uint64_t v39 = *MEMORY[0x1E4F44448];
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v43 != v11) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v42 + 1) + 8 * v13);
      BOOL v15 = [v14 pathExtension];
      int v16 = [v15 isEqualToString:v12];

      if (v16)
      {
        v17 = (void *)[objc_alloc(MEMORY[0x1E4F8CE20]) initWithBundleAtURL:v14];
        uint64_t v18 = v17;
        if (v17)
        {
          char v19 = (void *)MEMORY[0x1E4F1CB10];
          v20 = [v17 imagePath];
          uint64_t v21 = [v19 fileURLWithPath:v20];

          int v22 = (void *)MEMORY[0x1E4F1CB10];
          v23 = [v18 videoPath];
          uint64_t v24 = [v22 fileURLWithPath:v23];

          id v9 = (id)v24;
          id v10 = (id)v21;
        }
        else
        {
          v23 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Bundle at url %@ is corrupted", v14);
          v7[2](v7, v23);
        }
      }
      else
      {
        id v25 = (void *)MEMORY[0x1E4F442D8];
        v26 = [v14 pathExtension];
        uint64_t v18 = [v25 typeWithFilenameExtension:v26];

        if (v18)
        {
          if ([v18 conformsToType:v40])
          {
            if (v10)
            {
              v27 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Multiple image fileURLs");
              v7[2](v7, v27);
            }
            else
            {
              id v10 = v14;
            }
          }
          else if ([v18 conformsToType:v39])
          {
            if (v9)
            {
              int v28 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Multiple video fileURLs");
              v7[2](v7, v28);
            }
            else
            {
              id v9 = v14;
            }
          }
          else
          {
            uint64_t v29 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Unknown type for fileURL %@", v14);
            v7[2](v7, v29);
          }
        }
      }

      ++v13;
    }
    while (v8 != v13);
    uint64_t v30 = [obj countByEnumeratingWithState:&v42 objects:v53 count:16];
    uint64_t v8 = v30;
  }
  while (v30);

  if (!v10)
  {
LABEL_28:
    v31 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3303, @"Missing image fileURL");
    v7[2](v7, v31);

    id v10 = 0;
    if (v9) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (v9) {
    goto LABEL_30;
  }
LABEL_29:
  v32 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3303, @"Missing video fileURL");
  v7[2](v7, v32);

LABEL_30:
  uint64_t v33 = v48[5];
  if (v33)
  {
    v34 = (void *)v48[5];
    a5 = a6;
    if (!a6) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  if (a4) {
    *a4 = v10;
  }
  v34 = v9;
  if (a5) {
LABEL_36:
  }
    *a5 = v34;
LABEL_37:

  _Block_object_dispose(&v47, 8);
  return v33 == 0;
}

void __80__PHLivePhotoExportSession__identifyResourceURLs_outImageURL_outVideoURL_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_ERROR, "Failed to export live photo: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (!*(void *)(v5 + 40))
  {
    if (v3)
    {
      id v6 = v3;
      BOOL v7 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v6;
    }
    else
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, 0);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      BOOL v7 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
}

@end