@interface HDInsertValuesToQuantitySampleSeriesOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDInsertValuesToQuantitySampleSeriesOperation)initWithCoder:(id)a3;
- (HDInsertValuesToQuantitySampleSeriesOperation)initWithSeries:(id)a3 values:(id)a4;
- (HKQuantitySample)series;
- (NSArray)values;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDInsertValuesToQuantitySampleSeriesOperation

- (HDInsertValuesToQuantitySampleSeriesOperation)initWithSeries:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDInsertValuesToQuantitySampleSeriesOperation;
  v8 = [(HDInsertValuesToQuantitySampleSeriesOperation *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    series = v8->_series;
    v8->_series = (HKQuantitySample *)v9;

    uint64_t v11 = [v7 copy];
    values = v8->_values;
    v8->_values = (NSArray *)v11;
  }
  return v8;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self->_series;
  if (!v11)
  {
    uint64_t v11 = +[HDDataEntity objectWithUUID:self->_legacySeriesIdentifier encodingOptions:MEMORY[0x1E4F1CC08] profile:v9 error:a5];
  }
  if (!self->_didAwakeFromJournal)
  {
    SEL v25 = a2;
    v15 = [v10 protectedDatabase];
    v16 = [(HKQuantitySample *)v11 UUID];
    v17 = HDDataEntityPredicateForDataUUID();
    id v26 = 0;
    v18 = +[HDDataEntity anyInDatabase:v15 predicate:v17 error:&v26];
    id v19 = v26;

    if (v18)
    {
      char v14 = [v18 insertValues:self->_values transaction:v10 error:a5];
LABEL_15:

      goto LABEL_16;
    }
    if (v19)
    {
      id v19 = v19;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = objc_opt_class();
      v22 = [(HKQuantitySample *)v11 UUID];
      v23 = objc_msgSend(v20, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v21, v25, @"Unable to find quantity series '%@' when inserting journaled series values."", v22);

      id v19 = v23;
      if (!v19)
      {
LABEL_14:
        char v14 = 0;
        goto LABEL_15;
      }
    }
    if (a5) {
      *a5 = v19;
    }
    else {
      _HKLogDroppedError();
    }

    goto LABEL_14;
  }
  v12 = [v9 dataManager];
  v13 = [v12 quantitySeriesManager];
  char v14 = [v13 insertValues:self->_values series:v11 error:a5];

LABEL_16:
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertValuesToQuantitySampleSeriesOperation)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDInsertValuesToQuantitySampleSeriesOperation;
  v5 = [(HDInsertValuesToQuantitySampleSeriesOperation *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"series"];
    series = v5->_series;
    v5->_series = (HKQuantitySample *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sid"];
    legacySeriesIdentifier = v5->_legacySeriesIdentifier;
    v5->_legacySeriesIdentifier = (NSUUID *)v8;

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"values"];
    values = v5->_values;
    v5->_values = (NSArray *)v13;

    v5->_didAwakeFromJournal = 1;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  legacySeriesIdentifier = self->_legacySeriesIdentifier;
  id v5 = a3;
  [v5 encodeObject:legacySeriesIdentifier forKey:@"sid"];
  [v5 encodeObject:self->_series forKey:@"series"];
  [v5 encodeObject:self->_values forKey:@"values"];
}

- (HKQuantitySample)series
{
  return self->_series;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_series, 0);

  objc_storeStrong((id *)&self->_legacySeriesIdentifier, 0);
}

@end