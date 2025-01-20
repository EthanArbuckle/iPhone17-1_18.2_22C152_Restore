@interface SGStructuredEventTrialClientWrapperGuardedData
@end

@implementation SGStructuredEventTrialClientWrapperGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_structuredEventOutputMapping, 0);
  objc_storeStrong((id *)&self->_structuredEventInputMapping, 0);
  objc_storeStrong((id *)&self->_engineConfig, 0);
  objc_storeStrong((id *)&self->_supportedProviders, 0);
}

@end