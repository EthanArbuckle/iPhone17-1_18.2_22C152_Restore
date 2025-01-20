@interface CPRouteInfo
+ (BOOL)supportsSecureCoding;
- (CPRouteGuidance)routeGuidance;
- (CPRouteInfo)initWithCoder:(id)a3;
- (CPRouteInfo)initWithRouteGuidance:(id)a3 maneuvers:(id)a4 laneGuidances:(id)a5;
- (NSArray)laneGuidances;
- (NSArray)maneuvers;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPRouteInfo

- (CPRouteInfo)initWithRouteGuidance:(id)a3 maneuvers:(id)a4 laneGuidances:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CPRouteInfo;
  v11 = [(CPRouteInfo *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    routeGuidance = v11->_routeGuidance;
    v11->_routeGuidance = (CPRouteGuidance *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v9 copyItems:1];
    maneuvers = v11->_maneuvers;
    v11->_maneuvers = (NSArray *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v10 copyItems:1];
    laneGuidances = v11->_laneGuidances;
    v11->_laneGuidances = (NSArray *)v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPRouteInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CPRouteInfo;
  v5 = [(CPRouteInfo *)&v20 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"kCPRouteInfoRouteGuidanceKey"];
    routeGuidance = v5->_routeGuidance;
    v5->_routeGuidance = (CPRouteGuidance *)v7;

    id v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"kCPRouteInfoManeuversKey"];
    maneuvers = v5->_maneuvers;
    v5->_maneuvers = (NSArray *)v12;

    uint64_t v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"kCPRouteInfoLaneGuidancesKey"];
    laneGuidances = v5->_laneGuidances;
    v5->_laneGuidances = (NSArray *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPRouteInfo *)self routeGuidance];
  [v4 encodeObject:v5 forKey:@"kCPRouteInfoRouteGuidanceKey"];

  v6 = [(CPRouteInfo *)self maneuvers];
  [v4 encodeObject:v6 forKey:@"kCPRouteInfoManeuversKey"];

  id v7 = [(CPRouteInfo *)self laneGuidances];
  [v4 encodeObject:v7 forKey:@"kCPRouteInfoLaneGuidancesKey"];
}

- (NSArray)maneuvers
{
  return self->_maneuvers;
}

- (NSArray)laneGuidances
{
  return self->_laneGuidances;
}

- (CPRouteGuidance)routeGuidance
{
  return self->_routeGuidance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeGuidance, 0);
  objc_storeStrong((id *)&self->_laneGuidances, 0);

  objc_storeStrong((id *)&self->_maneuvers, 0);
}

@end