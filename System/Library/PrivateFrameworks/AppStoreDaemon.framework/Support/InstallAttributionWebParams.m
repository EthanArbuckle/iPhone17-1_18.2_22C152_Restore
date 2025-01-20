@interface InstallAttributionWebParams
@end

@implementation InstallAttributionWebParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_sourceWebRegistrableDomain, 0);
  objc_storeStrong((id *)&self->_impressionId, 0);
  objc_storeStrong((id *)&self->_adNetworkRegistrableDomain, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end