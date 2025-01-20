@interface _ICLexiconUtilities
+ (BOOL)lexiconContainsEntry:(_LXLexicon *)a3 forString:(id)a4;
+ (_LXEntry)copyEntry:(_LXLexicon *)a3 forString:(id)a4;
+ (id)sortKeyEquivalents:(_LXLexicon *)a3 forString:(id)a4;
@end

@implementation _ICLexiconUtilities

+ (BOOL)lexiconContainsEntry:(_LXLexicon *)a3 forString:(id)a4
{
  id v4 = a4;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  LXLexiconEnumerateEntriesForString();
  char v5 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v5;
}

+ (id)sortKeyEquivalents:(_LXLexicon *)a3 forString:(id)a4
{
  id v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a4;
  id v7 = [v4 array];
  LXLexiconEnumerateEntriesForString();

  return v7;
}

+ (_LXEntry)copyEntry:(_LXLexicon *)a3 forString:(id)a4
{
  id v4 = a4;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  LXLexiconEnumerateEntriesForString();
  id v5 = (_LXEntry *)v8[3];
  _Block_object_dispose(&v7, 8);

  return v5;
}

@end