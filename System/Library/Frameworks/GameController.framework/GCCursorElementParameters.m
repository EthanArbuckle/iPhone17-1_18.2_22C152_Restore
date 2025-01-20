@interface GCCursorElementParameters
+ (Class)viewClass;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation GCCursorElementParameters

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GCCursorElementParameters;
  return [(_GCDevicePhysicalInputElementParameters *)&v4 copyWithZone:a3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7.receiver = self;
    v7.super_class = (Class)GCCursorElementParameters;
    BOOL v5 = [(_GCDevicePhysicalInputElementParameters *)&v7 isEqual:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end