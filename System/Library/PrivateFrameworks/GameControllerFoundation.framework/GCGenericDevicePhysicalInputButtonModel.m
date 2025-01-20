@interface GCGenericDevicePhysicalInputButtonModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (GCGenericDevicePhysicalInputButtonModel)initWithCoder:(id)a3;
- (int64_t)sourceExtendedEventFieldIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDevicePhysicalInputButtonModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDevicePhysicalInputButtonModel)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GCGenericDevicePhysicalInputButtonModel;
  id v3 = a3;
  v4 = [(GCGenericDevicePhysicalInputElementModel *)&v7 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeIntegerForKey:", @"sourceExtendedEventFieldIndex", v7.receiver, v7.super_class);

  v4->_sourceExtendedEventFieldIndex = v5;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GCGenericDevicePhysicalInputButtonModel;
  id v4 = a3;
  [(GCGenericDevicePhysicalInputElementModel *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCGenericDevicePhysicalInputButtonModel sourceExtendedEventFieldIndex](self, "sourceExtendedEventFieldIndex", v5.receiver, v5.super_class), @"sourceExtendedEventFieldIndex");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GCGenericDevicePhysicalInputButtonModel;
  if ([(GCGenericDevicePhysicalInputElementModel *)&v8 isEqual:v4])
  {
    int64_t v5 = [(GCGenericDevicePhysicalInputButtonModel *)self sourceExtendedEventFieldIndex];
    BOOL v6 = v5 == [v4 sourceExtendedEventFieldIndex];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)description
{
  return @"Button Element";
}

- (int64_t)sourceExtendedEventFieldIndex
{
  return self->_sourceExtendedEventFieldIndex;
}

@end