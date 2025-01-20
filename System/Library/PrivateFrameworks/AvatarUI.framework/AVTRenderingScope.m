@interface AVTRenderingScope
+ (BOOL)supportsSecureCoding;
+ (double)extraMagnifyingFactorForFramingMode:(id)a3;
+ (double)thumbnailHeightRatioForFramingMode:(id)a3;
+ (double)widthForRenderingType:(int64_t)a3 options:(unint64_t)a4;
+ (id)funCamCarouselThumbnailScope;
+ (id)gridThumbnailScope;
+ (id)largeThumbnailScope;
+ (id)listControllerThumbnailScope;
+ (id)simplePickerThumbnailScope;
+ (id)thumbnailScope;
+ (unint64_t)scopeOptionsForEnvironment:(id)a3;
- (AVTAvatarPose)pose;
- (AVTRenderingScope)initWithCoder:(id)a3;
- (AVTRenderingScope)initWithRenderingType:(int64_t)a3 scale:(double)a4;
- (AVTRenderingScope)initWithRenderingType:(int64_t)a3 scale:(double)a4 options:(unint64_t)a5;
- (AVTRenderingScope)initWithRenderingType:(int64_t)a3 scale:(double)a4 options:(unint64_t)a5 framingMode:(id)a6 pose:(id)a7;
- (AVTRenderingScope)initWithRenderingType:(int64_t)a3 scale:(double)a4 options:(unint64_t)a5 framingMode:(id)a6 pose:(id)a7 size:(CGSize)a8;
- (AVTRenderingScope)initWithRenderingType:(int64_t)a3 scale:(double)a4 options:(unint64_t)a5 framingMode:(id)a6 pose:(id)a7 sizeModifier:(float)a8;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (NSString)framingMode;
- (double)scale;
- (float)sizeModifier;
- (id)adaptedFramingModeForObjectType:(int64_t)a3;
- (id)cacheableResourceAssociatedIdentifier;
- (id)copyApplyingPoseOverride:(id)a3;
- (id)copyWithFramingMode:(id)a3;
- (id)copyWithPose:(id)a3;
- (id)copyWithSize:(CGSize)a3 framingMode:(id)a4;
- (id)copyWithSizeModifier:(float)a3;
- (id)description;
- (id)framingModeIdentifier;
- (int64_t)renderingType;
- (unint64_t)cacheableResourceAssociatedCost;
- (unint64_t)hash;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVTRenderingScope

+ (double)widthForRenderingType:(int64_t)a3 options:(unint64_t)a4
{
  double result = 102.0;
  switch(a3)
  {
    case 'd':
      double result = 84.0;
      if ((a4 & 1) == 0) {
        double result = 114.0;
      }
      if ((a4 & 2) != 0) {
        return 83.0;
      }
      return result;
    case 'e':
      return result;
    case 'f':
      return 130.0;
    case 'g':
      return 52.0;
    default:
      if (a3 == 3)
      {
        BOOL v5 = (a4 & 1) == 0;
        v6 = (double *)&unk_20AFF2180;
        return v6[v5];
      }
      if (a3 == 2)
      {
        BOOL v5 = (a4 & 1) == 0;
        v6 = (double *)&unk_20AFF2190;
        return v6[v5];
      }
      return 166.0;
  }
}

- (AVTRenderingScope)initWithRenderingType:(int64_t)a3 scale:(double)a4 options:(unint64_t)a5 framingMode:(id)a6 pose:(id)a7
{
  LODWORD(v7) = 1.0;
  return [(AVTRenderingScope *)self initWithRenderingType:a3 scale:a5 options:a6 framingMode:a7 pose:a4 sizeModifier:v7];
}

- (id)cacheableResourceAssociatedIdentifier
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v4 = [(AVTRenderingScope *)self framingModeIdentifier];

  if (v4)
  {
    BOOL v5 = [(AVTRenderingScope *)self framingModeIdentifier];
    v6 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
    double v7 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v6];

    [v3 appendFormat:@"_%@", v7];
  }
  v8 = [(AVTRenderingScope *)self pose];

  if (v8)
  {
    v9 = [(AVTRenderingScope *)self pose];
    v10 = objc_msgSend(v9, "_avtui_identifier");

    [v3 appendFormat:@"_%@", v10];
  }
  unint64_t v11 = [(AVTRenderingScope *)self options];
  [(AVTRenderingScope *)self size];
  uint64_t v13 = v12;
  [(AVTRenderingScope *)self size];
  uint64_t v15 = v14;
  [(AVTRenderingScope *)self scale];
  objc_msgSend(v3, "appendFormat:", @"_e%0.2g_o%lu_%2.2fx%2.2fAt%2.2fx", 0x3FF0000000000000, v11, v13, v15, v16);
  v17 = (void *)[v3 copy];

  return v17;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

+ (id)gridThumbnailScope
{
  id v3 = +[AVTUIEnvironment defaultEnvironment];
  [v3 mainScreenScale];
  double v5 = v4;

  id v6 = objc_alloc((Class)a1);
  double v7 = +[AVTUIEnvironment defaultEnvironment];
  uint64_t v8 = [a1 scopeOptionsForEnvironment:v7];
  uint64_t v9 = *MEMORY[0x263F295F0];
  v10 = [MEMORY[0x263F29670] friendlyPose];
  unint64_t v11 = (void *)[v6 initWithRenderingType:3 scale:v8 options:v9 framingMode:v10 pose:v5];

  return v11;
}

- (AVTAvatarPose)pose
{
  return self->_pose;
}

- (unint64_t)cacheableResourceAssociatedCost
{
  [(AVTRenderingScope *)self size];
  double v4 = v3;
  [(AVTRenderingScope *)self size];
  return (unint64_t)(v4 * v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTRenderingScope)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"renderingType"];
  uint64_t v6 = [v5 integerValue];

  double v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scale"];
  [v7 doubleValue];
  double v9 = v8;

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"framingMode"];
  unint64_t v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
  uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"pose"];
  v17 = (void *)[objc_alloc(MEMORY[0x263F29670]) initWithDictionaryRepresentation:v16];
  [v4 decodeCGSizeForKey:@"size"];
  double v19 = v18;
  double v21 = v20;

  v22 = +[AVTUIEnvironment defaultEnvironment];
  v23 = -[AVTRenderingScope initWithRenderingType:scale:options:framingMode:pose:size:](self, "initWithRenderingType:scale:options:framingMode:pose:size:", v6, +[AVTRenderingScope scopeOptionsForEnvironment:](AVTRenderingScope, "scopeOptionsForEnvironment:", v22), v10, v17, v9, v19, v21);

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v12 = a3;
  double v5 = objc_msgSend(v4, "numberWithInt:", -[AVTRenderingScope renderingType](self, "renderingType"));
  [v12 encodeObject:v5 forKey:@"renderingType"];

  uint64_t v6 = NSNumber;
  [(AVTRenderingScope *)self scale];
  *(float *)&double v7 = v7;
  double v8 = [v6 numberWithFloat:v7];
  [v12 encodeObject:v8 forKey:@"scale"];

  double v9 = [(AVTRenderingScope *)self framingMode];
  [v12 encodeObject:v9 forKey:@"framingMode"];

  v10 = [(AVTRenderingScope *)self pose];
  unint64_t v11 = [v10 dictionaryRepresentation];
  [v12 encodeObject:v11 forKey:@"pose"];

  [(AVTRenderingScope *)self size];
  objc_msgSend(v12, "encodeCGSize:forKey:", @"size");
}

+ (id)thumbnailScope
{
  double v3 = +[AVTUIEnvironment defaultEnvironment];
  [v3 mainScreenScale];
  double v5 = v4;

  id v6 = objc_alloc((Class)a1);
  double v7 = +[AVTUIEnvironment defaultEnvironment];
  double v8 = objc_msgSend(v6, "initWithRenderingType:scale:options:", 1, objc_msgSend(a1, "scopeOptionsForEnvironment:", v7), v5);

  return v8;
}

+ (id)largeThumbnailScope
{
  double v3 = +[AVTUIEnvironment defaultEnvironment];
  [v3 mainScreenScale];
  double v5 = v4;

  id v6 = objc_alloc((Class)a1);
  double v7 = +[AVTUIEnvironment defaultEnvironment];
  double v8 = objc_msgSend(v6, "initWithRenderingType:scale:options:", 2, objc_msgSend(a1, "scopeOptionsForEnvironment:", v7), v5);

  return v8;
}

+ (id)listControllerThumbnailScope
{
  double v3 = +[AVTUIEnvironment defaultEnvironment];
  [v3 mainScreenScale];
  double v5 = v4;

  id v6 = [AVTRenderingScope alloc];
  double v7 = +[AVTUIEnvironment defaultEnvironment];
  uint64_t v8 = [a1 scopeOptionsForEnvironment:v7];
  uint64_t v9 = *MEMORY[0x263F295D8];
  v10 = [MEMORY[0x263F29670] friendlyPose];
  unint64_t v11 = [(AVTRenderingScope *)v6 initWithRenderingType:2 scale:v8 options:v9 framingMode:v10 pose:v5];

  return v11;
}

+ (id)funCamCarouselThumbnailScope
{
  double v3 = +[AVTUIEnvironment defaultEnvironment];
  [v3 mainScreenScale];
  double v5 = v4;

  id v6 = [AVTRenderingScope alloc];
  double v7 = +[AVTUIEnvironment defaultEnvironment];
  uint64_t v8 = [a1 scopeOptionsForEnvironment:v7];
  uint64_t v9 = *MEMORY[0x263F295E8];
  v10 = [MEMORY[0x263F29670] friendlyPose];
  unint64_t v11 = [(AVTRenderingScope *)v6 initWithRenderingType:102 scale:v8 options:v9 framingMode:v10 pose:v5];

  return v11;
}

+ (id)simplePickerThumbnailScope
{
  double v3 = +[AVTUIEnvironment defaultEnvironment];
  [v3 mainScreenScale];
  double v5 = v4;

  id v6 = [AVTRenderingScope alloc];
  double v7 = +[AVTUIEnvironment defaultEnvironment];
  uint64_t v8 = [a1 scopeOptionsForEnvironment:v7];
  uint64_t v9 = *MEMORY[0x263F295F0];
  v10 = [MEMORY[0x263F29670] friendlyPose];
  unint64_t v11 = [(AVTRenderingScope *)v6 initWithRenderingType:103 scale:v8 options:v9 framingMode:v10 pose:v5];

  return v11;
}

+ (unint64_t)scopeOptionsForEnvironment:(id)a3
{
  id v3 = a3;
  unint64_t v4 = ([v3 deviceIsPad] & 1) != 0 || objc_msgSend(v3, "deviceIsMac");
  [v3 mainScreenSize];
  if (v5 <= 375.0) {
    v4 |= 2uLL;
  }

  return v4;
}

+ (double)thumbnailHeightRatioForFramingMode:(id)a3
{
  id v3 = a3;
  double v4 = 1.2;
  if (([v3 isEqual:*MEMORY[0x263F295F8]] & 1) == 0
    && ([v3 isEqual:*MEMORY[0x263F29600]] & 1) == 0)
  {
    if ([v3 isEqual:*MEMORY[0x263F295E8]]) {
      double v4 = 1.31;
    }
    else {
      double v4 = 1.0;
    }
  }

  return v4;
}

+ (double)extraMagnifyingFactorForFramingMode:(id)a3
{
  int v3 = [a3 isEqual:*MEMORY[0x263F295E8]];
  double result = 1.2;
  if (!v3) {
    return 1.0;
  }
  return result;
}

- (AVTRenderingScope)initWithRenderingType:(int64_t)a3 scale:(double)a4
{
  return [(AVTRenderingScope *)self initWithRenderingType:a3 scale:0 options:a4];
}

- (AVTRenderingScope)initWithRenderingType:(int64_t)a3 scale:(double)a4 options:(unint64_t)a5
{
  return [(AVTRenderingScope *)self initWithRenderingType:a3 scale:a5 options:0 framingMode:0 pose:a4];
}

- (AVTRenderingScope)initWithRenderingType:(int64_t)a3 scale:(double)a4 options:(unint64_t)a5 framingMode:(id)a6 pose:(id)a7 sizeModifier:(float)a8
{
  id v14 = a7;
  id v15 = a6;
  [(id)objc_opt_class() widthForRenderingType:a3 options:a5];
  double v17 = v16;
  [(id)objc_opt_class() thumbnailHeightRatioForFramingMode:v15];
  double v19 = -[AVTRenderingScope initWithRenderingType:scale:options:framingMode:pose:size:](self, "initWithRenderingType:scale:options:framingMode:pose:size:", a3, a5, v15, v14, a4, v17 * a8, v17 * a8 * v18);

  return v19;
}

- (AVTRenderingScope)initWithRenderingType:(int64_t)a3 scale:(double)a4 options:(unint64_t)a5 framingMode:(id)a6 pose:(id)a7 size:(CGSize)a8
{
  CGFloat height = a8.height;
  CGFloat width = a8.width;
  id v15 = (NSString *)a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)AVTRenderingScope;
  double v17 = [(AVTRenderingScope *)&v20 init];
  double v18 = v17;
  if (v17)
  {
    v17->_scale = a4;
    v17->_framingMode = v15;
    v17->_renderingType = a3;
    v17->_options = a5;
    objc_storeStrong((id *)&v17->_pose, a7);
    v18->_size.CGFloat width = width;
    v18->_size.CGFloat height = height;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  double v5 = (AVTRenderingScope *)a3;
  if (v5 == self)
  {
    BOOL v11 = 1;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_22;
  }
  int64_t v6 = [(AVTRenderingScope *)self renderingType];
  if (v6 != [(AVTRenderingScope *)v5 renderingType]) {
    goto LABEL_22;
  }
  double v7 = [(AVTRenderingScope *)self framingMode];
  if (v7
    || ([(AVTRenderingScope *)v5 framingMode], (int v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v8 = [(AVTRenderingScope *)self framingMode];
    uint64_t v9 = [(AVTRenderingScope *)v5 framingMode];
    int v10 = [v8 isEqual:v9];

    if (v7)
    {

      if (!v10) {
        goto LABEL_22;
      }
    }
    else
    {

      if ((v10 & 1) == 0) {
        goto LABEL_22;
      }
    }
  }
  id v12 = [(AVTRenderingScope *)self pose];
  if (v12 || ([(AVTRenderingScope *)v5 pose], (int v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v13 = [(AVTRenderingScope *)self pose];
    id v14 = [(AVTRenderingScope *)v5 pose];
    int v15 = [v13 isEqual:v14];

    if (v12)
    {

      if (!v15) {
        goto LABEL_22;
      }
      goto LABEL_17;
    }

    if ((v15 & 1) == 0)
    {
LABEL_22:
      BOOL v11 = 0;
      goto LABEL_23;
    }
  }
LABEL_17:
  [(AVTRenderingScope *)self scale];
  double v17 = v16;
  [(AVTRenderingScope *)v5 scale];
  if (v17 != v18) {
    goto LABEL_22;
  }
  unint64_t v19 = [(AVTRenderingScope *)self options];
  if (v19 != [(AVTRenderingScope *)v5 options]) {
    goto LABEL_22;
  }
  [(AVTRenderingScope *)self size];
  double v21 = v20;
  double v23 = v22;
  [(AVTRenderingScope *)v5 size];
  BOOL v11 = v23 == v25 && v21 == v24;
LABEL_23:

  return v11;
}

- (unint64_t)hash
{
  *((void *)&v4 + 1) = [(AVTRenderingScope *)self options];
  *(void *)&long long v4 = [(AVTRenderingScope *)self options];
  uint64_t v3 = v4 >> 54;
  [(AVTRenderingScope *)self size];
  double v5 = NSStringFromCGSize(v19);
  [(AVTRenderingScope *)self size];
  int64_t v6 = NSStringFromCGSize(v20);
  *((void *)&v4 + 1) = v5;
  *(void *)&long long v4 = v6;
  uint64_t v7 = v4 >> 52;
  *((void *)&v4 + 1) = [(AVTRenderingScope *)self renderingType];
  *(void *)&long long v4 = [(AVTRenderingScope *)self renderingType];
  uint64_t v8 = v7 ^ v3 ^ (v4 >> 48);
  [(AVTRenderingScope *)self scale];
  unint64_t v10 = (unint64_t)v9;
  [(AVTRenderingScope *)self scale];
  *((void *)&v4 + 1) = v10;
  *(void *)&long long v4 = (unint64_t)v11;
  uint64_t v12 = v4 >> 43;
  uint64_t v13 = [(AVTRenderingScope *)self framingMode];
  uint64_t v14 = [v13 hash];
  int v15 = [(AVTRenderingScope *)self framingMode];
  *((void *)&v4 + 1) = v14;
  *(void *)&long long v4 = [v15 hash];
  double v16 = [(AVTRenderingScope *)self pose];
  unint64_t v17 = v8 ^ (v4 >> 32) ^ [v16 hash] ^ v12;

  return v17;
}

- (id)copyWithSize:(CGSize)a3 framingMode:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = objc_alloc((Class)objc_opt_class());
  int64_t v9 = [(AVTRenderingScope *)self renderingType];
  [(AVTRenderingScope *)self scale];
  double v11 = v10;
  unint64_t v12 = [(AVTRenderingScope *)self options];
  uint64_t v13 = [(AVTRenderingScope *)self pose];
  uint64_t v14 = objc_msgSend(v8, "initWithRenderingType:scale:options:framingMode:pose:size:", v9, v12, v7, v13, v11, width, height);

  return v14;
}

- (id)copyWithPose:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  int64_t v6 = [(AVTRenderingScope *)self renderingType];
  [(AVTRenderingScope *)self scale];
  double v8 = v7;
  unint64_t v9 = [(AVTRenderingScope *)self options];
  double v10 = [(AVTRenderingScope *)self framingMode];
  [(AVTRenderingScope *)self size];
  uint64_t v13 = objc_msgSend(v5, "initWithRenderingType:scale:options:framingMode:pose:size:", v6, v9, v10, v4, v8, v11, v12);

  return v13;
}

- (id)copyWithFramingMode:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  int64_t v6 = [(AVTRenderingScope *)self renderingType];
  [(AVTRenderingScope *)self scale];
  double v8 = v7;
  unint64_t v9 = [(AVTRenderingScope *)self options];
  double v10 = [(AVTRenderingScope *)self pose];
  double v11 = (void *)[v5 initWithRenderingType:v6 scale:v9 options:v4 framingMode:v10 pose:v8];

  return v11;
}

- (id)copyWithSizeModifier:(float)a3
{
  double v4 = a3;
  if (v4 > 1.0) {
    double v4 = 1.0;
  }
  if (v4 < 0.0) {
    double v4 = 0.0;
  }
  float v5 = v4;
  id v6 = objc_alloc((Class)objc_opt_class());
  int64_t v7 = [(AVTRenderingScope *)self renderingType];
  [(AVTRenderingScope *)self scale];
  double v9 = v8;
  unint64_t v10 = [(AVTRenderingScope *)self options];
  double v11 = [(AVTRenderingScope *)self framingMode];
  double v12 = [(AVTRenderingScope *)self pose];
  *(float *)&double v13 = v5;
  uint64_t v14 = (void *)[v6 initWithRenderingType:v7 scale:v10 options:v11 framingMode:v12 pose:v9 sizeModifier:v13];

  return v14;
}

- (id)copyApplyingPoseOverride:(id)a3
{
  id v4 = a3;
  float v5 = [(AVTRenderingScope *)self pose];
  if (v5)
  {
    id v6 = [(AVTRenderingScope *)self pose];
    id v7 = [v6 poseByMergingPose:v4];
  }
  else
  {
    id v7 = v4;
  }

  id v8 = objc_alloc((Class)objc_opt_class());
  int64_t v9 = [(AVTRenderingScope *)self renderingType];
  [(AVTRenderingScope *)self scale];
  double v11 = v10;
  unint64_t v12 = [(AVTRenderingScope *)self options];
  double v13 = [(AVTRenderingScope *)self framingMode];
  uint64_t v14 = (void *)[v8 initWithRenderingType:v9 scale:v12 options:v13 framingMode:v7 pose:v11];

  return v14;
}

- (id)adaptedFramingModeForObjectType:(int64_t)a3
{
  float v5 = [(AVTRenderingScope *)self framingMode];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F295F0]];

  if (a3 == 3 && v6)
  {
    id v7 = (id)*MEMORY[0x263F295D8];
  }
  else
  {
    id v7 = [(AVTRenderingScope *)self framingMode];
  }
  return v7;
}

- (id)framingModeIdentifier
{
  v2 = [(AVTRenderingScope *)self framingMode];
  uint64_t v3 = [v2 description];

  return v3;
}

- (id)description
{
  v16.receiver = self;
  v16.super_class = (Class)AVTRenderingScope;
  uint64_t v3 = [(AVTRenderingScope *)&v16 description];
  id v4 = (void *)[v3 mutableCopy];

  float v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[AVTRenderingScope renderingType](self, "renderingType"));
  [v4 appendFormat:@" type: %@", v5];

  [(AVTRenderingScope *)self size];
  int v6 = NSStringFromCGSize(v18);
  [v4 appendFormat:@" size: %@", v6];

  id v7 = NSNumber;
  [(AVTRenderingScope *)self scale];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  [v4 appendFormat:@" scale: %@", v8];

  int64_t v9 = [(AVTRenderingScope *)self framingMode];

  if (v9)
  {
    double v10 = [(AVTRenderingScope *)self framingMode];
    [v4 appendFormat:@" framingMode: %@", v10];
  }
  double v11 = [(AVTRenderingScope *)self pose];

  if (v11)
  {
    unint64_t v12 = [(AVTRenderingScope *)self pose];
    double v13 = objc_msgSend(v12, "_avtui_identifier");
    [v4 appendFormat:@" pose: %@", v13];
  }
  uint64_t v14 = (void *)[v4 copy];

  return v14;
}

- (NSString)framingMode
{
  return self->_framingMode;
}

- (float)sizeModifier
{
  return self->_sizeModifier;
}

- (int64_t)renderingType
{
  return self->_renderingType;
}

- (double)scale
{
  return self->_scale;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end