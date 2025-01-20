@interface ML3TrackPropertiesFromMPMediaItemProperties
@end

@implementation ML3TrackPropertiesFromMPMediaItemProperties

void ___ML3TrackPropertiesFromMPMediaItemProperties_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [MEMORY[0x1E4F79B50] propertyForMPMediaEntityProperty:v5];
  if ([v7 length])
  {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
  else
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v5;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "[MPCloudController] Failed to find ML3 equivalent for property: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
}

@end