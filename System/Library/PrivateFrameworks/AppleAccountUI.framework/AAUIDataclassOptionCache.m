@interface AAUIDataclassOptionCache
@end

@implementation AAUIDataclassOptionCache

uint64_t __48___AAUIDataclassOptionCache_filteredDataclasses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isEditable];
}

uint64_t __48___AAUIDataclassOptionCache_filteredDataclasses__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  id v6 = a2;
  v7 = [v4 bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:v6 value:&stru_26BD39CD8 table:@"Localizable"];

  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:v5 value:&stru_26BD39CD8 table:@"Localizable"];

  uint64_t v11 = [v8 localizedCaseInsensitiveCompare:v10];
  return v11;
}

@end