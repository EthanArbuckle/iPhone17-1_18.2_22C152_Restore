@interface CRKKeyValueTable
- (CRKKeyValueTable)initWithDictionary:(id)a3;
- (CRKKeyValueTable)initWithKeyValuePairs:(id)a3;
- (CRKTable)table;
- (NSArray)keyValuePairs;
- (id)crk_JSONRepresentationWithPrettyPrinting:(BOOL)a3 sortKeys:(BOOL)a4;
- (id)tableString;
@end

@implementation CRKKeyValueTable

- (CRKKeyValueTable)initWithKeyValuePairs:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKKeyValueTable;
  v5 = [(CRKKeyValueTable *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    keyValuePairs = v5->_keyValuePairs;
    v5->_keyValuePairs = (NSArray *)v6;
  }
  return v5;
}

- (CRKKeyValueTable)initWithDictionary:(id)a3
{
  id v4 = objc_msgSend(a3, "crk_mapUsingBlock:", &__block_literal_global_108);
  v5 = [[CRKKeyValueTable alloc] initWithKeyValuePairs:v4];

  return v5;
}

CRKKeyValuePair *__39__CRKKeyValueTable_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [[CRKKeyValuePair alloc] initWithKey:v5 value:v4];

  return v6;
}

- (id)crk_JSONRepresentationWithPrettyPrinting:(BOOL)a3 sortKeys:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v6 = [(CRKKeyValueTable *)self keyValuePairs];
  v7 = objc_msgSend(v6, "crk_dictionaryUsingKeyGenerator:valueGenerator:", &__block_literal_global_4_0, &__block_literal_global_7);

  v8 = objc_msgSend(v7, "crk_JSONRepresentationWithPrettyPrinting:sortKeys:", v5, v4);

  return v8;
}

uint64_t __70__CRKKeyValueTable_crk_JSONRepresentationWithPrettyPrinting_sortKeys___block_invoke(uint64_t a1, void *a2)
{
  return [a2 key];
}

uint64_t __70__CRKKeyValueTable_crk_JSONRepresentationWithPrettyPrinting_sortKeys___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (CRKTable)table
{
  table = self->_table;
  if (!table)
  {
    BOOL v4 = [(CRKKeyValueTable *)self keyValuePairs];
    BOOL v5 = +[CRKTable parsableTableWithKeyValuePairs:v4];
    uint64_t v6 = self->_table;
    self->_table = v5;

    table = self->_table;
  }

  return table;
}

- (id)tableString
{
  v2 = [(CRKKeyValueTable *)self table];
  v3 = [v2 stringValue];

  return v3;
}

- (NSArray)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValuePairs, 0);

  objc_storeStrong((id *)&self->_table, 0);
}

@end