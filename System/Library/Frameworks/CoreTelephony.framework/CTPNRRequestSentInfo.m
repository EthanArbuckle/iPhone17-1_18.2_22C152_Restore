@interface CTPNRRequestSentInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTPNRRequestSentInfo:(id)a3;
- (BOOL)success;
- (CTPNRRequestSentInfo)init;
- (CTPNRRequestSentInfo)initWithCoder:(id)a3;
- (NSNumber)timeout;
- (NSString)token;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setTimeout:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation CTPNRRequestSentInfo

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", success=%d", -[CTPNRRequestSentInfo success](self, "success")];
  v4 = [(CTPNRRequestSentInfo *)self token];
  [v3 appendFormat:@", token=%@", v4];

  v5 = [(CTPNRRequestSentInfo *)self timeout];
  [v3 appendFormat:@", timeout=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (CTPNRRequestSentInfo)init
{
  v5.receiver = self;
  v5.super_class = (Class)CTPNRRequestSentInfo;
  v2 = [(CTPNRRequestSentInfo *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CTPNRRequestSentInfo *)v2 setSuccess:0];
  }
  return v3;
}

- (BOOL)isEqualToCTPNRRequestSentInfo:(id)a3
{
  id v8 = a3;
  if (!v8 || (int v9 = -[CTPNRRequestSentInfo success](self, "success"), v9 != [v8 success]))
  {
    BOOL v10 = 0;
    goto LABEL_18;
  }
  v11 = [(CTPNRRequestSentInfo *)self token];
  if (v11 || ([v8 token], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = [(CTPNRRequestSentInfo *)self token];
    objc_super v5 = [v8 token];
    if (([v4 isEqualToString:v5] & 1) == 0)
    {

      BOOL v10 = 0;
      goto LABEL_15;
    }
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
  }
  v13 = [(CTPNRRequestSentInfo *)self timeout];
  if (!v13)
  {
    v6 = [v8 timeout];
    if (!v6)
    {
      BOOL v10 = 1;
LABEL_20:

      if ((v12 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  v14 = [(CTPNRRequestSentInfo *)self timeout];
  v15 = [v8 timeout];
  BOOL v10 = v14 == v15;

  if (!v13) {
    goto LABEL_20;
  }

  if (v12)
  {
LABEL_14:
  }
LABEL_15:
  if (!v11) {

  }
LABEL_18:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTPNRRequestSentInfo *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTPNRRequestSentInfo *)self isEqualToCTPNRRequestSentInfo:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTPNRRequestSentInfo allocWithZone:a3];
  [(CTPNRRequestSentInfo *)v4 setSuccess:self->_success];
  [(CTPNRRequestSentInfo *)v4 setToken:self->_token];
  [(CTPNRRequestSentInfo *)v4 setTimeout:self->_timeout];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  timeout = self->_timeout;
  id v5 = a3;
  [v5 encodeObject:timeout forKey:@"timeout"];
  [v5 encodeObject:self->_token forKey:@"push_token"];
  [v5 encodeBool:self->_success forKey:@"success"];
}

- (CTPNRRequestSentInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTPNRRequestSentInfo;
  id v5 = [(CTPNRRequestSentInfo *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeout"];
    timeout = v5->_timeout;
    v5->_timeout = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"push_token"];
    token = v5->_token;
    v5->_token = (NSString *)v8;

    v5->_success = [v4 decodeBoolForKey:@"success"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeout, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

@end