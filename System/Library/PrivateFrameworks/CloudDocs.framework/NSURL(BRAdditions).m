@interface NSURL(BRAdditions)
+ (id)br_documentURLFromBookmarkableString:()BRAdditions error:;
+ (id)br_documentURLFromFileObjectID:()BRAdditions error:;
+ (uint64_t)br_bookmarkableStringForURL:()BRAdditions withEtag:completion:;
+ (uint64_t)br_datalessMaterializationOffForBlock:()BRAdditions;
+ (void)_br_bookmarkableStringForURL:()BRAdditions remoteOpeningAppWithBundleID:onlyAllowItemKnowByServer:completion:;
+ (void)br_bookmarkableStringForURL:()BRAdditions withEtag:onlyAllowItemKnowByServer:completion:;
+ (void)br_containerIDsWithExternalReferencesTo:()BRAdditions completionHandler:;
+ (void)br_documentURLFromBookmarkableString:()BRAdditions completion:;
+ (void)br_setIOPolicy:()BRAdditions type:forBlock:;
- (BOOL)br_isDocumentsContainer;
- (BOOL)br_isPromiseURL;
- (BOOL)br_isSymLink;
- (BOOL)br_mightBeBRAlias;
- (BOOL)br_setAccessTime:()BRAdditions error:;
- (__CFString)br_containerIDIfIsDocumentsContainerURL;
- (id)br_URLByResolvingExternalDocumentReferenceWithError:()BRAdditions;
- (id)br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:()BRAdditions;
- (id)br_cachedBookmarkData;
- (id)br_cloudDocsContainer;
- (id)br_containerID;
- (id)br_creatorNameComponentsWithError:()BRAdditions;
- (id)br_debugDescription;
- (id)br_externalDocumentPropertiesWithError:()BRAdditions;
- (id)br_getSyncRootWithError:()BRAdditions;
- (id)br_itemID;
- (id)br_logicalURL;
- (id)br_pathRelativeToMobileDocuments;
- (id)br_pathRelativeToSyncedRootURLForContainerID:()BRAdditions;
- (id)br_realpathURL;
- (id)br_realpathURLWithIsDirectory:()BRAdditions;
- (id)br_typeIdentifierWithError:()BRAdditions;
- (uint64_t)_br_isInSyncedLocationStrictly:()BRAdditions;
- (uint64_t)_br_isParentOfURL:()BRAdditions strictly:ignoreHomeDirectoryCheck:;
- (uint64_t)_br_isParentOfURL:()BRAdditions strictly:withNonMateralizingIOPolicy:ignoreHomeDirectoryCheck:;
- (uint64_t)_br_mightBeInSyncedLocationUnderCurrentPersonaID:()BRAdditions strictly:;
- (uint64_t)br_bookmarkableStringWithEtag:()BRAdditions completion:;
- (uint64_t)br_bookmarkableStringWithEtag:()BRAdditions onlyAllowItemKnowByServer:completion:;
- (uint64_t)br_capabilityToMoveToURL:()BRAdditions error:;
- (uint64_t)br_containerIDIfIsDesktopOrDocumentsURL;
- (uint64_t)br_documentRecordIDWithError:()BRAdditions;
- (uint64_t)br_isExistWithNonMateralizingIOPolicy:()BRAdditions;
- (uint64_t)br_isExternalDocumentReference;
- (uint64_t)br_isInCloudDocsPrivateStorages;
- (uint64_t)br_isInCloudDocsPrivateStoragesForRemoteDocumentVersions;
- (uint64_t)br_isInLocalHomeDirectory;
- (uint64_t)br_isInSharedDocsContainer;
- (uint64_t)br_isInSyncedDesktop;
- (uint64_t)br_isInSyncedDocuments;
- (uint64_t)br_isInSyncedLocation;
- (uint64_t)br_isInTrash;
- (uint64_t)br_isModifiedSinceShared;
- (uint64_t)br_isParentOfURL:()BRAdditions;
- (uint64_t)br_isParentOfURL:()BRAdditions ignoreHomeDirectoryCheck:;
- (uint64_t)br_isParentOfURL:()BRAdditions strictly:;
- (uint64_t)br_isStrictlyInSyncedLocation;
- (uint64_t)br_isTopLevelSharedItem;
- (uint64_t)br_wouldBeExcludedFromSync;
- (void)br_addPhysicalProperty;
- (void)br_bookmarkableStringForRemoteOpeningAppWithBundleID:()BRAdditions completion:;
- (void)br_containerIDsWithExternalReferencesWithHandler:()BRAdditions;
- (void)br_isConflictedWithHandler:()BRAdditions;
- (void)br_isExternalDocumentReference;
- (void)br_preCacheBookmarkData:()BRAdditions versionEtag:;
@end

@implementation NSURL(BRAdditions)

- (id)br_realpathURL
{
  v1 = [a1 path];
  v2 = v1;
  if (v1)
  {
    v3 = (void *)MEMORY[0x1E4F1CB10];
    v4 = objc_msgSend(v1, "br_realpath");
    v5 = [v3 fileURLWithPath:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (__CFString)br_containerIDIfIsDocumentsContainerURL
{
  if (![a1 isFileURL])
  {
    v17 = 0;
    goto LABEL_21;
  }
  id v2 = a1;
  id v45 = 0;
  int v3 = [v2 getResourceValue:&v45 forKey:*MEMORY[0x1E4F1C628] error:0];
  id v4 = v45;
  v5 = v4;
  if (!v3)
  {
    id v12 = 0;
    id v13 = v2;
    goto LABEL_16;
  }
  if (![v4 BOOLValue])
  {
    id v12 = 0;
    v17 = 0;
LABEL_19:
    id v13 = v2;
    goto LABEL_20;
  }
  id v44 = 0;
  uint64_t v6 = *MEMORY[0x1E4F1C6E8];
  int v7 = [v2 getResourceValue:&v44 forKey:*MEMORY[0x1E4F1C6E8] error:0];
  id v8 = v44;
  v9 = v8;
  if (!v7)
  {
    v17 = 0;
    id v12 = v8;
    goto LABEL_19;
  }
  int v10 = [v8 isEqualToString:@"Desktop"];
  int v11 = [v9 isEqualToString:@"Documents"];
  if ((v11 & 1) != 0 || v10)
  {
    id v43 = 0;
    int v25 = [v2 getResourceValue:&v43 forKey:*MEMORY[0x1E4F1C6F8] error:0];
    id v13 = v43;

    if (!v25)
    {
      v17 = 0;
      id v12 = v9;
      goto LABEL_20;
    }
    id v42 = 0;
    int v26 = [v13 getResourceValue:&v42 forKey:v6 error:0];
    id v12 = v42;

    if (!v26) {
      goto LABEL_16;
    }
    if ([v12 isEqualToString:@"com~apple~CloudDocs"])
    {
      v27 = BRUbiquitousDocumentsContainerID;
      if (!v11) {
        v27 = BRUbiquitousDesktopContainerID;
      }
      v17 = *v27;
      goto LABEL_20;
    }
    if (v10) {
      goto LABEL_16;
    }
  }
  else
  {
    id v12 = v9;
    id v13 = v2;
  }
  if ([v12 rangeOfString:@"~"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v41 = 0;
    int v14 = [v13 getResourceValue:&v41 forKey:*MEMORY[0x1E4F1CEB0] error:0];
    id v15 = v41;
    v16 = v15;
    v17 = 0;
    if (v14 && v15)
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __61__NSURL_BRAdditions__br_containerIDIfIsDocumentsContainerURL__block_invoke;
      v38[3] = &unk_1E59AEDA8;
      id v18 = v15;
      id v39 = v18;
      id v40 = v12;
      v19 = (void (**)(void, void, void))MEMORY[0x19F3C48D0](v38);
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__8;
      v36 = __Block_byref_object_dispose__8;
      id v37 = 0;
      v20 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_lmdURL");
      if (v20
        && (((void (**)(void, id, void *))v19)[2](v19, v18, v20),
            uint64_t v21 = objc_claimAutoreleasedReturnValue(),
            v22 = (void *)v33[5],
            v33[5] = v21,
            v22,
            (v23 = (void *)v33[5]) != 0))
      {
        v17 = v23;
      }
      else
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __61__NSURL_BRAdditions__br_containerIDIfIsDocumentsContainerURL__block_invoke_2;
        v28[3] = &unk_1E59AEDD0;
        v31 = &v32;
        v30 = v19;
        id v29 = v18;
        BRPerformWithPersonaAndErrorForURLIfAble(v2, v28);
        v17 = (__CFString *)(id)v33[5];
      }
      _Block_object_dispose(&v32, 8);
    }
    goto LABEL_20;
  }
LABEL_16:
  v17 = 0;
LABEL_20:

LABEL_21:

  return v17;
}

+ (void)br_setIOPolicy:()BRAdditions type:forBlock:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v7 = a5;
  getpid();
  if (sandbox_check())
  {
    id v8 = brc_bread_crumbs((uint64_t)"+[NSURL(BRAdditions) br_setIOPolicy:type:forBlock:]", 48);
    v9 = brc_default_log(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v15 = v8;
      _os_log_impl(&dword_19ED3F000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] sandbox_check: current process does not allow iopolicy syscalls%@", buf, 0xCu);
    }

    goto LABEL_5;
  }
  int v10 = getiopolicy_np(a4, a4 != 7);
  if (v10 == -1)
  {
    id v12 = brc_bread_crumbs((uint64_t)"+[NSURL(BRAdditions) br_setIOPolicy:type:forBlock:]", 58);
    id v13 = brc_default_log(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)id v15 = a3;
      *(_WORD *)&v15[4] = 1024;
      *(_DWORD *)&v15[6] = a4;
      __int16 v16 = 1024;
      int v17 = 1;
      __int16 v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_19ED3F000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] getiopolicy_np failed when setting policy: %d, type: %d, scope: %d%@", buf, 0x1Eu);
    }

    goto LABEL_5;
  }
  int v11 = v10;
  if (v10 == a3)
  {
LABEL_5:
    v7[2](v7);
    goto LABEL_6;
  }
  setiopolicy_np(a4, a4 != 7, a3);
  v7[2](v7);
  if ((v11 & 0x80000000) == 0) {
    setiopolicy_np(a4, a4 != 7, v11);
  }
LABEL_6:
}

+ (uint64_t)br_datalessMaterializationOffForBlock:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E4F1CB10], "br_setIOPolicy:type:forBlock:", 1, 3, a3);
}

- (id)br_realpathURLWithIsDirectory:()BRAdditions
{
  id v4 = [a1 path];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CB10];
    int v7 = objc_msgSend(v4, "br_realpath");
    id v8 = [v6 fileURLWithPath:v7 isDirectory:a3];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (uint64_t)br_isInLocalHomeDirectory
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__NSURL_BRAdditions__br_isInLocalHomeDirectory__block_invoke;
  v3[3] = &unk_1E59AEBF0;
  v3[4] = a1;
  v3[5] = &v4;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v3);
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)_br_isParentOfURL:()BRAdditions strictly:ignoreHomeDirectoryCheck:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (![v8 isFileURL]) {
    goto LABEL_15;
  }
  if ((a5 & 1) == 0)
  {
    if ((objc_msgSend(a1, "br_isInLocalHomeDirectory") & 1) == 0)
    {
      uint64_t v20 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) _br_isParentOfURL:strictly:ignoreHomeDirectoryCheck:]", 114);
      uint64_t v21 = brc_default_log(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        -[NSURL(BRAdditions) _br_isParentOfURL:strictly:ignoreHomeDirectoryCheck:]();
      }
    }
    if (!objc_msgSend(v8, "br_isInLocalHomeDirectory"))
    {
LABEL_15:
      uint64_t v18 = 0;
      goto LABEL_14;
    }
  }
  id v29 = 0;
  int v9 = [v8 getResourceValue:&v29 forKey:*MEMORY[0x1E4F1C610] error:0];
  id v10 = v29;
  int v11 = v10;
  if (v9 && [v10 BOOLValue])
  {
    [a1 removeAllCachedResourceValues];
    __int16 v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v27 = 0;
    uint64_t v28 = 0;
    int v22 = [v16 getRelationship:&v28 ofDirectoryAtURL:a1 toItemAtURL:v8 error:&v27];
    id v23 = v27;
    if (v22)
    {
      if (v28) {
        uint64_t v18 = (v28 == 1) & ~a4;
      }
      else {
        uint64_t v18 = 1;
      }

      goto LABEL_13;
    }
    v24 = v23;
    int v25 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) _br_isParentOfURL:strictly:ignoreHomeDirectoryCheck:]", 138);
    int v26 = brc_default_log(0);
    if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138413058;
      v31 = a1;
      __int16 v32 = 2112;
      id v33 = v8;
      __int16 v34 = 2112;
      v35 = v24;
      __int16 v36 = 2112;
      id v37 = v25;
      _os_log_error_impl(&dword_19ED3F000, v26, (os_log_type_t)0x90u, "[ERROR] can't tell if '%@'\n  is parent of alias '%@'\n  error %@%@", buf, 0x2Au);
    }
  }
  id v12 = [v8 path];
  id v13 = objc_msgSend(v12, "br_realpath");
  int v14 = [a1 path];
  id v15 = objc_msgSend(v14, "br_realpath");
  __int16 v16 = objc_msgSend(v13, "br_pathRelativeToPath:", v15);

  if (a4) {
    BOOL v17 = [v16 length] == 0;
  }
  else {
    BOOL v17 = v16 == 0;
  }
  uint64_t v18 = !v17;
LABEL_13:

LABEL_14:
  return v18;
}

- (uint64_t)_br_isParentOfURL:()BRAdditions strictly:withNonMateralizingIOPolicy:ignoreHomeDirectoryCheck:
{
  id v10 = a3;
  int v11 = v10;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  if (a5)
  {
    id v12 = (void *)MEMORY[0x1E4F1CB10];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __102__NSURL_BRAdditions___br_isParentOfURL_strictly_withNonMateralizingIOPolicy_ignoreHomeDirectoryCheck___block_invoke;
    v15[3] = &unk_1E59AEC18;
    BOOL v17 = &v20;
    v15[4] = a1;
    id v16 = v10;
    char v18 = a4;
    char v19 = a6;
    objc_msgSend(v12, "br_datalessMaterializationOffForBlock:", v15);

    uint64_t v13 = *((unsigned char *)v21 + 24) != 0;
  }
  else
  {
    uint64_t v13 = objc_msgSend(a1, "_br_isParentOfURL:strictly:ignoreHomeDirectoryCheck:", v10, a4, a6);
    *((unsigned char *)v21 + 24) = v13;
  }
  _Block_object_dispose(&v20, 8);

  return v13;
}

- (uint64_t)br_isParentOfURL:()BRAdditions strictly:
{
  id v6 = a3;
  uint64_t v8 = objc_msgSend(a1, "_br_isParentOfURL:strictly:withNonMateralizingIOPolicy:ignoreHomeDirectoryCheck:", v6, a4, BRIsFPFSEnabled(v6, v7), 0);

  return v8;
}

- (uint64_t)br_isParentOfURL:()BRAdditions
{
  return objc_msgSend(a1, "br_isParentOfURL:strictly:", a3, 0);
}

- (uint64_t)br_isParentOfURL:()BRAdditions ignoreHomeDirectoryCheck:
{
  id v6 = a3;
  uint64_t v8 = objc_msgSend(a1, "_br_isParentOfURL:strictly:withNonMateralizingIOPolicy:ignoreHomeDirectoryCheck:", v6, 0, BRIsFPFSEnabled(v6, v7), a4);

  return v8;
}

- (uint64_t)br_isExistWithNonMateralizingIOPolicy:()BRAdditions
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__NSURL_BRAdditions__br_isExistWithNonMateralizingIOPolicy___block_invoke;
  v8[3] = &unk_1E59AE180;
  v8[4] = a1;
  v8[5] = &v9;
  uint64_t v4 = MEMORY[0x19F3C48D0](v8);
  v5 = (void *)v4;
  if (a3) {
    objc_msgSend(MEMORY[0x1E4F1CB10], "br_datalessMaterializationOffForBlock:", v4);
  }
  else {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)br_preCacheBookmarkData:()BRAdditions versionEtag:
{
  id v7 = a3;
  id v6 = a4;
  if (v7) {
    [a1 setTemporaryResourceValue:v7 forKey:@"_BRBookmarkData"];
  }
  if (v6) {
    [a1 setTemporaryResourceValue:v6 forKey:@"_BRBookmarkEtag"];
  }
}

- (id)br_cachedBookmarkData
{
  id v3 = 0;
  [a1 getResourceValue:&v3 forKey:@"_BRBookmarkData" error:0];
  id v1 = v3;

  return v1;
}

+ (void)_br_bookmarkableStringForURL:()BRAdditions remoteOpeningAppWithBundleID:onlyAllowItemKnowByServer:completion:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (objc_msgSend(v9, "br_isInSyncedLocation"))
  {
    uint64_t v12 = [v9 isFileReferenceURL];
    if (v12)
    {
      uint64_t v14 = [v9 filePathURL];

      id v9 = (id)v14;
    }
    if (BRIsFPFSEnabled(v12, v13))
    {
      id v39 = 0;
      uint64_t v15 = *MEMORY[0x1E4F1C550];
      id v38 = 0;
      [v9 getResourceValue:&v39 forKey:v15 error:&v38];
      id v16 = v39;
      id v17 = v38;
      if (v17)
      {
        id v18 = v17;
        (*((void (**)(id, void, void, id))v11 + 2))(v11, 0, 0, v17);
      }
      else
      {
        id v37 = 0;
        uint64_t v23 = *MEMORY[0x1E4F1C628];
        id v36 = 0;
        [v9 getResourceValue:&v37 forKey:v23 error:&v36];
        id v24 = v37;
        id v18 = v36;
        if (v18)
        {
          (*((void (**)(id, void, void, id))v11 + 2))(v11, 0, 0, v18);
        }
        else
        {
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __117__NSURL_BRAdditions___br_bookmarkableStringForURL_remoteOpeningAppWithBundleID_onlyAllowItemKnowByServer_completion___block_invoke;
          v30[3] = &unk_1E59AEC68;
          id v34 = v11;
          char v35 = a5;
          id v31 = v10;
          id v32 = v16;
          id v33 = v24;
          objc_msgSend(v9, "_br_fetchItemServiceSyncProxy:", v30);
        }
      }
    }
    else
    {
      uint64_t v20 = +[BRDaemonConnection defaultConnection];
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      id v27 = __117__NSURL_BRAdditions___br_bookmarkableStringForURL_remoteOpeningAppWithBundleID_onlyAllowItemKnowByServer_completion___block_invoke_3;
      uint64_t v28 = &unk_1E59AD510;
      id v21 = v11;
      id v29 = v21;
      uint64_t v22 = [v20 remoteObjectProxyWithErrorHandler:&v25];

      objc_msgSend(v22, "getBookmarkDataForURL:onlyAllowItemKnowByServer:allowAccessByBundleID:reply:", v9, a5, v10, v21, v25, v26, v27, v28);
    }
  }
  else
  {
    char v19 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v9);
    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v19);
  }
}

- (uint64_t)br_bookmarkableStringWithEtag:()BRAdditions completion:
{
  return objc_msgSend(a1, "br_bookmarkableStringWithEtag:onlyAllowItemKnowByServer:completion:", a3, 0, a4);
}

- (uint64_t)br_bookmarkableStringWithEtag:()BRAdditions onlyAllowItemKnowByServer:completion:
{
  return objc_msgSend(MEMORY[0x1E4F1CB10], "br_bookmarkableStringForURL:withEtag:onlyAllowItemKnowByServer:completion:", a1, a3, a4, a5);
}

+ (uint64_t)br_bookmarkableStringForURL:()BRAdditions withEtag:completion:
{
  return objc_msgSend(MEMORY[0x1E4F1CB10], "br_bookmarkableStringForURL:withEtag:onlyAllowItemKnowByServer:completion:", a3, a4, 0, a5);
}

+ (void)br_bookmarkableStringForURL:()BRAdditions withEtag:onlyAllowItemKnowByServer:completion:
{
  id v9 = a3;
  id v10 = a6;
  if (objc_msgSend(v9, "br_isInSyncedLocation"))
  {
    id v23 = 0;
    [v9 getResourceValue:&v23 forKey:@"_BRBookmarkData" error:0];
    id v11 = v23;
    id v12 = 0;
    if (a4)
    {
      id v22 = 0;
      [v9 getResourceValue:&v22 forKey:@"_BRBookmarkEtag" error:0];
      id v12 = v22;
    }
    if ([v11 isEqualToString:@"invalid"])
    {
      (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
    }
    else
    {
      if (v12) {
        char v13 = 0;
      }
      else {
        char v13 = a4;
      }
      if (!v11 || (v13 & 1) != 0)
      {
        uint64_t v16 = MEMORY[0x1E4F143A8];
        uint64_t v17 = 3221225472;
        id v18 = __96__NSURL_BRAdditions__br_bookmarkableStringForURL_withEtag_onlyAllowItemKnowByServer_completion___block_invoke;
        char v19 = &unk_1E59AEC90;
        id v21 = v10;
        id v14 = v9;
        id v20 = v14;
        uint64_t v15 = (void *)MEMORY[0x19F3C48D0](&v16);
        objc_msgSend(MEMORY[0x1E4F1CB10], "_br_bookmarkableStringForURL:remoteOpeningAppWithBundleID:onlyAllowItemKnowByServer:completion:", v14, 0, a5, v15, v16, v17, v18, v19);
      }
      else
      {
        (*((void (**)(id, id, id, void))v10 + 2))(v10, v11, v12, 0);
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v11);
  }
}

- (void)br_bookmarkableStringForRemoteOpeningAppWithBundleID:()BRAdditions completion:
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CB10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__NSURL_BRAdditions__br_bookmarkableStringForRemoteOpeningAppWithBundleID_completion___block_invoke;
  v9[3] = &unk_1E59AEC40;
  id v10 = v6;
  id v8 = v6;
  objc_msgSend(v7, "_br_bookmarkableStringForURL:remoteOpeningAppWithBundleID:onlyAllowItemKnowByServer:completion:", a1, a3, 0, v9);
}

+ (id)br_documentURLFromFileObjectID:()BRAdditions error:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_msgSend(NSString, "br_currentHomeDir");
  memset(&v31, 0, sizeof(v31));
  id v6 = objc_claimAutoreleasedReturnValue();
  if (stat((const char *)[v6 fileSystemRepresentation], &v31))
  {
    id v7 = brc_bread_crumbs((uint64_t)"+[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:]", 335);
    id v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      +[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:].cold.5();
    }
  }
  br_documentURLFromFileObjectID_error__deviceID = v31.st_dev;
  int v9 = [v5 isDocumentID];
  uint64_t v10 = [v5 rawID];
  if (v9)
  {
    uint64_t v11 = GSLibraryResolveDocumentId2();
    if (!v11)
    {
      if (*__error() != 35 && *__error() != 16 && *__error() != 70)
      {
        id v23 = brc_bread_crumbs((uint64_t)"+[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:]", 344);
        id v24 = brc_default_log(0);
        if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
          +[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:]();
        }

        goto LABEL_18;
      }
      id v12 = brc_bread_crumbs((uint64_t)"+[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:]", 347);
      char v13 = brc_default_log(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        +[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:]((uint64_t)v12, v13);
      }
      goto LABEL_17;
    }
LABEL_13:
    v30.val[0] = br_documentURLFromFileObjectID_error__deviceID;
    v30.val[1] = 0;
    if ((fsgetpath(v32, 0x400uLL, &v30, v11) & 0x8000000000000000) == 0)
    {
      objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", v32);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
      uint64_t v16 = objc_msgSend(v15, "br_logicalURL");

      goto LABEL_24;
    }
    id v12 = brc_bread_crumbs((uint64_t)"+[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:]", 362);
    char v13 = brc_default_log(0);
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
      +[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:].cold.4();
    }
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v11 = v10;
  if (v10) {
    goto LABEL_13;
  }
LABEL_18:
  uint64_t v17 = brc_bread_crumbs((uint64_t)"+[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:]", 365);
  id v18 = brc_default_log(1);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    +[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:]((uint64_t)v5, (uint64_t)v17, v18);
  }

  char v19 = +[BRDaemonConnection secondaryConnection];
  id v20 = (void *)[v19 newLegacySyncProxy];

  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  id v27 = __59__NSURL_BRAdditions__br_documentURLFromFileObjectID_error___block_invoke;
  uint64_t v28 = &unk_1E59AECB8;
  id v14 = v20;
  id v29 = v14;
  [v14 resolveFileObjectIDToURL:v5 reply:&v25];
  id v21 = objc_msgSend(v14, "result", v25, v26, v27, v28);

  if (a4 && !v21)
  {
    *a4 = [v14 error];
  }
  uint64_t v16 = [v14 result];

LABEL_24:

  return v16;
}

+ (void)br_documentURLFromBookmarkableString:()BRAdditions completion:
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[BRDaemonConnection defaultConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__NSURL_BRAdditions__br_documentURLFromBookmarkableString_completion___block_invoke;
  v13[3] = &unk_1E59AD510;
  id v8 = v5;
  id v14 = v8;
  int v9 = [v7 remoteObjectProxyWithErrorHandler:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__NSURL_BRAdditions__br_documentURLFromBookmarkableString_completion___block_invoke_2;
  v11[3] = &unk_1E59AECE0;
  id v12 = v8;
  id v10 = v8;
  [v9 resolveBookmarkDataToURL:v6 reply:v11];
}

+ (id)br_documentURLFromBookmarkableString:()BRAdditions error:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__8;
  uint64_t v26 = __Block_byref_object_dispose__8;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  char v19 = __Block_byref_object_copy__8;
  id v20 = __Block_byref_object_dispose__8;
  id v21 = 0;
  id v6 = +[BRDaemonConnection defaultConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__NSURL_BRAdditions__br_documentURLFromBookmarkableString_error___block_invoke;
  v15[3] = &unk_1E59AE9C0;
  v15[4] = &v16;
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v15];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__NSURL_BRAdditions__br_documentURLFromBookmarkableString_error___block_invoke_2;
  v14[3] = &unk_1E59AED08;
  v14[4] = &v22;
  v14[5] = &v16;
  [v7 resolveBookmarkDataToURL:v5 reply:v14];
  id v8 = (id)v17[5];
  if (v8)
  {
    int v9 = brc_bread_crumbs((uint64_t)"+[NSURL(BRAdditions) br_documentURLFromBookmarkableString:error:]", 407);
    id v10 = brc_default_log(0);
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      char v13 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      id v29 = "+[NSURL(BRAdditions) br_documentURLFromBookmarkableString:error:]";
      __int16 v30 = 2080;
      if (!a4) {
        char v13 = "(ignored by caller)";
      }
      stat v31 = v13;
      __int16 v32 = 2112;
      id v33 = v8;
      __int16 v34 = 2112;
      char v35 = v9;
      _os_log_error_impl(&dword_19ED3F000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a4) {
    *a4 = v8;
  }

  id v11 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);

  return v11;
}

- (void)br_containerIDsWithExternalReferencesWithHandler:()BRAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  v10[0] = a1;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__NSURL_BRAdditions__br_containerIDsWithExternalReferencesWithHandler___block_invoke;
  v8[3] = &unk_1E59AED30;
  v8[4] = a1;
  id v9 = v4;
  id v7 = v4;
  objc_msgSend(v5, "br_containerIDsWithExternalReferencesTo:completionHandler:", v6, v8);
}

+ (void)br_containerIDsWithExternalReferencesTo:()BRAdditions completionHandler:
{
  id v5 = a3;
  id v6 = a4;
  if (BRIsFPFSEnabled(v6, v7))
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorMethodNotImplemented:", sel_br_containerIDsWithExternalReferencesTo_completionHandler_);
    v6[2](v6, 0, v8);
  }
  else
  {
    id v9 = +[BRDaemonConnection defaultConnection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __80__NSURL_BRAdditions__br_containerIDsWithExternalReferencesTo_completionHandler___block_invoke;
    v12[3] = &unk_1E59AD510;
    id v10 = v6;
    id v13 = v10;
    id v11 = [v9 remoteObjectProxyWithErrorHandler:v12];

    [v11 getBackReferencingContainerIDsForURLs:v5 reply:v10];
  }
}

- (id)br_pathRelativeToSyncedRootURLForContainerID:()BRAdditions
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__8;
  id v12 = __Block_byref_object_dispose__8;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__NSURL_BRAdditions__br_pathRelativeToSyncedRootURLForContainerID___block_invoke;
  v7[3] = &unk_1E59AEBF0;
  v7[4] = a1;
  v7[5] = &v8;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)br_pathRelativeToMobileDocuments
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__8;
  uint64_t v8 = __Block_byref_object_dispose__8;
  id v9 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__NSURL_BRAdditions__br_pathRelativeToMobileDocuments__block_invoke;
  v3[3] = &unk_1E59AEBF0;
  v3[4] = a1;
  v3[5] = &v4;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v3);
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (id)br_debugDescription
{
  id v2 = (void *)MEMORY[0x1E4F28E78];
  id v3 = [a1 path];
  uint64_t v4 = [v2 stringWithFormat:@"path: %@", v3];

  id v34 = 0;
  uint64_t v5 = *MEMORY[0x1E4F1C5A0];
  id v33 = 0;
  char v6 = [a1 getResourceValue:&v34 forKey:v5 error:&v33];
  id v7 = v34;
  id v8 = v33;
  id v9 = v8;
  if ((v6 & 1) == 0)
  {
    id v10 = v8;

    id v7 = v10;
  }
  [v4 appendFormat:@"  id:%@\n", v7];
  id v32 = 0;
  uint64_t v11 = *MEMORY[0x1E4F1C820];
  id v31 = 0;
  char v12 = [a1 getResourceValue:&v32 forKey:v11 error:&v31];
  id v13 = v32;

  id v14 = v31;
  if ((v12 & 1) == 0)
  {
    id v15 = v14;

    id v13 = v15;
  }
  [v4 appendFormat:@"  volume:%@\n", v13];
  id v30 = 0;
  uint64_t v16 = *MEMORY[0x1E4F1C628];
  id v29 = 0;
  char v17 = [a1 getResourceValue:&v30 forKey:v16 error:&v29];
  id v18 = v30;

  id v19 = v29;
  if ((v17 & 1) == 0)
  {
    id v20 = v19;

    id v18 = v20;
  }
  [v4 appendFormat:@"  directory:%@\n", v18];
  id v28 = 0;
  uint64_t v21 = *MEMORY[0x1E4F1C6F8];
  id v27 = 0;
  int v22 = [a1 getResourceValue:&v28 forKey:v21 error:&v27];
  id v23 = v28;

  id v24 = v27;
  if (v22)
  {
    uint64_t v25 = objc_msgSend(v23, "br_debugDescription");

    id v23 = (id)v25;
  }
  else
  {
    uint64_t v25 = (uint64_t)v24;
  }
  [v4 appendFormat:@"  parent:%@\n", v25];

  return v4;
}

- (uint64_t)br_isInTrash
{
  if (BRIsFPFSEnabled(a1, a2))
  {
    if (br_isInTrash_once != -1) {
      dispatch_once(&br_isInTrash_once, &__block_literal_global_23);
    }
    id v3 = [a1 path];
    uint64_t v4 = [v3 containsString:br_isInTrash_centralizedTrashSubStr];
  }
  else
  {
    id v3 = objc_msgSend(a1, "br_cloudDocsContainer");
    uint64_t v5 = [v3 trashURL];
    uint64_t v4 = objc_msgSend(v5, "br_isParentOfURL:strictly:", a1, 1);
  }
  return v4;
}

- (uint64_t)br_isInSyncedDesktop
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__NSURL_BRAdditions__br_isInSyncedDesktop__block_invoke;
  v3[3] = &unk_1E59AEBF0;
  v3[4] = a1;
  v3[5] = &v4;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v3);
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)br_isInSyncedDocuments
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__NSURL_BRAdditions__br_isInSyncedDocuments__block_invoke;
  v3[3] = &unk_1E59AEBF0;
  v3[4] = a1;
  v3[5] = &v4;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v3);
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)br_isInSyncedLocation
{
  return objc_msgSend(a1, "_br_isInSyncedLocationStrictly:", 0);
}

- (uint64_t)br_isStrictlyInSyncedLocation
{
  return objc_msgSend(a1, "_br_isInSyncedLocationStrictly:", 1);
}

- (uint64_t)_br_mightBeInSyncedLocationUnderCurrentPersonaID:()BRAdditions strictly:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = +[BRDaemonConnection syncedRootURLsForPersonaID:needsPersonaSwitch:](BRDaemonConnection, "syncedRootURLsForPersonaID:needsPersonaSwitch:", a3, 0, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "br_isParentOfURL:strictly:", a1, a4))
        {
          uint64_t v11 = 1;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

- (uint64_t)_br_isInSyncedLocationStrictly:()BRAdditions
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__NSURL_BRAdditions___br_isInSyncedLocationStrictly___block_invoke;
  v5[3] = &unk_1E59AED58;
  v5[4] = a1;
  v5[5] = &v7;
  char v6 = a3;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v5);
  uint64_t v3 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (uint64_t)br_isInCloudDocsPrivateStorages
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__NSURL_BRAdditions__br_isInCloudDocsPrivateStorages__block_invoke;
  v3[3] = &unk_1E59AEBF0;
  v3[4] = a1;
  v3[5] = &v4;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v3);
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)br_isInCloudDocsPrivateStoragesForRemoteDocumentVersions
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__8;
  uint64_t v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__NSURL_BRAdditions__br_isInCloudDocsPrivateStoragesForRemoteDocumentVersions__block_invoke;
  v4[3] = &unk_1E59AED80;
  v4[4] = &v5;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v4);
  uint64_t v2 = objc_msgSend((id)v6[5], "br_isParentOfURL:", a1);
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)br_isConflictedWithHandler:()BRAdditions
{
  uint64_t v4 = a3;
  if (objc_msgSend(a1, "br_isInSyncedLocation"))
  {
    id v7 = 0;
    uint64_t v5 = objc_msgSend(a1, "_br_getAttributeValue:withSecondaryConnection:withError:", @"BRURLUbiquitousItemIsConflictedKey", 1, &v7);
    id v6 = v7;
    v4[2](v4, [v5 BOOLValue], v6);
  }
  else
  {
    v4[2](v4, 0, 0);
  }
}

- (uint64_t)br_isInSharedDocsContainer
{
  return 0;
}

- (id)br_containerID
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__8;
  uint64_t v8 = __Block_byref_object_dispose__8;
  id v9 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__NSURL_BRAdditions__br_containerID__block_invoke;
  v3[3] = &unk_1E59AEBF0;
  v3[4] = a1;
  v3[5] = &v4;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v3);
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (uint64_t)br_containerIDIfIsDesktopOrDocumentsURL
{
  return 0;
}

- (BOOL)br_isDocumentsContainer
{
  id v1 = objc_msgSend(a1, "br_containerIDIfIsDocumentsContainerURL");
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)br_mightBeBRAlias
{
  id v1 = [a1 lastPathComponent];
  BOOL v2 = objc_msgSend(v1, "br_pathExtension");
  if ([v2 isEqualToString:@"alias"]) {
    BOOL v3 = [v1 characterAtIndex:0] == 46;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)br_cloudDocsContainer
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__8;
  uint64_t v8 = __Block_byref_object_dispose__8;
  id v9 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__NSURL_BRAdditions__br_cloudDocsContainer__block_invoke;
  v3[3] = &unk_1E59AEDF8;
  v3[4] = a1;
  v3[5] = &v4;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v3);
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (uint64_t)br_isExternalDocumentReference
{
  id v10 = 0;
  int v2 = [a1 getResourceValue:&v10 forKey:*MEMORY[0x1E4F1C610] error:0];
  id v3 = v10;
  uint64_t v4 = v3;
  if (v2
    && [v3 BOOLValue]
    && (id v5 = a1,
        getxattr((const char *)[v5 fileSystemRepresentation], "com.apple.clouddocs.security", 0, 0, 0, 1) >= 1))
  {
    uint64_t v6 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_isExternalDocumentReference]", 797);
    id v7 = brc_default_log(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(NSURL(BRAdditions) *)v5 br_isExternalDocumentReference];
    }

    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)br_externalDocumentPropertiesWithError:()BRAdditions
{
  v13[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F1D560];
  v13[0] = *MEMORY[0x1E4F1C550];
  v13[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1CEB0];
  v13[2] = *MEMORY[0x1E4F1CDD0];
  v13[3] = v6;
  void v13[4] = *MEMORY[0x1E4F1C6E8];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:5];
  uint64_t v8 = [MEMORY[0x1E4F1CB10] bookmarkDataWithContentsOfURL:a1 error:a3];
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1CB10] resourceValuesForKeys:v7 fromBookmarkData:v8];
  }
  else
  {
    id v10 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_externalDocumentPropertiesWithError:]", 809);
    uint64_t v11 = brc_default_log(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[NSURL(BRAdditions) br_externalDocumentPropertiesWithError:]();
    }

    id v9 = 0;
  }

  return v9;
}

- (id)br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:()BRAdditions
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F1C550];
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1C550]];
  if (!v6
    || (id v33 = 0,
        [a1 getResourceValue:&v33 forKey:*MEMORY[0x1E4F1CEF0] error:0],
        (id v7 = v33) == 0))
  {
    long long v14 = 0;
    goto LABEL_41;
  }
  uint64_t v8 = v7;
  uint64_t v30 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1C6E8]];
  id v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1CDD0]];
  if (v9)
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "brc_fileURLWithVolumeDeviceID:fileID:isDirectory:", v8, v9, 0);
    id v32 = 0;
    int v11 = [v10 getResourceValue:&v32 forKey:v5 error:0];
    id v12 = v32;
    id v13 = v12;
    if (v11 && objc_msgSend(v12, "br_isEqualToNumber:", v6))
    {
      if (objc_msgSend(v10, "br_isInSyncedLocation"))
      {
        long long v14 = objc_msgSend(v10, "br_logicalURL");
        long long v15 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:]", 842);
        long long v16 = brc_default_log(1);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          id v28 = v15;
          if (v10 == v14) {
            char v17 = &stru_1EF11DA20;
          }
          else {
            char v17 = @"promise, returning logical URL ";
          }
          uint64_t v18 = [v14 path];
          *(_DWORD *)buf = 138412802;
          char v35 = v17;
          long long v15 = v28;
          __int16 v36 = 2112;
          id v37 = v18;
          __int16 v38 = 2112;
          id v39 = v28;
          _os_log_debug_impl(&dword_19ED3F000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] resolved by fileID to %@%@%@", buf, 0x20u);
        }
      }
      else
      {
        long long v15 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:]", 836);
        long long v16 = brc_default_log(1);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          [(NSURL(BRAdditions) *)v10 br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:v16];
        }
        long long v14 = 0;
      }
      goto LABEL_38;
    }
    id v19 = v13;
  }
  else
  {
    id v19 = 0;
    id v10 = 0;
  }
  id v20 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1CEB0]];

  uint64_t v21 = (void *)v30;
  if (v20) {
    BOOL v22 = v30 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  if (!v22)
  {
    id v23 = objc_msgSend(MEMORY[0x1E4F1CB10], "brc_fileURLWithVolumeDeviceID:fileID:isDirectory:", v8, v20, 1);

    if (v23)
    {
      id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v30 isDirectory:0 relativeToURL:v23];

      id v31 = 0;
      int v24 = [v10 getResourceValue:&v31 forKey:v5 error:0];
      id v13 = v31;

      if (!v24 || !objc_msgSend(v13, "br_isEqualToNumber:", v6))
      {
        long long v14 = 0;
        id v19 = v13;
LABEL_39:
        uint64_t v21 = (void *)v30;
        goto LABEL_40;
      }
      if (objc_msgSend(v10, "br_isInSyncedLocation"))
      {
        long long v14 = objc_msgSend(v10, "br_logicalURL");
        long long v15 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:]", 860);
        long long v16 = brc_default_log(1);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          id v29 = v15;
          if (v10 == v14) {
            uint64_t v25 = &stru_1EF11DA20;
          }
          else {
            uint64_t v25 = @"promise, returning logical URL ";
          }
          uint64_t v26 = [v14 path];
          *(_DWORD *)buf = 138412802;
          char v35 = v25;
          long long v15 = v29;
          __int16 v36 = 2112;
          id v37 = v26;
          __int16 v38 = 2112;
          id v39 = v29;
          _os_log_debug_impl(&dword_19ED3F000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] resolved by parent ID and name to %@%@%@", buf, 0x20u);
        }
      }
      else
      {
        long long v15 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:]", 854);
        long long v16 = brc_default_log(1);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          [(NSURL(BRAdditions) *)v10 br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:v16];
        }
        long long v14 = 0;
      }
      id v9 = v20;
LABEL_38:

      id v19 = v13;
      id v20 = v9;
      goto LABEL_39;
    }
    id v10 = 0;
  }
  long long v14 = 0;
LABEL_40:

LABEL_41:

  return v14;
}

- (id)br_URLByResolvingExternalDocumentReferenceWithError:()BRAdditions
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  memset(v31, 0, sizeof(v31));
  __brc_create_section(0, (uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]", 871, v31);
  uint64_t v5 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]", 871);
  uint64_t v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = (const char *)v31[0];
    BOOL v22 = [a1 path];
    *(_DWORD *)buf = 134218754;
    id v33 = v21;
    __int16 v34 = 2080;
    char v35 = "-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]";
    __int16 v36 = 2112;
    id v37 = v22;
    __int16 v38 = 2112;
    id v39 = v5;
    _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %s: %@%@", buf, 0x2Au);
  }
  id v7 = objc_msgSend(a1, "br_externalDocumentPropertiesWithError:", a3);
  if (!v7)
  {
    id v10 = 0;
    goto LABEL_34;
  }
  uint64_t v8 = objc_msgSend(a1, "br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:", v7);
  id v9 = v8;
  if (!v8)
  {
    int v11 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1D560]];
    if (([v11 hasPrefix:@"docs.icloud.com:"] & 1) == 0)
    {
      if (a3)
      {
        *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BRCloudDocsErrorDomain" code:10 userInfo:0];
      }
      id v19 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]", 884);
      id v20 = brc_default_log(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[NSURL(BRAdditions) br_externalDocumentPropertiesWithError:]();
      }

      id v10 = 0;
      id v12 = v11;
      goto LABEL_32;
    }
    id v12 = [v11 substringFromIndex:objc_msgSend(@"docs.icloud.com:", "length")];

    id v30 = 0;
    id v13 = (void *)BRCopyDocumentURLForUbiquitousBookmarkData((uint64_t)v12, &v30);
    if (!v13)
    {
      id v23 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]", 908);
      int v24 = brc_default_log(1);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        [(NSURL(BRAdditions) *)(uint64_t *)&v30 br_URLByResolvingExternalDocumentReferenceWithError:v24];
      }

      char v17 = v30;
      if (v30)
      {
        uint64_t v25 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]", 909);
        uint64_t v26 = brc_default_log(0);
        if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
        {
          id v28 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          id v33 = "-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]";
          __int16 v34 = 2080;
          if (!a3) {
            id v28 = "(ignored by caller)";
          }
          char v35 = v28;
          __int16 v36 = 2112;
          id v37 = v17;
          __int16 v38 = 2112;
          id v39 = v25;
          _os_log_error_impl(&dword_19ED3F000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      id v10 = 0;
      if (a3) {
        *a3 = v17;
      }
      goto LABEL_29;
    }
    long long v14 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]", 893);
    long long v15 = brc_default_log(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      long long v16 = [v13 path];
      -[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:].cold.4(v16, (uint64_t)v14, (uint64_t)buf, v15);
    }

    if (([v13 checkResourceIsReachableAndReturnError:0] & 1) == 0)
    {
      id v10 = (id)_CFURLPromiseCopyPhysicalURL();
      if (v10)
      {
        CFRelease(v13);
        if (!objc_msgSend(v10, "br_isInCloudDocsPrivateStorages"))
        {
LABEL_32:

          goto LABEL_33;
        }
        char v17 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]", 900);
        uint64_t v18 = brc_default_log(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          -[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]();
        }

LABEL_29:
        goto LABEL_32;
      }
      if (objc_msgSend(v13, "br_isInCloudDocsPrivateStorages"))
      {
        char v17 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]", 903);
        id v29 = brc_default_log(0);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
          -[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]();
        }

        id v10 = v13;
        goto LABEL_29;
      }
    }
    id v10 = v13;
    goto LABEL_32;
  }
  id v10 = v8;
LABEL_33:

LABEL_34:
  __brc_leave_section((uint64_t)v31);

  return v10;
}

- (id)br_itemID
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v2 = +[BRContainerCache containerHelper];
  id v8 = 0;
  id v3 = [v2 itemIDForURL:a1 error:&v8];
  id v4 = v8;

  if (!v3)
  {
    uint64_t v5 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_itemID]", 918);
    uint64_t v6 = brc_default_log(0);
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v10 = a1;
      __int16 v11 = 2112;
      id v12 = v4;
      __int16 v13 = 2112;
      long long v14 = v5;
      _os_log_error_impl(&dword_19ED3F000, v6, (os_log_type_t)0x90u, "[ERROR] error getting itemID for item at URL %@: %@%@", buf, 0x20u);
    }
  }

  return v3;
}

- (uint64_t)br_documentRecordIDWithError:()BRAdditions
{
  return objc_msgSend(a1, "_br_getAttributeValue:withSecondaryConnection:withError:", @"BRURLUbiquitousDocumentRecordIDKey", 0, a3);
}

- (id)br_logicalURL
{
  if (_CFURLIsItemPromiseAtURL())
  {
    id v2 = (id)_CFURLCopyLogicalURLOfPromiseAtURL();
    objc_msgSend(v2, "br_addPhysicalProperty");
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

- (BOOL)br_isPromiseURL
{
  return _CFURLIsItemPromiseAtURL() != 0;
}

- (void)br_addPhysicalProperty
{
  if ((BRIsFPFSEnabled(a1, a2) & 1) == 0)
  {
    if ([a1 checkResourceIsReachableAndReturnError:0])
    {
      _CFURLPromiseSetPhysicalURL();
    }
    else
    {
      id v3 = (id)_CFURLCopyPromiseURLOfLogicalURL();
      if ([v3 checkResourceIsReachableAndReturnError:0]) {
        _CFURLPromiseSetPhysicalURL();
      }
    }
  }
}

- (BOOL)br_setAccessTime:()BRAdditions error:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (BRIsFPFSEnabled(a1, a2))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorMethodNotImplemented:", sel_overwriteAccessTimeForItemAtURL_atime_reply_);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      id v8 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_setAccessTime:error:]", 963);
      id v9 = brc_default_log(0);
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      {
        uint64_t v15 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        id v19 = "-[NSURL(BRAdditions) br_setAccessTime:error:]";
        __int16 v20 = 2080;
        if (!a4) {
          uint64_t v15 = "(ignored by caller)";
        }
        uint64_t v21 = v15;
        __int16 v22 = 2112;
        id v23 = v7;
        __int16 v24 = 2112;
        uint64_t v25 = v8;
        _os_log_error_impl(&dword_19ED3F000, v9, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4)
    {
      id v7 = v7;
      BOOL v10 = 0;
      *a4 = v7;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    __int16 v11 = +[BRDaemonConnection defaultConnection];
    id v12 = (void *)[v11 newLegacySyncProxy];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __45__NSURL_BRAdditions__br_setAccessTime_error___block_invoke;
    v16[3] = &unk_1E59AD448;
    id v7 = v12;
    id v17 = v7;
    [v7 overwriteAccessTimeForItemAtURL:a1 atime:a3 reply:v16];
    if (a4)
    {
      *a4 = [v7 error];
    }
    __int16 v13 = [v7 error];
    BOOL v10 = v13 == 0;
  }
  return v10;
}

- (id)br_typeIdentifierWithError:()BRAdditions
{
  objc_msgSend(a1, "br_addPhysicalProperty");
  id v7 = 0;
  [a1 getPromisedItemResourceValue:&v7 forKey:*MEMORY[0x1E4F1C728] error:a3];
  id v5 = v7;

  return v5;
}

- (uint64_t)br_wouldBeExcludedFromSync
{
  id v1 = [a1 path];
  uint64_t v2 = objc_msgSend(v1, "br_isExcludedWithMaximumDepth:", 100);

  return v2;
}

- (BOOL)br_isSymLink
{
  id v4 = 0;
  [a1 getResourceValue:&v4 forKey:*MEMORY[0x1E4F1C680] error:0];
  id v1 = v4;
  objc_opt_class();
  BOOL v2 = (objc_opt_isKindOfClass() & 1) != 0 && [v1 intValue] != 0;

  return v2;
}

- (uint64_t)br_capabilityToMoveToURL:()BRAdditions error:
{
  id v6 = a3;
  id v7 = [a1 URLByDeletingLastPathComponent];
  id v8 = [v6 URLByDeletingLastPathComponent];
  id v9 = [v7 path];
  BOOL v10 = objc_msgSend(v9, "br_realpath");
  __int16 v11 = [v8 path];
  id v12 = objc_msgSend(v11, "br_realpath");
  char v13 = [v10 isEqualToString:v12];

  if (v13)
  {
    uint64_t v14 = 64;
  }
  else
  {
    uint64_t v15 = [v6 path];
    char v16 = objc_msgSend(v15, "br_isExcludedWithMaximumDepth:", 1024);

    if (v16)
    {
      uint64_t v14 = 8;
    }
    else
    {
      id v17 = +[BRContainerCache containerHelper];
      uint64_t v14 = objc_msgSend(v17, "br_capabilityToMoveFromURL:toNewParent:error:", a1, v8, a4);
    }
  }

  return v14;
}

- (uint64_t)br_isTopLevelSharedItem
{
  uint64_t result = objc_msgSend(a1, "br_isInSyncedLocation");
  if (result)
  {
    id v3 = BRGetAttributeValueForItem(a1, @"BRURLUbiquitousIsTopLevelSharedItemKey", 0);
    uint64_t v4 = [v3 BOOLValue];

    return v4;
  }
  return result;
}

- (uint64_t)br_isModifiedSinceShared
{
  uint64_t result = objc_msgSend(a1, "br_isInSyncedLocation");
  if (result)
  {
    id v3 = BRGetAttributeValueForItem(a1, @"BRModifiedSinceSharedKey", 0);
    uint64_t v4 = [v3 BOOLValue];

    return v4;
  }
  return result;
}

- (id)br_creatorNameComponentsWithError:()BRAdditions
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a1, "br_isInSyncedLocation");
  if (v5)
  {
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x3032000000;
    id v33 = __Block_byref_object_copy__8;
    __int16 v34 = __Block_byref_object_dispose__8;
    id v35 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = __Block_byref_object_copy__8;
    id v28 = __Block_byref_object_dispose__8;
    id v29 = 0;
    if (BRIsFPFSEnabled(v5, v6))
    {
      objc_msgSend(a1, "_br_itemServiceSyncProxy");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __56__NSURL_BRAdditions__br_creatorNameComponentsWithError___block_invoke;
      v23[3] = &unk_1E59AEE20;
      v23[4] = &v24;
      v23[5] = &v30;
      [v7 getCreatorNameComponents:v23];
    }
    else
    {
      id v9 = +[BRDaemonConnection defaultConnection];
      BOOL v10 = (void *)[v9 newLegacySyncProxy];

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __56__NSURL_BRAdditions__br_creatorNameComponentsWithError___block_invoke_2;
      v21[3] = &unk_1E59AEE48;
      id v7 = v10;
      id v22 = v7;
      [v7 getCreatorNameComponentsForURL:a1 reply:v21];
      uint64_t v11 = [v7 result];
      id v12 = (void *)v31[5];
      v31[5] = v11;

      uint64_t v13 = [v7 error];
      uint64_t v14 = (void *)v25[5];
      v25[5] = v13;
    }
    uint64_t v15 = (void *)v31[5];
    if (!v15)
    {
      id v16 = (id)v25[5];
      if (v16)
      {
        id v17 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_creatorNameComponentsWithError:]", 1060);
        uint64_t v18 = brc_default_log(0);
        if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
        {
          __int16 v20 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          id v37 = "-[NSURL(BRAdditions) br_creatorNameComponentsWithError:]";
          __int16 v38 = 2080;
          if (!a3) {
            __int16 v20 = "(ignored by caller)";
          }
          id v39 = v20;
          __int16 v40 = 2112;
          id v41 = v16;
          __int16 v42 = 2112;
          id v43 = v17;
          _os_log_error_impl(&dword_19ED3F000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a3) {
        *a3 = v16;
      }

      uint64_t v15 = (void *)v31[5];
    }
    id v8 = v15;
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)br_getSyncRootWithError:()BRAdditions
{
  v29[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_lmdURL");
  char v28 = 0;
  if (v5)
  {
    id v27 = 0;
    int v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "br_isURL:syncRootOwnedByICloudDrive:withError:", v5, &v28, &v27);
    id v7 = v27;
    if (v6) {
      BOOL v8 = v28 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8 && objc_msgSend(v5, "br_isParentOfURL:ignoreHomeDirectoryCheck:", a1, 1))
    {
      id v9 = v5;
      goto LABEL_31;
    }
    if (v7)
    {
      if (a3)
      {
        id v7 = v7;
        id v9 = 0;
        *a3 = v7;
        goto LABEL_31;
      }
      goto LABEL_15;
    }
  }
  BOOL v10 = [a1 path];
  int v11 = [v10 containsString:@"Mobile Documents"];

  if (!v11)
  {
    id v7 = 0;
LABEL_15:
    id v9 = 0;
    goto LABEL_31;
  }
  id v12 = [a1 pathComponents];
  uint64_t v13 = [v12 indexOfObjectWithOptions:2 passingTest:&__block_literal_global_66_0];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
    id v9 = 0;
  }
  else
  {
    unint64_t v14 = v13;
    uint64_t v25 = a3;
    unint64_t v15 = 0;
    id v16 = 0;
    id v17 = 0;
    do
    {
      uint64_t v18 = objc_msgSend(v12, "objectAtIndexedSubscript:", v15, v25);
      id v19 = (void *)v18;
      if (v16)
      {
        uint64_t v20 = [v16 URLByAppendingPathComponent:v18];
        uint64_t v21 = v16;
      }
      else
      {
        id v22 = (void *)MEMORY[0x1E4F1CB10];
        v29[0] = v18;
        uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
        uint64_t v20 = [v22 fileURLWithPathComponents:v21];
      }
      id v16 = (void *)v20;

      if ([v19 isEqualToString:@"Mobile Documents"])
      {
        id v26 = v17;
        int v23 = objc_msgSend(MEMORY[0x1E4F1CB10], "br_isURL:syncRootOwnedByICloudDrive:withError:", v16, &v28, &v26);
        id v7 = v26;

        if (v23 && v28)
        {
          id v9 = v16;

          goto LABEL_29;
        }
        id v17 = v7;
      }

      ++v15;
    }
    while (v15 <= v14);
    if (v25)
    {
      id v7 = v17;
      id v9 = 0;
      *uint64_t v25 = v7;
    }
    else
    {
      id v9 = 0;
      id v7 = v17;
    }
LABEL_29:
  }
LABEL_31:

  return v9;
}

- (void)_br_isParentOfURL:()BRAdditions strictly:ignoreHomeDirectoryCheck:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: self.br_isInLocalHomeDirectory%@", v2, v3, v4, v5, v6);
}

+ (void)br_documentURLFromFileObjectID:()BRAdditions error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  OUTLINED_FUNCTION_3_0(&dword_19ED3F000, a3, (uint64_t)a3, "[DEBUG] can't find file ID for %@, falling back to bird%@", (uint8_t *)&v3);
}

+ (void)br_documentURLFromFileObjectID:()BRAdditions error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  v5[0] = 67109378;
  v5[1] = v4;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_debug_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] doc ID resolution failed with errno(%d)%@", (uint8_t *)v5, 0x12u);
}

+ (void)br_documentURLFromFileObjectID:()BRAdditions error:.cold.3()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = __error();
  int v4 = strerror(*v3);
  int v5 = 134218498;
  uint64_t v6 = v1;
  __int16 v7 = 2080;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v2;
  _os_log_error_impl(&dword_19ED3F000, v0, (os_log_type_t)0x90u, "[ERROR] can't resolve doc ID \"%lld\"; %s%@",
    (uint8_t *)&v5,
    0x20u);
}

+ (void)br_documentURLFromFileObjectID:()BRAdditions error:.cold.4()
{
  OUTLINED_FUNCTION_5_1();
  __error();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_2(&dword_19ED3F000, v0, v1, "[ERROR] can't find url for file object id %@:  %{errno}d%@", v2, v3, v4, v5, v6);
}

+ (void)br_documentURLFromFileObjectID:()BRAdditions error:.cold.5()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  __error();
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_19ED3F000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't stat %@, failed with errno(%d)%@", v1, 0x1Cu);
}

- (void)br_isExternalDocumentReference
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 path];
  int v6 = 136315650;
  __int16 v7 = "-[NSURL(BRAdditions) br_isExternalDocumentReference]";
  __int16 v8 = 2112;
  __int16 v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_debug_impl(&dword_19ED3F000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: external document '%@'%@", (uint8_t *)&v6, 0x20u);
}

- (void)br_externalDocumentPropertiesWithError:()BRAdditions .cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_19ED3F000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] no bookmark data%@", v1, 0xCu);
}

- (void)br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:()BRAdditions .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_19ED3F000, a3, v5, "[DEBUG] Resolved by parent ID and name, but target is outside of iCloud Drive: %@%@", v6);
}

- (void)br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:()BRAdditions .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_19ED3F000, a3, v5, "[DEBUG] Resolved by fileID target is outside of iCloud Drive: %@%@", v6);
}

- (void)br_URLByResolvingExternalDocumentReferenceWithError:()BRAdditions .cold.1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_3_0(&dword_19ED3F000, a3, (uint64_t)a3, "[DEBUG] can't resolve bookmark data: %@%@", (uint8_t *)&v4);
}

- (void)br_URLByResolvingExternalDocumentReferenceWithError:()BRAdditions .cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: !((__bridge NSURL *)logicalURL).br_isInCloudDocsPrivateStorages%@", v2, v3, v4, v5, v6);
}

- (void)br_URLByResolvingExternalDocumentReferenceWithError:()BRAdditions .cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: !((__bridge NSURL *)physicalURL).br_isInCloudDocsPrivateStorages%@", v2, v3, v4, v5, v6);
}

- (void)br_URLByResolvingExternalDocumentReferenceWithError:()BRAdditions .cold.4(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3_0(&dword_19ED3F000, a4, a3, "[DEBUG] resolved through bookmark data string using bird to logical %@%@", (uint8_t *)a3);
}

@end