@interface WFDictateTextLanguagePickerParameter
+ (id)availableLocaleIdentifiers;
- (id)defaultSerializedRepresentation;
@end

@implementation WFDictateTextLanguagePickerParameter

+ (id)availableLocaleIdentifiers
{
  v2 = [MEMORY[0x263F17BA0] supportedLocales];
  v3 = [v2 allObjects];
  v4 = objc_msgSend(v3, "if_map:", &__block_literal_global_189);

  return v4;
}

uint64_t __66__WFDictateTextLanguagePickerParameter_availableLocaleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 localeIdentifier];
}

- (id)defaultSerializedRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend(MEMORY[0x263EFF960], "preferredLanguages", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = (void *)[objc_alloc(MEMORY[0x263F86F00]) initWithValue:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        v9 = [(WFLocalePickerParameter *)self possibleStates];
        char v10 = [v9 containsObject:v8];

        if (v10)
        {
          v11 = [v8 serializedRepresentation];

          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

@end