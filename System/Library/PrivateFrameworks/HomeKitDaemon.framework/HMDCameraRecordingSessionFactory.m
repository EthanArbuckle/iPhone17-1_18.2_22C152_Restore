@interface HMDCameraRecordingSessionFactory
- (BOOL)isVideoInitData:(id)a3 combinableWithVideoInitData:(id)a4;
- (double)maximumClipDuration;
- (double)recordingExtensionDuration;
- (id)createSignificantEventManagerWithWorkQueue:(id)a3 faceClassificationResolver:(id)a4 logIdentifier:(id)a5;
- (id)createTimelapseFragmentManagerWithLogIdentifier:(id)a3;
- (id)createUploaderWithClipUUID:(id)a3 startDate:(id)a4 targetFragmentDuration:(double)a5 quality:(int64_t)a6 localZone:(id)a7 workQueue:(id)a8 logIdentifier:(id)a9;
- (id)createVideoAnalyzerWithConfiguration:(id)a3 identifier:(id)a4;
@end

@implementation HMDCameraRecordingSessionFactory

- (BOOL)isVideoInitData:(id)a3 combinableWithVideoInitData:(id)a4
{
  return [MEMORY[0x263F47D30] isInitializationSegment:a3 combinableWithInitializationSegment:a4];
}

- (id)createUploaderWithClipUUID:(id)a3 startDate:(id)a4 targetFragmentDuration:(double)a5 quality:(int64_t)a6 localZone:(id)a7 workQueue:(id)a8 logIdentifier:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a4;
  id v19 = a3;
  v20 = [[HMDCameraClipUploader alloc] initWithClipUUID:v19 startDate:v18 targetFragmentDuration:a6 quality:v17 localZone:v16 workQueue:v15 logIdentifier:a5];

  return v20;
}

- (id)createTimelapseFragmentManagerWithLogIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[HMDCameraRecordingSessionVariantFragmentManager alloc] initWithLogIdentifier:v3];

  return v4;
}

- (id)createSignificantEventManagerWithWorkQueue:(id)a3 faceClassificationResolver:(id)a4 logIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[HMDCameraRecordingSessionSignificantEventManager alloc] initWithWorkQueue:v9 faceClassificationResolver:v8 logIdentifier:v7];

  return v10;
}

- (id)createVideoAnalyzerWithConfiguration:(id)a3 identifier:(id)a4
{
  uint64_t v6 = 0;
  v4 = [MEMORY[0x263F47CE8] analyzerWithConfiguration:a3 identifier:a4 error:&v6];
  return v4;
}

- (double)recordingExtensionDuration
{
  v2 = [MEMORY[0x263F42608] sharedPreferences];
  id v3 = [v2 preferenceForKey:@"cameraRecordingExtensionDuration"];
  v4 = [v3 numberValue];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)maximumClipDuration
{
  +[HMDCameraClipManager maximumClipDuration];
  return result;
}

@end