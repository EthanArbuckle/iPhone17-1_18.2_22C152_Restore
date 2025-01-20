@interface GCDevicePhysicalInputSwitchElementDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)canWrap;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSequential;
- (GCDevicePhysicalInputSwitchElementDescription)init;
- (GCDevicePhysicalInputSwitchElementDescription)initWithCoder:(id)a3;
- (NSArray)sources;
- (_NSRange)positionRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)eventPositionField;
- (void)encodeWithCoder:(id)a3;
- (void)setCanWrap:(BOOL)a3;
- (void)setEventPositionField:(unint64_t)a3;
- (void)setPositionRange:(_NSRange)a3;
- (void)setSequential:(BOOL)a3;
- (void)setSources:(id)a3;
@end

@implementation GCDevicePhysicalInputSwitchElementDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDevicePhysicalInputSwitchElementDescription)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCDevicePhysicalInputSwitchElementDescription;
  result = [(GCDevicePhysicalInputElementDescription *)&v3 init];
  result->_sequential = 0;
  result->_canWrap = 0;
  result->_positionRange.location = 0;
  result->_positionRange.length = 0;
  result->_eventPositionField = -1;
  return result;
}

- (GCDevicePhysicalInputSwitchElementDescription)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GCDevicePhysicalInputSwitchElementDescription;
  id v3 = a3;
  v4 = [(GCDevicePhysicalInputElementDescription *)&v11 initWithCoder:v3];
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v5, objc_opt_class(), 0, v11.receiver, v11.super_class);
  uint64_t v7 = [v3 decodeObjectOfClasses:v6 forKey:@"sources"];
  sources = v4->_sources;
  v4->_sources = (NSArray *)v7;

  v4->_sequential = [v3 decodeBoolForKey:@"sequential"];
  v4->_canWrap = [v3 decodeBoolForKey:@"canWrap"];
  v4->_positionRange.location = [v3 decodeIntegerForKey:@"positionStart"];
  v4->_positionRange.length = [v3 decodeIntegerForKey:@"positionLength"];
  uint64_t v9 = [v3 decodeIntegerForKey:@"eventPositionField"];

  v4->_eventPositionField = v9;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCDevicePhysicalInputSwitchElementDescription;
  id v4 = a3;
  [(GCDevicePhysicalInputElementDescription *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sources, @"sources", v6.receiver, v6.super_class);
  [v4 encodeBool:self->_sequential forKey:@"sequential"];
  double v5 = 0.0;
  if (self->_canWrap) {
    *(float *)&double v5 = 1.0;
  }
  [v4 encodeFloat:@"canWrap" forKey:v5];
  [v4 encodeInteger:self->_positionRange.location forKey:@"positionStart"];
  [v4 encodeInteger:self->_positionRange.length forKey:@"positionLength"];
  [v4 encodeInteger:self->_eventPositionField forKey:@"eventPositionField"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCDevicePhysicalInputSwitchElementDescription;
  id v4 = [(GCDevicePhysicalInputElementDescription *)&v6 copyWithZone:a3];
  objc_storeStrong((id *)v4 + 7, self->_sources);
  v4[48] = self->_sequential;
  v4[49] = self->_canWrap;
  *(_NSRange *)(v4 + 72) = self->_positionRange;
  *((void *)v4 + 8) = self->_eventPositionField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NSArray **)a3;
  objc_opt_class();
  BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
    && (v8.receiver = self,
        v8.super_class = (Class)GCDevicePhysicalInputSwitchElementDescription,
        [(GCDevicePhysicalInputElementDescription *)&v8 isEqual:v4])
    && ((sources = self->_sources, sources == v4[7]) || -[NSArray isEqual:](sources, "isEqual:"))
    && self->_sequential == *((unsigned __int8 *)v4 + 48)
    && self->_canWrap == *((unsigned __int8 *)v4 + 49)
    && (NSArray *)self->_positionRange.location == v4[9]
    && (NSArray *)self->_positionRange.length == v4[10]
    && self->_eventPositionField == (void)v4[8];

  return v6;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)GCDevicePhysicalInputSwitchElementDescription;
  uint64_t v3 = [(GCDevicePhysicalInputElementDescription *)&v9 description];
  id v4 = (void *)v3;
  if (self->_sequential) {
    double v5 = @" sequential";
  }
  else {
    double v5 = &stru_26BED82A0;
  }
  if (self->_canWrap) {
    BOOL v6 = @" wraps";
  }
  else {
    BOOL v6 = &stru_26BED82A0;
  }
  uint64_t v7 = +[NSString stringWithFormat:@"Switch %@ %#zx%@%@", v3, self->_eventPositionField, v5, v6];

  return v7;
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
}

- (BOOL)isSequential
{
  return self->_sequential;
}

- (void)setSequential:(BOOL)a3
{
  self->_sequential = a3;
}

- (BOOL)canWrap
{
  return self->_canWrap;
}

- (void)setCanWrap:(BOOL)a3
{
  self->_canWrap = a3;
}

- (_NSRange)positionRange
{
  p_positionRange = &self->_positionRange;
  NSUInteger location = self->_positionRange.location;
  NSUInteger length = p_positionRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setPositionRange:(_NSRange)a3
{
  self->_positionRange = a3;
}

- (unint64_t)eventPositionField
{
  return self->_eventPositionField;
}

- (void)setEventPositionField:(unint64_t)a3
{
  self->_eventPositionField = a3;
}

- (void).cxx_destruct
{
}

@end