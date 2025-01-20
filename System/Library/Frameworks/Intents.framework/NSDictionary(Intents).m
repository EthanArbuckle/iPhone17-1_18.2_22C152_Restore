@interface NSDictionary(Intents)
- (id)_intents_indexingRepresentation;
- (id)descriptionAtIndent:()Intents;
@end

@implementation NSDictionary(Intents)

- (id)_intents_indexingRepresentation
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__NSDictionary_Intents___intents_indexingRepresentation__block_invoke;
  v5[3] = &unk_1E5520E90;
  id v3 = v2;
  id v6 = v3;
  [a1 enumerateKeysAndObjectsUsingBlock:v5];

  return v3;
}

- (id)descriptionAtIndent:()Intents
{
  v5 = [MEMORY[0x1E4F28E78] stringWithString:@"\n"];
  if (a3)
  {
    uint64_t v6 = a3;
    do
    {
      [v5 appendString:@"    "];
      --v6;
    }
    while (v6);
  }
  v7 = [MEMORY[0x1E4F28E78] stringWithString:@"{"];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __45__NSDictionary_Intents__descriptionAtIndent___block_invoke;
  v16 = &unk_1E551BD38;
  id v8 = v7;
  id v17 = v8;
  v18 = v5;
  uint64_t v19 = a3;
  id v9 = v5;
  [a1 enumerateKeysAndObjectsUsingBlock:&v13];
  [v8 appendFormat:@"%@}", v9, v13, v14, v15, v16];
  v10 = v18;
  id v11 = v8;

  return v11;
}

@end