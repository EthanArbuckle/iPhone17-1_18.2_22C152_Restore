@interface ACCNavigationAccessoryComponent
+ (BOOL)supportsSecureCoding;
- (ACCNavigationAccessoryComponent)initWithCoder:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)requestSourceName;
- (BOOL)requestSourceSupportsRouteGuidance;
- (BOOL)supportsExitInfo;
- (BOOL)supportsLaneGuidance;
- (BOOL)supportsPreconditioning;
- (BOOL)supportsTimeZoneOffset;
- (NSString)name;
- (id)description;
- (unint64_t)hash;
- (unint64_t)identifier;
- (unint64_t)maxCapacity_GuidanceManeuver;
- (unint64_t)maxCapacity_LaneGuidance;
- (unint64_t)maxLength_CurrentRoadName;
- (unint64_t)maxLength_DestinationRoadName;
- (unint64_t)maxLength_LaneGuidanceDescription;
- (unint64_t)maxLength_ManeuverDescription;
- (unint64_t)maxLength_PostManeuverRoadName;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setMaxCapacity_GuidanceManeuver:(unint64_t)a3;
- (void)setMaxCapacity_LaneGuidance:(unint64_t)a3;
- (void)setMaxLength_CurrentRoadName:(unint64_t)a3;
- (void)setMaxLength_DestinationRoadName:(unint64_t)a3;
- (void)setMaxLength_LaneGuidanceDescription:(unint64_t)a3;
- (void)setMaxLength_ManeuverDescription:(unint64_t)a3;
- (void)setMaxLength_PostManeuverRoadName:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setRequestSourceName:(BOOL)a3;
- (void)setRequestSourceSupportsRouteGuidance:(BOOL)a3;
- (void)setSupportsExitInfo:(BOOL)a3;
- (void)setSupportsLaneGuidance:(BOOL)a3;
- (void)setSupportsPreconditioning:(BOOL)a3;
- (void)setSupportsTimeZoneOffset:(BOOL)a3;
@end

@implementation ACCNavigationAccessoryComponent

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    unint64_t identifier = self->_identifier;
    if (identifier == [v5 identifier])
    {
      name = self->_name;
      v8 = [v5 name];
      if (![(NSString *)name isEqualToString:v8]) {
        goto LABEL_21;
      }
      int isEnabled = self->_isEnabled;
      if (isEnabled != [v5 isEnabled]) {
        goto LABEL_21;
      }
      unint64_t maxLength_CurrentRoadName = self->_maxLength_CurrentRoadName;
      if (maxLength_CurrentRoadName != objc_msgSend(v5, "maxLength_CurrentRoadName")) {
        goto LABEL_21;
      }
      unint64_t maxLength_DestinationRoadName = self->_maxLength_DestinationRoadName;
      if (maxLength_DestinationRoadName != objc_msgSend(v5, "maxLength_DestinationRoadName")) {
        goto LABEL_21;
      }
      unint64_t maxLength_PostManeuverRoadName = self->_maxLength_PostManeuverRoadName;
      if (maxLength_PostManeuverRoadName != objc_msgSend(v5, "maxLength_PostManeuverRoadName")) {
        goto LABEL_21;
      }
      unint64_t maxLength_ManeuverDescription = self->_maxLength_ManeuverDescription;
      if (maxLength_ManeuverDescription != objc_msgSend(v5, "maxLength_ManeuverDescription")) {
        goto LABEL_21;
      }
      unint64_t maxCapacity_GuidanceManeuver = self->_maxCapacity_GuidanceManeuver;
      if (maxCapacity_GuidanceManeuver != objc_msgSend(v5, "maxCapacity_GuidanceManeuver")) {
        goto LABEL_21;
      }
      unint64_t maxLength_LaneGuidanceDescription = self->_maxLength_LaneGuidanceDescription;
      if (maxLength_LaneGuidanceDescription == objc_msgSend(v5, "maxLength_LaneGuidanceDescription")
        && (unint64_t maxCapacity_LaneGuidance = self->_maxCapacity_LaneGuidance,
            maxCapacity_LaneGuidance == objc_msgSend(v5, "maxCapacity_LaneGuidance"))
        && (int requestSourceName = self->_requestSourceName,
            requestSourceName == [v5 requestSourceName])
        && (int requestSourceSupportsRouteGuidance = self->_requestSourceSupportsRouteGuidance,
            requestSourceSupportsRouteGuidance == [v5 requestSourceSupportsRouteGuidance])
        && (int supportsExitInfo = self->_supportsExitInfo,
            supportsExitInfo == [v5 supportsExitInfo])
        && (int supportsLaneGuidance = self->_supportsLaneGuidance,
            supportsLaneGuidance == [v5 supportsLaneGuidance])
        && (int supportsTimeZoneOffset = self->_supportsTimeZoneOffset,
            supportsTimeZoneOffset == [v5 supportsTimeZoneOffset]))
      {
        int supportsPreconditioning = self->_supportsPreconditioning;
        BOOL v23 = supportsPreconditioning == [v5 supportsPreconditioning];
      }
      else
      {
LABEL_21:
        BOOL v23 = 0;
      }
    }
    else
    {
      BOOL v23 = 0;
    }
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (unint64_t)hash
{
  return self->_identifier;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ACCNavigationAccessoryComponent - name: %@, identifier: %d, isEnabled: %d>, max_CRN: %d, max_DRN: %d, max_PMRN: %d, max_GM: %d, max_MD: %d, max_LD: %d, max_LG: %d, reqSrcName: %d reqSrcSupportRG: %d, exitInfo: %d, laneGuidance: %d, timeZoneOffset: %d, preconditioning: %d>", self->_name, self->_identifier, self->_isEnabled, self->_maxLength_CurrentRoadName, self->_maxLength_DestinationRoadName, self->_maxLength_PostManeuverRoadName, self->_maxLength_ManeuverDescription, self->_maxCapacity_GuidanceManeuver, self->_maxLength_LaneGuidanceDescription, self->_maxCapacity_LaneGuidance, self->_requestSourceName, self->_requestSourceSupportsRouteGuidance, self->_supportsExitInfo, self->_supportsLaneGuidance, self->_supportsTimeZoneOffset, self->_supportsPreconditioning];
}

- (void)encodeWithCoder:(id)a3
{
  id v28 = a3;
  unint64_t v4 = [(ACCNavigationAccessoryComponent *)self identifier];
  id v5 = NSStringFromSelector(sel_identifier);
  [v28 encodeInteger:v4 forKey:v5];

  v6 = [(ACCNavigationAccessoryComponent *)self name];
  [v28 encodeObject:v6 forKey:ACCNav_DispComp_Name];

  BOOL v7 = [(ACCNavigationAccessoryComponent *)self isEnabled];
  v8 = NSStringFromSelector(sel_isEnabled);
  [v28 encodeBool:v7 forKey:v8];

  unint64_t v9 = [(ACCNavigationAccessoryComponent *)self maxLength_CurrentRoadName];
  [v28 encodeInteger:v9 forKey:ACCNav_DispComp_MaxCurRoadNameLength];
  unint64_t v10 = [(ACCNavigationAccessoryComponent *)self maxLength_DestinationRoadName];
  [v28 encodeInteger:v10 forKey:ACCNav_DispComp_MaxDestinationNameLength];
  unint64_t v11 = [(ACCNavigationAccessoryComponent *)self maxLength_PostManeuverRoadName];
  [v28 encodeInteger:v11 forKey:ACCNav_DispComp_MaxAfterManeuverRoadNameLength];
  unint64_t v12 = [(ACCNavigationAccessoryComponent *)self maxLength_ManeuverDescription];
  [v28 encodeInteger:v12 forKey:ACCNav_DispComp_MaxManeuverDescriptionLength];
  unint64_t v13 = [(ACCNavigationAccessoryComponent *)self maxLength_LaneGuidanceDescription];
  [v28 encodeInteger:v13 forKey:ACCNav_DispComp_MaxLaneGuidanceDescriptionLength];
  BOOL v14 = [(ACCNavigationAccessoryComponent *)self requestSourceName];
  v15 = NSStringFromSelector(sel_requestSourceName);
  [v28 encodeBool:v14 forKey:v15];

  BOOL v16 = [(ACCNavigationAccessoryComponent *)self requestSourceSupportsRouteGuidance];
  v17 = NSStringFromSelector(sel_requestSourceSupportsRouteGuidance);
  [v28 encodeBool:v16 forKey:v17];

  BOOL v18 = [(ACCNavigationAccessoryComponent *)self supportsExitInfo];
  v19 = NSStringFromSelector(sel_supportsExitInfo);
  [v28 encodeBool:v18 forKey:v19];

  BOOL v20 = [(ACCNavigationAccessoryComponent *)self supportsLaneGuidance];
  v21 = NSStringFromSelector(sel_supportsLaneGuidance);
  [v28 encodeBool:v20 forKey:v21];

  BOOL v22 = [(ACCNavigationAccessoryComponent *)self supportsTimeZoneOffset];
  BOOL v23 = NSStringFromSelector(sel_supportsTimeZoneOffset);
  [v28 encodeBool:v22 forKey:v23];

  BOOL v24 = [(ACCNavigationAccessoryComponent *)self supportsPreconditioning];
  v25 = NSStringFromSelector(sel_supportsPreconditioning);
  [v28 encodeBool:v24 forKey:v25];

  unint64_t v26 = [(ACCNavigationAccessoryComponent *)self maxCapacity_GuidanceManeuver];
  [v28 encodeInteger:v26 forKey:ACCNav_DispComp_MaxMGuidanceManeuverCapacity];
  unint64_t v27 = [(ACCNavigationAccessoryComponent *)self maxCapacity_LaneGuidance];
  [v28 encodeInteger:v27 forKey:ACCNav_DispComp_MaxLaneGuidanceStorageCapacity];
}

- (ACCNavigationAccessoryComponent)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ACCNavigationAccessoryComponent;
  id v5 = [(ACCNavigationAccessoryComponent *)&v17 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_identifier);
    v5->_unint64_t identifier = [v4 decodeIntegerForKey:v6];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:ACCNav_DispComp_Name];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    unint64_t v9 = NSStringFromSelector(sel_isEnabled);
    v5->_int isEnabled = [v4 decodeBoolForKey:v9];

    v5->_unint64_t maxLength_CurrentRoadName = [v4 decodeIntegerForKey:ACCNav_DispComp_MaxCurRoadNameLength];
    v5->_unint64_t maxLength_DestinationRoadName = [v4 decodeIntegerForKey:ACCNav_DispComp_MaxDestinationNameLength];
    v5->_unint64_t maxLength_PostManeuverRoadName = [v4 decodeIntegerForKey:ACCNav_DispComp_MaxAfterManeuverRoadNameLength];
    v5->_unint64_t maxLength_ManeuverDescription = [v4 decodeIntegerForKey:ACCNav_DispComp_MaxManeuverDescriptionLength];
    v5->_unint64_t maxLength_LaneGuidanceDescription = [v4 decodeIntegerForKey:ACCNav_DispComp_MaxLaneGuidanceDescriptionLength];
    unint64_t v10 = NSStringFromSelector(sel_requestSourceName);
    v5->_int requestSourceName = [v4 decodeBoolForKey:v10];

    unint64_t v11 = NSStringFromSelector(sel_requestSourceSupportsRouteGuidance);
    v5->_int requestSourceSupportsRouteGuidance = [v4 decodeBoolForKey:v11];

    unint64_t v12 = NSStringFromSelector(sel_supportsExitInfo);
    v5->_int supportsExitInfo = [v4 decodeBoolForKey:v12];

    unint64_t v13 = NSStringFromSelector(sel_supportsLaneGuidance);
    v5->_int supportsLaneGuidance = [v4 decodeBoolForKey:v13];

    BOOL v14 = NSStringFromSelector(sel_supportsTimeZoneOffset);
    v5->_int supportsTimeZoneOffset = [v4 decodeBoolForKey:v14];

    v15 = NSStringFromSelector(sel_supportsPreconditioning);
    v5->_int supportsPreconditioning = [v4 decodeBoolForKey:v15];

    v5->_unint64_t maxCapacity_GuidanceManeuver = [v4 decodeIntegerForKey:ACCNav_DispComp_MaxMGuidanceManeuverCapacity];
    v5->_unint64_t maxCapacity_LaneGuidance = [v4 decodeIntegerForKey:ACCNav_DispComp_MaxLaneGuidanceStorageCapacity];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_unint64_t identifier = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_int isEnabled = a3;
}

- (unint64_t)maxLength_CurrentRoadName
{
  return self->_maxLength_CurrentRoadName;
}

- (void)setMaxLength_CurrentRoadName:(unint64_t)a3
{
  self->_unint64_t maxLength_CurrentRoadName = a3;
}

- (unint64_t)maxLength_DestinationRoadName
{
  return self->_maxLength_DestinationRoadName;
}

- (void)setMaxLength_DestinationRoadName:(unint64_t)a3
{
  self->_unint64_t maxLength_DestinationRoadName = a3;
}

- (unint64_t)maxLength_PostManeuverRoadName
{
  return self->_maxLength_PostManeuverRoadName;
}

- (void)setMaxLength_PostManeuverRoadName:(unint64_t)a3
{
  self->_unint64_t maxLength_PostManeuverRoadName = a3;
}

- (unint64_t)maxLength_ManeuverDescription
{
  return self->_maxLength_ManeuverDescription;
}

- (void)setMaxLength_ManeuverDescription:(unint64_t)a3
{
  self->_unint64_t maxLength_ManeuverDescription = a3;
}

- (unint64_t)maxLength_LaneGuidanceDescription
{
  return self->_maxLength_LaneGuidanceDescription;
}

- (void)setMaxLength_LaneGuidanceDescription:(unint64_t)a3
{
  self->_unint64_t maxLength_LaneGuidanceDescription = a3;
}

- (BOOL)requestSourceName
{
  return self->_requestSourceName;
}

- (void)setRequestSourceName:(BOOL)a3
{
  self->_int requestSourceName = a3;
}

- (BOOL)requestSourceSupportsRouteGuidance
{
  return self->_requestSourceSupportsRouteGuidance;
}

- (void)setRequestSourceSupportsRouteGuidance:(BOOL)a3
{
  self->_int requestSourceSupportsRouteGuidance = a3;
}

- (BOOL)supportsExitInfo
{
  return self->_supportsExitInfo;
}

- (void)setSupportsExitInfo:(BOOL)a3
{
  self->_int supportsExitInfo = a3;
}

- (BOOL)supportsLaneGuidance
{
  return self->_supportsLaneGuidance;
}

- (void)setSupportsLaneGuidance:(BOOL)a3
{
  self->_int supportsLaneGuidance = a3;
}

- (BOOL)supportsTimeZoneOffset
{
  return self->_supportsTimeZoneOffset;
}

- (void)setSupportsTimeZoneOffset:(BOOL)a3
{
  self->_int supportsTimeZoneOffset = a3;
}

- (BOOL)supportsPreconditioning
{
  return self->_supportsPreconditioning;
}

- (void)setSupportsPreconditioning:(BOOL)a3
{
  self->_int supportsPreconditioning = a3;
}

- (unint64_t)maxCapacity_GuidanceManeuver
{
  return self->_maxCapacity_GuidanceManeuver;
}

- (void)setMaxCapacity_GuidanceManeuver:(unint64_t)a3
{
  self->_unint64_t maxCapacity_GuidanceManeuver = a3;
}

- (unint64_t)maxCapacity_LaneGuidance
{
  return self->_maxCapacity_LaneGuidance;
}

- (void)setMaxCapacity_LaneGuidance:(unint64_t)a3
{
  self->_unint64_t maxCapacity_LaneGuidance = a3;
}

- (void).cxx_destruct
{
}

@end