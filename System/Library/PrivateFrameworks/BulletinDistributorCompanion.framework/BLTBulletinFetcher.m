@interface BLTBulletinFetcher
+ (id)batchBulletinFetchForBulletinIDs:(id)a3 fetcher:(id)a4 completion:(id)a5;
- (BOOL)_incrementSection;
- (void)_fetchBulletins;
- (void)_setBulletinIDs:(id)a3;
- (void)_setClientCompletion:(id)a3;
- (void)_setFetcher:(id)a3;
@end

@implementation BLTBulletinFetcher

- (void)_setFetcher:(id)a3
{
  v4 = (void *)[a3 copy];
  id fetcher = self->_fetcher;
  self->_id fetcher = v4;
  MEMORY[0x270F9A758](v4, fetcher);
}

- (void)_setClientCompletion:(id)a3
{
  v4 = (void *)[a3 copy];
  id clientCompletion = self->_clientCompletion;
  self->_id clientCompletion = v4;
  MEMORY[0x270F9A758](v4, clientCompletion);
}

- (void)_setBulletinIDs:(id)a3
{
  objc_storeStrong((id *)&self->_bulletinIDs, a3);
  id v5 = a3;
  v6 = [(NSDictionary *)self->_bulletinIDs allKeys];
  sectionIDs = self->_sectionIDs;
  self->_sectionIDs = v6;

  self->_sectionIDsIndex = -1;
  [(BLTBulletinFetcher *)self _incrementSection];
}

- (BOOL)_incrementSection
{
  p_sectionIDs = &self->_sectionIDs;
  sectionIDs = self->_sectionIDs;
  unint64_t v5 = (unint64_t)&p_sectionIDs[1]->super.isa + 1;
  self->_sectionIDsIndex = v5;
  unint64_t v6 = [(NSArray *)sectionIDs count];
  if (v5 < v6)
  {
    bulletinIDs = self->_bulletinIDs;
    v8 = [(NSArray *)self->_sectionIDs objectAtIndexedSubscript:self->_sectionIDsIndex];
    v9 = [(NSDictionary *)bulletinIDs objectForKeyedSubscript:v8];
    publisherMatchIDsForSection = self->_publisherMatchIDsForSection;
    self->_publisherMatchIDsForSection = v9;

    self->_publisherMatchIDsForSectionIndex = 0;
  }
  return v5 < v6;
}

- (void)_fetchBulletins
{
  unint64_t publisherMatchIDsForSectionIndex = self->_publisherMatchIDsForSectionIndex;
  if (publisherMatchIDsForSectionIndex >= [(NSArray *)self->_publisherMatchIDsForSection count])
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __37__BLTBulletinFetcher__fetchBulletins__block_invoke_2;
    v13[3] = &unk_264683BD8;
    v13[4] = self;
    v4 = (void (**)(void))MEMORY[0x223CAC810](v13);
    unint64_t v7 = self->_publisherMatchIDsForSectionIndex;
    if (v7 >= [(NSArray *)self->_publisherMatchIDsForSection count])
    {
      v4[2](v4);
    }
    else
    {
      v8 = -[NSArray subarrayWithRange:](self->_publisherMatchIDsForSection, "subarrayWithRange:", self->_publisherMatchIDsForSectionIndex, [(NSArray *)self->_publisherMatchIDsForSection count] - self->_publisherMatchIDsForSectionIndex);
      id fetcher = (void (**)(id, void *, void *, void *))self->_fetcher;
      v10 = [(NSArray *)self->_sectionIDs objectAtIndexedSubscript:self->_sectionIDsIndex];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __37__BLTBulletinFetcher__fetchBulletins__block_invoke_3;
      v11[3] = &unk_264683CA0;
      v12 = v4;
      fetcher[2](fetcher, v8, v10, v11);
    }
  }
  else
  {
    -[NSArray subarrayWithRange:](self->_publisherMatchIDsForSection, "subarrayWithRange:", self->_publisherMatchIDsForSectionIndex, 1);
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    ++self->_publisherMatchIDsForSectionIndex;
    id v5 = self->_fetcher;
    unint64_t v6 = [(NSArray *)self->_sectionIDs objectAtIndexedSubscript:self->_sectionIDsIndex];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __37__BLTBulletinFetcher__fetchBulletins__block_invoke;
    v14[3] = &unk_264683BD8;
    v14[4] = self;
    (*((void (**)(id, void (**)(void), void *, void *))v5 + 2))(v5, v4, v6, v14);
  }
}

uint64_t __37__BLTBulletinFetcher__fetchBulletins__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchBulletins];
}

uint64_t __37__BLTBulletinFetcher__fetchBulletins__block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _incrementSection];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 _fetchBulletins];
  }
  else
  {
    uint64_t result = v3[6];
    if (result)
    {
      id v5 = *(uint64_t (**)(void))(result + 16);
      return v5();
    }
  }
  return result;
}

uint64_t __37__BLTBulletinFetcher__fetchBulletins__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)batchBulletinFetchForBulletinIDs:(id)a3 fetcher:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(BLTBulletinFetcher);
  [(BLTBulletinFetcher *)v10 _setFetcher:v8];

  [(BLTBulletinFetcher *)v10 _setClientCompletion:v7];
  [(BLTBulletinFetcher *)v10 _setBulletinIDs:v9];

  [(BLTBulletinFetcher *)v10 _fetchBulletins];
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetcher, 0);
  objc_storeStrong(&self->_clientCompletion, 0);
  objc_storeStrong((id *)&self->_publisherMatchIDsForSection, 0);
  objc_storeStrong((id *)&self->_sectionIDs, 0);
  objc_storeStrong((id *)&self->_bulletinIDs, 0);
}

@end