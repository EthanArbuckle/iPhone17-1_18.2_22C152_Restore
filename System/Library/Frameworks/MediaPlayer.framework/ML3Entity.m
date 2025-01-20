@interface ML3Entity
@end

@implementation ML3Entity

void __64__ML3Entity_MPMediaAdditions__propertyForMPMediaEntityProperty___block_invoke()
{
  v7[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F79350];
  v6[0] = @"persistentID";
  v6[1] = @"keepLocal";
  uint64_t v1 = *MEMORY[0x1E4F79330];
  v7[0] = v0;
  v7[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F79340];
  v6[2] = @"keepLocalStatus";
  v6[3] = @"keepLocalStatusReason";
  uint64_t v3 = *MEMORY[0x1E4F79348];
  v7[2] = v2;
  v7[3] = v3;
  v6[4] = @"keepLocalConstraints";
  v7[4] = *MEMORY[0x1E4F79338];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:5];
  v5 = (void *)propertyForMPMediaEntityProperty__ML3ForMP;
  propertyForMPMediaEntityProperty__ML3ForMP = v4;
}

void __73__ML3Entity_MPMediaAdditions__spotlightPropertyForMPMediaEntityProperty___block_invoke()
{
  void v7[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F79858];
  v6[0] = @"title";
  v6[1] = @"albumTitle";
  uint64_t v1 = *MEMORY[0x1E4F79840];
  v6[2] = @"albumArtist";
  v6[3] = @"artist";
  uint64_t v2 = *MEMORY[0x1E4F79848];
  v7[2] = v1;
  v7[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F79838];
  v6[4] = @"composer";
  void v6[5] = @"podcastTitle";
  v7[0] = v0;
  v7[1] = v3;
  v7[4] = *MEMORY[0x1E4F79850];
  v7[5] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:6];
  v5 = (void *)spotlightPropertyForMPMediaEntityProperty__ML3ForMP;
  spotlightPropertyForMPMediaEntityProperty__ML3ForMP = v4;
}

@end