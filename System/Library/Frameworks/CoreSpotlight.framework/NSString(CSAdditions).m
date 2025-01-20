@interface NSString(CSAdditions)
- (id)cs_escapedStringForSearchQuery;
- (uint64_t)cs_fuzzyPrefixMatchString:()CSAdditions locale:;
@end

@implementation NSString(CSAdditions)

- (id)cs_escapedStringForSearchQuery
{
  v1 = [a1 decomposedStringWithCanonicalMapping];
  v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v3 = [v1 stringByTrimmingCharactersInSet:v2];
  v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"\\", @"\\\\", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"\", @"\\\", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"'", @"\\'", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"*", @"\\*", 0, 0, objc_msgSend(v4, "length"));

  return v4;
}

- (uint64_t)cs_fuzzyPrefixMatchString:()CSAdditions locale:
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [a1 length];
  unint64_t v9 = [v6 length];
  v10 = [v7 languageCode];

  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    v12 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v11 = [v12 languageCode];
  }
  [a1 UTF8String];
  id v13 = v11;
  [v13 UTF8String];
  MDMatcherCreate();
  id v14 = v6;
  objc_msgSend(v14, "UTF8String", 0, 0);
  unsigned int v15 = MDMatchUTF8();
  MDMatcherDispose();
  if ((double)v8 * 300.0 / (double)v9 >= 70.0) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }

  return v16;
}

@end