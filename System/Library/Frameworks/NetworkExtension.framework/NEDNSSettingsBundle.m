@interface NEDNSSettingsBundle
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isEnabled;
- (NEDNSSettings)settings;
- (NEDNSSettingsBundle)init;
- (NEDNSSettingsBundle)initWithCoder:(id)a3;
- (NSArray)onDemandRules;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setOnDemandRules:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation NEDNSSettingsBundle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_onDemandRules, 0);
}

- (void)setSettings:(id)a3
{
}

- (NEDNSSettings)settings
{
  return (NEDNSSettings *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOnDemandRules:(id)a3
{
}

- (NSArray)onDemandRules
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)description
{
  return [(NEDNSSettingsBundle *)self descriptionWithIndent:0 options:0];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEDNSSettingsBundle isEnabled](self, "isEnabled"), @"enabled", v5, a4);
  v8 = [(NEDNSSettingsBundle *)self onDemandRules];
  [v7 appendPrettyObject:v8 withName:@"onDemandRules" andIndent:v5 options:a4];

  v9 = [(NEDNSSettingsBundle *)self settings];
  [v7 appendPrettyObject:v9 withName:@"settings" andIndent:v5 options:a4];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NEDNSSettingsBundle *)self settings];

  if (v5)
  {
    v6 = [(NEDNSSettingsBundle *)self settings];
    LODWORD(v5) = [v6 checkValidityAndCollectErrors:v4];
  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing settings", v4);
  }
  id v7 = [(NEDNSSettingsBundle *)self onDemandRules];

  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = [(NEDNSSettingsBundle *)self onDemandRules];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            LODWORD(v5) = [v13 checkValidityAndCollectErrors:v4] & v5;
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid on demand rule object", v4);
            LODWORD(v5) = 0;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NEDNSSettingsBundle allocWithZone:a3] init];
  [(NEDNSSettingsBundle *)v4 setEnabled:[(NEDNSSettingsBundle *)self isEnabled]];
  uint64_t v5 = [(NEDNSSettingsBundle *)self onDemandRules];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C978]);
    id v7 = [(NEDNSSettingsBundle *)self onDemandRules];
    v8 = (void *)[v6 initWithArray:v7 copyItems:1];
    [(NEDNSSettingsBundle *)v4 setOnDemandRules:v8];
  }
  uint64_t v9 = [(NEDNSSettingsBundle *)self settings];
  [(NEDNSSettingsBundle *)v4 setSettings:v9];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEDNSSettingsBundle isEnabled](self, "isEnabled"), @"Enabled");
  uint64_t v5 = [(NEDNSSettingsBundle *)self onDemandRules];
  [v4 encodeObject:v5 forKey:@"OnDemandRules"];

  id v6 = [(NEDNSSettingsBundle *)self settings];
  [v4 encodeObject:v6 forKey:@"Settings"];
}

- (NEDNSSettingsBundle)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEDNSSettingsBundle;
  uint64_t v5 = [(NEDNSSettingsBundle *)&v15 init];
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"Enabled"];
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"OnDemandRules"];
    onDemandRules = v5->_onDemandRules;
    v5->_onDemandRules = (NSArray *)v9;

    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"Settings"];
    settings = v5->_settings;
    v5->_settings = (NEDNSSettings *)v12;
  }
  return v5;
}

- (NEDNSSettingsBundle)init
{
  v5.receiver = self;
  v5.super_class = (Class)NEDNSSettingsBundle;
  v2 = [(NEDNSSettingsBundle *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NEDNSSettingsBundle *)v2 setEnabled:0];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end