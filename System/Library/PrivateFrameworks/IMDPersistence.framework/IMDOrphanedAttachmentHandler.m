@interface IMDOrphanedAttachmentHandler
- (IMDFileManager)fileManager;
- (IMDOrphanedAttachmentHandler)init;
- (IMDOrphanedAttachmentHandler)initWithFileManager:(id)a3;
- (unsigned)maxCleanseIterations;
- (void)_cleanseOrphanedAttachmentsWithEnumerator:(id)a3 atPath:(id)a4;
- (void)cleanseOrphanedAttachments;
- (void)cleanseOrphanedAttachmentsInDirectoryAtPath:(id)a3;
- (void)dealloc;
- (void)setFileManager:(id)a3;
@end

@implementation IMDOrphanedAttachmentHandler

- (IMDOrphanedAttachmentHandler)init
{
  v4.receiver = self;
  v4.super_class = (Class)IMDOrphanedAttachmentHandler;
  v2 = [(IMDOrphanedAttachmentHandler *)&v4 init];
  if (v2) {
    v2->_fileManager = (IMDFileManager *)objc_alloc_init(MEMORY[0x1E4F28CB8]);
  }
  return v2;
}

- (IMDOrphanedAttachmentHandler)initWithFileManager:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMDOrphanedAttachmentHandler;
  objc_super v4 = [(IMDOrphanedAttachmentHandler *)&v6 init];
  if (v4) {
    v4->_fileManager = (IMDFileManager *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMDOrphanedAttachmentHandler;
  [(IMDOrphanedAttachmentHandler *)&v3 dealloc];
}

- (unsigned)maxCleanseIterations
{
  return 500;
}

- (void)_cleanseOrphanedAttachmentsWithEnumerator:(id)a3 atPath:(id)a4
{
  *(void *)((char *)&v42[2] + 2) = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 nextObject];
  if (v4)
  {
    objc_super v6 = (void *)v4;
    unsigned int v7 = 0;
    uint64_t v34 = *MEMORY[0x1E4F1CF80];
    *(void *)&long long v5 = 138412546;
    long long v32 = v5;
    while (1)
    {
      if (v7 >= [(IMDOrphanedAttachmentHandler *)self maxCleanseIterations])
      {
        *(void *)buf = 0;
        objc_initWeak((id *)buf, self);
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = sub_1AFB8F4FC;
        v37[3] = &unk_1E5F907A0;
        objc_copyWeak(&v38, (id *)buf);
        v37[4] = a3;
        v37[5] = a4;
        IMDPersistencePerformBlock(v37, 0);
        objc_destroyWeak(&v38);
        objc_destroyWeak((id *)buf);
        return;
      }
      v8 = (void *)MEMORY[0x1B3E8A120]();
      int v9 = [a3 level];
      if (v9 != 3) {
        break;
      }
      if ([a3 level] == 3)
      {
        CFStringRef v10 = (const __CFString *)[v6 lastPathComponent];
        if (IMOSLoggingEnabled())
        {
          v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v32;
            *(void *)&buf[4] = v6;
            __int16 v41 = 2112;
            v42[0] = v10;
            _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "Examining '%@' as it looks like it contains a guid '%@'.", buf, 0x16u);
          }
        }
        CFStringRef v12 = IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID(v10, 1);
        if (v12 || (CFStringRef v12 = IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID(v10, 0)) != 0)
        {
          if (IMOSLoggingEnabled())
          {
            v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v6;
              _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "Keeping '%@' we have a record for it in the DB.", buf, 0xCu);
            }
          }
          id v14 = IMDAttachmentRecordCopyFilename(v34, (uint64_t)v12, 0);
          id v15 = IMDAttachmentRecordCopyFilename(v34, (uint64_t)v12, 1);
          v16 = (void *)[a4 stringByAppendingPathComponent:v6];
          v17 = (void *)[(IMDFileManager *)[(IMDOrphanedAttachmentHandler *)self fileManager] enumeratorAtPath:v16];
          for (uint64_t i = [v17 nextObject]; ; uint64_t i = objc_msgSend(v17, "nextObject"))
          {
            v19 = (void *)i;
            if (!i) {
              break;
            }
            v20 = (void *)MEMORY[0x1B3E8A120]();
            if (objc_msgSend((id)objc_msgSend(v19, "lastPathComponent"), "isEqualToString:", objc_msgSend(v14, "lastPathComponent")) & 1) != 0|| (objc_msgSend((id)objc_msgSend(v19, "lastPathComponent"), "isEqualToString:", objc_msgSend(v15, "lastPathComponent")) & 1) != 0|| (objc_msgSend((id)objc_msgSend(v19, "pathExtension"), "isEqualToIgnoringCase:", @"MOV"))
            {
              if (IMOSLoggingEnabled())
              {
                v21 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&buf[4] = v19;
                  _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, "  Not deleting the actual attachment: %@", buf, 0xCu);
                }
              }
            }
            else
            {
              uint64_t v22 = [v16 stringByAppendingPathComponent:v19];
              if (IMOSLoggingEnabled())
              {
                v23 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&buf[4] = v22;
                  _os_log_impl(&dword_1AFB53000, v23, OS_LOG_TYPE_INFO, "  Deleting preview: %@", buf, 0xCu);
                }
              }
              [(IMDFileManager *)[(IMDOrphanedAttachmentHandler *)self fileManager] removeItemAtPath:v22 error:0];
            }
          }

          CFRelease(v12);
          goto LABEL_32;
        }
        uint64_t v39 = 0;
        uint64_t v28 = [a4 stringByAppendingPathComponent:v6];
        if (IMOSLoggingEnabled())
        {
          v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v28;
            _os_log_impl(&dword_1AFB53000, v29, OS_LOG_TYPE_INFO, "To Delete: %@", buf, 0xCu);
          }
        }
        [(IMDFileManager *)[(IMDOrphanedAttachmentHandler *)self fileManager] removeItemAtPath:v28 error:&v39];
        if (!IMOSLoggingEnabled()) {
          goto LABEL_32;
        }
        v30 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
          goto LABEL_32;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v28;
        v25 = v30;
        v26 = "Cleaned up '%@'";
        uint32_t v27 = 12;
LABEL_30:
        _os_log_impl(&dword_1AFB53000, v25, OS_LOG_TYPE_INFO, v26, buf, v27);
      }
LABEL_32:
      objc_super v6 = (void *)[a3 nextObject];
      ++v7;
      if (!v6) {
        goto LABEL_40;
      }
    }
    if (!IMOSLoggingEnabled()) {
      goto LABEL_32;
    }
    v24 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v6;
    __int16 v41 = 1024;
    LODWORD(v42[0]) = v9;
    WORD2(v42[0]) = 1024;
    *(_DWORD *)((char *)v42 + 6) = 3;
    v25 = v24;
    v26 = "Skipping '%@' as its level is %d and our target level is %d.";
    uint32_t v27 = 24;
    goto LABEL_30;
  }
LABEL_40:
  if (IMOSLoggingEnabled())
  {
    v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = @"successfully.";
      _os_log_impl(&dword_1AFB53000, v31, OS_LOG_TYPE_INFO, "File cleanse ended %@", buf, 0xCu);
    }
  }
}

- (void)cleanseOrphanedAttachments
{
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Beginning file cleanse.", v4, 2u);
    }
  }
  -[IMDOrphanedAttachmentHandler cleanseOrphanedAttachmentsInDirectoryAtPath:](self, "cleanseOrphanedAttachmentsInDirectoryAtPath:", [@"/var/mobile/Library/SMS/Attachments" stringByExpandingTildeInPath]);
}

- (void)cleanseOrphanedAttachmentsInDirectoryAtPath:(id)a3
{
  uint64_t v5 = [(IMDFileManager *)[(IMDOrphanedAttachmentHandler *)self fileManager] enumeratorAtPath:a3];
  [(IMDOrphanedAttachmentHandler *)self _cleanseOrphanedAttachmentsWithEnumerator:v5 atPath:a3];
}

- (IMDFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

@end