@interface MFAttachment
@end

@implementation MFAttachment

BOOL __58__MFAttachment_Utilities__compressContentsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 40) fileName];
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __58__MFAttachment_Utilities__compressContentsWithCompletion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    v6 = [*(id *)(a1 + 32) contents];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  return v3 == 0;
}

BOOL __60__MFAttachment_Utilities__decompressContentsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 40) fileName];
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __60__MFAttachment_Utilities__decompressContentsWithCompletion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) mainEntry];
    uint64_t v6 = *(void *)(a1 + 48);
    v7 = [v5 contents];
    v8 = [v5 fileName];
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);
  }
  return v3 == 0;
}

void __69__MFAttachment_Utilities__enqueueScaleAttachmentWithCompletionBlock___block_invoke(void *a1)
{
  id v3 = [*(id *)(a1[4] + (int)*MEMORY[0x1E4F77C78]) attachmentForURL:a1[5] error:0];
  if (v3) {
    id v2 = (id)[v3 scaledImageToFit:a1[6] saveScaledImage:0 attachmentContextID:0];
  }
}

void __69__MFAttachment_Utilities__enqueueScaleAttachmentWithCompletionBlock___block_invoke_2(void *a1)
{
  id v2 = [*(id *)(a1[4] + (int)*MEMORY[0x1E4F77C78]) attachmentForURL:a1[5] error:0];
  (*(void (**)(void))(a1[6] + 16))();
}

void __48__MFAttachment_Utilities__isBasicImageMimeType___block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"image/jpeg", @"image/png", @"image/gif", 0);
  v1 = (void *)isBasicImageMimeType__sBasicImageMIMETypes;
  isBasicImageMimeType__sBasicImageMIMETypes = v0;
}

void __58__MFAttachment_Utilities__compressContentsWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_1_0(&dword_1AF945000, "#Attachments Attachment %@ failed to compress due to [%{public}@]", v5, v6);
}

void __60__MFAttachment_Utilities__decompressContentsWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_1_0(&dword_1AF945000, "#Attachments Attachment %@ failed to decompress due to [%{public}@]", v5, v6);
}

@end