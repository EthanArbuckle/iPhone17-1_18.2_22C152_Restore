@interface HUCameraRecordingOptionsItem
- (HUCameraRecordingOptionsItem)initWithCameraProfiles:(id)a3;
- (NSSet)cameraProfiles;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUCameraRecordingOptionsItem

- (HUCameraRecordingOptionsItem)initWithCameraProfiles:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUCameraRecordingOptionsItem;
  v6 = [(HFStaticItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cameraProfiles, a3);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v4 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsCameraStreamingAndRecordingItemDisplayTitle", @"HUServiceDetailsCameraStreamingAndRecordingItemDisplayTitle", 1);
  id v5 = [(HUCameraRecordingOptionsItem *)self cameraProfiles];
  int v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_213);

  v7 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v8 = *MEMORY[0x1E4F68B10];
  v17[0] = *MEMORY[0x1E4F68AB8];
  v17[1] = v8;
  uint64_t v9 = MEMORY[0x1E4F1CC38];
  if (v6) {
    uint64_t v9 = MEMORY[0x1E4F1CC28];
  }
  v18[0] = v4;
  v18[1] = v9;
  v17[2] = *MEMORY[0x1E4F68908];
  v10 = [(HUCameraRecordingOptionsItem *)self cameraProfiles];
  v18[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  v12 = [v7 dictionaryWithDictionary:v11];

  v13 = (void *)MEMORY[0x1E4F7A0D8];
  v14 = [MEMORY[0x1E4F69228] outcomeWithResults:v12];
  v15 = [v13 futureWithResult:v14];

  return v15;
}

BOOL __60__HUCameraRecordingOptionsItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 userSettings];
  if ([v3 accessModeForPresenceType:3] == 2)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [v2 userSettings];
    BOOL v4 = [v5 accessModeForPresenceType:4] == 2;
  }
  return v4;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (void).cxx_destruct
{
}

@end