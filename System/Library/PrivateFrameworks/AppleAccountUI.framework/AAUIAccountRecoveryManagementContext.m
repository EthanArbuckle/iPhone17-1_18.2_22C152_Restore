@interface AAUIAccountRecoveryManagementContext
- (BOOL)icloudDataRecoveryShouldShowRow;
- (BOOL)recoveryKeyEligible;
- (BOOL)recoveryKeyIsOn;
- (NSString)icloudDataRecoveryDetailsHTTPMethod;
- (NSString)icloudDataRecoveryReAddHTTPMethod;
- (NSString)icloudDataRecoveryRowLabel;
- (NSString)recoveryKeyHTTPMethod;
- (NSURL)icloudDataRecoveryDetailsURL;
- (NSURL)icloudDataRecoveryReAddURL;
- (NSURL)learnMoreURL;
- (NSURL)recoveryKeyURL;
- (id)description;
- (void)setIcloudDataRecoveryDetailsHTTPMethod:(id)a3;
- (void)setIcloudDataRecoveryDetailsURL:(id)a3;
- (void)setIcloudDataRecoveryReAddHTTPMethod:(id)a3;
- (void)setIcloudDataRecoveryReAddURL:(id)a3;
- (void)setIcloudDataRecoveryRowLabel:(id)a3;
- (void)setIcloudDataRecoveryShouldShowRow:(BOOL)a3;
- (void)setLearnMoreURL:(id)a3;
- (void)setRecoveryKeyEligible:(BOOL)a3;
- (void)setRecoveryKeyHTTPMethod:(id)a3;
- (void)setRecoveryKeyIsOn:(BOOL)a3;
- (void)setRecoveryKeyURL:(id)a3;
@end

@implementation AAUIAccountRecoveryManagementContext

- (id)description
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL recoveryKeyEligible = self->_recoveryKeyEligible;
  v13[0] = @"recoveryKeyEligible";
  v13[1] = @"recoveryKeyIsOn";
  v3 = @"YES";
  if (recoveryKeyEligible) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  if (self->_recoveryKeyIsOn) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  v14[0] = v4;
  v14[1] = v5;
  v13[2] = @"recoveryKeyURL";
  v13[3] = @"recoveryKeyHTTPMethod";
  recoveryKeyHTTPMethod = self->_recoveryKeyHTTPMethod;
  v14[2] = self->_recoveryKeyURL;
  v14[3] = recoveryKeyHTTPMethod;
  if (!self->_icloudDataRecoveryShouldShowRow) {
    v3 = @"NO";
  }
  v13[4] = @"icloudDataRecoveryShouldShowRow";
  v13[5] = @"icloudDataRecoveryDetailsURL";
  icloudDataRecoveryDetailsURL = self->_icloudDataRecoveryDetailsURL;
  icloudDataRecoveryDetailsHTTPMethod = self->_icloudDataRecoveryDetailsHTTPMethod;
  v14[4] = v3;
  v14[5] = icloudDataRecoveryDetailsURL;
  v13[6] = @"icloudDataRecoveryDetailsHTTPMethod";
  v13[7] = @"icloudDataRecoveryReAddURL";
  icloudDataRecoveryReAddURL = self->_icloudDataRecoveryReAddURL;
  v14[6] = icloudDataRecoveryDetailsHTTPMethod;
  v14[7] = icloudDataRecoveryReAddURL;
  long long v15 = *(_OWORD *)&self->_icloudDataRecoveryReAddHTTPMethod;
  v13[8] = @"icloudDataRecoveryReAddHTTPMethod";
  v13[9] = @"icloudDataRecoveryRowLabel";
  v13[10] = @"learnMoreURL";
  learnMoreURL = self->_learnMoreURL;
  v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:11];
  v11 = [v10 description];

  return v11;
}

- (BOOL)recoveryKeyEligible
{
  return self->_recoveryKeyEligible;
}

- (void)setRecoveryKeyEligible:(BOOL)a3
{
  self->_BOOL recoveryKeyEligible = a3;
}

- (BOOL)recoveryKeyIsOn
{
  return self->_recoveryKeyIsOn;
}

- (void)setRecoveryKeyIsOn:(BOOL)a3
{
  self->_recoveryKeyIsOn = a3;
}

- (NSURL)recoveryKeyURL
{
  return self->_recoveryKeyURL;
}

- (void)setRecoveryKeyURL:(id)a3
{
}

- (NSString)recoveryKeyHTTPMethod
{
  return self->_recoveryKeyHTTPMethod;
}

- (void)setRecoveryKeyHTTPMethod:(id)a3
{
}

- (BOOL)icloudDataRecoveryShouldShowRow
{
  return self->_icloudDataRecoveryShouldShowRow;
}

- (void)setIcloudDataRecoveryShouldShowRow:(BOOL)a3
{
  self->_icloudDataRecoveryShouldShowRow = a3;
}

- (NSURL)icloudDataRecoveryDetailsURL
{
  return self->_icloudDataRecoveryDetailsURL;
}

- (void)setIcloudDataRecoveryDetailsURL:(id)a3
{
}

- (NSString)icloudDataRecoveryDetailsHTTPMethod
{
  return self->_icloudDataRecoveryDetailsHTTPMethod;
}

- (void)setIcloudDataRecoveryDetailsHTTPMethod:(id)a3
{
}

- (NSURL)icloudDataRecoveryReAddURL
{
  return self->_icloudDataRecoveryReAddURL;
}

- (void)setIcloudDataRecoveryReAddURL:(id)a3
{
}

- (NSString)icloudDataRecoveryReAddHTTPMethod
{
  return self->_icloudDataRecoveryReAddHTTPMethod;
}

- (void)setIcloudDataRecoveryReAddHTTPMethod:(id)a3
{
}

- (NSString)icloudDataRecoveryRowLabel
{
  return self->_icloudDataRecoveryRowLabel;
}

- (void)setIcloudDataRecoveryRowLabel:(id)a3
{
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (void)setLearnMoreURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_icloudDataRecoveryRowLabel, 0);
  objc_storeStrong((id *)&self->_icloudDataRecoveryReAddHTTPMethod, 0);
  objc_storeStrong((id *)&self->_icloudDataRecoveryReAddURL, 0);
  objc_storeStrong((id *)&self->_icloudDataRecoveryDetailsHTTPMethod, 0);
  objc_storeStrong((id *)&self->_icloudDataRecoveryDetailsURL, 0);
  objc_storeStrong((id *)&self->_recoveryKeyHTTPMethod, 0);
  objc_storeStrong((id *)&self->_recoveryKeyURL, 0);
}

@end