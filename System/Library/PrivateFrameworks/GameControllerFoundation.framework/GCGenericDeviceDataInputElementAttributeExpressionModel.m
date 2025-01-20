@interface GCGenericDeviceDataInputElementAttributeExpressionModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataInputElementAttributeExpressionModel)initWithCoder:(id)a3;
- (NSString)attribute;
- (NSString)elementIdentifier;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceDataInputElementAttributeExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataInputElementAttributeExpressionModel)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataInputElementAttributeExpressionModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceDataProcessorExpressionModel *)&v10 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"elementIdentifier", v10.receiver, v10.super_class);
  elementIdentifier = v4->_elementIdentifier;
  v4->_elementIdentifier = (NSString *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"attribute"];

  attribute = v4->_attribute;
  v4->_attribute = (NSString *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GCGenericDeviceDataInputElementAttributeExpressionModel;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModel *)&v7 encodeWithCoder:v4];
  uint64_t v5 = [(GCGenericDeviceDataInputElementAttributeExpressionModel *)self elementIdentifier];
  [v4 encodeObject:v5 forKey:@"elementIdentifier"];

  v6 = [(GCGenericDeviceDataInputElementAttributeExpressionModel *)self attribute];
  [v4 encodeObject:v6 forKey:@"attribute"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCGenericDeviceDataInputElementAttributeExpressionModel;
  if ([(GCGenericDeviceDataProcessorExpressionModel *)&v11 isEqual:v4])
  {
    uint64_t v5 = [(GCGenericDeviceDataInputElementAttributeExpressionModel *)self elementIdentifier];
    v6 = [v4 elementIdentifier];
    if ([v5 isEqual:v6])
    {
      objc_super v7 = [(GCGenericDeviceDataInputElementAttributeExpressionModel *)self attribute];
      v8 = [v4 attribute];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (id)description
{
  return @"Element Attribute Expression";
}

- (id)description
{
  id v3 = [(GCGenericDeviceDataInputElementAttributeExpressionModel *)self elementIdentifier];
  id v4 = [(GCGenericDeviceDataInputElementAttributeExpressionModel *)self attribute];
  uint64_t v5 = +[NSString stringWithFormat:@"(element-attribute %@ %@)", v3, v4];

  return v5;
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(GCGenericDeviceDataInputElementAttributeExpressionModel *)self elementIdentifier];
  v6 = [(GCGenericDeviceDataInputElementAttributeExpressionModel *)self attribute];
  objc_super v7 = +[NSString stringWithFormat:@"<%@ %p> {\n\t identifier = %@\n\t attribute = %@\n}", v4, self, v5, v6];

  return v7;
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)attribute
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribute, 0);

  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

@end