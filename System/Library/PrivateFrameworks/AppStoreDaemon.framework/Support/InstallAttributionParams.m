@interface InstallAttributionParams
@end

@implementation InstallAttributionParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_interactionType, 0);
  objc_storeStrong((id *)&self->_localTimestamp, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_attributionSignature, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_sourceDomain, 0);
  objc_storeStrong((id *)&self->_sourceAppAdamId, 0);
  objc_storeStrong((id *)&self->_webImpressionId, 0);
  objc_storeStrong((id *)&self->_impressionId, 0);
  objc_storeStrong((id *)&self->_adNetworkId, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end