@interface NEContentFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)disableEncryptedDNSSettings;
- (BOOL)enableManualMode;
- (BOOL)isEnabled;
- (NEContentFilter)init;
- (NEContentFilter)initWithCoder:(id)a3;
- (NEFilterProviderConfiguration)provider;
- (NEPerApp)perApp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)grade;
- (void)encodeWithCoder:(id)a3;
- (void)setDisableEncryptedDNSSettings:(BOOL)a3;
- (void)setEnableManualMode:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGrade:(int64_t)a3;
- (void)setPerApp:(id)a3;
- (void)setProvider:(id)a3;
@end

@implementation NEContentFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perApp, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

- (void)setEnableManualMode:(BOOL)a3
{
  self->_enableManualMode = a3;
}

- (BOOL)enableManualMode
{
  return self->_enableManualMode;
}

- (void)setGrade:(int64_t)a3
{
  self->_grade = a3;
}

- (int64_t)grade
{
  return self->_grade;
}

- (void)setPerApp:(id)a3
{
}

- (NEPerApp)perApp
{
  return (NEPerApp *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProvider:(id)a3
{
}

- (NEFilterProviderConfiguration)provider
{
  return (NEFilterProviderConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisableEncryptedDNSSettings:(BOOL)a3
{
  self->_disableEncryptedDNSSettings = a3;
}

- (BOOL)disableEncryptedDNSSettings
{
  return self->_disableEncryptedDNSSettings;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEContentFilter isEnabled](self, "isEnabled"), @"enabled", v5, a4);
  if ([(NEContentFilter *)self disableEncryptedDNSSettings]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEContentFilter disableEncryptedDNSSettings](self, "disableEncryptedDNSSettings"), @"disableEncryptedDNSSettings", v5, a4);
  }
  v8 = [(NEContentFilter *)self provider];
  [v7 appendPrettyObject:v8 withName:@"provider" andIndent:v5 options:a4];

  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEContentFilter grade](self, "grade"), @"filter-grade", v5, a4);
  v9 = [(NEContentFilter *)self perApp];
  [v7 appendPrettyObject:v9 withName:@"per-app" andIndent:v5 options:a4];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEContentFilter *)self provider];

  if (v5)
  {
    v6 = [(NEContentFilter *)self provider];
    LOBYTE(v5) = [v6 checkValidityAndCollectErrors:v4];
  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing plugin", v4);
  }
  if ([(NEContentFilter *)self grade] < 1 || [(NEContentFilter *)self grade] >= 3)
  {
    id v7 = [NSString alloc];
    v8 = NEResourcesCopyLocalizedNSString(@"CONTENT_FILTER_INVALID_GRADE", @"CONTENT_FILTER_INVALID_GRADE");
    uint64_t v5 = objc_msgSend(v7, "initWithFormat:", v8, -[NEContentFilter grade](self, "grade"));
    [v4 addObject:v5];

    LOBYTE(v5) = 0;
  }
  uint64_t v9 = [(NEContentFilter *)self perApp];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(NEContentFilter *)self perApp];
    char v12 = [v11 checkValidityAndCollectErrors:v4];

    LOBYTE(v5) = v12 & v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NEContentFilter allocWithZone:a3] init];
  [(NEContentFilter *)v4 setEnabled:[(NEContentFilter *)self isEnabled]];
  [(NEContentFilter *)v4 setDisableEncryptedDNSSettings:[(NEContentFilter *)self disableEncryptedDNSSettings]];
  uint64_t v5 = [(NEContentFilter *)self provider];
  [(NEContentFilter *)v4 setProvider:v5];

  [(NEContentFilter *)v4 setGrade:[(NEContentFilter *)self grade]];
  [(NEContentFilter *)v4 setEnableManualMode:[(NEContentFilter *)self enableManualMode]];
  v6 = [(NEContentFilter *)self perApp];
  [(NEContentFilter *)v4 setPerApp:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEContentFilter isEnabled](self, "isEnabled"), @"Enabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEContentFilter disableEncryptedDNSSettings](self, "disableEncryptedDNSSettings"), @"DisableEncryptedDNSSettings");
  uint64_t v5 = [(NEContentFilter *)self provider];
  [v4 encodeObject:v5 forKey:@"Provider"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[NEContentFilter grade](self, "grade"), @"FilterGrade");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEContentFilter enableManualMode](self, "enableManualMode"), @"EnableManualMode");
  id v6 = [(NEContentFilter *)self perApp];
  [v4 encodeObject:v6 forKey:@"PerApp"];
}

- (NEContentFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEContentFilter *)self init];
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"Enabled"];
    v5->_disableEncryptedDNSSettings = [v4 decodeBoolForKey:@"DisableEncryptedDNSSettings"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Provider"];
    provider = v5->_provider;
    v5->_provider = (NEFilterProviderConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PerApp"];
    perApp = v5->_perApp;
    v5->_perApp = (NEPerApp *)v8;

    uint64_t v10 = [v4 decodeIntegerForKey:@"FilterGrade"];
    if ((unint64_t)(v10 - 1) <= 1) {
      v5->_grade = v10;
    }
    v5->_enableManualMode = [v4 decodeBoolForKey:@"EnableManualMode"];
  }

  return v5;
}

- (NEContentFilter)init
{
  v3.receiver = self;
  v3.super_class = (Class)NEContentFilter;
  result = [(NEContentFilter *)&v3 init];
  if (result) {
    result->_grade = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end