@interface MFNanoServerMessageContentParser
- (BOOL)_parseMimeParts:(id)a3 messageBody:(id)a4 attributedString:(id)a5 maxLength:(unint64_t)a6 maxImageWidth:(double)a7 maxImageAttachments:(unint64_t)a8 shouldTryAlternatives:(BOOL)a9 urlsForValidation:(id)a10 nanoAttachmentsList:(id)a11 attachmentURLsToLoad:(id)a12 usingAlternativePart:(BOOL *)a13 partiallyLoaded:(BOOL *)a14;
- (MFNanoServerMessageContentParser)init;
- (id)_attachmentForURL:(id)a3 mimePart:(id)a4;
- (id)_nanoAttachmentForURL:(id)a3 mimePart:(id)a4;
- (id)_parseStringMimePart:(id)a3 maxLength:(unint64_t)a4;
- (id)_parseTextAttachmentMimePart:(id)a3 messageBody:(id)a4 maxImageAttachments:(unint64_t)a5 nanoAttachmentsList:(id)a6 attachmentURLsToLoad:(id)a7;
- (id)_parseWebMessageDocumentMimePart:(id)a3 messageBody:(id)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 maxImageAttachments:(unint64_t)a7 shouldTryAlternatives:(BOOL)a8 urlsForValidation:(id)a9 finalNanoAttachmentsList:(id)a10 finalAttachmentsURLsToLoad:(id)a11 usingAlternativePart:(BOOL *)a12 partiallyLoaded:(BOOL *)a13;
- (id)parseMessageWithLoadingContextEvent:(id)a3 maxImageWidth:(double)a4 messageBody:(id *)a5 attachmentURLsToLoad:(id *)a6;
- (void)_parseAttachmentsFromMimePart:(id)a3 messageBody:(id)a4 maxImageAttachments:(unint64_t)a5 nanoAttachmentsList:(id)a6 attachmentURLsToLoad:(id)a7;
- (void)dealloc;
- (void)parseMessage:(id)a3 maxImageWidth:(double)a4 completionBlock:(id)a5;
@end

@implementation MFNanoServerMessageContentParser

- (void)dealloc
{
  [(EFCancelable *)self->_cancelable cancel];
  v3.receiver = self;
  v3.super_class = (Class)MFNanoServerMessageContentParser;
  [(MFNanoServerMessageContentParser *)&v3 dealloc];
}

- (MFNanoServerMessageContentParser)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFNanoServerMessageContentParser;
  v2 = [(MFNanoServerMessageContentParser *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSURLSession sharedSession];
    htmlContentURLSession = v2->_htmlContentURLSession;
    v2->_htmlContentURLSession = (NSURLSession *)v3;
  }
  return v2;
}

- (void)parseMessage:(id)a3 maxImageWidth:(double)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(EFCancelable *)self->_cancelable cancel];
  cancelable = self->_cancelable;
  self->_cancelable = 0;

  id v11 = objc_alloc((Class)MFMessageLoadingContext);
  v12 = +[DaemonAppController sharedController];
  v13 = [v12 defaultAttachmentManager];
  v14 = (MFMessageLoadingContext *)[v11 initWithMessage:v8 attachmentManager:v13];
  loadingContext = self->_loadingContext;
  self->_loadingContext = v14;

  v16 = +[MFNanoServerMessageContentURLProtocol URLForLoadingContext:self->_loadingContext];
  v17 = self->_loadingContext;
  if (!v17)
  {
    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
    v17 = self->_loadingContext;
  }
  [(MFMessageLoadingContext *)v17 load:0];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v18 = self->_loadingContext;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10009283C;
  v23[3] = &unk_10013D3C8;
  objc_copyWeak(v26, &location);
  v26[1] = *(id *)&a4;
  id v19 = v16;
  id v24 = v19;
  id v20 = v9;
  id v25 = v20;
  v21 = [(MFMessageLoadingContext *)v18 addLoadObserver:v23];
  v22 = self->_cancelable;
  self->_cancelable = v21;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

- (id)parseMessageWithLoadingContextEvent:(id)a3 maxImageWidth:(double)a4 messageBody:(id *)a5 attachmentURLsToLoad:(id *)a6
{
  id v10 = a3;
  id v11 = [v10 context];
  v12 = [v11 message];
  id v25 = [v12 messageSize];
  if ([v10 hasLoadedCompleteBody])
  {
    id v24 = [v10 content];
    *a5 = [v11 messageBody];
    __int16 v27 = 0;
    id v13 = objc_alloc_init((Class)NSMutableAttributedString);
    id v26 = objc_alloc_init((Class)NSMutableArray);
    id v14 = objc_alloc_init((Class)NSMutableSet);
    *a6 = 0;
    unsigned int v15 = [(MFNanoServerMessageContentParser *)self _parseMimeParts:v24 messageBody:*a5 attributedString:v13 maxLength:NNMKHTMLParserMaxContentTextLength maxImageWidth:NNMKHTMLParserMaxImageAttachmentsToSync maxImageAttachments:1 shouldTryAlternatives:a4 urlsForValidation:0 nanoAttachmentsList:v26 attachmentURLsToLoad:v14 usingAlternativePart:(char *)&v27 + 1 partiallyLoaded:&v27];
    id v16 = objc_alloc_init((Class)NNMKMessageContent);
    v17 = objc_msgSend(v12, "mf_externalReference");
    v18 = [v17 absoluteString];
    [v16 setMessageId:v18];

    id v19 = [v16 messageId];
    LODWORD(v18) = v19 == 0;

    if (v18)
    {
      id v20 = MFLogGeneral();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        [v12 messageID];
        objc_claimAutoreleasedReturnValue();
        [v12 externalID];
        objc_claimAutoreleasedReturnValue();
        sub_1000C2310();
      }
    }
    if (v15)
    {
      [v16 setMainAlternativeValid:HIBYTE(v27) == 0];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v16, "setHasTextData:", objc_msgSend(v13, "length") != 0);
      }
      v21 = +[NNMKContentAttributedStringHTMLParser trimAttributedString:v13];
      v22 = +[NSKeyedArchiver archivedDataWithRootObject:v21 requiringSecureCoding:1 error:0];
      [v16 setTextData:v22];

      [v16 setAttachments:v26];
      [v16 setPartiallyLoaded:v27];
      *a6 = v14;
    }
  }
  else
  {
    id v16 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    [v16 setOriginalContentSize:v25];
  }

  return v16;
}

- (BOOL)_parseMimeParts:(id)a3 messageBody:(id)a4 attributedString:(id)a5 maxLength:(unint64_t)a6 maxImageWidth:(double)a7 maxImageAttachments:(unint64_t)a8 shouldTryAlternatives:(BOOL)a9 urlsForValidation:(id)a10 nanoAttachmentsList:(id)a11 attachmentURLsToLoad:(id)a12 usingAlternativePart:(BOOL *)a13 partiallyLoaded:(BOOL *)a14
{
  BOOL v34 = a9;
  id v17 = a3;
  id v39 = a4;
  id v18 = a5;
  id v35 = a10;
  id v38 = a11;
  id v19 = a12;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v17;
  id v20 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v20)
  {
    LOBYTE(v30) = 1;
    goto LABEL_23;
  }
  uint64_t v21 = *(void *)v43;
  do
  {
    v22 = 0;
    do
    {
      if (*(void *)v43 != v21) {
        objc_enumerationMutation(obj);
      }
      uint64_t v23 = *(void *)(*((void *)&v42 + 1) + 8 * (void)v22);
      id v24 = [v18 length];
      id v25 = [v19 count];
      objc_opt_class();
      unint64_t v27 = a8 - (void)v25;
      if (objc_opt_isKindOfClass())
      {
        v28 = [(MFNanoServerMessageContentParser *)self _parseTextAttachmentMimePart:v23 messageBody:v39 maxImageAttachments:v27 nanoAttachmentsList:v38 attachmentURLsToLoad:v19];
        [v18 appendAttributedString:v28];
LABEL_13:
        BOOL v30 = 1;
        goto LABEL_14;
      }
      objc_opt_class();
      unint64_t v29 = a6 - (void)v24;
      if (objc_opt_isKindOfClass())
      {
        v28 = [(MFNanoServerMessageContentParser *)self _parseStringMimePart:v23 maxLength:v29];
        [v18 appendAttributedString:v28];
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v30 = 1;
        goto LABEL_15;
      }
      v28 = [(MFNanoServerMessageContentParser *)self _parseWebMessageDocumentMimePart:v23 messageBody:v39 maxLength:v29 maxImageWidth:v27 maxImageAttachments:v34 shouldTryAlternatives:v35 urlsForValidation:a7 finalNanoAttachmentsList:v38 finalAttachmentsURLsToLoad:v19 usingAlternativePart:a13 partiallyLoaded:a14];
      BOOL v30 = v28 != 0;
      if (v28)
      {
        [v18 appendAttributedString:v28];
        goto LABEL_13;
      }
LABEL_14:

LABEL_15:
      if (!v30 || *a14) {
        goto LABEL_23;
      }
      v22 = (char *)v22 + 1;
    }
    while (v20 != v22);
    id v31 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    id v20 = v31;
    LOBYTE(v30) = 1;
  }
  while (v31);
LABEL_23:

  v32 = [v39 topLevelPart];
  -[MFNanoServerMessageContentParser _parseAttachmentsFromMimePart:messageBody:maxImageAttachments:nanoAttachmentsList:attachmentURLsToLoad:](self, "_parseAttachmentsFromMimePart:messageBody:maxImageAttachments:nanoAttachmentsList:attachmentURLsToLoad:", v32, v39, a8 - (void)[v19 count], v38, v19);

  return v30;
}

- (id)_parseTextAttachmentMimePart:(id)a3 messageBody:(id)a4 maxImageAttachments:(unint64_t)a5 nanoAttachmentsList:(id)a6 attachmentURLsToLoad:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [v12 mimePart];
  [v16 setMimeBody:v13];

  id v17 = +[DaemonAppController sharedController];
  id v18 = [v17 defaultAttachmentManager];
  id v19 = [v18 attachmentForTextAttachment:v12 error:0];

  id v20 = [v19 contentID];
  if (v20)
  {
    if ([v19 nanoAttachmentType] == (id)5) {
      +[NNMKContentAttributedStringHTMLParser imageAttachmentAttributedStringWithContentId:imageSize:mergingAttributes:](NNMKContentAttributedStringHTMLParser, "imageAttachmentAttributedStringWithContentId:imageSize:mergingAttributes:", v20, 0, CGSizeZero.width, CGSizeZero.height);
    }
    else {
    id v21 = +[NNMKContentAttributedStringHTMLParser attachmentAttributedStringWithContentId:v20 mergingAttributes:0];
    }
    v22 = [v12 mimePart];
    [(MFNanoServerMessageContentParser *)self _parseAttachmentsFromMimePart:v22 messageBody:v13 maxImageAttachments:a5 nanoAttachmentsList:v14 attachmentURLsToLoad:v15];
  }
  else
  {
    id v21 = [objc_alloc((Class)NSAttributedString) initWithString:&stru_10013ED08];
  }

  return v21;
}

- (id)_parseStringMimePart:(id)a3 maxLength:(unint64_t)a4
{
  id v5 = a3;
  if ((unint64_t)[v5 length] <= a4)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [v5 substringToIndex:a4];
  }
  v7 = v6;
  id v8 = [objc_alloc((Class)NSAttributedString) initWithString:v6];

  return v8;
}

- (id)_parseWebMessageDocumentMimePart:(id)a3 messageBody:(id)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 maxImageAttachments:(unint64_t)a7 shouldTryAlternatives:(BOOL)a8 urlsForValidation:(id)a9 finalNanoAttachmentsList:(id)a10 finalAttachmentsURLsToLoad:(id)a11 usingAlternativePart:(BOOL *)a12 partiallyLoaded:(BOOL *)a13
{
  BOOL v14 = a8;
  id v17 = a3;
  id v54 = a4;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  v49 = [v17 htmlData];
  id v21 = [v17 preferredCharacterSet];
  CFStringEncoding v22 = MFEncodingForCharset();

  unint64_t v23 = CFStringConvertEncodingToNSStringEncoding(v22);
  v48 = (void *)MFCreateStringWithData();
  if (!self->_htmlParser)
  {
    id v24 = (NNMKContentAttributedStringHTMLParser *)objc_alloc_init((Class)NNMKContentAttributedStringHTMLParser);
    htmlParser = self->_htmlParser;
    self->_htmlParser = v24;
  }
  id v26 = self->_htmlParser;
  if (v18)
  {
    id v27 = [(NNMKContentAttributedStringHTMLParser *)v26 parseHTMLBody:v48 encoding:v23 maxLength:a5 maxImageWidth:a13 partiallyParsed:0 imageAttachmentsLoaded:v18 urlsForValidation:a6];
    if (v27)
    {
LABEL_5:
      v28 = [v17 mimePart];
      [(MFNanoServerMessageContentParser *)self _parseAttachmentsFromMimePart:v28 messageBody:v54 maxImageAttachments:a7 nanoAttachmentsList:v19 attachmentURLsToLoad:v20];

      goto LABEL_25;
    }
  }
  else
  {
    v58[0] = 0;
    uint64_t v29 = [(NNMKContentAttributedStringHTMLParser *)v26 parseHTMLBody:v48 encoding:v23 maxLength:a5 maxImageWidth:a13 partiallyParsed:0 imageAttachmentsLoaded:v58 urlsFound:a6];
    id v18 = v58[0];
    id v27 = (id)v29;
    if (v29) {
      goto LABEL_5;
    }
  }
  if (v14)
  {
    id v45 = v17;
    v46 = v20;
    id v50 = v18;
    v47 = v19;
    BOOL v30 = [v17 mimePart];
    while (1)
    {
      id v31 = [v30 parentPart];

      if (!v31) {
        break;
      }
      v32 = [v31 type];
      if ([v32 isEqualToString:@"multipart"])
      {
        v33 = [v31 subtype];
        unsigned __int8 v34 = [v33 isEqualToString:@"alternative"];

        BOOL v30 = v31;
        if (v34) {
          break;
        }
      }
      else
      {

        BOOL v30 = v31;
      }
    }
    v55 = 0;
    id v35 = (char *)[v31 numberOfAlternatives] - 2;
    while (1)
    {
      if ((uint64_t)(v35 + 1) <= 1)
      {
        *a12 = 1;
        if (v35) {
          break;
        }
      }
      v36 = [v31 alternativeAtIndex:v35];
      v37 = [v36 contentToOffset:0x7FFFFFFFFFFFFFFFLL resultOffset:0 asHTML:1];
      id v38 = objc_alloc_init((Class)NSMutableAttributedString);
      id v39 = objc_alloc_init((Class)NSMutableArray);
      id v40 = objc_alloc_init((Class)NSMutableSet);
      BOOL v57 = *a12;
      BOOL v56 = 0;
      unsigned int v41 = [(MFNanoServerMessageContentParser *)self _parseMimeParts:v37 messageBody:v54 attributedString:v38 maxLength:a5 maxImageWidth:a7 maxImageAttachments:0 shouldTryAlternatives:a6 urlsForValidation:v50 nanoAttachmentsList:v39 attachmentURLsToLoad:v40 usingAlternativePart:&v57 partiallyLoaded:&v56];
      char v42 = v41;
      if (v41)
      {
        id v27 = v38;

        [v47 addObjectsFromArray:v39];
        long long v43 = [v40 allObjects];
        [v46 addObjectsFromArray:v43];

        *a13 = v56;
        *a12 = 1;
        v55 = v27;
      }
      else
      {
        id v27 = v55;
      }

      --v35;
      if (v42) {
        goto LABEL_24;
      }
    }
    id v27 = v55;
LABEL_24:

    id v17 = v45;
    id v20 = v46;
    id v18 = v50;
    id v19 = v47;
  }
  else
  {
    id v27 = 0;
    *a12 = 1;
  }
LABEL_25:

  return v27;
}

- (void)_parseAttachmentsFromMimePart:(id)a3 messageBody:(id)a4 maxImageAttachments:(unint64_t)a5 nanoAttachmentsList:(id)a6 attachmentURLsToLoad:(id)a7
{
  id v29 = a4;
  id v30 = a6;
  id v23 = a7;
  [a3 attachmentURLs];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v10)
  {
    unint64_t v25 = 0;
    uint64_t v27 = *(void *)v39;
    do
    {
      id v31 = v10;
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(obj);
        }
        v32 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v12 = objc_msgSend(v32, "mf_lastPartNumber");
        v33 = [v29 partWithNumber:v12];

        id v13 = [(MFNanoServerMessageContentParser *)self _nanoAttachmentForURL:v32 mimePart:v33];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v14 = v30;
        id v15 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (!v15)
        {

LABEL_16:
          if ([v13 isImage])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v22 = v13;
              if (++v25 <= a5) {
                [v23 addObject:v32];
              }
              [v22 setRenderOnClient:v25 <= a5];
            }
          }
          else if ([v13 isActionable])
          {
            [v23 addObject:v32];
          }
          [v14 addObject:v13];
          goto LABEL_24;
        }
        char v16 = 0;
        uint64_t v17 = *(void *)v35;
        do
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v35 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = [*(id *)(*((void *)&v34 + 1) + 8 * (void)j) contentId];
            id v20 = [v13 contentId];
            unsigned __int8 v21 = [v19 isEqualToString:v20];

            v16 |= v21;
          }
          id v15 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v15);

        if ((v16 & 1) == 0) {
          goto LABEL_16;
        }
LABEL_24:
      }
      id v10 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v10);
  }
}

- (id)_nanoAttachmentForURL:(id)a3 mimePart:(id)a4
{
  id v6 = a4;
  v7 = [(MFNanoServerMessageContentParser *)self _attachmentForURL:a3 mimePart:v6];
  unsigned int v8 = [v7 isImageFile];
  id v9 = (Class *)NNMKImageAttachment_ptr;
  if (!v8) {
    id v9 = (Class *)NNMKAttachment_ptr;
  }
  id v10 = objc_alloc_init(*v9);
  id v11 = [v7 contentID];
  [v10 setContentId:v11];

  id v12 = [v7 fileName];
  [v10 setFileName:v12];

  objc_msgSend(v10, "setFileSize:", 3 * ((unint64_t)objc_msgSend(v7, "encodedFileSize") >> 2));
  id v13 = [v6 partNumber];
  [v10 setMimePartNumber:v13];

  objc_msgSend(v10, "setType:", objc_msgSend(v7, "nanoAttachmentType"));

  return v10;
}

- (id)_attachmentForURL:(id)a3 mimePart:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[DaemonAppController sharedController];
  unsigned int v8 = [v7 defaultAttachmentManager];
  id v9 = [v6 mimeBody];
  id v10 = [v8 attachmentForURL:v5 withMimeBody:v9 error:0];

  [v10 setPart:v6];
  id v11 = [v6 contentID];

  if (v11)
  {
    id v12 = [v6 contentID];
    [v10 setContentID:v12];
  }
  id v13 = [v6 type];
  id v14 = [v6 subtype];
  id v15 = +[NSString stringWithFormat:@"%@/%@", v13, v14];
  [v10 setMimeType:v15];

  char v16 = [v6 attachmentFilename];
  [v10 setFileName:v16];

  objc_msgSend(v10, "setEncodedFileSize:", objc_msgSend(v6, "approximateRawSize"));
  uint64_t v17 = [v6 disposition];
  [v10 setDisposition:v17];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelable, 0);
  objc_storeStrong((id *)&self->_htmlContentURLSession, 0);
  objc_storeStrong((id *)&self->_loadingContext, 0);

  objc_storeStrong((id *)&self->_htmlParser, 0);
}

@end