@interface CNAPeopleSuggesterFacadeTestDouble
@end

@implementation CNAPeopleSuggesterFacadeTestDouble

uint64_t __73___CNAPeopleSuggesterFacadeTestDouble_makeContactWithDisplayName_handle___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F1BA20] labeledValueWithLabel:*MEMORY[0x1E4F1B6F8] value:a2];
}

id __73___CNAPeopleSuggesterFacadeTestDouble_makeContactWithDisplayName_handle___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = (void *)MEMORY[0x1E4F1BA20];
  uint64_t v3 = *MEMORY[0x1E4F1B6F8];
  v4 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:a2];
  v5 = [v2 labeledValueWithLabel:v3 value:v4];

  return v5;
}

@end