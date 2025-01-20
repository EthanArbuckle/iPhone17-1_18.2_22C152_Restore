@interface CMStrideCalibrationHistory
+ (BOOL)supportsSecureCoding;
- (CMStrideCalibrationHistory)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMStrideCalibrationHistory)initWithCalibrationTracks:(id)a3 rawSpeedToKValueBins:(id)a4 stepCadenceToStrideLengthBins:(id)a5;
- (CMStrideCalibrationHistory)initWithCoder:(id)a3;
- (NSArray)calibrationTracks;
- (NSArray)rawSpeedToKValueBins;
- (NSArray)stepCadenceToStrideLengthBins;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCalibrationTracks:(id)a3;
- (void)setRawSpeedToKValueBins:(id)a3;
- (void)setStepCadenceToStrideLengthBins:(id)a3;
@end

@implementation CMStrideCalibrationHistory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMStrideCalibrationHistory)initWithCoder:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CMStrideCalibrationHistory;
  v4 = [(CMStrideCalibrationHistory *)&v24 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_setWithObjects_(v5, v8, v6, v7, 0);
    v4->_calibrationTracks = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v10, v9, @"kCMStrideCalibrationHistoryCodingKeyCalibrationTracks");
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v15 = objc_msgSend_setWithObjects_(v11, v14, v12, v13, 0);
    v4->_rawSpeedToKValueBins = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v16, v15, @"kCMStrideCalibrationHistoryCodingKeyRawSpeedToKValueBins");
    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_setWithObjects_(v17, v20, v18, v19, 0);
    v4->_stepCadenceToStrideLengthBins = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v22, v21, @"kCMStrideCalibrationHistoryCodingKeyStepCadenceToStrideLengthBins");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_calibrationTracks, @"kCMStrideCalibrationHistoryCodingKeyCalibrationTracks");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_rawSpeedToKValueBins, @"kCMStrideCalibrationHistoryCodingKeyRawSpeedToKValueBins");
  stepCadenceToStrideLengthBins = self->_stepCadenceToStrideLengthBins;

  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)stepCadenceToStrideLengthBins, @"kCMStrideCalibrationHistoryCodingKeyStepCadenceToStrideLengthBins");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (id *)objc_msgSend_init(v7, v8, v9);

  v10[1] = (id)objc_msgSend_copyWithZone_(self->_calibrationTracks, v11, (uint64_t)a3);
  v10[2] = (id)objc_msgSend_copyWithZone_(self->_rawSpeedToKValueBins, v12, (uint64_t)a3);

  v10[3] = (id)objc_msgSend_copyWithZone_(self->_stepCadenceToStrideLengthBins, v13, (uint64_t)a3);
  return v10;
}

- (CMStrideCalibrationHistory)initWithCalibrationTracks:(id)a3 rawSpeedToKValueBins:(id)a4 stepCadenceToStrideLengthBins:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CMStrideCalibrationHistory;
  v8 = [(CMStrideCalibrationHistory *)&v10 init];
  if (v8)
  {
    v8->_calibrationTracks = (NSArray *)a3;
    v8->_rawSpeedToKValueBins = (NSArray *)a4;
    v8->_stepCadenceToStrideLengthBins = (NSArray *)a5;
  }
  return v8;
}

- (void)dealloc
{
  self->_calibrationTracks = 0;
  self->_rawSpeedToKValueBins = 0;

  self->_stepCadenceToStrideLengthBins = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMStrideCalibrationHistory;
  [(CMStrideCalibrationHistory *)&v3 dealloc];
}

- (NSArray)calibrationTracks
{
  return self->_calibrationTracks;
}

- (void)setCalibrationTracks:(id)a3
{
}

- (NSArray)rawSpeedToKValueBins
{
  return self->_rawSpeedToKValueBins;
}

- (void)setRawSpeedToKValueBins:(id)a3
{
}

- (NSArray)stepCadenceToStrideLengthBins
{
  return self->_stepCadenceToStrideLengthBins;
}

- (void)setStepCadenceToStrideLengthBins:(id)a3
{
}

- (id)binarySampleRepresentation
{
  objc_super v3 = (void *)MEMORY[0x192FCD2F0](self, a2);
  id v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)self, 1, 0);

  return v5;
}

- (CMStrideCalibrationHistory)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
    v19.receiver = self;
    v19.super_class = (Class)CMStrideCalibrationHistory;
    uint64_t v7 = [(CMStrideCalibrationHistory *)&v19 init];
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      uint64_t v14 = objc_msgSend_setWithObjects_(v9, v13, v10, v11, v12, 0);
      uint64_t v16 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v8, v15, v14, a3, 0);
      if (v16)
      {
        v17 = (void *)v16;

        return (CMStrideCalibrationHistory *)v17;
      }
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

@end