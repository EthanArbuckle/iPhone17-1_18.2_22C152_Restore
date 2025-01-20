@interface MSSaveEmail
+ (void)deletePlaceholderAttachmentForURL:(id)a3 completionBlock:(id)a4;
+ (void)placeholderAttachmentForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6 completionBlock:(id)a7;
+ (void)saveEmail:(id)a3 completionBlock:(id)a4;
+ (void)saveMessageData:(id)a3 forAccountWithID:(id)a4 autosaveIdentifier:(id)a5 completionBlock:(id)a6;
+ (void)securityScopeForPlaceholderURL:(id)a3 completionBlock:(id)a4;
- (void)_saveEmail:(id)a3 completionBlock:(id)a4;
- (void)_saveMessageData:(id)a3 forAccountWithID:(id)a4 autosaveIdentifier:(id)a5 completionBlock:(id)a6;
- (void)_simulateServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5;
@end

@implementation MSSaveEmail

+ (void)saveMessageData:(id)a3 forAccountWithID:(id)a4 autosaveIdentifier:(id)a5 completionBlock:(id)a6
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = objc_alloc_init(MSSaveEmail);
  [(MSSaveEmail *)v12 _saveMessageData:v13 forAccountWithID:v9 autosaveIdentifier:v10 completionBlock:v11];
}

+ (void)saveEmail:(id)a3 completionBlock:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  v6 = objc_alloc_init(MSSaveEmail);
  [(MSSaveEmail *)v6 _saveEmail:v7 completionBlock:v5];
}

- (void)_saveEmail:(id)a3 completionBlock:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x2166BBAE0]();
  v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  if (v8)
  {
    id v9 = [MEMORY[0x263EFF9A0] dictionaryWithObject:v8 forKey:@"email"];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__MSSaveEmail__saveEmail_completionBlock___block_invoke;
    v11[3] = &unk_264242E08;
    id v12 = v6;
    [(MSService *)self _callServicesMethod:@"SaveEmail" arguments:v9 callback:v11];
  }
  else
  {
    id v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = [0 length];
      _os_log_impl(&dword_215471000, v10, OS_LOG_TYPE_DEFAULT, "#Warning Unable to unarchive model data with length %lu", buf, 0xCu);
    }

    id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v9);
  }
}

void __42__MSSaveEmail__saveEmail_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7)
  {
    id v6 = [v7 objectForKey:@"messageid"];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_saveMessageData:(id)a3 forAccountWithID:(id)a4 autosaveIdentifier:(id)a5 completionBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MSSaveEmail.m", 67, @"Invalid parameter not satisfying: %@", @"messageData" object file lineNumber description];
  }
  uint64_t v15 = (void *)MEMORY[0x2166BBAE0]();
  v16 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", v11, @"RFC822Data", v12, @"UniqueID", v13, @"autosaveidentifier", 0);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __84__MSSaveEmail__saveMessageData_forAccountWithID_autosaveIdentifier_completionBlock___block_invoke;
  v19[3] = &unk_264242E08;
  id v17 = v14;
  id v20 = v17;
  [(MSService *)self _callServicesMethod:@"MailSaveMessage" arguments:v16 callback:v19];
}

void __84__MSSaveEmail__saveMessageData_forAccountWithID_autosaveIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7)
  {
    id v6 = [v7 objectForKey:@"success"];
    [v6 BOOLValue];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_simulateServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5
{
  v14[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  if ([v8 isEqualToString:@"MailSaveMessage"])
  {
    id v13 = @"success";
    v14[0] = &unk_26C603798;
    id v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v10[2](v10, v11, 0);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MSSaveEmail;
    [(MSService *)&v12 _simulateServicesMethod:v8 arguments:v9 callback:v10];
  }
}

+ (void)placeholderAttachmentForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6 completionBlock:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  uint64_t v15 = (__CFString *)a6;
  id v16 = a7;
  if (v13)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"MSSaveEmail.m", 100, @"Invalid parameter not satisfying: %@", @"fileName" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v23 = [MEMORY[0x263F08690] currentHandler];
  [v23 handleFailureInMethod:a2, a1, @"MSSaveEmail.m", 101, @"Invalid parameter not satisfying: %@", @"fileSize" object file lineNumber description];

LABEL_3:
  if (!v15) {
    uint64_t v15 = &stru_26C6000F0;
  }
  id v17 = (void *)MEMORY[0x2166BBAE0]();
  v18 = objc_alloc_init(MSSaveEmail);
  v19 = [MEMORY[0x263EFF9A0] dictionary];
  [v19 setObject:&unk_26C6037B0 forKeyedSubscript:@"MSAttachmentRequestKeyOperation"];
  [v19 setObject:v13 forKeyedSubscript:@"MSAttachmentRequestKeyNameType"];
  id v20 = [NSNumber numberWithInteger:a4];
  [v19 setObject:v20 forKeyedSubscript:@"MSAttachmentRequestKeySizeType"];

  if (v14) {
    [v19 setObject:v14 forKeyedSubscript:@"MSAttachmentRequestKeyMimeType"];
  }
  [v19 setObject:v15 forKeyedSubscript:@"MSAttachmentRequestKeyContentID"];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __92__MSSaveEmail_placeholderAttachmentForFileName_fileSize_mimeType_contentID_completionBlock___block_invoke;
  v24[3] = &unk_264242E08;
  id v21 = v16;
  id v25 = v21;
  [(MSService *)v18 _callServicesMethod:@"MSAttachmentRequest" arguments:v19 callback:v24];
}

void __92__MSSaveEmail_placeholderAttachmentForFileName_fileSize_mimeType_contentID_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 objectForKey:@"MSAttachmentResponse"];
    if (!v7)
    {
      id v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_215471000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Attachment NSData failure to persist", v10, 2u);
      }
    }
    id v9 = [v7 objectForKey:@"MSAttachmentResponseKeyData"];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (void)deletePlaceholderAttachmentForURL:(id)a3 completionBlock:(id)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"MSSaveEmail.m", 133, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  id v9 = (void *)MEMORY[0x2166BBAE0]();
  id v10 = objc_alloc_init(MSSaveEmail);
  v16[0] = @"MSAttachmentRequestKeyOperation";
  v16[1] = @"MSAttachmentRequestKeyURL";
  v17[0] = &unk_26C6037C8;
  v17[1] = v7;
  id v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __65__MSSaveEmail_deletePlaceholderAttachmentForURL_completionBlock___block_invoke;
  v14[3] = &unk_264242E08;
  id v12 = v8;
  id v15 = v12;
  [(MSService *)v10 _callServicesMethod:@"MSAttachmentRequest" arguments:v11 callback:v14];
}

void __65__MSSaveEmail_deletePlaceholderAttachmentForURL_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 objectForKey:@"MSAttachmentResponse"];
    if (!v7)
    {
      id v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_215471000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Attachment URL failure to remove", v10, 2u);
      }
    }
    id v9 = [v7 objectForKey:@"MSAttachmentResponseKeyError"];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (void)securityScopeForPlaceholderURL:(id)a3 completionBlock:(id)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"MSSaveEmail.m", 155, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  id v9 = (void *)MEMORY[0x2166BBAE0]();
  id v10 = objc_alloc_init(MSSaveEmail);
  v16[0] = @"MSAttachmentRequestKeyOperation";
  v16[1] = @"MSAttachmentRequestKeyURL";
  v17[0] = &unk_26C6037E0;
  v17[1] = v7;
  id v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __62__MSSaveEmail_securityScopeForPlaceholderURL_completionBlock___block_invoke;
  v14[3] = &unk_264242E08;
  id v12 = v8;
  id v15 = v12;
  [(MSService *)v10 _callServicesMethod:@"MSAttachmentRequest" arguments:v11 callback:v14];
}

void __62__MSSaveEmail_securityScopeForPlaceholderURL_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 objectForKey:@"MSAttachmentResponse"];
    if (!v7)
    {
      id v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_215471000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Attachment URL failure to remove", v10, 2u);
      }
    }
    id v9 = [v7 objectForKey:@"MSAttachmentResponseKeyData"];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end