@interface LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization
+ (id)specializedMetadataProviderForURLWithContext:(id)a3;
+ (unint64_t)specialization;
- (void)completeWithOriginatorDisplayName:(id)a3;
- (void)start;
@end

@implementation LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 2048;
}

+ (id)specializedMetadataProviderForURLWithContext:(id)a3
{
  id v3 = a3;
  v4 = [v3 postRedirectURL];
  BOOL v5 = +[LPPresentationSpecializations isApplePhotosSharedLibraryInvitationURL:v4];

  if (v5) {
    v6 = [(LPMetadataProviderSpecialization *)[LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization alloc] initWithContext:v3];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (void)start
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A35DC000, log, OS_LOG_TYPE_ERROR, "LinkPresentation: Failed to generate metadata - TCC denied", v1, 2u);
}

void __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__2;
    v28 = __Block_byref_object_dispose__2;
    id v29 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    v7 = (void *)getPHShareParticipantClass_softClass;
    uint64_t v33 = getPHShareParticipantClass_softClass;
    if (!getPHShareParticipantClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __getPHShareParticipantClass_block_invoke;
      v37 = &unk_1E5B04EB8;
      v38 = &v30;
      __getPHShareParticipantClass_block_invoke((uint64_t)buf);
      v7 = (void *)v31[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v30, 8);
    v9 = [v8 fetchParticipantsInShare:v5 options:*(void *)(a1 + 48)];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke_5;
    v23[3] = &unk_1E5B05B60;
    v23[4] = &v24;
    [v9 enumerateObjectsUsingBlock:v23];
    v10 = (void *)v25[5];
    if (!v10)
    {
      v16 = sharedLibraryLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = [v5 localIdentifier];
        __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke_cold_2(v17, buf, v16);
      }

      [*(id *)(a1 + 40) completeWithOriginatorDisplayName:0];
      goto LABEL_21;
    }
    id v11 = v10;
    v12 = [v11 nameComponents];
    if (v12)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F28F38]);
      [v13 setStyle:1];
      id v14 = [v13 stringFromPersonNameComponents:v12];
    }
    else
    {
      id v13 = [v11 emailAddress];
      if (![v13 length])
      {
        v22 = [v11 phoneNumber];
        if ([v22 length]) {
          id v18 = v22;
        }
        else {
          id v18 = 0;
        }

        goto LABEL_16;
      }
      id v14 = v13;
      id v13 = v14;
    }
    id v18 = v14;
LABEL_16:

    if (!v18)
    {
      v19 = sharedLibraryLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = [(id)v25[5] localIdentifier];
        v21 = [v5 localIdentifier];
        __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke_cold_3(v20, v21, buf, v19);
      }
    }
    [*(id *)(a1 + 40) completeWithOriginatorDisplayName:v18];

LABEL_21:
    _Block_object_dispose(&v24, 8);

    goto LABEL_22;
  }
  v15 = sharedLibraryLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke_cold_1(a1, (uint64_t)v6, v15);
  }

  [*(id *)(a1 + 40) completeWithOriginatorDisplayName:0];
LABEL_22:
}

void __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 role] == 1)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)completeWithOriginatorDisplayName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(LPApplePhotosSharedLibraryInvitationMetadata);
  if (v4)
  {
    id v6 = NSString;
    id v7 = LPLocalizedString(@"%@ wants you to join a Shared Library in Photos");
    id v8 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v4);
    [(LPApplePhotosSharedLibraryInvitationMetadata *)v5 setMessage:v8];

    [(LPApplePhotosSharedLibraryInvitationMetadata *)v5 setOriginatorDisplayName:v4];
  }
  v9 = [(LPMetadataProviderSpecialization *)self createMetadataWithSpecialization:v5];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_completeWithOriginatorDisplayName___block_invoke;
  block[3] = &unk_1E5B04E18;
  block[4] = self;
  id v12 = v9;
  id v10 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __104__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_completeWithOriginatorDisplayName___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 metadataProviderSpecialization:*(void *)(a1 + 32) didCompleteWithMetadata:*(void *)(a1 + 40)];
}

void __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A35DC000, log, OS_LOG_TYPE_ERROR, "LinkPresentation: Failed to generate metadata - No library scope for URL: %@, error: %@", (uint8_t *)&v4, 0x16u);
}

void __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A35DC000, log, OS_LOG_TYPE_ERROR, "LinkPresentation: Failed to generate metadata - No owner for library scope: %{public}@", buf, 0xCu);
}

void __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke_cold_3(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A35DC000, log, OS_LOG_TYPE_ERROR, "LinkPresentation: Failed to generate metadata - No name for owner: %{public}@, library scope: %{public}@", buf, 0x16u);
}

@end