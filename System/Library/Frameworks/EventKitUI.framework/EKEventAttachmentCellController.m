@interface EKEventAttachmentCellController
+ (BOOL)_attachmentIsViewable:(id)a3;
+ (id)_attachmentDownloadErrorLocalizedString;
+ (id)_cannotOpenAttachmentLocalizedString;
+ (id)_keyForAttachment:(id)a3;
+ (id)_okLocalizedString;
+ (id)cellControllersForAttachments:(id)a3 givenExistingControllers:(id)a4 sourceIsManaged:(BOOL)a5;
- (EKAttachment)attachment;
- (EKEventAttachmentCell)cell;
- (EKEventAttachmentCellController)initWithAttachment:(id)a3 sourceIsManaged:(BOOL)a4;
- (EKEventAttachmentCellControllerDelegate)delegate;
- (id)_downloadProgressStringWithDownloadedBytes:(id)a3 outOfTotalBytes:(id)a4;
- (id)attachmentFilename;
- (id)event;
- (unint64_t)supportedInterfaceOrientationMaskForInterfaceOrientation:(int64_t)a3;
- (void)_clearDownloadID;
- (void)_openExternalAttachmentURLInBrowser:(id)a3;
- (void)_presentPreviewAttachmentInPreviewWithInfo:(id)a3;
- (void)_presentPreviewWithURL:(id)a3 filename:(id)a4;
- (void)cellSelected;
- (void)previewControllerWillDismiss:(id)a3;
- (void)promptToDownloadAttachment;
- (void)setAttachment:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startAttachmentDownload;
- (void)tearDown;
@end

@implementation EKEventAttachmentCellController

+ (BOOL)_attachmentIsViewable:(id)a3
{
  id v3 = a3;
  v4 = [v3 UUID];
  if (v4)
  {
  }
  else
  {
    uint64_t v5 = [v3 URLForPendingFileCopy];

    if (!v5) {
      goto LABEL_7;
    }
  }
  v6 = [v3 localURL];

  if (v6 || ([v3 URL], v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v9 = [v3 URLForPendingFileCopy];
    uint64_t v5 = v9 != 0;
  }
LABEL_7:

  return v5;
}

+ (id)_keyForAttachment:(id)a3
{
  id v3 = a3;
  v4 = [v3 UUID];

  if (v4)
  {
    uint64_t v5 = [v3 UUID];
  }
  else
  {
    uint64_t v5 = [v3 URLForPendingFileCopy];

    if (v5)
    {
      v6 = [v3 URLForPendingFileCopy];
      uint64_t v5 = [v6 absoluteString];
    }
  }

  return v5;
}

+ (id)cellControllersForAttachments:(id)a3 givenExistingControllers:(id)a4 sourceIsManaged:(BOOL)a5
{
  uint64_t v5 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    v35 = v8;
    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v34 = v7;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v53 count:16];
    unsigned int v37 = v5;
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v48 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          if (+[EKEventAttachmentCellController _attachmentIsViewable:v15])
          {
            v16 = [(id)objc_opt_class() _keyForAttachment:v15];
            [v38 setObject:v15 forKey:v16];

            uint64_t v5 = v37;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v12);
    }

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v38, "count"));
    v9 = v35;
    if (v35)
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      obuint64_t j = v35;
      uint64_t v18 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v44 != v20) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v43 + 1) + 8 * j);
            v23 = [v22 attachment];
            if ([v23 refresh]
              && ([(id)objc_opt_class() _keyForAttachment:v23],
                  v24 = objc_claimAutoreleasedReturnValue(),
                  [v38 objectForKey:v24],
                  v25 = objc_claimAutoreleasedReturnValue(),
                  v25,
                  v24,
                  v25))
            {
              [v17 addObject:v22];
              v26 = [(id)objc_opt_class() _keyForAttachment:v23];
              [v38 removeObjectForKey:v26];

              [v22 setAttachment:v23];
            }
            else
            {
              [v22 tearDown];
            }
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
        }
        while (v19);
      }

      v9 = v35;
      uint64_t v5 = v37;
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v27 = [v38 allValues];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = [[EKEventAttachmentCellController alloc] initWithAttachment:*(void *)(*((void *)&v39 + 1) + 8 * k) sourceIsManaged:v5];
          [v17 addObject:v32];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:v51 count:16];
      }
      while (v29);
    }

    id v7 = v34;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (EKEventAttachmentCellController)initWithAttachment:(id)a3 sourceIsManaged:(BOOL)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EKEventAttachmentCellController;
  id v7 = [(EKEventAttachmentCellController *)&v14 init];
  id v8 = v7;
  if (v7)
  {
    [(EKEventAttachmentCellController *)v7 setAttachment:v6];
    v8->_sourceIsManaged = a4;
    v9 = [[EKEventAttachmentCell alloc] initWithStyle:3 reuseIdentifier:@"AttachmentCell"];
    cell = v8->_cell;
    v8->_cell = v9;

    uint64_t v11 = v8->_cell;
    uint64_t v12 = [(EKEventAttachmentCellController *)v8 attachment];
    [(EKEventAttachmentCell *)v11 setAttachment:v12];
  }
  return v8;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  obuint64_t j = v4;
  if (!v4)
  {
    [(EKEventAttachmentCellController *)self tearDown];
    id v4 = 0;
  }
  objc_storeWeak((id *)&self->_delegate, v4);
}

- (void)_clearDownloadID
{
  id downloadID = self->_downloadID;
  self->_id downloadID = 0;
}

- (void)tearDown
{
  id downloadID = self->_downloadID;
  if (downloadID)
  {
    id v4 = downloadID;
    uint64_t v5 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__EKEventAttachmentCellController_tearDown__block_invoke;
    block[3] = &unk_1E6087570;
    id v8 = v4;
    id v6 = v4;
    dispatch_async(v5, block);

    [(EKEventAttachmentCellController *)self _clearDownloadID];
  }
}

void __43__EKEventAttachmentCellController_tearDown__block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F5E950] sharedConnection];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKAttachmentDomain" code:1 userInfo:0];
  [v4 cancelDownloadingAttachmentWithDownloadID:v2 error:v3];
}

+ (id)_okLocalizedString
{
  uint64_t v2 = EventKitUIBundle();
  id v3 = [v2 localizedStringForKey:@"OK" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (id)_cannotOpenAttachmentLocalizedString
{
  uint64_t v2 = EventKitUIBundle();
  id v3 = [v2 localizedStringForKey:@"Cannot Open Attachment" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (id)_attachmentDownloadErrorLocalizedString
{
  uint64_t v2 = EventKitUIBundle();
  id v3 = [v2 localizedStringForKey:@"An error occurred while downloading the attachment." value:&stru_1F0CC2140 table:0];

  return v3;
}

- (id)_downloadProgressStringWithDownloadedBytes:(id)a3 outOfTotalBytes:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F28B68];
  id v7 = a3;
  id v8 = objc_msgSend(v6, "stringFromByteCount:countStyle:", objc_msgSend(v7, "longLongValue"), 0);
  v9 = [NSNumber numberWithInt:0];
  char v10 = [v7 isEqualToNumber:v9];

  id v11 = 0;
  if ((v10 & 1) == 0)
  {
    uint64_t v12 = [NSNumber numberWithInt:0];
    int v13 = [v5 isEqualToNumber:v12];

    if (v13)
    {
      id v11 = v8;
    }
    else
    {
      objc_super v14 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(v5, "longLongValue"), 0);
      if ([v8 isEqualToString:v14])
      {
        id v11 = v8;
      }
      else
      {
        uint64_t v15 = NSString;
        v16 = EventKitUIBundle();
        v17 = [v16 localizedStringForKey:@"%@ of %@" value:&stru_1F0CC2140 table:0];
        objc_msgSend(v15, "localizedStringWithFormat:", v17, v8, v14);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v11;
}

- (void)_presentPreviewAttachmentInPreviewWithInfo:(id)a3
{
  id v4 = a3;
  id v7 = [v4 objectForKey:@"attachmentLocalURL"];
  id v5 = [v4 objectForKey:@"attachmentFileName"];

  [(EKEventAttachmentCellController *)self _presentPreviewWithURL:v7 filename:v5];
  id v6 = [(EKEventAttachmentCellController *)self cell];
  [v6 showSpinner:0];
}

- (unint64_t)supportedInterfaceOrientationMaskForInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2) {
    return 2;
  }
  else {
    return qword_1B413AD60[a3 - 2];
  }
}

- (void)_presentPreviewWithURL:(id)a3 filename:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EKEventAttachmentCellController *)self delegate];
  v9 = [v8 parentViewControllerForAttachmentCellController:self];

  char v10 = [[EKAttachmentQLItem alloc] initWithURL:v7 filename:v6];
  if ([getQLPreviewControllerClass() canPreviewItem:v10])
  {
    id v11 = objc_alloc((Class)getQLPreviewControllerClass());
    v27[0] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    int v13 = (void *)[v11 initWithPreviewItems:v12];

    [v13 setIsContentManaged:self->_sourceIsManaged];
    objc_super v14 = [(EKEventAttachmentCellController *)self cell];
    uint64_t v15 = [v14 window];
    v16 = [v15 windowScene];
    uint64_t v17 = [v16 interfaceOrientation];

    objc_msgSend(v13, "setForcedSupportedInterfaceOrientations:", -[EKEventAttachmentCellController supportedInterfaceOrientationMaskForInterfaceOrientation:](self, "supportedInterfaceOrientationMaskForInterfaceOrientation:", v17));
    [v9 presentViewController:v13 animated:1 completion:0];
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v19 = [(id)objc_opt_class() _cannotOpenAttachmentLocalizedString];
    uint64_t v20 = EventKitUIBundle();
    v21 = [v20 localizedStringForKey:@"This type of file is not supported." value:&stru_1F0CC2140 table:0];
    int v13 = [v18 alertControllerWithTitle:v19 message:v21 preferredStyle:1];

    v22 = (void *)MEMORY[0x1E4FB1410];
    v23 = [(id)objc_opt_class() _okLocalizedString];
    v24 = [v22 actionWithTitle:v23 style:1 handler:0];
    [v13 addAction:v24];

    v25 = [(EKEventAttachmentCellController *)self delegate];
    v26 = [v25 parentViewControllerForAttachmentCellController:self];

    [v26 presentViewController:v13 animated:1 completion:0];
  }
}

- (void)_openExternalAttachmentURLInBrowser:(id)a3
{
  id v4 = a3;
  id v5 = EventKitUIBundle();
  id v6 = [v5 localizedStringForKey:@"Open attachment in web browser?" value:&stru_1F0CC2140 table:0];

  id v7 = EventKitUIBundle();
  id v8 = [v7 localizedStringForKey:@"This attachment is a download link to an external website, would you like to continue opening the attachment in web browser?", &stru_1F0CC2140, 0 value table];

  v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v6 message:v8 preferredStyle:1];
  char v10 = EventKitUIBundle();
  id v11 = [v10 localizedStringForKey:@"Continue" value:&stru_1F0CC2140 table:0];

  uint64_t v12 = EventKitUIBundle();
  int v13 = [v12 localizedStringForKey:@"Cancel" value:&stru_1F0CC2140 table:0];

  objc_super v14 = (void *)MEMORY[0x1E4FB1410];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__EKEventAttachmentCellController__openExternalAttachmentURLInBrowser___block_invoke;
  v20[3] = &unk_1E60874A8;
  id v21 = v4;
  id v15 = v4;
  v16 = [v14 actionWithTitle:v11 style:0 handler:v20];
  [v9 addAction:v16];

  uint64_t v17 = [MEMORY[0x1E4FB1410] actionWithTitle:v13 style:1 handler:0];
  [v9 addAction:v17];

  uint64_t v18 = [(EKEventAttachmentCellController *)self delegate];
  uint64_t v19 = [v18 parentViewControllerForAttachmentCellController:self];

  [v19 presentViewController:v9 animated:1 completion:0];
}

void __71__EKEventAttachmentCellController__openExternalAttachmentURLInBrowser___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openURL:*(void *)(a1 + 32) withOptions:MEMORY[0x1E4F1CC08]];
}

- (id)attachmentFilename
{
  id v2 = [(EKAttachment *)self->_attachment fileName];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = EventKitUIBundle();
    id v4 = [v5 localizedStringForKey:@"Untitled Attachment" value:&stru_1F0CC2140 table:0];
  }

  return v4;
}

- (id)event
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    id v7 = [v6 owningEventForAttachmentCellController:self];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)cellSelected
{
  id v3 = [(EKAttachment *)self->_attachment localURL];
  attachment = self->_attachment;
  if (v3) {
    [(EKAttachment *)attachment localURL];
  }
  else {
  char v5 = [(EKAttachment *)attachment URLForPendingFileCopy];
  }

  if (v5)
  {
    id v6 = [v5 scheme];

    if (!v6)
    {
      id v7 = (void *)MEMORY[0x1E4F1CB10];
      id v8 = [v5 path];
      uint64_t v9 = [v7 fileURLWithPath:v8];

      char v5 = (void *)v9;
    }
  }
  char v10 = [(EKEventAttachmentCellController *)self attachmentFilename];
  id v11 = [v10 pathExtension];
  uint64_t v12 = [(EKAttachment *)self->_attachment UUID];
  int v13 = [(EKEventAttachmentCellController *)self event];
  objc_super v14 = [v13 calendar];
  id v15 = [v14 source];
  v16 = [v15 constraints];
  int v17 = [v16 requiresOpeningAttachmentAsLink];

  if (v17)
  {
    uint64_t v18 = [(EKAttachment *)self->_attachment URL];
    [(EKEventAttachmentCellController *)self _openExternalAttachmentURLInBrowser:v18];
LABEL_9:

    goto LABEL_18;
  }
  uint64_t v19 = [v5 pathExtension];
  if ([v19 isEqualToString:@"zip"])
  {
    char v20 = [v11 isEqualToString:@"zip"];

    if ((v20 & 1) == 0)
    {
      uint64_t v18 = [MEMORY[0x1E4F25498] createTempDestinationURLWithExtension:v11];
      id v21 = [v5 path];
      v22 = [v18 path];
      int v23 = UnzipArchive();

      if (v23) {
        [(EKEventAttachmentCellController *)self _presentPreviewWithURL:v18 filename:v10];
      }

      goto LABEL_9;
    }
  }
  else
  {
  }
  if (v5)
  {
    [(EKEventAttachmentCellController *)self _presentPreviewWithURL:v5 filename:v10];
    goto LABEL_18;
  }
  if (v12)
  {
    v24 = [(EKAttachment *)self->_attachment URL];
    if (v24)
    {
      id downloadID = self->_downloadID;

      if (!downloadID)
      {
        v26 = [v13 calendar];
        v27 = [v26 source];
        uint64_t v28 = [v27 externalID];

        uint64_t v29 = [v13 calendar];
        LODWORD(v27) = [v29 isSubscribed];

        if (v27) {
          BOOL v30 = [v28 compare:@"Subscribed Calendars"] == 0;
        }
        else {
          BOOL v30 = 0;
        }
        if (!v28 || v30)
        {
          long long v46 = [v13 calendar];
          long long v44 = [v46 eventStore];
          v31 = [v44 defaultCalendarForNewEvents];
          [v31 source];
          v33 = v32 = v28;
          uint64_t v34 = [v33 externalID];

          uint64_t v28 = (void *)v34;
          if (!v34)
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __47__EKEventAttachmentCellController_cellSelected__block_invoke;
            block[3] = &unk_1E6087570;
            void block[4] = self;
            dispatch_async(MEMORY[0x1E4F14428], block);
            goto LABEL_18;
          }
        }
        long long v47 = v28;
        v35 = [v13 calendar];
        v36 = [v35 source];

        if ([v36 sourceType] == 1)
        {
          unsigned int v37 = 0;
          v38 = 0;
        }
        else
        {
          uint64_t v45 = [(EKAttachment *)self->_attachment URL];
          int v39 = [v36 serverUsesSSL];
          long long v40 = [v36 serverHost];
          id v41 = objc_alloc_init(MEMORY[0x1E4F29088]);
          long long v42 = v41;
          if (v39) {
            long long v43 = @"https";
          }
          else {
            long long v43 = @"http";
          }
          [v41 setScheme:v43];
          [v42 setHost:v40];
          v38 = [v42 URL];

          unsigned int v37 = (void *)v45;
          if (![MEMORY[0x1E4F57670] attachmentURL:v45 matchesServerURL:v38])
          {
            [(EKEventAttachmentCellController *)self promptToDownloadAttachment];
            goto LABEL_37;
          }
        }
        [(EKEventAttachmentCellController *)self startAttachmentDownload];
LABEL_37:
      }
    }
  }
LABEL_18:
}

void __47__EKEventAttachmentCellController_cellSelected__block_invoke(uint64_t a1)
{
  id v9 = [(id)objc_opt_class() _cannotOpenAttachmentLocalizedString];
  id v2 = [(id)objc_opt_class() _attachmentDownloadErrorLocalizedString];
  id v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v2 preferredStyle:1];
  id v4 = (void *)MEMORY[0x1E4FB1410];
  char v5 = [(id)objc_opt_class() _okLocalizedString];
  id v6 = [v4 actionWithTitle:v5 style:1 handler:0];
  [v3 addAction:v6];

  id v7 = [*(id *)(a1 + 32) delegate];
  id v8 = [v7 parentViewControllerForAttachmentCellController:*(void *)(a1 + 32)];

  [v8 presentViewController:v3 animated:1 completion:0];
}

- (void)promptToDownloadAttachment
{
  id v3 = EventKitUIBundle();
  id v4 = [v3 localizedStringForKey:@"The attachment is on a different server than the event." value:&stru_1F0CC2140 table:0];

  char v5 = NSString;
  id v6 = EventKitUIBundle();
  id v7 = [v6 localizedStringForKey:@"Would you like to download it from “%@”?" value:&stru_1F0CC2140 table:0];
  id v8 = [(EKAttachment *)self->_attachment URL];
  id v9 = [v8 host];
  char v10 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v9);

  id v11 = EventKitUIBundle();
  uint64_t v12 = [v11 localizedStringForKey:@"Download" value:&stru_1F0CC2140 table:0];

  int v13 = EventKitUIBundle();
  objc_super v14 = [v13 localizedStringForKey:@"Cancel" value:&stru_1F0CC2140 table:0];

  id v15 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:v10 preferredStyle:1];
  v16 = [MEMORY[0x1E4FB1410] actionWithTitle:v14 style:0 handler:0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__EKEventAttachmentCellController_promptToDownloadAttachment__block_invoke;
  v20[3] = &unk_1E60874A8;
  void v20[4] = self;
  int v17 = [MEMORY[0x1E4FB1410] actionWithTitle:v12 style:0 handler:v20];
  [v15 addAction:v16];
  [v15 addAction:v17];
  uint64_t v18 = [(EKEventAttachmentCellController *)self delegate];
  uint64_t v19 = [v18 parentViewControllerForAttachmentCellController:self];

  [v19 presentViewController:v15 animated:1 completion:0];
}

uint64_t __61__EKEventAttachmentCellController_promptToDownloadAttachment__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startAttachmentDownload];
}

- (void)startAttachmentDownload
{
  id v3 = [(EKEventAttachmentCellController *)self cell];
  [v3 showSpinner:1];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke;
  aBlock[3] = &unk_1E608A9C8;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  char v5 = [(EKEventAttachmentCellController *)self event];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_3;
  v16[3] = &unk_1E608A9F0;
  v16[4] = self;
  id v17 = v5;
  id v6 = v5;
  id v7 = _Block_copy(v16);
  id v8 = [v6 calendar];
  id v9 = [v8 source];
  char v10 = [v9 externalID];

  id v11 = [MEMORY[0x1E4F5E950] sharedConnection];
  uint64_t v12 = [(EKAttachment *)self->_attachment UUID];
  int v13 = dispatch_get_global_queue(0, 0);
  objc_super v14 = [v11 beginDownloadingAttachmentWithUUID:v12 accountID:v10 queue:v13 progressBlock:v4 completionBlock:v7];
  id downloadID = self->_downloadID;
  self->_id downloadID = v14;
}

void __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = [NSNumber numberWithLongLong:a4];
  id v9 = [NSNumber numberWithLongLong:a5];
  char v10 = [v7 _downloadProgressStringWithDownloadedBytes:v8 outOfTotalBytes:v9];

  if (v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_2;
    v11[3] = &unk_1E6087D68;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

void __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) cell];
  id v2 = [v3 detailTextLabel];
  [v2 setText:v1];
}

void __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_4;
    block[3] = &unk_1E6087570;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v6 = [v5 domain];
    char v7 = [v6 isEqualToString:@"EKAttachmentDomain"];

    if ((v7 & 1) == 0)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_5;
      v16[3] = &unk_1E6087D68;
      id v8 = *(void **)(a1 + 40);
      v16[4] = *(void *)(a1 + 32);
      id v17 = v8;
      id v9 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v16);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 32) refresh];
    char v10 = [*(id *)(*(void *)(a1 + 32) + 32) localURL];
    if (v10)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v11 setObject:v10 forKey:@"attachmentLocalURL"];
      id v12 = [*(id *)(a1 + 32) attachmentFilename];
      [v11 setObject:v12 forKey:@"attachmentFileName"];

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_6;
      v14[3] = &unk_1E6087D68;
      v14[4] = *(void *)(a1 + 32);
      id v15 = v11;
      id v13 = v11;
      dispatch_async(MEMORY[0x1E4F14428], v14);
    }
  }
  [*(id *)(a1 + 32) _clearDownloadID];
}

void __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cell];
  [v1 showSpinner:0];
}

void __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_5(uint64_t a1)
{
  id v12 = [(id)objc_opt_class() _cannotOpenAttachmentLocalizedString];
  id v2 = [*(id *)(a1 + 40) calendar];
  char v3 = [v2 isSubscribed];

  if (v3)
  {
    id v4 = EventKitUIBundle();
    id v5 = [v4 localizedStringForKey:@"Attachments on subscribed calendar events cannot be downloaded." value:&stru_1F0CC2140 table:0];
  }
  else
  {
    id v5 = [(id)objc_opt_class() _attachmentDownloadErrorLocalizedString];
  }
  id v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v12 message:v5 preferredStyle:1];
  char v7 = (void *)MEMORY[0x1E4FB1410];
  id v8 = [(id)objc_opt_class() _okLocalizedString];
  id v9 = [v7 actionWithTitle:v8 style:1 handler:0];
  [v6 addAction:v9];

  char v10 = [*(id *)(a1 + 32) delegate];
  id v11 = [v10 parentViewControllerForAttachmentCellController:*(void *)(a1 + 32)];

  [v11 presentViewController:v6 animated:1 completion:0];
}

uint64_t __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentPreviewAttachmentInPreviewWithInfo:*(void *)(a1 + 40)];
}

- (void)previewControllerWillDismiss:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  [v5 postNotificationName:@"EKDocumentQuickLookWillEndNotification" object:v4];
}

- (EKEventAttachmentCell)cell
{
  return (EKEventAttachmentCell *)objc_getProperty(self, a2, 16, 1);
}

- (EKAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
}

- (EKEventAttachmentCellControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKEventAttachmentCellControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_cell, 0);

  objc_storeStrong(&self->_downloadID, 0);
}

@end