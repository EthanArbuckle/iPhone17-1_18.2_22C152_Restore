@interface CSTokenScope
@end

@implementation CSTokenScope

void __92___CSTokenScope_tokenScopesWithTitles_tokenTitles_scopeTypes_queryAttributesList_modifiers___block_invoke(id *a1, void *a2, unint64_t a3)
{
  CSGetLocalizedString(a2);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [a1[4] objectAtIndexedSubscript:a3];
  v6 = CSGetLocalizedString(v5);

  v7 = [a1[5] objectAtIndexedSubscript:a3];
  uint64_t v8 = [v7 integerValue];

  v9 = [[_CSTokenScope alloc] initWithTitle:v12 tokenTitle:v6 scopeType:v8];
  if ([a1[6] count] <= a3)
  {
    v10 = 0;
  }
  else
  {
    v10 = [a1[6] objectAtIndexedSubscript:a3];
  }
  v11 = [a1[7] objectAtIndexedSubscript:a3];
  [(_CSTokenScope *)v9 addQueryAttributes:v11 modifier:v10];

  [a1[8] addObject:v9];
}

@end