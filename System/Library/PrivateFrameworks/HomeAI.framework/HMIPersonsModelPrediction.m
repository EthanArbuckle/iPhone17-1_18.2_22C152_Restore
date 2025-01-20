@interface HMIPersonsModelPrediction
- (HMIPersonsModelPrediction)initWithSourceUUID:(id)a3 personUUID:(id)a4 confidence:(id)a5 linkedEntityUUID:(id)a6;
- (NSNumber)confidence;
- (NSUUID)linkedEntityUUID;
- (NSUUID)personUUID;
- (NSUUID)sourceUUID;
@end

@implementation HMIPersonsModelPrediction

- (HMIPersonsModelPrediction)initWithSourceUUID:(id)a3 personUUID:(id)a4 confidence:(id)a5 linkedEntityUUID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMIPersonsModelPrediction;
  v15 = [(HMIPersonsModelPrediction *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sourceUUID, a3);
    objc_storeStrong((id *)&v16->_personUUID, a4);
    objc_storeStrong((id *)&v16->_confidence, a5);
    objc_storeStrong((id *)&v16->_linkedEntityUUID, a6);
  }

  return v16;
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)confidence
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)linkedEntityUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedEntityUUID, 0);
  objc_storeStrong((id *)&self->_confidence, 0);
  objc_storeStrong((id *)&self->_personUUID, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
}

@end