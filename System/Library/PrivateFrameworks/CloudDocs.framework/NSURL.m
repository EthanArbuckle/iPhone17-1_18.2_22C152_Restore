@interface NSURL
@end

@implementation NSURL

id __61__NSURL_BRAdditions__br_containerIDIfIsDocumentsContainerURL__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = 0;
  int v4 = [a3 getResourceValue:&v11 forKey:*MEMORY[0x1E4F1CDD0] error:0];
  id v5 = v11;
  v6 = v5;
  v7 = 0;
  if (v4)
  {
    uint64_t v8 = [v5 unsignedLongLongValue];
    if (v8 == [*(id *)(a1 + 32) unsignedLongLongValue])
    {
      v9 = [[BRMangledID alloc] initWithMangledString:*(void *)(a1 + 40)];
      v7 = [(BRMangledID *)v9 appLibraryOrZoneName];
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

id __52__NSURL_BRFinderTagAdditions__br_setTagNames_error___block_invoke(uint64_t a1, int a2)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(a1 + 32) requiringSecureCoding:1 error:0];
    if ((fsetxattr(a2, "com.apple.metadata:_kMDItemUserTags", (const void *)[v4 bytes], objc_msgSend(v4, "length"), 0, 0) & 0x80000000) == 0)
    {

LABEL_6:
      id v5 = 0;
      goto LABEL_9;
    }
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", *__error(), @"couldn't set %llu-byte xattr %s", objc_msgSend(v4, "length"), "com.apple.metadata:_kMDItemUserTags");
  }
  else
  {
    if ((fremovexattr(a2, "com.apple.metadata:_kMDItemUserTags", 0) & 0x80000000) == 0 || *__error() == 93) {
      goto LABEL_6;
    }
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", *__error(), @"couldn't remove xattr %s", "com.apple.metadata:_kMDItemUserTags");
  }
LABEL_9:

  return v5;
}

void __91__NSURL_BRConflictWinner__br_addFakeConflictLoserFromItemAtURL_lastEditorDeviceName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __47__NSURL_BRAdditions__br_isInLocalHomeDirectory__block_invoke(uint64_t result, uint64_t a2, char a3, char a4, uint64_t a5)
{
  uint64_t v5 = result;
  if ((a3 & 1) == 0 && (a4 & 1) == 0)
  {
    result = objc_msgSend(*(id *)(result + 32), "_br_isInLocalHomeDirectoryUnderPersona:needsPersonaSwitch:", a2, a5 != 0);
    a4 = result;
  }
  *(unsigned char *)(*(void *)(*(void *)(v5 + 40) + 8) + 24) = a4;
  return result;
}

uint64_t __102__NSURL_BRAdditions___br_isParentOfURL_strictly_withNonMateralizingIOPolicy_ignoreHomeDirectoryCheck___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_br_isParentOfURL:strictly:ignoreHomeDirectoryCheck:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __60__NSURL_BRAdditions__br_isExistWithNonMateralizingIOPolicy___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v2 = [*(id *)(a1 + 32) path];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 fileExistsAtPath:v2];
}

void __117__NSURL_BRAdditions___br_bookmarkableStringForURL_remoteOpeningAppWithBundleID_onlyAllowItemKnowByServer_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v6 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = [*(id *)(a1 + 48) BOOLValue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __117__NSURL_BRAdditions___br_bookmarkableStringForURL_remoteOpeningAppWithBundleID_onlyAllowItemKnowByServer_completion___block_invoke_2;
    v10[3] = &unk_1E59AEC40;
    id v11 = *(id *)(a1 + 56);
    [v5 getBookmarkData:v6 allowAccessByBundleID:v7 documentID:v8 isDirectory:v9 reply:v10];
  }
}

uint64_t __117__NSURL_BRAdditions___br_bookmarkableStringForURL_remoteOpeningAppWithBundleID_onlyAllowItemKnowByServer_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __117__NSURL_BRAdditions___br_bookmarkableStringForURL_remoteOpeningAppWithBundleID_onlyAllowItemKnowByServer_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__NSURL_BRAdditions__br_bookmarkableStringForURL_withEtag_onlyAllowItemKnowByServer_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = v8;
    v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = 0;
      id v11 = v14;
    }
    else
    {

      v12 = (void *)MEMORY[0x1E4F28C58];
      v13 = [*(id *)(a1 + 32) path];
      uint64_t v9 = objc_msgSend(v12, "brc_errorNotInCloud:", v13);

      id v11 = 0;
    }
    v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    id v14 = v11;
  }
  v10();
}

uint64_t __86__NSURL_BRAdditions__br_bookmarkableStringForRemoteOpeningAppWithBundleID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__NSURL_BRAdditions__br_documentURLFromFileObjectID_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  v10 = *(void **)(a1 + 32);
  id v11 = a6;
  _BRPromiseURLCombine(a2, a3, a4, a5);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v10 setObjResult:v12 error:v11];
}

uint64_t __70__NSURL_BRAdditions__br_documentURLFromBookmarkableString_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__NSURL_BRAdditions__br_documentURLFromBookmarkableString_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = a6;
  _BRPromiseURLCombine(a2, a3, a4, a5);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v12, v11);
}

void __65__NSURL_BRAdditions__br_documentURLFromBookmarkableString_error___block_invoke(uint64_t a1, void *a2)
{
}

void __65__NSURL_BRAdditions__br_documentURLFromBookmarkableString_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a6;
  uint64_t v12 = _BRPromiseURLCombine(a2, a3, a4, a5);
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v11;
}

void __71__NSURL_BRAdditions__br_containerIDsWithExternalReferencesWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = [a2 objectForKeyedSubscript:v5];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

uint64_t __80__NSURL_BRAdditions__br_containerIDsWithExternalReferencesTo_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__NSURL_BRAdditions__br_pathRelativeToSyncedRootURLForContainerID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "br_pathRelativeToMobileDocuments");

  return MEMORY[0x1F41817F8]();
}

void __54__NSURL_BRAdditions__br_pathRelativeToMobileDocuments__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = *(void **)(a1 + 32);
  BOOL v7 = a5 != 0;
  id v8 = a2;
  id v12 = +[BRDaemonConnection mobileDocumentsURLForPersonaID:v8 needsPersonaSwitch:v7];
  uint64_t v9 = objc_msgSend(v6, "br_pathRelativeToSyncedRootURL:currentPersonaID:", v12, v8);

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

uint64_t __34__NSURL_BRAdditions__br_isInTrash__block_invoke()
{
  br_isInTrash_centralizedTrashSubStr = [NSString stringWithFormat:@"%@/%@", @"Mobile Documents", @".Trash"];

  return MEMORY[0x1F41817F8]();
}

void __42__NSURL_BRAdditions__br_isInSyncedDesktop__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  +[BRDaemonConnection syncedDesktopURLForPersonaID:a2 needsPersonaSwitch:a5 != 0];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "br_isParentOfURL:strictly:", *(void *)(a1 + 32), 0);
}

void __44__NSURL_BRAdditions__br_isInSyncedDocuments__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  +[BRDaemonConnection syncedDocumentsURLForPersonaID:a2 needsPersonaSwitch:a5 != 0];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "br_isParentOfURL:strictly:", *(void *)(a1 + 32), 0);
}

uint64_t __53__NSURL_BRAdditions___br_isInSyncedLocationStrictly___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_br_isInSyncedLocationWithCurrentPersonaID:strictly:foundHomeDirectory:adoptionError:", a2, *(unsigned __int8 *)(a1 + 48), a4, a5);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __53__NSURL_BRAdditions__br_isInCloudDocsPrivateStorages__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = a2;
  BOOL v7 = +[BRDaemonConnection cloudDocsAppSupportURLForPersonaID:needsPersonaSwitch:](BRDaemonConnection, "cloudDocsAppSupportURLForPersonaID:needsPersonaSwitch:");
  if (objc_msgSend(v7, "br_isParentOfURL:", *(void *)(a1 + 32)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    id v8 = +[BRDaemonConnection cloudDocsCachesURLForPersonaID:v9 needsPersonaSwitch:a5 != 0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "br_isParentOfURL:", *(void *)(a1 + 32));
  }
}

uint64_t __78__NSURL_BRAdditions__br_isInCloudDocsPrivateStoragesForRemoteDocumentVersions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = +[BRDaemonConnection cloudDocsAppSupportURLForPersonaID:a2 needsPersonaSwitch:a5 != 0];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) URLByAppendingPathComponent:@"session"];
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) URLByAppendingPathComponent:@"r"];

  return MEMORY[0x1F41817F8]();
}

uint64_t __36__NSURL_BRAdditions__br_containerID__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "br_containerIDWithCurrentPersonaID:needsPersonaSwitch:", a2, a5 != 0);

  return MEMORY[0x1F41817F8]();
}

void __61__NSURL_BRAdditions__br_containerIDIfIsDocumentsContainerURL__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  +[BRDaemonConnection mobileDocumentsURLForPersonaID:a2 needsPersonaSwitch:a5 != 0];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __43__NSURL_BRAdditions__br_cloudDocsContainer__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "br_containerIDWithCurrentPersonaID:needsPersonaSwitch:");
  uint64_t v4 = v3;
  if (v3 && ([v3 isEqualToString:@"com.apple.SharedDocs"] & 1) == 0)
  {
    uint64_t v5 = [[BRMangledID alloc] initWithAppLibraryName:v4];
    uint64_t v6 = +[BRContainerCache containerCacheForPersonaID:v10];
    uint64_t v7 = [v6 containerByID:v5];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

uint64_t __45__NSURL_BRAdditions__br_setAccessTime_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 == 0 error:a2];
}

void __56__NSURL_BRAdditions__br_creatorNameComponentsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __56__NSURL_BRAdditions__br_creatorNameComponentsWithError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

uint64_t __46__NSURL_BRAdditions__br_getSyncRootWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:@"Mobile Documents"];
}

void __86__NSURL_BRAdditions_Private___br_getAttributeValue_withSecondaryConnection_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t __86__NSURL_BRAdditions_Private___br_getAttributeValue_withSecondaryConnection_withError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

@end