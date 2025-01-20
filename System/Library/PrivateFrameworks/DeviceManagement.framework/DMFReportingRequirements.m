@interface DMFReportingRequirements
+ (BOOL)supportsSecureCoding;
- (BOOL)requireActiveConnection;
- (DMFReportingRequirements)init;
- (DMFReportingRequirements)initWithCoder:(id)a3;
- (NSString)reachableHostName;
- (double)updateCoalescenceInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setReachableHostName:(id)a3;
- (void)setRequireActiveConnection:(BOOL)a3;
- (void)setUpdateCoalescenceInterval:(double)a3;
@end

@implementation DMFReportingRequirements

- (DMFReportingRequirements)init
{
  v3.receiver = self;
  v3.super_class = (Class)DMFReportingRequirements;
  result = [(DMFReportingRequirements *)&v3 init];
  if (result) {
    result->_updateCoalescenceInterval = -1.0;
  }
  return result;
}

- (id)description
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v6[0] = @"reachableHostName";
  v6[1] = @"updateCoalescenceInterval";
  v6[2] = @"requireActiveConnection";
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  v4 = DMFObjectDescriptionWithProperties(self, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFReportingRequirements)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFReportingRequirements;
  v5 = [(DMFReportingRequirements *)&v13 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"reachableHostName"];
    reachableHostName = v5->_reachableHostName;
    v5->_reachableHostName = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateCoalescenceInterval"];
    [v9 doubleValue];
    v5->_updateCoalescenceInterval = v10;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requireActiveConnection"];
    v5->_requireActiveConnection = [v11 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DMFReportingRequirements *)self reachableHostName];
  [v4 encodeObject:v5 forKey:@"reachableHostName"];

  v6 = NSNumber;
  [(DMFReportingRequirements *)self updateCoalescenceInterval];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  [v4 encodeObject:v7 forKey:@"updateCoalescenceInterval"];

  objc_msgSend(NSNumber, "numberWithBool:", -[DMFReportingRequirements requireActiveConnection](self, "requireActiveConnection"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"requireActiveConnection"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(DMFReportingRequirements *)self reachableHostName];
  [v4 setReachableHostName:v5];

  [(DMFReportingRequirements *)self updateCoalescenceInterval];
  objc_msgSend(v4, "setUpdateCoalescenceInterval:");
  objc_msgSend(v4, "setRequireActiveConnection:", -[DMFReportingRequirements requireActiveConnection](self, "requireActiveConnection"));
  return v4;
}

- (NSString)reachableHostName
{
  return self->_reachableHostName;
}

- (void)setReachableHostName:(id)a3
{
}

- (double)updateCoalescenceInterval
{
  return self->_updateCoalescenceInterval;
}

- (void)setUpdateCoalescenceInterval:(double)a3
{
  self->_updateCoalescenceInterval = a3;
}

- (BOOL)requireActiveConnection
{
  return self->_requireActiveConnection;
}

- (void)setRequireActiveConnection:(BOOL)a3
{
  self->_requireActiveConnection = a3;
}

- (void).cxx_destruct
{
}

@end