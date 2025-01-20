@interface NSString(_DPTArguments)
- (id)dp_bitVectorsFromCSVString;
- (id)dp_dictionaryFromJsonString;
- (id)dp_floatVectorsFromCSVString;
- (id)dp_numbersFromCSVString;
- (id)dp_numbersVectorsFromCSVString;
- (id)dp_stringsFromCSVString;
- (id)dp_wordRecordsFromCSVString;
@end

@implementation NSString(_DPTArguments)

- (id)dp_stringsFromCSVString
{
  v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@","];
  v3 = [a1 componentsSeparatedByCharactersInSet:v2];

  return v3;
}

- (id)dp_numbersFromCSVString
{
  v1 = objc_msgSend(a1, "dp_stringsFromCSVString");
  v2 = objc_opt_new();
  [v2 setNumberStyle:1];
  v3 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__NSString__DPTArguments__dp_numbersFromCSVString__block_invoke;
  v9[3] = &unk_1E6C44610;
  id v10 = v2;
  id v4 = v3;
  id v11 = v4;
  id v5 = v2;
  [v1 enumerateObjectsUsingBlock:v9];
  v6 = v11;
  id v7 = v4;

  return v7;
}

- (id)dp_numbersVectorsFromCSVString
{
  v2 = objc_opt_new();
  [v2 setNumberStyle:1];
  v3 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@";"];
  id v4 = [a1 componentsSeparatedByCharactersInSet:v3];

  id v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__NSString__DPTArguments__dp_numbersVectorsFromCSVString__block_invoke;
  v11[3] = &unk_1E6C44610;
  id v12 = v2;
  id v6 = v5;
  id v13 = v6;
  id v7 = v2;
  [v4 enumerateObjectsUsingBlock:v11];
  v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)dp_bitVectorsFromCSVString
{
  v1 = objc_msgSend(a1, "dp_stringsFromCSVString");
  v2 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__NSString__DPTArguments__dp_bitVectorsFromCSVString__block_invoke;
  v5[3] = &unk_1E6C44638;
  id v3 = v2;
  id v6 = v3;
  [v1 enumerateObjectsUsingBlock:v5];

  return v3;
}

- (id)dp_floatVectorsFromCSVString
{
  v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@";"];
  id v3 = [a1 componentsSeparatedByCharactersInSet:v2];

  id v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__NSString__DPTArguments__dp_floatVectorsFromCSVString__block_invoke;
  v7[3] = &unk_1E6C44638;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateObjectsUsingBlock:v7];

  return v5;
}

- (id)dp_wordRecordsFromCSVString
{
  v1 = objc_msgSend(a1, "dp_stringsFromCSVString");
  v2 = objc_opt_new();
  [v2 setNumberStyle:1];
  id v3 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@":"];
  id v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__NSString__DPTArguments__dp_wordRecordsFromCSVString__block_invoke;
  v11[3] = &unk_1E6C44660;
  id v12 = v3;
  id v13 = v2;
  id v5 = v4;
  id v14 = v5;
  id v6 = v2;
  id v7 = v3;
  [v1 enumerateObjectsUsingBlock:v11];
  id v8 = v14;
  id v9 = v5;

  return v9;
}

- (id)dp_dictionaryFromJsonString
{
  v1 = [a1 stringByReplacingOccurrencesOfString:@"\\{" withString:@"{"];
  v2 = [v1 stringByReplacingOccurrencesOfString:@"\\}" withString:@"}"];

  id v3 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  id v4 = [v2 componentsSeparatedByCharactersInSet:v3];
  id v5 = [v4 componentsJoinedByString:@" "];

  id v6 = [v5 dataUsingEncoding:4];
  uint64_t v9 = 0;
  id v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:16 error:&v9];

  return v7;
}

@end