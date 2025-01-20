@interface _ATXBundleIdSet
+ (id)sharedInstance;
- (BOOL)containsBundleId:(id)a3;
- (_ATXBundleIdSet)init;
- (id)trie;
- (void)init;
@end

@implementation _ATXBundleIdSet

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_25 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_25, &__block_literal_global_138);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_31;
  return v2;
}

- (_ATXBundleIdSet)init
{
  v7.receiver = self;
  v7.super_class = (Class)_ATXBundleIdSet;
  v2 = [(_ATXBundleIdSet *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F4AF08] pathForResource:@"_ATXBundleIdSet" ofType:@"trie" isDirectory:0];
    if (v3)
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F93AC8]) initWithPath:v3];
      trie = v2->_trie;
      v2->_trie = (_PASCFBurstTrie *)v4;
    }
    else
    {
      trie = __atxlog_handle_default();
      if (os_log_type_enabled(trie, OS_LOG_TYPE_ERROR)) {
        -[_ATXBundleIdSet init](trie);
      }
    }
  }
  return v2;
}

- (BOOL)containsBundleId:(id)a3
{
  return a3 && -[_PASCFBurstTrie payloadForString:](self->_trie, "payloadForString:") != 0;
}

- (id)trie
{
  return self->_trie;
}

- (void).cxx_destruct
{
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Could not locate bundle id set", v1, 2u);
}

@end