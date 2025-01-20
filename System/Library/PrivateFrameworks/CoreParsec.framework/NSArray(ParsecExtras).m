@interface NSArray(ParsecExtras)
- (id)parsec_filterObjectsUsingBlock:()ParsecExtras;
- (id)parsec_mapAndFilterObjectsWithOptions:()ParsecExtras usingBlock:;
- (id)parsec_numberAtIndex:()ParsecExtras;
- (uint64_t)parsec_mapAndFilterObjectsUsingBlock:()ParsecExtras;
@end

@implementation NSArray(ParsecExtras)

- (uint64_t)parsec_mapAndFilterObjectsUsingBlock:()ParsecExtras
{
  return objc_msgSend(a1, "parsec_mapAndFilterObjectsWithOptions:usingBlock:", 0, a3);
}

- (id)parsec_mapAndFilterObjectsWithOptions:()ParsecExtras usingBlock:
{
  id v6 = a4;
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__NSArray_ParsecExtras__parsec_mapAndFilterObjectsWithOptions_usingBlock___block_invoke;
  v13[3] = &unk_1E5900A88;
  id v15 = v6;
  id v8 = v7;
  id v14 = v8;
  id v9 = v6;
  [a1 enumerateObjectsWithOptions:a3 usingBlock:v13];
  v10 = v14;
  id v11 = v8;

  return v11;
}

- (id)parsec_filterObjectsUsingBlock:()ParsecExtras
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__NSArray_ParsecExtras__parsec_filterObjectsUsingBlock___block_invoke;
  v9[3] = &unk_1E5900A60;
  id v10 = v4;
  id v5 = v4;
  id v6 = [a1 indexesOfObjectsPassingTest:v9];
  v7 = [a1 objectsAtIndexes:v6];

  return v7;
}

- (id)parsec_numberAtIndex:()ParsecExtras
{
  v1 = objc_msgSend(a1, "objectAtIndex:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

@end