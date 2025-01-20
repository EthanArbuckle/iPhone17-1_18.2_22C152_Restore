@interface ML3Genre
@end

@implementation ML3Genre

void __63__ML3Genre_MPMediaAdditions__propertyForMPMediaEntityProperty___block_invoke()
{
  v7[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F79350];
  v6[0] = @"genrePersistentID";
  v6[1] = @"genreName";
  uint64_t v1 = *MEMORY[0x1E4F79360];
  v7[0] = v0;
  v7[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F790F0];
  v6[2] = @"genreRepresentativeItemPersistentID";
  v6[3] = @"genreCloudStatus";
  uint64_t v3 = *MEMORY[0x1E4F790E8];
  v7[2] = v2;
  v7[3] = v3;
  v6[4] = @"genreStoreID";
  v7[4] = *MEMORY[0x1E4F79368];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:5];
  v5 = (void *)propertyForMPMediaEntityProperty__ML3ForMP_28;
  propertyForMPMediaEntityProperty__ML3ForMP_28 = v4;
}

@end