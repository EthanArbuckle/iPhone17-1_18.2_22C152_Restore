@interface _GCDevicePhysicalInputViewParameters
+ (Class)viewClass;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation _GCDevicePhysicalInputViewParameters

+ (Class)viewClass
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v4 = [(NSString *)v3 stringByReplacingOccurrencesOfString:@"Parameters" withString:&stru_26D27BBB8];
  Class v5 = NSClassFromString(v4);
  if (!v5 || (v6 = v5, ![(objc_class *)v5 isSubclassOfClass:objc_opt_class()])) {
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](&off_26D2B7178, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, +[NSString stringWithFormat:@"Unknown view class '%@' for parameters class '%@'.", v4, v3], 0));
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();

  return (id)objc_opt_new();
}

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  return objc_opt_isKindOfClass() & 1;
}

@end