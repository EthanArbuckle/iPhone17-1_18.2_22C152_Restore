@interface HMMatterCommandAction(HFAdditions)
- (id)hf_affectedAccessoryProfiles;
- (uint64_t)hf_affectedCharacteristic;
@end

@implementation HMMatterCommandAction(HFAdditions)

- (uint64_t)hf_affectedCharacteristic
{
  return 0;
}

- (id)hf_affectedAccessoryProfiles
{
  if (qword_26AB2FB50 != -1) {
    dispatch_once(&qword_26AB2FB50, &__block_literal_global_43_3);
  }
  v0 = (void *)qword_26AB2FB58;
  return v0;
}

@end