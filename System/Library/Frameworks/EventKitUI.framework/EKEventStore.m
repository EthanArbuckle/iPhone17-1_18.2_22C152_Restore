@interface EKEventStore
@end

@implementation EKEventStore

void __51__EKEventStore_MobileCal__colorNamesInRainbowOrder__block_invoke()
{
  v5[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4FB8308];
  v5[0] = *MEMORY[0x1E4FB8318];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4FB8300];
  v5[2] = *MEMORY[0x1E4FB8320];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4FB8310];
  v5[4] = *MEMORY[0x1E4FB82E8];
  v5[5] = v2;
  v5[6] = *MEMORY[0x1E4FB82F0];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:7];
  v4 = (void *)colorNamesInRainbowOrder___colorNames;
  colorNamesInRainbowOrder___colorNames = v3;
}

void __49__EKEventStore_MobileCal__symbolicNameToUIColors__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = (void *)symbolicNameToUIColors___symbolicColorMapping;
  symbolicNameToUIColors___symbolicColorMapping = (uint64_t)v2;

  v4 = EKSymbolicColorToRGBMapping();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__EKEventStore_MobileCal__symbolicNameToUIColors__block_invoke_2;
  v5[3] = &unk_1E6087EE0;
  v5[4] = *(void *)(a1 + 32);
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __49__EKEventStore_MobileCal__symbolicNameToUIColors__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 _uicolorFromString:a3];
  [(id)symbolicNameToUIColors___symbolicColorMapping setObject:v6 forKeyedSubscript:v5];
}

void __62__EKEventStore_MobileCal__defaultCalendarColorsInRainbowOrder__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = (void *)defaultCalendarColorsInRainbowOrder___orderedUIColors;
  defaultCalendarColorsInRainbowOrder___orderedUIColors = (uint64_t)v2;

  v4 = [*(id *)(a1 + 32) symbolicNameToUIColors];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "colorNamesInRainbowOrder", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)defaultCalendarColorsInRainbowOrder___orderedUIColors;
        v11 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * v9)];
        [v10 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

void __63__EKEventStore_MobileCal__localizedStringForSymbolicColorName___block_invoke()
{
  v11[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = EventKitUIBundle();
  v10[0] = *MEMORY[0x1E4FB8318];
  uint64_t v1 = [v0 localizedStringForKey:@"Red" value:&stru_1F0CC2140 table:0];
  v11[0] = v1;
  v10[1] = *MEMORY[0x1E4FB8308];
  id v2 = [v0 localizedStringForKey:@"Orange" value:&stru_1F0CC2140 table:0];
  v11[1] = v2;
  v10[2] = *MEMORY[0x1E4FB8320];
  uint64_t v3 = [v0 localizedStringForKey:@"Yellow" value:&stru_1F0CC2140 table:0];
  v11[2] = v3;
  v10[3] = *MEMORY[0x1E4FB8300];
  v4 = [v0 localizedStringForKey:@"Green" value:&stru_1F0CC2140 table:0];
  v11[3] = v4;
  v10[4] = *MEMORY[0x1E4FB82E8];
  id v5 = [v0 localizedStringForKey:@"Blue" value:&stru_1F0CC2140 table:0];
  v11[4] = v5;
  v10[5] = *MEMORY[0x1E4FB8310];
  uint64_t v6 = [v0 localizedStringForKey:@"Purple" value:&stru_1F0CC2140 table:0];
  v11[5] = v6;
  v10[6] = *MEMORY[0x1E4FB82F0];
  uint64_t v7 = [v0 localizedStringForKey:@"Brown" value:&stru_1F0CC2140 table:0];
  v11[6] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:7];
  uint64_t v9 = (void *)localizedStringForSymbolicColorName____localizedStringMapping;
  localizedStringForSymbolicColorName____localizedStringMapping = v8;
}

void __48__EKEventStore_MobileCal__symbolicNameForColor___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isEqual:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

@end