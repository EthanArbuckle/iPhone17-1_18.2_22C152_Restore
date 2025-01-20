@interface SSReadingList
+ (BOOL)supportsURL:(NSURL *)URL;
+ (SSReadingList)defaultReadingList;
- (BOOL)_addReadingListItemWithURL:(id)a3 title:(id)a4 previewText:(id)a5;
- (BOOL)addReadingListItemWithURL:(NSURL *)URL title:(NSString *)title previewText:(NSString *)previewText error:(NSError *)error;
- (SSReadingList)init;
- (id)_init;
- (void)_setUpConnectionIfNeeded;
- (void)connection:(id)a3 didCloseWithError:(id)a4;
@end

@implementation SSReadingList

+ (BOOL)supportsURL:(NSURL *)URL
{
  return [(NSURL *)URL safari_isHTTPFamilyURL];
}

+ (SSReadingList)defaultReadingList
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SSReadingList_defaultReadingList__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[SSReadingList defaultReadingList]::onceToken != -1) {
    dispatch_once(&+[SSReadingList defaultReadingList]::onceToken, block);
  }
  v2 = (void *)+[SSReadingList defaultReadingList]::ssReadingList;

  return (SSReadingList *)v2;
}

void __35__SSReadingList_defaultReadingList__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  v2 = (void *)+[SSReadingList defaultReadingList]::ssReadingList;
  +[SSReadingList defaultReadingList]::ssReadingList = v1;
}

- (SSReadingList)init
{
  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)SSReadingList;
  return [(SSReadingList *)&v3 init];
}

- (BOOL)addReadingListItemWithURL:(NSURL *)URL title:(NSString *)title previewText:(NSString *)previewText error:(NSError *)error
{
  v10 = URL;
  v11 = title;
  v12 = previewText;
  v13 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_1A690B000, v13, OS_LOG_TYPE_DEFAULT, "#Client: Adding item to Reading List", v19, 2u);
  }
  v14 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    if (v10) {
      goto LABEL_5;
    }
LABEL_11:
    v17 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SSReadingList addReadingListItemWithURL:title:previewText:error:](v17);
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot add a Reading List item with nil URL."];
    goto LABEL_14;
  }
  -[SSReadingList addReadingListItemWithURL:title:previewText:error:]((uint64_t)v11, (uint64_t)v10, v14);
  if (!v10) {
    goto LABEL_11;
  }
LABEL_5:
  if (!+[SSReadingList supportsURL:v10])
  {
    v16 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[SSReadingList addReadingListItemWithURL:title:previewText:error:](v16);
      if (error) {
        goto LABEL_9;
      }
    }
    else if (error)
    {
LABEL_9:
      [MEMORY[0x1E4F28C58] errorWithDomain:@"SSReadingListErrorDomain" code:1 userInfo:0];
      BOOL v15 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_14:
    BOOL v15 = 0;
    goto LABEL_15;
  }
  BOOL v15 = [(SSReadingList *)self _addReadingListItemWithURL:v10 title:v11 previewText:v12];
LABEL_15:

  return v15;
}

- (BOOL)_addReadingListItemWithURL:(id)a3 title:(id)a4 previewText:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(SSReadingList *)self _setUpConnectionIfNeeded];
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(v8, "safari_userVisibleString");
  id v12 = objc_claimAutoreleasedReturnValue();
  v13 = (const char *)[v12 UTF8String];

  if (v9)
  {
    id v14 = [getWebBookmarkClass() _trimmedTitle:v9];
    BOOL v15 = (const char *)[v14 UTF8String];

    if (v10)
    {
LABEL_3:
      id v16 = [getWebBookmarkClass() _trimmedPreviewText:v10];
      v17 = (const char *)[v16 UTF8String];

      goto LABEL_6;
    }
  }
  else
  {
    BOOL v15 = "";
    if (v10) {
      goto LABEL_3;
    }
  }
  v17 = "";
LABEL_6:
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  v18 = (const char **)getkWebBookmarksAddressKeySymbolLoc(void)::ptr;
  uint64_t v42 = getkWebBookmarksAddressKeySymbolLoc(void)::ptr;
  if (!getkWebBookmarksAddressKeySymbolLoc(void)::ptr)
  {
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = ___ZL35getkWebBookmarksAddressKeySymbolLocv_block_invoke;
    v37 = &unk_1E5C72498;
    v38 = &v39;
    v19 = (void *)WebBookmarksLibrary();
    v40[3] = (uint64_t)dlsym(v19, "kWebBookmarksAddressKey");
    getkWebBookmarksAddressKeySymbolLoc(void)::ptr = *(void *)(v38[1] + 24);
    v18 = (const char **)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v18) {
    goto LABEL_24;
  }
  xpc_dictionary_set_string(v11, *v18, v13);
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  v20 = (const char **)getkWebBookmarksTitleKeySymbolLoc(void)::ptr;
  uint64_t v42 = getkWebBookmarksTitleKeySymbolLoc(void)::ptr;
  if (!getkWebBookmarksTitleKeySymbolLoc(void)::ptr)
  {
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = ___ZL33getkWebBookmarksTitleKeySymbolLocv_block_invoke;
    v37 = &unk_1E5C72498;
    v38 = &v39;
    v21 = (void *)WebBookmarksLibrary();
    v40[3] = (uint64_t)dlsym(v21, "kWebBookmarksTitleKey");
    getkWebBookmarksTitleKeySymbolLoc(void)::ptr = *(void *)(v38[1] + 24);
    v20 = (const char **)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v20) {
    goto LABEL_24;
  }
  xpc_dictionary_set_string(v11, *v20, v15);
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  v22 = (const char **)getkWebBookmarksPreviewTextKeySymbolLoc(void)::ptr;
  uint64_t v42 = getkWebBookmarksPreviewTextKeySymbolLoc(void)::ptr;
  if (!getkWebBookmarksPreviewTextKeySymbolLoc(void)::ptr)
  {
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = ___ZL39getkWebBookmarksPreviewTextKeySymbolLocv_block_invoke;
    v37 = &unk_1E5C72498;
    v38 = &v39;
    v23 = (void *)WebBookmarksLibrary();
    v40[3] = (uint64_t)dlsym(v23, "kWebBookmarksPreviewTextKey");
    getkWebBookmarksPreviewTextKeySymbolLoc(void)::ptr = *(void *)(v38[1] + 24);
    v22 = (const char **)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v22) {
    goto LABEL_24;
  }
  xpc_dictionary_set_string(v11, *v22, v17);
  connection = self->_connection;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  v25 = (void *)getkWebBookmarksAddToReadingListMessageNameSymbolLoc(void)::ptr;
  uint64_t v42 = getkWebBookmarksAddToReadingListMessageNameSymbolLoc(void)::ptr;
  if (!getkWebBookmarksAddToReadingListMessageNameSymbolLoc(void)::ptr)
  {
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = ___ZL52getkWebBookmarksAddToReadingListMessageNameSymbolLocv_block_invoke;
    v37 = &unk_1E5C72498;
    v38 = &v39;
    v26 = (void *)WebBookmarksLibrary();
    v40[3] = (uint64_t)dlsym(v26, "kWebBookmarksAddToReadingListMessageName");
    getkWebBookmarksAddToReadingListMessageNameSymbolLoc(void)::ptr = *(void *)(v38[1] + 24);
    v25 = (void *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v25) {
    goto LABEL_24;
  }
  v27 = [(WebBookmarksXPCConnection *)connection messageWithName:*v25];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  v28 = (const char **)getkWebBookmarksItemKeySymbolLoc(void)::ptr;
  uint64_t v42 = getkWebBookmarksItemKeySymbolLoc(void)::ptr;
  if (!getkWebBookmarksItemKeySymbolLoc(void)::ptr)
  {
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = ___ZL32getkWebBookmarksItemKeySymbolLocv_block_invoke;
    v37 = &unk_1E5C72498;
    v38 = &v39;
    v29 = (void *)WebBookmarksLibrary();
    v40[3] = (uint64_t)dlsym(v29, "kWebBookmarksItemKey");
    getkWebBookmarksItemKeySymbolLoc(void)::ptr = *(void *)(v38[1] + 24);
    v28 = (const char **)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (v28)
  {
    xpc_dictionary_set_value(v27, *v28, v11);
    [(WebBookmarksXPCConnection *)self->_connection sendMessage:v27];
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2050000000;
    v30 = (void *)getSafariFetcherServerProxyClass(void)::softClass;
    uint64_t v42 = getSafariFetcherServerProxyClass(void)::softClass;
    if (!getSafariFetcherServerProxyClass(void)::softClass)
    {
      uint64_t v34 = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = ___ZL32getSafariFetcherServerProxyClassv_block_invoke;
      v37 = &unk_1E5C72498;
      v38 = &v39;
      ___ZL32getSafariFetcherServerProxyClassv_block_invoke((uint64_t)&v34);
      v30 = (void *)v40[3];
    }
    v31 = v30;
    _Block_object_dispose(&v39, 8);
    id v32 = objc_alloc_init(v31);
    [v32 startReadingListFetcher];

    return 1;
  }
  else
  {
LABEL_24:
    dlerror();
    BOOL result = abort_report_np();
    __break(1u);
  }
  return result;
}

- (void)_setUpConnectionIfNeeded
{
  if (!self->_connection)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    objc_super v3 = (void *)getWebBookmarksXPCConnectionClass(void)::softClass;
    uint64_t v20 = getWebBookmarksXPCConnectionClass(void)::softClass;
    if (!getWebBookmarksXPCConnectionClass(void)::softClass)
    {
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      id v14 = ___ZL33getWebBookmarksXPCConnectionClassv_block_invoke;
      BOOL v15 = &unk_1E5C72498;
      id v16 = &v17;
      ___ZL33getWebBookmarksXPCConnectionClassv_block_invoke((uint64_t)&v12);
      objc_super v3 = (void *)v18[3];
    }
    v4 = v3;
    _Block_object_dispose(&v17, 8);
    id v5 = [v4 alloc];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    v6 = (void *)getkWebBookmarksdServiceNameSymbolLoc(void)::ptr;
    uint64_t v20 = getkWebBookmarksdServiceNameSymbolLoc(void)::ptr;
    if (!getkWebBookmarksdServiceNameSymbolLoc(void)::ptr)
    {
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      id v14 = ___ZL37getkWebBookmarksdServiceNameSymbolLocv_block_invoke;
      BOOL v15 = &unk_1E5C72498;
      id v16 = &v17;
      v7 = (void *)WebBookmarksLibrary();
      id v8 = dlsym(v7, "kWebBookmarksdServiceName");
      *(void *)(v16[1] + 24) = v8;
      getkWebBookmarksdServiceNameSymbolLoc(void)::ptr = *(void *)(v16[1] + 24);
      v6 = (void *)v18[3];
    }
    _Block_object_dispose(&v17, 8);
    if (!v6)
    {
      xpc_object_t v11 = (_Unwind_Exception *)-[SFDefaultBrowserListView productDetailsUserDidInteractWithApp:interactionType:]();
      _Block_object_dispose(&v17, 8);
      _Unwind_Resume(v11);
    }
    id v9 = (WebBookmarksXPCConnection *)[v5 initClientForMachService:*v6];
    connection = self->_connection;
    self->_connection = v9;

    [(WebBookmarksXPCConnection *)self->_connection setDelegate:self];
  }
}

- (void)connection:(id)a3 didCloseWithError:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (id)WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = [v5 description];
    -[SSReadingList connection:didCloseWithError:](v7, v9, v6);
  }

  connection = self->_connection;
  self->_connection = 0;
}

- (void).cxx_destruct
{
}

- (void)addReadingListItemWithURL:(os_log_t)log title:previewText:error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Failed to add item to Reading List because the URL was nil", v1, 2u);
}

- (void)addReadingListItemWithURL:(os_log_t)log title:previewText:error:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Cannot create a Reading List item: URLs must begin with http or https", v1, 2u);
}

- (void)addReadingListItemWithURL:(os_log_t)log title:previewText:error:.cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138478083;
  uint64_t v4 = a1;
  __int16 v5 = 2113;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1A690B000, log, OS_LOG_TYPE_DEBUG, "#Client Title: %{private}@, URL: %{private}@", (uint8_t *)&v3, 0x16u);
}

- (void)connection:(os_log_t)log didCloseWithError:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "webbookmarksd connection closed with error: %{public}@", buf, 0xCu);
}

@end