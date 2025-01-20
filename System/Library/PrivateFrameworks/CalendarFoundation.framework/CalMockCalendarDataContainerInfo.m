@interface CalMockCalendarDataContainerInfo
- (BOOL)usesDataSeparatedContainer;
- (NSString)accountID;
- (NSString)personaID;
- (NSURL)containerURL;
- (void)setAccountID:(id)a3;
- (void)setContainerURL:(id)a3;
- (void)setPersonaID:(id)a3;
- (void)setUsesDataSeparatedContainer:(BOOL)a3;
@end

@implementation CalMockCalendarDataContainerInfo

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (void)setContainerURL:(id)a3
{
}

- (BOOL)usesDataSeparatedContainer
{
  return self->_usesDataSeparatedContainer;
}

- (void)setUsesDataSeparatedContainer:(BOOL)a3
{
  self->_usesDataSeparatedContainer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_personaID, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

@end