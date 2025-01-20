@interface DNDSModeRepository
- (id)modeDetailsForIdentifiers:(id)a3;
@end

@implementation DNDSModeRepository

- (id)modeDetailsForIdentifiers:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    uint64_t v9 = *MEMORY[0x1E4F5F518];
    uint64_t v10 = *MEMORY[0x1E4F5F550];
    uint64_t v17 = *MEMORY[0x1E4FA5460];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v12 isEqualToString:v9])
        {
          uint64_t v13 = 1;
LABEL_12:
          v14 = [[DNDSModeDetails alloc] initWithInterruptionSuppression:v13];
          [v4 addObject:v14];

          continue;
        }
        if (([v12 isEqualToString:@"com.apple.donotdisturb.mode.driving"] & 1) != 0
          || ([v12 isEqualToString:v10] & 1) != 0
          || [v12 isEqualToString:v17])
        {
          uint64_t v13 = 2;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v15 = [v4 allObjects];

  return v15;
}

@end