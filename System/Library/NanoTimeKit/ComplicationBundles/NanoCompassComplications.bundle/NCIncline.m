@interface NCIncline
+ (NCIncline)idealizedIncline;
+ (id)newIncline:(id)a3;
+ (id)randomizedIncline;
- ($1AB5FA073B851C12C2339EC22442E995)gravity;
- (BOOL)hasReading;
- (BOOL)isEqual:(id)a3;
- (BOOL)updateHasSignificantChange:(id)a3;
- (CGPoint)horizontalOffset;
- (NCIncline)initWithNCIncline:(id)a3;
- (double)horizontalTilt;
- (double)timestamp;
- (double)verticalTilt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)orientation;
- (void)setGravity:(id)a3;
- (void)setHasReading:(BOOL)a3;
- (void)setHorizontalOffset:(CGPoint)a3;
- (void)setHorizontalTilt:(double)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setTimestamp:(double)a3;
- (void)setVerticalTilt:(double)a3;
@end

@implementation NCIncline

- (id)description
{
  BOOL hasReading = self->_hasReading;
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v9 = (void *)v6;
  if (hasReading) {
    objc_msgSend_stringWithFormat_(v4, v7, @"<%@: %p>(vertical: %f, horizontal: %f, timestamp: %f)", v8, v6, self, *(void *)&self->_verticalTilt, *(void *)&self->_horizontalTilt, *(void *)&self->_timestamp);
  }
  else {
  v10 = objc_msgSend_stringWithFormat_(v4, v7, @"<%@: %p>(no reading)", v8, v6, self);
  }

  return v10;
}

- (BOOL)updateHasSignificantChange:(id)a3
{
  if ((a3 == 0) != !self->_hasReading) {
    return 1;
  }
  objc_msgSend_gravity(a3, a2, (uint64_t)a3, v3);
  double x = self->_gravity.x;
  double y = self->_gravity.y;
  double z = self->_gravity.z;

  return sub_2375AE654(v6, v7, v8, x, y, z);
}

+ (id)newIncline:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  double v7 = v4;
  if (v3)
  {
    objc_msgSend_setHasReading_(v4, v5, 1, v6);
    objc_msgSend_gravity(v3, v8, v9, v10);
    objc_msgSend_setGravity_(v7, v11, v12, v13);
    objc_msgSend_timestamp(v3, v14, v15, v16);
    objc_msgSend_setTimestamp_(v7, v17, v18, v19);
  }

  return v7;
}

- (NCIncline)initWithNCIncline:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)NCIncline;
  double v8 = [(NCIncline *)&v49 init];
  if (v8)
  {
    objc_msgSend_gravity(v4, v5, v6, v7);
    objc_msgSend_setGravity_(v8, v9, v10, v11);
    uint64_t v15 = objc_msgSend_orientation(v4, v12, v13, v14);
    objc_msgSend_setOrientation_(v8, v16, v15, v17);
    objc_msgSend_verticalTilt(v4, v18, v19, v20);
    objc_msgSend_setVerticalTilt_(v8, v21, v22, v23);
    objc_msgSend_horizontalOffset(v4, v24, v25, v26);
    objc_msgSend_setHorizontalOffset_(v8, v27, v28, v29);
    objc_msgSend_horizontalTilt(v4, v30, v31, v32);
    objc_msgSend_setHorizontalTilt_(v8, v33, v34, v35);
    objc_msgSend_timestamp(v4, v36, v37, v38);
    objc_msgSend_setTimestamp_(v8, v39, v40, v41);
    uint64_t hasReading = objc_msgSend_hasReading(v4, v42, v43, v44);
    objc_msgSend_setHasReading_(v8, v46, hasReading, v47);
  }

  return v8;
}

- (void)setGravity:(id)a3
{
  double var1 = a3.var1;
  long double var0 = a3.var0;
  self->_gravitdouble y = ($83A9B0F16167884A9BDC45564D3E7367)a3;
  double v8 = acos(a3.var2);
  double v9 = v8 + -1.57079633;
  if (v8 + -1.57079633 < 0.0) {
    double v9 = -v9;
  }
  if (v9 <= 0.610865238)
  {
    double v18 = atan2(var0, -var1);
    objc_msgSend_setOrientation_(self, v19, 0, v20);
    double v24 = 1.57079633;
    if (v18 <= 1.57079633) {
      double v24 = v18;
    }
    double v25 = v24 * 180.0 / 3.14159265;
    BOOL v26 = v24 <= -1.57079633;
    double v27 = -90.0;
    if (!v26) {
      double v27 = v25;
    }
    objc_msgSend_setVerticalTilt_(self, v21, v22, v23, v27);
  }
  else
  {
    objc_msgSend_setOrientation_(self, v6, 1, v7);
    objc_msgSend_setHorizontalOffset_(self, v10, v11, v12, (double)-var0, var1);
    double v16 = v8 + -3.14159265;
    if (v8 <= 1.57079633) {
      double v16 = v8;
    }
    double v17 = v16 * 180.0 / 3.14159265;
    objc_msgSend_setHorizontalTilt_(self, v13, v14, v15, v17);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_gravity(v4, v5, v6, v7);
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    objc_msgSend_gravity(self, v14, v15, v16);
    BOOL v20 = !sub_2375AE654(v9, v11, v13, v17, v18, v19);
  }
  else
  {
    LOBYTE(v20) = 0;
  }

  return v20;
}

+ (NCIncline)idealizedIncline
{
  if (qword_268921078 != -1) {
    dispatch_once(&qword_268921078, &unk_26EA48B80);
  }
  v2 = (void *)qword_268921070;

  return (NCIncline *)v2;
}

+ (id)randomizedIncline
{
  v2 = objc_opt_new();
  objc_msgSend_setHasReading_(v2, v3, 1, v4);
  if (arc4random())
  {
    objc_msgSend_setOrientation_(v2, v5, 0, v6);
    uint32_t v14 = arc4random_uniform(0xB4u);
    objc_msgSend_setVerticalTilt_(v2, v15, v16, v17, (double)(v14 - 90));
  }
  else
  {
    objc_msgSend_setOrientation_(v2, v5, 1, v6);
    uint32_t v7 = arc4random_uniform(0x37u);
    objc_msgSend_setHorizontalTilt_(v2, v8, v9, v10, (double)v7);
  }
  double v18 = objc_msgSend_date(MEMORY[0x263EFF910], v11, v12, v13);
  objc_msgSend_timeIntervalSinceReferenceDate(v18, v19, v20, v21);
  objc_msgSend_setTimestamp_(v2, v22, v23, v24);

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [NCIncline alloc];

  return (id)MEMORY[0x270F9A6D0](v4, sel_initWithNCIncline_, self, v5);
}

- ($1AB5FA073B851C12C2339EC22442E995)gravity
{
  double x = self->_gravity.x;
  double y = self->_gravity.y;
  double z = self->_gravity.z;
  result.var2 = z;
  result.double var1 = y;
  result.long double var0 = x;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (double)verticalTilt
{
  return self->_verticalTilt;
}

- (void)setVerticalTilt:(double)a3
{
  self->_verticalTilt = a3;
}

- (CGPoint)horizontalOffset
{
  double x = self->_horizontalOffset.x;
  double y = self->_horizontalOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setHorizontalOffset:(CGPoint)a3
{
  self->_horizontalOffset = a3;
}

- (double)horizontalTilt
{
  return self->_horizontalTilt;
}

- (void)setHorizontalTilt:(double)a3
{
  self->_horizontalTilt = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (BOOL)hasReading
{
  return self->_hasReading;
}

- (void)setHasReading:(BOOL)a3
{
  self->_uint64_t hasReading = a3;
}

@end