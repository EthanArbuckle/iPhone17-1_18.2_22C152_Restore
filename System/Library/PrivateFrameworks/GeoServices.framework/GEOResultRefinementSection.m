@interface GEOResultRefinementSection
- (GEOResultRefinementSection)initWithResultRefinementSection:(id)a3;
- (GEOResultRefinementSection)initWithSectionHeader:(id)a3 resultRefinements:(id)a4;
- (NSArray)resultRefinements;
- (NSString)sectionHeader;
- (id)convertToGEOPDResultRefinementSection;
- (int64_t)refinementsType;
- (void)setRefinementsType:(int64_t)a3;
- (void)setResultRefinements:(id)a3;
- (void)setSectionHeader:(id)a3;
@end

@implementation GEOResultRefinementSection

- (GEOResultRefinementSection)initWithSectionHeader:(id)a3 resultRefinements:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 count];
  v9 = [v7 firstObject];
  uint64_t v10 = [v9 type];

  if (v8)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          if (v10 != [*(id *)(*((void *)&v24 + 1) + 8 * v15) type])
          {

            goto LABEL_14;
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    v23.receiver = self;
    v23.super_class = (Class)GEOResultRefinementSection;
    v16 = [(GEOResultRefinementSection *)&v23 init];
    if (v16)
    {
      uint64_t v17 = [v6 copy];
      sectionHeader = v16->_sectionHeader;
      v16->_sectionHeader = (NSString *)v17;

      uint64_t v19 = [v11 copy];
      resultRefinements = v16->_resultRefinements;
      v16->_resultRefinements = (NSArray *)v19;

      v16->_refinementsType = v10;
    }
    self = v16;
    v21 = self;
  }
  else
  {
LABEL_14:
    v21 = 0;
  }

  return v21;
}

- (GEOResultRefinementSection)initWithResultRefinementSection:(id)a3
{
  v4 = (id *)a3;
  v5 = -[GEOPDResultRefinementSection resultRefinements](v4);
  id v6 = objc_msgSend(v5, "_geo_compactMap:", &__block_literal_global_111);

  id v7 = -[GEOPDResultRefinementSection sectionHeader](v4);

  uint64_t v8 = [(GEOResultRefinementSection *)self initWithSectionHeader:v7 resultRefinements:v6];
  return v8;
}

GEOResultRefinement *__62__GEOResultRefinementSection_initWithResultRefinementSection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEOResultRefinement alloc] initWithResultRefinement:v2];

  return v3;
}

- (id)convertToGEOPDResultRefinementSection
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(GEOPDResultRefinementSection);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(GEOResultRefinementSection *)self resultRefinements];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) convertToGEOPDResultRefinement];
        -[GEOPDResultRefinementSection addResultRefinement:]((uint64_t)v3, v9);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [(GEOResultRefinementSection *)self sectionHeader];
  -[GEOPDResultRefinementSection setSectionHeader:]((uint64_t)v3, v10);

  return v3;
}

- (NSString)sectionHeader
{
  return self->_sectionHeader;
}

- (void)setSectionHeader:(id)a3
{
}

- (NSArray)resultRefinements
{
  return self->_resultRefinements;
}

- (void)setResultRefinements:(id)a3
{
}

- (int64_t)refinementsType
{
  return self->_refinementsType;
}

- (void)setRefinementsType:(int64_t)a3
{
  self->_refinementsType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRefinements, 0);

  objc_storeStrong((id *)&self->_sectionHeader, 0);
}

@end