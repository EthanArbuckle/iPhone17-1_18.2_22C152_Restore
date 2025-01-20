@interface CTPlanSignUpDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTPlanSignUpDetails)initWithCoder:(id)a3;
- (CTPlanSignUpDetails)initWithSignUpUrl:(id)a3 signUpUrlType:(id)a4;
- (NSString)signUpUrl;
- (NSString)signUpUrlType;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSignUpUrl:(id)a3;
- (void)setSignUpUrlType:(id)a3;
@end

@implementation CTPlanSignUpDetails

- (CTPlanSignUpDetails)initWithSignUpUrl:(id)a3 signUpUrlType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CTPlanSignUpDetails;
  v8 = [(CTPlanSignUpDetails *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    signUpUrl = v8->_signUpUrl;
    v8->_signUpUrl = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    signUpUrlType = v8->_signUpUrlType;
    v8->_signUpUrlType = (NSString *)v11;
  }
  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTPlanSignUpDetails *)self signUpUrl];
  [v3 appendFormat:@" signUpUrl=%@", v4];

  v5 = [(CTPlanSignUpDetails *)self signUpUrlType];
  [v3 appendFormat:@" signUpUrlType=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (CTPlanSignUpDetails *)a3;
  if (v6 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(CTPlanSignUpDetails *)self signUpUrl];
      v8 = [(CTPlanSignUpDetails *)v6 signUpUrl];
      if (v7 == v8
        || ([(CTPlanSignUpDetails *)self signUpUrl],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(CTPlanSignUpDetails *)v6 signUpUrl],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqualToString:v4]))
      {
        v10 = [(CTPlanSignUpDetails *)self signUpUrlType];
        uint64_t v11 = [(CTPlanSignUpDetails *)v6 signUpUrlType];
        if (v10 == v11)
        {
          char v9 = 1;
        }
        else
        {
          v12 = [(CTPlanSignUpDetails *)self signUpUrlType];
          v13 = [(CTPlanSignUpDetails *)v6 signUpUrlType];
          char v9 = [v12 isEqualToString:v13];
        }
        if (v7 == v8) {
          goto LABEL_13;
        }
      }
      else
      {
        char v9 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    char v9 = 0;
  }
LABEL_14:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTPlanSignUpDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTPlanSignUpDetails;
  v5 = [(CTPlanSignUpDetails *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signUpUrl"];
    signUpUrl = v5->_signUpUrl;
    v5->_signUpUrl = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signUpUrlType"];
    signUpUrlType = v5->_signUpUrlType;
    v5->_signUpUrlType = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  signUpUrl = self->_signUpUrl;
  id v5 = a3;
  [v5 encodeObject:signUpUrl forKey:@"signUpUrl"];
  [v5 encodeObject:self->_signUpUrlType forKey:@"signUpUrlType"];
}

- (NSString)signUpUrl
{
  return self->_signUpUrl;
}

- (void)setSignUpUrl:(id)a3
{
}

- (NSString)signUpUrlType
{
  return self->_signUpUrlType;
}

- (void)setSignUpUrlType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signUpUrlType, 0);

  objc_storeStrong((id *)&self->_signUpUrl, 0);
}

@end