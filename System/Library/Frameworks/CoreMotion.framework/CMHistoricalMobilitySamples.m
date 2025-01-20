@interface CMHistoricalMobilitySamples
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CMHistoricalMobilitySamples)init;
- (CMHistoricalMobilitySamples)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMHistoricalMobilitySamples)initWithCoder:(id)a3;
- (NSArray)gaitMetrics;
- (NSArray)predictedDistanceBouts;
- (NSArray)predictedDistanceBoutsMobilityCalibration;
- (NSArray)strideCalEntries;
- (NSArray)walkingBoutMobility;
- (NSString)description;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sr_dictionaryRepresentation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setGaitMetrics:(id)a3;
- (void)setPredictedDistanceBouts:(id)a3;
- (void)setPredictedDistanceBoutsMobilityCalibration:(id)a3;
- (void)setStrideCalEntries:(id)a3;
- (void)setWalkingBoutMobility:(id)a3;
@end

@implementation CMHistoricalMobilitySamples

- (CMHistoricalMobilitySamples)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMHistoricalMobilitySamples;
  return [(CMHistoricalMobilitySamples *)&v3 init];
}

- (void)dealloc
{
  walkingBoutMobility = self->_walkingBoutMobility;
  if (walkingBoutMobility) {

  }
  strideCalEntries = self->_strideCalEntries;
  if (strideCalEntries) {

  }
  predictedDistanceBouts = self->_predictedDistanceBouts;
  if (predictedDistanceBouts) {

  }
  predictedDistanceBoutsMobilityCalibration = self->_predictedDistanceBoutsMobilityCalibration;
  if (predictedDistanceBoutsMobilityCalibration) {

  }
  gaitMetrics = self->_gaitMetrics;
  if (gaitMetrics) {

  }
  v8.receiver = self;
  v8.super_class = (Class)CMHistoricalMobilitySamples;
  [(CMHistoricalMobilitySamples *)&v8 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_walkingBoutMobility, @"kCMHistoricalMobilitySamplesCodingKeyWalkingBoutMobility");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_strideCalEntries, @"kCMHistoricalMobilitySamplesCodingKeyStrideCalEntries");
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_predictedDistanceBouts, @"kCMHistoricalMobilitySamplesCodingKeyPredictedDistanceBouts");
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_predictedDistanceBoutsMobilityCalibration, @"kCMHistoricalMobilitySamplesCodingKeyPredictedDistanceBoutsMobilityCalibration");
  gaitMetrics = self->_gaitMetrics;

  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)gaitMetrics, @"kCMHistoricalMobilitySamplesCodingKeyGaitMetrics");
}

- (CMHistoricalMobilitySamples)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CMHistoricalMobilitySamples;
  v4 = [(CMHistoricalMobilitySamples *)&v16 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_walkingBoutMobility = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v6, v5, @"kCMHistoricalMobilitySamplesCodingKeyWalkingBoutMobility");
    uint64_t v7 = objc_opt_class();
    v4->_strideCalEntries = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v8, v7, @"kCMHistoricalMobilitySamplesCodingKeyStrideCalEntries");
    uint64_t v9 = objc_opt_class();
    v4->_predictedDistanceBoutsMobilityCalibration = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v10, v9, @"kCMHistoricalMobilitySamplesCodingKeyPredictedDistanceBoutsMobilityCalibration");
    uint64_t v11 = objc_opt_class();
    v4->_predictedDistanceBouts = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v12, v11, @"kCMHistoricalMobilitySamplesCodingKeyPredictedDistanceBouts");
    uint64_t v13 = objc_opt_class();
    v4->_gaitMetrics = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v14, v13, @"kCMHistoricalMobilitySamplesCodingKeyGaitMetrics");
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v10[1] = objc_msgSend_copy(self->_walkingBoutMobility, v11, v12);
  v10[2] = objc_msgSend_copy(self->_strideCalEntries, v13, v14);
  v10[4] = objc_msgSend_copy(self->_predictedDistanceBouts, v15, v16);
  v10[3] = objc_msgSend_copy(self->_predictedDistanceBoutsMobilityCalibration, v17, v18);
  v10[5] = objc_msgSend_copy(self->_gaitMetrics, v19, v20);
  return v10;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_walkingBoutMobility(self, v6, v7);
  uint64_t v11 = objc_msgSend_strideCalEntries(self, v9, v10);
  uint64_t v14 = objc_msgSend_predictedDistanceBouts(self, v12, v13);
  uint64_t v17 = objc_msgSend_predictedDistanceBoutsMobilityCalibration(self, v15, v16);
  uint64_t v20 = objc_msgSend_gaitMetrics(self, v18, v19);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v21, @"%@, <walkingBoutMobility, %@, strideCalEntries, %@, predictedDistanceBouts, %@, predictedDistanceBoutsMobilityCalibration, %@, gaitMetrics, %@>", v5, v8, v11, v14, v17, v20);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v7 = objc_msgSend_walkingBoutMobility(self, v5, v6);
  uint64_t v10 = objc_msgSend_walkingBoutMobility(a3, v8, v9);
  if (!objc_msgSend_isEqualToArray_(v7, v11, v10)) {
    return 0;
  }
  uint64_t v14 = objc_msgSend_strideCalEntries(self, v12, v13);
  uint64_t v17 = objc_msgSend_strideCalEntries(a3, v15, v16);
  if (!objc_msgSend_isEqualToArray_(v14, v18, v17)) {
    return 0;
  }
  v21 = objc_msgSend_predictedDistanceBouts(self, v19, v20);
  uint64_t v24 = objc_msgSend_predictedDistanceBouts(a3, v22, v23);
  if (!objc_msgSend_isEqualToArray_(v21, v25, v24)) {
    return 0;
  }
  v28 = objc_msgSend_predictedDistanceBoutsMobilityCalibration(self, v26, v27);
  uint64_t v31 = objc_msgSend_predictedDistanceBoutsMobilityCalibration(a3, v29, v30);
  if (!objc_msgSend_isEqualToArray_(v28, v32, v31)) {
    return 0;
  }
  v35 = objc_msgSend_gaitMetrics(self, v33, v34);
  uint64_t v39 = objc_msgSend_gaitMetrics(a3, v36, v37);

  return objc_msgSend_isEqualToArray_(v35, v38, v39);
}

- (NSArray)walkingBoutMobility
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWalkingBoutMobility:(id)a3
{
}

- (NSArray)strideCalEntries
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStrideCalEntries:(id)a3
{
}

- (NSArray)predictedDistanceBoutsMobilityCalibration
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPredictedDistanceBoutsMobilityCalibration:(id)a3
{
}

- (NSArray)predictedDistanceBouts
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPredictedDistanceBouts:(id)a3
{
}

- (NSArray)gaitMetrics
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setGaitMetrics:(id)a3
{
}

- (id)binarySampleRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  v2 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], a2, (uint64_t)self, 1, &v10);
  if (v10)
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFD2860);
    }
    objc_super v3 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v5;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_ERROR, "Failed to archive %{public}@ object: %{public}@", buf, 0x16u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFD2860);
      }
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      int v11 = 138543618;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      uint64_t v9 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalMobilitySamples(SensorKit) binarySampleRepresentation]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
  return v2;
}

- (CMHistoricalMobilitySamples)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
LABEL_9:

    return 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)CMHistoricalMobilitySamples;
  self = [(CMHistoricalMobilitySamples *)&v20 init];
  if (self)
  {
    uint64_t v19 = 0;
    uint64_t v7 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v8 = objc_opt_class();
    uint64_t v10 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, a3, &v19);
    if (v19)
    {
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFD2860);
      }
      int v11 = qword_1E929DA00;
      if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = (objc_class *)objc_opt_class();
        __int16 v13 = NSStringFromClass(v12);
        *(_DWORD *)buf = 138543618;
        v26 = v13;
        __int16 v27 = 2114;
        uint64_t v28 = v19;
        _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_ERROR, "Failed to unarchive %{public}@: %{public}@", buf, 0x16u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D9F8 != -1) {
          dispatch_once(&qword_1E929D9F8, &unk_1EDFD2860);
        }
        uint64_t v16 = (objc_class *)objc_opt_class();
        __int16 v17 = NSStringFromClass(v16);
        int v21 = 138543618;
        v22 = v17;
        __int16 v23 = 2114;
        uint64_t v24 = v19;
        uint64_t v18 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalMobilitySamples(SensorKit) initWithBinarySampleRepresentation:metadata:timestamp:]", "CoreLocation: %s\n", v18);
        if (v18 != (char *)buf) {
          free(v18);
        }
      }
      goto LABEL_9;
    }
    v15 = (void *)v10;
    if (v10)
    {

      return (CMHistoricalMobilitySamples *)v15;
    }
  }
  return self;
}

- (id)sr_dictionaryRepresentation
{
  v30[5] = *MEMORY[0x1E4F143B8];
  v29[0] = @"walkingBoutMobility";
  v4 = objc_msgSend_walkingBoutMobility(self, a2, v2);
  v30[0] = sub_1905984A0(v4, v5, v6);
  v29[1] = @"strideCalEntries";
  uint64_t v9 = objc_msgSend_strideCalEntries(self, v7, v8);
  v30[1] = sub_1905984A0(v9, v10, v11);
  v29[2] = @"predictedDistanceBoutsMobilityCalibration";
  uint64_t v14 = objc_msgSend_predictedDistanceBoutsMobilityCalibration(self, v12, v13);
  v30[2] = sub_1905984A0(v14, v15, v16);
  v29[3] = @"predictedDistanceBouts";
  uint64_t v19 = objc_msgSend_predictedDistanceBouts(self, v17, v18);
  v30[3] = sub_1905984A0(v19, v20, v21);
  v29[4] = @"gaitMetrics";
  uint64_t v24 = objc_msgSend_gaitMetrics(self, v22, v23);
  v30[4] = sub_1905984A0(v24, v25, v26);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v27, (uint64_t)v30, v29, 5);
}

@end