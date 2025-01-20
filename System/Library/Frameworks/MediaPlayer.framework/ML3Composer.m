@interface ML3Composer
@end

@implementation ML3Composer

void __66__ML3Composer_MPMediaAdditions__propertyForMPMediaEntityProperty___block_invoke()
{
  v8[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F79350];
  v7[0] = @"composerPersistentID";
  v7[1] = @"composerName";
  uint64_t v1 = *MEMORY[0x1E4F79100];
  v8[0] = v0;
  v8[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F79108];
  v7[2] = @"composerSortName";
  v7[3] = @"composerRepresentativeItemPersistentID";
  uint64_t v3 = *MEMORY[0x1E4F790F0];
  v8[2] = v2;
  v8[3] = v3;
  v7[4] = @"composerCloudStatus";
  v7[5] = @"composerStoreID";
  uint64_t v4 = *MEMORY[0x1E4F79110];
  v8[4] = *MEMORY[0x1E4F790E8];
  v8[5] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v6 = (void *)propertyForMPMediaEntityProperty__ML3ForMP_23;
  propertyForMPMediaEntityProperty__ML3ForMP_23 = v5;
}

@end