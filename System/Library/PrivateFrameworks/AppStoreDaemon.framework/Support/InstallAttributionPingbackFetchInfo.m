@interface InstallAttributionPingbackFetchInfo
@end

@implementation InstallAttributionPingbackFetchInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryCount, 0);
  objc_storeStrong((id *)&self->_fetchPingbackURL, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end