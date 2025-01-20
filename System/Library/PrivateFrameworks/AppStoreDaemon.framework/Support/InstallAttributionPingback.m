@interface InstallAttributionPingback
@end

@implementation InstallAttributionPingback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_maturityTimestamp, 0);
  objc_storeStrong((id *)&self->_localTimestamp, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_retryTimestamp, 0);
  objc_storeStrong((id *)&self->_pingbackUrl, 0);
  objc_storeStrong((id *)&self->_conversionValueTimestamp, 0);
  objc_storeStrong((id *)&self->_coarseConversionValue, 0);
  objc_storeStrong((id *)&self->_sourceDomain, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceAppAdamId, 0);
  objc_storeStrong((id *)&self->_attributionSignature, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_adNetworkId, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end