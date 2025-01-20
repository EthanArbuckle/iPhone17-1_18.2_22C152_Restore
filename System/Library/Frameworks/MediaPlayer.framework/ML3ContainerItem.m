@interface ML3ContainerItem
@end

@implementation ML3ContainerItem

void __71__ML3ContainerItem_MPMediaAdditions__propertyForMPMediaEntityProperty___block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F79130];
  v4[0] = @"entryUniversalIdentifier";
  v4[1] = @"entryPositionUniversalIdentifier";
  uint64_t v1 = *MEMORY[0x1E4F79128];
  v5[0] = v0;
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)propertyForMPMediaEntityProperty__ML3ForMP_38;
  propertyForMPMediaEntityProperty__ML3ForMP_38 = v2;
}

@end