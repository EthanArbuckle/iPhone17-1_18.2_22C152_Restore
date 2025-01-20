@interface DDSTrialExperimentIdentifiers
+ (BOOL)supportsSecureCoding;
- (DDSTrialExperimentIdentifiers)initWithCoder:(id)a3;
- (DDSTrialExperimentIdentifiers)initWithExperimentId:(id)a3 treatmentId:(id)a4 deploymentId:(int)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DDSTrialExperimentIdentifiers

- (DDSTrialExperimentIdentifiers)initWithExperimentId:(id)a3 treatmentId:(id)a4 deploymentId:(int)a5
{
  v6.receiver = self;
  v6.super_class = (Class)DDSTrialExperimentIdentifiers;
  return [(TRIExperimentIdentifiers *)&v6 initWithExperimentId:a3 deploymentId:*(void *)&a5 treatmentId:a4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[TRIExperimentIdentifiers deploymentId](self, "deploymentId"), @"deploymentId");
  v5 = [(TRIExperimentIdentifiers *)self experimentId];
  [v4 encodeObject:v5 forKey:@"experimentId"];

  id v6 = [(TRIExperimentIdentifiers *)self treatmentId];
  [v4 encodeObject:v6 forKey:@"treatmentId"];
}

- (DDSTrialExperimentIdentifiers)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt32ForKey:@"deploymentId"];
  if ((int)v5 < 1)
  {
    v9 = 0;
  }
  else
  {
    uint64_t v6 = v5;
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"treatmentId"];
    if (v7)
    {
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experimentId"];
      if (v8)
      {
        self = [(DDSTrialExperimentIdentifiers *)self initWithExperimentId:v8 treatmentId:v7 deploymentId:v6];
        v9 = self;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end