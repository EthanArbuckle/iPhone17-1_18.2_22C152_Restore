@interface ARPPredictionContext
- (ARPPredictionContext)initWithPredictionDate:(id)a3 microLocationEventDate:(id)a4 microLocationProbabilityVector:(id)a5;
- (NSDate)microLocationEventDate;
- (NSDate)predictionDate;
- (NSDictionary)microLocationProbabilityVector;
- (id)description;
@end

@implementation ARPPredictionContext

- (ARPPredictionContext)initWithPredictionDate:(id)a3 microLocationEventDate:(id)a4 microLocationProbabilityVector:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ARPPredictionContext;
  v11 = [(ARPPredictionContext *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    predictionDate = v11->_predictionDate;
    v11->_predictionDate = (NSDate *)v12;

    uint64_t v14 = [v9 copy];
    microLocationEventDate = v11->_microLocationEventDate;
    v11->_microLocationEventDate = (NSDate *)v14;

    objc_storeStrong((id *)&v11->_microLocationProbabilityVector, a5);
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ARPPredictionContext *)self predictionDate];
  v6 = [(ARPPredictionContext *)self microLocationEventDate];
  v7 = [(ARPPredictionContext *)self microLocationProbabilityVector];
  id v8 = [v3 stringWithFormat:@"<%@ %p> predictionDate: %@, microLocationEventDate: %@, microLocationProbabilityVector: %@", v4, self, v5, v6, v7];

  return v8;
}

- (NSDate)microLocationEventDate
{
  return self->_microLocationEventDate;
}

- (NSDate)predictionDate
{
  return self->_predictionDate;
}

- (NSDictionary)microLocationProbabilityVector
{
  return self->_microLocationProbabilityVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microLocationProbabilityVector, 0);
  objc_storeStrong((id *)&self->_predictionDate, 0);
  objc_storeStrong((id *)&self->_microLocationEventDate, 0);
}

@end