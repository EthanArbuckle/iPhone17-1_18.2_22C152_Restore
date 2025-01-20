@interface PHPersonAvailability
- (NSArray)requestedDetectionTypes;
- (NSDictionary)dictionaryRepresentation;
- (PHPersonAvailability)initWithRequestedDetectionTypes:(id)a3;
- (unint64_t)availablePersonCount;
- (unint64_t)keyFaceCount;
- (unint64_t)keyFaceWithVUObservationIDCount;
- (unint64_t)mdIDCount;
- (unint64_t)nonzeroFaceCropsCount;
- (void)setAvailablePersonCount:(unint64_t)a3;
- (void)setKeyFaceCount:(unint64_t)a3;
- (void)setKeyFaceWithVUObservationIDCount:(unint64_t)a3;
- (void)setMdIDCount:(unint64_t)a3;
- (void)setNonzeroFaceCropsCount:(unint64_t)a3;
@end

@implementation PHPersonAvailability

- (void).cxx_destruct
{
}

- (NSArray)requestedDetectionTypes
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNonzeroFaceCropsCount:(unint64_t)a3
{
  self->_nonzeroFaceCropsCount = a3;
}

- (unint64_t)nonzeroFaceCropsCount
{
  return self->_nonzeroFaceCropsCount;
}

- (void)setKeyFaceWithVUObservationIDCount:(unint64_t)a3
{
  self->_keyFaceWithVUObservationIDCount = a3;
}

- (unint64_t)keyFaceWithVUObservationIDCount
{
  return self->_keyFaceWithVUObservationIDCount;
}

- (void)setKeyFaceCount:(unint64_t)a3
{
  self->_keyFaceCount = a3;
}

- (unint64_t)keyFaceCount
{
  return self->_keyFaceCount;
}

- (void)setMdIDCount:(unint64_t)a3
{
  self->_mdIDCount = a3;
}

- (unint64_t)mdIDCount
{
  return self->_mdIDCount;
}

- (void)setAvailablePersonCount:(unint64_t)a3
{
  self->_availablePersonCount = a3;
}

- (unint64_t)availablePersonCount
{
  return self->_availablePersonCount;
}

- (NSDictionary)dictionaryRepresentation
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v11[0] = @"availablePersonCount";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHPersonAvailability availablePersonCount](self, "availablePersonCount"));
  v12[0] = v3;
  v11[1] = @"keyFaceCount";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHPersonAvailability keyFaceCount](self, "keyFaceCount"));
  v12[1] = v4;
  v11[2] = @"keyFaceWithVUObservationIDCount";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHPersonAvailability keyFaceWithVUObservationIDCount](self, "keyFaceWithVUObservationIDCount"));
  v12[2] = v5;
  v11[3] = @"mdIDCount";
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHPersonAvailability mdIDCount](self, "mdIDCount"));
  v12[3] = v6;
  v11[4] = @"nonzeroFaceCropsCount";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHPersonAvailability nonzeroFaceCropsCount](self, "nonzeroFaceCropsCount"));
  v12[4] = v7;
  v11[5] = @"requestedDetectionTypes";
  v8 = [(PHPersonAvailability *)self requestedDetectionTypes];
  v12[5] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];

  return (NSDictionary *)v9;
}

- (PHPersonAvailability)initWithRequestedDetectionTypes:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHPersonAvailability;
  v6 = [(PHPersonAvailability *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requestedDetectionTypes, a3);
  }

  return v7;
}

@end