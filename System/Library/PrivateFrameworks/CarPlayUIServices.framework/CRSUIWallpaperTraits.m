@interface CRSUIWallpaperTraits
+ (BOOL)supportsSecureCoding;
- (BOOL)hideRoundedCorners;
- (BOOL)iconLabelsRequireBackground;
- (BOOL)isBlack;
- (BOOL)supportsDashboardPlatterMaterials;
- (BOOL)supportsDynamicAppearance;
- (CRSUIWallpaperTraits)initWithCoder:(id)a3;
- (CRSUIWallpaperTraits)initWithSupportsDynamicAppearance:(BOOL)a3 supportsDashboardPlatterMaterials:(BOOL)a4 iconLabelsRequireBackground:(BOOL)a5 hideRoundedCorners:(BOOL)a6 black:(BOOL)a7;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRSUIWallpaperTraits

- (CRSUIWallpaperTraits)initWithSupportsDynamicAppearance:(BOOL)a3 supportsDashboardPlatterMaterials:(BOOL)a4 iconLabelsRequireBackground:(BOOL)a5 hideRoundedCorners:(BOOL)a6 black:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)CRSUIWallpaperTraits;
  result = [(CRSUIWallpaperTraits *)&v13 init];
  if (result)
  {
    result->_supportsDynamicAppearance = a3;
    result->_supportsDashboardPlatterMaterials = a4;
    result->_iconLabelsRequireBackground = a5;
    result->_hideRoundedCorners = a6;
    result->_black = a7;
  }
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[CRSUIWallpaperTraits supportsDynamicAppearance](self, "supportsDynamicAppearance"), @"supportsDynamicAppearance");
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[CRSUIWallpaperTraits supportsDashboardPlatterMaterials](self, "supportsDashboardPlatterMaterials"), @"supportsDashboardPlatterMaterials");
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[CRSUIWallpaperTraits iconLabelsRequireBackground](self, "iconLabelsRequireBackground"), @"iconLabelsRequireBackground");
  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[CRSUIWallpaperTraits hideRoundedCorners](self, "hideRoundedCorners"), @"hideRoundedCorners");
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[CRSUIWallpaperTraits isBlack](self, "isBlack"), @"black");
  v9 = [v3 build];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CRSUIWallpaperTraits supportsDynamicAppearance](self, "supportsDynamicAppearance"), @"supportsDynamicAppearance");
  objc_msgSend(v4, "encodeBool:forKey:", -[CRSUIWallpaperTraits supportsDashboardPlatterMaterials](self, "supportsDashboardPlatterMaterials"), @"supportsDashboardPlatterMaterials");
  objc_msgSend(v4, "encodeBool:forKey:", -[CRSUIWallpaperTraits iconLabelsRequireBackground](self, "iconLabelsRequireBackground"), @"iconLabelsRequireBackground");
  objc_msgSend(v4, "encodeBool:forKey:", -[CRSUIWallpaperTraits hideRoundedCorners](self, "hideRoundedCorners"), @"hideRoundedCorners");
  objc_msgSend(v4, "encodeBool:forKey:", -[CRSUIWallpaperTraits isBlack](self, "isBlack"), @"black");
}

- (CRSUIWallpaperTraits)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"supportsDynamicAppearance"];
  uint64_t v6 = [v4 decodeBoolForKey:@"supportsDashboardPlatterMaterials"];
  uint64_t v7 = [v4 decodeBoolForKey:@"iconLabelsRequireBackground"];
  uint64_t v8 = [v4 decodeBoolForKey:@"hideRoundedCorners"];
  uint64_t v9 = [v4 decodeBoolForKey:@"black"];

  return [(CRSUIWallpaperTraits *)self initWithSupportsDynamicAppearance:v5 supportsDashboardPlatterMaterials:v6 iconLabelsRequireBackground:v7 hideRoundedCorners:v8 black:v9];
}

- (BOOL)supportsDynamicAppearance
{
  return self->_supportsDynamicAppearance;
}

- (BOOL)supportsDashboardPlatterMaterials
{
  return self->_supportsDashboardPlatterMaterials;
}

- (BOOL)iconLabelsRequireBackground
{
  return self->_iconLabelsRequireBackground;
}

- (BOOL)hideRoundedCorners
{
  return self->_hideRoundedCorners;
}

- (BOOL)isBlack
{
  return self->_black;
}

@end