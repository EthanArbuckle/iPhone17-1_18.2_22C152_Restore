@interface CKSettingsDisplayableAppPermissionGroup
- (CKApplicationPermissionGroup)applicationPermissionGroup;
- (CKSettingsAppNameImage)primaryAppNameImage;
- (CKSettingsDisplayableAppPermissionGroup)initWithApplicationPermissionGroup:(id)a3 appNameImages:(id)a4;
- (NSArray)appNameImages;
- (id)redactedDescription;
- (void)setAppNameImages:(id)a3;
@end

@implementation CKSettingsDisplayableAppPermissionGroup

- (CKSettingsDisplayableAppPermissionGroup)initWithApplicationPermissionGroup:(id)a3 appNameImages:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKSettingsDisplayableAppPermissionGroup;
  v9 = [(CKSettingsDisplayableAppPermissionGroup *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_applicationPermissionGroup, a3);
    uint64_t v11 = [v8 sortedArrayUsingComparator:&stru_145C0];
    appNameImages = v10->_appNameImages;
    v10->_appNameImages = (NSArray *)v11;
  }
  return v10;
}

- (CKSettingsAppNameImage)primaryAppNameImage
{
  v2 = [(CKSettingsDisplayableAppPermissionGroup *)self appNameImages];
  v3 = [v2 firstObject];

  return (CKSettingsAppNameImage *)v3;
}

- (id)redactedDescription
{
  return [(CKSettingsDisplayableAppPermissionGroup *)self description];
}

- (NSArray)appNameImages
{
  return self->_appNameImages;
}

- (void)setAppNameImages:(id)a3
{
}

- (CKApplicationPermissionGroup)applicationPermissionGroup
{
  return self->_applicationPermissionGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationPermissionGroup, 0);

  objc_storeStrong((id *)&self->_appNameImages, 0);
}

@end