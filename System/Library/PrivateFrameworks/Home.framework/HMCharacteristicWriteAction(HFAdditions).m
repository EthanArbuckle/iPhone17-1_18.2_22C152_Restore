@interface HMCharacteristicWriteAction(HFAdditions)
- (id)hf_affectedAccessoryProfiles;
- (id)hf_affectedAccessoryRepresentables;
@end

@implementation HMCharacteristicWriteAction(HFAdditions)

- (id)hf_affectedAccessoryProfiles
{
  if (qword_26AB2FB10 != -1) {
    dispatch_once(&qword_26AB2FB10, &__block_literal_global_27_10);
  }
  v0 = (void *)qword_26AB2FB18;
  return v0;
}

- (id)hf_affectedAccessoryRepresentables
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 characteristic];
  v3 = [v2 service];
  v4 = objc_msgSend(v1, "na_setWithSafeObject:", v3);

  return v4;
}

@end