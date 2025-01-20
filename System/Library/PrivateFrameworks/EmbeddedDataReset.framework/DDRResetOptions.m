@interface DDRResetOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)disallowProximitySetup;
- (BOOL)eraseDataPlan;
- (BOOL)hideProgress;
- (DDRResetOptions)initWithCoder:(id)a3;
- (NSArray)exclusionPaths;
- (void)encodeWithCoder:(id)a3;
- (void)setDisallowProximitySetup:(BOOL)a3;
- (void)setEraseDataPlan:(BOOL)a3;
- (void)setExclusionPaths:(id)a3;
- (void)setHideProgress:(BOOL)a3;
@end

@implementation DDRResetOptions

- (DDRResetOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDRResetOptions;
  v5 = [(DDRResetOptions *)&v9 init];
  if (v5)
  {
    v5->_hideProgress = [v4 decodeBoolForKey:@"hideProgress"];
    v5->_eraseDataPlan = [v4 decodeBoolForKey:@"eraseDataPlan"];
    v5->_disallowProximitySetup = [v4 decodeBoolForKey:@"disallowProximitySetup"];
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"exclusionPaths"];
    exclusionPaths = v5->_exclusionPaths;
    v5->_exclusionPaths = (NSArray *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[DDRResetOptions hideProgress](self, "hideProgress"), @"hideProgress");
  objc_msgSend(v4, "encodeBool:forKey:", -[DDRResetOptions eraseDataPlan](self, "eraseDataPlan"), @"eraseDataPlan");
  objc_msgSend(v4, "encodeBool:forKey:", -[DDRResetOptions disallowProximitySetup](self, "disallowProximitySetup"), @"disallowProximitySetup");
  id v5 = [(DDRResetOptions *)self exclusionPaths];
  [v4 encodeObject:v5 forKey:@"exclusionPaths"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)hideProgress
{
  return self->_hideProgress;
}

- (void)setHideProgress:(BOOL)a3
{
  self->_hideProgress = a3;
}

- (BOOL)eraseDataPlan
{
  return self->_eraseDataPlan;
}

- (void)setEraseDataPlan:(BOOL)a3
{
  self->_eraseDataPlan = a3;
}

- (BOOL)disallowProximitySetup
{
  return self->_disallowProximitySetup;
}

- (void)setDisallowProximitySetup:(BOOL)a3
{
  self->_disallowProximitySetup = a3;
}

- (NSArray)exclusionPaths
{
  return self->_exclusionPaths;
}

- (void)setExclusionPaths:(id)a3
{
}

- (void).cxx_destruct
{
}

@end