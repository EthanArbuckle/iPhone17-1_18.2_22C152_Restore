@interface GCDevicePhysicalInputCapacitiveDirectionPadElementDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GCDevicePhysicalInputCapacitiveDirectionPadElementDescription)init;
- (GCDevicePhysicalInputCapacitiveDirectionPadElementDescription)initWithCoder:(id)a3;
- (NSArray)touchedSources;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)eventTouchedValueField;
- (void)encodeWithCoder:(id)a3;
- (void)setEventTouchedValueField:(unint64_t)a3;
- (void)setTouchedSources:(id)a3;
@end

@implementation GCDevicePhysicalInputCapacitiveDirectionPadElementDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDevicePhysicalInputCapacitiveDirectionPadElementDescription)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCDevicePhysicalInputCapacitiveDirectionPadElementDescription;
  result = [(GCDevicePhysicalInputClickableDirectionPadElementDescription *)&v3 init];
  result->_eventTouchedValueField = -1;
  return result;
}

- (GCDevicePhysicalInputCapacitiveDirectionPadElementDescription)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GCDevicePhysicalInputCapacitiveDirectionPadElementDescription;
  id v3 = a3;
  v4 = [(GCDevicePhysicalInputClickableDirectionPadElementDescription *)&v11 initWithCoder:v3];
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v5, objc_opt_class(), 0, v11.receiver, v11.super_class);
  uint64_t v7 = [v3 decodeObjectOfClasses:v6 forKey:@"touchedSources"];
  touchedSources = v4->_touchedSources;
  v4->_touchedSources = (NSArray *)v7;

  uint64_t v9 = [v3 decodeIntegerForKey:@"eventTouchedValueField"];
  v4->_eventTouchedValueField = v9;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GCDevicePhysicalInputCapacitiveDirectionPadElementDescription;
  id v4 = a3;
  [(GCDevicePhysicalInputClickableDirectionPadElementDescription *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_touchedSources, @"touchedSources", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_eventTouchedValueField forKey:@"eventTouchedValueField"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCDevicePhysicalInputCapacitiveDirectionPadElementDescription;
  id v4 = [(GCDevicePhysicalInputClickableDirectionPadElementDescription *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 20, self->_touchedSources);
  v4[21] = self->_eventTouchedValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
    && (v8.receiver = self,
        v8.super_class = (Class)GCDevicePhysicalInputCapacitiveDirectionPadElementDescription,
        [(GCDevicePhysicalInputClickableDirectionPadElementDescription *)&v8 isEqual:v4])
    && ((touchedSources = self->_touchedSources, touchedSources == (NSArray *)v4[20])
     || -[NSArray isEqual:](touchedSources, "isEqual:"))
    && self->_eventTouchedValueField == v4[21];

  return v6;
}

- (NSArray)touchedSources
{
  return self->_touchedSources;
}

- (void)setTouchedSources:(id)a3
{
}

- (unint64_t)eventTouchedValueField
{
  return self->_eventTouchedValueField;
}

- (void)setEventTouchedValueField:(unint64_t)a3
{
  self->_eventTouchedValueField = a3;
}

- (void).cxx_destruct
{
}

@end