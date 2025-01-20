@interface DKNotableUserData
- (BOOL)findMyEnabled;
- (DKNotableUserDataWallet)walletData;
- (NSArray)accounts;
- (NSArray)cellularPlans;
- (int64_t)dataSize;
- (void)setAccounts:(id)a3;
- (void)setCellularPlans:(id)a3;
- (void)setDataSize:(int64_t)a3;
- (void)setFindMyEnabled:(BOOL)a3;
- (void)setWalletData:(id)a3;
@end

@implementation DKNotableUserData

- (int64_t)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(int64_t)a3
{
  self->_dataSize = a3;
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (BOOL)findMyEnabled
{
  return self->_findMyEnabled;
}

- (void)setFindMyEnabled:(BOOL)a3
{
  self->_findMyEnabled = a3;
}

- (DKNotableUserDataWallet)walletData
{
  return self->_walletData;
}

- (void)setWalletData:(id)a3
{
}

- (NSArray)cellularPlans
{
  return self->_cellularPlans;
}

- (void)setCellularPlans:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularPlans, 0);
  objc_storeStrong((id *)&self->_walletData, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
}

@end