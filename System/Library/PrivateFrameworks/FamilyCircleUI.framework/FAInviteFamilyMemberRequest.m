@interface FAInviteFamilyMemberRequest
- (BOOL)isUserInitiated;
- (NSString)inviteeCompositeName;
- (NSString)inviteeEmail;
- (NSString)inviteeShortName;
- (id)_endpoint;
- (id)_queryString;
- (void)_queryString;
- (void)setInviteeCompositeName:(id)a3;
- (void)setInviteeEmail:(id)a3;
- (void)setInviteeShortName:(id)a3;
@end

@implementation FAInviteFamilyMemberRequest

- (BOOL)isUserInitiated
{
  return 1;
}

- (id)_endpoint
{
  return (id)*MEMORY[0x263F3BE50];
}

- (id)_queryString
{
  v3 = [MEMORY[0x263F089C0] URLQueryAllowedCharacterSet];
  v4 = (void *)[v3 mutableCopy];

  [v4 removeCharactersInString:@"+"];
  v5 = NSString;
  v6 = [(NSString *)self->_inviteeEmail stringByAddingPercentEncodingWithAllowedCharacters:v4];
  v7 = [v5 stringWithFormat:@"inviteeEmail=%@", v6];

  inviteeShortName = self->_inviteeShortName;
  v9 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  v10 = [(NSString *)inviteeShortName stringByAddingPercentEncodingWithAllowedCharacters:v9];

  if (v10)
  {
    uint64_t v11 = [v7 stringByAppendingFormat:@"&inviteeShortName=%@", v10];

    v7 = (void *)v11;
  }
  inviteeCompositeName = self->_inviteeCompositeName;
  v13 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  v14 = [(NSString *)inviteeCompositeName stringByAddingPercentEncodingWithAllowedCharacters:v13];

  if (v14)
  {
    uint64_t v15 = [v7 stringByAppendingFormat:@"&inviteeCompositeName=%@", v14];

    v7 = (void *)v15;
  }
  v16 = _FALogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[FAInviteFamilyMemberRequest _queryString]();
  }

  return v7;
}

- (NSString)inviteeEmail
{
  return self->_inviteeEmail;
}

- (void)setInviteeEmail:(id)a3
{
}

- (NSString)inviteeCompositeName
{
  return self->_inviteeCompositeName;
}

- (void)setInviteeCompositeName:(id)a3
{
}

- (NSString)inviteeShortName
{
  return self->_inviteeShortName;
}

- (void)setInviteeShortName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteeShortName, 0);
  objc_storeStrong((id *)&self->_inviteeCompositeName, 0);
  objc_storeStrong((id *)&self->_inviteeEmail, 0);
}

- (void)_queryString
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2189F0000, v0, OS_LOG_TYPE_DEBUG, "Query string %@", v1, 0xCu);
}

@end