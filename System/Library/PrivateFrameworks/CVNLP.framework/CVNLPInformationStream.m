@interface CVNLPInformationStream
+ (id)defaultDecodingWeight;
+ (id)defaultLowerBoundLogProbability;
- (CVNLPInformationStream)initWithDecodingWeight:(id)a3;
- (CVNLPInformationStream)initWithDecodingWeight:(id)a3 lowerBoundLogProbability:(id)a4;
- (NSNumber)decodingWeight;
- (NSNumber)lowerBoundLogProbability;
- (double)decodingWeightValue;
- (double)lowerBoundLogProbabilityValue;
@end

@implementation CVNLPInformationStream

- (CVNLPInformationStream)initWithDecodingWeight:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_defaultLowerBoundLogProbability(CVNLPInformationStream, v5, v6, v7);
  v10 = (CVNLPInformationStream *)objc_msgSend_initWithDecodingWeight_lowerBoundLogProbability_(self, v9, (uint64_t)v4, (uint64_t)v8);

  return v10;
}

- (CVNLPInformationStream)initWithDecodingWeight:(id)a3 lowerBoundLogProbability:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CVNLPInformationStream;
  v9 = [(CVNLPInformationStream *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_decodingWeight, a3);
    objc_storeStrong((id *)&v10->_lowerBoundLogProbability, a4);
    objc_msgSend_doubleValue(v7, v11, v12, v13);
    v10->_decodingWeightValue = v14;
    objc_msgSend_doubleValue(v8, v15, v16, v17);
    v10->_lowerBoundLogProbabilityValue = v18;
  }

  return v10;
}

- (double)decodingWeightValue
{
  return self->_decodingWeightValue;
}

- (double)lowerBoundLogProbabilityValue
{
  return self->_lowerBoundLogProbabilityValue;
}

+ (id)defaultDecodingWeight
{
  return (id)objc_msgSend_numberWithDouble_(NSNumber, a2, v2, v3, 1.0);
}

+ (id)defaultLowerBoundLogProbability
{
  return (id)objc_msgSend_numberWithDouble_(NSNumber, a2, v2, v3, -1.79769313e308);
}

- (NSNumber)decodingWeight
{
  return self->_decodingWeight;
}

- (NSNumber)lowerBoundLogProbability
{
  return self->_lowerBoundLogProbability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowerBoundLogProbability, 0);
  objc_storeStrong((id *)&self->_decodingWeight, 0);
}

@end