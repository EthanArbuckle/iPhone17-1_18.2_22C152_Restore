@interface EDSearchableIndexSubjectTester
- (BOOL)verifySearchableItem:(id)a3 matchesDataSample:(id)a4;
- (NSArray)fetchAttributes;
- (id)expressionFromDataSamples:(id)a3;
- (id)transformDataForVerification:(id)a3;
@end

@implementation EDSearchableIndexSubjectTester

- (id)transformDataForVerification:(id)a3
{
  id v3 = a3;
  v4 = [v3 subject];
  if (![v4 length] || (v5 = v3, objc_msgSend(v4, "containsString:", @"\x00x01")))
  {

    v5 = 0;
  }

  return v5;
}

- (id)expressionFromDataSamples:(id)a3
{
  id v3 = [a3 allValues];
  v4 = objc_msgSend(v3, "ef_map:", &__block_literal_global_76);

  v5 = [MEMORY[0x1E4F60468] queryStringByJoiningQueries:v4 withOperand:2];
  v6 = [MEMORY[0x1E4F60470] expressionWithQueryString:v5];

  return v6;
}

id __60__EDSearchableIndexSubjectTester_expressionFromDataSamples___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 subject];
  id v3 = NSString;
  v4 = objc_msgSend(v2, "em_stringForQuotingWithCharacter:", 39);
  v5 = [v3 stringWithFormat:@"%@ = '%@'", *MEMORY[0x1E4F235C0], v4];

  return v5;
}

- (NSArray)fetchAttributes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F235C0];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (BOOL)verifySearchableItem:(id)a3 matchesDataSample:(id)a4
{
  id v5 = a4;
  v6 = [a3 attributeSet];
  v7 = [v6 subject];

  uint64_t v8 = [v5 subject];
  v9 = (void *)v8;
  BOOL v10 = 0;
  if (v7 && v8) {
    BOOL v10 = [v7 compare:v8] == 0;
  }

  return v10;
}

@end