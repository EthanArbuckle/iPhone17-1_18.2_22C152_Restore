@interface DMFFetchActivationLockBypassCodeResultObject
+ (BOOL)supportsSecureCoding;
- (DMFFetchActivationLockBypassCodeResultObject)initWithBypassCode:(id)a3;
- (DMFFetchActivationLockBypassCodeResultObject)initWithCoder:(id)a3;
- (NSString)bypassCode;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFFetchActivationLockBypassCodeResultObject

- (DMFFetchActivationLockBypassCodeResultObject)initWithBypassCode:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchActivationLockBypassCodeResultObject;
  v5 = [(CATTaskResultObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bypassCode = v5->_bypassCode;
    v5->_bypassCode = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchActivationLockBypassCodeResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFFetchActivationLockBypassCodeResultObject;
  v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"bypassCode"];
    bypassCode = v5->_bypassCode;
    v5->_bypassCode = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchActivationLockBypassCodeResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(DMFFetchActivationLockBypassCodeResultObject *)self bypassCode];
  [v4 encodeObject:v5 forKey:@"bypassCode"];
}

- (id)description
{
  v2 = NSString;
  v3 = [(DMFFetchActivationLockBypassCodeResultObject *)self bypassCode];
  id v4 = [v2 stringWithFormat:@"Bypass code: %@", v3];

  return v4;
}

- (NSString)bypassCode
{
  return self->_bypassCode;
}

- (void).cxx_destruct
{
}

@end