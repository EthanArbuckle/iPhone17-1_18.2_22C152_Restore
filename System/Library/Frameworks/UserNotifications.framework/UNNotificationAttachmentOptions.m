@interface UNNotificationAttachmentOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)thumbnailGeneratorUserInfo;
- (UNNotificationAttachmentOptions)init;
- (UNNotificationAttachmentOptions)initWithCoder:(id)a3;
- (id)_initWithDisplayLocation:(unint64_t)a3 thumbnailGeneratorUserInfo:(id)a4;
- (id)_initWithOptions:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)displayLocation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotificationAttachmentOptions

- (UNNotificationAttachmentOptions)init
{
  return (UNNotificationAttachmentOptions *)[(UNNotificationAttachmentOptions *)self _initWithOptions:0];
}

- (id)_initWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 displayLocation];
  v6 = [v4 thumbnailGeneratorUserInfo];

  id v7 = [(UNNotificationAttachmentOptions *)self _initWithDisplayLocation:v5 thumbnailGeneratorUserInfo:v6];
  return v7;
}

- (id)_initWithDisplayLocation:(unint64_t)a3 thumbnailGeneratorUserInfo:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UNNotificationAttachmentOptions;
  id v7 = [(UNNotificationAttachmentOptions *)&v13 init];
  p_isa = (id *)&v7->super.isa;
  if (v7)
  {
    v7->_displayLocation = a3;
    uint64_t v9 = [v6 copy];
    v10 = (void *)v9;
    if (v9) {
      v11 = (void *)v9;
    }
    else {
      v11 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong(p_isa + 2, v11);
  }
  return p_isa;
}

- (unint64_t)hash
{
  unint64_t v3 = [(UNNotificationAttachmentOptions *)self displayLocation];
  id v4 = [(UNNotificationAttachmentOptions *)self thumbnailGeneratorUserInfo];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UNNotificationAttachmentOptions *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      unint64_t v6 = [(UNNotificationAttachmentOptions *)self displayLocation];
      if (v6 == [(UNNotificationAttachmentOptions *)v5 displayLocation])
      {
        id v7 = [(UNNotificationAttachmentOptions *)self thumbnailGeneratorUserInfo];
        v8 = [(UNNotificationAttachmentOptions *)v5 thumbnailGeneratorUserInfo];
        char v9 = UNEqualObjects(v7, v8);
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
  }

  return v9;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = UNStringFromNotificationAttachmentDisplayLocation([(UNNotificationAttachmentOptions *)self displayLocation]);
  unint64_t v6 = [(UNNotificationAttachmentOptions *)self thumbnailGeneratorUserInfo];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; displayLocation: %@; thumbnailGeneratorUserInfo: %@>",
    v4,
    self,
    v5,
  id v7 = v6);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [UNMutableNotificationAttachmentOptions alloc];

  return [(UNNotificationAttachmentOptions *)v4 _initWithOptions:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNNotificationAttachmentOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"displayLocation"];
  unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"thumbnailGeneratorUserInfo"];

  objc_super v13 = [(UNNotificationAttachmentOptions *)self _initWithDisplayLocation:v5 thumbnailGeneratorUserInfo:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationAttachmentOptions displayLocation](self, "displayLocation"), @"displayLocation");
  id v5 = [(UNNotificationAttachmentOptions *)self thumbnailGeneratorUserInfo];
  [v4 encodeObject:v5 forKey:@"thumbnailGeneratorUserInfo"];
}

- (unint64_t)displayLocation
{
  return self->_displayLocation;
}

- (NSDictionary)thumbnailGeneratorUserInfo
{
  return self->_thumbnailGeneratorUserInfo;
}

- (void).cxx_destruct
{
}

@end