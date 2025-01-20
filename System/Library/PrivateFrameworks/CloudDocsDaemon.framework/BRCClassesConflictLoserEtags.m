@interface BRCClassesConflictLoserEtags
@end

@implementation BRCClassesConflictLoserEtags

void ___BRCClassesConflictLoserEtags_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);
  v4 = (void *)_BRCClassesConflictLoserEtags_allowedClasses;
  _BRCClassesConflictLoserEtags_allowedClasses = v3;
}

@end