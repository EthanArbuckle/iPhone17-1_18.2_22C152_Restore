@interface TokenChallengePair
- (NSData)challenge;
- (NSData)token;
- (TokenChallengePair)initWithChallenge:(id)a3 token:(id)a4;
@end

@implementation TokenChallengePair

- (TokenChallengePair)initWithChallenge:(id)a3 token:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TokenChallengePair;
  v9 = [(TokenChallengePair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_challenge, a3);
    objc_storeStrong((id *)&v10->_token, a4);
  }

  return v10;
}

- (NSData)challenge
{
  return self->_challenge;
}

- (NSData)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
}

@end