@interface GCGenericDeviceDataInputElementValueExpressionModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataInputElementValueExpressionModel)initWithCoder:(id)a3;
- (NSString)elementIdentifier;
- (id)debugDescription;
- (id)description;
- (int64_t)scaleType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceDataInputElementValueExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataInputElementValueExpressionModel)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GCGenericDeviceDataInputElementValueExpressionModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceDataProcessorExpressionModel *)&v9 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"elementIdentifier", v9.receiver, v9.super_class);
  elementIdentifier = v4->_elementIdentifier;
  v4->_elementIdentifier = (NSString *)v5;

  uint64_t v7 = [v3 decodeIntegerForKey:@"scaleType"];
  v4->_scaleType = v7;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCGenericDeviceDataInputElementValueExpressionModel;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModel *)&v6 encodeWithCoder:v4];
  uint64_t v5 = [(GCGenericDeviceDataInputElementValueExpressionModel *)self elementIdentifier];
  [v4 encodeObject:v5 forKey:@"elementIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[GCGenericDeviceDataInputElementValueExpressionModel scaleType](self, "scaleType"), @"scaleType");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataInputElementValueExpressionModel;
  if ([(GCGenericDeviceDataProcessorExpressionModel *)&v10 isEqual:v4])
  {
    uint64_t v5 = [(GCGenericDeviceDataInputElementValueExpressionModel *)self elementIdentifier];
    objc_super v6 = [v4 elementIdentifier];
    if ([v5 isEqual:v6])
    {
      int64_t v7 = [(GCGenericDeviceDataInputElementValueExpressionModel *)self scaleType];
      BOOL v8 = v7 == [v4 scaleType];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)description
{
  return @"Element Value Expression";
}

- (id)description
{
  id v3 = [(GCGenericDeviceDataInputElementValueExpressionModel *)self elementIdentifier];
  int64_t v4 = [(GCGenericDeviceDataInputElementValueExpressionModel *)self scaleType];
  if ((unint64_t)(v4 + 3) > 5) {
    uint64_t v5 = @"?";
  }
  else {
    uint64_t v5 = off_26BEC4780[v4 + 3];
  }
  objc_super v6 = +[NSString stringWithFormat:@"(element-value %@ %@)", v3, v5];

  return v6;
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  int64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [(GCGenericDeviceDataInputElementValueExpressionModel *)self elementIdentifier];
  objc_super v6 = +[NSString stringWithFormat:@"<%@ %p> {\n\t identifier = %@\n\t scaleType = %zi\n}", v4, self, v5, [(GCGenericDeviceDataInputElementValueExpressionModel *)self scaleType]];

  return v6;
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)scaleType
{
  return self->_scaleType;
}

- (void).cxx_destruct
{
}

@end