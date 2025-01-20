@interface CKAttachmentSaver
- (CKAttachmentSaver)initWithAttachments:(id)a3;
- (void)_pop;
- (void)_saveCompletion:(id)a3;
- (void)_saveCompletionForImage:(id)a3 error:(id)a4 context:(void *)a5;
- (void)_saveCompletionForVideoWithPath:(id)a3 error:(id)a4 context:(void *)a5;
- (void)_saveNextAttachment;
- (void)popAndSaveNextAttachment;
@end

@implementation CKAttachmentSaver

- (CKAttachmentSaver)initWithAttachments:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKAttachmentSaver;
  v5 = [(CKAttachmentSaver *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    attachments = v5->_attachments;
    v5->_attachments = (NSMutableArray *)v6;
  }
  return v5;
}

- (void)popAndSaveNextAttachment
{
  [(CKAttachmentSaver *)self _pop];

  [(CKAttachmentSaver *)self _saveNextAttachment];
}

- (void)_pop
{
  if ([(NSMutableArray *)self->_attachments count]) {
    [(NSMutableArray *)self->_attachments removeObjectAtIndex:0];
  }
  self->_errorCount = 0;
}

- (void)_saveNextAttachment
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_attachments count])
  {
    v3 = [(NSMutableArray *)self->_attachments objectAtIndex:0];
    id v4 = [v3 fileURL];
    v5 = [v4 path];
    BOOL IsCompatibleWithSavedPhotosAlbum = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(v5);

    if (IsCompatibleWithSavedPhotosAlbum)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(46);
        v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v4;
          _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_DEBUG, "Attempting to save video attachment with URL %@", (uint8_t *)&buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_CKShouldLog())
        {
          v24 = v4;
          _CKLog();
        }
      }
      objc_msgSend(v4, "path", v24);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      UISaveVideoAtPathToSavedPhotosAlbum(v8, self, sel__saveCompletionForVideoWithPath_error_context_, 0);
    }
    else
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v38 = 0x2020000000;
      char v39 = 0;
      if ([v3 isIrisAsset])
      {
        objc_super v9 = [v3 fileURL];
        v10 = [v9 path];

        v11 = [v3 calculateIrisVideoPath];
        id v12 = objc_alloc(MEMORY[0x1E4F8CE20]);
        uint64_t v13 = MEMORY[0x192FBA870]("kCMTimeInvalid", @"CoreMedia");
        long long v14 = *(_OWORD *)v13;
        uint64_t v32 = *(void *)(v13 + 16);
        long long v31 = v14;
        v15 = (void *)[v12 initWithPathToVideo:v11 pathToImage:v10 imageDisplayTime:&v31 pairingIdentifier:0];
        dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
        if (v15)
        {
          if (_IMWillLog())
          {
            v24 = v15;
            _IMAlwaysLog();
          }
          v17 = objc_msgSend(MEMORY[0x1E4F39228], "sharedPhotoLibrary", v24);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __40__CKAttachmentSaver__saveNextAttachment__block_invoke;
          v29[3] = &unk_1E5620C40;
          id v30 = v15;
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __40__CKAttachmentSaver__saveNextAttachment__block_invoke_2;
          v25[3] = &unk_1E5621010;
          p_long long buf = &buf;
          v18 = v16;
          v26 = v18;
          v27 = self;
          [v17 performChanges:v29 completionHandler:v25];

          dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
        }
        else
        {
          _IMWarn();
          [(CKAttachmentSaver *)self popAndSaveNextAttachment];
        }
      }
      if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
      {
        v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v4];
        if (v19)
        {
          if (IMOSLoggingEnabled())
          {
            CKLogCStringForType(46);
            v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v35 = 138412290;
              v36 = v4;
              _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_DEBUG, "Attempting to save image attachment with URL %@", v35, 0xCu);
            }
          }
          if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
          {
            v24 = v4;
            _CKLog();
          }
          UIImageDataWriteToSavedPhotosAlbum();
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            CKLogCStringForType(46);
            v21 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v35 = 138412290;
              v36 = v4;
              _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_DEBUG, "Could not find data to save attachment with URL %@. Skipping.", v35, 0xCu);
            }
          }
          if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
          {
            v24 = v4;
            _CKLog();
          }
          [(CKAttachmentSaver *)self popAndSaveNextAttachment];
        }
      }
      _Block_object_dispose(&buf, 8);
    }
    v22 = objc_msgSend(MEMORY[0x1E4F6E890], "sharedInstance", v24);
    uint64_t v33 = *MEMORY[0x1E4F6DB58];
    uint64_t v34 = *MEMORY[0x1E4F6DB48];
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v22 trackEvent:*MEMORY[0x1E4F6DB28] withDictionary:v23];
  }
}

id __40__CKAttachmentSaver__saveNextAttachment__block_invoke(uint64_t a1)
{
  return (id)[MEMORY[0x1E4F38ED0] creationRequestForAssetFromVideoComplementBundle:*(void *)(a1 + 32)];
}

void __40__CKAttachmentSaver__saveNextAttachment__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  [*(id *)(a1 + 40) popAndSaveNextAttachment];
}

- (void)_saveCompletionForVideoWithPath:(id)a3 error:(id)a4 context:(void *)a5
{
}

- (void)_saveCompletionForImage:(id)a3 error:(id)a4 context:(void *)a5
{
}

- (void)_saveCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 code] == -3301)
    {
      unint64_t v6 = self->_errorCount + 1;
      self->_errorCount = v6;
      int v7 = IMOSLoggingEnabled();
      if (v6 > 4)
      {
        if (v7)
        {
          CKLogCStringForType(46);
          v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_DEBUG, "Write Busy error saving attachment too many times. Skipping.", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
          _CKLog();
        }
        [(CKAttachmentSaver *)self popAndSaveNextAttachment];
      }
      else
      {
        if (v7)
        {
          CKLogCStringForType(46);
          v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_DEBUG, "Write Busy error saving attachment. Trying again soon.", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
          _CKLog();
        }
        [(CKAttachmentSaver *)self performSelector:sel__saveNextAttachment withObject:0 afterDelay:0.25];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(46);
        objc_super v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v13 = v5;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_DEBUG, "Unexpected error saving attachment. Skipping. Error: %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        v11 = v5;
        _CKLog();
      }
      [(CKAttachmentSaver *)self popAndSaveNextAttachment];
    }
  }
  else
  {
    [(CKAttachmentSaver *)self popAndSaveNextAttachment];
  }
}

- (void).cxx_destruct
{
}

@end