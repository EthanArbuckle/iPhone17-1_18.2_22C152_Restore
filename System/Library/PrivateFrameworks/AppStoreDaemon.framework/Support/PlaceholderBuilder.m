@interface PlaceholderBuilder
- (PlaceholderBuilder)init;
@end

@implementation PlaceholderBuilder

- (PlaceholderBuilder)init
{
  v5.receiver = self;
  v5.super_class = (Class)PlaceholderBuilder;
  v2 = [(PlaceholderBuilder *)&v5 init];
  if (v2)
  {
    v3 = ASDLogHandleForCategory();
    v2->_signpostID = os_signpost_id_make_with_pointer(v3, v2);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeMetadata, 0);
  objc_storeStrong((id *)&self->_uiDeviceFamilyHints, 0);
  objc_storeStrong((id *)&self->_messagesArtworkURL, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_companionBundleID, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_artworkData, 0);
}

@end