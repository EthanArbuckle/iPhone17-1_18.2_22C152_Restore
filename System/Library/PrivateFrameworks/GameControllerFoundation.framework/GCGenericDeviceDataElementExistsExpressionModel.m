@interface GCGenericDeviceDataElementExistsExpressionModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceDataElementExistsExpressionModel)initWithCoder:(id)a3;
- (GCGenericDeviceDataProcessorExpressionModel)falseExpression;
- (GCGenericDeviceDataProcessorExpressionModel)trueExpression;
- (NSString)elementIdentifier;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCGenericDeviceDataElementExistsExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataElementExistsExpressionModel)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)GCGenericDeviceDataElementExistsExpressionModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceDataProcessorExpressionModel *)&v12 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"elementIdentifier", v12.receiver, v12.super_class);
  elementIdentifier = v4->_elementIdentifier;
  v4->_elementIdentifier = (NSString *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"trueExpression"];
  trueExpression = v4->_trueExpression;
  v4->_trueExpression = (GCGenericDeviceDataProcessorExpressionModel *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"falseExpression"];

  falseExpression = v4->_falseExpression;
  v4->_falseExpression = (GCGenericDeviceDataProcessorExpressionModel *)v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GCGenericDeviceDataElementExistsExpressionModel;
  id v4 = a3;
  [(GCGenericDeviceDataProcessorExpressionModel *)&v8 encodeWithCoder:v4];
  uint64_t v5 = [(GCGenericDeviceDataElementExistsExpressionModel *)self elementIdentifier];
  [v4 encodeObject:v5 forKey:@"elementIdentifier"];

  v6 = [(GCGenericDeviceDataElementExistsExpressionModel *)self trueExpression];
  [v4 encodeObject:v6 forKey:@"trueExpression"];

  uint64_t v7 = [(GCGenericDeviceDataElementExistsExpressionModel *)self falseExpression];
  [v4 encodeObject:v7 forKey:@"falseExpression"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GCGenericDeviceDataElementExistsExpressionModel;
  if ([(GCGenericDeviceDataProcessorExpressionModel *)&v13 isEqual:v4])
  {
    uint64_t v5 = [(GCGenericDeviceDataElementExistsExpressionModel *)self elementIdentifier];
    v6 = [v4 elementIdentifier];
    if ([v5 isEqual:v6])
    {
      uint64_t v7 = [(GCGenericDeviceDataElementExistsExpressionModel *)self trueExpression];
      objc_super v8 = [v4 trueExpression];
      if ([v7 isEqual:v8])
      {
        uint64_t v9 = [(GCGenericDeviceDataElementExistsExpressionModel *)self falseExpression];
        v10 = [v4 falseExpression];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (id)description
{
  return @"Element Exists Expression";
}

- (id)description
{
  id v3 = [(GCGenericDeviceDataElementExistsExpressionModel *)self elementIdentifier];
  id v4 = [(GCGenericDeviceDataElementExistsExpressionModel *)self trueExpression];
  uint64_t v5 = [v4 description];
  v6 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  uint64_t v7 = [(GCGenericDeviceDataElementExistsExpressionModel *)self falseExpression];
  objc_super v8 = [v7 description];
  uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  v10 = +[NSString stringWithFormat:@"(element-exists '%@'\n\t%@\n\t%@\n)", v3, v6, v9];

  return v10;
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(GCGenericDeviceDataElementExistsExpressionModel *)self elementIdentifier];
  v6 = [(GCGenericDeviceDataElementExistsExpressionModel *)self trueExpression];
  uint64_t v7 = [v6 debugDescription];
  objc_super v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  uint64_t v9 = [(GCGenericDeviceDataElementExistsExpressionModel *)self falseExpression];
  v10 = [v9 debugDescription];
  char v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
  objc_super v12 = +[NSString stringWithFormat:@"<%@ %p> {\n\t elementIdentifier = %@\n\t trueExpression = %@\n\t falseExpression = %@\n}", v4, self, v5, v8, v11];

  return v12;
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)trueExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 16, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)falseExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falseExpression, 0);
  objc_storeStrong((id *)&self->_trueExpression, 0);

  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

@end