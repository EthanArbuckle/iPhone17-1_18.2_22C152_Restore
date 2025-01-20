@interface DMFEchoResultObject
+ (BOOL)supportsSecureCoding;
- (DMFEchoResultObject)initWithCoder:(id)a3;
- (NSString)echo;
- (NSString)resultStatus;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEcho:(id)a3;
- (void)setResultStatus:(id)a3;
@end

@implementation DMFEchoResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFEchoResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFEchoResultObject;
  v5 = [(CATTaskResultObject *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"echo"];
    echo = v5->_echo;
    v5->_echo = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"resultStatus"];
    resultStatus = v5->_resultStatus;
    v5->_resultStatus = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFEchoResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v7 encodeWithCoder:v4];
  v5 = [(DMFEchoResultObject *)self echo];
  [v4 encodeObject:v5 forKey:@"echo"];

  v6 = [(DMFEchoResultObject *)self resultStatus];
  [v4 encodeObject:v6 forKey:@"resultStatus"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(DMFEchoResultObject *)self echo];
  v5 = [(DMFEchoResultObject *)self resultStatus];
  v6 = [v3 stringWithFormat:@"Echo: '%@' result: %@", v4, v5];

  return v6;
}

- (NSString)echo
{
  return self->_echo;
}

- (void)setEcho:(id)a3
{
}

- (NSString)resultStatus
{
  return self->_resultStatus;
}

- (void)setResultStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultStatus, 0);
  objc_storeStrong((id *)&self->_echo, 0);
}

@end