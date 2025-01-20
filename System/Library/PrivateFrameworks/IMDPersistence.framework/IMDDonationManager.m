@interface IMDDonationManager
+ (id)sharedInstance;
- (IMDDonationManager)init;
- (NSFileManager)fileManager;
- (void)copyGroupPhotoToExternalPathIfNecessary:(id)a3 chatGUID:(id)a4 attachmentFilepath:(id)a5;
- (void)dealloc;
- (void)setFileManager:(id)a3;
@end

@implementation IMDDonationManager

+ (id)sharedInstance
{
  if (qword_1EB5ABC10 != -1) {
    dispatch_once(&qword_1EB5ABC10, &unk_1F084CEC0);
  }
  v2 = (void *)qword_1EB5ABCF8;
  return v2;
}

- (IMDDonationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMDDonationManager;
  v2 = [(IMDDonationManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    fileManager = v2->_fileManager;
    v2->_fileManager = (NSFileManager *)v3;
  }
  return v2;
}

- (void)dealloc
{
  fileManager = self->_fileManager;
  self->_fileManager = 0;

  v4.receiver = self;
  v4.super_class = (Class)IMDDonationManager;
  [(IMDDonationManager *)&v4 dealloc];
}

- (void)copyGroupPhotoToExternalPathIfNecessary:(id)a3 chatGUID:(id)a4 attachmentFilepath:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (__CFString *)a4;
  v10 = (__CFString *)a5;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    v12 = [(__CFString *)v10 im_lastPathComponent];
    v13 = IMSharedHelperExternalLocationForFile();

    v14 = [(IMDDonationManager *)self fileManager];
    int v15 = [v14 fileExistsAtPath:v13];

    int v16 = IMOSLoggingEnabled();
    if (v15)
    {
      if (v16)
      {
        v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v13;
          _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "File already exists at path %@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (v16)
      {
        v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v13;
          _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "File missing at path %@. Will attempt to copy from Attachments directory", buf, 0xCu);
        }
      }
      v20 = [v13 stringByDeletingLastPathComponent];
      v21 = [(IMDDonationManager *)self fileManager];
      char v22 = objc_msgSend(v21, "__im_makeDirectoriesInPath:mode:", v20, 448);

      if ((v22 & 1) == 0 && IMOSLoggingEnabled())
      {
        v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v20;
          _os_log_impl(&dword_1AFB53000, v23, OS_LOG_TYPE_INFO, "Error creating intermediate directories for path: %@", buf, 0xCu);
        }
      }
      v24 = [(IMDDonationManager *)self fileManager];
      id v32 = 0;
      int v25 = [v24 copyItemAtPath:v11 toPath:v13 error:&v32];
      id v26 = v32;

      if (v26) {
        char v27 = 0;
      }
      else {
        char v27 = v25;
      }
      int v28 = IMOSLoggingEnabled();
      if (v27)
      {
        if (v28)
        {
          v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v34 = v13;
            __int16 v35 = 2112;
            v36 = v11;
            _os_log_impl(&dword_1AFB53000, v29, OS_LOG_TYPE_INFO, "Successfully copied to path %@ from path %@", buf, 0x16u);
          }
        }
      }
      else if (v28)
      {
        v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = @"NO";
          *(_DWORD *)buf = 138413058;
          id v34 = v13;
          __int16 v35 = 2112;
          if (v25) {
            v31 = @"YES";
          }
          v36 = v11;
          __int16 v37 = 2112;
          v38 = v31;
          __int16 v39 = 2112;
          id v40 = v26;
          _os_log_impl(&dword_1AFB53000, v30, OS_LOG_TYPE_INFO, "Error copying to path %@ from path %@ success: %@ error: %@", buf, 0x2Au);
        }
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v34 = v8;
      __int16 v35 = 2112;
      v36 = v9;
      __int16 v37 = 2112;
      v38 = v11;
      _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "early returning from copyGroupPhotoToExternalPathIfNecessary - nil argument. groupPhotoGUID %@ chatGUID %@ filepath %@", buf, 0x20u);
    }
  }
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end