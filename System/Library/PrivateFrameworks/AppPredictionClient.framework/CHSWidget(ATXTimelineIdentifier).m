@interface CHSWidget(ATXTimelineIdentifier)
- (id)atxTimelineIdentifier;
@end

@implementation CHSWidget(ATXTimelineIdentifier)

- (id)atxTimelineIdentifier
{
  v2 = [a1 intentReference];
  v3 = [v2 intent];

  id v4 = [NSString alloc];
  v5 = [a1 extensionIdentity];
  v6 = [v5 extensionBundleIdentifier];
  v7 = [a1 kind];
  [a1 family];
  uint64_t v8 = NSStringFromWidgetFamily();
  v9 = (void *)v8;
  if (v3) {
    uint64_t v10 = [v4 initWithFormat:@"%@.%@.%@.%lld", v6, v7, v8, objc_msgSend(v3, "atx_indexingHash")];
  }
  else {
    uint64_t v10 = [v4 initWithFormat:@"%@.%@.%@", v6, v7, v8, v13];
  }
  v11 = (void *)v10;

  return v11;
}

@end