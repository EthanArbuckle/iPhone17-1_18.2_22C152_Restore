@interface MSSSettingsUtilities
+ (id)photosMainPaneLocalizedResource;
+ (id)sharedLibraryPaneLocalizedResource;
@end

@implementation MSSSettingsUtilities

+ (id)sharedLibraryPaneLocalizedResource
{
  id v2 = objc_alloc((Class)_NSLocalizedStringResource);
  v3 = +[NSLocale currentLocale];
  v4 = +[NSBundle px_bundle];
  v5 = [v4 bundleURL];
  id v6 = [v2 initWithKey:@"PXSharedLibrary_Profile_SharedLibrarySectionTitle" table:@"PhotosUICoreSharedLibrary" locale:v3 bundleURL:v5];

  return v6;
}

+ (id)photosMainPaneLocalizedResource
{
  id v3 = objc_alloc((Class)_NSLocalizedStringResource);
  v4 = +[NSLocale currentLocale];
  v5 = +[NSBundle bundleForClass:a1];
  id v6 = [v5 bundleURL];
  id v7 = [v3 initWithKey:@"PHOTOS" table:@"Photos" locale:v4 bundleURL:v6];

  return v7;
}

@end