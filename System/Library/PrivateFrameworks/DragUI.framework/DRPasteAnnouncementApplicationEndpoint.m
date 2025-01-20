@interface DRPasteAnnouncementApplicationEndpoint
+ (BOOL)supportsSecureCoding;
+ (id)homeScreenEndpoint;
- (BOOL)isSimilarToApplicationEndpoint:(id)a3;
- (DRPasteAnnouncementApplicationEndpoint)initWithCoder:(id)a3;
- (DRPasteAnnouncementApplicationEndpoint)initWithLocalizedName:(id)a3 persistentIdentifier:(id)a4;
- (NSData)persistentIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DRPasteAnnouncementApplicationEndpoint

- (DRPasteAnnouncementApplicationEndpoint)initWithLocalizedName:(id)a3 persistentIdentifier:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DRPasteAnnouncementApplicationEndpoint;
  v7 = [(DRPasteAnnouncementEndpoint *)&v11 _initWithLocalizedName:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    persistentIdentifier = v7->_persistentIdentifier;
    v7->_persistentIdentifier = (NSData *)v8;
  }
  return v7;
}

+ (id)homeScreenEndpoint
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__DRPasteAnnouncementApplicationEndpoint_homeScreenEndpoint__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (homeScreenEndpoint_onceToken != -1) {
    dispatch_once(&homeScreenEndpoint_onceToken, block);
  }
  v2 = (void *)homeScreenEndpoint_sharedInstance;
  return v2;
}

void __60__DRPasteAnnouncementApplicationEndpoint_homeScreenEndpoint__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v0 localizedStringForKey:@"SYSTEM_APP_NAME" value:@"Home Screen" table:@"Localizable"];

  v1 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:@"com.apple.springboard" allowPlaceholder:0 error:0];
  v2 = [v1 persistentIdentifier];
  v3 = [[DRPasteAnnouncementApplicationEndpoint alloc] initWithLocalizedName:v5 persistentIdentifier:v2];
  v4 = (void *)homeScreenEndpoint_sharedInstance;
  homeScreenEndpoint_sharedInstance = (uint64_t)v3;

  *(unsigned char *)(homeScreenEndpoint_sharedInstance + 16) |= 1u;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DRPasteAnnouncementApplicationEndpoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DRPasteAnnouncementApplicationEndpoint;
  id v5 = [(DRPasteAnnouncementEndpoint *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persistentIdentifier"];
    persistentIdentifier = v5->_persistentIdentifier;
    v5->_persistentIdentifier = (NSData *)v6;

    *(unsigned char *)&v5->_flags = *(unsigned char *)&v5->_flags & 0xFE | [v4 decodeBoolForKey:@"isHomeScreen"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DRPasteAnnouncementApplicationEndpoint;
  [(DRPasteAnnouncementEndpoint *)&v6 encodeWithCoder:v4];
  persistentIdentifier = self->_persistentIdentifier;
  if (persistentIdentifier)
  {
    [v4 encodeObject:persistentIdentifier forKey:@"persistentIdentifier"];
    [v4 encodeBool:*(unsigned char *)&self->_flags & 1 forKey:@"isHomeScreen"];
  }
}

- (BOOL)isSimilarToApplicationEndpoint:(id)a3
{
  id v3 = a3;
  id v4 = [v3 persistentIdentifier];
  LODWORD(self) = [v4 isEqualToData:self->_persistentIdentifier];

  if (self)
  {
    self = (DRPasteAnnouncementApplicationEndpoint *)objc_alloc(MEMORY[0x263F018C8]);
    objc_super v6 = [v3 persistentIdentifier];
    v7 = [(DRPasteAnnouncementApplicationEndpoint *)self initWithPersistentIdentifier:v6];

    objc_opt_class();
    LOBYTE(self) = objc_opt_isKindOfClass();
  }
  return self & 1;
}

- (NSData)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void).cxx_destruct
{
}

@end