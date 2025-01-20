@interface CRKFetchStudentDaemonStateResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchStudentDaemonStateResultObject)initWithCoder:(id)a3;
- (NSDictionary)stateDictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setStateDictionary:(id)a3;
@end

@implementation CRKFetchStudentDaemonStateResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchStudentDaemonStateResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKFetchStudentDaemonStateResultObject;
  v5 = [(CATTaskResultObject *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"stateDictionary"];
    stateDictionary = v5->_stateDictionary;
    v5->_stateDictionary = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchStudentDaemonStateResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchStudentDaemonStateResultObject *)self stateDictionary];
  [v4 encodeObject:v5 forKey:@"stateDictionary"];
}

- (NSDictionary)stateDictionary
{
  return self->_stateDictionary;
}

- (void)setStateDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end