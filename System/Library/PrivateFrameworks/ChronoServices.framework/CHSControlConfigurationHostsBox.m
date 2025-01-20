@interface CHSControlConfigurationHostsBox
+ (BOOL)supportsSecureCoding;
- (CHSControlConfigurationHostsBox)initWithCoder:(id)a3;
- (CHSControlConfigurationHostsBox)initWithConfigurationsByHost:(id)a3;
- (NSDictionary)configurationsByHost;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSControlConfigurationHostsBox

- (CHSControlConfigurationHostsBox)initWithConfigurationsByHost:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSControlConfigurationHostsBox;
  v6 = [(CHSControlConfigurationHostsBox *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configurationsByHost, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CHSControlConfigurationHostsBox)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  objc_super v9 = [v4 decodeObjectOfClasses:v8 forKey:@"c"];
  if (v9)
  {
    self = [(CHSControlConfigurationHostsBox *)self initWithConfigurationsByHost:v9];
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSDictionary)configurationsByHost
{
  return self->_configurationsByHost;
}

- (void).cxx_destruct
{
}

@end