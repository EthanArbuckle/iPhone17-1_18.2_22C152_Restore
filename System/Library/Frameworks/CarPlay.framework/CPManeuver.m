@interface CPManeuver
+ (BOOL)supportsSecureCoding;
+ (NSArray)accNavParameters;
+ (NSDictionary)accNavParameterKeysIndexed;
+ (NSDictionary)accNavParametersIndexed;
+ (id)_descriptionForJunctionType:(unint64_t)a3;
+ (id)_descriptionForManeuverType:(unint64_t)a3;
+ (id)_descriptionForTrafficSide:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (CPImageSet)dashboardJunctionImageSet;
- (CPImageSet)dashboardSymbolImageSet;
- (CPImageSet)junctionImageSet;
- (CPImageSet)notificationSymbolImageSet;
- (CPImageSet)symbolSet;
- (CPLaneGuidance)linkedLaneGuidance;
- (CPManeuver)init;
- (CPManeuver)initWithCoder:(id)a3;
- (CPManeuver)maneuverWithComponent:(id)a3;
- (CPTravelEstimates)initialTravelEstimates;
- (NSArray)attributedInstructionVariants;
- (NSArray)dashboardAttributedInstructionVariants;
- (NSArray)dashboardInstructionVariants;
- (NSArray)instructionVariants;
- (NSArray)notificationAttributedInstructionVariants;
- (NSArray)notificationInstructionVariants;
- (NSArray)roadFollowingManeuverVariants;
- (NSArray)stringInstructionVariants;
- (NSMeasurement)initialDistance;
- (NSMeasurement)initialDistanceDisplay;
- (NSMeasurement)junctionExitAngle;
- (NSSet)junctionElementAngles;
- (NSString)description;
- (NSString)highwayExitLabel;
- (NSUUID)identifier;
- (UIColor)cardBackgroundColor;
- (UIImage)dashboardJunctionImage;
- (UIImage)dashboardSymbolImage;
- (UIImage)junctionImage;
- (UIImage)notificationSymbolImage;
- (UIImage)symbolImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)userInfo;
- (int64_t)displayStyle;
- (unint64_t)junctionType;
- (unint64_t)maneuverType;
- (unint64_t)trafficSide;
- (unsigned)componentID;
- (unsigned)index;
- (unsigned)linkedLaneGuidanceIndex;
- (void)clearValueForKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributedInstructionVariants:(NSArray *)attributedInstructionVariants;
- (void)setCardBackgroundColor:(UIColor *)cardBackgroundColor;
- (void)setComponentID:(unsigned __int16)a3;
- (void)setDashboardAttributedInstructionVariants:(NSArray *)dashboardAttributedInstructionVariants;
- (void)setDashboardInstructionVariants:(NSArray *)dashboardInstructionVariants;
- (void)setDashboardJunctionImage:(UIImage *)dashboardJunctionImage;
- (void)setDashboardJunctionImageSet:(id)a3;
- (void)setDashboardSymbolImage:(UIImage *)dashboardSymbolImage;
- (void)setDashboardSymbolImageSet:(id)a3;
- (void)setDisplayStyle:(int64_t)a3;
- (void)setHighwayExitLabel:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIndex:(unsigned __int16)a3;
- (void)setInitialDistance:(id)a3;
- (void)setInitialDistanceDisplay:(id)a3;
- (void)setInitialTravelEstimates:(CPTravelEstimates *)initialTravelEstimates;
- (void)setInstructionVariants:(NSArray *)instructionVariants;
- (void)setJunctionElementAngles:(id)a3;
- (void)setJunctionExitAngle:(id)a3;
- (void)setJunctionImage:(UIImage *)junctionImage;
- (void)setJunctionImageSet:(id)a3;
- (void)setJunctionType:(unint64_t)a3;
- (void)setLinkedLaneGuidance:(id)a3;
- (void)setLinkedLaneGuidanceIndex:(unsigned __int16)a3;
- (void)setManeuverType:(unint64_t)a3;
- (void)setNotificationAttributedInstructionVariants:(NSArray *)notificationAttributedInstructionVariants;
- (void)setNotificationInstructionVariants:(NSArray *)notificationInstructionVariants;
- (void)setNotificationSymbolImage:(UIImage *)notificationSymbolImage;
- (void)setNotificationSymbolImageSet:(id)a3;
- (void)setRoadFollowingManeuverVariants:(id)a3;
- (void)setStringInstructionVariants:(id)a3;
- (void)setSymbolImage:(UIImage *)symbolImage;
- (void)setSymbolSet:(CPImageSet *)symbolSet;
- (void)setTrafficSide:(unint64_t)a3;
- (void)setUserInfo:(id)userInfo;
@end

@implementation CPManeuver

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPManeuver)init
{
  v7.receiver = self;
  v7.super_class = (Class)CPManeuver;
  v2 = [(CPManeuver *)&v7 init];
  if (v2)
  {
    +[CPAccNavUpdate resetUpdate:v2];
    uint64_t v3 = [MEMORY[0x263F08C38] UUID];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

    instructionVariants = v2->_instructionVariants;
    v2->_instructionVariants = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v2;
}

- (CPManeuver)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPManeuver *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPManeuverCardBackgroundColorKey"];
    objc_super v7 = v6;
    if (v6)
    {
      uint64_t v8 = CPSanitizedBackgroundColor(v6);
      cardBackgroundColor = v5->_cardBackgroundColor;
      v5->_cardBackgroundColor = (UIColor *)v8;
    }
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPManeuverSymbolKey"];
    symbolSet = v5->_symbolSet;
    v5->_symbolSet = (CPImageSet *)v12;

    v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"kCPManeuverAttributedInstructionVariantsKey"];
    attributedInstructionVariants = v5->_attributedInstructionVariants;
    v5->_attributedInstructionVariants = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPManeuverInitialTravelEstimatesKey"];
    initialTravelEstimates = v5->_initialTravelEstimates;
    v5->_initialTravelEstimates = (CPTravelEstimates *)v20;

    v5->_displayStyle = [v4 decodeIntegerForKey:@"kCPManeuverStyleKey"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPManeuverJunctionImageKey"];
    junctionImageSet = v5->_junctionImageSet;
    v5->_junctionImageSet = (CPImageSet *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPManeuverDashboardSymbolKey"];
    dashboardSymbolImageSet = v5->_dashboardSymbolImageSet;
    v5->_dashboardSymbolImageSet = (CPImageSet *)v24;

    v26 = (void *)MEMORY[0x263EFFA08];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"kCPManeuverDashboardInstructionVariantsKey"];
    dashboardInstructionVariants = v5->_dashboardInstructionVariants;
    v5->_dashboardInstructionVariants = (NSArray *)v29;

    v31 = (void *)MEMORY[0x263EFFA08];
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"kCPManeuverDashboardAttributedInstructionVariantsKey"];
    dashboardAttributedInstructionVariants = v5->_dashboardAttributedInstructionVariants;
    v5->_dashboardAttributedInstructionVariants = (NSArray *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPManeuverDashboardJunctionImageKey"];
    dashboardJunctionImageSet = v5->_dashboardJunctionImageSet;
    v5->_dashboardJunctionImageSet = (CPImageSet *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPManeuverNotificationSymbolKey"];
    notificationSymbolImageSet = v5->_notificationSymbolImageSet;
    v5->_notificationSymbolImageSet = (CPImageSet *)v39;

    v41 = (void *)MEMORY[0x263EFFA08];
    uint64_t v42 = objc_opt_class();
    v43 = objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
    uint64_t v44 = [v4 decodeObjectOfClasses:v43 forKey:@"kCPManeuverNotificationInstructionVariantsKey"];
    notificationInstructionVariants = v5->_notificationInstructionVariants;
    v5->_notificationInstructionVariants = (NSArray *)v44;

    v46 = (void *)MEMORY[0x263EFFA08];
    uint64_t v47 = objc_opt_class();
    uint64_t v48 = objc_opt_class();
    v49 = objc_msgSend(v46, "setWithObjects:", v47, v48, objc_opt_class(), 0);
    uint64_t v50 = [v4 decodeObjectOfClasses:v49 forKey:@"kCPManeuverNotificationAttributedInstructionVariantsKey"];
    notificationAttributedInstructionVariants = v5->_notificationAttributedInstructionVariants;
    v5->_notificationAttributedInstructionVariants = (NSArray *)v50;

    +[CPAccNavUpdate decodeUpdate:v5 withCoder:v4];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  id v4 = [(CPManeuver *)self cardBackgroundColor];
  [v17 encodeObject:v4 forKey:@"kCPManeuverCardBackgroundColorKey"];

  v5 = [(CPManeuver *)self identifier];
  [v17 encodeObject:v5 forKey:@"kCPIdentifierKey"];

  v6 = [(CPManeuver *)self symbolSet];
  [v17 encodeObject:v6 forKey:@"kCPManeuverSymbolKey"];

  objc_super v7 = [(CPManeuver *)self attributedInstructionVariants];
  [v17 encodeObject:v7 forKey:@"kCPManeuverAttributedInstructionVariantsKey"];

  uint64_t v8 = [(CPManeuver *)self initialTravelEstimates];
  [v17 encodeObject:v8 forKey:@"kCPManeuverInitialTravelEstimatesKey"];

  objc_msgSend(v17, "encodeInteger:forKey:", -[CPManeuver displayStyle](self, "displayStyle"), @"kCPManeuverStyleKey");
  v9 = [(CPManeuver *)self junctionImageSet];
  [v17 encodeObject:v9 forKey:@"kCPManeuverJunctionImageKey"];

  uint64_t v10 = [(CPManeuver *)self dashboardSymbolImageSet];
  [v17 encodeObject:v10 forKey:@"kCPManeuverDashboardSymbolKey"];

  v11 = [(CPManeuver *)self dashboardInstructionVariants];
  [v17 encodeObject:v11 forKey:@"kCPManeuverDashboardInstructionVariantsKey"];

  uint64_t v12 = [(CPManeuver *)self dashboardAttributedInstructionVariants];
  [v17 encodeObject:v12 forKey:@"kCPManeuverDashboardAttributedInstructionVariantsKey"];

  v13 = [(CPManeuver *)self dashboardJunctionImageSet];
  [v17 encodeObject:v13 forKey:@"kCPManeuverDashboardJunctionImageKey"];

  v14 = [(CPManeuver *)self notificationSymbolImageSet];
  [v17 encodeObject:v14 forKey:@"kCPManeuverNotificationSymbolKey"];

  uint64_t v15 = [(CPManeuver *)self notificationInstructionVariants];
  [v17 encodeObject:v15 forKey:@"kCPManeuverNotificationInstructionVariantsKey"];

  uint64_t v16 = [(CPManeuver *)self notificationAttributedInstructionVariants];
  [v17 encodeObject:v16 forKey:@"kCPManeuverNotificationAttributedInstructionVariantsKey"];

  +[CPAccNavUpdate encodeUpdate:self withCoder:v17];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CPAccNavUpdate copyUpdate:self];
  uint64_t v5 = [(CPManeuver *)self identifier];
  v6 = (void *)v4[2];
  v4[2] = v5;

  objc_super v7 = [(CPManeuver *)self symbolSet];
  [v4 setSymbolSet:v7];

  uint64_t v8 = [(CPManeuver *)self junctionImageSet];
  [v4 setJunctionImageSet:v8];

  v9 = [(CPManeuver *)self attributedInstructionVariants];
  [v4 setAttributedInstructionVariants:v9];

  uint64_t v10 = [(CPManeuver *)self initialTravelEstimates];
  [v4 setInitialTravelEstimates:v10];

  objc_msgSend(v4, "setDisplayStyle:", -[CPManeuver displayStyle](self, "displayStyle"));
  v11 = [(CPManeuver *)self dashboardSymbolImageSet];
  [v4 setDashboardSymbolImageSet:v11];

  uint64_t v12 = [(CPManeuver *)self dashboardInstructionVariants];
  [v4 setDashboardInstructionVariants:v12];

  v13 = [(CPManeuver *)self dashboardAttributedInstructionVariants];
  [v4 setDashboardAttributedInstructionVariants:v13];

  v14 = [(CPManeuver *)self dashboardJunctionImageSet];
  [v4 setDashboardJunctionImageSet:v14];

  uint64_t v15 = [(CPManeuver *)self notificationSymbolImageSet];
  [v4 setNotificationSymbolImageSet:v15];

  uint64_t v16 = [(CPManeuver *)self notificationInstructionVariants];
  [v4 setNotificationInstructionVariants:v16];

  id v17 = [(CPManeuver *)self notificationAttributedInstructionVariants];
  [v4 setNotificationAttributedInstructionVariants:v17];

  uint64_t v18 = [(CPManeuver *)self cardBackgroundColor];
  [v4 setCardBackgroundColor:v18];

  return v4;
}

- (NSArray)stringInstructionVariants
{
  uint64_t v3 = [(CPManeuver *)self attributedInstructionVariants];

  if (v3)
  {
    id v4 = [(CPManeuver *)self attributedInstructionVariants];
    uint64_t v5 = objc_msgSend(v4, "cps_map:", &__block_literal_global_11);
  }
  else
  {
    uint64_t v5 = [(CPManeuver *)self instructionVariants];
  }

  return (NSArray *)v5;
}

uint64_t __39__CPManeuver_stringInstructionVariants__block_invoke(uint64_t a1, void *a2)
{
  return [a2 string];
}

- (NSString)description
{
  uint64_t v20 = NSString;
  v21.receiver = self;
  v21.super_class = (Class)CPManeuver;
  uint64_t v3 = [(CPManeuver *)&v21 description];
  identifier = self->_identifier;
  v19 = (void *)v3;
  id v4 = [(id)objc_opt_class() _descriptionForManeuverType:self->_maneuverType];
  symbolSet = self->_symbolSet;
  initialTravelEstimates = self->_initialTravelEstimates;
  attributedInstructionVariants = self->_attributedInstructionVariants;
  junctionImageSet = self->_junctionImageSet;
  roadFollowingManeuverVariants = self->_roadFollowingManeuverVariants;
  instructionVariants = self->_instructionVariants;
  uint64_t v8 = [(id)objc_opt_class() _descriptionForTrafficSide:self->_trafficSide];
  v9 = [(id)objc_opt_class() _descriptionForJunctionType:self->_junctionType];
  junctionExitAngle = self->_junctionExitAngle;
  junctionElementAngles = self->_junctionElementAngles;
  uint64_t v12 = +[CPAccNavUpdate description:self];
  v13 = [v20 stringWithFormat:@"%@ {identifier: %@, maneuverType: %@, symbol: %@, junction image: %@, instructionVariants: %@, attributedInstructionVariants: %@, roadFollowingManeuverVariants:%@, initialTravelEstimates: %@, trafficSide: %@, junctionType: %@, junctionExitAngle: %@, junctionElementAngles: %@, cardBackgroundColor: %@}\n{\n%@\n}", v19, identifier, v4, symbolSet, junctionImageSet, instructionVariants, attributedInstructionVariants, roadFollowingManeuverVariants, initialTravelEstimates, v8, v9, junctionExitAngle, junctionElementAngles, v12, self->_cardBackgroundColor];

  return (NSString *)v13;
}

+ (id)_descriptionForManeuverType:(unint64_t)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return off_26430AA68[a3];
  }
}

+ (id)_descriptionForTrafficSide:(unint64_t)a3
{
  uint64_t v3 = @"right";
  if (a3) {
    uint64_t v3 = 0;
  }
  if (a3 == 1) {
    return @"left";
  }
  else {
    return v3;
  }
}

+ (id)_descriptionForJunctionType:(unint64_t)a3
{
  uint64_t v3 = @"intersection";
  if (a3) {
    uint64_t v3 = 0;
  }
  if (a3 == 1) {
    return @"roundabout";
  }
  else {
    return v3;
  }
}

- (void)setCardBackgroundColor:(UIColor *)cardBackgroundColor
{
  if (self->_cardBackgroundColor != cardBackgroundColor)
  {
    CPSanitizedBackgroundColor(cardBackgroundColor);
    self->_cardBackgroundColor = (UIColor *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x270F9A758]();
  }
}

- (void)setSymbolSet:(CPImageSet *)symbolSet
{
  id v4 = symbolSet;
  [(CPImageSet *)v4 swapStyles];
  uint64_t v5 = self->_symbolSet;
  self->_symbolSet = v4;
}

- (void)setSymbolImage:(UIImage *)symbolImage
{
  v6 = symbolImage;
  if (v6)
  {
    id v4 = [[CPImageSet alloc] initWithImage:v6];
    symbolSet = self->_symbolSet;
    self->_symbolSet = v4;
  }
  else
  {
    symbolSet = self->_symbolSet;
    self->_symbolSet = 0;
  }
}

- (UIImage)symbolImage
{
  v2 = [(CPManeuver *)self symbolSet];
  uint64_t v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setJunctionImage:(UIImage *)junctionImage
{
  v6 = junctionImage;
  if (v6)
  {
    id v4 = [[CPImageSet alloc] initWithImage:v6];
    junctionImageSet = self->_junctionImageSet;
    self->_junctionImageSet = v4;
  }
  else
  {
    junctionImageSet = self->_junctionImageSet;
    self->_junctionImageSet = 0;
  }
}

- (UIImage)junctionImage
{
  v2 = [(CPManeuver *)self junctionImageSet];
  uint64_t v3 = [v2 image];

  return (UIImage *)v3;
}

- (UIImage)dashboardSymbolImage
{
  v2 = [(CPManeuver *)self dashboardSymbolImageSet];
  uint64_t v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setDashboardSymbolImage:(UIImage *)dashboardSymbolImage
{
  v6 = dashboardSymbolImage;
  if (v6)
  {
    id v4 = [[CPImageSet alloc] initWithImage:v6];
    dashboardSymbolImageSet = self->_dashboardSymbolImageSet;
    self->_dashboardSymbolImageSet = v4;
  }
  else
  {
    dashboardSymbolImageSet = self->_dashboardSymbolImageSet;
    self->_dashboardSymbolImageSet = 0;
  }
}

- (UIImage)dashboardJunctionImage
{
  v2 = [(CPManeuver *)self dashboardJunctionImageSet];
  uint64_t v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setDashboardJunctionImage:(UIImage *)dashboardJunctionImage
{
  v6 = dashboardJunctionImage;
  if (v6)
  {
    id v4 = [[CPImageSet alloc] initWithImage:v6];
    dashboardJunctionImageSet = self->_dashboardJunctionImageSet;
    self->_dashboardJunctionImageSet = v4;
  }
  else
  {
    dashboardJunctionImageSet = self->_dashboardJunctionImageSet;
    self->_dashboardJunctionImageSet = 0;
  }
}

- (UIImage)notificationSymbolImage
{
  v2 = [(CPManeuver *)self notificationSymbolImageSet];
  uint64_t v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setNotificationSymbolImage:(UIImage *)notificationSymbolImage
{
  v6 = notificationSymbolImage;
  if (v6)
  {
    id v4 = [[CPImageSet alloc] initWithImage:v6];
    notificationSymbolImageSet = self->_notificationSymbolImageSet;
    self->_notificationSymbolImageSet = v4;
  }
  else
  {
    notificationSymbolImageSet = self->_notificationSymbolImageSet;
    self->_notificationSymbolImageSet = 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = (CPManeuver *)v4;
  if (objc_opt_isKindOfClass())
  {
    if (v5 == self)
    {
      BOOL v10 = 1;
    }
    else if (v5)
    {
      v6 = [(CPManeuver *)self junctionImage];

      objc_super v7 = [(CPManeuver *)v5 junctionImage];

      uint64_t v8 = [(CPManeuver *)v5 identifier];
      v9 = [(CPManeuver *)self identifier];
      BOOL v10 = [v8 isEqual:v9]
         && (v6 == 0) != (v7 != 0)
         && +[CPAccNavUpdate isUpdate:self equalTo:v5];

      self = v5;
    }
    else
    {
      self = 0;
      BOOL v10 = 0;
    }
  }
  else
  {

    BOOL v11 = self == 0;
    self = 0;
    BOOL v10 = v11;
  }

  return v10;
}

- (void)setLinkedLaneGuidance:(id)a3
{
  self->_linkedLaneGuidance = (CPLaneGuidance *)a3;
  self->_linkedLaneGuidanceIndex = [a3 index];
}

- (void)setLinkedLaneGuidanceIndex:(unsigned __int16)a3
{
  self->_linkedLaneGuidance = 0;
  self->_linkedLaneGuidanceIndex = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CPImageSet)symbolSet
{
  return self->_symbolSet;
}

- (UIColor)cardBackgroundColor
{
  return self->_cardBackgroundColor;
}

- (NSArray)instructionVariants
{
  return self->_instructionVariants;
}

- (void)setInstructionVariants:(NSArray *)instructionVariants
{
}

- (CPTravelEstimates)initialTravelEstimates
{
  return self->_initialTravelEstimates;
}

- (void)setInitialTravelEstimates:(CPTravelEstimates *)initialTravelEstimates
{
}

- (NSArray)attributedInstructionVariants
{
  return self->_attributedInstructionVariants;
}

- (void)setAttributedInstructionVariants:(NSArray *)attributedInstructionVariants
{
}

- (NSArray)dashboardInstructionVariants
{
  return self->_dashboardInstructionVariants;
}

- (void)setDashboardInstructionVariants:(NSArray *)dashboardInstructionVariants
{
}

- (NSArray)dashboardAttributedInstructionVariants
{
  return self->_dashboardAttributedInstructionVariants;
}

- (void)setDashboardAttributedInstructionVariants:(NSArray *)dashboardAttributedInstructionVariants
{
}

- (NSArray)notificationInstructionVariants
{
  return self->_notificationInstructionVariants;
}

- (void)setNotificationInstructionVariants:(NSArray *)notificationInstructionVariants
{
}

- (NSArray)notificationAttributedInstructionVariants
{
  return self->_notificationAttributedInstructionVariants;
}

- (void)setNotificationAttributedInstructionVariants:(NSArray *)notificationAttributedInstructionVariants
{
}

- (unint64_t)maneuverType
{
  return self->_maneuverType;
}

- (void)setManeuverType:(unint64_t)a3
{
  self->_maneuverType = a3;
}

- (NSArray)roadFollowingManeuverVariants
{
  return self->_roadFollowingManeuverVariants;
}

- (void)setRoadFollowingManeuverVariants:(id)a3
{
}

- (unint64_t)trafficSide
{
  return self->_trafficSide;
}

- (void)setTrafficSide:(unint64_t)a3
{
  self->_trafficSide = a3;
}

- (unint64_t)junctionType
{
  return self->_junctionType;
}

- (void)setJunctionType:(unint64_t)a3
{
  self->_junctionType = a3;
}

- (NSMeasurement)junctionExitAngle
{
  return self->_junctionExitAngle;
}

- (void)setJunctionExitAngle:(id)a3
{
}

- (NSSet)junctionElementAngles
{
  return self->_junctionElementAngles;
}

- (void)setJunctionElementAngles:(id)a3
{
}

- (CPLaneGuidance)linkedLaneGuidance
{
  return self->_linkedLaneGuidance;
}

- (NSString)highwayExitLabel
{
  return self->_highwayExitLabel;
}

- (void)setHighwayExitLabel:(id)a3
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)userInfo
{
}

- (void)setStringInstructionVariants:(id)a3
{
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(int64_t)a3
{
  self->_displayStyle = a3;
}

- (CPImageSet)junctionImageSet
{
  return self->_junctionImageSet;
}

- (void)setJunctionImageSet:(id)a3
{
}

- (CPImageSet)dashboardSymbolImageSet
{
  return self->_dashboardSymbolImageSet;
}

- (void)setDashboardSymbolImageSet:(id)a3
{
}

- (CPImageSet)dashboardJunctionImageSet
{
  return self->_dashboardJunctionImageSet;
}

- (void)setDashboardJunctionImageSet:(id)a3
{
}

- (CPImageSet)notificationSymbolImageSet
{
  return self->_notificationSymbolImageSet;
}

- (void)setNotificationSymbolImageSet:(id)a3
{
}

- (unsigned)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(unsigned __int16)a3
{
  self->_componentID = a3;
}

- (unsigned)linkedLaneGuidanceIndex
{
  return self->_linkedLaneGuidanceIndex;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned __int16)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSymbolImageSet, 0);
  objc_storeStrong((id *)&self->_dashboardJunctionImageSet, 0);
  objc_storeStrong((id *)&self->_dashboardSymbolImageSet, 0);
  objc_storeStrong((id *)&self->_junctionImageSet, 0);
  objc_storeStrong((id *)&self->_stringInstructionVariants, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_highwayExitLabel, 0);
  objc_storeStrong((id *)&self->_junctionElementAngles, 0);
  objc_storeStrong((id *)&self->_junctionExitAngle, 0);
  objc_storeStrong((id *)&self->_roadFollowingManeuverVariants, 0);
  objc_storeStrong((id *)&self->_notificationAttributedInstructionVariants, 0);
  objc_storeStrong((id *)&self->_notificationInstructionVariants, 0);
  objc_storeStrong((id *)&self->_dashboardAttributedInstructionVariants, 0);
  objc_storeStrong((id *)&self->_dashboardInstructionVariants, 0);
  objc_storeStrong((id *)&self->_attributedInstructionVariants, 0);
  objc_storeStrong((id *)&self->_initialTravelEstimates, 0);
  objc_storeStrong((id *)&self->_instructionVariants, 0);
  objc_storeStrong((id *)&self->_cardBackgroundColor, 0);
  objc_storeStrong((id *)&self->_symbolSet, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSMeasurement)initialDistance
{
  v2 = [(CPManeuver *)self initialTravelEstimates];
  uint64_t v3 = [v2 distanceRemaining];

  return (NSMeasurement *)v3;
}

- (void)setInitialDistance:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [CPTravelEstimates alloc];
  v6 = [(CPManeuver *)self initialTravelEstimates];
  objc_super v7 = [v6 distanceRemainingToDisplay];
  uint64_t v8 = [(CPManeuver *)self initialTravelEstimates];
  [v8 timeRemaining];
  v9 = -[CPTravelEstimates initWithDistanceRemaining:distanceRemainingToDisplay:timeRemaining:](v5, "initWithDistanceRemaining:distanceRemainingToDisplay:timeRemaining:", v4, v7);

  [(CPManeuver *)self setInitialTravelEstimates:v9];
}

- (NSMeasurement)initialDistanceDisplay
{
  v2 = [(CPManeuver *)self initialTravelEstimates];
  uint64_t v3 = [v2 distanceRemainingToDisplay];

  return (NSMeasurement *)v3;
}

- (void)setInitialDistanceDisplay:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [CPTravelEstimates alloc];
  v6 = [(CPManeuver *)self initialTravelEstimates];
  objc_super v7 = [v6 distanceRemaining];
  uint64_t v8 = [(CPManeuver *)self initialTravelEstimates];
  [v8 timeRemaining];
  v9 = -[CPTravelEstimates initWithDistanceRemaining:distanceRemainingToDisplay:timeRemaining:](v5, "initWithDistanceRemaining:distanceRemainingToDisplay:timeRemaining:", v7, v4);

  [(CPManeuver *)self setInitialTravelEstimates:v9];
}

+ (NSArray)accNavParameters
{
  if (accNavParameters_onceToken_0 != -1) {
    dispatch_once(&accNavParameters_onceToken_0, &__block_literal_global_286);
  }
  v2 = (void *)accNavParameters__accNavParameters_0;

  return (NSArray *)v2;
}

void __46__CPManeuver_CPAccNavUpdate__accNavParameters__block_invoke()
{
  v88[13] = *MEMORY[0x263EF8340];
  v72 = NSStringFromSelector(sel_componentID);
  v74 = +[CPAccNavParamKey paramKey:0];
  v73 = (void *)[v74 copySettingIsIntegerValue:1];
  v87 = v73;
  v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v87 count:1];
  v70 = +[CPAccNavParam paramWithProperty:v72 keys:v71];
  v88[0] = v70;
  v67 = NSStringFromSelector(sel_index);
  v69 = +[CPAccNavParamKey paramKey:1];
  v68 = (void *)[v69 copySettingIsIntegerValue:1];
  v86 = v68;
  v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v86 count:1];
  v65 = +[CPAccNavParam paramWithProperty:v67 keys:v66];
  v88[1] = v65;
  v62 = NSStringFromSelector(sel_instructionVariants);
  v64 = +[CPAccNavParamKey paramKey:2];
  v63 = (void *)[v64 copySettingHasVariants:1];
  v85 = v63;
  v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v85 count:1];
  v60 = +[CPAccNavParam paramWithProperty:v62 keys:v61];
  v59 = (void *)[v60 copySettingCollectionGeneric:objc_opt_class()];
  v88[2] = v59;
  v56 = NSStringFromSelector(sel_maneuverType);
  v58 = +[CPAccNavParamKey paramKey:3];
  v57 = (void *)[v58 copySettingEnumType:1];
  v84 = v57;
  v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v84 count:1];
  v54 = +[CPAccNavParam paramWithProperty:v56 keys:v55];
  v88[3] = v54;
  v51 = NSStringFromSelector(sel_roadFollowingManeuverVariants);
  v53 = +[CPAccNavParamKey paramKey:4];
  v52 = (void *)[v53 copySettingHasVariants:1];
  v83 = v52;
  uint64_t v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v83 count:1];
  v49 = +[CPAccNavParam paramWithProperty:v51 keys:v50];
  uint64_t v48 = (void *)[v49 copySettingCollectionGeneric:objc_opt_class()];
  v88[4] = v48;
  uint64_t v44 = NSStringFromSelector(sel_initialDistance);
  uint64_t v47 = +[CPAccNavParamKey paramKey:5];
  v46 = [MEMORY[0x263F08CE8] meters];
  v45 = (void *)[v47 copySettingDimension:v46];
  v82 = v45;
  v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v82 count:1];
  uint64_t v42 = +[CPAccNavParam paramWithProperty:v44 keys:v43];
  v41 = (void *)[v42 copySettingEncodeable:0];
  v88[5] = v41;
  uint64_t v37 = NSStringFromSelector(sel_initialDistanceDisplay);
  v40 = +[CPAccNavParamKey paramKey:6];
  v81[0] = v40;
  uint64_t v39 = +[CPAccNavParamKey paramKey:7];
  v38 = (void *)[v39 copySettingEnumType:5];
  v81[1] = v38;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:2];
  uint64_t v35 = +[CPAccNavParam paramWithProperty:v37 keys:v36];
  v34 = (void *)[v35 copySettingEncodeable:0];
  v88[6] = v34;
  v31 = NSStringFromSelector(sel_trafficSide);
  uint64_t v33 = +[CPAccNavParamKey paramKey:8];
  uint64_t v32 = (void *)[v33 copySettingEnumType:3];
  v80 = v32;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v80 count:1];
  uint64_t v29 = +[CPAccNavParam paramWithProperty:v31 keys:v30];
  v88[7] = v29;
  v26 = NSStringFromSelector(sel_junctionType);
  v28 = +[CPAccNavParamKey paramKey:9];
  uint64_t v27 = (void *)[v28 copySettingEnumType:2];
  v79 = v27;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v79 count:1];
  uint64_t v24 = +[CPAccNavParam paramWithProperty:v26 keys:v25];
  v88[8] = v24;
  objc_super v21 = NSStringFromSelector(sel_junctionElementAngles);
  v23 = +[CPAccNavParamKey paramKey:10];
  uint64_t v22 = [MEMORY[0x263F08C70] degrees];
  uint64_t v20 = (void *)[v23 copySettingDimension:v22];
  v78 = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v78 count:1];
  uint64_t v18 = +[CPAccNavParam paramWithProperty:v21 keys:v19];
  id v17 = (void *)[v18 copySettingCollectionGeneric:objc_opt_class()];
  v88[9] = v17;
  v13 = NSStringFromSelector(sel_junctionExitAngle);
  uint64_t v16 = +[CPAccNavParamKey paramKey:11];
  uint64_t v15 = [MEMORY[0x263F08C70] degrees];
  v14 = (void *)[v16 copySettingDimension:v15];
  v77 = v14;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v77 count:1];
  BOOL v11 = +[CPAccNavParam paramWithProperty:v13 keys:v12];
  v88[10] = v11;
  v0 = NSStringFromSelector(sel_linkedLaneGuidanceIndex);
  v1 = +[CPAccNavParamKey paramKey:12];
  v2 = (void *)[v1 copySettingIsIntegerValue:1];
  v76 = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:1];
  id v4 = +[CPAccNavParam paramWithProperty:v0 keys:v3];
  v88[11] = v4;
  uint64_t v5 = NSStringFromSelector(sel_highwayExitLabel);
  v6 = +[CPAccNavParamKey paramKey:13];
  v75 = v6;
  objc_super v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v75 count:1];
  uint64_t v8 = +[CPAccNavParam paramWithProperty:v5 keys:v7];
  v88[12] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:13];
  BOOL v10 = (void *)accNavParameters__accNavParameters_0;
  accNavParameters__accNavParameters_0 = v9;
}

+ (NSDictionary)accNavParametersIndexed
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__CPManeuver_CPAccNavUpdate__accNavParametersIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParametersIndexed_onceToken_0 != -1) {
    dispatch_once(&accNavParametersIndexed_onceToken_0, block);
  }
  v2 = (void *)accNavParametersIndexed__accNavParametersIndexed_0;

  return (NSDictionary *)v2;
}

uint64_t __53__CPManeuver_CPAccNavUpdate__accNavParametersIndexed__block_invoke(uint64_t a1)
{
  accNavParametersIndexed__accNavParametersIndexed_0 = +[CPAccNavUpdate accNavParametersIndexedForUpdate:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

+ (NSDictionary)accNavParameterKeysIndexed
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CPManeuver_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParameterKeysIndexed_onceToken_0 != -1) {
    dispatch_once(&accNavParameterKeysIndexed_onceToken_0, block);
  }
  v2 = (void *)accNavParameterKeysIndexed__accNavParameterKeysIndexed_0;

  return (NSDictionary *)v2;
}

uint64_t __56__CPManeuver_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke(uint64_t a1)
{
  accNavParameterKeysIndexed__accNavParameterKeysIndexed_0 = +[CPAccNavUpdate accNavParameterKeysIndexedForUpdate:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

- (void)clearValueForKey:(id)a3
{
}

- (CPManeuver)maneuverWithComponent:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F22E98];
  id v5 = a3;
  id v6 = [v4 alloc];
  objc_super v7 = [v5 component];
  uint64_t v8 = (void *)[v6 initWithManeuver:self component:v7];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F30EC8]) initWithComponent:v5 accNavInfo:v8];

  return (CPManeuver *)v9;
}

@end