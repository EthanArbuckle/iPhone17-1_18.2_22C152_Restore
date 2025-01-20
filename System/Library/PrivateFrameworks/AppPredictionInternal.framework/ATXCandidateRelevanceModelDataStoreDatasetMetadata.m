@interface ATXCandidateRelevanceModelDataStoreDatasetMetadata
+ (id)datasetMetadataForDataPoints:(id)a3;
- (ATXCandidateRelevanceModelDataStoreDatasetMetadata)initWithNumberOfPositiveSamples:(unint64_t)a3 numberOfSamples:(unint64_t)a4 numberOfDaysWithPositiveSamples:(unint64_t)a5 numberOfDaysWithSamples:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXCandidateRelevanceModelDataStoreDatasetMetadata:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)numberOfDaysWithPositiveSamples;
- (unint64_t)numberOfDaysWithSamples;
- (unint64_t)numberOfPositiveSamples;
- (unint64_t)numberOfSamples;
@end

@implementation ATXCandidateRelevanceModelDataStoreDatasetMetadata

- (ATXCandidateRelevanceModelDataStoreDatasetMetadata)initWithNumberOfPositiveSamples:(unint64_t)a3 numberOfSamples:(unint64_t)a4 numberOfDaysWithPositiveSamples:(unint64_t)a5 numberOfDaysWithSamples:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8
{
  id v15 = a7;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)ATXCandidateRelevanceModelDataStoreDatasetMetadata;
  v17 = [(ATXCandidateRelevanceModelDataStoreDatasetMetadata *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_numberOfPositiveSamples = a3;
    v17->_numberOfSamples = a4;
    v17->_numberOfDaysWithPositiveSamples = a5;
    v17->_numberOfDaysWithSamples = a6;
    objc_storeStrong((id *)&v17->_startDate, a7);
    objc_storeStrong((id *)&v18->_endDate, a8);
  }

  return v18;
}

+ (id)datasetMetadataForDataPoints:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "observeDataPoint:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [v4 currentMetadata];

  return v10;
}

- (id)description
{
  id v3 = objc_opt_new();
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v4 setDateStyle:4];
  [v4 setTimeStyle:4];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
  [v4 setLocale:v5];

  uint64_t v6 = [v4 stringFromDate:self->_startDate];
  [v3 appendFormat:@"Dataset Start Date: %@\n", v6];

  uint64_t v7 = [v4 stringFromDate:self->_endDate];
  [v3 appendFormat:@"Dataset End Date: %@\n", v7];

  objc_msgSend(v3, "appendFormat:", @"Dataset Number of Positive Samples: %lu\n", self->_numberOfPositiveSamples);
  objc_msgSend(v3, "appendFormat:", @"Dataset Number of Samples: %lu\n", self->_numberOfSamples);
  objc_msgSend(v3, "appendFormat:", @"Dataset Number of Days with Positive Samples: %lu\n", self->_numberOfDaysWithPositiveSamples);
  objc_msgSend(v3, "appendFormat:", @"Dataset Number of Days with Samples: %lu", self->_numberOfDaysWithSamples);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXCandidateRelevanceModelDataStoreDatasetMetadata *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXCandidateRelevanceModelDataStoreDatasetMetadata *)self isEqualToATXCandidateRelevanceModelDataStoreDatasetMetadata:v5];

  return v6;
}

- (BOOL)isEqualToATXCandidateRelevanceModelDataStoreDatasetMetadata:(id)a3
{
  id v4 = (char *)a3;
  id v5 = v4;
  if (*(_OWORD *)&self->_numberOfPositiveSamples != *(_OWORD *)(v4 + 8)
    || self->_numberOfDaysWithPositiveSamples != *((void *)v4 + 3)
    || self->_numberOfDaysWithSamples != *((void *)v4 + 4))
  {
    goto LABEL_6;
  }
  startDate = self->_startDate;
  uint64_t v7 = (NSDate *)*((id *)v4 + 5);
  if (startDate == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    v9 = startDate;
    char v10 = [(NSDate *)v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
LABEL_6:
      char v11 = 0;
      goto LABEL_7;
    }
  }
  long long v13 = self->_endDate;
  long long v14 = v13;
  if (v13 == (NSDate *)v5[6]) {
    char v11 = 1;
  }
  else {
    char v11 = -[NSDate isEqual:](v13, "isEqual:");
  }

LABEL_7:
  return v11;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXCandidateRelevanceModelDataStoreDatasetMetadata numberOfPositiveSamples](self, "numberOfPositiveSamples"));
  BOOL v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfPositiveSamples"));
  int64_t v7 = [v5 compare:v6];

  if (!v7)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXCandidateRelevanceModelDataStoreDatasetMetadata numberOfDaysWithPositiveSamples](self, "numberOfDaysWithPositiveSamples"));
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfDaysWithPositiveSamples"));
    int64_t v7 = [v8 compare:v9];
  }
  return v7;
}

- (unint64_t)numberOfPositiveSamples
{
  return self->_numberOfPositiveSamples;
}

- (unint64_t)numberOfSamples
{
  return self->_numberOfSamples;
}

- (unint64_t)numberOfDaysWithPositiveSamples
{
  return self->_numberOfDaysWithPositiveSamples;
}

- (unint64_t)numberOfDaysWithSamples
{
  return self->_numberOfDaysWithSamples;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end