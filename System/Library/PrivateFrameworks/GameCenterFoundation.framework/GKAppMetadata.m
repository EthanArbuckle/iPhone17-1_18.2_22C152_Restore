@interface GKAppMetadata
+ (id)secureCodedPropertyKeys;
- (BOOL)supportsArcade;
- (BOOL)supportsGameCenter;
- (BOOL)supportsGameController;
- (GKAppMetadata)initWithBundleID:(id)a3 adamID:(id)a4 name:(id)a5 shortName:(id)a6 artwork:(id)a7 supportsGameCenter:(BOOL)a8 supportsArcade:(BOOL)a9 supportsGameController:(BOOL)a10 deviceFamilies:(id)a11 latestVersionReleaseDate:(id)a12 genreDisplayName:(id)a13;
- (GKArtworkMetadata)artwork;
- (NSArray)deviceFamilies;
- (NSDate)latestVersionReleaseDate;
- (NSString)adamID;
- (NSString)bundleID;
- (NSString)genreDisplayName;
- (NSString)name;
- (NSString)shortName;
- (id)description;
@end

@implementation GKAppMetadata

- (GKAppMetadata)initWithBundleID:(id)a3 adamID:(id)a4 name:(id)a5 shortName:(id)a6 artwork:(id)a7 supportsGameCenter:(BOOL)a8 supportsArcade:(BOOL)a9 supportsGameController:(BOOL)a10 deviceFamilies:(id)a11 latestVersionReleaseDate:(id)a12 genreDisplayName:(id)a13
{
  id v19 = a3;
  id obj = a4;
  id v20 = a4;
  id v29 = a5;
  id v21 = a5;
  id v33 = a6;
  id v30 = a7;
  id v32 = a7;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  v34.receiver = self;
  v34.super_class = (Class)GKAppMetadata;
  v25 = [(GKAppMetadata *)&v34 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_bundleID, a3);
    objc_storeStrong((id *)&v26->_adamID, obj);
    objc_storeStrong((id *)&v26->_name, v29);
    objc_storeStrong((id *)&v26->_shortName, a6);
    objc_storeStrong((id *)&v26->_artwork, v30);
    v26->_supportsGameCenter = a8;
    v26->_supportsArcade = a9;
    v26->_supportsGameController = a10;
    objc_storeStrong((id *)&v26->_deviceFamilies, a11);
    objc_storeStrong((id *)&v26->_latestVersionReleaseDate, a12);
    objc_storeStrong((id *)&v26->_genreDisplayName, a13);
  }

  return v26;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_18 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_18, &__block_literal_global_58);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_18;

  return v2;
}

void __40__GKAppMetadata_secureCodedPropertyKeys__block_invoke()
{
  v6[11] = *MEMORY[0x1E4F143B8];
  v5[0] = @"bundleID";
  v6[0] = objc_opt_class();
  v5[1] = @"adamID";
  v6[1] = objc_opt_class();
  v5[2] = @"name";
  v6[2] = objc_opt_class();
  v5[3] = @"shortName";
  v6[3] = objc_opt_class();
  v5[4] = @"artwork";
  v6[4] = objc_opt_class();
  v5[5] = @"genreDisplayName";
  v6[5] = objc_opt_class();
  v5[6] = @"supportsGameCenter";
  v6[6] = objc_opt_class();
  v5[7] = @"supportsArcade";
  v6[7] = objc_opt_class();
  v5[8] = @"supportsGameController";
  v6[8] = objc_opt_class();
  v5[9] = @"deviceFamilies";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v6[9] = v2;
  v5[10] = @"latestVersionReleaseDate";
  v6[10] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:11];
  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_18;
  secureCodedPropertyKeys_sSecureCodedKeys_18 = v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(GKAppMetadata *)self adamID];
  v7 = [(GKAppMetadata *)self bundleID];
  v8 = [v3 stringWithFormat:@"%@: adamID: %@, bundleID: %@", v5, v6, v7];

  return v8;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (GKArtworkMetadata)artwork
{
  return self->_artwork;
}

- (BOOL)supportsGameCenter
{
  return self->_supportsGameCenter;
}

- (BOOL)supportsArcade
{
  return self->_supportsArcade;
}

- (BOOL)supportsGameController
{
  return self->_supportsGameController;
}

- (NSArray)deviceFamilies
{
  return self->_deviceFamilies;
}

- (NSDate)latestVersionReleaseDate
{
  return self->_latestVersionReleaseDate;
}

- (NSString)genreDisplayName
{
  return self->_genreDisplayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genreDisplayName, 0);
  objc_storeStrong((id *)&self->_latestVersionReleaseDate, 0);
  objc_storeStrong((id *)&self->_deviceFamilies, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_adamID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end