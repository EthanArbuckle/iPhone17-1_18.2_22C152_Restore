@interface VNPersonsModelFaceModelDataSummarization
+ (id)summarizationOfDataFromProvider:(id)a3;
- (NSIndexSet)faceObservationCountsDistribution;
- (VNPersonsModelFaceModelDataSummarization)initWithPersonsCount:(unint64_t)a3 faceObservationCountsDistribution:(id)a4 personFaceObservationsCountHistogram:(id)a5;
- (id)description;
- (unint64_t)numberOfPersonsWithFaceObservationsCount:(unint64_t)a3;
- (unint64_t)personsCount;
@end

@implementation VNPersonsModelFaceModelDataSummarization

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personFaceObservationsCountHistogram, 0);

  objc_storeStrong((id *)&self->_faceObservationCountsDistribution, 0);
}

- (NSIndexSet)faceObservationCountsDistribution
{
  return (NSIndexSet *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)personsCount
{
  return self->_personsCount;
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"Persons: %lu", -[VNPersonsModelFaceModelDataSummarization personsCount](self, "personsCount"));
  v4 = [(VNPersonsModelFaceModelDataSummarization *)self faceObservationCountsDistribution];
  if ([v4 count])
  {
    [v3 appendString:@" observation counts:"];
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    char v10 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__VNPersonsModelFaceModelDataSummarization_description__block_invoke;
    v6[3] = &unk_1E5B1FFA0;
    v6[4] = self;
    v8 = v9;
    id v7 = v3;
    [v4 enumerateIndexesWithOptions:2 usingBlock:v6];

    _Block_object_dispose(v9, 8);
  }

  return v3;
}

uint64_t __55__VNPersonsModelFaceModelDataSummarization_description__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) numberOfPersonsWithFaceObservationsCount:a2];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v5 + 24)) {
    [*(id *)(a1 + 40) appendString:@","];
  }
  else {
    *(unsigned char *)(v5 + 24) = 1;
  }
  return objc_msgSend(*(id *)(a1 + 40), "appendFormat:", @" %lu (%lu)", a2, v4);
}

- (unint64_t)numberOfPersonsWithFaceObservationsCount:(unint64_t)a3
{
  personFaceObservationsCountHistogram = self->_personFaceObservationsCountHistogram;
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  unint64_t v5 = [(NSCountedSet *)personFaceObservationsCountHistogram countForObject:v4];

  return v5;
}

- (VNPersonsModelFaceModelDataSummarization)initWithPersonsCount:(unint64_t)a3 faceObservationCountsDistribution:(id)a4 personFaceObservationsCountHistogram:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VNPersonsModelFaceModelDataSummarization;
  char v10 = [(VNPersonsModelFaceModelDataSummarization *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_personsCount = a3;
    uint64_t v12 = [v8 copy];
    faceObservationCountsDistribution = v11->_faceObservationCountsDistribution;
    v11->_faceObservationCountsDistribution = (NSIndexSet *)v12;

    uint64_t v14 = [v9 copy];
    personFaceObservationsCountHistogram = v11->_personFaceObservationsCountHistogram;
    v11->_personFaceObservationsCountHistogram = (NSCountedSet *)v14;
  }
  return v11;
}

+ (id)summarizationOfDataFromProvider:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 faceModelPersonsCount];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v8 = [v4 faceModelNumberOfFaceObservationsForPersonAtIndex:i];
      id v9 = [NSNumber numberWithUnsignedInteger:v8];
      [v6 addObject:v9];
    }
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(v10, "addIndex:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * j), "unsignedIntegerValue", (void)v18));
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  v16 = (void *)[objc_alloc((Class)a1) initWithPersonsCount:v5 faceObservationCountsDistribution:v10 personFaceObservationsCountHistogram:v11];

  return v16;
}

@end