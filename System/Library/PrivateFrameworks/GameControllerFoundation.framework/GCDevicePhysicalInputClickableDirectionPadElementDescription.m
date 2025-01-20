@interface GCDevicePhysicalInputClickableDirectionPadElementDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GCDevicePhysicalInputClickableDirectionPadElementDescription)init;
- (GCDevicePhysicalInputClickableDirectionPadElementDescription)initWithCoder:(id)a3;
- (NSArray)pressedSources;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)eventPressedValueField;
- (void)encodeWithCoder:(id)a3;
- (void)setEventPressedValueField:(unint64_t)a3;
- (void)setPressedSources:(id)a3;
@end

@implementation GCDevicePhysicalInputClickableDirectionPadElementDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDevicePhysicalInputClickableDirectionPadElementDescription)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCDevicePhysicalInputClickableDirectionPadElementDescription;
  result = [(GCDevicePhysicalInputDirectionPadElementDescription *)&v3 init];
  result->_eventPressedValueField = -1;
  return result;
}

- (GCDevicePhysicalInputClickableDirectionPadElementDescription)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GCDevicePhysicalInputClickableDirectionPadElementDescription;
  id v3 = a3;
  v4 = [(GCDevicePhysicalInputDirectionPadElementDescription *)&v11 initWithCoder:v3];
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v5, objc_opt_class(), 0, v11.receiver, v11.super_class);
  uint64_t v7 = [v3 decodeObjectOfClasses:v6 forKey:@"pressedSources"];
  pressedSources = v4->_pressedSources;
  v4->_pressedSources = (NSArray *)v7;

  uint64_t v9 = [v3 decodeIntegerForKey:@"eventPressedValueField"];
  v4->_eventPressedValueField = v9;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GCDevicePhysicalInputClickableDirectionPadElementDescription;
  id v4 = a3;
  [(GCDevicePhysicalInputDirectionPadElementDescription *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_pressedSources, @"pressedSources", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_eventPressedValueField forKey:@"eventPressedValueField"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCDevicePhysicalInputClickableDirectionPadElementDescription;
  id v4 = [(GCDevicePhysicalInputDirectionPadElementDescription *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 18, self->_pressedSources);
  v4[19] = self->_eventPressedValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
    && (v8.receiver = self,
        v8.super_class = (Class)GCDevicePhysicalInputClickableDirectionPadElementDescription,
        [(GCDevicePhysicalInputDirectionPadElementDescription *)&v8 isEqual:v4])
    && ((pressedSources = self->_pressedSources, pressedSources == (NSArray *)v4[18])
     || -[NSArray isEqual:](pressedSources, "isEqual:"))
    && self->_eventPressedValueField == v4[19];

  return v6;
}

- (NSArray)pressedSources
{
  return self->_pressedSources;
}

- (void)setPressedSources:(id)a3
{
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