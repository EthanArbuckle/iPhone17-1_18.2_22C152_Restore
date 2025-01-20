@interface VNPersonsModelPrediction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSObject)predictedPersonUniqueIdentifier;
- (VNFaceObservation)faceObservation;
- (VNPersonsModelPrediction)initWithCoder:(id)a3;
- (VNPersonsModelPrediction)initWithFaceObservation:(id)a3 predictedPersonUniqueIdentifier:(id)a4 confidence:(float)a5;
- (float)confidence;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNPersonsModelPrediction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedPersonUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_faceObservation, 0);
}

- (float)confidence
{
  return self->_confidence;
}

- (NSObject)predictedPersonUniqueIdentifier
{
  return self->_predictedPersonUniqueIdentifier;
}

- (VNFaceObservation)faceObservation
{
  return self->_faceObservation;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)VNPersonsModelPrediction;
  v3 = [(VNPersonsModelPrediction *)&v8 description];
  v4 = [(VNPersonsModelPrediction *)self predictedPersonUniqueIdentifier];
  [(VNPersonsModelPrediction *)self confidence];
  v6 = [v3 stringByAppendingFormat:@" '%@' confidence %f", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VNFaceObservation *)self->_faceObservation hash] ^ __ROR8__([self->_predictedPersonUniqueIdentifier hash] ^ __ROR8__([(VNFaceObservation *)self->_faceObservation hash], 51), 51);
  float confidence = self->_confidence;
  uint64_t v5 = LODWORD(confidence);
  if (confidence == 0.0) {
    uint64_t v5 = 0;
  }
  return v5 ^ __ROR8__(v3, 51);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNPersonsModelPrediction *)a3;
  if (v4 == self)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      [(VNPersonsModelPrediction *)self confidence];
      float v7 = v6;
      [(VNPersonsModelPrediction *)v5 confidence];
      if (v7 == v8
        && ([(VNPersonsModelPrediction *)self predictedPersonUniqueIdentifier],
            v9 = objc_claimAutoreleasedReturnValue(),
            [(VNPersonsModelPrediction *)v5 predictedPersonUniqueIdentifier],
            v10 = objc_claimAutoreleasedReturnValue(),
            char v11 = [v9 isEqual:v10],
            v10,
            v9,
            (v11 & 1) != 0))
      {
        v12 = [(VNPersonsModelPrediction *)self faceObservation];
        v13 = [(VNPersonsModelPrediction *)v5 faceObservation];
        char v14 = [v12 isEqual:v13];
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_faceObservation forKey:@"face"];
  objc_msgSend(v5, "vn_encodePersonUniqueIdentifier:forKey:", self->_predictedPersonUniqueIdentifier, @"personUID");
  *(float *)&double v4 = self->_confidence;
  [v5 encodeFloat:@"confidence" forKey:v4];
}

- (VNPersonsModelPrediction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "vn_decodePersonUniqueIdentifierForKey:", @"personUID");
  if (v5)
  {
    float v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"face"];
    if (v6)
    {
      [v4 decodeFloatForKey:@"confidence"];
      self = -[VNPersonsModelPrediction initWithFaceObservation:predictedPersonUniqueIdentifier:confidence:](self, "initWithFaceObservation:predictedPersonUniqueIdentifier:confidence:", v6, v5);
      float v7 = self;
    }
    else
    {
      float v7 = 0;
    }
  }
  else
  {
    float v7 = 0;
  }

  return v7;
}

- (VNPersonsModelPrediction)initWithFaceObservation:(id)a3 predictedPersonUniqueIdentifier:(id)a4 confidence:(float)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VNPersonsModelPrediction;
  char v11 = [(VNPersonsModelPrediction *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_faceObservation, a3);
    objc_storeStrong((id *)&v12->_predictedPersonUniqueIdentifier, a4);
    v12->_float confidence = a5;
    v13 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end