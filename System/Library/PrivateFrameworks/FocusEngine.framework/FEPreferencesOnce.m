@interface FEPreferencesOnce
@end

@implementation FEPreferencesOnce

void ___FEPreferencesOnce_block_invoke()
{
  _FEUserDefaults();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 dictionaryRepresentation];
  v1 = (void *)qword_269A11C50;
  qword_269A11C50 = v0;
}

@end