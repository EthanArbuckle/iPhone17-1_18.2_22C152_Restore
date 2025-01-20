@interface MPTitlePropertyForPidProperty
@end

@implementation MPTitlePropertyForPidProperty

void ___MPTitlePropertyForPidProperty_block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"albumPID";
  v2[1] = @"artistPID";
  v3[0] = @"albumTitle";
  v3[1] = @"artist";
  v2[2] = @"playlistPersistentID";
  v3[2] = @"name";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)_MPTitlePropertyForPidProperty___pidPropertyToAlbumMappings;
  _MPTitlePropertyForPidProperty___pidPropertyToAlbumMappings = v0;
}

@end