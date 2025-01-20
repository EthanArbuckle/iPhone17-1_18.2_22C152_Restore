@interface ENExposureDetectionDaemonSessionResult
- (ENExposureClassification)exposureClassification;
- (ENExposureDetectionDaemonSessionStatistics)statistics;
- (ENExposureDetectionSummary)summary;
- (ENRegion)region;
- (NSData)differentialPrivacyBeaconCount;
- (NSData)differentialPrivacyRiskParameters;
- (int64_t)exposureClassificationStatus;
- (void)setDifferentialPrivacyBeaconCount:(id)a3;
- (void)setDifferentialPrivacyRiskParameters:(id)a3;
- (void)setExposureClassification:(id)a3;
- (void)setExposureClassificationStatus:(int64_t)a3;
- (void)setRegion:(id)a3;
- (void)setStatistics:(id)a3;
- (void)setSummary:(id)a3;
@end

@implementation ENExposureDetectionDaemonSessionResult

- (ENExposureDetectionDaemonSessionStatistics)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
}

- (ENExposureDetectionSummary)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (ENRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (NSData)differentialPrivacyRiskParameters
{
  return self->_differentialPrivacyRiskParameters;
}

- (void)setDifferentialPrivacyRiskParameters:(id)a3
{
}

- (NSData)differentialPrivacyBeaconCount
{
  return self->_differentialPrivacyBeaconCount;
}

- (void)setDifferentialPrivacyBeaconCount:(id)a3
{
}

- (ENExposureClassification)exposureClassification
{
  return self->_exposureClassification;
}

- (void)setExposureClassification:(id)a3
{
}

- (int64_t)exposureClassificationStatus
{
  return self->_exposureClassificationStatus;
}

- (void)setExposureClassificationStatus:(int64_t)a3
{
  self->_exposureClassificationStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposureClassification, 0);
  objc_storeStrong((id *)&self->_differentialPrivacyBeaconCount, 0);
  objc_storeStrong((id *)&self->_differentialPrivacyRiskParameters, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_summary, 0);

  objc_storeStrong((id *)&self->_statistics, 0);
}

@end