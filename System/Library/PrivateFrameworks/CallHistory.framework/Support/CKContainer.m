@interface CKContainer
+ (id)chsh_applicationBundleIdentifierOverrideForNetworkAttribution;
+ (id)chsh_secureContainer;
@end

@implementation CKContainer

+ (id)chsh_applicationBundleIdentifierOverrideForNetworkAttribution
{
  if (MGGetSInt32Answer() == 1) {
    return @"com.apple.mobilephone";
  }
  else {
    return @"com.apple.facetime";
  }
}

+ (id)chsh_secureContainer
{
  id v3 = objc_alloc_init((Class)CKContainerOptions);
  v4 = objc_msgSend(a1, "chsh_applicationBundleIdentifierOverrideForNetworkAttribution");
  [v3 setApplicationBundleIdentifierOverrideForNetworkAttribution:v4];

  [v3 setUseZoneWidePCS:1];
  v5 = +[CKContainer containerWithIdentifier:@"com.apple.callhistory.cloud-storage2"];
  id v6 = objc_alloc((Class)CKContainer);
  v7 = [v5 containerID];
  id v8 = [v6 initWithContainerID:v7 options:v3];

  return v8;
}

@end