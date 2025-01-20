@interface DAEASOAuthPKCEChallenge
+ (id)base64URLEncode:(id)a3;
+ (id)convertToString:(int64_t)a3;
+ (id)newCodeVerifier;
- (DAEASOAuthPKCEChallenge)initWithCodeChallengeMethod:(int64_t)a3;
- (NSString)codeChallenge;
- (NSString)codeVerifier;
- (id)codeChallengeFromVerifier:(id)a3 withCodeChallengeMethod:(int64_t)a4;
- (int64_t)codeChallengeMethod;
- (void)setCodeChallenge:(id)a3;
- (void)setCodeChallengeMethod:(int64_t)a3;
- (void)setCodeVerifier:(id)a3;
@end

@implementation DAEASOAuthPKCEChallenge

- (DAEASOAuthPKCEChallenge)initWithCodeChallengeMethod:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DAEASOAuthPKCEChallenge;
  v4 = [(DAEASOAuthPKCEChallenge *)&v9 init];
  [(DAEASOAuthPKCEChallenge *)v4 setCodeChallengeMethod:a3];
  id v5 = +[DAEASOAuthPKCEChallenge newCodeVerifier];
  [(DAEASOAuthPKCEChallenge *)v4 setCodeVerifier:v5];

  v6 = [(DAEASOAuthPKCEChallenge *)v4 codeVerifier];
  v7 = [(DAEASOAuthPKCEChallenge *)v4 codeChallengeFromVerifier:v6 withCodeChallengeMethod:[(DAEASOAuthPKCEChallenge *)v4 codeChallengeMethod]];
  [(DAEASOAuthPKCEChallenge *)v4 setCodeChallenge:v7];

  return v4;
}

+ (id)newCodeVerifier
{
  v2 = [MEMORY[0x263EFF990] dataWithLength:32];
  v3 = (const __SecRandom *)*MEMORY[0x263F17510];
  id v4 = v2;
  if (SecRandomCopyBytes(v3, 0x20uLL, (void *)[v4 mutableBytes]))
  {
    id v5 = objc_alloc_init(MEMORY[0x263F08C38]);
    v6 = [v5 UUIDString];
  }
  else
  {
    v6 = +[DAEASOAuthPKCEChallenge base64URLEncode:v4];
  }

  return v6;
}

- (id)codeChallengeFromVerifier:(id)a3 withCodeChallengeMethod:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (a4 == 1)
  {
    objc_msgSend(v5, "dataUsingEncoding:", 4, 0, 0, 0, 0);
    id v7 = objc_claimAutoreleasedReturnValue();
    CC_SHA256((const void *)[v7 bytes], objc_msgSend(v7, "length"), (unsigned __int8 *)&v11);
    v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v11 length:32];
    id v9 = +[DAEASOAuthPKCEChallenge base64URLEncode:v8];
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

+ (id)convertToString:(int64_t)a3
{
  if (a3 == 1) {
    return @"S256";
  }
  else {
    return @"plain";
  }
}

+ (id)base64URLEncode:(id)a3
{
  v3 = [a3 base64EncodedStringWithOptions:0];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];

  id v5 = [v4 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

  v6 = [v5 stringByReplacingOccurrencesOfString:@"=" withString:&stru_26DF7DF88];

  return v6;
}

- (int64_t)codeChallengeMethod
{
  return self->_codeChallengeMethod;
}

- (void)setCodeChallengeMethod:(int64_t)a3
{
  self->_codeChallengeMethod = a3;
}

- (NSString)codeVerifier
{
  return self->_codeVerifier;
}

- (void)setCodeVerifier:(id)a3
{
}

- (NSString)codeChallenge
{
  return self->_codeChallenge;
}

- (void)setCodeChallenge:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeChallenge, 0);
  objc_storeStrong((id *)&self->_codeVerifier, 0);
}

@end