@interface FAFamilyMemberDetailsUIRequest
- (BOOL)isUserInitiated;
- (NSNumber)memberDSID;
- (NSString)memberEmail;
- (id)_endpoint;
- (id)_queryString;
- (void)URLRequestWithCompletion:(id)a3;
- (void)_queryString;
- (void)setMemberDSID:(id)a3;
- (void)setMemberEmail:(id)a3;
@end

@implementation FAFamilyMemberDetailsUIRequest

- (BOOL)isUserInitiated
{
  return 1;
}

- (id)_endpoint
{
  return (id)*MEMORY[0x263F3BE78];
}

- (id)_queryString
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F08BA0]);
  if (self->_memberEmail)
  {
    v4 = [objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"invitedEmail" value:self->_memberEmail];
    v13[0] = v4;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    [v3 setQueryItems:v5];
LABEL_5:

    goto LABEL_6;
  }
  if (self->_memberDSID)
  {
    id v6 = objc_alloc(MEMORY[0x263F08BD0]);
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", -[NSNumber unsignedLongLongValue](self->_memberDSID, "unsignedLongLongValue"));
    v5 = (void *)[v6 initWithName:@"memberId" value:v4];
    v12 = v5;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
    [v3 setQueryItems:v7];

    goto LABEL_5;
  }
  v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2189F0000, v4, OS_LOG_TYPE_DEFAULT, "Error: no member DSID or email. This will go badly.", buf, 2u);
  }
LABEL_6:

  v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(FAFamilyMemberDetailsUIRequest *)v3 _queryString];
  }

  v9 = [v3 query];

  return v9;
}

- (void)URLRequestWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__FAFamilyMemberDetailsUIRequest_URLRequestWithCompletion___block_invoke;
  v7[3] = &unk_26434A3F8;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)FAFamilyMemberDetailsUIRequest;
  id v5 = v4;
  [(FAFamilyRequest *)&v6 URLRequestWithCompletion:v7];
}

void __59__FAFamilyMemberDetailsUIRequest_URLRequestWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id v8 = (id)[a2 mutableCopy];
    [v8 setHTTPMethod:@"POST"];
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    [MEMORY[0x263F3BFA8] addMessageEligibilityToPayload:v5];
    objc_msgSend(v8, "aa_setBodyWithParameters:", v5);
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = (void *)[v8 copy];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
  }
}

- (NSNumber)memberDSID
{
  return self->_memberDSID;
}

- (void)setMemberDSID:(id)a3
{
}

- (NSString)memberEmail
{
  return self->_memberEmail;
}

- (void)setMemberEmail:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberEmail, 0);
  objc_storeStrong((id *)&self->_memberDSID, 0);
}

- (void)_queryString
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = [a1 query];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2189F0000, a2, OS_LOG_TYPE_DEBUG, "Query string %@", v4, 0xCu);
}

@end