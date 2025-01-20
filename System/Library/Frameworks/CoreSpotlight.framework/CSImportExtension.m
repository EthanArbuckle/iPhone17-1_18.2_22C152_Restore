@interface CSImportExtension
- (BOOL)updateAttributes:(CSSearchableItemAttributeSet *)attributes forFileAtURL:(NSURL *)contentURL error:(NSError *)error;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)dealloc;
@end

@implementation CSImportExtension

- (void)dealloc
{
  v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(CSIndexExtensionRequestHandler *)(uint64_t)self dealloc];
  }

  v4.receiver = self;
  v4.super_class = (Class)CSImportExtension;
  [(CSImportExtension *)&v4 dealloc];
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setImportExtension:self];
  }
}

- (BOOL)updateAttributes:(CSSearchableItemAttributeSet *)attributes forFileAtURL:(NSURL *)contentURL error:(NSError *)error
{
  return 0;
}

@end