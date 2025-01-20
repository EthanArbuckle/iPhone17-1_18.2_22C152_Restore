@interface UNNotificationActionIcon
+ (BOOL)supportsSecureCoding;
+ (UNNotificationActionIcon)iconWithSystemImageName:(NSString *)systemImageName;
+ (UNNotificationActionIcon)iconWithTemplateImageName:(NSString *)templateImageName;
+ (id)_iconWithImageName:(id)a3 systemIcon:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemIcon;
- (NSString)imageName;
- (UNNotificationActionIcon)initWithCoder:(id)a3;
- (id)_description;
- (id)_initWithImageName:(id)a3 systemIcon:(BOOL)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImageName:(id)a3;
- (void)setSystemIcon:(BOOL)a3;
@end

@implementation UNNotificationActionIcon

- (void).cxx_destruct
{
}

+ (id)_iconWithImageName:(id)a3 systemIcon:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) _initWithImageName:v6 systemIcon:v4];

  return v7;
}

- (UNNotificationActionIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageName"];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v4 decodeBoolForKey:@"systemIcon"];
  v8 = [(UNNotificationActionIcon *)self _initWithImageName:v6 systemIcon:v7];

  return v8;
}

- (id)_initWithImageName:(id)a3 systemIcon:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UNNotificationActionIcon;
  uint64_t v7 = [(UNNotificationActionIcon *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    imageName = v7->_imageName;
    v7->_imageName = (NSString *)v8;

    v7->_systemIcon = a4;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(UNNotificationActionIcon *)self imageName];
  [v5 encodeObject:v4 forKey:@"imageName"];

  objc_msgSend(v5, "encodeBool:forKey:", -[UNNotificationActionIcon isSystemIcon](self, "isSystemIcon"), @"systemIcon");
}

- (BOOL)isSystemIcon
{
  return self->_systemIcon;
}

- (NSString)imageName
{
  return self->_imageName;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (UNNotificationActionIcon)iconWithSystemImageName:(NSString *)systemImageName
{
  return (UNNotificationActionIcon *)[a1 _iconWithImageName:systemImageName systemIcon:1];
}

+ (UNNotificationActionIcon)iconWithTemplateImageName:(NSString *)templateImageName
{
  return (UNNotificationActionIcon *)[a1 _iconWithImageName:templateImageName systemIcon:0];
}

- (unint64_t)hash
{
  v3 = [(UNNotificationActionIcon *)self imageName];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 ^ [(UNNotificationActionIcon *)self isSystemIcon];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(UNNotificationActionIcon *)self imageName];
    id v6 = [v4 imageName];
    if (UNEqualStrings(v5, v6))
    {
      BOOL v7 = [(UNNotificationActionIcon *)self isSystemIcon];
      int v8 = v7 ^ [v4 isSystemIcon] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)_description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(UNNotificationActionIcon *)self imageName];
  [(UNNotificationActionIcon *)self isSystemIcon];
  id v6 = NSStringFromBOOL();
  BOOL v7 = [v3 stringWithFormat:@"<%@: %p; imageName: %@, isSystemIcon: %@", v4, self, v5, v6];

  return v7;
}

- (id)description
{
  v2 = NSString;
  v3 = [(UNNotificationActionIcon *)self _description];
  uint64_t v4 = [v2 stringWithFormat:@"%@>", v3];

  return v4;
}

- (void)setImageName:(id)a3
{
}

- (void)setSystemIcon:(BOOL)a3
{
  self->_systemIcon = a3;
}

@end