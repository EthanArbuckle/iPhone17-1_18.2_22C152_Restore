@interface AKTextFieldAnnotation
+ (BOOL)supportsSecureCoding;
- (AKTextFieldAnnotation)initWithCoder:(id)a3;
- (NSString)fieldName;
- (void)encodeWithCoder:(id)a3;
- (void)setFieldName:(id)a3;
@end

@implementation AKTextFieldAnnotation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AKTextFieldAnnotation;
  [(AKRectangularShapeAnnotation *)&v7 encodeWithCoder:v4];
  v5 = [(AKTextFieldAnnotation *)self fieldName];

  if (v5)
  {
    v6 = [(AKTextFieldAnnotation *)self fieldName];
    [v4 encodeObject:v6 forKey:@"fieldName"];
  }
}

- (AKTextFieldAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKTextFieldAnnotation;
  v5 = [(AKRectangularShapeAnnotation *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fieldName"];
    [(AKTextFieldAnnotation *)v5 setFieldName:v6];
  }
  return v5;
}

- (NSString)fieldName
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (void)setFieldName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end