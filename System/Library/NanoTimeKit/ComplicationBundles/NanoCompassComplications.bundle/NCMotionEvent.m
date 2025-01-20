@interface NCMotionEvent
+ (id)dateFormatter;
+ (id)eventWithType:(int64_t)a3 timestamp:(id)a4 stationary:(BOOL)a5;
- (BOOL)isStationary;
- (NCMotionEvent)initWithType:(int64_t)a3 timestamp:(id)a4 stationary:(BOOL)a5;
- (NSDate)timestamp;
- (id)description;
- (int64_t)motionType;
- (void)setTimestamp:(id)a3;
@end

@implementation NCMotionEvent

+ (id)eventWithType:(int64_t)a3 timestamp:(id)a4 stationary:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = objc_alloc((Class)a1);
  v11 = objc_msgSend_initWithType_timestamp_stationary_(v9, v10, a3, (uint64_t)v8, v5);

  return v11;
}

- (NCMotionEvent)initWithType:(int64_t)a3 timestamp:(id)a4 stationary:(BOOL)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NCMotionEvent;
  v10 = [(NCMotionEvent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_timestamp, a4);
    v11->_motionType = a3;
    v11->_isStationary = a5;
  }

  return v11;
}

+ (id)dateFormatter
{
  if (qword_268920EE8 != -1) {
    dispatch_once(&qword_268920EE8, &unk_26EA48B40);
  }
  v2 = (void *)qword_268920EE0;

  return v2;
}

- (id)description
{
  BOOL v5 = (void *)MEMORY[0x263F01778];
  uint64_t v6 = objc_msgSend_motionType(self, a2, v2, v3);
  v12 = objc_msgSend_NCMotionTypeToString_(v5, v7, v6, v8);
  objc_super v13 = NSString;
  if (self->_isStationary) {
    v14 = &stru_26EA49580;
  }
  else {
    v14 = @"NOT ";
  }
  v15 = objc_msgSend_dateFormatter(NCMotionEvent, v9, v10, v11);
  v18 = objc_msgSend_stringFromDate_(v15, v16, (uint64_t)self->_timestamp, v17);
  v21 = objc_msgSend_stringWithFormat_(v13, v19, @"MotionType: %@. Device: %@Stationary. Received at %@.", v20, v12, v14, v18);

  return v21;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (int64_t)motionType
{
  return self->_motionType;
}

- (BOOL)isStationary
{
  return self->_isStationary;
}

- (void).cxx_destruct
{
}

@end