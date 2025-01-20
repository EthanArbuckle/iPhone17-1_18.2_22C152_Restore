@interface _WKApplicationManifestIcon
+ (BOOL)supportsSecureCoding;
- (NSArray)purposes;
- (NSArray)sizes;
- (NSString)type;
- (NSURL)src;
- (_WKApplicationManifestIcon)initWithCoder:(id)a3;
- (_WKApplicationManifestIcon)initWithCoreIcon:(const void *)a3;
- (id).cxx_construct;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _WKApplicationManifestIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_WKApplicationManifestIcon)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v4 = [(_WKApplicationManifestIcon *)self init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"src"), "copy");
    m_ptr = v4->_src.m_ptr;
    v4->_src.m_ptr = (void *)v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 2)), @"sizes"), "copy");
    v9 = v4->_sizes.m_ptr;
    v4->_sizes.m_ptr = (void *)v8;
    if (v9) {
      CFRelease(v9);
    }
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"type"), "copy");
    v11 = v4->_type.m_ptr;
    v4->_type.m_ptr = (void *)v10;
    if (v11) {
      CFRelease(v11);
    }
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    uint64_t v13 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v12, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v16, 2)), @"purposes"), "copy");
    v14 = v4->_purposes.m_ptr;
    v4->_purposes.m_ptr = (void *)v13;
    if (v14) {
      CFRelease(v14);
    }
  }
  return v4;
}

- (_WKApplicationManifestIcon)initWithCoreIcon:(const void *)a3
{
  v4 = objc_alloc_init(_WKApplicationManifestIcon);
  uint64_t v5 = v4;
  if (a3 && v4)
  {
    uint64_t v6 = [(id)WTF::URL::operator NSURL *() copy];
    m_ptr = v5->_src.m_ptr;
    v5->_src.m_ptr = (void *)v6;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned int *)a3 + 13)];
    uint64_t v9 = *((unsigned int *)a3 + 13);
    if (v9)
    {
      uint64_t v10 = (void *)*((void *)a3 + 5);
      uint64_t v11 = 8 * v9;
      while (*v10)
      {
        v12 = (__CFString *)WTF::StringImpl::operator NSString *();
        if (v12) {
          goto LABEL_9;
        }
LABEL_10:
        ++v10;
        v11 -= 8;
        if (!v11) {
          goto LABEL_13;
        }
      }
      v12 = &stru_1EEA10550;
LABEL_9:
      [v8 addObject:v12];
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v13 = v5->_sizes.m_ptr;
    v5->_sizes.m_ptr = v8;
    if (v13) {
      CFRelease(v13);
    }
    if (*((void *)a3 + 7)) {
      v14 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      v14 = &stru_1EEA10550;
    }
    uint64_t v15 = [(__CFString *)v14 copy];
    v16 = v5->_type.m_ptr;
    v5->_type.m_ptr = (void *)v15;
    if (v16) {
      CFRelease(v16);
    }
    int v17 = *((unsigned __int8 *)a3 + 64);
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v17)
    {
      do
      {
        objc_msgSend(v18, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", (v17 & -(char)v17)));
        v17 &= v17 - 1;
      }
      while ((_BYTE)v17);
    }
    v19 = v5->_purposes.m_ptr;
    v5->_purposes.m_ptr = v18;
    if (v19) {
      CFRelease(v19);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_src.m_ptr forKey:@"src"];
  [a3 encodeObject:self->_sizes.m_ptr forKey:@"sizes"];
  [a3 encodeObject:self->_type.m_ptr forKey:@"type"];
  m_ptr = self->_purposes.m_ptr;

  [a3 encodeObject:m_ptr forKey:@"purposes"];
}

- (NSURL)src
{
  return (NSURL *)self->_src.m_ptr;
}

- (NSArray)sizes
{
  return (NSArray *)self->_sizes.m_ptr;
}

- (NSString)type
{
  return (NSString *)self->_type.m_ptr;
}

- (NSArray)purposes
{
  return (NSArray *)self->_purposes.m_ptr;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)_WKApplicationManifestIcon;
    [(_WKApplicationManifestIcon *)&v4 dealloc];
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_purposes.m_ptr;
  self->_purposes.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  objc_super v4 = self->_type.m_ptr;
  self->_type.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = self->_sizes.m_ptr;
  self->_sizes.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v6 = self->_src.m_ptr;
  self->_src.m_ptr = 0;
  if (v6)
  {
    CFRelease(v6);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end