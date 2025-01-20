@interface GCDevicePhysicalInputCapacitiveButtonElementDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GCDevicePhysicalInputCapacitiveButtonElementDescription)init;
- (GCDevicePhysicalInputCapacitiveButtonElementDescription)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)eventTouchedValueField;
- (void)encodeWithCoder:(id)a3;
- (void)setEventTouchedValueField:(unint64_t)a3;
@end

@implementation GCDevicePhysicalInputCapacitiveButtonElementDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDevicePhysicalInputCapacitiveButtonElementDescription)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCDevicePhysicalInputCapacitiveButtonElementDescription;
  result = [(GCDevicePhysicalInputButtonElementDescription *)&v3 init];
  result->_eventTouchedValueField = -1;
  return result;
}

- (GCDevicePhysicalInputCapacitiveButtonElementDescription)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GCDevicePhysicalInputCapacitiveButtonElementDescription;
  id v3 = a3;
  v4 = [(GCDevicePhysicalInputButtonElementDescription *)&v7 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeIntegerForKey:", @"eventTouchedValueField", v7.receiver, v7.super_class);

  v4->_eventTouchedValueField = v5;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GCDevicePhysicalInputCapacitiveButtonElementDescription;
  id v4 = a3;
  [(GCDevicePhysicalInputButtonElementDescription *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_eventTouchedValueField, @"eventTouchedValueField", v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GCDevicePhysicalInputCapacitiveButtonElementDescription;
  id result = [(GCDevicePhysicalInputButtonElementDescription *)&v5 copyWithZone:a3];
  *((void *)result + 9) = self->_eventTouchedValueField;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && (v7.receiver = self,
        v7.super_class = (Class)GCDevicePhysicalInputCapacitiveButtonElementDescription,
        [(GCDevicePhysicalInputButtonElementDescription *)&v7 isEqual:v4])
    && self->_eventTouchedValueField == v4[9];

  return v5;
}

- (unint64_t)eventTouchedValueField
{
  return self->_eventTouchedValueField;
}

- (void)setEventTouchedValueField:(unint64_t)a3
{
  self->_eventTouchedValueField = a3;
}

@end