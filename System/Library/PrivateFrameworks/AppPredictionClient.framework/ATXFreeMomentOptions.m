@interface ATXFreeMomentOptions
+ (BOOL)supportsSecureCoding;
- (ATXFreeMomentOptions)initWithCoder:(id)a3;
- (ATXFreeMomentOptions)initWithDurationHint:(double)a3 matchingOptions:(unint64_t)a4;
- (double)durationHint;
- (unint64_t)matchingOptions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXFreeMomentOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXFreeMomentOptions)initWithDurationHint:(double)a3 matchingOptions:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ATXFreeMomentOptions;
  result = [(ATXFreeMomentOptions *)&v7 init];
  if (result)
  {
    result->_durationHint = a3;
    result->_matchingOptions = a4;
  }
  return result;
}

- (ATXFreeMomentOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"durationHint"];
  double v6 = v5;
  uint64_t v7 = [v4 decodeIntegerForKey:@"matchingOptions"];

  return [(ATXFreeMomentOptions *)self initWithDurationHint:v7 matchingOptions:v6];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(ATXFreeMomentOptions *)self durationHint];
  objc_msgSend(v4, "encodeDouble:forKey:", @"durationHint");
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXFreeMomentOptions matchingOptions](self, "matchingOptions"), @"matchingOptions");
}

- (double)durationHint
{
  return self->_durationHint;
}

- (unint64_t)matchingOptions
{
  return self->_matchingOptions;
}

@end