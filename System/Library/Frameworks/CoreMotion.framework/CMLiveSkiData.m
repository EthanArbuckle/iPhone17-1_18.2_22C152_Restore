@interface CMLiveSkiData
+ (BOOL)supportsSecureCoding;
- (CMLiveSkiData)initWithCoder:(id)a3;
- (CMLiveSkiData)initWithDate:(id)a3 distance:(double)a4 averageSpeed:(double)a5 verticalDescent:(double)a6 runCount:(int)a7 maximumSpeed:(double)a8;
- (NSDate)date;
- (double)averageSpeed;
- (double)distance;
- (double)maximumSpeed;
- (double)verticalDescent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)runCount;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMLiveSkiData

- (CMLiveSkiData)initWithDate:(id)a3 distance:(double)a4 averageSpeed:(double)a5 verticalDescent:(double)a6 runCount:(int)a7 maximumSpeed:(double)a8
{
  if (!a3)
  {
    v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"CMLiveSkiData.mm", 33, @"Invalid parameter not satisfying: %@", @"date");
  }
  v20.receiver = self;
  v20.super_class = (Class)CMLiveSkiData;
  v15 = [(CMLiveSkiData *)&v20 init];
  if (v15)
  {
    v15->_date = (NSDate *)a3;
    v15->_distance = a4;
    v15->_averageSpeed = a5;
    v15->_verticalDescent = a6;
    v15->_runCount = a7;
    v15->_maximumSpeed = a8;
  }
  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMLiveSkiData;
  [(CMLiveSkiData *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLiveSkiData)initWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CMLiveSkiData;
  v4 = [(CMLiveSkiData *)&v17 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_date = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMLiveSkiDataCodingKeyDate");
    objc_msgSend_decodeDoubleForKey_(a3, v7, @"kCMLiveSkiDataCodingKeyDistance");
    v4->_distance = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v9, @"kCMLiveSkiDataCodingKeyAverageSpeed");
    v4->_averageSpeed = v10;
    objc_msgSend_decodeDoubleForKey_(a3, v11, @"kCMLiveSkiDataCodingKeyVerticalDescent");
    v4->_verticalDescent = v12;
    v4->_runCount = objc_msgSend_decodeIntForKey_(a3, v13, @"kCMLiveSkiDataCodingKeyRunCount");
    objc_msgSend_decodeDoubleForKey_(a3, v14, @"kCMLiveSkiDataCodingKeyMaximumSpeed");
    v4->_maximumSpeed = v15;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  date = self->_date;

  return (id)MEMORY[0x1F4181798](v7, sel_initWithDate_distance_averageSpeed_verticalDescent_runCount_maximumSpeed_, date);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_date, @"kCMLiveSkiDataCodingKeyDate");
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"kCMLiveSkiDataCodingKeyDistance", self->_distance);
  objc_msgSend_encodeDouble_forKey_(a3, v6, @"kCMLiveSkiDataCodingKeyAverageSpeed", self->_averageSpeed);
  objc_msgSend_encodeDouble_forKey_(a3, v7, @"kCMLiveSkiDataCodingKeyVerticalDescent", self->_verticalDescent);
  objc_msgSend_encodeInt_forKey_(a3, v8, self->_runCount, @"kCMLiveSkiDataCodingKeyRunCount");
  double maximumSpeed = self->_maximumSpeed;

  objc_msgSend_encodeDouble_forKey_(a3, v9, @"kCMLiveSkiDataCodingKeyMaximumSpeed", maximumSpeed);
}

- (NSDate)date
{
  return self->_date;
}

- (double)distance
{
  return self->_distance;
}

- (double)averageSpeed
{
  return self->_averageSpeed;
}

- (double)verticalDescent
{
  return self->_verticalDescent;
}

- (unint64_t)runCount
{
  return self->_runCount;
}

- (double)maximumSpeed
{
  return self->_maximumSpeed;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_date(self, v6, v7);
  objc_msgSend_distance(self, v9, v10);
  uint64_t v12 = v11;
  objc_msgSend_averageSpeed(self, v13, v14);
  uint64_t v16 = v15;
  objc_msgSend_verticalDescent(self, v17, v18);
  uint64_t v20 = v19;
  uint64_t v23 = objc_msgSend_runCount(self, v21, v22);
  objc_msgSend_maximumSpeed(self, v24, v25);
  return (id)objc_msgSend_stringWithFormat_(v3, v26, @"%@, <date %@, distance %.2f, averageSpeed %.2f, verticalDescent %.2f, runCount %lu, maxSpeed %.2f>", v5, v8, v12, v16, v20, v23, v27);
}

@end