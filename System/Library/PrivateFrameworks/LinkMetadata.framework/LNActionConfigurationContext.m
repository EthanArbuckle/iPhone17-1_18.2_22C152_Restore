@interface LNActionConfigurationContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNActionConfigurationContext)initWithCoder:(id)a3;
- (NSString)widgetFamily;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setWidgetFamily:(id)a3;
@end

@implementation LNActionConfigurationContext

- (void).cxx_destruct
{
}

- (void)setWidgetFamily:(id)a3
{
}

- (NSString)widgetFamily
{
  return self->_widgetFamily;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNActionConfigurationContext *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNActionConfigurationContext *)self widgetFamily];
      v8 = [(LNActionConfigurationContext *)v6 widgetFamily];
      id v9 = v7;
      id v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10) {
          char v12 = [v9 isEqualToString:v10];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  v2 = [(LNActionConfigurationContext *)self widgetFamily];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNActionConfigurationContext *)self widgetFamily];
  v7 = [v3 stringWithFormat:@"<%@: %p, widgetFamily: %@>", v5, self, v6];

  return v7;
}

- (LNActionConfigurationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNActionConfigurationContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widgetFamily"];
    widgetFamily = v5->_widgetFamily;
    v5->_widgetFamily = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNActionConfigurationContext *)self widgetFamily];
  [v4 encodeObject:v5 forKey:@"widgetFamily"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [(LNActionConfigurationContext *)self widgetFamily];
  [v4 setWidgetFamily:v5];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end