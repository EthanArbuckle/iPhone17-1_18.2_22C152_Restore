@interface CMNoMovementStateUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CMNoMovementStateUpdate)initWithCoder:(id)a3;
- (CMNoMovementStateUpdate)initWithState:(int64_t)a3 startTime:(double)a4;
- (double)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)state;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMNoMovementStateUpdate

- (CMNoMovementStateUpdate)initWithState:(int64_t)a3 startTime:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CMNoMovementStateUpdate;
  result = [(CMNoMovementStateUpdate *)&v7 init];
  if (result)
  {
    result->_state = a3;
    result->_startTime = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMNoMovementStateUpdate)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CMNoMovementStateUpdate;
  v5 = [(CMNoMovementStateUpdate *)&v9 init];
  if (v5)
  {
    v5->_state = (int)objc_msgSend_decodeIntForKey_(a3, v4, @"kCMNoMovementCodingKeyState");
    objc_msgSend_decodeDoubleForKey_(a3, v6, @"kCMNoMovementCodingKeyStartTime");
    v5->_startTime = v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInt_forKey_(a3, a2, LODWORD(self->_state), @"kCMNoMovementCodingKeyState");
  double startTime = self->_startTime;

  objc_msgSend_encodeDouble_forKey_(a3, v5, @"kCMNoMovementCodingKeyStartTime", startTime);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_state(self, v8, v9);
  objc_msgSend_startTime(self, v11, v12);

  return (id)MEMORY[0x1F4181798](v7, sel_initWithState_startTime_, v10);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v7 = objc_msgSend_state(self, v5, v6);
  if (v7 != objc_msgSend_state(a3, v8, v9)) {
    return 0;
  }
  objc_msgSend_startTime(self, v10, v11);
  double v13 = v12;
  objc_msgSend_startTime(a3, v14, v15);
  return v13 == v16;
}

- (int64_t)state
{
  return self->_state;
}

- (double)startTime
{
  return self->_startTime;
}

@end