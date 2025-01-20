@interface _SFWebArchiveActivityItemProvider
- (_SFWebArchiveActivityItemProvider)initWithWebArchiveProvider:(id)a3;
- (id)_webArchiveItemProvider;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
@end

@implementation _SFWebArchiveActivityItemProvider

- (_SFWebArchiveActivityItemProvider)initWithWebArchiveProvider:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5 && [v5 canGenerateWebArchive])
  {
    v7 = [v6 webView];
    v8 = [v7 URL];
    v9 = [v7 title];
    v16.receiver = self;
    v16.super_class = (Class)_SFWebArchiveActivityItemProvider;
    self = [(_SFActivityItemProvider *)&v16 initWithURL:v8 pageTitle:v9 webView:v7];

    if (self)
    {
      objc_storeStrong((id *)&self->_webArchiveProvider, a3);
      v10 = (void *)MEMORY[0x1E4F1CAD0];
      v17[0] = *MEMORY[0x1E4F435A0];
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      v12 = [v10 setWithArray:v11];
      [(_SFActivityItemProvider *)self setExcludedActivityTypes:v12];

      v13 = self;
    }

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)*MEMORY[0x1E4F22730];
}

- (id)_webArchiveItemProvider
{
  if ([(_SFWebArchiveProvider *)self->_webArchiveProvider canGenerateWebArchive])
  {
    v3 = self->_webArchiveProvider;
    id v4 = objc_alloc_init(MEMORY[0x1E4F28D78]);
    uint64_t v5 = *MEMORY[0x1E4F22730];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __60___SFWebArchiveActivityItemProvider__webArchiveItemProvider__block_invoke;
    v12 = &unk_1E5C72D78;
    v13 = v3;
    v14 = self;
    v6 = v3;
    [v4 registerItemForTypeIdentifier:v5 loadHandler:&v9];
    objc_msgSend(v4, "setPreferredPresentationStyle:", 2, v9, v10, v11, v12);
    v7 = [(_SFWebArchiveProvider *)self->_webArchiveProvider suggestedFilenameWithExtension];
    [v4 setSuggestedName:v7];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = a3;
  if ([(_SFWebArchiveProvider *)self->_webArchiveProvider canGenerateWebArchive])
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    uint64_t v5 = (void *)getLPLinkMetadataClass_softClass;
    uint64_t v25 = getLPLinkMetadataClass_softClass;
    if (!getLPLinkMetadataClass_softClass)
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __getLPLinkMetadataClass_block_invoke;
      v20 = &unk_1E5C723B0;
      v21 = &v22;
      __getLPLinkMetadataClass_block_invoke((uint64_t)&v17);
      uint64_t v5 = (void *)v23[3];
    }
    v6 = v5;
    _Block_object_dispose(&v22, 8);
    id v7 = objc_alloc_init(v6);
    if (v7)
    {
      v8 = [(_SFActivityItemProvider *)self url];
      [v7 setOriginalURL:v8];

      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x2050000000;
      uint64_t v9 = (void *)getLPFileMetadataClass_softClass;
      uint64_t v25 = getLPFileMetadataClass_softClass;
      if (!getLPFileMetadataClass_softClass)
      {
        uint64_t v17 = MEMORY[0x1E4F143A8];
        uint64_t v18 = 3221225472;
        v19 = __getLPFileMetadataClass_block_invoke;
        v20 = &unk_1E5C723B0;
        v21 = &v22;
        __getLPFileMetadataClass_block_invoke((uint64_t)&v17);
        uint64_t v9 = (void *)v23[3];
      }
      uint64_t v10 = v9;
      _Block_object_dispose(&v22, 8);
      id v11 = objc_alloc_init(v10);
      v12 = [(_SFWebArchiveProvider *)self->_webArchiveProvider suggestedFilenameWithoutExtension];
      [v11 setName:v12];

      [v11 setType:*MEMORY[0x1E4F22730]];
      [v7 setSpecialization:v11];
      v13 = [v7 specialization];
      linkPreviewFileMetadata = self->_linkPreviewFileMetadata;
      self->_linkPreviewFileMetadata = v13;

      id v15 = v7;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkPreviewFileMetadata, 0);

  objc_storeStrong((id *)&self->_webArchiveProvider, 0);
}

@end