@interface CMAnomalyEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isAcknowledgement;
- (CMAnomalyEvent)initWithCoder:(id)a3;
- (CMAnomalyEvent)initWithIdentifier:(unint64_t)a3 absoluteTimestamp:(double)a4 updateTimestamp:(double)a5 state:(int64_t)a6 response:(int64_t)a7 resolution:(int64_t)a8 sosState:(int64_t)a9 operatingMode:(int64_t)a10;
- (CMAnomalyEvent)initWithIdentifier:(unint64_t)a3 absoluteTimestamp:(double)a4 updateTimestamp:(double)a5 state:(int64_t)a6 response:(int64_t)a7 resolution:(int64_t)a8 sosState:(int64_t)a9 operatingMode:(int64_t)a10 acknowledgement:(BOOL)a11;
- (NSDate)date;
- (NSDate)updateDate;
- (double)absoluteTimestamp;
- (double)updateTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)operatingMode;
- (int64_t)resolution;
- (int64_t)response;
- (int64_t)sosState;
- (int64_t)state;
- (unint64_t)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setAcknowledgement:(BOOL)a3;
- (void)setOperatingMode:(int64_t)a3;
- (void)setResolution:(int64_t)a3;
- (void)setResponse:(int64_t)a3;
- (void)setSosState:(int64_t)a3;
- (void)setUpdateTimestamp:(double)a3;
@end

@implementation CMAnomalyEvent

- (CMAnomalyEvent)initWithIdentifier:(unint64_t)a3 absoluteTimestamp:(double)a4 updateTimestamp:(double)a5 state:(int64_t)a6 response:(int64_t)a7 resolution:(int64_t)a8 sosState:(int64_t)a9 operatingMode:(int64_t)a10
{
  v19.receiver = self;
  v19.super_class = (Class)CMAnomalyEvent;
  result = [(CMAnomalyEvent *)&v19 init];
  if (result)
  {
    result->_absoluteTimestamp = a4;
    result->_updateTimestamp = a5;
    result->_state = a6;
    result->_response = a7;
    result->_resolution = a8;
    result->_acknowledgement = 0;
    result->_identifier = a3;
    result->_sosState = a9;
    result->_operatingMode = a10;
  }
  return result;
}

- (CMAnomalyEvent)initWithIdentifier:(unint64_t)a3 absoluteTimestamp:(double)a4 updateTimestamp:(double)a5 state:(int64_t)a6 response:(int64_t)a7 resolution:(int64_t)a8 sosState:(int64_t)a9 operatingMode:(int64_t)a10 acknowledgement:(BOOL)a11
{
  result = (CMAnomalyEvent *)objc_msgSend_initWithIdentifier_absoluteTimestamp_updateTimestamp_state_response_resolution_sosState_operatingMode_(self, a2, a3, a6, a7, a8, a9, a10, a4, a5);
  if (result) {
    result->_acknowledgement = a11;
  }
  return result;
}

- (CMAnomalyEvent)initWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CMAnomalyEvent;
  v5 = [(CMAnomalyEvent *)&v17 init];
  if (v5)
  {
    v5->_identifier = objc_msgSend_decodeInt64ForKey_(a3, v4, @"kCMAnomalyEventAopTimestamp");
    objc_msgSend_decodeDoubleForKey_(a3, v6, @"kCMAnomalyEventAbsTimestamp");
    v5->_absoluteTimestamp = v7;
    objc_msgSend_decodeDoubleForKey_(a3, v8, @"kCMAnomalyEventUpdTimestamp");
    v5->_updateTimestamp = v9;
    v5->_state = objc_msgSend_decodeIntegerForKey_(a3, v10, @"kCMAnomalyEventState");
    v5->_response = objc_msgSend_decodeIntegerForKey_(a3, v11, @"kCMAnomalyEventResponse");
    v5->_resolution = objc_msgSend_decodeIntegerForKey_(a3, v12, @"kCMAnomalyEventResolution");
    v5->_acknowledgement = objc_msgSend_decodeBoolForKey_(a3, v13, @"kCMAnomalyEventIsAcknowledged");
    v5->_sosState = objc_msgSend_decodeIntegerForKey_(a3, v14, @"kCMAnomalyEventSOSState");
    v5->_operatingMode = objc_msgSend_decodeIntegerForKey_(a3, v15, @"kCMAnomalyEventOperatingMode");
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  double v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  BOOL acknowledgement = self->_acknowledgement;
  return (id)objc_msgSend_initWithIdentifier_absoluteTimestamp_updateTimestamp_state_response_resolution_sosState_operatingMode_acknowledgement_(v7, v8, self->_identifier, self->_state, self->_response, self->_resolution, self->_sosState, self->_operatingMode, self->_absoluteTimestamp, self->_updateTimestamp, acknowledgement);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInt64_forKey_(a3, a2, self->_identifier, @"kCMAnomalyEventAopTimestamp");
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"kCMAnomalyEventAbsTimestamp", self->_absoluteTimestamp);
  objc_msgSend_encodeDouble_forKey_(a3, v6, @"kCMAnomalyEventUpdTimestamp", self->_updateTimestamp);
  objc_msgSend_encodeInteger_forKey_(a3, v7, self->_state, @"kCMAnomalyEventState");
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->_response, @"kCMAnomalyEventResponse");
  objc_msgSend_encodeInteger_forKey_(a3, v9, self->_resolution, @"kCMAnomalyEventResolution");
  objc_msgSend_encodeBool_forKey_(a3, v10, self->_acknowledgement, @"kCMAnomalyEventIsAcknowledged");
  objc_msgSend_encodeInteger_forKey_(a3, v11, self->_sosState, @"kCMAnomalyEventSOSState");
  int64_t operatingMode = self->_operatingMode;

  objc_msgSend_encodeInteger_forKey_(a3, v12, operatingMode, @"kCMAnomalyEventOperatingMode");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)date
{
  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], a2, v2, self->_absoluteTimestamp);
}

- (NSDate)updateDate
{
  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], a2, v2, self->_updateTimestamp);
}

- (id)debugDescription
{
  unint64_t v3 = self->_state - 1;
  if (v3 > 2) {
    v4 = @"Undefined";
  }
  else {
    v4 = off_1E568F4D8[v3];
  }
  unint64_t response = self->_response;
  if (response > 5) {
    v6 = @"Undefined";
  }
  else {
    v6 = off_1E568F4F0[response];
  }
  unint64_t resolution = self->_resolution;
  if (resolution > 2) {
    v8 = @"Undefined";
  }
  else {
    v8 = off_1E568F520[resolution];
  }
  unint64_t sosState = self->_sosState;
  if (sosState > 4) {
    v10 = @"Undefined";
  }
  else {
    v10 = off_1E568F538[sosState];
  }
  v11 = NSString;
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  uint64_t v16 = objc_msgSend_date(self, v14, v15);
  return (id)objc_msgSend_stringWithFormat_(v11, v17, @"%@,<date %@ identifier %llu state %@ response %@ resolution %@ absoluteTimestamp %f updated %f SOS Call %@>", v13, v16, self->_identifier, v4, v6, v8, *(void *)&self->_absoluteTimestamp, *(void *)&self->_updateTimestamp, v10);
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_date(self, v6, v7);
  return (id)objc_msgSend_stringWithFormat_(v3, v9, @"%@,<date %@ identifier %llu state %d response %d resolution %d absoluteTimestamp %f updated %f SOS Call state %d>", v5, v8, self->_identifier, self->_state, self->_response, self->_resolution, *(void *)&self->_absoluteTimestamp, *(void *)&self->_updateTimestamp, self->_sosState);
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)response
{
  return self->_response;
}

- (void)setResponse:(int64_t)a3
{
  self->_unint64_t response = a3;
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (void)setResolution:(int64_t)a3
{
  self->_unint64_t resolution = a3;
}

- (BOOL)isAcknowledgement
{
  return self->_acknowledgement;
}

- (void)setAcknowledgement:(BOOL)a3
{
  self->_BOOL acknowledgement = a3;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  self->_absoluteTimestamp = a3;
}

- (double)updateTimestamp
{
  return self->_updateTimestamp;
}

- (void)setUpdateTimestamp:(double)a3
{
  self->_updateTimestamp = a3;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (int64_t)sosState
{
  return self->_sosState;
}

- (void)setSosState:(int64_t)a3
{
  self->_unint64_t sosState = a3;
}

- (int64_t)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(int64_t)a3
{
  self->_int64_t operatingMode = a3;
}

@end