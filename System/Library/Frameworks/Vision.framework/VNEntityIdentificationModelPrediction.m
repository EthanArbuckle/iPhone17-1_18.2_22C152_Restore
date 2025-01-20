@interface VNEntityIdentificationModelPrediction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSObject)entityUniqueIdentifier;
- (VNEntityIdentificationModelObservation)observation;
- (VNEntityIdentificationModelPrediction)initWithCoder:(id)a3;
- (VNEntityIdentificationModelPrediction)initWithObservation:(id)a3 entityUniqueIdentifier:(id)a4 confidence:(float)a5;
- (float)confidence;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNEntityIdentificationModelPrediction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_observation, 0);
}

- (float)confidence
{
  return self->_confidence;
}

- (NSObject)entityUniqueIdentifier
{
  return objc_getProperty(self, a2, 16, 1);
}

- (VNEntityIdentificationModelObservation)observation
{
  return (VNEntityIdentificationModelObservation *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)VNEntityIdentificationModelPrediction;
  v3 = [(VNEntityIdentificationModelPrediction *)&v8 description];
  v4 = [(VNEntityIdentificationModelPrediction *)self entityUniqueIdentifier];
  [(VNEntityIdentificationModelPrediction *)self confidence];
  v6 = [v3 stringByAppendingFormat:@" '%@' confidence %f", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_entityUniqueIdentifier hash] ^ __ROR8__([(VNEntityIdentificationModelObservation *)self->_observation hash], 51);
  float confidence = self->_confidence;
  uint64_t v5 = LODWORD(confidence);
  if (confidence == 0.0) {
    uint64_t v5 = 0;
  }
  return v5 ^ __ROR8__(v3, 51);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNEntityIdentificationModelPrediction *)a3;
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
      [(VNEntityIdentificationModelPrediction *)self confidence];
      float v7 = v6;
      [(VNEntityIdentificationModelPrediction *)v5 confidence];
      if (v7 == v8
        && ([(VNEntityIdentificationModelPrediction *)self entityUniqueIdentifier],
            v9 = objc_claimAutoreleasedReturnValue(),
            [(VNEntityIdentificationModelPrediction *)v5 entityUniqueIdentifier],
            v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = [v9 isEqual:v10],
            v10,
            v9,
            v11))
      {
        v12 = [(VNEntityIdentificationModelPrediction *)self observation];
        v13 = [(VNEntityIdentificationModelPrediction *)v5 observation];
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
  observation = self->_observation;
  id v6 = a3;
  [v6 encodeObject:observation forKey:@"observation"];
  objc_msgSend(v6, "vn_encodeEntityUniqueIdentifier:forKey:", self->_entityUniqueIdentifier, @"entityUID");
  *(float *)&double v5 = self->_confidence;
  [v6 encodeFloat:@"confidence" forKey:v5];
}

- (VNEntityIdentificationModelPrediction)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = objc_msgSend(v4, "vn_decodeEntityUniqueIdentifierForKey:", @"entityUID");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"observation"];
    if (v6)
    {
      [v4 decodeFloatForKey:@"confidence"];
      self = -[VNEntityIdentificationModelPrediction initWithObservation:entityUniqueIdentifier:confidence:](self, "initWithObservation:entityUniqueIdentifier:confidence:", v6, v5);
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

- (VNEntityIdentificationModelPrediction)initWithObservation:(id)a3 entityUniqueIdentifier:(id)a4 confidence:(float)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VNEntityIdentificationModelPrediction;
  int v11 = [(VNEntityIdentificationModelPrediction *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_observation, a3);
    objc_storeStrong((id *)&v12->_entityUniqueIdentifier, a4);
    v12->_float confidence = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end