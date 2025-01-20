@interface CRAssetWallpaperData
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CRAssetWallpaperData)initWithBSXPCCoder:(id)a3;
- (CRAssetWallpaperData)initWithCoder:(id)a3;
- (CRAssetWallpaperData)initWithDictionary:(id)a3;
- (CRAssetWallpaperData)initWithWallpaperIdentifier:(id)a3 displayID:(id)a4 layoutID:(id)a5;
- (NSString)description;
- (NSString)displayID;
- (NSString)identifier;
- (NSString)layoutID;
- (NSString)wallpaperID;
- (id)asDictionary;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRAssetWallpaperData

- (CRAssetWallpaperData)initWithWallpaperIdentifier:(id)a3 displayID:(id)a4 layoutID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRAssetWallpaperData;
  v11 = [(CRAssetWallpaperData *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    wallpaperID = v11->_wallpaperID;
    v11->_wallpaperID = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    displayID = v11->_displayID;
    v11->_displayID = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    layoutID = v11->_layoutID;
    v11->_layoutID = (NSString *)v16;
  }
  return v11;
}

- (NSString)identifier
{
  v3 = NSString;
  v4 = [(CRAssetWallpaperData *)self displayID];
  v5 = [(CRAssetWallpaperData *)self layoutID];
  v6 = [(CRAssetWallpaperData *)self wallpaperID];
  v7 = [v3 stringWithFormat:@"%@:%@:%@", v4, v5, v6];

  return (NSString *)v7;
}

- (CRAssetWallpaperData)initWithDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 objectForKey:@"displayIdentifier"];
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  objc_opt_class();
  id v7 = [v4 objectForKey:@"layoutIdentifier"];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  objc_opt_class();
  id v9 = [v4 objectForKey:@"wallpaperIdentifier"];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  v11 = 0;
  if (v6 && v8 && v10)
  {
    self = [(CRAssetWallpaperData *)self initWithWallpaperIdentifier:v10 displayID:v6 layoutID:v8];
    v11 = self;
  }

  return v11;
}

- (id)asDictionary
{
  v14[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CRAssetWallpaperData *)self displayID];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [(CRAssetWallpaperData *)self layoutID];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [(CRAssetWallpaperData *)self wallpaperID];

      if (v7)
      {
        v13[0] = @"displayIdentifier";
        id v8 = [(CRAssetWallpaperData *)self displayID];
        v14[0] = v8;
        v13[1] = @"layoutIdentifier";
        id v9 = [(CRAssetWallpaperData *)self layoutID];
        v14[1] = v9;
        v13[2] = @"wallpaperIdentifier";
        id v10 = [(CRAssetWallpaperData *)self wallpaperID];
        v14[2] = v10;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  id v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    [(CRSystemWallpaperData *)(uint64_t)self asDictionary];
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v6 = [(CRAssetWallpaperData *)self wallpaperID];
    id v7 = [v5 wallpaperID];
    if ([v6 isEqualToString:v7])
    {
      id v8 = [(CRAssetWallpaperData *)self displayID];
      id v9 = [v5 displayID];
      if ([v8 isEqualToString:v9])
      {
        id v10 = [(CRAssetWallpaperData *)self layoutID];
        v11 = [v5 layoutID];
        char v12 = [v10 isEqualToString:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CRAssetWallpaperData;
  id v4 = [(CRAssetWallpaperData *)&v8 description];
  id v5 = [(CRAssetWallpaperData *)self identifier];
  id v6 = [v3 stringWithFormat:@"%@ {identifier: %@}", v4, v5];

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  displayID = self->_displayID;
  id v5 = a3;
  [v5 encodeObject:displayID forKey:@"displayIdentifier"];
  [v5 encodeObject:self->_layoutID forKey:@"layoutIdentifier"];
  [v5 encodeObject:self->_wallpaperID forKey:@"wallpaperIdentifier"];
}

- (CRAssetWallpaperData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layoutIdentifier"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wallpaperIdentifier"];

  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || v7 == 0)
  {
    id v10 = 0;
  }
  else
  {
    self = [(CRAssetWallpaperData *)self initWithWallpaperIdentifier:v7 displayID:v5 layoutID:v6];
    id v10 = self;
  }

  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  displayID = self->_displayID;
  id v5 = a3;
  [v5 encodeObject:displayID forKey:@"displayIdentifier"];
  [v5 encodeObject:self->_layoutID forKey:@"layoutIdentifier"];
  [v5 encodeObject:self->_wallpaperID forKey:@"wallpaperIdentifier"];
}

- (CRAssetWallpaperData)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layoutIdentifier"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wallpaperIdentifier"];

  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || v7 == 0)
  {
    id v10 = 0;
  }
  else
  {
    self = [(CRAssetWallpaperData *)self initWithWallpaperIdentifier:v7 displayID:v5 layoutID:v6];
    id v10 = self;
  }

  return v10;
}

- (NSString)displayID
{
  return self->_displayID;
}

- (NSString)layoutID
{
  return self->_layoutID;
}

- (NSString)wallpaperID
{
  return self->_wallpaperID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperID, 0);
  objc_storeStrong((id *)&self->_layoutID, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
}

@end