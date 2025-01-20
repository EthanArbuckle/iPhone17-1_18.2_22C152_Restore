@interface ECHeaderAuthenticationResults
+ (id)authenticationResultsForHeaders:(id)a3;
+ (id)authenticationResultsForRawHeaders:(id)a3;
- (ECHeaderAuthenticationResults)initWithAuthenticationServiceIdentifier:(id)a3 version:(int64_t)a4 statements:(id)a5;
- (NSArray)statements;
- (NSString)authenticationServiceIdentifier;
- (id)firstStatementForMethod:(id)a3;
- (int64_t)version;
@end

@implementation ECHeaderAuthenticationResults

uint64_t ___ef_log_ECHeaderAuthenticationResults_block_invoke()
{
  _ef_log_ECHeaderAuthenticationResults_log = (uint64_t)os_log_create("com.apple.email", "ECHeaderAuthenticationResults");
  return MEMORY[0x1F41817F8]();
}

+ (id)authenticationResultsForHeaders:(id)a3
{
  v3 = +[_ECHeaderAuthenticationResultsParser authenticationResultsForHeaders:]((uint64_t)_ECHeaderAuthenticationResultsParser, a3);
  return v3;
}

+ (id)authenticationResultsForRawHeaders:(id)a3
{
  v3 = +[_ECHeaderAuthenticationResultsParser authenticationResultsForRawHeaders:]((uint64_t)_ECHeaderAuthenticationResultsParser, a3);
  return v3;
}

- (ECHeaderAuthenticationResults)initWithAuthenticationServiceIdentifier:(id)a3 version:(int64_t)a4 statements:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ECHeaderAuthenticationResults;
  v11 = [(ECHeaderAuthenticationResults *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_authenticationServiceIdentifier, a3);
    v12->_version = a4;
    objc_storeStrong((id *)&v12->_statements, a5);
  }

  return v12;
}

- (id)firstStatementForMethod:(id)a3
{
  id v4 = a3;
  v5 = [(ECHeaderAuthenticationResults *)self statements];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ECHeaderAuthenticationResults_firstStatementForMethod___block_invoke;
  v9[3] = &unk_1E63EE680;
  id v6 = v4;
  id v10 = v6;
  v7 = objc_msgSend(v5, "ef_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __57__ECHeaderAuthenticationResults_firstStatementForMethod___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 method];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (NSString)authenticationServiceIdentifier
{
  return self->_authenticationServiceIdentifier;
}

- (int64_t)version
{
  return self->_version;
}

- (NSArray)statements
{
  return self->_statements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statements, 0);
  objc_storeStrong((id *)&self->_authenticationServiceIdentifier, 0);
}

@end