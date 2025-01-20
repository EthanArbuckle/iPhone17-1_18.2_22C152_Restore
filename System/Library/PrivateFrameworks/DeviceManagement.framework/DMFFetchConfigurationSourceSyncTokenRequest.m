@interface DMFFetchConfigurationSourceSyncTokenRequest
+ (BOOL)supportsSecureCoding;
- (DMFFetchConfigurationSourceSyncTokenRequest)initWithCoder:(id)a3;
- (NSString)configurationSource;
- (void)encodeWithCoder:(id)a3;
- (void)setConfigurationSource:(id)a3;
@end

@implementation DMFFetchConfigurationSourceSyncTokenRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchConfigurationSourceSyncTokenRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFFetchConfigurationSourceSyncTokenRequest;
  v5 = [(CATTaskRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"configurationSource"];
    configurationSource = v5->_configurationSource;
    v5->_configurationSource = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchConfigurationSourceSyncTokenRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(DMFFetchConfigurationSourceSyncTokenRequest *)self configurationSource];
  [v4 encodeObject:v5 forKey:@"configurationSource"];
}

- (NSString)configurationSource
{
  return self->_configurationSource;
}

- (void)setConfigurationSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end