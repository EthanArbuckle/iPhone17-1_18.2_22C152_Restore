@interface WKShareSheetURLItemProvider
- (WKShareSheetURLItemProvider)initWithURL:(id)a3 title:(id)a4;
- (id).cxx_construct;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)item;
@end

@implementation WKShareSheetURLItemProvider

- (WKShareSheetURLItemProvider)initWithURL:(id)a3 title:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)WKShareSheetURLItemProvider;
  v6 = -[UIActivityItemProvider initWithPlaceholderItem:](&v11, sel_initWithPlaceholderItem_);
  if (v6)
  {
    v7 = (void *)[objc_alloc((Class)((uint64_t (*)(void))*MEMORY[0x1E4FB62C8])()) init];
    [v7 setOriginalURL:a3];
    [v7 setURL:a3];
    [v7 setTitle:a4];
    [v7 _setIncomplete:1];
    m_ptr = v6->_metadata.m_ptr;
    v6->_metadata.m_ptr = v7;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    if (a3) {
      CFRetain(a3);
    }
    v9 = v6->_url.m_ptr;
    v6->_url.m_ptr = a3;
    if (v9) {
      CFRelease(v9);
    }
  }
  return v6;
}

- (id)item
{
  return self->_url.m_ptr;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  return self->_metadata.m_ptr;
}

- (void).cxx_destruct
{
  m_ptr = self->_metadata.m_ptr;
  self->_metadata.m_ptr = 0;
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