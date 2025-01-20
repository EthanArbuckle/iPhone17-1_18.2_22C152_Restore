@interface BRQueryItem
+ (BOOL)supportsSecureCoding;
+ (id)askDaemonQueryItemForURL:(id)a3 andFakeFSEvent:(BOOL)a4 error:(id *)a5;
+ (id)askDaemonQueryItemForURL:(id)a3 error:(id *)a4;
+ (id)containerItemForContainer:(id)a3 forceScan:(BOOL)a4;
+ (id)containerItemForContainer:(id)a3 withRepresentativeItem:(id)a4;
+ (id)containerItemForContainer:(id)a3 withRepresentativeItem:(id)a4 zoneRowID:(id)a5;
+ (void)initialize;
- (BOOL)_isFPFSItem;
- (BOOL)_isInSharedZone;
- (BOOL)_isSharedFolderSubItem;
- (BOOL)canMerge:(id)a3;
- (BOOL)editedSinceShared;
- (BOOL)fp_isContainer;
- (BOOL)fp_isContainerPristine;
- (BOOL)fp_isLastModifiedByCurrentUser;
- (BOOL)fromRelativePath;
- (BOOL)isBRAlias;
- (BOOL)isConflicted;
- (BOOL)isContentZoneRoot;
- (BOOL)isDead;
- (BOOL)isDirectory;
- (BOOL)isDocument;
- (BOOL)isDownloadActive;
- (BOOL)isDownloaded;
- (BOOL)isDownloading;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToQueryItem:(id)a3;
- (BOOL)isEvictable;
- (BOOL)isFinderBookmark;
- (BOOL)isHidden;
- (BOOL)isHiddenExt;
- (BOOL)isInTransfer;
- (BOOL)isLive;
- (BOOL)isMostRecentVersionDownloaded;
- (BOOL)isNetworkOffline;
- (BOOL)isPackage;
- (BOOL)isPreCrash;
- (BOOL)isShared;
- (BOOL)isSharedByCurrentUser;
- (BOOL)isSymlink;
- (BOOL)isTopLevel;
- (BOOL)isTopLevelSharedItem;
- (BOOL)isTrashed;
- (BOOL)isUploadActive;
- (BOOL)isUploaded;
- (BOOL)isUploading;
- (BRFileObjectID)fileObjectID;
- (BRFileObjectID)parentFileObjectID;
- (BRQueryItem)initWithCoder:(id)a3;
- (BRQueryItem)initWithFPItem:(id)a3;
- (BRQueryItem)initWithQueryItem:(id)a3;
- (NSArray)conflictingVersions;
- (NSArray)decorations;
- (NSData)contentVersion;
- (NSData)structureVersion;
- (NSData)tagData;
- (NSData)versionIdentifier;
- (NSDate)contentModificationDate;
- (NSDate)creationDate;
- (NSDate)lastUsedDate;
- (NSDictionary)extendedAttributes;
- (NSDictionary)userInfo;
- (NSError)downloadingError;
- (NSError)uploadingError;
- (NSFileProviderItemVersion)itemVersion;
- (NSNumber)btime;
- (NSNumber)childItemCount;
- (NSNumber)documentSize;
- (NSNumber)favoriteRank;
- (NSNumber)hasUnresolvedConflicts;
- (NSNumber)isDownloadRequested;
- (NSNumber)lastUsedTime;
- (NSNumber)mtime;
- (NSNumber)size;
- (NSPersonNameComponents)mostRecentEditorNameComponents;
- (NSPersonNameComponents)ownerNameComponents;
- (NSString)appLibraryID;
- (NSString)collaborationIdentifier;
- (NSString)containerDisplayName;
- (NSString)description;
- (NSString)displayName;
- (NSString)filename;
- (NSString)fp_cloudContainerIdentifier;
- (NSString)itemIdentifier;
- (NSString)logicalName;
- (NSString)parentItemIdentifier;
- (NSString)parentPath;
- (NSString)path;
- (NSString)physicalName;
- (NSString)sharingPermissions;
- (NSString)symlinkTargetPath;
- (NSString)typeIdentifier;
- (NSURL)localRepresentationURL;
- (NSURL)url;
- (id)attributeForKey:(id)a3;
- (id)attributeForName:(id)a3;
- (id)attributeNames;
- (id)attributesForNames:(id)a3;
- (id)containerIDIfDesktopOrDocuments;
- (id)copyWithZone:(_NSZone *)a3;
- (id)downloadingStatus;
- (id)fileSize;
- (id)localizedFileNameIfDesktopOrDocuments;
- (id)owner;
- (id)parentFileID;
- (id)replacement;
- (id)sharedItemRole;
- (id)subclassDescription;
- (int64_t)contentPolicy;
- (unint64_t)capabilities;
- (unint64_t)fileSystemFlags;
- (unint64_t)hash;
- (unsigned)br_downloadStatus;
- (unsigned)br_shareOptions;
- (unsigned)br_uploadStatus;
- (unsigned)diffs;
- (void)_mergeAttrs:(id)a3;
- (void)_mergeURL:(id)a3;
- (void)attachLogicalExtension:(id)a3 physicalExtension:(id)a4;
- (void)clearDiffs;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)markDead;
- (void)merge:(id)a3;
- (void)merge:(id)a3 allowMergingFileObjectIDIfPossible:(BOOL)a4;
- (void)mergeProgressUpdate:(id)a3;
- (void)parentFileID;
- (void)setAttribute:(id)a3 forKey:(id)a4;
- (void)setIsNetworkOffline:(BOOL)a3;
- (void)setIsPreCrash:(BOOL)a3;
- (void)setReplacement:(id)a3;
@end

@implementation BRQueryItem

+ (void)initialize
{
  v26[43] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = *MEMORY[0x1E4F285C0];
    v25[0] = *MEMORY[0x1E4F285C8];
    v25[1] = v2;
    v26[0] = &__block_literal_global_15;
    v26[1] = &__block_literal_global_66;
    uint64_t v3 = *MEMORY[0x1E4F285E8];
    v25[2] = *MEMORY[0x1E4F285D0];
    v25[3] = v3;
    v26[2] = &__block_literal_global_68;
    v26[3] = &__block_literal_global_70;
    uint64_t v4 = *MEMORY[0x1E4F285F8];
    v25[4] = *MEMORY[0x1E4F285F0];
    v25[5] = v4;
    v26[4] = &__block_literal_global_72;
    v26[5] = &__block_literal_global_74_0;
    uint64_t v5 = *MEMORY[0x1E4F28608];
    v25[6] = *MEMORY[0x1E4F28600];
    v25[7] = v5;
    v26[6] = &__block_literal_global_76;
    v26[7] = &__block_literal_global_78;
    uint64_t v6 = *MEMORY[0x1E4F285E0];
    v25[8] = *MEMORY[0x1E4F285B8];
    v25[9] = v6;
    v26[8] = &__block_literal_global_80;
    v26[9] = &__block_literal_global_82;
    uint64_t v7 = *MEMORY[0x1E4F28698];
    v25[10] = *MEMORY[0x1E4F285D8];
    v25[11] = v7;
    v26[10] = &__block_literal_global_84;
    v26[11] = &__block_literal_global_86_0;
    uint64_t v8 = *MEMORY[0x1E4F286A0];
    v25[12] = *MEMORY[0x1E4F28688];
    v25[13] = v8;
    v26[12] = &__block_literal_global_89;
    v26[13] = &__block_literal_global_91;
    uint64_t v9 = *MEMORY[0x1E4F286D0];
    v25[14] = *MEMORY[0x1E4F286A8];
    v25[15] = v9;
    v26[14] = &__block_literal_global_93;
    v26[15] = &__block_literal_global_95;
    uint64_t v10 = *MEMORY[0x1E4F286C0];
    v25[16] = *MEMORY[0x1E4F28670];
    v25[17] = v10;
    v26[16] = &__block_literal_global_97;
    v26[17] = &__block_literal_global_99;
    uint64_t v11 = *MEMORY[0x1E4F28668];
    v25[18] = *MEMORY[0x1E4F286C8];
    v25[19] = v11;
    v26[18] = &__block_literal_global_101;
    v26[19] = &__block_literal_global_103;
    uint64_t v12 = *MEMORY[0x1E4F286E8];
    v25[20] = *MEMORY[0x1E4F286D8];
    v25[21] = v12;
    v26[20] = &__block_literal_global_105;
    v26[21] = &__block_literal_global_107;
    uint64_t v13 = *MEMORY[0x1E4F28660];
    v25[22] = *MEMORY[0x1E4F286B0];
    v25[23] = v13;
    v26[22] = &__block_literal_global_109;
    v26[23] = &__block_literal_global_111;
    uint64_t v14 = *MEMORY[0x1E4F286B8];
    v25[24] = *MEMORY[0x1E4F286E0];
    v25[25] = v14;
    v26[24] = &__block_literal_global_113;
    v26[25] = &__block_literal_global_115;
    uint64_t v15 = *MEMORY[0x1E4F28708];
    v25[26] = *MEMORY[0x1E4F28710];
    v25[27] = v15;
    v26[26] = &__block_literal_global_117;
    v26[27] = &__block_literal_global_119;
    v25[28] = *MEMORY[0x1E4F28700];
    v25[29] = @"NSMetadataUbiquitousSharedItemLastEditorNameKey";
    v26[28] = &__block_literal_global_121;
    v26[29] = &__block_literal_global_123_0;
    uint64_t v16 = *MEMORY[0x1E4F28718];
    v25[30] = @"NSMetadataUbiquitousSharedItemLastEditorNameComponentsKey";
    v25[31] = v16;
    v26[30] = &__block_literal_global_125_0;
    v26[31] = &__block_literal_global_127;
    uint64_t v17 = *MEMORY[0x1E4F28730];
    v25[32] = *MEMORY[0x1E4F286F0];
    v25[33] = v17;
    v26[32] = &__block_literal_global_129_0;
    v26[33] = &__block_literal_global_131;
    v25[34] = *MEMORY[0x1E4F286F8];
    v25[35] = @"BRURLTagNamesKey";
    v26[34] = &__block_literal_global_133;
    v26[35] = &__block_literal_global_135;
    v25[36] = @"BRMetadataItemFileObjectIdentifierKey";
    v25[37] = @"BRMetadataItemParentFileIDKey";
    v26[36] = &__block_literal_global_137;
    v26[37] = &__block_literal_global_139;
    v25[38] = @"BRMetadataUbiquitousItemDownloadingSizeKey";
    v25[39] = @"BRMetadataUbiquitousItemUploadingSizeKey";
    v26[38] = &__block_literal_global_141;
    v26[39] = &__block_literal_global_143;
    v25[40] = @"BRModifiedSinceSharedKey";
    v25[41] = @"BRMetadataIsTopLevelSharedItemKey";
    v26[40] = &__block_literal_global_145;
    v26[41] = &__block_literal_global_147;
    v25[42] = @"BRMetadataCreatorNameComponentsKey";
    v26[42] = &__block_literal_global_149;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:43];
    v19 = (void *)_getterMap;
    _getterMap = v18;

    v20 = [(id)_getterMap keyEnumerator];
    uint64_t v21 = [v20 allObjects];
    v22 = (void *)_allKeys;
    _allKeys = v21;

    uint64_t v23 = [MEMORY[0x1E4F1C9E8] sharedKeySetForKeys:_allKeys];
    v24 = (void *)_sharedKeySet;
    _sharedKeySet = v23;
  }
}

id __25__BRQueryItem_initialize__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 url];
  uint64_t v3 = *MEMORY[0x1E4F1C728];
  id v12 = 0;
  id v13 = 0;
  int v4 = [v2 getPromisedItemResourceValue:&v13 forKey:v3 error:&v12];
  id v5 = v13;
  id v6 = v12;
  uint64_t v7 = v6;
  if (v4)
  {
    id v8 = v5;
  }
  else
  {
    NSLog((NSString *)@"unable to get %@ property for %@: %@\n", v3, v2, v6);
    id v8 = 0;
  }

  if (v8)
  {
    uint64_t v9 = (void *)_UTTypeCopyPedigreeSet();
    uint64_t v10 = [v9 allObjects];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

id __25__BRQueryItem_initialize__block_invoke_2(uint64_t a1, void *a2)
{
  return _getContentTypeValue(a2, 1);
}

id __25__BRQueryItem_initialize__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 isDirectory] ^ 1;
  int v4 = [v2 logicalName];

  id v5 = objc_msgSend(v4, "br_displayFilenameWithExtensionHidden:", v3);

  return v5;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 logicalName];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 size];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_6()
{
  return MEMORY[0x1E4F1CC38];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 path];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 url];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 appLibraryID];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 creationDate];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 contentModificationDate];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 isConflicted];

  return [v2 numberWithBool:v3];
}

id __25__BRQueryItem_initialize__block_invoke_13(uint64_t a1, void *a2)
{
  unsigned int v2 = objc_msgSend(a2, "br_downloadStatus") - 1;
  if (v2 > 2) {
    id v3 = 0;
  }
  else {
    id v3 = **((id **)&unk_1E59AE7C0 + (__int16)v2);
  }

  return v3;
}

id __25__BRQueryItem_initialize__block_invoke_14(uint64_t a1, void *a2)
{
  int v2 = objc_msgSend(a2, "br_downloadStatus");
  id v3 = (void *)MEMORY[0x1E4F1CC38];
  if (v2 == 1) {
    id v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  if (v2) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }

  return v4;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_15(uint64_t a1, void *a2)
{
  return _getIsDownloading(a2);
}

id __25__BRQueryItem_initialize__block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (![v2 isDirectory])
  {
    int v9 = objc_msgSend(v2, "br_downloadStatus");
    if (!v9)
    {
      uint64_t v10 = 0;
      goto LABEL_16;
    }
    if (v9 == 3)
    {
      uint64_t v10 = &unk_1EF133670;
      goto LABEL_16;
    }
    uint64_t v11 = [v2 attributeForKey:@"dl%"];
    id v3 = (void *)v11;
    id v12 = &unk_1EF133680;
    if (v11) {
      id v12 = (void *)v11;
    }
    id v8 = v12;
    goto LABEL_14;
  }
  id v3 = [v2 attributeForKey:@"inflight"];
  int v4 = [v2 attributeForKey:@"downloaded"];
  uint64_t v5 = [v4 unsignedLongLongValue];

  id v6 = [v2 attributeForKey:@"needsDownload"];
  unint64_t v7 = [v6 unsignedLongLongValue];

  if ([v3 downloadTotalSize] > v7) {
    unint64_t v7 = [v3 downloadTotalSize];
  }
  if (v7 + v5)
  {
    objc_msgSend(NSNumber, "numberWithDouble:", (double)(unint64_t)(objc_msgSend(v3, "downloadCompletedSize") + v5) * 100.0 / (double)(v7 + v5));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
    uint64_t v10 = v8;
    goto LABEL_15;
  }
  uint64_t v10 = 0;
LABEL_15:

LABEL_16:

  return v10;
}

id __25__BRQueryItem_initialize__block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isDownloading]
    && objc_msgSend(v2, "br_downloadStatus") != 3
    && [v2 isNetworkOffline])
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4355 userInfo:0];
  }
  else
  {
    uint64_t v3 = [v2 attributeForKey:@"dlErr"];
  }
  int v4 = (void *)v3;

  return v4;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_18(uint64_t a1, void *a2)
{
  id v2 = a2;
  unsigned int v3 = objc_msgSend(v2, "br_uploadStatus");
  if (v3 >= 4)
  {
    uint64_t v5 = brc_bread_crumbs((uint64_t)"_getIsUploaded", 381);
    id v6 = brc_default_log(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __25__BRQueryItem_initialize__block_invoke_18_cold_1();
    }

    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = qword_1E59AE7D8[(__int16)v3];
  }

  return v4;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_19(uint64_t a1, void *a2)
{
  return _getIsUploading(a2);
}

uint64_t __25__BRQueryItem_initialize__block_invoke_20(uint64_t a1, void *a2)
{
  return [a2 isDownloadRequested];
}

id __25__BRQueryItem_initialize__block_invoke_21(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isDirectory])
  {
    unsigned int v3 = [v2 attributeForKey:@"inflight"];
    uint64_t v4 = [v2 attributeForKey:@"uploaded"];
    uint64_t v5 = [v4 unsignedLongLongValue];

    id v6 = [v2 attributeForKey:@"needsUpload"];
    unint64_t v7 = [v6 unsignedLongLongValue];

    id v8 = [v2 attributeForKey:@"needsSyncUp"];
    uint64_t v9 = [v8 unsignedLongLongValue];

    if (v7 < [v3 uploadTotalSize]) {
      unint64_t v7 = [v3 uploadTotalSize];
    }
    unint64_t v10 = v7 + v5;
    if (v10 || !v9)
    {
      if (v10) {
        double v13 = (double)(unint64_t)([v3 uploadCompletedSize] + v5) / (double)v10;
      }
      else {
        double v13 = 1.0;
      }
      if (v9) {
        double v13 = v13 * 0.95;
      }
      uint64_t v11 = [NSNumber numberWithDouble:v13 * 100.0];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    int v12 = objc_msgSend(v2, "br_uploadStatus");
    if (v12)
    {
      if (v12 == 3)
      {
        uint64_t v11 = &unk_1EF133670;
      }
      else if (v12 == 2)
      {
        uint64_t v11 = &unk_1EF133690;
      }
      else
      {
        uint64_t v14 = NSNumber;
        uint64_t v15 = [v2 attributeForKey:@"ul%"];
        [v15 doubleValue];
        uint64_t v11 = [v14 numberWithDouble:v16 * 0.95];
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }

  return v11;
}

id __25__BRQueryItem_initialize__block_invoke_22(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "br_uploadStatus") == 3 || !objc_msgSend(v2, "isNetworkOffline"))
  {
    uint64_t v3 = [v2 attributeForKey:@"ulErr"];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4355 userInfo:0];
  }
  uint64_t v4 = (void *)v3;

  return v4;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_23(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 isBRAlias];

  return [v2 numberWithBool:v3];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_24(uint64_t a1, void *a2)
{
  return [a2 containerDisplayName];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_25(uint64_t a1, void *a2)
{
  return [a2 localRepresentationURL];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_26(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 isShared];

  return [v2 numberWithBool:v3];
}

id __25__BRQueryItem_initialize__block_invoke_27(uint64_t a1, void *a2)
{
  id v2 = [a2 attributeForKey:@"owner-components"];
  uint64_t v3 = objc_msgSend(v2, "br_formattedName");

  return v3;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_28(uint64_t a1, void *a2)
{
  return [a2 attributeForKey:@"owner-components"];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_29(uint64_t a1, void *a2)
{
  return [a2 attributeForKey:@"last-editor-components"];
}

id __25__BRQueryItem_initialize__block_invoke_30(uint64_t a1, void *a2)
{
  id v2 = [a2 attributeForKey:@"last-editor-components"];
  uint64_t v3 = objc_msgSend(v2, "br_formattedName");

  return v3;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_31(uint64_t a1, void *a2)
{
  return [a2 attributeForKey:@"last-editor-components"];
}

id __25__BRQueryItem_initialize__block_invoke_32(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = 0;
  switch(objc_msgSend(v2, "br_shareOptions"))
  {
    case 0u:
      break;
    case 1u:
    case 3u:
      uint64_t v4 = (id *)MEMORY[0x1E4F28720];
      goto LABEL_4;
    case 2u:
    case 4u:
      uint64_t v4 = (id *)MEMORY[0x1E4F28728];
LABEL_4:
      id v3 = *v4;
      break;
    default:
      uint64_t v5 = brc_bread_crumbs((uint64_t)"_getSharePermissions", 465);
      id v6 = brc_default_log(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        __25__BRQueryItem_initialize__block_invoke_32_cold_1();
      }

      id v3 = 0;
      break;
  }

  return v3;
}

id __25__BRQueryItem_initialize__block_invoke_33(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = 0;
  switch(objc_msgSend(v2, "br_shareOptions"))
  {
    case 0u:
      break;
    case 1u:
    case 2u:
    case 4u:
      uint64_t v4 = (id *)MEMORY[0x1E4F28728];
      goto LABEL_7;
    case 3u:
      uint64_t v4 = (id *)MEMORY[0x1E4F28720];
LABEL_7:
      id v3 = *v4;
      break;
    default:
      uint64_t v5 = brc_bread_crumbs((uint64_t)"_getSharedItemCurrentUserPermissions", 486);
      id v6 = brc_default_log(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        __25__BRQueryItem_initialize__block_invoke_32_cold_1();
      }

      id v3 = 0;
      break;
  }

  return v3;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_34(uint64_t a1, void *a2)
{
  return [a2 sharedItemRole];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_35(uint64_t a1, void *a2)
{
  return [a2 sharedItemRole];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_36(uint64_t a1, void *a2)
{
  return [a2 attributeForKey:@"tags"];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_37(uint64_t a1, void *a2)
{
  return [a2 fileObjectID];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_38(uint64_t a1, void *a2)
{
  return [a2 parentFileID];
}

id __25__BRQueryItem_initialize__block_invoke_39(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _getIsDownloading(v2);
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    uint64_t v5 = [v2 attributeForKey:@"needsDownload"];
    uint64_t v6 = [v5 unsignedLongLongValue];

    unint64_t v7 = [v2 attributeForKey:@"downloaded"];
    uint64_t v8 = [v7 unsignedLongLongValue];

    uint64_t v9 = [NSNumber numberWithUnsignedLongLong:v8 + v6];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id __25__BRQueryItem_initialize__block_invoke_40(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _getIsUploading(v2);
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    if ([v2 isDirectory])
    {
      uint64_t v5 = [v2 attributeForKey:@"needsUpload"];
      uint64_t v6 = [v5 unsignedLongLongValue];

      unint64_t v7 = [v2 attributeForKey:@"uploaded"];
      uint64_t v8 = [v7 unsignedLongLongValue];

      [NSNumber numberWithUnsignedLongLong:v8 + v6];
    }
    else
    {
      [v2 size];
    uint64_t v9 = };
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id __25__BRQueryItem_initialize__block_invoke_41(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isShared] && objc_msgSend(v2, "isDocument"))
  {
    id v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "editedSinceShared"));
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_42(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 isTopLevelSharedItem];

  return [v2 numberWithBool:v3];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_43(uint64_t a1, void *a2)
{
  return [a2 attributeForKey:@"creator-components"];
}

- (id)containerIDIfDesktopOrDocuments
{
  if ([(BRQueryItem *)self isDirectory])
  {
    uint64_t v3 = [(BRQueryItem *)self logicalName];
    if (([v3 isEqualToString:@"Desktop"] & 1) != 0
      || [v3 isEqualToString:@"Documents"])
    {
      int v4 = [(BRQueryItem *)self url];
      uint64_t v5 = objc_msgSend(v4, "br_containerIDIfIsDocumentsContainerURL");
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)localizedFileNameIfDesktopOrDocuments
{
  id v2 = [(BRQueryItem *)self containerIDIfDesktopOrDocuments];
  uint64_t v3 = v2;
  if (v2)
  {
    if ([v2 isEqualToString:@"com.apple.Desktop"])
    {
      uint64_t v4 = +[BRContainer localizedNameForDesktopContainer];
LABEL_6:
      uint64_t v5 = (void *)v4;
      goto LABEL_8;
    }
    if ([v3 isEqualToString:@"com.apple.Documents"])
    {
      uint64_t v4 = +[BRContainer localizedNameForDocumentsContainer];
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_8:

  return v5;
}

- (BOOL)fp_isContainer
{
  return 0;
}

- (BOOL)fp_isContainerPristine
{
  return 0;
}

- (NSString)fp_cloudContainerIdentifier
{
  return 0;
}

- (NSString)itemIdentifier
{
  return [(BRFileObjectID *)self->_fileObjectID asString];
}

- (BOOL)_isFPFSItem
{
  return [(BRFileObjectID *)self->_fileObjectID isFpfsItem];
}

- (NSString)parentItemIdentifier
{
  if (![(BRQueryItem *)self _isFPFSItem])
  {
    if ([(BRQueryItem *)self isTopLevel] || [(BRQueryItem *)self isTrashed])
    {
LABEL_8:
      uint64_t v3 = (id *)MEMORY[0x1E4F25C68];
      goto LABEL_9;
    }
LABEL_6:
    parentFileObjectID = self->_parentFileObjectID;
    if (parentFileObjectID)
    {
      id v5 = [(BRFileObjectID *)parentFileObjectID asString];
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (![(BRQueryItem *)self isTrashed]) {
    goto LABEL_6;
  }
  uint64_t v3 = (id *)MEMORY[0x1E4F25C98];
LABEL_9:
  id v5 = *v3;
LABEL_10:

  return (NSString *)v5;
}

- (NSFileProviderItemVersion)itemVersion
{
  if (BRIsFPFSEnabled(self, a2))
  {
    id v3 = objc_alloc(MEMORY[0x1E4F25DC8]);
    uint64_t v4 = (void *)[v3 initWithMainContentVersion:self->_contentVersion equivalentContentVersions:self->_equivalentContentVersions mainMetadataVersion:self->_structureVersion equivalentMetadataVersions:MEMORY[0x1E4F1CBF0] lastEditorDeviceName:self->_lastEditorDeviceName];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSFileProviderItemVersion *)v4;
}

- (NSString)filename
{
  id v3 = [(BRQueryItem *)self localizedFileNameIfDesktopOrDocuments];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F285E8]];
  }
  uint64_t v6 = v5;

  return (NSString *)v6;
}

- (NSString)displayName
{
  id v3 = [(BRQueryItem *)self localizedFileNameIfDesktopOrDocuments];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F285D0]];
  }
  uint64_t v6 = v5;

  return (NSString *)v6;
}

- (NSString)typeIdentifier
{
  return (NSString *)_getContentTypeValue(self, 0);
}

- (NSNumber)documentSize
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(BRQueryItem *)v2 attributeForName:*MEMORY[0x1E4F285F0]];
  objc_sync_exit(v2);

  return (NSNumber *)v3;
}

- (BOOL)isHidden
{
  id v3 = [(BRQueryItem *)self logicalName];
  if ([v3 hasPrefix:@"."]) {
    LOBYTE(v4) = 1;
  }
  else {
    unint64_t v4 = ((unint64_t)LODWORD(self->_flags.value) >> 26) & 1;
  }

  return v4;
}

- (BOOL)_isInSharedZone
{
  int v2 = (*(_DWORD *)&self->_flags.var0 >> 11) & 7;
  if ((v2 - 3) < 2) {
    return 1;
  }
  if (v2) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = self->_shareRootFileObjectID == 0;
  }
  return !v4;
}

- (NSDictionary)userInfo
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  id v5 = (void *)v3;
  if (self->_zoneRowID && self->_parentZoneRowID)
  {
    if (BRIsFPFSEnabled(v3, v4))
    {
      uint64_t v6 = [(BRQueryItem *)self url];
      int v7 = objc_msgSend(v6, "br_isInTrash");

      if (v7) {
        [v5 setObject:self->_appLibraryID forKeyedSubscript:@"palid"];
      }
    }
    [v5 setObject:self->_zoneRowID forKeyedSubscript:@"zid"];
    [v5 setObject:self->_parentZoneRowID forKeyedSubscript:@"pzid"];
    uint64_t v8 = [NSNumber numberWithInt:(*(_DWORD *)&self->_flags.var0 & 0x3800) != 0];
    [v5 setObject:v8 forKeyedSubscript:@"s"];

    if ((*(_DWORD *)&self->_flags.var0 & 0x3800) == 0x1800)
    {
      [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ro"];
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BRQueryItem isUploaded](self, "isUploaded"));
      [v5 setObject:v9 forKeyedSubscript:@"up"];
    }
    shareRootFileObjectID = self->_shareRootFileObjectID;
    if (shareRootFileObjectID)
    {
      uint64_t v11 = [(BRFileObjectID *)shareRootFileObjectID asString];
      [v5 setObject:v11 forKeyedSubscript:@"sr"];
    }
    if ([(BRQueryItem *)self isDirectory])
    {
      int v12 = [NSNumber numberWithInt:(*(_DWORD *)&self->_flags.var0 & 0xC00000) != 0];
      [v5 setObject:v12 forKeyedSubscript:@"cs"];

      double v13 = [NSNumber numberWithUnsignedShort:(*(_DWORD *)&self->_flags.var0 >> 23) & 1];
      [v5 setObject:v13 forKeyedSubscript:@"csbm"];

      uint64_t v14 = [NSNumber numberWithUnsignedShort:(*(_DWORD *)&self->_flags.var0 >> 22) & 1];
      [v5 setObject:v14 forKeyedSubscript:@"cstm"];
    }
    if ([(BRQueryItem *)self _isInSharedZone]) {
      uint64_t v15 = &unk_1EF1335C8;
    }
    else {
      uint64_t v15 = &unk_1EF1335E0;
    }
    [v5 setObject:v15 forKeyedSubscript:@"isz"];
    if ([(BRQueryItem *)self _isSharedFolderSubItem]
      && ![(BRQueryItem *)self editedSinceShared])
    {
      double v16 = [(BRQueryItem *)self attributeForKey:@"creator-components"];
      [v5 setObject:v16 forKeyedSubscript:@"crnc"];
    }
    if ([(BRQueryItem *)self isPackage]) {
      [v5 setObject:self->_size forKeyedSubscript:@"pkg_size"];
    }
  }
  uint64_t v17 = [(BRQueryItem *)self attributeForKey:@"quota-available"];
  if (v17)
  {
    uint64_t v18 = objc_opt_new();
    [v18 setCountStyle:3];
    v19 = objc_msgSend(v18, "stringFromByteCount:", objc_msgSend(v17, "longLongValue"));
    v20 = objc_opt_new();
    [v20 setNumberStyle:1];
    [v18 setIncludesUnit:0];
    uint64_t v21 = objc_msgSend(v18, "stringFromByteCount:", objc_msgSend(v17, "longLongValue"));
    v22 = [v20 numberFromString:v21];

    if (v19 && v22)
    {
      [v5 setObject:v19 forKeyedSubscript:@"q"];
      [v5 setObject:v22 forKeyedSubscript:@"qn"];
    }
    else
    {
      uint64_t v23 = brc_bread_crumbs((uint64_t)"-[BRQueryItem userInfo]", 799);
      v24 = brc_default_log(0);
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        int v28 = 138413058;
        v29 = v17;
        __int16 v30 = 2112;
        v31 = v19;
        __int16 v32 = 2112;
        v33 = v22;
        __int16 v34 = 2112;
        v35 = v23;
        _os_log_error_impl(&dword_19ED3F000, v24, (os_log_type_t)0x90u, "[ERROR] Couldn't format quota %@ (%@, %@)%@", (uint8_t *)&v28, 0x2Au);
      }
    }
  }
  if ([(BRQueryItem *)self editedSinceShared]) {
    [v5 setObject:&unk_1EF1335C8 forKeyedSubscript:@"ess"];
  }
  if ([v5 count]) {
    v25 = v5;
  }
  else {
    v25 = 0;
  }
  v26 = v25;

  return v26;
}

- (NSArray)decorations
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(BRQueryItem *)self attributeForKey:@"quota-available"];

  if (v4) {
    [v3 addObject:@"Quota"];
  }
  if ([(BRQueryItem *)self _isSharedFolderSubItem]
    && ![(BRQueryItem *)self editedSinceShared])
  {
    id v5 = [(BRQueryItem *)self attributeForKey:@"created-by-user"];
    int v6 = [v5 BOOLValue];

    if (v6) {
      int v7 = @"AddedByMe";
    }
    else {
      int v7 = @"AddedByOther";
    }
    [v3 addObject:v7];
  }

  return (NSArray *)v3;
}

- (unint64_t)capabilities
{
  int v3 = BRIsFPFSEnabled(self, a2);
  if ([(BRFileObjectID *)self->_fileObjectID isRootContainerItem]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 61;
  }
  [(BRQueryItem *)self isDirectory];
  if (![(BRFileObjectID *)self->_fileObjectID isRootContainerItem]
    && (*(_DWORD *)&self->_flags.var0 & 0x20000) != 0)
  {
    if (![(BRQueryItem *)self isDirectory] || (*(_DWORD *)&self->_flags.var0 & 0x3800) == 0x1800)
    {
      if ((*(_DWORD *)&self->_flags.var0 & 0x80000) == 0) {
        v4 |= 2uLL;
      }
    }
    else
    {
      v4 |= 2uLL;
    }
  }
  BOOL v5 = [(BRQueryItem *)self isBRAlias];
  unint64_t v6 = v4 & 0xFFFFFFFFFFFFFFEFLL;
  if (v5) {
    unint64_t v7 = v4 & 0xFFFFFFFFFFFFFFEFLL;
  }
  else {
    unint64_t v7 = v4;
  }
  unsigned int value = self->_flags.value;
  unint64_t v9 = v7;
  if (((value >> 11) & 7) - 3 <= 1)
  {
    unint64_t v9 = v6;
    if ((value & 0x3800) == 0x1800)
    {
      BOOL v10 = [(BRQueryItem *)self _isSharedFolderSubItem];
      uint64_t v11 = -19;
      if (v10) {
        uint64_t v11 = -63;
      }
      unint64_t v9 = v11 & v7;
    }
  }
  if ((v3 & 1) == 0)
  {
    if ([(BRQueryItem *)self isEvictable]) {
      v9 |= 0x40uLL;
    }
    if ([(BRQueryItem *)self isDirectory]) {
      v9 |= *MEMORY[0x1E4F25C60];
    }
  }
  if (((LODWORD(self->_flags.value) | ((unint64_t)BYTE4(self->_flags.value) << 32)) & 0x100000000) != 0) {
    goto LABEL_30;
  }
  int v12 = [(BRQueryItem *)self parentItemIdentifier];
  if ([v12 isEqualToString:*MEMORY[0x1E4F25C68]])
  {
    double v13 = [(BRQueryItem *)self filename];
    if ([v13 isEqualToString:@"Desktop"])
    {

LABEL_30:
      v9 &= 0xFFFFFFFFFFFFFF63;
      goto LABEL_31;
    }
    uint64_t v14 = [(BRQueryItem *)self filename];
    int v15 = [v14 isEqualToString:@"Documents"];

    if (v15) {
      goto LABEL_30;
    }
  }
  else
  {
  }
LABEL_31:
  if (v3 && ((LODWORD(self->_flags.value) | ((unint64_t)BYTE4(self->_flags.value) << 32)) & 0x200000000) != 0) {
    v9 |= *MEMORY[0x1E4F25C58];
  }
  return v9;
}

- (unint64_t)fileSystemFlags
{
  int v2 = self;
  objc_sync_enter(v2);
  if (![(BRFileObjectID *)v2->_fileObjectID isRootContainerItem]
    && ((*(_DWORD *)&v2->_flags.var0 & 0x20000) != 0
     || ([(BRQueryItem *)v2 isDirectory] || [(BRQueryItem *)v2 isPackage])
     && ([(BRQueryItem *)v2 capabilities] & 4) != 0))
  {
    uint64_t v3 = 6;
  }
  else
  {
    uint64_t v3 = 2;
  }
  uint64_t v4 = BYTE4(v2->_flags.value);
  uint64_t value_low = LODWORD(v2->_flags.value);
  if ([(BRQueryItem *)v2 isHidden]) {
    unint64_t v6 = v3 | ((value_low | (unint64_t)(v4 << 32)) >> 18) & 1 | ((value_low | (unint64_t)(v4 << 32)) >> 10) & 0x10 | 8;
  }
  else {
    unint64_t v6 = v3 | ((value_low | (unint64_t)(v4 << 32)) >> 18) & 1 | ((value_low | (unint64_t)(v4 << 32)) >> 10) & 0x10;
  }
  objc_sync_exit(v2);

  return v6;
}

- (NSDictionary)extendedAttributes
{
  return self->_xattrs;
}

- (NSArray)conflictingVersions
{
  return self->_conflictingVersions;
}

- (NSString)symlinkTargetPath
{
  return self->_symlinkTargetPath;
}

- (int64_t)contentPolicy
{
  return self->_contentPolicy;
}

- (NSNumber)childItemCount
{
  return self->_childItemCount;
}

- (id)fileSize
{
  return [(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F285F0]];
}

- (NSDate)creationDate
{
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(NSNumber *)v2->_btime unsignedLongLongValue];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  objc_sync_exit(v2);

  return (NSDate *)v4;
}

- (NSDate)contentModificationDate
{
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(NSNumber *)v2->_mtime unsignedLongLongValue];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v3];
LABEL_5:
    BOOL v5 = (void *)v4;
    goto LABEL_6;
  }
  if ([(BRQueryItem *)v2 isDirectory])
  {
    uint64_t v4 = [(BRQueryItem *)v2 creationDate];
    goto LABEL_5;
  }
  BOOL v5 = 0;
LABEL_6:
  objc_sync_exit(v2);

  return (NSDate *)v5;
}

- (BOOL)isDownloaded
{
  int v2 = [(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F28688]];
  char v3 = [v2 isEqualToString:*MEMORY[0x1E4F28690]] ^ 1;

  return v3;
}

- (BOOL)isDownloading
{
  int v2 = [(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F286A8]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isMostRecentVersionDownloaded
{
  int v2 = [(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F28688]];
  char v3 = [v2 isEqualToString:*MEMORY[0x1E4F28678]];

  return v3;
}

- (BOOL)isUploaded
{
  int v2 = [(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F286C0]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isUploading
{
  int v2 = [(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F286C8]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSError)uploadingError
{
  return (NSError *)[(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F286E8]];
}

- (id)downloadingStatus
{
  v11[3] = *MEMORY[0x1E4F143B8];
  int v2 = [(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F28688]];
  uint64_t v3 = *MEMORY[0x1E4F1C748];
  uint64_t v4 = *MEMORY[0x1E4F28690];
  v10[0] = *MEMORY[0x1E4F28678];
  v10[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1C760];
  v11[0] = v3;
  v11[1] = v5;
  v10[2] = *MEMORY[0x1E4F28680];
  v11[2] = *MEMORY[0x1E4F1C750];
  unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  unint64_t v7 = v6;
  if (v2)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:v2];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (NSError)downloadingError
{
  return (NSError *)[(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F28670]];
}

- (NSNumber)hasUnresolvedConflicts
{
  return (NSNumber *)[(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F28698]];
}

- (BOOL)isShared
{
  int v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (*(_DWORD *)&v2->_flags.var0 & 0x3800) != 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isTopLevelSharedItem
{
  BOOL v3 = [(BRQueryItem *)self isShared];
  if (v3) {
    LOBYTE(v3) = ![(BRQueryItem *)self _isSharedFolderSubItem];
  }
  return v3;
}

- (BOOL)_isSharedFolderSubItem
{
  int v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 21) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isSharedByCurrentUser
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int v2 = [(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F286F8]];
  uint64_t v3 = *MEMORY[0x1E4F28740];
  v9[0] = *MEMORY[0x1E4F28738];
  v9[1] = v3;
  uint64_t v5 = *MEMORY[0x1E4F1C7F8];
  v10[0] = *MEMORY[0x1E4F1C7F0];
  uint64_t v4 = v10[0];
  v10[1] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  unint64_t v7 = [v6 objectForKeyedSubscript:v2];
  LOBYTE(v4) = [v7 isEqualToString:v4];

  return v4;
}

- (BOOL)fp_isLastModifiedByCurrentUser
{
  if ([(BRQueryItem *)self isShared] && ![(BRQueryItem *)self editedSinceShared]) {
    return 0;
  }
  uint64_t v3 = [(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F28700]];
  BOOL v4 = v3 == 0;

  return v4;
}

- (id)owner
{
  int v2 = [(BRQueryItem *)self ownerNameComponents];
  uint64_t v3 = v2;
  if (v2)
  {
    BOOL v4 = objc_msgSend(v2, "br_formattedName");
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSPersonNameComponents)ownerNameComponents
{
  return (NSPersonNameComponents *)[(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F28708]];
}

- (NSPersonNameComponents)mostRecentEditorNameComponents
{
  if ([(BRQueryItem *)self editedSinceShared])
  {
    uint64_t v3 = [(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F28700]];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSPersonNameComponents *)v3;
}

- (NSString)sharingPermissions
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int v2 = [(BRQueryItem *)self attributeForName:*MEMORY[0x1E4F28718]];
  uint64_t v3 = *MEMORY[0x1E4F28728];
  v9[0] = *MEMORY[0x1E4F28720];
  v9[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1C7E0];
  v10[0] = *MEMORY[0x1E4F1C7D8];
  v10[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  unint64_t v6 = v5;
  if (v2)
  {
    unint64_t v7 = [v5 objectForKeyedSubscript:v2];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return (NSString *)v7;
}

- (NSString)collaborationIdentifier
{
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_collaborationIdentifier;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)fromRelativePath
{
  return ((unint64_t)LODWORD(self->_flags.value) >> 29) & 1;
}

- (NSURL)url
{
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_url;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)containerDisplayName
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(BRFileObjectID *)v2->_fileObjectID isRootContainerItem];
  if v3 && (BRIsFPFSEnabled(v3, v4))
  {
    uint64_t v5 = 0;
  }
  else
  {
    unint64_t v6 = [BRMangledID alloc];
    unint64_t v7 = [(BRQueryItem *)v2 appLibraryID];
    uint64_t v8 = [(BRMangledID *)v6 initWithAppLibraryName:v7];

    unint64_t v9 = +[BRContainerCache containerCache];
    BOOL v10 = [v9 containerByID:v8];

    uint64_t v5 = [v10 localizedName];
    if (!v5)
    {
      uint64_t v11 = brc_bread_crumbs((uint64_t)"-[BRQueryItem containerDisplayName]", 1175);
      int v12 = brc_default_log(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        uint64_t v14 = [(BRQueryItem *)v2 url];
        int v15 = 138412802;
        double v16 = v14;
        __int16 v17 = 2112;
        uint64_t v18 = v10;
        __int16 v19 = 2112;
        v20 = v11;
        _os_log_fault_impl(&dword_19ED3F000, v12, OS_LOG_TYPE_FAULT, "[CRIT] containerDisplayName is nil %@, %@%@", (uint8_t *)&v15, 0x20u);
      }
    }
  }
  objc_sync_exit(v2);

  return (NSString *)v5;
}

- (NSURL)localRepresentationURL
{
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_localRepresentationURL;
  objc_sync_exit(v2);

  return v3;
}

- (unsigned)diffs
{
  int v2 = self;
  objc_sync_enter(v2);
  unsigned __int16 diffs = v2->_diffs;
  objc_sync_exit(v2);

  return diffs;
}

- (BRFileObjectID)fileObjectID
{
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_fileObjectID;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)parentPath
{
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_parentPath;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)logicalName
{
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_logicalName;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)physicalName
{
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_physicalName;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)appLibraryID
{
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_appLibraryID;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isTopLevel
{
  int v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 27) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (NSNumber)size
{
  int v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_size;
  objc_sync_exit(v2);

  return v3;
}

- (NSNumber)mtime
{
  int v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_mtime;
  objc_sync_exit(v2);

  return v3;
}

- (NSNumber)btime
{
  int v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_btime;
  objc_sync_exit(v2);

  return v3;
}

- (NSNumber)lastUsedTime
{
  int v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_lastUsedTime;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)lastUsedDate
{
  int v2 = [(BRQueryItem *)self lastUsedTime];
  unint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
    [v2 doubleValue];
    uint64_t v5 = objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSDate *)v5;
}

- (NSData)tagData
{
  int v2 = [(BRQueryItem *)self attributeForName:@"BRURLTagNamesKey"];
  if ([v2 count])
  {
    unint64_t v3 = objc_msgSend(v2, "br_transform:", &__block_literal_global_225_0);
    uint64_t v4 = FPGetTagsDataForTags();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSData *)v4;
}

id __22__BRQueryItem_tagData__block_invoke(uint64_t a1, void *a2)
{
  int v2 = (objc_class *)MEMORY[0x1E4F25D88];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithLabel:v3 color:0];

  return v4;
}

- (NSNumber)favoriteRank
{
  int v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_favoriteRank;
  objc_sync_exit(v2);

  return v3;
}

- (NSData)versionIdentifier
{
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(NSNumber *)v2->_mtime unsignedLongValue];
  uint64_t v11 = v3;
  uint64_t v4 = [(BRQueryItem *)v2 size];
  unint64_t v5 = [v4 unsignedLongLongValue];

  if (v5 > 0x100000)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v11 length:8];
  }
  else
  {
    BOOL v9 = [(BRQueryItem *)v2 isDownloaded];
    uint64_t v10 = v3;
    uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v9 length:9];
  }
  unint64_t v7 = (void *)v6;
  objc_sync_exit(v2);

  return (NSData *)v7;
}

- (BOOL)isNetworkOffline
{
  int v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 25) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (void)setIsNetworkOffline:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  int v4 = 0x2000000;
  if (!v3) {
    int v4 = 0;
  }
  unint64_t v5 = *(_DWORD *)&obj->_flags.var0 & 0xFDFFFFFF | ((unint64_t)BYTE4(obj->_flags.value) << 32);
  *(_DWORD *)&obj->_flags.var0 = *(_DWORD *)&obj->_flags.var0 & 0xFDFFFFFF | v4;
  BYTE4(obj->_flags.value) = BYTE4(v5);
  objc_sync_exit(obj);
}

- (id)parentFileID
{
  if (BRIsFPFSEnabled(self, a2))
  {
    BOOL v3 = brc_bread_crumbs((uint64_t)"-[BRQueryItem parentFileID]", 1339);
    int v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BRQueryItem parentFileID]();
    }

    unint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    unint64_t v5 = [(BRFileObjectID *)v6->_parentFileObjectID folderID];
    objc_sync_exit(v6);
  }

  return v5;
}

- (BRFileObjectID)parentFileObjectID
{
  int v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_parentFileObjectID;
  objc_sync_exit(v2);

  return v3;
}

- (unsigned)br_downloadStatus
{
  int v2 = self;
  objc_sync_enter(v2);
  int var0 = (int)v2->_flags.var0;
  objc_sync_exit(v2);

  return var0 & 3;
}

- (unsigned)br_uploadStatus
{
  int v2 = self;
  objc_sync_enter(v2);
  int v3 = (LOWORD(v2->_flags.value) >> 2) & 3;
  objc_sync_exit(v2);

  return v3;
}

- (unsigned)br_shareOptions
{
  int v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = (*(_DWORD *)&v2->_flags.var0 >> 11) & 7;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isInTransfer
{
  int v2 = self;
  objc_sync_enter(v2);
  if (v2->_flags.var0.kind) {
    BOOL v3 = (~*(_DWORD *)&v2->_flags.var0 & 0x30) != 0 && (~*(_DWORD *)&v2->_flags.var0 & 0xFLL) != 0;
  }
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isConflicted
{
  int v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 6) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isLive
{
  int v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (*(_DWORD *)&v2->_flags.var0 & 0x30) == 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isDead
{
  int v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (*(_DWORD *)&v2->_flags.var0 & 0x30) == 16;
  objc_sync_exit(v2);

  return v3;
}

- (void)markDead
{
  obj = self;
  objc_sync_enter(obj);
  unint64_t v2 = *(_DWORD *)&obj->_flags.var0 & 0xFFFFFFDF | ((unint64_t)BYTE4(obj->_flags.value) << 32);
  *(_DWORD *)&obj->_flags.int var0 = *(_DWORD *)&obj->_flags.var0 & 0xFFFFFFCF | 0x10;
  BYTE4(obj->_flags.value) = BYTE4(v2);
  objc_sync_exit(obj);
}

- (void)clearDiffs
{
  obj = self;
  objc_sync_enter(obj);
  obj->_unsigned __int16 diffs = 0;
  objc_sync_exit(obj);
}

- (BOOL)isPreCrash
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 7) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (void)setIsPreCrash:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  int v4 = 128;
  if (!v3) {
    int v4 = 0;
  }
  unint64_t v5 = *(_DWORD *)&obj->_flags.var0 & 0xFFFFFF7F | ((unint64_t)BYTE4(obj->_flags.value) << 32);
  *(_DWORD *)&obj->_flags.int var0 = *(_DWORD *)&obj->_flags.var0 & 0xFFFFFF7F | v4;
  BYTE4(obj->_flags.value) = BYTE4(v5);
  objc_sync_exit(obj);
}

- (BOOL)isDownloadActive
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 9) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (NSNumber)isDownloadRequested
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [NSNumber numberWithUnsignedShort:(LOWORD(v2->_flags.value) >> 10) & 1];
  objc_sync_exit(v2);

  return (NSNumber *)v3;
}

- (BOOL)isUploadActive
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 8) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isDirectory
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_flags.var0.kind == 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isPackage
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_flags.var0.kind == 2;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isSymlink
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_flags.var0.kind == 4;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isFinderBookmark
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_flags.var0.kind == 3;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isDocument
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_flags.var0.kind - 1 < 2;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isBRAlias
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 15) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)editedSinceShared
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 24) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isTrashed
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 16) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEvictable
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 28) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isHiddenExt
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 14) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (id)sharedItemRole
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = (((unint64_t)LODWORD(v2->_flags.value) >> 11) & 7) - 1;
  if (v3 > 3) {
    id v4 = 0;
  }
  else {
    id v4 = **((id **)&unk_1E59AE7F8 + v3);
  }
  objc_sync_exit(v2);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  if ((self->_logicalHandle & 0x8000000000000000) == 0) {
    sandbox_extension_release();
  }
  if ((self->_physicalHandle & 0x8000000000000000) == 0) {
    sandbox_extension_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)BRQueryItem;
  [(BRQueryItem *)&v3 dealloc];
}

- (BRQueryItem)initWithCoder:(id)a3
{
  v95[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (initWithCoder__once != -1) {
    dispatch_once(&initWithCoder__once, &__block_literal_global_230);
  }
  v92.receiver = self;
  v92.super_class = (Class)BRQueryItem;
  unint64_t v5 = [(BRQueryItem *)&v92 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_logicalHandle = -1;
    v5->_physicalHandle = -1;
    v5->_flags.unsigned int value = [v4 decodeInt64ForKey:@"flags"];
    v6->_unsigned __int16 diffs = [v4 decodeIntForKey:@"diffs"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cid"];
    appLibraryID = v6->_appLibraryID;
    v6->_appLibraryID = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    logicalName = v6->_logicalName;
    v6->_logicalName = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fault"];
    p_physicalName = (id *)&v6->_physicalName;
    physicalName = v6->_physicalName;
    v6->_physicalName = (NSString *)v11;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parent"];
    parentPath = v6->_parentPath;
    v6->_parentPath = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"foid"];
    fileObjectID = v6->_fileObjectID;
    v6->_fileObjectID = (BRFileObjectID *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pfoid"];
    parentFileObjectID = v6->_parentFileObjectID;
    v6->_parentFileObjectID = (BRFileObjectID *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sr"];
    shareRootFileObjectID = v6->_shareRootFileObjectID;
    v6->_shareRootFileObjectID = (BRFileObjectID *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    size = v6->_size;
    v6->_size = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mtime"];
    mtime = v6->_mtime;
    v6->_mtime = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"btime"];
    btime = v6->_btime;
    v6->_btime = (NSNumber *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastusedtime"];
    lastUsedTime = v6->_lastUsedTime;
    v6->_lastUsedTime = (NSNumber *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"favoriterank"];
    favoriteRank = v6->_favoriteRank;
    v6->_favoriteRank = (NSNumber *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"childitemcount"];
    childItemCount = v6->_childItemCount;
    v6->_childItemCount = (NSNumber *)v32;

    __int16 v34 = [v4 decodeObjectOfClasses:initWithCoder__allowedClasses forKey:@"attrs"];
    uint64_t v35 = [v34 mutableCopy];
    attrs = v6->_attrs;
    v6->_attrs = (NSMutableDictionary *)v35;

    uint64_t v37 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "decodeInt64ForKey:", @"zrid"));
    zoneRowID = v6->_zoneRowID;
    v6->_zoneRowID = (NSNumber *)v37;

    uint64_t v39 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "decodeInt64ForKey:", @"pzrid"));
    parentZoneRowID = v6->_parentZoneRowID;
    v6->_parentZoneRowID = (NSNumber *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collabid"];
    collaborationIdentifier = v6->_collaborationIdentifier;
    v6->_collaborationIdentifier = (NSString *)v41;

    v43 = (void *)MEMORY[0x1E4F1CAD0];
    v95[0] = objc_opt_class();
    v95[1] = objc_opt_class();
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:2];
    v45 = [v43 setWithArray:v44];
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"conflictingversions"];
    conflictingVersions = v6->_conflictingVersions;
    v6->_conflictingVersions = (NSArray *)v46;

    int v50 = BRIsFPFSEnabled(v48, v49);
    char v51 = v50;
    if (v50)
    {
      uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cver"];
      contentVersion = v6->_contentVersion;
      v6->_contentVersion = (NSData *)v52;

      v54 = (void *)MEMORY[0x1E4F1CAD0];
      v94[0] = objc_opt_class();
      v94[1] = objc_opt_class();
      v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
      v56 = [v54 setWithArray:v55];
      uint64_t v57 = [v4 decodeObjectOfClasses:v56 forKey:@"eqCver"];
      equivalentContentVersions = v6->_equivalentContentVersions;
      v6->_equivalentContentVersions = (NSArray *)v57;

      uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sver"];
      structureVersion = v6->_structureVersion;
      v6->_structureVersion = (NSData *)v59;

      uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastEditorDeviceName"];
      lastEditorDeviceName = v6->_lastEditorDeviceName;
      v6->_lastEditorDeviceName = (NSString *)v61;

      v63 = (void *)MEMORY[0x1E4F1CAD0];
      v93[0] = objc_opt_class();
      v93[1] = objc_opt_class();
      v93[2] = objc_opt_class();
      v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:3];
      v65 = [v63 setWithArray:v64];
      uint64_t v66 = [v4 decodeObjectOfClasses:v65 forKey:@"xattrs"];
      xattrs = v6->_xattrs;
      v6->_xattrs = (NSDictionary *)v66;

      uint64_t v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symlinkTargetPath"];
      symlinkTargetPath = v6->_symlinkTargetPath;
      v6->_symlinkTargetPath = (NSString *)v68;

      v6->_contentPolicy = (int)[v4 decodeIntForKey:@"contentPolicy"];
      if (!v6->_parentPath)
      {
LABEL_29:
        if ([(BRQueryItem *)v6 isBRAlias])
        {
          v86 = [(NSMutableDictionary *)v6->_attrs objectForKey:@"alias-path"];
          if (v86)
          {
            uint64_t v87 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v86];
            localRepresentationURL = v6->_localRepresentationURL;
            v6->_localRepresentationURL = (NSURL *)v87;
          }
          else
          {
            if ((v51 & 1) != 0 || [(BRQueryItem *)v6 isDead]) {
              goto LABEL_34;
            }
            localRepresentationURL = brc_bread_crumbs((uint64_t)"-[BRQueryItem initWithCoder:]", 1664);
            v91 = brc_default_log(0);
            if (os_log_type_enabled(v91, OS_LOG_TYPE_FAULT)) {
              -[BRQueryItem initWithCoder:]();
            }
          }
        }
        else
        {
          v89 = v6->_url;
          v86 = v6->_localRepresentationURL;
          v6->_localRepresentationURL = v89;
        }
LABEL_34:

        goto LABEL_35;
      }
    }
    else if (!v6->_parentPath)
    {
      if ([(BRQueryItem *)v6 isDead]) {
        goto LABEL_29;
      }
      v70 = brc_bread_crumbs((uint64_t)"-[BRQueryItem initWithCoder:]", 1656);
      v77 = brc_default_log(0);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
        -[BRQueryItem initWithCoder:]();
      }
      goto LABEL_27;
    }
    v70 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v6->_parentPath isDirectory:1];
    int kind = v6->_flags.var0.kind;
    v72 = v6->_physicalName;
    if (v72 && ![(NSString *)v72 br_isSideFaultName])
    {
      uint64_t v75 = [v70 URLByAppendingPathComponent:v6->_physicalName isDirectory:kind == 0];
      url = v6->_url;
      v6->_url = (NSURL *)v75;

      MEMORY[0x19F3C3DF0](v6->_url, *MEMORY[0x1E4F1D738], v6->_logicalName);
LABEL_25:
      if (![(BRFileObjectID *)v6->_fileObjectID isDocumentID])
      {
LABEL_28:

        goto LABEL_29;
      }
      v84 = v6->_url;
      uint64_t v85 = *MEMORY[0x1E4F1D5B0];
      v77 = [(BRFileObjectID *)v6->_fileObjectID documentID];
      MEMORY[0x19F3C3DF0](v84, v85, v77);
LABEL_27:

      goto LABEL_28;
    }
    if (v6->_logicalName)
    {
      uint64_t v73 = objc_msgSend(v70, "URLByAppendingPathComponent:isDirectory:");
      v74 = v6->_url;
      v6->_url = (NSURL *)v73;
    }
    else
    {
      v78 = brc_bread_crumbs((uint64_t)"-[BRQueryItem initWithCoder:]", 1634);
      v79 = brc_default_log(0);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT)) {
        -[BRQueryItem initWithCoder:](&v6->_physicalName);
      }

      if (![*p_physicalName length]) {
        goto LABEL_21;
      }
      v80 = [(NSString *)v6->_physicalName substringFromIndex:1];
      v74 = objc_msgSend(v80, "brc_stringByDeletingPathExtension");

      uint64_t v81 = [v70 URLByAppendingPathComponent:v74 isDirectory:kind == 0];
      v82 = v6->_url;
      v6->_url = (NSURL *)v81;
    }
LABEL_21:
    if (kind)
    {
      if (*p_physicalName)
      {
        v83 = [v70 URLByAppendingPathComponent:*p_physicalName isDirectory:0];
        _CFURLPromiseSetPhysicalURL();
      }
      else
      {
        _CFURLPromiseSetPhysicalURL();
      }
    }
    goto LABEL_25;
  }
LABEL_35:

  return v6;
}

void __29__BRQueryItem_initWithCoder___block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  objc_super v3 = (void *)initWithCoder__allowedClasses;
  initWithCoder__allowedClasses = v2;
}

- (void)attachLogicalExtension:(id)a3 physicalExtension:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  p_url = &v8->_url;
  url = v8->_url;
  if (!v6 || !url) {
    goto LABEL_21;
  }
  uint64_t v11 = url;
  id v12 = v6;
  int active_platform = dyld_get_active_platform();
  if ((active_platform & 0xFFFFFFFB) != 2 && active_platform != 1 && active_platform != 11)
  {
    syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
    goto LABEL_20;
  }
  if (dyld_program_sdk_at_least())
  {
LABEL_20:

    MEMORY[0x19F3C3D20](*p_url, v12);
    goto LABEL_21;
  }
  if ([v12 length])
  {
    id v14 = v12;
    [v14 bytes];
    uint64_t v15 = sandbox_extension_consume();
    if (v15 < 0)
    {
      int v18 = *__error();
      __int16 v19 = brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1690);
      uint64_t v20 = brc_default_log(0);
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        id v39 = v14;
        __int16 v40 = 1024;
        int v41 = v18;
        __int16 v42 = 2112;
        v43 = v19;
        _os_log_error_impl(&dword_19ED3F000, v20, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", buf, 0x1Cu);
      }

      *__error() = v18;
    }
    else
    {
      if (v8->_logicalHandle < 0)
      {
        uint64_t v16 = brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1686);
        __int16 v17 = brc_notifications_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[BRQueryItem attachLogicalExtension:physicalExtension:]();
        }
      }
      else
      {
        sandbox_extension_release();
        uint64_t v16 = brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1684);
        __int16 v17 = brc_notifications_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[BRQueryItem attachLogicalExtension:physicalExtension:]();
        }
      }

      v8->_logicalHandle = v15;
    }
    goto LABEL_20;
  }

LABEL_21:
  if (v7 && *p_url)
  {
    uint64_t v21 = _CFURLPromiseCopyPhysicalURL();
    uint64_t v22 = (NSURL *)v21;
    if (v21)
    {
      uint64_t v23 = *p_url;
      if ((NSURL *)v21 == *p_url)
      {
        uint64_t v36 = brc_bread_crumbs((uint64_t)"-[BRQueryItem attachLogicalExtension:physicalExtension:]", 1711);
        uint64_t v37 = brc_default_log(0);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
          -[BRQueryItem attachLogicalExtension:physicalExtension:].cold.4();
        }

        uint64_t v23 = *p_url;
      }
      if (v22 == v23) {
        goto LABEL_48;
      }
      uint64_t v24 = v22;
      id v25 = v7;
      int v26 = dyld_get_active_platform();
      if ((v26 & 0xFFFFFFFB) == 2 || v26 == 1 || v26 == 11)
      {
        if ((dyld_program_sdk_at_least() & 1) == 0)
        {
          if (![v25 length])
          {

LABEL_48:
            CFRelease(v22);
            goto LABEL_49;
          }
          id v29 = v25;
          [v29 bytes];
          uint64_t v30 = sandbox_extension_consume();
          if (v30 < 0)
          {
            int v33 = *__error();
            __int16 v34 = brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1690);
            uint64_t v35 = brc_default_log(0);
            if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412802;
              id v39 = v29;
              __int16 v40 = 1024;
              int v41 = v33;
              __int16 v42 = 2112;
              v43 = v34;
              _os_log_error_impl(&dword_19ED3F000, v35, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", buf, 0x1Cu);
            }

            *__error() = v33;
          }
          else
          {
            if (v8->_physicalHandle < 0)
            {
              v31 = brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1686);
              uint64_t v32 = brc_notifications_log();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
                -[BRQueryItem attachLogicalExtension:physicalExtension:]();
              }
            }
            else
            {
              sandbox_extension_release();
              v31 = brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1684);
              uint64_t v32 = brc_notifications_log();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
                -[BRQueryItem attachLogicalExtension:physicalExtension:]();
              }
            }

            v8->_physicalHandle = v30;
          }
        }
      }
      else
      {
        syslog(5, "Unknown platform linking against CloudDocs framework %d", v26);
      }

      MEMORY[0x19F3C3D20](v24, v25);
      goto LABEL_48;
    }
    v27 = brc_bread_crumbs((uint64_t)"-[BRQueryItem attachLogicalExtension:physicalExtension:]", 1719);
    uint64_t v28 = brc_default_log(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      -[BRQueryItem attachLogicalExtension:physicalExtension:](&v8->_url);
    }
  }
LABEL_49:
  objc_sync_exit(v8);
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [v7 encodeInt64:v4->_flags.value forKey:@"flags"];
  [v7 encodeInt:v4->_diffs forKey:@"diffs"];
  [v7 encodeObject:v4->_appLibraryID forKey:@"cid"];
  [v7 encodeObject:v4->_logicalName forKey:@"name"];
  [v7 encodeObject:v4->_physicalName forKey:@"fault"];
  [v7 encodeObject:v4->_parentPath forKey:@"parent"];
  [v7 encodeObject:v4->_fileObjectID forKey:@"foid"];
  [v7 encodeObject:v4->_parentFileObjectID forKey:@"pfoid"];
  [v7 encodeObject:v4->_shareRootFileObjectID forKey:@"sr"];
  [v7 encodeObject:v4->_size forKey:@"size"];
  [v7 encodeObject:v4->_mtime forKey:@"mtime"];
  [v7 encodeObject:v4->_btime forKey:@"btime"];
  [v7 encodeObject:v4->_lastUsedTime forKey:@"lastusedtime"];
  [v7 encodeObject:v4->_favoriteRank forKey:@"favoriterank"];
  [v7 encodeObject:v4->_childItemCount forKey:@"childitemcount"];
  [v7 encodeObject:v4->_attrs forKey:@"attrs"];
  objc_msgSend(v7, "encodeInt64:forKey:", -[NSNumber longLongValue](v4->_zoneRowID, "longLongValue"), @"zrid");
  objc_msgSend(v7, "encodeInt64:forKey:", -[NSNumber longLongValue](v4->_parentZoneRowID, "longLongValue"), @"pzrid");
  uint64_t v5 = [v7 encodeObject:v4->_collaborationIdentifier forKey:@"collabid"];
  if (BRIsFPFSEnabled(v5, v6))
  {
    [v7 encodeObject:v4->_contentVersion forKey:@"cver"];
    [v7 encodeObject:v4->_equivalentContentVersions forKey:@"eqCver"];
    [v7 encodeObject:v4->_structureVersion forKey:@"sver"];
    [v7 encodeObject:v4->_lastEditorDeviceName forKey:@"lastEditorDeviceName"];
    [v7 encodeObject:v4->_xattrs forKey:@"xattrs"];
    [v7 encodeObject:v4->_conflictingVersions forKey:@"conflictingversions"];
    [v7 encodeObject:v4->_symlinkTargetPath forKey:@"symlinkTargetPath"];
    [v7 encodeInt:LODWORD(v4->_contentPolicy) forKey:@"contentPolicy"];
  }
  objc_sync_exit(v4);
}

- (BRQueryItem)initWithQueryItem:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRQueryItem;
  uint64_t v5 = [(BRQueryItem *)&v12 init];
  if (v5)
  {
    id v6 = v4;
    objc_sync_enter(v6);
    v5->_logicalHandle = -1;
    v5->_physicalHandle = -1;
    v5->_flags.unsigned int value = *((void *)v6 + 30);
    v5->_unsigned __int16 diffs = *((_WORD *)v6 + 132);
    objc_storeStrong((id *)&v5->_appLibraryID, *((id *)v6 + 1));
    objc_storeStrong((id *)&v5->_logicalName, *((id *)v6 + 3));
    objc_storeStrong((id *)&v5->_physicalName, *((id *)v6 + 4));
    objc_storeStrong((id *)&v5->_parentPath, *((id *)v6 + 2));
    objc_storeStrong((id *)&v5->_fileObjectID, *((id *)v6 + 6));
    objc_storeStrong((id *)&v5->_parentFileObjectID, *((id *)v6 + 7));
    objc_storeStrong((id *)&v5->_shareRootFileObjectID, *((id *)v6 + 8));
    objc_storeStrong((id *)&v5->_size, *((id *)v6 + 9));
    objc_storeStrong((id *)&v5->_mtime, *((id *)v6 + 10));
    objc_storeStrong((id *)&v5->_btime, *((id *)v6 + 11));
    objc_storeStrong((id *)&v5->_lastUsedTime, *((id *)v6 + 12));
    objc_storeStrong((id *)&v5->_favoriteRank, *((id *)v6 + 13));
    objc_storeStrong((id *)&v5->_childItemCount, *((id *)v6 + 14));
    uint64_t v7 = [*((id *)v6 + 27) mutableCopy];
    attrs = v5->_attrs;
    v5->_attrs = (NSMutableDictionary *)v7;

    objc_storeStrong((id *)&v5->_url, *((id *)v6 + 15));
    objc_storeStrong((id *)&v5->_localRepresentationURL, *((id *)v6 + 16));
    objc_storeStrong((id *)&v5->_zoneRowID, *((id *)v6 + 18));
    objc_storeStrong((id *)&v5->_parentZoneRowID, *((id *)v6 + 17));
    objc_storeStrong((id *)&v5->_collaborationIdentifier, *((id *)v6 + 19));
    if (BRIsFPFSEnabled(v9, v10))
    {
      objc_storeStrong((id *)&v5->_contentVersion, *((id *)v6 + 21));
      objc_storeStrong((id *)&v5->_equivalentContentVersions, *((id *)v6 + 22));
      objc_storeStrong((id *)&v5->_structureVersion, *((id *)v6 + 23));
      objc_storeStrong((id *)&v5->_lastEditorDeviceName, *((id *)v6 + 26));
      objc_storeStrong((id *)&v5->_xattrs, *((id *)v6 + 28));
      objc_storeStrong((id *)&v5->_conflictingVersions, *((id *)v6 + 24));
      objc_storeStrong((id *)&v5->_symlinkTargetPath, *((id *)v6 + 20));
      v5->_contentPolicy = *((void *)v6 + 25);
    }
    objc_sync_exit(v6);
  }
  return v5;
}

- (BRQueryItem)initWithFPItem:(id)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v97.receiver = self;
    v97.super_class = (Class)BRQueryItem;
    uint64_t v5 = [(BRQueryItem *)&v97 init];
    if (!v5)
    {
LABEL_71:
      self = v5;
      uint64_t v16 = self;
      goto LABEL_72;
    }
    uint64_t v6 = [v4 fileURL];
    uint64_t v7 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = v6;

    objc_storeStrong((id *)v5 + 16, *((id *)v5 + 15));
    uint64_t v8 = [v4 filename];
    uint64_t v9 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v8;

    uint64_t v10 = [v4 userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"pkg_size"];
    objc_super v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [v4 documentSize];
    }
    __int16 v17 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v13;

    if (objc_msgSend(*((id *)v5 + 15), "br_isInTrash")) {
      [v10 objectForKey:@"palid"];
    }
    else {
    uint64_t v18 = objc_msgSend(*((id *)v5 + 15), "br_containerID");
    }
    __int16 v19 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v18;

    uint64_t v20 = [v4 providerItemIdentifier];
    uint64_t v21 = +[BRFileObjectID fileObjectIDWithString:v20];
    uint64_t v22 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v21;

    uint64_t v23 = [v4 itemID];
    uint64_t v24 = (void *)*((void *)v5 + 34);
    *((void *)v5 + 34) = v23;

    id v25 = NSNumber;
    int v26 = [v4 creationDate];
    [v26 timeIntervalSince1970];
    uint64_t v27 = objc_msgSend(v25, "numberWithDouble:");
    uint64_t v28 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v27;

    id v29 = NSNumber;
    uint64_t v30 = [v4 contentModificationDate];
    [v30 timeIntervalSince1970];
    uint64_t v31 = objc_msgSend(v29, "numberWithDouble:");
    uint64_t v32 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v31;

    int v33 = [v4 contentType];
    if ([v4 isFolder])
    {
      char v34 = 0;
    }
    else if ([v4 isPackage])
    {
      char v34 = 2;
    }
    else if (objc_msgSend(v33, "br_isSymbolicLinkType"))
    {
      char v34 = 4;
    }
    else if (objc_msgSend(v33, "br_isAliasFileType"))
    {
      char v34 = 3;
    }
    else
    {
      if ((objc_msgSend(v33, "br_isFileType") & 1) == 0)
      {
        uint64_t v35 = brc_bread_crumbs((uint64_t)"-[BRQueryItem initWithFPItem:]", 1849);
        uint64_t v36 = brc_default_log(0);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          v99 = v33;
          __int16 v100 = 2112;
          id v101 = v4;
          __int16 v102 = 2112;
          v103 = v35;
          _os_log_fault_impl(&dword_19ED3F000, v36, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't initialize _flags.kind from the content type %@ for %@%@", buf, 0x20u);
        }
      }
      char v34 = 1;
    }
    *((unsigned char *)v5 + 245) = v34;
    if ([v4 isMostRecentVersionDownloaded])
    {
      v5[60] |= 3u;
    }
    else
    {
      if ([v4 isDownloaded]) {
        unsigned int v37 = v5[60] & 0xFFFFFFFC | 2;
      }
      else {
        unsigned int v37 = v5[60] & 0xFFFFFFFC | 1;
      }
      *((unsigned char *)v5 + 244) = *((unsigned char *)v5 + 244);
      v5[60] = v37;
    }
    v38 = [v4 downloadingError];

    if (v38)
    {
      id v39 = [v4 downloadingError];
      [v5 setAttribute:v39 forKey:@"dlErr"];
    }
    __int16 v40 = [v4 uploadingError];

    if (v40)
    {
      int v41 = [v4 uploadingError];
      [v5 setAttribute:v41 forKey:@"ulErr"];
    }
    __int16 v42 = [v4 downloadingProgress];
    v43 = v42;
    if (v42)
    {
      uint64_t v44 = NSNumber;
      [v42 fractionCompleted];
      uint64_t v46 = [v44 numberWithDouble:v45 * 100.0];
      [v5 setAttribute:v46 forKey:@"dl%"];
    }
    v47 = [v4 uploadingProgress];
    uint64_t v48 = v47;
    if (v47)
    {
      uint64_t v49 = NSNumber;
      [v47 fractionCompleted];
      char v51 = [v49 numberWithDouble:v50 * 100.0];
      [v5 setAttribute:v51 forKey:@"ul%"];
    }
    if ([v4 isUploaded])
    {
      v5[60] |= 0xCu;
    }
    else
    {
      int v52 = [v4 isUploading];
      uint64_t v53 = v5[60];
      unint64_t v54 = v53 & 0xFFFFFFFFFFFFFFF3 | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
      if (v52)
      {
        *((unsigned char *)v5 + 244) = BYTE4(v54);
        v5[60] = v53 & 0xFFFFFFF3 | 4;
      }
      else
      {
        v5[60] = v53 & 0xFFFFFFF3;
        *((unsigned char *)v5 + 244) = BYTE4(v54);
      }
    }
    v55 = [v4 tags];
    uint64_t v56 = [v55 count];

    if (v56)
    {
      uint64_t v57 = [v4 tags];
      v58 = objc_msgSend(v57, "br_transform:", &__block_literal_global_321);
      [v5 setAttribute:v58 forKey:@"tags"];
    }
    if (([v4 conformsToProtocol:&unk_1EF139040] & 1) == 0)
    {
      v95 = brc_bread_crumbs((uint64_t)"-[BRQueryItem initWithFPItem:]", 1899);
      v96 = brc_default_log(0);
      if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT)) {
        -[BRQueryItem initWithFPItem:]();
      }
    }
    id v59 = v4;
    unint64_t v60 = v5[60] & 0xFFFF7FFF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
    v5[60] &= ~0x8000u;
    *((unsigned char *)v5 + 244) = BYTE4(v60);
    uint64_t v61 = [v59 isDownloadRequested];
    if [v61 unsignedShortValue] || (objc_msgSend(v59, "isDownloading"))
    {
      int v62 = 1024;
    }
    else
    {
      int v94 = [v59 isDownloaded];
      int v62 = 1024;
      if (!v94) {
        int v62 = 0;
      }
    }
    unint64_t v63 = v5[60] & 0xFFFFFBFF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
    v5[60] = v5[60] & 0xFFFFFBFF | v62;
    *((unsigned char *)v5 + 244) = BYTE4(v63);

    if ([v59 isDownloading])
    {
      v64 = [v59 downloadingProgress];
      unint64_t v65 = v5[60] & 0xFFFFFDFF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
      v5[60] = v5[60] & 0xFFFFFDFF | ((v64 != 0) << 9);
      *((unsigned char *)v5 + 244) = BYTE4(v65);
    }
    else
    {
      unint64_t v66 = v5[60] & 0xFFFFFDFF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
      v5[60] &= ~0x200u;
      *((unsigned char *)v5 + 244) = BYTE4(v66);
    }
    int v67 = [v59 isUploading];
    uint64_t v68 = v5 + 60;
    int v69 = 256;
    if (!v67) {
      int v69 = 0;
    }
    unint64_t v70 = v5[60] & 0xFFFFFEFF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
    *uint64_t v68 = v5[60] & 0xFFFFFEFF | v69;
    *((unsigned char *)v5 + 244) = BYTE4(v70);
    v71 = [v59 conflictingVersions];
    int v72 = [v71 count] != 0;
    unint64_t v73 = v5[60] & 0xFFFFFFBF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
    *uint64_t v68 = *v68 & 0xFFFFFFBF | (v72 << 6);
    *((unsigned char *)v5 + 244) = BYTE4(v73);

    uint64_t v74 = *v68;
    unint64_t v75 = v74 & 0xFFFFFFFFFFFFC7FFLL | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
    *uint64_t v68 = v74 & 0xFFFFC7FF;
    *((unsigned char *)v5 + 244) = BYTE4(v75);
    v76 = [v59 sharingPermissions];
    if ([v59 isShared])
    {
      int v77 = [v59 isSharedByCurrentUser];
      if ([v76 isEqual:*MEMORY[0x1E4F1C7D8]])
      {
        BOOL v78 = v77 == 0;
        int v79 = 6144;
        int v80 = 2048;
LABEL_60:
        if (!v78) {
          int v79 = v80;
        }
        unint64_t v81 = v5[60] & 0xFFFFC7FF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
        v5[60] = v5[60] & 0xFFFFC7FF | v79;
        *((unsigned char *)v5 + 244) = BYTE4(v81);
        goto LABEL_63;
      }
      if ([v76 isEqual:*MEMORY[0x1E4F1C7E0]])
      {
        BOOL v78 = v77 == 0;
        int v79 = 0x2000;
        int v80 = 4096;
        goto LABEL_60;
      }
    }
LABEL_63:
    v82 = [v59 ownerNameComponents];
    [v5 setAttribute:v82 forKey:@"owner-components"];

    v83 = [v59 mostRecentEditorNameComponents];
    [v5 setAttribute:v83 forKey:@"last-editor-components"];

    if ([v59 isShared])
    {
      int v84 = [v59 isTopLevelSharedItem];
      int v85 = 0x200000;
      if (v84) {
        int v85 = 0;
      }
    }
    else
    {
      int v85 = 0;
    }
    unint64_t v86 = v5[60] & 0xFFDFFFFF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
    v5[60] = v5[60] & 0xFFDFFFFF | v85;
    *((unsigned char *)v5 + 244) = BYTE4(v86);
    uint64_t v87 = [v10 objectForKeyedSubscript:@"ess"];
    int v88 = [v87 BOOLValue];
    int v89 = 0x1000000;
    if (!v88) {
      int v89 = 0;
    }
    unint64_t v90 = v5[60] & 0xFEFFFFFF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
    v5[60] = v5[60] & 0xFEFFFFFF | v89;
    *((unsigned char *)v5 + 244) = BYTE4(v90);

    uint64_t v91 = [v59 symlinkTargetPath];
    objc_super v92 = (void *)*((void *)v5 + 20);
    *((void *)v5 + 20) = v91;

    goto LABEL_71;
  }
  id v14 = brc_bread_crumbs((uint64_t)"-[BRQueryItem initWithFPItem:]", 1816);
  uint64_t v15 = brc_default_log(1);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v99 = v14;
    _os_log_impl(&dword_19ED3F000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't build query item with nil FPItem%@", buf, 0xCu);
  }

  uint64_t v16 = 0;
LABEL_72:

  return v16;
}

uint64_t __30__BRQueryItem_initWithFPItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 label];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 initWithQueryItem:self];
}

- (id)subclassDescription
{
  return 0;
}

- (NSString)description
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = objc_opt_class();
  fileObjectID = v4->_fileObjectID;
  uint64_t v7 = BRQueryItemFieldsPrettyPrint(v4->_diffs);
  uint64_t v8 = BRCPrettyPrintEnum(*(_DWORD *)&v4->_flags.var0 & 3, br_download_status_entries);
  [v3 appendFormat:@"<%@ %@ (%@) dn:%s up:%s", v5, fileObjectID, v7, v8, BRCPrettyPrintEnum(((unint64_t)LODWORD(v4->_flags.value) >> 2) & 3, br_upload_status_entries)];

  if (v4->_url)
  {
    [v3 appendString:@" url:"];
    uint64_t v9 = [(NSURL *)v4->_url path];
    uint64_t v10 = objc_msgSend(v9, "fp_obfuscatedPath");
    [v3 appendString:v10];
  }
  LOBYTE(var0) = v4->_flags.var0;
  if ((*(_DWORD *)&v4->_flags.var0 & 0x100000) != 0)
  {
    [v3 appendString:@" roDB"];
    int var0 = (int)v4->_flags.var0;
  }
  if ((var0 & 0x40) != 0) {
    [v3 appendString:@" conflicted"];
  }
  if ([(BRQueryItem *)v4 isHidden]) {
    [v3 appendString:@" hidden"];
  }
  if ([(BRQueryItem *)v4 isHiddenExt]) {
    [v3 appendString:@" h-ext"];
  }
  unint64_t v12 = (((unint64_t)LODWORD(v4->_flags.value) >> 4) & 3) - 1;
  if (v12 <= 2) {
    [v3 appendString:off_1E59AE818[v12]];
  }
  LOWORD(v13) = v4->_flags.var0;
  if ((*(_DWORD *)&v4->_flags.var0 & 0x8000) != 0)
  {
    [v3 appendString:@" br-alias"];
    int v13 = (int)v4->_flags.var0;
  }
  if ((v13 & 0x200) != 0)
  {
    [v3 appendString:@" downloading"];
    int v13 = (int)v4->_flags.var0;
  }
  if ((v13 & 0x100) != 0) {
    [v3 appendString:@" uploading"];
  }
  id v14 = [(BRQueryItem *)v4 subclassDescription];
  if (v14) {
    [v3 appendString:v14];
  }
  int v15 = (LOWORD(v4->_flags.value) >> 11) & 7;
  if (v15)
  {
    switch(v15)
    {
      case 1:
        uint64_t v16 = @" shared-by-me-r";
        goto LABEL_26;
      case 2:
        uint64_t v16 = @" shared-by-me-rw";
LABEL_26:
        [v3 appendString:v16];
        goto LABEL_31;
      case 4:
        __int16 v17 = "rw";
        break;
      default:
        __int16 v17 = "ro";
        break;
    }
    objc_msgSend(v3, "appendFormat:", @" share:%s", v17);
  }
LABEL_31:
  int v18 = (int)v4->_flags.var0;
  if ((v18 & 0x3800) != 0)
  {
    if ((*(void *)&v18 & 0x200000) != 0) {
      __int16 v19 = @" sh-chd";
    }
    else {
      __int16 v19 = @" sh-top";
    }
    [v3 appendString:v19];
  }
  if ([(BRQueryItem *)v4 editedSinceShared]) {
    [v3 appendFormat:@" ess"];
  }
  uint64_t v20 = [(BRQueryItem *)v4 collaborationIdentifier];

  if (v20)
  {
    uint64_t v21 = [(BRQueryItem *)v4 collaborationIdentifier];
    [v3 appendFormat:@" collabid: %@", v21];
  }
  uint64_t v22 = [(BRQueryItem *)v4 attributeForKey:@"created-by-user"];
  int v23 = [v22 BOOLValue];

  if (v23) {
    [v3 appendFormat:@" cbm"];
  }
  if (v4->_appLibraryID) {
    [v3 appendFormat:@" ct:%@", v4->_appLibraryID];
  }
  if (v4->_parentPath) {
    [v3 appendFormat:@" p:'%@'", v4->_parentPath];
  }
  if (v4->_parentFileObjectID) {
    [v3 appendFormat:@" pid:%@", v4->_parentFileObjectID];
  }
  if (v4->_shareRootFileObjectID) {
    [v3 appendFormat:@" shroot:%@", v4->_shareRootFileObjectID];
  }
  logicalName = v4->_logicalName;
  if (logicalName)
  {
    id v25 = [(NSString *)logicalName fp_obfuscatedFilename];
    [v3 appendFormat:@" n:'%@'", v25];
  }
  physicalName = v4->_physicalName;
  if (physicalName)
  {
    uint64_t v27 = [(NSString *)physicalName fp_obfuscatedFilename];
    [v3 appendFormat:@" f:'%@'", v27];
  }
  unint64_t kind = (char)v4->_flags.var0.kind;
  if (kind > 4) {
    id v29 = &stru_1EF11DA20;
  }
  else {
    id v29 = off_1E59AE830[kind];
  }
  [v3 appendFormat:@" %@:%llu", v29, -[BRFileObjectID rawID](v4->_fileObjectID, "rawID")];
  size = v4->_size;
  if (size)
  {
    uint64_t v31 = BRLocalizedFileSizeDescriptionWithExactCount([(NSNumber *)size longLongValue]);
    [v3 appendFormat:@" sz:%@", v31];
  }
  if (!v4->_flags.var0.kind) {
    [v3 appendFormat:@" ch:%@", v4->_childItemCount];
  }
  if (v4->_mtime) {
    [v3 appendFormat:@" mt:%@", v4->_mtime];
  }
  if (v4->_btime) {
    [v3 appendFormat:@" bt:%@", v4->_btime];
  }
  if (v4->_lastUsedTime) {
    [v3 appendFormat:@" last-open:%@", v4->_lastUsedTime];
  }
  if (v4->_favoriteRank) {
    [v3 appendFormat:@" favorite-rank:%@", v4->_favoriteRank];
  }
  if (v4->_attrs)
  {
    [v3 appendString:@" a:{"];
    attrs = v4->_attrs;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __26__BRQueryItem_description__block_invoke;
    v40[3] = &unk_1E59AE698;
    id v33 = v3;
    id v41 = v33;
    [(NSMutableDictionary *)attrs enumerateKeysAndObjectsUsingBlock:v40];
    objc_msgSend(v33, "replaceCharactersInRange:withString:", objc_msgSend(v33, "length") - 1, 1, @"}");
  }
  xattrs = v4->_xattrs;
  if (xattrs && [(NSDictionary *)xattrs count]) {
    [v3 appendFormat:@" xattrs"];
  }
  conflictingVersions = v4->_conflictingVersions;
  if (conflictingVersions && [(NSArray *)conflictingVersions count]) {
    [v3 appendFormat:@" conflictingversions"];
  }
  symlinkTargetPath = v4->_symlinkTargetPath;
  if (symlinkTargetPath)
  {
    unsigned int v37 = [(NSString *)symlinkTargetPath fp_obfuscatedPath];
    [v3 appendFormat:@" symlink-target:%@", v37];
  }
  objc_msgSend(v3, "appendFormat:", @" content-policy:%ld", v4->_contentPolicy);
  [v3 appendString:@">"];

  objc_sync_exit(v4);
  v38 = v3;

  return v38;
}

uint64_t __26__BRQueryItem_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@:%@ ", a2, a3];
}

- (NSString)path
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = [(NSURL *)v2->_url path];
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (BOOL)isEqualToQueryItem:(id)a3
{
  id v4 = (BRQueryItem *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    id v14 = __34__BRQueryItem_isEqualToQueryItem___block_invoke;
    int v15 = &unk_1E59AE6C0;
    uint64_t v16 = self;
    __int16 v17 = v4;
    uint64_t v6 = self;
    uint64_t v7 = v17;
    uint64_t v8 = v13;
    if (v6 >= v7)
    {
      uint64_t v9 = v7;
      objc_sync_enter(v9);
      uint64_t v10 = v6;
    }
    else
    {
      uint64_t v9 = v6;
      objc_sync_enter(v9);
      uint64_t v10 = v7;
    }
    objc_sync_enter(v10);
    char v11 = v14((uint64_t)v8);
    objc_sync_exit(v10);

    objc_sync_exit(v9);
  }

  return v11;
}

uint64_t __34__BRQueryItem_isEqualToQueryItem___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void *)(v1 + 240) != v2[30]) {
    return 0;
  }
  id v4 = *(void **)(v1 + 8);
  uint64_t v5 = (void *)v2[1];
  if (v4 != v5)
  {
    if (!v5) {
      return 0;
    }
    uint64_t result = objc_msgSend(v4, "isEqualToString:");
    if (!result) {
      return result;
    }
    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
  }
  uint64_t v7 = *(void **)(v1 + 16);
  uint64_t v8 = (void *)v2[2];
  if (v7 != v8)
  {
    if (!v8) {
      return 0;
    }
    uint64_t result = objc_msgSend(v7, "isEqualToString:");
    if (!result) {
      return result;
    }
    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
  }
  uint64_t v9 = *(void **)(v1 + 24);
  uint64_t v10 = (void *)v2[3];
  if (v9 != v10)
  {
    if (!v10) {
      return 0;
    }
    uint64_t result = objc_msgSend(v9, "isEqualToString:");
    if (!result) {
      return result;
    }
    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
  }
  char v11 = *(void **)(v1 + 32);
  unint64_t v12 = (void *)v2[4];
  if (v11 != v12)
  {
    if (!v12) {
      return 0;
    }
    uint64_t result = objc_msgSend(v11, "isEqualToString:");
    if (!result) {
      return result;
    }
    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
  }
  int v13 = *(void **)(v1 + 48);
  id v14 = (void *)v2[6];
  if (v13 != v14)
  {
    if (!v14) {
      return 0;
    }
    uint64_t result = objc_msgSend(v13, "isEqualToFileObjectID:");
    if (!result) {
      return result;
    }
    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
  }
  int v15 = *(void **)(v1 + 56);
  uint64_t v16 = (void *)v2[7];
  if (v15 != v16)
  {
    if (!v16) {
      return 0;
    }
    uint64_t result = objc_msgSend(v15, "isEqualToFileObjectID:");
    if (!result) {
      return result;
    }
    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
  }
  __int16 v17 = *(void **)(v1 + 64);
  int v18 = (void *)v2[8];
  if (v17 != v18)
  {
    if (!v18) {
      return 0;
    }
    uint64_t result = objc_msgSend(v17, "isEqualToFileObjectID:");
    if (!result) {
      return result;
    }
    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
  }
  __int16 v19 = *(void **)(v1 + 72);
  uint64_t v20 = (void *)v2[9];
  if (v19 != v20)
  {
    if (!v20) {
      return 0;
    }
    uint64_t result = objc_msgSend(v19, "isEqualToNumber:");
    if (!result) {
      return result;
    }
    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
  }
  uint64_t v21 = *(void **)(v1 + 80);
  uint64_t v22 = (void *)v2[10];
  if (v21 != v22)
  {
    if (!v22) {
      return 0;
    }
    uint64_t result = objc_msgSend(v21, "isEqualToNumber:");
    if (!result) {
      return result;
    }
    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
  }
  int v23 = *(void **)(v1 + 88);
  uint64_t v24 = (void *)v2[11];
  if (v23 != v24)
  {
    if (!v24) {
      return 0;
    }
    uint64_t result = objc_msgSend(v23, "isEqualToNumber:");
    if (!result) {
      return result;
    }
    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
  }
  id v25 = *(void **)(v1 + 96);
  int v26 = (void *)v2[12];
  if (v25 != v26)
  {
    if (!v26) {
      return 0;
    }
    uint64_t result = objc_msgSend(v25, "isEqualToNumber:");
    if (!result) {
      return result;
    }
    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
  }
  uint64_t v27 = *(void **)(v1 + 104);
  uint64_t v28 = (void *)v2[13];
  if (v27 != v28)
  {
    if (!v28) {
      return 0;
    }
    uint64_t result = objc_msgSend(v27, "isEqualToNumber:");
    if (!result) {
      return result;
    }
    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
  }
  id v29 = *(void **)(v1 + 216);
  uint64_t v30 = (void *)v2[27];
  if (v29 != v30)
  {
    if (!v30) {
      return 0;
    }
    uint64_t result = objc_msgSend(v29, "isEqualToDictionary:");
    if (!result) {
      return result;
    }
    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
  }
  uint64_t v31 = *(void **)(v1 + 192);
  uint64_t v32 = (void *)v2[24];
  if (v31 == v32) {
    goto LABEL_58;
  }
  if (!v32) {
    return 0;
  }
  uint64_t result = objc_msgSend(v31, "isEqualToArray:");
  if (!result) {
    return result;
  }
  uint64_t v1 = *(void *)(a1 + 32);
LABEL_58:
  int v33 = [*(id *)(v1 + 48) isFpfsItem];
  uint64_t v34 = [*(id *)(*(void *)(a1 + 40) + 48) isFpfsItem];
  if (v33 != v34) {
    return 0;
  }
  if (!BRIsFPFSEnabled(v34, v35)) {
    return 1;
  }
  uint64_t v36 = *(void **)(a1 + 32);
  unsigned int v37 = *(void **)(a1 + 40);
  v38 = (void *)v36[21];
  id v39 = (void *)v37[21];
  if (v38 != v39)
  {
    if (!v39) {
      return 0;
    }
    uint64_t result = objc_msgSend(v38, "isEqualToData:");
    if (!result) {
      return result;
    }
    uint64_t v36 = *(void **)(a1 + 32);
    unsigned int v37 = *(void **)(a1 + 40);
  }
  __int16 v40 = (void *)v36[23];
  id v41 = (void *)v37[23];
  if (v40 != v41)
  {
    if (!v41) {
      return 0;
    }
    uint64_t result = objc_msgSend(v40, "isEqualToData:");
    if (!result) {
      return result;
    }
    uint64_t v36 = *(void **)(a1 + 32);
    unsigned int v37 = *(void **)(a1 + 40);
  }
  __int16 v42 = (void *)v36[26];
  v43 = (void *)v37[26];
  if (v42 != v43)
  {
    if (!v43) {
      return 0;
    }
    uint64_t result = objc_msgSend(v42, "isEqualToString:");
    if (!result) {
      return result;
    }
    uint64_t v36 = *(void **)(a1 + 32);
    unsigned int v37 = *(void **)(a1 + 40);
  }
  uint64_t v44 = (void *)v36[28];
  double v45 = (void *)v37[28];
  if (v44 != v45)
  {
    if (!v45) {
      return 0;
    }
    uint64_t result = objc_msgSend(v44, "isEqualToDictionary:");
    if (!result) {
      return result;
    }
    uint64_t v36 = *(void **)(a1 + 32);
    unsigned int v37 = *(void **)(a1 + 40);
  }
  uint64_t v46 = (void *)v36[20];
  v47 = (void *)v37[20];
  if (v46 == v47) {
    return v36[25] == v37[25];
  }
  if (!v47) {
    return 0;
  }
  uint64_t result = objc_msgSend(v46, "isEqualToString:");
  if (result)
  {
    uint64_t v36 = *(void **)(a1 + 32);
    unsigned int v37 = *(void **)(a1 + 40);
    return v36[25] == v37[25];
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BRQueryItem *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(BRQueryItem *)self isEqualToQueryItem:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(BRFileObjectID *)v2->_fileObjectID hash];
  objc_sync_exit(v2);

  return v3;
}

- (void)_mergeAttrs:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = 0;
  long long v46 = xmmword_1E59AE740;
  long long v47 = *(_OWORD *)&off_1E59AE750;
  long long v48 = xmmword_1E59AE760;
  long long v42 = xmmword_1E59AE700;
  long long v43 = *(_OWORD *)&off_1E59AE710;
  long long v44 = xmmword_1E59AE720;
  long long v45 = *(_OWORD *)&off_1E59AE730;
  long long v40 = xmmword_1E59AE6E0;
  long long v41 = *(_OWORD *)&off_1E59AE6F0;
  do
  {
    uint64_t v6 = *(void **)((char *)&v40 + v5);
    uint64_t v7 = (void *)v4[27];
    uint64_t v8 = self;
    id v9 = v6;
    id v10 = v7;
    char v11 = objc_msgSend(v10, "objectForKey:", v9, v40, v41, v42, v43, v44, v45, v46, v47, v48);
    attrs = self->_attrs;
    if (v11)
    {
      if (!attrs)
      {
        int v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v14 = self->_attrs;
        self->_attrs = v13;

        attrs = self->_attrs;
      }
      [(NSMutableDictionary *)attrs setObject:v11 forKey:v9];
    }
    else
    {
      [(NSMutableDictionary *)attrs removeObjectForKey:v9];
    }

    v5 += 8;
  }
  while (v5 != 144);
  int v15 = (void *)v4[27];
  uint64_t v16 = v8;
  id v17 = v15;
  int v18 = [v17 objectForKey:@"alias-path"];
  if (v18)
  {
    __int16 v19 = self->_attrs;
    if (!v19)
    {
      uint64_t v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v21 = self->_attrs;
      self->_attrs = v20;

      __int16 v19 = self->_attrs;
    }
    [(NSMutableDictionary *)v19 setObject:v18 forKey:@"alias-path"];
  }

  BOOL v22 = [(BRQueryItem *)v16 isInTransfer];
  int v23 = (void *)v4[27];
  uint64_t v24 = v16;
  id v25 = v23;
  int v26 = [v25 objectForKey:@"dl%"];
  if (v26)
  {
    uint64_t v27 = self->_attrs;
    if (!v27)
    {
      uint64_t v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v29 = self->_attrs;
      self->_attrs = v28;

      uint64_t v27 = self->_attrs;
    }
    [(NSMutableDictionary *)v27 setObject:v26 forKey:@"dl%"];
  }
  else if (!v22)
  {
    [(NSMutableDictionary *)self->_attrs removeObjectForKey:@"dl%"];
  }

  uint64_t v30 = (void *)v4[27];
  uint64_t v31 = v24;
  id v32 = v30;
  int v33 = [v32 objectForKey:@"ul%"];
  if (v33)
  {
    uint64_t v34 = self->_attrs;
    if (!v34)
    {
      uint64_t v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v36 = self->_attrs;
      self->_attrs = v35;

      uint64_t v34 = self->_attrs;
    }
    [(NSMutableDictionary *)v34 setObject:v33 forKey:@"ul%"];
  }
  else if (!v22)
  {
    [(NSMutableDictionary *)self->_attrs removeObjectForKey:@"ul%"];
  }

  unsigned int v37 = self->_attrs;
  if (v37 && ![(NSMutableDictionary *)v37 count])
  {
    v38 = self->_attrs;
    self->_attrs = 0;
  }
  for (uint64_t i = 136; i != -8; i -= 8)
}

- (void)_mergeURL:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_url = &self->_url;
  url = self->_url;
  uint64_t v7 = (NSURL *)v4[15];
  if (url == v7 || v7 == 0) {
    goto LABEL_63;
  }
  id v9 = url;
  id v10 = v7;
  char v11 = (const void *)MEMORY[0x19F3C3D80]();
  if (!v11)
  {
    uint64_t v12 = MEMORY[0x19F3C3D80](v9);
    if (!v12) {
      goto LABEL_9;
    }
    char v11 = (const void *)v12;
    MEMORY[0x19F3C3D20](v10, v12);
  }
  CFRelease(v11);
LABEL_9:

  int v13 = (void *)_CFURLPromiseCopyPhysicalURL();
  id v14 = v13;
  if (v13 != (void *)v4[15])
  {
    id v15 = (id)_CFURLPromiseCopyPhysicalURL();
    id v16 = v13;
    id v17 = (const void *)MEMORY[0x19F3C3D80]();
    if (!v17)
    {
      uint64_t v18 = MEMORY[0x19F3C3D80](v15);
      if (!v18)
      {
LABEL_14:

        _CFURLPromiseSetPhysicalURL();
        id v14 = (void *)v4[15];

        goto LABEL_15;
      }
      id v17 = (const void *)v18;
      MEMORY[0x19F3C3D20](v16, v18);
    }
    CFRelease(v17);
    goto LABEL_14;
  }
LABEL_15:
  objc_storeStrong((id *)&self->_url, v14);
  __int16 v19 = v13;
  if ([(BRFileObjectID *)self->_fileObjectID isDocumentID])
  {
    uint64_t v20 = self->_url;
    uint64_t v21 = *MEMORY[0x1E4F1D5B0];
    BOOL v22 = [(BRFileObjectID *)self->_fileObjectID documentID];
    MEMORY[0x19F3C3DF0](v20, v21, v22);
  }
  uint64_t v23 = MEMORY[0x19F3C3D80](*p_url);
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    id v25 = self->_url;
    id v26 = v24;
    int active_platform = dyld_get_active_platform();
    if ((active_platform & 0xFFFFFFFB) == 2 || active_platform == 11 || active_platform == 1)
    {
      if ((dyld_program_sdk_at_least() & 1) == 0 && [v26 length])
      {
        id v28 = v26;
        [v28 bytes];
        uint64_t v29 = sandbox_extension_consume();
        if (v29 < 0)
        {
          int v33 = *__error();
          uint64_t v34 = brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1690);
          uint64_t v35 = brc_default_log(0);
          if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            id v52 = v28;
            __int16 v53 = 1024;
            int v54 = v33;
            __int16 v55 = 2112;
            uint64_t v56 = v34;
            _os_log_error_impl(&dword_19ED3F000, v35, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", buf, 0x1Cu);
          }

          *__error() = v33;
        }
        else
        {
          int64_t v30 = v29;
          if (self->_logicalHandle < 0)
          {
            uint64_t v31 = brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1686);
            id v32 = brc_notifications_log();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
              -[BRQueryItem attachLogicalExtension:physicalExtension:]();
            }
          }
          else
          {
            sandbox_extension_release();
            uint64_t v31 = brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1684);
            id v32 = brc_notifications_log();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
              -[BRQueryItem attachLogicalExtension:physicalExtension:]();
            }
          }

          self->_logicalHandle = v30;
        }
      }
    }
    else
    {
      syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
    }

    CFRelease(v26);
  }
  if (v19)
  {
    if (v19 == *p_url)
    {
      if ((self->_physicalHandle & 0x8000000000000000) == 0)
      {
        long long v41 = brc_bread_crumbs((uint64_t)"-[BRQueryItem _mergeURL:]", 2318);
        long long v42 = brc_notifications_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
          -[BRQueryItem _mergeURL:]();
        }

        sandbox_extension_release();
        self->_physicalHandle = -1;
      }
    }
    else
    {
      uint64_t v36 = MEMORY[0x19F3C3D80](v19);
      if (v36)
      {
        unsigned int v37 = (void *)v36;
        v38 = v19;
        id v39 = v37;
        int v40 = dyld_get_active_platform();
        if ((v40 & 0xFFFFFFFB) == 2 || v40 == 11 || v40 == 1)
        {
          if ((dyld_program_sdk_at_least() & 1) == 0 && [v39 length])
          {
            id v43 = v39;
            [v43 bytes];
            uint64_t v44 = sandbox_extension_consume();
            if (v44 < 0)
            {
              int v48 = *__error();
              uint64_t v49 = brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1690);
              double v50 = brc_default_log(0);
              if (os_log_type_enabled(v50, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 138412802;
                id v52 = v43;
                __int16 v53 = 1024;
                int v54 = v48;
                __int16 v55 = 2112;
                uint64_t v56 = v49;
                _os_log_error_impl(&dword_19ED3F000, v50, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", buf, 0x1Cu);
              }

              *__error() = v48;
            }
            else
            {
              int64_t v45 = v44;
              if (self->_physicalHandle < 0)
              {
                long long v46 = brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1686);
                long long v47 = brc_notifications_log();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
                  -[BRQueryItem attachLogicalExtension:physicalExtension:]();
                }
              }
              else
              {
                sandbox_extension_release();
                long long v46 = brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1684);
                long long v47 = brc_notifications_log();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
                  -[BRQueryItem attachLogicalExtension:physicalExtension:]();
                }
              }

              self->_physicalHandle = v45;
            }
          }
        }
        else
        {
          syslog(5, "Unknown platform linking against CloudDocs framework %d", v40);
        }

        CFRelease(v39);
      }
    }
  }

LABEL_63:
}

- (id)attributeForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(id)_getterMap objectForKeyedSubscript:v4];

  if (v6)
  {
    id v10 = brc_bread_crumbs((uint64_t)"-[BRQueryItem attributeForKey:]", 2329);
    char v11 = brc_default_log(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRQueryItem attributeForKey:]();
    }
  }
  uint64_t v7 = [(NSMutableDictionary *)v5->_attrs objectForKeyedSubscript:v4];
  uint64_t v8 = (void *)[v7 copy];

  objc_sync_exit(v5);

  return v8;
}

- (void)setAttribute:(id)a3 forKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  attrs = v7->_attrs;
  if (v11)
  {
    if (attrs)
    {
      [(NSMutableDictionary *)attrs setObject:v11 forKey:v6];
      goto LABEL_8;
    }
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v11, v6, 0);
  }
  else
  {
    [(NSMutableDictionary *)attrs removeObjectForKey:v6];
    uint64_t v9 = [(NSMutableDictionary *)v7->_attrs count];
    if (v9) {
      goto LABEL_8;
    }
  }
  id v10 = v7->_attrs;
  v7->_attrs = (NSMutableDictionary *)v9;

LABEL_8:
  objc_sync_exit(v7);
}

- (BOOL)canMerge:(id)a3
{
  id v4 = (BRQueryItem *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    id v14 = __24__BRQueryItem_canMerge___block_invoke;
    id v15 = &unk_1E59AE6C0;
    id v16 = self;
    id v17 = v4;
    id v6 = self;
    uint64_t v7 = v17;
    uint64_t v8 = v13;
    if (v6 >= v7)
    {
      uint64_t v9 = v7;
      objc_sync_enter(v9);
      id v10 = v6;
    }
    else
    {
      uint64_t v9 = v6;
      objc_sync_enter(v9);
      id v10 = v7;
    }
    objc_sync_enter(v10);
    char v11 = v14((uint64_t)v8);
    objc_sync_exit(v10);

    objc_sync_exit(v9);
  }

  return v11;
}

uint64_t __24__BRQueryItem_canMerge___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2 == *(void **)(v1 + 8)) {
    return 1;
  }
  else {
    return objc_msgSend(v2, "isEqualToString:");
  }
}

- (void)merge:(id)a3 allowMergingFileObjectIDIfPossible:(BOOL)a4
{
  id v6 = (BRQueryItem *)a3;
  if (!v6)
  {
    uint64_t v12 = brc_bread_crumbs((uint64_t)"-[BRQueryItem merge:allowMergingFileObjectIDIfPossible:]", 2370);
    int v13 = brc_default_log(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRQueryItem merge:allowMergingFileObjectIDIfPossible:]();
    }
  }
  if (self != v6)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    id v15 = __56__BRQueryItem_merge_allowMergingFileObjectIDIfPossible___block_invoke;
    id v16 = &unk_1E59AE778;
    BOOL v19 = a4;
    id v17 = self;
    uint64_t v18 = v6;
    uint64_t v7 = self;
    uint64_t v8 = v18;
    uint64_t v9 = v14;
    if (v7 >= v8)
    {
      id v10 = v8;
      objc_sync_enter(v10);
      char v11 = v7;
    }
    else
    {
      id v10 = v7;
      objc_sync_enter(v10);
      char v11 = v8;
    }
    objc_sync_enter(v11);
    ((void (*)(void *))v15)(v9);
    objc_sync_exit(v11);

    objc_sync_exit(v10);
  }
}

uint64_t __56__BRQueryItem_merge_allowMergingFileObjectIDIfPossible___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int v3 = BRIsFPFSEnabled(a1, a2);
  if (!v3 || !*(unsigned char *)(a1 + 48)) {
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(void *)(v4 + 48))
  {
    objc_storeStrong((id *)(v4 + 48), *(id *)(*(void *)(a1 + 40) + 48));
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(void **)(v4 + 272);
  if (v5 && *(void *)(*(void *)(a1 + 40) + 272) && objc_msgSend(v5, "isEqual:")) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(*(void *)(a1 + 40) + 48));
  }
  if (*(unsigned char *)(a1 + 48) && !*(void *)(*(void *)(a1 + 32) + 48) && !*(void *)(*(void *)(a1 + 40) + 48))
  {
    uint64_t v27 = brc_bread_crumbs((uint64_t)"-[BRQueryItem merge:allowMergingFileObjectIDIfPossible:]_block_invoke", 2397);
    id v28 = brc_default_log(1);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138412290;
      id v32 = v27;
      _os_log_impl(&dword_19ED3F000, v28, OS_LOG_TYPE_DEFAULT, "[WARNING] Both fileObjectIDs are nil, proceeding%@", (uint8_t *)&v31, 0xCu);
    }
  }
  else
  {
LABEL_12:
    if (([*(id *)(*(void *)(a1 + 32) + 48) isEqualToFileObjectID:*(void *)(*(void *)(a1 + 40) + 48)] & 1) == 0)
    {
      id v16 = brc_bread_crumbs((uint64_t)"-[BRQueryItem merge:allowMergingFileObjectIDIfPossible:]_block_invoke", 2399);
      id v17 = brc_default_log(0);
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        uint64_t v23 = *(void **)(*(void *)(a1 + 32) + 48);
        uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 48);
        int v31 = 138412802;
        id v32 = v23;
        __int16 v33 = 2112;
        uint64_t v34 = v24;
        __int16 v35 = 2112;
        uint64_t v36 = v16;
        _os_log_error_impl(&dword_19ED3F000, v17, (os_log_type_t)0x90u, "[ERROR] failed merging object id %@ with %@%@", (uint8_t *)&v31, 0x20u);
      }

      uint64_t v18 = brc_bread_crumbs((uint64_t)"-[BRQueryItem merge:allowMergingFileObjectIDIfPossible:]_block_invoke", 2400);
      BOOL v19 = brc_default_log(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        id v25 = *(void **)(*(void *)(a1 + 32) + 48);
        uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 48);
        int v31 = 138412802;
        id v32 = v25;
        __int16 v33 = 2112;
        uint64_t v34 = v26;
        __int16 v35 = 2112;
        uint64_t v36 = v18;
        _os_log_fault_impl(&dword_19ED3F000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't merge objects with different object ids (%@, %@)%@", (uint8_t *)&v31, 0x20u);
      }

      return 0;
    }
  }
  id v6 = (void *)(a1 + 40);
  int v7 = (*(_DWORD *)(*(void *)(a1 + 40) + 240) >> 20) & 1;
  if (((*(_DWORD *)(*(void *)(a1 + 32) + 240) >> 20) & 1) != v7 && v7 != 0)
  {
    uint64_t v20 = brc_bread_crumbs((uint64_t)"-[BRQueryItem merge:allowMergingFileObjectIDIfPossible:]_block_invoke", 2405);
    uint64_t v21 = brc_notifications_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      __56__BRQueryItem_merge_allowMergingFileObjectIDIfPossible___block_invoke_cold_1(v6);
    }

    return 0;
  }
  uint64_t v9 = brc_bread_crumbs((uint64_t)"-[BRQueryItem merge:allowMergingFileObjectIDIfPossible:]_block_invoke", 2408);
  id v10 = brc_notifications_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v29 = *(void **)(a1 + 32);
    uint64_t v30 = *(void *)(a1 + 40);
    int v31 = 138412802;
    id v32 = v29;
    __int16 v33 = 2112;
    uint64_t v34 = v30;
    __int16 v35 = 2112;
    uint64_t v36 = v9;
    _os_log_debug_impl(&dword_19ED3F000, v10, OS_LOG_TYPE_DEBUG, "[NOTIF] Merging %@ with %@%@", (uint8_t *)&v31, 0x20u);
  }

  *(void *)(*(void *)(a1 + 32) + 240) = *(void *)(*(void *)(a1 + 40) + 240);
  *(_WORD *)(*(void *)(a1 + 32) + 264) |= *(_WORD *)(*(void *)(a1 + 40) + 264);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(*(void *)(a1 + 40) + 8));
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void **)(v11 + 16);
  if (v12)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v12);
    uint64_t v11 = *(void *)(a1 + 40);
  }
  [*(id *)(a1 + 32) _mergeURL:v11];
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = *(void **)(v13 + 128);
  if (v14)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), v14);
    uint64_t v13 = *(void *)(a1 + 40);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(v13 + 24));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(*(void *)(a1 + 40) + 32));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(*(void *)(a1 + 40) + 72));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(*(void *)(a1 + 40) + 80));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(*(void *)(a1 + 40) + 88));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), *(id *)(*(void *)(a1 + 40) + 96));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(*(void *)(a1 + 40) + 104));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), *(id *)(*(void *)(a1 + 40) + 112));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(*(void *)(a1 + 40) + 56));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(*(void *)(a1 + 40) + 64));
  [*(id *)(a1 + 32) _mergeAttrs:*(void *)(a1 + 40)];
  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), *(id *)(*(void *)(a1 + 40) + 184));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), *(id *)(*(void *)(a1 + 40) + 168));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 176), *(id *)(*(void *)(a1 + 40) + 176));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 208), *(id *)(*(void *)(a1 + 40) + 208));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 224), *(id *)(*(void *)(a1 + 40) + 224));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), *(id *)(*(void *)(a1 + 40) + 192));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), *(id *)(*(void *)(a1 + 40) + 160));
    *(void *)(*(void *)(a1 + 32) + 200) = *(void *)(*(void *)(a1 + 40) + 200);
  }
  return 1;
}

- (void)merge:(id)a3
{
}

- (void)mergeProgressUpdate:(id)a3
{
}

+ (id)askDaemonQueryItemForURL:(id)a3 error:(id *)a4
{
  return (id)[a1 askDaemonQueryItemForURL:a3 andFakeFSEvent:0 error:a4];
}

+ (id)askDaemonQueryItemForURL:(id)a3 andFakeFSEvent:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  memset(v30, 0, sizeof(v30));
  __brc_create_section(0, (uint64_t)"+[BRQueryItem askDaemonQueryItemForURL:andFakeFSEvent:error:]", 2478, v30);
  uint64_t v8 = brc_bread_crumbs((uint64_t)"+[BRQueryItem askDaemonQueryItemForURL:andFakeFSEvent:error:]", 2478);
  uint64_t v9 = brc_notifications_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v26 = (void *)v30[0];
    uint64_t v27 = [v7 path];
    *(_DWORD *)buf = 134218498;
    id v32 = v26;
    __int16 v33 = 2112;
    uint64_t v34 = v27;
    __int16 v35 = 2112;
    uint64_t v36 = v8;
    _os_log_debug_impl(&dword_19ED3F000, v9, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx asking item for url: %@%@", buf, 0x20u);
  }
  if (BRIsFPFSEnabled(v10, v11))
  {
    uint64_t v12 = [MEMORY[0x1E4F25D40] defaultManager];
    id v13 = [v12 itemForURL:v7 error:a5];

    if (v13)
    {
      id v14 = [[BRQueryItem alloc] initWithFPItem:v13];
      id v15 = brc_bread_crumbs((uint64_t)"+[BRQueryItem askDaemonQueryItemForURL:andFakeFSEvent:error:]", 2488);
      id v16 = brc_notifications_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        +[BRQueryItem askDaemonQueryItemForURL:andFakeFSEvent:error:]();
      }
    }
    else
    {
      id v15 = brc_bread_crumbs((uint64_t)"+[BRQueryItem askDaemonQueryItemForURL:andFakeFSEvent:error:]", 2483);
      id v16 = brc_default_log(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v15;
        _os_log_impl(&dword_19ED3F000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't build FPItem%@", buf, 0xCu);
      }
      id v14 = 0;
    }
  }
  else
  {
    if (v6)
    {
      id v17 = +[BRDaemonConnection defaultConnection];
      uint64_t v18 = (void *)[v17 newLegacySyncProxy];

      BOOL v19 = v29;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __61__BRQueryItem_askDaemonQueryItemForURL_andFakeFSEvent_error___block_invoke;
      v29[3] = &unk_1E59AE7A0;
      id v13 = v18;
      v29[4] = v13;
      [v13 updateItemFromURL:v7 reply:v29];
    }
    else
    {
      uint64_t v20 = +[BRDaemonConnection secondaryConnection];
      uint64_t v21 = (void *)[v20 newLegacySyncProxy];

      BOOL v19 = v28;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __61__BRQueryItem_askDaemonQueryItemForURL_andFakeFSEvent_error___block_invoke_2;
      v28[3] = &unk_1E59AE7A0;
      id v13 = v21;
      v28[4] = v13;
      [v13 getQueryItemForURL:v7 reply:v28];
    }

    BOOL v22 = brc_bread_crumbs((uint64_t)"+[BRQueryItem askDaemonQueryItemForURL:andFakeFSEvent:error:]", 2507);
    uint64_t v23 = brc_notifications_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = [v13 result];
      +[BRQueryItem askDaemonQueryItemForURL:andFakeFSEvent:error:](v24, (uint64_t)v22, buf, v23);
    }

    if (a5)
    {
      *a5 = [v13 error];
    }
    id v14 = [v13 result];
  }

  __brc_leave_section((uint64_t)v30);

  return v14;
}

uint64_t __61__BRQueryItem_askDaemonQueryItemForURL_andFakeFSEvent_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

uint64_t __61__BRQueryItem_askDaemonQueryItemForURL_andFakeFSEvent_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

- (id)replacement
{
  return self->_replacement;
}

- (void)setReplacement:(id)a3
{
}

- (id)attributeForName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(id)_getterMap objectForKey:v4];
  id v7 = (void *)v6;
  if (v6)
  {
    uint64_t v8 = (*(void (**)(uint64_t, BRQueryItem *))(v6 + 16))(v6, v5);
  }
  else
  {
    uint64_t v10 = brc_bread_crumbs((uint64_t)"-[BRQueryItem attributeForName:]", 2526);
    uint64_t v11 = brc_default_log(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRQueryItem attributeForName:]();
    }

    uint64_t v8 = 0;
  }

  objc_sync_exit(v5);

  return v8;
}

- (id)attributeNames
{
  return (id)_allKeys;
}

- (id)attributesForNames:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:_sharedKeySet];
  uint64_t v6 = self;
  objc_sync_enter(v6);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = -[BRQueryItem attributeForName:](v6, "attributeForName:", v11, (void)v14);
        if (v12) {
          [v5 setObject:v12 forKey:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);

  return v5;
}

+ (id)containerItemForContainer:(id)a3 withRepresentativeItem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[_BRContainerItem alloc] initWithQueryItem:v5 container:v6 zoneRowID:0];

  return v7;
}

+ (id)containerItemForContainer:(id)a3 withRepresentativeItem:(id)a4 zoneRowID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[_BRContainerItem alloc] initWithQueryItem:v8 container:v9 zoneRowID:v7];

  return v10;
}

+ (id)containerItemForContainer:(id)a3 forceScan:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 documentsURL];
    id v16 = 0;
    id v9 = +[BRQueryItem askDaemonQueryItemForURL:v8 andFakeFSEvent:v4 error:&v16];
    id v10 = v16;

    if (v10)
    {
      uint64_t v11 = brc_bread_crumbs((uint64_t)"+[BRQueryItem containerItemForContainer:forceScan:]", 2579);
      uint64_t v12 = brc_default_log(0);
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        long long v15 = [v7 documentsURL];
        *(_DWORD *)buf = 138412802;
        uint64_t v18 = v15;
        __int16 v19 = 2112;
        id v20 = v10;
        __int16 v21 = 2112;
        BOOL v22 = v11;
        _os_log_error_impl(&dword_19ED3F000, v12, (os_log_type_t)0x90u, "[ERROR] Querying item for URL %@ failed: %@%@", buf, 0x20u);
      }
      id v13 = 0;
    }
    else
    {
      id v13 = [a1 containerItemForContainer:v7 withRepresentativeItem:v9 zoneRowID:0];
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)isContentZoneRoot
{
  return (BYTE4(self->_flags.value) >> 2) & 1;
}

- (NSData)contentVersion
{
  return self->_contentVersion;
}

- (NSData)structureVersion
{
  return self->_structureVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nsmdqFPItemID, 0);
  objc_storeStrong(&self->_replacement, 0);
  objc_storeStrong((id *)&self->_xattrs, 0);
  objc_storeStrong((id *)&self->_attrs, 0);
  objc_storeStrong((id *)&self->_lastEditorDeviceName, 0);
  objc_storeStrong((id *)&self->_conflictingVersions, 0);
  objc_storeStrong((id *)&self->_structureVersion, 0);
  objc_storeStrong((id *)&self->_equivalentContentVersions, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_symlinkTargetPath, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneRowID, 0);
  objc_storeStrong((id *)&self->_parentZoneRowID, 0);
  objc_storeStrong((id *)&self->_localRepresentationURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_childItemCount, 0);
  objc_storeStrong((id *)&self->_favoriteRank, 0);
  objc_storeStrong((id *)&self->_lastUsedTime, 0);
  objc_storeStrong((id *)&self->_btime, 0);
  objc_storeStrong((id *)&self->_mtime, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_shareRootFileObjectID, 0);
  objc_storeStrong((id *)&self->_parentFileObjectID, 0);
  objc_storeStrong((id *)&self->_fileObjectID, 0);
  objc_storeStrong((id *)&self->_bookmarkData, 0);
  objc_storeStrong((id *)&self->_physicalName, 0);
  objc_storeStrong((id *)&self->_logicalName, 0);
  objc_storeStrong((id *)&self->_parentPath, 0);

  objc_storeStrong((id *)&self->_appLibraryID, 0);
}

void __25__BRQueryItem_initialize__block_invoke_18_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: bogus uploading state for %@%@");
}

void __25__BRQueryItem_initialize__block_invoke_32_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: unknown permissions for %@%@");
}

- (void)parentFileID
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: BRQueryItem::parentFileID is not implemented in FPFS.%@", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: isFpfs || self.isDead%@", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:(void *)a1 .cold.2(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_19ED3F000, v1, v2, "[CRIT] UNREACHABLE: No logical name for item. Falling back to physical name if it exists %@%@", (void)v3, DWORD2(v3));
}

- (void)attachLogicalExtension:(void *)a1 physicalExtension:.cold.1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_19ED3F000, v1, v2, "[CRIT] UNREACHABLE: there should be a physical URL on url: %@%@", (void)v3, DWORD2(v3));
}

- (void)attachLogicalExtension:physicalExtension:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[NOTIF] replaced sandbox extension for %@%@");
}

- (void)attachLogicalExtension:physicalExtension:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[NOTIF] consumed sandbox extension for %@%@");
}

- (void)attachLogicalExtension:physicalExtension:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: physicalURL != (__bridge CFURLRef)_url%@", v2, v3, v4, v5, v6);
}

- (void)initWithFPItem:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: [item conformsToProtocol:@protocol(NSFileProviderItem_Private)]%@", v2, v3, v4, v5, v6);
}

- (void)_mergeURL:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[NOTIF] released sandbox extension for %@%@");
}

- (void)attributeForKey:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: !_getterMap[key]%@", v2, v3, v4, v5, v6);
}

- (void)merge:allowMergingFileObjectIDIfPossible:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: update != nil%@", v2, v3, v4, v5, v6);
}

void __56__BRQueryItem_merge_allowMergingFileObjectIDIfPossible___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[NOTIF] Dropping from gather update %@%@", (void)v3, DWORD2(v3));
}

+ (void)askDaemonQueryItemForURL:andFakeFSEvent:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[NOTIF] returning %@%@");
}

+ (void)askDaemonQueryItemForURL:(uint8_t *)buf andFakeFSEvent:(os_log_t)log error:.cold.2(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_19ED3F000, log, OS_LOG_TYPE_DEBUG, "[NOTIF] returning %@%@", buf, 0x16u);
}

- (void)attributeForName:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: getter No getter found for key: %@%@");
}

@end