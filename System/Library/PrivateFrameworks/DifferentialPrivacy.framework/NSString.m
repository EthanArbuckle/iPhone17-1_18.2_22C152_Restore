@interface NSString
@end

@implementation NSString

uint64_t __50__NSString__DPTArguments__dp_numbersFromCSVString__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) numberFromString:a2];
  if (v3) {
    [*(id *)(a1 + 40) addObject:v3];
  }
  return MEMORY[0x1F41817F8]();
}

void __57__NSString__DPTArguments__dp_numbersVectorsFromCSVString__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@","];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v5, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(a1 + 32) numberFromString:*(void *)(*((void *)&v12 + 1) + 8 * v10)];
        if (v11) {
          [v4 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [*(id *)(a1 + 40) addObject:v4];
}

uint64_t __53__NSString__DPTArguments__dp_bitVectorsFromCSVString__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "dp_binaryBytesData");
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  return MEMORY[0x1F41817F8]();
}

uint64_t __55__NSString__DPTArguments__dp_floatVectorsFromCSVString__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "dp_floatVectorBytesData");
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  return MEMORY[0x1F41817F8]();
}

void __54__NSString__DPTArguments__dp_wordRecordsFromCSVString__block_invoke(uint64_t a1, void *a2)
{
  id v10 = [a2 componentsSeparatedByCharactersInSet:*(void *)(a1 + 32)];
  BOOL v3 = [v10 count] == 2;
  v4 = v10;
  if (v3)
  {
    v5 = *(void **)(a1 + 40);
    v6 = [v10 objectAtIndexedSubscript:0];
    uint64_t v7 = [v5 numberFromString:v6];

    uint64_t v8 = [v10 objectAtIndexedSubscript:1];
    uint64_t v9 = +[_DPWordRecord word:v8 atPosition:v7];
    if (v9) {
      [*(id *)(a1 + 48) addObject:v9];
    }

    v4 = v10;
  }
}

@end