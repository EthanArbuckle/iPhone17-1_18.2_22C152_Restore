@interface _SFSaveToFilesOperation
- (_SFSaveToFilesOperation)initWithActivityItemProviderCollection:(id)a3;
- (_SFSaveToFilesOperationDelegate)delegate;
- (id)_temporaryFileWithName:(id)a3;
- (void)_copyFileData:(id)a3;
- (void)_finishWithURL:(id)a3;
- (void)_showDocumentPickerForFileURL:(id)a3 sourceURL:(id)a4 willStartDownload:(BOOL)a5;
- (void)dealloc;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)importPlaceholderForDownload:(id)a3 fromURL:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation _SFSaveToFilesOperation

- (_SFSaveToFilesOperation)initWithActivityItemProviderCollection:(id)a3
{
  id v5 = a3;
  v6 = [(_SFSaveToFilesOperation *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  id v2 = a1;
  v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v4, v5, "Failed to delete temporary directory: %{public}@", v6, v7, v8, v9, v10);
}

- (void)start
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32___SFSaveToFilesOperation_start__block_invoke;
  block[3] = &unk_1E5C724D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_showDocumentPickerForFileURL:(id)a3 sourceURL:(id)a4 willStartDownload:(BOOL)a5
{
  BOOL v5 = a5;
  objc_msgSend(MEMORY[0x1E4FB16F0], "sf_documentPickerViewControllerWithURL:inMode:sourceURL:", a3, 2, a4);
  uint64_t v7 = (UIDocumentPickerViewController *)objc_claimAutoreleasedReturnValue();
  documentPickerViewController = self->_documentPickerViewController;
  self->_documentPickerViewController = v7;

  [(UIDocumentPickerViewController *)self->_documentPickerViewController setDelegate:self];
  [(UIDocumentPickerViewController *)self->_documentPickerViewController _setForPickingDownloadsFolder:v5];
  id v9 = (id)directoryURLOfLastSuccessfulSave;
  if (!v9)
  {
    if (objc_opt_respondsToSelector())
    {
      id v9 = [MEMORY[0x1E4F42978] placeholderURLForDownloadsFolder];
    }
    else
    {
      id v9 = 0;
    }
  }
  id v11 = v9;
  [(UIDocumentPickerViewController *)self->_documentPickerViewController setDirectoryURL:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector()) {
    -[UIDocumentPickerViewController _setAutomaticallyDismissesAfterCompletion:](self->_documentPickerViewController, "_setAutomaticallyDismissesAfterCompletion:", [WeakRetained saveToFilesOperationShouldDismissViewControllerAfterCompletion:self]);
  }
  [WeakRetained saveToFilesOperation:self presentViewController:self->_documentPickerViewController];
}

- (void)_finishWithURL:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  downloadPlaceholderCompletionHandler = (void (**)(id, id))self->_downloadPlaceholderCompletionHandler;
  if (!downloadPlaceholderCompletionHandler)
  {
    download = self->_download;
    self->_download = 0;

    if (v4) {
      goto LABEL_5;
    }
LABEL_7:
    uint64_t v11 = 0;
    goto LABEL_8;
  }
  downloadPlaceholderCompletionHandler[2](downloadPlaceholderCompletionHandler, v4);
  id v6 = self->_downloadPlaceholderCompletionHandler;
  self->_downloadPlaceholderCompletionHandler = 0;

  if (!v4)
  {
    v12 = +[_SFDownloadManager sharedManager];
    v16[0] = self->_download;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v12 removeDownloads:v13];

    v14 = self->_download;
    self->_download = 0;

    goto LABEL_7;
  }
  uint64_t v7 = self->_download;
  self->_download = 0;

LABEL_5:
  uint64_t v9 = [v4 URLByDeletingLastPathComponent];
  uint8_t v10 = (void *)directoryURLOfLastSuccessfulSave;
  directoryURLOfLastSuccessfulSave = v9;

  uint64_t v11 = 1;
LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained saveToFilesOperation:self didFinishWithSuccess:v11];
}

- (id)_temporaryFileWithName:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28CB8];
  id v5 = a3;
  id v6 = [v4 defaultManager];
  objc_msgSend(v6, "_webkit_createTemporaryDirectoryWithTemplatePrefix:", @"File");
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  containerDirectoryPath = self->_containerDirectoryPath;
  self->_containerDirectoryPath = v7;

  uint64_t v9 = [(NSString *)self->_containerDirectoryPath stringByAppendingPathComponent:v5];

  uint8_t v10 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v11 = objc_msgSend(v6, "_web_pathWithUniqueFilenameForPath:", v9);
  v12 = [v10 fileURLWithPath:v11];

  return v12;
}

- (void)_copyFileData:(id)a3
{
  id v4 = (void (**)(id, void *, void *, void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  id v6 = [WeakRetained customizationControllerForSaveToFilesOperation:self];
  uint64_t v7 = v6;
  if (!v6)
  {
LABEL_6:
    char v8 = 1;
    goto LABEL_7;
  }
  if (![v6 canShareAsStandaloneImage])
  {
LABEL_12:
    int v21 = [v7 canShareAsDownload];
    char v20 = 0;
    goto LABEL_13;
  }
  char v8 = 0;
LABEL_7:
  uint64_t v9 = [(_SFActivityItemProviderCollection *)self->_collection standaloneImageProvider];

  if (v9)
  {
    uint8_t v10 = [(_SFActivityItemProviderCollection *)self->_collection standaloneImageProvider];
    uint64_t v11 = [v10 item];

    v12 = [(_SFActivityItemProviderCollection *)self->_collection webView];
    v13 = objc_msgSend(v12, "_sf_suggestedFilename");
    v14 = [v12 _committedURL];
    v15 = (void *)MEMORY[0x1E4F78328];
    v16 = [v12 _MIMEType];
    v17 = [v15 properFilenameForOriginalFilename:v13 typeIdentifier:0 mimeType:v16 sourceURL:v14];
    v18 = [(_SFSaveToFilesOperation *)self _temporaryFileWithName:v17];

    id v49 = 0;
    LODWORD(v16) = [v11 writeToURL:v18 options:0 error:&v49];
    id v19 = v49;
    if (v16)
    {
      v4[2](v4, v18, v14, 0);
    }
    else
    {
      v26 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[_SFSaveToFilesOperation _copyFileData:](v26);
      }
      v4[2](v4, 0, 0, 0);
    }

    goto LABEL_21;
  }
  if ((v8 & 1) == 0) {
    goto LABEL_12;
  }
  char v20 = 1;
  int v21 = 1;
LABEL_13:
  v22 = [(_SFActivityItemProviderCollection *)self->_collection downloadProvider];
  uint64_t v11 = v22;
  if (v21 && v22)
  {
    v23 = [v22 item];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [v11 quickLookDocument];
      v25 = [v24 sourceURL];
      v4[2](v4, v23, v25, 0);
    }
    else
    {
      v4[2](v4, 0, 0, 0);
    }
    goto LABEL_29;
  }
  if ((v20 & 1) != 0 || [v7 canShareAsWebArchive])
  {
    v27 = [(_SFActivityItemProviderCollection *)self->_collection webArchiveProvider];

    if (v27)
    {
      v28 = [(_SFActivityItemProviderCollection *)self->_collection webArchiveProvider];
      v12 = [v28 item];

      if (v12)
      {
        uint64_t v29 = *MEMORY[0x1E4F22730];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __41___SFSaveToFilesOperation__copyFileData___block_invoke;
        v47[3] = &unk_1E5C77D80;
        v47[4] = self;
        v48 = v4;
        [v12 loadItemForTypeIdentifier:v29 options:0 completionHandler:v47];
      }
      else
      {
        v4[2](v4, 0, 0, 0);
      }
      goto LABEL_22;
    }
    if (v20) {
      goto LABEL_48;
    }
  }
  if ([v7 canShareAsPDF])
  {
LABEL_48:
    v30 = [(_SFActivityItemProviderCollection *)self->_collection printProvider];

    if (v30)
    {
      v12 = [(_SFActivityItemProviderCollection *)self->_collection printProvider];
      v31 = [v12 pdfItemProvider];
      v13 = v31;
      if (v31)
      {
        uint64_t v32 = *MEMORY[0x1E4F22668];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __41___SFSaveToFilesOperation__copyFileData___block_invoke_3;
        v43[3] = &unk_1E5C77DA8;
        id v44 = v31;
        v45 = self;
        v46 = v4;
        id v33 = (id)[v44 loadDataRepresentationForTypeIdentifier:v32 completionHandler:v43];
      }
      else
      {
        v4[2](v4, 0, 0, 0);
      }
LABEL_21:

LABEL_22:
      goto LABEL_45;
    }
  }
  if ([(_SFActivityItemProviderCollection *)self->_collection displayingStandaloneMedia])
  {
    v34 = self;
    id v35 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      int v36 = [v35 saveToFilesOperationSupportsDownloads:v34];

      if (v36)
      {
        v23 = [(_SFActivityItemProviderCollection *)self->_collection webView];
        v37 = +[_SFDownloadDispatcher sharedDownloadDispatcher];
        v38 = [v37 startDownloadForCurrentURLFromWebView:v23];

        [v38 setExplicitlySaved:1];
        v39 = +[_SFDownloadManager sharedManager];
        [v38 setDelegate:v39];

        [v38 setPlaceholderImporter:v34];
        uint64_t v40 = MEMORY[0x1AD0C36A0](v4);
        id prepareDownloadPlaceholderHandler = v34->_prepareDownloadPlaceholderHandler;
        v34->_id prepareDownloadPlaceholderHandler = (id)v40;

LABEL_29:
        goto LABEL_45;
      }
    }
    else
    {
    }
  }
  v42 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
    -[_SFSaveToFilesOperation _copyFileData:](v42);
  }
  v4[2](v4, 0, 0, 0);
LABEL_45:
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  objc_msgSend(a4, "firstObject", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(_SFSaveToFilesOperation *)self _finishWithURL:v5];
}

- (void)documentPickerWasCancelled:(id)a3
{
}

- (void)importPlaceholderForDownload:(id)a3 fromURL:(id)a4 completionHandler:(id)a5
{
  id v17 = a3;
  id v9 = a4;
  uint8_t v10 = (void (**)(id, void))a5;
  uint64_t v11 = (void *)MEMORY[0x1AD0C36A0]();
  id downloadPlaceholderCompletionHandler = self->_downloadPlaceholderCompletionHandler;
  self->_id downloadPlaceholderCompletionHandler = v11;

  [v17 setPlaceholderImporter:0];
  p_id prepareDownloadPlaceholderHandler = &self->_prepareDownloadPlaceholderHandler;
  if (self->_prepareDownloadPlaceholderHandler)
  {
    objc_storeStrong((id *)&self->_download, a3);
    id prepareDownloadPlaceholderHandler = (void (**)(id, id, void *, uint64_t))self->_prepareDownloadPlaceholderHandler;
    v15 = [v17 sourceURL];
    prepareDownloadPlaceholderHandler[2](prepareDownloadPlaceholderHandler, v9, v15, 1);
  }
  else
  {
    v10[2](v10, 0);
    p_id prepareDownloadPlaceholderHandler = &self->_downloadPlaceholderCompletionHandler;
  }
  id v16 = *p_prepareDownloadPlaceholderHandler;
  *p_id prepareDownloadPlaceholderHandler = 0;
}

- (_SFSaveToFilesOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFSaveToFilesOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_download, 0);
  objc_storeStrong(&self->_prepareDownloadPlaceholderHandler, 0);
  objc_storeStrong(&self->_downloadPlaceholderCompletionHandler, 0);
  objc_storeStrong((id *)&self->_documentPickerViewController, 0);
  objc_storeStrong((id *)&self->_containerDirectoryPath, 0);

  objc_storeStrong((id *)&self->_collection, 0);
}

- (void)_copyFileData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Unable to prepare data to save to Files", v1, 2u);
}

- (void)_copyFileData:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v4, v5, "Failed to save standalone image data: %{public}@", v6, v7, v8, v9, v10);
}

@end