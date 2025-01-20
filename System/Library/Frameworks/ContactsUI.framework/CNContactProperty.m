@interface CNContactProperty
@end

@implementation CNContactProperty

void __55__CNContactProperty_UIAdditions__phoneticPropertiesMap__block_invoke()
{
  v8[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1AEF8];
  uint64_t v1 = *MEMORY[0x1E4F1AEA0];
  v7[0] = *MEMORY[0x1E4F1ADF0];
  v7[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1AF00];
  v8[0] = v0;
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AED8];
  v7[2] = *MEMORY[0x1E4F1ADE0];
  v7[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AF08];
  v8[2] = *MEMORY[0x1E4F1AEF0];
  v8[3] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
  v6 = (void *)phoneticPropertiesMap_properties;
  phoneticPropertiesMap_properties = v5;
}

@end