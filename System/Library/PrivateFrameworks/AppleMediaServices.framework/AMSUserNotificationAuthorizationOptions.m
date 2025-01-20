@interface AMSUserNotificationAuthorizationOptions
+ (BOOL)supportsSecureCoding;
- (AMSUserNotificationAuthorizationOptions)init;
- (AMSUserNotificationAuthorizationOptions)initWithCoder:(id)a3;
- (AMSUserNotificationAuthorizationOptions)initWithOptionsDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)userInitiated;
- (NSDictionary)metricsOverlay;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)optionsDictionary;
- (unint64_t)authorizationOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthorizationOptions:(unint64_t)a3;
- (void)setMetricsOverlay:(id)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation AMSUserNotificationAuthorizationOptions

- (AMSUserNotificationAuthorizationOptions)init
{
  return [(AMSUserNotificationAuthorizationOptions *)self initWithOptionsDictionary:0];
}

- (AMSUserNotificationAuthorizationOptions)initWithOptionsDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUserNotificationAuthorizationOptions;
  v5 = [(AMSUserNotificationAuthorizationOptions *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"AMSUserNotificationAuthorizationOptionsAuthorizationOptions"];
    if (objc_opt_respondsToSelector())
    {
      v7 = [v4 objectForKeyedSubscript:@"AMSUserNotificationAuthorizationOptionsAuthorizationOptions"];
      v5->_authorizationOptions = [v7 unsignedIntegerValue];
    }
    else
    {
      v5->_authorizationOptions = 38;
    }

    metricsOverlay = [v4 objectForKeyedSubscript:@"AMSUserNotificationAuthorizationOptionsMetricsOverlay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = metricsOverlay;

      if (!v9)
      {
LABEL_10:
        v10 = objc_msgSend(v4, "ams_objectForKey:defaultValue:", @"AMSUserNotificationAuthorizationOptionsUserInitiated", MEMORY[0x1E4F1CC28]);
        v5->_userInitiated = [v10 BOOLValue];

        goto LABEL_11;
      }
      v9 = v9;
      metricsOverlay = v5->_metricsOverlay;
      v5->_metricsOverlay = v9;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_10;
  }
LABEL_11:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUserNotificationAuthorizationOptions *)self optionsDictionary];
  [v4 encodeObject:v5 forKey:@"kCodingKeyOptionsDictionary"];
}

- (AMSUserNotificationAuthorizationOptions)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v6 = objc_msgSend(v4, "ams_PLISTClasses");
  v7 = [v5 decodeObjectOfClasses:v6 forKey:@"kCodingKeyOptionsDictionary"];

  if (v7)
  {
    self = [(AMSUserNotificationAuthorizationOptions *)self initWithOptionsDictionary:v7];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)optionsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[AMSUserNotificationAuthorizationOptions authorizationOptions](self, "authorizationOptions"));
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, @"AMSUserNotificationAuthorizationOptionsAuthorizationOptions");

  id v5 = [(AMSUserNotificationAuthorizationOptions *)self metricsOverlay];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, @"AMSUserNotificationAuthorizationOptionsMetricsOverlay");

  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSUserNotificationAuthorizationOptions userInitiated](self, "userInitiated"));
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, @"AMSUserNotificationAuthorizationOptionsUserInitiated");

  v7 = (void *)[v3 copy];
  return v7;
}

- (id)description
{
  id v3 = [(AMSUserNotificationAuthorizationOptions *)self optionsDictionary];
  id v4 = [self ams_generateDescriptionWithSubObjects:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;

    if (!v5)
    {
      char v8 = 0;
      goto LABEL_7;
    }
    v6 = [(AMSUserNotificationAuthorizationOptions *)self optionsDictionary];
    v7 = [v5 optionsDictionary];
    char v8 = [v6 isEqualToDictionary:v7];
  }
  else
  {
    id v5 = 0;
    char v8 = 0;
    v6 = v4;
  }

LABEL_7:
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(AMSUserNotificationAuthorizationOptions *)self optionsDictionary];
  v6 = (void *)[v5 copy];
  v7 = (void *)[v4 initWithOptionsDictionary:v6];

  return v7;
}

- (unint64_t)authorizationOptions
{
  return self->_authorizationOptions;
}

- (void)setAuthorizationOptions:(unint64_t)a3
{
  self->_authorizationOptions = a3;
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (void)setMetricsOverlay:(id)a3
{
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void).cxx_destruct
{
}

@end