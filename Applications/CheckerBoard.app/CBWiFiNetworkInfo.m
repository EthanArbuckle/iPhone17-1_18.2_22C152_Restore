@interface CBWiFiNetworkInfo
- (BOOL)isHidden;
- (CWFScanResult)scanResult;
- (NSString)password;
- (void)setIsHidden:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setScanResult:(id)a3;
@end

@implementation CBWiFiNetworkInfo

- (CWFScanResult)scanResult
{
  return self->_scanResult;
}

- (void)setScanResult:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);

  objc_storeStrong((id *)&self->_scanResult, 0);
}

@end