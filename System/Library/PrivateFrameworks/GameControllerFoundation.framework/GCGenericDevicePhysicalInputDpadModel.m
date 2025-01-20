@interface GCGenericDevicePhysicalInputDpadModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (GCGenericDevicePhysicalInputDpadModel)initWithCoder:(id)a3;
- (int64_t)sourceDownExtendedEventFieldIndex;
- (int64_t)sourceLeftExtendedEventFieldIndex;
- (int64_t)sourceRightExtendedEventFieldIndex;
- (int64_t)sourceUpExtendedEventFieldIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDevicePhysicalInputDpadModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDevicePhysicalInputDpadModel)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GCGenericDevicePhysicalInputDpadModel;
  id v3 = a3;
  v4 = [(GCGenericDevicePhysicalInputElementModel *)&v7 initWithCoder:v3];
  v4->_sourceUpExtendedEventFieldIndex = objc_msgSend(v3, "decodeIntegerForKey:", @"sourceUpExtendedEventFieldIndex", v7.receiver, v7.super_class);
  v4->_sourceDownExtendedEventFieldIndex = [v3 decodeIntegerForKey:@"sourceDownExtendedEventFieldIndex"];
  v4->_sourceLeftExtendedEventFieldIndex = [v3 decodeIntegerForKey:@"sourceLeftExtendedEventFieldIndex"];
  uint64_t v5 = [v3 decodeIntegerForKey:@"sourceRightExtendedEventFieldIndex"];

  v4->_sourceRightExtendedEventFieldIndex = v5;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GCGenericDevicePhysicalInputDpadModel;
  id v4 = a3;
  [(GCGenericDevicePhysicalInputElementModel *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCGenericDevicePhysicalInputDpadModel sourceUpExtendedEventFieldIndex](self, "sourceUpExtendedEventFieldIndex", v5.receiver, v5.super_class), @"sourceUpExtendedEventFieldIndex");
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCGenericDevicePhysicalInputDpadModel sourceDownExtendedEventFieldIndex](self, "sourceDownExtendedEventFieldIndex"), @"sourceDownExtendedEventFieldIndex");
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCGenericDevicePhysicalInputDpadModel sourceLeftExtendedEventFieldIndex](self, "sourceLeftExtendedEventFieldIndex"), @"sourceLeftExtendedEventFieldIndex");
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCGenericDevicePhysicalInputDpadModel sourceRightExtendedEventFieldIndex](self, "sourceRightExtendedEventFieldIndex"), @"sourceRightExtendedEventFieldIndex");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCGenericDevicePhysicalInputDpadModel;
  if ([(GCGenericDevicePhysicalInputElementModel *)&v11 isEqual:v4]
    && (int64_t v5 = -[GCGenericDevicePhysicalInputDpadModel sourceUpExtendedEventFieldIndex](self, "sourceUpExtendedEventFieldIndex"), v5 == [v4 sourceUpExtendedEventFieldIndex])&& (v6 = -[GCGenericDevicePhysicalInputDpadModel sourceDownExtendedEventFieldIndex](self, "sourceDownExtendedEventFieldIndex"), v6 == objc_msgSend(v4, "sourceDownExtendedEventFieldIndex"))&& (v7 = -[GCGenericDevicePhysicalInputDpadModel sourceLeftExtendedEventFieldIndex](self, "sourceLeftExtendedEventFieldIndex"), v7 == objc_msgSend(v4, "sourceLeftExtendedEventFieldIndex")))
  {
    int64_t v8 = [(GCGenericDevicePhysicalInputDpadModel *)self sourceRightExtendedEventFieldIndex];
    BOOL v9 = v8 == [v4 sourceRightExtendedEventFieldIndex];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)description
{
  return @"DPad Element";
}

- (int64_t)sourceUpExtendedEventFieldIndex
{
  return self->_sourceUpExtendedEventFieldIndex;
}

- (int64_t)sourceDownExtendedEventFieldIndex
{
  return self->_sourceDownExtendedEventFieldIndex;
}

- (int64_t)sourceLeftExtendedEventFieldIndex
{
  return self->_sourceLeftExtendedEventFieldIndex;
}

- (int64_t)sourceRightExtendedEventFieldIndex
{
  return self->_sourceRightExtendedEventFieldIndex;
}

@end