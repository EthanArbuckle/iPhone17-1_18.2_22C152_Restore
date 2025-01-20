@interface DMFFetchConfigurationSourceSyncTokenResultObject
+ (BOOL)supportsSecureCoding;
- (DMFFetchConfigurationSourceSyncTokenResultObject)initWithCoder:(id)a3;
- (NSString)syncToken;
- (void)encodeWithCoder:(id)a3;
- (void)setSyncToken:(id)a3;
@end

@implementation DMFFetchConfigurationSourceSyncTokenResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchConfigurationSourceSyncTokenResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFFetchConfigurationSourceSyncTokenResultObject;
  v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"syncToken"];
    syncToken = v5->_syncToken;
    v5->_syncToken = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchConfigurationSourceSyncTokenResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(DMFFetchConfigurationSourceSyncTokenResultObject *)self syncToken];
  [v4 encodeObject:v5 forKey:@"syncToken"];
}

- (NSString)syncToken
{
  return self->_syncToken;
}

- (void)setSyncToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end