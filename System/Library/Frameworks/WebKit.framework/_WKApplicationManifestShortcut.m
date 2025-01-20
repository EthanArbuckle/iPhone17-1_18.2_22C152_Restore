@interface _WKApplicationManifestShortcut
+ (BOOL)supportsSecureCoding;
- (NSArray)icons;
- (NSString)name;
- (NSURL)url;
- (_WKApplicationManifestShortcut)initWithCoder:(id)a3;
- (_WKApplicationManifestShortcut)initWithCoreShortcut:(const void *)a3;
- (id).cxx_construct;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _WKApplicationManifestShortcut

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_WKApplicationManifestShortcut)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = [(_WKApplicationManifestShortcut *)self init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"name"), "copy");
    m_ptr = v4->_name.m_ptr;
    v4->_name.m_ptr = (void *)v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"url"), "copy");
    v8 = v4->_url.m_ptr;
    v4->_url.m_ptr = (void *)v7;
    if (v8) {
      CFRelease(v8);
    }
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:3];
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithArray:", v10, v14, v15), @"icons"), "copy");
    v12 = v4->_icons.m_ptr;
    v4->_icons.m_ptr = (void *)v11;
    if (v12) {
      CFRelease(v12);
    }
  }
  return v4;
}

- (NSString)name
{
  return (NSString *)self->_name.m_ptr;
}

- (NSURL)url
{
  return (NSURL *)self->_url.m_ptr;
}

- (NSArray)icons
{
  return (NSArray *)self->_icons.m_ptr;
}

- (_WKApplicationManifestShortcut)initWithCoreShortcut:(const void *)a3
{
  v4 = objc_alloc_init(_WKApplicationManifestShortcut);
  uint64_t v5 = v4;
  if (a3 && v4)
  {
    if (*(void *)a3) {
      v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      v6 = &stru_1EEA10550;
    }
    uint64_t v7 = [(__CFString *)v6 copy];
    m_ptr = v5->_name.m_ptr;
    v5->_name.m_ptr = (void *)v7;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    uint64_t v9 = [(id)WTF::URL::operator NSURL *() copy];
    uint64_t v10 = v5->_url.m_ptr;
    v5->_url.m_ptr = (void *)v9;
    if (v10) {
      CFRelease(v10);
    }
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned int *)a3 + 15)];
    uint64_t v12 = *((unsigned int *)a3 + 15);
    if (v12)
    {
      uint64_t v13 = *((void *)a3 + 6);
      uint64_t v14 = 72 * v12;
      do
      {
        uint64_t v15 = [[_WKApplicationManifestIcon alloc] initWithCoreIcon:v13];
        if (v15)
        {
          [v11 addObject:v15];
          CFRelease(v15);
        }
        v13 += 72;
        v14 -= 72;
      }
      while (v14);
    }
    uint64_t v16 = v5->_icons.m_ptr;
    v5->_icons.m_ptr = v11;
    if (v16) {
      CFRelease(v16);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_name.m_ptr forKey:@"name"];
  [a3 encodeObject:self->_url.m_ptr forKey:@"url"];
  m_ptr = self->_icons.m_ptr;

  [a3 encodeObject:m_ptr forKey:@"icons"];
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)_WKApplicationManifestShortcut;
    [(_WKApplicationManifestShortcut *)&v4 dealloc];
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_icons.m_ptr;
  self->_icons.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  objc_super v4 = self->_url.m_ptr;
  self->_url.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = self->_name.m_ptr;
  self->_name.m_ptr = 0;
  if (v5)
  {
    CFRelease(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end