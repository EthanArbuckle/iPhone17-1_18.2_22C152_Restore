@interface ARPRoutePrediction
- (ARPRoutePrediction)initWithOutputDeviceID:(id)a3 confidence:(double)a4;
- (NSString)outputDeviceID;
- (double)confidence;
- (id)description;
@end

@implementation ARPRoutePrediction

- (ARPRoutePrediction)initWithOutputDeviceID:(id)a3 confidence:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARPRoutePrediction;
  v7 = [(ARPRoutePrediction *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    outputDeviceID = v7->_outputDeviceID;
    v7->_outputDeviceID = (NSString *)v8;

    v7->_confidence = a4;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ARPRoutePrediction *)self outputDeviceID];
  id v6 = NSNumber;
  [(ARPRoutePrediction *)self confidence];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v8 = [v3 stringWithFormat:@"<%@ %p> outputDeviceID: %@, confidence: %@", v4, self, v5, v7];

  return v8;
}

- (NSString)outputDeviceID
{
  return self->_outputDeviceID;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
}

@end