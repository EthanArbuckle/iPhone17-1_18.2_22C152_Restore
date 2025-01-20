@interface ML3Artist
@end

@implementation ML3Artist

void __64__ML3Artist_MPMediaAdditions__propertyForMPMediaEntityProperty___block_invoke()
{
  v9[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F79350];
  v8[0] = @"artistPersistentID";
  v8[1] = @"artistName";
  uint64_t v1 = *MEMORY[0x1E4F79090];
  v9[0] = v0;
  v9[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F79098];
  v8[2] = @"artistSortName";
  v8[3] = @"artistRepresentativeItemPersistentID";
  uint64_t v3 = *MEMORY[0x1E4F790F0];
  v9[2] = v2;
  v9[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F790E8];
  v8[4] = @"artistCloudStatus";
  v8[5] = @"artistStoreID";
  uint64_t v5 = *MEMORY[0x1E4F790A8];
  v9[4] = v4;
  v9[5] = v5;
  v8[6] = @"artistCanonicalID";
  v9[6] = *MEMORY[0x1E4F790A0];
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:7];
  v7 = (void *)propertyForMPMediaEntityProperty__ML3ForMP_13;
  propertyForMPMediaEntityProperty__ML3ForMP_13 = v6;
}

@end