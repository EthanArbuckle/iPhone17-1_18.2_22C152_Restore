@interface CTEmergencyMode
+ (BOOL)supportsSecureCoding;
+ (id)convertFromEmergencyMode:(const EmergencyMode *)a3;
- (BOOL)enabled;
- (BOOL)isEmergencySetup;
- (BOOL)isEmergencyText;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTEmergencyMode:(id)a3;
- (BOOL)isStewieActive;
- (CTEmergencyMode)init;
- (CTEmergencyMode)initWithCoder:(id)a3;
- (CTEmergencyMode)initWithEnabled:(BOOL)a3 type:(int64_t)a4 isEmergencyText:(BOOL)a5;
- (CTEmergencyMode)initWithEnabled:(BOOL)a3 type:(int64_t)a4 isEmergencyText:(BOOL)a5 isEmergencySetup:(BOOL)a6;
- (CTEmergencyMode)initWithEnabled:(BOOL)a3 type:(int64_t)a4 isEmergencyText:(BOOL)a5 isEmergencySetup:(BOOL)a6 isStewieActive:(BOOL)a7;
- (CTEmergencyMode)initWithEnabled:(BOOL)a3 type:(int64_t)a4 isEmergencyText:(BOOL)a5 isEmergencySetup:(BOOL)a6 isStewieActive:(BOOL)a7 state:(int64_t)a8;
- (CTEmergencyMode)initWithEnabled:(BOOL)a3 type:(int64_t)a4 isEmergencyText:(BOOL)a5 isEmergencySetup:(BOOL)a6 state:(int64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)state;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIsEmergencySetup:(BOOL)a3;
- (void)setIsEmergencyText:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CTEmergencyMode

- (CTEmergencyMode)initWithEnabled:(BOOL)a3 type:(int64_t)a4 isEmergencyText:(BOOL)a5 isEmergencySetup:(BOOL)a6 isStewieActive:(BOOL)a7 state:(int64_t)a8
{
  v15.receiver = self;
  v15.super_class = (Class)CTEmergencyMode;
  result = [(CTEmergencyMode *)&v15 init];
  if (result)
  {
    result->_enabled = a3;
    result->_isEmergencyText = a5;
    result->_isEmergencySetup = a6;
    result->_isStewieActive = a7;
    result->_type = a4;
    result->_state = a8;
  }
  return result;
}

- (CTEmergencyMode)initWithEnabled:(BOOL)a3 type:(int64_t)a4 isEmergencyText:(BOOL)a5 isEmergencySetup:(BOOL)a6 state:(int64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)CTEmergencyMode;
  result = [(CTEmergencyMode *)&v13 init];
  if (result)
  {
    result->_enabled = a3;
    result->_isEmergencyText = a5;
    result->_isEmergencySetup = a6;
    result->_isStewieActive = 0;
    result->_type = a4;
    result->_state = a7;
  }
  return result;
}

- (CTEmergencyMode)initWithEnabled:(BOOL)a3 type:(int64_t)a4 isEmergencyText:(BOOL)a5 isEmergencySetup:(BOOL)a6 isStewieActive:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)CTEmergencyMode;
  result = [(CTEmergencyMode *)&v13 init];
  if (result)
  {
    result->_enabled = a3;
    result->_isEmergencyText = a5;
    result->_isEmergencySetup = a6;
    result->_isStewieActive = a7;
    result->_type = a4;
    result->_state = 5;
  }
  return result;
}

- (CTEmergencyMode)initWithEnabled:(BOOL)a3 type:(int64_t)a4 isEmergencyText:(BOOL)a5 isEmergencySetup:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)CTEmergencyMode;
  result = [(CTEmergencyMode *)&v11 init];
  if (result)
  {
    result->_enabled = a3;
    result->_isEmergencyText = a5;
    result->_isEmergencySetup = a6;
    result->_isStewieActive = 0;
    result->_type = a4;
    result->_state = 5;
  }
  return result;
}

- (CTEmergencyMode)initWithEnabled:(BOOL)a3 type:(int64_t)a4 isEmergencyText:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CTEmergencyMode;
  result = [(CTEmergencyMode *)&v9 init];
  if (result)
  {
    result->_enabled = a3;
    result->_isEmergencyText = a5;
    *(_WORD *)&result->_isEmergencySetup = 1;
    result->_type = a4;
    result->_state = 5;
  }
  return result;
}

- (CTEmergencyMode)init
{
  return [(CTEmergencyMode *)self initWithEnabled:0 type:0 isEmergencyText:0 isEmergencySetup:1 isStewieActive:0 state:5];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  BOOL v4 = [(CTEmergencyMode *)self enabled];
  v5 = "disabled";
  if (v4) {
    v5 = "enabled";
  }
  objc_msgSend(v3, "appendFormat:", @" %s", v5);
  if ([(CTEmergencyMode *)self isEmergencyText]) {
    v6 = "true";
  }
  else {
    v6 = "false";
  }
  objc_msgSend(v3, "appendFormat:", @" isEmergencyText=%s", v6);
  if ([(CTEmergencyMode *)self isEmergencySetup]) {
    v7 = "true";
  }
  else {
    v7 = "false";
  }
  objc_msgSend(v3, "appendFormat:", @" isEmergencySetup=%s", v7);
  if (_os_feature_enabled_impl())
  {
    if ([(CTEmergencyMode *)self isStewieActive]) {
      v8 = "true";
    }
    else {
      v8 = "false";
    }
    objc_msgSend(v3, "appendFormat:", @" isStewieActive=%s", v8);
  }
  int64_t v9 = [(CTEmergencyMode *)self type];
  if ((unint64_t)(v9 - 1) > 4) {
    v10 = "CTEmergencyModeUnknown";
  }
  else {
    v10 = off_1E5265100[v9 - 1];
  }
  objc_msgSend(v3, "appendFormat:", @" type=%s", v10);
  int64_t v11 = [(CTEmergencyMode *)self state];
  if ((unint64_t)(v11 - 1) > 4) {
    v12 = "CTEmergencyModeStateInCall";
  }
  else {
    v12 = off_1E5265128[v11 - 1];
  }
  objc_msgSend(v3, "appendFormat:", @" state=%s", v12);
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTEmergencyMode:(id)a3
{
  id v4 = a3;
  if (v4
    && (int v5 = -[CTEmergencyMode enabled](self, "enabled"), v5 == [v4 enabled])
    && (int64_t v6 = -[CTEmergencyMode type](self, "type"), v6 == [v4 type])
    && (int v7 = [(CTEmergencyMode *)self isEmergencyText],
        v7 == [v4 isEmergencyText])
    && (int v8 = [(CTEmergencyMode *)self isEmergencySetup],
        v8 == [v4 isEmergencySetup])
    && (int v9 = [(CTEmergencyMode *)self isStewieActive],
        v9 == [v4 isStewieActive]))
  {
    int64_t v12 = [(CTEmergencyMode *)self state];
    BOOL v10 = v12 == [v4 state];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTEmergencyMode *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTEmergencyMode *)self isEqualToCTEmergencyMode:v4];
  }

  return v5;
}

+ (id)convertFromEmergencyMode:(const EmergencyMode *)a3
{
  id v4 = objc_alloc((Class)a1);
  uint64_t v5 = (a3->var0 - 1);
  if (v5 < 5) {
    uint64_t v6 = v5 + 1;
  }
  else {
    uint64_t v6 = 0;
  }
  int var2 = a3->var2;
  uint64_t v8 = (var2 - 1);
  if (v8 < 5) {
    uint64_t v9 = v8 + 1;
  }
  else {
    uint64_t v9 = 0;
  }
  BOOL v10 = (void *)[v4 initWithEnabled:var2 != 5 type:v6 isEmergencyText:var2 == 3 isEmergencySetup:a3->var3 == 1 isStewieActive:a3->var4 state:v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(CTEmergencyMode *)self enabled];
  int64_t v6 = [(CTEmergencyMode *)self type];
  BOOL v7 = [(CTEmergencyMode *)self isEmergencyText];
  BOOL v8 = [(CTEmergencyMode *)self isEmergencySetup];
  BOOL v9 = [(CTEmergencyMode *)self isStewieActive];
  int64_t v10 = [(CTEmergencyMode *)self state];

  return (id)[v4 initWithEnabled:v5 type:v6 isEmergencyText:v7 isEmergencySetup:v8 isStewieActive:v9 state:v10];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBool:self->_enabled forKey:@"enabled"];
  [v4 encodeInteger:self->_type forKey:@"type"];
  [v4 encodeBool:self->_isEmergencyText forKey:@"isEmergencyText"];
  [v4 encodeBool:self->_isEmergencySetup forKey:@"isEmergencySetup"];
  [v4 encodeBool:self->_isStewieActive forKey:@"isStewieActiveKey"];
  [v4 encodeInteger:self->_state forKey:@"state"];
}

- (CTEmergencyMode)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[CTEmergencyMode initWithEnabled:type:isEmergencyText:isEmergencySetup:isStewieActive:state:](self, "initWithEnabled:type:isEmergencyText:isEmergencySetup:isStewieActive:state:", [v4 decodeBoolForKey:@"enabled"], objc_msgSend(v4, "decodeIntegerForKey:", @"type"), objc_msgSend(v4, "decodeBoolForKey:", @"isEmergencyText"), objc_msgSend(v4, "decodeBoolForKey:", @"isEmergencySetup"), objc_msgSend(v4, "decodeBoolForKey:", @"isStewieActiveKey"), objc_msgSend(v4, "decodeIntegerForKey:", @"state"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)isEmergencyText
{
  return self->_isEmergencyText;
}

- (void)setIsEmergencyText:(BOOL)a3
{
  self->_isEmergencyText = a3;
}

- (BOOL)isEmergencySetup
{
  return self->_isEmergencySetup;
}

- (void)setIsEmergencySetup:(BOOL)a3
{
  self->_isEmergencySetup = a3;
}

- (BOOL)isStewieActive
{
  return self->_isStewieActive;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end