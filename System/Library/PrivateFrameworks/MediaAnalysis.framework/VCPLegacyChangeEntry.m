@interface VCPLegacyChangeEntry
- ($9FD032E033150E04C1ADDF5B9E7893F9)summaryTimeRange;
- (NSData)computeSyncPayload;
- (PHAsset)asset;
- (float)autoplayScore;
- (int)mediaAnalysisVersion;
- (signed)analysisStage;
- (void)publish;
- (void)setAnalysisStage:(signed __int16)a3;
- (void)setAsset:(id)a3;
- (void)setAutoplayScore:(float)a3;
- (void)setComputeSyncPayload:(id)a3;
- (void)setMediaAnalysisVersion:(int)a3;
- (void)setSummaryTimeRange:(id *)a3;
@end

@implementation VCPLegacyChangeEntry

- (void)publish
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v3, v4))
    {
      v5 = [(PHAsset *)self->_asset localIdentifier];
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "   [%@] Publishing PHAssetPropertySetMediaAnalysis", buf, 0xCu);
    }
  }
  v6 = +[MADStateHandler sharedStateHandler];
  v7 = [(PHAsset *)self->_asset localIdentifier];
  [v6 addBreadcrumb:@"[%@] Publishing PHAssetPropertySetMediaAnalysis", v7];

  v8 = +[PHAssetChangeRequest changeRequestForAsset:self->_asset];
  v9 = [(PHAsset *)self->_asset vcp_modificationDate];
  [v8 setMediaAnalysisTimeStamp:v9];

  [v8 setMediaAnalysisVersion:self->_mediaAnalysisVersion];
  [v8 setMediaAnalysisImageVersion:SLOWORD(self->_mediaAnalysisVersion)];
  long long v10 = *(_OWORD *)&self->_summaryTimeRange.start.epoch;
  v17[0] = *(_OWORD *)&self->_summaryTimeRange.start.value;
  v17[1] = v10;
  v17[2] = *(_OWORD *)&self->_summaryTimeRange.duration.timescale;
  [v8 setBestVideoTimeRange:v17];
  *(float *)&double v11 = self->_autoplayScore;
  [v8 setAutoplaySuggestionScore:v11];
  if ([(PHAsset *)self->_asset mad_isEligibleForComputeSync])
  {
    [v8 setLocalAnalysisStage:self->_analysisStage];
    [v8 setComputeSyncMediaAnalysisPayload:self->_computeSyncPayload];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v12 = VCPLogInstance();
      os_log_type_t v13 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v12, v13))
      {
        v14 = [(PHAsset *)self->_asset localIdentifier];
        int analysisStage = self->_analysisStage;
        unsigned int v16 = [(NSData *)self->_computeSyncPayload length];
        *(_DWORD *)buf = 138412802;
        v19 = v14;
        __int16 v20 = 1024;
        int v21 = analysisStage;
        __int16 v22 = 1024;
        unsigned int v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%@] publish analysis stage (%d) and compute sync payload (%d bytes)", buf, 0x18u);
      }
    }
  }
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- ($9FD032E033150E04C1ADDF5B9E7893F9)summaryTimeRange
{
  long long v3 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var0;
  return self;
}

- (void)setSummaryTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_summaryTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_summaryTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_summaryTimeRange.start.value = v3;
}

- (float)autoplayScore
{
  return self->_autoplayScore;
}

- (void)setAutoplayScore:(float)a3
{
  self->_autoplayScore = a3;
}

- (int)mediaAnalysisVersion
{
  return self->_mediaAnalysisVersion;
}

- (void)setMediaAnalysisVersion:(int)a3
{
  self->_mediaAnalysisVersion = a3;
}

- (signed)analysisStage
{
  return self->_analysisStage;
}

- (void)setAnalysisStage:(signed __int16)a3
{
  self->_int analysisStage = a3;
}

- (NSData)computeSyncPayload
{
  return self->_computeSyncPayload;
}

- (void)setComputeSyncPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeSyncPayload, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end