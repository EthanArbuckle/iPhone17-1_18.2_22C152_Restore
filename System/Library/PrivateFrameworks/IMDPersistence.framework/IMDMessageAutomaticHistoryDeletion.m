@interface IMDMessageAutomaticHistoryDeletion
+ (BOOL)isDirCreationDateAtPath:(id)a3 olderThanDays:(int64_t)a4;
+ (BOOL)isFileAtDirPath:(id)a3 olderThanDays:(int64_t)a4;
+ (BOOL)isFileHeaderDateAtPath:(id)a3 olderThanDays:(int64_t)a4;
+ (BOOL)isOlderThanDays:(int64_t)a3 fromDate:(id)a4;
+ (id)_getDirSubDirURLsForDirPath:(id)a3 error:(id *)a4;
+ (id)_getFilePathNotDSStore:(id)a3;
+ (id)_getPathAttributesForPath:(id)a3;
+ (id)_getiChatFileMetadataForPath:(id)a3;
+ (void)cleanDatabase;
+ (void)cleanUpOrphanAttachments;
+ (void)deleteAttachmentsAfterDays:(id)a3;
+ (void)deleteDirectoryAtPath:(id)a3;
+ (void)deleteJunkMessagesEligibleForPermanentRemovalOldThanDays:(int64_t)a3;
+ (void)deleteMessagesAfterDays:(id)a3;
+ (void)deleteMessagesAndAttachmentsAfterDays:(id)a3;
+ (void)deleteRecoverableMessagesEligibleForPermanentRemoval;
+ (void)deleteSpolightArchivedFiles;
@end

@implementation IMDMessageAutomaticHistoryDeletion

+ (void)cleanUpOrphanAttachments
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Cleansing orphaned attachments", v4, 2u);
    }
  }
  v3 = objc_alloc_init(IMDOrphanedAttachmentHandler);
  [(IMDOrphanedAttachmentHandler *)v3 cleanseOrphanedAttachments];
}

+ (void)deleteMessagesAndAttachmentsAfterDays:(id)a3
{
  +[IMDMessageAutomaticHistoryDeletion deleteMessagesAfterDays:](IMDMessageAutomaticHistoryDeletion, "deleteMessagesAfterDays:");
  MEMORY[0x1F4181798](IMDMessageAutomaticHistoryDeletion, sel_deleteAttachmentsAfterDays_);
}

+ (void)deleteMessagesAfterDays:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([a3 longLongValue])
  {
    uint64_t v5 = 0;
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v7 = [a3 longValue];
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "permanently deleting messages not in recently deleted older than %ld days", buf, 0xCu);
      }
    }
    IMDMessageRecordDeleteMessagesOlderThanDays([a3 longLongValue], &v5);
  }
}

+ (void)deleteAttachmentsAfterDays:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 longLongValue])
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v5 = 134217984;
        uint64_t v6 = [a3 longValue];
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "deleting attachments older than %ld days", (uint8_t *)&v5, 0xCu);
      }
    }
    IMDAttachmentRecordDeleteAttachmentsOlderThanDays([a3 longLongValue]);
  }
}

+ (void)deleteRecoverableMessagesEligibleForPermanentRemoval
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v3 = 134217984;
      uint64_t v4 = 30;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "permanently deleting messages in recently deleted older than %lld days", (uint8_t *)&v3, 0xCu);
    }
  }
  [(IMDRemoteDatabaseProtocol *)+[IMDDatabase database] deleteRecoverableMessagesOlderThanDays:30];
}

+ (void)deleteJunkMessagesEligibleForPermanentRemovalOldThanDays:(int64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      int64_t v6 = a3;
      _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "permanently deleting messages filtered as junk older than %lld days", (uint8_t *)&v5, 0xCu);
    }
  }
  [(IMDRemoteDatabaseProtocol *)+[IMDDatabase database] deleteJunkMessagesOlderThanDays:a3];
}

+ (void)cleanDatabase
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "  => Cleaning up orphaned messages", buf, 2u);
    }
  }
  IMDMessageRecordDeleteOrphanedMessages();
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Cleansing database", v4, 2u);
    }
  }
  IMDDatabaseClean();
}

+ (void)deleteSpolightArchivedFiles
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "deleting spotlight archive files", buf, 2u);
    }
  }
  uint64_t v4 = (void *)[a1 _getDirSubDirURLsForDirPath:objc_msgSend(@"~/Library/Messages/Archive", "stringByExpandingTildeInPath"), 0 error];
  int v5 = v4;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v15;
      *(void *)&long long v7 = 138412290;
      long long v13 = v7;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "path", v13);
          if (IMOSLoggingEnabled())
          {
            v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v13;
              uint64_t v19 = v10;
              _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "main folder path found %@", buf, 0xCu);
            }
          }
          [a1 deleteDirectoryAtPath:v10];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v6);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "could not messages archive director, error:", buf, 2u);
    }
  }
}

+ (void)deleteDirectoryAtPath:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = IMOSLoggingEnabled();
  if (a3)
  {
    if (v4)
    {
      int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = a3;
        _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "deleteDirectoryAtPath: Deleting directory at path %@", (uint8_t *)&v7, 0xCu);
      }
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", a3, 0);
  }
  else if (v4)
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "deleteDirectoryAtPath:  path is nil", (uint8_t *)&v7, 2u);
    }
  }
}

+ (BOOL)isFileAtDirPath:(id)a3 olderThanDays:(int64_t)a4
{
  uint64_t v9 = 0;
  uint64_t v6 = [a1 _getDirSubDirURLsForDirPath:a3 error:&v9];
  if (!v6) {
    return v9 == 0;
  }
  int v7 = (void *)[a1 _getFilePathNotDSStore:v6];
  if ([v7 isEqualToString:&stru_1F084E970]) {
    return v9 == 0;
  }
  if ([a1 isDirCreationDateAtPath:v7 olderThanDays:a4]) {
    return 1;
  }
  return [a1 isFileHeaderDateAtPath:v7 olderThanDays:a4];
}

+ (BOOL)isFileHeaderDateAtPath:(id)a3 olderThanDays:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      uint64_t v15 = (uint64_t)a3;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "isFileHeaderDateAtPathOlderThanDays: checking file at path %@", (uint8_t *)&v14, 0xCu);
    }
  }
  id v8 = objc_msgSend((id)objc_msgSend(a1, "_getiChatFileMetadataForPath:", a3), "objectForKey:", @"EndTime");
  int v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [v8 description];
        int v14 = 138412290;
        uint64_t v15 = v11;
        _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "isFileHeaderDateAtPathOlderThanDays: date modified %@", (uint8_t *)&v14, 0xCu);
      }
    }
    LOBYTE(v9) = [a1 isOlderThanDays:a4 fromDate:v8];
  }
  else if (v9)
  {
    v12 = OSLogHandleForIMFoundationCategory();
    int v9 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v9)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "isFileHeaderDateAtPathOlderThanDays: dateCreated or dateMod is nil", (uint8_t *)&v14, 2u);
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

+ (BOOL)isDirCreationDateAtPath:(id)a3 olderThanDays:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = a3;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "isDirCreationDateAtPathOlderThanDays: checking how old dir at %@ is", (uint8_t *)&v13, 0xCu);
    }
  }
  id v8 = (void *)[a1 _getPathAttributesForPath:a3];
  if (IMOSLoggingEnabled())
  {
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "isDirCreationDateAtPathOlderThanDays:path attributes are %@", (uint8_t *)&v13, 0xCu);
    }
  }
  if (v8)
  {
    LOBYTE(v10) = objc_msgSend(a1, "isOlderThanDays:fromDate:", a4, objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E4F282C0]));
  }
  else
  {
    int v10 = IMOSLoggingEnabled();
    if (v10)
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      int v10 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if (v10)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "isDirCreationDateAtPathOlderThanDays: Could not locate directory at path", (uint8_t *)&v13, 2u);
        LOBYTE(v10) = 0;
      }
    }
  }
  return v10;
}

+ (BOOL)isOlderThanDays:(int64_t)a3 fromDate:(id)a4
{
  BOOL result = 0;
  if (a3)
  {
    if (a4)
    {
      double v5 = (double)(-86400 * a3);
      [a4 timeIntervalSinceNow];
      return ceil(v6) < v5;
    }
  }
  return result;
}

+ (id)_getPathAttributesForPath:(id)a3
{
  int v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  return (id)[v4 attributesOfItemAtPath:a3 error:0];
}

+ (id)_getDirSubDirURLsForDirPath:(id)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C6E8]];
  return (id)MEMORY[0x1F4181798](v5, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_);
}

+ (id)_getiChatFileMetadataForPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:"));
  uint64_t v9 = 0;
  int v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v9];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v3;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "_getiChatFileMetadataForPath: data %@", buf, 0xCu);
    }
  }
  double v6 = (void *)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v11 = v9;
        _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Failed to unarchive iChat file metadata. Error: %@", buf, 0xCu);
      }
    }
  }

  return v6;
}

+ (id)_getFilePathNotDSStore:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return &stru_1F084E970;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v11;
LABEL_3:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v11 != v6) {
      objc_enumerationMutation(a3);
    }
    id v8 = (void *)[*(id *)(*((void *)&v10 + 1) + 8 * v7) path];
    if (([v8 containsString:@".DS_Store"] & 1) == 0
      && ![v8 isEqualToString:@".DS_Store"])
    {
      return v8;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        goto LABEL_3;
      }
      return &stru_1F084E970;
    }
  }
}

@end