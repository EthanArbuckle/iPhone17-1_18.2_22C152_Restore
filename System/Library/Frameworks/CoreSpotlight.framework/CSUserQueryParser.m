@interface CSUserQueryParser
- (id)_CSQueryCreateQueryDictionaryWithOptionsDict:(id)a3 attribute:(id)a4 input:(id)a5 options:(unsigned int)a6;
- (void)_CSUserQueryCancelQueryWithReferenceDict:(id)a3;
- (void)_CSUserQueryCooldown;
- (void)_CSUserQueryPreheat;
- (void)_CSUserQueryPreheatWithOptionsDict:(id)a3;
@end

@implementation CSUserQueryParser

- (id)_CSQueryCreateQueryDictionaryWithOptionsDict:(id)a3 attribute:(id)a4 input:(id)a5 options:(unsigned int)a6
{
  if (a5)
  {
    QueryDictionaryWithOptionsDict = (void *)__MDQueryCreateQueryDictionaryWithOptionsDict();
  }
  else
  {
    QueryDictionaryWithOptionsDict = (void *)MEMORY[0x1E4F1CC08];
  }
  return QueryDictionaryWithOptionsDict;
}

- (void)_CSUserQueryCancelQueryWithReferenceDict:(id)a3
{
}

- (void)_CSUserQueryPreheatWithOptionsDict:(id)a3
{
}

- (void)_CSUserQueryPreheat
{
}

- (void)_CSUserQueryCooldown
{
}

@end