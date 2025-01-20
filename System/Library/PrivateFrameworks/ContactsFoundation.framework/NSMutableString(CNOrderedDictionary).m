@interface NSMutableString(CNOrderedDictionary)
- (uint64_t)_cn_replaceStrings:()CNOrderedDictionary;
@end

@implementation NSMutableString(CNOrderedDictionary)

- (uint64_t)_cn_replaceStrings:()CNOrderedDictionary
{
  id v4 = a3;
  v5 = [v4 allKeys];
  v6 = +[CNStringRangeFinder rangesOfStrings:v5 inString:a1];

  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __59__NSMutableString_CNOrderedDictionary___cn_replaceStrings___block_invoke;
  v13 = &unk_1E56A1020;
  uint64_t v14 = a1;
  id v15 = v4;
  id v7 = v4;
  [v6 enumerateObjectsWithOptions:2 usingBlock:&v10];
  uint64_t v8 = objc_msgSend(v6, "count", v10, v11, v12, v13, v14);

  return v8;
}

@end