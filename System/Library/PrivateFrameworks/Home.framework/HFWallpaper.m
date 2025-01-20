@interface HFWallpaper
+ (CGSize)contentSizeForWallpaper;
+ (CGSize)size;
+ (id)customWallpaperWithAssetIdentifier:(id)a3;
- (BOOL)isCustomType;
- (BOOL)isEqual:(id)a3;
- (HFCroppedWallpaperInfo)cropInfo;
- (HFWallpaper)initWithDictionary:(id)a3;
- (HFWallpaper)initWithType:(int64_t)a3 assetIdentifier:(id)a4 cropInfo:(id)a5;
- (HFWallpaper)lastUserSelectedWallpaper;
- (NSString)assetIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sliceIdentifierForVariant:(int64_t)a3;
- (id)wallpaperIdentifier;
- (int64_t)type;
- (void)setCropInfo:(id)a3;
- (void)setIsCustomType:(BOOL)a3;
- (void)setLastUserSelectedWallpaper:(id)a3;
@end

@implementation HFWallpaper

- (HFWallpaper)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"Type"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSLog(&cfstr_WallpaperTypeM.isa, v5);
    goto LABEL_10;
  }
  unint64_t v6 = [v5 integerValue];
  if (v6 > 6)
  {
LABEL_10:
    v13 = 0;
    goto LABEL_19;
  }
  unint64_t v7 = v6;
  v8 = [v4 objectForKeyedSubscript:@"Identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v4 objectForKeyedSubscript:@"AllCropInfo"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      NSLog(&cfstr_WallpaperCropI.isa, v9);
      v12 = 0;
    }
    else
    {
      +[HFWallpaper size];
      v10 = NSStringFromCGSize(v18);
      v11 = [v9 objectForKeyedSubscript:v10];

      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        v12 = [[HFCroppedWallpaperInfo alloc] initWithDictionary:v11];
      }
      else {
        v12 = 0;
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"LastUserSelectedWallpaper"];
    if (v14)
    {
      v15 = [[HFWallpaper alloc] initWithDictionary:v14];
      lastUserSelectedWallpaper = self->_lastUserSelectedWallpaper;
      self->_lastUserSelectedWallpaper = v15;
    }
    self = [(HFWallpaper *)self initWithType:v7 assetIdentifier:v8 cropInfo:v12];

    v13 = self;
  }
  else
  {
    NSLog(&cfstr_WallpaperIdent.isa, v8);
    v13 = 0;
  }

LABEL_19:
  return v13;
}

- (HFWallpaper)initWithType:(int64_t)a3 assetIdentifier:(id)a4 cropInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HFWallpaper;
  v10 = [(HFWallpaper *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    uint64_t v12 = [v9 copy];
    cropInfo = v11->_cropInfo;
    v11->_cropInfo = (HFCroppedWallpaperInfo *)v12;

    if (qword_26AB2FA78 != -1) {
      dispatch_once(&qword_26AB2FA78, &__block_literal_global_182);
    }
    uint64_t v14 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:_MergedGlobals_295];
    assetIdentifier = v11->_assetIdentifier;
    v11->_assetIdentifier = (NSString *)v14;
  }
  return v11;
}

+ (CGSize)size
{
  v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (id)sliceIdentifierForVariant:(int64_t)a3
{
  double v4 = NSString;
  double v5 = [(HFWallpaper *)self wallpaperIdentifier];
  double v6 = [NSNumber numberWithInteger:a3];
  double v7 = [v4 stringWithFormat:@"%@_%@", v5, v6];

  return v7;
}

- (id)wallpaperIdentifier
{
  double v3 = [(HFWallpaper *)self cropInfo];

  if (v3)
  {
    double v4 = NSString;
    double v5 = [(HFWallpaper *)self assetIdentifier];
    double v6 = [(HFWallpaper *)self cropInfo];
    [v6 center];
    double v7 = NSStringFromCGPoint(v15);
    double v8 = NSNumber;
    id v9 = [(HFWallpaper *)self cropInfo];
    [v9 scale];
    v10 = objc_msgSend(v8, "numberWithDouble:");
    v11 = [v10 stringValue];
    uint64_t v12 = [v4 stringWithFormat:@"%@_%@_%@", v5, v7, v11];
  }
  else
  {
    uint64_t v12 = [(HFWallpaper *)self assetIdentifier];
  }
  return v12;
}

- (HFCroppedWallpaperInfo)cropInfo
{
  return self->_cropInfo;
}

void __53__HFWallpaper_initWithType_assetIdentifier_cropInfo___block_invoke()
{
  id v2 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"|/\\<>*?\""];
  uint64_t v0 = [v2 invertedSet];
  v1 = (void *)_MergedGlobals_295;
  _MergedGlobals_295 = v0;
}

+ (CGSize)contentSizeForWallpaper
{
  id v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v7 userInterfaceIdiom] == 1)
  {
    BOOL v8 = +[HFUtilities isAMac];

    if (v4 >= v6) {
      double v9 = v4;
    }
    else {
      double v9 = v6;
    }
    if (!v8)
    {
      double v4 = v9;
      double v6 = v9;
    }
  }
  else
  {
  }
  double v10 = v4;
  double v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (id)customWallpaperWithAssetIdentifier:(id)a3
{
  id v3 = a3;
  double v4 = [[HFWallpaper alloc] initWithType:1 assetIdentifier:v3 cropInfo:0];

  return v4;
}

- (id)description
{
  unint64_t v3 = [(HFWallpaper *)self type];
  if (v3 > 6) {
    double v4 = 0;
  }
  else {
    double v4 = off_264099350[v3];
  }
  double v5 = NSString;
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  BOOL v8 = [(HFWallpaper *)self assetIdentifier];
  double v9 = [(HFWallpaper *)self cropInfo];
  double v10 = [v5 stringWithFormat:@"<%@: %p, type = %@, assetIdentifier = %@, crop info = [ %@ ]>", v7, self, v4, v8, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (HFWallpaper *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int64_t v5 = [(HFWallpaper *)self type], v5 == [(HFWallpaper *)v4 type]))
    {
      double v6 = [(HFWallpaper *)self wallpaperIdentifier];
      double v7 = [(HFWallpaper *)v4 wallpaperIdentifier];
      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = [HFWallpaper alloc];
  int64_t v5 = [(HFWallpaper *)self type];
  double v6 = [(HFWallpaper *)self assetIdentifier];
  double v7 = [(HFWallpaper *)self cropInfo];
  char v8 = [(HFWallpaper *)v4 initWithType:v5 assetIdentifier:v6 cropInfo:v7];

  return v8;
}

- (id)dictionaryRepresentation
{
  v20[2] = *MEMORY[0x263EF8340];
  unint64_t v3 = (void *)MEMORY[0x263EFF9A0];
  v19[0] = @"Type";
  double v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HFWallpaper type](self, "type"));
  v19[1] = @"Identifier";
  v20[0] = v4;
  int64_t v5 = [(HFWallpaper *)self assetIdentifier];
  v20[1] = v5;
  double v6 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  double v7 = [v3 dictionaryWithDictionary:v6];

  char v8 = [(HFWallpaper *)self cropInfo];

  if (v8)
  {
    +[HFWallpaper size];
    double v9 = NSStringFromCGSize(v22);
    objc_super v17 = v9;
    double v10 = [(HFWallpaper *)self cropInfo];
    double v11 = [v10 dictionaryRepresentation];
    CGSize v18 = v11;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    [v7 setObject:v12 forKeyedSubscript:@"AllCropInfo"];
  }
  v13 = [(HFWallpaper *)self lastUserSelectedWallpaper];

  if (v13)
  {
    uint64_t v14 = [(HFWallpaper *)self lastUserSelectedWallpaper];
    CGPoint v15 = [v14 dictionaryRepresentation];
    [v7 setObject:v15 forKeyedSubscript:@"LastUserSelectedWallpaper"];
  }
  return v7;
}

- (BOOL)isCustomType
{
  int64_t v3 = [(HFWallpaper *)self type];
  if (v3 != 1) {
    LOBYTE(v3) = [(HFWallpaper *)self type] == 6;
  }
  return v3;
}

- (void)setIsCustomType:(BOOL)a3
{
  self->_isCustomType = a3;
}

- (void)setCropInfo:(id)a3
{
}

- (HFWallpaper)lastUserSelectedWallpaper
{
  return self->_lastUserSelectedWallpaper;
}

- (void)setLastUserSelectedWallpaper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUserSelectedWallpaper, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_cropInfo, 0);
}

@end