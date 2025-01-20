@interface HKMCAnalysisQueryConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)forceAnalysis;
- (HKMCAnalysisQueryConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setForceAnalysis:(BOOL)a3;
@end

@implementation HKMCAnalysisQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKMCAnalysisQueryConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setForceAnalysis:", -[HKMCAnalysisQueryConfiguration forceAnalysis](self, "forceAnalysis"));
  return v4;
}

- (void)setForceAnalysis:(BOOL)a3
{
  self->_forceAnalysis = a3;
}

- (BOOL)forceAnalysis
{
  return self->_forceAnalysis;
}

- (HKMCAnalysisQueryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKMCAnalysisQueryConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_forceAnalysis = [v4 decodeBoolForKey:@"ForceAnalysis"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMCAnalysisQueryConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_forceAnalysis, @"ForceAnalysis", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end