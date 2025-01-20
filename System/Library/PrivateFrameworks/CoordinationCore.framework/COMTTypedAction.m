@interface COMTTypedAction
- (COMTTypedAction)initWithCoder:(id)a3;
- (COMTTypedAction)initWithType:(id)a3;
- (NSString)targetType;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMTTypedAction

- (COMTTypedAction)initWithType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMTTypedAction;
  v6 = [(COMTAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_targetType, a3);
  }

  return v7;
}

- (COMTTypedAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMTTypedAction;
  id v5 = [(COMTAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TT"];
    targetType = v5->_targetType;
    v5->_targetType = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COMTTypedAction;
  id v4 = a3;
  [(COMTAction *)&v6 encodeWithCoder:v4];
  id v5 = [(COMTTypedAction *)self targetType];
  [v4 encodeObject:v5 forKey:@"TT"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_super v6 = [(COMTAction *)self actionIdentifier];
  v7 = [(COMTTypedAction *)self targetType];
  v8 = [v3 stringWithFormat:@"<%@: %p, id = %@, type = %@>", v5, self, v6, v7];

  return v8;
}

- (NSString)targetType
{
  return self->_targetType;
}

- (void).cxx_destruct
{
}

@end