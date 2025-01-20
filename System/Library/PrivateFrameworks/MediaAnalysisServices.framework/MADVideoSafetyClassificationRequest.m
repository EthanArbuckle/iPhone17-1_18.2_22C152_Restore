@interface MADVideoSafetyClassificationRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)appliesPreferredTrackTransform;
- (BOOL)requiresBlastdoor;
- (BOOL)requiresScoresAndLabels;
- (MADVideoSafetyClassificationRequest)init;
- (MADVideoSafetyClassificationRequest)initWithCoder:(id)a3;
- (MADVideoSafetyFrameSampling)sampling;
- (NSNumber)sensitiveFrameCountThreshold;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAppliesPreferredTrackTransform:(BOOL)a3;
- (void)setRequiresBlastdoor:(BOOL)a3;
- (void)setRequiresScoresAndLabels:(BOOL)a3;
- (void)setSampling:(id)a3;
- (void)setSensitiveFrameCountThreshold:(id)a3;
@end

@implementation MADVideoSafetyClassificationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVideoSafetyClassificationRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)MADVideoSafetyClassificationRequest;
  result = [(MADVideoSafetyClassificationRequest *)&v3 init];
  if (result) {
    result->_appliesPreferredTrackTransform = 1;
  }
  return result;
}

- (MADVideoSafetyClassificationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADVideoSafetyClassificationRequest;
  v5 = [(MADVideoRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Sampling"];
    sampling = v5->_sampling;
    v5->_sampling = (MADVideoSafetyFrameSampling *)v6;

    v5->_appliesPreferredTrackTransform = [v4 decodeBoolForKey:@"AppliesPreferredTrackTransform"];
    v5->_requiresScoresAndLabels = [v4 decodeBoolForKey:@"RequiresScoresAndLabels"];
    v5->_requiresBlastdoor = [v4 decodeBoolForKey:@"RequiresBlastdoor"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SensitiveFrameCountThreshold"];
    sensitiveFrameCountThreshold = v5->_sensitiveFrameCountThreshold;
    v5->_sensitiveFrameCountThreshold = (NSNumber *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADVideoSafetyClassificationRequest;
  id v4 = a3;
  [(MADVideoRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sampling, @"Sampling", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_appliesPreferredTrackTransform forKey:@"AppliesPreferredTrackTransform"];
  [v4 encodeBool:self->_requiresBlastdoor forKey:@"RequiresBlastdoor"];
  [v4 encodeBool:self->_requiresScoresAndLabels forKey:@"RequiresScoresAndLabels"];
  [v4 encodeObject:self->_sensitiveFrameCountThreshold forKey:@"SensitiveFrameCountThreshold"];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p", v5, self];

  [v3 appendFormat:@", sampling: %@", self->_sampling];
  if (self->_appliesPreferredTrackTransform) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  [v3 appendFormat:@", appliesPreferredTrackTransform: %@", v6];
  if (self->_requiresScoresAndLabels) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 appendFormat:@", requiresScoresAndLaels: %@", v7];
  if (self->_requiresBlastdoor) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  [v3 appendFormat:@", requiresBlastdoor: %@", v8];
  [v3 appendFormat:@", sensitiveFrameCountThreshold: %@", self->_sensitiveFrameCountThreshold];
  [v3 appendString:@">"];
  return v3;
}

- (BOOL)requiresScoresAndLabels
{
  return self->_requiresScoresAndLabels;
}

- (void)setRequiresScoresAndLabels:(BOOL)a3
{
  self->_requiresScoresAndLabels = a3;
}

- (MADVideoSafetyFrameSampling)sampling
{
  return self->_sampling;
}

- (void)setSampling:(id)a3
{
}

- (BOOL)appliesPreferredTrackTransform
{
  return self->_appliesPreferredTrackTransform;
}

- (void)setAppliesPreferredTrackTransform:(BOOL)a3
{
  self->_appliesPreferredTrackTransform = a3;
}

- (BOOL)requiresBlastdoor
{
  return self->_requiresBlastdoor;
}

- (void)setRequiresBlastdoor:(BOOL)a3
{
  self->_requiresBlastdoor = a3;
}

- (NSNumber)sensitiveFrameCountThreshold
{
  return self->_sensitiveFrameCountThreshold;
}

- (void)setSensitiveFrameCountThreshold:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitiveFrameCountThreshold, 0);
  objc_storeStrong((id *)&self->_sampling, 0);
}

@end