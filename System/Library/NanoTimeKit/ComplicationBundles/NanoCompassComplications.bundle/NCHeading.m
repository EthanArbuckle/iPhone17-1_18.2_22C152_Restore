@interface NCHeading
+ (NCHeading)idealizedHeading;
+ (id)newHeading:(id)a3;
+ (id)newHeadingForPPT:(double)a3;
+ (id)randomizedHeading;
- (BOOL)hasReading;
- (BOOL)isAccurate;
- (BOOL)isEqual:(id)a3;
- (BOOL)updateHasSignificantChange:(id)a3;
- (NCHeading)initWithNCHeading:(id)a3;
- (double)accuracy;
- (double)heading;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAccuracy:(double)a3;
- (void)setHasReading:(BOOL)a3;
- (void)setHeading:(double)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation NCHeading

- (double)heading
{
  return self->_heading;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  objc_msgSend_heading(v4, v5, v6, v7);
  double v9 = v8;
  objc_msgSend_heading(self, v10, v11, v12);
  double v17 = v9 - v16;
  if (v17 < 0.0) {
    double v17 = -v17;
  }
  if (v17 <= 0.1)
  {
    objc_msgSend_accuracy(v4, v13, v14, v15);
    double v20 = v19;
    objc_msgSend_accuracy(self, v21, v22, v23);
    double v25 = v20 - v24;
    if (v25 < 0.0) {
      double v25 = -v25;
    }
    BOOL v18 = v25 < 0.1;
  }
  else
  {
LABEL_5:
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)isAccurate
{
  result = self->_hasReading && (double accuracy = self->_accuracy, accuracy >= 0.0) && accuracy < 180.0;
  return result;
}

- (id)description
{
  BOOL hasReading = self->_hasReading;
  id v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  double v9 = (void *)v6;
  if (hasReading) {
    objc_msgSend_stringWithFormat_(v4, v7, @"<%@: %p>(heading: %f, accuracy: %f, timestamp: %f)", v8, v6, self, *(void *)&self->_heading, *(void *)&self->_accuracy, *(void *)&self->_timestamp);
  }
  else {
  v10 = objc_msgSend_stringWithFormat_(v4, v7, @"<%@: %p>(no reading)", v8, v6, self);
  }

  return v10;
}

- (BOOL)updateHasSignificantChange:(id)a3
{
  id v4 = a3;
  uint64_t v8 = v4;
  if ((v4 == 0) != !self->_hasReading) {
    goto LABEL_5;
  }
  objc_msgSend_heading(v4, v5, v6, v7);
  double v13 = v12 - self->_heading;
  if (v13 < 0.0) {
    double v13 = -v13;
  }
  if (v13 > 0.1)
  {
LABEL_5:
    BOOL v14 = 1;
  }
  else
  {
    objc_msgSend_headingAccuracy(v8, v9, v10, v11);
    double v16 = v15 - self->_accuracy;
    if (v16 < 0.0) {
      double v16 = -v16;
    }
    BOOL v14 = v16 > 0.1;
  }

  return v14;
}

+ (id)newHeading:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v7 = v4;
  if (v3)
  {
    objc_msgSend_setHasReading_(v4, v5, 1, v6);
    objc_msgSend_heading(v3, v8, v9, v10);
    if (v14 >= 360.0) {
      double v14 = v14 + -360.0;
    }
    if (v14 < 0.0) {
      double v14 = v14 + 360.0;
    }
    objc_msgSend_setHeading_(v7, v11, v12, v13, v14);
    objc_msgSend_headingAccuracy(v3, v15, v16, v17);
    objc_msgSend_setAccuracy_(v7, v18, v19, v20);
    objc_msgSend_timestamp(v3, v21, v22, v23);
    objc_msgSend_setTimestamp_(v7, v24, v25, v26);
  }

  return v7;
}

- (NCHeading)initWithNCHeading:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)NCHeading;
  uint64_t v8 = [(NCHeading *)&v31 init];
  if (v8)
  {
    objc_msgSend_heading(v4, v5, v6, v7);
    objc_msgSend_setHeading_(v8, v9, v10, v11);
    objc_msgSend_accuracy(v4, v12, v13, v14);
    objc_msgSend_setAccuracy_(v8, v15, v16, v17);
    objc_msgSend_timestamp(v4, v18, v19, v20);
    objc_msgSend_setTimestamp_(v8, v21, v22, v23);
    uint64_t hasReading = objc_msgSend_hasReading(v4, v24, v25, v26);
    objc_msgSend_setHasReading_(v8, v28, hasReading, v29);
  }

  return v8;
}

+ (NCHeading)idealizedHeading
{
  if (qword_268921460 != -1) {
    dispatch_once(&qword_268921460, &unk_26EA48EA0);
  }
  v2 = (void *)qword_268921458;

  return (NCHeading *)v2;
}

+ (id)randomizedHeading
{
  v2 = objc_opt_new();
  objc_msgSend_setHasReading_(v2, v3, 1, v4);
  uint32_t v5 = arc4random_uniform(0x168u);
  objc_msgSend_setHeading_(v2, v6, v7, v8, (double)v5);
  uint32_t v9 = arc4random_uniform(0xB4u);
  objc_msgSend_setAccuracy_(v2, v10, v11, v12, (double)v9);

  return v2;
}

+ (id)newHeadingForPPT:(double)a3
{
  uint64_t v4 = objc_opt_new();
  objc_msgSend_setHasReading_(v4, v5, 1, v6);
  objc_msgSend_setHeading_(v4, v7, v8, v9, a3);
  objc_msgSend_setAccuracy_(v4, v10, v11, v12, 10.0);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [NCHeading alloc];

  return (id)MEMORY[0x270F9A6D0](v4, sel_initWithNCHeading_, self, v5);
}

- (void)setHeading:(double)a3
{
  self->_heading = a3;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (void)setAccuracy:(double)a3
{
  self->_double accuracy = a3;
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