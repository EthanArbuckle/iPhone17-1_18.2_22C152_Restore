@interface ML3Collection
@end

@implementation ML3Collection

void __68__ML3Collection_MPMediaAdditions__propertyForMPMediaEntityProperty___block_invoke()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F790D8];
  v5[0] = @"albumCount";
  v5[1] = @"artistCount";
  uint64_t v1 = *MEMORY[0x1E4F790E0];
  v6[0] = v0;
  v6[1] = v1;
  v5[2] = @"itemCount";
  v5[3] = @"cloudStatus";
  uint64_t v2 = *MEMORY[0x1E4F790E8];
  v6[2] = *MEMORY[0x1E4F790F8];
  v6[3] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  v4 = (void *)propertyForMPMediaEntityProperty__ML3ForMP_4;
  propertyForMPMediaEntityProperty__ML3ForMP_4 = v3;
}

@end