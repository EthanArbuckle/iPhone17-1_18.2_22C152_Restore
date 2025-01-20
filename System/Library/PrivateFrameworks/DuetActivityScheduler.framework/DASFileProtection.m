@interface DASFileProtection
@end

@implementation DASFileProtection

uint64_t __26___DASFileProtection_none__block_invoke()
{
  v0 = [_DASFileProtection alloc];
  none_fileCompletionNone = [(_DASFileProtection *)v0 initWithProtection:*MEMORY[0x1E4F28378]];

  return MEMORY[0x1F41817F8]();
}

uint64_t __30___DASFileProtection_complete__block_invoke()
{
  v0 = [_DASFileProtection alloc];
  complete_fileCompletionComplete = [(_DASFileProtection *)v0 initWithProtection:*MEMORY[0x1E4F28340]];

  return MEMORY[0x1F41817F8]();
}

uint64_t __40___DASFileProtection_completeUnlessOpen__block_invoke()
{
  v0 = [_DASFileProtection alloc];
  completeUnlessOpen_fileCompletionCompleteUnlessOpen = [(_DASFileProtection *)v0 initWithProtection:*MEMORY[0x1E4F28348]];

  return MEMORY[0x1F41817F8]();
}

uint64_t __58___DASFileProtection_completeUntilFirstUserAuthentication__block_invoke()
{
  v0 = [_DASFileProtection alloc];
  completeUntilFirstUserAuthentication_fileCompletionCompleteUntilFirstUserAuthentication = [(_DASFileProtection *)v0 initWithProtection:*MEMORY[0x1E4F28358]];

  return MEMORY[0x1F41817F8]();
}

@end