@interface AKAuthenticationSurrogateModel
- (AKAppleIDAuthenticationContext)pendingBGContext;
- (AKAppleIDAuthenticationContext)surrogateContext;
- (AKClient)surrogateClient;
- (BOOL)hasCheckedIn;
- (NSString)pendingClientBundle;
- (NSUUID)surrogateRegistrationID;
- (id)pendingClientUIWork;
- (id)surrogateCompletion;
- (void)setHasCheckedIn:(BOOL)a3;
- (void)setPendingBGContext:(id)a3;
- (void)setPendingClientBundle:(id)a3;
- (void)setPendingClientUIWork:(id)a3;
- (void)setSurrogateClient:(id)a3;
- (void)setSurrogateCompletion:(id)a3;
- (void)setSurrogateContext:(id)a3;
- (void)setSurrogateRegistrationID:(id)a3;
@end

@implementation AKAuthenticationSurrogateModel

- (AKAppleIDAuthenticationContext)surrogateContext
{
  return self->_surrogateContext;
}

- (void)setSurrogateContext:(id)a3
{
}

- (AKClient)surrogateClient
{
  return self->_surrogateClient;
}

- (void)setSurrogateClient:(id)a3
{
}

- (NSUUID)surrogateRegistrationID
{
  return self->_surrogateRegistrationID;
}

- (void)setSurrogateRegistrationID:(id)a3
{
}

- (AKAppleIDAuthenticationContext)pendingBGContext
{
  return self->_pendingBGContext;
}

- (void)setPendingBGContext:(id)a3
{
}

- (id)pendingClientUIWork
{
  return self->_pendingClientUIWork;
}

- (void)setPendingClientUIWork:(id)a3
{
}

- (NSString)pendingClientBundle
{
  return self->_pendingClientBundle;
}

- (void)setPendingClientBundle:(id)a3
{
}

- (BOOL)hasCheckedIn
{
  return self->_hasCheckedIn;
}

- (void)setHasCheckedIn:(BOOL)a3
{
  self->_hasCheckedIn = a3;
}

- (id)surrogateCompletion
{
  return self->_surrogateCompletion;
}

- (void)setSurrogateCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_surrogateCompletion, 0);
  objc_storeStrong((id *)&self->_pendingClientBundle, 0);
  objc_storeStrong(&self->_pendingClientUIWork, 0);
  objc_storeStrong((id *)&self->_pendingBGContext, 0);
  objc_storeStrong((id *)&self->_surrogateRegistrationID, 0);
  objc_storeStrong((id *)&self->_surrogateClient, 0);

  objc_storeStrong((id *)&self->_surrogateContext, 0);
}

@end