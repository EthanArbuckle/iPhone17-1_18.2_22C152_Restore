@interface MPNowPlayingInfoLanguageOptionGroup
- (BOOL)allowEmptySelection;
- (MPNowPlayingInfoLanguageOption)defaultLanguageOption;
- (MPNowPlayingInfoLanguageOptionGroup)initWithLanguageOptions:(NSArray *)languageOptions defaultLanguageOption:(MPNowPlayingInfoLanguageOption *)defaultLanguageOption allowEmptySelection:(BOOL)allowEmptySelection;
- (MPNowPlayingInfoLanguageOptionGroup)initWithMRLanguageOptionGroup:(void *)a3;
- (NSArray)languageOptions;
- (void)dealloc;
- (void)mrLanguageOptionGroup;
@end

@implementation MPNowPlayingInfoLanguageOptionGroup

- (void)mrLanguageOptionGroup
{
  return self->_mrLanguageOptionGroup;
}

- (BOOL)allowEmptySelection
{
}

- (MPNowPlayingInfoLanguageOption)defaultLanguageOption
{
  v2 = [[MPNowPlayingInfoLanguageOption alloc] initWithMRLanguageOption:MRLanguageOptionGroupGetDefaultLanguageOption()];

  return v2;
}

- (NSArray)languageOptions
{
  CFArrayRef v2 = (const __CFArray *)MRLanguageOptionGroupCopyLanguageOptions();
  if (v2)
  {
    CFArrayRef v3 = v2;
    CFIndex Count = CFArrayGetCount(v2);
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        v7 = [[MPNowPlayingInfoLanguageOption alloc] initWithMRLanguageOption:CFArrayGetValueAtIndex(v3, i)];
        [v5 addObject:v7];
      }
    }
    CFRelease(v3);
  }
  else
  {
    v5 = 0;
  }
  if (v5) {
    v8 = v5;
  }
  else {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v9 = v8;

  return v9;
}

- (void)dealloc
{
  mrLanguageOptionGroup = self->_mrLanguageOptionGroup;
  if (mrLanguageOptionGroup) {
    CFRelease(mrLanguageOptionGroup);
  }
  v4.receiver = self;
  v4.super_class = (Class)MPNowPlayingInfoLanguageOptionGroup;
  [(MPNowPlayingInfoLanguageOptionGroup *)&v4 dealloc];
}

- (MPNowPlayingInfoLanguageOptionGroup)initWithMRLanguageOptionGroup:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPNowPlayingInfoLanguageOptionGroup;
  objc_super v4 = [(MPNowPlayingInfoLanguageOptionGroup *)&v7 init];
  v5 = v4;
  if (a3 && v4) {
    v4->_mrLanguageOptionGroup = (void *)CFRetain(a3);
  }
  return v5;
}

- (MPNowPlayingInfoLanguageOptionGroup)initWithLanguageOptions:(NSArray *)languageOptions defaultLanguageOption:(MPNowPlayingInfoLanguageOption *)defaultLanguageOption allowEmptySelection:(BOOL)allowEmptySelection
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_super v7 = languageOptions;
  v8 = defaultLanguageOption;
  v23.receiver = self;
  v23.super_class = (Class)MPNowPlayingInfoLanguageOptionGroup;
  v9 = [(MPNowPlayingInfoLanguageOptionGroup *)&v23 init];
  if (v9)
  {
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFIndex v11 = [(NSArray *)v7 count];
    Mutable = CFArrayCreateMutable(v10, v11, MEMORY[0x1E4F1D510]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v13 = v7;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          CFArrayAppendValue(Mutable, (const void *)objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v17++), "mrLanguageOption", (void)v19));
        }
        while (v15 != v17);
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v15);
    }

    if (v8) {
      [(MPNowPlayingInfoLanguageOption *)v8 mrLanguageOption];
    }
    v9->_mrLanguageOptionGroup = (void *)MRLanguageOptionGroupCreate();
    CFRelease(Mutable);
  }

  return v9;
}

@end