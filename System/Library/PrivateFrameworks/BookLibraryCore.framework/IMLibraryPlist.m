@interface IMLibraryPlist
+ (BOOL)isPDFFromPlistEntry:(id)a3;
+ (BOOL)isSupplementalContentFromPlistEntry:(id)a3;
+ (IMLibraryPlist)libraryPlistWithKind:(int64_t)a3;
+ (id)accessDateFromPlistEntry:(id)a3;
+ (id)albumFromPlistEntry:(id)a3;
+ (id)assetIDFromItunesMetadataEntry:(id)a3;
+ (id)assetIDFromPlistEntry:(id)a3;
+ (id)assetIDFromPlistEntry:(id)a3 forAssetAtPath:(id)a4;
+ (id)assetTypeFromPlistEntry:(id)a3;
+ (id)authorFromPlistEntry:(id)a3;
+ (id)backupFolderNameFromPlistEntry:(id)a3;
+ (id)bookEpubIdFromPlistEntry:(id)a3;
+ (id)booksArrayFromPlistEntry:(id)a3;
+ (id)booksRepositoryPath;
+ (id)collectionIdFromPlistEntry:(id)a3;
+ (id)coverHashFromItunesMetadataEntry:(id)a3;
+ (id)coverPathFromItunesMetadataEntry:(id)a3;
+ (id)coverPathFromPlistEntry:(id)a3;
+ (id)coverWritingModeFromPlistEntry:(id)a3;
+ (id)deletesArrayFromPlistEntry:(id)a3;
+ (id)endOfBookExperiencesFromItunesMetadataEntry:(id)a3;
+ (id)entryForAssetID:(id)a3 contents:(id)a4;
+ (id)entryForAssetURL:(id)a3 contents:(id)a4;
+ (id)experienceConfidenceFromExperienceParamEntry:(id)a3;
+ (id)experienceKindFromExperienceEntry:(id)a3;
+ (id)experienceLocationFromExperienceEntry:(id)a3;
+ (id)experienceLocationTypeFromExperienceEntry:(id)a3;
+ (id)experienceParamsFromExperienceEntry:(id)a3;
+ (id)experienceVersionFromExperienceEntry:(id)a3;
+ (id)extensionFromPlistEntry:(id)a3;
+ (id)feedURLFromPlistEntry:(id)a3;
+ (id)folderNameFromPlistEntry:(id)a3;
+ (id)genreFromPlistEntry:(id)a3;
+ (id)humanReadablePublicationVersionFromPlistEntry:(id)a3;
+ (id)importDateFromPlistEntry:(id)a3;
+ (id)isEphemeralFromPlistEntry:(id)a3;
+ (id)isExplicitContentFromPlistEntry:(id)a3;
+ (id)isItunesUFromPlistEntry:(id)a3;
+ (id)isManagedBookFromURL:(id)a3;
+ (id)isProofedAssetFromPlistEntry:(id)a3;
+ (id)isSampleFromPlistEntry:(id)a3;
+ (id)keyNameForAccessDate;
+ (id)keyNameForAssetType;
+ (id)keyNameForAuthor;
+ (id)keyNameForBackupPath;
+ (id)keyNameForBookDescription;
+ (id)keyNameForBooksArray;
+ (id)keyNameForCollectionId;
+ (id)keyNameForComments;
+ (id)keyNameForCoverWritingMode;
+ (id)keyNameForDeletesArray;
+ (id)keyNameForExplicitContent;
+ (id)keyNameForFirstOpened;
+ (id)keyNameForFlavor;
+ (id)keyNameForGeneration;
+ (id)keyNameForGenre;
+ (id)keyNameForHighWaterMark;
+ (id)keyNameForHumanReadablePublicationVersion;
+ (id)keyNameForImportDate;
+ (id)keyNameForIsEphemeral;
+ (id)keyNameForIsSupplementalContent;
+ (id)keyNameForLanguages;
+ (id)keyNameForLastOpened;
+ (id)keyNameForPageProgression;
+ (id)keyNameForPath;
+ (id)keyNameForPrimaryLanguage;
+ (id)keyNameForProofedAsset;
+ (id)keyNameForPublicationVersion;
+ (id)keyNameForPublisherUniqueID;
+ (id)keyNameForRating;
+ (id)keyNameForReadingLocation;
+ (id)keyNameForSampleAsset;
+ (id)keyNameForScrollDirection;
+ (id)keyNameForSortAuthor;
+ (id)keyNameForSortTitle;
+ (id)keyNameForStoreId;
+ (id)keyNameForStoreId2;
+ (id)keyNameForStorePlaylistId;
+ (id)keyNameForSubject;
+ (id)keyNameForTitle;
+ (id)keyNameForUniqueId;
+ (id)keyNameForYear;
+ (id)languageFromPlistEntry:(id)a3;
+ (id)languagesFromPlistEntry:(id)a3;
+ (id)lookupAssetURLStringFromAssetID:(id)a3 contents:(id)a4;
+ (id)lookupBackupFolderNameFromAssetID:(id)a3 contents:(id)a4;
+ (id)lookupCoverWritingModeFromAssetID:(id)a3 contents:(id)a4;
+ (id)lookupFolderNameFromAssetID:(id)a3 contents:(id)a4;
+ (id)lookupHumanReadablePublicationVersionFromAssetID:(id)a3 contents:(id)a4;
+ (id)lookupLanguageFromAssetID:(id)a3 contents:(id)a4;
+ (id)lookupPageProgressionFromAssetID:(id)a3 contents:(id)a4;
+ (id)lookupPublicationVersionFromAssetID:(id)a3 contents:(id)a4;
+ (id)lookupPublicationVersionNumberFromAssetID:(id)a3 contents:(id)a4;
+ (id)lookupScrollDirectionFromAssetID:(id)a3 contents:(id)a4;
+ (id)managedRepositoryPath;
+ (id)mimeTypeFromPlistEntry:(id)a3;
+ (id)packageFileHashFromItunesMetadataEntry:(id)a3;
+ (id)pageProgressionFromPlistEntry:(id)a3;
+ (id)permlinkFromPlistEntry:(id)a3;
+ (id)persistentIDFromPlistEntry:(id)a3;
+ (id)primaryLanguageFromPlistEntry:(id)a3;
+ (id)publicationVersionFromPlistEntry:(id)a3;
+ (id)publicationVersionNumberFromPlistEntry:(id)a3;
+ (id)publisherUniqueIDFromItunesMetadataEntry:(id)a3;
+ (id)purchasesRepositoryPath;
+ (id)sampleRepositoryPath;
+ (id)scrollDirectionFromPlistEntry:(id)a3;
+ (id)sharedContainerURL;
+ (id)sharedRepositoryPath;
+ (id)sortAuthorFromPlistEntry:(id)a3;
+ (id)sortTitleFromPlistEntry:(id)a3;
+ (id)stashedSampleRepositoryPath;
+ (id)storeIdFromPlistEntry:(id)a3;
+ (id)storePlaylistIdFromPlistEntry:(id)a3;
+ (id)temporaryItemIdentifierFromPlistEntry:(id)a3;
+ (id)titleFromItunesMetadataEntry:(id)a3;
+ (id)titleFromPlistEntry:(id)a3;
+ (id)uniqueIDFromItunesMetadataEntry:(id)a3;
+ (id)uniqueIdFromPlistEntry:(id)a3;
+ (void)setAccessDate:(id)a3 toPlistEntry:(id)a4;
+ (void)setBooksArray:(id)a3 toPlistEntry:(id)a4;
+ (void)setDeletesArray:(id)a3 toPlistEntry:(id)a4;
- (BOOL)bumpModificationDate;
- (BOOL)isPathInDirectory:(id)a3;
- (NSString)directory;
- (NSString)path;
- (NSString)sidecarPath;
- (id)_initWithDirectory:(id)a3 fileName:(id)a4;
- (id)calculateChecksum;
- (id)contents;
- (id)p_contents:(id)a3;
- (id)unfilteredContents;
- (id)unfilteredSidecarContents;
- (int64_t)kind;
- (void)addDeletedFiles:(id)a3;
- (void)p_rewriteSidecarWithDeletes:(id)a3;
- (void)removeDeletedPaths:(id)a3;
- (void)setDirectory:(id)a3;
- (void)setKind:(int64_t)a3;
- (void)setPath:(id)a3;
@end

@implementation IMLibraryPlist

- (id)_initWithDirectory:(id)a3 fileName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13 = objc_msgSend_init(self, v8, v9, v10);
  if (v13)
  {
    v14 = objc_msgSend_stringByAppendingPathComponent_(v6, v11, (uint64_t)v7, v12);
    objc_msgSend_setPath_(v13, v15, (uint64_t)v14, v16);

    objc_msgSend_setDirectory_(v13, v17, (uint64_t)v6, v18);
  }

  return v13;
}

+ (IMLibraryPlist)libraryPlistWithKind:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v5 = objc_msgSend_bu_booksRepositoryURL(NSURL, a2, a3, v3);
      uint64_t v9 = objc_msgSend_path(v5, v6, v7, v8);

      uint64_t v10 = @"Books.plist";
      uint64_t v14 = objc_msgSend_length(@"Books.plist", v11, v12, v13);
      break;
    case 1:
      uint64_t v15 = objc_msgSend_purchasesRepositoryPath(IMLibraryPlist, a2, a3, v3);
      goto LABEL_8;
    case 2:
      uint64_t v9 = objc_msgSend_managedRepositoryPath(IMLibraryPlist, a2, a3, v3);
      uint64_t v10 = @"Managed.plist";
      uint64_t v14 = objc_msgSend_length(@"Managed.plist", v19, v20, v21);
      break;
    case 3:
      if (!objc_msgSend__isMultiUser(BLLibraryUtility, a2, a3, v3)) {
        goto LABEL_13;
      }
      uint64_t v9 = objc_msgSend_sharedRepositoryPath(IMLibraryPlist, v22, v23, v24);
      uint64_t v10 = @"Shared.plist";
      uint64_t v14 = objc_msgSend_length(@"Shared.plist", v25, v26, v27);
      break;
    case 4:
      uint64_t v15 = objc_msgSend_sampleRepositoryPath(IMLibraryPlist, a2, a3, v3);
LABEL_8:
      uint64_t v9 = (void *)v15;
      uint64_t v10 = @"Purchases.plist";
      uint64_t v14 = objc_msgSend_length(@"Purchases.plist", v16, v17, v18);
      break;
    case 5:
      uint64_t v9 = objc_msgSend_stashedSampleRepositoryPath(IMLibraryPlist, a2, a3, v3);
      uint64_t v10 = @"Samples.plist";
      uint64_t v14 = objc_msgSend_length(@"Samples.plist", v28, v29, v30);
      break;
    default:
      v31 = BLDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl(&dword_21DFE3000, v31, OS_LOG_TYPE_ERROR, "Invalid plist.", v38, 2u);
      }

LABEL_13:
      uint64_t v10 = 0;
      uint64_t v9 = 0;
      uint64_t v14 = objc_msgSend_length(0, v22, v23, v24);
      break;
  }
  if (v14)
  {
    v32 = [IMLibraryPlist alloc];
    v34 = objc_msgSend__initWithDirectory_fileName_(v32, v33, (uint64_t)v9, (uint64_t)v10);
    objc_msgSend_setKind_(v34, v35, a3, v36);
  }
  else
  {
    v34 = 0;
  }

  return (IMLibraryPlist *)v34;
}

- (NSString)sidecarPath
{
  v4 = objc_msgSend_directory(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_stringByAppendingPathComponent_(v4, v5, @"Deletes.plist", v6);

  return (NSString *)v7;
}

- (void)p_rewriteSidecarWithDeletes:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_unfilteredSidecarContents(self, v5, v6, v7);
  v11 = v8;
  if (v8) {
    id v12 = (id)objc_msgSend_mutableCopyWithZone_(v8, v9, 0, v10);
  }
  else {
    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v19 = v12;

  objc_msgSend_setDeletesArray_toPlistEntry_(IMLibraryPlist, v13, (uint64_t)v4, (uint64_t)v19);
  uint64_t v17 = objc_msgSend_sidecarPath(self, v14, v15, v16);
  objc_msgSend_writeToFile_atomically_(v19, v18, (uint64_t)v17, 1);
}

- (id)p_contents:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_dictionaryWithContentsOfFile_(NSDictionary, v4, (uint64_t)v3, v5);
  if (!v6)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64_t v13 = objc_msgSend_initWithContentsOfFile_(v7, v8, (uint64_t)v3, v9);
    if (!v13
      || (objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x263F08AC0], v10, (uint64_t)v13, 0, 0, 0),
          (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v14 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v10, v11, v12);
      id v30 = 0;
      id v16 = (id)objc_msgSend_attributesOfItemAtPath_error_(v14, v15, (uint64_t)v3, (uint64_t)&v30);
      id v17 = v30;

      if (objc_msgSend_code(v17, v18, v19, v20) == 257
        && (objc_msgSend_domain(v17, v21, v22, v23),
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            v25 = (void *)*MEMORY[0x263F07F70],
            v24,
            v24 == v25))
      {
        objc_msgSend_raise_format_(MEMORY[0x263EFF940], v21, @"NSFileReadNoPermissionError", @"Permission denied: %@", v3);
      }
      else if (objc_msgSend_code(v17, v21, v22, v23) == 260)
      {
        objc_msgSend_domain(v17, v26, v27, v28);
      }
      uint64_t v6 = 0;
    }
  }

  return v6;
}

- (id)unfilteredContents
{
  uint64_t v5 = objc_msgSend_path(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_p_contents_(self, v6, (uint64_t)v5, v7);

  return v8;
}

- (id)unfilteredSidecarContents
{
  uint64_t v5 = objc_msgSend_sidecarPath(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_p_contents_(self, v6, (uint64_t)v5, v7);

  return v8;
}

- (id)contents
{
  id v4 = self;
  uint64_t v127 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_unfilteredContents(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_unfilteredSidecarContents(v4, v6, v7, v8);
  uint64_t v12 = objc_msgSend_deletesArrayFromPlistEntry_(IMLibraryPlist, v10, (uint64_t)v9, v11);
  uint64_t v15 = objc_msgSend_booksArrayFromPlistEntry_(IMLibraryPlist, v13, (uint64_t)v5, v14);
  if (objc_msgSend_count(v12, v16, v17, v18) && objc_msgSend_count(v15, v19, v20, v21))
  {
    v106 = v4;
    v107 = v15;
    v109 = v9;
    uint64_t v22 = objc_msgSend_sortedArrayUsingFunction_context_(v15, v19, (uint64_t)sub_21DFF59D4, 0);
    v108 = v12;
    v25 = objc_msgSend_sortedArrayUsingSelector_(v12, v23, (uint64_t)sel_compare_, v24);
    unint64_t v29 = objc_msgSend_count(v25, v26, v27, v28);
    v32 = objc_msgSend_objectAtIndex_(v25, v30, 0, v31);
    v112 = objc_msgSend_array(MEMORY[0x263EFF980], v33, v34, v35);
    v115 = objc_msgSend_array(MEMORY[0x263EFF980], v36, v37, v38);
    v110 = v5;
    id v111 = (id)objc_msgSend_mutableCopyWithZone_(v5, v39, 0, v40);
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    id obj = v22;
    uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v116, (uint64_t)v126, 16);
    if (v42)
    {
      uint64_t v45 = v42;
      unint64_t v46 = 0;
      unint64_t v113 = 0;
      uint64_t v47 = *(void *)v117;
      do
      {
        uint64_t v48 = 0;
        do
        {
          if (*(void *)v117 != v47) {
            objc_enumerationMutation(obj);
          }
          uint64_t v49 = *(void *)(*((void *)&v116 + 1) + 8 * v48);
          v50 = objc_msgSend_folderNameFromPlistEntry_(IMLibraryPlist, v43, v49, v44);
          if (objc_msgSend_length(v50, v51, v52, v53)) {
            BOOL v56 = v32 == 0;
          }
          else {
            BOOL v56 = 1;
          }
          if (v56)
          {
LABEL_21:
            objc_msgSend_addObject_(v115, v54, v49, v55);
          }
          else
          {
            for (uint64_t i = objc_msgSend_compare_(v32, v54, (uint64_t)v50, v55);
                  i == -1;
                  uint64_t i = objc_msgSend_compare_(v58, v59, (uint64_t)v50, v60))
            {
              if (++v46 >= v29)
              {

                v32 = 0;
                goto LABEL_21;
              }
              v58 = objc_msgSend_objectAtIndex_(v25, v54, v46, v55);

              v32 = v58;
            }
            if (i == 1) {
              goto LABEL_21;
            }
            if (!i)
            {
              objc_msgSend_addObject_(v112, v54, (uint64_t)v50, v55);
              ++v113;
              if (v46 >= v29)
              {

                v32 = 0;
              }
              else
              {
                uint64_t v63 = objc_msgSend_objectAtIndex_(v25, v61, v46, v62);

                v32 = (void *)v63;
              }
            }
          }

          ++v48;
        }
        while (v48 != v45);
        uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v116, (uint64_t)v126, 16);
        uint64_t v45 = v64;
      }
      while (v64);
    }
    else
    {
      unint64_t v113 = 0;
    }
    v73 = obj;

    v74 = BLDefaultLog();
    uint64_t v15 = v107;
    uint64_t v12 = v108;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      int v78 = objc_msgSend_count(v107, v75, v76, v77);
      int v82 = objc_msgSend_count(v108, v79, v80, v81);
      int v86 = objc_msgSend_count(v115, v83, v84, v85);
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v121 = v78;
      *(_WORD *)&v121[4] = 1024;
      *(_DWORD *)&v121[6] = v82;
      __int16 v122 = 1024;
      int v123 = v86;
      __int16 v124 = 1024;
      v73 = obj;
      int v125 = v113;
      _os_log_impl(&dword_21DFE3000, v74, OS_LOG_TYPE_DEBUG, "IMLibraryPlist: Unfiltered: %d; Filter: %d; Filtered: %d; Filter Hit: %d",
        buf,
        0x1Au);
    }

    uint64_t v5 = v110;
    if (v113)
    {
      if (objc_msgSend_count(v25, v87, v88, v89) > v113) {
        objc_msgSend_p_rewriteSidecarWithDeletes_(v106, v90, (uint64_t)v112, v91);
      }
      objc_msgSend_setBooksArray_toPlistEntry_(IMLibraryPlist, v90, (uint64_t)v115, (uint64_t)v111);

      uint64_t v9 = v109;
LABEL_45:

      goto LABEL_46;
    }
    objc_msgSend_setBooksArray_toPlistEntry_(IMLibraryPlist, v87, (uint64_t)v115, (uint64_t)v111);

    uint64_t v9 = v109;
    id v4 = v106;
LABEL_42:
    v92 = BLDefaultLog();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
    {
      v96 = objc_msgSend_sidecarPath(v4, v93, v94, v95);
      *(_DWORD *)buf = 138412290;
      *(void *)v121 = v96;
      _os_log_impl(&dword_21DFE3000, v92, OS_LOG_TYPE_DEBUG, "IMLibraryPlist: Removing sidecar; %@", buf, 0xCu);
    }
    v73 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v97, v98, v99);
    v25 = objc_msgSend_sidecarPath(v4, v100, v101, v102);
    objc_msgSend_removeItemAtPath_error_(v73, v103, (uint64_t)v25, 0);
    goto LABEL_45;
  }
  if (objc_msgSend_count(v12, v19, v20, v21)) {
    BOOL v68 = objc_msgSend_count(v15, v65, v66, v67) == 0;
  }
  else {
    BOOL v68 = 0;
  }
  id v111 = v5;
  v69 = BLDefaultLog();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v121 = objc_msgSend_count(v15, v70, v71, v72);
    _os_log_impl(&dword_21DFE3000, v69, OS_LOG_TYPE_DEBUG, "IMLibraryPlist: Nothing to filter; Book Count: %d", buf, 8u);
  }

  if (v68) {
    goto LABEL_42;
  }
LABEL_46:
  id v104 = v111;

  return v104;
}

- (id)calculateChecksum
{
  if (qword_26AB3FF50 != -1) {
    dispatch_once(&qword_26AB3FF50, &unk_26CED3C90);
  }
  uint64_t v5 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, v2, v3);
  uint64_t v9 = objc_msgSend_path(self, v6, v7, v8);
  uint64_t v11 = objc_msgSend_attributesOfItemAtPath_error_(v5, v10, (uint64_t)v9, 0);

  id v16 = objc_msgSend_objectForKey_(v11, v12, *MEMORY[0x263F08048], v13);
  if (v16)
  {
    uint64_t v17 = objc_msgSend_stringFromDate_((void *)qword_26AB3FF48, v14, (uint64_t)v16, v15);
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (BOOL)isPathInDirectory:(id)a3
{
  uint64_t v5 = objc_msgSend_stringByDeletingLastPathComponent(a3, a2, (uint64_t)a3, v3);
  uint64_t v9 = objc_msgSend_directory(self, v6, v7, v8);
  char isEqualToString = objc_msgSend_isEqualToString_(v5, v10, (uint64_t)v9, v11);

  return isEqualToString;
}

- (void)addDeletedFiles:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_unfilteredSidecarContents(self, v8, v9, v10);
    uint64_t v14 = v11;
    if (v11) {
      id v15 = (id)objc_msgSend_mutableCopyWithZone_(v11, v12, 0, v13);
    }
    else {
      id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    id v16 = v15;

    uint64_t v19 = objc_msgSend_deletesArrayFromPlistEntry_(IMLibraryPlist, v17, (uint64_t)v16, v18);
    uint64_t v22 = v19;
    if (v19) {
      id v23 = (id)objc_msgSend_mutableCopyWithZone_(v19, v20, 0, v21);
    }
    else {
      id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    uint64_t v24 = v23;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v25 = v4;
    uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v55, (uint64_t)v61, 16);
    if (v27)
    {
      uint64_t v30 = v27;
      uint64_t v31 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v56 != v31) {
            objc_enumerationMutation(v25);
          }
          objc_msgSend_addObject_(v24, v28, *(void *)(*((void *)&v55 + 1) + 8 * i), v29, (void)v55);
        }
        uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v55, (uint64_t)v61, 16);
      }
      while (v30);
    }

    id v33 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v36 = objc_msgSend_initWithArray_(v33, v34, (uint64_t)v24, v35);
    uint64_t v40 = objc_msgSend_allObjects(v36, v37, v38, v39);
    objc_msgSend_setDeletesArray_toPlistEntry_(IMLibraryPlist, v41, (uint64_t)v40, (uint64_t)v16);

    uint64_t v42 = BLDefaultLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      int v46 = objc_msgSend_count(v24, v43, v44, v45);
      *(_DWORD *)buf = 67109120;
      int v60 = v46;
      _os_log_impl(&dword_21DFE3000, v42, OS_LOG_TYPE_DEBUG, "addDeletedPaths -- rewritePlist %d entries", buf, 8u);
    }

    v50 = objc_msgSend_sidecarPath(self, v47, v48, v49);
    objc_msgSend_writeToFile_atomically_(v16, v51, (uint64_t)v50, 1);

    objc_msgSend_bumpModificationDate(self, v52, v53, v54);
  }
}

- (void)removeDeletedPaths:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_unfilteredSidecarContents(self, v8, v9, v10);
    id v15 = v11;
    if (v11)
    {
      id v16 = objc_msgSend_mutableCopy(v11, v12, v13, v14);
      uint64_t v19 = objc_msgSend_deletesArrayFromPlistEntry_(IMLibraryPlist, v17, (uint64_t)v16, v18);
      uint64_t v22 = v19;
      if (v19)
      {
        id v23 = objc_msgSend_mutableCopyWithZone_(v19, v20, 0, v21);
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v24 = v4;
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v58, (uint64_t)v64, 16);
        if (v26)
        {
          uint64_t v29 = v26;
          long long v55 = v16;
          uint64_t v54 = self;
          id v56 = v4;
          char v30 = 0;
          uint64_t v31 = *(void *)v59;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v59 != v31) {
                objc_enumerationMutation(v24);
              }
              uint64_t v33 = *(void *)(*((void *)&v58 + 1) + 8 * i);
              v57[0] = MEMORY[0x263EF8330];
              v57[1] = 3221225472;
              v57[2] = sub_21DFF6118;
              v57[3] = &unk_26448B8A8;
              v57[4] = v33;
              uint64_t v34 = objc_msgSend_indexesOfObjectsPassingTest_(v23, v27, (uint64_t)v57, v28, v54);
              if (objc_msgSend_count(v34, v35, v36, v37))
              {
                objc_msgSend_removeObjectsAtIndexes_(v23, v38, (uint64_t)v34, v39);
                char v30 = 1;
              }
            }
            uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v58, (uint64_t)v64, 16);
          }
          while (v29);

          id v4 = v56;
          id v16 = v55;
          if (v30)
          {
            uint64_t v40 = BLDefaultLog();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              int v44 = objc_msgSend_count(v23, v41, v42, v43);
              *(_DWORD *)buf = 67109120;
              int v63 = v44;
              _os_log_impl(&dword_21DFE3000, v40, OS_LOG_TYPE_DEBUG, "removeDeletedPaths -- rewritePlist %d entries", buf, 8u);
            }

            objc_msgSend_setDeletesArray_toPlistEntry_(IMLibraryPlist, v45, (uint64_t)v23, (uint64_t)v55);
            uint64_t v49 = objc_msgSend_sidecarPath(v54, v46, v47, v48);
            objc_msgSend_writeToFile_atomically_(v55, v50, (uint64_t)v49, 1);

            objc_msgSend_bumpModificationDate(v54, v51, v52, v53);
          }
        }
        else
        {
        }
      }
    }
  }
}

+ (id)entryForAssetID:(id)a3 contents:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_msgSend_booksArrayFromPlistEntry_(IMLibraryPlist, v6, (uint64_t)a4, v7);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v8);
        }
        objc_opt_class();
        uint64_t v14 = BUDynamicCast();
        uint64_t v17 = objc_msgSend_storeIdFromPlistEntry_(IMLibraryPlist, v15, (uint64_t)v14, v16, v29);
        uint64_t v20 = v17;
        if (v17 && (objc_msgSend_isEqualToString_(v17, v18, (uint64_t)v5, v19) & 1) != 0) {
          goto LABEL_17;
        }
        uint64_t v21 = objc_msgSend_bookEpubIdFromPlistEntry_(IMLibraryPlist, v18, (uint64_t)v14, v19);

        if (v21 && (objc_msgSend_isEqualToString_(v21, v22, (uint64_t)v5, v23) & 1) != 0)
        {
          uint64_t v20 = v21;
LABEL_17:
          id v27 = v14;

          goto LABEL_18;
        }
        uint64_t v20 = objc_msgSend_uniqueIdFromPlistEntry_(IMLibraryPlist, v22, (uint64_t)v14, v23);

        if (v20 && objc_msgSend_isEqualToString_(v20, v24, (uint64_t)v5, v25)) {
          goto LABEL_17;
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v26, (uint64_t)&v29, (uint64_t)v33, 16);
      id v27 = 0;
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v27 = 0;
  }
LABEL_18:

  return v27;
}

+ (id)entryForAssetURL:(id)a3 contents:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_msgSend_booksArrayFromPlistEntry_(IMLibraryPlist, v6, (uint64_t)a4, v7);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v8);
        }
        objc_opt_class();
        uint64_t v14 = BUDynamicCast();
        uint64_t v20 = objc_msgSend_folderNameFromPlistEntry_(IMLibraryPlist, v15, (uint64_t)v14, v16, v27);
        if (v20)
        {
          uint64_t v21 = objc_msgSend_lastPathComponent(v5, v17, v18, v19);
          int isEqualToString = objc_msgSend_isEqualToString_(v20, v22, (uint64_t)v21, v23);

          if (isEqualToString)
          {

            goto LABEL_12;
          }
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v25, (uint64_t)&v27, (uint64_t)v31, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
LABEL_12:

  return v14;
}

+ (id)isManagedBookFromURL:(id)a3
{
  id v8 = objc_msgSend_path(a3, a2, (uint64_t)a3, v3);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_managedRepositoryPath(a1, v5, v6, v7);
    uint64_t hasPrefix = objc_msgSend_hasPrefix_(v8, v10, (uint64_t)v9, v11);
  }
  else
  {
    uint64_t hasPrefix = 0;
  }
  uint64_t v13 = objc_msgSend_numberWithBool_(NSNumber, v5, hasPrefix, v7);

  return v13;
}

- (BOOL)bumpModificationDate
{
  v31[1] = *MEMORY[0x263EF8340];
  uint64_t v30 = *MEMORY[0x263F08048];
  id v5 = objc_msgSend_date(MEMORY[0x263EFF910], a2, v2, v3);
  v31[0] = v5;
  uint64_t v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v6, (uint64_t)v31, (uint64_t)&v30, 1);

  uint64_t v11 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v8, v9, v10);
  id v15 = objc_msgSend_path(self, v12, v13, v14);
  id v25 = 0;
  char v17 = objc_msgSend_setAttributes_ofItemAtPath_error_(v11, v16, (uint64_t)v7, (uint64_t)v15, &v25);
  id v18 = v25;

  if ((v17 & 1) == 0)
  {
    uint64_t v19 = BLDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_msgSend_path(self, v20, v21, v22);
      *(_DWORD *)buf = 138412546;
      long long v27 = v23;
      __int16 v28 = 2112;
      id v29 = v18;
      _os_log_impl(&dword_21DFE3000, v19, OS_LOG_TYPE_ERROR, "Error changing modification date of %@ --  %@", buf, 0x16u);
    }
  }

  return v17;
}

+ (id)lookupAssetURLStringFromAssetID:(id)a3 contents:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](a1, sel_lookupFolderNameFromAssetID_contents_, a3, a4);
}

+ (id)lookupPublicationVersionFromAssetID:(id)a3 contents:(id)a4
{
  uint64_t v6 = objc_msgSend_entryForAssetID_contents_(a1, a2, (uint64_t)a3, (uint64_t)a4);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_publicationVersionFromPlistEntry_(IMLibraryPlist, v4, (uint64_t)v6, v5);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)lookupPublicationVersionNumberFromAssetID:(id)a3 contents:(id)a4
{
  uint64_t v6 = objc_msgSend_entryForAssetID_contents_(a1, a2, (uint64_t)a3, (uint64_t)a4);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_publicationVersionNumberFromPlistEntry_(IMLibraryPlist, v4, (uint64_t)v6, v5);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)lookupHumanReadablePublicationVersionFromAssetID:(id)a3 contents:(id)a4
{
  uint64_t v6 = objc_msgSend_entryForAssetID_contents_(a1, a2, (uint64_t)a3, (uint64_t)a4);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_humanReadablePublicationVersionFromPlistEntry_(IMLibraryPlist, v4, (uint64_t)v6, v5);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)lookupPageProgressionFromAssetID:(id)a3 contents:(id)a4
{
  uint64_t v6 = objc_msgSend_entryForAssetID_contents_(a1, a2, (uint64_t)a3, (uint64_t)a4);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_pageProgressionFromPlistEntry_(IMLibraryPlist, v4, (uint64_t)v6, v5);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)lookupLanguageFromAssetID:(id)a3 contents:(id)a4
{
  uint64_t v6 = objc_msgSend_entryForAssetID_contents_(a1, a2, (uint64_t)a3, (uint64_t)a4);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_languageFromPlistEntry_(IMLibraryPlist, v4, (uint64_t)v6, v5);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)lookupCoverWritingModeFromAssetID:(id)a3 contents:(id)a4
{
  uint64_t v6 = objc_msgSend_entryForAssetID_contents_(a1, a2, (uint64_t)a3, (uint64_t)a4);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_coverWritingModeFromPlistEntry_(IMLibraryPlist, v4, (uint64_t)v6, v5);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)lookupScrollDirectionFromAssetID:(id)a3 contents:(id)a4
{
  uint64_t v6 = objc_msgSend_entryForAssetID_contents_(a1, a2, (uint64_t)a3, (uint64_t)a4);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_scrollDirectionFromPlistEntry_(IMLibraryPlist, v4, (uint64_t)v6, v5);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)lookupFolderNameFromAssetID:(id)a3 contents:(id)a4
{
  uint64_t v6 = objc_msgSend_entryForAssetID_contents_(a1, a2, (uint64_t)a3, (uint64_t)a4);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_folderNameFromPlistEntry_(IMLibraryPlist, v4, (uint64_t)v6, v5);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)lookupBackupFolderNameFromAssetID:(id)a3 contents:(id)a4
{
  uint64_t v6 = objc_msgSend_entryForAssetID_contents_(a1, a2, (uint64_t)a3, (uint64_t)a4);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_backupFolderNameFromPlistEntry_(IMLibraryPlist, v4, (uint64_t)v6, v5);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)authorFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForAuthor(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  uint64_t v11 = BUDynamicCast();

  return v11;
}

+ (id)sortAuthorFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForSortAuthor(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  uint64_t v11 = BUDynamicCast();

  return v11;
}

+ (id)titleFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForTitle(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  uint64_t v11 = BUDynamicCast();

  return v11;
}

+ (id)sortTitleFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForSortTitle(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  uint64_t v11 = BUDynamicCast();

  return v11;
}

+ (id)genreFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForGenre(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  uint64_t v11 = BUDynamicCast();

  return v11;
}

+ (id)isExplicitContentFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForExplicitContent(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  uint64_t v11 = BUDynamicCast();

  return v11;
}

+ (id)isProofedAssetFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForProofedAsset(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  uint64_t v11 = BUDynamicCast();

  return v11;
}

+ (id)isEphemeralFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForIsEphemeral(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  uint64_t v11 = BUDynamicCast();

  return v11;
}

+ (id)deletesArrayFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForDeletesArray(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  uint64_t v11 = BUDynamicCast();

  return v11;
}

+ (void)setDeletesArray:(id)a3 toPlistEntry:(id)a4
{
  id v5 = a4;
  id v14 = (id)objc_msgSend_copy(a3, v6, v7, v8);
  uint64_t v12 = objc_msgSend_keyNameForDeletesArray(IMLibraryPlist, v9, v10, v11);
  objc_msgSend_setObject_forKey_(v5, v13, (uint64_t)v14, (uint64_t)v12);
}

+ (id)booksArrayFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForBooksArray(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  uint64_t v11 = BUDynamicCast();

  return v11;
}

+ (void)setBooksArray:(id)a3 toPlistEntry:(id)a4
{
  id v5 = a4;
  id v14 = (id)objc_msgSend_copy(a3, v6, v7, v8);
  uint64_t v12 = objc_msgSend_keyNameForBooksArray(IMLibraryPlist, v9, v10, v11);
  objc_msgSend_setObject_forKey_(v5, v13, (uint64_t)v14, (uint64_t)v12);
}

+ (BOOL)isPDFFromPlistEntry:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_folderNameFromPlistEntry_(IMLibraryPlist, v4, (uint64_t)v3, v5);
  uint64_t v9 = v6;
  if (v6)
  {
    id v10 = v6;
  }
  else
  {
    objc_msgSend_backupFolderNameFromPlistEntry_(IMLibraryPlist, v7, (uint64_t)v3, v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v11 = v10;

  BOOL v25 = 0;
  if (objc_msgSend_length(v11, v12, v13, v14))
  {
    uint64_t v18 = objc_msgSend_pathExtension(v11, v15, v16, v17);
    uint64_t v22 = objc_msgSend_lowercaseString((void *)v18, v19, v20, v21);

    LOBYTE(v18) = objc_msgSend_isEqualToString_(v22, v23, @"pdf", v24);
    if (v18) {
      BOOL v25 = 1;
    }
  }

  return v25;
}

+ (id)temporaryItemIdentifierFromPlistEntry:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_permlinkFromPlistEntry_(IMLibraryPlist, v4, (uint64_t)v3, v5);
  uint64_t v12 = objc_msgSend_identifierFromPermlink(v6, v7, v8, v9);
  if (!v12)
  {
    int isSupplementalContentFromPlistEntry = objc_msgSend_isSupplementalContentFromPlistEntry_(IMLibraryPlist, v10, (uint64_t)v3, v11);
    int isPDFFromPlistEntry = objc_msgSend_isPDFFromPlistEntry_(IMLibraryPlist, v14, (uint64_t)v3, v15);
    if (isSupplementalContentFromPlistEntry) {
      BOOL v19 = isPDFFromPlistEntry == 0;
    }
    else {
      BOOL v19 = 1;
    }
    if (!v19)
    {
      uint64_t v12 = objc_msgSend_storeIdFromPlistEntry_(IMLibraryPlist, v17, (uint64_t)v3, v18);
      if (objc_msgSend_length(v12, v20, v21, v22))
      {
        if (v12) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
    objc_opt_class();
    BOOL v25 = objc_msgSend_objectForKey_(v3, v23, @"Persistent ID", v24);
    uint64_t v12 = BUDynamicCast();
  }
LABEL_11:

  return v12;
}

+ (id)persistentIDFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"Persistent ID", v5);

  uint64_t v7 = BUDynamicCast();

  return v7;
}

+ (id)bookEpubIdFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForPublisherUniqueID(IMLibraryPlist, v4, v5, v6);
  id v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  uint64_t v11 = BUDynamicCast();

  return v11;
}

+ (id)albumFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"Album", v5);

  uint64_t v7 = BUDynamicCast();

  return v7;
}

+ (id)isItunesUFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"Is iTunes U", v5);

  uint64_t v7 = BUDynamicCast();

  return v7;
}

+ (id)feedURLFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"Feed URL", v5);

  uint64_t v7 = BUDynamicCast();

  return v7;
}

+ (id)mimeTypeFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"MIME Type", v5);

  uint64_t v7 = BUDynamicCast();

  return v7;
}

+ (id)extensionFromPlistEntry:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_objectForKey_(v4, v5, @"Extension", v6);
  uint64_t v8 = BUDynamicCast();

  if (!v8)
  {
    uint64_t v8 = objc_msgSend_folderNameFromPlistEntry_(a1, v9, (uint64_t)v4, v10);
    if (objc_msgSend_length(v8, v11, v12, v13))
    {
      uint64_t v17 = objc_msgSend_pathExtension(v8, v14, v15, v16);

      uint64_t v8 = (void *)v17;
    }
    if (!objc_msgSend_length(v8, v14, v15, v16))
    {

      uint64_t v8 = 0;
    }
  }

  return v8;
}

+ (id)publicationVersionFromPlistEntry:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_keyNameForPublicationVersion(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
LABEL_5:
    uint64_t v15 = v11;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_stringValue(v10, v12, v13, v14);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  uint64_t v15 = 0;
LABEL_7:

  return v15;
}

+ (id)publicationVersionNumberFromPlistEntry:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_keyNameForPublicationVersion(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
LABEL_5:
    BOOL v19 = v11;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = NSNumber;
    objc_msgSend_doubleValue(v10, v12, v13, v14);
    objc_msgSend_numberWithDouble_(v15, v16, v17, v18);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  BOOL v19 = 0;
LABEL_7:

  return v19;
}

+ (id)humanReadablePublicationVersionFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForHumanReadablePublicationVersion(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  id v11 = BUDynamicCast();

  return v11;
}

+ (id)pageProgressionFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForPageProgression(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  id v11 = BUDynamicCast();

  return v11;
}

+ (id)assetTypeFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForAssetType(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  id v11 = BUDynamicCast();

  return v11;
}

+ (id)languageFromPlistEntry:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_languagesFromPlistEntry_(a1, v5, (uint64_t)v4, v6);
  if (objc_msgSend_count(v7, v8, v9, v10))
  {
    objc_opt_class();
    uint64_t v15 = objc_msgSend_objectAtIndex_(v7, v13, 0, v14);
    uint64_t v16 = BUDynamicCast();

    if (objc_msgSend_length(v16, v17, v18, v19))
    {
      if (v16) {
        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  uint64_t v20 = objc_msgSend_primaryLanguageFromPlistEntry_(a1, v11, (uint64_t)v4, v12);
  uint64_t v24 = objc_msgSend_lowercaseString(v20, v21, v22, v23);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (qword_267D253A8 != -1) {
      dispatch_once(&qword_267D253A8, &unk_26CED3CB0);
    }
    uint64_t v16 = objc_msgSend_objectForKey_((void *)qword_267D253B0, v25, (uint64_t)v24, v26);
  }
  else
  {
    uint64_t v16 = 0;
  }

LABEL_12:

  return v16;
}

+ (id)assetIDFromPlistEntry:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_folderNameFromPlistEntry_(IMLibraryPlist, v5, (uint64_t)v4, v6);
  uint64_t v9 = objc_msgSend_assetIDFromPlistEntry_forAssetAtPath_(a1, v8, (uint64_t)v4, (uint64_t)v7);

  return v9;
}

+ (id)assetIDFromPlistEntry:(id)a3 forAssetAtPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int isSupplementalContentFromPlistEntry = objc_msgSend_isSupplementalContentFromPlistEntry_(IMLibraryPlist, v7, (uint64_t)v5, v8);
  char isPDFFromPlistEntry = objc_msgSend_isPDFFromPlistEntry_(IMLibraryPlist, v10, (uint64_t)v5, v11);
  if (isSupplementalContentFromPlistEntry && (isPDFFromPlistEntry & 1) != 0)
  {
    uint64_t v16 = 0;
    uint64_t v17 = objc_msgSend_length(0, v13, v14, v15);
  }
  else
  {
    uint64_t v16 = objc_msgSend_storeIdFromPlistEntry_(IMLibraryPlist, v13, (uint64_t)v5, v15);
    uint64_t v17 = objc_msgSend_length(v16, v20, v21, v22);
  }
  if (!v17)
  {
    uint64_t v23 = objc_msgSend_dcIdentifierFromBookPath_(BLLibraryUtility, v18, (uint64_t)v6, v19);
    uint64_t v26 = v23;
    if (v23)
    {
      id v27 = v23;
    }
    else
    {
      objc_msgSend_uniqueIdFromPlistEntry_(IMLibraryPlist, v24, (uint64_t)v5, v25);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    __int16 v28 = v27;

    if (!objc_msgSend_length(v28, v29, v30, v31))
    {
      uint64_t v34 = objc_msgSend_generateFileUniqueIdFromPath_(BLLibraryUtility, v32, (uint64_t)v6, v33);

      __int16 v28 = (void *)v34;
    }

    uint64_t v16 = v28;
  }

  return v16;
}

+ (id)coverWritingModeFromPlistEntry:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v8 = objc_msgSend_keyNameForCoverWritingMode(a1, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v4, v9, (uint64_t)v8, v10);

  uint64_t v12 = BUDynamicCast();

  return v12;
}

+ (id)scrollDirectionFromPlistEntry:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v8 = objc_msgSend_keyNameForScrollDirection(a1, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v4, v9, (uint64_t)v8, v10);

  uint64_t v12 = BUDynamicCast();

  return v12;
}

+ (id)languagesFromPlistEntry:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v8 = objc_msgSend_keyNameForLanguages(a1, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v4, v9, (uint64_t)v8, v10);

  uint64_t v12 = BUDynamicCast();

  return v12;
}

+ (id)primaryLanguageFromPlistEntry:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v8 = objc_msgSend_keyNameForPrimaryLanguage(a1, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v4, v9, (uint64_t)v8, v10);

  uint64_t v12 = BUDynamicCast();

  return v12;
}

+ (id)uniqueIdFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForUniqueId(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);
  uint64_t v11 = BUDynamicCast();

  if (!v11)
  {
    objc_opt_class();
    uint64_t v17 = objc_msgSend_objectForKey_(v3, v15, @"iBooks-UniqueId", v16);
    uint64_t v11 = BUDynamicCast();

    if (!v11)
    {
      objc_opt_class();
      uint64_t v20 = objc_msgSend_objectForKey_(v3, v18, @"PersistentID", v19);
      uint64_t v11 = BUDynamicCast();
    }
  }
  if ((unint64_t)objc_msgSend_length(v11, v12, v13, v14) <= 1)
  {

    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)accessDateFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForAccessDate(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  uint64_t v11 = BUDynamicCast();

  return v11;
}

+ (void)setAccessDate:(id)a3 toPlistEntry:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend_keyNameForAccessDate(IMLibraryPlist, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v10, (uint64_t)v6, (uint64_t)v11);
}

+ (id)folderNameFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForPath(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  id v11 = BUDynamicCast();

  return v11;
}

+ (id)backupFolderNameFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForBackupPath(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  id v11 = BUDynamicCast();

  return v11;
}

+ (id)isSampleFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForSampleAsset(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  id v11 = BUDynamicCast();

  return v11;
}

+ (id)coverPathFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"Cover Path", v5);
  uint64_t v7 = BUDynamicCast();

  if (!v7)
  {
    objc_opt_class();
    uint64_t v10 = objc_msgSend_valueForKeyPath_(v3, v8, @"book-info.cover-image-path", v9);
    uint64_t v7 = BUDynamicCast();
  }

  return v7;
}

+ (id)collectionIdFromPlistEntry:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_keyNameForCollectionId(IMLibraryPlist, v4, v5, v6);
  objc_opt_class();
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v3, v8, (uint64_t)v7, v9);

  id v11 = BUDynamicCast();

  if (v11)
  {
    uint64_t v26 = 0;
    uint64_t v14 = objc_msgSend_scannerWithString_(MEMORY[0x263F08B08], v12, (uint64_t)v11, v13);
    int v17 = objc_msgSend_scanHexLongLong_(v14, v15, (uint64_t)&v26, v16);

    if (v17)
    {
      uint64_t v20 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v18, v26, v19);
      uint64_t v24 = objc_msgSend_stringValue(v20, v21, v22, v23);
    }
    else
    {
      uint64_t v20 = BLDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        __int16 v28 = v7;
        __int16 v29 = 2112;
        uint64_t v30 = v11;
        _os_log_impl(&dword_21DFE3000, v20, OS_LOG_TYPE_ERROR, "Failed to convert key '%{public}@' hex->decimal: [%@]", buf, 0x16u);
      }
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

+ (id)storePlaylistIdFromPlistEntry:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_keyNameForStorePlaylistId(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v3, v8, (uint64_t)v7, v9);

  if (!v10)
  {
    objc_msgSend_collectionIdFromPlistEntry_(IMLibraryPlist, v11, (uint64_t)v3, v12);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_stringValue(v10, v13, v14, v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
    int v17 = v16;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v10;
    goto LABEL_7;
  }
  int v17 = 0;
LABEL_8:

  return v17;
}

+ (BOOL)isSupplementalContentFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForIsSupplementalContent(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v3, v8, (uint64_t)v7, v9);
  id v11 = BUDynamicCast();

  if (v11)
  {
    char isPDFFromPlistEntry = objc_msgSend_BOOLValue(v11, v12, v13, v14);
  }
  else
  {
    id v16 = objc_msgSend_collectionIdFromPlistEntry_(IMLibraryPlist, v12, (uint64_t)v3, v14);
    char isPDFFromPlistEntry = objc_msgSend_isPDFFromPlistEntry_(IMLibraryPlist, v17, (uint64_t)v3, v18);
    if (!objc_msgSend_length(v16, v19, v20, v21)) {
      char isPDFFromPlistEntry = 0;
    }
  }
  return isPDFFromPlistEntry;
}

+ (id)storeIdFromPlistEntry:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForStoreId2(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);
  id v11 = BUDynamicCast();

  if (v11)
  {
    uint64_t v41 = 0;
    uint64_t v15 = objc_msgSend_scannerWithString_(MEMORY[0x263F08B08], v12, (uint64_t)v11, v14);
    int v18 = objc_msgSend_scanHexLongLong_(v15, v16, (uint64_t)&v41, v17);

    if (v18)
    {
      uint64_t v21 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v19, v41, v20);
      uint64_t v25 = objc_msgSend_stringValue(v21, v22, v23, v24);
    }
    else
    {
      uint64_t v21 = BLDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = v11;
        _os_log_impl(&dword_21DFE3000, v21, OS_LOG_TYPE_ERROR, "Failed to hex->decimal: [%@]", buf, 0xCu);
      }
      uint64_t v25 = 0;
    }

    goto LABEL_15;
  }
  uint64_t v26 = objc_msgSend_keyNameForStoreId(IMLibraryPlist, v12, v13, v14);
  id v11 = objc_msgSend_objectForKey_(v3, v27, (uint64_t)v26, v28);

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend_stringValue(v11, v32, v33, v34);
      id v35 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
      uint64_t v25 = v35;
      unint64_t v39 = objc_msgSend_length(v35, v36, v37, v38);
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v35 = v11;
      id v11 = v35;
      goto LABEL_13;
    }
  }
  uint64_t v25 = 0;
LABEL_15:
  unint64_t v39 = objc_msgSend_length(v25, v29, v30, v31);
LABEL_16:
  if (v39 <= 1)
  {

    uint64_t v25 = 0;
  }

  return v25;
}

+ (id)permlinkFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"iTunesU Permlink", v5);

  uint64_t v7 = BUDynamicCast();

  if (objc_msgSend_length(v7, v8, v9, v10))
  {
    uint64_t v13 = objc_msgSend_URLWithString_(NSURL, v11, (uint64_t)v7, v12);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)importDateFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_keyNameForImportDate(IMLibraryPlist, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  id v11 = BUDynamicCast();

  return v11;
}

+ (id)assetIDFromItunesMetadataEntry:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_publisherUniqueIDFromItunesMetadataEntry_(IMLibraryPlist, v4, (uint64_t)v3, v5);
  if (!v8)
  {
    uint64_t v8 = objc_msgSend_uniqueIDFromItunesMetadataEntry_(IMLibraryPlist, v6, (uint64_t)v3, v7);
    if (!v8)
    {
      uint64_t v8 = objc_msgSend_packageFileHashFromItunesMetadataEntry_(IMLibraryPlist, v9, (uint64_t)v3, v10);
    }
  }

  return v8;
}

+ (id)publisherUniqueIDFromItunesMetadataEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v6 = objc_msgSend_valueForKeyPath_(v3, v4, @"book-info.publisher-unique-id", v5);

  uint64_t v7 = BUDynamicCast();

  return v7;
}

+ (id)uniqueIDFromItunesMetadataEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v6 = objc_msgSend_valueForKeyPath_(v3, v4, @"book-info.unique-id", v5);

  uint64_t v7 = BUDynamicCast();

  return v7;
}

+ (id)packageFileHashFromItunesMetadataEntry:(id)a3
{
  return (id)objc_msgSend_valueForKeyPath_(a3, a2, @"book-info.package-file-hash", v3);
}

+ (id)coverPathFromItunesMetadataEntry:(id)a3
{
  return (id)objc_msgSend_valueForKeyPath_(a3, a2, @"book-info.cover-image-path", v3);
}

+ (id)coverHashFromItunesMetadataEntry:(id)a3
{
  return (id)objc_msgSend_valueForKeyPath_(a3, a2, @"book-info.cover-image-hash", v3);
}

+ (id)titleFromItunesMetadataEntry:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_objectForKey_(v3, v4, @"itemName", v5);
  if (!v8)
  {
    uint64_t v8 = objc_msgSend_valueForKeyPath_(v3, v6, @"playlistName", v7);
  }

  return v8;
}

+ (id)endOfBookExperiencesFromItunesMetadataEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"experiences", v5);

  uint64_t v7 = BUDynamicCast();

  return v7;
}

+ (id)experienceKindFromExperienceEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"kind", v5);

  uint64_t v7 = BUDynamicCast();

  return v7;
}

+ (id)experienceLocationFromExperienceEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"loc", v5);

  uint64_t v7 = BUDynamicCast();

  return v7;
}

+ (id)experienceLocationTypeFromExperienceEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"locType", v5);

  uint64_t v7 = BUDynamicCast();

  return v7;
}

+ (id)experienceVersionFromExperienceEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"version", v5);

  uint64_t v7 = BUDynamicCast();

  return v7;
}

+ (id)experienceParamsFromExperienceEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"params", v5);

  uint64_t v7 = BUDynamicCast();

  return v7;
}

+ (id)experienceConfidenceFromExperienceParamEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"confidence", v5);

  uint64_t v7 = BUDynamicCast();

  return v7;
}

+ (id)keyNameForImportDate
{
  return @"importDate";
}

+ (id)keyNameForAuthor
{
  return @"Artist";
}

+ (id)keyNameForTitle
{
  return @"Name";
}

+ (id)keyNameForGenre
{
  return @"Genre";
}

+ (id)keyNameForExplicitContent
{
  return @"isExplicit";
}

+ (id)keyNameForComments
{
  return @"comments";
}

+ (id)keyNameForBookDescription
{
  return @"bookDescription";
}

+ (id)keyNameForYear
{
  return @"year";
}

+ (id)keyNameForLastOpened
{
  return @"BKLastOpenedDate";
}

+ (id)keyNameForFirstOpened
{
  return @"BKFirstOpenedDate";
}

+ (id)keyNameForRating
{
  return @"rating";
}

+ (id)keyNameForReadingLocation
{
  return @"currentReadingLocation";
}

+ (id)keyNameForHighWaterMark
{
  return @"highWaterMark";
}

+ (id)keyNameForGeneration
{
  return @"generation";
}

+ (id)keyNameForSampleAsset
{
  return @"isSample";
}

+ (id)keyNameForPublisherUniqueID
{
  return @"Publisher Unique ID";
}

+ (id)keyNameForProofedAsset
{
  return @"isProof";
}

+ (id)keyNameForPath
{
  return @"Path";
}

+ (id)keyNameForAccessDate
{
  return @"BLLastUserAccessDate";
}

+ (id)keyNameForBackupPath
{
  return @"Backup-Path";
}

+ (id)keyNameForStoreId
{
  return @"s";
}

+ (id)keyNameForStoreId2
{
  return @"Item ID";
}

+ (id)keyNameForUniqueId
{
  return @"Package Hash";
}

+ (id)keyNameForAssetType
{
  return @"AssetType";
}

+ (id)keyNameForFlavor
{
  return @"Flavor";
}

+ (id)keyNameForSubject
{
  return @"Subject";
}

+ (id)keyNameForBooksArray
{
  return @"Books";
}

+ (id)keyNameForDeletesArray
{
  return @"Deletes";
}

+ (id)keyNameForSortAuthor
{
  return @"Sort Artist";
}

+ (id)keyNameForSortTitle
{
  return @"Sort Name";
}

+ (id)keyNameForPublicationVersion
{
  return @"Publication Version";
}

+ (id)keyNameForHumanReadablePublicationVersion
{
  return @"Human Readable Publication Version";
}

+ (id)keyNameForPageProgression
{
  return @"Page Progression Direction";
}

+ (id)keyNameForLanguages
{
  return @"languages";
}

+ (id)keyNameForPrimaryLanguage
{
  return @"primaryLanguage";
}

+ (id)keyNameForScrollDirection
{
  return @"scroll-axis";
}

+ (id)keyNameForCoverWritingMode
{
  return @"cover-writing-mode";
}

+ (id)keyNameForIsEphemeral
{
  return @"Ephemeral";
}

+ (id)keyNameForIsSupplementalContent
{
  return @"isSupplementalContent";
}

+ (id)keyNameForStorePlaylistId
{
  return @"PlaylistID";
}

+ (id)keyNameForCollectionId
{
  return @"Collection ID";
}

+ (id)booksRepositoryPath
{
  id v4 = objc_msgSend_bu_booksRepositoryURL(NSURL, a2, v2, v3);
  uint64_t v8 = objc_msgSend_path(v4, v5, v6, v7);

  return v8;
}

+ (id)purchasesRepositoryPath
{
  if (qword_26AB400C0 != -1) {
    dispatch_once(&qword_26AB400C0, &unk_26CED3CD0);
  }
  uint64_t v2 = (void *)qword_26AB400B8;

  return v2;
}

+ (id)managedRepositoryPath
{
  if (qword_26AB400B0 != -1) {
    dispatch_once(&qword_26AB400B0, &unk_26CED3CF0);
  }
  uint64_t v2 = (void *)qword_26AB400A8;

  return v2;
}

+ (id)sampleRepositoryPath
{
  return (id)objc_msgSend_purchasesRepositoryPath(IMLibraryPlist, a2, v2, v3);
}

+ (id)stashedSampleRepositoryPath
{
  id v4 = objc_msgSend_purchasesRepositoryPath(IMLibraryPlist, a2, v2, v3);
  uint64_t v7 = objc_msgSend_stringByAppendingPathComponent_(v4, v5, @"Samples", v6);

  return v7;
}

+ (id)sharedContainerURL
{
  if (qword_26AB40050 != -1) {
    dispatch_once(&qword_26AB40050, &unk_26CED3D10);
  }
  uint64_t v2 = (void *)qword_26AB40048;

  return v2;
}

+ (id)sharedRepositoryPath
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21DFF99E8;
  block[3] = &unk_26448ACA0;
  block[4] = a1;
  if (qword_267D253C0 != -1) {
    dispatch_once(&qword_267D253C0, block);
  }
  uint64_t v2 = (void *)qword_267D253B8;

  return v2;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)directory
{
  return self->_directory;
}

- (void)setDirectory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directory, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end