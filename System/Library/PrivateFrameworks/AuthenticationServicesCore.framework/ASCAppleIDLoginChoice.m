@interface ASCAppleIDLoginChoice
+ (BOOL)supportsSecureCoding;
- (AKAuthorizationLoginChoice)underlyingAppleIDLoginChoice;
- (ASCAppleIDLoginChoice)initWithAppleIDLoginChoice:(id)a3;
- (ASCAppleIDLoginChoice)initWithCoder:(id)a3;
- (ASCAppleIDLoginChoice)initWithUser:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)user;
- (unint64_t)loginChoiceKind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCAppleIDLoginChoice

- (ASCAppleIDLoginChoice)initWithUser:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCAppleIDLoginChoice;
  v5 = [(ASCAppleIDLoginChoice *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    user = v5->_user;
    v5->_user = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (ASCAppleIDLoginChoice)initWithAppleIDLoginChoice:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASCAppleIDLoginChoice;
  uint64_t v6 = [(ASCAppleIDLoginChoice *)&v12 init];
  if (v6)
  {
    v7 = [v5 user];
    uint64_t v8 = [v7 copy];
    user = v6->_user;
    v6->_user = (NSString *)v8;

    objc_storeStrong((id *)&v6->_underlyingAppleIDLoginChoice, a3);
    objc_super v10 = v6;
  }

  return v6;
}

- (unint64_t)loginChoiceKind
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NSString *)self->_user isEqualToString:v4[2]];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  user = self->_user;
  id v5 = a3;
  [v5 encodeObject:user forKey:@"appleIDLoginChoiceUser"];
  [v5 encodeObject:self->_underlyingAppleIDLoginChoice forKey:@"underlyingAppleIDLoginChoice"];
}

- (ASCAppleIDLoginChoice)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASCAppleIDLoginChoice;
  id v5 = [(ASCAppleIDLoginChoice *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleIDLoginChoiceUser"];
    user = v5->_user;
    v5->_user = (NSString *)v6;

    uint64_t v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    objc_super v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"underlyingAppleIDLoginChoice"];
    underlyingAppleIDLoginChoice = v5->_underlyingAppleIDLoginChoice;
    v5->_underlyingAppleIDLoginChoice = (AKAuthorizationLoginChoice *)v11;

    v13 = v5;
  }

  return v5;
}

- (AKAuthorizationLoginChoice)underlyingAppleIDLoginChoice
{
  return self->_underlyingAppleIDLoginChoice;
}

- (NSString)user
{
  return self->_user;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);

  objc_storeStrong((id *)&self->_underlyingAppleIDLoginChoice, 0);
}

@end