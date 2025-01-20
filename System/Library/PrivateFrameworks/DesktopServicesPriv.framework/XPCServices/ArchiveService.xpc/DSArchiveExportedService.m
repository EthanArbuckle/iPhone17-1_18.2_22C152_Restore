@interface DSArchiveExportedService
- (AAByteStream_impl)_openAppleArchiveReadStreamWithFD:(int)a3 url:(id)a4 progress:(id)a5 passphrases:(id)a6 addToKeychain:(BOOL)a7 aeaContext:(AEAContext_impl *)a8 formats:(unint64_t)a9 error:(id *)a10;
- (AAByteStream_impl)_openAppleArchiveWriteStreamWithArchiveURL:(id)a3 itemURLs:(id)a4 progress:(id)a5 passphrase:(id)a6 aeaContext:(AEAContext_impl *)a7 compressionFormat:(unint64_t)a8 error:(id *)a9;
- (BOOL)_archiveFromItemURLs:(id)a3 passphrase:(id)a4 addToKeychain:(BOOL)a5 compressionFormat:(unint64_t)a6 archiveURL:(id)a7 fd:(int)a8 progress:(id)a9 error:(id *)a10;
- (BOOL)_archiveItemURL:(id)a3 itemArchivePath:(id)a4 isDirectory:(BOOL)a5 archive:(archive *)a6 entry:(archive_entry *)a7 stat:(stat *)a8 writeProgressHandler:(id)a9 error:(id *)a10;
- (BOOL)_createAppleArchiveOfItemURLs:(id)a3 passphrase:(id)a4 addToKeychain:(BOOL)a5 compressionFormat:(unint64_t)a6 archiveURL:(id)a7 archiveFD:(int)a8 progress:(id)a9 error:(id *)a10;
- (BOOL)_createArchiveOfItemURLs:(id)a3 compressionFormat:(unint64_t)a4 archive:(archive *)a5 entry:(archive_entry *)a6 archiveURL:(id)a7 fd:(int)a8 progress:(id)a9 error:(id *)a10;
- (BOOL)_createMetadataFileWithAppleDoubleFormatOfItemURL:(id)a3 destinationURL:(id)a4 error:(id *)a5;
- (BOOL)_enumerateItemURL:(id)a3 itemActionBlock:(id)a4 error:(id *)a5;
- (BOOL)_getIsDirectoryProperty:(BOOL *)a3 forItemURL:(id)a4 error:(id *)a5;
- (BOOL)_isAppleArchive:(id)a3;
- (BOOL)_isCancelled;
- (BOOL)_listAppleArchiveWithFD:(int)a3 url:(id)a4 progress:(id)a5 passphrases:(id)a6 formats:(unint64_t)a7 listItemHandler:(id)a8 error:(id *)a9;
- (BOOL)_openArchiveWithFD:(int)a3 url:(id)a4 progress:(id)a5 passphrases:(id)a6 formats:(unint64_t)a7 archive:(archive *)a8 entry:(archive_entry *)a9 readItemHandler:(id)a10 error:(id *)a11;
- (BOOL)_openArchiveWithFD:(int)a3 url:(id)a4 progress:(id)a5 passphrases:(id)a6 formats:(unint64_t)a7 readItemHandler:(id)a8 error:(id *)a9;
- (BOOL)_unarchiveAppleArchiveWithFD:(int)a3 url:(id)a4 destinationURL:(id)a5 progress:(id)a6 passphrases:(id)a7 addToKeychain:(BOOL)a8 formats:(unint64_t)a9 error:(id *)a10;
- (BOOL)_unarchiveEntryAtPath:(const char *)a3 entry:(archive_entry *)a4 fromArchive:(archive *)a5 archiveURL:(id)a6 destinationURL:(id)a7 progress:(id)a8 error:(id *)a9;
- (BOOL)_unarchiveFromArchiveFD:(int)a3 url:(id)a4 passphrases:(id)a5 addToKeychain:(BOOL)a6 destinationURL:(id)a7 formats:(unint64_t)a8 progress:(id)a9 readItemGroup:(id)a10 error:(id *)a11;
- (BOOL)_writeOnArchiveEntryAtPath:(const char *)a3 entry:(archive_entry *)a4 archive:(archive *)a5 writeProgressHandler:(id)a6 error:(id *)a7;
- (BOOL)_writeXattrEntryForURL:(id)a3 compressionFormat:(unint64_t)a4 archive:(archive *)a5 entry:(archive_entry *)a6 archiveURL:(id)a7 commonParentPath:(id)a8 stat:(stat *)a9 error:(id *)a10;
- (DSArchiveExportedService)init;
- (id)__temporaryURLAppropriateForURL:(id)a3 calledFromLegacyAPI:(BOOL)a4 error:(id *)a5;
- (id)_archiveDecryptionError;
- (id)_createArchivePlaceholderForItems:(id)a3 inFolder:(id)a4 compressionFormat:(unint64_t)a5 error:(id *)a6;
- (id)_createUnarchivePlaceholderForDescriptors:(id)a3 describingArchive:(id)a4 inFolder:(id)a5 hasMultipleTopLevelItems:(BOOL *)a6 placeholderIsFolder:(BOOL *)a7 error:(id *)a8;
- (id)_createUniquePlaceholderWithName:(id)a3 inFolder:(id)a4 asFolder:(BOOL)a5 isArchiving:(BOOL)a6 error:(id *)a7;
- (id)_errorForAppleArchive:(int)a3 itemURL:(id)a4;
- (id)_errorForArchive:(archive *)a3 itemURL:(id)a4;
- (id)_filepathForFd:(int)a3 error:(id *)a4;
- (id)_passwordFromKeychainWithArchiveID:(char *)a3 archiveIDSize:(unint64_t)a4;
- (id)_quarantineDataFromArchiveFD:(int)a3 url:(id)a4 error:(id *)a5;
- (id)_replacePathComponent:(id)a3 withComponent:(id)a4 inFilePath:(id)a5;
- (id)_sanitizedPathWithCString:(const char *)a3 length:(unint64_t)a4;
- (id)_temporaryURLAppropriateForURL:(id)a3 calledFromLegacyAPI:(BOOL)a4 error:(id *)a5;
- (id)archiveItemsWithURLWrappers:(id)a3 passphrase:(id)a4 addToKeychain:(BOOL)a5 compressionFormat:(unint64_t)a6 destinationFolderURLWrapper:(id)a7 usePlaceholder:(BOOL)a8 completionHandler:(id)a9;
- (id)archiveItemsWithURLWrappers:(id)a3 toURLWrapper:(id)a4 options:(unint64_t)a5 compressionFormat:(unint64_t)a6 passphrase:(id)a7 completionHandler:(id)a8;
- (id)archivedItemDescriptorsForFD:(int)a3 url:(id)a4 passphrases:(id)a5 progress:(id)a6 formats:(unint64_t)a7 destinationFolderURL:(id)a8 error:(id *)a9;
- (id)performActionOfKind:(unint64_t)a3 onResourcesWithURLWrappers:(id)a4 clientDestinationFolderURLWrapper:(id)a5 calledFromLegacyAPI:(BOOL)a6 actionHandler:(id)a7 completionHandler:(id)a8;
- (id)unarchiveItemWithURLWrapper:(id)a3 passphrases:(id)a4 addToKeychain:(BOOL)a5 destinationFolderURLWrapper:(id)a6 acceptedFormats:(unint64_t)a7 exportsStreamingReceiver:(BOOL)a8 usePlaceholder:(BOOL)a9 completionHandler:(id)a10;
- (id)unarchiveItemWithURLWrapper:(id)a3 toURLWrapper:(id)a4 options:(unint64_t)a5 passphrases:(id)a6 acceptedFormats:(unint64_t)a7 completionHandler:(id)a8;
- (int)openArchiveFile:(id)a3 error:(id *)a4;
- (void)_cancel;
- (void)_cleanupWithResult:(id)a3 error:(id)a4 securityScopedURLs:(id)a5 completionHandler:(id)a6;
- (void)itemDescriptorsForItemWithURLWrapper:(id)a3 passphrases:(id)a4 completionHandler:(id)a5;
@end

@implementation DSArchiveExportedService

- (DSArchiveExportedService)init
{
  v9.receiver = self;
  v9.super_class = (Class)DSArchiveExportedService;
  v2 = [(DSArchiveExportedService *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (NSOperationQueue *)v3;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("archive-service-queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (id)_filepathForFd:(int)a3 error:(id *)a4
{
  if (fcntl(a3, 50, __s) == -1)
  {
    v8 = +[NSError ds_errorWithPOSIXCode:*__error() itemURL:0 debugDescription:@"couldn't get filename from a file descriptor"];
    dispatch_queue_t v6 = v8;
    if (a4) {
      *a4 = v8;
    }
    objc_super v9 = LogObj(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      int v12 = a3;
      __int16 v13 = 2112;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Couldn't get the path of a file from a fd (%d): %@", buf, 0x12u);
    }

    v7 = 0;
  }
  else
  {
    dispatch_queue_t v6 = +[NSFileManager defaultManager];
    v7 = [v6 stringWithFileSystemRepresentation:__s length:strlen(__s)];
  }

  return v7;
}

- (void)itemDescriptorsForItemWithURLWrapper:(id)a3 passphrases:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22 = v8;
  v11 = [v8 url];
  unsigned __int8 v12 = [v11 startAccessingSecurityScopedResource];
  unsigned __int8 v13 = v12;
  if (v11) {
    unsigned __int8 v14 = v12;
  }
  else {
    unsigned __int8 v14 = 0;
  }
  if (v14)
  {
    v15 = +[NSFileAccessIntent readingIntentWithURL:v11 options:0x20000];
    v16 = objc_opt_new();
    v17 = v9;
    v29 = v15;
    v18 = +[NSArray arrayWithObjects:&v29 count:1];
    operationQueue = self->_operationQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100012EFC;
    v23[3] = &unk_10002D060;
    v23[4] = self;
    id v24 = v11;
    id v20 = v15;
    id v25 = v20;
    id v26 = v17;
    unsigned __int8 v28 = v13;
    id v27 = v10;
    [v16 coordinateAccessWithIntents:v18 queue:operationQueue byAccessor:v23];

    id v9 = v17;
  }
  else
  {
    if (v11)
    {
      NSErrorUserInfoKey v30 = NSURLErrorKey;
      v31 = v11;
      id v20 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    }
    else
    {
      id v20 = 0;
    }
    v21 = +[NSError errorWithDomain:NSCocoaErrorDomain code:257 userInfo:v20];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v21);
  }
}

- (id)_createUniquePlaceholderWithName:(id)a3 inFolder:(id)a4 asFolder:(BOOL)a5 isArchiving:(BOOL)a6 error:(id *)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v10 = a3;
  v31 = (__CFURL *)a4;
  v32 = v10;
  if (v7)
  {
    id v10 = [v10 stringByDeletingPathExtension];
  }
  unsigned int v11 = +[NSString ds_fileNameHasClaimedFileExtension:v10];
  if (v7)
  {

    v38[0] = [v32 pathExtension];
    sub_10001F1DC((uint64_t)&v44, v38);

    unsigned __int8 v12 = [v32 stringByDeletingPathExtension];
  }
  else
  {
    LOBYTE(v44) = 0;
    char v45 = 0;
    unsigned __int8 v12 = v32;
  }
  v43 = &off_10002DED0;
  uint64_t v13 = v11 ^ 1;
  v34 = objc_msgSend(v12, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v43, 0, v13);
  unsigned __int8 v14 = v43;
  if (v7) {

  }
  NSErrorUserInfoKey v30 = v32;
  sub_10000866C(&v41);
  sub_10000866C(&v39);
  TCFURLInfo::Initialize((CFTypeRef *)v39, v31, 0, 0);
  TCFURLInfo::GetVolumeInfoRecord((CFURLRef *)v39, v38);
  CFFileSecurityRef fileSec = CFFileSecurityCreate(0);
  uid_t v15 = TCFURLInfo::GetuidToUse(fileSec);
  v16 = (TCFURLInfo *)CFFileSecuritySetOwner(fileSec, v15);
  gid_t v17 = TCFURLInfo::GetgidToUse(v16);
  CFFileSecuritySetGroup(fileSec, v17);
  CFFileSecuritySetMode(fileSec, 0x1B6u);
  v18 = v30;
  while (1)
  {
    v18 = v18;
    v36 = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    TString::SetStringRefAsImmutable((CFTypeRef *)&v36, v18);

    v19 = (__CFFileSecurity *)((LODWORD(v38[0]) >> 10) & 1);
    id v20 = (TCFURLInfo *)(v8
                       ? TCFURLInfo::CreateLockDirectory(v39, &v39, &v36, fileSec, v19, &v41)
                       : TCFURLInfo::CreateLockFile((TCFURLInfo **)v39, &v39, &v36, fileSec, v19, &v41));
    int v21 = (int)v20;
    if (v20 != -8011 && v20 != -48) {
      break;
    }
LABEL_19:
    objc_msgSend(v34, "fp_bouncedNameWithIndex:isDir:", objc_msgSend(v14, "integerValue", v30), v13);
    id v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      id v25 = v44;
      v18 = [(__CFString *)v24 stringByAppendingPathExtension:v25];
    }
    else
    {
      v18 = v24;
    }
    uint64_t v26 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v14 integerValue] + 1);

    unsigned __int8 v14 = (_UNKNOWN **)v26;
LABEL_23:
    sub_100007E94((const void **)&v36);
    if (v21 != -8011 && v21 != -48)
    {
      id v27 = 0;
      goto LABEL_27;
    }
  }
  if (v20)
  {
    if (a7)
    {
      NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
      TCFURLInfo::LocalizedCopyErrorMessage(v20, (const void **)&v36, (CFTypeRef *)&v35);
      v22 = v35;
      v47 = v22;
      v23 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      *a7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v21 userInfo:v23];

      sub_100007E94((const void **)&v35);
    }
    if (v21 != -48 && v21 != -8011) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  sub_100007E94((const void **)&v36);
  id v27 = [(__CFURL *)v31 URLByAppendingPathComponent:v18];
LABEL_27:
  id v28 = v27;
  sub_10001F544((const void **)&fileSec);
  if (v40) {
    sub_1000085C4(v40);
  }
  if (v42) {
    sub_1000085C4(v42);
  }

  if (v45) {
    sub_100007E94((const void **)&v44);
  }

  return v28;
}

- (id)_createArchivePlaceholderForItems:(id)a3 inFolder:(id)a4 compressionFormat:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v23 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  if ([v10 count] == (id)1)
  {
    unsigned __int8 v12 = [v10 objectAtIndexedSubscript:0];
    uint64_t v13 = [v12 lastPathComponent];
    if (v23 != v13) {
      TString::SetStringRefAsImmutable((CFTypeRef *)&v23, v13);
    }

    if (BRContainerClass() && objc_msgSend(v12, "br_isDocumentsContainer"))
    {
      TCFURLInfo::StringProperty((TCFURLInfo *)v12, kCFURLLocalizedNameKey, (CFTypeRef *)&theString);
      if (CFStringGetLength(theString)) {
        TString::SetStringRefAsImmutable((CFTypeRef *)&v23, (__CFString *)theString);
      }
      sub_100007E94((const void **)&theString);
    }
    if (+[NSString ds_fileNameHasClaimedFileExtension:v23])
    {
      unsigned __int8 v14 = v23;
      uid_t v15 = [(__CFString *)v14 stringByDeletingPathExtension];
      if (v23 != v15) {
        TString::SetStringRefAsImmutable((CFTypeRef *)&v23, v15);
      }
    }
  }
  else
  {
    TCFURLInfo::LocalizedStringWithKey((TCFURLInfo *)@"GenericArchiveName", (CFTypeRef *)&theString);
    sub_10000882C((const void **)&v23, (const void **)&theString);
    CFRetain(&stru_10002D5A8);
    if (theString) {
      CFRelease(theString);
    }
    CFStringRef theString = &stru_10002D5A8;
    sub_100007E94((const void **)&theString);
  }
  v16 = (id *)&UTTypeZIP;
  switch(a5)
  {
    case 0uLL:
      goto LABEL_24;
    case 1uLL:
      gid_t v17 = @"cpio";
      break;
    case 2uLL:
      gid_t v17 = @"cpgz";
      break;
    case 3uLL:
      gid_t v17 = @"tar";
      break;
    case 4uLL:
      v16 = (id *)&UTTypeAppleArchive;
      goto LABEL_24;
    case 5uLL:
      v16 = (id *)&_UTTypeAppleEncryptedArchive;
LABEL_24:
      gid_t v17 = [*v16 preferredFilenameExtension];
      break;
    default:
      gid_t v17 = 0;
      break;
  }
  v18 = v23;
  v19 = [(__CFString *)v18 stringByAppendingPathExtension:v17];
  if (v23 != v19) {
    TString::SetStringRefAsImmutable((CFTypeRef *)&v23, v19);
  }

  id v20 = [(DSArchiveExportedService *)self _createUniquePlaceholderWithName:v23 inFolder:v11 asFolder:0 isArchiving:1 error:a6];

  sub_100007E94((const void **)&v23);
  return v20;
}

- (id)_createUnarchivePlaceholderForDescriptors:(id)a3 describingArchive:(id)a4 inFolder:(id)a5 hasMultipleTopLevelItems:(BOOL *)a6 placeholderIsFolder:(BOOL *)a7 error:(id *)a8
{
  v35 = self;
  id v11 = a3;
  v40 = (__CFString *)a4;
  id v39 = a5;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (!v12)
  {

    goto LABEL_37;
  }
  char v41 = 0;
  v42 = 0;
  char v37 = 0;
  id v44 = v12;
  uint64_t v45 = *(void *)v52;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v52 != v45) {
        objc_enumerationMutation(obj);
      }
      unsigned __int8 v14 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v13);
      uid_t v15 = [v14 filePath];
      v16 = [v15 pathComponents];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v17 = v16;
      id v18 = [v17 countByEnumeratingWithState:&v47 objects:v58 count:16];
      if (!v18)
      {
LABEL_17:

        id v22 = 0;
LABEL_18:
        int v23 = 1;
        goto LABEL_19;
      }
      uint64_t v19 = *(void *)v48;
LABEL_8:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v48 != v19) {
          objc_enumerationMutation(v17);
        }
        int v21 = *(void **)(*((void *)&v47 + 1) + 8 * v20);
        if ((objc_msgSend(v21, "isEqualToString:", @"/", v35) & 1) == 0
          && ([v21 isEqualToString:@"."] & 1) == 0)
        {
          break;
        }
        if (v18 == (id)++v20)
        {
          id v18 = [v17 countByEnumeratingWithState:&v47 objects:v58 count:16];
          if (v18) {
            goto LABEL_8;
          }
          goto LABEL_17;
        }
      }
      if ([v21 isEqualToString:@".."]) {
        goto LABEL_17;
      }
      id v22 = v21;

      if (!v22) {
        goto LABEL_18;
      }
      if (!v42)
      {
        id v24 = v22;
        v41 |= (unint64_t)[v17 count] > 1;
        v42 = v24;
        id v22 = v24;
        goto LABEL_18;
      }
      if ([v42 isEqualToString:v22]) {
        goto LABEL_18;
      }
      int v23 = 0;
      char v37 = 1;
LABEL_19:

      if (!v23) {
        goto LABEL_28;
      }
      uint64_t v13 = (char *)v13 + 1;
    }
    while (v13 != v44);
    id v25 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
    id v44 = v25;
  }
  while (v25);
LABEL_28:

  if (v42)
  {
    if (a6) {
      *a6 = v37 & 1;
    }
    if (v37)
    {
      uint64_t v26 = [(__CFString *)v40 lastPathComponent];
      id v27 = [v26 stringByDeletingPathExtension];

      id v28 = [v27 pathExtension];
      if (![v28 caseInsensitiveCompare:@"tar"]
        || ![v28 caseInsensitiveCompare:@"cpio"])
      {
        uint64_t v29 = objc_msgSend(v27, "stringByDeletingPathExtension", v35);

        id v27 = (id)v29;
      }

      char v41 = 1;
    }
    else
    {
      id v27 = v42;
    }
    if (a7) {
      *a7 = v41 & 1;
    }
    v33 = -[DSArchiveExportedService _createUniquePlaceholderWithName:inFolder:asFolder:isArchiving:error:](v35, "_createUniquePlaceholderWithName:inFolder:asFolder:isArchiving:error:", v27, v39, v41 & 1, 0, a8, v35);
    goto LABEL_46;
  }
LABEL_37:
  v57[0] = v40;
  v56[0] = NSURLErrorKey;
  v56[1] = NSLocalizedDescriptionKey;
  TCFURLInfo::LocalizedStringWithFileName(@"ArchiveIsEmpty", v40, (CFTypeRef *)buf);
  id v30 = *(id *)buf;
  v57[1] = v30;
  v42 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];

  sub_100007E94((const void **)buf);
  id v27 = +[NSError errorWithDomain:@"com.apple.desktopservices.ArchiveService" code:-1001 userInfo:v42];
  v31 = LogObj(0);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    v32 = SanitizedURL((NSURL *)v40);
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "No top level items in %{public}@", buf, 0xCu);
  }
  if (a8)
  {
    id v27 = v27;
    v33 = 0;
    *a8 = v27;
  }
  else
  {
    v33 = 0;
  }
LABEL_46:

  return v33;
}

- (id)archiveItemsWithURLWrappers:(id)a3 toURLWrapper:(id)a4 options:(unint64_t)a5 compressionFormat:(unint64_t)a6 passphrase:(id)a7 completionHandler:(id)a8
{
  unint64_t v13 = a5 & 1;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100014088;
  v17[3] = &unk_10002D088;
  id v18 = a8;
  id v14 = v18;
  uid_t v15 = [(DSArchiveExportedService *)self archiveItemsWithURLWrappers:a3 passphrase:a7 addToKeychain:v13 compressionFormat:a6 destinationFolderURLWrapper:a4 usePlaceholder:1 completionHandler:v17];

  return v15;
}

- (id)archiveItemsWithURLWrappers:(id)a3 passphrase:(id)a4 addToKeychain:(BOOL)a5 compressionFormat:(unint64_t)a6 destinationFolderURLWrapper:(id)a7 usePlaceholder:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v9 = a8;
  id v14 = a4;
  id v15 = a7;
  id v16 = a9;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_10001441C;
  v39[4] = sub_10001442C;
  id v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = sub_10001441C;
  v37[4] = sub_10001442C;
  id v38 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100014434;
  v28[3] = &unk_10002D0D8;
  BOOL v35 = v9;
  v32 = v37;
  v28[4] = self;
  id v29 = v15;
  unint64_t v34 = a6;
  v33 = v39;
  id v30 = v14;
  id v31 = v16;
  BOOL v36 = a5;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100014A2C;
  v23[3] = &unk_10002D100;
  uint64_t v26 = v37;
  id v27 = v39;
  id v24 = v29;
  id v25 = v31;
  id v17 = v29;
  id v18 = v31;
  id v19 = v14;
  uint64_t v20 = [(DSArchiveExportedService *)self performActionOfKind:0 onResourcesWithURLWrappers:a3 clientDestinationFolderURLWrapper:v17 calledFromLegacyAPI:!v9 actionHandler:v28 completionHandler:v23];

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  return v20;
}

- (id)unarchiveItemWithURLWrapper:(id)a3 toURLWrapper:(id)a4 options:(unint64_t)a5 passphrases:(id)a6 acceptedFormats:(unint64_t)a7 completionHandler:(id)a8
{
  unint64_t v13 = (a5 >> 20) & 1;
  unint64_t v14 = a5 & 1;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100015014;
  v19[3] = &unk_10002D128;
  id v20 = a8;
  id v15 = v20;
  LOBYTE(v18) = 1;
  id v16 = [(DSArchiveExportedService *)self unarchiveItemWithURLWrapper:a3 passphrases:a6 addToKeychain:v14 destinationFolderURLWrapper:a4 acceptedFormats:a7 exportsStreamingReceiver:v13 usePlaceholder:v18 completionHandler:v19];

  return v16;
}

- (id)unarchiveItemWithURLWrapper:(id)a3 passphrases:(id)a4 addToKeychain:(BOOL)a5 destinationFolderURLWrapper:(id)a6 acceptedFormats:(unint64_t)a7 exportsStreamingReceiver:(BOOL)a8 usePlaceholder:(BOOL)a9 completionHandler:(id)a10
{
  BOOL v10 = a8;
  id v16 = a3;
  id v17 = a4;
  id v30 = a6;
  id v31 = a10;
  uint64_t v18 = +[NSXPCConnection currentConnection];
  dispatch_group_t v29 = dispatch_group_create();
  id v27 = v18;
  if (v10)
  {
    id v19 = [v18 remoteObjectProxy];
  }
  else
  {
    id v19 = 0;
  }
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = sub_10001441C;
  v66[4] = sub_10001442C;
  id v67 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  char v65 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  int v63 = -1;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = sub_10001441C;
  v60[4] = sub_10001442C;
  id v61 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = sub_10001441C;
  v58[4] = sub_10001442C;
  id v59 = 0;
  v56[0] = 0;
  v56[1] = v56;
  void v56[2] = 0x3032000000;
  v56[3] = sub_10001441C;
  v56[4] = sub_10001442C;
  id v57 = 0;
  id v68 = v16;
  id v20 = +[NSArray arrayWithObjects:&v68 count:1];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000155F0;
  v41[3] = &unk_10002D178;
  long long v47 = v60;
  long long v48 = v62;
  id v28 = v19;
  id v42 = v28;
  v43 = self;
  BOOL v54 = a9;
  unint64_t v53 = a7;
  id v26 = v17;
  id v44 = v26;
  long long v49 = v58;
  id v21 = v30;
  id v45 = v21;
  long long v50 = v64;
  long long v51 = v66;
  long long v52 = v56;
  BOOL v55 = a5;
  NSErrorUserInfoKey v46 = v29;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100015F04;
  v32[3] = &unk_10002D1F0;
  BOOL v36 = v66;
  char v37 = v58;
  id v38 = v62;
  id v22 = v46;
  v33 = v22;
  unint64_t v34 = self;
  id v23 = v31;
  id v35 = v23;
  id v39 = v60;
  id v40 = v64;
  id v24 = -[DSArchiveExportedService performActionOfKind:onResourcesWithURLWrappers:clientDestinationFolderURLWrapper:calledFromLegacyAPI:actionHandler:completionHandler:](self, "performActionOfKind:onResourcesWithURLWrappers:clientDestinationFolderURLWrapper:calledFromLegacyAPI:actionHandler:completionHandler:", 1, v20, v21, !a9, v41, v32, v19);

  _Block_object_dispose(v56, 8);
  _Block_object_dispose(v58, 8);

  _Block_object_dispose(v60, 8);
  _Block_object_dispose(v62, 8);
  _Block_object_dispose(v64, 8);
  _Block_object_dispose(v66, 8);

  return v24;
}

- (void)_cancel
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_cancelled = 1;
  objc_sync_exit(obj);
}

- (BOOL)_isCancelled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL cancelled = v2->_cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (id)_quarantineDataFromArchiveFD:(int)a3 url:(id)a4 error:(id *)a5
{
  v5 = +[NSData data];
  return v5;
}

- (id)_archiveDecryptionError
{
  return +[NSError errorWithDomain:@"com.apple.desktopservices.ArchiveService" code:-1000 userInfo:0];
}

- (id)_errorForAppleArchive:(int)a3 itemURL:(id)a4
{
  __int16 v4 = a3;
  id v5 = a4;
  if ((v4 & 0x3FF) != 0) {
    uint64_t v6 = v4 & 0x3FF;
  }
  else {
    uint64_t v6 = 22;
  }
  BOOL v7 = strerror(v6);
  if (v7)
  {
    BOOL v8 = +[NSString stringWithUTF8String:v7];
  }
  else
  {
    BOOL v8 = 0;
  }
  BOOL v9 = +[NSError ds_errorWithPOSIXCode:v6 itemURL:v5 debugDescription:v8];

  return v9;
}

- (id)_errorForArchive:(archive *)a3 itemURL:(id)a4
{
  id v5 = a4;
  unsigned int v6 = archive_errno();
  if (v6 == -1 && archive_read_has_encrypted_entries() == 1)
  {
    BOOL v7 = [(DSArchiveExportedService *)self _archiveDecryptionError];
  }
  else
  {
    uint64_t v8 = archive_error_string();
    if (v8)
    {
      BOOL v9 = +[NSString stringWithUTF8String:v8];
    }
    else
    {
      BOOL v9 = 0;
    }
    if (v6 == -1) {
      uint64_t v10 = 94;
    }
    else {
      uint64_t v10 = v6;
    }
    BOOL v7 = +[NSError ds_errorWithPOSIXCode:v10 itemURL:v5 debugDescription:v9];
  }
  return v7;
}

- (id)_temporaryURLAppropriateForURL:(id)a3 calledFromLegacyAPI:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  BOOL v9 = [(DSArchiveExportedService *)self __temporaryURLAppropriateForURL:v8 calledFromLegacyAPI:v6 error:a5];
  if (realpath_DARWIN_EXTSN([(NSURL *)v9 fileSystemRepresentation], v15))
  {
    +[NSURL fileURLWithFileSystemRepresentation:v15 isDirectory:[(NSURL *)v9 hasDirectoryPath] relativeToURL:0];
    p_super = &v9->super;
    BOOL v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    p_super = LogObj(0);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      id v11 = SanitizedURL(v9);
      int v13 = 138543362;
      unint64_t v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "Couldn't fetch realpath for %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }

  return v9;
}

- (id)__temporaryURLAppropriateForURL:(id)a3 calledFromLegacyAPI:(BOOL)a4 error:(id *)a5
{
  id v7 = a3;
  if (v7)
  {
    id v8 = v7;
    if (!a4)
    {
      id v35 = 0;
      id v34 = 0;
      unsigned __int8 v9 = [v7 getResourceValue:&v35 forKey:NSURLIsDirectoryKey error:&v34];
      id v10 = v35;
      id v11 = v34;
      if ((v9 & 1) == 0)
      {
        id v12 = LogObj(0);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v37 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Couldn't get isDir property: %@", buf, 0xCu);
        }
      }
      if ([v10 BOOLValue])
      {
        uint64_t v13 = [v8 URLByAppendingPathComponent:@".ArchiveServiceTemp" isDirectory:1];

        id v8 = (void *)v13;
      }
    }
    unint64_t v14 = +[NSFileManager defaultManager];
    id v15 = [v14 URLForDirectory:99 inDomain:1 appropriateForURL:v8 create:1 error:a5];
  }
  else
  {
    id v16 = NSTemporaryDirectory();
    id v17 = +[NSURL fileURLWithPath:v16];

    if (v17)
    {
      uint64_t v18 = [v17 URLByAppendingPathComponent:@"Archiving__XXXXXX"];

      id v19 = v18;
      id v20 = strdup((const char *)[v19 fileSystemRepresentation]);
      if (v20)
      {
        id v21 = v20;
        id v22 = mkdtemp(v20);
        if (v22)
        {
          id v23 = +[NSURL fileURLWithFileSystemRepresentation:v22 isDirectory:1 relativeToURL:0];
          id v24 = +[NSFileManager defaultManager];
          unsigned __int8 v25 = [v24 createDirectoryAtURL:v23 withIntermediateDirectories:1 attributes:0 error:a5];

          free(v21);
          if (v25) {
            id v15 = v23;
          }
          else {
            id v15 = 0;
          }

          goto LABEL_33;
        }
        id v30 = +[NSError ds_errorWithPOSIXCode:*__error() itemURL:v19 debugDescription:@"Couldn't create temporary directory"];
        id v31 = v30;
        if (a5) {
          *a5 = v30;
        }
        v32 = LogObj(0);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v37 = v31;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Couldn't create temporary directory: %@", buf, 0xCu);
        }

        free(v21);
      }
      else
      {
        id v27 = +[NSError ds_errorWithPOSIXCode:*__error() itemURL:v19 debugDescription:@"Couldn't copy temporary directory name"];
        id v28 = v27;
        if (a5) {
          *a5 = v27;
        }
        dispatch_group_t v29 = LogObj(0);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v37 = v28;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Couldn't copy temporary directory name: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v26 = LogObj(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Couldn't get temporary directory", buf, 2u);
      }

      if (a5)
      {
        +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
        id v15 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
    }
    id v15 = 0;
  }
LABEL_33:
  return v15;
}

- (void)_cleanupWithResult:(id)a3 error:(id)a4 securityScopedURLs:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  id v10 = (void (**)(id, id, id))a6;
  v10[2](v10, a3, a4);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      unint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v14), "stopAccessingSecurityScopedResource", (void)v15);
        unint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (id)performActionOfKind:(unint64_t)a3 onResourcesWithURLWrappers:(id)a4 clientDestinationFolderURLWrapper:(id)a5 calledFromLegacyAPI:(BOOL)a6 actionHandler:(id)a7 completionHandler:(id)a8
{
  id v41 = a4;
  id v39 = a5;
  id v37 = a7;
  id v40 = a8;
  uint64_t v13 = objc_opt_new();
  unint64_t v14 = sub_100014984();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017CF4;
  block[3] = &unk_10002D240;
  id v57 = self;
  unint64_t v58 = a3;
  id v38 = v13;
  id v56 = v38;
  dispatch_async(v14, block);

  long long v15 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v41 count]);
  long long v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v41 count]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v17 = (NSURL *)v41;
  id v18 = [(NSURL *)v17 countByEnumeratingWithState:&v51 objects:v65 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v52;
LABEL_3:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v52 != v19) {
        objc_enumerationMutation(v17);
      }
      id v21 = [*(id *)(*((void *)&v51 + 1) + 8 * v20) url];
      id v22 = v21;
      if (!v21) {
        break;
      }
      if (([v21 startAccessingSecurityScopedResource] & 1) == 0)
      {
        NSErrorUserInfoKey v63 = NSURLErrorKey;
        v64 = v22;
        id v30 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        goto LABEL_14;
      }
      [v15 addObject:v22];
      id v23 = +[NSFileAccessIntent readingIntentWithURL:v22 options:0x20000];
      [v16 addObject:v23];

      if (v18 == (id)++v20)
      {
        id v18 = [(NSURL *)v17 countByEnumeratingWithState:&v51 objects:v65 count:16];
        if (v18) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v30 = 0;
LABEL_14:
    id v31 = +[NSError errorWithDomain:NSCocoaErrorDomain code:257 userInfo:v30];
    [(DSArchiveExportedService *)self _cleanupWithResult:0 error:v31 securityScopedURLs:v15 completionHandler:v40];

    id v29 = 0;
    id v24 = v17;
    goto LABEL_18;
  }
LABEL_10:

  id v24 = [v39 url];
  if ([(NSURL *)v24 startAccessingSecurityScopedResource])
  {
    [v15 addObject:v24];
    unsigned __int8 v25 = objc_opt_new();
    operationQueue = self->_operationQueue;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100017E6C;
    v42[3] = &unk_10002D268;
    id v43 = v16;
    id v44 = self;
    id v45 = v15;
    id v48 = v40;
    id v27 = v24;
    NSErrorUserInfoKey v46 = v27;
    BOOL v50 = a6;
    id v49 = v37;
    id v28 = v38;
    id v47 = v28;
    [v25 coordinateAccessWithIntents:v43 queue:operationQueue byAccessor:v42];

    id v29 = v28;
    id v22 = v43;
    id v24 = v27;
  }
  else
  {
    v32 = LogObj(0);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = SanitizedURL(v24);
      *(_DWORD *)buf = 138543362;
      v62 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Couldn't access the destination folder %{public}@", buf, 0xCu);
    }
    NSErrorUserInfoKey v59 = NSURLErrorKey;
    v60 = v24;
    id v22 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    id v34 = +[NSError errorWithDomain:NSCocoaErrorDomain code:257 userInfo:v22];
    [(DSArchiveExportedService *)self _cleanupWithResult:0 error:v34 securityScopedURLs:v15 completionHandler:v40];

    id v29 = 0;
  }
LABEL_18:

  return v29;
}

- (BOOL)_getIsDirectoryProperty:(BOOL *)a3 forItemURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v16 = 0;
  id v15 = 0;
  unsigned __int8 v8 = [v7 getResourceValue:&v16 forKey:NSURLIsDirectoryKey error:&v15];
  id v9 = v16;
  id v10 = v15;
  if ((v8 & 1) == 0)
  {
    id v12 = LogObj(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to get isDirectory info: %@", buf, 0xCu);
    }

    if (a5)
    {
      BOOL v11 = 0;
      *a5 = v10;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_11;
  }
  if (!v9)
  {
    if (a5)
    {
      NSErrorUserInfoKey v17 = NSURLErrorKey;
      id v18 = v7;
      uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v13];
    }
    goto LABEL_10;
  }
  *a3 = [v9 BOOLValue];
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (id)_replacePathComponent:(id)a3 withComponent:(id)a4 inFilePath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v11 = [v9 rangeOfString:v7];
  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", v11, v10, v8);

    id v9 = (id)v12;
  }

  return v9;
}

- (BOOL)_createMetadataFileWithAppleDoubleFormatOfItemURL:(id)a3 destinationURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  uint64_t v10 = (const char *)[v9 fileSystemRepresentation];
  id v11 = v8;
  int v12 = copyfile(v10, (const char *)[v11 fileSystemRepresentation], 0, 0x4C0005u);
  if (v12)
  {
    uint64_t v13 = +[NSError ds_errorWithPOSIXCode:*__error() itemURL:v9 debugDescription:@"Couldn't set extended attributes / ACLs"];
    unint64_t v14 = v13;
    if (a5) {
      *a5 = v13;
    }
    id v15 = LogObj(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Couldn't set extended attributes / ACLs: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  return v12 == 0;
}

- (id)_sanitizedPathWithCString:(const char *)a3 length:(unint64_t)a4
{
  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v15[0] = &__kCFBooleanTrue;
    v14[0] = NSStringEncodingDetectionAllowLossyKey;
    v14[1] = NSStringEncodingDetectionSuggestedEncodingsKey;
    id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[NSString defaultCStringEncoding]);
    uint64_t v13 = v7;
    id v8 = +[NSArray arrayWithObjects:&v13 count:1];
    v15[1] = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

    uint64_t v10 = +[NSData dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
    id v12 = 0;
    +[NSString stringEncodingForData:v10 encodingOptions:v9 convertedString:&v12 usedLossyConversion:0];
    id v6 = v12;

    if (!v6)
    {
      id v6 = +[NSString stringWithCString:a3 encoding:1];
    }
  }
  return v6;
}

- (BOOL)_enumerateItemURL:(id)a3 itemActionBlock:(id)a4 error:(id *)a5
{
  id v9 = a3;
  v32 = (uint64_t (**)(id, void *, void, id *))a4;
  unsigned __int8 v36 = 0;
  id v29 = v9;
  id v33 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v9, 0);
  id v7 = 0;
  id v8 = 0;
  int v31 = 0;
  LOBYTE(v9) = 1;
  while (![(DSArchiveExportedService *)self _isCancelled]
       && (v9 & 1) != 0
       && [v33 count])
  {
    id v11 = [v33 firstObject];

    [v33 removeObjectAtIndex:0];
    id v35 = v8;
    LODWORD(v9) = [(DSArchiveExportedService *)self _getIsDirectoryProperty:&v36 forItemURL:v11 error:&v35];
    id v12 = v35;

    if (!v9) {
      goto LABEL_30;
    }
    id v34 = v12;
    char v13 = v32[2](v32, v11, v36, &v34);
    id v8 = v34;

    if (v13)
    {
      if (v36)
      {
        id v14 = v11;
        id v15 = opendir((const char *)[v14 fileSystemRepresentation]);
        if (!v15)
        {
          id v12 = +[NSError ds_errorWithPOSIXCode:*__error() itemURL:v14 debugDescription:@"Couldn't open file"];

          unsigned __int8 v25 = LogObj(0);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v38 = v12;
            id v26 = v25;
            id v27 = "Couldn't open file: %@";
LABEL_28:
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);
          }
LABEL_29:

          LOBYTE(v9) = 0;
LABEL_30:
          int v23 = 1;
          id v8 = v12;
          goto LABEL_31;
        }
        char v16 = 0;
        *__error() = 0;
        while (1)
        {
          int v17 = readdir(v15);
          if (!v17 || [(DSArchiveExportedService *)self _isCancelled]) {
            break;
          }
          if (strcmp(v17->d_name, "."))
          {
            if (strcmp(v17->d_name, ".."))
            {
              unsigned int d_type = v17->d_type;
              if (d_type <= 0xA && ((1 << d_type) & 0x510) != 0)
              {
                id v20 = [objc_alloc((Class)NSURL) initFileURLWithFileSystemRepresentation:v17->d_name isDirectory:d_type == 4 relativeToURL:v14];
                id v21 = [v20 lastPathComponent];
                id v22 = [v14 URLByAppendingPathComponent:v21 isDirectory:d_type == 4];
                [v33 addObject:v22];
              }
            }
          }
          char v16 = 1;
        }
        if ((v16 & 1) == 0 && ![(DSArchiveExportedService *)self _isCancelled]) {
          int v31 = *__error();
        }
        int v24 = closedir(v15);
        if (v31)
        {
          +[NSError ds_errorWithPOSIXCode:itemURL:debugDescription:](NSError, "ds_errorWithPOSIXCode:itemURL:debugDescription:");
          id v12 = (id)objc_claimAutoreleasedReturnValue();

          unsigned __int8 v25 = LogObj(0);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v38 = v12;
            id v26 = v25;
            id v27 = "Couldn't read directory content: %@";
            goto LABEL_28;
          }
          goto LABEL_29;
        }
        if (v24 == -1)
        {
          id v12 = +[NSError ds_errorWithPOSIXCode:*__error() itemURL:v14 debugDescription:@"Couldn't close directory content"];

          unsigned __int8 v25 = LogObj(0);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v38 = v12;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Couldn't close directory content: %@", buf, 0xCu);
          }
          int v31 = 0;
          goto LABEL_29;
        }
        int v23 = 0;
        int v31 = 0;
      }
      else
      {
        int v23 = 0;
      }
      LOBYTE(v9) = 1;
    }
    else
    {
      LOBYTE(v9) = 0;
      int v23 = 1;
    }
LABEL_31:
    id v7 = v11;
    if (v23) {
      goto LABEL_39;
    }
  }
  id v11 = v7;
LABEL_39:
  if (a5 && (v9 & 1) == 0) {
    *a5 = v8;
  }

  return v9 & 1;
}

- (BOOL)_writeOnArchiveEntryAtPath:(const char *)a3 entry:(archive_entry *)a4 archive:(archive *)a5 writeProgressHandler:(id)a6 error:(id *)a7
{
  uint64_t v7 = __chkstk_darwin(self, a2, a3, a4, a5, a6, a7);
  id v9 = v8;
  uint64_t v11 = v10;
  char v13 = v12;
  id v14 = (void *)v7;
  char v16 = (void (**)(id, void))v15;
  int v17 = open(v13, 33028);
  if (v17 < 0)
  {
    uint64_t v20 = *__error();
    id v21 = +[NSURL fileURLWithFileSystemRepresentation:v13 isDirectory:0 relativeToURL:0];
    id v22 = +[NSError ds_errorWithPOSIXCode:v20 itemURL:v21 debugDescription:@"Couldn't open the file"];

    if (v9) {
      *id v9 = v22;
    }
    int v23 = LogObj(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v35 = 138412290;
      id v36 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Couldn't open the file: %@", (uint8_t *)&v35, 0xCu);
    }
  }
  else
  {
    while (1)
    {
      if ([v14 _isCancelled]) {
        goto LABEL_13;
      }
      ssize_t v18 = read(v17, v37, 0x2000uLL);
      ssize_t v19 = v18;
      if (v18 < 1) {
        break;
      }
      if (archive_write_data() == -1)
      {
        uint64_t v25 = archive_errno();
        int v24 = 0;
        goto LABEL_16;
      }
      if (v16) {
        v16[2](v16, v19);
      }
    }
    if (v18 != -1)
    {
LABEL_13:
      int v24 = 0;
      uint64_t v25 = 0;
      goto LABEL_16;
    }
    uint64_t v25 = *__error();
    int v24 = 1;
LABEL_16:
    int v26 = close(v17);
    if (v25)
    {
      if (v24)
      {
        id v27 = +[NSURL fileURLWithFileSystemRepresentation:v13 isDirectory:0 relativeToURL:0];
        id v22 = +[NSError ds_errorWithPOSIXCode:v25 itemURL:v27 debugDescription:@"Couldn't read the file"];

        id v28 = LogObj(0);
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        int v35 = 138412290;
        id v36 = v22;
        id v29 = "Couldn't read the file: %@";
      }
      else
      {
        v32 = +[NSURL fileURLWithFileSystemRepresentation:v13 isDirectory:0 relativeToURL:0];
        id v22 = [v14 _errorForArchive:v11 itemURL:v32];

        id v28 = LogObj(0);
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        int v35 = 138412290;
        id v36 = v22;
        id v29 = "Couldn't write the file to the archive: %@";
      }
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v29, (uint8_t *)&v35, 0xCu);
LABEL_29:

      if (v9)
      {
        id v22 = v22;
        *id v9 = v22;
      }
      goto LABEL_31;
    }
    if (!v26)
    {
      BOOL v33 = 1;
      goto LABEL_32;
    }
    uint64_t v30 = *__error();
    int v31 = +[NSURL fileURLWithFileSystemRepresentation:v13 isDirectory:0 relativeToURL:0];
    id v22 = +[NSError ds_errorWithPOSIXCode:v30 itemURL:v31 debugDescription:@"Couldn't close the file"];

    if (v9) {
      *id v9 = v22;
    }
    int v23 = LogObj(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v35 = 138412290;
      id v36 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Couldn't close the file: %@", (uint8_t *)&v35, 0xCu);
    }
  }

LABEL_31:
  BOOL v33 = 0;
LABEL_32:

  return v33;
}

- (BOOL)_archiveItemURL:(id)a3 itemArchivePath:(id)a4 isDirectory:(BOOL)a5 archive:(archive *)a6 entry:(archive_entry *)a7 stat:(stat *)a8 writeProgressHandler:(id)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v33 = a9;
  id v18 = v16;
  ssize_t v19 = (const char *)[v18 fileSystemRepresentation];
  uint64_t v20 = v19;
  if (a8)
  {
    archive_entry_copy_stat();
    mode_t st_mode = a8->st_mode;
  }
  else
  {
    if (lstat(v19, buf))
    {
      id v28 = +[NSError ds_errorWithPOSIXCode:*__error() itemURL:v18 debugDescription:@"Couldn't get info from the file"];
      id v29 = v28;
      if (a10) {
        *a10 = v28;
      }
      uint64_t v30 = LogObj(0);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v35 = 138412290;
        id v36 = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Couldn't get info from the file: %@", v35, 0xCu);
      }
      goto LABEL_26;
    }
    archive_entry_copy_stat();
    mode_t st_mode = buf[0].st_mode;
  }
  [v17 fileSystemRepresentation];
  archive_entry_set_pathname();
  int v22 = st_mode & 0xF000;
  if (v22 == 40960)
  {
    ssize_t v23 = readlink(v20, (char *)buf, 0x3FFuLL);
    if (v23 != -1)
    {
      *((unsigned char *)&buf[0].st_dev + v23) = 0;
      archive_entry_set_symlink();
      goto LABEL_6;
    }
    int v31 = +[NSError ds_errorWithPOSIXCode:*__error() itemURL:v18 debugDescription:@"readlink failed"];
    id v29 = v31;
    if (a10) {
      *a10 = v31;
    }
    uint64_t v30 = LogObj(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v35 = 138412290;
      id v36 = v29;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Couldn't get symlink target from the file: %@", v35, 0xCu);
    }
LABEL_26:

    BOOL v27 = 0;
    goto LABEL_27;
  }
LABEL_6:
  if (archive_write_header())
  {
    int v24 = [(DSArchiveExportedService *)self _errorForArchive:a6 itemURL:v18];
    uint64_t v25 = v24;
    if (a10) {
      *a10 = v24;
    }
    int v26 = LogObj(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      buf[0].st_dev = 138412290;
      *(void *)&buf[0].mode_t st_mode = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Couldn't write the header on the archive of the entry: %@", (uint8_t *)buf, 0xCu);
    }

    BOOL v27 = 0;
  }
  else
  {
    BOOL v27 = 1;
    if (!a5 && v22 != 40960) {
      BOOL v27 = [(DSArchiveExportedService *)self _writeOnArchiveEntryAtPath:v20 entry:a7 archive:a6 writeProgressHandler:v33 error:a10];
    }
  }
  archive_entry_clear();
LABEL_27:

  return v27;
}

- (BOOL)_writeXattrEntryForURL:(id)a3 compressionFormat:(unint64_t)a4 archive:(archive *)a5 entry:(archive_entry *)a6 archiveURL:(id)a7 commonParentPath:(id)a8 stat:(stat *)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a7;
  id v39 = a8;
  if ((a9->st_mode & 0xF000) != 0xA000)
  {
    id v18 = v16;
    if ((copyfile((const char *)[v18 fileSystemRepresentation], 0, 0, 0x10005u) & 5) != 0)
    {
      id v38 = [v17 URLByDeletingLastPathComponent];
      ssize_t v19 = +[NSUUID UUID];
      uint64_t v20 = [v19 UUIDString];
      id v21 = [v38 URLByAppendingPathComponent:v20 isDirectory:0];

      id v37 = v21;
      if (v21)
      {
        id v36 = v18;
        [v18 URLByDeletingLastPathComponent];
        if (a4) {
          int v22 = {;
        }
          ssize_t v23 = [v22 path];
          id v21 = [v23 stringByAppendingString:@"/"];

          int v24 = [(DSArchiveExportedService *)self _replacePathComponent:v39 withComponent:&stru_10002D5A8 inFilePath:v21];
          uint64_t v25 = [v18 lastPathComponent];
          int v26 = [v24 stringByAppendingFormat:@"._%@", v25];
        }
        else {
          id v28 = {;
        }
          id v29 = [v28 path];
          id v21 = [v29 stringByAppendingString:@"/"];

          uint64_t v25 = [@"__MACOSX" stringByAppendingString:@"/"];
          uint64_t v30 = [(DSArchiveExportedService *)self _replacePathComponent:v39 withComponent:v25 inFilePath:v21];
          int v24 = [v36 lastPathComponent];
          int v26 = [v30 stringByAppendingFormat:@"._%@", v24];
        }
        if ([(DSArchiveExportedService *)self _createMetadataFileWithAppleDoubleFormatOfItemURL:v36 destinationURL:v37 error:a10]&& [(DSArchiveExportedService *)self _archiveItemURL:v37 itemArchivePath:v26 isDirectory:0 archive:a5 entry:a6 stat:0 writeProgressHandler:0 error:a10])
        {
          int v31 = v37;
          id v32 = v37;
          if (!unlink((const char *)[v32 fileSystemRepresentation]))
          {

            BOOL v27 = 1;
            goto LABEL_16;
          }
          if (a10)
          {
            uint64_t v33 = *__error();
            NSErrorUserInfoKey v40 = NSURLErrorKey;
            id v41 = v32;
            id v34 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
            *a10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v33 userInfo:v34];
          }
LABEL_15:

          BOOL v27 = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {
        int v26 = 0;
      }
      int v31 = v37;
      goto LABEL_15;
    }
  }
  BOOL v27 = 1;
LABEL_17:

  return v27;
}

- (BOOL)_createAppleArchiveOfItemURLs:(id)a3 passphrase:(id)a4 addToKeychain:(BOOL)a5 compressionFormat:(unint64_t)a6 archiveURL:(id)a7 archiveFD:(int)a8 progress:(id)a9 error:(id *)a10
{
  BOOL v46 = a5;
  id v13 = a3;
  id v49 = a4;
  id v50 = a7;
  long long v51 = v13;
  id v52 = a9;
  id v14 = +[NSString ds_commonParentPathForItemURLs:v13];
  if (!v14)
  {
    BOOL v27 = LogObj(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      LOWORD(msg_data) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Couldn't fetch common parent", (uint8_t *)&msg_data, 2u);
    }

    if (a10)
    {
      +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      LOBYTE(v26) = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    }
LABEL_22:
    LOBYTE(v26) = 0;
    goto LABEL_59;
  }
  AEAContext context = 0;
  stream = [(DSArchiveExportedService *)self _openAppleArchiveWriteStreamWithArchiveURL:v50 itemURLs:v13 progress:v52 passphrase:v49 aeaContext:&context compressionFormat:a6 error:a10];
  if (!stream) {
    goto LABEL_22;
  }
  path_list = (AAPathList_impl *)AAPathListCreate();
  AAThreadErrorContextEnter();
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v13;
  id v15 = [obj countByEnumeratingWithState:&v60 objects:v81 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v61;
LABEL_5:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v61 != v16) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(void **)(*((void *)&v60 + 1) + 8 * v17);
      if ([(DSArchiveExportedService *)self _isCancelled]) {
        goto LABEL_16;
      }
      ssize_t v19 = [v18 path];
      uint64_t v20 = [(DSArchiveExportedService *)self _replacePathComponent:v14 withComponent:&stru_10002D5A8 inFilePath:v19];

      id v58 = 0;
      id v59 = 0;
      unsigned __int8 v21 = [v18 getResourceValue:&v59 forKey:NSURLIsDirectoryKey error:&v58];
      id v22 = v59;
      id v23 = v58;
      if ((v21 & 1) == 0) {
        break;
      }
      if ([v22 BOOLValue])
      {
        long long msg_data = 0u;
        long long v66 = 0u;
        *((void *)&msg_data + 1) = v14;
        int v24 = AAPathListCreateWithDirectoryContents((const char *)[*((id *)&msg_data + 1) fileSystemRepresentation], (const char *)objc_msgSend(objc_retainAutorelease(v20), "fileSystemRepresentation"), &msg_data, (AAEntryMessageProc)sub_10001A4B8, 0, 0);

        if (!v24) {
          goto LABEL_31;
        }
      }
      else
      {
        int v24 = AAPathListCreateWithPath((const char *)[v14 fileSystemRepresentation], (const char *)objc_msgSend(objc_retainAutorelease(v20), "fileSystemRepresentation"));
        if (!v24)
        {
LABEL_31:
          id v32 = LogObj(0);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            uint64_t v33 = v20;
            *(void *)buf = &stru_10002D5A8;
            CFRetain(&stru_10002D5A8);
            TString::SetStringRefAsImmutable((CFTypeRef *)buf, v33);

            id v34 = SanitizedPath((id *)buf);
            LODWORD(msg_data) = 138543362;
            *(void *)((char *)&msg_data + 4) = v34;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Error building AAPathList for %{public}@", (uint8_t *)&msg_data, 0xCu);
            sub_100007E94((const void **)buf);
          }
LABEL_33:

          uint64_t v25 = 0;
          BOOL v26 = 0;
          goto LABEL_38;
        }
      }
      AAPathListMerge();
      AAPathListDestroy(v24);

      if (v15 == (id)++v17)
      {
        id v15 = [obj countByEnumeratingWithState:&v60 objects:v81 count:16];
        if (v15) {
          goto LABEL_5;
        }
        goto LABEL_16;
      }
    }
    id v32 = LogObj(0);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      LODWORD(msg_data) = 138412290;
      *(void *)((char *)&msg_data + 4) = v23;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed getting item type to generate AAPathList: %@", (uint8_t *)&msg_data, 0xCu);
    }
    goto LABEL_33;
  }
LABEL_16:

  if ([(DSArchiveExportedService *)self _isCancelled])
  {
    uint64_t v25 = 0;
    BOOL v26 = 1;
  }
  else
  {
    *(void *)&long long msg_data = self;
    id v28 = v14;
    *((void *)&msg_data + 1) = v28;
    long long v66 = (unint64_t)v52;
    uint64_t v25 = AAEncodeArchiveOutputStreamOpen(stream, &msg_data, (AAEntryMessageProc)sub_10001A4B8, 1uLL, 0);
    if (v25)
    {
      id v29 = AAFieldKeySetCreateWithString("TYP,PAT,LNK,DEV,DAT,MOD,FLG,MTM,BTM,CTM,UID,GID,CLC,HLC,XAT");
      int v30 = AAArchiveStreamWritePathList(v25, path_list, v29, (const char *)[v28 fileSystemRepresentation], 0, 0, 1uLL, 0);
      if (v30 < 0)
      {
        int v31 = LogObj(0);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Apple Archive encoding failed", buf, 2u);
        }
      }
      AAFieldKeySetDestroy(v29);
      BOOL v26 = v30 >= 0;
    }
    else
    {
      int v35 = LogObj(0);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "AAEncodeArchiveOutputStreamOpen failed", buf, 2u);
      }

      BOOL v26 = 0;
    }
  }
LABEL_38:
  id v36 = sub_100014984();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A774;
  block[3] = &unk_10002D290;
  id v56 = v52;
  dispatch_async(v36, block);

  AAPathListDestroy(path_list);
  AAArchiveStreamClose(v25);
  AAByteStreamClose(stream);
  if (!v26) {
    goto LABEL_53;
  }
  unsigned __int8 v37 = [(DSArchiveExportedService *)self _isCancelled];
  char v38 = a6 == 5 ? v37 : 1;
  if (v38) {
    goto LABEL_53;
  }
  if (!v46) {
    goto LABEL_53;
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long msg_data = 0u;
  long long v66 = 0u;
  *(void *)buf = 0;
  if (AEAContextGetFieldBlob(context, 0x12u, 0, 0x100uLL, (uint8_t *)&msg_data, (size_t *)buf)) {
    goto LABEL_53;
  }
  if (!*(void *)buf)
  {
    NSErrorUserInfoKey v40 = LogObj(0);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v54 = 0;
      id v41 = "Not adding to keychain - invalid archive identifier size";
      goto LABEL_51;
    }
LABEL_52:

    goto LABEL_53;
  }
  id v39 = v49;
  [v39 UTF8String];
  strlen((const char *)[v39 UTF8String]);
  if (AEAKeychainStoreItem())
  {
    NSErrorUserInfoKey v40 = LogObj(0);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v54 = 0;
      id v41 = "AEAKeychainStoreItem failed";
LABEL_51:
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, v41, v54, 2u);
      goto LABEL_52;
    }
    goto LABEL_52;
  }
LABEL_53:
  AEAContextDestroy(context);
  uint64_t v42 = AAThreadErrorContextLeave();
  if (a10) {
    char v43 = v26;
  }
  else {
    char v43 = 1;
  }
  if ((v43 & 1) == 0)
  {
    *a10 = [(DSArchiveExportedService *)self _errorForAppleArchive:v42 itemURL:v50];
  }

LABEL_59:
  return v26;
}

- (BOOL)_createArchiveOfItemURLs:(id)a3 compressionFormat:(unint64_t)a4 archive:(archive *)a5 entry:(archive_entry *)a6 archiveURL:(id)a7 fd:(int)a8 progress:(id)a9 error:(id *)a10
{
  id v31 = a3;
  id v34 = a7;
  id v33 = a9;
  uint64_t v49 = 0;
  id v50 = &v49;
  uint64_t v51 = 0x2020000000;
  int v52 = 0;
  switch(a4)
  {
    case 0uLL:
      int v14 = archive_write_set_format_zip();
      goto LABEL_9;
    case 1uLL:
      int v14 = archive_write_set_format_cpio();
      goto LABEL_9;
    case 2uLL:
      int v16 = archive_write_set_format_cpio();
      *((_DWORD *)v50 + 6) = v16;
      if (v16) {
        goto LABEL_10;
      }
      int v14 = archive_write_add_filter_gzip();
LABEL_9:
      *((_DWORD *)v50 + 6) = v14;
      if (v14)
      {
LABEL_10:
        uint64_t v17 = [(DSArchiveExportedService *)self _errorForArchive:a5 itemURL:v34];
        id v18 = v17;
        if (a10) {
          *a10 = v17;
        }
        ssize_t v19 = LogObj(0);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = a4;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Couldn't set %lu as ouput format: %@", buf, 0x16u);
        }

        int v15 = 0;
      }
      else
      {
        int v15 = 1;
      }
      int v20 = archive_write_open_fd();
      *((_DWORD *)v50 + 6) = v20;
      if (!v20)
      {
        if (!v15) {
          goto LABEL_36;
        }
        int v30 = +[NSString ds_commonParentPathForItemURLs:v31];
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        uint64_t v55 = 0;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id obj = v31;
        id v24 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v46;
          LOBYTE(v15) = 1;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v46 != v25) {
                objc_enumerationMutation(obj);
              }
              if ((v15 & 1) == 0) {
                goto LABEL_35;
              }
              uint64_t v27 = *(void *)(*((void *)&v45 + 1) + 8 * i);
              if ([(DSArchiveExportedService *)self _isCancelled]) {
                goto LABEL_35;
              }
              v35[0] = _NSConcreteStackBlock;
              v35[1] = 3221225472;
              v35[2] = sub_10001ACE8;
              v35[3] = &unk_10002D308;
              uint8_t v35[4] = self;
              id v36 = v30;
              uint64_t v37 = v27;
              NSErrorUserInfoKey v40 = &v49;
              unint64_t v42 = a4;
              char v43 = a5;
              id v44 = a6;
              id v38 = v34;
              id v41 = buf;
              id v39 = v33;
              LOBYTE(v15) = [(DSArchiveExportedService *)self _enumerateItemURL:v27 itemActionBlock:v35 error:a10];
            }
            id v24 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
          }
          while (v24);
        }
        else
        {
          LOBYTE(v15) = 1;
        }
LABEL_35:

        _Block_object_dispose(buf, 8);
        goto LABEL_36;
      }
      unsigned __int8 v21 = [(DSArchiveExportedService *)self _errorForArchive:a5 itemURL:v34];
      id v22 = v21;
      if (a10) {
        *a10 = v21;
      }
      id v23 = LogObj(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Couldn't open the temporary archive file: %@", buf, 0xCu);
      }

LABEL_22:
      LOBYTE(v15) = 0;
LABEL_36:
      _Block_object_dispose(&v49, 8);

      return v15 & 1;
    case 3uLL:
      int v14 = archive_write_set_format_gnutar();
      goto LABEL_9;
    default:
      if (!a10) {
        goto LABEL_22;
      }
      +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
      LOBYTE(v15) = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
  }
}

- (BOOL)_archiveFromItemURLs:(id)a3 passphrase:(id)a4 addToKeychain:(BOOL)a5 compressionFormat:(unint64_t)a6 archiveURL:(id)a7 fd:(int)a8 progress:(id)a9 error:(id *)a10
{
  BOOL v13 = a5;
  id v32 = a3;
  id v16 = a4;
  id v31 = a7;
  id v30 = a9;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  if (a6 == 5)
  {
    if (![v16 length])
    {
      if (a10)
      {
        *a10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      }
      uint64_t v17 = LogObj(0);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      id v18 = "Apple Encrypted Archive requires a passphrase.";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
LABEL_13:
      BOOL v19 = 0;
      goto LABEL_31;
    }
  }
  else if ([v16 length])
  {
    if (a10)
    {
      *a10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
    uint64_t v17 = LogObj(0);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    id v18 = "Can't archive this format with a passphrase.";
    goto LABEL_12;
  }
  unsigned int v28 = a8;
  unint64_t v29 = a6;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v17 = v32;
  id v20 = [v17 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v38;
LABEL_16:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v38 != v21) {
        objc_enumerationMutation(v17);
      }
      uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * v22);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10001B600;
      v36[3] = &unk_10002D330;
      v36[4] = v42;
      if (![(DSArchiveExportedService *)self _enumerateItemURL:v23 itemActionBlock:v36 error:a10])goto LABEL_13; {
      if ([(DSArchiveExportedService *)self _isCancelled])
      }
        break;
      if (v20 == (id)++v22)
      {
        id v20 = [v17 countByEnumeratingWithState:&v37 objects:v43 count:16];
        if (v20) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

  id v24 = sub_100014984();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B7A0;
  block[3] = &unk_10002D358;
  uint64_t v25 = v30;
  id v34 = v25;
  int v35 = v42;
  dispatch_async(v24, block);

  if ((v29 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    BOOL v19 = [(DSArchiveExportedService *)self _createAppleArchiveOfItemURLs:v17 passphrase:v16 addToKeychain:v13 compressionFormat:v29 archiveURL:v31 archiveFD:v28 progress:v25 error:a10];
  }
  else
  {
    uint64_t v26 = archive_write_new();
    BOOL v19 = [(DSArchiveExportedService *)self _createArchiveOfItemURLs:v17 compressionFormat:v29 archive:v26 entry:archive_entry_new() archiveURL:v31 fd:v28 progress:v25 error:a10];
    archive_entry_free();
    if (archive_write_close())
    {
      if (a10)
      {
        [(DSArchiveExportedService *)self _errorForArchive:v26 itemURL:v31];
        BOOL v19 = 0;
        *a10 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    archive_write_free();
  }
  uint64_t v17 = v34;
LABEL_31:

  _Block_object_dispose(v42, 8);
  return v19;
}

- (BOOL)_isAppleArchive:(id)a3
{
  uint64_t v3 = [a3 pathExtension];
  __int16 v4 = +[UTType typeWithFilenameExtension:v3];

  if ([v4 isEqual:UTTypeAppleArchive]) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [v4 isEqual:_UTTypeAppleEncryptedArchive];
  }

  return v5;
}

- (AAByteStream_impl)_openAppleArchiveWriteStreamWithArchiveURL:(id)a3 itemURLs:(id)a4 progress:(id)a5 passphrase:(id)a6 aeaContext:(AEAContext_impl *)a7 compressionFormat:(unint64_t)a8 error:(id *)a9
{
  id v13 = a3;
  id v14 = a6;
  id v15 = v13;
  id v16 = (const char *)[v15 fileSystemRepresentation];
  uint64_t v17 = (AAByteStream *)malloc_type_calloc(1uLL, 0x20uLL, 0x20040DC1BFBCFuLL);
  id v18 = AACustomByteStreamOpen();
  AACustomByteStreamSetData(v18, v17);
  AACustomByteStreamSetCloseProc(v18, (AAByteStreamCloseProc)sub_10001BC94);
  AACustomByteStreamSetCancelProc(v18, (AAByteStreamCancelProc)sub_10001BD0C);
  AACustomByteStreamSetWriteProc(v18, (AAByteStreamWriteProc)sub_10001BD1C);
  AAThreadErrorContextEnter();
  BOOL v19 = AAFileStreamOpenWithPath(v16, 1537, 0x1A4u);
  AAByteStream *v17 = v19;
  if (v19)
  {
    if (a8 == 4)
    {
      AAByteStream v20 = AACompressionOutputStreamOpen(v19, 0x801u, 0x400000uLL, 1uLL, 0);
      v17[2] = v20;
      if (!v20)
      {
        uint64_t v21 = [(DSArchiveExportedService *)self _errorForAppleArchive:AAThreadErrorContextLeave() itemURL:v15];
        uint64_t v22 = v21;
        if (a9) {
          *a9 = v21;
        }
        uint64_t v23 = LogObj(0);
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          goto LABEL_20;
        }
        int v36 = 138412290;
        long long v37 = v22;
        id v24 = "Error opening compression stream: %@";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v36, 0xCu);
LABEL_20:

        char v33 = 0;
LABEL_21:
        AAThreadErrorContextLeave();
        if ((v33 & 1) == 0)
        {
          AAByteStreamClose(v18);
          AEAContextDestroy(*a7);
          id v18 = 0;
          *a7 = 0;
        }
        goto LABEL_23;
      }
    }
    else
    {
      unsigned int v28 = AEAContextCreateWithProfile(5u);
      *a7 = v28;
      id v29 = v14;
      id v30 = (const uint8_t *)[v29 UTF8String];
      size_t v31 = strlen((const char *)[v29 UTF8String]);
      AEAContextSetFieldBlob(v28, 0x13u, 0, v30, v31);
      AEAContextSetFieldUInt(*a7, 3u, 0x801uLL);
      AEAContextSetFieldUInt(*a7, 4u, 0x400000uLL);
      AEAContextSetFieldUInt(*a7, 2u, 2uLL);
      AEAContextSetFieldUInt(*a7, 1u, 0x10000uLL);
      AAByteStream v32 = AEAEncryptionOutputStreamOpen(*v17, *a7, 1uLL, 0);
      v17[1] = v32;
      v17[3] = *a7;
      if (!v32)
      {
        id v34 = [(DSArchiveExportedService *)self _errorForAppleArchive:AAThreadErrorContextLeave() itemURL:v15];
        uint64_t v22 = v34;
        if (a9) {
          *a9 = v34;
        }
        uint64_t v23 = LogObj(0);
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          goto LABEL_20;
        }
        int v36 = 138412290;
        long long v37 = v22;
        id v24 = "Error opening encryption stream: %@";
        goto LABEL_19;
      }
    }
    char v33 = 1;
    goto LABEL_21;
  }
  uint64_t v25 = [(DSArchiveExportedService *)self _errorForAppleArchive:AAThreadErrorContextLeave() itemURL:v15];
  uint64_t v26 = v25;
  if (a9) {
    *a9 = v25;
  }
  uint64_t v27 = LogObj(0);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    int v36 = 138412290;
    long long v37 = v26;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Couldn't open the archive: %@", (uint8_t *)&v36, 0xCu);
  }

  id v18 = 0;
LABEL_23:

  return v18;
}

- (id)_passwordFromKeychainWithArchiveID:(char *)a3 archiveIDSize:(unint64_t)a4
{
  memset(v9, 0, sizeof(v9));
  uint64_t v8 = 0;
  if (AEAKeychainLoadItem() == 1)
  {
    __int16 v4 = +[NSString stringWithUTF8String:v9];
  }
  else
  {
    unsigned __int8 v5 = LogObj(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "archive not found in keychain", v7, 2u);
    }

    __int16 v4 = 0;
  }
  return v4;
}

- (AAByteStream_impl)_openAppleArchiveReadStreamWithFD:(int)a3 url:(id)a4 progress:(id)a5 passphrases:(id)a6 addToKeychain:(BOOL)a7 aeaContext:(AEAContext_impl *)a8 formats:(unint64_t)a9 error:(id *)a10
{
  BOOL v59 = a7;
  long long v63 = (NSURL *)a4;
  id v61 = a5;
  id v62 = a6;
  if ((a9 & 1) == 0)
  {
    id v14 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:79 userInfo:0];
    id v15 = v14;
    if (a10) {
      *a10 = v14;
    }
    id v16 = LogObj(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Apple Archive format not allowed: %@", buf, 0xCu);
    }
LABEL_19:

    id v18 = 0;
    goto LABEL_20;
  }
  uint64_t v17 = (AAByteStream *)malloc_type_calloc(1uLL, 0x20uLL, 0x20040DC1BFBCFuLL);
  id v18 = AACustomByteStreamOpen();
  int v69 = 0;
  AACustomByteStreamSetData(v18, v17);
  AACustomByteStreamSetCloseProc(v18, (AAByteStreamCloseProc)sub_10001BC94);
  AACustomByteStreamSetReadProc(v18, (AAByteStreamReadProc)sub_10001C860);
  AACustomByteStreamSetCancelProc(v18, (AAByteStreamCancelProc)sub_10001BD0C);
  AAThreadErrorContextEnter();
  BOOL v19 = (id *)malloc_type_calloc(1uLL, 0x18uLL, 0x10A00409D8FE3EAuLL);
  if (!v19)
  {
LABEL_15:
    AAByteStream *v17 = 0;
    uint64_t v25 = [(DSArchiveExportedService *)self _errorForAppleArchive:AAThreadErrorContextLeave() itemURL:v63];
    id v15 = v25;
    if (a10) {
      *a10 = v25;
    }
    id v16 = LogObj(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Couldn't open the archive: %@", buf, 0xCu);
    }
    goto LABEL_19;
  }
  lseek(a3, 0, 0);
  AAByteStream v20 = AAFileStreamOpenWithFD(a3, 0);
  id *v19 = v20;
  if (!v20 || (uint64_t v21 = AACustomByteStreamOpen(), (v22 = v21) == 0))
  {
    free(v19);
    goto LABEL_15;
  }
  AACustomByteStreamSetData(v21, v19);
  AACustomByteStreamSetCloseProc(v22, (AAByteStreamCloseProc)sub_10001F2D4);
  AACustomByteStreamSetCancelProc(v22, (AAByteStreamCancelProc)sub_10001F314);
  AACustomByteStreamSetPReadProc(v22, (AAByteStreamPReadProc)sub_10001F324);
  AACustomByteStreamSetReadProc(v22, (AAByteStreamReadProc)sub_10001F338);
  AAByteStream *v17 = v22;
  objc_storeStrong(v19 + 2, a5);
  AAByteStreamPRead(*v17, &v69, 4uLL, 0);
  if (v69 == 826361153)
  {
    uint64_t v23 = AEAContextCreateWithEncryptedStream(*v17);
    *a8 = v23;
    int FieldUInt = AEAContextGetFieldUInt(v23, 0);
    if (FieldUInt == 5)
    {
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      memset(buf, 0, sizeof(buf));
      size_t buf_size = 0;
      AEAContextGetFieldBlob(*a8, 0x12u, 0, 0x100uLL, buf, &buf_size);
      if ([v62 count]
        || ([(DSArchiveExportedService *)self _passwordFromKeychainWithArchiveID:buf archiveIDSize:buf_size], (id v57 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        id v57 = 0;
      }
      else
      {
        objc_msgSend(v62, "addObject:");
      }
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id obj = v62;
      id v38 = [obj countByEnumeratingWithState:&v64 objects:v72 count:16];
      if (v38)
      {
        uint64_t v39 = *(void *)v65;
LABEL_43:
        uint64_t v40 = 0;
        while (1)
        {
          if (*(void *)v65 != v39) {
            objc_enumerationMutation(obj);
          }
          id v41 = *a8;
          id v42 = *(id *)(*((void *)&v64 + 1) + 8 * v40);
          char v43 = (const uint8_t *)[v42 UTF8String];
          id v44 = v42;
          size_t v45 = strlen((const char *)[v44 UTF8String]);
          AEAContextSetFieldBlob(v41, 0x13u, 0, v43, v45);
          AAByteStream v46 = AEADecryptionInputStreamOpen(*v17, *a8, 0, 0);
          v17[1] = v46;
          if (v46) {
            break;
          }
          int v47 = AAThreadErrorContextLeave();
          long long v48 = LogObj(0);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long v70 = 67109120;
            LODWORD(v71) = v47;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "AEADecryptionInputStreamOpen failed with (%d)", v70, 8u);
          }

          AAThreadErrorContextEnter();
          if (v38 == (id)++v40)
          {
            id v38 = [obj countByEnumeratingWithState:&v64 objects:v72 count:16];
            if (v38) {
              goto LABEL_43;
            }
            int v49 = 1;
            goto LABEL_55;
          }
        }
        if (!v59) {
          goto LABEL_54;
        }
        id v50 = v44;
        [v50 UTF8String];
        strlen((const char *)[v50 UTF8String]);
        AEAKeychainStoreItem();
        int v49 = 0;
      }
      else
      {
LABEL_54:
        int v49 = 0;
      }
LABEL_55:

      if (v17[1])
      {
        int v36 = 1;
      }
      else
      {
        if ((([obj count] != 0) & ~v49) != 0) {
          +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
        }
        else {
        uint64_t v51 = [(DSArchiveExportedService *)self _archiveDecryptionError];
        }
        uint64_t v55 = v51;
        if (a10) {
          *a10 = v51;
        }
        id v56 = LogObj(0);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long v70 = 138412290;
          long long v71 = v55;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Error opening decryption stream: %@", v70, 0xCu);
        }

        int v36 = 0;
      }
    }
    else
    {
      char v33 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:79 userInfo:0];
      id v34 = v33;
      if (a10) {
        *a10 = v33;
      }
      int v35 = LogObj(0);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = FieldUInt;
        *(_WORD *)&uint8_t buf[8] = 2112;
        *(void *)&buf[10] = v34;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Unsupported encryption profile (%d): %@", buf, 0x12u);
      }

      int v36 = 0;
    }
    BOOL v28 = v36 != 0;
    goto LABEL_73;
  }
  if ((unsigned __int16)v69 == 25200 && BYTE2(v69) == 122)
  {
    AAByteStream v37 = AADecompressionInputStreamOpen(*v17, 0, 0);
    v17[2] = v37;
    if (v37)
    {
      BOOL v28 = 1;
      goto LABEL_73;
    }
    int v52 = [(DSArchiveExportedService *)self _errorForAppleArchive:AAThreadErrorContextLeave() itemURL:v63];
    long long v53 = v52;
    if (a10) {
      *a10 = v52;
    }
    long long v54 = LogObj(0);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v53;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Error opening decompression stream: %@", buf, 0xCu);
    }

    goto LABEL_64;
  }
  BOOL v28 = 1;
  if (v69 != 825246017 && v69 != 826360153)
  {
    id v29 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:79 userInfo:0];
    id v30 = v29;
    if (a10) {
      *a10 = v29;
    }
    size_t v31 = LogObj(0);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      AAByteStream v32 = SanitizedURL(v63);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v32;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v30;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Invalid Apple Archive %{public}@: %@", buf, 0x16u);
    }
LABEL_64:
    BOOL v28 = 0;
  }
LABEL_73:
  AAThreadErrorContextLeave();
  if (!v28)
  {
    AAByteStreamClose(v18);
    AEAContextDestroy(*a8);
    id v18 = 0;
    *a8 = 0;
  }
LABEL_20:

  return v18;
}

- (BOOL)_listAppleArchiveWithFD:(int)a3 url:(id)a4 progress:(id)a5 passphrases:(id)a6 formats:(unint64_t)a7 listItemHandler:(id)a8 error:(id *)a9
{
  uint64_t v13 = *(void *)&a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = (void (**)(id, void *, uint64_t, uint64_t))a8;
  AEAContext context = 0;
  id v42 = v15;
  BOOL v19 = [(DSArchiveExportedService *)self _openAppleArchiveReadStreamWithFD:v13 url:v15 progress:v16 passphrases:v17 addToKeychain:0 aeaContext:&context formats:a7 error:a9];
  if (v19)
  {
    AAHeader header = 0;
    AAThreadErrorContextEnter();
    AAByteStream v20 = AADecodeArchiveInputStreamOpen(v19, 0, 0, 0, 0);
    if (v20)
    {
      while (1)
      {
        if ([(DSArchiveExportedService *)self _isCancelled])
        {
          BOOL v37 = 1;
          goto LABEL_30;
        }
        uint64_t value = 0;
        size_t length = 0;
        bzero(buf, 0x400uLL);
        int v21 = AAArchiveStreamReadHeader(v20, &header);
        if (v21 != 1) {
          break;
        }
        uint64_t v22 = header;
        v23.ikey = 5265748;
        uint32_t KeyIndex = AAHeaderGetKeyIndex(header, v23);
        if ((KeyIndex & 0x80000000) == 0)
        {
          unsigned int FieldUInt = AAHeaderGetFieldUInt(v22, KeyIndex, &value);
          int v26 = FieldUInt <= 1 ? 1 : FieldUInt;
          if (v26 >= 1 && value - 68 <= 8 && ((1 << (value - 68)) & 0x105) != 0)
          {
            uint64_t v27 = header;
            v28.ikey = 5521744;
            uint32_t v29 = AAHeaderGetKeyIndex(header, v28);
            if ((v29 & 0x80000000) == 0)
            {
              unsigned int FieldString = AAHeaderGetFieldString(v27, v29, 0x400uLL, (char *)buf, &length);
              int v31 = FieldString <= 1 ? 1 : FieldString;
              if (v31 >= 1)
              {
                if (value != 70
                  || (uint64_t offset = 0,
                      uint64_t size = 0,
                      AAByteStream v32 = header,
                      v33.ikey = 5521732,
                      uint32_t v34 = AAHeaderGetKeyIndex(header, v33),
                      (v34 & 0x80000000) != 0))
                {
                  uint64_t v35 = 0;
                }
                else if (AAHeaderGetFieldBlob(v32, v34, &size, &offset) >= 2)
                {
                  uint64_t v35 = 0;
                }
                else
                {
                  uint64_t v35 = size;
                }
                int v36 = +[NSString stringWithUTF8String:buf];
                if ([v36 length]) {
                  v18[2](v18, v36, value, v35);
                }
              }
            }
          }
        }
      }
      BOOL v37 = v21 >= 0;
    }
    else
    {
      BOOL v37 = 0;
    }
LABEL_30:
    uint64_t v38 = AAThreadErrorContextLeave();
    if (!v37)
    {
      uint64_t v39 = v38;
      uint64_t v40 = LogObj(0);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed listing Apple Archive", buf, 2u);
      }

      if (a9)
      {
        *a9 = [(DSArchiveExportedService *)self _errorForAppleArchive:v39 itemURL:v42];
      }
    }
    AAArchiveStreamClose(v20);
    AAByteStreamClose(v19);
    AEAContextDestroy(context);
  }
  else
  {
    BOOL v37 = 0;
  }

  return v37;
}

- (BOOL)_unarchiveAppleArchiveWithFD:(int)a3 url:(id)a4 destinationURL:(id)a5 progress:(id)a6 passphrases:(id)a7 addToKeychain:(BOOL)a8 formats:(unint64_t)a9 error:(id *)a10
{
  BOOL v10 = a8;
  uint64_t v14 = *(void *)&a3;
  id v16 = a4;
  id v31 = a5;
  id v17 = a6;
  id v18 = a7;
  int v47 = 0;
  v48[0] = 0;
  uint64_t v44 = 0;
  size_t v45 = &v44;
  uint64_t v46 = 0x2020000000;
  int v47 = [(DSArchiveExportedService *)self _openAppleArchiveReadStreamWithFD:v14 url:v16 progress:v17 passphrases:v18 addToKeychain:v10 aeaContext:v48 formats:a9 error:a10];
  if (!v45[3])
  {
    BOOL v23 = 0;
    goto LABEL_20;
  }
  id v30 = v16;
  AAThreadErrorContextEnter();
  uint64_t v38 = 0;
  uint64_t v39 = (id *)&v38;
  uint64_t v40 = 0x3042000000;
  id v41 = sub_10001D0F8;
  id v42 = sub_10001D104;
  id v43 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3042000000;
  v36[3] = sub_10001D0F8;
  v36[4] = sub_10001D104;
  objc_initWeak(&v37, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D10C;
  block[3] = &unk_10002D380;
  void block[4] = &v38;
  block[5] = v36;
  block[6] = &v44;
  dispatch_block_t v19 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  objc_storeWeak(v39 + 5, v19);
  AAByteStream v20 = dispatch_get_global_queue(0, 0);
  dispatch_async(v20, v19);

  int v21 = AADecodeArchiveInputStreamOpen((AAByteStream)v45[3], 0, 0, 1uLL, 0);
  if (!v21)
  {
    id v24 = LogObj(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v25 = "AADecodeArchiveInputStreamOpen failed";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    }
LABEL_12:
    uint64_t v22 = 0;
LABEL_13:

    BOOL v23 = 0;
    goto LABEL_14;
  }
  uint64_t v22 = AAExtractArchiveOutputStreamOpen((const char *)[v31 fileSystemRepresentation], 0, 0, 1uLL, 0);
  if (!v22)
  {
    id v24 = LogObj(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v25 = "AAExtractArchiveOutputStreamOpen failed";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (AAArchiveStreamProcess(v21, v22, 0, 0, 1uLL, 0) < 0)
  {
    id v24 = LogObj(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "AAArchiveStreamProcess failed", buf, 2u);
    }
    goto LABEL_13;
  }
  BOOL v23 = 1;
LABEL_14:
  dispatch_block_cancel(v19);
  int v26 = sub_100014984();
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001D200;
  v32[3] = &unk_10002D290;
  id v33 = v17;
  dispatch_async(v26, v32);

  AAArchiveStreamClose(v22);
  AAArchiveStreamClose(v21);
  AAByteStreamClose((AAByteStream)v45[3]);
  AEAContextDestroy(v48[0]);
  id v16 = v30;
  uint64_t v27 = AAThreadErrorContextLeave();
  if (a10) {
    char v28 = v23;
  }
  else {
    char v28 = 1;
  }
  if ((v28 & 1) == 0)
  {
    *a10 = [(DSArchiveExportedService *)self _errorForAppleArchive:v27 itemURL:v30];
  }

  _Block_object_dispose(v36, 8);
  objc_destroyWeak(&v37);
  _Block_object_dispose(&v38, 8);
  objc_destroyWeak(&v43);

LABEL_20:
  _Block_object_dispose(&v44, 8);

  return v23;
}

- (int)openArchiveFile:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = open((const char *)[v5 fileSystemRepresentation], 2097156);
  if (v6 == -1)
  {
    uint64_t v7 = +[NSError ds_errorWithPOSIXCode:*__error() itemURL:v5 debugDescription:@"Couldn't open the archive file"];
    uint64_t v8 = v7;
    if (a4) {
      *a4 = v7;
    }
    id v9 = LogObj(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Couldn't open the archive file: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  return v6;
}

- (BOOL)_openArchiveWithFD:(int)a3 url:(id)a4 progress:(id)a5 passphrases:(id)a6 formats:(unint64_t)a7 archive:(archive *)a8 entry:(archive_entry *)a9 readItemHandler:(id)a10 error:(id *)a11
{
  char v12 = a7;
  id v48 = a4;
  id v46 = a5;
  id v17 = a6;
  int v47 = (uint64_t (**)(id, archive *, archive_entry *, const char *, id *, unsigned char *))a10;
  if (v12)
  {
    if (archive_read_support_format_all())
    {
      int v21 = [(DSArchiveExportedService *)self _errorForArchive:a8 itemURL:v48];
      dispatch_block_t v19 = v21;
      if (a11) {
        *a11 = v21;
      }
      AAByteStream v20 = LogObj(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "archive_read_support_format_all failed: %@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_27;
    }
  }
  else
  {
    if ((v12 & 2) != 0 && archive_read_support_format_tar())
    {
      id v18 = [(DSArchiveExportedService *)self _errorForArchive:a8 itemURL:v48];
      dispatch_block_t v19 = v18;
      if (a11) {
        *a11 = v18;
      }
      AAByteStream v20 = LogObj(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "archive_read_support_format_tar failed:  %@", (uint8_t *)&buf, 0xCu);
      }
LABEL_27:

LABEL_28:
      char v24 = 0;
      goto LABEL_29;
    }
    if ((v12 & 4) != 0 && archive_read_support_format_zip())
    {
      uint64_t v22 = [(DSArchiveExportedService *)self _errorForArchive:a8 itemURL:v48];
      dispatch_block_t v19 = v22;
      if (a11) {
        *a11 = v22;
      }
      AAByteStream v20 = LogObj(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "archive_read_support_format_zip failed: %@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_27;
    }
  }
  if (archive_read_support_filter_all())
  {
    BOOL v23 = [(DSArchiveExportedService *)self _errorForArchive:a8 itemURL:v48];
    dispatch_block_t v19 = v23;
    if (a11) {
      *a11 = v23;
    }
    AAByteStream v20 = LogObj(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Doesn't support the compression of this archive: %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_27;
  }
  if (v17)
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v26 = v17;
    id v27 = [v26 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v54;
      while (2)
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v54 != v28) {
            objc_enumerationMutation(v26);
          }
          [*(id *)(*((void *)&v53 + 1) + 8 * i) cStringUsingEncoding:4];
          if (archive_read_add_passphrase())
          {
            id v33 = [(DSArchiveExportedService *)self _errorForArchive:a8 itemURL:v48];
            uint32_t v34 = v33;
            if (a11) {
              *a11 = v33;
            }
            uint64_t v35 = LogObj(0);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v34;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Couldn't add passphrase to the archive: %@", (uint8_t *)&buf, 0xCu);
            }

            goto LABEL_28;
          }
        }
        id v27 = [v26 countByEnumeratingWithState:&v53 objects:v60 count:16];
        if (v27) {
          continue;
        }
        break;
      }
    }
  }
  lseek(a3, 0, 0);
  if (archive_read_open_fd())
  {
    id v30 = [(DSArchiveExportedService *)self _errorForArchive:a8 itemURL:v48];
    id v31 = v30;
    if (a11) {
      *a11 = v30;
    }
    AAByteStream v32 = LogObj(0);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v31;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Couldn't open the archive: %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_28;
  }
  *(void *)&long long buf = a8;
  id v45 = v46;
  *((void *)&buf + 1) = v45;
  archive_read_extract_set_progress_callback();
  int v36 = 0;
  char v52 = 0;
  char v24 = 1;
  while ((v24 & 1) != 0 && !v52)
  {
    if ([(DSArchiveExportedService *)self _isCancelled]
      || (int next_header2 = archive_read_next_header2(), next_header2 == 1))
    {
      char v24 = 1;
      break;
    }
    if (next_header2 < 0)
    {
      uint64_t v42 = [(DSArchiveExportedService *)self _errorForArchive:a8 itemURL:v48];

      id v43 = LogObj(0);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v57 = 138412290;
        uint64_t v58 = v42;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Couldn't read the header of the entry: %@", v57, 0xCu);
      }

      char v24 = 0;
      int v36 = (void *)v42;
    }
    else
    {
      uint64_t v39 = (const char *)archive_entry_pathname();
      uint64_t v40 = v39;
      if (!v39 || !strcmp(v39, ".") || !strcmp(v40, ".."))
      {
        char v24 = 1;
      }
      else
      {
        id v51 = v36;
        char v24 = v47[2](v47, a8, a9, v40, &v51, &v52);
        id v41 = v51;

        int v36 = v41;
        archive_entry_clear();
      }
    }
    if (next_header2 < 0) {
      break;
    }
  }
  if (a11) {
    *a11 = v36;
  }
  archive_read_extract_set_progress_callback();
  uint64_t v44 = sub_100014984();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001DC58;
  block[3] = &unk_10002D290;
  id v50 = v45;
  dispatch_async(v44, block);

LABEL_29:
  return v24 & 1;
}

- (BOOL)_openArchiveWithFD:(int)a3 url:(id)a4 progress:(id)a5 passphrases:(id)a6 formats:(unint64_t)a7 readItemHandler:(id)a8 error:(id *)a9
{
  uint64_t v13 = *(void *)&a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  uint64_t v19 = archive_read_new();
  BOOL v20 = [(DSArchiveExportedService *)self _openArchiveWithFD:v13 url:v15 progress:v16 passphrases:v17 formats:a7 archive:v19 entry:archive_entry_new() readItemHandler:v18 error:a9];
  archive_entry_free();
  if (archive_read_close())
  {
    if (a9)
    {
      [(DSArchiveExportedService *)self _errorForArchive:v19 itemURL:v15];
      BOOL v20 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  archive_read_free();

  return v20;
}

- (id)archivedItemDescriptorsForFD:(int)a3 url:(id)a4 passphrases:(id)a5 progress:(id)a6 formats:(unint64_t)a7 destinationFolderURL:(id)a8 error:(id *)a9
{
  uint64_t v12 = *(void *)&a3;
  uint64_t v14 = (__CFString *)a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  id v17 = objc_opt_new();
  if (![(DSArchiveExportedService *)self _isAppleArchive:v14])
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10001E518;
    v33[3] = &unk_10002D3D0;
    v33[4] = self;
    id v34 = v17;
    int v36 = &v40;
    id v37 = &v44;
    id v19 = v15;
    id v35 = v19;
    if ([(DSArchiveExportedService *)self _openArchiveWithFD:v12 url:v14 progress:v16 passphrases:v19 formats:a7 readItemHandler:v33 error:a9])
    {
      if (!*((unsigned char *)v41 + 24) || !*((unsigned char *)v45 + 24)) {
        goto LABEL_9;
      }
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10001E840;
      v31[3] = &unk_10002D3F8;
      v31[4] = self;
      AAByteStream v32 = v14;
      id v30 = 0;
      unsigned __int8 v20 = [(DSArchiveExportedService *)self _openArchiveWithFD:v12 url:v32 progress:v16 passphrases:v19 formats:a7 readItemHandler:v31 error:&v30];
      id v21 = v30;
      uint64_t v22 = v21;
      if (v20)
      {

LABEL_9:
        goto LABEL_10;
      }
      if (a9) {
        *a9 = v21;
      }
    }
LABEL_21:
    id v28 = 0;
    goto LABEL_22;
  }
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10001E2F0;
  id v38[3] = &unk_10002D3A8;
  id v39 = v17;
  unsigned __int8 v18 = [(DSArchiveExportedService *)self _listAppleArchiveWithFD:v12 url:v14 progress:v16 passphrases:v15 formats:a7 listItemHandler:v38 error:a9];

  if ((v18 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_10:
  if (![v17 count])
  {
    v50[0] = v14;
    v49[0] = NSURLErrorKey;
    v49[1] = NSLocalizedDescriptionKey;
    TCFURLInfo::LocalizedStringWithFileName(@"ArchiveIsEmpty", v14, (CFTypeRef *)buf);
    id v23 = *(id *)buf;
    v50[1] = v23;
    char v24 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];

    sub_100007E94((const void **)buf);
    uint64_t v25 = +[NSError errorWithDomain:@"com.apple.desktopservices.ArchiveService" code:-1001 userInfo:v24];
    id v26 = LogObj(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = SanitizedURL((NSURL *)v14);
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "No items listed from %{public}@", buf, 0xCu);
    }
    if (a9) {
      *a9 = v25;
    }
  }
  id v28 = v17;
LABEL_22:

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v28;
}

- (BOOL)_unarchiveEntryAtPath:(const char *)a3 entry:(archive_entry *)a4 fromArchive:(archive *)a5 archiveURL:(id)a6 destinationURL:(id)a7 progress:(id)a8 error:(id *)a9
{
  uint64_t v13 = (__CFString *)a6;
  id v14 = a7;
  archive_entry_set_pathname();
  id v15 = (const char *)archive_entry_hardlink();
  id v16 = v15;
  if (v15)
  {
    size_t v17 = strlen(v15);
    unsigned __int8 v18 = +[NSFileManager defaultManager];
    id v19 = [v18 stringWithFileSystemRepresentation:v16 length:v17];
    unsigned __int8 v20 = [v14 URLByAppendingPathComponent:v19];

    id v21 = v20;
    [v21 fileSystemRepresentation];
    archive_entry_set_hardlink();
  }
  int v22 = archive_read_extract();
  if (v22)
  {
    if (v22 == -20)
    {
      int v23 = archive_format();
      char v24 = (const char *)archive_error_string();
      if ((v23 & 0xFF0000) != 0x50000 || strncmp(v24, "Too much data: Truncating file at", 0x21uLL))
      {
        id v25 = 0;
        BOOL v26 = 1;
LABEL_16:

        goto LABEL_17;
      }
      v34[0] = v13;
      v33[0] = NSURLErrorKey;
      v33[1] = NSLocalizedDescriptionKey;
      TCFURLInfo::LocalizedStringWithFileName(@"InvalidBomZip", v13, (CFTypeRef *)v32);
      id v30 = *(id *)v32;
      v34[1] = v30;
      id v31 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];

      sub_100007E94((const void **)v32);
      id v25 = +[NSError errorWithDomain:@"com.apple.desktopservices.ArchiveService" code:-1002 userInfo:v31];
    }
    else
    {
      id v27 = +[NSURL fileURLWithFileSystemRepresentation:a3 isDirectory:0 relativeToURL:0];
      id v25 = [(DSArchiveExportedService *)self _errorForArchive:a5 itemURL:v27];
    }
    if (!v25) {
      goto LABEL_15;
    }
    id v28 = LogObj(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)AAByteStream v32 = 138412290;
      *(void *)&void v32[4] = v25;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Could't extract entry from archive: %@", v32, 0xCu);
    }

    if (a9)
    {
      id v25 = v25;
      BOOL v26 = 0;
      *a9 = v25;
    }
    else
    {
LABEL_15:
      BOOL v26 = 0;
    }
    goto LABEL_16;
  }
  BOOL v26 = 1;
LABEL_17:

  return v26;
}

- (BOOL)_unarchiveFromArchiveFD:(int)a3 url:(id)a4 passphrases:(id)a5 addToKeychain:(BOOL)a6 destinationURL:(id)a7 formats:(unint64_t)a8 progress:(id)a9 readItemGroup:(id)a10 error:(id *)a11
{
  BOOL v13 = a6;
  uint64_t v15 = *(void *)&a3;
  id v17 = a4;
  id v27 = a5;
  id v18 = a7;
  id v19 = a9;
  v37[0] = 0;
  id v36 = 0;
  LODWORD(a7) = [v17 getResourceValue:v37 forKey:NSURLFileSizeKey error:&v36];
  id v26 = v37[0];
  id v25 = v36;
  if (a7)
  {
    unsigned __int8 v20 = sub_100014984();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001EF64;
    block[3] = &unk_10002CEB0;
    id v34 = v19;
    id v35 = v26;
    dispatch_async(v20, block);
  }
  id v21 = [v18 path];
  if ([(DSArchiveExportedService *)self _isAppleArchive:v17])
  {
    id v22 = [v27 mutableCopy];
    BOOL v23 = [(DSArchiveExportedService *)self _unarchiveAppleArchiveWithFD:v15 url:v17 destinationURL:v18 progress:v19 passphrases:v22 addToKeychain:v13 formats:a8 error:a11];
  }
  else
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001EFA4;
    v28[3] = &unk_10002D420;
    v28[4] = self;
    id v29 = v21;
    id v30 = v17;
    id v31 = v18;
    id v32 = v19;
    BOOL v23 = [(DSArchiveExportedService *)self _openArchiveWithFD:v15 url:v30 progress:v32 passphrases:v27 formats:a8 readItemHandler:v28 error:a11];
  }
  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end