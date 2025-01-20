@interface DNDContact
@end

@implementation DNDContact

void __35__DNDContact_Contacts__keysToFetch__block_invoke()
{
  v6[8] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1ADC8];
  v6[0] = *MEMORY[0x1E4F1AE08];
  v6[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1ADF0];
  v6[2] = *MEMORY[0x1E4F1AEE0];
  v6[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1ADE0];
  v6[4] = *MEMORY[0x1E4F1AEA0];
  v6[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AED8];
  v6[6] = *MEMORY[0x1E4F1AEC0];
  v6[7] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:8];
  v5 = (void *)keysToFetch_keys;
  keysToFetch_keys = v4;
}

@end