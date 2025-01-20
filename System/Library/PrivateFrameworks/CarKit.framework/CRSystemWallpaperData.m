@interface CRSystemWallpaperData
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CRSystemWallpaperData)initWithBSXPCCoder:(id)a3;
- (CRSystemWallpaperData)initWithCoder:(id)a3;
- (CRSystemWallpaperData)initWithDictionary:(id)a3;
- (CRSystemWallpaperData)initWithIdentifier:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (id)asDictionary;
- (void)asDictionary;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRSystemWallpaperData

- (CRSystemWallpaperData)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRSystemWallpaperData;
  v5 = [(CRSystemWallpaperData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (CRSystemWallpaperData)initWithDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKey:@"systemWallpaperIdentifier"];

  id v6 = v5;
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (v7)
  {
    self = [(CRSystemWallpaperData *)self initWithIdentifier:v7];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)asDictionary
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CRSystemWallpaperData *)self identifier];

  if (v3)
  {
    id v7 = @"systemWallpaperIdentifier";
    id v4 = [(CRSystemWallpaperData *)self identifier];
    v8[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    id v4 = CarGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      [(CRSystemWallpaperData *)(uint64_t)self asDictionary];
    }
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v6 = [(CRSystemWallpaperData *)self identifier];
    id v7 = [v5 identifier];
    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CRSystemWallpaperData;
  id v4 = [(CRSystemWallpaperData *)&v8 description];
  id v5 = [(CRSystemWallpaperData *)self identifier];
  id v6 = [v3 stringWithFormat:@"%@ {identifier: %@}", v4, v5];

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CRSystemWallpaperData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemWallpaperIdentifier"];

  if (v5)
  {
    self = [(CRSystemWallpaperData *)self initWithIdentifier:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
}

- (CRSystemWallpaperData)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemWallpaperIdentifier"];

  if (v5)
  {
    self = [(CRSystemWallpaperData *)self initWithIdentifier:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

- (void)asDictionary
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_FAULT, "Unable to serialize wallpaper: %@", (uint8_t *)&v2, 0xCu);
}

@end