@interface WKShareSheetFileItemProvider
- (WKShareSheetFileItemProvider)initWithURL:(id)a3;
- (id).cxx_construct;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)item;
@end

@implementation WKShareSheetFileItemProvider

- (WKShareSheetFileItemProvider)initWithURL:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WKShareSheetFileItemProvider;
  v4 = -[UIActivityItemProvider initWithPlaceholderItem:](&v11, sel_initWithPlaceholderItem_, [MEMORY[0x1E4F1C9B8] data]);
  if (v4)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v4->_url.m_ptr;
    v4->_url.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v6 = (void *)[objc_alloc((Class)((uint64_t (*)(void))*MEMORY[0x1E4FB6330])()) init];
    [v6 setShouldFetchSubresources:0];
    v7 = (void *)[v6 _startFetchingMetadataForURL:a3 completionHandler:&__block_literal_global_42];
    v8 = v7;
    if (v7) {
      CFRetain(v7);
    }
    v9 = v4->_headerMetadata.m_ptr;
    v4->_headerMetadata.m_ptr = v8;
    if (v9) {
      CFRelease(v9);
    }
    if (v6) {
      CFRelease(v6);
    }
  }
  return v4;
}

- (id)item
{
  return self->_url.m_ptr;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  m_ptr = self->_url.m_ptr;
  v8 = 0;
  [m_ptr getPromisedItemResourceValue:&v8 forKey:*MEMORY[0x1E4F1C728] error:0];
  id result = v8;
  if (!v8)
  {
    uint64_t v6 = [m_ptr pathExtension];
    if (!v6 || (v7 = (void *)[MEMORY[0x1E4F442D8] typeWithFilenameExtension:v6]) == 0) {
      v7 = (void *)*MEMORY[0x1E4F44378];
    }
    return (id)[v7 identifier];
  }
  return result;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  return self->_headerMetadata.m_ptr;
}

- (void).cxx_destruct
{
  m_ptr = self->_headerMetadata.m_ptr;
  self->_headerMetadata.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->_url.m_ptr;
  self->_url.m_ptr = 0;
  if (v4)
  {
    CFRelease(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 34) = 0;
  *((void *)self + 35) = 0;
  return self;
}

@end