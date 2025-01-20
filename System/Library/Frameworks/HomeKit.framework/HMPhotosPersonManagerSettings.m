@interface HMPhotosPersonManagerSettings
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isImportingFromPhotoLibraryEnabled;
- (BOOL)isSharingFaceClassificationsEnabled;
- (HMPhotosPersonManagerSettings)initWithCoder:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImportingFromPhotoLibraryEnabled:(BOOL)a3;
- (void)setSharingFaceClassificationsEnabled:(BOOL)a3;
@end

@implementation HMPhotosPersonManagerSettings

- (void)setSharingFaceClassificationsEnabled:(BOOL)a3
{
  self->_sharingFaceClassificationsEnabled = a3;
}

- (BOOL)isSharingFaceClassificationsEnabled
{
  return self->_sharingFaceClassificationsEnabled;
}

- (void)setImportingFromPhotoLibraryEnabled:(BOOL)a3
{
  self->_importingFromPhotoLibraryEnabled = a3;
}

- (BOOL)isImportingFromPhotoLibraryEnabled
{
  return self->_importingFromPhotoLibraryEnabled;
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMPhotosPersonManagerSettings *)self isImportingFromPhotoLibraryEnabled];
  v4 = HMFBooleanToString();
  v5 = (void *)[v3 initWithName:@"Importing From Photo Library Enabled" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMPhotosPersonManagerSettings *)self isSharingFaceClassificationsEnabled];
  v7 = HMFBooleanToString();
  v8 = (void *)[v6 initWithName:@"Sharing Face Classifications Enabled" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return (NSArray *)v9;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (HMPhotosPersonManagerSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (HMPhotosPersonManagerSettings *)objc_alloc_init((Class)objc_opt_class());
  -[HMPhotosPersonManagerSettings setImportingFromPhotoLibraryEnabled:](v5, "setImportingFromPhotoLibraryEnabled:", [v4 decodeBoolForKey:@"HMPMS.ifple"]);
  uint64_t v6 = [v4 decodeBoolForKey:@"HMPMS.sfce"];

  [(HMPhotosPersonManagerSettings *)v5 setSharingFaceClassificationsEnabled:v6];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[HMPhotosPersonManagerSettings isImportingFromPhotoLibraryEnabled](self, "isImportingFromPhotoLibraryEnabled"), @"HMPMS.ifple");
  objc_msgSend(v4, "encodeBool:forKey:", -[HMPhotosPersonManagerSettings isSharingFaceClassificationsEnabled](self, "isSharingFaceClassificationsEnabled"), @"HMPMS.sfce");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [+[HMMutablePhotosPersonManagerSettings allocWithZone:a3] init];
  [(HMPhotosPersonManagerSettings *)v4 setImportingFromPhotoLibraryEnabled:[(HMPhotosPersonManagerSettings *)self isImportingFromPhotoLibraryEnabled]];
  [(HMPhotosPersonManagerSettings *)v4 setSharingFaceClassificationsEnabled:[(HMPhotosPersonManagerSettings *)self isSharingFaceClassificationsEnabled]];
  return v4;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  BOOL v3 = [(HMPhotosPersonManagerSettings *)self isImportingFromPhotoLibraryEnabled];
  return v3 ^ [(HMPhotosPersonManagerSettings *)self isSharingFaceClassificationsEnabled];
}

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
    && (int v7 = -[HMPhotosPersonManagerSettings isImportingFromPhotoLibraryEnabled](self, "isImportingFromPhotoLibraryEnabled"), v7 == [v6 isImportingFromPhotoLibraryEnabled]))
  {
    BOOL v9 = [(HMPhotosPersonManagerSettings *)self isSharingFaceClassificationsEnabled];
    int v8 = v9 ^ [v6 isSharingFaceClassificationsEnabled] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

@end