@interface GCDevicePhysicalInputButtonElementDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isAnalog;
- (BOOL)isEqual:(id)a3;
- (GCDevicePhysicalInputButtonElementDescription)init;
- (GCDevicePhysicalInputButtonElementDescription)initWithCoder:(id)a3;
- (NSArray)sources;
- (float)pressedThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)eventPressedValueField;
- (void)encodeWithCoder:(id)a3;
- (void)setAnalog:(BOOL)a3;
- (void)setEventPressedValueField:(unint64_t)a3;
- (void)setPressedThreshold:(float)a3;
- (void)setSources:(id)a3;
@end

@implementation GCDevicePhysicalInputButtonElementDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDevicePhysicalInputButtonElementDescription)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCDevicePhysicalInputButtonElementDescription;
  result = [(GCDevicePhysicalInputElementDescription *)&v3 init];
  result->_analog = 0;
  result->_pressedThreshold = 0.0;
  result->_eventPressedValueField = -1;
  return result;
}

- (GCDevicePhysicalInputButtonElementDescription)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)GCDevicePhysicalInputButtonElementDescription;
  id v3 = a3;
  v4 = [(GCDevicePhysicalInputElementDescription *)&v12 initWithCoder:v3];
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v5, objc_opt_class(), 0, v12.receiver, v12.super_class);
  uint64_t v7 = [v3 decodeObjectOfClasses:v6 forKey:@"sources"];
  sources = v4->_sources;
  v4->_sources = (NSArray *)v7;

  v4->_analog = [v3 decodeBoolForKey:@"analog"];
  [v3 decodeFloatForKey:@"pressedThreshold"];
  v4->_pressedThreshold = v9;
  uint64_t v10 = [v3 decodeIntegerForKey:@"eventPressedValueField"];

  v4->_eventPressedValueField = v10;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCDevicePhysicalInputButtonElementDescription;
  id v4 = a3;
  [(GCDevicePhysicalInputElementDescription *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sources, @"sources", v6.receiver, v6.super_class);
  [v4 encodeBool:self->_analog forKey:@"analog"];
  *(float *)&double v5 = self->_pressedThreshold;
  [v4 encodeFloat:@"pressedThreshold" forKey:v5];
  [v4 encodeInteger:self->_eventPressedValueField forKey:@"eventPressedValueField"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCDevicePhysicalInputButtonElementDescription;
  id v4 = [(GCDevicePhysicalInputElementDescription *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 7, self->_sources);
  *((unsigned char *)v4 + 48) = self->_analog;
  *((_DWORD *)v4 + 13) = LODWORD(self->_pressedThreshold);
  v4[8] = self->_eventPressedValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NSArray **)a3;
  objc_opt_class();
  BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
    && (v8.receiver = self,
        v8.super_class = (Class)GCDevicePhysicalInputButtonElementDescription,
        [(GCDevicePhysicalInputElementDescription *)&v8 isEqual:v4])
    && ((sources = self->_sources, sources == v4[7]) || -[NSArray isEqual:](sources, "isEqual:"))
    && self->_analog == *((unsigned __int8 *)v4 + 48)
    && self->_pressedThreshold == *((float *)v4 + 13)
    && self->_eventPressedValueField == (void)v4[8];

  return v6;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)GCDevicePhysicalInputButtonElementDescription;
  uint64_t v3 = [(GCDevicePhysicalInputElementDescription *)&v8 description];
  id v4 = (void *)v3;
  if (self->_analog) {
    double v5 = @"analog";
  }
  else {
    double v5 = @"digital";
  }
  BOOL v6 = +[NSString stringWithFormat:@"Button %@ %#zx %@", v3, self->_eventPressedValueField, v5];

  return v6;
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
}

- (BOOL)isAnalog
{
  return self->_analog;
}

- (void)setAnalog:(BOOL)a3
{
  self->_analog = a3;
}

- (float)pressedThreshold
{
  return self->_pressedThreshold;
}

- (void)setPressedThreshold:(float)a3
{
  self->_pressedThreshold = a3;
}

- (unint64_t)eventPressedValueField
{
  return self->_eventPressedValueField;
}

- (void)setEventPressedValueField:(unint64_t)a3
{
  self->_eventPressedValueField = a3;
}

- (void).cxx_destruct
{
}

@end