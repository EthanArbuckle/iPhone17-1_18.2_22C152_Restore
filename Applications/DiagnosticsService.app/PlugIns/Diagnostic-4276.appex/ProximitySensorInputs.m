@interface ProximitySensorInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSNumber)assetDownloadTimeout;
- (NSNumber)holdTime;
- (NSNumber)noInputTimeout;
- (NSString)downImageFileName;
- (NSString)upImageFileName;
- (void)setAssetDownloadTimeout:(id)a3;
- (void)setDownImageFileName:(id)a3;
- (void)setHoldTime:(id)a3;
- (void)setNoInputTimeout:(id)a3;
- (void)setUpImageFileName:(id)a3;
@end

@implementation ProximitySensorInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v11 = 0;
  id v4 = a3;
  v5 = [v4 dk_numberFromKey:@"noInputTimeout" lowerBound:&off_10000CCF0 upperBound:&off_10000CD00 defaultValue:0 failed:&v11];
  [(ProximitySensorInputs *)self setNoInputTimeout:v5];

  v6 = [v4 dk_numberFromKey:@"holdTime" lowerBound:&off_10000CCF0 upperBound:&off_10000CD10 defaultValue:&off_10000CD20 failed:&v11];
  [(ProximitySensorInputs *)self setHoldTime:v6];

  v7 = [v4 dk_stringFromKey:@"upImageFileName" maxLength:256 defaultValue:&stru_10000C760 failed:&v11];
  [(ProximitySensorInputs *)self setUpImageFileName:v7];

  v8 = [v4 dk_stringFromKey:@"downImageFileName" maxLength:256 defaultValue:&stru_10000C760 failed:&v11];
  [(ProximitySensorInputs *)self setDownImageFileName:v8];

  v9 = [v4 dk_numberFromKey:@"assetDownloadTimeout" lowerBound:&off_10000CD30 upperBound:&off_10000CD40 defaultValue:&off_10000CD50 failed:&v11];

  [(ProximitySensorInputs *)self setAssetDownloadTimeout:v9];
  return v11 == 0;
}

- (NSNumber)noInputTimeout
{
  return self->_noInputTimeout;
}

- (void)setNoInputTimeout:(id)a3
{
}

- (NSNumber)holdTime
{
  return self->_holdTime;
}

- (void)setHoldTime:(id)a3
{
}

- (NSString)upImageFileName
{
  return self->_upImageFileName;
}

- (void)setUpImageFileName:(id)a3
{
}

- (NSString)downImageFileName
{
  return self->_downImageFileName;
}

- (void)setDownImageFileName:(id)a3
{
}

- (NSNumber)assetDownloadTimeout
{
  return self->_assetDownloadTimeout;
}

- (void)setAssetDownloadTimeout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDownloadTimeout, 0);
  objc_storeStrong((id *)&self->_downImageFileName, 0);
  objc_storeStrong((id *)&self->_upImageFileName, 0);
  objc_storeStrong((id *)&self->_holdTime, 0);

  objc_storeStrong((id *)&self->_noInputTimeout, 0);
}

@end