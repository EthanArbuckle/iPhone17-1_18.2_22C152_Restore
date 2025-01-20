@interface BGSystemTaskRequest
- (void)updateWithPrediction:(id)a3;
@end

@implementation BGSystemTaskRequest

- (void)updateWithPrediction:(id)a3
{
  uint64_t v4 = CPLSyncSessionPredictionTypeUploadResourceSize;
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:v4];
  -[BGSystemTaskRequest setNetworkUploadSize:](self, "setNetworkUploadSize:", (uint64_t)(float)((float)(uint64_t)[v6 longLongValue] * 1.3));

  id v7 = [v5 objectForKeyedSubscript:CPLSyncSessionPredictionTypeDownloadResourceSize];

  -[BGSystemTaskRequest setNetworkDownloadSize:](self, "setNetworkDownloadSize:", [v7 longLongValue]);
}

@end