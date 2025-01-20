@interface HMIExternalPersonManagerSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isImportingFromPhotoLibraryEnabled;
- (BOOL)isSharingFaceClassificationsEnabled;
- (HMIExternalPersonManagerSettings)initWithCoder:(id)a3;
- (NSArray)attributeDescriptions;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImportingFromPhotoLibraryEnabled:(BOOL)a3;
- (void)setSharingFaceClassificationsEnabled:(BOOL)a3;
@end

@implementation HMIExternalPersonManagerSettings

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (int v7 = -[HMIExternalPersonManagerSettings isImportingFromPhotoLibraryEnabled](self, "isImportingFromPhotoLibraryEnabled"), v7 == [v6 isImportingFromPhotoLibraryEnabled]))
  {
    BOOL v9 = [(HMIExternalPersonManagerSettings *)self isSharingFaceClassificationsEnabled];
    int v8 = v9 ^ [v6 isSharingFaceClassificationsEnabled] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  BOOL v3 = [(HMIExternalPersonManagerSettings *)self isImportingFromPhotoLibraryEnabled];
  return v3 ^ [(HMIExternalPersonManagerSettings *)self isSharingFaceClassificationsEnabled];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [+[HMIMutableExternalPersonManagerSettings allocWithZone:a3] init];
  [(HMIExternalPersonManagerSettings *)v4 setImportingFromPhotoLibraryEnabled:[(HMIExternalPersonManagerSettings *)self isImportingFromPhotoLibraryEnabled]];
  [(HMIExternalPersonManagerSettings *)v4 setSharingFaceClassificationsEnabled:[(HMIExternalPersonManagerSettings *)self isSharingFaceClassificationsEnabled]];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[HMIExternalPersonManagerSettings isImportingFromPhotoLibraryEnabled](self, "isImportingFromPhotoLibraryEnabled"), @"HMPMS.ifple");
  objc_msgSend(v4, "encodeBool:forKey:", -[HMIExternalPersonManagerSettings isSharingFaceClassificationsEnabled](self, "isSharingFaceClassificationsEnabled"), @"HMPMS.sfce");
}

- (HMIExternalPersonManagerSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (HMIExternalPersonManagerSettings *)objc_alloc_init((Class)objc_opt_class());
  -[HMIExternalPersonManagerSettings setImportingFromPhotoLibraryEnabled:](v5, "setImportingFromPhotoLibraryEnabled:", [v4 decodeBoolForKey:@"HMPMS.ifple"]);
  uint64_t v6 = [v4 decodeBoolForKey:@"HMPMS.sfce"];

  [(HMIExternalPersonManagerSettings *)v5 setSharingFaceClassificationsEnabled:v6];
  return v5;
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMIExternalPersonManagerSettings *)self isImportingFromPhotoLibraryEnabled];
  id v4 = HMFBooleanToString();
  v5 = (void *)[v3 initWithName:@"Importing From Photo Library Enabled" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMIExternalPersonManagerSettings *)self isSharingFaceClassificationsEnabled];
  int v7 = HMFBooleanToString();
  int v8 = (void *)[v6 initWithName:@"Sharing Face Classifications Enabled" value:v7];
  v11[1] = v8;
  BOOL v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return (NSArray *)v9;
}

- (BOOL)isImportingFromPhotoLibraryEnabled
{
  return self->_importingFromPhotoLibraryEnabled;
}

- (void)setImportingFromPhotoLibraryEnabled:(BOOL)a3
{
  self->_importingFromPhotoLibraryEnabled = a3;
}

- (BOOL)isSharingFaceClassificationsEnabled
{
  return self->_sharingFaceClassificationsEnabled;
}

- (void)setSharingFaceClassificationsEnabled:(BOOL)a3
{
  self->_sharingFaceClassificationsEnabled = a3;
}

@end