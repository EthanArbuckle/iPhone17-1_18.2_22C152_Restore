@interface NSString
@end

@implementation NSString

uint64_t __67__NSString_BRPathAdditions__br_supportDirForPersona_dataSeparated___block_invoke()
{
  br_supportDirForPersona_dataSeparated__pathByPersonaID = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

uint64_t __55__NSString_BRPathAdditions__br_personaGroupDirForFPFS___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

uint64_t __69__NSString_BRPathAdditions___br_containerPathForDataSeparatedPersona__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

uint64_t __46__NSString_BRPathAdditions__br_currentHomeDir__block_invoke()
{
  br_currentHomeDir_pathByPersonaID = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end