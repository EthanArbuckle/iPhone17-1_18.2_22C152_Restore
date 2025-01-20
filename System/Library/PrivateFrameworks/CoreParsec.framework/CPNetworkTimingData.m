@interface CPNetworkTimingData
@end

@implementation CPNetworkTimingData

void __64___CPNetworkTimingData_Dictionary__startMetricsForNormalization__block_invoke()
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"_kCFNTimingDataConnectStart";
  v2[1] = @"_kCFNTimingDataFetchStart";
  v2[2] = @"_kCFNTimingDataRedirectStart";
  v2[3] = @"_kCFNTimingDataRequestStart";
  v2[4] = @"_kCFNTimingDataDomainLookupStart";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];
  v1 = (void *)startMetricsForNormalization_startMetricNames;
  startMetricsForNormalization_startMetricNames = v0;
}

@end