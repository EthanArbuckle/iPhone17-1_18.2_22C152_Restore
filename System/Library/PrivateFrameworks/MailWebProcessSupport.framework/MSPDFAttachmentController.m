@interface MSPDFAttachmentController
+ (id)log;
- (MSPDFAttachmentControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)updateToInlinePDFAttachmentIfNeeded:(id)a3;
@end

@implementation MSPDFAttachmentController

- (void)setDelegate:(id)a3
{
}

+ (id)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__MSPDFAttachmentController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  v2 = (void *)log_log;

  return v2;
}

void __32__MSPDFAttachmentController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;
}

- (void)updateToInlinePDFAttachmentIfNeeded:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 uttype];
  char v7 = [v6 conformsToType:*MEMORY[0x263F1DBF0]];

  if (v7)
  {
    v8 = [v5 data];
    if (v8)
    {
      if (objc_msgSend(MEMORY[0x263EFFA40], "em_lockdownModeEnabled"))
      {
        v9 = +[MSPDFAttachmentController log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = [v5 contentID];
          int v24 = 138543362;
          v25 = v10;
          _os_log_impl(&dword_228C44000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) Lockdown Mode detected, disabling PDF parsing", (uint8_t *)&v24, 0xCu);
        }
      }
      else
      {
        v9 = [objc_alloc(MEMORY[0x263F14740]) initWithData:v8];
        if (!v9)
        {
          v13 = +[MSPDFAttachmentController log];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = [v5 contentID];
            [(MSPDFAttachmentController *)v14 updateToInlinePDFAttachmentIfNeeded:v13];
          }
        }
        uint64_t v15 = [v9 pageCount];
        int v16 = [v9 isLocked];
        v17 = +[MSPDFAttachmentController log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = [v5 contentID];
          int v24 = 138543874;
          v25 = v18;
          __int16 v26 = 2048;
          uint64_t v27 = v15;
          __int16 v28 = 1024;
          int v29 = v16;
          _os_log_impl(&dword_228C44000, v17, OS_LOG_TYPE_DEFAULT, "(%{public}@) Attached PDF has %lu pages, isLocked=%{BOOL}d", (uint8_t *)&v24, 0x1Cu);
        }
        if (v15 == 1) {
          char v19 = v16;
        }
        else {
          char v19 = 1;
        }
        if ((v19 & 1) == 0)
        {
          v20 = [(MSPDFAttachmentController *)self delegate];
          BOOL v21 = v20 == 0;

          if (v21)
          {
            v23 = [MEMORY[0x263F08690] currentHandler];
            [v23 handleFailureInMethod:a2 object:self file:@"MSPDFAttachmentController.m" lineNumber:44 description:@"Delegate is missing to update attachment"];
          }
          v22 = [(MSPDFAttachmentController *)self delegate];
          [v22 attachmentController:self updateToInlineAttachment:v5];
        }
      }
    }
    else
    {
      v9 = +[MSPDFAttachmentController log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v12 = [v5 contentID];
        [(MSPDFAttachmentController *)v12 updateToInlinePDFAttachmentIfNeeded:v9];
      }
    }
  }
  else
  {
    v8 = +[MSPDFAttachmentController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = [v5 contentID];
      [(MSPDFAttachmentController *)v11 updateToInlinePDFAttachmentIfNeeded:v8];
    }
  }
}

- (MSPDFAttachmentControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSPDFAttachmentControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

- (void)updateToInlinePDFAttachmentIfNeeded:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_228C44000, a2, a3, "(%{public}@) Data is missing", (uint8_t *)a2);
}

- (void)updateToInlinePDFAttachmentIfNeeded:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_228C44000, a2, a3, "(%{public}@) Could not create PDF document from data", (uint8_t *)a2);
}

- (void)updateToInlinePDFAttachmentIfNeeded:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_228C44000, a2, a3, "(%{public}@) Attachment is not a PDF", (uint8_t *)a2);
}

@end