@interface GCDeviceElementDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isBoundToSystemGesture;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMappableToSystemGestures;
- (BOOL)isRemappable;
- (GCDeviceElementDescription)initWithCoder:(id)a3;
- (NSSet)additionalAliases;
- (NSString)name;
- (NSString)nameLocalizationKey;
- (NSString)symbolName;
- (id)localizedName;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCDeviceElementDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDeviceElementDescription)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)name
{
  return 0;
}

- (NSSet)additionalAliases
{
  return 0;
}

- (BOOL)isRemappable
{
  return 0;
}

- (BOOL)isMappableToSystemGestures
{
  return 0;
}

- (BOOL)isBoundToSystemGesture
{
  return 0;
}

- (id)localizedName
{
  return 0;
}

- (NSString)symbolName
{
  return 0;
}

- (unint64_t)hash
{
  v2 = [(GCDeviceElementDescription *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(GCDeviceElementDescription *)self name];
    v6 = [v4 name];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v7 = 0;
      goto LABEL_7;
    }
    v5 = [(GCDeviceElementDescription *)self name];
    char v7 = [v5 isEqual:v4];
  }

LABEL_7:
  return v7;
}

- (NSString)nameLocalizationKey
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end