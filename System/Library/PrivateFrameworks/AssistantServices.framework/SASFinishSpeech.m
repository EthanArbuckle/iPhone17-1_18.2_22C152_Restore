@interface SASFinishSpeech
- (void)ad_setAFEndpointMode:(int64_t)a3;
- (void)ad_setCSEndpointerMetrics:(id)a3;
- (void)af_logDiagnostics;
@end

@implementation SASFinishSpeech

- (void)af_logDiagnostics
{
  id v2 = +[AFDiagnostics sharedDiagnostics];
  [v2 logVoiceSendEnd];
}

- (void)ad_setCSEndpointerMetrics:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 featuresAtEndpoint];
    [(SASFinishSpeech *)self setFeaturesAtEndpoint:v5];

    v6 = [v4 asrFeatureLatencyDistribution];
    [(SASFinishSpeech *)self setServerFeatureLatencyDistribution:v6];

    [v4 totalAudioRecorded];
    double v8 = v7;

    [(SASFinishSpeech *)self setTotalAudioRecorded:v8];
  }
}

- (void)ad_setAFEndpointMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)*(&off_10050DAC0 + a3 - 1);
  }
  id v5 = v4;
  [(SASFinishSpeech *)self setEndpoint:v4];
}

@end