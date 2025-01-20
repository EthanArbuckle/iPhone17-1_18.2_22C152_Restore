@interface DOCRegularNodeThumbnailRequest
- (DOCRegularNodeThumbnailRequest)initWithNode:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5;
- (void)cancel;
- (void)generateThumbnailWithCompletionHandler:(id)a3;
@end

@implementation DOCRegularNodeThumbnailRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderIcon, 0);
  objc_storeStrong((id *)&self->_thumbnailRequest, 0);
  objc_destroyWeak((id *)&self->_thumbnailGenerator);
}

- (void)generateThumbnailWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailGenerator);
  thumbnailRequest = self->_thumbnailRequest;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__DOCRegularNodeThumbnailRequest_generateThumbnailWithCompletionHandler___block_invoke;
  v10[3] = &unk_264674A18;
  v10[4] = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__DOCRegularNodeThumbnailRequest_generateThumbnailWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_264674A40;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [WeakRetained generateThumbnailForRequest:thumbnailRequest updateHandler:0 statusHandler:v10 completionHandler:v8];
}

void __73__DOCRegularNodeThumbnailRequest_generateThumbnailWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(id *)(*(void *)(a1 + 32) + 32);
  id v7 = [v10 UIImage];
  v8 = v7;
  if (v6)
  {

    if (v8)
    {
      id v9 = [v10 UIImage];
      v8 = [v6 badgedFolderIconForBadge:v9 style:*(void *)(*(void *)(a1 + 32) + 40)];
    }
    else
    {

      v8 = [v6 plainFolderImageWithStyle:*(void *)(*(void *)(a1 + 32) + 40)];
      id v5 = 0;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (DOCRegularNodeThumbnailRequest)initWithNode:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_25:
    v45 = [MEMORY[0x263F08690] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"DOCThumbnailRequest.m", 145, @"Invalid parameter not satisfying: %@", @"descriptor" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_26;
  }
  v44 = [MEMORY[0x263F08690] currentHandler];
  [v44 handleFailureInMethod:a2, self, @"DOCThumbnailRequest.m", 144, @"Invalid parameter not satisfying: %@", @"node" object file lineNumber description];

  if (!v10) {
    goto LABEL_25;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_26:
  v46 = [MEMORY[0x263F08690] currentHandler];
  [v46 handleFailureInMethod:a2, self, @"DOCThumbnailRequest.m", 146, @"Invalid parameter not satisfying: %@", @"thumbnailGenerator" object file lineNumber description];

LABEL_4:
  v47.receiver = self;
  v47.super_class = (Class)DOCRegularNodeThumbnailRequest;
  v12 = [(DOCRegularNodeThumbnailRequest *)&v47 init];
  if (!v12) {
    goto LABEL_22;
  }
  v13 = objc_msgSend(v9, "fpfs_fpItem");

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
      v18 = objc_msgSend(v9, "fpfs_fpItem");
      *(_DWORD *)buf = 138412546;
      v49 = v17;
      __int16 v50 = 2112;
      v51 = v18;
      _os_log_impl(&dword_222E2D000, v16, OS_LOG_TYPE_DEFAULT, "DOCRegularNodeThumbnailRequest: requesting thumbnail from FPItem for %@: %@", buf, 0x16u);
    }
    id v19 = objc_alloc(MEMORY[0x263F160C8]);
    v20 = objc_msgSend(v9, "fpfs_fpItem");
    [v10 size];
    double v22 = v21;
    double v24 = v23;
    [v10 scale];
    uint64_t v26 = objc_msgSend(v19, "initWithFPItem:size:scale:representationTypes:", v20, 4, v22, v24, v25);
  }
  else
  {
    v27 = [v9 nodeURL];

    if (!v27)
    {
      v20 = [MEMORY[0x263F08690] currentHandler];
      [v20 handleFailureInMethod:a2 object:v12 file:@"DOCThumbnailRequest.m" lineNumber:162 description:@"Attempting to generate a thumbnail request for a node that has no FPItem and no URL"];
      goto LABEL_18;
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
      v32 = [v9 nodeURL];
      *(_DWORD *)buf = 138412546;
      v49 = v31;
      __int16 v50 = 2112;
      v51 = v32;
      _os_log_impl(&dword_222E2D000, v30, OS_LOG_TYPE_DEFAULT, "DOCRegularNodeThumbnailRequest: requesting thumbnail from URL for %@: %@", buf, 0x16u);
    }
    id v33 = objc_alloc(MEMORY[0x263F160C8]);
    v20 = [v9 nodeURL];
    [v10 size];
    double v35 = v34;
    double v37 = v36;
    [v10 scale];
    uint64_t v26 = objc_msgSend(v33, "initWithFileAtURL:size:scale:representationTypes:", v20, 4, v35, v37, v38);
  }
  thumbnailRequest = v12->_thumbnailRequest;
  v12->_thumbnailRequest = (QLThumbnailGenerationRequest *)v26;

LABEL_18:
  [v10 minimumSize];
  -[QLThumbnailGenerationRequest setMinimumDimension:](v12->_thumbnailRequest, "setMinimumDimension:");
  v40 = [MEMORY[0x263F3AB90] useBlastDoorThumbnails];
  -[QLThumbnailGenerationRequest setShouldUseRestrictedExtension:](v12->_thumbnailRequest, "setShouldUseRestrictedExtension:", [v40 isEnabled]);

  objc_storeWeak((id *)&v12->_thumbnailGenerator, v11);
  if ([v9 isFolder])
  {
    uint64_t v41 = +[DOCThumbnailFolderIcon folderIconForDescriptor:v10];
    folderIcon = v12->_folderIcon;
    v12->_folderIcon = (DOCThumbnailFolderIcon *)v41;
  }
  else
  {
    [(QLThumbnailGenerationRequest *)v12->_thumbnailRequest setIconMode:1];
    [(QLThumbnailGenerationRequest *)v12->_thumbnailRequest setIconVariant:2];
  }
  v12->_style = [v10 style];
LABEL_22:

  return v12;
}

void __73__DOCRegularNodeThumbnailRequest_generateThumbnailWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    v3 = [*(id *)(a1 + 32) thumbnailGenerationRequiresDownloadHandler];
    if (v3)
    {
      id v4 = v3;
      v3[2]();
      v3 = v4;
    }
  }
}

- (void)cancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailGenerator);
  [WeakRetained cancelRequest:self->_thumbnailRequest];
}

@end