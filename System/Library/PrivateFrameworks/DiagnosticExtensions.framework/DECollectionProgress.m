@interface DECollectionProgress
+ (BOOL)supportsSecureCoding;
- (DECollectionProgress)initWithCoder:(id)a3;
- (DECollectionProgress)initWithPercentComplete:(double)a3;
- (DECollectionProgress)initWithPercentComplete:(double)a3 withEstimatedTimeRemaining:(id)a4;
- (NSNumber)estimatedTimeRemaining;
- (NSString)statusString;
- (double)percentComplete;
- (void)encodeWithCoder:(id)a3;
- (void)setEstimatedTimeRemaining:(id)a3;
- (void)setPercentComplete:(double)a3;
- (void)setStatusString:(id)a3;
@end

@implementation DECollectionProgress

- (DECollectionProgress)initWithPercentComplete:(double)a3
{
  return [(DECollectionProgress *)self initWithPercentComplete:0 withEstimatedTimeRemaining:a3];
}

- (DECollectionProgress)initWithPercentComplete:(double)a3 withEstimatedTimeRemaining:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DECollectionProgress;
  v8 = [(DECollectionProgress *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_percentComplete = a3;
    objc_storeStrong((id *)&v8->_estimatedTimeRemaining, a4);
  }

  return v9;
}

- (DECollectionProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DECollectionProgress *)self init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"PercentComplete"];
    v5->_percentComplete = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TimeRemaining"];
    estimatedTimeRemaining = v5->_estimatedTimeRemaining;
    v5->_estimatedTimeRemaining = (NSNumber *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StatusString"];
    statusString = v5->_statusString;
    v5->_statusString = (NSString *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double percentComplete = self->_percentComplete;
  id v5 = a3;
  [v5 encodeDouble:@"PercentComplete" forKey:percentComplete];
  [v5 encodeObject:self->_estimatedTimeRemaining forKey:@"TimeRemaining"];
  [v5 encodeObject:self->_statusString forKey:@"StatusString"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_double percentComplete = a3;
}

- (NSNumber)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (void)setEstimatedTimeRemaining:(id)a3
{
}

- (NSString)statusString
{
  return self->_statusString;
}

- (void)setStatusString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_estimatedTimeRemaining, 0);
}

@end