@interface BRContainerBundleIdentifiersEnumerator
- (BRContainerBundleIdentifiersEnumerator)initWithContainerPlist:(id)a3;
- (id)nextObject;
@end

@implementation BRContainerBundleIdentifiersEnumerator

- (BRContainerBundleIdentifiersEnumerator)initWithContainerPlist:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRContainerBundleIdentifiersEnumerator;
  v5 = [(BRContainerBundleIdentifiersEnumerator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 keyEnumerator];
    enumerator = v5->_enumerator;
    v5->_enumerator = (NSEnumerator *)v6;
  }
  return v5;
}

- (id)nextObject
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(NSEnumerator *)self->_enumerator nextObject];
  if (v3)
  {
    *(void *)&long long v4 = 138412290;
    long long v9 = v4;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v3 isEqualToString:@"BRContainerIcons"] & 1) == 0)
      {
        if (![v3 isEqualToString:@"com.apple.bird"]) {
          break;
        }
        v5 = brc_bread_crumbs((uint64_t)"-[BRContainerBundleIdentifiersEnumerator nextObject]", 206);
        uint64_t v6 = brc_default_log(1);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v9;
          v11 = v5;
          _os_log_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring bundle com.apple.bird%@", buf, 0xCu);
        }
      }
      uint64_t v7 = [(NSEnumerator *)self->_enumerator nextObject];

      v3 = (void *)v7;
    }
    while (v7);
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end