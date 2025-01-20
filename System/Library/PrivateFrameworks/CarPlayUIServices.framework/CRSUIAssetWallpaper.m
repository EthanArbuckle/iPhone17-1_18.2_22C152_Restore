@interface CRSUIAssetWallpaper
- (BOOL)isEqual:(id)a3;
- (CRSUIAssetWallpaper)initWithIdentifier:(id)a3 displayID:(id)a4 layoutID:(id)a5 cacheID:(id)a6 traits:(id)a7;
- (CRSUIWallpaperTraits)traits;
- (NSString)cacheID;
- (NSString)description;
- (NSString)displayID;
- (NSString)identifier;
- (NSString)layoutID;
- (NSString)wallpaperIdentifier;
- (id)data;
@end

@implementation CRSUIAssetWallpaper

- (CRSUIAssetWallpaper)initWithIdentifier:(id)a3 displayID:(id)a4 layoutID:(id)a5 cacheID:(id)a6 traits:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)CRSUIAssetWallpaper;
  v17 = [(CRSUIAssetWallpaper *)&v27 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    wallpaperIdentifier = v17->_wallpaperIdentifier;
    v17->_wallpaperIdentifier = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    displayID = v17->_displayID;
    v17->_displayID = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    layoutID = v17->_layoutID;
    v17->_layoutID = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    cacheID = v17->_cacheID;
    v17->_cacheID = (NSString *)v24;

    objc_storeStrong((id *)&v17->_traits, a7);
  }

  return v17;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(CRSUIAssetWallpaper *)self wallpaperIdentifier];
  [v3 appendString:v4 withName:@"identifier"];

  v5 = [(CRSUIAssetWallpaper *)self displayID];
  [v3 appendString:v5 withName:@"displayID"];

  v6 = [(CRSUIAssetWallpaper *)self layoutID];
  [v3 appendString:v6 withName:@"layoutID"];

  v7 = [(CRSUIAssetWallpaper *)self traits];
  id v8 = (id)[v3 appendObject:v7 withName:@"traits"];

  v9 = [v3 build];

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = [(CRSUIAssetWallpaper *)self data];
    v10 = [v8 data];
    char v11 = [v9 isEqual:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)data
{
  id v3 = objc_alloc(MEMORY[0x263F30E60]);
  id v4 = [(CRSUIAssetWallpaper *)self wallpaperIdentifier];
  uint64_t v5 = [(CRSUIAssetWallpaper *)self displayID];
  id v6 = [(CRSUIAssetWallpaper *)self layoutID];
  v7 = (void *)[v3 initWithWallpaperIdentifier:v4 displayID:v5 layoutID:v6];

  return v7;
}

- (NSString)identifier
{
  v2 = [(CRSUIAssetWallpaper *)self data];
  id v3 = [v2 identifier];

  return (NSString *)v3;
}

- (CRSUIWallpaperTraits)traits
{
  return self->_traits;
}

- (NSString)cacheID
{
  return self->_cacheID;
}

- (NSString)wallpaperIdentifier
{
  return self->_wallpaperIdentifier;
}

- (NSString)displayID
{
  return self->_displayID;
}

- (NSString)layoutID
{
  return self->_layoutID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutID, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
  objc_storeStrong((id *)&self->_wallpaperIdentifier, 0);
  objc_storeStrong((id *)&self->_cacheID, 0);
  objc_storeStrong((id *)&self->_traits, 0);
}

@end