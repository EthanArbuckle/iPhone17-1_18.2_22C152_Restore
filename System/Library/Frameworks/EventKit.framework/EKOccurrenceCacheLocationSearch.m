@interface EKOccurrenceCacheLocationSearch
- (int)performSearchOperation:(unsigned int)a3 inCalendars:(id)a4 withEventStore:(id)a5 andSearchTerm:(id)a6;
@end

@implementation EKOccurrenceCacheLocationSearch

- (int)performSearchOperation:(unsigned int)a3 inCalendars:(id)a4 withEventStore:(id)a5 andSearchTerm:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 1007;
  v12 = [v10 connection];
  v13 = [v12 CADOperationProxySync];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __99__EKOccurrenceCacheLocationSearch_performSearchOperation_inCalendars_withEventStore_andSearchTerm___block_invoke;
  v15[3] = &unk_1E5B96D00;
  v15[4] = &v16;
  [v13 CADOccurrenceCacheSearchLocationsWithTerm:v11 inCalendars:v9 responseToken:v8 reply:v15];

  LODWORD(v8) = *((_DWORD *)v17 + 6);
  _Block_object_dispose(&v16, 8);

  return v8;
}

uint64_t __99__EKOccurrenceCacheLocationSearch_performSearchOperation_inCalendars_withEventStore_andSearchTerm___block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

@end