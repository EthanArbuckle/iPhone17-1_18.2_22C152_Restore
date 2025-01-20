@interface IMDPersistentAttachmentController
+ (id)sharedInstance;
- (BOOL)_canDeleteAttachmentPath:(id)a3;
- (BOOL)_deleteAttachmentForTransfer:(id)a3 highQuality:(BOOL)a4;
- (BOOL)_shouldDeleteOriginalPath:(id)a3 copyWithinAttachmentStore:(BOOL)a4 destPath:(id)a5 storeAtExternalPath:(BOOL)a6;
- (BOOL)cleanseOrphanedFileTransfers;
- (BOOL)deleteAttachmentsForTransfer:(id)a3;
- (BOOL)isSafeToDeleteAttachmentPath:(id)a3;
- (id)_migrateSiblingAssetsInAttachmentStoreWithOriginalPath:(id)a3 destinationPath:(id)a4 withFileManager:(id)a5;
- (id)_persistentPathForTransfer:(id)a3 filename:(id)a4 highQuality:(BOOL)a5 chatGUID:(id)a6 storeAtExternalPath:(BOOL)a7;
- (id)_saveAttachmentForTransfer:(id)a3 highQuality:(BOOL)a4 copyWithinAttachmentStore:(BOOL)a5;
- (id)_saveAttachmentForTransfer:(id)a3 highQuality:(BOOL)a4 copyWithinAttachmentStore:(BOOL)a5 chatGUID:(id)a6 storeAtExternalPath:(BOOL)a7;
- (void)_removeLegacyAttachmentPathsInAttachmentStoreWithOriginalPath:(id)a3 withFileManager:(id)a4;
- (void)moveAttachmentsForTransfer:(id)a3 completion:(id)a4;
- (void)saveAttachmentsForTransfer:(id)a3 chatGUID:(id)a4 storeAtExternalLocation:(BOOL)a5 completion:(id)a6;
- (void)saveAttachmentsForTransfer:(id)a3 completion:(id)a4;
@end

@implementation IMDPersistentAttachmentController

+ (id)sharedInstance
{
  if (qword_1EB5ABBF8 != -1) {
    dispatch_once(&qword_1EB5ABBF8, &unk_1F084CE20);
  }
  return (id)qword_1EB5ABCE0;
}

- (void)saveAttachmentsForTransfer:(id)a3 chatGUID:(id)a4 storeAtExternalLocation:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v11 = [(IMDPersistentAttachmentController *)self _saveAttachmentForTransfer:a3 highQuality:0 copyWithinAttachmentStore:0 chatGUID:0 storeAtExternalPath:0];
  id v12 = 0;
  if (v7) {
    id v12 = [(IMDPersistentAttachmentController *)self _saveAttachmentForTransfer:a3 highQuality:0 copyWithinAttachmentStore:0 chatGUID:a4 storeAtExternalPath:1];
  }
  if (a6)
  {
    v13 = (void (*)(id, id, void, id))*((void *)a6 + 2);
    v13(a6, v11, 0, v12);
  }
}

- (void)saveAttachmentsForTransfer:(id)a3 completion:(id)a4
{
  id v5 = [(IMDPersistentAttachmentController *)self _saveAttachmentForTransfer:a3 highQuality:0 copyWithinAttachmentStore:0 chatGUID:0 storeAtExternalPath:0];
  if (a4)
  {
    v6 = (void (*)(id, id, void))*((void *)a4 + 2);
    v6(a4, v5, 0);
  }
}

- (void)moveAttachmentsForTransfer:(id)a3 completion:(id)a4
{
  id v5 = [(IMDPersistentAttachmentController *)self _saveAttachmentForTransfer:a3 highQuality:0 copyWithinAttachmentStore:1];
  if (a4)
  {
    v6 = (void (*)(id, id, void))*((void *)a4 + 2);
    v6(a4, v5, 0);
  }
}

- (id)_saveAttachmentForTransfer:(id)a3 highQuality:(BOOL)a4 copyWithinAttachmentStore:(BOOL)a5
{
  return [(IMDPersistentAttachmentController *)self _saveAttachmentForTransfer:a3 highQuality:a4 copyWithinAttachmentStore:a5 chatGUID:0 storeAtExternalPath:0];
}

- (BOOL)_shouldDeleteOriginalPath:(id)a3 copyWithinAttachmentStore:(BOOL)a4 destPath:(id)a5 storeAtExternalPath:(BOOL)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a6 && sub_1AFBBF8CC((__CFString *)a3))
  {
    int v8 = IMOSLoggingEnabled();
    if (v8)
    {
      v9 = OSLogHandleForIMFoundationCategory();
      int v8 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if (v8)
      {
        int v11 = 138412546;
        id v12 = a3;
        __int16 v13 = 2112;
        id v14 = a5;
        _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Not deleting at original path %@ because we're storing at an external path %@", (uint8_t *)&v11, 0x16u);
        LOBYTE(v8) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (id)_saveAttachmentForTransfer:(id)a3 highQuality:(BOOL)a4 copyWithinAttachmentStore:(BOOL)a5 chatGUID:(id)a6 storeAtExternalPath:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend((id)objc_msgSend(a3, "filename"), "length"))
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    v18 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v68 = (uint64_t)a3;
    uint64_t v15 = "   => transfer has empty file name, bailing: %@";
    goto LABEL_19;
  }
  uint64_t v13 = [a3 transferState];
  if (![a3 isIncoming] || v13 > 3 || v10)
  {
    uint64_t v64 = 0;
    v19 = (void *)[a3 filename];
    uint64_t v20 = (uint64_t)v19;
    if (v10) {
      uint64_t v20 = objc_msgSend(v19, "__im_filePathWithVariant:", *MEMORY[0x1E4F6D4D0]);
    }
    id v21 = [(IMDPersistentAttachmentController *)self _persistentPathForTransfer:a3 filename:v20 highQuality:v10 chatGUID:a6 storeAtExternalPath:v7];
    if ([v21 length])
    {
      v22 = (void *)MEMORY[0x1B3E8A120]();
      v23 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v24 = [v21 stringByDeletingLastPathComponent];
      if (v10) {
        uint64_t v25 = [a3 temporaryHighQualityLocalPath];
      }
      else {
        uint64_t v25 = [a3 localPath];
      }
      v28 = (__CFString *)v25;
      if ((objc_msgSend(v23, "__im_makeDirectoriesInPath:mode:", v24, 448) & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v68 = v24;
            _os_log_impl(&dword_1AFB53000, v30, OS_LOG_TYPE_INFO, "   => transfer could not ensure persistent path: %@", buf, 0xCu);
          }
        }
        id v26 = 0;
        goto LABEL_34;
      }
      if ([(__CFString *)v28 isEqualToString:v21])
      {
        if (IMOSLoggingEnabled())
        {
          v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AFB53000, v29, OS_LOG_TYPE_INFO, "   => local path is already the same as destination path. Not moving or copying.", buf, 2u);
          }
        }
        id v26 = (id)[v21 copy];
LABEL_34:
        return v26;
      }
      int v31 = [v23 fileExistsAtPath:v21];
      if (v31 && !v7)
      {
        if (IMOSLoggingEnabled())
        {
          v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v68 = (uint64_t)a3;
            _os_log_impl(&dword_1AFB53000, v32, OS_LOG_TYPE_INFO, "   => file already exists for transfer: %@", buf, 0xCu);
          }
        }
        v33 = 0;
        goto LABEL_109;
      }
      if (sub_1AFBBF8CC(v28) && !v9 && !v7)
      {
        if (IMOSLoggingEnabled())
        {
          v34 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v68 = (uint64_t)a3;
            _os_log_impl(&dword_1AFB53000, v34, OS_LOG_TYPE_INFO, "   => file is already in attachment store: %@", buf, 0xCu);
          }
        }
        v33 = v28;
        goto LABEL_109;
      }
      v35 = (void *)[a3 sandboxToken];
      uint64_t v61 = (uint64_t)v35;
      if (v35)
      {
        [v35 UTF8String];
        uint64_t v36 = sandbox_extension_consume();
        if (v36 != -1) {
          goto LABEL_54;
        }
        if (IMOSLoggingEnabled())
        {
          v37 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v68 = (uint64_t)v28;
            __int16 v69 = 2112;
            uint64_t v70 = v61;
            _os_log_impl(&dword_1AFB53000, v37, OS_LOG_TYPE_INFO, "Failed to consume sandbox token, %@ token: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v36 = -1;
LABEL_54:
      uint64_t v62 = v36;
      if (!v28)
      {
LABEL_81:
        int v46 = 0;
LABEL_102:
        if (v62 != -1
          && sandbox_extension_release() == -1
          && IMOSLoggingEnabled()
          && (v54 = OSLogHandleForIMFoundationCategory(), os_log_type_enabled(v54, OS_LOG_TYPE_INFO)))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v68 = (uint64_t)v28;
          __int16 v69 = 2112;
          uint64_t v70 = v61;
          _os_log_impl(&dword_1AFB53000, v54, OS_LOG_TYPE_INFO, "Failed to release sandbox token, %@ token: %@", buf, 0x16u);
          v33 = 0;
          if ((v46 & 1) == 0) {
            goto LABEL_122;
          }
        }
        else
        {
          v33 = 0;
          if (!v46)
          {
LABEL_122:
            return v33;
          }
        }
LABEL_109:
        if (IMOSLoggingEnabled())
        {
          v55 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v68 = (uint64_t)v21;
            _os_log_impl(&dword_1AFB53000, v55, OS_LOG_TYPE_INFO, "Changing permissions on attachment file at %@", buf, 0xCu);
          }
        }
        uint64_t v65 = *MEMORY[0x1E4F28370];
        uint64_t v66 = *MEMORY[0x1E4F28358];
        int v56 = objc_msgSend(v23, "setAttributes:ofItemAtPath:error:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1), v21, &v64);
        if (IMOSLoggingEnabled())
        {
          v57 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            v58 = @"NO";
            if (v56) {
              v58 = @"YES";
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v68 = (uint64_t)v58;
            __int16 v69 = 2112;
            uint64_t v70 = v64;
            _os_log_impl(&dword_1AFB53000, v57, OS_LOG_TYPE_INFO, "    => Permissions changed: %@  error: %@", buf, 0x16u);
          }
        }
        if (!v33) {
          v33 = (__CFString *)[v21 copy];
        }
        if (IMOSLoggingEnabled())
        {
          v59 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v68 = (uint64_t)v33;
            _os_log_impl(&dword_1AFB53000, v59, OS_LOG_TYPE_INFO, "   => Success! returning path: %@", buf, 0xCu);
          }
        }
        goto LABEL_122;
      }
      if (![v23 fileExistsAtPath:v28])
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_81;
        }
        v44 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO)) {
          goto LABEL_81;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v68 = (uint64_t)v28;
        v45 = "   => ** failed copying file from path, file not on disk: %@";
        goto LABEL_80;
      }
      if (v31 & v7)
      {
        uint64_t v38 = objc_msgSend((id)objc_msgSend(v23, "im_randomTemporaryFileURLWithFileName:", @"tmp"), "path");
        [v23 copyItemAtPath:v28 toPath:v38 error:&v64];
        uint64_t v60 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v21];
        if ((objc_msgSend(v23, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v60, objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", v38), 0, 0, 0, &v64) & 1) == 0)
        {
LABEL_58:
          if (IMOSLoggingEnabled())
          {
            v39 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v68 = (uint64_t)v21;
              _os_log_impl(&dword_1AFB53000, v39, OS_LOG_TYPE_INFO, "   => ** failed copying file to path: %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            v40 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v68 = v64;
              _os_log_impl(&dword_1AFB53000, v40, OS_LOG_TYPE_INFO, "          The error was %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            v41 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v68 = (uint64_t)v21;
              _os_log_impl(&dword_1AFB53000, v41, OS_LOG_TYPE_INFO, "   => failed copy file to path: %@, will try move", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            v42 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v68 = v64;
              _os_log_impl(&dword_1AFB53000, v42, OS_LOG_TYPE_INFO, "      The error was %@", buf, 0xCu);
            }
          }
          if (([v23 moveItemAtPath:v28 toPath:v21 error:&v64] & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              v43 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v68 = (uint64_t)v21;
                _os_log_impl(&dword_1AFB53000, v43, OS_LOG_TYPE_INFO, "   => ** failed moving file to path: %@", buf, 0xCu);
              }
            }
            if (!IMOSLoggingEnabled()) {
              goto LABEL_81;
            }
            v44 = OSLogHandleForIMFoundationCategory();
            if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO)) {
              goto LABEL_81;
            }
            *(_DWORD *)buf = 138412290;
            uint64_t v68 = v64;
            v45 = "          The error was %@";
LABEL_80:
            _os_log_impl(&dword_1AFB53000, v44, OS_LOG_TYPE_INFO, v45, buf, 0xCu);
            goto LABEL_81;
          }
LABEL_101:
          int v46 = 1;
          goto LABEL_102;
        }
      }
      else if (![v23 copyItemAtPath:v28 toPath:v21 error:&v64])
      {
        goto LABEL_58;
      }
      if (IMOSLoggingEnabled())
      {
        v47 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v68 = (uint64_t)v21;
          _os_log_impl(&dword_1AFB53000, v47, OS_LOG_TYPE_INFO, "   => successfully copied file to path: %@", buf, 0xCu);
        }
      }
      if (v9)
      {
        if (IMOSLoggingEnabled())
        {
          v48 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AFB53000, v48, OS_LOG_TYPE_INFO, "   => checking if file has any siblings to copy", buf, 2u);
          }
        }
        id v49 = (id)objc_msgSend(-[IMDPersistentAttachmentController _migrateSiblingAssetsInAttachmentStoreWithOriginalPath:destinationPath:withFileManager:](self, "_migrateSiblingAssetsInAttachmentStoreWithOriginalPath:destinationPath:withFileManager:", v28, v21, v23), "copy");
      }
      else
      {
        id v49 = (id)[a3 _auxVideoPathIfItExists];
        if (v49)
        {
          if (IMOSLoggingEnabled())
          {
            v50 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              uint64_t v51 = [v49 lastPathComponent];
              *(_DWORD *)buf = 138412290;
              uint64_t v68 = v51;
              _os_log_impl(&dword_1AFB53000, v50, OS_LOG_TYPE_INFO, "   => copying video complement: %@", buf, 0xCu);
            }
          }
          [(IMDPersistentAttachmentController *)self _migrateSiblingAssetsInAttachmentStoreWithOriginalPath:v28 destinationPath:v21 withFileManager:v23];
          id v49 = 0;
        }
      }
      if ([(IMDPersistentAttachmentController *)self _shouldDeleteOriginalPath:v28 copyWithinAttachmentStore:v9 destPath:v21 storeAtExternalPath:v7])
      {
        if (IMOSLoggingEnabled())
        {
          v52 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v68 = (uint64_t)v28;
            _os_log_impl(&dword_1AFB53000, v52, OS_LOG_TYPE_INFO, "        ...removing old file in 10: %@", buf, 0xCu);
          }
        }
        dispatch_time_t v53 = dispatch_time(0, 10000000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1AFBC0828;
        block[3] = &unk_1E5F958C0;
        block[4] = v28;
        block[5] = v23;
        block[6] = v49;
        block[7] = self;
        dispatch_after(v53, MEMORY[0x1E4F14428], block);
      }
      goto LABEL_101;
    }
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    v18 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v68 = (uint64_t)a3;
    uint64_t v15 = "   => persistent path is zero length for transfer: %@";
LABEL_19:
    v16 = v18;
    uint32_t v17 = 12;
    goto LABEL_20;
  }
  if (!IMOSLoggingEnabled()) {
    return 0;
  }
  id v14 = OSLogHandleForIMFoundationCategory();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
    return 0;
  }
  *(_WORD *)buf = 0;
  uint64_t v15 = "   => transfer is not ready to save";
  v16 = v14;
  uint32_t v17 = 2;
LABEL_20:
  _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, v15, buf, v17);
  return 0;
}

- (BOOL)_canDeleteAttachmentPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(a3, "lastPathComponent"), "isEqualToString:", @"Attachments"))
  {
    int v4 = IMOSLoggingEnabled();
    if (v4)
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      int v4 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      if (v4)
      {
        LOWORD(v13) = 0;
        v6 = "Not deleting attachment path, last component is Attachments";
        BOOL v7 = v5;
        uint32_t v8 = 2;
LABEL_14:
        _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v13, v8);
        LOBYTE(v4) = 0;
      }
    }
  }
  else
  {
    BOOL v9 = (void *)[a3 lastPathComponent];
    if ([v9 length] == 36)
    {
      if (objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "containsString:", objc_msgSend(@"/var/mobile/Library/SMS/Attachments", "stringByExpandingTildeInPath")))
      {
        LOBYTE(v4) = 1;
      }
      else
      {
        int v4 = IMOSLoggingEnabled();
        if (v4)
        {
          int v11 = OSLogHandleForIMFoundationCategory();
          int v4 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
          if (v4)
          {
            int v13 = 138412290;
            id v14 = a3;
            v6 = "Not deleting attachment path, not in attachment store: %@";
            BOOL v7 = v11;
            uint32_t v8 = 12;
            goto LABEL_14;
          }
        }
      }
    }
    else
    {
      int v4 = IMOSLoggingEnabled();
      if (v4)
      {
        BOOL v10 = OSLogHandleForIMFoundationCategory();
        int v4 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
        if (v4)
        {
          int v13 = 138412546;
          id v14 = a3;
          __int16 v15 = 2112;
          v16 = v9;
          v6 = "Not deleting attachment path, last component is not guid-like %@ guidPathComponent: %@";
          BOOL v7 = v10;
          uint32_t v8 = 22;
          goto LABEL_14;
        }
      }
    }
  }
  return v4;
}

- (void)_removeLegacyAttachmentPathsInAttachmentStoreWithOriginalPath:(id)a3 withFileManager:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 stringByDeletingLastPathComponent];
  BOOL v7 = (void *)[a4 contentsOfDirectoryAtPath:v6 error:0];
  if (v7 && ![v7 count])
  {
    BOOL v10 = [(IMDPersistentAttachmentController *)self _canDeleteAttachmentPath:v6];
    int v11 = IMOSLoggingEnabled();
    if (v10)
    {
      if (v11)
      {
        id v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v13 = 138412290;
          uint64_t v14 = v6;
          _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Path was in attachment store, removing %@", (uint8_t *)&v13, 0xCu);
        }
      }
      [a4 removeItemAtPath:v6 error:0];
    }
    else if (v11)
    {
      uint32_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        uint64_t v14 = v6;
        BOOL v9 = "Bailing out of legacy attachment path deletion, %@ is not an eligible path";
        goto LABEL_6;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint32_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      uint64_t v14 = v6;
      BOOL v9 = "Bailing out of legacy attachment path deletion, %@ has other contents in path";
LABEL_6:
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, 0xCu);
    }
  }
}

- (id)_migrateSiblingAssetsInAttachmentStoreWithOriginalPath:(id)a3 destinationPath:(id)a4 withFileManager:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint32_t v8 = (void *)[a3 stringByDeletingLastPathComponent];
  id v33 = a4;
  uint64_t v9 = [a4 stringByDeletingLastPathComponent];
  id v34 = a3;
  uint64_t v10 = [a3 lastPathComponent];
  v39 = (void *)v9;
  v40 = v8;
  LODWORD(v9) = [v8 isEqualToString:v9];
  int v11 = IMOSLoggingEnabled();
  if (!v9)
  {
    if (v11)
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v50 = v10;
        __int16 v51 = 2112;
        uint64_t v52 = (uint64_t)v8;
        _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "Looking for sibling files of %@ in %@", buf, 0x16u);
      }
    }
    uint64_t v15 = (void *)[a5 contentsOfDirectoryAtPath:v8 error:0];
    id obj = v15;
    if (!v15
      || ![v15 count]
      || (long long v45 = 0u,
          long long v46 = 0u,
          long long v43 = 0u,
          long long v44 = 0u,
          (uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16]) == 0))
    {
      id v38 = 0;
      return v38;
    }
    id v38 = 0;
    uint64_t v17 = *(void *)v44;
    uint64_t v35 = *MEMORY[0x1E4F281F8];
    uint64_t v37 = *MEMORY[0x1E4F28370];
    uint64_t v36 = *MEMORY[0x1E4F28358];
    while (1)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if ([v19 isEqualToString:v10])
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v50 = (uint64_t)v19;
              id v21 = v20;
              v22 = "Sibling search found orig filename %@, skipping";
              uint32_t v23 = 12;
LABEL_47:
              _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, v22, buf, v23);
              continue;
            }
          }
          continue;
        }
        uint64_t v24 = [v40 stringByAppendingPathComponent:v19];
        uint64_t v25 = [v39 stringByAppendingPathComponent:v19];
        if (IMOSLoggingEnabled())
        {
          id v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v50 = v24;
            __int16 v51 = 2112;
            uint64_t v52 = v25;
            _os_log_impl(&dword_1AFB53000, v26, OS_LOG_TYPE_INFO, "Will migrate sibling at path %@ to %@", buf, 0x16u);
          }
        }
        id v42 = 0;
        int v27 = [a5 removeItemAtPath:v25 error:&v42];
        if (!v27) {
          goto LABEL_55;
        }
        if (!v42) {
          goto LABEL_34;
        }
        if (!objc_msgSend((id)objc_msgSend(v42, "domain"), "isEqualToString:", v35)
          || [v42 code] != 4)
        {
LABEL_55:
          if (IMOSLoggingEnabled())
          {
            v28 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              v29 = @"NO";
              if (v27) {
                v29 = @"YES";
              }
              *(_DWORD *)buf = 138412802;
              uint64_t v50 = v25;
              __int16 v51 = 2112;
              uint64_t v52 = (uint64_t)v29;
              __int16 v53 = 2112;
              uint64_t v54 = (uint64_t)v42;
              _os_log_impl(&dword_1AFB53000, v28, OS_LOG_TYPE_INFO, "Failed to delete existing sibling %@ success %@ error %@", buf, 0x20u);
            }
          }
        }
        if (v42) {
          id v42 = 0;
        }
LABEL_34:
        [a5 copyItemAtPath:v24 toPath:v25 error:&v42];
        if (v42)
        {
          if (IMOSLoggingEnabled())
          {
            v30 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              uint64_t v50 = (uint64_t)v34;
              __int16 v51 = 2112;
              uint64_t v52 = v24;
              __int16 v53 = 2112;
              uint64_t v54 = v25;
              __int16 v55 = 2112;
              id v56 = v42;
              id v21 = v30;
              v22 = "Failed to copy sibling attachment to dst. Orig %@ sibling %@ dst %@ error %@";
              uint32_t v23 = 42;
              goto LABEL_47;
            }
          }
        }
        else
        {
          if (!v38) {
            id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          if (IMOSLoggingEnabled())
          {
            int v31 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v50 = (uint64_t)v19;
              __int16 v51 = 2112;
              uint64_t v52 = (uint64_t)v33;
              _os_log_impl(&dword_1AFB53000, v31, OS_LOG_TYPE_INFO, "Successfully migrated %@ to %@", buf, 0x16u);
            }
          }
          [v38 addObject:v24];
          uint64_t v47 = v37;
          uint64_t v48 = v36;
          objc_msgSend(a5, "setAttributes:ofItemAtPath:error:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1), v25, &v42);
          if (v42)
          {
            if (IMOSLoggingEnabled())
            {
              v32 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v50 = v25;
                __int16 v51 = 2112;
                uint64_t v52 = (uint64_t)v42;
                id v21 = v32;
                v22 = "Failed to update permissions on sibling file dst path %@ error %@";
                uint32_t v23 = 22;
                goto LABEL_47;
              }
            }
          }
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
      if (!v16) {
        return v38;
      }
    }
  }
  if (v11)
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Can't migrate sibling attachments to the same folder", buf, 2u);
    }
  }
  return 0;
}

- (BOOL)isSafeToDeleteAttachmentPath:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(a3, "lastPathComponent"), "isEqualToString:", @"Attachments"))
  {
    int v4 = IMOSLoggingEnabled();
    if (v4)
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      int v4 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      if (v4)
      {
        LOWORD(v11) = 0;
        uint64_t v6 = "Not deleting attachment path, last component is Attachments";
        BOOL v7 = v5;
        uint32_t v8 = 2;
LABEL_10:
        _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v11, v8);
        LOBYTE(v4) = 0;
      }
    }
  }
  else if (objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "containsString:", objc_msgSend(@"/var/mobile/Library/SMS/Attachments", "stringByExpandingTildeInPath")))
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    int v4 = IMOSLoggingEnabled();
    if (v4)
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      int v4 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if (v4)
      {
        int v11 = 138412290;
        id v12 = a3;
        uint64_t v6 = "Not deleting attachment path, not in attachment store: %@";
        BOOL v7 = v9;
        uint32_t v8 = 12;
        goto LABEL_10;
      }
    }
  }
  return v4;
}

- (BOOL)deleteAttachmentsForTransfer:(id)a3
{
  return MEMORY[0x1F4181798](self, sel__deleteAttachmentForTransfer_highQuality_);
}

- (BOOL)_deleteAttachmentForTransfer:(id)a3 highQuality:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint32_t v8 = @"NO";
      if (v4) {
        uint32_t v8 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v19 = a3;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Request to delete attachment for transfer: %@ high quality: %@", buf, 0x16u);
    }
  }
  id v9 = [(IMDPersistentAttachmentController *)self _persistentPathForTransfer:a3 filename:0 highQuality:v4 chatGUID:0 storeAtExternalPath:0];
  if (v9 || [0 length])
  {
    uint64_t v10 = (void *)MEMORY[0x1B3E8A120]();
    uint64_t v17 = 0;
    char v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", v9, &v17);
    int v12 = IMOSLoggingEnabled();
    if (v11)
    {
      if (!v12) {
        goto LABEL_16;
      }
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 138412546;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = a3;
      uint64_t v14 = "  => Successfully deleted item at path: %@  for transfer: %@";
    }
    else
    {
      if (!v12) {
        goto LABEL_16;
      }
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 138412546;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = a3;
      uint64_t v14 = "  => failed to remove item at path: %@  for transfer: %@";
    }
    _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, v14, buf, 0x16u);
LABEL_16:
    return v11;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = a3;
      _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, "  => No persistent path for transfer found: %@", buf, 0xCu);
    }
  }
  return 0;
}

- (id)_persistentPathForTransfer:(id)a3 filename:(id)a4 highQuality:(BOOL)a5 chatGUID:(id)a6 storeAtExternalPath:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([a3 isSticker])
  {
    if (IMOSLoggingEnabled())
    {
      int v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [a3 guid];
        int v14 = [a3 isSticker];
        uint64_t v15 = @"NO";
        if (v14) {
          uint64_t v15 = @"YES";
        }
        int v20 = 138412546;
        uint64_t v21 = v13;
        __int16 v22 = 2112;
        uint32_t v23 = v15;
        _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Generating path for sticker transfer %@ isSticker %@", (uint8_t *)&v20, 0x16u);
      }
    }
    [a3 stickerUserInfo];
    [a3 isAdaptiveImageGlyph];
    return (id)IMSharedHelperCachePathForStickerWithProperties();
  }
  else
  {
    uint64_t v17 = (void *)[a3 guid];
    if ([a3 isAuxVideo])
    {
      if (IMOSLoggingEnabled())
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v20 = 138412290;
          uint64_t v21 = (uint64_t)a3;
          _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "Overriding guid for transfer in _persistentPathForTransfer %@", (uint8_t *)&v20, 0xCu);
        }
      }
      uint64_t v17 = (void *)[MEMORY[0x1E4F6E780] guidByStrippingAuxPrefix:v17];
    }
    if (v9) {
      id v19 = (void *)[a3 temporaryHighQualityLocalPath];
    }
    else {
      id v19 = (void *)[a3 localPath];
    }
    if (!a4) {
      a4 = (id)[v19 lastPathComponent];
    }
    return IMDCopyAttachmentPersistentPath(v17, a4, [a3 mimeType], objc_msgSend(a3, "type"), (uint64_t)a6, v7);
  }
}

- (BOOL)cleanseOrphanedFileTransfers
{
  v2 = objc_alloc_init(IMDOrphanedAttachmentHandler);
  [(IMDOrphanedAttachmentHandler *)v2 cleanseOrphanedAttachments];

  return 1;
}

@end