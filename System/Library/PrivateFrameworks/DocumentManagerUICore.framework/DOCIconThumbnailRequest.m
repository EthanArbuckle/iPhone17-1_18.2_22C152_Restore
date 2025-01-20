@interface DOCIconThumbnailRequest
- (DOCIconThumbnailRequest)initWithNode:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5;
- (DOCIconThumbnailRequest)initWithURL:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5;
- (void)generateThumbnailWithCompletionHandler:(id)a3;
@end

@implementation DOCIconThumbnailRequest

- (void)generateThumbnailWithCompletionHandler:(id)a3
{
  p_thumbnailGenerator = &self->_thumbnailGenerator;
  v5 = (void (**)(id, void *, void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_thumbnailGenerator);
  id v8 = [WeakRetained thumbnailIconForRequest:self->_request];

  v7 = [v8 UIImage];
  v5[2](v5, v7, 0);
}

- (DOCIconThumbnailRequest)initWithNode:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v42.receiver = self;
  v42.super_class = (Class)DOCIconThumbnailRequest;
  v12 = [(DOCIconThumbnailRequest *)&v42 init];
  if (v12)
  {
    v13 = [v9 nodeURL];

    if (v13)
    {
      v14 = (NSObject **)MEMORY[0x263F3AC28];
      v15 = *MEMORY[0x263F3AC28];
      if (!*MEMORY[0x263F3AC28])
      {
        DOCInitLogging();
        v15 = *v14;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        v17 = [v9 displayName];
        v18 = [v9 nodeURL];
        *(_DWORD *)buf = 138412546;
        v44 = v17;
        __int16 v45 = 2112;
        v46 = v18;
        _os_log_impl(&dword_222E2D000, v16, OS_LOG_TYPE_DEFAULT, "DOCIconThumbnailRequest: requesting thumbnail from URL for %@: %@", buf, 0x16u);
      }
      id v19 = objc_alloc(MEMORY[0x263F160C8]);
      v20 = [v9 nodeURL];
      [v10 size];
      double v22 = v21;
      double v24 = v23;
      [v10 scale];
      uint64_t v26 = objc_msgSend(v19, "initWithFileAtURL:size:scale:representationTypes:", v20, 1, v22, v24, v25);
    }
    else
    {
      v27 = objc_msgSend(v9, "fpfs_fpItem");

      if (!v27)
      {
        v20 = [MEMORY[0x263F08690] currentHandler];
        [v20 handleFailureInMethod:a2 object:v12 file:@"DOCThumbnailRequest.m" lineNumber:275 description:@"Attempting to generate a thumbnail request for a node that has no FPItem and no URL"];
        goto LABEL_15;
      }
      v28 = (NSObject **)MEMORY[0x263F3AC28];
      v29 = *MEMORY[0x263F3AC28];
      if (!*MEMORY[0x263F3AC28])
      {
        DOCInitLogging();
        v29 = *v28;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = v29;
        v31 = [v9 displayName];
        v32 = objc_msgSend(v9, "fpfs_fpItem");
        *(_DWORD *)buf = 138412546;
        v44 = v31;
        __int16 v45 = 2112;
        v46 = v32;
        _os_log_impl(&dword_222E2D000, v30, OS_LOG_TYPE_DEFAULT, "DOCIconThumbnailRequest: requesting thumbnail from FPItem for %@: %@", buf, 0x16u);
      }
      id v33 = objc_alloc(MEMORY[0x263F160C8]);
      v20 = objc_msgSend(v9, "fpfs_fpItem");
      [v10 size];
      double v35 = v34;
      double v37 = v36;
      [v10 scale];
      uint64_t v26 = objc_msgSend(v33, "initWithFPItem:size:scale:representationTypes:", v20, 1, v35, v37, v38);
    }
    request = v12->_request;
    v12->_request = (QLThumbnailGenerationRequest *)v26;

LABEL_15:
    [v10 minimumSize];
    -[QLThumbnailGenerationRequest setMinimumDimension:](v12->_request, "setMinimumDimension:");
    v40 = [MEMORY[0x263F3AB90] useBlastDoorThumbnails];
    -[QLThumbnailGenerationRequest setShouldUseRestrictedExtension:](v12->_request, "setShouldUseRestrictedExtension:", [v40 isEnabled]);

    -[QLThumbnailGenerationRequest setIconVariant:](v12->_request, "setIconVariant:", [v10 isFolded]);
    objc_storeWeak((id *)&v12->_thumbnailGenerator, v11);
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_thumbnailGenerator);
  objc_storeStrong((id *)&self->_request, 0);
}

- (DOCIconThumbnailRequest)initWithURL:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)DOCIconThumbnailRequest;
  id v11 = [(DOCIconThumbnailRequest *)&v22 init];
  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x263F160C8]);
    [v9 size];
    double v14 = v13;
    double v16 = v15;
    [v9 scale];
    uint64_t v18 = objc_msgSend(v12, "initWithFileAtURL:size:scale:representationTypes:", v8, 1, v14, v16, v17);
    request = v11->_request;
    v11->_request = (QLThumbnailGenerationRequest *)v18;

    [v9 minimumSize];
    -[QLThumbnailGenerationRequest setMinimumDimension:](v11->_request, "setMinimumDimension:");
    v20 = [MEMORY[0x263F3AB90] useBlastDoorThumbnails];
    -[QLThumbnailGenerationRequest setShouldUseRestrictedExtension:](v11->_request, "setShouldUseRestrictedExtension:", [v20 isEnabled]);

    -[QLThumbnailGenerationRequest setIconVariant:](v11->_request, "setIconVariant:", [v9 isFolded]);
    objc_storeWeak((id *)&v11->_thumbnailGenerator, v10);
  }

  return v11;
}

@end