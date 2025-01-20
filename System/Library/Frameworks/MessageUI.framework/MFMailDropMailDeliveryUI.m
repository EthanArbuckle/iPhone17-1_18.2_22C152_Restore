@interface MFMailDropMailDeliveryUI
- (BOOL)updateMessageWithAttachmentsSynchronously;
- (id)_contentForAttachmentPassingTest:(id)a3;
- (id)_headersByAddingMailDropHeaders:(id)a3;
- (id)_mailDropAttachmentHTMLStringForAttachment:(id)a3;
- (id)_mailDropBannerHTMLString;
- (id)_scaleImages:(id)a3 toFit:(unint64_t)a4 resultingSize:(unint64_t *)a5;
- (id)contentForContentID:(id)a3;
- (id)contentForPlaceholder:(id)a3;
- (id)contentForURL:(id)a3;
- (id)deliverSynchronouslyWithCompletion:(id)a3;
- (id)scaledImages:(id)a3;
@end

@implementation MFMailDropMailDeliveryUI

- (id)_scaleImages:(id)a3 toFit:(unint64_t)a4 resultingSize:(unint64_t *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  v8 = [(MFOutgoingMessageDelivery *)self attachmentContext];

  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F77B70]);
    [(MFOutgoingMessageDelivery *)self setAttachmentContext:v9];
  }
  v10 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v21;
  uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  v20 = a5;
  unint64_t v12 = 0;
  if (v11)
  {
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v16 = [(MFOutgoingMessageDelivery *)self attachmentContext];
        v17 = [v16 contextID];
        v18 = [v15 scaledImageToFit:a4 saveScaledImage:1 attachmentContextID:v17];

        if (v18)
        {
          [v10 addObject:v18];
          v12 += [v18 scaledFileSize];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  unint64_t *v20 = v12;

  return v10;
}

- (id)scaledImages:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F77B60] currentMessageLimit];
  unint64_t v11 = 0;
  v6 = [(MFMailDropMailDeliveryUI *)self _scaleImages:v4 toFit:2 resultingSize:&v11];
  unint64_t v7 = v11;
  if (v11 > v5)
  {
    uint64_t v8 = [(MFMailDropMailDeliveryUI *)self _scaleImages:v6 toFit:1 resultingSize:&v11];

    unint64_t v7 = v11;
    v6 = (void *)v8;
  }
  if (v7 > v5)
  {
    id v9 = EMLogMailDrop();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(MFMailDropMailDeliveryUI *)(uint64_t *)&v11 scaledImages:v9];
    }
  }

  return v6;
}

- (id)deliverSynchronouslyWithCompletion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = EMLogMailDrop();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, "Starting delivery of message with MailDrop", buf, 2u);
  }

  v20.receiver = self;
  v20.super_class = (Class)MFMailDropMailDeliveryUI;
  v6 = [(MFMailDropMailDelivery *)&v20 deliverSynchronouslyWithCompletion:v4];
  if ([v6 status])
  {
    p_super = EMLogMailDrop();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v6 status];
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = v8;
      _os_log_impl(&dword_1AF945000, p_super, OS_LOG_TYPE_DEFAULT, "Delivery of Mail Drop message failed with error: %lu", buf, 0xCu);
    }
  }
  else
  {
    id v9 = EMLogMailDrop();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF945000, v9, OS_LOG_TYPE_DEFAULT, "Delivery of Mail Drop message succeeded. Removing placeholder message.", buf, 2u);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v10 = [(MFPlaceholderMessageRewriter *)self->_rewriter rewrittenMessageContent];
    unint64_t v11 = [v10 placeholders];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          [MEMORY[0x1E4F77B80] removePlaceholder:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v23 count:16];
      }
      while (v12);
    }

    p_super = &self->_rewriter->super;
    self->_rewriter = 0;
  }

  return v6;
}

- (id)_headersByAddingMailDropHeaders:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v29 = (id)[v28 mutableCopy];
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  unint64_t v5 = [(MFMailDropMailDelivery *)self attachments];
  v30 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v6 = [(MFMailDropMailDelivery *)self imageArchiveMetadata];

  if (v6)
  {
    unint64_t v7 = [(MFMailDropMailDelivery *)self imageArchiveMetadata];
    uint64_t v8 = [v7 directUrlString];
    [v29 setHeader:v8 forKey:*MEMORY[0x1E4F606C0]];
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [(MFMailDropMailDelivery *)self attachments];
  uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v9)
  {
    v32 = 0;
    uint64_t v33 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v33) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v12 = [v11 mailDropMetadata];
        uint64_t v13 = [v12 directUrl];
        if (v13)
        {
          v14 = [v11 mailDropMetadata];
          char v15 = [v14 isPhotoArchive];

          if ((v15 & 1) == 0)
          {
            long long v16 = NSString;
            long long v17 = [v11 mailDropMetadata];
            long long v18 = [v17 directUrlString];
            long long v19 = [v11 fileName];
            objc_super v20 = [v11 mimeType];
            uint64_t v21 = [v11 decodedFileSize];
            uint64_t v22 = [v11 mailDropMetadata];
            long long v23 = [v22 expiration];
            [v23 timeIntervalSince1970];
            objc_msgSend(v16, "stringWithFormat:", @"%@; filename=\"%@\"; mimeType=\"%@\"; filesize=%lu; expiration-date=%f",
              v18,
              v19,
              v20,
              v21,
            uint64_t v25 = v24);

            v32 = (void *)v25;
            [v30 addObject:v25];
          }
        }
        else
        {
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v9);
  }
  else
  {
    v32 = 0;
  }

  if ([v30 count]) {
    [v29 setHeader:v30 forKey:*MEMORY[0x1E4F60708]];
  }
  id v26 = v29;

  return v26;
}

- (id)_mailDropAttachmentHTMLStringForAttachment:(id)a3
{
  id v3 = a3;
  long long v17 = [v3 fileName];
  id v4 = [v3 mailDropMetadata];
  uint64_t v5 = [v3 decodedFileSize];
  id v6 = [NSString alloc];
  long long v16 = [v4 directUrlString];
  char v15 = [v4 expiration];
  [v15 timeIntervalSince1970];
  double v8 = v7;
  uint64_t v9 = [v4 wrappedUrlString];
  v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  unint64_t v11 = [v10 localizedStringForKey:@"MAIL_DROP_DOWNLOADABLE" value:&stru_1F0817A00 table:@"Main"];
  uint64_t v12 = objc_msgSend(NSString, "mf_stringRepresentationForBytes:", v5);
  uint64_t v13 = objc_msgSend(v6, "initWithFormat:", *MEMORY[0x1E4F5FD40], v16, v17, v5, v8 * 1000.0, v9, v11, v17, v12);

  return v13;
}

- (id)_contentForAttachmentPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFMailDropMailDelivery *)self attachments];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__MFMailDropMailDeliveryUI__contentForAttachmentPassingTest___block_invoke;
  v13[3] = &unk_1E5F7C770;
  id v6 = v4;
  id v14 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v13];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v8 = 0;
  }
  else
  {
    uint64_t v9 = [(MFMailDropMailDelivery *)self attachments];
    v10 = [v9 objectAtIndex:v7];

    if ([v10 isMailDrop])
    {
      id v11 = [(MFMailDropMailDeliveryUI *)self _mailDropAttachmentHTMLStringForAttachment:v10];
    }
    else
    {
      id v11 = v10;
    }
    double v8 = v11;
  }

  return v8;
}

uint64_t __61__MFMailDropMailDeliveryUI__contentForAttachmentPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result) {
    *a4 = 1;
  }
  return result;
}

- (id)contentForURL:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__MFMailDropMailDeliveryUI_contentForURL___block_invoke;
  v8[3] = &unk_1E5F7A760;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(MFMailDropMailDeliveryUI *)self _contentForAttachmentPassingTest:v8];

  return v6;
}

uint64_t __42__MFMailDropMailDeliveryUI_contentForURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 url];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)contentForContentID:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__MFMailDropMailDeliveryUI_contentForContentID___block_invoke;
  v8[3] = &unk_1E5F7A760;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(MFMailDropMailDeliveryUI *)self _contentForAttachmentPassingTest:v8];

  return v6;
}

uint64_t __48__MFMailDropMailDeliveryUI_contentForContentID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 contentID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)contentForPlaceholder:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__MFMailDropMailDeliveryUI_contentForPlaceholder___block_invoke;
  v8[3] = &unk_1E5F7A760;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(MFMailDropMailDeliveryUI *)self _contentForAttachmentPassingTest:v8];

  return v6;
}

uint64_t __50__MFMailDropMailDeliveryUI_contentForPlaceholder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 contentID];
  id v4 = [*(id *)(a1 + 32) contentID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (BOOL)updateMessageWithAttachmentsSynchronously
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (int)*MEMORY[0x1E4F77C98];
  id v4 = (int *)MEMORY[0x1E4F77C88];
  uint64_t v5 = (int *)MEMORY[0x1E4F77CA8];
  uint64_t v49 = v3;
  if (*(Class *)((char *)&self->super.super.super.isa + v3))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F77C10]);
    uint64_t v7 = v3;
    id v8 = v6;
    [v6 setLibraryMessage:*(Class *)((char *)&self->super.super.super.isa + v7)];
  }
  else
  {
    uint64_t v9 = (int)*MEMORY[0x1E4F77C90];
    if (*(Class *)((char *)&self->super.super.super.isa + v9))
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F77C20]);
      [v8 setHeaders:*(Class *)((char *)&self->super.super.super.isa + *v4)];
      v10 = [*(id *)((char *)&self->super.super.super.isa + v9) string];
      [v8 setHtmlBody:v10];

      [v8 setPlaintextAlternative:*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E4F77CB0])];
      [v8 setMixedContent:*(Class *)((char *)&self->super.super.super.isa + *v5)];
    }
    else
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v11 = (int)*MEMORY[0x1E4F77CA8];
      id v12 = *(id *)((char *)&self->super.super.super.isa + v11);
      id v13 = (id)[v12 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v51;
        while (2)
        {
          for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v51 != v14) {
              objc_enumerationMutation(v12);
            }
            long long v16 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v13 = v16;
              goto LABEL_15;
            }
          }
          id v13 = (id)[v12 countByEnumeratingWithState:&v50 objects:v55 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
LABEL_15:

      id v8 = objc_alloc_init(MEMORY[0x1E4F77C28]);
      [v8 setHeaders:*(Class *)((char *)&self->super.super.super.isa + *v4)];
      [v8 setPlaintextAlternative:v13];
      [v8 setMixedContent:*(Class *)((char *)&self->super.super.super.isa + v11)];
      [v8 setTextPartsAreHTML:*((unsigned __int8 *)&self->super.super.super.isa + (int)*MEMORY[0x1E4F77CB8])];
    }
  }
  long long v17 = [[MFPlaceholderMessageRewriter alloc] initWithOriginalMessageContent:v8 resolver:self];
  rewriter = self->_rewriter;
  self->_rewriter = v17;

  uint64_t v19 = *v4;
  uint64_t v20 = *(uint64_t *)((char *)&self->super.super.super.isa + v19);
  if (!v20)
  {
    uint64_t v21 = +[MFComposeTypeFactory headersFromDelegate:self->_rewriter];
    uint64_t v22 = *(Class *)((char *)&self->super.super.super.isa + v19);
    *(Class *)((char *)&self->super.super.super.isa + v19) = v21;

    uint64_t v20 = *(uint64_t *)((char *)&self->super.super.super.isa + v19);
  }
  long long v23 = [(MFMailDropMailDeliveryUI *)self _headersByAddingMailDropHeaders:v20];
  uint64_t v24 = *(Class *)((char *)&self->super.super.super.isa + v19);
  *(Class *)((char *)&self->super.super.super.isa + v19) = v23;

  uint64_t v25 = [(MFPlaceholderMessageRewriter *)self->_rewriter rewrittenMessageContent];
  id v26 = [(MFMailDropMailDeliveryUI *)self _mailDropBannerHTMLString];
  v27 = [v25 richtextContent];
  id v28 = [v27 plaintextAlternative];

  if (v28)
  {
    id v29 = [v27 plaintextAlternative];
    uint64_t v30 = (int)*MEMORY[0x1E4F77CB0];
    v31 = *(Class *)((char *)&self->super.super.super.isa + v30);
    *(Class *)((char *)&self->super.super.super.isa + v30) = v29;
  }
  v32 = [v27 mixedContent];
  uint64_t v33 = [v27 multipartContent];

  if (v33)
  {
    long long v34 = [v25 multipartContent];
    long long v35 = [v34 htmlBody];
    long long v36 = (void *)MEMORY[0x1E4F60840];
    long long v37 = [v26 stringByAppendingString:v35];
    objc_msgSend(v36, "mf_utf8HTMLStringWithString:", v37);
    v38 = (objc_class *)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = (int)*MEMORY[0x1E4F77C90];
    v40 = *(Class *)((char *)&self->super.super.super.isa + v39);
    *(Class *)((char *)&self->super.super.super.isa + v39) = v38;
  }
  else
  {
    long long v34 = objc_msgSend(MEMORY[0x1E4F60840], "mf_utf8HTMLStringWithString:", v26);
    v54 = v34;
    long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
    [v35 arrayByAddingObjectsFromArray:v32];
    long long v37 = v32;
    v32 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v41 = (int)*MEMORY[0x1E4F77CA8];
  v42 = *(Class *)((char *)&self->super.super.super.isa + v41);
  *(Class *)((char *)&self->super.super.super.isa + v41) = v32;

  uint64_t v43 = (int)*MEMORY[0x1E4F77CA0];
  v44 = *(Class *)((char *)&self->super.super.super.isa + v43);
  *(Class *)((char *)&self->super.super.super.isa + v43) = 0;

  v45 = *(Class *)((char *)&self->super.super.super.isa + v49);
  *(Class *)((char *)&self->super.super.super.isa + v49) = 0;

  uint64_t v46 = (int)*MEMORY[0x1E4F77C80];
  v47 = *(Class *)((char *)&self->super.super.super.isa + v46);
  *(Class *)((char *)&self->super.super.super.isa + v46) = 0;

  return 1;
}

- (id)_mailDropBannerHTMLString
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = [(MFMailDropMailDelivery *)self imageArchiveMetadata];
  if (!v4)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v5 = [(MFMailDropMailDelivery *)self attachments];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v35;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v34 + 1) + 8 * v8);
        if ([v9 isMailDrop]) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      uint64_t v11 = [v9 mailDropMetadata];

      id v4 = (void *)v11;
      if (!v11) {
        goto LABEL_11;
      }
    }
    else
    {
LABEL_10:

LABEL_11:
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"MFMailDropMailDeliveryUI.m" lineNumber:276 description:@"attempt to send a mail drop email without any mail drop attachments"];

      id v4 = 0;
    }
  }
  id v33 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v33 setTimeStyle:0];
  [v33 setDateStyle:2];
  id v12 = NSString;
  if ([v4 isPhotoArchive])
  {
    v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    [v32 localizedStringForKey:@"MAIL_DROP_DOWNLOAD_IMAGES" value:&stru_1F0817A00 table:@"Main"];
  }
  else
  {
    v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    [v32 localizedStringForKey:@"MAIL_DROP_DOWNLOAD_ATTACHMENT" value:&stru_1F0817A00 table:@"Main"];
  id v13 = };
  uint64_t v14 = NSString;
  char v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  long long v16 = [v15 localizedStringForKey:@"MAIL_DROP_AVAILABLE_UNTIL %@" value:&stru_1F0817A00 table:@"Main"];
  long long v17 = [v4 expiration];
  long long v18 = [v33 stringFromDate:v17];
  uint64_t v19 = objc_msgSend(v14, "stringWithFormat:", v16, v18);
  objc_msgSend(v12, "stringWithFormat:", @"<div style=\"font: 13px 'Helvetica Neue', sans-serif; color: rgb(128,128,128); font-weight: 300\"><div style=\"height:0px; border-top:1px solid #ececec;\"></div><div style=\"overflow: auto;\"><div style=\"float:left; margin-right: 62px;\"><div style=\"height:25px; display:table-cell; vertical-align:bottom\">%@</div><div></div><div style=\"height:19px; display:table-cell; vertical-align:bottom\">%@</div></div><div style=\"float: right; width: 62px; margin-left:-62px\"><div class=\"maildrop_icon\"></div></div></div><div style=\"height:0px; border-top:1px solid #ececec; margin-bottom: 15px\"></div></div>",
    v13,
    v19,
  uint64_t v20 = @"div.maildrop_icon {background-image: url('https://www.icloud.com/mail_resources/icloud_download.png')background-repeat: no-repeat;display: inline-block;margin: 15px 18px 13px 18px;height: 25px;width: 26px;}@media(-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi) {div.maildrop_icon {background-image: url('https://www.icloud.com/mail_resources/icloud_download@2x.png');background-size: 25px 26px;}}");;

  uint64_t v21 = NSString;
  uint64_t v22 = [v4 wrappedUrlString];
  long long v23 = NSString;
  uint64_t v24 = [v4 expiration];
  [v24 timeIntervalSince1970];
  id v26 = objc_msgSend(v23, "stringWithFormat:", @"%f", v25 * 1000.0);
  v27 = [v4 directUrlString];
  id v28 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v4, "fileSize"));
  id v29 = [v21 stringWithFormat:@"<a href=\"%@\" class=\"%@\" data-expiration=\"%@\" data-url=\"%@\" data-size=\"%@\">%@</a>", v22, *MEMORY[0x1E4F5FD48], v26, v27, v28, v20];

  objc_msgSend(NSString, "stringWithFormat:", @"<style type=\"text/css\">%@</style><html><body>%@</body></html>", @"div.maildrop_icon {background-image: url('https://www.icloud.com/mail_resources/icloud_download.png');background-repeat: no-repeat;display: inline-block;margin: 15px 18px 13px 18px;height: 25px;width: 26px;}@media(-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi) {div.maildrop_icon {background-image: url('https://www.icloud.com/mail_resources/icloud_download@2x.png');background-size: 25px 26px;}}",
  uint64_t v30 = v29);

  return v30;
}

- (void).cxx_destruct
{
}

- (void)scaledImages:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "MailDrop could not scale images to fit within the current message limit. (%lu / %lu)", (uint8_t *)&v4, 0x16u);
}

@end