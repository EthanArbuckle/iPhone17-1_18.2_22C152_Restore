@interface CalculateUnitsTrie
- (CalculateUnitsTrie)init;
- (CalculateUnitsTrie)initWithLocales:(id)a3;
- (CalculateUnitsTrieNode)root;
- (NSArray)locales;
- (NSSet)conversionVerbs;
- (Trie)trie;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)setConversionVerbs:(id)a3;
- (void)setLocales:(id)a3;
- (void)setTrie:(id)a3;
@end

@implementation CalculateUnitsTrie

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionVerbs, 0);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_trie, 0);
  objc_storeStrong((id *)&self->_root, 0);
}

- (void)setConversionVerbs:(id)a3
{
}

- (void)setLocales:(id)a3
{
}

- (NSArray)locales
{
  return self->_locales;
}

- (void)setTrie:(id)a3
{
}

- (Trie)trie
{
  return self->_trie;
}

- (CalculateUnitsTrieNode)root
{
  return self->_root;
}

- (NSSet)conversionVerbs
{
  conversionVerbs = self->_conversionVerbs;
  if (!conversionVerbs)
  {
    locales = self->_locales;
    if (locales)
    {
      v5 = locales;
    }
    else
    {
      v5 = +[Localize systemLocales];
    }
    v6 = v5;
    unint64_t v7 = [(NSArray *)v5 count];
    if (v7 >= 3) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = v7;
    }
    v9 = objc_opt_new();
    if (v8)
    {
      uint64_t v10 = 0;
      while (1)
      {
        v11 = [(NSArray *)v6 objectAtIndexedSubscript:v10];
        v12 = +[AvailableUnitRanks shared];
        uint64_t v13 = [v12 conversionVerbsWithLocale:v11 from:0];
        if (v13) {
          break;
        }
        v15 = +[AvailableUnitRanks shared];
        v14 = [v15 conversionVerbsWithLocale:v11 from:1];

        if (v14) {
          goto LABEL_13;
        }
LABEL_14:

        if (v8 == ++v10) {
          goto LABEL_15;
        }
      }
      v14 = (void *)v13;

LABEL_13:
      [v9 addObjectsFromArray:v14];

      goto LABEL_14;
    }
LABEL_15:
    v16 = (NSSet *)[v9 copy];
    v17 = self->_conversionVerbs;
    self->_conversionVerbs = v16;

    conversionVerbs = self->_conversionVerbs;
  }
  return conversionVerbs;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return [(CalculateUnitsTrieNode *)self->_root objectForKeyedSubscript:a3];
}

- (id)objectForKey:(id)a3
{
  return [(CalculateUnitsTrieNode *)self->_root objectForKey:a3];
}

- (CalculateUnitsTrie)initWithLocales:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CalculateUnitsTrie;
  v6 = [(CalculateUnitsTrie *)&v15 init];
  if (v6)
  {
    unint64_t v7 = +[AvailableUnitRanks shared];
    uint64_t v8 = [v7 ranksWithLocales:v5];
    trie = v6->_trie;
    v6->_trie = (Trie *)v8;

    uint64_t v10 = v6->_trie;
    if (v10) {
      id v11 = [(TrieNode *)v10->_root copy];
    }
    else {
      id v11 = 0;
    }
    uint64_t v12 = +[CalculateUnitsTrieNode nodeWithTrieNode:v11];
    root = v6->_root;
    v6->_root = (CalculateUnitsTrieNode *)v12;

    objc_storeStrong((id *)&v6->_locales, a3);
  }

  return v6;
}

- (CalculateUnitsTrie)init
{
  v11.receiver = self;
  v11.super_class = (Class)CalculateUnitsTrie;
  v2 = [(CalculateUnitsTrie *)&v11 init];
  if (v2)
  {
    v3 = +[AvailableUnitRanks shared];
    uint64_t v4 = [v3 ranks];
    trie = v2->_trie;
    v2->_trie = (Trie *)v4;

    v6 = v2->_trie;
    if (v6) {
      id v7 = [(TrieNode *)v6->_root copy];
    }
    else {
      id v7 = 0;
    }
    uint64_t v8 = +[CalculateUnitsTrieNode nodeWithTrieNode:v7];
    root = v2->_root;
    v2->_root = (CalculateUnitsTrieNode *)v8;
  }
  return v2;
}

@end