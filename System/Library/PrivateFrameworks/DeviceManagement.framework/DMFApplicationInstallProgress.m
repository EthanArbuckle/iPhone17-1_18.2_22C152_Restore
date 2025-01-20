@interface DMFApplicationInstallProgress
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DMFApplicationInstallProgress)initWithCoder:(id)a3;
- (DMFApplicationInstallProgress)initWithState:(unint64_t)a3 phase:(unint64_t)a4 fractionCompleted:(double)a5;
- (double)fractionCompleted;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)phase;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFApplicationInstallProgress

- (DMFApplicationInstallProgress)initWithState:(unint64_t)a3 phase:(unint64_t)a4 fractionCompleted:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)DMFApplicationInstallProgress;
  result = [(DMFApplicationInstallProgress *)&v9 init];
  if (result)
  {
    result->_state = a3;
    result->_phase = a4;
    result->_fractionCompleted = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFApplicationInstallProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFApplicationInstallProgress;
  v5 = [(DMFApplicationInstallProgress *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    v5->_state = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phase"];
    v5->_phase = [v7 unsignedIntegerValue];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fractionCompleted"];
    [v8 doubleValue];
    v5->_fractionCompleted = v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[DMFApplicationInstallProgress state](self, "state"));
  [v5 encodeObject:v6 forKey:@"state"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFApplicationInstallProgress phase](self, "phase"));
  [v5 encodeObject:v7 forKey:@"phase"];

  v8 = NSNumber;
  [(DMFApplicationInstallProgress *)self fractionCompleted];
  objc_msgSend(v8, "numberWithDouble:");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v9 forKey:@"fractionCompleted"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DMFApplicationInstallProgress *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t v6 = [(DMFApplicationInstallProgress *)self state];
      if (v6 == [(DMFApplicationInstallProgress *)v5 state]
        && (unint64_t v7 = [(DMFApplicationInstallProgress *)self phase],
            v7 == [(DMFApplicationInstallProgress *)v5 phase]))
      {
        [(DMFApplicationInstallProgress *)self fractionCompleted];
        double v9 = v8;
        [(DMFApplicationInstallProgress *)v5 fractionCompleted];
        BOOL v11 = v9 == v10;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p {\nState              : ", objc_opt_class(), self];
  unint64_t v4 = [(DMFApplicationInstallProgress *)self state];
  if (v4 <= 5) {
    [v3 appendString:off_1E63721E8[v4]];
  }
  [v3 appendString:@"\nPhase              : "];
  unint64_t v5 = [(DMFApplicationInstallProgress *)self phase];
  if (v5 <= 3) {
    [v3 appendString:off_1E6372218[v5]];
  }
  [(DMFApplicationInstallProgress *)self fractionCompleted];
  objc_msgSend(v3, "appendFormat:", @"\nFraction Completed : %f\n}>", v6);
  unint64_t v7 = (void *)[v3 copy];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t v5 = [(DMFApplicationInstallProgress *)self state];
  unint64_t v6 = [(DMFApplicationInstallProgress *)self phase];
  [(DMFApplicationInstallProgress *)self fractionCompleted];
  return (id)objc_msgSend(v4, "initWithState:phase:fractionCompleted:", v5, v6);
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (double)fractionCompleted
{
  return self->_fractionCompleted;
}

@end