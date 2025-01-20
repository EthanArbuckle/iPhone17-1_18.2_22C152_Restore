@interface IDSAuthenticateUsersResponse
- (NSData)cert;
- (NSString)userID;
- (id)description;
- (int64_t)responseCode;
- (void)setCert:(id)a3;
- (void)setResponseCode:(int64_t)a3;
- (void)setUserID:(id)a3;
@end

@implementation IDSAuthenticateUsersResponse

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %p, userID: %@, responseCode: %lld, certLength: %llu>", objc_opt_class(), self, self->_userID, self->_responseCode, [(NSData *)self->_cert length]];
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(int64_t)a3
{
  self->_responseCode = a3;
}

- (NSData)cert
{
  return self->_cert;
}

- (void)setCert:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cert, 0);

  objc_storeStrong((id *)&self->_userID, 0);
}

@end