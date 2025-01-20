@interface CKChatEagerUploadController
- (CKChatEagerUploadController)init;
- (NSMutableArray)uploadUrls;
- (NSMutableDictionary)identifierMap;
- (NSMutableDictionary)temporaryURLS;
- (id)_newTransferForURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5;
- (void)_uploadFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 videoComplementURL:(id)a6 attributionInfo:(id)a7 identifier:(id)a8 recipients:(id)a9;
- (void)addURLToIdentifierMap:(id)a3 forIdentifier:(id)a4;
- (void)asyncCopyFileAtURL:(id)a3 toDestinationURL:(id)a4 completion:(id)a5;
- (void)cancelAll;
- (void)cancelIdentifier:(id)a3;
- (void)cancelURL:(id)a3;
- (void)didSendComposition;
- (void)removeTemporaryURLForURL:(id)a3;
- (void)setIdentifierMap:(id)a3;
- (void)setTemporaryURLS:(id)a3;
- (void)setUploadUrls:(id)a3;
- (void)uploadFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 videoComplementURL:(id)a6 attributionInfo:(id)a7 identifier:(id)a8 recipients:(id)a9;
- (void)uploadPayload:(id)a3 identifier:(id)a4 replace:(BOOL)a5 recipients:(id)a6;
@end

@implementation CKChatEagerUploadController

- (void)_uploadFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 videoComplementURL:(id)a6 attributionInfo:(id)a7 identifier:(id)a8 recipients:(id)a9
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v32 = a4;
  id v33 = a5;
  id v34 = a6;
  id v35 = a7;
  id v36 = a8;
  id v37 = a9;
  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v17 = [v15 lastPathComponent];
    v18 = CKAttachmentTmpFileURL(v17);

    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __131__CKChatEagerUploadController__uploadFileURL_filename_transcoderUserInfo_videoComplementURL_attributionInfo_identifier_recipients___block_invoke;
    v46[3] = &unk_1E562C708;
    v46[4] = self;
    id v47 = v15;
    id v48 = v18;
    id v49 = v33;
    id v19 = v35;
    id v50 = v19;
    id v20 = v32;
    id v51 = v20;
    id v21 = v34;
    id v52 = v21;
    id v30 = v16;
    id v53 = v30;
    id v22 = v37;
    id v54 = v22;
    id v23 = v36;
    id v55 = v23;
    id v31 = v48;
    [(CKChatEagerUploadController *)self asyncCopyFileAtURL:v47 toDestinationURL:v48 completion:v46];
    if (v21)
    {
      uint64_t v57 = *MEMORY[0x1E4F6D368];
      v58[0] = MEMORY[0x1E4F1CC38];
      v24 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1, v30);
      v25 = [v21 lastPathComponent];
      v26 = CKAttachmentTmpFileURL(v25);

      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __131__CKChatEagerUploadController__uploadFileURL_filename_transcoderUserInfo_videoComplementURL_attributionInfo_identifier_recipients___block_invoke_2;
      v38[3] = &unk_1E562C730;
      v38[4] = self;
      id v39 = v26;
      id v40 = v24;
      id v41 = v19;
      id v42 = v20;
      id v43 = v22;
      id v44 = v21;
      id v45 = v23;
      id v27 = v24;
      id v28 = v26;
      [(CKChatEagerUploadController *)self asyncCopyFileAtURL:v44 toDestinationURL:v28 completion:v38];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "_uploadFileURL fileURL is nil", buf, 2u);
    }
  }
}

void __131__CKChatEagerUploadController__uploadFileURL_filename_transcoderUserInfo_videoComplementURL_attributionInfo_identifier_recipients___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
  v2 = (void *)[*(id *)(a1 + 32) _newTransferForURL:*(void *)(a1 + 48) transcoderUserInfo:*(void *)(a1 + 56) attributionInfo:*(void *)(a1 + 64)];
  if (v2)
  {
    id v5 = v2;
    if (*(void *)(a1 + 72)) {
      objc_msgSend(v2, "setFilename:");
    }
    if (*(void *)(a1 + 80)) {
      [v5 setIsAuxImage:1];
    }
    [*(id *)(a1 + 88) addObject:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
    v3 = [MEMORY[0x1E4F6BC98] sharedInstance];
    v4 = [v5 _dictionaryRepresentation];
    [v3 eagerUploadTransfer:v4 recipients:*(void *)(a1 + 96)];

    [*(id *)(a1 + 32) addURLToIdentifierMap:*(void *)(a1 + 40) forIdentifier:*(void *)(a1 + 104)];
    v2 = v5;
  }
}

- (CKChatEagerUploadController)init
{
  v10.receiver = self;
  v10.super_class = (Class)CKChatEagerUploadController;
  v2 = [(CKChatEagerUploadController *)&v10 init];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  identifierMap = v2->_identifierMap;
  v2->_identifierMap = v3;

  id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uploadUrls = v2->_uploadUrls;
  v2->_uploadUrls = v5;

  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  temporaryURLS = v2->_temporaryURLS;
  v2->_temporaryURLS = v7;

  return v2;
}

- (void)removeTemporaryURLForURL:(id)a3
{
  id v6 = a3;
  v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_temporaryURLS, "objectForKeyedSubscript:");
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v5 removeItemAtURL:v4 error:0];
  }
  [(NSMutableDictionary *)self->_temporaryURLS setObject:0 forKeyedSubscript:v6];
}

- (void)didSendComposition
{
  [(NSMutableArray *)self->_uploadUrls removeAllObjects];
  identifierMap = self->_identifierMap;

  [(NSMutableDictionary *)identifierMap removeAllObjects];
}

- (void)cancelAll
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableArray *)self->_uploadUrls copy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[CKChatEagerUploadController cancelURL:](self, "cancelURL:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)cancelIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [(NSMutableDictionary *)self->_identifierMap objectForKeyedSubscript:a3];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(CKChatEagerUploadController *)self cancelURL:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)cancelURL:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F6E660] IMIsEagerUploadEnabledForPhoneNumber:0 simID:0])
  {
    [(NSMutableArray *)self->_uploadUrls removeObject:v4];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    identifierMap = self->_identifierMap;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __41__CKChatEagerUploadController_cancelURL___block_invoke;
    uint64_t v14 = &unk_1E562C6E0;
    id v7 = v4;
    id v15 = v7;
    id v16 = v5;
    id v8 = v5;
    [(NSMutableDictionary *)identifierMap enumerateKeysAndObjectsUsingBlock:&v11];
    -[NSMutableDictionary removeObjectsForKeys:](self->_identifierMap, "removeObjectsForKeys:", v8, v11, v12, v13, v14);
    long long v9 = [(NSMutableDictionary *)self->_temporaryURLS objectForKeyedSubscript:v7];
    long long v10 = [MEMORY[0x1E4F6BC98] sharedInstance];
    [v10 eagerUploadCancel:v9];

    [(CKChatEagerUploadController *)self removeTemporaryURLForURL:v7];
  }
}

void __41__CKChatEagerUploadController_cancelURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 containsObject:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (id)_newTransferForURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = [MEMORY[0x1E4F6C348] defaultHFSFileManager];
  uint64_t v11 = [v7 path];
  uint64_t v22 = 0;
  uint64_t v12 = [v10 attributesOfItemAtPath:v11 error:&v22];

  v13 = [v12 objectForKey:*MEMORY[0x1E4F283B8]];
  LOBYTE(v11) = [v13 isEqual:*MEMORY[0x1E4F283C0]];

  uint64_t v14 = 0;
  if ((v11 & 1) == 0)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F6E780]);
    id v16 = [v7 lastPathComponent];
    uint64_t v17 = [v12 fileSize];
    unsigned int v18 = [v12 fileHFSTypeCode];
    unsigned int v19 = [v12 fileHFSCreatorCode];
    BYTE2(v21) = 0;
    LOWORD(v21) = [v12 fileHFSFlags];
    uint64_t v14 = objc_msgSend(v15, "_initWithGUID:filename:isDirectory:localURL:account:otherPerson:totalBytes:hfsType:hfsCreator:hfsFlags:isIncoming:", @"EAGER", v16, 0, v7, 0, 0, v17, __PAIR64__(v19, v18), v21);

    [v14 setTranscoderUserInfo:v8];
    [v14 setAttributionInfo:v9];
  }

  return v14;
}

- (void)uploadPayload:(id)a3 identifier:(id)a4 replace:(BOOL)a5 recipients:(id)a6
{
  BOOL v7 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([MEMORY[0x1E4F6E660] IMIsEagerUploadEnabledForPhoneNumber:0 simID:0]
    && ([v10 isSticker] & 1) == 0
    && ([v10 shouldSendAsRichLink] & 1) == 0)
  {
    v13 = [v10 fileURL];
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        unsigned int v19 = v13;
        __int16 v20 = 2112;
        id v21 = v12;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Eager Upload Payload at URL %@ recipients %@", buf, 0x16u);
      }
    }
    if (v7) {
      [(CKChatEagerUploadController *)self cancelAll];
    }
    if (v13)
    {
      id v15 = [v10 transcoderUserInfo];
      id v16 = [v10 videoComplementFileURL];
      uint64_t v17 = [v10 attributionInfo];
      [(CKChatEagerUploadController *)self _uploadFileURL:v13 filename:0 transcoderUserInfo:v15 videoComplementURL:v16 attributionInfo:v17 identifier:v11 recipients:v12];
    }
  }
}

- (void)uploadFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 videoComplementURL:(id)a6 attributionInfo:(id)a7 identifier:(id)a8 recipients:(id)a9
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (IMOSLoggingEnabled())
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v15;
      __int16 v25 = 2112;
      id v26 = v21;
      _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Eager Upload url %@ recipients %@", buf, 0x16u);
    }
  }
  [(CKChatEagerUploadController *)self cancelAll];
  [(CKChatEagerUploadController *)self _uploadFileURL:v15 filename:v16 transcoderUserInfo:v17 videoComplementURL:v18 attributionInfo:v19 identifier:v20 recipients:v21];
}

void __131__CKChatEagerUploadController__uploadFileURL_filename_transcoderUserInfo_videoComplementURL_attributionInfo_identifier_recipients___block_invoke_2(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _newTransferForURL:*(void *)(a1 + 40) transcoderUserInfo:*(void *)(a1 + 48) attributionInfo:*(void *)(a1 + 56)];
  if (v2)
  {
    id v5 = v2;
    [v2 setIsAuxVideo:1];
    if (*(void *)(a1 + 64)) {
      objc_msgSend(v5, "setFilename:");
    }
    v3 = [MEMORY[0x1E4F6BC98] sharedInstance];
    id v4 = [v5 _dictionaryRepresentation];
    [v3 eagerUploadTransfer:v4 recipients:*(void *)(a1 + 72)];

    [*(id *)(a1 + 32) addURLToIdentifierMap:*(void *)(a1 + 80) forIdentifier:*(void *)(a1 + 88)];
    [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 80)];
    v2 = v5;
  }
}

- (void)addURLToIdentifierMap:(id)a3 forIdentifier:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = [(NSMutableDictionary *)self->_identifierMap objectForKeyedSubscript:v7];
    id v10 = v9;
    if (v9)
    {
      [v9 addObject:v6];
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F1CA48];
      v14[0] = v6;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      v13 = [v11 arrayWithArray:v12];
      [(NSMutableDictionary *)self->_identifierMap setObject:v13 forKeyedSubscript:v8];
    }
  }
}

- (void)asyncCopyFileAtURL:(id)a3 toDestinationURL:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__CKChatEagerUploadController_asyncCopyFileAtURL_toDestinationURL_completion___block_invoke;
  block[3] = &unk_1E5622BA8;
  id v15 = v8;
  id v16 = v7;
  id v17 = v9;
  id v11 = v9;
  id v12 = v7;
  id v13 = v8;
  dispatch_async(v10, block);
}

void __78__CKChatEagerUploadController_asyncCopyFileAtURL_toDestinationURL_completion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = [*(id *)(a1 + 32) URLByDeletingLastPathComponent];
  id v16 = 0;
  char v4 = [v2 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v16];
  id v5 = v16;
  if ((v4 & 1) == 0 && IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Failed to create copy destinaton directory {error: %@, directory: %@}", buf, 0x16u);
    }
  }
  if (!v5)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v15 = 0;
    char v9 = [v2 copyItemAtURL:v7 toURL:v8 error:&v15];
    id v5 = v15;
    if ((v9 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v12 = *(void **)(a1 + 32);
          id v11 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138412802;
          id v18 = v11;
          __int16 v19 = 2112;
          id v20 = v12;
          __int16 v21 = 2112;
          id v22 = v5;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Failed to copy file %@ to destinaton %@ with error: %@", buf, 0x20u);
        }
      }
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__CKChatEagerUploadController_asyncCopyFileAtURL_toDestinationURL_completion___block_invoke_43;
  block[3] = &unk_1E5620F48;
  id v14 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __78__CKChatEagerUploadController_asyncCopyFileAtURL_toDestinationURL_completion___block_invoke_43(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (NSMutableDictionary)identifierMap
{
  return self->_identifierMap;
}

- (void)setIdentifierMap:(id)a3
{
}

- (NSMutableArray)uploadUrls
{
  return self->_uploadUrls;
}

- (void)setUploadUrls:(id)a3
{
}

- (NSMutableDictionary)temporaryURLS
{
  return self->_temporaryURLS;
}

- (void)setTemporaryURLS:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryURLS, 0);
  objc_storeStrong((id *)&self->_uploadUrls, 0);

  objc_storeStrong((id *)&self->_identifierMap, 0);
}

@end