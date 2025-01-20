@interface NLProbabilityInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (NLProbabilityInfo)initWithCoder:(id)a3;
- (NLProbabilityInfo)initWithInvalidProbability;
- (NLProbabilityInfo)initWithLog10Probability:(double)a3 flags:(unint64_t)a4;
- (NLProbabilityInfo)initWithProbability:(double)a3 flags:(unint64_t)a4;
- (double)log10Probability;
- (double)probability;
- (id)description;
- (unint64_t)hash;
- (unint64_t)probabilityFlags;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NLProbabilityInfo

- (NLProbabilityInfo)initWithProbability:(double)a3 flags:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NLProbabilityInfo;
  v6 = [(NLProbabilityInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_probability = a3;
    v6->_log10Probability = log10(a3);
    v7->_isValid = 1;
    v7->_probabilityFlags = a4;
  }
  return v7;
}

- (NLProbabilityInfo)initWithLog10Probability:(double)a3 flags:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NLProbabilityInfo;
  v6 = [(NLProbabilityInfo *)&v8 init];
  if (v6)
  {
    v6->_probability = __exp10(a3);
    v6->_log10Probability = a3;
    v6->_isValid = 1;
    v6->_probabilityFlags = a4;
  }
  return v6;
}

- (NLProbabilityInfo)initWithInvalidProbability
{
  result = [(NLProbabilityInfo *)self initWithLog10Probability:0 flags:-30.0];
  if (result)
  {
    *(_OWORD *)&result->_probability = xmmword_1A646D510;
    result->_isValid = 0;
    result->_probabilityFlags = 0;
  }
  return result;
}

- (id)description
{
  v2 = NSString;
  [(NLProbabilityInfo *)self log10Probability];
  return (id)objc_msgSend(v2, "stringWithFormat:", @"logprob %.2g", v3);
}

- (unint64_t)hash
{
  [(NLProbabilityInfo *)self log10Probability];
  unint64_t v4 = (unint64_t)(v3 * -10000000.0);
  if ([(NLProbabilityInfo *)self isValid]) {
    uint64_t v5 = 0x40000000;
  }
  else {
    uint64_t v5 = 0;
  }
  return v5 ^ [(NLProbabilityInfo *)self probabilityFlags] ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (NLProbabilityInfo *)a3;
  uint64_t v5 = v4;
  BOOL v11 = 1;
  if (v4 != self)
  {
    if (!v4
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (BOOL v6 = [(NLProbabilityInfo *)self isValid], v6 != [(NLProbabilityInfo *)v5 isValid])
      || (unint64_t v7 = [(NLProbabilityInfo *)self probabilityFlags],
          v7 != [(NLProbabilityInfo *)v5 probabilityFlags])
      || ([(NLProbabilityInfo *)self log10Probability],
          double v9 = v8,
          [(NLProbabilityInfo *)v5 log10Probability],
          v9 != v10))
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NLProbabilityInfo requires keyed coding" userInfo:0];
    objc_exception_throw(v4);
  }
  [(NLProbabilityInfo *)self log10Probability];
  objc_msgSend(v5, "encodeDouble:forKey:", @"NLLog10Probability");
  objc_msgSend(v5, "encodeBool:forKey:", -[NLProbabilityInfo isValid](self, "isValid"), @"NLIsValid");
  objc_msgSend(v5, "encodeInteger:forKey:", -[NLProbabilityInfo probabilityFlags](self, "probabilityFlags"), @"NLProbabilityFlags");
}

- (NLProbabilityInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NLProbabilityInfo requires keyed coding" userInfo:0];
    objc_exception_throw(v12);
  }
  [v4 decodeDoubleForKey:@"NLLog10Probability"];
  double v6 = v5;
  int v7 = [v4 decodeBoolForKey:@"NLIsValid"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"NLProbabilityFlags"];
  if (v7) {
    double v9 = [(NLProbabilityInfo *)self initWithLog10Probability:v8 flags:v6];
  }
  else {
    double v9 = [(NLProbabilityInfo *)self initWithInvalidProbability];
  }
  double v10 = v9;

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)probability
{
  return self->_probability;
}

- (double)log10Probability
{
  return self->_log10Probability;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (unint64_t)probabilityFlags
{
  return self->_probabilityFlags;
}

@end