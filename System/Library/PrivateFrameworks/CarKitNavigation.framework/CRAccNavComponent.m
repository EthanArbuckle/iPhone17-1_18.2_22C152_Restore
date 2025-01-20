@interface CRAccNavComponent
+ (BOOL)supportsSecureCoding;
- (ACCNavigationAccessoryComponent)component;
- (CRAccNavComponent)initWithAccessoryUID:(id)a3 component:(id)a4;
- (CRAccNavComponent)initWithCoder:(id)a3;
- (CRAccNavComponent)initWithUUID:(id)a3 accessoryUID:(id)a4 component:(id)a5;
- (NSNumber)componentIdentifier;
- (NSString)accessoryUID;
- (NSString)configDescription;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRAccNavComponent

- (CRAccNavComponent)initWithAccessoryUID:(id)a3 component:(id)a4
{
  v6 = (void *)MEMORY[0x263F08C38];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 UUID];
  v10 = [(CRAccNavComponent *)self initWithUUID:v9 accessoryUID:v8 component:v7];

  return v10;
}

- (CRAccNavComponent)initWithUUID:(id)a3 accessoryUID:(id)a4 component:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRAccNavComponent;
  v12 = [(CRAccNavComponent *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    objc_storeStrong((id *)&v13->_accessoryUID, a4);
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "identifier"));
    componentIdentifier = v13->_componentIdentifier;
    v13->_componentIdentifier = (NSNumber *)v14;

    objc_storeStrong((id *)&v13->_component, a5);
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CRAccNavComponent *)self uuid];
  v6 = [v5 UUIDString];
  id v7 = [(CRAccNavComponent *)self componentIdentifier];
  id v8 = [(CRAccNavComponent *)self accessoryUID];
  id v9 = [v3 stringWithFormat:@"<%@: %p %@ identifier=%@ accessory=%@>", v4, self, v6, v7, v8];

  return v9;
}

- (NSString)configDescription
{
  v53[13] = *MEMORY[0x263EF8340];
  v3 = NSString;
  v52 = [(CRAccNavComponent *)self component];
  v51 = objc_msgSend(v3, "stringWithFormat:", @"\tmaxLength_CurrentRoadName: %lu", objc_msgSend(v52, "maxLength_CurrentRoadName"));
  v53[0] = v51;
  uint64_t v4 = NSString;
  v50 = [(CRAccNavComponent *)self component];
  v49 = objc_msgSend(v4, "stringWithFormat:", @"\tmaxLength_DestinationRoadName: %lu", objc_msgSend(v50, "maxLength_DestinationRoadName"));
  v53[1] = v49;
  v5 = NSString;
  v48 = [(CRAccNavComponent *)self component];
  v47 = objc_msgSend(v5, "stringWithFormat:", @"\tmaxLength_PostManeuverRoadName: %lu", objc_msgSend(v48, "maxLength_PostManeuverRoadName"));
  v53[2] = v47;
  v6 = NSString;
  v46 = [(CRAccNavComponent *)self component];
  v45 = objc_msgSend(v6, "stringWithFormat:", @"\tmaxLength_ManeuverDescription: %lu", objc_msgSend(v46, "maxLength_ManeuverDescription"));
  v53[3] = v45;
  id v7 = NSString;
  v44 = [(CRAccNavComponent *)self component];
  v43 = objc_msgSend(v7, "stringWithFormat:", @"\tmaxLength_LaneGuidanceDescription: %lu", objc_msgSend(v44, "maxLength_LaneGuidanceDescription"));
  v53[4] = v43;
  id v8 = NSString;
  v42 = [(CRAccNavComponent *)self component];
  if ([v42 requestSourceName]) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  v41 = [v8 stringWithFormat:@"\trequestSourceName: %@", v9];
  v53[5] = v41;
  id v10 = NSString;
  v40 = [(CRAccNavComponent *)self component];
  if ([v40 requestSourceSupportsRouteGuidance]) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  v39 = [v10 stringWithFormat:@"\trequestSourceSupportsRouteGuidance: %@", v11];
  v53[6] = v39;
  v12 = NSString;
  v38 = [(CRAccNavComponent *)self component];
  if ([v38 supportsExitInfo]) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  v37 = [v12 stringWithFormat:@"\tsupportsExitInfo: %@", v13];
  v53[7] = v37;
  uint64_t v14 = NSString;
  v36 = [(CRAccNavComponent *)self component];
  if ([v36 supportsLaneGuidance]) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  v16 = [v14 stringWithFormat:@"\tsupportsLaneGuidance: %@", v15];
  v53[8] = v16;
  objc_super v17 = NSString;
  v18 = [(CRAccNavComponent *)self component];
  if ([v18 supportsTimeZoneOffset]) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  v20 = [v17 stringWithFormat:@"\tsupportsTimeZoneOffset: %@", v19];
  v53[9] = v20;
  v21 = NSString;
  v22 = [(CRAccNavComponent *)self component];
  if ([v22 supportsPreconditioning]) {
    v23 = @"YES";
  }
  else {
    v23 = @"NO";
  }
  v24 = [v21 stringWithFormat:@"\tsupportsPreconditioning: %@", v23];
  v53[10] = v24;
  v25 = NSString;
  v26 = [(CRAccNavComponent *)self component];
  v27 = objc_msgSend(v25, "stringWithFormat:", @"\tmaxCapacity_GuidanceManeuver: %lu", objc_msgSend(v26, "maxCapacity_GuidanceManeuver"));
  v53[11] = v27;
  v28 = NSString;
  v29 = [(CRAccNavComponent *)self component];
  v30 = objc_msgSend(v28, "stringWithFormat:", @"\tmaxCapacity_LaneGuidance: %lu", objc_msgSend(v29, "maxCapacity_LaneGuidance"));
  v53[12] = v30;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:13];

  v32 = NSString;
  v33 = [v31 componentsJoinedByString:@",\n"];
  v34 = [v32 stringWithFormat:@"{\n%@\n}", v33];

  return (NSString *)v34;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CRAccNavComponent *)self uuid];
  v6 = NSStringFromSelector(sel_uuid);
  [v4 encodeObject:v5 forKey:v6];

  id v7 = [(CRAccNavComponent *)self accessoryUID];
  id v8 = NSStringFromSelector(sel_accessoryUID);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(CRAccNavComponent *)self component];
  id v9 = NSStringFromSelector(sel_component);
  [v4 encodeObject:v10 forKey:v9];
}

- (CRAccNavComponent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_uuid);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_accessoryUID);
  id v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromSelector(sel_component);
  v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  uint64_t v14 = [(CRAccNavComponent *)self initWithUUID:v7 accessoryUID:v10 component:v13];
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CRAccNavComponent alloc];
  uint64_t v5 = [(CRAccNavComponent *)self uuid];
  v6 = [(CRAccNavComponent *)self accessoryUID];
  id v7 = [(CRAccNavComponent *)self component];
  uint64_t v8 = [(CRAccNavComponent *)v4 initWithUUID:v5 accessoryUID:v6 component:v7];

  return v8;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (NSNumber)componentIdentifier
{
  return self->_componentIdentifier;
}

- (ACCNavigationAccessoryComponent)component
{
  return self->_component;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end