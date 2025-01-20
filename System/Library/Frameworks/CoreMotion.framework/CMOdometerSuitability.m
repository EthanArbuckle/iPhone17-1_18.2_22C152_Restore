@interface CMOdometerSuitability
+ (BOOL)supportsSecureCoding;
- (BOOL)suitableForRunning;
- (BOOL)suitableForWalking;
- (CMOdometerSuitability)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMOdometerSuitability)initWithCoder:(id)a3;
- (CMOdometerSuitability)initWithStartDate:(id)a3 suitableForRunning:(BOOL)a4 suitableForWalking:(BOOL)a5;
- (NSDate)startDate;
- (NSString)description;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMOdometerSuitability

- (CMOdometerSuitability)initWithStartDate:(id)a3 suitableForRunning:(BOOL)a4 suitableForWalking:(BOOL)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CMOdometerSuitability;
  v8 = [(CMOdometerSuitability *)&v10 init];
  if (v8)
  {
    v8->_startDate = (NSDate *)a3;
    v8->_suitableForRunning = a4;
    v8->_suitableForWalking = a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMOdometerSuitability;
  [(CMOdometerSuitability *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  startDate = self->_startDate;
  BOOL suitableForRunning = self->_suitableForRunning;
  BOOL suitableForWalking = self->_suitableForWalking;

  return (id)objc_msgSend_initWithStartDate_suitableForRunning_suitableForWalking_(v7, v8, (uint64_t)startDate, suitableForRunning, suitableForWalking);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMOdometerSuitability)initWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CMOdometerSuitability;
  v4 = [(CMOdometerSuitability *)&v18 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_startDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMOdometerSuitabilityCodingKeyStartDate");
    uint64_t v7 = objc_opt_class();
    v9 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, @"kCMOdometerSuitabilityCodingKeySuitableForRunning");
    v4->_BOOL suitableForRunning = objc_msgSend_BOOLValue(v9, v10, v11);
    uint64_t v12 = objc_opt_class();
    v14 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v13, v12, @"kCMOdometerSuitabilityCodingKeySuitableForWalking");
    v4->_BOOL suitableForWalking = objc_msgSend_BOOLValue(v14, v15, v16);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_startDate, @"kCMOdometerSuitabilityCodingKeyStartDate");
  uint64_t v6 = objc_msgSend_numberWithBool_(NSNumber, v5, self->_suitableForRunning);
  objc_msgSend_encodeObject_forKey_(a3, v7, v6, @"kCMOdometerSuitabilityCodingKeySuitableForRunning");
  uint64_t v10 = objc_msgSend_numberWithBool_(NSNumber, v8, self->_suitableForWalking);

  objc_msgSend_encodeObject_forKey_(a3, v9, v10, @"kCMOdometerSuitabilityCodingKeySuitableForWalking");
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v7 = "true";
  if (self->_suitableForRunning) {
    v8 = "true";
  }
  else {
    v8 = "false";
  }
  if (!self->_suitableForWalking) {
    uint64_t v7 = "false";
  }
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v6, @"%@,<startDate %@, suitableForRunning %s, suitableForWalking %s>", v5, self->_startDate, v8, v7);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (BOOL)suitableForRunning
{
  return self->_suitableForRunning;
}

- (BOOL)suitableForWalking
{
  return self->_suitableForWalking;
}

- (id)binarySampleRepresentation
{
  objc_super v3 = (void *)MEMORY[0x192FCD2F0](self, a2);
  id v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)self, 1, 0);

  return v5;
}

- (CMOdometerSuitability)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (!objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5)) {
    return 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)CMOdometerSuitability;
  uint64_t v7 = [(CMOdometerSuitability *)&v14 init];
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v9 = objc_opt_class();
    uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v8, v10, v9, a3, 0);
    if (v11)
    {
      uint64_t v12 = (void *)v11;

      return (CMOdometerSuitability *)v12;
    }
  }
  return v7;
}

@end