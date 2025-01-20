@interface AssetResult
@end

@implementation AssetResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsFields, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
}

@end