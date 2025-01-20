@interface MPMediaControlsConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsNowPlayingApplicationLaunch;
- (BOOL)isDonatingAppEligible;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldPreventAutorotation;
- (BOOL)sortByIsVideoRoute;
- (BOOL)useGenericDevicesIconInHeader;
- (CGRect)sourceRect;
- (MPMediaControlsConfiguration)initWithCoder:(id)a3;
- (NSArray)visibleMediaApps;
- (NSMutableArray)customRows;
- (NSString)donatingAppBundleID;
- (NSString)nowPlayingAppBundleID;
- (NSString)presentingAppBundleID;
- (NSString)routeUID;
- (NSString)routingContextUID;
- (double)preferredWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)presentingAppProcessIdentifier;
- (int64_t)initatorStyle;
- (int64_t)style;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsNowPlayingApplicationLaunch:(BOOL)a3;
- (void)setCustomRows:(id)a3;
- (void)setDonatingAppBundleID:(id)a3;
- (void)setDonatingAppEligible:(BOOL)a3;
- (void)setInitatorStyle:(int64_t)a3;
- (void)setNowPlayingAppBundleID:(id)a3;
- (void)setPreferredWidth:(double)a3;
- (void)setPresentingAppBundleID:(id)a3;
- (void)setPresentingAppProcessIdentifier:(int)a3;
- (void)setRouteUID:(id)a3;
- (void)setRoutingContextUID:(id)a3;
- (void)setShouldPreventAutorotation:(BOOL)a3;
- (void)setSortByIsVideoRoute:(BOOL)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setStyle:(int64_t)a3;
- (void)setUseGenericDevicesIconInHeader:(BOOL)a3;
- (void)setVisibleMediaApps:(id)a3;
@end

@implementation MPMediaControlsConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_storeStrong((id *)&self->_visibleMediaApps, 0);
  objc_storeStrong((id *)&self->_donatingAppBundleID, 0);
  objc_storeStrong((id *)&self->_nowPlayingAppBundleID, 0);
  objc_storeStrong((id *)&self->_presentingAppBundleID, 0);
  objc_storeStrong((id *)&self->_routingContextUID, 0);

  objc_storeStrong((id *)&self->_customRows, 0);
}

- (void)setRouteUID:(id)a3
{
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setUseGenericDevicesIconInHeader:(BOOL)a3
{
  self->_useGenericDevicesIconInHeader = a3;
}

- (BOOL)useGenericDevicesIconInHeader
{
  return self->_useGenericDevicesIconInHeader;
}

- (void)setSortByIsVideoRoute:(BOOL)a3
{
  self->_sortByIsVideoRoute = a3;
}

- (BOOL)sortByIsVideoRoute
{
  return self->_sortByIsVideoRoute;
}

- (void)setAllowsNowPlayingApplicationLaunch:(BOOL)a3
{
  self->_allowsNowPlayingApplicationLaunch = a3;
}

- (BOOL)allowsNowPlayingApplicationLaunch
{
  return self->_allowsNowPlayingApplicationLaunch;
}

- (void)setShouldPreventAutorotation:(BOOL)a3
{
  self->_shouldPreventAutorotation = a3;
}

- (BOOL)shouldPreventAutorotation
{
  return self->_shouldPreventAutorotation;
}

- (void)setPresentingAppProcessIdentifier:(int)a3
{
  self->_presentingAppProcessIdentifier = a3;
}

- (int)presentingAppProcessIdentifier
{
  return self->_presentingAppProcessIdentifier;
}

- (void)setVisibleMediaApps:(id)a3
{
}

- (NSArray)visibleMediaApps
{
  return self->_visibleMediaApps;
}

- (void)setDonatingAppEligible:(BOOL)a3
{
  self->_donatingAppEligible = a3;
}

- (BOOL)isDonatingAppEligible
{
  return self->_donatingAppEligible;
}

- (void)setDonatingAppBundleID:(id)a3
{
}

- (NSString)donatingAppBundleID
{
  return self->_donatingAppBundleID;
}

- (void)setNowPlayingAppBundleID:(id)a3
{
}

- (NSString)nowPlayingAppBundleID
{
  return self->_nowPlayingAppBundleID;
}

- (void)setPresentingAppBundleID:(id)a3
{
}

- (NSString)presentingAppBundleID
{
  return self->_presentingAppBundleID;
}

- (void)setRoutingContextUID:(id)a3
{
}

- (NSString)routingContextUID
{
  return self->_routingContextUID;
}

- (void)setInitatorStyle:(int64_t)a3
{
  self->_initatorStyle = a3;
}

- (int64_t)initatorStyle
{
  return self->_initatorStyle;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setCustomRows:(id)a3
{
}

- (NSMutableArray)customRows
{
  return self->_customRows;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  self->_initatorStyle = a3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MPMediaControlsConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v51) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(MPMediaControlsConfiguration *)v5 style];
      int64_t v7 = [(MPMediaControlsConfiguration *)self style];
      uint64_t v8 = [(MPMediaControlsConfiguration *)v5 initatorStyle];
      int64_t v9 = [(MPMediaControlsConfiguration *)self initatorStyle];
      v10 = [(MPMediaControlsConfiguration *)v5 routingContextUID];
      v11 = [(MPMediaControlsConfiguration *)self routingContextUID];
      int v12 = [v10 isEqualToString:v11];
      if (v6 == v7 && v8 == v9) {
        int v14 = v12;
      }
      else {
        int v14 = 0;
      }

      v15 = [(MPMediaControlsConfiguration *)v5 presentingAppBundleID];
      v16 = [(MPMediaControlsConfiguration *)self presentingAppBundleID];
      int v17 = [v15 isEqualToString:v16];

      v18 = [(MPMediaControlsConfiguration *)v5 nowPlayingAppBundleID];
      v19 = [(MPMediaControlsConfiguration *)self nowPlayingAppBundleID];
      int v20 = v17 & [v18 isEqualToString:v19];

      uint64_t v21 = [(MPMediaControlsConfiguration *)v5 donatingAppBundleID];
      v22 = [(MPMediaControlsConfiguration *)self donatingAppBundleID];
      int v23 = v14 & v20 & [(id)v21 isEqualToString:v22];

      LODWORD(v21) = [(MPMediaControlsConfiguration *)v5 isDonatingAppEligible];
      int v24 = v23 & ~(v21 ^ [(MPMediaControlsConfiguration *)self isDonatingAppEligible]);
      uint64_t v25 = [(MPMediaControlsConfiguration *)v5 visibleMediaApps];
      uint64_t v26 = [(MPMediaControlsConfiguration *)self visibleMediaApps];
      int v27 = v24 & [(id)v25 isEqualToArray:v26];

      LODWORD(v25) = [(MPMediaControlsConfiguration *)v5 allowsNowPlayingApplicationLaunch];
      LODWORD(v26) = v25 ^ [(MPMediaControlsConfiguration *)self allowsNowPlayingApplicationLaunch];
      LODWORD(v25) = [(MPMediaControlsConfiguration *)v5 sortByIsVideoRoute];
      LODWORD(v25) = v27 & ~(v26 | v25 ^ [(MPMediaControlsConfiguration *)self sortByIsVideoRoute]);
      [(MPMediaControlsConfiguration *)v5 sourceRect];
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      CGFloat v35 = v34;
      [(MPMediaControlsConfiguration *)self sourceRect];
      v54.origin.double x = v36;
      v54.origin.double y = v37;
      v54.size.double width = v38;
      v54.size.double height = v39;
      v53.origin.double x = v29;
      v53.origin.double y = v31;
      v53.size.double width = v33;
      v53.size.double height = v35;
      int v40 = v25 & CGRectEqualToRect(v53, v54);
      [(MPMediaControlsConfiguration *)v5 preferredWidth];
      double v42 = v41;
      [(MPMediaControlsConfiguration *)self preferredWidth];
      if (v42 == v43) {
        int v44 = v40;
      }
      else {
        int v44 = 0;
      }
      v45 = [(MPMediaControlsConfiguration *)v5 routeUID];
      v46 = [(MPMediaControlsConfiguration *)self routeUID];
      int v47 = [v45 isEqualToString:v46];

      uint64_t v48 = [(MPMediaControlsConfiguration *)v5 customRows];
      v49 = [(MPMediaControlsConfiguration *)self customRows];
      int v50 = v47 & [(id)v48 isEqualToArray:v49];

      LODWORD(v48) = [(MPMediaControlsConfiguration *)v5 useGenericDevicesIconInHeader];
      int v51 = v44 & v50 & (v48 ^ [(MPMediaControlsConfiguration *)self useGenericDevicesIconInHeader] ^ 1);
    }
    else
    {
      LOBYTE(v51) = 0;
    }
  }

  return v51;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MPMediaControlsConfiguration);
  v4->_style = self->_style;
  v4->_initatorStyle = self->_initatorStyle;
  objc_storeStrong((id *)&v4->_routingContextUID, self->_routingContextUID);
  objc_storeStrong((id *)&v4->_presentingAppBundleID, self->_presentingAppBundleID);
  objc_storeStrong((id *)&v4->_nowPlayingAppBundleID, self->_nowPlayingAppBundleID);
  objc_storeStrong((id *)&v4->_donatingAppBundleID, self->_donatingAppBundleID);
  v4->_donatingAppEligible = self->_donatingAppEligible;
  objc_storeStrong((id *)&v4->_visibleMediaApps, self->_visibleMediaApps);
  v4->_allowsNowPlayingApplicationLaunch = self->_allowsNowPlayingApplicationLaunch;
  v4->_sortByIsVideoRoute = self->_sortByIsVideoRoute;
  CGPoint origin = self->_sourceRect.origin;
  v4->_sourceRect.size = self->_sourceRect.size;
  v4->_sourceRect.CGPoint origin = origin;
  v4->_preferredWidth = self->_preferredWidth;
  objc_storeStrong((id *)&v4->_routeUID, self->_routeUID);
  objc_storeStrong((id *)&v4->_customRows, self->_customRows);
  v4->_presentingAppProcessIdentifier = self->_presentingAppProcessIdentifier;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style = self->_style;
  id v6 = a3;
  [v6 encodeInteger:style forKey:@"style"];
  [v6 encodeInteger:self->_initatorStyle forKey:@"initiatorStyle"];
  [v6 encodeObject:self->_routingContextUID forKey:@"routingContextUID"];
  [v6 encodeObject:self->_presentingAppBundleID forKey:@"presentingAppBundleID"];
  [v6 encodeObject:self->_nowPlayingAppBundleID forKey:@"nowPlayingAppBundleID"];
  [v6 encodeObject:self->_donatingAppBundleID forKey:@"donatingAppBundleID"];
  [v6 encodeBool:self->_donatingAppEligible forKey:@"donatingAppEligible"];
  [v6 encodeObject:self->_visibleMediaApps forKey:@"visibleMediaApps"];
  [v6 encodeBool:self->_allowsNowPlayingApplicationLaunch forKey:@"allowsNowPlayingApplicationLaunch"];
  [v6 encodeBool:self->_sortByIsVideoRoute forKey:@"sortByIsVideoRoute"];
  objc_msgSend(v6, "encodeCGRect:forKey:", @"sourceRect", self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
  double preferredWidth = self->_preferredWidth;
  *(float *)&double preferredWidth = preferredWidth;
  [v6 encodeFloat:@"preferredWidth" forKey:preferredWidth];
  [v6 encodeObject:self->_routeUID forKey:@"routeUID"];
  [v6 encodeObject:self->_customRows forKey:@"customRows"];
  [v6 encodeInt32:self->_presentingAppProcessIdentifier forKey:@"presentingAppProcessIdentifier"];
  [v6 encodeBool:self->_useGenericDevicesIconInHeader forKey:@"useGenericDevicesIconInHeader"];
}

- (MPMediaControlsConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MPMediaControlsConfiguration;
  v5 = [(MPMediaControlsConfiguration *)&v28 init];
  if (v5)
  {
    v5->_int64_t style = [v4 decodeIntegerForKey:@"style"];
    v5->_initatorStyle = [v4 decodeIntegerForKey:@"initiatorStyle"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routingContextUID"];
    routingContextUID = v5->_routingContextUID;
    v5->_routingContextUID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"presentingAppBundleID"];
    presentingAppBundleID = v5->_presentingAppBundleID;
    v5->_presentingAppBundleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nowPlayingAppBundleID"];
    nowPlayingAppBundleID = v5->_nowPlayingAppBundleID;
    v5->_nowPlayingAppBundleID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"donatingAppBundleID"];
    donatingAppBundleID = v5->_donatingAppBundleID;
    v5->_donatingAppBundleID = (NSString *)v12;

    v5->_donatingAppEligible = [v4 decodeBoolForKey:@"donatingAppEligible"];
    uint64_t v14 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"visibleMediaApps"];
    visibleMediaApps = v5->_visibleMediaApps;
    v5->_visibleMediaApps = (NSArray *)v14;

    v5->_allowsNowPlayingApplicationLaunch = [v4 decodeBoolForKey:@"allowsNowPlayingApplicationLaunch"];
    v5->_sortByIsVideoRoute = [v4 decodeBoolForKey:@"sortByIsVideoRoute"];
    [v4 decodeCGRectForKey:@"sourceRect"];
    v5->_sourceRect.origin.double x = v16;
    v5->_sourceRect.origin.double y = v17;
    v5->_sourceRect.size.double width = v18;
    v5->_sourceRect.size.double height = v19;
    [v4 decodeFloatForKey:@"preferredWidth"];
    v5->_double preferredWidth = v20;
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routeUID"];
    routeUID = v5->_routeUID;
    v5->_routeUID = (NSString *)v21;

    int v23 = (void *)MEMORY[0x1E4F1CA48];
    int v24 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"customRows"];
    uint64_t v25 = [v23 arrayWithArray:v24];
    customRows = v5->_customRows;
    v5->_customRows = (NSMutableArray *)v25;

    v5->_presentingAppProcessIdentifier = [v4 decodeInt32ForKey:@"presentingAppProcessIdentifier"];
    v5->_useGenericDevicesIconInHeader = [v4 decodeBoolForKey:@"useGenericDevicesIconInHeader"];
  }

  return v5;
}

- (id)description
{
  unint64_t v3 = [(MPMediaControlsConfiguration *)self style];
  if (v3 > 8) {
    id v4 = 0;
  }
  else {
    id v4 = off_1E57EDA10[v3];
  }
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  int64_t v7 = [(MPMediaControlsConfiguration *)self routingContextUID];
  presentingAppBundleID = self->_presentingAppBundleID;
  int64_t v9 = NSStringFromCGRect(self->_sourceRect);
  uint64_t v10 = [v5 stringWithFormat:@"<%@:%p routingContextUID=%@, style=%@, presentingAppBundleID=%@, sourcRect=%@, preferredWidth=%f>", v6, self, v7, v4, presentingAppBundleID, v9, *(void *)&self->_preferredWidth];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end