@interface WFTripInfo
+ (BOOL)supportsSecureCoding;
- (NSMeasurement)distance;
- (NSString)routeName;
- (NSString)wfName;
- (WFTimeInterval)expectedTravelTime;
- (WFTripInfo)initWithCoder:(id)a3;
- (WFTripInfo)initWithMKRoute:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFTripInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedTravelTime, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
}

- (WFTimeInterval)expectedTravelTime
{
  return self->_expectedTravelTime;
}

- (NSMeasurement)distance
{
  return self->_distance;
}

- (NSString)routeName
{
  return self->_routeName;
}

- (void)encodeWithCoder:(id)a3
{
  routeName = self->_routeName;
  id v5 = a3;
  [v5 encodeObject:routeName forKey:@"routeName"];
  [v5 encodeObject:self->_distance forKey:@"distance"];
  [v5 encodeObject:self->_expectedTravelTime forKey:@"expectedTravelTime"];
}

- (WFTripInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFTripInfo;
  id v5 = [(WFTripInfo *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routeName"];
    routeName = v5->_routeName;
    v5->_routeName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"distance"];
    distance = v5->_distance;
    v5->_distance = (NSMeasurement *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expectedTravelTime"];
    expectedTravelTime = v5->_expectedTravelTime;
    v5->_expectedTravelTime = (WFTimeInterval *)v10;

    v12 = v5;
  }

  return v5;
}

- (NSString)wfName
{
  v2 = [(WFTripInfo *)self expectedTravelTime];
  v3 = [v2 absoluteTimeString];

  return (NSString *)v3;
}

- (WFTripInfo)initWithMKRoute:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFTripInfo.m", 25, @"Invalid parameter not satisfying: %@", @"route" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)WFTripInfo;
  uint64_t v6 = [(WFTripInfo *)&v22 init];
  if (v6)
  {
    v7 = [v5 name];
    uint64_t v8 = [v7 copy];
    routeName = v6->_routeName;
    v6->_routeName = (NSString *)v8;

    id v10 = objc_alloc(MEMORY[0x263F08980]);
    [v5 distance];
    double v12 = v11;
    v13 = [MEMORY[0x263F08CE8] meters];
    uint64_t v14 = [v10 initWithDoubleValue:v13 unit:v12];
    distance = v6->_distance;
    v6->_distance = (NSMeasurement *)v14;

    [v5 expectedTravelTime];
    uint64_t v17 = WFTimeIntervalFromExpectedTravelTime(v16);
    expectedTravelTime = v6->_expectedTravelTime;
    v6->_expectedTravelTime = (WFTimeInterval *)v17;

    v19 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end