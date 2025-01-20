@interface CRKFeaturePermissionResultObject
+ (BOOL)supportsSecureCoding;
- (BOOL)isModifiable;
- (CRKFeaturePermissionResultObject)initWithCoder:(id)a3;
- (NSDictionary)dictionaryValue;
- (unint64_t)permission;
- (void)encodeWithCoder:(id)a3;
- (void)setModifiable:(BOOL)a3;
- (void)setPermission:(unint64_t)a3;
@end

@implementation CRKFeaturePermissionResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFeaturePermissionResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFeaturePermissionResultObject;
  v5 = [(CRKFeaturePermissionResultObject *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"permission"];
    v5->_permission = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modifiable"];
    v5->_modifiable = [v7 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[CRKFeaturePermissionResultObject permission](self, "permission"));
  [v5 encodeObject:v6 forKey:@"permission"];

  objc_msgSend(NSNumber, "numberWithBool:", -[CRKFeaturePermissionResultObject isModifiable](self, "isModifiable"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"modifiable"];
}

- (NSDictionary)dictionaryValue
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"value";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKFeaturePermissionResultObject permission](self, "permission"));
  v7[1] = @"modifiable";
  v8[0] = v3;
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKFeaturePermissionResultObject isModifiable](self, "isModifiable"));
  v8[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (unint64_t)permission
{
  return self->_permission;
}

- (void)setPermission:(unint64_t)a3
{
  self->_permission = a3;
}

- (BOOL)isModifiable
{
  return self->_modifiable;
}

- (void)setModifiable:(BOOL)a3
{
  self->_modifiable = a3;
}

@end