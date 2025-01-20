@interface IDSCarrierToken
- (IDSCarrierToken)initWithTokenString:(id)a3;
- (NSString)tokenString;
@end

@implementation IDSCarrierToken

- (IDSCarrierToken)initWithTokenString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSCarrierToken;
  v6 = [(IDSCarrierToken *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tokenString, a3);
  }

  return v7;
}

- (NSString)tokenString
{
  return self->_tokenString;
}

- (void).cxx_destruct
{
}

@end