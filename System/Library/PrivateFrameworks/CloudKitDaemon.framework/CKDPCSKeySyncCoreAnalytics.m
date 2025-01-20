@interface CKDPCSKeySyncCoreAnalytics
- (NSError)error;
- (NSNumber)KRSReturnedExistingIdentity;
- (NSNumber)isManatee;
- (NSNumber)keySyncDurationSec;
- (NSNumber)shouldThrottle;
- (NSNumber)throttledDurationSec;
- (NSString)bundleID;
- (NSString)context;
- (NSString)keySyncResult;
- (NSString)overallResult;
- (NSString)serviceName;
- (void)setBundleID:(id)a3;
- (void)setContext:(id)a3;
- (void)setError:(id)a3;
- (void)setIsManatee:(id)a3;
- (void)setKRSReturnedExistingIdentity:(id)a3;
- (void)setKeySyncDurationSec:(id)a3;
- (void)setKeySyncResult:(id)a3;
- (void)setOverallResult:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setShouldThrottle:(id)a3;
- (void)setThrottledDurationSec:(id)a3;
@end

@implementation CKDPCSKeySyncCoreAnalytics

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSNumber)shouldThrottle
{
  return self->_shouldThrottle;
}

- (void)setShouldThrottle:(id)a3
{
}

- (NSNumber)isManatee
{
  return self->_isManatee;
}

- (void)setIsManatee:(id)a3
{
}

- (NSString)keySyncResult
{
  return self->_keySyncResult;
}

- (void)setKeySyncResult:(id)a3
{
}

- (NSString)overallResult
{
  return self->_overallResult;
}

- (void)setOverallResult:(id)a3
{
}

- (NSNumber)keySyncDurationSec
{
  return self->_keySyncDurationSec;
}

- (void)setKeySyncDurationSec:(id)a3
{
}

- (NSNumber)throttledDurationSec
{
  return self->_throttledDurationSec;
}

- (void)setThrottledDurationSec:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)KRSReturnedExistingIdentity
{
  return self->_KRSReturnedExistingIdentity;
}

- (void)setKRSReturnedExistingIdentity:(id)a3
{
  self->_KRSReturnedExistingIdentity = (NSNumber *)a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_throttledDurationSec, 0);
  objc_storeStrong((id *)&self->_keySyncDurationSec, 0);
  objc_storeStrong((id *)&self->_overallResult, 0);
  objc_storeStrong((id *)&self->_keySyncResult, 0);
  objc_storeStrong((id *)&self->_isManatee, 0);
  objc_storeStrong((id *)&self->_shouldThrottle, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end