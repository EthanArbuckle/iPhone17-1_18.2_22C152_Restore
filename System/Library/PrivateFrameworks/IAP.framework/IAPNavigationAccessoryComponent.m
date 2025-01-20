@interface IAPNavigationAccessoryComponent
- (BOOL)_enabledModified;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)requestSourceName;
- (BOOL)requestSourceSupportsRouteGuidance;
- (IAPNavigationAccessoryComponent)initWithDict:(id)a3;
- (NSString)name;
- (id)description;
- (unint64_t)identifier;
- (unint64_t)maxCapacity_GuidanceManeuver;
- (unint64_t)maxLength_CurrentRoadName;
- (unint64_t)maxLength_DestinationRoadName;
- (unint64_t)maxLength_ManeuverDescription;
- (unint64_t)maxLength_PostManeuverRoadName;
- (void)setIdentifier:(unint64_t)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setMaxCapacity_GuidanceManeuver:(unint64_t)a3;
- (void)setMaxLength_CurrentRoadName:(unint64_t)a3;
- (void)setMaxLength_DestinationRoadName:(unint64_t)a3;
- (void)setMaxLength_ManeuverDescription:(unint64_t)a3;
- (void)setMaxLength_PostManeuverRoadName:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setRequestSourceName:(BOOL)a3;
- (void)setRequestSourceSupportsRouteGuidance:(BOOL)a3;
- (void)set_enabledModified:(BOOL)a3;
@end

@implementation IAPNavigationAccessoryComponent

- (IAPNavigationAccessoryComponent)initWithDict:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IAPNavigationAccessoryComponent;
  v5 = [(IAPNavigationAccessoryComponent *)&v24 init];
  v6 = v5;
  if (v5)
  {
    v5->__enabledModified = 0;
    v7 = [v4 objectForKey:@"isEnabled"];
    v6->_isEnabled = [v7 isEqualToString:@"YES"];
    v8 = [v4 objectForKey:@"identifier"];
    uint64_t v9 = [v8 unsignedIntegerValue];

    if (v9) {
      v6->_identifier = v9;
    }
    v10 = [v4 objectForKey:@"name"];
    if (v10) {
      objc_storeStrong((id *)&v6->_name, v10);
    }
    v11 = [v4 objectForKey:@"maxLength_CurrentRoadName"];
    uint64_t v12 = [v11 unsignedIntegerValue];

    if (v12) {
      v6->_maxLength_CurrentRoadName = v12;
    }
    v13 = [v4 objectForKey:@"maxLength_DestinationRoadName"];
    uint64_t v14 = [v13 unsignedIntegerValue];

    if (v14) {
      v6->_maxLength_DestinationRoadName = v14;
    }
    v15 = [v4 objectForKey:@"maxLength_PostManeuverRoadName"];
    uint64_t v16 = [v15 unsignedIntegerValue];

    if (v16) {
      v6->_maxLength_PostManeuverRoadName = v16;
    }
    v17 = [v4 objectForKey:@"maxLength_ManeuverDescription"];
    uint64_t v18 = [v17 unsignedIntegerValue];

    if (v18) {
      v6->_maxLength_ManeuverDescription = v18;
    }
    v19 = [v4 objectForKey:@"maxCapacity_GuidanceManeuver"];
    uint64_t v20 = [v19 unsignedIntegerValue];

    if (v20) {
      v6->_maxCapacity_GuidanceManeuver = v20;
    }
    v21 = [v4 objectForKey:@"requestSourceName"];
    v6->_requestSourceName = [v21 BOOLValue];

    v22 = [v4 objectForKey:@"requestSourceSupportsRouteGuidance"];
    v6->_requestSourceSupportsRouteGuidance = [v22 BOOLValue];
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t identifier = self->_identifier;
    if (identifier == [v5 identifier])
    {
      name = self->_name;
      v8 = [v5 name];
      if ([(NSString *)name isEqualToString:v8]
        && (int isEnabled = self->_isEnabled, isEnabled == [v5 isEnabled])
        && (unint64_t maxLength_CurrentRoadName = self->_maxLength_CurrentRoadName,
            maxLength_CurrentRoadName == objc_msgSend(v5, "maxLength_CurrentRoadName"))
        && (unint64_t maxLength_DestinationRoadName = self->_maxLength_DestinationRoadName,
            maxLength_DestinationRoadName == objc_msgSend(v5, "maxLength_DestinationRoadName"))
        && (unint64_t maxLength_PostManeuverRoadName = self->_maxLength_PostManeuverRoadName,
            maxLength_PostManeuverRoadName == objc_msgSend(v5, "maxLength_PostManeuverRoadName"))
        && (unint64_t maxLength_ManeuverDescription = self->_maxLength_ManeuverDescription,
            maxLength_ManeuverDescription == objc_msgSend(v5, "maxLength_ManeuverDescription"))
        && (unint64_t maxCapacity_GuidanceManeuver = self->_maxCapacity_GuidanceManeuver,
            maxCapacity_GuidanceManeuver == objc_msgSend(v5, "maxCapacity_GuidanceManeuver"))
        && (int requestSourceName = self->_requestSourceName,
            requestSourceName == [v5 requestSourceName]))
      {
        int requestSourceSupportsRouteGuidance = self->_requestSourceSupportsRouteGuidance;
        BOOL v17 = requestSourceSupportsRouteGuidance == [v5 requestSourceSupportsRouteGuidance];
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<IAPNavigationAccessoryComponent - name: %@, identifier: %d, isEnabled: %d>, max_CRN: %d, max_DRN: %d, max_PMRN: %d, max_MD: %d, max_GM: %d, reqSrcName: %d reqSrcSupportRG: %d>", self->_name, self->_identifier, self->_isEnabled, self->_maxLength_CurrentRoadName, self->_maxLength_DestinationRoadName, self->_maxLength_PostManeuverRoadName, self->_maxLength_ManeuverDescription, self->_maxCapacity_GuidanceManeuver, self->_requestSourceName, self->_requestSourceSupportsRouteGuidance];
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

- (unint64_t)maxCapacity_GuidanceManeuver
{
  return self->_maxCapacity_GuidanceManeuver;
}

- (void)setMaxCapacity_GuidanceManeuver:(unint64_t)a3
{
  self->_unint64_t maxCapacity_GuidanceManeuver = a3;
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

- (BOOL)_enabledModified
{
  return self->__enabledModified;
}

- (void)set_enabledModified:(BOOL)a3
{
  self->__enabledModified = a3;
}

- (void).cxx_destruct
{
}

@end