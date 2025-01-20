@interface QLGeneratedPreviewParts
- (NSData)data;
- (NSDictionary)attachments;
- (NSMutableDictionary)idToURL;
- (NSString)mimeType;
- (QLGeneratedPreviewParts)initWithData:(id)a3 encoding:(unint64_t)a4 mimeType:(id)a5 attachments:(id)a6;
- (id)URLRequestForContentID:(id)a3;
- (id)newAttachmentURLWithID:(id)a3 mimeType:(id)a4 encoding:(unint64_t)a5;
- (unint64_t)stringEncoding;
- (void)_processAttachment:(id)a3 withID:(id)a4;
- (void)_registerURL:(id)a3 forContentID:(id)a4;
- (void)computePreview:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setData:(id)a3;
- (void)setIdToURL:(id)a3;
- (void)setMimeType:(id)a3;
- (void)setStringEncoding:(unint64_t)a3;
@end

@implementation QLGeneratedPreviewParts

- (QLGeneratedPreviewParts)initWithData:(id)a3 encoding:(unint64_t)a4 mimeType:(id)a5 attachments:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)QLGeneratedPreviewParts;
  v14 = [(QLGeneratedPreviewParts *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_data, a3);
    objc_storeStrong((id *)&v15->_attachments, a6);
    objc_storeStrong((id *)&v15->_mimeType, a5);
    v15->_stringEncoding = a4;
  }

  return v15;
}

- (void)computePreview:(id)a3
{
  unint64_t stringEncoding = self->_stringEncoding;
  v5 = (void (**)(void))a3;
  CFStringEncoding v6 = CFStringConvertNSStringEncodingToEncoding(stringEncoding);
  v7 = (__CFString *)CFStringConvertEncodingToIANACharSetName(v6);
  v8 = [(QLGeneratedPreviewParts *)self mimeType];
  [(QLPreviewParts *)self startDataRepresentationWithMimeType:v8 textEncoding:v7];

  v9 = [(QLGeneratedPreviewParts *)self attachments];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__QLGeneratedPreviewParts_computePreview___block_invoke;
  v12[3] = &unk_2642F64F0;
  v12[4] = self;
  [v9 enumerateKeysAndObjectsUsingBlock:v12];

  v10 = [(QLGeneratedPreviewParts *)self data];
  id v11 = [(QLPreviewParts *)self previewURL];
  [(QLPreviewParts *)self appendData:v10 forURL:v11 lastChunk:1];

  v5[2](v5);
}

uint64_t __42__QLGeneratedPreviewParts_computePreview___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _processAttachment:a3 withID:a2];
}

- (void)_processAttachment:(id)a3 withID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 contentType];
  v9 = [v8 preferredMIMEType];

  if (!v9)
  {
    v10 = [v7 pathExtension];
    if (!v10
      || ([MEMORY[0x263F1D920] typeWithFilenameExtension:v10],
          (id v11 = objc_claimAutoreleasedReturnValue()) == 0)
      || (id v12 = v11,
          [v11 preferredMIMEType],
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue(),
          v12,
          !v9))
    {
      v9 = @"text/html";
    }
  }
  id v13 = [v6 data];
  if (v13)
  {
    id v14 = [(QLGeneratedPreviewParts *)self newAttachmentURLWithID:v7 mimeType:v9 encoding:[(QLGeneratedPreviewParts *)self stringEncoding]];
    if (v14)
    {
      [(QLPreviewParts *)self appendData:v13 forURL:v14 lastChunk:1];
    }
    else
    {
      objc_super v17 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        v18 = (NSObject **)MEMORY[0x263F62940];
        QLSInitLogging();
        objc_super v17 = *v18;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412290;
        id v20 = v7;
        _os_log_impl(&dword_217F61000, v17, OS_LOG_TYPE_ERROR, "Unable to create attachment for id %@ #Conversion", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  else
  {
    v15 = (NSObject **)MEMORY[0x263F62940];
    v16 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      v16 = *v15;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138412290;
      id v20 = v7;
      _os_log_impl(&dword_217F61000, v16, OS_LOG_TYPE_ERROR, "No data for attachement with id %@ #Conversion", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)newAttachmentURLWithID:(id)a3 mimeType:(id)a4 encoding:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  CFStringEncoding v10 = CFStringConvertNSStringEncodingToEncoding(a5);
  id v11 = (__CFString *)CFStringConvertEncodingToIANACharSetName(v10);
  id v12 = [(QLPreviewParts *)self newSafeAttachmentURLWithID:v8 mimeType:v9 textEncoding:v11];

  if (v12) {
    [(QLGeneratedPreviewParts *)self _registerURL:v12 forContentID:v8];
  }

  return v12;
}

- (void)_registerURL:(id)a3 forContentID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  idToURL = v7->_idToURL;
  if (!idToURL)
  {
    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    CFStringEncoding v10 = v7->_idToURL;
    v7->_idToURL = v9;

    idToURL = v7->_idToURL;
  }
  [(NSMutableDictionary *)idToURL setObject:v11 forKey:v6];
  objc_sync_exit(v7);
}

- (id)URLRequestForContentID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 stringByRemovingPercentEncoding];
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [(NSMutableDictionary *)v6->_idToURL objectForKey:v5];
  id v8 = (NSObject **)MEMORY[0x263F62940];
  if (!v7)
  {
    id v7 = [(NSMutableDictionary *)v6->_idToURL objectForKey:v4];
    if (v7)
    {
      id v11 = *v8;
      if (!*v8)
      {
        QLSInitLogging();
        id v11 = *v8;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_INFO, "Preview generator uses escaped content ID as key (%@) in attachments dictionary (kQLPreviewPropertyAttachmentsKey). It should use the unescaped content ID (%@) #Conversion", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  id v9 = *v8;
  if (!*v8)
  {
    QLSInitLogging();
    id v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412546;
    id v14 = v7;
    __int16 v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_217F61000, v9, OS_LOG_TYPE_DEBUG, "Returning url %@ for contentID %@ #Conversion", (uint8_t *)&v13, 0x16u);
  }
  objc_sync_exit(v6);

  if (v7)
  {
    CFStringEncoding v10 = [(QLPreviewParts *)v6 requestForURL:v7];
  }
  else
  {
    CFStringEncoding v10 = 0;
  }

  return v10;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setData:(id)a3
{
}

- (NSDictionary)attachments
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAttachments:(id)a3
{
}

- (unint64_t)stringEncoding
{
  return self->_stringEncoding;
}

- (void)setStringEncoding:(unint64_t)a3
{
  self->_unint64_t stringEncoding = a3;
}

- (NSString)mimeType
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMimeType:(id)a3
{
}

- (NSMutableDictionary)idToURL
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setIdToURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idToURL, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_attachments, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end