@interface CTLocalPlan
+ (BOOL)supportsSecureCoding;
- (CTLocalPlan)initWithCoder:(id)a3;
- (CTLocalPlan)initWithPlanID:(id)a3;
- (CTPlanIdentifier)planID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPlanID:(id)a3;
@end

@implementation CTLocalPlan

- (CTLocalPlan)initWithPlanID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLocalPlan;
  v6 = [(CTLocalPlan *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_planID, a3);
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTLocalPlan *)self planID];
  [v3 appendFormat:@" planID=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLocalPlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLocalPlan;
  id v5 = [(CTLocalPlan *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planID"];
    planID = v5->_planID;
    v5->_planID = (CTPlanIdentifier *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTPlanIdentifier)planID
{
  return self->_planID;
}

- (void)setPlanID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end