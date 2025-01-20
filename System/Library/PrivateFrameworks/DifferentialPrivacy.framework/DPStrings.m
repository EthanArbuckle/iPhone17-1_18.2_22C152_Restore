@interface DPStrings
@end

@implementation DPStrings

void __35___DPStrings_databaseDirectoryPath__block_invoke()
{
  v0 = (void *)databaseDirectoryPath__DPDatabaseDirectoryPath;
  databaseDirectoryPath__DPDatabaseDirectoryPath = @"/var/mobile/Library/DifferentialPrivacy/";
}

void __34___DPStrings_reportsDirectoryPath__block_invoke(uint64_t a1)
{
  v1 = NSString;
  id v4 = [*(id *)(a1 + 32) databaseDirectoryPath];
  uint64_t v2 = [v1 stringWithFormat:@"%@%@", v4, @"Reports"];
  v3 = (void *)reportsDirectoryPath__DPReportsDirectoryPath;
  reportsDirectoryPath__DPReportsDirectoryPath = v2;
}

void __42___DPStrings_transparencyLogDirectoryPath__block_invoke()
{
  v0 = (void *)transparencyLogDirectoryPath__DPTransparencyLogDirectoryPath;
  transparencyLogDirectoryPath__DPTransparencyLogDirectoryPath = @"/var/mobile/Library/Logs/Dedisco";
}

void __33___DPStrings_tokensDirectoryPath__block_invoke()
{
  v0 = (void *)tokensDirectoryPath__DPDediscoTokensDirectoryPath;
  tokensDirectoryPath__DPDediscoTokensDirectoryPath = @"/var/mobile/Library/PPM/PAT/";
}

uint64_t __26___DPStrings_keyNamesPath__block_invoke()
{
  keyNamesPath__DPKeyNamesPlist = [NSString stringWithFormat:@"%@%@", @"/System/Library/DifferentialPrivacy/Configuration/", @"com.apple.dprivacyd.keynames.plist"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __31___DPStrings_keyPropertiesPath__block_invoke()
{
  keyPropertiesPath__DPKeyPropertiesPlist = [NSString stringWithFormat:@"%@%@", @"/System/Library/DifferentialPrivacy/Configuration/", @"com.apple.dprivacyd.keyproperties.plist"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __34___DPStrings_budgetPropertiesPath__block_invoke()
{
  budgetPropertiesPath__DPBudgetPropertiesPlist = [NSString stringWithFormat:@"%@%@", @"/System/Library/DifferentialPrivacy/Configuration/", @"com.apple.dprivacyd.budgetproperties.plist"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __37___DPStrings_algorithmParametersPath__block_invoke()
{
  algorithmParametersPath__DPAlgorithmParametersPlist = [NSString stringWithFormat:@"%@%@", @"/System/Library/DifferentialPrivacy/Configuration/", @"com.apple.dprivacyd.algorithmparameters.plist"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __37___DPStrings_namespaceParametersPath__block_invoke()
{
  namespaceParametersPath__DPNamespaceParametersPlist = [NSString stringWithFormat:@"%@%@", @"/System/Library/DifferentialPrivacy/Configuration/", @"com.apple.dprivacyd.namespaceparameters.plist"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __36___DPStrings_dataTypeParametersPath__block_invoke()
{
  dataTypeParametersPath__DPDataTypeParametersPlist = [NSString stringWithFormat:@"%@%@", @"/System/Library/DifferentialPrivacy/Configuration/", @"com.apple.dprivacyd.datatypeparameters.plist"];
  return MEMORY[0x1F41817F8]();
}

void __43___DPStrings_runtimeBlacklistDirectoryPath__block_invoke(uint64_t a1)
{
  v1 = NSString;
  id v4 = [*(id *)(a1 + 32) databaseDirectoryPath];
  uint64_t v2 = [v1 stringWithFormat:@"%@/%@", v4, @"Configuration/Blacklists/"];
  v3 = (void *)runtimeBlacklistDirectoryPath__DPBlacklistRuntimeDirectoryPath;
  runtimeBlacklistDirectoryPath__DPBlacklistRuntimeDirectoryPath = v2;
}

@end