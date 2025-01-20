@interface HMShortcutAction(HFAdditions)
- (id)hf_affectedAccessoryProfiles;
- (id)hf_affectedAccessoryRepresentables;
- (uint64_t)hf_affectedCharacteristic;
@end

@implementation HMShortcutAction(HFAdditions)

- (uint64_t)hf_affectedCharacteristic
{
  return 0;
}

- (id)hf_affectedAccessoryProfiles
{
  if (qword_26AB2FB30 != -1) {
    dispatch_once(&qword_26AB2FB30, &__block_literal_global_35_2);
  }
  v0 = (void *)qword_26AB2FB38;
  return v0;
}

- (id)hf_affectedAccessoryRepresentables
{
  if (qword_26AB2FB40 != -1) {
    dispatch_once(&qword_26AB2FB40, &__block_literal_global_39_3);
  }
  v0 = (void *)qword_26AB2FB48;
  return v0;
}

@end